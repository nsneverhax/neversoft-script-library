
script ui_create_customize_character_proportions 
	if NOT getcasappearancepart \{part = cas_physique}
		scriptassert \{'%s not found'
			s = cas_physique}
	endif
	if NOT getactualcasoptionstruct part = cas_physique desc_id = <desc_id>
		scriptassert '%s %t not found' s = cas_physique t = <desc_id>
	endif
	make_generic_menu \{vmenu_id = create_customize_character_proportions_vmenu
		title = qs(0xfbc67840)
		num_icons = 2
		show_history}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_proportions_vmenu
		camera_list = [
			'customize_character'
			'customize_character_R'
			'customize_character_B'
			'customize_character_L'
		]
		zoom_camera = 'customize_character_Zoom'}
	if gotparam \{preset_builds}
		find_phyique_number
		printstruct <physique_num>
		printf \{qs(0xbbd11188)}
		getarraysize \{preset_builds}
		button_widget_add_item {
			widget_id = physique_widget
			text = qs(0xdad18e9b)
			button_icon = widget_spread
			start_value = <physique_num>
			min = 0
			max = (<array_size> -1)
			step = 1
			pad_left_script = update_physique
			pad_left_params = {part = cas_physique preset_builds = <preset_builds>}
			pad_right_script = update_physique
			pad_right_params = {part = cas_physique preset_builds = <preset_builds>}
			fill_type = `left to right`
			deinit_script = widget_restore_cap
			accept_script = widget_accept_cap
			init_script = widget_init_cap
			camera_list = ['customize_character' 'customize_character_R' 'customize_character_B' 'customize_character_L']
			zoom_camera = 'customize_character_Zoom'
		}
	endif
	getarraysize ($cas_physique_bone_options)
	i = 0
	begin
	if structurecontains structure = (($cas_physique_bone_options) [<i>]) bonemenu
		if find_bone_deform_info deform_bones = (<deform_bones>) group_name = ((($cas_physique_bone_options) [<i>]).group_name)
			if structurecontains structure = (($cas_physique_bone_options) [<i>]) icon
				cas_get_bone_slider_value part = cas_physique group_name = ((($cas_physique_bone_options) [<i>]).group_name)
				formattext checksumname = widget_id 'widget_%i' i = <i>
				button_widget_add_item {
					widget_id = <widget_id>
					text = ((($cas_physique_bone_options) [<i>]).text)
					button_icon = ((($cas_physique_bone_options) [<i>]).icon)
					min = <min_slider>
					max = <max_slider>
					start_value = <slider>
					step = ((($cas_physique_bone_options) [<i>]).step)
					pad_up_script = update_bone_deformation
					pad_up_params = {part = cas_physique group_name = ((($cas_physique_bone_options) [<i>]).group_name)}
					pad_down_script = update_bone_deformation
					pad_down_params = {part = cas_physique group_name = ((($cas_physique_bone_options) [<i>]).group_name)}
					fill_type = ((($cas_physique_bone_options) [<i>]).fill_type)
					deinit_script = widget_restore_cap
					accept_script = widget_accept_cap
					init_script = widget_init_cap
					camera_list = ['customize_character' 'customize_character_R' 'customize_character_B' 'customize_character_L']
					zoom_camera = 'customize_character_Zoom'
				}
			else
				cas_create_bonemenu_slider {
					deform_info = <bone_deform_info>
					part = cas_physique
					pad_back_script = ui_event
					pad_back_params = {event = menu_back}
				}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	add_generic_menu_icon_item {
		icon = widget_default
		text = qs(0xb90eb5a2)
		pad_choose_script = reset_physique_to_default
		pad_choose_params = {part = cas_physique deform_bones = <deform_bones>}
		pad_choose_sound = nullsound
	}
	cas_bonemenu_begin \{part = cas_physique}
	menu_finish \{car_helper_text_back}
endscript

script ui_destroy_customize_character_proportions 
	destroy_generic_menu
	if scriptisrunning \{disable_rotate_during_reset}
		killspawnedscript \{disable_rotate_during_reset}
	endif
	change \{generic_menu_block_input = 0}
	change \{resetting_physique = false}
