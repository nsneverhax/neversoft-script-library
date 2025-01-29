any_controller_is_polling = FALSE

script pointer_start_polling device_num = ($primary_controller)
	RequireParams \{[
			device_num
		]
		all}
	pointer_stop_polling device_num = <device_num>
	formatText checksumName = pointer_id 'pointerp%d' d = (<device_num> + 1)
	CreateScreenElement {
		parent = root_window
		Type = SpriteElement
		id = <pointer_id>
		texture = <pointer_id>
		rgba = [255 255 255 255]
		z_priority = 101010
		pos_anchor = [left , top]
		just = [left , top]
		Pos = (0.0, 0.0)
		alpha = 0.0
	}
	RunScriptOnScreenElement pointer_poll_controller id = <pointer_id> params = {device_num = <device_num>}
	Change \{any_controller_is_polling = true}
endscript

script pointer_stop_polling device_num = ($primary_controller)
	RequireParams \{[
			device_num
		]
		all}
	formatText checksumName = pointer_id 'pointerp%d' d = (<device_num> + 1)
	if ScreenElementExists id = <pointer_id>
		DestroyScreenElement id = <pointer_id>
	endif
	found_polling_controller = FALSE
	index = 0
	begin
	formatText checksumName = pointer_id 'pointerp%d' d = (<index> + 1)
	if ScreenElementExists id = <pointer_id>
		<found_polling_controller> = true
	endif
	<index> = (<index> + 1)
	repeat 4
	if (<found_polling_controller> = FALSE)
		Change \{any_controller_is_polling = FALSE}
	endif
endscript

script pointer_click_handler 
	if NOT GotParam \{device_num}
		device_num = 0
	endif
	if ($any_controller_is_polling = FALSE)
		return
	endif
	getpointerhitlist controller = <device_num>
	GetArraySize <id_list>
	if (<array_Size> = 0)
		getlowestfocusedchild controller = <device_num>
		if GotParam \{lowest_id}
			if NOT (<lowest_id> = 0x00000000)
				LaunchEvent Type = pad_choose target = <lowest_id>
			endif
		endif
		return
	endif
	index = 0
	event_handled = FALSE
	begin
	element_id = (<id_list> [<index>])
	<element_id> :GetTags
	if GotParam \{is_helper_pill}
		if GotParam \{click_button}
			LaunchEvent Type = pad_click target = <element_id> data = {device_num = <device_num>}
			<event_handled> = true
			break
		endif
	endif
	if GotParam \{ignore_click_focus}
		LaunchEvent Type = pad_click target = <element_id>
		<event_handled> = true
		break
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	if (<event_handled> = FALSE)
		getlowestfocusedchild controller = <device_num>
		if NOT (<lowest_id> = 0x00000000)
			<index> = 0
			begin
			element_id = (<id_list> [<index>])
			if (<lowest_id> = <element_id>)
				LaunchEvent Type = pad_choose target = <lowest_id>
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
	endif
endscript
pointer_grabbing = [
	FALSE
	FALSE
	FALSE
	FALSE
]
pointer_grabbed_id = [
	None
	None
	None
	None
]
pointer_grab_x_count = [
	0.0
	0.0
	0.0
	0.0
]
pointer_grab_y_count = [
	0.0
	0.0
	0.0
	0.0
]
pointer_drag_down_limit = 0.15
pointer_drag_up_limit = -0.15
pointer_grab_initial_x = 0.0
pointer_grab_initial_y = 0.0
pointer_grab_deadzone_x = 0.04
pointer_grab_deadzone_y = 0.04
pointer_grab_scale_x = 30.0
pointer_grab_scale_y = 30.0
use_rubber_band_scrolling = 1

script pointer_grab 
	if NOT GotParam \{device_num}
		device_num = 0
	endif
	getpointerhitlist controller = <device_num>
	GetArraySize <id_list>
	if (<array_Size> = 0)
		return
	endif
	index = 0
	begin
	element_id = (<id_list> [<index>])
	<element_id> :GetTags
	if GotParam \{pointer_grabbable}
		if isscreenelementinfocus id = <element_id>
			SetArrayElement ArrayName = pointer_grabbing globalarray index = <device_num> NewValue = true
			SetArrayElement ArrayName = pointer_grabbed_id globalarray index = <device_num> NewValue = <element_id>
			if ($use_rubber_band_scrolling = 1)
				getpointerinfo controller = <device_num>
				Change pointer_grab_initial_x = <pointerx>
				Change pointer_grab_initial_y = <pointery>
			endif
			break
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
endscript

