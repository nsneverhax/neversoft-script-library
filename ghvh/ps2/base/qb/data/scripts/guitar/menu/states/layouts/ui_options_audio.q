0x1199917d = 0

script ui_create_options_audio 
	fadetoblack \{OFF
		no_wait}
	if ($menu_music_on_flag = 1)
		menu_music_off
		Change \{0x1199917d = 1}
	endif
	if NOT GotParam \{device_num}
		device_num = ($primary_controller)
	endif
	Player = 1
	i = 1
	begin
	getplayerinfo <i> controller
	if (<controller> = <device_num>)
		Player = <i>
		break
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	vocals_mute_all_mics \{mute = FALSE}
	getplayerinfo <Player> checksum
	get_savegame_from_player_status player_status = <checksum>
	GetGlobalTags user_options savegame = <savegame>
	Volume = [0 0 0 0 0 0]
	SetArrayElement ArrayName = Volume index = 0 NewValue = (<volumes>.guitar.guitar.vol)
	SetArrayElement ArrayName = Volume index = 1 NewValue = (<volumes>.guitar.bass.vol)
	SetArrayElement ArrayName = Volume index = 2 NewValue = (<volumes>.guitar.drum.vol)
	SetArrayElement ArrayName = Volume index = 3 NewValue = (<volumes>.guitar.mic.vol)
	SetArrayElement ArrayName = Volume index = 4 NewValue = (<volumes>.guitar.Band.vol)
	SetArrayElement ArrayName = Volume index = 5 NewValue = (<volumes>.guitar.sfx.vol)
	eq = [1 1 1 1]
	SetArrayElement ArrayName = eq index = 0 NewValue = (<volumes>.guitar.guitar.eq)
	SetArrayElement ArrayName = eq index = 1 NewValue = (<volumes>.guitar.bass.eq)
	SetArrayElement ArrayName = eq index = 2 NewValue = (<volumes>.guitar.drum.eq)
	SetArrayElement ArrayName = eq index = 3 NewValue = (<volumes>.guitar.mic.rev)
	CreateScreenElement {
		parent = root_window
		id = audiointerface
		Type = descinterface
		desc = 'options_audio_mixer'
		tags = {
			Volume = <Volume> eq = <eq> dolby_digital = <dolby_digital>
			initial_volume = [7 7 7 7 7 7] initial_eq = [2 2 2 2]
			Player = <Player>
		}
		z_priority = 650
		exclusive_device = <device_num>
	}
	audiointerface :se_setprops \{mixer_channel_lamp_alpha = 0.0}
	if audiointerface :desc_resolvealias \{Name = alias_audio_mixer_menu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops \{event_handlers = [
				{
					pad_back
					ui_options_check_settings
				}
				{
					pad_option
					ui_options_audio_reset_values
				}
				{
					pad_up
					sound_options_scroll
				}
				{
					pad_down
					sound_options_scroll
				}
			]}
		if GetScreenElementChildren \{id = current_menu}
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			<current_item> :se_setprops {
				event_handlers = [
					{focus ui_options_audio_focus_text_menu}
					{unfocus ui_options_audio_unfocus_text_menu}
					{pad_choose ui_options_audio_choose}
				]
				tags = {
					index = <i>
				}
			}
			i = (<i> + 1)
			repeat (<array_Size> - 1)
			<current_item> = (<children> [<i>])
			<current_item> :se_setprops {
				event_handlers = [
					{focus ui_options_audio_focus_text_menu params = {dolby_option}}
					{unfocus ui_options_audio_unfocus_text_menu params = {dolby_option}}
					{pad_choose 0x90e7f6c5}
				]
				tags = {
					index = <i>
				}
			}
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
					{pad_back ui_options_audio_fader_back}
					{pad_choose ui_options_audio_fader_choose}
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
	GetGlobalTags \{user_options}
	if (<ps2_stereo_sound> = 1)
		audiointerface :se_setprops \{dolby_highlight_container_alpha = 1.0}
		audiointerface :se_setprops \{mixer_red_light_off_alpha = 0.0}
		audiointerface :se_setprops \{0x0853070f = qs(0x842009ee)}
	else
		audiointerface :se_setprops \{dolby_highlight_container_alpha = 0.0}
		audiointerface :se_setprops \{mixer_red_light_off_alpha = 1.0}
		audiointerface :se_setprops \{0x0853070f = qs(0xda6133d7)}
	endif
	clean_up_user_control_helpers
	audiointerface :obj_spawnscript \{highlight_motion
		params = {
			menu_id = audiointerface
			alias_name = alias_mixer_menu_highlight
		}}
	audiointerface :obj_spawnscript \{dolby_highlight_motion}
	menu_finish
	add_user_control_helper \{text = qs(0x38ee4773)
		button = blue
		z = 100000}
	ui_options_set_settings
endscript

script ui_destroy_options_audio 
	SpawnScriptNow \{no_dolby_digital_sounds}
	vocals_mute_all_mics \{mute = true}
	if ($0x1199917d = 1)
		menu_music_on
		Change \{0x1199917d = 0}
	endif
	DestroyScreenElement \{id = audiointerface}
	generic_ui_destroy
	if ui_event_exists_in_stack \{Name = 'options'}
		fadetoblack \{On
			time = 0
			alpha = 1.0
			z_priority = 100011}
	endif
endscript

script ui_options_audio_reset_values 
	audiointerface :GetTags
	audiointerface :SetTags {Volume = <initial_volume> eq = <initial_eq>}
	ui_options_audio_set_values \{time = 0.1}
	SoundEvent \{event = menu_audio_options_reset}
endscript

script ui_options_audio_set_values \{time = 0.0}
	audiointerface :GetTags
	if audiointerface :desc_resolvealias \{Name = alias_faders_container}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <Volume>
			i = 0
			begin
			PosX = (-10 * (1.0 - ((<Volume> [<i>]) / 11.0)) + 10)
			PosY = (170 * (1.0 - ((<Volume> [<i>]) / 11.0)))
			<fader> = (<children> [<i>])
			<fader> :se_setprops {
				mixer_fader_pos = (((1.0, 0.0) * <PosX>) + ((0.0, 1.0) * <PosY>))
				time = <time>
			}
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	getplayerinfo <Player> checksum
	get_savegame_from_player_status player_status = <checksum>
	getplayerinfo <Player> controller
	if playerinfoequals <Player> bot_play = 1
		<controller> = 0
	endif
	updatevolumestag part = guitar Name = guitar params = {vol = (<Volume> [0])}
	updatevolumestag part = guitar Name = bass params = {vol = (<Volume> [1])}
	updatevolumestag part = guitar Name = drum params = {vol = (<Volume> [2])}
	updatevolumestag part = guitar Name = mic params = {vol = (<Volume> [3])} controller = <controller>
	updatevolumestag part = guitar Name = Band params = {vol = (<Volume> [4])}
	updatevolumestag part = guitar Name = sfx params = {vol = (<Volume> [5])}
	updatevolumestag part = guitar Name = guitar params = {eq = (<eq> [0])}
	updatevolumestag part = guitar Name = bass params = {eq = (<eq> [1])}
	updatevolumestag part = guitar Name = drum params = {eq = (<eq> [2])}
	updatevolumestag part = guitar Name = mic params = {rev = (<eq> [3])} controller = <controller>
	ui_options_audio_update_all_volumes
	songsetplayereqsettings
	if audiointerface :desc_resolvealias \{Name = alias_vu_lights_container}
		GetScreenElementChildren id = <resolved_id>
		GetArraySize <Volume>
		total = 0
		i = 0
		begin
		total = (<total> + ((<Volume> [<i>]) * 0.9))
		i = (<i> + 1)
		repeat <array_Size>
		total = (<total> / 6.0)
		i = 1
		begin
		current_item = (<children> [<i>])
		if (<i> < <total>)
			alpha = 1.0
			if ((<total> - <i>) < 1.0)
				alpha = (((<total> - <i>) / 2.0) + 0.5)
			endif
		else
			alpha = 0.5
		endif
		<current_item> :se_setprops alpha = <alpha> time = 0.1
		i = (<i> + 1)
		repeat 9
	endif
endscript

script ui_options_audio_focus_text_menu 
	GetTags
	Obj_GetID
	GetScreenElementPosition id = <objID>
	if NOT GotParam \{dolby_option}
		audiointerface :se_getprops
		se_setprops rgba = ($menu_focus_color)
		0x165b5465 = <index>
		if (<0x165b5465> > 3)
			0x165b5465 = (<0x165b5465> + 1)
		endif
		audiointerface :se_setprops mixer_channel_lamp_pos = ((440.0, 0.0) + ((87.0, 0.0) * <0x165b5465>))
		audiointerface :se_setprops \{mixer_channel_lamp_alpha = 0.5
			dolby_highlight_alpha = 0.0
			time = 0.1}
	else
		audiointerface :se_setprops \{mixer_channel_lamp_alpha = 0.0
			mixer_menu_highlight_alpha = 0.0
			dolby_highlight_alpha = 1.0
			time = 0.1}
	endif
	switch (<index>)
		case 0
		text = qs(0x840b4172)
		case 1
		text = qs(0x22988636)
		case 2
		text = qs(0x10603af3)
		case 3
		text = qs(0xade4ea56)
		case 4
		text = qs(0x57d0173e)
		case 5
		text = qs(0x663ca9a6)
		case 6
		GetGlobalTags \{user_options}
		if (<ps2_stereo_sound> = 1)
			text = qs(0x609993ba)
		else
			text = qs(0xef56c412)
		endif
	endswitch
	audiointerface :se_setprops mixer_info_text = <text>
endscript

script ui_options_audio_unfocus_text_menu 
	GetTags
	if NOT GotParam \{dolby_option}
		se_setprops rgba = ($menu_unfocus_color)
	endif
endscript

script ui_options_audio_choose 
	clean_up_user_control_helpers
	menu_finish
	GetTags
	if audiointerface :desc_resolvealias \{Name = alias_faders_container}
		if ResolveScreenElementID id = {<resolved_id> child = <index>}
			audiointerface :se_setprops \{mixer_channel_lamp_alpha = 1.0
				time = 0.1}
			LaunchEvent \{Type = unfocus
				target = current_menu}
			<resolved_id> :se_getprops
			<resolved_id> :SetTags current = slider highlight = slider
			LaunchEvent Type = focus target = <resolved_id>
		endif
	endif
	current_menu :se_setprops \{alpha = 0.5
		time = 0.1}
	ui_options_sound_event \{choose}
endscript

script ui_options_audio_dolby_flash 
	audiointerface :se_setprops \{mixer_red_light_off_alpha = 1.0}
	begin
	audiointerface :se_setprops dolby_highlight_container_alpha = RandomFloat (0.2, 0.5)
	Wait \{0.1
		Seconds
		ignoreslomo}
	repeat
endscript

script 0x90e7f6c5 
	if isps3
		return
	endif
	audiointerface :se_setprops \{block_events}
	generic_menu_pad_choose_sound
	GetGlobalTags \{user_options}
	if (<ps2_stereo_sound> = 1)
		audiointerface :SetTags \{dolby_digital = 0}
		SetGlobalTags \{user_options
			params = {
				ps2_stereo_sound = 0
			}}
		0xf2b96a22 \{0}
	else
		audiointerface :SetTags \{dolby_digital = 1}
		SetGlobalTags \{user_options
			params = {
				ps2_stereo_sound = 1
			}}
		0xf2b96a22 \{1}
	endif
	audiointerface :obj_spawnscript \{ui_options_audio_dolby_flash}
	Wait \{0.8
		Seconds
		ignoreslomo}
	ui_options_audio_set_values
	Wait \{1
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = ui_options_audio_dolby_flash}
	audiointerface :GetTags
	GetGlobalTags \{user_options}
	if (<ps2_stereo_sound> = 1)
		audiointerface :se_setprops dolby_highlight_container_alpha = 1.0 time = <time>
		audiointerface :se_setprops mixer_red_light_off_alpha = 0.0 time = <time>
		audiointerface :se_setprops \{0x0853070f = qs(0x842009ee)}
		audiointerface :se_setprops \{mixer_info_text = qs(0x609993ba)}
	else
		audiointerface :se_setprops dolby_highlight_container_alpha = 0.0 time = <time>
		audiointerface :se_setprops mixer_red_light_off_alpha = 1.0 time = <time>
		audiointerface :se_setprops \{0x0853070f = qs(0xda6133d7)}
		audiointerface :se_setprops \{mixer_info_text = qs(0xef56c412)}
	endif
	ui_options_sound_event \{dolby_option}
	audiointerface :se_setprops \{unblock_events}
endscript

script ui_options_audio_focus_fader_menu 
	GetTags
	if (<current> = None)
		if (<highlight> = slider)
			se_setprops \{knob_highlight_alpha = 0.0
				mixer_fader_highlight_alpha = 0.5}
		else
			se_setprops \{knob_highlight_alpha = 0.5
				mixer_fader_highlight_alpha = 0.0}
		endif
	elseif (<current> = slider)
		se_setprops \{knob_highlight_alpha = 0.0
			mixer_fader_highlight_alpha = 1.0}
	else
		se_setprops \{knob_highlight_alpha = 1.0
			mixer_fader_highlight_alpha = 0.0}
	endif
endscript

script ui_options_audio_unfocus_fader_menu 
	GetTags
	se_setprops \{knob_highlight_alpha = 0.0
		mixer_fader_highlight_alpha = 0.0}
endscript

script ui_options_audio_fader_choose 
	GetTags
	se_getprops
	clean_up_user_control_helpers
	menu_finish
	add_user_control_helper \{text = qs(0x38ee4773)
		button = blue
		z = 100000}
	if (<current> = None)
		SetTags \{current = slider
			highlight = slider}
	elseif (<current> = slider)
		SetTags \{current = None}
		LaunchEvent \{Type = focus
			target = current_menu}
		current_menu :se_setprops \{alpha = 1.0
			time = 0.1}
		LaunchEvent Type = unfocus target = <objID>
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
	GetTags
	Obj_GetID
	se_getprops
	clean_up_user_control_helpers
	menu_finish
	clean_up_user_control_helpers
	if (<current> = None)
		LaunchEvent \{Type = focus
			target = current_menu}
		current_menu :se_setprops \{alpha = 1.0
			time = 0.1}
		LaunchEvent Type = unfocus target = <objID>
		add_user_control_helper \{text = qs(0x38ee4773)
			button = blue
			z = 100000}
	elseif (<current> = slider)
		ui_options_sound_event \{back}
		SetTags \{current = None}
		LaunchEvent \{Type = focus
			target = current_menu}
		current_menu :se_setprops \{alpha = 1.0
			time = 0.1}
		LaunchEvent Type = unfocus target = <objID>
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		add_user_control_helper \{text = qs(0x38ee4773)
			button = blue
			z = 100000}
	else
		SetTags \{current = None}
		ui_options_audio_focus_fader_menu
	endif
endscript

script ui_options_audio_fader_dir 
	GetTags
	if (<current> = None)
		if (<highlight> = slider)
			SetTags \{highlight = knob}
		else
			SetTags \{highlight = slider}
		endif
		generic_menu_up_or_down_sound
	elseif (<current> = slider)
		audiointerface :GetTags
		new_volume = (<Volume> [<index>])
		if GotParam \{down}
			if NOT (<new_volume> <= 0)
				new_volume = ((<Volume> [<index>]) - 1)
			else
				if ($paused_for_hardware = 0)
					SoundEvent \{event = audio_options_fader_end}
				endif
			endif
		else
			if NOT (<new_volume> >= 11)
				new_volume = ((<Volume> [<index>]) + 1)
			endif
		endif
		if NOT (<new_volume> = (<Volume> [<index>]))
			SetArrayElement ArrayName = Volume index = <index> NewValue = <new_volume>
			audiointerface :SetTags Volume = <Volume>
			ui_options_audio_set_values \{time = 0.1}
			ui_options_sound_event slider index = <index>
		endif
	else
		audiointerface :GetTags
		new_eq = (<eq> [<index>])
		if GotParam \{down}
			if NOT (<new_eq> <= 1)
				new_eq = ((<eq> [<index>]) - 1)
			endif
		else
			if NOT (<new_eq> >= 3)
				new_eq = ((<eq> [<index>]) + 1)
			endif
		endif
		if NOT (<new_eq> = (<eq> [<index>]))
			SetArrayElement ArrayName = eq index = <index> NewValue = <new_eq>
			audiointerface :SetTags eq = <eq>
			ui_options_audio_set_values \{time = 0.1}
			ui_options_sound_event knob index = <index> NewValue = <new_eq>
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
			SoundEvent \{event = ui_fader}
			SpawnScriptNow \{playing_sound_fader
				params = {
					instrument = guitar
					time = 1.3379999
				}}
			case 1
			SoundEvent \{event = ui_fader}
			SpawnScriptNow \{playing_sound_fader
				params = {
					instrument = bass
					time = 1.235
				}}
			case 2
			SoundEvent \{event = ui_fader}
			SpawnScriptNow \{playing_sound_fader
				params = {
					instrument = drums
					time = 1.8379999
				}}
			case 3
			SoundEvent \{event = ui_fader}
			SpawnScriptNow \{playing_sound_fader
				params = {
					instrument = mic
					time = 2.826
				}}
			case 4
			SoundEvent \{event = ui_fader}
			SpawnScriptNow \{playing_sound_fader
				params = {
					instrument = instruments
					time = 1.938
				}}
			case 5
			SoundEvent \{event = ui_fader}
			SpawnScriptNow \{playing_sound_fader
				params = {
					instrument = instruments
					time = 1.938
				}}
			case 6
			SoundEvent \{event = ui_fader}
			SpawnScriptNow \{playing_sound_fader
				params = {
					instrument = sfx
					time = 2.612
				}}
		endswitch
	elseif GotParam \{knob}
		current_volume = (<eq> [<index>])
		SoundEvent \{event = ui_knob}
		switch (<index>)
			case 0
			if GotParam \{NewValue}
				switch <NewValue>
					case 1
					if issoundplaying \{audio_options_guitar}
						setsoundbusseffects \{effects = [
								{
									$eq_guitarlead_crisp
									Name = audiooptionssound
								}
							]
							time = 0.2}
					else
						SpawnScriptNow \{playing_sound_knob
							params = {
								eq_setting = $eq_guitarlead_crisp
								instrument = guitar
							}}
					endif
					Change \{guitar_knob_effects_position = 1}
					case 2
					if issoundplaying \{audio_options_guitar}
						setsoundbusseffects \{effects = [
								{
									$eq_guitarlead_edgy
									Name = audiooptionssound
								}
							]
							time = 0.2}
					else
						SpawnScriptNow \{playing_sound_knob
							params = {
								eq_setting = $eq_guitarlead_edgy
								instrument = guitar
							}}
					endif
					Change \{guitar_knob_effects_position = 2}
					case 3
					if issoundplaying \{audio_options_guitar}
						setsoundbusseffects \{effects = [
								{
									$eq_guitarlead_fuzz
									Name = audiooptionssound
								}
							]
							time = 0.2}
					else
						SpawnScriptNow \{playing_sound_knob
							params = {
								eq_setting = $eq_guitarlead_fuzz
								instrument = guitar
							}}
					endif
					Change \{guitar_knob_effects_position = 3}
				endswitch
			endif
			case 1
			if GotParam \{NewValue}
				switch <NewValue>
					case 1
					if issoundplaying \{audio_options_bass}
						setsoundbusseffects \{effects = [
								{
									$eq_bass_bari
									Name = audiooptionssound
								}
							]
							time = 0.2}
					else
						SpawnScriptNow \{playing_sound_knob
							params = {
								eq_setting = $eq_bass_bari
								instrument = bass
							}}
					endif
					Change \{bass_knob_effects_position = 1}
					case 2
					if issoundplaying \{audio_options_bass}
						setsoundbusseffects \{effects = [
								{
									$eq_bass_boomy
									Name = audiooptionssound
								}
							]
							time = 0.2}
					else
						SpawnScriptNow \{playing_sound_knob
							params = {
								eq_setting = $eq_bass_boomy
								instrument = bass
							}}
					endif
					Change \{bass_knob_effects_position = 2}
					case 3
					if issoundplaying \{audio_options_bass}
						setsoundbusseffects \{effects = [
								{
									$eq_bass_fretty
									Name = audiooptionssound
								}
							]
							time = 0.2}
					else
						SpawnScriptNow \{playing_sound_knob
							params = {
								eq_setting = $eq_bass_fretty
								instrument = bass
							}}
					endif
					Change \{bass_knob_effects_position = 3}
				endswitch
			endif
			case 2
			if GotParam \{NewValue}
				switch <NewValue>
					case 1
					if issoundplaying \{audio_options_drum}
						setsoundbusseffects \{effects = [
								{
									$eq_drum_punch
									Name = audiooptionssound
								}
							]
							time = 0.2}
					else
						SpawnScriptNow \{playing_sound_knob
							params = {
								eq_setting = $eq_drum_punch
								instrument = drums
							}}
					endif
					Change \{drum_knob_effects_position = 1}
					case 2
					if issoundplaying \{audio_options_drum}
						setsoundbusseffects \{effects = [
								{
									$eq_drum_crack
									Name = audiooptionssound
								}
							]
							time = 0.2}
					else
						SpawnScriptNow \{playing_sound_knob
							params = {
								eq_setting = $eq_drum_crack
								instrument = drums
							}}
					endif
					Change \{drum_knob_effects_position = 2}
					case 3
					if issoundplaying \{audio_options_drum}
						setsoundbusseffects \{effects = [
								{
									$eq_drum_sizzle
									Name = audiooptionssound
								}
							]
							time = 0.2}
					else
						SpawnScriptNow \{playing_sound_knob
							params = {
								eq_setting = $eq_drum_sizzle
								instrument = drums
							}}
					endif
					Change \{drum_knob_effects_position = 3}
				endswitch
			endif
			case 3
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
			SoundEvent \{event = dolby_off}
		endif
	elseif GotParam \{back}
		SoundEvent \{event = sound_options_back}
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
		stopsound \{audio_options_sfx
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_instruments
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_vocals
			fade_time = 0.3
			fade_type = linear}
		SpawnScriptNow \{no_dolby_digital_sounds}
	elseif GotParam \{backgeneric}
		generic_menu_pad_back_sound
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
		stopsound \{audio_options_sfx
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_instruments
			fade_time = 0.3
			fade_type = linear}
		stopsound \{audio_options_vocals
			fade_time = 0.3
			fade_type = linear}
		SoundEvent \{event = sound_options_select}
		SpawnScriptNow \{no_dolby_digital_sounds}
	endif
endscript

script ChangeSpinalTapVolume \{spinal_tap_volume_max = 11}
	<spinal_tap_volume> = (<spinal_tap_volume> + <Change>)
	if (<spinal_tap_volume> < 0)
		<spinal_tap_volume> = 0
	elseif (<spinal_tap_volume> > <spinal_tap_volume_max>)
		<spinal_tap_volume> = <spinal_tap_volume_max>
	endif
	return Volume = <spinal_tap_volume>
endscript

script ui_options_audio_get_buss_volume 
	switch <Volume>
		case 11
		<vol> = -1.5
		case 10
		<vol> = -2.0
		case 9
		<vol> = -2.5
		case 8
		<vol> = -3.0
		case 7
		<vol> = -3.5
		case 6
		<vol> = -4.5
		case 5
		<vol> = -5.75
		case 4
		<vol> = -7.0
		case 3
		<vol> = -8.25
		case 2
		<vol> = -9.5
		case 1
		<vol> = -10.75
		case 0
		<vol> = -12.0
		default
		<vol> = -3.5
	endswitch
	return vol = <vol>
endscript

script ui_options_audio_update_all_volumes \{time = 0}
	audiointerface :GetTags
	update_all_volumes <...>
endscript

script update_all_volumes \{time = 0
		Player = 1}
	getplayerinfo <Player> checksum
	get_savegame_from_player_status player_status = <checksum>
	GetGlobalTags user_options savegame = <savegame>
	ui_options_audio_get_buss_volume Volume = (<volumes>.guitar.guitar.vol)
	SoundBussUnlock \{user_leadgtr}
	SoundBussUnlock \{user_rhythmgtr}
	setsoundbussparams {user_rhythmgtr = {vol = <vol>} time = <time>}
	setsoundbussparams {user_leadgtr = {vol = <vol>} time = <time>}
	SoundBussLock \{user_leadgtr}
	SoundBussLock \{user_rhythmgtr}
	ui_options_audio_get_buss_volume Volume = (<volumes>.guitar.bass.vol)
	SoundBussUnlock \{user_bass}
	setsoundbussparams {user_bass = {vol = <vol>} time = <time>}
	SoundBussLock \{user_bass}
	ui_options_audio_get_buss_volume Volume = (<volumes>.guitar.drum.vol)
	SoundBussUnlock \{user_drums}
	setsoundbussparams {user_drums = {vol = <vol>} time = <time>}
	SoundBussLock \{user_drums}
	ui_options_audio_get_buss_volume Volume = (<volumes>.guitar.mic.vol)
	ui_options_audio_update_mic_volume Player = <Player>
	SoundBussUnlock \{user_leadvox}
	setsoundbussparams {options_vox = {vol = <vol>} time = <time>}
	SoundBussLock \{user_leadvox}
	ui_options_audio_get_buss_volume Volume = (<volumes>.guitar.Band.vol)
	SoundBussUnlock \{User_Band}
	setsoundbussparams {User_Band = {vol = <vol>} time = <time>}
	SoundBussLock \{User_Band}
	ui_options_audio_get_buss_volume Volume = (<volumes>.guitar.sfx.vol)
	SoundBussUnlock \{User_SFX}
	SoundBussUnlock \{user_crowd}
	SoundBussUnlock \{user_crowdsingalong}
	setsoundbussparams {UI = {vol = <vol>} time = <time>}
	setsoundbussparams {user_crowd = {vol = <vol>} time = <time>}
	setsoundbussparams {user_crowdsingalong = {vol = <vol>} time = <time>}
	SoundBussLock \{User_SFX}
	SoundBussLock \{user_crowd}
	SoundBussLock \{user_crowdsingalong}
	ui_options_audio_get_buss_volume Volume = (<volumes>.guitar.backup.vol)
endscript

script ui_options_audio_update_mic_volume \{Player = 1}
	if playerinfoequals <Player> is_local_client = 0
		return
	endif
	if is_mic_volume_shared
		<share_mic_settings> = 1
	else
		<share_mic_settings> = 0
	endif
	if (<share_mic_settings> = 1)
		GetGlobalTags \{user_options}
	else
		getplayerinfo <Player> checksum
		get_savegame_from_player_status player_status = <checksum>
		GetGlobalTags savegame = <savegame> user_options
	endif
	micvolume = (<volumes>.guitar.mic.vol)
	if (<share_mic_settings> = 1)
		gamemode_getnumplayersshown
		<Player> = 1
		begin
		mic_set_device_volume Player = <Player> micvolume = <micvolume>
		<Player> = (<Player> + 1)
		repeat <num_players_shown>
	else
		mic_set_device_volume Player = <Player> micvolume = <micvolume>
	endif
endscript

script mic_set_device_volume 

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
			<micgain> = 0.0
			<micthreshold> = -10
			<GAINMAKEUP> = 6
			case 10
			<micgain> = 0.0
			<micthreshold> = -12
			<GAINMAKEUP> = 6
			case 9
			<micgain> = 0.0
			<micthreshold> = -12
			<GAINMAKEUP> = 4
			case 8
			<micgain> = 0.0
			<micthreshold> = -13
			<GAINMAKEUP> = 4
			case 7
			<micgain> = 0.0
			<micthreshold> = -14
			<GAINMAKEUP> = 3
			case 6
			<micgain> = 0.0
			<micthreshold> = -15
			<GAINMAKEUP> = 1
			case 5
			<micgain> = 0.0
			<micthreshold> = -16
			<GAINMAKEUP> = 1
			case 4
			<micgain> = 0.0
			<micthreshold> = -18
			<GAINMAKEUP> = 1
			case 3
			<micgain> = 0.0
			<micthreshold> = -19
			<GAINMAKEUP> = 0
			case 2
			<micgain> = 0.0
			<micthreshold> = -20
			<GAINMAKEUP> = 0
			case 1
			<micgain> = 0.0
			<micthreshold> = -22
			<GAINMAKEUP> = 0
			case 0
			<micgain> = 0.0
			<micthreshold> = -24
			<GAINMAKEUP> = 0
			default
			<micgain> = 0.0
			<micthreshold> = -14
			<GAINMAKEUP> = 3
		endswitch
	else
		switch <micvolume>
			case 11
			<micgain> = 0.0
			<micthreshold> = -12
			<GAINMAKEUP> = 5
			case 10
			<micgain> = 0.0
			<micthreshold> = -13
			<GAINMAKEUP> = 5
			case 9
			<micgain> = 0.0
			<micthreshold> = -14
			<GAINMAKEUP> = 5
			case 8
			<micgain> = 0.0
			<micthreshold> = -14
			<GAINMAKEUP> = 4.5
			case 7
			<micgain> = 0.0
			<micthreshold> = -15
			<GAINMAKEUP> = 4
			case 6
			<micgain> = 0.0
			<micthreshold> = -17
			<GAINMAKEUP> = 4
			case 5
			<micgain> = 0.0
			<micthreshold> = -18
			<GAINMAKEUP> = 3
			case 4
			<micgain> = 0.0
			<micthreshold> = -19
			<GAINMAKEUP> = 2
			case 3
			<micgain> = 0.0
			<micthreshold> = -20
			<GAINMAKEUP> = 1
			case 2
			<micgain> = 0.0
			<micthreshold> = -23
			<GAINMAKEUP> = 0
			case 1
			<micgain> = 0.0
			<micthreshold> = -26
			<GAINMAKEUP> = 0
			case 0
			<micgain> = 0.0
			<micthreshold> = -30
			<GAINMAKEUP> = 0
			default
			<micgain> = 0.0
			<micthreshold> = -15
			<GAINMAKEUP> = 4
		endswitch
	endif
	vocals_setmicgain Player = <Player> gain = <micvolume>
endscript

script ui_options_audio_set_dolby_digital 
	GetGlobalTags \{user_options}
	if (<dolby_digital> = 0)
		disabledolbydigital
	else
		enabledolbydigital
	endif
endscript

script dolby_highlight_motion 
	if audiointerface :desc_resolvealias \{Name = alias_dolby_highlight_container}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			begin
			i = 0
			begin
			curr_id = (<children> [<i>])
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_v = true
			else
				<curr_id> :se_setprops flip_v = FALSE
			endif
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_h = true
			else
				<curr_id> :se_setprops flip_h = FALSE
			endif
			i = (<i> + 1)
			repeat <array_Size>
			Wait \{0.1
				Second}
			repeat
		endif
	endif
endscript
