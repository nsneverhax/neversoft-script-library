
script jam_band_create_highway 
	printf \{channel = jam_mode
		qs(0x2019133c)}
	jam_band_highway_pos = (223.0, 611.0)
	jam_band_highway_height = 52
	highway_priority = 150
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
	CreateScreenElement \{Type = ContainerElement
		parent = jam_band_container
		id = jam_band_highway_master
		just = [
			center
			center
		]
		Scale = (0.95, 1.37)
		Pos = (370.0, 626.0)
		rot_angle = 0}
	CreateScreenElement \{Type = ContainerElement
		parent = jam_band_highway_master
		id = jam_band_highway
		Pos = (0.0, 0.0)
		Scale = 1
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
	CreateScreenElement \{Type = ContainerElement
		parent = jam_band_highway
		id = jam_band_highway_playline
		Pos = (0.0, 0.0)
		Scale = 1}
	CreateScreenElement {
		Type = SpriteElement
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
		Type = SpriteElement
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
	CreateScreenElement \{Type = ContainerElement
		parent = jam_band_highway
		id = jam_band_highway_bars_container
		Pos = (0.0, 0.0)}
	count = 0
	curr_time = 0
	begin
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
	<curr_time> = (<curr_time> + 60000)
	if (<curr_time> >= 600000)
		break
	endif
	repeat
	SpawnScriptNow jam_band_update_highway id = jam_band_spawns params = {<...>}
endscript

script jam_band_update_highway 
	begin
	SpawnScriptNow jam_band_update_highway_detailed params = {<...> refresh_bots = 0}
	begin
	if ($jam_band_force_refresh_detailed_highway = 1)
		SpawnScriptNow jam_band_update_highway_detailed params = {<...>}
		Change \{jam_band_force_refresh_detailed_highway = 0}
	endif
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

script jam_band_update_highway_detailed \{pixels_per_second = (0.0, 0.0)
		refresh_bots = 1}
	highway_priority = 50
	block_seperation = 1000
	fastgetarraysize array = ($jam_tracks)
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
		musicstudio_mainobj :musicstudiojamroom_getbotstatus index = <index>
		if (<Enabled> = 1)
			<rebuild> = 0
		endif
	endif
	if (<rebuild> = 1)
		gettracksize track = ($jam_tracks [<index>].id)
		<offset> = ($jam_tracks [<index>].jamroom_track_offset)
		bar_pos = ((0.0, 1.0) * (<track_offset> * (<offset> + 1)))
		bar_pos = (<bar_pos> - ((0.0, 1.0) * 30))
		formatchecksum format_string = 'track_id_simple_%s' format_params = {s = <index>}
		<track_id_simple> = <checksum>
		if screenelementexistssimpleid id = <track_id_simple>
			destroyscreenelementsimpleid id = <track_id_simple>
		endif
		formatchecksum format_string = 'track_id_%s' format_params = {s = <index>}
		<track_id> = <checksum>
		if screenelementexistssimpleid id = <track_id>
			destroyscreenelementsimpleid id = <track_id>
		endif
		fastcreatescreenelement params = {
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
		if (<track_size> > 0)
			begin
			getcustomnote track = ($jam_tracks [<index>].id) index = <block_index>
			if (<start_block_time> < 0)
				<start_block_time> = <note_time>
				<end_block_time> = (<note_time> + <note_length>)
			endif
			if (((<note_time> + <note_length>) - <end_block_time>) >= <block_seperation>)
				block_start = ((<start_block_time> / 1000.0) * <pixels_per_second>)
				block_end = (((<end_block_time> - <start_block_time>) / 1000.0) * <pixels_per_second>)
				fastcreatescreenelement params = {
					Type = SpriteElement
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
			fastcreatescreenelement params = {
				Type = SpriteElement
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
	repeat <array_Size>
endscript

script jam_band_update_highway_simple 
	highway_priority = 50
	GetArraySize \{$jam_tracks}
	index = 0
	track_offset = 10.5
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
			<offset> = ($jam_tracks [<index>].jamroom_track_offset)
			bar_pos = (<bar_pos> + ((0.0, 1.0) * (<track_offset> * (<offset> + 1))))
			bar_pos = (<bar_pos> - ((0.0, 1.0) * 30))
			track_size = ((($jam_highway_play_time / 1000) * <pixels_per_second>) - (($jam_player_recording_begin_time [(<player_has_inst> - 1)] / 1000) * <pixels_per_second>))
			if (<show_bar> = 1)
				formatText checksumName = track_id 'track_id_simple_%s' s = <index>
				if ScreenElementExists id = <track_id>
					DestroyScreenElement id = <track_id>
				endif
				<Color> = [220 220 220 150]
				CreateScreenElement {
					Type = SpriteElement
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
	repeat <array_Size>
endscript
