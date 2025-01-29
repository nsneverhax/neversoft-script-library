g_mainmenu_text = {
}
g_mainmenu_freeplay_timer = 120
g_mainmenu_freeplay_enable_timer = 2
g_disallow_auto_partyplay_from_main_menu = 0

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
		training = {
			menu_item_text = qs(0xd093953b)
			helper_text = qs(0x1d06e07b)
		}
		competitive = {
			menu_item_text = qs(0x6e63fe63)
			helper_text = qs(0x822a435b)
		}
		xboxlive = {
			menu_item_text = '(Xbox LIVE)'
			helper_text = 'This is some helper text for Xbox LIVE'
		}
		online = {
			menu_item_text = qs(0xe60e3e4a)
			helper_text = qs(0x7983ef0e)
		}
		music_store = {
			menu_item_text = qs(0xa8e9637f)
			helper_text = qs(0xb21014b9)
		}
		music_central = {
			menu_item_text = $guitar_main_menu_ghstudio_string
			helper_text = $music_central_helper_text
		}
		creator = {
			menu_item_text = qs(0x9f894c1e)
			helper_text = qs(0x351586ce)
		}
		roadie_battle = {
			menu_item_text = qs(0x24395e9d)
			helper_text = qs(0x0b1acabd)
		}
		freestyle = {
			menu_item_text = qs(0x13dd7891)
			helper_text = qs(0xdef9fdb7)
		}
		options = {
			menu_item_text = qs(0x976cf9e7)
			helper_text = qs(0xce7f2ae9)
		}
		leaderboards = {
			menu_item_text = qs(0xa1ae7e56)
			helper_text = qs(0xb1e36b7c)
		}
		debugmenu = {
			menu_item_text = qs(0x4a5146a0)
			helper_text = qs(0x8cd7a038)
		}
		motd = {
			menu_item_text = qs(0x3e13521a)
			helper_text = qs(0x11d60d78)
		}
	}
	Change g_mainmenu_text = <mainmenu_text>
endscript
force_mainmenu_signin = 0
first_time_creating_main_menu = 1
respond_to_signin_change = 0
store_respond_to_signin_changed = 0

script mainmenu_kill_song_and_characters 
	closesonglogfile
	gman_songfunc \{func = clear_play_list}
	if ($use_persistent_band = 0)
		cas_destroy_all_characters
		sanity_check_fix_deleted_characters
	endif
endscript

script fix_primary_controller_for_autolaunch 
	if (($primary_controller) = -1)
		Change \{primary_controller = 0}
	endif
endscript

script create_main_menu 
	unlock_all_controllers
	reset_all_special_events
	clear_exclusive_devices
	SetMenuAutoRepeatTimes \{(0.3, 0.1)}
	disable_pause
	UnPauseGame
	Change \{check_for_unplugged_controllers = 1}
	disable_pause
	SpawnScriptNow \{menu_music_on}
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	Change \{setlist_previous_tier = 1}
	Change \{setlist_previous_song = 0}
	Change \{setlist_previous_tab = tab_setlist}
	Change \{end_credits = 0}
	setplayerinfo \{1
		device = 0}
	setplayerinfo \{2
		device = 1}
	setplayerinfo \{3
		device = 2}
	setplayerinfo \{4
		device = 3}
	Change \{options_for_manage_band = 0}
	if ($new_message_of_the_day = 1)
		RunScriptOnScreenElement \{id = current_menu
			pop_in_new_downloads_notifier}
	endif
	if NOT ($invite_controller = -1)
		Change \{invite_controller = -1}
		main_menu_select_online
		fadetoblack \{OFF
			time = 0}
	else
	endif
	if ($autolaunch_cas = 1)
		Change \{autolaunch_cas = 0}
		fix_primary_controller_for_autolaunch
		SpawnScriptLater main_menu_select_cas params = {device_num = ($primary_controller)}
	endif
	if ($autolaunch_jam = 1)
		Change \{autolaunch_jam = 0}
		fix_primary_controller_for_autolaunch
		SpawnScriptLater music_central_select_music_studio params = {device_num = ($primary_controller)}
	endif
	if (($g_disallow_auto_partyplay_from_main_menu) = 0)
		RunScriptOnScreenElement \{id = current_menu
			mainmenu_freeplay_timer}
	endif
	RunScriptOnScreenElement \{id = current_menu
		mainmenu_wait_to_enable_freeplay}
	Change \{competitive_rules = faceoff}
	Change \{game_mode = p1_quickplay}
	prepare_band_for_main_menu
