
script ui_create_options_settings 
	Change \{ui_options_from_submenu = 1}
	GetGlobalTags \{user_options}
	0x2ea532a9 \{pad_back_script = ui_options_check_settings
		pad_back_params = {
			no_loading_screen
		}}
	0x9d0992fe {
		parent = current_submenu
		0x6d96b274
		text = qs(0x2e9b1b43)
		0xc1f386b6
		pad_choose_script = ui_options_controller_choose_lefty_flip
		pad_choose_params = {popup = <popup> player_device = $primary_controller}
	}
	get_player_num_from_controller \{controller_index = $primary_controller}
	getplayerinfo <player_num> lefty_flip
	if (<lefty_flip> = 1)
		<check_alpha> = 1
		<cross_alpha> = 0
	else
		<check_alpha> = 0
		<cross_alpha> = 1
	endif
	<item_id> :se_setprops {
		check_alpha = <check_alpha>
		cross_alpha = <cross_alpha>
	}
	current_menu :SetTags lefty_id = <item_id>
	if ($vocal_enable_static_view = 1)
		0x9d0992fe \{parent = current_submenu
			0x6d96b274
			text = qs(0x7a043839)
			0xc1f386b6
			pad_choose_script = options_change_vocals_highway_view
			pad_choose_params = {
				no_restart
				Player = 1
			}}
	else
		0x9d0992fe \{parent = current_submenu
			0x6d96b274
			text = qs(0x7a043839)
			0xc1f386b6
			pad_choose_script = nullscript
			pad_choose_sound = ui_bonus_videos_negative_sfx
			focus_rgba = [
				160
				150
				140
				175
			]
			unfocus_rgba = [
				160
				150
				140
				175
			]}
	endif
	vocals_get_highway_view \{Player = 1}
	if (<highway_view> != static)
		<check_alpha> = 1
		<cross_alpha> = 0
	else
		<check_alpha> = 0
		<cross_alpha> = 1
	endif
	<item_id> :se_setprops {
		check_alpha = <check_alpha>
		cross_alpha = <cross_alpha>
	}
	0x9d0992fe \{parent = current_submenu
		0x6d96b274
		text = qs(0x38a48aed)
		0xc1f386b6
		pad_choose_script = options_change_vocals_sp_clap
		pad_choose_params = {
			Player = 1
		}}
	getplayerinfo <player_num> vocals_sp_clap
	if (<vocals_sp_clap> = 1)
		<check_alpha> = 1
		<cross_alpha> = 0
	else
		<check_alpha> = 0
		<cross_alpha> = 1
	endif
	<item_id> :se_setprops {
		check_alpha = <check_alpha>
		cross_alpha = <cross_alpha>
	}
	0x9d0992fe \{parent = current_submenu
		0x6d96b274
		text = qs(0xc987ca62)
		0xc1f386b6
		pad_choose_script = ui_options_settings_choose_count
		pad_choose_params = {
			Player = 1
		}}
	if (<unpause_count> = 1)
		<check_alpha> = 1
		<cross_alpha> = 0
	else
		<check_alpha> = 0
		<cross_alpha> = 1
	endif
	<item_id> :se_setprops {
		check_alpha = <check_alpha>
		cross_alpha = <cross_alpha>
	}
	0x9d0992fe \{parent = current_submenu
		0x6d96b274
		text = qs(0x88113eb5)
		0xc1f386b6
		pad_choose_script = options_change_tilt_star_power
		pad_choose_params = {
			Player = 1
		}}
	getplayerinfo <player_num> use_tilt_for_starpower
	if (<use_tilt_for_starpower> = 1)
		<check_alpha> = 1
		<cross_alpha> = 0
	else
		<check_alpha> = 0
		<cross_alpha> = 1
	endif
	<item_id> :se_setprops {
		check_alpha = <check_alpha>
		cross_alpha = <cross_alpha>
	}
	0x9d0992fe \{parent = current_submenu
		0x6d96b274
		text = qs(0xa2b47a6e)
		0xc1f386b6
		pad_choose_script = options_change_touch_strip_option
		pad_choose_params = {
			Player = 1
		}}
	getplayerinfo <player_num> enable_touch_strip
	if (<enable_touch_strip> = 1)
		<check_alpha> = 1
		<cross_alpha> = 0
	else
		<check_alpha> = 0
		<cross_alpha> = 1
	endif
	<item_id> :se_setprops {
		check_alpha = <check_alpha>
		cross_alpha = <cross_alpha>
	}
	if NOT IsPAL
		0x9d0992fe \{parent = current_submenu
			0x6d96b274
			text = qs(0x37f773d2)
			0xc1f386b6
			pad_choose_script = 0x2cb6987e}
		if ($ps2_progressivescan = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 1
		endif
		<item_id> :se_setprops {
			check_alpha = <check_alpha>
			cross_alpha = <cross_alpha>
		}
	endif
	ui_options_set_settings
endscript

script ui_destroy_options_settings 
	0x7f9ab085
endscript

script ui_return_options_settings 
	clean_up_user_control_helpers
	add_gamertag_helper \{exclusive_device = $primary_controller}
endscript

script ui_options_settings_choose_count 
	Obj_GetID
	GetGlobalTags \{user_options
		param = unpause_count}
	if (<unpause_count> = 1)
		<unpause_count> = 0
		SoundEvent \{event = box_uncheck_sfx}
		check_alpha = 0
		cross_alpha = 1
	else
		<unpause_count> = 1
		SoundEvent \{event = Box_Check_SFX}
		check_alpha = 1
		cross_alpha = 0
	endif
	<objID> :se_setprops check_alpha = <check_alpha>
	<objID> :se_setprops cross_alpha = <cross_alpha>
	SetGlobalTags user_options params = {unpause_count = <unpause_count>}
endscript

script ui_create_options_settings_lefty_warning 
	LaunchEvent \{Type = unfocus
		target = current_submenu}
	create_dialog_box \{heading_text = qs(0xaa163738)
		body_text = qs(0x844b0500)
		options = [
			{
				func = ui_destroy_options_settings_lefty_warning
				text = qs(0x182f0173)
			}
		]}
endscript

script ui_destroy_options_settings_lefty_warning 
	Wait \{1
		Seconds}
	destroy_dialog_box
	LaunchEvent \{Type = focus
		target = current_submenu}
	menu_finish
endscript

script ui_options_settings_lefty_warning 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	current_menu :GetSingleTag \{lefty_id}
	obj_spawnscript \{ui_options_controller_choose_lefty_flip
		params = {
			player_device = $primary_controller
		}}
	generic_event_back
endscript

script ui_options_settings_animate_in 
	if ScreenElementExists \{id = current_menu_anchor}
		current_menu_anchor :se_setprops \{0x09197a7d = {
				relative
				(-500.0, 0.0)
			}
			time = 0.15
			motion = linear}
	endif
	se_setprops \{Pos = (-1200.0, -25.0)
		time = 0.15
		motion = linear}
	se_setprops \{darker_alpha = 0.4
		time = 0.15}
endscript

script ui_options_settings_animate_out 
	if ScreenElementExists \{id = current_menu_anchor}
		current_menu_anchor :se_setprops \{0x09197a7d = {
				relative
				(500.0, 0.0)
			}
			time = 0.15
			motion = linear}
	endif
	se_setprops \{Pos = (-1600.0, 300.0)
		time = 0.15
		motion = linear}
	se_setprops \{darker_alpha = 0.0
		time = 0.15}
	se_waitprops
	if ScreenElementExists \{id = settings_submenu}
		DestroyScreenElement \{id = settings_submenu}
	endif
endscript

script ui_options_settings_focus 
	Obj_GetID
	if GotParam \{objID}
		if <objID> :desc_resolvealias Name = alias_text
			<resolved_id> :se_setprops rgba = (($default_color_scheme).text_focus_color)
		endif
	endif
	GetTags
	if settings_submenu :desc_resolvealias \{Name = alias_highlight}
		AssignAlias id = <resolved_id> alias = highlight
		Wait \{2
			gameframe}
		if <objID> :desc_resolvealias Name = alias_text
			GetScreenElementChildren id = <resolved_id>
			GetScreenElementDims id = (<children> [0])
			Scale = (((1.0, 0.0) * (((<width> + 25.0) / 256.0))) + (0.0, 1.5))
			GetScreenElementPosition id = (<children> [0]) summed
			highlight :se_setprops Pos = {absolute (<screenelementpos>)} Scale = <Scale>
			highlight :se_waitprops
			GetScreenElementPosition id = (<children> [0]) summed
			highlight :se_setprops Pos = {absolute (<screenelementpos> + (0.0, -10.0))} time = 0.05
			highlight :se_waitprops
			GetScreenElementPosition id = (<children> [0]) summed
			highlight :se_setprops Pos = {absolute (<screenelementpos>)} Scale = <Scale> time = 0.05
			highlight :se_waitprops
		endif
	endif
endscript

script ui_options_settings_unfocus 
	Obj_GetID
	if GotParam \{objID}
		if <objID> :desc_resolvealias Name = alias_text
			<resolved_id> :se_setprops rgba = (($default_color_scheme).text_color)
		endif
	endif
endscript

script 0x2cb6987e 
	if ($ps2_progressivescan = 1)
		SoundEvent \{box_uncheck_sfx}
		Change \{ps2_progressivescan = 0}
		setprogressive \{On = 0}
		ui_event \{event = menu_refresh}
	else
		SoundEvent \{Box_Check_SFX}
		0xb966ebc9
	endif
endscript

script 0xb966ebc9 
	LaunchEvent \{Type = unfocus
		target = current_submenu}
	create_dialog_box \{heading_text = qs(0xaa163738)
		body_text = qs(0xb6ee6e80)
		options = [
			{
				func = 0xc66462bb
				text = qs(0x0e41fe46)
			}
			{
				func = 0xdcb1d1d7
				text = qs(0xf7723015)
			}
		]
		back_button_script = 0xdcb1d1d7
		back_button_params = {
			0x8333d9ba
		}}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red}
