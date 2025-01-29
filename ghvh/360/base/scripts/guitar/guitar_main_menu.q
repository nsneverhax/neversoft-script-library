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
	create_frontend_bg
	frontend_load_soundcheck
	reset_all_special_events
	clear_exclusive_devices
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
	disable_pause
	UnPauseGame
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
	if ($autolaunch_cas = 1 || $autolaunch_cas_artist = 1)
		Change \{autolaunch_cas = 0}
		SpawnScriptLater main_menu_select_cas params = {device_num = ($primary_controller)}
	endif
	if ($autolaunch_jam = 1)
		Change \{autolaunch_jam = 0}
		SpawnScriptLater main_menu_select_jam params = {device_num = ($primary_controller)}
	endif
	SpawnScriptNow \{menu_music_fade
		params = {
			in
			time = 0.01
		}}
endscript

script create_frontend_bg 
	SpawnScriptNow \{play_frontend_bg_movie}
	if NOT ScreenElementExists \{id = current_bg_anchor}
		CreateScreenElement \{Type = descinterface
			id = current_bg_anchor
			parent = root_window
			desc = 'main_menu_layout'
			just = [
				center
				center
			]}
		current_bg_anchor :Obj_SpawnScriptNow \{frontend_background_anim}
	endif
endscript

script cleanup_frontend_bg 
	if ScreenElementExists \{id = current_bg_anchor}
		KillSpawnedScript \{Name = frontend_background_anim}
		DestroyScreenElement \{id = current_bg_anchor}
	endif
endscript
frontend_movie_buffer = 2
frontend_movie_texture_slot = 3
frontend_movie = 'VHstage02'
frontend_movie_path = 'movies\\bik\\VHstage02.bik.xen'
frontend_movie_playing = 0
frontend_movie_kill = 0

script play_frontend_bg_movie 
	Change \{frontend_movie_kill = 0}
	check_movie = 0
	if IsMoviePlaying textureSlot = ($frontend_movie_texture_slot)
		check_movie = 1
	endif
	printf channel = movie qs(0x45c03020) p = ($frontend_movie_playing) c = <check_movie>
	printscriptinfo \{channel = movie
		'play_frontend_bg_movie'}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if NOT IsMoviePlaying textureSlot = ($frontend_movie_texture_slot)
		printf channel = movie qs(0x78b8a882) p = ($frontend_movie_playing)
		fadetoblack \{On
			time = 0
			alpha = 1.0
			z_priority = -500
			id = movie_backdrop}
		StopRendering \{reason = bg_movie}
		if NOT ($bink_heap_state = big)
			killallmovies
			waitforallmoviestofinish
			set_bink_heap_state \{state = big}
		elseif IsMoviePlaying textureSlot = ($frontend_movie_texture_slot)
			KillMovie textureSlot = ($frontend_movie_texture_slot)
		endif
		PlayMovie {
			movie = ($frontend_movie)
			textureSlot = ($frontend_movie_texture_slot)
			TexturePri = 1
			no_hold
		}
		begin
		if (($frontend_movie_kill) = 1)
			kill_frontend_bg_movie
			StartRendering \{reason = bg_movie}
			break
		elseif IsMoviePlaying textureSlot = ($frontend_movie_texture_slot)
			printf channel = movie qs(0x94d59837) p = ($frontend_movie_playing)
			Change \{frontend_movie_playing = 1}
			StartRendering \{reason = bg_movie}
			break
		endif
		Wait \{1
			gameframe
			ignoreslomo}
		repeat
	endif
	check_movie = 0
	if IsMoviePlaying textureSlot = ($frontend_movie_texture_slot)
		check_movie = 1
		SpawnScriptNow \{background_movie_fade_watcher}
	endif
	printf channel = movie qs(0x971dd427) p = ($frontend_movie_playing) c = <check_movie> k = ($frontend_movie_kill)
endscript