endscript

script create_main_menu_elements 
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
	mainmenu_setup_physics_elements \{screen_id = mainmenu_id}
	mainmenu_setup_option \{choose_script = main_menu_select_band_lobby
		choose_params = {
			lobby_mode = quickplay
		}
		menu_item = quickplay}
	mainmenu_setup_option \{choose_script = main_menu_select_career
		choose_params = {
			lobby_mode = career
		}
		menu_item = career}
	mainmenu_setup_option \{choose_script = main_menu_select_music_store
		menu_item = music_store}
	mainmenu_setup_option \{choose_script = music_central_select_music_studio
		menu_item = music_central}
	mainmenu_setup_option \{choose_script = main_menu_select_options
		menu_item = options}
	mainmenu_setup_option \{choose_script = main_menu_select_leaderboards
		menu_item = leaderboards}
	mainmenu_setup_option \{choose_script = main_menu_select_cas
		menu_item = creator}
	mainmenu_setup_option \{choose_script = main_menu_select_training
		menu_item = training}
	mainmenu_setup_option \{choose_script = main_menu_select_band_lobby
		choose_params = {
			lobby_mode = vs
		}
		menu_item = competitive}
	show_debug_menus = 0
	if ($enable_button_cheats = 1)
		<show_debug_menus> = 1
		if ($enable_debug_menus = 0)
			<show_debug_menus> = 0
		endif
	endif
	if ($smoketestisrunning = true)
		<show_debug_menus> = 1
	endif
	if ((<show_debug_menus>) && ($is_multiplayer_beta = 0))
		mainmenu_setup_option \{choose_script = main_menu_select_debug
			menu_item = debugmenu}
	endif
	mainmenu_setup_option \{choose_script = main_menu_select_roadie_battle
		menu_item = roadie_battle}
	mainmenu_setup_option \{choose_script = main_menu_select_freestyle
		menu_item = freestyle}
	create_motd
	set_focus_color
	set_unfocus_color
endscript

script mainmenu_setup_physics_elements 
	RequireParams \{[
			screen_id
		]
		all}
	create_2d_spring_system desc_id = <screen_id> num_springs = 2 stiffness = 50 rest_length = 1
	if <screen_id> :desc_resolvealias Name = alias_skull_add_container param = skull_add_id
		<skull_add_id> :obj_spawnscript ui_shakey
	else
		ScriptAssert \{'drose1'}
	endif
	if <screen_id> :desc_resolvealias Name = alias_skull_add_container param = skull_add_id
		<skull_add_id> :obj_spawnscript ui_frazzmatazz
	else
		ScriptAssert \{'drose1'}
	endif
	if <screen_id> :desc_resolvealias Name = alias_logo_container param = gh5_logo_id
		<gh5_logo_id> :obj_spawnscript ui_alphaflight
	else
		ScriptAssert \{'drose1'}
	endif
	if <screen_id> :desc_resolvealias Name = alias_mainmenu_up_arrow
		arrow_up_id = <resolved_id>
	else
		ScriptAssert \{qs(0xfdafa36d)}
	endif
	if <screen_id> :desc_resolvealias Name = alias_mainmenu_down_arrow
		arrow_down_id = <resolved_id>
	else
		ScriptAssert \{qs(0xfdafa36d)}
	endif
	if <screen_id> :desc_resolvealias Name = alias_mainmenu_vmenu
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :SetTags \{smooth_morph_time = 0.1}
		<event_handlers> = [
			{pad_up mainmenu_pad_up params = {arrow_id = <arrow_up_id>}}
			{pad_up smoothmenuscroll params = {Dir = -1 isvertical = true}}
			{pad_down smoothmenuscroll params = {Dir = 1 isvertical = true}}
			{pad_down mainmenu_pad_down params = {arrow_id = <arrow_down_id>}}
			{menu_selection_changed generic_menu_up_or_down_sound}
		]
		current_menu :se_setprops event_handlers = <event_handlers>
	else
		ScriptAssert \{qs(0xfdafa36d)}
	endif
endscript

