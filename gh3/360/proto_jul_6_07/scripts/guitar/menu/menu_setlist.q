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
		roffset = (120.0, 0.0)
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
		dims = (384.0, 384.0)
		minrot = -30
		maxrot = -40
		loffset = (-210.0, 0.0)
		roffset = (-40.0, 0.0)
	}
	{
		texture = setlist_ernieball
		dims = (384.0, 384.0)
		loffset = (-210.0, 0.0)
		roffset = (120.0, 0.0)
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

script display_as_made_famous_by rot_angle = -7 time = 0.25
	destroy_menu menu_id = setlist_original_artist
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
	if NOT gotparam no_wait
		wait 0.5 seconds
	endif
	if gotparam song
		0xc5106957 song = <song>
	else
		0xc5106957 song = ($target_setlist_songpreview)
		<song> = ($target_setlist_songpreview)
	endif
	0xa911e9bc = [
		[170 140 185 255] ,
		[130 160 195 255] ,
		[120 195 195 255] ,
		[130 190 150 255] ,
		[190 200 120 255] ,
		[210 180 120 255] ,
		[225 160 145 255] ,
		[230 145 170 255] ,
	]
	if ($current_tab = tab_setlist)
		get_tier_from_song song = <song>
		0xe2923427 = (<0xa911e9bc> [(<tier_number> - 1)])
	elseif ($current_tab = tab_downloads)
		0xe2923427 = (<0xa911e9bc> [0])
		song_icon = setlist_icon_download
	else
		0xe2923427 = (<0xa911e9bc> [0])
		song_icon = setlist_icon_generic
	endif
	if screenelementexists id = sl_clipart
		setscreenelementprops id = sl_clipart texture = <song_icon> rgba = <0xe2923427>
		doscreenelementmorph id = sl_clipart alpha = 1 time = 0.25
	endif
	if screenelementexists id = sl_clipart_shadow
		setscreenelementprops id = sl_clipart_shadow texture = <song_icon>
		doscreenelementmorph id = sl_clipart_shadow alpha = 1 time = 0.25
	endif
	if screenelementexists id = sl_clip
		getscreenelementprops id = sl_clip
		rot_clip_a = <rot_angle>
		rot_clip_b = (<rot_clip_a> + 10)
		setscreenelementprops id = sl_clip rot_angle = <rot_clip_b>
		doscreenelementmorph id = sl_clip alpha = 1 rot_angle = <rot_clip_a> time = 0.25
	endif
	get_song_original_artist song = <song>
	if (<original_artist> = 0)
		if screenelementexists id = sl_clipart
			getscreenelementprops id = sl_clipart
			display_as_made_famous_by pos = (<pos> + (110.0, 120.0)) time = 0.25
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
	if ($is_network_game = 1)
		net_setlist_go_back
	else
		ui_flow_manager_respond_to_action \{action = go_back
			create_params = {
				player = $current_num_players
			}}
	endif
endscript

script displaysprite just = [left top] rgba = [255 255 255 255] dims = {} rot_angle = 0 blendmode = {} internal_just = {} scale = {} alpha = 1
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
		rot_angle = <rot_angle>
		blend = <blendmode>
		alpha = <alpha>
	}
	if gotparam flip_v
		<id> :setprops flip_v
	endif
	if gotparam flip_h
		<id> :setprops flip_h
	endif
	return id = <id>
endscript

script displaytext id = {} just = [left top] rgba = [210 130 0 250] font = text_a5 rot = 0
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
	}
	if gotparam noshadow
		<id> :setprops noshadow
	else
		<id> :setprops shadow shadow_offs = (3.0, 3.0) shadow_rgba [0 0 0 255]
	endif
	return id = <id>
endscript

script create_setlist_menu 
	if ($end_credits = 1 && $current_song = bossdevil)
		menu_music_off
		playmovieandwait movie = 'end'
		progression_endcredits
		return
	endif
	if ($progression_play_completion_movie = 1)
		get_progression_globals game_mode = ($game_mode)
		formattext checksumname = tiername 'tier%i' i = ($progression_completion_tier)
		if structurecontains structure = ($<tier_global>.<tiername>) completion_movie
			menu_music_off
			playmovieandwait movie = ($<tier_global>.<tiername>.completion_movie)
		endif
		change progression_play_completion_movie = 0
	endif
	change rich_presence_context = presence_song_list
	menu_music_off
	get_progression_globals game_mode = ($game_mode)
	change g_gh3_setlist = <tier_global>
	create_setlist_scrolling_menu
	change setlist_page3_z = 3.3
	change setlist_page2_z = 3.4
	change setlist_page1_z = 3.5
	change setlist_random_images_scroll_num = 0
	change setlist_random_images_highest_num = 0
	change_tab tab = ($setlist_previous_tab)
	printf "Scrolling down to previous selection"
	change disable_menu_sounds = 1
	begin
	printf "Scrolling to previous selection %t %s target %a %b" t = ($setlist_selection_tier) s = ($setlist_selection_song) a = ($setlist_previous_tier) b = ($setlist_previous_song)
	if ($setlist_selection_tier >= $setlist_previous_tier)
		if ($setlist_selection_song >= $setlist_previous_song)
			break
		endif
	endif
	last_tier = ($setlist_selection_tier)
	last_song = ($setlist_selection_song)
	launchevent type = pad_down target = vmenu_setlist
	if (<last_tier> = $setlist_selection_tier)
		if (<last_song> = $setlist_selection_song)
			printf "Locked in last position"
			break
		endif
	endif
	repeat
	change disable_menu_sounds = 0
	printf "Scrolling down to previous selection End"
	change current_setlist_songpreview = none
	if ($setlist_selection_found = 1)
		formattext checksumname = tier_checksum 'tier%s' s = $setlist_selection_tier
		song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
		change target_setlist_songpreview = <song>
	endif
	change 0x604af81d = 1
	spawnscriptlater setlist_songpreview_monitor
