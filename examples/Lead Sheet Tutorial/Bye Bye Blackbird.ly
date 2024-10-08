\version "2.24.4"
\language "english"

\header {
  title = "Bye Bye Blackbird"
  composer = "Henderson/Dixon"
}

\score {
  <<
    \new ChordNames \chordmode {
      f1*2:maj7 | g2:m7 c:7 | f1:6 |
      f/a | af:dim7 | g2:m7 c1.:7 |
      g1:m | g:m7+ | g:m7 | g:m6 |
      g:m7 | c:7 | f1*2:6 |
      f1:7 | e:9 | ef:9 | d:7 |
      g1*2:m7 | g1:m7.5- | c:7 |
      f1*2:maj7 | ef1:7 | d:7 |
      g1.:m7 c2:7 | f1:6 | g2:m7 c:7 |
    }
    \relative c' {
      \key f \major
      \numericTimeSignature
      a'4 a a a | bf a a2 | a4 g g2 | g4 f f2 \break
      f1 | g | f2 e~ | e1 \section \break
      bf'4 bf bf bf | c bf bf2 | bf4 a a2 | a4 g g2 \break
      g1 | a | g2 f~ | f1 \section \break
      f4 c' c c | c bf a g g1 | fs \break
      d4 bf' bf bf |bf a g f | f1 | e \section \break
      a4 a a a | a bf a2 | a4 g g2 | g4 fs fs2 \break
      g2 bf~ | bf e, | f1 | r \fine
    }
  >>
}