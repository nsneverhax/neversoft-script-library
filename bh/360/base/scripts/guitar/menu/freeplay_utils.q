
script freeplay_refresh_UI_setup \{async = 0}
	GetMaxLocalPlayers
	check_hud_exists
	if (<hud_exists> = 0)
		return
	endif
	freeplay_get_num_active_vocalists
	freeplay_get_num_playing_vocalists
	freeplay_get_primary_vocalist
	num_dropped_players = 0
	num_paused_players = 0
	num_joining_players = 0
	num_playing_players = 0
	player = 1
	begin
	freeplay_update_player_hiding player = <player>
	GetPlayerInfo <player> freeplay_state
	switch <freeplay_state>
		case dropped
		num_dropped_players = (<num_dropped_players> + 1)
		case joining
		num_joining_players = (<num_joining_players> + 1)
		case paused
		num_paused_players = (<num_paused_players> + 1)
		case playing
		num_playing_players = (<num_playing_players> + 1)
		freeplay_init_menu_state_stack player = <player>
	endswitch
	switch <freeplay_state>
		case joining
		case paused
		SetPlayerInfo <player> guitar_volume = 100
		SetAllDrumStates player = <player> volume = 100
	endswitch
	if PlayerInfoEquals <player> part = vocals
		freeplay_update_vocals_highway {
			player = <player>
			primary_vocalist = <primary_vocalist>
			freeplay_state = <freeplay_state>
		}
	endif
	if freeplay_setup_highway_menu_background player = <player>
		if (<freeplay_state> = joining || <freeplay_state> = paused)
			<menu_background_id> :SE_SetProps light_box_alpha = 0.4 time = 0.3
		else
			<menu_background_id> :SE_SetProps light_box_alpha = 0
		endif
	endif
	GetPlayerInfo <player> controller
	if (<controller> < 4)
		switch <freeplay_state>
			case joining
			case paused
			case playing
			NetSessionFunc func = AddControllers params = {controller = <controller>}
			case dropped
			NetSessionFunc func = RemoveController params = {controller = <controller>}
		endswitch
	endif
	GetPlayerInfo <player> controller
	switch <freeplay_state>
		case playing
		GetPlayerInfo <player> star_power_usable
		if (<star_power_usable> = 0)
			get_highway_hud_menu_parent player = <player>
			if NOT <menu_parent> :GetSingleTag freeplay_debounce_starpower_active
				<menu_parent> :Obj_KillSpawnedScript name = freeplay_debounce_starpower
				<menu_parent> :Obj_SpawnScript freeplay_debounce_starpower params = {player = <player>}
			endif
		endif
		case joining
		case paused
		case dropped
		SetPlayerInfo <player> star_power_usable = 0
	endswitch
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	player = (<player> + 1)
	repeat <max_players>
	if (<num_playing_vocalists> != 1)
		primitive = OG_Vocal_Comet_4P_Freeplay
	else
		primitive = OG_Vocal_Comet
	endif
	ScreenFX_UpdateFXInstanceParams {
		viewport = vocals_visualizer_freeplay
		name = vocals_visualizer_fx_freeplay
		scefName = vocals_visualizer_fx_freeplay
		type = AudioVisualize
		highway_index = 1
		on = 1
		clearColor = [0 0 0 255]
		primitives = ($<primitive>)
	}
	if (<num_active_vocalists> > 0)
		vocals_highway_root :SE_SetProps \{alpha = 1
			motion = ease_out
			time = 0.5}
	else
		if ScreenElementExists \{id = vocals_highway_root}
			vocals_highway_root :SE_SetProps \{alpha = 0}
		endif
	endif
	if ScreenElementExists \{id = attract_screen}
		if (<num_dropped_players> = <max_players>)
			attract_screen :SE_SetProps \{unhide
				alpha = 1}
		else
			attract_screen :SE_SetProps \{unhide
				alpha = 0}
		endif
	endif
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	freeplay_setup_root_helper_pills
	old_sound_state = ($attract_sound_state)
	if (<num_playing_players> > 0)
		new_sound_state = playing
	elseif (<num_paused_players> > 0)
		new_sound_state = paused
	elseif (<num_joining_players> > 0)
		new_sound_state = joining
	else
		new_sound_state = attract
	endif
	if NOT (<new_sound_state> = <old_sound_state>)
		transition_array = ($sound_transitions.<old_sound_state>.<new_sound_state>)
		if NOT GotParam \{transition_array}
			ScriptAssert qs(0x155b7e0b) a = <old_sound_state> b = <new_sound_state>
		endif
		GetArraySize \{transition_array}
		idx = 0
		begin
		transition_type = (<transition_array> [<idx>])
		spawnscriptnow Freeplay_Music_Crowd_Transitions params = {transition = <transition_type>}
		idx = (<idx> + 1)
		repeat <array_size>
		Change attract_sound_state = <new_sound_state>
	endif
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	freeplay_refresh_player_streams
endscript

script freeplay_refresh_player_streams 
	SetupSongDSP \{respect_freeplay}
	UpdateGuitarVolume
	GetMaxLocalPlayers
	player = 1
	begin
	if NOT PlayerInfoEquals <player> freeplay_state = dropped
		RestoreAllDrumStates player = <player>
	endif
	player = (<player> + 1)
	repeat <max_players>
endscript

