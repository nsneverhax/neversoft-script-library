ui_select_venue_screenshots = {
	load_z_amazon = venue_amazon
	load_z_canyon = venue_canyon
	load_z_icecap = venue_icecap
	load_z_london = venue_london
	load_z_sphinx = venue_sphinx
	load_z_greatwall = venue_greatwall
	load_z_atlantis = venue_atlantis
	load_z_quebec = venue_quebec
}

script ui_create_select_venue 
	SpawnScriptNow \{turnpreviewsdown_venuemenu}
	get_progression_globals ($current_progression_flag)
	if StructureContains structure = ($permanent_songlist_props.<song>) in_the_round
		if (($permanent_songlist_props.<song>.in_the_round) = 1)
			round_only = 1
		endif
	endif
	array = []
	GetArraySize \{$levelcareerarray}
	level_zone_array_size = <array_Size>
	index = 0
	begin
	get_levelcareerarray_checksum index = <index>
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		formatText {
			checksumName = venue_checksum
			'%s_%i'
			s = ($LevelZones.<level_checksum>.Name)
			i = ($instrument_list.($<tier_global>.part).text_nl)
			AddToStringLookup = true
		}
		GetGlobalTags <venue_checksum> param = unlocked
		printf 'venue_checksum = %v .. unlocked = %u' v = <venue_checksum> u = <unlocked>
		add_venue = 0
		if (<unlocked> = 1)
			add_venue = 1
		endif
		if (<add_venue> = 1)
			AddArrayElement array = <array> element = <level_checksum>
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	GetArraySize <array>
	index = 0
	i = 0
	begin
	if (<level> = <array> [<i>])
		index = <i>
	endif
	i = (<i> + 1)
	repeat <array_Size>
	CreateScreenElement {
		Type = descinterface
		parent = root_window
		id = current_menu_anchor
		desc = 'venue_selection'
		exclusive_device = ($primary_controller)
		tags = {
			index = <index>
			level_array = <array>
			array_Size = <array_Size>
			tier_num = <tier_num>
		}
	}
	AssignAlias \{id = current_menu_anchor
		alias = current_menu}
	current_menu :se_setprops {
		event_handlers = [
			{pad_back generic_event_back}
			{pad_up choose_venue_menu_up_or_down_sound params = {up}}
			{pad_down choose_venue_menu_up_or_down_sound params = {down}}
			{pad_up ui_select_venue_scroll params = {up}}
			{pad_down ui_select_venue_scroll params = {down}}
			{pad_choose ui_select_venue_choose params = {song = <song>}}
		]
		venue_name_text = ($LevelZones.(<array> [<index>]).title)
		venue_information_text = ($LevelZones.(<array> [<index>]).text)
	}
	if StructureContains structure = ($ui_select_venue_screenshots) (<array> [<index>])
		current_menu :se_setprops venue_screenshot_texture = ($ui_select_venue_screenshots.(<array> [<index>]))
	else
		current_menu :se_setprops \{venue_screenshot_texture = black}
	endif
	current_menu :obj_spawnscript \{bg_swap}
	menu_finish
endscript
choose_venue_props_loading_sound_flag = 0

script choose_venue_menu_up_or_down_sound 
	printf \{channel = sfx
		qs(0x0bc409e2)
		a = $choose_venue_props_loading_sound_flag}
	if NOT ($choose_venue_props_loading_sound_flag = 1)
		if ($disable_menu_sounds = 0)
			if GotParam \{down}
				SoundEvent \{event = ui_sfx_scroll_down}
			else
				SoundEvent \{event = ui_sfx_scroll_up}
			endif
		endif
	endif
endscript

script ui_destroy_select_venue 
	generic_ui_destroy
	fadetoblack \{OFF
		time = 0
		no_wait}
endscript

