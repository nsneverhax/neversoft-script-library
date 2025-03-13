g_num_swatch_wedges = 4
g_swatch_rot_angle = 90
g_swatch_wheel_spin_speed = 0.15

script create_swatch_wheel \{focus_script = swatch_wheel_focus
		unfocus_script = swatch_wheel_unfocus
		pad_choose_script = swatch_wheel_back
		scale = 1
		dims = (550.0, 550.0)}
	setscreenelementlock \{id = current_menu
		off}
	if NOT gotparam \{pad_choose_params}
		<pad_choose_params> = <...>
	endif
	<z_priority> = 100
	createscreenelement {
		type = containerelement
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
	createscreenelement {
		type = spriteelement
		parent = swatch_wheel_menu_item
		id = swatch_wheel_left_arrow
		texture = wheel_arrow
		scale = (-1.0, 1.0)
		rot_angle = -90
		pos = (<scale> * (50.0, 0.0))
		scale = ((-1.0, 1.0) * <scale>)
		rgba = [0 0 0 0]
	}
	createscreenelement {
		type = spriteelement
		parent = swatch_wheel_menu_item
		id = swatch_wheel_right_arrow
		texture = wheel_arrow
		rot_angle = 90
		pos = (<scale> * (500.0, 0.0))
		scale = <scale>
		rgba = [0 0 0 0]
	}
	createscreenelement {
		type = containerelement
		id = swatch_wheel
		parent = swatch_wheel_menu_item
		not_focusable
		pos = (0.0, 0.0)
		scale = <scale>
	}
	current_wedge = 0
	getarraysize <part_swatches>
	i = 0
	begin
	thisone = (<part_swatches> [<i>])
	if ((<thisone>.desc_id) = <current_swatch_desc_id>)
		current_wedge = <i>
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	swatch_wheel :settags {
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
	createscreenelement {
		parent = swatch_wheel
		id = swatch_area_desc_id
		type = descinterface
		desc = 'swatch_area'
		z_priority = <z_priority>
		pos = (-96.0, 30.0)
	}
	if <id> :desc_resolvealias name = swatch_wheel_desc_id
		assignalias id = <resolved_id> alias = swatch_wheel_desc_id
	endif
	swatch_update_text part = <part> desc_id = <current_swatch_desc_id>
	swatch_wheel_fix_rotate nowait current_wedge = <current_wedge>
	setscreenelementlock \{id = current_menu
		on}
	current_menu :gettags
	if gotparam \{total_length}
		getscreenelementdims \{id = current_menu}
		parent_height = <height>
		getscreenelementdims \{id = swatch_wheel}
		total_length = (<total_length> + <height>)
		if (<total_length> > <parent_height>)
			generic_menu :se_setprops \{generic_menu_scrollbar_alpha = 1.0}
		endif
		current_menu :settags {total_length = <total_length>}
	else
		getscreenelementdims \{id = swatch_wheel}
		current_menu :settags {total_length = <height>}
	endif
endscript

script swatch_update_text 
	if getactualcasoptionstruct part = <part> desc_id = <desc_id>
		swatch_area_desc_id :se_setprops swatch_name_text = <frontend_desc>
	endif
endscript

script swatch_wheel_focus 
	swatch_wheel_set_alpha_all alpha = ($color_wheel_full_alpha)
	set_generic_menu_scrollbar_pos \{id = swatch_wheel}
endscript

script swatch_wheel_unfocus 
	swatch_wheel_depress_current_wedge
	swatch_wheel_set_alpha_all alpha = ($color_wheel_step_1_alpha)
endscript

script swatch_wheel_set_all_white 
	<i> = 0
	begin
	formattext checksumname = wedge_rgba_prop 'swatch_section_%i_rgba' i = <i>
	addparam structure_name = rgba_struct name = <wedge_rgba_prop> value = [255 255 255 255]
	swatch_wheel_desc_id :se_setprops <rgba_struct>
	<i> = (<i> + 1)
	repeat $g_num_swatch_wedges
endscript

script swatch_wheel_set_textures 
	requireparams \{[
			textures
		]
		all}
	<i> = 0
	begin
	formattext checksumname = wedge_tex_prop 'swatch_section_%i_texture' i = <i>
	index = <i>
	if (<index> = 1)
		index = 3
	elseif (<index> = 3)
		index = 1
	endif
	addparam structure_name = tex_struct name = <wedge_tex_prop> value = (<textures> [<index>])
	swatch_wheel_desc_id :se_setprops <tex_struct>
	<i> = (<i> + 1)
	repeat $g_num_swatch_wedges
endscript

script swatch_wheel_set_alpha_all 
	requireparams \{[
			alpha
		]
		all}
	<i> = 0
	begin
	formattext checksumname = wedge_alpha_prop 'swatch_section_%i_cont_alpha' i = <i>
	addparam structure_name = alpha_struct name = <wedge_alpha_prop> value = (<alpha> / 255.0)
	swatch_wheel_desc_id :se_setprops <alpha_struct>
	<i> = (<i> + 1)
	repeat $g_num_swatch_wedges
endscript

script swatch_wheel_set_alpha_wedge 
	requireparams \{[
			alpha
		]
		all}
	swatch_wheel :gettags
	if (<current_wedge> = 0)
		<i> = 0
	else
		<i> = ($g_num_swatch_wedges - <current_wedge>)
	endif
	formattext checksumname = wedge_alpha_prop 'swatch_section_%i_cont_alpha' i = <i>
	addparam structure_name = alpha_struct name = <wedge_alpha_prop> value = (<alpha> / 255.0)
	swatch_wheel_desc_id :se_setprops <alpha_struct>
endscript

script swatch_wheel_depress_current_wedge 
	<i> = 0
	begin
	formattext checksumname = wedge_scale_prop 'swatch_section_%i_cont_scale' i = <i>
	addparam structure_name = scale_struct name = <wedge_scale_prop> value = (1.0, 1.0)
	addparam \{structure_name = scale_struct
		name = anim
		value = fast_in}
	addparam structure_name = scale_struct name = time value = ($g_swatch_wheel_spin_speed)
	swatch_wheel_desc_id :se_setprops <scale_struct>
	<i> = (<i> + 1)
	repeat $g_num_swatch_wedges
endscript

script swatch_wheel_raise_current_wedge 
	swatch_wheel_depress_current_wedge
	swatch_wheel :gettags
	if (<current_wedge> = 0)
		<i> = 0
	else
		<i> = ($g_num_swatch_wedges - <current_wedge>)
	endif
	formattext checksumname = wedge_scale_prop 'swatch_section_%i_cont_scale' i = <i>
	addparam structure_name = scale_struct name = <wedge_scale_prop> value = (($color_wheel_slice_highlight_scale) * (1.0, 1.0))
	addparam structure_name = scale_struct name = time value = ($g_swatch_wheel_spin_speed)
	addparam \{structure_name = scale_struct
		name = motion
		value = ease_in}
	swatch_wheel_desc_id :se_setprops <scale_struct>
endscript

script swatch_wheel_choose 
	soundevent event = ($color_wheel_focus_sound)
	launchevent \{type = unfocus
		target = current_menu}
	launchevent \{type = focus
		target = swatch_wheel}
	setscreenelementprops \{id = swatch_wheel
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
					clockwise = 1
				}
			}
			{
				pad_right
				swatch_wheel_rotate
				params = {
					clockwise = 0
				}
			}
		]
		replace_handlers}
	swatch_wheel_raise_current_wedge
	swatch_wheel_set_alpha_all alpha = ($color_wheel_step_1_alpha)
	swatch_wheel_set_alpha_wedge alpha = ($color_wheel_full_alpha)
	swatch_wheel :gettags
	if gotparam \{special_choose_script}
		<special_choose_script> <special_choose_params>
	endif
