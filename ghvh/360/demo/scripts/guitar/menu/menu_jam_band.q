jam_cont_start_pos = (330.0, 52.0)
jam_cont_offset = 205

script create_jam_band_menu \{editing = 0
		tutorial = 0
		song = none}
	set_focus_color \{rgba = [
			255
			255
			255
			255
		]}
	set_unfocus_color \{rgba = [
			210
			130
			0
			255
		]}
	change \{jam_num_falling_gems = 0}
	change \{debug_show_analog_options = 0}
	change \{select_shift = 0}
	destroy_bg_viewport
	setup_bg_viewport
	if (<editing> = 0)
		change \{jam_lead_octave_range = 1}
		change \{jam_melody_octave_range = 1}
	endif
	menu_music_off
	createscreenelement \{type = containerelement
		parent = root_window
		id = jam_band_container
		pos = (0.0, 800.0)}
	jam_band_container :settags \{allow_easy_backout = 1}
	jam_band_container :obj_spawnscript \{jam_recording_check_disconnect
		params = {
			recording_studio
		}}
	change \{target_jam_camera_prop = jam_band}
	jam_camera_wait
	createscreenelement \{type = spriteelement
		parent = jam_band_container
		id = jam_menu_backdrop
		texture = jam_screen
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 50}
	setplayerinfo \{1
		jam_instrument = -1}
	setplayerinfo \{2
		jam_instrument = -1}
	setplayerinfo \{3
		jam_instrument = -1}
	setplayerinfo \{4
		jam_instrument = -1}
	jam_settings_reinit_menu_sounds
	jam_setup_song editing = <editing> tutorial = <tutorial>
	num_players = ($num_jam_players)
	createscreenelement \{type = spriteelement
		parent = jam_band_container
		id = jam_band_black_banner
		texture = white
		just = [
			center
			top
		]
		rgba = [
			0
			0
			0
			255
		]
		pos = (640.0, 580.0)
		dims = (1280.0, 75.0)
		z_priority = 38}
	if (<tutorial> = 0)
		if (<editing> = 1)
			jam_get_display_name filename = ($jam_selected_song)
			formattext textname = song_name_text qs(0x8b1f3160) a = <display_name>
		else
			formattext \{textname = song_name_text
				qs(0xd9070aee)}
			change jam_selected_song = <song_name_text>
		endif
		createscreenelement {
			type = textblockelement
			id = jam_song_name_text
			parent = jam_band_container
			font = text_a1
			just = [right bottom]
			dims = (280.0, 36.0)
			internal_just = [right center]
			z_priority = 90
			rgba = [180 180 180 255]
			pos = (1050.0, 634.0)
			text = <song_name_text>
			shadow
			shadow_offs = (5.0, 5.0)
			shadow_rgba = [0 0 0 255]
			fit_height = `scale down if larger`
			fit_width = `scale each line if larger`
		}
	endif
	runscriptonscreenelement \{id = jam_band_container
		legacydomorph
		params = {
			pos = (0.0, 0.0)
			time = 0.2
		}}
	clean_up_user_control_helpers
	if (<tutorial> = 1)
		add_user_control_helper \{text = qs(0x784c64ff)
			button = start
			z = 100}
	else
		menu_jam_band_default_control_helpers
		spawnscriptnow \{jam_poll_for_controller_changes
			id = jam_band_spawns
			params = {
			}}
	endif
endscript

script menu_jam_band_default_control_helpers 
	clean_up_user_control_helpers
	menu_jam_band_add_control_helpers
endscript

script menu_jam_band_add_control_helpers \{state = null}
	clean_up_user_control_helpers
	if ($game_mode = training)
		if screenelementexists \{id = jam_band_container}
			<skip_button> = start
		elseif screenelementexists \{id = jam_studio_element}
			<skip_button> = back
		endif
		add_user_control_helper text = qs(0x784c64ff) button = <skip_button> z = 100
	endif
	switch <state>
		case pause_menu
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0x00688155)
			button = start
			z = 100}
		case pause_submenu
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100}
		if NOT ($game_mode = training)
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100}
		endif
		case effects_menu
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100}
		add_user_control_helper \{text = qs(0x00688155)
			button = start
			z = 100}
		case instrument_ui
		if NOT ($game_mode = training)
			add_user_control_helper \{text = qs(0x48a351fa)
				button = start
				z = 100}
		endif
		i = 1
		begin
		getplayerinfo <i> jam_instrument
		if NOT ((<jam_instrument> = -1) || (<jam_instrument> = 4))
			add_user_control_helper \{text = qs(0xbdcf8d77)
				button = back
				z = 100}
			break
		endif
		i = (<i> + 1)
		repeat 4
		default
		if screenelementexists \{id = jam_studio_element}
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100}
			if NOT ($game_mode = training)
				add_user_control_helper \{text = qs(0x48a351fa)
					button = start
					z = 100}
			endif
			add_user_control_helper text = ($jam_ghmix_text_skip_backwards) button = yellow z = 100
			add_user_control_helper text = ($jam_ghmix_text_skip_forwards) button = blue z = 100
		elseif screenelementexists \{id = jam_band_container}
			if NOT ($game_mode = training)
				add_user_control_helper \{text = qs(0x48a351fa)
					button = start
					z = 100}
			endif
		endif
	endswitch
endscript

script jam_controller_can_use_mic 
	requireparams \{[
			controller
		]
		all}
	if is_regular_controller controller = <controller>
		if NOT ($allow_controller_for_all_instruments = 1)
			if has_usb_mic_plugged_in
			elseif controller_has_headset controller = <controller>
			else
				return \{false}
			endif
		endif
	endif
	return \{true}
endscript

script jam_poll_for_controller_changes 
	active_controllers = [0 0 0 0]
	prev_active_controllers = [0 0 0 0]
	prev_active_mic = [0 0 0 0]
	prev_controller_types = [none none none none]
	begin
	active_controllers = [0 0 0 0]
	getactivecontrollers
	count = 0
	<num_controllers> = 0
	begin
	<is_active_controller> = (<active_controllers> [<count>])
	<player_num> = (<count> + 1)
	if is_regular_controller controller = <count>
		if isjammicdisconnected
			if NOT ((<prev_active_mic> [<count>]) = 0)
				getplayerinfo <player_num> jam_instrument
				if (<jam_instrument> = 5)
					setplayerinfo <player_num> jam_instrument = -1
					jam_destroy_player player = <player_num>
					jam_create_player_container player = <player_num>
				endif
			endif
			setarrayelement arrayname = prev_active_mic index = <count> newvalue = 0
		else
			setarrayelement arrayname = prev_active_mic index = <count> newvalue = 1
		endif
	endif
	<prev_controller_type> = (<prev_controller_types> [<count>])
	<curr_controller_type> = standard
	if (<is_active_controller> = 0)
		<curr_controller_type> = none
	elseif isguitarcontroller controller = <count>
		<curr_controller_type> = guitar
	elseif isdrumcontroller controller = <count>
		if isrbdrum controller = <count>
			<curr_controller_type> = drum_rb
		else
			<curr_controller_type> = drum_gh
		endif
	endif
	setarrayelement arrayname = prev_controller_types index = <count> newvalue = <curr_controller_type>
	if (<is_active_controller> = 1)
		if NOT (<prev_controller_type> = <curr_controller_type>)
			<is_active_controller> = 0
		endif
	endif
	if NOT (<is_active_controller> = (<prev_active_controllers> [<count>]))
		if (<is_active_controller> = 1)
			setarrayelement arrayname = prev_active_controllers index = <count> newvalue = 1
			setarrayelement arrayname = prev_controller_types index = <count> newvalue = <curr_controller_type>
			setplayerinfo <player_num> controller = <count>
			if isdrumcontroller controller = <count>
				setplayerinfo <player_num> part = drum
			endif
			if isguitarcontroller controller = <count>
				setplayerinfo <player_num> part = guitar
			endif
			jam_create_player_container player = <player_num>
		elseif (<is_active_controller> = 0)
			setarrayelement arrayname = prev_active_controllers index = <count> newvalue = 0
			setarrayelement arrayname = prev_controller_types index = <count> newvalue = none
			getplayerinfo <player_num> jam_instrument
			if (<jam_instrument> = 4)
				jam_input_melody_stop_sound
			endif
			jam_destroy_player player = <player_num>
			setplayerinfo <player_num> jam_instrument = -1
			guitar_jam_simplerecops_command_stopplay
		endif
	endif
	<count> = (<count> + 1)
	repeat ($num_jam_players)
	wait \{1
		gameframes}
	repeat
endscript

script jam_create_player_container 
	formattext checksumname = player_cont 'inst_player_cont_%s' s = <player>
	shutdownjammic
	createscreenelement {
		type = containerelement
		parent = jam_band_container
		id = <player_cont>
		pos = ($jam_cont_start_pos + (1.0, 0.0) * ($jam_cont_offset * (<player> - 1)))
	}
	if gotparam \{player}
		switch <player>
			case 1
			playsound \{jam_pause_panel_in
				vol = -16
				pitch = -0.5
				buss = front_end
				pan1x = -0.15
				pan1y = 1
				pan2x = -0.15
				pan2y = 1}
			case 2
			playsound \{jam_pause_panel_in
				vol = -16
				pitch = 0
				buss = front_end
				pan1x = -0.05
				pan1y = 1
				pan2x = -0.05
				pan2y = 1}
			case 3
			playsound \{jam_pause_panel_in
				vol = -16
				pitch = 0.5
				buss = front_end
				pan1x = 0.05
				pan1y = 1
				pan2x = 0.05
				pan2y = 1}
			case 4
			playsound \{jam_pause_panel_in
				vol = -16
				pitch = 1
				buss = front_end
				pan1x = 0.15
				pan1y = 1
				pan2x = 0.15
				pan2y = 1}
		endswitch
	endif
	spawnscriptnow id = jam_band_spawns jam_create_select_instrument_menu params = {player = <player> player_cont = <player_cont> morph = 1}
endscript
jam_band_recording = 0
jam_band_pixels_per_second = (0.0, 0.0)
jam_band_playline_pos = (0.0, 0.0)
jam_band_song_length = 0
jam_band_new_song = 0

script jam_setup_song \{advanced_record = 0
		tutorial = 0}
	change \{jam_current_quantize = 9}
	change \{jam_highway_recording_mode = 1}
	reset_song_time \{starttime = 0}
	change \{jam_highway_play_time = 0}
	change \{jam_highway_playing = 0}
	change \{jam_band_recording = 0}
	change \{jam_current_drum_loop = 0}
	change \{is_drum_machine = 0}
	change \{is_percussion_kit = 0}
	change \{is_arpeggiator = [
			0
			0
			0
			0
			0
			0
		]}
	change \{jam_arpeggiator_current_pattern = [
			0
			0
			0
			0
			0
		]}
	change \{jam_current_arpeggiator = [
			0
			0
			0
			0
			0
		]}
	change \{jam_current_arpeggiator_modifier = [
			0
			0
			0
			0
			0
		]}
	change \{jam_current_arpeggiator_type = [
			2
			2
			2
			2
			2
		]}
	change \{jam_current_arpeggiator_note_count = [
			0
			0
			0
			0
			0
		]}
	change \{jam_current_arpeggiator_whammy = [
			0
			0
			0
			0
			0
		]}
	change \{jam_player_recording_armed = [
			0
			0
			0
			0
		]}
	change \{jam_player_recording_begin_time = [
			0
			0
			0
			0
		]}
	change \{jam_rhythm_chord_type = 0}
	change \{jam_lead_octave_range = 1}
	change \{jam_melody_octave_range = 1}
	song = editable
	if (<editing> = 1)
		guitar_jam_effects_toggle_active \{jam_instrument = 0
			force_state = on}
		guitar_jam_effects_toggle_active \{jam_instrument = 1
			force_state = on}
		guitar_jam_effects_toggle_active \{jam_instrument = 2
			force_state = on}
		guitar_jam_effects_toggle_active \{jam_instrument = 4
			force_state = on}
		getarraysize \{$jam_tracks}
		index = 0
		begin
		settrackinfo track = ($jam_tracks [<index>].id) bpm = ($jam_current_bpm)
		<index> = (<index> + 1)
		repeat <array_size>
		jam_init_volumes
		jam_init_pan
		jam_get_display_name filename = ($jam_selected_song)
		formattext textname = title_text qs(0xb2b7d449) s = <display_name> b = $jam_current_bpm
	else
		if ((<advanced_record> = 1) || (<tutorial> = 1))
			jam_setup_new_song
			change \{jam_current_bpm = 120}
			settrackinfo track = rhythm bpm = ($jam_current_bpm)
		endif
	endif
	if gotparam \{title_text}
		printf channel = jam_mode qs(0x73307931) s = <title_text>
	endif
	if (<advanced_record> = 0)
		jam_band_create_highway song = <song>
	endif
endscript

script jam_band_create_highway 
	printf \{channel = jam_mode
		qs(0x2019133c)}
	jam_band_highway_pos = (223.0, 611.0)
	jam_band_highway_height = 52
	highway_priority = 40
	suffix = '_fretbars'
	appendsuffixtochecksum base = <song> suffixstring = <suffix>
	song_fretbars = <appended_id>
	suffix = '_timesig'
	appendsuffixtochecksum base = <song> suffixstring = <suffix>
	song_timesig = <appended_id>
	getarraysize $<song_fretbars>
	suffix = '_size'
	appendsuffixtochecksum base = <song_fretbars> suffixstring = <suffix>
	<fretbar_array_size> = <appended_id>
	createscreenelement {
		type = containerelement
		parent = jam_band_container
		id = jam_band_highway_master
		just = [center center]
		pos = <jam_band_highway_pos>
		scale = 1
		rot_angle = 0
	}
	createscreenelement \{type = containerelement
		parent = jam_band_highway_master
		id = jam_band_highway
		pos = (0.0, 0.0)
		scale = 1}
	song_length = ($<song_fretbars> [(($<fretbar_array_size>) - 1)])
	song_length_seconds = (<song_length> / 1000.0)
	fit_in_width = 820.0
	pixels_per_second = ((<fit_in_width> / <song_length_seconds>) * (1.0, 0.0))
	change jam_band_pixels_per_second = <pixels_per_second>
	change \{jam_band_playline_pos = (0.0, 0.0)}
	change jam_band_song_length = <song_length>
	bar_size = ((<song_length> / 1000.0) * <pixels_per_second>)
	createscreenelement {
		type = spriteelement
		parent = jam_band_highway
		texture = white
		just = [left center]
		rgba = [0 0 0 255]
		pos = (0.0, 0.0)
		dims = (((0.0, 1.0) * <jam_band_highway_height>) + <bar_size>)
		z_priority = <highway_priority>
	}
	createscreenelement \{type = containerelement
		parent = jam_band_highway
		id = jam_band_highway_playline
		pos = (0.0, 0.0)
		scale = 1}
	createscreenelement {
		type = spriteelement
		parent = jam_band_highway_playline
		texture = jam_marker
		just = [left center]
		rgba = [200 200 200 255]
		pos = (-5.0, 0.0)
		z_priority = (<highway_priority> + 3)
	}
	if screenelementexists \{id = jam_band_highway_bars_container}
		destroyscreenelement \{id = jam_band_highway_bars_container}
	endif
	createscreenelement \{type = containerelement
		parent = jam_band_highway
		id = jam_band_highway_bars_container
		pos = (0.0, 0.0)}
	count = 0
	begin
	curr_time = ($<song_fretbars> [<count>])
	mod a = <count> b = 10
	if (<mod> = 0)
		bar_pos = ((<curr_time> / 1000.0) * <pixels_per_second>)
		createscreenelement {
			type = spriteelement
			parent = jam_band_highway_bars_container
			texture = white
			just = [center center]
			rgba = [40 40 40 255]
			pos = <bar_pos>
			dims = ((1.0, 0.0) + ((0.0, 1.0) * <jam_band_highway_height>))
			z_priority = (<highway_priority> + 1)
		}
	endif
	<count> = (<count> + 1)
	if (<count> > (($<fretbar_array_size>) - 1))
		break
	endif
	repeat
	spawnscriptnow jam_band_update_highway id = jam_band_spawns params = {<...>}
endscript

script jam_band_update_highway 
	begin
	spawnscriptnow jam_band_update_highway_detailed params = {<...>}
	begin
	if ($jam_band_recording = 1)
		<begin_pos> = ($jam_band_playline_pos + ((($jam_highway_play_time) / 1000.0) * $jam_band_pixels_per_second))
		<begin_time> = ($jam_highway_play_time)
		begin
		spawnscriptnow jam_band_update_highway_simple params = {<...>}
		if ($jam_band_recording = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
		break
	endif
	wait \{1
		gameframe}
	repeat
	wait \{1
		gameframe}
	repeat
endscript

script jam_band_update_highway_detailed 
	highway_priority = 50
	block_seperation = 1000
	getarraysize \{$jam_tracks}
	index = 0
	track_offset = 10
	begin
	getjamsessionsize track = ($jam_tracks [<index>].id)
	bar_pos = ((0.0, 1.0) * (<track_offset> * (<index> + 1)))
	bar_pos = (<bar_pos> - ((0.0, 1.0) * 30))
	formattext checksumname = track_id_simple 'track_id_simple_%s' s = <index>
	if screenelementexists id = <track_id_simple>
		destroyscreenelement id = <track_id_simple>
	endif
	formattext checksumname = track_id 'track_id_%s' s = <index>
	if screenelementexists id = <track_id>
		destroyscreenelement id = <track_id>
	endif
	createscreenelement {
		type = containerelement
		parent = jam_band_highway
		just = [left center]
		id = <track_id>
		pos = <bar_pos>
		z_priority = (<highway_priority> + 2)
	}
	<gem_array> = ($jam_tracks [<index>].gem_array)
	start_block_time = -1
	end_block_time = -1
	block_index = 0
	begin
	if (<track_size> <= 0)
		break
	endif
	getjamsessionsound track = ($jam_tracks [<index>].id) index = (<block_index>)
	getnotetrackitem name = <gem_array> index = (<block_index> * 2)
	if (<start_block_time> < 0)
		<start_block_time> = <time>
		<end_block_time> = (<time> + <gem_length>)
	endif
	if (((<time> + <gem_length>) - <end_block_time>) >= <block_seperation>)
		block_start = ((<start_block_time> / 1000.0) * <pixels_per_second>)
		block_end = (((<end_block_time> - <start_block_time>) / 1000.0) * <pixels_per_second>)
		printf 'drawing a block from %a to %b, i=%c' a = <block_start> b = <block_end> c = <block_index>
		createscreenelement {
			type = spriteelement
			parent = <track_id>
			texture = white
			just = [left center]
			rgba = ($jam_tracks [<index>].color)
			pos = <block_start>
			dims = ((0.0, 5.0) + <block_end>)
			z_priority = (<highway_priority> + 5)
		}
		<start_block_time> = <time>
	endif
	<end_block_time> = (<time> + <gem_length>)
	<block_index> = (<block_index> + 1)
	repeat <track_size>
	if (<block_index> >= <track_size>)
		block_start = ((<start_block_time> / 1000.0) * <pixels_per_second>)
		block_end = (((<end_block_time> - <start_block_time>) / 1000.0) * <pixels_per_second>)
		createscreenelement {
			type = spriteelement
			parent = <track_id>
			texture = white
			just = [left center]
			rgba = ($jam_tracks [<index>].color)
			pos = <block_start>
			dims = ((0.0, 5.0) + <block_end>)
			z_priority = (<highway_priority> + 5)
		}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script jam_band_update_highway_simple 
	highway_priority = 50
	getarraysize \{$jam_tracks}
	index = 0
	track_offset = 10
	begin
	<show_bar> = 1
	player_has_inst = 0
	player = 1
	begin
	getplayerinfo <player> jam_instrument
	if (<jam_instrument> = <index>)
		<player_has_inst> = <player>
		break
	endif
	<player> = (<player> + 1)
	repeat 4
	if (<player_has_inst> > 0)
		if ($jam_player_recording_armed [(<player_has_inst> - 1)] = 1)
			begin_pos = ($jam_band_playline_pos + (($jam_player_recording_begin_time [(<player_has_inst> - 1)] / 1000.0) * $jam_band_pixels_per_second))
			bar_pos = <begin_pos>
			bar_pos = (<bar_pos> + ((0.0, 1.0) * (<track_offset> * (<index> + 1))))
			bar_pos = (<bar_pos> - ((0.0, 1.0) * 30))
			track_size = ((($jam_highway_play_time / 1000) * <pixels_per_second>) - (($jam_player_recording_begin_time [(<player_has_inst> - 1)] / 1000) * <pixels_per_second>))
			if (<show_bar> = 1)
				formattext checksumname = track_id 'track_id_simple_%s' s = <index>
				if screenelementexists id = <track_id>
					destroyscreenelement id = <track_id>
				endif
				<color> = [255 255 255 255]
				createscreenelement {
					type = spriteelement
					id = <track_id>
					parent = jam_band_highway
					texture = white
					just = [left center]
					rgba = <color>
					pos = <bar_pos>
					dims = ((0.0, 5.0) + <track_size>)
					z_priority = (<highway_priority> + 6)
				}
			endif
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script jam_create_select_instrument_menu \{player = 0}
	getplayerinfo <player> controller
	setplayerinfo <player> jam_instrument = -1
	if ($game_mode = training)
		jam_band_container :gettags
		if (<disable_inst_select> = 1)
			<controller> = 5
		endif
	endif
	band_leader_alpha = 0
	if (<controller> = $primary_controller)
		<band_leader_alpha> = 1
	endif
	formattext checksumname = inst_select_element 'inst_select_element_%a' a = <player>
	formattext textname = player_text qs(0x7bc47761) a = <player>
	createscreenelement {
		parent = <player_cont>
		id = <inst_select_element>
		type = descinterface
		desc = 'jam_player'
		pos = (-84.0, -400.0)
		exclusive_device = <controller>
		player_text = <player_text>
		band_leader_alpha = <band_leader_alpha>
	}
	inst_allow = -1
	<is_drums> = 0
	if isdrumcontroller controller = <controller>
		<inst_allow> = 3
		<is_drums> = 1
	endif
	<show_mic> = 0
	<is_gamepad> = 0
	if NOT isdrumcontroller controller = <controller>
		if NOT isguitarcontroller controller = <controller>
			if NOT ($allow_controller_for_all_instruments = 1)
				<show_mic> = 1
				<is_gamepad> = 1
			else
				<show_mic> = 2
			endif
		endif
	endif
	if (<controller> = ($primary_controller))
		resolvescreenelementid id = {<inst_select_element> child = {scroll_menu child = menu}}
		<resolved_id> :se_setprops event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_start jam_band_pause params = {select_player = <player> player_cont = <player_cont> event_cont = <resolved_id> hide_ghmix = <show_mic> paused_at_inst}}
			{pad_back jam_easy_backout params = {select_player = <player>}}
		]
	else
		resolvescreenelementid id = {<inst_select_element> child = {scroll_menu child = menu}}
		<resolved_id> :se_setprops event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	endif
	<base_icon_pos> = (-40.0, 108.0)
	<icon_offset> = 46
	<pause_font_color> = [80 80 80 255]
	set_focus_color \{rgba = [
			220
			220
			220
			255
		]}
	set_unfocus_color rgba = <pause_font_color>
	getarraysize \{$jam_tracks}
	<count> = 0
	begin
	if ((<inst_allow> < 0 || <count> = <inst_allow>) && <show_mic> != 1)
		switch <count>
			case 0
			inst_select_func = jam_player_select_instrument
			case 1
			case 2
			case 4
			inst_select_func = jam_create_guitar_type_select_menu
			case 3
			if NOT isdrumcontroller controller = <controller>
				inst_select_func = jam_create_drum_type_select_menu
			else
				inst_select_func = jam_player_select_instrument
			endif
		endswitch
		if ($game_mode = training)
			jam_band_container :gettags
			if (<disable_inst_select> = 0)
				<inst_select_func> = jam_player_select_instrument
			endif
		endif
		formattext checksumname = inst_select_text 'jam_%a_select_text_%b' a = <count> b = <player>
		createscreenelement {
			type = textblockelement
			parent = <resolved_id>
			id = <inst_select_text>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [center center]
			scale = 1
			rgba = <pause_font_color>
			dims = (160.0, 35.0)
			text = ($jam_tracks [<count>].name_text)
			z_priority = 35
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = proportional
			text_case = original
			exclusive_device = <controller>
			event_handlers = [
				{focus jam_pause_focus params = {id = <inst_select_text>}}
				{unfocus retail_menu_unfocus}
				{pad_choose <inst_select_func> params = {player = <player> player_cont = <player_cont> select_instrument = <count>}}
			]
		}
	endif
	<count> = (<count> + 1)
	repeat <array_size>
	if (<show_mic> > 0)
		formattext checksumname = inst_select_text 'jam_%a_select_text_%b' a = 5 b = <player>
		createscreenelement {
			type = textblockelement
			parent = <resolved_id>
			id = <inst_select_text>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [center center]
			scale = 1
			rgba = <pause_font_color>
			dims = (160.0, 35.0)
			text = qs(0xc0b34c9f)
			z_priority = 35
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = proportional
			text_case = original
			exclusive_device = <controller>
			event_handlers = [
				{focus jam_pause_focus params = {id = <inst_select_text>}}
				{unfocus retail_menu_unfocus}
				{pad_choose jam_player_select_instrument params = {player = <player> select_instrument = ($jam_mic_id)}}
			]
		}
	endif
	runscriptonscreenelement id = <inst_select_element> jam_select_instrument_update params = {parent_player = <player> is_drumkit = <is_drums> is_gamepad = <is_gamepad>}
	if screenelementexists id = <inst_select_element>
		if (<morph> = 1)
			<inst_select_element> :se_setprops rot_angle = -0.5 pos = (-84.0, 75.0) time = 0.1
			<inst_select_element> :se_waitprops
			if screenelementexists id = <inst_select_element>
				<inst_select_element> :se_setprops rot_angle = 0.3 pos = (-84.0, 67.0) time = 0.05
				<inst_select_element> :se_waitprops
			endif
			if screenelementexists id = <inst_select_element>
				<inst_select_element> :se_setprops rot_angle = 0.0 pos = (-84.0, 70.0) time = 0.05
				<inst_select_element> :se_waitprops
			endif
		else
			<inst_select_element> :se_setprops rot_angle = 0.0 pos = (-84.0, 70.0)
		endif
	endif
	if screenelementexists id = <resolved_id>
		assignalias id = <resolved_id> alias = current_menu
		launchevent \{target = current_menu
			type = focus}
	endif
endscript
is_drum_machine = 0

script jam_create_drum_type_select_menu 
	i = 1
	begin
	getplayerinfo <i> jam_instrument
	if (<jam_instrument> = 3)
		wait \{10
			gameframes}
		return
	endif
	<i> = (<i> + 1)
	repeat 4
	ui_menu_select_sfx
	jam_destroy_select_instrument_menu player = <player>
	getplayerinfo <player> controller
	setplayerinfo <player> jam_instrument = 3
	if ($game_mode = training)
		<controller> = 5
	endif
	band_leader_alpha = 0
	if (<controller> = $primary_controller)
		<band_leader_alpha> = 1
	endif
	formattext checksumname = drum_select_element 'drum_select_element_%a' a = <player>
	formattext textname = player_text qs(0x7bc47761) a = <player>
	createscreenelement {
		parent = <player_cont>
		id = <drum_select_element>
		type = descinterface
		desc = 'jam_player'
		pos = (-84.0, 70.0)
		exclusive_device = <controller>
		player_text = <player_text>
		band_leader_alpha = <band_leader_alpha>
	}
	resolvescreenelementid id = {<drum_select_element> child = {scroll_menu child = menu}}
	if (<controller> = ($primary_controller))
		<resolved_id> :se_setprops event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_start jam_band_pause params = {select_player = <player> player_cont = <player_cont> event_cont = <resolved_id> paused_at_inst}}
			{pad_back ui_menu_select_sfx}
			{pad_back jam_remove_sub_type_select_menu params = {player = <player> player_cont = <player_cont>}}
		]
	else
		<resolved_id> :se_setprops event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back ui_menu_select_sfx}
			{pad_back jam_remove_sub_type_select_menu params = {player = <player> player_cont = <player_cont>}}
		]
	endif
	<pause_font_color> = [80 80 80 255]
	set_focus_color \{rgba = [
			220
			220
			220
			255
		]}
	set_unfocus_color rgba = <pause_font_color>
	formattext checksumname = drum_select_text_id 'jam_%a_drum_select_text_%b' a = 0 b = <player>
	createscreenelement {
		type = textblockelement
		parent = <resolved_id>
		id = <drum_select_text_id>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		scale = 1
		rgba = <pause_font_color>
		dims = (150.0, 35.0)
		text = qs(0x388cd3db)
		z_priority = 35
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <drum_select_text_id>}}
			{unfocus retail_menu_unfocus}
			{pad_choose jam_player_select_instrument params = {player = <player> select_instrument = <select_instrument> is_drum_machine = 0 from_sub}}
		]
	}
	formattext checksumname = drum_select_text_id 'jam_%a_drum_select_text_%b' a = 1 b = <player>
	createscreenelement {
		type = textblockelement
		parent = <resolved_id>
		id = <drum_select_text_id>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		scale = 1
		rgba = <pause_font_color>
		dims = (150.0, 35.0)
		text = qs(0xf24238cd)
		z_priority = 35
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <drum_select_text_id>}}
			{unfocus retail_menu_unfocus}
			{pad_choose jam_player_select_instrument params = {player = <player> select_instrument = <select_instrument> is_drum_machine = 1 from_sub}}
		]
	}
	if screenelementexists id = <drum_select_element>
		runscriptonscreenelement id = <drum_select_element> legacydomorph params = {pos = (-84.0, 70.0) time = 0.1}
	endif
	if NOT canassignalias id = <resolved_id>
		return
	endif
	assignalias id = <resolved_id> alias = current_menu
	launchevent \{target = current_menu
		type = focus}
	if ($game_mode = training)
		jam_band_container :gettags
		if (<disable_inst_select> = 0)
			jam_player_select_instrument player = <player> select_instrument = <select_instrument> is_drum_machine = 0 from_sub
		endif
	endif
endscript

script jam_remove_sub_type_select_menu 
	jam_destroy_select_instrument_menu player = <player>
	jam_destroy_select_drum_type_menu player = <player>
	jam_destroy_select_guitar_type_menu player = <player>
	spawnscriptnow id = jam_band_spawns jam_create_select_instrument_menu params = {player = <player> player_cont = <player_cont> morph = 0}
endscript
is_arpeggiator = [
	0
	0
	0
	0
	0
	0
]

