
script restore_group_defaults 

	if NOT getcasappearancepart part = <part>

	endif
	cas_bonemenu_exit \{part = cas_body}
	if GotParam \{bones}
		SoundEvent \{event = character_reset}
		GetArraySize \{option_array}
		i = 0
		begin
		if StructureContains structure = (<option_array> [<i>]) group_name
			if StructureContains structure = bones Name = ((<option_array> [<i>]).group_name)
				RemoveComponent structure_name = bones Name = ((<option_array> [<i>]).group_name)
			endif
		elseif StructureContains structure = (<option_array> [<i>]) part
			if checksumequals a = ((<option_array> [<i>]).part) b = cas_eyes
				cas_add_item_to_appearance \{part = cas_eyes
					desc_id = eyes_blue}
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	cas_bonemenu_begin \{part = cas_body}
	setcasappearancebones part = <part> bones = <bones>
	cas_bonemenu_apply_changes
	GetArraySize \{option_array}
	i = 0
	begin
	if StructureContains structure = ((<option_array>) [<i>]) bonemenu
		formatText checksumName = widget_id 'widget_%i' i = <i>
		cas_get_bone_slider_value part = cas_body group_name = ((<option_array> [<i>]).group_name)
		button_widget_set_value widget_id = <widget_id> new_value = <slider>
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script update_bone_deformation 

	getcasappearancepart part = <part>
	if NOT GotParam \{bones}
		bones = {}
	endif
	updatestructelement struct = <bones> element = <group_name> value = <value>
	setcasappearancebones part = <part> bones = <newstruct>
	updatecurrentcasmodel buildscript = reskin_model_from_appearance buildscriptparams = {kill_objects = <kill_objects>}
endscript
