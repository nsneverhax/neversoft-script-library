
script ui_create_options_audio 
	RequireParams \{[
			from_pause_menu
		]
		all}
	Menu_Music_Off
	spawnscriptlater \{Spawned_Looping_Audio_Options_Song}
	if NOT GotParam \{device_num}
		device_num = ($primary_controller)
	endif
	vocals_mute_all_mics \{mute = false}
	get_savegame_from_controller controller = <device_num>
	GetGlobalTags user_options savegame = <savegame>
	volume = [0 0 0 0 0 0 0 0]
	SetArrayElement arrayName = volume index = 0 newValue = (<volumes>.guitar.guitar.vol)
	SetArrayElement arrayName = volume index = 1 newValue = (<volumes>.guitar.bass.vol)
	SetArrayElement arrayName = volume index = 2 newValue = (<volumes>.guitar.Drum.vol)
	SetArrayElement arrayName = volume index = 3 newValue = (<volumes>.guitar.vocals.vol)
	SetArrayElement arrayName = volume index = 4 newValue = (<volumes>.guitar.Band.vol)
	SetArrayElement arrayName = volume index = 5 newValue = (<volumes>.guitar.mic.vol)
	SetArrayElement arrayName = volume index = 6 newValue = (<volumes>.guitar.sfx.vol)
	SetArrayElement arrayName = volume index = 7 newValue = (<volumes>.guitar.Crowd.vol)
	initial_volume = [7 7 7 7 7 7 7 7]
	FormatText \{TextName = dolby_on_text
		qs(0x50fcfa48)}
	CreateScreenElement {
		parent = root_window
		id = AudioInterface
		type = DescInterface
		desc = 'options_audio_mixer'
		dolby_on_text = <dolby_on_text>
		tags = {
			volume = <volume> eq = <eq>
			dolby_digital = <dolby_digital>
			initial_volume = <initial_volume>
			device_num = <device_num>
			from_pause_menu = <from_pause_menu>
		}
		z_priority = 650
		exclusive_device = <device_num>
	}
	AudioInterface :SE_SetProps \{mixer_channel_lamp_alpha = 0.0}
	if AudioInterface :Desc_ResolveAlias \{name = alias_audio_mixer_menu}
		AssignAlias id = <resolved_id> alias = current_menu
		AssignAlias id = <resolved_id> alias = mixer_text_menu
		<resolved_id> :SE_SetProps {
			event_handlers = [
				{pad_back ui_options_check_settings}
				{pad_option ui_options_audio_reset_values params = {savegame = <savegame>}}
				{pad_option2 options_audio_flip_dolby_option params = {savegame = <savegame>}}
				{menu_selection_changed ui_options_audio_text_menu_sound}
			]
			tags = {current_focused_idx = -1}
		}
		if GetScreenElementChildren \{id = mixer_text_menu}
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			<current_item> :SE_SetProps {
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
			repeat <array_size>
		endif
	endif
	if AudioInterface :Desc_ResolveAlias \{name = alias_faders_container}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			<current_item> :SE_SetProps {
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
			repeat <array_size>
		endif
	endif
	ui_options_audio_set_values
	ui_options_audio_set_dolby_digital savegame = <savegame>
	ui_options_audio_set_default_volume_lights default_volumes = <initial_volume>
	add_gamertag_helper exclusive_device = <device_num>
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
	add_user_control_helper \{text = qs(0x38ee4773)
		button = blue
		z = 100000}
	ui_options_set_settings
	if ScreenElementExists \{id = mixer_text_menu}
		LaunchEvent \{type = focus
			target = mixer_text_menu
			data = {
				child_index = 0
			}}
	endif
endscript

script ui_destroy_options_audio 
	killspawnedscript \{name = Spawned_Looping_Audio_Options_Song}
	StopSoundEvent \{Audio_Options_Menu_Microphone
		fade_time = 0.3
		fade_type = linear}
	StopSound \{Audio_Options_Song}
	if GameIsPaused
		printf \{channel = sfx
			qs(0xd1bc0783)}
	else
		printf \{channel = sfx
			qs(0xc9aa4352)}
		if NOT ScriptIsRunning \{fretbar_update_tempo}
			menu_music_on
		endif
	endif
	spawnscriptnow \{No_Dolby_Digital_Sounds}
	vocals_mute_all_mics \{mute = true}
	DestroyScreenElement \{id = AudioInterface}
	generic_ui_destroy
endscript

script ui_options_audio_reset_values 
	RequireParams \{[
			savegame
		]
		all}
	AudioInterface :GetTags
	GetArraySize <initial_volume>
	i = 0
	begin
	if ((<volume> [<i>]) != (<initial_volume> [<i>]))
		SoundEvent \{event = Menu_Audio_Options_Reset}
		break
	endif
	<i> = (<i> + 1)
	repeat (<array_size>)
	AudioInterface :SetTags {volume = <initial_volume> eq = <initial_eq>}
	ui_options_audio_set_values \{time = 0.3}
endscript

script ui_options_audio_set_values \{time = 0.0}
	AudioInterface :GetTags
	if AudioInterface :Desc_ResolveAlias \{name = alias_faders_container}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <volume>
			i = 0
			begin
			posx = 3
			posy = (-27 + (265 * (1.0 - ((<volume> [<i>]) / 11.0))))
			<fader> = (<children> [<i>])
			<fader> :SE_SetProps {
				mixer_fader_pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posy>))
				time = <time>
			}
			j = 1
			alpha_value = 0
			begin
			FormatText checksumname = fader_light 'lights_ON_%a_alpha' a = <j>
			<alpha_value> = 0
			if (<j> <= (<volume> [<i>]))
				<alpha_value> = 1
			endif
			AddParam structure_name = fader_light_alpha_struct name = <fader_light> value = <alpha_value>
			<fader> :SE_SetProps {
				<fader_light_alpha_struct>
				time = <time>
			}
			<j> = (<j> + 1)
			repeat 10
			i = (<i> + 1)
			repeat (<array_size>)
		endif
	endif
	if (<from_pause_menu> = 1)
		get_local_in_game_player_num_from_controller controller_index = <device_num>
		if (<player_num> != -1)
			if PlayerInfoEquals <player_num> bot_play = 1
				<controller> = 0
			endif
		endif
	endif
	UpdateVolumesTag part = guitar name = guitar params = {vol = (<volume> [0])}
	UpdateVolumesTag part = guitar name = bass params = {vol = (<volume> [1])}
	UpdateVolumesTag part = guitar name = Drum params = {vol = (<volume> [2])}
	UpdateVolumesTag part = guitar name = vocals params = {vol = (<volume> [3])}
	UpdateVolumesTag part = guitar name = Band params = {vol = (<volume> [4])}
	UpdateVolumesTag part = guitar name = mic params = {vol = (<volume> [5])} controller = <controller>
	UpdateVolumesTag part = guitar name = sfx params = {vol = (<volume> [6])}
	UpdateVolumesTag part = guitar name = Crowd params = {vol = (<volume> [7])}
	ui_options_audio_update_all_volumes
	SongSetPlayerEQSettings
