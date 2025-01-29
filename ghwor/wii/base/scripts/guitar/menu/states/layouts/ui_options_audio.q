
script ui_create_options_audio 
	pushfrontendoverridequota \{quota = quota_misc}
	RequireParams \{[
			from_pause_menu
		]
		all}
	audio_ui_menu_music_off
	destroy_friend_feed
	SpawnScriptLater \{spawned_looping_audio_options_song}
	net_counter_increment \{counter_name = globalcounter_audio_mixer}
	if NOT GotParam \{device_num}
		device_num = ($primary_controller)
	endif
	vocals_mute_all_mics \{mute = FALSE}
	get_savegame_from_controller controller = <device_num>
	GetGlobalTags user_options savegame = <savegame>
	Volume = [0 0 0 0 0 0 0 0 0]
	SetArrayElement ArrayName = Volume index = 0 NewValue = (<volumes>.guitar.guitar.vol)
	SetArrayElement ArrayName = Volume index = 1 NewValue = (<volumes>.guitar.bass.vol)
	SetArrayElement ArrayName = Volume index = 2 NewValue = (<volumes>.guitar.drum.vol)
	SetArrayElement ArrayName = Volume index = 3 NewValue = (<volumes>.guitar.vocals.vol)
	SetArrayElement ArrayName = Volume index = 4 NewValue = (<volumes>.guitar.Band.vol)
	SetArrayElement ArrayName = Volume index = 5 NewValue = (<volumes>.guitar.mic.vol)
	SetArrayElement ArrayName = Volume index = 6 NewValue = (<volumes>.guitar.sfx.vol)
	SetArrayElement ArrayName = Volume index = 7 NewValue = (<volumes>.guitar.Crowd.vol)
	SetArrayElement ArrayName = Volume index = 8 NewValue = (<volumes>.guitar.micgain.vol)
	initial_volume = [7 7 7 7 7 7 7 7 2]
	formatText TextName = gamertag_text qs(0xedc03e4e) d = (<device_num> + 1)
	if isxenonorwindx
		if getlocalgamertag controller = <device_num>
			if NOT (<gamertag> = qs(0x03ac90f0))
				<gamertag_text> = <gamertag>
			endif
		endif
	endif
	<instrument_icon_params> = {}
	get_local_in_game_player_num_from_controller controller_index = <device_num>
	if NOT (<player_num> = -1)
		getplayerinfo <player_num> part
		switch <part>
			case bass
			icon_texture = mixer_icon_bass
			case drum
			icon_texture = mixer_icon_drums
			case vocals
			icon_texture = mixer_icon_vox
			default
			icon_texture = mixer_icon_guitar
		endswitch
	else
		if IsGuitarController controller = <device_num>
			icon_texture = mixer_icon_guitar
		elseif isdrumcontroller controller = <device_num>
			icon_texture = mixer_icon_drums
		else
			GetActiveControllers
			if (<active_controllers> [<device_num>] = 1)
				icon_texture = mixer_icon_vox
			else
				icon_texture = NULL
			endif
		endif
	endif
	if (<icon_texture> != NULL)
		AddParam structure_name = instrument_icon_params Name = instrument_icon_texture value = <icon_texture>
	endif
	CreateScreenElement {
		parent = root_window
		id = audiointerface
		Type = descinterface
		desc = 'options_audio_mixer'
		gamertag_name_text = <gamertag_text>
		<instrument_icon_params>
		tags = {
			Volume = <Volume> eq = <eq>
			initial_volume = <initial_volume>
			device_num = <device_num>
			from_pause_menu = <from_pause_menu>
		}
		z_priority = 650
		exclusive_device = <device_num>
	}
	audiointerface :se_setprops \{mixer_channel_lamp_alpha = 0.0}
	if audiointerface :desc_resolvealias \{Name = alias_audio_mixer_menu}
		AssignAlias id = <resolved_id> alias = current_menu
		AssignAlias id = <resolved_id> alias = mixer_text_menu
		<resolved_id> :se_setprops {
			event_handlers = [
				{pad_back ui_sfx params = {menustate = Generic uitype = back}}
				{pad_back ui_options_check_settings}
				{pad_L1 ui_options_audio_reset_values params = {savegame = <savegame>}}
				{menu_selection_changed ui_options_audio_text_menu_sound}
			]
			tags = {current_focused_idx = -1}
		}
		if GetScreenElementChildren \{id = mixer_text_menu}
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			<current_item> :se_setprops {
				event_handlers = [
					{focus ui_options_audio_focus_text_menu params = {text_idx = <i>}}
					{unfocus ui_options_audio_unfocus_text_menu}
					{pad_choose ui_options_audio_choose}
				]
				tags = {
					index = <i>
				}
			}
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	if audiointerface :desc_resolvealias \{Name = alias_faders_container}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			<current_item> :se_setprops {
				event_handlers = [
					{focus ui_options_audio_focus_fader_menu}
					{unfocus ui_options_audio_unfocus_fader_menu}
					{pad_back ui_options_audio_fader_back params = {savegame = <savegame>}}
					{pad_choose ui_options_audio_fader_choose params = {savegame = <savegame>}}
					{pad_up ui_options_audio_fader_dir params = {up}}
					{pad_down ui_options_audio_fader_dir params = {down}}
				]
				tags = {
					index = <i>
					current = None
					highlight = slider
				}
			}
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	ui_options_audio_set_values
	ui_options_audio_set_default_volume_lights default_volumes = <initial_volume>
	menu_finish
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	add_user_control_helper \{text = qs(0x38ee4773)
		button = orange
		z = 100000}
	ui_options_set_settings
	if ScreenElementExists \{id = mixer_text_menu}
		LaunchEvent \{Type = focus
			target = mixer_text_menu
			data = {
				child_index = 0
			}}
	endif
