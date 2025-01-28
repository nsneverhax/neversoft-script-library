g_max_venues = 0
g_venue_index = 0
g_venue_pos_add = (0.0, 720.0)
g_venue_current_pos = (0.0, 0.0)
g_venue_poster_space = 360
g_last_venue_selected = none

script create_select_venue_menu \{player = 1}
	change \{g_last_venue_selected = $current_level}
	kill_start_key_binding
	unpausegame
	if ($game_mode = p1_career ||
			$game_mode = p2_career)
		formattext checksumname = bandname_id 'band%i_info_%g' i = ($current_band) g = ($game_mode_names.$game_mode)
		getglobaltags <bandname_id> param = first_venue_movie_played
		if (<first_venue_movie_played> = 0)
			get_progression_globals game_mode = ($game_mode)
			if structurecontains structure = ($<tier_global>) initial_movie
				menu_music_off
				playmovieandwait movie = ($<tier_global>.initial_movie)
				get_movie_id_by_name movie = ($<tier_global>.initial_movie)
				setglobaltags <id> params = {unlocked = 1}
			endif
			setglobaltags <bandname_id> params = {first_venue_movie_played = 1}
		endif
	endif
	if ($progression_play_completion_movie = 1)
		get_progression_globals game_mode = ($game_mode)
		formattext checksumname = tiername 'tier%i' i = ($progression_completion_tier)
		if structurecontains structure = ($<tier_global>.<tiername>) completion_movie
			menu_music_off
			playmovieandwait movie = ($<tier_global>.<tiername>.completion_movie)
			get_movie_id_by_name movie = ($<tier_global>.<tiername>.completion_movie)
			setglobaltags <id> params = {unlocked = 1}
		endif
		change \{progression_play_completion_movie = 0}
	endif
	change \{g_venue_current_pos = (0.0, 0.0)}
	spawnscriptnow \{menu_music_on}
	if (($player1_status.bot_play = 1) || ($is_network_game))
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_career ||
				$game_mode = p2_faceoff ||
				$game_mode = p2_pro_faceoff ||
				$game_mode = p2_battle)
			exclusive_mp_controllers = [0 , 0]
			setarrayelement arrayname = exclusive_mp_controllers index = 0 newvalue = ($player1_device)
			setarrayelement arrayname = exclusive_mp_controllers index = 1 newvalue = ($player2_device)
			exclusive_device = <exclusive_mp_controllers>
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	createscreenelement \{type = containerelement
		id = venue_container
		parent = root_window
		pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = venue_bg}
	get_progression_globals \{game_mode = $game_mode}
	number_of_tiers = (<tier_global>.num_tiers)
	level_count = 0
	tier_num = 1
	poster_index = 0
	poster_dist = 720
	bg_pos = (0.0, 0.0)
	begin
	available = 1
	if (<tier_num> > <number_of_tiers>)
		break
	endif
	formattext checksumname = tier 'tier%i' i = <tier_num>
	if structurecontains structure = (<tier_global>.<tier>) unlocked_levels
		my_level = (<tier_global>.<tier>.unlocked_levels [<level_count>])
		getarraysize (<tier_global>.<tier>.unlocked_levels)
		level_count = (<level_count> + 1)
		if (<level_count> >= <array_size>)
			level_count = 0
			<tier_num> = (<tier_num> + 1)
		endif
	else
		my_level = (<tier_global>.<tier>.level)
		level_count = 0
		<tier_num> = (<tier_num> + 1)
		if structurecontains structure = ($levelzones.<my_level>) debug_only
			available = 0
		endif
		if ($game_mode = p1_career || $game_mode = p2_career)
			get_current_band_checksum
			final_checksum = <band_checksum>
			extendcrc <final_checksum> ($levelzones.<my_level>.name) out = final_checksum
			unlocked = 1
			getglobaltags <final_checksum> noassert = 1
			if (<unlocked> = 0)
				<available> = 0
			endif
		else
			formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<my_level>.name)
			unlocked = 1
			getglobaltags <venue_checksum> noassert = 1
			if (<unlocked> = 0)
				<available> = 0
			endif
		endif
		if ($is_network_game = 1)
			<available> = 1
		endif
	endif
	if (<available> = 1)
		formattext checksumname = venue_id 'venue_%d' d = <poster_index>
		createscreenelement {
			type = textelement
			parent = venue_container
			id = <venue_id>
			font = text_a1
			event_handlers = [
				{focus venue_focus params = {level_checksum = <my_level>}}
				{unfocus retail_menu_unfocus}
				{pad_up venue_scroll_up}
				{pad_down venue_scroll_down}
				{pad_back venue_go_back params = {player = <player>}}
				{pad_choose select_venue_choose_venue params = {level_checksum = <my_level> player = <player>}}
			]
			exclusive_device = <exclusive_device>
		}
		new_poster_pos = ((640.0, 350.0) - (($g_venue_poster_space + <poster_dist>) * <poster_index>) * (0.0, 1.0))
		displaysprite parent = venue_container pos = <new_poster_pos> tex = ($levelzones.<my_level>.bg) z = 20 dims = (529.0, 703.0) just = [center center]
		getuppercasestring ($levelzones.<my_level>.title)
		<poster_index> = (<poster_index> + 1)
	endif
	repeat
	getarraysize \{$levelzonearray}
	old_size = (<array_size>)
	get_levelzonearray_size
	if (<array_size> > <old_size>)
		venue_index = (<array_size> - 1)
		begin
		get_levelzonearray_checksum index = <venue_index>
		available = 1
		if is_levelzone_downloaded level_checksum = <level_checksum>
			if (<download> = 1 &&
					$is_network_game = 1)
				available = 0
			endif
		else
			available = 0
		endif
		if structurecontains structure = ($levelzones.<level_checksum>.name) debug_only
			available = 0
		endif
		if (<available> = 1)
			formattext checksumname = venue_id 'venue_%d' d = <poster_index>
			createscreenelement {
				type = textelement
				parent = venue_container
				id = <venue_id>
				font = text_a1
				event_handlers = [
					{focus venue_focus params = {level_checksum = <level_checksum>}}
					{unfocus retail_menu_unfocus}
					{pad_back venue_go_back params = {player = <player>}}
					{pad_choose select_venue_choose_venue params = {level_checksum = <level_checksum> player = <player>}}
				]
				exclusive_device = <exclusive_device>
			}
			new_poster_pos = ((640.0, 360.0) - (($g_venue_poster_space + <poster_dist>) * <poster_index>) * (0.0, 1.0))
			displaysprite parent = venue_container pos = <new_poster_pos> tex = ($levelzones.<level_checksum>.bg) z = 20 dims = (720.0, 720.0) just = [center center]
			getuppercasestring ($levelzones.<level_checksum>.title)
			displaysprite parent = venue_container tex = white pos = (<new_poster_pos> + (0.0, -100.0)) just = [center center] scale = (90.0, 15.0) z = 21
			displaytext {
				parent = venue_container
				text = <uppercasestring>
				z = 22
				just = [center center]
				scale = 1.333
				rgba = [88 1 17 255]
				font = fontgrid_title_gh3
				noshadow
			}
			fit_text_in_rectangle id = <id> dims = (360.0, 70.0) pos = (<new_poster_pos> + (0.0, -95.0))
			<poster_index> = (<poster_index> + 1)
		endif
		<venue_index> = (<venue_index> + 1)
		repeat (<array_size> - <old_size>)
	endif
	change g_max_venues = <poster_index>
	change \{disable_menu_sounds = 1}
	formattext \{checksumname = venue_id
		'venue_%d'
		d = 0}
	launchevent type = focus target = <venue_id>
	tier_num = 1
	begin
	formattext checksumname = tier 'tier%i' i = <tier_num>
	my_level = (<tier_global>.<tier>.level)
	if (<my_level> = $g_last_venue_selected)
		break
	endif
	venue_scroll_up \{morph = 0}
	<tier_num> = (<tier_num> + 1)
	repeat <number_of_tiers>
	change \{disable_menu_sounds = 0}
	add_user_control_helper \{text = 'SELECT'
		button = green
		z = 100}
	add_user_control_helper \{text = 'BACK'
		button = red
		z = 100}
	add_user_control_helper \{text = 'UP/DOWN'
		button = strumbar
		z = 100}
	setmenuautorepeattimes \{(0.3, 0.3)}
