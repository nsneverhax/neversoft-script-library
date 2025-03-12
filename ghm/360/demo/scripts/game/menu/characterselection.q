
script make_character_selection_menu {
		pad_back_sound = ui_menu_select_sfx
		pad_back_script = generic_event_back_block
		exclusive_device = ($primary_controller)
	}
	destroy_character_selection_menu
	if gotparam \{use_all_controllers}
		removeparameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	if NOT (($menu_over_ride_exclusive_device) = -1)
		exclusive_device = ($menu_over_ride_exclusive_device)
	endif
	createscreenelement {
		type = descinterface
		parent = root_window
		desc = 'character_selection'
		id = character_selection
		exclusive_device = <exclusive_device>
	}
	if character_selection :desc_resolvealias \{name = alias_character_selection_vmenu
			param = character_selection_vmenu}
		assignalias id = <character_selection_vmenu> alias = current_menu
		if gotparam \{vmenu_id}
			assignalias id = <character_selection_vmenu> alias = <vmenu_id>
		endif
	else
		scriptassert \{qs(0x24d86c05)}
	endif
	if character_selection :desc_resolvealias \{name = alias_character_selection_smenu
			param = character_selection_smenu}
		setscreenelementprops id = <character_selection_smenu> top_selection = true
	else
		scriptassert \{qs(0x24d86c05)}
	endif
	if character_selection :desc_resolvealias \{name = alias_character_selection_window
			param = character_selection_window}
		setscreenelementprops id = <character_selection_window> allow_child_rotate = true
	else
		scriptassert \{qs(0x662db52a)}
	endif
	if NOT cd
		setscreenelementprops \{id = current_menu
			event_handlers = [
				{
					pad_alt2
					cas_toggle_free_cam
				}
			]}
	endif
	setscreenelementprops \{id = current_menu
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
	if gotparam \{pad_down_script}
		setscreenelementprops {
			id = current_menu
			event_handlers = [
				{pad_down <pad_down_script> params = <pad_down_params>}
			]
		}
	endif
	if gotparam \{pad_up_script}
		setscreenelementprops {
			id = current_menu
			event_handlers = [
				{pad_up <pad_up_script> params = <pad_up_params>}
			]
		}
	endif
	if gotparam \{pad_option2_script}
		setscreenelementprops {
			id = current_menu
			event_handlers = [
				{pad_option2 <pad_back_sound>}
				{pad_option2 generic_blocking_execute_script params = {pad_script = <pad_option2_script> pad_params = {container_id = <id> <pad_option2_params>}}}
			]
		}
	endif
	if gotparam \{pad_option_script}
		setscreenelementprops {
			id = current_menu
			event_handlers = [
				{pad_option <pad_back_sound>}
				{pad_option generic_blocking_execute_script params = {pad_script = <pad_option_script> pad_params = {container_id = <id> <pad_option_params>}}}
			]
		}
	endif
	if gotparam \{pad_back_script}
		setscreenelementprops {
			id = current_menu
			event_handlers = [
				{pad_back <pad_back_sound>}
				{pad_back generic_blocking_execute_script params = {pad_script = <pad_back_script> pad_params = {container_id = <id> <pad_back_params>}}}
			]
			replace_handlers
		}
	endif
	character_selection :obj_spawnscriptnow \{car_skull_anim}
endscript

script destroy_character_selection_menu 
	if screenelementexists \{id = character_selection}
		destroyscreenelement \{id = character_selection}
	endif
	cleanup_cas_menu_handlers
	killspawnedscript \{name = car_skull_anim}
	destroy_viewport_ui
	clean_up_user_control_helpers
endscript

script add_character_selection_item \{focus_script = character_selection_focus
		unfocus_script = character_selection_unfocus
		pad_choose_sound = ui_menu_select_sfx
		parent = current_menu}
	random_rot_angle = RandomFloat (-7.0, 7.0)
	<price_text> = qs(0x03ac90f0)
	if gotparam \{price}
		formattext textname = price_text qs(0xe5814737) p = <price>
		show_price = 1
	endif
	if screenelementexists id = <parent>
		createscreenelement {
			type = descinterface
			parent = <parent>
			desc = 'character_selection_item'
			dims = (64.0, 67.0)
			character_selection_item_icon_icon_texture = <icon>
			character_selection_item_icon_rot_angle = <random_rot_angle>
		}
	else
		scriptassert \{qs(0x59e04136)}
	endif
	if gotparam \{choose_state}
		pad_choose_script = ui_event_block
		pad_choose_params = {event = menu_change data = {state = <choose_state> <choose_state_data> container_id = <id>}}
	endif
	if gotparam \{choose_back}
		pad_choose_script = generic_event_back_block
	endif
	setscreenelementprops {
		id = <id>
		event_handlers = [
			{focus <focus_script> params = {id = <id> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params> name = <name> bio_text = <bio> show_price = <show_price> price_text = <price_text>}}
			{unfocus <unfocus_script> params = {id = <id> additional_unfocus_script = <additional_unfocus_script> additional_unfocus_params = <additional_unfocus_params> show_price = <show_price>}}
		]
	}
	if gotparam \{pad_choose_script}
		if NOT (<pad_choose_script> = nullscript)
			setscreenelementprops {
				id = <id>
				event_handlers = [
					{pad_choose <pad_choose_sound>}
					{pad_choose generic_blocking_execute_script params = {pad_script = <pad_choose_script> pad_params = {container_id = <id> <pad_choose_params>}}}
				]
			}
		endif
	endif
	if gotparam \{pad_square_script}
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_square <pad_choose_sound>}
				{pad_square generic_blocking_execute_script params = {pad_script = <pad_square_script> pad_params = {container_id = <id> <pad_square_params>}}}
			]
		}
	endif
	if gotparam \{pad_start_script}
		setscreenelementprops {
			id = <id>
			event_handlers = [
				{pad_start <pad_choose_sound>}
				{pad_start generic_blocking_execute_script params = {pad_script = <pad_start_script> pad_params = {container_id = <id> <pad_start_params>}}}
			]
		}
	endif
	if gotparam \{not_focusable}
		setscreenelementprops {id = <id> not_focusable}
	endif
	createscreenelement {
		type = spriteelement
		parent = <id>
		alpha = 0
		pos = (0.0, 0.0)
		pos_anchor = [center center]
		z_priority = 200
	}
	return item_container_id = <id>
