popup_warning_menu_font = fontgrid_bordello
popup_event_handlers_options = [
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
]
popup_event_handlers_nooptions = [
]
g_cpw_have_helper_pills = 0
g_using_alt_popup_bg = 0

script create_popup_warning_menu player_device = ($primary_controller) popup_event_handlers = ($popup_event_handlers_options) header_offset = (0.0, 0.0) dlg_z_priority = 500 parent = root_window
	setbuttoneventmappings \{block_menu_input}
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
	change \{g_cpw_have_helper_pills = 0}
	if gotparam \{fail_song_props}
		change \{g_using_alt_popup_bg = 1}
	elseif gotparam \{fail_song_props_prac}
		change \{g_using_alt_popup_bg = 1}
	else
		change \{g_using_alt_popup_bg = 0}
	endif
	<event_handlers> = []
	if gotparam \{options}
		getarraysize <options>
		if (<array_size> > 1)
			<event_handlers> = <popup_event_handlers>
		endif
		if (<array_size> > 3)
			change \{g_using_alt_popup_bg = 1}
		endif
	endif
	if gotparam \{back_button_script}
		<event> = {pad_back generic_menu_pad_choose_sound}
		addarrayelement array = <event_handlers> element = <event>
		if gotparam \{back_button_params}
			<event> = {pad_back <back_button_script> params = {<back_button_params>}}
		else
			<event> = {pad_back <back_button_script>}
		endif
		addarrayelement array = <event_handlers> element = <event>
		<event_handlers> = <array>
	endif
	if NOT (($menu_over_ride_exclusive_device) = -1)
		player_device = ($menu_over_ride_exclusive_device)
	endif
	if gotparam \{use_all_controllers}
		player_device = [0 , 1 , 2 , 3]
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = popup_warning_container
		pos = (0.0, 0.0)
		just = [left top]
	}
	if NOT gotparam \{no_helpers}
		clean_up_user_control_helpers
		if gotparam \{player_device}
			add_gamertag_helper exclusive_device = <player_device>
		endif
	endif
	if gotparam \{options}
		getarraysize \{options
			param = num_options}
		if gotparam \{long}
			createscreenelement {
				parent = root_window
				id = popupelement
				type = descinterface
				desc = 'dialog_box_long_alert'
				z_priority = <dlg_z_priority>
				exclusive_device = <player_device>
				dlog_message_dims = ((630.0, 380.0) - ((0.0, 50.0) * <num_options>))
			}
		else
			if ($g_using_alt_popup_bg = 0)
				createscreenelement {
					parent = root_window
					id = popupelement
					type = descinterface
					desc = 'dialog_box'
					z_priority = <dlg_z_priority>
					exclusive_device = <player_device>
				}
			else
				createscreenelement {
					parent = root_window
					id = popupelement
					type = descinterface
					desc = 'dialog_box_fail'
					z_priority = <dlg_z_priority>
					exclusive_device = <player_device>
				}
			endif
		endif
		change \{g_cpw_have_helper_pills = 1}
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		if gotparam \{back_button_script}
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
		endif
	elseif gotparam \{music_store_dialog_hack}
		if ($g_using_alt_popup_bg = 0)
			createscreenelement {
				parent = root_window
				id = popupelement
				type = descinterface
				desc = 'dialog_box'
				z_priority = <dlg_z_priority>
				exclusive_device = <player_device>
			}
		else
			createscreenelement {
				parent = root_window
				id = popupelement
				type = descinterface
				desc = 'dialog_box_fail'
				z_priority = <dlg_z_priority>
				exclusive_device = <player_device>
			}
		endif
	else
		createscreenelement {
			parent = root_window
			id = popupelement
			type = descinterface
			desc = 'dialog_box_no_options'
			z_priority = <dlg_z_priority>
		}
		<id> :obj_spawnscript popup_warning_menu_title_fade
	endif
	<id> :obj_spawnscriptnow bg_swap
	if popupelement :desc_resolvealias \{name = alias_dlog_vmenu}
		assignalias id = <resolved_id> alias = pu_warning_vmenu
		bx_createhighlightstars \{parent = popupelement
			focuswaittime = 2
			stars_id = popup_stars}
		<resolved_id> :se_setprops event_handlers = <event_handlers>
		<resolved_id> :se_getprops
		<z> = <z_priority>
		if NOT gotparam \{focus_index}
			if NOT gotparam \{no_focus}
				launchevent type = focus target = <resolved_id>
			endif
		endif
	endif
	broadcastevent \{type = popup_created}
	create_popup_warning_text <...>
	if gotparam \{options}
		create_popup_warning_menu_options <...>
	endif
	if gotparam \{resolved_id}
		if NOT gotparam \{no_focus}
			popupelement :settags \{unblock_menu_input = 1}
			launchevent type = focus target = <resolved_id> data = {child_index = <focus_index>}
		else
			setbuttoneventmappings \{unblock_menu_input}
		endif
		return {menu_id = <resolved_id>}
	endif
	setbuttoneventmappings \{unblock_menu_input}
endscript

script popup_warning_menu_title_fade 
	if desc_resolvealias \{name = alias_dialog_text
			param = cont}
		wait \{2
			seconds}
		begin
		if NOT screenelementexists id = <cont>
			return
		endif
		<cont> :se_setprops alpha = 0.5 time = 1.0 motion = ease_in
		<cont> :se_waitprops
		if NOT screenelementexists id = <cont>
			return
		endif
		<cont> :se_setprops alpha = 1.0 time = 1.0 motion = ease_out
		<cont> :se_waitprops
		repeat
	endif
endscript

script destroy_popup_warning_menu 
	destroyscreenelement \{id = popupelement}
	destroy_menu_backdrop
	destroy_menu \{menu_id = popup_warning_container}
	if ($g_cpw_have_helper_pills = 1)
		clean_up_user_control_helpers
	endif
	set_focus_color
	set_unfocus_color
