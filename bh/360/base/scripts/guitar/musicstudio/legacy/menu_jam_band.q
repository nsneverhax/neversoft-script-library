jam_cont_start_pos = (330.0, 52.0)
jam_cont_offset = 205
jam_band_force_refresh_detailed_highway = 0

script create_jam_band_menu \{editing = 0
		tutorial = 0
		song = None}
	set_focus_color \{Color = pure_white}
	set_unfocus_color \{Color = gh4_jam_orangeish}
	Change \{jam_num_falling_gems = 0}
	Change \{musicstudio_first_time_instrument_select = 1}
	Change \{select_shift = 0}
	destroy_bg_viewport
	setup_bg_viewport
	Menu_Music_Off
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = jam_band_container
		Pos = (0.0, 800.0)}
	jam_band_container :SetTags \{allow_easy_backout = 1}
	Change \{target_jam_camera_prop = jam_band}
	jam_camera_wait
	CreateScreenElement \{type = SpriteElement
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
	SetPlayerInfo \{1
		jam_instrument = -1}
	SetPlayerInfo \{2
		jam_instrument = -1}
	SetPlayerInfo \{3
		jam_instrument = -1}
	SetPlayerInfo \{4
		jam_instrument = -1}
	musicstudio_reinit_menu_sounds
	jam_setup_song editing = <editing> tutorial = <tutorial>
	num_players = ($num_jam_players)
	if (<tutorial> = 0)
		if (<editing> = 1)
			FormatText \{TextName = song_name_text
				qs(0x8b1f3160)
				a = $jam_selected_song}
		else
			FormatText \{TextName = song_name_text
				qs(0xd9070aee)}
			musicstudio_update_selected_song_name FileName = <song_name_text>
		endif
	endif
	safe_hide \{id = jam_menu_backdrop}
	RunScriptOnScreenElement \{id = jam_band_container
		LegacyDoMorph
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
	endif
	jam_band_container :Obj_SpawnScript \{jam_recording_check_disconnect
		params = {
			recording_studio
		}}
	musicstudio_jamroom_refresh_lower_highway_display
	destroy_loading_screen
endscript

script menu_jam_band_default_control_helpers 
	clean_up_user_control_helpers
	menu_jam_band_add_control_helpers
endscript

script menu_jam_band_add_control_helpers \{state = null}
	return
	clean_up_user_control_helpers
	if ($game_mode = practice)
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
		if NOT ($game_mode = practice)
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
		if NOT ($game_mode = practice)
			add_user_control_helper \{text = qs(0x48a351fa)
				button = start
				z = 100}
		endif
		if GotParam \{instrument}
			if NOT ((<instrument> = 2) || (<instrument> = 4))
				add_user_control_helper \{text = qs(0xbdcf8d77)
					button = back
					z = 100}
			endif
		endif
		default
		if ScreenElementExists \{id = jam_studio_element}
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100}
			if NOT ($game_mode = practice)
				add_user_control_helper \{text = qs(0x48a351fa)
					button = start
					z = 100}
			endif
			add_user_control_helper text = ($jam_ghmix_text_skip_backwards) button = yellow z = 100
			add_user_control_helper text = ($jam_ghmix_text_skip_forwards) button = blue z = 100
		elseif ScreenElementExists \{id = jam_band_container}
			if NOT ($game_mode = practice)
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
			if has_USB_mic_plugged_in
			elseif controller_has_headset controller = <controller>
			else
				return \{false}
			endif
		endif
	endif
	return \{true}
endscript

script jam_create_player_container 
	FormatText checksumname = player_cont 'inst_player_cont_%s' s = <player>
	if ScreenElementExists id = <player_cont>
		DestroyScreenElement id = <player_cont>
	endif
	ShutDownJamMic
	CreateScreenElement {
		type = ContainerElement
		parent = jam_band_container
		id = <player_cont>
		Pos = ($jam_cont_start_pos + (1.0, 0.0) * ($jam_cont_offset * (<player> - 1)))
	}
	if GotParam \{player}
		switch <player>
			case 1
			PlaySound \{Jam_Pause_Panel_in
				vol = -16
				pitch = -0.5
				buss = front_end
				pan1x = -0.15
				pan1y = 1
				pan2x = -0.15
				pan2y = 1}
			case 2
			PlaySound \{Jam_Pause_Panel_in
				vol = -16
				pitch = 0
				buss = front_end
				pan1x = -0.05
				pan1y = 1
				pan2x = -0.05
				pan2y = 1}
			case 3
			PlaySound \{Jam_Pause_Panel_in
				vol = -16
				pitch = 0.5
				buss = front_end
				pan1x = 0.05
				pan1y = 1
				pan2x = 0.05
				pan2y = 1}
			case 4
			PlaySound \{Jam_Pause_Panel_in
				vol = -16
				pitch = 1
				buss = front_end
				pan1x = 0.15
				pan1y = 1
				pan2x = 0.15
				pan2y = 1}
		endswitch
	endif
	spawnscriptnow id = jam_band_spawns jam_create_select_instrument_menu params = {player = <player> player_cont = <player_cont> morph = 1 do_wait = 1}
endscript
jam_band_recording = 0
jam_band_pixels_per_second = (0.0, 0.0)
jam_band_playline_pos = (0.0, 0.0)
jam_band_song_length = 0
jam_band_new_song = 0

script jam_setup_song \{advanced_record = 0
		tutorial = 0
		from_song = 0}
	GetArraySize ($jam_quantize)
	Change jam_current_quantize = (<array_size> - 1)
	Change \{jam_highway_recording_mode = 1}
	if (<from_song> = 0)
		reset_song_time \{starttime = 0}
		Change \{jam_highway_play_time = 0}
	endif
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
	song = editable
	if (<editing> = 1)
		musicstudio_init_all_line6_effects
		SetSongInfo bpm = ($jam_current_bpm)
		musicstudio_init_volumes
		musicstudio_init_pan
		FormatText \{TextName = title_text
			qs(0xb2b7d449)
			s = $jam_selected_song
			b = $jam_current_bpm}
	else
		jam_setup_new_song
		if ((<advanced_record> = 1) || (<tutorial> = 1))
			Change \{jam_current_bpm = 120}
			SetSongInfo bpm = ($jam_current_bpm)
		endif
		SetSongInfo line6_0_volume = ($line6_0_volume_default)
		SetSongInfo line6_1_volume = ($line6_1_volume_default)
		SetSongInfo line6_0_pan = ($line6_0_pan_default)
		SetSongInfo line6_1_pan = ($line6_1_pan_default)
		musicstudio_init_pan
	endif
	if GotParam \{title_text}
		printf channel = jam_mode qs(0x73307931) s = <title_text>
	endif
	if (<advanced_record> = 0)
		jam_band_create_highway song = <song> editing = <editing>
		wait \{5
			gameframes}
		if (<editing> = 0)
			musicstudio_jamroom_set_style_from_wizard
		else
			GetArraySize ($jamroom_wizard_styles)
			musicstudio_mainobj :MusicStudioJamRoom_SetCurrentStyleIndex style_index = (<array_size> - 1)
			musicstudio_jamroom_get_current_style_struct
			musicstudio_mainobj :MusicStudio_CreateVisualizerFromStyleStruct style = <style_struct>
		endif
	endif
endscript

script jam_band_create_highway 
	printf \{channel = jam_mode
		qs(0x2019133c)}
	jam_band_highway_pos = (223.0, 611.0)
	jam_band_highway_height = 52
	highway_priority = 150
	suffix = '_fretbars'
	AppendSuffixToChecksum base = <song> SuffixString = <suffix>
	song_fretbars = <appended_id>
	suffix = '_timesig'
	AppendSuffixToChecksum base = <song> SuffixString = <suffix>
	song_timesig = <appended_id>
	GetArraySize $<song_fretbars>
	suffix = '_size'
	AppendSuffixToChecksum base = <song_fretbars> SuffixString = <suffix>
	<fretbar_array_size> = <appended_id>
	CreateScreenElement \{type = ContainerElement
		parent = jam_band_container
		id = jam_band_highway_master
		just = [
			center
			center
		]
		scale = (0.95, 1.37)
		Pos = (370.0, 626.0)
		rot_angle = 0}
	CreateScreenElement \{type = ContainerElement
		parent = jam_band_highway_master
		id = jam_band_highway
		Pos = (0.0, 0.0)
		scale = 1
		z_priority = 20}
	musicstudio_jamroom_create_hud_extras
	song_length = ($<song_fretbars> [(($<fretbar_array_size>) - 1)])
	song_length_seconds = (<song_length> / 1000.0)
	fit_in_width = 820.0
	pixels_per_second = ((<fit_in_width> / <song_length_seconds>) * (1.0, 0.0))
	Change jam_band_pixels_per_second = <pixels_per_second>
	Change \{jam_band_playline_pos = (0.0, 0.0)}
	Change jam_band_song_length = <song_length>
	bar_size = ((<song_length> / 1000.0) * <pixels_per_second>)
	CreateScreenElement \{type = ContainerElement
		parent = jam_band_highway
		id = jam_band_highway_playline
		Pos = (0.0, 0.0)
		scale = 1}
	CreateScreenElement {
		type = SpriteElement
		parent = jam_band_highway_playline
		texture = white
		dims = (2.0, 65.0)
		just = [left center]
		rgba = [200 200 200 255]
		Pos = (-6.0, 0.0)
		z_priority = (<highway_priority> + 3)
	}
	safe_hide \{id = jam_band_highway_playline}
	CreateScreenElement {
		type = SpriteElement
		parent = jam_band_highway
		id = jamroom_hud_playline
		texture = white
		dims = (2.0, 56.0)
		just = [left center]
		rgba = [200 200 200 255]
		Pos = (-2.0, 0.0)
		z_priority = (<highway_priority> + 3)
	}
	if ScreenElementExists \{id = jam_band_highway_bars_container}
		DestroyScreenElement \{id = jam_band_highway_bars_container}
	endif
	CreateScreenElement \{type = ContainerElement
		parent = jam_band_highway
		id = jam_band_highway_bars_container
		Pos = (0.0, 0.0)}
	count = 0
	curr_time = 0
	begin
	bar_pos = ((<curr_time> / 1000.0) * <pixels_per_second>)
	CreateScreenElement {
		type = SpriteElement
		parent = jam_band_highway_bars_container
		texture = white
		just = [center center]
		rgba = [40 40 40 255]
		Pos = <bar_pos>
		dims = ((1.0, 0.0) + ((0.0, 1.0) * <jam_band_highway_height>))
		z_priority = (<highway_priority> + 1)
	}
	<curr_time> = (<curr_time> + 60000)
	if (<curr_time> >= 600000)
		break
	endif
	repeat
	spawnscriptnow jam_band_update_highway id = jam_band_spawns params = {<...>}
endscript

script jam_band_update_highway 
	begin
	spawnscriptnow jam_band_update_highway_detailed params = {<...> refresh_bots = 0}
	begin
	if ($jam_band_force_refresh_detailed_highway = 1)
		spawnscriptnow jam_band_update_highway_detailed params = {<...>}
		Change \{jam_band_force_refresh_detailed_highway = 0}
	endif
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

script jam_band_update_highway_detailed \{pixels_per_second = (0.0, 0.0)
		refresh_bots = 1}
	highway_priority = 50
	block_seperation = 1000
	GetArraySize \{$jam_tracks}
	index = 0
	track_offset = 10.5
	note_time = 0
	note_string = 0
	note_fret = 0
	note_type = 0
	note_effect = 0
	note_velocity = 0
	note_chord_type = 0
	note_length = 0
	note_pattern = 0
	note_sound_bitfield = 0
	note_drum_velocity_array = []
	track_id_simple = None
	track_id = None
	block_start = (0.0, 0.0)
	block_end = (0.0, 0.0)
	begin
	<rebuild> = 1
	if (<refresh_bots> = 0)
		musicstudio_mainobj :MusicStudioJamRoom_GetBotStatus index = <index>
		if (<enabled> = 1)
			<rebuild> = 0
		endif
	endif
	if (<rebuild> = 1)
		GetTrackSize track = ($jam_tracks [<index>].id)
		<offset> = ($jam_tracks [<index>].jamroom_track_offset)
		bar_pos = ((0.0, 1.0) * (<track_offset> * (<offset> + 1)))
		bar_pos = (<bar_pos> - ((0.0, 1.0) * 30))
		FormatText checksumname = track_id_simple 'track_id_simple_%s' s = <index>
		if ScreenElementExists id = <track_id_simple>
			DestroyScreenElement id = <track_id_simple>
		endif
		FormatText checksumname = track_id 'track_id_%s' s = <index>
		if ScreenElementExists id = <track_id>
			DestroyScreenElement id = <track_id>
		endif
		CreateScreenElement {
			type = ContainerElement
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
		if (<track_size> > 0)
			begin
			GetCustomNote track = ($jam_tracks [<index>].id) index = <block_index>
			if (<start_block_time> < 0)
				<start_block_time> = <note_time>
				<end_block_time> = (<note_time> + <note_length>)
			endif
			if (((<note_time> + <note_length>) - <end_block_time>) >= <block_seperation>)
				block_start = ((<start_block_time> / 1000.0) * <pixels_per_second>)
				block_end = (((<end_block_time> - <start_block_time>) / 1000.0) * <pixels_per_second>)
				CreateScreenElement {
					type = SpriteElement
					parent = <track_id>
					texture = white
					just = [left center]
					rgba = ($jam_tracks [<index>].Color)
					Pos = <block_start>
					dims = ((0.0, 5.0) + <block_end>)
					z_priority = (<highway_priority> + 100)
				}
				<start_block_time> = <note_time>
			endif
			<end_block_time> = (<note_time> + <note_length>)
			<block_index> = (<block_index> + 1)
			repeat <track_size>
		endif
		if (<block_index> >= <track_size>)
			block_start = ((<start_block_time> / 1000.0) * <pixels_per_second>)
			block_end = (((<end_block_time> - <start_block_time>) / 1000.0) * <pixels_per_second>)
			CreateScreenElement {
				type = SpriteElement
				parent = <track_id>
				texture = white
				just = [left center]
				rgba = ($jam_tracks [<index>].Color)
				Pos = <block_start>
				dims = ((0.0, 5.0) + <block_end>)
				z_priority = (<highway_priority> + 100)
			}
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script jam_band_update_highway_simple 
	highway_priority = 50
	GetArraySize \{$jam_tracks}
	index = 0
	track_offset = 10.5
	begin
	<show_bar> = 1
	player_has_inst = 0
	player = 1
	begin
	GetPlayerInfo <player> jam_instrument
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
			<offset> = ($jam_tracks [<index>].jamroom_track_offset)
			bar_pos = (<bar_pos> + ((0.0, 1.0) * (<track_offset> * (<offset> + 1))))
			bar_pos = (<bar_pos> - ((0.0, 1.0) * 30))
			track_size = ((($jam_highway_play_time / 1000) * <pixels_per_second>) - (($jam_player_recording_begin_time [(<player_has_inst> - 1)] / 1000) * <pixels_per_second>))
			if (<show_bar> = 1)
				FormatText checksumname = track_id 'track_id_simple_%s' s = <index>
				if ScreenElementExists id = <track_id>
					DestroyScreenElement id = <track_id>
				endif
				<Color> = [220 220 220 150]
				CreateScreenElement {
					type = SpriteElement
					id = <track_id>
					parent = jam_band_highway
					texture = white
					just = [left center]
					rgba = <Color>
					Pos = <bar_pos>
					dims = ((0.0, 5.0) + <track_size>)
					z_priority = (<highway_priority> + 101)
				}
			endif
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script jam_create_select_instrument_menu \{player = 0}
	if GotParam \{do_wait}
		wait \{0.5
			seconds}
	endif
	GetPlayerInfo <player> controller
	musicstudio_jamroom_init_player_menu player = <player> controller = <controller>
endscript
is_drum_machine = 0

script jam_create_drum_type_select_menu 
	i = 1
	begin
	GetPlayerInfo <i> jam_instrument
	if (<jam_instrument> = 3)
		wait \{10
			gameframes}
		return
	endif
	<i> = (<i> + 1)
	repeat 4
	ui_menu_select_sfx
	jam_destroy_select_instrument_menu player = <player>
	GetPlayerInfo <player> controller
	SetPlayerInfo <player> jam_instrument = 3
	if ($game_mode = practice)
		<controller> = 5
	endif
	band_leader_alpha = 0
	if (<controller> = $primary_controller)
		<band_leader_alpha> = 1
	endif
	FormatText checksumname = drum_select_element 'drum_select_element_%a' a = <player>
	FormatText TextName = player_string qs(0x7bc47761) a = <player>
	CreateScreenElement {
		parent = <player_cont>
		id = <drum_select_element>
		type = DescInterface
		desc = 'jam_player'
		Pos = (-84.0, 70.0)
		exclusive_device = <controller>
		player_text = <player_string>
		band_leader_alpha = <band_leader_alpha>
	}
	ResolveScreenElementID id = {<drum_select_element> child = {scroll_menu child = Menu}}
	if (<controller> = ($primary_controller))
		<resolved_id> :SE_SetProps event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_start jam_band_pause params = {select_player = <player> player_cont = <player_cont> event_cont = <resolved_id> paused_at_inst}}
			{pad_back ui_menu_select_sfx}
			{pad_back jam_remove_sub_type_select_menu params = {player = <player> player_cont = <player_cont>}}
		]
	else
		<resolved_id> :SE_SetProps event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back ui_menu_select_sfx}
			{pad_back jam_remove_sub_type_select_menu params = {player = <player> player_cont = <player_cont>}}
		]
	endif
	<pause_font_color> = [80 80 80 255]
	set_focus_color \{Color = white220}
	set_unfocus_color rgba = <pause_font_color>
	FormatText checksumname = drum_select_text_id 'jam_%a_drum_select_text_%b' a = 0 b = <player>
	CreateScreenElement {
		type = TextBlockElement
		parent = <resolved_id>
		id = <drum_select_text_id>
		font = fontgrid_text_A3
		just = [center center]
		internal_just = [center center]
		scale = 1
		rgba = <pause_font_color>
		dims = (150.0, 35.0)
		text = qs(0x388cd3db)
		z_priority = 35
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = original
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <drum_select_text_id>}}
			{unfocus retail_menu_unfocus}
			{pad_choose jam_player_select_instrument params = {player = <player> select_instrument = <select_instrument> is_drum_machine = 0 from_sub}}
		]
	}
	FormatText checksumname = drum_select_text_id 'jam_%a_drum_select_text_%b' a = 1 b = <player>
	CreateScreenElement {
		type = TextBlockElement
		parent = <resolved_id>
		id = <drum_select_text_id>
		font = fontgrid_text_A3
		just = [center center]
		internal_just = [center center]
		scale = 1
		rgba = <pause_font_color>
		dims = (150.0, 35.0)
		text = qs(0xf24238cd)
		z_priority = 35
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		text_case = original
		exclusive_device = <controller>
		event_handlers = [
			{focus jam_pause_focus params = {id = <drum_select_text_id>}}
			{unfocus retail_menu_unfocus}
			{pad_choose jam_player_select_instrument params = {player = <player> select_instrument = <select_instrument> is_drum_machine = 1 from_sub}}
		]
	}
	if ScreenElementExists id = <drum_select_element>
		RunScriptOnScreenElement id = <drum_select_element> LegacyDoMorph params = {Pos = (-84.0, 70.0) time = 0.1}
	endif
	if NOT CanAssignAlias id = <resolved_id>
		return
	endif
	AssignAlias id = <resolved_id> alias = current_menu
	LaunchEvent \{target = current_menu
		type = focus}
	if ($game_mode = practice)
		jam_band_container :GetTags
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
	GetPlayerInfo <i> jam_instrument
	if (<select_instrument> = <jam_instrument>)
		wait \{10
			gameframes}
		return
	endif
	<i> = (<i> + 1)
	repeat 4
	ui_menu_select_sfx
	jam_destroy_select_instrument_menu player = <player>
	GetPlayerInfo <player> controller
	SetPlayerInfo <player> jam_instrument = <select_instrument>
	if ($game_mode = practice)
		<controller> = 5
	endif
	band_leader_alpha = 0
	if (<controller> = $primary_controller)
		<band_leader_alpha> = 1
	endif
	FormatText checksumname = guitar_select_element 'guitar_select_element_%a' a = <player>
	FormatText TextName = player_string qs(0x7bc47761) a = <player>
	CreateScreenElement {
		parent = <player_cont>
		id = <guitar_select_element>
		type = DescInterface
		desc = 'jam_player'
		Pos = (-84.0, 70.0)
		exclusive_device = <controller>
		player_text = <player_string>
		band_leader_alpha = <band_leader_alpha>
	}
	ResolveScreenElementID id = {<guitar_select_element> child = {scroll_menu child = Menu}}
	if (<controller> = ($primary_controller))
		<resolved_id> :SE_SetProps event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_start jam_band_pause params = {select_player = <player> player_cont = <player_cont> event_cont = <resolved_id> paused_at_inst}}
			{pad_back ui_menu_select_sfx}
			{pad_back jam_remove_sub_type_select_menu params = {player = <player> player_cont = <player_cont>}}
		]
	else
		<resolved_id> :SE_SetProps event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back ui_menu_select_sfx}
			{pad_back jam_remove_sub_type_select_menu params = {player = <player> player_cont = <player_cont>}}
		]
	endif
	<pause_font_color> = [80 80 80 255]
	set_focus_color \{Color = white220}
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
	FormatText checksumname = guitar_select_text_id 'jam_%a_guitar_select_text_%b' a = 0 b = <player>
	CreateScreenElement {
		type = TextBlockElement
		parent = <resolved_id>
		id = <guitar_select_text_id>
		font = fontgrid_text_A3
		just = [center center]
		internal_just = [center center]
		scale = 1
		rgba = <pause_font_color>
		dims = (150.0, 35.0)
		text = <type_text>
		z_priority = 35
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
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
	FormatText checksumname = guitar_select_text_id 'jam_%a_guitar_select_text_%b' a = 1 b = <player>
	CreateScreenElement {
		type = TextBlockElement
		parent = <resolved_id>
		id = <guitar_select_text_id>
		font = fontgrid_text_A3
		just = [center center]
		internal_just = [center center]
		scale = 1
		rgba = <pause_font_color>
		dims = (170.0, 35.0)
		text = <machine_text>
		z_priority = 35
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
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
	if ScreenElementExists id = <guitar_select_element>
		RunScriptOnScreenElement id = <guitar_select_element> LegacyDoMorph params = {Pos = (-84.0, 70.0) time = 0.1}
	endif
	AssignAlias id = <resolved_id> alias = current_menu
	LaunchEvent \{target = current_menu
		type = focus}
	if ($game_mode = practice)
		jam_band_container :GetTags
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
	GetPlayerInfo <player> jam_instrument
	if (<player> = <parent_player>)
		if (<jam_instrument> >= 0)
			return
		endif
	endif
	<last_inst> = (<player_instruments> [(<player> -1)])
	if NOT (<jam_instrument> = <last_inst>)
		SetArrayElement arrayName = player_instruments index = (<player> -1) newValue = <jam_instrument>
		if (<jam_instrument> >= 0)
			FormatText checksumname = inst_select_text 'jam_%a_select_text_%b' a = <jam_instrument> b = <parent_player>
			if ScreenElementExists id = <inst_select_text>
				<inst_select_text> :SE_SetProps not_focusable
				FormatText checksumname = inst_select_element 'inst_select_element_%a' a = <parent_player>
				ResolveScreenElementID id = {<inst_select_element> child = {scroll_menu child = Menu}}
				<resolved_id> :GetTags
				if GotParam \{tag_selected_index}
					if ((<tag_selected_index> = <jam_instrument>) || (<is_drumkit> = 1) || (<is_gamepad> = 1))
						LaunchEvent type = unfocus target = <resolved_id>
						<resolved_id> :SetProps not_focusable
						LaunchEvent type = focus target = <resolved_id> data = {child_id = <inst_select_text>}
					endif
				endif
				<inst_select_text> :SE_SetProps rgba = [30 30 30 255]
			endif
		else
			FormatText checksumname = inst_select_text 'jam_%a_select_text_%b' a = <last_inst> b = <parent_player>
			if ScreenElementExists id = <inst_select_text>
				<inst_select_text> :SE_SetProps focusable
				<inst_select_text> :SE_SetProps rgba = ($menu_unfocus_color)
				FormatText checksumname = inst_select_element 'inst_select_element_%a' a = <parent_player>
				ResolveScreenElementID id = {<inst_select_element> child = {scroll_menu child = Menu}}
				<resolved_id> :GetTags
				if (<is_drumkit> = 1)
					FormatText checksumname = drum_select_text 'jam_3_select_text_%b' b = <parent_player>
					if ScreenElementExists id = <drum_select_text>
						LaunchEvent type = focus target = <drum_select_text>
					endif
				elseif (<is_gamepad> = 1)
					FormatText checksumname = mic_select_text 'jam_5_select_text_%b' b = <parent_player>
					if ScreenElementExists id = <mic_select_text>
						LaunchEvent type = focus target = <mic_select_text>
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
	GetPlayerInfo <player> controller
	if (<select_instrument> = 5)
		if NOT jam_controller_can_use_mic controller = <controller>
			jam_band_controller_warning_box player = <player>
			return
		endif
	endif
	if NOT GotParam \{from_sub}
		i = 1
		begin
		GetPlayerInfo <i> jam_instrument
		if (<jam_instrument> = <select_instrument>)
			wait \{10
				gameframes}
			printf qs(0x36513b73) a = <select_instrument>
			return
		endif
		<i> = (<i> + 1)
		repeat 4
	endif
	ui_menu_select_sfx
	SetPlayerInfo <player> jam_instrument = <select_instrument>
	switch <select_instrument>
		case 0
		FormatText checksumname = inst_select_element 'inst_select_element_%a' a = <player>
		case 1
		case 2
		case 4
		SetArrayElement arrayName = is_arpeggiator GlobalArray index = <select_instrument> newValue = <is_arpeggiator>
		FormatText checksumname = inst_select_element 'guitar_select_element_%a' a = <player>
		case 3
		Change is_drum_machine = <is_drum_machine>
		FormatText checksumname = inst_select_element 'drum_select_element_%a' a = <player>
	endswitch
	if ScreenElementExists id = <inst_select_element>
		LaunchEvent target = <inst_select_element> type = unfocus
	endif
	if ScreenElementExists id = <inst_select_element>
		RunScriptOnScreenElement id = <inst_select_element> LegacyDoMorph params = {Pos = (-84.0, -400.0) time = 0.1}
	endif
	jam_destroy_select_instrument_menu player = <player>
	jam_destroy_select_drum_type_menu player = <player>
	jam_destroy_select_guitar_type_menu player = <player>
	FormatText checksumname = player_cont 'inst_player_cont_%s' s = <player>
	jam_create_instrument select_player = <player> player_cont = <player_cont>
	jam_create_player_info player = <player> player_cont = <player_cont>
	if ScreenElementExists \{id = jam_band_container}
		jam_band_container :SetTags \{allow_easy_backout = 0}
	endif
	menu_jam_band_add_control_helpers state = instrument_ui instrument = <select_instrument>
	if ($game_mode = practice)
		broadcastevent type = jam_tutorial_instrument_selected data = {select_instrument = <select_instrument>}
	endif
endscript

script jam_destroy_select_instrument_menu 
	FormatText checksumname = inst_select_element 'inst_select_element_%a' a = <player>
	if GotParam \{player}
		switch <player>
			case 1
			PlaySound \{Jam_Pause_Panel_out
				vol = -16
				pitch = -0.5
				buss = front_end
				pan1x = -0.15
				pan1y = 1
				pan2x = -0.15
				pan2y = 1}
			case 2
			PlaySound \{Jam_Pause_Panel_out
				vol = -16
				pitch = 0
				buss = front_end
				pan1x = -0.05
				pan1y = 1
				pan2x = -0.05
				pan2y = 1}
			case 3
			PlaySound \{Jam_Pause_Panel_out
				vol = -16
				pitch = 0.5
				buss = front_end
				pan1x = 0.05
				pan1y = 1
				pan2x = 0.05
				pan2y = 1}
			case 4
			PlaySound \{Jam_Pause_Panel_out
				vol = -16
				pitch = 1
				buss = front_end
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
	FormatText checksumname = drum_select_element 'drum_select_element_%a' a = <player>
	if ScreenElementExists id = <drum_select_element>
		DestroyScreenElement id = <drum_select_element>
	endif
endscript

script jam_destroy_select_guitar_type_menu 
	FormatText checksumname = guitar_select_element 'guitar_select_element_%a' a = <player>
	if ScreenElementExists id = <guitar_select_element>
		DestroyScreenElement id = <guitar_select_element>
	endif
endscript

script jam_easy_backout 
	jam_band_container :GetTags
	if (<allow_easy_backout> = 1)
		jam_band_quit_dialog select_player = <select_player>
	endif
endscript

script jam_create_player_info 
	return
	GetPlayerInfo <player> jam_instrument
	GetPlayerInfo <player> controller
	if (<jam_instrument> = 3)
		percussion_alpha = 1
	else
		percussion_alpha = 0
	endif
	band_leader_alpha = 0
	if (<controller> = ($primary_controller))
		<band_leader_alpha> = 1
	endif
	FormatText checksumname = player_info_element 'player_info_element_%a' a = <player>
	CreateScreenElement {
		parent = <player_cont>
		id = <player_info_element>
		type = DescInterface
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
			<player_info_element> :SE_SetProps glow_alpha = 0.0
			<player_info_element> :SE_SetProps percussion_text = qs(0x26239ec0)
		endif
	else
		if ScreenElementExists id = <player_info_element>
			<player_info_element> :SE_SetProps glow_alpha = 0.65000004
			<player_info_element> :SE_SetProps percussion_text = qs(0x6988d970)
		endif
	endif
	GetArraySize \{$jam_tracks}
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
	<player_info_element> :SetProps instrument_name_text = <inst_name>
	jam_create_effect_info_box player = <player> quick_tabs_active = <quick_tabs_active> player_info_element = <player_info_element>
endscript

script jam_destroy_player_info_box 
	spawnscriptnow id = jam_band_spawns jam_remove_extra_info params = {player = <player>}
	FormatText checksumname = player_info_element 'player_info_element_%a' a = <player>
	if ScreenElementExists id = <player_info_element>
		DestroyScreenElement id = <player_info_element>
	endif
endscript

script jam_create_instrument 
	GetPlayerInfo <select_player> jam_instrument
	GetPlayerInfo <select_player> controller
	FormatText checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
	if (<jam_instrument> = $jam_mic_id)
		killspawnedscript id = <jam_player_spawns>
		spawnscriptnow jam_band_activate_mic id = <jam_player_spawns> params = {select_player = <select_player>}
	else
		FormatText checksumname = input_spawn 'input_spawn_%s' s = <select_player>
		if StructureContains structure = ($jam_tracks [<jam_instrument>]) input_func
			spawnscriptnow ($jam_tracks [<jam_instrument>].input_func) id = <input_spawn> params = {select_player = <select_player> show_hud = 0 controller = <controller> spawn_id = <input_spawn>}
		endif
	endif
endscript

script jam_destroy_instrument 
	GetPlayerInfo <select_player> jam_instrument
	if NOT (<jam_instrument> = $jam_mic_id)
		if StructureContains structure = ($jam_tracks [<jam_instrument>]) ui_destroy_func
			FormatText checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
			spawnscriptnow ($jam_tracks [<jam_instrument>].ui_destroy_func) id = <jam_player_spawns> params = {player = <select_player>}
		endif
	endif
	FormatText checksumname = input_spawn 'input_spawn_%s' s = <select_player>
	killspawnedscript id = <input_spawn>
	kill_arpeggiator_loop select_player = <select_player>
	if (<jam_instrument> = $jam_mic_id)
		jam_band_deactivate_mic select_player = <select_player>
	endif
	LaunchEvent type = unfocus target = <inst_cont>
	destroy_menu menu_id = <inst_cont>
	spawnscriptnow id = jam_band_spawns jam_create_select_instrument_menu params = {player = <select_player> player_cont = <player_cont> morph = 1}
endscript

script jam_setup_fretboard 
	return
	jam_create_fretboard parent_id = <parent_id> player = <player>
	FormatText checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <player>
	FormatText checksumname = fretboard_id 'jam_fretboard_base_%s' s = <player>
	GetPlayerInfo <player> jam_instrument
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
		GetPlayerInfo <player> jam_instrument
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
	FormatText checksumname = base_id 'jam_fretboard_base_%s' s = <player>
	RunScriptOnScreenElement id = <base_id> LegacyDoMorph params = {Pos = (0.0, 275.0) time = 0.1}
	if ScreenElementExists id = <fretboard_id>
		RunScriptOnScreenElement id = <fretboard_id> jam_fretboard_update params = {tilt_enabled = <tilt_enabled> tilt_global = <tilt_global> num_tilts = <num_tilts> player = <player>}
	endif
endscript

script jam_create_fretboard \{parent_id = root_window
		z_priority = 2}
	FormatText checksumname = base_id 'jam_fretboard_base_%s' s = <player>
	CreateScreenElement {
		type = ContainerElement
		parent = <parent_id>
		id = <base_id>
		just = [center top]
		Pos = (0.0, 400.0)
		dims = (150.0, 210.0)
	}
	FormatText checksumname = scrolling_window 'jam_scroll_window_%s' s = <player>
	CreateScreenElement {
		type = WindowElement
		parent = <base_id>
		id = <scrolling_window>
		just = [left top]
		Pos = (0.0, 0.0)
		dims = (150.0, 185.0)
	}
	FormatText checksumname = scrolling_board1 'jam_scroller1_%s' s = <player>
	CreateScreenElement {
		type = SpriteElement
		parent = <scrolling_window>
		id = <scrolling_board1>
		just = [left top]
		rgba = [200 200 200 255]
		texture = scrolling_fretboard
		Pos = (0.0, 0.0)
		dims = (150.0, 187.0)
		z_priority = (<z_priority> + 2)
	}
	FormatText checksumname = scrolling_board2 'jam_scroller2_%s' s = <player>
	CreateScreenElement {
		type = SpriteElement
		parent = <scrolling_window>
		id = <scrolling_board2>
		just = [left top]
		rgba = [200 200 200 255]
		texture = scrolling_fretboard
		Pos = (0.0, -180.0)
		dims = (150.0, 187.0)
		z_priority = (<z_priority> + 2)
	}
	FormatText checksumname = now_id 'jam_now_bar_%s' s = <player>
	CreateScreenElement {
		type = ContainerElement
		parent = <base_id>
		id = <now_id>
		just = [center center]
		Pos = (0.0, 0.0)
		scale = 0.7
		z_priority = (<z_priority> + 3)
	}
	FormatText checksumname = gems_id 'jam_falling_gem_container_%s' s = <player>
	CreateScreenElement {
		type = ContainerElement
		parent = <base_id>
		id = <gems_id>
		just = [center center]
		Pos = (0.0, 0.0)
		scale = 0.7
		z_priority = (<z_priority> + 3)
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <now_id>
		just = [left top]
		rgba = [0 0 0 255]
		texture = white
		Pos = (-10.0, 0.0)
		dims = (30.0, 200.0)
		z_priority = (<z_priority> - 5)
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <now_id>
		just = [left top]
		rgba = [0 0 0 255]
		texture = white
		Pos = (190.0, 0.0)
		dims = (30.0, 200.0)
		z_priority = (<z_priority> - 5)
	}
	<pressed_gem_props> = {type = SpriteElement parent = <now_id> just = [center center] scale = 1 z_priority = (<z_priority> + 4)}
	<Drum> = 0
	<rb_drum> = 0
	GetPlayerInfo <player> controller
	if isdrumcontroller controller = <controller>
		if IsRBDrum controller = <controller>
			<rb_drum> = 1
		endif
		<Drum> = 1
	endif
	jam_menu_get_lefty player = <player>
	if (<Drum> = 1)
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
	FormatText checksumname = gem_id 'jam_now_on_gr_%s' s = <player>
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
	FormatText checksumname = gem_id 'jam_now_on_re_%s' s = <player>
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
	FormatText checksumname = gem_id 'jam_now_on_ye_%s' s = <player>
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
	FormatText checksumname = gem_id 'jam_now_on_bl_%s' s = <player>
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
	FormatText checksumname = gem_id 'jam_now_on_or_%s' s = <player>
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
	GetPlayerInfo <player> jam_instrument
	if NOT (<jam_instrument> = 3)
		FormatText checksumname = now_pick 'jam_pick_%s' s = <player>
		CreateScreenElement {
			type = SpriteElement
			parent = <now_id>
			id = <now_pick>
			texture = pick
			rgba = [200 200 200 255]
			just = [center center]
			Pos = (230.0, 35.0)
			scale = 2
			rot_angle = 10
			z_priority = (<z_priority> + 7)
		}
		FormatText checksumname = note_text_id 'jam_note_text_%s' s = <player>
		CreateScreenElement {
			type = TextElement
			id = <note_text_id>
			parent = <now_pick>
			font = fontgrid_text_A3
			just = [center center]
			scale = 0.4
			rgba = [0 0 0 255]
			Pos = (19.0, 15.0)
			text = qs(0x00000000)
			noshadow
		}
	endif
	GetPlayerInfo <player> controller
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
	FormatText checksumname = tilt_id 'jam_tilt_needle_%s' s = <player>
	CreateScreenElement {
		type = SpriteElement
		id = <tilt_id>
		parent = <now_id>
		texture = pitch_dial
		just = [center center]
		scale = 2
		Pos = (14.0, 2.0)
		z_priority = <z_priority>
		alpha = <tilt_meter_alpha>
	}
	FormatText checksumname = tilt_meter_id 'jam_tilt_meter_%s' s = <player>
	CreateScreenElement {
		type = SpriteElement
		parent = <now_id>
		id = <tilt_meter_id>
		texture = <meter_texture>
		just = [center center]
		scale = 2
		Pos = (-12.0, 1.0)
		z_priority = <z_priority>
		alpha = <tilt_meter_alpha>
	}
	RunScriptOnScreenElement id = <base_id> jam_lightup_held_note_sprites params = {controller = <controller> player = <player>}
endscript

script jam_fretboard_update \{tilt_enabled = 0}
	FormatText checksumname = tilt_id 'jam_tilt_needle_%s' s = <player>
	FormatText checksumname = tilt_meter_id 'jam_tilt_meter_%s' s = <player>
	<last_tilt> = -1
	FormatText checksumname = scrolling_board1 'jam_scroller1_%s' s = <player>
	FormatText checksumname = scrolling_board2 'jam_scroller2_%s' s = <player>
	<scroller1_pos> = (0.0, 0.0)
	<scroller2_pos> = (0.0, -185.0)
	GetPlayerInfo <player> jam_instrument
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
			<tilt_id> :SE_SetProps alpha = 1
			<tilt_meter_id> :SE_SetProps alpha = 1 texture = pitch_meter
		else
			<tilt_id> :SE_SetProps alpha = 1
			<tilt_meter_id> :SE_SetProps alpha = 1 texture = pitch_meter_quarter
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
					LegacyDoScreenElementMorph id = <tilt_id> time = 0.15 rot_angle = -20
					case 1
					LegacyDoScreenElementMorph id = <tilt_id> time = 0.15 rot_angle = 20
				endswitch
			else
				switch (<last_tilt>)
					case 0
					LegacyDoScreenElementMorph id = <tilt_id> time = 0.15 rot_angle = -45
					case 1
					LegacyDoScreenElementMorph id = <tilt_id> time = 0.15 rot_angle = -15
					case 2
					LegacyDoScreenElementMorph id = <tilt_id> time = 0.15 rot_angle = 15
					case 3
					LegacyDoScreenElementMorph id = <tilt_id> time = 0.15 rot_angle = 45
				endswitch
			endif
		endif
	endif
	<scroller1_pos> = (<scroller1_pos> + ((0.0, 1.0) * <y_inc>))
	<scroller2_pos> = (<scroller2_pos> + ((0.0, 1.0) * <y_inc>))
	<scrolling_board1> :SE_SetProps Pos = <scroller1_pos>
	<scrolling_board2> :SE_SetProps Pos = <scroller2_pos>
	if ((<scroller1_pos> [1]) > <bottom_limit>)
		<scrolling_board1> :SE_SetProps Pos = <scroller1_start>
		<scroller1_pos> = <restart_pos>
	elseif ((<scroller2_pos> [1]) > <bottom_limit>)
		<scrolling_board2> :SE_SetProps Pos = <scroller2_start>
		<scroller2_pos> = <restart_pos>
	endif
	wait \{1
		gameframe}
	repeat
endscript

script jam_lightup_held_note_sprites 
	FormatText checksumname = gem_gr 'jam_now_on_gr_%s' s = <player>
	FormatText checksumname = gem_re 'jam_now_on_re_%s' s = <player>
	FormatText checksumname = gem_ye 'jam_now_on_ye_%s' s = <player>
	FormatText checksumname = gem_bl 'jam_now_on_bl_%s' s = <player>
	FormatText checksumname = gem_or 'jam_now_on_or_%s' s = <player>
	FormatText checksumname = note_text_id 'jam_note_text_%s' s = <player>
	GetPlayerInfo <player> jam_instrument
	diatonic = 0
	<exclusive> = 0
	switch (<jam_instrument>)
		case 0
		<note_func> = jam_input_rhythm_get_current_note
		<tilt_var> = jam_tilt_rhythm
		case 1
		<note_func> = jam_input_lead_get_current_note
		<exclusive> = 1
		<tilt_var> = jam_tilt_lead
		guitar_jam_scales_get_diatonic \{instrument = 1}
		case 2
		<note_func> = jam_input_bass_get_current_note
		<exclusive> = 1
		<tilt_var> = jam_tilt_bass
		guitar_jam_scales_get_diatonic \{instrument = 1}
		if (($jam_current_melody_kit) > 0)
			<diatonic> = 0
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
	GetHeldPattern controller = <controller> player = <player>
	if (<jam_instrument> != 3)
		<update_tilt> = 0
		if (<last_tilt> != ($<tilt_var>))
			<update_tilt> = 1
		endif
	endif
	if ((<hold_pattern> != <last_pattern>) || (<update_tilt> = 1))
		<last_pattern> = <hold_pattern>
		if (<diatonic> = 1)
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
			if ScreenElementExists \{id = jam_studio_element}
				jam_studio_element :SetProps note_text = <single_note_text>
			else
				<note_text_id> :SE_SetProps text = <single_note_text>
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
	FormatText checksumname = gem_gr 'jam_now_on_gr_%s' s = <player>
	FormatText checksumname = gem_re 'jam_now_on_re_%s' s = <player>
	FormatText checksumname = gem_ye 'jam_now_on_ye_%s' s = <player>
	FormatText checksumname = gem_bl 'jam_now_on_bl_%s' s = <player>
	FormatText checksumname = gem_or 'jam_now_on_or_%s' s = <player>
	FormatText checksumname = note_text_id 'jam_note_text_%s' s = <player>
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
	FormatText checksumname = gem_gr 'jam_now_on_gr_%s' s = <player>
	FormatText checksumname = gem_re 'jam_now_on_re_%s' s = <player>
	FormatText checksumname = gem_ye 'jam_now_on_ye_%s' s = <player>
	FormatText checksumname = gem_bl 'jam_now_on_bl_%s' s = <player>
	FormatText checksumname = gem_or 'jam_now_on_or_%s' s = <player>
	FormatText checksumname = note_text_id 'jam_note_text_%s' s = <player>
	safe_hide id = <gem_gr>
	safe_hide id = <gem_re>
	safe_hide id = <gem_ye>
	safe_hide id = <gem_bl>
	safe_hide id = <gem_or>
endscript

script jam_ghmix_note_quick_update 
	GetPlayerInfo <player> jam_instrument
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
	printstruct <...>
	<note_func> player = <player> hold_pattern = 1048576
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
	FormatText checksumname = player_cont 'inst_player_cont_%s' s = <player>
	if NOT ScreenElementExists id = <player_cont>
		return
	endif
	gem_pos_start = (19.0, 0.0)
	gem_offset = (44.0, 0.0)
	jam_menu_get_lefty player = <player>
	GetPlayerInfo <player> jam_instrument
	GetPlayerInfo <player> controller
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
	musicstudio_input_send_pattern_to_highway gem_pattern = <gem_pattern> player = <player>
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
	GetPlayerInfo <player> jam_instrument
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
		<gem_id> :SE_SetProps Pos = <gem_pos>
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
			<sustain_id> :SE_SetProps Pos = <sustain_pos>
			<past_start_limit> = 1
		else
			if ((<global_id> = ($<sustain_global>)) && (<free_fall> = 0))
				<sustain_dims> = (<sustain_dims> + ((0.0, 1.0) * <y_inc>))
				<sustain_id> :SE_SetProps dims = <sustain_dims>
			else
				<sustain_pos> = (<sustain_pos> + ((0.0, 1.0) * <y_inc>))
				<sustain_id> :SE_SetProps Pos = <sustain_pos>
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
	wait \{1
		gameframe}
	repeat
endscript

script jam_update_falling_gem_sustain 
	<cur_id> = ($<sustain_global>)
	if GotParam \{Stop}
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
		Change globalname = <sustain_global> newValue = <cur_id>
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
	Change globalname = <sustain_global> newValue = <cur_id>
endscript

script jam_destroy_fretboard 
	return
	FormatText checksumname = base_id 'jam_fretboard_base_%s' s = <player>
	if ScreenElementExists id = <base_id>
		DestroyScreenElement id = <base_id>
	endif
endscript

script jam_band_pause \{back_to_jam_band = 1
		shake = 1
		hide_ghmix = 0}
	if NOT GotParam \{forced_pause}
		if ($game_mode = practice)
			return
		endif
	endif
	FormatText checksumname = input_spawn 'input_spawn_%s' s = <select_player>
	killspawnedscript id = <input_spawn>
	stop_custom_song
	kill_arpeggiator_loop select_player = <select_player> reset_pattern = true
	GetPlayerInfo <select_player> jam_instrument
	if (<jam_instrument> = $jam_mic_id)
		jam_band_deactivate_mic select_player = <select_player>
	elseif (<jam_instrument> = 4)
		jam_input_melody_stop_sound
	endif
	jam_stop_sound jam_instrument = <jam_instrument>
	GetPlayerInfo <select_player> controller
	LaunchEvent type = unfocus target = <event_cont>
	FormatText checksumname = player_pause 'jam_band_pause_%s' s = <select_player>
	if ScreenElementExists id = <player_pause>
		DestroyScreenElement id = <player_pause>
		if ($jam_advanced_record = 1)
			SoundEvent \{event = Jam_Advanced_Record_Pause_Panel_Out}
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
	FormatText TextName = player_string qs(0x033007b2) s = <select_player>
	if GotParam \{adv_record}
		CreateScreenElement {
			local_id = clip_window_pause
			type = WindowElement
			parent = <player_cont>
			just = [left top]
			Pos = (-210.0, -27.0)
			dims = (1040.0, 588.0)
		}
		CreateScreenElement {
			type = ContainerElement
			id = <player_pause>
			parent = <id>
			Pos = (0.0, -500.0)
		}
		killspawnedscript \{name = jam_highway_select_quantize}
	else
		CreateScreenElement {
			type = ContainerElement
			id = <player_pause>
			parent = <player_cont>
			Pos = (0.0, -500.0)
		}
	endif
	if GotParam \{adv_record}
		CreateScreenElement {
			parent = <player_pause>
			type = DescInterface
			Pos = (-143.0, 15.0)
			z_priority = 10
			alpha = 1
			desc = 'jam_advanced_pause_screen'
			inst_icon_texture = <inst_logo>
		}
		menu_pos = (2.0, 150.0)
		<pause_font_color> = [80 80 80 255]
		set_focus_color \{Color = pure_white}
		set_unfocus_color rgba = <pause_font_color>
		if ($jam_advanced_record = 1)
			SoundEvent \{event = Jam_Advanced_Record_Pause_Panel_In}
		endif
	else
		GetPlayerInfo <select_player> controller
		band_leader_alpha = 0
		if (<controller> = $primary_controller)
			<band_leader_alpha> = 1
		endif
		CreateScreenElement {
			parent = <player_pause>
			type = DescInterface
			Pos = (-141.0, 15.0)
			z_priority = 10
			alpha = 1
			desc = 'jam_band_pause_screen'
			inst_icon_texture = <inst_logo>
			player_number_text = <player_string>
			band_leader_alpha = <band_leader_alpha>
		}
		menu_pos = (2.0, 150.0)
		<pause_font_color> = [80 80 80 255]
		set_focus_color \{Color = white220}
		set_unfocus_color rgba = <pause_font_color>
		if NOT ($jam_advanced_record = 1)
			SoundEvent \{event = Menu_Recording_Pause_Panel_In}
		endif
	endif
	FormatText checksumname = scrolling_options 'scrolling_options_%s' s = <select_player>
	FormatText checksumname = vmenu_options 'vmenu_options_%s' s = <select_player>
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
			{pad_up GHMix_scroll params = {up <...>}}
			{pad_down GHMix_scroll params = {down <...>}}
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
	GetPlayerInfo <select_player> jam_instrument
	text_params = {type = TextElement font = fontgrid_text_A3 just = [center center] scale = 1 rgba = <pause_font_color>}
	GetArraySize <pause_options>
	option = 0
	begin
	fit_to_dims = (<pause_options> [<option>].fit_to_dims)
	FormatText checksumname = option_id 'option_%a_%b' a = <option> b = <select_player>
	FormatText checksumname = option_text_id 'option_text_%a_%b' a = <option> b = <select_player>
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
				FormatText TextName = machine_text qs(0x326eef22) s = <machine_text>
				<option_text> = <machine_text>
			else
				FormatText TextName = machine_text qs(0x61146f69) s = <machine_text>
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
	if (<show_option> = 1)
		if StructureContains structure = (<pause_options> [<option>]) pause_script
			CreateScreenElement {
				type = ContainerElement
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
				type = ContainerElement
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
			type = TextBlockElement
			parent = <option_id>
			id = <option_text_id>
			font = fontgrid_text_A3
			just = [center center]
			internal_just = [center center]
			scale = 1
			rgba = <option_rgba>
			dims = (182.0, 32.0)
			text = <option_text>
			z_priority = 45
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = proportional
			text_case = original
		}
		if StructureContains structure = (<pause_options> [<option>]) init_script
			spawnscriptnow (<pause_options> [<option>].init_script) id = jam_band_spawns params = {option_id = <option_id> option_text_id = <option_text_id>}
		endif
	endif
	<option> = (<option> + 1)
	repeat <array_size>
	<show_note_limit> = 1
	if GotParam \{adv_record}
		<show_note_limit> = 1
	elseif GotParam \{paused_at_inst}
		<show_note_limit> = 0
	endif
	if (<show_note_limit> = 1)
		if NOT (<jam_instrument> = $jam_mic_id)
			GetTrackSize track = ($jam_tracks [<jam_instrument>].id)
			FormatText TextName = num_notes qs(0x89be46a6) a = <track_size> b = (($gemarraysize) -1)
			if (<track_size> >= (($gemarraysize) -1))
				<limit_color> = [190 20 20 250]
			else
				<limit_color> = [150 150 150 255]
			endif
			CreateScreenElement {
				type = TextBlockElement
				parent = <player_pause>
				id = <note_limit>
				font = fontgrid_text_A3
				just = [center bottom]
				scale = 1
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
			type = TextBlockElement
			parent = <player_pause>
			font = fontgrid_text_A3
			just = [center center]
			internal_just = [center center]
			scale = 1
			rgba = [150 150 150 255]
			Pos = (0.0, 450.0)
			dims = (170.0, 40.0)
			text = <instrument_name>
			z_priority = 45
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = proportional
			text_case = original
		}
	endif
	FormatText checksumname = effect_info_box 'effect_info_box_%a' a = <select_player>
	if ScreenElementExists id = <effect_info_box>
		<effect_info_box> :SE_SetProps Pos = (5.0, -555.0) time = 0.1
	endif
	if ScreenElementExists id = <scrolling_options>
		LaunchEvent type = unfocus target = <vmenu_options>
	endif
	if NOT GotParam \{adv_record}
		FormatText checksumname = base_id 'jam_fretboard_base_%s' s = <select_player>
		if ScreenElementExists id = <base_id>
			<base_id> :SE_SetProps Pos = (0.0, 480.0) time = 0.1
		endif
		FormatText checksumname = quick_tabs 'quick_tabs_%a' a = <select_player>
		if ScreenElementExists id = <quick_tabs>
			<quick_tabs> :SE_SetProps Pos = (-116.0, -300.0) time = 0.1
			DestroyScreenElement id = <quick_tabs>
		endif
		end_pos = (0.0, -40.0)
	else
		if ScreenElementExists id = <player_pause>
			<player_pause> :SE_SetProps Pos = (133.0, -500.0)
		endif
		end_pos = (133.0, -57.0)
	endif
	if (<shake> = 1)
		GetRandomValue \{a = -0.7
			b = 0.7
			name = rot_amount}
		if ScreenElementExists id = <player_pause>
			<player_pause> :SE_SetProps rot_angle = <rot_amount> Pos = (<end_pos> + (0.0, 10.0)) time = 0.1
			<player_pause> :SE_WaitProps
		endif
		GetRandomValue \{a = -0.5
			b = 0.5
			name = rot_amount}
		if ScreenElementExists id = <player_pause>
			<player_pause> :SE_SetProps rot_angle = <rot_amount> Pos = (<end_pos> - (0.0, 10.0)) time = 0.07
			<player_pause> :SE_WaitProps
		endif
		GetRandomValue \{a = -0.3
			b = 0.3
			name = rot_amount}
		if ScreenElementExists id = <player_pause>
			<player_pause> :SE_SetProps rot_angle = <rot_amount> Pos = (<end_pos> + (0.0, 5.0)) time = 0.07
			<player_pause> :SE_WaitProps
		endif
		GetRandomValue \{a = -0.2
			b = 0.2
			name = rot_amount}
		if ScreenElementExists id = <player_pause>
			<player_pause> :SE_SetProps rot_angle = <rot_amount> Pos = (<end_pos> - (0.0, 3.0)) time = 0.07
			<player_pause> :SE_WaitProps
		endif
		if ScreenElementExists id = <player_pause>
			<player_pause> :SE_SetProps rot_angle = 0.0 Pos = <end_pos> time = 0.07
			<player_pause> :SE_WaitProps
		endif
	else
		if ScreenElementExists id = <player_pause>
			<player_pause> :SE_SetProps Pos = <end_pos> time = 0.1
			<player_pause> :SE_WaitProps
		endif
	endif
	FormatText checksumname = gems_id 'jam_falling_gem_container_%s' s = <select_player>
	if ScreenElementExists id = <gems_id>
		if GetScreenElementChildren id = <gems_id>
			GetArraySize <children>
			Change jam_num_falling_gems = ($jam_num_falling_gems - <array_size>)
			if ($jam_num_falling_gems < 0)
				Change \{jam_num_falling_gems = 0}
			endif
		endif
	endif
	if NOT (<jam_instrument> = $jam_mic_id)
		if NOT GotParam \{paused_at_inst}
			if StructureContains structure = ($jam_tracks [<jam_instrument>]) ui_destroy_func
				FormatText checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
				spawnscriptnow ($jam_tracks [<jam_instrument>].ui_destroy_func) id = <jam_player_spawns> params = {player = <select_player>}
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
		LaunchEvent type = focus target = <vmenu_options>
	endif
endscript

script jam_pause_focus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			<id> :GetSingleTag old_font
			if NOT GotParam \{old_font}
				<id> :SE_GetProps
				<id> :SetTags old_font = <font>
			endif
			SetScreenElementProps id = <id> font = fontgrid_text_A3 rgba = $menu_focus_color
		endif
	else
		GetSingleTag \{old_font}
		if NOT GotParam \{old_font}
			SE_GetProps
			SetTags old_font = <font>
		endif
		SetProps \{font = fontgrid_text_A3
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
				<id> :SE_GetProps
				<id> :SetTags old_font = <font>
			endif
			SetScreenElementProps id = <id> font = fontgrid_text_A3 rgba = <rgba>
		endif
	else
		GetSingleTag \{old_font}
		if NOT GotParam \{old_font}
			SE_GetProps
			SetTags old_font = <font>
		endif
		SetProps font = fontgrid_text_A3 rgba = <rgba>
	endif
endscript

script jam_band_pause_submenu 
	LaunchEvent type = unfocus target = <vmenu_id>
	FormatText checksumname = player_pause_submenu 'jam_band_pause_%a_%s' a = <submenu_name> s = <select_player>
	if ScreenElementExists id = <player_pause_submenu>
		DestroyScreenElement id = <player_pause_submenu>
	endif
	GetPlayerInfo <select_player> jam_instrument
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
	FormatText TextName = player_string qs(0x033007b2) s = <select_player>
	if ($jam_advanced_record = 0)
		CreateScreenElement {
			type = ContainerElement
			id = <player_pause_submenu>
			parent = <player_cont>
			Pos = (0.0, -40.0)
		}
		GetPlayerInfo <select_player> controller
		band_leader_alpha = 0
		if (<controller> = $primary_controller)
			<band_leader_alpha> = 1
		endif
		CreateScreenElement {
			parent = <player_pause_submenu>
			type = DescInterface
			Pos = (-141.0, 15.0)
			z_priority = 20
			alpha = 1
			desc = 'jam_band_pause_screen'
			inst_icon_texture = <inst_logo>
			player_number_text = <player_string>
			pause_header_text = <submenu_title>
			band_leader_alpha = <band_leader_alpha>
		}
		<pause_font_color> = [80 80 80 255]
		set_focus_color \{Color = white220}
		set_unfocus_color rgba = <pause_font_color>
		menu_pos = (2.0, 152.0)
	else
		CreateScreenElement {
			local_id = clip_window_pause_submenu
			type = WindowElement
			parent = <player_cont>
			just = [left top]
			Pos = (-210.0, -27.0)
			dims = (1040.0, 588.0)
		}
		CreateScreenElement {
			type = ContainerElement
			id = <player_pause_submenu>
			parent = <id>
			Pos = (133.0, -57.0)
		}
		CreateScreenElement {
			parent = <player_pause_submenu>
			type = DescInterface
			Pos = (-143.0, 15.0)
			z_priority = 20
			alpha = 1
			desc = 'jam_advanced_pause_screen'
			pause_header_text = <submenu_title>
			inst_icon_texture = <inst_logo>
		}
		<pause_font_color> = [80 80 80 255]
		set_focus_color \{Color = pure_white}
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
		GetPlayerInfo <select_player> jam_instrument
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
			type = TextBlockElement
			parent = <window_id>
			font = fontgrid_text_A3
			just = [center center]
			internal_just = [center center]
			scale = 1
			rgba = [255 255 255 255]
			dims = (150.0, 32.0)
			Pos = (140.0, 130.0)
			text = <inst_name>
			z_priority = 46
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = proportional
			text_case = original
		}
		CreateScreenElement {
			type = SpriteElement
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
			type = TextBlockElement
			parent = <player_pause_submenu>
			text = qs(0xc08b018f)
			font = fontgrid_text_A1
			just = [center center]
			pos_anchor = [center center]
			rgba = [255 255 255 255]
			Pos = (15.0, 138.0)
			alpha = 1
			z_priority = 100
			scale = 1.2
			dims = (50.0, 50.0)
		}
		CreateScreenElement {
			type = TextBlockElement
			parent = <player_pause_submenu>
			text = qs(0xc08b018f)
			font = fontgrid_text_A1
			just = [center center]
			pos_anchor = [center center]
			rgba = [255 255 255 255]
			Pos = (-16.0, 410.0)
			alpha = 1
			z_priority = 100
			rot_angle = 180
			scale = 1.2
			dims = (50.0, 50.0)
		}
		if NOT GotParam \{no_preview}
			user_control_helper_get_buttonchar button = yellow controller = <controller>
			CreateScreenElement {
				parent = <player_pause_submenu>
				type = DescInterface
				desc = 'helper_pill'
				auto_dims = false
				dims = (0.0, 36.0)
				scale = 0.71999997
				Pos = (0.0, 458.0)
				just = [center center]
				z_priority = 100
				helper_button_text = <buttonchar>
				helper_description_text = qs(0x43b287ab)
				helper_pill_rgba = $user_control_pill_color
				helper_description_rgba = $user_control_pill_text_color
				helper_pill_body_dims = (150.0, 36.0)
			}
			<id> :SE_GetProps
			<id> :SE_SetProps {
				helper_pill_body_dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 32.0))
				dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (64.0, 32.0))
			}
		endif
	endif
	FormatText checksumname = scrolling_options_submenu 'scrolling_options_%a_%s' a = <submenu_name> s = <select_player>
	FormatText checksumname = vmenu_options_submenu 'vmenu_options_%a_%s' a = <submenu_name> s = <select_player>
	GetPlayerInfo <select_player> controller
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
	text_params = {type = TextElement font = fontgrid_text_A3 just = [center center] scale = 1 rgba = <pause_font_color>}
	GetArraySize <options_array>
	option = 0
	if (<added_heading> = 1)
		<option> = 1
		<array_size> = (<array_size> -1)
	endif
	begin
	fit_to_dims = (<options_array> [<option>].fit_to_dims)
	FormatText checksumname = option_id 'pause_submenu_%a_options_%b_%c' a = <submenu_name> b = <select_player> c = <option>
	FormatText checksumname = option_text_id 'pause_submenu_%a_optext_%b_%c' a = <submenu_name> b = <select_player> c = <option>
	show_option = 1
	GetPlayerInfo <select_player> jam_instrument
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
			type = ContainerElement
			parent = <vmenu_options_submenu>
			dims = <gap_dims>
			not_focusable
		}
	endif
	if (<show_option> = 1)
		if StructureContains structure = (<options_array> [<option>]) submenu_preview_script
			CreateScreenElement {
				type = ContainerElement
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
			CreateScreenElement {
				type = ContainerElement
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
			<option_id> :SE_SetProps not_focusable
		endif
		if GotParam \{selectable_choices}
			if (<option> = <current_submenu_choice>)
				FormatText checksumname = selector_id 'pause_submenu_%a_selector_%b' a = <submenu_name> b = <select_player>
				CreateScreenElement {
					type = SpriteElement
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
					type = SpriteElement
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
			type = TextBlockElement
			parent = <option_id>
			id = <option_text_id>
			font = fontgrid_text_A3
			just = [center center]
			internal_just = [center center]
			scale = 1
			rgba = <pause_font_color>
			dims = <option_dims>
			Pos = <option_pos>
			text = <option_text>
			z_priority = 80
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = proportional
			text_case = original
		}
		if (<deny_this_option> = 1)
			<option_text_id> :SE_SetProps rgba = [150 150 150 255]
		endif
		if StructureContains structure = (<options_array> [<option>]) submenu_init_script
			spawnscriptnow (<options_array> [<option>].submenu_init_script) id = jam_band_spawns params = {player = <select_player> submenu_name = <submenu_name> option_index = <option> option_text_id = <option_text_id>}
		endif
	endif
	<option> = (<option> + 1)
	repeat <array_size>
	if ($jam_advanced_record = 1)
		clean_up_user_control_helpers
		menu_jam_band_add_control_helpers \{state = pause_submenu}
	endif
	if ScreenElementExists id = <scrolling_options_submenu>
		LaunchEvent type = focus target = <vmenu_options_submenu> data = {child_index = <current_submenu_choice>}
	endif
endscript

script jam_band_warning_box 
	jam_destroy_player_info_box player = <select_player>
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player>
	message = qs(0x1ed472de)
	FormatText checksumname = warning_box 'jam_band_warning_box_%a' a = <select_player>
	if ScreenElementExists id = <warning_box>
	endif
	event_handlers = [{pad_back jam_band_warning_box_back params = {<...>}}]
	CreateScreenElement {
		parent = <player_cont>
		id = <warning_box>
		type = DescInterface
		pos_anchor = [center center]
		just = [center center]
		Pos = (4.0, 175.0)
		scale = 1
		desc = 'jam_band_warning_box'
		exclusive_device = <device_num>
		event_handlers = <event_handlers>
	}
	LaunchEvent target = <warning_box> type = focus
endscript

script jam_band_warning_box_back 
	FormatText checksumname = warning_box 'jam_band_warning_box_%a' a = <select_player>
	<warning_box> :LegacyDoMorph alpha = 0 time = 0.1
	if ScreenElementExists id = <warning_box>
		DestroyScreenElement id = <warning_box>
	endif
	jam_create_player_info player = <select_player> player_cont = <player_cont> jam_create_player_info
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = 1
endscript

script jam_band_controller_warning_box 
	jam_destroy_player player = <player>
	GetPlayerInfo <player> controller
	if IsPS3
		message = qs(0x588788f4)
	else
		message = qs(0xec4dbd17)
	endif
	FormatText checksumname = warning_box 'jam_band_warning_box_%a' a = <player>
	if ScreenElementExists id = <warning_box>
		DestroyScreenElement id = <warning_box>
	endif
	event_handlers = [{pad_back jam_band_controller_warning_box_back params = {<...>}}]
	CreateScreenElement {
		type = ContainerElement
		parent = jam_band_container
		id = <warning_box>
		Pos = ($jam_cont_start_pos + (1.0, 0.0) * ($jam_cont_offset * (<player> - 1)))
		event_handlers = <event_handlers>
	}
	CreateScreenElement {
		parent = <warning_box>
		type = DescInterface
		pos_anchor = [center center]
		just = [center center]
		Pos = (4.0, 175.0)
		scale = 1
		desc = 'jam_band_warning_box'
		exclusive_device = <controller>
		warning_text = <message>
	}
	LaunchEvent target = <warning_box> type = focus
endscript

script jam_band_controller_warning_box_back 
	FormatText checksumname = warning_box 'jam_band_warning_box_%a' a = <player>
	<warning_box> :LegacyDoMorph alpha = 0 time = 0.1
	if ScreenElementExists id = <warning_box>
		DestroyScreenElement id = <warning_box>
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
	FormatText checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
	spawnscriptnow line6_pod id = <jam_player_spawns> params = {<...>}
	SoundEvent \{event = Jam_Mode_FXHUD_ON}
endscript

script line6_pod 
	printf \{channel = jam_mode
		qs(0x10c9ea18)}
	FormatText checksumname = line6_pod_id 'line6_pod_%a' a = <select_player>
	FormatText checksumname = line6_pod_window_element_id 'line6_pod_window_element_%a' a = <select_player>
	event_handlers = [{pad_back line6_pod_back params = {<...>}}
		{pad_down line6_pod_effect_change params = {up <...>}}
		{pad_up line6_pod_effect_change params = {down <...>}}
		{pad_option2 line6_pod_unlock_toggle params = {<...>}}
		{pad_start line6_pod_remove params = {<...>}}
		{pad_choose ui_menu_select_sfx}
		{pad_choose line6_pod_remove params = {<...>}}]
	cheat_alpha = 1
	if NOT ($jam_advanced_record = 1)
		CreateScreenElement {
			parent = <player_cont>
			id = <line6_pod_window_element_id>
			type = WindowElement
			Pos = (0.0, 200.0)
			dims = (200.0, 550.0)
			just = [center center]
			internal_just = [center center]
		}
		CreateScreenElement {
			parent = <line6_pod_window_element_id>
			id = <line6_pod_id>
			type = DescInterface
			pos_anchor = [center center]
			just = [center center]
			Pos = (0.0, -400.0)
			scale = 0.4
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
			type = WindowElement
			id = <line6_pod_window_element_id>
			parent = <player_cont>
			just = [left top]
			Pos = (-120.0, -50.0)
			dims = (800.0, 575.0)
		}
		CreateScreenElement {
			parent = <line6_pod_window_element_id>
			id = <line6_pod_id>
			type = DescInterface
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
		LaunchEvent \{type = unfocus
			target = jam_control_container}
		killspawnedscript \{name = jam_highway_select_quantize}
	endif
	line6_pod_update_effect select_player = <select_player> line6_pod_id = <line6_pod_id>
	GetPlayerInfo <select_player> jam_instrument
	<curr_effect> = ($jam_current_instrument_effects [<jam_instrument>])
	<line6_pod_id> :SetTags {previous_effect = <curr_effect>}
	<line6_pod_id> :LegacyDoMorph Pos = (<end_pos> + (0.0, 10.0)) time = 0.1
	<line6_pod_id> :LegacyDoMorph Pos = (<end_pos> - (0.0, 10.0)) time = 0.1
	<line6_pod_id> :LegacyDoMorph Pos = (<end_pos> + (0.0, 5.0)) time = 0.1
	<line6_pod_id> :LegacyDoMorph Pos = (<end_pos> - (0.0, 3.0)) time = 0.1
	<line6_pod_id> :LegacyDoMorph Pos = <end_pos> time = 0.1
	if NOT ($jam_advanced_record = 1)
		<line6_pod_id> :SE_SetProps scale = 1.05 Pos = (0.0, -40.0) time = 0.1
		<line6_pod_id> :SE_WaitProps
		<line6_pod_id> :SE_SetProps scale = 0.95 Pos = (0.0, -40.0) time = 0.05
		<line6_pod_id> :SE_WaitProps
		<line6_pod_id> :SE_SetProps scale = 1.0 Pos = (0.0, -40.0) time = 0.05
		<line6_pod_id> :SE_WaitProps
	endif
	LaunchEvent target = <line6_pod_id> type = focus
endscript

script line6_pod_unlock_toggle 
	<line6_pod_id> :GetTags
	FormatText checksumname = scroll_id1 'line6_scrolling_text2_%s' s = <select_player>
	FormatText checksumname = scroll_id2 'line6_scrolling_text1_%s' s = <select_player>
	if (<code_box> = 0)
		<line6_pod_id> :SE_SetProps helper_description_text = qs(0xd18ad640)
		<line6_pod_id> :SE_SetProps code_box_alpha = 1 time = 0.1
		<line6_pod_id> :SetTags {code_box = 1}
		SoundEvent \{event = Recording_Start}
		if <line6_pod_id> :Desc_ResolveAlias name = scrolling_text_window1
			CreateScreenElement {
				type = ContainerElement
				parent = <resolved_id>
				id = <scroll_id1>
				Pos = (0.0, 0.0)
				just = [left top]
				scale = 0.75
			}
			text = qs(0x6e5155ba)
			CreateScreenElement {
				type = TextBlockElement
				parent = <scroll_id1>
				font = fontgrid_text_A3
				just = [left top]
				internal_just = [center center]
				rgba = [224 , 224 , 224 , 255]
				dims = (250.0, 50.0)
				Pos = (-2.0, 0.0)
				text = <text>
				fit_width = `scale	each	line	if	larger`
				fit_height = `scale	down	if	larger`
				scale_mode = proportional
				text_case = original
				z_priority = 65
			}
		endif
		if <line6_pod_id> :Desc_ResolveAlias name = scrolling_text_window2
			text = qs(0xb13f3841)
			CreateScreenElement {
				type = ContainerElement
				parent = <resolved_id>
				id = <scroll_id2>
				Pos = (0.0, 0.0)
				just = [left top]
				scale = 0.75
			}
		endif
	else
		<line6_pod_id> :SE_SetProps helper_description_text = qs(0xba912d99)
		<line6_pod_id> :SE_SetProps code_box_alpha = 0 time = 0.1
		<line6_pod_id> :SetTags {code_box = 0}
		if ScreenElementExists id = <scroll_id1>
			DestroyScreenElement id = <scroll_id1>
		endif
		if ScreenElementExists id = <scroll_id2>
			DestroyScreenElement id = <scroll_id2>
		endif
		SoundEvent \{event = Recording_Stop}
	endif
endscript

script line6_pod_update_effect 
	GetPlayerInfo <select_player> jam_instrument
	switch (<jam_instrument>)
		case 0
		op_array = ($musicstudio_line6_1_array)
		case 1
		op_array = ($musicstudio_line6_0_array)
		case 2
		op_array = ($jam_bass_effects)
	endswitch
	<curr_effect> = ($jam_current_instrument_effects [<jam_instrument>])
	FormatText checksumname = line6_pod_id 'line6_pod_%a' a = <select_player>
	<line6_pod_id> :SetTags {previous_effect = <Effect>}
	<line6_pod_id> :SetProps Effect_text = (<op_array> [<curr_effect>].name_text)
	<line6_pod_id> :SetProps amp_text = (<op_array> [<curr_effect>].amp_text)
	<line6_pod_id> :SetProps fx_text = (<op_array> [<curr_effect>].fx_text)
	<line6_pod_id> :SetProps cab_text = (<op_array> [<curr_effect>].cab_text)
endscript

script line6_pod_remove 
	SoundEvent \{event = Jam_Mode_FXHUD_Off}
	GetPlayerInfo <select_player> jam_instrument
	musicstudio_change_effect instrument = <jam_instrument>
	printf \{channel = jam_mode
		qs(0xd6a9a3eb)}
	if ScreenElementExists id = <line6_pod_id>
		if NOT ($jam_advanced_record = 1)
			end_pos = (0.0, -400.0)
		else
			end_pos = (-222.0, -600.0)
		endif
		<line6_pod_id> :LegacyDoMorph Pos = <end_pos> time = 0.1
		LaunchEvent target = <line6_pod_id> type = unfocus
		DestroyScreenElement id = <line6_pod_id>
	endif
	if ScreenElementExists id = <line6_pod_window_element_id>
		DestroyScreenElement id = <line6_pod_window_element_id>
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
		broadcastevent type = jam_tutorial_changed_effect data = {Effect = <curr_effect>}
	endif
	killspawnedscript \{name = guitar_jam_settings_preview_effect}
	StopSound \{$jam_settings_effect_lead_sample
		fade_time = 0.1
		fade_type = linear}
	StopSound \{$jam_settings_effect_rhythm_sample
		fade_time = 0.1
		fade_type = linear}
endscript

script line6_pod_effect_change 
	printf \{channel = jam_mode
		qs(0x4eb9c86b)}
	GetPlayerInfo <select_player> jam_instrument
	switch (<jam_instrument>)
		case 0
		op_array = ($musicstudio_line6_1_array)
		case 1
		op_array = ($musicstudio_line6_0_array)
		case 2
		op_array = ($jam_bass_effects)
	endswitch
	<Effect> = ($jam_current_instrument_effects [<jam_instrument>])
	GetArraySize <op_array>
	if (<jam_instrument> = 0)
		<array_size> = $num_unlocked_line6_effect_rhythm
	else
		<array_size> = $num_unlocked_line6_effect_lead
	endif
	if GotParam \{up}
		SoundEvent \{event = Line6_Scroll_Up}
		<Effect> = (<Effect> + 1)
		if (<Effect> >= <array_size>)
			<Effect> = 0
		endif
		SetArrayElement arrayName = jam_current_instrument_effects GlobalArray index = <jam_instrument> newValue = <Effect>
		<line6_pod_id> :SetProps up_arrow_scale = 1.7
		<line6_pod_id> :SetProps up_arrow_scale = 1.2 time = 0.15
	else
		SoundEvent \{event = Line6_Scroll_Up}
		<Effect> = (<Effect> - 1)
		if (<Effect> < 0)
			<Effect> = (<array_size> - 1)
		endif
		SetArrayElement arrayName = jam_current_instrument_effects GlobalArray index = <jam_instrument> newValue = <Effect>
		<line6_pod_id> :SetProps down_arrow_scale = 1.7
		<line6_pod_id> :SetProps down_arrow_scale = 1.2 time = 0.15
	endif
	if (<jam_instrument> = 0)
		StopSound \{$jam_settings_effect_rhythm_sample
			fade_time = 0.1
			fade_type = linear}
		wait \{0.15
			seconds}
	endif
	if (<jam_instrument> = 1)
		StopSound \{$jam_settings_effect_lead_sample
			fade_time = 0.1
			fade_type = linear}
		wait \{0.15
			seconds}
	endif
	musicstudio_change_effect instrument = <jam_instrument>
	line6_pod_update_effect select_player = <select_player> line6_pod_id = <line6_pod_id>
	spawnscriptnow guitar_jam_settings_preview_effect params = {jam_instrument = <jam_instrument>}
endscript

script line6_pod_back 
	GetPlayerInfo <select_player> jam_instrument
	FormatText checksumname = line6_pod_id 'line6_pod_%a' a = <select_player>
	<line6_pod_id> :GetTags
	SetArrayElement arrayName = jam_current_instrument_effects GlobalArray index = <jam_instrument> newValue = <previous_effect>
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
jam_settings_effect_lead_sample = null
jam_settings_effect_rhythm_sample = null

script guitar_jam_settings_preview_effect 
	if (<jam_instrument> = 0)
		StopSound \{$jam_settings_effect_rhythm_sample
			fade_time = 0.1
			fade_type = linear}
		wait \{1
			gameframe}
		jam_get_sample_checksum \{Fret = 0
			string = 0
			type = 0
			jam_instrument = 0
			chord_type = 0}
		PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = JamMode_RhythmGuitar
		Change jam_settings_effect_rhythm_sample = <sample_checksum>
	else
		StopSound \{$jam_settings_effect_lead_sample
			fade_time = 0.1
			fade_type = linear}
		wait \{1
			gameframe}
		jam_get_sample_checksum \{Fret = 0
			string = 0
			type = 0
			jam_instrument = 1}
		PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = JamMode_LeadGuitar
		Change jam_settings_effect_lead_sample = <sample_checksum>
	endif
endscript
pause_drum_kit_options = [
	{
		name_text = qs(0xa3f7d085)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
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
		name_text = qs(0xdc91cbc7)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_drum_kit
		submenu_preview_script = jam_drum_kit_preview
		submenu_exit_script = guitar_jam_drum_kit_exit
	}
]

script jam_band_pause_drum_kit 
	op_array = $pause_drum_kit_options
	GetPlayerInfo <select_player> jam_instrument
	jam_band_pause_submenu {
		submenu_name = 'drum_kit'
		submenu_title = qs(0xfbfde2d2)
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
endscript

script guitar_jam_change_drum_kit 
	FormatText checksumname = selector_id 'pause_submenu_drum_kit_selector_%b' b = <player>
	FormatText checksumname = option_id 'pause_submenu_drum_kit_options_%b_%c' b = <player> c = <option_index>
	<selector_id> :SetProps parent = <option_id>
	LaunchEvent type = unfocus target = <option_id>
	LaunchEvent type = unfocus target = <vmenu_options_submenu>
	Change jam_current_drum_kit = <option_index>
	SetSongInfo \{drum_kit = $jam_current_drum_kit}
	script_assert \{qs(0x1ea08306)}
	FormatText checksumname = cur_kit 'current_drumkit_txt_%a' a = <player>
	if ScreenElementExists id = <cur_kit>
		<cur_kit> :SE_SetProps text = (($pause_drum_kit_options) [<option_index>].name_text)
	endif
	LaunchEvent type = focus target = <option_id>
	if ($jam_tutorial_status = active)
		broadcastevent type = jam_change_drum_kit data = {new_kit = <option_index>}
	endif
	<respawn> = 0
	if ($jam_advanced_record = 0)
		FormatText checksumname = player_info_element 'player_info_element_%a' a = <player>
		FormatText TextName = extra_info_text qs(0x4d4555da) s = (($pause_drum_kit_options) [<option_index>].name_text)
		<respawn> = 1
		if ScreenElementExists id = <player_info_element>
			<player_info_element> :SE_SetProps extra_info_text = <extra_info_text>
		endif
	endif
	jam_band_remove_pause_submenu choose vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <player> respawn_input = <respawn>
endscript

script jam_drum_kit_preview 
	LaunchEvent type = unfocus target = <option_id>
	LaunchEvent type = unfocus target = <vmenu_options_submenu>
	musicstudio_drum_kit_preview index = <option_index> target = <vmenu_options_submenu>
	LaunchEvent type = focus target = <option_id>
	LaunchEvent type = focus target = <vmenu_options_submenu>
	printf \{channel = jam_mode
		qs(0x917e367f)}
endscript

script guitar_jam_drum_kit_exit 
	if ($jam_tutorial_status = active)
		return
	endif
	LaunchEvent type = unfocus target = <option_id>
	LaunchEvent type = unfocus target = <vmenu_options_submenu>
	script_assert \{qs(0x1ea08306)}
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
		name_text = qs(0x1c9101dd)
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
		name_text = qs(0xaad94533)
		fit_to_dims = (130.0, 25.0)
		submenu_script = guitar_jam_change_bass_kit
		submenu_preview_script = jam_bass_kit_preview
		submenu_exit_script = guitar_jam_bass_kit_exit
		pakname = 'kz_digiorg'
		sample_start = kz_digiorg
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
		sample_start = Rock_Organ
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
	GetPlayerInfo <select_player> jam_instrument
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
	FormatText checksumname = selector_id 'pause_submenu_bass_kit_selector_%b' b = <player>
	FormatText checksumname = option_id 'pause_submenu_bass_kit_options_%b_%c' b = <player> c = <option_index>
	<selector_id> :SetProps parent = <option_id>
	LaunchEvent type = unfocus target = <option_id>
	LaunchEvent type = unfocus target = <vmenu_options_submenu>
	if (<option_index> = 0)
		Change \{bass_kit_mode = 0}
	else
		LoadBassKit bass_kit = <option_index>
	endif
	<respawn> = 0
	if ($jam_advanced_record = 0)
		<respawn> = 1
		FormatText checksumname = player_info_element 'player_info_element_%a' a = <player>
		if ScreenElementExists id = <player_info_element>
			if (<option_index> = 0)
				<player_info_element> :SE_SetProps extra_info_text = qs(0x00000000)
				RunScriptOnScreenElement id = <player_info_element> LegacyDoMorph params = {Pos = (3.0, 465.0) time = 0.1}
			else
				FormatText TextName = extra_info_text qs(0x4d4555da) s = (($pause_bass_kit_options) [<option_index>].name_text)
				<player_info_element> :SE_SetProps extra_info_text = <extra_info_text>
				RunScriptOnScreenElement id = <player_info_element> LegacyDoMorph params = {Pos = (3.0, 445.0) time = 0.1}
			endif
		endif
	endif
	LaunchEvent type = focus target = <option_id>
	jam_band_remove_pause_submenu choose vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <player> respawn_input = <respawn>
	if ($game_mode = training)
		broadcastevent type = jam_tutorial_changed_bass_kit data = {bass_kit = <option_index>}
	endif
endscript

script jam_bass_kit_preview 
	LaunchEvent type = unfocus target = <option_id>
	LaunchEvent type = unfocus target = <vmenu_options_submenu>
	old_bass_kit = ($jam_current_bass_kit)
	previous_mode = ($bass_kit_mode)
	if (<option_index> = 0)
		Change \{bass_kit_mode = 0}
		jam_get_sample player = <player> button = 1 sample_type = 0 tilt = 0
		StopSound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = 0.05
		PlaySound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 5 buss = JamMode_Bass release_function = linear release_time = 10.0 release_length = 0.02 send_vol2 = -18
	else
		Change \{bass_kit_mode = 1}
		LoadBassKit bass_kit = <option_index> preview = 1
		StopSound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = 0.05
		PlaySound $bass_kit_sample pitch = (0 + (($jam_current_tuning) / 10.0)) vol = 5 buss = JamMode_Bass send_vol2 = -24 pan1y = 1.0
	endif
	Change bass_kit_mode = <previous_mode>
	Change jam_input_current_bass = <unique_id>
	wait \{1
		second}
	StopSound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = 0.05
	LaunchEvent type = focus target = <option_id>
	LaunchEvent type = focus target = <vmenu_options_submenu>
endscript

script guitar_jam_bass_kit_exit 
	if ($jam_tutorial_status = active)
		return
	endif
	LaunchEvent type = unfocus target = <option_id>
	LaunchEvent type = unfocus target = <vmenu_options_submenu>
	GetSongInfo
	if NOT GotParam \{bass_kit}
		bass_kit = 0
	endif
	LoadBassKit bass_kit = <bass_kit>
	jam_band_remove_pause_submenu vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript

script jam_band_pause_drum_loop 
	op_array = $jam_drum_loops_by_type
	GetPlayerInfo <select_player> jam_instrument
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
	FormatText checksumname = selector_id 'pause_submenu_drum_loop_selector_%b' b = <player>
	FormatText checksumname = option_id 'pause_submenu_drum_loop_options_%b_%c' b = <player> c = <option_index>
	<selector_id> :SetProps parent = <option_id>
	Change jam_current_drum_loop = <option_index>
	jam_band_remove_pause_submenu choose vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript

script guitar_jam_drum_loop_exit 
	jam_band_remove_pause_submenu vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript

script jam_band_pause_arpeggiator_loop 
	op_array = $jam_arpeggiator_loops
	GetPlayerInfo <select_player> jam_instrument
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
	FormatText checksumname = selector_id 'pause_submenu_arpeggiator_loop_selector_%b' b = <player>
	FormatText checksumname = option_id 'pause_submenu_arpeggiator_loop_options_%b_%c' b = <player> c = <option_index>
	GetPlayerInfo <player> jam_instrument
	<selector_id> :SetProps parent = <option_id>
	SetArrayElement arrayName = jam_current_arpeggiator GlobalArray index = <jam_instrument> newValue = <option_index>
	jam_band_remove_pause_submenu choose vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript

script guitar_jam_arpeggiator_loop_exit 
	jam_band_remove_pause_submenu vmenu_options_effects = <vmenu_options_submenu> scrolling_options_effects = <scrolling_options_submenu> player_pause_submenu = <player_pause_submenu> vmenu_id = <vmenu_id>
endscript

script jam_band_pause_arpeggiator_type 
	op_array = $jam_arpeggiator_types
	GetPlayerInfo <select_player> jam_instrument
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
	FormatText checksumname = selector_id 'pause_submenu_arpeggiator_type_selector_%b' b = <player>
	FormatText checksumname = option_id 'pause_submenu_arpeggiator_type_options_%b_%c' b = <player> c = <option_index>
	GetPlayerInfo <player> jam_instrument
	<selector_id> :SetProps parent = <option_id>
	SetArrayElement arrayName = jam_current_arpeggiator_type GlobalArray index = <jam_instrument> newValue = <option_index>
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
		submenu_init_script = musicstudio_update_volume
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
		submenu_init_script = musicstudio_update_pan
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
	GetPlayerInfo <select_player> jam_instrument
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
	FormatText checksumname = option_text_id 'pause_submenu_%a_optext_%b_%c' a = <submenu_name> b = <player> c = <option_index>
	if ScreenElementExists id = <option_text_id>
		<option_text_id> :SE_SetProps text = <click_text>
	endif
endscript

script create_jam_settings_arrows \{pos_x = 72}
	FormatText checksumname = setting_arrow_up 'setting_arrow_up_%a' a = <player>
	CreateScreenElement {
		type = SpriteElement
		parent = <parent>
		id = <setting_arrow_up>
		texture = up_arrow
		just = [center center]
		Pos = (((1.0, 0.0) * <pos_x>) + (8.0, -5.0))
		scale = 0.5
		z_priority = 100
	}
	FormatText checksumname = setting_arrow_down 'setting_arrow_down_%a' a = <player>
	CreateScreenElement {
		type = SpriteElement
		parent = <parent>
		id = <setting_arrow_down>
		texture = down_arrow
		just = [center center]
		Pos = (((1.0, 0.0) * <pos_x>) + (8.0, 5.0))
		scale = 0.5
		z_priority = 100
	}
endscript

script morph_jam_settings_arrows \{no_sound = 0}
	if GotParam \{down}
		if (<no_sound> = 0)
			SoundEvent \{event = GHTunes_UI_Scroll}
		endif
		FormatText checksumname = setting_arrow_down 'setting_arrow_down_%a' a = <player>
		if ScreenElementExists id = <setting_arrow_down>
			LegacyDoScreenElementMorph id = <setting_arrow_down> scale = 1.3 relative_scale
			LegacyDoScreenElementMorph id = <setting_arrow_down> scale = 1.0 relative_scale time = 0.1
		endif
	elseif GotParam \{up}
		if (<no_sound> = 0)
			SoundEvent \{event = GHTunes_UI_Scroll}
		endif
		FormatText checksumname = setting_arrow_up 'setting_arrow_up_%a' a = <player>
		if ScreenElementExists id = <setting_arrow_up>
			LegacyDoScreenElementMorph id = <setting_arrow_up> scale = 1.3 relative_scale
			LegacyDoScreenElementMorph id = <setting_arrow_up> scale = 1.0 relative_scale time = 0.1
		endif
	elseif GotParam \{pandown}
		if (<no_sound> = 0)
			SoundEvent event = GHTunes_UI_Scroll_Pan sfx_pan = <sfx_pan>
		endif
		FormatText checksumname = setting_arrow_down 'setting_arrow_down_%a' a = <player>
		if ScreenElementExists id = <setting_arrow_down>
			LegacyDoScreenElementMorph id = <setting_arrow_down> scale = 1.3 relative_scale
			LegacyDoScreenElementMorph id = <setting_arrow_down> scale = 1.0 relative_scale time = 0.1
		endif
	elseif GotParam \{panup}
		if (<no_sound> = 0)
			SoundEvent event = GHTunes_UI_Scroll_Pan sfx_pan = <sfx_pan>
		endif
		FormatText checksumname = setting_arrow_up 'setting_arrow_up_%a' a = <player>
		if ScreenElementExists id = <setting_arrow_up>
			LegacyDoScreenElementMorph id = <setting_arrow_up> scale = 1.3 relative_scale
			LegacyDoScreenElementMorph id = <setting_arrow_up> scale = 1.0 relative_scale time = 0.1
		endif
	endif
endscript

script destroy_jam_settings_arrows 
	FormatText checksumname = setting_arrow_up 'setting_arrow_up_%a' a = <player>
	safe_destroy id = <setting_arrow_up>
	FormatText checksumname = setting_arrow_down 'setting_arrow_down_%a' a = <player>
	safe_destroy id = <setting_arrow_down>
endscript

script guitar_jam_settings_volume 
	GetPlayerInfo <player> jam_instrument
	GetPlayerInfo <player> controller
	SetScreenElementProps id = <vmenu_options_submenu> block_events
	FormatText checksumname = volume_event_handler 'jam_volume_event_handler_%s' s = <player>
	if ($jam_advanced_record = 1)
		event_handler_parent = jam_studio_element
	else
		event_handler_parent = jam_band_container
	endif
	CreateScreenElement {
		type = ContainerElement
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
	LaunchEvent type = focus target = <volume_event_handler>
endscript

script guitar_jam_settings_volume_up 
	GetPlayerInfo <player> jam_instrument
	GetTrackInfo track = ($jam_tracks [<jam_instrument>].id)
	<volume> = (<volume> + 1)
	<no_click> = 0
	if (<volume> > 10)
		<volume> = 10
		<no_click> = 1
	endif
	SetTrackInfo track = ($jam_tracks [<jam_instrument>].id) volume = <volume>
	musicstudio_update_volume player = <player> option_text_id = <option_text_id>
	morph_jam_settings_arrows player = <player> up no_sound = <no_click>
	spawnscriptnow guitar_jam_settings_preview_note params = {<...>}
endscript

script guitar_jam_settings_volume_down 
	GetPlayerInfo <player> jam_instrument
	GetTrackInfo track = ($jam_tracks [<jam_instrument>].id)
	<volume> = (<volume> - 1)
	<no_click> = 0
	if (<volume> < 0)
		<volume> = 0
		<no_click> = 1
	endif
	SetTrackInfo track = ($jam_tracks [<jam_instrument>].id) volume = <volume>
	musicstudio_update_volume player = <player> option_text_id = <option_text_id>
	morph_jam_settings_arrows player = <player> down no_sound = <no_click>
	spawnscriptnow guitar_jam_settings_preview_note params = {<...>}
endscript

script guitar_jam_settings_volume_back 
	generic_menu_pad_back_sound
	SetScreenElementProps id = <vmenu_options_submenu> unblock_events
	DestroyScreenElement id = <volume_event_handler>
	destroy_jam_settings_arrows player = <player>
	FormatText checksumname = preview_sample 'jam_settings_preview_sample_%s' s = <player>
	StopSound ($<preview_sample>) fade_time = 0.1 fade_type = linear
endscript

script guitar_jam_settings_pan 
	GetPlayerInfo <player> jam_instrument
	GetPlayerInfo <player> controller
	SetScreenElementProps id = <vmenu_options_submenu> block_events
	FormatText checksumname = pan_event_handler 'jam_pan_event_handler_%s' s = <player>
	if ($jam_advanced_record = 1)
		event_handler_parent = jam_studio_element
	else
		event_handler_parent = jam_band_container
	endif
	CreateScreenElement {
		type = ContainerElement
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
	LaunchEvent type = focus target = <pan_event_handler>
endscript

script guitar_jam_settings_pan_right 
	GetPlayerInfo <player> jam_instrument
	GetTrackInfo track = ($jam_tracks [<jam_instrument>].id)
	<pan> = (<pan> + 1)
	<no_click> = 0
	if (<pan> > 10)
		<pan> = 10
		<no_click> = 1
	endif
	SetTrackInfo track = ($jam_tracks [<jam_instrument>].id) pan = <pan>
	musicstudio_update_pan player = <player> option_text_id = <option_text_id>
	morph_jam_settings_arrows player = <player> panup no_sound = <no_click> sfx_pan = <pan>
endscript

script guitar_jam_settings_pan_left 
	GetPlayerInfo <player> jam_instrument
	GetTrackInfo track = ($jam_tracks [<jam_instrument>].id)
	<pan> = (<pan> - 1)
	<no_click> = 0
	if (<pan> < -10)
		<pan> = -10
		<no_click> = 1
	endif
	SetTrackInfo track = ($jam_tracks [<jam_instrument>].id) pan = <pan>
	musicstudio_update_pan player = <player> option_text_id = <option_text_id>
	morph_jam_settings_arrows player = <player> pandown no_sound = <no_click> sfx_pan = <pan>
endscript

script guitar_jam_settings_pan_back 
	generic_menu_pad_back_sound
	SetScreenElementProps id = <vmenu_options_submenu> unblock_events
	DestroyScreenElement id = <pan_event_handler>
	destroy_jam_settings_arrows player = <player>
endscript
jam_reverb = 0

script jam_init_reverb 
endscript

script jam_deinit_reverb 
endscript

script guitar_jam_settings_bpm 
	GetPlayerInfo <player> controller
	SetScreenElementProps id = <vmenu_options_submenu> block_events
	FormatText checksumname = bpm_event_handler 'jam_bpm_event_handler_%s' s = <player>
	if ($jam_advanced_record = 1)
		event_handler_parent = jam_studio_element
	else
		event_handler_parent = jam_band_container
	endif
	CreateScreenElement {
		type = ContainerElement
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
	<bpm_event_handler> :SetTags {new_bpm = ($jam_current_bpm)}
	create_jam_settings_arrows player = <player> parent = <option_id>
	LaunchEvent type = focus target = <bpm_event_handler>
endscript

script guitar_jam_settings_bpm_updown 
	GetPlayerInfo <player> jam_instrument
	<parent> :GetTags
	<bpm> = <new_bpm>
	if GotParam \{up}
		<no_click> = 1
		if (<bpm> < ($jam_max_bpm))
			<bpm> = (<bpm> + 1)
			<no_click> = 0
		endif
		morph_jam_settings_arrows player = <player> up no_sound = <no_click>
	elseif GotParam \{down}
		<no_click> = 1
		if (<bpm> > ($jam_min_bpm))
			<bpm> = (<bpm> - 1)
			<no_click> = 0
		endif
		morph_jam_settings_arrows player = <player> down no_sound = <no_click>
	endif
	<parent> :SetTags {new_bpm = <bpm>}
	FormatText TextName = bpm_text qs(0x59f35cc2) s = <bpm>
	if GotParam \{option_text_id}
		<option_text_id> :SetProps text = <bpm_text>
	endif
endscript

script guitar_jam_settings_update_bpm 
	GetPlayerInfo <player> jam_instrument
	GetSongInfo
	FormatText TextName = bpm_text qs(0x59f35cc2) s = <bpm>
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
	song_prefix = 'editable'
	FormatText checksumname = fretbar_array '%s_fretbars' s = <song_prefix> AddToStringLookup = true
	<gem_arrays> = [null null null null null]
	<counter> = 0
	begin
	<gem_array> = ($jam_tracks [<counter>].gem_array)
	SetArrayElement arrayName = gem_arrays ResolveGlobals = 0 index = <counter> newValue = <gem_array>
	<counter> = (<counter> + 1)
	repeat 5
	markers = editable_jam_markers
	<bpm> = ($jam_current_bpm)
	UpdateCustomSongBpm current_bpm = <orig_bpm> new_bpm = <bpm> song_length = ($jam_highway_song_length)
	if ScreenElementExists \{id = jam_band_highway_playline}
		SetScreenElementProps id = jam_band_highway_playline Pos = ($jam_band_playline_pos)
	endif
	Change \{jam_highway_play_time = 0}
	suffix = '_size'
	AppendSuffixToChecksum base = <fretbar_array> SuffixString = <suffix>
	<fretbar_size> = <appended_id>
	Change globalname = <fretbar_size> newValue = 0
	musicstudio_create_fretbars
	if ScreenElementExists id = <vmenu_options_submenu>
		SetScreenElementProps id = <vmenu_options_submenu> unblock_events
	endif
	if ScreenElementExists id = <bpm_event_handler>
		DestroyScreenElement id = <bpm_event_handler>
	endif
	if (($jam_advanced_record) = 0)
		generic_menu_pad_back_sound
		killspawnedscript \{name = jam_band_update_highway}
		DestroyScreenElement \{id = jam_band_highway_master}
		jam_band_create_highway \{song = editable}
	else
		if ScreenElementExists \{id = jam_highway_container_master}
			DestroyScreenElement \{id = jam_highway_container_master}
		endif
		if NOT GotParam \{no_sound}
			generic_menu_pad_back_sound
		endif
		killspawnedscript \{name = create_jam_highway_notetrack}
		killspawnedscript \{name = create_jam_highway_fretbars}
		FormatText \{TextName = title_text
			qs(0x1bd49c2c)
			s = $jam_selected_song
			b = $jam_current_bpm}
		jam_studio_element :SetProps SongTitleInfo_text = <title_text>
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
	GetPlayerInfo <player> jam_instrument
	GetPlayerInfo <player> controller
	SetScreenElementProps id = <vmenu_options_submenu> block_events
	FormatText checksumname = tuning_event_handler 'jam_tuning_event_handler_%s' s = <player>
	if ($jam_advanced_record = 1)
		event_handler_parent = jam_studio_element
	else
		event_handler_parent = jam_band_container
	endif
	CreateScreenElement {
		type = ContainerElement
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
	LaunchEvent type = focus target = <tuning_event_handler>
endscript

script guitar_jam_settings_tuning_up 
	tuning = $jam_current_tuning
	<tuning> = (<tuning> + 1)
	if (<tuning> > 5)
		return
	endif
	Change jam_current_tuning = <tuning>
	SetSongInfo tuning = <tuning>
	morph_jam_settings_arrows player = <player> up
	killspawnedscript \{name = guitar_jam_settings_preview_tuning}
	spawnscriptnow guitar_jam_settings_preview_note params = {<...>}
	guitar_jam_settings_update_tuning <...>
endscript

script guitar_jam_settings_tuning_down 
	tuning = $jam_current_tuning
	<tuning> = (<tuning> - 1)
	if (<tuning> < -5)
		return
	endif
	Change jam_current_tuning = <tuning>
	SetSongInfo tuning = <tuning>
	morph_jam_settings_arrows player = <player> down
	killspawnedscript \{name = guitar_jam_settings_preview_tuning}
	spawnscriptnow guitar_jam_settings_preview_note params = {<...>}
	guitar_jam_settings_update_tuning <...>
endscript

script guitar_jam_settings_tuning_back 
	generic_menu_pad_back_sound
	SetScreenElementProps id = <vmenu_options_submenu> unblock_events
	DestroyScreenElement id = <tuning_event_handler>
	destroy_jam_settings_arrows player = <player>
	FormatText checksumname = preview_sample 'jam_settings_preview_sample_%s' s = <player>
	StopSound ($<preview_sample>) fade_time = 0.1 fade_type = linear
endscript

script guitar_jam_settings_update_tuning 
	GetSongInfo
	if ($jam_current_tuning > 0)
		FormatText TextName = tuning_text qs(0xf5e4c97b) s = <tuning>
	else
		FormatText TextName = tuning_text qs(0x0f24e557) s = <tuning>
	endif
	if GotParam \{option_text_id}
		<option_text_id> :SetProps text = <tuning_text>
	endif
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
	GetPlayerInfo <player> lefty_flip
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
	SetPlayerInfo <player> lefty_flip = <lefty_flip>
	if ($jam_advanced_record = 1)
		StopRendering
		OnExitRun \{StartRendering}
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
		SetScreenElementProps id = jam_highway_container Pos = (<new_pos>)
		<new_low_bound> = ($jam_highway_play_time + $jam_highway_start_low_bound)
		<new_high_bound> = ($jam_highway_play_time + $jam_highway_start_high_bound)
		CastToInteger \{new_low_bound}
		CastToInteger \{new_high_bound}
		Change jam_highway_low_bound = <new_low_bound>
		Change jam_highway_high_bound = <new_high_bound>
		jam_highway_reinit
		wait \{10
			gameframes}
		StartRendering
	endif
endscript

script guitar_jam_settings_update_lefty_text 
	GetPlayerInfo <player> lefty_flip
	if (<lefty_flip> = 1)
		flip_text = qs(0x18e9650e)
	else
		flip_text = qs(0x5548447e)
	endif
	if GotParam \{option_text_id}
		<option_text_id> :SetProps text = <flip_text>
	endif
endscript
jam_settings_preview_sample_1 = null
jam_settings_preview_sample_2 = null
jam_settings_preview_sample_3 = null
jam_settings_preview_sample_4 = null

script guitar_jam_settings_preview_note 
	FormatText checksumname = preview_sample 'jam_settings_preview_sample_%s' s = <player>
	GetPlayerInfo <player> jam_instrument
	StopSound ($<preview_sample>) fade_time = 0.1 fade_type = linear
	wait \{1
		gameframe}
	switch <jam_instrument>
		case 0
		jam_get_sample_checksum \{Fret = 0
			string = 0
			type = 0
			jam_instrument = 0}
		PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = JamMode_RhythmGuitar
		case 1
		jam_get_sample_checksum \{Fret = 0
			string = 0
			type = 0
			jam_instrument = 1}
		PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = JamMode_LeadGuitar
		case 2
		jam_get_sample_checksum \{Fret = 0
			string = 0
			type = 0
			jam_instrument = 2}
		PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = JamMode_Bass
		case 3
		drum_kit_string = ($drum_kits [$jam_current_drum_kit].string_id)
		play_drum_sample drum_kit_string = <drum_kit_string> pad = snare velocity = 80 buss = JamMode_Drums
		case 4
		jam_get_single_sample_for_melody_playback \{Fret = 0
			string = 0
			type = 0
			jam_instrument = 4}
		PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = JamMode_Vox
	endswitch
	if NOT (<jam_instrument> = 3)
		Change globalname = <preview_sample> newValue = <sample_checksum>
	endif
	wait \{1
		second}
	StopSound ($<preview_sample>) fade_type = linear fade_time = $jam_fade_time
endscript

script jam_band_remove_pause_submenu 
	if GotParam \{choose}
		SoundEvent \{event = Recording_Start}
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
		LaunchEvent type = focus target = <vmenu_id>
	endif
endscript

script jam_band_pause_new_instrument 
	GetPlayerInfo <select_player> jam_instrument
	if NOT (<jam_instrument> = $jam_mic_id)
		if StructureContains structure = ($jam_tracks [<jam_instrument>]) ui_destroy_func
			FormatText checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
			spawnscriptnow ($jam_tracks [<jam_instrument>].ui_destroy_func) id = <jam_player_spawns> params = {player = <select_player>}
		endif
	endif
	jam_destroy_player_info_box player = <select_player>
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player>
	FormatText checksumname = inst_cont 'inst_cont_%s' s = <select_player>
	jam_destroy_instrument select_player = <select_player> player_cont = <player_cont> inst_cont = <inst_cont>
	SetPlayerInfo <select_player> jam_instrument = -1
endscript

script jam_band_pause_quit \{force_event = false}
	ui_event event = menu_back data = {state = UIstate_jam_select_song show_popup = 0} force_event = <force_event>
	jam_recording_cleanup
	destroy_dialog_box
	musicstudio_jamroom_exit_cleanup
endscript

script jam_band_pause_save_and_quit 
	if NOT CheckForSignIn controller_index = ($primary_controller) dont_set_primary local
		jam_band_pause_quit <...>
		return
	endif
	musicstudio_mainobj :MusicStudio_PauseAll \{stack_id = jam_save
		Pause = true}
	jam_save_song_setup
	fire_achievement name = Achievement_DraftPunk controller = ($primary_controller)
	Change \{memcard_after_func = jam_band_pause_save_and_quit_after_func}
	ui_memcard_save_jam \{event = menu_back
		data = {
			state = UIstate_jam_select_song
			editing = 1
			show_popup = 0
		}}
endscript

script jam_band_pause_save_and_quit_after_func 
	musicstudio_jamroom_exit_cleanup
	jam_save_song_unload
	musicstudio_mainobj :MusicStudio_PauseAll \{stack_id = jam_save
		Pause = false}
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
	destroy_dialog_box
	set_focus_color \{Color = pure_white}
	set_unfocus_color \{Color = gh4_jam_orangeish}
	Change \{jam_band_new_song = 0}
endscript

script jam_band_pause_save_as_text_select 
	destroy_dialog_box
	jam_get_num_songs
	if (<user_song_count> < ($jam_max_user_songs))
		Change \{target_jam_camera_prop = jam_publish}
		jam_camera_wait
		if ($jam_band_new_song = 1)
			start_text = qs(0xef150ff7)
		else
			start_text = ($jam_selected_song)
		endif
		ui_event event = menu_change data = {state = UIstate_jam_publish_text_entry text = <start_text> choose_script = jam_band_pause_save_as}
	else
		jam_save_as_failed_dialog \{dialog = 0}
	endif
endscript

script jam_save_as_failed_dialog \{dialog = 0}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		FormatText \{TextName = dialog
			qs(0xedf2cf45)
			s = $jam_max_user_songs}
	endswitch
	destroy_dialog_box
	create_dialog_box {
		heading_text = qs(0xfb9c065f)
		body_text = <dialog>
		options = [
			{
				func = jam_save_as_failed_go_back
				text = qs(0x320a8d1c)
			}
		]
	}
endscript

script jam_save_as_failed_go_back 
	destroy_dialog_box
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
	set_focus_color \{Color = pure_white}
	set_unfocus_color \{Color = gh4_jam_orangeish}
	Change \{jam_band_new_song = 0}
endscript

script jam_band_save_dialog \{dialog = 0}
	LaunchEvent type = unfocus target = <vmenu_id>
	if ($jam_advanced_record = 0)
		destroy_jam_band_menu
		from_adv = 0
	else
		destroy_jam_recording_menu
		from_adv = 1
		ghmix_persistant_settings = {}
		AddParam structure_name = ghmix_persistant_settings name = cur_playtime value = ($jam_highway_play_time)
		AddParam structure_name = ghmix_persistant_settings name = cur_playline_pos value = ($jam_highway_play_line_pos)
		AddParam structure_name = ghmix_persistant_settings name = cur_lead_octave value = ($jam_lead_octave_range)
		AddParam structure_name = ghmix_persistant_settings name = cur_melody_octave value = ($jam_melody_octave_range)
		AddParam structure_name = ghmix_persistant_settings name = cur_rhythm_chords value = ($jam_rhythm_chord_type)
		AddParam structure_name = ghmix_persistant_settings name = cur_instrument value = ($jam_current_track)
		AddParam structure_name = ghmix_persistant_settings name = cur_loop_low value = ($jam_loop_bound_low)
		AddParam structure_name = ghmix_persistant_settings name = cur_loop_high value = ($jam_loop_bound_high)
		AddParam structure_name = ghmix_persistant_settings name = cur_control value = ($jam_control_selected)
		AddParam structure_name = ghmix_persistant_settings name = cur_quantize value = ($jam_current_quantize)
	endif
	clean_up_user_control_helpers
	GetPlayerInfo <select_player> controller
	change_primary_controller controller = <controller>
	jam_update_curr_directory_listing controller = ($primary_controller)
	switch <dialog>
		case 0
		FormatText \{TextName = Title
			qs(0xe3c58212)}
		FormatText \{TextName = save_dialog
			qs(0x3b907ccc)}
	endswitch
	create_dialog_box {
		heading_text = <Title>
		body_text = <save_dialog>
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
		back_button_script = jam_band_save_dialog_cancel
		back_button_params = {from_adv = <from_adv> ghmix_persistant_settings = <ghmix_persistant_settings>}
	}
	dim_save_option_for_guest <...> popup_warning_child_index = 0
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
endscript

script jam_band_save_dialog_cancel 
	destroy_dialog_box
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
	LaunchEvent type = unfocus target = <vmenu_id>
	if ($jam_advanced_record = 0)
		destroy_jam_band_menu
		from_adv = 0
	else
		destroy_jam_recording_menu
		from_adv = 1
		ghmix_persistant_settings = {}
		AddParam structure_name = ghmix_persistant_settings name = cur_playtime value = ($jam_highway_play_time)
		AddParam structure_name = ghmix_persistant_settings name = cur_playline_pos value = ($jam_highway_play_line_pos)
		AddParam structure_name = ghmix_persistant_settings name = cur_lead_octave value = ($jam_lead_octave_range)
		AddParam structure_name = ghmix_persistant_settings name = cur_melody_octave value = ($jam_melody_octave_range)
		AddParam structure_name = ghmix_persistant_settings name = cur_rhythm_chords value = ($jam_rhythm_chord_type)
		AddParam structure_name = ghmix_persistant_settings name = cur_instrument value = ($jam_current_track)
		AddParam structure_name = ghmix_persistant_settings name = cur_loop_low value = ($jam_loop_bound_low)
		AddParam structure_name = ghmix_persistant_settings name = cur_loop_high value = ($jam_loop_bound_high)
		AddParam structure_name = ghmix_persistant_settings name = cur_control value = ($jam_control_selected)
		AddParam structure_name = ghmix_persistant_settings name = cur_quantize value = ($jam_current_quantize)
	endif
	clean_up_user_control_helpers
	GetPlayerInfo <select_player> controller
	change_primary_controller controller = <controller>
	jam_update_curr_directory_listing controller = ($primary_controller)
	create_dialog_box {
		heading_text = qs(0x9bb76248)
		body_text = qs(0xf61a5462)
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
		back_button_script = jam_band_quit_dialog_cancel
		back_button_params = {from_adv = <from_adv> ghmix_persistant_settings = <ghmix_persistant_settings>}
	}
	dim_save_option_for_guest <...> popup_warning_child_index = 0
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
endscript

script jam_band_quit_dialog_cancel 
	destroy_dialog_box
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
		LaunchEvent type = unfocus target = <scrolling_options>
	endif
	if (<respawn_input> = 1)
		GetPlayerInfo <select_player> jam_instrument
		GetPlayerInfo <select_player> controller
		FormatText checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
		if NOT (<jam_instrument> = $jam_mic_id)
			if StructureContains structure = ($jam_tracks [<jam_instrument>]) ui_create_func
				FormatText checksumname = inst_cont 'inst_cont_%s' s = <select_player>
				jam_destroy_fretboard player = <select_player>
				spawnscriptnow ($jam_tracks [<jam_instrument>].ui_create_func) id = <jam_player_spawns> params = {parent_id = <inst_cont> player = <select_player> controller = <controller>}
			endif
			if StructureContains structure = ($jam_tracks [<jam_instrument>]) input_func
				FormatText checksumname = input_spawn 'input_spawn_%s' s = <select_player>
				spawnscriptnow ($jam_tracks [<jam_instrument>].input_func) id = <input_spawn> params = {select_player = <select_player> show_hud = 0 controller = <controller> spawn_id = <input_spawn>}
			endif
		else
			spawnscriptnow jam_band_activate_mic id = <jam_player_spawns> params = {select_player = <select_player>}
		endif
	endif
	if ScreenElementExists id = <player_pause>
		if NOT ($jam_advanced_record = 1)
			<player_pause> :LegacyDoMorph Pos = (0.0, -300.0) time = 0.1
		else
			<player_pause> :LegacyDoMorph Pos = (133.0, -500.0) time = 0.1
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
	FormatText checksumname = effect_info_box 'effect_info_box_%a' a = <select_player>
	if ScreenElementExists id = <effect_info_box>
		FormatText checksumname = player_cont 'inst_player_cont_%s' s = <select_player>
		<effect_info_box> :SE_SetProps Pos = (5.0, -355.0) time = 0.1
	endif
	if ScreenElementExists id = <player_pause>
		if NOT ($jam_advanced_record = 1)
			SoundEvent \{event = Menu_Recording_Pause_Panel_Out}
		endif
		destroy_menu menu_id = <scrolling_options>
		DestroyScreenElement id = <player_pause>
	endif
	if ((<respawn_input> = 1) || (<respawn_input> = -1))
		if ScreenElementExists id = <event_cont>
			LaunchEvent type = focus target = <event_cont>
		else
			return
		endif
	endif
	if ($jam_advanced_record = 1)
		spawnscriptnow \{jam_studio_animate_mouse}
		clean_up_user_control_helpers
		menu_jam_band_add_control_helpers
		if NOT GotParam \{no_sound}
			SoundEvent \{event = Jam_Advanced_Record_Pause_Panel_Out}
		endif
		killspawnedscript \{name = jam_highway_select_quantize}
		spawnscriptnow \{jam_highway_select_quantize
			id = jam_recording_spawns}
		LaunchEvent type = focus target = <event_cont>
		jam_ghmix_show_scale_reference
	else
		menu_jam_band_add_control_helpers state = instrument_ui instrument = <select_instrument>
	endif
endscript

script jam_band_pause_record_text 
	player = 1
	begin
	FormatText checksumname = text_id 'option_text_%a_%b' a = <option> b = <player>
	if ($jam_band_recording = 1)
		if ScreenElementExists id = <text_id>
			SetScreenElementProps id = <text_id> text = qs(0x0a46311a)
		endif
	else
		if ScreenElementExists id = <text_id>
			SetScreenElementProps id = <text_id> text = qs(0xea37872c)
		endif
	endif
	<player> = (<player> + 1)
	repeat ($num_jam_players)
endscript

script destroy_jam_band_menu 
	active_controllers = [0 0 0 0 0 0 0]
	GetActiveControllers
	jam_band_deactivate_mic
	jam_input_melody_stop_sound
	if ($game_mode = practice)
		jam_destroy_tutorial_menu
	endif
	Change \{jam_highway_playing = 0}
	Change \{jam_band_recording = 0}
	Change \{jam_highway_recording = 0}
	musicstudio_reinit_menu_sounds
	killspawnedscript \{name = line6_pod_remove}
	stop_custom_song
	killspawnedscript \{id = jam_band_spawns}
	killspawnedscript \{id = jam_input_spawns}
	killspawnedscript \{id = jam_recording_spawns}
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ScreenElementExists \{id = jam_band_container}
		DestroyScreenElement \{id = jam_band_container}
	endif
endscript

script jam_destroy_player 
	FormatText checksumname = player_cont 'inst_player_cont_%s' s = <player>
	if ScreenElementExists id = <player_cont>
		DestroyScreenElement id = <player_cont>
	endif
	FormatText checksumname = scrolling_inst_select 'scrolling_inst_select_%s' s = <player>
	if ScreenElementExists id = <scrolling_inst_select>
		destroy_menu menu_id = <scrolling_inst_select>
	endif
	FormatText checksumname = scrolling_options 'scrolling_options_%s' s = <player>
	if ScreenElementExists id = <scrolling_options>
		destroy_menu menu_id = <scrolling_options>
	endif
	FormatText checksumname = inst_cont 'inst_cont_%s' s = <player>
	if ScreenElementExists id = <inst_cont>
		destroy_menu menu_id = <inst_cont>
	endif
	FormatText checksumname = scale_preview_spawn 'scale_preview_spawn_%s' s = <player>
	killspawnedscript id = <scale_preview_spawn>
	FormatText checksumname = jam_playback_delete 'jam_playback_delete_%s' s = <player>
	killspawnedscript id = <jam_playback_delete>
	FormatText checksumname = input_spawn 'input_spawn_%s' s = <player>
	killspawnedscript id = <input_spawn>
	FormatText checksumname = arpeggiator_spawn 'arpeggiator_spawn_%s' s = <player>
	killspawnedscript id = <arpeggiator_spawn>
	jam_input_destroy_player_server player = <player>
	jam_kill_update_note_length player = <player>
	GetPlayerInfo <player> jam_instrument
	if (<jam_instrument> = $jam_mic_id)
		jam_band_deactivate_mic select_player = <player>
	endif
	FormatText checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <player>
	killspawnedscript id = <jam_player_spawns>
endscript

script guitar_jam_simplerecops_play 
	if NOT GotParam \{from_countin}
		if ScriptIsRunning \{musicstudio_jamroom_count_in}
			return
		endif
	endif
	if ($jam_band_recording = 0)
		if ($jam_highway_playing = 0)
			guitar_jam_simplerecops_command_startplay select_player = <select_player>
			SoundEvent \{event = DPad_Play}
		else
			guitar_jam_simplerecops_command_stopplay
			SoundEvent \{event = DPad_Stop}
		endif
	else
		guitar_jam_simplerecops_command_stoprec select_player = <select_player>
		guitar_jam_simplerecops_command_stopplay
	endif
endscript

script guitar_jam_simplerecops_record 
	if ScriptIsRunning \{musicstudio_jamroom_count_in}
		return
	endif
	if ($jam_player_recording_armed [(<select_player> - 1)] = 0)
		guitar_jam_simplerecops_command_startrec select_player = <select_player>
	else
		guitar_jam_simplerecops_command_stoprec select_player = <select_player>
	endif
endscript

script guitar_jam_simplerecops_command_startplay 
	Change \{jam_highway_playing = 1}
	spawnscriptnow \{jam_band_recording_begin
		id = jam_band_spawns}
	<player> = 1
	begin
	FormatText checksumname = simple_rec_button_onr 'jam_simple_rec_button_onr_%s' s = <select_player>
	FormatText checksumname = simple_rec_icon_play 'jam_simple_rec_icon_play_%s' s = <select_player>
	FormatText checksumname = simple_rec_icon_stop 'jam_simple_rec_icon_stop_%s' s = <select_player>
	if ScreenElementExists id = <simple_rec_button_onr>
		safe_hide id = <simple_rec_icon_play>
		safe_show id = <simple_rec_icon_stop>
		safe_show id = <simple_rec_button_onr>
	endif
	<player> = (<player> + 1)
	repeat ($num_jam_players)
	broadcastevent \{type = jam_tutorial_play_start}
endscript

script guitar_jam_simplerecops_command_stopplay 
	Change \{jam_band_recording = 0}
	Change \{jam_highway_playing = 0}
	Change \{jam_highway_recording = 0}
	killspawnedscript \{name = playback_delete_custom_track}
	stop_custom_song
	killspawnedscript \{name = jam_band_recording_begin}
	killspawnedscript \{name = jam_recording_metronome}
	jam_stop_all_samples
	jam_stop_all_sound
	jam_input_melody_stop_sound
	<player> = 1
	begin
	if ($jam_player_recording_armed [<player> -1] = 1)
		if musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
			set_highway_recording_effect player = <player> state = off blend_off
		endif
	endif
	FormatText checksumname = simple_rec_icon_play 'jam_simple_rec_icon_play_%s' s = <player>
	FormatText checksumname = simple_rec_icon_rec 'jam_simple_rec_icon_rec_%s' s = <player>
	FormatText checksumname = simple_rec_icon_rw 'jam_simple_rec_icon_rw_%s' s = <player>
	FormatText checksumname = simple_rec_icon_ff 'jam_simple_rec_icon_ff_%s' s = <player>
	FormatText checksumname = simple_rec_icon_stop 'jam_simple_rec_icon_stop_%s' s = <player>
	FormatText checksumname = simple_rec_button_onr 'jam_simple_rec_button_onr_%s' s = <player>
	FormatText checksumname = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <player>
	FormatText checksumname = right_hold 'right_hold_player%s' s = <player>
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
	<player> = (<player> + 1)
	repeat ($num_jam_players)
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
	musicstudio_jamroom_set_state_text player = <select_player> state = recording
	set_highway_recording_effect player = <select_player> state = on
	Change \{jam_band_recording = 1}
	Change \{jam_highway_recording = 1}
	SoundEvent \{event = Recording_Start}
	SetArrayElement arrayName = jam_player_recording_armed GlobalArray index = (<select_player> - 1) newValue = 1
	curr_time = ($jam_highway_play_time)
	CastToInteger \{curr_time}
	SetArrayElement arrayName = jam_player_recording_begin_time GlobalArray index = (<select_player> - 1) newValue = <curr_time>
	GetPlayerInfo <select_player> jam_instrument
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
	GetPlayerInfo <select_player> jam_instrument
	FormatText checksumname = jam_playback_delete 'jam_playback_delete_%s' s = <select_player>
	spawnscriptnow playback_delete_custom_track id = <jam_playback_delete> params = {jam_instrument = <jam_instrument> start_time = $jam_highway_play_time}
	FormatText checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
	spawnscriptnow jam_recording_metronome id = <jam_player_spawns> params = {select_player = <select_player>}
	FormatText checksumname = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <select_player>
	safe_show id = <simple_rec_button_onl>
	broadcastevent \{type = jam_tutorial_record_start}
endscript

script jam_band_recording_begin 
	reset_song_time starttime = ($jam_highway_play_time)
	playback_custom_song \{start_time = $jam_highway_play_time}
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
	musicstudio_jamroom_set_state_text player = <select_player> state = Play
	set_highway_recording_effect player = <select_player> state = off blend_off
	SetArrayElement arrayName = jam_player_recording_armed GlobalArray index = (<select_player> - 1) newValue = 0
	SetArrayElement arrayName = jam_player_recording_begin_time GlobalArray index = (<select_player> - 1) newValue = 0
	FormatText checksumname = jam_playback_delete 'jam_playback_delete_%s' s = <select_player>
	killspawnedscript id = <jam_playback_delete>
	musicstudio_mainobj :MusicStudio_PlaySong \{start_time = $jam_highway_play_time}
	if NOT GotParam \{no_sound}
		SoundEvent \{event = Recording_Stop}
	endif
	if GotParam \{all}
		FormatText \{checksumname = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 1}
		safe_hide id = <simple_rec_button_onl>
		FormatText \{checksumname = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 2}
		safe_hide id = <simple_rec_button_onl>
		FormatText \{checksumname = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 3}
		safe_hide id = <simple_rec_button_onl>
		FormatText \{checksumname = simple_rec_button_onl
			'jam_simple_rec_button_onl_%s'
			s = 4}
		safe_hide id = <simple_rec_button_onl>
	else
		FormatText checksumname = simple_rec_button_onl 'jam_simple_rec_button_onl_%s' s = <select_player>
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
	repeat <array_size>
	if (<is_recording> = 0)
		killspawnedscript \{name = jam_recording_metronome}
		Change \{jam_band_recording = 0}
		Change \{jam_highway_recording = 0}
	endif
	broadcastevent \{type = jam_tutorial_record_end}
endscript

script guitar_jam_simplerecops_skipfb 
	<button> = <Dir>
	if GotParam \{direction_override}
		<button> = <direction_override>
	endif
	musicstudio_update_dir_for_lefty_flip button = <button> player = <select_player>
	<initial_button_flash_time> = 0.15
	<time_held_before_spam> = 0.15
	<spam_frequency> = 0.1
	if (($jam_highway_playing = 1) || ($jam_highway_recording = 1))
		printf \{channel = jam_mode
			qs(0x25c1e3fb)}
		return
	endif
	SoundEvent \{event = DPad_Play}
	if (<Dir> = right)
		FormatText checksumname = simple_rec_arrow 'jam_simple_rec_arrow_r_%s' s = <select_player>
		FormatText checksumname = simple_rec_button_on 'jam_simple_rec_button_onr_%s' s = <select_player>
		FormatText checksumname = simple_rec_button_other 'jam_simple_rec_button_onl_%s' s = <select_player>
		safe_hide id = <simple_rec_button_other>
		<new_time> = ($jam_highway_play_time + 1000)
	elseif (<Dir> = left)
		FormatText checksumname = simple_rec_arrow 'jam_simple_rec_arrow_l_%s' s = <select_player>
		FormatText checksumname = simple_rec_button_on 'jam_simple_rec_button_onl_%s' s = <select_player>
		FormatText checksumname = simple_rec_button_other 'jam_simple_rec_button_onr_%s' s = <select_player>
		safe_hide id = <simple_rec_button_other>
		<new_time> = ($jam_highway_play_time - 1000)
	endif
	GetPlayerInfo <select_player> controller
	<scroll_5> = 5
	<scroll_4> = 3
	<scroll_3> = 1
	<scroll_2> = 0.5
	<scroll_1> = 0.2
	<speed_5> = 100
	<speed_4> = 50
	<speed_3> = 20
	<speed_2> = 3
	<speed_1> = 1.5
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
	else
		<scroll_speed> = 1.0
	endif
	GetDeltaTime
	<delta_time> = (<delta_time> * 1000.0)
	<scroll_speed> = (<scroll_speed> * (<delta_time> * 0.5))
	if (<Dir> = right)
		Change jam_highway_play_time = (($jam_highway_play_time) + <scroll_speed>)
	else
		Change jam_highway_play_time = (($jam_highway_play_time) - <scroll_speed>)
	endif
	if (($jam_highway_play_time) < 0)
		Change \{jam_highway_play_time = 0}
	endif
	<time_held> = (<time_held> + <spam_frequency>)
	wait \{1
		gameframe}
	repeat
endscript

script guitar_jam_goto_advanced_rec 
	destroy_jam_band_menu
	Change jam_current_recording_player = <select_player>
	GetPlayerInfo <select_player> jam_instrument
	if (<jam_instrument> = $jam_mic_id)
		SetPlayerInfo <select_player> jam_instrument = 4
		<jam_instrument> = 4
	elseif (<jam_instrument> = -1)
		SetPlayerInfo <select_player> jam_instrument = 0
		<jam_instrument> = 0
	endif
	GetPlayerInfo <select_player> controller
	change_primary_controller controller = <controller>
	jam_update_curr_directory_listing controller = ($primary_controller)
	ui_event event = menu_replace data = {state = uistate_recording editing = 1 current_instrument = <jam_instrument> player = <select_player>}
endscript

script guitar_jam_goto_rec_studio 
	destroy_jam_recording_menu
	ui_event event = menu_replace data = {state = uistate_jam_band editing = 1 current_instrument = <jam_instrument> player = <select_player>}
endscript

script jam_pause_check_simple_record_input 
	FormatText checksumname = player_pause 'jam_band_pause_%s' s = <select_player>
	begin
	jam_check_simple_record_input controller = <controller> select_player = <select_player>
	if NOT ScreenElementExists id = <player_pause>
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
endscript

script jam_note_limit_hit 
	<z_priority> = 28
	FormatText checksumname = player_cont 'inst_player_cont_%s' s = <player>
	if NOT ScreenElementExists id = <player_cont>
		if NOT ScreenElementExists \{id = jam_player_recording_cont}
			return
		else
			<player_cont> = jam_player_recording_cont
			<z_priority> = 32
		endif
	endif
	FormatText checksumname = msg_box 'jam_limit_msg_box_%a' a = <player>
	if ScreenElementExists id = <msg_box>
		return
	endif
	CreateScreenElement {
		type = TextBlockElement
		parent = <player_cont>
		id = <msg_box>
		font = fontgrid_text_A3
		just = [center center]
		internal_just = [center center]
		z_priority = 100
		rgba = [220 220 220 255]
		dims = (80.0, 50.0)
		Pos = (0.0, 348.0)
		text = qs(0x9e3ba7cd)
		scale = 2
		internal_scale = 0.3
		allow_expansion
		z_priority = <z_priority>
	}
	if NOT ScreenElementExists id = <msg_box>
		return
	endif
	LegacyDoScreenElementMorph id = <msg_box> scale = 2.5 time = 0.18
	wait \{0.18
		seconds}
	if NOT ScreenElementExists id = <msg_box>
		return
	endif
	LegacyDoScreenElementMorph id = <msg_box> scale = 2 time = 0.18
	wait \{0.18
		seconds}
	if NOT ScreenElementExists id = <msg_box>
		return
	endif
	LegacyDoScreenElementMorph id = <msg_box> scale = 2.5 time = 0.18
	wait \{0.18
		seconds}
	if NOT ScreenElementExists id = <msg_box>
		return
	endif
	LegacyDoScreenElementMorph id = <msg_box> scale = 2 time = 0.18
	wait \{0.18
		seconds}
	if NOT ScreenElementExists id = <msg_box>
		return
	endif
	LegacyDoScreenElementMorph id = <msg_box> scale = 2.5 time = 0.18
	wait \{0.18
		seconds}
	if NOT ScreenElementExists id = <msg_box>
		return
	endif
	LegacyDoScreenElementMorph id = <msg_box> scale = 2 time = 0.18
	wait \{1
		seconds}
	if NOT ScreenElementExists id = <msg_box>
		return
	endif
	LegacyDoScreenElementMorph id = <msg_box> scale = 0 time = 0.25
	wait \{0.25
		seconds}
	DestroyScreenElement id = <msg_box>
endscript

script jam_band_create_gem 
	if ($jam_advanced_record = 1)
		return
	endif
	CreateScreenElement {
		id = jam_band_gem
		type = ContainerElement
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
				type = SpriteElement
				parent = jam_band_gem
				texture = (<gems> [<gem_count>].texture)
				just = [center center]
				rgba = (<gems> [<gem_count>].rgba)
				Pos = ((<gem_offset> * (3)) + (0.0, 0.0))
				z_priority = <z_priority>
				dims = (120.0, 5.0)
				scale = <gem_scale>
			}
		else
			CreateScreenElement {
				type = SpriteElement
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
	repeat <array_size>
	pixels_per_half_measure = 200
	seconds_per_half_measure = ((60.0 / $jam_current_bpm) * 2)
	new_gem_pos = (<gem_pos> + ((0.0, 1.0) * <pixels_per_half_measure>))
	jam_band_gem :SetProps just = [right top] Pos = <new_gem_pos> time = <seconds_per_half_measure> alpha = 0
endscript

script jam_band_activate_mic 
	GetPlayerInfo <select_player> controller
	InitJamMic controller = <controller>
	begin
	jam_check_simple_record_input controller = <controller> select_player = <select_player>
	wait \{1
		gameframe}
	repeat
endscript

script jam_band_deactivate_mic 
	killspawnedscript \{name = jam_band_activate_mic}
	ShutDownJamMic
endscript

script jam_create_extra_info \{player = 1}
	FormatText checksumname = extra_info_id 'jam_band_extra_info_%s' s = <player>
	if ScreenElementExists id = <extra_info_id>
		DestroyScreenElement id = <extra_info_id>
	endif
	if GotParam \{arpeggiator}
		GetPlayerInfo <player> jam_instrument
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
	FormatText checksumname = player_cont 'inst_player_cont_%a' a = <player>
	if ScreenElementExists id = <player_cont>
		CreateScreenElement {
			parent = <player_cont>
			id = <extra_info_id>
			type = DescInterface
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
		if <extra_info_id> :Desc_ResolveAlias name = alias_helper
			<resolved_id> :SE_SetProps helper_description_text = <helper_text>
		endif
		<extra_info_id> :SE_SetProps alpha = 1 time = 0.2
		<extra_info_id> :SE_WaitProps
	endif
endscript

script jam_remove_extra_info 
	FormatText checksumname = extra_info_id 'jam_band_extra_info_%s' s = <player>
	if ScreenElementExists id = <extra_info_id>
		<extra_info_id> :SE_SetProps alpha = 0 time = 0.5
		<extra_info_id> :SE_WaitProps
		DestroyScreenElement id = <extra_info_id>
	endif
endscript

script jam_band_pause_mixer 
	LaunchEvent type = unfocus target = <vmenu_id>
	if ($jam_advanced_record = 0)
		destroy_jam_band_menu
		from_adv = 0
	else
		destroy_jam_recording_menu
		from_adv = 1
		ghmix_persistant_settings = {}
		AddParam structure_name = ghmix_persistant_settings name = cur_playtime value = ($jam_highway_play_time)
		AddParam structure_name = ghmix_persistant_settings name = cur_playline_pos value = ($jam_highway_play_line_pos)
		AddParam structure_name = ghmix_persistant_settings name = cur_lead_octave value = ($jam_lead_octave_range)
		AddParam structure_name = ghmix_persistant_settings name = cur_melody_octave value = ($jam_melody_octave_range)
		AddParam structure_name = ghmix_persistant_settings name = cur_rhythm_chords value = ($jam_rhythm_chord_type)
		AddParam structure_name = ghmix_persistant_settings name = cur_instrument value = ($jam_current_track)
		AddParam structure_name = ghmix_persistant_settings name = cur_loop_low value = ($jam_loop_bound_low)
		AddParam structure_name = ghmix_persistant_settings name = cur_loop_high value = ($jam_loop_bound_high)
		AddParam structure_name = ghmix_persistant_settings name = cur_control value = ($jam_control_selected)
		AddParam structure_name = ghmix_persistant_settings name = cur_quantize value = ($jam_current_quantize)
	endif
	clean_up_user_control_helpers
	ui_event event = menu_change data = {state = UIstate_jam_mixer from_adv = <from_adv> ghmix_persistant_settings = <ghmix_persistant_settings>}
endscript
