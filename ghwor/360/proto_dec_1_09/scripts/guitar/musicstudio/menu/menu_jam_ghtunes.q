jam_ghtunes_num_results = 14
jam_ghtunes_curr_start_at = 0
jam_ghtunes_max_start_at = 999999999
ghtunes_verified = 0
jam_ghtunes_last_search_text = qs(0x00000000)

script create_jam_ghtunes_menu 
	StartRendering
	SpawnScriptNow \{audio_crowd_silence_front_end
		params = {
			immediate = 1
		}}
	if NOT NetSessionFunc \{func = isoldenoughforonline}
		jam_ghtunes_failed_dialog \{dialog = 2}
		return
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	if NOT NetSessionFunc \{func = can_view_user_content}
		jam_ghtunes_failed_dialog \{dialog = 2}
		return
	endif
	audio_ui_menu_music_off
	if ($ghtunes_verified = 0)
		verifyjamusercontent controller = ($primary_controller)
		Block \{Type = verify_jam_user_content}
		printf \{channel = jam_mode
			qs(0xce0fe9bd)}
		Change \{ghtunes_verified = 1}
	endif
	SpawnScriptNow \{id = ghtunes_spawns
		ghtunes_signin_check}
	if ($ghtunes_killswitch = 1)
		jam_ghtunes_failed_dialog \{dialog = 8}
		return
	endif
	Change \{jam_ghtunes_curr_start_at = 0}
	Change \{jam_ghtunes_max_start_at = 999999999}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = ghtunes_element}
		DestroyScreenElement \{id = ghtunes_element}
	endif
	CreateScreenElement {
		parent = root_window
		id = ghtunes_element
		Type = descinterface
		desc = 'gh_tunes_share'
		exclusive_device = ($primary_controller)
		rot_angle = 0
		loading_alpha = 0
		leaderboard_select_alpha = 1
		watermark_alpha = 0
	}
	ghtunes_element :SetTags \{current_leaderboard_index = 0
		last_genre_searched = 0}
	ghtunes_element :se_setprops \{page_text = qs(0x053599bd)
		item_select_alpha = 0}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 10000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 10000}
	add_user_control_helper \{text = qs(0xb7bb830d)
		button = orange
		z = 10000}
	if is_super_user controller = ($primary_controller)
		add_user_control_helper \{text = qs(0xd5fd99f0)
			z = 10000
			button = pad_left}
	endif
	if ghtunes_element :desc_resolvealias \{Name = jam_user_content_leaderboard}
		AssignAlias id = <resolved_id> alias = ghtunes_leaderboard_menu
		ghtunes_leaderboard_menu :SetProps {exclusive_device = ($primary_controller)
			event_handlers = [{pad_up ghtunes_pad_up}
				{pad_down ghtunes_pad_down}
				{pad_back ghtunes_board_back}
				{pad_option2 ghtunes_previous_page}
				{pad_option ghtunes_next_page}
				{pad_left ghtunes_add_to_showcase}
				{pad_choose ghtunes_pad_choose}
				{pad_L1 ghtunes_show_terms_of_service params = {parent_menu = ghtunes_leaderboard_menu}}
				{pad_start ghtunes_pad_start}
			]
		}
		LaunchEvent \{Type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	if ghtunes_element :desc_resolvealias \{Name = alias_sort_scrolling_menu}
		AssignAlias id = <resolved_id> alias = ghtunes_sort_scrolling_menu
		ghtunes_sort_scrolling_menu :SetProps {exclusive_device = ($primary_controller)
			event_handlers = [
				{pad_back ghtunes_menu_back}
				{pad_up SoundEvent params = {event = audio_ui_ghtunes_scroll}}
				{pad_down SoundEvent params = {event = audio_ui_ghtunes_scroll}}
				{pad_choose ghtunes_choose_leaderboard}
				{pad_L1 ghtunes_show_terms_of_service params = {parent_menu = ghtunes_sort_scrolling_menu}}
			]
		}
		<index> = 0
		begin
		formatText checksumName = op_name 'alias_sort_op%a' a = <index>
		ghtunes_element :desc_resolvealias Name = <op_name>
		AssignAlias id = <resolved_id> alias = <op_name>
		<op_name> :SetProps {event_handlers = [
				{focus ghtunes_focus params = {id = <op_name> index = <index>}}
				{unfocus ghtunes_unfocus params = {id = <op_name> index = <index>}}
			]
		}
		<index> = (<index> + 1)
		repeat 8
		ghtunes_element :desc_resolvealias \{Name = alias_sort_category_bg}
		AssignAlias id = <resolved_id> alias = alias_sort_category_bg
	endif
	SpawnScriptNow \{id = ghtunes_spawns
		ghtunes_add_leaderboard_screen}
	LaunchEvent \{Type = unfocus
		target = ghtunes_leaderboard_menu}
	set_focus_color \{Color = white220}
	set_unfocus_color \{Color = grey64}
	LaunchEvent \{Type = focus
		target = ghtunes_sort_scrolling_menu}
	if GotParam \{straight_to_leaderbrd}
		ghtunes_choose_leaderboard forced_index = <straight_to_leaderbrd> start_at = <start_at>
	endif
endscript

script ghtunes_focus 
	ghtunes_sort_menu_active
	<id> :se_setprops font = fontgrid_text_a3 rgba = [22 26 30 255]
	if GetScreenElementChildren id = <id>
		(<children> [1]) :SetProps alpha = 1
	endif
	ghtunes_element :se_setprops info_text = ($ghtunes_leaderboard [<index>].info_text)
endscript

script ghtunes_unfocus 
	<id> :se_setprops font = fontgrid_text_a3 rgba = [113 121 133 255]
	if GetScreenElementChildren id = <id>
		(<children> [1]) :SetProps alpha = 0 time = 0.1
	endif
endscript

script ghtunes_sort_menu_inactive 
	ghtunes_sort_menu_update_rgba \{rgba = [
			150
			142
			134
			50
		]}
endscript

script ghtunes_sort_menu_active 
	ghtunes_sort_menu_update_rgba \{rgba = [
			113
			121
			133
			255
		]}
endscript

script ghtunes_sort_menu_update_rgba 
	if ghtunes_element :desc_resolvealias \{Name = alias_sort_scrolling_menu
			param = ghtunes_sort_scrolling_menu}
		<index> = 0
		begin
		formatText checksumName = op_name 'alias_sort_op%a' a = <index>
		if ghtunes_element :desc_resolvealias Name = <op_name> param = <op_name>
			<op_name> :se_setprops rgba = <rgba>
		endif
		<index> = (<index> + 1)
		repeat 8
	endif
endscript
ghtunes_leaderboard = [
	{
		leaderboard = user_content_best_songs
		name_text = qs(0x954c3f72)
		icon = alltime_best_icon
		large_icon = all_time_best_lrg
		info_text = qs(0x49c47978)
	}
	{
		leaderboard = user_content_fast_movers
		name_text = qs(0x3cc1eb51)
		icon = rising_star_icon
		large_icon = rising_star_lrg
		info_text = qs(0x05eab971)
	}
	{
		leaderboard = user_content_best_weekly
		name_text = qs(0xb7401e34)
		icon = hot_this_week_icon
		large_icon = hot_this_week_lrg
		info_text = qs(0xcfd5bbee)
	}
	{
		leaderboard = user_content_top_artists
		name_text = qs(0xca45d3c2)
		icon = top_artist_icon
		large_icon = top_artist_lrg
		info_text = qs(0x285bf38d)
	}
	{
		leaderboard = user_content_showcase
		name_text = qs(0xaeaa9380)
		icon = showcase_icon
		large_icon = showcase_lrg
		info_text = qs(0xa3f40b80)
	}
	{
		leaderboard = user_content_recently_added
		name_text = qs(0x279d24a9)
		icon = newest_song_icon
		large_icon = recently_added_lrg
		info_text = qs(0x46df40e8)
	}
	{
		name_text = qs(0xd83650ac)
		icon = browsebygenre_icon
		large_icon = browse_by_genre_lrg
		info_text = qs(0x86e10564)
	}
	{
		name_text = qs(0xa22c24d9)
		icon = search_icon
		large_icon = search_lrg
		info_text = qs(0x18c1601e)
	}
]

script ghtunes_choose_leaderboard 
	clean_up_user_control_helpers
	ghtunes_sort_scrolling_menu :menu_getselectedindex
	if GotParam \{forced_index}
		<selected_index> = (<forced_index>.index)
	endif
	formatText checksumName = op_name 'alias_sort_op%a' a = <selected_index>
	LaunchEvent \{Type = unfocus
		target = ghtunes_sort_scrolling_menu}
	if NOT GotParam \{forced_index}
		ghtunes_sort_menu_inactive
		<op_name> :SetProps rgba = [22 26 30 255]
		if GetScreenElementChildren id = <op_name>
			(<children> [1]) :SetProps alpha = 1
		endif
	endif
	SoundEvent \{event = audio_ui_ghtunes_select}
	<Board> = ($ghtunes_leaderboard [<selected_index>].leaderboard)
	ghtunes_element :SetTags {current_leaderboard_index = <selected_index>}
	if (<selected_index> = 6)
		if GotParam \{forced_index}
			ghtunes_genre_choose index = ($jam_curr_genre_selected) start_at = (<forced_index>.start_at)
			return
		else
			SpawnScriptNow \{ghtunes_create_genre_menu
				id = ghtunes_spawns}
			return
		endif
	endif
	if (<selected_index> = 7)
		if NOT ($jam_ghtunes_last_search_text = qs(0x00000000))
			SpawnScriptNow id = ghtunes_spawns ghtunes_search params = {text = ($jam_ghtunes_last_search_text) search_by = ($ghtunes_curr_search_by)}
		else
			SpawnScriptNow \{ghtunes_create_search_type_menu
				id = ghtunes_spawns}
		endif
		return
	endif
	leaderboard_index = 0
	GetArraySize ($net_user_content_leaderboards)
	begin
	if ($net_user_content_leaderboards [<leaderboard_index>].checksum = <Board>)
		if NOT ($net_user_content_leaderboards [<leaderboard_index>].Active = 1)
			jam_ghtunes_leaderboard_select_failed dialog = 0 leaderboard_name = ($ghtunes_leaderboard [<selected_index>].name_text)
			return
		endif
	endif
	<leaderboard_index> = (<leaderboard_index> + 1)
	repeat <array_Size>
	if (user_content_top_artists = <Board>)
		if NOT ($is_user_content_top_artists_active = 1)
			jam_ghtunes_leaderboard_select_failed dialog = 0 leaderboard_name = ($ghtunes_leaderboard [<selected_index>].name_text)
			return
		endif
	endif
	SpawnScriptNow ghtunes_add_header id = ghtunes_spawns params = {leaderboard_name = ($ghtunes_leaderboard [<selected_index>].name_text) icon = ($ghtunes_leaderboard [<selected_index>].icon) large_icon = ($ghtunes_leaderboard [<selected_index>].large_icon)}
	LaunchEvent \{Type = unfocus
		target = ghtunes_leaderboard_menu}
	ghtunes_element :SetProps \{page_text = qs(0x03ac90f0)}
	ghtunes_clear_leaderboard
	ghtunes_remove_leaderboard_screen
	if GotParam \{forced_index}
		Change jam_ghtunes_curr_start_at = (<forced_index>.start_at)
	else
		Change \{jam_ghtunes_curr_start_at = 0}
	endif
	Change \{jam_ghtunes_max_start_at = 999999999}
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	ghtunes_add_loading_screen
	if NOT (<Board> = user_content_top_artists)
		getjamusercontentstats leaderboard = <Board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
	else
		getjamtopartiststats leaderboard = <Board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
	endif
endscript

script ghtunes_create_genre_menu \{start_at = 0}
	if ghtunes_element :desc_resolvealias \{Name = alias_genre_icon}
		<resolved_id> :se_setprops Scale = 1 Pos = (-79.0, -6.0) rgba = [220 220 220 255]
	endif
	make_generic_menu \{parent = ghtunes_element
		vmenu_id = genre_select_vmenu
		Pos = (425.0, 12.0)
		z_priority = 20
		pad_back_sound = nullscript
		pad_back_script = ghtunes_submenu_back
		pad_down_script = audio_ui_jam_play_ghtunes_scroll_sfx
		pad_up_script = audio_ui_jam_play_ghtunes_scroll_sfx
		no_up_down_sound_handlers
		desc = 'gh_tunes_generic_menu'}
	ghtunes_element :GetTags
	GetArraySize ($jam_genre_list)
	index = <last_genre_searched>
	begin
	add_generic_musicstudio_menu_text_item {
		pad_choose_script = ghtunes_genre_choose
		pad_choose_params = {index = <index> start_at = <start_at>}
		additional_focus_params = {index = <index>}
		pad_choose_sound = audio_null_sound
		text = ($jam_genre_list [<index>].name_text)
	}
	<index> = (<index> + 1)
	if (<index> >= <array_Size>)
		<index> = 0
	endif
	repeat <array_Size>
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	LaunchEvent \{Type = focus
		target = genre_select_vmenu}
endscript
jam_curr_genre_selected = 0

script ghtunes_genre_choose 
	SoundEvent \{event = audio_ui_ghtunes_select}
	if ScreenElementExists \{id = genre_select_vmenu}
		LaunchEvent \{Type = unfocus
			target = genre_select_vmenu}
	endif
	ghtunes_element :SetProps \{page_text = qs(0x03ac90f0)}
	generic_ui_destroy
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	ghtunes_element :SetTags {last_genre_searched = <index>}
	Change jam_curr_genre_selected = <index>
	generic_ui_destroy
	LaunchEvent \{Type = unfocus
		target = ghtunes_sort_scrolling_menu}
	ghtunes_reset_selection
	Change jam_ghtunes_curr_start_at = <start_at>
	Change \{jam_ghtunes_max_start_at = 999999999}
	leaderboard_index = 0
	GetArraySize ($net_user_content_leaderboards)
	begin
	if ($net_user_content_leaderboards [<leaderboard_index>].checksum = ($jam_genre_list [<index>].leaderboard))
		if NOT ($net_user_content_leaderboards [<leaderboard_index>].Active = 1)
			jam_ghtunes_leaderboard_select_failed dialog = 0 leaderboard_name = ($jam_genre_list [<index>].name_text)
			return
		endif
	endif
	<leaderboard_index> = (<leaderboard_index> + 1)
	repeat <array_Size>
	SpawnScriptNow ghtunes_add_header id = ghtunes_spawns params = {leaderboard_name = ($jam_genre_list [<index>].name_text) icon = ($ghtunes_leaderboard [6].icon) large_icon = ($ghtunes_leaderboard [6].large_icon)}
	ghtunes_clear_leaderboard
	ghtunes_remove_leaderboard_screen
	ghtunes_add_loading_screen
	getjamusercontentstats leaderboard = ($jam_genre_list [<index>].leaderboard) start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
endscript

script ghtunes_create_search_type_menu 
	if NOT ($net_user_content_leaderboards [1].Active = 1)
		jam_ghtunes_leaderboard_select_failed dialog = 0 leaderboard_name = ($ghtunes_leaderboard [7].name_text)
		return
	endif
	LaunchEvent \{Type = unfocus
		target = ghtunes_leaderboard_menu}
	LaunchEvent \{Type = unfocus
		target = ghtunes_sort_scrolling_menu}
	if ghtunes_element :desc_resolvealias \{Name = alias_search_icon}
		<resolved_id> :se_setprops Scale = 1 Pos = (-79.0, -6.0) rgba = [220 220 220 255]
	endif
	make_generic_menu \{parent = ghtunes_element
		vmenu_id = search_type_vmenu
		Pos = (425.0, 12.0)
		z_priority = 20
		pad_back_script = ghtunes_submenu_back
		pad_back_sound = nullscript
		pad_down_script = audio_ui_jam_play_ghtunes_scroll_sfx
		pad_up_script = audio_ui_jam_play_ghtunes_scroll_sfx
		no_up_down_sound_handlers
		desc = 'gh_tunes_generic_menu'}
	add_generic_musicstudio_menu_text_item \{pad_choose_sound = musicstudio_ghmix_menu_sound_choose
		pad_choose_script = ghtunes_create_alphasearch_menu
		pad_choose_params = {
			search_by = songname
		}
		text = qs(0x2b4fcbf7)}
	add_generic_musicstudio_menu_text_item \{pad_choose_sound = musicstudio_ghmix_menu_sound_choose
		pad_choose_script = ghtunes_create_alphasearch_menu
		pad_choose_params = {
			search_by = artistname
		}
		text = qs(0x79207762)}
	add_generic_musicstudio_menu_text_item \{pad_choose_sound = musicstudio_ghmix_menu_sound_choose
		pad_choose_script = ghtunes_create_alphasearch_menu
		pad_choose_params = {
			search_by = fileid
		}
		text = qs(0x04b1be47)}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	LaunchEvent \{Type = focus
		target = search_type_vmenu}
	LaunchEvent \{Type = pad_choose}
endscript

script ghtunes_create_alphasearch_menu 
	Change \{jam_ghtunes_max_start_at = 999999999}
	if NOT ($net_user_content_leaderboards [1].Active = 1)
		jam_ghtunes_leaderboard_select_failed dialog = 0 leaderboard_name = ($ghtunes_leaderboard [7].name_text)
		return
	endif
	LaunchEvent \{Type = unfocus
		target = ghtunes_leaderboard_menu}
	LaunchEvent \{Type = unfocus
		target = ghtunes_sort_scrolling_menu}
	if ghtunes_element :desc_resolvealias \{Name = alias_search_icon}
		<resolved_id> :se_setprops Scale = 1 Pos = (-79.0, -6.0) rgba = [220 220 220 255]
	endif
	make_generic_menu \{parent = ghtunes_element
		vmenu_id = text_entry_vmenu
		Pos = (425.0, 12.0)
		z_priority = 20
		pad_back_sound = nullscript
		no_up_down_sound_handlers
		desc = 'gh_tunes_generic_menu'}
	add_generic_musicstudio_menu_text_item \{text = qs(0x3ab6314f)
		heading}
	Change \{num_name_size = 12}
	clean_up_user_control_helpers
	switch <search_by>
		case songname
		text_entry_add_item {
			pad_choose_script = ghtunes_search
			pad_choose_params = {search_by = <search_by>}
			pad_back_script = ghtunes_submenu_back
			font = fontgrid_text_a3
			rgba = [113 121 133 255]
			validity_message = qs(0x49e73e1b)
			linear_flow
		}
		musicsudio_text_entry_helper_text_linear_flow
		case artistname
		text_entry_add_item {
			pad_choose_script = ghtunes_search
			pad_choose_params = {search_by = <search_by>}
			pad_back_script = ghtunes_submenu_back
			font = fontgrid_text_a3
			rgba = [113 121 133 255]
			validity_message = qs(0x49e73e1b)
			linear_flow
			characters_and_limited_symbols
		}
		musicsudio_text_entry_helper_text_linear_flow
		case fileid
		text_entry_add_item {
			pad_choose_script = ghtunes_search
			pad_choose_params = {search_by = <search_by>}
			pad_back_script = ghtunes_submenu_back
			numbers_only
			font = fontgrid_text_a3
			rgba = [113 121 133 255]
			validity_message = qs(0x49e73e1b)
			linear_flow
		}
		ui_number_entry_helper_text
	endswitch
	LaunchEvent \{Type = focus
		target = text_entry_vmenu
		data = {
			child_index = 1
		}}
	LaunchEvent \{Type = pad_choose}
endscript

script ghtunes_submenu_back 
	SoundEvent \{event = audio_ui_ghtunes_back}
	generic_ui_destroy
	Wait \{2
		gameframes}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 10000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 10000}
	add_user_control_helper \{text = qs(0xb7bb830d)
		button = orange
		z = 10000}
	LaunchEvent \{Type = focus
		target = ghtunes_sort_scrolling_menu}
