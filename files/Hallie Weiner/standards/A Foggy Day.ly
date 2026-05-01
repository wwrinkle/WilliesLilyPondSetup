\version "2.26.0"
\language "english"

\include "../../../templates/init.ly"

title = "A Foggy Day"
composer = "Gershwin"
style = "Medium"
partName = "C Part"

melody = {
  \relative c' {
    \time 4/4
    \numericTimeSignature
    \key ef \major
    \sectionBox "A"
    r4 bf bf bf | df2. df4 | c4 c2. | g'1 | \break
    r2 ef4 ef | gf2. gf4 | f2. f4 | c'1 | \section \break
    \sectionBox "B"
    r4 d d d | bf bf2. | g2. g4 | ef1 | \break
    r4 g g8 g g4 | bf bf2 bf4 | g2. g4 | c,1 \section \break
    \sectionBox "A"
    r4 bf bf bf | df df2 df4 | c c2. | g'1 | \break
    r4 ef ef8 ef ef4 | gf8 gf gf2. | f4 f2. | c'1 | \section \break
    \sectionBox "C"
    r2 ef4 ef | c2. c4 | bf2 bf | g g4 af | \break
    \startPedalSpan \markup { B\flat pedal }
    bf ef, f af | g ef f af | g2 c | ef, f \stopTextSpan | \break
    ef1~ | ef2 r \fine
  }
}

melodyLyrics = \lyricmode {
  A fog -- gy day, in Lon -- don town
  Had me low, and had me down
  I viewed the morn -- ing, with a -- larm,
  the Bri -- tish mu -- se -- um had lost its charm.
  How long I wond -- dered, could this thing last?
  But the age of mir -- a -- cles had -- n't passed.
  Sud -- den -- ly, I saw you there, and the
  fog -- gy Lon -- don town the sun was shin -- ing ev -- 'ry -- where.
}

aHarmony = \chordmode {
  ef1:maj7 | g2:m7.5- c:7.9- | f1:m7 | bf:13 |
  ef:6 | c:m7.5- | f:7 | f2:m7 bf:7 |
}

harmony = \chordmode {
  \aHarmony
  ef1:maj7 | bf2:m7 ef:7 | af1:maj7 | af2:m7 df:9 |
  ef1:maj7 | g2:m7 c:7 | f1:9 | f2:m7 bf:9 |
  \aHarmony
  bf1:m7 | ef:13 | af:6.9 | df:7.11+ |
  ef2:6 f:m7 | ef2:6 f:m7 | g:m7 c:m7 | f:m7 bf:7 | ef:6 gf:7 | f:7 e:7 |
}

\include "../../../templates/lead_sheet.ly"
