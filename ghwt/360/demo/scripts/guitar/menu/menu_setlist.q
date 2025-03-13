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
		dims = (450.0, 450.0)
		minrot = -10
		maxrot = 70
		loffset = (30.0, 0.0)
		only_left
		center_just
	}
	{
		texture = setlist_ernieball
		dims = (384.0, 384.0)
		only_right
		roffset = (100.0, 0.0)
	}
	{
		texture = setlist_button_gunsnroses
		dims = (256.0, 256.0)
		loffset = (-50.0, 0.0)
		roffset = (50.0, 0.0)
	}
]
setlist_solid_lines = [
	setlist_page1_line_solid_1
	setlist_page1_line_solid_2
	setlist_page1_line_solid_3
]
setlist_dotted_lines = [
	setlist_page1_line_dotted_1
	setlist_page1_line_dotted_2
	setlist_page1_line_dotted_3
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
		pad_l1
		change_tab
		params = {
			tab = tab_downloads
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
setlist_page3_pos = (210.0, 86.0)
setlist_page3_num = 0
setlist_page3_dims = (1254.0, 533.0)
setlist_page2_pos = (240.0, 50.0)
setlist_page2_num = 0
setlist_page2_dims = (819.0, 666.0)
setlist_page1_dims = (922.0, 512.0)
setlist_text_z = 4.1
g_gh3_setlist = null
current_tab = tab_setlist
setlist_page1_z = 0
setlist_page2_z = 0
setlist_page3_z = 0
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
		text = qs(0x19ae614c)
		font = fontgrid_text_a3
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
		text = qs(0xc1ebfea3)
		just = [center top]
		font = fontgrid_text_a3
		pos = (<pos> + (0.0, 25.0))
		z = 502
		scale = (0.72499996, 0.5)
		rgba = [0 0 0 255]
		noshadow
	}
	fit_text_in_rectangle id = <id> dims = (90.0, 15.0)
	legacydoscreenelementmorph id = setlist_original_artist alpha = 1 time = <time>
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
	elseif ($current_tab = tab_downloads)
		song_icon = setlist_icon_download
	else
		song_icon = setlist_icon_generic
	endif
	mini_rot = RandomInteger (-5.0, 5.0)
	if screenelementexists \{id = sl_clipart}
		setscreenelementprops id = sl_clipart texture = <song_icon>
		legacydoscreenelementmorph id = sl_clipart alpha = 1 time = 0.25 rot_angle = <mini_rot>
	endif
	if screenelementexists \{id = sl_clipart_shadow}
		setscreenelementprops id = sl_clipart_shadow texture = <song_icon>
		legacydoscreenelementmorph id = sl_clipart_shadow alpha = 1 time = 0.25 rot_angle = <mini_rot>
	endif
	if screenelementexists \{id = sl_clip}
		getscreenelementprops \{id = sl_clip}
		rot_clip_a = <rot_angle>
		rot_clip_b = (<rot_clip_a> + 10)
		setscreenelementprops id = sl_clip rot_angle = <rot_clip_b>
		legacydoscreenelementmorph id = sl_clip alpha = 1 rot_angle = <rot_clip_a> time = 0.25
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
	printf \{qs(0x7ea206ac)}
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
			target = current_menu}
	endif
	begin
	if ($changing_tab = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	if ($is_network_game = 1)
		quit_network_game
		change \{net_new_matchmaking_ui_flag = 0}
		generic_event_back \{state = uistate_online}
	else
		generic_event_back
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
		<id> :se_setprops flip_v
	endif
	if gotparam \{flip_h}
		<id> :se_setprops flip_h
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
		font = fontgrid_text_a6
		rot = 0}
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
		<id> :se_setprops noshadow
	else
		<id> :se_setprops shadow shadow_offs = (3.0, 3.0) shadow_rgba [0 0 0 255]
	endif
	return id = <id>
endscript

