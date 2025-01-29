exclusive_mp_controllers = [
	-1
	-1
	-1
	-1
]
num_exclusive_mp_controllers = 0
0xea5b2a48 = 0

script make_menu_frontend {
		screen = drummer
		pad_back_script = generic_event_back
		item_scale = 2.0
		exclusive_device = ($primary_controller)
		Pos = (0.0, 0.0)
	}
	set_focus_color
	set_unfocus_color
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
		get_all_exclusive_devices
	else
	endif
	update_ingame_controllers controller = <exclusive_device>
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		id = current_menu_anchor
		desc = 'menu_frontend'
		just = [center center]
		exclusive_device = <exclusive_device>
	}
	if ((<title> = qs(0x8694014b)) || ((<title> = qs(0x9f281c76)) && ($practice_enabled)))
		focuswaittime = 2
		if (<title> = qs(0x8694014b))
			if ($0xea5b2a48 = 0)
				<focuswaittime> = 1
			else
				Change \{0xea5b2a48 = 0}
			endif
		endif
		bx_createhighlightstars parent = current_menu_anchor focuswaittime = <focuswaittime>
	else
		bx_createhighlightstars \{parent = current_menu_anchor}
	endif
	if <id> :desc_resolvealias Name = alias_menu
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops {
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
				{pad_back <pad_back_script> params = <pad_back_params>}
			]
			tags = {item_scale = <item_scale>}
		}
		current_menu_anchor :Obj_SpawnScriptNow \{frontend_bg_swap}
	endif
	if GotParam \{title}
		CreateScreenElement {
			Type = TextElement
			parent = current_menu
			internal_scale = 1.0
			font = fontgrid_denim_title
			text = <title>
			rgba = (($g_menu_colors).menu_title)
			just = [center center]
			Pos = (0.0, 0.0)
			alpha = 0
			not_focusable
		}
		current_menu_anchor :se_setprops {frontend_title_text = <title>}
	endif
	return \{window_id = current_menu_anchor
		desc_id = current_menu_anchor}
endscript

script frontend_bg_swap 
	begin
	se_setprops \{frontend_menu_bg_2_alpha = 0}
	Wait \{0.7
		Seconds}
	se_setprops \{frontend_menu_bg_2_alpha = 1}
	Wait \{0.7
		Seconds}
	repeat
endscript

script clear_exclusive_devices 
	Change \{num_exclusive_mp_controllers = 0}
endscript

script add_exclusive_device \{device = 0}
	if ($num_exclusive_mp_controllers = 0)
		SetArrayElement \{ArrayName = exclusive_mp_controllers
			globalarray
			index = 0
			NewValue = -1}
		SetArrayElement \{ArrayName = exclusive_mp_controllers
			globalarray
			index = 1
			NewValue = -1}
		SetArrayElement \{ArrayName = exclusive_mp_controllers
			globalarray
			index = 2
			NewValue = -1}
		SetArrayElement \{ArrayName = exclusive_mp_controllers
			globalarray
			index = 3
			NewValue = -1}
	endif
	SetArrayElement ArrayName = exclusive_mp_controllers globalarray index = ($num_exclusive_mp_controllers) NewValue = <device>
	Change num_exclusive_mp_controllers = ($num_exclusive_mp_controllers + 1)
endscript

script get_all_exclusive_devices 
	if ($num_exclusive_mp_controllers = 0)
		return
	else
		return exclusive_device = ($exclusive_mp_controllers)
	endif
endscript

script add_menu_frontend_item {
		rgba = (($g_menu_colors).menu_gold)
		item_height = 60
		focus_script = mainmenu_focus
		unfocus_script = mainmenu_unfocus
		font = fontgrid_bordello
		internal_scale = 0.7
		pad_choose_sound = ui_menu_select_sfx
		parent = current_menu
		single_line = FALSE
		internal_just = [center center]
	}
	if ScreenElementExists \{id = current_menu}
		GetScreenElementDims \{id = current_menu}
		current_menu :GetSingleTag \{item_scale}
		if GetScreenElementChildren \{id = current_menu}
			GetArraySize <children>
		else
			array_Size = 0
		endif
		if GotParam \{choose_state}
			pad_choose_script = generic_event_choose
			pad_choose_params = {state = <choose_state> data = {<choose_state_data>}}
		endif
		if GotParam \{not_focusable}
			focus = {not_focusable}
		endif
		CreateScreenElement {
			Type = TextBlockElement
			parent = <parent>
			single_line = <single_line>
			fit_width = `expand	dims`
			fit_height = `scale	down	if	larger`
			fit_scale_mode = proportional
			dims = ((0.0, 1.0) * <item_height>)
			internal_scale = <internal_scale>
			internal_just = <internal_just>
			font = <font>
			text = <text>
			rgba = <rgba>
			just = [center center]
			Pos = (0.0, 0.0)
			Shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = (($g_menu_colors).menu_shadow)
			event_handlers = [
				{focus <focus_script> params = <focus_params>}
				{unfocus <unfocus_script>}
			]
			<focus>
			tags = {index = <array_Size>}
		}
		if GotParam \{pad_choose_script}
			SetScreenElementProps {
				id = <id>
				event_handlers = [
					{pad_choose <pad_choose_sound>}
					{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params>}}}
				]
			}
		endif
		return item_container_id = <id> item_id = <id>
	endif
endscript

script menu_frontend_focus 
	if desc_resolvealias \{Name = alias_text}
		retail_menu_focus id = <resolved_id>
	endif
endscript

script menu_frontend_unfocus 
	GetTags
	if GotParam \{rgba}
		set_unfocus_color rgba = <rgba>
	endif
	if desc_resolvealias \{Name = alias_text}
		retail_menu_unfocus id = <resolved_id>
	endif
	if GotParam \{rgba}
		set_unfocus_color
	endif
endscript
