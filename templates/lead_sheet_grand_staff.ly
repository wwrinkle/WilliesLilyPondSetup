\version "2.26.0"
\language "english"

\include "./modules/index.ly"


\paper {
  annotate-spacing = #debug
}

\score {
  \removeWithTag #'midi
  \new StaffGroup <<
    \leadSheetChords \harmony
    \leadSheetHarmonicRhythm \harmonicRhythm
    \leadSheetMelody {
      \tempoSetting
      \melody
    } \melodyLyrics \melodyLyricsLineTwo
    \leadSheetBass \bass
  >>
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
  \new StaffGroup <<
    \leadSheetChords \harmony
    \leadSheetMelody { \tempoSetting \melody } \melodyLyrics \melodyLyricsLineTwo
    \leadSheetBass \bass
  >>
  \midi {
    \formattedTempo
  }
}

