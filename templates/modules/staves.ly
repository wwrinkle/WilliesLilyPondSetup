\version "2.24.4"
\language "english"

leadSheetMelody = #(define-music-function
                    (melody melodyLyrics)
                    (ly:music? ly:music?)
                    #{
                      \new Staff \with { midiInstrument="acoustic grand" }
                      {
                        <<
                          \new Voice = "melody" {
                            $melody
                          }
                          \new Lyrics \lyricsto "melody" $melodyLyrics
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