
script ui_create_options_audio 
	requireparams \{[
			from_pause_menu
		]
		all}
	menu_music_off
	spawnscriptlater \{spawned_looping_audio_options_song}
	if NOT gotparam \{device_num}
		device_num = ($primary_controller)
	endif
	vocals_mute_all_mics \{mute = false}
	get_savegame_from_controller controller = <device_num>
	getglobaltags user_options savegame = <savegame>
	volume = [0 0 0 0 0 0 0 0]
	setarrayelement arrayname = volume index = 0 newvalue = (<volumes>.guitar.guitar.vol)
	setarrayelement arrayname = volume index = 1 newvalue = (<volumes>.guitar.bass.vol)
	setarrayelement arrayname = volume index = 2 newvalue = (<volumes>.guitar.drum.vol)
	setarrayelement arrayname = volume index = 3 newvalue = (<volumes>.guitar.vocals.vol)
	setarrayelement arrayname = volume index = 4 newvalue = (<volumes>.guitar.band.vol)
	setarrayelement arrayname = volume index = 5 newvalue = (<volumes>.guitar.mic.vol)
	setarrayelement arrayname = volume index = 6 newvalue = (<volumes>.guitar.sfx.vol)
	setarrayelement arrayname = volume index = 7 newvalue = (<volumes>.guitar.crowd.vol)
	initial_volume = [7 7 7 7 7 7 7 7]
	formattext \{textname = dolby_on_text
		qs(0x50fcfa48)}
	createscreenelement {
		parent = root_window
		id = audiointerface
		type = descinterface
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
	audiointerface :se_setprops \{mixer_channel_lamp_alpha = 0.0}
	if audiointerface :desc_resolvealias \{name = alias_audio_mixer_menu}
		assignalias id = <resolved_id> alias = current_menu
		assignalias id = <resolved_id> alias = mixer_text_menu
		<resolved_id> :se_setprops {
			event_handlers = [
				{pad_back ui_options_check_settings}
				{pad_option ui_options_audio_reset_values params = {savegame = <savegame>}}
				{pad_option2 options_audio_flip_dolby_option params = {savegame = <savegame>}}
				{menu_selection_changed ui_options_audio_text_menu_sound}
			]
			tags = {current_focused_idx = -1}
		}
		if getscreenelementchildren \{id = mixer_text_menu}
			getarraysize <children>
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
			repeat <array_size>
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
					{pad_back ui_options_audio_fader_back params = {savegame = <savegame>}}
					{pad_choose ui_options_audio_fader_choose params = {savegame = <savegame>}}
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
	if screenelementexists \{id = mixer_text_menu}
		launchevent \{type = focus
			target = mixer_text_menu
			data = {
				child_index = 0
			}}
	endif
endscript

script ui_destroy_options_audio 
	killspawnedscript \{name = spawned_looping_audio_options_song}
	stopsoundevent \{audio_options_menu_microphone
		fade_time = 0.3
		fade_type = linear}
	stopsound \{audio_options_song}
	if gameispaused
		printf \{channel = sfx
			qs(0xd1bc0783)}
	else
		printf \{channel = sfx
			qs(0xc9aa4352)}
		if NOT scriptisrunning \{fretbar_update_tempo}
			menu_music_on
		endif
	endif
	spawnscriptnow \{no_dolby_digital_sounds}
	vocals_mute_all_mics \{mute = true}
	destroyscreenelement \{id = audiointerface}
	generic_ui_destroy
endscript

script ui_options_audio_reset_values 
	requireparams \{[
			savegame
		]
		all}
	audiointerface :gettags
	getarraysize <initial_volume>
	i = 0
	begin
	if ((<volume> [<i>]) != (<initial_volume> [<i>]))
		soundevent \{event = menu_audio_options_reset}
		break
	endif
	<i> = (<i> + 1)
	repeat (<array_size>)
	audiointerface :settags {volume = <initial_volume> eq = <initial_eq>}
	ui_options_audio_set_values \{time = 0.3}
endscript

script ui_options_audio_set_values \{time = 0.0}
	audiointerface :gettags
	if audiointerface :desc_resolvealias \{name = alias_faders_container}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <volume>
			i = 0
			begin
			posx = 3
			posy = (-27 + (265 * (1.0 - ((<volume> [<i>]) / 11.0))))
			<fader> = (<children> [<i>])
			<fader> :se_setprops {
				mixer_fader_pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posy>))
				time = <time>
			}
			j = 1
			alpha_value = 0
			begin
			formattext checksumname = fader_light 'lights_ON_%a_alpha' a = <j>
			<alpha_value> = 0
			if (<j> <= (<volume> [<i>]))
				<alpha_value> = 1
			endif
			addparam structure_name = fader_light_alpha_struct name = <fader_light> value = <alpha_value>
			<fader> :se_setprops {
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
			if playerinfoequals <player_num> bot_play = 1
				<controller> = 0
			endif
		endif
	endif
	updatevolumestag part = guitar name = guitar params = {vol = (<volume> [0])}
	updatevolumestag part = guitar name = bass params = {vol = (<volume> [1])}
	updatevolumestag part = guitar name = drum params = {vol = (<volume> [2])}
	updatevolumestag part = guitar name = vocals params = {vol = (<volume> [3])}
	updatevolumestag part = guitar name = band params = {vol = (<volume> [4])}
	updatevolumestag part = guitar name = mic params = {vol = (<volume> [5])} controller = <controller>
	updatevolumestag part = guitar name = sfx params = {vol = (<volume> [6])}
	updatevolumestag part = guitar name = crowd params = {vol = (<volume> [7])}
	ui_options_audio_update_all_volumes
	songsetplayereqsettings
endscript

script ui_options_audio_text_menu_sound 
	soundevent \{event = ui_fader}
endscript

script ui_options_audio_focus_text_menu 
	requireparams \{[
			text_idx
		]
		all}
	if screenelementexists \{id = audiointerface}
		initial_highlight_pos = (-100.0, -143.0)
		gettags
		obj_getid
		getscreenelementposition id = <objid>
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
			scriptassert \{'out of audio mixer range'}
		endswitch
		if NOT (<mixer_menu_highlight_alpha> = 0.3)
			audiointerface :se_setprops \{mixer_menu_highlight_alpha = 0.3
				time = 0.1}
		endif
		audiointerface :se_setprops mixer_menu_highlight_pos = (<initial_highlight_pos> + (<spacing> * <text_idx>)) time = 0.1
		if screenelementexists \{id = mixer_text_menu}
			mixer_text_menu :settags {current_focused_idx = <text_idx>}
			mixer_text_menu :se_setprops \{alpha = 1
				time = 0.1}
		endif
	endif
endscript

script ui_options_audio_unfocus_text_menu 
	se_setprops \{alpha = 0.5}
endscript

script ui_options_audio_choose 
	soundevent \{event = sound_options_select}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
	add_user_control_helper \{text = qs(0xb63a145a)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xf7723015)
		button = red
		z = 100000}
	gettags
	if audiointerface :desc_resolvealias \{name = alias_faders_container}
		if resolvescreenelementid id = {<resolved_id> child = <index>}
			audiointerface :se_setprops \{mixer_channel_lamp_alpha = 1.0
				time = 0.1}
			launchevent \{type = unfocus
				target = mixer_text_menu}
			audiointerface :gettags
			<resolved_id> :se_getprops
			<resolved_id> :settags {
				current = slider
				highlight = slider
				old_volume = (<volume> [<index>])
			}
			launchevent type = focus target = <resolved_id>
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
	if screenelementexists \{id = audiointerface}
		audiointerface :se_setprops \{mixer_preset_on_state_alpha = 0
			time = 0.1}
	endif
