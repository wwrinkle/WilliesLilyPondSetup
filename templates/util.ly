slashNotation = #(define-music-function
                  (i)
                  (number?)
                  #{
                    \improvisationOn
                    \omit Stem
                    \repeat unfold $i b'4
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
