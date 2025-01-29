g_num_swatch_wedges = 4
g_swatch_rot_angle = 90
g_swatch_wheel_spin_speed = 0.15

script create_swatch_wheel \{focus_script = swatch_wheel_focus
		unfocus_script = swatch_wheel_unfocus
		pad_choose_script = swatch_wheel_back
		Scale = 1
		dims = (550.0, 550.0)}
	SetScreenElementLock \{id = current_menu
		OFF}
	if NOT GotParam \{pad_choose_params}
		<pad_choose_params> = <...>
	endif
	<z_priority> = 100
	CreateScreenElement {
		Type = ContainerElement
		parent = current_menu
		id = swatch_wheel_menu_item
		dims = (<Scale> * <dims>)
		event_handlers = [{focus <focus_script> <focus_params>}
			{unfocus <unfocus_script>}
			{pad_choose swatch_wheel_choose}
		]
		<not_focusable>
		z_priority = <z_priority>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = swatch_wheel_menu_item
		id = swatch_wheel_left_arrow
		texture = wheel_arrow
		Scale = (-1.0, 1.0)
		rot_angle = -90
		Pos = (<Scale> * (50.0, 0.0))
		Scale = ((-1.0, 1.0) * <Scale>)
		rgba = [0 0 0 0]
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = swatch_wheel_menu_item
		id = swatch_wheel_right_arrow
		texture = wheel_arrow
		rot_angle = 90
		Pos = (<Scale> * (500.0, 0.0))
		Scale = <Scale>
		rgba = [0 0 0 0]
	}
	CreateScreenElement {
		Type = ContainerElement
		id = swatch_wheel
		parent = swatch_wheel_menu_item
		not_focusable
		Pos = (0.0, 0.0)
		Scale = <Scale>
	}
	current_wedge = 0
	GetArraySize <part_swatches>
	i = 0
	begin
	thisone = (<part_swatches> [<i>])
	if ((<thisone>.desc_id) = <current_swatch_desc_id>)
		current_wedge = <i>
		break
	endif
	i = (<i> + 1)
	repeat <array_Size>
	swatch_wheel :SetTags {
		current_wedge = <current_wedge>
		part = <part>
		part_swatches = <part_swatches>
		pad_choose_script = <pad_choose_script>
		pad_choose_params = <pad_choose_params>
		special_exit_script = <special_exit_script>
		special_exit_params = <special_exit_params>
		special_choose_script = <special_choose_script>
		special_choose_params = <special_choose_params>
	}
	current_menu :se_getparentid
	CreateScreenElement {
		parent = <parent_id>
		id = swatch_area_desc_id
		Type = descinterface
		desc = 'swatch_area'
		z_priority = <z_priority>
		Pos = (-120.0, -90.0)
		Scale = 0.88
	}
	if <id> :desc_resolvealias Name = swatch_wheel_desc_id
		AssignAlias id = <resolved_id> alias = swatch_wheel_desc_id
	endif
	swatch_update_text part = <part> desc_id = <current_swatch_desc_id>
	swatch_wheel_fix_rotate noWait current_wedge = <current_wedge>
	SetScreenElementLock \{id = current_menu
		On}
	current_menu :GetTags
	if GotParam \{total_length}
		GetScreenElementDims \{id = current_menu}
		parent_height = <height>
		GetScreenElementDims \{id = swatch_wheel}
		total_length = (<total_length> + <height>)
		if (<total_length> > <parent_height>)
			generic_menu :se_setprops \{generic_menu_scrollbar_alpha = 1.0}
		endif
		current_menu :SetTags {total_length = <total_length>}
	else
		GetScreenElementDims \{id = swatch_wheel}
		current_menu :SetTags {total_length = <height>}
	endif
endscript

script swatch_update_text 
	if getactualcasoptionstruct part = <part> desc_id = <desc_id>
		swatch_area_desc_id :se_setprops swatch_name_text = <frontend_desc>
	endif
endscript

script swatch_wheel_focus 
	set_generic_menu_scrollbar_pos \{id = swatch_wheel}
endscript

script swatch_wheel_unfocus 
	swatch_wheel_depress_current_wedge
	swatch_wheel_set_alpha_all alpha = ($color_wheel_step_1_alpha)
endscript

script swatch_wheel_set_all_white 
	<i> = 0
	begin
	formatText checksumName = wedge_rgba_prop 'swatch_section_%i_rgba' i = <i>
	AddParam structure_name = rgba_struct Name = <wedge_rgba_prop> value = [255 255 255 255]
	swatch_wheel_desc_id :se_setprops <rgba_struct>
	<i> = (<i> + 1)
	repeat $g_num_swatch_wedges
endscript

