force_mainmenu_signin = 0

script create_main_menu 
	Change \{respond_to_signin_changed = 0}
	closesonglogfile
	reset_quickplay_song_list
	cas_destroy_all_characters
	reset_character_ids
	sanity_check_fix_deleted_characters
	band_builder_clear_random_appearances
	destroy_band
	destroy_bandname_viewport
	frontend_load_soundcheck
	reset_all_special_events
	clear_exclusive_devices
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
	disable_pause
	UnPauseGame
	Change \{check_for_unplugged_controllers = 1}
	Change \{current_num_players = 1}
	Change structurename = player1_status controller = ($primary_controller)
	disable_pause
	SpawnScriptNow \{menu_music_on}
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	Change \{should_reset_gig_posters_selection = 1}
	Change \{setlist_previous_tier = 1}
	Change \{setlist_previous_song = 0}
	Change \{setlist_previous_tab = tab_setlist}
	Change \{current_song = $startup_song}
	Change \{end_credits = 0}
	Change \{battle_do_or_die = 0}
	Change \{battle_do_or_die_speed_scale = 1.0}
	Change \{battle_do_or_die_attack_scale = 1.0}
	Change \{rich_presence_context = presence_menus}
	Change \{player1_device = 0}
	Change \{player2_device = 1}
	Change \{player3_device = 2}
	Change \{player4_device = 3}
	Change \{current_gig_number = 1}
	Change \{current_progression_flag = None}
	Change \{options_for_manage_band = 0}
	if NOT ($invite_controller = -1)
		Change \{invite_controller = -1}
		main_menu_select_online
		fadetoblack \{OFF
			time = 0}
	else
	endif
	if ($autolaunch_cas = 1 || $autolaunch_cas_artist = 1)
		Change \{autolaunch_cas = 0}
		SpawnScriptLater main_menu_select_cas params = {device_num = ($primary_controller)}
	endif
	SpawnScriptNow \{menu_music_fade
		params = {
			in
			time = 0.01
		}}
endscript

script mainmenu_focus 
	Obj_GetID
	GetTags
	if current_menu_anchor :desc_resolvealias \{Name = alias_highlight}
		Wait \{2
			gameframe}
		GetScreenElementDims id = <objID>
		Scale = (((1.0, 0.0) * (((<width> + 100.0) / 256.0))) + (0.0, 1.5))
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
	se_setprops \{rgba = [
			0
			0
			0
			255
		]}
endscript

script highlight_motion \{menu_id = current_menu_anchor
		alias_name = alias_highlight}
	if <menu_id> :desc_resolvealias Name = <alias_name>
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			prev = 0
			curr = 1
			begin
			prev_id = (<children> [<prev>])
			curr_id = (<children> [<curr>])
			<prev_id> :se_setprops alpha = 0.0
			<curr_id> :se_setprops alpha = 1
			prev = <curr>
			next = RandomInteger (0.0, 2.0)
			if (<next> = <prev>)
				curr = (<curr> + 1)
			else
				curr = <next>
			endif
			if (<curr> >= <array_Size>)
				curr = 0
			endif
			if NOT GotParam \{no_flip}
				rand = Random (@ 0 @ 1 )
				if (<rand> = 1)
					<curr_id> :se_setprops flip_v = true
				else
					<curr_id> :se_setprops flip_v = FALSE
				endif
				rand = Random (@ 0 @ 1 )
				if (<rand> = 1)
					<curr_id> :se_setprops flip_h = true
				else
					<curr_id> :se_setprops flip_h = FALSE
				endif
			endif
			Wait \{0.1
				Second}
			repeat
		endif
	endif
endscript

