\version "2.24.4"
\language "english"

slashNotation = #(define-music-function
                  (i)
                  (number?)
                  #{
                    \improvisationOn
                    \omit Stem
                    \repeat unfold $i \absolute b'4
                    \improvisationOff
                    \undo \omit Stem
                  #})

sectionBox = #(define-music-function
               (text)
               (string?)
               #{
                 \sectionLabel \markup \box $text
               #})

startPedalSpan = #(define-music-function
                   (text)
                   (markup?)
                   #{
                     \override TextSpanner.dash-fraction = #1
                     \override TextSpanner.bound-details.left.text
                     = \markup {
                       \small $text
                     }
                     \startTextSpan
                   #})

startParenthesis = #(define-music-function
                     (musicItem)
                     (ly:music?)
                     #{
                       \once \override Parentheses.stencils = #(lambda (grob)
                                                                 (let ((par-list (parentheses-interface::calc-parenthesis-stencils grob)))
                                                                   (list (car par-list) point-stencil )))
                       \parenthesize $musicItem
                     #}
                     )


endParenthesis = #(define-music-function
                   (musicItem)
                   (ly:music?)
                   #{
                     \once \override Parentheses.stencils = #(lambda (grob)
                                                               (let ((par-list (parentheses-interface::calc-parenthesis-stencils grob)))
                                                                 (list point-stencil (cadr par-list))))
                     \parenthesize $musicItem
                   #}
                   )

improvisationOnStemUp = {
  \override Stem.X-offset = #2.8
  \override Stem.length = #3.75
  \override Stem.Y-offset = #-0.1
  \stemUp
  \improvisationOn
}

improvisationOffStemUp = {
  \revert Stem.X-offset
  \revert Stem.length
  \revert Stem.Y-offset
  \stemNeutral
  \improvisationOff
}

improvisationOnStemDown = {
  \override Stem.length = #6
  \override Stem.Y-offset = #1
  \stemDown
  \improvisationOn
}


improvisationOffStemDown = {
  \revert Stem.length
  \revert Stem.Y-offset
  \stemNeutral
  \improvisationOff
}