endscript
ghtunes_curr_search_by = NULL

script ghtunes_search 
	Change ghtunes_curr_search_by = <search_by>
	if ScreenElementExists \{id = text_entry_vmenu}
		LaunchEvent \{Type = unfocus
			target = text_entry_vmenu}
	endif
	LaunchEvent \{Type = unfocus
		target = ghtunes_leaderboard_menu}
	ghtunes_element :SetProps \{page_text = qs(0x03ac90f0)}
	generic_ui_destroy
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	Change jam_ghtunes_last_search_text = <text>
	switch <search_by>
		case songname
		title_text = qs(0x47b2a9d3)
		case artistname
		title_text = qs(0xf835e2c6)
		case fileid
		title_text = qs(0xe13b4dfc)
	endswitch
	formatText TextName = title qs(0xe91be69c) a = <title_text> b = <text>
	SpawnScriptNow ghtunes_add_header id = ghtunes_spawns params = {leaderboard_name = <title>}
	ghtunes_clear_leaderboard
	ghtunes_remove_leaderboard_screen
	ghtunes_add_loading_screen
	generic_ui_destroy
	LaunchEvent \{Type = unfocus
		target = ghtunes_sort_scrolling_menu}
	ghtunes_reset_selection
	switch <search_by>
		case songname
		ghtunes_song_name_search text = <text> search_by = <search_by>
		case artistname
		ghtunes_artist_search text = <text> search_by = <search_by>
		case fileid
		ghtunes_file_id_search text = <text> search_by = <search_by>
	endswitch