endscript

script ui_destroy_options_audio 
	KillSpawnedScript \{Name = spawned_looping_audio_options_song}
	StopSoundEvent \{audio_ui_audio_options_microphone
		fade_time = 0.3
		fade_type = linear}
	StopSoundEvent \{audio_ui_audio_options_microphone_2
		fade_time = 0.3
		fade_type = linear}
	Change \{g_audio_options_crowd_fader_state = not_looping}
	stopsound \{audio_options_song}
	if GameIsPaused
		printf \{channel = sfx
			qs(0x672db1ac)}
		SpawnScriptNow \{ui_sfx
			params = {
				menustate = Generic
				uitype = back
			}}
	else
		printf \{channel = sfx
			qs(0xc9aa4352)}
		if NOT ScriptIsRunning \{fretbar_update_tempo}
			audio_ui_menu_music_on
		endif
	endif
	vocals_mute_all_mics \{mute = true}
	DestroyScreenElement \{id = audiointerface}
	generic_ui_destroy
	popfrontendoverridequota
endscript

script ui_options_audio_reset_values 
	RequireParams \{[
			savegame
		]
		all}
	audiointerface :GetTags
	GetArraySize <initial_volume>
	i = 0
	begin
	if ((<Volume> [<i>]) != (<initial_volume> [<i>]))
		SoundEvent \{event = audio_ui_audio_options_reset}
		break
	endif
	<i> = (<i> + 1)
	repeat (<array_Size>)
	audiointerface :SetTags {Volume = <initial_volume> eq = <initial_eq>}
	ui_options_audio_set_values \{time = 0.3}
endscript

script ui_options_audio_set_values \{time = 0.0}
	audiointerface :GetTags
	if audiointerface :desc_resolvealias \{Name = alias_faders_container}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <Volume>
			i = 0
			begin
			PosX = 3
			PosY = (-27 + (265 * (1.0 - ((<Volume> [<i>]) / 11.0))))
			<fader> = (<children> [<i>])
			<fader> :se_setprops {
				mixer_fader_pos = (((1.0, 0.0) * <PosX>) + ((0.0, 1.0) * <PosY>))
				time = <time>
			}
			j = 1
			alpha_value = 0
			begin
			formatText checksumName = fader_light 'lights_ON_%a_alpha' a = <j>
			<alpha_value> = 0
			if (<j> <= (<Volume> [<i>]))
				<alpha_value> = 1
			endif
			AddParam structure_name = fader_light_alpha_struct Name = <fader_light> value = <alpha_value>
			<fader> :se_setprops {
				<fader_light_alpha_struct>
				time = <time>
			}
			<j> = (<j> + 1)
			repeat 10
			i = (<i> + 1)
			repeat (<array_Size> - 1)
		endif
	endif
	if (<from_pause_menu> = 1)
		get_local_in_game_player_num_from_controller controller_index = <device_num>
		if (<player_num> != -1)
			if playerinfoequals <player_num> bot_play = 1
				<controller> = 0
			endif
		endif
	endif
	updatevolumestag part = guitar Name = guitar params = {vol = (<Volume> [0])}
	updatevolumestag part = guitar Name = bass params = {vol = (<Volume> [1])}
	updatevolumestag part = guitar Name = drum params = {vol = (<Volume> [2])}
	updatevolumestag part = guitar Name = vocals params = {vol = (<Volume> [3])}
	updatevolumestag part = guitar Name = Band params = {vol = (<Volume> [4])}
	updatevolumestag part = guitar Name = mic params = {vol = (<Volume> [5])} controller = <controller>
	updatevolumestag part = guitar Name = sfx params = {vol = (<Volume> [6])}
	updatevolumestag part = guitar Name = Crowd params = {vol = (<Volume> [7])}
	updatevolumestag part = guitar Name = micgain params = {vol = (<Volume> [8])}
	ui_options_audio_update_all_volumes