script freeplay_update_vocalists_interactivity 
	RequireParams \{[
			reason
		]
		all}
	freeplay_get_num_playing_vocalists
	switch <reason>
		case vocalist_started_playing
		if (<num_playing_vocalists> > 0)
			GetMaxLocalPlayers
			player = 1
			begin
			if PlayerInfoEquals <player> part = vocals
				SetPlayerInfo <player> interactive = 1
			endif
			player = (<player> + 1)
			repeat <max_players>
		endif
		case vocalist_stopped_playing
		freeplay_get_num_playing_vocalists
		if (<num_playing_vocalists> = 0)
			GetMaxLocalPlayers
			player = 1
			begin
			if PlayerInfoEquals <player> part = vocals
				LaunchGemEvent event = kill_objects_and_switch_player_non_interactive player = <player>
			endif
			player = (<player> + 1)
			repeat <max_players>
		endif
		default
		ScriptAssert qs(0x4e6c8ac2) s = <reason>
	endswitch
endscript

script freeplay_update_primary_vocalist 
	RequireParams \{[
			reason
			player
		]
		all}
	switch <reason>
		case vocalist_joined
		if ($freeplay_primary_vocalist = -1)
			Change freeplay_primary_vocalist = <player>
		endif
		case vocalist_dropped
		if ($freeplay_primary_vocalist = <player>)
			Change \{freeplay_primary_vocalist = -1}
			GetMaxLocalPlayers
			loop_player = 1
			begin
			if PlayerInfoEquals <loop_player> part = vocals
				if NOT PlayerInfoEquals <loop_player> freeplay_state = dropped
					Change freeplay_primary_vocalist = <loop_player>
					break
				endif
			endif
			loop_player = (<loop_player> + 1)
			repeat <max_players>
		endif
		default
		ScriptAssert qs(0x4e6c8ac2) s = <reason>
	endswitch
endscript

script freeplay_update_vocals_highway 
	RequireParams \{[
			player
			freeplay_state
			primary_vocalist
		]
		all}
	VocalsHighway_GetId player = <player>
	if (<player> = <primary_vocalist>)
		Vocals_SetActiveHighwayPlayerIndex highway = 1 player = <player>
		safe_show id = <vocals_highway_id>
	else
		safe_hide id = <vocals_highway_id>
	endif
	if ($Cheat_PerformanceMode = 1)
		safe_hide id = <vocals_highway_id>
	endif
	if (<freeplay_state> = dropped)
		GetPlayerInfo <player> controller
		if (<controller> < 4)
			SetPlayerInfo <player> mic_type = None
			Vocals_DeinitMic controller = <controller>
		endif
	endif
endscript

script freeplay_has_players 
	GetMaxLocalPlayers
	num_active_players = 0
	player = 1
	begin
	GetPlayerInfo <player> freeplay_state
	if (<freeplay_state> != dropped)
		num_active_players = (<num_active_players> + 1)
	endif
	player = (<player> + 1)
	repeat <max_players>
	if (<num_active_players> > 0)
		return \{true}
	else
		return \{false}
	endif
endscript

script freeplay_get_primary_vocalist 
	return primary_vocalist = ($freeplay_primary_vocalist)
endscript

script freeplay_get_num_active_vocalists 
	GetMaxLocalPlayers
	num_active_vocalists = 0
	player = 1
	begin
	if NOT PlayerInfoEquals <player> freeplay_state = dropped
		if PlayerInfoEquals <player> part = vocals
			num_active_vocalists = (<num_active_vocalists> + 1)
		endif
	endif
	player = (<player> + 1)
	repeat <max_players>
	return num_active_vocalists = <num_active_vocalists>
endscript

script freeplay_get_num_playing_vocalists 
	GetMaxLocalPlayers
	num_playing_vocalists = 0
	player = 1
	begin
	if PlayerInfoEquals <player> freeplay_state = playing
		if PlayerInfoEquals <player> part = vocals
			num_playing_vocalists = (<num_playing_vocalists> + 1)
		endif
	endif
	player = (<player> + 1)
	repeat <max_players>
	return num_playing_vocalists = <num_playing_vocalists>
endscript

script freeplay_get_num_active_players 
	GetMaxLocalPlayers
	num_active_players = 0
	player = 1
	begin
	GetPlayerInfo <player> freeplay_state
	if (<freeplay_state> != dropped)
		num_active_players = (<num_active_players> + 1)
	endif
	player = (<player> + 1)
	repeat <max_players>
	return num_active_players = <num_active_players>
endscript

script freeplay_get_num_playing_players 
	GetMaxLocalPlayers
	num_playing_players = 0
	player = 1
	begin
	GetPlayerInfo <player> freeplay_state
	if (<freeplay_state> = playing)
		num_playing_players = (<num_playing_players> + 1)
	endif
	player = (<player> + 1)
	repeat <max_players>
	return num_playing_players = <num_playing_players>
endscript

script freeplay_get_first_active_player 
	GetMaxLocalPlayers
	player = 1
	begin
	GetPlayerInfo <player> freeplay_state
	if (<freeplay_state> != dropped)
		return player = <player>
	endif
	player = (<player> + 1)
	repeat <max_players>
	return \{player = -1}
endscript

script freeplay_get_next_active_player 
	RequireParams \{[
			player
		]
		all}
	GetMaxLocalPlayers
	begin
	player = (<player> + 1)
	if (<player> > <max_players>)
		return \{player = -1}
	endif
	GetPlayerInfo <player> freeplay_state
	if (<freeplay_state> != dropped)
		return player = <player>
	endif
	repeat
