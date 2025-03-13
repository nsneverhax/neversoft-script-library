
script ui_create_options_audio 
	if NOT gotparam \{device_num}
		device_num = ($primary_controller)
	endif
	player = 1
	i = 1
	begin
	getplayerinfo <i> controller
	if (<controller> = <device_num>)
		player = <i>
		break
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	vocals_mute_all_mics \{mute = false}
	getplayerinfo <player> checksum
	get_savegame_from_player_status player_status = <checksum>
	getglobaltags user_options savegame = <savegame>
	volume = [0 0 0 0 0 0 0]
	setarrayelement arrayname = volume index = 0 newvalue = (<volumes>.guitar.guitar.vol)
	setarrayelement arrayname = volume index = 1 newvalue = (<volumes>.guitar.bass.vol)
	setarrayelement arrayname = volume index = 2 newvalue = (<volumes>.guitar.drum.vol)
	setarrayelement arrayname = volume index = 3 newvalue = (<volumes>.guitar.mic.vol)
	setarrayelement arrayname = volume index = 4 newvalue = (<volumes>.guitar.vocals.vol)
	setarrayelement arrayname = volume index = 5 newvalue = (<volumes>.guitar.band.vol)
	setarrayelement arrayname = volume index = 6 newvalue = (<volumes>.guitar.sfx.vol)
	eq = [1 1 1 1]
	setarrayelement arrayname = eq index = 0 newvalue = (<volumes>.guitar.guitar.eq)
	setarrayelement arrayname = eq index = 1 newvalue = (<volumes>.guitar.bass.eq)
	setarrayelement arrayname = eq index = 2 newvalue = (<volumes>.guitar.drum.eq)
	setarrayelement arrayname = eq index = 3 newvalue = (<volumes>.guitar.mic.rev)
	createscreenelement {
		parent = root_window
		id = audiointerface
		type = descinterface
		desc = 'options_audio_mixer'
		tags = {volume = <volume> eq = <eq> dolby_digital = <dolby_digital>
			initial_volume = [7 7 7 7 7 7 7] initial_eq = [2 2 2 2]
			player = <player>}
		z_priority = 650
		exclusive_device = <device_num>
	}
	audiointerface :se_setprops \{mixer_channel_lamp_alpha = 0.0}
	if audiointerface :desc_resolvealias \{name = alias_audio_mixer_menu}
		assignalias id = <resolved_id> alias = current_menu
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
		if getscreenelementchildren \{id = current_menu}
			getarraysize <children>
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
			repeat (<array_size> - 1)
			<current_item> = (<children> [<i>])
			<current_item> :se_setprops {
				event_handlers = [
					{focus ui_options_audio_focus_text_menu params = {dolby_option}}
					{unfocus ui_options_audio_unfocus_text_menu params = {dolby_option}}
					{pad_choose ui_options_audio_choose_dolby}
				]
				tags = {
					index = <i>
				}
			}
		endif
	endif
	if audiointerface :desc_resolvealias \{name = alias_faders_container}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
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
					current = none
					highlight = slider
				}
			}
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	ui_options_audio_set_values
	if (<dolby_digital> = 1)
		audiointerface :se_setprops \{dolby_highlight_container_alpha = 1.0}
		audiointerface :se_setprops \{mixer_red_light_off_alpha = 0.0}
	else
		audiointerface :se_setprops \{dolby_highlight_container_alpha = 0.0}
		audiointerface :se_setprops \{mixer_red_light_off_alpha = 1.0}
	endif
	audiointerface :obj_spawnscript \{highlight_motion
		params = {
			menu_id = audiointerface
			alias_name = alias_mixer_menu_highlight
		}}
	audiointerface :obj_spawnscript \{dolby_highlight_motion}
	add_gamertag_helper exclusive_device = <device_num>
	menu_finish
	add_user_control_helper \{text = qs(0x38ee4773)
		button = blue
		z = 100000}
	ui_options_set_settings
endscript

