jam_roots = [
	qs(0x69bdca15)
	qs(0x429099d6)
	qs(0xe0187c88)
	qs(0x5b8ba897)
	qs(0x58a41bed)
	qs(0x0dd10f11)
	qs(0x7dcf4431)
	qs(0x26fc5cd2)
	qs(0x3fe76d93)
	qs(0xd7c68cba)
	qs(0x70a6fb54)
	qs(0x4a11b403)
]
grey_default_color = [
	100
	100
	100
	255
]

script create_menu_jam_scales \{controller = 0}
	launchevent type = unfocus target = <vmenu_id>
	formattext checksumname = player_pause_scales 'jam_band_pause_scales_%s' s = <select_player>
	if screenelementexists id = <player_pause_scales>
		destroyscreenelement id = <player_pause_scales>
	endif
	getplayerinfo <select_player> jam_instrument
	switch <jam_instrument>
		case 0
		case 1
		inst_logo = theme_guitar
		case 2
		inst_logo = theme_bass
		case 3
		inst_logo = theme_drum
		case 4
		case 5
		inst_logo = theme_vocal
	endswitch
	formattext textname = player_text qs(0x033007b2) s = <select_player>
	if ($jam_advanced_record = 0)
		createscreenelement {
			type = containerelement
			id = <player_pause_scales>
			parent = <player_cont>
			pos = (0.0, -40.0)
		}
		getplayerinfo <select_player> controller
		band_leader_alpha = 0
		if (<controller> = $primary_controller)
			<band_leader_alpha> = 1
		endif
		createscreenelement {
			parent = <player_pause_scales>
			type = descinterface
			pos = (-141.0, 15.0)
			z_priority = 20
			alpha = 1
			desc = 'jam_band_pause_screen'
			inst_icon_texture = <inst_logo>
			player_number_text = <player_text>
			pause_header_text = qs(0xbae0063c)
			band_leader_alpha = <band_leader_alpha>
		}
		menu_pos = (0.0, 140.0)
	else
		createscreenelement {
			local_id = clip_window_pause_scales
			type = windowelement
			parent = <player_cont>
			just = [left top]
			pos = (-210.0, -27.0)
			dims = (1040.0, 588.0)
		}
		createscreenelement {
			type = containerelement
			id = <player_pause_scales>
			parent = <id>
			pos = (133.0, -57.0)
		}
		createscreenelement {
			parent = <player_pause_scales>
			type = descinterface
			pos = (-143.0, 15.0)
			z_priority = 20
			alpha = 1
			desc = 'jam_advanced_pause_screen'
			pause_header_text = qs(0xf5bd05ec)
			inst_icon_texture = <inst_logo>
		}
		menu_pos = (2.0, 140.0)
	endif
	formattext checksumname = player_pause_scales_cont 'jam_band_pause_scales_cont_%s' s = <select_player>
	if screenelementexists id = <player_pause_scales_cont>
		destroyscreenelement id = <player_pause_scales_cont>
	endif
	createscreenelement {
		type = containerelement
		id = <player_pause_scales_cont>
		parent = <player_pause_scales>
		pos = <menu_pos>
	}
	formattext checksumname = scrolling_scales 'jam_scrolling_scales_%s' s = <select_player>
	formattext checksumname = vmenu_scales 'jam_vmenu_scales_%s' s = <select_player>
	getplayerinfo <select_player> controller
	new_menu {
		scrollid = <scrolling_scales>
		vmenuid = <vmenu_scales>
		menu_pos = (0.0, 0.0)
		use_backdrop = 0
		default_colors = 0
		exclusive_device = <controller>
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_circle destroy_menu_jam_scales params = {select_player = <select_player>}}
			{pad_start destroy_menu_jam_scales params = {select_player = <select_player>}}
		]
		menu_parent = <player_pause_scales_cont>
	}
	text_params = {type = textelement font = fontgrid_text_a3 just = [center center] scale = 0.6 rgba = ($menu_unfocus_color) z_priority = 60}
	formattext checksumname = scales_root_text 'jam_scales_root_txt_%s' s = <select_player>
	formattext checksumname = scales_root_ctn 'jam_scales_root_ctn_%s' s = <select_player>
	createscreenelement {
		type = containerelement
		id = <scales_root_ctn>
		parent = <vmenu_scales>
		dims = (100.0, 60.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_root_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_root_text>}}
			{pad_choose change_scales_option params = {ops_array = jam_roots ops_index = jam_track_rootnotes text_id = <scales_root_text> parent = <player_pause_scales_cont> vmenu_scales = <vmenu_scales> select_player = <select_player>}}
		]
	}
	roots = ($jam_track_rootnotes)
	getplayerinfo <select_player> jam_instrument
	root = (<roots> [<jam_instrument>])
	formattext textname = root_text qs(0x1684e961) s = ($jam_roots [<root>])
	createscreenelement {
		type = textblockelement
		parent = <player_pause_scales_cont>
		id = <scales_root_text>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [left center]
		scale = 1
		rgba = ($grey_default_color)
		pos = (11.0, 0.0)
		dims = (172.0, 28.0)
		text = <root_text>
		z_priority = 60
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original
	}
	printf channel = jam_mode qs(0x73307931) s = ($jam_roots [<root>])
	formattext checksumname = scales_scale_text 'jam_scales_scale_txt_%s' s = <select_player>
	createscreenelement {
		type = containerelement
		parent = <vmenu_scales>
		dims = (100.0, 60.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_scale_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_scale_text>}}
			{pad_choose change_scales_option params = {ops_array = jam_scales_new ops_index = jam_track_scaleindex text_id = <scales_scale_text> parent = <player_pause_scales_cont> vmenu_scales = <vmenu_scales> select_player = <select_player>}}
		]
	}
	<scale_indices> = ($jam_track_scaleindex)
	<scale_index> = (<scale_indices> [<jam_instrument>])
	<scale_name_txt> = (($jam_scales_new [<scale_index>]).name)
	formattext textname = scale_text qs(0x7dde4785) s = <scale_name_txt>
	createscreenelement {
		type = textblockelement
		parent = <player_pause_scales_cont>
		id = <scales_scale_text>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [left center]
		scale = 1
		rgba = ($grey_default_color)
		pos = (11.0, 30.0)
		dims = (172.0, 30.0)
		text = <scale_text>
		z_priority = 60
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original
	}
	getplayerinfo <select_player> jam_instrument
	if (<jam_instrument> = 1)
		formattext checksumname = scales_range_txt 'jam_scales_range_txt_%s' s = <select_player>
		createscreenelement {
			type = containerelement
			parent = <vmenu_scales>
			dims = (100.0, 60.0)
			exclusive_device = <controller>
			event_handlers = [
				{focus jam_pause_focus params = {id = <scales_range_txt>}}
				{unfocus retail_menu_unfocus params = {id = <scales_range_txt>}}
				{pad_choose jam_scales_toggle_lead_range params = {select_player = <select_player>}}
			]
		}
		switch ($jam_lead_octave_range)
			case 1
			<range> = qs(0x359c9c2f)
			case 2
			<range> = qs(0x448b8949)
		endswitch
		formattext textname = range_text qs(0x322ac4ff) s = <range>
		createscreenelement {
			type = textblockelement
			parent = <player_pause_scales_cont>
			id = <scales_range_txt>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [left center]
			scale = 1
			rgba = ($grey_default_color)
			pos = (11.0, 60.0)
			dims = (172.0, 30.0)
			text = <range_text>
			z_priority = 60
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = proportional
			text_case = original
		}
	elseif (<jam_instrument> = 4)
		formattext checksumname = scales_range_txt 'jam_scales_range_txt_%s' s = <select_player>
		createscreenelement {
			type = containerelement
			parent = <vmenu_scales>
			dims = (100.0, 60.0)
			exclusive_device = <controller>
			event_handlers = [
				{focus jam_pause_focus params = {id = <scales_range_txt>}}
				{unfocus retail_menu_unfocus params = {id = <scales_range_txt>}}
				{pad_choose jam_scales_toggle_melody_range params = {select_player = <select_player>}}
			]
		}
		switch ($jam_melody_octave_range)
			case 1
			<range> = qs(0x359c9c2f)
			case 2
			<range> = qs(0x448b8949)
		endswitch
		formattext textname = range_text qs(0x322ac4ff) s = <range>
		createscreenelement {
			type = textblockelement
			parent = <player_pause_scales_cont>
			id = <scales_range_txt>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [left center]
			scale = 1
			rgba = ($grey_default_color)
			pos = (11.0, 60.0)
			dims = (172.0, 30.0)
			text = <range_text>
			z_priority = 60
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = proportional
			text_case = original
		}
	endif
	if (<jam_instrument> = 0)
		formattext checksumname = chord_type_txt 'jam_chord_type_txt_%s' s = <select_player>
		createscreenelement {
			type = containerelement
			parent = <vmenu_scales>
			dims = (100.0, 60.0)
			exclusive_device = <controller>
			event_handlers = [
				{focus jam_pause_focus params = {id = <chord_type_txt>}}
				{unfocus retail_menu_unfocus params = {id = <chord_type_txt>}}
				{pad_choose jam_scales_toggle_chord_type params = {select_player = <select_player>}}
			]
		}
		switch ($jam_rhythm_chord_type)
			case 0
			<chord_type> = qs(0x596dd695)
			case 1
			<chord_type> = qs(0x27c54a39)
		endswitch
		createscreenelement {
			type = textblockelement
			parent = <player_pause_scales_cont>
			id = <chord_type_txt>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [left center]
			scale = 1
			rgba = ($grey_default_color)
			pos = (8.0, 60.0)
			dims = (170.0, 30.0)
			text = <chord_type>
			z_priority = 60
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = proportional
			text_case = original
		}
	endif
	if (<jam_instrument> = 0)
		create_menu_jam_scales_rhythm select_player = <select_player> player_pause_scales = <player_pause_scales_cont> parent = <vmenu_scales> font_color = ($grey_default_color)
	else
		<diatonic> = 0
		if (<jam_instrument> = 1 || <jam_instrument> = 2)
			scale_index = ($jam_track_scaleindex [<jam_instrument>])
			if ((<scale_index> = 0) || (<scale_index> = 4))
				<diatonic> = 1
			endif
		endif
		create_menu_jam_scales_leadbass select_player = <select_player> player_pause_scales = <player_pause_scales_cont> parent = <vmenu_scales> font_color = ($grey_default_color) diatonic = <diatonic>
	endif
	if NOT (<jam_instrument> = 3)
		jam_scales_update_note_gems player = <select_player>
	endif
	formattext checksumname = scales_band_text 'jam_scales_band_txt_%s' s = <select_player>
	formattext checksumname = scales_band_text_ctn 'jam_scales_band_ctn_%s' s = <select_player>
	if screenelementexists id = <scales_band_text>
		destroyscreenelement id = <scales_band_text>
		destroyscreenelement id = <scales_band_text_ctn>
	endif
	createscreenelement {
		type = containerelement
		id = <scales_band_text_ctn>
		parent = <vmenu_scales>
		dims = (100.0, 60.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_band_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_band_text>}}
			{pad_choose jam_set_band_scale params = {select_player = <select_player>}}
		]
	}
	createscreenelement {
		type = textblockelement
		parent = <player_pause_scales_cont>
		id = <scales_band_text>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		scale = 1
		rgba = ($grey_default_color)
		pos = (0.0, 308.0)
		dims = (180.0, 30.0)
		text = qs(0x6da8e017)
		z_priority = 60
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original
	}
	<scales_band_text> :se_fittodims dims = (135.0, 40.0) preserve_aspect_ratio
	formattext checksumname = scales_custom_text 'jam_scales_custom_txt_%s' s = <select_player>
	formattext checksumname = scales_custom_ctn 'jam_scales_custom_ctn_%s' s = <select_player>
	if screenelementexists id = <scales_custom_text>
		destroyscreenelement id = <scales_custom_text>
		destroyscreenelement id = <scales_custom_ctn>
	endif
	createscreenelement {
		type = containerelement
		parent = <vmenu_scales>
		id = <scales_custom_ctn>
		dims = (100.0, 60.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_custom_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_custom_text>}}
			{pad_choose change_scales_option_custom params = {select_player = <select_player> vmenu = <vmenu_scales>}}
		]
	}
	createscreenelement {
		type = textblockelement
		parent = <player_pause_scales_cont>
		id = <scales_custom_text>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		scale = 1
		rgba = ($grey_default_color)
		pos = (0.0, 338.0)
		dims = (180.0, 30.0)
		text = qs(0x7718adc8)
		z_priority = 60
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original
	}
	<scales_custom_text> :se_fittodims dims = (135.0, 40.0) preserve_aspect_ratio
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if structurecontains structure = <chosen_scale> custom
		<scales_custom_text> :se_setprops rgba = [120 120 120 0]
		<scales_custom_ctn> :se_setprops not_focusable
	endif
	if ($jam_advanced_record = 1)
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
	endif
	launchevent type = focus target = <vmenu_scales>
