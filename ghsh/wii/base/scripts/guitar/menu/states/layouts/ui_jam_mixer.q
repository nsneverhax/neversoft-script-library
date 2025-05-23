
script ui_create_jam_mixer 
	CreateScreenElement {
		parent = root_window
		id = jammixer
		Type = descinterface
		desc = 'jam_audio_mixer_studio'
		z_priority = 650
		exclusive_device = ($primary_controller)
	}
	jammixer :se_setprops \{mixer_channel_lamp_alpha = 0.0}
	Change \{song_preview_curr_song_time = 0}
	if jammixer :desc_resolvealias \{Name = alias_audio_mixer_menu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops {
			event_handlers = [
				{pad_back ui_jam_mixer_back params = {from_adv = <from_adv> ghmix_persistant_settings = <ghmix_persistant_settings>}}
				{pad_up sound_options_scroll}
				{pad_down sound_options_scroll}
				{pad_option2 ui_jam_mixer_startstop_preview}
				{pad_option ui_jam_mixer_rewind_preview}
			]
		}
		if GetScreenElementChildren \{id = current_menu}
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			<current_item> :se_setprops {
				event_handlers = [
					{focus ui_jam_mixer_focus_text_menu}
					{unfocus ui_jam_mixer_unfocus_text_menu}
					{pad_choose ui_jam_mixer_choose}
				]
				tags = {
					index = <i>
				}
			}
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	if jammixer :desc_resolvealias \{Name = alias_faders_container}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			if ((<i> = 0) || (<i> = 1) || (<i> = 4))
				formatText checksumName = scrolling_options 'jam_mixer_sub_scrolling_%s' s = <i>
				formatText checksumName = vmenu_options 'jam_mixer_sub_vmenu_%s' s = <i>
				new_menu {
					scrollid = <scrolling_options>
					vmenuid = <vmenu_options>
					menu_pos = (0.0, 0.0)
					use_backdrop = 0
					default_colors = 0
					exclusive_device = ($primary_controller)
					event_handlers = [
						{pad_up ui_jam_mixer_sub_updown params = {up parent = <current_item>}}
						{pad_down ui_jam_mixer_sub_updown params = {down parent = <current_item>}}
						{pad_choose ui_jam_mixer_sub_choose params = {parent = <current_item>}}
						{pad_back ui_jam_mixer_sub_back params = {parent = <current_item>}}
						{pad_option2 ui_jam_mixer_startstop_preview}
						{pad_option ui_jam_mixer_rewind_preview}
					]
					menu_parent = <resolved_id>
				}
				<current_item> :SetTags {index = <i> current_selection = fader}
				formatText checksumName = pan_menu 'jam_mixer_pan_menu_%s' s = <i>
				CreateScreenElement {
					Type = ContainerElement
					id = <pan_menu>
					parent = <current_item>
					event_handlers = [
						{pad_choose ui_jam_mixer_pan_back params = {index = <i> parent = <current_item>}}
						{pad_back ui_jam_mixer_pan_back params = {index = <i> parent = <current_item>}}
						{pad_up ui_jam_mixer_pan_updown params = {up index = <i> parent = <current_item>}}
						{pad_down ui_jam_mixer_pan_updown params = {down index = <i> parent = <current_item>}}
						{pad_option2 ui_jam_mixer_startstop_preview}
						{pad_option ui_jam_mixer_rewind_preview}
					]
				}
				<current_item> :se_setprops knob_note_text = ($mixer_pan)
				<current_item> :se_setprops mixer_knob_container_alpha = 1.0
			elseif ((<i> = 2) || (<i> = 3))
				<current_item> :se_setprops mixer_knob_container_alpha = 0.0
			endif
			formatText checksumName = fade_menu 'jam_mixer_fader_menu_%s' s = <i>
			CreateScreenElement {
				Type = ContainerElement
				id = <fade_menu>
				parent = <current_item>
				event_handlers = [
					{pad_choose ui_jam_mixer_fader_back params = {index = <i> parent = <current_item>}}
					{pad_back ui_jam_mixer_fader_back params = {index = <i> parent = <current_item>}}
					{pad_up ui_jam_mixer_fader_updown params = {up index = <i> parent = <current_item>}}
					{pad_down ui_jam_mixer_fader_updown params = {down index = <i> parent = <current_item>}}
					{pad_option2 ui_jam_mixer_startstop_preview}
					{pad_option ui_jam_mixer_rewind_preview}
				]
			}
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	ui_jam_mixer_set_values
	menu_finish
	add_user_control_helper \{text = qs(0x43b287ab)
		button = yellow
		z = 100000}
	add_user_control_helper \{text = qs(0xb4933593)
		button = blue
		z = 100000}
endscript

script ui_destroy_jam_mixer 
	ui_jam_mixer_rewind_preview \{exit}
	DestroyScreenElement \{id = jammixer}
	generic_ui_destroy
endscript

script ui_jam_mixer_set_values \{time = 0.0}
	if jammixer :desc_resolvealias \{Name = alias_faders_container}
		if GetScreenElementChildren id = <resolved_id>
			i = 0
			begin
			<inst> = (<children> [<i>])
			gettrackinfo track = ($jam_tracks [<i>].id)
			PosX = 0
			PosY = (223 - (<Volume> * 19.0))
			<inst> :se_setprops mixer_fader_pos = (((1.0, 0.0) * <PosX>) + ((0.0, 1.0) * <PosY>)) time = <time>
			<pan> = (<pan> + 10.0)
			<ratio> = (<pan> / 20.0)
			rot_angle = (<ratio> * 180.0)
			<inst> :se_setprops mixer_knob_rot_angle = <rot_angle> time = <time>
			i = (<i> + 1)
			repeat 5
		endif
	endif
endscript

script ui_jam_mixer_focus_text_menu 
	GetTags
	Obj_GetID
	GetScreenElementPosition id = <objID>
	se_setprops {
		rgba = (($g_menu_colors).menu_title)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = (($g_menu_colors).menu_shadow)
	}
	jammixer :se_setprops mixer_channel_lamp_pos = ((440.0, 0.0) + ((124.0, 0.0) * <index>))
	jammixer :se_setprops \{mixer_channel_lamp_alpha = 0.5
		time = 0.1}
	switch (<index>)
		case 0
		text = ($mixer_volume_txt_rhythm)
		case 1
		text = ($mixer_volume_txt_lead)
		case 2
		text = qs(0x22988636)
		case 3
		text = qs(0x10603af3)
		case 4
		text = ($mixer_volume_txt_keyboard)
	endswitch
	GetUpperCaseString <text>
	<text> = <UppercaseString>
	jammixer :se_setprops mixer_info_text = <text>
endscript

script ui_jam_mixer_unfocus_text_menu 
	se_setprops {
		rgba = (($g_menu_colors).black)
		no_shadow
	}
endscript

script ui_jam_mixer_choose 
	clean_up_user_control_helpers
	menu_finish
	add_user_control_helper \{text = qs(0x43b287ab)
		button = yellow
		z = 100000}
	add_user_control_helper \{text = qs(0xb4933593)
		button = blue
		z = 100000}
	GetTags
	if jammixer :desc_resolvealias \{Name = alias_faders_container}
		if ResolveScreenElementID id = {<resolved_id> child = <index>}
			jammixer :se_setprops \{mixer_channel_lamp_alpha = 1.0
				time = 0.1}
			LaunchEvent \{Type = unfocus
				target = current_menu}
			if ((<index> = 0) || (<index> = 1) || (<index> = 4))
				SoundEvent \{event = sound_options_select}
				<resolved_id> :SetTags {current_selection = fader}
				<resolved_id> :se_setprops {
					mixer_fader_highlight_alpha = 1.0
					mixer_fader_highlight_rgba = [255 0 0 255]
					knob_highlight_alpha = 0.0
				}
				formatText checksumName = vmenu_options 'jam_mixer_sub_vmenu_%s' s = <index>
				LaunchEvent Type = focus target = <vmenu_options> data = {child_index = 1}
			else
				SoundEvent \{event = sound_options_select}
				<resolved_id> :se_setprops {
					mixer_fader_highlight_alpha = 1.0
					mixer_fader_highlight_rgba = [0 , 250 , 154 , 255]
				}
				formatText checksumName = fade_menu 'jam_mixer_fader_menu_%s' s = <index>
				LaunchEvent Type = focus target = <fade_menu>
			endif
		endif
	endif
	current_menu :se_setprops \{alpha = 0.5
		time = 0.1}
endscript

script ui_jam_mixer_sub_updown 
	se_getprops
	if GotParam \{up}
		generic_menu_up_or_down_sound \{up}
	elseif GotParam \{down}
		generic_menu_up_or_down_sound \{down}
	endif
	<parent> :GetTags
	if (<current_selection> = pan)
		<parent> :SetTags {current_selection = fader}
		<parent> :se_setprops {
			knob_highlight_alpha = 0.0
			mixer_fader_highlight_alpha = 1.0
			mixer_fader_highlight_rgba = [255 0 0 255]
		}
	elseif (<current_selection> = fader)
		<parent> :SetTags {current_selection = pan}
		<parent> :se_setprops {
			knob_highlight_alpha = 1.0
			knob_highlight_rgba = [255 0 0 255]
			mixer_fader_highlight_alpha = 0.0
		}
	endif
endscript

script ui_jam_mixer_sub_choose 
	se_getprops
	formatText checksumName = vmenu_options 'jam_mixer_sub_vmenu_%s' s = <index>
	<parent> :GetTags
	if (<current_selection> = pan)
		generic_menu_pad_choose_sound
		<parent> :se_setprops knob_highlight_rgba = [0 , 250 , 154 , 255]
		LaunchEvent Type = unfocus target = <vmenu_options>
		formatText checksumName = pan_menu 'jam_mixer_pan_menu_%s' s = <index>
		LaunchEvent Type = focus target = <pan_menu>
	elseif (<current_selection> = fader)
		generic_menu_pad_choose_sound
		<parent> :se_setprops mixer_fader_highlight_rgba = [0 , 250 , 154 , 255]
		LaunchEvent Type = unfocus target = <vmenu_options>
		formatText checksumName = fader_menu 'jam_mixer_fader_menu_%s' s = <index>
		LaunchEvent Type = focus target = <fader_menu>
	endif
endscript

script ui_jam_mixer_sub_back 
	SoundEvent \{event = sound_options_back}
	<parent> :se_setprops {
		knob_highlight_alpha = 0.0
		mixer_fader_highlight_alpha = 0.0
	}
	jammixer :se_setprops \{mixer_channel_lamp_alpha = 0.5
		time = 0.1}
	LaunchEvent Type = unfocus target = <objID>
	current_menu :se_setprops \{alpha = 1.0
		time = 0.1}
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script ui_jam_mixer_pan_updown \{no_sound = 0}
	gettrackinfo track = ($jam_tracks [<index>].id)
	if GotParam \{up}
		if (<no_sound> = 0 && <pan> < 10)
			SoundEvent event = ghtunes_ui_scroll_pan sfx_pan = <pan>
		endif
		<pan> = (<pan> + 1)
		<no_click> = 0
		if (<pan> > 10)
			<pan> = 10
			<no_click> = 1
		endif
	elseif GotParam \{down}
		if (<no_sound> = 0 && <pan> > -10)
			SoundEvent event = ghtunes_ui_scroll_pan sfx_pan = <pan>
		endif
		<pan> = (<pan> - 1)
		<no_click> = 0
		if (<pan> < -10)
			<pan> = -10
			<no_click> = 1
		endif
	endif
	settrackinfo track = ($jam_tracks [<index>].id) pan = <pan>
	guitar_jam_settings_update_pan jam_instrument = <index> pan = <pan>
	ui_jam_mixer_set_values \{time = 0.1}
endscript

script ui_jam_mixer_pan_back 
	generic_menu_pad_back_sound
	<parent> :se_setprops knob_highlight_rgba = [255 0 0 255]
	formatText checksumName = pan_menu 'jam_mixer_pan_menu_%s' s = <index>
	LaunchEvent Type = unfocus target = <pan_menu>
	formatText checksumName = vmenu_options 'jam_mixer_sub_vmenu_%s' s = <index>
	LaunchEvent Type = focus target = <vmenu_options>
endscript

script ui_jam_mixer_fader_updown \{no_sound = 0}
	se_getprops
	gettrackinfo track = ($jam_tracks [<index>].id)
	if GotParam \{up}
		if (<no_sound> = 0 && <Volume> < 10)
			sfx_vol = (<Volume> - 7)
			PlaySound ghtunes_menu_scroll buss = Front_End vol = <sfx_vol> pitch = 3
		endif
		<Volume> = (<Volume> + 1)
		<no_click> = 0
		if (<Volume> > 10)
			<Volume> = 10
			<no_click> = 1
		endif
	elseif GotParam \{down}
		if (<no_sound> = 0 && <Volume> > 0)
			sfx_vol = (<Volume> - 7)
			PlaySound ghtunes_menu_scroll buss = Front_End vol = <sfx_vol> pitch = 3
		endif
		<Volume> = (<Volume> - 1)
		<no_click> = 0
		if (<Volume> < 0)
			<Volume> = 0
			<no_click> = 1
		endif
	endif
	settrackinfo track = ($jam_tracks [<index>].id) Volume = <Volume>
	if (<Volume> = 0)
		<new_vol> = 100
	endif
	new_vol = ((10 - <Volume>) * 2)
	switch <index>
		case 0
		setsoundbussparams {jammode_rhythmguitar = {vol = (($default_BussSet.jammode_rhythmguitar.vol) - <new_vol>)}}
		case 1
		setsoundbussparams {jammode_leadguitar = {vol = (($default_BussSet.jammode_leadguitar.vol) - <new_vol>)}}
		case 2
		setsoundbussparams {jammode_bass = {vol = (($default_BussSet.jammode_bass.vol) - <new_vol>)}}
		case 3
		setsoundbussparams {jammode_drums = {vol = (($default_BussSet.jammode_drums.vol) - <new_vol>)}}
		printf channel = jam_mode qs(0x26113fb8) s = <new_vol>
		case 4
		setsoundbussparams {jammode_vox = {vol = (($default_BussSet.jammode_vox.vol) - <new_vol>)}}
	endswitch
	ui_jam_mixer_set_values \{time = 0.1}
endscript

script ui_jam_mixer_fader_back 
	formatText checksumName = fader_menu 'jam_mixer_fader_menu_%s' s = <index>
	LaunchEvent Type = unfocus target = <fader_menu>
	if ((<index> = 0) || (<index> = 1) || (<index> = 4))
		generic_menu_pad_back_sound
		<parent> :se_setprops mixer_fader_highlight_rgba = [255 0 0 255]
		formatText checksumName = vmenu_options 'jam_mixer_sub_vmenu_%s' s = <index>
		LaunchEvent Type = focus target = <vmenu_options>
	else
		SoundEvent \{event = sound_options_back}
		<parent> :se_setprops mixer_fader_highlight_alpha = 0.0
		current_menu :se_setprops \{alpha = 1.0
			time = 0.1}
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
endscript

script ui_jam_mixer_startstop_preview 
	if ScriptIsRunning \{guitar_jam_playback_recording}
		GetSongTimeMs
		Change song_preview_curr_song_time = <time>
		KillSpawnedScript \{Name = guitar_jam_playback_recording}
		KillSpawnedScript \{Name = guitar_jam_drum_playback}
	elseif ScriptIsRunning \{guitar_jam_drum_playback}
		GetSongTimeMs
		Change song_preview_curr_song_time = <time>
		KillSpawnedScript \{Name = guitar_jam_playback_recording}
		KillSpawnedScript \{Name = guitar_jam_drum_playback}
	else
		SpawnScriptNow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 0
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		SpawnScriptNow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 1
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		SpawnScriptNow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 2
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		SpawnScriptNow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 4
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		SpawnScriptNow \{guitar_jam_drum_playback
			params = {
				start_time = $song_preview_curr_song_time
			}}
	endif
	stopsound unique_id = ($jam_input_current_chord) fade_type = linear fade_time = $jam_fade_time
	stopsound unique_id = ($jam_input_current_lead) fade_type = log_fast fade_time = 0.3
	stopsound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = $jam_fade_time
	stopsound unique_id = ($jam_input_current_melody) fade_type = linear fade_time = $jam_fade_time
endscript

script ui_jam_mixer_rewind_preview 
	ResetSongTimer \{starttime = 0}
	Change \{song_preview_curr_song_time = 0}
	if NOT GotParam \{exit}
		SoundEvent \{event = dpad_play}
	endif
	if ScriptIsRunning \{guitar_jam_playback_recording}
		GetSongTimeMs
		Change song_preview_curr_song_time = <time>
		KillSpawnedScript \{Name = guitar_jam_playback_recording}
		KillSpawnedScript \{Name = guitar_jam_drum_playback}
	elseif ScriptIsRunning \{guitar_jam_drum_playback}
		GetSongTimeMs
		Change song_preview_curr_song_time = <time>
		KillSpawnedScript \{Name = guitar_jam_playback_recording}
		KillSpawnedScript \{Name = guitar_jam_drum_playback}
	endif
	stopsound unique_id = ($jam_input_current_chord) fade_type = linear fade_time = $jam_fade_time
	stopsound unique_id = ($jam_input_current_lead) fade_type = log_fast fade_time = 0.3
	stopsound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = $jam_fade_time
	stopsound unique_id = ($jam_input_current_melody) fade_type = linear fade_time = $jam_fade_time
endscript

script ui_jam_mixer_back 
	if (<from_adv> = 1)
		create_loading_screen \{Wait}
		generic_event_back data = {editing = 1 ghmix_persistant_settings = <ghmix_persistant_settings>}
	else
		create_loading_screen \{Wait}
		generic_event_back
	endif
endscript
