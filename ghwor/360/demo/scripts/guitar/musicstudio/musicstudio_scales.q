
script musicstudio_get_root_note_text 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	root = ($jam_track_rootnotes [<instrument>])
	formattext textname = name_text qs(0xa3cf8b53) s = ($jam_roots [<root>].name_text)
	return name_text = <name_text>
endscript

script musicstudio_get_scale_text 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	scale = ($jam_track_scaleindex [<instrument>])
	formattext textname = name_text qs(0xd8ce0d36) s = (($jam_scales_new [<scale>]).name_text)
	return name_text = <name_text>
endscript

script musicstudio_get_list_checksum_root 
	return \{list_checksum = jam_roots}
endscript
musicstudio_scale_selected_index = 0

script musicstudio_get_selected_root 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	root = ($jam_track_rootnotes [<instrument>])
	change musicstudio_scale_selected_index = <root>
	return selected = <root>
endscript

script musicstudio_change_root 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	setarrayelement arrayname = jam_track_rootnotes globalarray index = <instrument> newvalue = <index>
	guitar_jam_scales_change_scale jam_instrument = <instrument>
endscript

script musicstudio_get_list_checksum_scale 
	return \{list_checksum = jam_scales_new}
endscript

script musicstudio_get_selected_scale 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	scale = ($jam_track_scaleindex [<instrument>])
	change musicstudio_scale_selected_index = <scale>
	return selected = <scale>
endscript

script musicstudio_change_scale 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	setarrayelement arrayname = jam_track_scaleindex globalarray index = <instrument> newvalue = <index>
	guitar_jam_scales_change_scale jam_instrument = <instrument>
endscript

script musicstudio_scale_root_focus 
	musicstudio_change_root index = <index> player = <player>
	musicstudio_show_edit_scale_reference player = <player>
endscript

script musicstudio_scale_type_focus 
	musicstudio_change_scale index = <index> player = <player>
	musicstudio_show_edit_scale_reference player = <player>
endscript

script musicstudio_scale_root_go_back 
	musicstudio_change_root index = ($musicstudio_scale_selected_index) player = <player>
endscript

script musicstudio_scale_type_go_back 
	musicstudio_change_scale index = ($musicstudio_scale_selected_index) player = <player>
endscript

script musicstudio_scale_setup 
	musicstudio_audible_scale_preview player = <player>
endscript

script musicstudio_scale_state_init 
	musicstudio_show_edit_scale_reference player = <player>
	change \{musicstudio_scale_customize_curr_note = 0}
endscript

script musicstudio_scale_state_deinit 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	jam_stop_sound jam_instrument = <instrument>
	killspawnedscript \{name = musicstudio_audible_scale_preview_spawn}
	musicstudio_remove_edit_scale_reference
endscript

script musicstudio_show_edit_scale_reference 
	musicstudio_ghmix_show_scale_reference scale_edit player = <player>
	musicstudio_show_scale_staff_reference player = <player>
	musicstudio_highway_blackout \{blackout = [
			1
			1
			1
			1
			1
		]
		alpha = 0.85}
	musicstudio_ghmix_alpha_highway \{alpha = 0.0
		everything}
endscript

script musicstudio_remove_edit_scale_reference 
	musicstudio_ghmix_remove_scale_reference
	musicstudio_remove_scale_staff_reference
	musicstudio_highway_blackout \{remove}
	musicstudio_ghmix_alpha_highway \{alpha = 1.0
		everything}
endscript

script musicstudio_scale_customize 
	musicstudio_scale_make_custom player = <player>
	getarraysize ($jam_scales_new)
	musicstudio_change_scale index = (<array_size> - 1) player = <player>
endscript

script musicstudio_scale_customize_get_active 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	if (<instrument> = 0 || <instrument> = 1 || <instrument> = 2 || <instrument> = 4)
		return \{active = 1}
	else
		return \{active = 0}
	endif
endscript

script musicstudio_scale_customize_get_state 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	musicstudio_state = null
	if (<instrument> = 0 || <instrument> = 1 || <instrument> = 2 || <instrument> = 4)
		<musicstudio_state> = musicstudio_scale_state
	endif
	return musicstudio_state = <musicstudio_state>
endscript

