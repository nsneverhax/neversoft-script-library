
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
		type = DescInterface
		parent = root_window
		desc = 'character_selection'
		id = character_selection
		exclusive_device = <exclusive_device>
	}
	if character_selection :Desc_ResolveAlias \{name = alias_character_selection_vmenu
			param = character_selection_vmenu}
		AssignAlias id = <character_selection_vmenu> alias = current_menu
		if GotParam \{vmenu_id}
			AssignAlias id = <character_selection_vmenu> alias = <vmenu_id>
		endif
	else
		ScriptAssert \{qs("\Lcharacter_selection was unable to create current_menu alias")}
	endif
	if character_selection :Desc_ResolveAlias \{name = alias_character_selection_smenu
			param = character_selection_smenu}
		SetScreenElementProps id = <character_selection_smenu> top_selection = true
	else
		ScriptAssert \{qs("\Lcharacter_selection was unable to create current_menu alias")}
	endif
	if character_selection :Desc_ResolveAlias \{name = alias_character_selection_window
			param = character_selection_window}
		SetScreenElementProps id = <character_selection_window> allow_child_rotate = true
	else
		ScriptAssert \{qs("\Lcharacter_selection was unable to create character_selection_window alias")}
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
	KillSpawnedScript \{name = character_selection_animate_bio}
	destroy_viewport_ui
	clean_up_user_control_helpers
endscript