script create_setlist_menu 
	setsoundbussparams {music_setlist = {vol = ($default_bussset.music_setlist.vol)}}
	if ($is_network_game = 1)
		change \{current_tab = tab_setlist}
		change \{setlist_previous_tier = 1}
		change \{setlist_previous_song = 0}
		change \{setlist_previous_tab = tab_setlist}
	endif
	if ($end_credits = 1 && $current_song = bossdevil)
		progression_endcredits
		return
	endif
	change \{boss_wuss_out = 0}
	change \{progression_unlocked_guitar = -1}
	change \{progression_unlocked_guitar2 = -1}
	change \{rich_presence_context = presence_gigboard_and_setlist}
	menu_music_off
	if ($special_event_stage != 0)
		get_progression_globals game_mode = ($special_event_previous_game_mode) ($band_mode_mode)
	else
		get_progression_globals game_mode = ($game_mode) ($band_mode_mode)
	endif
	change g_gh3_setlist = $<tier_global>
	create_setlist_scrolling_menu
	change \{setlist_page3_z = 3.3}
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
		target = current_menu}
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
	setsoundbussparams {music_setlist = {vol = ($default_bussset.music_setlist.vol)}}
	spawnscriptlater \{setlist_songpreview_monitor}
endscript

script create_setlist_scrolling_menu 
	disable_pause
	unpausegame
	if ($player1_status.bot_play = 1)
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_career ||
				$game_mode = p2_faceoff ||
				$game_mode = p2_pro_faceoff ||
				$game_mode = p2_battle ||
				$game_mode = p2_quickplay)
			removeparameter \{exclusive_device}
			get_all_exclusive_devices
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	new_menu {
		scrollid = scrolling_setlist
		vmenuid = current_menu
		tierlist = $g_gh3_setlist
		use_backdrop = 0
		no_wrap
		z = -1
		event_handlers = $setlist_event_handlers
		on_choose = setlist_choose_song
		on_right = setlist_debug_completesong
		on_l3 = setlist_debug_unlockall
		on_left = setlist_debug_unlockall
		exclusive_device = <exclusive_device>
		use_all_controllers
	}
	if ($is_network_game = 1)
		if ($current_tab = tab_downloads)
			net_dl_content_compatabilty_warning \{parent = gamertag_container
				z = 10000
				pos = (320.0, 580.0)}
		else
			if screenelementexists \{id = dl_content_warning}
				destroyscreenelement \{id = dl_content_warning}
			endif
		endif
	endif
	set_focus_color \{rgba = [
			200
			120
			0
			250
		]}
	set_unfocus_color \{rgba = [
			50
			30
			10
			255
		]}
endscript

script destroy_setlist_scrolling_menu 
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
		songstoppreview
	endif
endscript

script destroy_setlist_menu 
	killspawnedscript \{name = net_match_download_songs}
	spawnscriptnow \{destroy_setlist_songpreview_monitor}
	change setlist_previous_tier = ($setlist_selection_tier)
	change setlist_previous_song = ($setlist_selection_song)
	change setlist_previous_tab = ($current_tab)
	change \{target_setlist_songpreview = none}
	destroy_menu \{menu_id = setlist_original_artist}
	destroy_menu \{menu_id = scrolling_setlist}
	destroy_menu \{menu_id = setlist_menu}
	destroy_menu \{menu_id = setlist_loops_menu}
	destroy_menu \{menu_id = setlist_bg_container}
	reset_vars \{del}
	clean_up_user_control_helpers
	destroy_net_ui
	destroy_setlist_popup
endscript

