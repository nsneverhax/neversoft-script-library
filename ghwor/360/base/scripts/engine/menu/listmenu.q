default_color_scheme = {
	title_color = [
		175
		175
		175
		255
	]
	text_color = [
		150
		130
		75
		255
	]
	text_focus_color = [
		220
		220
		220
		255
	]
}
cas_color_scheme = {
	$default_color_scheme
	text_color = [
		205
		185
		123
		255
	]
	text_focus_color = [
		220
		220
		220
		255
	]
	text_unfocusable_color = [
		120
		120
		120
		100
	]
}
test_menu_font = fontgrid_text_a1

script make_list_menu {
		parent = root_window
		pad_back_sound = ui_sfx
		pad_back_sound_menustate = Generic
		pad_back_sound_uitype = back
		pad_back_script = generic_event_back
		additional_z_priority = 20
		exclusive_device = ($primary_controller)
	}
	generic_list_destroy
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
	endif
	if ScreenElementExists \{id = current_menu}
		current_menu :se_setprops \{alpha = 0.5}
	endif
	CreateScreenElement {
		Type = descinterface
		parent = <parent>
		desc = 'generic_list_menu'
		id = generic_list_menu
		exclusive_device = <exclusive_device>
		relative_z_priority = <additional_z_priority>
		generic_list_menu_icon_icon_texture = <icon>
		generic_list_icon_name_text = <text>
		list_title_text = <title>
		ignore_parent_alpha = true
	}
	if NOT GotParam \{text}
		<id> :se_setprops generic_list_icon_name_alpha = 0
	endif
	if GotParam \{list_offset}
		<id> :se_setprops generic_list_menu_container_pos = {<list_offset> relative}
	endif
	if GotParam \{icon_offset}
		<id> :se_setprops generic_list_menu_icon_container_pos = {<icon_offset> relative}
	endif
	if NOT ((GotParam list_offset) || (GotParam icon_offset))
		GetScreenElementPosition id = <parent> absolute
		if (<screenelementpos>.(0.0, 1.0) > 550)
			raise_by = ((480 - <screenelementpos>.(0.0, 1.0)) * (0.0, 1.0))
			<id> :se_setprops generic_list_menu_container_pos = {relative <raise_by>}
			raise_by = ((550 - <screenelementpos>.(0.0, 1.0)) * (0.0, 1.0))
			<id> :se_setprops generic_list_menu_icon_container_pos = {relative <raise_by>}
		elseif (<screenelementpos>.(0.0, 1.0) > 500)
			raise_by = ((480 - <screenelementpos>.(0.0, 1.0)) * (0.0, 1.0))
			<id> :se_setprops generic_list_menu_container_pos = {relative <raise_by>}
			raise_by = ((500 - <screenelementpos>.(0.0, 1.0)) * (0.0, 1.0))
			<id> :se_setprops generic_list_menu_icon_container_pos = {relative <raise_by>}
		endif
		if (<screenelementpos>.(0.0, 1.0) < 200)
			<id> :se_setprops generic_list_menu_container_pos = {relative (0.0, 55.0)}
			<id> :se_setprops generic_list_menu_icon_container_pos = {relative (0.0, 20.0)}
		endif
	endif
	if generic_list_menu :desc_resolvealias \{Name = alias_generic_list_menu_vmenu
			param = generic_list_vmenu}
		AssignAlias id = <generic_list_vmenu> alias = current_list_menu
		if GotParam \{vmenu_id}
			AssignAlias id = <generic_list_vmenu> alias = <vmenu_id>
		endif
	else
		ScriptAssert \{qs(0xf9a4eab9)}
	endif
	SetScreenElementProps \{id = current_list_menu
		event_handlers = [
			{
				menu_selection_changed
				ui_sfx
				params = {
					menustate = Generic
					uitype = scrollup
				}
			}
		]}
	if GotParam \{pad_down_script}
		SetScreenElementProps {
			id = current_list_menu
			event_handlers = [
				{pad_down <pad_down_script> params = <pad_down_params>}
			]
		}
	endif
	if GotParam \{pad_up_script}
		SetScreenElementProps {
			id = current_list_menu
			event_handlers = [
				{pad_up <pad_up_script> params = <pad_up_params>}
			]
		}
	endif
	if GotParam \{pad_option2_script}
		SetScreenElementProps {
			id = current_list_menu
			event_handlers = [
				{pad_option2 <pad_back_sound> params = {menustate = <pad_back_sound_menustate> uitype = <pad_back_sound_uitype>}}
				{pad_option2 generic_blocking_execute_script params = {pad_script = <pad_option2_script> pad_params = <pad_option2_params>}}
			]
		}
	endif
	if GotParam \{pad_option_script}
		SetScreenElementProps {
			id = current_list_menu
			event_handlers = [
				{pad_option <pad_back_sound> params = {menustate = <pad_back_sound_menustate> uitype = <pad_back_sound_uitype>}}
				{pad_option generic_blocking_execute_script params = {pad_script = <pad_option_script> pad_params = <pad_option_params>}}
			]
		}
	endif
	if GotParam \{pad_back_script}
		generic_list_menu :SetTags pad_back_script = <pad_back_script> pad_back_params = <pad_back_params>
	endif
	menu_id = <id>
	SpawnScriptNow animate_in_list_menu params = {id = <menu_id>}