endscript

script create_setlist_scrolling_menu 
	kill_start_key_binding
	unpausegame
	if ($player1_status.bot_play = 1)
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
		on_left = setlist_debug_unlockall
		exclusive_device = <exclusive_device>
	}
	set_focus_color rgba = [200 120 0 250]
	set_unfocus_color rgba = [50 30 10 255]
endscript

script destroy_setlist_scrolling_menu 
	destroy_menu \{menu_id = scrolling_setlist}
	clean_up_user_control_helpers
endscript

script destroy_setlist_menu 
	begin
	if ($setlist_songpreview_changing = 0)
		break
	endif
	wait 1 gameframe
	repeat
	killspawnedscript name = setlist_songpreview_monitor
	if NOT ($current_setlist_songpreview = none)
		get_song_prefix song = ($current_setlist_songpreview)
		formattext checksumname = song_preview '%s_preview' s = <song_prefix>
		stopsound <song_preview>
		songunloadfsbifdownloaded
	endif
	change setlist_previous_tier = ($setlist_selection_tier)
	change setlist_previous_song = ($setlist_selection_song)
	change setlist_previous_tab = ($current_tab)
	destroy_menu menu_id = setlist_original_artist
	destroy_menu menu_id = scrolling_setlist
	destroy_menu menu_id = setlist_menu
	destroy_menu menu_id = setlist_loops_menu
	reset_vars del
	clean_up_user_control_helpers
	if ($is_network_game = 1)
		destroy_setlist_popup
	endif
endscript

script setlist_choose_song device_num = 0
	printf "Device num in setlist_choose_song %s" s = (<device_num>)
	if gotparam song_count
		if ($is_network_game = 1)
			if NOT ($0x738758f9)
				net_request_song tier = <tier> song_count = <song_count>
			endif
		else
			formattext checksumname = tier_checksum 'tier%s' s = <tier>
			change current_song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
			setglobaltags progression params = {current_tier = <tier>}
			setglobaltags progression params = {current_song_count = <song_count>}
			change current_level = $g_last_venue_selected
			get_song_struct song = ($current_song)
			if ((structurecontains structure = <song_struct> boss) || $game_mode = p2_battle)
				get_current_battle_first_play
				if (<first_battle_play> = 1)
					ui_flow_manager_respond_to_action action = show_help device_num = (<device_num>) create_params = {boss = (<song_struct>.checksum)}
					return
				endif
			endif
			enable_pause
			ui_flow_manager_respond_to_action action = continue device_num = (<device_num>)
		endif
	endif
endscript

script setlist_debug_completesong 
	if ($game_mode = training)
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
		if ($game_mode = p1_quickplay)
			menu_top_rockers_check_for_new_top_score
		endif
		change_tab tab = ($current_tab)
		change disable_menu_sounds = 1
		begin
		printf "Current selection %t %i Target %q %w" t = ($setlist_selection_tier) i = ($setlist_selection_song) q = <tier> w = <song_count>
		if (<tier> = $setlist_selection_tier)
			if (<song_count> = $setlist_selection_song)
				break
			endif
		endif
		last_tier = ($setlist_selection_tier)
		last_song = ($setlist_selection_song)
		launchevent type = pad_down target = vmenu_setlist
		if (<last_tier> = $setlist_selection_tier)
			if (<last_song> = $setlist_selection_song)
				printf "Locked in last position"
				break
			endif
		endif
		repeat
		change disable_menu_sounds = 0
		change structurename = player1_status new_cash = 0
		change progression_play_completion_movie = 0
		change current_level = <level>
	endif
endscript

script setlist_debug_unlockall 
	enable_cheat = 0
	if ($enable_button_cheats = 1)
		enable_cheat = 1
	endif
	if (<enable_cheat> = 1)
		if ($game_mode = training)
			return
		endif
		level = ($current_level)
		get_progression_globals game_mode = ($game_mode)
		globaltags_unlockall songlist = <tier_global>
		globaltags_unlockall songlist = gh3_bonus_songs
		updateatoms
		change_tab tab = ($current_tab)
		change disable_menu_sounds = 1
		begin
		if (<tier> = $setlist_selection_tier)
			if (<song_count> = $setlist_selection_song)
				break
			endif
		endif
		last_tier = ($setlist_selection_tier)
		last_song = ($setlist_selection_song)
		launchevent type = pad_down target = vmenu_setlist
		if (<last_tier> = $setlist_selection_tier)
			if (<last_song> = $setlist_selection_song)
				printf "Locked in last position"
				break
			endif
		endif
		repeat
		change disable_menu_sounds = 0
		change structurename = player1_status new_cash = 0
		change progression_play_completion_movie = 0
		change current_level = <level>
	endif
