ghmix_highway_pixels_per_beat = 80
ghmix_highway_visible_after = -300
ghmix_highway_visible_before = 300
ghmix_highway_highway_pos = (50.0, 290.0)
ghmix_highway_show_waveform = 0
ghmix_highway_show_waveform_z = 0.0

script musicstudio_create_highway \{song = editable
		gem_scale = 1.0
		small_view = 0
		waveform = 0}
	requireparams \{[
			pixels_per_beat
			visible_after
			visible_before
			highway_pos
		]
		all}
	change ghmix_highway_pixels_per_beat = <pixels_per_beat>
	change ghmix_highway_visible_after = <visible_after>
	change ghmix_highway_visible_before = <visible_before>
	change ghmix_highway_highway_pos = <highway_pos>
	change ghmix_highway_show_waveform = <waveform>
	if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
			param = alias_ghmix_highway}
		if NOT <alias_ghmix_highway> :desc_resolvealias name = ghmix_highway_window param = ghmix_highway_window
			return
		endif
	else
		return
	endif
	z_priority = 5
	createscreenelement {
		type = containerelement
		parent = <ghmix_highway_window>
		id = jam_highway_container_master
		just = [center center]
		pos = ($ghmix_highway_highway_pos)
		scale = 1
	}
	createscreenelement \{type = containerelement
		parent = jam_highway_container_master
		id = jam_highway_container
		pos = (0.0, 0.0)
		scale = 1}
	initialize_jam_highway
	appendsuffixtochecksum base = <song> suffixstring = '_fretbars'
	song_fretbars = <appended_id>
	appendsuffixtochecksum base = <song_fretbars> suffixstring = '_size'
	fretbar_size = <appended_id>
	bar_size = ((($<song_fretbars> [(($<fretbar_size>) - 1)]) / 1000.0) * $jam_highway_pixels_per_second)
	createscreenelement {
		type = spriteelement
		parent = jam_highway_container
		texture = white
		just = [left bottom]
		rgba = [0 0 0 255]
		pos = (0.0, 98.0)
		dims = ((661.0, 0.0) + (0.0, 100.0))
		z_priority = <z_priority>
		alpha = 0.7
	}
	change jam_highway_end_time = ($<song_fretbars> [($<fretbar_size> - 1)])
	change \{musicstudio_fretbars_alpha = 1}
	change \{musicstudio_measure_numbers_alpha = 1}
	change \{musicstudio_show_nowbar_particles = 1}
	if NOT gotparam \{instrument}
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_getinstrument
	endif
	gem_offset = (39.0, 0.0)
	if ($jam_notetracking = 1)
		if (<instrument> = 5)
			gem_offset = (10.0, 0.0)
		endif
	endif
	musicstudio_ghmix_create_notetrack {
		jam_instrument = <instrument>
		pos = (402.0, 0.0)
		gem_offset = <gem_offset>
		open_note_offset = (41.5, 0.0)
		open_note_scale = (0.96999997 * <gem_scale>)
		gem_scale = (0.85 * <gem_scale>)
		small_view = <small_view>
	}
	getarraysize \{$jam_tracks}
	<small_gems_begin_pos> = (14.0, 0.0)
	track = (<instrument> + 1)
	<count> = 1
	begin
	if (<track> > (<array_size> - 1))
		<track> = 0
	endif
	gem_offset = (18.0, 0.0)
	if musicstudio_mainobj :musicstudio_isusingstream
		if (<track> = 5)
			gem_offset = (7.0, 0.0)
		endif
	endif
	musicstudio_ghmix_create_notetrack {
		jam_instrument = <track>
		pos = <small_gems_begin_pos>
		gem_offset = <gem_offset>
		open_note_offset = (43.0, 0.0)
		open_note_scale = (0.46 * <gem_scale>)
		gem_scale = (0.5 * <gem_scale>)
		small_view = 1
	}
	if musicstudio_mainobj :musicstudio_isusingstream
		<small_gems_begin_pos> = (<small_gems_begin_pos> + (77.0, 0.0))
	else
		if NOT (<track> = 5)
			<small_gems_begin_pos> = (<small_gems_begin_pos> + (96.5, 0.0))
		endif
	endif
	<track> = (<track> + 1)
	<count> = (<count> + 1)
	repeat (<array_size> - 1)
	musicstudio_mainobj :musicstudiohighway_update \{on = true}
endscript

