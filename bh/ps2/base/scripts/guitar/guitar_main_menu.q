g_mainmenu_text = {
}
0x76b71b2a = 0

script mainmenu_populate_menu_options_global 
	mainmenu_text = {
		career = {
			menu_item_text = qs(0xde7ec8b3)
			helper_text = qs(0x3a276c3f)
		}
		quickplay = {
			menu_item_text = qs(0xfabdce2b)
			helper_text = qs(0x274833eb)
		}
		freeplay = {
			menu_item_text = qs(0x2406ab68)
			helper_text = qs(0xa39e4e93)
		}
		0x6f858f02 = {
			menu_item_text = qs(0x51923839)
			helper_text = qs(0x601382c4)
		}
		training = {
			menu_item_text = qs(0xd093953b)
			helper_text = qs(0x68f39042)
		}
		multiplayer = {
			menu_item_text = qs(0xfef0f891)
			helper_text = qs(0x18dea7fd)
		}
		creator = {
			menu_item_text = qs(0x9f894c1e)
			helper_text = qs(0x351586ce)
		}
		options = {
			menu_item_text = qs(0x976cf9e7)
			helper_text = qs(0x47e44fbd)
		}
		top_rockers = {
			menu_item_text = qs(0x88572463)
			helper_text = qs(0xb1e36b7c)
		}
		debugmenu = {
			menu_item_text = qs(0xafdfad24)
			helper_text = qs(0xac8b0f84)
		}
	}
	Change g_mainmenu_text = <mainmenu_text>
endscript
force_mainmenu_signin = 0

script fix_primary_controller_for_autolaunch 
	if (($primary_controller) = -1)
		Change \{primary_controller = 0}
	endif
endscript

script create_main_menu 
	Change \{respond_to_signin_changed = 0}
	reset_quickplay_song_list
	cas_destroy_all_characters
	reset_character_ids
	sanity_check_fix_deleted_characters
	band_builder_clear_random_appearances
	destroy_band
	frontend_load_soundcheck
	clear_exclusive_devices
	SetMenuAutoRepeatTimes \{(0.3, 0.1)}
	disable_pause
	UnPauseGame
	Change \{check_for_unplugged_controllers = 1}
	Change \{current_num_players = 1}
	getplayerinfo \{1
		controller}
	if (<controller> != ($primary_controller))
		found = 0
		Player = 2
		begin
		getplayerinfo <Player> controller
		if (<controller> = ($primary_controller))
			getplayerinfo \{1
				controller}
			setplayerinfo 1 controller = ($primary_controller)
			setplayerinfo <Player> controller = <controller>
			swap_player_status_elements player_a = 1 player_b = <Player> lefty_flip
			found = 1
			break
		endif
		Player = (<Player> + 1)
		repeat 3
		if (<found> = 0)
			Change structurename = player1_status controller = ($primary_controller)
		endif
	endif
	disable_pause
	SpawnScriptNow \{menu_music_on}
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	Change \{should_reset_gig_posters_selection = 1}
	Change \{current_song = $startup_song}
	Change \{end_credits = 0}
	Change \{rich_presence_context = presence_menus}
	Change \{player1_device = 0}
	Change \{player2_device = 1}
	Change \{player3_device = 2}
	Change \{player4_device = 3}
	Change \{current_gig_number = 1}
	Change \{current_progression_flag = None}
	Change \{options_for_manage_band = 0}
	if ($autolaunch_cas = 1 || $autolaunch_cas_artist = 1)
		Change \{autolaunch_cas = 0}
		fix_primary_controller_for_autolaunch
		SpawnScriptLater main_menu_select_cas params = {device_num = ($primary_controller)}
	endif
	SpawnScriptNow \{menu_music_fade
		params = {
			in
			time = 0.01
		}}
endscript

script 0xe40c3ad9 
	SpawnScriptLater 0xa7d50a03 params = {<...>}
endscript

script 0xa7d50a03 
	Wait \{2
		gameframes}
	SpawnScriptLater <...>
endscript

