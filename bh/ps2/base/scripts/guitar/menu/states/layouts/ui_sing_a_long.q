in_sing_a_long = FALSE

script ui_init_sing_a_long 
	Change \{in_sing_a_long = true}
	0x5554e640 = []
	i = 1
	begin
	getplayerinfo <i> vocals_highway_view
	AddArrayElement array = <0x5554e640> element = <vocals_highway_view>
	0x5554e640 = <array>
	i = (<i> + 1)
	repeat 4
	CreateScreenElement {
		Type = ContainerElement
		id = sing_a_long_container
		parent = root_window
		pos_anchor = [left top]
		just = [left top]
		dims = (1280.0, 720.0)
		tags = {
			back_state = <back_state>
			song = <song>
			venue = <venue>
			game_mode = ($game_mode)
			cheat_invincible = ($cheat_invincible)
			disable_all_starpower = ($disable_all_starpower)
			0x5554e640 = <0x5554e640>
		}
		event_handlers = [
			{pad_back ui_sing_a_long_back}
		]
	}
	add_user_control_helper {
		override_parent = sing_a_long_container
		button = red text = qs(0x67d9c56d)
		Pos = (0.0, -72.0)
		just = [center top]
		pos_anchor = [center bottom]
		controller = ($primary_controller)
		all_buttons
	}
	i = 1
	begin
	setplayerinfo <i> part = vocals
	setplayerinfo <i> scoring = 0
	setplayerinfo <i> vocals_highway_view = karaoke
	setplayerinfo <i> in_game = 1
	setplayerinfo <i> difficulty = beginner
	i = (<i> + 1)
	repeat 4
	vocals_distribute_mics
	Change \{game_mode = p1_quickplay}
	Change \{cheat_invincible = 1}
	Change \{disable_all_starpower = 1}
	if GotParam \{venue}
		Change g_band_lobby_current_level = <venue>
	endif
	0x5f779cd2
	sing_a_long_container :obj_spawnscript \{ui_sing_a_long_spawned}
endscript

script ui_create_sing_a_long 
endscript

script ui_destroy_sing_a_long 
endscript

script ui_deinit_sing_a_long 
	sing_a_long_container :GetTags
	Change game_mode = <game_mode>
	Change cheat_invincible = <cheat_invincible>
	Change disable_all_starpower = <disable_all_starpower>
	i = 1
	begin
	setplayerinfo <i> vocals_highway_view = (<0x5554e640> [<i> -1])
	i = (<i> + 1)
	repeat 4
	DestroyScreenElement \{id = sing_a_long_container}
	Change \{in_sing_a_long = FALSE}
endscript

script ui_sing_a_long_spawned 
	setscriptcannotpause
	GetTags
	ui_event_wait_for_safe
	ui_event_block \{event = menu_change
		data = {
			state = uistate_play_song
		}}
	LaunchEvent \{Type = focus
		target = sing_a_long_container}
	begin
	if ScreenElementExists \{id = vignette_of_failure}
		vignette_of_failure :se_setprops \{Hide}
	endif
	if ScreenElementExists \{id = hud_root}
		hud_root :se_setprops \{Hide}
	endif
	vocalshighway_getid \{Player = 1}
	if ScreenElementExists id = <vocals_highway_id>
		<vocals_highway_id> :desc_resolvealias Name = alias_now_bar param = now_bar
		<now_bar> :se_setprops Hide
		<vocals_highway_id> :desc_resolvealias Name = alias_static_note_scale param = static_note_scale
		<static_note_scale> :se_setprops Hide
		<vocals_highway_id> :desc_resolvealias Name = alias_static_phrase_start param = static_phrase_start
		<static_phrase_start> :se_setprops Hide
		<vocals_highway_id> :desc_resolvealias Name = alias_static_phrase_end param = static_phrase_end
		<static_phrase_end> :se_setprops Hide
		<vocals_highway_id> :se_setprops 0x4aeb22b1 = 0.0
		<vocals_highway_id> :se_setprops static_next_phrase_bg_alpha = 0.0
		<vocals_highway_id> :se_setprops border_rgba = [0 0 0 0]
		<vocals_highway_id> :se_setprops 0x574527e2 = 0.0
		<vocals_highway_id> :se_setprops 0x65c756e5 = 0.0
		<vocals_highway_id> :se_setprops bg_alpha = 0.0
	endif
	Change \{cheat_invincible = 1}
	Wait \{1
		gameframe}
	repeat
endscript

script ui_sing_a_long_back 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	se_setprops \{block_events}
	GetSingleTag \{back_state}
	if NOT GotParam \{back_state}
		back_state = uistate_mainmenu
	endif
	ui_event_wait_for_safe
	generic_event_back state = <back_state>
endscript

script ui_sing_a_long_start 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}


	ui_event_get_top
	formatText checksumName = back_state 'uistate_%b' b = <base_name>
	generic_event_choose state = uistate_sing_a_long data = {song = <song> venue = <venue> back_state = <back_state>}
endscript

script 0x5f779cd2 
endscript
