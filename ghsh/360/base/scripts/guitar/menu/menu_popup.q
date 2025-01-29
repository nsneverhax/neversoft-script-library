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
	SetButtonEventMappings \{block_menu_input}
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
	Change \{g_cpw_have_helper_pills = 0}
	if GotParam \{fail_song_props}
		Change \{g_using_alt_popup_bg = 1}
	elseif GotParam \{fail_song_props_prac}
		Change \{g_using_alt_popup_bg = 1}
	else
		Change \{g_using_alt_popup_bg = 0}
	endif
	<event_handlers> = []
	if GotParam \{options}
		GetArraySize <options>
		if (<array_Size> > 1)
			<event_handlers> = <popup_event_handlers>
		endif
		if (<array_Size> > 3)
			Change \{g_using_alt_popup_bg = 1}
		endif
	endif
	if GotParam \{back_button_script}
		<event> = {pad_back generic_menu_pad_choose_sound}
		AddArrayElement array = <event_handlers> element = <event>
		if GotParam \{back_button_params}
			<event> = {pad_back <back_button_script> params = {<back_button_params>}}
		else
			<event> = {pad_back <back_button_script>}
		endif
		AddArrayElement array = <event_handlers> element = <event>
		<event_handlers> = <array>
	endif
	if NOT (($menu_over_ride_exclusive_device) = -1)
		player_device = ($menu_over_ride_exclusive_device)
	endif
	if GotParam \{use_all_controllers}
		player_device = [0 , 1 , 2 , 3]
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = popup_warning_container
		Pos = (0.0, 0.0)
		just = [left top]
	}
	if NOT GotParam \{no_helpers}
		clean_up_user_control_helpers
		if GotParam \{player_device}
			add_gamertag_helper exclusive_device = <player_device>
		endif
	endif
	if GotParam \{options}
		GetArraySize \{options
			param = num_options}
		if GotParam \{long}
			CreateScreenElement {
				parent = root_window
				id = popupelement
				Type = descinterface
				desc = 'dialog_box_long_alert'
				z_priority = <dlg_z_priority>
				exclusive_device = <player_device>
				dlog_message_dims = ((630.0, 380.0) - ((0.0, 50.0) * <num_options>))
			}
		else
			if ($g_using_alt_popup_bg = 0)
				CreateScreenElement {
					parent = root_window
					id = popupelement
					Type = descinterface
					desc = 'dialog_box'
					z_priority = <dlg_z_priority>
					exclusive_device = <player_device>
				}
			else
				CreateScreenElement {
					parent = root_window
					id = popupelement
					Type = descinterface
					desc = 'dialog_box_fail'
					z_priority = <dlg_z_priority>
					exclusive_device = <player_device>
				}
			endif
		endif
		Change \{g_cpw_have_helper_pills = 1}
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		if GotParam \{back_button_script}
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
		endif
	elseif GotParam \{music_store_dialog_hack}
		if ($g_using_alt_popup_bg = 0)
			CreateScreenElement {
				parent = root_window
				id = popupelement
				Type = descinterface
				desc = 'dialog_box'
				z_priority = <dlg_z_priority>
				exclusive_device = <player_device>
			}
		else
			CreateScreenElement {
				parent = root_window
				id = popupelement
				Type = descinterface
				desc = 'dialog_box_fail'
				z_priority = <dlg_z_priority>
				exclusive_device = <player_device>
			}
		endif
	else
		CreateScreenElement {
			parent = root_window
			id = popupelement
			Type = descinterface
			desc = 'dialog_box_no_options'
			z_priority = <dlg_z_priority>
		}
		<id> :obj_spawnscript popup_warning_menu_title_fade
	endif
	<id> :Obj_SpawnScriptNow bg_swap
	if popupelement :desc_resolvealias \{Name = alias_dlog_vmenu}
		AssignAlias id = <resolved_id> alias = pu_warning_vmenu
		bx_createhighlightstars \{parent = popupelement
			focuswaittime = 2
			stars_id = popup_stars}
		<resolved_id> :se_setprops event_handlers = <event_handlers>
		<resolved_id> :se_getprops
		<z> = <z_priority>
		if NOT GotParam \{focus_index}
			if NOT GotParam \{no_focus}
				LaunchEvent Type = focus target = <resolved_id>
			endif
		endif
	endif
	broadcastevent \{Type = popup_created}
	create_popup_warning_text <...>
	if GotParam \{options}
		create_popup_warning_menu_options <...>
	endif
	if GotParam \{resolved_id}
		if NOT GotParam \{no_focus}
			popupelement :SetTags \{unblock_menu_input = 1}
			LaunchEvent Type = focus target = <resolved_id> data = {child_index = <focus_index>}
		else
			SetButtonEventMappings \{unblock_menu_input}
		endif
		return {menu_id = <resolved_id>}
	endif
	SetButtonEventMappings \{unblock_menu_input}
endscript

script popup_warning_menu_title_fade 
	if desc_resolvealias \{Name = alias_dialog_text
			param = cont}
		Wait \{2
			Seconds}
		begin
		if NOT ScreenElementExists id = <cont>
			return
		endif
		<cont> :se_setprops alpha = 0.5 time = 1.0 motion = ease_in
		<cont> :se_waitprops
		if NOT ScreenElementExists id = <cont>
			return
		endif
		<cont> :se_setprops alpha = 1.0 time = 1.0 motion = ease_out
		<cont> :se_waitprops
		repeat
	endif
endscript