endscript

script ui_options_audio_preset_choose 
	soundevent \{event = sound_options_select}
	requireparams \{[
			preset_idx
		]
		all}
	if screenelementexists \{id = audiointerface}
		audiointerface :gettags
		if (<preset_idx> = 3)
			if screenelementexists \{id = mixer_preset_menu}
				launchevent \{type = unfocus
					target = mixer_preset_menu}
			endif
			if screenelementexists \{id = mixer_text_menu}
				launchevent \{type = focus
					target = mixer_text_menu}
			endif
		else
			getarraysize <volume>
			i = 0
			begin
			setarrayelement arrayname = volume index = <i> newvalue = (<initial_volume> [<i>])
			<i> = (<i> + 1)
			repeat (<array_size> - 1)
			switch <preset_idx>
				case 0
				setarrayelement \{arrayname = volume
					index = 6
					newvalue = 7}
				case 1
				setarrayelement \{arrayname = volume
					index = 6
					newvalue = 10}
				case 2
				setarrayelement \{arrayname = volume
					index = 6
					newvalue = 0}
				default
				scriptassert \{'invalid preset mode!'}
			endswitch
			audiointerface :settags volume = <volume>
			ui_options_audio_set_values \{time = 0.1}
			ui_options_sound_event \{slider
				index = 6}
		endif
	endif