endscript

script setlist_scroll dir = down
	if ($0x738758f9)
		return
	endif
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
	formattext checksumname = textid 'id_song%i' i = $setlist_selection_index addtostringlookup = true
	retail_menu_unfocus id = <textid>
	setscreenelementprops id = <textid> no_shadow
	if (<dir> = down)
		jump_tier = 0
		change setlist_selection_index = ($setlist_selection_index + 1)
		setlist_prefix = ($g_gh3_setlist.prefix)
		begin
		formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = $setlist_selection_tier
		formattext checksumname = tier_checksum 'tier%s' s = $setlist_selection_tier
		getarraysize ($g_gh3_setlist.<tier_checksum>.songs)
		change setlist_selection_song = ($setlist_selection_song + 1)
		if ($setlist_selection_song = <array_size>)
			change setlist_selection_song = 0
			change setlist_selection_tier = ($setlist_selection_tier + 1)
			jump_tier = 1
		endif
		formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = ($setlist_selection_song + 1) s = $setlist_selection_tier addtostringlookup = true
		getglobaltags <song_checksum> param = unlocked
		if (<unlocked> = 1 || $is_network_game = 1)
			break
		endif
		repeat
		jump_tier_amt = (0.0, -240.0)
		if ($setlist_selection_index = 1)
			song_jump_amt = (0.0, -160.0)
			getscreenelementprops id = sl_clipart
			setscreenelementprops id = sl_clipart pos = (<pos> - (0.0, 80.0))
			getscreenelementprops id = sl_clipart_shadow
			setscreenelementprops id = sl_clipart_shadow pos = (<pos> - (0.0, 80.0))
			getscreenelementprops id = sl_clip
			setscreenelementprops id = sl_clip pos = (<pos> - (0.0, 80.0))
			getscreenelementprops id = sl_highlight
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
		formattext checksumname = tier_checksum 'tier%s' s = $setlist_selection_tier
		getarraysize ($g_gh3_setlist.<tier_checksum>.songs)
		change setlist_selection_song = ($setlist_selection_song - 1)
		if ($setlist_selection_song = -1)
			change setlist_selection_tier = ($setlist_selection_tier - 1)
			formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = $setlist_selection_tier
			formattext checksumname = tier_checksum 'tier%s' s = $setlist_selection_tier
			getarraysize ($g_gh3_setlist.<tier_checksum>.songs)
			change setlist_selection_song = (<array_size> - 1)
			jump_tier = 1
		endif
		formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = ($setlist_selection_song + 1) s = $setlist_selection_tier addtostringlookup = true
		getglobaltags <song_checksum> param = unlocked
		if (<unlocked> = 1 || $is_network_game = 1)
			break
		endif
		repeat
		jump_tier_amt = (0.0, 240.0)
		if ($setlist_selection_index = 0)
			song_jump_amt = (0.0, 160.0)
			getscreenelementprops id = sl_clipart
			setscreenelementprops id = sl_clipart pos = (<pos> + (0.0, 80.0))
			getscreenelementprops id = sl_clipart_shadow
			setscreenelementprops id = sl_clipart_shadow pos = (<pos> + (0.0, 80.0))
			getscreenelementprops id = sl_clip
			setscreenelementprops id = sl_clip pos = (<pos> + (0.0, 80.0))
			getscreenelementprops id = sl_highlight
			setscreenelementprops id = sl_highlight pos = (<pos> + (0.0, 80.0))
		else
			song_jump_amt = (0.0, 80.0)
		endif
	endif
	formattext checksumname = tier_checksum 'tier%s' s = $setlist_selection_tier
	song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
	killspawnedscript name = 0xc61941d5
	spawnscriptnow 0xc61941d5
	change target_setlist_songpreview = <song>
	clear_setlist_clip_and_art
	killspawnedscript name = set_song_icon
	spawnscriptnow set_song_icon
	formattext checksumname = textid 'id_song%i' i = $setlist_selection_index addtostringlookup = true
	retail_menu_focus id = <textid>
	setscreenelementprops id = <textid> shadow
	<not_header> = 1
	if ($current_tab = tab_setlist)
		if (<jump_tier> = 1)
			change setlist_begin_text = ($setlist_begin_text + <jump_tier_amt>)
			setscreenelementprops id = scrolling_setlist pos = $setlist_begin_text
			change setlist_background_pos = ($setlist_background_pos + <jump_tier_amt>)
			<not_header> = 0
		endif
	endif
	if (<not_header>)
		change setlist_begin_text = ($setlist_begin_text + <song_jump_amt>)
		setscreenelementprops id = scrolling_setlist pos = $setlist_begin_text
		change setlist_background_pos = ($setlist_background_pos + <song_jump_amt>)
	endif
	setscreenelementprops id = setlist_menu pos = $setlist_background_pos
	setscreenelementprops id = setlist_loops_menu pos = $setlist_background_pos
	if ($setlist_clip_rot_neg)
		setscreenelementprops id = sl_clip rot_angle = (0 - $setlist_clip_last_rot)
		change setlist_clip_rot_neg = 0
	else
		getrandomvalue name = rot a = 10.0 b = -30.0
		setscreenelementprops id = sl_clip rot_angle = <rot>
		change setlist_clip_last_rot = <rot>
		change setlist_clip_rot_neg = 1
	endif
	if (<dir> = down)
		change setlist_random_images_scroll_num = ($setlist_random_images_scroll_num + 1)
		if ($setlist_random_images_scroll_num > $setlist_random_images_highest_num)
			printf "setlist_random_images_scroll_num = %d" d = ($setlist_random_images_scroll_num)
			printf "setlist_random_images_highest_num = %d" d = ($setlist_random_images_highest_num)
			change setlist_random_images_highest_num = ($setlist_random_images_scroll_num)
			mod a = ($setlist_random_images_highest_num) b = 2
			if (<mod> = 0)
				setlist_display_random_bg_image
			endif
		endif
		change setlist_background_loop_num = ($setlist_background_loop_num + 1)
		if ($setlist_background_loop_num = 10)
			change setlist_background_loop_num = 0
			change setlist_background_loop_pos = ($setlist_background_loop_pos + (0.0, 1308.0))
			displaysprite parent = setlist_menu tex = setlist_bg_loop pos = $setlist_background_loop_pos dims = (1280.0, 1308.0) z = 3.1
		endif
		change setlist_page1_num = ($setlist_page1_num + 1)
		if ($setlist_page1_num = 4)
			change setlist_page1_num = 0
			change setlist_page1_loop_pos = ($setlist_page1_loop_pos + (0.0, 512.0))
			displaysprite parent = setlist_loops_menu tex = setlist_page1_loop pos = $setlist_page1_loop_pos dims = $setlist_page1_dims z = $setlist_page1_z
		endif
		if ($current_tab = tab_bonus)
			change setlist_page2_num = ($setlist_page2_num + 1)
			if ($setlist_page2_num = 5)
				change setlist_page2_num = 0
				change setlist_page2_pos = ($setlist_page2_pos + (0.0, 665.5))
				displaysprite parent = setlist_loops_menu tex = setlist_page2_loop pos = $setlist_page2_pos dims = $setlist_page2_dims z = $setlist_page2_z
			endif
		endif
		change setlist_line_num = ($setlist_line_num + 1)
		if ($setlist_line_num = 1)
			change setlist_line_num = 0
			<i> = 1
			if NOT (<not_header>)
				<i> = 3
			endif
			begin
			if ($setlist_line_index = $setlist_line_max)
				change setlist_line_index = 0
			endif
			<line> = Random (@ ($setlist_solid_lines [0]) @ ($setlist_solid_lines [1]) @ ($setlist_solid_lines [2]) )
			displaysprite parent = setlist_menu tex = <line> pos = $setlist_solid_line_pos dims = (896.0, 16.0) z = ($setlist_page1_z + 0.1)
			change setlist_line_index = ($setlist_line_index + 1)
			if ($setlist_line_index = $setlist_line_max)
				change setlist_line_index = 0
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
			change setlist_page3_num = 0
			change setlist_page3_pos = ($setlist_page3_pos + (0.0, 532.0))
			displaysprite parent = setlist_loops_menu tex = setlist_page3_loop pos = $setlist_page3_pos dims = $setlist_page3_dims z = $setlist_page3_z
		endif
	else
		change setlist_random_images_scroll_num = ($setlist_random_images_scroll_num - 1)
		change setlist_background_loop_num = ($setlist_background_loop_num - 1)
		change setlist_page1_num = ($setlist_page1_num - 1)
		change setlist_line_num = ($setlist_line_num - 1)
		change setlist_line_index = ($setlist_line_index + 1)
		if ($setlist_line_index = $setlist_line_max)
			change setlist_line_index = 0
		endif
		change setlist_page3_num = ($setlist_page3_num - 1)
		change setlist_page2_num = ($setlist_page2_num - 1)
	endif
	if gotparam up
		generic_menu_up_or_down_sound up
	endif
	if gotparam down
		generic_menu_up_or_down_sound down
	endif
