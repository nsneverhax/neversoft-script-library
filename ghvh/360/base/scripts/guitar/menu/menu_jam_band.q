jam_cont_start_pos = (330.0, 52.0)
jam_cont_offset = 205

script create_jam_band_menu \{editing = 0
		tutorial = 0
		song = None}
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
	Change \{jam_num_falling_gems = 0}
	Change \{debug_show_analog_options = 0}
	Change \{select_shift = 0}
	destroy_bg_viewport
	setup_bg_viewport
	if (<editing> = 0)
		Change \{jam_lead_octave_range = 1}
		Change \{jam_melody_octave_range = 1}
	endif
	menu_music_off
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = jam_band_container
		Pos = (0.0, 800.0)}
	jam_band_container :SetTags \{allow_easy_backout = 1}
	jam_band_container :obj_spawnscript \{jam_recording_check_disconnect
		params = {
			recording_studio
		}}
	Change \{target_jam_camera_prop = jam_band}
	jam_camera_wait
	CreateScreenElement \{Type = SpriteElement
		parent = jam_band_container
		id = jam_menu_backdrop
		texture = jam_screen
		Pos = (640.0, 360.0)
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
	CreateScreenElement \{Type = SpriteElement
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
		Pos = (640.0, 580.0)
		dims = (1280.0, 75.0)
		z_priority = 38}
	if (<tutorial> = 0)
		if (<editing> = 1)
			jam_get_display_name FileName = ($jam_selected_song)
			formatText TextName = song_name_text qs(0x8b1f3160) a = <display_name>
		else
			formatText \{TextName = song_name_text
				qs(0xd9070aee)}
			Change jam_selected_song = <song_name_text>
		endif
		CreateScreenElement {
			Type = TextBlockElement
			id = jam_song_name_text
			parent = jam_band_container
			font = text_a1
			just = [right bottom]
			dims = (280.0, 36.0)
			internal_just = [right center]
			z_priority = 90
			rgba = [180 180 180 255]
			Pos = (1050.0, 634.0)
			text = <song_name_text>
			Shadow
			shadow_offs = (5.0, 5.0)
			shadow_rgba = [0 0 0 255]
			fit_height = `scale	down	if	larger`
			fit_width = `scale	each	line	if	larger`
		}
	endif
	RunScriptOnScreenElement \{id = jam_band_container
		legacydomorph
		params = {
			Pos = (0.0, 0.0)
			time = 0.2
		}}
	clean_up_user_control_helpers
	if (<tutorial> = 1)
		add_user_control_helper \{text = qs(0x784c64ff)
			button = start
			z = 100}
	else
		menu_jam_band_default_control_helpers
		SpawnScriptNow \{jam_poll_for_controller_changes
			id = jam_band_spawns
			params = {
			}}
	endif
endscript

script menu_jam_band_default_control_helpers 
	clean_up_user_control_helpers
	menu_jam_band_add_control_helpers
endscript

script menu_jam_band_add_control_helpers \{state = NULL}
	clean_up_user_control_helpers
	if ($game_mode = training)
		if ScreenElementExists \{id = jam_band_container}
			<skip_button> = start
		elseif ScreenElementExists \{id = jam_studio_element}
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
		if ScreenElementExists \{id = jam_studio_element}
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
		elseif ScreenElementExists \{id = jam_band_container}
			if NOT ($game_mode = training)
				add_user_control_helper \{text = qs(0x48a351fa)
					button = start
					z = 100}
			endif
		endif
	endswitch
endscript

script jam_controller_can_use_mic 
	RequireParams \{[
			controller
		]
		all}
	if is_regular_controller controller = <controller>
		if NOT ($allow_controller_for_all_instruments = 1)
			if has_usb_mic_plugged_in
			elseif controller_has_headset controller = <controller>
			else
				return \{FALSE}
			endif
		endif
	endif
	return \{true}
endscript

script jam_poll_for_controller_changes 
	active_controllers = [0 0 0 0]
	prev_active_controllers = [0 0 0 0]
	prev_active_mic = [0 0 0 0]
	prev_controller_types = [None None None None]
	begin
	active_controllers = [0 0 0 0]
	GetActiveControllers
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
					jam_destroy_player Player = <player_num>
					jam_create_player_container Player = <player_num>
				endif
			endif
			SetArrayElement ArrayName = prev_active_mic index = <count> NewValue = 0
		else
			SetArrayElement ArrayName = prev_active_mic index = <count> NewValue = 1
		endif
	endif
	<prev_controller_type> = (<prev_controller_types> [<count>])
	<curr_controller_type> = standard
	if (<is_active_controller> = 0)
		<curr_controller_type> = None
	elseif IsGuitarController controller = <count>
		<curr_controller_type> = guitar
	elseif isdrumcontroller controller = <count>
		if isrbdrum controller = <count>
			<curr_controller_type> = drum_rb
		else
			<curr_controller_type> = drum_gh
		endif
	endif
	SetArrayElement ArrayName = prev_controller_types index = <count> NewValue = <curr_controller_type>
	if (<is_active_controller> = 1)
		if NOT (<prev_controller_type> = <curr_controller_type>)
			<is_active_controller> = 0
		endif
	endif
	if NOT (<is_active_controller> = (<prev_active_controllers> [<count>]))
		if (<is_active_controller> = 1)
			SetArrayElement ArrayName = prev_active_controllers index = <count> NewValue = 1
			SetArrayElement ArrayName = prev_controller_types index = <count> NewValue = <curr_controller_type>
			setplayerinfo <player_num> controller = <count>
			if isdrumcontroller controller = <count>
				setplayerinfo <player_num> part = drum
			endif
			if IsGuitarController controller = <count>
				setplayerinfo <player_num> part = guitar
			endif
			jam_create_player_container Player = <player_num>
		elseif (<is_active_controller> = 0)
			SetArrayElement ArrayName = prev_active_controllers index = <count> NewValue = 0
			SetArrayElement ArrayName = prev_controller_types index = <count> NewValue = None
			getplayerinfo <player_num> jam_instrument
			if (<jam_instrument> = 4)
				jam_input_melody_stop_sound
			endif
			jam_destroy_player Player = <player_num>
			setplayerinfo <player_num> jam_instrument = -1
			guitar_jam_simplerecops_command_stopplay
		endif
	endif
	<count> = (<count> + 1)
	repeat ($num_jam_players)
	Wait \{1
		gameframes}
	repeat
endscript

script jam_create_player_container 
	formatText checksumName = player_cont 'inst_player_cont_%s' s = <Player>
	shutdownjammic
	CreateScreenElement {
		Type = ContainerElement
		parent = jam_band_container
		id = <player_cont>
		Pos = ($jam_cont_start_pos + (1.0, 0.0) * ($jam_cont_offset * (<Player> - 1)))
	}
	if GotParam \{Player}
		switch <Player>
			case 1
			PlaySound \{jam_pause_panel_in
				vol = -16
				pitch = -0.5
				buss = Front_End
				pan1x = -0.15
				pan1y = 1
				pan2x = -0.15
				pan2y = 1}
			case 2
			PlaySound \{jam_pause_panel_in
				vol = -16
				pitch = 0
				buss = Front_End
				pan1x = -0.05
				pan1y = 1
				pan2x = -0.05
				pan2y = 1}
			case 3
			PlaySound \{jam_pause_panel_in
				vol = -16
				pitch = 0.5
				buss = Front_End
				pan1x = 0.05
				pan1y = 1
				pan2x = 0.05
				pan2y = 1}
			case 4
			PlaySound \{jam_pause_panel_in
				vol = -16
				pitch = 1
				buss = Front_End
				pan1x = 0.15
				pan1y = 1
				pan2x = 0.15
				pan2y = 1}
		endswitch
	endif
	SpawnScriptNow id = jam_band_spawns jam_create_select_instrument_menu params = {Player = <Player> player_cont = <player_cont> morph = 1}
endscript
jam_band_recording = 0
jam_band_pixels_per_second = (0.0, 0.0)
jam_band_playline_pos = (0.0, 0.0)
jam_band_song_length = 0
jam_band_new_song = 0

script jam_setup_song \{advanced_record = 0
		tutorial = 0}
	Change \{jam_current_quantize = 9}
	Change \{jam_highway_recording_mode = 1}
	reset_song_time \{starttime = 0}
	Change \{jam_highway_play_time = 0}
	Change \{jam_highway_playing = 0}
	Change \{jam_band_recording = 0}
	Change \{jam_current_drum_loop = 0}
	Change \{is_drum_machine = 0}
	Change \{is_percussion_kit = 0}
	Change \{is_arpeggiator = [
			0
			0
			0
			0
			0
			0
		]}
	Change \{jam_arpeggiator_current_pattern = [
			0
			0
			0
			0
			0
		]}
	Change \{jam_current_arpeggiator = [
			0
			0
			0
			0
			0
		]}
	Change \{jam_current_arpeggiator_modifier = [
			0
			0
			0
			0
			0
		]}
	Change \{jam_current_arpeggiator_type = [
			2
			2
			2
			2
			2
		]}
	Change \{jam_current_arpeggiator_note_count = [
			0
			0
			0
			0
			0
		]}
	Change \{jam_current_arpeggiator_whammy = [
			0
			0
			0
			0
			0
		]}
	Change \{jam_player_recording_armed = [
			0
			0
			0
			0
		]}
	Change \{jam_player_recording_begin_time = [
			0
			0
			0
			0
		]}
	Change \{jam_rhythm_chord_type = 0}
	Change \{jam_lead_octave_range = 1}
	Change \{jam_melody_octave_range = 1}
	song = editable
	if (<editing> = 1)
		guitar_jam_effects_toggle_active \{jam_instrument = 0
			force_state = On}
		guitar_jam_effects_toggle_active \{jam_instrument = 1
			force_state = On}
		guitar_jam_effects_toggle_active \{jam_instrument = 2
			force_state = On}
		guitar_jam_effects_toggle_active \{jam_instrument = 4
			force_state = On}
		GetArraySize \{$jam_tracks}
		index = 0
		begin
		settrackinfo track = ($jam_tracks [<index>].id) bpm = ($jam_current_bpm)
		<index> = (<index> + 1)
		repeat <array_Size>
		jam_init_volumes
		jam_init_pan
		jam_get_display_name FileName = ($jam_selected_song)
		formatText TextName = title_text qs(0xb2b7d449) s = <display_name> b = $jam_current_bpm
	else
		if ((<advanced_record> = 1) || (<tutorial> = 1))
			jam_setup_new_song
			Change \{jam_current_bpm = 120}
			settrackinfo track = rhythm bpm = ($jam_current_bpm)
		endif
	endif
	if GotParam \{title_text}
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
	AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
	song_fretbars = <appended_id>
	suffix = '_timesig'
	AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
	song_timesig = <appended_id>
	GetArraySize $<song_fretbars>
	suffix = '_size'
	AppendSuffixToChecksum Base = <song_fretbars> SuffixString = <suffix>
	<fretbar_array_size> = <appended_id>
	CreateScreenElement {
		Type = ContainerElement
		parent = jam_band_container
		id = jam_band_highway_master
		just = [center center]
		Pos = <jam_band_highway_pos>
		Scale = 1
		rot_angle = 0
	}
	CreateScreenElement \{Type = ContainerElement
		parent = jam_band_highway_master
		id = jam_band_highway
		Pos = (0.0, 0.0)
		Scale = 1}
	song_length = ($<song_fretbars> [(($<fretbar_array_size>) - 1)])
	song_length_seconds = (<song_length> / 1000.0)
	fit_in_width = 820.0
	pixels_per_second = ((<fit_in_width> / <song_length_seconds>) * (1.0, 0.0))
	Change jam_band_pixels_per_second = <pixels_per_second>
	Change \{jam_band_playline_pos = (0.0, 0.0)}
	Change jam_band_song_length = <song_length>
	bar_size = ((<song_length> / 1000.0) * <pixels_per_second>)
	CreateScreenElement {
		Type = SpriteElement
		parent = jam_band_highway
		texture = white
		just = [left center]
		rgba = [0 0 0 255]
		Pos = (0.0, 0.0)
		dims = (((0.0, 1.0) * <jam_band_highway_height>) + <bar_size>)
		z_priority = <highway_priority>
	}
	CreateScreenElement \{Type = ContainerElement
		parent = jam_band_highway
		id = jam_band_highway_playline
		Pos = (0.0, 0.0)
		Scale = 1}
	CreateScreenElement {
		Type = SpriteElement
		parent = jam_band_highway_playline
		texture = jam_marker
		just = [left center]
		rgba = [200 200 200 255]
		Pos = (-5.0, 0.0)
		z_priority = (<highway_priority> + 3)
	}
	if ScreenElementExists \{id = jam_band_highway_bars_container}
		DestroyScreenElement \{id = jam_band_highway_bars_container}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = jam_band_highway
		id = jam_band_highway_bars_container
		Pos = (0.0, 0.0)}
	count = 0
	begin
	curr_time = ($<song_fretbars> [<count>])
	Mod a = <count> b = 10
	if (<Mod> = 0)
		bar_pos = ((<curr_time> / 1000.0) * <pixels_per_second>)
		CreateScreenElement {
			Type = SpriteElement
			parent = jam_band_highway_bars_container
			texture = white
			just = [center center]
			rgba = [40 40 40 255]
			Pos = <bar_pos>
			dims = ((1.0, 0.0) + ((0.0, 1.0) * <jam_band_highway_height>))
			z_priority = (<highway_priority> + 1)
		}
	endif
	<count> = (<count> + 1)
	if (<count> > (($<fretbar_array_size>) - 1))
		break
	endif
	repeat
	SpawnScriptNow jam_band_update_highway id = jam_band_spawns params = {<...>}
endscript

script jam_band_update_highway 
	begin
	SpawnScriptNow jam_band_update_highway_detailed params = {<...>}
	begin
	if ($jam_band_recording = 1)
		<begin_pos> = ($jam_band_playline_pos + ((($jam_highway_play_time) / 1000.0) * $jam_band_pixels_per_second))
		<begin_time> = ($jam_highway_play_time)
		begin
		SpawnScriptNow jam_band_update_highway_simple params = {<...>}
		if ($jam_band_recording = 0)
			break
		endif
		Wait \{1
			gameframe}
		repeat
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Wait \{1
		gameframe}
	repeat
endscript

script jam_band_update_highway_detailed 
	highway_priority = 50
	block_seperation = 1000
	GetArraySize \{$jam_tracks}
	index = 0
	track_offset = 10
	begin
	getjamsessionsize track = ($jam_tracks [<index>].id)
	bar_pos = ((0.0, 1.0) * (<track_offset> * (<index> + 1)))
	bar_pos = (<bar_pos> - ((0.0, 1.0) * 30))
	formatText checksumName = track_id_simple 'track_id_simple_%s' s = <index>
	if ScreenElementExists id = <track_id_simple>
		DestroyScreenElement id = <track_id_simple>
	endif
	formatText checksumName = track_id 'track_id_%s' s = <index>
	if ScreenElementExists id = <track_id>
		DestroyScreenElement id = <track_id>
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = jam_band_highway
		just = [left center]
		id = <track_id>
		Pos = <bar_pos>
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
	getnotetrackitem Name = <gem_array> index = (<block_index> * 2)
	if (<start_block_time> < 0)
		<start_block_time> = <time>
		<end_block_time> = (<time> + <gem_length>)
	endif
	if (((<time> + <gem_length>) - <end_block_time>) >= <block_seperation>)
		block_start = ((<start_block_time> / 1000.0) * <pixels_per_second>)
		block_end = (((<end_block_time> - <start_block_time>) / 1000.0) * <pixels_per_second>)
		printf 'drawing a block from %a to %b, i=%c' a = <block_start> b = <block_end> c = <block_index>
		CreateScreenElement {
			Type = SpriteElement
			parent = <track_id>
			texture = white
			just = [left center]
			rgba = ($jam_tracks [<index>].Color)
			Pos = <block_start>
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
		CreateScreenElement {
			Type = SpriteElement
			parent = <track_id>
			texture = white
			just = [left center]
			rgba = ($jam_tracks [<index>].Color)
			Pos = <block_start>
			dims = ((0.0, 5.0) + <block_end>)
			z_priority = (<highway_priority> + 5)
		}
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
endscript

script jam_band_update_highway_simple 
	highway_priority = 50
	GetArraySize \{$jam_tracks}
	index = 0
	track_offset = 10
	begin
	<show_bar> = 1
	player_has_inst = 0
	Player = 1
	begin
	getplayerinfo <Player> jam_instrument
	if (<jam_instrument> = <index>)
		<player_has_inst> = <Player>
		break
	endif
	<Player> = (<Player> + 1)
	repeat 4
	if (<player_has_inst> > 0)
		if ($jam_player_recording_armed [(<player_has_inst> - 1)] = 1)
			begin_pos = ($jam_band_playline_pos + (($jam_player_recording_begin_time [(<player_has_inst> - 1)] / 1000.0) * $jam_band_pixels_per_second))
			bar_pos = <begin_pos>
			bar_pos = (<bar_pos> + ((0.0, 1.0) * (<track_offset> * (<index> + 1))))
			bar_pos = (<bar_pos> - ((0.0, 1.0) * 30))
			track_size = ((($jam_highway_play_time / 1000) * <pixels_per_second>) - (($jam_player_recording_begin_time [(<player_has_inst> - 1)] / 1000) * <pixels_per_second>))
			if (<show_bar> = 1)
				formatText checksumName = track_id 'track_id_simple_%s' s = <index>
				if ScreenElementExists id = <track_id>
					DestroyScreenElement id = <track_id>
				endif
				<Color> = [255 255 255 255]
				CreateScreenElement {
					Type = SpriteElement
					id = <track_id>
					parent = jam_band_highway
					texture = white
					just = [left center]
					rgba = <Color>
					Pos = <bar_pos>
					dims = ((0.0, 5.0) + <track_size>)
					z_priority = (<highway_priority> + 6)
				}
			endif
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
endscript

script jam_create_select_instrument_menu \{Player = 0}
	getplayerinfo <Player> controller
	setplayerinfo <Player> jam_instrument = -1
	if ($game_mode = training)
		jam_band_container :GetTags
		if (<disable_inst_select> = 1)
			<controller> = 5
		endif
	endif
	band_leader_alpha = 0
	if (<controller> = $primary_controller)
		<band_leader_alpha> = 1
	endif
	formatText checksumName = inst_select_element 'inst_select_element_%a' a = <Player>
	formatText TextName = player_text qs(0x7bc47761) a = <Player>
	CreateScreenElement {
		parent = <player_cont>
		id = <inst_select_element>
		Type = descinterface
		desc = 'jam_player'
		Pos = (-84.0, -400.0)
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
		if NOT IsGuitarController controller = <controller>
			if NOT ($allow_controller_for_all_instruments = 1)
				<show_mic> = 1
				<is_gamepad> = 1
			else
				<show_mic> = 2
			endif
		endif
	endif
	if (<controller> = ($primary_controller))
		ResolveScreenElementID id = {<inst_select_element> child = {scroll_menu child = menu}}
		<resolved_id> :se_setprops event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_start jam_band_pause params = {select_player = <Player> player_cont = <player_cont> event_cont = <resolved_id> hide_ghmix = <show_mic> paused_at_inst}}
			{pad_back jam_easy_backout params = {select_player = <Player>}}
		]
	else
		ResolveScreenElementID id = {<inst_select_element> child = {scroll_menu child = menu}}
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
	GetArraySize \{$jam_tracks}
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
			jam_band_container :GetTags
			if (<disable_inst_select> = 0)
				<inst_select_func> = jam_player_select_instrument
			endif
		endif
		formatText checksumName = inst_select_text 'jam_%a_select_text_%b' a = <count> b = <Player>
		CreateScreenElement {
			Type = TextBlockElement
			parent = <resolved_id>
			id = <inst_select_text>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [center center]
			Scale = 1
			rgba = <pause_font_color>
			dims = (160.0, 35.0)
			text = ($jam_tracks [<count>].name_text)
			z_priority = 35
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = proportional
			text_case = Original
			exclusive_device = <controller>
			event_handlers = [
				{focus jam_pause_focus params = {id = <inst_select_text>}}
				{unfocus retail_menu_unfocus}
				{pad_choose <inst_select_func> params = {Player = <Player> player_cont = <player_cont> select_instrument = <count>}}
			]
		}
	endif
	<count> = (<count> + 1)
	repeat <array_Size>
	if (<show_mic> > 0)
		formatText checksumName = inst_select_text 'jam_%a_select_text_%b' a = 5 b = <Player>
		CreateScreenElement {
			Type = TextBlockElement
			parent = <resolved_id>
			id = <inst_select_text>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [center center]
			Scale = 1
			rgba = <pause_font_color>
			dims = (160.0, 35.0)
			text = qs(0xc0b34c9f)
			z_priority = 35
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = proportional
			text_case = Original
			exclusive_device = <controller>
			event_handlers = [
				{focus jam_pause_focus params = {id = <inst_select_text>}}
				{unfocus retail_menu_unfocus}
				{pad_choose jam_player_select_instrument params = {Player = <Player> select_instrument = ($jam_mic_id)}}
			]
		}
	endif
	RunScriptOnScreenElement id = <inst_select_element> jam_select_instrument_update params = {parent_player = <Player> is_drumkit = <is_drums> is_gamepad = <is_gamepad>}
	if ScreenElementExists id = <inst_select_element>
		if (<morph> = 1)
			<inst_select_element> :se_setprops rot_angle = -0.5 Pos = (-84.0, 75.0) time = 0.1
			<inst_select_element> :se_waitprops
			if ScreenElementExists id = <inst_select_element>
				<inst_select_element> :se_setprops rot_angle = 0.3 Pos = (-84.0, 67.0) time = 0.05
				<inst_select_element> :se_waitprops
			endif
			if ScreenElementExists id = <inst_select_element>
				<inst_select_element> :se_setprops rot_angle = 0.0 Pos = (-84.0, 70.0) time = 0.05
				<inst_select_element> :se_waitprops
			endif
		else
			<inst_select_element> :se_setprops rot_angle = 0.0 Pos = (-84.0, 70.0)
		endif
	endif
	if ScreenElementExists id = <resolved_id>
		AssignAlias id = <resolved_id> alias = current_menu
		LaunchEvent \{target = current_menu
			Type = focus}
	endif
endscript
is_drum_machine = 0