script pointer_release 
	if NOT GotParam \{device_num}
		device_num = 0
	endif
	SetArrayElement ArrayName = pointer_grabbing globalarray index = <device_num> NewValue = FALSE
	SetArrayElement ArrayName = pointer_grabbed_id globalarray index = <device_num> NewValue = None
endscript
pointer_update_focus = 1

script pointer_suspend_focus_change 
	Change \{pointer_update_focus = 0}
endscript

script pointer_resume_focus_change 
	Change \{pointer_update_focus = 1}
endscript

script pointer_poll_controller 
	RequireParams \{[
			device_num
		]
		all}
	screenelement_res_x = 640.0
	screenelement_res_y = 360.0
	index = 0
	pixel_x = 0.0
	pixel_y = 0.0
	pixel_pos = (0.0, 0.0)
	pointerx = 0.0
	pointery = 0.0
	pointerdiffx = 0.0
	pointerdiffy = 0.0
	pointervalid = FALSE
	old_pointervalid = FALSE
	old_horizon_x = 0.0
	old_horizon_y = 0.0
	old_pointer_x = [0.0 0.0 0.0]
	old_pointer_y = [0.0 0.0 0.0]
	old_pos_diff_x = 0.0
	old_pos_diff_y = 0.0
	invert = FALSE
	cached_focus_id = None
	cached_hover_id = None
	pointer_data_index = 0
	use_grabbable_hand = FALSE
	formatText checksumName = pointer_id 'pointerp%d' d = (<device_num> + 1)
	begin
	<update_focus> = ($pointer_update_focus)
	<grabbing> = ($pointer_grabbing [<device_num>])
	<old_pointervalid> = <pointervalid>
	<old_pos_diff_x> = <pointerdiffx>
	<old_pos_diff_y> = <pointerdiffy>
	getpointerinfo controller = <device_num>
	<alpha> = 0.0
	if (<pointervalid> = true)
		<pixel_x> = ((<pointerx> * <screenelement_res_x>) + <screenelement_res_x>)
		<pixel_y> = ((<pointery> * <screenelement_res_y>) + <screenelement_res_y>)
		<pixel_pos> = ((<pixel_x> * (1.0, 0.0)) + (<pixel_y> * (0.0, 1.0)))
		<Pos> = <pixel_pos>
		<alpha> = 1.0
		<use_grabbable_hand> = FALSE
		getpointerhitlist controller = <device_num>
		GetArraySize <id_list>
		if (<array_Size> > 0)
			index = 0
			<found_hover_id> = FALSE
			if ((<update_focus> = 1) && (<grabbing> = FALSE))
				begin
				element_id = (<id_list> [<index>])
				<element_id> :GetTags
				if GotParam \{pointer_focusable}
					if (<pointer_focusable> = true)
						if GotParam \{alternate_focus_id}
							<element_id> = <alternate_focus_id>
						endif
						if NOT isscreenelementinfocus id = <element_id>
							if isscreenelementinfocus id = <cached_focus_id>
								if ((<cached_focus_id> != <element_id>) && (<cached_focus_id> != root_window))
									LaunchEvent Type = unfocus target = <cached_focus_id> controller = <device_num>
								endif
							else
								getlowestfocusedchild controller = <device_num>
								if ((GotParam lowest_id) && (<lowest_id> != 0x00000000) && (<lowest_id> != root_window))
									LaunchEvent Type = unfocus target = <lowest_id>
								endif
							endif
							if (<cached_focus_id> != <element_id>)
								<cached_focus_id> = <element_id>
								LaunchEvent Type = focus target = <element_id> data = {controller = <device_num> pointer_focus}
								RemoveParameter \{pointer_focusable}
								break
							endif
						endif
					endif
				elseif ((GotParam pointer_grabbable) && (isscreenelementinfocus id = <element_id>))
					<use_grabbable_hand> = true
				endif
				RemoveParameter \{pointer_focusable}
				RemoveParameter \{pointer_grabbable}
				if GotParam \{pointer_hoverable}
					<found_hover_id> = true
					if NOT (<element_id> = <cached_hover_id>)
						<cached_hover_id> = <element_id>
						if NOT GotParam \{hover_params}
							hover_params = {}
						endif
						if GotParam \{hover_script}
							<hover_script> <hover_params>
						endif
					endif
					RemoveParameter \{pointer_hoverable}
					break
				endif
				<index> = (<index> + 1)
				repeat <array_Size>
				if (<found_hover_id> = FALSE)
					<cached_hover_id> = None
				endif
			endif
		endif
	endif
	formatText checksumName = pointer_texture 'pointerp%d' d = (<device_num> + 1)
	if (<grabbing> = true)
		formatText checksumName = pointer_texture 'pointerp%d_grabbing' d = (<device_num> + 1)
	elseif (<update_focus> = 0)
		formatText checksumName = pointer_texture 'pointerp%d_paddable' d = (<device_num> + 1)
	elseif (<use_grabbable_hand> = true)
		formatText checksumName = pointer_texture 'pointerp%d_grabbable' d = (<device_num> + 1)
	endif
	<pointer_id> :se_setprops Pos = <Pos> texture = <pointer_texture> alpha = <alpha>
	if (<pointervalid> = FALSE)
		<pointerdiffx> = <old_pos_diff_x>
		<pointerdiffy> = <old_pos_diff_y>
	endif
	if (<grabbing> = true)
		if ($use_rubber_band_scrolling = 1)
			<diff_x> = (<pointerx> - ($pointer_grab_initial_x))
			<diff_y> = (<pointery> - ($pointer_grab_initial_y))
			absolutevalue value = <diff_x>
			if (<value> < ($pointer_grab_deadzone_x))
				<diff_x> = 0.0
			endif
			absolutevalue value = <diff_y>
			if (<value> < ($pointer_grab_deadzone_y))
				<diff_y> = 0.0
			endif
			<diff_x> = (<diff_x> / ($pointer_grab_scale_x))
			<diff_y> = (<diff_y> / ($pointer_grab_scale_y))
		else
			<diff_x> = <pointerdiffx>
			<diff_y> = <pointerdiffy>
		endif
		grab_x = (($pointer_grab_x_count) [<device_num>])
		grab_y = (($pointer_grab_y_count) [<device_num>])
		<grab_x> = (<grab_x> + <diff_x>)
		<grab_y> = (<grab_y> + <diff_y>)
		SetArrayElement ArrayName = pointer_grab_x_count globalarray index = <device_num> NewValue = <grab_x>
		SetArrayElement ArrayName = pointer_grab_y_count globalarray index = <device_num> NewValue = <grab_y>
		drag_id = (($pointer_grabbed_id) [<device_num>])
		if (<drag_id> != None)
			if (<grab_y> > ($pointer_drag_down_limit))
				begin
				<grab_y> = (<grab_y> - ($pointer_drag_down_limit))
				if (<grab_y> < ($pointer_drag_down_limit))
					break
				endif
				repeat
				LaunchEvent Type = pad_down target = <drag_id>
				SetArrayElement ArrayName = pointer_grab_y_count globalarray index = <device_num> NewValue = <grab_y>
			elseif (<grab_y> < ($pointer_drag_up_limit))
				begin
				<grab_y> = (<grab_y> - ($pointer_drag_up_limit))
				if (<grab_y> > ($pointer_drag_up_limit))
					break
				endif
				repeat
				LaunchEvent Type = pad_up target = <drag_id>
				SetArrayElement ArrayName = pointer_grab_y_count globalarray index = <device_num> NewValue = <grab_y>
			endif
		endif
	else
		SetArrayElement ArrayName = pointer_grab_x_count globalarray index = <device_num> NewValue = 0.0
		SetArrayElement ArrayName = pointer_grab_y_count globalarray index = <device_num> NewValue = 0.0
		Change \{pointer_grab_initial_x = 0.0}
		Change \{pointer_grab_initial_y = 0.0}
	endif
	Wait \{1
		gameframes}
	repeat
endscript
