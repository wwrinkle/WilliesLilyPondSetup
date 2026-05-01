\version "2.26.0"
\language "english"

\include "../../../templates/init.ly"

title = "Abi Gezunt"
composer = "Molly Piccon/Abraham Ellstein"
partName = "C Part"

aSection = \relative c' {
  d4 f a4. a8 | c4 bf \acciaccatura bf8 a4 g8 g | d4 e f4. f8 | a4 g \acciaccatura g8 f4 e8 e | \break
  a4, d f2 | f4 e d cs |
}

melody = \relative c' {
  \key d \minor
  \time 2/2
  \sectionBox "Intro"
  <<
    {
      \acciaccatura cs''8 d2-> a->
    }
    \\
    {
      r4 <f, a f' a> r <d f d' f>
    }
  >> | bf'8-. c-. bf-. g-. e4 <a, cs a'>-> |
  <<
    {
      \acciaccatura cs'8 d2-> a->
    }
    \\
    {
      r4 <f a> r <d f>
    }
  >> | bf'8-. c-. bf-. g-. e4 <a, cs a'>-> \break
  d <a d f> r q | r q r a  \section \break
  \sectionBox "A"
  \repeat segno 2 {
    \repeat volta 2 {
      \repeat volta 2 {
        % spacer to show both double bar and first repeat
        \grace s
        \aSection
        \alternative {
          \volta 1 {
            d1~ | d4 r2 r8 a
          }
          \volta 2 {
            d1~ | d4 d e f \section
          }
        }
      } \break
      \sectionBox "B"
      g1~ | g4 f8 g \tuplet 3/2 { f4( e) d } | gs4( a2.~ | a4) d, e f | \break
      g g g g | g4. a8 c bf a g | a1~ | a4 r2 r8 a, \section \break
      \sectionBox "A"
      \aSection | d1~ | d4 r r2
    } \break
    \sectionBox "Verse"
    \volta 2 \fine
    \volta 1
    d'8-. d-. d-. d-. a4-. c-. | bf8-. bf-. bf-. bf-. e4-. bf-. | a8-. bf-. a-. g-. e4-. f-. | d2 r | \break
    e4 f g e | f g a2 | gs4 a b cs | a2 r | \break
    d8-. d-. d-. d-. a4-. c-. | bf8-. bf-. bf-. bf-. e4-. bf-. | a8-. bf-. a-. g-. e4-. f-. | d2. d4 | \break
    e4 e fs fs | gs gs a a | b b cs cs | a r r2 \section
  }
}

abi_gezunt_tag_line = \lyricmode {
  A -- bi ge -- zunt, ken men glik -- lech
}

melodyLyrics = \lyricmode {
  % empty intro lyrics
  \repeat unfold 16 _
  A bi -- sl zun, a bi -- sl re -- gn. A ru -- ik ort dem kip tzu ley -- gn.
  \abi_gezunt_tag_line zayne. A
}

melodyLyricsLineTwo = \lyricmode {
  \repeat unfold 17 _
  shuch, a zok, a kleyd on la -- tes, in ke -- she -- ne a dray, fir zlo -- tes.
  \abi_gezunt_tag_line \repeat unfold 2 _ zayne. Di luft iz
  fray far _ ye -- dn_ glaych. Di zun zi
  shoynt far ye -- dn ey -- nem. O -- rem od -- er raych. A
  bi -- sl freyd, a bi -- sl la -- chn, a mol mit raynt a shnap -- sl ma -- chn.
  \abi_gezunt_tag_line zayne.
}


bass = {
  \clef bass
  \key d \minor
  \relative c' {
    \grace s8
    r4 d, r d | r2 r4 a-> | r d r d | r2 r4 a-> |
    d r a r | d r a r |
    % a section
    s1*10 |
    % b section
    s1*8 |
    % a section
    s1*8
    % verse
    d'2-> a4-. c-. | bf2-> e4-. bf-. | a8-. bf-. a-. g-. e4-. a-. | d2 r |
    s1*4 |
    d2-> a4-. c-. | bf2-> e4-. bf-. | a8-. bf-. a-. g-. e4-. a-. | d2 r |
    r4 e,,2-> e4->~ | e e2-> e4->~ | e e2-> e4-> | a r r2 |
  }
}

aSectionHarmony = \chordmode {
  d1:m | g2:m6 g:m | d1:m | g:9 |
  d2:m bf | e a:7
}


harmony =
\chordmode {
  s1*4 |
  d1*2:m |
  \aSectionHarmony | d1:m | a:7 | d1*2:m |
  g1*2:m || d:m ||
  g1.:m g2:m6 || a:7 g:m/bf | g/b a:7/cs |
  \aSectionHarmony d1:m | a:7 |
  % verse
  d1:m | g:m6 | a:7 | d:m |
  a:7 | d:m | e:7 | a:7 |
  d:m | g:m6 | a:7 | d:m |
  e | e2:7 a:7 | b:m e:m6 | a1 |
}

\include "../../../templates/lead_sheet_grand_staff.ly"