script ui_destroy_options_audio 
	spawnscriptnow \{no_dolby_digital_sounds}
	vocals_mute_all_mics \{mute = true}
	destroyscreenelement \{id = audiointerface}
	generic_ui_destroy
endscript

script ui_options_audio_reset_values 
	audiointerface :gettags
	audiointerface :settags {volume = <initial_volume> eq = <initial_eq>}
	ui_options_audio_set_values \{time = 0.1}
	soundevent \{event = menu_audio_options_reset}
endscript

script ui_options_audio_set_values \{time = 0.0}
	audiointerface :gettags
	if audiointerface :desc_resolvealias \{name = alias_faders_container}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <volume>
			i = 0
			begin
			posx = (-10 * (1.0 - ((<volume> [<i>]) / 11.0)) + 10)
			posy = (170 * (1.0 - ((<volume> [<i>]) / 11.0)))
			<fader> = (<children> [<i>])
			<fader> :se_setprops {
				mixer_fader_pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posy>))
				time = <time>
			}
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	getplayerinfo <player> checksum
	get_savegame_from_player_status player_status = <checksum>
	if (<dolby_digital> = 1)
		setglobaltags user_options params = {dolby_digital = 1} savegame = <savegame>
		enabledolbydigital
	else
		setglobaltags user_options params = {dolby_digital = 0} savegame = <savegame>
		disabledolbydigital
	endif
	getplayerinfo <player> controller
	if playerinfoequals <player> bot_play = 1
		<controller> = 0
	endif
	updatevolumestag part = guitar name = guitar params = {vol = (<volume> [0])}
	updatevolumestag part = guitar name = bass params = {vol = (<volume> [1])}
	updatevolumestag part = guitar name = drum params = {vol = (<volume> [2])}
	updatevolumestag part = guitar name = mic params = {vol = (<volume> [3])} controller = <controller>
	updatevolumestag part = guitar name = vocals params = {vol = (<volume> [4])}
	updatevolumestag part = guitar name = band params = {vol = (<volume> [5])}
	updatevolumestag part = guitar name = sfx params = {vol = (<volume> [6])}
	updatevolumestag part = guitar name = guitar params = {eq = (<eq> [0])}
	updatevolumestag part = guitar name = bass params = {eq = (<eq> [1])}
	updatevolumestag part = guitar name = drum params = {eq = (<eq> [2])}
	updatevolumestag part = guitar name = mic params = {rev = (<eq> [3])} controller = <controller>
	ui_options_audio_update_all_volumes
	songsetplayereqsettings
	if audiointerface :desc_resolvealias \{name = alias_vu_lights_container}
		getscreenelementchildren id = <resolved_id>
		total = 0
		i = 0
		begin
		total = (<total> + ((<volume> [<i>]) * 0.9))
		i = (<i> + 1)
		repeat 7
		total = (<total> / 7.0)
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
	gettags
	obj_getid
	getscreenelementposition id = <objid>
	if NOT gotparam \{dolby_option}
		audiointerface :se_getprops
		if NOT (<mixer_menu_highlight_alpha> = 1.0)
			audiointerface :se_setprops mixer_menu_highlight_pos = (<screenelementpos> - (2.0, 160.0))
			audiointerface :se_setprops \{mixer_menu_highlight_alpha = 1.0
				time = 0.1}
		else
			audiointerface :se_setprops mixer_menu_highlight_pos = (<screenelementpos> - (2.0, 160.0)) time = 0.1
		endif
		audiointerface :se_setprops mixer_channel_lamp_pos = ((440.0, 0.0) + ((87.0, 0.0) * <index>))
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
		text = qs(0xcfea7f2d)
		case 5
		text = qs(0x57d0173e)
		case 6
		text = qs(0x663ca9a6)
		case 7
		if isdolbydigitalenabled
			text = qs(0x525c2228)
		else
			text = qs(0x4daeebf0)
		endif
	endswitch
	audiointerface :se_setprops mixer_info_text = <text>
endscript

script ui_options_audio_unfocus_text_menu 
	gettags
	if NOT gotparam \{dolby_option}
	endif
endscript