script jam_create_drum_type_select_menu 
	i = 1
	begin
	getplayerinfo <i> jam_instrument
	if (<jam_instrument> = 3)
		Wait \{10
			gameframes}
		return
	endif
	<i> = (<i> + 1)
	repeat 4
	ui_menu_select_sfx
	jam_destroy_select_instrument_menu Player = <Player>
	getplayerinfo <Player> controller
	setplayerinfo <Player> jam_instrument = 3
	if ($game_mode = training)
		<controller> = 5
	endif
	band_leader_alpha = 0
	if (<controller> = $primary_controller)
		<band_leader_alpha> = 1
	endif
	formatText checksumName = drum_select_element 'drum_select_element_%a' a = <Player>
	formatText TextName = player_text qs(0x7bc47761) a = <Player>
	CreateScreenElement {
		parent = <player_cont>
		id = <drum_select_element>
		Type = descinterface
		desc = 'jam_player'
		Pos = (-84.0, 70.0)
		exclusive_device = <controller>
		player_text = <player_text>
		band_leader_alpha = <band_leader_alpha>
	}
	ResolveScreenElementID id = {<drum_select_element> child = {scroll_menu child = menu}}
	if (<controller> = ($primary_controller))
		<resolved_id> :se_setprops event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_start jam_band_pause params = {select_player = <Player> player_cont = <player_cont> event_cont = <resolved_id> paused_at_inst}}
			{pad_back ui_menu_select_sfx}
			{pad_back jam_remove_sub_type_select_menu params = {Player = <Player> player_cont = <player_cont>}}
		]
	else
		<resolved_id> :se_setprops event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back ui_menu_select_sfx}
			{pad_back jam_remove_sub_type_select_menu params = {Player = <Player> player_cont = <player_cont>}}
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
	formatText checksumName = drum_select_text_id 'jam_%a_drum_select_text_%b' a = 0 b = <Player>
	CreateScreenElement {
		Type = TextBlockElement
		parent = <resolved_id>
		id = <drum_select_text_id>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		Scale = 1
		rgba = <pause_font_color>
		dims = (150.0, 35.0)
		text = qs(0x388cd3db)
		z_priority = 35
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <drum_select_text_id>}}
			{unfocus retail_menu_unfocus}
			{pad_choose jam_player_select_instrument params = {Player = <Player> select_instrument = <select_instrument> is_drum_machine = 0 from_sub}}
		]
	}
	formatText checksumName = drum_select_text_id 'jam_%a_drum_select_text_%b' a = 1 b = <Player>
	CreateScreenElement {
		Type = TextBlockElement
		parent = <resolved_id>
		id = <drum_select_text_id>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		Scale = 1
		rgba = <pause_font_color>
		dims = (150.0, 35.0)
		text = qs(0xf24238cd)
		z_priority = 35
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <drum_select_text_id>}}
			{unfocus retail_menu_unfocus}
			{pad_choose jam_player_select_instrument params = {Player = <Player> select_instrument = <select_instrument> is_drum_machine = 1 from_sub}}
		]
	}
	if ScreenElementExists id = <drum_select_element>
		RunScriptOnScreenElement id = <drum_select_element> legacydomorph params = {Pos = (-84.0, 70.0) time = 0.1}
	endif
	if NOT canassignalias id = <resolved_id>
		return
	endif
	AssignAlias id = <resolved_id> alias = current_menu
	LaunchEvent \{target = current_menu
		Type = focus}
	if ($game_mode = training)
		jam_band_container :GetTags
		if (<disable_inst_select> = 0)
			jam_player_select_instrument Player = <Player> select_instrument = <select_instrument> is_drum_machine = 0 from_sub
		endif
	endif
endscript

script jam_remove_sub_type_select_menu 
	jam_destroy_select_instrument_menu Player = <Player>
	jam_destroy_select_drum_type_menu Player = <Player>
	jam_destroy_select_guitar_type_menu Player = <Player>
	SpawnScriptNow id = jam_band_spawns jam_create_select_instrument_menu params = {Player = <Player> player_cont = <player_cont> morph = 0}
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
		Wait \{10
			gameframes}
		return
	endif
	<i> = (<i> + 1)
	repeat 4
	ui_menu_select_sfx
	jam_destroy_select_instrument_menu Player = <Player>
	getplayerinfo <Player> controller
	setplayerinfo <Player> jam_instrument = <select_instrument>
	if ($game_mode = training)
		<controller> = 5
	endif
	band_leader_alpha = 0
	if (<controller> = $primary_controller)
		<band_leader_alpha> = 1
	endif
	formatText checksumName = guitar_select_element 'guitar_select_element_%a' a = <Player>
	formatText TextName = player_text qs(0x7bc47761) a = <Player>
	CreateScreenElement {
		parent = <player_cont>
		id = <guitar_select_element>
		Type = descinterface
		desc = 'jam_player'
		Pos = (-84.0, 70.0)
		exclusive_device = <controller>
		player_text = <player_text>
		band_leader_alpha = <band_leader_alpha>
	}
	ResolveScreenElementID id = {<guitar_select_element> child = {scroll_menu child = menu}}
	if (<controller> = ($primary_controller))
		<resolved_id> :se_setprops event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_start jam_band_pause params = {select_player = <Player> player_cont = <player_cont> event_cont = <resolved_id> paused_at_inst}}
			{pad_back ui_menu_select_sfx}
			{pad_back jam_remove_sub_type_select_menu params = {Player = <Player> player_cont = <player_cont>}}
		]
	else
		<resolved_id> :se_setprops event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back ui_menu_select_sfx}
			{pad_back jam_remove_sub_type_select_menu params = {Player = <Player> player_cont = <player_cont>}}
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
	formatText checksumName = guitar_select_text_id 'jam_%a_guitar_select_text_%b' a = 0 b = <Player>
	CreateScreenElement {
		Type = TextBlockElement
		parent = <resolved_id>
		id = <guitar_select_text_id>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		Scale = 1
		rgba = <pause_font_color>
		dims = (150.0, 35.0)
		text = <type_text>
		z_priority = 35
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <guitar_select_text_id>}}
			{unfocus retail_menu_unfocus}
			{pad_choose jam_player_select_instrument params = {Player = <Player> select_instrument = <select_instrument> is_arpeggiator = 0 from_sub}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (140.0, 40.0)
	formatText checksumName = guitar_select_text_id 'jam_%a_guitar_select_text_%b' a = 1 b = <Player>
	CreateScreenElement {
		Type = TextBlockElement
		parent = <resolved_id>
		id = <guitar_select_text_id>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		Scale = 1
		rgba = <pause_font_color>
		dims = (170.0, 35.0)
		text = <machine_text>
		z_priority = 35
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = Original
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <guitar_select_text_id>}}
			{unfocus retail_menu_unfocus}
			{pad_choose jam_player_select_instrument params = {Player = <Player> select_instrument = <select_instrument> is_arpeggiator = 1 from_sub}}
		]
	}
	fit_text_in_rectangle id = <id> dims = (140.0, 35.0)
	if ScreenElementExists id = <guitar_select_element>
		RunScriptOnScreenElement id = <guitar_select_element> legacydomorph params = {Pos = (-84.0, 70.0) time = 0.1}
	endif
	AssignAlias id = <resolved_id> alias = current_menu
	LaunchEvent \{target = current_menu
		Type = focus}
	if ($game_mode = training)
		jam_band_container :GetTags
		if (<disable_inst_select> = 0)
			jam_player_select_instrument Player = <Player> select_instrument = <select_instrument> is_drum_machine = 0 from_sub
		endif
	endif
endscript

script jam_select_instrument_update 
	<player_instruments> = [-1 -1 -1 -1]
	begin
	<Player> = 1
	begin
	getplayerinfo <Player> jam_instrument
	if (<Player> = <parent_player>)
		if (<jam_instrument> >= 0)
			return
		endif
	endif
	<last_inst> = (<player_instruments> [(<Player> -1)])
	if NOT (<jam_instrument> = <last_inst>)
		SetArrayElement ArrayName = player_instruments index = (<Player> -1) NewValue = <jam_instrument>
		if (<jam_instrument> >= 0)
			formatText checksumName = inst_select_text 'jam_%a_select_text_%b' a = <jam_instrument> b = <parent_player>
			if ScreenElementExists id = <inst_select_text>
				<inst_select_text> :se_setprops not_focusable
				formatText checksumName = inst_select_element 'inst_select_element_%a' a = <parent_player>
				ResolveScreenElementID id = {<inst_select_element> child = {scroll_menu child = menu}}
				<resolved_id> :GetTags
				if GotParam \{tag_selected_index}
					if ((<tag_selected_index> = <jam_instrument>) || (<is_drumkit> = 1) || (<is_gamepad> = 1))
						LaunchEvent Type = unfocus target = <resolved_id>
						<resolved_id> :SetProps not_focusable
						LaunchEvent Type = focus target = <resolved_id> data = {child_id = <inst_select_text>}
					endif
				endif
				<inst_select_text> :se_setprops rgba = [30 30 30 255]
			endif
		else
			formatText checksumName = inst_select_text 'jam_%a_select_text_%b' a = <last_inst> b = <parent_player>
			if ScreenElementExists id = <inst_select_text>
				<inst_select_text> :se_setprops focusable
				<inst_select_text> :se_setprops rgba = ($menu_unfocus_color)
				formatText checksumName = inst_select_element 'inst_select_element_%a' a = <parent_player>
				ResolveScreenElementID id = {<inst_select_element> child = {scroll_menu child = menu}}
				<resolved_id> :GetTags
				if (<is_drumkit> = 1)
					formatText checksumName = drum_select_text 'jam_3_select_text_%b' b = <parent_player>
					if ScreenElementExists id = <drum_select_text>
						LaunchEvent Type = focus target = <drum_select_text>
					endif
				elseif (<is_gamepad> = 1)
					formatText checksumName = mic_select_text 'jam_5_select_text_%b' b = <parent_player>
					if ScreenElementExists id = <mic_select_text>
						LaunchEvent Type = focus target = <mic_select_text>
					endif
				endif
			endif
		endif
	endif
	<Player> = (<Player> + 1)
	repeat 4
	Wait \{1
		gameframes}
	repeat
endscript

script jam_player_select_instrument \{Player = 0
		select_instrument = 0
		is_drum_machine = 0
		is_arpeggiator = 0}
	getplayerinfo <Player> controller
	if (<select_instrument> = 5)
		if NOT jam_controller_can_use_mic controller = <controller>
			jam_band_controller_warning_box Player = <Player>
			return
		endif
	endif
	if NOT GotParam \{from_sub}
		i = 1
		begin
		getplayerinfo <i> jam_instrument
		if (<jam_instrument> = <select_instrument>)
			Wait \{10
				gameframes}
			return
		endif
		<i> = (<i> + 1)
		repeat 4
	endif
	ui_menu_select_sfx
	setplayerinfo <Player> jam_instrument = <select_instrument>
	switch <select_instrument>
		case 0
		formatText checksumName = inst_select_element 'inst_select_element_%a' a = <Player>
		case 1
		case 2
		case 4
		SetArrayElement ArrayName = is_arpeggiator globalarray index = <select_instrument> NewValue = <is_arpeggiator>
		formatText checksumName = inst_select_element 'guitar_select_element_%a' a = <Player>
		case 3
		Change is_drum_machine = <is_drum_machine>
		formatText checksumName = inst_select_element 'drum_select_element_%a' a = <Player>
	endswitch
	if ScreenElementExists id = <inst_select_element>
		LaunchEvent target = <inst_select_element> Type = unfocus
	endif
	if ScreenElementExists id = <inst_select_element>
		RunScriptOnScreenElement id = <inst_select_element> legacydomorph params = {Pos = (-84.0, -400.0) time = 0.1}
	endif
	jam_destroy_select_instrument_menu Player = <Player>
	jam_destroy_select_drum_type_menu Player = <Player>
	jam_destroy_select_guitar_type_menu Player = <Player>
	formatText checksumName = player_cont 'inst_player_cont_%s' s = <Player>
	jam_create_instrument select_player = <Player> player_cont = <player_cont>
	jam_create_player_info Player = <Player> player_cont = <player_cont>
	if ScreenElementExists \{id = jam_band_container}
		jam_band_container :SetTags \{allow_easy_backout = 0}
	endif
	menu_jam_band_add_control_helpers state = instrument_ui instrument = <select_instrument>
	if ($game_mode = training)
		broadcastevent Type = jam_tutorial_instrument_selected data = {select_instrument = <select_instrument>}
	endif
endscript

script jam_destroy_select_instrument_menu 
	formatText checksumName = inst_select_element 'inst_select_element_%a' a = <Player>
	if GotParam \{Player}
		switch <Player>
			case 1
			PlaySound \{jam_pause_panel_out
				vol = -16
				pitch = -0.5
				buss = Front_End
				pan1x = -0.15
				pan1y = 1
				pan2x = -0.15
				pan2y = 1}
			case 2
			PlaySound \{jam_pause_panel_out
				vol = -16
				pitch = 0
				buss = Front_End
				pan1x = -0.05
				pan1y = 1
				pan2x = -0.05
				pan2y = 1}
			case 3
			PlaySound \{jam_pause_panel_out
				vol = -16
				pitch = 0.5
				buss = Front_End
				pan1x = 0.05
				pan1y = 1
				pan2x = 0.05
				pan2y = 1}
			case 4
			PlaySound \{jam_pause_panel_out
				vol = -16
				pitch = 1
				buss = Front_End
				pan1x = 0.15
				pan1y = 1
				pan2x = 0.15
				pan2y = 1}
		endswitch
	endif
	if ScreenElementExists id = <inst_select_element>
		DestroyScreenElement id = <inst_select_element>
	endif
endscript

script jam_destroy_select_drum_type_menu 
	formatText checksumName = drum_select_element 'drum_select_element_%a' a = <Player>
	if ScreenElementExists id = <drum_select_element>
		DestroyScreenElement id = <drum_select_element>
	endif
endscript

script jam_destroy_select_guitar_type_menu 
	formatText checksumName = guitar_select_element 'guitar_select_element_%a' a = <Player>
	if ScreenElementExists id = <guitar_select_element>
		DestroyScreenElement id = <guitar_select_element>
	endif
endscript

script jam_easy_backout 
	jam_band_container :GetTags
	if (<allow_easy_backout> = 1)
		SoundEvent \{event = Generic_Menu_Back_SFX}
		jam_band_quit_dialog select_player = <select_player>
	endif
endscript

script jam_create_player_info 
	getplayerinfo <Player> jam_instrument
	getplayerinfo <Player> controller
	if (<jam_instrument> = 3)
		percussion_alpha = 1
	else
		percussion_alpha = 0
	endif
	band_leader_alpha = 0
	if (<controller> = ($primary_controller))
		<band_leader_alpha> = 1
	endif
	formatText checksumName = player_info_element 'player_info_element_%a' a = <Player>
	CreateScreenElement {
		parent = <player_cont>
		id = <player_info_element>
		Type = descinterface
		desc = 'jam_band_instrument_name'
		z_priority = 30
		Pos = (3.0, 500.0)
		percussion_alpha = <percussion_alpha>
		percussion_text = qs(0x26239ec0)
		glow_alpha = 0
		band_leader_alpha = <band_leader_alpha>
	}
	if ($is_percussion_kit = 0)
		if ScreenElementExists id = <player_info_element>
			<player_info_element> :se_setprops glow_alpha = 0.0
			<player_info_element> :se_setprops percussion_text = qs(0x26239ec0)
		endif
	else
		if ScreenElementExists id = <player_info_element>
			<player_info_element> :se_setprops glow_alpha = 0.65000004
			<player_info_element> :se_setprops percussion_text = qs(0x6988d970)
		endif
	endif
	GetArraySize \{$jam_tracks}
	if (<jam_instrument> < <array_Size>)
		<inst_name> = ($jam_tracks [<jam_instrument>].name_text)
	elseif (<jam_instrument> = $jam_mic_id)
		<inst_name> = qs(0xc0b34c9f)
	endif
	if ($is_drum_machine = 1 && <jam_instrument> = 3)
		SpawnScriptNow id = jam_band_spawns jam_create_extra_info params = {Player = <Player> drum_machine}
	endif
	if (($is_arpeggiator [<jam_instrument>]) = 1)
		SpawnScriptNow id = jam_band_spawns jam_create_extra_info params = {Player = <Player> arpeggiator}
	endif
	<player_info_element> :SetProps instrument_name_text = <inst_name>
	jam_create_effect_info_box Player = <Player> quick_tabs_active = <quick_tabs_active> player_info_element = <player_info_element>
endscript

script jam_destroy_player_info_box 
	SpawnScriptNow id = jam_band_spawns jam_remove_extra_info params = {Player = <Player>}
	formatText checksumName = player_info_element 'player_info_element_%a' a = <Player>
	if ScreenElementExists id = <player_info_element>
		DestroyScreenElement id = <player_info_element>
	endif
endscript

script jam_create_effect_info_box 
	getplayerinfo <Player> jam_instrument
	if (<jam_instrument> > 4)
		<player_info_element> :SetProps extra_info_text = qs(0x00000000)
		RunScriptOnScreenElement id = <player_info_element> legacydomorph params = {Pos = (3.0, 463.0) time = 0.1}
		return
	endif
	formatText checksumName = effect_info_box 'effect_info_box_%a' a = <Player>
	formatText checksumName = player_cont 'inst_player_cont_%s' s = <Player>
	<Pos> = (5.0, -355.0)
	if (<jam_instrument> < 2)
		switch (<jam_instrument>)
			case 0
			<effect_array> = jam_rhythm_effects
			case 1
			<effect_array> = jam_lead_effects
		endswitch
		<effect_index> = (($jam_current_instrument_effects) [<jam_instrument>])
		<effect_name> = (($<effect_array>) [<effect_index>].name_text)
		formatText TextName = effect_text qs(0x4d4555da) s = <effect_name>
		<player_info_element> :SetProps extra_info_text = <effect_text>
		RunScriptOnScreenElement id = <player_info_element> legacydomorph params = {Pos = (3.0, 445.0) time = 0.1}
	elseif (<jam_instrument> = 2)
		if ($bass_kit_mode = 0)
			<player_info_element> :SetProps extra_info_text = qs(0x00000000)
			RunScriptOnScreenElement id = <player_info_element> legacydomorph params = {Pos = (3.0, 465.0) time = 0.1}
		else
			<bass_kit_name> = (($pause_bass_kit_options) [($bass_kit_mode)].name_text)
			formatText TextName = bass_kit_text qs(0x4d4555da) s = <bass_kit_name>
			<player_info_element> :SetProps extra_info_text = <bass_kit_text>
			RunScriptOnScreenElement id = <player_info_element> legacydomorph params = {Pos = (3.0, 445.0) time = 0.1}
		endif
	elseif (<jam_instrument> = 3)
		GetArraySize ($pause_drum_kit_options)
		if (($jam_current_drum_kit) >= <array_Size>)
			Change \{jam_current_drum_kit = 0}
		endif
		<kit_name> = (($pause_drum_kit_options) [($jam_current_drum_kit)].name_text)
		formatText TextName = effect_text qs(0x4d4555da) s = <kit_name>
		<player_info_element> :SetProps extra_info_text = <effect_text>
		RunScriptOnScreenElement id = <player_info_element> legacydomorph params = {Pos = (3.0, 418.0) time = 0.1}
	elseif (<jam_instrument> = 4)
		<melody_kit_name> = (($pause_melody_kit_options) [($jam_current_melody_kit)].name_text)
		formatText TextName = melody_kit_text qs(0x4d4555da) s = <melody_kit_name>
		<player_info_element> :SetProps extra_info_text = <melody_kit_text>
		RunScriptOnScreenElement id = <player_info_element> legacydomorph params = {Pos = (3.0, 445.0) time = 0.1}
	endif
endscript

script jam_destroy_effect_info_box 
	formatText checksumName = effect_info_box 'effect_info_box_%a' a = <Player>
	if ScreenElementExists id = <effect_info_box>
		DestroyScreenElement id = <effect_info_box>
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
	formatText checksumName = inst_cont 'inst_cont_%s' s = <select_player>
	CreateScreenElement {
		Type = ContainerElement
		parent = <player_cont>
		id = <inst_cont>
		Pos = (0.0, 0.0)
		just = [center center]
		exclusive_device = <controller>
		event_handlers =
		[
			{pad_start jam_band_pause params = {select_player = <select_player> player_cont = <player_cont> event_cont = <inst_cont>}}
		]
	}
	LaunchEvent Type = focus target = <inst_cont>
	getplayerinfo <select_player> jam_instrument
	formatText checksumName = simple_rec_arrow_l 'jam_simple_rec_arrow_l_%s' s = <select_player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <inst_cont>
		id = <simple_rec_arrow_l>
		texture = left_arrow
		just = [center top]
		Pos = (-75.0, 485.0)
		Scale = 0.8
		z_priority = 60
	}
	formatText checksumName = simple_rec_arrow_r 'jam_simple_rec_arrow_r_%s' s = <select_player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <inst_cont>
		id = <simple_rec_arrow_r>
		texture = right_arrow
		just = [center top]
		Pos = (78.0, 485.0)
		Scale = 0.8
		z_priority = 60
	}
	formatText checksumName = simple_rec_button_l 'jam_simple_rec_button_l_%s' s = <select_player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <inst_cont>
		id = <simple_rec_button_l>
		texture = button_off
		just = [center top]
		Pos = (-33.0, 474.0)
		Scale = 1.4
		z_priority = 60
	}
	formatText checksumName = simple_rec_button_r 'jam_simple_rec_button_r_%s' s = <select_player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <inst_cont>
		id = <simple_rec_button_r>
		texture = button_off
		just = [center top]
		Pos = (37.0, 474.0)
		Scale = 1.4
		z_priority = 60
	}
	formatText checksumName = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <select_player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <inst_cont>
		id = <simple_rec_button_onl>
		texture = button_on
		just = [center top]
		Pos = (-33.0, 474.0)
		Scale = 1.4
		z_priority = 61
	}
	safe_hide id = <simple_rec_button_onl>
	formatText checksumName = simple_rec_button_onr 'jam_simple_rec_button_onr_%s' s = <select_player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <inst_cont>
		id = <simple_rec_button_onr>
		texture = button_on
		just = [center top]
		Pos = (37.0, 474.0)
		Scale = 1.4
		z_priority = 61
	}
	safe_hide id = <simple_rec_button_onr>
	formatText checksumName = simple_rec_icon_play 'jam_simple_rec_icon_play_%s' s = <select_player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <inst_cont>
		id = <simple_rec_icon_play>
		texture = jm_icon_play
		just = [center top]
		Pos = (38.0, 468.0)
		Scale = 1.7
		z_priority = 65
	}
	formatText checksumName = simple_rec_icon_stop 'jam_simple_rec_icon_stop_%s' s = <select_player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <inst_cont>
		id = <simple_rec_icon_stop>
		texture = icon_stop
		just = [center top]
		Pos = (37.0, 463.0)
		Scale = 2.1
		z_priority = 65
	}
	safe_hide id = <simple_rec_icon_stop>
	if NOT (<jam_instrument> = $jam_mic_id)
		formatText checksumName = simple_rec_icon_rec 'jam_simple_rec_icon_rec_%s' s = <select_player>
		CreateScreenElement {
			Type = SpriteElement
			parent = <inst_cont>
			id = <simple_rec_icon_rec>
			texture = jm_icon_record
			just = [center top]
			Pos = (-33.0, 467.0)
			Scale = 1.75
			z_priority = 65
		}
	endif
	formatText checksumName = simple_rec_icon_rw 'jam_simple_rec_icon_rw_%s' s = <select_player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <inst_cont>
		id = <simple_rec_icon_rw>
		texture = jm_icon_back
		just = [center top]
		Pos = (-8.0, 496.0)
		Scale = 1.65
		rot_angle = 90
		z_priority = 65
	}
	formatText checksumName = simple_rec_icon_ff 'jam_simple_rec_icon_ff_%s' s = <select_player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <inst_cont>
		id = <simple_rec_icon_ff>
		texture = jm_icon_forward
		just = [center top]
		Pos = (66.0, 496.0)
		Scale = 1.65
		rot_angle = 90
		z_priority = 65
	}
	safe_hide id = <simple_rec_icon_rw>
	safe_hide id = <simple_rec_icon_ff>
	formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
	if (<jam_instrument> = $jam_mic_id)
		KillSpawnedScript id = <jam_player_spawns>
		SpawnScriptNow jam_band_activate_mic id = <jam_player_spawns> params = {select_player = <select_player>}
	else
		if StructureContains structure = ($jam_tracks [<jam_instrument>]) ui_create_func
			SpawnScriptNow ($jam_tracks [<jam_instrument>].ui_create_func) id = <jam_player_spawns> params = {parent_id = <inst_cont> Player = <select_player> controller = <controller>}
		endif
		formatText checksumName = input_spawn 'input_spawn_%s' s = <select_player>
		if StructureContains structure = ($jam_tracks [<jam_instrument>]) input_func
			SpawnScriptNow ($jam_tracks [<jam_instrument>].input_func) id = <input_spawn> params = {select_player = <select_player> show_hud = 0 controller = <controller> spawn_id = <input_spawn>}
		endif
	endif
