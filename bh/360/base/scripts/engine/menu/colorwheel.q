slice_1_pos = (0.0, -232.0)
slice_2_pos = (0.0, -189.0)
slice_3_pos = (0.0, -144.0)
slice_4_pos = (0.0, -102.0)
slice_5_pos = (0.0, -65.0)
slice_rot_inc = 27.6923
color_wheel_slice_highlight_scale = 1.2
color_wheel_inc_highlight_scale = 1.2
color_wheel_inc_outline_scale = (1.1, 1.3)
color_wheel_spin_speed = 0.2
color_wheel_arrow_anim_speed = 0.5
color_wheel_full_alpha = 255
color_wheel_step_1_alpha = 150
color_wheel_step_2_alpha = 100
color_wheel_turn_sound = ColorWheel_Rotate
color_wheel_choose_sound = ColorWheel_SelectPie
color_wheel_increment_sound = ColorWheel_HighLight_Up_Down
color_wheel_focus_sound = ColorWheel_SelectPie
color_wheel_unfocus_sound = ColorWheel_Deselect_PiePiece
default_colorwheel = [
	[
		Black_1guitar
		grey_2guitar
		grey_3guitar
		grey_4guitar
		grey_5guitar
	]
	[
		yellow_1guitar
		yellow_2guitar
		yellow_3guitar
		yellow_4guitar
		yellow_5guitar
	]
	[
		yellow_orange_1
		yellow_orange_2
		yellow_orange_3
		yellow_orange_4
		yellow_orange_5
	]
	[
		orange_1
		orange_2
		orange_3
		orange_4
		orange_5
	]
	[
		red_orange_1
		red_orange_2
		red_orange_3
		red_orange_4
		red_orange_5
	]
	[
		red_1
		red_2
		red_3
		red_4
		red_5
	]
	[
		violet_1
		violet_2
		violet_3
		violet_4
		violet_5
	]
	[
		purple_blue_1
		purple_blue_2
		purple_blue_3
		purple_blue_4
		purple_blue_5
	]
	[
		navy_1
		navy_2
		navy_3
		navy_4
		navy_5
	]
	[
		blue_1
		Blue_2
		blue_3
		blue_4
		blue_5
	]
	[
		teal_1
		teal_2
		teal_3
		teal_4
		teal_5
	]
	[
		green_1guitar
		green_2guitar
		green_3guitar
		green_4guitar
		green_5guitar
	]
	[
		yellow_green_1guitar
		yellow_green_2guitar
		yellow_green_3guitar
		yellow_green_4guitar
		yellow_green_5guitar
	]
]

