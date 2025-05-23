
script make_character_selection_menu {
		pad_back_sound = ui_menu_select_sfx
		pad_back_script = generic_event_back_block
		exclusive_device = ($primary_controller)
	}
	destroy_character_selection_menu
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	if NOT (($menu_over_ride_exclusive_device) = -1)
		exclusive_device = ($menu_over_ride_exclusive_device)
	endif
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		desc = 'character_selection'
		id = character_selection
		exclusive_device = <exclusive_device>
		0x751baa93 = (680.0, 680.0)
		0xc6739ef8 = (45.0, 45.0)
	}
	if character_selection :desc_resolvealias \{Name = alias_character_selection_vmenu
			param = character_selection_vmenu}
		AssignAlias id = <character_selection_vmenu> alias = current_menu
		if GotParam \{vmenu_id}
			AssignAlias id = <character_selection_vmenu> alias = <vmenu_id>
		endif
	else

	endif
	if character_selection :desc_resolvealias \{Name = alias_character_selection_smenu
			param = character_selection_smenu}
		SetScreenElementProps id = <character_selection_smenu> top_selection = true
	else

	endif
	if character_selection :desc_resolvealias \{Name = alias_character_selection_window
			param = character_selection_window}
		SetScreenElementProps id = <character_selection_window> allow_child_rotate = true
	else

	endif
	if NOT CD
		SetScreenElementProps \{id = current_menu
			event_handlers = [
				{
					pad_alt2
					cas_toggle_free_cam
				}
			]}
	endif
	SetScreenElementProps \{id = current_menu
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
			id = current_menu
			event_handlers = [
				{pad_down <pad_down_script> params = <pad_down_params>}
			]
		}
	endif
	if GotParam \{pad_up_script}
		SetScreenElementProps {
			id = current_menu
			event_handlers = [
				{pad_up <pad_up_script> params = <pad_up_params>}
			]
		}
	endif
	if GotParam \{pad_option2_script}
		SetScreenElementProps {
			id = current_menu
			event_handlers = [
				{pad_option2 <pad_back_sound>}
				{pad_option2 generic_blocking_execute_script params = {pad_script = <pad_option2_script> pad_params = {container_id = <id> <pad_option2_params>}}}
			]
		}
	endif
	if GotParam \{pad_option_script}
		SetScreenElementProps {
			id = current_menu
			event_handlers = [
				{pad_option <pad_back_sound>}
				{pad_option generic_blocking_execute_script params = {pad_script = <pad_option_script> pad_params = {container_id = <id> <pad_option_params>}}}
			]
		}
	endif
	if GotParam \{pad_back_script}
		SetScreenElementProps {
			id = current_menu
			event_handlers = [
				{pad_back <pad_back_sound>}
				{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {container_id = <id> <pad_back_params>}}}
			]
			replace_handlers
		}
	endif
endscript

script destroy_character_selection_menu 
	if ScreenElementExists \{id = character_selection}
		DestroyScreenElement \{id = character_selection}
	endif
	cleanup_cas_menu_handlers
	KillSpawnedScript \{Name = character_selection_animate_bio}
	destroy_viewport_ui
	clean_up_user_control_helpers
endscript

script add_character_selection_item \{focus_script = character_selection_focus
		unfocus_script = character_selection_unfocus
		pad_choose_sound = ui_menu_select_sfx
		parent = current_menu}
	<price_text> = qs(0x03ac90f0)
	if GotParam \{price}
		formatText TextName = price_text qs(0xe5814737) p = <price>
		show_price = 1
	endif
	if ScreenElementExists id = <parent>
		CreateScreenElement {
			Type = descinterface
			parent = <parent>
			desc = 'character_selection_item'
			dims = (64.0, 67.0)
		}
	else

	endif
	0x15b0619d <...>
	if GotParam \{alias}
		AssignAlias id = <item_container_id> alias = <alias>
	endif
	return item_container_id = <item_container_id>
endscript

