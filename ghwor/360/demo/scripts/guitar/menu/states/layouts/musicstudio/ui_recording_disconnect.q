
script ui_create_recording_disconnect \{training = 0}
	destroy_loading_screen
	getcontrollertype controller = ($primary_controller)
	if gotparam \{recording_studio}
		options = [
			{
				func = ui_recording_disconnect_continue
				func_params = {<...>}
				text = qs(0x0e41fe46)
				sound_func = nullscript
			}
		]
	else
		if ((<controller_type> = guitar) || (<controller_type> = drum))
			options = [
				{
					func = ui_recording_disconnect_continue
					func_params = {<...>}
					text = qs(0x182f0173)
					sound_func = nullscript
				}
				{
					func = ui_recording_disconnect_quit
					func_params = {<...>}
					text = qs(0x67d9c56d)
					sound_func = nullscript
				}
			]
		else
			options = [
				{
					func = ui_recording_disconnect_quit
					func_params = {<...>}
					text = qs(0x320a8d1c)
					sound_func = nullscript
				}
			]
		endif
	endif
	create_dialog_box {
		heading_text = qs(0xaa163738)
		body_text = qs(0x00000000)
		options = <options>
		player_device = ($primary_controller)
	}
	dialog_box_desc_id :settags \{is_disconnect_warning = true}
	getactivecontrollers
	<is_active_controller> = (<active_controllers> [($primary_controller)])
	if ((<controller_type> != guitar) && (<controller_type> != drum) && (<is_active_controller> = 1))
		dialog_box_desc_id :obj_spawnscript \{ui_recording_enter_with_standard_controller}
	else
		if gotparam \{recording_studio}
			if (<training> = 1)
				dialog_box_desc_id :obj_spawnscript ui_recording_disconnect_update params = {training = <training>}
			else
				dialog_box_desc_id :obj_spawnscript \{ui_recording_studio_disconnect_update}
			endif
		else
			dialog_box_desc_id :obj_spawnscript \{ui_recording_disconnect_update}
		endif
	endif
endscript

script ui_destroy_recording_disconnect 
	destroy_dialog_box
endscript

script ui_recording_enter_with_standard_controller 
	old_text = qs(0x56fd5c7a)
	begin
	text = qs(0x00000000)
	getcontrollertype controller = ($primary_controller)
	getactivecontrollers
	<is_active_controller> = (<active_controllers> [($primary_controller)])
	if (((<controller_type> != guitar) && (<controller_type> != drum)) || <is_active_controller> != 1)
		text = qs(0x34e34247)
	else
		ui_event_wait \{event = menu_replace
			state = uistate_recording_disconnect}
	endif
	if NOT (<old_text> = <text>)
		se_setprops {dlog_body_text = <text>}
		old_text = <text>
	endif
	wait \{5
		gameframes}
	repeat
endscript

script ui_recording_disconnect_update \{training = 0}
	old_text = qs(0x52122f6e)
	<first_time> = 1
	begin
	text = qs(0x00000000)
	getcontrollertype controller = ($primary_controller)
	getactivecontrollers
	<is_active_controller> = (<active_controllers> [($primary_controller)])
	if (((<controller_type> != guitar) && (<controller_type> != drum)) || <is_active_controller> != 1)
		if (<training> = 1)
			text = qs(0x989843f7)
		else
			text = qs(0x30e38cfc)
		endif
	else
		if (<controller_type> = guitar)
			text = (<text> + qs(0x6bb8afcf))
		elseif (<controller_type> = drum)
			text = (<text> + qs(0x16da69a0))
		endif
	endif
	if NOT (<old_text> = <text>)
		if (<first_time> = 0)
			ui_event_wait \{event = menu_replace
				state = uistate_recording_disconnect}
		else
			se_setprops {dlog_body_text = <text>}
			old_text = <text>
		endif
		<first_time> = 0
	endif
	wait \{5
		gameframes}
	repeat
endscript

script ui_recording_studio_disconnect_update 
	text = qs(0x9c833031)
	se_setprops {dlog_body_text = <text>}
endscript

script ui_recording_disconnect_continue 
	if NOT gotparam \{recording_studio}
		getcontrollertype controller = ($primary_controller)
		if NOT ((<controller_type> = guitar) || (<controller_type> = drum))
			ui_sfx \{menustate = ghmix
				uitype = scrollendwarning}
			return
		endif
	else
		getactivecontrollers
		<is_active_controller> = (<active_controllers> [($primary_controller)])
		if (<is_active_controller> != 1)
			ui_sfx \{menustate = ghmix
				uitype = scrollendwarning}
			return
		endif
	endif
	generic_event_back \{data = {
			editing = 1
		}}
endscript

script ui_recording_disconnect_quit 
	if gotparam \{jamroom_new_functionallity}
		jam_band_pause_quit \{force_event = true}
	else
		generic_event_back \{state = uistate_jam_select_song}
	endif
endscript