script colorwheel_add_item {
		focus_script = color_wheel_focus
		unfocus_script = color_wheel_unfocus
		pad_choose_script = color_slice_back
		increment_focus_script = nullscript
		increment_focus_params = {}
		parent = current_menu
		scale = 1
		dims = (550.0, 550.0)
		Pos = (0.0, 0.0)
		lookup_table = ($default_colorwheel)
	}
	SetScreenElementLock \{id = current_menu
		off}
	if NOT GotParam \{pad_choose_params}
		<pad_choose_params> = <...>
	endif
	<z_priority> = 100
	CreateScreenElement {
		type = ContainerElement
		parent = <parent>
		id = color_wheel_menu_item
		dims = <dims>
		event_handlers = [{focus <focus_script> <focus_params>}
			{unfocus <unfocus_script>}
			{pad_choose color_wheel_choose}
		]
		<not_focusable>
		z_priority = <z_priority>
	}
	CreateScreenElement {
		type = ContainerElement
		parent = color_wheel_menu_item
		id = color_wheel_arrow_container
		dims = (20.0, 20.0)
		Pos = (<Pos> + (<scale> * (0.0, -300.0)))
		pos_anchor = [center , center]
		just = [center , center]
	}
	CreateScreenElement {
		type = SpriteElement
		parent = color_wheel_arrow_container
		id = color_wheel_left_arrow
		texture = Dropdown_Arrow
		dims = (60.0, 60.0)
		scale = (-1.0, 1.0)
		rot_angle = -90
		Pos = (-100.0, 0.0)
		scale = ((-1.0, 1.0) * <scale>)
		rgba = [0 0 0 0]
		pos_anchor = [center , center]
		just = [center , center]
	}
	CreateScreenElement {
		type = SpriteElement
		parent = color_wheel_arrow_container
		id = color_wheel_right_arrow
		texture = Dropdown_Arrow
		dims = (60.0, 60.0)
		rot_angle = 90
		Pos = (100.0, 0.0)
		scale = <scale>
		rgba = [0 0 0 0]
		pos_anchor = [center , center]
		just = [center , center]
	}
	CreateScreenElement {
		type = SpriteElement
		parent = color_wheel_menu_item
		id = color_wheel_backing
		texture = wheel_back
		scale = <scale>
		Pos = <Pos>
		pos_anchor = [center , center]
		just = [center , center]
		rgba = [235 235 235 250]
		z_priority = (<z_priority> -10)
	}
	<parent_id> = <id>
	if GotParam \{index}
		SetScreenElementProps {
			id = <parent_id>
			tags = {tag_grid_x = <index>}
		}
	endif
	CreateScreenElement {
		type = ContainerElement
		id = color_wheel
		parent = color_wheel_menu_item
		not_focusable
		Pos = <Pos>
		pos_anchor = [center , center]
		just = [center , center]
		scale = <scale>
	}
	color_wheel :SetTags {
		current_rot_inc = 0
		current_ring = 1
		lookup_table = <lookup_table>
		increment_focus_script = <increment_focus_script>
		increment_focus_params = <increment_focus_params>
		pad_choose_script = <pad_choose_script>
		pad_choose_params = <pad_choose_params>
		special_exit_script = <special_exit_script>
		special_exit_params = <special_exit_params>
		special_choose_script = <special_choose_script>
		special_choose_params = <special_choose_params>
		init_color = <initial_rgb>
	}
	add_screen_elements
	SetScreenElementLock \{id = current_menu
		on}
	if GotParam \{initial_rgb}
		color_wheel_focus_on_rgb_match initial_rgb = <initial_rgb>
	endif
	current_menu :GetTags
	if GotParam \{total_length}
		GetScreenElementDims \{id = current_menu}
		parent_height = <height>
		GetScreenElementDims \{id = color_wheel_menu_item}
		total_length = (<total_length> + <height>)
		if (<total_length> > <parent_height>)
			generic_menu :SE_SetProps \{generic_menu_scrollbar_alpha = 1.0}
		endif
		current_menu :SetTags {total_length = <total_length>}
	else
		GetScreenElementDims \{id = color_wheel_menu_item}
		current_menu :SetTags {total_length = <height>}
	endif
endscript