endscript

script jam_destroy_instrument 
	getplayerinfo <select_player> jam_instrument
	if NOT (<jam_instrument> = $jam_mic_id)
		if StructureContains structure = ($jam_tracks [<jam_instrument>]) ui_destroy_func
			formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
			SpawnScriptNow ($jam_tracks [<jam_instrument>].ui_destroy_func) id = <jam_player_spawns> params = {Player = <select_player>}
		endif
	endif
	formatText checksumName = input_spawn 'input_spawn_%s' s = <select_player>
	KillSpawnedScript id = <input_spawn>
	kill_arpeggiator_loop select_player = <select_player>
	destroyplayerserverjaminput Player = <select_player>
	if (<jam_instrument> = $jam_mic_id)
		jam_band_deactivate_mic select_player = <select_player>
	endif
	LaunchEvent Type = unfocus target = <inst_cont>
	destroy_menu menu_id = <inst_cont>
	SpawnScriptNow id = jam_band_spawns jam_create_select_instrument_menu params = {Player = <select_player> player_cont = <player_cont> morph = 1}
endscript

script jam_setup_fretboard 
	jam_create_fretboard parent_id = <parent_id> Player = <Player>
	formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = <Player>
	formatText checksumName = fretboard_id 'jam_fretboard_base_%s' s = <Player>
	getplayerinfo <Player> jam_instrument
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
		getplayerinfo <Player> jam_instrument
		<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
		<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
		if StructureContains structure = <chosen_scale> chromatic
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
	formatText checksumName = base_id 'jam_fretboard_base_%s' s = <Player>
	RunScriptOnScreenElement id = <base_id> legacydomorph params = {Pos = (0.0, 275.0) time = 0.1}
	if ScreenElementExists id = <fretboard_id>
		RunScriptOnScreenElement id = <fretboard_id> jam_fretboard_update params = {tilt_enabled = <tilt_enabled> tilt_global = <tilt_global> num_tilts = <num_tilts> Player = <Player>}
	endif
endscript

script jam_create_fretboard \{parent_id = root_window
		z_priority = 2}
	formatText checksumName = base_id 'jam_fretboard_base_%s' s = <Player>
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent_id>
		id = <base_id>
		just = [center top]
		Pos = (0.0, 400.0)
		dims = (150.0, 210.0)
	}
	formatText checksumName = scrolling_window 'jam_scroll_window_%s' s = <Player>
	CreateScreenElement {
		Type = WindowElement
		parent = <base_id>
		id = <scrolling_window>
		just = [left top]
		Pos = (0.0, 0.0)
		dims = (150.0, 185.0)
	}
	formatText checksumName = scrolling_board1 'jam_scroller1_%s' s = <Player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <scrolling_window>
		id = <scrolling_board1>
		just = [left top]
		rgba = [200 200 200 255]
		texture = scrolling_fretboard
		Pos = (0.0, 0.0)
		dims = (150.0, 187.0)
		z_priority = (<z_priority> + 2)
	}
	formatText checksumName = scrolling_board2 'jam_scroller2_%s' s = <Player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <scrolling_window>
		id = <scrolling_board2>
		just = [left top]
		rgba = [200 200 200 255]
		texture = scrolling_fretboard
		Pos = (0.0, -180.0)
		dims = (150.0, 187.0)
		z_priority = (<z_priority> + 2)
	}
	formatText checksumName = now_id 'jam_now_bar_%s' s = <Player>
	CreateScreenElement {
		Type = ContainerElement
		parent = <base_id>
		id = <now_id>
		just = [center center]
		Pos = (0.0, 0.0)
		Scale = 0.7
		z_priority = (<z_priority> + 3)
	}
	formatText checksumName = gems_id 'jam_falling_gem_container_%s' s = <Player>
	CreateScreenElement {
		Type = ContainerElement
		parent = <base_id>
		id = <gems_id>
		just = [center center]
		Pos = (0.0, 0.0)
		Scale = 0.7
		z_priority = (<z_priority> + 3)
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <now_id>
		just = [left top]
		rgba = [0 0 0 255]
		texture = white
		Pos = (-10.0, 0.0)
		dims = (30.0, 200.0)
		z_priority = (<z_priority> - 5)
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <now_id>
		just = [left top]
		rgba = [0 0 0 255]
		texture = white
		Pos = (190.0, 0.0)
		dims = (30.0, 200.0)
		z_priority = (<z_priority> - 5)
	}
	<pressed_gem_props> = {Type = SpriteElement parent = <now_id> just = [center center] Scale = 1 z_priority = (<z_priority> + 4)}
	<drum> = 0
	<rb_drum> = 0
	getplayerinfo <Player> controller
	if isdrumcontroller controller = <controller>
		if isrbdrum controller = <controller>
			<rb_drum> = 1
		endif
		<drum> = 1
	endif
	jam_menu_get_lefty Player = <Player>
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
	formatText checksumName = gem_id 'jam_now_on_gr_%s' s = <Player>
	CreateScreenElement {
		<pressed_gem_props>
		texture = green_now_off
		Pos = (<gem_positions> [0])
	}
	CreateScreenElement {
		<pressed_gem_props>
		id = <gem_id>
		texture = green_now_on
		Pos = (<gem_positions> [0])
		z_priority = (<z_priority> + 5)
	}
	safe_hide id = <gem_id>
	formatText checksumName = gem_id 'jam_now_on_re_%s' s = <Player>
	CreateScreenElement {
		<pressed_gem_props>
		texture = red_now_off
		Pos = (<gem_positions> [1])
	}
	CreateScreenElement {
		<pressed_gem_props>
		id = <gem_id>
		texture = red_now_on
		Pos = (<gem_positions> [1])
		z_priority = (<z_priority> + 5)
	}
	safe_hide id = <gem_id>
	formatText checksumName = gem_id 'jam_now_on_ye_%s' s = <Player>
	CreateScreenElement {
		<pressed_gem_props>
		texture = yellow_now_off
		Pos = (<gem_positions> [2])
	}
	CreateScreenElement {
		<pressed_gem_props>
		id = <gem_id>
		texture = yellow_now_on
		Pos = (<gem_positions> [2])
		z_priority = (<z_priority> + 5)
	}
	safe_hide id = <gem_id>
	formatText checksumName = gem_id 'jam_now_on_bl_%s' s = <Player>
	CreateScreenElement {
		<pressed_gem_props>
		texture = blue_now_off
		Pos = (<gem_positions> [3])
	}
	CreateScreenElement {
		<pressed_gem_props>
		id = <gem_id>
		texture = blue_now_on
		Pos = (<gem_positions> [3])
		z_priority = (<z_priority> + 5)
	}
	safe_hide id = <gem_id>
	formatText checksumName = gem_id 'jam_now_on_or_%s' s = <Player>
	if NOT (<rb_drum> = 1)
		CreateScreenElement {
			<pressed_gem_props>
			texture = orange_now_off
			Pos = (<gem_positions> [4])
		}
	else
		CreateScreenElement {
			<pressed_gem_props>
			texture = orange_now_off
			Pos = (<gem_positions> [4])
			rgba = [50 50 50 255]
		}
	endif
	CreateScreenElement {
		<pressed_gem_props>
		id = <gem_id>
		texture = orange_now_on
		Pos = (<gem_positions> [4])
		z_priority = (<z_priority> + 5)
	}
	safe_hide id = <gem_id>
	getplayerinfo <Player> jam_instrument
	if NOT (<jam_instrument> = 3)
		formatText checksumName = now_pick 'jam_pick_%s' s = <Player>
		CreateScreenElement {
			Type = SpriteElement
			parent = <now_id>
			id = <now_pick>
			texture = pick
			rgba = [200 200 200 255]
			just = [center center]
			Pos = (230.0, 35.0)
			Scale = 2
			rot_angle = 10
			z_priority = (<z_priority> + 7)
		}
		formatText checksumName = note_text_id 'jam_note_text_%s' s = <Player>
		CreateScreenElement {
			Type = TextElement
			id = <note_text_id>
			parent = <now_pick>
			font = fontgrid_text_a3
			just = [center center]
			Scale = 0.4
			rgba = [0 0 0 255]
			Pos = (19.0, 15.0)
			text = qs(0x00000000)
			noshadow
		}
	endif
	getplayerinfo <Player> controller
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
	formatText checksumName = tilt_id 'jam_tilt_needle_%s' s = <Player>
	CreateScreenElement {
		Type = SpriteElement
		id = <tilt_id>
		parent = <now_id>
		texture = pitch_dial
		just = [center center]
		Scale = 2
		Pos = (14.0, 2.0)
		z_priority = <z_priority>
		alpha = <tilt_meter_alpha>
	}
	formatText checksumName = tilt_meter_id 'jam_tilt_meter_%s' s = <Player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <now_id>
		id = <tilt_meter_id>
		texture = <meter_texture>
		just = [center center]
		Scale = 2
		Pos = (-12.0, 1.0)
		z_priority = <z_priority>
		alpha = <tilt_meter_alpha>
	}
	RunScriptOnScreenElement id = <base_id> jam_lightup_held_note_sprites params = {controller = <controller> Player = <Player>}
endscript

script jam_fretboard_update \{tilt_enabled = 0}
	formatText checksumName = tilt_id 'jam_tilt_needle_%s' s = <Player>
	formatText checksumName = tilt_meter_id 'jam_tilt_meter_%s' s = <Player>
	<last_tilt> = -1
	formatText checksumName = scrolling_board1 'jam_scroller1_%s' s = <Player>
	formatText checksumName = scrolling_board2 'jam_scroller2_%s' s = <Player>
	<scroller1_pos> = (0.0, 0.0)
	<scroller2_pos> = (0.0, -185.0)
	getplayerinfo <Player> jam_instrument
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if StructureContains structure = <chosen_scale> chromatic
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
	<scrolling_board1> :se_setprops Pos = <scroller1_pos>
	<scrolling_board2> :se_setprops Pos = <scroller2_pos>
	if ((<scroller1_pos> [1]) > <bottom_limit>)
		<scrolling_board1> :se_setprops Pos = <scroller1_start>
		<scroller1_pos> = <restart_pos>
	elseif ((<scroller2_pos> [1]) > <bottom_limit>)
		<scrolling_board2> :se_setprops Pos = <scroller2_start>
		<scroller2_pos> = <restart_pos>
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_lightup_held_note_sprites 
	formatText checksumName = gem_gr 'jam_now_on_gr_%s' s = <Player>
	formatText checksumName = gem_re 'jam_now_on_re_%s' s = <Player>
	formatText checksumName = gem_ye 'jam_now_on_ye_%s' s = <Player>
	formatText checksumName = gem_bl 'jam_now_on_bl_%s' s = <Player>
	formatText checksumName = gem_or 'jam_now_on_or_%s' s = <Player>
	formatText checksumName = note_text_id 'jam_note_text_%s' s = <Player>
	getplayerinfo <Player> jam_instrument
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
	GetHeldPattern controller = <controller> Player = <Player> nobrokenstring
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
		jam_lightup_hold_pattern hold_pattern = <hold_pattern> locked = <locked> Player = <Player> exclusive = <exclusive>
		if NOT (<jam_instrument> = 3)
			<note_func> Player = <Player> hold_pattern = <hold_pattern>
			if ScreenElementExists \{id = jam_studio_element}
				jam_studio_element :SetProps note_text = <single_note_text>
			else
				<note_text_id> :se_setprops text = <single_note_text>
			endif
			<last_tilt> = ($<tilt_var>)
		endif
	endif
	<locked> = 0
	Wait \{1
		gameframe}
	repeat
endscript

script jam_lightup_hold_pattern \{hold_pattern = 1048576
		locked = 0
		Player = 1
		exclusive = 1}
	formatText checksumName = gem_gr 'jam_now_on_gr_%s' s = <Player>
	formatText checksumName = gem_re 'jam_now_on_re_%s' s = <Player>
	formatText checksumName = gem_ye 'jam_now_on_ye_%s' s = <Player>
	formatText checksumName = gem_bl 'jam_now_on_bl_%s' s = <Player>
	formatText checksumName = gem_or 'jam_now_on_or_%s' s = <Player>
	formatText checksumName = note_text_id 'jam_note_text_%s' s = <Player>
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
	formatText checksumName = gem_gr 'jam_now_on_gr_%s' s = <Player>
	formatText checksumName = gem_re 'jam_now_on_re_%s' s = <Player>
	formatText checksumName = gem_ye 'jam_now_on_ye_%s' s = <Player>
	formatText checksumName = gem_bl 'jam_now_on_bl_%s' s = <Player>
	formatText checksumName = gem_or 'jam_now_on_or_%s' s = <Player>
	formatText checksumName = note_text_id 'jam_note_text_%s' s = <Player>
	safe_hide id = <gem_gr>
	safe_hide id = <gem_re>
	safe_hide id = <gem_ye>
	safe_hide id = <gem_bl>
	safe_hide id = <gem_or>
endscript

script jam_ghmix_note_quick_update 
	getplayerinfo <Player> jam_instrument
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
		jam_studio_element :SetProps \{note_text = qs(0x00000000)}
		return
	endswitch
	<note_func> Player = <Player> hold_pattern = 1048576
	if ScreenElementExists \{id = jam_studio_element}
		if NOT (<jam_instrument> = 3)
			jam_studio_element :SetProps note_text = <single_note_text>
		else
			jam_studio_element :SetProps \{note_text = qs(0x00000000)}
		endif
	endif
endscript

script jam_ghmix_note_text_clear 
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{note_text = qs(0x00000000)}
	endif
endscript

