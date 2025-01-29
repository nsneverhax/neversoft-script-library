
script ui_init_popup_video 
	0x622f875f
endscript

script ui_create_popup_video 
	menu_start_transition
	formatText checksumName = popup_global '%s_popup_video' s = ($permanent_songlist_props.($current_song).Name)
	if NOT GlobalExists Name = <popup_global>
		printf qs(0x6f95c936) s = ($permanent_songlist_props.($current_song).Name)
		ui_event_wait \{event = menu_back}
		return
	endif
	if NOT StructureContains structure = ($<popup_global>) array
		printf qs(0xd3e6ef3e) s = ($permanent_songlist_props.($current_song).Name)
		ui_event_wait \{event = menu_back}
		return
	endif
	CreateScreenElement \{Type = descinterface
		id = popup_video_container
		parent = root_window
		desc = 'metallifacts'
		event_handlers = [
			{
				pad_back
				generic_event_back
			}
		]}
	popup_video_container :SetTags {
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
				ScriptAssert \{qs(0xe3f077c7)}
			endif
		endif
		printstruct <...> channel = what
		setplayerinfo <i> part = <part>
		ui_popup_get_random_character Player = <i>
		setplayerinfo <i> character_id = <character_id>
	endif
	i = (<i> + 1)
	repeat 4
	Change \{game_mode = p4_quickplay}
	Change \{current_num_players = 4}
	if StructureContains structure = ($<popup_global>) level
		Change current_level = ($<popup_global>.level)
	endif
	popup_video_container :obj_spawnscript \{ui_create_popup_video_spawned}
endscript

script ui_create_popup_video_spawned 
	($default_loading_screen.create)
	menu_complete_transition
	start_song
	SoundBussUnlock \{User_SFX}
	setsoundbussparams {User_SFX = {vol = (($default_BussSet.User_SFX.vol) - 100)}}
	setsoundbussparams {Countoffs = {vol = (($default_BussSet.Countoffs.vol) - 100)}}
	SoundBussLock \{User_SFX}
	LaunchEvent \{target = popup_video_container
		Type = focus}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	popup_video_container :obj_spawnscript \{ui_popup_video_run}
	($default_loading_screen.Destroy)
endscript

script ui_destroy_popup_video 
	if ScreenElementExists \{id = popup_video_container}
		popup_video_container :GetTags
		Change current_num_players = <current_num_players>
		Change game_mode = <game_mode>
		Change current_level = <current_level>
		Change player1_status = <player1_status>
		Change player2_status = <player2_status>
		Change player3_status = <player3_status>
		Change player4_status = <player4_status>
		DestroyScreenElement \{id = popup_video_container}
		clean_up_user_control_helpers
	endif
endscript

script ui_deinit_popup_video 
	SoundBussUnlock \{User_SFX}
	setsoundbussparams {User_SFX = {vol = (($default_BussSet.User_SFX.vol))}}
	setsoundbussparams {Countoffs = {vol = (($default_BussSet.Countoffs.vol))}}
	SoundBussLock \{User_SFX}
	SpawnScriptNow \{kill_gem_scroller}
	popvideovenues
endscript

script ui_popup_video_run 
	GetSingleTag \{song_popup_struct}
	array = (<song_popup_struct>.array)
	RemoveParameter \{song_popup_array}
	GetArraySize <array>
	begin
	GetSongTime
	formatText TextName = time_text qs(0x0204c31d) t = <songtime>
	se_setprops time_text = <time_text>
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
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script check_if_popup_video_exists 
	RequireParams \{[
			song
		]
		all}
	formatText checksumName = popup_global '%s_popup_video' s = ($permanent_songlist_props.<song>.Name)
	if NOT GlobalExists Name = <popup_global>
		return \{FALSE}
	endif
	return \{true}
endscript

script start_popup_video 
	RequireParams \{[
			song
		]
		all}
	Change current_song = <song>
	generic_event_choose \{state = uistate_play_song
		data = {
			popup_video = 1
		}}
endscript

script debug_popup_video 
	RequireParams \{[
			song
		]
		all}
	destroy_all_debug_menus
	start_popup_video song = <song> level = load_z_tushino
endscript

script 0x6a52a2a9 
	ui_state_pak_load \{pakname = 'gig_posters'}
	generic_event_back
endscript

script ui_popup_get_random_character 
	RequireParams \{[
			Player
		]
		all}
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