script swatch_wheel_set_textures 

	<i> = 0
	begin
	formatText checksumName = wedge_tex_prop 'swatch_section_%i_texture' i = <i>
	index = <i>
	if (<index> = 1)
		index = 3
	elseif (<index> = 3)
		index = 1
	endif
	AddParam structure_name = tex_struct Name = <wedge_tex_prop> value = (<textures> [<index>])
	swatch_wheel_desc_id :se_setprops <tex_struct>
	<i> = (<i> + 1)
	repeat $g_num_swatch_wedges
endscript

script swatch_wheel_set_alpha_all 

	<i> = 0
	begin
	formatText checksumName = wedge_alpha_prop 'swatch_section_%i_cont_alpha' i = <i>
	AddParam structure_name = alpha_struct Name = <wedge_alpha_prop> value = (<alpha> / 255.0)
	swatch_wheel_desc_id :se_setprops <alpha_struct>
	<i> = (<i> + 1)
	repeat $g_num_swatch_wedges
endscript

script swatch_wheel_set_alpha_wedge 

	swatch_wheel :GetTags
	if (<current_wedge> = 0)
		<i> = 0
	else
		<i> = ($g_num_swatch_wedges - <current_wedge>)
	endif
	formatText checksumName = wedge_alpha_prop 'swatch_section_%i_cont_alpha' i = <i>
	AddParam structure_name = alpha_struct Name = <wedge_alpha_prop> value = (<alpha> / 255.0)
	swatch_wheel_desc_id :se_setprops <alpha_struct>
endscript

script swatch_wheel_depress_current_wedge 
	<i> = 0
	begin
	formatText checksumName = wedge_scale_prop 'swatch_section_%i_cont_scale' i = <i>
	AddParam structure_name = scale_struct Name = <wedge_scale_prop> value = (1.0, 1.0)
	AddParam \{structure_name = scale_struct
		Name = anim
		value = fast_in}
	AddParam structure_name = scale_struct Name = time value = ($g_swatch_wheel_spin_speed)
	swatch_wheel_desc_id :se_setprops <scale_struct>
	<i> = (<i> + 1)
	repeat $g_num_swatch_wedges
endscript

script swatch_wheel_raise_current_wedge 
	swatch_wheel_depress_current_wedge
	swatch_wheel :GetTags
	if (<current_wedge> = 0)
		<i> = 0
	else
		<i> = ($g_num_swatch_wedges - <current_wedge>)
	endif
	formatText checksumName = wedge_scale_prop 'swatch_section_%i_cont_scale' i = <i>
	AddParam structure_name = scale_struct Name = <wedge_scale_prop> value = (($color_wheel_slice_highlight_scale) * (1.0, 1.0))
	AddParam structure_name = scale_struct Name = time value = ($g_swatch_wheel_spin_speed)
	AddParam \{structure_name = scale_struct
		Name = motion
		value = ease_in}
	swatch_wheel_desc_id :se_setprops <scale_struct>
endscript

script swatch_wheel_choose 
	SoundEvent event = ($color_wheel_focus_sound)
	LaunchEvent \{Type = unfocus
		target = current_menu}
	LaunchEvent \{Type = focus
		target = swatch_wheel}
	SetScreenElementProps \{id = swatch_wheel
		event_handlers = [
			{
				pad_choose
				swatch_wheel_fire_select
			}
			{
				pad_back
				swatch_wheel_back
			}
			{
				pad_down
				swatch_wheel_rotate
				params = {
					clockwise = 1
				}
			}
			{
				pad_up
				swatch_wheel_rotate
				params = {
					clockwise = 0
				}
			}
			{
				pad_left
				swatch_wheel_rotate
				params = {
					clockwise = 0
				}
			}
			{
				pad_right
				swatch_wheel_rotate
				params = {
					clockwise = 1
				}
			}
		]
		replace_handlers}
	swatch_wheel_raise_current_wedge
	swatch_wheel_set_alpha_all alpha = ($color_wheel_step_1_alpha)
	swatch_wheel_set_alpha_wedge alpha = ($color_wheel_full_alpha)
	swatch_wheel :GetTags
	if GotParam \{special_choose_script}
		<special_choose_script> <special_choose_params>
	endif
endscript

script swatch_wheel_back 
	SoundEvent event = ($color_wheel_unfocus_sound)
	swatch_wheel :GetTags
	swatch_wheel_reset pad_choose_script = <pad_choose_script> pad_choose_params = <pad_choose_params>
	LaunchEvent \{Type = unfocus
		target = swatch_wheel}
	LaunchEvent \{Type = focus
		target = current_menu}
	if NOT GotParam \{skip_exit_script}
		if GotParam \{special_exit_script}
			<special_exit_script> <special_exit_params>
		endif
	endif
endscript

script swatch_wheel_reset 
	SetScreenElementProps \{id = swatch_wheel
		event_handlers = [
			{
				pad_choose
				swatch_wheel_choose
			}
			{
				pad_left
				nullscript
			}
			{
				pad_right
				nullscript
			}
		]
		replace_handlers}
	swatch_wheel_depress_current_wedge
endscript