script add_screen_elements 
	color_wheel :GetTags
	i = 0
	begin
	FormatText checksumname = base_id 'color_section_%i' i = <i> AddToStringLookup = true
	CreateScreenElement {
		type = ContainerElement
		id = <base_id>
		parent = color_wheel
		rot_angle = (<i> * ($slice_rot_inc))
		not_focusable
	}
	GetScreenElementZPriority id = <id>
	FormatText checksumname = child_id 'color_section_%i_%j' i = <i> j = 1 AddToStringLookup = true
	CreateScreenElement {
		type = SpriteElement
		parent = <base_id>
		id = <child_id>
		texture = blank_1
		Pos = ($slice_1_pos)
		rgba = (($color_lookup_table).(((<lookup_table> [<i>]) [0])).diffuse)
		rgba = (($color_lookup_table).(((<lookup_table> [<i>]) [0])).rgb)
		z_priority = (<z_priority> + 2)
	}
	GetScreenElementDims id = <child_id>
	CreateScreenElement {
		type = SpriteElement
		parent = <child_id>
		texture = blank_1
		scale = ($color_wheel_inc_outline_scale)
		just = [left , top]
		Pos = (((<width> - <width> * (($color_wheel_inc_outline_scale).(1.0, 0.0))) / 2) * (1.0, 0.0) + ((<height> - <height> * (($color_wheel_inc_outline_scale).(0.0, 1.0))) / 2) * (0.0, 1.0))
		z_priority = (<z_priority> + 1)
		alpha = 0
	}
	FormatText checksumname = child_id 'color_section_%i_%j' i = <i> j = 2 AddToStringLookup = true
	CreateScreenElement {
		type = SpriteElement
		parent = <base_id>
		id = <child_id>
		texture = blank_2
		Pos = ($slice_2_pos)
		rgba = (($color_lookup_table).(((<lookup_table> [<i>]) [1])).diffuse)
		rgba = (($color_lookup_table).(((<lookup_table> [<i>]) [1])).rgb)
		z_priority = (<z_priority> + 2)
	}
	GetScreenElementDims id = <child_id>
	CreateScreenElement {
		type = SpriteElement
		parent = <child_id>
		texture = blank_2
		scale = ($color_wheel_inc_outline_scale)
		just = [left , top]
		Pos = (((<width> - <width> * (($color_wheel_inc_outline_scale).(1.0, 0.0))) / 2) * (1.0, 0.0) + ((<height> - <height> * (($color_wheel_inc_outline_scale).(0.0, 1.0))) / 2) * (0.0, 1.0))
		z_priority = (<z_priority> + 1)
		alpha = 0
	}
	FormatText checksumname = child_id 'color_section_%i_%j' i = <i> j = 3 AddToStringLookup = true
	CreateScreenElement {
		type = SpriteElement
		parent = <base_id>
		id = <child_id>
		texture = blank_3
		Pos = ($slice_3_pos)
		rgba = (($color_lookup_table).(((<lookup_table> [<i>]) [2])).diffuse)
		rgba = (($color_lookup_table).(((<lookup_table> [<i>]) [2])).rgb)
		z_priority = (<z_priority> + 2)
	}
	GetScreenElementDims id = <child_id>
	CreateScreenElement {
		type = SpriteElement
		parent = <child_id>
		texture = blank_3
		scale = ($color_wheel_inc_outline_scale)
		just = [left , top]
		Pos = (((<width> - <width> * (($color_wheel_inc_outline_scale).(1.0, 0.0))) / 2) * (1.0, 0.0) + ((<height> - <height> * (($color_wheel_inc_outline_scale).(0.0, 1.0))) / 2) * (0.0, 1.0))
		z_priority = (<z_priority> + 1)
		alpha = 0
	}
	FormatText checksumname = child_id 'color_section_%i_%j' i = <i> j = 4 AddToStringLookup = true
	CreateScreenElement {
		type = SpriteElement
		parent = <base_id>
		id = <child_id>
		texture = blank_4
		Pos = ($slice_4_pos)
		rgba = (($color_lookup_table).(((<lookup_table> [<i>]) [3])).diffuse)
		rgba = (($color_lookup_table).(((<lookup_table> [<i>]) [3])).rgb)
		z_priority = (<z_priority> + 2)
	}
	GetScreenElementDims id = <child_id>
	CreateScreenElement {
		type = SpriteElement
		parent = <child_id>
		texture = blank_4
		scale = ($color_wheel_inc_outline_scale)
		just = [left , top]
		Pos = (((<width> - <width> * (($color_wheel_inc_outline_scale).(1.0, 0.0))) / 2) * (1.0, 0.0) + ((<height> - <height> * (($color_wheel_inc_outline_scale).(0.0, 1.0))) / 2) * (0.0, 1.0))
		z_priority = (<z_priority> + 1)
		alpha = 0
	}
	FormatText checksumname = child_id 'color_section_%i_%j' i = <i> j = 5 AddToStringLookup = true
	CreateScreenElement {
		type = SpriteElement
		parent = <base_id>
		id = <child_id>
		texture = blank_5
		Pos = ($slice_5_pos)
		rgba = (($color_lookup_table).(((<lookup_table> [<i>]) [4])).diffuse)
		rgba = (($color_lookup_table).(((<lookup_table> [<i>]) [4])).rgb)
		z_priority = (<z_priority> + 2)
	}
	GetScreenElementDims id = <child_id>
	CreateScreenElement {
		type = SpriteElement
		parent = <child_id>
		texture = blank_5
		scale = ($color_wheel_inc_outline_scale)
		just = [left , top]
		Pos = (((<width> - <width> * (($color_wheel_inc_outline_scale).(1.0, 0.0))) / 2) * (1.0, 0.0) + ((<height> - <height> * (($color_wheel_inc_outline_scale).(0.0, 1.0))) / 2) * (0.0, 1.0))
		z_priority = (<z_priority> + 1)
		alpha = 0
	}
	i = (<i> + 1)
	repeat 13