endscript

script ghtunes_song_name_search 
	searchjamusercontent leaderboard = user_content_title_az num_results = $jam_ghtunes_num_results search_string = <text> search_by = <search_by>
endscript

script ghtunes_file_id_search 
	searchjamusercontent leaderboard = user_content_file_id num_results = $jam_ghtunes_num_results search_string = <text> search_by = <search_by>
endscript

script ghtunes_artist_search 
	searchartiststats leaderboard = user_content_by_artist num_results = $jam_ghtunes_num_results search_string = <text> search_by = <search_by>
endscript

script ghtunes_signin_check 
	begin
	if ($blade_active = 0)
		if NOT CheckForSignIn controller_index = ($primary_controller)
			if isps3
				if ScreenElementExists \{id = ghtunes_element}
					LaunchEvent \{Type = unfocus
						target = ghtunes_element}
				endif
				if ScreenElementExists \{id = ghtunes_leaderboard_menu}
					LaunchEvent \{Type = unfocus
						target = ghtunes_leaderboard_menu}
				endif
				printf \{channel = musicstudio
					qs(0x681a7820)}
				jam_ghtunes_failed_dialog \{dialog = 0}
				return
			endif
			if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
				printf \{channel = musicstudio
					qs(0x43372be3)}
				jam_ghtunes_failed_dialog \{dialog = 3}
				return \{FALSE}
			endif
			if CheckForSignIn local controller_index = ($primary_controller)
				if NetSessionFunc \{func = iscableunplugged}
					if ScreenElementExists \{id = ghtunes_element}
						LaunchEvent \{Type = unfocus
							target = ghtunes_element}
					endif
					if ScreenElementExists \{id = ghtunes_leaderboard_menu}
						LaunchEvent \{Type = unfocus
							target = ghtunes_leaderboard_menu}
					endif
					printf \{channel = musicstudio
						qs(0x5a2c1aa2)}
					jam_ghtunes_failed_dialog \{dialog = 3}
					return
				endif
			else
				if ScreenElementExists \{id = ghtunes_element}
					LaunchEvent \{Type = unfocus
						target = ghtunes_element}
				endif
				if ScreenElementExists \{id = ghtunes_leaderboard_menu}
					LaunchEvent \{Type = unfocus
						target = ghtunes_leaderboard_menu}
				endif
				printf \{channel = musicstudio
					qs(0x156d8c65)}
				jam_ghtunes_failed_dialog \{dialog = 4}
				return
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ghtunes_signin_check_unspawned 
	NetSessionFunc \{func = stats_init}
	if NetSessionFunc \{func = iscableunplugged}
		printf \{channel = musicstudio
			qs(0x398095f2)}
		jam_ghtunes_failed_dialog \{dialog = 3}
		return
	endif
	if NOT CheckForSignIn controller_index = ($primary_controller)
		if isps3
			if ScreenElementExists \{id = ghtunes_element}
				LaunchEvent \{Type = unfocus
					target = ghtunes_element}
			endif
			if ScreenElementExists \{id = ghtunes_leaderboard_menu}
				LaunchEvent \{Type = unfocus
					target = ghtunes_leaderboard_menu}
			endif
			printf \{channel = musicstudio
				qs(0x12adc631)}
			jam_ghtunes_failed_dialog \{dialog = 0}
			return
		endif
		if NOT CheckForSignIn network_platform_only controller_index = ($primary_controller)
			printf \{'not connected to platform'
				channel = jrdebug}
			printf \{channel = musicstudio
				qs(0x0bb6f770)}
			jam_ghtunes_failed_dialog \{dialog = 3}
			return \{FALSE}
		endif
		if CheckForSignIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = iscableunplugged}
				if ScreenElementExists \{id = song_preview_element}
					LaunchEvent \{Type = unfocus
						target = song_preview_element}
				endif
				printf \{channel = musicstudio
					qs(0x44f761b7)}
				jam_ghtunes_failed_dialog \{dialog = 3}
				return \{FALSE}
			endif
		else
			if ScreenElementExists \{id = song_preview_element}
				LaunchEvent \{Type = unfocus
					target = song_preview_element}
			endif
			printf \{channel = musicstudio
				qs(0x5dec50f6)}
			jam_ghtunes_failed_dialog \{dialog = 4}
			return \{FALSE}
		endif
	endif
	if isxenonorwindx
		if NetSessionFunc \{func = xenonisguest}
			printf \{channel = musicstudio
				qs(0x76c10335)}
			jam_ghtunes_failed_dialog \{dialog = 9}
			return \{FALSE}
		endif
	endif
	if NOT NetSessionFunc \{func = is_ghtunes_lobby_available}
		Wait \{1
			gameframe}
		show_ghtunes_connecting_popup
		<timeout> = 35.0
		ResetTimer
		begin
		if NetSessionFunc \{func = is_ghtunes_lobby_available}
			destroy_dialog_box
			break
		else
			if (<is_connecting> = 0)
				if (<failed_get_server_list> = 0)
					if NetSessionFunc \{func = iscableunplugged}
						printf \{channel = musicstudio
							qs(0x6fda3274)}
						jam_ghtunes_failed_dialog \{dialog = 3}
					else
						printf \{channel = musicstudio
							qs(0xe8422ebb)}
						jam_ghtunes_failed_dialog \{dialog = 8}
					endif
					printf \{channel = musicstudio
						qs(0xe8422ebb)}
					jam_ghtunes_failed_dialog \{dialog = 8}
				else
					destroy_dialog_box
					printf \{channel = musicstudio
						qs(0xf1591ffa)}
					jam_ghtunes_failed_dialog \{dialog = 5}
				endif
				return
			endif
		endif
		if TimeGreaterThan <timeout>
			destroy_dialog_box
			printf \{channel = musicstudio
				qs(0x79a9eb87)}
			jam_ghtunes_failed_dialog \{dialog = 8}
			return
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	return \{true}
endscript

script ghtunes_pad_up 
	Wait \{1
		gameframe}
	SoundEvent \{event = audio_ui_ghtunes_scroll}
	ghtunes_leaderboard_menu :menu_getselectedindex
	ghtunes_element :SetProps item_select_pos = ((102.0, 207.0) + ((0.0, 31.75) * <selected_index>))
	printf channel = jam_publish qs(0x88ca9ef1) s = <selected_index>
endscript

script ghtunes_pad_down 
	Wait \{1
		gameframe}
	SoundEvent \{event = audio_ui_ghtunes_scroll}
	ghtunes_leaderboard_menu :menu_getselectedindex
	ghtunes_element :SetProps item_select_pos = ((102.0, 207.0) + ((0.0, 31.75) * <selected_index>))
	printf channel = jam_publish qs(0xa8cb3393) s = <selected_index>
endscript