endscript

script swatch_wheel_back 
	soundevent event = ($color_wheel_unfocus_sound)
	swatch_wheel :gettags
	swatch_wheel_reset pad_choose_script = <pad_choose_script> pad_choose_params = <pad_choose_params>
	launchevent \{type = unfocus
		target = swatch_wheel}
	launchevent \{type = focus
		target = current_menu}
	if NOT gotparam \{skip_exit_script}
		if gotparam \{special_exit_script}
			<special_exit_script> <special_exit_params>
		endif
	endif
endscript

script swatch_wheel_reset 
	setscreenelementprops \{id = swatch_wheel
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
	soundevent event = ($color_wheel_turn_sound)
	swatch_wheel :gettags
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
			spawnscriptnow swatch_wheel_fix_rotate params = {current_wedge = <current_wedge>}
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
			spawnscriptnow swatch_wheel_fix_rotate params = {current_wedge = <current_wedge>}
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
	swatch_wheel :settags {current_wedge = <current_wedge>}
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
	requireparams \{[
			part
			desc_id
		]
		all}
	wait ($g_swatch_wheel_spin_speed * 2.0) seconds
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
	requireparams \{[
			current_wedge
		]
		all}
	if NOT gotparam \{nowait}
		wait ($g_swatch_wheel_spin_speed) seconds
	endif
	if screenelementexists \{id = swatch_wheel_desc_id}
		swatch_wheel_desc_id :se_setprops swatch_wheel_cont_rot_angle = ((<current_wedge> * ($g_swatch_rot_angle)) - 45)
	endif
endscript

script swatch_wheel_fire_select 
	soundevent event = ($color_wheel_choose_sound)
	swatch_wheel :gettags
	<pad_choose_script> {<pad_choose_params>}
endscript

script load_swatch_textures 
	requireparams \{[
			part
			part_swatches
		]
		all}
	get_swatch_textures part_swatches = <part_swatches> part = <part>
	printstruct <swatch_textures>
	loadcasuitextures {
		group = swatch
		textures = <swatch_textures>
		heap = heap_cas_build
	}
	printf \{'Waiting to load swatch textures...'}
	archivewaitloading \{swatch
		async = 0}
	printf \{'Done loading swatch textures...'}
	swatch_wheel_set_all_white
	swatch_wheel_set_textures textures = <swatch_textures>
endscript

script get_swatch_textures 
	requireparams \{[
			part
			part_swatches
		]
		all}
	array = []
	getarraysize \{part_swatches}
	if (<array_size> > 0)
		i = 0
		begin
		removeparameter \{swatch_texture}
		if getactualcasoptionstruct {
				part = <part>
				(<part_swatches> [<i>])
			}
			if gotparam \{swatch_texture}
				extendcrc <swatch_texture> '.img' out = texture
				addarrayelement array = <array> element = <texture>
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return swatch_textures = <array>
endscript

script load_swatch_textures_cleanup 
	archivewaitloading \{swatch
		async = 0}
	archivewaitloading \{cas
		async = 0}
	unloadcasuitextures \{group = swatch}
endscript