endscript

script setlist_display_random_bg_image 
	side = 0
	old_image = 0
	begin
	flippable = 0
	mydims = (128.0, 128.0)
	minrot = -5
	maxrot = 5
	loffset = (0.0, 0.0)
	roffset = (0.0, 0.0)
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
		<old_image> = <myimage>
		break
	endif
	repeat
	if (<side> = 0)
		getrandomvalue a = 200 b = 400 integer name = randdown
		imagepos = (($setlist_random_images_highest_num * (0.0, 300.0)) + ((0.0, 1.0) * <randdown>) + <loffset>)
	else
		getrandomvalue a = 200 b = 400 integer name = randdown
		imagepos = (($setlist_random_images_highest_num * (0.0, 300.0)) + ((0.0, 1.0) * <randdown>) + <roffset> + (1000.0, 0.0))
	endif
	imageflag = {}
	if (<flippable> = 1)
		getrandomvalue a = 1 b = 3 integer name = randflip
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
		displaysprite parent = setlist_menu tex = <myimage> pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 3.2 blendmode = subtract
		displaysprite parent = setlist_menu tex = <myimage> pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 3.2 blendmode = subtract
		displaysprite parent = setlist_menu tex = <myimage> pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 3.2 blendmode = subtract
	else
		displaysprite parent = setlist_menu tex = <myimage> pos = <imagepos> dims = <mydims> rot_angle = <randrot> z = 4.0 <imageflag>
		displaysprite parent = setlist_menu tex = <myimage> pos = <imagepos> dims = <mydims> rot_angle = <randrot> z = 4.0 <imageflag>
	endif
	<side> = 1
	repeat 2