endscript

script ui_options_audio_text_menu_sound 
	SoundEvent \{event = audio_ui_audio_options_fader}
endscript

script ui_options_audio_focus_text_menu 
	RequireParams \{[
			text_idx
		]
		all}
	if ScreenElementExists \{id = audiointerface}
		initial_highlight_pos = (-100.0, -143.0)
		GetTags
		Obj_GetID
		GetScreenElementPosition id = <objID>
		se_setprops \{alpha = 1.0}
		audiointerface :se_getprops
		switch <text_idx>
			case 0
			audiointerface :se_setprops \{mixer_menu_highlight_dims = (95.0, 40.0)}
			spacing = (115.0, 0.0)
			case 1
			audiointerface :se_setprops \{mixer_menu_highlight_dims = (105.0, 40.0)}
			spacing = (112.0, 0.0)
			case 2
			audiointerface :se_setprops \{mixer_menu_highlight_dims = (105.0, 40.0)}
			spacing = (116.0, 0.0)
			case 3
			audiointerface :se_setprops \{mixer_menu_highlight_dims = (105.0, 40.0)}
			spacing = (117.5, 0.0)
			case 4
			audiointerface :se_setprops \{mixer_menu_highlight_dims = (130.0, 40.0)}
			spacing = (115.0, 0.0)
			case 5
			audiointerface :se_setprops \{mixer_menu_highlight_dims = (105.0, 40.0)}
			spacing = (118.4, 0.0)
			case 6
			audiointerface :se_setprops \{mixer_menu_highlight_dims = (105.0, 40.0)}
			spacing = (118.6, 0.0)
			case 7
			audiointerface :se_setprops \{mixer_menu_highlight_dims = (95.0, 40.0)}
			spacing = (119.5, 0.0)
			default
			ScriptAssert \{'out of audio mixer range'}
		endswitch
		if NOT (<mixer_menu_highlight_alpha> = 0.3)
			audiointerface :se_setprops \{mixer_menu_highlight_alpha = 0.3
				time = 0.1}
		endif
		audiointerface :se_setprops mixer_menu_highlight_pos = (<initial_highlight_pos> + (<spacing> * <text_idx>)) time = 0.1
		if ScreenElementExists \{id = mixer_text_menu}
			mixer_text_menu :SetTags {current_focused_idx = <text_idx>}
			mixer_text_menu :se_setprops \{alpha = 1
				time = 0.1}
		endif
	endif
endscript

script ui_options_audio_unfocus_text_menu 
	se_setprops \{alpha = 0.5}
endscript

script ui_options_audio_choose 
	SoundEvent \{event = audio_ui_audio_options_select}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xb63a145a)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xf7723015)
		button = red
		z = 100000}
	GetTags
	if audiointerface :desc_resolvealias \{Name = alias_faders_container}
		if ResolveScreenElementID id = {<resolved_id> child = <index>}
			audiointerface :se_setprops \{mixer_channel_lamp_alpha = 1.0
				time = 0.1}
			LaunchEvent \{Type = unfocus
				target = mixer_text_menu}
			audiointerface :GetTags
			<resolved_id> :se_getprops
			<resolved_id> :SetTags {
				current = slider
				highlight = slider
				old_volume = (<Volume> [<index>])
			}
			LaunchEvent Type = focus target = <resolved_id>
		endif
	endif
	mixer_text_menu :se_setprops \{alpha = 0.5
		time = 0.1}
	audiointerface :se_setprops \{mixer_menu_highlight_alpha = 0.3
		time = 0.1}
	ui_options_sound_event \{choose}
endscript

script ui_options_audio_focus_fader_menu 
	GetTags
	if (<current> = None)
		if (<highlight> = slider)
			se_setprops \{mixer_fader_highlight_alpha = 0.5}
		else
			se_setprops \{mixer_fader_highlight_alpha = 0.0}
		endif
	elseif (<current> = slider)
		se_setprops \{mixer_fader_highlight_alpha = 1.0}
	else
		se_setprops \{mixer_fader_highlight_alpha = 0.0}
	endif
endscript

script ui_options_audio_unfocus_fader_menu 
	Change \{g_audio_options_crowd_fader_state = not_looping}
	GetTags
	se_setprops \{mixer_fader_highlight_alpha = 0.0}
endscript