endscript

script ui_options_audio_text_menu_sound 
	SoundEvent \{event = UI_Fader}
endscript

script ui_options_audio_focus_text_menu 
	RequireParams \{[
			text_idx
		]
		all}
	if ScreenElementExists \{id = AudioInterface}
		initial_highlight_pos = (-100.0, -143.0)
		GetTags
		Obj_GetID
		GetScreenElementPosition id = <objID>
		SE_SetProps \{alpha = 1.0}
		AudioInterface :SE_GetProps
		switch <text_idx>
			case 0
			AudioInterface :SE_SetProps \{mixer_menu_highlight_dims = (95.0, 40.0)}
			spacing = (115.0, 0.0)
			case 1
			AudioInterface :SE_SetProps \{mixer_menu_highlight_dims = (105.0, 40.0)}
			spacing = (112.0, 0.0)
			case 2
			AudioInterface :SE_SetProps \{mixer_menu_highlight_dims = (105.0, 40.0)}
			spacing = (116.0, 0.0)
			case 3
			AudioInterface :SE_SetProps \{mixer_menu_highlight_dims = (105.0, 40.0)}
			spacing = (117.5, 0.0)
			case 4
			AudioInterface :SE_SetProps \{mixer_menu_highlight_dims = (130.0, 40.0)}
			spacing = (115.0, 0.0)
			case 5
			AudioInterface :SE_SetProps \{mixer_menu_highlight_dims = (105.0, 40.0)}
			spacing = (118.4, 0.0)
			case 6
			AudioInterface :SE_SetProps \{mixer_menu_highlight_dims = (105.0, 40.0)}
			spacing = (118.6, 0.0)
			case 7
			AudioInterface :SE_SetProps \{mixer_menu_highlight_dims = (95.0, 40.0)}
			spacing = (119.5, 0.0)
			default
			ScriptAssert \{'out of audio mixer range'}
		endswitch
		if NOT (<mixer_menu_highlight_alpha> = 0.3)
			AudioInterface :SE_SetProps \{mixer_menu_highlight_alpha = 0.3
				time = 0.1}
		endif
		AudioInterface :SE_SetProps mixer_menu_highlight_pos = (<initial_highlight_pos> + (<spacing> * <text_idx>)) time = 0.1
		if ScreenElementExists \{id = mixer_text_menu}
			mixer_text_menu :SetTags {current_focused_idx = <text_idx>}
			mixer_text_menu :SE_SetProps \{alpha = 1
				time = 0.1}
		endif
	endif
endscript

script ui_options_audio_unfocus_text_menu 
	SE_SetProps \{alpha = 0.5}
endscript