script jam_create_guitar_type_select_menu 
	i = 1
	begin
	getplayerinfo <i> jam_instrument
	if (<select_instrument> = <jam_instrument>)
		wait \{10
			gameframes}
		return
	endif
	<i> = (<i> + 1)
	repeat 4
	ui_menu_select_sfx
	jam_destroy_select_instrument_menu player = <player>
	getplayerinfo <player> controller
	setplayerinfo <player> jam_instrument = <select_instrument>
	if ($game_mode = training)
		<controller> = 5
	endif
	band_leader_alpha = 0
	if (<controller> = $primary_controller)
		<band_leader_alpha> = 1
	endif
	formattext checksumname = guitar_select_element 'guitar_select_element_%a' a = <player>
	formattext textname = player_text qs(0x7bc47761) a = <player>
	createscreenelement {
		parent = <player_cont>
		id = <guitar_select_element>
		type = descinterface
		desc = 'jam_player'
		pos = (-84.0, 70.0)
		exclusive_device = <controller>
		player_text = <player_text>
		band_leader_alpha = <band_leader_alpha>
	}
	resolvescreenelementid id = {<guitar_select_element> child = {scroll_menu child = menu}}
	if (<controller> = ($primary_controller))
		<resolved_id> :se_setprops event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_start jam_band_pause params = {select_player = <player> player_cont = <player_cont> event_cont = <resolved_id> paused_at_inst}}
			{pad_back ui_menu_select_sfx}
			{pad_back jam_remove_sub_type_select_menu params = {player = <player> player_cont = <player_cont>}}
		]
	else
		<resolved_id> :se_setprops event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back ui_menu_select_sfx}
			{pad_back jam_remove_sub_type_select_menu params = {player = <player> player_cont = <player_cont>}}
		]
	endif
	<pause_font_color> = [80 80 80 255]
	set_focus_color \{rgba = [
			220
			220
			220
			255
		]}
	set_unfocus_color rgba = <pause_font_color>
	switch <select_instrument>
		case 1
		type_text = qs(0x15d22c2f)
		machine_text = qs(0xba4928e3)
		case 2
		type_text = qs(0xa0244a86)
		machine_text = qs(0x615d5ed8)
		case 4
		type_text = qs(0x58ce03d1)
		machine_text = qs(0x74210f5d)
	endswitch
	formattext checksumname = guitar_select_text_id 'jam_%a_guitar_select_text_%b' a = 0 b = <player>
	createscreenelement {
		type = textblockelement
		parent = <resolved_id>
		id = <guitar_select_text_id>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		scale = 1
		rgba = <pause_font_color>
		dims = (150.0, 35.0)
		text = <type_text>
		z_priority = 35
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <guitar_select_text_id>}}
			{unfocus retail_menu_unfocus}
			{pad_choose jam_player_select_instrument params = {player = <player> select_instrument = <select_instrument> is_arpeggiator = 0 from_sub}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (140.0, 40.0)
	formattext checksumname = guitar_select_text_id 'jam_%a_guitar_select_text_%b' a = 1 b = <player>
	createscreenelement {
		type = textblockelement
		parent = <resolved_id>
		id = <guitar_select_text_id>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		scale = 1
		rgba = <pause_font_color>
		dims = (170.0, 35.0)
		text = <machine_text>
		z_priority = 35
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = original
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <guitar_select_text_id>}}
			{unfocus retail_menu_unfocus}
			{pad_choose jam_player_select_instrument params = {player = <player> select_instrument = <select_instrument> is_arpeggiator = 1 from_sub}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (140.0, 35.0)
	if screenelementexists id = <guitar_select_element>
		runscriptonscreenelement id = <guitar_select_element> legacydomorph params = {pos = (-84.0, 70.0) time = 0.1}
	endif
	assignalias id = <resolved_id> alias = current_menu
	launchevent \{target = current_menu
		type = focus}
	if ($game_mode = training)
		jam_band_container :gettags
		if (<disable_inst_select> = 0)
			jam_player_select_instrument player = <player> select_instrument = <select_instrument> is_drum_machine = 0 from_sub
		endif
	endif
endscript

script jam_select_instrument_update 
	<player_instruments> = [-1 -1 -1 -1]
	begin
	<player> = 1
	begin
	getplayerinfo <player> jam_instrument
	if (<player> = <parent_player>)
		if (<jam_instrument> >= 0)
			return
		endif
	endif
	<last_inst> = (<player_instruments> [(<player> -1)])
	if NOT (<jam_instrument> = <last_inst>)
		setarrayelement arrayname = player_instruments index = (<player> -1) newvalue = <jam_instrument>
		if (<jam_instrument> >= 0)
			formattext checksumname = inst_select_text 'jam_%a_select_text_%b' a = <jam_instrument> b = <parent_player>
			if screenelementexists id = <inst_select_text>
				<inst_select_text> :se_setprops not_focusable
				formattext checksumname = inst_select_element 'inst_select_element_%a' a = <parent_player>
				resolvescreenelementid id = {<inst_select_element> child = {scroll_menu child = menu}}
				<resolved_id> :gettags
				if gotparam \{tag_selected_index}
					if ((<tag_selected_index> = <jam_instrument>) || (<is_drumkit> = 1) || (<is_gamepad> = 1))
						launchevent type = unfocus target = <resolved_id>
						<resolved_id> :setprops not_focusable
						launchevent type = focus target = <resolved_id> data = {child_id = <inst_select_text>}
					endif
				endif
				<inst_select_text> :se_setprops rgba = [30 30 30 255]
			endif
		else
			formattext checksumname = inst_select_text 'jam_%a_select_text_%b' a = <last_inst> b = <parent_player>
			if screenelementexists id = <inst_select_text>
				<inst_select_text> :se_setprops focusable
				<inst_select_text> :se_setprops rgba = ($menu_unfocus_color)
				formattext checksumname = inst_select_element 'inst_select_element_%a' a = <parent_player>
				resolvescreenelementid id = {<inst_select_element> child = {scroll_menu child = menu}}
				<resolved_id> :gettags
				if (<is_drumkit> = 1)
					formattext checksumname = drum_select_text 'jam_3_select_text_%b' b = <parent_player>
					if screenelementexists id = <drum_select_text>
						launchevent type = focus target = <drum_select_text>
					endif
				elseif (<is_gamepad> = 1)
					formattext checksumname = mic_select_text 'jam_5_select_text_%b' b = <parent_player>
					if screenelementexists id = <mic_select_text>
						launchevent type = focus target = <mic_select_text>
					endif
				endif
			endif
		endif
	endif
	<player> = (<player> + 1)
	repeat 4
	wait \{1
		gameframes}
	repeat
endscript

script jam_player_select_instrument \{player = 0
		select_instrument = 0
		is_drum_machine = 0
		is_arpeggiator = 0}
	getplayerinfo <player> controller
	if (<select_instrument> = 5)
		if NOT jam_controller_can_use_mic controller = <controller>
			jam_band_controller_warning_box player = <player>
			return
		endif
	endif
	if NOT gotparam \{from_sub}
		i = 1
		begin
		getplayerinfo <i> jam_instrument
		if (<jam_instrument> = <select_instrument>)
			wait \{10
				gameframes}
			return
		endif
		<i> = (<i> + 1)
		repeat 4
	endif
	ui_menu_select_sfx
	setplayerinfo <player> jam_instrument = <select_instrument>
	switch <select_instrument>
		case 0
		formattext checksumname = inst_select_element 'inst_select_element_%a' a = <player>
		case 1
		case 2
		case 4
		setarrayelement arrayname = is_arpeggiator globalarray index = <select_instrument> newvalue = <is_arpeggiator>
		formattext checksumname = inst_select_element 'guitar_select_element_%a' a = <player>
		case 3
		change is_drum_machine = <is_drum_machine>
		formattext checksumname = inst_select_element 'drum_select_element_%a' a = <player>
	endswitch
	if screenelementexists id = <inst_select_element>
		launchevent target = <inst_select_element> type = unfocus
	endif
	if screenelementexists id = <inst_select_element>
		runscriptonscreenelement id = <inst_select_element> legacydomorph params = {pos = (-84.0, -400.0) time = 0.1}
	endif
	jam_destroy_select_instrument_menu player = <player>
	jam_destroy_select_drum_type_menu player = <player>
	jam_destroy_select_guitar_type_menu player = <player>
	formattext checksumname = player_cont 'inst_player_cont_%s' s = <player>
	jam_create_instrument select_player = <player> player_cont = <player_cont>
	jam_create_player_info player = <player> player_cont = <player_cont>
	if screenelementexists \{id = jam_band_container}
		jam_band_container :settags \{allow_easy_backout = 0}
	endif
	menu_jam_band_add_control_helpers state = instrument_ui instrument = <select_instrument>
	if ($game_mode = training)
		broadcastevent type = jam_tutorial_instrument_selected data = {select_instrument = <select_instrument>}
	endif
endscript

script jam_destroy_select_instrument_menu 
	formattext checksumname = inst_select_element 'inst_select_element_%a' a = <player>
	if gotparam \{player}
		switch <player>
			case 1
			playsound \{jam_pause_panel_out
				vol = -16
				pitch = -0.5
				buss = front_end
				pan1x = -0.15
				pan1y = 1
				pan2x = -0.15
				pan2y = 1}
			case 2
			playsound \{jam_pause_panel_out
				vol = -16
				pitch = 0
				buss = front_end
				pan1x = -0.05
				pan1y = 1
				pan2x = -0.05
				pan2y = 1}
			case 3
			playsound \{jam_pause_panel_out
				vol = -16
				pitch = 0.5
				buss = front_end
				pan1x = 0.05
				pan1y = 1
				pan2x = 0.05
				pan2y = 1}
			case 4
			playsound \{jam_pause_panel_out
				vol = -16
				pitch = 1
				buss = front_end
				pan1x = 0.15
				pan1y = 1
				pan2x = 0.15
				pan2y = 1}
		endswitch
	endif
	if screenelementexists id = <inst_select_element>
		destroyscreenelement id = <inst_select_element>
	endif
endscript

script jam_destroy_select_drum_type_menu 
	formattext checksumname = drum_select_element 'drum_select_element_%a' a = <player>
	if screenelementexists id = <drum_select_element>
		destroyscreenelement id = <drum_select_element>
	endif
endscript

script jam_destroy_select_guitar_type_menu 
	formattext checksumname = guitar_select_element 'guitar_select_element_%a' a = <player>
	if screenelementexists id = <guitar_select_element>
		destroyscreenelement id = <guitar_select_element>
	endif
endscript

script jam_easy_backout 
	jam_band_container :gettags
	if (<allow_easy_backout> = 1)
		soundevent \{event = generic_menu_back_sfx}
		jam_band_quit_dialog select_player = <select_player>
	endif
endscript

script jam_create_player_info 
	getplayerinfo <player> jam_instrument
	getplayerinfo <player> controller
	if (<jam_instrument> = 3)
		percussion_alpha = 1
	else
		percussion_alpha = 0
	endif
	band_leader_alpha = 0
	if (<controller> = ($primary_controller))
		<band_leader_alpha> = 1
	endif
	formattext checksumname = player_info_element 'player_info_element_%a' a = <player>
	createscreenelement {
		parent = <player_cont>
		id = <player_info_element>
		type = descinterface
		desc = 'jam_band_instrument_name'
		z_priority = 30
		pos = (3.0, 500.0)
		percussion_alpha = <percussion_alpha>
		percussion_text = qs(0x26239ec0)
		glow_alpha = 0
		band_leader_alpha = <band_leader_alpha>
	}
	if ($is_percussion_kit = 0)
		if screenelementexists id = <player_info_element>
			<player_info_element> :se_setprops glow_alpha = 0.0
			<player_info_element> :se_setprops percussion_text = qs(0x26239ec0)
		endif
	else
		if screenelementexists id = <player_info_element>
			<player_info_element> :se_setprops glow_alpha = 0.65000004
			<player_info_element> :se_setprops percussion_text = qs(0x6988d970)
		endif
	endif
	getarraysize \{$jam_tracks}
	if (<jam_instrument> < <array_size>)
		<inst_name> = ($jam_tracks [<jam_instrument>].name_text)
	elseif (<jam_instrument> = $jam_mic_id)
		<inst_name> = qs(0xc0b34c9f)
	endif
	if ($is_drum_machine = 1 && <jam_instrument> = 3)
		spawnscriptnow id = jam_band_spawns jam_create_extra_info params = {player = <player> drum_machine}
	endif
	if (($is_arpeggiator [<jam_instrument>]) = 1)
		spawnscriptnow id = jam_band_spawns jam_create_extra_info params = {player = <player> arpeggiator}
	endif
	<player_info_element> :setprops instrument_name_text = <inst_name>
	jam_create_effect_info_box player = <player> quick_tabs_active = <quick_tabs_active> player_info_element = <player_info_element>
endscript

script jam_destroy_player_info_box 
	spawnscriptnow id = jam_band_spawns jam_remove_extra_info params = {player = <player>}
	formattext checksumname = player_info_element 'player_info_element_%a' a = <player>
	if screenelementexists id = <player_info_element>
		destroyscreenelement id = <player_info_element>
	endif
endscript

script jam_create_effect_info_box 
	getplayerinfo <player> jam_instrument
	if (<jam_instrument> > 4)
		<player_info_element> :setprops extra_info_text = qs(0x00000000)
		runscriptonscreenelement id = <player_info_element> legacydomorph params = {pos = (3.0, 463.0) time = 0.1}
		return
	endif
	formattext checksumname = effect_info_box 'effect_info_box_%a' a = <player>
	formattext checksumname = player_cont 'inst_player_cont_%s' s = <player>
	<pos> = (5.0, -355.0)
	if (<jam_instrument> < 2)
		switch (<jam_instrument>)
			case 0
			<effect_array> = jam_rhythm_effects
			case 1
			<effect_array> = jam_lead_effects
		endswitch
		<effect_index> = (($jam_current_instrument_effects) [<jam_instrument>])
		<effect_name> = (($<effect_array>) [<effect_index>].name_text)
		formattext textname = effect_text qs(0x4d4555da) s = <effect_name>
		<player_info_element> :setprops extra_info_text = <effect_text>
		runscriptonscreenelement id = <player_info_element> legacydomorph params = {pos = (3.0, 445.0) time = 0.1}
	elseif (<jam_instrument> = 2)
		if ($bass_kit_mode = 0)
			<player_info_element> :setprops extra_info_text = qs(0x00000000)
			runscriptonscreenelement id = <player_info_element> legacydomorph params = {pos = (3.0, 465.0) time = 0.1}
		else
			<bass_kit_name> = (($pause_bass_kit_options) [($bass_kit_mode)].name_text)
			formattext textname = bass_kit_text qs(0x4d4555da) s = <bass_kit_name>
			<player_info_element> :setprops extra_info_text = <bass_kit_text>
			runscriptonscreenelement id = <player_info_element> legacydomorph params = {pos = (3.0, 445.0) time = 0.1}
		endif
	elseif (<jam_instrument> = 3)
		getarraysize ($pause_drum_kit_options)
		if (($jam_current_drum_kit) >= <array_size>)
			change \{jam_current_drum_kit = 0}
		endif
		<kit_name> = (($pause_drum_kit_options) [($jam_current_drum_kit)].name_text)
		formattext textname = effect_text qs(0x4d4555da) s = <kit_name>
		<player_info_element> :setprops extra_info_text = <effect_text>
		runscriptonscreenelement id = <player_info_element> legacydomorph params = {pos = (3.0, 418.0) time = 0.1}
	elseif (<jam_instrument> = 4)
		<melody_kit_name> = (($pause_melody_kit_options) [($jam_current_melody_kit)].name_text)
		formattext textname = melody_kit_text qs(0x4d4555da) s = <melody_kit_name>
		<player_info_element> :setprops extra_info_text = <melody_kit_text>
		runscriptonscreenelement id = <player_info_element> legacydomorph params = {pos = (3.0, 445.0) time = 0.1}
	endif
endscript

script jam_destroy_effect_info_box 
	formattext checksumname = effect_info_box 'effect_info_box_%a' a = <player>
	if screenelementexists id = <effect_info_box>
		destroyscreenelement id = <effect_info_box>
	endif
endscript

script jam_player_go_back \{select_player = 0}
	getplayerinfo <select_player> jam_instrument
	if (<jam_instrument> < 0)
		ui_event \{event = menu_back
			data = {
				state = uistate_jam_select_song
				show_popup = 0
			}}
		return
	endif
endscript

script jam_create_instrument 
	getplayerinfo <select_player> controller
	formattext checksumname = inst_cont 'inst_cont_%s' s = <select_player>
	createscreenelement {
		type = containerelement
		parent = <player_cont>
		id = <inst_cont>
		pos = (0.0, 0.0)
		just = [center center]
		exclusive_device = <controller>
		event_handlers =
		[
			{pad_start jam_band_pause params = {select_player = <select_player> player_cont = <player_cont> event_cont = <inst_cont>}}
		]
	}
	launchevent type = focus target = <inst_cont>
	getplayerinfo <select_player> jam_instrument
	formattext checksumname = simple_rec_arrow_l 'jam_simple_rec_arrow_l_%s' s = <select_player>
	createscreenelement {
		type = spriteelement
		parent = <inst_cont>
		id = <simple_rec_arrow_l>
		texture = left_arrow
		just = [center top]
		pos = (-75.0, 485.0)
		scale = 0.8
		z_priority = 60
	}
	formattext checksumname = simple_rec_arrow_r 'jam_simple_rec_arrow_r_%s' s = <select_player>
	createscreenelement {
		type = spriteelement
		parent = <inst_cont>
		id = <simple_rec_arrow_r>
		texture = right_arrow
		just = [center top]
		pos = (78.0, 485.0)
		scale = 0.8
		z_priority = 60
	}
	formattext checksumname = simple_rec_button_l 'jam_simple_rec_button_l_%s' s = <select_player>
	createscreenelement {
		type = spriteelement
		parent = <inst_cont>
		id = <simple_rec_button_l>
		texture = button_off
		just = [center top]
		pos = (-33.0, 474.0)
		scale = 1.4
		z_priority = 60
	}
	formattext checksumname = simple_rec_button_r 'jam_simple_rec_button_r_%s' s = <select_player>
	createscreenelement {
		type = spriteelement
		parent = <inst_cont>
		id = <simple_rec_button_r>
		texture = button_off
		just = [center top]
		pos = (37.0, 474.0)
		scale = 1.4
		z_priority = 60
	}
	formattext checksumname = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <select_player>
	createscreenelement {
		type = spriteelement
		parent = <inst_cont>
		id = <simple_rec_button_onl>
		texture = button_on
		just = [center top]
		pos = (-33.0, 474.0)
		scale = 1.4
		z_priority = 61
	}
	safe_hide id = <simple_rec_button_onl>
	formattext checksumname = simple_rec_button_onr 'jam_simple_rec_button_onr_%s' s = <select_player>
	createscreenelement {
		type = spriteelement
		parent = <inst_cont>
		id = <simple_rec_button_onr>
		texture = button_on
		just = [center top]
		pos = (37.0, 474.0)
		scale = 1.4
		z_priority = 61
	}
	safe_hide id = <simple_rec_button_onr>
	formattext checksumname = simple_rec_icon_play 'jam_simple_rec_icon_play_%s' s = <select_player>
	createscreenelement {
		type = spriteelement
		parent = <inst_cont>
		id = <simple_rec_icon_play>
		texture = jm_icon_play
		just = [center top]
		pos = (38.0, 468.0)
		scale = 1.7
		z_priority = 65
	}
	formattext checksumname = simple_rec_icon_stop 'jam_simple_rec_icon_stop_%s' s = <select_player>
	createscreenelement {
		type = spriteelement
		parent = <inst_cont>
		id = <simple_rec_icon_stop>
		texture = icon_stop
		just = [center top]
		pos = (37.0, 463.0)
		scale = 2.1
		z_priority = 65
	}
	safe_hide id = <simple_rec_icon_stop>
	if NOT (<jam_instrument> = $jam_mic_id)
		formattext checksumname = simple_rec_icon_rec 'jam_simple_rec_icon_rec_%s' s = <select_player>
		createscreenelement {
			type = spriteelement
			parent = <inst_cont>
			id = <simple_rec_icon_rec>
			texture = jm_icon_record
			just = [center top]
			pos = (-33.0, 467.0)
			scale = 1.75
			z_priority = 65
		}
	endif
	formattext checksumname = simple_rec_icon_rw 'jam_simple_rec_icon_rw_%s' s = <select_player>
	createscreenelement {
		type = spriteelement
		parent = <inst_cont>
		id = <simple_rec_icon_rw>
		texture = jm_icon_back
		just = [center top]
		pos = (-8.0, 496.0)
		scale = 1.65
		rot_angle = 90
		z_priority = 65
	}
	formattext checksumname = simple_rec_icon_ff 'jam_simple_rec_icon_ff_%s' s = <select_player>
	createscreenelement {
		type = spriteelement
		parent = <inst_cont>
		id = <simple_rec_icon_ff>
		texture = jm_icon_forward
		just = [center top]
		pos = (66.0, 496.0)
		scale = 1.65
		rot_angle = 90
		z_priority = 65
	}
	safe_hide id = <simple_rec_icon_rw>
	safe_hide id = <simple_rec_icon_ff>
	formattext checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
	if (<jam_instrument> = $jam_mic_id)
		killspawnedscript id = <jam_player_spawns>
		spawnscriptnow jam_band_activate_mic id = <jam_player_spawns> params = {select_player = <select_player>}
	else
		if structurecontains structure = ($jam_tracks [<jam_instrument>]) ui_create_func
			spawnscriptnow ($jam_tracks [<jam_instrument>].ui_create_func) id = <jam_player_spawns> params = {parent_id = <inst_cont> player = <select_player> controller = <controller>}
		endif
		formattext checksumname = input_spawn 'input_spawn_%s' s = <select_player>
		if structurecontains structure = ($jam_tracks [<jam_instrument>]) input_func
			spawnscriptnow ($jam_tracks [<jam_instrument>].input_func) id = <input_spawn> params = {select_player = <select_player> show_hud = 0 controller = <controller> spawn_id = <input_spawn>}
		endif
	endif
endscript

script jam_destroy_instrument 
	getplayerinfo <select_player> jam_instrument
	if NOT (<jam_instrument> = $jam_mic_id)
		if structurecontains structure = ($jam_tracks [<jam_instrument>]) ui_destroy_func
			formattext checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
			spawnscriptnow ($jam_tracks [<jam_instrument>].ui_destroy_func) id = <jam_player_spawns> params = {player = <select_player>}
		endif
	endif
	formattext checksumname = input_spawn 'input_spawn_%s' s = <select_player>
	killspawnedscript id = <input_spawn>
	kill_arpeggiator_loop select_player = <select_player>
	destroyplayerserverjaminput player = <select_player>
	if (<jam_instrument> = $jam_mic_id)
		jam_band_deactivate_mic select_player = <select_player>
	endif
	launchevent type = unfocus target = <inst_cont>
	destroy_menu menu_id = <inst_cont>
	spawnscriptnow id = jam_band_spawns jam_create_select_instrument_menu params = {player = <select_player> player_cont = <player_cont> morph = 1}
endscript

script jam_setup_fretboard 
	jam_create_fretboard parent_id = <parent_id> player = <player>
	formattext checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <player>
	formattext checksumname = fretboard_id 'jam_fretboard_base_%s' s = <player>
	getplayerinfo <player> jam_instrument
	switch (<jam_instrument>)
		case 0
		<tilt_global> = jam_tilt_rhythm
		case 1
		<tilt_global> = jam_tilt_lead
		case 2
		<tilt_global> = jam_tilt_bass
		case 4
		<tilt_global> = jam_tilt_melody
	endswitch
	if NOT (<jam_instrument> = 3)
		<tilt_enabled> = 0
		<num_tilts> = 0
		<chosen_scales_array> = ($jam_track_scaleindex)
		getplayerinfo <player> jam_instrument
		<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
		<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
		if structurecontains structure = <chosen_scale> chromatic
			<tilt_enabled> = 1
			if (<jam_instrument> = 0)
				<num_tilts> = 2
			else
				<num_tilts> = 4
			endif
		else
			if ((<jam_instrument> = 1) || (<jam_instrument> = 2) || (<jam_instrument> = 4))
				<tilt_enabled> = 1
				<num_tilts> = 2
			endif
		endif
	endif
	formattext checksumname = base_id 'jam_fretboard_base_%s' s = <player>
	runscriptonscreenelement id = <base_id> legacydomorph params = {pos = (0.0, 275.0) time = 0.1}
	if screenelementexists id = <fretboard_id>
		runscriptonscreenelement id = <fretboard_id> jam_fretboard_update params = {tilt_enabled = <tilt_enabled> tilt_global = <tilt_global> num_tilts = <num_tilts> player = <player>}
	endif
endscript

script jam_create_fretboard \{parent_id = root_window
		z_priority = 2}
	formattext checksumname = base_id 'jam_fretboard_base_%s' s = <player>
	createscreenelement {
		type = containerelement
		parent = <parent_id>
		id = <base_id>
		just = [center top]
		pos = (0.0, 400.0)
		dims = (150.0, 210.0)
	}
	formattext checksumname = scrolling_window 'jam_scroll_window_%s' s = <player>
	createscreenelement {
		type = windowelement
		parent = <base_id>
		id = <scrolling_window>
		just = [left top]
		pos = (0.0, 0.0)
		dims = (150.0, 185.0)
	}
	formattext checksumname = scrolling_board1 'jam_scroller1_%s' s = <player>
	createscreenelement {
		type = spriteelement
		parent = <scrolling_window>
		id = <scrolling_board1>
		just = [left top]
		rgba = [200 200 200 255]
		texture = scrolling_fretboard
		pos = (0.0, 0.0)
		dims = (150.0, 187.0)
		z_priority = (<z_priority> + 2)
	}
	formattext checksumname = scrolling_board2 'jam_scroller2_%s' s = <player>
	createscreenelement {
		type = spriteelement
		parent = <scrolling_window>
		id = <scrolling_board2>
		just = [left top]
		rgba = [200 200 200 255]
		texture = scrolling_fretboard
		pos = (0.0, -180.0)
		dims = (150.0, 187.0)
		z_priority = (<z_priority> + 2)
	}
	formattext checksumname = now_id 'jam_now_bar_%s' s = <player>
	createscreenelement {
		type = containerelement
		parent = <base_id>
		id = <now_id>
		just = [center center]
		pos = (0.0, 0.0)
		scale = 0.7
		z_priority = (<z_priority> + 3)
	}
	formattext checksumname = gems_id 'jam_falling_gem_container_%s' s = <player>
	createscreenelement {
		type = containerelement
		parent = <base_id>
		id = <gems_id>
		just = [center center]
		pos = (0.0, 0.0)
		scale = 0.7
		z_priority = (<z_priority> + 3)
	}
	createscreenelement {
		type = spriteelement
		parent = <now_id>
		just = [left top]
		rgba = [0 0 0 255]
		texture = white
		pos = (-10.0, 0.0)
		dims = (30.0, 200.0)
		z_priority = (<z_priority> - 5)
	}
	createscreenelement {
		type = spriteelement
		parent = <now_id>
		just = [left top]
		rgba = [0 0 0 255]
		texture = white
		pos = (190.0, 0.0)
		dims = (30.0, 200.0)
		z_priority = (<z_priority> - 5)
	}
	<pressed_gem_props> = {type = spriteelement parent = <now_id> just = [center center] scale = 1 z_priority = (<z_priority> + 4)}
	<drum> = 0
	<rb_drum> = 0
	getplayerinfo <player> controller
	if isdrumcontroller controller = <controller>
		if isrbdrum controller = <controller>
			<rb_drum> = 1
		endif
		<drum> = 1
	endif
	jam_menu_get_lefty player = <player>
	if (<drum> = 1)
		<lefty> = 0
		<gem_positions> = [
			(195.0, 0.0) ,
			(19.0, 0.0) ,
			(63.0, 0.0) ,
			(107.0, 0.0) ,
			(151.0, 0.0)
		]
	elseif (<lefty> = 1)
		<gem_positions> = [
			(195.0, 0.0) ,
			(151.0, 0.0) ,
			(107.0, 0.0) ,
			(63.0, 0.0) ,
			(19.0, 0.0)
		]
	else
		<gem_positions> = [
			(19.0, 0.0) ,
			(63.0, 0.0) ,
			(107.0, 0.0) ,
			(151.0, 0.0) ,
			(195.0, 0.0)
		]
	endif
	formattext checksumname = gem_id 'jam_now_on_gr_%s' s = <player>
	createscreenelement {
		<pressed_gem_props>
		texture = green_now_off
		pos = (<gem_positions> [0])
	}
	createscreenelement {
		<pressed_gem_props>
		id = <gem_id>
		texture = green_now_on
		pos = (<gem_positions> [0])
		z_priority = (<z_priority> + 5)
	}
	safe_hide id = <gem_id>
	formattext checksumname = gem_id 'jam_now_on_re_%s' s = <player>
	createscreenelement {
		<pressed_gem_props>
		texture = red_now_off
		pos = (<gem_positions> [1])
	}
	createscreenelement {
		<pressed_gem_props>
		id = <gem_id>
		texture = red_now_on
		pos = (<gem_positions> [1])
		z_priority = (<z_priority> + 5)
	}
	safe_hide id = <gem_id>
	formattext checksumname = gem_id 'jam_now_on_ye_%s' s = <player>
	createscreenelement {
		<pressed_gem_props>
		texture = yellow_now_off
		pos = (<gem_positions> [2])
	}
	createscreenelement {
		<pressed_gem_props>
		id = <gem_id>
		texture = yellow_now_on
		pos = (<gem_positions> [2])
		z_priority = (<z_priority> + 5)
	}
	safe_hide id = <gem_id>
	formattext checksumname = gem_id 'jam_now_on_bl_%s' s = <player>
	createscreenelement {
		<pressed_gem_props>
		texture = blue_now_off
		pos = (<gem_positions> [3])
	}
	createscreenelement {
		<pressed_gem_props>
		id = <gem_id>
		texture = blue_now_on
		pos = (<gem_positions> [3])
		z_priority = (<z_priority> + 5)
	}
	safe_hide id = <gem_id>
	formattext checksumname = gem_id 'jam_now_on_or_%s' s = <player>
	if NOT (<rb_drum> = 1)
		createscreenelement {
			<pressed_gem_props>
			texture = orange_now_off
			pos = (<gem_positions> [4])
		}
	else
		createscreenelement {
			<pressed_gem_props>
			texture = orange_now_off
			pos = (<gem_positions> [4])
			rgba = [50 50 50 255]
		}
	endif
	createscreenelement {
		<pressed_gem_props>
		id = <gem_id>
		texture = orange_now_on
		pos = (<gem_positions> [4])
		z_priority = (<z_priority> + 5)
	}
	safe_hide id = <gem_id>
	getplayerinfo <player> jam_instrument
	if NOT (<jam_instrument> = 3)
		formattext checksumname = now_pick 'jam_pick_%s' s = <player>
		createscreenelement {
			type = spriteelement
			parent = <now_id>
			id = <now_pick>
			texture = pick
			rgba = [200 200 200 255]
			just = [center center]
			pos = (230.0, 35.0)
			scale = 2
			rot_angle = 10
			z_priority = (<z_priority> + 7)
		}
		formattext checksumname = note_text_id 'jam_note_text_%s' s = <player>
		createscreenelement {
			type = textelement
			id = <note_text_id>
			parent = <now_pick>
			font = fontgrid_text_a3
			just = [center center]
			scale = 0.4
			rgba = [0 0 0 255]
			pos = (19.0, 15.0)
			text = qs(0x00000000)
			noshadow
		}
	endif
	getplayerinfo <player> controller
	tilt_meter_alpha = 1
	if (<jam_instrument> = 0)
		<tilt_meter_alpha> = 0
	endif
	if isdrumcontroller controller = <controller>
		<tilt_meter_alpha> = 0
	endif
	meter_texture = pitch_meter
	if (<jam_instrument> = 3)
		meter_texture = pitch_meter_whole
	endif
	formattext checksumname = tilt_id 'jam_tilt_needle_%s' s = <player>
	createscreenelement {
		type = spriteelement
		id = <tilt_id>
		parent = <now_id>
		texture = pitch_dial
		just = [center center]
		scale = 2
		pos = (14.0, 2.0)
		z_priority = <z_priority>
		alpha = <tilt_meter_alpha>
	}
	formattext checksumname = tilt_meter_id 'jam_tilt_meter_%s' s = <player>
	createscreenelement {
		type = spriteelement
		parent = <now_id>
		id = <tilt_meter_id>
		texture = <meter_texture>
		just = [center center]
		scale = 2
		pos = (-12.0, 1.0)
		z_priority = <z_priority>
		alpha = <tilt_meter_alpha>
	}
	runscriptonscreenelement id = <base_id> jam_lightup_held_note_sprites params = {controller = <controller> player = <player>}
endscript

script jam_fretboard_update \{tilt_enabled = 0}
	formattext checksumname = tilt_id 'jam_tilt_needle_%s' s = <player>
	formattext checksumname = tilt_meter_id 'jam_tilt_meter_%s' s = <player>
	<last_tilt> = -1
	formattext checksumname = scrolling_board1 'jam_scroller1_%s' s = <player>
	formattext checksumname = scrolling_board2 'jam_scroller2_%s' s = <player>
	<scroller1_pos> = (0.0, 0.0)
	<scroller2_pos> = (0.0, -185.0)
	getplayerinfo <player> jam_instrument
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if structurecontains structure = <chosen_scale> chromatic
		<chromatic> = 1
	else
		<chromatic> = 0
	endif
	if (<chromatic> = 1)
		if (<jam_instrument> = 0)
			<tilt_id> :se_setprops alpha = 1
			<tilt_meter_id> :se_setprops alpha = 1 texture = pitch_meter
		else
			<tilt_id> :se_setprops alpha = 1
			<tilt_meter_id> :se_setprops alpha = 1 texture = pitch_meter_quarter
		endif
	endif
	<fall_limit> = 270
	<bottom_limit> = 183
	<restart_pos> = (0.0, -175.0)
	begin
	<seconds_per_measure> = ((60.0 / $jam_current_bpm) * 2)
	<y_inc> = ((<fall_limit> / <seconds_per_measure>) / 60)
	<y_inc> = (<y_inc> * 0.7)
	if (<tilt_enabled> = 1)
		if NOT (($<tilt_global>) = <last_tilt>)
			<last_tilt> = ($<tilt_global>)
			if (<chromatic> = 0 || <jam_instrument> = 0)
				switch (<last_tilt>)
					case 0
					legacydoscreenelementmorph id = <tilt_id> time = 0.15 rot_angle = -20
					case 1
					legacydoscreenelementmorph id = <tilt_id> time = 0.15 rot_angle = 20
				endswitch
			else
				switch (<last_tilt>)
					case 0
					legacydoscreenelementmorph id = <tilt_id> time = 0.15 rot_angle = -45
					case 1
					legacydoscreenelementmorph id = <tilt_id> time = 0.15 rot_angle = -15
					case 2
					legacydoscreenelementmorph id = <tilt_id> time = 0.15 rot_angle = 15
					case 3
					legacydoscreenelementmorph id = <tilt_id> time = 0.15 rot_angle = 45
				endswitch
			endif
		endif
	endif
	<scroller1_pos> = (<scroller1_pos> + ((0.0, 1.0) * <y_inc>))
	<scroller2_pos> = (<scroller2_pos> + ((0.0, 1.0) * <y_inc>))
	<scrolling_board1> :se_setprops pos = <scroller1_pos>
	<scrolling_board2> :se_setprops pos = <scroller2_pos>
	if ((<scroller1_pos> [1]) > <bottom_limit>)
		<scrolling_board1> :se_setprops pos = <scroller1_start>
		<scroller1_pos> = <restart_pos>
	elseif ((<scroller2_pos> [1]) > <bottom_limit>)
		<scrolling_board2> :se_setprops pos = <scroller2_start>
		<scroller2_pos> = <restart_pos>
	endif
	wait \{1
		gameframe}
	repeat
endscript

script jam_lightup_held_note_sprites 
	formattext checksumname = gem_gr 'jam_now_on_gr_%s' s = <player>
	formattext checksumname = gem_re 'jam_now_on_re_%s' s = <player>
	formattext checksumname = gem_ye 'jam_now_on_ye_%s' s = <player>
	formattext checksumname = gem_bl 'jam_now_on_bl_%s' s = <player>
	formattext checksumname = gem_or 'jam_now_on_or_%s' s = <player>
	formattext checksumname = note_text_id 'jam_note_text_%s' s = <player>
	getplayerinfo <player> jam_instrument
	<check_diatonic> = 0
	<exclusive> = 0
	switch (<jam_instrument>)
		case 0
		<note_func> = jam_input_rhythm_get_current_note
		<tilt_var> = jam_tilt_rhythm
		case 1
		<note_func> = jam_input_lead_get_current_note
		<exclusive> = 1
		<tilt_var> = jam_tilt_lead
		scale_index = ($jam_track_scaleindex [1])
		if ((<scale_index> = 0) || (<scale_index> = 4))
			<check_diatonic> = 1
		endif
		case 2
		<note_func> = jam_input_bass_get_current_note
		<exclusive> = 1
		<tilt_var> = jam_tilt_bass
		scale_index = ($jam_track_scaleindex [2])
		if ((<scale_index> = 0) || (<scale_index> = 4))
			<check_diatonic> = 1
		endif
		if (($jam_current_melody_kit) > 0)
			<check_diatonic> = 0
		endif
		case 3
		<update_tilt> = 1
		case 4
		<note_func> = jam_input_melody_get_current_note
		<exclusive> = 1
		<tilt_var> = jam_tilt_melody
	endswitch
	if (($is_arpeggiator [<jam_instrument>]) = 1)
		<exclusive> = 0
	endif
	<last_pattern> = 0
	<last_tilt> = -1
	<locked> = 0
	begin
	getheldpattern controller = <controller> player = <player> nobrokenstring
	if (<jam_instrument> != 3)
		<update_tilt> = 0
		if (<last_tilt> != ($<tilt_var>))
			<update_tilt> = 1
		endif
	endif
	if ((<hold_pattern> != <last_pattern>) || (<update_tilt> = 1))
		<last_pattern> = <hold_pattern>
		if (<check_diatonic> = 1)
			if (<hold_pattern> = 17)
				safe_hide id = <gem_gr>
				safe_hide id = <gem_re>
				safe_hide id = <gem_ye>
				safe_show id = <gem_bl>
				safe_show id = <gem_or>
				<locked> = 1
			endif
		endif
		jam_lightup_hold_pattern hold_pattern = <hold_pattern> locked = <locked> player = <player> exclusive = <exclusive>
		if NOT (<jam_instrument> = 3)
			<note_func> player = <player> hold_pattern = <hold_pattern>
			if screenelementexists \{id = jam_studio_element}
				jam_studio_element :setprops note_text = <single_note_text>
			else
				<note_text_id> :se_setprops text = <single_note_text>
			endif
			<last_tilt> = ($<tilt_var>)
		endif
	endif
	<locked> = 0
	wait \{1
		gameframe}
	repeat
endscript

script jam_lightup_hold_pattern \{hold_pattern = 1048576
		locked = 0
		player = 1
		exclusive = 1}
	formattext checksumname = gem_gr 'jam_now_on_gr_%s' s = <player>
	formattext checksumname = gem_re 'jam_now_on_re_%s' s = <player>
	formattext checksumname = gem_ye 'jam_now_on_ye_%s' s = <player>
	formattext checksumname = gem_bl 'jam_now_on_bl_%s' s = <player>
	formattext checksumname = gem_or 'jam_now_on_or_%s' s = <player>
	formattext checksumname = note_text_id 'jam_note_text_%s' s = <player>
	if (<hold_pattern> && 1)
		if (<locked> = 0)
			safe_show id = <gem_or>
			if (<exclusive> = 1)
				safe_hide id = <gem_gr>
				safe_hide id = <gem_re>
				safe_hide id = <gem_ye>
				safe_hide id = <gem_bl>
				<locked> = 1
			endif
		endif
	else
		safe_hide id = <gem_or>
	endif
	if (<hold_pattern> && 16)
		if (<locked> = 0)
			safe_show id = <gem_bl>
			if (<exclusive> = 1)
				safe_hide id = <gem_gr>
				safe_hide id = <gem_re>
				safe_hide id = <gem_ye>
				safe_hide id = <gem_or>
				<locked> = 1
			endif
		endif
	else
		safe_hide id = <gem_bl>
	endif
	if (<hold_pattern> && 256)
		if (<locked> = 0)
			safe_show id = <gem_ye>
			if (<exclusive> = 1)
				safe_hide id = <gem_gr>
				safe_hide id = <gem_re>
				safe_hide id = <gem_bl>
				safe_hide id = <gem_or>
				<locked> = 1
			endif
		endif
	else
		safe_hide id = <gem_ye>
	endif
	if (<hold_pattern> && 4096)
		if (<locked> = 0)
			safe_show id = <gem_re>
			if (<exclusive> = 1)
				safe_hide id = <gem_gr>
				safe_hide id = <gem_ye>
				safe_hide id = <gem_bl>
				safe_hide id = <gem_or>
				<locked> = 1
			endif
		endif
	else
		safe_hide id = <gem_re>
	endif
	if (<hold_pattern> && 65536)
		if (<locked> = 0)
			safe_show id = <gem_gr>
			if (<exclusive> = 1)
				safe_hide id = <gem_re>
				safe_hide id = <gem_ye>
				safe_hide id = <gem_bl>
				safe_hide id = <gem_or>
				<locked> = 1
			endif
		endif
	else
		safe_hide id = <gem_gr>
	endif
endscript

script jam_hide_all_held_note_sprites 
	printf \{channel = jam_mode
		qs(0x231fec36)}
	formattext checksumname = gem_gr 'jam_now_on_gr_%s' s = <player>
	formattext checksumname = gem_re 'jam_now_on_re_%s' s = <player>
	formattext checksumname = gem_ye 'jam_now_on_ye_%s' s = <player>
	formattext checksumname = gem_bl 'jam_now_on_bl_%s' s = <player>
	formattext checksumname = gem_or 'jam_now_on_or_%s' s = <player>
	formattext checksumname = note_text_id 'jam_note_text_%s' s = <player>
	safe_hide id = <gem_gr>
	safe_hide id = <gem_re>
	safe_hide id = <gem_ye>
	safe_hide id = <gem_bl>
	safe_hide id = <gem_or>
endscript

script jam_ghmix_note_quick_update 
	getplayerinfo <player> jam_instrument
	switch (<jam_instrument>)
		case 0
		<note_func> = jam_input_rhythm_get_current_note
		case 1
		<note_func> = jam_input_lead_get_current_note
		case 2
		<note_func> = jam_input_bass_get_current_note
		case 4
		<note_func> = jam_input_melody_get_current_note
		default
		jam_studio_element :setprops \{note_text = qs(0x00000000)}
		return
	endswitch
	<note_func> player = <player> hold_pattern = 1048576
	if screenelementexists \{id = jam_studio_element}
		if NOT (<jam_instrument> = 3)
			jam_studio_element :setprops note_text = <single_note_text>
		else
			jam_studio_element :setprops \{note_text = qs(0x00000000)}
		endif
	endif
endscript

script jam_ghmix_note_text_clear 
	if screenelementexists \{id = jam_studio_element}
		jam_studio_element :setprops \{note_text = qs(0x00000000)}
	endif
endscript

script jam_fretboard_add_note 
	formattext checksumname = player_cont 'inst_player_cont_%s' s = <player>
	if NOT screenelementexists id = <player_cont>
		return
	endif
	getplayerinfo <player> jam_instrument
	getplayerinfo <player> controller
	if NOT (<jam_instrument> = 3)
		gems = [
			{
				texture = green_top_gem
				texture_drum = red_top_gem
				pattern = 65536
			}
			{
				texture = red_top_gem
				texture_drum = yellow_top_gem
				pattern = 4096
			}
			{
				texture = yellow_top_gem
				texture_drum = blue_top_gem
				pattern = 256
			}
			{
				texture = blue_top_gem
				texture_drum = orange_top_gem
				pattern = 16
			}
			{
				texture = orange_top_gem
				texture_drum = green_top_gem
				pattern = 1
			}
			{
				texture = kick_bar_purple
				texture_drum = kick_bar_white
				rgba = [255 255 255 255]
				pattern = 1048576
			}
		]
	else
		gems = [
			{
				texture = green_top_gem
				texture_drum = red_top_gem
				pattern = 65536
			}
			{
				texture = red_top_gem
				texture_drum = yellow_top_gem
				pattern = 4096
			}
			{
				texture = yellow_top_gem
				texture_drum = blue_top_gem
				pattern = 256
			}
			{
				texture = blue_top_gem
				texture_drum = orange_top_gem
				pattern = 16
			}
			{
				texture = orange_top_gem
				texture_drum = green_top_gem
				pattern = 1
			}
			{
				texture = kick_bar_white
				texture_drum = kick_bar_white
				rgba = [255 255 255 255]
				pattern = 1048576
			}
		]
	endif
	gem_pos_start = (19.0, 0.0)
	gem_offset = (44.0, 0.0)
	jam_menu_get_lefty player = <player>
	if (<jam_instrument> = 3)
		if NOT isguitarcontroller controller = <controller>
			<lefty> = 0
		endif
	endif
	if (<lefty> = 1)
		<gem_pos_start> = (<gem_pos_start> + (<gem_offset> * 4))
	endif
	gem_pos = <gem_pos_start>
	z_priority = 28
	formattext checksumname = gems_id 'jam_falling_gem_container_%s' s = <player>
	if NOT screenelementexists id = <gems_id>
		return
	endif
	getarraysize <gems>
	gem_count = 0
	gem_created = 0
	begin
	if (<gem_pattern> && (<gems> [<gem_count>].pattern))
		if NOT scriptisrunning \{jam_prevent_new_note}
			getplayerinfo <player> controller
			if isdrumcontroller controller = <controller>
				<gem_texture> = (<gems> [<gem_count>].texture_drum)
			else
				<gem_texture> = (<gems> [<gem_count>].texture)
			endif
			if (($jam_num_falling_gems + 1) >= $jam_falling_gem_limit)
				return
			else
				change jam_num_falling_gems = ($jam_num_falling_gems + 1)
			endif
			if (<gem_count> = 5)
				<gem_pos> = ((0.0, 0.0) - (3.0, 0.0))
				createscreenelement {
					type = spriteelement
					parent = <gems_id>
					texture = <gem_texture>
					just = [left center]
					rgba = (<gems> [<gem_count>].rgba)
					pos = <gem_pos>
					z_priority = (<z_priority> -1)
					scale = 0.83
				}
				<gem_id> = <id>
			else
				if (<lefty> = 1)
					<gem_pos> = (<gem_pos> - (<gem_offset> * <gem_count>))
				else
					<gem_pos> = (<gem_pos> + (<gem_offset> * <gem_count>))
				endif
				createscreenelement {
					type = spriteelement
					parent = <gems_id>
					just = [center center]
					scale = 0.8
					z_priority = <z_priority>
					texture = <gem_texture>
					pos = <gem_pos>
				}
				<gem_id> = <id>
				if NOT (<jam_instrument> = 3)
					if gotparam \{sustain}
						createscreenelement {
							type = spriteelement
							parent = <gems_id>
							just = [center top]
							texture = white
							rgba = ($jam_gem_colors [<gem_count>])
							pos = <gem_pos>
							dims = (10.0, 0.0)
							scale = 1
							z_priority = (<z_priority> -8)
						}
						<sustain_id> = <id>
					endif
				endif
			endif
			runscriptonscreenelement id = <id> jam_fretboard_update_falling_gem params = {
				player = <player>
				gem_pos = <gem_pos>
				gem_id = <gem_id>
				sustain_id = <sustain_id>
				sustain_global = <sustain>
			}
			<gem_pos> = <gem_pos_start>
			<gem_created> = 1
		endif
	endif
	<gem_count> = (<gem_count> + 1)
	repeat <array_size>
endscript

script jam_prevent_new_note 
	<mod_bpm> = (($jam_current_bpm) - 80)
	<percent_bpm> = (<mod_bpm> / 80.0)
	<res> = (10 - (<percent_bpm> * 10))
	<res> = (<res> + 10)
	wait <res> gameframes
	return
endscript

script jam_fretboard_update_falling_gem 
	getplayerinfo <player> jam_instrument
	if NOT (<jam_instrument> = 3)
		<global_id> = ($<sustain_global>)
	endif
	<fall_limit> = 270
	<kill_limit> = 230
	<start_sustain_limit> = 40
	<gem_dead> = 0
	<sustain_pos> = <gem_pos>
	<sustain_dims> = (10.0, 0.0)
	<past_start_limit> = 0
	<free_fall> = 0
	begin
	<seconds_per_measure> = ((60.0 / $jam_current_bpm) * 2)
	<y_inc> = ((<fall_limit> / <seconds_per_measure>) / 60)
	if (<gem_dead> = 0)
		<gem_pos> = (<gem_pos> + ((0.0, 1.0) * <y_inc>))
		<gem_id> :se_setprops pos = <gem_pos>
		if ((<gem_pos> [1]) > <kill_limit>)
			<gem_id> :die
			<gem_dead> = 1
			change jam_num_falling_gems = ($jam_num_falling_gems - 1)
			if NOT gotparam \{sustain_id}
				return
			endif
		endif
	endif
	if gotparam \{sustain_id}
		if ((<gem_pos> [1]) < <start_sustain_limit>)
			<sustain_pos> = (<sustain_pos> + ((0.0, 1.0) * <y_inc>))
			<sustain_id> :se_setprops pos = <sustain_pos>
			<past_start_limit> = 1
		else
			if ((<global_id> = ($<sustain_global>)) && (<free_fall> = 0))
				<sustain_dims> = (<sustain_dims> + ((0.0, 1.0) * <y_inc>))
				<sustain_id> :se_setprops dims = <sustain_dims>
			else
				<sustain_pos> = (<sustain_pos> + ((0.0, 1.0) * <y_inc>))
				<sustain_id> :se_setprops pos = <sustain_pos>
				if (<past_start_limit>)
					<free_fall> = 1
				endif
			endif
			if ((<sustain_pos> [1]) > <fall_limit>)
				<sustain_id> :die
				if screenelementexists id = <gem_id>
					<gem_id> :die
					change jam_num_falling_gems = ($jam_num_falling_gems - 1)
				endif
				return
			endif
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script jam_update_falling_gem_sustain 
	<cur_id> = ($<sustain_global>)
	if gotparam \{stop}
		if (<cur_id> > 0)
			<cur_id> = (<cur_id> * -1)
		else
			if ($jam_tutorial_status = active)
				broadcastevent \{type = jam_tutorial_sustain
					data = {
						sustain = 0
					}}
			endif
			<cur_id> = (<cur_id> - 1)
		endif
		change globalname = <sustain_global> newvalue = <cur_id>
		return
	endif
	if (<cur_id> < 0)
		<cur_id> = (<cur_id> * -1)
	endif
	<cur_id> = (<cur_id> + 1)
	if (<cur_id> > 1000)
		<cur_id> = 1
	endif
	if ($jam_tutorial_status = active)
		broadcastevent \{type = jam_tutorial_sustain
			data = {
				sustain = 1
			}}
	endif
	change globalname = <sustain_global> newvalue = <cur_id>
endscript

script jam_destroy_fretboard 
	formattext checksumname = base_id 'jam_fretboard_base_%s' s = <player>
	if screenelementexists id = <base_id>
		destroyscreenelement id = <base_id>
	endif
endscript

script jam_band_pause \{back_to_jam_band = 1
		shake = 1
		hide_ghmix = 0}
	if NOT gotparam \{forced_pause}
		if ($game_mode = training)
			return
		endif
	endif
	formattext checksumname = input_spawn 'input_spawn_%s' s = <select_player>
	killspawnedscript id = <input_spawn>
	kill_arpeggiator_loop select_player = <select_player> reset_pattern = true
	destroyplayerserverjaminput player = <select_player>
	getplayerinfo <select_player> jam_instrument
	if (<jam_instrument> = $jam_mic_id)
		jam_band_deactivate_mic select_player = <select_player>
	elseif (<jam_instrument> = 4)
		jam_input_melody_stop_sound
	endif
	jam_stop_sound jam_instrument = <jam_instrument>
	getplayerinfo <select_player> controller
	launchevent type = unfocus target = <event_cont>
	formattext checksumname = player_pause 'jam_band_pause_%s' s = <select_player>
	if screenelementexists id = <player_pause>
		destroyscreenelement id = <player_pause>
		if ($jam_advanced_record = 1)
			soundevent \{event = jam_advanced_record_pause_panel_out}
		endif
	endif
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
	if gotparam \{adv_record}
		createscreenelement {
			local_id = clip_window_pause
			type = windowelement
			parent = <player_cont>
			just = [left top]
			pos = (-210.0, -27.0)
			dims = (1040.0, 588.0)
		}
		createscreenelement {
			type = containerelement
			id = <player_pause>
			parent = <id>
			pos = (0.0, -500.0)
		}
		killspawnedscript \{name = jam_highway_select_quantize}
	else
		createscreenelement {
			type = containerelement
			id = <player_pause>
			parent = <player_cont>
			pos = (0.0, -500.0)
		}
	endif
	if gotparam \{adv_record}
		createscreenelement {
			parent = <player_pause>
			type = descinterface
			pos = (-143.0, 15.0)
			z_priority = 10
			alpha = 1
			desc = 'jam_advanced_pause_screen'
			inst_icon_texture = <inst_logo>
		}
		menu_pos = (2.0, 150.0)
		<pause_font_color> = [80 80 80 255]
		set_focus_color \{rgba = [
				255
				255
				255
				255
			]}
		set_unfocus_color rgba = <pause_font_color>
		if ($jam_advanced_record = 1)
			soundevent \{event = jam_advanced_record_pause_panel_in}
		endif
	else
		getplayerinfo <select_player> controller
		band_leader_alpha = 0
		if (<controller> = $primary_controller)
			<band_leader_alpha> = 1
		endif
		createscreenelement {
			parent = <player_pause>
			type = descinterface
			pos = (-141.0, 15.0)
			z_priority = 10
			alpha = 1
			desc = 'jam_band_pause_screen'
			inst_icon_texture = <inst_logo>
			player_number_text = <player_text>
			band_leader_alpha = <band_leader_alpha>
		}
		menu_pos = (2.0, 150.0)
		<pause_font_color> = [80 80 80 255]
		set_focus_color \{rgba = [
				220
				220
				220
				255
			]}
		set_unfocus_color rgba = <pause_font_color>
		if NOT ($jam_advanced_record = 1)
			soundevent \{event = menu_recording_pause_panel_in}
		endif
	endif
	formattext checksumname = scrolling_options 'scrolling_options_%s' s = <select_player>
	formattext checksumname = vmenu_options 'vmenu_options_%s' s = <select_player>
	if gotparam \{adv_record}
		<respawn> = -1
	elseif gotparam \{paused_at_inst}
		<respawn> = -1
	else
		<respawn> = 1
	endif
	new_menu {
		scrollid = <scrolling_options>
		vmenuid = <vmenu_options>
		menu_pos = <menu_pos>
		use_backdrop = 0
		default_colors = 0
		exclusive_device = <controller>
		event_handlers = [
			{pad_up ghmix_scroll params = {up <...>}}
			{pad_down ghmix_scroll params = {down <...>}}
			{pad_circle jam_band_remove_pause params = {player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = <respawn>}}
			{pad_start jam_band_remove_pause params = {player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = <respawn>}}
		]
		menu_parent = <player_pause>
	}
	if gotparam \{adv_record}
		pause_options = [
			{
				name_text = qs(0x06ec6cae)
				fit_to_dims = (100.0, 25.0)
				pause_script = jam_band_pause_effects
				allow_inst = [1 1 0 0 0 0]
			}
			{
				name_text = qs(0xbae0063c)
				fit_to_dims = (90.0, 25.0)
				pause_script = create_menu_jam_scales
				allow_inst = [1 1 1 0 1 0]
			}
			{
				name_text = qs(0x5137d418)
				fit_to_dims = (130.0, 25.0)
				pause_script = jam_band_pause_drum_loop
				allow_inst = [0 0 0 1 0 0]
				check_drum_machine
			}
			{
				name_text = qs(0xeb6e9c99)
				fit_to_dims = (130.0, 25.0)
				pause_script = jam_band_pause_drum_kit
				allow_inst = [0 0 0 1 0 0]
			}
			{
				name_text = qs(0x35280188)
				fit_to_dims = (170.0, 30.0)
				pause_script = jam_advanced_recording_toggle_drum_machine
				allow_inst = [0 0 0 1 0]
				is_toggle
				dont_show_if_drum_controller
			}
			{
				name_text = qs(0x938d30f9)
				fit_to_dims = (130.0, 25.0)
				pause_script = jam_band_pause_melody_kit
				allow_inst = [0 0 0 0 1 0]
			}
			{
				name_text = $bass_kits_option_string
				fit_to_dims = (130.0, 25.0)
				pause_script = jam_band_pause_bass_kit
				allow_inst = [0 0 1 0 0 0]
			}
			{
				name_text = qs(0x08701a86)
				fit_to_dims = (170.0, 30.0)
				pause_script = jam_advanced_recording_toggle_arpeggiator
				allow_inst = [0 1 1 0 1]
				is_toggle
			}
			{
				name_text = qs(0x7dfc8624)
				fit_to_dims = (120.0, 25.0)
				pause_script = jam_band_pause_settings
			}
			{
				name_text = ($mixer_mixer)
				fit_to_dims = (120.0, 25.0)
				pause_script = jam_band_pause_mixer
				allow_inst = [1 1 1 1 1 1]
				primary_only
			}
			{
				name_text = qs(0xed42927e)
				fit_to_dims = (110.0, 25.0)
				pause_script = jam_clear_track_check
			}
			{
				name_text = qs(0xe3c4a422)
				fit_to_dims = (80.0, 25.0)
				pause_script = jam_advanced_recording_undo
				init_script = jam_advanced_recording_init_undo
			}
			{
				name_text = qs(0xd40268ee)
				fit_to_dims = (70.0, 25.0)
				pause_script = jam_band_save_dialog
			}
			{
				name_text = qs(0x3a7c1e04)
				fit_to_dims = (150.0, 25.0)
				pause_script = guitar_jam_goto_rec_studio
			}
			{
				name_text = qs(0x55c34bc7)
				fit_to_dims = (70.0, 25.0)
				pause_script = jam_band_quit_dialog
			}
		]
	elseif gotparam \{paused_at_inst}
		if NOT (<hide_ghmix> = 1)
			pause_options = [
				{
					name_text = qs(0xe0fd1993)
					fit_to_dims = (160.0, 25.0)
					pause_script = guitar_jam_goto_advanced_rec
					primary_only
				}
				{
					name_text = qs(0xd40268ee)
					fit_to_dims = (70.0, 25.0)
					pause_script = jam_band_save_dialog
					primary_only
				}
				{
					name_text = qs(0x55c34bc7)
					fit_to_dims = (70.0, 25.0)
					pause_script = jam_band_quit_dialog
					primary_only
				}
			]
		else
			pause_options = [
				{
					name_text = qs(0xd40268ee)
					fit_to_dims = (70.0, 25.0)
					pause_script = jam_band_save_dialog
					primary_only
				}
				{
					name_text = qs(0x55c34bc7)
					fit_to_dims = (70.0, 25.0)
					pause_script = jam_band_quit_dialog
					primary_only
				}
			]
		endif
	else
		pause_options = [
			{
				name_text = qs(0x5137d418)
				fit_to_dims = (130.0, 25.0)
				pause_script = jam_band_pause_drum_loop
				allow_inst = [0 0 0 1 0 0]
				check_drum_machine
			}
			{
				name_text = qs(0x06ec6cae)
				fit_to_dims = (100.0, 25.0)
				pause_script = jam_band_pause_effects
				allow_inst = [1 1 0 0 0 0]
			}
			{
				name_text = qs(0x938d30f9)
				fit_to_dims = (130.0, 25.0)
				pause_script = jam_band_pause_melody_kit
				allow_inst = [0 0 0 0 1 0]
			}
			{
				name_text = qs(0xbae0063c)
				fit_to_dims = (90.0, 25.0)
				pause_script = create_menu_jam_scales
				allow_inst = [1 1 1 0 1 0]
			}
			{
				name_text = qs(0xeb6e9c99)
				fit_to_dims = (130.0, 25.0)
				pause_script = jam_band_pause_drum_kit
				allow_inst = [0 0 0 1 0 0]
			}
			{
				name_text = $bass_kits_option_string
				fit_to_dims = (130.0, 25.0)
				pause_script = jam_band_pause_bass_kit
				allow_inst = [0 0 1 0 0 0]
			}
			{
				name_text = qs(0x7dfc8624)
				fit_to_dims = (120.0, 25.0)
				pause_script = jam_band_pause_settings
				allow_inst = [1 1 1 1 1 0]
			}
			{
				name_text = ($mixer_mixer)
				fit_to_dims = (120.0, 25.0)
				pause_script = jam_band_pause_mixer
				allow_inst = [1 1 1 1 1 1]
				primary_only
			}
			{
				name_text = qs(0xed42927e)
				fit_to_dims = (110.0, 25.0)
				pause_script = jam_clear_track_check
				allow_inst = [1 1 1 1 1 0]
			}
			{
				name_text = qs(0xef20fa15)
				fit_to_dims = (180.0, 30.0)
				pause_script = jam_band_pause_new_instrument
			}
			{
				name_text = qs(0xe0fd1993)
				fit_to_dims = (160.0, 25.0)
				allow_inst = [1 1 1 1 1 0]
				pause_script = guitar_jam_goto_advanced_rec
				primary_only
			}
			{
				name_text = qs(0xd40268ee)
				fit_to_dims = (70.0, 25.0)
				pause_script = jam_band_save_dialog
				primary_only
			}
			{
				name_text = qs(0x55c34bc7)
				fit_to_dims = (70.0, 25.0)
				pause_script = jam_band_quit_dialog
				primary_only
			}
		]
	endif
	getplayerinfo <select_player> jam_instrument
	text_params = {type = textelement font = fontgrid_text_a3 just = [center center] scale = 1 rgba = <pause_font_color>}
	if screenelementexists \{id = jam_songwriter_container}
		jam_songwriter_container :gettags
	endif
	getarraysize <pause_options>
	option = 0
	begin
	fit_to_dims = (<pause_options> [<option>].fit_to_dims)
	formattext checksumname = option_id 'option_%a_%b' a = <option> b = <select_player>
	formattext checksumname = option_text_id 'option_text_%a_%b' a = <option> b = <select_player>
	option_text = (<pause_options> [<option>].name_text)
	if structurecontains structure = (<pause_options> [<option>]) is_toggle
		if (<jam_instrument> = 3)
			if ($is_drum_machine = 1)
				<option_text> = qs(0xb3dc0deb)
			else
				<option_text> = qs(0x35280188)
			endif
		else
			switch <jam_instrument>
				case 1
				machine_text = qs(0xe96c66cf)
				case 2
				machine_text = qs(0x327810f4)
				case 4
				machine_text = qs(0xaf9bd3b2)
			endswitch
			if (($is_arpeggiator [<jam_instrument>]) = 1)
				formattext textname = machine_text qs(0x326eef22) s = <machine_text>
				<option_text> = <machine_text>
			else
				formattext textname = machine_text qs(0x61146f69) s = <machine_text>
			endif
			<option_text> = <machine_text>
		endif
	endif
	show_option = 1
	if structurecontains structure = (<pause_options> [<option>]) allow_inst
		<show_option> = (<pause_options> [<option>].allow_inst [<jam_instrument>])
	endif
	if structurecontains structure = (<pause_options> [<option>]) dont_show_if_drum_controller
		if isdrumcontroller controller = <controller>
			<show_option> = 0
		endif
	endif
	if structurecontains structure = (<pause_options> [<option>]) check_drum_machine
		if NOT ($is_drum_machine = 1)
			<show_option> = 0
		endif
	endif
	if structurecontains structure = (<pause_options> [<option>]) check_arpeggiator
		if NOT (($is_arpeggiator [<jam_instrument>]) = 1)
			<show_option> = 0
		endif
	endif
	choose_script = (<pause_options> [<option>].pause_script)
	primary_only = 0
	if structurecontains structure = (<pause_options> [<option>]) primary_only
		if NOT (<controller> = ($primary_controller))
			<primary_only> = 1
			<choose_script> = jam_band_warning_box
		endif
	endif
	if gotparam \{pause_options_disabled}
		if ((<pause_options_disabled> [<option>]) = 0)
			<show_option> = 0
		endif
	endif
	if (<show_option> = 1)
		if structurecontains structure = (<pause_options> [<option>]) pause_script
			createscreenelement {
				type = containerelement
				id = <option_id>
				parent = <vmenu_options>
				dims = (100.0, 30.0)
				event_handlers = [
					{focus jam_pause_focus params = {id = <option_text_id>}}
					{unfocus jam_pause_unfocus params = {id = <option_text_id> primary_only = <primary_only>}}
					{pad_choose ui_menu_select_sfx}
					{pad_choose <choose_script> params = {player_cont = <player_cont> player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> text_id = <option_text_id> option = <option> vmenu_id = <vmenu_options> respawn_input = <respawn>}}
				]
			}
		else
			createscreenelement {
				type = containerelement
				id = <option_id>
				parent = <vmenu_options>
				dims = (100.0, 30.0)
				event_handlers = [
					{focus retail_menu_focus params = {id = <option_text_id>}}
					{unfocus retail_menu_unfocus params = {id = <option_text_id>}}
				]
			}
		endif
		option_rgba = <pause_font_color>
		if (<primary_only> = 1)
			<option_rgba> = [35 35 35 255]
		endif
		createscreenelement {
			type = textblockelement
			parent = <option_id>
			id = <option_text_id>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [center center]
			scale = 1
			rgba = <option_rgba>
			dims = (182.0, 32.0)
			text = <option_text>
			z_priority = 45
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = proportional
			text_case = original
		}
		if structurecontains structure = (<pause_options> [<option>]) init_script
			spawnscriptnow (<pause_options> [<option>].init_script) id = jam_band_spawns params = {option_id = <option_id> option_text_id = <option_text_id>}
		endif
	endif
	<option> = (<option> + 1)
	repeat <array_size>
	<show_note_limit> = 1
	if gotparam \{adv_record}
		<show_note_limit> = 1
	elseif gotparam \{paused_at_inst}
		<show_note_limit> = 0
	endif
	if (<show_note_limit> = 1)
		if NOT (<jam_instrument> = $jam_mic_id)
			getjamsessionsize track = ($jam_tracks [<jam_instrument>].id)
			formattext textname = num_notes qs(0x89be46a6) a = <track_size> b = (($gemarraysize) -1)
			if (<track_size> >= (($gemarraysize) -1))
				<limit_color> = [190 20 20 250]
			else
				<limit_color> = [150 150 150 255]
			endif
			createscreenelement {
				type = textblockelement
				parent = <player_pause>
				id = <note_limit>
				font = fontgrid_text_a3
				just = [center bottom]
				scale = 1
				rgba = <limit_color>
				pos = (0.0, 491.0)
				dims = (190.0, 30.0)
				internal_just = [center bottom]
				text = <num_notes>
				z_priority = 45
				fit_width = `scale each line if larger`
				fit_height = `scale down if larger`
				scale_mode = proportional
			}
			instrument_name = ($jam_tracks [<jam_instrument>].name_text)
		else
			instrument_name = qs(0xf98ebc1a)
		endif
		createscreenelement {
			type = textblockelement
			parent = <player_pause>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [center center]
			scale = 1
			rgba = [150 150 150 255]
			pos = (0.0, 450.0)
			dims = (170.0, 40.0)
			text = <instrument_name>
			z_priority = 45
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = proportional
			text_case = original
		}
	endif
	formattext checksumname = effect_info_box 'effect_info_box_%a' a = <select_player>
	if screenelementexists id = <effect_info_box>
		<effect_info_box> :se_setprops pos = (5.0, -555.0) time = 0.1
	endif
	if screenelementexists id = <scrolling_options>
		launchevent type = unfocus target = <vmenu_options>
	endif
	if NOT gotparam \{adv_record}
		formattext checksumname = base_id 'jam_fretboard_base_%s' s = <select_player>
		if screenelementexists id = <base_id>
			<base_id> :se_setprops pos = (0.0, 480.0) time = 0.1
		endif
		formattext checksumname = quick_tabs 'quick_tabs_%a' a = <select_player>
		if screenelementexists id = <quick_tabs>
			<quick_tabs> :se_setprops pos = (-116.0, -300.0) time = 0.1
			destroyscreenelement id = <quick_tabs>
		endif
		end_pos = (0.0, -40.0)
	else
		if screenelementexists id = <player_pause>
			<player_pause> :se_setprops pos = (133.0, -500.0)
		endif
		end_pos = (133.0, -57.0)
	endif
	if (<shake> = 1)
		getrandomvalue \{a = -0.7
			b = 0.7
			name = rot_amount}
		if screenelementexists id = <player_pause>
			<player_pause> :se_setprops rot_angle = <rot_amount> pos = (<end_pos> + (0.0, 10.0)) time = 0.1
			<player_pause> :se_waitprops
		endif
		getrandomvalue \{a = -0.5
			b = 0.5
			name = rot_amount}
		if screenelementexists id = <player_pause>
			<player_pause> :se_setprops rot_angle = <rot_amount> pos = (<end_pos> - (0.0, 10.0)) time = 0.07
			<player_pause> :se_waitprops
		endif
		getrandomvalue \{a = -0.3
			b = 0.3
			name = rot_amount}
		if screenelementexists id = <player_pause>
			<player_pause> :se_setprops rot_angle = <rot_amount> pos = (<end_pos> + (0.0, 5.0)) time = 0.07
			<player_pause> :se_waitprops
		endif
		getrandomvalue \{a = -0.2
			b = 0.2
			name = rot_amount}
		if screenelementexists id = <player_pause>
			<player_pause> :se_setprops rot_angle = <rot_amount> pos = (<end_pos> - (0.0, 3.0)) time = 0.07
			<player_pause> :se_waitprops
		endif
		if screenelementexists id = <player_pause>
			<player_pause> :se_setprops rot_angle = 0.0 pos = <end_pos> time = 0.07
			<player_pause> :se_waitprops
		endif
	else
		if screenelementexists id = <player_pause>
			<player_pause> :se_setprops pos = <end_pos> time = 0.1
			<player_pause> :se_waitprops
		endif
	endif
	formattext checksumname = gems_id 'jam_falling_gem_container_%s' s = <select_player>
	if screenelementexists id = <gems_id>
		if getscreenelementchildren id = <gems_id>
			getarraysize <children>
			change jam_num_falling_gems = ($jam_num_falling_gems - <array_size>)
			if ($jam_num_falling_gems < 0)
				change \{jam_num_falling_gems = 0}
			endif
		endif
	endif
	if NOT (<jam_instrument> = $jam_mic_id)
		if NOT gotparam \{paused_at_inst}
			if structurecontains structure = ($jam_tracks [<jam_instrument>]) ui_destroy_func
				formattext checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
				spawnscriptnow ($jam_tracks [<jam_instrument>].ui_destroy_func) id = <jam_player_spawns> params = {player = <select_player>}
			endif
		endif
	endif
	if gotparam \{adv_record}
		clean_up_user_control_helpers
		menu_jam_band_add_control_helpers \{state = pause_menu}
	else
		guitar_jam_simplerecops_command_stopplay
	endif
	if screenelementexists id = <scrolling_options>
		launchevent type = focus target = <vmenu_options>
	endif
endscript

script jam_pause_focus 
	if gotparam \{id}
		if screenelementexists id = <id>
			<id> :getsingletag old_font
			if NOT gotparam \{old_font}
				<id> :se_getprops
				<id> :settags old_font = <font>
			endif
			setscreenelementprops id = <id> font = fontgrid_text_a3 rgba = $menu_focus_color
		endif
	else
		getsingletag \{old_font}
		if NOT gotparam \{old_font}
			se_getprops
			settags old_font = <font>
		endif
		setprops \{font = fontgrid_text_a3
			rgba = $menu_focus_color}
	endif
endscript

script jam_pause_unfocus \{primary_only = 0}
	rgba = $menu_unfocus_color
	if (<primary_only> = 1)
		rgba = [35 35 35 255]
	endif
	if gotparam \{id}
		if screenelementexists id = <id>
			<id> :getsingletag old_font
			if NOT gotparam \{old_font}
				<id> :se_getprops
				<id> :settags old_font = <font>
			endif
			setscreenelementprops id = <id> font = fontgrid_text_a3 rgba = <rgba>
		endif
	else
		getsingletag \{old_font}
		if NOT gotparam \{old_font}
			se_getprops
			settags old_font = <font>
		endif
		setprops font = fontgrid_text_a3 rgba = <rgba>
	endif
endscript

script jam_band_pause_submenu 
	launchevent type = unfocus target = <vmenu_id>
	formattext checksumname = player_pause_submenu 'jam_band_pause_%a_%s' a = <submenu_name> s = <select_player>
	if screenelementexists id = <player_pause_submenu>
		destroyscreenelement id = <player_pause_submenu>
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
			id = <player_pause_submenu>
			parent = <player_cont>
			pos = (0.0, -40.0)
		}
		getplayerinfo <select_player> controller
		band_leader_alpha = 0
		if (<controller> = $primary_controller)
			<band_leader_alpha> = 1
		endif
		createscreenelement {
			parent = <player_pause_submenu>
			type = descinterface
			pos = (-141.0, 15.0)
			z_priority = 20
			alpha = 1
			desc = 'jam_band_pause_screen'
			inst_icon_texture = <inst_logo>
			player_number_text = <player_text>
			pause_header_text = <submenu_title>
			band_leader_alpha = <band_leader_alpha>
		}
		<pause_font_color> = [80 80 80 255]
		set_focus_color \{rgba = [
				220
				220
				220
				255
			]}
		set_unfocus_color rgba = <pause_font_color>
		menu_pos = (2.0, 152.0)
	else
		createscreenelement {
			local_id = clip_window_pause_submenu
			type = windowelement
			parent = <player_cont>
			just = [left top]
			pos = (-210.0, -27.0)
			dims = (1040.0, 588.0)
		}
		createscreenelement {
			type = containerelement
			id = <player_pause_submenu>
			parent = <id>
			pos = (133.0, -57.0)
		}
		createscreenelement {
			parent = <player_pause_submenu>
			type = descinterface
			pos = (-143.0, 15.0)
			z_priority = 20
			alpha = 1
			desc = 'jam_advanced_pause_screen'
			pause_header_text = <submenu_title>
			inst_icon_texture = <inst_logo>
		}
		<pause_font_color> = [80 80 80 255]
		set_focus_color \{rgba = [
				255
				255
				255
				255
			]}
		set_unfocus_color rgba = <pause_font_color>
		menu_pos = (2.0, 150.0)
	endif
	<added_heading> = 0
	if structurecontains structure = (<options_array> [0]) section_heading
		<added_heading> = 1
		<window_id> = <id>
		menu_pos = (2.0, 185.0)
		box_dims = (254.0, 130.0)
		gap_dims = (100.0, 40.0)
		getplayerinfo <select_player> jam_instrument
		switch (<jam_instrument>)
			case 0
			<inst_name> = qs(0x83066d15)
			case 1
			<inst_name> = qs(0xc7ab354e)
			case 2
			<inst_name> = qs(0xb6237ee8)
			box_dims = (254.0, 100.0)
			gap_dims = (100.0, 60.0)
			case 3
			<inst_name> = qs(0xbcbd3cf7)
			box_dims = (254.0, 100.0)
			gap_dims = (100.0, 60.0)
			case 4
			<inst_name> = qs(0x1e9534a0)
		endswitch
		createscreenelement {
			type = textblockelement
			parent = <window_id>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [center center]
			scale = 1
			rgba = [255 255 255 255]
			dims = (150.0, 32.0)
			pos = (140.0, 130.0)
			text = <inst_name>
			z_priority = 46
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = proportional
			text_case = original
		}
		createscreenelement {
			type = spriteelement
			parent = <window_id>
			texture = list_container
			just = [left , top]
			pos_anchor = [left , top]
			rgba = [150 150 150 255]
			pos = (17.0, 105.0)
			dims = <box_dims>
			alpha = 1
			z_priority = 40
		}
	else
		createscreenelement {
			type = textblockelement
			parent = <player_pause_submenu>
			text = qs(0xc08b018f)
			font = fontgrid_text_a8
			just = [center center]
			pos_anchor = [center center]
			rgba = [255 255 255 255]
			pos = (15.0, 138.0)
			alpha = 1
			z_priority = 100
			scale = 1.2
			dims = (50.0, 50.0)
		}
		createscreenelement {
			type = textblockelement
			parent = <player_pause_submenu>
			text = qs(0xc08b018f)
			font = fontgrid_text_a8
			just = [center center]
			pos_anchor = [center center]
			rgba = [255 255 255 255]
			pos = (-16.0, 410.0)
			alpha = 1
			z_priority = 100
			rot_angle = 180
			scale = 1.2
			dims = (50.0, 50.0)
		}
		if NOT gotparam \{no_preview}
			user_control_helper_get_buttonchar button = yellow controller = <controller>
			createscreenelement {
				parent = <player_pause_submenu>
				type = descinterface
				desc = 'helper_pill'
				auto_dims = false
				dims = (0.0, 36.0)
				scale = 1.1
				pos = (0.0, 458.0)
				just = [center center]
				z_priority = 100
				helper_button_text = <buttonchar>
				helper_description_text = qs(0x43b287ab)
				helper_pill_rgba = $user_control_pill_color
				helper_description_rgba = $user_control_pill_text_color
				helper_pill_body_dims = (150.0, 36.0)
			}
			<id> :se_getprops
			<id> :se_setprops {
				helper_pill_body_dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 32.0))
				dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (64.0, 32.0))
			}
		endif
	endif
	formattext checksumname = scrolling_options_submenu 'scrolling_options_%a_%s' a = <submenu_name> s = <select_player>
	formattext checksumname = vmenu_options_submenu 'vmenu_options_%a_%s' a = <submenu_name> s = <select_player>
	getplayerinfo <select_player> controller
	new_menu {
		scrollid = <scrolling_options_submenu>
		vmenuid = <vmenu_options_submenu>
		menu_pos = <menu_pos>
		use_backdrop = 0
		default_colors = 0
		dims = (150.0, 280.0)
		exclusive_device = <controller>
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_circle (<options_array> [<option>].submenu_exit_script) params = {
					select_player = <select_player>
					vmenu_options_submenu = <vmenu_options_submenu>
					scrolling_options_submenu = <scrolling_options_submenu>
					player_pause_submenu = <player_pause_submenu>
					vmenu_id = <vmenu_id>
				}}
			{pad_start (<options_array> [<option>].submenu_exit_script) params = {
					select_player = <select_player>
					vmenu_options_submenu = <vmenu_options_submenu>
					scrolling_options_submenu = <scrolling_options_submenu>
					player_pause_submenu = <player_pause_submenu>
					vmenu_id = <vmenu_id>
				}}
		]
		menu_parent = <player_pause_submenu>
	}
	text_params = {type = textelement font = fontgrid_text_a3 just = [center center] scale = 1 rgba = <pause_font_color>}
	getarraysize <options_array>
	option = 0
	if (<added_heading> = 1)
		<option> = 1
		<array_size> = (<array_size> -1)
	endif
	begin
	fit_to_dims = (<options_array> [<option>].fit_to_dims)
	formattext checksumname = option_id 'pause_submenu_%a_options_%b_%c' a = <submenu_name> b = <select_player> c = <option>
	formattext checksumname = option_text_id 'pause_submenu_%a_optext_%b_%c' a = <submenu_name> b = <select_player> c = <option>
	show_option = 1
	getplayerinfo <select_player> jam_instrument
	if structurecontains structure = (<options_array> [<option>]) allow_inst
		<show_option> = (<options_array> [<option>].allow_inst [<jam_instrument>])
	endif
	<deny_this_option> = 0
	if gotparam \{deny_index}
		if (<option> = <deny_index>)
			<deny_this_option> = 1
		endif
	endif
	if ((<option> = 3) && (<added_heading> = 1))
		createscreenelement {
			type = containerelement
			parent = <vmenu_options_submenu>
			dims = <gap_dims>
			not_focusable
		}
	endif
	if (<show_option> = 1)
		if structurecontains structure = (<options_array> [<option>]) submenu_preview_script
			createscreenelement {
				type = containerelement
				id = <option_id>
				parent = <vmenu_options_submenu>
				dims = (100.0, 30.0)
				event_handlers = [
					{focus jam_pause_focus params = {id = <option_text_id>}}
					{unfocus retail_menu_unfocus params = {id = <option_text_id>}}
					{pad_choose ui_menu_select_sfx}
					{pad_choose (<options_array> [<option>].submenu_script) params = {
							player = <select_player>
							option_index = <option>
							vmenu_options_submenu = <vmenu_options_submenu>
							scrolling_options_submenu = <scrolling_options_submenu>
							player_pause_submenu = <player_pause_submenu>
							vmenu_id = <vmenu_id>
							player_pause = <player_pause>
							scrolling_options = <scrolling_options>
							event_cont = <event_cont>
							option_text_id = <option_text_id>
							submenu_name = <submenu_name>
							option_id = <option_id>
						}}
					{pad_option2 (<options_array> [<option>].submenu_preview_script) params = {
							player = <select_player>
							option_index = <option>
							vmenu_options_submenu = <vmenu_options_submenu>
							scrolling_options_submenu = <scrolling_options_submenu>
							player_pause_submenu = <player_pause_submenu>
							vmenu_id = <vmenu_id>
							player_pause = <player_pause>
							scrolling_options = <scrolling_options>
							event_cont = <event_cont>
							option_text_id = <option_text_id>
							submenu_name = <submenu_name>
							option_id = <option_id>
						}}
				]
			}
		else
			createscreenelement {
				type = containerelement
				id = <option_id>
				parent = <vmenu_options_submenu>
				dims = (100.0, 30.0)
				event_handlers = [
					{focus jam_pause_focus params = {id = <option_text_id>}}
					{unfocus retail_menu_unfocus params = {id = <option_text_id>}}
					{pad_choose ui_menu_select_sfx}
					{pad_choose (<options_array> [<option>].submenu_script) params = {
							player = <select_player>
							option_index = <option>
							vmenu_options_submenu = <vmenu_options_submenu>
							scrolling_options_submenu = <scrolling_options_submenu>
							player_pause_submenu = <player_pause_submenu>
							vmenu_id = <vmenu_id>
							player_pause = <player_pause>
							scrolling_options = <scrolling_options>
							event_cont = <event_cont>
							option_text_id = <option_text_id>
							submenu_name = <submenu_name>
							option_id = <option_id>
						}}
				]
			}
		endif
		if (<deny_this_option> = 1)
			<option_id> :se_setprops not_focusable
		endif
		if gotparam \{selectable_choices}
			if (<option> = <current_submenu_choice>)
				formattext checksumname = selector_id 'pause_submenu_%a_selector_%b' a = <submenu_name> b = <select_player>
				createscreenelement {
					type = spriteelement
					parent = <option_id>
					id = <selector_id>
					texture = white
					just = [center center]
					rgba = [200 200 200 255]
					pos = (-1.0, 13.0)
					dims = (185.0, 2.0)
					z_priority = 52
					alpha = 0
				}
				createscreenelement {
					type = spriteelement
					parent = <selector_id>
					texture = white
					just = [left center]
					rgba = [200 200 200 255]
					pos = (0.0, -25.0)
					dims = (185.0, 2.0)
					z_priority = 52
					alpha = 0
				}
			endif
		endif
		if (<added_heading> = 0)
			option_pos = (0.0, 0.0)
			option_dims = (170.0, 34.0)
		else
			option_pos = (-5.0, 0.0)
			option_dims = (145.0, 34.0)
		endif
		option_text = ((<options_array> [<option>]).name_text)
		createscreenelement {
			type = textblockelement
			parent = <option_id>
			id = <option_text_id>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [center center]
			scale = 1
			rgba = <pause_font_color>
			dims = <option_dims>
			pos = <option_pos>
			text = <option_text>
			z_priority = 80
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = proportional
			text_case = original
		}
		if (<deny_this_option> = 1)
			<option_text_id> :se_setprops rgba = [150 150 150 255]
		endif
		if structurecontains structure = (<options_array> [<option>]) submenu_init_script
			spawnscriptnow (<options_array> [<option>].submenu_init_script) id = jam_band_spawns params = {player = <select_player> submenu_name = <submenu_name> option_index = <option> option_text_id = <option_text_id>}
		endif
	endif
	<option> = (<option> + 1)
	repeat <array_size>
	if ($jam_advanced_record = 1)
		clean_up_user_control_helpers
		menu_jam_band_add_control_helpers \{state = pause_submenu}
	endif
	if screenelementexists id = <scrolling_options_submenu>
		launchevent type = focus target = <vmenu_options_submenu> data = {child_index = <current_submenu_choice>}
	endif
