audio_settings_menu_font = text_a6
audio_settings_editing = band
aom_menu_pos = (440.0, 90.0)
as_pointer_pos = [
	(209.0, 110.0)
	(209.0, 235.0)
	(209.0, 360.0)
	(209.0, 485.0)
]
as_pointer_index = 0
as_pointer_scale = 1
as_is_popup = 0
as_ping_index = 0
audio_settings_locked = 0

script create_audio_settings_menu \{popup = 0}
	exclusive_params = {}
	createscreenelement \{type = containerelement
		parent = root_window
		id = aom_container
		pos = (0.0, 0.0)}
	if (<popup> = 1)
		kill_start_key_binding
		z = 100
		change \{as_is_popup = 1}
		new_menu {
			scrollid = as_scroll
			vmenuid = as_vmenu
			menu_pos = (410.0, 280.0)
			exclusive_device = ($last_start_pressed_device)
			text_right
			spacing = 30
		}
		create_pause_menu_frame z = (<z> - 10)
		change \{menu_focus_color = [
				254
				204
				55
				255
			]}
		change \{menu_unfocus_color = [
				182
				182
				182
				255
			]}
		text_params = {
			parent = as_vmenu
			type = textelement
			font = text_a6
			rgba = ($menu_unfocus_color)
			z_priority = <z>
			scale = 0.7
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
		}
		createscreenelement {
			type = spriteelement
			parent = aom_container
			texture = menu_pause_frame_banner
			pos = (640.0, 540.0)
			just = [center center]
			z_priority = (<z> + 100)
		}
		createscreenelement {
			type = textelement
			parent = <id>
			text = 'AUDIO'
			font = text_a6
			pos = (125.0, 47.0)
			rgba = [170 90 30 255]
			scale = (0.75, 0.75)
		}
		if NOT issingleplayergame
			formattext textname = player_paused_text 'PLAYER %d PAUSED. ONLY PLAYER %d OPTIONS ARE AVAILABLE.' d = (($last_start_pressed_device) + 1)
			displaysprite {
				parent = pause_menu_frame_container
				id = pause_helper_text_bg
				tex = control_pill_body
				pos = (640.0, 600.0)
				just = [center center]
				rgba = [96 0 0 255]
				z = (<z> + 10)
			}
			displaytext {
				parent = pause_menu_frame_container
				pos = (640.0, 604.0)
				just = [center center]
				text = <player_paused_text>
				rgba = [186 105 0 255]
				scale = (0.45000002, 0.6)
				z = (<z> + 11)
				font = text_a6
			}
			getscreenelementdims id = <id>
			bg_dims = (<width> * (1.0, 0.0) + (0.0, 32.0))
			pause_helper_text_bg :setprops dims = <bg_dims>
			displaysprite {
				parent = pause_menu_frame_container
				tex = control_pill_end
				pos = ((640.0, 600.0) - <width> * (0.5, 0.0))
				rgba = [96 0 0 255]
				just = [right center]
				flip_v
				z = (<z> + 10)
			}
			displaysprite {
				parent = pause_menu_frame_container
				tex = control_pill_end
				pos = ((640.0, 600.0) + <width> * (0.5, 0.0))
				rgba = [96 0 0 255]
				just = [left center]
				z = (<z> + 10)
			}
		endif
		displaysprite \{parent = aom_container
			tex = options_audio_knob
			pos = (725.0, 295.0)
			just = [
				center
				center
			]
			dims = (96.0, 96.0)
			rgba = [
				150
				150
				150
				255
			]
			z = 150}
		displaysprite \{parent = aom_container
			tex = options_audio_knob
			pos = (825.0, 365.0)
			just = [
				center
				center
			]
			dims = (96.0, 96.0)
			rgba = [
				150
				150
				150
				255
			]
			z = 150}
		displaysprite \{parent = aom_container
			tex = options_audio_knob
			pos = (725.0, 440.0)
			just = [
				center
				center
			]
			dims = (96.0, 96.0)
			rgba = [
				150
				150
				150
				255
			]
			z = 150}
		displaysprite \{parent = aom_container
			id = aom_knob_line_1
			tex = options_audio_knob_line
			pos = (725.0, 295.0)
			dims = (48.0, 12.0)
			z = 151
			rgba = [
				230
				190
				70
				255
			]
			just = [
				1.0
				0.0
			]}
		displaysprite \{parent = aom_container
			id = aom_knob_line_2
			tex = options_audio_knob_line
			pos = (825.0, 365.0)
			dims = (48.0, 12.0)
			z = 151
			rgba = [
				230
				190
				70
				255
			]
			just = [
				1.0
				0.0
			]}
		displaysprite \{parent = aom_container
			id = aom_knob_line_3
			tex = options_audio_knob_line
			pos = (725.0, 440.0)
			dims = (48.0, 12.0)
			z = 151
			rgba = [
				230
				190
				70
				255
			]
			just = [
				1.0
				0.0
			]}
	else
		change \{as_is_popup = 0}
		spacing = 83
		new_menu scrollid = as_scroll vmenuid = as_vmenu spacing = <spacing> menu_pos = ($aom_menu_pos + (110.0, 0.0)) exclusive_device = ($primary_controller) text_left
		create_menu_backdrop \{texture = venue_bg}
		create_menu_backdrop \{texture = venue_bg}
		set_focus_color \{rgba = [
				230
				190
				70
				255
			]}
		set_unfocus_color \{rgba = [
				150
				150
				150
				255
			]}
		displaysprite \{parent = aom_container
			tex = options_audio_poster
			pos = (340.0, 40.0)
			dims = (672.0, 672.0)}
		displaysprite \{parent = aom_container
			tex = tape_h_01
			pos = (300.0, 40.0)
			dims = (192.0, 96.0)
			z = 10
			rot_angle = -20}
		displaysprite \{parent = aom_container
			tex = tape_h_01
			rgba = [
				0
				0
				0
				128
			]
			pos = (300.0, 48.0)
			dims = (192.0, 96.0)
			z = 10
			rot_angle = -20}
		displaysprite \{parent = aom_container
			tex = tape_v_01
			pos = (870.0, 550.0)
			dims = (96.0, 192.0)
			z = 10
			rot_angle = 16}
		displaysprite \{parent = aom_container
			tex = tape_v_01
			rgba = [
				0
				0
				0
				128
			]
			pos = (875.0, 551.0)
			dims = (96.0, 192.0)
			z = 10
			rot_angle = 16}
		displaysprite parent = aom_container tex = options_audio_knob pos = ($aom_menu_pos + (0.0, 0.0)) dims = (96.0, 96.0) rgba = [150 150 150 255] z = 9
		displaysprite parent = aom_container tex = options_audio_knob pos = ($aom_menu_pos + (0.0, 125.0)) dims = (96.0, 96.0) rgba = [150 150 150 255] z = 9
		displaysprite parent = aom_container tex = options_audio_knob pos = ($aom_menu_pos + (0.0, 250.0)) dims = (96.0, 96.0) rgba = [150 150 150 255] z = 9
		if NOT isngc
			displaysprite parent = aom_container tex = options_audio_knob pos = ($aom_menu_pos + (0.0, 375.0)) dims = (96.0, 96.0) rgba = [150 150 150 255] z = 9
		endif
		displaysprite \{parent = aom_container
			id = aom_belly_strings
			tex = options_audio_bellystrings
			pos = (744.0, 146.0)
			dims = (74.0, 318.0)
			z = 10}
		displaysprite parent = aom_container id = aom_pointer tex = options_audio_pointer_v2 pos = ($as_pointer_pos [0]) dims = (256.0, 128.0) relative_scale z = 11
		displaysprite parent = aom_container id = aom_knob_line_1 tex = options_audio_knob_line pos = ($aom_menu_pos + (48.0, 44.0)) dims = (48.0, 12.0) z = 10 rgba = [230 190 70 255] just = [1.0 0.0]
		displaysprite parent = aom_container id = aom_knob_line_2 tex = options_audio_knob_line pos = ($aom_menu_pos + (48.0, 169.0)) dims = (48.0, 12.0) z = 10 rgba = [230 190 70 255] just = [1.0 0.0]
		displaysprite parent = aom_container id = aom_knob_line_3 tex = options_audio_knob_line pos = ($aom_menu_pos + (48.0, 294.0)) dims = (48.0, 12.0) z = 10 rgba = [230 190 70 255] just = [1.0 0.0]
		if NOT isngc
			displaysprite parent = aom_container id = 0x14a4950b tex = options_audio_knob_line pos = ($aom_menu_pos + (48.0, 419.0)) dims = (48.0, 12.0) z = 10 rgba = [230 190 70 255] just = [1.0 0.0]
		endif
		getscreenelementprops id = <id>
		text_params = {parent = as_vmenu type = textelement font = ($audio_settings_menu_font) rgba = ($menu_unfocus_color)}
	endif
	i = 0
	begin
	formattext checksumname = ping_id 'aom_ping_%d' d = <i>
	displaysprite parent = aom_container id = <ping_id> tex = options_audio_ping alpha = 0 scale = 1 z = 180 just = [center center]
	<i> = (<i> + 1)
	repeat 11
	getglobaltags \{user_options}
	formattext textname = band_volume_text '%d' d = <band_volume>
	if (<popup>)
		formattext textname = text 'BAND: %d' d = <band_volume>
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		displaysprite \{parent = pause_menu_frame_container
			tex = newspaper_circle
			rgba = [
				0
				0
				0
				255
			]
			pos = (632.0, 301.0)
			dims = (68.0, 68.0)
			just = [
				center
				center
			]
			z = 200}
		displaysprite \{parent = pause_menu_frame_container
			id = band_yeller
			tex = newspaper_circle
			rgba = [
				0
				0
				0
				255
			]
			pos = (632.0, 301.0)
			dims = (54.0, 54.0)
			just = [
				center
				center
			]
			z = 201}
		displaytext {
			parent = pause_menu_frame_container
			id = band_volume_text_id
			pos = (633.0, 298.0)
			just = [center center]
			rgba = ($menu_unfocus_color)
			z = 202
			scale = 1
			font = text_a6
			text = <band_volume_text>
			noshadow
		}
	else
		text = 'BAND'
		displaytext parent = aom_container id = band_volume_id text = <band_volume_text> pos = ($aom_menu_pos + (110.0, 50.0)) z = 9
		<exclusive_params> = {exclusive_device = ($primary_controller)}
	endif
	setscreenelementprops id = aom_knob_line_1 rot_angle = ((<band_volume> / 11.0) * 180.0)
	createscreenelement {
		<text_params>
		text = 'BAND'
		id = as_band
		pos = (600.0, 32.0)
		scale = 1
		event_handlers = [
			{focus menu_audio_settings_focus params = {editing = band}}
			{unfocus menu_audio_settings_unfocus params = {editing = band}}
			{pad_choose menu_audio_settings_lock_selection}
			{pad_back menu_audio_settings_press_back}
		]
		<exclusive_params>
	}
	formattext textname = guitar_volume_text '%d' d = <guitar_volume>
	if (<popup>)
		formattext textname = text 'GUITAR: %d' d = <guitar_volume>
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		displaysprite \{parent = pause_menu_frame_container
			tex = hud_score_nixie_2a
			rgba = [
				0
				0
				0
				255
			]
			pos = (632.0, 370.0)
			dims = (68.0, 68.0)
			just = [
				center
				center
			]
			z = 200}
		displaysprite \{parent = pause_menu_frame_container
			id = guitar_yeller
			tex = newspaper_circle
			rgba = [
				0
				0
				0
				255
			]
			pos = (632.0, 370.0)
			dims = (54.0, 54.0)
			just = [
				center
				center
			]
			z = 201}
		displaytext {
			parent = pause_menu_frame_container
			id = guitar_volume_text_id
			pos = (633.0, 368.0)
			just = [center center]
			rgba = ($menu_unfocus_color)
			z = 202
			scale = 1
			font = text_a6
			noshadow
			text = <guitar_volume_text>
		}
	else
		displaytext parent = aom_container id = guitar_volume_id text = <guitar_volume_text> pos = ($aom_menu_pos + (110.0, 175.0)) z = 9
		<exclusive_params> = {exclusive_device = ($primary_controller)}
	endif
	setscreenelementprops id = aom_knob_line_2 rot_angle = ((<guitar_volume> / 11.0) * 180.0)
	createscreenelement {
		<text_params>
		text = 'GUITAR'
		id = as_guitar
		scale = 1
		event_handlers = [
			{focus menu_audio_settings_focus params = {editing = guitar}}
			{unfocus menu_audio_settings_unfocus params = {editing = guitar}}
			{pad_choose menu_audio_settings_lock_selection}
			{pad_back menu_audio_settings_press_back}
		]
		<exclusive_params>
	}
	formattext textname = sfx_volume_text '%d' d = <sfx_volume>
	if (<popup>)
		formattext textname = text 'FX: %d' d = <sfx_volume>
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		displaysprite \{parent = pause_menu_frame_container
			tex = hud_score_nixie_2a
			rgba = [
				0
				0
				0
				255
			]
			pos = (632.0, 442.0)
			dims = (68.0, 68.0)
			just = [
				center
				center
			]
			z = 200}
		displaysprite \{parent = pause_menu_frame_container
			id = fx_yeller
			tex = newspaper_circle
			rgba = [
				0
				0
				0
				255
			]
			pos = (632.0, 442.0)
			dims = (54.0, 54.0)
			just = [
				center
				center
			]
			z = 201}
		displaytext {
			parent = pause_menu_frame_container
			id = fx_volume_text_id
			pos = (633.0, 439.0)
			just = [center center]
			rgba = ($menu_unfocus_color)
			z = 202
			scale = 1
			font = text_a6
			text = <sfx_volume_text>
			noshadow
		}
	else
		displaytext parent = aom_container id = sfx_volume_id text = <sfx_volume_text> pos = ($aom_menu_pos + (110.0, 300.0)) z = 9
		<exclusive_params> = {exclusive_device = ($primary_controller)}
	endif
	setscreenelementprops id = aom_knob_line_3 rot_angle = ((<sfx_volume> / 11.0) * 180.0)
	createscreenelement {
		<text_params>
		text = 'FX'
		id = as_sfx
		scale = 1
		event_handlers = [
			{focus menu_audio_settings_focus params = {editing = sfx}}
			{unfocus menu_audio_settings_unfocus params = {editing = sfx}}
			{pad_choose menu_audio_settings_lock_selection}
			{pad_back menu_audio_settings_press_back}
		]
		<exclusive_params>
	}
	if NOT isngc
		if NOT (<popup> = 1)
			createscreenelement {
				<text_params>
				id = 0xba4210df
				event_handlers = [
					{focus menu_audio_settings_focus params = {editing = stereo}}
					{unfocus menu_audio_settings_unfocus params = {editing = stereo}}
					{pad_choose 0x5d458122}
				]
				<exclusive_params>
			}
			0xdfb9dcba = 'STEREO'
			0xc564c6a3 = 'MONO'
			getlanguage
			switch <language>
				case language_french
				0xdfb9dcba = 'STÉRÉO'
				case language_spanish
				0xdfb9dcba = 'ESTÉREO'
			endswitch
			displaytext parent = aom_container id = 0x184b7c83 text = <0xdfb9dcba> pos = ($aom_menu_pos + (110.0, 380.0)) z = 9
			displaytext parent = aom_container id = 0xc5e84762 text = <0xc564c6a3> pos = ($aom_menu_pos + (110.0, 435.0)) z = 9
			if (<ps2_stereo_sound> = 1)
				setscreenelementprops id = 0x14a4950b rot_angle = (150)
			else
				setscreenelementprops id = 0x14a4950b rot_angle = (210)
			endif
		endif
	endif
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'BACK'
		button = red
		z = 100}
	add_user_control_helper \{text = 'UP/DOWN'
		button = strumbar
		z = 100}