script musicstudio_scale_make_custom \{note_id = 0}
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	<scale_index> = (($jam_track_scaleindex) [<instrument>])
	<premade_struct> = (($jam_scales_new) [<scale_index>])
	if structurecontains structure = <premade_struct> custom
		return
	endif
	<chosen_roots_array> = ($jam_track_rootnotes)
	<root_note> = (<chosen_roots_array> [<instrument>])
	<final_custom> = [0 , 0 , 0 , 0 , 0 , 0 , 0]
	if (<instrument> = 0)
		<premade_scale_name> = (<premade_struct>.pattern_rhythm)
		<premade_scale> = ($<premade_scale_name>)
		<premade_scale_chords_name> = (<premade_struct>.chord_pattern)
		<premade_scale_chords> = ($<premade_scale_chords_name>)
		<count> = 0
		begin
		<note_value> = (<premade_scale> [<count>])
		<note_value> = (<note_value> + <root_note>)
		if (<note_value> >= 12)
			<note_value> = (<note_value> - <root_note>)
			<used_amount> = (12 - <note_value>)
			<note_value> = (<root_note> - <used_amount>)
		endif
		setarrayelement arrayname = final_custom index = <count> newvalue = <note_value>
		setarrayelement globalarray arrayname = custom_chord_pattern index = <count> newvalue = (<premade_scale_chords> [<count>])
		<count> = (<count> + 1)
		repeat 7
	else
		<premade_scale_name> = (<premade_struct>.pattern)
		<premade_scale> = ($<premade_scale_name>)
		<count> = 0
		<last_string> = 0
		<last_fret> = 0
		begin
		<note_value> = (<premade_scale> [<count>])
		<string> = (<note_value> [0])
		<fret> = (<note_value> [1])
		if (<string> < 0 || <fret> < 0)
			<string> = <last_string>
			<fret> = <last_fret>
		endif
		jam_get_sample_checksum fret = <fret> string = <string> type = <note_type> jam_instrument = <instrument>
		<new_value> = (<note_id> + <root_note>)
		if (<new_value> > 11)
			<new_value> = (<new_value> - 12)
		endif
		<last_string> = <string>
		<last_fret> = <fret>
		setarrayelement arrayname = final_custom index = <count> newvalue = <new_value>
		<count> = (<count> + 1)
		repeat 7
	endif
	<custom_names_array> = ($jam_track_custom_scales_new)
	<custom_name> = (<custom_names_array> [<instrument>])
	change globalname = <custom_name> newvalue = <final_custom>
endscript

script musicstudio_get_range_text 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	toggle = 0
	switch <instrument>
		case 0
		<toggle> = ($jam_rhythm_chord_type)
		case 1
		<toggle> = ($jam_lead_octave_range)
		case 4
		<toggle> = ($jam_melody_octave_range)
	endswitch
	if (<instrument> = 0)
		if (<toggle> = 0)
			return \{name_text = qs(0x1528c54e)}
		elseif (<toggle> = 1)
			return \{name_text = qs(0xd466e4df)}
		endif
	else
		if (<toggle> = 1)
			return \{name_text = qs(0x5a679075)}
		elseif (<toggle> = 2)
			return \{name_text = qs(0x0d691f47)}
		endif
	endif
	return \{name_text = qs(0x31505fab)}
endscript

script musicstudio_scale_range_get_active 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	if (<instrument> = 1 || <instrument> = 4 || <instrument> = 0)
		return \{active = 1}
	else
		return \{active = 0}
	endif
endscript

script musicstudio_scale_toggle_range 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	switch <instrument>
		case 0
		if ($jam_rhythm_chord_type = 0)
			change \{jam_rhythm_chord_type = 1}
		else
			change \{jam_rhythm_chord_type = 0}
		endif
		case 1
		if ($jam_lead_octave_range = 1)
			change \{jam_lead_octave_range = 2}
		else
			change \{jam_lead_octave_range = 1}
		endif
		case 4
		if ($jam_melody_octave_range = 1)
			change \{jam_melody_octave_range = 2}
		else
			change \{jam_melody_octave_range = 1}
		endif
	endswitch
	if (<instrument> = 0 || <instrument> = 1 || <instrument> = 4)
		guitar_jam_scales_change_scale jam_instrument = <instrument>
		musicstudio_show_edit_scale_reference player = <player>
		scale_state = musicstudio_scale_state
		if musicstudio_mainobj :musicstudiojamroom_isinjamroom
			<scale_state> = musicstudio_jamroom_scale_state
		endif
		musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
		<player_object> :musicstudiomenu_setstate {
			id = <id>
			state = <scale_state>
		}
		musicstudio_audible_scale_preview player = <player>
	else
		musicstudio_show_popup_warning warning = ($ghmix_warning_scale_range_fail_1)
	endif
endscript
scale_buttons = [
	{
		name_text = qs(0x96c4bc0e)
	}
	{
		name_text = qs(0x1f745aaf)
	}
	{
		name_text = qs(0x6262b65c)
	}
	{
		name_text = qs(0xd29c5728)
	}
	{
		name_text = qs(0x63e85fb6)
	}
	{
		name_text = qs(0x1f07dcf9)
	}
	{
		name_text = qs(0xf1ca49e9)
	}
]
scale_buttons_rhythm = [
	{
		name_text = qs(0x219c9265)
	}
	{
		name_text = qs(0xd1cdda84)
	}
	{
		name_text = qs(0x5dc8738f)
	}
	{
		name_text = qs(0xfdb6336c)
	}
	{
		name_text = qs(0x62337cf2)
	}
	{
		name_text = qs(0xfd3895f8)
	}
	{
		name_text = qs(0xd276ff23)
	}
]
musicstudio_scale_customize_curr_note = 0