script musicstudio_ghmix_create_notetrack \{small_view = 0}
	formattext checksumname = notetrack_cont 'jam_highway_notetrack_containter_%s' s = <jam_instrument>
	<drum> = 0
	getplayerinfo \{$jam_current_recording_player
		controller}
	if isdrumcontroller controller = <controller>
		<drum> = 1
	endif
	jam_menu_get_lefty \{player = $jam_current_recording_player}
	if (<drum> = 1)
		<lefty> = 0
		<gem_textures> = [
			{
				texture = ghmix_red_note
				perc_texture = ghmix_red_note_p
				star_texture = ghmix_red_star
				perc_star_texture = ghmix_red_star_p
				playable_texture = circle
				dims = (64.0, 64.0)
			}
			{
				texture = ghmix_yellow_note
				perc_texture = ghmix_yellow_note_p
				star_texture = ghmix_yellow_star
				perc_star_texture = ghmix_yellow_star_p
				playable_texture = circle
				dims = (64.0, 64.0)
			}
			{
				texture = ghmix_blue_note
				perc_texture = ghmix_blue_note_p
				star_texture = ghmix_blue_star
				perc_star_texture = ghmix_blue_star_p
				playable_texture = circle
				dims = (64.0, 64.0)
			}
			{
				texture = ghmix_orange_note
				perc_texture = ghmix_orange_note_p
				star_texture = ghmix_orange_star
				perc_star_texture = ghmix_orange_star_p
				playable_texture = circle
				dims = (64.0, 64.0)
			}
			{
				texture = ghmix_green_note
				perc_texture = ghmix_green_note_p
				star_texture = ghmix_green_star
				perc_star_texture = ghmix_green_star_p
				playable_texture = circle
				dims = (64.0, 64.0)
			}
			{
				texture = ghmix_open_note
				star_texture = ghmix_open_note_star
				drum_texture = ghmix_kick
				drum_star_texture = ghmix_star_kick
				perc_texture = ghmix_kick_p
				perc_star_texture = ghmix_star_kick_p
				playable_texture = white
				dims = (256.0, 64.0)
			}
		]
	else
		<gem_textures> = [
			{
				texture = ghmix_green_note
				perc_texture = ghmix_green_note_p
				star_texture = ghmix_green_star
				perc_star_texture = ghmix_green_star_p
				playable_texture = circle
				dims = (64.0, 64.0)
			}
			{
				texture = ghmix_red_note
				perc_texture = ghmix_red_note_p
				star_texture = ghmix_red_star
				perc_star_texture = ghmix_red_star_p
				playable_texture = circle
				dims = (64.0, 64.0)
			}
			{
				texture = ghmix_yellow_note
				perc_texture = ghmix_yellow_note_p
				star_texture = ghmix_yellow_star
				perc_star_texture = ghmix_yellow_star_p
				playable_texture = circle
				dims = (64.0, 64.0)
			}
			{
				texture = ghmix_blue_note
				perc_texture = ghmix_blue_note_p
				star_texture = ghmix_blue_star
				perc_star_texture = ghmix_blue_star_p
				playable_texture = circle
				dims = (64.0, 64.0)
			}
			{
				texture = ghmix_orange_note
				perc_texture = ghmix_orange_note_p
				star_texture = ghmix_orange_star
				perc_star_texture = ghmix_orange_star_p
				playable_texture = circle
				dims = (64.0, 64.0)
			}
			{
				texture = ghmix_open_note
				star_texture = ghmix_open_note_star
				drum_texture = ghmix_kick
				drum_star_texture = ghmix_star_kick
				perc_texture = ghmix_kick_p
				perc_star_texture = ghmix_star_kick_p
				playable_texture = white
				dims = (256.0, 64.0)
			}
		]
	endif
	if screenelementexists id = <notetrack_cont>
		destroyscreenelement id = <notetrack_cont>
	endif
	createscreenelement {
		type = containerelement
		parent = jam_highway_container
		id = <notetrack_cont>
		pos = <pos>
	}
	musicstudio_mainobj :musicstudioghmix_getnotequantizems note = (1.0 / 8.0)
	sustain_min = <note_quantize_ms>
	casttointeger \{sustain_min}
	musicstudio_mainobj :musicstudiohighway_init {
		jam_instrument = <jam_instrument>
		track = ($jam_tracks [<jam_instrument>].id)
		container = <notetrack_cont>
		gem_textures = <gem_textures>
		lefty = <lefty>
		small_view = <small_view>
		controller = <controller>
		gem_offset = <gem_offset>
		open_note_offset = <open_note_offset>
		open_note_scale = <open_note_scale>
		gem_scale = <gem_scale>
		sustain_min = <sustain_min>
	}
endscript

script musicstudio_ghmix_cleanup_highways 
	musicstudio_mainobj :musicstudiohighway_update \{on = false}
	getarraysize \{$jam_tracks}
	track = 0
	begin
	musicstudio_mainobj :musicstudiohighway_cleanup jam_instrument = <track>
	<track> = (<track> + 1)
	repeat <array_size>
	clearcaptureoutput
endscript

script musicstudio_update_loop_markers 
	marker_dims = (64.0, 32.0)
	marker_offset = (284.0, 0.0)
	musicstudio_mainobj :musicstudiohighway_getposfromtime time = <loop_start>
	if screenelementexists id = <loop_marker_start_checksum>
		<loop_marker_start_checksum> :se_setprops {
			texture = ghmix_now_bar_marker
			just = [center center]
			rgba = [21 168 78 255]
			pos = (<pos> + <marker_offset> + (0.0, 14.75))
			dims = <marker_dims>
			z_priority = 10
			rot_angle = 180
			hiddenlocal = false
		}
	endif
	musicstudio_mainobj :musicstudiohighway_getposfromtime time = <loop_end>
	if screenelementexists id = <loop_marker_end_checksum>
		<loop_marker_end_checksum> :se_setprops {
			texture = ghmix_now_bar_marker
			just = [center center]
			rgba = [153 36 61 255]
			pos = (<pos> + <marker_offset> - (1.75, 17.25))
			dims = <marker_dims>
			rot_angle = 0
			z_priority = 10
			hiddenlocal = false
		}
	endif
endscript

script musicstudio_update_marker 
	marker_text_offset = (-334.0, -3.0)
	line6_0_effect_text = qs(0x0dd10f11)
	line6_1_effect_text = qs(0x0dd10f11)
	if (<line6_0_effect_ab> = b)
		<line6_0_effect_text> = qs(0x26fc5cd2)
	endif
	if (<line6_1_effect_ab> = b)
		<line6_1_effect_text> = qs(0x26fc5cd2)
	endif
	formattext textname = marker_text qs(0x3e9b8608) {a = ($musicstudio_markers [<marker_name_index>].name_text)
		b = ($musicstudio_lightshows [<lightshow_index>].name_text)
		c = <line6_0_effect_text>
		d = <line6_1_effect_text>}
	if screenelementexists id = <marker_text_checksum>
		<marker_text_checksum> :se_setprops {
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (360.0, 24.0)
			pos = (<pos> + <marker_text_offset>)
			text = <marker_text>
			font = fontgrid_text_a3
			rgba = [143 100 224 255]
			scale = 1.0
			internal_scale = 1.0
			just = [left bottom]
			internal_just = [right center]
			z_priority = 18
			alpha = <alpha>
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
			hiddenlocal = false
		}
	endif
	marker_offset = (28.0, 8.0)
	if screenelementexists id = <marker_checksum>
		<marker_checksum> :se_setprops {
			texture = ghmix_now_bar_marker
			just = [left center]
			rgba = [143 100 224 255]
			pos = (<pos> + <marker_offset>)
			dims = (40.0, 20.0)
			z_priority = 0
			alpha = <alpha>
			rot_angle = -45
			hiddenlocal = false
		}
	endif
endscript