endscript

script freeplay_update_player_hiding 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> freeplay_state
	switch <freeplay_state>
		case dropped
		should_hide_comet = true
		should_hide_player = true
		case joining
		case paused
		should_hide_comet = true
		should_hide_player = false
		case playing
		should_hide_comet = false
		should_hide_player = false
	endswitch
	if NOT PlayerInfoEquals <player> part = vocals
		should_hide_comet = true
	endif
	if ($Cheat_PerformanceMode = 1)
		should_hide_player = true
	endif
	if (<should_hide_player> = true)
		freeplay_hide_player player = <player>
	else
		freeplay_unhide_player player = <player>
	endif
	if (<should_hide_comet> = true)
		Vocals_SetPlayerHighwayIndex player = <player> highway = 0
	else
		Vocals_SetPlayerHighwayIndex player = <player> highway = 1
	endif
endscript

script freeplay_hide_player 
	RequireParams \{[
			player
		]
		all}
	if NOT PlayerInfoEquals <player> part = vocals
		hide_highway_hud player = <player>
		FormatText checksumname = name 'highway_containerp%p' p = <player>
		safe_hide id = <name>
	else
		GetPlayerInfo <player> combo_meter_id
		safe_hide id = <combo_meter_id>
	endif
endscript

script freeplay_unhide_player 
	RequireParams \{[
			player
		]
		all}
	if NOT PlayerInfoEquals <player> part = vocals
		show_highway_hud player = <player>
		FormatText checksumname = name 'highway_containerp%p' p = <player>
		safe_show id = <name>
	else
		GetPlayerInfo <player> combo_meter_id
		if ($Cheat_HUDFreeMode != 1)
			safe_show id = <combo_meter_id>
		endif
	endif
endscript

script freeplay_start_jump_player_in 
	RequireParams \{[
			player
			controller
			auto_join
		]
		all}
	SetPlayerInfo <player> interactive = 0
	SetPlayerInfo <player> freeplay_state = joining
	GetControllerType controller = <controller>
	if (<controller_type> = controller)
		controller_type = vocals
	endif
	SetPlayerInfo <player> difficulty = medium
	freeplay_init_player player = <player> new_part = <controller_type> auto_join = <auto_join>
	if PlayerInfoEquals <player> part = vocals
		freeplay_update_vocalists_interactivity \{reason = vocalist_started_playing}
		freeplay_update_primary_vocalist reason = vocalist_joined player = <player>
	endif
	freeplay_refresh_UI_setup
	switch <controller_type>
		case guitar
		create_freeplay_instrument_menu player = <player>
		case Drum
		create_freeplay_difficulty_menu player = <player> back_target = dropped
		case vocals
		create_freeplay_mic_preference_menu player = <player>
		default
		ScriptAssert qs(0x971cd48d) s = <controller_type>
	endswitch
endscript

script freeplay_instrument_jump_player_in 
	RequireParams \{[
			player
			instrument
		]
		all}
	destroy_freeplay_instrument_menu player = <player>
	freeplay_set_player_part player = <player> part = <instrument>
	create_freeplay_difficulty_menu player = <player> back_target = instrument
endscript

script freeplay_mic_preference_jump_player_in 
	RequireParams \{[
			player
			device_num
			mic_preference
		]
		all}
	switch <mic_preference>
		case mic
		if NOT freeplay_is_any_mic_free
			SoundEvent \{event = UI_SFX_Negative_Select}
			return
		endif
		case headset
		if NOT controller_has_headset controller = <device_num>
			SoundEvent \{event = UI_SFX_Negative_Select}
			return
		endif
	endswitch
	destroy_freeplay_mic_preference_menu player = <player>
	SetPlayerInfo <player> mic_type = None
	SetPlayerInfo <player> mic_preference = <mic_preference>
	vocals_distribute_mics
	VocalsInput_ReinitMic player = <player>
	ui_options_audio_update_mic_volume player = <player>
	if freeplay_is_headset_allowed_for_vocals
		create_freeplay_difficulty_menu player = <player> back_target = mic
	else
		create_freeplay_difficulty_menu player = <player> back_target = dropped
	endif
endscript

script freeplay_finish_jump_player_in 
	RequireParams \{[
			player
			difficulty
		]
		all}
	destroy_freeplay_difficulty_menu player = <player>
	if (<difficulty> = expert_plus)
		SetPlayerInfo <player> double_kick_drum = 1
		difficulty = expert
	else
		SetPlayerInfo <player> double_kick_drum = 0
	endif
	SetPlayerInfo <player> difficulty = <difficulty>
	SetPlayerInfo <player> freeplay_state = playing
	if NOT PlayerInfoEquals <player> part = vocals
		SetPlayerInfo <player> interactive = 1
		GetSongTimeMs
		SetPlayerInfo <player> last_noninteractive_end_time = <time>
	else
		SetPlayerInfo <player> scoring = 1
		freeplay_update_vocalists_interactivity \{reason = vocalist_started_playing}
	endif
	freeplay_refresh_UI_setup
	PlayerSetVolume player = <player> volume = 100 include_drums = 1
endscript

