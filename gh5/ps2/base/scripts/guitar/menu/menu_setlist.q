setlist_random_images_scroll_num = 0
setlist_random_images_highest_num = 0
setlist_random_bg_images = [
	{
		texture = Setlist_Shoeprint
		flippable
		shoeprint
	}
	{
		texture = Setlist_Gum
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
		texture = setlist_ernieBall
		dims = (384.0, 384.0)
		only_right
		roffset = (100.0, 0.0)
	}
	{
		texture = setlist_button_GunsNRoses
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
	Setlist_Page1_Loop_Star1
	Setlist_Page1_Loop_Star2
	Setlist_Page1_Loop_Star3
]
setlist_event_handlers = [
	{
		pad_up
		setlist_scroll
		params = {
			Dir = up
		}
	}
	{
		pad_down
		setlist_scroll
		params = {
			Dir = down
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
]
g_hack_all_songs_unlocked = 0
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
g_gh3_setlist = NULL
current_tab = tab_setlist
setlist_page1_z = 0
setlist_page2_z = 0
setlist_page3_z = 0

script display_as_made_famous_by \{rot_angle = -7
		time = 0.25}
	destroy_menu \{menu_id = setlist_original_artist}
	CreateScreenElement {
		Type = ContainerElement
		parent = root_window
		id = setlist_original_artist
		rot_angle = <rot_angle>
		alpha = 0
	}
	displaySprite {
		parent = setlist_original_artist
		tex = white
		dims = (130.0, 50.0)
		just = [center top]
		Pos = <Pos>
		rgba = [0 0 0 255]
		z = 500
	}
	displaySprite {
		parent = setlist_original_artist
		tex = white
		just = [center top]
		dims = (130.0, 25.0)
		Pos = (<Pos> + (0.0, 25.0))
		rgba = [223 223 223 255]
		z = 501
	}
	displayText {
		parent = setlist_original_artist
		text = qs(0x19ae614c)
		font = fontgrid_text_a3
		just = [center top]
		Pos = (<Pos>)
		z = 502
		Scale = (0.8, 0.5)
		rgba = [223 223 223 255]
		noshadow
	}
	fit_text_in_rectangle id = <id> dims = (75.0, 15.0)
	displayText {
		parent = setlist_original_artist
		text = qs(0xc1ebfea3)
		just = [center top]
		font = fontgrid_text_a3
		Pos = (<Pos> + (0.0, 25.0))
		z = 502
		Scale = (0.72499996, 0.5)
		rgba = [0 0 0 255]
		noshadow
	}
	fit_text_in_rectangle id = <id> dims = (90.0, 15.0)
	legacydoscreenelementmorph id = setlist_original_artist alpha = 1 time = <time>
endscript

script set_song_icon 
	if NOT GotParam \{no_wait}
		Wait \{0.5
			Seconds}
	endif
	if NOT GotParam \{song}
		0xe085ec1f
	endif
	if (<song> = None && $current_tab = tab_setlist)
		return
	endif
	if ($current_tab = tab_setlist)
		get_tier_from_song song = <song>
		get_progression_globals game_mode = ($game_mode)
		formatText checksumName = tiername 'tier%d' d = <tier_number>
		if StructureContains structure = ($<tier_global>.<tiername>) setlist_icon
			song_icon = ($<tier_global>.<tiername>.setlist_icon)
		else
			song_icon = setlist_icon_generic
		endif
	else
		song_icon = setlist_icon_generic
	endif
	mini_rot = RandomInteger (-5.0, 5.0)
	if ScreenElementExists \{id = sl_clipart}
		SetScreenElementProps id = sl_clipart texture = <song_icon>
		legacydoscreenelementmorph id = sl_clipart alpha = 1 time = 0.25 rot_angle = <mini_rot>
	endif
	if ScreenElementExists \{id = sl_clipart_shadow}
		SetScreenElementProps id = sl_clipart_shadow texture = <song_icon>
		legacydoscreenelementmorph id = sl_clipart_shadow alpha = 1 time = 0.25 rot_angle = <mini_rot>
	endif
	if ScreenElementExists \{id = sl_clip}
		GetScreenElementProps \{id = sl_clip}
		rot_clip_a = <rot_angle>
		rot_clip_b = (<rot_clip_a> + 10)
		SetScreenElementProps id = sl_clip rot_angle = <rot_clip_b>
		legacydoscreenelementmorph id = sl_clip alpha = 1 rot_angle = <rot_clip_a> time = 0.25
	endif
	if NOT (<song> = None)
		get_song_original_artist song = <song>
		if ($we_have_songs = true && <original_artist> = 0)
			if ScreenElementExists \{id = sl_clipart}
				GetScreenElementProps \{id = sl_clipart}
			endif
		endif
	endif
endscript

script get_tier_from_song 
	num_tiers = ($g_gh3_setlist.num_tiers)
	tier_index = 1
	begin
	formatText checksumName = tier_name 'tier%d' d = <tier_index>
	GetArraySize ($g_gh3_setlist.<tier_name>.songs)
	song_index = 0
	begin
	song_checksum = ($g_gh3_setlist.<tier_name>.songs [<song_index>])
	if (<song_checksum> = <song>)
		return tier_number = <tier_index>
	endif
	<song_index> = (<song_index> + 1)
	repeat <array_Size>
	<tier_index> = (<tier_index> + 1)
	repeat <num_tiers>

	return \{tier_number = 1}
endscript

script clear_setlist_clip_and_art 
	destroy_menu \{menu_id = setlist_original_artist}
	if ScreenElementExists \{id = sl_clipart}
		SetScreenElementProps \{id = sl_clipart
			alpha = 0}
	endif
	if ScreenElementExists \{id = sl_clipart_shadow}
		SetScreenElementProps \{id = sl_clipart_shadow
			alpha = 0}
	endif
	if ScreenElementExists \{id = sl_clip}
		SetScreenElementProps \{id = sl_clip
			alpha = 0}
	endif
endscript

script setlist_go_back 
	if (($transitions_locked = 0) && ($is_network_game = 0))
		LaunchEvent \{Type = unfocus
			target = current_menu}
	endif
	begin
	if ($changing_tab = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ($is_network_game = 1)
		quit_network_game
		Change \{net_new_matchmaking_ui_flag = 0}
		generic_event_back \{state = uistate_online}
	else
		generic_event_back
	endif
endscript

script create_setlist_menu 
	setsoundbussparams {Music_Setlist = {vol = ($default_BussSet.Music_Setlist.vol)}}
	if ($is_network_game = 1)
		Change \{current_tab = tab_setlist}
		Change \{setlist_previous_tier = 1}
		Change \{setlist_previous_song = 0}
		Change \{setlist_previous_tab = tab_setlist}
	endif
	Change \{progression_unlocked_guitar = -1}
	Change \{progression_unlocked_guitar2 = -1}
	Change \{rich_presence_context = presence_gigboard_and_setlist}
	menu_music_off
	get_progression_globals game_mode = ($game_mode) ($band_mode_mode)
	Change g_gh3_setlist = $<tier_global>
	destroy_setlist_scrolling_menu
	create_setlist_scrolling_menu
	Change \{setlist_page3_z = 3.3}
	Change \{setlist_page2_z = 3.4}
	Change \{setlist_page1_z = 3.5}
	Change \{setlist_random_images_scroll_num = 0}
	Change \{setlist_random_images_highest_num = 0}
	change_tab tab = ($setlist_previous_tab)
	setlist_display_random_bg_image
	if ($is_network_game)
		Change \{setlist_previous_tier = 1}
		Change \{setlist_previous_song = 0}
		Change \{setlist_previous_tab = tab_setlist}
		create_setlist_popup
	endif
	Change \{disable_menu_sounds = 1}
	begin
	if ($setlist_selection_tier >= $setlist_previous_tier)
		if ($setlist_selection_song >= $setlist_previous_song)
			break
		endif
	endif
	last_tier = ($setlist_selection_tier)
	last_song = ($setlist_selection_song)
	LaunchEvent \{Type = pad_down
		target = current_menu}
	if (<last_tier> = $setlist_selection_tier)
		if (<last_song> = $setlist_selection_song)
			break
		endif
	endif
	repeat
	Change \{disable_menu_sounds = 0}
	if ($setlist_selection_found = 1)
		formatText \{checksumName = tier_checksum
			'tier%s'
			s = $setlist_selection_tier}
		song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
		0x2e9b1633 song = <song>
	else
		0xc337ea4c
	endif
	setsoundbussparams {Music_Setlist = {vol = ($default_BussSet.Music_Setlist.vol)}}
	SpawnScriptNow \{0x1e464d15}
endscript

script create_setlist_scrolling_menu 
	disable_pause
	UnPauseGame
	if ($player1_status.bot_play = 1)
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = gh4_p2_career ||
				$game_mode = p2_pro_faceoff ||
				$game_mode = p2_quickplay)
			RemoveParameter \{exclusive_device}
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
		on_select = setlist_debug_unlockall
		exclusive_device = <exclusive_device>
		use_all_controllers
	}
	if ($is_network_game = 1)
		if ($current_tab = tab_downloads)
			net_dl_content_compatabilty_warning \{parent = gamertag_container
				z = 10000
				Pos = (320.0, 580.0)}
		else
			if ScreenElementExists \{id = dl_content_warning}
				DestroyScreenElement \{id = dl_content_warning}
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

script destroy_setlist_menu 
	KillSpawnedScript \{Name = net_match_download_songs}
	SpawnScriptNow \{0xb20ce9b6}
	Change setlist_previous_tier = ($setlist_selection_tier)
	Change setlist_previous_song = ($setlist_selection_song)
	Change setlist_previous_tab = ($current_tab)
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


	if GotParam \{song_count}
		if ($is_network_game = 1)
			if ($net_new_matchmaking_ui_flag = 1)
				if ($net_permision_to_select_song = 1)
					net_request_song Tier = <Tier> song_count = <song_count>
				else
					return
				endif
			else
				net_request_song Tier = <Tier> song_count = <song_count>
			endif
		else
			if ($transitions_locked = 0)
				LaunchEvent \{Type = unfocus
					target = current_menu}
			endif
			formatText checksumName = tier_checksum 'tier%s' s = <Tier>
			Change current_song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
			SetGlobalTags Progression params = {current_tier = <Tier>}
			SetGlobalTags Progression params = {current_song_count = <song_count>}
			Change \{current_level = $g_last_venue_selected}
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
					Change player1_device = <device_num>
				endif
				switch ($game_mode)
					case p2_pro_faceoff
					case p2_coop
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
	if ($enable_button_cheats = 0)
		return
	endif
	if ($game_mode = practice || $is_network_game = 1)
		return
	endif
	enable_cheat = 0
	if ($enable_button_cheats = 1)
		enable_cheat = 1
	endif
	if (<enable_cheat> = 1)
		level = ($current_level)
		formatText checksumName = tier_checksum 'tier%s' s = <Tier>
		Change current_song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
		SetGlobalTags Progression params = {current_tier = <Tier>}
		SetGlobalTags Progression params = {current_song_count = <song_count>}

		cas_destroy_all_characters
		load_songqpak song_name = ($current_song) async = 0
		setup_gemarrays song_name = ($current_song) difficulty = ($player1_status.difficulty) player_status = player1_status
		calc_songscoreinfo
		Change structurename = player1_status score = ($player1_status.base_score * 2.8 + 1)
		Progression_SongWon
		if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
			menu_top_rockers_check_for_new_top_score
		endif
		0x8dbdaee4 \{'Known issue: Using the debug \'Beat Song\' option doesn\'t update the setlist UI correctly.\\n To correct, move the cursor up, then down.'}
		Change \{disable_menu_sounds = 1}
		begin
		if (<Tier> = $setlist_selection_tier)
			if (<song_count> = $setlist_selection_song)
				break
			endif
		endif
		last_tier = ($setlist_selection_tier)
		last_song = ($setlist_selection_song)
		LaunchEvent \{Type = pad_down
			target = current_menu}
		if (<last_tier> = $setlist_selection_tier)
			if (<last_song> = $setlist_selection_song)
				break
			endif
		endif
		repeat
		Change \{disable_menu_sounds = 0}
		Change \{structurename = player1_status
			new_cash = 0}
		Change \{progression_play_completion_movie = 0}
		Change \{progression_unlock_tier_last_song = 0}
		Change current_level = <level>
		Change \{end_credits = 0}
	endif
endscript

script setlist_debug_unlockall 
	enable_cheat = 0
	if ($enable_button_cheats = 1)
		enable_cheat = 1
	endif
	if (<enable_cheat> = 1)
		if ($game_mode = practice || $is_network_game = 1)
			return
		endif
		level = ($current_level)
		get_progression_globals game_mode = ($game_mode)
		GlobalTags_UnlockAll SongList = <tier_global>
		Change \{structurename = player1_status
			notes_hit = 100}
		Change \{structurename = player1_status
			total_notes = 100}
		Change \{structurename = player2_status
			notes_hit = 100}
		Change \{structurename = player2_status
			total_notes = 100}
		if ($game_mode = gh4_p1_career || $game_mode = gh4_p2_career)
			UpdateAtoms \{Name = Progression}
		endif
		0x8dbdaee4 \{'Known issue: Using the debug \'Beat Song\' option doesn\'t update the setlist UI correctly.\\n To correct, move the cursor up, then down.'}
		Change \{disable_menu_sounds = 1}
		begin
		if (<Tier> = $setlist_selection_tier)
			if (<song_count> = $setlist_selection_song)
				break
			endif
		endif
		last_tier = ($setlist_selection_tier)
		last_song = ($setlist_selection_song)
		LaunchEvent \{Type = pad_down
			target = current_menu}
		if (<last_tier> = $setlist_selection_tier)
			if (<last_song> = $setlist_selection_song)
				break
			endif
		endif
		repeat
		Change \{disable_menu_sounds = 0}
		Change \{structurename = player1_status
			new_cash = 0}
		Change \{progression_play_completion_movie = 0}
		Change \{progression_unlock_tier_last_song = 0}
		Change current_level = <level>
		Change \{end_credits = 0}
	endif
endscript

script setlist_scroll \{Dir = down}
	if ($setlist_num_songs = 0)
		return
	endif
	if (<Dir> = down)
		if ($setlist_selection_index + 1 = $setlist_num_songs)
			return
		endif
	else
		if ($setlist_selection_index - 1 < 0)
			return
		endif
	endif
	generic_menu_up_or_down_sound <Dir>
	formatText \{checksumName = textid
		'id_song%i'
		i = $setlist_selection_index
		AddToStringLookup = true}
	retail_menu_unfocus id = <textid>
	SetScreenElementProps id = <textid> no_shadow
	if (<Dir> = down)
		jump_tier = 0
		Change setlist_selection_index = ($setlist_selection_index + 1)
		setlist_prefix = ($g_gh3_setlist.prefix)
		begin
		formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = $setlist_selection_tier
		formatText \{checksumName = tier_checksum
			'tier%s'
			s = $setlist_selection_tier}
		GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
		Change setlist_selection_song = ($setlist_selection_song + 1)
		if ($setlist_selection_song = <array_Size>)
			Change \{setlist_selection_song = 0}
			Change setlist_selection_tier = ($setlist_selection_tier + 1)
			jump_tier = 1
		endif
		format_globaltag_song_checksum part = ($g_gh3_setlist.part) song = ($g_gh3_setlist.<tier_checksum>.songs [($setlist_selection_song)])
		for_bonus = 0
		if ($current_tab = tab_bonus)
			<for_bonus> = 1
		endif
		if IsSongAvailable song_checksum = <song_checksum> song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song]) for_bonus = <for_bonus>
			break
		endif
		repeat
		jump_tier_amt = (0.0, -240.0)
		if ($setlist_selection_index = 1)
			song_jump_amt = (0.0, -160.0)
			GetScreenElementProps \{id = sl_clipart}
			SetScreenElementProps id = sl_clipart Pos = (<Pos> - (0.0, 80.0))
			GetScreenElementProps \{id = sl_clipart_shadow}
			SetScreenElementProps id = sl_clipart_shadow Pos = (<Pos> - (0.0, 80.0))
			GetScreenElementProps \{id = sl_clip}
			SetScreenElementProps id = sl_clip Pos = (<Pos> - (0.0, 80.0))
			GetScreenElementProps \{id = sl_highlight}
			SetScreenElementProps id = sl_highlight Pos = (<Pos> - (0.0, 80.0))
		else
			song_jump_amt = (0.0, -80.0)
		endif
	else
		jump_tier = 0
		Change setlist_selection_index = ($setlist_selection_index - 1)
		setlist_prefix = ($g_gh3_setlist.prefix)
		begin
		formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = $setlist_selection_tier
		formatText \{checksumName = tier_checksum
			'tier%s'
			s = $setlist_selection_tier}
		GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
		Change setlist_selection_song = ($setlist_selection_song - 1)
		if ($setlist_selection_song = -1)
			Change setlist_selection_tier = ($setlist_selection_tier - 1)
			formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = $setlist_selection_tier
			formatText \{checksumName = tier_checksum
				'tier%s'
				s = $setlist_selection_tier}
			GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
			Change setlist_selection_song = (<array_Size> - 1)
			jump_tier = 1
		endif
		format_globaltag_song_checksum part = ($g_gh3_setlist.part) song = (.<tier_checksum>.songs [($setlist_selection_song)])
		for_bonus = 0
		if ($current_tab = tab_bonus)
			<for_bonus> = 1
		endif
		if IsSongAvailable song_checksum = <song_checksum> song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song]) for_bonus = <for_bonus>
			break
		endif
		repeat
		jump_tier_amt = (0.0, 240.0)
		if ($setlist_selection_index = 0)
			song_jump_amt = (0.0, 160.0)
			GetScreenElementProps \{id = sl_clipart}
			SetScreenElementProps id = sl_clipart Pos = (<Pos> + (0.0, 80.0))
			GetScreenElementProps \{id = sl_clipart_shadow}
			SetScreenElementProps id = sl_clipart_shadow Pos = (<Pos> + (0.0, 80.0))
			GetScreenElementProps \{id = sl_clip}
			SetScreenElementProps id = sl_clip Pos = (<Pos> + (0.0, 80.0))
			GetScreenElementProps \{id = sl_highlight}
			SetScreenElementProps id = sl_highlight Pos = (<Pos> + (0.0, 80.0))
		else
			song_jump_amt = (0.0, 80.0)
		endif
	endif
	formatText \{checksumName = tier_checksum
		'tier%s'
		s = $setlist_selection_tier}
	song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
	0xc337ea4c song = <song>
	clear_setlist_clip_and_art
	KillSpawnedScript \{Name = set_song_icon}
	SpawnScriptNow \{set_song_icon}
	formatText \{checksumName = textid
		'id_song%i'
		i = $setlist_selection_index
		AddToStringLookup = true}
	retail_menu_focus id = <textid>
	SetScreenElementProps id = <textid> Shadow
	<not_header> = 1
	if ($current_tab = tab_setlist)
		if (<jump_tier> = 1)
			Change setlist_begin_text = ($setlist_begin_text + <jump_tier_amt>)
			SetScreenElementProps \{id = scrolling_setlist
				Pos = $setlist_begin_text}
			Change setlist_background_pos = ($setlist_background_pos + <jump_tier_amt>)
			<not_header> = 0
		endif
	endif
	if (<not_header>)
		Change setlist_begin_text = ($setlist_begin_text + <song_jump_amt>)
		SetScreenElementProps \{id = scrolling_setlist
			Pos = $setlist_begin_text}
		Change setlist_background_pos = ($setlist_background_pos + <song_jump_amt>)
	endif
	SetScreenElementProps \{id = setlist_menu
		Pos = $setlist_background_pos}
	SetScreenElementProps \{id = setlist_bg_container
		Pos = $setlist_background_pos}
	SetScreenElementProps \{id = setlist_loops_menu
		Pos = $setlist_background_pos}
	if ($setlist_clip_rot_neg)
		SetScreenElementProps id = sl_clip rot_angle = (0 - $setlist_clip_last_rot)
		Change \{setlist_clip_rot_neg = 0}
	else
		GetRandomValue \{Name = rot
			a = 10.0
			b = -30.0}
		SetScreenElementProps id = sl_clip rot_angle = <rot>
		Change setlist_clip_last_rot = <rot>
		Change \{setlist_clip_rot_neg = 1}
	endif
	if (<Dir> = down)
		Change setlist_random_images_scroll_num = ($setlist_random_images_scroll_num + 1)
		if ($setlist_random_images_scroll_num > $setlist_random_images_highest_num)
			Change setlist_random_images_highest_num = ($setlist_random_images_scroll_num)
			Mod a = ($setlist_random_images_highest_num) b = 4
			if (<Mod> = 0)
				setlist_display_random_bg_image
			endif
		endif
		Change setlist_background_loop_num = ($setlist_background_loop_num + 1)
		if ($setlist_background_loop_num = 10)
			Change \{setlist_background_loop_num = 0}
			Change setlist_background_loop_pos = ($setlist_background_loop_pos + (0.0, 1308.0))
			displaySprite \{parent = setlist_menu
				tex = setlist_bg_loop_1308
				Pos = $setlist_background_loop_pos
				dims = (1280.0, 1308.0)
				z = 3.1}
		endif
		Change setlist_page1_num = ($setlist_page1_num + 1)
		if ($setlist_page1_num = 4)
			Change \{setlist_page1_num = 0}
			Change setlist_page1_loop_pos = ($setlist_page1_loop_pos + (0.0, 512.0))
			displaySprite \{parent = setlist_loops_menu
				tex = setlist_page1_loop_89x33
				Pos = $setlist_page1_loop_pos
				dims = $setlist_page1_dims
				z = $setlist_page1_z}
		endif
		if ($current_tab = tab_bonus)
			Change setlist_page2_num = ($setlist_page2_num + 1)
			if ($setlist_page2_num = 5)
				Change \{setlist_page2_num = 0}
				Change setlist_page2_pos = ($setlist_page2_pos + (0.0, 665.5))
				displaySprite \{parent = setlist_loops_menu
					tex = setlist_page2_loop_80x65
					Pos = $setlist_page2_pos
					dims = $setlist_page2_dims
					z = $setlist_page2_z}
			endif
		endif
		Change setlist_line_num = ($setlist_line_num + 1)
		if ($setlist_line_num = 1)
			Change \{setlist_line_num = 0}
			<i> = 1
			if NOT (<not_header>)
				<i> = 3
			endif
			begin
			if ($setlist_line_index = $setlist_line_max)
				Change \{setlist_line_index = 0}
			endif
			<line> = Random (@ ($setlist_solid_lines [0]) @ ($setlist_solid_lines [1]) @ ($setlist_solid_lines [2]) )
			displaySprite parent = setlist_menu tex = <line> Pos = $setlist_solid_line_pos dims = (896.0, 16.0) z = ($setlist_page1_z + 0.1)
			Change setlist_line_index = ($setlist_line_index + 1)
			if ($setlist_line_index = $setlist_line_max)
				Change \{setlist_line_index = 0}
			endif
			<line> = Random (@ ($setlist_dotted_lines [0]) @ ($setlist_dotted_lines [1]) @ ($setlist_dotted_lines [2]) )
			displaySprite parent = setlist_menu tex = <line> Pos = $setlist_dotted_line_pos dims = (896.0, 16.0) z = ($setlist_page1_z + 0.1)
			Change setlist_line_index = ($setlist_line_index + 1)
			Change setlist_solid_line_pos = (($setlist_solid_line_pos) + ($setlist_solid_line_add))
			Change setlist_dotted_line_pos = (($setlist_dotted_line_pos) + ($setlist_solid_line_add))
			repeat <i>
		endif
		Change setlist_page3_num = ($setlist_page3_num + 1)
		if ($setlist_page3_num = 5)
			Change \{setlist_page3_num = 0}
			Change setlist_page3_pos = ($setlist_page3_pos + (0.0, 532.0))
			displaySprite \{parent = setlist_loops_menu
				tex = setlist_page3_loop_13x11
				Pos = $setlist_page3_pos
				dims = $setlist_page3_dims
				z = $setlist_page3_z}
		endif
	else
		Change setlist_random_images_scroll_num = ($setlist_random_images_scroll_num - 1)
		Change setlist_background_loop_num = ($setlist_background_loop_num - 1)
		Change setlist_page1_num = ($setlist_page1_num - 1)
		Change setlist_line_num = ($setlist_line_num - 1)
		Change setlist_line_index = ($setlist_line_index + 1)
		if ($setlist_line_index = $setlist_line_max)
			Change \{setlist_line_index = 0}
		endif
		Change setlist_page3_num = ($setlist_page3_num - 1)
		Change setlist_page2_num = ($setlist_page2_num - 1)
	endif
	if GotParam \{up}
		generic_menu_up_or_down_sound \{up}
	endif
	if GotParam \{down}
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
	GetArraySize ($setlist_random_bg_images)
	begin
	GetRandomValue a = 0 b = (<array_Size> -1) integer Name = randimage
	myimage = ($setlist_random_bg_images [<randimage>].texture)
	if NOT (<myimage> = <old_image>)
		if StructureContains structure = ($setlist_random_bg_images [<randimage>]) flippable
			<flippable> = 1
		endif
		if StructureContains structure = ($setlist_random_bg_images [<randimage>]) dims
			<mydims> = ($setlist_random_bg_images [<randimage>].dims)
		endif
		if StructureContains structure = ($setlist_random_bg_images [<randimage>]) minrot
			<minrot> = ($setlist_random_bg_images [<randimage>].minrot)
		endif
		if StructureContains structure = ($setlist_random_bg_images [<randimage>]) maxrot
			<maxrot> = ($setlist_random_bg_images [<randimage>].maxrot)
		endif
		if StructureContains structure = ($setlist_random_bg_images [<randimage>]) loffset
			<loffset> = ($setlist_random_bg_images [<randimage>].loffset)
		endif
		if StructureContains structure = ($setlist_random_bg_images [<randimage>]) roffset
			<roffset> = ($setlist_random_bg_images [<randimage>].roffset)
		endif
		if StructureContains structure = ($setlist_random_bg_images [<randimage>]) only_left
			<can_right> = 0
		endif
		if StructureContains structure = ($setlist_random_bg_images [<randimage>]) only_right
			<can_left> = 0
		endif
		if StructureContains structure = ($setlist_random_bg_images [<randimage>]) center_just
			<just> = [center center]
		endif
		<old_image> = <myimage>
		break
	endif
	repeat
	GetRandomValue \{a = 300
		b = 600
		integer
		Name = randdown}
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
		GetRandomValue \{a = 1
			b = 3
			integer
			Name = randflip}
		if (<randflip> = 1)
			imageflag = {flip_h flip_v}
		elseif (<randflip> = 2)
			imageflag = {flip_h}
		else
			imageflag = {flip_v}
		endif
	endif
	GetRandomValue a = <minrot> b = <maxrot> Name = randrot
	if StructureContains structure = ($setlist_random_bg_images [<randimage>]) shoeprint
		displaySprite parent = setlist_bg_container tex = <myimage> Pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 3.2 BlendMode = subtract
		displaySprite parent = setlist_bg_container tex = <myimage> Pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 3.2 BlendMode = subtract
		displaySprite parent = setlist_bg_container tex = <myimage> Pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 3.2 BlendMode = subtract
	else
		displaySprite parent = setlist_bg_container tex = <myimage> Pos = <imagepos> dims = <mydims> rot_angle = <randrot> z = 6.0 <imageflag> just = <just>
		displaySprite parent = setlist_bg_container tex = <myimage> Pos = <imagepos> dims = <mydims> rot_angle = <randrot> z = 6.0 <imageflag> just = <just>
	endif
	<side> = 1
	repeat 2
