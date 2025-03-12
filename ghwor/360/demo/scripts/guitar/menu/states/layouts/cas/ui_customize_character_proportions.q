
script ui_create_customize_character_proportions 
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part>
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	make_generic_car_menu {
		vmenu_id = create_customize_character_proportions_vmenu
		title = qs(0xfa27a70a)
		num_icons = 2
		show_history
		exclusive_device = <state_device>
	}
	get_num_physiques part = <part>
	setup_cas_menu_handlers vmenu_id = create_customize_character_proportions_vmenu camera_list = ['customize_character' 'customize_character_R' 'customize_character_B' 'customize_character_L'] zoom_camera = 'customize_character_Zoom' controller = <state_device>
	if find_physique_number part = <part>
		printstruct <physique_num>
		printf \{qs(0xbbd11188)}
		button_widget_add_item {
			widget_id = physique_widget
			text = qs(0xdad18e9b)
			button_icon = widget_spread
			start_value = <physique_num>
			min = 0
			max = (<num_physiques> -1)
			step = 1
			pad_left_script = update_physique
			pad_left_params = {part = <part> preset_builds = <preset_builds>}
			pad_right_script = update_physique
			pad_right_params = {part = <part> preset_builds = <preset_builds>}
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
				cas_get_bone_slider_value part = <part> group_name = ((($cas_physique_bone_options) [<i>]).group_name)
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
					pad_up_params = {part = <part> group_name = ((($cas_physique_bone_options) [<i>]).group_name) rebuild = 1}
					pad_down_script = update_bone_deformation
					pad_down_params = {part = <part> group_name = ((($cas_physique_bone_options) [<i>]).group_name) rebuild = 1}
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
					part = <part>
					pad_back_script = ui_event
					pad_back_params = {event = menu_back}
				}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	add_car_menu_icon_item {
		icon = widget_default
		text = qs(0xb90eb5a2)
		pad_choose_script = reset_physique_to_default
		pad_choose_params = {part = <part> deform_bones = <deform_bones>}
		pad_choose_sound = audio_null_sound
	}
	cas_bonemenu_begin part = <part>
	menu_finish car_helper_text_back controller = <state_device>
endscript

script ui_destroy_customize_character_proportions 
	destroy_generic_menu
endscript

script ui_init_customize_character_proportions 
	pushtemporarycasappearance
endscript

script ui_deinit_customize_character_proportions 
	cas_bonemenu_exit part = <part>
	poptemporarycasappearance
endscript

script reset_physique_to_default 
	setcasappearancebones part = <part> bones = {}
	get_is_female_from_appearance \{appearance = $cas_current_appearance}
	if (<is_female> = 1)
		desc_id = ($default_custom_musician_profile_female.appearance.cas_female_physique.desc_id)
	else
		desc_id = ($default_custom_musician_profile_male.appearance.cas_male_physique.desc_id)
	endif
	editcasappearance {
		target = setpart
		targetparams = {part = <part> desc_id = <desc_id>}
	}
	rebuildcurrentcasmodel
	soundevent \{event = audio_ui_car_reset}
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
	if find_physique_number part = <part>
		button_widget_set_value widget_id = physique_widget new_value = <physique_num>
	endif
endscript

script check_physique_match 
	requireparams \{[
			new_desc_id
			part
		]
		all}
	if NOT getcasappearancepart part = <part>
		return \{false}
	endif
	if (<desc_id> = <new_desc_id>)
		return \{true}
	endif
	return \{false}
endscript

script update_physique 
	casttointeger \{value}
	if find_physique_desc_id part = <part> value = <value>
		if NOT check_physique_match new_desc_id = <desc_id> part = <part>
			getcasappearancepartinstance part = <part>
			editcasappearance {
				target = setpart
				targetparams = {part = <part> desc_id = <desc_id>}
			}
			if gotparam \{part_instance}
				if structurecontains structure = <part_instance> bones
					setcasappearancebones part = <part> bones = (<part_instance>.bones)
				endif
			endif
			rebuildcurrentcasmodel
		endif
	endif
endscript

script reset_proportion_widget 
	if structurecontains structure = (($cas_physique_bone_options) [<i>]) icon
		formattext checksumname = widget_id 'widget_%i' i = <i>
		button_widget_set_value widget_id = <widget_id> new_value = 0
	endif
endscript

script find_physique_number 
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part>
	endif
	num_presets = 0
	getarraysize $<part>
	i = 0
	begin
	if cas_item_is_visible part = <part> desc_id = (($<part> [<i>]).desc_id)
		if (<desc_id> = (($<part> [<i>]).desc_id))
			return true physique_num = <num_presets>
		endif
		num_presets = (<num_presets> + 1)
	endif
	i = (<i> + 1)
	repeat <array_size>
	printf \{qs(0x4d5c2957)}
	return \{false
		physique_num = 0}
endscript

script find_physique_desc_id 
	num_presets = 0
	getarraysize $<part>
	i = 0
	begin
	if cas_item_is_visible part = <part> desc_id = (($<part> [<i>]).desc_id)
		if (<value> = <num_presets>)
			return true desc_id = (($<part> [<i>]).desc_id)
		endif
		num_presets = (<num_presets> + 1)
	endif
	i = (<i> + 1)
	repeat
	return \{false}
endscript

script get_num_physiques 
	num_presets = 0
	getarraysize $<part>
	i = 0
	begin
	if cas_item_is_visible part = <part> desc_id = (($<part> [<i>]).desc_id)
		num_presets = (<num_presets> + 1)
	endif
	i = (<i> + 1)
	repeat <array_size>
	return num_physiques = <num_presets>
endscript

script find_physique_height \{slider = 0}
	cas_get_bone_slider_value part = <part> group_name = height
	return height = <slider>
endscript