script freeplay_drop_player_out 
	RequireParams \{[
			player
		]
		all}
	SetPlayerInfo <player> interactive = 0
	SetPlayerInfo <player> scoring = 0
	SetPlayerInfo <player> freeplay_state = dropped
	freeplay_destroy_all_possible_menus player = <player>
	if PlayerInfoEquals <player> part = vocals
		SetPlayerInfo <player> mic_type = None
		GetPlayerInfo <player> controller
		Vocals_DeinitMic controller = <controller>
		if PlayerInfoEquals <player> star_power_used = 1
			star_power_deactivate player = <player>
		endif
		freeplay_update_vocalists_interactivity reason = vocalist_stopped_playing player = <player>
		freeplay_update_primary_vocalist reason = vocalist_dropped player = <player>
	endif
	WhammyFXOffAll player = <player>
	freeplay_refresh_UI_setup
	freeplay_refresh_highway_positions old_guy = <player>
endscript

script freeplay_pause_player 
	RequireParams \{[
			player
		]
		all}
	SetPlayerInfo <player> freeplay_state = paused
	if NOT PlayerInfoEquals <player> part = vocals
		LaunchGemEvent event = kill_objects_and_switch_player_non_interactive player = <player>
	else
		SetPlayerInfo <player> scoring = 0
		freeplay_update_vocalists_interactivity \{reason = vocalist_stopped_playing}
	endif
	freeplay_refresh_UI_setup
	WhammyFXOffAll player = <player>
	create_freeplay_pause_menu player = <player>
endscript

script freeplay_resume_player 
	RequireParams \{[
			player
		]
		all}
	SetPlayerInfo <player> freeplay_state = playing
	if NOT PlayerInfoEquals <player> part = vocals
		SetPlayerInfo <player> interactive = 1
		GetSongTimeMs
		SetPlayerInfo <player> last_noninteractive_end_time = <time>
	else
		SetPlayerInfo <player> scoring = 1
		freeplay_update_vocalists_interactivity \{reason = vocalist_started_playing}
	endif
	freeplay_refresh_UI_setup
	PlayerSetVolume player = <player> volume = 100 include_drums = 1
endscript

script freeplay_next_song \{initial_song_list = false}
	if (<initial_song_list> = true)
		GMan_SongFunc \{func = populate_play_list_with_random_songs
			params = {
				play_list_size = 1
			}}
	else
		GMan_SongFunc \{func = populate_play_list_with_random_songs
			params = {
				play_list_size = 2
			}}
	endif
	GMan_SongFunc \{func = switch_to_next_song_in_play_list}
	GMan_SongFunc \{func = remove_played_songs_from_play_list}
endscript

script freeplay_end_of_song 
	GameMode_GetType
	if NOT (<type> = freeplay)
		return
	endif
	freeplay_disable_menus
	star_power_kill_highway_fx_immedately \{player = 1}
	star_power_kill_highway_fx_immedately \{player = 2}
	star_power_kill_highway_fx_immedately \{player = 3}
	star_power_kill_highway_fx_immedately \{player = 4}
	destroy_all_big_bolts
	reset_all_touch_glow
endscript

script freeplay_skip_song 
	RequireParams \{[
			player
		]
		all}
	freeplay_disable_menus
	hide_glitch \{num_frames = 25}
	kill_gem_scroller \{restarting
		freeplay_visualizer_hack}
	destroy_freeplay_menu player = <player>
	freeplay_resume_player player = <player>
	freeplay_next_song
	freeplay_end_of_song
	Change \{gameplay_restart_song = 1}
	Change \{gameplay_loading_transition = 1}
	generic_event_back \{nosound
		state = uistate_gameplay}
endscript

script freeplay_restart_song 
	RequireParams \{[
			player
		]
		all}
	StopRendering
	destroy_freeplay_menu player = <player>
	freeplay_resume_player player = <player>
	freeplay_end_of_song
	Change \{gameplay_restart_song = 1}
	generic_event_back \{state = uistate_gameplay}
endscript

script freeplay_set_player_part 
	RequireParams \{[
			player
			part
		]
		all}
	printf qs(0xad6a0e0d) i = <player> p = <part> channel = persistent_band
	SetPlayerInfo <player> part = <part>
	ExtendCrcPlayer restart_gem_array_events <player> out = event_type
	broadcastevent type = <event_type>
	DifficultyChange player = <player>
	UseFourLaneHighway player = <player> reset
	single_player_check_song_for_zero_difficulty player = <player>
endscript

script freeplay_dropout_player_if_inactive 
	ResetTimeSinceLastInputInteraction player = <player>
	begin
	wait \{5
		seconds}
	if PlayerInfoEquals <player> freeplay_state = dropped
		return
	endif
	if PlayerInfoEquals <player> freeplay_state = dropped
		return
	endif
	if NOT GetTimeSinceLastInputInteraction player = <player>
		return
	endif
	if (<time_since_last_input_interaction> > $freeplay_time_before_automatic_dropout)
		freeplay_drop_player_out player = <player>
		return
	endif
	repeat
endscript

