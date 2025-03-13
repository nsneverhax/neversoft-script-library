ui_options_from_submenu = 0

script ui_create_options 
	startrendering
	change \{rich_presence_context = presence_menus}
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_func = none}
	update_ingame_controllers controller = ($primary_controller)
	createscreenelement {
		type = descinterface
		desc = 'settings_menu'
		id = current_menu_anchor
		parent = root_window
		just = [center center]
		exclusive_device = ($primary_controller)
	}
	current_menu_anchor :obj_spawnscriptnow \{frontend_bg_swap}
	bx_createhighlightstars \{parent = current_menu_anchor}
	if <id> :desc_resolvealias name = alias_menu_items_text
		assignalias id = <resolved_id> alias = current_menu
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
				{
					pad_back
					generic_event_back
				}
			]}
		add_menu_frontend_item {
			text = qs(0x3e3a98e6)
			choose_state = uistate_options_cheats
			focus_script = mainmenu_focus
			unfocus_script = mainmenu_unfocus
			item_height = 50
			not_focusable
			rgba = (($g_menu_colors).0xd003083d)
		}
		add_menu_frontend_item {
			text = qs(0x9baf87e5)
			pad_choose_script = menu_choose_band_make_selection
			pad_choose_params = {from_options = 1 device_num = ($primary_controller) event_params = {event = menu_back}}
			focus_script = mainmenu_focus
			unfocus_script = mainmenu_unfocus
			item_height = 50
		}
		if NOT current_band_has_band_name
			<item_id> :se_setprops not_focusable rgba = (($g_menu_colors).0xd003083d)
		endif
		add_menu_frontend_item {
			text = qs(0x98846417)
			pad_choose_script = ui_options_continue_to_data_submenu
			pad_choose_params = {is_popup}
			focus_script = mainmenu_focus
			unfocus_script = mainmenu_unfocus
			item_height = 50
			not_focusable
			rgba = (($g_menu_colors).0xd003083d)
		}
		if isxenon
			if NOT checkforsignin local controller_index = ($primary_controller)
				<item_id> :se_setprops not_focusable rgba = [110 100 90 175]
			elseif netsessionfunc func = xenonisguest params = {controller_index = ($primary_controller)}
				<item_id> :se_setprops not_focusable rgba = [110 100 90 175]
			endif
		endif
		add_menu_frontend_item \{text = qs(0x550b8c8e)
			choose_state = uistate_options_calibrate_lag
			focus_script = mainmenu_focus
			unfocus_script = mainmenu_unfocus
			item_height = 50}
		add_menu_frontend_item {
			text = qs(0xb0462d31)
			choose_state = uistate_options_audio
			focus_script = mainmenu_focus
			unfocus_script = mainmenu_unfocus
			item_height = 50
			not_focusable
			rgba = (($g_menu_colors).0xd003083d)
		}
		add_menu_frontend_item \{text = qs(0x7305a834)
			pad_choose_script = ui_options_continue_to_settings_submenu
			pad_choose_params = {
				is_popup
			}
			focus_script = mainmenu_focus
			unfocus_script = mainmenu_unfocus
			item_height = 50}
		if getscreenelementchildren \{id = current_menu}
			getarraysize <children>
			i = 0
			begin
			curr_id = (<children> [<i>])
			<curr_id> :se_setprops {
				tags = {index = <i>}
			}
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	menu_finish
endscript

script ui_return_options 
	clean_up_user_control_helpers
	menu_finish
endscript

script ui_options_anim_in 
	if NOT ($ui_options_from_submenu)
		menu_transition_in \{menu = current_menu_anchor}
	else
		change \{ui_options_from_submenu = 0}
	endif
endscript

script ui_options_anim_out 
	menu_transition_out \{menu = current_menu_anchor}
endscript

script ui_destroy_options 
	killspawnedscript \{name = setting_skull_anim}
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
endscript

script ui_options_get_controller_type controller = ($primary_controller)
	type = guitar
	text = qs(0x9504b94a)
	if NOT isguitarcontroller controller = <controller>
		type = drums
		text = qs(0xcf488ba5)
		if NOT isdrumcontroller controller = <controller>
			type = vocals
			text = qs(0xae6af654)
		endif
	endif
	return {type = <type> text = <text>}
endscript

