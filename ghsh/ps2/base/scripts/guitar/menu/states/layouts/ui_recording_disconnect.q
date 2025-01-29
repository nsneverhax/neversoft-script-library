
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

script 0x27d33eef 
	formatText \{checksumName = line6_pod
		'line6_pod_%s'
		s = $jam_current_recording_player}
	if ScreenElementExists id = <line6_pod>
		LaunchEvent Type = unfocus target = <line6_pod>
	endif
	formatText \{checksumName = 0x2d7a56d4
		'jam_band_pause_scales_%s'
		s = $jam_current_recording_player}
	if ScreenElementExists id = <0x2d7a56d4>
		destroy_menu_jam_scales \{select_player = $jam_current_recording_player
			no_back_sound}
		Change \{in_pause_menu = 1}
	endif
	formatText \{checksumName = jam_band_pause_drum_loop
		'jam_band_pause_drum_loop_%s'
		s = $jam_current_recording_player}
	if ScreenElementExists id = <jam_band_pause_drum_loop>
		formatText \{checksumName = 0xf63dd480
			'vmenu_options_drum_loop_%s'
			s = $jam_current_recording_player}
		formatText \{checksumName = 0x87f07a51
			'scrolling_options_drum_loop_%s'
			s = $jam_current_recording_player}
		jam_band_remove_pause_submenu vmenu_options_effects = <0xf63dd480> scrolling_options_effects = <0x87f07a51> player_pause_submenu = <jam_band_pause_drum_loop> vmenu_id = <0xf63dd480>
		Change \{in_pause_menu = 1}
	endif
	formatText \{checksumName = 0xa4e21455
		'jam_band_drum_kit_%s'
		s = $jam_current_recording_player}
	if ScreenElementExists id = <0xa4e21455>
		formatText \{checksumName = 0x5d82a34a
			'vmenu_options_drum_kit_%s'
			s = $jam_current_recording_player}
		formatText \{checksumName = 0x21a9fb0e
			'scrolling_options_drum_kit_%s'
			s = $jam_current_recording_player}
		jam_band_remove_pause_submenu vmenu_options_effects = <0x5d82a34a> scrolling_options_effects = <0x21a9fb0e> player_pause_submenu = <jam_band_pause_drum_kit> vmenu_id = <0x5d82a34a>
		Change \{in_pause_menu = 1}
	endif
	formatText \{checksumName = 0x4839f3a2
		'jam_band_melody_kit_%s'
		s = $jam_current_recording_player}
	if ScreenElementExists id = <0x4839f3a2>
		formatText \{checksumName = 0xd0662273
			'vmenu_options_melody_kit_%s'
			s = $jam_current_recording_player}
		formatText \{checksumName = 0x21c30d9f
			'scrolling_options_melody_kit_%s'
			s = $jam_current_recording_player}
		jam_band_remove_pause_submenu vmenu_options_effects = <0xd0662273> scrolling_options_effects = <0x21c30d9f> player_pause_submenu = <jam_band_pause_melody_kit> vmenu_id = <0xd0662273>
		Change \{in_pause_menu = 1}
	endif
	formatText \{checksumName = 0x3d32517f
		'jam_band_bass_kit_%s'
		s = $jam_current_recording_player}
	if ScreenElementExists id = <0x3d32517f>
		formatText \{checksumName = 0xc452e660
			'vmenu_options_bass_kit_%s'
			s = $jam_current_recording_player}
		formatText \{checksumName = 0xb879be24
			'scrolling_options_bass_kit_%s'
			s = $jam_current_recording_player}
		jam_band_remove_pause_submenu vmenu_options_effects = <0xc452e660> scrolling_options_effects = <0xb879be24> player_pause_submenu = <jam_band_pause_bass_kit> vmenu_id = <0xc452e660>
		Change \{in_pause_menu = 1}
	endif
	formatText \{checksumName = jam_band_pause_settings
		'jam_band_pause_settings_%s'
		s = $jam_current_recording_player}
	if ScreenElementExists id = <jam_band_pause_settings>
		formatText \{checksumName = 0xfc45c2d5
			'vmenu_options_settings_%s'
			s = $jam_current_recording_player}
		formatText \{checksumName = 0x806e9a91
			'scrolling_options_settings_%s'
			s = $jam_current_recording_player}
		jam_band_remove_pause_submenu vmenu_options_effects = <0xfc45c2d5> scrolling_options_effects = <0x806e9a91> player_pause_submenu = <jam_band_pause_settings> vmenu_id = <0xfc45c2d5>
		Change \{in_pause_menu = 1}
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
		if GotParam \{recording_studio}
			create_loading_screen \{0xdf3c5641}
		elseif GotParam \{0x8d07739d}
			SpawnScriptNow \{create_jam_ghtunes_menu}
		else
			if ($jam_advanced_record = 1)
				if NOT ($game_mode = training)
					formatText \{checksumName = line6_pod
						'line6_pod_%s'
						s = $jam_current_recording_player}
					if ScreenElementExists id = <line6_pod>
						LaunchEvent Type = focus target = <line6_pod>
					endif
				endif
			endif
		endif
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