script freeplay_init_player 
	RequireParams \{[
			player
			new_part
			auto_join
		]
		all}
	GetPlayerInfo <player> controller
	GetPlayerInfo <player> part out = old_part
	if (<new_part> != vocals)
		lefty_flip_part = <new_part>
		if (<lefty_flip_part> = bass)
			lefty_flip_part = guitar
		endif
		get_progression_instrument_user_option controller = <controller> part = <lefty_flip_part> option = 'lefty_flip'
		if (<user_option> = 1)
			SetPlayerInfo <player> lefty_flip = 1
		else
			SetPlayerInfo <player> lefty_flip = 0
		endif
		guitar_init_lefty_highway player = <player>
	endif
	FormatText checksumname = widget_context 'player%i_hud' i = <player>
	DetachHUDWidget context = <widget_context>
	if (<old_part> != vocals)
		if (<new_part> != vocals)
			freeplay_switch_player_normal_to_normal player = <player> new_part = <new_part>
		else
			freeplay_switch_player_normal_to_vocals player = <player> new_part = <new_part>
		endif
	else
		if (<new_part> != vocals)
			freeplay_switch_player_vocals_to_normal player = <player> new_part = <new_part>
		else
			freeplay_switch_player_vocals_to_vocals player = <player> new_part = <new_part>
		endif
	endif
	if (<auto_join> = false)
		VocalsHighway_GetId player = <player>
		ResolveScreenElementID id = {<vocals_highway_id> child = 0} param = root
		safe_show id = <root>
	endif
	freeplay_vocals_init_starpower player = <player>
	GetPlayerInfo <player> freeplay_state
	if (<freeplay_state> = joining)
		freeplay_refresh_highway_positions new_guy = <player>
	endif
	get_highway_hud_menu_parent player = <player>
	<menu_parent> :Obj_KillSpawnedScript name = freeplay_dropout_player_if_inactive
	<menu_parent> :Obj_SpawnScript freeplay_dropout_player_if_inactive params = {player = <player>}
	<menu_parent> :Obj_KillSpawnedScript name = freeplay_controller_pulling_observer
	<menu_parent> :Obj_SpawnScript freeplay_controller_pulling_observer params = {player = <player>}
	reset_score player = <player>
endscript

script freeplay_add_player_server_input 
	RequireParams \{[
			player
		]
		all}
	GMan_SongFunc \{func = get_current_song}
	GetPlayerInfo <player> server_id
	GetPlayerInfo <player> controller
	get_song_prefix song = <current_song>
	FormatText checksumname = guitar_stream '%s_guitar' s = <song_prefix> AddToStringLookup = true
	GetPlayerInfo <player> check_time_early
	get_lag_values
	input_offset = ($time_input_offset - <audio_offset>)
	AddPlayerServerInput {
		id = <server_id>
		player = <player>
		controller = <controller>
		guitar_stream = <guitar_stream>
		time_offset = ((<check_time_early> * 1000.0) + <input_offset>)
		song_name = <current_song>
	}
	SetPlayerInfo <player> mic_type = None
	Vocals_DeinitMic controller = <controller>
endscript

script freeplay_add_player_server_highway 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> server_id
	easy_scroll_time = ($difficulty_list_props.easy.scroll_time)
	get_lag_values
	gem_offset = ($time_gem_offset - <video_offset>)
	fill_input_offset = (((<easy_scroll_time> - $destroy_time) * 1000) + <gem_offset> + 1000)
	CastToInteger \{fill_input_offset}
	AddPlayerServerHighway id = <server_id> player = <player> create_highway_only = true fill_input_offset = <fill_input_offset>
endscript

script freeplay_add_player_server_fretbar 
	RequireParams \{[
			player
		]
		all}
	GMan_SongFunc \{func = get_current_song}
	GetPlayerInfo <player> server_id
	GetPlayerInfo <player> scroll_time
	AddPlayerServerFretbarIterator {
		fretbar_id = CreateFretbar
		id = <server_id>
		player = <player>
		thin_fretbars
		use_player_info_time_offset
		fretbar_function = Create2DFretbar
		skipleadin = (<scroll_time> * 1000.0)
		song_name = <current_song>
	}
endscript

script freeplay_switch_player_normal_to_normal 
	RequireParams \{[
			player
			new_part
		]
		all}
	freeplay_set_player_part player = <player> part = <new_part>
	RemovePlayerServerHighway player = <player>
	FormatText checksumname = name 'highway_containerp%p' p = <player>
	DestroyScreenElement id = <name>
	destroy_highway_hud player = <player>
	RemovePlayerServerInput player = <player>
	setup_highway player = <player> skip_highway_move = true
	freeplay_add_player_server_highway player = <player>
	morph_scroll_speed player = <player> difficulty = medium blend_time = 0
	freeplay_add_player_server_input player = <player>
endscript

script freeplay_switch_player_vocals_to_vocals 
	RequireParams \{[
			player
			new_part
		]
		all}
	RemovePlayerServerHighway player = <player>
	RemovePlayerServerInput player = <player>
	vocal_highway_hud_destroy_combo_meter player = <player>
	vocals_destroy_highway player = <player>
	freeplay_add_player_server_input player = <player>
	freeplay_add_player_server_highway player = <player>
endscript

script freeplay_switch_player_normal_to_vocals 
	RequireParams \{[
			player
			new_part
		]
		all}
	destroy_highway_hud player = <player>
	freeplay_set_player_part player = <player> part = <new_part>
	RemovePlayerServerHighway player = <player>
	RemovePlayerServerInput player = <player>
	freeplay_add_player_server_input player = <player>
	GetPlayerInfo <player> server_id
	RemovePlayerServerFretbarIterator fretbar_id = CreateFretbar id = <server_id>
	FormatText checksumname = name 'highway_containerp%p' p = <player>
	DestroyScreenElement id = <name>
	freeplay_add_player_server_highway player = <player>
