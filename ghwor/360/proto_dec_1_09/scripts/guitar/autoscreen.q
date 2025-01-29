
script autolaunch_for_screenshot \{autoscreen_name = None}
	<num_players> = (($autoscreen_types).<autoscreen_name>.num_players)
	switch (<num_players>)
		case 1
		<part> = guitar
		case 2
		<part> = guitar
		<part2> = bass
		case 3
		<part> = guitar
		<part2> = bass
		<part3> = drum
		case 4
		<part> = guitar
		<part2> = bass
		<part3> = drum
		<part4> = vocals
		default
		ScriptAssert \{qs(0xb5135eb3)}
	endswitch
	setup_4_player_bot
	Change \{show_bot_debug_widgets = 0}
	spawnscript autolaunch_for_screenshot_spawned params = <...>
endscript

script autolaunch_for_screenshot_spawned 
	<autoscreen> = (($autoscreen_types).<autoscreen_name>)
	if StructureContains structure = <autoscreen> init_script
		<init_script> = (<autoscreen>.init_script)
		<init_script>
	endif
	if StructureContains structure = <autoscreen> disable_bots
		setplayerinfo \{1
			bot_play = 0}
		setplayerinfo \{2
			bot_play = 0}
		setplayerinfo \{3
			bot_play = 0}
		setplayerinfo \{4
			bot_play = 0}
	endif
	autolaunch <...>
	begin
	<take_screen> = 0
	switch (<autoscreen>.condition.Type)
		case player_info_condition
		if autoscreen_check_player_info_condition condition = (<autoscreen>.condition)
			<take_screen> = 1
		endif
		case song_condition
		if autoscreen_check_song_condition condition = (<autoscreen>.condition)
			<take_screen> = 1
		endif
		case custom_condition
		<condition_script> = (<autoscreen>.condition.script_name)
		if <condition_script> condition = (<autoscreen>.condition)
			<take_screen> = 1
		endif
		default
		ScriptAssert qs(0x390ab75a) t = (<autoscreen>.condition.Type)
	endswitch
	if (<take_screen> = 1)
		destroybotdebugwidget \{Player = 1}
		SpawnScriptNow autoscreen_capture params = {FileName = (<autoscreen>.FileName) num_captures = (<autoscreen>.num_captures)}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script autoscreen_capture \{num_captures = 3}
	begin
	PauseGame
	printf \{qs(0xc2392d7f)
		channel = Lars}
	Change \{viewer_taking_screenshot = 1}
	hide_analog_options
	if toggle2d \{OFF}
		ScreenShot FileName = <FileName>
		toggle2d \{On}
		Change \{viewer_taking_screenshot = 0}
	else
		ScreenShot FileName = <FileName>
		Change \{viewer_taking_screenshot = 0}
	endif
	Wait \{1
		gameframe}
	UnPauseGame
	repeat <num_captures>
endscript

script autoscreen_check_player_info_condition 
	if StructureContains structure = <condition> required_players
		if autoscreen_check_all_players_met_condition condition = <condition>
			return \{true}
		endif
	else
		if autoscreen_check_any_player_met_condition condition = <condition>
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script autoscreen_check_any_player_met_condition 
	getnumplayersingame
	if (<num_players> < 1)
		return \{FALSE}
	endif
	<element> = (<condition>.element)
	<THRESHOLD> = (<condition>.THRESHOLD)
	<params_struct> = {}
	AddParam Name = 0x00000000 value = <element> structure_name = params_struct
	<Player> = 1
	begin
	getplayerinfo <Player> <params_struct> out = Result
	<Logic> = (<condition>.Logic)
	switch (<Logic>)
		case greater_than
		if (<Result> > <THRESHOLD>)
			return \{true}
		endif
		case less_than
		if (<Result> < <THRESHOLD>)
			return \{true}
		endif
		case equals
		if (<Result> = <THRESHOLD>)
			return \{true}
		endif
		default
		ScriptAssert qs(0x52ee1f31) l = <Logic>
	endswitch
	<Player> = (<Player> + 1)
	repeat <num_players>
	return \{FALSE}
endscript

script autoscreen_check_all_players_met_condition 
	getnumplayersingame
	if (<num_players> < 1)
		return \{FALSE}
	endif
	<required_players> = (<condition>.required_players)
	GetArraySize \{required_players}
	<element> = (<condition>.element)
	<THRESHOLD> = (<condition>.THRESHOLD)
	<params_struct> = {}
	AddParam Name = 0x00000000 value = <element> structure_name = params_struct
	<i> = 0
	<num_players_passed> = 0
	begin
	<Player> = (<required_players> [<i>])
	getplayerinfo <Player> <params_struct> out = Result
	<Logic> = (<condition>.Logic)
	switch (<Logic>)
		case greater_than
		if (<Result> > <THRESHOLD>)
			<num_players_passed> = (<num_players_passed> + 1)
		endif
		case less_than
		if (<Result> < <THRESHOLD>)
			<num_players_passed> = (<num_players_passed> + 1)
		endif
		case equals
		if (<Result> = <THRESHOLD>)
			<num_players_passed> = (<num_players_passed> + 1)
		endif
		default
		ScriptAssert \{qs(0xfedfa365)}
	endswitch
	<i> = (<i> + 1)
	repeat <array_Size>
	if (<num_players_passed> = <array_Size>)
		return \{true}
	endif
	return \{FALSE}
endscript

script autoscreen_check_song_condition 
	if StructureContains structure = <condition> time
		GetSongTime
		if (<time> >= <condition>.time)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script autoscreenshot_band_failed_init 
	setplayerinfo \{1
		bot_play = 0}
	setplayerinfo \{2
		bot_play = 0}
	setplayerinfo \{3
		bot_play = 0}
	setplayerinfo \{4
		bot_play = 0}
endscript

script autoscreenshot_band_failed_condition 
	getnumplayersingame
	if (<num_players> < 1)
		return \{FALSE}
	endif
	<Player> = 1
	<num_dead_players> = 0
	begin
	getplayerinfo <Player> is_dead
	printf qs(0xda6e24fd) n = <Player> X = <is_dead>
	if (<is_dead>)
		<num_dead_players> = (<num_dead_players> + 1)
	endif
	<Player> = (<Player> + 1)
	repeat <num_players>
	if (<num_dead_players> > 1)
		return \{true}
	endif
	return \{FALSE}
endscript
