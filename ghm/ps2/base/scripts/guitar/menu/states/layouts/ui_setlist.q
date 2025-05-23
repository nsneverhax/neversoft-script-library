setlist_sorts = [
	{
		Name = title_alphabetical
		title = qs(0x73063505)
	}
	{
		Name = artist_alphabetical
		title = qs(0x68455dfd)
	}
	{
		Name = career_order
		title = qs(0xda629fb0)
	}
]
setlist_sort_index = 0
sort_restore_selections = 0
refresh_from_sort = 0
temp_quickplay_song_list = [
	NULL
	NULL
	NULL
	NULL
	NULL
	NULL
]
temp_jamsession_song_list = [
	-1
	-1
	-1
	-1
	-1
	-1
]
ui_setlist_skip_helpers = 1

script reset_temp_quickplay_song_list 
	GetArraySize \{$temp_quickplay_song_list}
	i = 0
	begin
	SetArrayElement ArrayName = temp_quickplay_song_list globalarray index = <i> NewValue = NULL
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script reset_temp_jamsession_song_list 
	GetArraySize \{$temp_jamsession_song_list}
	i = 0
	begin
	SetArrayElement ArrayName = temp_jamsession_song_list globalarray index = <i> NewValue = -1
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script song_is_in_temp_quickplay_song_list 
	GetArraySize \{$temp_quickplay_song_list}
	<i> = 0
	begin
	if (<song> = ($temp_quickplay_song_list [<i>]))
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script get_song_index_from_temp_quickplay_song_list 
	GetArraySize \{$temp_quickplay_song_list}
	<i> = 0
	begin
	if (<song> = ($temp_quickplay_song_list [<i>]))
		return quickplay_index = <i>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return \{quickplay_index = -1}
endscript

script get_song_index_from_temp_jamsession_song_list 
	GetArraySize \{$temp_jamsession_song_list}
	<i> = 0
	begin
	if (<jam_song> = ($temp_jamsession_song_list [<i>]))
		return jamsession_index = <i>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return \{jamsession_index = -1}
endscript

