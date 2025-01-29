
script make_character_selection_menu {
		pad_back_sound = ui_sfx
		pad_back_sound_menustate = car
		pad_back_sound_uitype = select
		pad_back_script = generic_event_back_block
		exclusive_device = ($primary_controller)
	}
	destroy_character_selection_menu
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		desc = 'character_selection'
		id = character_selection
		exclusive_device = <exclusive_device>
	}
	character_selection_menu_animation
	if character_selection :desc_resolvealias \{Name = alias_character_selection_barrel_cont}
		make_generic_barrel_menu {
			parent = <resolved_id>
			Scale = 0.7
			highlight_bar_scale = (0.6, 1.0)
			pad_back_script = <pad_back_script>
			pad_back_params = <pad_back_params>
		}
		AssignAlias id = <vmenu_id> alias = current_menu
		if GotParam \{vmenu_alias}
			AssignAlias id = <vmenu_id> alias = <vmenu_alias>
		endif
	else
		ScriptAssert \{qs(0x6f360b4a)}
	endif
	if character_selection :desc_resolvealias \{Name = alias_character_selection_window
			param = character_selection_window}
		SetScreenElementProps id = <character_selection_window> allow_child_rotate = true
		AssignAlias id = <character_selection_window> alias = character_selection_bio_window
	else
		ScriptAssert \{qs(0x662db52a)}
	endif
endscript

script character_selection_menu_animation 
	if character_selection :desc_resolvealias \{Name = alias_mainmenu_fx_reflection01
			param = instrument_add_id}
		<instrument_add_id> :obj_spawnscript ui_flicker1
	else
		ScriptAssert \{'wwu_flicker_CS1'}
	endif
	if character_selection :desc_resolvealias \{Name = alias_mainmenu_fx_reflection02
			param = instrument_add_id}
		<instrument_add_id> :obj_spawnscript ui_flicker2
	else
		ScriptAssert \{'wwu_flicker_CS2'}
	endif
	if character_selection :desc_resolvealias \{Name = alias_mainmenu_fx_reflection04
			param = instrument_add_id}
		<instrument_add_id> :obj_spawnscript ui_flicker3
	else
		ScriptAssert \{'wwu_flicker_CS3'}
	endif
	if character_selection :desc_resolvealias \{Name = alias_mainmenu_fx_reflection05
			param = instrument_add_id}
		<instrument_add_id> :obj_spawnscript ui_flicker4
	else
		ScriptAssert \{'wwu_flicker_CS4'}
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

script add_character_selection_item \{pad_choose_sound = ui_sfx
		pad_select_sound_menustate = car
		pad_select_sound_uitype = select
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
		ScriptAssert \{qs(0x59e04136)}
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
			menurow_just = [center center]
			menurow_internal_just = [center center]
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
			menurow_just = [center center]
			menurow_internal_just = [center center]
		}
	endif
	return item_container_id = <item_container_id> selection_item_id = <id>
endscript

script character_selection_focus 
	<id> :se_setprops character_selection_item_text_alpha = 1.0
	<id> :se_setprops character_selection_item_bio_pos = (0.0, 0.0)
	<id> :Obj_SpawnScriptNow character_selection_animate_bio_text
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script character_selection_unfocus 
	<id> :se_setprops character_selection_item_text_alpha = 0.0
	<id> :Obj_KillSpawnedScript Name = character_selection_animate_bio_text
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> <additional_unfocus_params>
	endif
endscript

script character_selection_animate_bio_text 
	Obj_GetID
	if <objID> :desc_resolvealias Name = alias_character_selection_item_window param = bio_window
		GetScreenElementDims id = <bio_window>
		<window_height> = <height>
		if <objID> :desc_resolvealias Name = alias_character_selection_item_bio param = bio_text
			GetScreenElementDims id = <bio_text>
			<extra_height> = (<height> - <window_height>)
			if (<extra_height> <= 0)
				return
			endif
			begin
			Wait \{1
				Seconds}
			begin
			<bio_text> :se_getprops Pos
			if ((<Pos>.(0.0, 1.0)) < (<extra_height> * -1))
				break
			endif
			<objID> :se_setprops character_selection_item_bio_pos = (<Pos> - (0.0, 1.0)) time = 0.02 anim = gentle
			<objID> :se_waitprops
			Wait \{1
				gameframe}
			repeat
			Wait \{1
				Seconds}
			begin
			<bio_text> :se_getprops Pos
			if ((<Pos>.(0.0, 1.0)) >= 0)
				break
			endif
			<objID> :se_setprops character_selection_item_bio_pos = (<Pos> + (0.0, 1.0)) time = 0.02 anim = gentle
			<objID> :se_waitprops
			Wait \{1
				gameframe}
			repeat
			repeat
		endif
	endif
endscript