script create_main_menu_elements 
	0xc0a98a59
	if NOT ($invite_controller = -1)
		return
	endif
	if ScreenElementExists \{id = current_menu_anchor}
		current_menu_anchor :Die
	endif
	CreateScreenElement \{Type = descinterface
		id = current_menu_anchor
		parent = root_window
		desc = 'main_menu_layout'
		just = [
			center
			center
		]}
	if current_menu_anchor :desc_resolvealias \{Name = alias_menu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops \{event_handlers = [
				{
					pad_up
					generic_menu_up_or_down_sound
					params = {
						up
					}
				}
				{
					pad_down
					generic_menu_up_or_down_sound
					params = {
						down
					}
				}
			]}
		current_menu :obj_spawnscript \{highlight_motion}
		if GetScreenElementChildren \{id = current_menu}
			GetArraySize <children>
			i = 0
			begin
			curr_id = (<children> [<i>])
			<curr_id> :se_setprops {
				event_handlers = [
					{focus mainmenu_focus}
					{unfocus mainmenu_unfocus}
				]
				tags = {index = <i>}
			}
			i = (<i> + 1)
			repeat <array_Size>
			curr_id = (<children> [0])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_career}
				]
			}
			curr_id = (<children> [1])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_quickplay}
				]
			}
			curr_id = (<children> [2])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_multiplayer}
				]
			}
			curr_id = (<children> [3])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_backstage}
				]
			}
			curr_id = (<children> [4])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_options}
				]
			}
			curr_id = (<children> [5])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_debug}
				]
			}
			show_debug_menus = 0
			if ($enable_button_cheats = 1)
				<show_debug_menus> = 1
				if ($enable_debug_menus = 0)
					<show_debug_menus> = 0
				endif
			endif
			if (<show_debug_menus> = 0)
				<curr_id> :Die
			endif
		endif
	endif
	return
	base_menu_pos = (730.0, 125.0)
	main_menu_font = fontgrid_title_a1
	create_viewport_ui \{texture = 0x4af58676
		texdict = `zones/z_soundcheck/z_soundcheck.tex`}
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	if ($is_demo_mode = 0)
		if ($is_multiplayer_beta = 1)
			demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
		else
			demo_mode_disable = {}
		endif
	endif
	CreateScreenElement {
		Type = VMenu
		parent = <window_id>
		id = current_menu
		dims = (1280.0, 720.0)
		just = [left top]
		Pos = (100.0, 0.0)
		internal_just = [center bottom]
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		position_children = FALSE
	}
	container_pos = (512.0, 115.0)
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			Pos = (<container_pos>)
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0xde7ec8b3)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_career
	}
	container_pos = (<container_pos> + (0.0, 105.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			Pos = <container_pos>
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0xfabdce2b)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_quickplay
	}
	container_pos = (<container_pos> + (0.0, 105.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			Pos = (<container_pos> + (20.0, 0.0))
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0xfef0f891)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_multiplayer
	}
	container_pos = (<container_pos> + (0.0, 85.0))
	if Spanish
		container_pos = (<container_pos> + (0.0, 20.0))
	endif
	container_pos = (<container_pos> + (0.0, 85.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			Pos = (<container_pos> + (-40.0, 0.0))
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0x9f894c1e)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_cas
	}
	container_pos = (<container_pos> + (0.0, 85.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			Pos = (<container_pos> + (-40.0, 0.0))
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0x976cf9e7)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_options
	}
	container_pos = (<container_pos> + (0.0, 55.0))
	show_debug_menus = 0
	if ($enable_button_cheats = 1)
		<show_debug_menus> = 1
		if ($enable_debug_menus = 0)
			<show_debug_menus> = 0
		endif
	endif
	if (<show_debug_menus>)
		if ($is_multiplayer_beta = 0)
			add_mainmenu_item {
				parent = current_menu
				container_params = {
					Pos = <container_pos>
					dims = (200.0, 30.0)
				}
				text_params = {
					text = qs(0xe4963f83)
					Scale = 0.65000004
				}
				choose_script = main_menu_select_debug
			}
		endif
	endif
endscript