endscript

script destroy_audio_settings_menu 
	clean_up_user_control_helpers
	change \{audio_settings_locked = 0}
	change \{as_pointer_index = 0}
	destroy_menu \{menu_id = aom_container}
	destroy_menu \{menu_id = as_scroll}
	destroy_menu \{menu_id = as_highlight_sprite}
	destroy_menu_backdrop
	destroy_pause_menu_frame
endscript

script menu_audio_settings_focus 
	retail_menu_focus
	change audio_settings_editing = <editing>
	getglobaltags \{user_options}
	last_index = $as_pointer_index
	switch (<editing>)
		case band
		change \{as_pointer_index = 0}
		if ($as_is_popup)
			setscreenelementprops id = band_yeller rgba = ($menu_focus_color)
			setscreenelementprops \{id = band_volume_text_id
				rgba = [
					0
					0
					0
					255
				]}
		endif
		case guitar
		change \{as_pointer_index = 1}
		if ($as_is_popup)
			setscreenelementprops id = guitar_yeller rgba = ($menu_focus_color)
			setscreenelementprops \{id = guitar_volume_text_id
				rgba = [
					0
					0
					0
					255
				]}
		endif
		case sfx
		change \{as_pointer_index = 2}
		if ($as_is_popup)
			setscreenelementprops id = fx_yeller rgba = ($menu_focus_color)
			setscreenelementprops \{id = fx_volume_text_id
				rgba = [
					0
					0
					0
					255
				]}
		endif
		case stereo
		change \{as_pointer_index = 3}
		if ($as_is_popup)
			if (<ps2_stereo_sound> = 1)
				setscreenelementprops \{id = 0x184b7c83
					rgba = [
						0
						0
						0
						255
					]}
			else
				setscreenelementprops \{id = 0xc5e84762
					rgba = [
						0
						0
						0
						255
					]}
			endif
		endif
	endswitch
	aom_hilite_knob
	if NOT ($as_is_popup)
		aom_move_pointer last_index = <last_index>
	endif
