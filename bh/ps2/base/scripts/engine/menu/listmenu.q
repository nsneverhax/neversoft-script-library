
script make_list_menu {
		parent = root_window
		pad_back_sound = ui_menu_select_sfx
		pad_back_script = generic_event_back
		additional_z_priority = 20
		exclusive_device = ($primary_controller)
		color_scheme = ($0x3cdbdbae)
	}
	generic_list_destroy
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	if NOT (($menu_over_ride_exclusive_device) = -1)
		exclusive_device = ($menu_over_ride_exclusive_device)
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

	endif
	current_list_menu :SetTags {color_scheme = <color_scheme>}
	SetScreenElementProps \{id = current_list_menu
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up = 1
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down = 2
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
				{pad_option2 <pad_back_sound>}
				{pad_option2 generic_blocking_execute_script params = {pad_script = <pad_option2_script> pad_params = <pad_option2_params>}}
			]
		}
	endif
	if GotParam \{pad_option_script}
		SetScreenElementProps {
			id = current_list_menu
			event_handlers = [
				{pad_option <pad_back_sound>}
				{pad_option generic_blocking_execute_script params = {pad_script = <pad_option_script> pad_params = <pad_option_params>}}
			]
		}
	endif
	if GotParam \{pad_back_script}
		generic_list_menu :SetTags pad_back_script = <pad_back_script> pad_back_params = <pad_back_params>
	endif
	menu_id = <id>
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
		pad_choose_sound = ui_menu_select_sfx
		pad_back_sound = generic_menu_pad_back_sound
		parent = current_list_menu
		editable_icon = colorwheel_tiny}
	if NOT GotParam \{pad_back_script}
		generic_list_menu :GetTags
	endif
	no_price = true
	if NOT <parent> :GetSingleTag color_scheme
		color_scheme = ($default_color_scheme)
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
			generic_list_menu_item_text_rgba = (<color_scheme>.text_color)
			generic_list_menu_item_text_font = (<color_scheme>.text_font)
		}
	else

	endif
	if GotParam \{no_price}
		<id> :se_setprops generic_list_menu_item_price_alpha = 0.0
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
			{focus <focus_script> params = {id = <id> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params> no_price = <no_price> editable = <editable>}}
			{unfocus <unfocus_script> params = {id = <id> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params> editable = <editable>}}
		]
	}
	if GotParam \{pad_choose_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_choose <pad_choose_sound>}
				{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = <pad_choose_params>}}
			]
		}
	endif
	if GotParam \{pad_back_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_back <pad_back_sound>}
				{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = <pad_back_params>}}
			]
		}
	endif
	if GotParam \{pad_square_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_square <pad_choose_sound>}
				{pad_option generic_blocking_execute_script params = {pad_script = <pad_square_script> pad_params = <pad_square_params>}}
			]
		}
	endif
	if GotParam \{pad_option2_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_option2 <pad_choose_sound>}
				{pad_option2 generic_blocking_execute_script params = {pad_script = <pad_option2_script> pad_params = <pad_option2_params>}}
			]
		}
	endif
	if GotParam \{pad_start_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_start <pad_choose_sound>}
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
		if <id> :se_getparentid
			if <parent_id> :GetSingleTag color_scheme
				<id> :se_setprops generic_list_menu_item_text_rgba = (<color_scheme>.text_focus_color)
				<id> :se_setprops generic_list_menu_item_text_font = (<color_scheme>.0xf9bd0c3e)
			endif
		endif
		if NOT GotParam \{no_price}
			<id> :se_setprops generic_list_menu_item_price_alpha = 1.0
		endif
		if GotParam \{editable}
			<id> :se_setprops generic_list_menu_item_editable_alpha = 1.0
		endif
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script menu_list_unfocus 
	if ScreenElementExists id = <id>
		if <id> :se_getparentid
			if <parent_id> :GetSingleTag color_scheme
				<id> :se_setprops generic_list_menu_item_text_rgba = (<color_scheme>.text_color)
				<id> :se_setprops generic_list_menu_item_text_font = (<color_scheme>.text_font)
			endif
		endif
		<id> :se_setprops generic_list_menu_item_price_alpha = 0.0
		<id> :se_setprops generic_list_menu_item_editable_alpha = 0.0
	endif
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> <additional_unfocus_params>
	endif
