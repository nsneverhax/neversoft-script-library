setlist_random_images_scroll_num = 0
setlist_random_images_highest_num = 0
setlist_random_bg_images = [
	{
		texture = setlist_shoeprint
		flippable
		shoeprint
	}
	{
		texture = setlist_gum
		flippable
		dims = (128.0, 128.0)
		loffset = (20.0, 0.0)
		roffset = (160.0, 0.0)
	}
	{
		texture = setlist_coin
		flippable
		dims = (96.0, 96.0)
		loffset = (70.0, 0.0)
		roffset = (115.0, 0.0)
	}
	{
		texture = setlist_wrigleys_gum
		dims = (400.0, 400.0)
		minrot = -50
		loffset = (-180.0, 0.0)
		only_left
		low_z
	}
	{
		texture = setlist_ernieball
		dims = (384.0, 384.0)
		only_right
		roffset = (-30.0, 0.0)
		low_z
	}
	{
		texture = setlist_button_gunsnroses
		dims = (256.0, 256.0)
		loffset = (-50.0, 0.0)
		roffset = (50.0, 0.0)
	}
]
setlist_solid_lines = [
	setlist_page1_line_solid1
	setlist_page1_line_solid2
	setlist_page1_line_solid3
]
setlist_dotted_lines = [
	setlist_page1_line_dotted1
	setlist_page1_line_dotted2
	setlist_page1_line_dotted3
]
setlist_loop_stars = [
	setlist_page1_loop_star1
	setlist_page1_loop_star2
	setlist_page1_loop_star3
]
setlist_event_handlers = [
	{
		pad_up
		setlist_scroll
		params = {
			dir = up
		}
	}
	{
		pad_down
		setlist_scroll
		params = {
			dir = down
		}
	}
	{
		pad_back
		setlist_go_back
	}
	{
		pad_option2
		change_tab
		params = {
			tab = tab_setlist
			button = 1
		}
	}
	{
		pad_option
		change_tab
		params = {
			tab = tab_bonus
			button = 1
		}
	}
	{
		pad_start
		menu_show_gamercard
	}
]
setlist_line_index = 0
setlist_line_max = 26
setlist_menu_pos = (340.0, 440.0)
setlist_begin_text = (0.0, 0.0)
setlist_background_pos = (0.0, 0.0)
setlist_background_loop_pos = (0.0, 676.0)
setlist_background_loop_num = 0
setlist_page1_loop_pos = (160.0, 768.0)
setlist_page1_num = 0
setlist_selection_index = 0
setlist_selection_tier = 1
setlist_selection_song = 0
setlist_selection_found = 0
setlist_num_songs = 0
setlist_previous_tier = 1
setlist_previous_song = 0
setlist_previous_tab = tab_setlist
setlist_clip_last_rot = 0
setlist_clip_rot_neg = 0
setlist_solid_line_pos = (0.0, 0.0)
setlist_dotted_line_pos = (0.0, 0.0)
setlist_solid_line_add = (0.0, 80.0)
setlist_line_num = 0
setlist_page2_pos = (240.0, 50.0)
setlist_page2_num = 0
setlist_page2_dims = (819.0, 666.0)
setlist_page1_dims = (922.0, 512.0)
setlist_text_z = 4.1
g_gh3_setlist = null
current_tab = tab_setlist
setlist_page1_z = 0
setlist_page2_z = 0
current_setlist_songpreview = none
target_setlist_songpreview = none
setlist_songpreview_changing = 0

script display_as_made_famous_by \{rot_angle = -7
		time = 0.25}
	destroy_menu \{menu_id = setlist_original_artist}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = setlist_original_artist
		rot_angle = <rot_angle>
		alpha = 0
	}
	displaysprite {
		parent = setlist_original_artist
		tex = white
		dims = (130.0, 50.0)
		just = [center top]
		pos = <pos>
		rgba = [0 0 0 255]
		z = 500
	}
	displaysprite {
		parent = setlist_original_artist
		tex = white
		just = [center top]
		dims = (130.0, 25.0)
		pos = (<pos> + (0.0, 25.0))
		rgba = [223 223 223 255]
		z = 501
	}
	displaytext {
		parent = setlist_original_artist
		text = "AS MADE"
		font = text_a3
		just = [center top]
		pos = (<pos>)
		z = 502
		scale = (0.8, 0.5)
		rgba = [223 223 223 255]
		noshadow
	}
	fit_text_in_rectangle id = <id> dims = (75.0, 15.0)
	displaytext {
		parent = setlist_original_artist
		text = "FAMOUS BY"
		just = [center top]
		font = text_a3
		pos = (<pos> + (0.0, 25.0))
		z = 502
		scale = (0.72499996, 0.5)
		rgba = [0 0 0 255]
		noshadow
	}
	fit_text_in_rectangle id = <id> dims = (90.0, 15.0)
	doscreenelementmorph id = setlist_original_artist alpha = 1 time = <time>
endscript

script set_song_icon 
	if NOT gotparam \{no_wait}
		wait \{0.5
			seconds}
	endif
	if NOT gotparam \{song}
		<song> = ($target_setlist_songpreview)
	endif
	if (<song> = none && $current_tab = tab_setlist)
		return
	endif
	if ($current_tab = tab_setlist)
		get_tier_from_song song = <song>
		get_progression_globals game_mode = ($game_mode)
		formattext checksumname = tiername 'tier%d' d = <tier_number>
		if structurecontains structure = ($<tier_global>.<tiername>) setlist_icon
			song_icon = ($<tier_global>.<tiername>.setlist_icon)
		else
			song_icon = setlist_icon_generic
		endif
	else
		song_icon = setlist_icon_generic
	endif
	mini_rot = RandomRange (0.0, 8.0)
	if screenelementexists \{id = sl_clipart}
		setscreenelementprops id = sl_clipart texture = <song_icon>
		doscreenelementmorph id = sl_clipart alpha = 1 time = 0.25 rot_angle = <mini_rot>
	endif
	if screenelementexists \{id = sl_clipart_shadow}
		setscreenelementprops id = sl_clipart_shadow texture = <song_icon>
		doscreenelementmorph id = sl_clipart_shadow alpha = 1 time = 0.25 rot_angle = <mini_rot>
	endif
	if screenelementexists \{id = sl_clip}
		getscreenelementprops \{id = sl_clip}
		rot_clip_a = <rot_angle>
		rot_clip_b = (<rot_clip_a> + 10)
		setscreenelementprops id = sl_clip rot_angle = <rot_clip_b>
		doscreenelementmorph id = sl_clip alpha = 1 rot_angle = <rot_clip_a> time = 0.25
	endif
	if NOT (<song> = none)
		get_song_original_artist song = <song>
		if ($we_have_songs = true && <original_artist> = 0)
			if screenelementexists \{id = sl_clipart}
				getscreenelementprops \{id = sl_clipart}
			endif
		endif
	endif
endscript

script get_tier_from_song 
	num_tiers = ($g_gh3_setlist.num_tiers)
	tier_index = 1
	begin
	formattext checksumname = tier_name 'tier%d' d = <tier_index>
	getarraysize ($g_gh3_setlist.<tier_name>.songs)
	song_index = 0
	begin
	song_checksum = ($g_gh3_setlist.<tier_name>.songs [<song_index>])
	if (<song_checksum> = <song>)
		return tier_number = <tier_index>
	endif
	<song_index> = (<song_index> + 1)
	repeat <array_size>
	<tier_index> = (<tier_index> + 1)
	repeat <num_tiers>
	printf \{"Did not find tier!"}
	return \{tier_number = 1}
endscript

script clear_setlist_clip_and_art 
	destroy_menu \{menu_id = setlist_original_artist}
	if screenelementexists \{id = sl_clipart}
		setscreenelementprops \{id = sl_clipart
			alpha = 0}
	endif
	if screenelementexists \{id = sl_clipart_shadow}
		setscreenelementprops \{id = sl_clipart_shadow
			alpha = 0}
	endif
	if screenelementexists \{id = sl_clip}
		setscreenelementprops \{id = sl_clip
			alpha = 0}
	endif
endscript

