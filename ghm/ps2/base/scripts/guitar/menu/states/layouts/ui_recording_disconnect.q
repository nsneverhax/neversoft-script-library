
script ui_create_recording_disconnect \{training = 0}
	if 0x8658e568
		destroy_loading_screen
	endif
	if (<training> = 1)
		options = [
			{
				func = ui_recording_disconnect_quit
				func_params = {<...>}
				text = qs(0x67d9c56d)
				sound_func = nullscript
			}
		]
	elseif GotParam \{recording_studio}
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
	popupelement :SetTags \{is_disconnect_warning = true}
	if (<training> = 1)
		KillSpawnedScript \{id = jam_tutorial_topic_spawn}
		KillSpawnedScript \{id = jam_tutorial_spawns}
		training_destroy_narrator_icons
		Change \{jam_tutorial_status = inactive}
	endif
	if GotParam \{recording_studio}
		if (<training> = 1)
			popupelement :obj_spawnscript ui_recording_disconnect_update params = {training = <training>}
		else
			popupelement :obj_spawnscript \{ui_recording_disconnect_update}
		endif
	else
		popupelement :obj_spawnscript \{ui_recording_disconnect_update}
	endif
endscript

script ui_destroy_recording_disconnect 
	destroy_popup_warning_menu
	0x807481eb
endscript

script ui_recording_disconnect_update \{training = 0}
	old_text = qs(0x52122f6e)
	GetActiveControllers
	<0xf147d880> = [0 0 0 0 0 0 0 0]
	if (($primary_controller) > 1)
		count = 0
		begin
		SetArrayElement ArrayName = 0xf147d880 index = <count> NewValue = (<active_controllers> [<count>])
		<count> = (<count> + 1)
		repeat 8
	endif
	begin
	GetActiveControllers
	if ((<active_controllers> [($primary_controller)]) = 0)
		if (($primary_controller) > 1)
			count = 0
			begin
			if (<count> > 1)
				if (<0xf147d880> [<count>] = 0)
					if (<active_controllers> [<count>] = 1)
						ui_recording_disconnect_continue
						set_primary_controller device_num = <count> state = uistate_recording_disconnect
					endif
				endif
			endif
			SetArrayElement ArrayName = 0xf147d880 index = <count> NewValue = (<active_controllers> [<count>])
			<count> = (<count> + 1)
			repeat 8
		endif
	endif
	text = qs(0x00000000)
	getcontrollertype controller = ($primary_controller)
	GetActiveControllers
	<is_active_controller> = (<active_controllers> [($primary_controller)])
	if (((<controller_type> != guitar) && (<controller_type> != drum)) || <is_active_controller> != 1)
		if (<training> = 1)
			0x74199ba6 \{0x0921d53f = qs(0x89985c62)}
		else
			0x74199ba6 \{0x0921d53f = qs(0x50744810)}
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
	Wait \{5
		gameframes}
	repeat
endscript

script ui_recording_studio_disconnect_update 
	0x74199ba6
	se_setprops {popupbody_text = <text>}
endscript

script ui_recording_disconnect_continue 
	if NOT GotParam \{recording_studio}
		getcontrollertype controller = ($primary_controller)
		if NOT ((<controller_type> = guitar) || (<controller_type> = drum))
			menu_scroll_end_sound
			return
		endif
	else
		GetActiveControllers
		<is_active_controller> = (<active_controllers> [($primary_controller)])
		if (<is_active_controller> != 1)
			menu_scroll_end_sound
			return
		endif
	endif
	if ui_event_exists_in_stack \{Name = 'jam_tutorials'}
		generic_event_back \{state = uistate_jam_tutorials}
	else
		generic_event_back \{data = {
				editing = 1
			}}
	endif
endscript

script ui_recording_disconnect_quit 
	if ui_event_exists_in_stack \{Name = 'jam_tutorials'}
		if ScreenElementExists \{id = training_container}
			DestroyScreenElement \{id = training_container}
		endif
		if ScreenElementExists \{id = jam_band_container}
			DestroyScreenElement \{id = jam_band_container}
		endif
		generic_event_back \{state = uistate_jam_tutorials}
	elseif ui_event_exists_in_stack \{Name = 'jam_select_song'}
		generic_event_back \{state = uistate_jam_select_song}
	else
		0xf7e0f992 \{Wait}
		generic_event_back \{state = uistate_mainmenu}
	endif
endscript

script 0x74199ba6 \{0x0921d53f = qs(0x4a46ca6d)}
	if ($primary_controller < 0)
		subtext = qs(0x00000000)
	elseif ($primary_controller < 2)
		formatText TextName = subtext qs(0x4546f57c) d = (($primary_controller) + 1)
	else
		subtext = qs(0xb294f5a0)
	endif
	formatText TextName = text <0x0921d53f> s = <subtext>

	return text = <text>
endscript