endscript

script create_menu_jam_scales_rhythm 
	<parent> :settags num_buttons = 7 last_previewed_note = none
	button_text_params = {type = textelement font = fontgrid_text_a11 just = [center center] scale = 0.6 rgba = [120 120 120 255]}
	note_text_params = {type = textblockelement font = fontgrid_text_a3 just = [left center] rgba = <font_color>}
	<x_buttons> = -95
	<x_notes> = 41
	<x_notes_off> = 24
	<y_buttons> = 117
	<y_notes> = 95
	<y_inc> = 30
	<buttons> = [
		[1 2 0 0 0]
		[1 0 3 0 0]
		[0 2 3 0 0]
		[0 2 0 4 0]
		[0 0 3 4 0]
		[0 0 3 0 5]
		[0 0 0 4 5]
	]
	formattext checksumname = note_previews 'jam_preview_ctn_%s' s = <select_player>
	createscreenelement {
		type = containerelement
		id = <note_previews>
		parent = <player_pause_scales>
		pos = (0.0, 0.0)
	}
	<loop_count> = 0
	begin
	<cur_buttons> = (<buttons> [<loop_count>])
	<inner_loop_count> = 0
	begin
	<cur_button> = (<cur_buttons> [<inner_loop_count>])
	switch (<cur_button>)
		case 0
		<sprite> = gray_button
		case 1
		<sprite> = green_button
		case 2
		<sprite> = red_button
		case 3
		<sprite> = yellow_button
		case 4
		<sprite> = blue_button
		case 5
		<sprite> = orange_button
	endswitch
	createscreenelement {
		type = spriteelement
		parent = <note_previews>
		texture = <sprite>
		just = [left bottom]
		pos = (((<x_buttons> + (<inner_loop_count> * <x_notes_off>)) * (1.0, 0.0)) + ((<y_buttons> + (<y_inc> * <loop_count>)) * (0.0, 1.0)))
		scale = 0.68
		z_priority = 60
	}
	<inner_loop_count> = (<inner_loop_count> + 1)
	repeat 5
	formattext checksumname = scales_note_text 'jam_scales_note_txt%n_%s' n = <loop_count> s = <select_player>
	formattext checksumname = scales_note_ctn 'jam_scales_note_ctn%n_%s' n = <loop_count> s = <select_player>
	createscreenelement {
		<note_text_params>
		parent = <note_previews>
		id = <scales_note_text>
		pos = ((<x_notes> * (1.0, 0.0)) + ((<y_notes> + (<y_inc> * <loop_count>)) * (0.0, 1.0)))
		text = qs(0x9e0cb7ef)
		internal_just = [left , center]
		z_priority = 60
		dims = (50.0, 33.0)
		fit_height = `scale down if larger`
		fit_width = `scale each line if larger`
	}
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <scales_note_ctn>
		dims = (0.0, 0.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_note_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_note_text>}}
			{pad_choose jam_scales_custom_choose params = {index = <loop_count> vmenu = <parent> parent = <player_pause_scales> select_player = <select_player>}}
		]
	}
	<scales_note_ctn> :se_setprops not_focusable
	<loop_count> = (<loop_count> + 1)
	repeat 7
	formattext checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	killspawnedscript id = <scale_preview_spawn>
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	spawnscriptnow jam_scales_audible_scale_preview id = <scale_preview_spawn> params = {select_player = <select_player>}
endscript

