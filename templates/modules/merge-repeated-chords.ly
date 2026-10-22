\version "2.26.0"
\language "english"

% MIDI only: join back-to-back identical chords into one held chord, so a
% chord isn't re-struck where the print hides it with chordChanges
% (e.g. across endings once repeats are unfolded)
%
% Use on the MIDI score, after \unfoldRepeats:
%   \mergeRepeatedChords \unfoldRepeats \music
mergeRepeatedChords =
#(define-music-function (music) (ly:music?)
   ;; the ending played on pass i of n
   (define (pick-ending endings i n)
     (or (find (lambda (e) (memv i (ly:music-property e 'volta-numbers '())))
               endings)
         (list-ref endings
                   (max 0 (min (1- (length endings))
                               (- i 1 (- n (length endings))))))))
   ;; list the music's leaves in playing order; i is the pass (of n)
   ;; through the innermost enclosing repeat
   (define (flatten m i n)
     (cond
      ;; \unfoldRepeats leaves repeats with endings as one block; spell it out
      ((music-is-of-type? m 'unfolded-repeated-music)
       (let ((count (ly:music-property m 'repeat-count))
             (body (ly:music-property m 'element)))
         (append-map
          (lambda (pass)
            (if (ly:music? body)
                (flatten (ly:music-deep-copy body) pass count)
                '()))
          (iota count 1))))
      ((eq? (ly:music-property m 'name) 'SequentialAlternativeMusic)
       (flatten (pick-ending (ly:music-property m 'elements) i n) i n))
      ;; \volta 1 { ... } only plays on the passes it names
      ((let ((nums (ly:music-property m 'volta-numbers '())))
         (and (pair? nums) (not (memv i nums))))
       '())
      ((music-is-of-type? m 'sequential-music)
       (append-map (lambda (e) (flatten e i n)) (ly:music-property m 'elements)))
      ;; unwrap \chordmode, \volta etc., but keep \set in its context
      ((and (music-is-of-type? m 'music-wrapper-music)
            (not (music-is-of-type? m 'context-specification)))
       (flatten (ly:music-property m 'element) i n))
      (else (list m))))
   (define (chord-pitches m)
     (and (music-is-of-type? m 'event-chord)
          (let ((ps (filter-map (lambda (e) (ly:music-property e 'pitch #f))
                                (ly:music-property m 'elements))))
            (and (pair? ps) (sort ps ly:pitch<?)))))
   (define (set-length! chord len)
     (let ((dur (make-duration-of-length len)))
       (for-each (lambda (e)
                   (if (ly:duration? (ly:music-property e 'duration #f))
                       (ly:music-set-property! e 'duration dur)))
                 (ly:music-property chord 'elements))))
   (define (merge items)
     ;; zero-length items (\set, \fine, ...) don't break a held chord
     ;; (they're kept in `pending` and placed after the held chord)
     (let loop ((items items) (held #f) (len ZERO-MOMENT) (pending '()) (out '()))
       (define (flush)
         (if held
             (begin (set-length! held len) (append pending (cons held out)))
             out))
       (cond
        ((null? items) (reverse (flush)))
        (else
         (let* ((m (car items)) (ps (chord-pitches m)))
           (cond
            ((and held ps (equal? ps (chord-pitches held)))
             (loop (cdr items) held (ly:moment-add len (ly:music-length m)) pending out))
            (ps (loop (cdr items) m (ly:music-length m) '() (flush)))
            ((and held (equal? (ly:music-length m) ZERO-MOMENT))
             (loop (cdr items) held len (cons m pending) out))
            (else (loop (cdr items) #f ZERO-MOMENT '() (cons m (flush))))))))))
   (music-map
    (lambda (m)
      (if (and (music-is-of-type? m 'context-specification)
               (eq? (ly:music-property m 'context-type) 'ChordNames))
          (ly:music-set-property!
           m 'element
           (make-sequential-music (merge (flatten (ly:music-property m 'element) 1 1)))))
      m)
    music))
