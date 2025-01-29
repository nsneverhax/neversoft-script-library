g_num_swatch_wedges = 4
g_swatch_rot_angle = 90
g_swatch_wheel_spin_speed = 0.15

script create_swatch_wheel \{focus_script = swatch_wheel_focus
		unfocus_script = swatch_wheel_unfocus
		pad_choose_script = swatch_wheel_back
		scale = 1
		dims = (550.0, 550.0)}
	SetScreenElementLock \{id = current_menu
		off}
	if NOT GotParam \{pad_choose_params}
		<pad_choose_params> = <...>
	endif
	<z_priority> = 100
	CreateScreenElement {
		type = ContainerElement
		parent = current_menu
		id = swatch_wheel_menu_item
		dims = (<scale> * <dims>)
		event_handlers = [{focus <focus_script> <focus_params>}
			{unfocus <unfocus_script>}
			{pad_choose swatch_wheel_choose}
		]
		<not_focusable>
		z_priority = <z_priority>
	}
	CreateScreenElement {
		type = SpriteElement
		parent = swatch_wheel_menu_item
		id = swatch_wheel_left_arrow
		texture = Dropdown_Arrow
		scale = (-1.0, 1.0)
		rot_angle = -90
		Pos = (<scale> * (70.0, 285.0))
		scale = ((-1.0, 1.0) * <scale>)
		rgba = [0 0 0 0]
	}
	CreateScreenElement {
		type = SpriteElement
		parent = swatch_wheel_menu_item
		id = swatch_wheel_right_arrow
		texture = Dropdown_Arrow
		rot_angle = 90
		Pos = (<scale> * (500.0, 285.0))
		scale = <scale>
		rgba = [0 0 0 0]
	}
	CreateScreenElement {
		type = ContainerElement
		id = swatch_wheel
		parent = swatch_wheel_menu_item
		not_focusable
		Pos = (0.0, 0.0)
		scale = <scale>
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
	repeat <array_size>
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
	current_menu :SE_GetParentID
	CreateScreenElement {
		parent = <parent_id>
		id = swatch_area_desc_id
		type = DescInterface
		desc = 'swatch_area'
		z_priority = <z_priority>
		Pos = (-152.0, -90.0)
	}
	if <id> :Desc_ResolveAlias name = swatch_wheel_desc_id
		AssignAlias id = <resolved_id> alias = swatch_wheel_desc_id
	endif
	swatch_update_text part = <part> desc_id = <current_swatch_desc_id>
	swatch_wheel_fix_rotate nowait current_wedge = <current_wedge>
	SetScreenElementLock \{id = current_menu
		on}
	current_menu :GetTags
	if GotParam \{total_length}
		GetScreenElementDims \{id = current_menu}
		parent_height = <height>
		GetScreenElementDims \{id = swatch_wheel}
		total_length = (<total_length> + <height>)
		if (<total_length> > <parent_height>)
			generic_menu :SE_SetProps \{generic_menu_scrollbar_alpha = 1.0}
		endif
		current_menu :SetTags {total_length = <total_length>}
	else
		GetScreenElementDims \{id = swatch_wheel}
		current_menu :SetTags {total_length = <height>}
	endif
endscript

script swatch_update_text 
	if GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		swatch_area_desc_id :SE_SetProps swatch_name_text = <frontend_desc>
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
	FormatText checksumname = wedge_rgba_prop 'swatch_section_%i_rgba' i = <i>
	AddParam structure_name = rgba_struct name = <wedge_rgba_prop> value = [255 255 255 255]
	swatch_wheel_desc_id :SE_SetProps <rgba_struct>
	<i> = (<i> + 1)
	repeat $g_num_swatch_wedges
endscript

script swatch_wheel_set_textures 
	RequireParams \{[
			textures
		]
		all}
	<i> = 0
	begin
	FormatText checksumname = wedge_tex_prop 'swatch_section_%i_texture' i = <i>
	index = <i>
	if (<index> = 1)
		index = 3
	elseif (<index> = 3)
		index = 1
	endif
	AddParam structure_name = tex_struct name = <wedge_tex_prop> value = (<textures> [<index>])
	swatch_wheel_desc_id :SE_SetProps <tex_struct>
	<i> = (<i> + 1)
	repeat $g_num_swatch_wedges
endscript

script swatch_wheel_set_alpha_all 
	RequireParams \{[
			alpha
		]
		all}
	<i> = 0
	begin
	FormatText checksumname = wedge_alpha_prop 'swatch_section_%i_cont_alpha' i = <i>
	AddParam structure_name = alpha_struct name = <wedge_alpha_prop> value = (<alpha> / 255.0)
	swatch_wheel_desc_id :SE_SetProps <alpha_struct>
	<i> = (<i> + 1)
	repeat $g_num_swatch_wedges
endscript

script swatch_wheel_set_alpha_wedge 
	RequireParams \{[
			alpha
		]
		all}
	swatch_wheel :GetTags
	if (<current_wedge> = 0)
		<i> = 0
	else
		<i> = ($g_num_swatch_wedges - <current_wedge>)
	endif
	FormatText checksumname = wedge_alpha_prop 'swatch_section_%i_cont_alpha' i = <i>
	AddParam structure_name = alpha_struct name = <wedge_alpha_prop> value = (<alpha> / 255.0)
	swatch_wheel_desc_id :SE_SetProps <alpha_struct>
endscript

script swatch_wheel_depress_current_wedge 
	<i> = 0
	begin
	FormatText checksumname = wedge_scale_prop 'swatch_section_%i_cont_scale' i = <i>
	AddParam structure_name = scale_struct name = <wedge_scale_prop> value = (1.0, 1.0)
	AddParam \{structure_name = scale_struct
		name = anim
		value = fast_in}
	AddParam structure_name = scale_struct name = time value = ($g_swatch_wheel_spin_speed)
	swatch_wheel_desc_id :SE_SetProps <scale_struct>
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
	FormatText checksumname = wedge_scale_prop 'swatch_section_%i_cont_scale' i = <i>
	AddParam structure_name = scale_struct name = <wedge_scale_prop> value = (($color_wheel_slice_highlight_scale) * (1.0, 1.0))
	AddParam structure_name = scale_struct name = time value = ($g_swatch_wheel_spin_speed)
	AddParam \{structure_name = scale_struct
		name = motion
		value = ease_in}
	swatch_wheel_desc_id :SE_SetProps <scale_struct>
endscript

script swatch_wheel_choose 
	SoundEvent event = ($color_wheel_focus_sound)
	LaunchEvent \{type = unfocus
		target = current_menu}
	LaunchEvent \{type = focus
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
	LaunchEvent \{type = unfocus
		target = swatch_wheel}
	LaunchEvent \{type = focus
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
	SetSpawnedScriptNoRepeatFor \{time = 0.8}
	SoundEvent event = ($color_wheel_turn_sound)
	swatch_wheel :GetTags
	if (<clockwise> = 1)
		swatch_wheel_left_arrow :SE_SetProps \{rgba = [
				0
				0
				0
				0
			]}
		swatch_wheel_right_arrow :SE_SetProps \{rgba = [
				250
				250
				250
				255
			]}
		if (<current_wedge> = 0)
			<current_wedge> = ($g_num_swatch_wedges - 1)
			<angle1> = ((-1 * ($g_swatch_rot_angle)) - 45)
			spawnscriptnow swatch_wheel_fix_rotate params = {current_wedge = <current_wedge>}
		else
			<current_wedge> = (<current_wedge> - 1)
			<angle1> = ((<current_wedge> * ($g_swatch_rot_angle)) - 45)
		endif
		<re_alpha_arrow> = swatch_wheel_right_arrow
	else
		swatch_wheel_left_arrow :SE_SetProps \{rgba = [
				250
				250
				250
				255
			]}
		swatch_wheel_right_arrow :SE_SetProps \{rgba = [
				0
				0
				0
				0
			]}
		if (<current_wedge> = ($g_num_swatch_wedges - 1))
			<current_wedge> = 0
			<angle1> = ((($g_num_swatch_wedges) * ($g_swatch_rot_angle)) - 45)
			spawnscriptnow swatch_wheel_fix_rotate params = {current_wedge = <current_wedge>}
		else
			<current_wedge> = (<current_wedge> + 1)
			<angle1> = ((<current_wedge> * ($g_swatch_rot_angle)) - 45)
		endif
		<re_alpha_arrow> = swatch_wheel_left_arrow
	endif
	swatch_wheel_desc_id :SE_SetProps {
		swatch_wheel_cont_rot_angle = <angle1>
		time = ($g_swatch_wheel_spin_speed)
		motion = ease_in
	}
	swatch_wheel :SetTags {current_wedge = <current_wedge>}
	swatch_wheel_set_alpha_all alpha = ($color_wheel_step_1_alpha)
	swatch_wheel_set_alpha_wedge alpha = ($color_wheel_full_alpha)
	swatch_wheel_raise_current_wedge
	<re_alpha_arrow> :SE_SetProps rgba = [0 0 0 0] time = ($color_wheel_arrow_anim_speed) anim = gentle
	swatch_wheel_swap_swatch_on_character {
		part = <part>
		desc_id = (<part_swatches> [<current_wedge>].desc_id)
	}
endscript

script swatch_wheel_swap_swatch_on_character 
	RequireParams \{[
			part
			desc_id
		]
		all}
	wait ($g_swatch_wheel_spin_speed * 2.0) seconds
	KillAllCompositeTextures
	cas_add_item_to_appearance {
		part = <part>
		desc_id = <desc_id>
	}
	if GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		swatch_area_desc_id :SE_SetProps swatch_name_text = <frontend_desc>
	endif
endscript

script swatch_wheel_fix_rotate 
	RequireParams \{[
			current_wedge
		]
		all}
	if NOT GotParam \{nowait}
		wait ($g_swatch_wheel_spin_speed) seconds
	endif
	if ScreenElementExists \{id = swatch_wheel_desc_id}
		swatch_wheel_desc_id :SE_SetProps swatch_wheel_cont_rot_angle = ((<current_wedge> * ($g_swatch_rot_angle)) - 45)
	endif
endscript

script swatch_wheel_fire_select 
	SoundEvent event = ($color_wheel_choose_sound)
	swatch_wheel :GetTags
	<pad_choose_script> {<pad_choose_params>}
endscript

script load_swatch_textures 
	RequireParams \{[
			part
			part_swatches
		]
		all}
	get_swatch_textures part_swatches = <part_swatches> part = <part>
	printstruct <swatch_textures>
	LoadCASUITextures {
		group = swatch
		textures = <swatch_textures>
		heap = heap_cas_build
	}
	printf \{'Waiting to load swatch textures...'}
	ArchiveWaitLoading \{swatch
		async = 0}
	printf \{'Done loading swatch textures...'}
	swatch_wheel_set_all_white
	swatch_wheel_set_textures textures = <swatch_textures>
endscript

script get_swatch_textures 
	RequireParams \{[
			part
			part_swatches
		]
		all}
	array = []
	GetArraySize \{part_swatches}
	if (<array_size> > 0)
		i = 0
		begin
		RemoveParameter \{swatch_texture}
		if GetActualCASOptionStruct {
				part = <part>
				(<part_swatches> [<i>])
			}
			if GotParam \{swatch_texture}
				ExtendCrc <swatch_texture> '.img' out = texture
				AddArrayElement array = <array> element = <texture>
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return swatch_textures = <array>
endscript

script load_swatch_textures_cleanup 
	ArchiveWaitLoading \{swatch
		async = 0}
	ArchiveWaitLoading \{CAS
		async = 0}
	UnloadCASUITextures \{group = swatch}
endscript
