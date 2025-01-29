gallery_image_array = [
	gallery_01
	gallery_02
	gallery_03
	gallery_04
	gallery_05
	gallery_06
	gallery_07
	gallery_08
	gallery_09
	gallery_10
]
gallery_image_index = 0
gallery_swap_index = 0

script ui_create_gallery 
	CreateScreenElement {
		Type = descinterface
		desc = 'gallery'
		parent = root_window
		id = current_menu_anchor
		gallery_pho0_texture = ($gallery_image_array [($gallery_image_index)])
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_up ui_gallery_switch params = {up}}
			{pad_down ui_gallery_switch params = {down}}
			{pad_back generic_event_back}
		]
		just = [center center]
	}
	<id> :se_getprops arrow_up_pos arrow_up_scale arrow_up_rgba
	<id> :se_getprops arrow_down_pos arrow_down_scale arrow_down_rgba
	<id> :SetTags {
		org_arrow_up_pos = <arrow_up_pos>
		org_arrow_up_scale = <arrow_up_scale>
		org_arrow_up_rgba = <arrow_up_rgba>
		org_arrow_down_pos = <arrow_down_pos>
		org_arrow_down_scale = <arrow_down_scale>
		org_arrow_down_rgba = <arrow_down_rgba>
	}
	Change \{gallery_swap_index = 0}
	LaunchEvent \{Type = focus
		target = current_menu_anchor}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ui_destroy_gallery 
	if ScreenElementExists \{id = current_menu_anchor}
		DestroyScreenElement \{id = current_menu_anchor}
	endif
	clean_up_user_control_helpers
endscript

script ui_gallery_switch 
	GetArraySize ($gallery_image_array)
	if GotParam \{up}
		Change gallery_swap_index = (1 - $gallery_swap_index)
		Change gallery_image_index = ($gallery_image_index - 1)
		if ($gallery_image_index < 0)
			Change gallery_image_index = (<array_Size> - 1)
		endif
		SpawnScriptNow \{gallery_pulse_up_arrow}
	elseif GotParam \{down}
		Change gallery_swap_index = (1 - $gallery_swap_index)
		Change gallery_image_index = ($gallery_image_index + 1)
		if ($gallery_image_index >= <array_Size>)
			Change \{gallery_image_index = 0}
		endif
		SpawnScriptNow \{gallery_pulse_down_arrow}
	endif
	if ($gallery_swap_index = 0)
		se_setprops gallery_pho0_texture = (($gallery_image_array) [($gallery_image_index)])
		se_setprops \{gallery_pho0_alpha = 1
			time = 0.1}
		se_setprops \{gallery_pho1_alpha = 0
			time = 0.1}
	else
		se_setprops gallery_pho1_texture = (($gallery_image_array) [($gallery_image_index)])
		se_setprops \{gallery_pho1_alpha = 1
			time = 0.1}
		se_setprops \{gallery_pho0_alpha = 0
			time = 0.1}
	endif
endscript

script gallery_pulse_up_arrow 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	current_menu_anchor :GetTags
	current_menu_anchor :se_setprops arrow_up_pos = <org_arrow_up_pos> arrow_up_scale = <org_arrow_up_scale> arrow_up_rgba = <org_arrow_up_rgba>
	current_menu_anchor :se_setprops \{arrow_up_pos = {
			relative
			(0.0, -15.0)
		}
		time = 0.1}
	current_menu_anchor :se_setprops \{arrow_up_scale = (1.2, 1.2)
		time = 0.1}
	current_menu_anchor :se_setprops \{arrow_up_rgba = [
			200
			50
			50
			255
		]
		time = 0.1}
	Wait \{0.1
		Seconds}
	current_menu_anchor :se_setprops arrow_up_pos = <org_arrow_up_pos> arrow_up_scale = <org_arrow_up_scale> arrow_up_rgba = <org_arrow_up_rgba> time = 0.1
	Wait \{0.1
		Seconds}
endscript

script gallery_pulse_down_arrow 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	current_menu_anchor :GetTags
	current_menu_anchor :se_setprops arrow_down_pos = <org_arrow_down_pos> arrow_down_scale = <org_arrow_down_scale> arrow_down_rgba = <org_arrow_down_rgba>
	current_menu_anchor :se_setprops \{arrow_down_pos = {
			relative
			(0.0, 15.0)
		}
		time = 0.1}
	current_menu_anchor :se_setprops \{arrow_down_scale = (1.2, 1.2)
		time = 0.1}
	current_menu_anchor :se_setprops \{arrow_down_rgba = [
			200
			50
			50
			255
		]
		time = 0.1}
	Wait \{0.1
		Seconds}
	current_menu_anchor :se_setprops arrow_down_pos = <org_arrow_down_pos> arrow_down_scale = <org_arrow_down_scale> arrow_down_rgba = <org_arrow_down_rgba> time = 0.1
	Wait \{0.1
		Seconds}
endscript

script ui_gallery_anim_in 
	menu_transition_in \{menu = current_menu_anchor}
endscript

script ui_gallery_anim_out 
	menu_transition_out \{menu = current_menu_anchor}
endscript
