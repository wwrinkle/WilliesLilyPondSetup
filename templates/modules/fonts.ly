\version "2.24.4"
\language "english"

#ly:font-config-display-fonts
#(ly:font-config-add-directory "../../")

\paper {
  #(define fonts
     (set-global-fonts
      #:music "lv-goldenage"
      #:roman "GoldenAge"
      #:sans "GoldenAge"
      #:factor (/ staff-height pt 20)
      ))
}

% variables to be used when defining chord exceptions
half_dim_v_align = #0
half_dim_font_size = #2.5