endscript

script freeplay_switch_player_vocals_to_normal 
	RequireParams \{[
			player
			new_part
		]
		all}
	vocals_destroy_highway player = <player>
	freeplay_set_player_part player = <player> part = <new_part>
	RemovePlayerServerHighway player = <player>
	RemovePlayerServerInput player = <player>
	vocal_highway_hud_destroy_combo_meter player = <player>
	freeplay_add_player_server_fretbar player = <player>
	setup_highway player = <player> skip_highway_move = true
	freeplay_add_player_server_highway player = <player>
	morph_scroll_speed player = <player> difficulty = medium blend_time = 0
	freeplay_add_player_server_input player = <player>
endscript

script freeplay_refresh_highway_positions \{new_guy = -1
		old_guy = -1}
	GetMaxLocalPlayers
	if (<new_guy> != -1)
		GetPlayerInfo <new_guy> part out = new_guy_part
		player = 1
		begin
		if (<player> = <new_guy>)
			freeplay_update_logical_position_for_jump_in player = <player> new_guy = 1
		else
			GetPlayerInfo <player> part
			new_guy_highway_type_matches_player_highway = false
			if (<new_guy_part> = vocals)
				if (<part> = vocals)
					new_guy_highway_type_matches_player_highway = true
				endif
			else
				if (<part> != vocals)
					new_guy_highway_type_matches_player_highway = true
				endif
			endif
			if (<new_guy_highway_type_matches_player_highway> = true)
				freeplay_update_logical_position_for_jump_in player = <player> new_guy = 0
			endif
		endif
		player = (<player> + 1)
		repeat <max_players>
	elseif (<old_guy> != -1)
		GetPlayerInfo <old_guy> part
		if (<part> != vocals)
			GetPlayerInfo <old_guy> highway_position
		else
			GetPlayerInfo <old_guy> vocals_slot
		endif
		player = 1
		begin
		freeplay_update_logical_position_for_jump_out player = <player> free_highway_position = <highway_position> free_vocals_slot = <vocals_slot>
		player = (<player> + 1)
		repeat <max_players>
	endif
	force_highways_to_actual_positions new_guy = <new_guy>
endscript

script freeplay_update_logical_position_for_jump_in \{new_guy = 0}
	RequireParams \{[
			player
		]}
	GetPlayerInfo <player> freeplay_state
	GetPlayerInfo <player> part
	if (<new_guy> = 1)
		freeplay_state = new_guy
	endif
	if NOT (<part> = vocals)
		freeplay_get_num_visible_highways
		GetPlayerInfo <player> highway_position
		switch <freeplay_state>
			case dropped
			switch <num_highways>
				case 1
				SetPlayerInfo <player> highway_position = center
				case 2
				case 3
				case 4
				SetPlayerInfo <player> highway_position = right
			endswitch
			case new_guy
			switch <num_highways>
				case 1
				SetPlayerInfo <player> highway_position = center
				case 2
				case 3
				case 4
				SetPlayerInfo <player> highway_position = right
			endswitch
			case joining
			case paused
			case playing
			switch <num_highways>
				case 1
				SetPlayerInfo <player> highway_position = center
				case 2
				SetPlayerInfo <player> highway_position = left
				case 3
				switch <highway_position>
					case right
					SetPlayerInfo <player> highway_position = center
					case left
					SetPlayerInfo <player> highway_position = left
				endswitch
				case 4
				switch <highway_position>
					case center
					SetPlayerInfo <player> highway_position = leftcenter
					case right
					SetPlayerInfo <player> highway_position = rightcenter
					case left
					SetPlayerInfo <player> highway_position = left
				endswitch
			endswitch
		endswitch
	else
		freeplay_get_num_active_vocalists
		GetPlayerInfo <player> vocals_slot
		switch <freeplay_state>
			case dropped
			SetPlayerInfo <player> vocals_slot = 0
			case new_guy
			SetPlayerInfo <player> vocals_slot = (<num_active_vocalists> - 1)
			case joining
			case paused
			case playing
			SetPlayerInfo <player> vocals_slot = <vocals_slot>
		endswitch
		GetPlayerInfo <player> vocals_slot
		if (<vocals_slot> < 0)
			dbreak
		endif
	endif
endscript