script musicstudio_customize_scale_choose_note 
	change musicstudio_scale_customize_curr_note = <index>
endscript

script musicstudio_get_list_checksum_buttons 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	if (<instrument> = 0)
		return \{list_checksum = scale_buttons_rhythm}
	endif
	return \{list_checksum = scale_buttons}
endscript

script musicstudio_customize_scale_focus 
	musicstudio_show_edit_scale_reference player = <player>
	musicstudio_scale_reference_highlight button_num = <index> player = <player>
endscript

script musicstudio_get_selected_customize_scale 
	return selected = ($musicstudio_scale_customize_curr_note)
endscript

script musicstudio_scrolling_customize_scale_get_state 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	if (<instrument> = 0 && $jam_rhythm_chord_type = 1)
		return \{musicstudio_scrolling_state = musicstudio_scrolling_customize_chord_state}
	endif
	return \{musicstudio_scrolling_state = musicstudio_scrolling_customize_scale_state}
endscript

script musicstudio_customize_note_init 
	musicstudio_show_edit_scale_reference player = <player>
	musicstudio_scale_reference_highlight button_num = ($musicstudio_scale_customize_curr_note) player = <player>
endscript

script musicstudio_customize_note_focus 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	custom_scales = ($jam_track_custom_scales_new)
	cur_scale_name = (<custom_scales> [<instrument>])
	cur_scale = ($<cur_scale_name>)
	setarrayelement arrayname = cur_scale index = ($musicstudio_scale_customize_curr_note) newvalue = <index>
	change globalname = <cur_scale_name> newvalue = <cur_scale>
	musicstudio_scale_customize player = <player>
	musicstudio_customize_note_init player = <player>
	musicstudio_audible_note_preview index = ($musicstudio_scale_customize_curr_note) player = <player>
endscript

script musicstudio_get_list_checksum_roots 
	return \{list_checksum = jam_roots}
endscript

script musicstudio_get_selected_note 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	custom_scales = ($jam_track_custom_scales_new)
	cur_scale_name = (<custom_scales> [<instrument>])
	cur_scale = ($<cur_scale_name>)
	cur_note = (<cur_scale> [($musicstudio_scale_customize_curr_note)])
	return selected = <cur_note>
endscript

script musicstudio_customize_chord_init 
	musicstudio_show_edit_scale_reference player = <player>
	musicstudio_scale_reference_highlight button_num = ($musicstudio_scale_customize_curr_note) player = <player>
endscript

script musicstudio_customize_chord_focus 
	current_custom_chord_pattern = ($custom_chord_pattern)
	setarrayelement arrayname = current_custom_chord_pattern index = ($musicstudio_scale_customize_curr_note) newvalue = <index>
	change globalname = custom_chord_pattern newvalue = <current_custom_chord_pattern>
	musicstudio_scale_customize player = <player>
	musicstudio_customize_chord_init player = <player>
	musicstudio_audible_note_preview index = ($musicstudio_scale_customize_curr_note) player = <player> force_bar_chords = 1
endscript

script musicstudio_get_list_checksum_chords 
	return \{list_checksum = rhythm_chord_types}
endscript

script musicstudio_customize_chord_get_selected_chord 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	return selected = ($custom_chord_pattern [($musicstudio_scale_customize_curr_note)])
endscript

script musicstudio_audible_scale_preview 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	jam_stop_sound jam_instrument = <instrument>
	killspawnedscript \{name = musicstudio_audible_scale_preview_spawn}
	musicstudio_mainobj :obj_spawnscriptnow musicstudio_audible_scale_preview_spawn params = {instrument = <instrument> player = <player>}
endscript

script musicstudio_audible_note_preview \{force_bar_chords = 0}
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	jam_stop_sound jam_instrument = <instrument>
	killspawnedscript \{name = musicstudio_audible_scale_preview_spawn}
	musicstudio_mainobj :obj_spawnscriptnow musicstudio_audible_scale_preview_spawn params = {instrument = <instrument> player = <player> index = <index> force_bar_chords = <force_bar_chords>}
endscript

script musicstudio_audible_scale_preview_spawn \{force_bar_chords = 0}
	wait \{0.5
		seconds}
	if gotparam \{index}
		num_notes = 1
		loop_count = <index>
	else
		num_notes = 7
		if NOT (<instrument> = 0)
			guitar_jam_scales_get_diatonic instrument = <instrument>
			if NOT (<diatonic> = 1)
				<num_notes> = 6
			endif
		endif
		loop_count = 0
	endif
	musicstudio_mainobj :musicstudioghmix_getnotequantizems note_value = (1.0 / 8.0)
	delay_between_notes = (<note_quantize_ms> / 1000.0)
	last_sound = null
	begin
	jam_get_sample jam_instrument = <instrument> button = <loop_count> tilt = 0 chord_dir = 0 force_bar_chords = <force_bar_chords>
	musicstudio_play_sound {
		instrument = <instrument>
		final_note_sample = <final_note_sample>
		pitch_shift = <pitch_shift>
		note_type = 0
		note_velocity = ($musicstudio_default_strum_velocity)
		note_string = <note_string>
		note_fret = <note_fret>
	}
	last_sound = <final_note_sample>
	wait <delay_between_notes> seconds
	<loop_count> = (<loop_count> + 1)
	repeat <num_notes>
	wait (<delay_between_notes> * 2) seconds
	stopsound <last_sound> fade_type = linear fade_time = $jam_fade_time
