
script ui_init_popup_video 
endscript

script ui_create_popup_video 
	menu_start_transition
	formattext checksumname = popup_global '%s_popup_video' s = ($permanent_songlist_props.($current_song).name)
	if NOT globalexists name = <popup_global>
		printf qs(0x6f95c936) s = ($permanent_songlist_props.($current_song).name)
		ui_event_wait \{event = menu_back}
		return
	endif
	if NOT structurecontains structure = ($<popup_global>) array
		printf qs(0xd3e6ef3e) s = ($permanent_songlist_props.($current_song).name)
		ui_event_wait \{event = menu_back}
		return
	endif
	createscreenelement \{type = descinterface
		id = popup_video_container
		parent = root_window
		desc = 'popup_video'
		event_handlers = [
			{
				pad_back
				generic_event_back
			}
		]}
	popup_video_container :settags {
		current_num_players = ($current_num_players)
		game_mode = ($game_mode)
		current_level = ($current_level)
		player1_status = ($player1_status)
		player2_status = ($player2_status)
		player3_status = ($player3_status)
		player4_status = ($player4_status)
		song_popup_struct = ($<popup_global>)
	}
	setplayerinfo \{1
		bot_play = 1}
	setplayerinfo \{2
		bot_play = 1}
	setplayerinfo \{3
		bot_play = 1}
	setplayerinfo \{4
		bot_play = 1}
	setplayerinfo \{1
		difficulty = expert}
	setplayerinfo \{2
		difficulty = expert}
	setplayerinfo \{3
		difficulty = expert}
	setplayerinfo \{3
		double_kick_drum = 1}
	setplayerinfo \{4
		difficulty = expert}
	i = 1
	begin
	if (<i> > ($current_num_players))
		parts = {}
		j = 1
		begin
		getplayerinfo <j> part
		parts = {<parts> <part>}
		j = (<j> + 1)
		repeat (<i> - 1)
		part = guitar
		if (<part> = guitar)
			if structurecontains structure = <parts> guitar
				part = bass
			endif
		endif
		if (<part> = bass)
			if structurecontains structure = <parts> bass
				part = drum
			endif
		endif
		if (<part> = drum)
			if structurecontains structure = <parts> drum
				part = vocals
			endif
		endif
		if (<part> = vocals)
			if structurecontains structure = <parts> vocals
				scriptassert \{qs(0xe3f077c7)}
			endif
		endif
		printstruct <...> channel = what
		setplayerinfo <i> part = <part>
		ui_popup_get_random_character player = <i>
		setplayerinfo <i> character_id = <character_id>
	endif
	i = (<i> + 1)
	repeat 4
	change \{game_mode = p4_quickplay}
	change \{current_num_players = 4}
	if structurecontains structure = ($<popup_global>) level
		change current_level = ($<popup_global>.level)
	endif
	popup_video_container :obj_spawnscript \{ui_create_popup_video_spawned}
endscript

script ui_create_popup_video_spawned 
	($default_loading_screen.create)
	menu_complete_transition
	start_song
	soundbussunlock \{user_sfx}
	setsoundbussparams {user_sfx = {vol = (($default_bussset.user_sfx.vol) - 100)}}
	setsoundbussparams {countoffs = {vol = (($default_bussset.countoffs.vol) - 100)}}
	soundbusslock \{user_sfx}
	launchevent \{target = popup_video_container
		type = focus}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	popup_video_container :obj_spawnscript \{ui_popup_video_run}
	($default_loading_screen.destroy)
endscript

script ui_destroy_popup_video 
	if screenelementexists \{id = popup_video_container}
		popup_video_container :gettags
		change current_num_players = <current_num_players>
		change game_mode = <game_mode>
		change current_level = <current_level>
		change player1_status = <player1_status>
		change player2_status = <player2_status>
		change player3_status = <player3_status>
		change player4_status = <player4_status>
		destroyscreenelement \{id = popup_video_container}
		clean_up_user_control_helpers
	endif
endscript

script ui_deinit_popup_video 
	soundbussunlock \{user_sfx}
	setsoundbussparams {user_sfx = {vol = (($default_bussset.user_sfx.vol))}}
	setsoundbussparams {countoffs = {vol = (($default_bussset.countoffs.vol))}}
	soundbusslock \{user_sfx}
	spawnscriptnow \{kill_gem_scroller}
endscript

script ui_popup_video_run 
	getsingletag \{song_popup_struct}
	array = (<song_popup_struct>.array)
	removeparameter \{song_popup_array}
	getarraysize <array>
	begin
	getsongtime
	formattext textname = time_text qs(0x0204c31d) t = <songtime>
	se_setprops time_text = <time_text>
	if (<array_size> > 0)
		i = 0
		begin
		curr = (<array> [<i>])
		if structurecontains structure = <curr> text
			if (((<curr>.time) - 2.0) <= <songtime>)
				se_setprops \{message_text = qs(0x03ac90f0)}
			endif
		endif
		if ((<curr>.time) <= <songtime>)
			if structurecontains structure = <curr> clear_text
				se_setprops \{message_text = qs(0x03ac90f0)}
			endif
			if structurecontains structure = <curr> text
				se_setprops message_text = (<curr>.text)
			endif
			removearrayelement array = <array> index = <i>
			getarraysize <array>
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	else
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script check_if_popup_video_exists 
	requireparams \{[
			song
		]
		all}
	formattext checksumname = popup_global '%s_popup_video' s = ($permanent_songlist_props.<song>.name)
	if NOT globalexists name = <popup_global>
		return \{false}
	endif
	return \{true}
endscript

script start_popup_video 
	requireparams \{[
			song
		]
		all}
	change current_song = <song>
	generic_event_choose \{state = uistate_play_song
		data = {
			popup_video = 1
		}}
endscript

script debug_popup_video 
	requireparams \{[
			song
		]
		all}
	destroy_all_debug_menus
	change current_song = <song_name>
	generic_event_choose \{state = uistate_play_song
		data = {
			popup_video = 1
		}}
endscript

script ui_popup_get_random_character 
	requireparams \{[
			player
		]
		all}
	if (<player> > ($current_num_players))
		begin
		save_player = RandomInteger (1.0, 4.0)
		if (<save_player> < ($current_num_players + 1))
			break
		endif
		repeat
	endif
	getplayerinfo <save_player> controller
	getsavegamefromcontroller controller = <controller>
	getplayerinfo <player> part
	begin
	if (Random (@ 0 @ 1 @ 2 )= 0)
		if NOT cas_get_random_car savegame = <savegame> controller = <controller>
			cas_get_random_preset_character savegame = <savegame> controller = <controller> part = <part>
		endif
	else
		cas_get_random_preset_character savegame = <savegame> controller = <controller> part = <part>
	endif
	new_character_id = <character_id>
	halt = 1
	i = 1
	begin
	getplayerinfo <i> character_id
	if (<character_id> = <new_character_id>)
		halt = 0
		break
	endif
	repeat <player>
	if (<halt> = 1)
		return {character_id = <new_character_id>}
	endif
	repeat
endscript