endscript

script car_skull_anim 
	se_getprops \{car_skull_pupil_pos}
	<org_pos> = <car_skull_pupil_pos>
	wait \{1
		seconds}
	begin
	r = Random (@ 1.1 @ -2 @ 2 @ -0.2 @ -3 )
	<time> = Random (@ 0.02 @ 0.01 @ 0.03 )
	se_setprops \{car_skull_pupil_scale = (1.0, 1.0)}
	se_waitprops
	se_setprops car_skull_pupil_pos = (<org_pos> + ((5.0, -1.0) * <r>)) time = <time> motion = Random (@ ease_in @ ease_out )
	se_waitprops
	wait \{1
		seconds}
	se_setprops \{car_skull_pupil_scale = (1.2, 1.2)}
	se_waitprops
	se_setprops car_skull_pupil_pos = <org_pos> time = 0.05 motion = ease_in
	se_setprops \{car_skull_pupil_scale = (1.0, 1.0)
		time = 0.05
		motion = linear}
	se_waitprops
	wait \{0.5
		seconds}
	se_waitprops
	se_setprops car_skull_pupil_pos = (<org_pos> + ((-2.0, 3.0) * <r>)) time = <time> motion = Random (@ ease_in @ ease_out )
	se_waitprops
	se_setprops car_skull_pupil_pos = (<org_pos> + ((-2.0, -4.0) * <r>)) time = <time> motion = Random (@ ease_in @ ease_out )
	se_waitprops
	wait \{0.5
		seconds}
	se_setprops car_skull_pupil_pos = (<org_pos> + ((3.0, 4.0) * <r>)) time = <time> motion = Random (@ ease_in @ ease_out )
	se_waitprops
	wait \{0.2
		seconds}
	repeat
endscript

script character_selection_flame_blink 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	begin
	if screenelementexists \{id = character_selection}
		character_selection :se_setprops \{character_selection_flame_scale = 1.2
			time = 0.15
			anim = gentle}
	else
		return
	endif
	wait \{0.25
		seconds}
	if screenelementexists \{id = character_selection}
		character_selection :se_setprops \{character_selection_flame_scale = 0.8
			time = 0.4
			anim = gentle}
	else
		return
	endif
	wait \{0.45000002
		seconds}
	repeat