script setlist_go_back 
	if (($transitions_locked = 0) && ($is_network_game = 0))
		launchevent \{type = unfocus
			target = vmenu_setlist}
	endif
	begin
	if ($changing_tab = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($is_network_game = 1)
		if ($g_tie_breaker_song = 0)
			net_setlist_go_back
		endif
	else
		ui_flow_manager_respond_to_action action = go_back create_params = {player = ($current_num_players)}
	endif
endscript

script displaysprite \{just = [
			left
			top
		]
		rgba = [
			255
			255
			255
			255
		]
		dims = {
		}
		blendmode = {
		}
		internal_just = {
		}
		scale = {
		}
		alpha = 1}
	printf \{"replace displaySprite calls with standard CreateScreenElement ones please"}
	if gotparam \{rot_angle}
		rot_struct = {rot_angle = <rot_angle>}
	else
		rot_struct = {}
	endif
	createscreenelement {
		type = spriteelement
		id = <id>
		parent = <parent>
		texture = <tex>
		dims = <dims>
		rgba = <rgba>
		pos = <pos>
		just = <just>
		internal_just = <internal_just>
		z_priority = <z>
		scale = <scale>
		<rot_struct>
		blend = <blendmode>
		alpha = <alpha>
	}
	if gotparam \{flip_v}
		<id> :setprops flip_v
	endif
	if gotparam \{flip_h}
		<id> :setprops flip_h
	endif
	return id = <id>
endscript

script displaytext \{id = {
		}
		just = [
			left
			top
		]
		rgba = [
			210
			130
			0
			250
		]
		font = text_a5
		rot = 0}
	printf \{"replace displayText calls with standard CreateScreenElement ones please"}
	createscreenelement {
		type = textelement
		parent = <parent>
		font = <font>
		scale = <scale>
		rgba = <rgba>
		text = <text>
		id = <id>
		pos = <pos>
		just = <just>
		rot_angle = <rot>
		z_priority = <z>
		font_spacing = <font_spacing>
	}
	if gotparam \{noshadow}
		<id> :setprops noshadow
	else
		<id> :setprops shadow shadow_offs = (3.0, 3.0) shadow_rgba [0 0 0 255]
	endif
	return id = <id>
endscript

script create_setlist_menu 
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		net_lobby_state_message {
			current_state = ($net_current_flow_state)
			action = request
			request_state = song
		}
	endif
	if ($is_network_game = 1)
		change \{current_tab = tab_setlist}
		change \{setlist_previous_tier = 1}
		change \{setlist_previous_song = 0}
		change \{setlist_previous_tab = tab_setlist}
	endif
	if ($end_credits = 1 && $current_song = trainkeptarollin)
		progression_endcredits
		return
	endif
	change \{boss_wuss_out = 0}
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
	change \{progression_unlocked_guitar = -1}
	change \{progression_unlocked_guitar2 = -1}
	change \{rich_presence_context = presence_song_list}
	menu_music_off
	get_progression_globals game_mode = ($game_mode)
	change g_gh3_setlist = <tier_global>
	create_setlist_scrolling_menu
	change \{setlist_page2_z = 3.4}
	change \{setlist_page1_z = 3.5}
	change \{setlist_random_images_scroll_num = 0}
	change \{setlist_random_images_highest_num = 0}
	change_tab tab = ($setlist_previous_tab)
	setlist_display_random_bg_image
	if ($is_network_game)
		change \{setlist_previous_tier = 1}
		change \{setlist_previous_song = 0}
		change \{setlist_previous_tab = tab_setlist}
		create_setlist_popup
		<bg_helper_pos> = (140.0, 585.0)
		if ($current_tab = tab_setlist)
			setlist_show_helperbar pos = (<bg_helper_pos> + (64.0, 4.0))
		elseif ($current_tab = tab_bonus)
			setlist_show_helperbar {
				pos = (<bg_helper_pos> + (64.0, 4.0))
				text_option1 = "SETLIST"
				button_option1 = "\\b6"
			}
		endif
	endif
	change \{disable_menu_sounds = 1}
	begin
	if ($setlist_selection_tier >= $setlist_previous_tier)
		if ($setlist_selection_song >= $setlist_previous_song)
			break
		endif
	endif
	last_tier = ($setlist_selection_tier)
	last_song = ($setlist_selection_song)
	launchevent \{type = pad_down
		target = vmenu_setlist}
	if (<last_tier> = $setlist_selection_tier)
		if (<last_song> = $setlist_selection_song)
			break
		endif
	endif
	repeat
	change \{disable_menu_sounds = 0}
	if ($setlist_selection_found = 1)
		formattext \{checksumname = tier_checksum
			'tier%s'
			s = $setlist_selection_tier}
		song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
		change target_setlist_songpreview = <song>
	else
		change \{target_setlist_songpreview = none}
	endif
	if ($g_keep_song_preview = 0)
		destroy_setlist_songpreview_monitor
		spawnscriptlater \{setlist_songpreview_monitor}
	endif
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		net_lobby_state_message \{current_state = song
			action = approval}
		change \{net_can_send_approval = 0}
	endif
endscript
g_top_rockers_setlist = 0

script create_setlist_scrolling_menu 
	kill_start_key_binding
	unpausegame
	if ($player1_status.bot_play = 1 || $g_top_rockers_setlist = 1)
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_faceoff ||
				$game_mode = p2_pro_faceoff ||
				$game_mode = p2_battle ||
				$game_mode = p2_quickplay)
			exclusive_mp_controllers = [0 , 0]
			setarrayelement arrayname = exclusive_mp_controllers index = 0 newvalue = ($player1_device)
			setarrayelement arrayname = exclusive_mp_controllers index = 1 newvalue = ($player2_device)
			exclusive_device = <exclusive_mp_controllers>
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	if ($is_network_game = 1)
		if NOT ($net_current_flow_state = song)
			no_focus_value = 1
		else
			no_focus_value = 0
		endif
	else
		no_focus_value = 1
	endif
	new_menu {
		scrollid = scrolling_setlist
		vmenuid = vmenu_setlist
		tierlist = $g_gh3_setlist
		use_backdrop = 0
		no_wrap
		z = -1
		event_handlers = $setlist_event_handlers
		on_choose = setlist_choose_song
		on_right = setlist_debug_completesong
		on_l3 = setlist_debug_unlockall
		on_left = nullscript
		exclusive_device = <exclusive_device>
		no_focus = <no_focus_value>
		focus_color = black
		unfocus_color = dk_violet_grey
	}
	if ($is_network_game = 1)
		if screenelementexists \{id = dl_content_warning}
			destroyscreenelement \{id = dl_content_warning}
		endif
	endif
endscript

script destroy_setlist_scrolling_menu 
	killspawnedscript \{name = scroll_ticker_text}
	destroy_menu \{menu_id = scrolling_setlist}
	clean_up_user_control_helpers
endscript