script jam_fretboard_add_note 
	formatText checksumName = player_cont 'inst_player_cont_%s' s = <Player>
	if NOT ScreenElementExists id = <player_cont>
		return
	endif
	getplayerinfo <Player> jam_instrument
	getplayerinfo <Player> controller
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
	jam_menu_get_lefty Player = <Player>
	if (<jam_instrument> = 3)
		if NOT IsGuitarController controller = <controller>
			<lefty> = 0
		endif
	endif
	if (<lefty> = 1)
		<gem_pos_start> = (<gem_pos_start> + (<gem_offset> * 4))
	endif
	gem_pos = <gem_pos_start>
	z_priority = 28
	formatText checksumName = gems_id 'jam_falling_gem_container_%s' s = <Player>
	if NOT ScreenElementExists id = <gems_id>
		return
	endif
	GetArraySize <gems>
	gem_count = 0
	gem_created = 0
	begin
	if (<gem_pattern> && (<gems> [<gem_count>].pattern))
		if NOT ScriptIsRunning \{jam_prevent_new_note}
			getplayerinfo <Player> controller
			if isdrumcontroller controller = <controller>
				<gem_texture> = (<gems> [<gem_count>].texture_drum)
			else
				<gem_texture> = (<gems> [<gem_count>].texture)
			endif
			if (($jam_num_falling_gems + 1) >= $jam_falling_gem_limit)
				return
			else
				Change jam_num_falling_gems = ($jam_num_falling_gems + 1)
			endif
			if (<gem_count> = 5)
				<gem_pos> = ((0.0, 0.0) - (3.0, 0.0))
				CreateScreenElement {
					Type = SpriteElement
					parent = <gems_id>
					texture = <gem_texture>
					just = [left center]
					rgba = (<gems> [<gem_count>].rgba)
					Pos = <gem_pos>
					z_priority = (<z_priority> -1)
					Scale = 0.83
				}
				<gem_id> = <id>
			else
				if (<lefty> = 1)
					<gem_pos> = (<gem_pos> - (<gem_offset> * <gem_count>))
				else
					<gem_pos> = (<gem_pos> + (<gem_offset> * <gem_count>))
				endif
				CreateScreenElement {
					Type = SpriteElement
					parent = <gems_id>
					just = [center center]
					Scale = 0.8
					z_priority = <z_priority>
					texture = <gem_texture>
					Pos = <gem_pos>
				}
				<gem_id> = <id>
				if NOT (<jam_instrument> = 3)
					if GotParam \{sustain}
						CreateScreenElement {
							Type = SpriteElement
							parent = <gems_id>
							just = [center top]
							texture = white
							rgba = ($jam_gem_colors [<gem_count>])
							Pos = <gem_pos>
							dims = (10.0, 0.0)
							Scale = 1
							z_priority = (<z_priority> -8)
						}
						<sustain_id> = <id>
					endif
				endif
			endif
			RunScriptOnScreenElement id = <id> jam_fretboard_update_falling_gem params = {
				Player = <Player>
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
	repeat <array_Size>
endscript

script jam_prevent_new_note 
	<mod_bpm> = (($jam_current_bpm) - 80)
	<percent_bpm> = (<mod_bpm> / 80.0)
	<res> = (10 - (<percent_bpm> * 10))
	<res> = (<res> + 10)
	Wait <res> gameframes
	return
endscript

script jam_fretboard_update_falling_gem 
	getplayerinfo <Player> jam_instrument
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
		<gem_id> :se_setprops Pos = <gem_pos>
		if ((<gem_pos> [1]) > <kill_limit>)
			<gem_id> :Die
			<gem_dead> = 1
			Change jam_num_falling_gems = ($jam_num_falling_gems - 1)
			if NOT GotParam \{sustain_id}
				return
			endif
		endif
	endif
	if GotParam \{sustain_id}
		if ((<gem_pos> [1]) < <start_sustain_limit>)
			<sustain_pos> = (<sustain_pos> + ((0.0, 1.0) * <y_inc>))
			<sustain_id> :se_setprops Pos = <sustain_pos>
			<past_start_limit> = 1
		else
			if ((<global_id> = ($<sustain_global>)) && (<free_fall> = 0))
				<sustain_dims> = (<sustain_dims> + ((0.0, 1.0) * <y_inc>))
				<sustain_id> :se_setprops dims = <sustain_dims>
			else
				<sustain_pos> = (<sustain_pos> + ((0.0, 1.0) * <y_inc>))
				<sustain_id> :se_setprops Pos = <sustain_pos>
				if (<past_start_limit>)
					<free_fall> = 1
				endif
			endif
			if ((<sustain_pos> [1]) > <fall_limit>)
				<sustain_id> :Die
				if ScreenElementExists id = <gem_id>
					<gem_id> :Die
					Change jam_num_falling_gems = ($jam_num_falling_gems - 1)
				endif
				return
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_update_falling_gem_sustain 
	<cur_id> = ($<sustain_global>)
	if GotParam \{stop}
		if (<cur_id> > 0)
			<cur_id> = (<cur_id> * -1)
		else
			if ($jam_tutorial_status = Active)
				broadcastevent \{Type = jam_tutorial_sustain
					data = {
						sustain = 0
					}}
			endif
			<cur_id> = (<cur_id> - 1)
		endif
		Change GlobalName = <sustain_global> NewValue = <cur_id>
		return
	endif
	if (<cur_id> < 0)
		<cur_id> = (<cur_id> * -1)
	endif
	<cur_id> = (<cur_id> + 1)
	if (<cur_id> > 1000)
		<cur_id> = 1
	endif
	if ($jam_tutorial_status = Active)
		broadcastevent \{Type = jam_tutorial_sustain
			data = {
				sustain = 1
			}}
	endif
	Change GlobalName = <sustain_global> NewValue = <cur_id>
endscript

script jam_destroy_fretboard 
	formatText checksumName = base_id 'jam_fretboard_base_%s' s = <Player>
	if ScreenElementExists id = <base_id>
		DestroyScreenElement id = <base_id>
	endif
endscript

script jam_band_pause \{back_to_jam_band = 1
		shake = 1
		hide_ghmix = 0}
	if NOT GotParam \{forced_pause}
		if ($game_mode = training)
			return
		endif
	endif
	formatText checksumName = input_spawn 'input_spawn_%s' s = <select_player>
	KillSpawnedScript id = <input_spawn>
	kill_arpeggiator_loop select_player = <select_player> reset_pattern = true
	destroyplayerserverjaminput Player = <select_player>
	getplayerinfo <select_player> jam_instrument
	if (<jam_instrument> = $jam_mic_id)
		jam_band_deactivate_mic select_player = <select_player>
	elseif (<jam_instrument> = 4)
		jam_input_melody_stop_sound
	endif
	jam_stop_sound jam_instrument = <jam_instrument>
	getplayerinfo <select_player> controller
	LaunchEvent Type = unfocus target = <event_cont>
	formatText checksumName = player_pause 'jam_band_pause_%s' s = <select_player>
	if ScreenElementExists id = <player_pause>
		DestroyScreenElement id = <player_pause>
		if ($jam_advanced_record = 1)
			SoundEvent \{event = jam_advanced_record_pause_panel_out}
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
	formatText TextName = player_text qs(0x033007b2) s = <select_player>
	if GotParam \{adv_record}
		CreateScreenElement {
			local_id = clip_window_pause
			Type = WindowElement
			parent = <player_cont>
			just = [left top]
			Pos = (-210.0, -27.0)
			dims = (1040.0, 588.0)
		}
		CreateScreenElement {
			Type = ContainerElement
			id = <player_pause>
			parent = <id>
			Pos = (0.0, -500.0)
		}
		KillSpawnedScript \{Name = jam_highway_select_quantize}
	else
		CreateScreenElement {
			Type = ContainerElement
			id = <player_pause>
			parent = <player_cont>
			Pos = (0.0, -500.0)
		}
	endif
	if GotParam \{adv_record}
		CreateScreenElement {
			parent = <player_pause>
			Type = descinterface
			Pos = (-143.0, 15.0)
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
			SoundEvent \{event = jam_advanced_record_pause_panel_in}
		endif
	else
		getplayerinfo <select_player> controller
		band_leader_alpha = 0
		if (<controller> = $primary_controller)
			<band_leader_alpha> = 1
		endif
		CreateScreenElement {
			parent = <player_pause>
			Type = descinterface
			Pos = (-141.0, 15.0)
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
			SoundEvent \{event = menu_recording_pause_panel_in}
		endif
	endif
	formatText checksumName = scrolling_options 'scrolling_options_%s' s = <select_player>
	formatText checksumName = vmenu_options 'vmenu_options_%s' s = <select_player>
	if GotParam \{adv_record}
		<respawn> = -1
	elseif GotParam \{paused_at_inst}
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
	if GotParam \{adv_record}
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
	elseif GotParam \{paused_at_inst}
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
	text_params = {Type = TextElement font = fontgrid_text_a3 just = [center center] Scale = 1 rgba = <pause_font_color>}
	if ScreenElementExists \{id = jam_songwriter_container}
		jam_songwriter_container :GetTags
	endif
	GetArraySize <pause_options>
	option = 0
	begin
	fit_to_dims = (<pause_options> [<option>].fit_to_dims)
	formatText checksumName = option_id 'option_%a_%b' a = <option> b = <select_player>
	formatText checksumName = option_text_id 'option_text_%a_%b' a = <option> b = <select_player>
	option_text = (<pause_options> [<option>].name_text)
	if StructureContains structure = (<pause_options> [<option>]) is_toggle
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
				formatText TextName = machine_text qs(0x326eef22) s = <machine_text>
				<option_text> = <machine_text>
			else
				formatText TextName = machine_text qs(0x61146f69) s = <machine_text>
			endif
			<option_text> = <machine_text>
		endif
	endif
	show_option = 1
	if StructureContains structure = (<pause_options> [<option>]) allow_inst
		<show_option> = (<pause_options> [<option>].allow_inst [<jam_instrument>])
	endif
	if StructureContains structure = (<pause_options> [<option>]) dont_show_if_drum_controller
		if isdrumcontroller controller = <controller>
			<show_option> = 0
		endif
	endif
	if StructureContains structure = (<pause_options> [<option>]) check_drum_machine
		if NOT ($is_drum_machine = 1)
			<show_option> = 0
		endif
	endif
	if StructureContains structure = (<pause_options> [<option>]) check_arpeggiator
		if NOT (($is_arpeggiator [<jam_instrument>]) = 1)
			<show_option> = 0
		endif
	endif
	choose_script = (<pause_options> [<option>].pause_script)
	primary_only = 0
	if StructureContains structure = (<pause_options> [<option>]) primary_only
		if NOT (<controller> = ($primary_controller))
			<primary_only> = 1
			<choose_script> = jam_band_warning_box
		endif
	endif
	if GotParam \{pause_options_disabled}
		if ((<pause_options_disabled> [<option>]) = 0)
			<show_option> = 0
		endif
	endif
	if (<show_option> = 1)
		if StructureContains structure = (<pause_options> [<option>]) pause_script
			CreateScreenElement {
				Type = ContainerElement
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
			CreateScreenElement {
				Type = ContainerElement
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
		CreateScreenElement {
			Type = TextBlockElement
			parent = <option_id>
			id = <option_text_id>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [center center]
			Scale = 1
			rgba = <option_rgba>
			dims = (182.0, 32.0)
			text = <option_text>
			z_priority = 45
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = proportional
			text_case = Original
		}
		if StructureContains structure = (<pause_options> [<option>]) init_script
			SpawnScriptNow (<pause_options> [<option>].init_script) id = jam_band_spawns params = {option_id = <option_id> option_text_id = <option_text_id>}
		endif
	endif
	<option> = (<option> + 1)
	repeat <array_Size>
	<show_note_limit> = 1
	if GotParam \{adv_record}
		<show_note_limit> = 1
	elseif GotParam \{paused_at_inst}
		<show_note_limit> = 0
	endif
	if (<show_note_limit> = 1)
		if NOT (<jam_instrument> = $jam_mic_id)
			getjamsessionsize track = ($jam_tracks [<jam_instrument>].id)
			formatText TextName = num_notes qs(0x89be46a6) a = <track_size> b = (($gemarraysize) -1)
			if (<track_size> >= (($gemarraysize) -1))
				<limit_color> = [190 20 20 250]
			else
				<limit_color> = [150 150 150 255]
			endif
			CreateScreenElement {
				Type = TextBlockElement
				parent = <player_pause>
				id = <note_limit>
				font = fontgrid_text_a3
				just = [center bottom]
				Scale = 1
				rgba = <limit_color>
				Pos = (0.0, 491.0)
				dims = (190.0, 30.0)
				internal_just = [center bottom]
				text = <num_notes>
				z_priority = 45
				fit_width = `scale	each	line	if	larger`
				fit_height = `scale	down	if	larger`
				scale_mode = proportional
			}
			instrument_name = ($jam_tracks [<jam_instrument>].name_text)
		else
			instrument_name = qs(0xf98ebc1a)
		endif
		CreateScreenElement {
			Type = TextBlockElement
			parent = <player_pause>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [center center]
			Scale = 1
			rgba = [150 150 150 255]
			Pos = (0.0, 450.0)
			dims = (170.0, 40.0)
			text = <instrument_name>
			z_priority = 45
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = proportional
			text_case = Original
		}
	endif
	formatText checksumName = effect_info_box 'effect_info_box_%a' a = <select_player>
	if ScreenElementExists id = <effect_info_box>
		<effect_info_box> :se_setprops Pos = (5.0, -555.0) time = 0.1
	endif
	if ScreenElementExists id = <scrolling_options>
		LaunchEvent Type = unfocus target = <vmenu_options>
	endif
	if NOT GotParam \{adv_record}
		formatText checksumName = base_id 'jam_fretboard_base_%s' s = <select_player>
		if ScreenElementExists id = <base_id>
			<base_id> :se_setprops Pos = (0.0, 480.0) time = 0.1
		endif
		formatText checksumName = quick_tabs 'quick_tabs_%a' a = <select_player>
		if ScreenElementExists id = <quick_tabs>
			<quick_tabs> :se_setprops Pos = (-116.0, -300.0) time = 0.1
			DestroyScreenElement id = <quick_tabs>
		endif
		end_pos = (0.0, -40.0)
	else
		if ScreenElementExists id = <player_pause>
			<player_pause> :se_setprops Pos = (133.0, -500.0)
		endif
		end_pos = (133.0, -57.0)
	endif
	if (<shake> = 1)
		GetRandomValue \{a = -0.7
			b = 0.7
			Name = rot_amount}
		if ScreenElementExists id = <player_pause>
			<player_pause> :se_setprops rot_angle = <rot_amount> Pos = (<end_pos> + (0.0, 10.0)) time = 0.1
			<player_pause> :se_waitprops
		endif
		GetRandomValue \{a = -0.5
			b = 0.5
			Name = rot_amount}
		if ScreenElementExists id = <player_pause>
			<player_pause> :se_setprops rot_angle = <rot_amount> Pos = (<end_pos> - (0.0, 10.0)) time = 0.07
			<player_pause> :se_waitprops
		endif
		GetRandomValue \{a = -0.3
			b = 0.3
			Name = rot_amount}
		if ScreenElementExists id = <player_pause>
			<player_pause> :se_setprops rot_angle = <rot_amount> Pos = (<end_pos> + (0.0, 5.0)) time = 0.07
			<player_pause> :se_waitprops
		endif
		GetRandomValue \{a = -0.2
			b = 0.2
			Name = rot_amount}
		if ScreenElementExists id = <player_pause>
			<player_pause> :se_setprops rot_angle = <rot_amount> Pos = (<end_pos> - (0.0, 3.0)) time = 0.07
			<player_pause> :se_waitprops
		endif
		if ScreenElementExists id = <player_pause>
			<player_pause> :se_setprops rot_angle = 0.0 Pos = <end_pos> time = 0.07
			<player_pause> :se_waitprops
		endif
	else
		if ScreenElementExists id = <player_pause>
			<player_pause> :se_setprops Pos = <end_pos> time = 0.1
			<player_pause> :se_waitprops
		endif
	endif
	formatText checksumName = gems_id 'jam_falling_gem_container_%s' s = <select_player>
	if ScreenElementExists id = <gems_id>
		if GetScreenElementChildren id = <gems_id>
			GetArraySize <children>
			Change jam_num_falling_gems = ($jam_num_falling_gems - <array_Size>)
			if ($jam_num_falling_gems < 0)
				Change \{jam_num_falling_gems = 0}
			endif
		endif
	endif
	if NOT (<jam_instrument> = $jam_mic_id)
		if NOT GotParam \{paused_at_inst}
			if StructureContains structure = ($jam_tracks [<jam_instrument>]) ui_destroy_func
				formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
				SpawnScriptNow ($jam_tracks [<jam_instrument>].ui_destroy_func) id = <jam_player_spawns> params = {Player = <select_player>}
			endif
		endif
	endif
	if GotParam \{adv_record}
		clean_up_user_control_helpers
		menu_jam_band_add_control_helpers \{state = pause_menu}
	else
		guitar_jam_simplerecops_command_stopplay
	endif
	if ScreenElementExists id = <scrolling_options>
		LaunchEvent Type = focus target = <vmenu_options>
	endif
endscript

script jam_pause_focus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			<id> :GetSingleTag old_font
			if NOT GotParam \{old_font}
				<id> :se_getprops
				<id> :SetTags old_font = <font>
			endif
			SetScreenElementProps id = <id> font = fontgrid_text_a3 rgba = $menu_focus_color
		endif
	else
		GetSingleTag \{old_font}
		if NOT GotParam \{old_font}
			se_getprops
			SetTags old_font = <font>
		endif
		SetProps \{font = fontgrid_text_a3
			rgba = $menu_focus_color}
	endif
endscript

script jam_pause_unfocus \{primary_only = 0}
	rgba = $menu_unfocus_color
	if (<primary_only> = 1)
		rgba = [35 35 35 255]
	endif
	if GotParam \{id}
		if ScreenElementExists id = <id>
			<id> :GetSingleTag old_font
			if NOT GotParam \{old_font}
				<id> :se_getprops
				<id> :SetTags old_font = <font>
			endif
			SetScreenElementProps id = <id> font = fontgrid_text_a3 rgba = <rgba>
		endif
	else
		GetSingleTag \{old_font}
		if NOT GotParam \{old_font}
			se_getprops
			SetTags old_font = <font>
		endif
		SetProps font = fontgrid_text_a3 rgba = <rgba>
	endif
endscript

script jam_band_pause_submenu 
	LaunchEvent Type = unfocus target = <vmenu_id>
	formatText checksumName = player_pause_submenu 'jam_band_pause_%a_%s' a = <submenu_name> s = <select_player>
	if ScreenElementExists id = <player_pause_submenu>
		DestroyScreenElement id = <player_pause_submenu>
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
	formatText TextName = player_text qs(0x033007b2) s = <select_player>
	if ($jam_advanced_record = 0)
		CreateScreenElement {
			Type = ContainerElement
			id = <player_pause_submenu>
			parent = <player_cont>
			Pos = (0.0, -40.0)
		}
		getplayerinfo <select_player> controller
		band_leader_alpha = 0
		if (<controller> = $primary_controller)
			<band_leader_alpha> = 1
		endif
		CreateScreenElement {
			parent = <player_pause_submenu>
			Type = descinterface
			Pos = (-141.0, 15.0)
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
		CreateScreenElement {
			local_id = clip_window_pause_submenu
			Type = WindowElement
			parent = <player_cont>
			just = [left top]
			Pos = (-210.0, -27.0)
			dims = (1040.0, 588.0)
		}
		CreateScreenElement {
			Type = ContainerElement
			id = <player_pause_submenu>
			parent = <id>
			Pos = (133.0, -57.0)
		}
		CreateScreenElement {
			parent = <player_pause_submenu>
			Type = descinterface
			Pos = (-143.0, 15.0)
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
	if StructureContains structure = (<options_array> [0]) section_heading
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
		CreateScreenElement {
			Type = TextBlockElement
			parent = <window_id>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [center center]
			Scale = 1
			rgba = [255 255 255 255]
			dims = (150.0, 32.0)
			Pos = (140.0, 130.0)
			text = <inst_name>
			z_priority = 46
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = proportional
			text_case = Original
		}
		CreateScreenElement {
			Type = SpriteElement
			parent = <window_id>
			texture = list_container
			just = [left , top]
			pos_anchor = [left , top]
			rgba = [150 150 150 255]
			Pos = (17.0, 105.0)
			dims = <box_dims>
			alpha = 1
			z_priority = 40
		}
	else
		CreateScreenElement {
			Type = TextBlockElement
			parent = <player_pause_submenu>
			text = qs(0xc08b018f)
			font = fontgrid_text_a8
			just = [center center]
			pos_anchor = [center center]
			rgba = [255 255 255 255]
			Pos = (15.0, 138.0)
			alpha = 1
			z_priority = 100
			Scale = 1.2
			dims = (50.0, 50.0)
		}
		CreateScreenElement {
			Type = TextBlockElement
			parent = <player_pause_submenu>
			text = qs(0xc08b018f)
			font = fontgrid_text_a8
			just = [center center]
			pos_anchor = [center center]
			rgba = [255 255 255 255]
			Pos = (-16.0, 410.0)
			alpha = 1
			z_priority = 100
			rot_angle = 180
			Scale = 1.2
			dims = (50.0, 50.0)
		}
		if NOT GotParam \{no_preview}
			user_control_helper_get_buttonchar button = yellow controller = <controller>
			CreateScreenElement {
				parent = <player_pause_submenu>
				Type = descinterface
				desc = 'helper_pill'
				auto_dims = FALSE
				dims = (0.0, 36.0)
				Scale = 1.1
				Pos = (0.0, 458.0)
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
	formatText checksumName = scrolling_options_submenu 'scrolling_options_%a_%s' a = <submenu_name> s = <select_player>
	formatText checksumName = vmenu_options_submenu 'vmenu_options_%a_%s' a = <submenu_name> s = <select_player>
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
	text_params = {Type = TextElement font = fontgrid_text_a3 just = [center center] Scale = 1 rgba = <pause_font_color>}
	GetArraySize <options_array>
	option = 0
	if (<added_heading> = 1)
		<option> = 1
		<array_Size> = (<array_Size> -1)
	endif
	begin
	fit_to_dims = (<options_array> [<option>].fit_to_dims)
	formatText checksumName = option_id 'pause_submenu_%a_options_%b_%c' a = <submenu_name> b = <select_player> c = <option>
	formatText checksumName = option_text_id 'pause_submenu_%a_optext_%b_%c' a = <submenu_name> b = <select_player> c = <option>
	show_option = 1
	getplayerinfo <select_player> jam_instrument
	if StructureContains structure = (<options_array> [<option>]) allow_inst
		<show_option> = (<options_array> [<option>].allow_inst [<jam_instrument>])
	endif
	<deny_this_option> = 0
	if GotParam \{deny_index}
		if (<option> = <deny_index>)
			<deny_this_option> = 1
		endif
	endif
	if ((<option> = 3) && (<added_heading> = 1))
		CreateScreenElement {
			Type = ContainerElement
			parent = <vmenu_options_submenu>
			dims = <gap_dims>
			not_focusable
		}
	endif
	if (<show_option> = 1)
		if StructureContains structure = (<options_array> [<option>]) submenu_preview_script
			CreateScreenElement {
				Type = ContainerElement
				id = <option_id>
				parent = <vmenu_options_submenu>
				dims = (100.0, 30.0)
				event_handlers = [
					{focus jam_pause_focus params = {id = <option_text_id>}}
					{unfocus retail_menu_unfocus params = {id = <option_text_id>}}
					{pad_choose ui_menu_select_sfx}
					{pad_choose (<options_array> [<option>].submenu_script) params = {
							Player = <select_player>
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
							Player = <select_player>
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
			CreateScreenElement {
				Type = ContainerElement
				id = <option_id>
				parent = <vmenu_options_submenu>
				dims = (100.0, 30.0)
				event_handlers = [
					{focus jam_pause_focus params = {id = <option_text_id>}}
					{unfocus retail_menu_unfocus params = {id = <option_text_id>}}
					{pad_choose ui_menu_select_sfx}
					{pad_choose (<options_array> [<option>].submenu_script) params = {
							Player = <select_player>
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
		if GotParam \{selectable_choices}
			if (<option> = <current_submenu_choice>)
				formatText checksumName = selector_id 'pause_submenu_%a_selector_%b' a = <submenu_name> b = <select_player>
				CreateScreenElement {
					Type = SpriteElement
					parent = <option_id>
					id = <selector_id>
					texture = white
					just = [center center]
					rgba = [200 200 200 255]
					Pos = (-1.0, 13.0)
					dims = (185.0, 2.0)
					z_priority = 52
					alpha = 0
				}
				CreateScreenElement {
					Type = SpriteElement
					parent = <selector_id>
					texture = white
					just = [left center]
					rgba = [200 200 200 255]
					Pos = (0.0, -25.0)
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
		CreateScreenElement {
			Type = TextBlockElement
			parent = <option_id>
			id = <option_text_id>
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [center center]
			Scale = 1
			rgba = <pause_font_color>
			dims = <option_dims>
			Pos = <option_pos>
			text = <option_text>
			z_priority = 80
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = proportional
			text_case = Original
		}
		if (<deny_this_option> = 1)
			<option_text_id> :se_setprops rgba = [150 150 150 255]
		endif
		if StructureContains structure = (<options_array> [<option>]) submenu_init_script
			SpawnScriptNow (<options_array> [<option>].submenu_init_script) id = jam_band_spawns params = {Player = <select_player> submenu_name = <submenu_name> option_index = <option> option_text_id = <option_text_id>}
		endif
	endif
	<option> = (<option> + 1)
	repeat <array_Size>
	if ($jam_advanced_record = 1)
		clean_up_user_control_helpers
		menu_jam_band_add_control_helpers \{state = pause_submenu}
	endif
	if ScreenElementExists id = <scrolling_options_submenu>
		LaunchEvent Type = focus target = <vmenu_options_submenu> data = {child_index = <current_submenu_choice>}
	endif
endscript

script jam_band_warning_box 
	jam_destroy_player_info_box Player = <select_player>
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player>
	message = qs(0x1ed472de)
	formatText checksumName = warning_box 'jam_band_warning_box_%a' a = <select_player>
	if ScreenElementExists id = <warning_box>
	endif
	event_handlers = [{pad_back jam_band_warning_box_back params = {<...>}}]
	CreateScreenElement {
		parent = <player_cont>
		id = <warning_box>
		Type = descinterface
		pos_anchor = [center center]
		just = [center center]
		Pos = (4.0, 175.0)
		Scale = 1
		desc = 'jam_band_warning_box'
		exclusive_device = <device_num>
		event_handlers = <event_handlers>
	}
	LaunchEvent target = <warning_box> Type = focus
endscript

script jam_band_warning_box_back 
	formatText checksumName = warning_box 'jam_band_warning_box_%a' a = <select_player>
	<warning_box> :legacydomorph alpha = 0 time = 0.1
	if ScreenElementExists id = <warning_box>
		DestroyScreenElement id = <warning_box>
	endif
	jam_create_player_info Player = <select_player> player_cont = <player_cont> jam_create_player_info
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = 1
endscript

script jam_band_controller_warning_box 
	jam_destroy_player Player = <Player>
	getplayerinfo <Player> controller
	if isps3
		message = qs(0x588788f4)
	else
		message = qs(0xec4dbd17)
	endif
	formatText checksumName = warning_box 'jam_band_warning_box_%a' a = <Player>
	if ScreenElementExists id = <warning_box>
		DestroyScreenElement id = <warning_box>
	endif
	event_handlers = [{pad_back jam_band_controller_warning_box_back params = {<...>}}]
	CreateScreenElement {
		Type = ContainerElement
		parent = jam_band_container
		id = <warning_box>
		Pos = ($jam_cont_start_pos + (1.0, 0.0) * ($jam_cont_offset * (<Player> - 1)))
		event_handlers = <event_handlers>
	}
	CreateScreenElement {
		parent = <warning_box>
		Type = descinterface
		pos_anchor = [center center]
		just = [center center]
		Pos = (4.0, 175.0)
		Scale = 1
		desc = 'jam_band_warning_box'
		exclusive_device = <controller>
		warning_text = <message>
	}
	LaunchEvent target = <warning_box> Type = focus
endscript

script jam_band_controller_warning_box_back 
	formatText checksumName = warning_box 'jam_band_warning_box_%a' a = <Player>
	<warning_box> :legacydomorph alpha = 0 time = 0.1
	if ScreenElementExists id = <warning_box>
		DestroyScreenElement id = <warning_box>
	endif
	jam_create_player_container Player = <Player>
endscript

script jam_band_pause_effects 
	printstruct channel = effectsmenudump <...>
	if NOT ($jam_advanced_record = 1)
		jam_destroy_player_info_box Player = <select_player>
	endif
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player>
	if ($jam_advanced_record = 1)
		clean_up_user_control_helpers
		menu_jam_band_add_control_helpers \{state = effects_menu}
	endif
	formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
	SpawnScriptNow line6_pod id = <jam_player_spawns> params = {<...>}
	SoundEvent \{event = jam_mode_fxhud_on}
	broadcastevent \{Type = jam_open_effects_menu}
endscript

script line6_pod 
	printf \{channel = jam_mode
		qs(0x10c9ea18)}
	formatText checksumName = line6_pod_id 'line6_pod_%a' a = <select_player>
	formatText checksumName = line6_pod_window_element_id 'line6_pod_window_element_%a' a = <select_player>
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
		CreateScreenElement {
			parent = <player_cont>
			id = <line6_pod_window_element_id>
			Type = WindowElement
			Pos = (0.0, 200.0)
			dims = (200.0, 550.0)
			just = [center center]
			internal_just = [center center]
		}
		CreateScreenElement {
			parent = <line6_pod_window_element_id>
			id = <line6_pod_id>
			Type = descinterface
			pos_anchor = [center center]
			just = [center center]
			Pos = (0.0, -400.0)
			Scale = 0.4
			desc = 'line6_pod_advanced'
			exclusive_device = <device_num>
			event_handlers = <event_handlers>
			code_box_alpha = 0
			helper_alpha = <cheat_alpha>
			helper_button_text = qs(0x3ea0c2b5)
		}
		<line6_pod_id> :SetTags {code_box = 0}
		end_pos = (0.0, -40.0)
	else
		CreateScreenElement {
			Type = WindowElement
			id = <line6_pod_window_element_id>
			parent = <player_cont>
			just = [left top]
			Pos = (-120.0, -50.0)
			dims = (800.0, 575.0)
		}
		CreateScreenElement {
			parent = <line6_pod_window_element_id>
			id = <line6_pod_id>
			Type = descinterface
			desc = 'line6_pod_advanced'
			Pos = (-222.0, -600.0)
			exclusive_device = <device_num>
			event_handlers = <event_handlers>
			code_box_alpha = 0
			helper_alpha = <cheat_alpha>
			helper_button_text = qs(0x3ea0c2b5)
		}
		<line6_pod_id> :SetTags {code_box = 0}
		end_pos = (-222.0, -70.0)
		LaunchEvent \{Type = unfocus
			target = jam_control_container}
		KillSpawnedScript \{Name = jam_highway_select_quantize}
	endif
	line6_pod_update_effect select_player = <select_player> line6_pod_id = <line6_pod_id>
	getplayerinfo <select_player> jam_instrument
	<curr_effect> = ($jam_current_instrument_effects [<jam_instrument>])
	<line6_pod_id> :SetTags {previous_effect = <curr_effect>}
	<line6_pod_id> :legacydomorph Pos = (<end_pos> + (0.0, 10.0)) time = 0.1
	<line6_pod_id> :legacydomorph Pos = (<end_pos> - (0.0, 10.0)) time = 0.1
	<line6_pod_id> :legacydomorph Pos = (<end_pos> + (0.0, 5.0)) time = 0.1
	<line6_pod_id> :legacydomorph Pos = (<end_pos> - (0.0, 3.0)) time = 0.1
	<line6_pod_id> :legacydomorph Pos = <end_pos> time = 0.1
	if NOT ($jam_advanced_record = 1)
		<line6_pod_id> :se_setprops Scale = 1.05 Pos = (0.0, -40.0) time = 0.1
		<line6_pod_id> :se_waitprops
		<line6_pod_id> :se_setprops Scale = 0.95 Pos = (0.0, -40.0) time = 0.05
		<line6_pod_id> :se_waitprops
		<line6_pod_id> :se_setprops Scale = 1.0 Pos = (0.0, -40.0) time = 0.05
		<line6_pod_id> :se_waitprops
	endif
	LaunchEvent target = <line6_pod_id> Type = focus
endscript

script line6_pod_unlock_toggle 
	if ($cheat_line6unlock = 1)
		return
	endif
	<line6_pod_id> :GetTags
	formatText checksumName = scroll_id1 'line6_scrolling_text2_%s' s = <select_player>
	formatText checksumName = scroll_id2 'line6_scrolling_text1_%s' s = <select_player>
	if (<code_box> = 0)
		<line6_pod_id> :se_setprops helper_description_text = qs(0xd18ad640)
		<line6_pod_id> :se_setprops code_box_alpha = 1 time = 0.1
		<line6_pod_id> :SetTags {code_box = 1}
		SoundEvent \{event = recording_start}
		if <line6_pod_id> :desc_resolvealias Name = scrolling_text_window1
			CreateScreenElement {
				Type = ContainerElement
				parent = <resolved_id>
				id = <scroll_id1>
				Pos = (0.0, 0.0)
				just = [left top]
				Scale = 0.75
			}
			text = qs(0x6e5155ba)
			CreateScreenElement {
				Type = TextBlockElement
				parent = <scroll_id1>
				font = fontgrid_text_a3
				just = [left top]
				internal_just = [center center]
				rgba = [224 , 224 , 224 , 255]
				dims = (250.0, 50.0)
				Pos = (-2.0, 0.0)
				text = <text>
				fit_width = `scale	each	line	if	larger`
				fit_height = `scale	down	if	larger`
				scale_mode = proportional
				text_case = Original
				z_priority = 65
			}
		endif
		if <line6_pod_id> :desc_resolvealias Name = scrolling_text_window2
			text = qs(0xb13f3841)
			CreateScreenElement {
				Type = ContainerElement
				parent = <resolved_id>
				id = <scroll_id2>
				Pos = (0.0, 0.0)
				just = [left top]
				Scale = 0.75
			}
			<scroll_id1> :obj_spawnscript line6_pod_scrolling_text params = {parent = <resolved_id> scroll_id = <scroll_id2> text = <text> Scale = 0.75 time = 10}
		endif
	else
		<line6_pod_id> :se_setprops helper_description_text = qs(0xba912d99)
		<line6_pod_id> :se_setprops code_box_alpha = 0 time = 0.1
		<line6_pod_id> :SetTags {code_box = 0}
		if ScreenElementExists id = <scroll_id1>
			DestroyScreenElement id = <scroll_id1>
		endif
		if ScreenElementExists id = <scroll_id2>
			DestroyScreenElement id = <scroll_id2>
		endif
		SoundEvent \{event = recording_stop}
	endif
endscript

script line6_pod_scrolling_text \{Scale = 1
		parent = root_window}
	CreateScreenElement {
		Type = TextElement
		parent = <scroll_id>
		just = [left top]
		Pos = (0.0, 0.0)
		Scale = 1.0
		text = <text>
		font = fontgrid_text_a3
		rgba = [224 , 224 , 224 , 255]
		z_priority = 65
	}
	GetScreenElementDims id = <id>
	new_width = (<width> + 50)
	CreateScreenElement {
		Type = TextElement
		parent = <scroll_id>
		just = [left top]
		Pos = ((1.0, 0.0) * <new_width>)
		Scale = 1.0
		text = <text>
		font = fontgrid_text_a3
		rgba = [224 , 224 , 224 , 255]
		z_priority = 65
	}
	<scroll_id> :se_setprops Pos = (0.0, 0.0)
	begin
	<scroll_id> :se_setprops Pos = ((-1.0, 0.0) * (<new_width> * <Scale>)) time = <time>
	<scroll_id> :se_waitprops
	<scroll_id> :se_setprops Pos = (0.0, 0.0)
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
	formatText checksumName = line6_pod_id 'line6_pod_%a' a = <select_player>
	<line6_pod_id> :SetTags {previous_effect = <effect>}
	<line6_pod_id> :SetProps effect_text = (<op_array> [<curr_effect>].name_text)
	<line6_pod_id> :SetProps amp_text = (<op_array> [<curr_effect>].amp_text)
	<line6_pod_id> :SetProps fx_text = (<op_array> [<curr_effect>].fx_text)
	<line6_pod_id> :SetProps cab_text = (<op_array> [<curr_effect>].cab_text)
endscript

script line6_pod_remove 
	SoundEvent \{event = jam_mode_fxhud_off}
	KillSpawnedScript \{Name = line6_pod_scrolling_text}
	getplayerinfo <select_player> jam_instrument
	guitar_jam_effects_toggle_active jam_instrument = <jam_instrument> force_state = On
	printf \{channel = jam_mode
		qs(0xd6a9a3eb)}
	if ScreenElementExists id = <line6_pod_id>
		if NOT ($jam_advanced_record = 1)
			end_pos = (0.0, -400.0)
		else
			end_pos = (-222.0, -600.0)
		endif
		<line6_pod_id> :legacydomorph Pos = <end_pos> time = 0.1
		LaunchEvent target = <line6_pod_id> Type = unfocus
		DestroyScreenElement id = <line6_pod_id>
	endif
	if ScreenElementExists id = <line6_pod_window_element_id>
		DestroyScreenElement id = <line6_pod_window_element_id>
	endif
	if NOT ($jam_advanced_record = 1)
		jam_create_player_info Player = <select_player> player_cont = <player_cont> jam_create_player_info
		jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = 1
	else
		jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = -1
		KillSpawnedScript \{Name = jam_highway_select_quantize}
		SpawnScriptNow \{jam_highway_select_quantize
			id = jam_recording_spawns}
	endif
	if ($jam_tutorial_status = Active)
		<curr_effect> = ($jam_current_instrument_effects [<jam_instrument>])
		broadcastevent Type = jam_tutorial_changed_effect data = {effect = <curr_effect>}
	endif
	KillSpawnedScript \{Name = guitar_jam_settings_preview_effect}
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
	GetArraySize <op_array>
	if NOT ($cheat_line6unlock = 1)
		if (<jam_instrument> = 0)
			<array_Size> = $num_unlocked_line6_effect_rhythm
		else
			<array_Size> = $num_unlocked_line6_effect_lead
		endif
	endif
	if GotParam \{up}
		SoundEvent \{event = line6_scroll_up}
		<effect> = (<effect> + 1)
		if (<effect> >= <array_Size>)
			<effect> = 0
		endif
		SetArrayElement ArrayName = jam_current_instrument_effects globalarray index = <jam_instrument> NewValue = <effect>
		<line6_pod_id> :SetProps up_arrow_scale = 1.7
		<line6_pod_id> :SetProps up_arrow_scale = 1.2 time = 0.15
	else
		SoundEvent \{event = line6_scroll_up}
		<effect> = (<effect> - 1)
		if (<effect> < 0)
			<effect> = (<array_Size> - 1)
		endif
		SetArrayElement ArrayName = jam_current_instrument_effects globalarray index = <jam_instrument> NewValue = <effect>
		<line6_pod_id> :SetProps down_arrow_scale = 1.7
		<line6_pod_id> :SetProps down_arrow_scale = 1.2 time = 0.15
	endif
	if (<jam_instrument> = 0)
		stopsound \{$jam_settings_effect_rhythm_sample
			fade_time = 0.1
			fade_type = linear}
		Wait \{0.15
			Seconds}
	endif
	if (<jam_instrument> = 1)
		stopsound \{$jam_settings_effect_lead_sample
			fade_time = 0.1
			fade_type = linear}
		Wait \{0.15
			Seconds}
	endif
	guitar_jam_effects_toggle_active jam_instrument = <jam_instrument> force_state = On
	line6_pod_update_effect select_player = <select_player> line6_pod_id = <line6_pod_id>
	SpawnScriptNow guitar_jam_settings_preview_effect params = {jam_instrument = <jam_instrument>}
endscript

script line6_pod_back 
	getplayerinfo <select_player> jam_instrument
	formatText checksumName = line6_pod_id 'line6_pod_%a' a = <select_player>
	<line6_pod_id> :GetTags
	SetArrayElement ArrayName = jam_current_instrument_effects globalarray index = <jam_instrument> NewValue = <previous_effect>
	line6_pod_remove <...>
	if ($jam_advanced_record)
		jam_recording_pause \{params = {
				back_to_jam_band = 0
			}}
	else
		jam_band_pause select_player = <select_player> player_cont = <player_cont> event_cont = <event_cont>
	endif
	if ScreenElementExists id = <line6_pod_window_element_id>
		DestroyScreenElement id = <line6_pod_window_element_id>
	endif
endscript
jam_settings_effect_lead_sample = NULL
jam_settings_effect_rhythm_sample = NULL

script guitar_jam_settings_preview_effect 
	if (<jam_instrument> = 0)
		stopsound \{$jam_settings_effect_rhythm_sample
			fade_time = 0.1
			fade_type = linear}
		Wait \{1
			gameframe}
		jam_get_sample_checksum \{fret = 0
			string = 0
			Type = 0
			jam_instrument = 0
			chord_type = 0}
		PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_rhythmguitar
		Change jam_settings_effect_rhythm_sample = <sample_checksum>
	else
		stopsound \{$jam_settings_effect_lead_sample
			fade_time = 0.1
			fade_type = linear}
		Wait \{1
			gameframe}
		jam_get_sample_checksum \{fret = 0
			string = 0
			Type = 0
			jam_instrument = 1}
		PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_leadguitar
		Change jam_settings_effect_lead_sample = <sample_checksum>
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
	broadcastevent \{Type = jam_open_drumkit_menu}
endscript

script guitar_jam_change_drum_kit 
	formatText checksumName = selector_id 'pause_submenu_drum_kit_selector_%b' b = <Player>
	formatText checksumName = option_id 'pause_submenu_drum_kit_options_%b_%c' b = <Player> c = <option_index>
	<selector_id> :SetProps parent = <option_id>
	LaunchEvent Type = unfocus target = <option_id>
	LaunchEvent Type = unfocus target = <vmenu_options_submenu>
	GetArraySize \{$drum_kits}
	if ((<option_index> >= <array_Size>) || (<option_index> < 0))
		<option_index> = 0
	endif
	Change jam_current_drum_kit = <option_index>
	setsonginfo \{drum_kit = $jam_current_drum_kit}
	loaddrumkitall drum_kit = ($drum_kits [<option_index>].string_id) percussion_kit = ($drum_kits [<option_index>].percussion_string_id) reset_percussion = 0 async = 0
	formatText checksumName = cur_kit 'current_drumkit_txt_%a' a = <Player>
	if ScreenElementExists id = <cur_kit>
		<cur_kit> :se_setprops text = (($pause_drum_kit_options) [<option_index>].name_text)
	endif
	LaunchEvent Type = focus target = <option_id>
	if ($jam_tutorial_status = Active)
		broadcastevent Type = jam_change_drum_kit data = {new_kit = <option_index>}
	endif
	<respawn> = 0
	if ($jam_advanced_record = 0)
		formatText checksumName = player_info_element 'player_info_element_%a' a = <Player>
		formatText TextName = extra_info_text qs(0x4d4555da) s = (($pause_drum_kit_options) [<option_index>].name_text)
		<respawn> = 1
		if ScreenElementExists id = <player_info_element>
			<player_info_element> :se_setprops extra_info_text = <extra_info_text>
		endif
	endif
	jam_band_remove_pause_submenu choose vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <Player> respawn_input = <respawn>
endscript

script jam_drum_kit_preview 
	LaunchEvent Type = unfocus target = <option_id>
	LaunchEvent Type = unfocus target = <vmenu_options_submenu>
	old_drum_kit = ($jam_current_drum_kit)
	loaddrumkitall drum_kit = ($drum_kits [<option_index>].string_id) percussion_kit = ($drum_kits [<option_index>].percussion_string_id) async = 0
	GetArraySize \{$drum_kits}
	if ((<option_index> >= <array_Size>) || (<option_index> < 0))
		<option_index> = 0
	endif
	Change jam_current_drum_kit = <option_index>
	jam_input_drum_strum hold_pattern = 1048576 velocity = 100 controller = <controller> buss = jammode_drums select_player = <Player> loop_pitch = 0 Loop
	Wait \{0.2
		Seconds}
	jam_input_drum_strum hold_pattern = 4096 velocity = 100 controller = <controller> buss = jammode_drums select_player = <Player> loop_pitch = 0 Loop
	Wait \{0.2
		Seconds}
	jam_input_drum_strum hold_pattern = 16 velocity = 100 controller = <controller> buss = jammode_drums select_player = <Player> loop_pitch = 0 Loop
	Wait \{0.2
		Seconds}
	jam_input_drum_strum hold_pattern = 65536 velocity = 100 controller = <controller> buss = jammode_drums select_player = <Player> loop_pitch = 0 Loop
	Wait \{0.2
		Seconds}
	jam_input_drum_strum hold_pattern = 256 velocity = 100 controller = <controller> buss = jammode_drums select_player = <Player> loop_pitch = 0 Loop
	Wait \{0.2
		Seconds}
	jam_input_drum_strum hold_pattern = 1 velocity = 100 controller = <controller> buss = jammode_drums select_player = <Player> loop_pitch = 0 Loop
	Wait \{0.2
		Seconds}
	jam_input_drum_strum hold_pattern = 1048576 velocity = 100 controller = <controller> buss = jammode_drums select_player = <Player> loop_pitch = 0 Loop percussion = 1
	Wait \{0.2
		Seconds}
	jam_input_drum_strum hold_pattern = 4096 velocity = 100 controller = <controller> buss = jammode_drums select_player = <Player> loop_pitch = 0 Loop percussion = 1
	Wait \{0.2
		Seconds}
	jam_input_drum_strum hold_pattern = 16 velocity = 100 controller = <controller> buss = jammode_drums select_player = <Player> loop_pitch = 0 Loop percussion = 1
	Wait \{0.2
		Seconds}
	jam_input_drum_strum hold_pattern = 65536 velocity = 100 controller = <controller> buss = jammode_drums select_player = <Player> loop_pitch = 0 Loop percussion = 1
	Wait \{0.2
		Seconds}
	jam_input_drum_strum hold_pattern = 256 velocity = 100 controller = <controller> buss = jammode_drums select_player = <Player> loop_pitch = 0 Loop percussion = 1
	Wait \{0.2
		Seconds}
	jam_input_drum_strum hold_pattern = 1 velocity = 100 controller = <controller> buss = jammode_drums select_player = <Player> loop_pitch = 0 Loop percussion = 1
	Wait \{0.2
		Seconds}
	Change jam_current_drum_kit = <old_drum_kit>
	LaunchEvent Type = focus target = <option_id>
	LaunchEvent Type = focus target = <vmenu_options_submenu>
	printf \{channel = jam_mode
		qs(0x917e367f)}
endscript

script guitar_jam_drum_kit_exit 
	if ($jam_tutorial_status = Active)
		return
	endif
	LaunchEvent Type = unfocus target = <option_id>
	LaunchEvent Type = unfocus target = <vmenu_options_submenu>
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
	broadcastevent \{Type = jam_open_melodykit_menu}
endscript

script guitar_jam_change_melody_kit 
	formatText checksumName = selector_id 'pause_submenu_melody_kit_selector_%b' b = <Player>
	formatText checksumName = option_id 'pause_submenu_melody_kit_options_%b_%c' b = <Player> c = <option_index>
	<selector_id> :SetProps parent = <option_id>
	LaunchEvent Type = unfocus target = <option_id>
	LaunchEvent Type = unfocus target = <vmenu_options_submenu>
	loadmelodykit melody_kit = <option_index>
	<respawn> = 0
	if ($jam_advanced_record = 0)
		<respawn> = 1
		formatText checksumName = player_info_element 'player_info_element_%a' a = <Player>
		formatText TextName = extra_info_text qs(0x4d4555da) s = (($pause_melody_kit_options) [<option_index>].name_text)
		if ScreenElementExists id = <player_info_element>
			<player_info_element> :se_setprops extra_info_text = <extra_info_text>
		endif
	endif
	LaunchEvent Type = focus target = <option_id>
	jam_band_remove_pause_submenu choose vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <Player> respawn_input = <respawn>
	if ($game_mode = training)
		broadcastevent Type = jam_tutorial_changed_melody_kit data = {melody_kit = <option_index>}
	endif
endscript

script jam_melody_kit_preview 
	printf \{channel = jam_mode
		qs(0x83543c6b)}
	LaunchEvent Type = unfocus target = <option_id>
	LaunchEvent Type = unfocus target = <vmenu_options_submenu>
	old_melody_kit = ($jam_current_melody_kit)
	loadmelodykit melody_kit = <option_index>
	stopsound unique_id = ($jam_input_current_melody) fade_type = linear fade_time = 0.05
	PlaySound $melody_sample pitch = (0 + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_vox send_vol2 = -24 pan1x = ($jam_melody_pan) pan1y = 1.0
	Change jam_input_current_melody = <unique_id>
	Wait \{1
		Second}
	stopsound unique_id = ($jam_input_current_melody) fade_type = linear fade_time = 0.05
	Change jam_current_melody_kit = <old_melody_kit>
	LaunchEvent Type = focus target = <option_id>
	LaunchEvent Type = focus target = <vmenu_options_submenu>
endscript

script guitar_jam_melody_kit_exit 
	if ($jam_tutorial_status = Active)
		return
	endif
	LaunchEvent Type = unfocus target = <option_id>
	LaunchEvent Type = unfocus target = <vmenu_options_submenu>
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
	formatText checksumName = selector_id 'pause_submenu_bass_kit_selector_%b' b = <Player>
	formatText checksumName = option_id 'pause_submenu_bass_kit_options_%b_%c' b = <Player> c = <option_index>
	<selector_id> :SetProps parent = <option_id>
	LaunchEvent Type = unfocus target = <option_id>
	LaunchEvent Type = unfocus target = <vmenu_options_submenu>
	if (<option_index> = 0)
		Change \{bass_kit_mode = 0}
	else
		loadbasskit bass_kit = <option_index>
	endif
	<respawn> = 0
	if ($jam_advanced_record = 0)
		<respawn> = 1
		formatText checksumName = player_info_element 'player_info_element_%a' a = <Player>
		if ScreenElementExists id = <player_info_element>
			if (<option_index> = 0)
				<player_info_element> :se_setprops extra_info_text = qs(0x00000000)
				RunScriptOnScreenElement id = <player_info_element> legacydomorph params = {Pos = (3.0, 465.0) time = 0.1}
			else
				formatText TextName = extra_info_text qs(0x4d4555da) s = (($pause_bass_kit_options) [<option_index>].name_text)
				<player_info_element> :se_setprops extra_info_text = <extra_info_text>
				RunScriptOnScreenElement id = <player_info_element> legacydomorph params = {Pos = (3.0, 445.0) time = 0.1}
			endif
		endif
	endif
	LaunchEvent Type = focus target = <option_id>
	jam_band_remove_pause_submenu choose vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <Player> respawn_input = <respawn>
	if ($game_mode = training)
		broadcastevent Type = jam_tutorial_changed_bass_kit data = {bass_kit = <option_index>}
	endif
endscript

script jam_bass_kit_preview 
	LaunchEvent Type = unfocus target = <option_id>
	LaunchEvent Type = unfocus target = <vmenu_options_submenu>
	old_bass_kit = ($jam_current_bass_kit)
	previous_mode = ($bass_kit_mode)
	if (<option_index> = 0)
		Change \{bass_kit_mode = 0}
		jam_get_sample Player = <Player> button = 1 sample_type = 0 tilt = 0
		stopsound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = 0.05
		PlaySound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 5 buss = jammode_bass release_function = linear release_time = 10.0 release_length = 0.02 send_vol2 = -18
	else
		Change \{bass_kit_mode = 1}
		loadbasskit bass_kit = <option_index> preview = 1
		stopsound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = 0.05
		PlaySound $bass_kit_sample pitch = (0 + (($jam_current_tuning) / 10.0)) vol = 5 buss = jammode_bass send_vol2 = -24 pan1y = 1.0
	endif
	Change bass_kit_mode = <previous_mode>
	Change jam_input_current_bass = <unique_id>
	Wait \{1
		Second}
	stopsound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = 0.05
	LaunchEvent Type = focus target = <option_id>
	LaunchEvent Type = focus target = <vmenu_options_submenu>
endscript

script guitar_jam_bass_kit_exit 
	if ($jam_tutorial_status = Active)
		return
	endif
	LaunchEvent Type = unfocus target = <option_id>
	LaunchEvent Type = unfocus target = <vmenu_options_submenu>
	getsonginfo
	if NOT GotParam \{bass_kit}
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
	formatText checksumName = selector_id 'pause_submenu_drum_loop_selector_%b' b = <Player>
	formatText checksumName = option_id 'pause_submenu_drum_loop_options_%b_%c' b = <Player> c = <option_index>
	<selector_id> :SetProps parent = <option_id>
	Change jam_current_drum_loop = <option_index>
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
	formatText checksumName = selector_id 'pause_submenu_arpeggiator_loop_selector_%b' b = <Player>
	formatText checksumName = option_id 'pause_submenu_arpeggiator_loop_options_%b_%c' b = <Player> c = <option_index>
	getplayerinfo <Player> jam_instrument
	<selector_id> :SetProps parent = <option_id>
	SetArrayElement ArrayName = jam_current_arpeggiator globalarray index = <jam_instrument> NewValue = <option_index>
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
	formatText checksumName = selector_id 'pause_submenu_arpeggiator_type_selector_%b' b = <Player>
	formatText checksumName = option_id 'pause_submenu_arpeggiator_type_options_%b_%c' b = <Player> c = <option_index>
	getplayerinfo <Player> jam_instrument
	<selector_id> :SetProps parent = <option_id>
	SetArrayElement ArrayName = jam_current_arpeggiator_type globalarray index = <jam_instrument> NewValue = <option_index>
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
		Change \{jam_click_track = 0}
	else
		Change \{jam_click_track = 1}
	endif
	<Player> = 1
	begin
	guitar_jam_settings_update_click_text submenu_name = <submenu_name> Player = <Player> option_index = <option_index>
	<Player> = (<Player> + 1)
	repeat ($num_jam_players)
endscript

script guitar_jam_settings_update_click_text 
	<click_text> = qs(0x621e0063)
	if ($jam_click_track = 1)
		<click_text> = qs(0xd9eb7793)
	endif
	formatText checksumName = option_text_id 'pause_submenu_%a_optext_%b_%c' a = <submenu_name> b = <Player> c = <option_index>
	if ScreenElementExists id = <option_text_id>
		<option_text_id> :se_setprops text = <click_text>
	endif
endscript

script create_jam_settings_arrows \{pos_x = 72}
	formatText checksumName = setting_arrow_up 'setting_arrow_up_%a' a = <Player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		id = <setting_arrow_up>
		texture = up_arrow
		just = [center center]
		Pos = (((1.0, 0.0) * <pos_x>) + (8.0, -5.0))
		Scale = 0.5
		z_priority = 100
	}
	formatText checksumName = setting_arrow_down 'setting_arrow_down_%a' a = <Player>
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		id = <setting_arrow_down>
		texture = down_arrow
		just = [center center]
		Pos = (((1.0, 0.0) * <pos_x>) + (8.0, 5.0))
		Scale = 0.5
		z_priority = 100
	}
endscript

script morph_jam_settings_arrows \{no_sound = 0}
	if GotParam \{down}
		if (<no_sound> = 0)
			SoundEvent \{event = ghtunes_ui_scroll}
		endif
		formatText checksumName = setting_arrow_down 'setting_arrow_down_%a' a = <Player>
		if ScreenElementExists id = <setting_arrow_down>
			legacydoscreenelementmorph id = <setting_arrow_down> Scale = 1.3 relative_scale
			legacydoscreenelementmorph id = <setting_arrow_down> Scale = 1.0 relative_scale time = 0.1
		endif
	elseif GotParam \{up}
		if (<no_sound> = 0)
			SoundEvent \{event = ghtunes_ui_scroll}
		endif
		formatText checksumName = setting_arrow_up 'setting_arrow_up_%a' a = <Player>
		if ScreenElementExists id = <setting_arrow_up>
			legacydoscreenelementmorph id = <setting_arrow_up> Scale = 1.3 relative_scale
			legacydoscreenelementmorph id = <setting_arrow_up> Scale = 1.0 relative_scale time = 0.1
		endif
	elseif GotParam \{pandown}
		if (<no_sound> = 0)
			SoundEvent event = ghtunes_ui_scroll_pan sfx_pan = <sfx_pan>
		endif
		formatText checksumName = setting_arrow_down 'setting_arrow_down_%a' a = <Player>
		if ScreenElementExists id = <setting_arrow_down>
			legacydoscreenelementmorph id = <setting_arrow_down> Scale = 1.3 relative_scale
			legacydoscreenelementmorph id = <setting_arrow_down> Scale = 1.0 relative_scale time = 0.1
		endif
	elseif GotParam \{panup}
		if (<no_sound> = 0)
			SoundEvent event = ghtunes_ui_scroll_pan sfx_pan = <sfx_pan>
		endif
		formatText checksumName = setting_arrow_up 'setting_arrow_up_%a' a = <Player>
		if ScreenElementExists id = <setting_arrow_up>
			legacydoscreenelementmorph id = <setting_arrow_up> Scale = 1.3 relative_scale
			legacydoscreenelementmorph id = <setting_arrow_up> Scale = 1.0 relative_scale time = 0.1
		endif
	endif
endscript

script destroy_jam_settings_arrows 
	formatText checksumName = setting_arrow_up 'setting_arrow_up_%a' a = <Player>
	safe_destroy id = <setting_arrow_up>
	formatText checksumName = setting_arrow_down 'setting_arrow_down_%a' a = <Player>
	safe_destroy id = <setting_arrow_down>
endscript

script guitar_jam_settings_volume 
	getplayerinfo <Player> jam_instrument
	getplayerinfo <Player> controller
	SetScreenElementProps id = <vmenu_options_submenu> block_events
	formatText checksumName = volume_event_handler 'jam_volume_event_handler_%s' s = <Player>
	if ($jam_advanced_record = 1)
		event_handler_parent = jam_studio_element
	else
		event_handler_parent = jam_band_container
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <event_handler_parent>
		id = <volume_event_handler>
		z_priority = 50
		exclusive_device = <controller>
		event_handlers = [
			{pad_up guitar_jam_settings_volume_up params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> volume_event_handler = <volume_event_handler> Player = <Player>}}
			{pad_down guitar_jam_settings_volume_down params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> volume_event_handler = <volume_event_handler> Player = <Player>}}
			{pad_choose guitar_jam_settings_volume_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> volume_event_handler = <volume_event_handler> Player = <Player>}}
			{pad_circle guitar_jam_settings_volume_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> volume_event_handler = <volume_event_handler> Player = <Player>}}
			{pad_start guitar_jam_settings_volume_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> volume_event_handler = <volume_event_handler> Player = <Player>}}
		]
	}
	create_jam_settings_arrows Player = <Player> parent = <option_id>
	LaunchEvent Type = focus target = <volume_event_handler>
endscript

script guitar_jam_settings_volume_up 
	getplayerinfo <Player> jam_instrument
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	<Volume> = (<Volume> + 1)
	<no_click> = 0
	if (<Volume> > 10)
		<Volume> = 10
		<no_click> = 1
	endif
	settrackinfo track = ($jam_tracks [<jam_instrument>].id) Volume = <Volume>
	guitar_jam_settings_update_volume Player = <Player> option_text_id = <option_text_id>
	morph_jam_settings_arrows Player = <Player> up no_sound = <no_click>
	SpawnScriptNow guitar_jam_settings_preview_note params = {<...>}
endscript

script guitar_jam_settings_volume_down 
	getplayerinfo <Player> jam_instrument
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	<Volume> = (<Volume> - 1)
	<no_click> = 0
	if (<Volume> < 0)
		<Volume> = 0
		<no_click> = 1
	endif
	settrackinfo track = ($jam_tracks [<jam_instrument>].id) Volume = <Volume>
	guitar_jam_settings_update_volume Player = <Player> option_text_id = <option_text_id>
	morph_jam_settings_arrows Player = <Player> down no_sound = <no_click>
	SpawnScriptNow guitar_jam_settings_preview_note params = {<...>}
endscript

script guitar_jam_settings_volume_back 
	generic_menu_pad_back_sound
	SetScreenElementProps id = <vmenu_options_submenu> unblock_events
	DestroyScreenElement id = <volume_event_handler>
	destroy_jam_settings_arrows Player = <Player>
	formatText checksumName = preview_sample 'jam_settings_preview_sample_%s' s = <Player>
	stopsound ($<preview_sample>) fade_time = 0.1 fade_type = linear
endscript

script guitar_jam_settings_update_volume 
	if NOT GotParam \{jam_instrument}
		getplayerinfo <Player> jam_instrument
	endif
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	if NOT GotParam \{Volume}
		return
	endif
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	new_vol = ((10 - <Volume>) * 2)
	if (<Volume> = 0)
		<new_vol> = 100
	endif
	switch <jam_instrument>
		case 0
		setsoundbussparams {jammode_rhythmguitar = {vol = (($default_BussSet.jammode_rhythmguitar.vol) - <new_vol>)}}
		case 1
		setsoundbussparams {jammode_leadguitar = {vol = (($default_BussSet.jammode_leadguitar.vol) - <new_vol>)}}
		case 2
		setsoundbussparams {jammode_bass = {vol = (($default_BussSet.jammode_bass.vol) - <new_vol>)}}
		case 3
		setsoundbussparams {jammode_drums = {vol = (($default_BussSet.jammode_drums.vol) - <new_vol>)}}
		case 4
		setsoundbussparams {jammode_vox = {vol = (($default_BussSet.jammode_vox.vol) - <new_vol>)}}
	endswitch
	formatText TextName = volume_text qs(0x414080a3) s = <Volume>
	if GotParam \{option_text_id}
		<option_text_id> :SetProps text = <volume_text>
	endif
endscript

script jam_init_volumes 
	setsoundbussparams {guitar_jammode = {vol = ($default_BussSet.guitar_jammode.vol)}}
	setsoundbussparams {user_drums = {vol = ($default_BussSet.user_drums.vol)}}
	setsoundbussparams {drums_jammode = {vol = ($default_BussSet.drums_jammode.vol)}}
	setsoundbussparams {jammode_drums_cymbals = {vol = ($default_BussSet.jammode_drums_cymbals.vol)}}
	setsoundbussparams {jammode_drums_toms = {vol = ($default_BussSet.jammode_drums_toms.vol)}}
	setsoundbussparams {jammode_drums_kick = {vol = ($default_BussSet.jammode_drums_kick.vol)}}
	setsoundbussparams {jammode_drums_snare = {vol = ($default_BussSet.jammode_drums_snare.vol)}}
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	if NOT GotParam \{no_tracks}
		gettrackinfo track = ($jam_tracks [<index>].id)
	else
		Volume = 8
	endif
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
	<index> = (<index> + 1)
	repeat <array_Size>
endscript

script guitar_jam_settings_pan 
	getplayerinfo <Player> jam_instrument
	getplayerinfo <Player> controller
	SetScreenElementProps id = <vmenu_options_submenu> block_events
	formatText checksumName = pan_event_handler 'jam_pan_event_handler_%s' s = <Player>
	if ($jam_advanced_record = 1)
		event_handler_parent = jam_studio_element
	else
		event_handler_parent = jam_band_container
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <event_handler_parent>
		id = <pan_event_handler>
		z_priority = 50
		exclusive_device = <controller>
		event_handlers = [
			{pad_down guitar_jam_settings_pan_left params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> pan_event_handler = <pan_event_handler> Player = <Player>}}
			{pad_up guitar_jam_settings_pan_right params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> pan_event_handler = <pan_event_handler> Player = <Player>}}
			{pad_choose guitar_jam_settings_pan_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> pan_event_handler = <pan_event_handler> Player = <Player>}}
			{pad_circle guitar_jam_settings_pan_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> pan_event_handler = <pan_event_handler> Player = <Player>}}
			{pad_start guitar_jam_settings_pan_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> pan_event_handler = <pan_event_handler> Player = <Player>}}
		]
	}
	create_jam_settings_arrows Player = <Player> parent = <option_id>
	LaunchEvent Type = focus target = <pan_event_handler>
endscript

script guitar_jam_settings_pan_right 
	getplayerinfo <Player> jam_instrument
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	<pan> = (<pan> + 1)
	<no_click> = 0
	if (<pan> > 10)
		<pan> = 10
		<no_click> = 1
	endif
	settrackinfo track = ($jam_tracks [<jam_instrument>].id) pan = <pan>
	guitar_jam_settings_update_pan Player = <Player> option_text_id = <option_text_id>
	morph_jam_settings_arrows Player = <Player> panup no_sound = <no_click> sfx_pan = <pan>
endscript

script guitar_jam_settings_pan_left 
	getplayerinfo <Player> jam_instrument
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	<pan> = (<pan> - 1)
	<no_click> = 0
	if (<pan> < -10)
		<pan> = -10
		<no_click> = 1
	endif
	settrackinfo track = ($jam_tracks [<jam_instrument>].id) pan = <pan>
	guitar_jam_settings_update_pan Player = <Player> option_text_id = <option_text_id>
	morph_jam_settings_arrows Player = <Player> pandown no_sound = <no_click> sfx_pan = <pan>
endscript

script guitar_jam_settings_pan_back 
	generic_menu_pad_back_sound
	SetScreenElementProps id = <vmenu_options_submenu> unblock_events
	DestroyScreenElement id = <pan_event_handler>
	destroy_jam_settings_arrows Player = <Player>
endscript

script guitar_jam_settings_update_pan 
	if NOT GotParam \{jam_instrument}
		getplayerinfo <Player> jam_instrument
	endif
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	if NOT GotParam \{pan}
		return
	endif
	new_pan = (<pan> / 10.0)
	if (<pan> > 0)
		formatText TextName = pan_text qs(0x79798475) s = <pan>
	elseif (<pan> = 0)
		formatText TextName = pan_text qs(0x7c35fa23) s = <pan>
	else
		formatText TextName = pan_text qs(0xad38bbaa) s = (0 - <pan>)
	endif
	switch <jam_instrument>
		case 0
		setdspeffectparams effects = [{effect = pod2reverb Name = pod2reverb_rhythm prerevpan = <new_pan>}]
		case 1
		setdspeffectparams effects = [{effect = pod2reverb Name = pod2reverb_lead prerevpan = <new_pan>}]
		case 4
		Change jam_melody_pan = <new_pan>
		default
		formatText TextName = pan_text qs(0xa96a7710) s = <pan>
	endswitch
	if GotParam \{option_text_id}
		<option_text_id> :SetProps text = <pan_text>
	endif
endscript

script jam_init_pan 
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	gettrackinfo track = ($jam_tracks [<index>].id)
	new_pan = (<pan> / 10.0)
	switch <index>
		case 0
		setdspeffectparams effects = [{effect = pod2reverb Name = pod2reverb_rhythm prerevpan = <new_pan>}]
		case 1
		setdspeffectparams effects = [{effect = pod2reverb Name = pod2reverb_lead prerevpan = <new_pan>}]
		case 4
		Change jam_melody_pan = <new_pan>
	endswitch
	<index> = (<index> + 1)
	repeat <array_Size>
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
		Change \{jam_reverb = 1}
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
		Change \{jam_reverb = 0}
	endif
endscript

script guitar_jam_settings_bpm 
	getplayerinfo <Player> controller
	SetScreenElementProps id = <vmenu_options_submenu> block_events
	formatText checksumName = bpm_event_handler 'jam_bpm_event_handler_%s' s = <Player>
	if ($jam_advanced_record = 1)
		event_handler_parent = jam_studio_element
	else
		event_handler_parent = jam_band_container
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <event_handler_parent>
		id = <bpm_event_handler>
		z_priority = 50
		exclusive_device = <controller>
		event_handlers = [
			{pad_up guitar_jam_settings_bpm_updown params = {up Player = <Player> parent = <bpm_event_handler> option_text_id = <option_text_id>}}
			{pad_down guitar_jam_settings_bpm_updown params = {down Player = <Player> parent = <bpm_event_handler> option_text_id = <option_text_id>}}
			{pad_choose guitar_jam_settings_bpm_back params = {vmenu_options_submenu = <vmenu_options_submenu> parent = <bpm_event_handler> bpm_event_handler = <bpm_event_handler> Player = <Player>}}
			{pad_circle guitar_jam_settings_bpm_back params = {vmenu_options_submenu = <vmenu_options_submenu> parent = <bpm_event_handler> bpm_event_handler = <bpm_event_handler> Player = <Player>}}
			{pad_start guitar_jam_settings_bpm_back params = {vmenu_options_submenu = <vmenu_options_submenu> parent = <bpm_event_handler> bpm_event_handler = <bpm_event_handler> Player = <Player>}}
		]
	}
	<bpm_event_handler> :SetTags {new_bpm = ($jam_current_bpm)}
	create_jam_settings_arrows Player = <Player> parent = <option_id>
	LaunchEvent Type = focus target = <bpm_event_handler>
endscript

script guitar_jam_settings_bpm_updown 
	getplayerinfo <Player> jam_instrument
	<parent> :GetTags
	<bpm> = <new_bpm>
	if GotParam \{up}
		<no_click> = 1
		if (<bpm> < ($jam_max_bpm))
			<bpm> = (<bpm> + 1)
			<no_click> = 0
		endif
		morph_jam_settings_arrows Player = <Player> up no_sound = <no_click>
	elseif GotParam \{down}
		<no_click> = 1
		if (<bpm> > ($jam_min_bpm))
			<bpm> = (<bpm> - 1)
			<no_click> = 0
		endif
		morph_jam_settings_arrows Player = <Player> down no_sound = <no_click>
	endif
	<parent> :SetTags {new_bpm = <bpm>}
	formatText TextName = bpm_text qs(0x59f35cc2) s = <bpm>
	if GotParam \{option_text_id}
		<option_text_id> :SetProps text = <bpm_text>
	endif
endscript

script guitar_jam_settings_update_bpm 
	getplayerinfo <Player> jam_instrument
	gettrackinfo track = ($jam_tracks [<jam_instrument>].id)
	formatText TextName = bpm_text qs(0x59f35cc2) s = <bpm>
	if GotParam \{option_text_id}
		<option_text_id> :SetProps text = <bpm_text>
	endif
endscript

script guitar_jam_settings_bpm_back 
	<orig_bpm> = ($jam_current_bpm)
	if GotParam \{parent}
		<parent> :GetTags
		Change jam_current_bpm = <new_bpm>
	endif
	jam_clear_clipboards
	Change \{jam_copy_bound_low = 0}
	Change \{jam_copy_bound_high = 0}
	Change \{jam_loop_bound_low = -1}
	Change \{jam_loop_bound_high = -1}
	formatText \{checksumName = undo_clipboard_array
		'undo_clipboard'}
	if GlobalExists Name = <undo_clipboard_array> Type = array
		destroyscriptarray Name = <undo_clipboard_array>
	endif
	Change \{jam_undo_track = -1}
	song_prefix = 'editable'
	formatText checksumName = fretbar_array '%s_fretbars' s = <song_prefix> AddToStringLookup = true
	<gem_arrays> = [NULL NULL NULL NULL NULL]
	<counter> = 0
	begin
	<gem_array> = ($jam_tracks [<counter>].gem_array)
	SetArrayElement ArrayName = gem_arrays ResolveGlobals = 0 index = <counter> NewValue = <gem_array>
	<counter> = (<counter> + 1)
	repeat 5
	markers = editable_jam_markers
	<bpm> = ($jam_current_bpm)
	changesongbpm current_bpm = <orig_bpm> new_bpm = <bpm> fretbar_array = <fretbar_array> gem_arrays = <gem_arrays> markers_array = <markers> song_length = ($jam_highway_song_length)
	if ScreenElementExists \{id = jam_band_highway_playline}
		SetScreenElementProps id = jam_band_highway_playline Pos = ($jam_band_playline_pos)
	endif
	Change \{jam_highway_play_time = 0}
	suffix = '_size'
	AppendSuffixToChecksum Base = <fretbar_array> SuffixString = <suffix>
	<fretbar_size> = <appended_id>
	Change GlobalName = <fretbar_size> NewValue = 0
	jam_highway_create_fretbars
	if ScreenElementExists id = <vmenu_options_submenu>
		SetScreenElementProps id = <vmenu_options_submenu> unblock_events
	endif
	if ScreenElementExists id = <bpm_event_handler>
		DestroyScreenElement id = <bpm_event_handler>
	endif
	if (($jam_advanced_record) = 0)
		generic_menu_pad_back_sound
		KillSpawnedScript \{Name = jam_band_update_highway}
		DestroyScreenElement \{id = jam_band_highway_master}
		jam_band_create_highway \{song = editable}
	else
		if ScreenElementExists \{id = jam_highway_container_master}
			DestroyScreenElement \{id = jam_highway_container_master}
		endif
		if NOT GotParam \{no_sound}
			generic_menu_pad_back_sound
		endif
		KillSpawnedScript \{Name = create_jam_highway_notetrack}
		KillSpawnedScript \{Name = create_jam_highway_fretbars}
		jam_get_display_name FileName = ($jam_selected_song)
		formatText TextName = title_text qs(0x1bd49c2c) s = <display_name> b = $jam_current_bpm
		jam_studio_element :SetProps songtitleinfo_text = <title_text>
		jam_highway_reinit
		SpawnScriptNow \{create_jam_multiple_highways
			id = jam_recording_spawns
			params = {
				song = editable
			}}
	endif
	destroy_jam_settings_arrows Player = <Player>
	guitar_jam_simplerecops_command_stoprec no_sound select_player = <Player>
	guitar_jam_simplerecops_command_stopplay
endscript

script guitar_jam_settings_tuning 
	getplayerinfo <Player> jam_instrument
	getplayerinfo <Player> controller
	SetScreenElementProps id = <vmenu_options_submenu> block_events
	formatText checksumName = tuning_event_handler 'jam_tuning_event_handler_%s' s = <Player>
	if ($jam_advanced_record = 1)
		event_handler_parent = jam_studio_element
	else
		event_handler_parent = jam_band_container
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <event_handler_parent>
		id = <tuning_event_handler>
		z_priority = 50
		exclusive_device = <controller>
		event_handlers = [
			{pad_up guitar_jam_settings_tuning_up params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> tuning_event_handler = <tuning_event_handler> Player = <Player>}}
			{pad_down guitar_jam_settings_tuning_down params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> tuning_event_handler = <tuning_event_handler> Player = <Player>}}
			{pad_choose guitar_jam_settings_tuning_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> tuning_event_handler = <tuning_event_handler> Player = <Player>}}
			{pad_circle guitar_jam_settings_tuning_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> tuning_event_handler = <tuning_event_handler> Player = <Player>}}
			{pad_start guitar_jam_settings_tuning_back params = {vmenu_options_submenu = <vmenu_options_submenu> option_text_id = <option_text_id> tuning_event_handler = <tuning_event_handler> Player = <Player>}}
		]
	}
	create_jam_settings_arrows Player = <Player> parent = <option_id>
	LaunchEvent Type = focus target = <tuning_event_handler>
