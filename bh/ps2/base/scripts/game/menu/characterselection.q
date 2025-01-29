
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
	}
	if character_selection :desc_resolvealias \{Name = alias_character_selection_window
			param = character_selection_parent}
		menu_pos = (457.0, 410.0)
		make_generic_barrel_menu {
			centered = 1
			Pos = <menu_pos>
			max_expansion = 3
			Scale = 0.78
			pad_back_script = <pad_back_script>
			pad_back_params = <pad_back_params>
		}
		AssignAlias id = <vmenu_id> alias = current_menu
		if GotParam \{vmenu_alias}
			AssignAlias id = generic_barrel_menu alias = <vmenu_alias>
		endif
	else

	endif
	if character_selection :desc_resolvealias \{Name = alias_character_selection_window
			param = character_selection_window}
		SetScreenElementProps id = <character_selection_window> allow_child_rotate = true
		AssignAlias id = <character_selection_window> alias = character_selection_bio_window
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
endscript

script destroy_character_selection_menu 
	destroy_generic_barrel_menu
	if ScreenElementExists \{id = character_selection}
		DestroyScreenElement \{id = character_selection}
	endif
	cleanup_cas_menu_handlers
	clean_up_user_control_helpers
endscript

script add_character_selection_item \{pad_choose_sound = ui_menu_select_sfx
		parent = character_selection_bio_window}
	random_rot_angle = RandomFloat (-7.0, 7.0)
	if GotParam \{price}
		formatText TextName = price_text qs(0xe5814737) p = <price>
		show_price = 1
	endif
	if ScreenElementExists id = <parent>
		CreateScreenElement {
			Type = descinterface
			parent = <parent>
			desc = 'character_selection_item'
			dims = (64.0, 64.0)
			character_selection_item_bio_text = <bio>
		}
	else

	endif
	if GotParam \{additional_focus_params}
		<additional_focus_params> = {<additional_focus_params> id = <id>}
	endif
	if GotParam \{additional_unfocus_params}
		<additional_unfocus_params> = {<additional_unfocus_params> id = <id>}
	endif
	if GotParam \{not_focusable}
		add_generic_barrel_menu_text_item {
			text = <Name>
			pad_choose_script = <pad_choose_script>
			pad_choose_params = <pad_choose_params>
			additional_focus_script = <additional_focus_script>
			additional_focus_params = <additional_focus_params>
			additional_unfocus_script = <additional_unfocus_script>
			additional_unfocus_params = <additional_unfocus_params>
			not_focusable
		}
	else
		add_generic_barrel_menu_text_item {
			text = <Name>
			pad_choose_script = <pad_choose_script>
			pad_choose_params = <pad_choose_params>
			additional_focus_script = <additional_focus_script>
			additional_focus_params = <additional_focus_params>
			additional_unfocus_script = <additional_unfocus_script>
			additional_unfocus_params = <additional_unfocus_params>
		}
	endif
	return item_container_id = <item_container_id>
endscript

script character_selection_animate_in 
	SpawnScriptNow \{character_selection_animate_in_worker}
endscript

script character_selection_animate_in_worker 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if ScreenElementExists \{id = character_selection}
		character_selection :se_setprops \{character_selection_control_pos = {
				(0.0, -1000.0)
				relative
			}}
		if character_selection :desc_resolvealias \{Name = 0x44475582
				param = 0x7363d093}
			<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
		else

		endif
		if character_selection :desc_resolvealias \{Name = 0xf313b252
				param = 0x7c09a415}
			<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
		else

		endif
	else
		return
	endif
	if ScreenElementExists \{id = character_selection}
		character_selection :se_setprops \{character_selection_control_pos = {
				(0.0, 1030.0)
				relative
			}
			time = 0.2
			anim = gentle}
	else
		return
	endif
	Wait \{0.22
		Second}
	if ScreenElementExists \{id = character_selection}
		character_selection :se_setprops \{character_selection_control_pos = {
				(0.0, -30.0)
				relative
			}
			time = 0.1
			anim = gentle}
	else
		return
	endif
endscript

script character_selection_focus 
	<id> :se_setprops character_selection_item_text_alpha = 1.0
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script character_selection_unfocus 
	<id> :se_setprops character_selection_item_text_alpha = 0.0
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> <additional_unfocus_params>
	endif
endscript