script setting_skull_anim 
	se_getprops \{setting_skull_menu}
	<org_pos> = <setting_skull_anim_pos>
	wait \{2
		seconds}
	se_setprops \{setting_jaw_pos = (162.93959, -30.8933)
		time = 0.02
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (170.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (162.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (170.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (162.93959, -30.8933)
		time = 0.02
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (170.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (162.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (170.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_skull_menu_pos = (75.0, 110.0)
		time = 0.01
		motion = ease_in}
	se_waitprops
	se_setprops \{setting_skull_menu_pos = (110.0, 80.0)
		time = 0.01
		motion = ease_in}
	se_waitprops
	ui_fx_set_blur \{amount = 5.0
		time = 0.03}
	se_waitprops
	se_setprops \{setting_skull_menu_pos = (100.0, 100.0)
		time = 0.01
		motion = linear}
	se_waitprops
	wait \{0.03
		seconds}
	se_setprops \{setting_skull_menu_scale = 1.2
		time = 0.02}
	wait \{0.05
		seconds}
	se_waitprops
	ui_fx_set_blur \{amount = 0.0
		time = 0.02}
	se_setprops \{setting_skull_menu_pos = (125.0, 125.0)
		time = 0.01
		motion = linear}
	se_waitprops
	se_setprops \{setting_skull_tooth_m_rot_angle = 0}
	se_setprops \{setting_skull_menu_pos = (100.0, 100.0)
		time = 0.01
		motion = linear}
	se_setprops \{setting_skull_menu_scale = 1.0
		time = 0.02}
	se_waitprops
	se_setprops \{setting_skull_tooth_m_rot_angle = -30}
	se_waitprops
	se_setprops \{setting_skull_tooth_m_rot_angle = -30}
	se_waitprops
	se_setprops \{setting_skull_tooth_m_pos = (-21.71576, 400.34048)
		time = 0.03
		motion = ease_in}
	se_waitprops
	wait \{0.05
		seconds}
	se_setprops \{setting_jaw_pos = (170.93959, -30.8933)
		time = 0.1
		motion = ease_out}
	se_waitprops
	wait \{2
		seconds}
	se_setprops \{setting_skull_menu_pos = (110.0, 75.0)
		time = 0.01
		motion = ease_in}
	se_waitprops
	se_setprops \{setting_skull_menu_pos = (72.0, 125.0)
		time = 0.01
		motion = ease_in}
	se_waitprops
	ui_fx_set_blur \{amount = 5.0
		time = 0.05}
	se_waitprops
	se_setprops \{setting_skull_menu_pos = (100.0, 100.0)
		time = 0.02
		motion = linear}
	se_waitprops
	wait \{0.03
		seconds}
	se_setprops \{setting_skull_menu_scale = 1.3
		time = 0.02}
	wait \{0.05
		seconds}
	se_waitprops
	ui_fx_set_blur \{amount = 0.0
		time = 0.02}
	se_setprops \{setting_skull_menu_pos = (125.0, 125.0)
		time = 0.01
		motion = linear}
	se_waitprops
	se_setprops \{setting_skull_tooth_l_rot_angle = 0}
	se_setprops \{setting_skull_tooth_l_pos = (-376.11633, -93.88914)}
	se_waitprops
	se_setprops \{setting_skull_menu_pos = (100.0, 100.0)
		time = 0.01
		motion = linear}
	se_setprops \{setting_skull_menu_scale = 1.0
		time = 0.02}
	se_waitprops
	se_setprops \{setting_skull_tooth_l_rot_angle = -30}
	se_waitprops
	se_setprops \{setting_skull_tooth_l_rot_angle = -30}
	se_waitprops
	wait \{0.02
		seconds}
	se_setprops \{setting_skull_tooth_l_pos = (-200.71576, 400.34048)
		time = 0.03
		motion = ease_in}
	se_waitprops
	wait \{1
		seconds}
	se_setprops \{setting_jaw_pos = (162.93959, -30.8933)
		time = 0.02
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (170.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (162.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (170.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	wait \{1
		seconds}
	se_setprops \{setting_jaw_pos = (162.93959, -30.8933)
		time = 0.02
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (170.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (162.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (170.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	wait \{0.9
		seconds}
	se_setprops \{setting_skull_menu_pos = (110.0, 75.0)
		time = 0.01
		motion = ease_in}
	se_waitprops
	se_setprops \{setting_skull_menu_pos = (72.0, 125.0)
		time = 0.01
		motion = ease_in}
	se_waitprops
	ui_fx_set_blur \{amount = 5.0
		time = 0.1}
	se_waitprops
	se_setprops \{setting_skull_menu_pos = (100.0, 100.0)
		time = 0.02
		motion = linear}
	se_waitprops
	wait \{0.03
		seconds}
	se_setprops \{setting_skull_menu_scale = 1.3
		time = 0.02}
	wait \{0.05
		seconds}
	se_waitprops
	ui_fx_set_blur \{amount = 0.0
		time = 0.02}
	se_setprops \{setting_skull_menu_pos = (150.0, 100.0)
		time = 0.01
		motion = linear}
	se_waitprops
	se_setprops \{setting_skull_tooth_r_rot_angle = 0}
	se_setprops \{setting_skull_tooth_r_pos = (76.989494, -365.53122)}
	se_waitprops
	se_setprops \{setting_skull_menu_pos = (75.0, 110.0)
		time = 0.01
		motion = linear}
	se_waitprops
	se_setprops \{setting_skull_menu_pos = (100.0, 100.0)
		time = 0.01
		motion = linear}
	se_setprops \{setting_skull_menu_scale = 1.0
		time = 0.02}
	se_waitprops
	se_setprops \{setting_skull_tooth_r_rot_angle = -30}
	se_waitprops
	se_setprops \{setting_skull_tooth_r_rot_angle = -30}
	se_waitprops
	wait \{0.02
		seconds}
	se_setprops \{setting_skull_tooth_r_pos = (76.989494, 400.34048)
		time = 0.03
		motion = ease_in}
	se_waitprops
	begin
	r = Random (@ 1.1 @ -2 @ 2 @ -0.2 @ -3 )
	<time> = Random (@ 0.5 @ 1 @ 2 )
	se_setprops \{setting_jaw_pos = (162.93959, -30.8933)
		time = 0.02
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (170.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	wait <time> seconds
	se_setprops \{setting_jaw_pos = (162.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (170.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (162.93959, -30.8933)
		time = 0.02
		motion = ease_out}
	se_waitprops
	se_setprops \{setting_jaw_pos = (170.93959, -30.8933)
		time = 0.01
		motion = ease_out}
	se_waitprops
	wait <time> seconds
	repeat
endscript

script ui_options_set_settings 
	if screenelementexists \{id = current_menu}
		getglobaltags \{user_options}
		current_menu :settags {user_options = <...>}
	endif
endscript

script ui_options_check_settings 
	removeparameter \{event}
	removeparameter \{controller}
	if NOT ($playing_song)
		if checkforsignin local controller_index = <device_num>
			removeparameter \{device_num}
			if screenelementexists \{id = current_menu}
				getglobaltags \{user_options}
				new_user_options = <...>
				current_menu :getsingletag \{user_options}
				if gotparam \{user_options}
					if NOT comparestructs struct1 = <new_user_options> struct2 = <user_options>
						generic_menu_pad_back_sound
						spawnscriptnow \{ui_memcard_autosave_replace}
						return
					endif
				endif
			endif
		endif
	endif
	generic_event_back
endscript

script ui_options_focus 
	obj_getid
	gettags
	if current_menu_anchor :desc_resolvealias \{name = alias_highlight}
		wait \{2
			gameframe}
		<objid> :se_getparentid
		<parent_id> :se_getparentid
		<parent_id> :se_getprops
		<resolved_id> :se_setprops rot_angle = <rot_angle>
		getscreenelementdims id = <objid>
		scale = (((1.0, 0.0) * ((<width> / 256.0))) + (0.0, 1.5))
		getscreenelementposition id = <objid> summed
		<resolved_id> :se_setprops pos = {absolute <screenelementpos>} scale = <scale>
		<resolved_id> :se_waitprops
		getscreenelementposition id = <objid> summed
		<resolved_id> :se_setprops pos = {absolute (<screenelementpos> + (0.0, -10.0))} time = 0.05
		<resolved_id> :se_waitprops
		getscreenelementposition id = <objid> summed
		<resolved_id> :se_setprops pos = {absolute <screenelementpos>} scale = <scale> time = 0.05
		<resolved_id> :se_waitprops
	endif
endscript

script ui_options_unfocus 
endscript

script ui_options_continue_to_settings_submenu 
	if is_ui_event_running
		return \{false}
	endif
	current_menu :obj_killspawnedscript \{name = highlight_motion}
	current_menu_anchor :se_setprops \{highlight_alpha = 0}
	ui_event_block event = menu_change data = {state = uistate_options_settings <...>}
endscript

script ui_options_continue_to_data_submenu 
	if is_ui_event_running
		return \{false}
	endif
	current_menu :obj_killspawnedscript \{name = highlight_motion}
	current_menu_anchor :se_setprops \{highlight_alpha = 0}
	ui_event_block event = menu_change data = {state = uistate_options_data <...>}
endscript