script ui_options_audio_fader_choose 
	RequireParams \{[
			savegame
		]
		all}
	GetTags
	se_getprops
	SoundEvent \{event = audio_ui_audio_options_select}
	clean_up_user_control_helpers
	menu_finish
	GetGlobalTags savegame = <savegame> user_options
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	add_user_control_helper \{text = qs(0x38ee4773)
		button = orange
		z = 100000}
	if (<current> = None)
		SetTags \{current = slider
			highlight = slider}
	elseif (<current> = slider)
		SetTags \{current = None}
		LaunchEvent \{Type = focus
			target = mixer_text_menu}
		mixer_text_menu :se_setprops \{alpha = 1.0
			time = 0.1}
		LaunchEvent Type = unfocus target = <objID>
		ui_options_sound_event \{choose}
		return
	else
		SetTags \{current = None
			highlight = dial}
	endif
	ui_sfx \{menustate = Generic
		uitype = select}
	ui_options_audio_focus_fader_menu
endscript

script ui_options_audio_fader_back 
	RequireParams \{[
			savegame
		]
		all}
	SoundEvent \{event = audio_ui_audio_options_back}
	GetTags
	Obj_GetID
	se_getprops
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	GetGlobalTags savegame = <savegame> user_options
	add_user_control_helper \{text = qs(0x38ee4773)
		button = orange
		z = 100000}
	audiointerface :GetTags
	SetArrayElement ArrayName = Volume index = <index> NewValue = <old_volume>
	audiointerface :SetTags Volume = <Volume>
	ui_options_audio_set_values
	if (<current> = None)
		printf \{channel = options_audio
			qs(0x05b5b626)}
		LaunchEvent \{Type = focus
			target = mixer_text_menu}
		mixer_text_menu :se_setprops \{alpha = 1.0
			time = 0.1}
		LaunchEvent Type = unfocus target = <objID>
	elseif (<current> = slider)
		ui_options_sound_event \{back}
		SetTags \{current = None}
		LaunchEvent \{Type = focus
			target = mixer_text_menu}
		mixer_text_menu :se_setprops \{alpha = 1.0
			time = 0.1}
		LaunchEvent Type = unfocus target = <objID>
	else
		SetTags \{current = None}
		ui_options_audio_focus_fader_menu
	endif
endscript

script ui_options_audio_fader_dir 
	GetTags
	if (<current> = None)
		SetTags \{highlight = slider}
	elseif (<current> = slider)
		audiointerface :GetTags
		new_volume = 0
		min_volume = 0
		if GotParam \{down}
			new_volume = (<Volume> [<index>])
			if (<index> <= 4)
				min_volume = 5
			endif
			if NOT (<new_volume> <= <min_volume>)
				ui_sfx \{menustate = audio_options
					uitype = scrollup}
				new_volume = ((<Volume> [<index>]) - 1)
			else
				if ($paused_for_hardware = 0)
				endif
			endif
		else
			new_volume = (<Volume> [<index>])
			if NOT (<new_volume> >= 10)
				ui_sfx \{menustate = audio_options
					uitype = scrollup}
				new_volume = ((<Volume> [<index>]) + 1)
			else
				if ($paused_for_hardware = 0)
				endif
			endif
		endif
		if NOT (<new_volume> = (<Volume> [<index>]))
			SetArrayElement ArrayName = Volume index = <index> NewValue = <new_volume>
			audiointerface :SetTags Volume = <Volume>
			ui_options_audio_set_values
			ui_options_sound_event slider index = <index>
		endif
	endif
	ui_options_audio_focus_fader_menu
endscript

script ui_options_sound_event 
	audiointerface :GetTags
	if GotParam \{slider}
		current_volume = (<Volume> [<index>])
		switch (<index>)
			case 0
			printf \{channel = sfx
				qs(0x6c7d768a)}
			case 1
			printf \{channel = sfx
				qs(0x756647cb)}
			case 2
			printf \{channel = sfx
				qs(0x5e4b1408)}
			case 3
			printf \{channel = sfx
				qs(0x47502549)}
			case 4
			printf \{channel = sfx
				qs(0x0811b38e)}
			case 5
			printf \{channel = sfx
				qs(0x110a82cf)}
			SoundEvent \{event = audio_ui_audio_options_microphone}
			case 6
			printf \{channel = sfx
				qs(0x3a27d10c)}
			SoundEvent \{event = audio_ui_audio_options_sfx}
			case 7
			printf \{channel = sfx
				qs(0x233ce04d)}
			Change \{g_audio_options_crowd_fader_state = looping}
			SpawnScriptNow \{audio_options_crowd_fader_loop}
			default
			printf \{channel = sfx
				qs(0x6ffa4873)}
		endswitch
	elseif GotParam \{back}
		stopsound \{audio_options_guitar
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_bass
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_drum
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_vocals
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_instruments
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_mic
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_sfx
			fade_time = 0.3
			fade_type = linear}
	elseif GotParam \{backgeneric}
		ui_sfx \{menustate = Generic
			uitype = back}
	elseif GotParam \{choose}
		stopsound \{audio_options_guitar
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_bass
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_drum
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_vocals
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_instruments
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_mic
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_sfx
			fade_time = 0.3
			fade_type = linear}
	endif