endscript

script color_wheel_choose 
	color_wheel_get_rgba
	printstruct <...>
	color_wheel :SetTags {
		init_color = <Color>
	}
	LaunchEvent \{type = unfocus
		target = current_menu}
	LaunchEvent \{type = focus
		target = color_wheel_menu_item}
	SetScreenElementProps \{id = color_wheel_menu_item
		event_handlers = [
			{
				pad_choose
				color_slice_choose
			}
			{
				pad_back
				color_wheel_back
				params = {
					no_sfx
				}
			}
			{
				pad_down
				color_wheel_rotate_clockwise
			}
			{
				pad_up
				color_wheel_rotate_counter_clockwise
			}
			{
				pad_left
				color_wheel_rotate_counter_clockwise
			}
			{
				pad_right
				color_wheel_rotate_clockwise
			}
		]
		replace_handlers}
	color_wheel_raise_current_rot
	color_slice_set_alpha_all alpha = ($color_wheel_step_1_alpha)
	color_slice_set_alpha_slice alpha = ($color_wheel_full_alpha)
	color_wheel :GetTags
	if GotParam \{special_choose_script}
		<special_choose_script> <special_choose_params>
	endif
endscript

script color_slice_choose 
	SoundEvent event = ($color_wheel_focus_sound)
	color_wheel :GetTags
	SetScreenElementProps \{id = color_wheel_menu_item
		event_handlers = [
			{
				pad_back
				color_slice_back
			}
			{
				pad_choose
				color_wheel_fire_select
			}
			{
				pad_down
				color_slice_down
			}
			{
				pad_up
				color_slice_up
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
	color_slice_raise_inc
	color_slice_set_alpha_all alpha = ($color_wheel_step_2_alpha)
	color_slice_set_alpha_slice alpha = ($color_wheel_full_alpha)
	color_wheel_fire_inc_focus increment_focus_script = <increment_focus_script> increment_focus_params = <increment_focus_params>
endscript

script color_wheel_back 
	color_wheel :GetTags
	color_wheel_reset increment_focus_script = <increment_focus_script> increment_focus_params = <increment_focus_params> pad_choose_script = <pad_choose_script> pad_choose_params = <pad_choose_params>
	LaunchEvent \{type = unfocus
		target = color_wheel_menu_item}
	LaunchEvent \{type = focus
		target = current_menu}
	if NOT GotParam \{skip_exit_script}
		if GotParam \{special_exit_script}
			if GotParam \{increment_focus_script}
				if NOT GotParam \{no_sfx}
					SoundEvent event = ($color_wheel_unfocus_sound)
				endif
				color_wheel_focus_on_rgb_match initial_rgb = ((($color_lookup_table).<init_color>).diffuse)
				<increment_focus_script> {<increment_focus_params> Color = <init_color>}
			endif
			<special_exit_script> <special_exit_params>
		endif
	endif
endscript

script color_slice_back 
	SoundEvent event = ($color_wheel_unfocus_sound)
	SetScreenElementProps \{id = color_wheel_menu_item
		event_handlers = [
			{
				pad_choose
				color_slice_choose
			}
			{
				pad_back
				color_wheel_back
				params = {
					no_sfx
				}
			}
			{
				pad_down
				color_wheel_rotate_clockwise
			}
			{
				pad_up
				color_wheel_rotate_counter_clockwise
			}
			{
				pad_left
				color_wheel_rotate_counter_clockwise
			}
			{
				pad_right
				color_wheel_rotate_clockwise
			}
		]
		replace_handlers}
	color_slice_depress_inc
	color_slice_set_alpha_all alpha = ($color_wheel_step_1_alpha)
	color_slice_set_alpha_slice alpha = ($color_wheel_full_alpha)
endscript

script color_wheel_rotate_clockwise 
	SetSpawnedScriptNoRepeatFor time = ($color_wheel_spin_speed)
	SoundEvent event = ($color_wheel_turn_sound)
	SetScreenElementProps \{id = color_wheel_left_arrow
		rgba = [
			0
			0
			0
			0
		]}
	SetScreenElementProps \{id = color_wheel_right_arrow
		rgba = [
			250
			250
			250
			255
		]}
	color_wheel :GetTags
	color_wheel :color_wheel_do_rotate {
		from_rot_angle = ((<current_rot_inc>) * ($slice_rot_inc))
		inc_rot_angle = (-1.0 * ($slice_rot_inc))
		time = ($color_wheel_spin_speed)
	}
	if (<current_rot_inc> = 0)
		current_rot_inc = 12
	else
		current_rot_inc = (<current_rot_inc> -1)
	endif
	color_wheel :SetTags {current_rot_inc = <current_rot_inc>}
	color_wheel_raise_current_rot
	color_slice_set_alpha_all alpha = ($color_wheel_step_1_alpha)
	color_slice_set_alpha_slice alpha = ($color_wheel_full_alpha)
	color_wheel_fire_inc_focus increment_focus_script = <increment_focus_script> increment_focus_params = <increment_focus_params>
	SetScreenElementProps id = color_wheel_right_arrow rgba = [0 0 0 0] time = ($color_wheel_arrow_anim_speed) anim = gentle
endscript

script color_wheel_rotate_counter_clockwise 
	SetSpawnedScriptNoRepeatFor time = ($color_wheel_spin_speed)
	SoundEvent event = ($color_wheel_turn_sound)
	SetScreenElementProps \{id = color_wheel_left_arrow
		rgba = [
			250
			250
			250
			255
		]}
	SetScreenElementProps \{id = color_wheel_right_arrow
		rgba = [
			0
			0
			0
			0
		]}
	color_wheel :GetTags
	color_wheel :color_wheel_do_rotate {
		from_rot_angle = ((<current_rot_inc>) * ($slice_rot_inc))
		inc_rot_angle = (1.0 * ($slice_rot_inc))
		time = ($color_wheel_spin_speed)
	}
	if (<current_rot_inc> = 12)
		current_rot_inc = 0
	else
		current_rot_inc = (<current_rot_inc> + 1)
	endif
	color_wheel :SetTags {current_rot_inc = <current_rot_inc>}
	color_wheel_raise_current_rot
	color_slice_set_alpha_all alpha = ($color_wheel_step_1_alpha)
	color_slice_set_alpha_slice alpha = ($color_wheel_full_alpha)
	color_wheel_fire_inc_focus increment_focus_script = <increment_focus_script> increment_focus_params = <increment_focus_params>
	SetScreenElementProps id = color_wheel_left_arrow rgba = [0 0 0 0] time = ($color_wheel_arrow_anim_speed) anim = gentle
endscript

script color_wheel_do_rotate 
	SE_SetProps rot_angle = <from_rot_angle> time = 0.0
	Obj_KillSpawnedScript \{name = color_wheel_do_rotate_spawned}
	Obj_SpawnScriptNow color_wheel_do_rotate_spawned params = {rot_angle = (<from_rot_angle> + <inc_rot_angle>) time = <time>}
endscript

script color_wheel_do_rotate_spawned 
	SE_SetProps rot_angle = <rot_angle> time = <time>
	SE_WaitProps
endscript

script color_wheel_fix_rotate 
	RequireParams \{[
			current_rot_inc
		]
		all}
	wait ($color_wheel_spin_speed) seconds
	if ScreenElementExists \{id = color_wheel}
		SetScreenElementProps id = color_wheel rot_angle = (<current_rot_inc> * ($slice_rot_inc))
	endif
endscript

script color_slice_up 
	color_wheel :GetTags
	if NOT (<current_ring> = 1)
		current_ring = (<current_ring> -1)
		spawnscriptnow colorwheel_increment_up_down params = {current_ring = <current_ring>}
	endif
	color_wheel :SetTags {current_ring = <current_ring>}
	color_slice_raise_inc
	color_wheel_fire_inc_focus increment_focus_script = <increment_focus_script> increment_focus_params = <increment_focus_params>
endscript

script color_slice_down 
	color_wheel :GetTags
	if NOT (<current_ring> = 5)
		current_ring = (<current_ring> + 1)
		spawnscriptnow colorwheel_increment_up_down params = {current_ring = <current_ring>}
	endif
	color_wheel :SetTags {current_ring = <current_ring>}
	color_slice_raise_inc
	color_wheel_fire_inc_focus increment_focus_script = <increment_focus_script> increment_focus_params = <increment_focus_params>
endscript

script color_wheel_raise_current_rot 
	color_wheel_depress_current_rot
	color_wheel :GetTags
	if (<current_rot_inc> = 0)
		FormatText \{checksumname = new_id
			'color_section_%i'
			i = 0}
	else
		FormatText checksumname = new_id 'color_section_%i' i = (13 - <current_rot_inc>)
	endif
	SetScreenElementProps id = <new_id> scale = ($color_wheel_slice_highlight_scale) anim = fast_out time = ($color_wheel_spin_speed)
	color_wheel_turn_on_slice_boarders
endscript

script color_wheel_depress_current_rot 
	i = 0
	begin
	FormatText checksumname = current_id 'color_section_%i' i = <i>
	SetScreenElementProps id = <current_id> scale = 1.0 anim = fast_in time = ($color_wheel_spin_speed)
	i = (<i> + 1)
	repeat 13
	color_wheel_turn_off_slice_boarders \{anim = gentle
		time = 1.5}
endscript

script color_slice_raise_inc 
	color_slice_depress_inc
	color_wheel_get_slice_id
	<slice_id> :GetTags
	color_wheel :GetTags
	FormatText checksumname = inc_id 'color_section_%i_%j' i = <current_highlight> j = <current_ring>
	GetScreenElementZPriority \{id = color_wheel}
	SetScreenElementProps id = <inc_id> scale = ($color_wheel_inc_highlight_scale) z_priority = (<z_priority> + 30)
	GetScreenElementChildren id = <inc_id>
	GetArraySize <children>
	k = 0
	begin
	SetScreenElementProps id = (<children> [<k>]) z_priority = (<z_priority> + 29)
	k = (<k> + 1)
	repeat <array_size>
	color_slice_add_drop_shadow i = <current_highlight> j = <current_ring>
endscript

script color_slice_depress_inc 
	color_wheel_get_slice_id
	<slice_id> :GetTags
	GetScreenElementZPriority \{id = color_wheel}
	j = 1
	begin
	FormatText checksumname = inc_id 'color_section_%i_%j' i = <current_highlight> j = <j>
	SetScreenElementProps id = <inc_id> scale = 1 z_priority = (<z_priority> + 2)
	GetScreenElementChildren id = <inc_id>
	GetArraySize <children>
	k = 0
	begin
	SetScreenElementProps id = (<children> [<k>]) z_priority = (<z_priority> + 1.5)
	k = (<k> + 1)
	repeat <array_size>
	j = (<j> + 1)
	repeat 5
	color_slice_del_drop_shadow
endscript

script color_slice_add_drop_shadow 
	RequireParams \{[
			i
			j
		]
		all}
	color_slice_del_drop_shadow
	color_wheel :GetTags
	FormatText checksumname = parent_id 'color_section_%i' i = <i>
	FormatText checksumname = child_id 'color_section_%i_%j' i = <i> j = <j>
	FormatText checksumname = texture 'blank_%i_ds' i = <j>
	FormatText checksumname = pos_global 'slice_%i_pos' i = <j>
	GetScreenElementZPriority \{id = color_wheel}
	GetScreenElementDims id = <child_id>
	CreateScreenElement {
		type = SpriteElement
		parent = <parent_id>
		id = drop_shadow
		texture = <texture>
		Pos = (($<pos_global>) + <height> * 0.25 * (0.0, 1.0))
		rgba = [0 0 0 255]
		z_priority = (<z_priority> + 28)
	}
endscript

script color_slice_del_drop_shadow 
	if ScreenElementExists \{id = drop_shadow}
		DestroyScreenElement \{id = drop_shadow}
	endif
endscript

script color_slice_raise_ring 
	color_slice_depress_ring
	i = 0
	begin
	color_wheel :GetTags
	FormatText checksumname = inc_id 'color_section_%i_%j' i = <i> j = <current_ring>
	SetScreenElementProps id = <inc_id> scale = ($color_wheel_inc_highlight_scale)
	i = (<i> + 1)
	repeat 13
endscript

script color_slice_depress_ring 
	color_wheel_get_slice_id
	<slice_id> :GetTags
	i = 0
	begin
	j = 1
	begin
	if NOT (<i> = <current_highlight>)
		FormatText checksumname = inc_id 'color_section_%i_%j' i = <i> j = <j>
		SetScreenElementProps id = <inc_id> scale = 1
	endif
	j = (<j> + 1)
	repeat 5
	i = (<i> + 1)
	repeat 13
endscript

script color_slice_set_alpha_all 
	RequireParams \{[
			alpha
		]
		all}
	color_wheel :GetTags
	i = 0
	begin
	j = 1
	begin
	FormatText checksumname = inc_id 'color_section_%i_%j' i = <i> j = <j>
	SetScreenElementProps id = <inc_id> alpha = (<alpha> / 255.0)
	j = (<j> + 1)
	repeat 5
	i = (<i> + 1)
	repeat 13
	SetScreenElementProps id = color_wheel_backing alpha = (<alpha> / 255.0)
endscript

script color_slice_set_alpha_slice 
	RequireParams \{[
			alpha
		]
		all}
	color_wheel :GetTags
	if (<current_rot_inc> = 0)
		i = 0
	else
		i = (13 - <current_rot_inc>)
	endif
	j = 1
	begin
	FormatText checksumname = inc_id 'color_section_%i_%j' i = <i> j = <j>
	SetScreenElementProps id = <inc_id> alpha = (<alpha> / 255.0)
	j = (<j> + 1)
	repeat 5
endscript

script color_wheel_turn_on_slice_boarders 
	color_wheel_turn_off_slice_boarders \{anim = gentle
		time = 1}
	color_wheel :GetTags
	if (<current_rot_inc> = 0)
		i = 0
	else
		i = (13 - <current_rot_inc>)
	endif
	j = 1
	begin
	FormatText checksumname = inc_id 'color_section_%i_%j' i = <i> j = <j>
	GetScreenElementChildren id = <inc_id>
	GetArraySize <children>
	k = 0
	begin
	SetScreenElementProps id = (<children> [<k>]) alpha = 1
	k = (<k> + 1)
	repeat <array_size>
	j = (<j> + 1)
	repeat 5
endscript

script color_wheel_turn_off_slice_boarders 
	color_wheel :GetTags
	i = 0
	begin
	j = 1
	begin
	FormatText checksumname = inc_id 'color_section_%i_%j' i = <i> j = <j>
	GetScreenElementChildren id = <inc_id>
	GetArraySize <children>
	k = 0
	begin
	SetScreenElementProps id = (<children> [<k>]) alpha = 0 anim = <anim> time = <time>
	k = (<k> + 1)
	repeat <array_size>
	j = (<j> + 1)
	repeat 5
	i = (<i> + 1)
	repeat 13
endscript

script color_wheel_get_slice_id 
	color_wheel :GetTags
	if (<current_rot_inc> = 0)
		current_highlight = <current_rot_inc>
	else
		current_highlight = (13 - <current_rot_inc>)
	endif
	FormatText checksumname = slice_id 'color_section_%i' i = <current_highlight>
	return slice_id = <slice_id> current_highlight = <current_highlight>
endscript

script color_wheel_focus 
	color_slice_set_alpha_all alpha = ($color_wheel_full_alpha)
	set_generic_menu_scrollbar_pos \{id = color_wheel_menu_item}
endscript

script color_wheel_unfocus 
	color_slice_depress_inc
	color_wheel_depress_current_rot
	color_slice_set_alpha_all alpha = ($color_wheel_step_1_alpha)
endscript

script print_color_results 
	printf qs(0x72aafd87) r = <r> g = <g> b = <b> a = <a>
endscript

script color_wheel_get_rgba 
	color_wheel_get_slice_id
	<slice_id> :GetTags
	color_wheel :GetTags
	return Color = ((<lookup_table> [<current_highlight>]) [(<current_ring> -1)])
endscript

script color_wheel_reset 
	SetScreenElementProps \{id = color_wheel_menu_item
		event_handlers = [
			{
				pad_choose
				color_wheel_choose
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
	color_slice_depress_inc
	color_wheel_depress_current_rot
endscript

script color_wheel_fire_inc_focus 
	color_wheel :GetTags
	color_wheel_get_rgba
	increment_focus_params = {<increment_focus_params> Color = <Color>}
	<increment_focus_script> <increment_focus_params>
endscript

script color_wheel_match_rgb 
	if GotParam \{rgb}
		color_wheel :GetTags
		best_match_spoke = 0
		best_match_inc = 0
		best_match_dev = 765
		i = 0
		begin
		j = 0
		begin
		lookup_rgba = (($color_lookup_table).(((<lookup_table> [<i>]) [<j>])).diffuse)
		AbsoluteValue value = (<rgb> [0] - <lookup_rgba> [0])
		dev = <value>
		AbsoluteValue value = (<rgb> [1] - <lookup_rgba> [1])
		dev = (<dev> + <value>)
		AbsoluteValue value = (<rgb> [2] - <lookup_rgba> [2])
		dev = (<dev> + <value>)
		if (<dev> < <best_match_dev>)
			best_match_dev = <dev>
			best_match_spoke = <i>
			best_match_inc = <j>
		endif
		j = (<j> + 1)
		repeat 5
		i = (<i> + 1)
		repeat 13
		printf qs(0x99a7d843) i = <best_match_spoke> j = <best_match_inc>
		return best_match_spoke = <best_match_spoke> best_match_inc = <best_match_inc>
	else
		return \{spoke_num = 0
			inc_num = 1}
	endif
endscript

script AbsoluteValue 
	RequireParams \{[
			value
		]}
	if (<value> < 0)
		value = (-1 * <value>)
	endif
	return value = <value>
endscript

script color_wheel_focus_on_rgb_match 
	color_wheel_match_rgb rgb = <initial_rgb>
	if (<best_match_spoke> = 0)
		current_rot_inc = <best_match_spoke>
	else
		current_rot_inc = (13 - <best_match_spoke>)
	endif
	SetScreenElementProps id = color_wheel rot_angle = ((<current_rot_inc>) * ($slice_rot_inc))
	color_wheel :SetTags {current_rot_inc = <current_rot_inc> current_ring = (<best_match_inc> + 1)}
endscript

script color_wheel_fire_select 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	color_wheel :GetTags
	SoundEvent event = ($color_wheel_choose_sound)
	color_wheel_get_slice_id
	<slice_id> :GetTags
	FormatText checksumname = inc_id 'color_section_%i_%j' i = <current_highlight> j = <current_ring>
	SetScreenElementProps id = <inc_id> scale = (1.05 * ($color_wheel_inc_highlight_scale)) time = 0.03
	wait \{0.15
		seconds}
	SetScreenElementProps id = <inc_id> scale = (($color_wheel_inc_highlight_scale)) time = 0.031999998
	wait \{0.3
		seconds}
	color_wheel_get_rgba
	<pad_choose_script> {<pad_choose_params> diffuse = <diffuse> transition = <transition> dark = <dark> edge = <edge>}
endscript
