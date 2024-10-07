\version "2.24.4"
\language "english"

\include "../../../templates/init.ly"

title = "A Fine Romance"
composer = "Kern/Fields"
style = "Medium"
part_name = "C Part"

melody = {
  \relative c' {
    \time 4/4
    \numericTimeSignature
    \key af \major
    \partial 4 c4 |
    \sectionBox "A"
    \repeat volta 2 {
      af1 | f'4 ef2 f4 | g,1 | g'4 f2 g4 | \break
      c,1 | bf'4 af2 c,4 | ef1 | c'4 bf2 ef,4 \section \break
      \alternative {
        \volta 1 {
          \sectionBox "B"
          af4 g af bf | \tuplet 3/2 { af4 g gf } f4 e | ef2 ef~ | ef2. ef4 | \break
          f e f g | \tuplet 3/2 { f4 e ef } d4 df | c2 c2~ | c4 r2 c4 | \break
        }
        \volta 2 {
          \sectionBox "C"
          af'4 g af bf | \tuplet 3/2 { c4 bf af } g4 gf | f1 | \tuplet 3/2 { af4 gf gf} f4 e | \break
        }
      }
    }
    ef1 | \tuplet 3/2 { g4 f e } ef4 bf' | af1~ | af2 r | \fine
  }
}

harmony =
\chordmode {
  s4 | af1:6 | a:dim7 | bf:m6 | b:dim7 |
  c:m7 | f:m7 | bf:m7 | ef:13 |
  af:6 | b:dim7 | bf:m7 | ef:7 |
  af:6 |f2:7 d4:7 df:7 | c2:7 f:7 | bf:m7 ef:7 |
  af1:6 | af:7 | df2:maj f:7/c | bf:m7 b:dim7 |
  c:m7 b:7 | bf:m7 ef:7 | af1:6 | bf2:m7 ef:7 |
}

melody_lyrics = \lyricmode {
  A fine ro -- mance, with no kiss -- es. A
  fine ro -- mance, my friend, this is. We
  should be like a cou -- ple of hot to -- mat -toes. But
  you're as cold as yes -- ter -- day's mashed po -- ta -- toes. A
  ne -- ver mussed a crease in your blue serge pants. I ne -- ver had the
  chance. This is a fine ro -- mance.
}
melody_lyrics_line_two = \lyricmode {
  _ fine ro -- mance, you won't nest -- le. A
  fine ro -- mance, you won't wrest -- le. I've
}

\include "../../../templates/lead_sheet.ly"
