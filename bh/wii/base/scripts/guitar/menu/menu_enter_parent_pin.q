parent_pin_index = 0
parent_pin_numbers = 4
parent_pin_values = [
	0
	0
	0
	0
]

script parent_pin_make_helpers 
	add_user_control_helper \{button = green
		text = $wii_next
		z = 1500}
	add_user_control_helper \{button = red
		text = $wii_back
		z = 1500}
	add_user_control_helper \{button = start
		text = $wii_dlc_pin_confirm
		z = 1500}
	AssignAlias id = <helper_pill_id> alias = confirm_pin_text
	SetScreenElementProps \{id = confirm_pin_text
		helper_description_rgba = [
			192
			0
			0
			255
		]}
endscript

script destroy_enter_parent_pin_menu 
	ScriptAssert \{'destroy_enter_parent_pin_menu: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script confirm_parent_pin 
	if (($parent_pin_index + 1) = $parent_pin_numbers)
		parent_pin_post_confirm
	endif
endscript

script parent_pin_post_confirm 
	menu_epp_get_parent_pin_text
	parent_pin_done pin_text = <pin_text>
endscript

script parent_pin_done \{pin_text = ''}
	dialog_box_desc_id :GetTags
	destroy_dialog_box
	clean_up_user_control_helpers
	SpawnScriptNow <pin_callback> params = {pin = <pin_text>}
endscript

script get_parent_pin_entry_center_pos 
	ScriptAssert \{'get_parent_pin_entry_center_pos: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script enter_parent_pin_change_character 
	if GotParam \{device_num}
		if IsGuitarController controller = <device_num>
			if GotParam \{up}
				change_parent_pin_character \{Dir = -1}
			else
				change_parent_pin_character \{Dir = 1}
			endif
		else
			if GotParam \{up}
				change_parent_pin_character \{Dir = 1}
			else
				change_parent_pin_character \{Dir = -1}
			endif
		endif
	endif
endscript

script change_parent_pin_character 
	if (<Dir> > 0)
		generic_menu_up_or_down_sound \{up}
	else
		generic_menu_up_or_down_sound \{down}
	endif
	SetArrayElement ArrayName = parent_pin_values globalarray index = $parent_pin_index NewValue = ($parent_pin_values [$parent_pin_index] + <Dir>)
	if ($parent_pin_values [$parent_pin_index] > 9)
		SetArrayElement \{ArrayName = parent_pin_values
			globalarray
			index = $parent_pin_index
			NewValue = 0}
	elseif ($parent_pin_values [$parent_pin_index] < 0)
		SetArrayElement \{ArrayName = parent_pin_values
			globalarray
			index = $parent_pin_index
			NewValue = 9}
	endif
	menu_epp_refresh_parent_pin
endscript

script parent_pin_advance_pointer 
	if (($parent_pin_index + 1) < $parent_pin_numbers)
		generic_menu_pad_choose_sound
		Change parent_pin_index = ($parent_pin_index + 1)
		menu_epp_refresh_parent_pin
	endif
endscript

script parent_pin_retreat_pointer \{back_button_script = generic_event_back}
	if ($parent_pin_index = 0)
		<back_button_script>
	endif
	if (($parent_pin_index -1) > -1)
		generic_menu_pad_back_sound
		Change parent_pin_index = ($parent_pin_index -1)
		menu_epp_refresh_parent_pin
	endif
endscript

script menu_epp_get_parent_pin_text 
	parent_pin_text = ''
	index = 0
	begin
	formatText TextName = parent_pin_text '%p%n' p = <parent_pin_text> n = ($parent_pin_values [<index>])
	<index> = (<index> + 1)
	repeat ($parent_pin_numbers)
	return pin_text = <parent_pin_text>
endscript

script menu_epp_refresh_parent_pin 
	if NOT ScreenElementExists \{id = confirm_pin_text}
		parent_pin_make_helpers
	endif
	if (($parent_pin_index + 1) = $parent_pin_numbers)
		SetScreenElementProps \{id = confirm_pin_text
			helper_description_rgba = [
				0
				192
				0
				255
			]}
	else
		SetScreenElementProps \{id = confirm_pin_text
			helper_description_rgba = [
				192
				0
				0
				255
			]}
	endif
	index = ($parent_pin_index)
	i = 0
	begin
	ResolveScreenElementID id = {dialog_box_vmenu child = {<i> child = num}}
	if (<i> = <index>)
		formatText TextName = num_text qs(0xb22939c6) n = ($parent_pin_values [<i>])
	else
		<num_text> = qs(0xd14d2128)
	endif
	<resolved_id> :se_setprops text = <num_text>
	<i> = (<i> + 1)
	repeat ($parent_pin_numbers)
	menu_epp_update_marker
endscript

script menu_epp_update_marker 
	<index> = ($parent_pin_index)
	ResolveScreenElementID id = {dialog_box_vmenu child = <index>}
	alias_arrow_container :se_setprops parent = <resolved_id> Pos = (0.0, 0.0) pos_anchor = [center center] just = [center center]
endscript

script tmp_dlc_pin_script 
	printstruct <...>
	SpawnScriptNow music_store_purchase_accepted params = {pin = <pin>}
endscript
