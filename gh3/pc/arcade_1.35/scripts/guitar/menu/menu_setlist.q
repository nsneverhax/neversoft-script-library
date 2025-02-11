setlist_random_images_scroll_num = 0
setlist_random_images_highest_num = 0
setlist_random_bg_images = [
	{
		texture = Setlist_Shoeprint
		flippable
		shoeprint
	}
	{
		texture = setlist_coin
		flippable
		dims = (96.0, 96.0)
		loffset = (70.0, 0.0)
		roffset = (115.0, 0.0)
	}
	{
		texture = setlist_ernieBall
		dims = (384.0, 384.0)
		only_right
		roffset = (100.0, 0.0)
	}
	{
		texture = setlist_line6
		dims = (256.0, 256.0)
		loffset = (-50.0, 0.0)
		roffset = (50.0, 0.0)
		only_left
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
setlist_max_enabled_song = 0
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
current_setlist_songpreview = None
target_setlist_songpreview = None
setlist_songpreview_changing = 0
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
		pad_choose
		setlist_choose_song
		params = {
			song_count = $setlist_selection_song
			Tier = $setlist_selection_tier
		}
	}
]

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
		text = "AS MADE"
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
		text = "FAMOUS BY"
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

script create_as_made_famous_by 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = setlist_original_artist
		rot_angle = -7
		alpha = 0}
	displaySprite \{parent = setlist_original_artist
		id = sl_oa_back
		tex = white
		dims = (130.0, 50.0)
		just = [
			center
			top
		]
		Pos = (50.0, -25.0)
		rgba = [
			0
			0
			0
			255
		]
		z = 500}
	displaySprite \{parent = setlist_original_artist
		id = sl_oa_fore
		tex = white
		just = [
			center
			top
		]
		dims = (130.0, 25.0)
		Pos = (50.0, 0.0)
		rgba = [
			223
			223
			223
			255
		]
		z = 501}
	displayText \{parent = setlist_original_artist
		id = sl_oa_asmade
		text = "AS MADE"
		font = text_a3
		just = [
			center
			top
		]
		Pos = (50.0, -25.0)
		z = 502
		Scale = (0.8, 0.5)
		rgba = [
			223
			223
			223
			255
		]
		noshadow}
	fit_text_in_rectangle id = <id> dims = (75.0, 15.0)
	displayText \{parent = setlist_original_artist
		id = sl_oa_famousby
		text = "FAMOUS BY"
		just = [
			center
			top
		]
		font = text_a3
		Pos = (50.0, 0.0)
		z = 502
		Scale = (0.72499996, 0.5)
		rgba = [
			0
			0
			0
			255
		]
		noshadow}
	fit_text_in_rectangle id = <id> dims = (90.0, 15.0)
endscript

script animate_as_made_famous_by \{Pos = (0.0, 0.0)
		time = 0.25}
	if ScreenElementExists \{id = setlist_original_artist}
		setlist_original_artist :SetProps Pos = <Pos>
		DoScreenElementMorph id = setlist_original_artist alpha = 1 time = <time>
	endif
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
	song_icon = setlist_icon_generic
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
	if ScreenElementExists \{id = setlist_original_artist}
		setlist_original_artist :SetProps \{alpha = 0}
	endif
	if NOT (<song> = None)
		get_song_original_artist song = <song>
		if ($we_have_songs = true && <original_artist> = 0)
			if ScreenElementExists \{id = sl_clipart}
				GetScreenElementProps \{id = sl_clipart}
				animate_as_made_famous_by Pos = (<Pos> + (110.0, 120.0)) time = 0.25
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
	printf \{"Did not find tier!"}
	return \{tier_number = 1}
endscript

script clear_setlist_clip_and_art 
	if ScreenElementExists \{id = setlist_original_artist}
		SetScreenElementProps \{id = setlist_original_artist
			alpha = 0}
	endif
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
		<id> :SetProps Shadow shadow_offs = (3.0, 3.0) shadow_rgba = [0 0 0 255]
	endif
	return id = <id>
endscript