script mainmenu_focus 
	Obj_GetID
	GetTags
	if NOT current_menu :GetSingleTag \{color_scheme}
		se_setprops \{rgba = [
				0
				0
				0
				255
			]}
	else
		se_setprops {
			rgba = (<color_scheme>.text_focus_color)
			font = (<color_scheme>.0xf9bd0c3e)
		}
	endif
	if current_menu_anchor :desc_resolvealias \{Name = alias_highlight}
		Wait \{2
			gameframe}
		<objID> :se_getparentid
		<parent_id> :se_getprops
		hscale = ((1.0, 0.0).<Scale>)
		GetScreenElementDims id = <objID>
		<width> = (<width> * <hscale>)
		0xc446b6d3 = 25.0
		Scale = (((1.0, 0.0) * (((<width> + (<0xc446b6d3> * 2)) / 256.0))) + (0.0, 1.5))
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute <screenelementpos>} Scale = <Scale>
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + (0.0, -10.0))} time = 0.05
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute <screenelementpos>} Scale = <Scale> time = 0.05
		<resolved_id> :se_waitprops
	endif
endscript

script mainmenu_unfocus 
	if NOT current_menu :GetSingleTag \{color_scheme}
		se_setprops \{rgba = [
				255
				255
				255
				255
			]}
	else
		se_setprops {
			rgba = (<color_scheme>.text_color)
			font = (<color_scheme>.text_font)
		}
	endif
endscript

script 0x63332911 

	if GetScreenElementChildren id = <0x638b9bc5>
		if GetScreenElementChildren id = (<children> [0])
			if GetScreenElementChildren id = (<children> [0])
				0x1427d1e8 = [1 1]
				movement = [(0.0, 5.0) (0.0, 3.0)]
				Bounce = [0.15 0.1]
				(<children> [0]) :se_setprops Pos = (-0.5 * (<movement> [0]))
				(<children> [1]) :se_setprops Pos = (-0.5 * (<movement> [1]))
				begin
				i = 0
				begin
				if NOT (<children> [<i>]) :se_ismorphing
					if (<0x1427d1e8> [<i>])
						(<children> [<i>]) :se_setprops time = (<Bounce> [<i>]) Pos = (<movement> [<i>])
						SetArrayElement ArrayName = 0x1427d1e8 index = <i> NewValue = 0
					else
						(<children> [<i>]) :se_setprops time = (<Bounce> [<i>]) Pos = (-1.0 * (<movement> [<i>]))
						SetArrayElement ArrayName = 0x1427d1e8 index = <i> NewValue = 1
					endif
				endif
				i = (<i> + 1)
				repeat 2
				Wait \{1
					gameframes}
				repeat
			endif
		endif
	endif
endscript

script highlight_motion \{menu_id = current_menu_anchor
		alias_name = alias_highlight}
	if <menu_id> :desc_resolvealias Name = <alias_name>
		0x63332911 0x638b9bc5 = <resolved_id>
	endif
endscript

script create_main_menu_elements 
	0xc0a98a59
	if NOT ($invite_controller = -1)
		return
	endif
	CreateScreenElement \{parent = root_window
		id = mainmenu_id
		Type = descinterface
		desc = 'mainmenu'
		tags = {
			motd_id = None
		}}
	0x87679bf6 \{z_offset = 18.0}
	0x72fc1318 \{venue = $current_level}
	CreateScreenElement \{Type = SpriteElement
		id = 0x3b92a71e
		parent = mainmenu_id
		rgba = [
			255
			255
			255
			255
		]
		Pos = (640.0, 360.0)
		just = [
			center
			center
		]
		dims = (1280.0, 720.0)
		z_priority = 9.0
		texture = song_summary_bg}
	mainmenu_setup_physics_elements \{screen_id = mainmenu_id}
	mainmenu_setup_option \{choose_script = main_menu_select_quickplay
		choose_params = {
			lobby_mode = quickplay
		}
		menu_item = quickplay}
	mainmenu_setup_option \{choose_script = main_menu_select_freeplay
		menu_item = freeplay}
	mainmenu_setup_option \{choose_script = 0x7f511b11
		menu_item = 0x6f858f02}
	mainmenu_setup_option \{choose_script = main_menu_select_career
		choose_params = {
			lobby_mode = career
		}
		menu_item = career}
	mainmenu_setup_option \{choose_script = main_menu_select_options
		menu_item = options}
	mainmenu_setup_option \{choose_script = 0x3abe2710
		menu_item = top_rockers}
	mainmenu_setup_option \{choose_script = main_menu_select_cas
		menu_item = creator}
	mainmenu_setup_option \{choose_script = main_menu_select_training
		menu_item = training}
	mainmenu_setup_option \{choose_script = main_menu_select_multiplayer
		menu_item = multiplayer}
	show_debug_menus = 0
	if ($enable_button_cheats = 1)
		<show_debug_menus> = 1
		if ($enable_debug_menus = 0)
			<show_debug_menus> = 0
		endif
	endif
	if (<show_debug_menus>)
		mainmenu_setup_option \{choose_script = main_menu_select_debug
			menu_item = debugmenu}
	endif
	Change \{0x9b2cba3f = 0}
	Change \{0xc7e670d7 = 0}
	Change \{0xe014e04e = 0}
	current_menu :se_setprops \{event_handlers = [
			{
				pad_option2
				0x858b117f
			}
		]}
	set_focus_color
	set_unfocus_color