script create_menu_jam_scales_leadbass \{diatonic = 0}
	<parent> :settags {num_buttons = 6 last_previewed_note = none}
	button_text_params = {type = textelement font = fontgrid_text_a11 just = [center center] scale = 0.6 rgba = [120 120 120 255]}
	note_text_params = {type = textblockelement font = fontgrid_text_a3 just = [left center] rgba = <font_color>}
	<x_buttons> = -95
	<x_notes> = 41
	<x_notes_off> = 24
	<y_buttons> = 122
	<y_notes> = 97
	<y_inc> = 35
	<num_notes> = 6
	<button_scale> = 0.75
	<buttons> = [
		[0 0 0 0 0]
		[1 0 0 0 0]
		[0 2 0 0 0]
		[0 0 3 0 0]
		[0 0 0 4 0]
		[0 0 0 0 5]
		[0 0 0 4 5]
	]
	formattext checksumname = note_previews 'jam_preview_ctn_%s' s = <select_player>
	if screenelementexists id = <note_previews>
		destroyscreenelement id = <note_previews>
	endif
	createscreenelement {
		type = containerelement
		id = <note_previews>
		parent = <player_pause_scales>
		pos = (0.0, 0.0)
	}
	if (<diatonic> = 1)
		<num_notes> = 7
		<button_scale> = 0.7
		<y_inc> = 30.2
		<parent> :settags num_buttons = 7
	endif
	formattext checksumname = diatonic_ctn 'jam_scales_note_ctn6_%s' s = <select_player>
	if screenelementexists id = <diatonic_ctn>
		destroyscreenelement id = <diatonic_ctn>
	endif
	<loop_count> = 0
	begin
	<cur_buttons> = (<buttons> [<loop_count>])
	<inner_loop_count> = 0
	begin
	<cur_button> = (<cur_buttons> [<inner_loop_count>])
	switch (<cur_button>)
		case 0
		<sprite> = gray_button
		case 1
		<sprite> = green_button
		case 2
		<sprite> = red_button
		case 3
		<sprite> = yellow_button
		case 4
		<sprite> = blue_button
		case 5
		<sprite> = orange_button
	endswitch
	createscreenelement {
		type = spriteelement
		parent = <note_previews>
		texture = <sprite>
		just = [left bottom]
		pos = (((<x_buttons> + (<inner_loop_count> * <x_notes_off>)) * (1.0, 0.0)) + ((<y_buttons> + (<y_inc> * <loop_count>)) * (0.0, 1.0)))
		scale = <button_scale>
		z_priority = 60
	}
	<inner_loop_count> = (<inner_loop_count> + 1)
	repeat 5
	formattext checksumname = scales_note_text 'jam_scales_note_txt%n_%s' n = <loop_count> s = <select_player>
	formattext checksumname = scales_note_ctn 'jam_scales_note_ctn%n_%s' n = <loop_count> s = <select_player>
	createscreenelement {
		<note_text_params>
		parent = <note_previews>
		id = <scales_note_text>
		pos = ((<x_notes> * (1.0, 0.0)) + ((<y_notes> + (<y_inc> * <loop_count>)) * (0.0, 1.0)))
		text = qs(0x9e0cb7ef)
		internal_just = [left , center]
		z_priority = 60
		dims = (50.0, 33.0)
		fit_height = `scale down if larger`
		fit_width = `scale each line if larger`
	}
	if screenelementexists id = <scales_note_ctn>
		destroyscreenelement id = <scales_note_ctn>
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <scales_note_ctn>
		dims = (0.0, 0.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_note_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_note_text>}}
			{pad_choose jam_scales_custom_choose params = {index = <loop_count> parent = <player_pause_scales> vmenu = <parent> select_player = <select_player>}}
		]
	}
	<scales_note_ctn> :se_setprops not_focusable
	<loop_count> = (<loop_count> + 1)
	repeat <num_notes>
	formattext checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	killspawnedscript id = <scale_preview_spawn>
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	spawnscriptnow jam_scales_audible_scale_preview id = <scale_preview_spawn> params = {select_player = <select_player>}
	formattext checksumname = player_pause_scales_cont 'jam_band_pause_scales_cont_%s' s = <select_player>
	formattext checksumname = scales_band_text 'jam_scales_band_txt_%s' s = <select_player>
	formattext checksumname = scales_band_text_ctn 'jam_scales_band_ctn_%s' s = <select_player>
	if screenelementexists id = <scales_band_text>
		destroyscreenelement id = <scales_band_text>
		destroyscreenelement id = <scales_band_text_ctn>
	endif
	createscreenelement {
		type = containerelement
		id = <scales_band_text_ctn>
		parent = <parent>
		dims = (100.0, 60.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_band_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_band_text>}}
			{pad_choose jam_set_band_scale params = {select_player = <select_player>}}
		]
	}
	createscreenelement {
		type = textblockelement
		parent = <player_pause_scales_cont>
		id = <scales_band_text>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		scale = 1
		rgba = ($grey_default_color)
		pos = (0.0, 308.0)
		dims = (180.0, 30.0)
		text = qs(0x6da8e017)
		z_priority = 60
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original
	}
	<scales_band_text> :se_fittodims dims = (135.0, 40.0) preserve_aspect_ratio
	formattext checksumname = scales_custom_text 'jam_scales_custom_txt_%s' s = <select_player>
	formattext checksumname = scales_custom_ctn 'jam_scales_custom_ctn_%s' s = <select_player>
	if screenelementexists id = <scales_custom_text>
		destroyscreenelement id = <scales_custom_text>
		destroyscreenelement id = <scales_custom_ctn>
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <scales_custom_ctn>
		dims = (100.0, 60.0)
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <scales_custom_text>}}
			{unfocus retail_menu_unfocus params = {id = <scales_custom_text>}}
			{pad_choose change_scales_option_custom params = {select_player = <select_player> vmenu = <vmenu_scales>}}
		]
	}
	createscreenelement {
		type = textblockelement
		parent = <player_pause_scales_cont>
		id = <scales_custom_text>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		scale = 1
		rgba = ($grey_default_color)
		pos = (0.0, 338.0)
		dims = (180.0, 30.0)
		text = qs(0x7718adc8)
		z_priority = 60
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original
	}
	<scales_custom_text> :se_fittodims dims = (135.0, 40.0) preserve_aspect_ratio
	getplayerinfo <select_player> jam_instrument
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if structurecontains structure = <chosen_scale> custom
		<scales_custom_text> :se_setprops rgba = [120 120 120 0]
		<scales_custom_ctn> :se_setprops not_focusable
	endif
	if ($jam_advanced_record = 1)
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
	endif