endscript
songtemporarilydowninvolume = 0

script ChangeSpinalTapVolume \{spinal_tap_volume_max = 10}
	<spinal_tap_volume> = (<spinal_tap_volume> + <Change>)
	if (<spinal_tap_volume> < 0)
		<spinal_tap_volume> = 0
	elseif (<spinal_tap_volume> > <spinal_tap_volume_max>)
		<spinal_tap_volume> = <spinal_tap_volume_max>
	endif
	return Volume = <spinal_tap_volume>
endscript

script ui_options_audio_get_buss_volume 
	printf channel = sfx qs(0xfccb832c) v = <Volume>
	switch <Volume>
		case 10
		<vol> = -1.5
		case 9
		<vol> = -2.2
		case 8
		<vol> = -2.9
		case 7
		<vol> = -3.5
		case 6
		<vol> = -4.2
		case 5
		<vol> = -5.0
		case 4
		printf \{qs(0x0c7dbf28)}
		<vol> = -5.9
		case 3
		printf \{qs(0xa536df19)}
		<vol> = -6.7
		case 2
		printf \{qs(0xd853a509)}
		<vol> = -7.5
		case 1
		printf \{qs(0x5ffc2b39)}
		<vol> = -8.3
		case 0
		printf \{qs(0x22995129)}
		<vol> = -9.1
		default
		printf \{qs(0x33067057)}
		<vol> = -3.5
	endswitch
	return vol = <vol>
endscript

script ui_options_audio_get_buss_volume_full_dynamics 
	printf channel = sfx qs(0xb845156d) v = <Volume>
	switch <Volume>
		case 10
		<vol> = 1.5
		case 9
		<vol> = 0.0
		case 8
		<vol> = -1.8
		case 7
		<vol> = -3.5
		case 6
		<vol> = -4.5
		case 5
		<vol> = -5.2
		case 4
		<vol> = -8.2
		case 3
		<vol> = -10.5
		case 2
		<vol> = -13.8
		case 1
		<vol> = -15.7
		case 0
		<vol> = -100.0
		default
		<vol> = -3.5
	endswitch
	return vol = <vol>
endscript

script ui_options_audio_get_options_screen_volume 
	switch <Volume>
		case 10
		<vol> = 2.0
		case 9
		<vol> = 0.3
		case 8
		<vol> = -1.2
		case 7
		<vol> = -3.5
		case 6
		<vol> = -5.0
		case 5
		<vol> = -7.0
		case 4
		printf \{qs(0x9cfa0a2f)}
		<vol> = -5.9
		case 3
		printf \{qs(0xdae82eba)}
		<vol> = -6.7
		case 2
		printf \{qs(0x4acefb0b)}
		<vol> = -7.5
		case 1
		printf \{qs(0x21d48399)}
		<vol> = -8.3
		case 0
		printf \{qs(0xb1f25628)}
		<vol> = -9.1
		default
		printf \{qs(0x70eefcf4)}
		<vol> = -3.5
	endswitch
	return vol = <vol>
endscript

script ui_options_audio_update_all_volumes \{time = 0}
	audiointerface :GetTags
	update_all_volumes <...>
endscript

script update_all_volumes \{time = 0
		device_num = 0}
	if GotParam \{Player}
		get_savegame_from_player Player = <Player>
		update_all_volumes_savegame Player = <Player> savegame = <savegame>
	else
		get_savegame_from_controller controller = <device_num>
		if (<from_pause_menu> = 1)
			get_local_in_game_player_num_from_controller controller_index = <device_num>
			if (<player_num> != -1)
				update_all_volumes_savegame Player = <player_num> savegame = <savegame>
			else
				update_all_volumes_savegame savegame = <savegame>
			endif
		else
			update_all_volumes_savegame savegame = <savegame>
		endif
	endif
endscript