endscript

script mainmenu_setup_physics_elements 

	create_2d_spring_system desc_id = <screen_id> num_springs = 2 stiffness = 50 rest_length = 1
	if <screen_id> :desc_resolvealias Name = alias_skull_add_container param = skull_add_id
		<skull_add_id> :obj_spawnscript ui_shakey
	else

	endif
	if <screen_id> :desc_resolvealias Name = alias_skull_add_container param = skull_add_id
		<skull_add_id> :obj_spawnscript ui_frazzmatazz
	else

	endif
	if <screen_id> :desc_resolvealias Name = alias_logo_container param = gh5_logo_id
		<gh5_logo_id> :obj_spawnscript ui_alphaflight
	else

	endif
	if <screen_id> :desc_resolvealias Name = alias_mainmenu_up_arrow
		arrow_up_id = <resolved_id>
	else

	endif
	if <screen_id> :desc_resolvealias Name = alias_mainmenu_down_arrow
		arrow_down_id = <resolved_id>
	else

	endif
	if <screen_id> :desc_resolvealias Name = alias_mainmenu_vmenu
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :SetTags \{smooth_morph_time = 0.1}
		<event_handlers> = [
			{pad_up mainmenu_pad_up params = {arrow_id = <arrow_up_id>}}
			{pad_up smoothmenuscroll params = {Dir = -1 isvertical = true}}
			{pad_down smoothmenuscroll params = {Dir = 1 isvertical = true}}
			{pad_down mainmenu_pad_down params = {arrow_id = <arrow_down_id>}}
		]
		current_menu :se_setprops event_handlers = <event_handlers>
	else

	endif
endscript

script mainmenu_setup_option 
	if ScreenElementExists \{id = mainmenu_id}

		menu_item_text = ($g_mainmenu_text.<menu_item>.menu_item_text)
	else

	endif
	CreateScreenElement {
		Type = descinterface
		parent = current_menu
		desc = 'menurow_txt_desc'
		autosizedims = true
		menurow_txt_item_text = <menu_item_text>
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = ($menu_unfocus_color)
	}
	if GotParam \{blank_entry}
		<id> :se_setprops {
			not_focusable
		}
	elseif GotParam \{not_focusable}
		<id> :se_setprops {
			not_focusable
			menurow_txt_item_rgba = [64 64 64 255]
		}
	else
		if ScreenElementExists \{id = mainmenu_id}
			<id> :SetTags {
				menu_item = <menu_item>
			}
		elseif GotParam \{helper_text}

			<id> :SetTags {
				helper_text = <helper_text>
				screen_id = <screen_id>
			}
		endif
		array = [
			{focus mainmenu_item_focus}
			{unfocus mainmenu_item_unfocus}
		]
		if GotParam \{choose_state}
			AddArrayElement array = <array> element = {pad_choose generic_event_choose params = {state = <choose_state> data = {<choose_params>}}}
		elseif GotParam \{choose_script}
			AddArrayElement array = <array> element = {pad_choose <choose_script> params = {<choose_params>}}
		endif
		if GotParam \{back_state}
			AddArrayElement array = <array> element = {pad_back generic_event_back params = {state = <back_state>}}
		elseif GotParam \{back_script}
			AddArrayElement array = <array> element = {pad_back <back_script>}
		endif
		<id> :se_setprops event_handlers = <array>
	endif
	return mainmenu_item_id = <id>
endscript

