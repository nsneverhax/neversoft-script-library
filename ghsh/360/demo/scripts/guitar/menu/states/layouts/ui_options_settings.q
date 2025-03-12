
script ui_create_options_settings 
	change \{ui_options_from_submenu = 1}
	getglobaltags \{user_options}
	if screenelementexists \{id = settings_submenu}
		destroyscreenelement \{id = settings_submenu}
	endif
	createscreenelement {
		type = descinterface
		desc = 'settings_submenu_big'
		parent = <container_id>
		id = settings_submenu
		pos = (1200.0, -115.0)
		scale = 1.0
		just = [center center]
	}
	change \{bx_highlightstars_focuswaittime = 12}
	if <id> :desc_resolvealias name = alias_menu
		assignalias id = <resolved_id> alias = current_submenu
		current_submenu :se_setprops \{event_handlers = [
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
				{
					pad_back
					ui_options_check_settings
				}
			]}
		getscreenelementchildren \{id = current_submenu}
		getplayerinfo \{1
			lefty_flip}
		if (<lefty_flip> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 0
		endif
		if isxenon
			(<children> [0]) :se_setprops {
				text_text = qs(0x83adf584)
				check_alpha = <check_alpha>
				cross_alpha = <cross_alpha>
				event_handlers = [
					{pad_choose ui_options_controller_choose_lefty_flip params = {popup = <popup> player_device = $primary_controller}}
					{focus ui_options_settings_focus}
					{unfocus ui_options_settings_unfocus}
				]
			}
		else
			(<children> [0]) :se_setprops {
				text_text = qs(0x83adf584)
				check_alpha = <check_alpha>
				cross_alpha = <cross_alpha>
				event_handlers = [
					{pad_choose ui_event_block params = {event = menu_replace data = {state = uistate_options_settings_lefty_warning is_popup container_id = <id>}}}
					{focus ui_options_settings_focus}
					{unfocus ui_options_settings_unfocus}
				]
			}
			current_menu :settags lefty_id = <item_id>
		endif
		vocals_get_highway_view \{player = 1}
		if (<highway_view> != static)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 0
		endif
		if ($vocal_enable_static_view = 1)
			(<children> [1]) :se_setprops {
				text_text = qs(0x804b43ff)
				check_alpha = <check_alpha>
				cross_alpha = <cross_alpha>
				event_handlers = [
					{pad_choose options_change_vocals_highway_view params = {no_restart player = 1}}
					{focus ui_options_settings_focus}
					{unfocus ui_options_settings_unfocus}
				]
			}
		else
			(<children> [1]) :se_setprops {
				text_text = qs(0x804b43ff)
				check_alpha = <check_alpha>
				cross_alpha = <cross_alpha>
				not_focusable
				rgba = [110 100 90 175]
			}
		endif
		getplayerinfo \{1
			vocals_sp_clap}
		if (<vocals_sp_clap> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 0
		endif
		(<children> [2]) :se_setprops {
			text_text = qs(0xd22e8941)
			check_alpha = <check_alpha>
			cross_alpha = <cross_alpha>
			event_handlers = [
				{pad_choose options_change_vocals_sp_clap params = {player = 1}}
				{focus ui_options_settings_focus}
				{unfocus ui_options_settings_unfocus}
			]
		}
		if (<unpause_count> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 0
		endif
		(<children> [3]) :se_setprops {
			text_text = qs(0x8fdcfd13)
			check_alpha = <check_alpha>
			cross_alpha = <cross_alpha>
			event_handlers = [
				{pad_choose ui_options_settings_choose_count params = {player = 1}}
				{focus ui_options_settings_focus}
				{unfocus ui_options_settings_unfocus}
			]
		}
		getplayerinfo \{1
			use_tilt_for_starpower}
		if (<use_tilt_for_starpower> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 0
		endif
		(<children> [4]) :se_setprops {
			text_text = qs(0x629b3d19)
			check_alpha = <check_alpha>
			cross_alpha = <cross_alpha>
			event_handlers = [
				{pad_choose options_change_tilt_star_power params = {player = 1}}
				{focus ui_options_settings_focus}
				{unfocus ui_options_settings_unfocus}
			]
		}
		getplayerinfo \{1
			enable_touch_strip}
		if (<enable_touch_strip> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 0
		endif
		(<children> [5]) :se_setprops {
			text_text = qs(0xf4397d0c)
			check_alpha = <check_alpha>
			cross_alpha = <cross_alpha>
			event_handlers = [
				{pad_choose options_change_touch_strip_option params = {player = 1}}
				{focus ui_options_settings_focus}
				{unfocus ui_options_settings_unfocus}
			]
		}
		getarraysize <children>
		child = 0
		begin
		if (<children> [<child>]) :desc_resolvealias name = alias_text
			bx_resizetextfield {
				id = <resolved_id>
				dims = (415.0, 50.0)
				fit_width = `scale each line if larger`
			}
			(<children> [<child>]) :settags {text_id = <resolved_id>}
			setscreenelementprops id = <resolved_id> rgba = (($g_menu_colors).menu_gold)
		endif
		increment \{child}
		repeat <array_size>
	endif
	settings_submenu :obj_spawnscript \{ui_options_settings_animate_in}
	ui_options_set_settings
endscript

script ui_destroy_options_settings 
	if screenelementexists \{id = settings_submenu}
		settings_submenu :obj_spawnscript \{ui_options_settings_animate_out}
	endif
	clean_up_user_control_helpers
endscript

script ui_return_options_settings 
	clean_up_user_control_helpers
	add_gamertag_helper \{exclusive_device = $primary_controller}
endscript

script ui_options_settings_choose_count 
	obj_getid
	getglobaltags \{user_options
		param = unpause_count}
	if (<unpause_count> = 1)
		<unpause_count> = 0
		soundevent \{event = checkbox_sfx}
		if gotparam \{popup}
			<objid> :se_setprops check_alpha = 0
			<objid> :se_setprops cross_alpha = 0
		else
			<objid> :se_setprops check_alpha = 0
			<objid> :se_setprops cross_alpha = 0
		endif
	else
		<unpause_count> = 1
		soundevent \{event = checkbox_check_sfx}
		if gotparam \{popup}
			<objid> :se_setprops check_alpha = 1
			<objid> :se_setprops cross_alpha = 0
		else
			<objid> :se_setprops check_alpha = 1
			<objid> :se_setprops cross_alpha = 0
		endif
	endif
	setglobaltags user_options params = {unpause_count = <unpause_count>}
endscript

script ui_create_options_settings_lefty_warning 
	create_popup_warning_menu \{title = qs(0xaa163738)
		textblock = {
			text = qs(0x15cdec24)
		}
		options = [
			{
				func = ui_options_settings_lefty_warning
				text = qs(0x182f0173)
			}
		]
		no_background}
endscript

script ui_destroy_options_settings_lefty_warning 
	destroy_popup_warning_menu
endscript

script ui_options_settings_lefty_warning 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	current_menu :getsingletag \{lefty_id}
	obj_spawnscript \{ui_options_controller_choose_lefty_flip
		params = {
			player_device = $primary_controller
		}}
	generic_event_back
endscript

script ui_options_settings_animate_in 
	if screenelementexists \{id = current_menu_anchor}
		current_menu_anchor :se_setprops \{career_menu_skull_pos = {
				relative
				(500.0, 0.0)
			}
			time = 0.15
			motion = linear}
	endif
	if NOT gotparam \{pos}
		pos = (16.0, -115.0)
	endif
	se_setprops pos = <pos> time = 0.15 motion = linear
	se_setprops \{darker_alpha = 0.4
		time = 0.15}
endscript

script ui_options_settings_animate_out 
	if screenelementexists \{id = current_menu_anchor}
		current_menu_anchor :se_setprops \{career_menu_skull_pos = {
				relative
				(-500.0, 0.0)
			}
			time = 0.15
			motion = linear}
	endif
	change \{bx_highlightstars_focuswaittime = 2}
	if NOT gotparam \{pos}
		pos = (1200.0, -115.0)
	endif
	se_setprops pos = <pos> time = 0.15 motion = linear
	se_setprops \{darker_alpha = 0.0
		time = 0.15}
	se_waitprops
	if screenelementexists \{id = settings_submenu}
		destroyscreenelement \{id = settings_submenu}
	endif
endscript

script ui_options_settings_focus 
	obj_getid
	se_setprops text_rgba = (($g_menu_colors).menu_title)
	if <objid> :desc_resolvealias name = alias_text
		bx_focushighlightstarson objid = <resolved_id>
	endif
endscript

script ui_options_settings_unfocus 
	obj_getid
	se_setprops text_rgba = (($g_menu_colors).menu_gold)
endscript