script musicstudio_update_fretbar 
	requireparams \{[
			time
		]
		all}
	musicstudio_mainobj :musicstudiohighway_getposfromtime time = <time>
	bar_pos = <pos>
	bar_offset = (-353.0, 0.0)
	bar_dims = (213.0, 2.0)
	show_fretbar = 1
	intervals = 0
	intervals_int = 0
	if NOT (<fretbar_num> = 0)
		bar_dims = (613.0, 2.0)
		text_dims = (40.0, 20.0)
		text_offset = (618.0, -2.0)
		triangle_offset = (618.0, -5.5)
		rgba = [101 102 104 255]
		formattext textname = fretbar_text qs(0x35b12509) a = (<fretbar_num> + 1)
	else
		bar_dims = (613.0, 5.0)
		text_dims = (40.0, 40.0)
		text_offset = (618.0, -2.0)
		rgba = [92 59 61 255]
		musicstudio_count_get_note_intervals note = 4 time = <time>
		formattext textname = fretbar_text qs(0x35b12509) a = (<measure_num> + 1)
		if (<song_view> = true)
			bar_dims = (613.0, 2.0)
			<text_dims> = (40.0, 20.0)
		endif
	endif
	if screenelementexists id = <fretbar_checksum>
		<fretbar_checksum> :se_setprops {
			texture = white
			just = [left center]
			rgba = <rgba>
			pos = (<bar_pos> + <bar_offset>)
			dims = <bar_dims>
			z_priority = 7
			alpha = 1.0
			scale = (1.0, 1.0)
			rot_angle = 0.0
			hiddenlocal = false
		}
	endif
	if screenelementexists id = <fretbar_text_checksum>
		<fretbar_text_checksum> :se_setprops {
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = <text_dims>
			font = fontgrid_text_a3
			text = <fretbar_text>
			just = [left center]
			rgba = <rgba>
			pos = (<bar_pos> + <bar_offset> + <text_offset>)
			scale = 1.0
			z_priority = 11
			alpha = 0.8
			just = [left center]
			internal_just = [left center]
			shadow = false
			shadow_offs = (0.0, 0.0)
			shadow_rgba = [0 0 0 255]
			hiddenlocal = false
		}
	endif
endscript

script notetracker_update_fretbar 
	musicstudio_mainobj :musicstudiohighway_getposfromtime time = <time>
	bar_pos = <pos>
	bar_offset = (50.0, 0.0)
	bar_dims = (213.0, 2.0)
	<fretbar_checksum> :se_setprops {
		texture = white
		just = [left bottom]
		rgba = [145 154 173 255]
		pos = (<bar_pos> + <bar_offset>)
		dims = <bar_dims>
		z_priority = 7
		alpha = 0.7
		scale = (1.0, 1.0)
		rot_angle = 0.0
		hiddenlocal = false
	}
	casttointeger \{time}
	<minutes> = (<time> / 60000)
	mod a = <time> b = 60000
	<seconds> = (<mod> / 1000)
	mod a = <mod> b = 1000
	formattext textname = time_text qs(0xcc868dda) a = <minutes> b = <seconds> c = <mod> integer_width = 2
	formattext textname = time_text qs(0x54c1cd57) a = <time_text> b = <mod> integer_width = 3
	<text_dims> = (100.0, 18.0)
	<text_offset> = (227.0, -2.0)
	if screenelementexists id = <fretbar_text_checksum>
		<fretbar_text_checksum> :se_setprops {
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = <text_dims>
			font = fontgrid_text_a1
			text = <time_text>
			just = [left center]
			rgba = [249 250 9 255]
			pos = (<bar_pos> + <bar_offset> + <text_offset>)
			scale = 1.0
			z_priority = 11
			alpha = 0.8
			just = [left center]
			internal_just = [left center]
			hiddenlocal = false
		}
	endif
endscript

script musicstudio_process_waveform 
	pos = (940.0, 673.0)
	dim = (220.0, -599.0)
	quads = 300
	top_trim = 20
	bottom_trim = -32
	low_bound = $jam_highway_low_bound
	high_bound = $jam_highway_high_bound
	getvectorcomponents <dim>
	casttointeger \{y}
	pos = (<pos> + (<bottom_trim> * (0.0, 1.0)))
	dim = (<dim> - (<top_trim> * (0.0, 1.0)) - (<bottom_trim> * (0.0, 1.0)))
	diff = (<high_bound> - <low_bound>)
	low_bound = (<low_bound> + (<bottom_trim> * <diff> / <y>))
	high_bound = (<high_bound> - (<top_trim> * <diff> / <y>))
	tend = (<high_bound> * 16)
	tstep = ((<high_bound> - <low_bound>) * 16 / <quads>)
	drawcaptureoutput {name = ($jam_notetracker_mp3)
		vertical = true
		pos = <pos> dim = <dim>
		z = ($ghmix_highway_show_waveform_z)
		tend = <tend>
		tstep = <tstep>
		quads = <quads>}
endscript

script ghmix_highway_debug_show_render_bounds 
	if screenelementexists \{id = debug_render_bound_high}
		destroyscreenelement \{id = debug_render_bound_high}
	endif
	createscreenelement {
		type = spriteelement
		parent = jam_highway_container
		texture = white
		dims = (200.0, 10.0)
		z_priority = 1000
		id = debug_render_bound_high
		pos = ((200.0, 0.0) + ((0.0, 1.0) * <render_high>))
		scale = 1
		tags = {debug_me}
	}
	if screenelementexists \{id = debug_render_bound_low}
		destroyscreenelement \{id = debug_render_bound_low}
	endif
	createscreenelement {
		type = spriteelement
		parent = jam_highway_container
		texture = white
		dims = (200.0, 10.0)
		z_priority = 1000
		id = debug_render_bound_low
		pos = ((200.0, 0.0) + ((0.0, 1.0) * <render_low>))
		scale = 1
		tags = {debug_me}
	}
endscript