script mainmenu_item_focus \{time = 0.05
		grow_scale = 1.5}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	if ScreenElementExists \{id = mainmenu_id}
		if <id> :GetSingleTag menu_item
			mainmenu_id :se_setprops mainmenu_helper_text_text = ($g_mainmenu_text.<menu_item>.helper_text)
		endif
	else
		<id> :GetTags
		if GotParam \{helper_text}
			<screen_id> :se_setprops mainmenu_helper_text_text = <helper_text>
		endif
	endif
	<id> :se_setprops {
		menurow_scale = <grow_scale>
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = ($menu_focus_color)
		motion = ease_in
		time = <time>
	}
endscript

script mainmenu_item_unfocus \{time = 0.05}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :se_setprops {
		menurow_scale = 1.0
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = ($menu_unfocus_color)
		motion = ease_in
		time = <time>
	}
endscript

script mainmenu_pad_up 

	generic_menu_up_or_down_sound \{up}
	<arrow_id> :obj_spawnscript mainmenu_do_scroll_glow
	<arrow_id> :obj_spawnscript mainmenu_do_arrow_pulse
endscript

script mainmenu_pad_down 

	generic_menu_up_or_down_sound \{down}
	<arrow_id> :obj_spawnscript mainmenu_do_scroll_glow
	<arrow_id> :obj_spawnscript mainmenu_do_arrow_pulse params = {down}
endscript

script mainmenu_do_arrow_pulse 
	Obj_GetID
	<objID> :se_setprops hiddenlocal = true
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = dropdown_arrow
		dims = (40.0, 40.0)
		Pos = (20.0, 15.0)
		just = [center center]
		rgba = [225 , 225 , 225 , 200]
		z_priority = 112
	}
	if GotParam \{down}
		<id> :se_setprops flip_h
		<id> :se_setprops Pos = {(0.0, 9.0) relative}
	endif
	<id> :se_setprops Scale = 1.3 time = 0.01 relative_scale
	<id> :se_waitprops
	<id> :se_setprops Scale = 1.0 time = 0.1 relative_scale
	<id> :se_waitprops
	<objID> :se_setprops hiddenlocal = FALSE
	DestroyScreenElement id = <id>
endscript

script mainmenu_do_scroll_glow 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		dims = (64.0, 64.0)
		Pos = (20.0, 15.0)
		rgba = [255 215 0 255]
		just = [center center]
		z_priority = 100
		alpha = 0.2
		blend = add
	}
	<id> :se_setprops Scale = 1.2 relative_scale
	<id> :se_setprops Scale = (Random (@ 2.0 @ 2.5 @ 3.0 )) alpha = 0.0 time = 0.2 relative_scale motion = ease_out
	<id> :se_waitprops
	DestroyScreenElement id = <id>
endscript

script destroy_main_menu 
	generic_ui_destroy
	destroy_viewport_ui
	0xafd96096
	DestroyScreenElement \{id = mainmenu_id}
endscript

script 0x858b117f 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{band_mode_mode = quickplay}
	Change \{game_mode = p1_quickplay}
	Change \{current_num_players = 1}
	Change \{in_join_band_screens = 1}
	Change \{0xc7e670d7 = 1}
	main_menu_select_generic device_num = <device_num> state = uistate_game_mode data = {mode = 0x955f856c}
endscript

script main_menu_select_career 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{game_mode = gh4_p1_career}
	if NOT current_band_has_band_name
		if NOT ($0x76b71b2a)
			spawnscript \{0x1f67cee5}
		endif
	endif
	main_menu_select_generic device_num = <device_num> state = uistate_game_mode data = {use_all_controllers}
endscript

script 0x1f67cee5 
	ui_event_wait_for_safe
	menu_music_off
	PlayMovieAndWait \{movie = 'career_intro'
		noblack
		focus}
	get_movie_id_by_name \{movie = 'career_intro'}
	SetGlobalTags <id> params = {unlocked = 1} all_active_players = 1
	Change \{0x76b71b2a = 1}
	menu_music_on
endscript

script main_menu_select_quickplay 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	main_menu_select_generic device_num = <device_num> state = uistate_game_mode data = {mode = quickplay}
endscript

script main_menu_select_freeplay 
	Change \{band_mode_mode = quickplay}
	Change \{game_mode = p1_quickplay}
	Change \{current_num_players = 1}
	Change \{in_join_band_screens = 1}
	Change \{0x9b2cba3f = 1}
	main_menu_select_generic device_num = <device_num> state = uistate_game_mode data = {mode = freeplay}