script freeplay_update_logical_position_for_jump_out 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> freeplay_state
	GetPlayerInfo <player> part
	if NOT (<part> = vocals)
		if NOT GotParam \{free_highway_position}
			return
		endif
		freeplay_get_num_visible_highways
		GetPlayerInfo <player> highway_position
		switch <freeplay_state>
			case dropped
			switch <num_highways>
				case 0
				case 1
				SetPlayerInfo <player> highway_position = center
				case 2
				case 3
				SetPlayerInfo <player> highway_position = right
			endswitch
			case joining
			case paused
			case playing
			switch <num_highways>
				case 1
				SetPlayerInfo <player> highway_position = center
				case 2
				switch <free_highway_position>
					case left
					switch <highway_position>
						case center
						SetPlayerInfo <player> highway_position = left
					endswitch
					case right
					switch <highway_position>
						case center
						SetPlayerInfo <player> highway_position = right
					endswitch
				endswitch
				case 3
				switch <free_highway_position>
					case left
					switch <highway_position>
						case leftcenter
						SetPlayerInfo <player> highway_position = left
						case rightcenter
						SetPlayerInfo <player> highway_position = center
					endswitch
					case right
					switch <highway_position>
						case leftcenter
						SetPlayerInfo <player> highway_position = center
						case rightcenter
						SetPlayerInfo <player> highway_position = right
					endswitch
					case leftcenter
					switch <highway_position>
						case rightcenter
						SetPlayerInfo <player> highway_position = center
					endswitch
					case rightcenter
					switch <highway_position>
						case leftcenter
						SetPlayerInfo <player> highway_position = center
					endswitch
				endswitch
			endswitch
		endswitch
	else
		if NOT GotParam \{free_vocals_slot}
			return
		endif
		freeplay_get_num_active_vocalists
		GetPlayerInfo <player> vocals_slot
		switch <freeplay_state>
			case dropped
			SetPlayerInfo <player> vocals_slot = 0
			case joining
			case paused
			case playing
			if (<vocals_slot> < <free_vocals_slot>)
				SetPlayerInfo <player> vocals_slot = <vocals_slot>
			else
				SetPlayerInfo <player> vocals_slot = (<vocals_slot> - 1)
			endif
		endswitch
		GetPlayerInfo <player> vocals_slot
		if (<vocals_slot> < 0)
			dbreak
		endif
	endif
endscript

script force_highways_to_actual_positions \{new_guy = -1}
	GetMaxLocalPlayers
	player = 1
	begin
	snap = false
	if (<player> = <new_guy>)
		snap = true
	endif
	freeplay_update_actual_position player = <player> snap = <snap>
	player = (<player> + 1)
	repeat <max_players>
endscript

script freeplay_update_actual_position \{time = 0
		ignore_scale = 0
		snap = false}
	RequireParams \{[
			player
		]}
	Pos = (0.0, 0.0)
	freeplay_get_num_visible_highways
	if (<num_highways> < 1)
		num_highways = 1
	endif
	GetPlayerInfo <player> freeplay_state
	GetPlayerInfo <player> part
	if (<part> = vocals)
		GetPlayerInfo <player> vocals_slot
		x_pos = (($vocal_player_vocals_slot_params [<vocals_slot>]).x_pos)
		GetPlayerInfo <player> combo_meter_id
		<combo_meter_id> :GetSingleTag dest_x_pos
		if NOT (<dest_x_pos> = x_pos)
			<combo_meter_id> :GetSingleTag curr_x_pos
			if (<snap> = false)
				start_x_pos = <curr_x_pos>
			else
				start_x_pos = <x_pos>
			endif
			<combo_meter_id> :SetTags {
				start_x_pos = <start_x_pos>
				dest_x_pos = <x_pos>
				lerping_factor = 0
			}
		endif
	else
		GetPlayerInfo <player> highway_position
		highway_scale_chart = ($highway_scale_chart [<num_highways> - 1])
		hw_x_scale = (<highway_scale_chart>.hw_x_scale)
		hw_y_scale = (<highway_scale_chart>.hw_y_scale)
		x_pos = (<highway_scale_chart>.<highway_position>.x_pos)
		y_pos = 0
		extra_offset_factor = (<highway_scale_chart>.extra_offset_factor)
		FormatText checksumname = container_id 'highway_containerp%p' p = <player>
		if ScreenElementExists id = <container_id>
			<container_id> :GetSingleTag dest_x_pos
			if NOT (<dest_x_pos> = x_pos)
				<container_id> :GetSingleTag curr_x_pos
				<container_id> :GetSingleTag curr_y_pos
				<container_id> :GetSingleTag curr_extra_offset_factor
				<container_id> :GetSingleTag curr_x_scale
				<container_id> :GetSingleTag curr_y_scale
				<container_id> :GetSingleTag curr_heightOffsetFactor
				<container_id> :GetSingleTag curr_heightOffsetExp
				start_y_pos = <curr_y_pos>
				if (<snap> = false)
					start_x_pos = <curr_x_pos>
					start_extra_offset_factor = <curr_extra_offset_factor>
					start_x_scale = <curr_x_scale>
					start_y_scale = <curr_y_scale>
					start_heightOffsetFactor = <curr_heightOffsetFactor>
					start_heightOffsetExp = <curr_heightOffsetExp>
				else
					start_x_pos = <x_pos>
					start_extra_offset_factor = <extra_offset_factor>
					start_x_scale = <hw_x_scale>
					start_y_scale = <hw_y_scale>
					start_heightOffsetFactor = (<highway_scale_chart>.perspectivefact)
					start_heightOffsetExp = (<highway_scale_chart>.perspectiveexp)
				endif
				<container_id> :SetTags {
					start_x_pos = <start_x_pos>
					start_y_pos = <start_y_pos>
					start_extra_offset_factor = <start_extra_offset_factor>
					start_x_scale = <start_x_scale>
					start_y_scale = <start_y_scale>
					start_heightOffsetFactor = <start_heightOffsetFactor>
					start_heightOffsetExp = <start_heightOffsetExp>
					dest_x_pos = <x_pos>
					dest_y_pos = <y_pos>
					dest_extra_offset_factor = <extra_offset_factor>
					dest_x_scale = <hw_x_scale>
					dest_y_scale = <hw_y_scale>
					dest_heightOffsetFactor = (<highway_scale_chart>.perspectivefact)
					dest_heightOffsetExp = (<highway_scale_chart>.perspectiveexp)
					lerping_factor = 0
				}
			endif
		endif
	endif
	return Pos = <Pos>
