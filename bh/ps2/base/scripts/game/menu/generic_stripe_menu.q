
script 0x5e1a3a04 {
		pad_back_script = generic_event_back
		exclusive_device = ($primary_controller)
	}
	set_focus_color
	set_unfocus_color
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
	else
		add_gamertag_helper exclusive_device = <exclusive_device>
	endif
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		id = current_menu_anchor
		desc = 'generic_stripe_menu'
		just = [center center]
		exclusive_device = <exclusive_device>
	}
	<0xc0e4ef67> = <id>
	if <0xc0e4ef67> :desc_resolvealias Name = alias_menu
		AssignAlias id = <resolved_id> alias = current_menu
	else

	endif
	if NOT <0xc0e4ef67> :desc_resolvealias Name = 0x035b354d param = 0x67b68786

	endif
	if NOT <0xc0e4ef67> :desc_resolvealias Name = 0xf334fdea param = 0x6b7cf884

	endif
	if NOT <0xc0e4ef67> :desc_resolvealias Name = 0x5236112a param = 0x6518488b

	endif
	if GotParam \{title}
		<0xc0e4ef67> :se_setprops menu_title = <title>
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = 0x80ac0b16
		parent = <id>
		rgba = [255 255 255 255]
		Pos = (640.0, 360.0)
		just = [center center]
		dims = (1280.0, 720.0)
		z_priority = 9.0
		texture = song_summary_bg
	}
	if GotParam \{option_arrows}
		current_menu :SetTags \{smooth_morph_time = 0.1}
		current_menu :se_setprops {
			event_handlers = [
				{pad_up 0x8b8c56fa params = {arrow_id = <0x6b7cf884> up}}
				{pad_up smoothmenuscroll params = {Dir = -1 isvertical = true}}
				{pad_down 0x8b8c56fa params = {arrow_id = <0x6518488b> down}}
				{pad_down smoothmenuscroll params = {Dir = 1 isvertical = true}}
				{pad_back <pad_back_script> params = <pad_back_params>}
			]
			loop_view = true
			loop_center = true
		}
	else
		SetScreenElementProps {id = <0x6b7cf884> alpha = 0.0}
		SetScreenElementProps {id = <0x6518488b> alpha = 0.0}
		GetScreenElementDims id = <0x67b68786>
		dims = ((<width> * (1.0, 0.0)) + (0.0, 512.0))
		SetScreenElementProps {id = <0x67b68786> dims = <dims>}
		current_menu :se_setprops {
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
				{pad_back <pad_back_script> params = <pad_back_params>}
			]
		}
	endif
	return \{window_id = current_menu_anchor
		desc_id = current_menu_anchor}
endscript

script 0x9d0992fe {
		parent = current_menu
		focus_rgba = ($menu_focus_color)
		unfocus_rgba = ($menu_unfocus_color)
		0xfdfdc7a4 = [64 64 64 255]
	}

	if GotParam \{0x6d96b274}
		just = [left center]
	else
		just = [right center]
	endif
	0x1a689a56 = FALSE
	if GotParam \{0x656de5f8}
		0x1a689a56 = true
	elseif GotParam \{overlay_texture}
		0x1a689a56 = true
	elseif GotParam \{texture}
		0x1a689a56 = true
	elseif GotParam \{background_texture}
		0x1a689a56 = true
	endif
	if GotParam \{0xc1f386b6}
		0x1a689a56 = true
		overlay_texture = Options_Controller_Check
		texture = Options_Controller_X
	endif
	if (<0x1a689a56> = true)
		if GotParam \{0x6d96b274}
			desc = 'menurow_ico_txt_desc'
		else
			desc = 'menurow_txt_ico_desc'
		endif
		CreateScreenElement {
			Type = descinterface
			parent = <parent>
			desc = <desc>
			autosizedims = true
			menurow_just = <just>
			menurow_internal_just = <just>
			menurow_txt_item_text = <text>
			menurow_txt_item_font = fontgrid_title_a1
			menurow_txt_item_rgba = <unfocus_rgba>
		}
		if GotParam \{overlay_texture}
			<id> :se_setprops {0x119b297a = <overlay_texture>}
		else
			<id> :se_setprops {0xba238713 = 0.0}
		endif
		if GotParam \{texture}
			<id> :se_setprops {menurow_ico_item_texture = <texture>}
		else
			<id> :se_setprops {0xc1d5f75c = 0.0}
		endif
		if GotParam \{background_texture}
			<id> :se_setprops {0x199bfdea = <background_texture>}
		else
			<id> :se_setprops {0x8e7a2106 = 0.0}
		endif
	else
		CreateScreenElement {
			Type = descinterface
			parent = <parent>
			desc = 'menurow_txt_desc'
			autosizedims = true
			menurow_just = <just>
			menurow_internal_just = <just>
			menurow_txt_item_text = <text>
			menurow_txt_item_font = fontgrid_title_a1
			menurow_txt_item_rgba = <unfocus_rgba>
		}
	endif
	if GotParam \{blank_entry}
		<id> :se_setprops {
			not_focusable
		}
	elseif GotParam \{not_focusable}
		<id> :se_setprops {
			not_focusable
			menurow_txt_item_rgba = <0xfdfdc7a4>
		}
	else
		if GotParam \{helper_text}
			<id> :se_setprops 0x3f37531d = <helper_text>
		endif
		array = []
		if GotParam \{additional_focus_script}
			AddArrayElement array = <array> element = {
				focus
				0xf0f98915
				params = {
					focus_rgba = <focus_rgba>
					additional_focus_script = <additional_focus_script>
					additional_focus_params = <additional_focus_params>
				}
			}
		else
			AddArrayElement array = <array> element = {
				focus
				0xf0f98915
				params = {focus_rgba = <focus_rgba>}
			}
		endif
		if GotParam \{additional_unfocus_script}
			AddArrayElement array = <array> element = {
				unfocus
				0x4e9d4e51
				params = {
					unfocus_rgba = <unfocus_rgba>
					additional_unfocus_script = <additional_unfocus_script>
					additional_unfocus_params = <additional_unfocus_params>
				}
			}
		else
			AddArrayElement array = <array> element = {
				unfocus
				0x4e9d4e51
				params = {unfocus_rgba = <unfocus_rgba>}
			}
		endif
		if NOT (GotParam 0xc1f386b6)
			if (GotParam pad_choose_sound)
				AddArrayElement array = <array> element = {pad_choose <pad_choose_sound>}
			else
				AddArrayElement array = <array> element = {pad_choose generic_menu_pad_choose_sound}
			endif
		endif
		if GotParam \{choose_state}
			AddArrayElement array = <array> element = {
				pad_choose
				generic_event_choose
				params = {state = <choose_state> data = {<choose_state_data>}}
			}
		elseif GotParam \{pad_choose_script}
			AddArrayElement array = <array> element = {
				pad_choose
				<pad_choose_script>
				params = <pad_choose_params>
			}
		endif
		if GotParam \{back_state}
			AddArrayElement array = <array> element = {
				pad_back generic_event_back params = {state = <back_state>}
			}
		elseif GotParam \{pad_back_script}
			AddArrayElement array = <array> element = {pad_back <pad_back_script>}
		endif
		<id> :se_setprops event_handlers = <array>
	endif
	return item_container_id = <id> item_id = <id>
