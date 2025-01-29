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
		dims = (400.0, 400.0)
		minrot = -50
		loffset = (-180.0, 0.0)
		only_left
		low_z
	}
	{
		texture = setlist_ernieBall
		dims = (384.0, 384.0)
		only_right
		roffset = (-30.0, 0.0)
		low_z
	}
	{
		texture = setlist_button_GunsNRoses
		dims = (256.0, 256.0)
		loffset = (-50.0, 0.0)
		roffset = (50.0, 0.0)
	}
]
setlist_solid_lines = [
	Setlist_Page1_Line_Solid1
	Setlist_Page1_Line_Solid2
	Setlist_Page1_Line_Solid3
]
setlist_dotted_lines = [
	Setlist_Page1_Line_Dotted1
	Setlist_Page1_Line_Dotted2
	Setlist_Page1_Line_Dotted3
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
g_gh3_setlist = NULL
current_tab = tab_setlist
setlist_page1_z = 0
setlist_page2_z = 0
current_setlist_songpreview = None
target_setlist_songpreview = None
setlist_songpreview_changing = 0

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
		text = 'AS MADE'
		font = text_a3
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
		text = 'FAMOUS BY'
		just = [center top]
		font = text_a3
		Pos = (<Pos> + (0.0, 25.0))
		z = 502
		Scale = (0.72499996, 0.5)
		rgba = [0 0 0 255]
		noshadow
	}
	fit_text_in_rectangle id = <id> dims = (90.0, 15.0)
	DoScreenElementMorph id = setlist_original_artist alpha = 1 time = <time>
endscript