script song_is_in_temp_jamsession_song_list 
	GetArraySize \{$temp_jamsession_song_list}
	<i> = 0
	begin
	if (<jam_song> = ($temp_jamsession_song_list [<i>]))
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script ui_create_setlist 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	if ($quickplay_song_list_current = -1)
		Change \{quickplay_song_list_current = 0}
	endif
	0x79db87d7
	KillSpawnedScript \{Name = loading_screen_crowd_swell}
	KillSpawnedScript \{Name = crowd_loading_whistle}
	KillSpawnedScript \{Name = oneshotsbetweensongs}
	KillSpawnedScript \{Name = surgebetweensongs}
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
	SpawnScriptNow ui_create_setlist_spawned params = <...>
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_create_setlist_spawned \{for_custom_setlist = 1
		last_focused_song = None}
	OnExitRun \{0xf00f29a9}
	0x79db87d7
	Change menu_flow_locked = ($menu_flow_locked + 1)
	for_custom_setlist = 0
	if NOT GotParam \{from_leaderboard}
		Change \{rich_presence_context = presence_gigboard_and_setlist}
	endif
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
	StopRendering
	if ($is_network_game = 1)
		<for_custom_setlist> = 0
	endif
	if ($game_mode = training || $game_mode = tutorial)
		<for_custom_setlist> = 0
	endif
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
		<for_custom_setlist> = 0
	endif
	allow_jammode = 0
	0xb17a28cd \{condition = {
			0xdffcb66f
		}}
	show_quit_warning = 1
	if (<for_custom_setlist> = 1)
		if ($sort_restore_selections = 0)
			if GotParam \{keep_setlist}
				Change \{sort_restore_selections = 1}
			else
				reset_temp_quickplay_song_list
				reset_temp_jamsession_song_list
			endif
		endif
	else
		show_quit_warning = 0
	endif
	if NOT GotParam \{keep_current_level}
		if NOT ($game_mode = training)
			StartRendering
			frontend_load_soundcheck \{loadingscreen}
			StopRendering
		endif
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
	if NOT GotParam \{use_all_controllers}
		Change \{rocking_out_too_hard = 1}
		setlistinterface :obj_spawnscript \{0x8ed8c79c}
	endif
	if setlistinterface :desc_resolvealias \{Name = alias_setlist_menu}
		AssignAlias id = <resolved_id> alias = setlist_menu
		setlist_menu :se_setprops {
			tags = {
				from_top_rocker = <from_top_rocker>
				from_leaderboard = <from_leaderboard>
				for_custom_setlist = 0
				current_section = 1
				last_focused_song = <last_focused_song>
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
	ui_event_remove_params \{param = last_focused_song}
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
	final_array = [gh_songlist jammode_songs]
	final_array_text = [qs(0x1f7addb6) qs(0x25f4338c)]
	final_array_index = 0
	GetArraySize <final_array>
	final_array_size = <array_Size>
	<allow_jammode> = 0
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
		dims = (0.0, 50.0)
		setlist_divider_title_text = (<final_array_text> [<final_array_index>])
		not_focusable
	}
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
	if (<for_createagig> = 1)
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
		if (<for_createagig> = 1)
			song = (<unlocked_songs_array> [<i>])
		else
			song = ($<song_array> [<i>])
		endif
		get_song_title song = <song>
		GetUpperCaseString <song_title>
		<song_title> = <UppercaseString>
		get_song_artist song = <song>
		if NOT GotParam \{song_artist}
			song_artist = qs(0xbf9c7a91)
		endif
		GetUpperCaseString <song_artist>
		<song_artist> = <UppercaseString>
		if ((GotParam from_top_rocker) || (GotParam from_leaderboard))
			if NOT StructureContains structure = ($gh_songlist_props.<song>) never_show_in_setlist
				get_song_saved_in_globaltags song = <song>
				get_song_allowed_in_quickplay song = <song>
				no_vocals = 0
				if StructureContains structure = ($gh_songlist_props.<song>) doesnt_support_vocals
					if GotParam \{from_leaderboard}
						if (($current_leaderboard_instrument) = mic)
							no_vocals = 1
						endif
					elseif GotParam \{from_top_rocker}
						getplayerinfo \{1
							part}
						if (<part> = vocals)
							no_vocals = 1
						endif
					endif
				endif
				if ((<saved_in_globaltags> = 1) && (<allowed_in_quickplay> = 1) && (<no_vocals> = 0))
					element_to_add = {song_checksum = <song> song_title = <song_title> song_artist = <song_artist>}
					AddArrayElement array = <sortable_songlist> element = <element_to_add>
					sortable_songlist = <array>
				endif
			endif
		else
			if IsSongAvailable song = <song>
				element_to_add = {song_checksum = <song> song_title = <song_title> song_artist = <song_artist>}
				AddArrayElement array = <sortable_songlist> element = <element_to_add>
				sortable_songlist = <array>
			endif
		endif
		i = (<i> + 1)
		repeat <total_songs>
		if (<final_array_index> = 1)
			sortandbuildsonglist SongList = <sortable_songlist> sortby = career_order
		elseif ((<song_array> = gh4_download_songlist) && ($setlist_sorts [$setlist_sort_index].Name = career_order))
			sortandbuildsonglist SongList = <sortable_songlist> sortby = artist_alphabetical
		else
			sortandbuildsonglist SongList = <sortable_songlist> sortby = ($setlist_sorts [$setlist_sort_index].Name)
		endif
		GetArraySize <sorted_songlist>
		total_songs = <array_Size>
		if (<total_songs> = 0)
			<id> :Die
		endif
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
			if (<score> = 0)
				<beginner_skull_alpha> = <ghost_skull_alpha>
				<beginner_text_alpha> = <ghost_text_alpha>
			else
				<highest_difficulty_texture> = icon_difficulty_beginner
				<highest_difficulty_alpha> = 1
			endif
			get_quickplay_song_score song = <song_prefix> difficulty_text_nl = 'easy' part = ($part_list_props.<part>.text_nl)
			formatText TextName = score_easy_text qs(0x4d4555da) s = <score>
			if (<score> = 0)
				<easy_skull_alpha> = <ghost_skull_alpha>
				<easy_text_alpha> = <ghost_text_alpha>
			else
				<highest_difficulty_texture> = icon_difficulty_easy
				<highest_difficulty_alpha> = 1
			endif
			get_quickplay_song_score song = <song_prefix> difficulty_text_nl = 'medium' part = ($part_list_props.<part>.text_nl)
			formatText TextName = score_medium_text qs(0x4d4555da) s = <score>
			if (<score> = 0)
				<medium_skull_alpha> = <ghost_skull_alpha>
				<medium_text_alpha> = <ghost_text_alpha>
			else
				<highest_difficulty_texture> = icon_difficulty_medium
				<highest_difficulty_alpha> = 1
			endif
			get_quickplay_song_score song = <song_prefix> difficulty_text_nl = 'hard' part = ($part_list_props.<part>.text_nl)
			formatText TextName = score_hard_text qs(0x4d4555da) s = <score>
			if (<score> = 0)
				<hard_skull_alpha> = <ghost_skull_alpha>
				<hard_text_alpha> = <ghost_text_alpha>
			else
				<highest_difficulty_texture> = icon_difficulty_hard
				<highest_difficulty_alpha> = 1
			endif
			<expert_plus_icon_alpha> = 0
			get_quickplay_song_score song = <song_prefix> difficulty_text_nl = 'expert' part = ($part_list_props.<part>.text_nl)
			formatText TextName = score_expert_text qs(0x4d4555da) s = <score>
			if (<score> = 0)
				<expert_skull_alpha> = <ghost_skull_alpha>
				<expert_text_alpha> = <ghost_text_alpha>
			else
				<highest_difficulty_texture> = icon_difficulty_expert
				<highest_difficulty_alpha> = 1
				get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = 'expert' part = ($part_list_props.<part>.text_nl)
				GetGlobalTags <songname> param = tr_double_bass_complete
				if (<tr_double_bass_complete> = 1)
					<expert_plus_icon_alpha> = 1
					<highest_difficulty_alpha> = 0
				endif
			endif
			gamemode_gettype
			if (<Type> = faceoff || <Type> = pro_faceoff || <Type> = battle)
				<highest_difficulty_alpha> = 0
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
				icon_difficulty_expert_plus_alpha = <expert_plus_icon_alpha>
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
			GetGlobalTags <song_checksum> param = tr_double_bass_complete
			CreateScreenElement {
				parent = setlist_menu
				Type = descinterface
				desc = 'setlist_b_listing_desc'
				auto_dims = FALSE
				dims = (0.0, 50.0)
				double_kick_alpha = <double_kick_alpha>
				event_handlers = [
					{focus ui_setlist_focus_song params = {for_custom_setlist = <for_custom_setlist>}}
					{unfocus ui_setlist_unfocus_song}
				]
				tags = {
					custom_setlist_num = 0
					song_title = <song_title>
					song_artist = <song_artist>
					score_text = <score_text>
					skull_tags = <skull_tags>
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
					double_bass_complete = <tr_double_bass_complete>
				}
				just = [center center]
				listing_text = <song_text>
				<skull_tags>
			}
			if (<last_focused_song> = <song>)
				selected_index = (<final_num_songs> + 2 + <final_array_index>)
			endif
			if ($is_network_game = 1)
				if local_player_is_choosing_song
					<id> :se_setprops event_handlers = [{pad_choose ui_setlist_choose_song params = {song = <song> for_custom_setlist = <for_custom_setlist>}}]
				endif
			else
				<id> :se_setprops event_handlers = [{pad_choose ui_setlist_choose_song params = {song = <song> for_custom_setlist = <for_custom_setlist>}}]
			endif
			if <id> :desc_resolvealias Name = alias_listing
				GetScreenElementChildren id = <resolved_id>
				GetScreenElementPosition id = <resolved_id> summed
				<text_pos> = <screenelementpos>
				GetScreenElementProps id = (<children> [0]) force_update
				<width> = (<dims>.(1.0, 0.0) * <Scale>.(1.0, 0.0))
				<double_kick_offset> = ((1.0, 0.0) * ((<width> / 2) + 23) + (0.0, 1.0))
				<new_pos> = (<text_pos> - <double_kick_offset>)
				<id> :se_setprops double_kick_pos = <new_pos>
				<icon_difficulty_offset> = ((1.0, 0.0) * ((<width> / 2) + 40) + (0.0, 1.0))
				<new_pos> = (<text_pos> + <icon_difficulty_offset>)
				<id> :se_setprops icon_difficulty_pos = <new_pos>
				<id> :se_setprops icon_difficulty_expert_plus_pos = <new_pos>
			endif
			final_num_songs = (<final_num_songs> + 1)
			if ($sort_restore_selections = 1)
				get_song_index_from_temp_quickplay_song_list song = <song>
				if (<quickplay_index> != -1)
					<id> :ui_setlist_choose_song for_custom_setlist = <for_custom_setlist> song = <song> custom_index = <quickplay_index> no_sound
				endif
			endif
			i = (<i> + 1)
			repeat <total_songs>
		endif
		<jam_song> = 0
	endif
	<final_array_index> = (<final_array_index> + 1)
	repeat <final_array_size>
	destroy_loading_screen
	StartRendering
	setlist_menu :SetTags total_songs = <final_num_songs> prev_index = 0
	if ($is_network_game = 1)
		if local_player_is_choosing_song
			menu_finish
		else
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100}
		endif
	else
		0xae8560b8
	endif
	SpawnScriptNow \{0xb20ce9b6}
	if ($is_network_game = 0)
		SpawnScriptNow \{0x1e464d15}
	endif
	if ResolveScreenElementID id = {setlist_menu child = <selected_index>}
		if ($is_network_game = 0)
			<resolved_id> :obj_spawnscript ui_setlist_focus_song params = {time = 0.0 for_custom_setlist = <for_custom_setlist>}
		endif
	endif
	if ($is_network_game = 0)
		LaunchEvent Type = focus target = setlist_menu data = {child_index = <selected_index>}
		setlist_menu :obj_spawnscript \{wait_and_render_setlist_menu}
	else
		LaunchEvent Type = focus target = setlist_menu data = {child_index = <selected_index>}
		StartRendering
	endif
	if ($is_network_game = 1)
		setlistinterface :se_setprops \{scribble_lower_alpha = 1}
		setlistinterface :se_setprops \{number_of_stars_text = qs(0xbee5bf02)}
		if ($g_disable_song_chooser_spinner = 1)
			create_net_setlist_ui \{parent_element = setlistinterface}
			LaunchEvent Type = focus target = setlist_menu data = {child_index = <selected_index>}
		else
			if ($refresh_from_sort = 0)
				LaunchEvent Type = focus target = setlist_menu data = {child_index = <selected_index>}
				Wait \{1
					gameframes}
				create_song_chooser_spinner selected_index = <selected_index>
			else
				SpawnScriptNow \{0x1e464d15}
				create_net_setlist_ui \{parent_element = setlistinterface}
			endif
		endif
	endif
	Change \{sort_restore_selections = 0}
	Change \{refresh_from_sort = 0}
	destroy_loading_screen
	Wait \{1
		Second}
	if setlistinterface :desc_resolvealias \{Name = alias_setlist_menu}
		AssignAlias id = <resolved_id> alias = setlist_menu
	endif
	Change menu_flow_locked = ($menu_flow_locked - 1)
	SpawnScriptLater 0xfd42e87c params = {show_quit_warning = <show_quit_warning> for_custom_setlist = <for_custom_setlist>}
endscript

script 0xfd42e87c 
	Wait \{30
		gameframes}
	setlist_menu :se_setprops {
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back ui_setlist_back params = {show_quit_warning = <show_quit_warning>}}
			{pad_option2 setlist_switch_sort params = {for_custom_setlist = <for_custom_setlist>}}
		]
	}
	0xf00f29a9
endscript

script wait_and_render_setlist_menu 
	Wait \{3
		gameframes}
	StartRendering
endscript