endscript

script character_selection_focus 
	<id> :se_setprops scale = 1.4499999
	<id> :se_setprops character_selection_item_icon_pos = {relative (-10.0, -5.0)}
	<id> :se_setprops character_selection_item_icon_alpha = 1.0
	<id> :se_setprops character_selection_item_icon_rot_angle = 0.0
	if getscreenelementchildren id = <id>
		setscreenelementprops id = (<children> [1]) pos = {relative (-10.0, -5.0)}
		setscreenelementprops id = (<children> [1]) alpha = 1
	endif
	if screenelementexists \{id = character_selection}
		character_selection :se_setprops character_selection_name_text = <name>
		character_selection :se_setprops \{character_selection_bio_text = qs(0x00000000)}
		character_selection :se_setprops \{character_selection_bio_dims = (310.0, 400.0)}
		character_selection :se_setprops character_selection_bio_text = <bio_text>
		printf \{qs(0x8bd8bd7d)}
		printf \{qs(0x8bd8bd7d)}
		printf \{qs(0x8bd8bd7d)}
		printf \{qs(0x8bd8bd7d)}
		if gotparam \{show_price}
			character_selection :se_setprops \{character_selection_price_alpha = 1.0}
			character_selection :se_setprops character_selection_price_text_text = <price_text>
		else
			character_selection :se_setprops \{character_selection_price_alpha = 0.0}
		endif
	endif
	spawnscriptnow \{character_selection_animate_bio
		params = {
			id = character_selection
		}}
	if gotparam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script character_selection_unfocus 
	<id> :se_setprops scale = 1.0
	<id> :se_setprops character_selection_item_icon_pos = {relative (10.0, 5.0)}
	<id> :se_setprops character_selection_item_icon_alpha = 1.0
	random_rot_angle = RandomFloat (-7.0, 7.0)
	<id> :se_setprops character_selection_item_icon_rot_angle = <random_rot_angle>
	if getscreenelementchildren id = <id>
		setscreenelementprops id = (<children> [1]) alpha = 0
		setscreenelementprops id = (<children> [1]) pos = {relative (10.0, 5.0)}
	endif
	if gotparam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
	if scriptisrunning \{character_selection_animate_bio}
		killspawnedscript \{name = character_selection_animate_bio}
	endif
endscript