script create_setlist_menu 
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		printf \{"create_setlist_menu: is_network_game = %d, net_can_send_approval = %e"
			d = $is_network_game
			e = $net_can_send_approval}
		net_lobby_state_message {
			current_state = ($net_current_flow_state)
			action = request
			request_state = song
		}
	endif
	if ($is_network_game = 1)
		printf \{"create_setlist_menu: is_network_game = %d"
			d = $is_network_game}
		Change \{current_tab = tab_setlist}
		Change \{setlist_previous_tier = 1}
		Change \{setlist_previous_song = 0}
		Change \{setlist_previous_tab = tab_setlist}
	endif
	if ($end_credits = 1 && $current_song = bossdevil)
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
	endif
	if ($left_player_continue = 0 && $right_player_continue = 0)
		Change \{setlist_previous_tier = 1}
		Change \{setlist_previous_song = 0}
		Change \{setlist_previous_tab = tab_setlist}
		Change \{setlist_selection_tier = 1}
		Change \{setlist_selection_song = 0}
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
	if ScreenElementExists \{id = vmenu_setlist}
		LaunchEvent \{Type = pad_down
			target = vmenu_setlist}
	endif
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
	SpawnScriptLater \{setlist_songpreview_monitor}
	if (($is_network_game = 1) && ($net_can_send_approval = 1))
		net_lobby_state_message \{current_state = song
			action = approval}
		Change \{net_can_send_approval = 0}
	endif
	spawnscript \{setlist_watch_timer}
	GetGlobalTags \{arcade_audits}
	GetGlobalTags \{arcade_adjustments}
	if ($game_mode = p2_career || $game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
		Max = (2 * <arcade_credits_for_premium>)
	else
		Max = <arcade_credits_for_premium>
	endif
	MathMax a = 0 b = <Max>
	CastToInteger \{Max}
	if (<Max> > 0)
		spawnscript \{setlist_watch_premium}
	endif
endscript

script setlist_random_walk 
	random_walk_ticks = 0
	next_random_walk = 0
	begin
	if (<random_walk_ticks> > <next_random_walk>)
		GetRandomValue \{Name = random_direction
			integer
			a = 0
			b = 1}
		if (<random_direction> = 0)
			LaunchEvent \{Type = pad_up
				target = vmenu_setlist}
		else
			LaunchEvent \{Type = pad_down
				target = vmenu_setlist}
		endif
		GetRandomValue \{Name = next_random_walk
			integer
			a = 15
			b = 90}
		<random_walk_ticks> = 0
	endif
	<random_walk_ticks> = (<random_walk_ticks> + 1)
	Wait \{1
		gameframe}
	repeat
endscript

script create_setlist_scrolling_menu 
	kill_start_key_binding
	UnPauseGame
	if ($player1_status.bot_play = 1)
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_career ||
				$game_mode = p2_faceoff ||
				$game_mode = p2_pro_faceoff ||
				$game_mode = p2_battle)
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
		scrollid = scrolling_setlist
		vmenuid = vmenu_setlist
		tierlist = $g_gh3_setlist
		use_backdrop = 0
		no_wrap
		z = -1
		event_handlers = $setlist_event_handlers
		exclusive_device = <exclusive_device>
		no_focus = <no_focus_value>
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