script ui_options_audio_choose 
	SoundEvent \{event = Sound_Options_Select}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
	add_user_control_helper \{text = qs(0xb63a145a)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xf7723015)
		button = red
		z = 100000}
	GetTags
	if AudioInterface :Desc_ResolveAlias \{name = alias_faders_container}
		if ResolveScreenElementID id = {<resolved_id> child = <index>}
			AudioInterface :SE_SetProps \{mixer_channel_lamp_alpha = 1.0
				time = 0.1}
			LaunchEvent \{type = unfocus
				target = mixer_text_menu}
			AudioInterface :GetTags
			<resolved_id> :SE_GetProps
			<resolved_id> :SetTags {
				current = slider
				highlight = slider
				old_volume = (<volume> [<index>])
			}
			LaunchEvent type = focus target = <resolved_id>
		endif
	endif
	mixer_text_menu :SE_SetProps \{alpha = 0.5
		time = 0.1}
	AudioInterface :SE_SetProps \{mixer_menu_highlight_alpha = 0.3
		time = 0.1}
	ui_options_sound_event \{choose}
endscript

script ui_options_audio_focus_preset_menu_text 
	SE_SetProps \{alpha = 1.0}
endscript

script ui_options_audio_unfocus_preset_menu_text 
	SE_SetProps \{alpha = 0.5}
endscript

script ui_options_audio_unfocus_preset_menu 
	if ScreenElementExists \{id = AudioInterface}
		AudioInterface :SE_SetProps \{mixer_preset_on_state_alpha = 0
			time = 0.1}
	endif
endscript

script ui_options_audio_preset_choose 
	SoundEvent \{event = Sound_Options_Select}
	RequireParams \{[
			preset_idx
		]
		all}
	if ScreenElementExists \{id = AudioInterface}
		AudioInterface :GetTags
		if (<preset_idx> = 3)
			if ScreenElementExists \{id = mixer_preset_menu}
				LaunchEvent \{type = unfocus
					target = mixer_preset_menu}
			endif
			if ScreenElementExists \{id = mixer_text_menu}
				LaunchEvent \{type = focus
					target = mixer_text_menu}
			endif
		else
			GetArraySize <volume>
			i = 0
			begin
			SetArrayElement arrayName = volume index = <i> newValue = (<initial_volume> [<i>])
			<i> = (<i> + 1)
			repeat (<array_size> - 1)
			switch <preset_idx>
				case 0
				SetArrayElement \{arrayName = volume
					index = 6
					newValue = 7}
				case 1
				SetArrayElement \{arrayName = volume
					index = 6
					newValue = 10}
				case 2
				SetArrayElement \{arrayName = volume
					index = 6
					newValue = 0}
				default
				ScriptAssert \{'invalid preset mode!'}
			endswitch
			AudioInterface :SetTags volume = <volume>
			ui_options_audio_set_values \{time = 0.1}
			ui_options_sound_event \{slider
				index = 6}
		endif
	endif
endscript

script ui_options_audio_preset_back 
	GetTags
	SE_GetProps
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
	menu_finish
	if AudioInterface :Desc_ResolveAlias \{name = alias_mixer_preset_menu}
		ui_options_sound_event \{back}
		SetTags \{current = None}
		LaunchEvent type = unfocus target = <resolved_id>
		AudioInterface :SE_SetProps \{mixer_preset_container_alpha = 0}
		mixer_text_menu :SE_SetProps \{alpha = 1.0
			time = 0.1}
		LaunchEvent \{type = focus
			target = mixer_text_menu}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		add_user_control_helper \{text = qs(0x38ee4773)
			button = blue
			z = 100000}
	endif
endscript

script ui_options_audio_set_preset_menu_option 
	RequireParams \{[
			preset_mode
		]
		all}
	if ScreenElementExists \{id = AudioInterface}
		clean_up_user_control_helpers
		add_gamertag_helper exclusive_device = <device_num>
		menu_finish
		if AudioInterface :Desc_ResolveAlias \{name = alias_mixer_preset_menu}
			AudioInterface :SE_SetProps \{mixer_preset_container_alpha = 1}
			AudioInterface :SE_SetProps \{mixer_channel_lamp_alpha = 0
				time = 0.1}
			switch <preset_mode>
				case Normal
				LaunchEvent type = focus target = <resolved_id> data = {child_index = 0}
				case concert
				LaunchEvent type = focus target = <resolved_id> data = {child_index = 1}
				case CD
				LaunchEvent type = focus target = <resolved_id> data = {child_index = 2}
				case custom
				default
				LaunchEvent type = focus target = <resolved_id> data = {child_index = 3}
			endswitch
		endif
		AudioInterface :SE_SetProps \{mixer_preset_on_state_alpha = 0.5
			time = 0.1}
		ui_options_sound_event \{choose}
	endif
endscript

script ui_options_audio_focus_preset_menu 
	if ScreenElementExists \{id = mixer_text_menu}
		mixer_text_menu :SE_SetProps \{alpha = 0.5
			time = 0.1}
	endif
	if ScreenElementExists \{id = AudioInterface}
		AudioInterface :SE_SetProps \{mixer_preset_on_state_alpha = 0.5
			time = 0.1}
	endif
endscript