endscript

script jam_band_warning_box 
	jam_destroy_player_info_box player = <select_player>
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player>
	message = qs(0x1ed472de)
	formattext checksumname = warning_box 'jam_band_warning_box_%a' a = <select_player>
	if screenelementexists id = <warning_box>
	endif
	event_handlers = [{pad_back jam_band_warning_box_back params = {<...>}}]
	createscreenelement {
		parent = <player_cont>
		id = <warning_box>
		type = descinterface
		pos_anchor = [center center]
		just = [center center]
		pos = (4.0, 175.0)
		scale = 1
		desc = 'jam_band_warning_box'
		exclusive_device = <device_num>
		event_handlers = <event_handlers>
	}
	launchevent target = <warning_box> type = focus
endscript

script jam_band_warning_box_back 
	formattext checksumname = warning_box 'jam_band_warning_box_%a' a = <select_player>
	<warning_box> :legacydomorph alpha = 0 time = 0.1
	if screenelementexists id = <warning_box>
		destroyscreenelement id = <warning_box>
	endif
	jam_create_player_info player = <select_player> player_cont = <player_cont> jam_create_player_info
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = 1
endscript

script jam_band_controller_warning_box 
	jam_destroy_player player = <player>
	getplayerinfo <player> controller
	if isps3
		message = qs(0x588788f4)
	else
		message = qs(0xec4dbd17)
	endif
	formattext checksumname = warning_box 'jam_band_warning_box_%a' a = <player>
	if screenelementexists id = <warning_box>
		destroyscreenelement id = <warning_box>
	endif
	event_handlers = [{pad_back jam_band_controller_warning_box_back params = {<...>}}]
	createscreenelement {
		type = containerelement
		parent = jam_band_container
		id = <warning_box>
		pos = ($jam_cont_start_pos + (1.0, 0.0) * ($jam_cont_offset * (<player> - 1)))
		event_handlers = <event_handlers>
	}
	createscreenelement {
		parent = <warning_box>
		type = descinterface
		pos_anchor = [center center]
		just = [center center]
		pos = (4.0, 175.0)
		scale = 1
		desc = 'jam_band_warning_box'
		exclusive_device = <controller>
		warning_text = <message>
	}
	launchevent target = <warning_box> type = focus