script background_movie_fade_watcher 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	begin
	if NOT IsMoviePlaying textureSlot = ($frontend_movie_texture_slot)
		Wait \{1
			gameframe}
		fadetoblack \{OFF
			id = movie_backdrop
			no_wait}
		Change \{frontend_movie_playing = 0}
		Change \{frontend_movie_kill = 0}
		printf channel = movie qs(0x6e297407) p = ($frontend_movie_playing) k = ($frontend_movie_kill)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script cleanup_frontend_bg_movie 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	printf channel = movie qs(0xfb2ed2dd) p = ($frontend_movie_playing)
	printscriptinfo \{channel = movie
		'cleanup_frontend_bg_movie'}
	if IsMoviePlaying textureSlot = ($frontend_movie_texture_slot)
		kill_frontend_bg_movie
	elseif ScriptIsRunning \{play_frontend_bg_movie}
		printf channel = movie qs(0xae2c70ba) p = ($frontend_movie_playing)
		Change \{frontend_movie_kill = 1}
	else
		fadetoblack \{OFF
			id = movie_backdrop
			no_wait}
		Change \{frontend_movie_playing = 0}
		Change \{frontend_movie_kill = 0}
	endif
	check_movie = 0
	if IsMoviePlaying textureSlot = ($frontend_movie_texture_slot)
		check_movie = 1
	endif
	printf channel = movie qs(0x6524b8ac) p = ($frontend_movie_playing) c = <check_movie> k = ($frontend_movie_kill)
endscript

script kill_frontend_bg_movie 
	printf channel = movie qs(0x27481b56) p = ($frontend_movie_playing)
	hide_glitch \{num_frames = 3}
	KillMovie textureSlot = ($frontend_movie_texture_slot)
	Change \{frontend_movie_playing = 0}
	Change \{frontend_movie_kill = 0}
	fadetoblack \{OFF
		id = movie_backdrop
		no_wait}
endscript

script mainmenu_focus 
	Obj_GetID
	GetTags
	if GotParam \{isinterface}
		<objID> :se_setprops item_color = ($menu_focus_color)
		<objID> :focus_set_spinners
	else
		se_setprops rgba = ($menu_focus_color)
		<objID> :menu_focus_set_highlight
	endif
endscript

script mainmenu_unfocus 
	Obj_GetID
	GetTags
	if GotParam \{isinterface}
		<objID> :se_setprops item_color = ($menu_unfocus_color)
		if <objID> :desc_resolvealias Name = alias_left_spinner
			hide_spinners spinner_id = <objID>
		endif
	else
		se_setprops rgba = ($menu_unfocus_color)
	endif
endscript

script hookup_spinner_focus_functionality \{menu = current_menu_anchor}
	Obj_GetID
	SetScreenElementProps {
		id = <objID>
		event_handlers = [
			{focus focus_set_spinners params = {menu = <menu>}}
		]
	}
	if <objID> :desc_resolvealias Name = alias_left_spinner
		SetScreenElementProps {
			id = <objID>
			event_handlers = [
				{unfocus hide_spinners params = {spinner_id = <objID>}}
			]
		}
	endif
endscript

script focus_set_spinners \{menu = current_menu_anchor}
	Obj_GetID
	<objID> :se_getprops
	if (<Type> = descinterface)
		if <objID> :desc_resolvealias Name = alias_left_spinner
			if ScriptIsRunning \{animate_spinners}
				KillSpawnedScript \{Name = animate_spinners}
			endif
			<objID> :obj_spawnscript animate_spinners params = {menu_id = <objID>}
		else
			<objID> :menu_focus_set_highlight menu = <menu>
		endif
	else
		<objID> :menu_focus_set_highlight menu = <menu>
	endif
endscript
spinner_spin_rate = 45.0

script animate_spinners spin_rate = ($spinner_spin_rate)
	setscriptcannotpause
	RequireParams \{[
			menu_id
		]
		all}
	if NOT ScreenElementExists id = <menu_id>
		ScriptAssert \{qs(0x98004f72)}
	endif
	if <menu_id> :desc_resolvealias Name = alias_spinner
		spinner_id = <resolved_id>
	else
		spinner_id = <menu_id>
	endif
	if NOT ScreenElementExists id = <spinner_id>
		return
	endif
	if <spinner_id> :desc_resolvealias Name = alias_left_spinner
		left_spinner_id = <resolved_id>
		<left_spinner_id> :se_setprops alpha = 1.0 time = 0.0
	endif
	if <spinner_id> :desc_resolvealias Name = alias_right_spinner
		right_spinner_id = <resolved_id>
		<right_spinner_id> :se_setprops alpha = 1.0 time = 0.0
	endif
	begin
	if NOT ScreenElementExists id = <spinner_id>
		printf \{channel = kim
			qs(0x739173d6)}
		break
	endif
	if ScreenElementExists id = <left_spinner_id>
		<left_spinner_id> :se_getprops rot_angle
		<left_spinner_id> :se_setprops rot_angle = (<rot_angle> + <spin_rate>) time = 0.5
	elseif <spinner_id> :desc_resolvealias Name = alias_left_spinner
		left_spinner_id = <resolved_id>
	endif
	if ScreenElementExists id = <right_spinner_id>
		<right_spinner_id> :se_getprops rot_angle
		<right_spinner_id> :se_setprops rot_angle = (<rot_angle> - <spin_rate>) time = 0.5
	elseif <spinner_id> :desc_resolvealias Name = alias_right_spinner
		right_spinner_id = <resolved_id>
	endif
	Wait \{5
		gameframes
		ignoreslomo}
	repeat