endscript

script menu_audio_settings_unfocus 
	retail_menu_unfocus
	if ($as_is_popup)
		switch (<editing>)
			case band
			setscreenelementprops \{id = band_yeller
				rgba = [
					0
					0
					0
					255
				]}
			setscreenelementprops id = band_volume_text_id rgba = ($menu_unfocus_color)
			case guitar
			setscreenelementprops \{id = guitar_yeller
				rgba = [
					0
					0
					0
					255
				]}
			setscreenelementprops id = guitar_volume_text_id rgba = ($menu_unfocus_color)
			case sfx
			setscreenelementprops \{id = fx_yeller
				rgba = [
					0
					0
					0
					255
				]}
			setscreenelementprops id = fx_volume_text_id rgba = ($menu_unfocus_color)
			case stereo
			setscreenelementprops id = 0x184b7c83 rgba = ($menu_unfocus_color)
			setscreenelementprops id = 0xc5e84762 rgba = ($menu_unfocus_color)
		endswitch
	endif
endscript

script menu_audio_settings_lock_selection 
	if NOT ($audio_settings_locked)
		soundevent \{event = ui_sfx_select}
	endif
	gettags
	launchevent \{type = unfocus
		target = as_vmenu}
	waitonegameframe
	launchevent type = focus target = <id>
	setscreenelementprops {
		id = <id>
		event_handlers = [
			{pad_up menu_audio_settings_increase_volume_guitar_check}
			{pad_down menu_audio_settings_lower_volume_guitar_check}
		]
		replace_handlers
	}
	menu_audio_settings_highlight_item
	change \{audio_settings_locked = 1}