script ui_select_venue_scroll 
	Change \{choose_venue_props_loading_sound_flag = 1}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	if GotParam \{down}
		index = (<index> + 1)
		if (<index> >= <array_Size>)
			index = 0
		endif
	else
		index = (<index> - 1)
		if (<index> < 0)
			index = (<array_Size> - 1)
		endif
	endif
	SetTags index = <index>
	se_setprops venue_name_text = ($LevelZones.(<level_array> [<index>]).title) venue_information_text = ($LevelZones.(<level_array> [<index>]).text)
	if StructureContains structure = ($ui_select_venue_screenshots) (<level_array> [<index>])
		se_setprops venue_screenshot_texture = ($ui_select_venue_screenshots.(<level_array> [<index>]))
	else
		se_setprops \{venue_screenshot_texture = black}
	endif
	if GotParam \{down}
		se_setprops \{arrow_down_scale = 1.5
			time = 0.1}
	else
		se_setprops \{arrow_up_scale = 1.5
			time = 0.1}
	endif
	se_waitprops
	se_setprops \{arrow_down_scale = 1.0
		arrow_up_scale = 1.0
		time = 0.1}
	Change \{choose_venue_props_loading_sound_flag = 0}
endscript

script ui_select_venue_choose 
	GetTags
	venue_select_play_song <...> selected_level = (<level_array> [<index>])
endscript

script venue_select_play_song 
	printscriptinfo \{qs(0xfcf32067)}
	SoundEvent \{event = song_affirmation}
	Change current_song = <song>
	Change current_gig_number = <tier_num>
	part = Band
	if (($current_num_players = 1) && ($is_network_game = 0))
		getplayerinfo \{1
			part}
	endif
	ui_gig_posters_check_movies_played part = <part>
	if (<selected_level> = load_z_icecap)
		if (<movies_played> = 1)
			if ScreenElementExists \{id = current_menu}
				current_menu :se_setprops \{block_events}
			endif
			SpawnScriptNow \{black_overlay_on_spawned}
			ui_gig_posters_play_movie \{movie = 'GHGH_Movie1'}
			ui_gig_posters_set_movies_played part = <part> value = 2
		endif
	elseif (<selected_level> = load_z_london)
		if (<movies_played> = 2)
			if ScreenElementExists \{id = current_menu}
				current_menu :se_setprops \{block_events}
			endif
			SpawnScriptNow \{black_overlay_on_spawned}
			ui_gig_posters_play_movie \{movie = 'GHGH_Movie2'}
			ui_gig_posters_set_movies_played part = <part> value = 3
		endif
	elseif (<selected_level> = load_z_greatwall)
		if (<movies_played> = 3)
			if ScreenElementExists \{id = current_menu}
				current_menu :se_setprops \{block_events}
			endif
			SpawnScriptNow \{black_overlay_on_spawned}
			ui_gig_posters_play_movie \{movie = 'GHGH_Movie3'}
			ui_gig_posters_set_movies_played part = <part> value = 4
		endif
	elseif (<selected_level> = load_z_atlantis)
		if (<movies_played> = 4)
			if ScreenElementExists \{id = current_menu}
				current_menu :se_setprops \{block_events}
			endif
			SpawnScriptNow \{black_overlay_on_spawned}
			ui_gig_posters_play_movie \{movie = 'GHGH_Movie4'}
			ui_gig_posters_set_movies_played part = <part> value = 5
		endif
	elseif (<selected_level> = load_z_quebec)
		if (<movies_played> = 5)
			if ScreenElementExists \{id = current_menu}
				current_menu :se_setprops \{block_events}
			endif
			SpawnScriptNow \{black_overlay_on_spawned}
			ui_gig_posters_play_movie \{movie = 'GHGH_Movie_Outro'}
			ui_gig_posters_set_movies_played part = <part> value = 6
		endif
	endif
	generic_event_replace no_sound state = uistate_play_song data = {<...>}
	SpawnScriptLater \{black_overlay_off_spawned}
endscript