endscript
changing_tab = 0

script change_tab \{tab = tab_setlist
		button = 0}
	Change \{changing_tab = 1}
	if ($current_tab = <tab> && <button> = 1)
		Change \{changing_tab = 0}
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
		get_progression_globals game_mode = ($game_mode) Bonus
	endif
	Change g_gh3_setlist = $<tier_global>
	Change current_tab = <tab>
	destroy_setlist_scrolling_menu
	create_setlist_scrolling_menu
	reset_vars \{del}
	destroy_menu \{menu_id = setlist_original_artist}
	destroy_menu \{menu_id = setlist_loops_menu}
	destroy_menu \{menu_id = setlist_menu}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = setlist_loops_menu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	switch <tab>
		case tab_setlist
		Change \{setlist_page3_z = 3.3}
		Change \{setlist_page2_z = 3.4}
		Change \{setlist_page1_z = 3.5}
		displaySprite \{parent = setlist_loops_menu
			tex = setlist_page1_loop_89x33
			Pos = $setlist_page1_loop_pos
			dims = $setlist_page1_dims
			z = $setlist_page1_z}
		displaySprite parent = setlist_loops_menu tex = setlist_page3_loop_13x11 Pos = ($setlist_page3_pos + (-180.0, 614.0)) dims = $setlist_page3_dims z = $setlist_page3_z
		case tab_bonus
		Change \{setlist_page3_z = 3.3}
		Change \{setlist_page2_z = 3.8}
		Change \{setlist_page1_z = 3.4}
		displaySprite \{parent = setlist_loops_menu
			tex = setlist_page1_loop_89x33
			Pos = $setlist_page1_loop_pos
			dims = $setlist_page1_dims
			z = $setlist_page1_z}
		displaySprite parent = setlist_loops_menu tex = setlist_page2_loop_80x65 Pos = ($setlist_page2_pos + (0.0, 553.0)) dims = $setlist_page2_dims z = $setlist_page2_z
	endswitch
	create_sl_assets <tab>
	SetScreenElementProps \{id = setlist_bg_container
		Pos = (0.0, 0.0)}
	Change \{setlist_random_images_scroll_num = 0}
	Change setlist_page2_pos = ($setlist_page2_pos + (0.0, 553.0))
	Change setlist_page3_pos = ($setlist_page3_pos + (-180.0, 614.0))
	SetScreenElementProps \{id = sl_page2_head
		z_priority = $setlist_page2_z}
	SetScreenElementProps \{id = sl_page1_head
		z_priority = $setlist_page1_z}
	if ($setlist_selection_found = 1)
		formatText \{checksumName = tier_checksum
			'tier%s'
			s = $setlist_selection_tier}
		song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
		0xa1519d9c song = <song>
	else
		0xc337ea4c
	endif
	KillSpawnedScript \{Name = set_song_icon}
	SpawnScriptNow \{set_song_icon
		params = {
			no_wait
		}}
	LaunchEvent \{Type = focus
		target = current_menu}
	Change \{changing_tab = 0}