script ui_options_audio_focus_fader_menu 
	GetTags
	if (<current> = None)
		if (<highlight> = slider)
			SE_SetProps \{mixer_fader_highlight_alpha = 0.5}
		else
			SE_SetProps \{mixer_fader_highlight_alpha = 0.0}
		endif
	elseif (<current> = slider)
		SE_SetProps \{mixer_fader_highlight_alpha = 1.0}
	else
		SE_SetProps \{mixer_fader_highlight_alpha = 0.0}
	endif
endscript

script ui_options_audio_unfocus_fader_menu 
	GetTags
	SE_SetProps \{mixer_fader_highlight_alpha = 0.0}
endscript

script ui_options_audio_fader_choose 
	RequireParams \{[
			savegame
		]
		all}
	GetTags
	SE_GetProps
	SoundEvent \{event = Sound_Options_Select}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
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
	add_user_control_helper \{text = qs(0x38ee4773)
		button = blue
		z = 100000}
	if (<current> = None)
		SetTags \{current = slider
			highlight = slider}
	elseif (<current> = slider)
		SetTags \{current = None}
		LaunchEvent \{type = focus
			target = mixer_text_menu}
		mixer_text_menu :SE_SetProps \{alpha = 1.0
			time = 0.1}
		LaunchEvent type = unfocus target = <objID>
		ui_options_sound_event \{choose}
		return
	else
		SetTags \{current = None
			highlight = dial}
	endif
	generic_menu_pad_choose_sound
	ui_options_audio_focus_fader_menu
endscript

script ui_options_audio_fader_back 
	RequireParams \{[
			savegame
		]
		all}
	SoundEvent \{event = Sound_Options_Back}
	GetTags
	Obj_GetID
	SE_GetProps
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
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
	add_user_control_helper \{text = qs(0x38ee4773)
		button = blue
		z = 100000}
	AudioInterface :GetTags
	SetArrayElement arrayName = volume index = <index> newValue = <old_volume>
	AudioInterface :SetTags volume = <volume>
	ui_options_audio_set_values \{time = 0.1}
	if (<current> = None)
		printf \{channel = options_audio
			qs(0x05b5b626)}
		LaunchEvent \{type = focus
			target = mixer_text_menu}
		mixer_text_menu :SE_SetProps \{alpha = 1.0
			time = 0.1}
		LaunchEvent type = unfocus target = <objID>
	elseif (<current> = slider)
		ui_options_sound_event \{back}
		SetTags \{current = None}
		LaunchEvent \{type = focus
			target = mixer_text_menu}
		mixer_text_menu :SE_SetProps \{alpha = 1.0
			time = 0.1}
		LaunchEvent type = unfocus target = <objID>
	else
		SetTags \{current = None}
		ui_options_audio_focus_fader_menu
	endif
endscript

script ui_options_audio_fader_dir 
	GetTags
	if (<current> = None)
		SetTags \{highlight = slider}
		generic_menu_up_or_down_sound
	elseif (<current> = slider)
		AudioInterface :GetTags
		new_volume = 0
		min_volume = 0
		dolby_changed = 0
		if GotParam \{down}
			new_volume = (<volume> [<index>])
			if (<index> <= 4)
				min_volume = 5
			endif
			if NOT (<new_volume> <= <min_volume>)
				new_volume = ((<volume> [<index>]) - 1)
			else
				if ($paused_for_hardware = 0)
				endif
			endif
		else
			new_volume = (<volume> [<index>])
			if NOT (<new_volume> >= 10)
				new_volume = ((<volume> [<index>]) + 1)
			else
				if ($paused_for_hardware = 0)
				endif
			endif
		endif
		if NOT (<new_volume> = (<volume> [<index>]))
			SoundEvent \{event = Audio_Options_Scroll}
			SetArrayElement arrayName = volume index = <index> newValue = <new_volume>
			AudioInterface :SetTags volume = <volume>
			ui_options_audio_set_values \{time = 0.1}
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
	if ScreenElementExists \{id = AudioInterface}
		if (<dolby_digital> = 1)
			dolby_on_alpha = 1.0
			dolby_off_alpha = 0.5
		else
			dolby_on_alpha = 0.5
			dolby_off_alpha = 1.0
		endif
		AudioInterface :SE_SetProps {
			dolby_on_alpha = <dolby_on_alpha>
			dolby_off_alpha = <dolby_off_alpha>
		}
	endif
endscript