script add_character_selection_item \{focus_script = character_selection_focus
		unfocus_script = character_selection_unfocus
		pad_choose_sound = ui_menu_select_sfx
		parent = current_menu}
	<price_text> = qs("\L")
	if GotParam \{price}
		FormatText TextName = price_text qs("\L$%p") p = <price>
		show_price = 1
	endif
	if ScreenElementExists id = <parent>
		CreateScreenElement {
			type = DescInterface
			parent = <parent>
			desc = 'character_selection_item'
			dims = (64.0, 67.0)
			character_selection_item_icon_icon_texture = <icon>
			character_selection_item_icon_rot_angle = 0.0
		}
	else
		ScriptAssert \{qs("\Ladd_character_selection_item was unable to find its parent menu, make sure it exists.")}
	endif
	if GotParam \{choose_state}
		pad_choose_script = ui_event_block
		pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data> container_id = <id>}}
	endif
	if GotParam \{choose_back}
		pad_choose_script = generic_event_back_block
	endif
	SetScreenElementProps {
		id = <id>
		event_handlers = [
			{focus <focus_script> params = {id = <id> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params> name = <name> bio_text = <bio> show_price = <show_price> price_text = <price_text>}}
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
	CreateScreenElement {
		type = SpriteElement
		parent = <id>
		alpha = 0
		pos = (0.0, 0.0)
		pos_anchor = [center center]
		z_priority = 200
	}
	return item_container_id = <id>
endscript

script CAR_skull_anim 
endscript

script character_selection_flame_blink 
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	begin
	if ScreenElementExists \{id = character_selection}
		character_selection :SE_SetProps \{character_selection_flame_scale = 1.2
			time = 0.15
			Anim = gentle}
	else
		return
	endif
	Wait \{0.25
		seconds}
	if ScreenElementExists \{id = character_selection}
		character_selection :SE_SetProps \{character_selection_flame_scale = 0.8
			time = 0.4
			Anim = gentle}
	else
		return
	endif
	Wait \{0.45000002
		seconds}
	repeat
endscript

script character_selection_focus 
	<id> :SE_SetProps scale = 1.4499999
	<id> :SE_SetProps character_selection_item_icon_pos = {relative (-10.0, -5.0)}
	<id> :SE_SetProps character_selection_item_icon_alpha = 1.0
	<id> :SE_SetProps character_selection_item_icon_rot_angle = 0.0
	if GetScreenElementChildren id = <id>
		SetScreenElementProps id = (<children> [1]) pos = {relative (-10.0, -5.0)}
		SetScreenElementProps id = (<children> [1]) alpha = 1
	endif
	if ScreenElementExists \{id = character_selection}
		character_selection :SE_SetProps character_selection_name_text = <name>
		character_selection :SE_SetProps \{character_selection_bio_text = qs("")}
		character_selection :SE_SetProps \{character_selection_bio_dims = (310.0, 0.0)}
		character_selection :SE_SetProps character_selection_bio_text = <bio_text>
		printf \{qs("\L*")}
		printf \{qs("\L*")}
		printf \{qs("\L*")}
		printf \{qs("\L*")}
		if GotParam \{show_price}
			character_selection :SE_SetProps \{character_selection_price_alpha = 1.0}
			character_selection :SE_SetProps character_selection_price_text_text = <price_text>
		else
			character_selection :SE_SetProps \{character_selection_price_alpha = 0.0}
		endif
	endif
	spawnscriptnow \{character_selection_animate_bio
		params = {
			id = character_selection
		}}
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script character_selection_unfocus 
	<id> :SE_SetProps scale = 1.0
	<id> :SE_SetProps character_selection_item_icon_pos = {relative (10.0, 5.0)}
	<id> :SE_SetProps character_selection_item_icon_alpha = 1.0
	<id> :SE_SetProps character_selection_item_icon_rot_angle = 0.0
	if GetScreenElementChildren id = <id>
		SetScreenElementProps id = (<children> [1]) alpha = 0
		SetScreenElementProps id = (<children> [1]) pos = {relative (10.0, 5.0)}
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
	if ScriptIsRunning \{character_selection_animate_bio}
		KillSpawnedScript \{name = character_selection_animate_bio}
	endif
endscript

script character_selection_animate_bio 
	if NOT ScreenElementExists id = <id>
		return
	endif
	if <id> :Desc_ResolveAlias name = alias_character_selection_bio param = character_selection_bio
		GetScreenElementDims id = <character_selection_bio>
	else
		ScriptAssert \{qs("\Lcharacter_selection_animate_bio was unable to create character_selection_bio alias")}
	endif
	if ScreenElementExists id = <id>
		<id> :SE_SetProps character_selection_bio_pos = (0.0, 0.0)
	else
		return
	endif
	printf qs("\Lheight = %h") h = <Height> channel = bio_debug
	if (<Height> > 370)
		time = ((<Height> -360.0) * 0.05)
		offset = ((360.0 - <Height>) * (0.0, 1.0))
		Wait \{5
			seconds}
		begin
		if ScreenElementExists id = <id>
			<id> :SE_SetProps character_selection_bio_pos = {relative <offset>} time = <time>
		else
			return
		endif
		Wait (<time> + 5) seconds
		offset = (-1 * <offset>)
		if ScreenElementExists id = <id>
			<id> :SE_SetProps character_selection_bio_pos = {relative <offset>} time = <time>
		else
			return
		endif
		Wait (<time> + 5) seconds
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
	FormatText TextName = price_text qs("\L$%p") p = <price>
	CreateScreenElement {
		type = DescInterface
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
	if character_purchase :Desc_ResolveAlias \{name = alias_character_purchase_menu
			param = character_purchase_vmenu}
		AssignAlias id = <character_purchase_vmenu> alias = character_purchase_menu
	else
		ScriptAssert \{qs("\Lcharacter_purchase was unable to create character_purchase_menu alias")}
	endif
	if character_purchase :Desc_ResolveAlias \{name = alias_character_purchase_menu_yes
			param = character_purchase_yes}
		SetScreenElementProps {
			id = <character_purchase_yes>
			event_handlers = [
				{focus character_purchase_focus params = {item = Yes}}
				{unfocus character_purchase_unfocus params = {item = Yes}}
				{pad_choose purchase_character params = {price = <price> pad_choose_script = <choose_yes_script> pad_choose_params = <choose_yes_params>}}
				{pad_back generic_event_back}
			]
		}
	else
		ScriptAssert \{qs("\Lcharacter_purchase was unable to create 'yes' alias")}
	endif
	if character_purchase :Desc_ResolveAlias \{name = alias_character_purchase_menu_no
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
		ScriptAssert \{qs("\Lcharacter_purchase was unable to create 'no' alias")}
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
		if character_purchase :Desc_ResolveAlias \{name = alias_highlight}
			Wait \{2
				gameframes}
			GetScreenElementChildren id = <ObjID>
			GetScreenElementProps id = (<children> [0])
			dims = (((2.5, 0.0) * <dims>.(1.0, 0.0) * <scale>.(1.0, 0.0)) + ((0.0, 1.0) * <dims>.(0.0, 1.0) * <scale>.(0.0, 1.0)))
			offset = ((0.0, 1.0) * (<dims>.(0.0, 1.0) / 2))
			scale = (((1.0, 0.0) * (((<dims>.(1.0, 0.0) + 50.0) / 256.0))) + (0.0, 1.6))
			GetScreenElementPosition id = (<children> [0]) summed
			<resolved_id> :SE_SetProps pos = {absolute (<screenelementpos> + <offset>)} scale = <scale>
			<resolved_id> :SE_WaitProps
			GetScreenElementPosition id = (<children> [0]) summed
			<resolved_id> :SE_SetProps pos = {absolute (<screenelementpos> + <offset> + (-10.0, 0.0))} time = 0.05
			<resolved_id> :SE_WaitProps
			GetScreenElementPosition id = (<children> [0]) summed
			<resolved_id> :SE_SetProps pos = {absolute (<screenelementpos> + <offset>)} scale = <scale> time = 0.05
			<resolved_id> :SE_WaitProps
		endif
	endif
endscript

script character_purchase_unfocus 
endscript

script purchase_character 
	RequireParams \{[
			price
		]
		all}
	get_savegame_from_controller controller = ($primary_controller)
	if has_enough_money price = <price> savegame = <savegame>
		SoundEvent \{event = Menu_Purchase_Item}
		decrease_band_money price = <price> savegame = <savegame>
		<pad_choose_script> <pad_choose_params>
	else
		character_purchase :SE_SetProps \{character_purchase_dialogue_text = qs("You do not have enough money.")
			character_purchase_menu_yes_text = qs("Continue")}
		if character_purchase :Desc_ResolveAlias \{name = alias_character_purchase_menu_no
				param = character_purchase_no}
			SetScreenElementProps {
				id = <character_purchase_no>
				alpha = 0
				not_focusable
				dims = (0.0, 0.0)
			}
		endif
		if character_purchase :Desc_ResolveAlias \{name = alias_character_purchase_menu_yes
				param = character_purchase_yes}
			SetScreenElementProps {
				id = <character_purchase_yes>
				event_handlers = [
					{pad_choose generic_event_back}
				]
				replace_handlers
			}
			LaunchEvent type = focus target = <character_purchase_yes>
		endif
	endif
endscript