script ui_options_audio_choose 
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
	menu_finish
	gettags
	if audiointerface :desc_resolvealias \{name = alias_faders_container}
		if resolvescreenelementid id = {<resolved_id> child = <index>}
			audiointerface :se_setprops \{mixer_channel_lamp_alpha = 1.0
				time = 0.1}
			launchevent \{type = unfocus
				target = current_menu}
			<resolved_id> :se_getprops
			<resolved_id> :settags current = slider highlight = slider
			launchevent type = focus target = <resolved_id>
		endif
	endif
	current_menu :se_setprops \{alpha = 0.5
		time = 0.1}
	ui_options_sound_event \{choose}
endscript

script ui_options_audio_choose_dolby 
	audiointerface :se_setprops \{block_events}
	generic_menu_pad_choose_sound
	audiointerface :gettags
	if (<dolby_digital> = 1)
		audiointerface :settags \{dolby_digital = 0}
	else
		audiointerface :settags \{dolby_digital = 1}
	endif
	removeparameter \{dolby_digital}
	audiointerface :obj_spawnscript \{ui_options_audio_dolby_flash}
	wait \{0.8
		seconds
		ignoreslomo}
	ui_options_audio_set_values
	wait \{1
		seconds
		ignoreslomo}
	killspawnedscript \{name = ui_options_audio_dolby_flash}
	audiointerface :gettags
	if (<dolby_digital> = 1)
		audiointerface :se_setprops dolby_highlight_container_alpha = 1.0 time = <time>
		audiointerface :se_setprops mixer_red_light_off_alpha = 0.0 time = <time>
	else
		audiointerface :se_setprops dolby_highlight_container_alpha = 0.0 time = <time>
		audiointerface :se_setprops mixer_red_light_off_alpha = 1.0 time = <time>
	endif
	ui_options_sound_event \{dolby_option}
	audiointerface :se_setprops \{unblock_events}
	if isdolbydigitalenabled
		text = qs(0x525c2228)
	else
		text = qs(0x4daeebf0)
	endif
	audiointerface :se_setprops mixer_info_text = <text>
endscript

script ui_options_audio_dolby_flash 
	audiointerface :se_setprops \{mixer_red_light_off_alpha = 1.0}
	begin
	audiointerface :se_setprops dolby_highlight_container_alpha = RandomFloat (0.2, 0.5)
	wait \{0.1
		seconds
		ignoreslomo}
	repeat
endscript

script ui_options_audio_focus_fader_menu 
	gettags
	if (<current> = none)
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
	gettags
	se_setprops \{knob_highlight_alpha = 0.0
		mixer_fader_highlight_alpha = 0.0}
endscript

script ui_options_audio_fader_choose 
	gettags
	se_getprops
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
	menu_finish
	add_user_control_helper \{text = qs(0x38ee4773)
		button = blue
		z = 100000}
	if (<current> = none)
		settags \{current = slider
			highlight = slider}
	elseif (<current> = slider)
		settags \{current = none}
		launchevent \{type = focus
			target = current_menu}
		current_menu :se_setprops \{alpha = 1.0
			time = 0.1}
		launchevent type = unfocus target = <objid>
		ui_options_sound_event \{choose}
		return
	else
		settags \{current = none
			highlight = dial}
	endif
	generic_menu_pad_choose_sound
	ui_options_audio_focus_fader_menu
endscript

script ui_options_audio_fader_back 
	gettags
	obj_getid
	se_getprops
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
	menu_finish
	if (<current> = none)
		launchevent \{type = focus
			target = current_menu}
		current_menu :se_setprops \{alpha = 1.0
			time = 0.1}
		launchevent type = unfocus target = <objid>
		add_user_control_helper \{text = qs(0x38ee4773)
			button = blue
			z = 100000}
	elseif (<current> = slider)
		ui_options_sound_event \{back}
		settags \{current = none}
		launchevent \{type = focus
			target = current_menu}
		current_menu :se_setprops \{alpha = 1.0
			time = 0.1}
		launchevent type = unfocus target = <objid>
		add_user_control_helper \{text = qs(0x38ee4773)
			button = blue
			z = 100000}
	else
		settags \{current = none}
		ui_options_audio_focus_fader_menu
	endif