endscript
0x604af81d = 1

script 0xc61941d5 
	change \{0x604af81d = 0}
	if NOT ($current_setlist_songpreview = none)
		get_song_prefix song = ($current_setlist_songpreview)
		formattext checksumname = song_preview '%s_preview' s = <song_prefix>
		stopsound <song_preview>
		songunloadfsbifdownloaded
	endif
	wait \{0.5
		seconds}
	change \{0x604af81d = 1}
endscript

script setlist_songpreview_monitor 
	begin
	if ($0x604af81d = 1)
		if NOT ($current_setlist_songpreview = $target_setlist_songpreview)
			change setlist_songpreview_changing = 1
			song = ($target_setlist_songpreview)
			get_song_prefix song = <song>
			get_song_struct song = <song>
			if structurecontains structure = <song_struct> streamname
				song_prefix = (<song_struct>.streamname)
			endif
			songunloadfsbifdownloaded
			songloadfsb song_prefix = <song_prefix>
			formattext checksumname = song_preview '%s_preview' s = <song_prefix>
			get_song_struct song = <song>
			soundbussunlock music_setlist
			if structurecontains structure = <song_struct> name = band_playback_volume
				setlistvol = ((<song_struct>.band_playback_volume))
				setsoundbussparams {music_setlist = {vol = <setlistvol>}}
			else
				setsoundbussparams {music_setlist = {vol = 0.0}}
			endif
			soundbusslock music_setlist
			playsound <song_preview> buss = music_setlist num_loops = -1
			change current_setlist_songpreview = <song>
			change setlist_songpreview_changing = 0
		endif
	endif
	wait 1 gameframe
	repeat
endscript

script change_tab tab = tab_setlist button = 0
	if ($current_tab = <tab> && <button> = 1)
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
	change g_gh3_setlist = <tier_global>
	destroy_setlist_scrolling_menu
	create_setlist_scrolling_menu
	change current_tab = <tab>
	reset_vars del
	destroy_menu menu_id = setlist_loops_menu
	destroy_menu menu_id = setlist_menu
	createscreenelement {
		type = containerelement
		parent = root_window
		id = setlist_loops_menu
		pos = (0.0, 0.0)
		just = [left top]
	}
	switch <tab>
		case tab_setlist
		change setlist_page3_z = 3.3
		change setlist_page2_z = 3.4
		change setlist_page1_z = 3.5
		displaysprite parent = setlist_loops_menu tex = setlist_page1_loop pos = $setlist_page1_loop_pos dims = $setlist_page1_dims z = $setlist_page1_z
		displaysprite parent = setlist_loops_menu tex = setlist_page3_loop pos = ($setlist_page3_pos + (-180.0, 614.0)) dims = $setlist_page3_dims z = $setlist_page3_z
		case tab_downloads
		change setlist_page3_z = 3.5
		change setlist_page2_z = 3.4
		change setlist_page1_z = 3.3
		displaysprite parent = setlist_loops_menu tex = setlist_page1_loop pos = $setlist_page1_loop_pos dims = $setlist_page1_dims z = $setlist_page1_z
		change setlist_page3_pos = ($setlist_page3_pos + (0.0, 40.0))
		displaysprite parent = setlist_loops_menu tex = setlist_page3_loop pos = ($setlist_page3_pos + (-180.0, 614.0)) dims = $setlist_page3_dims z = $setlist_page3_z
		case tab_bonus
		change setlist_page3_z = 3.3
		change setlist_page2_z = 3.8
		change setlist_page1_z = 3.4
		displaysprite parent = setlist_loops_menu tex = setlist_page1_loop pos = $setlist_page1_loop_pos dims = $setlist_page1_dims z = $setlist_page1_z
		displaysprite parent = setlist_loops_menu tex = setlist_page3_loop pos = ($setlist_page3_pos + (-180.0, 614.0)) dims = $setlist_page3_dims z = $setlist_page3_z
		displaysprite parent = setlist_loops_menu tex = setlist_page2_loop pos = ($setlist_page2_pos + (0.0, 553.0)) dims = $setlist_page2_dims z = $setlist_page2_z
	endswitch
	create_sl_assets <tab>
	change setlist_random_images_scroll_num = 0
	change setlist_random_images_highest_num = 0
	setlist_display_random_bg_image
	change setlist_page2_pos = ($setlist_page2_pos + (0.0, 553.0))
	change setlist_page3_pos = ($setlist_page3_pos + (-180.0, 614.0))
	setscreenelementprops id = sl_page3_head z_priority = $setlist_page3_z
	setscreenelementprops id = sl_page2_head z_priority = $setlist_page2_z
	setscreenelementprops id = sl_page1_head z_priority = $setlist_page1_z
	if ($setlist_selection_found = 1)
		formattext checksumname = tier_checksum 'tier%s' s = $setlist_selection_tier
		song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
		change target_setlist_songpreview = <song>
	endif
	killspawnedscript name = set_song_icon
	spawnscriptnow set_song_icon params = {no_wait}