endscript

script hide_spinners \{spinner_id = current_menu_anchor}
	if ScreenElementExists id = <spinner_id>
		if <spinner_id> :desc_resolvealias Name = alias_left_spinner
			left_spinner_id = <resolved_id>
			<left_spinner_id> :se_setprops alpha = 0.0 time = 0.0
		endif
		if <spinner_id> :desc_resolvealias Name = alias_right_spinner
			right_spinner_id = <resolved_id>
			<right_spinner_id> :se_setprops alpha = 0.0 time = 0.0
		endif
	endif
endscript

script highlight_motion \{menu_id = current_menu_anchor
		alias_name = alias_highlight
		motion = spin}
	array_Size = 0
	if <menu_id> :desc_resolvealias Name = <alias_name>
		if NOT (<motion> = spin)
			if GetScreenElementChildren id = <resolved_id>
				GetArraySize <children>
				prev = (<array_Size> - 1)
				curr = 0
				prev_id = (<children> [<prev>])
				curr_id = (<children> [<curr>])
			else
				return
			endif
		endif
	endif
	switch <motion>
		case spin
		animate_spinners menu_id = <menu_id>
		case movie
		begin
		if (<array_Size> > 0)
			prev_id = (<children> [<prev>])
			curr_id = (<children> [<curr>])
			<prev_id> :se_setprops alpha = 0.0
			<curr_id> :se_setprops alpha = 1
			prev = <curr>
			curr = (<curr> + 1)
			if (<curr> >= <array_Size>)
				curr = 0
			endif
		endif
		Wait \{0.1
			Second}
		repeat
		case Bounce
		return
		case random_highlight
		if (<array_Size> > 0)
			begin
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
		default
		ScriptAssert \{qs(0x01720eb0)}
	endswitch
endscript

script create_main_menu_elements 
	if NOT ($invite_controller = -1)
		return
	endif
	if ScreenElementExists \{id = current_menu_anchor}
		current_menu_anchor :Die
	endif
	set_focus_color
	set_unfocus_color
	CreateScreenElement \{Type = descinterface
		parent = root_window
		id = current_menu_anchor
		desc = 'menu_frontend'
		just = [
			center
			center
		]}
	if <id> :desc_resolvealias Name = alias_menu
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops {
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
			tags = {item_scale = <item_scale>}
			spacing_between = -15
		}
	endif
	add_menu_frontend_item \{desc = 'menu_tape_01'
		text = qs(0xde7ec8b3)
		pad_choose_script = main_menu_select_career}
	add_menu_frontend_item \{desc = 'menu_tape_02'
		text = qs(0xfabdce2b)
		pad_choose_script = main_menu_select_quickplay}
	add_menu_frontend_item \{desc = 'menu_tape_03'
		text = qs(0xfef0f891)
		pad_choose_script = main_menu_select_multiplayer}
	if isXenon
		text = qs(0x2725b21f)
	else
		text = qs(0xe60e3e4a)
	endif
	add_menu_frontend_item {
		desc = 'menu_tape_04'
		text = <text>
		pad_choose_script = main_menu_select_online
	}
	add_menu_frontend_item \{desc = 'menu_tape_05'
		text = qs(0x17044f94)
		pad_choose_script = main_menu_select_backstage}
	add_menu_frontend_item \{desc = 'menu_tape_01'
		text = qs(0x2c98ca28)
		pad_choose_script = main_menu_select_options}
	add_menu_frontend_item \{desc = 'menu_tape_02'
		text = qs(0x79dfdd25)
		pad_choose_script = main_menu_select_jam}
	show_debug_menus = 0
	if ($enable_button_cheats = 1)
		<show_debug_menus> = 1
		if ($enable_debug_menus = 0)
			<show_debug_menus> = 0
		endif
	endif
	if (<show_debug_menus> = 1)
		add_menu_frontend_item \{text = qs(0x8592df80)
			internal_scale = 0.8
			pad_choose_script = main_menu_select_debug}
	endif
	return
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
		current_menu :obj_spawnscript \{highlight_motion
			no_flip}
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
					{pad_choose main_menu_select_online}
				]
			}
			if isps3
				<curr_id> :se_setprops dims = (0.0, 0.0) text = qs(0xe60e3e4a)
			endif
			curr_id = (<children> [4])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_backstage}
				]
			}
			curr_id = (<children> [5])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_options}
				]
			}
			curr_id = (<children> [6])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_jam}
				]
			}
			curr_id = (<children> [7])
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
endscript