endscript

script ui_options_audio_fader_dir 
	gettags
	if (<current> = none)
		if (<highlight> = slider)
			settags \{highlight = knob}
		else
			settags \{highlight = slider}
		endif
		generic_menu_up_or_down_sound
	elseif (<current> = slider)
		audiointerface :gettags
		new_volume = (<volume> [<index>])
		if gotparam \{down}
			if NOT (<new_volume> <= 0)
				new_volume = ((<volume> [<index>]) - 1)
			else
				if ($paused_for_hardware = 0)
					soundevent \{event = audio_options_fader_end}
				endif
			endif
		else
			if NOT (<new_volume> >= 11)
				new_volume = ((<volume> [<index>]) + 1)
			endif
		endif
		if NOT (<new_volume> = (<volume> [<index>]))
			setarrayelement arrayname = volume index = <index> newvalue = <new_volume>
			audiointerface :settags volume = <volume>
			ui_options_audio_set_values \{time = 0.1}
			ui_options_sound_event slider index = <index>
		endif
	else
		audiointerface :gettags
		new_eq = (<eq> [<index>])
		if gotparam \{down}
			if NOT (<new_eq> <= 1)
				new_eq = ((<eq> [<index>]) - 1)
			endif
		else
			if NOT (<new_eq> >= 3)
				new_eq = ((<eq> [<index>]) + 1)
			endif
		endif
		if NOT (<new_eq> = (<eq> [<index>]))
			setarrayelement arrayname = eq index = <index> newvalue = <new_eq>
			audiointerface :settags eq = <eq>
			ui_options_audio_set_values \{time = 0.1}
			ui_options_sound_event knob index = <index> newvalue = <new_eq>
		endif
	endif
	ui_options_audio_focus_fader_menu
endscript