script destroy_setlist_songpreview_monitor 
	unpausespawnedscript \{setlist_songpreview_monitor}
	begin
	if ($setlist_songpreview_changing = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	killspawnedscript \{name = setlist_songpreview_monitor}
	if NOT ($current_setlist_songpreview = none)
		get_song_prefix song = ($current_setlist_songpreview)
		formattext checksumname = song_preview '%s_preview' s = <song_prefix>
		stopsound <song_preview>
		songunloadfsbifdownloaded
	endif
endscript

script destroy_setlist_menu 
	killspawnedscript \{name = net_match_download_songs}
	killspawnedscript \{name = scroll_ticker_text}
	if ($g_keep_song_preview = 0)
		destroy_setlist_songpreview_monitor
		change \{target_setlist_songpreview = none}
	endif
	if screenelementexists \{id = setlist_overlay}
		destroyscreenelement \{id = setlist_overlay}
	endif
	change setlist_previous_tier = ($setlist_selection_tier)
	change setlist_previous_song = ($setlist_selection_song)
	change setlist_previous_tab = ($current_tab)
	destroy_menu \{menu_id = setlist_original_artist}
	destroy_menu \{menu_id = scrolling_setlist}
	destroy_menu \{menu_id = setlist_menu}
	destroy_menu \{menu_id = setlist_loops_menu}
	destroy_menu \{menu_id = setlist_bg_container}
	reset_vars \{del}
	clean_up_user_control_helpers
	destroy_setlist_popup
endscript

script setlist_choose_song \{device_num = 0}
	if gotparam \{song_count}
		if ($is_network_game = 1)
			net_request_song tier = <tier> song_count = <song_count>
		else
			if ($transitions_locked = 0)
				launchevent \{type = unfocus
					target = vmenu_setlist}
			endif
			formattext checksumname = tier_checksum 'tier%s' s = <tier>
			change current_song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
			setglobaltags progression params = {current_tier = <tier>}
			setglobaltags progression params = {current_song_count = <song_count>}
			change \{current_level = $g_last_venue_selected}
			get_song_struct song = ($current_song)
			if ((structurecontains structure = <song_struct> boss) || $game_mode = p2_battle)
				get_current_battle_first_play
				if (<first_battle_play> = 1 || (structurecontains structure = <song_struct> boss))
					ui_flow_manager_respond_to_action action = show_help device_num = (<device_num>) create_params = {boss = (<song_struct>.checksum)}
					return
				endif
			endif
			ui_flow_manager_respond_to_action action = continue device_num = (<device_num>)
		endif
	endif
endscript

script setlist_debug_completesong 
	if ($game_mode = training || $is_network_game = 1)
		return
	endif
	enable_cheat = 0
	if ($enable_button_cheats = 1)
		enable_cheat = 1
	endif
	if (<enable_cheat> = 1)
		level = ($current_level)
		formattext checksumname = tier_checksum 'tier%s' s = <tier>
		change current_song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
		setglobaltags progression params = {current_tier = <tier>}
		setglobaltags progression params = {current_song_count = <song_count>}
		printstruct <...>
		load_songqpak song_name = ($current_song) async = 0
		setup_gemarrays song_name = ($current_song) difficulty = ($current_difficulty) player_status = player1_status
		calc_songscoreinfo
		change structurename = player1_status score = ($player1_status.base_score * 2.8 + 1)
		progression_songwon
		if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
			menu_top_rockers_check_for_new_top_score
		endif
		songpreview = ($current_setlist_songpreview)
		change_tab tab = ($current_tab)
		change current_setlist_songpreview = <songpreview>
		if ($current_song = bossjoe || $current_song = walkthiswayrundmc)
			if ($current_song = bossjoe)
				find_secret_character_index \{info_name = joep}
				<boss_character> = <index>
			elseif ($current_song = walkthiswayrundmc)
				find_secret_character_index \{info_name = dmc}
				<boss_character> = <index>
			endif
			if (<boss_character> >= 0)
				unlocked_for_purchase = 1
				getglobaltags ($secret_characters [<boss_character>].id)
				if (<unlocked_for_purchase> = 0)
					setglobaltags ($secret_characters [<boss_character>].id) params = {unlocked_for_purchase = 1}
				endif
			endif
		endif
		change \{disable_menu_sounds = 1}
		begin
		if (<tier> = $setlist_selection_tier)
			if (<song_count> = $setlist_selection_song)
				break
			endif
		endif
		last_tier = ($setlist_selection_tier)
		last_song = ($setlist_selection_song)
		launchevent \{type = pad_down
			target = vmenu_setlist}
		if (<last_tier> = $setlist_selection_tier)
			if (<last_song> = $setlist_selection_song)
				break
			endif
		endif
		repeat
		change \{disable_menu_sounds = 0}
		change \{structurename = player1_status
			new_cash = 0}
		change \{progression_play_completion_movie = 0}
		change \{progression_unlock_tier_last_song = 0}
		change current_level = <level>
		change \{end_credits = 0}
	endif
endscript

script setlist_debug_unlockall 
	enable_cheat = 0
	if ($enable_button_cheats = 1)
		enable_cheat = 1
	endif
	if (<enable_cheat> = 1)
		if ($game_mode = training || $is_network_game = 1)
			return
		endif
		level = ($current_level)
		get_progression_globals game_mode = ($game_mode)
		globaltags_unlockall songlist = <tier_global>
		globaltags_unlockall \{songlist = gh3_bonus_songs}
		change \{structurename = player1_status
			notes_hit = 100}
		change \{structurename = player1_status
			total_notes = 100}
		change \{structurename = player2_status
			notes_hit = 100}
		change \{structurename = player2_status
			total_notes = 100}
		if ($game_mode = p1_career)
			updateatoms \{name = progression}
		endif
		updateatoms \{name = achievement}
		songpreview = ($current_setlist_songpreview)
		change_tab tab = ($current_tab)
		change current_setlist_songpreview = <songpreview>
		change \{disable_menu_sounds = 1}
		begin
		if (<tier> = $setlist_selection_tier)
			if (<song_count> = $setlist_selection_song)
				break
			endif
		endif
		last_tier = ($setlist_selection_tier)
		last_song = ($setlist_selection_song)
		launchevent \{type = pad_down
			target = vmenu_setlist}
		if (<last_tier> = $setlist_selection_tier)
			if (<last_song> = $setlist_selection_song)
				break
			endif
		endif
		repeat
		change \{disable_menu_sounds = 0}
		change \{structurename = player1_status
			new_cash = 0}
		change \{progression_play_completion_movie = 0}
		change \{progression_unlock_tier_last_song = 0}
		change current_level = <level>
		change \{end_credits = 0}
	endif
endscript

script setlist_scroll \{dir = down}
	if ($setlist_num_songs = 0)
		return
	endif
	if (<dir> = down)
		if ($setlist_selection_index + 1 = $setlist_num_songs)
			return
		endif
	else
		if ($setlist_selection_index - 1 < 0)
			return
		endif
	endif
	generic_menu_up_or_down_sound <dir>
	formattext \{checksumname = textid
		'id_song%i'
		i = $setlist_selection_index
		addtostringlookup = true}
	retail_menu_unfocus id = <textid>
	setscreenelementprops id = <textid> no_shadow
	if (<dir> = down)
		jump_tier = 0
		change setlist_selection_index = ($setlist_selection_index + 1)
		setlist_prefix = ($g_gh3_setlist.prefix)
		begin
		formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = $setlist_selection_tier
		formattext \{checksumname = tier_checksum
			'tier%s'
			s = $setlist_selection_tier}
		getarraysize ($g_gh3_setlist.<tier_checksum>.songs)
		change setlist_selection_song = ($setlist_selection_song + 1)
		if ($setlist_selection_song = <array_size>)
			change \{setlist_selection_song = 0}
			change setlist_selection_tier = ($setlist_selection_tier + 1)
			jump_tier = 1
		endif
		formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = ($setlist_selection_song + 1) s = $setlist_selection_tier addtostringlookup = true
		for_bonus = 0
		if ($current_tab = tab_bonus)
			<for_bonus> = 1
		endif
		if issongavailable song_checksum = <song_checksum> song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song]) for_bonus = <for_bonus>
			break
		endif
		repeat
		jump_tier_amt = (0.0, -240.0)
		if ($setlist_selection_index = 1)
			song_jump_amt = (0.0, -160.0)
			getscreenelementprops \{id = sl_clipart}
			setscreenelementprops id = sl_clipart pos = (<pos> - (0.0, 80.0))
			getscreenelementprops \{id = sl_clipart_shadow}
			setscreenelementprops id = sl_clipart_shadow pos = (<pos> - (0.0, 80.0))
			getscreenelementprops \{id = sl_clip}
			setscreenelementprops id = sl_clip pos = (<pos> - (0.0, 80.0))
			getscreenelementprops \{id = sl_highlight}
			setscreenelementprops id = sl_highlight pos = (<pos> - (0.0, 80.0))
		else
			song_jump_amt = (0.0, -80.0)
		endif
	else
		jump_tier = 0
		change setlist_selection_index = ($setlist_selection_index - 1)
		setlist_prefix = ($g_gh3_setlist.prefix)
		begin
		formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = $setlist_selection_tier
		formattext \{checksumname = tier_checksum
			'tier%s'
			s = $setlist_selection_tier}
		getarraysize ($g_gh3_setlist.<tier_checksum>.songs)
		change setlist_selection_song = ($setlist_selection_song - 1)
		if ($setlist_selection_song = -1)
			change setlist_selection_tier = ($setlist_selection_tier - 1)
			formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = $setlist_selection_tier
			formattext \{checksumname = tier_checksum
				'tier%s'
				s = $setlist_selection_tier}
			getarraysize ($g_gh3_setlist.<tier_checksum>.songs)
			change setlist_selection_song = (<array_size> - 1)
			jump_tier = 1
		endif
		formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = ($setlist_selection_song + 1) s = $setlist_selection_tier addtostringlookup = true
		for_bonus = 0
		if ($current_tab = tab_bonus)
			<for_bonus> = 1
		endif
		if issongavailable song_checksum = <song_checksum> song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song]) for_bonus = <for_bonus>
			break
		endif
		repeat
		jump_tier_amt = (0.0, 240.0)
		if ($setlist_selection_index = 0)
			song_jump_amt = (0.0, 160.0)
			getscreenelementprops \{id = sl_clipart}
			setscreenelementprops id = sl_clipart pos = (<pos> + (0.0, 80.0))
			getscreenelementprops \{id = sl_clipart_shadow}
			setscreenelementprops id = sl_clipart_shadow pos = (<pos> + (0.0, 80.0))
			getscreenelementprops \{id = sl_clip}
			setscreenelementprops id = sl_clip pos = (<pos> + (0.0, 80.0))
			getscreenelementprops \{id = sl_highlight}
			setscreenelementprops id = sl_highlight pos = (<pos> + (0.0, 80.0))
		else
			song_jump_amt = (0.0, 80.0)
		endif
	endif
	formattext \{checksumname = tier_checksum
		'tier%s'
		s = $setlist_selection_tier}
	song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
	change target_setlist_songpreview = <song>
	clear_setlist_clip_and_art
	killspawnedscript \{name = set_song_icon}
	spawnscriptnow \{set_song_icon}
	formattext \{checksumname = textid
		'id_song%i'
		i = $setlist_selection_index
		addtostringlookup = true}
	retail_menu_focus id = <textid>
	setscreenelementprops id = <textid> shadow
	<not_header> = 1
	if (<jump_tier> = 1)
		change setlist_begin_text = ($setlist_begin_text + <jump_tier_amt>)
		setscreenelementprops \{id = scrolling_setlist
			pos = $setlist_begin_text}
		change setlist_background_pos = ($setlist_background_pos + <jump_tier_amt>)
		<not_header> = 0
	endif
	if (<not_header>)
		change setlist_begin_text = ($setlist_begin_text + <song_jump_amt>)
		setscreenelementprops \{id = scrolling_setlist
			pos = $setlist_begin_text}
		change setlist_background_pos = ($setlist_background_pos + <song_jump_amt>)
	endif
	setscreenelementprops \{id = setlist_menu
		pos = $setlist_background_pos}
	setscreenelementprops \{id = setlist_bg_container
		pos = $setlist_background_pos}
	setscreenelementprops \{id = setlist_loops_menu
		pos = $setlist_background_pos}
	<tier> = $setlist_selection_tier
	setlist_prefix = ($g_gh3_setlist.prefix)
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	get_song_covered_by song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
	if gotparam \{covered_by}
		setlist_footnote \{alpha = 1}
	else
		setlist_footnote \{alpha = 0}
	endif
	if ($setlist_clip_rot_neg)
		setscreenelementprops id = sl_clip rot_angle = (0 - $setlist_clip_last_rot)
		change \{setlist_clip_rot_neg = 0}
	else
		getrandomvalue \{name = rot
			a = 10.0
			b = -30.0}
		setscreenelementprops id = sl_clip rot_angle = <rot>
		change setlist_clip_last_rot = <rot>
		change \{setlist_clip_rot_neg = 1}
	endif
	if (<dir> = down)
		change setlist_random_images_scroll_num = ($setlist_random_images_scroll_num + 1)
		if ($setlist_random_images_scroll_num > $setlist_random_images_highest_num)
			change setlist_random_images_highest_num = ($setlist_random_images_scroll_num)
			mod a = ($setlist_random_images_highest_num) b = 4
			if (<mod> = 0)
				setlist_display_random_bg_image
			endif
		endif
		change setlist_background_loop_num = ($setlist_background_loop_num + 1)
		if ($setlist_background_loop_num = 10)
			change \{setlist_background_loop_num = 0}
			change setlist_background_loop_pos = ($setlist_background_loop_pos + (0.0, 1308.0))
			displaysprite \{parent = setlist_menu
				tex = setlist_bg_loop
				pos = $setlist_background_loop_pos
				dims = (1280.0, 1308.0)
				z = 3.1}
		endif
		change setlist_page1_num = ($setlist_page1_num + 1)
		if ($setlist_page1_num = 4)
			change \{setlist_page1_num = 0}
			change setlist_page1_loop_pos = ($setlist_page1_loop_pos + (0.0, 512.0))
			displaysprite \{parent = setlist_loops_menu
				tex = setlist_page1_loop
				pos = $setlist_page1_loop_pos
				dims = $setlist_page1_dims
				z = $setlist_page1_z}
		endif
		if ($current_tab = tab_bonus)
			change setlist_page2_num = ($setlist_page2_num + 1)
			if ($setlist_page2_num = 5)
				change \{setlist_page2_num = 0}
				change setlist_page2_pos = ($setlist_page2_pos + (0.0, 665.5))
				displaysprite \{parent = setlist_loops_menu
					tex = setlist_page2_loop
					pos = $setlist_page2_pos
					dims = $setlist_page2_dims
					z = $setlist_page2_z}
			endif
		endif
		change setlist_line_num = ($setlist_line_num + 1)
		if ($setlist_line_num = 1)
			change \{setlist_line_num = 0}
			<i> = 1
			if NOT (<not_header>)
				<i> = 3
			endif
			begin
			if ($setlist_line_index = $setlist_line_max)
				change \{setlist_line_index = 0}
			endif
			<line> = Random (@ ($setlist_solid_lines [0]) @ ($setlist_solid_lines [1]) @ ($setlist_solid_lines [2]) )
			displaysprite parent = setlist_menu tex = <line> pos = $setlist_solid_line_pos dims = (896.0, 16.0) z = ($setlist_page1_z + 0.1)
			change setlist_line_index = ($setlist_line_index + 1)
			if ($setlist_line_index = $setlist_line_max)
				change \{setlist_line_index = 0}
			endif
			<line> = Random (@ ($setlist_dotted_lines [0]) @ ($setlist_dotted_lines [1]) @ ($setlist_dotted_lines [2]) )
			displaysprite parent = setlist_menu tex = <line> pos = $setlist_dotted_line_pos dims = (896.0, 16.0) z = ($setlist_page1_z + 0.1)
			change setlist_line_index = ($setlist_line_index + 1)
			change setlist_solid_line_pos = (($setlist_solid_line_pos) + ($setlist_solid_line_add))
			change setlist_dotted_line_pos = (($setlist_dotted_line_pos) + ($setlist_solid_line_add))
			repeat <i>
		endif
		change setlist_page3_num = ($setlist_page3_num + 1)
		if ($setlist_page3_num = 5)
			change \{setlist_page3_num = 0}
			change setlist_page3_pos = ($setlist_page3_pos + (0.0, 532.0))
			displaysprite \{parent = setlist_loops_menu
				tex = setlist_page3_loop
				pos = $setlist_page3_pos
				dims = $setlist_page3_dims
				z = $setlist_page3_z}
		endif
	else
		change setlist_random_images_scroll_num = ($setlist_random_images_scroll_num - 1)
		change setlist_background_loop_num = ($setlist_background_loop_num - 1)
		change setlist_page1_num = ($setlist_page1_num - 1)
		change setlist_line_num = ($setlist_line_num - 1)
		change setlist_line_index = ($setlist_line_index + 1)
		if ($setlist_line_index = $setlist_line_max)
			change \{setlist_line_index = 0}
		endif
		change setlist_page3_num = ($setlist_page3_num - 1)
		change setlist_page2_num = ($setlist_page2_num - 1)
	endif
	if gotparam \{up}
		generic_menu_up_or_down_sound \{up}
	endif
	if gotparam \{down}
		generic_menu_up_or_down_sound \{down}
	endif
