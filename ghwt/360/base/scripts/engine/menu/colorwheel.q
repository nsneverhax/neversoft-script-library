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
color_wheel_turn_sound = colorwheel_rotate
color_wheel_choose_sound = colorwheel_selectpie
color_wheel_increment_sound = colorwheel_highlight_up_down
color_wheel_focus_sound = colorwheel_selectpie
color_wheel_unfocus_sound = colorwheel_deselect_piepiece
default_colorwheel = [
	[
		black_1guitar
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
		blue_2
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
		Scale = 1
		dims = (550.0, 550.0)
		Pos = (175.0, 165.0)
		lookup_table = ($default_colorwheel)
	}
	PushAssetContext \{context = z_soundcheck}
	SetScreenElementLock \{id = current_menu
		OFF}
	if NOT GotParam \{pad_choose_params}
		<pad_choose_params> = <...>
	endif
	<z_priority> = 100
	CreateScreenElement {
		Type = ContainerElement
		parent = current_menu
		id = color_wheel_menu_item
		dims = (<Scale> * <dims>)
		event_handlers = [{focus <focus_script> <focus_params>}
			{unfocus <unfocus_script>}
			{pad_choose color_wheel_choose}
		]
		<not_focusable>
		z_priority = <z_priority>
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = color_wheel_menu_item
		id = color_wheel_left_arrow
		texture = wheel_arrow
		Scale = (-1.0, 1.0)
		rot_angle = -90
		Pos = (<Scale> * (50.0, 0.0))
		Scale = ((-1.0, 1.0) * <Scale>)
		rgba = [0 0 0 0]
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = color_wheel_menu_item
		id = color_wheel_right_arrow
		texture = wheel_arrow
		rot_angle = 90
		Pos = (<Scale> * (550.0, 0.0))
		Scale = <Scale>
		rgba = [0 0 0 0]
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = color_wheel_menu_item
		id = color_wheel_backing
		texture = wheel_back
		Scale = <Scale>
		Pos = <Pos>
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
		Type = ContainerElement
		id = color_wheel
		parent = color_wheel_menu_item
		not_focusable
		Pos = <Pos>
		Scale = <Scale>
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
		On}
	if GotParam \{initial_rgb}
		color_wheel_focus_on_rgb_match initial_rgb = <initial_rgb>
	endif
	PopAssetContext \{context = z_soundcheck}
	current_menu :GetTags
	if GotParam \{total_length}
		GetScreenElementDims \{id = current_menu}
		parent_height = <height>
		GetScreenElementDims \{id = color_wheel_menu_item}
		total_length = (<total_length> + <height>)
		if (<total_length> > <parent_height>)
			generic_menu :se_setprops \{generic_menu_scrollbar_alpha = 1.0}
		endif
		current_menu :SetTags {total_length = <total_length>}
	else
		GetScreenElementDims \{id = color_wheel_menu_item}
		current_menu :SetTags {total_length = <height>}
	endif
endscript

script add_screen_elements 
	PushAssetContext \{context = z_soundcheck}
	color_wheel :GetTags
	i = 0
	begin
	formatText checksumName = base_id 'color_section_%i' i = <i> AddToStringLookup = true
	CreateScreenElement {
		Type = ContainerElement
		id = <base_id>
		parent = color_wheel
		rot_angle = (<i> * ($slice_rot_inc))
		not_focusable
	}
	getscreenelementzpriority id = <id>
	formatText checksumName = child_id 'color_section_%i_%j' i = <i> j = 1 AddToStringLookup = true
	CreateScreenElement {
		Type = SpriteElement
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
		Type = SpriteElement
		parent = <child_id>
		texture = blank_1
		Scale = ($color_wheel_inc_outline_scale)
		just = [left , top]
		Pos = (((<width> - <width> * (($color_wheel_inc_outline_scale).(1.0, 0.0))) / 2) * (1.0, 0.0) + ((<height> - <height> * (($color_wheel_inc_outline_scale).(0.0, 1.0))) / 2) * (0.0, 1.0))
		z_priority = (<z_priority> + 1)
		alpha = 0
	}
	formatText checksumName = child_id 'color_section_%i_%j' i = <i> j = 2 AddToStringLookup = true
	CreateScreenElement {
		Type = SpriteElement
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
		Type = SpriteElement
		parent = <child_id>
		texture = blank_2
		Scale = ($color_wheel_inc_outline_scale)
		just = [left , top]
		Pos = (((<width> - <width> * (($color_wheel_inc_outline_scale).(1.0, 0.0))) / 2) * (1.0, 0.0) + ((<height> - <height> * (($color_wheel_inc_outline_scale).(0.0, 1.0))) / 2) * (0.0, 1.0))
		z_priority = (<z_priority> + 1)
		alpha = 0
	}
	formatText checksumName = child_id 'color_section_%i_%j' i = <i> j = 3 AddToStringLookup = true
	CreateScreenElement {
		Type = SpriteElement
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
		Type = SpriteElement
		parent = <child_id>
		texture = blank_3
		Scale = ($color_wheel_inc_outline_scale)
		just = [left , top]
		Pos = (((<width> - <width> * (($color_wheel_inc_outline_scale).(1.0, 0.0))) / 2) * (1.0, 0.0) + ((<height> - <height> * (($color_wheel_inc_outline_scale).(0.0, 1.0))) / 2) * (0.0, 1.0))
		z_priority = (<z_priority> + 1)
		alpha = 0
	}
	formatText checksumName = child_id 'color_section_%i_%j' i = <i> j = 4 AddToStringLookup = true
	CreateScreenElement {
		Type = SpriteElement
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
		Type = SpriteElement
		parent = <child_id>
		texture = blank_4
		Scale = ($color_wheel_inc_outline_scale)
		just = [left , top]
		Pos = (((<width> - <width> * (($color_wheel_inc_outline_scale).(1.0, 0.0))) / 2) * (1.0, 0.0) + ((<height> - <height> * (($color_wheel_inc_outline_scale).(0.0, 1.0))) / 2) * (0.0, 1.0))
		z_priority = (<z_priority> + 1)
		alpha = 0
	}
	formatText checksumName = child_id 'color_section_%i_%j' i = <i> j = 5 AddToStringLookup = true
	CreateScreenElement {
		Type = SpriteElement
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
		Type = SpriteElement
		parent = <child_id>
		texture = blank_5
		Scale = ($color_wheel_inc_outline_scale)
		just = [left , top]
		Pos = (((<width> - <width> * (($color_wheel_inc_outline_scale).(1.0, 0.0))) / 2) * (1.0, 0.0) + ((<height> - <height> * (($color_wheel_inc_outline_scale).(0.0, 1.0))) / 2) * (0.0, 1.0))
		z_priority = (<z_priority> + 1)
		alpha = 0
	}
	i = (<i> + 1)
	repeat 13
	PopAssetContext \{context = z_soundcheck}
endscript

script color_wheel_choose 
	SoundEvent event = ($color_wheel_focus_sound)
	color_wheel_get_rgba
	printstruct <...>
	color_wheel :SetTags {
		init_color = <Color>
	}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	LaunchEvent \{Type = focus
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
				color_wheel_rotate_clockwise
			}
			{
				pad_right
				color_wheel_rotate_counter_clockwise
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
	SoundEvent event = ($color_wheel_unfocus_sound)
	color_wheel :GetTags
	color_wheel_reset increment_focus_script = <increment_focus_script> increment_focus_params = <increment_focus_params> pad_choose_script = <pad_choose_script> pad_choose_params = <pad_choose_params>
	LaunchEvent \{Type = unfocus
		target = color_wheel_menu_item}
	LaunchEvent \{Type = focus
		target = current_menu}
	if NOT GotParam \{skip_exit_script}
		if GotParam \{special_exit_script}
			if GotParam \{increment_focus_script}
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
				color_wheel_rotate_clockwise
			}
			{
				pad_right
				color_wheel_rotate_counter_clockwise
			}
		]
		replace_handlers}
	color_slice_depress_inc
	color_slice_set_alpha_all alpha = ($color_wheel_step_1_alpha)
	color_slice_set_alpha_slice alpha = ($color_wheel_full_alpha)
