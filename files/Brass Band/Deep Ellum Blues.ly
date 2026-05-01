\version "2.26.0"
\language "english"

\include "../../templates/init.ly"

tempoSetting = \tempo 4 = 200

title = "Deep Ellum Blues"

melody = {
  \relative c' {
    \time 4/4
    \numericTimeSignature
    \key bf \major
    \partial 2 f4 g |
    \repeat volta 2 {
      \repeat volta 2 {
        bf bf2 g4 | f bf,  d f | bf bf2 g4 | f2 r | \break
        bf4 bf2 g4 | f bf, d f | bf bf2 a4 | af2 r | \break
        g g | bf4 bf2. | bf4 bf bf f  | af2 g4 f | bf,1 |
        \alternative {
          { r2 f'4 g }
          {
            r4 d ef e  \bar "||" \break
            f2 a | f4 f2. | bf4 bf bf f | af2 g4 f | bf,1 | r
          }
        }
      }
    }
  }
}

harmony =
\chordmode {
  s2 | bf1*7 bf1:7
  ef1*2:7 bf1 f:7.9+ bf1*3
  f1*2:7 f1:sus7 f:7.9+ bf1*2

}


\include "../../templates/lead_sheet.ly"

