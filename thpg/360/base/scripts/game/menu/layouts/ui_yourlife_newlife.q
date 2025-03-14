
script ui_create_yourlife_newlife 
	printf "UI: ui_create_yourlife_newlife"
	change dont_unhide_loading_screen = 0
	dialog_box_exit
	spawnscriptnow z_bedroom_reorient_skater params = {reset}
	if ($bedroom_select_skater = came_from_crib)
		back_data = {pad_back_script = ui_yourlife_back_to_crib pad_choose_script = ui_yourlife_back_to_crib}
		title = "CREATE-A-SKATER"
	elseif ($bedroom_select_skater = came_from_new_life)
		back_data = {pad_back_script = ui_yourlife_back_to_main_menu}
		title = "NEW STORY"
	else
		if ($bedroom_select_skater = came_from_cas)
			back_data = {pad_back_script = ui_yourlife_back_to_main_menu}
			title = "CREATE-A-SKATER"
		else
			back_data = {pad_back_script = ui_yourlife_back_to_default_zone pad_choose_script = ui_yourlife_back_to_default_zone}
			title = "CREATE-A-SKATER"
		endif
	endif
	make_cas_menu {
		title = <title>
		pausemenu
		nobg
	}
	setscreenelementprops {
		id = current_menu
		event_handlers = [
			{pad_l1 cas_rotate_skater_left}
			{pad_r1 cas_rotate_skater_right}
		]
		replace_handlers
	}
	add_cas_menu_item {
		text = "EDIT SKATER"
		pad_choose_script = ui_yourlife_edit_skater_go
	}
	if NOT getglobalflag flag = $CAREER_INTRO_MOVIE_WATCHED
		add_cas_menu_item {
			text = "RANDOMIZE SKATER"
			pad_choose_script = ui_yourlife_random_skater_prompt
		}
	endif
	if ($bedroom_select_skater = came_from_new_life)
		add_cas_menu_item {
			text = "START GAME"
			pad_choose_script = ui_yourlife_newlife_go
		}
	endif
	if ($bedroom_select_skater = came_from_crib)
		add_cas_menu_item {
			text = "BACK TO SKATE LOUNGE"
			<back_data>
		}
	elseif ($bedroom_select_skater = came_from_new_life)
	elseif ($bedroom_select_skater = came_from_cas)
	else
		add_cas_menu_item {
			text = "BACK TO GAME"
			<back_data>
		}
	endif
	if (($bedroom_select_skater = came_from_new_life) || ($bedroom_select_skater = came_from_career_game))
		add_cas_menu_item {
			text = "RETURN TO MAIN MENU"
			pad_choose_script = ui_yourlife_back_to_main_menu
		}
	endif
	cas_menu_finish helper_text = {
		helper_text_elements = [
			{text = "\\m0 Accept"}
			{text = "\\be/\\bf Rotate"}
		]
	}
	MakeSkaterGoto CasAI params = {no_wait}
	spawnscriptnow z_bedroom_play_face_anim
endscript

script ui_destroy_yourlife_newlife 
	printf \{"UI: ui_destroy_yourlife_newlife"}
	generic_ui_destroy
endscript

script ui_yourlife_edit_skater_go 
	soundevent \{event = CAS_Pan_Left_SFX}
	generic_ui_destroy
	pause_menu_fmv_kill
	z_bedroom_play_cam \{type = edit_skater}
	wait \{0.6
		second}
	spawnscriptnow \{z_bedroom_reorient_skater}
	ui_change_state \{state = UIstate_cas_base}
endscript

script ui_yourlife_random_skater_prompt 
	create_dialog_box {
		title = "randomize skater"
		text = "Are you sure?\\nYour skater's current appearance will be lost."
		no_helper_text
		buttons = [
			{text = "randomize" pad_choose_script = ui_yourlife_random_skater_continue}
			{text = "cancel" pad_choose_script = ui_yourlife_random_skater_cancel}
		]
	}
endscript