script destroy_popup_warning_menu 
	DestroyScreenElement \{id = popupelement}
	destroy_menu_backdrop
	destroy_menu \{menu_id = popup_warning_container}
	if ($g_cpw_have_helper_pills = 1)
		clean_up_user_control_helpers
	endif
	set_focus_color
	set_unfocus_color
endscript

script create_popup_warning_text \{title = qs(0xaa163738)}
	popupelement :SetProps {
		popuptitle_text = <title>
		popuptitle_rgba = (($g_menu_colors).menu_title)
	}
	popupelement :desc_resolvealias \{Name = alias_dialog_text}
	if GotParam \{textblock}
		popupelement :SetProps {
			popupbody_text = (<textblock>.text)
		}
	endif
	if GotParam \{fail_song_props}
		popupelement :SetProps {
			dlog_fail_song_title_text = (<fail_song_props>.song_title)
		}
		popupelement :SetProps {
			dlog_fail_song_percent_text = (<fail_song_props>.percent_text + qs(0x56d53de7))
		}
		if ($current_num_players = 1)
			popupelement :SetProps {
				dlog_fail_song_difficulty_text = (qs(0x5e7ced49) + <fail_song_props>.difficulty_text)
			}
		endif
	endif
	if GotParam \{fail_song_props_prac}
		popupelement :SetProps \{dlog_fail_song_info_prac_alpha = 1
			dlog_fail_song_info_alpha = 0}
		popupelement :SetProps {
			dlog_fail_song_title_text = (<fail_song_props_prac>.song_title)
		}
		popupelement :SetProps {
			dlog_fail_song_percent_prac_text = (<fail_song_props_prac>.percent_text)
		}
		popupelement :SetProps {
			dlog_fail_song_difficulty_prac_text = (<fail_song_props_prac>.difficulty_text)
		}
	endif
endscript

script create_popup_warning_menu_option 
	<focus_params> = {use_highlight = 0}
	if StructureContains structure = <option> func_params
		<func_params> = (<option>.func_params)
	endif
	sound_func = generic_menu_pad_choose_sound
	if StructureContains structure = <option> sound_func
		sound_func = (<option>.sound_func)
	endif
	if StructureContains structure = <option> no_sound
		sound_func = nullscript
	endif
	set_focus_color rgba = (($g_menu_colors).menu_title)
	set_unfocus_color rgba = (($g_menu_colors).menu_gold)
	CreateScreenElement {
		Type = TextBlockElement
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
		fit_width = `expand	dims`
		fit_height = `scale	to	fit`
		scale_mode = proportional
		event_handlers = [
			{focus menu_popup_focus params = <focus_params>}
			{unfocus menu_popup_unfocus params = <focus_params>}
			{pad_choose <sound_func>}
			{pad_choose (<option>.func) params = <func_params>}
		]
	}
	GetScreenElementDims id = <id>
	if (<width> > 440)
		if (<width> > 550)
			<id> :se_setprops {
				dims = (((0.0, 1.5) * <height>) + (440.0, 0.0))
				fit_width = wrap
				fit_height = `scale	to	fit`
			}
		else
			<id> :se_setprops {
				dims = (((0.0, 1.0) * <height>) + (440.0, 0.0))
				fit_width = `scale	each	line	if	larger`
				fit_height = `scale	to	fit`
			}
		endif
	endif
	if StructureContains structure = <option> not_focusable
		<id> :se_setprops non_focusable rgba = (($g_menu_colors).alert_red)
	endif
endscript

script create_popup_warning_menu_options 
	<parent> = pu_warning_vmenu
	GetArraySize <options>
	GetScreenElementDims id = <parent>
	<menu_element_dims> = ((<width> * (1.0, 0.0)) + (0.0, 50.0))
	if GotParam \{force_menu_pos_off}
		<parent> :se_setprops Pos = <force_menu_pos_off>
	endif
	<i> = 0
	begin
	create_popup_warning_menu_option {
		option = (<options> [<i>])
		z = <z>
		num_options = <array_Size>
		parent = <parent>
		dims = <menu_element_dims>
	}
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script menu_popup_focus 
	Obj_GetID
	<id> = <objID>
	ResolveScreenElementID id = {<id> child = {0 child = text}}
	retail_menu_focus id = <resolved_id>
	bx_popup_focus
	if popupelement :GetSingleTag \{unblock_menu_input}
		if (<unblock_menu_input> = 1)
			SetButtonEventMappings \{unblock_menu_input}
			popupelement :RemoveTags \{[
					unblock_menu_input
				]}
		endif
	endif
	if (<use_highlight> = 1)
		SetScreenElementProps id = {<id> child = {0 child = {hi_right_spacer child = 0}}} alpha = 1
		SetScreenElementProps id = {<id> child = {0 child = {hi_left_spacer child = 0}}} alpha = 1
	endif
endscript

script menu_popup_unfocus 
	Obj_GetID
	<id> = <objID>
	ResolveScreenElementID id = {<id> child = {0 child = text}}
	retail_menu_unfocus id = <resolved_id>
	if (<use_highlight> = 1)
		SetScreenElementProps id = {<id> child = {0 child = {hi_right_spacer child = 0}}} alpha = 0
		SetScreenElementProps id = {<id> child = {0 child = {hi_left_spacer child = 0}}} alpha = 0
	endif
	if ScreenElementExists \{id = highlightstars}
		highlightstars :se_setprops \{alpha = 0}
	endif
endscript

script bx_popup_focus 
	Obj_GetID
	bx_focushighlightstarson objID = <objID> stars_id = popup_stars
endscript
