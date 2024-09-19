\version "2.24.4"
\language "english"

leadSheetMelody = #(define-music-function
                    (melody melodyLyrics melodyLyricsLineTwo)
                    (ly:music? ly:music? ly:music?)
                    #{
                      \new Staff \with { midiInstrument="acoustic grand" }
                      {
                        <<
                          \new Voice = "melody" {
                            $melody
                          }
                          \new Lyrics \lyricsto "melody" $melodyLyrics
                          \new Lyrics \lyricsto "melody" $melodyLyricsLineTwo
                        >>
                      }

                    #})

leadSheetBass = #(define-music-function
                  (bass)
                  (ly:music?)
                  #{
                    \new Staff \with { midiInstrument="acoustic bass" }
                    {
                      \new Voice = "bass" {
                        $bass
                      }
                    }
                  #})