endscript

script musicstudio_ghmix_show_scale_reference 
	if NOT screenelementexists \{id = musicstudio_ghmix}
		return
	endif
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	font_color = [230 230 230 255]
	button_text_params = {type = textelement font = fontgrid_text_a1 just = [center center] scale = 0.6 rgba = [120 120 120 255]}
	note_text_params = {type = textblockelement font = fontgrid_text_a3 just = [left center] rgba = <font_color>}
	if (<instrument> = 3)
		jam_ghmix_remove_scale_reference
		return
	endif
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if gotparam \{scale_edit}
		cont_pos = (675.0, 60.0)
		cont_scale = 1.0
	else
		if (<step_record> = 1)
			cont_pos = (894.0, 40.0)
			cont_scale = 0.89
		else
			cont_pos = (902.0, 34.0)
			cont_scale = 1.0
		endif
	endif
	if structurecontains structure = <chosen_scale> chromatic
		chromatic = 1
		background_dim = (195.0, 250.0)
		if gotparam \{scale_edit}
			if NOT (<instrument> = 0)
				<cont_pos> = (<cont_pos> - (12.0, 0.0))
			endif
		endif
	else
		chromatic = 0
		cont_pos = <cont_pos>
		background_dim = (168.0, 250.0)
	endif
	if gotparam \{scale_edit}
		if (<instrument> = 0)
			<cont_pos> = (<cont_pos> - (33.0, 0.0))
		endif
	endif
	num_notes = 7
	if (<instrument> = 0)
		<x_buttons> = -95
		<x_notes> = 25
		<x_notes_off> = 22
		<y_buttons> = 78
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
	else
		<x_buttons> = -95
		<x_notes> = 22
		<x_notes_off> = 22
		<y_buttons> = 78
		<y_notes> = 95
		<y_inc> = 30
		<buttons> = [
			[0 0 0 0 0]
			[1 0 0 0 0]
			[0 2 0 0 0]
			[0 0 3 0 0]
			[0 0 0 4 0]
			[0 0 0 0 5]
			[0 0 0 4 5]
		]
		guitar_jam_scales_get_diatonic instrument = <instrument>
		if NOT (<diatonic> = 1)
			<num_notes> = 6
			<background_dim> = (<background_dim> - (0.0, 30.0))
		endif
	endif
	if screenelementexists \{id = ghmix_scale_reference}
		destroyscreenelement \{id = ghmix_scale_reference}
	endif
	createscreenelement {
		type = containerelement
		id = ghmix_scale_reference
		parent = musicstudio_ghmix
		pos = <cont_pos>
		z_priority = 22
		alpha = 0
		scale = <cont_scale>
	}
	current_root = ($jam_track_rootnotes [<instrument>])
	<cur_active_scale_name> = ($jam_track_scales_new [<instrument>])
	<cur_scale> = ($<cur_active_scale_name>)
	<loop_count> = 0
	begin
	<cur_buttons> = (<buttons> [<loop_count>])
	<inner_loop_count> = 0
	begin
	<cur_button> = (<cur_buttons> [<inner_loop_count>])
	<sprite> = ghmix_generic_button
	rgba = [255 255 255 255]
	switch (<cur_button>)
		case 0
		<rgba> = [50 50 50 255]
		case 1
		<rgba> = [55 116 61 255]
		case 2
		<rgba> = [151 68 85 255]
		case 3
		<rgba> = [185 171 71 255]
		case 4
		<rgba> = [68 92 131 255]
		case 5
		<rgba> = [154 80 56 255]
	endswitch
	createscreenelement {
		type = spriteelement
		parent = ghmix_scale_reference
		texture = <sprite>
		just = [left bottom]
		rgba = <rgba>
		pos = (((<x_buttons> + (<inner_loop_count> * <x_notes_off>)) * (1.0, 0.0)) + ((<y_buttons> + (<y_inc> * <loop_count>)) * (0.0, 1.0)))
		scale = 0.52
		z_priority = 22
		rot_angle = 90
	}
	<inner_loop_count> = (<inner_loop_count> + 1)
	repeat 5
	<note_struct> = (<cur_scale> [<loop_count>])
	musicstudio_scale_get_note_text string = (<note_struct> [0]) fret = (<note_struct> [1]) root = <current_root> scale = <chosen_scale_index>
	if (<chromatic> = 1)
		main_text = <note_text>
		if (<instrument> = 0)
			<note_struct> = (<cur_scale> [<loop_count> + 7])
		else
			<note_struct> = (<cur_scale> [<loop_count> + 6])
		endif
		musicstudio_scale_get_note_text string = (<note_struct> [0]) fret = (<note_struct> [1]) root = <current_root> scale = <chosen_scale_index>
		formattext textname = note_text qs(0xc0962e7a) a = <main_text> b = <note_text>
	else
		final_text = <note_text>
	endif
	if (<instrument> = 0)
		chord_pattern_array_name = (<chosen_scale>.chord_pattern)
		chord_pattern_array = ($<chord_pattern_array_name>)
		chord_index = (<chord_pattern_array> [<loop_count>])
		chord_text = ($rhythm_chord_types [<chord_index>].small_name_text)
		if ($jam_rhythm_chord_type = 1)
			formattext textname = note_text qs(0x646d1d57) a = <note_text> b = <chord_text>
		else
			formattext textname = note_text qs(0xb7dde38c) a = <note_text> b = <chord_text>
		endif
	endif
	createscreenelement {
		<note_text_params>
		parent = ghmix_scale_reference
		pos = ((<x_notes> * (1.0, 0.0)) + ((<y_notes> + (<y_inc> * <loop_count>)) * (0.0, 1.0)))
		text = <note_text>
		internal_just = [left , center]
		z_priority = 22
		rgba = [113 121 133 255]
		dims = (95.0, 33.0)
		fit_height = `scale down if larger`
		fit_width = `scale each line if larger`
	}
	<loop_count> = (<loop_count> + 1)
	repeat <num_notes>
	ghmix_scale_reference :se_setprops \{alpha = 1
		time = 0}
