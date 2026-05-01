\version "2.26.0"
\language "english"

\include "../../../templates/init.ly"

title = "Bei Mir Bistu Shein"
composer = "Jacobs/Secunda"
style = "Swing"
partName = "C Part"

aSection = \relative c' {
  af'2 g8 f r af~ | af2 r4 c, | af'2 g8 f r af~ | af2 r4 af |
  g2 e4 c | g'2 af4 g | f1 |
}

melody = \relative c' {
  \time 4/4
  \numericTimeSignature
  \key f \minor
  \tempo 2 = 82
  \partial 4. c8 f g |
  \repeat volta 2 {
    \sectionBox "Verse"
    af4 af af8 g f4 | bf g r8 c, f g |
    af4 af af8 g f4 | bf g r8 c, f g |
    af4 af af8 g f4 | bf4 bf bf8 af g4 |
    \alternative {
      \volta 1 {
        af af af8 g f g~ | g4 r r8 c bf af |
      }
      \volta 2 {
        c8 c c4 c c8 c~ | c2 r4 c, | \section
      }
    }
  } \break
  \repeat volta 2 {
    \repeat volta 2 {
      \grace s
      \sectionBox "A"
      \aSection
      \alternative {
        \volta 1 {
          r2 r4 c |
        }
        \volta 2 {
          r4 f g af \section
        }
      }
    } \break
    \sectionBox "B"
    bf2 f4 bf~ | bf af g f | af2 af4 af8 af~ | af4 f g af | \break
    bf2 f4 bf~ | bf af g f | c'2 c4 c8 c~ | c2 r4 c, \section \break
    \sectionBox "A"
    af'2 g8 f r af~ | af2 r4 c, | af'2 g8 f r af~ | af2 r4 af | \break
    g2 e4 c | g' g af g | f1 | r1 |
  }
}

melodyLyrics = \lyricmode {
  Of all the boys I've known, and I've known some, Un -- til I first met you, I was
  lone -- some, And when you came in sight, dear, my heart grew light, And this
  old world seemed new to me. You're real -- ly \repeat unfold 6 _ Bei
  mir bist du schön, please let me ex -- plain Bei
  mir bist du schön means you're grand. Bei I could say
  bel -- la, bel -- la, ev -- en sehr wun -- der -- bar. Each lang -- uage
  on -- ly helps me tell you how grand you are. I've
  tried to ex -- plain, bei mir bist du schön, So
  kiss me and say you un -- der -- stand.
}

melodyLyricsLineTwo = \lyricmode {
  \repeat unfold 3 _ swell, I have to ad -- mit you, Des -- erve ex -- press -- ions that reall -- y fit you, And so I've
  racked my brain, hop -- ing to ex -- plain All the
  \repeat unfold 9 _ things that you do to me
  \repeat unfold 5 _ a -- gain I'll ex -- plain
  \repeat unfold 5 _ it means you're_the_fairest_in_the_land
}

harmony = \chordmode {
  s4. | f1:m | df2 c:7 | f1:m | df2 c:7 |
  f1:m | bf:m | df:7 | c:7 | c1*2:7 ||
  f1*4:m |
  c1*2:7 || f1*3:m |||
  bf1*2:m || f:m ||
  bf:m || c:7 ||
  f1*4:m |
  c1*2:7 || f1:m | df2:7 c:7 ||
}

\include "../../../templates/lead_sheet.ly"
