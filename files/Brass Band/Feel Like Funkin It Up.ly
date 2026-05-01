\version "2.26.0"
\language "english"

\include "../../templates/init.ly"

tempoSetting = \tempo 4 = 180

title = "Feel Like Funkin' It Up"
composer = "Rebirth"

melody = {
  \relative c' {
    \time 4/4
    \numericTimeSignature
    \key ef \major
    \clef bass
    \sectionBox "Intro"
    \partial 2. r8 df,~ df4 d |
    \repeat volta 2 {
      ef4 ^\markup { \huge "open" } r8 bf~ bf4 c | ef,4 r8 bf'~ bf4 a | af!4 r8 af~ af4 af | df4 r8 df~ df4 d _\markup { \huge "cont." } | \break
    }
    \clef treble
    \repeat volta 2 {
      r4 ^\markup { \huge "open" } <ef'' c g ef>8  <ef c g ef> <ef c g ef> <ef c g ef> r8 <ef c g ef>~|
      <ef c g ef>4 <ef c g ef>8 <ef c g ef> <ef c g ef> <ef c g ef> r4 |
      r4 <df bf gf df>8 <df bf gf df> <df bf gf df> <df bf gf df> r8 bf |
      <<
        { s2 r8 bf ^\markup { \huge "on cue" } r c }
        \\
        { af gf af bf gf bf ef, ef _\markup { \huge "cont." } }
      >> |
      \break
    }
    \repeat volta 2 {
      \sectionBox "A"
      \repeat volta 4 {
        df' c bf gf~ gf ef f4 | ef2 r | r4 r8 c ef f r f |
        \alternative {
          \volta 1, 2, 3 {
            r ef4. r8 bf' r c |
          }
          \volta 4 {
            r ef,4. r8 c8 ef f |
          }
        }
      } \section \break
      \sectionBox "Bridge"
      <g bf,>4. <g bf,>8~ <g bf,>4 <g bf,>~ | <g bf,>2 r8 c, ef f | g4 g8 <bf f>~ <bf f> <bf f> <c ef,>4~ | <c ef,>2 r8 c, ef f | \break
      <g bf,>4. <g bf,>8~ <g bf,>4 <g bf,>~ | <g bf,>2 ef4 f | <g bf,>8 <g bf,> <g bf,>4 r8 bf r c8 \fine \bar "|" | r2 r8 bf r c |
    }
  }
}

harmony =
\chordmode {
  \partial 2. s2.
  \repeat volta 2 {
    ef1*2:13 af:7
  }
  \repeat volta 2 {
    ef1*2:13 af:7
  }
  \repeat volta 2 {
    \repeat volta 4 {
      ef1*2:13 af1:7
      \alternative {
        \volta 1, 2, 3 {
          s
        }
        \volta 4 {
          s
        }
      }
    }
    s1*8
  }
}

\include "../../templates/lead_sheet.ly"

