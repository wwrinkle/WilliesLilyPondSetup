\version "2.26.0"
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
    \leadSheetMelody { \tempoSetting \melody} \melodyLyrics \melodyLyricsLineTwo
  >>
  \layout {
  }
}

\score {
  \removeWithTag #'layout
  \unfoldRepeats
  <<
    \leadSheetChords \harmony
    \leadSheetMelody { \tempoSetting \melody} \melodyLyrics \melodyLyricsLineTwo
  >>
  \midi {
    \formattedTempo
  }
}