script setlist_choose_song \{device_num = 0}
	printf \{qs(0x4de9c7b5)}
	printstruct <...>
	if gotparam \{song_count}
		if ($is_network_game = 1)
			if ($net_new_matchmaking_ui_flag = 1)
				if ($net_permision_to_select_song = 1)
					net_request_song tier = <tier> song_count = <song_count>
				else
					return
				endif
			else
				net_request_song tier = <tier> song_count = <song_count>
			endif
		else
			if ($transitions_locked = 0)
				launchevent \{type = unfocus
					target = current_menu}
			endif
			formattext checksumname = tier_checksum 'tier%s' s = <tier>
			change current_song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
			setglobaltags progression params = {current_tier = <tier>}
			setglobaltags progression params = {current_song_count = <song_count>}
			change \{current_level = $g_last_venue_selected}
			if ($is_network_game)
				ui_flow_manager_respond_to_action \{action = continue}
				return
			endif
			if ($top_rockers_enabled)
				generic_event_choose \{state = uistate_top_rockers
					data = {
						for_options = 1
					}}
			elseif ($practice_enabled)
				practice_check_song_for_parts
			else
				if ($current_num_players = 1)
					change player1_device = <device_num>
				endif
				switch ($game_mode)
					case p2_faceoff
					case p2_pro_faceoff
					case p2_coop
					case p2_battle
					case p1_quickplay
					generic_event_choose \{state = uistate_select_difficulty}
					default
					generic_event_choose \{state = uistate_play_song}
				endswitch
			endif
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
		cas_destroy_all_characters
		load_songqpak song_name = ($current_song) async = 0
		setup_gemarrays song_name = ($current_song) difficulty = ($player1_status.difficulty) player_status = player1_status
		calc_songscoreinfo
		change structurename = player1_status score = ($player1_status.base_score * 2.8 + 1)
		progression_songwon
		if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
			menu_top_rockers_check_for_new_top_score
		endif
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
			target = current_menu}
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
		globaltags_unlockall \{songlist = bonus_songs}
		change \{structurename = player1_status
			notes_hit = 100}
		change \{structurename = player1_status
			total_notes = 100}
		change \{structurename = player2_status
			notes_hit = 100}
		change \{structurename = player2_status
			total_notes = 100}
		if ($game_mode = p1_career || $game_mode = p2_career)
			updateatoms \{name = progression}
		endif
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
			target = current_menu}
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
		format_globaltag_song_checksum part = ($g_gh3_setlist.part) song = ($g_gh3_setlist.<tier_checksum>.songs [($setlist_selection_song)])
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
		format_globaltag_song_checksum part = ($g_gh3_setlist.part) song = (.<tier_checksum>.songs [($setlist_selection_song)])
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
	if ($current_tab = tab_setlist)
		if (<jump_tier> = 1)
			change setlist_begin_text = ($setlist_begin_text + <jump_tier_amt>)
			setscreenelementprops \{id = scrolling_setlist
				pos = $setlist_begin_text}
			change setlist_background_pos = ($setlist_background_pos + <jump_tier_amt>)
			<not_header> = 0
		endif
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
				tex = setlist_bg_loop_1308
				pos = $setlist_background_loop_pos
				dims = (1280.0, 1308.0)
				z = 3.1}
		endif
		change setlist_page1_num = ($setlist_page1_num + 1)
		if ($setlist_page1_num = 4)
			change \{setlist_page1_num = 0}
			change setlist_page1_loop_pos = ($setlist_page1_loop_pos + (0.0, 512.0))
			displaysprite \{parent = setlist_loops_menu
				tex = setlist_page1_loop_89x33
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
					tex = setlist_page2_loop_80x65
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
				tex = setlist_page3_loop_13x11
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
		displaysprite parent = setlist_bg_container tex = <myimage> pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 3.2 blendmode = subtract
		displaysprite parent = setlist_bg_container tex = <myimage> pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 3.2 blendmode = subtract
		displaysprite parent = setlist_bg_container tex = <myimage> pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 3.2 blendmode = subtract
	else
		displaysprite parent = setlist_bg_container tex = <myimage> pos = <imagepos> dims = <mydims> rot_angle = <randrot> z = 6.0 <imageflag> just = <just>
		displaysprite parent = setlist_bg_container tex = <myimage> pos = <imagepos> dims = <mydims> rot_angle = <randrot> z = 6.0 <imageflag> just = <just>
	endif
	<side> = 1
	repeat 2
endscript

script setlist_songpreview_monitor 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	begin
	if ($setlist_songpreview_changing = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	killspawnedscript \{name = destroy_setlist_songpreview_monitor}
	songstoppreview
	begin
	if NOT ($current_setlist_songpreview = $target_setlist_songpreview)
		change \{setlist_songpreview_changing = 1}
		song = ($target_setlist_songpreview)
		current_song = ($current_setlist_songpreview)
		if NOT (<current_song> = none)
			songstoppreview
		endif
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
			if songcheckifdownloaded filename = <song_prefix>
				if NOT downloads_opencontentfolder content_index = <content_index>
					downloadcontentlost
					return \{false}
				endif
			endif
			if is_song_downloaded song_checksum = <song>
				if NOT songplaypreview filename = <song_prefix> content_index = <content_index>
					change \{setlist_songpreview_changing = 0}
					downloadcontentlost
					return
				endif
			endif
			get_song_struct song = <song>
			change current_setlist_songpreview = <song>
			change \{setlist_songpreview_changing = 0}
		endif
	elseif NOT ($current_setlist_songpreview = none)
		song = ($current_setlist_songpreview)
		get_song_prefix song = <song>
		if NOT songispreviewplaying
			change \{setlist_songpreview_changing = 1}
			if songcheckifdownloaded filename = <song_prefix>
				if NOT downloads_opencontentfolder content_index = <content_index>
					return \{false}
				endif
			endif
			if is_song_downloaded song_checksum = <song>
				if NOT songplaypreview filename = <song_prefix> content_index = <content_index>
					change \{setlist_songpreview_changing = 0}
					downloadcontentlost
					return
				endif
			endif
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
	elseif (<tab> = tab_downloads)
		if NOT ($current_tab = <tab>)
			menu_setlist_downloads_tab_sound
		endif
		get_progression_globals game_mode = ($game_mode) download
	endif
	change g_gh3_setlist = $<tier_global>
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
		change \{setlist_page3_z = 3.3}
		change \{setlist_page2_z = 3.4}
		change \{setlist_page1_z = 3.5}
		displaysprite \{parent = setlist_loops_menu
			tex = setlist_page1_loop_89x33
			pos = $setlist_page1_loop_pos
			dims = $setlist_page1_dims
			z = $setlist_page1_z}
		displaysprite parent = setlist_loops_menu tex = setlist_page3_loop_13x11 pos = ($setlist_page3_pos + (-180.0, 614.0)) dims = $setlist_page3_dims z = $setlist_page3_z
		case tab_downloads
		change \{setlist_page3_z = 3.5}
		change \{setlist_page2_z = 3.4}
		change \{setlist_page1_z = 3.3}
		displaysprite \{parent = setlist_loops_menu
			tex = setlist_page1_loop_89x33
			pos = $setlist_page1_loop_pos
			dims = $setlist_page1_dims
			z = $setlist_page1_z}
		change setlist_page3_pos = ($setlist_page3_pos + (0.0, 40.0))
		displaysprite parent = setlist_loops_menu tex = setlist_page3_loop_13x11 pos = ($setlist_page3_pos + (-180.0, 614.0)) dims = $setlist_page3_dims z = $setlist_page3_z
		case tab_bonus
		change \{setlist_page3_z = 3.3}
		change \{setlist_page2_z = 3.8}
		change \{setlist_page1_z = 3.4}
		displaysprite \{parent = setlist_loops_menu
			tex = setlist_page1_loop_89x33
			pos = $setlist_page1_loop_pos
			dims = $setlist_page1_dims
			z = $setlist_page1_z}
		displaysprite parent = setlist_loops_menu tex = setlist_page3_loop_13x11 pos = ($setlist_page3_pos + (-180.0, 614.0)) dims = $setlist_page3_dims z = $setlist_page3_z
		displaysprite parent = setlist_loops_menu tex = setlist_page2_loop_80x65 pos = ($setlist_page2_pos + (0.0, 553.0)) dims = $setlist_page2_dims z = $setlist_page2_z
	endswitch
	create_sl_assets <tab>
	setscreenelementprops \{id = setlist_bg_container
		pos = (0.0, 0.0)}
	change \{setlist_random_images_scroll_num = 0}
	change setlist_page2_pos = ($setlist_page2_pos + (0.0, 553.0))
	change setlist_page3_pos = ($setlist_page3_pos + (-180.0, 614.0))
	setscreenelementprops \{id = sl_page3_head
		z_priority = $setlist_page3_z}
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
	launchevent \{type = focus
		target = current_menu}
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
	change \{setlist_page3_pos = (210.0, 86.0)}
	change \{setlist_page3_num = 0}
	change \{setlist_page2_num = 0}
	change \{setlist_page2_pos = (240.0, 50.0)}
	change \{setlist_line_index = 0}
	change \{setlist_clip_last_rot = 0}
	change \{setlist_clip_rot_neg = 0}
endscript
onlinebetasongs = [
	areyougonnagomyway
	nevertoolate
	whativedone
]

script issongavailable \{for_bonus = 0}
	gamemode_gettype
	check_allowed_in_quickplay = 0
	if (($is_network_game = 1) || (<type> = quickplay) || (<type> = training))
		check_allowed_in_quickplay = 1
	endif
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
		check_allowed_in_quickplay = 1
	endif
	if (<check_allowed_in_quickplay> = 1)
		get_song_allowed_in_quickplay song = <song>
		if (<allowed_in_quickplay> = 0)
			return \{false}
		endif
	endif
	if structurecontains structure = ($gh_songlist_props.<song>) never_show_in_setlist
		return \{false}
	endif
	if ($is_network_game = 1)
		if structurecontains structure = ($gh_songlist_props.<song>) doesnt_support_vocals
			gamemode_getnumplayers
			<player_idx> = 1
			begin
			getplayerinfo <player_idx> part
			if (<part> = vocals)
				return \{false}
			endif
			<player_idx> = (<player_idx> + 1)
			repeat <num_players>
		endif
		if NOT is_song_downloaded song_checksum = <song>
			return \{false}
		endif
		if globaltagexists <song> noassert = 1
			getglobaltags <song>
			if ($net_match_dlc_sync_finished = 1)
				if (<available_on_other_client> = 0)
					return \{false}
				endif
			elseif (<download> = 1)
				return \{false}
			endif
		endif
		if ($is_multiplayer_beta = 0)
			get_song_saved_in_globaltags song = <song>
			if (<saved_in_globaltags> = 1)
				return \{true}
			endif
		else
			getarraysize \{$onlinebetasongs}
			if (<array_size> > 0)
				index = 0
				begin
				if (<song> = ($onlinebetasongs [<index>]))
					return \{true}
				endif
				<index> = (<index> + 1)
				repeat <array_size>
			endif
		endif
	else
		if structurecontains structure = ($gh_songlist_props.<song>) doesnt_support_vocals
			gamemode_getnumplayers
			gamemode_getproperty \{prop = cooperative}
			if (<cooperative> = false)
				gamemode_getproperty \{prop = faceoff}
				<should_disallow_vocals> = false
				if (<num_players> = 2 && <faceoff> = true)
					<should_disallow_vocals> = true
				elseif (<num_players> = 1)
					<should_disallow_vocals> = true
				endif
				if (<should_disallow_vocals> = true)
					<player_idx> = 1
					begin
					getplayerinfo <player_idx> controller
					if NOT isguitarcontroller controller = <controller>
						if NOT isdrumcontroller controller = <controller>
							return \{false}
						endif
					endif
					<player_idx> = (<player_idx> + 1)
					repeat <num_players>
				endif
			endif
		endif
		if NOT is_song_downloaded song_checksum = <song>
			return \{false}
		endif
		if (<download> = 1)
			return \{true}
		endif
		if structurecontains structure = ($gh_songlist_props.<song>) always_unlocked
			return \{true}
		endif
		get_song_saved_in_globaltags song = <song>
		if (<saved_in_globaltags> = 1)
			getglobaltags <song> param = unlocked
			if (<unlocked> = 1)
				return \{true}
			endif
			getglobaltags \{user_options}
			if (<cheat_index13> = 1)
				if (<song> != pullmeunder)
					return \{true}
				endif
			endif
		endif
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
		tex = setlist_bg_head_676
		pos = (0.0, 0.0)
		dims = (1280.0, 676.0)
		z = 3.1}
	displaysprite \{id = sl_bg_loop
		parent = setlist_menu
		tex = setlist_bg_loop_1308
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
		blendmode = subtract}
	repeat 3
	displaysprite \{id = sl_page3_head
		parent = setlist_menu
		tex = setlist_page3_head_9x6
		pos = $setlist_page3_pos
		dims = (922.0, 614.0)
		z = $setlist_page3_z}
	displaysprite \{id = sl_page2_head
		parent = setlist_menu
		tex = setlist_page2_head_80x54
		pos = $setlist_page2_pos
		dims = (819.0, 553.0)
		z = $setlist_page2_z}
	displaysprite \{flip_h
		id = sl_page1_head
		parent = setlist_menu
		tex = setlist_page1_head_90x75
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
	displaysprite parent = setlist_menu tex = <line> pos = <solid_line_pos> dims = (883.0, 16.0) z = ($setlist_page1_z + 0.1)
	repeat 8
	begin
	<line> = Random (@ ($setlist_dotted_lines [0]) @ ($setlist_dotted_lines [1]) @ ($setlist_dotted_lines [2]) )
	<dotted_line_pos> = (<dotted_line_pos> + <dotted_line_add>)
	displaysprite parent = setlist_menu tex = <line> pos = <dotted_line_pos> dims = (883.0, 16.0) z = ($setlist_page1_z + 0.1)
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
	endif
	if gotparam \{tab_setlist}
		displaysprite id = sl_page1_title parent = setlist_menu tex = <setlist_header_tex> pos = (330.0, 220.0) dims = (512.0, 128.0) alpha = 0.7 z = ($setlist_page1_z + 0.2) rot_angle = 0
		displaysprite parent = sl_page1_title tex = <setlist_header_tex> pos = (-5.0, 10.0) dims = (512.0, 128.0) alpha = 0.2 z = ($setlist_page1_z + 0.2) rot_angle = -2
		getuppercasestring ($g_gh3_setlist.tier1.title)
		displaytext id = sl_text_1 parent = setlist_menu scale = (1.0, 1.0) text = <uppercasestring> rgba = [195 80 45 255] pos = <title_pos> z = $setlist_text_z noshadow
	endif
	if gotparam \{tab_downloads}
		displaytext \{parent = setlist_menu
			id = sl_text_1
			text = qs(0xd5a8875f)
			font = fontgrid_text_a10
			scale = 2
			pos = (330.0, 220.0)
			rgba = [
				50
				30
				20
				255
			]
			z = $setlist_text_z
			noshadow}
		displaysprite parent = setlist_menu tex = setlist_page1_line_red pos = (320.0, 216.0) dims = (8.0, 6400.0) z = ($setlist_page1_z - 0.2)
	endif
	if gotparam \{tab_bonus}
		displaytext \{parent = setlist_menu
			id = sl_text_1
			text = qs(0xa8cdde4f)
			font = fontgrid_text_a10
			scale = 2
			pos = (330.0, 220.0)
			rgba = [
				50
				30
				20
				255
			]
			z = $setlist_text_z
			noshadow}
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
		unlocked = 1
		if (<unlocked> = 1 || $is_network_game = 1)
			if NOT (<tier> = 1)
				<text_pos> = (<text_pos> + (-40.0, 110.0))
				getuppercasestring ($g_gh3_setlist.<tier_checksum>.title)
				displaytext parent = setlist_menu scale = (1.0, 1.0) text = <uppercasestring> rgba = [190 75 40 255] pos = <text_pos> z = $setlist_text_z noshadow
				<text_pos> = (<text_pos> + (40.0, 50.0))
			endif
			change \{we_have_songs = false}
			getarraysize ($g_gh3_setlist.<tier_checksum>.songs)
			num_songs = <array_size>
			num_songs_unlocked = 0
			song_count = 0
			if (<array_size> > 0)
				begin
				setlist_prefix = ($g_gh3_setlist.prefix)
				format_globaltag_song_checksum part = ($g_gh3_setlist.part) song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
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
						rgba = [50 30 10 255]
						z_priority = $setlist_text_z
						font = fontgrid_text_a6
						just = [left top]
						font_spacing = 0.5
						no_shadow
						shadow_offs = (1.0, 1.0)
						shadow_rgba = [0 0 0 255]
					}
					if ($game_mode = p2_quickplay)
						get_difficulty_text_nl difficulty = ($current_difficulty_coop)
					else
						get_difficulty_text_nl difficulty = ($player1_status.difficulty)
					endif
					get_song_prefix song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					get_formatted_songname song_prefix = (<song_prefix>) difficulty_text_nl = <difficulty_text_nl>
					getglobaltags <song_checksum>
					getglobaltags <songname>
					if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
						get_quickplay_song_stars song = <song_prefix>
					endif
					if NOT ($game_mode = training || $game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
						if progression_isbosssong tier_global = g_gh3_setlist tier = <tier> song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
							stars = 0
						endif
						if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
							getglobaltags <songname> param = tr_percent100
							percent100 = <tr_percent100>
						else
							getglobaltags <song_checksum> param = percent100
						endif
						if (<stars> > 2)
							<star_space> = (20.0, 0.0)
							<star_pos> = (<text_pos> + (660.0, 0.0))
							begin
							if (<percent100> = 1)
								<star> = setlist_star_gold
							else
								<star> = Random (@ ($setlist_loop_stars [0]) @ ($setlist_loop_stars [1]) @ ($setlist_loop_stars [2]) )
							endif
							<star_pos> = (<star_pos> - <star_space>)
							displaysprite parent = setlist_menu tex = <star> rgba = [233 205 166 255] z = $setlist_text_z pos = <star_pos>
							repeat <stars>
						endif
						getglobaltags <song_checksum> param = score
						if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
							get_quickplay_song_score song = <song_prefix>
						endif
						if (<score> > 0)
							if progression_isbosssong tier_global = g_gh3_setlist tier = <tier> song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
								if (<score> = 1)
									formattext \{textname = score_text
										qs(0x1492cc88)}
								else
									formattext \{textname = score_text
										qs(0x7086f260)}
								endif
							else
								formattext textname = score_text qs(0x76b3fda7) d = <score> usecommas
							endif
							<score_pos> = (<text_pos> + (660.0, 40.0))
							createscreenelement {
								type = textelement
								parent = setlist_menu
								scale = (0.75, 0.75)
								text = <score_text>
								pos = <score_pos>
								rgba = [100 120 160 255]
								z_priority = $setlist_text_z
								font = fontgrid_text_a6
								just = [right top]
								noshadow
							}
						endif
					endif
					<text_pos> = (<text_pos> + (60.0, 40.0))
					formattext \{checksumname = artistid
						'artist_id%d'
						d = $setlist_num_songs}
					getuppercasestring <song_artist>
					song_artist = <uppercasestring>
					displaytext parent = setlist_menu scale = (0.6, 0.6) id = <artistid> text = <song_artist> rgba = [60 100 140 255] pos = <text_pos> z = $setlist_text_z font_spacing = 1 noshadow
					<text_pos> = (<text_pos> + (-60.0, 40.0))
					change setlist_num_songs = ($setlist_num_songs + 1)
					num_songs_unlocked = (<num_songs_unlocked> + 1)
					change \{we_have_songs = true}
				endif
				song_count = (<song_count> + 1)
				repeat <num_songs>
			endif
		endif
		repeat <num_tiers>
	endif
	if ((($game_mode = p1_career) || ($game_mode = p2_career)) && $is_demo_mode = 0)
		get_progression_globals game_mode = ($game_mode)
		summation_career_score tier_global = <tier_global>
		formattext textname = total_score_text qs(0x7b2c5967) d = <career_score> usecommas
		displaytext {
			parent = setlist_menu
			scale = 0.7
			text = <total_score_text>
			pos = ((640.0, 120.0) + (<text_pos>.(0.0, 1.0) * (0.0, 1.0)))
			just = [center top]
			z = $setlist_text_z
			rgba = [30 30 30 255]
			noshadow
		}
	endif
	change \{setlist_begin_text = $setlist_menu_pos}
	if ($setlist_num_songs > 0)
		retail_menu_focus \{id = id_song0}
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
	displaysprite id = sl_highlight parent = sl_fixed tex = white pos = (326.0, 428.0) dims = <hilite_dims> z = ($setlist_text_z - 0.1) rgba = [255 255 255 128]
	<bg_helper_pos> = (140.0, 585.0)
	<helper_rgba> = [105 65 7 160]
	change \{user_control_pill_gap = 100}
	if ($current_tab = tab_setlist)
		setlist_show_helperbar pos = (<bg_helper_pos> + (64.0, 4.0))
	elseif ($current_tab = tab_bonus)
		setlist_show_helperbar {
			pos = (<bg_helper_pos> + (64.0, 4.0))
			text_option1 = qs(0x3c1b3ab6)
			text_option2 = qs(0x271e2cfc)
			button_option1 = qs(0x9e1f95ce)
			button_option2 = qs(0xc8453248)
		}
	else
		setlist_show_helperbar {
			pos = (<bg_helper_pos> + (64.0, 4.0))
			text_option1 = qs(0x3c1b3ab6)
			text_option2 = qs(0x2e900a4e)
			button_option1 = qs(0x9e1f95ce)
			button_option2 = qs(0x8704a48f)
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

script get_quickplay_song_score 
	if NOT gotparam \{difficulty_text_nl}
		if ($game_mode = p2_quickplay)
			get_difficulty_text_nl difficulty = ($current_difficulty_coop)
		else
			get_difficulty_text_nl difficulty = ($player1_status.difficulty)
		endif
	endif
	if NOT gotparam \{part}
		part = 'guitar'
	endif
	get_formatted_songname song_prefix = <song> difficulty_text_nl = <difficulty_text_nl> part = <part>
	getglobaltags <songname>
	return score = <bestscore>
endscript

script get_quickplay_song_stars 
	if NOT gotparam \{part}
		part = 'guitar'
	endif
	get_formatted_songname song_prefix = <song> difficulty_text_nl = <difficulty_text_nl> part = <part>
	getglobaltags <songname>
	return stars = <beststars> percent100 = <tr_percent100>
endscript

script setlist_show_helperbar \{text_option1 = qs(0x2e900a4e)
		text_option2 = qs(0x271e2cfc)
		button_option1 = qs(0x8704a48f)
		button_option2 = qs(0xc8453248)
		spacing = 16}
endscript

script setlist_return_to_2p_hub 
	ui_event_block \{event = menu_back}
endscript
