\version "2.24.4"
\language "english"

\include "../../templates/init.ly"

tempoSetting = \tempo 4 = 200

title = "'Lil Liza Jane"

melody = {
  \relative c' {
    \time 4/4
    \numericTimeSignature
    \key ef \major
    \sectionBox "Drum Intro"
    \slashNotation 4 | \slashNotation 4 | \slashNotation 4 | \slashNotation 4 | \break
    \section
    \repeat volta 2 {
      <bf g'>8 <bf g'> <ef g,> <ef g,> <f af,> <f af,> <ef g,> <ef g,> | <bf g'>8 <bf g'> <ef g,> <ef g,> <f af,> <f af,> <ef g,> <ef g,> | <g bf,>4 <bf g>2 <bf g>4 | <c af>2 <bf g> | \break
      <bf, g'>8 <bf g'> <ef g,> <ef g,> <f af,> <f af,> <ef g,> <ef g,> | <bf g'>8 <bf g'> <ef g,> <ef g,> <f af,> <f af,> <ef g,> <ef g,> | <g bf,>4 <d g>2 <f c>4 | <ef bf>2 r | \break
    }
    \repeat volta 2 {
      r4 ef'2 bf4 | c2 bf | g4 bf2 bf4 | c2 bf | \break
      r4 ef2 bf4 | c2 bf | g4 g2 f4 | ef2 r |
    }

  }
}

harmony =
\chordmode {
  s1*4 |
  \repeat volta 2 {
    ef1*3 | af2 ef |
    ef1*2 | bf1:7 | ef |
  }
  \repeat volta 2 {
    ef1*3 | af2 ef |
    ef1*2 | bf1:7 | ef |
  }
}


\include "../../templates/lead_sheet.ly"

