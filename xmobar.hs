Config {
  font = "-*-terminus-*-r-normal-*-*-120-*-*-*-*-iso8859-*",
  bgColor = "#282828",
  fgColor = "#ebdbb2",
  lowerOnStart = True,
  allDesktops = True,
  commands = 
    [ Run MultiCpu   [ "-t" ,"Cpu:<total0><total1><total2><total3>"
                     ,"--Low","50"
                     ,"--High","85"
                     ,"-h","#fe8019"
                     ,"-l","#ebdbb2"
                     ,"-n","#ebdbb2"
                     ,"-w","3"
                     ] 10

    , Run Memory     [ "-t","Mem: <usedratio>%"
                     ,"-H","8192"
                     ,"-L","4096"
                     ,"-h","#fe8019"
                     ,"-l","#ebdbb2"
                     ,"-n","#ebdbb2"
                     ] 10

    , Run Date "%F (%a) %T" "date" 10

    -- battery monitor
    , Run Battery    [ "--template" , "Batt: <acstatus>"
                     , "--Low"      , "20"        -- units: %
                     , "--High"     , "80"        -- units: %
                     , "--low"      , "#dc5454"
                     , "--normal"   , "#f0bc72"
                     , "--high"     , "#7ea84d"

                     , "--" -- battery specific options
                            -- discharging status
                     , "-o"	, "<left>% (<timeleft>)"
                            -- AC "on" status
                     , "-O" , "<fc=#b5bd68>Charging</fc>"
                            -- charged status
                     , "-i" , "<fc=#7ea84d>Charged</fc>"
                     ] 50

    , Run DynNetwork [ "--template" , "<dev>: <tx>kB/s|<rx>kB/s"
                     , "--Low"      , "1000"       -- units: B/s
                     , "--High"     , "50000"       -- units: B/s
                     ,"-h","#fe8019"
                     ,"-l","#ebdbb2"
                     ,"-n","#ebdbb2"
                     ] 10
    , Run StdinReader
    ],
  sepChar = "%",
  alignSep = "}{",
  template = "%StdinReader% }{ %dynnetwork% | %multicpu% | %memory% | %date% | %battery% "
}