endscript

script listmenu_physics_elements 
	RequireParams \{[
			screen_id
		]
		all}
endscript

script generic_list_destroy 
	if ScreenElementExists \{id = generic_list_menu}
		DestroyScreenElement \{id = generic_list_menu}
	endif
	if ScreenElementExists \{id = popout_unfocus_current_menu}
		DestroyScreenElement \{id = popout_unfocus_current_menu}
	endif
	cleanup_cas_menu_handlers
	clean_up_user_control_helpers
	if ScreenElementExists \{id = current_menu}
		current_menu :se_setprops \{alpha = 1.0}
	endif
endscript

script add_list_item \{focus_script = menu_list_focus
		unfocus_script = menu_list_unfocus
		pad_choose_sound = ui_sfx
		pad_choose_sound_menustate = Generic
		pad_choose_sound_uitype = select
		pad_back_sound = ui_sfx
		pad_back_sound_menustate = Generic
		pad_back_sound_uitype = back
		parent = current_list_menu
		editable_icon = colorwheel_tiny}
	if NOT GotParam \{pad_back_script}
		generic_list_menu :GetTags
	endif
	if GotParam \{price}
		formatText \{TextName = price_text
			qs(0xda88f456)}
	else
		no_price = true
	endif
	if ScreenElementExists id = <parent>
		CreateScreenElement {
			Type = descinterface
			parent = <parent>
			desc = 'generic_list_menu_item'
			dims = (300.0, 40.0)
			generic_list_menu_item_text_text = <text>
			generic_list_menu_item_price_text_text = <price_text>
			generic_list_menu_item_editable_texture = <editable_icon>
		}
	else
		ScriptAssert \{qs(0x46ce1fb5)}
	endif
	if GotParam \{no_price}
		<id> :se_setprops generic_list_menu_item_price_alpha = 0.0
	else
		<id> :se_setprops generic_list_menu_item_price_alpha = 1.0
	endif
	if GotParam \{is_locked_item}
		<id> :se_setprops icon_unlocked_reward_alpha = 0
		<id> :se_setprops icon_locked_alpha = 1
	elseif GotParam \{is_unlocked_item}
		<id> :se_setprops icon_unlocked_reward_alpha = 1
		<id> :se_setprops icon_locked_alpha = 0
	else
		<id> :se_setprops icon_unlocked_reward_alpha = 0
		<id> :se_setprops icon_locked_alpha = 0
	endif
	if GotParam \{editable}
		editable = 1
	endif
	if GotParam \{choose_state}
		pad_choose_script = ui_event
		pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data>}}
	endif
	if GotParam \{choose_back}
		pad_choose_script = generic_event_back
	endif
	SetScreenElementProps {
		id = <id>
		event_handlers = [
			{focus <focus_script> params = {id = <id> index = <index> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params> no_price = <no_price> editable = <editable>}}
			{unfocus <unfocus_script> params = {id = <id> index = <index> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params> editable = <editable>}}
		]
	}
	if GotParam \{pad_choose_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_choose <pad_choose_sound> params = {menustate = <pad_choose_sound_menustate> uitype = <pad_choose_sound_uitype>}}
				{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = <pad_choose_params>}}
			]
		}
	endif
	if GotParam \{pad_back_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_back <pad_back_sound> params = {menustate = <pad_back_sound_menustate> uitype = <pad_back_sound_uitype>}}
				{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = <pad_back_params>}}
			]
		}
	endif
	if GotParam \{pad_square_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_square <pad_choose_sound> params = {menustate = <pad_choose_sound_menustate> uitype = <pad_choose_sound_uitype>}}
				{pad_option generic_blocking_execute_script params = {pad_script = <pad_square_script> pad_params = <pad_square_params>}}
			]
		}
	endif
	if GotParam \{pad_option2_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_option2 <pad_choose_sound> params = {menustate = <pad_choose_sound_menustate> uitype = <pad_choose_sound_uitype>}}
				{pad_option2 generic_blocking_execute_script params = {pad_script = <pad_option2_script> pad_params = <pad_option2_params>}}
			]
		}
	endif
	if GotParam \{pad_start_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_start <pad_choose_sound> params = {menustate = <pad_choose_sound_menustate> uitype = <pad_choose_sound_uitype>}}
				{pad_start generic_blocking_execute_script params = {pad_script = <pad_start_script> pad_params = <pad_start_params>}}
			]
		}
	endif
	if GotParam \{text_case}
		<id> :se_setprops generic_list_menu_item_text_textcase = <text_case>
	endif