endscript

script ui_options_audio_preset_back 
	gettags
	se_getprops
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
	menu_finish
	if audiointerface :desc_resolvealias \{name = alias_mixer_preset_menu}
		ui_options_sound_event \{back}
		settags \{current = none}
		launchevent type = unfocus target = <resolved_id>
		audiointerface :se_setprops \{mixer_preset_container_alpha = 0}
		mixer_text_menu :se_setprops \{alpha = 1.0
			time = 0.1}
		launchevent \{type = focus
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
	requireparams \{[
			preset_mode
		]
		all}
	if screenelementexists \{id = audiointerface}
		clean_up_user_control_helpers
		add_gamertag_helper exclusive_device = <device_num>
		menu_finish
		if audiointerface :desc_resolvealias \{name = alias_mixer_preset_menu}
			audiointerface :se_setprops \{mixer_preset_container_alpha = 1}
			audiointerface :se_setprops \{mixer_channel_lamp_alpha = 0
				time = 0.1}
			switch <preset_mode>
				case normal
				launchevent type = focus target = <resolved_id> data = {child_index = 0}
				case concert
				launchevent type = focus target = <resolved_id> data = {child_index = 1}
				case cd
				launchevent type = focus target = <resolved_id> data = {child_index = 2}
				case custom
				default
				launchevent type = focus target = <resolved_id> data = {child_index = 3}
			endswitch
		endif
		audiointerface :se_setprops \{mixer_preset_on_state_alpha = 0.5
			time = 0.1}
		ui_options_sound_event \{choose}
	endif
endscript

script ui_options_audio_focus_preset_menu 
	if screenelementexists \{id = mixer_text_menu}
		mixer_text_menu :se_setprops \{alpha = 0.5
			time = 0.1}
	endif
	if screenelementexists \{id = audiointerface}
		audiointerface :se_setprops \{mixer_preset_on_state_alpha = 0.5
			time = 0.1}
	endif
endscript

script ui_options_audio_focus_fader_menu 
	gettags
	if (<current> = none)
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
	gettags
	se_setprops \{mixer_fader_highlight_alpha = 0.0}
endscript

script ui_options_audio_fader_choose 
	requireparams \{[
			savegame
		]
		all}
	gettags
	se_getprops
	soundevent \{event = sound_options_select}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
	menu_finish
	getglobaltags savegame = <savegame> user_options
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
	if (<current> = none)
		settags \{current = slider
			highlight = slider}
	elseif (<current> = slider)
		settags \{current = none}
		launchevent \{type = focus
			target = mixer_text_menu}
		mixer_text_menu :se_setprops \{alpha = 1.0
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
	requireparams \{[
			savegame
		]
		all}
	soundevent \{event = sound_options_back}
	gettags
	obj_getid
	se_getprops
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	getglobaltags savegame = <savegame> user_options
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
	audiointerface :gettags
	setarrayelement arrayname = volume index = <index> newvalue = <old_volume>
	audiointerface :settags volume = <volume>
	ui_options_audio_set_values \{time = 0.1}
	if (<current> = none)
		printf \{channel = options_audio
			qs(0x05b5b626)}
		launchevent \{type = focus
			target = mixer_text_menu}
		mixer_text_menu :se_setprops \{alpha = 1.0
			time = 0.1}
		launchevent type = unfocus target = <objid>
	elseif (<current> = slider)
		ui_options_sound_event \{back}
		settags \{current = none}
		launchevent \{type = focus
			target = mixer_text_menu}
		mixer_text_menu :se_setprops \{alpha = 1.0
			time = 0.1}
		launchevent type = unfocus target = <objid>
	else
		settags \{current = none}
		ui_options_audio_focus_fader_menu
	endif
endscript

script ui_options_audio_fader_dir 
	gettags
	if (<current> = none)
		settags \{highlight = slider}
		generic_menu_up_or_down_sound
	elseif (<current> = slider)
		audiointerface :gettags
		new_volume = 0
		min_volume = 0
		dolby_changed = 0
		if gotparam \{down}
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
			soundevent \{event = audio_options_scroll}
			setarrayelement arrayname = volume index = <index> newvalue = <new_volume>
			audiointerface :settags volume = <volume>
			ui_options_audio_set_values \{time = 0.1}
			ui_options_sound_event slider index = <index>
		endif
	endif
	ui_options_audio_focus_fader_menu
endscript

script ui_options_audio_set_dolby_switch 
	requireparams \{[
			dolby_digital
		]
		all}
	if screenelementexists \{id = audiointerface}
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
	soundevent \{event = sound_options_back}
	if screenelementexists \{id = mixer_text_menu}
		ui_options_sound_event \{back}
		settags \{current = none}
		launchevent \{type = unfocus
			target = mixer_text_menu}
		audiointerface :se_setprops \{mixer_menu_highlight_alpha = 0
			time = 0.1}
		mixer_text_menu :se_setprops \{alpha = 0.5
			time = 0.1}
		launchevent \{type = focus
			target = mixer_preset_menu}
	endif
endscript

script ui_options_audio_mixer_scroll 
	requireparams \{[
			direction
		]
		all}
	if screenelementexists \{id = mixer_text_menu}
		mixer_text_menu :gettags \{current_focused_idx}
		if (<direction> = up)
			if (<current_focused_idx> > 0)
				launchevent type = focus target = mixer_text_menu data = {child_index = (<current_focused_idx> - 1)}
			endif
		else
			getscreenelementchildren \{id = mixer_text_menu}
			getarraysize <children>
			if (<current_focused_idx> < (<array_size> - 1))
				launchevent type = focus target = mixer_text_menu data = {child_index = (<current_focused_idx> + 1)}
			endif
		endif
		sound_options_scroll
	endif
endscript

script ui_options_sound_event 
	audiointerface :gettags
	if gotparam \{slider}
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
			soundevent \{event = audio_options_menu_microphone}
			case 6
			printf \{channel = sfx
				qs(0x3a27d10c)}
			soundevent \{event = audio_options_menu_sfx}
			case 7
			printf \{channel = sfx
				qs(0x233ce04d)}
			soundevent \{event = audio_options_menu_crowd}
			default
			printf \{channel = sfx
				qs(0x6ffa4873)}
		endswitch
	elseif gotparam \{dolby_option}
		if (<dolby_digital> = 1)
			playsound \{menu_dolbydigitalenable_surround_l
				vol = -2
				pan1x = -1
				pan1y = 1
				buss = front_end}
			playsound \{menu_dolbydigitalenable_surround_c
				vol = -2
				pan1x = 0
				pan1y = 1
				buss = front_end}
			playsound \{menu_dolbydigitalenable_surround_r
				vol = -2
				pan1x = 1
				pan1y = 1
				buss = front_end}
			playsound \{menu_dolbydigitalenable_surround_ls
				vol = -2
				pan1x = -1
				pan1y = -1
				buss = front_end}
			playsound \{menu_dolbydigitalenable_surround_rs
				vol = -2
				pan1x = 1
				pan1y = -1
				buss = front_end}
			playsound \{menu_dolbydigitalenable_surround_lf
				vol = -2
				lfeonly = true
				lfe_vol = -15
				buss = front_end}
		else
			soundevent \{event = dolby_off}
		endif
	elseif gotparam \{back}
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
		spawnscriptnow \{no_dolby_digital_sounds}
	endif
endscript
songtemporarilydowninvolume = 0

script turndownsongtemporarily \{status = on}
	printf \{channel = sfx
		qs(0xa5726d44)}
	change \{songtemporarilydowninvolume = 1}
	array = []
	addarrayelement array = <array> element = (($current_audio_options_song_guitar_vol) -15)
	addarrayelement array = <array> element = (($current_audio_options_song_bass_vol) -15)
	addarrayelement array = <array> element = (($current_audio_options_song_drums_vol) -15)
	addarrayelement array = <array> element = 0.0
	addarrayelement array = <array> element = (($current_audio_options_song_vocals_vol) -15)
	addarrayelement array = <array> element = (($current_audio_options_song_band_vol) -15)
	printf \{channel = sfx
		qs(0xa030eeee)}
	setsoundparams audio_options_song vol = <array> time = 0.5
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
	addarrayelement array = <array> element = (($current_audio_options_song_guitar_vol) -10)
	addarrayelement array = <array> element = (($current_audio_options_song_bass_vol) -10)
	addarrayelement array = <array> element = (($current_audio_options_song_drums_vol) -10)
	addarrayelement array = <array> element = 0.0
	addarrayelement array = <array> element = (($current_audio_options_song_vocals_vol) -10)
	addarrayelement array = <array> element = (($current_audio_options_song_band_vol) -10)
	printf \{channel = sfx
		qs(0xa030eeee)}
	setsoundparams audio_options_song vol = <array> time = 1.0
	printf \{channel = sfx
		qs(0x7107be30)}
	change \{songtemporarilydowninvolume = 0}
endscript

script changespinaltapvolume \{spinal_tap_volume_max = 10}
	<spinal_tap_volume> = (<spinal_tap_volume> + <change>)
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
	audiointerface :gettags
	update_all_volumes <...>
endscript

script update_all_volumes \{time = 0
		device_num = 0}
	if gotparam \{player}
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
	getglobaltags user_options savegame = <savegame>
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.guitar.vol) instr = qs(0x09048d9e)
	soundbussunlock \{user_guitar}
	soundbussunlock \{user_rhythmgtr}
	setsoundbussparams {user_rhythmgtr = {vol = <vol>} time = <time>}
	setsoundbussparams {user_guitar = {vol = <vol>} time = <time>}
	soundbusslock \{user_guitar}
	soundbusslock \{user_rhythmgtr}
	ui_options_audio_get_options_screen_volume volume = (<volumes>.guitar.guitar.vol)
	change current_audio_options_song_guitar_vol = <vol>
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.bass.vol) instr = qs(0xb6237ee8)
	soundbussunlock \{user_bass}
	setsoundbussparams {user_bass = {vol = <vol>} time = <time>}
	soundbusslock \{user_bass}
	ui_options_audio_get_options_screen_volume volume = (<volumes>.guitar.bass.vol)
	change current_audio_options_song_bass_vol = <vol>
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.drum.vol) instr = qs(0xbcbd3cf7)
	soundbussunlock \{user_drums}
	setsoundbussparams {user_drums = {vol = <vol>} time = <time>}
	soundbusslock \{user_drums}
	ui_options_audio_get_options_screen_volume volume = (<volumes>.guitar.drum.vol)
	change current_audio_options_song_drums_vol = <vol>
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.vocals.vol) instr = qs(0x879f5b50)
	soundbussunlock \{user_vocals}
	setsoundbussparams {user_vocals = {vol = <vol>} time = <time>}
	soundbusslock \{user_vocals}
	ui_options_audio_get_options_screen_volume volume = (<volumes>.guitar.vocals.vol)
	change current_audio_options_song_vocals_vol = <vol>
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.band.vol) instr = qs(0x11d3753c)
	soundbussunlock \{user_band}
	setsoundbussparams {user_band = {vol = <vol>} time = <time>}
	soundbusslock \{user_band}
	ui_options_audio_get_options_screen_volume volume = (<volumes>.guitar.band.vol)
	change current_audio_options_song_band_vol = <vol>
	ui_options_audio_get_buss_volume_full_dynamics volume = (<volumes>.guitar.mic.vol)
	sidechainvolumesetting = (<volumes>.guitar.mic.vol)
	if (<sidechainvolumesetting> > 7)
		<sidechainvolumesetting> = 7
	endif
	casttofloat \{sidechainvolumesetting}
	change sidechainingvolumepercentadjustment = (<sidechainvolumesetting> / 7.0)
	if gotparam \{player}
		ui_options_audio_update_mic_volume player = <player>
	endif
	soundbussunlock \{user_microphone}
	setsoundbussparams {user_microphone = {vol = <vol>} time = <time>}
	soundbusslock \{user_microphone}
	ui_options_audio_get_buss_volume_full_dynamics volume = (<volumes>.guitar.sfx.vol)
	soundbussunlock \{user_sfx}
	setsoundbussparams {user_sfx = {vol = <vol>} time = <time>}
	soundbusslock \{user_sfx}
	ui_options_audio_get_buss_volume_full_dynamics volume = (<volumes>.guitar.crowd.vol)
	soundbussunlock \{user_crowd}
	soundbussunlock \{user_crowdsingalong}
	setsoundbussparams {user_crowd = {vol = <vol>} time = <time>}
	setsoundbussparams {user_crowdsingalong = {vol = <vol>} time = <time>}
	soundbusslock \{user_crowd}
	soundbusslock \{user_crowdsingalong}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.backup.vol)
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
		addarrayelement array = <array> element = (($current_audio_options_song_guitar_vol) -10)
		addarrayelement array = <array> element = (($current_audio_options_song_bass_vol) -10)
		addarrayelement array = <array> element = (($current_audio_options_song_drums_vol) -10)
		addarrayelement array = <array> element = 0.0
		addarrayelement array = <array> element = (($current_audio_options_song_vocals_vol) -10)
		addarrayelement array = <array> element = (($current_audio_options_song_band_vol) -10)
		printf \{channel = sfx
			qs(0xa030eeee)}
		setsoundparams audio_options_song vol = <array>
	endif