endscript

script menu_audio_settings_press_back 
	soundevent \{event = generic_menu_back_sfx}
	gettags
	launchevent type = unfocus target = <id>
	waitonegameframe
	launchevent \{type = focus
		target = as_vmenu}
	setscreenelementprops {
		id = <id>
		event_handlers = [
			{pad_up null_script}
			{pad_down null_script}
		]
		replace_handlers
	}
	menu_audio_settings_remove_highlight
	change \{audio_settings_locked = 0}
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

script menu_audio_settings_lower_selection_volume 
	getglobaltags \{user_options}
	switch ($audio_settings_editing)
		case band
		changespinaltapvolume spinal_tap_volume = <band_volume> change = -1
		setglobaltags user_options params = {band_volume = <volume>}
		if ($as_is_popup)
			formattext textname = text '%d' d = <volume>
			setscreenelementprops id = band_volume_text_id text = <text>
		else
			formattext textname = text '%d' d = <volume>
			setscreenelementprops id = band_volume_id text = <text>
		endif
		setscreenelementprops id = aom_knob_line_1 rot_angle = ((<volume> / 11.0) * 180.0)
		menu_audio_settings_update_band_volume vol = <volume>
		if NOT (<band_volume> = <volume>)
			do_ping = 1
			menu_audio_settings_band_volume_sound \{popup = $as_is_popup}
		else
			do_ping = 0
		endif
		case guitar
		changespinaltapvolume spinal_tap_volume = <guitar_volume> change = -1
		setglobaltags user_options params = {guitar_volume = <volume>}
		if ($as_is_popup)
			formattext textname = text '%d' d = <volume>
			setscreenelementprops id = guitar_volume_text_id text = <text>
		else
			formattext textname = text '%d' d = <volume>
			setscreenelementprops id = guitar_volume_id text = <text>
		endif
		setscreenelementprops id = aom_knob_line_2 rot_angle = ((<volume> / 11.0) * 180.0)
		menu_audio_settings_update_guitar_volume vol = <volume>
		if NOT (<guitar_volume> = <volume>)
			do_ping = 1
			menu_audio_settings_guitar_volume_sound \{popup = $as_is_popup}
		else
			do_ping = 0
		endif
		case sfx
		changespinaltapvolume spinal_tap_volume = <sfx_volume> change = -1
		setglobaltags user_options params = {sfx_volume = <volume>}
		if ($as_is_popup)
			formattext textname = text '%d' d = <volume>
			setscreenelementprops id = fx_volume_text_id text = <text>
		else
			formattext textname = text '%d' d = <volume>
			setscreenelementprops id = sfx_volume_id text = <text>
		endif
		setscreenelementprops id = aom_knob_line_3 rot_angle = ((<volume> / 11.0) * 180.0)
		menu_audio_settings_update_sfx_volume vol = <volume>
		if NOT (<sfx_volume> = <volume>)
			do_ping = 1
			menu_audio_settings_fx_volume_sound \{popup = $as_is_popup}
		else
			do_ping = 0
		endif
		case stereo
		do_ping = 0
	endswitch
	if (<do_ping>)
		formattext \{checksumname = ping_id
			'aom_ping_%d'
			d = $as_ping_index}
		change as_ping_index = ($as_ping_index + 1)
		if ($as_ping_index > 10)
			change \{as_ping_index = 0}
		endif
		runscriptonscreenelement id = <ping_id> aom_spawn_ping
	endif