script musicstudio_update_pattern_shade 
	requireparams \{[
			pattern_start
			pattern_end
		]
		all}
	musicstudio_mainobj :musicstudiohighway_getposfromtime time = <pattern_start>
	shade_pos = <pos>
	musicstudio_mainobj :musicstudiohighway_getposfromtime time = <pattern_end>
	if (<main_instrument> = true)
		shade_dims = ((196.0, 8.0) + (<pos> - <shade_pos>))
		shade_offset = (60.0, -4.0)
	else
		shade_dims = ((88.0, 8.0) + (<pos> - <shade_pos>))
		shade_offset = (60.0, -4.0)
		shade_pos = (<shade_pos> - (8.0, 0.0))
	endif
	getarraysize ($ghmix_pattern_categories)
	if (<category> >= <array_size> || <category> < 0)
		<category> = -1
	endif
	getarraysize ($ghmix_pattern_sub_categories)
	if (<sub_category> >= <array_size> || <sub_category> < 0)
		<sub_category> = 0
	endif
	getarraysize ($ghmix_pattern_types)
	if (<type> >= <array_size> || <type> < 0)
		<type> = 0
	endif
	if NOT (<category> = -1)
		get_pattern_rgba {
			category = <category>
			sub_category = <sub_category>
		}
		rgba = <sub_category_rgba>
	else
		rgba = [107 107 107 255]
	endif
	<pattern_shade_checksum> :se_setprops {
		texture = white
		just = [left bottom]
		rgba = <rgba>
		pos = (<shade_pos> + <shade_offset>)
		dims = <shade_dims>
		z_priority = 14
		alpha = 0.8
		scale = (1.0, 1.0)
		rot_angle = 0.0
		hiddenlocal = false
	}
	if NOT (<category> = -1)
		text_offset = (5.0, -10.0)
		get_pattern_name_text {
			category = <category>
			sub_category = <sub_category>
			type = <type>
			show_user_text = 0
		}
		if (<main_instrument> = true)
			highlight_offset = (210.0, 0.0)
			<pattern_text_checksum> :se_setprops {
				fit_width = `scale each line if larger`
				fit_height = `scale down if larger`
				dims = (184.0, 22.0)
				font = fontgrid_text_a3
				text = <pattern_name_text>
				rgba = [200 200 200 255]
				pos = (<shade_pos> + <shade_offset> + <text_offset>)
				scale = 1.0
				z_priority = 15
				alpha = 1.0
				just = [left center]
				just = [left center]
				internal_just = [left center]
				shadow = false
				shadow_offs = (0.0, 0.0)
				shadow_rgba = [0 0 0 255]
				hiddenlocal = false
			}
		endif
	endif
endscript

script musicstudio_show_nowbar 
	if screenelementexists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
				if gotparam \{song_mode}
					<ghmix_nowbar> :se_setprops {
						ghmix_pattern_bar_alpha = 0.8
						nowbar_new_alpha = 0.0
					}
				else
					<ghmix_nowbar> :se_setprops {
						ghmix_pattern_bar_alpha = 0.0
						nowbar_new_alpha = 0.8
					}
				endif
			endif
		endif
	endif
endscript

script music_studio_update_note_text 
	if musicstudio_mainobj :musicstudio_isusingstream
		return
	endif
	if screenelementexists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
				getcustomnote track = ($jam_tracks [<jam_instrument>].id) index = <sound_index>
				if (<jam_instrument> != 3)
					jam_get_sample_checksum fret = <note_fret> string = <note_string> type = 0 chord_dir = 0 chord_type = 0 jam_instrument = <jam_instrument>
				endif
				switch <jam_instrument>
					case 0
					if (<note_type> >= 2)
						curr_note_text = ($jam_note_text_string_special)
					else
						if (<note_chord_type> = 0)
							chord_type_text = ($jam_note_text_string_power)
						elseif (<note_chord_type> = 3)
							chord_type_text = ($jam_note_text_string_mute)
						else
							formattext textname = chord_type_text qs(0x0bc409e2) a = ($rhythm_chord_types [<note_chord_type>].name_text)
						endif
						formattext textname = curr_note_text qs(0x6d2acc3b) a = <note_text> b = <chord_type_text> c = <note_velocity>
					endif
					case 1
					case 2
					num_octaves = 0
					begin
					if (<note_string> > 0)
						if (<note_string> = 4)
							<note_fret> = (<note_fret> - 8)
						else
							<note_fret> = (<note_fret> - 7)
						endif
						<note_string> = (<note_string> -1)
						<note_fret> = (<note_fret> + 12)
					endif
					if (<note_string> = 0)
						break
					endif
					repeat
					curr_octave = (<note_fret> / 12)
					casttointeger \{curr_octave}
					formattext textname = curr_note_text qs(0x7cbbcefe) s = ($jam_note_text_string_octave) a = <note_text> b = (<curr_octave> + 1) c = <note_velocity>
					case 4
					formattext textname = curr_note_text qs(0x7cbbcefe) s = ($jam_note_text_string_octave) a = <note_text> b = <keyboard_octave> c = <note_velocity>
					case 3
					if <ghmix_nowbar> :desc_resolvealias name = alias_playline_drums_menu param = playline_drums_menu
						if getscreenelementchildren id = <playline_drums_menu>
							musicstudio_mainobj :musicstudio_getcurrmainplayer
							<main_player> :musicstudioplayer_getcontroller
							<main_player> :musicstudioplayer_getplayerindex
							getplayerinfo <player> lefty_flip
							note_mapping = [0 1 2 3 4]
							if isdrumcontroller controller = <controller>
								note_mapping = [4 0 1 2 3]
								if (<lefty_flip> = 1)
									note_mapping = [0 4 3 2 1]
								endif
							else
								if (<lefty_flip> = 1)
									note_mapping = [4 3 2 1 0]
								endif
							endif
							getarraysize <children>
							i = 0
							begin
							curr_note_mapping = (<note_mapping> [<i>])
							curr_velocity = (<note_drum_velocity_array> [<i>])
							<curr_velocity> = ((<curr_velocity> / 128.0) * 16.0)
							casttointeger \{curr_velocity}
							if (<curr_velocity> > 0)
								formattext textname = velocity_text qs(0x73307931) s = <curr_velocity>
							else
								<velocity_text> = qs(0x9e0cb7ef)
							endif
							(<children> [<curr_note_mapping>]) :se_setprops text = <velocity_text>
							<i> = (<i> + 1)
							repeat <array_size>
						endif
					endif
					curr_velocity = (<note_drum_velocity_array> [5])
					<curr_velocity> = ((<curr_velocity> / 128.0) * 16.0)
					casttointeger \{curr_velocity}
					if (<curr_velocity> > 0)
						formattext textname = open_velocity_text qs(0x98c83f83) s = <curr_velocity>
					else
						<open_velocity_text> = qs(0x0d32b56f)
					endif
					<ghmix_nowbar> :se_setprops playline_drums_open_text = <open_velocity_text> playline_drums_alpha = 1
					<curr_note_text> = qs(0x03ac90f0)
				endswitch
				if NOT gotparam \{no_scrub}
					if musicstudio_mainobj :musicstudioghmix_isscrubenabled
						final_note_sample = <sample_checksum>
						if (<jam_instrument> = 3)
							musicstudio_preview_closest_drum_note
						else
							musicstudio_preview_closest_note
						endif
						killspawnedscript \{name = musicstudio_stop_scrub_note}
						<ghmix_nowbar> :obj_spawnscriptnow musicstudio_stop_scrub_note params = {jam_instrument = <jam_instrument>}
					endif
				endif
				killspawnedscript \{name = fade_out_note_text}
				<ghmix_nowbar> :se_setprops playline_note_text = <curr_note_text>
				<ghmix_nowbar> :se_setprops playline_note_alpha = 1
			endif
		endif
	endif