endscript

script jam_scales_update_note_gems 
	formattext checksumname = scales_root_title 'jam_scales_root_title_%s' s = <player>
	formattext checksumname = scales_root_text 'jam_scales_root_txt_%s' s = <player>
	formattext checksumname = scales_root_ctn 'jam_scales_root_ctn_%s' s = <player>
	formattext checksumname = scales_custom_text 'jam_scales_custom_txt_%s' s = <player>
	formattext checksumname = scales_custom_ctn 'jam_scales_custom_ctn_%s' s = <player>
	formattext checksumname = note_previews 'jam_preview_ctn_%s' s = <player>
	getplayerinfo <player> jam_instrument
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	<diatonic> = 0
	if (<jam_instrument> = 1 || <jam_instrument> = 2)
		scale_index = ($jam_track_scaleindex [<jam_instrument>])
		if ((<scale_index> = 0) || (<scale_index> = 4))
			<diatonic> = 1
		endif
	endif
	if structurecontains structure = <chosen_scale> custom
		if screenelementexists id = <scales_custom_text>
			<scales_custom_text> :se_setprops rgba = [120 120 120 0]
			<scales_custom_ctn> :se_setprops not_focusable
		endif
		<note_previews> :se_setprops pos = (0.0, 0.0)
	else
		if screenelementexists id = <scales_custom_text>
			<scales_custom_text> :se_setprops text = qs(0x7718adc8)
			<scales_custom_text> :se_setprops rgba = ($menu_unfocus_color)
			<scales_custom_ctn> :se_setprops focusable
		endif
		<note_previews> :se_setprops pos = (0.0, 0.0)
	endif
	if (<jam_instrument> = 1 || <jam_instrument> = 2)
		formattext checksumname = player_pause_scales_cont 'jam_band_pause_scales_cont_%s' s = <player>
		formattext checksumname = vmenu_scales 'jam_vmenu_scales_%s' s = <player>
		create_menu_jam_scales_leadbass select_player = <player> player_pause_scales = <player_pause_scales_cont> parent = <vmenu_scales> font_color = [80 80 80 255] diatonic = <diatonic>
	endif
	<cur_active_scale_name> = ($jam_track_scales_new [<jam_instrument>])
	<cur_scale> = ($<cur_active_scale_name>)
	if (<jam_instrument> = 0)
		<gems_shown> = 7
	else
		<gems_shown> = 6
		if (<diatonic> = 1)
			<gems_shown> = 7
		endif
	endif
	<loop_count> = 0
	begin
	formattext checksumname = scales_note_text 'jam_scales_note_txt%n_%s' n = <loop_count> s = <player>
	if screenelementexists id = <scales_note_text>
		<note_struct> = (<cur_scale> [<loop_count>])
		jam_get_sample_checksum string = (<note_struct> [0]) fret = (<note_struct> [1]) type = 0 jam_instrument = <jam_instrument>
		<final_text> = <note_text>
		if structurecontains structure = <chosen_scale> chromatic
			<main_note> = <note_text>
			if (<jam_instrument> = 0)
				<note_struct> = (<cur_scale> [<loop_count> + 7])
			else
				<note_struct> = (<cur_scale> [<loop_count> + 6])
			endif
			jam_get_sample_checksum string = (<note_struct> [0]) fret = (<note_struct> [1]) type = 0 jam_instrument = <jam_instrument>
			formattext textname = final_text qs(0x53cfde30) a = <main_note> b = <note_text>
		endif
		<scales_note_text> :setprops text = <final_text>
	endif
	if structurecontains structure = <chosen_scale> custom
		formattext checksumname = scales_note_ctn 'jam_scales_note_ctn%n_%s' n = <loop_count> s = <player>
		if screenelementexists id = <scales_note_ctn>
			<scales_note_ctn> :se_setprops focusable
		endif
	endif
	<loop_count> = (<loop_count> + 1)
	repeat <gems_shown>