endscript

script menu_audio_settings_increase_selection_volume 
	getglobaltags \{user_options}
	switch ($audio_settings_editing)
		case band
		changespinaltapvolume spinal_tap_volume = <band_volume> change = 1
		setglobaltags user_options params = {band_volume = <volume>}
		if ($as_is_popup)
			formattext textname = text '%d' d = <volume>
			setscreenelementprops id = band_volume_text_id text = <text>
		else
			formattext textname = text '%d' d = <volume>
			setscreenelementprops id = band_volume_id text = <text>
		endif
		setscreenelementprops id = aom_knob_line_1 rot_angle = ((<volume> / 11.0) * 180.0)
		menu_audio_settings_update_band_volume vol = <volume>
		if NOT (<band_volume> = <volume>)
			do_ping = 1
			menu_audio_settings_band_volume_sound \{popup = $as_is_popup}
		else
			do_ping = 0
		endif
		case guitar
		changespinaltapvolume spinal_tap_volume = <guitar_volume> change = 1
		setglobaltags user_options params = {guitar_volume = <volume>}
		if ($as_is_popup)
			formattext textname = text '%d' d = <volume>
			setscreenelementprops id = guitar_volume_text_id text = <text>
		else
			formattext textname = text '%d' d = <volume>
			setscreenelementprops id = guitar_volume_id text = <text>
		endif
		setscreenelementprops id = aom_knob_line_2 rot_angle = ((<volume> / 11.0) * 180.0)
		menu_audio_settings_update_guitar_volume vol = <volume>
		if NOT (<guitar_volume> = <volume>)
			do_ping = 1
			menu_audio_settings_guitar_volume_sound \{popup = $as_is_popup}
		else
			do_ping = 0
		endif
		case sfx
		changespinaltapvolume spinal_tap_volume = <sfx_volume> change = 1
		setglobaltags user_options params = {sfx_volume = <volume>}
		if ($as_is_popup)
			formattext textname = text '%d' d = <volume>
			setscreenelementprops id = fx_volume_text_id text = <text>
		else
			formattext textname = text '%d' d = <volume>
			setscreenelementprops id = sfx_volume_id text = <text>
		endif
		setscreenelementprops id = aom_knob_line_3 rot_angle = ((<volume> / 11.0) * 180.0)
		menu_audio_settings_update_sfx_volume vol = <volume>
		if NOT (<sfx_volume> = <volume>)
			do_ping = 1
			menu_audio_settings_fx_volume_sound \{popup = $as_is_popup}
		else
			do_ping = 0
		endif
		case stereo
		do_ping = 0
	endswitch
	if (<do_ping>)
		formattext \{checksumname = ping_id
			'aom_ping_%d'
			d = $as_ping_index}
		change as_ping_index = ($as_ping_index + 1)
		if ($as_ping_index > 10)
			change \{as_ping_index = 0}
		endif
		runscriptonscreenelement id = <ping_id> aom_spawn_ping
	endif