endscript

script musicstudio_stop_scrub_note 
	musicstudio_mainobj :musicstudioghmix_getnotequantizems note = (1.0 / 2.0)
	wait (<note_quantize_ms> / 1000.0) seconds
	jam_stop_instrument_sample jam_instrument = <jam_instrument>
endscript

script musicstudio_clear_note_text 
	if NOT scriptisrunning \{fade_out_note_text}
		if screenelementexists \{id = musicstudio_ghmix}
			musicstudio_ghmix :obj_spawnscriptnow \{fade_out_note_text}
		endif
	endif
endscript

script fade_out_note_text 
	if screenelementexists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
				ms_per_beat = (60000.0 / $jam_current_bpm)
				quantize = (<ms_per_beat> / 2)
				wait (<quantize> / 1000.0) seconds
				<ghmix_nowbar> :se_setprops playline_note_alpha = 0 time = 0.25
				<ghmix_nowbar> :se_setprops playline_drums_alpha = 0 time = 0.25
			endif
		endif
	endif
endscript

script hide_note_text 
	if screenelementexists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
				<ghmix_nowbar> :se_setprops playline_note_alpha = 0
				<ghmix_nowbar> :se_setprops playline_drums_alpha = 0
			endif
		endif
	endif
endscript

script musicstudio_update_count 
	if musicstudio_mainobj :musicstudio_isusingstream
		return
	endif
	if screenelementexists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
				musicstudio_mainobj :musicstudioghmix_getnoteintervals note = 1.0 time = <time>
				casttointeger \{intervals}
				if (<intervals> < 9)
					formattext textname = measure_text qs(0x2b94e8da) s = (<intervals> + 1)
				elseif (<intervals> < 99)
					formattext textname = measure_text qs(0x56eb5479) s = (<intervals> + 1)
				else
					formattext textname = measure_text qs(0x73307931) s = (<intervals> + 1)
				endif
				<ghmix_nowbar> :setprops measure_text = <measure_text>
				musicstudio_mainobj :musicstudioghmix_getnoteintervals note = (1.0 / 4.0) time = <time>
				mod a = <intervals> b = 4
				formattext textname = beat_text qs(0x73307931) s = (<mod> + 1)
				<ghmix_nowbar> :setprops beat_text = <beat_text>
				musicstudio_count_get_note_intervals note = 48 per_note = 0.25 time = <time>
				if (<intervals> <= 9)
					formattext textname = tick_text qs(0x56eb5479) s = <intervals>
				else
					formattext textname = tick_text qs(0x73307931) s = <intervals>
				endif
				<ghmix_nowbar> :setprops tick_text = <tick_text>
			endif
		endif
	endif
endscript

script musicstudio_count_get_note_intervals \{per_note = 1.0}
	musicstudio_mainobj :musicstudioghmix_getquantizetime time = <time> snap = (<per_note> / <note>)
	musicstudio_mainobj :musicstudioghmix_getnotequantizems note = (<per_note> / <note>)
	intervals = (<quantize_time> / <note_quantize_ms>)
	intervals_int = <intervals>
	casttointeger \{intervals_int}
	dist_to_next_note = (1.0 - (<intervals> - <intervals_int>))
	if (<dist_to_next_note> < 0.5)
		<intervals> = (<intervals> + 1)
	endif
	casttointeger \{intervals}
	mod a = <intervals> b = <note>
	<intervals> = <mod>
	return intervals = <intervals>
endscript

script musicstudio_nowbar_lightup_pattern \{pattern = 1048576}
	if screenelementexists \{id = musicstudio_ghmix}
		musicstudio_mainobj :musicstudio_getcurrmainplayer
		<main_player> :musicstudioplayer_getplayerindex
		getplayerinfo <player> lefty_flip
		getplayerinfo <player> controller
		note_mapping = [0 1 2 3 4]
		colors = [
			[55 116 61 100]
			[151 68 85 100]
			[185 171 71 100]
			[68 92 131 100]
			[154 80 56 100]
		]
		if isdrumcontroller controller = <controller>
			note_mapping = [4 0 1 2 3]
			colors = [
				[151 68 85 100]
				[185 171 71 100]
				[68 92 131 100]
				[154 80 56 100]
				[55 116 61 100]
			]
		endif
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
				if <ghmix_nowbar> :desc_resolvealias name = alias_nowbar_menu param = alias_nowbar_menu
					if getscreenelementchildren id = <alias_nowbar_menu>
						getarraysize <children>
						i = 0
						check_button = 65536
						begin
						curr_note = (<note_mapping> [<i>])
						lightup_index = <curr_note>
						if (<lefty_flip> = 1)
							if NOT isdrumcontroller controller = <controller>
								<lightup_index> = ((<array_size> - 1) - <curr_note>)
							endif
						endif
						if (<pattern> && <check_button>)
							(<children> [<lightup_index>]) :se_setprops rgba = (<colors> [<curr_note>]) alpha = 1
						else
							(<children> [<lightup_index>]) :se_setprops rgba = [0 0 0 0] alpha = 1
						endif
						<check_button> = (<check_button> / 16)
						<i> = (<i> + 1)
						repeat <array_size>
					endif
					musicstudio_update_current_note_text ghmix_nowbar = <ghmix_nowbar>
				endif
			endif
		endif
	endif