endscript

script animate_in_list_menu 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if ScreenElementExists id = <id>
		<id> :se_setprops generic_list_menu_icon_container_scale = 0.5
		<id> :se_setprops generic_list_menu_icon_container_scale = 1.0 time = 0.2
		<id> :se_setprops generic_list_menu_container_pos = {(-200.0, 0.0) relative}
		<id> :se_setprops generic_list_menu_container_pos = {(200.0, 0.0) relative} time = 0.2
		<id> :se_setprops generic_list_icon_name_pos = {(0.0, -30.0) relative}
		<id> :se_setprops generic_list_icon_name_pos = {(0.0, 40.0) relative} time = 0.2
	endif
	Wait \{0.22
		Seconds}
	if ScreenElementExists id = <id>
		<id> :se_setprops generic_list_icon_name_pos = {(0.0, -10.0) relative} time = 0.15
	endif
endscript

script pad_choose_dialogue_execute \{pad_choose_script = nullscript
		price_text = qs(0x27b7dfe5)
		pad_yes_script = continue_purchase_item
		pad_no_script = pad_choose_dialogue_return}
	0x79db87d7
	if ScreenElementExists \{id = generic_list_menu}
		generic_list_menu :se_setprops generic_list_menu_dialogue_text_text = <pad_choose_dialogue> generic_list_menu_item_price_text_text = <price_text> generic_list_menu_dialogue_menu_yes_text = qs(0x6d562a67) generic_list_menu_dialogue_menu_no_text = qs(0x47157885)
		generic_list_menu :se_setprops \{generic_list_menu_up_arrow_alpha = 0
			generic_list_menu_down_arrow_alpha = 0}
		LaunchEvent \{target = current_list_menu
			Type = unfocus}
		generic_list_menu :se_setprops \{generic_list_menu_smenu_alpha = 0.0}
		generic_list_menu :se_setprops \{generic_list_menu_dialogue_alpha = 1.0}
		generic_list_menu :desc_resolvealias \{Name = alias_generic_list_menu_dialogue_menu
			param = generic_list_dialogue}
		if generic_list_menu :desc_resolvealias \{Name = alias_generic_list_menu_dialogue_menu_yes
				param = generic_list_dialogue_yes}
			SetScreenElementProps {
				id = <generic_list_dialogue_yes>
				alpha = 1.0
				event_handlers = [
					{focus pad_choose_dialogue_focus params = {item = yes}}
					{unfocus pad_choose_dialogue_unfocus params = {item = yes}}
					{pad_choose <pad_yes_script> params = {generic_list_dialogue = <generic_list_dialogue> pad_choose_script = <pad_choose_script> pad_choose_params = <pad_choose_params> part = (<pad_choose_params>.part) price = <price> is_preset = (<pad_choose_params>.is_preset)}}
					{pad_back pad_choose_dialogue_return params = {generic_list_dialogue = <generic_list_dialogue>}}
				]
				replace_handlers
			}
		endif
		if generic_list_menu :desc_resolvealias \{Name = alias_generic_list_menu_dialogue_menu_no
				param = generic_list_dialogue_no}
			SetScreenElementProps {
				id = <generic_list_dialogue_no>
				alpha = 1.0
				dims = (150.0, 50.0)
				event_handlers = [
					{focus pad_choose_dialogue_focus params = {item = no}}
					{unfocus pad_choose_dialogue_unfocus params = {item = no}}
					{pad_choose <pad_no_script> params = {generic_list_dialogue = <generic_list_dialogue>}}
					{pad_back pad_choose_dialogue_return params = {generic_list_dialogue = <generic_list_dialogue>}}
				]
				focusable
				replace_handlers
			}
		endif
		setup_cas_menu_handlers vmenu_id = <generic_list_dialogue> camera_list = <camera_list> zoom_camera = <zoom_camera>
		LaunchEvent target = <generic_list_dialogue> Type = focus data = {child_index = 0}
		clean_up_user_control_helpers
		menu_finish \{car_helper_text_cancel}
	endif
	Wait \{0.5
		Seconds}
	0xf00f29a9