endscript

script menu_audio_settings_increase_volume_guitar_check 
	if isguitarcontroller controller = <device_num>
		menu_audio_settings_lower_selection_volume
	else
		menu_audio_settings_increase_selection_volume
	endif
endscript

script menu_audio_settings_lower_volume_guitar_check 
	if isguitarcontroller controller = <device_num>
		menu_audio_settings_increase_selection_volume
	else
		menu_audio_settings_lower_selection_volume
	endif
endscript

script menu_audio_settings_highlight_item 
	if NOT screenelementexists \{id = as_highlight_sprite}
		gettags
		getscreenelementdims id = <id>
		getscreenelementposition id = <id> absolute
		if ($as_is_popup = 0)
			<highlight_pos> = (<screenelementpos> + (-0.05, 0.0) * <width> + (0.0, 0.05) * <height>)
			<highlight_dims> = ((1.1, 0.0) * <width> + (0.0, 1.05) * <height>)
		else
			<highlight_pos> = (<screenelementpos> + (-5.0, -3.0))
			<highlight_dims> = ((1.0, 0.0) * <width> + (0.0, 1.0) * <height> + (12.0, 0.0))
		endif
		createscreenelement {
			type = spriteelement
			parent = root_window
			id = as_highlight_sprite
			pos = <highlight_pos>
			dims = <highlight_dims>
			rgba = [210 130 0 125]
			just = [left top]
			z_priority = 99
		}
	endif
endscript

script menu_audio_settings_remove_highlight 
	if screenelementexists \{id = as_highlight_sprite}
		destroyscreenelement \{id = as_highlight_sprite}
	endif
endscript

script menu_audio_settings_get_buss_volume 
	switch <volume>
		case 11
		<vol> = 0
		case 10
		<vol> = -1.2
		case 9
		<vol> = -2.4
		case 8
		<vol> = -3.7
		case 7
		<vol> = -4.9
		case 6
		<vol> = -6.2
		case 5
		<vol> = -8
		case 4
		<vol> = -10
		case 3
		<vol> = -13
		case 2
		<vol> = -17
		case 1
		<vol> = -21
		case 0
		<vol> = -100
	endswitch
	return vol = <vol>
endscript