endscript

script jam_ghmix_remove_scale_reference 
	if screenelementexists \{id = jam_ghmix_scale_reference}
		jam_ghmix_scale_reference :se_setprops \{alpha = 0
			time = 0}
		jam_ghmix_scale_reference :se_waitprops
		destroyscreenelement \{id = jam_ghmix_scale_reference}
	endif
endscript

script musicstudio_scale_reference_highlight \{button_num = 0}
	if screenelementexists \{id = scale_reference_highlight}
		destroyscreenelement \{id = scale_reference_highlight}
	endif
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	dims = (165.0, 31.0)
	if (<instrument> = 0)
		<dims> = (225.0, 31.0)
	endif
	if screenelementexists \{id = ghmix_scale_reference}
		<x_buttons> = -102
		<y_buttons> = 109
		<y_inc> = 30
		createscreenelement {
			type = spriteelement
			id = scale_reference_highlight
			parent = ghmix_scale_reference
			pos = (<x_buttons> * (1.0, 0.0) + (0.0, 1.0) + ((<y_buttons> + (<y_inc> * <button_num>)) * (0.0, 1.0)))
			z_priority = 10
			alpha = 1
			texture = white
			dims = <dims>
			just = [left bottom]
			rgba = [150 150 150 255]
		}
	endif
endscript

script musicstudio_remove_scale_reference_highlight 
	if screenelementexists \{id = scale_reference_highlight}
		destroyscreenelement \{id = scale_reference_highlight}
	endif
endscript

script musicstudio_ghmix_remove_scale_reference 
	if screenelementexists \{id = ghmix_scale_reference}
		destroyscreenelement \{id = ghmix_scale_reference}
	endif
endscript
jam_roots = [
	{
		name_text = qs(0x69bdca15)
	}
	{
		name_text = qs(0x429099d6)
	}
	{
		name_text = qs(0xe0187c88)
	}
	{
		name_text = qs(0x5b8ba897)
	}
	{
		name_text = qs(0x94ad3a75)
	}
	{
		name_text = qs(0x0dd10f11)
	}
	{
		name_text = qs(0x8618959b)
	}
	{
		name_text = qs(0x26fc5cd2)
	}
	{
		name_text = qs(0x3fe76d93)
	}
	{
		name_text = qs(0xd7c68cba)
	}
	{
		name_text = qs(0x70a6fb54)
	}
	{
		name_text = qs(0x1bcfad22)
	}
]
musicstudio_chromatic_notes_sharps = [
	{
		name_text = qs(0x69bdca15)
	}
	{
		name_text = qs(0x429099d6)
	}
	{
		name_text = qs(0xe0187c88)
	}
	{
		name_text = qs(0x5b8ba897)
	}
	{
		name_text = qs(0x58a41bed)
	}
	{
		name_text = qs(0x0dd10f11)
	}
	{
		name_text = qs(0x7dcf4431)
	}
	{
		name_text = qs(0x26fc5cd2)
	}
	{
		name_text = qs(0x3fe76d93)
	}
	{
		name_text = qs(0xd7c68cba)
	}
	{
		name_text = qs(0x70a6fb54)
	}
	{
		name_text = qs(0x4a11b403)
	}
]
musicstudio_chromatic_notes_flats = [
	{
		name_text = qs(0x69bdca15)
	}
	{
		name_text = qs(0x429099d6)
	}
	{
		name_text = qs(0xb1c665a9)
	}
	{
		name_text = qs(0x5b8ba897)
	}
	{
		name_text = qs(0x94ad3a75)
	}
	{
		name_text = qs(0x0dd10f11)
	}
	{
		name_text = qs(0x8618959b)
	}
	{
		name_text = qs(0x26fc5cd2)
	}
	{
		name_text = qs(0x3fe76d93)
	}
	{
		name_text = qs(0xa373ca47)
	}
	{
		name_text = qs(0x70a6fb54)
	}
	{
		name_text = qs(0x1bcfad22)
	}
]