script update_all_volumes_savegame \{time = 0}
	GetGlobalTags user_options savegame = <savegame>
	ui_options_audio_get_buss_volume Volume = (<volumes>.guitar.guitar.vol) instr = qs(0x09048d9e)
	SoundBussUnlock \{User_Guitar}
	SoundBussUnlock \{user_rhythmgtr}
	setsoundbussparams {user_rhythmgtr = {vol = <vol>} time = <time>}
	setsoundbussparams {User_Guitar = {vol = <vol>} time = <time>}
	SoundBussLock \{User_Guitar}
	SoundBussLock \{user_rhythmgtr}
	ui_options_audio_get_options_screen_volume Volume = (<volumes>.guitar.guitar.vol)
	Change current_audio_options_song_guitar_vol = <vol>
	ui_options_audio_get_buss_volume Volume = (<volumes>.guitar.bass.vol) instr = qs(0xb6237ee8)
	SoundBussUnlock \{user_bass}
	setsoundbussparams {user_bass = {vol = <vol>} time = <time>}
	SoundBussLock \{user_bass}
	ui_options_audio_get_options_screen_volume Volume = (<volumes>.guitar.bass.vol)
	Change current_audio_options_song_bass_vol = <vol>
	ui_options_audio_get_buss_volume Volume = (<volumes>.guitar.drum.vol) instr = qs(0xbcbd3cf7)
	SoundBussUnlock \{user_drums}
	setsoundbussparams {user_drums = {vol = <vol>} time = <time>}
	SoundBussLock \{user_drums}
	ui_options_audio_get_options_screen_volume Volume = (<volumes>.guitar.drum.vol)
	Change current_audio_options_song_drums_vol = <vol>
	ui_options_audio_get_buss_volume Volume = (<volumes>.guitar.vocals.vol) instr = qs(0x879f5b50)
	SoundBussUnlock \{user_vocals}
	setsoundbussparams {user_vocals = {vol = <vol>} time = <time>}
	SoundBussLock \{user_vocals}
	ui_options_audio_get_options_screen_volume Volume = (<volumes>.guitar.vocals.vol)
	Change current_audio_options_song_vocals_vol = <vol>
	ui_options_audio_get_buss_volume Volume = (<volumes>.guitar.Band.vol) instr = qs(0x11d3753c)
	SoundBussUnlock \{User_Band}
	setsoundbussparams {User_Band = {vol = <vol>} time = <time>}
	SoundBussLock \{User_Band}
	ui_options_audio_get_options_screen_volume Volume = (<volumes>.guitar.Band.vol)
	Change current_audio_options_song_band_vol = <vol>
	ui_options_audio_get_buss_volume_full_dynamics Volume = (<volumes>.guitar.mic.vol)
	sidechainvolumesetting = (<volumes>.guitar.mic.vol)
	if (<sidechainvolumesetting> > 7)
		<sidechainvolumesetting> = 7
	endif
	casttofloat \{sidechainvolumesetting}
	Change g_sidechaining_volume_percent_adjustment = (<sidechainvolumesetting> / 7.0)
	if GotParam \{Player}
		ui_options_audio_update_mic_volume Player = <Player> micvolume = (<volumes>.guitar.mic.vol)
	endif
	SoundBussUnlock \{user_microphone}
	setsoundbussparams {user_microphone = {vol = <vol>} time = <time>}
	SoundBussLock \{user_microphone}
	ui_options_audio_get_buss_volume_full_dynamics Volume = (<volumes>.guitar.sfx.vol)
	SoundBussUnlock \{User_SFX}
	setsoundbussparams {User_SFX = {vol = <vol>} time = <time>}
	SoundBussLock \{User_SFX}
	ui_options_audio_get_buss_volume_full_dynamics Volume = (<volumes>.guitar.Crowd.vol)
	SoundBussUnlock \{user_crowd}
	SoundBussUnlock \{user_crowdsingalong}
	setsoundbussparams {user_crowd = {vol = <vol>} time = <time>}
	setsoundbussparams {user_crowdsingalong = {vol = <vol>} time = <time>}
	SoundBussLock \{user_crowd}
	SoundBussLock \{user_crowdsingalong}
	ui_options_audio_get_buss_volume Volume = (<volumes>.guitar.backup.vol)
	ui_options_audio_get_buss_volume_full_dynamics Volume = (<volumes>.guitar.micgain.vol)
	if GotParam \{Player}
		mic_set_device_gain Player = <Player> micgain = (<volumes>.guitar.micgain.vol)
	endif
	if issoundplaying \{audio_options_song}
		printf \{channel = sfx
			qs(0xb836e193)}
		printf channel = sfx qs(0x9fd56364) s = ($current_audio_options_song_guitar_vol)
		printf channel = sfx qs(0x1f2ef878) s = ($current_audio_options_song_bass_vol)
		printf channel = sfx qs(0x2e8cc7ff) s = ($current_audio_options_song_drums_vol)
		printf channel = sfx qs(0x347d5ccd) s = ($current_audio_options_song_vocals_vol)
		printf channel = sfx qs(0xb6e6b03c) s = ($current_audio_options_song_band_vol)
		printf \{channel = sfx
			qs(0xb7974577)}
		array = []
		AddArrayElement array = <array> element = (($current_audio_options_song_guitar_vol) -10)
		AddArrayElement array = <array> element = (($current_audio_options_song_bass_vol) -10)
		AddArrayElement array = <array> element = (($current_audio_options_song_drums_vol) -10)
		AddArrayElement array = <array> element = (($current_audio_options_song_vocals_vol) -10)
		AddArrayElement array = <array> element = (($current_audio_options_song_band_vol) -10)
		AddArrayElement array = <array> element = 0.0
		printf \{channel = sfx
			qs(0xa030eeee)}
		SetSoundParams audio_options_song vol = <array>
	endif