script ui_options_audio_mixer_back 
	SoundEvent \{event = Sound_Options_Back}
	if ScreenElementExists \{id = mixer_text_menu}
		ui_options_sound_event \{back}
		SetTags \{current = None}
		LaunchEvent \{type = unfocus
			target = mixer_text_menu}
		AudioInterface :SE_SetProps \{mixer_menu_highlight_alpha = 0
			time = 0.1}
		mixer_text_menu :SE_SetProps \{alpha = 0.5
			time = 0.1}
		LaunchEvent \{type = focus
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
				LaunchEvent type = focus target = mixer_text_menu data = {child_index = (<current_focused_idx> - 1)}
			endif
		else
			GetScreenElementChildren \{id = mixer_text_menu}
			GetArraySize <children>
			if (<current_focused_idx> < (<array_size> - 1))
				LaunchEvent type = focus target = mixer_text_menu data = {child_index = (<current_focused_idx> + 1)}
			endif
		endif
		sound_options_scroll
	endif
endscript

script ui_options_sound_event 
	AudioInterface :GetTags
	if GotParam \{slider}
		current_volume = (<volume> [<index>])
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
			SoundEvent \{event = Audio_Options_Menu_Microphone}
			case 6
			printf \{channel = sfx
				qs(0x3a27d10c)}
			SoundEvent \{event = Audio_Options_Menu_SFX}
			case 7
			printf \{channel = sfx
				qs(0x233ce04d)}
			SoundEvent \{event = Audio_Options_Menu_Crowd}
			default
			printf \{channel = sfx
				qs(0x6ffa4873)}
		endswitch
	elseif GotParam \{dolby_option}
		if (<dolby_digital> = 1)
			PlaySound \{Menu_DolbyDigitalEnable_Surround_L
				vol = -2
				pan1x = -1
				pan1y = 1
				buss = front_end}
			PlaySound \{Menu_DolbyDigitalEnable_Surround_C
				vol = -2
				pan1x = 0
				pan1y = 1
				buss = front_end}
			PlaySound \{Menu_DolbyDigitalEnable_Surround_R
				vol = -2
				pan1x = 1
				pan1y = 1
				buss = front_end}
			PlaySound \{Menu_DolbyDigitalEnable_Surround_Ls
				vol = -2
				pan1x = -1
				pan1y = -1
				buss = front_end}
			PlaySound \{Menu_DolbyDigitalEnable_Surround_Rs
				vol = -2
				pan1x = 1
				pan1y = -1
				buss = front_end}
			PlaySound \{Menu_DolbyDigitalEnable_Surround_Lf
				vol = -2
				LFEOnly = true
				LFE_vol = -15
				buss = front_end}
		else
			SoundEvent \{event = dolby_off}
		endif
	elseif GotParam \{back}
		StopSound \{audio_options_guitar
			fade_time = 0.3
			fade_type = linear}
		StopSound \{audio_options_bass
			fade_time = 0.3
			fade_type = linear}
		StopSound \{audio_options_drum
			fade_time = 0.3
			fade_type = linear}
		StopSound \{Audio_Options_Mic
			fade_time = 0.3
			fade_type = linear}
		StopSound \{Audio_Options_SFX
			fade_time = 0.3
			fade_type = linear}
		StopSound \{Audio_Options_Instruments
			fade_time = 0.3
			fade_type = linear}
		StopSound \{Audio_Options_Vocals
			fade_time = 0.3
			fade_type = linear}
		spawnscriptnow \{No_Dolby_Digital_Sounds}
	elseif GotParam \{backgeneric}
		generic_menu_pad_back_sound
	elseif GotParam \{choose}
		StopSound \{audio_options_guitar
			fade_time = 0.3
			fade_type = linear}
		StopSound \{audio_options_bass
			fade_time = 0.3
			fade_type = linear}
		StopSound \{audio_options_drum
			fade_time = 0.3
			fade_type = linear}
		StopSound \{Audio_Options_Mic
			fade_time = 0.3
			fade_type = linear}
		StopSound \{Audio_Options_SFX
			fade_time = 0.3
			fade_type = linear}
		StopSound \{Audio_Options_Instruments
			fade_time = 0.3
			fade_type = linear}
		StopSound \{Audio_Options_Vocals
			fade_time = 0.3
			fade_type = linear}
		spawnscriptnow \{No_Dolby_Digital_Sounds}
	endif
endscript
songtemporarilydowninvolume = 0

script TurnDownSongTemporarily \{status = on}
	printf \{channel = sfx
		qs(0xa5726d44)}
	Change \{songtemporarilydowninvolume = 1}
	array = []
	AddArrayElement array = <array> element = (($current_audio_options_song_guitar_vol) -15)
	AddArrayElement array = <array> element = (($current_audio_options_song_bass_vol) -15)
	AddArrayElement array = <array> element = (($current_audio_options_song_drums_vol) -15)
	AddArrayElement array = <array> element = 0.0
	AddArrayElement array = <array> element = (($current_audio_options_song_vocals_vol) -15)
	AddArrayElement array = <array> element = (($current_audio_options_song_band_vol) -15)
	printf \{channel = sfx
		qs(0xa030eeee)}
	SetSoundParams Audio_Options_Song vol = <array> time = 0.5
	printf \{channel = sfx
		qs(0x822ee5d2)}
	if (<status> = off)
		printf \{channel = sfx
			qs(0xa27c7a5f)}
		wait \{0.3
			seconds}
	else
		printf \{channel = sfx
			qs(0xc251d23b)}
		wait \{1.25
			seconds}
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
	SetSoundParams Audio_Options_Song vol = <array> time = 1.0
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
	return volume = <spinal_tap_volume>
endscript

script ui_options_audio_get_buss_volume 
	printf channel = sfx qs(0xfccb832c) v = <volume>
	switch <volume>
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
	printf channel = sfx qs(0xb845156d) v = <volume>
	switch <volume>
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
	switch <volume>
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
	AudioInterface :GetTags
	update_all_volumes <...>
endscript

script update_all_volumes \{time = 0
		device_num = 0}
	if GotParam \{player}
		get_savegame_from_player player = <player>
		update_all_volumes_savegame player = <player> savegame = <savegame>
	else
		get_savegame_from_controller controller = <device_num>
		if (<from_pause_menu> = 1)
			get_local_in_game_player_num_from_controller controller_index = <device_num>
			if (<player_num> != -1)
				update_all_volumes_savegame player = <player_num> savegame = <savegame>
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
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.guitar.vol) instr = qs(0x09048d9e)
	SoundBussUnlock \{User_Guitar}
	SoundBussUnlock \{User_RhythmGTR}
	SetSoundBussParams {User_RhythmGTR = {vol = <vol>} time = <time>}
	SetSoundBussParams {User_Guitar = {vol = <vol>} time = <time>}
	SoundBussLock \{User_Guitar}
	SoundBussLock \{User_RhythmGTR}
	ui_options_audio_get_options_screen_volume volume = (<volumes>.guitar.guitar.vol)
	Change current_audio_options_song_guitar_vol = <vol>
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.bass.vol) instr = qs(0xb6237ee8)
	SoundBussUnlock \{User_Bass}
	SetSoundBussParams {User_Bass = {vol = <vol>} time = <time>}
	SoundBussLock \{User_Bass}
	ui_options_audio_get_options_screen_volume volume = (<volumes>.guitar.bass.vol)
	Change current_audio_options_song_bass_vol = <vol>
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.Drum.vol) instr = qs(0xbcbd3cf7)
	SoundBussUnlock \{User_Drums}
	SetSoundBussParams {User_Drums = {vol = <vol>} time = <time>}
	SoundBussLock \{User_Drums}
	ui_options_audio_get_options_screen_volume volume = (<volumes>.guitar.Drum.vol)
	Change current_audio_options_song_drums_vol = <vol>
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.vocals.vol) instr = qs(0x879f5b50)
	SoundBussUnlock \{User_Vocals}
	SetSoundBussParams {User_Vocals = {vol = <vol>} time = <time>}
	SoundBussLock \{User_Vocals}
	ui_options_audio_get_options_screen_volume volume = (<volumes>.guitar.vocals.vol)
	Change current_audio_options_song_vocals_vol = <vol>
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.Band.vol) instr = qs(0x11d3753c)
	SoundBussUnlock \{User_Band}
	SetSoundBussParams {User_Band = {vol = <vol>} time = <time>}
	SoundBussLock \{User_Band}
	ui_options_audio_get_options_screen_volume volume = (<volumes>.guitar.Band.vol)
	Change current_audio_options_song_band_vol = <vol>
	ui_options_audio_get_buss_volume_full_dynamics volume = (<volumes>.guitar.mic.vol)
	sidechainvolumesetting = (<volumes>.guitar.mic.vol)
	if (<sidechainvolumesetting> > 7)
		<sidechainvolumesetting> = 7
	endif
	casttofloat \{sidechainvolumesetting}
	Change sidechainingvolumepercentadjustment = (<sidechainvolumesetting> / 7.0)
	if GotParam \{player}
		ui_options_audio_update_mic_volume player = <player>
	endif
	SoundBussUnlock \{User_Microphone}
	SetSoundBussParams {User_Microphone = {vol = <vol>} time = <time>}
	SoundBussLock \{User_Microphone}
	ui_options_audio_get_buss_volume_full_dynamics volume = (<volumes>.guitar.sfx.vol)
	SoundBussUnlock \{User_SFX}
	SetSoundBussParams {User_SFX = {vol = <vol>} time = <time>}
	SoundBussLock \{User_SFX}
	ui_options_audio_get_buss_volume_full_dynamics volume = (<volumes>.guitar.Crowd.vol)
	SoundBussUnlock \{User_Crowd}
	SoundBussUnlock \{User_CrowdSingalong}
	SetSoundBussParams {User_Crowd = {vol = <vol>} time = <time>}
	SetSoundBussParams {User_CrowdSingalong = {vol = <vol>} time = <time>}
	SoundBussLock \{User_Crowd}
	SoundBussLock \{User_CrowdSingalong}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.backup.vol)
	if issoundplaying \{Audio_Options_Song}
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
		SetSoundParams Audio_Options_Song vol = <array>
	endif