endscript

script change_scales_option 
	generic_menu_pad_choose_sound
	formattext checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	killspawnedscript id = <scale_preview_spawn>
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	spawnscriptnow jam_scales_audible_scale_preview id = <scale_preview_spawn> params = {select_player = <select_player>}
	setscreenelementprops id = <vmenu_scales> block_events
	formattext checksumname = scales_event_handler 'jam_scales_event_handler_%s' s = <select_player>
	getplayerinfo <select_player> controller
	createscreenelement {
		type = containerelement
		parent = <text_id>
		id = <scales_event_handler>
		z_priority = 60
		exclusive_device = <controller>
		event_handlers = [
			{pad_up change_scales_option_updown params = {up ops_array = <ops_array> ops_index = <ops_index> text_id = <text_id> select_player = <select_player>}}
			{pad_down change_scales_option_updown params = {down ops_array = <ops_array> ops_index = <ops_index> text_id = <text_id> select_player = <select_player>}}
			{pad_choose change_scales_option_back params = {ops_array = <ops_array> vmenu_scales = <vmenu_scales> select_player = <select_player>}}
			{pad_circle change_scales_option_back params = {ops_array = <ops_array> vmenu_scales = <vmenu_scales> select_player = <select_player> back}}
			{pad_start change_scales_option_back params = {ops_array = <ops_array> vmenu_scales = <vmenu_scales> select_player = <select_player> back}}
		]
	}
	launchevent type = focus target = <scales_event_handler>
	if checksumequals a = <ops_array> b = jam_roots
		formattext checksumname = scales_arrow_up 'scales_arrow_up_%a' a = <select_player>
		createscreenelement {
			type = spriteelement
			parent = <scales_event_handler>
			id = <scales_arrow_up>
			texture = up_arrow
			just = [center center]
			pos = (-15.0, 8.0)
			scale = 0.5
			z_priority = 70
		}
		formattext checksumname = scales_arrow_down 'scales_arrow_down_%a' a = <select_player>
		createscreenelement {
			type = spriteelement
			parent = <scales_event_handler>
			id = <scales_arrow_down>
			texture = down_arrow
			just = [center center]
			pos = (-15.0, 18.0)
			scale = 0.5
			z_priority = 70
		}
	else
		formattext checksumname = scales_arrow_up 'scales_arrow_up_%a' a = <select_player>
		createscreenelement {
			type = spriteelement
			parent = <scales_event_handler>
			id = <scales_arrow_up>
			texture = up_arrow
			just = [center center]
			pos = (-15.0, 8.0)
			scale = 0.5
			z_priority = 70
		}
		formattext checksumname = scales_arrow_down 'scales_arrow_down_%a' a = <select_player>
		createscreenelement {
			type = spriteelement
			parent = <scales_event_handler>
			id = <scales_arrow_down>
			texture = down_arrow
			just = [center center]
			pos = (-15.0, 18.0)
			scale = 0.5
			z_priority = 70
		}
	endif