script 0x15b0619d \{focus_script = character_selection_focus
		unfocus_script = character_selection_unfocus
		pad_choose_sound = ui_menu_select_sfx
		parent = current_menu}
	if GotParam \{icon}
		if (<icon> = None)
			icon = character_mug_placeholder
		endif
	endif
	if GotParam \{price}
		formatText TextName = price_text qs(0xe5814737) p = <price>
		show_price = 1
	endif
	if GotParam \{choose_state}
		pad_choose_script = ui_event_block
		pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data> container_id = <id>}}
	endif
	if GotParam \{choose_back}
		pad_choose_script = generic_event_back_block
	endif
	SetScreenElementProps {
		replace_handlers
		id = <id>
		character_selection_item_icon_icon_texture = <icon>
		character_selection_item_name_text = <Name>
		character_selection_item_bio_text = <bio>
		character_selection_item_icon_rot_angle = <random_rot_angle>
		character_selection_item_price_text_text = <price_text>
		character_selection_item_price_alpha = 0.0
		event_handlers = [
			{focus <focus_script> params = {id = <id> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params> Name = <Name> bio_text = <bio> show_price = <show_price> price_text = <price_text>}}
			{unfocus <unfocus_script> params = {id = <id> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params> show_price = <show_price>}}
		]
	}
	if GotParam \{pad_choose_script}
		if NOT (<pad_choose_script> = nullscript)
			SetScreenElementProps {
				id = <id>
				event_handlers = [
					{pad_choose <pad_choose_sound>}
					{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params>}}}
				]
			}
		endif
	endif
	if GotParam \{pad_square_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_square <pad_choose_sound>}
				{pad_square generic_blocking_execute_script params = {pad_script = <pad_square_script> pad_params = {container_id = <id> <pad_square_params>}}}
			]
		}
	endif
	if GotParam \{pad_start_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_start <pad_choose_sound>}
				{pad_start generic_blocking_execute_script params = {pad_script = <pad_start_script> pad_params = {container_id = <id> <pad_start_params>}}}
			]
		}
	endif
	if GotParam \{not_focusable}
		SetScreenElementProps {id = <id> not_focusable}
	endif
	return item_container_id = <id>
endscript

script car_skull_anim 
endscript

script character_selection_flame_blink 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	begin
	if ScreenElementExists \{id = character_selection}
		character_selection :se_setprops \{character_selection_flame_scale = 1.2
			time = 0.15
			anim = gentle}
	else
		return
	endif
	Wait \{0.25
		Seconds}
	if ScreenElementExists \{id = character_selection}
		character_selection :se_setprops \{character_selection_flame_scale = 0.8
			time = 0.4
			anim = gentle}
	else
		return
	endif
	Wait \{0.45000002
		Seconds}
	repeat
endscript

script character_selection_focus 
	<id> :se_setprops Scale = 1.4499999
	<id> :se_setprops character_selection_item_icon_pos = {relative (-10.0, -5.0)}
	<id> :se_setprops character_selection_item_icon_alpha = 1.0
	<id> :se_setprops character_selection_item_icon_rot_angle = 0.0
	if ScreenElementExists \{id = character_selection}
		character_selection :se_setprops character_selection_name_text = <Name>
		character_selection :se_setprops \{character_selection_bio_text = qs(0x00000000)}
		character_selection :se_setprops \{character_selection_bio_dims = (310.0, 0.0)}
		character_selection :se_setprops character_selection_bio_text = <bio_text>




		if GotParam \{show_price}
			character_selection :se_setprops \{character_selection_price_alpha = 1.0}
			character_selection :se_setprops character_selection_price_text_text = <price_text>
		else
			character_selection :se_setprops \{character_selection_price_alpha = 0.0}
		endif
	endif
	SpawnScriptNow \{character_selection_animate_bio
		params = {
			id = character_selection
		}}
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script character_selection_unfocus 
	<id> :se_setprops Scale = 1.0
	<id> :se_setprops character_selection_item_icon_pos = {relative (10.0, 5.0)}
	<id> :se_setprops character_selection_item_icon_alpha = 1.0
	<id> :se_setprops character_selection_item_icon_rot_angle = 0.0
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
	if ScriptIsRunning \{character_selection_animate_bio}
		KillSpawnedScript \{Name = character_selection_animate_bio}
	endif
endscript

script character_selection_animate_bio 
	if NOT ScreenElementExists id = <id>
		return
	endif
	if <id> :desc_resolvealias Name = alias_character_selection_bio param = character_selection_bio
		GetScreenElementDims id = <character_selection_bio>
	else

	endif
	if ScreenElementExists id = <id>
		<id> :se_setprops character_selection_bio_pos = (0.0, 0.0)
	else
		return
	endif

	if (<height> > 370)
		time = ((<height> -360.0) * 0.05)
		offset = ((360.0 - <height>) * (0.0, 1.0))
		Wait \{5
			Seconds}
		begin
		if ScreenElementExists id = <id>
			<id> :se_setprops character_selection_bio_pos = {relative <offset>} time = <time>
		else
			return
		endif
		Wait (<time> + 5) Seconds
		offset = (-1 * <offset>)
		if ScreenElementExists id = <id>
			<id> :se_setprops character_selection_bio_pos = {relative <offset>} time = <time>
		else
			return
		endif
		Wait (<time> + 5) Seconds
		offset = (-1 * <offset>)
		repeat
	endif
endscript