script swatch_wheel_rotate 
	setspawnedscriptnorepeatfor \{time = 0.8}
	SoundEvent event = ($color_wheel_turn_sound)
	swatch_wheel :GetTags
	if (<clockwise> = 1)
		swatch_wheel_right_arrow :se_setprops \{rgba = [
				0
				0
				0
				0
			]}
		swatch_wheel_left_arrow :se_setprops \{rgba = [
				250
				250
				250
				255
			]}
		if (<current_wedge> = 0)
			<current_wedge> = ($g_num_swatch_wedges - 1)
			<angle1> = ((-1 * ($g_swatch_rot_angle)) - 45)
			SpawnScriptNow swatch_wheel_fix_rotate params = {current_wedge = <current_wedge>}
		else
			<current_wedge> = (<current_wedge> - 1)
			<angle1> = ((<current_wedge> * ($g_swatch_rot_angle)) - 45)
		endif
		<re_alpha_arrow> = swatch_wheel_left_arrow
	else
		swatch_wheel_right_arrow :se_setprops \{rgba = [
				250
				250
				250
				255
			]}
		swatch_wheel_left_arrow :se_setprops \{rgba = [
				0
				0
				0
				0
			]}
		if (<current_wedge> = ($g_num_swatch_wedges - 1))
			<current_wedge> = 0
			<angle1> = ((($g_num_swatch_wedges) * ($g_swatch_rot_angle)) - 45)
			SpawnScriptNow swatch_wheel_fix_rotate params = {current_wedge = <current_wedge>}
		else
			<current_wedge> = (<current_wedge> + 1)
			<angle1> = ((<current_wedge> * ($g_swatch_rot_angle)) - 45)
		endif
		<re_alpha_arrow> = swatch_wheel_right_arrow
	endif
	swatch_wheel_desc_id :se_setprops {
		swatch_wheel_cont_rot_angle = <angle1>
		time = ($g_swatch_wheel_spin_speed)
		motion = ease_in
	}
	swatch_wheel :SetTags {current_wedge = <current_wedge>}
	swatch_wheel_set_alpha_all alpha = ($color_wheel_step_1_alpha)
	swatch_wheel_set_alpha_wedge alpha = ($color_wheel_full_alpha)
	swatch_wheel_raise_current_wedge
	<re_alpha_arrow> :se_setprops rgba = [0 0 0 0] time = ($color_wheel_arrow_anim_speed) anim = gentle
	swatch_wheel_swap_swatch_on_character {
		part = <part>
		desc_id = (<part_swatches> [<current_wedge>].desc_id)
	}
endscript

script swatch_wheel_swap_swatch_on_character 

	Wait ($g_swatch_wheel_spin_speed * 2.0) Seconds
	killallcompositetextures
	cas_add_item_to_appearance {
		part = <part>
		desc_id = <desc_id>
	}
	if getactualcasoptionstruct part = <part> desc_id = <desc_id>
		swatch_area_desc_id :se_setprops swatch_name_text = <frontend_desc>
	endif
endscript

script swatch_wheel_fix_rotate 

	if NOT GotParam \{noWait}
		Wait ($g_swatch_wheel_spin_speed) Seconds
	endif
	if ScreenElementExists \{id = swatch_wheel_desc_id}
		swatch_wheel_desc_id :se_setprops swatch_wheel_cont_rot_angle = ((<current_wedge> * ($g_swatch_rot_angle)) - 45)
	endif
endscript

script swatch_wheel_fire_select 
	SoundEvent event = ($color_wheel_choose_sound)
	swatch_wheel :GetTags
	<pad_choose_script> {<pad_choose_params>}
endscript

script load_swatch_textures 

	get_swatch_textures part_swatches = <part_swatches> part = <part>

	ps2_getactualcasoptionstruct_as_struct part = <part> desc_id = (<part_swatches> [0].desc_id)
	PushAssetContext context = <Heap>
	LoadPak (<ps2_part_struct>.0xd79487f9) Heap = <Heap>
	begin
	if isassetloaded Name = (<ps2_part_struct>.swatch_texture)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	PopAssetContext
	swatch_wheel_set_all_white
	swatch_wheel_set_textures textures = <swatch_textures>
endscript

script get_swatch_textures 

	array = []
	GetArraySize \{part_swatches}
	if (<array_Size> > 0)
		i = 0
		begin
		RemoveParameter \{swatch_texture}
		if getactualcasoptionstruct {
				part = <part>
				(<part_swatches> [<i>])
			}
			if GotParam \{swatch_texture}
				texture = <swatch_texture>
				AddArrayElement array = <array> element = <texture>
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return swatch_textures = <array>
endscript

script load_swatch_textures_cleanup 
	ps2_getactualcasoptionstruct_as_struct part = <part> desc_id = (<part_swatches> [0].desc_id)
	PushAssetContext context = <Heap>
	UnLoadPak (<ps2_part_struct>.0xd79487f9) Heap = <Heap>
	PopAssetContext
endscript