script ui_yourlife_random_skater_continue 
	cas_set_random_appearance
	RefreshSkaterModel skater = 0 profile = <currentskaterprofileindex>
endscript

script ui_yourlife_random_skater_cancel 
	destroy_dialog_box
endscript

script ui_yourlife_newlife_go 
	spawnscriptnow ui_yourlife_newlife_go_spawned params = {<...>}
endscript

script ui_yourlife_newlife_go_spawned 
	setspawninstancelimits max = 1 management = ignore_spawn_request
	if NOT gotparam no_autosave
		do_autosave immediate suspend_ui
	endif
	stoprendering
	generic_ui_destroy
	pause_menu_fmv_kill
	fadetoblack on z_priority = -10 time = 0 alpha = 1
	killskatercamanim all
	wait 5 frames
	startrendering
	killallmovies blocking
	ui_yourlife_enable_show_render_flags
	if screenelementexists id = net_view_goals_searching_cont
		destroyscreenelement id = net_view_goals_searching_cont
	endif
	change_level level = ($default_first_zone)
endscript

script ui_yourlife_back_to_default_zone 
	spawnscriptnow \{ui_yourlife_back_to_default_zone_spawned}
endscript

script ui_yourlife_back_to_default_zone_spawned 
	generic_ui_destroy
	do_autosave immediate suspend_ui
	pause_menu_fmv_kill
	generic_ui_destroy
	ui_yourlife_show_loading_screen
	if scriptexists CasAI
		MakeSkaterGoto CasAI params = {exit}
	endif
	skater :anim_command {
		target = face
		command = degenerateblend_addbranch
		params = {
			tree = $blank_animbranch
			blendduration = 0.0
			params = {my_anim = <anim>}
		}
	}
	unloadpak 'pak/frontend_anims/frontend_anims.pak'
	wait 1 seconds
	ui_yourlife_enable_show_render_flags
	change_level level = ($default_first_zone)
endscript

script ui_yourlife_back_to_main_menu 
	spawnscriptnow \{ui_yourlife_back_to_main_menu_spawned}
endscript

script ui_yourlife_back_to_main_menu_spawned 
	generic_ui_destroy
	do_autosave immediate suspend_ui
	pause_menu_fmv_kill
	ui_yourlife_show_loading_screen
	if scriptexists CasAI
		MakeSkaterGoto CasAI params = {exit}
	endif
	skater :anim_command {
		target = face
		command = degenerateblend_addbranch
		params = {
			tree = $blank_animbranch
			blendduration = 0.0
			params = {my_anim = <anim>}
		}
	}
	unloadpak 'pak/frontend_anims/frontend_anims.pak'
	wait 1 seconds
	ui_yourlife_enable_show_render_flags
	change_level level = load_z_mainmenu
endscript

script ui_yourlife_back_to_crib 
	spawnscriptnow \{ui_yourlife_back_to_crib_spawned}
endscript

script ui_yourlife_back_to_crib_spawned 
	generic_ui_destroy
	do_autosave immediate suspend_ui
	pause_menu_fmv_kill
	generic_ui_destroy
	ui_yourlife_show_loading_screen
	if scriptexists CasAI
		MakeSkaterGoto CasAI params = {exit}
	endif
	skater :anim_command {
		target = face
		command = degenerateblend_addbranch
		params = {
			tree = $blank_animbranch
			blendduration = 0.0
			params = {my_anim = <anim>}
		}
	}
	unloadpak 'pak/frontend_anims/frontend_anims.pak'
	wait 1 seconds
	ui_yourlife_enable_show_render_flags
	change_level level = load_z_crib
endscript

script ui_yourlife_show_loading_screen 
	change \{dont_unhide_loading_screen = 0}
	change \{is_changing_levels = 1}
	load_level_handle_movie_loading_screen
endscript

script ui_yourlife_enable_show_render_flags 
	setshadowrenderingflags \{enable = 'true'
		object = 'skin'}
	setshadowrenderingflags \{enable = 'true'
		object = 'nonskin'}
	setshadowrenderingflags \{enable = 'true'
		object = 'env'}
endscript
