
script ui_create_recording_disconnect \{training = 0}
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
		options = [
			{
				func = ui_recording_disconnect_continue
				func_params = {<...>}
				text = qs(0x182f0173)
				sound_func = nullscript
			}
			{
				func = ui_recording_disconnect_quit
				text = qs(0x67d9c56d)
				sound_func = nullscript
			}
		]
	endif
	create_popup_warning_menu {
		title = qs(0xaa163738)
		textblock = {
			text = qs(0x00000000)
		}
		options = <options>
		player_device = ($primary_controller)
	}
	popupelement :settags \{is_disconnect_warning = true}
	if (<training> = 1)
		killspawnedscript \{id = jam_tutorial_topic_spawn}
		killspawnedscript \{id = jam_tutorial_spawns}
		training_destroy_narrator_icons
		change \{jam_tutorial_status = inactive}
	endif
	if gotparam \{recording_studio}
		if (<training> = 1)
			popupelement :obj_spawnscript ui_recording_disconnect_update params = {training = <training>}
		else
			popupelement :obj_spawnscript \{ui_recording_studio_disconnect_update}
		endif
	else
		popupelement :obj_spawnscript \{ui_recording_disconnect_update}
	endif
endscript

script ui_destroy_recording_disconnect 
	destroy_popup_warning_menu
endscript

script ui_recording_disconnect_update \{training = 0}
	old_text = qs(0x52122f6e)
	begin
	text = qs(0x00000000)
	getcontrollertype controller = ($primary_controller)
	getactivecontrollers
	<is_active_controller> = (<active_controllers> [($primary_controller)])
	if (((<controller_type> != guitar) && (<controller_type> != drum)) || <is_active_controller> != 1)
		if (<training> = 1)
			text = qs(0x89985c62)
		else
			text = qs(0x50744810)
		endif
	else
		if (<controller_type> = guitar)
			text = (<text> + qs(0x6bb8afcf))
		elseif (<controller_type> = drum)
			if isrbdrum controller = ($primary_controller)
				text = (<text> + qs(0x764e9343))
			else
				text = (<text> + qs(0xa2d3a7a1))
			endif
		endif
	endif
	if NOT (<old_text> = <text>)
		se_setprops {popupbody_text = <text>}
		old_text = <text>
	endif
	wait \{5
		gameframes}
	repeat
endscript

script ui_recording_studio_disconnect_update 
	text = qs(0xe941a4b2)
	se_setprops {popupbody_text = <text>}
endscript

script ui_recording_disconnect_continue 
	if NOT gotparam \{recording_studio}
		getcontrollertype controller = ($primary_controller)
		if NOT ((<controller_type> = guitar) || (<controller_type> = drum))
			menu_scroll_end_sound
			return
		endif
	else
		getactivecontrollers
		<is_active_controller> = (<active_controllers> [($primary_controller)])
		if (<is_active_controller> != 1)
			menu_scroll_end_sound
			return
		endif
	endif
	if ui_event_exists_in_stack \{name = 'jam_tutorials'}
		generic_event_back \{state = uistate_jam_tutorials}
	else
		generic_event_back \{data = {
				editing = 1
			}}
	endif
endscript

script ui_recording_disconnect_quit 
	if ui_event_exists_in_stack \{name = 'jam_tutorials'}
		generic_event_back \{state = uistate_jam_tutorials}
	else
		generic_event_back \{state = uistate_jam_select_song}
	endif
endscript