endscript

script 0xf0f98915 time = 0.05 grow_scale = 1.5 {
		focus_rgba = ($menu_focus_color)
	}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :GetTags
	if GotParam \{helper_text}
		<id> :se_setprops 0x3f37531d = <helper_text>
	endif
	<id> :se_setprops {
		menurow_scale = <grow_scale>
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = <focus_rgba>
		motion = ease_in
		time = <time>
	}
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script 0x4e9d4e51 time = 0.05 {
		unfocus_rgba = ($menu_unfocus_color)
	}
	if NOT GotParam \{id}
		Obj_GetID
		<id> = <objID>
	endif
	<id> :se_setprops {
		menurow_scale = 1.0
		menurow_txt_item_font = fontgrid_title_a1
		menurow_txt_item_rgba = <unfocus_rgba>
		motion = ease_in
		time = <time>
	}
	if GotParam \{additional_unfocus_script}
		<additional_unfocus_script> <additional_unfocus_params>
	endif
endscript

script 0x8b8c56fa 

	if GotParam \{down}
		generic_menu_up_or_down_sound \{down}
		<arrow_id> :obj_spawnscript 0x81ae5138
		<arrow_id> :obj_spawnscript 0xf4207007 params = {down}
	else
		generic_menu_up_or_down_sound \{up}
		<arrow_id> :obj_spawnscript 0x81ae5138
		<arrow_id> :obj_spawnscript 0xf4207007
	endif
endscript

script 0xf4207007 
	Obj_GetID
	<objID> :se_setprops hiddenlocal = true
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = dropdown_arrow
		dims = (40.0, 40.0)
		Pos = (20.0, 15.0)
		just = [center center]
		rgba = [225 , 225 , 225 , 200]
		z_priority = 112
	}
	if GotParam \{down}
		<id> :se_setprops flip_h
		<id> :se_setprops Pos = {(0.0, 9.0) relative}
	endif
	<id> :se_setprops Scale = 1.3 time = 0.01 relative_scale
	<id> :se_waitprops
	<id> :se_setprops Scale = 1.0 time = 0.1 relative_scale
	<id> :se_waitprops
	<objID> :se_setprops hiddenlocal = FALSE
	DestroyScreenElement id = <id>
endscript

script 0x81ae5138 
	Obj_GetID
	CreateScreenElement {
		Type = SpriteElement
		parent = <objID>
		texture = circle_gradient_64
		dims = (64.0, 64.0)
		Pos = (20.0, 15.0)
		rgba = [255 215 0 255]
		just = [center center]
		z_priority = 100
		alpha = 0.2
		blend = add
	}
	<id> :se_setprops Scale = 1.2 relative_scale
	<id> :se_setprops Scale = (Random (@ 2.0 @ 2.5 @ 3.0 )) alpha = 0.0 time = 0.2 relative_scale motion = ease_out
	<id> :se_waitprops
	DestroyScreenElement id = <id>
endscript
