\version "2.24.4"
\language "english"

\include "../../../templates/init.ly"

title = "A Flower is a Lovesome Thing"
composer = "Strayhorn"
style = "Ballad"
part_name = "C Part"

melody = {
  \relative c' {
    \time 4/4
    \numericTimeSignature
    \key df \major

    \mark \markup \box Intro
    \slashNotation 15 r8 f8 \break

    \repeat volta 2 {
      af8 gf f gf f4 f8 f~ | f2. r8 f | af gf f gf f4 f8 f~ | f2. r8 f| \break
      g f d bf c'4. bf8 | e, ef c af bf'4. df,8 | e d cs d df4 df8 df~ |
      \alternative {
        \volta 1 {
          df2. r8 f |
        }
        \volta 2 {
          df2. r4 \section \break
        }
      }
    }

    af'4. a8 af4. a8 | c2. r4 | a4. bf8 a4. bf8 | cs2. d4 | \break
    cs4. d8 cs4. d8 | e d df a af fs \tuplet 3/2 { fs8 g af } | bf!4 bf8 bf~ bf2~ | bf r4 r8 f \section \break
    af8 gf f gf f4 f8 f~ | f2. r8 f | af gf f gf f4 f8 f~ | f2. r8 f| \break
    g f d bf c'4. bf8 | e, ef c af bf'4. df,!8 | e d cs d df4 df8 df~ | df2. r4 \bar "."
  }
}

aSectionHarmony = \chordmode {
  b1*4:7.11+ |
  bf2:7 ef:7 | af:7 df:7 | fs:m7 ef4:7 d:maj7 | df1:6 |
}

harmony = \chordmode {
  b1*4:7.11+ |
  \aSectionHarmony | df1:6 |
  ef2:2 af:7.9- | df1:maj7 | e2:m7 a:7.9- | d1:maj7 |
  d2:maj7/a gs:m7.5- | d1:maj7/a | af2:m7.5- g:7.9+ | gf:maj7 af:7 |
  \aSectionHarmony
}

\include "../../../templates/lead_sheet.ly"