endscript

script musicstudio_update_current_note_text 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	switch (<instrument>)
		case 0
		<note_func> = jam_input_rhythm_get_current_note
		case 1
		<note_func> = jam_input_lead_get_current_note
		case 2
		<note_func> = jam_input_bass_get_current_note
		case 4
		<note_func> = jam_input_melody_get_current_note
		default
		if screenelementexists id = <ghmix_nowbar>
			<ghmix_nowbar> :se_setprops current_note_text = qs(0x03ac90f0)
		endif
		return
	endswitch
	getplayerinfo \{$jam_current_recording_player
		controller}
	getheldpattern controller = <controller> player = ($jam_current_recording_player)
	<note_func> player = ($jam_current_recording_player) hold_pattern = <hold_pattern>
	if screenelementexists id = <ghmix_nowbar>
		<ghmix_nowbar> :se_setprops current_note_text = <single_note_text>
	endif
endscript

script musicstudio_show_current_note_text 
	if screenelementexists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
				<ghmix_nowbar> :se_setprops current_note_alpha = 1
			endif
		endif
	endif
endscript

script musicstudio_hide_current_note_text 
	if screenelementexists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
				<ghmix_nowbar> :se_setprops current_note_alpha = 0
			endif
		endif
	endif
endscript

script musicstudio_hide_tilt_meter 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	if screenelementexists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
				if <ghmix_nowbar> :desc_resolvealias name = alias_pitch_dial param = pitch_dial
					<pitch_dial> :se_setprops alpha = 0
				endif
				if <ghmix_nowbar> :desc_resolvealias name = alias_pitch_meter_half param = pitch_meter
					<pitch_meter> :se_setprops alpha = 0
				endif
				if <ghmix_nowbar> :desc_resolvealias name = alias_pitch_meter_quarter param = pitch_meter
					<pitch_meter> :se_setprops alpha = 0
				endif
				if <ghmix_nowbar> :desc_resolvealias name = alias_pitch_meter_glow param = pitch_meter_glow
					<pitch_meter_glow> :se_setprops alpha = 0
				endif
				if <ghmix_nowbar> :desc_resolvealias name = alias_pitch_meter_whole param = pitch_meter
					<pitch_meter> :se_setprops alpha = 0
				endif
				<ghmix_nowbar> :se_setprops pitch_meter_glow_alpha = 0
			endif
		endif
	endif
endscript

script musicstudio_update_tilt_meter 
	if musicstudio_mainobj :musicstudiohighway_issongview
		musicstudio_hide_tilt_meter
		return
	endif
	if isdrumcontroller controller = <controller>
		musicstudio_hide_tilt_meter
		return
	endif
	if (<instrument> = 5)
		return
	endif
	switch (<instrument>)
		case 0
		musicstudio_rhythm_chromatic_tilt_update player = <player> controller = <controller>
		case 1
		musicstudio_input_lead_tilt_update player = <player> controller = <controller>
		case 2
		musicstudio_input_bass_tilt_update player = <player> controller = <controller>
		case 4
		musicstudio_input_melody_tilt_update player = <player> controller = <controller>
	endswitch
	if screenelementexists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
				musicstudio_hide_tilt_meter
				chosen_scales_array = ($jam_track_scaleindex)
				chosen_scale_index = (<chosen_scales_array> [<instrument>])
				chosen_scale = ($jam_scales_new [<chosen_scale_index>])
				if structurecontains structure = <chosen_scale> chromatic
					<chromatic> = 1
				else
					<chromatic> = 0
				endif
				switch (<instrument>)
					case 0
					tilt_var = jam_tilt_rhythm
					case 1
					tilt_var = jam_tilt_lead
					case 2
					tilt_var = jam_tilt_bass
					case 4
					tilt_var = jam_tilt_melody
				endswitch
				rot_percent = 0
				if guitargetanalogueinfo controller = <controller>
					<ghmix_nowbar> :desc_resolvealias name = alias_pitch_dial param = pitch_dial
					jam_calc_line_rot player = <player> spc_v_dist = <righty>
					rot_percent = (<line_rot> / 100.0)
				endif
				<ghmix_nowbar> :desc_resolvealias name = alias_pitch_meter_glow param = pitch_meter_glow
				rot_alpha = ((<rot_percent> * 0.45000002) + 0.3)
				if (<instrument> = 3 || <instrument> = 5)
					<ghmix_nowbar> :desc_resolvealias name = alias_pitch_meter_whole param = pitch_meter
					<pitch_meter> :se_setprops alpha = 1
					musicstudio_get_rgba_fade rgba_a = [197 128 49 255] rgba_b = [226 204 92 255] percent = <rot_percent>
					<pitch_dial> :se_setprops alpha = 1.0 rot_angle = (-180 + (<rot_percent> * 180))
					<pitch_meter_glow> :se_setprops alpha = <rot_alpha> rgba = <rgba_fade>
				else
					curr_tilt = ($<tilt_var>)
					segment_off_alpha = 0.4
					if ((<instrument> != 0 && <chromatic> = 0) || (<instrument> = 0 && <chromatic> = 1))
						<ghmix_nowbar> :desc_resolvealias name = alias_pitch_meter_half param = pitch_meter
						<pitch_meter> :se_setprops alpha = 1
						if getscreenelementchildren id = <pitch_meter>
							(<children> [0]) :se_setprops alpha = <segment_off_alpha>
							(<children> [1]) :se_setprops alpha = <segment_off_alpha>
							switch (<curr_tilt>)
								case 0
								<pitch_meter_glow> :se_setprops alpha = <rot_alpha> rgba = [197 128 49 255]
								(<children> [0]) :se_setprops alpha = 1.0
								case 1
								<pitch_meter_glow> :se_setprops alpha = <rot_alpha> rgba = [221 172 55 255]
								(<children> [1]) :se_setprops alpha = 1.0
							endswitch
						endif
					elseif (<instrument> = 0)
						<ghmix_nowbar> :desc_resolvealias name = alias_pitch_meter_whole param = pitch_meter
						<pitch_meter> :se_setprops alpha = 1
						switch (<curr_tilt>)
							case 0
							<pitch_meter_glow> :se_setprops alpha = <rot_alpha> rgba = [197 128 49 255]
							case 1
							<pitch_meter_glow> :se_setprops alpha = <rot_alpha> rgba = [221 172 55 255]
						endswitch
					else
						<ghmix_nowbar> :desc_resolvealias name = alias_pitch_meter_quarter param = pitch_meter
						<pitch_meter> :se_setprops alpha = 1
						if getscreenelementchildren id = <pitch_meter>
							(<children> [0]) :se_setprops alpha = <segment_off_alpha>
							(<children> [1]) :se_setprops alpha = <segment_off_alpha>
							(<children> [2]) :se_setprops alpha = <segment_off_alpha>
							(<children> [3]) :se_setprops alpha = <segment_off_alpha>
							switch (<curr_tilt>)
								case 0
								<pitch_meter_glow> :se_setprops alpha = <rot_alpha> rgba = [197 128 49 255]
								(<children> [0]) :se_setprops alpha = 1.0
								case 1
								<pitch_meter_glow> :se_setprops alpha = <rot_alpha> rgba = [210 148 47 255]
								(<children> [1]) :se_setprops alpha = 1.0
								case 2
								<pitch_meter_glow> :se_setprops alpha = <rot_alpha> rgba = [221 172 55 255]
								(<children> [2]) :se_setprops alpha = 1.0
								case 3
								<pitch_meter_glow> :se_setprops alpha = <rot_alpha> rgba = [226 204 92 255]
								(<children> [3]) :se_setprops alpha = 1.0
							endswitch
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script musicstudio_get_rgba_fade 
	r_fade = (<rgba_a> [0] + ((<rgba_b> [0] - <rgba_a> [0]) * <percent>))
	b_fade = (<rgba_a> [1] + ((<rgba_b> [1] - <rgba_a> [1]) * <percent>))
	g_fade = (<rgba_a> [2] + ((<rgba_b> [2] - <rgba_a> [2]) * <percent>))
	a_fade = (<rgba_a> [3] + ((<rgba_b> [3] - <rgba_a> [3]) * <percent>))
	casttointeger \{r_fade}
	casttointeger \{b_fade}
	casttointeger \{g_fade}
	casttointeger \{a_fade}
	rgba_fade = [0 0 0 0]
	setarrayelement arrayname = rgba_fade index = 0 newvalue = <r_fade>
	setarrayelement arrayname = rgba_fade index = 1 newvalue = <b_fade>
	setarrayelement arrayname = rgba_fade index = 2 newvalue = <g_fade>
	setarrayelement arrayname = rgba_fade index = 3 newvalue = <a_fade>
	return rgba_fade = <rgba_fade>