script musicstudio_get_list_checksum_notes 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	root = ($jam_track_rootnotes [<instrument>])
	major_flats = [0 1 0 0 1 0 1 0 0 0 0 1]
	show_flats = (<major_flats> [<root>])
	if (<show_flats> = 1)
		return \{list_checksum = musicstudio_chromatic_notes_flats}
	else
		return \{list_checksum = musicstudio_chromatic_notes_sharps}
	endif
endscript

script musicstudio_scale_get_note_text 
	requireparams \{[
			string
			fret
			root
			scale
		]
		all}
	major_flats = [0 1 0 0 1 0 1 0 0 0 0 1]
	minor_flats = [0 1 0 1 1 0 1 0 1 0 1 1]
	blues_flats = [0 1 0 1 1 1 1 0 1 0 1 1]
	note_text = [qs(0x33285640) qs(0x18050583) qs(0x011e34c2) qs(0x57449344) qs(0x7c69c087) qs(0x6572f1c6) qs(0x2a336701)]
	show_flats = 0
	major = 0
	minor = 0
	switch <scale>
		case 0
		<show_flats> = (<major_flats> [<root>])
		<major> = 1
		case 1
		<show_flats> = (<major_flats> [<root>])
		<major> = 1
		case 2
		<show_flats> = (<minor_flats> [<root>])
		<minor> = 1
		case 3
		<show_flats> = (<minor_flats> [<root>])
		<minor> = 1
		case 4
		<show_flats> = (<blues_flats> [<root>])
		case 5
		<show_flats> = (<minor_flats> [<root>])
		<minor> = 1
		case 6
		<show_flats> = (<minor_flats> [<root>])
		<minor> = 1
		case 7
		<show_flats> = (<minor_flats> [<root>])
		<minor> = 1
		case 8
		<show_flats> = (<major_flats> [<root>])
		<major> = 1
		case 9
		<show_flats> = (<minor_flats> [<root>])
		<minor> = 1
		case 10
		<show_flats> = (<major_flats> [<root>])
		<major> = 1
		case 11
		<show_flats> = (<major_flats> [<root>])
		<major> = 1
	endswitch
	musicstudio_scale_get_note_num string = <string> fret = <fret> show_flats = <show_flats>
	if (<major> = 1)
		make_sharp = 0
		if (<root> = 2 && <note_num_octave> = 1 && <is_sharp_flat> = 0)
			<make_sharp> = 1
		elseif (<root> = 9 && <note_num_octave> = 1 && <is_sharp_flat> = 0)
			<make_sharp> = 1
		elseif (<root> = 9 && <note_num_octave> = 5 && <is_sharp_flat> = 0)
			<make_sharp> = 1
		endif
		if (<make_sharp> = 1)
			<note_num_octave> = (<note_num_octave> - 1)
			<note_num> = (<note_num> - 1)
			<is_sharp_flat> = 1
		endif
	elseif (<minor> = 1)
		make_flat = 0
		if (<root> = 4 && <note_num_octave> = 4 && <is_sharp_flat> = 0)
			<make_flat> = 1
		elseif (<root> = 4 && <note_num_octave> = 0 && <is_sharp_flat> = 0)
			<make_flat> = 1
		elseif (<root> = 11 && <note_num_octave> = 4 && <is_sharp_flat> = 0)
			<make_flat> = 1
		endif
		if (<make_flat> = 1)
			<is_sharp_flat> = -1
		endif
	endif
	if (<is_sharp_flat> = -1)
		if ((<note_num_octave> + 1) > 6)
			<note_num_octave> = 0
		else
			<note_num_octave> = (<note_num_octave> + 1)
		endif
		<note_num> = (<note_num> + 1)
		formattext textname = note_text qs(0x425f2b2b) a = (<note_text> [<note_num_octave>])
	elseif (<is_sharp_flat> = 1)
		formattext textname = note_text qs(0xab3d556f) a = (<note_text> [<note_num_octave>])
	else
		formattext textname = note_text qs(0x0bc409e2) a = (<note_text> [<note_num_octave>])
	endif
	return note_text = <note_text> note_num = <note_num> is_sharp_flat = <is_sharp_flat> full_note_num = <full_note_num>
endscript