endscript

script change_scales_option_updown 
	getplayerinfo <select_player> jam_instrument
	ops = ($<ops_index>)
	index_in_ops = (<ops> [<jam_instrument>])
	if gotparam \{up}
		soundevent \{event = scale_scroll_up}
		new_option = (<index_in_ops> - 1)
		if (<new_option> < 0)
			getarraysize ($<ops_array>)
			<new_option> = (<array_size> - 1)
		endif
		formattext checksumname = scales_arrow_up 'scales_arrow_up_%a' a = <select_player>
		legacydoscreenelementmorph id = <scales_arrow_up> scale = 1.3 relative_scale
		legacydoscreenelementmorph id = <scales_arrow_up> scale = 1.0 relative_scale time = 0.1
	elseif gotparam \{down}
		soundevent \{event = scale_scroll_down}
		new_option = (<index_in_ops> + 1)
		getarraysize ($<ops_array>)
		if (<new_option> >= <array_size>)
			<new_option> = 0
		endif
		formattext checksumname = scales_arrow_down 'scales_arrow_down_%a' a = <select_player>
		legacydoscreenelementmorph id = <scales_arrow_down> scale = 1.3 relative_scale
		legacydoscreenelementmorph id = <scales_arrow_down> scale = 1.0 relative_scale time = 0.1
	endif
	setarrayelement arrayname = <ops_index> globalarray index = <jam_instrument> newvalue = <new_option>
	<chosen_scale> = ($<ops_array> [<new_option>])
	if checksumequals a = <ops_array> b = jam_roots
		<text> = <chosen_scale>
		formattext textname = text qs(0x1684e961) s = <chosen_scale>
	else
		<text> = (<chosen_scale>.name)
		formattext textname = text qs(0x7dde4785) s = (<chosen_scale>.name)
	endif
	setscreenelementprops id = <text_id> text = <text>
	jam_update_scalemenu_scales ops_array = <ops_array> select_player = <select_player> new_option = <new_option>
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale_struct> = ($jam_scales_new [<chosen_scale_index>])
	if structurecontains structure = <chosen_scale_struct> custom
		formattext checksumname = scales_custom_text 'jam_scales_custom_txt_%s' s = <select_player>
		formattext checksumname = scales_custom_ctn 'jam_scales_custom_ctn_%s' s = <select_player>
		<scales_custom_text> :se_setprops rgba = [120 120 120 0]
		<scales_custom_ctn> :se_setprops not_focusable
	endif
	formattext checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	killspawnedscript id = <scale_preview_spawn>
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	spawnscriptnow jam_scales_audible_scale_preview id = <scale_preview_spawn> params = {select_player = <select_player>}
endscript

script jam_update_scalemenu_scales 
	getplayerinfo <select_player> jam_instrument
	formattext checksumname = scales_custom_text 'jam_scales_custom_txt_%s' s = <select_player>
	formattext checksumname = scales_root_text 'jam_scales_root_txt_%s' s = <select_player>
	formattext checksumname = scales_root_ctn 'jam_scales_root_ctn_%s' s = <select_player>
	formattext checksumname = scales_root_title 'jam_scales_root_title_%s' s = <select_player>
	formattext checksumname = scales_custom_ctn 'jam_scales_custom_ctn_%s' s = <select_player>
	formattext checksumname = note_previews 'jam_preview_ctn_%s' s = <select_player>
	formattext checksumname = vmenu 'jam_vmenu_scales_%s' s = <select_player>
	<vmenu> :gettags
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if structurecontains structure = <chosen_scale> custom
		<scales_custom_text> :se_setprops rgba = [120 120 120 0]
		<scales_custom_ctn> :se_setprops not_focusable
		<note_previews> :se_setprops pos = (0.0, 0.0)
		if checksumequals a = <ops_array> b = jam_scales_new
			<loop_count> = 0
			begin
			formattext checksumname = scales_note_ctn 'jam_scales_note_ctn%n_%s' n = <loop_count> s = <select_player>
			<scales_note_ctn> :se_setprops focusable
			<loop_count> = (<loop_count> + 1)
			repeat <num_buttons>
		endif
	else
		<scales_custom_text> :se_setprops text = qs(0x7718adc8)
		<scales_custom_ctn> :se_setprops focusable
		<note_previews> :se_setprops pos = (0.0, 0.0)
		if checksumequals a = <ops_array> b = jam_scales_new
			<loop_count> = 0
			begin
			formattext checksumname = scales_note_ctn 'jam_scales_note_ctn%n_%s' n = <loop_count> s = <select_player>
			<scales_note_ctn> :se_setprops not_focusable
			<loop_count> = (<loop_count> + 1)
			repeat <num_buttons>
		endif
	endif
	guitar_jam_scales_change_scale jam_instrument = <jam_instrument>
	jam_scales_update_note_gems player = <select_player>