endscript

script musicstudio_drum_tilt_needle_update 
	if screenelementexists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
				<ghmix_nowbar> :desc_resolvealias name = alias_pitch_dial param = pitch_dial
				<ghmix_nowbar> :desc_resolvealias name = alias_pitch_meter param = pitch_meter
				tilt_value = (60.0 * (<velocity> / 127.0))
				<pitch_dial> :se_setprops time = 0.03 rot_angle = (-24 + <tilt_value>)
			endif
		endif
	endif
endscript
musicstudio_show_nowbar_particles = 1

script musicstudio_nowbar_hit_pattern \{pattern = 1048576
		length = 500}
	if NOT screenelementexists \{id = musicstudio_ghmix}
		return
	endif
	if musicstudio_mainobj :musicstudiohighway_issongview
		return
	endif
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	<main_player> :musicstudioplayer_getplayerindex
	if (<pattern> = 1048576)
		<pattern> = 69905
	endif
	<main_player> :musicstudioplayer_getcontroller
	if NOT isdrumcontroller controller = <controller>
		colors = [
			[55 116 61 255]
			[151 68 85 255]
			[185 171 71 255]
			[68 92 131 255]
			[154 80 56 255]
		]
	else
		colors = [
			[151 68 85 255]
			[185 171 71 255]
			[68 92 131 255]
			[154 80 56 255]
			[55 116 61 255]
		]
	endif
	if NOT ($musicstudio_show_nowbar_particles = 1)
		return
	endif
	if (<instrument> = 5)
		if musicstudio_mainobj :musicstudio_isusingstream
			musicstudio_nowbar_hit_pattern_vocals <...>
			return
		endif
	endif
	getplayerinfo <player> lefty_flip
	if NOT (<instrument> = 3)
		if NOT (<lefty_flip> = 1)
			pattern_array = [65536 4096 256 16 1 1048576]
		else
			pattern_array = [1 16 256 4096 65536 1048576]
		endif
	else
		if NOT isdrumcontroller controller = <controller>
			if NOT (<lefty_flip> = 1)
				pattern_array = [1 65536 4096 256 16 1048576]
			else
				pattern_array = [16 256 4096 65536 1 1048576]
			endif
		else
			if NOT (<lefty_flip> = 1)
				pattern_array = [65536 4096 256 16 1 1048576]
			else
				pattern_array = [1 16 256 4096 65536 1048576]
			endif
		endif
	endif
	if screenelementexists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
				if <ghmix_nowbar> :desc_resolvealias name = alias_nowbar_menu param = alias_nowbar_menu
					if getscreenelementchildren id = <alias_nowbar_menu>
						getarraysize <children>
						if (<array_size> > 0)
							i = 0
							begin
							lightup_index = <i>
							if (<lefty_flip> = 1)
								if NOT isdrumcontroller controller = <controller>
									<lightup_index> = ((<array_size> - 1) - <i>)
								endif
							endif
							formattext checksumname = musicstudio_nowbar_particle 'musicstudio_nowbar_particle_%s' s = <i>
							if (<pattern> && (<pattern_array> [<i>]))
								destroy2dparticlesystem id = <musicstudio_nowbar_particle>
								create2dparticlesystem {
									id = <musicstudio_nowbar_particle>
									pos = (3.0, -8.0)
									parent = (<children> [<i>])
									z_priority = 0
									material = sys_particle_spark01_sys_particle_spark01
									start_color = (<colors> [<lightup_index>])
									end_color = (<colors> [<lightup_index>])
									start_scale = (2.25, 2.25)
									end_scale = (1.65, 1.65)
									start_angle_spread = 360.0
									min_rotation = -200.0
									max_rotation = 200.0
									emit_start_radius = 5.0
									emit_radius = 40.0
									emit_rate = 0.005
									emit_dir = 180.0
									emit_spread = 70.0
									velocity = 1
									friction = (0.2, 0.2)
									time = 0.11
								}
							else
								destroy2dparticlesystem id = <musicstudio_nowbar_particle>
							endif
							<i> = (<i> + 1)
							repeat <array_size>
							musicstudio_mainobj :musicstudioghmix_getnotequantizems note = (1.0 / 32.0)
							<length> = (<length> - <note_quantize_ms>)
							if (<length> < <note_quantize_ms>)
								<length> = <note_quantize_ms>
							endif
							wait (<length> / 1000.0) seconds
							i = 0
							begin
							formattext checksumname = musicstudio_nowbar_particle 'musicstudio_nowbar_particle_%s' s = <i>
							destroy2dparticlesystem id = <musicstudio_nowbar_particle> kill_when_empty
							<i> = (<i> + 1)
							repeat <array_size>
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script musicstudio_nowbar_particles_destroy 
	killspawnedscript \{name = musicstudio_nowbar_hit_pattern}
	if screenelementexists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
				if <ghmix_nowbar> :desc_resolvealias name = alias_nowbar_menu param = alias_nowbar_menu
					if getscreenelementchildren id = <alias_nowbar_menu>
						getarraysize <children>
						i = 0
						begin
						formattext checksumname = musicstudio_nowbar_particle 'musicstudio_nowbar_particle_%s' s = <i>
						destroy2dparticlesystem id = <musicstudio_nowbar_particle> kill_when_empty
						<i> = (<i> + 1)
						repeat <array_size>
					endif
				endif
			endif
		endif
	endif