script destroy_setlist_songpreview_monitor 
	unpausespawnedscript \{setlist_songpreview_monitor}
	begin
	if ($setlist_songpreview_changing = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	KillSpawnedScript \{Name = setlist_songpreview_monitor}
	if NOT ($current_setlist_songpreview = None)
		get_song_prefix song = ($current_setlist_songpreview)
		formatText checksumName = song_preview '%s_preview' s = <song_prefix>
		stopsound <song_preview>
		SongUnLoadFSBIfDownloaded
	endif
endscript

script destroy_setlist_menu 
	Change \{bonus_credit_counter = 0}
	KillSpawnedScript \{Name = setlist_random_walk}
	KillSpawnedScript \{Name = net_match_download_songs}
	hide_countdown_timer
	destroy_setlist_songpreview_monitor
	Change setlist_previous_tier = ($setlist_selection_tier)
	Change setlist_previous_song = ($setlist_selection_song)
	Change setlist_previous_tab = ($current_tab)
	Change \{target_setlist_songpreview = None}
	memcard_sequence_begin_autosave
	memcard_sequence_cleanup_generic \{display_anything = 0}
	destroy_menu \{menu_id = setlist_original_artist}
	destroy_menu \{menu_id = scrolling_setlist}
	destroy_menu \{menu_id = setlist_menu}
	destroy_menu \{menu_id = setlist_loops_menu}
	destroy_menu \{menu_id = setlist_bg_container}
	reset_vars \{del}
	clean_up_user_control_helpers
endscript

script setlist_watch_timer \{Timer = 45
		warning = 10}
	SpawnScriptNow set_countdown_timer params = {timer_value = <Timer> warning_val = <warning>}
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		printf \{"setlist_watch_timer: expired"}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	printf \{"setlist_watch_timer: exiting"}
	SpawnScriptNow \{setlist_choose_song
		params = {
			song_count = $setlist_selection_song
			Tier = $setlist_selection_tier
			timeout = 1
		}}
endscript

script setlist_watch_premium 
	begin
	GetGlobalTags \{arcade_audits}
	GetGlobalTags \{arcade_adjustments}
	if ($game_mode = p2_career || $game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
		Max = (2 * <arcade_credits_for_premium>)
	else
		Max = <arcade_credits_for_premium>
	endif
	MathMax a = 0 b = <Max>
	CastToInteger \{Max}
	if (1)
		total_num_songs = 0
		Tier = 0
		num_tiers = ($g_gh3_setlist.num_tiers)
		begin
		<Tier> = (<Tier> + 1)
		setlist_prefix = ($g_gh3_setlist.prefix)
		formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
		formatText checksumName = tier_checksum 'tier%s' s = <Tier>
		GetGlobalTags <tiername> param = unlocked
		if (<unlocked> = 1 || $is_network_game = 1)
			GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
			num_songs = <array_Size>
			song_count = 0
			if (<array_Size> > 0)
				begin
				setlist_prefix = ($g_gh3_setlist.prefix)
				formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <Tier> AddToStringLookup = true
				if IsSongAvailable song_checksum = <song_checksum> song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					formatText checksumName = textid 'id_song%i' i = <total_num_songs>
					formatText checksumName = groupID 'artist_id%i' i = <total_num_songs>
					get_song_struct song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					if StructureContains structure = <song_struct> Name = premium
						if ((<Max> - <arcade_num_credits_in>) > 1)
							formatText TextName = premiumtext "Insert %a More Credits" a = (<Max> - <arcade_num_credits_in>)
						elseif ((<Max> - <arcade_num_credits_in>) = 1)
							formatText \{TextName = premiumtext
								"Insert 1 More Credit"}
						else
							formatText \{TextName = premiumtext
								"Ready to Rock!!!"}
						endif
						formatText checksumName = premiumprice 'premiumprice_song%i' i = <total_num_songs>
						<premiumprice> :SetProps text = <premiumtext>
					endif
					<total_num_songs> = (<total_num_songs> + 1)
				endif
				song_count = (<song_count> + 1)
				repeat <num_songs>
			endif
		endif
		repeat <num_tiers>
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script setlist_choose_song \{device_num = 0
		song_count = 0
		Tier = 0
		timeout = 0}
	printf "setlist_choose_song: entered with tier = %d" d = <Tier>
	printf "setlist_choose_song: entered with song_count = %e" e = <song_count>
	if GotParam \{song_count}
		formatText checksumName = tier_checksum 'tier%s' s = <Tier>
		get_song_struct song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
		if StructureContains structure = <song_struct> premium
			GetGlobalTags \{arcade_audits}
			GetGlobalTags \{arcade_adjustments}
			if ($game_mode = p2_career || $game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
				Max = (2 * <arcade_credits_for_premium>)
			else
				Max = <arcade_credits_for_premium>
			endif
			MathMax a = 0 b = <Max>
			CastToInteger \{Max}
			printf "setlist_choose_song: premium song chosen: %a of %b coins" a = <arcade_num_credits_in> b = <Max>
			if (<arcade_num_credits_in> < <Max>)
				if (<timeout> = 1)
					printf \{"setlist_choose_song: timeout on premium with low funds, bumping timer"}
					SoundEvent \{event = Single_Player_Bad_Note_Guitar}
					KillSpawnedScript \{Name = premium_pop}
					SpawnScriptNow \{premium_pop}
					KillSpawnedScript \{Name = setlist_watch_timer}
					spawnscript \{setlist_watch_timer
						params = {
							Timer = 15
							warning = 5
						}}
					if ScreenElementExists \{id = vmenu_setlist}
						if ($setlist_selection_index = ($setlist_num_songs -1))
							LaunchEvent \{Type = pad_up
								target = vmenu_setlist}
						else
							LaunchEvent \{Type = pad_down
								target = vmenu_setlist}
						endif
					endif
					return
				else
					printf \{"setlist_choose_song: premium selected with low funds, ignoring"}
					SoundEvent \{event = Single_Player_Bad_Note_Guitar}
					KillSpawnedScript \{Name = premium_pop}
					SpawnScriptNow \{premium_pop}
					return
				endif
			endif
		endif
		if ($is_network_game = 1)
			net_request_song Tier = <Tier> song_count = <song_count>
		else
			if StructureContains structure = <song_struct> premium
				GetGlobalTags \{arcade_audits}
				GetGlobalTags \{arcade_adjustments}
				if ($game_mode = p2_career || $game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
					Max = (2 * <arcade_credits_for_premium>)
				else
					Max = <arcade_credits_for_premium>
				endif
				MathMax a = 0 b = <Max>
				CastToInteger \{Max}
				if (<arcade_num_credits_in> >= <Max>)
					<arcade_num_credits_in> = (<arcade_num_credits_in> - <Max>)
					if ($game_mode = p2_career || $game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
						<arcade_total_premium> = (<arcade_total_premium> + 2)
					else
						<arcade_total_premium> = (<arcade_total_premium> + 1)
					endif
					SetGlobalTags arcade_audits params = {arcade_num_credits_in = <arcade_num_credits_in> , arcade_total_premium = <arcade_total_premium>}
					printf "setlist_choose_song: premium selection arcade_num_credits_in=%d" d = <arcade_num_credits_in>
					change_coin_message
				else
					printf \{"setlist_choose_song: premium selection with insufficient coins"}
				endif
			endif
			if ($transitions_locked = 0)
				if ScreenElementExists \{id = vmenu_setlist}
					LaunchEvent \{Type = unfocus
						target = vmenu_setlist}
				endif
			endif
			Change current_song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
			formatText checksumName = song_stats 'arcade_song_stats_%s' s = ($permanent_songlist_props.$current_song.Name)
			formatText TextName = temp_song_stats 'arcade_song_stats_%s' s = ($permanent_songlist_props.$current_song.Name)
			GetGlobalTags <song_stats>
			Increment \{played}
			if ($game_mode = p2_coop || $game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
				Increment \{played}
				<multiplayer_played> = (<multiplayer_played> + 2)
			endif
			SetGlobalTags <song_stats> params = {played = <played> multiplayer_played = <multiplayer_played>}
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
			KillSpawnedScript \{Name = setlist_watch_timer}
			KillSpawnedScript \{Name = setlist_watch_premium}
			ui_flow_manager_respond_to_action action = continue device_num = (<device_num>)
		endif
	else
		printf \{"setlist_choose_song: we didn't get a song_count, nothing to do"}
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
		printstruct <...>
		load_songqpak song_name = ($current_song) async = 0
		setup_gemarrays song_name = ($current_song) difficulty = ($current_difficulty) player_status = player1_status
		calc_songscoreinfo
		Change structurename = player1_status score = ($player1_status.base_score * 2.8 + 1)
		Progression_SongWon
		if ($game_mode = p1_quickplay)
			menu_top_rockers_check_for_new_top_score
		endif
		songpreview = ($current_setlist_songpreview)
		change_tab tab = ($current_tab)
		Change current_setlist_songpreview = <songpreview>
		if ($current_song = bossslash || $current_song = bosstom || $current_song = bossdevil)
			boss_character = -1
			if ($current_song = bossslash)
				<boss_character> = 0
			elseif ($current_song = bosstom)
				<boss_character> = 1
			elseif ($current_song = bossdevil)
				<boss_character> = 2
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
		if ScreenElementExists \{id = vmenu_setlist}
			LaunchEvent \{Type = pad_down
				target = vmenu_setlist}
		endif
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
		if ($game_mode = p1_career || $game_mode = p2_career)
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
		if ScreenElementExists \{id = vmenu_setlist}
			LaunchEvent \{Type = pad_down
				target = vmenu_setlist}
		endif
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
	printf "setlist_scroll: dir = %s, setlist_selection_index = %d setlist_selection_tier = %e" s = <Dir> d = $setlist_selection_index e = $setlist_selection_tier
	if ($setlist_num_songs = 0)
		return
	endif
	if (<Dir> = down)
		if ($setlist_selection_index + 1 > $setlist_max_enabled_song)
			printf \{"setlist_scroll: can't scroll down further, bailing"}
			return
			printf \{"setlist_scroll: bailing didn't work"}
		endif
	else
		if ($setlist_selection_index - 1 < 0)
			printf \{"setlist_scroll: can't scroll up further, bailing"}
			return
			printf \{"setlist_scroll: bailing didn't work"}
		endif
	endif
	generic_menu_up_or_down_sound <Dir>
	formatText \{checksumName = textid
		'id_song%i'
		i = $setlist_selection_index
		AddToStringLookup = true}
	formatText \{checksumName = groupID
		'artist_id%i'
		i = $setlist_selection_index
		AddToStringLookup = true}
	if ScreenElementExists id = <textid>
		retail_menu_unfocus id = <textid>
		SetScreenElementProps id = <textid> no_shadow
	endif
	formatText \{checksumName = tier_checksum
		'tier%s'
		s = $setlist_selection_tier}
	get_song_struct song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
	if (<Dir> = down)
		jump_tier = 0
		Change setlist_selection_index = ($setlist_selection_index + 1)
		printf \{"setlist_scroll: setlist_selection_index now %d"
			d = $setlist_selection_index}
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
			printf \{"setlist_scroll: we are at the end of the tier, move down 1 tier = %d"
				d = $setlist_selection_tier}
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
		if ($setlist_selection_index = 1 && <jump_tier> = 0)
			printf \{"setlist_scroll: setlist_selection_index = 1 jump down twice"}
			song_jump_amt = (0.0, -160.0)
			if ScreenElementExists \{id = sl_clipart}
				GetScreenElementProps \{id = sl_clipart}
				SetScreenElementProps id = sl_clipart Pos = (<Pos> - (0.0, 80.0))
			endif
			if ScreenElementExists \{id = sl_clipart_shadow}
				GetScreenElementProps \{id = sl_clipart_shadow}
				SetScreenElementProps id = sl_clipart_shadow Pos = (<Pos> - (0.0, 80.0))
			endif
			if ScreenElementExists \{id = sl_clip}
				GetScreenElementProps \{id = sl_clip}
				SetScreenElementProps id = sl_clip Pos = (<Pos> - (0.0, 80.0))
			endif
			if ScreenElementExists \{id = sl_highlight}
				GetScreenElementProps \{id = sl_highlight}
				SetScreenElementProps id = sl_highlight Pos = (<Pos> - (0.0, 80.0))
			endif
		else
			song_jump_amt = (0.0, -80.0)
		endif
	else
		jump_tier = 0
		Change setlist_selection_index = ($setlist_selection_index - 1)
		printf \{"setlist_scroll: dir = up, setlist_selection_index = %d"
			d = $setlist_selection_index}
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
			printf \{"setlist_scroll: we are at the end of the tier, move up 1 tier = %d"
				d = $setlist_selection_tier}
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
		if ($setlist_selection_index = 0 && <jump_tier> = 0)
			song_jump_amt = (0.0, 160.0)
			if ScreenElementExists \{id = sl_clipart}
				GetScreenElementProps \{id = sl_clipart}
				SetScreenElementProps id = sl_clipart Pos = (<Pos> + (0.0, 80.0))
			endif
			if ScreenElementExists \{id = sl_clipart_shadow}
				GetScreenElementProps \{id = sl_clipart_shadow}
				SetScreenElementProps id = sl_clipart_shadow Pos = (<Pos> + (0.0, 80.0))
			endif
			if ScreenElementExists \{id = sl_clip}
				GetScreenElementProps \{id = sl_clip}
				SetScreenElementProps id = sl_clip Pos = (<Pos> + (0.0, 80.0))
			endif
			if ScreenElementExists \{id = sl_highlight}
				GetScreenElementProps \{id = sl_highlight}
				SetScreenElementProps id = sl_highlight Pos = (<Pos> + (0.0, 80.0))
			endif
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
	formatText \{checksumName = groupID
		'artist_id%i'
		i = $setlist_selection_index
		AddToStringLookup = true}
	if ScreenElementExists id = <textid>
		retail_menu_focus id = <textid>
		SetScreenElementProps id = <textid> Shadow
	endif
	printf "create setlist: jump_tier = %a jump_tier_amt = %b" a = <jump_tier> b = <jump_tier_amt>
	<not_header> = 1
	if ($current_tab = tab_setlist)
		if (<jump_tier> = 1)
			Change setlist_begin_text = ($setlist_begin_text + <jump_tier_amt>)
			if ScreenElementExists \{id = scrolling_setlist}
				SetScreenElementProps \{id = scrolling_setlist
					Pos = $setlist_begin_text}
			endif
			Change setlist_background_pos = ($setlist_background_pos + <jump_tier_amt>)
			<not_header> = 0
		endif
	endif
	printf \{"setlist_scroll: song title"}
	if (<not_header>)
		Change setlist_begin_text = ($setlist_begin_text + <song_jump_amt>)
		if ScreenElementExists \{id = scrolling_setlist}
			SetScreenElementProps \{id = scrolling_setlist
				Pos = $setlist_begin_text}
		endif
		Change setlist_background_pos = ($setlist_background_pos + <song_jump_amt>)
	endif
	printf \{"setlist_scroll: bg stuff"}
	if ScreenElementExists \{id = setlist_menu}
		SetScreenElementProps \{id = setlist_menu
			Pos = $setlist_background_pos}
	endif
	if ScreenElementExists \{id = setlist_bg_container}
		SetScreenElementProps \{id = setlist_bg_container
			Pos = $setlist_background_pos}
	endif
	if ScreenElementExists \{id = setlist_loops_menu}
		SetScreenElementProps \{id = setlist_loops_menu
			Pos = $setlist_background_pos}
	endif
	printf \{"setlist_scroll: rotate clip"}
	if ($setlist_clip_rot_neg)
		if ScreenElementExists \{id = sl_clip}
			SetScreenElementProps id = sl_clip rot_angle = (0 - $setlist_clip_last_rot)
		endif
		Change \{setlist_clip_rot_neg = 0}
	else
		GetRandomValue \{Name = rot
			a = 10.0
			b = -30.0}
		if ScreenElementExists \{id = sl_clip}
			SetScreenElementProps id = sl_clip rot_angle = <rot>
		endif
		Change setlist_clip_last_rot = <rot>
		Change \{setlist_clip_rot_neg = 1}
	endif
	printf \{"setlist_scroll: random images"}
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
		printf \{"setlist_background_loop_num = %a"
			a = $setlist_background_loop_num}
		if ($setlist_background_loop_num = 6)
			printf \{"LOOPING BACKGROUND"}
			Change \{setlist_background_loop_num = 0}
			Change setlist_background_loop_pos = ($setlist_background_loop_pos + (0.0, 1308.0))
			displaySprite \{parent = setlist_menu
				tex = Setlist_BG_Loop
				Pos = $setlist_background_loop_pos
				dims = (1280.0, 1308.0)
				z = 3.1}
		endif
		Change setlist_page1_num = ($setlist_page1_num + 1)
		printf \{"setlist_page1_num = %a"
			a = $setlist_page1_num}
		if ($setlist_page1_num = 2)
			printf \{"LOOPING PAGE"}
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
			if ($setlist_page2_num = 2)
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
		Change setlist_page3_num = ($setlist_page3_num + 1)
		if ($setlist_page3_num = 2)
			Change \{setlist_page3_num = 0}
			Change setlist_page3_pos = ($setlist_page3_pos + (0.0, 532.0))
			displaySprite \{parent = setlist_loops_menu
				tex = Setlist_Page3_Loop
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
	get_song_struct song = ($g_gh3_setlist.<tier_checksum>.songs [$setlist_selection_song])
	printf \{"setlist_scroll: playing sounds"}
	if GotParam \{up}
		generic_menu_up_or_down_sound \{up}
	endif
	if GotParam \{down}
		generic_menu_up_or_down_sound \{down}
	endif
	printf "setlist_scroll: end routine - dir = %s, setlist_selection_index = %d setlist_selection_tier = %e" s = <Dir> d = $setlist_selection_index e = $setlist_selection_tier
endscript

script setlist_display_random_bg_image 
	side = 0
	old_image = 0
	begin
	can_left = 1
	can_right = 1
	flippable = 0
	mydims = (128.0, 128.0)
	minrot = -10
	maxrot = 10
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

script setlist_songpreview_monitor 
	begin
	if NOT ($current_setlist_songpreview = $target_setlist_songpreview)
		Change \{setlist_songpreview_changing = 1}
		song = ($target_setlist_songpreview)
		printf \{"setlist_songpreview_monitor: pre songunloadfsb"}
		SongUnloadFSB
		printf \{"setlist_songpreview_monitor: post songunloadfsb"}
		Wait \{0.5
			Second}
		if ($target_setlist_songpreview != <song> || $target_setlist_songpreview = None)
			Change \{current_setlist_songpreview = None}
			Change \{setlist_songpreview_changing = 0}
		else
			get_song_prefix song = <song>
			get_song_struct song = <song>
			if StructureContains structure = <song_struct> streamname
				song_prefix = (<song_struct>.streamname)
			endif
			if NOT SongLoadFSB song_prefix = <song_prefix>
				Change \{setlist_songpreview_changing = 0}
				DownloadContentLost
				return
			endif
			formatText checksumName = song_preview '%s_preview' s = <song_prefix>
			SoundBussUnlock \{Music_Setlist}
			if StructureContains structure = <song_struct> Name = band_playback_volume
				setlistvol = ((<song_struct>.band_playback_volume))
				setsoundbussparams {Music_Setlist = {vol = <setlistvol>}}
			else
				setsoundbussparams \{Music_Setlist = {
						vol = 0.0
					}}
			endif
			SoundBussLock \{Music_Setlist}
			PlaySound <song_preview> buss = Music_Setlist
			Change current_setlist_songpreview = <song>
			Change \{setlist_songpreview_changing = 0}
		endif
	elseif NOT ($current_setlist_songpreview = None)
		song = ($current_setlist_songpreview)
		get_song_prefix song = <song>
		formatText checksumName = song_preview '%s_preview' s = <song_prefix>
		if NOT issoundplaying <song_preview>
			Change \{setlist_songpreview_changing = 1}
			if NOT SongLoadFSB song_prefix = <song_prefix>
				Change \{setlist_songpreview_changing = 0}
				DownloadContentLost
				return
			endif
			PlaySound <song_preview> buss = Music_Setlist
			Change \{setlist_songpreview_changing = 0}
		endif
	endif
	Wait \{1
		gameframe}
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
	elseif (<tab> = tab_downloads)
		if NOT ($current_tab = <tab>)
			menu_setlist_downloads_tab_sound
		endif
		get_progression_globals game_mode = ($game_mode) download
	endif
	Change g_gh3_setlist = <tier_global>
	Change current_tab = <tab>
	destroy_setlist_scrolling_menu
	create_setlist_scrolling_menu
	reset_vars \{del}
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
			tex = Setlist_Page1_Loop
			Pos = $setlist_page1_loop_pos
			dims = $setlist_page1_dims
			z = $setlist_page1_z}
		displaySprite parent = setlist_loops_menu tex = Setlist_Page3_Loop Pos = ($setlist_page3_pos + (-180.0, 614.0)) dims = $setlist_page3_dims z = $setlist_page3_z
		case tab_downloads
		Change \{setlist_page3_z = 3.5}
		Change \{setlist_page2_z = 3.4}
		Change \{setlist_page1_z = 3.3}
		displaySprite \{parent = setlist_loops_menu
			tex = Setlist_Page1_Loop
			Pos = $setlist_page1_loop_pos
			dims = $setlist_page1_dims
			z = $setlist_page1_z}
		Change setlist_page3_pos = ($setlist_page3_pos + (0.0, 40.0))
		displaySprite parent = setlist_loops_menu tex = Setlist_Page3_Loop Pos = ($setlist_page3_pos + (-180.0, 614.0)) dims = $setlist_page3_dims z = $setlist_page3_z
		case tab_bonus
		Change \{setlist_page3_z = 3.3}
		Change \{setlist_page2_z = 3.8}
		Change \{setlist_page1_z = 3.4}
		displaySprite \{parent = setlist_loops_menu
			tex = Setlist_Page1_Loop
			Pos = $setlist_page1_loop_pos
			dims = $setlist_page1_dims
			z = $setlist_page1_z}
		displaySprite parent = setlist_loops_menu tex = Setlist_Page3_Loop Pos = ($setlist_page3_pos + (-180.0, 614.0)) dims = $setlist_page3_dims z = $setlist_page3_z
		displaySprite parent = setlist_loops_menu tex = Setlist_Page2_Loop Pos = ($setlist_page2_pos + (0.0, 553.0)) dims = $setlist_page2_dims z = $setlist_page2_z
	endswitch
	create_sl_assets <tab>
	SetScreenElementProps \{id = setlist_bg_container
		Pos = (0.0, 0.0)}
	Change \{setlist_random_images_scroll_num = 0}
	Change setlist_page2_pos = ($setlist_page2_pos + (0.0, 553.0))
	Change setlist_page3_pos = ($setlist_page3_pos + (-180.0, 614.0))
	SetScreenElementProps \{id = sl_page3_head
		z_priority = $setlist_page3_z}
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
		destroy_menu \{menu_id = setlist_original_artist}
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

script IsSongAvailable \{for_bonus = 0}
	if ($is_network_game = 1)
		if is_song_downloaded song_checksum = <song>
			GetGlobalTags <song>
			if (<available_on_other_client> = 1)
				return \{true}
			endif
		endif
	else
		if NOT is_song_downloaded song_checksum = <song>
			return \{FALSE}
		endif
		if (<download> = 1)
			return \{true}
		elseif (<for_bonus> = 1)
			GetGlobalTags <song> param = unlocked
			if (<unlocked> = 1)
				return \{true}
			endif
		else
			GetGlobalTags <song_checksum> param = unlocked
			GetGlobalTags <song_checksum> param = restricted
			if (<unlocked> = 1 && <restricted> = 0)
				return \{true}
			endif
		endif
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
		BlendMode = subtract}
	repeat 3
	displaySprite \{id = sl_page3_head
		parent = setlist_menu
		tex = Setlist_Page3_Head
		Pos = $setlist_page3_pos
		dims = (922.0, 614.0)
		z = $setlist_page3_z}
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
	displaySprite parent = setlist_menu tex = Setlist_Page1_Line_Red Pos = (320.0, 12.0) dims = (8.0, 6400.0) z = ($setlist_page1_z + 0.1)
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
	Change \{setlist_max_enabled_song = 0}
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
	elseif korean
		setlist_header_tex = Setlist_Page1_Title
	endif
	if GotParam \{tab_setlist}
		displaySprite id = sl_page1_title parent = setlist_menu tex = <setlist_header_tex> Pos = (330.0, 220.0) dims = (512.0, 128.0) alpha = 0.7 z = ($setlist_page1_z + 0.2) rot_angle = 0
		displaySprite parent = sl_page1_title tex = <setlist_header_tex> Pos = (-5.0, 10.0) dims = (512.0, 128.0) alpha = 0.2 z = ($setlist_page1_z + 0.2) rot_angle = -2
		GetUpperCaseString ($g_gh3_setlist.tier1.title)
		displayText id = sl_text_1 parent = setlist_menu Scale = (1.0, 1.0) text = <UppercaseString> rgba = [195 80 45 255] Pos = <title_pos> z = $setlist_text_z noshadow
	endif
	if GotParam \{tab_downloads}
		displayText \{parent = setlist_menu
			id = sl_text_1
			text = "DOWNLOADED SONGS"
			font = text_a10
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
		displaySprite parent = setlist_menu tex = Setlist_Page1_Line_Red Pos = (320.0, 216.0) dims = (8.0, 6400.0) z = ($setlist_page1_z - 0.2)
	endif
	if GotParam \{tab_bonus}
		displayText \{parent = setlist_menu
			id = sl_text_1
			text = "BONUS SONGS"
			font = text_a10
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
		displaySprite parent = setlist_menu tex = Setlist_Page1_Line_Red Pos = (320.0, 216.0) dims = (8.0, 6400.0) z = ($setlist_page1_z - 0.2)
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
		GetGlobalTags <tiername> param = unlocked
		Max = ($difficulty_list_props.($current_difficulty).index)
		MathMax a = ($difficulty_list_props.($current_difficulty2).index) b = <Max>
		CastToInteger \{Max}
		difficulty_index = <Max>
		printf "tier %a diff_idx %b" a = <Tier> b = <difficulty_index>
		if (<unlocked> = 1 || $is_network_game = 1)
			Change \{we_have_songs = FALSE}
			GetArraySize ($g_gh3_setlist.<tier_checksum>.songs)
			num_songs = <array_Size>
			num_songs_unlocked = 0
			song_count = 0
			if (<array_Size> > 0)
				begin
				setlist_prefix = ($g_gh3_setlist.prefix)
				formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <Tier> AddToStringLookup = true
				if IsSongAvailable song_checksum = <song_checksum> song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					Change \{we_have_songs = true}
					printf "create setlist: tier %a has songs!" a = <Tier>
					break
				endif
				song_count = (<song_count> + 1)
				repeat <num_songs>
				if (<song_count> = <num_songs>)
					printf "create setlist: tier %a has NO songs!" a = <Tier>
				endif
			endif
			if (<Tier> != 1 && $we_have_songs = true)
				<text_pos> = (<text_pos> + (-40.0, 110.0))
				GetUpperCaseString ($g_gh3_setlist.<tier_checksum>.title)
				displayText parent = setlist_menu Scale = (1.0, 1.0) text = <UppercaseString> rgba = [190 75 40 255] Pos = <text_pos> z = $setlist_text_z noshadow
				<text_pos> = (<text_pos> + (40.0, 50.0))
				printf \{"create setlist: bumping text for tier"}
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
						printf \{"setlist_select: song not found, resetting selection to end\\n"}
						Change setlist_selection_tier = <Tier>
						Change setlist_selection_song = <song_count>
						Change \{setlist_selection_found = 1}
					endif
					get_song_title song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					get_song_prefix song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					get_song_artist song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
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
						font = text_a5
						just = [left top]
						font_spacing = 0.5
						no_shadow
						shadow_offs = (1.0, 1.0)
						shadow_rgba = [0 0 0 255]
					}
					get_song_struct song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					if StructureContains structure = <song_struct> Name = premium
						GetGlobalTags \{arcade_audits}
						GetGlobalTags \{arcade_adjustments}
						if ($game_mode = p2_career || $game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
							Max = (2 * <arcade_credits_for_premium>)
						else
							Max = <arcade_credits_for_premium>
						endif
						MathMax a = 0 b = <Max>
						CastToInteger \{Max}
						premium_pos = (<text_pos> + (610.0, 20.0))
						formatText \{checksumName = premiumcontainerid
							'premiumcontainerid_song%i'
							i = $setlist_num_songs
							AddToStringLookup = true}
						CreateScreenElement {
							Type = ContainerElement
							id = <premiumcontainerid>
							parent = setlist_menu
							Pos = <premium_pos>
						}
						formatText \{checksumName = premiumid
							'premiumid_song%i'
							i = $setlist_num_songs
							AddToStringLookup = true}
						CreateScreenElement {
							Type = TextElement
							id = <premiumid>
							parent = <premiumcontainerid>
							Scale = (0.85, 0.85)
							text = "Premium Song"
							Pos = (0.0, 0.0)
							rgba = [150 30 10 255]
							z_priority = $setlist_text_z
							font = text_a5
							just = [center center]
							font_spacing = 0.5
							no_shadow
							shadow_offs = (1.0, 1.0)
							shadow_rgba = [0 0 0 255]
						}
						formatText \{checksumName = premiumprice
							'premiumprice_song%i'
							i = $setlist_num_songs
							AddToStringLookup = true}
						if ((<Max> - <arcade_num_credits_in>) > 1)
							formatText TextName = premiumtext "Insert %a More Credits" a = (<Max> - <arcade_num_credits_in>)
						elseif ((<Max> - <arcade_num_credits_in>) = 1)
							formatText \{TextName = premiumtext
								"Insert 1 More Credit"}
						else
							formatText \{TextName = premiumtext
								"Ready to Rock!!!"}
						endif
						CreateScreenElement {
							Type = TextElement
							id = <premiumprice>
							parent = <premiumcontainerid>
							Scale = (0.6, 0.6)
							text = <premiumtext>
							Pos = (0.0, 40.0)
							rgba = [150 30 10 255]
							z_priority = $setlist_text_z
							font = text_a5
							just = [center center]
							font_spacing = 1
							no_shadow
						}
					endif
					get_difficulty_text_nl difficulty = ($current_difficulty)
					get_song_prefix song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					formatText checksumName = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
					GetGlobalTags <song_checksum>
					GetGlobalTags <songname>
					if ($game_mode = p1_quickplay)
						get_quickplay_song_stars song = <song_prefix>
					endif
					get_song_struct song = ($g_gh3_setlist.<tier_checksum>.songs [<song_count>])
					Change \{setlist_max_enabled_song = $setlist_num_songs}
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
			if ((($game_mode = p1_career) || ($game_mode = p2_career)) && (GotParam tab_setlist) && $is_demo_mode = 0)
				GetGlobalTags <tiername> param = complete
				if (<complete> = 0)
					GetGlobalTags <tiername> param = boss_unlocked
					GetGlobalTags <tiername> param = encore_unlocked
					if (<encore_unlocked> = 1)
						formatText \{TextName = completeText
							"Beat encore song to continue"}
					elseif (<boss_unlocked> = 1)
						formatText \{TextName = completeText
							"Beat boss song to continue"}
					else
						GetGlobalTags <tiername> param = num_songs_to_progress
						formatText TextName = completeText "Beat %d of %p songs to continue" d = <num_songs_to_progress> p = <num_songs_unlocked>
					endif
					displayText parent = setlist_menu Scale = (0.6, 0.6) text = <completeText> Pos = (<text_pos> + (160.0, 0.0)) z = $setlist_text_z rgba = [30 30 30 255] noshadow
				endif
			endif
		endif
		repeat <num_tiers>
	endif
	if ((($game_mode = p1_career) || ($game_mode = p2_career)) && $is_demo_mode = 0)
		get_progression_globals game_mode = ($game_mode)
		summation_career_score tier_global = <tier_global>
		formatText TextName = total_score_text "Career Score: %d" d = <career_score> usecommas
		displayText {
			parent = setlist_menu
			Scale = 0.7
			text = <total_score_text>
			Pos = ((640.0, 120.0) + (<text_pos>.(0.0, 1.0) * (0.0, 1.0)))
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
	create_as_made_famous_by
	<clip_pos> = (<clip_pos> + (15.0, 50.0))
	displaySprite id = sl_clip parent = sl_fixed tex = Setlist_Clip just = [-0.5 -0.9] Pos = <clip_pos> dims = (141.0, 102.0) z = ($setlist_text_z + 0.2)
	if ($current_tab = tab_setlist)
		hilite_dims = (737.0, 80.0)
	elseif ($current_tab = tab_downloads)
		hilite_dims = (722.0, 80.0)
	elseif ($current_tab = tab_bonus)
		hilite_dims = (690.0, 80.0)
	endif
	displaySprite id = sl_highlight parent = sl_fixed tex = white Pos = (326.0, 428.0) dims = <hilite_dims> z = ($setlist_text_z - 0.1) rgba = [255 255 255 128]
	<bg_helper_pos> = (140.0, 585.0)
	<helper_rgba> = [105 65 7 160]
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
	displaySprite \{id = sl_overshadow
		rgba = [
			105
			65
			7
			160
		]
		parent = root_window
		tex = Setlist_Overshadow
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 5.0}
endscript

script get_quickplay_song_score 
	get_difficulty_text_nl difficulty = ($current_difficulty)
	formatText checksumName = songname '%s_%d' s = <song> d = <difficulty_text_nl>
	GetGlobalTags <songname>
	return score = <bestscore>
endscript

script get_quickplay_song_stars 
	get_difficulty_text_nl difficulty = ($current_difficulty)
	formatText checksumName = songname '%s_%d' s = <song> d = <difficulty_text_nl>
	GetGlobalTags <songname>
	return stars = <beststars>
endscript

script setlist_show_helperbar \{text_option1 = "BONUS"
		text_option2 = "DOWNLOADS"
		button_option1 = "\\b7"
		button_option2 = "\\b8"
		spacing = 16}
	if NOT English
		Change \{pill_helper_max_width = 65}
	endif
	text_options = [
		"UP/DOWN"
		"SELECT"
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
		case "\\b8"
		<button> = orange
	endswitch
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
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
	repeat 2
endscript

script premium_pop 
	formatText \{checksumName = premiumcontainerid
		'premiumcontainerid_song%i'
		i = $setlist_selection_index
		AddToStringLookup = true}
	DoScreenElementMorph id = <premiumcontainerid> Scale = 0.5 time = 0.1
	Wait \{0.1
		Seconds}
	DoScreenElementMorph id = <premiumcontainerid> Scale = 1 time = 0.1
	Wait \{0.1
		Seconds}
endscript