endscript

script pad_choose_dialogue_return 
	LaunchEvent target = <generic_list_dialogue> Type = unfocus
	LaunchEvent \{target = current_list_menu
		Type = focus}
	generic_menu_pad_back_sound
	generic_list_menu :se_setprops \{generic_list_menu_smenu_alpha = 1.0}
	generic_list_menu :se_setprops \{generic_list_menu_dialogue_alpha = 0.0}
	generic_list_menu :se_setprops \{generic_list_menu_up_arrow_alpha = 1}
	generic_list_menu :se_setprops \{generic_list_menu_down_arrow_alpha = 1}
endscript

script pad_choose_dialogue_focus 

	if ScreenElementExists \{id = generic_list_menu}
		if (<item> = yes)
			generic_menu_up_or_down_sound
			SetScreenElementProps {
				id = generic_list_menu
				generic_list_menu_dialogue_menu_yes_rgba = (($default_color_scheme).text_focus_color)
				generic_list_menu_dialogue_menu_yes_font = fontgrid_text_a1
			}
		else
			generic_menu_up_or_down_sound
			generic_list_menu :se_setprops generic_list_menu_dialogue_menu_no_rgba = (($default_color_scheme).text_focus_color)
			generic_list_menu :se_setprops \{generic_list_menu_dialogue_menu_no_font = fontgrid_text_a1}
		endif
	endif
endscript

script pad_choose_dialogue_unfocus 
	if ScreenElementExists \{id = generic_list_menu}
		if (<item> = yes)
			generic_list_menu :se_setprops generic_list_menu_dialogue_menu_yes_rgba = (($default_color_scheme).text_color)
			generic_list_menu :se_setprops generic_list_menu_dialogue_menu_yes_font = ($test_menu_font)
		else
			generic_list_menu :se_setprops generic_list_menu_dialogue_menu_no_rgba = (($default_color_scheme).text_color)
			generic_list_menu :se_setprops generic_list_menu_dialogue_menu_no_font = ($test_menu_font)
		endif
	endif
endscript

script continue_purchase_item 

	if has_enough_money price = <price>
		SoundEvent \{event = menu_purchase_item}
		decrease_band_money price = <price>
		if NOT GotParam \{is_preset}
			if NOT getcasappearancepart part = <part>

			endif
		else
			desc_id = (<part>.desc_id)
			<part> = (<pad_choose_params>.presets)
		endif
		set_current_band_part_flags part = <part> desc_id = <desc_id> purchased savegame = ($cas_current_savegame)
		<pad_choose_script> <pad_choose_params>
	else
		generic_list_menu :se_setprops \{generic_list_menu_dialogue_text_text = qs(0xf1dadf1b)
			generic_list_menu_dialogue_menu_yes_text = qs(0x494b4d7f)}
		SoundEvent \{event = ui_sfx_negative_select}
		if generic_list_menu :desc_resolvealias \{Name = alias_generic_list_menu_dialogue_menu_no
				param = generic_list_dialogue_no}
			SetScreenElementProps {
				id = <generic_list_dialogue_no>
				alpha = 0
				not_focusable
				dims = (0.0, 0.0)
			}
		endif
		if generic_list_menu :desc_resolvealias \{Name = alias_generic_list_menu_dialogue_menu_yes
				param = generic_list_dialogue_yes}
			SetScreenElementProps {
				id = <generic_list_dialogue_yes>
				event_handlers = [
					{pad_choose pad_choose_dialogue_return params = {generic_list_dialogue = <generic_list_dialogue>}}
				]
				replace_handlers
			}
			LaunchEvent Type = focus target = <generic_list_dialogue_yes>
		endif
	endif
endscript