endscript

script change_scales_option_back 
	setscreenelementprops id = <vmenu_scales> unblock_events
	formattext checksumname = scales_event_handler 'jam_scales_event_handler_%s' s = <select_player>
	if screenelementexists id = <scales_event_handler>
		destroyscreenelement id = <scales_event_handler>
	endif
	generic_menu_pad_back_sound
	getplayerinfo <select_player> jam_instrument
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	formattext checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	killspawnedscript id = <scale_preview_spawn>
endscript

script change_scales_option_custom 
	getplayerinfo <select_player> jam_instrument
	<scale_index> = (($jam_track_scaleindex) [<jam_instrument>])
	<premade_struct> = (($jam_scales_new) [<scale_index>])
	if structurecontains structure = <premade_struct> custom
		return
	endif
	<chosen_roots_array> = ($jam_track_rootnotes)
	<root_note> = (<chosen_roots_array> [<jam_instrument>])
	<final_custom> = [0 , 0 , 0 , 0 , 0 , 0 , 0]
	if (<jam_instrument> = 0)
		<premade_scale_name> = (<premade_struct>.pattern_rhythm)
		<premade_scale> = ($<premade_scale_name>)
		<count> = 0
		begin
		<note> = (<premade_scale> [<count>])
		<note> = (<note> + <root_note>)
		if (<note> >= 12)
			<note> = (<note> - <root_note>)
			<used_amount> = (12 - <note>)
			<note> = (<root_note> - <used_amount>)
		endif
		setarrayelement arrayname = final_custom index = <count> newvalue = <note>
		<count> = (<count> + 1)
		repeat 7
	else
		<premade_scale_name> = (<premade_struct>.pattern)
		<premade_scale> = ($<premade_scale_name>)
		<count> = 0
		begin
		<note> = (<premade_scale> [<count>])
		<string> = (<note> [0])
		<fret> = (<note> [1])
		jam_get_sample_checksum fret = <fret> string = <string> type = <note_type> jam_instrument = <jam_instrument>
		<new_value> = (<note_id> + <root_note>)
		if (<new_value> > 11)
			<new_value> = (<new_value> - 12)
		endif
		setarrayelement arrayname = final_custom index = <count> newvalue = <new_value>
		<count> = (<count> + 1)
		repeat 6
	endif
	<custom_names_array> = ($jam_track_custom_scales_new)
	<custom_name> = (<custom_names_array> [<jam_instrument>])
	change globalname = <custom_name> newvalue = <final_custom>
	getarraysize ($jam_scales_new)
	setarrayelement arrayname = jam_track_scaleindex globalarray index = <jam_instrument> newvalue = (<array_size> -1)
	<custom_struct> = (($jam_scales_new) [(<array_size> -1)])
	<text> = qs(0x780a0bdc)
	formattext checksumname = text_id 'jam_scales_scale_txt_%s' s = <select_player>
	setscreenelementprops id = <text_id> text = <text>
	formattext checksumname = vmenu 'jam_vmenu_scales_%s' s = <select_player>
	launchevent type = unfocus target = <vmenu>
	formattext checksumname = scales_custom_text 'jam_scales_custom_txt_%s' s = <select_player>
	formattext checksumname = scales_custom_ctn 'jam_scales_custom_ctn_%s' s = <select_player>
	<scales_custom_text> :se_setprops rgba = [120 120 120 0]
	<scales_custom_ctn> :se_setprops not_focusable
	<vmenu> :gettags
	<loop_count> = 0
	begin
	formattext checksumname = scales_note_ctn 'jam_scales_note_ctn%n_%s' n = <loop_count> s = <select_player>
	<scales_note_ctn> :se_setprops focusable
	<loop_count> = (<loop_count> + 1)
	repeat <num_buttons>
	jam_scales_update_note_gems player = <select_player>
	formattext checksumname = scales_note_ctn 'jam_scales_note_ctn0_%s' s = <select_player>
	launchevent type = focus target = <vmenu> data = {child_id = <scales_note_ctn>}
	formattext checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	killspawnedscript id = <scale_preview_spawn>
	getplayerinfo <select_player> jam_instrument
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	generic_menu_pad_choose_sound
endscript