endscript

script setlist_footnote \{alpha = 1}
	if NOT screenelementexists \{id = setlist_overlay}
		createscreenelement {
			type = containerelement
			parent = root_window
			id = setlist_overlay
			pos = (0.0, 0.0)
			just = [left top]
			alpha = <alpha>
		}
		createscreenelement \{type = containerelement
			parent = setlist_overlay
			id = setlist_footer
			pos = (640.0, 645.0)
			z_priority = 1000
			just = [
				center
				bottom
			]
			alpha = 1}
		createscreenelement \{type = containerelement
			parent = setlist_footer
			id = footer_gradient
			pos = (0.0, -17.0)
			z_priority = 1000
			just = [
				center
				bottom
			]
			alpha = 1
			rot_angle = 90}
		createscreenelement \{type = spriteelement
			parent = footer_gradient
			texture = gradient_128
			dims = (33.0, 600.0)
			pos = (0.0, 0.0)
			rgba = [
				0
				0
				0
				100
			]
			just = [
				center
				bottom
			]
			alpha = 1}
		createscreenelement \{type = spriteelement
			parent = footer_gradient
			texture = gradient_128
			dims = (33.0, 600.0)
			pos = (0.0, 0.0)
			rgba = [
				20
				0
				10
				100
			]
			just = [
				center
				top
			]
			alpha = 1
			flip_h}
		createscreenelement {
			type = textelement
			parent = setlist_footer
			id = setlist_footer_text
			scale = (0.7, 0.6)
			text = "*COVER OF LISTED BAND'S HIT"
			pos = (0.0, -1.0)
			rgba = (($g_menu_colors).md_violet_grey)
			font = text_a11
			just = [center bottom]
			font_spacing = 0.8
			shadow
			shadow_offs = (1.0, 1.0)
			shadow_rgba = [0 0 0 255]
			alpha = 1
			z_priority = 1002
		}
	endif
	if (<alpha> = 1)
		<tier> = $setlist_selection_tier
		setlist_prefix = ($g_gh3_setlist.prefix)
		formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
		formattext checksumname = tier_checksum 'tier%s' s = <tier>
		get_song_artist song = (($g_gh3_setlist).<tier_checksum>.songs [($setlist_selection_song)]) with_year = 0
		formattext \{checksumname = artistid
			'artist_id%d'
			d = $setlist_num_songs}
		getuppercasestring <song_artist>
		song_artist = <uppercasestring>
		stringlength string = <song_artist>
		stringtochararray string = <song_artist>
		if ((<char_array> [(<str_len> - 1)]) = "S")
			formattext textname = text "*COVER OF %a' HIT" a = <song_artist>
		else
			formattext textname = text "*COVER OF %a'S HIT" a = <song_artist>
		endif
		setscreenelementprops id = setlist_footer_text text = <text>
		doscreenelementmorph \{id = setlist_overlay
			alpha = 1
			time = 0.25}
	else
		setscreenelementprops \{id = setlist_footer_text
			text = "*COVER OF LISTED BAND'S HIT"}
		doscreenelementmorph \{id = setlist_overlay
			alpha = 0.85
			time = 0.25}
	endif
endscript

