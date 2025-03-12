
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
	player = 1
	begin
	freeplay_update_player_hiding player = <player>
	getplayerinfo <player> freeplay_state
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
		setplayerinfo <player> guitar_volume = 100
		setalldrumstates player = <player> volume = 100
	endswitch
	if playerinfoequals <player> part = vocals
		freeplay_update_vocals_highway {
			player = <player>
			primary_vocalist = <primary_vocalist>
			freeplay_state = <freeplay_state>
		}
	endif
	if freeplay_setup_highway_menu_background player = <player>
		if (<freeplay_state> = joining || <freeplay_state> = paused)
			<menu_background_id> :se_setprops light_box_alpha = 0.45000002 time = 0.3
		else
			<menu_background_id> :se_setprops light_box_alpha = 0
		endif
	endif
	getplayerinfo <player> controller
	if (<controller> < 4)
		switch <freeplay_state>
			case joining
			case paused
			case playing
			netsessionfunc func = addcontrollers params = {controller = <controller>}
			case dropped
			netsessionfunc func = removecontroller params = {controller = <controller>}
		endswitch
	endif
	switch <freeplay_state>
		case playing
		getplayerinfo <player> star_power_usable
		if (<star_power_usable> = 0)
			get_highway_hud_menu_parent player = <player>
			if NOT <menu_parent> :getsingletag freeplay_debounce_starpower_active
				<menu_parent> :obj_killspawnedscript name = freeplay_debounce_starpower
				<menu_parent> :obj_spawnscript freeplay_debounce_starpower params = {player = <player>}
			endif
		endif
		case joining
		case paused
		case dropped
		setplayerinfo <player> star_power_usable = 0
	endswitch
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	player = (<player> + 1)
	repeat <max_players>
	if (<num_playing_vocalists> != 1)
		primitive = og_vocal_comet_4p_freeplay
	else
		primitive = og_vocal_comet
	endif
	if screenfx_fxinstanceexists \{viewport = vocals_visualizer_freeplay
			name = vocals_visualizer_fx_freeplay}
		screenfx_updatefxinstanceparams {
			viewport = vocals_visualizer_freeplay
			name = vocals_visualizer_fx_freeplay
			scefname = vocals_visualizer_fx_freeplay
			type = audiovisualize
			highway_index = 1
			on = 1
			clearcolor = [0 0 0 255]
			primitives = ($<primitive>)
		}
	endif
	if (<num_active_vocalists> > 0)
		vocals_highway_root :se_setprops \{alpha = 1
			motion = ease_out
			time = 0.5}
	else
		if screenelementexists \{id = vocals_highway_root}
			vocals_highway_root :se_setprops \{alpha = 0}
		endif
	endif
	if screenelementexists \{id = attract_screen}
		if (<num_dropped_players> = <max_players>)
			attract_screen :se_setprops \{unhide
				alpha = 1}
		else
			attract_screen :se_setprops \{unhide
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
		if NOT gotparam \{transition_array}
			scriptassert qs(0x155b7e0b) a = <old_sound_state> b = <new_sound_state>
		endif
		getarraysize \{transition_array}
		idx = 0
		begin
		transition_type = (<transition_array> [<idx>])
		spawnscriptnow audio_freeplay_music_and_crowd_transitions params = {transition = <transition_type>}
		idx = (<idx> + 1)
		repeat <array_size>
		change attract_sound_state = <new_sound_state>
	endif
	if (<async> = 1)
		wait \{1
			gameframe}
	endif
	spawnscriptnow \{freeplay_refresh_player_streams}
endscript

script freeplay_refresh_player_streams 
	if ($playing_song = 1)
		songaudiosetupdsp \{respect_freeplay}
		updateguitarvolume
		getmaxlocalplayers
		player = 1
		begin
		if NOT playerinfoequals <player> freeplay_state = dropped
			restorealldrumstates player = <player>
		endif
		player = (<player> + 1)
		repeat <max_players>
	endif
endscript

script freeplay_update_vocalists_interactivity \{reason = !q1768515945}
	freeplay_get_num_playing_vocalists
	switch <reason>
		case vocalist_started_playing
		if (<num_playing_vocalists> > 0)
			getmaxlocalplayers
			player = 1
			begin
			if playerinfoequals <player> part = vocals
				setplayerinfo <player> interactive = 1
			endif
			player = (<player> + 1)
			repeat <max_players>
		endif
		case vocalist_stopped_playing
		freeplay_get_num_playing_vocalists
		if (<num_playing_vocalists> = 0)
			getmaxlocalplayers
			player = 1
			begin
			if playerinfoequals <player> part = vocals
				launchgemevent event = kill_objects_and_switch_player_non_interactive player = <player>
			endif
			player = (<player> + 1)
			repeat <max_players>
		endif
		default
		scriptassert qs(0x4e6c8ac2) s = <reason>
	endswitch
endscript

script freeplay_update_primary_vocalist \{player = !i1768515945
		reason = !q1768515945}
	switch <reason>
		case vocalist_joined
		if ($freeplay_primary_vocalist = -1)
			change freeplay_primary_vocalist = <player>
		endif
		case vocalist_dropped
		if ($freeplay_primary_vocalist = <player>)
			change \{freeplay_primary_vocalist = -1}
			getmaxlocalplayers
			loop_player = 1
			begin
			if playerinfoequals <loop_player> part = vocals
				if NOT playerinfoequals <loop_player> freeplay_state = dropped
					change freeplay_primary_vocalist = <loop_player>
					break
				endif
			endif
			loop_player = (<loop_player> + 1)
			repeat <max_players>
		endif
		default
		scriptassert qs(0x4e6c8ac2) s = <reason>
	endswitch
endscript

script freeplay_update_vocals_highway \{player = !i1768515945
		primary_vocalist = !i1768515945
		freeplay_state = !q1768515945}
	vocalshighway_getid player = <player>
	if (<player> = <primary_vocalist>)
		vocals_setactivehighwayplayerindex highway = 1 player = <player>
		safe_show id = <vocals_highway_id>
	else
		safe_hide id = <vocals_highway_id>
	endif
	if ($cheat_performancemode = 1)
		safe_hide id = <vocals_highway_id>
	endif
	if (<freeplay_state> = dropped)
		getplayerinfo <player> controller
		if (<controller> < 4)
			setplayerinfo <player> mic_type = none
			vocals_deinitmic controller = <controller>
		endif
	endif
endscript

script freeplay_has_players 
	getmaxlocalplayers
	num_active_players = 0
	player = 1
	begin
	getplayerinfo <player> freeplay_state
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
	getmaxlocalplayers
	num_active_vocalists = 0
	player = 1
	begin
	if NOT playerinfoequals <player> freeplay_state = dropped
		if playerinfoequals <player> part = vocals
			num_active_vocalists = (<num_active_vocalists> + 1)
		endif
	endif
	player = (<player> + 1)
	repeat <max_players>
	return num_active_vocalists = <num_active_vocalists>
endscript

script freeplay_get_num_playing_vocalists 
	getmaxlocalplayers
	num_playing_vocalists = 0
	player = 1
	begin
	if playerinfoequals <player> freeplay_state = playing
		if playerinfoequals <player> part = vocals
			num_playing_vocalists = (<num_playing_vocalists> + 1)
		endif
	endif
	player = (<player> + 1)
	repeat <max_players>
	return num_playing_vocalists = <num_playing_vocalists>
endscript

script freeplay_get_num_active_players 
	getmaxlocalplayers
	num_active_players = 0
	player = 1
	begin
	getplayerinfo <player> freeplay_state
	if (<freeplay_state> != dropped)
		num_active_players = (<num_active_players> + 1)
	endif
	player = (<player> + 1)
	repeat <max_players>
	return num_active_players = <num_active_players>
endscript

script freeplay_get_num_playing_players 
	getmaxlocalplayers
	num_playing_players = 0
	player = 1
	begin
	getplayerinfo <player> freeplay_state
	if (<freeplay_state> = playing)
		num_playing_players = (<num_playing_players> + 1)
	endif
	player = (<player> + 1)
	repeat <max_players>
	return num_playing_players = <num_playing_players>
endscript

script freeplay_get_first_active_player 
	getmaxlocalplayers
	player = 1
	begin
	getplayerinfo <player> freeplay_state
	if (<freeplay_state> != dropped)
		return player = <player>
	endif
	player = (<player> + 1)
	repeat <max_players>
	return \{player = -1}
endscript

script freeplay_get_next_active_player \{player = !i1768515945}
	getmaxlocalplayers
	begin
	player = (<player> + 1)
	if (<player> > <max_players>)
		return \{player = -1}
	endif
	getplayerinfo <player> freeplay_state
	if (<freeplay_state> != dropped)
		return player = <player>
	endif
	repeat
endscript

script freeplay_update_player_hiding \{player = !i1768515945}
	getplayerinfo <player> freeplay_state
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
	if NOT playerinfoequals <player> part = vocals
		should_hide_comet = true
	endif
	if ($cheat_performancemode = 1)
		should_hide_player = true
	endif
	if (<should_hide_player> = true)
		freeplay_hide_player player = <player>
	else
		freeplay_unhide_player player = <player>
	endif
	if (<should_hide_comet> = true)
		vocals_setplayerhighwayindex player = <player> highway = 0
	else
		vocals_setplayerhighwayindex player = <player> highway = 1
	endif
endscript

script freeplay_hide_player \{player = !i1768515945}
	if NOT playerinfoequals <player> part = vocals
		freeplay_hide_highway_hud player = <player>
		formattext checksumname = name 'highway_containerp%p' p = <player>
		safe_hide id = <name>
	else
		getplayerinfo <player> combo_meter_id
		safe_hide id = <combo_meter_id>
	endif
endscript

script freeplay_unhide_player \{player = !i1768515945}
	if NOT playerinfoequals <player> part = vocals
		freeplay_show_highway_hud player = <player>
		formattext checksumname = name 'highway_containerp%p' p = <player>
		safe_show id = <name>
	else
		getplayerinfo <player> combo_meter_id
		if ($cheat_hudfreemode != 1)
			safe_show id = <combo_meter_id>
		endif
	endif
endscript

script freeplay_start_jump_player_in \{player = !i1768515945
		controller = !i1768515945
		auto_join = !q1768515945}
	setplayerinfo <player> interactive = 0
	setplayerinfo <player> freeplay_state = joining
	getcontrollertype controller = <controller>
	if (<controller_type> = controller)
		if ($allow_controller_for_all_instruments = 1)
			controller_type = guitar
		else
			controller_type = vocals
		endif
	endif
	setplayerinfo <player> difficulty = medium
	setplayerinfo <player> double_kick_drum = 0
	if screenelementexists \{id = freeplay_join_event_handler}
		freeplay_join_event_handler :se_setprops \{block_events}
	endif
	freeplay_init_player player = <player> new_part = <controller_type> auto_join = <auto_join>
	if screenelementexists \{id = freeplay_join_event_handler}
		freeplay_join_event_handler :se_setprops \{unblock_events}
	endif
	if playerinfoequals <player> part = vocals
		freeplay_update_vocalists_interactivity \{reason = vocalist_started_playing}
		freeplay_update_primary_vocalist reason = vocalist_joined player = <player>
	endif
	freeplay_refresh_ui_setup
	togglebotdebugwidget \{action = off}
	switch <controller_type>
		case guitar
		if freeplay_condition_instrument player = <player>
			create_freeplay_instrument_menu player = <player>
		else
			create_freeplay_difficulty_menu player = <player> back_target = dropped
		endif
		case drum
		create_freeplay_difficulty_menu player = <player> back_target = dropped
		case vocals
		create_freeplay_mic_preference_menu player = <player>
		default
		scriptassert qs(0x971cd48d) s = <controller_type>
	endswitch
endscript

script freeplay_instrument_jump_player_in \{player = !i1768515945
		instrument = !q1768515945}
	destroy_freeplay_instrument_menu player = <player>
	freeplay_set_player_part player = <player> part = <instrument>
	create_freeplay_difficulty_menu player = <player> back_target = instrument
endscript

script freeplay_mic_preference_jump_player_in \{player = !i1768515945
		device_num = !i1768515945
		mic_preference = !q1768515945}
	getplayerinfo <player> bot_play
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
	destroy_freeplay_mic_preference_menu player = <player>
	setplayerinfo <player> mic_type = none
	setplayerinfo <player> mic_preference = <mic_preference>
	vocals_distribute_mics
	vocalsinput_reinitmic player = <player>
	ui_options_audio_update_mic_volume player = <player>
	if freeplay_is_headset_allowed_for_vocals
		create_freeplay_difficulty_menu player = <player> back_target = mic
	else
		create_freeplay_difficulty_menu player = <player> back_target = dropped
	endif
endscript

script freeplay_finish_jump_player_in \{player = !i1768515945
		difficulty = !q1768515945}
	destroy_freeplay_difficulty_menu player = <player>
	togglebotdebugwidget \{action = on}
	if (<difficulty> = expert_plus)
		setplayerinfo <player> double_kick_drum = 1
		difficulty = expert
	else
		setplayerinfo <player> double_kick_drum = 0
	endif
	setplayerinfo <player> difficulty = <difficulty>
	setplayerinfo <player> freeplay_state = playing
	if NOT playerinfoequals <player> part = vocals
		setplayerinfo <player> interactive = 1
		getsongtimems
		setplayerinfo <player> last_noninteractive_end_time = <time>
	else
		setplayerinfo <player> scoring = 1
		freeplay_update_vocalists_interactivity \{reason = vocalist_started_playing}
	endif
	freeplay_refresh_ui_setup
	playersetvolume player = <player> volume = 100 include_drums = 1
endscript

script freeplay_drop_player_out \{player = !i1768515945}
	spawnscriptnow \{audio_auto_mic_check}
	setplayerinfo <player> interactive = 0
	setplayerinfo <player> scoring = 0
	setplayerinfo <player> freeplay_state = dropped
	freeplay_destroy_all_possible_menus player = <player>
	if playerinfoequals <player> part = vocals
		setplayerinfo <player> mic_type = none
		getplayerinfo <player> controller
		vocals_deinitmic controller = <controller>
		if playerinfoequals <player> star_power_used = 1
			star_power_deactivate player = <player>
		endif
		freeplay_update_vocalists_interactivity reason = vocalist_stopped_playing player = <player>
		freeplay_update_primary_vocalist reason = vocalist_dropped player = <player>
	endif
	whammyfxoffall player = <player>
	freeplay_refresh_ui_setup
	freeplay_refresh_highway_positions old_guy = <player>
	freeplay_reset_hyperspeed player = <player>
endscript

script freeplay_pause_player \{player = !i1768515945}
	setplayerinfo <player> freeplay_state = paused
	togglebotdebugwidget \{action = off}
	if NOT playerinfoequals <player> part = vocals
		launchgemevent event = kill_objects_and_switch_player_non_interactive player = <player>
	else
		setplayerinfo <player> scoring = 0
		freeplay_update_vocalists_interactivity \{reason = vocalist_stopped_playing}
	endif
	freeplay_refresh_ui_setup
	whammyfxoffall player = <player>
	create_freeplay_pause_menu player = <player>
endscript

script freeplay_resume_player \{player = !i1768515945}
	setplayerinfo <player> freeplay_state = playing
	togglebotdebugwidget \{action = on}
	if NOT playerinfoequals <player> part = vocals
		setplayerinfo <player> interactive = 1
		getsongtimems
		setplayerinfo <player> last_noninteractive_end_time = <time>
	else
		setplayerinfo <player> scoring = 1
		freeplay_update_vocalists_interactivity \{reason = vocalist_started_playing}
	endif
	freeplay_refresh_ui_setup
	playersetvolume player = <player> volume = 100 include_drums = 1
endscript

script freeplay_next_song \{initial_song_list = false}
	if (<initial_song_list> = false)
		spawnscriptnow \{audio_skip_song_in_freeplay_sfx}
		playlist_getcurrentsong
		freeplay :freeplayuistack_marksongasplayed song_name = <current_song>
	endif
	if (<initial_song_list> = true)
		playlist_populate \{play_list_size = 1
			filter_songs_script = issongselectable}
	else
		playlist_populate \{play_list_size = 2
			filter_songs_script = freeplay_filter_songs}
	endif
	playlist_switchtonextsong
	playlist_removeplayedsongs
endscript

script freeplay_filter_songs \{song = !q1768515945
		panic = 0}
	if (<panic> = 1)
		freeplay :freeplayuistack_markoldestsongasunplayed
		return
	endif
	if NOT issongselectable song = <song>
		return \{false}
	else
		if freeplay :freeplayuistack_issongplayed song_name = <song>
			return \{false}
		else
			return \{true}
		endif
	endif
endscript

script freeplay_end_of_song 
	gamemode_gettype
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

script freeplay_skip_song \{player = !i1768515945}
	ui_sfx \{menustate = freeplay
		uitype = select}
	spawnscriptnow \{audio_skip_song_in_freeplay_sfx}
	freeplay_disable_menus
	hide_glitch \{num_frames = 25}
	kill_gem_scroller \{restarting
		freeplay_visualizer_hack}
	destroy_freeplay_menu player = <player>
	freeplay_resume_player player = <player>
	freeplay_next_song
	freeplay_end_of_song
	change \{gameplay_restart_song = 1}
	change \{gameplay_loading_transition = 1}
	generic_event_back \{state = uistate_gameplay}
endscript

script freeplay_restart_song \{player = !i1768515945}
	if NOT gotparam \{no_sound}
		ui_sfx \{menustate = freeplay
			uitype = select}
	endif
	stoprendering
	destroy_freeplay_menu player = <player>
	freeplay_resume_player player = <player>
	freeplay_end_of_song
	change \{gameplay_restart_song = 1}
	generic_event_back \{state = uistate_gameplay}
endscript

script freeplay_change_venue \{player = !i1768515945
		zone = !q1768515945}
	ui_sfx \{menustate = freeplay
		uitype = select}
	spawnscriptnow \{audio_crowd_kill_quiet_crowd_one_shots}
	spawnscriptnow \{audio_quiet_crowd_quickly_to_change_venue_freeplay}
	pushdisablerendering \{context = freeplay_venue_change
		type = unchecked}
	change current_level = <zone>
	freeplay :freeplayuistack_clearnumsongssincevenuechange
	create_loading_screen
	freeplay_restart_song player = <player> no_sound
endscript

script freeplay_set_player_part \{player = !i1768515945
		part = !q1768515945}
	printf qs(0xad6a0e0d) i = <player> p = <part> channel = persistent_band
	setplayerinfo <player> part = <part>
	extendcrcplayer restart_gem_array_events <player> out = event_type
	broadcastevent type = <event_type>
	difficultychange player = <player>
	usefourlanehighway player = <player> reset
	setup_instrument_stored_part
	single_player_check_song_for_zero_difficulty player = <player>
endscript

script freeplay_dropout_player_if_inactive 
	resettimesincelastinputinteraction player = <player>
	begin
	wait \{5
		seconds}
	<dropout> = 0
	if playerinfoequals <player> freeplay_state = dropped
		return
	endif
	if NOT gettimesincelastinputinteraction player = <player>
		return
	endif
	if playerinfoequals <player> freeplay_state = paused
		if (<time_since_last_input_interaction> > $freeplay_time_before_automatic_dropout_in_menu)
			<dropout> = 1
		endif
	endif
	if playerinfoequals <player> freeplay_state = joining
		if (<time_since_last_input_interaction> > $freeplay_time_before_automatic_dropout_in_menu)
			<dropout> = 1
		endif
	endif
	if (<time_since_last_input_interaction> > $freeplay_time_before_automatic_dropout)
		<dropout> = 1
	endif
	if (<dropout> = 1)
		freeplay_drop_player_out player = <player>
		return
	endif
	repeat
endscript

script freeplay_init_player \{player = !i1768515945
		new_part = !q1768515945
		auto_join = !q1768515945}
	getplayerinfo <player> controller
	getplayerinfo <player> part out = old_part
	if (<new_part> != vocals)
		lefty_flip_part = <new_part>
		if (<lefty_flip_part> = bass)
			lefty_flip_part = guitar
		endif
		get_progression_instrument_user_option controller = <controller> part = <lefty_flip_part> option = 'lefty_flip'
		if (<user_option> = 1)
			setplayerinfo <player> lefty_flip = 1
		else
			setplayerinfo <player> lefty_flip = 0
		endif
		guitar_init_lefty_highway player = <player>
	endif
	formattext checksumname = widget_context 'player%i_hud' i = <player>
	detachhudwidget context = <widget_context>
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
		vocalshighway_getid player = <player>
		resolvescreenelementid id = {<vocals_highway_id> child = 0} param = root
		safe_show id = <root>
	endif
	freeplay_vocals_init_starpower player = <player>
	getplayerinfo <player> freeplay_state
	if (<freeplay_state> = joining)
		freeplay_refresh_highway_positions new_guy = <player>
	endif
	get_highway_hud_menu_parent player = <player>
	<menu_parent> :obj_killspawnedscript name = freeplay_dropout_player_if_inactive
	<menu_parent> :obj_spawnscript freeplay_dropout_player_if_inactive params = {player = <player>}
	<menu_parent> :obj_killspawnedscript name = freeplay_controller_pulling_observer
	<menu_parent> :obj_spawnscript freeplay_controller_pulling_observer params = {player = <player>}
	reset_score player = <player>
endscript

script freeplay_add_player_server_input \{player = !i1768515945}
	playlist_getcurrentsong
	getplayerinfo <player> server_id
	getplayerinfo <player> controller
	get_song_prefix song = <current_song>
	formattext checksumname = guitar_stream '%s_guitar' s = <song_prefix> addtostringlookup = true
	getplayerinfo <player> check_time_early
	get_lag_values
	input_offset = ($time_input_offset - <audio_offset>)
	addplayerserverinput {
		id = <server_id>
		player = <player>
		controller = <controller>
		guitar_stream = <guitar_stream>
		time_offset = ((<check_time_early> * 1000.0) + <input_offset>)
		song_name = <current_song>
	}
	setplayerinfo <player> mic_type = none
endscript

script freeplay_add_player_server_highway \{player = !i1768515945}
	getplayerinfo <player> server_id
	easy_scroll_time = ($difficulty_list_props.easy.scroll_time)
	get_lag_values
	gem_offset = ($time_gem_offset - <video_offset>)
	fill_input_offset = (((<easy_scroll_time> - $destroy_time) * 1000) + <gem_offset> + 1000)
	casttointeger \{fill_input_offset}
	addplayerserverhighway id = <server_id> player = <player> create_highway_only = true fill_input_offset = <fill_input_offset>
endscript

script freeplay_add_player_server_fretbar \{player = !i1768515945}
	playlist_getcurrentsong
	getplayerinfo <player> server_id
	getplayerinfo <player> scroll_time
	addplayerserverfretbariterator {
		fretbar_id = createfretbar
		id = <server_id>
		player = <player>
		thin_fretbars
		use_player_info_time_offset
		fretbar_function = create2dfretbar
		skipleadin = (<scroll_time> * 1000.0)
		song_name = <current_song>
	}
endscript

script freeplay_switch_player_normal_to_normal \{player = !i1768515945
		new_part = !q1768515945}
	freeplay_set_player_part player = <player> part = <new_part>
	removeplayerserverhighway player = <player>
	formattext checksumname = name 'highway_containerp%p' p = <player>
	destroyscreenelement id = <name>
	destroy_highway_hud player = <player>
	removeplayerserverinput player = <player>
	getplayerinfo <player> server_id
	removeplayerserverfretbariterator fretbar_id = createfretbar id = <server_id>
	freeplay_add_player_server_fretbar player = <player>
	setup_highway player = <player> skip_highway_move = true
	freeplay_add_player_server_highway player = <player>
	morph_scroll_speed player = <player> difficulty = medium blend_time = 0
	freeplay_add_player_server_input player = <player>
endscript

script freeplay_switch_player_vocals_to_vocals \{player = !i1768515945
		new_part = !q1768515945}
	removeplayerserverhighway player = <player>
	removeplayerserverinput player = <player>
	vocal_highway_hud_destroy_combo_meter player = <player>
	vocals_destroy_highway player = <player>
	freeplay_add_player_server_input player = <player>
	freeplay_add_player_server_highway player = <player>
endscript

script freeplay_switch_player_normal_to_vocals \{player = !i1768515945
		new_part = !q1768515945}
	destroy_highway_hud player = <player>
	freeplay_set_player_part player = <player> part = <new_part>
	removeplayerserverhighway player = <player>
	removeplayerserverinput player = <player>
	freeplay_add_player_server_input player = <player>
	getplayerinfo <player> server_id
	removeplayerserverfretbariterator fretbar_id = createfretbar id = <server_id>
	formattext checksumname = name 'highway_containerp%p' p = <player>
	destroyscreenelement id = <name>
	freeplay_add_player_server_highway player = <player>
endscript

script freeplay_switch_player_vocals_to_normal \{player = !i1768515945
		new_part = !q1768515945}
	vocals_destroy_highway player = <player>
	freeplay_set_player_part player = <player> part = <new_part>
	removeplayerserverhighway player = <player>
	removeplayerserverinput player = <player>
	vocal_highway_hud_destroy_combo_meter player = <player>
	freeplay_add_player_server_fretbar player = <player>
	setup_highway player = <player> skip_highway_move = true
	freeplay_add_player_server_highway player = <player>
	morph_scroll_speed player = <player> difficulty = medium blend_time = 0
	freeplay_add_player_server_input player = <player>
endscript

script freeplay_refresh_highway_positions \{new_guy = -1
		old_guy = -1}
	getmaxlocalplayers
	if (<new_guy> != -1)
		getplayerinfo <new_guy> part out = new_guy_part
		player = 1
		begin
		if (<player> = <new_guy>)
			freeplay_update_logical_position_for_jump_in player = <player> new_guy = 1
		else
			getplayerinfo <player> part
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
		getplayerinfo <old_guy> part
		if (<part> != vocals)
			getplayerinfo <old_guy> highway_position
		else
			getplayerinfo <old_guy> vocals_slot
		endif
		player = 1
		begin
		freeplay_update_logical_position_for_jump_out player = <player> free_highway_position = <highway_position> free_vocals_slot = <vocals_slot>
		player = (<player> + 1)
		repeat <max_players>
	endif
	force_highways_to_actual_positions new_guy = <new_guy>
endscript

script freeplay_update_logical_position_for_jump_in \{new_guy = 0
		player = !i1768515945}
	getplayerinfo <player> freeplay_state
	getplayerinfo <player> part
	if (<new_guy> = 1)
		freeplay_state = new_guy
	endif
	if NOT (<part> = vocals)
		freeplay_get_num_visible_highways
		getplayerinfo <player> highway_position
		switch <freeplay_state>
			case dropped
			switch <num_highways>
				case 1
				setplayerinfo <player> highway_position = center
				case 2
				case 3
				case 4
				setplayerinfo <player> highway_position = right
			endswitch
			case new_guy
			switch <num_highways>
				case 1
				setplayerinfo <player> highway_position = center
				case 2
				case 3
				case 4
				setplayerinfo <player> highway_position = right
			endswitch
			case joining
			case paused
			case playing
			switch <num_highways>
				case 1
				setplayerinfo <player> highway_position = center
				case 2
				setplayerinfo <player> highway_position = left
				case 3
				switch <highway_position>
					case right
					setplayerinfo <player> highway_position = center
					case left
					setplayerinfo <player> highway_position = left
				endswitch
				case 4
				switch <highway_position>
					case center
					setplayerinfo <player> highway_position = leftcenter
					case right
					setplayerinfo <player> highway_position = rightcenter
					case left
					setplayerinfo <player> highway_position = left
				endswitch
			endswitch
		endswitch
	else
		freeplay_get_num_active_vocalists
		getplayerinfo <player> vocals_slot
		switch <freeplay_state>
			case dropped
			setplayerinfo <player> vocals_slot = 0
			case new_guy
			setplayerinfo <player> vocals_slot = (<num_active_vocalists> - 1)
			case joining
			case paused
			case playing
			setplayerinfo <player> vocals_slot = <vocals_slot>
		endswitch
		getplayerinfo <player> vocals_slot
		if (<vocals_slot> < 0)
			dbreak
		endif
	endif
endscript

script freeplay_update_logical_position_for_jump_out \{player = !i1768515945}
	getplayerinfo <player> freeplay_state
	getplayerinfo <player> part
	if NOT (<part> = vocals)
		if NOT gotparam \{free_highway_position}
			return
		endif
		freeplay_get_num_visible_highways
		getplayerinfo <player> highway_position
		switch <freeplay_state>
			case dropped
			switch <num_highways>
				case 0
				case 1
				setplayerinfo <player> highway_position = center
				case 2
				case 3
				setplayerinfo <player> highway_position = right
			endswitch
			case joining
			case paused
			case playing
			switch <num_highways>
				case 1
				setplayerinfo <player> highway_position = center
				case 2
				switch <free_highway_position>
					case left
					switch <highway_position>
						case center
						setplayerinfo <player> highway_position = left
					endswitch
					case right
					switch <highway_position>
						case center
						setplayerinfo <player> highway_position = right
					endswitch
				endswitch
				case 3
				switch <free_highway_position>
					case left
					switch <highway_position>
						case leftcenter
						setplayerinfo <player> highway_position = left
						case rightcenter
						setplayerinfo <player> highway_position = center
					endswitch
					case right
					switch <highway_position>
						case leftcenter
						setplayerinfo <player> highway_position = center
						case rightcenter
						setplayerinfo <player> highway_position = right
					endswitch
					case leftcenter
					switch <highway_position>
						case rightcenter
						setplayerinfo <player> highway_position = center
					endswitch
					case rightcenter
					switch <highway_position>
						case leftcenter
						setplayerinfo <player> highway_position = center
					endswitch
				endswitch
			endswitch
		endswitch
	else
		if NOT gotparam \{free_vocals_slot}
			return
		endif
		freeplay_get_num_active_vocalists
		getplayerinfo <player> vocals_slot
		switch <freeplay_state>
			case dropped
			setplayerinfo <player> vocals_slot = 0
			case joining
			case paused
			case playing
			if (<vocals_slot> < <free_vocals_slot>)
				setplayerinfo <player> vocals_slot = <vocals_slot>
			else
				setplayerinfo <player> vocals_slot = (<vocals_slot> - 1)
			endif
		endswitch
		getplayerinfo <player> vocals_slot
		if (<vocals_slot> < 0)
			dbreak
		endif
	endif
endscript

script force_highways_to_actual_positions \{new_guy = -1}
	getmaxlocalplayers
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
		snap = false
		player = !i1768515945}
	pos = (0.0, 0.0)
	freeplay_get_num_visible_highways
	if (<num_highways> < 1)
		num_highways = 1
	endif
	getplayerinfo <player> freeplay_state
	getplayerinfo <player> part
	if (<part> = vocals)
		getplayerinfo <player> vocals_slot
		x_pos = (($vocal_player_vocals_slot_freeplay_params [<vocals_slot>]).x_pos)
		getplayerinfo <player> combo_meter_id
		<combo_meter_id> :getsingletag dest_x_pos
		if NOT (<dest_x_pos> = x_pos)
			<combo_meter_id> :getsingletag curr_x_pos
			if (<snap> = false)
				start_x_pos = <curr_x_pos>
			else
				start_x_pos = <x_pos>
			endif
			<combo_meter_id> :settags {
				start_x_pos = <start_x_pos>
				dest_x_pos = <x_pos>
				lerping_factor = 0
			}
		endif
	else
		getplayerinfo <player> highway_position
		highway_scale_chart = ($highway_scale_chart [<num_highways> - 1])
		hw_x_scale = (<highway_scale_chart>.hw_x_scale)
		hw_y_scale = (<highway_scale_chart>.hw_y_scale)
		x_pos = (<highway_scale_chart>.<highway_position>.x_pos)
		y_pos = 0
		extra_offset_factor = (<highway_scale_chart>.extra_offset_factor)
		formattext checksumname = container_id 'highway_containerp%p' p = <player>
		if screenelementexists id = <container_id>
			<container_id> :getsingletag dest_x_pos
			if NOT (<dest_x_pos> = x_pos)
				<container_id> :getsingletag curr_x_pos
				<container_id> :getsingletag curr_y_pos
				<container_id> :getsingletag curr_extra_offset_factor
				<container_id> :getsingletag curr_x_scale
				<container_id> :getsingletag curr_y_scale
				<container_id> :getsingletag curr_heightoffsetfactor
				<container_id> :getsingletag curr_heightoffsetexp
				start_y_pos = <curr_y_pos>
				if (<snap> = false)
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
				<container_id> :settags {
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
	return pos = <pos>
endscript

script freeplay_get_num_visible_highways 
	getmaxlocalplayers
	num_highways = 0
	player = 1
	begin
	getplayerinfo <player> part
	getplayerinfo <player> freeplay_state
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
	getmaxlocalplayers
	idx = 0
	begin
	formattext checksumname = mic 'mic%i' i = <idx>
	if ismicrophonepluggedin number = <idx>
		player = 1
		mic_used = false
		begin
		if playerinfoequals <player> mic_type = <mic>
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

script freeplay_vocals_activate_star_power \{player = !i1768515945}
	this_player = <player>
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	if playerinfoequals <player> part = vocals
		vocals_getactivehighwayindex player = <player>
		if (<active_highway_index> = 1)
			spawnscriptnow create_vocals_star_power_effect params = {player = <player>}
		endif
	endif
	getnextplayer player = <player> on_screen
	repeat <num_players_shown>
endscript

script freeplay_vocals_deactivate_star_power \{player = !i1768515945}
	if vocals_is_last_player_in_starpower_on_highway player = <player>
		spawnscriptnow kill_vocals_star_power_effect params = {player = <player>}
		this_player = <player>
		getnumplayersingame \{on_screen}
		getfirstplayer \{on_screen}
		begin
		if playerinfoequals <player> part = vocals
			vocals_getactivehighwayindex player = <player>
			spawnscriptnow kill_vocals_star_power_effect params = {player = <player>}
		endif
		getnextplayer player = <player> on_screen
		repeat <num_players_shown>
	endif
endscript

script freeplay_vocals_init_starpower \{player = !i1768515945}
	this_player = <player>
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	if NOT (<player> = <this_player>)
		if playerinfoequals <player> part = vocals
			if playerinfoequals <player> star_power_used = 1
				spawnscriptnow create_vocals_star_power_effect params = {player = <this_player>}
				return
			endif
		endif
	endif
	getnextplayer player = <player> on_screen
	repeat <num_players_shown>
endscript

script freeplay_is_headset_allowed_for_vocals 
	if isxenonorwindx
		return \{true}
	else
		return \{false}
	endif
endscript

script freeplay_debounce_starpower \{player = !i1768515945}
	onexitrun freeplay_debounce_starpower_exit params = {player = <player>}
	settags \{freeplay_debounce_starpower_active}
	wait \{0.5
		seconds}
endscript

script freeplay_debounce_starpower_exit 
	setplayerinfo <player> star_power_usable = 1
	removetags \{[
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
	launchevent \{type = pad_back
		data = {
			device_num = 1
		}}
	wait <time> second
	launchevent \{type = pad_back
		data = {
			device_num = 0
		}}
	wait <time> second
	launchevent \{type = pad_back
		data = {
			device_num = 2
		}}
	wait <time> second
	launchevent \{type = pad_back
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

script freeplay_unpause_sound \{freeplay_create = false}
	unmuteeffectsend slot = ($venue_sendeffect_slot)
	vocaldspsetparams \{unmute_all}
	if (<freeplay_create> = false)
		audio_gameplay_stop_sounds_for_killsong \{type = normal}
	endif
	unpausesoundsbybuss \{master}
endscript

script freeplay_should_change_venues 
	freeplay :freeplayuistack_getnumsongssincevenuechange
	if (<num_songs_since_venue_change> > $freeplay_num_songs_between_venue_changes - 2)
		return \{true}
	else
		return \{false}
	endif
endscript

script freeplay_song_has_passed_last_fretbar \{buffer_time = 0.0}
	playlist_getcurrentsong
	gettimeoflastfretbar song_name = <current_song>
	getsongtimems
	cutoff_time = (<time_of_last_fret> - <buffer_time>)
	if (<time> > <cutoff_time>)
		return \{true}
	endif
	return \{false}
endscript
