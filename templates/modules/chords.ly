\version "2.24.4"
\language "english"

% half-diminished (ementaler styling)
% for use for ementaler font module
% half_dim_v_align = #1.25
% half_dim_font_size = #-3

ChordsList = {
  <c e g b fs'> - \markup {
    \char ##x2206 \smaller { \super { \super \sharp 11 }  }
  } % c maj7 #11
  <c e g b d fs> - \markup {
    \char ##x2206 \smaller { \super { 9 \super \sharp 11 }  }
  } % c maj9 #11
  <c' e' g' a' d''> - \markup { \tiny " " \super 6 / \tiny "9 " } % c 6/9
  <c' ef' g' a' d''> - \markup { min\super 6 / \tiny 9 } % c min 6/9
  <c d e g> - \markup { \super "add 2" } % c add 2
  <c e f g> - \markup { \super "add 4" } % c add 4
  <c d ef g> - \markup { min\super "add 2" } % c min add 2
  <c ef f g> - \markup { min\super "add 4" } % c min add 4
  <c ef gf b> - \markup { \fontsize #2 \char ##x00B0  \char ##x2206  } % c dim maj7
  <c ef gf bf> - \markup { \raise #half_dim_v_align \fontsize #half_dim_font_size \char ##x00F8 }
  <c e gs bf> - \markup { +\super7 } % c+7
  <c e g bf d' a'> - \markup { \super13 } % c13
  <c f bf> - \markup {  \super { 7 sus } } % c7sus
  <c f bf df> -  \markup { \super { 7 sus \small \raise #0.4 \flat 9 } } % c7susb9
}
AllChords = #(append (sequential-music-to-chord-exceptions ChordsList #t) ignatzekExceptions)

#(define Bass_changes_equal_root_engraver
   (lambda (ctx)
     "For sequential @code{ChordNames} with same root, but different bass, the root
markup is dropped: D D/C D/B  -> D /C /B
The behaviour may be controlled by setting the @code{chordChanges}
context-property."
     (let ((chord-pitches '())
           (last-chord-pitches '())
           (bass-pitch #f))
       (make-engraver
        ((initialize this-engraver)
         (let ((chord-note-namer (ly:context-property ctx 'chordNoteNamer)))
           ;; Set 'chordNoteNamer, respect user setting if already done
           (ly:context-set-property! ctx 'chordNoteNamer
                                     (if (procedure? chord-note-namer)
                                         chord-note-namer
                                         note-name->markup))))
        (listeners
         ((note-event this-engraver event)
          (let* ((pitch (ly:event-property event 'pitch))
                 (pitch-name (ly:pitch-notename pitch))
                 (pitch-alt (ly:pitch-alteration pitch))
                 (bass (ly:event-property event 'bass #f))
                 (inversion (ly:event-property event 'inversion #f)))
            ;; Collect notes of the chord
            ;;  - to compare inversed chords we need to collect the bass note
            ;;    as usual member of the chord, whereas an added bass must be
            ;;    treated separate from the usual chord-notes
            ;;  - notes are stored as pairs containing their
            ;;    pitch-name (an integer), i.e. disregarding their octave and
            ;;    their alteration
            (cond (bass (set! bass-pitch pitch))
                  (inversion
                   (set! bass-pitch pitch)
                   (set! chord-pitches
                         (cons (cons pitch-name pitch-alt) chord-pitches)))
                  (else
                   (set! chord-pitches
                         (cons (cons pitch-name pitch-alt) chord-pitches)))))))
        (acknowledgers
         ((chord-name-interface this-engraver grob source-engraver)
          (let ((chord-changes (ly:context-property ctx 'chordChanges #f)))
            ;; If subsequent chords are equal apart from their bass,
            ;; reset the 'text-property.
            ;; Equality is done by comparing the sorted lists of this chord's
            ;; elements and the previous chord. Sorting is needed because
            ;; inverted chords may have a different order of pitches.
            ;; `chord-changes' needs to be true
            (if (and bass-pitch
                     chord-changes
                     (equal?
                      (sort chord-pitches car<)
                      (sort last-chord-pitches car<)))
                (ly:grob-set-property! grob 'text
                                       (make-line-markup
                                        (list
                                         (ly:context-property ctx 'slashChordSeparator)
                                         ((ly:context-property ctx 'chordNoteNamer)
                                          bass-pitch
                                          (ly:context-property ctx 'chordNameLowercaseMinor))))))
            (set! last-chord-pitches chord-pitches)
            (set! chord-pitches '())
            (set! bass-pitch #f))))
        ((finalize this-engraver)
         (set! last-chord-pitches '()))))))

\layout {
  \context {
    \ChordNames
    chordNameExceptions = #AllChords
    minorChordModifier = \markup { min }
  }
}

leadSheetChords = #(define-music-function
                    (harmony)
                    (ly:music?)
                    #{
                      \new ChordNames
                      \with { \consists #Bass_changes_equal_root_engraver }
                      {
                        \set chordChanges = ##t
                        $harmony
                      }
                    #})