endscript

script guitar_jam_settings_tuning_up 
	tuning = $jam_current_tuning
	<tuning> = (<tuning> + 1)
	if (<tuning> > 5)
		return
	endif
	Change jam_current_tuning = <tuning>
	settrackinfo track = rhythm tuning = <tuning>
	morph_jam_settings_arrows Player = <Player> up
	KillSpawnedScript \{Name = guitar_jam_settings_preview_tuning}
	KillSpawnedScript \{Name = guitar_jam_settings_preview_note}
	SpawnScriptNow guitar_jam_settings_preview_note params = {<...>}
	guitar_jam_settings_update_tuning <...>
endscript

script guitar_jam_settings_tuning_down 
	tuning = $jam_current_tuning
	<tuning> = (<tuning> - 1)
	if (<tuning> < -5)
		return
	endif
	Change jam_current_tuning = <tuning>
	settrackinfo track = rhythm tuning = <tuning>
	morph_jam_settings_arrows Player = <Player> down
	KillSpawnedScript \{Name = guitar_jam_settings_preview_tuning}
	KillSpawnedScript \{Name = guitar_jam_settings_preview_note}
	SpawnScriptNow guitar_jam_settings_preview_note params = {<...>}
	guitar_jam_settings_update_tuning <...>
endscript