endscript

script 0xc66462bb 
	destroy_dialog_box
	Change \{ps2_progressivescan = 1}
	setprogressive \{On = 1}
	create_dialog_box \{heading_text = qs(0x326e2d2f)
		body_text = qs(0xcac12143)
		options = [
			{
				func = 0xa252dfe6
				text = qs(0x0e41fe46)
			}
			{
				func = 0xb3aac927
				text = qs(0xf7723015)
			}
		]
		back_button_script = 0xb3aac927
		back_button_params = {
			0x8333d9ba
		}}
	if dialog_box_desc_id :desc_resolvealias \{Name = alias_dlog_vmenu}
		<resolved_id> :menu_changeselection
	endif
	SpawnScriptNow \{0xc8201a39}
endscript

script 0xc8201a39 
	Wait \{15
		Seconds}
	SpawnScriptNow \{0xb3aac927}
endscript

script 0xa252dfe6 
	KillSpawnedScript \{Name = 0xc8201a39}
	GetScreenElementChildren \{id = current_submenu}
	(<children> [6]) :se_setprops {
		check_alpha = 1
		cross_alpha = 0
	}
	0xdcb1d1d7
endscript

script 0xb3aac927 
	KillSpawnedScript \{Name = 0xc8201a39}
	Change \{ps2_progressivescan = 0}
	setprogressive \{On = 0}
	0xdcb1d1d7 <...>
endscript

script 0xdcb1d1d7 
	if GotParam \{0x8333d9ba}
		generic_menu_pad_back_sound
	endif
	destroy_dialog_box
	LaunchEvent \{Type = focus
		target = current_submenu}
	menu_finish
endscript