endscript

script ui_options_audio_update_mic_volume 
	RequireParams \{[
			player
		]
		all}
	if PlayerInfoEquals <player> is_local_client = 0
		return
	endif
	GameMode_GetType
	if (<type> = freeplay)
		GetPlayerInfo <player> freeplay_mic_volume
		micvolume = <freeplay_mic_volume>
	else
		get_savegame_from_player player = <player>
		GetGlobalTags savegame = <savegame> user_options
		micvolume = (<volumes>.guitar.mic.vol)
	endif
	mic_set_device_volume player = <player> micvolume = <micvolume>
endscript

script mic_set_device_volume 
	RequireParams \{[
			player
			micvolume
		]
		all}
	if PlayerInfoEquals <player> bot_play = 1
		return
	endif
	GetInputHandlerBotIndex player = <player>
	<bot_controller> = <controller>
	GetPlayerInfo <player> controller
	if (<bot_controller> = <controller>)
		return
	endif
	if PlayerInfoEquals <player> is_local_client = 0
		return
	endif
	if NOT PlayerInfoEquals <player> part = vocals
		return
	endif
	if IsPS3
		switch <micvolume>
			case 11
			<micvolume> = -5.0
			<micgain> = 0.0
			<micthreshold> = -10
			<gainmakeup> = 6
			case 10
			<micvolume> = -6.25
			<micgain> = 0.0
			<micthreshold> = -12
			<gainmakeup> = 6
			case 9
			<micvolume> = -7.5
			<micgain> = 0.0
			<micthreshold> = -12
			<gainmakeup> = 4
			case 8
			<micvolume> = -8.75
			<micgain> = 0.0
			<micthreshold> = -13
			<gainmakeup> = 4
			case 7
			<micvolume> = -10.0
			<micgain> = 0.0
			<micthreshold> = -14
			<gainmakeup> = 3
			case 6
			<micvolume> = -11.0
			<micgain> = 0.0
			<micthreshold> = -15
			<gainmakeup> = 1
			case 5
			<micvolume> = -12.0
			<micgain> = 0.0
			<micthreshold> = -16
			<gainmakeup> = 1
			case 4
			<micvolume> = -13.0
			<micgain> = 0.0
			<micthreshold> = -18
			<gainmakeup> = 1
			case 3
			<micvolume> = -16.0
			<micgain> = 0.0
			<micthreshold> = -19
			<gainmakeup> = 0
			case 2
			<micvolume> = -19.0
			<micgain> = 0.0
			<micthreshold> = -20
			<gainmakeup> = 0
			case 1
			<micvolume> = -25.0
			<micgain> = 0.0
			<micthreshold> = -22
			<gainmakeup> = 0
			case 0
			<micvolume> = -100.0
			<micgain> = 0.0
			<micthreshold> = -24
			<gainmakeup> = 0
			default
			<micvolume> = -4.0
			<micgain> = 0.0
			<micthreshold> = -14
			<gainmakeup> = 3
		endswitch
	else
		switch <micvolume>
			case 11
			case 10
			<micvolume> = -6.0
			<micgain> = 0.0
			<micthreshold> = -13
			<gainmakeup> = 5
			case 9
			<micvolume> = -8.0
			<micgain> = 0.0
			<micthreshold> = -14
			<gainmakeup> = 5
			case 8
			<micvolume> = -9.0
			<micgain> = 0.0
			<micthreshold> = -14
			<gainmakeup> = 4.5
			case 7
			<micvolume> = -10.0
			<micgain> = 0.0
			<micthreshold> = -15
			<gainmakeup> = 4
			case 6
			<micvolume> = -11.0
			<micgain> = 0.0
			<micthreshold> = -17
			<gainmakeup> = 4
			case 5
			<micvolume> = -12.0
			<micgain> = 0.0
			<micthreshold> = -18
			<gainmakeup> = 3
			case 4
			<micvolume> = -13.0
			<micgain> = 0.0
			<micthreshold> = -19
			<gainmakeup> = 2
			case 3
			<micvolume> = -15.0
			<micgain> = 0.0
			<micthreshold> = -20
			<gainmakeup> = 1
			case 2
			<micvolume> = -18.0
			<micgain> = 0.0
			<micthreshold> = -23
			<gainmakeup> = 0
			case 1
			<micvolume> = -24.0
			<micgain> = 0.0
			<micthreshold> = -26
			<gainmakeup> = 0
			case 0
			<micvolume> = -100.0
			<micgain> = 0.0
			<micthreshold> = -30
			<gainmakeup> = 0
			default
			<micvolume> = -9.0
			<micgain> = 0.0
			<micthreshold> = -15
			<gainmakeup> = 4
		endswitch
	endif
	if Vocals_GetMicType player = <player>
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
	Vocals_SetMicGain player = <player> gain = <micgain>
	SetMicVolume controller = <controller> vol = <micvolume>
	VocalDSPSetParams controller = <controller> Effect = compressor threshold = <micthreshold> gainmakeup = <gainmakeup>