script ui_destroy_setlist 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	KillSpawnedScript \{Name = ui_create_setlist_spawned}
	if NOT (($top_rockers_enabled) || (GotParam from_leaderboard))
		SpawnScriptNow \{0xb20ce9b6}
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
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_deinit_setlist 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	KillSpawnedScript \{Name = ui_create_setlist_spawned}
	SpawnScriptNow \{0xb20ce9b6}
	menu_music_on
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script setup_custom_setlist_helpers 
	clean_up_user_control_helpers
	set_user_control_color \{text_rgba = [
			0
			0
			0
			255
		]
		bg_rgba = [
			200
			200
			200
			200
		]}
	set_num_songs_in_quickplay_list
	setlist_menu :GetSingleTag \{from_top_rocker}
	if GotParam \{from_top_rocker}
		menu_finish
		return
	endif
	setlist_menu :GetSingleTag \{from_leaderboard}
	if GotParam \{from_leaderboard}
		menu_finish
		return
	endif
	<controller> = ($primary_controller)
	if NOT (($menu_over_ride_exclusive_device) = -1)
		<controller> = ($menu_over_ride_exclusive_device)
	endif
	if ((IsGuitarController controller = <controller>) || (isdrumcontroller controller = <controller>))
		<clear_button> = orange
	else
		<clear_button> = lb
	endif
	<selected_song_highlighted> = FALSE
	if GotParam \{song}
		if song_is_in_temp_quickplay_song_list song = <song>
			<selected_song_highlighted> = true
			if GotParam \{jam_song}
				if NOT song_is_in_temp_jamsession_song_list jam_song = <jam_song>
					<selected_song_highlighted> = FALSE
				endif
			endif
		endif
	endif
	<pick_song_text> = qs(0x562b9e24)
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		<pick_song_text> = qs(0x4d9ad28f)
	endif
	if (<num_songs> = 0)
		add_user_control_helper text = <pick_song_text> button = green z = 100000
		DestroyScreenElement \{id = custom_setlist_continue_pill}
	elseif (<num_songs> = 6)
		if (<selected_song_highlighted> = true)
			add_user_control_helper \{text = qs(0x0307b55c)
				button = green
				z = 100000}
		endif
	else
		if (<selected_song_highlighted> = true)
			add_user_control_helper \{text = qs(0x0307b55c)
				button = green
				z = 100000}
		else
			add_user_control_helper text = <pick_song_text> button = green z = 100000
		endif
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	setlist_show_sort_helper_text
	setlist_show_jump_helper_text
	if (<num_songs> != 0)
		if NOT ScreenElementExists \{id = custom_setlist_continue_pill}
			CreateScreenElement \{Type = SpriteElement
				parent = custom_setlist_helper_container
				id = custom_setlist_continue_pill
				texture = pill_128_fill
				dims = (500.0, 48.0)
				Pos = (-283.0, -18.0)
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
				z_priority = 100001}
		endif
		user_control_helper_get_buttonchar \{button = start}
		CreateScreenElement {
			parent = custom_setlist_helper_container
			Type = descinterface
			id = custom_setlist_continue_helper
			desc = 'helper_pill'
			auto_dims = FALSE
			dims = (0.0, 36.0)
			Pos = (-400.0, -7.0)
			just = [center top]
			helper_button_text = <buttonchar>
			helper_description_text = qs(0x182f0173)
			helper_pill_rgba = [220 220 220 255]
			helper_description_rgba = [220 220 220 255]
		}
		<id> :se_getprops
		<id> :se_setprops {
			helper_pill_body_dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 32.0))
			dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (64.0, 32.0))
		}
		SpawnScriptLater \{pulsate_helper_pill
			params = {
				id = custom_setlist_continue_helper
			}}
		user_control_helper_get_buttonchar \{button = orange}
		CreateScreenElement {
			parent = custom_setlist_helper_container
			Type = descinterface
			id = 0xb0b1d617
			desc = 'helper_pill'
			auto_dims = FALSE
			dims = (0.0, 36.0)
			Pos = (-150.0, -7.0)
			just = [center top]
			helper_button_text = <buttonchar>
			helper_description_text = qs(0x22f2d0e7)
			helper_pill_rgba = [220 220 220 255]
			helper_description_rgba = [220 220 220 255]
		}
	endif
endscript

script setlist_show_sort_helper_text 
	<next_sort_index> = ($setlist_sort_index + 1)
	GetArraySize \{$setlist_sorts}
	if (<next_sort_index> >= <array_Size>)
		<next_sort_index> = 0
	endif
	<sort_text> = (($setlist_sorts [<next_sort_index>]).title)
	add_user_control_helper text = <sort_text> button = yellow z = 100000
endscript

script setlist_show_jump_helper_text 
	if setlist_get_next_section
		switch <next_section>
			case 1
			add_user_control_helper \{text = qs(0x3c1b3ab6)
				button = blue
				z = 100000}
			case 2
			case 3
			add_user_control_helper \{text = qs(0xa1a26014)
				button = blue
				z = 100000}
		endswitch
	endif
endscript

script setlist_get_next_section 
	setlist_menu :GetSingleTag \{current_section}
	<new_section> = <current_section>
	begin
	<new_section> = (<new_section> + 1)
	if (<new_section> = 4)
		<new_section> = 1
	endif
	if setlist_is_section_valid section = <new_section>

		break
	endif
	repeat 3
	if NOT (<new_section> = <current_section>)
		return {true next_section = <new_section>}
	endif
	return \{FALSE}
endscript

script setlist_is_section_valid 
	setlist_menu :GetTags
	switch <section>
		case 1
		if NOT (<section_breaker_index_1> = 99999)
			return \{true}
		endif
		case 2
		if NOT (<section_breaker_index_2> = 99999)
			return \{true}
		endif
		case 3
		if NOT (<section_breaker_index_3> = 99999)
			return \{true}
		endif
	endswitch
	return \{FALSE}
endscript

script setlist_jump_down_section 
	setlist_menu :GetTags
	if NOT setlist_get_next_section
		return
	endif
	PlaySound \{menu_entername_back
		vol = -3
		buss = Front_End}
	switch <next_section>
		case 1
		focus_index = <section_breaker_index_1>
		case 2
		focus_index = <section_breaker_index_2>
		case 3
		focus_index = <section_breaker_index_3>
	endswitch
	if ResolveScreenElementID id = {setlist_menu child = <focus_index>}
		<resolved_id> :obj_spawnscript ui_setlist_focus_song params = {time = 0.0}
	endif
	LaunchEvent Type = unfocus target = setlist_menu data = {child_index = <tag_selected_index>}
	Wait \{3
		gameframe}
	LaunchEvent Type = focus target = setlist_menu data = {child_index = <focus_index>}
endscript

script setlist_update_current_section 
	setlist_menu :GetTags
	if (<index> >= <section_breaker_index_3>)
		<current_section> = 3
	elseif (<tag_selected_index> >= <section_breaker_index_2>)
		<current_section> = 2
	elseif (<tag_selected_index> >= <section_breaker_index_1>)
		<current_section> = 1
	endif

	setlist_menu :SetTags current_section = <current_section>
	if ($ui_setlist_skip_helpers = 1)
		return
	endif
	if (<for_custom_setlist> = 1)
		setup_custom_setlist_helpers song = <song> jam_song = <jam_song>
	else
		clean_up_user_control_helpers
		if ($is_network_game = 1)
			if local_player_is_choosing_song
				add_user_control_helper \{text = qs(0x4d9ad28f)
					button = green
					z = 100
					all_buttons}
			endif
		else
			add_user_control_helper \{text = qs(0x4d9ad28f)
				button = green
				z = 100
				all_buttons}
			0x53c4b886
		endif
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
		setlist_show_sort_helper_text
		setlist_show_jump_helper_text
		if ($game_mode = p1_career ||
				$game_mode = p2_career ||
				$game_mode = p3_career ||
				$game_mode = p4_career)
			if ($enable_button_cheats = 1)
				add_user_control_helper \{text = qs(0x91fff11f)
					button = rb
					z = 100000}
			endif
		endif
	endif
endscript

script ui_return_setlist_unblock_spawned 
	Wait \{1
		gameframe}
	se_setprops \{unblock_events}
endscript

