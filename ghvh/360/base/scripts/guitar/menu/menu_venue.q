g_max_venues = 0
g_venue_index = 0
g_venue_pos_add = (0.0, 720.0)
g_venue_current_pos = (0.0, 0.0)
g_venue_poster_space = 360
g_last_venue_selected = load_z_s_stage

script create_select_venue_menu \{Player = 1}
	frontend_load_soundcheck
	Change \{g_last_venue_selected = $current_level}
	disable_pause
	UnPauseGame
	if ($progression_play_completion_movie = 1)
		get_progression_globals game_mode = ($game_mode)
		formatText checksumName = tiername 'tier%i' i = ($progression_completion_tier)
		if StructureContains structure = ($<tier_global>.<tiername>) completion_movie
			menu_music_off
			PlayMovieAndWait movie = ($<tier_global>.<tiername>.completion_movie)
			get_movie_id_by_name movie = ($<tier_global>.<tiername>.completion_movie)
			SetGlobalTags <id> params = {unlocked = 1}
		endif
		Change \{progression_play_completion_movie = 0}
	endif
	Change \{g_venue_current_pos = (0.0, 0.0)}
	SpawnScriptNow \{menu_music_on}
	if (($player1_status.bot_play = 1) || ($is_network_game))
		exclusive_device = ($primary_controller)
	else
		RemoveParameter \{exclusive_device}
		get_all_exclusive_devices
	endif
	CreateScreenElement \{Type = ContainerElement
		id = venue_container
		parent = root_window
		Pos = (0.0, 0.0)}
	displaySprite \{id = menu_venue_overlay
		parent = root_window
		tex = menu_venue_overlay
		Pos = (0.0, 0.0)
		z = 30
		dims = (1280.0, 720.0)}
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
	formatText checksumName = Tier 'tier%i' i = <tier_num>
	if StructureContains structure = (<tier_global>.<Tier>) unlocked_levels
		my_level = (<tier_global>.<Tier>.unlocked_levels [<level_count>])
		GetArraySize (<tier_global>.<Tier>.unlocked_levels)
		level_count = (<level_count> + 1)
		if (<level_count> >= <array_Size>)
			level_count = 0
			<tier_num> = (<tier_num> + 1)
		endif
	else
		my_level = (<tier_global>.<Tier>.level)
		level_count = 0
		<tier_num> = (<tier_num> + 1)
		if StructureContains structure = ($LevelZones.<my_level>) debug_only
			available = 0
		endif
		if ($game_mode = p1_career || $game_mode = p2_career)
			get_current_band_checksum
			final_checksum = <band_checksum>
			ExtendCrc <final_checksum> ($LevelZones.<my_level>.Name) out = final_checksum
			unlocked = 1
			GetGlobalTags <final_checksum> noassert = 1
			if (<unlocked> = 0)
				<available> = 0
			endif
		else
			formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<my_level>.Name)
			unlocked = 1
			GetGlobalTags <venue_checksum> noassert = 1
			if (<unlocked> = 0)
				<available> = 0
			endif
		endif
		if ($is_network_game = 1)
			<available> = 1
		endif
	endif
	if (<available> = 1)
		RemoveParameter \{exclusive_device}
		get_all_exclusive_devices
		formatText checksumName = venue_id 'venue_%d' d = <poster_index>
		CreateScreenElement {
			Type = TextElement
			parent = venue_container
			id = <venue_id>
			font = fontgrid_text_a3
			event_handlers = [
				{focus venue_focus params = {level_checksum = <my_level>}}
				{unfocus retail_menu_unfocus}
				{pad_up venue_scroll_up}
				{pad_down venue_scroll_down}
				{pad_back venue_go_back params = {Player = <Player>}}
				{pad_choose select_venue_choose_venue params = {level_checksum = <my_level> Player = <Player>}}
			]
			exclusive_device = <exclusive_device>
		}
		new_poster_pos = ((640.0, 360.0) - (($g_venue_poster_space + <poster_dist>) * <poster_index>) * (0.0, 1.0))
		displaySprite parent = venue_container Pos = <new_poster_pos> tex = ($LevelZones.<my_level>.bg) z = 20 dims = (720.0, 720.0) just = [center center]
		GetUpperCaseString ($LevelZones.<my_level>.title)
		<poster_index> = (<poster_index> + 1)
	endif
	repeat
	GetArraySize \{$LevelZoneArray}
	old_size = (<array_Size>)
	get_LevelZoneArray_size
	if (<array_Size> > <old_size>)
		venue_index = (<array_Size> - 1)
		begin
		get_LevelZoneArray_checksum index = <venue_index>
		available = 1
		if Is_LevelZone_Downloaded level_checksum = <level_checksum>
			if (<download> = 1 &&
					$is_network_game = 1)
				available = 0
			endif
		else
			available = 0
		endif
		if StructureContains structure = ($LevelZones.<level_checksum>.Name) debug_only
			available = 0
		endif
		if (<available> = 1)
			formatText checksumName = venue_id 'venue_%d' d = <poster_index>
			CreateScreenElement {
				Type = TextElement
				parent = venue_container
				id = <venue_id>
				font = fontgrid_text_a3
				event_handlers = [
					{focus venue_focus params = {level_checksum = <level_checksum>}}
					{unfocus retail_menu_unfocus}
					{pad_back venue_go_back params = {Player = <Player>}}
					{pad_choose select_venue_choose_venue params = {level_checksum = <level_checksum> Player = <Player>}}
				]
				exclusive_device = <exclusive_device>
			}
			new_poster_pos = ((640.0, 360.0) - (($g_venue_poster_space + <poster_dist>) * <poster_index>) * (0.0, 1.0))
			displaySprite parent = venue_container Pos = <new_poster_pos> tex = ($LevelZones.<level_checksum>.bg) z = 20 dims = (720.0, 720.0) just = [center center]
			GetUpperCaseString ($LevelZones.<level_checksum>.title)
			displaySprite parent = venue_container tex = white Pos = (<new_poster_pos> + (0.0, -100.0)) just = [center center] Scale = (90.0, 15.0) z = 21
			displayText {
				parent = venue_container
				text = <UppercaseString>
				z = 22
				just = [center center]
				rgba = [88 1 17 255]
				font = fontgrid_title_a1
				noshadow
			}
			fit_text_in_rectangle id = <id> dims = (360.0, 70.0) Pos = (<new_poster_pos> + (0.0, -95.0))
			<poster_index> = (<poster_index> + 1)
		endif
		<venue_index> = (<venue_index> + 1)
		repeat (<array_Size> - <old_size>)
	endif
	Change g_max_venues = <poster_index>
	Change \{disable_menu_sounds = 1}
	formatText \{checksumName = venue_id
		'venue_%d'
		d = 0}
	LaunchEvent Type = focus target = <venue_id>
	tier_num = 1
	begin
	formatText checksumName = Tier 'tier%i' i = <tier_num>
	my_level = (<tier_global>.<Tier>.level)
	if (<my_level> = $g_last_venue_selected)
		break
	endif
	venue_scroll_up \{morph = 0}
	<tier_num> = (<tier_num> + 1)
	repeat <number_of_tiers>
	Change \{disable_menu_sounds = 0}
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	SetMenuAutoRepeatTimes \{(0.3, 0.3)}
endscript