endscript

script reset_vars 
	if gotparam del
		change setlist_begin_text = (0.0, 0.0)
		change setlist_background_pos = (0.0, 0.0)
		change setlist_background_loop_pos = (0.0, 676.0)
		change setlist_background_loop_num = 0
		change setlist_selection_index = 0
		destroy_menu menu_id = sl_overshadow
		destroy_menu menu_id = sl_clipart
		destroy_menu menu_id = sl_clipart_shadow
		destroy_menu menu_id = sl_clip
		destroy_menu menu_id = sl_bg_helper
		destroy_menu menu_id = sl_highlight
		destroy_menu menu_id = sl_fixed
	endif
	change setlist_page1_num = 0
	change setlist_page1_loop_pos = (157.0, 768.0)
	change setlist_line_num = 0
	change setlist_page3_pos = (210.0, 86.0)
	change setlist_page3_num = 0
	change setlist_page2_num = 0
	change setlist_page2_pos = (240.0, 50.0)
	change setlist_line_index = 0
	change setlist_clip_last_rot = 0
	change setlist_clip_rot_neg = 0
endscript

script create_sl_assets 
	createscreenelement {
		type = containerelement
		parent = root_window
		id = setlist_menu
		pos = (0.0, 0.0)
		just = [left top]
	}
	displaysprite id = sl_bg_head parent = setlist_menu tex = setlist_bg_head pos = (0.0, 0.0) dims = (1280.0, 676.0) z = 3.1
	displaysprite id = sl_bg_loop parent = setlist_menu tex = setlist_bg_loop pos = $setlist_background_loop_pos dims = (1280.0, 1352.0) z = 3.1
	begin
	displaysprite parent = setlist_menu tex = setlist_shoeprint pos = (850.0, -70.0) dims = (640.0, 768.0) alpha = 0.15 z = 3.2 flip_v rot_angle = 10 blendmode = subtract
	repeat 3
	displaysprite id = sl_page3_head parent = setlist_menu tex = setlist_page3_head pos = $setlist_page3_pos dims = (922.0, 614.0) z = $setlist_page3_z
	displaysprite id = sl_page2_head parent = setlist_menu tex = setlist_page2_head pos = $setlist_page2_pos dims = (819.0, 553.0) z = $setlist_page2_z
	displaysprite flip_h id = sl_page1_head parent = setlist_menu tex = setlist_page1_head pos = (160.0, 0.0) dims = (922.0, 768.0) z = $setlist_page1_z
	displaysprite parent = setlist_menu tex = setlist_page1_line_red pos = (300.0, 12.0) dims = (8.0, 6400.0) z = ($setlist_page1_z + 0.1)
	<title_pos> = (300.0, 380.0)
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
	change setlist_num_songs = 0
	if gotparam tab_setlist
		displaysprite id = sl_page1_title parent = setlist_menu tex = setlist_page1_title pos = (330.0, 220.0) dims = (512.0, 128.0) alpha = 0.7 z = ($setlist_page1_z + 0.2) rot_angle = 0
		displaysprite parent = sl_page1_title tex = setlist_page1_title pos = (-5.0, 10.0) dims = (512.0, 128.0) alpha = 0.2 z = ($setlist_page1_z + 0.2) rot_angle = -2
		displaytext id = sl_text_1 parent = setlist_menu scale = (1.3, 1.0) text = ($g_gh3_setlist.tier1.title) rgba = [195 80 45 255] pos = <title_pos> z = $setlist_text_z noshadow
	endif
	if gotparam tab_downloads
		displaytext parent = setlist_menu id = sl_text_1 text = "DOWNLOADED SONGS" font = text_a10 scale = 2 pos = (330.0, 220.0) rgba = [50 30 20 255] z = $setlist_text_z noshadow
		displaysprite parent = setlist_menu tex = setlist_page1_line_red pos = (320.0, 216.0) dims = (8.0, 6400.0) z = ($setlist_page1_z - 0.2)
	endif
	if gotparam tab_bonus
		displaytext parent = setlist_menu id = sl_text_1 text = "BONUS SONGS" font = text_a10 scale = 2 pos = (330.0, 220.0) rgba = [50 30 20 255] z = $setlist_text_z noshadow
		displaysprite parent = setlist_menu tex = setlist_page1_line_red pos = (320.0, 216.0) dims = (8.0, 6400.0) z = ($setlist_page1_z - 0.2)
	endif
	<text_pos> = (<title_pos> + (40.0, 54.0))
	if ((gotparam tab_setlist) || (gotparam tab_bonus) || (gotparam tab_downloads))
		num_tiers = ($g_gh3_setlist.num_tiers)
		<tier> = 0
		change setlist_selection_index = 0
		change setlist_selection_tier = 1
		change setlist_selection_song = 0
		change setlist_selection_found = 0
		begin
		<tier> = (<tier> + 1)
		setlist_prefix = ($g_gh3_setlist.prefix)
		formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
		formattext checksumname = tier_checksum 'tier%s' s = <tier>
		getglobaltags <tiername> param = unlocked
		if (<unlocked> = 1 || $is_network_game = 1)
			if NOT (<tier> = 1)
				<text_pos> = (<text_pos> + (-40.0, 106.0))
				displaytext parent = setlist_menu scale = (1.0, 1.0) text = ($g_gh3_setlist.<tier_checksum>.title) rgba = [190 75 40 255] pos = <text_pos> z = $setlist_text_z noshadow
				<text_pos> = (<text_pos> + (40.0, 54.0))
			endif
			getarraysize ($g_gh3_setlist.<tier_checksum>.songs)
			num_songs = <array_size>
			num_songs_unlocked = 0
			song_count = 0
			if (<array_size> > 0)
				begin
				setlist_prefix = ($g_gh3_setlist.prefix)
				formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <tier> addtostringlookup = true
				getglobaltags <song_checksum> param = unlocked
				if (<unlocked> = 1 || $is_network_game = 1)
					if ($setlist_selection_found = 0)
						change setlist_selection_tier = <tier>
						change setlist_selection_song = <song_count>
						change setlist_selection_found = 1
					endif
					get_song_title song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					get_song_prefix song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					get_song_artist song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					formattext checksumname = textid 'id_song%i' i = $setlist_num_songs addtostringlookup = true
					createscreenelement {
						type = textelement
						id = <textid>
						parent = setlist_menu
						scale = (0.75, 0.75)
						text = <song_title>
						pos = <text_pos>
						rgba = [50 30 10 255]
						z_priority = $setlist_text_z
						font = text_a5
						just = [left top]
						no_shadow
						shadow_offs = (2.0, 2.0)
						shadow_rgba = [0 0 0 255]
					}
					getglobaltags <song_checksum>
					if ($game_mode = p1_quickplay)
						get_quickplay_song_stars song = <song_prefix>
					endif
					if progression_isbosssong tier_global = $g_gh3_setlist tier = <tier> song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
						stars = 0
					endif
					if (<stars> > 2)
						<star_space> = (20.0, 0.0)
						<star_pos> = (<text_pos> + (660.0, 0.0))
						begin
						if (<percent100> = 1)
							<star> = setlist_goldstar
						else
							<star> = Random (@ ($setlist_loop_stars [0]) @ ($setlist_loop_stars [1]) @ ($setlist_loop_stars [2]) )
						endif
						<star_pos> = (<star_pos> - <star_space>)
						displaysprite parent = setlist_menu tex = <star> rgba = [233 205 166 255] z = $setlist_text_z pos = <star_pos>
						repeat <stars>
					endif
					getglobaltags <song_checksum> param = score
					if ($game_mode = p1_quickplay)
						get_quickplay_song_score song = <song_prefix>
					endif
					if NOT ($game_mode = training || $game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
						if (<score> > 0)
							formattext textname = score_text "%d" d = <score> usecommas
							<score_pos> = (<text_pos> + (660.0, 40.0))
							createscreenelement {
								type = textelement
								parent = setlist_menu
								scale = (0.75, 0.75)
								text = <score_text>
								pos = <score_pos>
								rgba = [90 110 150 255]
								z_priority = $setlist_text_z
								font = text_a5
								just = [right top]
								noshadow
							}
						endif
					endif
					<text_pos> = (<text_pos> + (60.0, 40.0))
					formattext checksumname = artistid 'artist_id%d' d = $setlist_num_songs
					displaytext parent = setlist_menu scale = (0.75, 0.75) id = <artistid> text = <song_artist> rgba = [20 60 100 255] pos = <text_pos> z = $setlist_text_z noshadow
					<text_pos> = (<text_pos> + (-60.0, 40.0))
					change setlist_num_songs = ($setlist_num_songs + 1)
					num_songs_unlocked = (<num_songs_unlocked> + 1)
				endif
				song_count = (<song_count> + 1)
				repeat <num_songs>
			endif
			if ((($game_mode = p1_career) || ($game_mode = p2_career)) && (gotparam tab_setlist) && $is_demo_mode = 0)
				getglobaltags <tiername> param = complete
				if (<complete> = 0)
					getglobaltags <tiername> param = boss_unlocked
					getglobaltags <tiername> param = encore_unlocked
					if (<encore_unlocked> = 1)
						formattext textname = completetext "Beat encore song to continue"
					elseif (<boss_unlocked> = 1)
						formattext textname = completetext "Beat boss song to continue"
					else
						getglobaltags <tiername> param = num_songs_to_progress
						formattext textname = completetext "Beat %d of %p songs to continue" d = <num_songs_to_progress> p = <num_songs_unlocked>
					endif
					displaytext parent = setlist_menu scale = (0.6, 0.6) text = <completetext> pos = (<text_pos> + (160.0, 0.0)) z = $setlist_text_z rgba = [30 30 30 255] noshadow
				endif
			endif
		endif
		repeat <num_tiers>
	endif
	change setlist_begin_text = $setlist_menu_pos
	if ($setlist_num_songs > 0)
		retail_menu_focus id = id_song0
		setscreenelementprops id = id_song0 shadow
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = sl_fixed
		pos = (0.0, 0.0)
		just = [left top]
	}
	<clip_pos> = (160.0, 390.0)
	displaysprite id = sl_clipart parent = sl_fixed pos = <clip_pos> dims = (160.0, 160.0) z = ($setlist_text_z + 0.1) rgba = [200 200 200 255]
	displaysprite id = sl_clipart_shadow parent = sl_fixed pos = (<clip_pos> + (3.0, 3.0)) dims = (160.0, 160.0) z = ($setlist_text_z) rgba = [0 0 0 128]
	<clip_pos> = (<clip_pos> + (15.0, 50.0))
	displaysprite id = sl_clip parent = sl_fixed tex = setlist_clip just = [-0.5 -0.9] pos = <clip_pos> dims = (141.0, 102.0) z = ($setlist_text_z + 0.2)
	if ($current_tab = tab_setlist)
		hilite_dims = (762.0, 80.0)
	elseif ($current_tab = tab_downloads)
		hilite_dims = (722.0, 80.0)
	elseif ($current_tab = tab_bonus)
		hilite_dims = (702.0, 80.0)
	endif
	displaysprite id = sl_highlight parent = sl_fixed tex = white pos = (300.0, 428.0) dims = <hilite_dims> z = ($setlist_text_z - 0.1) rgba = [255 255 255 128]
	<bg_helper_pos> = (140.0, 585.0)
	<helper_rgba> = [105 65 7 160]
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
	displaysprite id = sl_overshadow rgba = [105 65 7 160] parent = root_window tex = setlist_overshadow pos = (0.0, 0.0) dims = (1280.0, 720.0) z = 5.0
	if ($is_network_game)
		get_number_of_songs
		create_setlist_popup 0xd52b09c1 = <num_songs>
	endif
