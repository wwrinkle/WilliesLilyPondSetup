\version "2.24.4"
\language "english"

\include "./modules/index.ly"

\paper {
  annotate-spacing = #debug
}

\score {

  \removeWithTag #'midi
  <<
    \leadSheetChords \harmony
    \leadSheetHarmonicRhythm \harmonicRhythm
    \leadSheetMelody { \tempoSetting \melody} \melody_lyrics \melody_lyrics_line_two
  >>

  \layout {
  }


}

\score {
  \removeWithTag #'layout
  \unfoldRepeats
  <<
    \leadSheetChords \harmony
    \leadSheetMelody { \tempoSetting \melody} \melody_lyrics \melody_lyrics_line_two
  >>
  \midi {
    \formattedTempo
  }
}