script destroy_main_menu 
	generic_ui_destroy
	destroy_viewport_ui
endscript

script main_menu_select_career 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Change \{game_mode = p1_career}
	main_menu_select_generic device_num = <device_num> state = uistate_game_mode
endscript

script main_menu_select_quickplay 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	main_menu_select_generic device_num = <device_num> state = uistate_game_mode data = {mode = quickplay}
endscript

script main_menu_select_multiplayer 
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

script main_menu_select_online 
	hide_glitch \{num_frames = 40}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	main_menu_select_online_continue <...>
endscript

script main_menu_select_online_continue 
	if isXenon
		failed = 0
		sign_in = 1
		if NetSessionFunc \{func = is_cable_unplugged}
			failed = 1
			sign_in = 0
			text = qs(0xeef7c882)
		elseif NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
			failed = 1
			text = qs(0xb9fd7c2c)
		elseif NOT CheckForSignIn local controller_index = <device_num> dont_set_primary
			failed = 1
			text = qs(0xee63bbfc)
		elseif NOT CheckForSignIn controller_index = <device_num> dont_set_primary
			failed = 1
			text = qs(0x7888d99e)
		elseif NOT NetSessionFunc func = ismultiplayerallowed params = {controller_index = <device_num>}
			failed = 1
			text = qs(0x076f1bf2)
		endif
		if (<failed> = 1)
			LaunchEvent \{Type = unfocus
				target = current_menu}
			array = []
			if (<sign_in> = 1)
				AddArrayElement array = <array> element = {func = {main_menu_signin_for_online} func_params = {device_num = <device_num>} text = qs(0x17df5913)}
			endif
			AddArrayElement array = <array> element = {func = {main_menu_go_back} text = qs(0x320a8d1c)}
			create_popup_warning_menu {
				textblock = {
					text = <text>
					Pos = (640.0, 370.0)
				}
				menu_pos = (640.0, 465.0)
				player_device = <device_num>
				options = <array>
			}
			return
		endif
	endif
	set_primary_controller device_num = <device_num> state = uistate_net_setup require_live = 1
endscript

script main_menu_go_back 
	destroy_popup_warning_menu
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script main_menu_signin_for_online 
	NetSessionFunc \{func = showsigninui
		params = {
			online_only
		}}
	wait_for_blade_complete
	SetButtonEventMappings \{block_menu_input}
	Wait \{1
		Seconds
		ignoreslomo}
	destroy_popup_warning_menu
	SetButtonEventMappings \{unblock_menu_input}
	main_menu_select_online_continue device_num = <device_num>
endscript

script main_menu_select_backstage 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_backstage
endscript

script main_menu_select_downloads 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_downloads downloads = 1
endscript

script main_menu_select_options 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_options
endscript

script main_menu_select_jam 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if isXenon
		Change \{jam_curr_directory_listing = [
			]}
	endif
	Change \{respond_to_signin_changed = 1}
	set_primary_controller device_num = <device_num> state = uistate_jam jam
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

script main_menu_select_cas 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	set_primary_controller device_num = <device_num> state = uistate_character_selection data = {from_main_menu = 1}
	cleanup_frontend_bg_movie
endscript

script main_menu_select_debug 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	generic_event_choose \{state = uistate_debug}
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
	generic_event_choose state = <state> data = <data>