script mainmenu_setup_option 
	if ScreenElementExists \{id = mainmenu_id}
		RequireParams \{[
				menu_item
			]
			all}
		menu_item_text = ($g_mainmenu_text.<menu_item>.menu_item_text)
	else
		RequireParams \{[
				menu_item_text
			]
			all}
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
			RequireParams \{[
					screen_id
				]
				all}
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
			mainmenu_id :se_setprops {
				mainmenu_helper_text_text = ($g_mainmenu_text.<menu_item>.helper_text)
				motion = ease_in
				time = <time>
			}
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
	RequireParams \{[
			arrow_id
		]
		all}
	<arrow_id> :obj_spawnscript mainmenu_do_scroll_glow
	<arrow_id> :obj_spawnscript mainmenu_do_arrow_pulse
	RunScriptOnScreenElement \{id = current_menu
		mainmenu_freeplay_timer}
endscript

script mainmenu_pad_down 
	RequireParams \{[
			arrow_id
		]
		all}
	<arrow_id> :obj_spawnscript mainmenu_do_scroll_glow
	<arrow_id> :obj_spawnscript mainmenu_do_arrow_pulse params = {down}
	RunScriptOnScreenElement \{id = current_menu
		mainmenu_freeplay_timer}
endscript

script mainmenu_do_arrow_pulse 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = dropdown_arrow
		dims = (64.0, 32.0)
		Pos = (32.0, 16.0)
		just = [center center]
		rgba = (($g_menu_colors).gh5_focus_white)
		z_priority = 6
	}
	if GotParam \{down}
		<id> :se_setprops flip_h
	endif
	<id> :se_setprops Scale = 1.3 time = 0.01 relative_scale
	<id> :se_waitprops
	<id> :se_setprops Scale = 1.0 time = 0.1 relative_scale
	Wait \{0.1
		Seconds}
	DestroyScreenElement id = <id>
endscript

script mainmenu_do_scroll_glow 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		dims = (64.0, 64.0)
		Pos = (32.0, 16.0)
		rgba = [255 215 0 255]
		just = [center center]
		z_priority = 0
		alpha = 0.2
		blend = add
	}
	<id> :se_setprops Scale = 1.2 relative_scale
	<id> :se_setprops Scale = (Random (@ 2.0 @ 2.5 @ 3.0 )) alpha = 0.0 time = 0.2 relative_scale motion = ease_out
	Wait \{0.2
		Seconds}
	DestroyScreenElement id = <id>
endscript

script destroy_main_menu 
	generic_ui_destroy
	DestroyScreenElement \{id = mainmenu_id}
endscript

script main_menu_enable_freeplay 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT user_control_helper_exists \{button = yellow}
		add_user_control_helper \{text = qs(0x8a778398)
			button = yellow
			z = 100
			all_buttons}
	endif
	current_menu :se_setprops \{event_handlers = [
			{
				pad_option2
				main_menu_select_freeplay
			}
		]}
endscript
vv_entering_freeplay_from_main_menu = 0

script main_menu_select_freeplay 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = motdinterface}
		LaunchEvent \{Type = unfocus
			target = motdinterface}
	endif
	SpawnScriptNow \{killmenumusicslowly}
	SpawnScriptNow \{going_into_freeplay_from_main_menu}
	Change \{game_mode = freeplay}
	Change \{pausegh3_called = 0}
	Change \{g_pause_is_busy = 0}
	Change \{in_pause_menu = 0}
	if NOT GotParam \{do_not_play_sfx}
		generic_menu_pad_choose_sound
	endif
	create_loading_screen \{force_predisplay = 1}
	Change \{vv_entering_freeplay_from_main_menu = 1}
	if GotParam \{device_num}
		set_primary_controller {
			device_num = <device_num>
			require_signin = 0
			state = uistate_freeplay
			data = {
				no_sound = 1
				clear_previous_stack
				freeplay_auto_join_device = <device_num>
			}
		}
	else
		ui_event \{event = menu_replace
			data = {
				state = uistate_freeplay
				clear_previous_stack
			}}
	endif
endscript

script main_menu_select_career 
	if ($skip_career_forced_flow = 1)
		main_menu_select_band_lobby lobby_mode = career device_num = <device_num>
	else
		GetGlobalTags career_progression_tags params = career_first_time_setup controller = <device_num>
		if (<career_first_time_setup> = 0)
			main_menu_select_band_lobby lobby_mode = career device_num = <device_num> state = uistate_career_movie data = {movie = 'career_intro' new_state = uistate_character_selection new_data = {device_num = <device_num>}}
		else
			main_menu_select_band_lobby lobby_mode = career device_num = <device_num>
		endif
	endif