script setlist_display_random_bg_image 
	side = 0
	old_image = 0
	begin
	can_left = 1
	can_right = 1
	flippable = 0
	mydims = (128.0, 128.0)
	minrot = -5
	maxrot = 5
	loffset = (0.0, 0.0)
	roffset = (0.0, 0.0)
	just = [left top]
	getarraysize ($setlist_random_bg_images)
	begin
	getrandomvalue a = 0 b = (<array_size> -1) integer name = randimage
	myimage = ($setlist_random_bg_images [<randimage>].texture)
	if NOT (<myimage> = <old_image>)
		if structurecontains structure = ($setlist_random_bg_images [<randimage>]) flippable
			<flippable> = 1
		endif
		if structurecontains structure = ($setlist_random_bg_images [<randimage>]) dims
			<mydims> = ($setlist_random_bg_images [<randimage>].dims)
		endif
		if structurecontains structure = ($setlist_random_bg_images [<randimage>]) minrot
			<minrot> = ($setlist_random_bg_images [<randimage>].minrot)
		endif
		if structurecontains structure = ($setlist_random_bg_images [<randimage>]) maxrot
			<maxrot> = ($setlist_random_bg_images [<randimage>].maxrot)
		endif
		if structurecontains structure = ($setlist_random_bg_images [<randimage>]) loffset
			<loffset> = ($setlist_random_bg_images [<randimage>].loffset)
		endif
		if structurecontains structure = ($setlist_random_bg_images [<randimage>]) roffset
			<roffset> = ($setlist_random_bg_images [<randimage>].roffset)
		endif
		if structurecontains structure = ($setlist_random_bg_images [<randimage>]) only_left
			<can_right> = 0
		endif
		if structurecontains structure = ($setlist_random_bg_images [<randimage>]) only_right
			<can_left> = 0
		endif
		if structurecontains structure = ($setlist_random_bg_images [<randimage>]) center_just
			<just> = [center center]
		endif
		if structurecontains structure = ($setlist_random_bg_images [<randimage>]) low_z
			<z_priority> = 3.2
		else
			<z_priority> = 6
		endif
		<old_image> = <myimage>
		break
	endif
	repeat
	getrandomvalue \{a = 300
		b = 600
		integer
		name = randdown}
	if (<side> = 0)
		if (<can_left> = 1)
			imagepos = (($setlist_random_images_highest_num * (0.0, 300.0)) + ((0.0, 1.0) * <randdown>) + <loffset>)
		else
			imagepos = (($setlist_random_images_highest_num * (0.0, 300.0)) + ((0.0, 1.0) * <randdown>) + <roffset> + (1000.0, 0.0))
		endif
	else
		if (<can_right> = 1)
			imagepos = (($setlist_random_images_highest_num * (0.0, 300.0)) + ((0.0, 1.0) * <randdown>) + <roffset> + (1000.0, 0.0))
		else
			imagepos = (($setlist_random_images_highest_num * (0.0, 300.0)) + ((0.0, 1.0) * <randdown>) + <loffset>)
		endif
	endif
	imageflag = {}
	if (<flippable> = 1)
		getrandomvalue \{a = 1
			b = 3
			integer
			name = randflip}
		if (<randflip> = 1)
			imageflag = {flip_h flip_v}
		elseif (<randflip> = 2)
			imageflag = {flip_h}
		else
			imageflag = {flip_v}
		endif
	endif
	getrandomvalue a = <minrot> b = <maxrot> name = randrot
	if structurecontains structure = ($setlist_random_bg_images [<randimage>]) shoeprint
		displaysprite parent = setlist_bg_container tex = <myimage> pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 2 blendmode = subtract
		displaysprite parent = setlist_bg_container tex = <myimage> pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 2 blendmode = subtract
		displaysprite parent = setlist_bg_container tex = <myimage> pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 2 blendmode = subtract
	else
		displaysprite parent = setlist_bg_container tex = <myimage> pos = <imagepos> dims = <mydims> rot_angle = <randrot> z = <z_priority> <imageflag> just = <just>
		displaysprite parent = setlist_bg_container tex = <myimage> pos = <imagepos> dims = <mydims> rot_angle = <randrot> z = <z_priority> <imageflag> just = <just>
	endif
	<side> = 1
	repeat 2
endscript

script setlist_songpreview_monitor 
	begin
	if NOT ($current_setlist_songpreview = $target_setlist_songpreview)
		change \{setlist_songpreview_changing = 1}
		song = ($target_setlist_songpreview)
		songunloadfsb
		wait \{0.5
			second}
		if ($target_setlist_songpreview != <song> || $target_setlist_songpreview = none)
			change \{current_setlist_songpreview = none}
			change \{setlist_songpreview_changing = 0}
		else
			get_song_prefix song = <song>
			get_song_struct song = <song>
			if structurecontains structure = <song_struct> streamname
				song_prefix = (<song_struct>.streamname)
			endif
			if NOT songloadfsb song_prefix = <song_prefix>
				change \{setlist_songpreview_changing = 0}
				downloadcontentlost
				return
			endif
			formattext checksumname = song_preview '%s_preview' s = <song_prefix>
			get_song_struct song = <song>
			soundbussunlock \{music_setlist}
			soundbussunlock \{band_balance}
			soundbussunlock \{guitar_balance}
			if structurecontains structure = <song_struct> name = band_playback_volume
				setlistvol = ((<song_struct>.band_playback_volume))
				setsoundbussparams {music_setlist = {vol = <setlistvol>}}
				setsoundbussparams {band_balance = {vol = ((<song_struct>.band_playback_volume) - 1.5)}}
				setsoundbussparams \{guitar_balance = {
						vol = -1.5
					}}
			else
				setsoundbussparams \{music_setlist = {
						vol = 0.0
					}}
				setsoundbussparams \{band_balance = {
						vol = -1.5
					}}
				setsoundbussparams \{guitar_balance = {
						vol = -1.5
					}}
			endif
			soundbusslock \{music_setlist}
			soundbusslock \{band_balance}
			soundbusslock \{guitar_balance}
			playsound <song_preview> buss = music_setlist
			change current_setlist_songpreview = <song>
			change \{setlist_songpreview_changing = 0}
		endif
	elseif NOT ($current_setlist_songpreview = none)
		song = ($current_setlist_songpreview)
		get_song_prefix song = <song>
		formattext checksumname = song_preview '%s_preview' s = <song_prefix>
		if NOT issoundplaying <song_preview>
			change \{setlist_songpreview_changing = 1}
			if NOT songloadfsb song_prefix = <song_prefix>
				change \{setlist_songpreview_changing = 0}
				downloadcontentlost
				return
			endif
			soundbussunlock \{music_setlist}
			soundbussunlock \{band_balance}
			soundbussunlock \{guitar_balance}
			if structurecontains structure = <song_struct> name = band_playback_volume
				setlistvol = ((<song_struct>.band_playback_volume))
				setsoundbussparams {music_setlist = {vol = <setlistvol>}}
				setsoundbussparams {band_balance = {vol = ((<song_struct>.band_playback_volume) - 1.5)}}
				setsoundbussparams \{guitar_balance = {
						vol = -1.5
					}}
			else
				setsoundbussparams \{music_setlist = {
						vol = 0.0
					}}
				setsoundbussparams \{band_balance = {
						vol = -1.5
					}}
				setsoundbussparams \{guitar_balance = {
						vol = -1.5
					}}
			endif
			soundbusslock \{music_setlist}
			soundbusslock \{band_balance}
			soundbusslock \{guitar_balance}
			playsound <song_preview> buss = music_setlist
			change \{setlist_songpreview_changing = 0}
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript
changing_tab = 0