endscript

script freeplay_get_num_visible_highways 
	GetMaxLocalPlayers
	num_highways = 0
	player = 1
	begin
	GetPlayerInfo <player> part
	GetPlayerInfo <player> freeplay_state
	switch <freeplay_state>
		case joining
		case paused
		case playing
		if (<part> != vocals)
			num_highways = (<num_highways> + 1)
		endif
	endswitch
	player = (<player> + 1)
	repeat <max_players>
	return num_highways = <num_highways>
endscript

script freeplay_is_any_mic_free 
	GetMaxLocalPlayers
	idx = 0
	begin
	FormatText checksumname = mic 'mic%i' i = <idx>
	if IsMicrophonePluggedIn number = <idx>
		player = 1
		mic_used = false
		begin
		if PlayerInfoEquals <player> mic_type = <mic>
			mic_used = true
			break
		endif
		player = (<player> + 1)
		repeat <max_players>
		if (<mic_used> = false)
			return \{true}
		endif
	endif
	idx = (<idx> + 1)
	repeat 4
	return \{false}
endscript

script freeplay_vocals_activate_star_power 
	RequireParams \{[
			player
		]
		all}
	this_player = <player>
	GetNumPlayersInGame \{on_screen}
	GetFirstPlayer \{on_screen}
	begin
	if PlayerInfoEquals <player> part = vocals
		Vocals_GetActiveHighwayIndex player = <player>
		if (<active_highway_index> = 1)
			spawnscriptnow Create_Vocals_Star_Power_Effect params = {player = <player>}
		endif
	endif
	GetNextPlayer player = <player> on_screen
	repeat <num_players_shown>
endscript

script freeplay_vocals_deactivate_star_power 
	RequireParams \{[
			player
		]
		all}
	if vocals_is_last_player_in_starpower_on_highway player = <player>
		spawnscriptnow Kill_Vocals_Star_Power_Effect params = {player = <player>}
		this_player = <player>
		GetNumPlayersInGame \{on_screen}
		GetFirstPlayer \{on_screen}
		begin
		if PlayerInfoEquals <player> part = vocals
			Vocals_GetActiveHighwayIndex player = <player>
			spawnscriptnow Kill_Vocals_Star_Power_Effect params = {player = <player>}
		endif
		GetNextPlayer player = <player> on_screen
		repeat <num_players_shown>
	endif
endscript

script freeplay_vocals_init_starpower 
	RequireParams \{[
			player
		]
		all}
	this_player = <player>
	GetNumPlayersInGame \{on_screen}
	GetFirstPlayer \{on_screen}
	begin
	if NOT (<player> = <this_player>)
		if PlayerInfoEquals <player> part = vocals
			if PlayerInfoEquals <player> star_power_used = 1
				spawnscriptnow Create_Vocals_Star_Power_Effect params = {player = <this_player>}
				return
			endif
		endif
	endif
	GetNextPlayer player = <player> on_screen
	repeat <num_players_shown>
endscript

script freeplay_is_headset_allowed_for_vocals 
	if IsXenonOrWinDX
		return \{true}
	else
		return \{false}
	endif
endscript

script freeplay_debounce_starpower 
	RequireParams \{[
			player
		]
		all}
	OnExitRun freeplay_debounce_starpower_exit params = {player = <player>}
	SetTags \{freeplay_debounce_starpower_active}
	wait \{0.5
		seconds}
endscript

script freeplay_debounce_starpower_exit 
	SetPlayerInfo <player> star_power_usable = 1
	RemoveTags \{[
			freeplay_debounce_starpower_active
		]}
endscript

script freeplay_debug_auto_drop_in_out \{time = 0.3}
	ui_freeplay_jump_in \{device_num = 1}
	wait <time> second
	ui_freeplay_jump_in \{device_num = 0}
	wait <time> second
	ui_freeplay_jump_in \{device_num = 2}
	wait <time> second
	ui_freeplay_jump_in \{device_num = 3}
	wait <time> second
	LaunchEvent \{type = pad_back
		data = {
			device_num = 1
		}}
	wait <time> second
	LaunchEvent \{type = pad_back
		data = {
			device_num = 0
		}}
	wait <time> second
	LaunchEvent \{type = pad_back
		data = {
			device_num = 2
		}}
	wait <time> second
	LaunchEvent \{type = pad_back
		data = {
			device_num = 3
		}}
endscript

script use_alternate_if_in_freeplay 
	if ($game_mode = freeplay)
		return \{true}
	else
		return \{false}
	endif
endscript

script gameplay_state_decision_script 
	if ($game_mode = freeplay)
		return \{true
			alternate_pakname = 'band_lobby'}
	elseif ($game_mode = tutorial)
		return \{true
			no_pak}
	else
		return \{false}
	endif
endscript

script freeplay_unpause_sound \{freeplay_create = false}
	UnMuteEffectSend Slot = ($venue_sendeffect_slot)
	VocalDSPSetParams \{unmute_all}
	if (<freeplay_create> = false)
		GH3_SFX_Stop_Sounds_For_KillSong \{type = Normal}
	endif
	UnPauseSoundsByBuss \{Master}
endscript