script ghtunes_reset_selection 
	ghtunes_element :SetProps \{item_select_pos = (102.0, 207.0)}
endscript

script ghtunes_view_user_content 
	if GotParam \{selected_index}
		if (($ghtunes_curr_content_array [<selected_index>].has_content) = 0)
			return
		endif
	endif
	if ScreenElementExists \{id = song_preview_element}
		LaunchEvent \{Type = unfocus
			target = song_preview_element}
	else
		LaunchEvent \{Type = unfocus
			target = ghtunes_sort_scrolling_menu}
		LaunchEvent \{Type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	if GotParam \{selected_index}
		user_id = ($ghtunes_curr_content_array [<selected_index>].user_id)
		user_name = ($ghtunes_curr_content_array [<selected_index>].user_name)
	endif
	destroy_jam_ghtunes_menu
	jam_upload_song_dialog \{ghtunes = 1
		dialog = 3}
	getjamusercontentlist user_id = <user_id>
	Block \{Type = get_jam_user_content_list}
	if (<event_data>.failed = 1)
		jam_upload_song_failed \{dialog = 18}
	else
		slot_array = $jam_curr_slot_array
		StopRendering
		if ui_event_exists_in_stack \{Name = 'jam_download_slot'}
			ui_sfx \{menustate = ghtunes
				uitype = select}
			generic_event_back state = uistate_jam_download_slot data = {slot_array = <slot_array> board_index = <board_index> start_at = ($jam_ghtunes_curr_start_at) user_name = <user_name> user_id = <user_id>}
		else
			ui_sfx \{menustate = ghtunes
				uitype = select}
			generic_event_choose state = uistate_jam_download_slot data = {slot_array = <slot_array> board_index = <board_index> start_at = ($jam_ghtunes_curr_start_at) user_name = <user_name> user_id = <user_id>}
		endif
		jam_upload_song_dialog_destroy
	endif
endscript

script ghtunes_pad_choose 
	if ScreenElementExists \{id = ghtunes_leaderboard_menu}
		ghtunes_leaderboard_menu :menu_getselectedindex
	endif
	if GotParam \{selected_index}
		if (($ghtunes_curr_content_array [<selected_index>].has_content) = 0)
			return
		endif
	endif
	if ScreenElementExists \{id = ghtunes_element}
		LaunchEvent \{Type = unfocus
			target = ghtunes_element}
	endif
	if ScreenElementExists \{id = ghtunes_leaderboard_menu}
		LaunchEvent \{Type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	if ScreenElementExists \{id = ghtunes_element}
		ghtunes_element :GetTags
	endif
	artist_board_download = 0
	if GotParam \{file_id}
		<artist_board_download> = 1
	endif
	Board = nullchecksum
	if NOT (<artist_board_download> = 1)
		if (<current_leaderboard_index> = 7)
			switch ($ghtunes_curr_search_by)
				case songname
				Board = user_content_title_az
				case artistname
				Board = user_content_by_artist
				case fileid
				Board = user_content_file_id
			endswitch
		else
			<Board> = ($ghtunes_leaderboard [<current_leaderboard_index>].leaderboard)
		endif
		if (<Board> = user_content_top_artists || <Board> = user_content_by_artist)
			ghtunes_leaderboard_menu :menu_getselectedindex
			ghtunes_view_user_content selected_index = <selected_index> board_index = <current_leaderboard_index>
			return
		endif
	endif
	if GotParam \{board_index}
		current_leaderboard_index = <board_index>
	endif
	KillSpawnedScript \{Name = ghtunes_signin_check}
	Wait \{1
		gameframe}
	SoundEvent \{event = audio_ui_ghtunes_select}
	jam_get_num_songs
	if (<downloaded_song_count> >= ($jam_max_downloaded_songs))
		jam_ghtunes_download_failed_dialog dialog = 0 start_at = ($jam_ghtunes_curr_start_at) board_index = <current_leaderboard_index>
		return
	endif
	if NOT (<artist_board_download> = 1)
		ghtunes_leaderboard_menu :menu_getselectedindex
		if ($ghtunes_curr_content_array [<selected_index>].file_id = 0)
			return
		endif
		file_id = ($ghtunes_curr_content_array [<selected_index>].file_id)
		FileName = ($ghtunes_curr_content_array [<selected_index>].FileName)
		LaunchEvent \{Type = unfocus
			target = ghtunes_element}
		LaunchEvent \{Type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	clean_up_user_control_helpers
	jam_upload_song_dialog \{ghtunes = 1
		dialog = 2}
	jam_recording_create_editable_arrays
	clearcustomsong
	pushunsafeforshutdown \{context = ghtunes_download}
	musicstudio_initialize_empty_song FileName = <FileName>
	getjamusercontent controller = ($primary_controller) file_id = <file_id>
	Block \{Type = get_jam_user_content}
	if (<event_data>.failed = 0)
		setsonginfo \{song_version = $jam_song_version
			downloaded = 1}
		musicstudio_initialize_song
		destroy_jam_ghtunes_menu
		formatText TextName = title_text qs(0x73307931) s = <FileName>
		jam_upload_song_dialog_destroy
		if NOT GotParam \{user_name}
			user_name = ''
			if GotParam \{selected_index}
				<user_id> = ($ghtunes_curr_content_array [<selected_index>].user_id)
				<user_name> = ($ghtunes_curr_content_array [<selected_index>].user_name)
			endif
		endif
		formatText TextName = artist qs(0x73307931) s = <user_name>
		setsonginfo artist = <artist>
		if NOT (<artist_board_download> = 1)
			create_song_preview_menu {
				FileName = <title_text>
				board_index = <current_leaderboard_index>
				start_at = ($jam_ghtunes_curr_start_at)
				ghtunes = 1 file_id = <file_id>
				num_ratings = ($ghtunes_curr_content_array [<selected_index>].num_ratings)
				selected_index = <selected_index>
				user_id = <user_id>
				user_name = <user_name>
			}
		else
			create_song_preview_menu {
				FileName = <title_text>
				board_index = <board_index>
				start_at = ($jam_ghtunes_curr_start_at)
				ghtunes = 1
				file_id = <file_id>
				num_ratings = <num_ratings>
				user_id = <user_id>
				user_name = <user_name>
			}
		endif
	else
		jamsession_unload \{song_prefix = 'editable'}
		clearcustomsong
		if ScreenElementExists \{id = ghtunes_element}
			ghtunes_element :SetProps \{rot_angle = 0
				time = 0}
		endif
		jam_ghtunes_download_failed_dialog dialog = 4 start_at = ($jam_ghtunes_curr_start_at) board_index = <current_leaderboard_index>
	endif
	popunsafeforshutdown \{context = ghtunes_download}
endscript

script ghtunes_pad_start 
	if isxenonorwindx
		ghtunes_leaderboard_menu :menu_getselectedindex
		user_id = ($ghtunes_curr_content_array [<selected_index>].user_id)
		if GotParam \{user_id}
			if NOT (<user_id> = 0)
				NetSessionFunc func = showGamerCard params = {player_xuid = (<user_id>.user_id)}
			endif
		endif
	endif
endscript

script getjamusercontent_callback 
	printf \{channel = jam_publish
		qs(0xe9ac6c70)}
	broadcastevent \{Type = get_jam_user_content
		data = {
			failed = 0
		}}
endscript

script getjamusercontent_failed_callback 
	printf \{channel = jam_publish
		qs(0xe9ac6c70)}
	broadcastevent \{Type = get_jam_user_content
		data = {
			failed = 1
		}}
endscript

script verifyjamusercontent_callback 
	printf \{channel = jam_publish
		qs(0x61d4bb2f)}
	broadcastevent \{Type = verify_jam_user_content}
endscript

script jam_get_primary_user_id 
	NetSessionFunc func = get_user_id params = {controller_index = ($primary_controller)}
	return primary_user_id = <user_id>
endscript

script jam_ghtunes_download_failed_dialog \{dialog = 0}
	if ScreenElementExists \{id = ghtunes_element}
		LaunchEvent \{Type = unfocus
			target = ghtunes_element}
		LaunchEvent \{Type = unfocus
			target = ghtunes_leaderboard_menu}
	else
		destroy_generic_menu
	endif
	SoundEvent \{event = audio_ui_generic_warning}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		formatText \{TextName = dialog
			qs(0x0109fc56)
			s = $jam_max_downloaded_songs}
		case 1
		formatText \{TextName = dialog
			qs(0xacca433f)}
		case 2
		formatText \{TextName = dialog
			qs(0x3715e6b2)}
		case 4
		formatText \{TextName = dialog
			qs(0xacc49b79)}
		case 5
		formatText \{TextName = dialog
			qs(0x974b2093)}
		case 6
		formatText \{TextName = dialog
			qs(0x2f9628dc)}
	endswitch
	destroy_dialog_box
	create_dialog_box {
		heading_text = qs(0x5c49397b)
		body_text = <dialog>
		options = [
			{
				func = jam_ghtunes_download_failed_go_back
				func_params = {<...>}
				text = qs(0x320a8d1c)
			}
		]
	}
endscript

script jam_ghtunes_download_failed_go_back 
	destroy_dialog_box
	destroy_generic_menu
	ui_event event = menu_back state = uistate_jam_ghtunes data = {straight_to_leaderbrd = {index = <board_index> start_at = <start_at>}}
endscript

script jam_ghtunes_leaderboard_select_failed \{dialog = 0}
	LaunchEvent \{Type = unfocus
		target = ghtunes_element}
	LaunchEvent \{Type = unfocus
		target = ghtunes_leaderboard_menu}
	LaunchEvent \{Type = unfocus
		target = ghtunes_sort_scrolling_menu}
	SoundEvent \{event = audio_ui_generic_warning}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		formatText TextName = dialog qs(0x412090bd) a = <leaderboard_name>
	endswitch
	destroy_dialog_box
	create_dialog_box {
		heading_text = qs(0x05f6e0d2)
		body_text = <dialog>
		options = [
			{
				func = jam_ghtunes_leaderboard_select_failed_back
				text = qs(0x320a8d1c)
			}
		]
	}
endscript

script jam_ghtunes_leaderboard_select_failed_back 
	destroy_dialog_box
	ghtunes_board_back
endscript
ghtunes_rating_for_5star = 8.6
ghtunes_curr_content_array = [
]

script getjamusercontentstats_callback 
	Wait \{2
		Seconds}
	if NOT ScreenElementExists \{id = ghtunes_element}
		return
	endif
	if NOT ScreenElementExists \{id = ghtunes_leaderboard_menu}
		return
	endif
	if ScreenElementExists \{id = dialog_box_container}
		return
	endif
	ghtunes_element :se_setprops \{stats_heading_alpha = 1
		top_artist_heading_alpha = 0}
	printf \{channel = jam_publish
		qs(0x75ff3b6c)}
	is_showcase = 0
	ghtunes_element :GetSingleTag \{current_leaderboard_index}
	if (<current_leaderboard_index> = 4)
		<is_showcase> = 1
	endif
	if (<current_leaderboard_index> = 7)
		if StructureContains structure = (<content_array> [0]) Name = rank
			Change jam_ghtunes_curr_start_at = (<content_array> [0].rank [1])
		else
			Change \{jam_ghtunes_curr_start_at = 0}
		endif
	endif
	printf \{qs(0x048672f6)}
	Change ghtunes_curr_content_array = <content_array>
	last_item = 0
	empty = 0
	ghtunes_element :SetTags \{empty = 0}
	if ghtunes_element :desc_resolvealias \{Name = jam_user_content_leaderboard}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			results_array_size = <array_Size>
			if NOT (<results_array_size> = 0)
				i = 0
				begin
				has_content = 0
				if ((<content_array> [<i>].has_content) = 1)
					formatText TextName = title_text qs(0x73307931) s = (<content_array> [<i>].FileName)
					(<children> [<i>]) :SetProps title_text = <title_text>
					formatText TextName = number_text qs(0x73307931) s = (<i> + 1 + ($jam_ghtunes_num_results * ($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results)))
					(<children> [<i>]) :SetProps number_text = <number_text>
					<rating> = (<content_array> [<i>].rating)
					if (<rating> >= ($ghtunes_rating_for_5star) || <is_showcase> = 1)
						(<children> [<i>]) :SetProps stars_texture = five_star_full five_star_full_rgba = [255 255 255 255] five_star_off_alpha = 1 five_star_full_alpha = 1 star_clip_dims = (132 * (1.0, 0.0) + (0.0, 25.0))
						(<children> [<i>]) :Obj_KillSpawnedScript Name = ghtunes_animate_5stars
						(<children> [<i>]) :obj_spawnscript ghtunes_animate_5stars params = {id = (<children> [<i>])}
					else
						<new_x_dims> = ((<rating> / 9.0) * 132)
						(<children> [<i>]) :Obj_KillSpawnedScript Name = ghtunes_animate_5stars
						(<children> [<i>]) :SetProps stars_texture = five_star_full five_star_full_rgba = [255 255 255 255] five_star_off_alpha = 1 five_star_full_alpha = 1 star_clip_dims = (<new_x_dims> * (1.0, 0.0) + (0.0, 25.0))
					endif
					formatText TextName = user_text qs(0x73307931) s = (<content_array> [<i>].user_name)
					(<children> [<i>]) :SetProps user_id_text = <user_text>
					GetArraySize \{$jam_genre_list}
					genre_count = 0
					genre_text = qs(0x00000000)
					begin
					printf channel = jam_mode qs(0xe8173fbb) s = ($jam_genre_list [<genre_count>].checksum) a = (<content_array> [<i>].genre)
					if (($jam_genre_list [<genre_count>].checksum) = (<content_array> [<i>].genre))
						genre_text = ($jam_genre_list [<genre_count>].abrev_text)
						break
					endif
					<genre_count> = (<genre_count> + 1)
					repeat <array_Size>
					(<children> [<i>]) :SetProps genre_text = <genre_text>
					printf qs(0x1fb2b34e) i = <i> a = (((<content_array> [<i>]).file_id).file_id [1]) b = <title_text> c = <user_text> d = <genre_text>
				else
					if (<i> = 0)
						if ($jam_ghtunes_curr_start_at = 0)
							<empty> = 1
							ghtunes_element :SetTags \{empty = 1}
						endif
						formatText TextName = title_text qs(0x98ac3725) s = (<content_array> [<i>].FileName)
						(<children> [<i>]) :SetProps title_text = <title_text>
					endif
					if (<last_item> = 0)
						Change jam_ghtunes_max_start_at = ($jam_ghtunes_curr_start_at + <i>)
						<last_item> = 1
					endif
				endif
				(<children> [<i>]) :se_setprops {
					event_handlers = [
						{focus ghtunes_focus_leaderboard_item params = {id = (<children> [<i>]) index = <i>}}
						{unfocus ghtunes_unfocus_leaderboard_item params = {id = (<children> [<i>]) index = <i>}}
					]
					replace_handlers
				}
				i = (<i> + 1)
				repeat <results_array_size>
			endif
		endif
	endif
	printf \{qs(0x048672f6)}
	LaunchEvent \{Type = focus
		target = ghtunes_leaderboard_menu
		data = {
			child_index = 0
		}}
	ghtunes_reset_selection
	formatText TextName = page_text qs(0x85daac1b) s = (($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1)
	clean_up_user_control_helpers
	if NOT (<empty> = 1)
		add_user_control_helper \{text = qs(0x43b287ab)
			button = green
			z = 10000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 10000}
		if ((($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1) > 1)
			add_user_control_helper \{text = qs(0xa42bd569)
				button = yellow
				z = 10000}
		endif
		if (($jam_ghtunes_curr_start_at + $jam_ghtunes_num_results) < $jam_ghtunes_max_start_at)
			add_user_control_helper \{text = qs(0x2931d48b)
				button = blue
				z = 10000}
		endif
		if is_super_user controller = ($primary_controller)
			add_user_control_helper \{text = qs(0xaeaa9380)
				button = pad_left
				z = 10000}
		endif
		add_user_control_helper \{text = qs(0xb7bb830d)
			button = orange
			z = 10000}
		if isxenonorwindx
			add_user_control_helper \{text = qs(0x9a7d1fe5)
				button = start
				z = 10000}
		endif
	else
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 10000}
		add_user_control_helper \{text = qs(0xb7bb830d)
			button = orange
			z = 10000}
	endif
	ghtunes_element :SetProps page_text = <page_text>
	ghtunes_element :SetProps \{item_select_alpha = 10000}
	ghtunes_remove_loading_screen
endscript

script ghtunes_focus_leaderboard_item 
	<id> :se_setprops focus_rgba = [113 121 133 255] text_rgba = [22 26 30 255]
endscript

script ghtunes_unfocus_leaderboard_item 
	<id> :se_setprops focus_rgba = [113 121 133 0] text_rgba = [113 121 133 255]
endscript

script getjamtopartiststats_callback 
	Wait \{2
		Seconds}
	if NOT ScreenElementExists \{id = ghtunes_element}
		return
	endif
	if NOT ScreenElementExists \{id = ghtunes_leaderboard_menu}
		return
	endif
	ghtunes_element :se_setprops \{stats_heading_alpha = 0
		top_artist_heading_alpha = 1}
	LaunchEvent \{Type = focus
		target = ghtunes_leaderboard_menu
		data = {
			child_index = 0
		}}
	ghtunes_reset_selection
	printf \{channel = jam_publish
		qs(0xf0b74a6e)}
	Change ghtunes_curr_content_array = <content_array>
	last_item = 0
	empty = 0
	ghtunes_element :SetTags \{empty = 0}
	if ghtunes_element :desc_resolvealias \{Name = jam_user_content_leaderboard}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			results_array_size = <array_Size>
			if NOT (<results_array_size> = 0)
				i = 0
				begin
				has_content = 0
				if ((<content_array> [<i>].has_content) = 1)
					formatText TextName = artist_text qs(0x73307931) s = (<content_array> [<i>].user_name)
					(<children> [<i>]) :SetProps title_text = <artist_text>
					formatText TextName = number_text qs(0x73307931) s = (<i> + 1 + ($jam_ghtunes_num_results * ($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results)))
					(<children> [<i>]) :SetProps number_text = <number_text>
				else
					if (<i> = 0)
						if ($jam_ghtunes_curr_start_at = 0)
							<empty> = 1
							ghtunes_element :SetTags \{empty = 1}
						endif
						formatText TextName = title_text qs(0x98ac3725) s = (<content_array> [<i>].FileName)
						(<children> [<i>]) :SetProps title_text = <title_text>
					endif
					if (<last_item> = 0)
						Change jam_ghtunes_max_start_at = ($jam_ghtunes_curr_start_at + <i>)
						<last_item> = 1
					endif
				endif
				(<children> [<i>]) :se_setprops {
					event_handlers = [
						{focus ghtunes_focus_leaderboard_item params = {id = (<children> [<i>]) index = <i>}}
						{unfocus ghtunes_unfocus_leaderboard_item params = {id = (<children> [<i>]) index = <i>}}
					]
					replace_handlers
				}
				i = (<i> + 1)
				repeat <results_array_size>
			endif
			LaunchEvent Type = focus target = (<children> [0]) data = {child_index = 0}
		endif
	endif
	formatText TextName = page_text qs(0x85daac1b) s = (($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1)
	clean_up_user_control_helpers
	if NOT (<empty> = 1)
		add_user_control_helper \{text = qs(0x9c6459c5)
			button = green
			z = 10000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
		if ((($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1) > 1)
			add_user_control_helper \{text = qs(0xa42bd569)
				button = yellow
				z = 10000}
		endif
		if (($jam_ghtunes_curr_start_at + $jam_ghtunes_num_results) < $jam_ghtunes_max_start_at)
			add_user_control_helper \{text = qs(0x2931d48b)
				button = blue
				z = 10000}
		endif
		if is_super_user controller = ($primary_controller)
			add_user_control_helper \{text = qs(0xaeaa9380)
				button = pad_left
				z = 10000}
		endif
		add_user_control_helper \{text = qs(0xb7bb830d)
			button = orange
			z = 10000}
		if isxenonorwindx
			add_user_control_helper \{text = qs(0x9a7d1fe5)
				button = start
				z = 10000}
		endif
	else
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
		add_user_control_helper \{text = qs(0xb7bb830d)
			button = orange
			z = 10000}
	endif
	ghtunes_element :SetProps page_text = <page_text>
	ghtunes_element :SetProps \{item_select_alpha = 10000}
	ghtunes_remove_loading_screen
endscript

script ghtunes_animate_5stars 
	begin
	GetRandomValue \{Name = glow_time
		a = 0.7
		b = 1.0}
	if ScreenElementExists id = <id>
		<id> :se_setprops five_star_full_scale = 1 five_star_full_rgba = [255 255 255 255] time = <glow_time>
		<id> :se_waitprops
	else
		break
	endif
	GetRandomValue \{Name = glow_time
		a = 0.7
		b = 1.0}
	if ScreenElementExists id = <id>
		<id> :se_setprops five_star_full_scale = 1.02 five_star_full_rgba = [255 252 100 255] time = <glow_time>
		<id> :se_waitprops
	else
		break
	endif
	repeat
endscript

script getjamusercontentstats_failed_callback 
	Wait \{2
		Seconds}
	jam_upload_song_dialog_destroy
	if ScreenElementExists \{id = ghtunes_element}
		LaunchEvent \{Type = unfocus
			target = ghtunes_element}
	endif
	if ScreenElementExists \{id = ghtunes_element}
		LaunchEvent \{Type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	jam_ghtunes_failed_dialog \{dialog = 3}
endscript

script ghtunes_next_page 
	if NOT (($jam_ghtunes_curr_start_at + $jam_ghtunes_num_results) < $jam_ghtunes_max_start_at)
		return
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	if ScriptIsRunning \{ghtunes_spam_lock}
		return
	else
		SpawnScriptNow \{ghtunes_spam_lock
			id = ghtunes_spawns}
	endif
	if ($jam_ghtunes_curr_start_at = 0)
		Change jam_ghtunes_curr_start_at = ($jam_ghtunes_num_results + 1)
	else
		Change jam_ghtunes_curr_start_at = ($jam_ghtunes_curr_start_at + $jam_ghtunes_num_results)
	endif
	if ($jam_ghtunes_curr_start_at > $jam_ghtunes_max_start_at)
		Change jam_ghtunes_curr_start_at = ($jam_ghtunes_curr_start_at - $jam_ghtunes_num_results)
		return
	endif
	SoundEvent \{event = audio_ui_ghtunes_select}
	ghtunes_clear_leaderboard
	LaunchEvent \{Type = unfocus
		target = ghtunes_element}
	LaunchEvent \{Type = unfocus
		target = ghtunes_leaderboard_menu}
	ghtunes_element :SetProps \{page_text = qs(0x03ac90f0)}
	ghtunes_element :SetProps \{item_select_alpha = 0}
	ghtunes_reset_selection
	ghtunes_add_loading_screen
	ghtunes_element :GetTags
	if NOT GotParam \{current_leaderboard_index}
		current_leaderboard_index = 0
	endif
	Board = nullchecksum
	if (<current_leaderboard_index> = 7)
		switch ($ghtunes_curr_search_by)
			case songname
			Board = user_content_title_az
			case artistname
			Board = user_content_by_artist
			case fileid
			Board = user_content_file_id
		endswitch
	else
		<Board> = ($ghtunes_leaderboard [<current_leaderboard_index>].leaderboard)
	endif
	if (<Board> = user_content_top_artists || <Board> = user_content_by_artist)
		getjamtopartiststats leaderboard = <Board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
	else
		if (<current_leaderboard_index> = 6)
			getjamusercontentstats leaderboard = ($jam_genre_list [<last_genre_searched>].leaderboard) start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
		else
			getjamusercontentstats leaderboard = <Board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
		endif
	endif
	printf channel = jam_publish qs(0xf713abb9) s = (($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1)
endscript

script ghtunes_previous_page 
	if NOT ((($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1) > 1)
		return
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	if ScriptIsRunning \{ghtunes_spam_lock}
		return
	else
		SpawnScriptNow \{ghtunes_spam_lock
			id = ghtunes_spawns}
	endif
	Change jam_ghtunes_curr_start_at = ($jam_ghtunes_curr_start_at - $jam_ghtunes_num_results)
	if ($jam_ghtunes_curr_start_at < 0)
		Change \{jam_ghtunes_curr_start_at = 0}
		return
	endif
	SoundEvent \{event = audio_ui_ghtunes_back}
	ghtunes_clear_leaderboard
	LaunchEvent \{Type = unfocus
		target = ghtunes_element}
	LaunchEvent \{Type = unfocus
		target = ghtunes_leaderboard_menu}
	ghtunes_element :SetProps \{page_text = qs(0x03ac90f0)}
	ghtunes_element :SetProps \{item_select_alpha = 0}
	ghtunes_reset_selection
	ghtunes_add_loading_screen
	ghtunes_element :GetTags
	if NOT GotParam \{current_leaderboard_index}
		current_leaderboard_index = 0
	endif
	Board = nullchecksum
	if (<current_leaderboard_index> = 7)
		switch ($ghtunes_curr_search_by)
			case songname
			Board = user_content_title_az
			case artistname
			Board = user_content_by_artist
			case fileid
			Board = user_content_file_id
		endswitch
	else
		<Board> = ($ghtunes_leaderboard [<current_leaderboard_index>].leaderboard)
	endif
	if (<Board> = user_content_top_artists || <Board> = user_content_by_artist)
		getjamtopartiststats leaderboard = <Board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
	else
		if (<current_leaderboard_index> = 6)
			getjamusercontentstats leaderboard = ($jam_genre_list [<last_genre_searched>].leaderboard) start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
		else
			getjamusercontentstats leaderboard = <Board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
		endif
	endif
	printf channel = jam_publish qs(0xe06c49fe) s = (($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1)
endscript

script ghtunes_add_to_showcase 
	if is_super_user controller = ($primary_controller)
		ghtunes_add_to_showcase_check
		return
	else
		return
	endif
endscript

script ghtunes_add_to_showcase_check 
	current_leaderboard_index = 0
	if ScreenElementExists \{id = ghtunes_element}
		ghtunes_element :GetTags
		if (<current_leaderboard_index> = 3)
			return
		endif
	endif
	ghtunes_leaderboard_menu :menu_getselectedindex
	formatText TextName = dialog qs(0xd3b930b2) s = ($ghtunes_curr_content_array [<selected_index>].FileName)
	destroy_dialog_box
	clean_up_user_control_helpers
	create_dialog_box {
		heading_text = qs(0xd5fd99f0)
		body_text = <dialog>
		options = [
			{
				func = ghtunes_add_to_showcase_go_back
				func_params = {selected_index = <selected_index>}
				text = qs(0x320a8d1c)
			}
			{
				func = ghtunes_add_to_showcase_confirm
				func_params = {selected_index = <selected_index>}
				text = qs(0x182f0173)
			}
		]
	}
	LaunchEvent \{Type = unfocus
		target = ghtunes_element}
	LaunchEvent \{Type = unfocus
		target = ghtunes_leaderboard_menu}
	SoundEvent \{event = audio_ui_generic_warning}
endscript

script ghtunes_add_to_showcase_success 
	destroy_dialog_box
	clean_up_user_control_helpers
	create_dialog_box {
		heading_text = qs(0xd5fd99f0)
		body_text = qs(0x85c3fab3)
		options = [
			{
				func = ghtunes_add_to_showcase_go_back
				func_params = {selected_index = <selected_index>}
				text = qs(0x320a8d1c)
			}
		]
	}
	LaunchEvent \{Type = unfocus
		target = ghtunes_element}
	LaunchEvent \{Type = unfocus
		target = ghtunes_leaderboard_menu}
	SoundEvent \{event = audio_ui_generic_warning}
endscript

script ghtunes_add_to_showcase_confirm 
	if (($ghtunes_curr_content_array [<selected_index>].file_id) = 0)
		return
	endif
	addtoshowcase controller = ($primary_controller) file_id = ($ghtunes_curr_content_array [<selected_index>].file_id)
	Block \{Type = add_to_showcase}
	ghtunes_add_to_showcase_success
endscript

script ghtunes_add_to_showcase_go_back 
	current_leaderboard_index = 0
	if ScreenElementExists \{id = ghtunes_element}
		ghtunes_element :GetTags
	endif
	jam_ghtunes_download_failed_go_back start_at = ($jam_ghtunes_curr_start_at) board_index = <current_leaderboard_index>
endscript

script addtoshowcase_callback 
	printf \{channel = jam_mode
		qs(0xce7010a8)}
	broadcastevent \{Type = add_to_showcase}
endscript

script ghtunes_spam_lock \{time = 1}
	Wait <time> Seconds
endscript

script ghtunes_clear_leaderboard 
	if ghtunes_element :desc_resolvealias \{Name = jam_user_content_leaderboard}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			if NOT (<array_Size> = 0)
				i = 0
				begin
				(<children> [<i>]) :SetProps number_text = qs(0x00000000)
				(<children> [<i>]) :SetProps title_text = qs(0x00000000)
				(<children> [<i>]) :SetProps rating_text = qs(0x00000000)
				(<children> [<i>]) :SetProps user_id_text = qs(0x00000000)
				(<children> [<i>]) :SetProps genre_text = qs(0x00000000)
				(<children> [<i>]) :SetProps five_star_off_alpha = 0 five_star_full_alpha = 0
				i = (<i> + 1)
				repeat <array_Size>
			endif
		endif
		ghtunes_reset_selection
	endif
endscript

script ghtunes_board_back 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 10000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 10000}
	add_user_control_helper \{text = qs(0xb7bb830d)
		button = orange
		z = 10000}
	SoundEvent \{event = audio_ui_ghtunes_back}
	LaunchEvent \{Type = unfocus
		target = ghtunes_leaderboard_menu}
	set_focus_color \{Color = white220}
	set_unfocus_color \{Color = grey64}
	LaunchEvent \{Type = focus
		target = ghtunes_sort_scrolling_menu}
	Change \{jam_ghtunes_last_search_text = qs(0x00000000)}
	ghtunes_reset_selection
	ghtunes_add_leaderboard_screen
endscript

script ghtunes_menu_back \{dialog = 0}
	destroy_dialog_box
	SoundEvent \{event = audio_ui_ghtunes_back}
	if (<dialog> = 1)
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 10000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 10000}
		add_user_control_helper \{text = qs(0xb7bb830d)
			button = orange
			z = 10000}
		set_focus_color \{Color = white220}
		set_unfocus_color \{Color = grey64}
		LaunchEvent \{Type = focus
			target = ghtunes_sort_scrolling_menu}
		ghtunes_remove_loading_screen
		ghtunes_add_leaderboard_screen
	else
		if ScreenElementExists \{id = ghtunes_element}
			LaunchEvent \{Type = unfocus
				target = ghtunes_element}
			ghtunes_element :SetProps \{alpha = 0}
		endif
		ui_event_wait_for_safe
		generic_event_back \{state = uistate_jam
			nosound = nosound}
	endif
endscript
lost_network_message_xenon = qs(0xf2c57a36)
lost_network_message_ps3 = qs(0x834f4172)

script jam_ghtunes_failed_dialog \{dialog = 0}
	printscriptinfo \{'jam_upload_song_failed'}
	if ScreenElementExists \{id = ghtunes_leaderboard_menu}
		LaunchEvent \{Type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	if ScreenElementExists \{id = ghtunes_sort_scrolling_menu}
		LaunchEvent \{Type = unfocus
			target = ghtunes_sort_scrolling_menu}
	endif
	if ScreenElementExists \{id = text_entry_vmenu}
		LaunchEvent \{Type = unfocus
			target = text_entry_vmenu}
	endif
	ui_event_wait_for_safe
	clean_up_user_control_helpers
	destroy_dialog_box
	switch <dialog>
		case 0
		if isxenonorwindx
			dialog_txt = qs(0xe3e00947)
		elseif isps3
			dialog_txt = qs(0x08a7ea73)
		endif
		case 1
		if isxenonorwindx
			dialog_txt = $lost_network_message_xenon
		elseif isps3
			dialog_txt = $lost_network_message_ps3
		endif
		case 2
		if isxenonorwindx
			dialog_txt = qs(0x05c128be)
		elseif isps3
			dialog_txt = qs(0x052f0757)
		endif
		case 3
		dialog_txt = qs(0xe3e00947)
		case 4
		if isxenonorwindx
			dialog_txt = qs(0x10445620)
		elseif isps3
			dialog_txt = qs(0x08a7ea73)
		endif
		case 5
		dialog_txt = qs(0xe3e00947)
		case 6
		dialog_txt = qs(0xe50cc88e)
		case 7
		dialog_txt = qs(0xe3e00947)
		case 8
		dialog_txt = qs(0xaaf0a4b9)
		case 9
		dialog_txt = qs(0xb9fd7c2c)
	endswitch
	destroy_generic_menu
	create_dialog_box {
		heading_text = qs(0x0271305b)
		body_text = <dialog_txt>
		options = [
			{
				func = ghtunes_menu_back
				func_params = {dialog = <dialog>}
				text = qs(0x320a8d1c)
			}
		]
	}
endscript

script ghtunes_add_leaderboard_screen 
	ghtunes_element :se_setprops \{stats_heading_alpha = 0
		top_artist_heading_alpha = 0}
	ghtunes_clear_leaderboard
	SpawnScriptNow \{ghtunes_remove_header
		id = ghtunes_spawns}
	ghtunes_element :SetProps \{leaderboard_select_alpha = 1
		time = 0.3}
	ghtunes_element :se_waitprops
endscript

script ghtunes_remove_leaderboard_screen 
	ghtunes_element :SetProps \{leaderboard_select_alpha = 0
		time = 0.3}
	ghtunes_element :se_waitprops
endscript

script ghtunes_add_loading_screen 
	SpawnScriptNow \{ghtunes_animate_spinning_record
		id = ghtunes_spawns}
	SpawnScriptNow \{ghtunes_update_loading_text
		id = ghtunes_spawns}
	ghtunes_element :SetProps \{loading_alpha = 1
		time = 0.3}
	ghtunes_element :se_waitprops
endscript

script ghtunes_remove_loading_screen 
	ghtunes_element :SetProps \{loading_alpha = 0
		time = 0.3}
	ghtunes_element :se_waitprops
	KillSpawnedScript \{Name = ghtunes_animate_spinning_record}
	KillSpawnedScript \{Name = ghtunes_update_loading_text}
endscript

script ghtunes_animate_spinning_record 
	rot_angle = 0
	begin
	ghtunes_element :SetProps record_rot_angle = <rot_angle>
	<rot_angle> = (<rot_angle> + 4)
	if (<rot_angle> >= 360)
		<rot_angle> = 0
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ghtunes_update_loading_text 
	time_between = 0.25
	loading_text_base = qs(0xabf4f150)
	period_array = [qs(0x00000000) qs(0xefb47879) qs(0xab24dd29) qs(0xb723938a)]
	count = 0
	begin
	formatText TextName = loading_text qs(0xeef7df84) s = <loading_text_base> a = (<period_array> [<count>])
	ghtunes_element :SetProps loading_text = <loading_text>
	Wait <time_between> Seconds
	<count> = (<count> + 1)
	if (<count> > 3)
		<count> = 0
	endif
	repeat
endscript

script ghtunes_add_header \{leaderboard_name = qs(0x40529ba2)
		icon = rising_star_icon
		large_icon = rising_star_lrg}
	ghtunes_element :SetProps leaderboard_name_text = <leaderboard_name>
	ghtunes_element :SetProps \{header_pos = (-30.0, -20.0)
		time = 0.75}
	ghtunes_element :se_waitprops
endscript

script ghtunes_remove_header 
	SpawnScriptNow \{ghtunes_remove_watermark
		id = ghtunes_spawns}
	ghtunes_element :SetProps \{header_pos = (-30.0, 120.0)
		time = 0.2}
	ghtunes_element :se_waitprops
endscript

script ghtunes_add_watermark \{icon = rising_star_lrg}
	ghtunes_element :SetProps watermark_texture = <icon> watermark_alpha = 0
	ghtunes_element :SetProps \{watermark_alpha = 0.2
		time = 0.4}
	ghtunes_element :se_waitprops
endscript

script ghtunes_remove_watermark 
	ghtunes_element :SetProps \{watermark_alpha = 0
		time = 0.2}
	ghtunes_element :se_waitprops
endscript

script destroy_jam_ghtunes_menu 
	destroy_song_preview_menu \{ghtunes = 1}
	destroy_dialog_box
	destroy_generic_menu
	stop_custom_song
	KillSpawnedScript \{id = ghtunes_spawns}
	KillSpawnedScript \{Name = ghtunes_animate_5stars}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = ghtunes_element}
		LaunchEvent \{Type = unfocus
			target = ghtunes_element}
		LaunchEvent \{Type = unfocus
			target = ghtunes_leaderboard_menu}
		DestroyScreenElement \{id = ghtunes_element}
	endif
	if ScreenElementExists \{id = ghtunes_terms_dialog_box}
		DestroyScreenElement \{id = ghtunes_terms_dialog_box}
	endif
	if ScreenElementExists \{id = song_preview_element}
		DestroyScreenElement \{id = song_preview_element}
	endif
endscript

script ghtunes_show_terms_of_service 
	SoundEvent \{event = audio_ui_ghtunes_select}
	if ScreenElementExists id = <parent_menu>
		LaunchEvent Type = unfocus target = <parent_menu>
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	if checksumequals a = <parent_menu> b = song_preview_element
		parent = song_preview_element
		musicstudio_stop_song_preview
	else
		parent = ghtunes_element
	endif
	show_ghtunes_connecting_popup
	Wait \{2
		Seconds}
	jamupdatetermsofuse controller = ($primary_controller)
	Block \{Type = verify_update_terms_of_use}
	destroy_dialog_box
	terms_of_service_error = 0
	if (<event_data>.failed = 1)
		<terms_of_service_error> = 1
	endif
	if NOT GlobalExists \{Name = ghtunes_terms_of_service_array}
		<terms_of_service_error> = 1
	else
		GetArraySize \{$ghtunes_terms_of_service_array}
		if (<array_Size> <= 0)
			<terms_of_service_error> = 1
		endif
	endif
	if (<terms_of_service_error> = 1)
		jam_ghtunes_failed_dialog \{dialog = 7}
		return
	endif
	CreateScreenElement {
		parent = <parent>
		Type = descinterface
		id = ghtunes_terms_dialog_box
		desc = 'ghtunes_legal_dialog'
		Pos = (0.0, 0.0)
		Scale = 1
		z_priority = 75
		event_handlers = [
			{pad_up ghtunes_terms_scroll params = {up}}
			{pad_down ghtunes_terms_scroll params = {down}}
			{pad_back ghtunes_terms_back params = {parent_menu = <parent_menu> user_id = <user_id> selected_index = <selected_index>}}
		]
		exclusive_device = ($primary_controller)
	}
	ghtunes_terms_dialog_box :SetProps legal_title_text = ($ghtunes_terms_of_service_array [0])
	if ghtunes_terms_dialog_box :desc_resolvealias \{Name = alias_text_menu}
		GetArraySize ($ghtunes_terms_of_service_array)
		<i> = 1
		begin
		CreateScreenElement {
			Type = TextBlockElement
			parent = <resolved_id>
			font = fontgrid_text_a3
			just = [left top]
			internal_just = [left top]
			Scale = 1
			internal_scale = 0.35000002
			rgba = [113 121 133 255]
			dims = (940.0, 30.0)
			text = ($ghtunes_terms_of_service_array [<i>])
			z_priority = 11
			fit_width = wrap
			fit_height = `expand	dims`
			scale_mode = proportional
			text_case = Original
			alpha = 0
		}
		<i> = (<i> + 1)
		repeat (<array_Size> -1)
		ghtunes_terms_hide_offscreen_text parent = <resolved_id>
	endif
	LaunchEvent \{Type = focus
		target = ghtunes_terms_dialog_box}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ghtunes_terms_hide_offscreen_text 
	GetScreenElementChildren id = <parent>
	GetScreenElementProps id = <parent>
	<parent_y_pos> = (<Pos>.(0.0, 1.0))
	GetArraySize <children>
	<i> = 0
	begin
	<child> = (<children> [<i>])
	GetScreenElementProps id = <child>
	<child_y_pos> = (<Pos>.(0.0, 1.0))
	<y_pos> = (<parent_y_pos> + <child_y_pos>)
	GetScreenElementDims id = <child>
	<y_dims> = (<dims>.(1.0, 0.0))
	<y_check_top> = (<y_dims> * -1)
	<y_check_bottom> = (720 + <y_dims>)
	if (<y_pos> < <y_check_top> || <y_pos> > <y_check_bottom>)
		<child> :se_setprops alpha = 0
	elseif NOT (<alpha> = 1)
		<child> :se_setprops alpha = 1
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script ghtunes_destroy_terms_of_service 
	SoundEvent \{event = audio_ui_ghtunes_back}
	if ScreenElementExists \{id = ghtunes_terms_dialog_box}
		DestroyScreenElement \{id = ghtunes_terms_dialog_box}
	endif
endscript

script ghtunes_terms_scroll 
	<scroll_speed> = (0.0, 50.0)
	if ghtunes_terms_dialog_box :desc_resolvealias \{Name = alias_text_menu}
		GetScreenElementProps id = <resolved_id>
		<up_limit> = 0
		<down_limit> = (((<dims> [1]) * -1) + 400)
		if GotParam \{up}
			if ((<Pos> [1]) < <up_limit>)
				<new_pos> = (<Pos> + <scroll_speed>)
			else
				<new_pos> = (1.0, 0.0)
			endif
		elseif GotParam \{down}
			if ((<Pos> [1]) > <down_limit>)
				<new_pos> = (<Pos> - <scroll_speed>)
			else
				<new_pos> = ((1.0, 0.0) + (<down_limit> * (0.0, 1.0)))
			endif
		endif
		<ratio> = (390.0 / (<down_limit> * -1))
		<scroll_pos_y> = (((<new_pos> [1] * -1) * <ratio>) + 3)
		<scroll_pos> = (<scroll_pos_y> * (0.0, 1.0))
		ghtunes_terms_dialog_box :SetProps scrollbar_pos = <scroll_pos>
		<resolved_id> :SetProps Pos = <new_pos>
		ghtunes_terms_hide_offscreen_text parent = <resolved_id>
	endif
endscript

script ghtunes_terms_back 
	clean_up_user_control_helpers
	ghtunes_destroy_terms_of_service
	if checksumequals a = <parent_menu> b = ghtunes_leaderboard_menu
		clean_up_user_control_helpers
		if ScreenElementExists \{id = ghtunes_element}
			empty = 0
			ghtunes_element :GetTags
			if NOT (<empty> = 1)
				add_user_control_helper \{text = qs(0x43b287ab)
					button = green
					z = 10000}
				if GotParam \{current_leaderboard_index}
					if (<current_leaderboard_index> = 3)
						clean_up_user_control_helpers
						add_user_control_helper \{text = qs(0x9c6459c5)
							button = green
							z = 10000}
					endif
				endif
				add_user_control_helper \{text = qs(0xaf4d5dd2)
					button = red
					z = 10000}
				if ((($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1) > 1)
					add_user_control_helper \{text = qs(0xa42bd569)
						button = yellow
						z = 10000}
				endif
				if (($jam_ghtunes_curr_start_at + $jam_ghtunes_num_results) < $jam_ghtunes_max_start_at)
					add_user_control_helper \{text = qs(0x2931d48b)
						button = blue
						z = 10000}
				endif
				if is_super_user controller = ($primary_controller)
					add_user_control_helper \{text = qs(0xaeaa9380)
						button = pad_left
						z = 10000}
				endif
				add_user_control_helper \{text = qs(0xb7bb830d)
					button = orange
					z = 10000}
				if isxenonorwindx
					add_user_control_helper \{text = qs(0x9a7d1fe5)
						button = start
						z = 10000}
				endif
			else
				add_user_control_helper \{text = qs(0xaf4d5dd2)
					button = red
					z = 10000}
				add_user_control_helper \{text = qs(0xb7bb830d)
					button = orange
					z = 10000}
			endif
		endif
	elseif checksumequals a = <parent_menu> b = ghtunes_sort_scrolling_menu
		set_focus_color \{Color = white220}
		set_unfocus_color \{Color = grey64}
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 10000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 10000}
		add_user_control_helper \{text = qs(0xb7bb830d)
			button = orange
			z = 10000}
	elseif checksumequals a = <parent_menu> b = song_preview_element
		ghtunes_song_preview_helper_text
	endif
	if ScreenElementExists id = <parent_menu>
		LaunchEvent Type = focus target = <parent_menu>
	endif
endscript

script jamupdatetermsofuse_callback 
	Wait \{1
		gameframe}
	broadcastevent \{Type = verify_update_terms_of_use
		data = {
			failed = 0
		}}
endscript

script jamupdatetermsofuse_failed_callback 
	Wait \{1
		gameframe}
	broadcastevent \{Type = verify_update_terms_of_use
		data = {
			failed = 1
		}}
endscript

script jamupdatesubmissionagreement_callback 
	Wait \{1
		gameframe}
	broadcastevent \{Type = verify_update_submission_agreement
		data = {
			failed = 0
		}}
endscript

script jamupdatesubmissionagreement_failed_callback 
	Wait \{1
		gameframe}
	broadcastevent \{Type = verify_update_submission_agreement
		data = {
			failed = 1
		}}
endscript

script show_ghtunes_connecting_popup 
	destroy_dialog_box
	create_dialog_box {
		player_device = ($primary_controller)
		heading_text = qs(0x91605db4)
		body_text = qs(0x5a2176c1)
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = dialog_box_container
		id = loading_record
		texture = load_record
		Pos = (640.0, 455.0)
		z_priority = 10000
		rot_angle = RandomFloat (0.0, 360.0)
	}
	dialog_box_container :obj_spawnscript \{jam_recording_animate_spinning_record}
endscript

script jam_recording_animate_spinning_record 
	if NOT ScreenElementExists \{id = loading_record}
		if ScreenElementExists \{id = dialog_box_container}
			CreateScreenElement \{Type = SpriteElement
				parent = dialog_box_container
				id = loading_record
				texture = load_record
				Pos = (640.0, 512.0)
				z_priority = 10000
				rot_angle = 0}
		endif
	endif
	begin
	loading_record :se_getprops
	loading_record :se_setprops rot_angle = (<rot_angle> + 360) time = 1
	loading_record :se_waitprops
	repeat
endscript
