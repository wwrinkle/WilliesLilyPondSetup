\version "2.26.0"
\language "english"
#(set-global-staff-size 40)

\header {
  title = "Easy to Read Note Heads"
  tagline = ##f
}

\relative c' {
  \clef treble
  \key c \major
  \time 4/4
  \easyHeadsOn

  c4 d e f | g a b c |
  c b a g | f e d c |

  \bar "|."
}