endscript

script options_audio_flip_dolby_option 
	RequireParams \{[
			savegame
		]
		all}
	GetGlobalTags savegame = <savegame> user_options
	if (<dolby_digital> = 0)
		SetGlobalTags user_options params = {dolby_digital = 1} savegame = <savegame>
		spawnscriptnow \{waitthenplaydolbyonsound}
	else
		SetGlobalTags user_options params = {dolby_digital = 0} savegame = <savegame>
		spawnscriptnow \{waitthenplaydolbyoffsound}
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
	wait \{0.2
		seconds}
	StopSoundEvent \{dolby_off
		fade_time = 0.2
		fade_type = log_slow}
	spawnscriptnow \{TurnDownSongTemporarily
		params = {
			status = on
		}}
	SoundEvent \{event = dolby_on}
endscript

script waitthenplaydolbyoffsound 
	wait \{0.2
		seconds}
	StopSoundEvent \{dolby_on
		fade_time = 0.2
		fade_type = log_slow}
	spawnscriptnow \{TurnDownSongTemporarily
		params = {
			status = off
		}}
	SoundEvent \{event = dolby_off}
endscript

script ui_options_audio_set_dolby_digital 
	RequireParams \{[
			savegame
		]
		all}
	spawnscriptnow ui_options_audio_set_dolby_digital_spawned params = {<...>}