endscript

script main_menu_select_band_lobby \{state = uistate_band_lobby_setup
		data = {
		}}
	RequireParams \{[
			lobby_mode
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	setplayerinfo \{1
		controller = 0}
	setplayerinfo \{2
		controller = 1}
	setplayerinfo \{3
		controller = 2}
	setplayerinfo \{4
		controller = 3}
	Change g_lobby_state = <lobby_mode>
	if checksumequals a = <lobby_mode> b = career
		GetGlobalTags career_progression_tags params = career_first_time_setup controller = <device_num>
		if (<career_first_time_setup> = 1)
			Change \{g_lobby_enter_from_main_menu = 1}
		endif
	else
		Change \{g_lobby_enter_from_main_menu = 1}
	endif
	<data> = {<data> device_num = <device_num> from_main_menu}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = <state> data = <data> optional_signin = 1
endscript

script main_menu_select_online 
	hide_glitch \{num_frames = 40}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
endscript

script main_menu_select_music_central 
	getwiicontrollertype controller = <device_num>
	if ((<controller_type> = guitar) || (<controller_type> = drumkit))
		setplayerinfo \{1
			in_game = 0}
		setplayerinfo \{2
			in_game = 0}
		setplayerinfo \{3
			in_game = 0}
		setplayerinfo \{4
			in_game = 0}
		SpawnScriptNow main_menu_select_music_central_valid_controller params = {device_num = <device_num>}
		return
	endif
	create_generic_popup \{title = $wii_jam_notice
		ok_menu
		message = $wii_jam_wrong_controller
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				main_menu_select_music_central_invalid_controller_done
			}
		]
		previous_menu = current_menu}
endscript

script main_menu_select_cas 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	hide_glitch \{num_frames = 10}
	lightshow_notingameplay_setmood \{mood = menu}
	play_cameracut \{prefix = 'cameras_no_band'}
	KillSpawnedScript \{Name = persistent_band_cancel_lobby}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_character_selection optional_signin = 1 data = {device_num = <device_num> from_main_menu}
endscript

script main_menu_select_music_central_invalid_controller_done 
	destroy_generic_popup
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script main_menu_select_music_central_valid_controller 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_music_central
endscript

script main_menu_select_freestyle 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ($enable_saving = 1)
		setplayerinfo \{1
			in_game = 0}
		setplayerinfo \{2
			in_game = 0}
		setplayerinfo \{3
			in_game = 0}
		setplayerinfo \{4
			in_game = 0}
		musician1 :Pause
		musician2 :Pause
		musician3 :Pause
		musician4 :Pause
		generic_menu_pad_choose_sound
		set_primary_controller device_num = <device_num> state = uistate_freestyle_load
	else
		LaunchEvent \{Type = unfocus
			target = current_menu}
		create_dialog_box \{use_all_controllers
			heading_text = qs(0xaa163738)
			body_text = qs(0x41efac64)
			options = [
				{
					func = main_menu_roadie_battle_destroy_error_dialog
					func_params = {
						dont_remove_helpers
					}
					text = qs(0x0e41fe46)
				}
			]}
	endif
endscript

script main_menu_select_training 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_select_training data = {from_main_menu = 1}
endscript

script main_menu_select_roadie_battle 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT IsGuitarController controller = <device_num>
		LaunchEvent \{Type = unfocus
			target = current_menu}
		if ScreenElementExists \{id = motdinterface}
			LaunchEvent \{Type = unfocus
				target = motdinterface}
		endif
		KillSpawnedScript \{Name = mainmenu_freeplay_timer}
		create_dialog_box \{use_all_controllers
			heading_text = qs(0xcf5deb58)
			body_text = qs(0xa1c88526)
			options = [
				{
					func = main_menu_roadie_battle_destroy_error_dialog
					func_params = {
						dont_remove_helpers
					}
					text = qs(0x0e41fe46)
				}
			]
			dlog_event_handlers = [
				{
					pad_up
					nullscript
				}
				{
					pad_down
					nullscript
				}
			]}
		return
	endif
	setplayerinfo \{1
		controller = 0}
	setplayerinfo \{2
		controller = 1}
	setplayerinfo \{3
		controller = 2}
	setplayerinfo \{4
		controller = 3}
	<data> = {<data> device_num = <device_num>}
	Change \{game_mode = roadie_battle}
	Change \{competitive_rules = roadie_battle}
	Change \{g_lobby_state = vs}
	set_primary_controller device_num = <device_num> state = uistate_roadie_battle_splash_screen data = {<data>}