endscript

script destroy_select_venue_menu 
	destroy_menu \{menu_id = venue_overlay}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = venue_container}
	destroy_menu_backdrop
	change \{g_venue_index = 0}
	setmenuautorepeattimes \{(0.3, 0.05)}
endscript

script venue_go_back 
	change \{current_level = $g_last_venue_selected}
	ui_flow_manager_respond_to_action action = go_back create_params = {player = <player>}
endscript

script venue_focus 
	change current_level = <level_checksum>
	retail_menu_focus
endscript

script venue_scroll_down \{time = 0.25
		morph = 1}
	if ($g_venue_index - 1 < 0)
		return
	endif
	change g_venue_index = ($g_venue_index - 1)
	formattext \{checksumname = venue_id
		'venue_%d'
		d = $g_venue_index}
	launchevent type = focus target = <venue_id>
	generic_menu_up_or_down_sound \{up}
	if screenelementexists \{id = venue_container}
		change g_venue_current_pos = ($g_venue_current_pos - $g_venue_pos_add - ($g_venue_poster_space * (0.0, 1.0)))
		if (<morph> = 1)
			venue_container :domorph pos = $g_venue_current_pos time = <time>
		else
			venue_container :setprops \{pos = $g_venue_current_pos}
		endif
	endif
endscript

script venue_scroll_up \{time = 0.25
		morph = 1}
	if ($g_venue_index + 1 >= $g_max_venues)
		return
	endif
	change g_venue_index = ($g_venue_index + 1)
	formattext \{checksumname = venue_id
		'venue_%d'
		d = $g_venue_index}
	launchevent type = focus target = <venue_id>
	generic_menu_up_or_down_sound \{down}
	if screenelementexists \{id = venue_container}
		change g_venue_current_pos = ($g_venue_current_pos + $g_venue_pos_add + ($g_venue_poster_space * (0.0, 1.0)))
		if (<morph> = 1)
			venue_container :domorph pos = $g_venue_current_pos time = <time>
		else
			venue_container :setprops \{pos = $g_venue_current_pos}
		endif
	endif
endscript

script select_venue_choose_venue 
	change \{g_last_venue_selected = $current_level}
	ui_flow_manager_respond_to_action action = continue create_params = {player = <player>}
endscript
