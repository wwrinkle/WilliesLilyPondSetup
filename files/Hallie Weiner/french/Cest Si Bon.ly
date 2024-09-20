\version "2.24.4"
\language "english"

\include "../../../templates/init.ly"

title = "C'est Si Bon"
composer = "Hornez/Betti"
style = "Medium"
part_name = "C Part"

melody = {
  \relative c' {
    \time 4/4
    \numericTimeSignature
    \key ef \major
    \tempo 4 = 150
    \sectionBox "Intro"
    \partial 4 ef4 | bf' ef, bf'8 ef,4 a8~ | a8 bf4. af8 bf g4 | r8 g ef4 g8 ef f g~ | g2 bf4 a \section \break
    \sectionBox "A"
    \grace s
    \repeat volta 2 {
      af,1~ | af8 bf4 c8 d c bf4 | g1~ | g8 bf4 c8 d c bf4 | \break
      af1~ | af8 bf c d g d4 c8~ | c1~ | c4 r bf a | \section \break
      af!1~ | af8 bf4 c8 d c bf4 | g1~ | g8 bf4 c8 d c bf4 | \break
      af1~ | af4 c8 d g bf,4 ef8~ | ef1~ | ef4 r ds e | \section \break
      \sectionBox "B"
      fs2 ds4 cs | b2 as4 gs | gs2 as2~ | as4 r ds e | \break
      f!2 ef4 d | c2 d4 ef | g1 | f4 r bf, a | \section \break
      \sectionBox "A"
      af1~ | af8 bf4 c8 d c bf4 | g1~ |g8 bf4 c8 d c bf4 | \break
      af1~ |af8 bf c f bf bf4 bf8~ | bf1~ | bf2 bf4 a | \break
      af1~ | af8 g4 f8 af g f4 | g1~ | g8 g4 f8 ef d c4 | \break
      cf1~ | cf8 bf c d g bf,4 ef8~ | ef1~^\markup {
        \text { \huge To \coda }
      } | ef4 r bf a | \break
    }
    \sectionBox "Coda"
    \repeat volta 2 {
      ef'1~^"Vamp and fade" | ef4 <bf bf'>8^"Whole band sings" <d d'>~ <d d'>4 <bf bf'>8 <c c'> | r1 | r4 <bf bf'>8 <d d'>~ <d d'>4 <bf bf'>8 <c c'> \break
    }
  }
}

harmony =
\chordmode {
  s4 | ef2 df:9.11+ | ef ef:9.11+ | f:m9 bf:13 | s1 |
  f1:m7 | bf:7 | ef1*2:maj7 ||
  f1:m7 | bf:7 | ef1*2:6 ||
  f1:m7 | bf:7 | ef1*2:maj7 ||
  f1:m7 | bf:7 | ef1*2:6 ||
  b1*4:maj7 ||||
  c1:m7 | f:7 | f:m9 | bf:7 |
  f:m7 | bf:7 | ef1*2:maj7 ||
  f1:m7 | bf:7 | g:m7.5- | c:7.9- |
  f:m7 | af:m6 | ef:maj7 | c:m7 |
  b:7 | bf:7 | ef1*2 ||
  ef1:6 | f2:m7 bf:7 | ef1:6 | f2:m7 bf:7 |
}

melody_lyrics = \lyricmode {
  % empty intro lyrics
  \repeat unfold 16 _
  C'est si bon De par -- tir n'im -- porte où Bras des -- sus, bras des -- sous
  En chan -- tant des chan -- sons.
  C'est si bon
  De se dire des mots doux
  Des pe -- tits rien du tout
  Mais qui en disent long. En voy --
  ant no -- tre mi -- ne ra -- vi -- e Les pas
  sants, dans la rue, nous en vient. _ C'est si
  bon De guet -- ter dans ses yeux un es -- poir mer -- veil --
  leux Qui don ne fe fris -- son. C'est si
  bon Ces pet -- it's sen -- sa -- tions, Ça vaut mieux qu'un mil --
  lion. Tell -- 'ment tell -- 'ment c'est bon. C'est si
  Bon. C'est bon, c'est bon. C'est bon, c'est bon.
}

\include "../../../templates/lead_sheet.ly"