endscript

script ui_options_audio_set_dolby_digital_spawned 
	GetGlobalTags savegame = <savegame> user_options param = dolby_digital
	begin
	if ($boot_movie_done = 1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if (<dolby_digital> = 0)
		DisableDolbyDigital
	else
		EnableDolbyDigital
	endif
	ui_options_audio_set_dolby_switch dolby_digital = <dolby_digital>
endscript

script options_audio_check_initial_preset 
	RequireParams \{[
			initial_volume
			volume
		]
		all}
	GetArraySize <initial_volume>
	preset_mode = Normal
	i = 0
	begin
	if ((<volume> [<i>]) != (<initial_volume> [<i>]))
		<preset_mode> = custom
		break
	endif
	<i> = (<i> + 1)
	repeat (<array_size> - 1)
	if (<preset_mode> != custom)
		<i> = (<array_size> - 1)
		if ((<volume> [<i>]) = (<initial_volume> [<i>]))
			preset_mode = Normal
		elseif ((<volume> [<i>] = 10))
			preset_mode = concert
		elseif ((<volume> [<i>]) = 0)
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
	if ScreenElementExists \{id = AudioInterface}
		if AudioInterface :Desc_ResolveAlias \{name = alias_faders_container
				param = fader_menu_id}
			GetScreenElementChildren id = <fader_menu_id>
			fader_children = <children>
			GetArraySize <fader_children>
			faders_size = <array_size>
			GetArraySize <default_volumes>
			default_volumes_size = <array_size>
			if (<faders_size> != <default_volumes_size>)
				ScriptAssert \{'number of faders does not match number of volumes'}
			endif
			if (<faders_size> > 0)
				i = 0
				begin
				if (<fader_children> [<i>]) :Desc_ResolveAlias name = alias_lights param = lights_id
					child_pos_to_retrieve = (<num_mixer_light_children> - ((<default_volumes> [<i>]) * 2))
					GetScreenElementChildren id = <lights_id>
					GetArraySize <children>
					if (<array_size> > 0)
						GetScreenElementPosition id = (<children> [<child_pos_to_retrieve>]) local
						FormatText checksumname = lights_alpha 'lights_ON_%a_alpha' a = (<default_volumes> [<i>])
						AddParam structure_name = fader_light_alpha_struct name = <lights_alpha> value = 0
						x_pos = (<ScreenElementPos> [0])
						y_pos = (<ScreenElementPos> [1])
						CastToInteger \{x_pos}
						CastToInteger \{y_pos}
						(<fader_children> [<i>]) :SE_SetProps {
							amber_lights_ON_pos = (((1.0, 0.0) * <x_pos>) + ((0.0, 1.0) * <y_pos>))
							amber_lights_OFF_pos = (((1.0, 0.0) * <x_pos>) + ((0.0, 1.0) * <y_pos>))
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
current_audio_options_song_guitar_vol = 0
current_audio_options_song_bass_vol = 0
current_audio_options_song_drums_vol = 0
current_audio_options_song_vocals_vol = 0
current_audio_options_song_band_vol = 0

script Spawned_Looping_Audio_Options_Song 
	begin
	if ($blade_active = 1)
		PauseSoundsByBuss \{Master}
		begin
		if ($blade_active = 0)
			UnPauseSoundsByBuss \{Master}
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	if NOT issoundplaying \{Audio_Options_Song}
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
			AddArrayElement array = <array> element = (($current_audio_options_song_guitar_vol) -15)
			AddArrayElement array = <array> element = (($current_audio_options_song_bass_vol) -15)
			AddArrayElement array = <array> element = (($current_audio_options_song_drums_vol) -15)
			AddArrayElement array = <array> element = 0.0
			AddArrayElement array = <array> element = (($current_audio_options_song_vocals_vol) -15)
			AddArrayElement array = <array> element = (($current_audio_options_song_band_vol) -15)
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
			Audio_Options_Song
			buss = Master
			pan = {
				ch1_2 = [0 1 0 1]
				ch3_4 = [0 1 0 1]
				ch5_6 = [0 1 0 1]
				ch7_8 = [0 1 0 1]
				RemoveCenter = [1 1 1 1]
			}
			vol = <array>
		}
	endif
	wait \{1
		gameframe}
	repeat
endscript
