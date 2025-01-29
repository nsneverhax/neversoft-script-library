
script ui_init_metallifacts 
	0x622f875f
endscript

script ui_create_metallifacts 
	formatText checksumName = metallifacts_global '%s_metallifacts' s = ($permanent_songlist_props.($current_song).Name)
	if NOT GlobalExists Name = <metallifacts_global>

		ui_event_wait \{event = menu_back}
		return
	endif
	if NOT StructureContains structure = ($<metallifacts_global>) array

		ui_event_wait \{event = menu_back}
		return
	endif
	($default_loading_screen.create) spawn
	tier_global = gh4_career_band_songs
	part = Band
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
	RemoveParameter \{part}
	CreateScreenElement {
		Type = descinterface
		id = metallifacts_container
		parent = root_window
		desc = 'metallifacts'
		event_handlers = [
			{pad_back generic_event_back params = {reset_menu_sound}}
		]
		exclusive_device = <exclusive_device>
	}
	metallifacts_container :SetTags {
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
		part = vocals}
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
			if StructureContains structure = <parts> guitar
				part = bass
			endif
		endif
		if (<part> = bass)
			if StructureContains structure = <parts> bass
				part = drum
			endif
		endif
		if (<part> = drum)
			if StructureContains structure = <parts> drum
				part = vocals
			endif
		endif
		if (<part> = vocals)
			if StructureContains structure = <parts> vocals

			endif
		endif
		setplayerinfo <i> part = <part>
		ui_metallifacts_get_random_character Player = <i>
		setplayerinfo <i> character_id = <character_id>
	endif
	i = (<i> + 1)
	repeat 4
	Change \{game_mode = p1_quickplay}
	Change \{current_num_players = 1}
	i = 1
	begin
	formatText checksumName = Tier 'tier%i' i = <i>
	if NOT StructureContains structure = ($<tier_global>) <Tier>
		break
	endif
	GetArraySize ($<tier_global>.<Tier>.songs)
	j = 0
	begin
	if (($<tier_global>.<Tier>.songs [<j>]) = $current_song)
		level = ($<tier_global>.<Tier>.level)
		break
	endif
	j = (<j> + 1)
	repeat <array_Size>
	if GotParam \{level}
		break
	endif
	i = (<i> + 1)
	repeat
	if GotParam \{level}
		Change current_level = <level>
	else
		quickplay_choose_random_venue online_song = ($current_song)
	endif
	metallifacts_container :Obj_SpawnScriptNow \{ui_create_metallifacts_spawned}
endscript

script ui_create_metallifacts_spawned 
	menu_complete_transition
	start_song
	SoundBussUnlock \{User_SFX}
	setsoundbussparams {User_SFX = {vol = (($default_BussSet.User_SFX.vol) - 100)}}
	setsoundbussparams {Countoffs = {vol = (($default_BussSet.Countoffs.vol) - 100)}}
	setsoundbussparams {Crowd_One_Shots = {vol = (($default_BussSet.Crowd_One_Shots.vol) -100)}}
	SoundBussLock \{User_SFX}
	LaunchEvent \{target = metallifacts_container
		Type = focus}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	metallifacts_container :Obj_SpawnScriptNow \{ui_metallifacts_run}
	($default_loading_screen.Destroy)
endscript

script ui_destroy_metallifacts 
	enable_pause
	Change \{is_metallifacts = 0}
	if ScreenElementExists \{id = metallifacts_container}
		metallifacts_container :GetTags
		Change current_num_players = <current_num_players>
		Change game_mode = <game_mode>
		Change current_level = <current_level>
		Change player1_status = <player1_status>
		Change player2_status = <player2_status>
		Change player3_status = <player3_status>
		Change player4_status = <player4_status>
		DestroyScreenElement \{id = metallifacts_container}
		clean_up_user_control_helpers
	endif
endscript

script ui_deinit_metallifacts 
	SoundBussUnlock \{User_SFX}
	setsoundbussparams {User_SFX = {vol = ($default_BussSet.User_SFX.vol)}}
	setsoundbussparams {Countoffs = {vol = ($default_BussSet.Countoffs.vol)}}
	setsoundbussparams {Crowd_One_Shots = {vol = ($default_BussSet.Crowd_One_Shots.vol)}}
	SoundBussLock \{User_SFX}
	SpawnScriptNow \{kill_gem_scroller}
	popvideovenues
	0x29472091
endscript

script ui_metallifacts_run 
	GetSingleTag \{song_metallifacts_struct}
	GetSingleTag \{looptime}
	array = (<song_metallifacts_struct>.array)
	0x23241d2f = 0
	disable_pause
	GetArraySize <array>
	begin
	if (($playing_song_for_real = 1) && (<0x23241d2f> = 0))
		disable_pause
		0x23241d2f = 1
		UnPauseGame
	endif
	GetSongTime
	if NOT CD
		formatText TextName = time_text qs(0x0204c31d) t = <songtime>
		se_setprops time_text = <time_text>
	endif
	songtime = (<songtime> - <looptime>)
	if (<array_Size> > 0)
		i = 0
		begin
		curr = (<array> [<i>])
		if StructureContains structure = <curr> text
			if (((<curr>.time) - 2.0) <= <songtime>)
				se_setprops \{message_text = qs(0x03ac90f0)}
			endif
		endif
		if ((<curr>.time) <= <songtime>)
			if StructureContains structure = <curr> clear_text
				se_setprops \{message_text = qs(0x03ac90f0)}
			endif
			if StructureContains structure = <curr> text
				se_setprops message_text = (<curr>.text)
			endif
			RemoveArrayElement array = <array> index = <i>
			GetArraySize <array>
			break
		endif
		i = (<i> + 1)
		repeat <array_Size>
	else
		metallifacts_container :SetTags looptime = (<songtime> + <looptime>)
		metallifacts_container :Obj_SpawnScriptNow \{ui_metallifacts_run}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script check_if_metallifacts_exists 

	formatText checksumName = metallifacts_global '%s_metallifacts' s = ($permanent_songlist_props.<song>.Name)
	if NOT GlobalExists Name = <metallifacts_global>
		return \{FALSE}
	endif
	return \{true}
endscript

script start_metallifacts 

	hide_glitch \{num_frames = 10}
	Change current_song = <song>
	generic_event_choose \{state = uistate_play_song
		data = {
			metallifacts = 1
		}
		no_sound}
endscript

script debug_metallifacts 

	destroy_all_debug_menus
	start_metallifacts song = <song>
endscript

script ui_metallifacts_get_random_character 

	if (<Player> > ($current_num_players))
		begin
		save_player = RandomInteger (1.0, 4.0)
		if (<save_player> < ($current_num_players + 1))
			break
		endif
		repeat
	endif
	getplayerinfo <save_player> controller
	getsavegamefromcontroller controller = <controller>
	getplayerinfo <Player> part
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
	repeat <Player>
	if (<halt> = 1)
		return {character_id = <new_character_id>}
	endif
	repeat
endscript