script ui_return_setlist 
	clean_up_user_control_helpers
	if ($is_network_game = 0)
		add_user_control_helper \{text = qs(0x4d9ad28f)
			button = green
			z = 100000
			all_buttons}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		0x53c4b886
		setlist_show_sort_helper_text
		setlist_show_jump_helper_text
	endif
	if setlistinterface :desc_resolvealias \{Name = alias_setlist_menu}
		AssignAlias id = <resolved_id> alias = setlist_menu
		setlist_menu :obj_spawnscript \{ui_return_setlist_unblock_spawned}
		if ($is_network_game = 1)
			if local_player_is_choosing_song
				add_user_control_helper \{text = qs(0x4d9ad28f)
					button = green
					z = 100
					all_buttons}
			endif
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100}
			setlist_show_sort_helper_text
			setlist_show_jump_helper_text
		endif
		setlistinterface :GetTags
	endif
	setlist_menu :GetTags
	if (<for_custom_setlist> = 1)
		setup_custom_setlist_helpers song = <last_focused_song>
	endif
	SpawnScriptNow \{0x1e464d15}
endscript

script ui_setlist_highlight_motion 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if desc_resolvealias \{Name = alias_highlight}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			prev = 0
			curr = 1
			begin
			prev_id = (<children> [<prev>])
			curr_id = (<children> [<curr>])
			if ScreenElementExists id = <prev_id>
				<prev_id> :se_setprops alpha = 0.0
			endif
			if ScreenElementExists id = <curr_id>
				<curr_id> :se_setprops alpha = 1
			endif
			prev = <curr>
			next = RandomInteger (0.0, 2.0)
			if (<next> = <prev>)
				curr = (<curr> + 1)
			else
				curr = <next>
			endif
			if (<curr> >= <array_Size>)
				curr = 0
			endif
			if ScreenElementExists id = <curr_id>
				rand = Random (@ 0 @ 1 )
				if (<rand> = 1)
					<curr_id> :se_setprops flip_v = true
				else
					<curr_id> :se_setprops flip_v = FALSE
				endif
				rand = Random (@ 0 @ 1 )
				if (<rand> = 1)
					<curr_id> :se_setprops flip_h = true
				else
					<curr_id> :se_setprops flip_h = FALSE
				endif
			endif
			Wait \{0.1
				Second}
			repeat
		endif
	endif
endscript

script ui_setlist_focus_song \{time = 0.1}
	GetTags

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
	<should_update_pad_choose> = 0
	if ($is_network_game = 1)
		if local_player_is_choosing_song
			<should_update_pad_choose> = 1
		endif
	else
		<should_update_pad_choose> = 1
	endif
	if (<should_update_pad_choose> = 1)
		if (<selected_song_highlighted> = true)
			se_setprops {
				event_handlers = [
					{pad_choose ui_setlist_custom_remove params = {song = <song> for_custom_setlist = <for_custom_setlist>}}
				]
				replace_handlers
			}
		else
			<pad_choose_params> = {song = <song> for_custom_setlist = <for_custom_setlist>}
			if (<song> = jamsession)
				<pad_choose_params> = {song = <song> for_custom_setlist = <for_custom_setlist> jam_song = <jam_song> example_songs = <example_songs>}
			endif
			se_setprops {
				event_handlers = [
					{pad_choose ui_setlist_choose_song params = <pad_choose_params>}
				]
				replace_handlers
			}
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
	icon_difficulty_expert_alpha = 1
	icon_difficulty_expert_plus_alpha = 0
	if (<song> != jamsession)
		if (<double_bass_complete> = 1)
			<icon_difficulty_expert_alpha> = 0
			<icon_difficulty_expert_plus_alpha> = 1
		endif
	endif
	se_setprops {
		desc = 'setlist_b_info_desc'
		auto_dims = FALSE
		dims = (0.0, 150.0)
		setlist_info_title_artist_text = <song_text>
		setlist_info_title_artist_pos = {<pos_move> relative}
		<score_text>
		info_scores_container_alpha = <info_scores_container_alpha>
		instrument_icons_alpha = <instrument_icons_alpha>
		icon_no_instrument_guitar_alpha = <icon_no_instrument_guitar_alpha>
		icon_no_instrument_bass_alpha = <icon_no_instrument_bass_alpha>
		icon_no_instrument_drums_alpha = <icon_no_instrument_drums_alpha>
		icon_no_instrument_mic_alpha = <icon_no_instrument_mic_alpha>
		double_kick_alpha = <double_kick_alpha>
		icon_difficulty_expert_alpha = <icon_difficulty_expert_alpha>
		icon_difficulty_expert_plus_alpha = <icon_difficulty_expert_plus_alpha>
	}
	Obj_GetID
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
				<resolved_id> :se_setprops star_rgba = [255 255 255 255]
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
	Pos = ((0.0, 1.0) * ((<ratio> * 365) - 207))
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
		time = 0.0
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

script ui_setlist_unfocus_song 
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
		double_kick_alpha = <double_kick_alpha>
		<skull_tags>
	}
	if desc_resolvealias \{Name = alias_listing}
		GetScreenElementChildren id = <resolved_id>
		GetScreenElementPosition id = <resolved_id> summed
		<text_pos> = <screenelementpos>
		GetScreenElementProps id = (<children> [0]) force_update
		<width> = (<dims>.(1.0, 0.0) * <Scale>.(1.0, 0.0))
		<double_kick_offset> = ((1.0, 0.0) * ((<width> / 2) + 23) + (0.0, 1.0))
		<new_pos> = (<text_pos> - <double_kick_offset>)
		se_setprops double_kick_pos = <new_pos>
		<icon_difficulty_offset> = ((1.0, 0.0) * ((<width> / 2) + 40) + (0.0, 1.0))
		<new_pos> = (<text_pos> + <icon_difficulty_offset>)
		se_setprops icon_difficulty_pos = <new_pos>
		se_setprops icon_difficulty_expert_plus_pos = <new_pos>
	endif
	Obj_GetID
	create_custom_setlist_circle id = <objID> use_small_circle
endscript

script ui_setlist_get_next_custom_index 
	GetArraySize \{$temp_quickplay_song_list}
	i = 0
	begin
	if ($temp_quickplay_song_list [<i>] = NULL)
		return custom_index = <i> index_max = <array_Size>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return custom_index = <array_Size> index_max = <array_Size>
endscript

script set_num_songs_in_quickplay_list 
	GetArraySize \{$temp_quickplay_song_list}
	i = 0
	num_songs = 0
	begin
	if NOT ($temp_quickplay_song_list [<i>] = NULL)
		<num_songs> = (<num_songs> + 1)
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	Change num_quickplay_song_list = <num_songs>
	return num_songs = <num_songs>
endscript

script ui_setlist_custom_remove 
	setlist_menu :GetTags
	Obj_GetID
	<objID> :GetSingleTag custom_setlist_num
	if (<custom_setlist_num> > 0)
		if <objID> :desc_resolvealias Name = alias_custom_setlist_container
			if GetScreenElementChildren id = <resolved_id>
				GetArraySize <children>
				if (<array_Size> > 0)
					destroy_menu menu_id = (<children> [0])
				endif
			endif
		endif
		SetArrayElement ArrayName = temp_quickplay_song_list globalarray index = (<custom_setlist_num> - 1) NewValue = NULL
		SetArrayElement ArrayName = temp_jamsession_song_list globalarray index = (<custom_setlist_num> - 1) NewValue = -1
		set_num_songs_in_quickplay_list
		formatText checksumName = circle_full_id 'cs_dot_helper_circle_%d' d = <custom_setlist_num>
		SetScreenElementProps id = <circle_full_id> alpha = 1
		<objID> :SetTags custom_setlist_num = 0
		switch (<custom_setlist_num>)
			case 1
			setlist_menu :SetTags \{custom_setlist_num_id_1 = NULL}
			SoundEvent \{event = quickplay_remove_song}
			case 2
			setlist_menu :SetTags \{custom_setlist_num_id_2 = NULL}
			SoundEvent \{event = quickplay_remove_song}
			case 3
			setlist_menu :SetTags \{custom_setlist_num_id_3 = NULL}
			SoundEvent \{event = quickplay_remove_song}
			case 4
			setlist_menu :SetTags \{custom_setlist_num_id_4 = NULL}
			SoundEvent \{event = quickplay_remove_song}
			case 5
			setlist_menu :SetTags \{custom_setlist_num_id_5 = NULL}
			SoundEvent \{event = quickplay_remove_song}
			case 6
			setlist_menu :SetTags \{custom_setlist_num_id_6 = NULL}
			SoundEvent \{event = quickplay_remove_song}
		endswitch
		se_setprops {
			event_handlers = [
				{pad_choose ui_setlist_choose_song params = {song = <song> for_custom_setlist = <for_custom_setlist>}}
			]
			replace_handlers
		}
		setup_custom_setlist_helpers
	endif
