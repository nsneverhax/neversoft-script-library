
script ui_create_yourlife 
	printf "UI: ui_create_yourlife"
	spawnscriptnow pause_menu_fmv_play
	change_gamemode_career
	careerfunc func = setappropriatenodeflags
	make_cas_menu {
		title = "STORY MODE"
		back_state = uistate_mainmenu
		pausemenu
	}
	if istrue $ui_show_debug_menus
		add_cas_menu_item {
			text = "LEVEL SELECT (DEBUG)"
			pad_choose_script = ui_yourlife_debug_level_select
		}
	endif
	if getglobalflag flag = $career_started
		add_cas_menu_item {
			text = "CONTINUE STORY"
			pad_choose_script = ui_yourlife_continue_life
		}
	else
		add_cas_menu_item {
			text = "CONTINUE STORY"
			not_focusable
		}
	endif
	add_cas_menu_item {
		text = "NEW STORY"
		pad_choose_script = ui_yourlife_goto_new_career
	}
	if isxenon
		if checkforsignin local
			add_cas_menu_item {
				text = "LOAD GAME"
				choose_state = UIstate_loadgame_CareerOptions
			}
		else
			add_cas_menu_item {
				text = "LOAD GAME"
				not_focusable
			}
		endif
	else
		add_cas_menu_item {
			text = "LOAD GAME"
			choose_state = UIstate_loadgame_CareerOptions
		}
	endif
	add_cas_menu_item {
		text = "MAIN MENU"
		choose_state = uistate_mainmenu
	}
	cas_menu_finish {
		helper_text = {
			helper_text_elements = [{text = "\\m1 MAIN MENU"}
				{text = "\\m0 ACCEPT"}
			]
		}
	}
endscript

script ui_destroy_yourlife 
	printf \{"UI: ui_destroy_yourlife"}
	generic_ui_destroy
endscript

script ui_yourlife_debug_level_select 
	printf \{'ui_yourlife_level_select'}
	setglobalflag \{flag = $career_started}
	cas_ensure_skater_loaded \{name = custom_story
		loading_screen}
	ui_change_state \{state = UIstate_pauselevel}
endscript

script ui_yourlife_continue_life 
	spawnscriptnow \{ui_yourlife_continue_life_spawned}
endscript

script ui_yourlife_continue_life_spawned 
	mainmenu_display_loading_screen
	generic_ui_destroy
	pause_menu_fmv_kill
	wait \{1
		second}
	cas_ensure_skater_loaded \{name = custom_story}
	careerfunc \{func = getlastlevelplayed}
	if NOT gotparam \{last_level}
		last_level = $default_first_zone
	endif
	ui_hack_filter_locked_zone level = <last_level>
	change_level level = <last_level>
endscript

script ui_hack_filter_locked_zone 
	GetLevelStructureName level = <level>
	formattext checksumname = zone_checksum '%s' s = (<level_structure_name>.level)
	if NOT careerfunc func = iszoneunlocked params = {zone = <zone_checksum>}
		printf "WARNING: Trying to spawn the player in a locked zone (%s). Defaulting to an unlocked zone." s = (<level_structure_name>.level)
		return last_level = ($default_first_zone)
	endif
endscript

script ui_yourlife_goto_new_career 
	if isxenon
		if NOT checkforsignin local
			xenon_create_sign_in_dialog device_num = <device_num>
			block type = profile_status_confirmed
		endif
	endif
	setglobalflag flag = $CAREER_STARTED_FROM_MAINMENU
	if getglobalflag flag = $career_started
		generic_ui_destroy
		create_dialog_box {title = "New Story"
			text = "You will lose any existing unsaved story progress."
			buttons = [{text = "ok" pad_choose_script = ui_yourlife_goto_new_career_okay}
				{text = "cancel" pad_choose_script = ui_create_yourlife}]
		}
	else
		ui_yourlife_goto_new_career_okay
	endif
endscript

script ui_yourlife_goto_new_career_okay 
	force = 1
	reset_career_progress
	setglobalflag flag = $career_started
	unsetglobalflag flag = $CAREER_INTRO_MOVIE_WATCHED
	unsetglobalflag flag = $CAREER_TRAINING_DONE
	unsetglobalflag flag = $CAREER_CAREER_TRACK_INITIALIZED
	unsetglobalflag flag = $CAREER_RIGGER_TRACK_INITIALIZED
	unsetglobalflag flag = $CAREER_HARDCORE_TRACK_INITIALIZED
	careerfunc func = AddCash params = {cash = 200}
	if isxenon
		if NOT checkforsignin local
			spawnscriptnow ui_yourlife_goto_new_career_spawned_no_profile
			return
		endif
	endif
	spawnscriptnow ui_yourlife_goto_new_career_do_save params = {force = <force>}
endscript

script ui_yourlife_goto_new_career_do_save 
	change \{DoneScript = ui_yourlife_goto_new_career_spawned_post_save}
	change \{abortscript = ui_yourlife_goto_new_career_spawned_post_save_cancelled}
	launch_autosave_menu_save_game_sequence SetAbortScript = 0 force = <force>
endscript

script ui_yourlife_goto_new_career_spawned_post_save_cancelled 
	create_dialog_box {title = "No save file"
		text = "You chose not to save, some functionality (including the video editor) will be disabled."
		buttons = [{text = "continue without saving" pad_choose_script = ui_yourlife_goto_new_career_spawned_post_save}
			{text = "create new save" pad_choose_script = ui_yourlife_goto_new_career_do_save}
			{text = "cancel" pad_choose_script = ui_yourlife_goto_new_career_cancelled}]
		additional_highlight_scale = (0.75, 0.0)
		text_dims = (700.0, 0.0)
		vmenu_width = 750
		preserve_case
	}
endscript

script ui_yourlife_goto_new_career_cancelled 
	unsetglobalflag \{flag = $career_started}
	ui_create_yourlife
endscript

script ui_yourlife_goto_new_career_spawned_no_profile 
	create_dialog_box {title = "No profile"
		text = "You chose not to sign into a gamer profile, so you will be unable to save your progress. Some functionality will be disabled."
		buttons = [{text = "ok" pad_choose_script = ui_yourlife_goto_new_career_spawned_post_save}]
	}
endscript

script ui_yourlife_goto_new_career_spawned_post_save 
	printf \{'ui_yourlife_goto_new_career_spawned_post_save'}
	mainmenu_display_loading_screen
	generic_ui_destroy
	pause_menu_fmv_kill
	cas_ensure_skater_loaded \{name = custom_story}
	change \{bedroom_select_skater = came_from_new_life}
	wait \{1
		second}
	change_level \{level = load_z_bedroom}
endscript

script ui_yourlife_goto_your_space 
	spawnscriptnow \{ui_yourlife_goto_your_space_spawned}
endscript

script ui_yourlife_goto_your_space_spawned 
	do_autosave \{immediate
		suspend_ui}
	mainmenu_display_loading_screen
	generic_ui_destroy
	pause_menu_fmv_kill
	cas_ensure_skater_loaded \{name = custom_story}
	change \{bedroom_select_skater = came_from_new_life}
	wait \{1
		second}
	change_level \{level = load_z_crib}
endscript