endscript

script main_menu_roadie_battle_destroy_error_dialog 
	clean_up_user_control_helpers
	LaunchEvent \{Type = focus
		target = current_menu}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100
		all_buttons}
	add_user_control_helper \{text = qs(0x8a778398)
		button = yellow
		z = 100
		all_buttons}
	if ScreenElementExists \{id = motdinterface}
		add_user_control_helper \{text = qs(0x3e13521a)
			button = blue
			z = 100
			all_buttons}
		LaunchEvent \{Type = focus
			target = motdinterface}
	endif
	destroy_dialog_box <...>
	RunScriptOnScreenElement \{id = current_menu
		mainmenu_freeplay_timer}
endscript

script main_menu_select_options 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> optional_signin = 1 state = uistate_options data = {no_sound = 1}
endscript

script main_menu_select_leaderboards 
	Change \{rich_presence_context = presence_leaderboards}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> require_signin = 0 state = uistate_leaderboard_instrument data = {no_sound = 1}
endscript

script main_menu_select_debug 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_event_choose \{state = uistate_debug
		data = {
			dont_clear_stack
		}}
endscript
wii_entering_music_store = 0

script main_menu_select_music_store 
	if dlcmanagerfunc \{func = is_ecommerce_okay}
		generic_menu_pad_choose_sound
		Change \{wii_entering_music_store = 1}
		set_primary_controller device_num = <device_num> require_live = 1 musicstore = 1 state = uistate_songlist data = {mode = music_store no_sound = 1}
	else
		KillSpawnedScript \{Name = mainmenu_freeplay_timer}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		if ScreenElementExists \{id = motdinterface}
			LaunchEvent \{Type = unfocus
				target = motdinterface}
		endif
		music_store_handle_error <...> func = main_menu_roadie_battle_destroy_error_dialog params = {dont_remove_helpers}
	endif
endscript

script main_menu_select_motd 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	generic_event_choose \{state = uistate_motd}
endscript

script main_menu_select_vip 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	generic_event_choose \{state = uistate_vip_invite}
endscript

script main_menu_select_rock_archive 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_event_choose \{state = uistate_rock_archive}
endscript

script pop_in_new_downloads_notifier \{time = 0.5}
	Wait \{0.5
		Second}
	if NOT ScreenElementExists \{id = main_menu_text_container}
		return
	endif
	Pos = (100.0, 390.0)
	text = qs(0x40fdb3fc)
	CreateScreenElement {
		Type = TextElement
		parent = main_menu_text_container
		text = <text>
		Scale = 0.5
		rgba = [255 255 205 255]
		just = [center center]
		font_spacing = 5
		font = fontgrid_text_a3
		Pos = <Pos>
		z_priority = 5
		alpha = 0
	}
	GetScreenElementDims id = <id>
	if (<width> >= 500)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((500.0, 0.0) + <height> * (0.0, 1.0)) keep_ar = 1
	endif
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	CreateScreenElement {
		Type = TextElement
		parent = main_menu_text_container
		id = new_downloads_text_glow
		text = <text>
		Scale = 0.5
		rgba = [255 255 255 255]
		font = fontgrid_text_a3
		just = [center center]
		font_spacing = 5
		Pos = <Pos>
		z_priority = 6
		alpha = 0
	}
	GetScreenElementDims id = <id>
	if (<width> >= 500)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((500.0, 0.0) + <height> * (0.0, 1.0)) keep_ar = 1
	endif
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	displaySprite {
		parent = main_menu_text_container
		tex = white
		Pos = (<Pos>)
		just = [center center]
		rgba = [170 90 35 255]
		z = 4
		dims = ((<width> + 20) * (1.0, 0.0) + (0.0, 1.0) * (<height> + 10))
		alpha = 0
	}
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	displaySprite {
		parent = main_menu_text_container
		tex = character_hub_hilite_bookend
		just = [right center]
		rgba = [170 90 35 255]
		z = 4
		Pos = ((<Pos>) - <width> * (0.5, 0.0) - (6.0, 1.0))
		dims = (<height> * (1.0, 1.0))
		flip_v
		alpha = 0
	}
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	displaySprite {
		parent = main_menu_text_container
		tex = character_hub_hilite_bookend
		just = [left center]
		rgba = [170 90 35 255]
		z = 4
		Pos = ((<Pos>) + <width> * (0.5, 0.0) + (6.0, 1.0))
		dims = (<height> * (1.0, 1.0))
		alpha = 0
	}
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	SpawnScriptNow \{glow_new_downloads_text
		params = {
			time = 0.75
		}}