endscript

script color_wheel_rotate_clockwise 
	setspawnedscriptnorepeatfor time = ($color_wheel_spin_speed)
	SoundEvent event = ($color_wheel_turn_sound)
	SetScreenElementProps \{id = color_wheel_right_arrow
		rgba = [
			0
			0
			0
			0
		]}
	SetScreenElementProps \{id = color_wheel_left_arrow
		rgba = [
			250
			250
			250
			255
		]}
	color_wheel :GetTags
	if (<current_rot_inc> = 0)
		current_rot_inc = 12
		SetScreenElementProps id = color_wheel rot_angle = (-1 * ($slice_rot_inc)) time = ($color_wheel_spin_speed)
		SpawnScriptNow color_wheel_fix_rotate params = {current_rot_inc = <current_rot_inc>}
	else
		current_rot_inc = (<current_rot_inc> -1)
		SetScreenElementProps id = color_wheel rot_angle = (<current_rot_inc> * ($slice_rot_inc)) time = ($color_wheel_spin_speed)
	endif
	color_wheel :SetTags {current_rot_inc = <current_rot_inc>}
	color_wheel_raise_current_rot
	color_slice_set_alpha_all alpha = ($color_wheel_step_1_alpha)
	color_slice_set_alpha_slice alpha = ($color_wheel_full_alpha)
	color_wheel_fire_inc_focus increment_focus_script = <increment_focus_script> increment_focus_params = <increment_focus_params>
	SetScreenElementProps id = color_wheel_left_arrow rgba = [0 0 0 0] time = ($color_wheel_arrow_anim_speed) anim = gentle
