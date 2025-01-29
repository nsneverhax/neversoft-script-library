
script ui_create_options_audio 
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
	Volume = [0 0 0 0 0 0 0 0]
	SetArrayElement ArrayName = Volume index = 0 NewValue = (<volumes>.guitar.guitar.vol)
	SetArrayElement ArrayName = Volume index = 1 NewValue = (<volumes>.guitar.bass.vol)
	SetArrayElement ArrayName = Volume index = 2 NewValue = (<volumes>.guitar.drum.vol)
	SetArrayElement ArrayName = Volume index = 3 NewValue = (<volumes>.guitar.vocals.vol)
	SetArrayElement ArrayName = Volume index = 4 NewValue = (<volumes>.guitar.Band.vol)
	SetArrayElement ArrayName = Volume index = 5 NewValue = (<volumes>.guitar.mic.vol)
	SetArrayElement ArrayName = Volume index = 6 NewValue = (<volumes>.guitar.sfx.vol)
	SetArrayElement ArrayName = Volume index = 7 NewValue = (<volumes>.guitar.Crowd.vol)
	initial_volume = [7 7 7 7 7 7 7 7]
	if (<vocals_mic_enhancement_save> = 0)
		<mic_eq_alpha> = 0.5
	else
		<mic_eq_alpha> = 1.0
	endif
	formatText TextName = gamertag_text qs(0xedc03e4e) d = (<device_num> + 1)
	if isxenonorwindx
		if getlocalgamertag controller = <device_num>
			if NOT (<gamertag> = qs(0x03ac90f0))
				<gamertag_text> = <gamertag>
			endif
		endif
	else
		if NetSessionFunc Obj = match func = get_gamertag params = {controller = <device_num>}
			if (<device_num> = ($primary_controller))
				formatText TextName = gamertag_text qs(0x9436b93a) s = <Name> d = (<device_num> + 1)
			else
				<gamertag_text> = <Name>
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
	formatText \{TextName = dolby_on_text
		qs(0x50fcfa48)}
	CreateScreenElement {
		parent = root_window
		id = audiointerface
		Type = descinterface
		desc = 'options_audio_mixer'
		dolby_on_text = <dolby_on_text>
		mic_eq_container_alpha = <mic_eq_alpha>
		gamertag_name_text = <gamertag_text>
		<instrument_icon_params>
		tags = {
			Volume = <Volume> eq = <eq>
			dolby_digital = <dolby_digital>
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
				{pad_option options_audio_flip_mic_eq params = {savegame = <savegame>}}
				{pad_option2 options_audio_flip_dolby_option params = {savegame = <savegame>}}
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
	ui_options_audio_set_dolby_digital savegame = <savegame>
	ui_options_audio_set_default_volume_lights default_volumes = <initial_volume>
	menu_finish
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if (<dolby_digital> = 0)
		add_user_control_helper \{text = qs(0x6ea63e4d)
			button = yellow
			z = 100000}
	else
		add_user_control_helper \{text = qs(0xe7218229)
			button = yellow
			z = 100000}
	endif
	if (<vocals_mic_enhancement_save> = 0)
		add_user_control_helper \{text = qs(0x4c106ea5)
			button = blue
			z = 100000}
	else
		add_user_control_helper \{text = qs(0x1aed888f)
			button = blue
			z = 100000}
	endif
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
	SpawnScriptNow \{audio_audiooptions_stop_dolby_digital_sounds}
	vocals_mute_all_mics \{mute = true}
	DestroyScreenElement \{id = audiointerface}
	generic_ui_destroy
	SetPakManCurrentBlock \{map = ui_paks
		pakname = 'band_lobby'
		block_scripts = 1}
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
			repeat (<array_Size>)
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

script ui_options_audio_focus_preset_menu_text 
	se_setprops \{alpha = 1.0}
endscript

script ui_options_audio_unfocus_preset_menu_text 
	se_setprops \{alpha = 0.5}
endscript

script ui_options_audio_unfocus_preset_menu 
	if ScreenElementExists \{id = audiointerface}
		audiointerface :se_setprops \{mixer_preset_on_state_alpha = 0
			time = 0.1}
	endif
endscript

script ui_options_audio_preset_choose 
	SoundEvent \{event = audio_ui_audio_options_select}
	RequireParams \{[
			preset_idx
		]
		all}
	if ScreenElementExists \{id = audiointerface}
		audiointerface :GetTags
		if (<preset_idx> = 3)
			if ScreenElementExists \{id = mixer_preset_menu}
				LaunchEvent \{Type = unfocus
					target = mixer_preset_menu}
			endif
			if ScreenElementExists \{id = mixer_text_menu}
				LaunchEvent \{Type = focus
					target = mixer_text_menu}
			endif
		else
			GetArraySize <Volume>
			i = 0
			begin
			SetArrayElement ArrayName = Volume index = <i> NewValue = (<initial_volume> [<i>])
			<i> = (<i> + 1)
			repeat (<array_Size> - 1)
			switch <preset_idx>
				case 0
				SetArrayElement \{ArrayName = Volume
					index = 6
					NewValue = 7}
				case 1
				SetArrayElement \{ArrayName = Volume
					index = 6
					NewValue = 10}
				case 2
				SetArrayElement \{ArrayName = Volume
					index = 6
					NewValue = 0}
				default
				ScriptAssert \{'invalid preset mode!'}
			endswitch
			audiointerface :SetTags Volume = <Volume>
			ui_options_audio_set_values \{time = 0.1}
			ui_options_sound_event \{slider
				index = 6}
		endif
	endif
endscript

script ui_options_audio_preset_back 
	GetTags
	se_getprops
	clean_up_user_control_helpers
	menu_finish
	if audiointerface :desc_resolvealias \{Name = alias_mixer_preset_menu}
		ui_options_sound_event \{back}
		SetTags \{current = None}
		LaunchEvent Type = unfocus target = <resolved_id>
		audiointerface :se_setprops \{mixer_preset_container_alpha = 0}
		mixer_text_menu :se_setprops \{alpha = 1.0
			time = 0.1}
		LaunchEvent \{Type = focus
			target = mixer_text_menu}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		add_user_control_helper \{text = qs(0x38ee4773)
			button = orange
			z = 100000}
	endif
endscript

script ui_options_audio_set_preset_menu_option 
	RequireParams \{[
			preset_mode
		]
		all}
	if ScreenElementExists \{id = audiointerface}
		clean_up_user_control_helpers
		menu_finish
		if audiointerface :desc_resolvealias \{Name = alias_mixer_preset_menu}
			audiointerface :se_setprops \{mixer_preset_container_alpha = 1}
			audiointerface :se_setprops \{mixer_channel_lamp_alpha = 0
				time = 0.1}
			switch <preset_mode>
				case Normal
				LaunchEvent Type = focus target = <resolved_id> data = {child_index = 0}
				case concert
				LaunchEvent Type = focus target = <resolved_id> data = {child_index = 1}
				case CD
				LaunchEvent Type = focus target = <resolved_id> data = {child_index = 2}
				case custom
				default
				LaunchEvent Type = focus target = <resolved_id> data = {child_index = 3}
			endswitch
		endif
		audiointerface :se_setprops \{mixer_preset_on_state_alpha = 0.5
			time = 0.1}
		ui_options_sound_event \{choose}
	endif
endscript

script ui_options_audio_focus_preset_menu 
	if ScreenElementExists \{id = mixer_text_menu}
		mixer_text_menu :se_setprops \{alpha = 0.5
			time = 0.1}
	endif
	if ScreenElementExists \{id = audiointerface}
		audiointerface :se_setprops \{mixer_preset_on_state_alpha = 0.5
			time = 0.1}
	endif
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
	if (<dolby_digital> = 0)
		add_user_control_helper \{text = qs(0x6ea63e4d)
			button = yellow
			z = 100000}
	else
		add_user_control_helper \{text = qs(0xe7218229)
			button = yellow
			z = 100000}
	endif
	if (<vocals_mic_enhancement_save> = 0)
		add_user_control_helper \{text = qs(0x4c106ea5)
			button = blue
			z = 100000}
	else
		add_user_control_helper \{text = qs(0x1aed888f)
			button = blue
			z = 100000}
	endif
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
	if (<dolby_digital> = 0)
		add_user_control_helper \{text = qs(0x6ea63e4d)
			button = yellow
			z = 100000}
	else
		add_user_control_helper \{text = qs(0xe7218229)
			button = yellow
			z = 100000}
	endif
	if (<vocals_mic_enhancement_save> = 0)
		add_user_control_helper \{text = qs(0x4c106ea5)
			button = blue
			z = 100000}
	else
		add_user_control_helper \{text = qs(0x1aed888f)
			button = blue
			z = 100000}
	endif
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
		dolby_changed = 0
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

script ui_options_audio_set_dolby_switch 
	RequireParams \{[
			dolby_digital
		]
		all}
	if ScreenElementExists \{id = audiointerface}
		if (<dolby_digital> = 1)
			dolby_on_alpha = 1.0
			dolby_off_alpha = 0.5
		else
			dolby_on_alpha = 0.5
			dolby_off_alpha = 1.0
		endif
		audiointerface :se_setprops {
			dolby_on_alpha = <dolby_on_alpha>
			dolby_off_alpha = <dolby_off_alpha>
		}
	endif
endscript

script ui_options_audio_mixer_back 
	SoundEvent \{event = audio_ui_audio_options_back}
	if ScreenElementExists \{id = mixer_text_menu}
		ui_options_sound_event \{back}
		SetTags \{current = None}
		LaunchEvent \{Type = unfocus
			target = mixer_text_menu}
		audiointerface :se_setprops \{mixer_menu_highlight_alpha = 0
			time = 0.1}
		mixer_text_menu :se_setprops \{alpha = 0.5
			time = 0.1}
		LaunchEvent \{Type = focus
			target = mixer_preset_menu}
	endif
endscript

script ui_options_audio_mixer_scroll 
	RequireParams \{[
			direction
		]
		all}
	if ScreenElementExists \{id = mixer_text_menu}
		mixer_text_menu :GetTags \{current_focused_idx}
		if (<direction> = up)
			if (<current_focused_idx> > 0)
				LaunchEvent Type = focus target = mixer_text_menu data = {child_index = (<current_focused_idx> - 1)}
			endif
		else
			GetScreenElementChildren \{id = mixer_text_menu}
			GetArraySize <children>
			if (<current_focused_idx> < (<array_Size> - 1))
				LaunchEvent Type = focus target = mixer_text_menu data = {child_index = (<current_focused_idx> + 1)}
			endif
		endif
		audio_audiooptions_scroll
	endif
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
			GetGlobalTags savegame = <savegame> user_options param = vocals_mic_enhancement_save
			<mic_enhancement> = <vocals_mic_enhancement_save>
			printf \{channel = sfx
				qs(0x110a82cf)}
			if (<mic_enhancement> = 1)
				SoundEvent \{event = audio_ui_audio_options_microphone_2}
			else
				SoundEvent \{event = audio_ui_audio_options_microphone}
			endif
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
	elseif GotParam \{dolby_option}
		if (<dolby_digital> = 1)
			PlaySound \{menu_dolbydigitalenable_surround_l
				vol = 4
				pan1x = -1
				pan1y = 1
				buss = Front_End}
			PlaySound \{menu_dolbydigitalenable_surround_c
				vol = 4
				pan1x = 0
				pan1y = 1
				buss = Front_End}
			PlaySound \{menu_dolbydigitalenable_surround_r
				vol = 4
				pan1x = 1
				pan1y = 1
				buss = Front_End}
			PlaySound \{menu_dolbydigitalenable_surround_ls
				vol = 4
				pan1x = -1
				pan1y = -1
				buss = Front_End}
			PlaySound \{menu_dolbydigitalenable_surround_rs
				vol = 4
				pan1x = 1
				pan1y = -1
				buss = Front_End}
			PlaySound \{menu_dolbydigitalenable_surround_lf
				vol = 4
				lfeonly = true
				lfe_vol = -15
				buss = Front_End}
		else
			SoundEvent \{event = audio_ui_audio_options_dolby_off}
		endif
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
		stopsound \{audio_options_mic
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_mic_2
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_sfx
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_instruments
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_vocals
			fade_time = 0.3
			fade_type = linear}
		SpawnScriptNow \{audio_audiooptions_stop_dolby_digital_sounds}
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
		stopsound \{audio_options_mic
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_mic_2
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_sfx
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_instruments
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_vocals
			fade_time = 0.3
			fade_type = linear}
		SpawnScriptNow \{audio_audiooptions_stop_dolby_digital_sounds}
	endif
endscript
songtemporarilydowninvolume = 0

script turndownsongtemporarily \{status = On}
	printf \{channel = sfx
		qs(0xa5726d44)}
	Change \{songtemporarilydowninvolume = 1}
	array = []
	AddArrayElement array = <array> element = (($current_audio_options_song_guitar_vol) -20)
	AddArrayElement array = <array> element = (($current_audio_options_song_bass_vol) -20)
	AddArrayElement array = <array> element = (($current_audio_options_song_drums_vol) -20)
	AddArrayElement array = <array> element = 0.0
	AddArrayElement array = <array> element = (($current_audio_options_song_vocals_vol) -20)
	AddArrayElement array = <array> element = (($current_audio_options_song_band_vol) -20)
	printf \{channel = sfx
		qs(0xa030eeee)}
	SetSoundParams audio_options_song vol = <array> time = 0.4
	printf \{channel = sfx
		qs(0x822ee5d2)}
	if (<status> = OFF)
		printf \{channel = sfx
			qs(0xa27c7a5f)}
		Wait \{0.85
			Seconds}
	else
		printf \{channel = sfx
			qs(0xc251d23b)}
		Wait \{1.4
			Seconds}
	endif
	printf \{channel = sfx
		qs(0xf92496e4)}
	array = []
	AddArrayElement array = <array> element = (($current_audio_options_song_guitar_vol) -10)
	AddArrayElement array = <array> element = (($current_audio_options_song_bass_vol) -10)
	AddArrayElement array = <array> element = (($current_audio_options_song_drums_vol) -10)
	AddArrayElement array = <array> element = 0.0
	AddArrayElement array = <array> element = (($current_audio_options_song_vocals_vol) -10)
	AddArrayElement array = <array> element = (($current_audio_options_song_band_vol) -10)
	printf \{channel = sfx
		qs(0xa030eeee)}
	SetSoundParams audio_options_song vol = <array> time = 1.0
	printf \{channel = sfx
		qs(0x7107be30)}
	Change \{songtemporarilydowninvolume = 0}
endscript

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
		ui_options_audio_update_mic_volume Player = <Player>
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
	if issoundplaying \{audio_options_song}
		printf \{channel = sfx
			qs(0xb836e193)}
		printf channel = sfx qs(0x9fd56364) s = ($current_audio_options_song_guitar_vol)
		printf channel = sfx qs(0x1f2ef878) s = ($current_audio_options_song_bass_vol)
		printf channel = sfx qs(0x2e8cc7ff) s = ($current_audio_options_song_drums_vol)
		printf \{channel = sfx
			qs(0xb7974577)}
		printf channel = sfx qs(0x347d5ccd) s = ($current_audio_options_song_vocals_vol)
		printf channel = sfx qs(0xb6e6b03c) s = ($current_audio_options_song_band_vol)
		array = []
		AddArrayElement array = <array> element = (($current_audio_options_song_guitar_vol) -10)
		AddArrayElement array = <array> element = (($current_audio_options_song_bass_vol) -10)
		AddArrayElement array = <array> element = (($current_audio_options_song_drums_vol) -10)
		AddArrayElement array = <array> element = 0.0
		AddArrayElement array = <array> element = (($current_audio_options_song_vocals_vol) -10)
		AddArrayElement array = <array> element = (($current_audio_options_song_band_vol) -10)
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
		get_savegame_from_player Player = <Player>
		GetGlobalTags savegame = <savegame> user_options
		micvolume = (<volumes>.guitar.mic.vol)
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
	if isps3
		switch <micvolume>
			case 11
			<micvolume> = -5.0
			<micgain> = 0.0
			<micthreshold> = -10
			<GAINMAKEUP> = 6
			case 10
			<micvolume> = -6.25
			<micgain> = 0.0
			<micthreshold> = -12
			<GAINMAKEUP> = 6
			case 9
			<micvolume> = -7.5
			<micgain> = 0.0
			<micthreshold> = -12
			<GAINMAKEUP> = 4
			case 8
			<micvolume> = -8.75
			<micgain> = 0.0
			<micthreshold> = -13
			<GAINMAKEUP> = 4
			case 7
			<micvolume> = -10.0
			<micgain> = 0.0
			<micthreshold> = -14
			<GAINMAKEUP> = 3
			case 6
			<micvolume> = -11.0
			<micgain> = 0.0
			<micthreshold> = -15
			<GAINMAKEUP> = 1
			case 5
			<micvolume> = -12.0
			<micgain> = 0.0
			<micthreshold> = -16
			<GAINMAKEUP> = 1
			case 4
			<micvolume> = -13.0
			<micgain> = 0.0
			<micthreshold> = -18
			<GAINMAKEUP> = 1
			case 3
			<micvolume> = -16.0
			<micgain> = 0.0
			<micthreshold> = -19
			<GAINMAKEUP> = 0
			case 2
			<micvolume> = -19.0
			<micgain> = 0.0
			<micthreshold> = -20
			<GAINMAKEUP> = 0
			case 1
			<micvolume> = -25.0
			<micgain> = 0.0
			<micthreshold> = -22
			<GAINMAKEUP> = 0
			case 0
			<micvolume> = -100.0
			<micgain> = 0.0
			<micthreshold> = -24
			<GAINMAKEUP> = 0
			default
			<micvolume> = -4.0
			<micgain> = 0.0
			<micthreshold> = -14
			<GAINMAKEUP> = 3
		endswitch
	else
		switch <micvolume>
			case 11
			case 10
			<micvolume> = -6.0
			<micgain> = 0.0
			<micthreshold> = -13
			<GAINMAKEUP> = 5
			case 9
			<micvolume> = -8.0
			<micgain> = 0.0
			<micthreshold> = -14
			<GAINMAKEUP> = 5
			case 8
			<micvolume> = -9.0
			<micgain> = 0.0
			<micthreshold> = -14
			<GAINMAKEUP> = 4.5
			case 7
			<micvolume> = -10.0
			<micgain> = 0.0
			<micthreshold> = -15
			<GAINMAKEUP> = 4
			case 6
			<micvolume> = -11.0
			<micgain> = 0.0
			<micthreshold> = -17
			<GAINMAKEUP> = 4
			case 5
			<micvolume> = -12.0
			<micgain> = 0.0
			<micthreshold> = -18
			<GAINMAKEUP> = 3
			case 4
			<micvolume> = -13.0
			<micgain> = 0.0
			<micthreshold> = -19
			<GAINMAKEUP> = 2
			case 3
			<micvolume> = -15.0
			<micgain> = 0.0
			<micthreshold> = -20
			<GAINMAKEUP> = 1
			case 2
			<micvolume> = -18.0
			<micgain> = 0.0
			<micthreshold> = -23
			<GAINMAKEUP> = 0
			case 1
			<micvolume> = -24.0
			<micgain> = 0.0
			<micthreshold> = -26
			<GAINMAKEUP> = 0
			case 0
			<micvolume> = -100.0
			<micgain> = 0.0
			<micthreshold> = -30
			<GAINMAKEUP> = 0
			default
			<micvolume> = -9.0
			<micgain> = 0.0
			<micthreshold> = -15
			<GAINMAKEUP> = 4
		endswitch
	endif
	if vocals_getmictype Player = <Player>
		printf channel = micshit qs(0x2b530af1) m = <specific_mic_type>
		if (<specific_mic_type> = singstar)
			<micthreshold> = (<micthreshold> - 4)
			<micgain> = (<micgain> + 0.6)
			<micvolume> = (<micvolume> + 1)
		endif
		if (<specific_mic_type> = headset)
			<micthreshold> = (<micthreshold> - 6)
			<micgain> = (<micgain> - 0)
			<micvolume> = (<micvolume> - 1.25)
		endif
		if (<specific_mic_type> = microsoft_wireless)
			<micthreshold> = (<micthreshold> - 6)
			<micgain> = (<micgain> - 2)
			<micvolume> = (<micvolume> + 0.75)
		endif
	endif
	if GotParam \{audio_getting_mic_device_info}
		if (<audio_getting_mic_device_info> = true)
			return {
				micvolume = <micvolume>
				audio_getting_mic_device_info = <audio_getting_mic_device_info>
			}
		endif
	endif
	vocals_setmicgain Player = <Player> gain = <micgain>
	setmicvolume controller = <controller> vol = <micvolume>
endscript

script options_audio_flip_mic_eq \{savegame = !i1768515945}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	Obj_GetID
	<objID> :se_setprops block_events
	options_change_vocals_mic_enhancement savegame = <savegame>
	GetGlobalTags savegame = <savegame> user_options param = vocals_mic_enhancement_save
	<mic_eq_alpha> = 0.5
	if (<vocals_mic_enhancement_save> = 0)
		user_control_helper_change_text \{button = blue
			text = qs(0x4c106ea5)}
	else
		<mic_eq_alpha> = 1.0
		user_control_helper_change_text \{button = blue
			text = qs(0x1aed888f)}
	endif
	if ScreenElementExists \{id = audiointerface}
		audiointerface :se_setprops {
			mic_eq_container_alpha = <mic_eq_alpha>
		}
	endif
	<objID> :se_setprops unblock_events
endscript

script options_audio_flip_dolby_option 
	RequireParams \{[
			savegame
		]
		all}
	GetGlobalTags savegame = <savegame> user_options
	if (<dolby_digital> = 0)
		SetGlobalTags user_options params = {dolby_digital = 1} savegame = <savegame>
		SpawnScriptNow \{waitthenplaydolbyonsound}
	else
		SetGlobalTags user_options params = {dolby_digital = 0} savegame = <savegame>
		SpawnScriptNow \{waitthenplaydolbyoffsound}
	endif
	ui_options_audio_set_dolby_digital savegame = <savegame>
	if (<dolby_digital> = 0)
		user_control_helper_change_text \{button = yellow
			text = qs(0xe7218229)}
	else
		user_control_helper_change_text \{button = yellow
			text = qs(0x6ea63e4d)}
	endif
endscript

script options_audio_reset_dolby_option 
endscript

script waitthenplaydolbyonsound 
	Wait \{0.4
		Seconds}
	StopSoundEvent \{audio_ui_audio_options_dolby_on}
	StopSoundEvent \{audio_ui_audio_options_dolby_off}
	SpawnScriptNow \{turndownsongtemporarily
		params = {
			status = On
		}}
	SoundEvent \{event = audio_ui_audio_options_dolby_on}
endscript

script waitthenplaydolbyoffsound 
	Wait \{0.2
		Seconds}
	StopSoundEvent \{audio_ui_audio_options_dolby_on}
	StopSoundEvent \{audio_ui_audio_options_dolby_off}
	SpawnScriptNow \{turndownsongtemporarily
		params = {
			status = OFF
		}}
	SoundEvent \{event = audio_ui_audio_options_dolby_off}
endscript

script ui_options_audio_set_dolby_digital 
	RequireParams \{[
			savegame
		]
		all}
	SpawnScriptNow ui_options_audio_set_dolby_digital_spawned params = {<...>}
endscript

script ui_options_audio_set_dolby_digital_spawned 
	GetGlobalTags savegame = <savegame> user_options param = dolby_digital
	begin
	if ($boot_movie_done = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if (<dolby_digital> = 0)
		disabledolbydigital
	else
		enabledolbydigital
	endif
	ui_options_audio_set_dolby_switch dolby_digital = <dolby_digital>
endscript

script options_audio_check_initial_preset 
	RequireParams \{[
			initial_volume
			Volume
		]
		all}
	GetArraySize <initial_volume>
	preset_mode = Normal
	i = 0
	begin
	if ((<Volume> [<i>]) != (<initial_volume> [<i>]))
		<preset_mode> = custom
		break
	endif
	<i> = (<i> + 1)
	repeat (<array_Size> - 1)
	if (<preset_mode> != custom)
		<i> = (<array_Size> - 1)
		if ((<Volume> [<i>]) = (<initial_volume> [<i>]))
			preset_mode = Normal
		elseif ((<Volume> [<i>] = 10))
			preset_mode = concert
		elseif ((<Volume> [<i>]) = 0)
			preset_mode = CD
		else
			preset_mode = custom
		endif
	endif
	return preset_mode = <preset_mode>
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
		printf \{channel = sfx
			qs(0xb7974577)}
		printf channel = sfx qs(0x347d5ccd) s = ($current_audio_options_song_vocals_vol)
		printf channel = sfx qs(0xb6e6b03c) s = ($current_audio_options_song_band_vol)
		if ($songtemporarilydowninvolume = 1)
			array = []
			AddArrayElement array = <array> element = (($current_audio_options_song_guitar_vol) -20)
			AddArrayElement array = <array> element = (($current_audio_options_song_bass_vol) -20)
			AddArrayElement array = <array> element = (($current_audio_options_song_drums_vol) -20)
			AddArrayElement array = <array> element = 0.0
			AddArrayElement array = <array> element = (($current_audio_options_song_vocals_vol) -20)
			AddArrayElement array = <array> element = (($current_audio_options_song_band_vol) -20)
		else
			array = []
			AddArrayElement array = <array> element = (($current_audio_options_song_guitar_vol) -10)
			AddArrayElement array = <array> element = (($current_audio_options_song_bass_vol) -10)
			AddArrayElement array = <array> element = (($current_audio_options_song_drums_vol) -10)
			AddArrayElement array = <array> element = 0.0
			AddArrayElement array = <array> element = (($current_audio_options_song_vocals_vol) -10)
			AddArrayElement array = <array> element = (($current_audio_options_song_band_vol) -10)
		endif
		printf \{channel = sfx
			qs(0xaec49e26)}
		PlaySound {
			audio_options_song
			buss = Master
			pan = {
				ch1_2 = [0 1 0 1]
				ch3_4 = [0 1 0 1]
				ch5_6 = [0 1 0 1]
				ch7_8 = [0 1 0 1]
				removecenter = [1 1 1 1]
			}
			vol = <array>
		}
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script update_mic_eq_setting \{savegame = !i1768515945}
	GetGlobalTags savegame = <savegame> user_options param = vocals_mic_enhancement_save
	if (<vocals_mic_enhancement_save> = 1)
		printscriptinfo \{'update_mic_eq_setting - Turning it ON!'}
		audio_set_microphone_eq \{effect = On}
	else
		printscriptinfo \{'update_mic_eq_setting - Turning it OFF!'}
		audio_set_microphone_eq \{effect = OFF}
	endif
endscript

script set_audio_options_for_primary_controller 
	get_savegame_from_controller controller = ($primary_controller)
	ui_options_audio_set_dolby_digital savegame = <savegame>
	update_all_volumes_savegame savegame = <savegame>
	update_mic_eq_setting savegame = <savegame>
endscript