script musicstudio_scale_get_note_num 
	requireparams \{[
			string
			fret
			show_flats
		]
		all}
	note_offset_array = [0 5 10 15 19 24]
	note_offset = (<note_offset_array> [<string>])
	note_num = (<note_offset_array> [<string>] + <fret>)
	sharp_flat_offset_array = [0 0 1 0 1 0 1 0 0 1 0 1]
	curr_note_num = <note_num>
	full_note_num = <note_num>
	curr_note_count = 0
	is_sharp_flat = 0
	if (<curr_note_num> > 0)
		begin
		if (<curr_note_count> = 12)
			<curr_note_count> = 0
		endif
		sharp_flat_offset = (<sharp_flat_offset_array> [<curr_note_count>])
		if (<show_flats> = 0)
			<is_sharp_flat> = (<sharp_flat_offset_array> [<curr_note_count>])
		else
			<is_sharp_flat> = (-1 * (<sharp_flat_offset_array> [<curr_note_count>]))
		endif
		<note_num> = (<note_num> - <sharp_flat_offset>)
		<curr_note_count> = (<curr_note_count> + 1)
		repeat (<curr_note_num> + 1)
	endif
	note_num_octave = 0
	if (<note_num> > 0)
		begin
		<note_num_octave> = (<note_num_octave> + 1)
		if (<note_num_octave> = 7)
			<note_num_octave> = 0
		endif
		repeat <note_num>
	endif
	return note_num = <note_num> note_num_octave = <note_num_octave> is_sharp_flat = <is_sharp_flat> full_note_num = <full_note_num>
endscript

script musicstudio_show_scale_staff_reference 
	if NOT screenelementexists \{id = musicstudio_ghmix}
		return
	endif
	if screenelementexists \{id = ghmix_scale_staff_reference}
		destroyscreenelement \{id = ghmix_scale_staff_reference}
	endif
	createscreenelement \{type = containerelement
		id = ghmix_scale_staff_reference
		parent = musicstudio_ghmix
		pos = (190.0, 394.0)
		z_priority = 30
		alpha = 1
		dims = (100.0, 100.0)}
	createscreenelement \{type = spriteelement
		parent = ghmix_scale_staff_reference
		pos = (-20.0, -53.0)
		z_priority = 30
		alpha = 1
		scale = 1.55
		texture = bass_clef
		dims = (64.0, 64.0)
		just = [
			left
			center
		]
		rgba = [
			113
			121
			133
			255
		]}
	createscreenelement \{type = spriteelement
		parent = ghmix_scale_staff_reference
		pos = (-20.0, -164.0)
		z_priority = 30
		alpha = 1
		texture = treble_clef
		dims = (64.0, 128.0)
		scale = 1.55
		just = [
			left
			center
		]
		rgba = [
			113
			121
			133
			255
		]}
	note_size = (0.0, -20.0)
	count = 0
	begin
	if NOT (<count> = 5)
		createscreenelement {
			type = spriteelement
			parent = ghmix_scale_staff_reference
			pos = ((0.0, 0.0) + (<note_size> * <count>))
			z_priority = 30
			alpha = 1
			texture = white
			dims = (380.0, 2.0)
			just = [left center]
			rgba = [113 121 133 255]
		}
	endif
	<count> = (<count> + 1)
	repeat 11
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	cur_active_scale_name = ($jam_track_scales_new [<instrument>])
	cur_scale = ($<cur_active_scale_name>)
	num_notes = 7
	guitar_jam_scales_get_diatonic instrument = <instrument>
	if NOT (<diatonic> = 1)
		<num_notes> = 6
	endif
	scale_index = ($jam_track_scaleindex [<instrument>])
	root_index = ($jam_track_rootnotes [<instrument>])
	low_e_pos = ((0.0, -10.0) * 5)
	index = 0
	x_start = (58.0, 0.0)
	x_offset = (45.0, 0.0)
	begin
	cur_note = (<cur_scale> [<index>])
	string = (<cur_note> [0])
	fret = (<cur_note> [1])
	musicstudio_scale_get_note_text string = <string> fret = <fret> root = <root_index> scale = <scale_index>
	createscreenelement {
		type = spriteelement
		parent = ghmix_scale_staff_reference
		pos = ((<x_offset> * <index> + <x_start>) + (<low_e_pos> + ((0.0, -10.0) * <note_num>)))
		z_priority = 40
		alpha = 1
		texture = whole
		dims = (64.0, 64.0)
		just = [left center]
		rgba = [200 200 200 255]
	}
	if (<is_sharp_flat> = 1)
		sharp_offset = (-7.0, -1.0)
		createscreenelement {
			type = spriteelement
			parent = ghmix_scale_staff_reference
			pos = ((<x_offset> * <index> + <x_start> + <sharp_offset>) + (<low_e_pos> + ((0.0, -10.0) * <note_num>)))
			z_priority = 45
			alpha = 1
			texture = sharp
			dims = (64.0, 64.0)
			just = [left center]
			rgba = [200 200 200 255]
			scale = 0.6
		}
	elseif (<is_sharp_flat> = -1)
		sharp_offset = (-13.0, -5.0)
		createscreenelement {
			type = spriteelement
			parent = ghmix_scale_staff_reference
			pos = ((<x_offset> * <index> + <x_start> + <sharp_offset>) + (<low_e_pos> + ((0.0, -10.0) * <note_num>)))
			z_priority = 45
			alpha = 1
			texture = flat
			dims = (64.0, 64.0)
			just = [left center]
			rgba = [200 200 200 255]
			scale = 0.8
		}
	endif
	num_lines = 0
	switch <note_num>
		case 5
		<num_lines> = 1
		case 17
		<num_lines> = 1
		case 18
		<num_lines> = 1
		<note_num> = (<note_num> - 1)
		case 19
		<num_lines> = 2
		case 20
		<num_lines> = 2
		<note_num> = (<note_num> - 1)
		case 21
		<num_lines> = 3
		case 22
		<num_lines> = 3
		<note_num> = (<note_num> - 1)
	endswitch
	if (<num_lines> > 0)
		line_offset = (13.0, 0.0)
		begin
		createscreenelement {
			type = spriteelement
			parent = ghmix_scale_staff_reference
			pos = ((<x_offset> * <index> + <x_start> + <line_offset>) + (<low_e_pos> + ((0.0, -10.0) * <note_num>)))
			z_priority = 30
			alpha = 1
			texture = white
			dims = (35.0, 2.0)
			just = [left center]
			rgba = [113 121 133 255]
			scale = 1
		}
		<note_num> = (<note_num> - 2)
		repeat <num_lines>
	endif
	<index> = (<index> + 1)
	repeat <num_notes>