endscript

script ui_setlist_custom_remove_all 
	setlist_menu :GetTags
	index = 0
	begin
	formatText checksumName = custom_setlist_num_id 'custom_setlist_num_id_%d' d = (<index> + 1)
	obj_id = (<...>.<custom_setlist_num_id>)
	if (<obj_id> != NULL)
		if <obj_id> :desc_resolvealias Name = alias_custom_setlist_container
			if GetScreenElementChildren id = <resolved_id>
				GetArraySize <children>
				SoundEvent \{event = quickplay_remove_all_songs}
				if (<array_Size> > 0)
					destroy_menu menu_id = (<children> [0])
				endif
			endif
			<obj_id> :GetSingleTag song
			<obj_id> :se_setprops {
				event_handlers = [
					{pad_choose ui_setlist_choose_song params = {song = <song> for_custom_setlist = <for_custom_setlist>}}
				]
				replace_handlers
			}
		endif
		SetArrayElement ArrayName = temp_quickplay_song_list globalarray index = <index> NewValue = NULL
		formatText checksumName = circle_full_id 'cs_dot_helper_circle_%d' d = (<index> + 1)
		SetScreenElementProps id = <circle_full_id> alpha = 1
		<obj_id> :SetTags custom_setlist_num = 0
	endif
	<index> = (<index> + 1)
	repeat 6
	reset_temp_jamsession_song_list
	set_num_songs_in_quickplay_list
	setup_custom_setlist_helpers
endscript

script create_custom_setlist_circle 
	if ScreenElementExists id = <id>
		<id> :GetTags
		if GotParam \{custom_setlist_num}
			if (<custom_setlist_num> > 0)
				if <id> :desc_resolvealias Name = alias_custom_setlist_container
					if GetScreenElementChildren id = <resolved_id>
						GetArraySize <children>
						if (<array_Size> > 0)
							destroy_menu menu_id = (<children> [0])
						endif
					endif
					CreateScreenElement {
						Type = ContainerElement
						parent = <resolved_id>
					}
					cs_container = <id>
					dims = (75.0, 75.0)
					highlight_dims = (160.0, 160.0)
					text_scale = 1.5
					if (<custom_setlist_num> = 1)
						text_pos = (-4.0, 0.0)
					else
						text_pos = (0.0, 0.0)
					endif
					if GotParam \{use_small_circle}
						highlight_dims = (106.0, 106.0)
						dims = (50.0, 50.0)
						text_scale = 1.0
					endif
					CreateScreenElement {
						Type = SpriteElement
						parent = <cs_container>
						texture = setlist_custom_circle_lg
						dims = <dims>
						just = [center center]
						z_priority = 20
					}
					formatText TextName = text qs(0x76b3fda7) d = <custom_setlist_num>
					CreateScreenElement {
						Type = TextElement
						parent = <cs_container>
						font = fontgrid_text_a8
						text = <text>
						Pos = <text_pos>
						Scale = <text_scale>
						rgba = [220 220 220 255]
						just = [center center]
						z_priority = 21
					}
					if GotParam \{use_small_circle}
						<cs_container> :se_setprops Pos = {relative (-30.0, 0.0)}
					else
						<cs_container> :se_setprops Pos = {relative (-50.0, 0.0)}
					endif
				endif
			endif
		endif
	endif
endscript

script ui_setlist_choose_song \{device_num = 0}

	if ($transitions_locked = 1 || $menu_flow_locked > 0)
		return
	endif
	if (<for_custom_setlist> = 1)
		setlist_menu :GetTags
		if ($sort_restore_selections = 0)
			ui_setlist_get_next_custom_index
		else
			GetArraySize \{$temp_quickplay_song_list}
			<index_max> = <array_Size>
		endif
		if (<custom_index> < <index_max>)
			Obj_GetID
			<objID> :GetSingleTag custom_setlist_num
			<objID> :GetSingleTag jam_song
			<objID> :GetSingleTag example_songs
			if (<custom_setlist_num> <= 0)
				if ($sort_restore_selections = 0)
					SetArrayElement ArrayName = temp_quickplay_song_list globalarray index = <custom_index> NewValue = <song>
					if GotParam \{jam_song}
						if (<example_songs> = 1)
							SetArrayElement ArrayName = temp_jamsession_song_list globalarray index = <custom_index> NewValue = (1000 + <jam_song>)
						else
							SetArrayElement ArrayName = temp_jamsession_song_list globalarray index = <custom_index> NewValue = <jam_song>
						endif
					endif
				endif
				set_num_songs_in_quickplay_list
				<objID> :SetTags custom_setlist_num = (<custom_index> + 1)
				if ($sort_restore_selections = 1)
					create_custom_setlist_circle id = <objID> use_small_circle = 1
				else
					create_custom_setlist_circle id = <objID>
				endif
				switch (<custom_index> + 1)
					case 1
					setlist_menu :SetTags custom_setlist_num_id_1 = <objID>
					if NOT GotParam \{no_sound}
						SoundEvent \{event = quickplay_select_song}
					endif
					case 2
					setlist_menu :SetTags custom_setlist_num_id_2 = <objID>
					if NOT GotParam \{no_sound}
						SoundEvent \{event = quickplay_select_song}
					endif
					case 3
					setlist_menu :SetTags custom_setlist_num_id_3 = <objID>
					if NOT GotParam \{no_sound}
						SoundEvent \{event = quickplay_select_song}
					endif
					case 4
					setlist_menu :SetTags custom_setlist_num_id_4 = <objID>
					if NOT GotParam \{no_sound}
						SoundEvent \{event = quickplay_select_song}
					endif
					case 5
					setlist_menu :SetTags custom_setlist_num_id_5 = <objID>
					if NOT GotParam \{no_sound}
						SoundEvent \{event = quickplay_select_song}
					endif
					case 6
					setlist_menu :SetTags custom_setlist_num_id_6 = <objID>
					if NOT GotParam \{no_sound}
						SoundEvent \{event = quickplay_select_song}
					endif
				endswitch
				se_setprops {
					event_handlers = [
						{pad_choose ui_setlist_custom_remove params = {song = <song> for_custom_setlist = <for_custom_setlist>}}
					]
					replace_handlers
				}
				formatText checksumName = circle_full_id 'cs_dot_helper_circle_%d' d = (<custom_index> + 1)
				SetScreenElementProps id = <circle_full_id> alpha = 0
				if NOT GotParam \{example_songs}
					setup_custom_setlist_helpers song = <song>
				else
					if (<example_songs> = 1)
						<jam_song> = (<jam_song> + 1000)
					endif
					setup_custom_setlist_helpers song = <song> jam_song = <jam_song>
				endif
			endif
		endif
	else
		Obj_GetID
		<objID> :GetSingleTag jam_song
		<objID> :GetSingleTag example_songs
		SetArrayElement ArrayName = temp_quickplay_song_list globalarray index = 0 NewValue = <song>
		if GotParam \{jam_song}
			if (<example_songs> = 1)
				SetArrayElement ArrayName = temp_jamsession_song_list globalarray index = 0 NewValue = (1000 + <jam_song>)
			else
				SetArrayElement ArrayName = temp_jamsession_song_list globalarray index = 0 NewValue = <jam_song>
			endif
		else
			SetArrayElement \{ArrayName = temp_jamsession_song_list
				globalarray
				index = 0
				NewValue = -1}
		endif
		ui_setlist_continue <...>
	endif
endscript

