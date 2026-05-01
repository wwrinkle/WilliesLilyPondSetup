\version "2.26.0"
\language "english"

title = \markup {
  \column {
    \fill-line {
      \fontsize #-1 #partName \null \null
    }
    \fill-line {
      \null
      {
        \override #'(thickness . 6)
        \fontsize #6 \underline
        #title
      }
      \null
    }
    \fill-line {
      #style #sub_title #composer
    }
  }
}

\header {
  title = \title
  tagline = ##f
}