endscript

script menu_list_focus 
	if ScreenElementExists id = <id>
		<id> :se_setprops generic_list_menu_item_text_rgba = (($default_color_scheme).text_focus_color)
		<id> :se_setprops generic_list_menu_item_text_font = fontgrid_text_a1
		<id> :se_setprops light_bar_alpha = 0.8
		if GotParam \{price}
			<id> :se_setprops generic_list_menu_item_price_alpha = 1.0
		endif
		if GotParam \{editable}
			<id> :se_setprops generic_list_menu_item_editable_alpha = 1.0
		endif
		if ScreenElementExists \{id = generic_list_menu}
			if generic_list_menu :desc_resolvealias \{Name = alias_generic_scrollbar_wgt}
				generic_scrollbar_wgt_update_thumb_pos id = <resolved_id> index = <index>
			endif
		endif
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script menu_list_unfocus 
	if ScreenElementExists id = <id>
		<id> :se_setprops generic_list_menu_item_text_rgba = [205 185 123 255]
		<id> :se_setprops generic_list_menu_item_text_font = ($test_menu_font)
		<id> :se_setprops generic_list_menu_item_text_material = NULL
		<id> :se_setprops generic_list_menu_item_editable_alpha = 0.0
		<id> :se_setprops light_bar_alpha = 0
	endif
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> <additional_unfocus_params>
	endif
endscript

script animate_in_list_menu 
	listmenu_physics_elements \{screen_id = generic_list_menu_id}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if ScreenElementExists id = <id>
		<id> :se_setprops generic_list_menu_icon_container_scale = 0.5
		<id> :se_setprops generic_list_menu_icon_container_scale = 1.0 time = 0.2
		<id> :se_setprops generic_list_menu_container_pos = {(-190.0, 0.0) relative}
		<id> :se_setprops generic_list_menu_container_pos = {(270.0, 0.0) relative} time = 0.2
		<id> :se_setprops generic_list_icon_name_pos = {(0.0, -30.0) relative}
		<id> :se_setprops generic_list_icon_name_pos = {(0.0, 40.0) relative} time = 0.2
	endif
	Wait \{0.22
		Seconds}
	if ScreenElementExists id = <id>
		<id> :se_setprops generic_list_icon_name_pos = {(0.0, -10.0) relative} time = 0.15
	endif
endscript