endscript

script set_primary_controller \{event = menu_change}
	RequireParams \{[
			device_num
		]
		all}
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
			ScriptAssert \{'logic error, this value should be zero here'}
		endif
		Change \{signin_jam_mode = 1}
		generic_event_choose event = <event> state = uistate_signin data = {device_num = <device_num> allow_back = 1 new_state = <state> new_data = <data> jam = 1 require_live = <require_live>}
	else
		if GotParam \{require_live}
			Force = 1
		elseif GotParam \{leaderboards}
			Force = 1
		endif
		if NOT GotParam \{Force}
			if current_band_save_created controller = <device_num>
				if CheckForSignIn local controller_index = <device_num>
					Change primary_controller = <device_num>
					Change last_start_pressed_device = <device_num>
					restore_globals_from_global_tags
					refresh_autokick_cheat
					generic_event_choose event = <event> state = <state> data = <data> no_sound = <no_sound>
					return
				endif
			endif
			get_savegame_from_controller controller = <device_num>
			if NOT is_autosave_on savegame = <savegame>
				Change primary_controller = <device_num>
				Change last_start_pressed_device = <device_num>
				restore_globals_from_global_tags
				refresh_autokick_cheat
				generic_event_choose event = <event> state = <state> data = <data> no_sound = <no_sound>
				return
			endif
		endif
		printscriptinfo
		finalprintf \{qs(0x858bff12)}
		printstruct <...>
		generic_event_choose event = <event> no_sound state = uistate_signin data = {device_num = <device_num> allow_back = 1 new_state = <state> new_data = <data> require_live = <require_live> downloads = <downloads> leaderboards = <leaderboards> musicstore = <musicstore>}
	endif
endscript
force_pak_caching = 0
disable_pak_caching = 0

script is_soundcheck_loaded 
	if GetPakManCurrent \{map = zones}
		printf channel = UI 'Is_Soundcheck_loaded : %s is loaded' s = <pak> donotresolve
		if (<pak> = z_soundcheck)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script frontend_load_soundcheck \{async = 1}
	printscriptinfo \{channel = UI
		'frontend_load_soundcheck'}
	if GetPakManCurrent \{map = zones}
		printf channel = UI 'frontend_load_soundcheck : %s is loaded' s = <pak> donotresolve
		if NOT (<pak> = z_soundcheck)
			load_soundcheck = 1
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
				create_loading_screen
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
		if GotParam \{load_anims}
			load_frontend_anim_paks \{async = 1}
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
	printf \{'reset_character_ids'}
	Change \{structurename = player1_status
		character_id = Judy}
	Change \{structurename = player2_status
		character_id = Judy}
	Change \{structurename = player3_status
		character_id = Judy}
	Change \{structurename = player4_status
		character_id = Judy}
	Change \{structurename = player5_status
		character_id = Judy}
	Change \{structurename = player6_status
		character_id = Judy}
	Change \{structurename = player7_status
		character_id = Judy}
	Change \{structurename = player8_status
		character_id = Judy}
endscript
initial_bg_anim_spawn = 1