endscript

script main_menu_select_generic 
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if GotParam \{dont_clear_stack}
		generic_event_choose state = <state> data = {<data>}
	else
		generic_event_choose state = <state> data = {<data> clear_previous_stack}
	endif
endscript

script set_primary_controller \{event = menu_change
		require_signin = 1}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	if ((GotParam Force) || ($force_mainmenu_signin = 1))
		Change \{primary_controller_assigned = 0}
		Change \{primary_controller = -1}
		Change \{force_mainmenu_signin = 0}
	endif
	Change \{signin_jam_mode = 0}
	if ($game_mode = freeplay)
		Change \{game_mode = p1_quickplay}
	endif
	if GotParam \{jam}
		if ($jam_view_cam_created = 1)
			ScriptAssert \{'logic error, this value should be zero here'}
		endif
		Change \{signin_jam_mode = 1}
		generic_event_choose event = <event> state = uistate_signin data = {device_num = <device_num> allow_back = 1 new_state = <state> new_data = {<data> jam = 1} jam = 1 require_signin = <require_signin> require_live = <require_live>}
	else
		if ($skip_signin = 1)
			ui_event event = menu_change data = <...>
		else
			generic_event_choose event = <event> no_sound state = uistate_signin data = {device_num = <device_num> allow_back = 1 new_state = <state> new_data = <data> require_signin = <require_signin> require_live = <require_live> downloads = <downloads> leaderboards = <leaderboards> musicstore = <musicstore> optional_signin = <optional_signin>}
		endif
	endif
endscript

script create_sign_in_auto_popup 
	RequireParams \{[
			bandname_id
		]
		all}
	title = qs(0x2c41c7cf)
	text = $wii_would_you_signin
	title1 = qs(0x6d562a67)
	title2 = qs(0x47157885)
	title3 = $wii_auto_signin
	create_generic_popup {
		title = <title>
		option_menu = 3
		focus_option = 2
		message = <text>
		option1 = {
			title = <title1>
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose sign_in_auto_popup_result params = {Result = 1 bandname_id = <bandname_id>}}
			]
		}
		option2 = {
			title = <title2>
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose sign_in_auto_popup_result params = {Result = 0 bandname_id = <bandname_id>}}
			]
		}
		option3 = {
			title = <title3>
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose sign_in_auto_popup_result params = {Result = 2 bandname_id = <bandname_id>}}
			]
		}
	}
endscript

script sign_in_auto_popup_result 
	RequireParams \{[
			Result
			bandname_id
		]
		all}
	destroy_generic_popup
	if (<Result> = 2)
		SetGlobalTags <bandname_id> params = {auto_dwc_login = 1}
		GetGlobalTags <bandname_id> param = auto_dwc_login
		printf \{qs(0xbbca3368)}
		Change \{first_time_creating_main_menu = 1}
		ui_memcard_autosave_replace \{event = menu_replace
			state = uistate_mainmenu}
	elseif (<Result> = 1)
		GetGlobalTags <bandname_id> param = Name
		NetSessionFunc func = OnlineSignIn params = {profile_name = <Name> want_to_enter_wifi_menu = FALSE Profile = ($current_band)}
	else
	endif
	hide_unhide_menu_elements \{id = current_menu
		time = 0.2}
endscript

script mainmenu_freeplay_timer 
	setscriptcannotpause
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Wait ($g_mainmenu_freeplay_timer) Seconds
	main_menu_select_freeplay \{do_not_play_sfx}
endscript

script mainmenu_wait_to_enable_freeplay 
	setscriptcannotpause
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Wait ($g_mainmenu_freeplay_enable_timer) Seconds
	main_menu_enable_freeplay
endscript