endscript

script 0x7f511b11 
	GetActiveControllers
	GetArraySize <active_controllers>
	if GotParam \{device_num}
		Change primary_controller = <device_num>
		Change last_start_pressed_device = <device_num>
	endif
	i = 0
	0x86bba282 = 0
	0x65b79d04 = 0
	begin
	if (<active_controllers> [<i>] = 1)
		if is_regular_controller controller = <i>
			if ($primary_controller = <i>)
				if ismicrophonepluggedin
					0x86bba282 = 1
				endif
			endif
		else
			0x65b79d04 = 1
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	if (<0x86bba282> = 0)
		SoundEvent \{ui_sfx_negative_select}
		if IsPAL
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_generic_alert_popup
					is_popup
					title = qs(0xcf5deb58)
					text = qs(0xbc7fe356)
				}}
		else
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_generic_alert_popup
					is_popup
					title = qs(0xcf5deb58)
					text = qs(0x5a57b2b6)
				}}
		endif
	else
		Change \{band_mode_mode = quickplay}
		Change \{0x9b2cba3f = 1}
		Change \{0xe014e04e = 1}
		Change \{structurename = player1_status
			part = vocals}
		set_primary_controller device_num = <device_num> state = uistate_setlist data = {mode = freeplay}
	endif
endscript

script main_menu_select_multiplayer 
	generic_menu_pad_choose_sound
	if ScriptIsRunning \{menu_transition_in_spawned}
		KillSpawnedScript \{Name = menu_transition_in_spawned}
	endif
	if ScriptIsRunning \{menu_transition_in}
		KillSpawnedScript \{Name = menu_transition_in}
	endif
	GetActiveControllers
	GetArraySize <active_controllers>
	if GotParam \{device_num}
		Change primary_controller = <device_num>
	endif
	i = 0
	guitar_count = 0
	drum_count = 0
	begin
	if (<active_controllers> [<i>] = 1)
		ui_options_get_controller_type controller = <i>
		switch (<Type>)
			case guitar
			<guitar_count> = (<guitar_count> + 1)
			case drums
			<drum_count> = (<drum_count> + 1)
		endswitch
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	if ((<guitar_count> < 2) && (<drum_count> < 2))
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_generic_alert_popup
				is_popup
				title = qs(0xcf5deb58)
				text = qs(0x11a0bfa9)
			}}
	else
		SpawnScriptNow 0x0308347c params = {<...>}
	endif
endscript

script 0x0308347c 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{game_mode = p2_pro_faceoff}
	Change \{current_num_players = 2}
	Change \{structurename = player1_status
		part = guitar}
	Change \{structurename = player2_status
		part = guitar}
	Change \{cheat_freedrum = 0}
	GetArraySize \{$guitar_hero_cheats}
	i = 0
	begin
	if ($guitar_hero_cheats [<i>].Name = 'FreeDrum')
		SetArrayElement ArrayName = guitar_hero_cheat_index globalarray index = <i> NewValue = 0
		GetGlobalTags \{user_options}
		formatText checksumName = cheat_idx 'cheat_index%a' a = <i>
		AddParam structure_name = params Name = <cheat_idx> value = 0
		SetGlobalTags user_options params = <params>
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	main_menu_select_generic device_num = <device_num> state = uistate_select_controller
endscript

script main_menu_select_jam 
	unload_gempaks
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	Change \{respond_to_signin_changed = 1}
	set_primary_controller device_num = <device_num> state = uistate_jam
	SpawnScriptNow \{menu_music_fade
		params = {
			time = 8.160001
			out
			dont_fade_crowd
		}}
	Wait \{1
		Seconds}
	BG_Crowd_Front_End_Silence \{immediate = 1}
endscript

script main_menu_select_cas device_num = ($primary_controller)
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_character_selection data = {from_main_menu = 1}
endscript

script main_menu_select_training 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	Change \{game_mode = practice}
	Change \{current_num_players = 1}
	Change \{came_to_practice_from = main_menu}
	Change \{came_to_practice_from_progression = None}
	Change \{came_to_practice_character_id = emptyguy}
	Change \{structurename = player1_status
		part = guitar}
	Change \{structurename = player2_status
		part = guitar}
	set_primary_controller device_num = <device_num> state = uistate_select_practice_mode data = <...>