script make_character_purchase_menu {
		pad_back_sound = ui_menu_select_sfx
		pad_choose_sound = ui_menu_select_sfx
		pad_back_script = generic_event_back_block
		exclusive_device = ($primary_controller)
	}
	destroy_character_purchase_menu
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	if NOT (($menu_over_ride_exclusive_device) = -1)
		exclusive_device = ($menu_over_ride_exclusive_device)
	endif
	formatText TextName = price_text qs(0xe5814737) p = <price>
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		desc = 'character_purchase_menu'
		id = character_purchase
		exclusive_device = <exclusive_device>
		z_priority = 300
		character_purchase_price_text_text = <price_text>
	}
	character_purchase :Obj_SpawnScriptNow \{highlight_motion
		params = {
			menu_id = character_purchase
		}}
	if character_purchase :desc_resolvealias \{Name = alias_character_purchase_menu
			param = character_purchase_vmenu}
		AssignAlias id = <character_purchase_vmenu> alias = character_purchase_menu
	else

	endif
	if character_purchase :desc_resolvealias \{Name = alias_character_purchase_menu_yes
			param = character_purchase_yes}
		SetScreenElementProps {
			id = <character_purchase_yes>
			event_handlers = [
				{focus character_purchase_focus params = {item = yes}}
				{unfocus character_purchase_unfocus params = {item = yes}}
				{pad_choose purchase_character params = {price = <price> pad_choose_script = <choose_yes_script> pad_choose_params = <choose_yes_params>}}
				{pad_back generic_event_back}
			]
		}
	else

	endif
	if character_purchase :desc_resolvealias \{Name = alias_character_purchase_menu_no
			param = character_purchase_no}
		SetScreenElementProps {
			id = <character_purchase_no>
			alpha = 1.0
			dims = (150.0, 50.0)
			event_handlers = [
				{focus character_purchase_focus params = {item = no}}
				{unfocus character_purchase_unfocus params = {item = no}}
				{pad_choose generic_event_back}
				{pad_back generic_event_back}
			]
		}
	else

	endif
endscript

script destroy_character_purchase_menu 
	if ScreenElementExists \{id = character_purchase}
		DestroyScreenElement \{id = character_purchase}
	endif
	cleanup_cas_menu_handlers
	destroy_viewport_ui
	clean_up_user_control_helpers
endscript

script character_purchase_focus 
	if ScreenElementExists \{id = character_purchase}
		if (<item> = no)
			generic_menu_up_or_down_sound \{up = 1}
		else
			generic_menu_up_or_down_sound \{down = 2}
		endif
		Obj_GetID
		GetTags
		if character_purchase :desc_resolvealias \{Name = alias_highlight}
			Wait \{2
				gameframes}
			GetScreenElementChildren id = <objID>
			GetScreenElementProps id = (<children> [0])
			dims = (((2.5, 0.0) * <dims>.(1.0, 0.0) * <Scale>.(1.0, 0.0)) + ((0.0, 1.0) * <dims>.(0.0, 1.0) * <Scale>.(0.0, 1.0)))
			offset = ((0.0, 1.0) * (<dims>.(0.0, 1.0) / 2))
			Scale = (((1.0, 0.0) * (((<dims>.(1.0, 0.0) + 50.0) / 256.0))) + (0.0, 1.6))
			GetScreenElementPosition id = (<children> [0]) summed
			<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + <offset>)} Scale = <Scale>
			<resolved_id> :se_waitprops
			GetScreenElementPosition id = (<children> [0]) summed
			<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + <offset> + (-10.0, 0.0))} time = 0.05
			<resolved_id> :se_waitprops
			GetScreenElementPosition id = (<children> [0]) summed
			<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + <offset>)} Scale = <Scale> time = 0.05
			<resolved_id> :se_waitprops
		endif
	endif
endscript

script character_purchase_unfocus 
endscript

script purchase_character 

	if ($transitions_locked = 1 || $menu_flow_locked > 0)
		return
	endif
	if ScriptIsRunning \{trigger_cas_rebuild_loop}
		return
	endif
	if ($ps2_changing_appearance_paks = 1 || $ps2_loading_appearance_paks = 1)
		return
	endif
	if cas_queue_is_busy in_queue_too <...>
		return
	endif
	get_savegame_from_controller controller = ($primary_controller)
	if has_enough_money price = <price> savegame = <savegame>
		SoundEvent \{event = menu_purchase_item}
		decrease_band_money price = <price> savegame = <savegame>
		<pad_choose_script> <pad_choose_params>
	else
		character_purchase :se_setprops \{character_purchase_dialogue_text = qs(0x6fe705b1)
			character_purchase_menu_yes_text = qs(0x494b4d7f)}
		if character_purchase :desc_resolvealias \{Name = alias_character_purchase_menu_no
				param = character_purchase_no}
			SetScreenElementProps {
				id = <character_purchase_no>
				alpha = 0
				not_focusable
				dims = (0.0, 0.0)
			}
		endif
		if character_purchase :desc_resolvealias \{Name = alias_character_purchase_menu_yes
				param = character_purchase_yes}
			SetScreenElementProps {
				id = <character_purchase_yes>
				event_handlers = [
					{pad_choose generic_event_back}
				]
				replace_handlers
			}
			LaunchEvent Type = focus target = <character_purchase_yes>
		endif
	endif
endscript