endscript

script musicstudio_nowbar_hit_pattern_vocals \{pattern = 1048576
		length = 500}
	printf \{qs(0x56ec0fa2)}
	if NOT ($musicstudio_show_nowbar_particles = 1)
		return
	endif
	getcustomnote track = ($jam_tracks [<instrument>].id) index = <index>
	if (<vocal_skip> = 1)
		return
	elseif (<vocal_spoken> = 1)
		color = ($notetracker_vocal_spoken_color)
	else
		color = ($notetracker_vocal_colors [<vocal_octave>])
	endif
	if screenelementexists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
				if <ghmix_nowbar> :desc_resolvealias name = alias_nowbar_menu param = alias_nowbar_menu
					if getscreenelementchildren id = <alias_nowbar_menu>
						formattext \{checksumname = musicstudio_nowbar_particle
							'musicstudio_nowbar_particle_%s'
							s = 0}
						destroy2dparticlesystem id = <musicstudio_nowbar_particle>
						pos = ((-35.0, -8.0) + ((13.0, 0.0) * <vocal_pitch>))
						create2dparticlesystem {
							id = <musicstudio_nowbar_particle>
							pos = <pos>
							parent = (<children> [0])
							z_priority = 0
							material = sys_particle_spark01_sys_particle_spark01
							start_color = <color>
							end_color = <color>
							start_scale = (5.0, 5.0)
							end_scale = (3.5, 3.5)
							start_angle_spread = 360.0
							min_rotation = -200.0
							max_rotation = 200.0
							emit_start_radius = 5.0
							emit_radius = 40.0
							emit_rate = 0.005
							emit_dir = 180.0
							emit_spread = 70.0
							velocity = 1
							friction = (0.2, 0.2)
							time = 0.11
						}
						note_quantize_ms = ($notetracker_vocal_quantize)
						<length> = (<length> - <note_quantize_ms>)
						if (<length> < <note_quantize_ms>)
							<length> = <note_quantize_ms>
						endif
						wait (<length> / 1000.0) seconds
						formattext \{checksumname = musicstudio_nowbar_particle
							'musicstudio_nowbar_particle_%s'
							s = 0}
						destroy2dparticlesystem id = <musicstudio_nowbar_particle> kill_when_empty
					endif
				endif
			endif
		endif
	endif
endscript

script musicstudio_hide_nowbar_extended 
	if screenelementexists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_nowbar param = ghmix_nowbar
				<ghmix_nowbar> :se_setprops extended_nowbar_alpha = 0.0
			endif
		endif
	endif
endscript

script musicstudio_highway_blackout \{blackout = [
			0
			0
			0
			0
			0
		]
		alpha = 0.8}
	fade_time = 0.2
	if gotparam \{no_fade}
		<fade_time> = 0.0
	endif
	if screenelementexists \{id = musicstudio_ghmix}
		if musicstudio_ghmix :desc_resolvealias \{name = alias_ghmix_highway
				param = alias_ghmix_highway}
			if <alias_ghmix_highway> :desc_resolvealias name = ghmix_highway_blackout param = ghmix_highway_blackout
				if gotparam \{remove}
					<ghmix_highway_blackout> :se_setprops alpha = 0 time = <fade_time>
				else
					if getscreenelementchildren id = <ghmix_highway_blackout>
						getarraysize <children>
						i = 0
						begin
						if (<blackout> [<i>] = 1)
							(<children> [<i>]) :se_setprops alpha = <alpha>
						else
							(<children> [<i>]) :se_setprops alpha = 0
						endif
						<i> = (<i> + 1)
						repeat <array_size>
					endif
					<ghmix_highway_blackout> :se_setprops alpha = 1 time = <fade_time>
				endif
			endif
		endif
	endif
endscript

script musicstudio_ghmix_highway_reinit_all 
	musicstudio_mainobj :musicstudio_getcurrmainplayer
	<main_player> :musicstudioplayer_getinstrument
	<main_player> :musicstudioplayer_getplayerindex
	getplayerinfo <player> lefty_flip
	getarraysize \{$jam_tracks}
	track = 0
	begin
	musicstudio_mainobj :musicstudiohighway_reinit free_all = true lefty = <lefty_flip> jam_instrument = <track>
	<track> = (<track> + 1)
	repeat <array_size>
endscript
