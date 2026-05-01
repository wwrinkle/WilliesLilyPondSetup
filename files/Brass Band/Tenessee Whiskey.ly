\version "2.26.0"
\language "english"

\include "../../templates/init.ly"

title = "Tennessee Whiskey"
composer = "Dillon/Hargrove"

tempoSetting = {
  \once \override Score.MetronomeMark.Y-offset = #12
  \tempo 4. = 55
}

melody = \relative c' {
  \key ef \major
  \time 12/8
  \partial 4. \sectionBox "Intro" bf8 c ef |
  g2.~ g4. g8 f ef | g f4~ f2. r8 \scoop g \scoop g | ef2.~ ef4. r8 \scoop g \scoop g | ef2. r | \section \break

  \repeat volta 2 {
    \sectionBox "Verse"
    r4. r8^\markup { \huge "Vox" } g16 f g f g f ef4~ ef ef8 | g f4~ f2. r4. | r4. r8 g16 bf c c bf8 bf g16 f  ef8 ef g~ | g2.r | \break
    r4. r8 g16 bf c g f ef8 c c16 ef8. f16 g f | c4. r r4 c8 ef f g | f16 ef~ ef4 r4 r16 c g'4. f8 ef ef16 c | ef4. r2. bf8 c ef | \section \break


    \sectionBox "Chorus"
    g2. r4 ef8 g16 f ef g f8~ | f2. r4. g8 bf c |
    c4~ c16 bf c g8 f16 ef8~ ef ef c'~ c bf16 g g8~  | g2. r4. r8 bf c16 ef~ \break

    \tuplet 3/2 { ef16 d c } \tuplet 3/2 {d c bf} \tuplet 3/2 {c bf g} \tuplet 3/2 {g bf c} bf8. g16 ef4 \tuplet 3/2 {ef16 ef (c'} bf4) f16 ef |
    c2. r8 r16 c c c (ef8 f) g |
    f16 ef~ ef4 r8 c' g f16 ef~ ef4 g4~ g16 f |
    ef2. r | \section \break

  }
  \time 4/4
  \numericTimeSignature
  \tempo 4 = 180
  ^\markup {\huge "Drums" } \slashNotation 4 4 | \slashNotation 3 4 ^\markup { "cont." } \slashNotation 1 4 |  \slashNotation 3 4 r8 g^\markup {\huge "Horns" } | bf,4 c ef \scoop g~  | \section \break
  \repeat volta 2 {
    g1~ | g | r | g8 f4.~ f8 ef c4 | \break
    g'8 f~ f2.~ | f1 | r | r2  \override Script.Y-offset = #-4 \scoop g4-> \scoop g-> | \break
    ef1->~  \revert Script.Y-offset | ef | r | r2 r8 ef bf c | \break
    ef1~ | ef | r2. r8 g  | bf,4 c ef \scoop g \laissezVibrer
  }
}

bass = \relative c' {
  \key ef \major
  \time 12/8
  \partial 4. s4. |
  s1. | s | s | s |
  \repeat volta 2 {
    \sectionBox "Verse"
    s | s | s | s |
    s | s | s | s |

    <g' ef bf>4.~^\markup { \huge "Bkgs" } <g ef bf>4 <af ef c>8 <g ef bf>2. |
    <<
      {
        g4. f~ f2.
      }
      \\
      { <ef af,>1. }
    >> |
    <f ef c>1. | <g ef bf> \break

    <g ef bf>4.~ <g ef bf>4 <af ef c>8 <g ef bf>2. |
    <<
      {
        g4. f~ f2.
      }
      \\
      { <ef af,>1. }
    >> |
    <f ef c>1. | <g ef bf> | \section \break
  }
  s1
}

harmony =
\chordmode {
  s4. |
  ef4.~ ef4 af8 ef2. | f1.:m7 | af:6 | ef |
  \repeat volta 2 {
    ef1.|f:m7 | af:6 | ef |
    ef1.|f:m7 | af:6 | ef |
    ef4.~ ef4 af8 ef2. | f1.:m7 | af:6 | ef |
    ef4.~ ef4 af8 ef2. | f1.:m7 | af:6 | ef |
  }
  s1*4 |
  \repeat volta 2 {
    ef1*4 |
    f:m7 |
    af:6 |
    ef1*2 | bf:7 |
  }
}

harmonicRhythm = \chordmode {
  s4. |
  ef4.~ ef4 af8 ef2. | s1.*3 |
  \repeat volta 2 {
    s1.*4 |
    s1.*4 |
    ef4.~ ef4 af8 ef2. | s1.*3 |
    ef4.~ ef4 af8 ef2. | s1.*3 |
  }
  bf4. bf8~ bf4 bf | bf4. bf8~ bf4 bf
}

\include "../../templates/lead_sheet_grand_staff.ly"