script ui_options_sound_event 
	audiointerface :gettags
	if gotparam \{slider}
		current_volume = (<volume> [<index>])
		switch (<index>)
			case 0
			soundevent \{event = ui_fader}
			spawnscriptnow \{playing_sound_fader
				params = {
					instrument = guitar
					time = 1.3379999
				}}
			case 1
			soundevent \{event = ui_fader}
			spawnscriptnow \{playing_sound_fader
				params = {
					instrument = bass
					time = 1.235
				}}
			case 2
			soundevent \{event = ui_fader}
			spawnscriptnow \{playing_sound_fader
				params = {
					instrument = drums
					time = 1.8379999
				}}
			case 3
			soundevent \{event = ui_fader}
			spawnscriptnow \{playing_sound_fader
				params = {
					instrument = mic
					time = 2.826
				}}
			case 4
			soundevent \{event = ui_fader}
			spawnscriptnow \{playing_sound_fader
				params = {
					instrument = vocals
					time = 2.629
				}}
			case 5
			soundevent \{event = ui_fader}
			spawnscriptnow \{playing_sound_fader
				params = {
					instrument = instruments
					time = 1.938
				}}
			case 6
			soundevent \{event = ui_fader}
			spawnscriptnow \{playing_sound_fader
				params = {
					instrument = sfx
					time = 2.612
				}}
		endswitch
	elseif gotparam \{knob}
		current_volume = (<eq> [<index>])
		soundevent \{event = ui_knob}
		switch (<index>)
			case 0
			if gotparam \{newvalue}
				switch <newvalue>
					case 1
					if issoundplaying \{audio_options_guitar}
						setsoundbusseffects \{effects = [
								{
									$eq_guitarlead_crisp
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $eq_guitarlead_crisp
								instrument = guitar
							}}
					endif
					change \{guitar_knob_effects_position = 1}
					case 2
					if issoundplaying \{audio_options_guitar}
						setsoundbusseffects \{effects = [
								{
									$eq_guitarlead_edgy
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $eq_guitarlead_edgy
								instrument = guitar
							}}
					endif
					change \{guitar_knob_effects_position = 2}
					case 3
					if issoundplaying \{audio_options_guitar}
						setsoundbusseffects \{effects = [
								{
									$eq_guitarlead_fuzz
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $eq_guitarlead_fuzz
								instrument = guitar
							}}
					endif
					change \{guitar_knob_effects_position = 3}
				endswitch
			endif
			case 1
			if gotparam \{newvalue}
				switch <newvalue>
					case 1
					if issoundplaying \{audio_options_bass}
						setsoundbusseffects \{effects = [
								{
									$eq_bass_bari
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $eq_bass_bari
								instrument = bass
							}}
					endif
					change \{bass_knob_effects_position = 1}
					case 2
					if issoundplaying \{audio_options_bass}
						setsoundbusseffects \{effects = [
								{
									$eq_bass_boomy
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $eq_bass_boomy
								instrument = bass
							}}
					endif
					change \{bass_knob_effects_position = 2}
					case 3
					if issoundplaying \{audio_options_bass}
						setsoundbusseffects \{effects = [
								{
									$eq_bass_fretty
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $eq_bass_fretty
								instrument = bass
							}}
					endif
					change \{bass_knob_effects_position = 3}
				endswitch
			endif
			case 2
			if gotparam \{newvalue}
				switch <newvalue>
					case 1
					if issoundplaying \{audio_options_drum}
						setsoundbusseffects \{effects = [
								{
									$eq_drum_punch
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $eq_drum_punch
								instrument = drums
							}}
					endif
					change \{drum_knob_effects_position = 1}
					case 2
					if issoundplaying \{audio_options_drum}
						setsoundbusseffects \{effects = [
								{
									$eq_drum_crack
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $eq_drum_crack
								instrument = drums
							}}
					endif
					change \{drum_knob_effects_position = 2}
					case 3
					if issoundplaying \{audio_options_drum}
						setsoundbusseffects \{effects = [
								{
									$eq_drum_sizzle
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $eq_drum_sizzle
								instrument = drums
							}}
					endif
					change \{drum_knob_effects_position = 3}
				endswitch
			endif
			case 3
		endswitch
	elseif gotparam \{dolby_option}
		if (<dolby_digital> = 1)
			playsound \{menu_dolbydigitalenable_surround_l
				vol = 4
				pan1x = -1
				pan1y = 1
				buss = front_end}
			playsound \{menu_dolbydigitalenable_surround_c
				vol = 4
				pan1x = 0
				pan1y = 1
				buss = front_end}
			playsound \{menu_dolbydigitalenable_surround_r
				vol = 4
				pan1x = 1
				pan1y = 1
				buss = front_end}
			playsound \{menu_dolbydigitalenable_surround_ls
				vol = 4
				pan1x = -1
				pan1y = -1
				buss = front_end}
			playsound \{menu_dolbydigitalenable_surround_rs
				vol = 4
				pan1x = 1
				pan1y = -1
				buss = front_end}
			playsound \{menu_dolbydigitalenable_surround_lf
				vol = 4
				lfeonly = true
				lfe_vol = -15
				buss = front_end}
		else
			soundevent \{event = dolby_off}
		endif
	elseif gotparam \{back}
		soundevent \{event = sound_options_back}
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
		spawnscriptnow \{no_dolby_digital_sounds}
	elseif gotparam \{backgeneric}
		generic_menu_pad_back_sound
	elseif gotparam \{choose}
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
		soundevent \{event = sound_options_select}
		spawnscriptnow \{no_dolby_digital_sounds}
	endif
endscript

script changespinaltapvolume \{spinal_tap_volume_max = 11}
	<spinal_tap_volume> = (<spinal_tap_volume> + <change>)
	if (<spinal_tap_volume> < 0)
		<spinal_tap_volume> = 0
	elseif (<spinal_tap_volume> > <spinal_tap_volume_max>)
		<spinal_tap_volume> = <spinal_tap_volume_max>
	endif
	return volume = <spinal_tap_volume>
endscript

script ui_options_audio_get_buss_volume 
	switch <volume>
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
		<vol> = -4.3
		case 5
		<vol> = -5.1
		case 4
		<vol> = -5.9
		case 3
		<vol> = -6.7
		case 2
		<vol> = -7.5
		case 1
		<vol> = -8.3
		case 0
		<vol> = -9.1
		default
		<vol> = -3.5
	endswitch
	return vol = <vol>
endscript

script ui_options_audio_update_all_volumes \{time = 0}
	audiointerface :gettags
	update_all_volumes <...>
endscript

script update_all_volumes \{time = 0
		player = 1}
	getplayerinfo <player> checksum
	get_savegame_from_player_status player_status = <checksum>
	getglobaltags user_options savegame = <savegame>
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.guitar.vol)
	soundbussunlock \{user_leadgtr}
	soundbussunlock \{user_rhythmgtr}
	setsoundbussparams {user_rhythmgtr = {vol = <vol>} time = <time>}
	setsoundbussparams {user_leadgtr = {vol = <vol>} time = <time>}
	soundbusslock \{user_leadgtr}
	soundbusslock \{user_rhythmgtr}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.bass.vol)
	soundbussunlock \{user_bass}
	setsoundbussparams {user_bass = {vol = <vol>} time = <time>}
	soundbusslock \{user_bass}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.drum.vol)
	soundbussunlock \{user_drums}
	setsoundbussparams {user_drums = {vol = <vol>} time = <time>}
	soundbusslock \{user_drums}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.mic.vol)
	ui_options_audio_update_mic_volume player = <player>
	soundbussunlock \{user_leadvox}
	setsoundbussparams {options_vox = {vol = <vol>} time = <time>}
	soundbusslock \{user_leadvox}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.vocals.vol)
	soundbussunlock \{user_leadvox}
	setsoundbussparams {user_leadvox = {vol = <vol>} time = <time>}
	soundbusslock \{user_leadvox}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.band.vol)
	soundbussunlock \{user_band}
	setsoundbussparams {user_band = {vol = <vol>} time = <time>}
	soundbusslock \{user_band}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.sfx.vol)
	soundbussunlock \{user_sfx}
	soundbussunlock \{user_crowd}
	soundbussunlock \{user_crowdsingalong}
	setsoundbussparams {ui = {vol = <vol>} time = <time>}
	setsoundbussparams {user_crowd = {vol = <vol>} time = <time>}
	setsoundbussparams {user_crowdsingalong = {vol = <vol>} time = <time>}
	soundbusslock \{user_sfx}
	soundbusslock \{user_crowd}
	soundbusslock \{user_crowdsingalong}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.backup.vol)
endscript

script ui_options_audio_update_mic_volume \{player = 1}
	if playerinfoequals <player> is_local_client = 0
		return
	endif
	if is_mic_volume_shared
		<share_mic_settings> = 1
	else
		<share_mic_settings> = 0
	endif
	if (<share_mic_settings> = 1)
		getglobaltags \{user_options}
	else
		getplayerinfo <player> checksum
		get_savegame_from_player_status player_status = <checksum>
		getglobaltags savegame = <savegame> user_options
	endif
	micvolume = (<volumes>.guitar.mic.vol)
	if (<share_mic_settings> = 1)
		gamemode_getnumplayersshown
		<player> = 1
		begin
		mic_set_device_volume player = <player> micvolume = <micvolume>
		<player> = (<player> + 1)
		repeat <num_players_shown>
	else
		mic_set_device_volume player = <player> micvolume = <micvolume>
	endif
endscript

script mic_set_device_volume 
	requireparams \{[
			player
			micvolume
		]
		all}
	if playerinfoequals <player> bot_play = 1
		return
	endif
	getinputhandlerbotindex player = <player>
	<bot_controller> = <controller>
	getplayerinfo <player> controller
	if (<bot_controller> = <controller>)
		return
	endif
	if playerinfoequals <player> is_local_client = 0
		return
	endif
	if NOT playerinfoequals <player> part = vocals
		return
	endif
	if isps3
		switch <micvolume>
			case 11
			<micgain> = 0.0
			<micthreshold> = -10
			<gainmakeup> = 6
			case 10
			<micgain> = 0.0
			<micthreshold> = -12
			<gainmakeup> = 6
			case 9
			<micgain> = 0.0
			<micthreshold> = -12
			<gainmakeup> = 4
			case 8
			<micgain> = 0.0
			<micthreshold> = -13
			<gainmakeup> = 4
			case 7
			<micgain> = 0.0
			<micthreshold> = -14
			<gainmakeup> = 3
			case 6
			<micgain> = 0.0
			<micthreshold> = -15
			<gainmakeup> = 1
			case 5
			<micgain> = 0.0
			<micthreshold> = -16
			<gainmakeup> = 1
			case 4
			<micgain> = 0.0
			<micthreshold> = -18
			<gainmakeup> = 1
			case 3
			<micgain> = 0.0
			<micthreshold> = -19
			<gainmakeup> = 0
			case 2
			<micgain> = 0.0
			<micthreshold> = -20
			<gainmakeup> = 0
			case 1
			<micgain> = 0.0
			<micthreshold> = -22
			<gainmakeup> = 0
			case 0
			<micgain> = 0.0
			<micthreshold> = -24
			<gainmakeup> = 0
			default
			<micgain> = 0.0
			<micthreshold> = -14
			<gainmakeup> = 3
		endswitch
	else
		switch <micvolume>
			case 11
			<micgain> = 0.0
			<micthreshold> = -12
			<gainmakeup> = 5
			case 10
			<micgain> = 0.0
			<micthreshold> = -13
			<gainmakeup> = 5
			case 9
			<micgain> = 0.0
			<micthreshold> = -14
			<gainmakeup> = 5
			case 8
			<micgain> = 0.0
			<micthreshold> = -14
			<gainmakeup> = 4.5
			case 7
			<micgain> = 0.0
			<micthreshold> = -15
			<gainmakeup> = 4
			case 6
			<micgain> = 0.0
			<micthreshold> = -17
			<gainmakeup> = 4
			case 5
			<micgain> = 0.0
			<micthreshold> = -18
			<gainmakeup> = 3
			case 4
			<micgain> = 0.0
			<micthreshold> = -19
			<gainmakeup> = 2
			case 3
			<micgain> = 0.0
			<micthreshold> = -20
			<gainmakeup> = 1
			case 2
			<micgain> = 0.0
			<micthreshold> = -23
			<gainmakeup> = 0
			case 1
			<micgain> = 0.0
			<micthreshold> = -26
			<gainmakeup> = 0
			case 0
			<micgain> = 0.0
			<micthreshold> = -30
			<gainmakeup> = 0
			default
			<micgain> = 0.0
			<micthreshold> = -15
			<gainmakeup> = 4
		endswitch
	endif
	if vocals_getmictype player = <player>
		if (<specific_mic_type> = singstar)
			<micthreshold> = (<micthreshold> - 4)
			<micgain> = (<micgain> + 0.6)
		endif
		if (<specific_mic_type> = microsoft_wireless)
			<micgain> = (<micgain> + 0.5)
		endif
	endif
	vocals_setmicgain player = <player> gain = <micgain>
	vocaldspsetparams controller = <controller> effect = compressor threshold = <micthreshold> gainmakeup = <gainmakeup>
endscript

script ui_options_audio_set_dolby_digital 
	getglobaltags \{user_options}
	if (<dolby_digital> = 0)
		disabledolbydigital
	else
		enabledolbydigital
	endif
endscript

script dolby_highlight_motion 
	if audiointerface :desc_resolvealias \{name = alias_dolby_highlight_container}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			begin
			i = 0
			begin
			curr_id = (<children> [<i>])
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_v = true
			else
				<curr_id> :se_setprops flip_v = false
			endif
			rand = Random (@ 0 @ 1 )
			if (<rand> = 1)
				<curr_id> :se_setprops flip_h = true
			else
				<curr_id> :se_setprops flip_h = false
			endif
			i = (<i> + 1)
			repeat <array_size>
			wait \{0.1
				second}
			repeat
		endif
	endif
endscript
