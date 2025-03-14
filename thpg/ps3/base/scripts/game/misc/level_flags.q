level_visited = 400
level_visited_story = 197
LEVEL_UNLOCKED_STORY = 198
LEVEL_COMPLETE_STORY = 199
LEVEL_UNLOCKED_CLASSIC = 398
LEVEL_COMPLETE_CLASSIC = 399
FLAG_G_COMP_GEO_ON = 128
flag_proset1_geo_on = 129
FLAG_PROSET2_GEO_ON = 130
FLAG_PROSET3_GEO_ON = 131
FLAG_PROSET4_GEO_ON = 132
FLAG_PROSET5_GEO_ON = 133
FLAG_PROSET6_GEO_ON = 134
FLAG_PROSET7_GEO_ON = 135

script ResetLevelFlags 
	<flag_num> = 0
	begin
	unsetflag flag = <flag_num>
	<flag_num> = (<flag_num> + 1)
	repeat 64
endscript

script IsLevelUnlocked 
	GetGameMode
	switch <gamemode>
		case career
		if GetFlag level = <level> flag = $LEVEL_UNLOCKED_STORY
			return \{unlocked = 1}
		endif
		case classic
		if GetFlag level = <level> flag = $LEVEL_UNLOCKED_CLASSIC
			return \{unlocked = 1}
		endif
		default
		return \{unlocked = 1}
	endswitch
	return \{unlocked = 0}
endscript