endscript

script reset_vars 
	if GotParam \{del}
		Change \{setlist_begin_text = (0.0, 0.0)}
		Change \{setlist_background_pos = (0.0, 0.0)}
		Change \{setlist_background_loop_pos = (0.0, 676.0)}
		Change \{setlist_background_loop_num = 0}
		Change \{setlist_selection_index = 0}
		destroy_menu \{menu_id = sl_overshadow}
		destroy_menu \{menu_id = sl_clipart}
		destroy_menu \{menu_id = sl_clipart_shadow}
		destroy_menu \{menu_id = sl_clip}
		destroy_menu \{menu_id = sl_bg_helper}
		destroy_menu \{menu_id = sl_highlight}
		destroy_menu \{menu_id = sl_fixed}
	endif
	Change \{setlist_page1_num = 0}
	Change \{setlist_page1_loop_pos = (157.0, 768.0)}
	Change \{setlist_line_num = 0}
	Change \{setlist_page3_pos = (210.0, 86.0)}
	Change \{setlist_page3_num = 0}
	Change \{setlist_page2_num = 0}
	Change \{setlist_page2_pos = (240.0, 50.0)}
	Change \{setlist_line_index = 0}
	Change \{setlist_clip_last_rot = 0}
	Change \{setlist_clip_rot_neg = 0}