endscript

script ui_options_audio_update_mic_volume 
	requireparams \{[
			player
		]
		all}
	if playerinfoequals <player> is_local_client = 0
		return
	endif
	gamemode_gettype
	if (<type> = freeplay)
		getplayerinfo <player> freeplay_mic_volume
		micvolume = <freeplay_mic_volume>
	else
		get_savegame_from_player player = <player>
		getglobaltags savegame = <savegame> user_options
		micvolume = (<volumes>.guitar.mic.vol)
	endif
	mic_set_device_volume player = <player> micvolume = <micvolume>
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
	if vocals_getmictype player = <player>
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
	vocals_setmicgain player = <player> gain = <micgain>
	setmicvolume controller = <controller> vol = <micvolume>
	vocaldspsetparams controller = <controller> effect = compressor threshold = <micthreshold> gainmakeup = <gainmakeup>
endscript

script options_audio_flip_dolby_option 
	requireparams \{[
			savegame
		]
		all}
	getglobaltags savegame = <savegame> user_options
	if (<dolby_digital> = 0)
		setglobaltags user_options params = {dolby_digital = 1} savegame = <savegame>
		spawnscriptnow \{waitthenplaydolbyonsound}
	else
		setglobaltags user_options params = {dolby_digital = 0} savegame = <savegame>
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
	stopsoundevent \{dolby_off
		fade_time = 0.2
		fade_type = log_slow}
	spawnscriptnow \{turndownsongtemporarily
		params = {
			status = on
		}}
	soundevent \{event = dolby_on}