script frontend_background_anim 
	printf \{channel = kim
		qs(0xe1eea255)}
	se_getprops \{mm_bg_top_pos}
	<org_mm_bg_top_pos> = <mm_bg_top_pos>
	se_getprops \{mm_bg_bot_pos}
	<org_mm_bg_bot_pos> = <mm_bg_bot_pos>
	se_getprops \{mm_bg_bot_02_pos}
	<org_mm_bg_bot_02_pos> = <mm_bg_bot_02_pos>
	se_getprops \{mm_white_stripe_01_pos}
	<org_mm_white_stripe_01_pos> = <mm_white_stripe_01_pos>
	se_getprops \{mm_white_stripe_01b_pos}
	<org_mm_white_stripe_01b_pos> = <mm_white_stripe_01b_pos>
	se_getprops \{mm_white_stripe_02_pos}
	<org_mm_white_stripe_02_pos> = <mm_white_stripe_02_pos>
	se_getprops \{mm_white_stripe_02b_pos}
	<org_mm_white_stripe_02b_pos> = <mm_white_stripe_02b_pos>
	se_getprops \{mm_white_stripe_03_pos}
	<org_mm_white_stripe_03_pos> = <mm_white_stripe_03_pos>
	se_getprops \{mm_white_stripe_04_pos}
	<org_mm_white_stripe_04_pos> = <mm_white_stripe_04_pos>
	se_getprops \{mm_black_stripe_01_pos}
	<org_mm_black_stripe_01_pos> = <mm_black_stripe_01_pos>
	se_getprops \{mm_black_stripe_01b_pos}
	<org_mm_black_stripe_01b_pos> = <mm_black_stripe_01b_pos>
	se_getprops \{mm_black_stripe_02_pos}
	<org_mm_black_stripe_02_pos> = <mm_black_stripe_02_pos>
	se_getprops \{mm_black_stripe_03_pos}
	<org_mm_black_stripe_03_pos> = <mm_black_stripe_03_pos>
	se_getprops \{mm_blacktrans_stripe_11_pos}
	<org_mm_blacktrans_stripe_11_pos> = <mm_blacktrans_stripe_11_pos>
	if ($initial_bg_anim_spawn = 1)
		Change \{initial_bg_anim_spawn = 0}
		se_setprops mm_bg_top_pos = (<org_mm_bg_top_pos> + (2000.0, 150.0))
		se_setprops mm_bg_bot_pos = (<org_mm_bg_bot_pos> + (-1450.0, 0.0))
		se_setprops mm_bg_bot_02_pos = (<org_mm_bg_bot_02_pos> + (1060.0, -110.0))
		se_setprops mm_white_stripe_01_pos = (<org_mm_white_stripe_01_pos> + (2056.0, 200.0))
		se_setprops mm_white_stripe_01b_pos = (<org_mm_white_stripe_01b_pos> + (273.0, -277.0))
		se_setprops mm_white_stripe_02_pos = (<org_mm_white_stripe_02_pos> + (162.0, 875.0))
		se_setprops mm_white_stripe_02b_pos = (<org_mm_white_stripe_02b_pos> + (1600.0, 0.0))
		se_setprops mm_white_stripe_03_pos = (<org_mm_white_stripe_03_pos> + (80.0, 442.0))
		se_setprops mm_white_stripe_04_pos = (<org_mm_white_stripe_04_pos> + (893.0, -13.0))
		se_setprops mm_black_stripe_01_pos = (<org_mm_black_stripe_01_pos> + (-1481.0, 242.0))
		se_setprops mm_black_stripe_01b_pos = (<org_mm_black_stripe_01b_pos> + (391.0, 329.0))
		se_setprops mm_black_stripe_02_pos = (<org_mm_black_stripe_02_pos> + (0.0, 0.0))
		se_setprops \{mm_black_stripe_02_alpha = 0.0}
		se_setprops mm_black_stripe_03_pos = (<org_mm_black_stripe_03_pos> + (98.0, -1238.0))
		se_setprops mm_blacktrans_stripe_11_pos = (<org_mm_blacktrans_stripe_11_pos> + (98.0, -1238.0))
		se_setprops \{logogh_vh_alpha = 0.0}
		se_setprops \{logogh_vh_alpha = 1.0
			time = 3.5}
		Wait \{0.33
			Seconds}
		se_setprops mm_bg_top_pos = <org_mm_bg_top_pos> time = 0.06
		Wait \{0.21000001
			Seconds}
		se_setprops mm_bg_bot_pos = <org_mm_bg_bot_pos> time = 0.04
		Wait \{0.22
			Seconds}
		se_setprops mm_bg_bot_02_pos = <org_mm_bg_bot_02_pos> time = 0.044999998
		Wait \{0.43
			Seconds}
		se_setprops mm_black_stripe_01_pos = <org_mm_black_stripe_01_pos> time = 0.13
		se_setprops mm_black_stripe_01b_pos = <org_mm_black_stripe_01b_pos> time = 0.2
		Wait \{0.23
			Seconds}
		se_setprops mm_white_stripe_01b_pos = <org_mm_white_stripe_01b_pos> time = 0.05
		se_setprops mm_white_stripe_02b_pos = <org_mm_white_stripe_02b_pos> time = 0.11
		Wait \{0.16
			Seconds}
		se_setprops mm_white_stripe_01_pos = <org_mm_white_stripe_01_pos> time = 0.055
		se_setprops mm_white_stripe_02_pos = <org_mm_white_stripe_02_pos> time = 0.11
		Wait \{0.17
			Seconds}
		se_setprops mm_white_stripe_03_pos = <org_mm_white_stripe_03_pos> time = 0.09
		se_setprops mm_white_stripe_04_pos = <org_mm_white_stripe_04_pos> time = 0.075
		se_setprops mm_black_stripe_03_pos = <org_mm_black_stripe_03_pos> time = 0.08
		se_setprops mm_blacktrans_stripe_11_pos = (<org_mm_blacktrans_stripe_11_pos>) time = 0.08
		se_setprops \{mm_black_stripe_02_alpha = 1.0
			time = 1.5}
	endif
	Wait \{2
		Seconds}
	begin
	element = Random (@ mm_white_stripe_01 @ mm_white_stripe_02 @ mm_white_stripe_03 @ mm_white_stripe_04 @ mm_black_stripe_01 @ mm_black_stripe_02 @ mm_black_stripe_03 )
	switch <element>
		case mm_white_stripe_01
		se_setprops mm_white_stripe_01_pos = (<org_mm_white_stripe_01_pos> + (-1900.0, -150.0)) time = 0.33
		se_setprops mm_white_stripe_01_pos = (<org_mm_white_stripe_01_pos> + (1485.0, 88.0)) time = 0
		se_setprops mm_white_stripe_01_pos = <org_mm_white_stripe_01_pos> time = 0.33
		case mm_white_stripe_02
		se_setprops mm_white_stripe_02_pos = (<org_mm_white_stripe_02_pos> + (385.0, -980.0)) time = 0.33
		se_setprops mm_white_stripe_02_pos = (<org_mm_white_stripe_02_pos> + (162.0, 875.0)) time = 0.0
		se_setprops mm_white_stripe_02_pos = <org_mm_white_stripe_02_pos> time = 0.33
		case mm_white_stripe_03
		se_setprops mm_white_stripe_03_pos = (<org_mm_white_stripe_03_pos> + (-1167.0, -523.0)) time = 0.33
		se_setprops mm_white_stripe_03_pos = (<org_mm_white_stripe_03_pos> + (80.0, 442.0)) time = 0.0
		se_setprops mm_white_stripe_03_pos = <org_mm_white_stripe_03_pos> time = 0.33
		case mm_white_stripe_04
		se_setprops mm_white_stripe_04_pos = (<org_mm_white_stripe_04_pos> + (-513.0, 584.0)) time = 0.33
		se_setprops mm_white_stripe_04_pos = (<org_mm_white_stripe_04_pos> + (893.0, -13.0)) time = 0.0
		se_setprops mm_white_stripe_04_pos = <org_mm_white_stripe_04_pos> time = 0.33
		case mm_black_stripe_01
		se_setprops mm_black_stripe_01_pos = (<org_mm_black_stripe_01_pos> + (-1473.0, 474.0)) time = 0.33
		se_setprops mm_black_stripe_01_pos = (<org_mm_black_stripe_01_pos> + (-1481.0, 242.0)) time = 0.0
		se_setprops mm_black_stripe_01_pos = <org_mm_black_stripe_01_pos> time = 0.33
		case mm_black_stripe_02
		se_setprops \{mm_black_stripe_02_alpha = 0.0
			time = 0.5}
		Wait \{0.66
			Seconds}
		se_setprops \{mm_black_stripe_02_alpha = 1.0
			time = 0.5}
		case mm_black_stripe_03
		se_setprops mm_black_stripe_03_pos = (<org_mm_black_stripe_03_pos> + (602.0, 1199.0)) time = 0.33
		se_setprops mm_blacktrans_stripe_11_pos = (<org_mm_blacktrans_stripe_11_pos> + (602.0, 1199.0)) time = 0.33
		se_setprops mm_black_stripe_03_pos = (<org_mm_black_stripe_03_pos> + (98.0, -1238.0)) time = 0.0
		se_setprops mm_blacktrans_stripe_11_pos = (<org_mm_blacktrans_stripe_11_pos> + (98.0, -1238.0)) time = 0.0
		se_setprops mm_black_stripe_03_pos = <org_mm_black_stripe_03_pos> time = 0.33
		se_setprops mm_blacktrans_stripe_11_pos = (<org_mm_blacktrans_stripe_11_pos>) time = 0.33
	endswitch
	randtime = Random (@ 2 )
	Wait <randtime> Seconds
	repeat
endscript