endscript

script jam_band_controller_warning_box_back 
	formattext checksumname = warning_box 'jam_band_warning_box_%a' a = <player>
	<warning_box> :legacydomorph alpha = 0 time = 0.1
	if screenelementexists id = <warning_box>
		destroyscreenelement id = <warning_box>
	endif
	jam_create_player_container player = <player>
endscript

script jam_band_pause_effects 
	printstruct channel = effectsmenudump <...>
	if NOT ($jam_advanced_record = 1)
		jam_destroy_player_info_box player = <select_player>
	endif
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player>
	if ($jam_advanced_record = 1)
		clean_up_user_control_helpers
		menu_jam_band_add_control_helpers \{state = effects_menu}
	endif
	formattext checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
	spawnscriptnow line6_pod id = <jam_player_spawns> params = {<...>}
	soundevent \{event = jam_mode_fxhud_on}
	broadcastevent \{type = jam_open_effects_menu}
endscript

script line6_pod 
	printf \{channel = jam_mode
		qs(0x10c9ea18)}
	formattext checksumname = line6_pod_id 'line6_pod_%a' a = <select_player>
	formattext checksumname = line6_pod_window_element_id 'line6_pod_window_element_%a' a = <select_player>
	event_handlers = [{pad_back line6_pod_back params = {<...>}}
		{pad_down line6_pod_effect_change params = {up <...>}}
		{pad_up line6_pod_effect_change params = {down <...>}}
		{pad_option2 line6_pod_unlock_toggle params = {<...>}}
		{pad_start line6_pod_remove params = {<...>}}
		{pad_choose ui_menu_select_sfx}
		{pad_choose line6_pod_remove params = {<...>}}]
	cheat_alpha = 1
	if ($cheat_line6unlock = 1)
		<cheat_alpha> = 0
	endif
	if NOT ($jam_advanced_record = 1)
		createscreenelement {
			parent = <player_cont>
			id = <line6_pod_window_element_id>
			type = windowelement
			pos = (0.0, 200.0)
			dims = (200.0, 550.0)
			just = [center center]
			internal_just = [center center]
		}
		createscreenelement {
			parent = <line6_pod_window_element_id>
			id = <line6_pod_id>
			type = descinterface
			pos_anchor = [center center]
			just = [center center]
			pos = (0.0, -400.0)
			scale = 0.4
			desc = 'line6_pod_advanced'
			exclusive_device = <device_num>
			event_handlers = <event_handlers>
			code_box_alpha = 0
			helper_alpha = <cheat_alpha>
			helper_button_text = qs(0x3ea0c2b5)
		}
		<line6_pod_id> :settags {code_box = 0}
		end_pos = (0.0, -40.0)
	else
		createscreenelement {
			type = windowelement
			id = <line6_pod_window_element_id>
			parent = <player_cont>
			just = [left top]
			pos = (-120.0, -50.0)
			dims = (800.0, 575.0)
		}
		createscreenelement {
			parent = <line6_pod_window_element_id>
			id = <line6_pod_id>
			type = descinterface
			desc = 'line6_pod_advanced'
			pos = (-222.0, -600.0)
			exclusive_device = <device_num>
			event_handlers = <event_handlers>
			code_box_alpha = 0
			helper_alpha = <cheat_alpha>
			helper_button_text = qs(0x3ea0c2b5)
		}
		<line6_pod_id> :settags {code_box = 0}
		end_pos = (-222.0, -70.0)
		launchevent \{type = unfocus
			target = jam_control_container}
		killspawnedscript \{name = jam_highway_select_quantize}
	endif
	line6_pod_update_effect select_player = <select_player> line6_pod_id = <line6_pod_id>
	getplayerinfo <select_player> jam_instrument
	<curr_effect> = ($jam_current_instrument_effects [<jam_instrument>])
	<line6_pod_id> :settags {previous_effect = <curr_effect>}
	<line6_pod_id> :legacydomorph pos = (<end_pos> + (0.0, 10.0)) time = 0.1
	<line6_pod_id> :legacydomorph pos = (<end_pos> - (0.0, 10.0)) time = 0.1
	<line6_pod_id> :legacydomorph pos = (<end_pos> + (0.0, 5.0)) time = 0.1
	<line6_pod_id> :legacydomorph pos = (<end_pos> - (0.0, 3.0)) time = 0.1
	<line6_pod_id> :legacydomorph pos = <end_pos> time = 0.1
	if NOT ($jam_advanced_record = 1)
		<line6_pod_id> :se_setprops scale = 1.05 pos = (0.0, -40.0) time = 0.1
		<line6_pod_id> :se_waitprops
		<line6_pod_id> :se_setprops scale = 0.95 pos = (0.0, -40.0) time = 0.05
		<line6_pod_id> :se_waitprops
		<line6_pod_id> :se_setprops scale = 1.0 pos = (0.0, -40.0) time = 0.05
		<line6_pod_id> :se_waitprops
	endif
	launchevent target = <line6_pod_id> type = focus
endscript

script line6_pod_unlock_toggle 
	if ($cheat_line6unlock = 1)
		return
	endif
	<line6_pod_id> :gettags
	formattext checksumname = scroll_id1 'line6_scrolling_text2_%s' s = <select_player>
	formattext checksumname = scroll_id2 'line6_scrolling_text1_%s' s = <select_player>
	if (<code_box> = 0)
		<line6_pod_id> :se_setprops helper_description_text = qs(0xd18ad640)
		<line6_pod_id> :se_setprops code_box_alpha = 1 time = 0.1
		<line6_pod_id> :settags {code_box = 1}
		soundevent \{event = recording_start}
		if <line6_pod_id> :desc_resolvealias name = scrolling_text_window1
			createscreenelement {
				type = containerelement
				parent = <resolved_id>
				id = <scroll_id1>
				pos = (0.0, 0.0)
				just = [left top]
				scale = 0.75
			}
			text = qs(0x6e5155ba)
			createscreenelement {
				type = textblockelement
				parent = <scroll_id1>
				font = fontgrid_text_a3
				just = [left top]
				internal_just = [center center]
				rgba = [224 , 224 , 224 , 255]
				dims = (250.0, 50.0)
				pos = (-2.0, 0.0)
				text = <text>
				fit_width = `scale each line if larger`
				fit_height = `scale down if larger`
				scale_mode = proportional
				text_case = original
				z_priority = 65
			}
		endif
		if <line6_pod_id> :desc_resolvealias name = scrolling_text_window2
			text = qs(0xb13f3841)
			createscreenelement {
				type = containerelement
				parent = <resolved_id>
				id = <scroll_id2>
				pos = (0.0, 0.0)
				just = [left top]
				scale = 0.75
			}
			<scroll_id1> :obj_spawnscript line6_pod_scrolling_text params = {parent = <resolved_id> scroll_id = <scroll_id2> text = <text> scale = 0.75 time = 10}
		endif
	else
		<line6_pod_id> :se_setprops helper_description_text = qs(0xba912d99)
		<line6_pod_id> :se_setprops code_box_alpha = 0 time = 0.1
		<line6_pod_id> :settags {code_box = 0}
		if screenelementexists id = <scroll_id1>
			destroyscreenelement id = <scroll_id1>
		endif
		if screenelementexists id = <scroll_id2>
			destroyscreenelement id = <scroll_id2>
		endif
		soundevent \{event = recording_stop}
	endif
