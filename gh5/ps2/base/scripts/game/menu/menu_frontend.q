exclusive_mp_controllers = [
	-1
	-1
	-1
	-1
]
num_exclusive_mp_controllers = 0

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
	else
		add_gamertag_helper exclusive_device = <exclusive_device>
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
		current_menu :obj_spawnscript \{highlight_motion}
	endif
	if GotParam \{title}
		CreateScreenElement {
			Type = TextElement
			parent = current_menu
			internal_scale = 1.3
			font = fontgrid_title_a1
			text = <title>
			rgba = [255 255 255 255]
			just = [center center]
			Pos = (0.0, 0.0)
			not_focusable
		}
	endif
	return \{window_id = current_menu_anchor
		desc_id = current_menu_anchor}
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
	getnumplayersingame
	if (<num_players> = 0)
		return
	endif
	exclusive_device = []
	i = 1
	begin
	getplayerinfo <i> controller
	AddArrayElement array = <exclusive_device> element = <controller>
	exclusive_device = <array>
	<i> = (<i> + 1)
	repeat <num_players>
	return exclusive_device = <exclusive_device>
endscript

script add_menu_frontend_item \{rgba = [
			255
			255
			255
			255
		]
		item_height = 50
		focus_script = mainmenu_focus
		unfocus_script = mainmenu_unfocus
		font = fontgrid_text_a6
		internal_scale = 0.65000004
		pad_choose_sound = ui_menu_select_sfx
		parent = current_menu
		single_line = true
		internal_just = [
			left
			top
		]
		pos_anchor = [
			left
			top
		]}
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
			Type = TextElement
			parent = <parent>
			internal_scale = <internal_scale>
			font = <font>
			text = <text>
			rgba = <rgba>
			just = [center center]
			internal_just = <internal_just>
			pos_anchor = <pos_anchor>
			child_anchor = <pos_anchor>
			Pos = (0.0, 0.0)
			single_line = <single_line>
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