script destroy_select_venue_menu 
	destroy_menu \{menu_id = menu_venue_overlay}
	clean_up_user_control_helpers
	destroy_menu \{menu_id = venue_container}
	Change \{g_venue_index = 0}
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
endscript

script venue_go_back 
	Change \{current_level = $g_last_venue_selected}
	if ($is_network_game)
		ui_flow_manager_respond_to_action \{action = go_back}
	else
		generic_event_back
	endif
endscript

script venue_focus 
	Change current_level = <level_checksum>
	retail_menu_focus
endscript

script venue_scroll_down \{time = 0.25
		morph = 1}
	if ($g_venue_index - 1 < 0)
		return
	endif
	Change g_venue_index = ($g_venue_index - 1)
	formatText \{checksumName = venue_id
		'venue_%d'
		d = $g_venue_index}
	LaunchEvent Type = focus target = <venue_id>
	generic_menu_up_or_down_sound \{up}
	if ScreenElementExists \{id = venue_container}
		Change g_venue_current_pos = ($g_venue_current_pos - $g_venue_pos_add - ($g_venue_poster_space * (0.0, 1.0)))
		if (<morph> = 1)
			venue_container :legacydomorph Pos = $g_venue_current_pos time = <time>
		else
			venue_container :se_setprops \{Pos = $g_venue_current_pos}
		endif
	endif
endscript

script venue_scroll_up \{time = 0.25
		morph = 1}
	if ($g_venue_index + 1 >= $g_max_venues)
		return
	endif
	Change g_venue_index = ($g_venue_index + 1)
	formatText \{checksumName = venue_id
		'venue_%d'
		d = $g_venue_index}
	LaunchEvent Type = focus target = <venue_id>
	generic_menu_up_or_down_sound \{down}
	if ScreenElementExists \{id = venue_container}
		Change g_venue_current_pos = ($g_venue_current_pos + $g_venue_pos_add + ($g_venue_poster_space * (0.0, 1.0)))
		if (<morph> = 1)
			venue_container :legacydomorph Pos = $g_venue_current_pos time = <time>
		else
			venue_container :se_setprops \{Pos = $g_venue_current_pos}
		endif
	endif
endscript

script select_venue_choose_venue 
	Change \{g_last_venue_selected = $current_level}
	if ($is_network_game)
		ui_flow_manager_respond_to_action \{action = continue}
	else
		if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $game_mode = p2_quickplay)
			generic_event_choose \{state = uistate_setlist}
		else
			generic_event_choose \{state = uistate_gig_posters}
		endif
	endif
endscript