script set_song_icon 
	if NOT GotParam \{no_wait}
		Wait \{0.5
			Seconds}
	endif
	if NOT GotParam \{song}
		<song> = ($target_setlist_songpreview)
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
	mini_rot = RandomRange (-5.0, 5.0)
	if ScreenElementExists \{id = sl_clipart}
		SetScreenElementProps id = sl_clipart texture = <song_icon>
		DoScreenElementMorph id = sl_clipart alpha = 1 time = 0.25 rot_angle = <mini_rot>
	endif
	if ScreenElementExists \{id = sl_clipart_shadow}
		SetScreenElementProps id = sl_clipart_shadow texture = <song_icon>
		DoScreenElementMorph id = sl_clipart_shadow alpha = 1 time = 0.25 rot_angle = <mini_rot>
	endif
	if ScreenElementExists \{id = sl_clip}
		GetScreenElementProps \{id = sl_clip}
		rot_clip_a = <rot_angle>
		rot_clip_b = (<rot_clip_a> + 10)
		SetScreenElementProps id = sl_clip rot_angle = <rot_clip_b>
		DoScreenElementMorph id = sl_clip alpha = 1 rot_angle = <rot_clip_a> time = 0.25
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
			target = vmenu_setlist}
	endif
	begin
	if ($changing_tab = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ($is_network_game = 1)
		if ($g_tie_breaker_song = 0)
			net_setlist_go_back
		endif
	else
		ui_flow_manager_respond_to_action action = go_back create_params = {Player = ($current_num_players)}
	endif
endscript

script displaySprite \{just = [
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
		BlendMode = {
		}
		internal_just = {
		}
		Scale = {
		}
		alpha = 1}

	if GotParam \{rot_angle}
		rot_struct = {rot_angle = <rot_angle>}
	else
		rot_struct = {}
	endif
	CreateScreenElement {
		Type = SpriteElement
		id = <id>
		parent = <parent>
		texture = <tex>
		dims = <dims>
		rgba = <rgba>
		Pos = <Pos>
		just = <just>
		internal_just = <internal_just>
		z_priority = <z>
		Scale = <Scale>
		<rot_struct>
		blend = <BlendMode>
		alpha = <alpha>
	}
	if GotParam \{flip_v}
		<id> :SetProps flip_v
	endif
	if GotParam \{flip_h}
		<id> :SetProps flip_h
	endif
	return id = <id>
endscript

script displayText \{id = {
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

	CreateScreenElement {
		Type = TextElement
		parent = <parent>
		font = <font>
		Scale = <Scale>
		rgba = <rgba>
		text = <text>
		id = <id>
		Pos = <Pos>
		just = <just>
		rot_angle = <rot>
		z_priority = <z>
		font_spacing = <font_spacing>
	}
	if GotParam \{noshadow}
		<id> :SetProps noshadow
	else
		<id> :SetProps Shadow shadow_offs = (3.0, 3.0) shadow_rgba [0 0 0 255]
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
		Change \{current_tab = tab_setlist}
		Change \{setlist_previous_tier = 1}
		Change \{setlist_previous_song = 0}
		Change \{setlist_previous_tab = tab_setlist}
	endif
	if ($end_credits = 1)
		Progression_EndCredits
		return
	endif
	Change \{boss_wuss_out = 0}
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
	Change \{progression_unlocked_guitar = -1}
	Change \{progression_unlocked_guitar2 = -1}
	Change \{rich_presence_context = presence_song_list}
	menu_music_off
	get_progression_globals game_mode = ($game_mode)
	Change g_gh3_setlist = <tier_global>
	create_setlist_scrolling_menu
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
		target = vmenu_setlist}
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
		Change target_setlist_songpreview = <song>
	else
		Change \{target_setlist_songpreview = None}
	endif
	if ($g_keep_song_preview = 0)
		destroy_setlist_songpreview_monitor
		SpawnScriptLater \{setlist_songpreview_monitor}
	endif
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		net_lobby_state_message \{current_state = song
			action = approval}
		Change \{net_can_send_approval = 0}
	endif
endscript

script create_setlist_scrolling_menu 
	kill_start_key_binding
	UnPauseGame
	if ($player1_status.bot_play = 1)
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_faceoff ||
				$game_mode = p2_pro_faceoff ||
				$game_mode = p2_battle ||
				$game_mode = p2_quickplay)
			exclusive_mp_controllers = [0 , 0]
			SetArrayElement ArrayName = exclusive_mp_controllers index = 0 NewValue = ($player1_device)
			SetArrayElement ArrayName = exclusive_mp_controllers index = 1 NewValue = ($player2_device)
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
		on_left = setlist_debug_unlockall
		on_select = setlist_debug_unlockall
		exclusive_device = <exclusive_device>
		no_focus = <no_focus_value>
		focus_color = black
		unfocus_color = dk_violet_grey
	}
	if ($is_network_game = 1)
		if ScreenElementExists \{id = dl_content_warning}
			DestroyScreenElement \{id = dl_content_warning}
		endif
	endif
endscript

script destroy_setlist_scrolling_menu 
	KillSpawnedScript \{Name = scroll_ticker_text}
	destroy_menu \{menu_id = scrolling_setlist}
	clean_up_user_control_helpers
endscript

script destroy_setlist_songpreview_monitor 
	unpausespawnedscript \{setlist_songpreview_monitor}
	begin
	if ($setlist_songpreview_changing = 0)
		break
	endif
	WaitOneGameFrame
	repeat
	0xc7acd659 \{unique_id = $0x0128364c}
	Change \{0x2041979c = 0}
	KillSpawnedScript \{Name = setlist_songpreview_monitor}
	if NOT ($current_setlist_songpreview = None)
		get_song_prefix song = ($current_setlist_songpreview)
		formatText checksumName = song_preview '%s_preview' s = <song_prefix>
		stopsound <song_preview>
		SongUnLoadFSBIfDownloaded
	endif
endscript

script destroy_setlist_menu 
	KillSpawnedScript \{Name = net_match_download_songs}
	KillSpawnedScript \{Name = scroll_ticker_text}
	if ($g_keep_song_preview = 0)
		destroy_setlist_songpreview_monitor
		Change \{target_setlist_songpreview = None}
	endif
	if ScreenElementExists \{id = setlist_overlay}
		DestroyScreenElement \{id = setlist_overlay}
	endif
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
	destroy_setlist_popup
endscript

script setlist_choose_song \{device_num = 0}
	if GotParam \{song_count}
		if ($is_network_game = 1)
			net_request_song Tier = <Tier> song_count = <song_count>
		else
			if ($transitions_locked = 0)
				LaunchEvent \{Type = unfocus
					target = vmenu_setlist}
			endif
			formatText checksumName = tier_checksum 'tier%s' s = <Tier>
			Change current_song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
			SetGlobalTags Progression params = {current_tier = <Tier>}
			SetGlobalTags Progression params = {current_song_count = <song_count>}
			Change \{current_level = $g_last_venue_selected}
			get_song_struct song = ($current_song)
			if ((StructureContains structure = <song_struct> boss) || $game_mode = p2_battle)
				get_current_battle_first_play
				if (<first_battle_play> = 1 || (StructureContains structure = <song_struct> boss))
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
		formatText checksumName = tier_checksum 'tier%s' s = <Tier>
		Change current_song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
		SetGlobalTags Progression params = {current_tier = <Tier>}
		SetGlobalTags Progression params = {current_song_count = <song_count>}
		load_songqpak song_name = ($current_song) async = 0
		setup_gemarrays song_name = ($current_song) difficulty = ($current_difficulty) player_status = player1_status
		calc_songscoreinfo
		Change structurename = player1_status score = ($player1_status.base_score * 2.8 + 1)
		Progression_SongWon
		if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
			menu_top_rockers_check_for_new_top_score
		endif
		songpreview = ($current_setlist_songpreview)
		change_tab tab = ($current_tab)
		Change current_setlist_songpreview = <songpreview>
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
				GetGlobalTags ($Secret_Characters [<boss_character>].id)
				if (<unlocked_for_purchase> = 0)
					SetGlobalTags ($Secret_Characters [<boss_character>].id) params = {unlocked_for_purchase = 1}
				endif
			endif
		endif
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
			target = vmenu_setlist}
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
		if ($game_mode = training || $is_network_game = 1)
			return
		endif
		level = ($current_level)
		get_progression_globals game_mode = ($game_mode)
		GlobalTags_UnlockAll SongList = <tier_global>
		GlobalTags_UnlockAll \{SongList = GH3_Bonus_Songs}
		Change \{structurename = player1_status
			notes_hit = 100}
		Change \{structurename = player1_status
			total_notes = 100}
		Change \{structurename = player2_status
			notes_hit = 100}
		Change \{structurename = player2_status
			total_notes = 100}
		if ($game_mode = p1_career)
			UpdateAtoms \{Name = Progression}
		endif
		UpdateAtoms \{Name = achievement}
		songpreview = ($current_setlist_songpreview)
		change_tab tab = ($current_tab)
		Change current_setlist_songpreview = <songpreview>
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
			target = vmenu_setlist}
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
	if ($setlist_num_songs < 2)
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
		formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = ($setlist_selection_song + 1) s = $setlist_selection_tier AddToStringLookup = true
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
		formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = ($setlist_selection_song + 1) s = $setlist_selection_tier AddToStringLookup = true
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
	Change target_setlist_songpreview = <song>
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
	<Tier> = $setlist_selection_tier
	setlist_prefix = ($g_gh3_setlist.prefix)
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	get_song_covered_by song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
	if GotParam \{covered_by}
		setlist_footnote \{alpha = 1}
	else
		setlist_footnote \{alpha = 0}
	endif
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
				tex = Setlist_BG_Loop
				Pos = $setlist_background_loop_pos
				dims = (1280.0, 1308.0)
				z = 3.1}
		endif
		Change setlist_page1_num = ($setlist_page1_num + 1)
		if ($setlist_page1_num = 4)
			Change \{setlist_page1_num = 0}
			Change setlist_page1_loop_pos = ($setlist_page1_loop_pos + (0.0, 512.0))
			displaySprite \{parent = setlist_loops_menu
				tex = Setlist_Page1_Loop
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
					tex = Setlist_Page2_Loop
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
	else
		Change setlist_random_images_scroll_num = ($setlist_random_images_scroll_num - 1)
		Change setlist_background_loop_num = ($setlist_background_loop_num - 1)
		Change setlist_page1_num = ($setlist_page1_num - 1)
		Change setlist_line_num = ($setlist_line_num - 1)
		Change setlist_line_index = ($setlist_line_index + 1)
		if ($setlist_line_index = $setlist_line_max)
			Change \{setlist_line_index = 0}
		endif
		Change setlist_page2_num = ($setlist_page2_num - 1)
	endif
	if GotParam \{up}
		generic_menu_up_or_down_sound \{up}
	endif
	if GotParam \{down}
		generic_menu_up_or_down_sound \{down}
	endif
endscript

script setlist_footnote \{alpha = 1}
	if NOT ScreenElementExists \{id = setlist_overlay}
		CreateScreenElement {
			Type = ContainerElement
			parent = root_window
			id = setlist_overlay
			Pos = (0.0, 0.0)
			just = [left top]
			alpha = <alpha>
		}
		CreateScreenElement \{Type = ContainerElement
			parent = setlist_overlay
			id = setlist_footer
			Pos = (640.0, 645.0)
			z_priority = 1000
			just = [
				center
				bottom
			]
			alpha = 1}
		CreateScreenElement \{Type = ContainerElement
			parent = setlist_footer
			id = footer_gradient
			Pos = (0.0, -17.0)
			z_priority = 1000
			just = [
				center
				bottom
			]
			alpha = 1
			rot_angle = 90}
		CreateScreenElement \{Type = SpriteElement
			parent = footer_gradient
			texture = Control_pill_body
			dims = (33.0, 600.0)
			Pos = (0.0, 0.0)
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
		CreateScreenElement \{Type = SpriteElement
			parent = footer_gradient
			texture = Control_pill_body
			dims = (33.0, 600.0)
			Pos = (0.0, 0.0)
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
		CreateScreenElement {
			Type = TextElement
			parent = setlist_footer
			id = setlist_footer_text
			Scale = (0.7, 0.7)
			text = '*COVER OF LISTED BAND\'S HIT'
			Pos = (0.0, -5.0)
			rgba = (($g_menu_colors).lt_violet_grey)
			font = text_a11
			just = [center bottom]
			font_spacing = 0.8
			Shadow
			shadow_offs = (1.0, 1.0)
			shadow_rgba = [0 0 0 255]
			alpha = 1
			z_priority = 1002
		}
	endif
	if (<alpha> = 1)
		<Tier> = $setlist_selection_tier
		setlist_prefix = ($g_gh3_setlist.prefix)
		formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
		formatText checksumName = tier_checksum 'tier%s' s = <Tier>
		get_song_artist song = (($g_gh3_setlist).<tier_checksum>.songs [($setlist_selection_song)]) with_year = 0
		formatText \{checksumName = artistid
			'artist_id%d'
			d = $setlist_num_songs}
		GetUpperCaseString <song_artist>
		song_artist = <UppercaseString>
		StringLength string = <song_artist>
		StringToCharArray string = <song_artist>
		if ((<char_array> [(<str_len> - 1)]) = 'S')
			formatText TextName = text '*COVER OF %a\' HIT' a = <song_artist>
		else
			formatText TextName = text '*COVER OF %a\'S HIT' a = <song_artist>
		endif
		SetScreenElementProps id = setlist_footer_text text = <text>
		DoScreenElementMorph \{id = setlist_overlay
			alpha = 1
			time = 0.25}
	else
		SetScreenElementProps \{id = setlist_footer_text
			text = '*COVER OF LISTED BAND\'S HIT'}
		DoScreenElementMorph \{id = setlist_overlay
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
		if StructureContains structure = ($setlist_random_bg_images [<randimage>]) low_z
			<z_priority> = 3.2
		else
			<z_priority> = 6
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
		displaySprite parent = setlist_bg_container tex = <myimage> Pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 2.0 BlendMode = subtract
		displaySprite parent = setlist_bg_container tex = <myimage> Pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 2.0 BlendMode = subtract
		displaySprite parent = setlist_bg_container tex = <myimage> Pos = <imagepos> dims = (512.0, 512.0) rot_angle = <randrot> z = 2.0 BlendMode = subtract
	else
		displaySprite parent = setlist_bg_container tex = <myimage> Pos = <imagepos> dims = <mydims> rot_angle = <randrot> z = <z_priority> <imageflag> just = <just>
		displaySprite parent = setlist_bg_container tex = <myimage> Pos = <imagepos> dims = <mydims> rot_angle = <randrot> z = <z_priority> <imageflag> just = <just>
	endif
	<side> = 1
	repeat 2
endscript
0x0128364c = 0
0x2041979c = 0

script setlist_songpreview_monitor 
	begin
	if NOT ($current_setlist_songpreview = $target_setlist_songpreview)
		begin
		0x84b6c98b = $target_setlist_songpreview
		Wait \{15
			gameframes}
		if (<0x84b6c98b> = $target_setlist_songpreview)
			break
		endif
		repeat
		Change \{setlist_songpreview_changing = 1}
		song = ($target_setlist_songpreview)
		Change \{0x2041979c = 1}
		0xc7acd659 \{unique_id = $0x0128364c}
		if (0xa55a768d <song> 0x3dd98e8d = 33075 stereo = true vol = $0xfbaf57a3)
			Change 0x0128364c = <unique_id>
			begin
			if PreloadStreamDone \{$0x0128364c}
				break
			endif
			Wait \{1
				gameframe}
			repeat
			StartPreLoadedStream \{$0x0128364c}
			Change \{0x2041979c = 0}
		else
			Change \{0x0128364c = 0}
		endif
		Change current_setlist_songpreview = <song>
		Change \{setlist_songpreview_changing = 0}
	else
		if ($0x0128364c != 0)
			if NOT 0x0a110288 \{$0x0128364c}
				Change \{current_setlist_songpreview = None}
			endif
			Wait \{1
				Second}
		endif
	endif
	WaitOneGameFrame
	repeat
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
	Change g_gh3_setlist = <tier_global>
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
		Change \{setlist_page2_z = 3.4}
		Change \{setlist_page1_z = 3.5}
		displaySprite \{parent = setlist_loops_menu
			tex = Setlist_Page1_Loop
			Pos = $setlist_page1_loop_pos
			dims = $setlist_page1_dims
			z = $setlist_page1_z}
		case tab_bonus
		Change \{setlist_page2_z = 3.8}
		Change \{setlist_page1_z = 3.4}
		displaySprite \{parent = setlist_loops_menu
			tex = Setlist_Page1_Loop
			Pos = $setlist_page1_loop_pos
			dims = $setlist_page1_dims
			z = $setlist_page1_z}
		displaySprite parent = setlist_loops_menu tex = Setlist_Page2_Loop Pos = ($setlist_page2_pos + (0.0, 553.0)) dims = $setlist_page2_dims z = $setlist_page2_z
	endswitch
	create_sl_assets <tab>
	SetScreenElementProps \{id = setlist_bg_container
		Pos = (0.0, 0.0)}
	Change \{setlist_random_images_scroll_num = 0}
	Change setlist_page2_pos = ($setlist_page2_pos + (0.0, 553.0))
	SetScreenElementProps \{id = sl_page2_head
		z_priority = $setlist_page2_z}
	SetScreenElementProps \{id = sl_page1_head
		z_priority = $setlist_page1_z}
	if ($setlist_selection_found = 1)
		formatText \{checksumName = tier_checksum
			'tier%s'
			s = $setlist_selection_tier}
		song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
		Change target_setlist_songpreview = <song>
	else
		Change \{target_setlist_songpreview = None}
	endif
	KillSpawnedScript \{Name = set_song_icon}
	SpawnScriptNow \{set_song_icon
		params = {
			no_wait
		}}
	if ($is_network_game = 0)
		LaunchEvent \{Type = focus
			target = vmenu_setlist}
	else
		if ($net_current_flow_state = song)
			LaunchEvent \{Type = focus
				target = vmenu_setlist}
		endif
	endif
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
	Change \{setlist_page2_num = 0}
	Change \{setlist_page2_pos = (240.0, 50.0)}
	Change \{setlist_line_index = 0}
	Change \{setlist_clip_last_rot = 0}
	Change \{setlist_clip_rot_neg = 0}
endscript

script IsSongAvailable \{for_bonus = 0}
	if ($coop_dlc_active = 1)
		if (<song> = paintitblack)
			return \{FALSE}
		endif
	endif
	if ($is_network_game)
		return \{true}
	endif
	if (<for_bonus> = 1)
		GetGlobalTags <song> param = unlocked
	else
		GetGlobalTags <song_checksum> param = unlocked
	endif
	if (<unlocked> = 1)
		return \{true}
	endif
	return \{FALSE}
endscript
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
		tex = Setlist_BG_Head
		Pos = (0.0, 0.0)
		dims = (1280.0, 676.0)
		z = 3.1}
	displaySprite \{id = sl_bg_loop
		parent = setlist_menu
		tex = Setlist_BG_Loop
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
		BlendMode = subtract
		z = 3.175}
	repeat 3
	displaySprite \{id = sl_page2_head
		parent = setlist_menu
		tex = Setlist_Page2_Head
		Pos = $setlist_page2_pos
		dims = (819.0, 553.0)
		z = $setlist_page2_z}
	displaySprite \{flip_h
		id = sl_page1_head
		parent = setlist_menu
		tex = Setlist_Page1_Head
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
		CreateScreenElement {
			Type = SpriteElement
			id = sl_page1_title
			parent = setlist_menu
			texture = <setlist_header_tex>
			Pos = (330.0, 220.0)
			dims = (512.0, 128.0)
			just = [top left]
			rgba = [100 230 255 255]
			alpha = 0.8
			z_priority = ($setlist_page1_z + 0.2)
			rot_angle = 0
			blend = subtract
			alpha = 0.7
		}
		GetUpperCaseString ($g_gh3_setlist.tier1.title)
		displayText id = sl_text_1 parent = setlist_menu Scale = (1.0, 1.0) text = <UppercaseString> rgba = (($g_menu_colors).pink) Pos = <title_pos> z = $setlist_text_z noshadow
	endif
	if GotParam \{tab_bonus}
		CreateScreenElement \{Type = TextElement
			parent = setlist_menu
			id = sl_text_1
			text = 'The Vault'
			font = text_a10
			Scale = 2
			Pos = (330.0, 220.0)
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
		displaySprite parent = setlist_menu tex = Setlist_Page1_Line_Red Pos = (328.0, 216.0) dims = (8.0, 3200.0) z = ($setlist_page1_z - 0.2)
	endif
	<text_pos> = (<title_pos> + (40.0, 54.0))
	if ((GotParam tab_setlist) || (GotParam tab_bonus))
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
		unlocked = 0
		GetGlobalTags <tiername> param = unlocked
		if (<unlocked> = 1 || $is_network_game = 1)
			if NOT (<Tier> = 1)
				<text_pos> = (<text_pos> + (-40.0, 110.0))
				GetUpperCaseString ($g_gh3_setlist.<tier_checksum>.title)
				displayText parent = setlist_menu Scale = (1.0, 1.0) text = <UppercaseString> rgba = (($g_menu_colors).pink) Pos = <text_pos> z = $setlist_text_z noshadow
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
				formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <Tier> AddToStringLookup = true
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
					if get_song_covered_by song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
						formatText TextName = song_title '%s (cover)*' s = <song_title>
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
						rgba = (($g_menu_colors).dk_violet_grey)
						z_priority = $setlist_text_z
						font = text_a5
						just = [left top]
						font_spacing = 0.5
						no_shadow
						shadow_offs = (1.0, 1.0)
						shadow_rgba = [0 0 0 255]
					}
					GetScreenElementDims id = <id>
					fit_text_in_rectangle id = <id> dims = ((475.0, 0.0) + (<height> * (0.0, 1.0))) start_x_scale = 0.85 start_y_scale = 0.85 only_if_larger_x = 1
					if ($game_mode = p2_quickplay)
						get_difficulty_text_nl difficulty = ($current_difficulty_coop)
					else
						get_difficulty_text_nl difficulty = ($current_difficulty)
					endif
					get_song_prefix song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					get_formatted_songname song_prefix = (<song_prefix>) difficulty_text_nl = <difficulty_text_nl>
					if ($is_network_game = 0)
						GetGlobalTags <song_checksum>
						GetGlobalTags <songname>
						if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
							get_quickplay_song_stars song = <song_prefix>
						endif
						if NOT ($game_mode = training || $game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
							if Progression_IsBossSong tier_global = $g_gh3_setlist Tier = <Tier> song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
								stars = 0
							endif
							if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
								GetGlobalTags <songname> param = percent100
							else
								GetGlobalTags <song_checksum> param = percent100
							endif
							if (<stars> > 2)
								<star_space> = (25.0, 0.0)
								<star_pos> = (<text_pos> + (670.0, 10.0))
								begin
								if (<percent100> = 1)
									<star> = Setlist_Goldstar
								else
									<star> = Random (@ ($setlist_loop_stars [0]) @ ($setlist_loop_stars [1]) @ ($setlist_loop_stars [2]) )
								endif
								<star_pos> = (<star_pos> - <star_space>)
								CreateScreenElement {
									Type = SpriteElement
									parent = setlist_menu
									texture = <star>
									just = [center center]
									rgba = [200 220 233 255]
									z_priority = $setlist_text_z
									Pos = <star_pos>
									rot_angle = (RandomRange (-20.0, 20.0))
									Scale = 0.9
								}
								repeat <stars>
							endif
							GetGlobalTags <song_checksum> param = score
							if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
								get_quickplay_song_score song = <song_prefix>
							endif
							if (<score> > 0)
								if Progression_IsBossSong tier_global = $g_gh3_setlist Tier = <Tier> song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
									if (<score> = 1)
										formatText \{TextName = score_text
											'WUSSED OUT'}
									else
										formatText \{TextName = score_text
											'BATTLE WON'}
									endif
								else
									formatText TextName = score_text '%d' d = <score> usecommas
								endif
								<score_pos> = (<text_pos> + (660.0, 40.0))
								CreateScreenElement {
									Type = TextElement
									parent = setlist_menu
									Scale = (0.75, 0.75)
									text = <score_text>
									Pos = <score_pos>
									rgba = (($g_menu_colors).dk_violet_grey)
									z_priority = $setlist_text_z
									font = text_a5
									just = [right top]
									noshadow
									alpha = 0.8
								}
								GetScreenElementDims id = <id>
								fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((130.0, 0.0) + <height> * (0.0, 1.0)) start_x_scale = 0.75 start_y_scale = 0.75
							endif
						endif
					endif
					<text_pos> = (<text_pos> + (60.0, 40.0))
					formatText \{checksumName = artistid
						'artist_id%d'
						d = $setlist_num_songs}
					GetUpperCaseString <song_artist>
					song_artist = <UppercaseString>
					CreateScreenElement {
						Type = TextElement
						parent = setlist_menu
						id = <artistid>
						font = text_a5
						Scale = (0.6, 0.6)
						just = [top left]
						text = <song_artist>
						rgba = (($g_menu_colors).dk_violet_grey)
						alpha = 0.5
						Pos = <text_pos>
						z_priority = $setlist_text_z
						font_spacing = 1
					}
					GetScreenElementDims id = <id>
					fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((425.0, 0.0) + (<height> * (0.0, 1.0))) start_x_scale = 0.6 start_y_scale = 0.6
					<text_pos> = (<text_pos> + (-60.0, 40.0))
					Change setlist_num_songs = ($setlist_num_songs + 1)
					num_songs_unlocked = (<num_songs_unlocked> + 1)
					Change \{we_have_songs = true}
				endif
				song_count = (<song_count> + 1)
				repeat <num_songs>
				if (($current_tab = tab_bonus) && (<num_songs_unlocked> = 0))
					CreateScreenElement {
						Type = TextElement
						parent = setlist_menu
						id = empty_bonus_song_title
						font = text_a5
						Scale = 1
						just = [center center]
						text = '(You haven\'t purchased any songs yet)'
						rgba = (($g_menu_colors).dk_violet_grey)
						Pos = (650.0, 470.0)
						z_priority = 50
						font_spacing = 1
					}
					GetScreenElementDims id = <id>
					fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((500.0, 0.0) + (<height> * (0.0, 1.0)))
				endif
			endif
			if (($game_mode = p1_career) && (GotParam tab_setlist) && $is_demo_mode = 0)
				GetGlobalTags <tiername> param = complete
				if (<complete> = 0)
					GetGlobalTags <tiername> param = boss_unlocked
					GetGlobalTags <tiername> param = encore_unlocked
					GetGlobalTags <tiername> param = aerosmith_unlocked
					if (<encore_unlocked> = 1)
						formatText \{TextName = completeText
							'Beat encore song to continue'}
					elseif (<aerosmith_unlocked> = 1)
						GetGlobalTags <tiername> param = num_songs_to_progress
						if (<num_songs_to_progress> = 1)
							formatText TextName = completeText 'Beat %p Aerosmith song to continue' p = <num_songs_to_progress>
						else
							formatText TextName = completeText 'Beat %p Aerosmith songs to continue' p = <num_songs_to_progress>
						endif
					elseif (<boss_unlocked> = 1)
						formatText \{TextName = completeText
							'Beat boss song to continue'}
					else
						GetGlobalTags <tiername> param = num_intro_songs_to_progress
						if (<num_intro_songs_to_progress> = 1)
							formatText TextName = completeText 'Beat %p opening act song to continue' p = <num_intro_songs_to_progress>
						else
							formatText TextName = completeText 'Beat %p opening act songs to continue' p = <num_intro_songs_to_progress>
						endif
					endif
					CreateScreenElement {
						Type = TextElement
						parent = setlist_menu
						Scale = 1
						text = <completeText>
						font = text_a5
						Pos = (<text_pos> + (300.0, 38.0))
						just = [center top]
						z_priority = $setlist_text_z
						rgba = (($g_menu_colors).pink)
					}
					GetScreenElementDims id = <id>
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
			formatText TextName = total_score_text 'Career Score: %d' d = <career_score> usecommas
			displayText {
				parent = setlist_menu
				Scale = 0.8
				text = <total_score_text>
				Pos = ((647.0, 115.0) + (<text_pos>.(0.0, 1.0) * (0.0, 1.0)))
				just = [center top]
				z = $setlist_text_z
				rgba = (($g_menu_colors).dk_violet_grey)
				noshadow
			}
		endif
	endif
	Change \{setlist_begin_text = $setlist_menu_pos}
	if ($setlist_num_songs > 0)
		setlist_menu_focus \{id = id_song0}
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
		hilite_dims = (710.0, 80.0)
	endif
	if GotParam \{tab_bonus}
		CreateScreenElement {
			Type = SpriteElement
			id = sl_highlight
			parent = sl_fixed
			texture = white
			just = [left top]
			Pos = (326.0, 428.0)
			dims = <hilite_dims>
			z_priority = ($setlist_text_z - 0.1)
			rgba = [200 185 95 110]
		}
	else
		CreateScreenElement {
			Type = SpriteElement
			id = sl_highlight
			parent = sl_fixed
			texture = white
			just = [left top]
			Pos = (326.0, 428.0)
			dims = <hilite_dims>
			z_priority = ($setlist_text_z - 0.1)
			rgba = [255 250 250 200]
		}
	endif
	<bg_helper_pos> = (140.0, 585.0)
	<helper_rgba> = [105 65 7 160]
	Change \{user_control_pill_gap = 100}
	if ($current_tab = tab_setlist)
		setlist_show_helperbar Pos = (<bg_helper_pos> + (64.0, 4.0))
	elseif ($current_tab = tab_bonus)
		setlist_show_helperbar {
			Pos = (<bg_helper_pos> + (64.0, 4.0))
			text_option1 = 'SETLIST'
			button_option1 = '\\b6'
		}
	endif
endscript

script setlist_menu_focus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			SetScreenElementProps id = <id> rgba = (($g_menu_colors).dk_violet_grey)
		endif
	else
		GetTags

		SetScreenElementProps id = <id> rgba = (($g_menu_colors).dk_violet_grey)
	endif
endscript

script get_quickplay_song_score 
	if ($game_mode = p2_quickplay)
		get_difficulty_text_nl difficulty = ($current_difficulty_coop)
	else
		get_difficulty_text_nl difficulty = ($current_difficulty)
	endif
	get_formatted_songname song_prefix = <song> difficulty_text_nl = <difficulty_text_nl>
	GetGlobalTags <songname>
	return score = <bestscore>
endscript

script get_quickplay_song_stars 
	if ($game_mode = p2_quickplay)
		get_difficulty_text_nl difficulty = ($current_difficulty_coop)
	else
		get_difficulty_text_nl difficulty = ($current_difficulty)
	endif
	get_formatted_songname song_prefix = <song> difficulty_text_nl = <difficulty_text_nl>
	GetGlobalTags <songname>
	return stars = <beststars>
endscript

script setlist_show_helperbar \{text_option1 = 'THE VAULT'
		button_option1 = '\\b7'
		spacing = 16}
	clean_up_user_control_helpers
	text_options = [
		'UP/DOWN'
		'SELECT'
		'BACK'
	]
	button_options = [
		'\\bb'
		'\\m0'
		'\\m1'
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
		case '\\bb'
		<button> = strumbar
		case '\\m0'
		<button> = green
		case '\\m1'
		<button> = red
		case '\\b6'
		<button> = yellow
		case '\\b7'
		<button> = blue
	endswitch
	if ($is_network_game = 1)
		if IsHost
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
			endif
		endif
	else
		add_user_control_helper text = <text2> button = <button> z = 100
	endif
	<i> = (<i> + 1)
	repeat 4
	tabs_text = ['setlist' 'the Vault']
	setlist_text_positions = [(300.0, 70.0) (624.0, 102.0)]
	buttons_text = ['\\b7' '\\b6' '\\b8']
	setlist_button_positions = [(580.0, 90.0) (260.0, 65.0)]
	i = 0
	begin
	button_text_pos = (<setlist_button_positions> [<i>])
	CreateScreenElement {
		Type = TextElement
		parent = setlist_menu
		Scale = 1
		text = (<buttons_text> [<i>])
		rgba = [128 128 128 255]
		Pos = <button_text_pos>
		z_priority = 50
		font = buttonsxenon
		just = [left top]
	}
	tab_text_pos = (<setlist_text_positions> [<i>])
	GetUpperCaseString (<tabs_text> [<i>])
	CreateScreenElement {
		Type = TextElement
		parent = setlist_menu
		font = text_a5
		Scale = 1
		text = (<UppercaseString>)
		rgba = [0 0 0 255]
		Pos = <tab_text_pos>
		z_priority = 50
		just = [left top]
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> dims = ((185.0, 0.0) + (<height> * (0.0, 1.0))) start_x_scale = 1 start_y_scale = 1 only_if_larger_x = 1
	<i> = (<i> + 1)
	repeat 2
endscript
