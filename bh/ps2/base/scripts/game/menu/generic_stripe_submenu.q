
script 0x2ea532a9 {
		pad_back_script = generic_event_back
		exclusive_device = ($primary_controller)
	}
	set_focus_color
	set_unfocus_color
	if GotParam \{use_all_controllers}
		RemoveParameter \{exclusive_device}
	else
		add_gamertag_helper exclusive_device = <exclusive_device>
	endif
	if ScreenElementExists \{id = 0x4a7ca801}
		DestroyScreenElement \{id = 0x4a7ca801}
	endif
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		id = 0x4a7ca801
		desc = 'generic_stripe_submenu'
		just = [center center]
		exclusive_device = <exclusive_device>
	}
	<0x52db101a> = <id>
	if <0x52db101a> :desc_resolvealias Name = 0x67fed5c0
		AssignAlias id = <resolved_id> alias = current_submenu
	else

	endif
	if NOT <0x52db101a> :desc_resolvealias Name = 0x30a0f2b1 param = 0x074b0076

	endif
	if NOT <0x52db101a> :desc_resolvealias Name = 0x5248ed64 param = 0x34ed1f27

	endif
	if NOT <0x52db101a> :desc_resolvealias Name = 0xea8115f7 param = 0xde5c8feb

	endif
	if GotParam \{option_arrows}
		current_submenu :SetTags \{smooth_morph_time = 0.1}
		current_submenu :se_setprops {
			event_handlers = [
				{pad_up 0x8b8c56fa params = {arrow_id = <0x34ed1f27> up}}
				{pad_up smoothmenuscroll params = {Dir = -1 isvertical = true}}
				{pad_down 0x8b8c56fa params = {arrow_id = <0xde5c8feb> down}}
				{pad_down smoothmenuscroll params = {Dir = 1 isvertical = true}}
				{pad_back <pad_back_script> params = <pad_back_params>}
			]
			loop_view = true
			loop_center = true
		}
	else
		SetScreenElementProps {id = <0x34ed1f27> alpha = 0.0}
		SetScreenElementProps {id = <0xde5c8feb> alpha = 0.0}
		GetScreenElementDims id = <0x074b0076>
		dims = ((<width> * (1.0, 0.0)) + (0.0, 512.0))
		SetScreenElementProps {id = <0x074b0076> dims = <dims>}
		current_submenu :se_setprops {
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
				{pad_back <pad_back_script> params = <pad_back_params>}
			]
		}
	endif
	return \{VMenu = 0x4a7ca801}
endscript

script 0x7f9ab085 
	if ScreenElementExists \{id = 0x4a7ca801}
		DestroyScreenElement \{id = 0x4a7ca801}
	endif
	clean_up_user_control_helpers
endscript