endscript

script ui_options_audio_update_mic_volume 
	RequireParams \{[
			Player
		]
		all}
	if playerinfoequals <Player> is_local_client = 0
		return
	endif
	gamemode_gettype
	if (<Type> = freeplay)
		getplayerinfo <Player> freeplay_mic_volume
		micvolume = <freeplay_mic_volume>
	else
		if (<Player> = 1)
			get_savegame_from_player Player = <Player>
			GetGlobalTags savegame = <savegame> user_options
			micvolume = (<volumes>.guitar.mic.vol)
		else
			micvolume = ($mic_vol_hack_array [<Player> - 2])
		endif
	endif
	mic_set_device_volume {
		Player = <Player>
		micvolume = <micvolume>
		audio_getting_mic_device_info = <audio_getting_mic_device_info>
	}
	if GotParam \{audio_getting_mic_device_info}
		if (<audio_getting_mic_device_info> = true)
			return {
				micvolume = <micvolume>
			}
		endif
	endif
endscript

script mic_set_device_gain 
	RequireParams \{[
			Player
			micgain
		]
		all}
	if playerinfoequals <Player> bot_play = 1
		return
	endif
	GetInputHandlerBotIndex Player = <Player>
	<bot_controller> = <controller>
	getplayerinfo <Player> controller
	if (<bot_controller> = <controller>)
		return
	endif
	if playerinfoequals <Player> is_local_client = 0
		return
	endif
	if NOT playerinfoequals <Player> part = vocals
		return
	endif
	switch <micgain>
		case 0
		<micgain> = 0.0
		case 1
		<micgain> = 0.1
		case 2
		<micgain> = 0.2
		case 3
		<micgain> = 0.3
		case 4
		<micgain> = 0.4
		case 5
		<micgain> = 0.5
		case 6
		<micgain> = 0.6
		case 7
		<micgain> = 0.7
		case 8
		<micgain> = 0.8
		case 9
		<micgain> = 0.9
		case 10
		<micgain> = 1.0
		default
		<micgain> = 0.2
	endswitch
	vocals_setmicgain Player = <Player> gain = <micgain>
endscript

script mic_set_device_volume 
	RequireParams \{[
			Player
			micvolume
		]
		all}
	if playerinfoequals <Player> bot_play = 1
		return
	endif
	GetInputHandlerBotIndex Player = <Player>
	<bot_controller> = <controller>
	getplayerinfo <Player> controller
	if (<bot_controller> = <controller>)
		return
	endif
	if playerinfoequals <Player> is_local_client = 0
		return
	endif
	if NOT playerinfoequals <Player> part = vocals
		return
	endif
	switch <micvolume>
		case 0
		<micvolume> = 0.0
		case 1
		<micvolume> = 0.1
		case 2
		<micvolume> = 0.2
		case 3
		<micvolume> = 0.3
		case 4
		<micvolume> = 0.4
		case 5
		<micvolume> = 0.5
		case 6
		<micvolume> = 0.6
		case 7
		<micvolume> = 0.7
		case 8
		<micvolume> = 0.8
		case 9
		<micvolume> = 0.9
		case 10
		<micvolume> = 1.0
		default
		<micvolume> = 0.7
	endswitch
	if GotParam \{audio_getting_mic_device_info}
		if (<audio_getting_mic_device_info> = true)
			return {
				micvolume = <micvolume>
				audio_getting_mic_device_info = <audio_getting_mic_device_info>
			}
		endif
	endif
	setmicvolume controller = <controller> vol = <micvolume>
endscript

