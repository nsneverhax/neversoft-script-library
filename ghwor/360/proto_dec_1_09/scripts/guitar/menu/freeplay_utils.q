
script freeplay_refresh_ui_setup \{async = 0}
	getmaxlocalplayers
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
	Player = 1
	begin
	freeplay_update_player_hiding Player = <Player>
	getplayerinfo <Player> freeplay_state
	switch <freeplay_state>
		case dropped
		num_dropped_players = (<num_dropped_players> + 1)
		case joining
		num_joining_players = (<num_joining_players> + 1)
		case paused
		num_paused_players = (<num_paused_players> + 1)
		case playing
		num_playing_players = (<num_playing_players> + 1)
		freeplay_init_menu_state_stack Player = <Player>
	endswitch
	switch <freeplay_state>
		case joining
		case paused
		setplayerinfo <Player> guitar_volume = 100
		setalldrumstates Player = <Player> Volume = 100
	endswitch
	if playerinfoequals <Player> part = vocals
		freeplay_update_vocals_highway {
			Player = <Player>
			primary_vocalist = <primary_vocalist>
			freeplay_state = <freeplay_state>
		}
	endif
	if freeplay_setup_highway_menu_background Player = <Player>
		if (<freeplay_state> = joining || <freeplay_state> = paused)
			<menu_background_id> :se_setprops light_box_alpha = 1 time = 0.3
		else
			<menu_background_id> :se_setprops light_box_alpha = 0
		endif
	endif
	getplayerinfo <Player> controller
	if (<controller> < 4)
		switch <freeplay_state>
			case joining
			case paused
			case playing
			NetSessionFunc func = addcontrollers params = {controller = <controller>}
			case dropped
			NetSessionFunc func = removecontroller params = {controller = <controller>}
		endswitch
	endif
	switch <freeplay_state>
		case playing
		getplayerinfo <Player> star_power_usable
		if (<star_power_usable> = 0)
			get_highway_hud_menu_parent Player = <Player>
			if NOT <menu_parent> :GetSingleTag freeplay_debounce_starpower_active
				<menu_parent> :Obj_KillSpawnedScript Name = freeplay_debounce_starpower
				<menu_parent> :obj_spawnscript freeplay_debounce_starpower params = {Player = <Player>}
			endif
		endif
		case joining
		case paused
		case dropped
		setplayerinfo <Player> star_power_usable = 0
	endswitch
	if (<async> = 1)
		Wait \{1
			gameframe}
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	if (<num_playing_vocalists> != 1)
		primitive = og_vocal_comet_4p_freeplay
	else
		primitive = og_vocal_comet
	endif
	if screenFX_FXInstanceExists \{viewport = vocals_visualizer_freeplay
			Name = vocals_visualizer_fx_freeplay}
		ScreenFX_UpdateFXInstanceParams {
			viewport = vocals_visualizer_freeplay
			Name = vocals_visualizer_fx_freeplay
			scefName = vocals_visualizer_fx_freeplay
			Type = audiovisualize
			highway_index = 1
			On = 1
			clearcolor = [0 0 0 255]
			primitives = ($<primitive>)
		}
	endif
	if (<num_active_vocalists> > 0)
		vocals_highway_root :se_setprops \{alpha = 1
			motion = ease_out
			time = 0.5}
	else
		if ScreenElementExists \{id = vocals_highway_root}
			vocals_highway_root :se_setprops \{alpha = 0}
		endif
	endif
	if ScreenElementExists \{id = attract_screen}
		if (<num_dropped_players> = <max_players>)
			attract_screen :se_setprops \{unhide
				alpha = 1}
		else
			attract_screen :se_setprops \{unhide
				alpha = 0}
		endif
	endif
	if (<async> = 1)
		Wait \{1
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
		SpawnScriptNow audio_freeplay_music_and_crowd_transitions params = {transition = <transition_type>}
		idx = (<idx> + 1)
		repeat <array_Size>
		Change attract_sound_state = <new_sound_state>
	endif
	if (<async> = 1)
		Wait \{1
			gameframe}
	endif
	freeplay_refresh_player_streams
endscript

script freeplay_refresh_player_streams 
	if ($playing_song = 1)
		songaudiosetupdsp \{respect_freeplay}
		UpdateGuitarVolume
		getmaxlocalplayers
		Player = 1
		begin
		if NOT playerinfoequals <Player> freeplay_state = dropped
			restorealldrumstates Player = <Player>
		endif
		Player = (<Player> + 1)
		repeat <max_players>
	endif
endscript

script freeplay_update_vocalists_interactivity \{reason = !q1768515945}
	freeplay_get_num_playing_vocalists
	switch <reason>
		case vocalist_started_playing
		if (<num_playing_vocalists> > 0)
			getmaxlocalplayers
			Player = 1
			begin
			if playerinfoequals <Player> part = vocals
				setplayerinfo <Player> interactive = 1
			endif
			Player = (<Player> + 1)
			repeat <max_players>
		endif
		case vocalist_stopped_playing
		freeplay_get_num_playing_vocalists
		if (<num_playing_vocalists> = 0)
			getmaxlocalplayers
			Player = 1
			begin
			if playerinfoequals <Player> part = vocals
				LaunchGemEvent event = kill_objects_and_switch_player_non_interactive Player = <Player>
			endif
			Player = (<Player> + 1)
			repeat <max_players>
		endif
		default
		ScriptAssert qs(0x4e6c8ac2) s = <reason>
	endswitch
endscript

script freeplay_update_primary_vocalist \{Player = !i1768515945
		reason = !q1768515945}
	switch <reason>
		case vocalist_joined
		if ($freeplay_primary_vocalist = -1)
			Change freeplay_primary_vocalist = <Player>
		endif
		case vocalist_dropped
		if ($freeplay_primary_vocalist = <Player>)
			Change \{freeplay_primary_vocalist = -1}
			getmaxlocalplayers
			loop_player = 1
			begin
			if playerinfoequals <loop_player> part = vocals
				if NOT playerinfoequals <loop_player> freeplay_state = dropped
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

script freeplay_update_vocals_highway \{Player = !i1768515945
		primary_vocalist = !i1768515945
		freeplay_state = !q1768515945}
	vocalshighway_getid Player = <Player>
	if (<Player> = <primary_vocalist>)
		vocals_setactivehighwayplayerindex highway = 1 Player = <Player>
		safe_show id = <vocals_highway_id>
	else
		safe_hide id = <vocals_highway_id>
	endif
	if ($Cheat_PerformanceMode = 1)
		safe_hide id = <vocals_highway_id>
	endif
	if (<freeplay_state> = dropped)
		getplayerinfo <Player> controller
		if (<controller> < 4)
			setplayerinfo <Player> mic_type = None
			vocals_deinitmic controller = <controller>
		endif
	endif
endscript

script freeplay_has_players 
	getmaxlocalplayers
	num_active_players = 0
	Player = 1
	begin
	getplayerinfo <Player> freeplay_state
	if (<freeplay_state> != dropped)
		num_active_players = (<num_active_players> + 1)
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	if (<num_active_players> > 0)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script freeplay_get_primary_vocalist 
	return primary_vocalist = ($freeplay_primary_vocalist)
endscript

script freeplay_get_num_active_vocalists 
	getmaxlocalplayers
	num_active_vocalists = 0
	Player = 1
	begin
	if NOT playerinfoequals <Player> freeplay_state = dropped
		if playerinfoequals <Player> part = vocals
			num_active_vocalists = (<num_active_vocalists> + 1)
		endif
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	return num_active_vocalists = <num_active_vocalists>
endscript

script freeplay_get_num_playing_vocalists 
	getmaxlocalplayers
	num_playing_vocalists = 0
	Player = 1
	begin
	if playerinfoequals <Player> freeplay_state = playing
		if playerinfoequals <Player> part = vocals
			num_playing_vocalists = (<num_playing_vocalists> + 1)
		endif
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	return num_playing_vocalists = <num_playing_vocalists>
endscript

script freeplay_get_num_active_players 
	getmaxlocalplayers
	num_active_players = 0
	Player = 1
	begin
	getplayerinfo <Player> freeplay_state
	if (<freeplay_state> != dropped)
		num_active_players = (<num_active_players> + 1)
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	return num_active_players = <num_active_players>
endscript

script freeplay_get_num_playing_players 
	getmaxlocalplayers
	num_playing_players = 0
	Player = 1
	begin
	getplayerinfo <Player> freeplay_state
	if (<freeplay_state> = playing)
		num_playing_players = (<num_playing_players> + 1)
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	return num_playing_players = <num_playing_players>
endscript

script freeplay_get_first_active_player 
	getmaxlocalplayers
	Player = 1
	begin
	getplayerinfo <Player> freeplay_state
	if (<freeplay_state> != dropped)
		return Player = <Player>
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	return \{Player = -1}
endscript

script freeplay_get_next_active_player \{Player = !i1768515945}
	getmaxlocalplayers
	begin
	Player = (<Player> + 1)
	if (<Player> > <max_players>)
		return \{Player = -1}
	endif
	getplayerinfo <Player> freeplay_state
	if (<freeplay_state> != dropped)
		return Player = <Player>
	endif
	repeat
endscript

script freeplay_update_player_hiding \{Player = !i1768515945}
	getplayerinfo <Player> freeplay_state
	switch <freeplay_state>
		case dropped
		should_hide_comet = true
		should_hide_player = true
		case joining
		case paused
		should_hide_comet = true
		should_hide_player = FALSE
		case playing
		should_hide_comet = FALSE
		should_hide_player = FALSE
	endswitch
	if NOT playerinfoequals <Player> part = vocals
		should_hide_comet = true
	endif
	if ($Cheat_PerformanceMode = 1)
		should_hide_player = true
	endif
	if (<should_hide_player> = true)
		freeplay_hide_player Player = <Player>
	else
		freeplay_unhide_player Player = <Player>
	endif
	if (<should_hide_comet> = true)
		vocals_setplayerhighwayindex Player = <Player> highway = 0
	else
		vocals_setplayerhighwayindex Player = <Player> highway = 1
	endif
endscript

script freeplay_hide_player \{Player = !i1768515945}
	if NOT playerinfoequals <Player> part = vocals
		hide_highway_hud Player = <Player>
		formatText checksumName = Name 'highway_containerp%p' p = <Player>
		safe_hide id = <Name>
	else
		getplayerinfo <Player> combo_meter_id
		safe_hide id = <combo_meter_id>
	endif
endscript

script freeplay_unhide_player \{Player = !i1768515945}
	if NOT playerinfoequals <Player> part = vocals
		show_highway_hud Player = <Player>
		formatText checksumName = Name 'highway_containerp%p' p = <Player>
		safe_show id = <Name>
	else
		getplayerinfo <Player> combo_meter_id
		if ($cheat_hudfreemode != 1)
			safe_show id = <combo_meter_id>
		endif
	endif
endscript

script freeplay_start_jump_player_in \{Player = !i1768515945
		controller = !i1768515945
		auto_join = !q1768515945}
	setplayerinfo <Player> interactive = 0
	setplayerinfo <Player> freeplay_state = joining
	getcontrollertype controller = <controller>
	if (<controller_type> = controller)
		if ($allow_controller_for_all_instruments = 1)
			controller_type = guitar
		else
			controller_type = vocals
		endif
	endif
	setplayerinfo <Player> difficulty = medium
	setplayerinfo <Player> double_kick_drum = 0
	freeplay_init_player Player = <Player> new_part = <controller_type> auto_join = <auto_join>
	if playerinfoequals <Player> part = vocals
		freeplay_update_vocalists_interactivity \{reason = vocalist_started_playing}
		freeplay_update_primary_vocalist reason = vocalist_joined Player = <Player>
	endif
	freeplay_refresh_ui_setup
	togglebotdebugwidget \{action = OFF}
	switch <controller_type>
		case guitar
		create_freeplay_instrument_menu Player = <Player>
		case drum
		create_freeplay_difficulty_menu Player = <Player> back_target = dropped
		case vocals
		create_freeplay_mic_preference_menu Player = <Player>
		default
		ScriptAssert qs(0x971cd48d) s = <controller_type>
	endswitch
endscript

script freeplay_instrument_jump_player_in \{Player = !i1768515945
		instrument = !q1768515945}
	destroy_freeplay_instrument_menu Player = <Player>
	freeplay_set_player_part Player = <Player> part = <instrument>
	create_freeplay_difficulty_menu Player = <Player> back_target = instrument
endscript

script freeplay_mic_preference_jump_player_in \{Player = !i1768515945
		device_num = !i1768515945
		mic_preference = !q1768515945}
	getplayerinfo <Player> bot_play
	if NOT (<bot_play> = 1)
		switch <mic_preference>
			case mic
			if NOT freeplay_is_any_mic_free
				ui_sfx \{menustate = freeplay
					uitype = negativeselect}
				return
			endif
			case headset
			if NOT controller_has_headset controller = <device_num>
				ui_sfx \{menustate = freeplay
					uitype = negativeselect}
				return
			endif
		endswitch
	endif
	destroy_freeplay_mic_preference_menu Player = <Player>
	setplayerinfo <Player> mic_type = None
	setplayerinfo <Player> mic_preference = <mic_preference>
	vocals_distribute_mics
	vocalsinput_reinitmic Player = <Player>
	ui_options_audio_update_mic_volume Player = <Player>
	if freeplay_is_headset_allowed_for_vocals
		create_freeplay_difficulty_menu Player = <Player> back_target = mic
	else
		create_freeplay_difficulty_menu Player = <Player> back_target = dropped
	endif
endscript

script freeplay_finish_jump_player_in \{Player = !i1768515945
		difficulty = !q1768515945}
	destroy_freeplay_difficulty_menu Player = <Player>
	togglebotdebugwidget \{action = On}
	if (<difficulty> = expert_plus)
		setplayerinfo <Player> double_kick_drum = 1
		difficulty = expert
	else
		setplayerinfo <Player> double_kick_drum = 0
	endif
	setplayerinfo <Player> difficulty = <difficulty>
	setplayerinfo <Player> freeplay_state = playing
	if NOT playerinfoequals <Player> part = vocals
		setplayerinfo <Player> interactive = 1
		GetSongTimeMs
		setplayerinfo <Player> last_noninteractive_end_time = <time>
	else
		setplayerinfo <Player> scoring = 1
		freeplay_update_vocalists_interactivity \{reason = vocalist_started_playing}
	endif
	freeplay_refresh_ui_setup
	playersetvolume Player = <Player> Volume = 100 include_drums = 1
endscript

script freeplay_drop_player_out \{Player = !i1768515945}
	setplayerinfo <Player> interactive = 0
	setplayerinfo <Player> scoring = 0
	setplayerinfo <Player> freeplay_state = dropped
	freeplay_destroy_all_possible_menus Player = <Player>
	if playerinfoequals <Player> part = vocals
		setplayerinfo <Player> mic_type = None
		getplayerinfo <Player> controller
		vocals_deinitmic controller = <controller>
		if playerinfoequals <Player> star_power_used = 1
			star_power_deactivate Player = <Player>
		endif
		freeplay_update_vocalists_interactivity reason = vocalist_stopped_playing Player = <Player>
		freeplay_update_primary_vocalist reason = vocalist_dropped Player = <Player>
	endif
	WhammyFXOffAll Player = <Player>
	freeplay_refresh_ui_setup
	freeplay_refresh_highway_positions old_guy = <Player>
endscript

script freeplay_pause_player \{Player = !i1768515945}
	setplayerinfo <Player> freeplay_state = paused
	togglebotdebugwidget \{action = OFF}
	if NOT playerinfoequals <Player> part = vocals
		LaunchGemEvent event = kill_objects_and_switch_player_non_interactive Player = <Player>
	else
		setplayerinfo <Player> scoring = 0
		freeplay_update_vocalists_interactivity \{reason = vocalist_stopped_playing}
	endif
	freeplay_refresh_ui_setup
	WhammyFXOffAll Player = <Player>
	create_freeplay_pause_menu Player = <Player>
endscript

script freeplay_resume_player \{Player = !i1768515945}
	setplayerinfo <Player> freeplay_state = playing
	togglebotdebugwidget \{action = On}
	if NOT playerinfoequals <Player> part = vocals
		setplayerinfo <Player> interactive = 1
		GetSongTimeMs
		setplayerinfo <Player> last_noninteractive_end_time = <time>
	else
		setplayerinfo <Player> scoring = 1
		freeplay_update_vocalists_interactivity \{reason = vocalist_started_playing}
	endif
	freeplay_refresh_ui_setup
	playersetvolume Player = <Player> Volume = 100 include_drums = 1
endscript

script freeplay_next_song \{initial_song_list = FALSE}
	if (<initial_song_list> = FALSE)
		playlist_getcurrentsong
		freeplay :freeplayuistack_marksongasplayed song_name = <current_song>
	endif
	if (<initial_song_list> = true)
		playlist_populate \{play_list_size = 1}
	else
		playlist_populate \{play_list_size = 2
			filter_songs_script = freeplay_filter_songs}
	endif
	playlist_switchtonextsong
	playlist_removeplayedsongs
endscript

script freeplay_filter_songs \{song = !q1768515945}
	if freeplay :freeplayuistack_issongplayed song_name = <song>
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script freeplay_end_of_song 
	gamemode_gettype
	if NOT (<Type> = freeplay)
		return
	endif
	freeplay_disable_menus
	star_power_kill_highway_fx_immedately \{Player = 1}
	star_power_kill_highway_fx_immedately \{Player = 2}
	star_power_kill_highway_fx_immedately \{Player = 3}
	star_power_kill_highway_fx_immedately \{Player = 4}
	destroy_all_big_bolts
	reset_all_touch_glow
endscript

script freeplay_skip_song \{Player = !i1768515945}
	ui_sfx \{menustate = freeplay
		uitype = select}
	freeplay_disable_menus
	hide_glitch \{num_frames = 25}
	kill_gem_scroller \{restarting
		freeplay_visualizer_hack}
	destroy_freeplay_menu Player = <Player>
	freeplay_resume_player Player = <Player>
	freeplay_next_song
	freeplay_end_of_song
	Change \{gameplay_restart_song = 1}
	Change \{gameplay_loading_transition = 1}
	generic_event_back \{state = Uistate_gameplay}
endscript

script freeplay_restart_song \{Player = !i1768515945}
	if NOT GotParam \{no_sound}
		ui_sfx \{menustate = freeplay
			uitype = select}
	endif
	StopRendering
	destroy_freeplay_menu Player = <Player>
	freeplay_resume_player Player = <Player>
	freeplay_end_of_song
	Change \{gameplay_restart_song = 1}
	generic_event_back \{state = Uistate_gameplay}
endscript

script freeplay_change_venue \{Player = !i1768515945
		zone = !q1768515945}
	ui_sfx \{menustate = freeplay
		uitype = select}
	pushdisablerendering \{context = freeplay_venue_change
		Type = unchecked}
	Change current_level = <zone>
	freeplay :freeplayuistack_clearnumsongssincevenuechange
	create_loading_screen
	freeplay_restart_song Player = <Player> no_sound
endscript

script freeplay_set_player_part \{Player = !i1768515945
		part = !q1768515945}
	printf qs(0xad6a0e0d) i = <Player> p = <part> channel = persistent_band
	setplayerinfo <Player> part = <part>
	extendcrcplayer restart_gem_array_events <Player> out = event_type
	broadcastevent Type = <event_type>
	difficultychange Player = <Player>
	usefourlanehighway Player = <Player> reset
	setup_instrument_stored_part
	single_player_check_song_for_zero_difficulty Player = <Player>
endscript

script freeplay_dropout_player_if_inactive 
	resettimesincelastinputinteraction Player = <Player>
	begin
	Wait \{5
		Seconds}
	if playerinfoequals <Player> freeplay_state = dropped
		return
	endif
	if playerinfoequals <Player> freeplay_state = dropped
		return
	endif
	if NOT gettimesincelastinputinteraction Player = <Player>
		return
	endif
	if (<time_since_last_input_interaction> > $freeplay_time_before_automatic_dropout)
		freeplay_drop_player_out Player = <Player>
		return
	endif
	repeat
endscript

script freeplay_init_player \{Player = !i1768515945
		new_part = !q1768515945
		auto_join = !q1768515945}
	getplayerinfo <Player> controller
	getplayerinfo <Player> part out = old_part
	if (<new_part> != vocals)
		lefty_flip_part = <new_part>
		if (<lefty_flip_part> = bass)
			lefty_flip_part = guitar
		endif
		get_progression_instrument_user_option controller = <controller> part = <lefty_flip_part> option = 'lefty_flip'
		if (<user_option> = 1)
			setplayerinfo <Player> lefty_flip = 1
		else
			setplayerinfo <Player> lefty_flip = 0
		endif
		guitar_init_lefty_highway Player = <Player>
	endif
	formatText checksumName = widget_context 'player%i_hud' i = <Player>
	detachhudwidget context = <widget_context>
	if (<old_part> != vocals)
		if (<new_part> != vocals)
			freeplay_switch_player_normal_to_normal Player = <Player> new_part = <new_part>
		else
			freeplay_switch_player_normal_to_vocals Player = <Player> new_part = <new_part>
		endif
	else
		if (<new_part> != vocals)
			freeplay_switch_player_vocals_to_normal Player = <Player> new_part = <new_part>
		else
			freeplay_switch_player_vocals_to_vocals Player = <Player> new_part = <new_part>
		endif
	endif
	if (<auto_join> = FALSE)
		vocalshighway_getid Player = <Player>
		ResolveScreenElementID id = {<vocals_highway_id> child = 0} param = root
		safe_show id = <root>
	endif
	freeplay_vocals_init_starpower Player = <Player>
	getplayerinfo <Player> freeplay_state
	if (<freeplay_state> = joining)
		freeplay_refresh_highway_positions new_guy = <Player>
	endif
	get_highway_hud_menu_parent Player = <Player>
	<menu_parent> :Obj_KillSpawnedScript Name = freeplay_dropout_player_if_inactive
	<menu_parent> :obj_spawnscript freeplay_dropout_player_if_inactive params = {Player = <Player>}
	<menu_parent> :Obj_KillSpawnedScript Name = freeplay_controller_pulling_observer
	<menu_parent> :obj_spawnscript freeplay_controller_pulling_observer params = {Player = <Player>}
	reset_score Player = <Player>
endscript

script freeplay_add_player_server_input \{Player = !i1768515945}
	playlist_getcurrentsong
	getplayerinfo <Player> server_id
	getplayerinfo <Player> controller
	get_song_prefix song = <current_song>
	formatText checksumName = guitar_stream '%s_guitar' s = <song_prefix> AddToStringLookup = true
	getplayerinfo <Player> check_time_early
	get_lag_values
	input_offset = ($time_input_offset - <audio_offset>)
	addplayerserverinput {
		id = <server_id>
		Player = <Player>
		controller = <controller>
		guitar_stream = <guitar_stream>
		time_offset = ((<check_time_early> * 1000.0) + <input_offset>)
		song_name = <current_song>
	}
	setplayerinfo <Player> mic_type = None
endscript

script freeplay_add_player_server_highway \{Player = !i1768515945}
	getplayerinfo <Player> server_id
	easy_scroll_time = ($difficulty_list_props.easy.scroll_time)
	get_lag_values
	gem_offset = ($time_gem_offset - <video_offset>)
	fill_input_offset = (((<easy_scroll_time> - $destroy_time) * 1000) + <gem_offset> + 1000)
	CastToInteger \{fill_input_offset}
	addplayerserverhighway id = <server_id> Player = <Player> create_highway_only = true fill_input_offset = <fill_input_offset>
endscript

script freeplay_add_player_server_fretbar \{Player = !i1768515945}
	playlist_getcurrentsong
	getplayerinfo <Player> server_id
	getplayerinfo <Player> scroll_time
	addplayerserverfretbariterator {
		fretbar_id = createfretbar
		id = <server_id>
		Player = <Player>
		thin_fretbars
		use_player_info_time_offset
		fretbar_function = Create2DFretbar
		skipleadin = (<scroll_time> * 1000.0)
		song_name = <current_song>
	}
endscript

script freeplay_switch_player_normal_to_normal \{Player = !i1768515945
		new_part = !q1768515945}
	freeplay_set_player_part Player = <Player> part = <new_part>
	removeplayerserverhighway Player = <Player>
	formatText checksumName = Name 'highway_containerp%p' p = <Player>
	DestroyScreenElement id = <Name>
	destroy_highway_hud Player = <Player>
	removeplayerserverinput Player = <Player>
	setup_highway Player = <Player> skip_highway_move = true
	freeplay_add_player_server_highway Player = <Player>
	morph_scroll_speed Player = <Player> difficulty = medium blend_time = 0
	freeplay_add_player_server_input Player = <Player>
endscript

script freeplay_switch_player_vocals_to_vocals \{Player = !i1768515945
		new_part = !q1768515945}
	removeplayerserverhighway Player = <Player>
	removeplayerserverinput Player = <Player>
	vocal_highway_hud_destroy_combo_meter Player = <Player>
	vocals_destroy_highway Player = <Player>
	freeplay_add_player_server_input Player = <Player>
	freeplay_add_player_server_highway Player = <Player>
endscript

script freeplay_switch_player_normal_to_vocals \{Player = !i1768515945
		new_part = !q1768515945}
	destroy_highway_hud Player = <Player>
	freeplay_set_player_part Player = <Player> part = <new_part>
	removeplayerserverhighway Player = <Player>
	removeplayerserverinput Player = <Player>
	freeplay_add_player_server_input Player = <Player>
	getplayerinfo <Player> server_id
	removeplayerserverfretbariterator fretbar_id = createfretbar id = <server_id>
	formatText checksumName = Name 'highway_containerp%p' p = <Player>
	DestroyScreenElement id = <Name>
	freeplay_add_player_server_highway Player = <Player>
endscript

script freeplay_switch_player_vocals_to_normal \{Player = !i1768515945
		new_part = !q1768515945}
	vocals_destroy_highway Player = <Player>
	freeplay_set_player_part Player = <Player> part = <new_part>
	removeplayerserverhighway Player = <Player>
	removeplayerserverinput Player = <Player>
	vocal_highway_hud_destroy_combo_meter Player = <Player>
	freeplay_add_player_server_fretbar Player = <Player>
	setup_highway Player = <Player> skip_highway_move = true
	freeplay_add_player_server_highway Player = <Player>
	morph_scroll_speed Player = <Player> difficulty = medium blend_time = 0
	freeplay_add_player_server_input Player = <Player>
endscript

script freeplay_refresh_highway_positions \{new_guy = -1
		old_guy = -1}
	getmaxlocalplayers
	if (<new_guy> != -1)
		getplayerinfo <new_guy> part out = new_guy_part
		Player = 1
		begin
		if (<Player> = <new_guy>)
			freeplay_update_logical_position_for_jump_in Player = <Player> new_guy = 1
		else
			getplayerinfo <Player> part
			new_guy_highway_type_matches_player_highway = FALSE
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
				freeplay_update_logical_position_for_jump_in Player = <Player> new_guy = 0
			endif
		endif
		Player = (<Player> + 1)
		repeat <max_players>
	elseif (<old_guy> != -1)
		getplayerinfo <old_guy> part
		if (<part> != vocals)
			getplayerinfo <old_guy> highway_position
		else
			getplayerinfo <old_guy> vocals_slot
		endif
		Player = 1
		begin
		freeplay_update_logical_position_for_jump_out Player = <Player> free_highway_position = <highway_position> free_vocals_slot = <vocals_slot>
		Player = (<Player> + 1)
		repeat <max_players>
	endif
	force_highways_to_actual_positions new_guy = <new_guy>
endscript

script freeplay_update_logical_position_for_jump_in \{new_guy = 0
		Player = !i1768515945}
	getplayerinfo <Player> freeplay_state
	getplayerinfo <Player> part
	if (<new_guy> = 1)
		freeplay_state = new_guy
	endif
	if NOT (<part> = vocals)
		freeplay_get_num_visible_highways
		getplayerinfo <Player> highway_position
		switch <freeplay_state>
			case dropped
			switch <num_highways>
				case 1
				setplayerinfo <Player> highway_position = center
				case 2
				case 3
				case 4
				setplayerinfo <Player> highway_position = right
			endswitch
			case new_guy
			switch <num_highways>
				case 1
				setplayerinfo <Player> highway_position = center
				case 2
				case 3
				case 4
				setplayerinfo <Player> highway_position = right
			endswitch
			case joining
			case paused
			case playing
			switch <num_highways>
				case 1
				setplayerinfo <Player> highway_position = center
				case 2
				setplayerinfo <Player> highway_position = left
				case 3
				switch <highway_position>
					case right
					setplayerinfo <Player> highway_position = center
					case left
					setplayerinfo <Player> highway_position = left
				endswitch
				case 4
				switch <highway_position>
					case center
					setplayerinfo <Player> highway_position = leftcenter
					case right
					setplayerinfo <Player> highway_position = rightcenter
					case left
					setplayerinfo <Player> highway_position = left
				endswitch
			endswitch
		endswitch
	else
		freeplay_get_num_active_vocalists
		getplayerinfo <Player> vocals_slot
		switch <freeplay_state>
			case dropped
			setplayerinfo <Player> vocals_slot = 0
			case new_guy
			setplayerinfo <Player> vocals_slot = (<num_active_vocalists> - 1)
			case joining
			case paused
			case playing
			setplayerinfo <Player> vocals_slot = <vocals_slot>
		endswitch
		getplayerinfo <Player> vocals_slot
		if (<vocals_slot> < 0)
			dbreak
		endif
	endif
endscript

script freeplay_update_logical_position_for_jump_out \{Player = !i1768515945}
	getplayerinfo <Player> freeplay_state
	getplayerinfo <Player> part
	if NOT (<part> = vocals)
		if NOT GotParam \{free_highway_position}
			return
		endif
		freeplay_get_num_visible_highways
		getplayerinfo <Player> highway_position
		switch <freeplay_state>
			case dropped
			switch <num_highways>
				case 0
				case 1
				setplayerinfo <Player> highway_position = center
				case 2
				case 3
				setplayerinfo <Player> highway_position = right
			endswitch
			case joining
			case paused
			case playing
			switch <num_highways>
				case 1
				setplayerinfo <Player> highway_position = center
				case 2
				switch <free_highway_position>
					case left
					switch <highway_position>
						case center
						setplayerinfo <Player> highway_position = left
					endswitch
					case right
					switch <highway_position>
						case center
						setplayerinfo <Player> highway_position = right
					endswitch
				endswitch
				case 3
				switch <free_highway_position>
					case left
					switch <highway_position>
						case leftcenter
						setplayerinfo <Player> highway_position = left
						case rightcenter
						setplayerinfo <Player> highway_position = center
					endswitch
					case right
					switch <highway_position>
						case leftcenter
						setplayerinfo <Player> highway_position = center
						case rightcenter
						setplayerinfo <Player> highway_position = right
					endswitch
					case leftcenter
					switch <highway_position>
						case rightcenter
						setplayerinfo <Player> highway_position = center
					endswitch
					case rightcenter
					switch <highway_position>
						case leftcenter
						setplayerinfo <Player> highway_position = center
					endswitch
				endswitch
			endswitch
		endswitch
	else
		if NOT GotParam \{free_vocals_slot}
			return
		endif
		freeplay_get_num_active_vocalists
		getplayerinfo <Player> vocals_slot
		switch <freeplay_state>
			case dropped
			setplayerinfo <Player> vocals_slot = 0
			case joining
			case paused
			case playing
			if (<vocals_slot> < <free_vocals_slot>)
				setplayerinfo <Player> vocals_slot = <vocals_slot>
			else
				setplayerinfo <Player> vocals_slot = (<vocals_slot> - 1)
			endif
		endswitch
		getplayerinfo <Player> vocals_slot
		if (<vocals_slot> < 0)
			dbreak
		endif
	endif
endscript

script force_highways_to_actual_positions \{new_guy = -1}
	getmaxlocalplayers
	Player = 1
	begin
	snap = FALSE
	if (<Player> = <new_guy>)
		snap = true
	endif
	freeplay_update_actual_position Player = <Player> snap = <snap>
	Player = (<Player> + 1)
	repeat <max_players>
endscript

script freeplay_update_actual_position \{time = 0
		ignore_scale = 0
		snap = FALSE
		Player = !i1768515945}
	Pos = (0.0, 0.0)
	freeplay_get_num_visible_highways
	if (<num_highways> < 1)
		num_highways = 1
	endif
	getplayerinfo <Player> freeplay_state
	getplayerinfo <Player> part
	if (<part> = vocals)
		getplayerinfo <Player> vocals_slot
		x_pos = (($vocal_player_vocals_slot_params [<vocals_slot>]).x_pos)
		getplayerinfo <Player> combo_meter_id
		<combo_meter_id> :GetSingleTag dest_x_pos
		if NOT (<dest_x_pos> = x_pos)
			<combo_meter_id> :GetSingleTag curr_x_pos
			if (<snap> = FALSE)
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
		getplayerinfo <Player> highway_position
		highway_scale_chart = ($highway_scale_chart [<num_highways> - 1])
		hw_x_scale = (<highway_scale_chart>.hw_x_scale)
		hw_y_scale = (<highway_scale_chart>.hw_y_scale)
		x_pos = (<highway_scale_chart>.<highway_position>.x_pos)
		y_pos = 0
		extra_offset_factor = (<highway_scale_chart>.extra_offset_factor)
		formatText checksumName = container_id 'highway_containerp%p' p = <Player>
		if ScreenElementExists id = <container_id>
			<container_id> :GetSingleTag dest_x_pos
			if NOT (<dest_x_pos> = x_pos)
				<container_id> :GetSingleTag curr_x_pos
				<container_id> :GetSingleTag curr_y_pos
				<container_id> :GetSingleTag curr_extra_offset_factor
				<container_id> :GetSingleTag curr_x_scale
				<container_id> :GetSingleTag curr_y_scale
				<container_id> :GetSingleTag curr_heightoffsetfactor
				<container_id> :GetSingleTag curr_heightoffsetexp
				start_y_pos = <curr_y_pos>
				if (<snap> = FALSE)
					start_x_pos = <curr_x_pos>
					start_extra_offset_factor = <curr_extra_offset_factor>
					start_x_scale = <curr_x_scale>
					start_y_scale = <curr_y_scale>
					start_heightoffsetfactor = <curr_heightoffsetfactor>
					start_heightoffsetexp = <curr_heightoffsetexp>
				else
					start_x_pos = <x_pos>
					start_extra_offset_factor = <extra_offset_factor>
					start_x_scale = <hw_x_scale>
					start_y_scale = <hw_y_scale>
					start_heightoffsetfactor = (<highway_scale_chart>.perspectivefact)
					start_heightoffsetexp = (<highway_scale_chart>.perspectiveexp)
				endif
				<container_id> :SetTags {
					start_x_pos = <start_x_pos>
					start_y_pos = <start_y_pos>
					start_extra_offset_factor = <start_extra_offset_factor>
					start_x_scale = <start_x_scale>
					start_y_scale = <start_y_scale>
					start_heightoffsetfactor = <start_heightoffsetfactor>
					start_heightoffsetexp = <start_heightoffsetexp>
					dest_x_pos = <x_pos>
					dest_y_pos = <y_pos>
					dest_extra_offset_factor = <extra_offset_factor>
					dest_x_scale = <hw_x_scale>
					dest_y_scale = <hw_y_scale>
					dest_heightoffsetfactor = (<highway_scale_chart>.perspectivefact)
					dest_heightoffsetexp = (<highway_scale_chart>.perspectiveexp)
					lerping_factor = 0
				}
			endif
		endif
	endif
	return Pos = <Pos>
endscript

script freeplay_get_num_visible_highways 
	getmaxlocalplayers
	num_highways = 0
	Player = 1
	begin
	getplayerinfo <Player> part
	getplayerinfo <Player> freeplay_state
	switch <freeplay_state>
		case joining
		case paused
		case playing
		if (<part> != vocals)
			num_highways = (<num_highways> + 1)
		endif
	endswitch
	Player = (<Player> + 1)
	repeat <max_players>
	return num_highways = <num_highways>
endscript

script freeplay_is_any_mic_free 
	getmaxlocalplayers
	idx = 0
	begin
	formatText checksumName = mic 'mic%i' i = <idx>
	if ismicrophonepluggedin number = <idx>
		Player = 1
		mic_used = FALSE
		begin
		if playerinfoequals <Player> mic_type = <mic>
			mic_used = true
			break
		endif
		Player = (<Player> + 1)
		repeat <max_players>
		if (<mic_used> = FALSE)
			return \{true}
		endif
	endif
	idx = (<idx> + 1)
	repeat 4
	return \{FALSE}
endscript

script freeplay_vocals_activate_star_power \{Player = !i1768515945}
	this_player = <Player>
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	if playerinfoequals <Player> part = vocals
		vocals_getactivehighwayindex Player = <Player>
		if (<active_highway_index> = 1)
			SpawnScriptNow create_vocals_star_power_effect params = {Player = <Player>}
		endif
	endif
	getnextplayer Player = <Player> on_screen
	repeat <num_players_shown>
endscript

script freeplay_vocals_deactivate_star_power \{Player = !i1768515945}
	if vocals_is_last_player_in_starpower_on_highway Player = <Player>
		SpawnScriptNow kill_vocals_star_power_effect params = {Player = <Player>}
		this_player = <Player>
		getnumplayersingame \{on_screen}
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <Player> part = vocals
			vocals_getactivehighwayindex Player = <Player>
			SpawnScriptNow kill_vocals_star_power_effect params = {Player = <Player>}
		endif
		getnextplayer Player = <Player> on_screen
		repeat <num_players_shown>
	endif
endscript

script freeplay_vocals_init_starpower \{Player = !i1768515945}
	this_player = <Player>
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	if NOT (<Player> = <this_player>)
		if playerinfoequals <Player> part = vocals
			if playerinfoequals <Player> star_power_used = 1
				SpawnScriptNow create_vocals_star_power_effect params = {Player = <this_player>}
				return
			endif
		endif
	endif
	getnextplayer Player = <Player> on_screen
	repeat <num_players_shown>
endscript

script freeplay_is_headset_allowed_for_vocals 
	if isxenonorwindx
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script freeplay_debounce_starpower \{Player = !i1768515945}
	OnExitRun freeplay_debounce_starpower_exit params = {Player = <Player>}
	SetTags \{freeplay_debounce_starpower_active}
	Wait \{0.5
		Seconds}
endscript

script freeplay_debounce_starpower_exit 
	setplayerinfo <Player> star_power_usable = 1
	RemoveTags \{[
			freeplay_debounce_starpower_active
		]}
endscript

script freeplay_debug_auto_drop_in_out \{time = 0.3}
	ui_freeplay_jump_in \{device_num = 1}
	Wait <time> Second
	ui_freeplay_jump_in \{device_num = 0}
	Wait <time> Second
	ui_freeplay_jump_in \{device_num = 2}
	Wait <time> Second
	ui_freeplay_jump_in \{device_num = 3}
	Wait <time> Second
	LaunchEvent \{Type = pad_back
		data = {
			device_num = 1
		}}
	Wait <time> Second
	LaunchEvent \{Type = pad_back
		data = {
			device_num = 0
		}}
	Wait <time> Second
	LaunchEvent \{Type = pad_back
		data = {
			device_num = 2
		}}
	Wait <time> Second
	LaunchEvent \{Type = pad_back
		data = {
			device_num = 3
		}}
endscript

script use_alternate_if_in_freeplay 
	if ($game_mode = freeplay)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script freeplay_unpause_sound \{freeplay_create = FALSE}
	unmuteeffectsend slot = ($venue_sendeffect_slot)
	vocaldspsetparams \{unmute_all}
	if (<freeplay_create> = FALSE)
		audio_gameplay_stop_sounds_for_killsong \{Type = Normal}
	endif
	UnpauseSoundsByBuss \{Master}
endscript

script freeplay_should_change_venues 
	freeplay :freeplayuistack_getnumsongssincevenuechange
	if (<num_songs_since_venue_change> > $freeplay_num_songs_between_venue_changes - 2)
		return \{true}
	else
		return \{FALSE}
	endif
endscript