script jam_scales_custom_choose 
	setscreenelementprops id = <vmenu> block_events
	formattext checksumname = scales_custom_event_handler 'jam_scales_custom_event_handler_%s' s = <select_player>
	getplayerinfo <select_player> controller
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <scales_custom_event_handler>
		z_priority = 75
		exclusive_device = <controller>
		event_handlers = [
			{pad_up jam_scales_custom_updown params = {up index = <index> select_player = <select_player> handler = <scales_custom_event_handler> parent_menu = <vmenu>}}
			{pad_down jam_scales_custom_updown params = {down index = <index> select_player = <select_player> handler = <scales_custom_event_handler> parent_menu = <vmenu>}}
			{pad_choose jam_scales_custom_edit_back params = {select_player = <select_player> handler = <scales_custom_event_handler> vmenu = <vmenu>}}
			{pad_circle jam_scales_custom_edit_back params = {select_player = <select_player> handler = <scales_custom_event_handler> vmenu = <vmenu>}}
			{pad_start jam_scales_custom_edit_back params = {select_player = <select_player> handler = <scales_custom_event_handler> vmenu = <vmenu>}}
		]
	}
	launchevent type = focus target = <scales_custom_event_handler>
	getplayerinfo <select_player> jam_instrument
	if (<jam_instrument> = 0)
		<start_top> = (88.0, 91.0)
		<start_bottom> = (88.0, 101.0)
		<y_off> = 30
	else
		<start_top> = (88.0, 93.0)
		<start_bottom> = (88.0, 103.0)
		<y_off> = 35
	endif
	formattext checksumname = custom_arrow_up 'custom_scale_arrow_up_%a' a = <select_player>
	<pos> = <start_top>
	<add> = (<index> * <y_off>)
	<pos> = (<pos> + (<add> * (0.0, 1.0)))
	createscreenelement {
		type = spriteelement
		parent = <scales_custom_event_handler>
		id = <custom_arrow_up>
		texture = up_arrow
		just = [center center]
		pos = <pos>
		scale = 0.5
		z_priority = 70
	}
	formattext checksumname = custom_arrow_down 'custom_scale_arrow_down_%a' a = <select_player>
	<pos> = <start_bottom>
	<add> = (<index> * <y_off>)
	<pos> = (<pos> + (<add> * (0.0, 1.0)))
	createscreenelement {
		type = spriteelement
		parent = <scales_custom_event_handler>
		id = <custom_arrow_down>
		texture = down_arrow
		just = [center center]
		pos = <pos>
		scale = 0.5
		z_priority = 70
	}
	custom_scales = ($jam_track_custom_scales_new)
	cur_scale_name = (<custom_scales> [<jam_instrument>])
	cur_scale = ($<cur_scale_name>)
	cur_note = (<cur_scale> [<index>])
	killspawnedscript \{name = jam_scales_audible_note_preview}
	spawnscriptnow jam_scales_audible_note_preview params = {select_player = <select_player> target_note = <cur_note> note_index = <index>}
endscript

script jam_scales_custom_updown 
	getplayerinfo <select_player> jam_instrument
	<custom_scales> = ($jam_track_custom_scales_new)
	<cur_scale_name> = (<custom_scales> [<jam_instrument>])
	<cur_scale> = ($<cur_scale_name>)
	<cur_note> = (<cur_scale> [<index>])
	if gotparam \{up}
		<cur_note> = (<cur_note> - 1)
		getarraysize ($jam_roots)
		if (<cur_note> < 0)
			<cur_note> = (<array_size> -1)
		endif
		formattext checksumname = custom_arrow_up 'custom_scale_arrow_up_%a' a = <select_player>
		legacydoscreenelementmorph id = <custom_arrow_up> scale = 1.3 relative_scale
		legacydoscreenelementmorph id = <custom_arrow_up> scale = 1.0 relative_scale time = 0.1
	elseif gotparam \{down}
		<cur_note> = (<cur_note> + 1)
		getarraysize ($jam_roots)
		if (<cur_note> >= <array_size>)
			<cur_note> = 0
		endif
		formattext checksumname = custom_arrow_down 'custom_scale_arrow_down_%a' a = <select_player>
		legacydoscreenelementmorph id = <custom_arrow_down> scale = 1.3 relative_scale
		legacydoscreenelementmorph id = <custom_arrow_down> scale = 1.0 relative_scale time = 0.1
	endif
	killspawnedscript \{name = jam_scales_audible_note_preview}
	spawnscriptnow jam_scales_audible_note_preview params = {select_player = <select_player> target_note = <cur_note> note_index = <index>}
	setarrayelement arrayname = cur_scale index = <index> newvalue = <cur_note>
	change globalname = <cur_scale_name> newvalue = <cur_scale>
	<new_text> = ($jam_roots [<cur_note>])
	formattext checksumname = scales_note_text 'jam_scales_note_txt%n_%s' n = <index> s = <select_player>
	<scales_note_text> :setprops text = <new_text>
endscript

script jam_scales_custom_edit_back 
	launchevent type = unfocus target = <handler>
	destroyscreenelement id = <handler>
	getarraysize ($jam_scales_new)
	jam_update_scalemenu_scales ops_array = jam_scales_new select_player = <select_player> new_option = (<array_size> -1)
	setscreenelementprops id = <vmenu> unblock_events
	launchevent type = focus target = <vmenu>
	launchevent type = pad_down target = <vmenu>
	launchevent type = pad_up target = <vmenu>
	getplayerinfo <select_player> jam_instrument
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	generic_menu_pad_back_sound
endscript

script destroy_menu_jam_scales 
	generic_menu_pad_back_sound
	formattext checksumname = vmenu_scales 'jam_vmenu_scales_%s' s = <select_player>
	launchevent type = unfocus target = <vmenu_scales>
	formattext checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <select_player>
	killspawnedscript id = <scale_preview_spawn>
	getplayerinfo <select_player> jam_instrument
	jam_stop_preview_sound jam_instrument = <jam_instrument>
	formattext checksumname = scrolling_scales 'jam_scrolling_scales_%s' s = <select_player>
	destroy_menu menu_id = <scrolling_scales>
	formattext checksumname = player_pause_scales 'jam_band_pause_scales_%s' s = <select_player>
	if screenelementexists id = <player_pause_scales>
		destroyscreenelement id = <player_pause_scales>
	endif
	if screenelementexists \{id = {
				jam_pause_container
				child = clip_window_pause_scales
			}}
		destroyscreenelement \{id = {
				jam_pause_container
				child = clip_window_pause_scales
			}}
	endif
	if ($jam_advanced_record = 1)
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0x00688155)
			button = start
			z = 100}
		jam_ghmix_note_quick_update player = ($jam_current_recording_player)
	endif
	formattext checksumname = vmenu_options 'vmenu_options_%s' s = <select_player>
	if screenelementexists id = <vmenu_options>
		launchevent type = focus target = <vmenu_options>
	endif
endscript
