\version "2.26.0"
\language "english"

\include "../../templates/init.ly"

tempoSetting = \tempo 4 = 170

title = "Roll With It"
composer = "Rebirth"

trumpet = {
  \relative c' {
    \time 4/4
    \numericTimeSignature
    \key f \minor
    \repeat volta 2 s1*4
    \repeat volta 2 {
      r4 r8 <c' af>~ <c af>4 r | r r8 <bf g>~ <bf g>4 r | r r8 <af f>~ <af f>4 r | r r8 <g e>~ <g e>4 r |
    }
  }
}

tenorSax = {
  \relative c' {
    \time 4/4
    \numericTimeSignature
    \key f \minor
  }
}

trombone = {
  \relative c' {
    \time 4/4
    \numericTimeSignature
    \key f \minor
    \clef bass
    \repeat volta 2 s1*4
    \repeat volta 2 {
      f,8 c' ef af r2 | f,8 c' ef g r2 | f,8 c' ef f r2 | f,8 c' ef df~ df4( c) |
    }
  }
}

bassLine = {
  f4. f8~ f2 | r4 af~ af8 a4. | bf4. bf8~ bf2 | c c4 ef, |
}

tuba = {
  \relative c' {
    \time 4/4
    \numericTimeSignature
    \key f \minor
    \clef bass
    \octaveCheck c,
    \bar ".|:" \repeat volta 2 \bassLine
    \break
    \repeat volta 2 \bassLine
  }
}

drumPart = \drummode {
  \set Staff.midiInstrument = #"standard kit"
  \set Staff.instrumentName = #"Drums"
  \repeat volta 2 {
    \repeat unfold 16 hh4
  }
  \repeat volta 2 {
    \repeat unfold 16 hh4
  }
}



harmony =
\chordmode {
}

\include "../../templates/modules/index.ly"

\paper {
  annotate-spacing = #debug
}

music = \new StaffGroup <<
  \new Staff {
    \set Staff.midiInstrument = #"trumpet"
    \set Staff.instrumentName = #"Trumpet"
    \new Voice = "trumpet" {
      \tempoSetting
      \trumpet
    }
  }
  \new Staff {
    \set Staff.midiInstrument = #"tenor sax"
    \set Staff.instrumentName = #"Tenor Sax"
    \new Voice = "tenor sax" {
      \tenorSax
    }
  }
  \new Staff {
    \set Staff.midiInstrument = #"trombone"
    \set Staff.instrumentName = #"Trombone"
    \new Voice = "trombone" {
      \trombone
    }
  }
  \new Staff {
    \set Staff.midiInstrument = #"tuba"
    \set Staff.instrumentName = #"Tuba"
    \new Voice = "tuba" {
      \tuba
    }
  }
  \new DrumStaff <<
    \drumPart
  >>
>>

\score {
  \removeWithTag #'midi
  \music
  \layout {
    \context {
      \Score
      \override VerticalAxisGroup.remove-first = ##t
    }
  }
}

\score {
  \removeWithTag #'layout
  \unfoldRepeats
  \music
  \midi {
    \formattedTempo
  }
}