script menu_audio_settings_update_guitar_volume \{vol = 11}
	menu_audio_settings_get_buss_volume volume = <vol>
	soundbussunlock \{user_guitar}
	setsoundbussparams {user_guitar = {vol = <vol>}}
	soundbusslock \{user_guitar}
endscript

script menu_audio_settings_update_band_volume \{vol = 11}
	0xf6082043 vol = <vol>
	change 0xfbaf57a3 = ((<vol> / 11.0))
	menu_audio_settings_get_buss_volume volume = <vol>
	soundbussunlock \{user_band}
	setsoundbussparams {user_band = {vol = <vol>}}
	soundbusslock \{user_band}
endscript

script menu_audio_settings_update_sfx_volume \{vol = 11}

	0xc9863983 vol = <vol>
	menu_audio_settings_get_buss_volume volume = <vol>

	soundbussunlock \{user_sfx}

	setsoundbussparams {user_sfx = {vol = <vol>}}
	soundbusslock \{user_sfx}
endscript

script aom_move_pointer 
	if NOT ($as_pointer_index = <last_index>)
		if (<last_index> < $as_pointer_index)
			middle_pos = (($as_pointer_pos [$as_pointer_index]) + (-80.0, 85.0))
		else
			middle_pos = (($as_pointer_pos [$as_pointer_index]) + (-80.0, -85.0))
		endif
		doscreenelementmorph id = aom_pointer pos = <middle_pos> scale = ($as_pointer_scale / 2.0) time = 0.1 relative_scale
		wait \{0.1
			seconds}
		doscreenelementmorph id = aom_pointer pos = ($as_pointer_pos [$as_pointer_index]) scale = $as_pointer_scale time = 0.1 relative_scale
		wait \{0.1
			seconds}
		<last_index> = $as_pointer_index
	endif
endscript

script aom_hilite_knob 
	getglobaltags \{user_options}
	switch ($as_pointer_index)
		case 0
		setscreenelementprops \{id = aom_knob_line_1
			rgba = [
				230
				190
				70
				255
			]}
		if NOT ($as_is_popup)
			setscreenelementprops \{id = band_volume_id
				rgba = [
					230
					190
					70
					255
				]}
		endif
		setscreenelementprops \{id = aom_knob_line_2
			rgba = [
				150
				150
				150
				255
			]}
		setscreenelementprops \{id = aom_knob_line_3
			rgba = [
				150
				150
				150
				255
			]}
		if NOT ($as_is_popup)
			if NOT isngc
				setscreenelementprops \{id = 0x14a4950b
					rgba = [
						150
						150
						150
						255
					]}
				setscreenelementprops \{id = 0x184b7c83
					rgba = [
						150
						150
						150
						255
					]}
				setscreenelementprops \{id = 0xc5e84762
					rgba = [
						150
						150
						150
						255
					]}
			endif
			setscreenelementprops \{id = guitar_volume_id
				rgba = [
					150
					150
					150
					255
				]}
			setscreenelementprops \{id = sfx_volume_id
				rgba = [
					150
					150
					150
					255
				]}
		endif
		case 1
		setscreenelementprops \{id = aom_knob_line_2
			rgba = [
				230
				190
				70
				255
			]}
		if NOT ($as_is_popup)
			setscreenelementprops \{id = guitar_volume_id
				rgba = [
					230
					190
					70
					255
				]}
		endif
		setscreenelementprops \{id = aom_knob_line_1
			rgba = [
				150
				150
				150
				255
			]}
		setscreenelementprops \{id = aom_knob_line_3
			rgba = [
				150
				150
				150
				255
			]}
		if NOT ($as_is_popup)
			if NOT isngc
				setscreenelementprops \{id = 0x14a4950b
					rgba = [
						150
						150
						150
						255
					]}
				setscreenelementprops \{id = 0x184b7c83
					rgba = [
						150
						150
						150
						255
					]}
				setscreenelementprops \{id = 0xc5e84762
					rgba = [
						150
						150
						150
						255
					]}
			endif
			setscreenelementprops \{id = band_volume_id
				rgba = [
					150
					150
					150
					255
				]}
			setscreenelementprops \{id = sfx_volume_id
				rgba = [
					150
					150
					150
					255
				]}
		endif
		case 2
		setscreenelementprops \{id = aom_knob_line_3
			rgba = [
				230
				190
				70
				255
			]}
		if NOT ($as_is_popup)
			setscreenelementprops \{id = sfx_volume_id
				rgba = [
					230
					190
					70
					255
				]}
		endif
		setscreenelementprops \{id = aom_knob_line_1
			rgba = [
				150
				150
				150
				255
			]}
		setscreenelementprops \{id = aom_knob_line_2
			rgba = [
				150
				150
				150
				255
			]}
		if NOT ($as_is_popup)
			if NOT isngc
				setscreenelementprops \{id = 0x14a4950b
					rgba = [
						150
						150
						150
						255
					]}
				setscreenelementprops \{id = 0x184b7c83
					rgba = [
						150
						150
						150
						255
					]}
				setscreenelementprops \{id = 0xc5e84762
					rgba = [
						150
						150
						150
						255
					]}
			endif
			setscreenelementprops \{id = band_volume_id
				rgba = [
					150
					150
					150
					255
				]}
			setscreenelementprops \{id = guitar_volume_id
				rgba = [
					150
					150
					150
					255
				]}
		endif
		case 3
		if NOT isngc
			setscreenelementprops \{id = 0x14a4950b
				rgba = [
					230
					190
					70
					255
				]}
			if NOT ($as_is_popup)
				if (<ps2_stereo_sound> = 1)
					setscreenelementprops \{id = 0x184b7c83
						rgba = [
							230
							190
							70
							255
						]}
				else
					setscreenelementprops \{id = 0xc5e84762
						rgba = [
							230
							190
							70
							255
						]}
				endif
			endif
		endif
		setscreenelementprops \{id = aom_knob_line_1
			rgba = [
				150
				150
				150
				255
			]}
		setscreenelementprops \{id = aom_knob_line_2
			rgba = [
				150
				150
				150
				255
			]}
		setscreenelementprops \{id = aom_knob_line_3
			rgba = [
				150
				150
				150
				255
			]}
		if NOT ($as_is_popup)
			setscreenelementprops \{id = guitar_volume_id
				rgba = [
					150
					150
					150
					255
				]}
			setscreenelementprops \{id = band_volume_id
				rgba = [
					150
					150
					150
					255
				]}
			setscreenelementprops \{id = sfx_volume_id
				rgba = [
					150
					150
					150
					255
				]}
		endif
	endswitch
