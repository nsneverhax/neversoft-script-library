
script ui_create_setlist_lyrics 
	KillSpawnedScript \{Name = loading_screen_crowd_swell}
	KillSpawnedScript \{Name = crowd_loading_whistle}
	KillSpawnedScript \{Name = oneshotsbetweensongs}
	KillSpawnedScript \{Name = surgebetweensongs}
	SpawnScriptNow \{destroy_setlist_songpreview_monitor}
	if NOT ($game_mode = practice || $game_mode = training)
		SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
			params = {
				BG_SFX_Area = frontend_menu_music
			}}
	endif
	if ($is_network_game = 1)
		spawn_player_drop_listeners \{drop_player_script = setlist_drop_player
			end_game_script = setlist_end_game}
	endif
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_quickplay) || ($game_mode = p3_quickplay) || ($game_mode = p4_quickplay))
		if NOT GotParam \{from_leaderboard}
			SpawnScriptNow \{task_menu_default_anim_in
				params = {
					base_name = 'character_hub'
				}}
		endif
	endif
	SpawnScriptNow ui_create_setlist_lyrics_spawned params = <...>
endscript

script ui_create_setlist_lyrics_spawned 
	if NOT GotParam \{from_leaderboard}
		Change \{rich_presence_context = presence_gigboard_and_setlist}
	endif
	StopRendering
	<for_custom_setlist> = 0
	allow_jammode = 1
	wait_for_songpreview_monitor
	show_quit_warning = 1
	if (<for_custom_setlist> = 1)
		if ($sort_restore_selections = 0)
			reset_temp_quickplay_song_list
			reset_temp_jamsession_song_list
		endif
	else
		show_quit_warning = 0
	endif
	for_createagig = 0
	if GotParam \{createagig}
		<for_createagig> = 1
	endif
	if GotParam \{no_jamsession}
		allow_jammode = 0
	endif
	if GotParam \{from_top_rocker}
		<for_custom_setlist> = 0
		<allow_jammode> = 0
		for_createagig = 0
	endif
	if GotParam \{from_leaderboard}
		<for_custom_setlist> = 0
		<allow_jammode> = 0
		for_createagig = 0
	endif
	menu_music_off
	gig_posters_song_focus
	if GotParam \{use_all_controllers}
		get_all_exclusive_devices
	else
		<exclusive_device> = ($primary_controller)
		if ($is_network_game = 1)
			if local_player_is_choosing_song
				player_idx = 1
				gamemode_getnumplayers
				begin
				getplayerinfo <player_idx> is_local_client
				if (<is_local_client> = 1)
					getplayerinfo <player_idx> net_obj_id
					if ($online_song_choice_id = <net_obj_id>)
						getplayerinfo <player_idx> controller
						<exclusive_device> = <controller>
						break
					endif
				endif
				<player_idx> = (<player_idx> + 1)
				repeat <num_players>
			endif
		endif
	endif
	update_ingame_controllers controller = <exclusive_device>
	CreateScreenElement {
		parent = root_window
		id = setlistinterface
		Type = descinterface
		desc = 'setlist_b'
		exclusive_device = <exclusive_device>
	}
	if setlistinterface :desc_resolvealias \{Name = alias_setlist_menu}
		AssignAlias id = <resolved_id> alias = setlist_menu
		setlist_menu :se_setprops {
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
				{pad_back ui_setlist_back params = {show_quit_warning = <show_quit_warning>}}
				{pad_option2 setlist_switch_sort params = {for_custom_setlist = <for_custom_setlist>}}
			]
			tags = {
				from_top_rocker = <from_top_rocker>
				from_leaderboard = <from_leaderboard>
				for_custom_setlist = 0
				current_section = 1
				last_focused_song = None
				custom_setlist_num_id_1 = NULL
				custom_setlist_num_id_2 = NULL
				custom_setlist_num_id_3 = NULL
				custom_setlist_num_id_4 = NULL
				custom_setlist_num_id_5 = NULL
				custom_setlist_num_id_6 = NULL
				section_breaker_index_1 = 99999
				section_breaker_index_2 = 99999
				section_breaker_index_3 = 99999
			}
		}
	endif
	if GotParam \{next_state}
		setlist_menu :SetTags next_state = <next_state>
	endif
	if GotParam \{for_custom_setlist}
		setlist_menu :SetTags for_custom_setlist = <for_custom_setlist>
		if (<for_custom_setlist> = 1)
			setlist_menu :se_setprops {
				event_handlers = [
					{pad_start ui_setlist_compact_and_continue}
					{pad_L1 ui_setlist_custom_remove_all params = {for_custom_setlist = <for_custom_setlist>}}
					{pad_R1 ui_setlist_custom_remove_all params = {for_custom_setlist = <for_custom_setlist>}}
				]
			}
		endif
	endif
	setlist_menu :se_setprops {
		event_handlers = [
			{pad_option setlist_jump_down_section params = {for_custom_setlist = <for_custom_setlist>}}
		]
	}
	CreateScreenElement \{parent = setlist_menu
		Type = descinterface
		desc = 'setlist_b_head_desc'
		auto_dims = FALSE
		dims = (0.0, 300.0)
		just = [
			center
			center
		]
		setlist_b_head_text_text = qs(0xa01b0e62)
		not_focusable}
	if ($band_mode_mode = quickplay)
		part = Band
	else
		getplayerinfo \{1
			part}
	endif
	final_array = [gh_songlist]
	final_array_text = [qs(0x1f7addb6)]
	final_array_index = 0
	GetArraySize <final_array>
	final_array_size = <array_Size>
	if (<allow_jammode> = 0)
		<final_array_size> = (<final_array_size> - 1)
	endif
	if (<for_custom_setlist> = 1)
		setlistinterface :se_setprops \{number_of_stars_alpha = 0}
		CreateScreenElement \{Type = ContainerElement
			parent = root_window
			id = custom_setlist_helper_container
			Pos = (640.0, 600.0)
			z_priority = 100000}
		CreateScreenElement \{Type = SpriteElement
			parent = custom_setlist_helper_container
			texture = pill_128_fill
			dims = (192.0, 38.0)
			Pos = (400.0, 0.0)
			just = [
				center
				top
			]
			rgba = [
				20
				20
				20
				255
			]
			z_priority = 10}
		sprite_params = {
			Type = SpriteElement
			texture = setlist_custom_circle_sm_empty
			parent = custom_setlist_helper_container
			dims = (32.0, 32.0)
			just = [center top]
			rgba = [255 255 255 255]
			z_priority = 200000
		}
		text_params = {
			Type = TextElement
			font = fontgrid_text_a8
			Scale = (0.65000004, 0.65000004)
			just = [center top]
			rgba = [0 0 0 255]
			z_priority = 300000
		}
		circle_num = 1
		circle_pos = (331.0, 3.0)
		begin
		CreateScreenElement <sprite_params> Pos = <circle_pos> z_priority = 13
		formatText checksumName = circle_full_id 'cs_dot_helper_circle_%d' d = <circle_num>
		CreateScreenElement <sprite_params> Pos = <circle_pos> texture = setlist_custom_circle_sm id = <circle_full_id> z_priority = 12
		formatText TextName = num_text qs(0x76b3fda7) d = <circle_num>
		text_pos = (16.0, 0.0)
		if (<circle_num> = 1)
			text_pos = (<text_pos> + (-2.0, 0.0))
		endif
		CreateScreenElement <text_params> Pos = <text_pos> text = <num_text> parent = <id> z_priority = 15
		<circle_pos> = (<circle_pos> + (28.0, 0.0))
		<circle_num> = (<circle_num> + 1)
		repeat 6
		setup_custom_setlist_helpers
	else
		setlistinterface :se_setprops \{number_of_stars_alpha = 1}
	endif
	gamemode_gettype
	<game_mode_type> = <Type>
	if ($current_progression_flag = career_band && $is_network_game = 0)
		getsavegamefromcontroller controller = ($band_mode_current_leader)
	else
		getsavegamefromcontroller controller = ($primary_controller)
	endif
	final_num_songs = 0
	begin
	CreateScreenElement {
		parent = setlist_menu
		Type = descinterface
		desc = 'setlist_b_divider_desc'
		auto_dims = FALSE
		dims = (0.0, 60.0)
		setlist_divider_title_text = (<final_array_text> [<final_array_index>])
		not_focusable
	}
	bx_resizesetlistdivider id = <id>
	Wait \{1
		gameframe}
	if <id> :desc_resolvealias Name = alias_setlist_divider
		AssignAlias id = <resolved_id> alias = setlist_divider_menu
		GetScreenElementDims \{id = setlist_divider_menu}
		<id> :se_getprops
		if GotParam \{setlist_divider_title_dims}
			container_width = 1080
			divider_width = ((<container_width> - (<setlist_divider_title_dims>.(1.0, 0.0))) / 2)
			divider_bar_dims = (<divider_width> * (1.0, 0.0) + (<setlist_list_divider_l_dims>.(0.0, 1.0) * (0.0, 1.0)))
			<id> :se_setprops setlist_list_divider_l_dims = <divider_bar_dims> setlist_list_divider_r_dims = <divider_bar_dims>
		endif
	endif
	song_array = (<final_array> [<final_array_index>])
	if (<song_array> = jammode_songs)
	else
		if (<for_createagig> = 1 && <song_array> != gh4_download_songlist)
			get_songs_available_for_create_a_setlist
			GetArraySize <unlocked_songs_array>
		else
			GetArraySize $<song_array>
		endif
		total_songs = <array_Size>
		if (<total_songs> > 0)
			if (<final_array_index> = 0)
				setlist_menu :SetTags {section_breaker_index_1 = (<final_num_songs> + 1)}
			elseif (<final_array_index> = 1)
				setlist_menu :SetTags {section_breaker_index_2 = (<final_num_songs> + 2)}
			endif
			sortable_songlist = []
			i = 0
			begin
			if (<for_createagig> = 1 && <song_array> != gh4_download_songlist)
				song = (<unlocked_songs_array> [<i>])
			else
				song = ($<song_array> [<i>])
			endif
			get_song_title song = <song>
			GetUpperCaseString <song_title>
			<song_title> = <UppercaseString>
			get_song_artist song = <song>
			GetUpperCaseString <song_artist>
			<song_artist> = <UppercaseString>
			if (<for_createagig> = 1 && <song_array> != gh4_download_songlist)
				element_to_add = {song_checksum = <song> song_title = <song_title> song_artist = <song_artist>}
				AddArrayElement array = <sortable_songlist> element = <element_to_add>
				sortable_songlist = <array>
			else
				if NOT StructureContains structure = ($gh_songlist_props.<song>) never_show_in_setlist
					get_song_saved_in_globaltags song = <song>
					get_song_allowed_in_quickplay song = <song>
					no_vocals = 0
					if IsSongAvailable song = <song>
						if StructureContains structure = ($gh_songlist_props.<song>) doesnt_support_vocals
							no_vocals = 1
						endif
						if (<no_vocals> = 0)
							element_to_add = {song_checksum = <song> song_title = <song_title> song_artist = <song_artist>}
							AddArrayElement array = <sortable_songlist> element = <element_to_add>
							sortable_songlist = <array>
						endif
					endif
				endif
			endif
			i = (<i> + 1)
			repeat <total_songs>
			if ((<song_array> = gh4_download_songlist) && ($setlist_sorts [$setlist_sort_index].Name = career_order))
				sortandbuildsonglist SongList = <sortable_songlist> sortby = artist_alphabetical
			else
				sortandbuildsonglist SongList = <sortable_songlist> sortby = ($setlist_sorts [$setlist_sort_index].Name)
			endif
			GetArraySize <sorted_songlist>
			total_songs = <array_Size>
			if (<total_songs> > 0)
				i = 0
				begin
				song = (<sorted_songlist> [<i>])
				get_song_prefix song = <song>
				beginner_skull_alpha = 1
				easy_skull_alpha = 1
				medium_skull_alpha = 1
				hard_skull_alpha = 1
				expert_skull_alpha = 1
				ghost_skull_alpha = 1
				beginner_text_alpha = 1
				easy_text_alpha = 1
				medium_text_alpha = 1
				hard_text_alpha = 1
				expert_text_alpha = 1
				ghost_text_alpha = 0
				highest_difficulty_texture = icon_difficulty_beginner
				highest_difficulty_alpha = 0
				get_quickplay_song_score song = <song_prefix> difficulty_text_nl = 'easy_rhythm' part = ($part_list_props.<part>.text_nl)
				formatText TextName = score_easy_rhythm_text qs(0x4d4555da) s = <score>
				if (<score> = 0 || $game_mode = training)
					<beginner_skull_alpha> = <ghost_skull_alpha>
					<beginner_text_alpha> = <ghost_text_alpha>
				else
					<highest_difficulty_texture> = icon_difficulty_beginner
					<highest_difficulty_alpha> = 1
				endif
				get_quickplay_song_score song = <song_prefix> difficulty_text_nl = 'easy' part = ($part_list_props.<part>.text_nl)
				formatText TextName = score_easy_text qs(0x4d4555da) s = <score>
				if (<score> = 0 || $game_mode = training)
					<easy_skull_alpha> = <ghost_skull_alpha>
					<easy_text_alpha> = <ghost_text_alpha>
				else
					<highest_difficulty_texture> = icon_difficulty_easy
					<highest_difficulty_alpha> = 1
				endif
				get_quickplay_song_score song = <song_prefix> difficulty_text_nl = 'medium' part = ($part_list_props.<part>.text_nl)
				formatText TextName = score_medium_text qs(0x4d4555da) s = <score>
				if (<score> = 0 || $game_mode = training)
					<medium_skull_alpha> = <ghost_skull_alpha>
					<medium_text_alpha> = <ghost_text_alpha>
				else
					<highest_difficulty_texture> = icon_difficulty_medium
					<highest_difficulty_alpha> = 1
				endif
				get_quickplay_song_score song = <song_prefix> difficulty_text_nl = 'hard' part = ($part_list_props.<part>.text_nl)
				formatText TextName = score_hard_text qs(0x4d4555da) s = <score>
				if (<score> = 0 || $game_mode = training)
					<hard_skull_alpha> = <ghost_skull_alpha>
					<hard_text_alpha> = <ghost_text_alpha>
				else
					<highest_difficulty_texture> = icon_difficulty_hard
					<highest_difficulty_alpha> = 1
				endif
				get_quickplay_song_score song = <song_prefix> difficulty_text_nl = 'expert' part = ($part_list_props.<part>.text_nl)
				formatText TextName = score_expert_text qs(0x4d4555da) s = <score>
				if (<score> = 0 || $game_mode = training)
					<expert_skull_alpha> = <ghost_skull_alpha>
					<expert_text_alpha> = <ghost_text_alpha>
				else
					<highest_difficulty_texture> = icon_difficulty_expert
					<highest_difficulty_alpha> = 1
				endif
				get_quickplay_song_stars song = <song_prefix> difficulty_text_nl = 'easy_rhythm' part = ($part_list_props.<part>.text_nl)
				beginner_stars = <stars>
				beginner_percent100 = <percent100>
				get_quickplay_song_stars song = <song_prefix> difficulty_text_nl = 'easy' part = ($part_list_props.<part>.text_nl)
				easy_stars = <stars>
				easy_percent100 = <percent100>
				get_quickplay_song_stars song = <song_prefix> difficulty_text_nl = 'medium' part = ($part_list_props.<part>.text_nl)
				medium_stars = <stars>
				medium_percent100 = <percent100>
				get_quickplay_song_stars song = <song_prefix> difficulty_text_nl = 'hard' part = ($part_list_props.<part>.text_nl)
				hard_stars = <stars>
				hard_percent100 = <percent100>
				get_quickplay_song_stars song = <song_prefix> difficulty_text_nl = 'expert' part = ($part_list_props.<part>.text_nl)
				expert_stars = <stars>
				expert_percent100 = <percent100>
				<highest_difficulty_alpha> = 0
				score_text = {
					score_beginner_text = <score_easy_rhythm_text>
					score_easy_text = <score_easy_text>
					score_medium_text = <score_medium_text>
					score_hard_text = <score_hard_text>
					score_expert_text = <score_expert_text>
					icon_difficulty_beginner_alpha = <beginner_skull_alpha>
					icon_difficulty_easy_alpha = <easy_skull_alpha>
					icon_difficulty_medium_alpha = <medium_skull_alpha>
					icon_difficulty_hard_alpha = <hard_skull_alpha>
					icon_difficulty_expert_alpha = <expert_skull_alpha>
					score_beginner_alpha = <beginner_text_alpha>
					score_easy_alpha = <easy_text_alpha>
					score_medium_alpha = <medium_text_alpha>
					score_hard_alpha = <hard_text_alpha>
					score_expert_alpha = <expert_text_alpha>
				}
				skull_tags = {
					icon_difficulty_texture = <highest_difficulty_texture>
					icon_difficulty_alpha = <highest_difficulty_alpha>
				}
				get_song_title song = <song>
				GetUpperCaseString <song_title>
				<song_title> = <UppercaseString>
				get_song_artist song = <song>
				GetUpperCaseString <song_artist>
				<song_artist> = <UppercaseString>
				formatText TextName = song_text qs(0xd14bfeeb) a = <song_artist> t = <song_title>
				<double_kick_alpha> = 0
				if (<song> != jamsession)
					if (($permanent_songlist_props.<song>.double_kick) = 1)
						<double_kick_alpha> = 1
					endif
				endif
				format_globaltag_song_checksum song = <song> part_text = ($part_list_props.<part>.text_nl)
				GetGlobalTags <song_checksum> param = double_bass_complete
				CreateScreenElement {
					parent = setlist_menu
					Type = descinterface
					desc = 'setlist_b_listing_desc'
					auto_dims = FALSE
					dims = (0.0, 50.0)
					double_kick_alpha = 0
					event_handlers = [
						{focus ui_setlist_lyrics_focus_song params = {for_custom_setlist = <for_custom_setlist>}}
						{unfocus ui_setlist_lyrics_unfocus_song}
					]
					tags = {
						custom_setlist_num = 0
						song_title = <song_title>
						song_artist = <song_artist>
						score_text = <score_text>
						skull_tags = <skull_tags>
						part = <part>
						song = <song>
						index = <final_num_songs>
						beginner_stars = <beginner_stars>
						easy_stars = <easy_stars>
						medium_stars = <medium_stars>
						hard_stars = <hard_stars>
						expert_stars = <expert_stars>
						beginner_percent100 = <beginner_percent100>
						easy_percent100 = <easy_percent100>
						medium_percent100 = <medium_percent100>
						hard_percent100 = <hard_percent100>
						expert_percent100 = <expert_percent100>
						double_bass_complete = <double_bass_complete>
					}
					just = [center center]
					listing_text = <song_text>
					<skull_tags>
				}
				<id> :se_setprops event_handlers = [{pad_choose ui_setlist_lyrics_choose_song params = {song = <song>}}]
				if <id> :desc_resolvealias Name = alias_listing
					GetScreenElementChildren id = <resolved_id>
					GetScreenElementPosition id = <resolved_id> summed
					<text_pos> = <screenelementpos>
					GetScreenElementProps id = (<children> [0]) force_update
					<width> = (<dims>.(1.0, 0.0) * <Scale>.(1.0, 0.0))
					<double_kick_offset> = ((1.0, 0.0) * ((<width> / 2) + 42) + (0.0, 1.0))
					<new_pos> = (<text_pos> - <double_kick_offset>)
					<id> :se_setprops double_kick_pos = <new_pos>
				endif
				final_num_songs = (<final_num_songs> + 1)
				if ($sort_restore_selections = 1)
					get_song_index_from_temp_quickplay_song_list song = <song>
					if (<quickplay_index> != -1)
						<id> :ui_setlist_lyrics_choose_song for_custom_setlist = <for_custom_setlist> song = <song> custom_index = <quickplay_index> no_sound
					endif
				endif
				i = (<i> + 1)
				repeat <total_songs>
			endif
			<jam_song> = 0
		endif
	endif
	<final_array_index> = (<final_array_index> + 1)
	repeat <final_array_size>
	setlist_menu :SetTags total_songs = <final_num_songs> prev_index = 0
	add_user_control_helper \{text = qs(0x4d9ad28f)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	setlist_show_sort_helper_text
	setlist_show_jump_helper_text
	SpawnScriptNow \{setlist_songpreview_monitor}
	LaunchEvent target = setlist_menu Type = focus data = {child_index = <selected_index>}
	StartRendering
	Change \{sort_restore_selections = 0}
	Change \{refresh_from_sort = 0}
	destroy_loading_screen
endscript

script ui_destroy_setlist_lyrics 
	KillSpawnedScript \{Name = ui_create_setlist_spawned}
	if NOT (($top_rockers_enabled) || (GotParam from_leaderboard))
		SpawnScriptNow \{destroy_setlist_songpreview_monitor}
		if NOT ($game_mode = practice || $game_mode = training)
			menu_music_on
		endif
	endif
	if ScreenElementExists \{id = setlistinterface}
		setlistinterface :Die
	endif
	Change \{user_control_pill_color = [
			20
			20
			20
			155
		]}
	Change \{user_control_pill_text_color = [
			220
			220
			220
			255
		]}
	generic_ui_destroy
	destroy_menu \{menu_id = custom_setlist_helper_container}
endscript

script ui_deinit_setlist_lyrics 
	KillSpawnedScript \{Name = ui_create_setlist_spawned}
	SpawnScriptNow \{destroy_setlist_songpreview_monitor}
	menu_music_on
endscript

script ui_setlist_lyrics_choose_song 
	SoundEvent \{event = ui_sfx_select}
	RequireParams \{[
			song
		]
		all}
	setlistinterface :se_setprops \{block_events}
	SpawnScriptNow ui_setlist_lyrics_choose_song_spawned params = {<...>}
endscript

script ui_setlist_lyrics_choose_song_spawned 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ($current_song_info_id) :desc_resolvealias Name = alias_highlight
		GetScreenElementChildren id = <resolved_id>
		(<children> [0]) :se_setprops rgba = [255 255 255 200]
		(<children> [1]) :se_setprops rgba = [255 255 255 200]
		(<children> [2]) :se_setprops rgba = [255 255 255 200]
		setlistinterface :se_setprops \{setlist_b_bg_runnerl_pos = {
				relative
				(-200.0, 0.0)
			}
			time = 0.1}
		setlistinterface :se_setprops \{setlist_b_bg_runnerr_pos = {
				relative
				(200.0, 0.0)
			}
			time = 0.1}
		setlistinterface :se_setprops \{setlist_scroll_alpha = 0
			time = 0.1}
		setlistinterface :se_waitprops
		if NOT ScreenElementExists \{id = setlistinterface}
			return
		endif
		(<children> [0]) :se_setprops rgba = [255 255 255 0]
		(<children> [1]) :se_setprops rgba = [255 255 255 0]
		(<children> [2]) :se_setprops rgba = [255 255 255 0]
	endif
	($current_song_info_id) :se_getprops double_kick_alpha
	($current_song_info_id) :desc_resolvealias Name = alias_double_kick
	GetScreenElementPosition id = <resolved_id> summed
	setlistinterface :se_setprops \{unblock_events}
	setlist_menu :GetTags
	ui_event_add_params selected_index = <tag_selected_index>
	ui_event_wait state = uistate_song_extras_lyrics data = {<...> double_kick_alpha = <double_kick_alpha> double_kick_pos = <screenelementpos> from_backstage = 1}
endscript

script ui_setlist_lyrics_focus_song \{time = 0.1}
	if ScriptIsRunning \{ui_create_setlist_lyrics_spawned}
		time = 0.0
	endif
	GetTags
	printf \{qs(0xd7d4fd5d)}
	if NOT GotParam \{index}
		return
	endif
	se_getparentid
	<parent_id> :GetTags
	if (<prev_index> > <index>)
		pos_move = (0.0, -10.0)
	else
		pos_move = (0.0, 10.0)
	endif
	<selected_song_highlighted> = FALSE
	if (<for_custom_setlist> = 1)
		if song_is_in_temp_quickplay_song_list song = <song>
			<selected_song_highlighted> = true
			if GotParam \{jam_song}
				if (<example_songs> = 1)
					<jam_song> = (<jam_song> + 1000)
				endif
				if NOT song_is_in_temp_jamsession_song_list jam_song = <jam_song>
					<selected_song_highlighted> = FALSE
				endif
			endif
		endif
	endif
	setlist_menu :SetTags last_focused_song = <song>
	if NOT GotParam \{jam_song}
		setlist_update_current_section index = <tag_selected_index> song = <song>
	else
		setlist_update_current_section index = <tag_selected_index> song = <song> jam_song = <jam_song>
	endif
	<info_scores_container_alpha> = 1.0
	<instrument_icons_alpha> = 0.0
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		<info_scores_container_alpha> = 0.0
		<instrument_icons_alpha> = 0.0
	endif
	if NOT (<tag_selected_index> < <section_breaker_index_3>)
		<info_scores_container_alpha> = 0.0
		<instrument_icons_alpha> = 1.0
		setlist_get_jammode_playback_tracks jam_song = <jam_song> example_songs = <example_songs>
		icon_no_instrument_guitar_alpha = 1
		icon_no_instrument_bass_alpha = 1
		icon_no_instrument_drums_alpha = 1
		icon_no_instrument_mic_alpha = 1
		if GotParam \{playback_track1}
			if (<playback_track1> > -1)
				icon_no_instrument_guitar_alpha = 0
			endif
		endif
		if GotParam \{playback_track2}
			if (<playback_track2> > -1)
				icon_no_instrument_bass_alpha = 0
			endif
		endif
		if GotParam \{playback_track_drums}
			if (<playback_track_drums> > 0)
				icon_no_instrument_drums_alpha = 0
			endif
		endif
		if GotParam \{playback_track_vocals}
			if (<playback_track_vocals> > 0)
				icon_no_instrument_mic_alpha = 0
			endif
		endif
	endif
	formatText TextName = song_text qs(0x90e80fb9) a = <song_artist> t = <song_title>
	StringToCharArray string = <song_text>
	GetArraySize <char_array>
	<double_kick_alpha> = 0
	if (<song> != jamsession)
		if (($permanent_songlist_props.<song>.double_kick) = 1)
			<double_kick_alpha> = 1
		endif
	endif
	<album_text> = ($permanent_songlist_props.<song>.album)
	formatText TextName = album_text qs(0x842b520a) s = <album_text>
	se_setprops {
		desc = 'setlist_b_info3_desc'
		auto_dims = FALSE
		dims = (0.0, 150.0)
		setlist_info_title_artist_text = <song_text>
		setlist_info_title_album_text = <album_text>
		setlist_info_title_artist_pos = {<pos_move> relative}
		<score_text>
		info_scores_container_alpha = <info_scores_container_alpha>
		instrument_icons_alpha = <instrument_icons_alpha>
		icon_no_instrument_guitar_alpha = <icon_no_instrument_guitar_alpha>
		icon_no_instrument_bass_alpha = <icon_no_instrument_bass_alpha>
		icon_no_instrument_drums_alpha = <icon_no_instrument_drums_alpha>
		icon_no_instrument_mic_alpha = <icon_no_instrument_mic_alpha>
		double_kick_alpha = 0
	}
	Obj_GetID
	Change current_song_info_id = <objID>
	percent_index = 0
	percent_diffs = ['beginner' 'easy' 'medium' 'hard' 'expert']
	percent_aliases = [
		alias_setlist_b_stars_beginner
		alias_setlist_b_stars_easy
		alias_setlist_b_stars_medium
		alias_setlist_b_stars_hard
		alias_setlist_b_stars_expert
	]
	star_diffs = [
		beginner_stars
		easy_stars
		medium_stars
		hard_stars
		expert_stars
	]
	begin
	formatText checksumName = percent100 '%s_percent100' s = (<percent_diffs> [<percent_index>])
	if GotParam <percent100>
		if <objID> :desc_resolvealias Name = (<percent_aliases> [<percent_index>])
			if (<...>.<percent100> = 1)
				<resolved_id> :se_setprops star_texture = song_complete_star_perfect star_rgba = [255 255 255 255]
			endif
			if <resolved_id> :desc_resolvealias Name = alias_stars
				GetScreenElementChildren id = <resolved_id>
				num_stars = (<...>.(<star_diffs> [<percent_index>]))
				if (<num_stars> = 0)
					<resolved_id> :se_setprops alpha = 0
				else
					GetArraySize <children>
					stars_left = <array_Size>
					if (<num_stars> < 5 && <stars_left> = 5)
						if ScreenElementExists id = (<children> [0])
							DestroyScreenElement id = (<children> [0])
							stars_left = (<stars_left> - 1)
						endif
					endif
					if (<num_stars> < 4 && <stars_left> = 4)
						if ScreenElementExists id = (<children> [1])
							DestroyScreenElement id = (<children> [1])
						endif
					endif
				endif
			endif
		endif
	endif
	percent_index = (<percent_index> + 1)
	repeat 5
	se_setprops {
		setlist_info_title_artist_pos = {(<pos_move> * -1) relative}
		time = <time>
	}
	if <objID> :desc_resolvealias Name = alias_setlist_info_text
		GetScreenElementChildren id = <resolved_id>
		GetScreenElementChildren id = (<children> [2])
		GetScreenElementProps id = (<children> [0]) force_update
		<width> = (<dims>.(1.0, 0.0) * <Scale>.(1.0, 0.0))
		<double_kick_offset> = ((1.0, 0.0) * ((<width> / 2) + 12))
		<new_pos> = ((0.0, 10.0) - <double_kick_offset>)
		<objID> :se_setprops double_kick_pos = <new_pos>
	endif
	<ratio> = (<index> / (<total_songs> * 1.0))
	Pos = ((0.0, 1.0) * ((<ratio> * 365) - 206))
	bg_pos = ((0.0, -1.0) * (<ratio> * (4400 - 720)))
	bg_runnerc_pos = ((0.0, -1.0) * (<ratio> * (2200 - 720)))
	bg_runnerl_pos = (((0.0, -1.0) * (<ratio> * (2200 - 720))) + (-640.0, 0.0))
	bg_runnerr_pos = (((0.0, -1.0) * (<ratio> * (2200 - 720))) + (640.0, 0.0))
	setlistinterface :se_setprops {
		setlist_b_scrollthumb_pos = <Pos>
		setlist_b_bg_pos = <bg_pos>
		setlist_b_bg_runnerc_pos = <bg_runnerc_pos>
		setlist_b_bg_runnerl_pos = <bg_runnerl_pos>
		setlist_b_bg_runnerr_pos = <bg_runnerr_pos>
		time = <time>
	}
	<parent_id> :SetTags prev_index = <index>
	Obj_GetID
	create_custom_setlist_circle id = <objID>
	if (<tag_selected_index> < <section_breaker_index_3>)
		gig_posters_song_focus song = <song>
	else
		gig_posters_song_focus
	endif
	<objID> :Obj_SpawnScriptNow ui_setlist_highlight_motion
endscript

script ui_setlist_lyrics_unfocus_song 
	GetTags
	formatText TextName = song_text qs(0xd14bfeeb) a = <song_artist> t = <song_title>
	<double_kick_alpha> = 0
	if (<song> != jamsession)
		if (($permanent_songlist_props.<song>.double_kick) = 1)
			<double_kick_alpha> = 1
		endif
	endif
	se_setprops {
		desc = 'setlist_b_listing_desc'
		auto_dims = FALSE
		dims = (0.0, 50.0)
		listing_text = <song_text>
		double_kick_alpha = 0
		<skull_tags>
	}
	if desc_resolvealias \{Name = alias_listing}
		GetScreenElementChildren id = <resolved_id>
		GetScreenElementPosition id = <resolved_id> summed
		<text_pos> = <screenelementpos>
		GetScreenElementProps id = (<children> [0]) force_update
		<width> = (<dims>.(1.0, 0.0) * <Scale>.(1.0, 0.0))
		<double_kick_offset> = ((1.0, 0.0) * ((<width> / 2) + 42) + (0.0, 1.0))
		<new_pos> = (<text_pos> - <double_kick_offset>)
		se_setprops double_kick_pos = <new_pos>
	endif
	Obj_GetID
	create_custom_setlist_circle id = <objID> use_small_circle
endscript