endscript

script line6_pod_scrolling_text \{scale = 1
		parent = root_window}
	createscreenelement {
		type = textelement
		parent = <scroll_id>
		just = [left top]
		pos = (0.0, 0.0)
		scale = 1.0
		text = <text>
		font = fontgrid_text_a3
		rgba = [224 , 224 , 224 , 255]
		z_priority = 65
	}
	getscreenelementdims id = <id>
	new_width = (<width> + 50)
	createscreenelement {
		type = textelement
		parent = <scroll_id>
		just = [left top]
		pos = ((1.0, 0.0) * <new_width>)
		scale = 1.0
		text = <text>
		font = fontgrid_text_a3
		rgba = [224 , 224 , 224 , 255]
		z_priority = 65
	}
	<scroll_id> :se_setprops pos = (0.0, 0.0)
	begin
	<scroll_id> :se_setprops pos = ((-1.0, 0.0) * (<new_width> * <scale>)) time = <time>
	<scroll_id> :se_waitprops
	<scroll_id> :se_setprops pos = (0.0, 0.0)
	repeat
endscript

script line6_pod_update_effect 
	getplayerinfo <select_player> jam_instrument
	switch (<jam_instrument>)
		case 0
		op_array = ($jam_rhythm_effects)
		case 1
		op_array = ($jam_lead_effects)
		case 2
		op_array = ($jam_bass_effects)
	endswitch
	<curr_effect> = ($jam_current_instrument_effects [<jam_instrument>])
	formattext checksumname = line6_pod_id 'line6_pod_%a' a = <select_player>
	<line6_pod_id> :settags {previous_effect = <effect>}
	<line6_pod_id> :setprops effect_text = (<op_array> [<curr_effect>].name_text)
	<line6_pod_id> :setprops amp_text = (<op_array> [<curr_effect>].amp_text)
	<line6_pod_id> :setprops fx_text = (<op_array> [<curr_effect>].fx_text)
	<line6_pod_id> :setprops cab_text = (<op_array> [<curr_effect>].cab_text)
endscript

script line6_pod_remove 
	soundevent \{event = jam_mode_fxhud_off}
	killspawnedscript \{name = line6_pod_scrolling_text}
	getplayerinfo <select_player> jam_instrument
	guitar_jam_effects_toggle_active jam_instrument = <jam_instrument> force_state = on
	printf \{channel = jam_mode
		qs(0xd6a9a3eb)}
	if screenelementexists id = <line6_pod_id>
		if NOT ($jam_advanced_record = 1)
			end_pos = (0.0, -400.0)
		else
			end_pos = (-222.0, -600.0)
		endif
		<line6_pod_id> :legacydomorph pos = <end_pos> time = 0.1
		launchevent target = <line6_pod_id> type = unfocus
		destroyscreenelement id = <line6_pod_id>
	endif
	if screenelementexists id = <line6_pod_window_element_id>
		destroyscreenelement id = <line6_pod_window_element_id>
	endif
	if NOT ($jam_advanced_record = 1)
		jam_create_player_info player = <select_player> player_cont = <player_cont> jam_create_player_info
		jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = 1
	else
		jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = -1
		killspawnedscript \{name = jam_highway_select_quantize}
		spawnscriptnow \{jam_highway_select_quantize
			id = jam_recording_spawns}
	endif
	if ($jam_tutorial_status = active)
		<curr_effect> = ($jam_current_instrument_effects [<jam_instrument>])
		broadcastevent type = jam_tutorial_changed_effect data = {effect = <curr_effect>}
	endif
	killspawnedscript \{name = guitar_jam_settings_preview_effect}
	stopsound \{$jam_settings_effect_lead_sample
		fade_time = 0.1
		fade_type = linear}
	stopsound \{$jam_settings_effect_rhythm_sample
		fade_time = 0.1
		fade_type = linear}
endscript

script line6_pod_effect_change 
	printf \{channel = jam_mode
		qs(0x4eb9c86b)}
	getplayerinfo <select_player> jam_instrument
	switch (<jam_instrument>)
		case 0
		op_array = ($jam_rhythm_effects)
		case 1
		op_array = ($jam_lead_effects)
		case 2
		op_array = ($jam_bass_effects)
	endswitch
	<effect> = ($jam_current_instrument_effects [<jam_instrument>])
	getarraysize <op_array>
	if NOT ($cheat_line6unlock = 1)
		if (<jam_instrument> = 0)
			<array_size> = $num_unlocked_line6_effect_rhythm
		else
			<array_size> = $num_unlocked_line6_effect_lead
		endif
	endif
	if gotparam \{up}
		soundevent \{event = line6_scroll_up}
		<effect> = (<effect> + 1)
		if (<effect> >= <array_size>)
			<effect> = 0
		endif
		setarrayelement arrayname = jam_current_instrument_effects globalarray index = <jam_instrument> newvalue = <effect>
		<line6_pod_id> :setprops up_arrow_scale = 1.7
		<line6_pod_id> :setprops up_arrow_scale = 1.2 time = 0.15
	else
		soundevent \{event = line6_scroll_up}
		<effect> = (<effect> - 1)
		if (<effect> < 0)
			<effect> = (<array_size> - 1)
		endif
		setarrayelement arrayname = jam_current_instrument_effects globalarray index = <jam_instrument> newvalue = <effect>
		<line6_pod_id> :setprops down_arrow_scale = 1.7
		<line6_pod_id> :setprops down_arrow_scale = 1.2 time = 0.15
	endif
	if (<jam_instrument> = 0)
		stopsound \{$jam_settings_effect_rhythm_sample
			fade_time = 0.1
			fade_type = linear}
		wait \{0.15
			seconds}
	endif
	if (<jam_instrument> = 1)
		stopsound \{$jam_settings_effect_lead_sample
			fade_time = 0.1
			fade_type = linear}
		wait \{0.15
			seconds}
	endif
	guitar_jam_effects_toggle_active jam_instrument = <jam_instrument> force_state = on
	line6_pod_update_effect select_player = <select_player> line6_pod_id = <line6_pod_id>
	spawnscriptnow guitar_jam_settings_preview_effect params = {jam_instrument = <jam_instrument>}
endscript

script line6_pod_back 
	getplayerinfo <select_player> jam_instrument
	formattext checksumname = line6_pod_id 'line6_pod_%a' a = <select_player>
	<line6_pod_id> :gettags
	setarrayelement arrayname = jam_current_instrument_effects globalarray index = <jam_instrument> newvalue = <previous_effect>
	line6_pod_remove <...>
	if ($jam_advanced_record)
		jam_recording_pause \{params = {
				back_to_jam_band = 0
			}}
	else
		jam_band_pause select_player = <select_player> player_cont = <player_cont> event_cont = <event_cont>
	endif
	if screenelementexists id = <line6_pod_window_element_id>
		destroyscreenelement id = <line6_pod_window_element_id>
	endif
endscript
jam_settings_effect_lead_sample = null
jam_settings_effect_rhythm_sample = null

script guitar_jam_settings_preview_effect 
	if (<jam_instrument> = 0)
		stopsound \{$jam_settings_effect_rhythm_sample
			fade_time = 0.1
			fade_type = linear}
		wait \{1
			gameframe}
		jam_get_sample_checksum \{fret = 0
			string = 0
			type = 0
			jam_instrument = 0
			chord_type = 0}
		playsound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_rhythmguitar
		change jam_settings_effect_rhythm_sample = <sample_checksum>
	else
		stopsound \{$jam_settings_effect_lead_sample
			fade_time = 0.1
			fade_type = linear}
		wait \{1
			gameframe}
		jam_get_sample_checksum \{fret = 0
			string = 0
			type = 0
			jam_instrument = 1}
		playsound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_leadguitar
		change jam_settings_effect_lead_sample = <sample_checksum>
	endif
endscript
pause_drum_kit_options = [
	{
		name_text = qs(0x083da487)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0x8c4362ac)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0x4d52fc8b)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0xfe3a0ec0)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0xdc91cbc7)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0x3d9fff99)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0xab67c023)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0xa89adf58)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0x4906ac19)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0xd5fb15a5)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0x5b2da104)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0xec704d64)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0x18b01739)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0xd3ccbd55)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0x3255a109)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0x67301359)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0xbd5c5092)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0x5e8c371c)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0xa3f7d085)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
	{
		name_text = qs(0x20b29f07)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
]

script jam_band_pause_drum_kit 
	op_array = $pause_drum_kit_options
	getplayerinfo <select_player> jam_instrument
	jam_band_pause_submenu {
		submenu_name = 'drum_kit'
		submenu_title = qs(0xeb6e9c99)
		player_cont = <player_cont>
		player_pause = <player_pause>
		scrolling_options = <scrolling_options>
		event_cont = <event_cont>
		select_player = <select_player>
		text_id = <text_id>
		option = ($jam_current_drum_kit)
		vmenu_id = <vmenu_id>
		options_array = <op_array>
		selectable_choices
		current_submenu_choice = ($jam_current_drum_kit)
	}
	broadcastevent \{type = jam_open_drumkit_menu}
endscript

script guitar_jam_change_drum_kit 
	formattext checksumname = selector_id 'pause_submenu_drum_kit_selector_%b' b = <player>
	formattext checksumname = option_id 'pause_submenu_drum_kit_options_%b_%c' b = <player> c = <option_index>
	<selector_id> :setprops parent = <option_id>
	launchevent type = unfocus target = <option_id>
	launchevent type = unfocus target = <vmenu_options_submenu>
	getarraysize \{$drum_kits}
	if ((<option_index> >= <array_size>) || (<option_index> < 0))
		<option_index> = 0
	endif
	change jam_current_drum_kit = <option_index>
	setsonginfo \{drum_kit = $jam_current_drum_kit}
	loaddrumkitall drum_kit = ($drum_kits [<option_index>].string_id) percussion_kit = ($drum_kits [<option_index>].percussion_string_id) reset_percussion = 0 async = 0
	formattext checksumname = cur_kit 'current_drumkit_txt_%a' a = <player>
	if screenelementexists id = <cur_kit>
		<cur_kit> :se_setprops text = (($pause_drum_kit_options) [<option_index>].name_text)
	endif
	launchevent type = focus target = <option_id>
	if ($jam_tutorial_status = active)
		broadcastevent type = jam_change_drum_kit data = {new_kit = <option_index>}
	endif
	<respawn> = 0
	if ($jam_advanced_record = 0)
		formattext checksumname = player_info_element 'player_info_element_%a' a = <player>
		formattext textname = extra_info_text qs(0x4d4555da) s = (($pause_drum_kit_options) [<option_index>].name_text)
		<respawn> = 1
		if screenelementexists id = <player_info_element>
			<player_info_element> :se_setprops extra_info_text = <extra_info_text>
		endif
	endif
	jam_band_remove_pause_submenu choose vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <player> respawn_input = <respawn>
endscript

script jam_drum_kit_preview 
	launchevent type = unfocus target = <option_id>
	launchevent type = unfocus target = <vmenu_options_submenu>
	old_drum_kit = ($jam_current_drum_kit)
	loaddrumkitall drum_kit = ($drum_kits [<option_index>].string_id) percussion_kit = ($drum_kits [<option_index>].percussion_string_id) async = 0
	getarraysize \{$drum_kits}
	if ((<option_index> >= <array_size>) || (<option_index> < 0))
		<option_index> = 0
	endif
	change jam_current_drum_kit = <option_index>
	jam_input_drum_strum hold_pattern = 1048576 velocity = 100 controller = <controller> buss = jammode_drums select_player = <player> loop_pitch = 0 loop
	wait \{0.2
		seconds}
	jam_input_drum_strum hold_pattern = 4096 velocity = 100 controller = <controller> buss = jammode_drums select_player = <player> loop_pitch = 0 loop
	wait \{0.2
		seconds}
	jam_input_drum_strum hold_pattern = 16 velocity = 100 controller = <controller> buss = jammode_drums select_player = <player> loop_pitch = 0 loop
	wait \{0.2
		seconds}
	jam_input_drum_strum hold_pattern = 65536 velocity = 100 controller = <controller> buss = jammode_drums select_player = <player> loop_pitch = 0 loop
	wait \{0.2
		seconds}
	jam_input_drum_strum hold_pattern = 256 velocity = 100 controller = <controller> buss = jammode_drums select_player = <player> loop_pitch = 0 loop
	wait \{0.2
		seconds}
	jam_input_drum_strum hold_pattern = 1 velocity = 100 controller = <controller> buss = jammode_drums select_player = <player> loop_pitch = 0 loop
	wait \{0.2
		seconds}
	jam_input_drum_strum hold_pattern = 1048576 velocity = 100 controller = <controller> buss = jammode_drums select_player = <player> loop_pitch = 0 loop percussion = 1
	wait \{0.2
		seconds}
	jam_input_drum_strum hold_pattern = 4096 velocity = 100 controller = <controller> buss = jammode_drums select_player = <player> loop_pitch = 0 loop percussion = 1
	wait \{0.2
		seconds}
	jam_input_drum_strum hold_pattern = 16 velocity = 100 controller = <controller> buss = jammode_drums select_player = <player> loop_pitch = 0 loop percussion = 1
	wait \{0.2
		seconds}
	jam_input_drum_strum hold_pattern = 65536 velocity = 100 controller = <controller> buss = jammode_drums select_player = <player> loop_pitch = 0 loop percussion = 1
	wait \{0.2
		seconds}
	jam_input_drum_strum hold_pattern = 256 velocity = 100 controller = <controller> buss = jammode_drums select_player = <player> loop_pitch = 0 loop percussion = 1
	wait \{0.2
		seconds}
	jam_input_drum_strum hold_pattern = 1 velocity = 100 controller = <controller> buss = jammode_drums select_player = <player> loop_pitch = 0 loop percussion = 1
	wait \{0.2
		seconds}
	change jam_current_drum_kit = <old_drum_kit>
	launchevent type = focus target = <option_id>
	launchevent type = focus target = <vmenu_options_submenu>
	printf \{channel = jam_mode
		qs(0x917e367f)}
endscript

script guitar_jam_drum_kit_exit 
	if ($jam_tutorial_status = active)
		return
	endif
	launchevent type = unfocus target = <option_id>
	launchevent type = unfocus target = <vmenu_options_submenu>
	loaddrumkitall drum_kit = ($drum_kits [($jam_current_drum_kit)].string_id) percussion_kit = ($drum_kits [($jam_current_drum_kit)].percussion_string_id) async = 0
	jam_band_remove_pause_submenu vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript
pause_melody_kit_options = [
	{
		name_text = qs(0xcfc844eb)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'rev_bass1'
		sample_start = rev_bass1
	}
	{
		name_text = qs(0xe4e51728)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'rev_bass2'
		sample_start = rev_bass2
	}
	{
		name_text = qs(0xfdfe2669)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'rev_bass3'
		sample_start = rev_bass3
	}
	{
		name_text = qs(0xb2bfb0ae)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'rev_bass4'
		sample_start = rev_bass4
	}
	{
		name_text = qs(0x3f1859c7)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'csd_sweepcrazy'
		sample_start = csd_sweepcrazy
	}
	{
		name_text = qs(0x957f07e2)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'm_fat1'
		sample_start = m_fat1
	}
	{
		name_text = qs(0xbe525421)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'm_fat2'
		sample_start = m_fat2
	}
	{
		name_text = qs(0xa7496560)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'm_fat3'
		sample_start = m_fat3
	}
	{
		name_text = qs(0xe808f3a7)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'm_fat5'
		sample_start = m_fat5
	}
	{
		name_text = qs(0xf113c2e6)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'm_fat6'
		sample_start = m_fat6
	}
	{
		name_text = qs(0xbe66d392)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'm_bass1'
		sample_start = m_bass1
	}
	{
		name_text = qs(0xe4d0cb85)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'm_bass_filter_in'
		sample_start = m_bass_filter_in
	}
	{
		name_text = qs(0xb6195674)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'm_fat_high'
		sample_start = m_fat_high
	}
	{
		name_text = qs(0x782c2127)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'm_fat_high2'
		sample_start = m_fat_high2
	}
	{
		name_text = qs(0xfbafafee)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'kz_breathy'
		sample_start = kz_breathy
	}
	{
		name_text = qs(0xd8c6a189)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'balleric'
		sample_start = balleric
	}
	{
		name_text = qs(0x02b6bf4e)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'csd_sweep'
		sample_start = csd_sweep
	}
	{
		name_text = qs(0x09c9306c)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'Breathy_pad'
		sample_start = breathy_pad
	}
	{
		name_text = qs(0x6967ff29)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'mk_brightsynth'
		sample_start = mk_brightsynth
	}
	{
		name_text = qs(0xd8d84155)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'csd_sweep2'
		sample_start = csd_sweep2
	}
	{
		name_text = qs(0xe8b5e268)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'calc'
		sample_start = calc
	}
	{
		name_text = qs(0x17244719)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'kz_deepbliss'
		sample_start = kz_deepbliss
	}
	{
		name_text = qs(0xc2f7511b)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'deepsh101'
		sample_start = deepsh101
	}
	{
		name_text = qs(0x9f30d573)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'kz_acid'
		sample_start = kz_acid
	}
	{
		name_text = qs(0x920e7f81)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'kz_choir'
		sample_start = kz_choir
	}
	{
		name_text = qs(0x486b579e)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'kz_india'
		sample_start = kz_india
	}
	{
		name_text = qs(0xaad94533)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'kz_digiorg'
		sample_start = kz_digiorg
	}
	{
		name_text = qs(0x5526b593)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'india_drone'
		sample_start = india_drone
	}
	{
		name_text = qs(0x480e3516)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'mk_greatness'
		sample_start = mk_greatness
	}
	{
		name_text = qs(0xcbb153fa)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'europe'
		sample_start = europe
	}
	{
		name_text = qs(0x81f22ff2)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'mk_fatbass'
		sample_start = mk_fatbass
	}
	{
		name_text = qs(0x356380f9)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'mk_fatbrass'
		sample_start = mk_fatbrass
	}
	{
		name_text = qs(0x585130a8)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'fif'
		sample_start = fif
	}
	{
		name_text = qs(0xa50bd0b1)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'kz_flute'
		sample_start = kz_flute
	}
	{
		name_text = qs(0xbe4162e7)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'horror12'
		sample_start = horror12
	}
	{
		name_text = qs(0x438cbefb)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'horror1'
		sample_start = horror1
	}
	{
		name_text = qs(0x31ac429c)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'mk_housebass'
		sample_start = mk_housebass
	}
	{
		name_text = qs(0xfd3196ec)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'mk_housepluck'
		sample_start = mk_housepluck
	}
	{
		name_text = qs(0x3c0cad39)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'kyoto1'
		sample_start = kyoto1
	}
	{
		name_text = qs(0xc8ae6c3e)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'lush'
		sample_start = lush
	}
	{
		name_text = qs(0x828476df)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'kz_martians'
		sample_start = kz_martians
	}
	{
		name_text = qs(0xbe1adc2b)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'mono_synth'
		sample_start = mono_synth
	}
	{
		name_text = qs(0xc2464a2f)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'ob_rave_oldschool'
		sample_start = ob_rave_oldschool
	}
	{
		name_text = qs(0xe96b19ec)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'ob_rave_oldschool2'
		sample_start = ob_rave_oldschool2
	}
	{
		name_text = qs(0xfa020594)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'mk_organ'
		sample_start = mk_organ
	}
	{
		name_text = qs(0xa80b4869)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'csd_oscillator_high'
		sample_start = csd_oscillator_high
	}
	{
		name_text = qs(0x65914fa7)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'csd_oscillator_low'
		sample_start = csd_oscillator_low
	}
	{
		name_text = qs(0xd8ebc813)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'panflute'
		sample_start = panflute
	}
	{
		name_text = qs(0x50769ea3)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'phone_tone'
		sample_start = phone_tone
	}
	{
		name_text = qs(0x7820f537)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'mk_lead'
		sample_start = mk_lead
	}
	{
		name_text = qs(0x216900cb)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'mk_pluckedbass'
		sample_start = mk_pluckedbass
	}
	{
		name_text = qs(0x5a4f6890)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'mk_polyphonicsaw'
		sample_start = mk_polyphonicsaw
	}
	{
		name_text = qs(0xad7fcc75)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'ob_rave1'
		sample_start = ob_rave1
	}
	{
		name_text = qs(0x86529fb6)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'ob_rave2'
		sample_start = ob_rave2
	}
	{
		name_text = qs(0x9f49aef7)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'ob_rave3'
		sample_start = ob_rave3
	}
	{
		name_text = qs(0x8e4e66ea)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'rock_organ'
		sample_start = rock_organ
	}
	{
		name_text = qs(0xa5633529)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'rock_organ_2'
		sample_start = rock_organ_2
	}
	{
		name_text = qs(0x07db1d6a)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'ob_scary1'
		sample_start = ob_scary1
	}
	{
		name_text = qs(0x2cf64ea9)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'ob_scary2'
		sample_start = ob_scary2
	}
	{
		name_text = qs(0x35ed7fe8)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'ob_scary3'
		sample_start = ob_scary3
	}
	{
		name_text = qs(0x7aace92f)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'ob_scary4'
		sample_start = ob_scary4
	}
	{
		name_text = qs(0x63b7d86e)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'ob_scary5'
		sample_start = ob_scary5
	}
	{
		name_text = qs(0x489a8bad)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'ob_scary6'
		sample_start = ob_scary6
	}
	{
		name_text = qs(0x857464e7)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'india_sitar'
		sample_start = india_sitar
	}
	{
		name_text = qs(0x8731dfcd)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'strange'
		sample_start = strange
	}
	{
		name_text = qs(0x65b2a9fa)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'synth_lead_1'
		sample_start = synth_lead_1
	}
	{
		name_text = qs(0x4e9ffa39)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'synth_lead_2'
		sample_start = synth_lead_2
	}
	{
		name_text = qs(0x5784cb78)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'synth_lead_3'
		sample_start = synth_lead_3
	}
	{
		name_text = qs(0xd2609652)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'ob_tone1'
		sample_start = ob_tone1
	}
	{
		name_text = qs(0xd4806537)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'csd_tourfrance'
		sample_start = csd_tourfrance
	}
	{
		name_text = qs(0x7864ad91)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'csd_videogame'
		sample_start = csd_videogame
	}
	{
		name_text = qs(0x5349fe52)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'csd_videogame2'
		sample_start = csd_videogame2
	}
	{
		name_text = qs(0x4a52cf13)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'csd_videogame3'
		sample_start = csd_videogame3
	}
	{
		name_text = qs(0x051359d4)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'csd_videogame4'
		sample_start = csd_videogame4
	}
	{
		name_text = qs(0xb5f0fb7c)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'voice'
		sample_start = voice
	}
	{
		name_text = qs(0x52909ba8)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'wha'
		sample_start = wha
	}
	{
		name_text = qs(0xe0099314)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_melody_kit
		submenu_preview_script = jam_melody_kit_preview
		submenu_exit_script = guitar_jam_melody_kit_exit
		pakname = 'kz_breathy2'
		sample_start = kz_breathy2
	}
]

script jam_band_pause_melody_kit 
	op_array = $pause_melody_kit_options
	getplayerinfo <select_player> jam_instrument
	jam_band_pause_submenu {
		submenu_name = 'melody_kit'
		submenu_title = qs(0x938d30f9)
		player_cont = <player_cont>
		player_pause = <player_pause>
		scrolling_options = <scrolling_options>
		event_cont = <event_cont>
		select_player = <select_player>
		text_id = <text_id>
		option = ($jam_current_melody_kit)
		vmenu_id = <vmenu_id>
		options_array = <op_array>
		selectable_choices
		current_submenu_choice = ($jam_current_melody_kit)
	}
	broadcastevent \{type = jam_open_melodykit_menu}
endscript

script guitar_jam_change_melody_kit 
	formattext checksumname = selector_id 'pause_submenu_melody_kit_selector_%b' b = <player>
	formattext checksumname = option_id 'pause_submenu_melody_kit_options_%b_%c' b = <player> c = <option_index>
	<selector_id> :setprops parent = <option_id>
	launchevent type = unfocus target = <option_id>
	launchevent type = unfocus target = <vmenu_options_submenu>
	loadmelodykit melody_kit = <option_index>
	<respawn> = 0
	if ($jam_advanced_record = 0)
		<respawn> = 1
		formattext checksumname = player_info_element 'player_info_element_%a' a = <player>
		formattext textname = extra_info_text qs(0x4d4555da) s = (($pause_melody_kit_options) [<option_index>].name_text)
		if screenelementexists id = <player_info_element>
			<player_info_element> :se_setprops extra_info_text = <extra_info_text>
		endif
	endif
	launchevent type = focus target = <option_id>
	jam_band_remove_pause_submenu choose vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <player> respawn_input = <respawn>
	if ($game_mode = training)
		broadcastevent type = jam_tutorial_changed_melody_kit data = {melody_kit = <option_index>}
	endif
endscript

