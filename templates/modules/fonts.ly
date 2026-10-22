\version "2.26.0"
\language "english"

% LV GoldenAge fonts are bundled in templates/fonts/lv-goldenage.
#(define goldenage-font-dir
   (string-append
    (dirname (car (ly:input-file-line-char-column (*location*))))
    "/../fonts/lv-goldenage"))

% Text fonts: registered from the bundle (relative to this file, not the
% working directory), so they work with any LilyPond install.
#(ly:font-config-add-directory goldenage-font-dir)

% Music font: LilyPond only finds it on its search path, so it needs either
%   lilypond -I <repo>/templates/fonts/lv-goldenage ...
% or the .otf files copied into LilyPond's fonts/otf folder.
% Without it, fall back to LilyPond's default music font instead of failing.
#(define goldenage-music-font
   (if (ly:find-file "lv-goldenage-20.otf")
       "lv-goldenage"
       (begin
        (ly:warning
         "LV GoldenAge music font not found; using Emmentaler. Run lilypond with -I ~a for the full look."
         goldenage-font-dir)
        "emmentaler")))

\paper {
  property-defaults.fonts.roman = "GoldenAge"
  property-defaults.fonts.sans = "GoldenAge"
  property-defaults.fonts.music = #goldenage-music-font
  property-defaults.fonts.staff-height = 20
}

% variables to be used when defining chord exceptions
half_dim_v_align = #0
half_dim_font_size = #2.5