endscript

script create_popup_warning_text \{title = qs(0xaa163738)}
	popupelement :setprops {
		popuptitle_text = <title>
		popuptitle_rgba = (($g_menu_colors).menu_title)
	}
	popupelement :desc_resolvealias \{name = alias_dialog_text}
	if gotparam \{textblock}
		popupelement :setprops {
			popupbody_text = (<textblock>.text)
		}
	endif
	if gotparam \{fail_song_props}
		popupelement :setprops {
			dlog_fail_song_title_text = (<fail_song_props>.song_title)
		}
		popupelement :setprops {
			dlog_fail_song_percent_text = (<fail_song_props>.percent_text + qs(0x56d53de7))
		}
		if ($current_num_players = 1)
			popupelement :setprops {
				dlog_fail_song_difficulty_text = (qs(0x5e7ced49) + <fail_song_props>.difficulty_text)
			}
		endif
	endif
	if gotparam \{fail_song_props_prac}
		popupelement :setprops \{dlog_fail_song_info_prac_alpha = 1
			dlog_fail_song_info_alpha = 0}
		popupelement :setprops {
			dlog_fail_song_title_text = (<fail_song_props_prac>.song_title)
		}
		popupelement :setprops {
			dlog_fail_song_percent_prac_text = (<fail_song_props_prac>.percent_text)
		}
		popupelement :setprops {
			dlog_fail_song_difficulty_prac_text = (<fail_song_props_prac>.difficulty_text)
		}
	endif
endscript

script create_popup_warning_menu_option 
	<focus_params> = {use_highlight = 0}
	if structurecontains structure = <option> func_params
		<func_params> = (<option>.func_params)
	endif
	sound_func = generic_menu_pad_choose_sound
	if structurecontains structure = <option> sound_func
		sound_func = (<option>.sound_func)
	endif
	if structurecontains structure = <option> no_sound
		sound_func = nullscript
	endif
	set_focus_color rgba = (($g_menu_colors).menu_title)
	set_unfocus_color rgba = (($g_menu_colors).menu_gold)
	createscreenelement {
		type = textblockelement
		dims = ((0.0, 1.0) * (<dims> [1]))
		font = ($popup_warning_menu_font)
		parent = <parent>
		local_id = text
		rgba = ($menu_unfocus_color)
		font_spacing = 0
		just = [center center]
		internal_just = [center center]
		z_priority = (<z> + 1)
		(<option>)
		use_shadow = true
		shadow_offs = (3.0, 3.0)
		shadow_rgba = (($g_menu_colors).menu_shadow)
		text = (<option>.text)
		fit_width = `expand dims`
		fit_height = `scale to fit`
		scale_mode = proportional
		event_handlers = [
			{focus menu_popup_focus params = <focus_params>}
			{unfocus menu_popup_unfocus params = <focus_params>}
			{pad_choose <sound_func>}
			{pad_choose (<option>.func) params = <func_params>}
		]
	}
	getscreenelementdims id = <id>
	if (<width> > 440)
		if (<width> > 550)
			<id> :se_setprops {
				dims = (((0.0, 1.5) * <height>) + (440.0, 0.0))
				fit_width = wrap
				fit_height = `scale to fit`
			}
		else
			<id> :se_setprops {
				dims = (((0.0, 1.0) * <height>) + (440.0, 0.0))
				fit_width = `scale each line if larger`
				fit_height = `scale to fit`
			}
		endif
	endif
	if structurecontains structure = <option> not_focusable
		<id> :se_setprops non_focusable rgba = (($g_menu_colors).alert_red)
	endif
endscript

script create_popup_warning_menu_options 
	<parent> = pu_warning_vmenu
	getarraysize <options>
	getscreenelementdims id = <parent>
	<menu_element_dims> = ((<width> * (1.0, 0.0)) + (0.0, 50.0))
	if gotparam \{force_menu_pos_off}
		<parent> :se_setprops pos = <force_menu_pos_off>
	endif
	<i> = 0
	begin
	create_popup_warning_menu_option {
		option = (<options> [<i>])
		z = <z>
		num_options = <array_size>
		parent = <parent>
		dims = <menu_element_dims>
	}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script menu_popup_focus 
	obj_getid
	<id> = <objid>
	resolvescreenelementid id = {<id> child = {0 child = text}}
	retail_menu_focus id = <resolved_id>
	bx_popup_focus
	if popupelement :getsingletag \{unblock_menu_input}
		if (<unblock_menu_input> = 1)
			setbuttoneventmappings \{unblock_menu_input}
			popupelement :removetags \{[
					unblock_menu_input
				]}
		endif
	endif
	if (<use_highlight> = 1)
		setscreenelementprops id = {<id> child = {0 child = {hi_right_spacer child = 0}}} alpha = 1
		setscreenelementprops id = {<id> child = {0 child = {hi_left_spacer child = 0}}} alpha = 1
	endif
endscript

script menu_popup_unfocus 
	obj_getid
	<id> = <objid>
	resolvescreenelementid id = {<id> child = {0 child = text}}
	retail_menu_unfocus id = <resolved_id>
	if (<use_highlight> = 1)
		setscreenelementprops id = {<id> child = {0 child = {hi_right_spacer child = 0}}} alpha = 0
		setscreenelementprops id = {<id> child = {0 child = {hi_left_spacer child = 0}}} alpha = 0
	endif
	if screenelementexists \{id = highlightstars}
		highlightstars :se_setprops \{alpha = 0}
	endif
endscript

script bx_popup_focus 
	obj_getid
	bx_focushighlightstarson objid = <objid> stars_id = popup_stars
endscript
