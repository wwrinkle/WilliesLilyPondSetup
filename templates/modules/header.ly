\version "2.24.4"
\language "english"

title = \markup {
  \column {
    \fill-line {
      \fontsize #-1 #part_name \null \null
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
