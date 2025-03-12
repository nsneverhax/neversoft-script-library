
script ui_init_metallifacts 
endscript

script ui_create_metallifacts 
	menu_start_transition
	formattext checksumname = metallifacts_global '%s_metallifacts' s = ($permanent_songlist_props.($current_song).name)
	if NOT globalexists name = <metallifacts_global>
		printf qs(0xdc96dccd) s = ($permanent_songlist_props.($current_song).name)
		ui_event_wait \{event = menu_back}
		return
	endif
	if NOT structurecontains structure = ($<metallifacts_global>) array
		printf qs(0xd68daf49) s = ($permanent_songlist_props.($current_song).name)
		ui_event_wait \{event = menu_back}
		return
	endif
	($default_loading_screen.create) spawn
	tier_global = gh4_career_band_songs
	part = band
	get_all_exclusive_devices
	if (($current_num_players = 1))
		getplayerinfo \{1
			part}
		getplayerinfo \{1
			controller}
		exclusive_device = <controller>
	endif
	if (<part> = guitar)
		tier_global = gh4_career_guitar_songs
	elseif (<part> = bass)
		tier_global = gh4_career_bass_songs
	elseif (<part> = drum)
		tier_global = gh4_career_drum_songs
	elseif (<part> = vocals)
		tier_global = gh4_career_vocals_songs
	endif
	removeparameter \{part}
	createscreenelement {
		type = descinterface
		id = metallifacts_container
		parent = root_window
		desc = 'metallifacts'
		event_handlers = [
			{pad_back generic_event_back params = {reset_menu_sound}}
		]
		exclusive_device = <exclusive_device>
	}
	metallifacts_container :settags {
		current_num_players = ($current_num_players)
		game_mode = ($game_mode)
		current_level = ($current_level)
		player1_status = ($player1_status)
		player2_status = ($player2_status)
		player3_status = ($player3_status)
		player4_status = ($player4_status)
		song_metallifacts_struct = ($<metallifacts_global>)
		looptime = 0
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
		difficulty = easy_rhythm}
	setplayerinfo \{2
		difficulty = easy_rhythm}
	setplayerinfo \{3
		difficulty = easy_rhythm}
	setplayerinfo \{4
		difficulty = easy_rhythm}
	setplayerinfo \{1
		double_kick_drum = 0}
	setplayerinfo \{2
		double_kick_drum = 0}
	setplayerinfo \{3
		double_kick_drum = 0}
	setplayerinfo \{4
		double_kick_drum = 0}
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
		setplayerinfo <i> part = <part>
		ui_metallifacts_get_random_character player = <i>
		setplayerinfo <i> character_id = <character_id>
	endif
	i = (<i> + 1)
	repeat 4
	change \{game_mode = p4_quickplay}
	change \{current_num_players = 4}
	i = 1
	begin
	formattext checksumname = tier 'tier%i' i = <i>
	if NOT structurecontains structure = ($<tier_global>) <tier>
		break
	endif
	getarraysize ($<tier_global>.<tier>.songs)
	j = 0
	begin
	if (($<tier_global>.<tier>.songs [<j>]) = $current_song)
		level = ($<tier_global>.<tier>.level)
		break
	endif
	j = (<j> + 1)
	repeat <array_size>
	if gotparam \{level}
		break
	endif
	i = (<i> + 1)
	repeat
	if gotparam \{level}
		change current_level = <level>
	else
		quickplay_choose_random_venue online_song = ($current_song)
	endif
	metallifacts_container :obj_spawnscriptnow \{ui_create_metallifacts_spawned}
endscript

script ui_create_metallifacts_spawned 
	menu_complete_transition
	start_song
	soundbussunlock \{user_sfx}
	setsoundbussparams {user_sfx = {vol = (($default_bussset.user_sfx.vol) - 100)}}
	setsoundbussparams {countoffs = {vol = (($default_bussset.countoffs.vol) - 100)}}
	setsoundbussparams {crowd_one_shots = {vol = (($default_bussset.crowd_one_shots.vol) -100)}}
	soundbusslock \{user_sfx}
	launchevent \{target = metallifacts_container
		type = focus}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	metallifacts_container :obj_spawnscriptnow \{ui_metallifacts_run}
	($default_loading_screen.destroy)
endscript

script ui_destroy_metallifacts 
	change \{is_metallifacts = 0}
	if screenelementexists \{id = metallifacts_container}
		metallifacts_container :gettags
		change current_num_players = <current_num_players>
		change game_mode = <game_mode>
		change current_level = <current_level>
		change player1_status = <player1_status>
		change player2_status = <player2_status>
		change player3_status = <player3_status>
		change player4_status = <player4_status>
		destroyscreenelement \{id = metallifacts_container}
		clean_up_user_control_helpers
	endif
endscript

script ui_deinit_metallifacts 
	soundbussunlock \{user_sfx}
	setsoundbussparams {user_sfx = {vol = ($default_bussset.user_sfx.vol)}}
	setsoundbussparams {countoffs = {vol = ($default_bussset.countoffs.vol)}}
	setsoundbussparams {crowd_one_shots = {vol = ($default_bussset.crowd_one_shots.vol)}}
	soundbusslock \{user_sfx}
	spawnscriptnow \{kill_gem_scroller}
endscript

script ui_metallifacts_run 
	getsingletag \{song_metallifacts_struct}
	getsingletag \{looptime}
	array = (<song_metallifacts_struct>.array)
	getarraysize <array>
	begin
	getsongtime
	if NOT cd
		formattext textname = time_text qs(0x0204c31d) t = <songtime>
		se_setprops time_text = <time_text>
	endif
	songtime = (<songtime> - <looptime>)
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
		metallifacts_container :settags looptime = (<songtime> + <looptime>)
		metallifacts_container :obj_spawnscriptnow \{ui_metallifacts_run}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script check_if_metallifacts_exists 
	requireparams \{[
			song
		]
		all}
	formattext checksumname = metallifacts_global '%s_metallifacts' s = ($permanent_songlist_props.<song>.name)
	if NOT globalexists name = <metallifacts_global>
		return \{false}
	endif
	return \{true}
endscript

script start_metallifacts 
	requireparams \{[
			song
		]
		all}
	hide_glitch \{num_frames = 10}
	change current_song = <song>
	generic_event_choose \{state = uistate_play_song
		data = {
			metallifacts = 1
		}}
endscript

script debug_metallifacts 
	requireparams \{[
			song
		]
		all}
	destroy_all_debug_menus
	start_metallifacts song = <song>
endscript

script ui_metallifacts_get_random_character 
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
	if (<part> = vocals)
		get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
		get_is_female_from_appearance appearance = (<profile_struct>.appearance)
		if (<is_female> = 1)
			halt = 0
		endif
	endif
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