script ui_setlist_compact_and_continue 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	reset_quickplay_song_list
	Change \{quickplay_song_list_current = 0}
	outer_index = 0
	inner_index = 0
	begin
	if ($temp_quickplay_song_list [<inner_index>] != NULL)
		SetArrayElement ArrayName = quickplay_song_list globalarray index = <outer_index> NewValue = ($temp_quickplay_song_list [<inner_index>])
		<outer_index> = (<outer_index> + 1)
	endif
	<inner_index> = (<inner_index> + 1)
	repeat 6
	ui_setlist_continue device_num = <device_num> song = ($quickplay_song_list [0])
endscript

script ui_setlist_continue 
	if ScreenElementExists \{id = setlist_menu}
		setlist_menu :menu_getselectedindex
		ui_event_add_params selected_index = <selected_index>
	endif
	if (<song> != NULL)
		setlist_menu :se_setprops \{block_events}
		Change current_song = <song>
		Change track_last_song = <song>
		setlist_menu :GetSingleTag \{from_leaderboard}
		if GotParam \{from_leaderboard}
			generic_menu_pad_choose_sound
			ui_leaderboard_list_select song_checksum = <song> device_num = <device_num>
			return
		endif
		if ($is_network_game = 1)

			quickplay_choose_random_venue online_song = <song>
			if search_for_tool_in_quickplay_list song = <song>
				Change \{current_level = load_z_tool}
			endif
			if ($net_new_matchmaking_ui_flag = 1)
				get_player_num_from_controller controller_index = <device_num>
				getplayerinfo <player_num> net_obj_id
				if (<net_obj_id> = $online_song_choice_id)
					SoundEvent \{event = song_affirmation}
					SpawnScriptNow \{0xb20ce9b6}

					net_request_song
				else

					return
				endif
			else
				SoundEvent \{event = song_affirmation}
				SpawnScriptNow \{0xb20ce9b6}

				net_request_song
			endif
		else
			if search_for_tool_in_quickplay_list song = <song>
				Change \{current_level = load_z_tool}
				can_change_level = 0
			else
				Change \{current_level = $g_last_venue_selected}
				can_change_level = 1
			endif
			if ($practice_enabled)
				practice_check_song_for_parts
			else
				includes_double_kick = 0
				GetArraySize ($quickplay_song_list)
				<i> = 0
				begin
				song_entry = ($quickplay_song_list [<i>])
				if (<song_entry> != jamsession && <song_entry> != NULL)
					if ($permanent_songlist_props.<song_entry>.double_kick = 1)
						<includes_double_kick> = 1
						break
					endif
				endif
				<i> = (<i> + 1)
				repeat <array_Size>
				if NOT ($top_rockers_enabled)
					SpawnScriptNow \{0xb20ce9b6}
				endif
				if ($current_num_players = 1)
					Change player1_device = <device_num>
				endif
				switch ($game_mode)
					case p2_coop
					case p2_battle
					case p2_pro_faceoff
					case p2_faceoff
					generic_event_choose state = uistate_band_difficulty data = {p2 = 1 continue_data = {state = uistate_play_song <...>}}
					case p1_quickplay
					Obj_GetID
					setlistinterface :SetTags current_id = <objID>
					setlist_menu :se_setprops \{block_events}
					generic_menu_pad_choose_sound
					generic_event_choose state = uistate_select_difficulty data = {is_popup includes_double_kick = <includes_double_kick> from_setlist = 1 ignore_camera can_change_level = <can_change_level>}
					case p2_quickplay
					case p3_quickplay
					case p4_quickplay
					setlist_menu :GetSingleTag \{from_top_rocker}
					if GotParam \{from_top_rocker}
						generic_event_choose state = uistate_select_difficulty data = {is_popup includes_double_kick = <includes_double_kick> from_setlist = 1 ignore_camera can_change_level = <can_change_level>}
						return
					endif
					generic_event_choose state = uistate_band_difficulty data = {continue_data = {state = uistate_play_song <...>}}
					default
					destroy_band
					setlist_menu :GetTags
					if GotParam \{next_state}
						if search_for_tool_in_quickplay_list
							generic_event_choose \{state = uistate_play_song
								data = {
									selected_level = load_z_tool
									can_change_level = 0
								}}
						else
							generic_event_choose state = <next_state>
						endif
					else
						generic_event_choose \{state = uistate_play_song}
					endif
				endswitch
			endif
		endif
	endif
endscript

script ui_setlist_back 
	if (<show_quit_warning> = 1)
		set_num_songs_in_quickplay_list
		if (<num_songs> > 0)
			setlist_menu :se_setprops \{block_events}
			Change \{menu_focus_color = [
					255
					255
					255
					255
				]}
			generic_event_choose \{state = uistate_setlist_quit_warning
				data = {
					is_popup
				}}
			return
		endif
	endif
	Change \{sort_restore_selections = 0}
	ui_setlist_go_back
endscript

script ui_setlist_go_back 
	SpawnScriptNow \{0xb20ce9b6}
	if ($is_network_game = 1)
		if ($net_song_countdown = 0)
			Obj_GetID
			setlistinterface :SetTags current_id = <objID>
			setlist_menu :se_setprops \{block_events}
			generic_menu_pad_back_sound
			generic_event_choose \{state = uistate_online_quit_warning
				data = {
					is_popup
				}}
		endif
	else
		additional_data = {}
		if ui_event_exists_in_stack \{Name = 'gig_posters'}
			additional_data = {ignore_camera = 1}
		endif
		generic_event_back no_sound data = {num_states = <num_states> came_from_setlist = 1 <additional_data>}
	endif
endscript

script setlist_switch_sort 
	if ($is_network_game = 0 || $net_song_countdown = 0)
		0x79db87d7
		if (<for_custom_setlist> = 1)
			Change \{sort_restore_selections = 1}
		endif
		Change \{refresh_from_sort = 1}
		generic_menu_pad_choose_sound
		GetArraySize \{$setlist_sorts}
		Change setlist_sort_index = ($setlist_sort_index + 1)
		if ($setlist_sort_index >= <array_Size>)
			Change \{setlist_sort_index = 0}
		endif
		0xb20ce9b6
		setlist_menu :GetTags \{last_focused_song}
		0xf7e0f992 \{Wait}
		ui_event event = menu_refresh data = {restore_selections last_focused_song = <last_focused_song>}
		0xf00f29a9
	endif
endscript

script setlist_create_jammode_songs 
	setlist_add_jammode_songs_list SongList = ($jam_curr_directory_listing) <...> sorted = 1
	setlist_add_jammode_songs_list SongList = ($jam_song_assets) <...> example_songs = 1 sorted = 1
	return final_num_songs = <final_num_songs>
endscript