script change_tab \{tab = tab_setlist
		button = 0}
	change \{changing_tab = 1}
	if ($current_tab = <tab> && <button> = 1)
		change \{changing_tab = 0}
		return
	endif
	if (<tab> = tab_setlist)
		if NOT ($current_tab = <tab>)
			menu_setlist_setlist_tab_sound
		endif
		get_progression_globals game_mode = ($game_mode)
	elseif (<tab> = tab_bonus)
		if NOT ($current_tab = <tab>)
			menu_setlist_bonus_tab_sound
		endif
		get_progression_globals game_mode = ($game_mode) bonus
	endif
	change g_gh3_setlist = <tier_global>
	change current_tab = <tab>
	destroy_setlist_scrolling_menu
	create_setlist_scrolling_menu
	reset_vars \{del}
	destroy_menu \{menu_id = setlist_original_artist}
	destroy_menu \{menu_id = setlist_loops_menu}
	destroy_menu \{menu_id = setlist_menu}
	createscreenelement \{type = containerelement
		parent = root_window
		id = setlist_loops_menu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	switch <tab>
		case tab_setlist
		change \{setlist_page2_z = 3.4}
		change \{setlist_page1_z = 3.5}
		displaysprite \{parent = setlist_loops_menu
			tex = setlist_page1_loop
			pos = $setlist_page1_loop_pos
			dims = $setlist_page1_dims
			z = $setlist_page1_z}
		case tab_bonus
		change \{setlist_page2_z = 3.8}
		change \{setlist_page1_z = 3.4}
		displaysprite \{parent = setlist_loops_menu
			tex = setlist_page1_loop
			pos = $setlist_page1_loop_pos
			dims = $setlist_page1_dims
			z = $setlist_page1_z}
		displaysprite parent = setlist_loops_menu tex = setlist_page2_loop pos = ($setlist_page2_pos + (0.0, 553.0)) dims = $setlist_page2_dims z = $setlist_page2_z
	endswitch
	create_sl_assets <tab>
	setscreenelementprops \{id = setlist_bg_container
		pos = (0.0, 0.0)}
	change \{setlist_random_images_scroll_num = 0}
	change setlist_page2_pos = ($setlist_page2_pos + (0.0, 553.0))
	setscreenelementprops \{id = sl_page2_head
		z_priority = $setlist_page2_z}
	setscreenelementprops \{id = sl_page1_head
		z_priority = $setlist_page1_z}
	if ($setlist_selection_found = 1)
		formattext \{checksumname = tier_checksum
			'tier%s'
			s = $setlist_selection_tier}
		song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
		change target_setlist_songpreview = <song>
	else
		change \{target_setlist_songpreview = none}
	endif
	killspawnedscript \{name = set_song_icon}
	spawnscriptnow \{set_song_icon
		params = {
			no_wait
		}}
	if ($is_network_game = 0)
		launchevent \{type = focus
			target = vmenu_setlist}
	else
		if ($net_current_flow_state = song)
			launchevent \{type = focus
				target = vmenu_setlist}
		endif
	endif
	change \{changing_tab = 0}
endscript

script reset_vars 
	if gotparam \{del}
		change \{setlist_begin_text = (0.0, 0.0)}
		change \{setlist_background_pos = (0.0, 0.0)}
		change \{setlist_background_loop_pos = (0.0, 676.0)}
		change \{setlist_background_loop_num = 0}
		change \{setlist_selection_index = 0}
		destroy_menu \{menu_id = sl_overshadow}
		destroy_menu \{menu_id = sl_clipart}
		destroy_menu \{menu_id = sl_clipart_shadow}
		destroy_menu \{menu_id = sl_clip}
		destroy_menu \{menu_id = sl_bg_helper}
		destroy_menu \{menu_id = sl_highlight}
		destroy_menu \{menu_id = sl_fixed}
	endif
	change \{setlist_page1_num = 0}
	change \{setlist_page1_loop_pos = (157.0, 768.0)}
	change \{setlist_line_num = 0}
	change \{setlist_page2_num = 0}
	change \{setlist_page2_pos = (240.0, 50.0)}
	change \{setlist_line_index = 0}
	change \{setlist_clip_last_rot = 0}
	change \{setlist_clip_rot_neg = 0}
endscript

script issongavailable \{for_bonus = 0}
	if ($coop_dlc_active = 1)
		if (<song> = paintitblack)
			return \{false}
		endif
	endif
	if ($is_network_game)
		return \{true}
	endif
	if (<for_bonus> = 1)
		getglobaltags <song> param = unlocked
	else
		getglobaltags <song_checksum> param = unlocked
	endif
	if (<unlocked> = 1)
		return \{true}
	endif
	return \{false}
endscript
we_have_songs = false

script create_sl_assets 
	createscreenelement \{type = containerelement
		parent = root_window
		id = setlist_menu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	createscreenelement \{type = windowelement
		parent = setlist_menu
		id = setlist_scroll_text_window
		pos = (400.0, 465.0)
		dims = (430.0, 3240.0)}
	if NOT screenelementexists \{id = setlist_bg_container}
		createscreenelement \{type = containerelement
			parent = root_window
			id = setlist_bg_container
			pos = (0.0, 0.0)
			just = [
				left
				top
			]}
	endif
	displaysprite \{id = sl_bg_head
		parent = setlist_menu
		tex = setlist_bg_head
		pos = (0.0, 0.0)
		dims = (1280.0, 676.0)
		z = 3.1}
	displaysprite \{id = sl_bg_loop
		parent = setlist_menu
		tex = setlist_bg_loop
		pos = $setlist_background_loop_pos
		dims = (1280.0, 1352.0)
		z = 3.1}
	begin
	displaysprite \{parent = setlist_menu
		tex = setlist_shoeprint
		pos = (850.0, -70.0)
		dims = (640.0, 768.0)
		alpha = 0.15
		z = 3.2
		flip_v
		rot_angle = 10
		blendmode = subtract
		z = 3.175}
	repeat 3
	displaysprite \{id = sl_page3_head
		parent = setlist_menu
		tex = setlist_page3_head
		pos = $setlist_page3_pos
		dims = (922.0, 614.0)
		z = $setlist_page3_z}
	displaysprite \{id = sl_page2_head
		parent = setlist_menu
		tex = setlist_page2_head
		pos = $setlist_page2_pos
		dims = (819.0, 553.0)
		z = $setlist_page2_z}
	displaysprite \{flip_h
		id = sl_page1_head
		parent = setlist_menu
		tex = setlist_page1_head
		pos = (160.0, 0.0)
		dims = (922.0, 768.0)
		z = $setlist_page1_z}
	displaysprite parent = setlist_menu tex = setlist_page1_line_red pos = (320.0, 12.0) dims = (8.0, 6400.0) z = ($setlist_page1_z + 0.1)
	<title_pos> = (300.0, 383.0)
	displaysprite id = sl_page1_head_lines parent = setlist_menu tex = setlist_page1_head_lines pos = (176.0, 64.0) dims = (896.0, 320.0) z = ($setlist_page1_z + 0.1)
	<begin_line> = (176.0, 420.0)
	<solid_line_pos> = (176.0, 340.0)
	<dotted_line_pos> = (176.0, 380.0)
	<dotted_line_add> = ($setlist_solid_line_add)
	begin
	<line> = Random (@ ($setlist_solid_lines [0]) @ ($setlist_solid_lines [1]) @ ($setlist_solid_lines [2]) )
	<solid_line_pos> = (<solid_line_pos> + $setlist_solid_line_add)
	displaysprite parent = setlist_menu tex = <line> pos = <solid_line_pos> dims = (878.0, 16.0) z = ($setlist_page1_z + 0.1)
	repeat 8
	begin
	<line> = Random (@ ($setlist_dotted_lines [0]) @ ($setlist_dotted_lines [1]) @ ($setlist_dotted_lines [2]) )
	<dotted_line_pos> = (<dotted_line_pos> + <dotted_line_add>)
	displaysprite parent = setlist_menu tex = <line> pos = <dotted_line_pos> dims = (878.0, 16.0) z = ($setlist_page1_z + 0.1)
	repeat 8
	<solid_line_pos> = (<solid_line_pos> + $setlist_solid_line_add)
	<dotted_line_pos> = (<dotted_line_pos> + <dotted_line_add>)
	change setlist_solid_line_pos = <solid_line_pos>
	change setlist_dotted_line_pos = <dotted_line_pos>
	change \{setlist_num_songs = 0}
	if english
		setlist_header_tex = setlist_page1_title
	elseif french
		setlist_header_tex = setlist_page1_title_fr
	elseif german
		setlist_header_tex = setlist_page1_title_de
	elseif spanish
		setlist_header_tex = setlist_page1_title_sp
	elseif italian
		setlist_header_tex = setlist_page1_title_it
	elseif korean
		setlist_header_tex = setlist_page1_title
	endif
	if gotparam \{tab_setlist}
		createscreenelement {
			type = spriteelement
			id = sl_page1_title
			parent = setlist_menu
			texture = <setlist_header_tex>
			pos = (330.0, 220.0)
			dims = (512.0, 128.0)
			just = [top left]
			rgba = [100 230 255 255]
			alpha = 0.8
			z_priority = ($setlist_page1_z + 0.2)
			rot_angle = 0
			blend = subtract
			alpha = 0.7
		}
		getuppercasestring ($g_gh3_setlist.tier1.title)
		displaytext id = sl_text_1 parent = setlist_menu scale = (1.0, 1.0) text = <uppercasestring> rgba = (($g_menu_colors).pink) pos = <title_pos> z = $setlist_text_z noshadow
	endif
	if gotparam \{tab_downloads}
		createscreenelement \{parent = setlist_menu
			id = sl_text_1
			text = "DOWNLOADED SONGS"
			font = text_a10
			scale = 2
			pos = (330.0, 220.0)
			just = [
				left
				top
			]
			rgba = [
				50
				30
				20
				255
			]
			z_priority = $setlist_text_z}
		displaysprite parent = setlist_menu tex = setlist_page1_line_red pos = (320.0, 216.0) dims = (8.0, 6400.0) z = ($setlist_page1_z - 0.2)
	endif
	if gotparam \{tab_bonus}
		createscreenelement \{type = textelement
			parent = setlist_menu
			id = sl_text_1
			text = "The Vault"
			font = text_a10
			scale = 2
			pos = (330.0, 220.0)
			just = [
				left
				top
			]
			rgba = [
				50
				30
				20
				255
			]
			z_priority = $setlist_text_z}
		displaysprite parent = setlist_menu tex = setlist_page1_line_red pos = (320.0, 216.0) dims = (8.0, 6400.0) z = ($setlist_page1_z - 0.2)
	endif
	<text_pos> = (<title_pos> + (40.0, 54.0))
	if ((gotparam tab_setlist) || (gotparam tab_bonus) || (gotparam tab_downloads))
		num_tiers = ($g_gh3_setlist.num_tiers)
		<tier> = 0
		change \{setlist_selection_index = 0}
		change \{setlist_selection_tier = 1}
		change \{setlist_selection_song = 0}
		change \{setlist_selection_found = 0}
		begin
		<tier> = (<tier> + 1)
		setlist_prefix = ($g_gh3_setlist.prefix)
		formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
		formattext checksumname = tier_checksum 'tier%s' s = <tier>
		getglobaltags <tiername> param = unlocked
		if (<unlocked> = 1 || $is_network_game = 1)
			if NOT (<tier> = 1)
				<text_pos> = (<text_pos> + (-40.0, 110.0))
				getuppercasestring ($g_gh3_setlist.<tier_checksum>.title)
				displaytext parent = setlist_menu scale = (1.0, 1.0) text = <uppercasestring> rgba = (($g_menu_colors).pink) pos = <text_pos> z = $setlist_text_z noshadow
				<text_pos> = (<text_pos> + (40.0, 50.0))
			elseif NOT (gotparam tab_setlist)
				<text_pos> = (<text_pos> + (-40.0, -54.0))
				getuppercasestring ($g_gh3_setlist.<tier_checksum>.title)
				displaytext parent = setlist_menu scale = (1.0, 1.0) text = <uppercasestring> rgba = [190 75 40 255] pos = <text_pos> z = $setlist_text_z noshadow
				<text_pos> = (<text_pos> + (40.0, 54.0))
			endif
			change \{we_have_songs = false}
			getarraysize ($g_gh3_setlist.<tier_checksum>.songs)
			num_songs = <array_size>
			num_songs_unlocked = 0
			song_count = 0
			if (<array_size> > 0)
				begin
				setlist_prefix = ($g_gh3_setlist.prefix)
				formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <tier> addtostringlookup = true
				for_bonus = 0
				if ($current_tab = tab_bonus)
					<for_bonus> = 1
				endif
				if issongavailable song_checksum = <song_checksum> song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>]) for_bonus = <for_bonus>
					if ($setlist_selection_found = 0)
						change setlist_selection_tier = <tier>
						change setlist_selection_song = <song_count>
						change \{setlist_selection_found = 1}
					endif
					get_song_title song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					get_song_prefix song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					get_song_artist song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					if get_song_covered_by song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
						formattext textname = song_title "%s (cover)*" s = <song_title>
					endif
					formattext \{checksumname = textid
						'id_song%i'
						i = $setlist_num_songs
						addtostringlookup = true}
					createscreenelement {
						type = textelement
						id = <textid>
						parent = setlist_menu
						scale = (0.85, 0.85)
						text = <song_title>
						pos = <text_pos>
						rgba = (($g_menu_colors).dk_violet_grey)
						z_priority = $setlist_text_z
						font = text_a5
						just = [left top]
						font_spacing = 0.5
						no_shadow
						shadow_offs = (1.0, 1.0)
						shadow_rgba = [0 0 0 255]
					}
					getscreenelementdims id = <id>
					fit_text_in_rectangle id = <id> dims = ((475.0, 0.0) + (<height> * (0.0, 1.0))) start_x_scale = 0.85 start_y_scale = 0.85 only_if_larger_x = 1
					if ($game_mode = p2_quickplay)
						get_difficulty_text_nl difficulty = ($current_difficulty_coop)
					else
						get_difficulty_text_nl difficulty = ($current_difficulty)
					endif
					get_song_prefix song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					get_formatted_songname song_prefix = (<song_prefix>) difficulty_text_nl = <difficulty_text_nl>
					if ($is_network_game = 0)
						getglobaltags <song_checksum>
						getglobaltags <songname>
						if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
							get_quickplay_song_stars song = <song_prefix>
						endif
						if NOT ($game_mode = training || $game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
							if progression_isbosssong tier_global = $g_gh3_setlist tier = <tier> song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
								stars = 0
							endif
							if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
								getglobaltags <songname> param = percent100
							else
								getglobaltags <song_checksum> param = percent100
							endif
							if (<stars> > 2)
								<star_space> = (25.0, 0.0)
								<star_pos> = (<text_pos> + (670.0, 10.0))
								begin
								if (<percent100> = 1)
									<star> = setlist_goldstar
								else
									<star> = Random (@ ($setlist_loop_stars [0]) @ ($setlist_loop_stars [1]) @ ($setlist_loop_stars [2]) )
								endif
								<star_pos> = (<star_pos> - <star_space>)
								createscreenelement {
									type = spriteelement
									parent = setlist_menu
									texture = <star>
									just = [center center]
									rgba = [200 220 233 255]
									z_priority = $setlist_text_z
									pos = <star_pos>
									rot_angle = (RandomRange (-20.0, 20.0))
									scale = 0.9
								}
								repeat <stars>
							endif
							getglobaltags <song_checksum> param = score
							if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
								get_quickplay_song_score song = <song_prefix>
							endif
							if (<score> > 0)
								if progression_isbosssong tier_global = $g_gh3_setlist tier = <tier> song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
									if (<score> = 1)
										formattext \{textname = score_text
											"WUSSED OUT"}
									else
										formattext \{textname = score_text
											"BATTLE WON"}
									endif
								else
									formattext textname = score_text "%d" d = <score> usecommas
								endif
								<score_pos> = (<text_pos> + (660.0, 40.0))
								createscreenelement {
									type = textelement
									parent = setlist_menu
									scale = (0.75, 0.75)
									text = <score_text>
									pos = <score_pos>
									rgba = (($g_menu_colors).dk_violet_grey)
									z_priority = $setlist_text_z
									font = text_a5
									just = [right top]
									noshadow
									alpha = 0.8
								}
								getscreenelementdims id = <id>
								fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((130.0, 0.0) + <height> * (0.0, 1.0)) start_x_scale = 0.75 start_y_scale = 0.75
							endif
						endif
					endif
					<text_pos> = (<text_pos> + (60.0, 40.0))
					formattext \{checksumname = artistid
						'artist_id%d'
						d = $setlist_num_songs}
					getuppercasestring <song_artist>
					song_artist = <uppercasestring>
					createscreenelement {
						type = textelement
						parent = setlist_menu
						id = <artistid>
						font = text_a5
						scale = (0.6, 0.6)
						just = [top left]
						text = <song_artist>
						rgba = (($g_menu_colors).dk_violet_grey)
						alpha = 0.5
						pos = <text_pos>
						z_priority = $setlist_text_z
						font_spacing = 1
					}
					getscreenelementdims id = <id>
					fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((425.0, 0.0) + (<height> * (0.0, 1.0))) start_x_scale = 0.6 start_y_scale = 0.6
					<text_pos> = (<text_pos> + (-60.0, 40.0))
					change setlist_num_songs = ($setlist_num_songs + 1)
					num_songs_unlocked = (<num_songs_unlocked> + 1)
					change \{we_have_songs = true}
				endif
				song_count = (<song_count> + 1)
				repeat <num_songs>
				if (($current_tab = tab_bonus) && (<num_songs_unlocked> = 0))
					createscreenelement {
						type = textelement
						parent = setlist_menu
						id = empty_bonus_song_title
						font = text_a5
						scale = 1
						just = [center center]
						text = "(You haven't purchased any songs yet)"
						rgba = (($g_menu_colors).dk_violet_grey)
						pos = (650.0, 470.0)
						z_priority = 50
						font_spacing = 1
					}
					getscreenelementdims id = <id>
					fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((500.0, 0.0) + (<height> * (0.0, 1.0)))
				endif
			endif
			if (($game_mode = p1_career) && (gotparam tab_setlist) && $is_demo_mode = 0)
				getglobaltags <tiername> param = complete
				if (<complete> = 0)
					getglobaltags <tiername> param = boss_unlocked
					getglobaltags <tiername> param = encore_unlocked
					getglobaltags <tiername> param = aerosmith_unlocked
					if (<encore_unlocked> = 1)
						formattext \{textname = completetext
							"Beat encore song to continue"}
					elseif (<aerosmith_unlocked> = 1)
						getglobaltags <tiername> param = num_songs_to_progress
						if (<num_songs_to_progress> = 1)
							formattext textname = completetext "Beat %p Aerosmith song to continue" p = <num_songs_to_progress>
						else
							formattext textname = completetext "Beat %p Aerosmith songs to continue" p = <num_songs_to_progress>
						endif
					elseif (<boss_unlocked> = 1)
						formattext \{textname = completetext
							"Beat boss song to continue"}
					else
						getglobaltags <tiername> param = num_intro_songs_to_progress
						if (<num_intro_songs_to_progress> = 1)
							formattext textname = completetext "Beat %p opening act song to continue" p = <num_intro_songs_to_progress>
						else
							formattext textname = completetext "Beat %p opening act songs to continue" p = <num_intro_songs_to_progress>
						endif
					endif
					createscreenelement {
						type = textelement
						parent = setlist_menu
						scale = (0.6, 0.6)
						text = <completetext>
						font = text_a5
						pos = (<text_pos> + (300.0, 38.0))
						just = [center top]
						z_priority = $setlist_text_z
						rgba = (($g_menu_colors).pink)
					}
					getscreenelementdims id = <id>
					fit_text_in_rectangle id = <id> dims = (<height> * (0.0, 1.0) + (450.0, 0.0)) only_if_larger_x = 1 start_y_scale = 1.1 start_x_scale = 1.1
				endif
			endif
		endif
		repeat <num_tiers>
		setlist_footnote \{alpha = 0}
	endif
	if NOT (($current_tab = tab_bonus) && (<num_songs_unlocked> = 1))
		if (($game_mode = p1_career) && $is_demo_mode = 0)
			get_progression_globals game_mode = ($game_mode)
			summation_career_score tier_global = <tier_global>
			formattext textname = total_score_text "Career Score: %d" d = <career_score> usecommas
			displaytext {
				parent = setlist_menu
				scale = 0.7
				text = <total_score_text>
				pos = ((640.0, 120.0) + (<text_pos>.(0.0, 1.0) * (0.0, 1.0)))
				just = [center top]
				z = $setlist_text_z
				rgba = (($g_menu_colors).dk_violet_grey)
				noshadow
			}
		endif
	endif
	change \{setlist_begin_text = $setlist_menu_pos}
	if ($setlist_num_songs > 0)
		setlist_menu_focus \{id = id_song0}
		setscreenelementprops \{id = id_song0
			shadow}
	endif
	createscreenelement \{type = containerelement
		parent = root_window
		id = sl_fixed
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	<clip_pos> = (160.0, 390.0)
	displaysprite id = sl_clipart parent = sl_fixed pos = <clip_pos> dims = (160.0, 160.0) z = ($setlist_text_z + 0.1) rgba = [200 200 200 255]
	displaysprite id = sl_clipart_shadow parent = sl_fixed pos = (<clip_pos> + (3.0, 3.0)) dims = (160.0, 160.0) z = ($setlist_text_z) rgba = [0 0 0 128]
	<clip_pos> = (<clip_pos> + (15.0, 50.0))
	displaysprite id = sl_clip parent = sl_fixed tex = setlist_clip just = [-0.5 -0.9] pos = <clip_pos> dims = (141.0, 102.0) z = ($setlist_text_z + 0.2)
	if ($current_tab = tab_setlist)
		hilite_dims = (737.0, 80.0)
	elseif ($current_tab = tab_downloads)
		hilite_dims = (722.0, 80.0)
	elseif ($current_tab = tab_bonus)
		hilite_dims = (690.0, 80.0)
	endif
	if gotparam \{tab_bonus}
		createscreenelement {
			type = spriteelement
			id = sl_highlight
			parent = sl_fixed
			texture = white
			just = [left top]
			pos = (326.0, 428.0)
			dims = <hilite_dims>
			z_priority = ($setlist_text_z - 0.1)
			rgba = [200 185 95 110]
		}
	else
		createscreenelement {
			type = spriteelement
			id = sl_highlight
			parent = sl_fixed
			texture = white
			just = [left top]
			pos = (326.0, 428.0)
			dims = <hilite_dims>
			z_priority = ($setlist_text_z - 0.1)
			rgba = [255 250 250 200]
		}
	endif
	<bg_helper_pos> = (140.0, 585.0)
	<helper_rgba> = [105 65 7 160]
	change \{user_control_pill_gap = 100}
	if ($current_tab = tab_setlist)
		setlist_show_helperbar pos = (<bg_helper_pos> + (64.0, 4.0))
	elseif ($current_tab = tab_bonus)
		setlist_show_helperbar {
			pos = (<bg_helper_pos> + (64.0, 4.0))
			text_option1 = "SETLIST"
			text_option2 = "DOWNLOADS"
			button_option1 = "\\b6"
			button_option2 = "\\b8"
		}
	else
		setlist_show_helperbar {
			pos = (<bg_helper_pos> + (64.0, 4.0))
			text_option1 = "SETLIST"
			text_option2 = "BONUS"
			button_option1 = "\\b6"
			button_option2 = "\\b7"
		}
	endif
	displaysprite \{id = sl_overshadow
		rgba = [
			105
			65
			7
			160
		]
		parent = root_window
		tex = setlist_overshadow
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 5.0}
endscript

script setlist_menu_focus 
	if gotparam \{id}
		if screenelementexists id = <id>
			setscreenelementprops id = <id> rgba = (($g_menu_colors).dk_violet_grey)
		endif
	else
		gettags
		printstruct <...>
		setscreenelementprops id = <id> rgba = (($g_menu_colors).dk_violet_grey)
	endif
endscript

script get_quickplay_song_score 
	if ($game_mode = p2_quickplay)
		get_difficulty_text_nl difficulty = ($current_difficulty_coop)
	else
		get_difficulty_text_nl difficulty = ($current_difficulty)
	endif
	get_formatted_songname song_prefix = <song> difficulty_text_nl = <difficulty_text_nl>
	getglobaltags <songname>
	return score = <bestscore>
endscript

script get_quickplay_song_stars 
	if ($game_mode = p2_quickplay)
		get_difficulty_text_nl difficulty = ($current_difficulty_coop)
	else
		get_difficulty_text_nl difficulty = ($current_difficulty)
	endif
	get_formatted_songname song_prefix = <song> difficulty_text_nl = <difficulty_text_nl>
	getglobaltags <songname>
	return stars = <beststars>
endscript

script setlist_show_helperbar \{text_option1 = "THE VAULT"
		button_option1 = "\\b7"
		spacing = 16}
	if ($num_user_control_helpers > 0)
		clean_up_user_control_helpers
		change \{user_control_pill_gap = 100}
	endif
	if NOT english
		change \{pill_helper_max_width = 65}
	endif
	text_options = [
		"UP/DOWN"
		"SELECT"
		"BACK"
	]
	button_options = [
		"\\bb"
		"\\m0"
		"\\m1"
	]
	i = 0
	begin
	if (<i> > 2)
		if (<i> = 3)
			<text1> = <button_option1>
		else
			<text1> = <button_option2>
		endif
	else
		<text1> = (<button_options> [<i>])
	endif
	if (<i> > 2)
		if (<i> = 3)
			<text2> = <text_option1>
		else
			<text2> = <text_option2>
		endif
	else
		<text2> = (<text_options> [<i>])
	endif
	switch <text1>
		case "\\bb"
		<button> = strumbar
		case "\\m0"
		<button> = green
		case "\\m1"
		<button> = red
		case "\\b6"
		<button> = yellow
		case "\\b7"
		<button> = blue
	endswitch
	change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	if ($is_network_game = 1)
		if ishost
			if ($host_songs_to_pick > 0)
				if NOT (($g_tie_breaker_song = 1) && (<i> = 2))
					add_user_control_helper text = <text2> button = <button> z = 100
				endif
			endif
		else
			if ($client_songs_to_pick > 0)
				if NOT (($g_tie_breaker_song = 1) && (<i> = 2))
					add_user_control_helper text = <text2> button = <button> z = 100
				endif
			elseif (<i> = 2)
				add_user_control_helper text = <text2> button = <button> z = 100
			endif
		endif
	else
		add_user_control_helper text = <text2> button = <button> z = 100
	endif
	<i> = (<i> + 1)
	repeat 4
	tabs_text = ["setlist" "the Vault"]
	setlist_text_positions = [(300.0, 70.0) (624.0, 102.0)]
	buttons_text = ["\\b7" "\\b6" "\\b8"]
	setlist_button_positions = [(580.0, 90.0) (260.0, 65.0)]
	i = 0
	begin
	button_text_pos = (<setlist_button_positions> [<i>])
	createscreenelement {
		type = textelement
		parent = setlist_menu
		scale = 1
		text = (<buttons_text> [<i>])
		rgba = [128 128 128 255]
		pos = <button_text_pos>
		z_priority = 50
		font = buttonsxenon
		just = [left top]
	}
	tab_text_pos = (<setlist_text_positions> [<i>])
	createscreenelement {
		type = textelement
		parent = setlist_menu
		font = text_a5
		scale = 1
		text = (<tabs_text> [<i>])
		rgba = [0 0 0 255]
		pos = <tab_text_pos>
		z_priority = 50
		just = [left top]
	}
	getscreenelementdims id = <id>
	fit_text_in_rectangle id = <id> dims = ((185.0, 0.0) + (<height> * (0.0, 1.0))) start_x_scale = 1 start_y_scale = 1 only_if_larger_x = 1
	<i> = (<i> + 1)
	repeat 2
endscript
