\version "2.26.0"
\language "english"

\include "../../templates/init.ly"

tempoSetting = \tempo 4 = 165

title = "Tiger Rag"

melody = {
  \relative c' {
    \time 4/4
    \numericTimeSignature
    \key bf \major
    \repeat volta 3 {
      \sectionBox "A"
      \bar ".|:"
      bf' bf bf bf | bf8 bf4 f8 d4 f | bf d8 c~ c f, g a | bf a bf c d2| \break
      bf4 bf bf bf | bf8 bf4 f8 d4 f | bf d8 c~ c f, g a |
      \alternative {
        \volta 1 {
          bf2~ bf8 f g a |
        }
        \volta 2 {
          bf2. r4 | \section \break
          \sectionBox "B"
          <<
            {c4 r r bf | a r r a | bf r r bf | a r r2 }
            \\
            { g4 c, d ef | f g a f | g a bf g | a bf c a }
          >>
          \break
          <<
            {c4 r r bf | a r r a | bf r r g | f r d'8 df c b }
            \\
            { g4 c, d ef | f g a f | g a bf ef, | f s4 s2 }
          >>
          \section \break
        }
        \volta 3 {
          bf4 af8 g~ g g f4 \section |

        }
      }
    }
    \key ef \major
    \sectionBox "C"
    ef2. f4 | g bf8 c~ c c bf4 | ef4-^ r^\markup "Solo Break" r2 | r1 | \break
    ef,2. f4 | g bf8 c~ c c bf4 | d4-^ r^\markup "Solo Break" r2 | r1 | \section \break
    \sectionBox "D"
    \repeat volta 2 {
      bf4 d c2 | bf8 d4 c8~ c2 | bf4 ef c2 | bf8 ef4 c8~ c2 | \break
      \alternative {
        \volta 1 {
          bf4 d c2 | bf8 d4 c8~ c bf c4 | ef4 r^\markup "Solo Break" r2 | r1 | \section \break
        }
        \volta 2 {
          c2 g | af a | bf8 a bf c bf af g f | ef2 r | \section \break
        }
      }
    }
    \key af \major
    \sectionBox "E"
    \repeat volta 2 {
      r4 af2 af4 | af4. c8 r2 | r4 af2 af4 | af4. c8 r2 | \break
      r4 af2 af4 | af4. c8 r2 | r4 g2 g4 | g4. bf8 r2 | \break
      r4 g2 g4 | g4. bf8 r2 | r4 g2 g4 | g4. bf8 r2 | \break
      r4 g2 g4 | g2 bf | af4 r^\markup "Solo Break" r2 | r1 | \section \break
      r4 af2 af4 | af4. c8 r2 | r4 af2 af4 | af4. c8 r2 | \break
      r4 af2 af4 | af af8 c~ c af c4 | bf1 | r4 af8 f~ f f af4 | \break
      r4 b2 b4 | b2 af | r4 c b8 c4. | df2 c | \break
      r4 c bf af | bf8 c4 ef8~ ef c bf4 | af1~ | af2 r |
    }
  }

}


harmony =
\chordmode {
  \repeat volta 3 {
    bf1*2~ | bf2 f:7 | bf1~ |
    bf1*2~ | bf2 f:7 |
    \alternative {
      \volta 1 {
        bf1 |
      }
      \volta 2 {
        bf1 |
        c:7 | f | c:7 | f |
        c:7 | f | c:7 | f |
      }
      \volta 3 {
        bf1:7 \section |
      }
    }
  }
  ef1*4 |
  ef1*2 | bf:7
  \repeat volta 2 {
    bf:7 | ef |
    \alternative {
      \volta 1 {
        bf:7 | ef |
      }
      \volta 2 {
        af1~ | af2 a:dim7 | bf1:7 | ef2 ef:7 |
      }
    }
  }
  \repeat volta 2 {
    af1*6 | ef1*2:7 |
    ef1*6:7 | af1*2 |
    af1*4~ |
    af1 | af:7 | df1*2 |
    df1:7 | d:dim7 | af/ef | f:7 |
    bf:7 | ef:7 | af1*2 |
  }

}


\include "../../templates/lead_sheet.ly"