script character_selection_animate_bio 
	if NOT screenelementexists id = <id>
		return
	endif
	if <id> :desc_resolvealias name = alias_character_selection_bio param = character_selection_bio
		getscreenelementdims id = <character_selection_bio>
	else
		scriptassert \{qs(0x938c920d)}
	endif
	if screenelementexists id = <id>
		<id> :se_setprops character_selection_bio_pos = (0.0, 0.0)
	else
		return
	endif
	printf qs(0x0ca45994) h = <height> channel = bio_debug
	if (<height> > 400)
		time = ((<height> -400.0) * 0.05)
		offset = ((400.0 - <height>) * (0.0, 1.0))
		wait \{5
			seconds}
		begin
		if screenelementexists id = <id>
			<id> :se_setprops character_selection_bio_pos = {relative <offset>} time = <time>
		else
			return
		endif
		wait (<time> + 5) seconds
		offset = (-1 * <offset>)
		if screenelementexists id = <id>
			<id> :se_setprops character_selection_bio_pos = {relative <offset>} time = <time>
		else
			return
		endif
		wait (<time> + 5) seconds
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
	if gotparam \{use_all_controllers}
		removeparameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	if NOT (($menu_over_ride_exclusive_device) = -1)
		exclusive_device = ($menu_over_ride_exclusive_device)
	endif
	formattext textname = price_text qs(0xe5814737) p = <price>
	createscreenelement {
		type = descinterface
		parent = root_window
		desc = 'character_purchase_menu'
		id = character_purchase
		exclusive_device = <exclusive_device>
		z_priority = 300
		character_purchase_price_text_text = <price_text>
	}
	character_purchase :obj_spawnscriptnow \{highlight_motion
		params = {
			menu_id = character_purchase
		}}
	if character_purchase :desc_resolvealias \{name = alias_character_purchase_menu
			param = character_purchase_vmenu}
		assignalias id = <character_purchase_vmenu> alias = character_purchase_menu
	else
		scriptassert \{qs(0x688f2614)}
	endif
	if character_purchase :desc_resolvealias \{name = alias_character_purchase_menu_yes
			param = character_purchase_yes}
		setscreenelementprops {
			id = <character_purchase_yes>
			event_handlers = [
				{focus character_purchase_focus params = {item = yes}}
				{unfocus character_purchase_unfocus params = {item = yes}}
				{pad_choose purchase_character params = {price = <price> pad_choose_script = <choose_yes_script> pad_choose_params = <choose_yes_params>}}
				{pad_back generic_event_back}
			]
		}
	else
		scriptassert \{qs(0xc852b77e)}
	endif
	if character_purchase :desc_resolvealias \{name = alias_character_purchase_menu_no
			param = character_purchase_no}
		setscreenelementprops {
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
		scriptassert \{qs(0xf53f1bb8)}
	endif
endscript

script destroy_character_purchase_menu 
	if screenelementexists \{id = character_purchase}
		destroyscreenelement \{id = character_purchase}
	endif
	cleanup_cas_menu_handlers
	destroy_viewport_ui
	clean_up_user_control_helpers
endscript

script character_purchase_focus 
	if screenelementexists \{id = character_purchase}
		if (<item> = no)
			generic_menu_up_or_down_sound \{up = 1}
		else
			generic_menu_up_or_down_sound \{down = 2}
		endif
		obj_getid
		gettags
		if character_purchase :desc_resolvealias \{name = alias_highlight}
			wait \{2
				gameframes}
			getscreenelementchildren id = <objid>
			getscreenelementprops id = (<children> [0])
			dims = (((2.5, 0.0) * <dims>.(1.0, 0.0) * <scale>.(1.0, 0.0)) + ((0.0, 1.0) * <dims>.(0.0, 1.0) * <scale>.(0.0, 1.0)))
			offset = ((0.0, 1.0) * (<dims>.(0.0, 1.0) / 2))
			scale = (((1.0, 0.0) * (((<dims>.(1.0, 0.0) + 50.0) / 256.0))) + (0.0, 1.6))
			getscreenelementposition id = (<children> [0]) summed
			<resolved_id> :se_setprops pos = {absolute (<screenelementpos> + <offset>)} scale = <scale>
			<resolved_id> :se_waitprops
			getscreenelementposition id = (<children> [0]) summed
			<resolved_id> :se_setprops pos = {absolute (<screenelementpos> + <offset> + (-10.0, 0.0))} time = 0.05
			<resolved_id> :se_waitprops
			getscreenelementposition id = (<children> [0]) summed
			<resolved_id> :se_setprops pos = {absolute (<screenelementpos> + <offset>)} scale = <scale> time = 0.05
			<resolved_id> :se_waitprops
		endif
	endif
endscript

script character_purchase_unfocus 
endscript

script purchase_character 
	requireparams \{[
			price
		]
		all}
	get_savegame_from_controller controller = ($primary_controller)
	if has_enough_money price = <price> savegame = <savegame>
		soundevent \{event = menu_purchase_item}
		decrease_band_money price = <price> savegame = <savegame>
		<pad_choose_script> <pad_choose_params>
	else
		character_purchase :se_setprops \{character_purchase_dialogue_text = qs(0x6fe705b1)
			character_purchase_menu_yes_text = qs(0x494b4d7f)}
		if character_purchase :desc_resolvealias \{name = alias_character_purchase_menu_no
				param = character_purchase_no}
			setscreenelementprops {
				id = <character_purchase_no>
				alpha = 0
				not_focusable
				dims = (0.0, 0.0)
			}
		endif
		if character_purchase :desc_resolvealias \{name = alias_character_purchase_menu_yes
				param = character_purchase_yes}
			setscreenelementprops {
				id = <character_purchase_yes>
				event_handlers = [
					{pad_choose generic_event_back}
				]
				replace_handlers
			}
			launchevent type = focus target = <character_purchase_yes>
		endif
	endif
endscript