endscript

script color_wheel_rotate_counter_clockwise 
	setspawnedscriptnorepeatfor time = ($color_wheel_spin_speed)
	SoundEvent event = ($color_wheel_turn_sound)
	SetScreenElementProps \{id = color_wheel_right_arrow
		rgba = [
			250
			250
			250
			255
		]}
	SetScreenElementProps \{id = color_wheel_left_arrow
		rgba = [
			0
			0
			0
			0
		]}
	color_wheel :GetTags
	if (<current_rot_inc> = 12)
		current_rot_inc = 0
		SetScreenElementProps id = color_wheel rot_angle = (13 * ($slice_rot_inc)) time = ($color_wheel_spin_speed)
		SpawnScriptNow color_wheel_fix_rotate params = {current_rot_inc = <current_rot_inc>}
	else
		current_rot_inc = (<current_rot_inc> + 1)
		SetScreenElementProps id = color_wheel rot_angle = ((<current_rot_inc>) * ($slice_rot_inc)) time = ($color_wheel_spin_speed)
	endif
	color_wheel :SetTags {current_rot_inc = <current_rot_inc>}
	color_wheel_raise_current_rot
	color_slice_set_alpha_all alpha = ($color_wheel_step_1_alpha)
	color_slice_set_alpha_slice alpha = ($color_wheel_full_alpha)
	color_wheel_fire_inc_focus increment_focus_script = <increment_focus_script> increment_focus_params = <increment_focus_params>
	SetScreenElementProps id = color_wheel_right_arrow rgba = [0 0 0 0] time = ($color_wheel_arrow_anim_speed) anim = gentle
endscript

script color_wheel_fix_rotate 
	RequireParams \{[
			current_rot_inc
		]
		all}
	Wait ($color_wheel_spin_speed) Seconds
	if ScreenElementExists \{id = color_wheel}
		SetScreenElementProps id = color_wheel rot_angle = (<current_rot_inc> * ($slice_rot_inc))
	endif
endscript

script color_slice_up 
	color_wheel :GetTags
	if NOT (<current_ring> = 1)
		current_ring = (<current_ring> -1)
		SpawnScriptNow colorwheel_increment_up_down params = {current_ring = <current_ring>}
	endif
	color_wheel :SetTags {current_ring = <current_ring>}
	color_slice_raise_inc
	color_wheel_fire_inc_focus increment_focus_script = <increment_focus_script> increment_focus_params = <increment_focus_params>
endscript

script color_slice_down 
	color_wheel :GetTags
	if NOT (<current_ring> = 5)
		current_ring = (<current_ring> + 1)
		SpawnScriptNow colorwheel_increment_up_down params = {current_ring = <current_ring>}
	endif
	color_wheel :SetTags {current_ring = <current_ring>}
	color_slice_raise_inc
	color_wheel_fire_inc_focus increment_focus_script = <increment_focus_script> increment_focus_params = <increment_focus_params>
endscript

script color_wheel_raise_current_rot 
	color_wheel_depress_current_rot
	color_wheel :GetTags
	if (<current_rot_inc> = 0)
		formatText \{checksumName = new_id
			'color_section_%i'
			i = 0}
	else
		formatText checksumName = new_id 'color_section_%i' i = (13 - <current_rot_inc>)
	endif
	SetScreenElementProps id = <new_id> Scale = ($color_wheel_slice_highlight_scale) anim = fast_out time = ($color_wheel_spin_speed)
	color_wheel_turn_on_slice_boarders
endscript