script guitar_jam_settings_tuning_back 
	generic_menu_pad_back_sound
	SetScreenElementProps id = <vmenu_options_submenu> unblock_events
	DestroyScreenElement id = <tuning_event_handler>
	destroy_jam_settings_arrows Player = <Player>
	formatText checksumName = preview_sample 'jam_settings_preview_sample_%s' s = <Player>
	stopsound ($<preview_sample>) fade_time = 0.1 fade_type = linear
endscript

script guitar_jam_settings_update_tuning 
	gettrackinfo \{track = rhythm}
	if ($jam_current_tuning > 0)
		formatText TextName = tuning_text qs(0xf5e4c97b) s = <tuning>
	else
		formatText TextName = tuning_text qs(0x0f24e557) s = <tuning>
	endif
	if GotParam \{option_text_id}
		<option_text_id> :SetProps text = <tuning_text>
	endif
endscript
jam_mute_menu_sounds = 0

script guitar_jam_settings_toggle_menu_sounds 
	if (($jam_mute_menu_sounds) = 0)
		Change \{jam_mute_menu_sounds = 1}
		setsoundbussparams \{Front_End = {
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
	Change \{jam_mute_menu_sounds = 0}
	setsoundbussparams {Front_End = {vol = ($default_BussSet.Front_End.vol)}}
	setsoundbussparams {pause_menu = {vol = ($default_BussSet.pause_menu.vol)}}
endscript

script guitar_jam_settings_update_menu_sounds_text 
	if (($jam_mute_menu_sounds) = 0)
		flip_text = ($jam_option_text_mute_on)
	else
		flip_text = ($jam_option_text_mute_off)
	endif
	if GotParam \{option_text_id}
		<option_text_id> :SetProps text = <flip_text>
	endif
endscript

script guitar_jam_settings_toggle_lefty 
	getplayerinfo <Player> lefty_flip
	if (<lefty_flip> = 0)
		<lefty_flip> = 1
		flip_text = qs(0x18e9650e)
	else
		<lefty_flip> = 0
		flip_text = qs(0x5548447e)
	endif
	if GotParam \{option_text_id}
		<option_text_id> :SetProps text = <flip_text>
	endif
	setplayerinfo <Player> lefty_flip = <lefty_flip>
	if ($jam_advanced_record = 1)
		StopRendering
		OnExitRun \{StartRendering}
		KillSpawnedScript \{Name = create_jam_highway_notetrack}
		KillSpawnedScript \{Name = create_jam_highway_fretbars}
		KillSpawnedScript \{Name = recreate_jam_highway_notetracks}
		create_studio_now_bar
		jam_highway_reinit
		SpawnScriptNow \{create_jam_multiple_highways
			id = jam_recording_spawns
			params = {
				song = editable
			}}
		new_pos = ($jam_highway_play_line_pos - (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second))
		SetScreenElementProps id = jam_highway_container Pos = (<new_pos>)
		<new_low_bound> = ($jam_highway_play_time + $jam_highway_start_low_bound)
		<new_high_bound> = ($jam_highway_play_time + $jam_highway_start_high_bound)
		CastToInteger \{new_low_bound}
		CastToInteger \{new_high_bound}
		Change jam_highway_low_bound = <new_low_bound>
		Change jam_highway_high_bound = <new_high_bound>
		jam_highway_reinit
		Wait \{10
			gameframes}
		StartRendering
	endif
endscript

script guitar_jam_settings_update_lefty_text 
	getplayerinfo <Player> lefty_flip
	if (<lefty_flip> = 1)
		flip_text = qs(0x18e9650e)
	else
		flip_text = qs(0x5548447e)
	endif
	if GotParam \{option_text_id}
		<option_text_id> :SetProps text = <flip_text>
	endif
endscript
jam_settings_preview_sample_1 = NULL
jam_settings_preview_sample_2 = NULL
jam_settings_preview_sample_3 = NULL
jam_settings_preview_sample_4 = NULL

script guitar_jam_settings_preview_note 
	formatText checksumName = preview_sample 'jam_settings_preview_sample_%s' s = <Player>
	getplayerinfo <Player> jam_instrument
	stopsound ($<preview_sample>) fade_time = 0.1 fade_type = linear
	Wait \{1
		gameframe}
	switch <jam_instrument>
		case 0
		jam_get_sample_checksum \{fret = 0
			string = 0
			Type = 0
			jam_instrument = 0}
		PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_rhythmguitar
		case 1
		jam_get_sample_checksum \{fret = 0
			string = 0
			Type = 0
			jam_instrument = 1}
		PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_leadguitar
		case 2
		jam_get_sample_checksum \{fret = 0
			string = 0
			Type = 0
			jam_instrument = 2}
		PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_bass
		case 3
		drum_kit_string = ($drum_kits [$jam_current_drum_kit].string_id)
		play_drum_sample drum_kit_string = <drum_kit_string> pad = snare velocity = 80 buss = jammode_drums
		case 4
		jam_get_single_sample_for_melody_playback \{fret = 0
			string = 0
			Type = 0
			jam_instrument = 4}
		PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_vox
	endswitch
	if NOT (<jam_instrument> = 3)
		Change GlobalName = <preview_sample> NewValue = <sample_checksum>
	endif
	Wait \{1
		Second}
	stopsound ($<preview_sample>) fade_type = linear fade_time = $jam_fade_time
endscript

script jam_band_remove_pause_submenu 
	if GotParam \{choose}
		SoundEvent \{event = recording_start}
	else
		generic_menu_pad_back_sound
	endif
	if ScreenElementExists id = <player_pause_submenu>
		DestroyScreenElement id = <player_pause_submenu>
	endif
	if ($jam_advanced_record = 1)
		clean_up_user_control_helpers
		menu_jam_band_add_control_helpers \{state = pause_menu}
	endif
	if ScreenElementExists \{id = {
				jam_pause_container
				child = clip_window_pause_submenu
			}}
		DestroyScreenElement \{id = {
				jam_pause_container
				child = clip_window_pause_submenu
			}}
	endif
	if ScreenElementExists id = <vmenu_id>
		LaunchEvent Type = focus target = <vmenu_id>
	endif
endscript

script jam_band_pause_new_instrument 
	getplayerinfo <select_player> jam_instrument
	if NOT (<jam_instrument> = $jam_mic_id)
		if StructureContains structure = ($jam_tracks [<jam_instrument>]) ui_destroy_func
			formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
			SpawnScriptNow ($jam_tracks [<jam_instrument>].ui_destroy_func) id = <jam_player_spawns> params = {Player = <select_player>}
		endif
	endif
	jam_destroy_player_info_box Player = <select_player>
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player>
	formatText checksumName = inst_cont 'inst_cont_%s' s = <select_player>
	jam_destroy_instrument select_player = <select_player> player_cont = <player_cont> inst_cont = <inst_cont>
	setplayerinfo <select_player> jam_instrument = -1
endscript

script jam_check_for_easy_backout 
endscript

script jam_band_pause_quit \{force_event = FALSE}
	Change \{jam_highway_playing = 0}
	Change \{jam_band_recording = 0}
	Change \{jam_highway_recording = 0}
	ui_event event = menu_back data = {state = uistate_jam_select_song show_popup = 0} force_event = <force_event>
	jam_recording_cleanup
	destroy_popup_warning_menu
	guitar_jam_effects_toggle_active \{jam_instrument = 0
		force_state = OFF}
	guitar_jam_effects_toggle_active \{jam_instrument = 1
		force_state = OFF}
	guitar_jam_effects_toggle_active \{jam_instrument = 2
		force_state = OFF}
	guitar_jam_effects_toggle_active \{jam_instrument = 4
		force_state = OFF}
endscript

script jam_band_pause_save_and_quit 
	jam_save_song_setup
	Change \{memcard_after_func = jam_band_pause_save_and_quit_after_func}
	ui_memcard_save_jam \{event = menu_back
		data = {
			state = uistate_jam_select_song
			editing = 1
			show_popup = 0
		}}
endscript

script jam_band_pause_save_and_quit_after_func 
	guitar_jam_effects_toggle_active \{jam_instrument = 0
		force_state = OFF}
	guitar_jam_effects_toggle_active \{jam_instrument = 1
		force_state = OFF}
	guitar_jam_effects_toggle_active \{jam_instrument = 2
		force_state = OFF}
	guitar_jam_effects_toggle_active \{jam_instrument = 4
		force_state = OFF}
	Change \{jam_highway_playing = 0}
	Change \{jam_band_recording = 0}
	Change \{jam_highway_recording = 0}
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
	Change \{memcard_after_func = jam_band_pause_save_after_func}
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
	Change \{jam_band_new_song = 0}
endscript

script jam_band_pause_save_as_text_select 
	destroy_popup_warning_menu
	jam_get_num_songs
	if (<user_song_count> < ($jam_max_user_songs))
		Change \{target_jam_camera_prop = jam_publish}
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
		formatText \{TextName = dialog
			qs(0xedf2cf45)
			s = $jam_max_user_songs}
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs(0xfb9c065f)
		textblock = {
			text = <dialog>
			Pos = (640.0, 370.0)
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
	Change \{memcard_after_func = jam_band_pause_save_as_after_func}
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
	Change \{jam_band_new_song = 0}
endscript

script jam_band_save_dialog \{dialog = 0}
	LaunchEvent Type = unfocus target = <vmenu_id>
	if ($jam_advanced_record = 0)
		destroy_jam_band_menu
		from_adv = 0
	else
		destroy_jam_recording_menu
		from_adv = 1
		ghmix_persistant_settings = {}
		AddParam structure_name = ghmix_persistant_settings Name = cur_playtime value = ($jam_highway_play_time)
		AddParam structure_name = ghmix_persistant_settings Name = cur_playline_pos value = ($jam_highway_play_line_pos)
		AddParam structure_name = ghmix_persistant_settings Name = cur_lead_octave value = ($jam_lead_octave_range)
		AddParam structure_name = ghmix_persistant_settings Name = cur_melody_octave value = ($jam_melody_octave_range)
		AddParam structure_name = ghmix_persistant_settings Name = cur_rhythm_chords value = ($jam_rhythm_chord_type)
		AddParam structure_name = ghmix_persistant_settings Name = cur_instrument value = ($jam_current_track)
		AddParam structure_name = ghmix_persistant_settings Name = cur_loop_low value = ($jam_loop_bound_low)
		AddParam structure_name = ghmix_persistant_settings Name = cur_loop_high value = ($jam_loop_bound_high)
		AddParam structure_name = ghmix_persistant_settings Name = cur_control value = ($jam_control_selected)
		AddParam structure_name = ghmix_persistant_settings Name = cur_quantize value = ($jam_current_quantize)
	endif
	clean_up_user_control_helpers
	getplayerinfo <select_player> controller
	Change primary_controller = <controller>
	switch <dialog>
		case 0
		formatText \{TextName = title
			qs(0xe3c58212)}
		formatText \{TextName = save_dialog
			qs(0x3b907ccc)}
	endswitch
	create_popup_warning_menu {
		title = <title>
		textblock = {
			text = <save_dialog>
			Pos = (640.0, 370.0)
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
	LaunchEvent Type = unfocus target = <vmenu_id>
	if ($jam_advanced_record = 0)
		destroy_jam_band_menu
		from_adv = 0
	else
		destroy_jam_recording_menu
		from_adv = 1
		ghmix_persistant_settings = {}
		AddParam structure_name = ghmix_persistant_settings Name = cur_playtime value = ($jam_highway_play_time)
		AddParam structure_name = ghmix_persistant_settings Name = cur_playline_pos value = ($jam_highway_play_line_pos)
		AddParam structure_name = ghmix_persistant_settings Name = cur_lead_octave value = ($jam_lead_octave_range)
		AddParam structure_name = ghmix_persistant_settings Name = cur_melody_octave value = ($jam_melody_octave_range)
		AddParam structure_name = ghmix_persistant_settings Name = cur_rhythm_chords value = ($jam_rhythm_chord_type)
		AddParam structure_name = ghmix_persistant_settings Name = cur_instrument value = ($jam_current_track)
		AddParam structure_name = ghmix_persistant_settings Name = cur_loop_low value = ($jam_loop_bound_low)
		AddParam structure_name = ghmix_persistant_settings Name = cur_loop_high value = ($jam_loop_bound_high)
		AddParam structure_name = ghmix_persistant_settings Name = cur_control value = ($jam_control_selected)
		AddParam structure_name = ghmix_persistant_settings Name = cur_quantize value = ($jam_current_quantize)
	endif
	clean_up_user_control_helpers
	getplayerinfo <select_player> controller
	Change primary_controller = <controller>
	create_popup_warning_menu {
		title = qs(0x5a34b03d)
		textblock = {
			text = qs(0xf61a5462)
			Pos = (640.0, 370.0)
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
	if ScreenElementExists id = <scrolling_options>
		LaunchEvent Type = unfocus target = <scrolling_options>
	endif
	if (<respawn_input> = 1)
		getplayerinfo <select_player> jam_instrument
		getplayerinfo <select_player> controller
		formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
		if NOT (<jam_instrument> = $jam_mic_id)
			if StructureContains structure = ($jam_tracks [<jam_instrument>]) ui_create_func
				formatText checksumName = inst_cont 'inst_cont_%s' s = <select_player>
				jam_destroy_fretboard Player = <select_player>
				SpawnScriptNow ($jam_tracks [<jam_instrument>].ui_create_func) id = <jam_player_spawns> params = {parent_id = <inst_cont> Player = <select_player> controller = <controller>}
			endif
			if StructureContains structure = ($jam_tracks [<jam_instrument>]) input_func
				formatText checksumName = input_spawn 'input_spawn_%s' s = <select_player>
				SpawnScriptNow ($jam_tracks [<jam_instrument>].input_func) id = <input_spawn> params = {select_player = <select_player> show_hud = 0 controller = <controller> spawn_id = <input_spawn>}
			endif
			guitar_jam_effects_toggle_ui_effect select_player = <select_player> jam_instrument = <jam_instrument>
		else
			SpawnScriptNow jam_band_activate_mic id = <jam_player_spawns> params = {select_player = <select_player>}
		endif
	endif
	if ScreenElementExists id = <player_pause>
		if NOT ($jam_advanced_record = 1)
			<player_pause> :legacydomorph Pos = (0.0, -300.0) time = 0.1
		else
			<player_pause> :legacydomorph Pos = (133.0, -500.0) time = 0.1
		endif
	endif
	if ScreenElementExists \{id = {
				jam_pause_container
				child = clip_window_pause
			}}
		DestroyScreenElement \{id = {
				jam_pause_container
				child = clip_window_pause
			}}
	endif
	formatText checksumName = effect_info_box 'effect_info_box_%a' a = <select_player>
	if ScreenElementExists id = <effect_info_box>
		formatText checksumName = player_cont 'inst_player_cont_%s' s = <select_player>
		<effect_info_box> :se_setprops Pos = (5.0, -355.0) time = 0.1
	endif
	if ScreenElementExists id = <player_pause>
		if NOT ($jam_advanced_record = 1)
			SoundEvent \{event = menu_recording_pause_panel_out}
		endif
		destroy_menu menu_id = <scrolling_options>
		DestroyScreenElement id = <player_pause>
	endif
	if ((<respawn_input> = 1) || (<respawn_input> = -1))
		if ScreenElementExists id = <event_cont>
			LaunchEvent Type = focus target = <event_cont>
		else
			return
		endif
	endif
	if ($jam_advanced_record = 1)
		SpawnScriptNow \{jam_studio_animate_mouse}
		clean_up_user_control_helpers
		menu_jam_band_add_control_helpers
		if NOT GotParam \{no_sound}
			SoundEvent \{event = jam_advanced_record_pause_panel_out}
		endif
		KillSpawnedScript \{Name = jam_highway_select_quantize}
		SpawnScriptNow \{jam_highway_select_quantize
			id = jam_recording_spawns}
		LaunchEvent Type = focus target = <event_cont>
		jam_ghmix_show_scale_reference
	else
		menu_jam_band_add_control_helpers state = instrument_ui instrument = <select_instrument>
	endif
endscript

script jam_band_pause_record_text 
	Player = 1
	begin
	formatText checksumName = text_id 'option_text_%a_%b' a = <option> b = <Player>
	if ($jam_band_recording = 1)
		if ScreenElementExists id = <text_id>
			SetScreenElementProps id = <text_id> text = qs(0x0a46311a)
		endif
	else
		if ScreenElementExists id = <text_id>
			SetScreenElementProps id = <text_id> text = qs(0xea37872c)
		endif
	endif
	<Player> = (<Player> + 1)
	repeat ($num_jam_players)
endscript

script destroy_jam_band_menu 
	active_controllers = [0 0 0 0 0 0 0]
	GetActiveControllers
	count = 0
	begin
	if ((<active_controllers> [<count>]) = 1)
		jam_destroy_player Player = (<count> + 1)
	endif
	<count> = (<count> + 1)
	repeat ($num_jam_players)
	jam_band_deactivate_mic
	jam_input_melody_stop_sound
	if ($game_mode = training)
		jam_destroy_tutorial_menu
	endif
	Change \{jam_highway_playing = 0}
	Change \{jam_band_recording = 0}
	Change \{jam_highway_recording = 0}
	jam_settings_reinit_menu_sounds
	KillSpawnedScript \{Name = jam_band_pulsate_speaker_head}
	KillSpawnedScript \{Name = jam_band_pulsate_small_speaker_head}
	KillSpawnedScript \{Name = line6_pod_remove}
	KillSpawnedScript \{Name = guitar_jam_playback_recording}
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	KillSpawnedScript \{id = jam_band_spawns}
	KillSpawnedScript \{id = jam_input_spawns}
	KillSpawnedScript \{id = jam_recording_spawns}
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ScreenElementExists \{id = jam_band_container}
		DestroyScreenElement \{id = jam_band_container}
	endif
endscript

script jam_destroy_player 
	formatText checksumName = player_cont 'inst_player_cont_%s' s = <Player>
	if ScreenElementExists id = <player_cont>
		DestroyScreenElement id = <player_cont>
	endif
	formatText checksumName = scrolling_inst_select 'scrolling_inst_select_%s' s = <Player>
	if ScreenElementExists id = <scrolling_inst_select>
		destroy_menu menu_id = <scrolling_inst_select>
	endif
	formatText checksumName = scrolling_options 'scrolling_options_%s' s = <Player>
	if ScreenElementExists id = <scrolling_options>
		destroy_menu menu_id = <scrolling_options>
	endif
	formatText checksumName = inst_cont 'inst_cont_%s' s = <Player>
	if ScreenElementExists id = <inst_cont>
		destroy_menu menu_id = <inst_cont>
	endif
	formatText checksumName = scale_preview_spawn 'scale_preview_spawn_%s' s = <Player>
	KillSpawnedScript id = <scale_preview_spawn>
	formatText checksumName = jam_playback_delete 'jam_playback_delete_%s' s = <Player>
	KillSpawnedScript id = <jam_playback_delete>
	formatText checksumName = input_spawn 'input_spawn_%s' s = <Player>
	KillSpawnedScript id = <input_spawn>
	formatText checksumName = arpeggiator_spawn 'arpeggiator_spawn_%s' s = <Player>
	KillSpawnedScript id = <arpeggiator_spawn>
	destroyplayerserverjaminput Player = <Player>
	jam_kill_update_note_length Player = <Player>
	getplayerinfo <Player> jam_instrument
	if (<jam_instrument> = $jam_mic_id)
		jam_band_deactivate_mic select_player = <Player>
	endif
	formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = <Player>
	KillSpawnedScript id = <jam_player_spawns>
endscript

script jam_band_show_effect_ui 
	return
	getplayerinfo <select_player> jam_instrument
	if NOT (<jam_instrument> = 3)
		formatText checksumName = fret_top_id 'jam_tilt_top_fret_%s' s = <select_player>
		formatText checksumName = fret_middle_id 'jam_tilt_middle_fret_%s' s = <select_player>
		formatText checksumName = fret_bottom_id 'jam_tilt_bottom_fret_%s' s = <select_player>
		formatText checksumName = fret_upper_middle_id 'jam_tilt_upper_middle_fret_%s' s = <select_player>
		formatText checksumName = fret_low_middle_id 'jam_tilt_low_middle_fret_%s' s = <select_player>
		if GotParam \{On}
			<fret_top_id> :SetProps rgba = [100 255 255 255]
			<fret_middle_id> :SetProps rgba = [100 255 255 255]
			<fret_bottom_id> :SetProps rgba = [100 255 255 255]
			if ScreenElementExists id = <fret_upper_middle_id>
				<fret_upper_middle_id> :SetProps rgba = [100 255 255 255]
			endif
			if ScreenElementExists id = <fret_low_middle_id>
				<fret_low_middle_id> :SetProps rgba = [100 255 255 255]
			endif
		else
			<fret_top_id> :SetProps rgba = [200 200 200 255]
			<fret_middle_id> :SetProps rgba = [200 200 200 255]
			<fret_bottom_id> :SetProps rgba = [200 200 200 255]
			if ScreenElementExists id = <fret_upper_middle_id>
				<fret_upper_middle_id> :SetProps rgba = [200 200 200 255]
			endif
			if ScreenElementExists id = <fret_low_middle_id>
				<fret_low_middle_id> :SetProps rgba = [200 200 200 255]
			endif
		endif
	endif
endscript

script guitar_jam_simplerecops_play 
	if ($jam_band_recording = 0)
		if ($jam_highway_playing = 0)
			guitar_jam_simplerecops_command_startplay select_player = <select_player>
			SoundEvent \{event = dpad_play}
		else
			guitar_jam_simplerecops_command_stopplay
			SoundEvent \{event = dpad_stop}
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
	Change \{jam_highway_playing = 1}
	SpawnScriptNow \{jam_band_recording_begin
		id = jam_band_spawns}
	<Player> = 1
	begin
	formatText checksumName = simple_rec_button_onr 'jam_simple_rec_button_onr_%s' s = <select_player>
	formatText checksumName = simple_rec_icon_play 'jam_simple_rec_icon_play_%s' s = <select_player>
	formatText checksumName = simple_rec_icon_stop 'jam_simple_rec_icon_stop_%s' s = <select_player>
	if ScreenElementExists id = <simple_rec_button_onr>
		safe_hide id = <simple_rec_icon_play>
		safe_show id = <simple_rec_icon_stop>
		safe_show id = <simple_rec_button_onr>
	endif
	<Player> = (<Player> + 1)
	repeat ($num_jam_players)
	broadcastevent \{Type = jam_tutorial_play_start}
endscript

script guitar_jam_simplerecops_command_stopplay 
	Change \{jam_band_recording = 0}
	Change \{jam_highway_playing = 0}
	Change \{jam_highway_recording = 0}
	KillSpawnedScript \{Name = guitar_jam_playback_delete}
	KillSpawnedScript \{Name = guitar_jam_playback_recording}
	KillSpawnedScript \{Name = guitar_jam_drum_playback}
	KillSpawnedScript \{Name = jam_band_recording_begin}
	KillSpawnedScript \{Name = jam_recording_metronome}
	jam_stop_all_samples
	jam_stop_all_sound
	Change \{jam_player_recording_armed = [
			0
			0
			0
			0
		]}
	Change \{jam_player_recording_begin_time = [
			0
			0
			0
			0
		]}
	jam_input_melody_stop_sound
	<Player> = 1
	begin
	formatText checksumName = simple_rec_icon_play 'jam_simple_rec_icon_play_%s' s = <Player>
	formatText checksumName = simple_rec_icon_rec 'jam_simple_rec_icon_rec_%s' s = <Player>
	formatText checksumName = simple_rec_icon_rw 'jam_simple_rec_icon_rw_%s' s = <Player>
	formatText checksumName = simple_rec_icon_ff 'jam_simple_rec_icon_ff_%s' s = <Player>
	formatText checksumName = simple_rec_icon_stop 'jam_simple_rec_icon_stop_%s' s = <Player>
	formatText checksumName = simple_rec_button_onr 'jam_simple_rec_button_onr_%s' s = <Player>
	formatText checksumName = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <Player>
	formatText checksumName = right_hold 'right_hold_player%s' s = <Player>
	if ScreenElementExists id = <simple_rec_button_onr>
		safe_show id = <simple_rec_icon_play>
		safe_hide id = <simple_rec_icon_rec>
		safe_show id = <simple_rec_icon_rw>
		safe_hide id = <simple_rec_icon_ff>
		safe_hide id = <simple_rec_icon_stop>
		safe_hide id = <simple_rec_button_onr>
		safe_hide id = <simple_rec_button_onl>
		safe_hide id = <right_hold>
	endif
	<Player> = (<Player> + 1)
	repeat ($num_jam_players)
	broadcastevent \{Type = jam_tutorial_play_stop}
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
	Change \{jam_band_recording = 1}
	Change \{jam_highway_recording = 1}
	SoundEvent \{event = recording_start}
	SetArrayElement ArrayName = jam_player_recording_armed globalarray index = (<select_player> - 1) NewValue = 1
	curr_time = ($jam_highway_play_time)
	CastToInteger \{curr_time}
	SetArrayElement ArrayName = jam_player_recording_begin_time globalarray index = (<select_player> - 1) NewValue = <curr_time>
	getplayerinfo <select_player> jam_instrument
	switch <jam_instrument>
		case 0
		KillSpawnedScript \{id = jam_band_rhythm_playback}
		case 1
		KillSpawnedScript \{id = jam_band_lead_playback}
		case 2
		KillSpawnedScript \{id = jam_band_bass_playback}
		case 3
		KillSpawnedScript \{id = jam_band_drum_playback}
		case 4
		KillSpawnedScript \{id = jam_band_melody_playback}
	endswitch
	getplayerinfo <select_player> jam_instrument
	formatText checksumName = jam_playback_delete 'jam_playback_delete_%s' s = <select_player>
	SpawnScriptNow guitar_jam_playback_delete id = <jam_playback_delete> params = {jam_instrument = <jam_instrument> start_time = $jam_highway_play_time}
	formatText checksumName = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
	SpawnScriptNow jam_recording_metronome id = <jam_player_spawns> params = {select_player = <select_player>}
	formatText checksumName = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <select_player>
	safe_show id = <simple_rec_button_onl>
	broadcastevent \{Type = jam_tutorial_record_start}
endscript

script jam_band_recording_begin 
	reset_song_time starttime = ($jam_highway_play_time)
	SpawnScriptNow \{guitar_jam_playback_recording
		id = jam_band_rhythm_playback
		params = {
			jam_instrument = 0
			start_time = $jam_highway_play_time
		}}
	SpawnScriptNow \{guitar_jam_playback_recording
		id = jam_band_lead_playback
		params = {
			jam_instrument = 1
			start_time = $jam_highway_play_time
		}}
	SpawnScriptNow \{guitar_jam_playback_recording
		id = jam_band_bass_playback
		params = {
			jam_instrument = 2
			start_time = $jam_highway_play_time
		}}
	SpawnScriptNow \{guitar_jam_playback_recording
		id = jam_band_melody_playback
		params = {
			jam_instrument = 4
			start_time = $jam_highway_play_time
		}}
	SpawnScriptNow \{guitar_jam_drum_playback
		id = jam_band_drum_playback
		params = {
			start_time = $jam_highway_play_time
		}}
	begin_pos = ($jam_band_playline_pos + ((($jam_highway_play_time) / 1000.0) * $jam_band_pixels_per_second))
	SetScreenElementProps id = jam_band_highway_playline Pos = <begin_pos>
	pixels_per_frame = ($jam_band_pixels_per_second / 60)
	GetScreenElementPosition \{id = jam_band_highway_playline}
	end_pos = ($jam_band_playline_pos + ((($jam_band_song_length) / 1000.0) * $jam_band_pixels_per_second))
	begin
	new_pos = ($jam_band_playline_pos + ((($jam_highway_play_time) / 1000.0) * $jam_band_pixels_per_second))
	if NOT (<new_pos> [0] > <end_pos> [0])
		SetScreenElementProps id = jam_band_highway_playline Pos = <new_pos>
		GetSongTimeMs
		Change jam_highway_play_time = <time>
	else
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_band_pause_record_text option = <option>
	Player = 1
	begin
	guitar_jam_simplerecops_command_stoprec select_player = <Player>
	Player = (<Player> + 1)
	repeat 4
	guitar_jam_simplerecops_command_stopplay
endscript

script guitar_jam_simplerecops_command_stoprec 
	SetArrayElement ArrayName = jam_player_recording_armed globalarray index = (<select_player> - 1) NewValue = 0
	SetArrayElement ArrayName = jam_player_recording_begin_time globalarray index = (<select_player> - 1) NewValue = 0
	formatText checksumName = jam_playback_delete 'jam_playback_delete_%s' s = <select_player>
	KillSpawnedScript id = <jam_playback_delete>
	formatText checksumName = jam_band_playback_spawn 'jam_band_playback_spawn_%s' s = <select_player>
	getplayerinfo <select_player> jam_instrument
	switch <jam_instrument>
		case 0
		SpawnScriptNow \{guitar_jam_playback_recording
			id = jam_band_rhythm_playback
			params = {
				jam_instrument = 0
				start_time = $jam_highway_play_time
			}}
		case 1
		SpawnScriptNow \{guitar_jam_playback_recording
			id = jam_band_lead_playback
			params = {
				jam_instrument = 1
				start_time = $jam_highway_play_time
			}}
		case 2
		SpawnScriptNow \{guitar_jam_playback_recording
			id = jam_band_bass_playback
			params = {
				jam_instrument = 2
				start_time = $jam_highway_play_time
			}}
		case 3
		SpawnScriptNow \{guitar_jam_drum_playback
			id = jam_band_drum_playback
			params = {
				start_time = $jam_highway_play_time
			}}
		case 4
		SpawnScriptNow \{guitar_jam_playback_recording
			id = jam_band_melody_playback
			params = {
				jam_instrument = 4
				start_time = $jam_highway_play_time
			}}
	endswitch
	if NOT GotParam \{no_sound}
		SoundEvent \{event = recording_stop}
	endif
	if GotParam \{all}
		formatText \{checksumName = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 1}
		safe_hide id = <simple_rec_button_onl>
		formatText \{checksumName = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 2}
		safe_hide id = <simple_rec_button_onl>
		formatText \{checksumName = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 3}
		safe_hide id = <simple_rec_button_onl>
		formatText \{checksumName = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 4}
		safe_hide id = <simple_rec_button_onl>
	else
		formatText checksumName = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <select_player>
		safe_hide id = <simple_rec_button_onl>
	endif
	GetArraySize \{$jam_player_recording_armed}
	i = 0
	is_recording = 0
	begin
	if ($jam_player_recording_armed [<i>] = 1)
		<is_recording> = 1
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	if (<is_recording> = 0)
		KillSpawnedScript \{Name = jam_recording_metronome}
		Change \{jam_band_recording = 0}
		Change \{jam_highway_recording = 0}
	endif
	broadcastevent \{Type = jam_tutorial_record_end}
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
	SoundEvent \{event = dpad_play}
	if (<Dir> = right)
		formatText checksumName = simple_rec_arrow 'jam_simple_rec_arrow_r_%s' s = <select_player>
		formatText checksumName = simple_rec_button_on 'jam_simple_rec_button_onr_%s' s = <select_player>
		formatText checksumName = simple_rec_button_other 'jam_simple_rec_button_onl_%s' s = <select_player>
		safe_hide id = <simple_rec_button_other>
		<new_time> = ($jam_highway_play_time + 1000)
	elseif (<Dir> = left)
		formatText checksumName = simple_rec_arrow 'jam_simple_rec_arrow_l_%s' s = <select_player>
		formatText checksumName = simple_rec_button_on 'jam_simple_rec_button_onl_%s' s = <select_player>
		formatText checksumName = simple_rec_button_other 'jam_simple_rec_button_onr_%s' s = <select_player>
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
	<button> = <Dir>
	if GotParam \{direction_override}
		<button> = <direction_override>
	endif
	<time_held> = 0
	begin
	if ControllerPressed <button> <controller>
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
	SpawnScriptNow guitar_jam_simplerecops_skip_once id = jam_band_spawns params = {Dir = <Dir> arrow = <simple_rec_arrow> scroll_speed = <scroll_speed>}
	<time_held> = (<time_held> + <spam_frequency>)
	Wait <spam_frequency> Seconds
	repeat
endscript

script guitar_jam_simplerecops_skip_once \{scroll_speed = 1}
	if NOT ScreenElementExists id = <arrow>
		return
	endif
	legacydoscreenelementmorph id = <arrow> Scale = 1.1
	legacydoscreenelementmorph id = <arrow> Scale = 0.8 time = 0.15
	GetScreenElementPosition \{id = jam_band_highway_playline}
	end_pos = ($jam_band_playline_pos + ((($jam_band_song_length) / 1000.0) * $jam_band_pixels_per_second))
	if (<Dir> = right)
		<new_time> = ($jam_highway_play_time + (1000 * <scroll_speed>))
	elseif (<Dir> = left)
		<new_time> = ($jam_highway_play_time - (1000 * <scroll_speed>))
	endif
	new_pos = ($jam_band_playline_pos + ((<new_time> / 1000.0) * $jam_band_pixels_per_second))
	if (<new_pos> [0] < 0)
		SetScreenElementProps id = jam_band_highway_playline Pos = ($jam_band_playline_pos)
		Change \{jam_highway_play_time = 0}
	elseif ((<new_pos> [0]) > (<end_pos> [0]))
		SetScreenElementProps id = jam_band_highway_playline Pos = <end_pos>
		Change jam_highway_play_time = ($jam_highway_song_length)
	else
		SetScreenElementProps id = jam_band_highway_playline Pos = (<new_pos>)
		Change jam_highway_play_time = <new_time>
	endif
endscript

script guitar_jam_goto_advanced_rec 
	destroy_jam_band_menu
	Change jam_current_recording_player = <select_player>
	getplayerinfo <select_player> jam_instrument
	if (<jam_instrument> = $jam_mic_id)
		setplayerinfo <select_player> jam_instrument = 4
		<jam_instrument> = 4
	elseif (<jam_instrument> = -1)
		setplayerinfo <select_player> jam_instrument = 0
		<jam_instrument> = 0
	endif
	getplayerinfo <select_player> controller
	Change primary_controller = <controller>
	ui_event event = menu_replace data = {state = uistate_recording editing = 1 current_instrument = <jam_instrument> Player = <select_player>}
endscript

script guitar_jam_goto_rec_studio 
	destroy_jam_recording_menu
	ui_event event = menu_replace data = {state = uistate_jam_band editing = 1 current_instrument = <jam_instrument> Player = <select_player>}
endscript

script jam_pause_check_simple_record_input 
	formatText checksumName = player_pause 'jam_band_pause_%s' s = <select_player>
	begin
	jam_check_simple_record_input controller = <controller> select_player = <select_player>
	if NOT ScreenElementExists id = <player_pause>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript
right_hold_player1 = 0
right_hold_player2 = 0
right_hold_player3 = 0
right_hold_player4 = 0

script jam_check_simple_record_input 
	simplerec_controls = [record Play skip_back skip_forward]
	if ($game_mode = training)
		if ScreenElementExists \{id = jam_band_container}
			jam_band_container :GetTags
		elseif ScreenElementExists \{id = jam_studio_element}
			jam_studio_element :GetTags
		endif
		if (<disable_simple_rec> = 1)
			return
		endif
	endif
	formatText checksumName = simple_rec_icon_play 'jam_simple_rec_icon_play_%s' s = <select_player>
	formatText checksumName = simple_rec_icon_rec 'jam_simple_rec_icon_rec_%s' s = <select_player>
	formatText checksumName = simple_rec_icon_rw 'jam_simple_rec_icon_rw_%s' s = <select_player>
	formatText checksumName = simple_rec_icon_ff 'jam_simple_rec_icon_ff_%s' s = <select_player>
	formatText checksumName = simple_rec_icon_stop 'jam_simple_rec_icon_stop_%s' s = <select_player>
	formatText checksumName = simple_rec_button_onr 'jam_simple_rec_button_onr_%s' s = <select_player>
	formatText checksumName = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <select_player>
	formatText checksumName = right_hold 'right_hold_player%s' s = <select_player>
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
	if NOT IsGuitarController controller = <controller>
		<lefty_flip> = 0
	endif
	if (<lefty_flip> = 0)
		<skip_back_button> = left
		<play_button> = right
	else
		<skip_back_button> = right
		<play_button> = left
	endif
	if ControllerMake <skip_back_button> <controller>
		if NOT (($jam_highway_playing = 1) || ($jam_band_recording = 1))
			if ArrayContains array = <simplerec_controls> contains = skip_back
				if ScriptIsRunning \{guitar_jam_simplerecops_skipfb}
					KillSpawnedScript \{Name = guitar_jam_simplerecops_skipfb}
				endif
				SpawnScriptNow guitar_jam_simplerecops_skipfb params = {Dir = left select_player = <select_player> direction_override = <skip_back_button>}
				safe_show id = <simple_rec_button_onl>
			endif
		else
			if ArrayContains array = <simplerec_controls> contains = record
				if NOT (<jam_instrument> = $jam_mic_id)
					guitar_jam_simplerecops_record select_player = <select_player>
				endif
			endif
		endif
		formatText checksumName = simple_rec_arrow_l 'jam_simple_rec_arrow_l_%s' s = <select_player>
		if ScreenElementExists id = <simple_rec_arrow_l>
			legacydoscreenelementmorph id = <simple_rec_arrow_l> Scale = 1.1
			legacydoscreenelementmorph id = <simple_rec_arrow_l> Scale = 0.8 time = 0.15
		endif
	endif
	if NOT (($jam_highway_playing = 1) || ($jam_band_recording = 1))
		if ControllerPressed <play_button> <controller>
			if (($<right_hold>) >= 0)
				Change GlobalName = <right_hold> NewValue = (($<right_hold>) + 1)
				if ArrayContains array = <simplerec_controls> contains = skip_forward
					if (($<right_hold>) = 20)
						if ScriptIsRunning \{guitar_jam_simplerecops_skipfb}
							KillSpawnedScript \{Name = guitar_jam_simplerecops_skipfb}
						endif
						SpawnScriptNow guitar_jam_simplerecops_skipfb params = {Dir = right select_player = <select_player> direction_override = <play_button>}
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
				if ArrayContains array = <simplerec_controls> contains = Play
					if ScriptIsRunning \{guitar_jam_simplerecops_skipfb}
						KillSpawnedScript \{Name = guitar_jam_simplerecops_skipfb}
					endif
					guitar_jam_simplerecops_play select_player = <select_player>
					formatText checksumName = simple_rec_arrow_r 'jam_simple_rec_arrow_r_%s' s = <select_player>
					if ScreenElementExists id = <simple_rec_arrow_r>
						legacydoscreenelementmorph id = <simple_rec_arrow_r> Scale = 1.1
						legacydoscreenelementmorph id = <simple_rec_arrow_r> Scale = 0.8 time = 0.15
					endif
				endif
			endif
			Change GlobalName = <right_hold> NewValue = 0
			safe_hide id = <simple_rec_button_onr>
		endif
	else
		if ControllerMake <play_button> <controller>
			if ArrayContains array = <simplerec_controls> contains = Play
				guitar_jam_simplerecops_play select_player = <select_player>
				formatText checksumName = simple_rec_arrow_r 'jam_simple_rec_arrow_r_%s' s = <select_player>
				if ScreenElementExists id = <simple_rec_arrow_r>
					legacydoscreenelementmorph id = <simple_rec_arrow_r> Scale = 1.1
					legacydoscreenelementmorph id = <simple_rec_arrow_r> Scale = 0.8 time = 0.15
				endif
				Change GlobalName = <right_hold> NewValue = -1
			endif
		endif
	endif
endscript

script jam_note_limit_hit 
	<z_priority> = 35
	formatText checksumName = player_cont 'inst_player_cont_%s' s = <Player>
	if NOT ScreenElementExists id = <player_cont>
		if NOT ScreenElementExists \{id = jam_player_recording_cont}
			return
		else
			<player_cont> = jam_player_recording_cont
			<z_priority> = 35
		endif
	endif
	formatText checksumName = msg_box 'jam_limit_msg_box_%a' a = <Player>
	if ScreenElementExists id = <msg_box>
		return
	endif
	CreateScreenElement {
		Type = TextBlockElement
		parent = <player_cont>
		id = <msg_box>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		rgba = [220 220 220 255]
		dims = (80.0, 40.0)
		Pos = (0.0, 320.0)
		text = qs(0x9e3ba7cd)
		Scale = 2
		internal_scale = 0.3
		fit_width = wrap
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		z_priority = <z_priority>
	}
	if NOT ScreenElementExists id = <msg_box>
		return
	endif
	legacydoscreenelementmorph id = <msg_box> Scale = 2.5 time = 0.18
	Wait \{0.18
		Seconds}
	if NOT ScreenElementExists id = <msg_box>
		return
	endif
	legacydoscreenelementmorph id = <msg_box> Scale = 2 time = 0.18
	Wait \{0.18
		Seconds}
	if NOT ScreenElementExists id = <msg_box>
		return
	endif
	legacydoscreenelementmorph id = <msg_box> Scale = 2.5 time = 0.18
	Wait \{0.18
		Seconds}
	if NOT ScreenElementExists id = <msg_box>
		return
	endif
	legacydoscreenelementmorph id = <msg_box> Scale = 2 time = 0.18
	Wait \{0.18
		Seconds}
	if NOT ScreenElementExists id = <msg_box>
		return
	endif
	legacydoscreenelementmorph id = <msg_box> Scale = 2.5 time = 0.18
	Wait \{0.18
		Seconds}
	if NOT ScreenElementExists id = <msg_box>
		return
	endif
	legacydoscreenelementmorph id = <msg_box> Scale = 2 time = 0.18
	Wait \{1
		Seconds}
	if NOT ScreenElementExists id = <msg_box>
		return
	endif
	legacydoscreenelementmorph id = <msg_box> Scale = 0 time = 0.25
	Wait \{0.25
		Seconds}
	DestroyScreenElement id = <msg_box>
endscript

script jam_band_create_gem 
	if ($jam_advanced_record = 1)
		return
	endif
	CreateScreenElement {
		id = jam_band_gem
		Type = ContainerElement
		parent = <player_cont>
		Pos = <gem_pos>
		just = [left top]
	}
	GetArraySize <gems>
	gem_count = 0
	begin
	if (<gem_pattern> && (<gems> [<gem_count>].pattern))
		if (<gem_count> = 5)
			CreateScreenElement {
				Type = SpriteElement
				parent = jam_band_gem
				texture = (<gems> [<gem_count>].texture)
				just = [center center]
				rgba = (<gems> [<gem_count>].rgba)
				Pos = ((<gem_offset> * (3)) + (0.0, 0.0))
				z_priority = <z_priority>
				dims = (120.0, 5.0)
				Scale = <gem_scale>
			}
		else
			CreateScreenElement {
				Type = SpriteElement
				parent = jam_band_gem
				texture = (<gems> [<gem_count>].texture)
				just = [center center]
				rgba = [255 255 255 255]
				Pos = ((<gem_offset> * (<gem_count> + 1)))
				z_priority = <z_priority>
				dims = (20.0, 20.0)
			}
		endif
	endif
	<gem_count> = (<gem_count> + 1)
	repeat <array_Size>
	pixels_per_half_measure = 200
	seconds_per_half_measure = ((60.0 / $jam_current_bpm) * 2)
	new_gem_pos = (<gem_pos> + ((0.0, 1.0) * <pixels_per_half_measure>))
	jam_band_gem :SetProps just = [right top] Pos = <new_gem_pos> time = <seconds_per_half_measure> alpha = 0
endscript

script jam_band_create_speaker_heads 
endscript

script jam_band_pulsate_speaker_head \{instrument = 0}
endscript

script jam_band_pulsate_small_speaker_head 
	begin
	<speaker_id> :SetProps Scale = 0.96999997 time = 0.01
	<speaker_id> :se_waitprops
	<speaker_id> :SetProps Scale = 1.0 time = 0.01
	<speaker_id> :se_waitprops
	<speaker_id> :SetProps Scale = 1.03 time = 0.01
	<speaker_id> :se_waitprops
	<speaker_id> :SetProps Scale = 1.0 time = 0.01
	<speaker_id> :se_waitprops
	repeat 10
	<speaker_id> :SetProps Scale = 1.0 time = 0.03
	<speaker_id> :se_waitprops
endscript

script jam_band_activate_mic 
	getplayerinfo <select_player> controller
	initjammic controller = <controller>
	begin
	jam_check_simple_record_input controller = <controller> select_player = <select_player>
	Wait \{1
		gameframe}
	repeat
endscript

script jam_band_deactivate_mic 
	KillSpawnedScript \{Name = jam_band_activate_mic}
	shutdownjammic
endscript

script jam_create_extra_info \{Player = 1}
	formatText checksumName = extra_info_id 'jam_band_extra_info_%s' s = <Player>
	if ScreenElementExists id = <extra_info_id>
		DestroyScreenElement id = <extra_info_id>
	endif
	if GotParam \{arpeggiator}
		getplayerinfo <Player> jam_instrument
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
	if GotParam \{drum_machine}
		title_text = qs(0xf24238cd)
		description_text = qs(0x6d0eadaa)
		helper_text = qs(0x49dd865c)
		info1_text = qs(0x923969d0)
		info2_text = qs(0x88cfedc8)
		info3_text = qs(0x085998f0)
		info4_text = qs(0xf1e1e865)
	endif
	formatText checksumName = player_cont 'inst_player_cont_%a' a = <Player>
	if ScreenElementExists id = <player_cont>
		CreateScreenElement {
			parent = <player_cont>
			id = <extra_info_id>
			Type = descinterface
			desc = 'jam_band_extra_info'
			Pos = (-109.0, -5.0)
			z_priority = 0
			alpha = 0
			title_text = <title_text>
			info1_text = <info1_text>
			info2_text = <info2_text>
			info3_text = <info3_text>
			info4_text = <info4_text>
		}
		if <extra_info_id> :desc_resolvealias Name = alias_helper
			<resolved_id> :se_setprops helper_description_text = <helper_text>
		endif
		<extra_info_id> :se_setprops alpha = 1 time = 0.2
		<extra_info_id> :se_waitprops
	endif
endscript

script jam_remove_extra_info 
	formatText checksumName = extra_info_id 'jam_band_extra_info_%s' s = <Player>
	if ScreenElementExists id = <extra_info_id>
		<extra_info_id> :se_setprops alpha = 0 time = 0.5
		<extra_info_id> :se_waitprops
		DestroyScreenElement id = <extra_info_id>
	endif
endscript

script jam_band_pause_mixer 
	LaunchEvent Type = unfocus target = <vmenu_id>
	if ($jam_advanced_record = 0)
		destroy_jam_band_menu
		from_adv = 0
	else
		destroy_jam_recording_menu
		from_adv = 1
		ghmix_persistant_settings = {}
		AddParam structure_name = ghmix_persistant_settings Name = cur_playtime value = ($jam_highway_play_time)
		AddParam structure_name = ghmix_persistant_settings Name = cur_playline_pos value = ($jam_highway_play_line_pos)
		AddParam structure_name = ghmix_persistant_settings Name = cur_lead_octave value = ($jam_lead_octave_range)
		AddParam structure_name = ghmix_persistant_settings Name = cur_melody_octave value = ($jam_melody_octave_range)
		AddParam structure_name = ghmix_persistant_settings Name = cur_rhythm_chords value = ($jam_rhythm_chord_type)
		AddParam structure_name = ghmix_persistant_settings Name = cur_instrument value = ($jam_current_track)
		AddParam structure_name = ghmix_persistant_settings Name = cur_loop_low value = ($jam_loop_bound_low)
		AddParam structure_name = ghmix_persistant_settings Name = cur_loop_high value = ($jam_loop_bound_high)
		AddParam structure_name = ghmix_persistant_settings Name = cur_control value = ($jam_control_selected)
		AddParam structure_name = ghmix_persistant_settings Name = cur_quantize value = ($jam_current_quantize)
	endif
	clean_up_user_control_helpers
	ui_event event = menu_change data = {state = uistate_jam_mixer from_adv = <from_adv> ghmix_persistant_settings = <ghmix_persistant_settings>}
endscript