script ui_options_audio_set_default_volume_lights 
	RequireParams \{[
			default_volumes
		]
		all}
	num_mixer_light_children = ((11 * 2) - 1)
	if ScreenElementExists \{id = audiointerface}
		if audiointerface :desc_resolvealias \{Name = alias_faders_container
				param = fader_menu_id}
			GetScreenElementChildren id = <fader_menu_id>
			fader_children = <children>
			GetArraySize <fader_children>
			faders_size = <array_Size>
			GetArraySize <default_volumes>
			default_volumes_size = <array_Size>
			default_volumes_size = (<default_volumes_size> - 1)
			if (<faders_size> != <default_volumes_size>)
				ScriptAssert \{'number of faders does not match number of volumes'}
			endif
			if (<faders_size> > 0)
				i = 0
				begin
				if (<fader_children> [<i>]) :desc_resolvealias Name = alias_lights param = lights_id
					child_pos_to_retrieve = (<num_mixer_light_children> - ((<default_volumes> [<i>]) * 2))
					GetScreenElementChildren id = <lights_id>
					GetArraySize <children>
					if (<array_Size> > 0)
						GetScreenElementPosition id = (<children> [<child_pos_to_retrieve>]) local
						formatText checksumName = lights_alpha 'lights_ON_%a_alpha' a = (<default_volumes> [<i>])
						AddParam structure_name = fader_light_alpha_struct Name = <lights_alpha> value = 0
						x_pos = (<screenelementpos> [0])
						y_pos = (<screenelementpos> [1])
						CastToInteger \{x_pos}
						CastToInteger \{y_pos}
						(<fader_children> [<i>]) :se_setprops {
							amber_lights_on_pos = (((1.0, 0.0) * <x_pos>) + ((0.0, 1.0) * <y_pos>))
							amber_lights_off_pos = (((1.0, 0.0) * <x_pos>) + ((0.0, 1.0) * <y_pos>))
							<fader_light_alpha_struct>
						}
					endif
				endif
				<i> = (<i> + 1)
				repeat <faders_size>
			endif
		endif
	endif
endscript
current_audio_options_song_guitar_vol = 3.5
current_audio_options_song_bass_vol = 3.5
current_audio_options_song_drums_vol = 3.5
current_audio_options_song_vocals_vol = 3.5
current_audio_options_song_band_vol = 3.5

script spawned_looping_audio_options_song 
	begin
	if ($blade_active = 1)
		PauseSoundsByBuss \{Master}
		begin
		if ($blade_active = 0)
			UnpauseSoundsByBuss \{Master}
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	if NOT issoundplaying \{audio_options_song}
		printf \{channel = sfx
			qs(0xad9cbb32)}
		printf channel = sfx qs(0x9fd56364) s = ($current_audio_options_song_guitar_vol)
		printf channel = sfx qs(0x1f2ef878) s = ($current_audio_options_song_bass_vol)
		printf channel = sfx qs(0x2e8cc7ff) s = ($current_audio_options_song_drums_vol)
		printf channel = sfx qs(0x347d5ccd) s = ($current_audio_options_song_vocals_vol)
		printf channel = sfx qs(0xb6e6b03c) s = ($current_audio_options_song_band_vol)
		printf \{channel = sfx
			qs(0xb7974577)}
		if ($songtemporarilydowninvolume = 1)
			array = []
			AddArrayElement array = <array> element = (($current_audio_options_song_guitar_vol) -20)
			AddArrayElement array = <array> element = (($current_audio_options_song_bass_vol) -20)
			AddArrayElement array = <array> element = (($current_audio_options_song_drums_vol) -20)
			AddArrayElement array = <array> element = (($current_audio_options_song_vocals_vol) -20)
			AddArrayElement array = <array> element = (($current_audio_options_song_band_vol) -20)
			AddArrayElement array = <array> element = 0.0
		else
			array = []
			AddArrayElement array = <array> element = (($current_audio_options_song_guitar_vol) -10)
			AddArrayElement array = <array> element = (($current_audio_options_song_bass_vol) -10)
			AddArrayElement array = <array> element = (($current_audio_options_song_drums_vol) -10)
			AddArrayElement array = <array> element = (($current_audio_options_song_vocals_vol) -10)
			AddArrayElement array = <array> element = (($current_audio_options_song_band_vol) -10)
			AddArrayElement array = <array> element = 0.0
		endif
		printf \{channel = sfx
			qs(0xaec49e26)}
		PlaySound {
			audio_options_song
			buss = Master
			vol = <array>
		}
	else
		if issoundpaused \{audio_options_song}
			Wait \{5
				gameframe}
			PauseSound \{audio_options_song
				Pause = 0}
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script set_audio_options_for_primary_controller 
	get_savegame_from_controller controller = ($primary_controller)
	update_all_volumes_savegame savegame = <savegame>
endscript