endscript

script waitthenplaydolbyoffsound 
	wait \{0.2
		seconds}
	stopsoundevent \{dolby_on
		fade_time = 0.2
		fade_type = log_slow}
	spawnscriptnow \{turndownsongtemporarily
		params = {
			status = off
		}}
	soundevent \{event = dolby_off}
endscript

script ui_options_audio_set_dolby_digital 
	requireparams \{[
			savegame
		]
		all}
	spawnscriptnow ui_options_audio_set_dolby_digital_spawned params = {<...>}
endscript

script ui_options_audio_set_dolby_digital_spawned 
	getglobaltags savegame = <savegame> user_options param = dolby_digital
	begin
	if ($boot_movie_done = 1)
		break
	endif
	wait \{1
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
	requireparams \{[
			initial_volume
			volume
		]
		all}
	getarraysize <initial_volume>
	preset_mode = normal
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
			preset_mode = normal
		elseif ((<volume> [<i>] = 10))
			preset_mode = concert
		elseif ((<volume> [<i>]) = 0)
			preset_mode = cd
		else
			preset_mode = custom
		endif
	endif
	return preset_mode = <preset_mode>
endscript

script ui_options_audio_set_default_volume_lights 
	requireparams \{[
			default_volumes
		]
		all}
	num_mixer_light_children = ((11 * 2) - 1)
	if screenelementexists \{id = audiointerface}
		if audiointerface :desc_resolvealias \{name = alias_faders_container
				param = fader_menu_id}
			getscreenelementchildren id = <fader_menu_id>
			fader_children = <children>
			getarraysize <fader_children>
			faders_size = <array_size>
			getarraysize <default_volumes>
			default_volumes_size = <array_size>
			if (<faders_size> != <default_volumes_size>)
				scriptassert \{'number of faders does not match number of volumes'}
			endif
			if (<faders_size> > 0)
				i = 0
				begin
				if (<fader_children> [<i>]) :desc_resolvealias name = alias_lights param = lights_id
					child_pos_to_retrieve = (<num_mixer_light_children> - ((<default_volumes> [<i>]) * 2))
					getscreenelementchildren id = <lights_id>
					getarraysize <children>
					if (<array_size> > 0)
						getscreenelementposition id = (<children> [<child_pos_to_retrieve>]) local
						formattext checksumname = lights_alpha 'lights_ON_%a_alpha' a = (<default_volumes> [<i>])
						addparam structure_name = fader_light_alpha_struct name = <lights_alpha> value = 0
						x_pos = (<screenelementpos> [0])
						y_pos = (<screenelementpos> [1])
						casttointeger \{x_pos}
						casttointeger \{y_pos}
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
current_audio_options_song_guitar_vol = 0
current_audio_options_song_bass_vol = 0
current_audio_options_song_drums_vol = 0
current_audio_options_song_vocals_vol = 0
current_audio_options_song_band_vol = 0

script spawned_looping_audio_options_song 
	begin
	if ($blade_active = 1)
		pausesoundsbybuss \{master}
		begin
		if ($blade_active = 0)
			unpausesoundsbybuss \{master}
			break
		endif
		wait \{1
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
			addarrayelement array = <array> element = (($current_audio_options_song_guitar_vol) -15)
			addarrayelement array = <array> element = (($current_audio_options_song_bass_vol) -15)
			addarrayelement array = <array> element = (($current_audio_options_song_drums_vol) -15)
			addarrayelement array = <array> element = 0.0
			addarrayelement array = <array> element = (($current_audio_options_song_vocals_vol) -15)
			addarrayelement array = <array> element = (($current_audio_options_song_band_vol) -15)
		else
			array = []
			addarrayelement array = <array> element = (($current_audio_options_song_guitar_vol) -10)
			addarrayelement array = <array> element = (($current_audio_options_song_bass_vol) -10)
			addarrayelement array = <array> element = (($current_audio_options_song_drums_vol) -10)
			addarrayelement array = <array> element = 0.0
			addarrayelement array = <array> element = (($current_audio_options_song_vocals_vol) -10)
			addarrayelement array = <array> element = (($current_audio_options_song_band_vol) -10)
		endif
		printf \{channel = sfx
			qs(0xaec49e26)}
		playsound {
			audio_options_song
			buss = master
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
	wait \{1
		gameframe}
	repeat
endscript
