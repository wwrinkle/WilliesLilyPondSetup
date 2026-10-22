\version "2.26.0"
\language "english"

% half-diminished (ementaler styling)
% for use for ementaler font module
% half_dim_v_align = #1.25
% half_dim_font_size = #-3

seven_flat_nine_sus_markup = \markup { \super { 7 \tiny " " \raise #0.35 \small \flat 9 sus } }

ChordsList = {
  <c e g b fs'> - \markup {
    \char ##x2206 \smaller { \super { \super \sharp 11 }  }
  } % c maj7 #11
  <c e g b d fs> - \markup {
    \char ##x2206 \smaller { \super { 9 \super \sharp 11 }  }
  } % c maj9 #11
  <c' e' g' a' d''> - \markup { \tiny " " \super 6 / \tiny "9 " } % c 6/9
  <c' ef' g' a' d''> - \markup { min\super 6 / \tiny 9 } % c min 6/9
  <c d e g> - \markup { \super "add 2" } % c add 2
  <c e f g> - \markup { \super "add 4" } % c add 4
  <c d ef g> - \markup { min\super "add 2" } % c min add 2
  <c ef f g> - \markup { min\super "add 4" } % c min add 4
  <c ef gf b> - \markup { \fontsize #2 \char ##x00B0  \char ##x2206  } % c dim maj7
  <c ef gf bf> - \markup { \raise #half_dim_v_align \fontsize #half_dim_font_size \char ##x00F8 }
  <c e gs bf> - \markup { +\super7 } % c+7
  <c e g bf d' a'> - \markup { \super13 } % c13
  <c f bf> - \markup {  \super { 7 sus } } % c7sus
  <c f g d'> - \markup {  \super { 9 sus } } % c9sus
  <c f bf df> - \seven_flat_nine_sus_markup % c7b9sus
  <d, g c ef> - \markup { \super { 7 \tiny " " \raise #0.35 \small \flat 9 sus } } % c7b9sus
  <a, d g bf> - \markup { \super { 7 \tiny " " \raise #0.35 \small \flat 9 sus } } % c7b9sus
}
AllChords = #(append (sequential-music-to-chord-exceptions ChordsList #t) ignatzekExceptions)

\include "./bass-changes-engraver.ly"

\layout {
  \context {
    \ChordNames
    chordNameExceptions = #AllChords
    minorChordModifier = \markup { min }
  }
}

leadSheetChords = #(define-music-function
                    (harmony)
                    (ly:music?)
                    #{
                      \new ChordNames
                      \with { \consists #Bass_changes_equal_root_engraver }
                      {
                        \set chordChanges = ##t
                        $harmony
                      }
                    #})


leadSheetHarmonicRhythm = #(define-music-function
                            (harmonicRhythm)
                            (ly:music?)
                            #{
                              \tag #'layout {
                                \new RhythmicStaff \with {
                                  \override VerticalAxisGroup.staff-affinity = #DOWN
                                  \remove Time_signature_engraver
                                  \remove Staff_symbol_engraver
                                  \magnifyStaff #0.8
                                }
                                {
                                  \new Voice = "HarmonicRhythm"

                                  \reduceChords {
                                    \override RhythmicStaff.NoteHead.style = #'diamond
                                    $harmonicRhythm
                                  }
                                }
                              }
                            #})