script jam_melody_kit_preview 
	printf \{channel = jam_mode
		qs(0x83543c6b)}
	launchevent type = unfocus target = <option_id>
	launchevent type = unfocus target = <vmenu_options_submenu>
	old_melody_kit = ($jam_current_melody_kit)
	loadmelodykit melody_kit = <option_index>
	stopsound unique_id = ($jam_input_current_melody) fade_type = linear fade_time = 0.05
	playsound $melody_sample pitch = (0 + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_vox send_vol2 = -24 pan1x = ($jam_melody_pan) pan1y = 1.0
	change jam_input_current_melody = <unique_id>
	wait \{1
		second}
	stopsound unique_id = ($jam_input_current_melody) fade_type = linear fade_time = 0.05
	change jam_current_melody_kit = <old_melody_kit>
	launchevent type = focus target = <option_id>
	launchevent type = focus target = <vmenu_options_submenu>
endscript

script guitar_jam_melody_kit_exit 
	if ($jam_tutorial_status = active)
		return
	endif
	launchevent type = unfocus target = <option_id>
	launchevent type = unfocus target = <vmenu_options_submenu>
	loadmelodykit melody_kit = ($jam_current_melody_kit)
	printf channel = jam_mode qs(0xef89eebb) s = ($jam_current_melody_kit)
	jam_band_remove_pause_submenu vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript
pause_bass_kit_options = [
	{
		name_text = $bass_kits_clean_string
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
	}
	{
		name_text = qs(0xcfc844eb)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'rev_bass1'
		sample_start = rev_bass1
	}
	{
		name_text = qs(0xe4e51728)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'rev_bass2'
		sample_start = rev_bass2
	}
	{
		name_text = qs(0xfdfe2669)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'rev_bass3'
		sample_start = rev_bass3
	}
	{
		name_text = qs(0xb2bfb0ae)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'rev_bass4'
		sample_start = rev_bass4
	}
	{
		name_text = qs(0x3f1859c7)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'csd_sweepcrazy'
		sample_start = csd_sweepcrazy
	}
	{
		name_text = qs(0x957f07e2)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'm_fat1'
		sample_start = m_fat1
	}
	{
		name_text = qs(0xbe525421)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'm_fat2'
		sample_start = m_fat2
	}
	{
		name_text = qs(0xa7496560)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'm_fat3'
		sample_start = m_fat3
	}
	{
		name_text = qs(0xe808f3a7)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'm_fat5'
		sample_start = m_fat5
	}
	{
		name_text = qs(0xf113c2e6)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'm_fat6'
		sample_start = m_fat6
	}
	{
		name_text = qs(0xbe66d392)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'm_bass1'
		sample_start = m_bass1
	}
	{
		name_text = qs(0xe4d0cb85)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'm_bass_filter_in'
		sample_start = m_bass_filter_in
	}
	{
		name_text = qs(0xb6195674)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'm_fat_high'
		sample_start = m_fat_high
	}
	{
		name_text = qs(0x782c2127)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'm_fat_high2'
		sample_start = m_fat_high2
	}
	{
		name_text = qs(0xfbafafee)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'kz_breathy'
		sample_start = kz_breathy
	}
	{
		name_text = qs(0xd8c6a189)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'balleric'
		sample_start = balleric
	}
	{
		name_text = qs(0x02b6bf4e)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'csd_sweep'
		sample_start = csd_sweep
	}
	{
		name_text = qs(0x09c9306c)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'Breathy_pad'
		sample_start = breathy_pad
	}
	{
		name_text = qs(0x6967ff29)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'mk_brightsynth'
		sample_start = mk_brightsynth
	}
	{
		name_text = qs(0xd8d84155)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'csd_sweep2'
		sample_start = csd_sweep2
	}
	{
		name_text = qs(0xe8b5e268)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'calc'
		sample_start = calc
	}
	{
		name_text = qs(0x17244719)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'kz_deepbliss'
		sample_start = kz_deepbliss
	}
	{
		name_text = qs(0xc2f7511b)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'deepsh101'
		sample_start = deepsh101
	}
	{
		name_text = qs(0x9f30d573)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'kz_acid'
		sample_start = kz_acid
	}
	{
		name_text = qs(0x920e7f81)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'kz_choir'
		sample_start = kz_choir
	}
	{
		name_text = qs(0x486b579e)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'kz_india'
		sample_start = kz_india
	}
	{
		name_text = qs(0xaad94533)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'kz_digiorg'
		sample_start = kz_digiorg
	}
	{
		name_text = qs(0x5526b593)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'india_drone'
		sample_start = india_drone
	}
	{
		name_text = qs(0x480e3516)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'mk_greatness'
		sample_start = mk_greatness
	}
	{
		name_text = qs(0xcbb153fa)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'europe'
		sample_start = europe
	}
	{
		name_text = qs(0x81f22ff2)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'mk_fatbass'
		sample_start = mk_fatbass
	}
	{
		name_text = qs(0x356380f9)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'mk_fatbrass'
		sample_start = mk_fatbrass
	}
	{
		name_text = qs(0x585130a8)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'fif'
		sample_start = fif
	}
	{
		name_text = qs(0xa50bd0b1)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'kz_flute'
		sample_start = kz_flute
	}
	{
		name_text = qs(0xbe4162e7)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'horror12'
		sample_start = horror12
	}
	{
		name_text = qs(0x438cbefb)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'horror1'
		sample_start = horror1
	}
	{
		name_text = qs(0x31ac429c)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'mk_housebass'
		sample_start = mk_housebass
	}
	{
		name_text = qs(0xfd3196ec)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'mk_housepluck'
		sample_start = mk_housepluck
	}
	{
		name_text = qs(0x3c0cad39)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'kyoto1'
		sample_start = kyoto1
	}
	{
		name_text = qs(0xc8ae6c3e)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'lush'
		sample_start = lush
	}
	{
		name_text = qs(0x828476df)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'kz_martians'
		sample_start = kz_martians
	}
	{
		name_text = qs(0xbe1adc2b)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'mono_synth'
		sample_start = mono_synth
	}
	{
		name_text = qs(0xc2464a2f)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'ob_rave_oldschool'
		sample_start = ob_rave_oldschool
	}
	{
		name_text = qs(0xe96b19ec)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'ob_rave_oldschool2'
		sample_start = ob_rave_oldschool2
	}
	{
		name_text = qs(0xfa020594)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'mk_organ'
		sample_start = mk_organ
	}
	{
		name_text = qs(0xa80b4869)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'csd_oscillator_high'
		sample_start = csd_oscillator_high
	}
	{
		name_text = qs(0x65914fa7)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'csd_oscillator_low'
		sample_start = csd_oscillator_low
	}
	{
		name_text = qs(0xd8ebc813)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'panflute'
		sample_start = panflute
	}
	{
		name_text = qs(0x50769ea3)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'phone_tone'
		sample_start = phone_tone
	}
	{
		name_text = qs(0x7820f537)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'mk_lead'
		sample_start = mk_lead
	}
	{
		name_text = qs(0x216900cb)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'mk_pluckedbass'
		sample_start = mk_pluckedbass
	}
	{
		name_text = qs(0x5a4f6890)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'mk_polyphonicsaw'
		sample_start = mk_polyphonicsaw
	}
	{
		name_text = qs(0xad7fcc75)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'ob_rave1'
		sample_start = ob_rave1
	}
	{
		name_text = qs(0x86529fb6)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'ob_rave2'
		sample_start = ob_rave2
	}
	{
		name_text = qs(0x9f49aef7)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'ob_rave3'
		sample_start = ob_rave3
	}
	{
		name_text = qs(0x8e4e66ea)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'rock_organ'
		sample_start = rock_organ
	}
	{
		name_text = qs(0xa5633529)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'rock_organ_2'
		sample_start = rock_organ_2
	}
	{
		name_text = qs(0x07db1d6a)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'ob_scary1'
		sample_start = ob_scary1
	}
	{
		name_text = qs(0x2cf64ea9)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'ob_scary2'
		sample_start = ob_scary2
	}
	{
		name_text = qs(0x35ed7fe8)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'ob_scary3'
		sample_start = ob_scary3
	}
	{
		name_text = qs(0x7aace92f)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'ob_scary4'
		sample_start = ob_scary4
	}
	{
		name_text = qs(0x63b7d86e)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'ob_scary5'
		sample_start = ob_scary5
	}
	{
		name_text = qs(0x489a8bad)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'ob_scary6'
		sample_start = ob_scary6
	}
	{
		name_text = qs(0x857464e7)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'india_sitar'
		sample_start = india_sitar
	}
	{
		name_text = qs(0x8731dfcd)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'strange'
		sample_start = strange
	}
	{
		name_text = qs(0x65b2a9fa)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'synth_lead_1'
		sample_start = synth_lead_1
	}
	{
		name_text = qs(0x4e9ffa39)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'synth_lead_2'
		sample_start = synth_lead_2
	}
	{
		name_text = qs(0x5784cb78)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'synth_lead_3'
		sample_start = synth_lead_3
	}
	{
		name_text = qs(0xd2609652)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'ob_tone1'
		sample_start = ob_tone1
	}
	{
		name_text = qs(0xd4806537)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'csd_tourfrance'
		sample_start = csd_tourfrance
	}
	{
		name_text = qs(0x7864ad91)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'csd_videogame'
		sample_start = csd_videogame
	}
	{
		name_text = qs(0x5349fe52)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'csd_videogame2'
		sample_start = csd_videogame2
	}
	{
		name_text = qs(0x4a52cf13)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'csd_videogame3'
		sample_start = csd_videogame3
	}
	{
		name_text = qs(0x051359d4)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'csd_videogame4'
		sample_start = csd_videogame4
	}
	{
		name_text = qs(0xb5f0fb7c)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'voice'
		sample_start = voice
	}
	{
		name_text = qs(0x52909ba8)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'wha'
		sample_start = wha
	}
	{
		name_text = qs(0xe0099314)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'kz_breathy2'
		sample_start = kz_breathy2
	}
]

script jam_band_pause_bass_kit 
	op_array = $pause_bass_kit_options
	getplayerinfo <select_player> jam_instrument
	jam_band_pause_submenu {
		submenu_name = 'bass_kit'
		submenu_title = qs(0xa57bbb69)
		player_cont = <player_cont>
		player_pause = <player_pause>
		scrolling_options = <scrolling_options>
		event_cont = <event_cont>
		select_player = <select_player>
		text_id = <text_id>
		option = ($bass_kit_mode)
		vmenu_id = <vmenu_id>
		options_array = <op_array>
		selectable_choices
		current_submenu_choice = ($bass_kit_mode)
	}
endscript

script guitar_jam_change_bass_kit 
	formattext checksumname = selector_id 'pause_submenu_bass_kit_selector_%b' b = <player>
	formattext checksumname = option_id 'pause_submenu_bass_kit_options_%b_%c' b = <player> c = <option_index>
	<selector_id> :setprops parent = <option_id>
	launchevent type = unfocus target = <option_id>
	launchevent type = unfocus target = <vmenu_options_submenu>
	if (<option_index> = 0)
		change \{bass_kit_mode = 0}
	else
		loadbasskit bass_kit = <option_index>
	endif
	<respawn> = 0
	if ($jam_advanced_record = 0)
		<respawn> = 1
		formattext checksumname = player_info_element 'player_info_element_%a' a = <player>
		if screenelementexists id = <player_info_element>
			if (<option_index> = 0)
				<player_info_element> :se_setprops extra_info_text = qs(0x00000000)
				runscriptonscreenelement id = <player_info_element> legacydomorph params = {pos = (3.0, 465.0) time = 0.1}
			else
				formattext textname = extra_info_text qs(0x4d4555da) s = (($pause_bass_kit_options) [<option_index>].name_text)
				<player_info_element> :se_setprops extra_info_text = <extra_info_text>
				runscriptonscreenelement id = <player_info_element> legacydomorph params = {pos = (3.0, 445.0) time = 0.1}
			endif
		endif
	endif
	launchevent type = focus target = <option_id>
	jam_band_remove_pause_submenu choose vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <player> respawn_input = <respawn>
	if ($game_mode = training)
		broadcastevent type = jam_tutorial_changed_bass_kit data = {bass_kit = <option_index>}
	endif
endscript

script jam_bass_kit_preview 
	launchevent type = unfocus target = <option_id>
	launchevent type = unfocus target = <vmenu_options_submenu>
	old_bass_kit = ($jam_current_bass_kit)
	previous_mode = ($bass_kit_mode)
	if (<option_index> = 0)
		change \{bass_kit_mode = 0}
		jam_get_sample player = <player> button = 1 sample_type = 0 tilt = 0
		stopsound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = 0.05
		playsound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 5 buss = jammode_bass release_function = linear release_time = 10.0 release_length = 0.02 send_vol2 = -18
	else
		change \{bass_kit_mode = 1}
		loadbasskit bass_kit = <option_index> preview = 1
		stopsound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = 0.05
		playsound $bass_kit_sample pitch = (0 + (($jam_current_tuning) / 10.0)) vol = 5 buss = jammode_bass send_vol2 = -24 pan1y = 1.0
	endif
	change bass_kit_mode = <previous_mode>
	change jam_input_current_bass = <unique_id>
	wait \{1
		second}
	stopsound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = 0.05
	launchevent type = focus target = <option_id>
	launchevent type = focus target = <vmenu_options_submenu>
endscript

script guitar_jam_bass_kit_exit 
	if ($jam_tutorial_status = active)
		return
	endif
	launchevent type = unfocus target = <option_id>
	launchevent type = unfocus target = <vmenu_options_submenu>
	getsonginfo
	if NOT gotparam \{bass_kit}
		bass_kit = 0
	endif
	loadbasskit bass_kit = <bass_kit>
	jam_band_remove_pause_submenu vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript

script jam_band_pause_drum_loop 
	op_array = $jam_drum_loops_by_type
	getplayerinfo <select_player> jam_instrument
	jam_band_pause_submenu {
		submenu_name = 'drum_loop'
		submenu_title = qs(0xa841b64e)
		player_cont = <player_cont>
		player_pause = <player_pause>
		scrolling_options = <scrolling_options>
		event_cont = <event_cont>
		select_player = <select_player>
		text_id = <text_id>
		option = ($jam_current_drum_loop)
		vmenu_id = <vmenu_id>
		options_array = <op_array>
		selectable_choices
		current_submenu_choice = ($jam_current_drum_loop)
		no_preview
	}
endscript

script guitar_jam_change_drum_loop 
	formattext checksumname = selector_id 'pause_submenu_drum_loop_selector_%b' b = <player>
	formattext checksumname = option_id 'pause_submenu_drum_loop_options_%b_%c' b = <player> c = <option_index>
	<selector_id> :setprops parent = <option_id>
	change jam_current_drum_loop = <option_index>
	jam_band_remove_pause_submenu choose vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript

script guitar_jam_drum_loop_exit 
	jam_band_remove_pause_submenu vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript

script jam_band_pause_arpeggiator_loop 
	op_array = $jam_arpeggiator_loops
	getplayerinfo <select_player> jam_instrument
	jam_band_pause_submenu {
		submenu_name = 'arpeggiator_loop'
		submenu_title = qs(0x1a40febc)
		player_cont = <player_cont>
		player_pause = <player_pause>
		scrolling_options = <scrolling_options>
		event_cont = <event_cont>
		select_player = <select_player>
		text_id = <text_id>
		option = ($jam_current_arpeggiator [<jam_instrument>])
		vmenu_id = <vmenu_id>
		options_array = <op_array>
		selectable_choices
		current_submenu_choice = ($jam_current_arpeggiator [<jam_instrument>])
	}
endscript

script guitar_jam_change_arpeggiator_loop 
	formattext checksumname = selector_id 'pause_submenu_arpeggiator_loop_selector_%b' b = <player>
	formattext checksumname = option_id 'pause_submenu_arpeggiator_loop_options_%b_%c' b = <player> c = <option_index>
	getplayerinfo <player> jam_instrument
	<selector_id> :setprops parent = <option_id>
	setarrayelement arrayname = jam_current_arpeggiator globalarray index = <jam_instrument> newvalue = <option_index>
	jam_band_remove_pause_submenu choose vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript

script guitar_jam_arpeggiator_loop_exit 
	jam_band_remove_pause_submenu vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript

script jam_band_pause_arpeggiator_type 
	op_array = $jam_arpeggiator_types
	getplayerinfo <select_player> jam_instrument
	jam_band_pause_submenu {
		submenu_name = 'arpeggiator_type'
		submenu_title = qs(0x5f5e9479)
		player_cont = <player_cont>
		player_pause = <player_pause>
		scrolling_options = <scrolling_options>
		event_cont = <event_cont>
		select_player = <select_player>
		text_id = <text_id>
		option = ($jam_current_arpeggiator_type [<jam_instrument>])
		vmenu_id = <vmenu_id>
		options_array = <op_array>
		selectable_choices
		current_submenu_choice = ($jam_current_arpeggiator_type [<jam_instrument>])
	}
endscript

script guitar_jam_change_arpeggiator_type 
	formattext checksumname = selector_id 'pause_submenu_arpeggiator_type_selector_%b' b = <player>
	formattext checksumname = option_id 'pause_submenu_arpeggiator_type_options_%b_%c' b = <player> c = <option_index>
	getplayerinfo <player> jam_instrument
	<selector_id> :setprops parent = <option_id>
	setarrayelement arrayname = jam_current_arpeggiator_type globalarray index = <jam_instrument> newvalue = <option_index>
	jam_band_remove_pause_submenu choose vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript

script guitar_jam_arpeggiator_type_exit 
	jam_band_remove_pause_submenu vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript
jam_pause_settings = [
	{
		section_heading = qs(0x03ac90f0)
	}
	{
		name_text = qs(0x456f5cad)
		fit_to_dims = (120.0, 26.0)
		submenu_script = guitar_jam_settings_volume
		submenu_init_script = guitar_jam_settings_update_volume
		submenu_exit_script = guitar_jam_settings_exit
		allow_inst = [
			1
			1
			1
			1
			1
			1
		]
	}
	{
		name_text = qs(0xa96a7710)
		fit_to_dims = (120.0, 26.0)
		submenu_script = guitar_jam_settings_pan
		submenu_init_script = guitar_jam_settings_update_pan
		submenu_exit_script = guitar_jam_settings_exit
		allow_inst = [
			1
			1
			0
			0
			1
			0
		]
	}
	{
		name_text = qs(0xc5471899)
		fit_to_dims = (150.0, 28.0)
		submenu_script = guitar_jam_settings_toggle_click
		submenu_init_script = guitar_jam_settings_update_click_text
		submenu_exit_script = guitar_jam_settings_exit
		allow_inst = [
			1
			1
			1
			1
			1
			1
		]
	}
	{
		name_text = qs(0x55b1704d)
		fit_to_dims = (100.0, 26.0)
		submenu_script = guitar_jam_settings_bpm
		submenu_init_script = guitar_jam_settings_update_bpm
		submenu_exit_script = guitar_jam_settings_exit
		allow_inst = [
			1
			1
			1
			1
			1
			1
		]
	}
	{
		name_text = qs(0x9f750994)
		fit_to_dims = (105.0, 26.0)
		submenu_script = guitar_jam_settings_tuning
		submenu_init_script = guitar_jam_settings_update_tuning
		submenu_exit_script = guitar_jam_settings_exit
		allow_inst = [
			1
			1
			1
			0
			1
			1
		]
	}
	{
		name_text = qs(0x18e9650e)
		fit_to_dims = (150.0, 28.0)
		submenu_script = guitar_jam_settings_toggle_lefty
		submenu_init_script = guitar_jam_settings_update_lefty_text
		submenu_exit_script = guitar_jam_settings_exit
		allow_inst = [
			1
			1
			1
			1
			1
			0
		]
	}
	{
		name_text = qs(0xbbf6730e)
		fit_to_dims = (150.0, 28.0)
		submenu_script = guitar_jam_settings_toggle_menu_sounds
		submenu_init_script = guitar_jam_settings_update_menu_sounds_text
		submenu_exit_script = guitar_jam_settings_exit
		allow_inst = [
			1
			1
			1
			1
			1
			0
		]
	}
]

script jam_band_pause_settings 
	getplayerinfo <select_player> jam_instrument
	op_array = ($jam_pause_settings)
	jam_band_pause_submenu {
		submenu_name = 'settings'
		submenu_title = qs(0x6ac3fd59)
		player_cont = <player_cont>
		player_pause = <player_pause>
		scrolling_options = <scrolling_options>
		event_cont = <event_cont>
		select_player = <select_player>
		text_id = <text_id>
		option = 1
		vmenu_id = <vmenu_id>
		options_array = <op_array>
	}
endscript

script guitar_jam_settings_exit 
	jam_band_remove_pause_submenu vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript

script guitar_jam_settings_toggle_click 
	if ($jam_click_track = 1)
		change \{jam_click_track = 0}
	else
		change \{jam_click_track = 1}
	endif
	<player> = 1
	begin
	guitar_jam_settings_update_click_text submenu_name = <submenu_name> player = <player> option_index = <option_index>
	<player> = (<player> + 1)
	repeat ($num_jam_players)
endscript

script guitar_jam_settings_update_click_text 
	<click_text> = qs(0x621e0063)
	if ($jam_click_track = 1)
		<click_text> = qs(0xd9eb7793)
	endif
	formattext checksumname = option_text_id 'pause_submenu_%a_optext_%b_%c' a = <submenu_name> b = <player> c = <option_index>
	if screenelementexists id = <option_text_id>
		<option_text_id> :se_setprops text = <click_text>
	endif
endscript

script create_jam_settings_arrows \{pos_x = 72}
	formattext checksumname = setting_arrow_up 'setting_arrow_up_%a' a = <player>
	createscreenelement {
		type = spriteelement
		parent = <parent>
		id = <setting_arrow_up>
		texture = up_arrow
		just = [center center]
		pos = (((1.0, 0.0) * <pos_x>) + (8.0, -5.0))
		scale = 0.5
		z_priority = 100
	}
	formattext checksumname = setting_arrow_down 'setting_arrow_down_%a' a = <player>
	createscreenelement {
		type = spriteelement
		parent = <parent>
		id = <setting_arrow_down>
		texture = down_arrow
		just = [center center]
		pos = (((1.0, 0.0) * <pos_x>) + (8.0, 5.0))
		scale = 0.5
		z_priority = 100
	}
endscript

script morph_jam_settings_arrows \{no_sound = 0}
	if gotparam \{down}
		if (<no_sound> = 0)
			soundevent \{event = ghtunes_ui_scroll}
		endif
		formattext checksumname = setting_arrow_down 'setting_arrow_down_%a' a = <player>
		if screenelementexists id = <setting_arrow_down>
			legacydoscreenelementmorph id = <setting_arrow_down> scale = 1.3 relative_scale
			legacydoscreenelementmorph id = <setting_arrow_down> scale = 1.0 relative_scale time = 0.1
		endif
	elseif gotparam \{up}
		if (<no_sound> = 0)
			soundevent \{event = ghtunes_ui_scroll}
		endif
		formattext checksumname = setting_arrow_up 'setting_arrow_up_%a' a = <player>
		if screenelementexists id = <setting_arrow_up>
			legacydoscreenelementmorph id = <setting_arrow_up> scale = 1.3 relative_scale
			legacydoscreenelementmorph id = <setting_arrow_up> scale = 1.0 relative_scale time = 0.1
		endif
	elseif gotparam \{pandown}
		if (<no_sound> = 0)
			soundevent event = ghtunes_ui_scroll_pan sfx_pan = <sfx_pan>
		endif
		formattext checksumname = setting_arrow_down 'setting_arrow_down_%a' a = <player>
		if screenelementexists id = <setting_arrow_down>
			legacydoscreenelementmorph id = <setting_arrow_down> scale = 1.3 relative_scale
			legacydoscreenelementmorph id = <setting_arrow_down> scale = 1.0 relative_scale time = 0.1
		endif
	elseif gotparam \{panup}
		if (<no_sound> = 0)
			soundevent event = ghtunes_ui_scroll_pan sfx_pan = <sfx_pan>
		endif
		formattext checksumname = setting_arrow_up 'setting_arrow_up_%a' a = <player>
		if screenelementexists id = <setting_arrow_up>
			legacydoscreenelementmorph id = <setting_arrow_up> scale = 1.3 relative_scale
			legacydoscreenelementmorph id = <setting_arrow_up> scale = 1.0 relative_scale time = 0.1
		endif
	endif
endscript

script destroy_jam_settings_arrows 
	formattext checksumname = setting_arrow_up 'setting_arrow_up_%a' a = <player>
	safe_destroy id = <setting_arrow_up>
	formattext checksumname = setting_arrow_down 'setting_arrow_down_%a' a = <player>
	safe_destroy id = <setting_arrow_down>
endscript

script guitar_jam_settings_volume 
	getplayerinfo <player> jam_instrument
	getplayerinfo <player> controller
	setscreenelementprops id = <vmenu_options_submenu> block_events
	formattext checksumname = volume_event_handler 'jam_volume_event_handler_%s' s = <player>
	if ($jam_advanced_record = 1)
		event_handler_parent = jam_studio_element
	else
		event_handler_parent = jam_band_container
	endif
	createscreenelement {
		type = containerelement
		parent = <event_handler_parent>
		id = <volume_event_handler>
		z_priority = 50
		exclusive_device = <controller>
		event_handlers = [
			{pad_up guitar_jam_settings_volume_up params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> volume_event_handler = <volume_event_handler> player = <player>}}
			{pad_down guitar_jam_settings_volume_down params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> volume_event_handler = <volume_event_handler> player = <player>}}
			{pad_choose guitar_jam_settings_volume_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> volume_event_handler = <volume_event_handler> player = <player>}}
			{pad_circle guitar_jam_settings_volume_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> volume_event_handler = <volume_event_handler> player = <player>}}
			{pad_start guitar_jam_settings_volume_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> volume_event_handler = <volume_event_handler> player = <player>}}
		]
	}
	create_jam_settings_arrows player = <player> parent = <option_id>
	launchevent type = focus target = <volume_event_handler>
endscript

script guitar_jam_settings_volume_up 
	getplayerinfo <player> jam_instrument
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	<volume> = (<volume> + 1)
	<no_click> = 0
	if (<volume> > 10)
		<volume> = 10
		<no_click> = 1
	endif
	settrackinfo track = ($jam_tracks [<jam_instrument>].id) volume = <volume>
	guitar_jam_settings_update_volume player = <player> option_text_id = <option_text_id>
	morph_jam_settings_arrows player = <player> up no_sound = <no_click>
	spawnscriptnow guitar_jam_settings_preview_note params = {<...>}
endscript

script guitar_jam_settings_volume_down 
	getplayerinfo <player> jam_instrument
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	<volume> = (<volume> - 1)
	<no_click> = 0
	if (<volume> < 0)
		<volume> = 0
		<no_click> = 1
	endif
	settrackinfo track = ($jam_tracks [<jam_instrument>].id) volume = <volume>
	guitar_jam_settings_update_volume player = <player> option_text_id = <option_text_id>
	morph_jam_settings_arrows player = <player> down no_sound = <no_click>
	spawnscriptnow guitar_jam_settings_preview_note params = {<...>}
endscript

script guitar_jam_settings_volume_back 
	generic_menu_pad_back_sound
	setscreenelementprops id = <vmenu_options_submenu> unblock_events
	destroyscreenelement id = <volume_event_handler>
	destroy_jam_settings_arrows player = <player>
	formattext checksumname = preview_sample 'jam_settings_preview_sample_%s' s = <player>
	stopsound ($<preview_sample>) fade_time = 0.1 fade_type = linear
endscript

script guitar_jam_settings_update_volume 
	if NOT gotparam \{jam_instrument}
		getplayerinfo <player> jam_instrument
	endif
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	if NOT gotparam \{volume}
		return
	endif
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	new_vol = ((10 - <volume>) * 2)
	if (<volume> = 0)
		<new_vol> = 100
	endif
	switch <jam_instrument>
		case 0
		setsoundbussparams {jammode_rhythmguitar = {vol = (($default_bussset.jammode_rhythmguitar.vol) - <new_vol>)}}
		case 1
		setsoundbussparams {jammode_leadguitar = {vol = (($default_bussset.jammode_leadguitar.vol) - <new_vol>)}}
		case 2
		setsoundbussparams {jammode_bass = {vol = (($default_bussset.jammode_bass.vol) - <new_vol>)}}
		case 3
		setsoundbussparams {jammode_drums = {vol = (($default_bussset.jammode_drums.vol) - <new_vol>)}}
		case 4
		setsoundbussparams {jammode_vox = {vol = (($default_bussset.jammode_vox.vol) - <new_vol>)}}
	endswitch
	formattext textname = volume_text qs(0x414080a3) s = <volume>
	if gotparam \{option_text_id}
		<option_text_id> :setprops text = <volume_text>
	endif
endscript

script jam_init_volumes 
	setsoundbussparams {guitar_jammode = {vol = ($default_bussset.guitar_jammode.vol)}}
	setsoundbussparams {user_drums = {vol = ($default_bussset.user_drums.vol)}}
	setsoundbussparams {drums_jammode = {vol = ($default_bussset.drums_jammode.vol)}}
	setsoundbussparams {jammode_drums_cymbals = {vol = ($default_bussset.jammode_drums_cymbals.vol)}}
	setsoundbussparams {jammode_drums_toms = {vol = ($default_bussset.jammode_drums_toms.vol)}}
	setsoundbussparams {jammode_drums_kick = {vol = ($default_bussset.jammode_drums_kick.vol)}}
	setsoundbussparams {jammode_drums_snare = {vol = ($default_bussset.jammode_drums_snare.vol)}}
	getarraysize \{$jam_tracks}
	index = 0
	begin
	if NOT gotparam \{no_tracks}
		gettrackinfo track = ($jam_tracks [<index>].id)
	else
		volume = 8
	endif
	if (<volume> = 0)
		<new_vol> = 100
	endif
	new_vol = ((10 - <volume>) * 2)
	switch <index>
		case 0
		setsoundbussparams {jammode_rhythmguitar = {vol = (($default_bussset.jammode_rhythmguitar.vol) - <new_vol>)}}
		case 1
		setsoundbussparams {jammode_leadguitar = {vol = (($default_bussset.jammode_leadguitar.vol) - <new_vol>)}}
		case 2
		setsoundbussparams {jammode_bass = {vol = (($default_bussset.jammode_bass.vol) - <new_vol>)}}
		case 3
		setsoundbussparams {jammode_drums = {vol = (($default_bussset.jammode_drums.vol) - <new_vol>)}}
		printf channel = jam_mode qs(0x26113fb8) s = <new_vol>
		case 4
		setsoundbussparams {jammode_vox = {vol = (($default_bussset.jammode_vox.vol) - <new_vol>)}}
	endswitch
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script guitar_jam_settings_pan 
	getplayerinfo <player> jam_instrument
	getplayerinfo <player> controller
	setscreenelementprops id = <vmenu_options_submenu> block_events
	formattext checksumname = pan_event_handler 'jam_pan_event_handler_%s' s = <player>
	if ($jam_advanced_record = 1)
		event_handler_parent = jam_studio_element
	else
		event_handler_parent = jam_band_container
	endif
	createscreenelement {
		type = containerelement
		parent = <event_handler_parent>
		id = <pan_event_handler>
		z_priority = 50
		exclusive_device = <controller>
		event_handlers = [
			{pad_down guitar_jam_settings_pan_left params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> pan_event_handler = <pan_event_handler> player = <player>}}
			{pad_up guitar_jam_settings_pan_right params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> pan_event_handler = <pan_event_handler> player = <player>}}
			{pad_choose guitar_jam_settings_pan_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> pan_event_handler = <pan_event_handler> player = <player>}}
			{pad_circle guitar_jam_settings_pan_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> pan_event_handler = <pan_event_handler> player = <player>}}
			{pad_start guitar_jam_settings_pan_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> pan_event_handler = <pan_event_handler> player = <player>}}
		]
	}
	create_jam_settings_arrows player = <player> parent = <option_id>
	launchevent type = focus target = <pan_event_handler>
endscript

script guitar_jam_settings_pan_right 
	getplayerinfo <player> jam_instrument
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	<pan> = (<pan> + 1)
	<no_click> = 0
	if (<pan> > 10)
		<pan> = 10
		<no_click> = 1
	endif
	settrackinfo track = ($jam_tracks [<jam_instrument>].id) pan = <pan>
	guitar_jam_settings_update_pan player = <player> option_text_id = <option_text_id>
	morph_jam_settings_arrows player = <player> panup no_sound = <no_click> sfx_pan = <pan>
endscript

script guitar_jam_settings_pan_left 
	getplayerinfo <player> jam_instrument
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	<pan> = (<pan> - 1)
	<no_click> = 0
	if (<pan> < -10)
		<pan> = -10
		<no_click> = 1
	endif
	settrackinfo track = ($jam_tracks [<jam_instrument>].id) pan = <pan>
	guitar_jam_settings_update_pan player = <player> option_text_id = <option_text_id>
	morph_jam_settings_arrows player = <player> pandown no_sound = <no_click> sfx_pan = <pan>
endscript

script guitar_jam_settings_pan_back 
	generic_menu_pad_back_sound
	setscreenelementprops id = <vmenu_options_submenu> unblock_events
	destroyscreenelement id = <pan_event_handler>
	destroy_jam_settings_arrows player = <player>
endscript

script guitar_jam_settings_update_pan 
	if NOT gotparam \{jam_instrument}
		getplayerinfo <player> jam_instrument
	endif
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	if NOT gotparam \{pan}
		return
	endif
	new_pan = (<pan> / 10.0)
	if (<pan> > 0)
		formattext textname = pan_text qs(0x79798475) s = <pan>
	elseif (<pan> = 0)
		formattext textname = pan_text qs(0x7c35fa23) s = <pan>
	else
		formattext textname = pan_text qs(0xad38bbaa) s = (0 - <pan>)
	endif
	switch <jam_instrument>
		case 0
		setdspeffectparams effects = [{effect = pod2reverb name = pod2reverb_rhythm prerevpan = <new_pan>}]
		case 1
		setdspeffectparams effects = [{effect = pod2reverb name = pod2reverb_lead prerevpan = <new_pan>}]
		case 4
		change jam_melody_pan = <new_pan>
		default
		formattext textname = pan_text qs(0xa96a7710) s = <pan>
	endswitch
	if gotparam \{option_text_id}
		<option_text_id> :setprops text = <pan_text>
	endif
endscript

script jam_init_pan 
	getarraysize \{$jam_tracks}
	index = 0
	begin
	gettrackinfo track = ($jam_tracks [<index>].id)
	new_pan = (<pan> / 10.0)
	switch <index>
		case 0
		setdspeffectparams effects = [{effect = pod2reverb name = pod2reverb_rhythm prerevpan = <new_pan>}]
		case 1
		setdspeffectparams effects = [{effect = pod2reverb name = pod2reverb_lead prerevpan = <new_pan>}]
		case 4
		change jam_melody_pan = <new_pan>
	endswitch
	<index> = (<index> + 1)
	repeat <array_size>
endscript
jam_reverb = 0

script jam_init_reverb 
	printf \{channel = jam_mode
		qs(0x192f03fc)}
	createeffectsendstack \{slot = 2
		effects = [
			{
				$jam_mode_medroom_reverb
			}
		]}
	setsoundbussparams \{jammode_rhythmguitar = {
			send_vol2 = -30
		}}
	setsoundbussparams \{jammode_leadguitar = {
			send_vol2 = -30
		}}
	printf \{channel = jam_mode
		qs(0xe9a516eb)}
	if ($jam_reverb = 0)
		change \{jam_reverb = 1}
	endif
endscript

script jam_deinit_reverb 
	printf \{channel = jam_mode
		qs(0xc50e0b6f)}
	setsoundbussparams \{jammode_rhythmguitar = {
			send_vol2 = -100
		}}
	setsoundbussparams \{jammode_leadguitar = {
			send_vol2 = -100
		}}
	destroyeffectsendstack \{slot = 2}
	printf \{channel = jam_mode
		qs(0xed4e439a)}
	if ($jam_reverb = 1)
		change \{jam_reverb = 0}
	endif
endscript

script guitar_jam_settings_bpm 
	getplayerinfo <player> controller
	setscreenelementprops id = <vmenu_options_submenu> block_events
	formattext checksumname = bpm_event_handler 'jam_bpm_event_handler_%s' s = <player>
	if ($jam_advanced_record = 1)
		event_handler_parent = jam_studio_element
	else
		event_handler_parent = jam_band_container
	endif
	createscreenelement {
		type = containerelement
		parent = <event_handler_parent>
		id = <bpm_event_handler>
		z_priority = 50
		exclusive_device = <controller>
		event_handlers = [
			{pad_up guitar_jam_settings_bpm_updown params = {up player = <player> parent = <bpm_event_handler> option_text_id = <option_text_id>}}
			{pad_down guitar_jam_settings_bpm_updown params = {down player = <player> parent = <bpm_event_handler> option_text_id = <option_text_id>}}
			{pad_choose guitar_jam_settings_bpm_back params = {vmenu_options_submenu = <vmenu_options_submenu> parent = <bpm_event_handler> bpm_event_handler = <bpm_event_handler> player = <player>}}
			{pad_circle guitar_jam_settings_bpm_back params = {vmenu_options_submenu = <vmenu_options_submenu> parent = <bpm_event_handler> bpm_event_handler = <bpm_event_handler> player = <player>}}
			{pad_start guitar_jam_settings_bpm_back params = {vmenu_options_submenu = <vmenu_options_submenu> parent = <bpm_event_handler> bpm_event_handler = <bpm_event_handler> player = <player>}}
		]
	}
	<bpm_event_handler> :settags {new_bpm = ($jam_current_bpm)}
	create_jam_settings_arrows player = <player> parent = <option_id>
	launchevent type = focus target = <bpm_event_handler>