script color_wheel_depress_current_rot 
	i = 0
	begin
	formatText checksumName = current_id 'color_section_%i' i = <i>
	SetScreenElementProps id = <current_id> Scale = 1.0 anim = fast_in time = ($color_wheel_spin_speed)
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
	formatText checksumName = inc_id 'color_section_%i_%j' i = <current_highlight> j = <current_ring>
	getscreenelementzpriority \{id = color_wheel}
	SetScreenElementProps id = <inc_id> Scale = ($color_wheel_inc_highlight_scale) z_priority = (<z_priority> + 30)
	GetScreenElementChildren id = <inc_id>
	GetArraySize <children>
	k = 0
	begin
	SetScreenElementProps id = (<children> [<k>]) z_priority = (<z_priority> + 29)
	k = (<k> + 1)
	repeat <array_Size>
	color_slice_add_drop_shadow i = <current_highlight> j = <current_ring>
endscript

script color_slice_depress_inc 
	color_wheel_get_slice_id
	<slice_id> :GetTags
	getscreenelementzpriority \{id = color_wheel}
	j = 1
	begin
	formatText checksumName = inc_id 'color_section_%i_%j' i = <current_highlight> j = <j>
	SetScreenElementProps id = <inc_id> Scale = 1 z_priority = (<z_priority> + 2)
	GetScreenElementChildren id = <inc_id>
	GetArraySize <children>
	k = 0
	begin
	SetScreenElementProps id = (<children> [<k>]) z_priority = (<z_priority> + 1.5)
	k = (<k> + 1)
	repeat <array_Size>
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
	formatText checksumName = parent_id 'color_section_%i' i = <i>
	formatText checksumName = child_id 'color_section_%i_%j' i = <i> j = <j>
	formatText checksumName = texture 'blank_%i_ds' i = <j>
	formatText checksumName = pos_global 'slice_%i_pos' i = <j>
	getscreenelementzpriority \{id = color_wheel}
	GetScreenElementDims id = <child_id>
	PushAssetContext \{context = z_soundcheck}
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent_id>
		id = drop_shadow
		texture = <texture>
		Pos = (($<pos_global>) + <height> * 0.25 * (0.0, 1.0))
		rgba = [0 0 0 255]
		z_priority = (<z_priority> + 28)
	}
	PopAssetContext \{context = z_soundcheck}
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
	formatText checksumName = inc_id 'color_section_%i_%j' i = <i> j = <current_ring>
	SetScreenElementProps id = <inc_id> Scale = ($color_wheel_inc_highlight_scale)
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
		formatText checksumName = inc_id 'color_section_%i_%j' i = <i> j = <j>
		SetScreenElementProps id = <inc_id> Scale = 1
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
	formatText checksumName = inc_id 'color_section_%i_%j' i = <i> j = <j>
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
	formatText checksumName = inc_id 'color_section_%i_%j' i = <i> j = <j>
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
	formatText checksumName = inc_id 'color_section_%i_%j' i = <i> j = <j>
	GetScreenElementChildren id = <inc_id>
	GetArraySize <children>
	k = 0
	begin
	SetScreenElementProps id = (<children> [<k>]) alpha = 1
	k = (<k> + 1)
	repeat <array_Size>
	j = (<j> + 1)
	repeat 5
endscript

script color_wheel_turn_off_slice_boarders 
	color_wheel :GetTags
	i = 0
	begin
	j = 1
	begin
	formatText checksumName = inc_id 'color_section_%i_%j' i = <i> j = <j>
	GetScreenElementChildren id = <inc_id>
	GetArraySize <children>
	k = 0
	begin
	SetScreenElementProps id = (<children> [<k>]) alpha = 0 anim = <anim> time = <time>
	k = (<k> + 1)
	repeat <array_Size>
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
	formatText checksumName = slice_id 'color_section_%i' i = <current_highlight>
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
		absolutevalue value = (<rgb> [0] - <lookup_rgba> [0])
		dev = <value>
		absolutevalue value = (<rgb> [1] - <lookup_rgba> [1])
		dev = (<dev> + <value>)
		absolutevalue value = (<rgb> [2] - <lookup_rgba> [2])
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

script absolutevalue 
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
	color_wheel :GetTags
	SoundEvent event = ($color_wheel_choose_sound)
	color_wheel_get_slice_id
	<slice_id> :GetTags
	formatText checksumName = inc_id 'color_section_%i_%j' i = <current_highlight> j = <current_ring>
	SetScreenElementProps id = <inc_id> Scale = (1.05 * ($color_wheel_inc_highlight_scale)) time = 0.03
	Wait \{0.15
		Seconds}
	SetScreenElementProps id = <inc_id> Scale = (($color_wheel_inc_highlight_scale)) time = 0.031999998
	Wait \{0.3
		Seconds}
	color_wheel_get_rgba
	<pad_choose_script> {<pad_choose_params> diffuse = <diffuse> transition = <transition> dark = <dark> edge = <edge>}
endscript
