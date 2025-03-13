
script autolaunch_for_screenshot \{autoscreen_name = none}
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
		scriptassert \{qs(0xb5135eb3)}
	endswitch
	setup_4_player_bot
	change \{show_bot_debug_widgets = 0}
	spawnscript autolaunch_for_screenshot_spawned params = <...>
endscript

script autolaunch_for_screenshot_spawned 
	<autoscreen> = (($autoscreen_types).<autoscreen_name>)
	if structurecontains structure = <autoscreen> init_script
		<init_script> = (<autoscreen>.init_script)
		<init_script>
	endif
	if structurecontains structure = <autoscreen> disable_bots
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
	switch (<autoscreen>.condition.type)
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
		scriptassert qs(0x390ab75a) t = (<autoscreen>.condition.type)
	endswitch
	if (<take_screen> = 1)
		destroybotdebugwidget \{player = 1}
		spawnscriptnow autoscreen_capture params = {filename = (<autoscreen>.filename) num_captures = (<autoscreen>.num_captures)}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script autoscreen_capture \{num_captures = 3}
	begin
	pausegame
	printf \{qs(0xc2392d7f)
		channel = lars}
	change \{viewer_taking_screenshot = 1}
	hide_analog_options
	if toggle2d \{off}
		screenshot filename = <filename>
		toggle2d \{on}
		change \{viewer_taking_screenshot = 0}
	else
		screenshot filename = <filename>
		change \{viewer_taking_screenshot = 0}
	endif
	wait \{1
		gameframe}
	unpausegame
	repeat <num_captures>
endscript

script autoscreen_check_player_info_condition 
	if structurecontains structure = <condition> required_players
		if autoscreen_check_all_players_met_condition condition = <condition>
			return \{true}
		endif
	else
		if autoscreen_check_any_player_met_condition condition = <condition>
			return \{true}
		endif
	endif
	return \{false}
endscript

script autoscreen_check_any_player_met_condition 
	getnumplayersingame
	if (<num_players> < 1)
		return \{false}
	endif
	<element> = (<condition>.element)
	<threshold> = (<condition>.threshold)
	<params_struct> = {}
	addparam name = 0x00000000 value = <element> structure_name = params_struct
	<player> = 1
	begin
	getplayerinfo <player> <params_struct> out = result
	<logic> = (<condition>.logic)
	switch (<logic>)
		case greater_than
		if (<result> > <threshold>)
			return \{true}
		endif
		case less_than
		if (<result> < <threshold>)
			return \{true}
		endif
		case equals
		if (<result> = <threshold>)
			return \{true}
		endif
		default
		scriptassert qs(0x52ee1f31) l = <logic>
	endswitch
	<player> = (<player> + 1)
	repeat <num_players>
	return \{false}
endscript

script autoscreen_check_all_players_met_condition 
	getnumplayersingame
	if (<num_players> < 1)
		return \{false}
	endif
	<required_players> = (<condition>.required_players)
	getarraysize \{required_players}
	<element> = (<condition>.element)
	<threshold> = (<condition>.threshold)
	<params_struct> = {}
	addparam name = 0x00000000 value = <element> structure_name = params_struct
	<i> = 0
	<num_players_passed> = 0
	begin
	<player> = (<required_players> [<i>])
	getplayerinfo <player> <params_struct> out = result
	<logic> = (<condition>.logic)
	switch (<logic>)
		case greater_than
		if (<result> > <threshold>)
			<num_players_passed> = (<num_players_passed> + 1)
		endif
		case less_than
		if (<result> < <threshold>)
			<num_players_passed> = (<num_players_passed> + 1)
		endif
		case equals
		if (<result> = <threshold>)
			<num_players_passed> = (<num_players_passed> + 1)
		endif
		default
		scriptassert \{qs(0xfedfa365)}
	endswitch
	<i> = (<i> + 1)
	repeat <array_size>
	if (<num_players_passed> = <array_size>)
		return \{true}
	endif
	return \{false}
endscript

script autoscreen_check_song_condition 
	if structurecontains structure = <condition> time
		getsongtime
		if (<time> >= <condition>.time)
			return \{true}
		endif
	endif
	return \{false}
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
		return \{false}
	endif
	<player> = 1
	<num_dead_players> = 0
	begin
	getplayerinfo <player> is_dead
	printf qs(0xda6e24fd) n = <player> x = <is_dead>
	if (<is_dead>)
		<num_dead_players> = (<num_dead_players> + 1)
	endif
	<player> = (<player> + 1)
	repeat <num_players>
	if (<num_dead_players> > 1)
		return \{true}
	endif
	return \{false}
endscript
