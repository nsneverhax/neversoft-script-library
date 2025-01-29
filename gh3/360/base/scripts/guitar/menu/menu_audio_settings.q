audio_settings_menu_font = fontgrid_title_gh3
audio_settings_editing = band
aom_menu_pos = (480.0, 100.0)
as_pointer_pos = [
	(264.0, 160.0)
	(264.0, 330.0)
	(264.0, 500.0)
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
			menu_pos = (420.0, 280.0)
			exclusive_device = ($last_start_pressed_device)
			text_right
			spacing = 40
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
			text = "AUDIO"
			font = text_a6
			pos = (125.0, 53.0)
			rgba = [170 90 30 255]
			scale = 0.8
		}
		if NOT issingleplayergame
			formattext textname = player_paused_text "PLAYER %d PAUSED. ONLY PLAYER %d OPTIONS ARE AVAILABLE." d = (($last_start_pressed_device) + 1)
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
		spacing = 105
		new_menu scrollid = as_scroll vmenuid = as_vmenu spacing = <spacing> menu_pos = $aom_menu_pos exclusive_device = ($primary_controller)
		create_menu_backdrop \{texture = venue_bg}
		createscreenelement \{type = spriteelement
			parent = aom_container
			id = as_light_overlay
			texture = venue_overlay
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = 99}
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
			pos = (360.0, 40.0)
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
			pos = (360.0, 48.0)
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
		displaysprite parent = aom_container tex = options_audio_knob pos = ($aom_menu_pos + (15.0, 50.0)) dims = (96.0, 96.0) rgba = [150 150 150 255] z = 9
		displaysprite parent = aom_container tex = options_audio_knob pos = ($aom_menu_pos + (15.0, 219.0)) dims = (96.0, 96.0) rgba = [150 150 150 255] z = 9
		displaysprite parent = aom_container tex = options_audio_knob pos = ($aom_menu_pos + (15.0, 386.0)) dims = (96.0, 96.0) rgba = [150 150 150 255] z = 9
		displaysprite \{parent = aom_container
			id = aom_belly_strings
			tex = options_audio_bellystrings
			pos = (744.0, 146.0)
			dims = (74.0, 318.0)
			z = 10}
		displaysprite parent = aom_container id = aom_pointer tex = options_audio_pointer_v2 pos = ($as_pointer_pos [0]) dims = (256.0, 128.0) relative_scale z = 10
		displaysprite parent = aom_container id = aom_knob_line_1 tex = options_audio_knob_line pos = ($aom_menu_pos + (63.0, 94.0)) dims = (48.0, 12.0) z = 10 rgba = [230 190 70 255] just = [1.0 0.0]
		displaysprite parent = aom_container id = aom_knob_line_2 tex = options_audio_knob_line pos = ($aom_menu_pos + (63.0, 263.0)) dims = (48.0, 12.0) z = 10 rgba = [230 190 70 255] just = [1.0 0.0]
		displaysprite parent = aom_container id = aom_knob_line_3 tex = options_audio_knob_line pos = ($aom_menu_pos + (63.0, 430.0)) dims = (48.0, 12.0) z = 10 rgba = [230 190 70 255] just = [1.0 0.0]
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
	formattext textname = band_volume_text "%d" d = <band_volume>
	if (<popup>)
		formattext textname = text "BAND: %d" d = <band_volume>
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		displaysprite \{parent = pause_menu_frame_container
			tex = newspaper_circle
			rgba = [
				0
				0
				0
				255
			]
			pos = (615.0, 295.0)
			dims = (58.0, 58.0)
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
			pos = (615.0, 295.0)
			dims = (44.0, 44.0)
			just = [
				center
				center
			]
			z = 201}
		displaytext {
			parent = pause_menu_frame_container
			id = band_volume_text_id
			pos = (613.0, 298.0)
			just = [center center]
			rgba = ($menu_unfocus_color)
			z = 202
			scale = 0.8
			font = text_a6
			text = <band_volume_text>
			noshadow
		}
	else
		text = "BAND"
		displaytext parent = aom_container id = band_volume_id text = <band_volume_text> pos = ($aom_menu_pos + (130.0, 75.0)) z = 9
		<exclusive_params> = {exclusive_device = ($primary_controller)}
	endif
	setscreenelementprops id = aom_knob_line_1 rot_angle = ((<band_volume> / 11.0) * 180.0)
	createscreenelement {
		<text_params>
		text = "BAND"
		id = as_band
		pos = (600.0, 32.0)
		event_handlers = [
			{focus menu_audio_settings_focus params = {editing = band}}
			{unfocus menu_audio_settings_unfocus params = {editing = band}}
			{pad_choose menu_audio_settings_lock_selection}
			{pad_back menu_audio_settings_press_back}
			{pad_left menu_audio_settings_lower_selection_volume}
			{pad_right menu_audio_settings_increase_selection_volume}
		]
		<exclusive_params>
	}
	formattext textname = guitar_volume_text "%d" d = <guitar_volume>
	if (<popup>)
		formattext textname = text "GUITAR: %d" d = <guitar_volume>
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		displaysprite \{parent = pause_menu_frame_container
			tex = hud_score_nixie_2a
			rgba = [
				0
				0
				0
				255
			]
			pos = (615.0, 365.0)
			dims = (58.0, 58.0)
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
			pos = (615.0, 365.0)
			dims = (44.0, 44.0)
			just = [
				center
				center
			]
			z = 201}
		displaytext {
			parent = pause_menu_frame_container
			id = guitar_volume_text_id
			pos = (613.0, 368.0)
			just = [center center]
			rgba = ($menu_unfocus_color)
			z = 202
			scale = 0.8
			font = text_a6
			noshadow
			text = <guitar_volume_text>
		}
	else
		displaytext parent = aom_container id = guitar_volume_id text = <guitar_volume_text> pos = ($aom_menu_pos + (130.0, 243.0)) z = 9
		<exclusive_params> = {exclusive_device = ($primary_controller)}
	endif
	setscreenelementprops id = aom_knob_line_2 rot_angle = ((<guitar_volume> / 11.0) * 180.0)
	createscreenelement {
		<text_params>
		text = "GUITAR"
		id = as_guitar
		event_handlers = [
			{focus menu_audio_settings_focus params = {editing = guitar}}
			{unfocus menu_audio_settings_unfocus params = {editing = guitar}}
			{pad_choose menu_audio_settings_lock_selection}
			{pad_back menu_audio_settings_press_back}
			{pad_left menu_audio_settings_lower_selection_volume}
			{pad_right menu_audio_settings_increase_selection_volume}
		]
		<exclusive_params>
	}
	formattext textname = sfx_volume_text "%d" d = <sfx_volume>
	if (<popup>)
		formattext textname = text "FX: %d" d = <sfx_volume>
		<exclusive_params> = {exclusive_device = ($last_start_pressed_device)}
		displaysprite \{parent = pause_menu_frame_container
			tex = hud_score_nixie_2a
			rgba = [
				0
				0
				0
				255
			]
			pos = (615.0, 440.0)
			dims = (58.0, 58.0)
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
			pos = (615.0, 440.0)
			dims = (44.0, 44.0)
			just = [
				center
				center
			]
			z = 201}
		displaytext {
			parent = pause_menu_frame_container
			id = fx_volume_text_id
			pos = (613.0, 443.0)
			just = [center center]
			rgba = ($menu_unfocus_color)
			z = 202
			scale = 0.8
			font = text_a6
			text = <sfx_volume_text>
			noshadow
		}
	else
		displaytext parent = aom_container id = sfx_volume_id text = <sfx_volume_text> pos = ($aom_menu_pos + (130.0, 409.0)) z = 9
		<exclusive_params> = {exclusive_device = ($primary_controller)}
	endif
	setscreenelementprops id = aom_knob_line_3 rot_angle = ((<sfx_volume> / 11.0) * 180.0)
	createscreenelement {
		<text_params>
		text = "FX"
		id = as_sfx
		event_handlers = [
			{focus menu_audio_settings_focus params = {editing = sfx}}
			{unfocus menu_audio_settings_unfocus params = {editing = sfx}}
			{pad_choose menu_audio_settings_lock_selection}
			{pad_back menu_audio_settings_press_back}
			{pad_left menu_audio_settings_lower_selection_volume}
			{pad_right menu_audio_settings_increase_selection_volume}
		]
		<exclusive_params>
	}
	if (<popup>)
		getscreenelementdims \{id = as_band}
		fit_text_in_rectangle id = as_band only_if_larger_x = 1 dims = ((160.0, 0.0) + <height> * (0.0, 1.0)) start_x_scale = 0.7 start_y_scale = 0.7
		getscreenelementdims \{id = as_guitar}
		fit_text_in_rectangle id = as_guitar only_if_larger_x = 1 dims = ((160.0, 0.0) + <height> * (0.0, 1.0)) start_x_scale = 0.7 start_y_scale = 0.7
		getscreenelementdims \{id = as_sfx}
		fit_text_in_rectangle id = as_sfx only_if_larger_x = 1 dims = ((160.0, 0.0) + <height> * (0.0, 1.0)) start_x_scale = 0.7 start_y_scale = 0.7
	endif
	change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
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
	wait \{1
		gameframe}
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
	wait \{1
		gameframe}
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
			formattext textname = text "%d" d = <volume>
			setscreenelementprops id = band_volume_text_id text = <text>
		else
			formattext textname = text "%d" d = <volume>
			setscreenelementprops id = band_volume_id text = <text>
		endif
		setscreenelementprops id = aom_knob_line_1 rot_angle = ((<volume> / 11.0) * 180.0)
		menu_audio_settings_update_band_volume vol = <volume>
		if NOT (<band_volume> = <volume>)
			do_ping = 1
			menu_audio_settings_band_volume_sound
		else
			do_ping = 0
		endif
		case guitar
		changespinaltapvolume spinal_tap_volume = <guitar_volume> change = -1
		setglobaltags user_options params = {guitar_volume = <volume>}
		if ($as_is_popup)
			formattext textname = text "%d" d = <volume>
			setscreenelementprops id = guitar_volume_text_id text = <text>
		else
			formattext textname = text "%d" d = <volume>
			setscreenelementprops id = guitar_volume_id text = <text>
		endif
		setscreenelementprops id = aom_knob_line_2 rot_angle = ((<volume> / 11.0) * 180.0)
		menu_audio_settings_update_guitar_volume vol = <volume>
		if NOT (<guitar_volume> = <volume>)
			do_ping = 1
			menu_audio_settings_guitar_volume_sound
		else
			do_ping = 0
		endif
		case sfx
		changespinaltapvolume spinal_tap_volume = <sfx_volume> change = -1
		setglobaltags user_options params = {sfx_volume = <volume>}
		if ($as_is_popup)
			formattext textname = text "%d" d = <volume>
			setscreenelementprops id = fx_volume_text_id text = <text>
		else
			formattext textname = text "%d" d = <volume>
			setscreenelementprops id = sfx_volume_id text = <text>
		endif
		setscreenelementprops id = aom_knob_line_3 rot_angle = ((<volume> / 11.0) * 180.0)
		menu_audio_settings_update_sfx_volume vol = <volume>
		if NOT (<sfx_volume> = <volume>)
			do_ping = 1
			menu_audio_settings_fx_volume_sound
		else
			do_ping = 0
		endif
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
			formattext textname = text "%d" d = <volume>
			setscreenelementprops id = band_volume_text_id text = <text>
		else
			formattext textname = text "%d" d = <volume>
			setscreenelementprops id = band_volume_id text = <text>
		endif
		setscreenelementprops id = aom_knob_line_1 rot_angle = ((<volume> / 11.0) * 180.0)
		menu_audio_settings_update_band_volume vol = <volume>
		if NOT (<band_volume> = <volume>)
			do_ping = 1
			menu_audio_settings_band_volume_sound
		else
			do_ping = 0
		endif
		case guitar
		changespinaltapvolume spinal_tap_volume = <guitar_volume> change = 1
		setglobaltags user_options params = {guitar_volume = <volume>}
		if ($as_is_popup)
			formattext textname = text "%d" d = <volume>
			setscreenelementprops id = guitar_volume_text_id text = <text>
		else
			formattext textname = text "%d" d = <volume>
			setscreenelementprops id = guitar_volume_id text = <text>
		endif
		setscreenelementprops id = aom_knob_line_2 rot_angle = ((<volume> / 11.0) * 180.0)
		menu_audio_settings_update_guitar_volume vol = <volume>
		if NOT (<guitar_volume> = <volume>)
			do_ping = 1
			menu_audio_settings_guitar_volume_sound
		else
			do_ping = 0
		endif
		case sfx
		changespinaltapvolume spinal_tap_volume = <sfx_volume> change = 1
		setglobaltags user_options params = {sfx_volume = <volume>}
		if ($as_is_popup)
			formattext textname = text "%d" d = <volume>
			setscreenelementprops id = fx_volume_text_id text = <text>
		else
			formattext textname = text "%d" d = <volume>
			setscreenelementprops id = sfx_volume_id text = <text>
		endif
		setscreenelementprops id = aom_knob_line_3 rot_angle = ((<volume> / 11.0) * 180.0)
		menu_audio_settings_update_sfx_volume vol = <volume>
		if NOT (<sfx_volume> = <volume>)
			do_ping = 1
			menu_audio_settings_fx_volume_sound
		else
			do_ping = 0
		endif
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
			<highlight_pos> = (<screenelementpos> + (-0.05, 0.0) * <width> + (0.0, -0.05) * <height>)
			<highlight_dims> = ((1.1, 0.0) * <width> + (0.0, 0.8) * <height>)
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
	menu_audio_settings_get_buss_volume volume = <vol>
	soundbussunlock \{user_band}
	setsoundbussparams {user_band = {vol = <vol>}}
	soundbusslock \{user_band}
endscript

script menu_audio_settings_update_sfx_volume \{vol = 11}
	printf "Got vol = %v" v = <vol>
	menu_audio_settings_get_buss_volume volume = <vol>
	printf "Got vol-post = %v" v = <vol>
	soundbussunlock \{user_sfx}
	printf channel = sfx "setting user_sfx to %s " s = <vol>
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
	endswitch
endscript

script aom_spawn_ping \{time = 0.25}
	gettags
	if NOT ($as_is_popup)
		switch ($audio_settings_editing)
			case band
			pos = ($aom_menu_pos + (145.0, 96.0))
			case guitar
			pos = ($aom_menu_pos + (145.0, 266.0))
			case sfx
			pos = ($aom_menu_pos + (145.0, 436.0))
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