endscript

script ui_init_customize_character_proportions 
	pushtemporarycasappearance
endscript

script ui_deinit_customize_character_proportions 
	cas_bonemenu_exit \{part = cas_physique}
	poptemporarycasappearance
endscript

script disable_rotate_during_reset 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	event_handlers = []
	addarrayelement array = <event_handlers> element = {{pad_r1 nullscript params = {}}}
	addarrayelement array = <array> element = {{pad_l1 nullscript params = {}}}
	addarrayelement array = <array> element = {{pad_r2 nullscript params = {}}}
	event_handlers = <array>
	setscreenelementprops {
		id = create_customize_character_proportions_vmenu
		event_handlers = <event_handlers>
		replace_handlers
	}
	wait \{1
		second}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_proportions_vmenu
		camera_list = [
			'customize_character'
			'customize_character_R'
			'customize_character_B'
			'customize_character_L'
		]
		zoom_camera = 'customize_character_Zoom'}
endscript
resetting_physique = false

script reset_physique_to_default 
	if (($resetting_physique = true) || ($camera_is_cutting = true))
		return
	endif
	printf \{channel = kim
		qs(0x746393f4)}
	change \{resetting_physique = true}
	wait \{5
		gameframe}
	stoprendering
	reset_bone_deform_info part = <part>
	reset_additional_bone_deform_info part = <part>
	set_new_car_preset_physique
	updatecurrentcasmodel \{buildscript = reskin_model_from_appearance}
	soundevent \{event = character_reset}
	getarraysize ($cas_physique_bone_options)
	i = 0
	begin
	if structurecontains structure = (($cas_physique_bone_options) [<i>]) bonemenu
		cas_refresh_given_bone_slider {
			part = <part>
			deform_array = <deform_bones>
			group_name = ((($cas_physique_bone_options) [<i>]).group_name)
		}
		reset_proportion_widget i = <i> deform_array = <deform_bones>
	endif
	i = (<i> + 1)
	repeat <array_size>
	button_widget_set_value widget_id = physique_widget new_value = <preset_physique_index>
	wait \{3
		gameframe}
	startrendering
	wait \{5
		gameframe}
	change \{resetting_physique = false}
	printf \{channel = kim
		qs(0x39dde628)}
endscript

script update_physique 
	getcasappearancepart part = <part>
	casttointeger \{value}
	setcasappearanceadditionalbones part = <part> additional_bone_transforms = (<preset_builds> [<value>].additional_bone_transforms)
	updatecurrentcasmodel buildscript = reskin_model_from_appearance buildscriptparams = {kill_objects = <kill_objects>}
endscript

script reset_proportion_widget 
	if structurecontains structure = (($cas_physique_bone_options) [<i>]) icon
		formattext checksumname = widget_id 'widget_%i' i = <i>
		button_widget_set_value widget_id = <widget_id> new_value = 0
	endif
endscript

script find_phyique_number 
	if NOT getcasappearancepart \{part = cas_physique}
		scriptassert \{'%s not found'
			s = cas_physique}
	endif
	if NOT getactualcasoptionstruct part = cas_physique desc_id = <desc_id>
		scriptassert '%s %t not found' s = cas_physique t = <desc_id>
	endif
	if gotparam \{additional_bone_transforms}
		generatechecksumfromarray \{arrayname = additional_bone_transforms}
		add_bone_checksum = <array_checksum>
		if gotparam \{preset_builds}
			getarraysize <preset_builds>
			i = 0
			begin
			preset_bones = ((<preset_builds> [<i>]).additional_bone_transforms)
			generatechecksumfromarray \{arrayname = preset_bones}
			if (checksumequals a = <add_bone_checksum> b = <array_checksum>)
				printf qs(0x90df78c6) i = <i>
				return physique_num = <i>
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	printf \{qs(0x4d5c2957)}
	return \{physique_num = 0}
endscript

script find_physique_height \{slider = 0}
	cas_get_bone_slider_value \{part = cas_physique
		group_name = height}
	return height = <slider>
endscript