endscript
onlinebetasongs = [
	areyougonnagomyway
	nevertoolate
	whativedone
]
we_have_songs = FALSE

script create_sl_assets 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = setlist_menu
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if NOT ScreenElementExists \{id = setlist_bg_container}
		CreateScreenElement \{Type = ContainerElement
			parent = root_window
			id = setlist_bg_container
			Pos = (0.0, 0.0)
			just = [
				left
				top
			]}
	endif
	displaySprite \{id = sl_bg_head
		parent = setlist_menu
		tex = setlist_bg_head_676
		Pos = (0.0, 0.0)
		dims = (1280.0, 676.0)
		z = 3.1}
	displaySprite \{id = sl_bg_loop
		parent = setlist_menu
		tex = setlist_bg_loop_1308
		Pos = $setlist_background_loop_pos
		dims = (1280.0, 1352.0)
		z = 3.1}
	begin
	displaySprite \{parent = setlist_menu
		tex = Setlist_Shoeprint
		Pos = (850.0, -70.0)
		dims = (640.0, 768.0)
		alpha = 0.15
		z = 3.2
		flip_v
		rot_angle = 10
		BlendMode = subtract}
	repeat 3
	displaySprite \{id = sl_page2_head
		parent = setlist_menu
		tex = setlist_page2_head_80x54
		Pos = $setlist_page2_pos
		dims = (819.0, 553.0)
		z = $setlist_page2_z}
	displaySprite \{flip_h
		id = sl_page1_head
		parent = setlist_menu
		tex = setlist_page1_head_90x75
		Pos = (160.0, 0.0)
		dims = (922.0, 768.0)
		z = $setlist_page1_z}
	displaySprite parent = setlist_menu tex = Setlist_Page1_Line_Red Pos = (328.0, 12.0) dims = (8.0, 2200.0) z = ($setlist_page1_z + 0.1)
	displaySprite parent = setlist_menu tex = Setlist_Page1_Line_Red Pos = (328.0, 2212.0) dims = (8.0, 2200.0) z = ($setlist_page1_z + 0.1)
	displaySprite parent = setlist_menu tex = Setlist_Page1_Line_Red Pos = (328.0, 4412.0) dims = (8.0, 2000.0) z = ($setlist_page1_z + 0.1)
	<title_pos> = (300.0, 383.0)
	displaySprite id = sl_page1_head_lines parent = setlist_menu tex = Setlist_Page1_Head_Lines Pos = (176.0, 64.0) dims = (896.0, 320.0) z = ($setlist_page1_z + 0.1)
	<begin_line> = (176.0, 420.0)
	<solid_line_pos> = (176.0, 340.0)
	<dotted_line_pos> = (176.0, 380.0)
	<dotted_line_add> = ($setlist_solid_line_add)
	begin
	<line> = Random (@ ($setlist_solid_lines [0]) @ ($setlist_solid_lines [1]) @ ($setlist_solid_lines [2]) )
	<solid_line_pos> = (<solid_line_pos> + $setlist_solid_line_add)
	displaySprite parent = setlist_menu tex = <line> Pos = <solid_line_pos> dims = (883.0, 16.0) z = ($setlist_page1_z + 0.1)
	repeat 8
	begin
	<line> = Random (@ ($setlist_dotted_lines [0]) @ ($setlist_dotted_lines [1]) @ ($setlist_dotted_lines [2]) )
	<dotted_line_pos> = (<dotted_line_pos> + <dotted_line_add>)
	displaySprite parent = setlist_menu tex = <line> Pos = <dotted_line_pos> dims = (883.0, 16.0) z = ($setlist_page1_z + 0.1)
	repeat 8
	<solid_line_pos> = (<solid_line_pos> + $setlist_solid_line_add)
	<dotted_line_pos> = (<dotted_line_pos> + <dotted_line_add>)
	Change setlist_solid_line_pos = <solid_line_pos>
	Change setlist_dotted_line_pos = <dotted_line_pos>
	Change \{setlist_num_songs = 0}
	if English
		setlist_header_tex = Setlist_Page1_Title
	elseif French
		setlist_header_tex = Setlist_Page1_Title_fr
	elseif German
		setlist_header_tex = Setlist_Page1_Title_de
	elseif Spanish
		setlist_header_tex = Setlist_Page1_Title_sp
	elseif Italian
		setlist_header_tex = Setlist_Page1_Title_it
	endif
	if GotParam \{tab_setlist}
		displaySprite id = sl_page1_title parent = setlist_menu tex = <setlist_header_tex> Pos = (330.0, 220.0) dims = (512.0, 128.0) alpha = 0.7 z = ($setlist_page1_z + 0.2) rot_angle = 0
		displaySprite id = sl_page1_title_shadow parent = setlist_menu tex = <setlist_header_tex> Pos = (325.0, 230.0) dims = (512.0, 128.0) alpha = 0.2 z = ($setlist_page1_z + 0.2) rot_angle = -2
		GetUpperCaseString ($g_gh3_setlist.tier1.title)
		displayText id = sl_text_1 parent = setlist_menu Scale = (1.0, 1.0) text = <UppercaseString> rgba = [195 80 45 255] Pos = <title_pos> z = $setlist_text_z noshadow
	endif
	if GotParam \{tab_bonus}
		displayText \{parent = setlist_menu
			id = sl_text_1
			text = qs(0xa8cdde4f)
			font = fontgrid_text_a10
			Scale = 2
			Pos = (330.0, 220.0)
			rgba = [
				50
				30
				20
				255
			]
			z = $setlist_text_z
			noshadow}
		displaySprite parent = setlist_menu tex = Setlist_Page1_Line_Red Pos = (320.0, 216.0) dims = (8.0, 3200.0) z = ($setlist_page1_z - 0.2)
	endif
	<text_pos> = (<title_pos> + (40.0, 54.0))
	if ((GotParam tab_setlist) || (GotParam tab_bonus) || (GotParam tab_downloads))
		num_tiers = ($g_gh3_setlist.num_tiers)
		<Tier> = 0
		Change \{setlist_selection_index = 0}
		Change \{setlist_selection_tier = 1}
		Change \{setlist_selection_song = 0}
		Change \{setlist_selection_found = 0}
		begin
		<Tier> = (<Tier> + 1)
		setlist_prefix = ($g_gh3_setlist.prefix)
		formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
		formatText checksumName = tier_checksum 'tier%s' s = <Tier>
		unlocked = 1
		if (<unlocked> = 1 || $is_network_game = 1)
			if NOT (<Tier> = 1)
				<text_pos> = (<text_pos> + (-40.0, 110.0))
				GetUpperCaseString ($g_gh3_setlist.<tier_checksum>.title)
				displayText parent = setlist_menu Scale = (1.0, 1.0) text = <UppercaseString> rgba = [190 75 40 255] Pos = <text_pos> z = $setlist_text_z noshadow
				<text_pos> = (<text_pos> + (40.0, 50.0))
			endif
			Change \{we_have_songs = FALSE}
			GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
			num_songs = <array_Size>
			num_songs_unlocked = 0
			song_count = 0
			if (<array_Size> > 0)
				begin
				setlist_prefix = ($g_gh3_setlist.prefix)
				format_globaltag_song_checksum part = ($g_gh3_setlist.part) song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
				for_bonus = 0
				if ($current_tab = tab_bonus)
					<for_bonus> = 1
				endif
				if IsSongAvailable song_checksum = <song_checksum> song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>]) for_bonus = <for_bonus>
					if ($setlist_selection_found = 0)
						Change setlist_selection_tier = <Tier>
						Change setlist_selection_song = <song_count>
						Change \{setlist_selection_found = 1}
					endif
					get_song_title song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					get_song_prefix song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					get_song_artist song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					if NOT GotParam \{song_artist}
						song_artist = qs(0xbf9c7a91)
					endif
					formatText \{checksumName = textid
						'id_song%i'
						i = $setlist_num_songs
						AddToStringLookup = true}
					CreateScreenElement {
						Type = TextElement
						id = <textid>
						parent = setlist_menu
						Scale = (0.85, 0.85)
						text = <song_title>
						Pos = <text_pos>
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
					GetGlobalTags <song_checksum>
					GetGlobalTags <songname>
					if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
						get_quickplay_song_stars song = <song_prefix>
					endif
					if NOT ($game_mode = practice || $game_mode = p2_pro_faceoff || $0x9b2cba3f = 1)
						if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
							GetGlobalTags <songname> param = tr_percent100
							percent100 = <tr_percent100>
						else
							GetGlobalTags <song_checksum> param = percent100
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
							displaySprite parent = setlist_menu tex = <star> rgba = [233 205 166 255] z = $setlist_text_z Pos = <star_pos>
							repeat <stars>
						endif
						GetGlobalTags <song_checksum> param = score
						if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
							get_quickplay_song_score song = <song_prefix>
						endif
						if (<score> > 0)
							formatText TextName = score_text qs(0x76b3fda7) d = <score> usecommas
							<score_pos> = (<text_pos> + (660.0, 40.0))
							CreateScreenElement {
								Type = TextElement
								parent = setlist_menu
								Scale = (0.75, 0.75)
								text = <score_text>
								Pos = <score_pos>
								rgba = [100 120 160 255]
								z_priority = $setlist_text_z
								font = fontgrid_text_a6
								just = [right top]
								noshadow
							}
						endif
					endif
					<text_pos> = (<text_pos> + (60.0, 40.0))
					formatText \{checksumName = artistid
						'artist_id%d'
						d = $setlist_num_songs}
					GetUpperCaseString <song_artist>
					song_artist = <UppercaseString>
					displayText parent = setlist_menu Scale = (0.6, 0.6) id = <artistid> text = <song_artist> rgba = [60 100 140 255] Pos = <text_pos> z = $setlist_text_z font_spacing = 1 noshadow
					<text_pos> = (<text_pos> + (-60.0, 40.0))
					Change setlist_num_songs = ($setlist_num_songs + 1)
					num_songs_unlocked = (<num_songs_unlocked> + 1)
					Change \{we_have_songs = true}
				endif
				song_count = (<song_count> + 1)
				repeat <num_songs>
			endif
		endif
		repeat <num_tiers>
	endif
	if ((($game_mode = gh4_p1_career) || ($game_mode = gh4_p2_career)) && $is_demo_mode = 0)
		get_progression_globals game_mode = ($game_mode)
		summation_career_score tier_global = <tier_global>
		formatText TextName = total_score_text qs(0x7b2c5967) d = <career_score> usecommas
		displayText {
			parent = setlist_menu
			Scale = 0.8
			text = <total_score_text>
			Pos = ((647.0, 115.0) + (<text_pos>.(0.0, 1.0) * (0.0, 1.0)))
			just = [center top]
			z = $setlist_text_z
			rgba = [30 30 30 255]
			noshadow
		}
	endif
	Change \{setlist_begin_text = $setlist_menu_pos}
	if ($setlist_num_songs > 0)
		retail_menu_focus \{id = id_song0}
		SetScreenElementProps \{id = id_song0
			Shadow}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = sl_fixed
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	<clip_pos> = (160.0, 390.0)
	displaySprite id = sl_clipart parent = sl_fixed Pos = <clip_pos> dims = (160.0, 160.0) z = ($setlist_text_z + 0.1) rgba = [200 200 200 255]
	displaySprite id = sl_clipart_shadow parent = sl_fixed Pos = (<clip_pos> + (3.0, 3.0)) dims = (160.0, 160.0) z = ($setlist_text_z) rgba = [0 0 0 128]
	<clip_pos> = (<clip_pos> + (15.0, 50.0))
	displaySprite id = sl_clip parent = sl_fixed tex = Setlist_Clip just = [-0.5 -0.9] Pos = <clip_pos> dims = (141.0, 102.0) z = ($setlist_text_z + 0.2)
	if ($current_tab = tab_setlist)
		hilite_dims = (737.0, 80.0)
	elseif ($current_tab = tab_bonus)
		hilite_dims = (690.0, 80.0)
	endif
	displaySprite id = sl_highlight parent = sl_fixed tex = white Pos = (326.0, 428.0) dims = <hilite_dims> z = ($setlist_text_z - 0.1) rgba = [255 255 255 128]
	<bg_helper_pos> = (140.0, 585.0)
	<helper_rgba> = [105 65 7 160]
	if ($current_tab = tab_setlist)
		setlist_show_helperbar Pos = (<bg_helper_pos> + (64.0, 4.0))
	elseif ($current_tab = tab_bonus)
		setlist_show_helperbar {
			Pos = (<bg_helper_pos> + (64.0, 4.0))
			text_option1 = qs(0x3c1b3ab6)
			button_option1 = qs(0x9e1f95ce)
		}
	else
		setlist_show_helperbar {
			Pos = (<bg_helper_pos> + (64.0, 4.0))
			text_option1 = qs(0x3c1b3ab6)
			text_option2 = qs(0x2e900a4e)
			button_option1 = qs(0x9e1f95ce)
			button_option2 = qs(0x8704a48f)
		}
	endif
endscript

script get_quickplay_song_score 
	if NOT GotParam \{difficulty_text_nl}
		if ($game_mode = p2_quickplay)
			get_difficulty_text_nl difficulty = ($current_difficulty_coop)
		else
			get_difficulty_text_nl difficulty = ($player1_status.difficulty)
		endif
	endif
	if NOT GotParam \{part}
		part = 'guitar'
	endif
	get_formatted_songname song_prefix = <song> difficulty_text_nl = <difficulty_text_nl> part = <part>
	GetGlobalTags <songname>
	return score = <bestscore>
endscript

script get_quickplay_song_stars 
	if NOT GotParam \{part}
		part = 'guitar'
	endif
	get_formatted_songname song_prefix = <song> difficulty_text_nl = <difficulty_text_nl> part = <part>
	GetGlobalTags <songname>
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