endscript

script aom_spawn_ping \{time = 0.25}
	gettags
	if NOT ($as_is_popup)
		switch ($audio_settings_editing)
			case band
			pos = ($aom_menu_pos + (125.0, 71.0))
			case guitar
			pos = ($aom_menu_pos + (125.0, 196.0))
			case sfx
			pos = ($aom_menu_pos + (125.0, 321.0))
		endswitch
	else
		switch ($audio_settings_editing)
			case band
			pos = (725.0, 295.0)
			case guitar
			pos = (825.0, 365.0)
			case sfx
			pos = (725.0, 440.0)
		endswitch
	endif
	<id> :domorph scale = 1 pos = <pos> alpha = 1
	<id> :domorph scale = 5 alpha = 0 time = <time>
	if NOT ($as_is_popup)
		<center_belly_pos> = (744.0, 146.0)
		<left_belly_pos> = (724.0, 146.0)
		<right_belly_pos> = (764.0, 146.0)
		<jiggle_time> = 0.05
		begin
		doscreenelementmorph id = aom_belly_strings pos = <left_belly_pos> time = <jiggle_time>
		wait <jiggle_time> seconds
		doscreenelementmorph id = aom_belly_strings pos = <center_belly_pos> time = <jiggle_time>
		wait <jiggle_time> seconds
		doscreenelementmorph id = aom_belly_strings pos = <right_belly_pos> time = <jiggle_time>
		wait <jiggle_time> seconds
		doscreenelementmorph id = aom_belly_strings pos = <center_belly_pos> time = <jiggle_time>
		<left_belly_pos> = (<left_belly_pos> + (3.33, 0.0))
		<right_belly_pos> = (<right_belly_pos> + (-3.33, 0.0))
		repeat 6
	endif
endscript

script 0x5d458122 
	getglobaltags \{user_options}
	if (<ps2_stereo_sound> = 1)
		setscreenelementprops \{id = 0x184b7c83
			rgba = [
				150
				150
				150
				255
			]}
		setscreenelementprops \{id = 0xc5e84762
			rgba = [
				230
				190
				70
				255
			]}
		setscreenelementprops id = 0x14a4950b rot_angle = (210)
		setglobaltags \{user_options
			params = {
				ps2_stereo_sound = 0
			}}
		0xf2b96a22 \{0}
	else
		setscreenelementprops \{id = 0xc5e84762
			rgba = [
				150
				150
				150
				255
			]}
		setscreenelementprops \{id = 0x184b7c83
			rgba = [
				230
				190
				70
				255
			]}
		setscreenelementprops id = 0x14a4950b rot_angle = (150)
		setglobaltags \{user_options
			params = {
				ps2_stereo_sound = 1
			}}
		0xf2b96a22 \{1}
	endif
	0xf6082043 vol = <band_volume>
	soundevent \{event = ui_sfx_select}
endscript