script setlist_add_jammode_songs_list \{example_songs = 0
		sorted = 0}
	GetArraySize <SongList>
	if (<array_Size> = 0)
		return
	endif
	total_songs = <array_Size>
	if (<sorted> = 1)
		<sortable_songlist> = []
		<i> = 0
		begin
		<jam_song_data> = (<SongList> [<i>])
		formatText checksumName = song 'jamsong_%i' i = <i>
		AddArrayElement array = <sortable_songlist> element = {song_checksum = <song> song_title = (<jam_song_data>.FileName) song_artist = (<jam_song_data>.artist)}
		<sortable_songlist> = <array>
		<i> = (<i> + 1)
		repeat <total_songs>
		<sortby> = ($setlist_sorts [$setlist_sort_index].Name)
		if NOT ((<sortby> = title_alphabetical) || (<sortby> = artist_alphabetical))
			<sortby> = title_alphabetical
		endif
		sortandbuildsonglist SongList = <sortable_songlist> sortby = <sortby> output_indices
	else
		createindexarray <total_songs>
		<sorted_songlist_indices> = <index_array>
	endif
	get_player_num_from_controller controller_index = ($primary_controller)
	if (<player_num> >= 1)
		getplayerinfo <player_num> part
	else

		part = guitar
	endif
	i = 0
	song_index = 0
	begin
	<skip> = 1
	song_index = (<sorted_songlist_indices> [<i>])
	if NOT GotParam \{num_band_players}
		filter_songs_for_single song_struct = (<SongList> [<song_index>]) part = <part>
	else
		filter_songs_for_band song_struct = (<SongList> [<song_index>]) band_controller_types = <band_controller_types> num_band_players = <num_band_players>
	endif
	if (<skip> = 0)
		song_title = (<SongList> [<song_index>].FileName)
		if StructureContains structure = (<SongList> [<song_index>]) artist
			song_artist = (<SongList> [<song_index>].artist)
		else
			song_artist = qs(0x00000000)
		endif
		song = jamsession
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
		score = 0
		get_difficulty_text_nl \{difficulty = easy_rhythm}
		get_formatted_songname_for_jam_mode song_prefix = <song_title> difficulty_text_nl = <difficulty_text_nl> part = ($part_list_props.<part>.text_nl)
		GetGlobalTags <songname> params = score noassert = 1
		formatText TextName = score_beginner_text qs(0x4d4555da) s = <score>
		if (<score> = 0)
			<beginner_skull_alpha> = <ghost_skull_alpha>
			<beginner_text_alpha> = <ghost_text_alpha>
		else
			<highest_difficulty_texture> = icon_difficulty_beginner
			<highest_difficulty_alpha> = 1
		endif
		score = 0
		get_difficulty_text_nl \{difficulty = easy}
		get_formatted_songname_for_jam_mode song_prefix = <song_title> difficulty_text_nl = <difficulty_text_nl> part = ($part_list_props.<part>.text_nl)
		GetGlobalTags <songname> params = score noassert = 1
		formatText TextName = score_easy_text qs(0x4d4555da) s = <score>
		if (<score> = 0)
			<easy_skull_alpha> = <ghost_skull_alpha>
			<easy_text_alpha> = <ghost_text_alpha>
		else
			<highest_difficulty_texture> = icon_difficulty_easy
			<highest_difficulty_alpha> = 1
		endif
		score = 0
		get_difficulty_text_nl \{difficulty = medium}
		get_formatted_songname_for_jam_mode song_prefix = <song_title> difficulty_text_nl = <difficulty_text_nl> part = ($part_list_props.<part>.text_nl)
		GetGlobalTags <songname> params = score noassert = 1
		formatText TextName = score_medium_text qs(0x4d4555da) s = <score>
		if (<score> = 0)
			<medium_skull_alpha> = <ghost_skull_alpha>
			<medium_text_alpha> = <ghost_text_alpha>
		else
			<highest_difficulty_texture> = icon_difficulty_medium
			<highest_difficulty_alpha> = 1
		endif
		score = 0
		get_difficulty_text_nl \{difficulty = hard}
		get_formatted_songname_for_jam_mode song_prefix = <song_title> difficulty_text_nl = <difficulty_text_nl> part = ($part_list_props.<part>.text_nl)
		GetGlobalTags <songname> params = score noassert = 1
		formatText TextName = score_hard_text qs(0x4d4555da) s = <score>
		if (<score> = 0)
			<hard_skull_alpha> = <ghost_skull_alpha>
			<hard_text_alpha> = <ghost_text_alpha>
		else
			<highest_difficulty_texture> = icon_difficulty_hard
			<highest_difficulty_alpha> = 1
		endif
		score = 0
		<expert_plus_icon_alpha> = 0
		get_difficulty_text_nl \{difficulty = expert}
		get_formatted_songname_for_jam_mode song_prefix = <song_title> difficulty_text_nl = <difficulty_text_nl> part = ($part_list_props.<part>.text_nl)
		GetGlobalTags <songname> params = score noassert = 1
		formatText TextName = score_expert_text qs(0x4d4555da) s = <score>
		if (<score> = 0)
			<expert_skull_alpha> = <ghost_skull_alpha>
			<expert_text_alpha> = <ghost_text_alpha>
		else
			<highest_difficulty_texture> = icon_difficulty_expert
			<highest_difficulty_alpha> = 1
			get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = 'expert' part = ($part_list_props.<part>.text_nl)
			GetGlobalTags <songname> param = tr_double_bass_complete
			if (<tr_double_bass_complete> = 1)
				<expert_plus_icon_alpha> = 1
				<highest_difficulty_alpha> = 0
			endif
		endif
		gamemode_gettype
		if (<Type> = faceoff || <Type> = pro_faceoff || <Type> = battle)
			<highest_difficulty_alpha> = 0
		endif
		score_text = {
			score_beginner_text = <score_beginner_text>
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
		formatText TextName = song_text qs(0xd14bfeeb) a = <song_artist> t = <song_title>
		CreateScreenElement {
			parent = setlist_menu
			Type = descinterface
			desc = 'setlist_b_listing_desc'
			auto_dims = FALSE
			dims = (0.0, 50.0)
			event_handlers = [
				{focus ui_setlist_focus_song params = {for_custom_setlist = <for_custom_setlist>}}
				{unfocus ui_setlist_unfocus_song}
			]
			tags = {
				custom_setlist_num = 0
				song_title = <song_title>
				song_artist = <song_artist>
				score_text = <score_text>
				skull_tags = <skull_tags>
				song = jamsession
				index = <final_num_songs>
				jam_song = <song_index>
				example_songs = <example_songs>
			}
			just = [center center]
			listing_text = <song_text>
			<skull_tags>
		}
		if ($is_network_game = 1)
			if local_player_is_choosing_song
				<id> :se_setprops event_handlers = [{pad_choose ui_setlist_choose_song params = {song = <song> for_custom_setlist = <for_custom_setlist> jam_song = <song_index> example_songs = <example_songs>}}]
			endif
		else
			<id> :se_setprops event_handlers = [{pad_choose ui_setlist_choose_song params = {song = <song> for_custom_setlist = <for_custom_setlist> jam_song = <song_index> example_songs = <example_songs>}}]
		endif
		if ($sort_restore_selections = 1)
			if (<example_songs> = 1)
				<song_index> = (<song_index> + 1000)
			endif
			get_song_index_from_temp_jamsession_song_list jam_song = <song_index>
			if (<jamsession_index> != -1)
				<id> :ui_setlist_choose_song {
					for_custom_setlist = <for_custom_setlist>
					song = <song>
					custom_index = <jamsession_index>
					no_sound
				}
			endif
		endif
		<final_num_songs> = (<final_num_songs> + 1)
	endif
	i = (<i> + 1)
	repeat <total_songs>
	return final_num_songs = <final_num_songs>
endscript

script filter_songs_for_single 
	if StructureContains structure = <song_struct> no_qp
		return \{skip = 1}
	endif
	<skip_it> = 0
	<playback_value> = 0
	if StructureContains structure = <song_struct> playback_track1
		if (<part> = guitar)
			<playback_value> = (<song_struct>.playback_track1)
			if (<playback_value> = -1)
				<skip_it> = 1
			endif
		elseif (<part> = bass)
			<playback_value> = (<song_struct>.playback_track2)
			if (<playback_value> = -1)
				<skip_it> = 1
			endif
		elseif (<part> = drum)
			<playback_value> = (<song_struct>.playback_track_drums)
			if (<playback_value> = 0)
				<skip_it> = 1
			endif
		elseif (<part> = vocals)
			<playback_value> = (<song_struct>.playback_track_vocals)
			if (<playback_value> = 0)
				<skip_it> = 1
			endif
		endif
	endif
	return skip = <skip_it>
endscript

script filter_songs_for_band 
	if StructureContains structure = <song_struct> no_qp
		return \{skip = 1}
	endif
	i = 0
	track1_used = 0
	begin
	<player_controller> = (<band_controller_types> [<i>])
	switch (<player_controller>)
		case 1
		satisfied = 0
		if ((<song_struct>.playback_track1) > -1)
			if (<track1_used> = 0)
				satisfied = 1
				track1_used = 1
			endif
		endif
		if (<satisfied> = 0)
			if ((<song_struct>.playback_track2) > -1)
				satisfied = 1
			endif
		endif
		if (<satisfied> = 0)

			return \{skip = 1}
		endif
		case 2
		if ((<song_struct>.playback_track_drums) = 0)

			return \{skip = 1}
		endif
		case 3
		if ((<song_struct>.playback_track_vocals) = 0)

			return \{skip = 1}
		endif
	endswitch
	<i> = (<i> + 1)
	repeat 4
	return \{skip = 0}
endscript

script search_for_tool_in_quickplay_list \{song = NULL}
	GetArraySize \{$quickplay_song_list}
	i = 0
	begin
	if ($quickplay_song_list [<i>] = parabola || <song> = parabola)
		return \{true}
	endif
	if ($quickplay_song_list [<i>] = schism || <song> = schism)
		return \{true}
	endif
	if ($quickplay_song_list [<i>] = vicarious || <song> = vicarious)
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script setlist_drop_player 

endscript

script setlist_end_game 


	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		wait_for_safe_shutdown
		if ScreenElementExists \{id = setlist_menu}
			LaunchEvent \{Type = unfocus
				target = setlist_menu}
		endif
		if ScreenElementExists \{id = net_setlist_popup_container}
			DestroyScreenElement \{id = net_setlist_popup_container}
		endif
		if ScreenElementExists \{id = net_setlist_spinner}
			DestroyScreenElement \{id = net_setlist_spinner}
		endif
		create_net_popup \{title = qs(0x5ca2c535)
			popup_text = qs(0x32f94482)}
		if ScreenElementExists \{id = popupelement}
			popupelement :Obj_SpawnScriptNow \{setlist_end_game_spawned
				id = not_ui_player_drop_scripts}
		endif
	endif
endscript

script setlist_end_game_spawned 
	Wait \{3
		Seconds}
	destroy_net_popup
	OnExitRun \{destroy_flaming_wait}
	Wait \{1
		gameframe}
	net_clear_all_remote_player_status
	quit_network_game
	generic_event_back \{state = uistate_online}
endscript

script setlist_get_jammode_playback_tracks 
	if (<example_songs> = 1)
		if (<jam_song> >= 1000)
			<jam_song> = (<jam_song> - 1000)
		endif
		<song_array> = ($jam_song_assets)
	else
		<song_array> = ($jam_curr_directory_listing)
	endif
	GetArraySize <song_array>
	if NOT (<jam_song> < <array_Size>)


		return
	endif
	return (<song_array> [<jam_song>])
endscript

script ui_setlist_popups 

	Change \{ui_setlist_skip_helpers = 0}
	if ((GotParam from_top_rocker) || (GotParam from_leaderboard))
		return
	endif
	get_current_band_info
	GetGlobalTags <band_info>
	if (<first_quickplay_setlist> = 1 && $is_network_game = 0)
		if ($game_mode != p1_quickplay &&
				$game_mode != p2_quickplay &&
				$game_mode != p3_quickplay &&
				$game_mode != p4_quickplay)
			return
		endif
		Change \{ui_setlist_skip_helpers = 1}
		ui_event_wait \{state = uistate_setlist_prompt
			data = {
				is_popup
			}}
		SetGlobalTags <band_info> params = {first_quickplay_setlist = 0}
	else
		show_doublekick = 0
		i = 1
		begin
		getplayerinfo <i> controller
		getplayerinfo <i> part
		if isdrumcontroller controller = <controller>
			part = drum
		endif
		if (<part> = drum)
			gamemode_gettype
			if (<Type> = career)
				getplayerinfo <i> double_kick_drum
				show_doublekick = <double_kick_drum>
			else
				show_doublekick = 1
			endif
			break
		endif
		i = (<i> + 1)
		repeat ($current_num_players)
		if (<show_doublekick> = 1)
			GetGlobalTags <band_info> params = {first_setlist_drum}
			if (<first_setlist_drum> = 1 && (<first_career_setlist> = 0 || <first_quickplay_setlist> = 0))
				Change \{ui_gig_posters_skip_helpers = 1}
				ui_event_wait \{state = uistate_double_bass_popup
					data = {
						is_popup
					}}
				SetGlobalTags <band_info> params = {first_setlist_drum = 0}
			endif
		endif
	endif
endscript

script 0x5f22ab77 
	0xf7e0f992 \{Wait}
endscript

script 0x53c4b886 
	if ($game_mode = p1_career || $game_mode = p2_career ||
			$game_mode = p3_career || $game_mode = p4_career)
		add_user_control_helper \{text = qs(0xd9242d03)
			button = blue
			z = 100}
	endif
endscript

script 0x8ed8c79c 
	getcontrollertype controller = ($primary_controller)
	begin
	GetActiveControllers
	<is_active_controller> = (<active_controllers> [($primary_controller)])
	prev_controller_type = <controller_type>
	getcontrollertype controller = ($primary_controller)
	if NOT (<is_active_controller> = 1)
		Wait \{1
			gameframe}
		GetActiveControllers
		<is_active_controller> = (<active_controllers> [($primary_controller)])
	endif
	0x663ef430 = 0
	if NOT (<is_active_controller> = 1)
		0x663ef430 = 1
	elseif NOT (<controller_type> = <prev_controller_type>)
		0x663ef430 = 1
		if ((<controller_type> = vocals) || (<prev_controller_type> = vocals))
			0x663ef430 = 0
		endif
	endif
	if (<0x663ef430> = 1)
		0x0d7f1010 match_type = <prev_controller_type>
	endif
	Wait \{5
		gameframes}
	repeat
endscript

script 0xae8560b8 
	if ScreenElementExists \{id = user_control_container}
		return
	endif
	add_user_control_helper \{text = qs(0x4d9ad28f)
		button = green
		z = 100
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	setlist_show_sort_helper_text
	setlist_show_jump_helper_text
endscript

script 0x0d7f1010 
	LaunchEvent \{Type = unfocus
		target = setlist_menu}
	LoadPak \{'pak/ui/controller_disconnect.pak'
		Heap = BottomUpHeap}
	begin
	if ispakloaded \{'pak/ui/controller_disconnect.pak'
			Heap = BottomUpHeap}
		break
	endif
	Wait \{5
		gameframes}
	repeat
	0x4982f585 \{text = qs(0xfbc815c6)}
	create_popup_warning_menu {
		title = qs(0xaa163738)
		textblock = {
			text = <text>
		}
		dlg_z_priority = ($ps3_fade_overlay_z + 100)
		long
	}
	begin
	GetActiveControllers
	is_active_controller = (<active_controllers> [($primary_controller)])
	getcontrollertype controller = ($primary_controller)
	if ((<is_active_controller> = 1) && (<match_type> = <controller_type>))
		break
	endif
	Wait \{5
		gameframes}
	repeat
	destroy_popup_warning_menu
	UnLoadPak \{'pak/ui/controller_disconnect.pak'
		Heap = BottomUpHeap}
	LaunchEvent \{Type = focus
		target = setlist_menu}
	0xae8560b8
endscript

script 0x4982f585 \{text = qs(0x00000000)}
	j = 1
	begin
	RemoveParameter \{controller}
	getplayerinfo <j> controller
	if (<controller> = ($primary_controller))
		getplayerinfo <j> part
		break
	endif
	j = (<j> + 1)
	repeat ($current_num_players)
	if ($vocal_mic_invalid_dist = 0)
		if ((<part> = guitar) || (<part> = bass))
			formatText TextName = text qs(0x2e301f7d) t = <text> j = <j>
		endif
		if (<part> = drum)
			if (($unknown_drum_type) = 1)
				formatText TextName = text qs(0x91d2ab93) t = <text> j = <j>
				usefourlanehighway Player = <j> reset
			else
				getplayerinfo <j> four_lane_highway
				if (<four_lane_highway> = 1)
					formatText TextName = text qs(0x43606ed7) t = <text> j = <j>
				elseif (<four_lane_highway> = 0)
					formatText TextName = text qs(0x35c306d4) t = <text> j = <j>
				else
					formatText TextName = text qs(0x91d2ab93) t = <text> j = <j>
					Change \{unknown_drum_type = 1}
					usefourlanehighway Player = <j> reset
				endif
			endif
		endif
	endif
	if (<part> = vocals)
		getplayerinfo <j> mic_connected
		switch <mic_connected>
			case mic_disconnected
			formatText TextName = text qs(0xa8485a04) t = <text> j = <j>
			case both_disconnected
			formatText TextName = text qs(0x79b97466) t = <text> j = <j>
			case controller_disconnected
			default
			formatText TextName = text qs(0xda0aedbd) t = <text> j = <j>
		endswitch
	endif
	return text = <text>
endscript