endscript

script guitar_jam_settings_bpm_updown 
	getplayerinfo <player> jam_instrument
	<parent> :gettags
	<bpm> = <new_bpm>
	if gotparam \{up}
		<no_click> = 1
		if (<bpm> < ($jam_max_bpm))
			<bpm> = (<bpm> + 1)
			<no_click> = 0
		endif
		morph_jam_settings_arrows player = <player> up no_sound = <no_click>
	elseif gotparam \{down}
		<no_click> = 1
		if (<bpm> > ($jam_min_bpm))
			<bpm> = (<bpm> - 1)
			<no_click> = 0
		endif
		morph_jam_settings_arrows player = <player> down no_sound = <no_click>
	endif
	<parent> :settags {new_bpm = <bpm>}
	formattext textname = bpm_text qs(0x59f35cc2) s = <bpm>
	if gotparam \{option_text_id}
		<option_text_id> :setprops text = <bpm_text>
	endif
endscript

script guitar_jam_settings_update_bpm 
	getplayerinfo <player> jam_instrument
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	formattext textname = bpm_text qs(0x59f35cc2) s = <bpm>
	if gotparam \{option_text_id}
		<option_text_id> :setprops text = <bpm_text>
	endif
endscript

script guitar_jam_settings_bpm_back 
	<orig_bpm> = ($jam_current_bpm)
	if gotparam \{parent}
		<parent> :gettags
		change jam_current_bpm = <new_bpm>
	endif
	jam_clear_clipboards
	change \{jam_copy_bound_low = 0}
	change \{jam_copy_bound_high = 0}
	change \{jam_loop_bound_low = -1}
	change \{jam_loop_bound_high = -1}
	formattext \{checksumname = undo_clipboard_array
		'undo_clipboard'}
	if globalexists name = <undo_clipboard_array> type = array
		destroyscriptarray name = <undo_clipboard_array>
	endif
	change \{jam_undo_track = -1}
	song_prefix = 'editable'
	formattext checksumname = fretbar_array '%s_fretbars' s = <song_prefix> addtostringlookup = true
	<gem_arrays> = [null null null null null]
	<counter> = 0
	begin
	<gem_array> = ($jam_tracks [<counter>].gem_array)
	setarrayelement arrayname = gem_arrays resolveglobals = 0 index = <counter> newvalue = <gem_array>
	<counter> = (<counter> + 1)
	repeat 5
	markers = editable_jam_markers
	<bpm> = ($jam_current_bpm)
	changesongbpm current_bpm = <orig_bpm> new_bpm = <bpm> fretbar_array = <fretbar_array> gem_arrays = <gem_arrays> markers_array = <markers> song_length = ($jam_highway_song_length)
	if screenelementexists \{id = jam_band_highway_playline}
		setscreenelementprops id = jam_band_highway_playline pos = ($jam_band_playline_pos)
	endif
	change \{jam_highway_play_time = 0}
	suffix = '_size'
	appendsuffixtochecksum base = <fretbar_array> suffixstring = <suffix>
	<fretbar_size> = <appended_id>
	change globalname = <fretbar_size> newvalue = 0
	jam_highway_create_fretbars
	if screenelementexists id = <vmenu_options_submenu>
		setscreenelementprops id = <vmenu_options_submenu> unblock_events
	endif
	if screenelementexists id = <bpm_event_handler>
		destroyscreenelement id = <bpm_event_handler>
	endif
	if (($jam_advanced_record) = 0)
		generic_menu_pad_back_sound
		killspawnedscript \{name = jam_band_update_highway}
		destroyscreenelement \{id = jam_band_highway_master}
		jam_band_create_highway \{song = editable}
	else
		if screenelementexists \{id = jam_highway_container_master}
			destroyscreenelement \{id = jam_highway_container_master}
		endif
		if NOT gotparam \{no_sound}
			generic_menu_pad_back_sound
		endif
		killspawnedscript \{name = create_jam_highway_notetrack}
		killspawnedscript \{name = create_jam_highway_fretbars}
		jam_get_display_name filename = ($jam_selected_song)
		formattext textname = title_text qs(0x1bd49c2c) s = <display_name> b = $jam_current_bpm
		jam_studio_element :setprops songtitleinfo_text = <title_text>
		jam_highway_reinit
		spawnscriptnow \{create_jam_multiple_highways
			id = jam_recording_spawns
			params = {
				song = editable
			}}
	endif
	destroy_jam_settings_arrows player = <player>
	guitar_jam_simplerecops_command_stoprec no_sound select_player = <player>
	guitar_jam_simplerecops_command_stopplay
endscript

script guitar_jam_settings_tuning 
	getplayerinfo <player> jam_instrument
	getplayerinfo <player> controller
	setscreenelementprops id = <vmenu_options_submenu> block_events
	formattext checksumname = tuning_event_handler 'jam_tuning_event_handler_%s' s = <player>
	if ($jam_advanced_record = 1)
		event_handler_parent = jam_studio_element
	else
		event_handler_parent = jam_band_container
	endif
	createscreenelement {
		type = containerelement
		parent = <event_handler_parent>
		id = <tuning_event_handler>
		z_priority = 50
		exclusive_device = <controller>
		event_handlers = [
			{pad_up guitar_jam_settings_tuning_up params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> tuning_event_handler = <tuning_event_handler> player = <player>}}
			{pad_down guitar_jam_settings_tuning_down params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> tuning_event_handler = <tuning_event_handler> player = <player>}}
			{pad_choose guitar_jam_settings_tuning_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> tuning_event_handler = <tuning_event_handler> player = <player>}}
			{pad_circle guitar_jam_settings_tuning_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> tuning_event_handler = <tuning_event_handler> player = <player>}}
			{pad_start guitar_jam_settings_tuning_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> tuning_event_handler = <tuning_event_handler> player = <player>}}
		]
	}
	create_jam_settings_arrows player = <player> parent = <option_id>
	launchevent type = focus target = <tuning_event_handler>
endscript

script guitar_jam_settings_tuning_up 
	tuning = $jam_current_tuning
	<tuning> = (<tuning> + 1)
	if (<tuning> > 5)
		return
	endif
	change jam_current_tuning = <tuning>
	settrackinfo track = rhythm tuning = <tuning>
	morph_jam_settings_arrows player = <player> up
	killspawnedscript \{name = guitar_jam_settings_preview_tuning}
	killspawnedscript \{name = guitar_jam_settings_preview_note}
	spawnscriptnow guitar_jam_settings_preview_note params = {<...>}
	guitar_jam_settings_update_tuning <...>
endscript

script guitar_jam_settings_tuning_down 
	tuning = $jam_current_tuning
	<tuning> = (<tuning> - 1)
	if (<tuning> < -5)
		return
	endif
	change jam_current_tuning = <tuning>
	settrackinfo track = rhythm tuning = <tuning>
	morph_jam_settings_arrows player = <player> down
	killspawnedscript \{name = guitar_jam_settings_preview_tuning}
	killspawnedscript \{name = guitar_jam_settings_preview_note}
	spawnscriptnow guitar_jam_settings_preview_note params = {<...>}
	guitar_jam_settings_update_tuning <...>
endscript

script guitar_jam_settings_tuning_back 
	generic_menu_pad_back_sound
	setscreenelementprops id = <vmenu_options_submenu> unblock_events
	destroyscreenelement id = <tuning_event_handler>
	destroy_jam_settings_arrows player = <player>
	formattext checksumname = preview_sample 'jam_settings_preview_sample_%s' s = <player>
	stopsound ($<preview_sample>) fade_time = 0.1 fade_type = linear
endscript

script guitar_jam_settings_update_tuning 
	gettrackinfo \{track = rhythm}
	if ($jam_current_tuning > 0)
		formattext textname = tuning_text qs(0xf5e4c97b) s = <tuning>
	else
		formattext textname = tuning_text qs(0x0f24e557) s = <tuning>
	endif
	if gotparam \{option_text_id}
		<option_text_id> :setprops text = <tuning_text>
	endif
endscript
jam_mute_menu_sounds = 0

script guitar_jam_settings_toggle_menu_sounds 
	if (($jam_mute_menu_sounds) = 0)
		change \{jam_mute_menu_sounds = 1}
		setsoundbussparams \{front_end = {
				vol = -100
			}}
		setsoundbussparams \{pause_menu = {
				vol = -100
			}}
	else
		jam_settings_reinit_menu_sounds
	endif
	guitar_jam_settings_update_menu_sounds_text <...>
endscript

script jam_settings_reinit_menu_sounds 
	change \{jam_mute_menu_sounds = 0}
	setsoundbussparams {front_end = {vol = ($default_bussset.front_end.vol)}}
	setsoundbussparams {pause_menu = {vol = ($default_bussset.pause_menu.vol)}}
endscript

script guitar_jam_settings_update_menu_sounds_text 
	if (($jam_mute_menu_sounds) = 0)
		flip_text = ($jam_option_text_mute_on)
	else
		flip_text = ($jam_option_text_mute_off)
	endif
	if gotparam \{option_text_id}
		<option_text_id> :setprops text = <flip_text>
	endif
endscript

script guitar_jam_settings_toggle_lefty 
	getplayerinfo <player> lefty_flip
	if (<lefty_flip> = 0)
		<lefty_flip> = 1
		flip_text = qs(0x18e9650e)
	else
		<lefty_flip> = 0
		flip_text = qs(0x5548447e)
	endif
	if gotparam \{option_text_id}
		<option_text_id> :setprops text = <flip_text>
	endif
	setplayerinfo <player> lefty_flip = <lefty_flip>
	if ($jam_advanced_record = 1)
		stoprendering
		onexitrun \{startrendering}
		killspawnedscript \{name = create_jam_highway_notetrack}
		killspawnedscript \{name = create_jam_highway_fretbars}
		killspawnedscript \{name = recreate_jam_highway_notetracks}
		create_studio_now_bar
		jam_highway_reinit
		spawnscriptnow \{create_jam_multiple_highways
			id = jam_recording_spawns
			params = {
				song = editable
			}}
		new_pos = ($jam_highway_play_line_pos - (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second))
		setscreenelementprops id = jam_highway_container pos = (<new_pos>)
		<new_low_bound> = ($jam_highway_play_time + $jam_highway_start_low_bound)
		<new_high_bound> = ($jam_highway_play_time + $jam_highway_start_high_bound)
		casttointeger \{new_low_bound}
		casttointeger \{new_high_bound}
		change jam_highway_low_bound = <new_low_bound>
		change jam_highway_high_bound = <new_high_bound>
		jam_highway_reinit
		wait \{10
			gameframes}
		startrendering
	endif
endscript

script guitar_jam_settings_update_lefty_text 
	getplayerinfo <player> lefty_flip
	if (<lefty_flip> = 1)
		flip_text = qs(0x18e9650e)
	else
		flip_text = qs(0x5548447e)
	endif
	if gotparam \{option_text_id}
		<option_text_id> :setprops text = <flip_text>
	endif
endscript
jam_settings_preview_sample_1 = null
jam_settings_preview_sample_2 = null
jam_settings_preview_sample_3 = null
jam_settings_preview_sample_4 = null

script guitar_jam_settings_preview_note 
	formattext checksumname = preview_sample 'jam_settings_preview_sample_%s' s = <player>
	getplayerinfo <player> jam_instrument
	stopsound ($<preview_sample>) fade_time = 0.1 fade_type = linear
	wait \{1
		gameframe}
	switch <jam_instrument>
		case 0
		jam_get_sample_checksum \{fret = 0
			string = 0
			type = 0
			jam_instrument = 0}
		playsound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_rhythmguitar
		case 1
		jam_get_sample_checksum \{fret = 0
			string = 0
			type = 0
			jam_instrument = 1}
		playsound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_leadguitar
		case 2
		jam_get_sample_checksum \{fret = 0
			string = 0
			type = 0
			jam_instrument = 2}
		playsound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_bass
		case 3
		drum_kit_string = ($drum_kits [$jam_current_drum_kit].string_id)
		play_drum_sample drum_kit_string = <drum_kit_string> pad = snare velocity = 80 buss = jammode_drums
		case 4
		jam_get_single_sample_for_melody_playback \{fret = 0
			string = 0
			type = 0
			jam_instrument = 4}
		playsound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_vox
	endswitch
	if NOT (<jam_instrument> = 3)
		change globalname = <preview_sample> newvalue = <sample_checksum>
	endif
	wait \{1
		second}
	stopsound ($<preview_sample>) fade_type = linear fade_time = $jam_fade_time
endscript

script jam_band_remove_pause_submenu 
	if gotparam \{choose}
		soundevent \{event = recording_start}
	else
		generic_menu_pad_back_sound
	endif
	if screenelementexists id = <player_pause_submenu>
		destroyscreenelement id = <player_pause_submenu>
	endif
	if ($jam_advanced_record = 1)
		clean_up_user_control_helpers
		menu_jam_band_add_control_helpers \{state = pause_menu}
	endif
	if screenelementexists \{id = {
				jam_pause_container
				child = clip_window_pause_submenu
			}}
		destroyscreenelement \{id = {
				jam_pause_container
				child = clip_window_pause_submenu
			}}
	endif
	if screenelementexists id = <vmenu_id>
		launchevent type = focus target = <vmenu_id>
	endif
endscript

script jam_band_pause_new_instrument 
	getplayerinfo <select_player> jam_instrument
	if NOT (<jam_instrument> = $jam_mic_id)
		if structurecontains structure = ($jam_tracks [<jam_instrument>]) ui_destroy_func
			formattext checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
			spawnscriptnow ($jam_tracks [<jam_instrument>].ui_destroy_func) id = <jam_player_spawns> params = {player = <select_player>}
		endif
	endif
	jam_destroy_player_info_box player = <select_player>
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player>
	formattext checksumname = inst_cont 'inst_cont_%s' s = <select_player>
	jam_destroy_instrument select_player = <select_player> player_cont = <player_cont> inst_cont = <inst_cont>
	setplayerinfo <select_player> jam_instrument = -1
endscript

script jam_check_for_easy_backout 
endscript

script jam_band_pause_quit \{force_event = false}
	change \{jam_highway_playing = 0}
	change \{jam_band_recording = 0}
	change \{jam_highway_recording = 0}
	ui_event event = menu_back data = {state = uistate_jam_select_song show_popup = 0} force_event = <force_event>
	jam_recording_cleanup
	destroy_popup_warning_menu
	guitar_jam_effects_toggle_active \{jam_instrument = 0
		force_state = off}
	guitar_jam_effects_toggle_active \{jam_instrument = 1
		force_state = off}
	guitar_jam_effects_toggle_active \{jam_instrument = 2
		force_state = off}
	guitar_jam_effects_toggle_active \{jam_instrument = 4
		force_state = off}
endscript

script jam_band_pause_save_and_quit 
	jam_save_song_setup
	change \{memcard_after_func = jam_band_pause_save_and_quit_after_func}
	ui_memcard_save_jam \{event = menu_back
		data = {
			state = uistate_jam_select_song
			editing = 1
			show_popup = 0
		}}
endscript

script jam_band_pause_save_and_quit_after_func 
	guitar_jam_effects_toggle_active \{jam_instrument = 0
		force_state = off}
	guitar_jam_effects_toggle_active \{jam_instrument = 1
		force_state = off}
	guitar_jam_effects_toggle_active \{jam_instrument = 2
		force_state = off}
	guitar_jam_effects_toggle_active \{jam_instrument = 4
		force_state = off}
	change \{jam_highway_playing = 0}
	change \{jam_band_recording = 0}
	change \{jam_highway_recording = 0}
	setplayerinfo \{1
		jam_instrument = -1}
	setplayerinfo \{2
		jam_instrument = -1}
	setplayerinfo \{3
		jam_instrument = -1}
	setplayerinfo \{4
		jam_instrument = -1}
	jam_save_song_unload
endscript

script jam_band_pause_save 
	jam_save_song_setup
	change \{memcard_after_func = jam_band_pause_save_after_func}
	if (<from_adv> = 0)
		ui_memcard_save_jam \{event = menu_back
			data = {
				state = uistate_jam_band
				editing = 1
				show_popup = 0
			}}
	else
		ui_memcard_save_jam event = menu_back data = {state = uistate_recording editing = 1 current_instrument = ($jam_current_track) ghmix_persistant_settings = <ghmix_persistant_settings>}
	endif
endscript

script jam_band_pause_save_after_func 
	destroy_popup_warning_menu
	set_focus_color \{rgba = [
			255
			255
			255
			255
		]}
	set_unfocus_color \{rgba = [
			210
			130
			0
			255
		]}
	change \{jam_band_new_song = 0}
endscript

script jam_band_pause_save_as_text_select 
	destroy_popup_warning_menu
	jam_get_num_songs
	if (<user_song_count> < ($jam_max_user_songs))
		change \{target_jam_camera_prop = jam_publish}
		jam_camera_wait
		if ($jam_band_new_song = 1)
			start_text = qs(0xef150ff7)
		else
			start_text = ($jam_selected_song)
		endif
		ui_event event = menu_change data = {state = uistate_jam_publish_text_entry text = <start_text> choose_script = jam_band_pause_save_as}
	else
		jam_save_as_failed_dialog \{dialog = 0}
	endif
endscript

script jam_save_as_failed_dialog \{dialog = 0}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		formattext \{textname = dialog
			qs(0xedf2cf45)
			s = $jam_max_user_songs}
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs(0xfb9c065f)
		textblock = {
			text = <dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_save_as_failed_go_back}
				text = qs(0x320a8d1c)
			}
		]
	}
endscript

script jam_save_as_failed_go_back 
	destroy_popup_warning_menu
	ui_event \{event = menu_back
		data = {
			state = uistate_jam_band
			editing = 1
			show_popup = 0
		}}
endscript

script jam_band_pause_save_as 
	jam_recording_get_unique_name prefix = <text>
	jam_save_song_setup song = <song>
	change \{memcard_after_func = jam_band_pause_save_as_after_func}
	ui_memcard_save_jam \{event = menu_back
		data = {
			state = uistate_jam_band
			editing = 1
			show_popup = 0
		}}
endscript

script jam_band_pause_save_as_after_func 
	set_focus_color \{rgba = [
			255
			255
			255
			255
		]}
	set_unfocus_color \{rgba = [
			210
			130
			0
			255
		]}
	change \{jam_band_new_song = 0}
endscript

script jam_band_save_dialog \{dialog = 0}
	launchevent type = unfocus target = <vmenu_id>
	if ($jam_advanced_record = 0)
		destroy_jam_band_menu
		from_adv = 0
	else
		destroy_jam_recording_menu
		from_adv = 1
		ghmix_persistant_settings = {}
		addparam structure_name = ghmix_persistant_settings name = cur_playtime value = ($jam_highway_play_time)
		addparam structure_name = ghmix_persistant_settings name = cur_playline_pos value = ($jam_highway_play_line_pos)
		addparam structure_name = ghmix_persistant_settings name = cur_lead_octave value = ($jam_lead_octave_range)
		addparam structure_name = ghmix_persistant_settings name = cur_melody_octave value = ($jam_melody_octave_range)
		addparam structure_name = ghmix_persistant_settings name = cur_rhythm_chords value = ($jam_rhythm_chord_type)
		addparam structure_name = ghmix_persistant_settings name = cur_instrument value = ($jam_current_track)
		addparam structure_name = ghmix_persistant_settings name = cur_loop_low value = ($jam_loop_bound_low)
		addparam structure_name = ghmix_persistant_settings name = cur_loop_high value = ($jam_loop_bound_high)
		addparam structure_name = ghmix_persistant_settings name = cur_control value = ($jam_control_selected)
		addparam structure_name = ghmix_persistant_settings name = cur_quantize value = ($jam_current_quantize)
	endif
	clean_up_user_control_helpers
	getplayerinfo <select_player> controller
	change primary_controller = <controller>
	switch <dialog>
		case 0
		formattext \{textname = title
			qs(0xe3c58212)}
		formattext \{textname = save_dialog
			qs(0x3b907ccc)}
	endswitch
	create_popup_warning_menu {
		title = <title>
		textblock = {
			text = <save_dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = jam_band_pause_save
				func_params = {vmenu_id = <vmenu_id> from_adv = <from_adv> ghmix_persistant_settings = <ghmix_persistant_settings>}
				text = qs(0xe618e644)
			}
			{
				func = jam_band_save_dialog_cancel
				func_params = {from_adv = <from_adv> ghmix_persistant_settings = <ghmix_persistant_settings>}
				text = qs(0x320a8d1c)
			}
		]
		focus_index = 1
		popup_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back ui_menu_select_sfx}
			{pad_back jam_band_save_dialog_cancel params = {from_adv = <from_adv> ghmix_persistant_settings = <ghmix_persistant_settings>}}
		]
	}
	dim_save_option_for_guest <...> popup_warning_child_index = 0
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
endscript

script jam_band_save_dialog_cancel 
	destroy_popup_warning_menu
	if (<from_adv> = 1)
		ui_event event = menu_refresh data = {editing = 1 current_instrument = ($jam_current_track) ghmix_persistant_settings = <ghmix_persistant_settings>}
	else
		ui_event \{event = menu_refresh
			data = {
				editing = 1
			}}
	endif
endscript

script jam_band_quit_dialog 
	launchevent type = unfocus target = <vmenu_id>
	if ($jam_advanced_record = 0)
		destroy_jam_band_menu
		from_adv = 0
	else
		destroy_jam_recording_menu
		from_adv = 1
		ghmix_persistant_settings = {}
		addparam structure_name = ghmix_persistant_settings name = cur_playtime value = ($jam_highway_play_time)
		addparam structure_name = ghmix_persistant_settings name = cur_playline_pos value = ($jam_highway_play_line_pos)
		addparam structure_name = ghmix_persistant_settings name = cur_lead_octave value = ($jam_lead_octave_range)
		addparam structure_name = ghmix_persistant_settings name = cur_melody_octave value = ($jam_melody_octave_range)
		addparam structure_name = ghmix_persistant_settings name = cur_rhythm_chords value = ($jam_rhythm_chord_type)
		addparam structure_name = ghmix_persistant_settings name = cur_instrument value = ($jam_current_track)
		addparam structure_name = ghmix_persistant_settings name = cur_loop_low value = ($jam_loop_bound_low)
		addparam structure_name = ghmix_persistant_settings name = cur_loop_high value = ($jam_loop_bound_high)
		addparam structure_name = ghmix_persistant_settings name = cur_control value = ($jam_control_selected)
		addparam structure_name = ghmix_persistant_settings name = cur_quantize value = ($jam_current_quantize)
	endif
	clean_up_user_control_helpers
	getplayerinfo <select_player> controller
	change primary_controller = <controller>
	create_popup_warning_menu {
		title = qs(0x5a34b03d)
		textblock = {
			text = qs(0xf61a5462)
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = jam_band_pause_save_and_quit
				func_params = {vmenu_id = <vmenu_id>}
				text = qs(0xe618e644)
			}
			{
				func = jam_band_pause_quit
				func_params = {vmenu_id = <vmenu_id>}
				text = qs(0xc4018c33)
			}
		]
		popup_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back ui_menu_select_sfx}
			{pad_back jam_band_quit_dialog_cancel params = {from_adv = <from_adv> ghmix_persistant_settings = <ghmix_persistant_settings>}}
		]
	}
	dim_save_option_for_guest <...> popup_warning_child_index = 0
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
endscript

script jam_band_quit_dialog_cancel 
	destroy_popup_warning_menu
	if (<from_adv> = 1)
		ui_event event = menu_refresh data = {editing = 1 current_instrument = ($jam_current_track) ghmix_persistant_settings = <ghmix_persistant_settings>}
	else
		ui_event \{event = menu_refresh
			data = {
				editing = 1
			}}
	endif
endscript

script jam_band_remove_pause \{respawn_input = 0}
	if screenelementexists id = <scrolling_options>
		launchevent type = unfocus target = <scrolling_options>
	endif
	if (<respawn_input> = 1)
		getplayerinfo <select_player> jam_instrument
		getplayerinfo <select_player> controller
		formattext checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
		if NOT (<jam_instrument> = $jam_mic_id)
			if structurecontains structure = ($jam_tracks [<jam_instrument>]) ui_create_func
				formattext checksumname = inst_cont 'inst_cont_%s' s = <select_player>
				jam_destroy_fretboard player = <select_player>
				spawnscriptnow ($jam_tracks [<jam_instrument>].ui_create_func) id = <jam_player_spawns> params = {parent_id = <inst_cont> player = <select_player> controller = <controller>}
			endif
			if structurecontains structure = ($jam_tracks [<jam_instrument>]) input_func
				formattext checksumname = input_spawn 'input_spawn_%s' s = <select_player>
				spawnscriptnow ($jam_tracks [<jam_instrument>].input_func) id = <input_spawn> params = {select_player = <select_player> show_hud = 0 controller = <controller> spawn_id = <input_spawn>}
			endif
			guitar_jam_effects_toggle_ui_effect select_player = <select_player> jam_instrument = <jam_instrument>
		else
			spawnscriptnow jam_band_activate_mic id = <jam_player_spawns> params = {select_player = <select_player>}
		endif
	endif
	if screenelementexists id = <player_pause>
		if NOT ($jam_advanced_record = 1)
			<player_pause> :legacydomorph pos = (0.0, -300.0) time = 0.1
		else
			<player_pause> :legacydomorph pos = (133.0, -500.0) time = 0.1
		endif
	endif
	if screenelementexists \{id = {
				jam_pause_container
				child = clip_window_pause
			}}
		destroyscreenelement \{id = {
				jam_pause_container
				child = clip_window_pause
			}}
	endif
	formattext checksumname = effect_info_box 'effect_info_box_%a' a = <select_player>
	if screenelementexists id = <effect_info_box>
		formattext checksumname = player_cont 'inst_player_cont_%s' s = <select_player>
		<effect_info_box> :se_setprops pos = (5.0, -355.0) time = 0.1
	endif
	if screenelementexists id = <player_pause>
		if NOT ($jam_advanced_record = 1)
			soundevent \{event = menu_recording_pause_panel_out}
		endif
		destroy_menu menu_id = <scrolling_options>
		destroyscreenelement id = <player_pause>
	endif
	if ((<respawn_input> = 1) || (<respawn_input> = -1))
		if screenelementexists id = <event_cont>
			launchevent type = focus target = <event_cont>
		else
			return
		endif
	endif
	if ($jam_advanced_record = 1)
		spawnscriptnow \{jam_studio_animate_mouse}
		clean_up_user_control_helpers
		menu_jam_band_add_control_helpers
		if NOT gotparam \{no_sound}
			soundevent \{event = jam_advanced_record_pause_panel_out}
		endif
		killspawnedscript \{name = jam_highway_select_quantize}
		spawnscriptnow \{jam_highway_select_quantize
			id = jam_recording_spawns}
		launchevent type = focus target = <event_cont>
		jam_ghmix_show_scale_reference
	else
		menu_jam_band_add_control_helpers state = instrument_ui instrument = <select_instrument>
	endif
endscript

script jam_band_pause_record_text 
	player = 1
	begin
	formattext checksumname = text_id 'option_text_%a_%b' a = <option> b = <player>
	if ($jam_band_recording = 1)
		if screenelementexists id = <text_id>
			setscreenelementprops id = <text_id> text = qs(0x0a46311a)
		endif
	else
		if screenelementexists id = <text_id>
			setscreenelementprops id = <text_id> text = qs(0xea37872c)
		endif
	endif
	<player> = (<player> + 1)
	repeat ($num_jam_players)
endscript

script destroy_jam_band_menu 
	active_controllers = [0 0 0 0 0 0 0]
	getactivecontrollers
	count = 0
	begin
	if ((<active_controllers> [<count>]) = 1)
		jam_destroy_player player = (<count> + 1)
	endif
	<count> = (<count> + 1)
	repeat ($num_jam_players)
	jam_band_deactivate_mic
	jam_input_melody_stop_sound
	if ($game_mode = training)
		jam_destroy_tutorial_menu
	endif
	change \{jam_highway_playing = 0}
	change \{jam_band_recording = 0}
	change \{jam_highway_recording = 0}
	jam_settings_reinit_menu_sounds
	killspawnedscript \{name = jam_band_pulsate_speaker_head}
	killspawnedscript \{name = jam_band_pulsate_small_speaker_head}
	killspawnedscript \{name = line6_pod_remove}
	killspawnedscript \{name = guitar_jam_playback_recording}
	killspawnedscript \{name = guitar_jam_drum_playback}
	killspawnedscript \{id = jam_band_spawns}
	killspawnedscript \{id = jam_input_spawns}
	killspawnedscript \{id = jam_recording_spawns}
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if screenelementexists \{id = jam_band_container}
		destroyscreenelement \{id = jam_band_container}
	endif
endscript

script jam_destroy_player 
	formattext checksumname = player_cont 'inst_player_cont_%s' s = <player>
	if screenelementexists id = <player_cont>
		destroyscreenelement id = <player_cont>
	endif
	formattext checksumname = scrolling_inst_select 'scrolling_inst_select_%s' s = <player>
	if screenelementexists id = <scrolling_inst_select>
		destroy_menu menu_id = <scrolling_inst_select>
	endif
	formattext checksumname = scrolling_options 'scrolling_options_%s' s = <player>
	if screenelementexists id = <scrolling_options>
		destroy_menu menu_id = <scrolling_options>
	endif
	formattext checksumname = inst_cont 'inst_cont_%s' s = <player>
	if screenelementexists id = <inst_cont>
		destroy_menu menu_id = <inst_cont>
	endif
	formattext checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <player>
	killspawnedscript id = <scale_preview_spawn>
	formattext checksumname = jam_playback_delete 'jam_playback_delete_%s' s = <player>
	killspawnedscript id = <jam_playback_delete>
	formattext checksumname = input_spawn 'input_spawn_%s' s = <player>
	killspawnedscript id = <input_spawn>
	formattext checksumname = arpeggiator_spawn 'arpeggiator_spawn_%s' s = <player>
	killspawnedscript id = <arpeggiator_spawn>
	destroyplayerserverjaminput player = <player>
	jam_kill_update_note_length player = <player>
	getplayerinfo <player> jam_instrument
	if (<jam_instrument> = $jam_mic_id)
		jam_band_deactivate_mic select_player = <player>
	endif
	formattext checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <player>
	killspawnedscript id = <jam_player_spawns>
endscript