script add_mainmenu_item \{default_container_params = {
			dims = (200.0, 50.0)
			child_anchor = [
				center
				top
			]
			Scale = 1.8
		}
		default_text_params = {
			text = qs(0x03ac90f0)
			rgba = [
				200
				200
				200
				250
			]
			font = fontgrid_text_a11_large
			just = [
				center
				center
			]
		}
		choose_script = nullscript}
	if GlobalExists \{Name = massive_build}
		if NOT ($massive_build = 0)
			if GotParam \{massive_secret_item}
				return
			endif
		endif
	endif
	CreateScreenElement {
		<default_container_params>
		<container_params>
		Type = ContainerElement
		parent = <parent>
		event_handlers = [
			{focus mainmenu_item_focus}
			{unfocus mainmenu_item_unfocus}
			{pad_choose <choose_script>}
		]
	}
	container_id = <id>
	CreateScreenElement {
		font = ($test_menu_font)
		<default_text_params>
		<text_params>
		Type = TextElement
		parent = <container_id>
		local_id = text
	}
	GetScreenElementDims id = <id>
	if (<width> > 420)
		SetScreenElementProps id = <id> Scale = 1
		fit_text_in_rectangle id = <id> dims = ((420.0, 0.0) + <height> * (0.0, 1.0))
	endif
	return container_id = <container_id>
endscript

script mainmenu_item_focus 
	Obj_GetID
	<id> = <objID>
	SetScreenElementProps id = {<id> child = text} rgba = [210 210 210 250]
endscript

script mainmenu_item_unfocus 
	Obj_GetID
	<id> = <objID>
	SetScreenElementProps id = {<id> child = text} rgba = [200 200 200 250]
endscript

script destroy_main_menu 
	generic_ui_destroy
	destroy_viewport_ui
endscript

script main_menu_select_career 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{game_mode = p1_career}
	main_menu_select_generic device_num = <device_num> state = uistate_game_mode data = {use_all_controllers}
endscript

script main_menu_select_quickplay 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	main_menu_select_generic device_num = <device_num> state = uistate_game_mode data = {mode = quickplay}
endscript

script main_menu_select_multiplayer 
	if ScriptIsRunning \{menu_transition_in_spawned}
		KillSpawnedScript \{Name = menu_transition_in_spawned}
	endif
	if ScriptIsRunning \{menu_transition_in}
		KillSpawnedScript \{Name = menu_transition_in}
	endif
	GetActiveControllers
	GetArraySize <active_controllers>
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
		Change primary_controller = <device_num>
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_generic_alert_popup
				is_popup
				title = qs(0xcf5deb58)
				text = qs(0xc8986629)
			}}
	else
		SpawnScriptNow \{0x0308347c}
	endif
endscript

script 0x077dbb38 
	destroy_generic_popup
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script 0x0308347c 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{game_mode = p2_faceoff}
	Change \{current_num_players = 2}
	Change \{structurename = player1_status
		part = guitar}
	Change \{structurename = player2_status
		part = guitar}
	main_menu_select_generic device_num = <device_num> state = uistate_select_controller
endscript

script main_menu_select_training 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{game_mode = training}
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

script main_menu_select_backstage 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_backstage
endscript

script main_menu_select_options 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_options
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

script main_menu_select_debug 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_event_choose \{state = uistate_debug}
endscript

script main_menu_select_generic 
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	generic_event_choose state = <state> data = <data>
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
		refresh_autokick_cheat
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
				0xf7e0f992 \{0xdf3c5641
					Wait}
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
			if pakfilesarecached
				SetPakManCurrentBlock \{map = zones
					pak = z_soundcheck
					block_scripts = 1}
			else
				SetPakManCurrentBlock map = zones pak = z_soundcheck block_scripts = (<async> - 1)
			endif
		endif
		loadvenuevideo \{pn = z_soundcheck}
		if GotParam \{load_anims}
			load_frontend_anim_paks async = <async>
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