endscript

script musicstudio_remove_scale_staff_reference 
	if screenelementexists \{id = ghmix_scale_staff_reference}
		destroyscreenelement \{id = ghmix_scale_staff_reference}
	endif
endscript

script musicstudio_get_bend_set_name_text 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	musicstudio_mainobj :musicstudio_getbendset track = ($jam_tracks [<instrument>].id)
	formattext textname = name_text qs(0xf34775f6) s = ($musicstudio_bend_sets [<bend_set>].name_text)
	return name_text = <name_text>
endscript

script musicstudio_change_bend_set_deinit 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	jam_stop_sound jam_instrument = <instrument>
	killspawnedscript \{name = musicstudio_preview_bend_set_spawn}
endscript

script musicstudio_change_bend_set 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	musicstudio_mainobj :musicstudio_setbendset track = ($jam_tracks [<instrument>].id) bend_set = <index>
endscript

script musicstudio_get_selected_bend_set 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	musicstudio_mainobj :musicstudio_getbendset track = ($jam_tracks [<instrument>].id)
	return selected = <bend_set>
endscript

script musicstudio_get_list_checksum_bend_sets 
	return \{list_checksum = musicstudio_bend_sets}
endscript

script musicstudio_preview_bend_set 
	musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
	<player_object> :musicstudioplayer_getinstrument
	jam_stop_sound jam_instrument = <instrument>
	killspawnedscript \{name = musicstudio_audible_scale_preview_spawn}
	killspawnedscript \{name = musicstudio_preview_bend_set_spawn}
	musicstudio_mainobj :obj_spawnscriptnow musicstudio_preview_bend_set_spawn params = {instrument = <instrument> index = <index>}
endscript

script musicstudio_preview_bend_set_spawn 
	wait \{0.2
		seconds}
	last_sound = null
	expressive_type = 0
	delay_between_notes = 1
	begin
	jam_get_sample jam_instrument = <instrument> button = 0 tilt = 0 chord_dir = 0
	bend_set = ($musicstudio_bend_sets [<index>].bend_set)
	curr_bend = ($<bend_set> [<expressive_type>])
	expressive_struct = ($musicstudio_expressive_types [<curr_bend>])
	if structurecontains structure = <expressive_struct> bend
		curr_bend_name = (<expressive_struct>.bend)
		curr_bend_struct = ($<curr_bend_name>)
		if structurecontains structure = <curr_bend_struct> bend_from_last_note
			musicstudio_scale_get_note_num string = <note_string> fret = <note_fret> show_flats = 0
			musicstudio_mainobj :musicstudio_setlastpitch {
				track_checksum = ($jam_tracks [<instrument>].id)
				last_pitch = (<full_note_num> + 2)
			}
		endif
	endif
	musicstudio_play_sound {
		instrument = <instrument>
		final_note_sample = <final_note_sample>
		pitch_shift = <pitch_shift>
		note_type = 0
		note_velocity = 100
		note_string = <note_string>
		note_fret = <note_fret>
		curr_bend = <curr_bend>
	}
	last_sound = <final_note_sample>
	wait <delay_between_notes> seconds
	<expressive_type> = (<expressive_type> + 1)
	repeat 5
	wait \{1
		seconds}
	stopsound <last_sound> fade_type = linear fade_time = $jam_fade_time
endscript