script jam_band_show_effect_ui 
	return
	getplayerinfo <select_player> jam_instrument
	if NOT (<jam_instrument> = 3)
		formattext checksumname = fret_top_id 'jam_tilt_top_fret_%s' s = <select_player>
		formattext checksumname = fret_middle_id 'jam_tilt_middle_fret_%s' s = <select_player>
		formattext checksumname = fret_bottom_id 'jam_tilt_bottom_fret_%s' s = <select_player>
		formattext checksumname = fret_upper_middle_id 'jam_tilt_upper_middle_fret_%s' s = <select_player>
		formattext checksumname = fret_low_middle_id 'jam_tilt_low_middle_fret_%s' s = <select_player>
		if gotparam \{on}
			<fret_top_id> :setprops rgba = [100 255 255 255]
			<fret_middle_id> :setprops rgba = [100 255 255 255]
			<fret_bottom_id> :setprops rgba = [100 255 255 255]
			if screenelementexists id = <fret_upper_middle_id>
				<fret_upper_middle_id> :setprops rgba = [100 255 255 255]
			endif
			if screenelementexists id = <fret_low_middle_id>
				<fret_low_middle_id> :setprops rgba = [100 255 255 255]
			endif
		else
			<fret_top_id> :setprops rgba = [200 200 200 255]
			<fret_middle_id> :setprops rgba = [200 200 200 255]
			<fret_bottom_id> :setprops rgba = [200 200 200 255]
			if screenelementexists id = <fret_upper_middle_id>
				<fret_upper_middle_id> :setprops rgba = [200 200 200 255]
			endif
			if screenelementexists id = <fret_low_middle_id>
				<fret_low_middle_id> :setprops rgba = [200 200 200 255]
			endif
		endif
	endif
endscript

script guitar_jam_simplerecops_play 
	if ($jam_band_recording = 0)
		if ($jam_highway_playing = 0)
			guitar_jam_simplerecops_command_startplay select_player = <select_player>
			soundevent \{event = dpad_play}
		else
			guitar_jam_simplerecops_command_stopplay
			soundevent \{event = dpad_stop}
		endif
	else
		guitar_jam_simplerecops_command_stoprec select_player = <select_player>
		guitar_jam_simplerecops_command_stopplay
	endif
endscript

script guitar_jam_simplerecops_record 
	if ($jam_player_recording_armed [(<select_player> - 1)] = 0)
		guitar_jam_simplerecops_command_startrec select_player = <select_player>
	else
		guitar_jam_simplerecops_command_stoprec select_player = <select_player>
	endif
endscript

script guitar_jam_simplerecops_command_startplay 
	change \{jam_highway_playing = 1}
	spawnscriptnow \{jam_band_recording_begin
		id = jam_band_spawns}
	<player> = 1
	begin
	formattext checksumname = simple_rec_button_onr 'jam_simple_rec_button_onr_%s' s = <select_player>
	formattext checksumname = simple_rec_icon_play 'jam_simple_rec_icon_play_%s' s = <select_player>
	formattext checksumname = simple_rec_icon_stop 'jam_simple_rec_icon_stop_%s' s = <select_player>
	if screenelementexists id = <simple_rec_button_onr>
		safe_hide id = <simple_rec_icon_play>
		safe_show id = <simple_rec_icon_stop>
		safe_show id = <simple_rec_button_onr>
	endif
	<player> = (<player> + 1)
	repeat ($num_jam_players)
	broadcastevent \{type = jam_tutorial_play_start}
endscript

script guitar_jam_simplerecops_command_stopplay 
	change \{jam_band_recording = 0}
	change \{jam_highway_playing = 0}
	change \{jam_highway_recording = 0}
	killspawnedscript \{name = guitar_jam_playback_delete}
	killspawnedscript \{name = guitar_jam_playback_recording}
	killspawnedscript \{name = guitar_jam_drum_playback}
	killspawnedscript \{name = jam_band_recording_begin}
	killspawnedscript \{name = jam_recording_metronome}
	jam_stop_all_samples
	jam_stop_all_sound
	change \{jam_player_recording_armed = [
			0
			0
			0
			0
		]}
	change \{jam_player_recording_begin_time = [
			0
			0
			0
			0
		]}
	jam_input_melody_stop_sound
	<player> = 1
	begin
	formattext checksumname = simple_rec_icon_play 'jam_simple_rec_icon_play_%s' s = <player>
	formattext checksumname = simple_rec_icon_rec 'jam_simple_rec_icon_rec_%s' s = <player>
	formattext checksumname = simple_rec_icon_rw 'jam_simple_rec_icon_rw_%s' s = <player>
	formattext checksumname = simple_rec_icon_ff 'jam_simple_rec_icon_ff_%s' s = <player>
	formattext checksumname = simple_rec_icon_stop 'jam_simple_rec_icon_stop_%s' s = <player>
	formattext checksumname = simple_rec_button_onr 'jam_simple_rec_button_onr_%s' s = <player>
	formattext checksumname = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <player>
	formattext checksumname = right_hold 'right_hold_player%s' s = <player>
	if screenelementexists id = <simple_rec_button_onr>
		safe_show id = <simple_rec_icon_play>
		safe_hide id = <simple_rec_icon_rec>
		safe_show id = <simple_rec_icon_rw>
		safe_hide id = <simple_rec_icon_ff>
		safe_hide id = <simple_rec_icon_stop>
		safe_hide id = <simple_rec_button_onr>
		safe_hide id = <simple_rec_button_onl>
		safe_hide id = <right_hold>
	endif
	<player> = (<player> + 1)
	repeat ($num_jam_players)
	broadcastevent \{type = jam_tutorial_play_stop}
endscript
jam_player_recording_armed = [
	0
	0
	0
	0
]
jam_player_recording_begin_time = [
	0
	0
	0
	0
]

script guitar_jam_simplerecops_command_startrec 
	change \{jam_band_recording = 1}
	change \{jam_highway_recording = 1}
	soundevent \{event = recording_start}
	setarrayelement arrayname = jam_player_recording_armed globalarray index = (<select_player> - 1) newvalue = 1
	curr_time = ($jam_highway_play_time)
	casttointeger \{curr_time}
	setarrayelement arrayname = jam_player_recording_begin_time globalarray index = (<select_player> - 1) newvalue = <curr_time>
	getplayerinfo <select_player> jam_instrument
	switch <jam_instrument>
		case 0
		killspawnedscript \{id = jam_band_rhythm_playback}
		case 1
		killspawnedscript \{id = jam_band_lead_playback}
		case 2
		killspawnedscript \{id = jam_band_bass_playback}
		case 3
		killspawnedscript \{id = jam_band_drum_playback}
		case 4
		killspawnedscript \{id = jam_band_melody_playback}
	endswitch
	getplayerinfo <select_player> jam_instrument
	formattext checksumname = jam_playback_delete 'jam_playback_delete_%s' s = <select_player>
	spawnscriptnow guitar_jam_playback_delete id = <jam_playback_delete> params = {jam_instrument = <jam_instrument> start_time = $jam_highway_play_time}
	formattext checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
	spawnscriptnow jam_recording_metronome id = <jam_player_spawns> params = {select_player = <select_player>}
	formattext checksumname = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <select_player>
	safe_show id = <simple_rec_button_onl>
	broadcastevent \{type = jam_tutorial_record_start}
endscript

script jam_band_recording_begin 
	reset_song_time starttime = ($jam_highway_play_time)
	spawnscriptnow \{guitar_jam_playback_recording
		id = jam_band_rhythm_playback
		params = {
			jam_instrument = 0
			start_time = $jam_highway_play_time
		}}
	spawnscriptnow \{guitar_jam_playback_recording
		id = jam_band_lead_playback
		params = {
			jam_instrument = 1
			start_time = $jam_highway_play_time
		}}
	spawnscriptnow \{guitar_jam_playback_recording
		id = jam_band_bass_playback
		params = {
			jam_instrument = 2
			start_time = $jam_highway_play_time
		}}
	spawnscriptnow \{guitar_jam_playback_recording
		id = jam_band_melody_playback
		params = {
			jam_instrument = 4
			start_time = $jam_highway_play_time
		}}
	spawnscriptnow \{guitar_jam_drum_playback
		id = jam_band_drum_playback
		params = {
			start_time = $jam_highway_play_time
		}}
	begin_pos = ($jam_band_playline_pos + ((($jam_highway_play_time) / 1000.0) * $jam_band_pixels_per_second))
	setscreenelementprops id = jam_band_highway_playline pos = <begin_pos>
	pixels_per_frame = ($jam_band_pixels_per_second / 60)
	getscreenelementposition \{id = jam_band_highway_playline}
	end_pos = ($jam_band_playline_pos + ((($jam_band_song_length) / 1000.0) * $jam_band_pixels_per_second))
	begin
	new_pos = ($jam_band_playline_pos + ((($jam_highway_play_time) / 1000.0) * $jam_band_pixels_per_second))
	if NOT (<new_pos> [0] > <end_pos> [0])
		setscreenelementprops id = jam_band_highway_playline pos = <new_pos>
		getsongtimems
		change jam_highway_play_time = <time>
	else
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_band_pause_record_text option = <option>
	player = 1
	begin
	guitar_jam_simplerecops_command_stoprec select_player = <player>
	player = (<player> + 1)
	repeat 4
	guitar_jam_simplerecops_command_stopplay
endscript

script guitar_jam_simplerecops_command_stoprec 
	setarrayelement arrayname = jam_player_recording_armed globalarray index = (<select_player> - 1) newvalue = 0
	setarrayelement arrayname = jam_player_recording_begin_time globalarray index = (<select_player> - 1) newvalue = 0
	formattext checksumname = jam_playback_delete 'jam_playback_delete_%s' s = <select_player>
	killspawnedscript id = <jam_playback_delete>
	formattext checksumname = jam_band_playback_spawn 'jam_band_playback_spawn_%s' s = <select_player>
	getplayerinfo <select_player> jam_instrument
	switch <jam_instrument>
		case 0
		spawnscriptnow \{guitar_jam_playback_recording
			id = jam_band_rhythm_playback
			params = {
				jam_instrument = 0
				start_time = $jam_highway_play_time
			}}
		case 1
		spawnscriptnow \{guitar_jam_playback_recording
			id = jam_band_lead_playback
			params = {
				jam_instrument = 1
				start_time = $jam_highway_play_time
			}}
		case 2
		spawnscriptnow \{guitar_jam_playback_recording
			id = jam_band_bass_playback
			params = {
				jam_instrument = 2
				start_time = $jam_highway_play_time
			}}
		case 3
		spawnscriptnow \{guitar_jam_drum_playback
			id = jam_band_drum_playback
			params = {
				start_time = $jam_highway_play_time
			}}
		case 4
		spawnscriptnow \{guitar_jam_playback_recording
			id = jam_band_melody_playback
			params = {
				jam_instrument = 4
				start_time = $jam_highway_play_time
			}}
	endswitch
	if NOT gotparam \{no_sound}
		soundevent \{event = recording_stop}
	endif
	if gotparam \{all}
		formattext \{checksumname = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 1}
		safe_hide id = <simple_rec_button_onl>
		formattext \{checksumname = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 2}
		safe_hide id = <simple_rec_button_onl>
		formattext \{checksumname = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 3}
		safe_hide id = <simple_rec_button_onl>
		formattext \{checksumname = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 4}
		safe_hide id = <simple_rec_button_onl>
	else
		formattext checksumname = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <select_player>
		safe_hide id = <simple_rec_button_onl>
	endif
	getarraysize \{$jam_player_recording_armed}
	i = 0
	is_recording = 0
	begin
	if ($jam_player_recording_armed [<i>] = 1)
		<is_recording> = 1
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if (<is_recording> = 0)
		killspawnedscript \{name = jam_recording_metronome}
		change \{jam_band_recording = 0}
		change \{jam_highway_recording = 0}
	endif
	broadcastevent \{type = jam_tutorial_record_end}
endscript

script guitar_jam_simplerecops_skipfb 
	<initial_button_flash_time> = 0.15
	<time_held_before_spam> = 0.15
	<spam_frequency> = 0.1
	if (($jam_highway_playing = 1) || ($jam_highway_recording = 1))
		printf \{channel = jam_mode
			qs(0x25c1e3fb)}
		return
	endif
	soundevent \{event = dpad_play}
	if (<dir> = right)
		formattext checksumname = simple_rec_arrow 'jam_simple_rec_arrow_r_%s' s = <select_player>
		formattext checksumname = simple_rec_button_on 'jam_simple_rec_button_onr_%s' s = <select_player>
		formattext checksumname = simple_rec_button_other 'jam_simple_rec_button_onl_%s' s = <select_player>
		safe_hide id = <simple_rec_button_other>
		<new_time> = ($jam_highway_play_time + 1000)
	elseif (<dir> = left)
		formattext checksumname = simple_rec_arrow 'jam_simple_rec_arrow_l_%s' s = <select_player>
		formattext checksumname = simple_rec_button_on 'jam_simple_rec_button_onl_%s' s = <select_player>
		formattext checksumname = simple_rec_button_other 'jam_simple_rec_button_onr_%s' s = <select_player>
		safe_hide id = <simple_rec_button_other>
		<new_time> = ($jam_highway_play_time - 1000)
	endif
	getplayerinfo <select_player> controller
	<scroll_5> = 1.8
	<scroll_4> = 1.4
	<scroll_3> = 1.0
	<scroll_2> = 0.7
	<scroll_1> = 0.3
	<speed_5> = 18
	<speed_4> = 12
	<speed_3> = 7.2
	<speed_2> = 3
	<speed_1> = 1.5
	<button> = <dir>
	if gotparam \{direction_override}
		<button> = <direction_override>
	endif
	<time_held> = 0
	begin
	if controllerpressed <button> <controller>
		<right_not_held> = 0
	else
		<right_not_held> = 1
	endif
	safe_show id = <simple_rec_button_on>
	if (<right_not_held>)
		safe_hide id = <simple_rec_button_on>
		return
	endif
	if (<time_held> >= <scroll_5>)
		<scroll_speed> = <speed_5>
	elseif (<time_held> >= <scroll_4>)
		<scroll_speed> = <speed_4>
	elseif (<time_held> >= <scroll_3>)
		<scroll_speed> = <speed_3>
	elseif (<time_held> >= <scroll_2>)
		<scroll_speed> = <speed_2>
	elseif (<time_held> >= <scroll_1>)
		<scroll_speed> = <speed_1>
	endif
	spawnscriptnow guitar_jam_simplerecops_skip_once id = jam_band_spawns params = {dir = <dir> arrow = <simple_rec_arrow> scroll_speed = <scroll_speed>}
	<time_held> = (<time_held> + <spam_frequency>)
	wait <spam_frequency> seconds
	repeat
endscript

script guitar_jam_simplerecops_skip_once \{scroll_speed = 1}
	if NOT screenelementexists id = <arrow>
		return
	endif
	legacydoscreenelementmorph id = <arrow> scale = 1.1
	legacydoscreenelementmorph id = <arrow> scale = 0.8 time = 0.15
	getscreenelementposition \{id = jam_band_highway_playline}
	end_pos = ($jam_band_playline_pos + ((($jam_band_song_length) / 1000.0) * $jam_band_pixels_per_second))
	if (<dir> = right)
		<new_time> = ($jam_highway_play_time + (1000 * <scroll_speed>))
	elseif (<dir> = left)
		<new_time> = ($jam_highway_play_time - (1000 * <scroll_speed>))
	endif
	new_pos = ($jam_band_playline_pos + ((<new_time> / 1000.0) * $jam_band_pixels_per_second))
	if (<new_pos> [0] < 0)
		setscreenelementprops id = jam_band_highway_playline pos = ($jam_band_playline_pos)
		change \{jam_highway_play_time = 0}
	elseif ((<new_pos> [0]) > (<end_pos> [0]))
		setscreenelementprops id = jam_band_highway_playline pos = <end_pos>
		change jam_highway_play_time = ($jam_highway_song_length)
	else
		setscreenelementprops id = jam_band_highway_playline pos = (<new_pos>)
		change jam_highway_play_time = <new_time>
	endif
endscript

script guitar_jam_goto_advanced_rec 
	destroy_jam_band_menu
	change jam_current_recording_player = <select_player>
	getplayerinfo <select_player> jam_instrument
	if (<jam_instrument> = $jam_mic_id)
		setplayerinfo <select_player> jam_instrument = 4
		<jam_instrument> = 4
	elseif (<jam_instrument> = -1)
		setplayerinfo <select_player> jam_instrument = 0
		<jam_instrument> = 0
	endif
	getplayerinfo <select_player> controller
	change primary_controller = <controller>
	ui_event event = menu_replace data = {state = uistate_recording editing = 1 current_instrument = <jam_instrument> player = <select_player>}
endscript

script guitar_jam_goto_rec_studio 
	destroy_jam_recording_menu
	ui_event event = menu_replace data = {state = uistate_jam_band editing = 1 current_instrument = <jam_instrument> player = <select_player>}
endscript

script jam_pause_check_simple_record_input 
	formattext checksumname = player_pause 'jam_band_pause_%s' s = <select_player>
	begin
	jam_check_simple_record_input controller = <controller> select_player = <select_player>
	if NOT screenelementexists id = <player_pause>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript
right_hold_player1 = 0
right_hold_player2 = 0
right_hold_player3 = 0
right_hold_player4 = 0

script jam_check_simple_record_input 
	simplerec_controls = [record play skip_back skip_forward]
	if ($game_mode = training)
		if screenelementexists \{id = jam_band_container}
			jam_band_container :gettags
		elseif screenelementexists \{id = jam_studio_element}
			jam_studio_element :gettags
		endif
		if (<disable_simple_rec> = 1)
			return
		endif
	endif
	formattext checksumname = simple_rec_icon_play 'jam_simple_rec_icon_play_%s' s = <select_player>
	formattext checksumname = simple_rec_icon_rec 'jam_simple_rec_icon_rec_%s' s = <select_player>
	formattext checksumname = simple_rec_icon_rw 'jam_simple_rec_icon_rw_%s' s = <select_player>
	formattext checksumname = simple_rec_icon_ff 'jam_simple_rec_icon_ff_%s' s = <select_player>
	formattext checksumname = simple_rec_icon_stop 'jam_simple_rec_icon_stop_%s' s = <select_player>
	formattext checksumname = simple_rec_button_onr 'jam_simple_rec_button_onr_%s' s = <select_player>
	formattext checksumname = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <select_player>
	formattext checksumname = right_hold 'right_hold_player%s' s = <select_player>
	getplayerinfo <select_player> jam_instrument
	if (($jam_highway_playing = 1) || ($jam_band_recording = 1))
		safe_show id = <simple_rec_icon_stop>
		safe_show id = <simple_rec_icon_rec>
		safe_hide id = <simple_rec_icon_rw>
		safe_hide id = <simple_rec_icon_ff>
		safe_hide id = <simple_rec_icon_play>
		safe_show id = <simple_rec_button_onr>
	else
		safe_show id = <simple_rec_icon_rw>
		safe_show id = <simple_rec_icon_play>
		safe_hide id = <simple_rec_icon_ff>
		safe_hide id = <simple_rec_icon_stop>
		safe_hide id = <simple_rec_icon_rec>
	endif
	getplayerinfo <select_player> lefty_flip
	if NOT isguitarcontroller controller = <controller>
		<lefty_flip> = 0
	endif
	if (<lefty_flip> = 0)
		<skip_back_button> = left
		<play_button> = right
	else
		<skip_back_button> = right
		<play_button> = left
	endif
	if controllermake <skip_back_button> <controller>
		if NOT (($jam_highway_playing = 1) || ($jam_band_recording = 1))
			if arraycontains array = <simplerec_controls> contains = skip_back
				if scriptisrunning \{guitar_jam_simplerecops_skipfb}
					killspawnedscript \{name = guitar_jam_simplerecops_skipfb}
				endif
				spawnscriptnow guitar_jam_simplerecops_skipfb params = {dir = left select_player = <select_player> direction_override = <skip_back_button>}
				safe_show id = <simple_rec_button_onl>
			endif
		else
			if arraycontains array = <simplerec_controls> contains = record
				if NOT (<jam_instrument> = $jam_mic_id)
					guitar_jam_simplerecops_record select_player = <select_player>
				endif
			endif
		endif
		formattext checksumname = simple_rec_arrow_l 'jam_simple_rec_arrow_l_%s' s = <select_player>
		if screenelementexists id = <simple_rec_arrow_l>
			legacydoscreenelementmorph id = <simple_rec_arrow_l> scale = 1.1
			legacydoscreenelementmorph id = <simple_rec_arrow_l> scale = 0.8 time = 0.15
		endif
	endif
	if NOT (($jam_highway_playing = 1) || ($jam_band_recording = 1))
		if controllerpressed <play_button> <controller>
			if (($<right_hold>) >= 0)
				change globalname = <right_hold> newvalue = (($<right_hold>) + 1)
				if arraycontains array = <simplerec_controls> contains = skip_forward
					if (($<right_hold>) = 20)
						if scriptisrunning \{guitar_jam_simplerecops_skipfb}
							killspawnedscript \{name = guitar_jam_simplerecops_skipfb}
						endif
						spawnscriptnow guitar_jam_simplerecops_skipfb params = {dir = right select_player = <select_player> direction_override = <play_button>}
						safe_show id = <simple_rec_button_onr>
					endif
					if (($<right_hold>) >= 20)
						safe_show id = <simple_rec_icon_ff>
						safe_hide id = <simple_rec_icon_play>
					endif
				endif
			endif
		else
			safe_hide id = <simple_rec_icon_ff>
			safe_show id = <simple_rec_icon_play>
			if (($<right_hold>) > 0 && ($<right_hold>) < 20)
				if arraycontains array = <simplerec_controls> contains = play
					if scriptisrunning \{guitar_jam_simplerecops_skipfb}
						killspawnedscript \{name = guitar_jam_simplerecops_skipfb}
					endif
					guitar_jam_simplerecops_play select_player = <select_player>
					formattext checksumname = simple_rec_arrow_r 'jam_simple_rec_arrow_r_%s' s = <select_player>
					if screenelementexists id = <simple_rec_arrow_r>
						legacydoscreenelementmorph id = <simple_rec_arrow_r> scale = 1.1
						legacydoscreenelementmorph id = <simple_rec_arrow_r> scale = 0.8 time = 0.15
					endif
				endif
			endif
			change globalname = <right_hold> newvalue = 0
			safe_hide id = <simple_rec_button_onr>
		endif
	else
		if controllermake <play_button> <controller>
			if arraycontains array = <simplerec_controls> contains = play
				guitar_jam_simplerecops_play select_player = <select_player>
				formattext checksumname = simple_rec_arrow_r 'jam_simple_rec_arrow_r_%s' s = <select_player>
				if screenelementexists id = <simple_rec_arrow_r>
					legacydoscreenelementmorph id = <simple_rec_arrow_r> scale = 1.1
					legacydoscreenelementmorph id = <simple_rec_arrow_r> scale = 0.8 time = 0.15
				endif
				change globalname = <right_hold> newvalue = -1
			endif
		endif
	endif
endscript

script jam_note_limit_hit 
	<z_priority> = 35
	formattext checksumname = player_cont 'inst_player_cont_%s' s = <player>
	if NOT screenelementexists id = <player_cont>
		if NOT screenelementexists \{id = jam_player_recording_cont}
			return
		else
			<player_cont> = jam_player_recording_cont
			<z_priority> = 35
		endif
	endif
	formattext checksumname = msg_box 'jam_limit_msg_box_%a' a = <player>
	if screenelementexists id = <msg_box>
		return
	endif
	createscreenelement {
		type = textblockelement
		parent = <player_cont>
		id = <msg_box>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		rgba = [220 220 220 255]
		dims = (80.0, 40.0)
		pos = (0.0, 320.0)
		text = qs(0x9e3ba7cd)
		scale = 2
		internal_scale = 0.3
		fit_width = wrap
		fit_height = `scale down if larger`
		scale_mode = proportional
		z_priority = <z_priority>
	}
	if NOT screenelementexists id = <msg_box>
		return
	endif
	legacydoscreenelementmorph id = <msg_box> scale = 2.5 time = 0.18
	wait \{0.18
		seconds}
	if NOT screenelementexists id = <msg_box>
		return
	endif
	legacydoscreenelementmorph id = <msg_box> scale = 2 time = 0.18
	wait \{0.18
		seconds}
	if NOT screenelementexists id = <msg_box>
		return
	endif
	legacydoscreenelementmorph id = <msg_box> scale = 2.5 time = 0.18
	wait \{0.18
		seconds}
	if NOT screenelementexists id = <msg_box>
		return
	endif
	legacydoscreenelementmorph id = <msg_box> scale = 2 time = 0.18
	wait \{0.18
		seconds}
	if NOT screenelementexists id = <msg_box>
		return
	endif
	legacydoscreenelementmorph id = <msg_box> scale = 2.5 time = 0.18
	wait \{0.18
		seconds}
	if NOT screenelementexists id = <msg_box>
		return
	endif
	legacydoscreenelementmorph id = <msg_box> scale = 2 time = 0.18
	wait \{1
		seconds}
	if NOT screenelementexists id = <msg_box>
		return
	endif
	legacydoscreenelementmorph id = <msg_box> scale = 0 time = 0.25
	wait \{0.25
		seconds}
	destroyscreenelement id = <msg_box>
endscript

script jam_band_create_gem 
	if ($jam_advanced_record = 1)
		return
	endif
	createscreenelement {
		id = jam_band_gem
		type = containerelement
		parent = <player_cont>
		pos = <gem_pos>
		just = [left top]
	}
	getarraysize <gems>
	gem_count = 0
	begin
	if (<gem_pattern> && (<gems> [<gem_count>].pattern))
		if (<gem_count> = 5)
			createscreenelement {
				type = spriteelement
				parent = jam_band_gem
				texture = (<gems> [<gem_count>].texture)
				just = [center center]
				rgba = (<gems> [<gem_count>].rgba)
				pos = ((<gem_offset> * (3)) + (0.0, 0.0))
				z_priority = <z_priority>
				dims = (120.0, 5.0)
				scale = <gem_scale>
			}
		else
			createscreenelement {
				type = spriteelement
				parent = jam_band_gem
				texture = (<gems> [<gem_count>].texture)
				just = [center center]
				rgba = [255 255 255 255]
				pos = ((<gem_offset> * (<gem_count> + 1)))
				z_priority = <z_priority>
				dims = (20.0, 20.0)
			}
		endif
	endif
	<gem_count> = (<gem_count> + 1)
	repeat <array_size>
	pixels_per_half_measure = 200
	seconds_per_half_measure = ((60.0 / $jam_current_bpm) * 2)
	new_gem_pos = (<gem_pos> + ((0.0, 1.0) * <pixels_per_half_measure>))
	jam_band_gem :setprops just = [right top] pos = <new_gem_pos> time = <seconds_per_half_measure> alpha = 0
endscript

script jam_band_create_speaker_heads 
endscript

script jam_band_pulsate_speaker_head \{instrument = 0}
endscript

script jam_band_pulsate_small_speaker_head 
	begin
	<speaker_id> :setprops scale = 0.96999997 time = 0.01
	<speaker_id> :se_waitprops
	<speaker_id> :setprops scale = 1.0 time = 0.01
	<speaker_id> :se_waitprops
	<speaker_id> :setprops scale = 1.03 time = 0.01
	<speaker_id> :se_waitprops
	<speaker_id> :setprops scale = 1.0 time = 0.01
	<speaker_id> :se_waitprops
	repeat 10
	<speaker_id> :setprops scale = 1.0 time = 0.03
	<speaker_id> :se_waitprops
endscript

script jam_band_activate_mic 
	getplayerinfo <select_player> controller
	initjammic controller = <controller>
	begin
	jam_check_simple_record_input controller = <controller> select_player = <select_player>
	wait \{1
		gameframe}
	repeat
endscript

script jam_band_deactivate_mic 
	killspawnedscript \{name = jam_band_activate_mic}
	shutdownjammic
endscript

script jam_create_extra_info \{player = 1}
	formattext checksumname = extra_info_id 'jam_band_extra_info_%s' s = <player>
	if screenelementexists id = <extra_info_id>
		destroyscreenelement id = <extra_info_id>
	endif
	if gotparam \{arpeggiator}
		getplayerinfo <player> jam_instrument
		switch <jam_instrument>
			case 1
			arp_text = qs(0xba4928e3)
			case 2
			arp_text = qs(0x615d5ed8)
			case 4
			arp_text = qs(0x74210f5d)
		endswitch
		title_text = <arp_text>
		description_text = qs(0xa7125686)
		helper_text = qs(0xd301a78a)
		info1_text = qs(0x923969d0)
		info2_text = qs(0xda851ce1)
		info3_text = qs(0x085998f0)
		info4_text = qs(0x19e69b73)
	endif
	if gotparam \{drum_machine}
		title_text = qs(0xf24238cd)
		description_text = qs(0x6d0eadaa)
		helper_text = qs(0x49dd865c)
		info1_text = qs(0x923969d0)
		info2_text = qs(0x88cfedc8)
		info3_text = qs(0x085998f0)
		info4_text = qs(0xf1e1e865)
	endif
	formattext checksumname = player_cont 'inst_player_cont_%a' a = <player>
	if screenelementexists id = <player_cont>
		createscreenelement {
			parent = <player_cont>
			id = <extra_info_id>
			type = descinterface
			desc = 'jam_band_extra_info'
			pos = (-109.0, -5.0)
			z_priority = 0
			alpha = 0
			title_text = <title_text>
			info1_text = <info1_text>
			info2_text = <info2_text>
			info3_text = <info3_text>
			info4_text = <info4_text>
		}
		if <extra_info_id> :desc_resolvealias name = alias_helper
			<resolved_id> :se_setprops helper_description_text = <helper_text>
		endif
		<extra_info_id> :se_setprops alpha = 1 time = 0.2
		<extra_info_id> :se_waitprops
	endif
endscript

script jam_remove_extra_info 
	formattext checksumname = extra_info_id 'jam_band_extra_info_%s' s = <player>
	if screenelementexists id = <extra_info_id>
		<extra_info_id> :se_setprops alpha = 0 time = 0.5
		<extra_info_id> :se_waitprops
		destroyscreenelement id = <extra_info_id>
	endif
endscript

script jam_band_pause_mixer 
	launchevent type = unfocus target = <vmenu_id>
	if ($jam_advanced_record = 0)
		destroy_jam_band_menu
		from_adv = 0
	else
		destroy_jam_recording_menu
		from_adv = 1
		ghmix_persistant_settings = {}
		addparam structure_name = ghmix_persistant_settings name = cur_playtime value = ($jam_highway_play_time)
		addparam structure_name = ghmix_persistant_settings name = cur_playline_pos value = ($jam_highway_play_line_pos)
		addparam structure_name = ghmix_persistant_settings name = cur_lead_octave value = ($jam_lead_octave_range)
		addparam structure_name = ghmix_persistant_settings name = cur_melody_octave value = ($jam_melody_octave_range)
		addparam structure_name = ghmix_persistant_settings name = cur_rhythm_chords value = ($jam_rhythm_chord_type)
		addparam structure_name = ghmix_persistant_settings name = cur_instrument value = ($jam_current_track)
		addparam structure_name = ghmix_persistant_settings name = cur_loop_low value = ($jam_loop_bound_low)
		addparam structure_name = ghmix_persistant_settings name = cur_loop_high value = ($jam_loop_bound_high)
		addparam structure_name = ghmix_persistant_settings name = cur_control value = ($jam_control_selected)
		addparam structure_name = ghmix_persistant_settings name = cur_quantize value = ($jam_current_quantize)
	endif
	clean_up_user_control_helpers
	ui_event event = menu_change data = {state = uistate_jam_mixer from_adv = <from_adv> ghmix_persistant_settings = <ghmix_persistant_settings>}
endscript