endscript

script get_quickplay_song_score 
	get_difficulty_text_nl difficulty = ($current_difficulty)
	formattext checksumname = songname '%s_%d' s = <song> d = <difficulty_text_nl>
	getglobaltags <songname>
	return score = <score1>
endscript

script get_quickplay_song_stars 
	get_difficulty_text_nl difficulty = ($current_difficulty)
	formattext checksumname = songname '%s_%d' s = <song> d = <difficulty_text_nl>
	getglobaltags <songname>
	return stars = <stars1>
endscript

script setlist_show_helperbar text_option1 = "BONUS" text_option2 = "DOWNLOADS" button_option1 = "\\b7" button_option2 = "\\b8" spacing = 16
	text_options = [
		"UP/DOWN"
		"SELECT"
		"BACK"
	]
	button_options = [
		"\\bb"
		"\\b4"
		"\\b5"
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
		case "\\b4"
		<button> = green
		case "\\b5"
		<button> = red
		case "\\b6"
		<button> = yellow
		case "\\b7"
		<button> = blue
		case "\\b8"
		<button> = orange
	endswitch
	change user_control_pill_text_color = [0 0 0 255]
	change user_control_pill_color = [180 180 180 255]
	add_user_control_helper text = <text2> button = <button> z = 100
	<i> = (<i> + 1)
	repeat 5
	tabs_text = ["setlist" "bonus" "downloads"]
	setlist_text_positions = [(300.0, 70.0) (624.0, 102.0) (870.0, 120.0)]
	download_text_positions = [(300.0, 70.0) (624.0, 102.0) (870.0, 160.0)]
	buttons_text = ["\\b7" "\\b6" "\\b8"]
	setlist_button_positions = [(580.0, 90.0) (260.0, 65.0) (830.0, 110.0)]
	download_button_positions = [(580.0, 90.0) (260.0, 65.0) (830.0, 150.0)]
	i = 0
	begin
	button_text_pos = (<setlist_button_positions> [<i>])
	if ($current_tab = tab_downloads)
		<button_text_pos> = (<download_button_positions> [<i>])
	endif
	displaytext parent = setlist_menu scale = 1 text = (<buttons_text> [<i>]) rgba = [128 128 128 255] pos = <button_text_pos> z = 50 font = buttonsxenon
	tab_text_pos = (<setlist_text_positions> [<i>])
	if ($current_tab = tab_downloads)
		<tab_text_pos> = (<download_text_positions> [<i>])
	endif
	displaytext parent = setlist_menu scale = 1 text = (<tabs_text> [<i>]) rgba = [0 0 0 255] pos = <tab_text_pos> z = 50 noshadow
	<i> = (<i> + 1)
	repeat 3
endscript