endscript

script main_menu_select_options 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_options
endscript

script 0x3abe2710 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	setup_top_rockers_single device_num = <device_num>
endscript

script main_menu_select_debug 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_event_choose \{state = uistate_debug}
endscript

script main_menu_select_generic 

	Change primary_controller = <device_num>
	Change last_start_pressed_device = <device_num>
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	generic_event_choose state = <state> data = {<data>}
endscript

script set_primary_controller \{event = menu_change}

	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if ((GotParam Force) || ($force_mainmenu_signin = 1))
		Change \{primary_controller = -1}
		Change \{last_start_pressed_device = -1}
		Change \{force_mainmenu_signin = 0}
	endif
	Change \{respond_to_signin_changed = 1}
	Change \{signin_jam_mode = 0}
	getplayerinfo \{1
		controller}
	if (<controller> != <device_num>)
		Player = 2
		begin
		getplayerinfo <Player> controller
		if (<controller> = <device_num>)
			getplayerinfo \{1
				controller}
			setplayerinfo 1 controller = <device_num>
			setplayerinfo <Player> controller = <controller>
			swap_player_status_elements player_a = 1 player_b = <Player> lefty_flip
			break
		endif
		Player = (<Player> + 1)
		repeat 3
	endif
	if ($current_num_players = 1)
		if (<device_num> > -1)
			setplayerinfo 1 controller = <device_num>
		endif
	endif
	if GotParam \{jam}
		if ($jam_view_cam_created = 1)

		endif
		Change \{signin_jam_mode = 1}
		generic_event_choose event = <event> state = uistate_signin data = {device_num = <device_num> allow_back = 1 new_state = <state> new_data = <data> jam = 1 require_live = <require_live>}
	else
		assign_new_primary_controller device_num = <device_num>
		generic_event_choose event = <event> no_sound state = <state> data = <data>
	endif
endscript
force_pak_caching = 0
disable_pak_caching = 0

script frontend_load_soundcheck \{async = 1}

	if GetPakManCurrent \{map = zones}

		if NOT (<pak> = z_soundcheck)
			load_soundcheck = 1
		endif
		if NOT GotParam \{load_soundcheck}
			if NOT istextureloaded \{id = main_menu_skull}
				load_soundcheck = 1
			endif
		endif
	endif
	if NOT frontend_anim_paks_are_loaded
		load_anims = 1
	endif
	if ((GotParam load_soundcheck) || (GotParam load_anims))
		needs_loading_screen = 1
		if pakfilesarecached
			needs_loading_screen = 0
			if NOT frontend_anim_paks_are_loaded
				needs_loading_screen = 1
			endif
		endif
		if GotParam \{loadingscreen}
			if (<needs_loading_screen> = 1)
				create_loading_screen \{0xdf3c5641}
			else
				hide_glitch \{num_frames = 3}
			endif
		endif
		if NOT isps3 \{testkit}
			if NOT pakfilesarecached
				if ((CD) || ($force_pak_caching = 1))
					if ($disable_pak_caching = 0)
						if cachepakfiles
							Block \{untilevent = cache_pak_files_loaded}
						endif
					endif
				endif
			endif
		endif
		if GotParam \{load_soundcheck}
			0x72fc1318 \{venue = $current_level}
			if pakfilesarecached
				SetPakManCurrentBlock map = zones pak = <prefix_crc> block_scripts = 1
			else
				SetPakManCurrentBlock map = zones pak = <prefix_crc> block_scripts = (<async> - 1)
			endif
		endif
		loadvenuevideo \{pn = z_soundcheck}
		if GotParam \{load_anims}
			anim_paks_set_state \{state = FrontEnd
				async = 0}
		endif
		if NOT GotParam \{gigboard}
			hide_glitch \{num_frames = 30}
		endif
		if GotParam \{loadingscreen}
			if (<needs_loading_screen> = 1)
				destroy_loading_screen
			endif
		endif
	endif
endscript

script reset_character_ids 

	Change \{structurename = player1_status
		character_id = Judy}
	Change \{structurename = player2_status
		character_id = Judy}
	Change \{structurename = player3_status
		character_id = Judy}
	Change \{structurename = player4_status
		character_id = Judy}
endscript
