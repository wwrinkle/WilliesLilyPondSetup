% Lily was here -- automatically converted by midi2ly from files/Brass Band/Tenessee Whiskey.midi
\version "2.14.0"

\layout {
  \context {
    \Voice
    \remove Note_heads_engraver
    \consists Completion_heads_engraver
    \remove Rest_engraver
    \consists Completion_rest_engraver
  }
}

trackAchannelA = {


  \key ees \major
    
  \set Staff.instrumentName = "Tennessee Whiskey Dillon/Hargrove"
  
  % [TEXT_EVENT] creator: 
  
  % [TEXT_EVENT] LilyPond 2.24.4               
  
  \time 12/8 
  
  \tempo 4 = 90 
  \skip 8*51 
}

trackA = <<
  \context Voice = voiceA \trackAchannelA
>>


trackBchannelA = {
  \skip 8*51 
}

trackBchannelB = \relative c {
  r4. <ees' g bes >8*5 <aes c ees >8 <ees g bes >2. <f aes ees' c >1. 
  | % 3
  <aes c f ees > 
  | % 4
  <ees g bes > 
  | % 5
  
}

trackB = <<
  \context Voice = voiceA \trackBchannelA
  \context Voice = voiceB \trackBchannelB
>>


trackCchannelA = {
  
  \set Staff.instrumentName = ":melody"
  
  % [INSTRUMENT_NAME] acoustic grand
  

  \key ees \major
  \skip 8*51 
}

trackCchannelB = {
  
  \set Staff.instrumentName = ":bass"
  
  % [INSTRUMENT_NAME] acoustic bass
  

  \key ees \major
  \skip 4. 
}

trackCchannelC = \relative c {
  bes'8 c ees g2. r4. 
  | % 2
  g8 f ees g f8*5 r2 g8 g ees2. r2 
  | % 4
  g8 g ees2. 
}

trackC = <<
  \context Voice = voiceA \trackCchannelA
  \context Voice = voiceB \trackCchannelB
  \context Voice = voiceC \trackCchannelC
>>


\score {
  <<
    \context Staff=trackB \trackA
    \context Staff=trackB \trackB
    \context Staff=trackC \trackA
    \context Staff=trackC \trackC
  >>
  \layout {}
  \midi {}
}
