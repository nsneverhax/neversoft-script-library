jam_ghtunes_num_results = 14
jam_ghtunes_curr_start_at = 0
jam_ghtunes_max_start_at = 999999999
ghtunes_verified = 0
jam_ghtunes_last_search_text = qs(0x00000000)

script create_jam_ghtunes_menu 
	startrendering
	spawnscriptnow \{bg_crowd_front_end_silence
		params = {
			immediate = 1
		}}
	unload_songqpak
	if NOT netsessionfunc \{func = isoldenoughforonline}
		jam_ghtunes_failed_dialog \{dialog = 2}
		return
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	if NOT netsessionfunc \{func = can_view_user_content}
		jam_ghtunes_failed_dialog \{dialog = 2}
		return
	endif
	menu_music_off
	if ($ghtunes_verified = 0)
		verifyjamusercontent controller = ($primary_controller)
		block \{type = verify_jam_user_content}
		printf \{channel = jam_mode
			qs(0x3ba11da7)}
		change \{ghtunes_verified = 1}
	endif
	spawnscriptnow \{id = ghtunes_spawns
		ghtunes_signin_check}
	if ($ghtunes_killswitch = 1)
		jam_ghtunes_failed_dialog \{dialog = 8}
		return
	endif
	change \{jam_ghtunes_curr_start_at = 0}
	change \{jam_ghtunes_max_start_at = 999999999}
	clean_up_user_control_helpers
	soundevent \{event = ghtunes_on}
	if screenelementexists \{id = ghtunes_element}
		destroyscreenelement \{id = ghtunes_element}
	endif
	createscreenelement {
		parent = root_window
		id = ghtunes_element
		type = descinterface
		desc = 'gh_tunes_share'
		exclusive_device = ($primary_controller)
		rot_angle = 0
		loading_alpha = 0
		leaderboard_select_alpha = 0
		watermark_alpha = 0
	}
	ghtunes_element :settags \{current_leaderboard_index = 0
		last_genre_searched = 0}
	ghtunes_element :setprops \{page_text = qs(0x053599bd)}
	ghtunes_element :setprops \{item_select_alpha = 0}
	getscreenelementposition \{id = ghtunes_element}
	ghtunes_element :setprops pos = (<screenelementpos> + (0.0, -800.0)) scale = 0.3
	ghtunes_element :se_waitprops
	ghtunes_element :setprops pos = (<screenelementpos> + (0.0, 0.0)) scale = 1.005 time = 0.2
	ghtunes_element :se_waitprops
	ghtunes_element :setprops pos = (<screenelementpos> + (0.0, 0.0)) scale = 0.99799997 time = 0.1
	ghtunes_element :se_waitprops
	ghtunes_element :setprops pos = (<screenelementpos> + (0.0, 0.0)) scale = 1.002 time = 0.1
	ghtunes_element :se_waitprops
	ghtunes_element :setprops pos = (<screenelementpos> + (0.0, 0.0)) scale = 1.0 time = 0.1
	ghtunes_element :se_waitprops
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
			z = 10000}
	endif
	if ghtunes_element :desc_resolvealias \{name = jam_user_content_leaderboard}
		assignalias id = <resolved_id> alias = ghtunes_leaderboard_menu
		ghtunes_leaderboard_menu :setprops {exclusive_device = ($primary_controller)
			event_handlers = [{pad_up ghtunes_pad_up}
				{pad_down ghtunes_pad_down}
				{pad_back ghtunes_board_back}
				{pad_option2 ghtunes_previous_page}
				{pad_option ghtunes_next_page}
				{pad_left ghtunes_add_to_showcase}
				{pad_choose ghtunes_pad_choose}
				{pad_l1 ghtunes_show_terms_of_service params = {parent_menu = ghtunes_leaderboard_menu}}
				{pad_start ghtunes_pad_start}
			]
		}
		launchevent \{type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	if ghtunes_element :desc_resolvealias \{name = alias_sort_scrolling_menu}
		assignalias id = <resolved_id> alias = ghtunes_sort_scrolling_menu
		ghtunes_sort_scrolling_menu :setprops {exclusive_device = ($primary_controller)
			event_handlers = [
				{pad_back ghtunes_menu_back}
				{pad_up soundevent params = {event = ghtunes_ui_scroll}}
				{pad_down soundevent params = {event = ghtunes_ui_scroll}}
				{pad_choose ghtunes_choose_leaderboard}
				{pad_l1 ghtunes_show_terms_of_service params = {parent_menu = ghtunes_sort_scrolling_menu}}
			]
		}
		<index> = 0
		begin
		formattext checksumname = op_name 'alias_sort_op%a' a = <index>
		ghtunes_element :desc_resolvealias name = <op_name>
		assignalias id = <resolved_id> alias = <op_name>
		<op_name> :setprops {event_handlers = [
				{focus ghtunes_focus params = {id = <op_name> index = <index>}}
				{unfocus ghtunes_unfocus params = {id = <op_name> index = <index>}}
				{unfocus retail_menu_unfocus}
			]
		}
		<index> = (<index> + 1)
		repeat 8
		ghtunes_element :desc_resolvealias \{name = alias_sort_category_bg}
		assignalias id = <resolved_id> alias = alias_sort_category_bg
	endif
	spawnscriptnow \{id = ghtunes_spawns
		ghtunes_add_leaderboard_screen}
	launchevent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	set_focus_color \{rgba = [
			220
			220
			220
			255
		]}
	set_unfocus_color \{rgba = [
			64
			64
			64
			255
		]}
	launchevent \{type = focus
		target = ghtunes_sort_scrolling_menu}
	if gotparam \{straight_to_leaderbrd}
		ghtunes_choose_leaderboard forced_index = <straight_to_leaderbrd> start_at = <start_at>
	endif
endscript

script ghtunes_focus 
	if gotparam \{id}
		if screenelementexists id = <id>
			<id> :getsingletag old_font
			if NOT gotparam \{old_font}
				<id> :se_getprops
				<id> :settags old_font = <font>
			endif
			setscreenelementprops id = <id> font = fontgrid_text_a3 rgba = $menu_focus_color
		endif
	else
		getsingletag \{old_font}
		if NOT gotparam \{old_font}
			se_getprops
			settags old_font = <font>
		endif
		setprops \{font = fontgrid_text_a3
			rgba = $menu_focus_color}
	endif
	if getscreenelementchildren id = <id>
		(<children> [1]) :setprops scale = 1 pos = (-79.0, -6.0) rgba = [220 220 220 255]
	endif
	ghtunes_element :se_setprops info_text = ($ghtunes_leaderboard [<index>].info_text)
endscript

script ghtunes_unfocus 
	if getscreenelementchildren id = <id>
		(<children> [1]) :setprops scale = 0.5 pos = (-62.0, 5.0) rgba = [64 64 64 255]
	endif
endscript
ghtunes_leaderboard = [
	{
		leaderboard = user_content_best_songs
		name_text = qs(0x954c3f72)
		icon = alltime_best_icon
		large_icon = all_time_best_lrg
		info_text = qs(0x57b29d85)
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
		info_text = qs(0x1afb6279)
	}
	{
		leaderboard = user_content_top_artists
		name_text = qs(0xca45d3c2)
		icon = top_artist_icon
		large_icon = top_artist_lrg
		info_text = qs(0x8f3399f3)
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
		info_text = qs(0xefa124b0)
	}
	{
		leaderboard = user_content_showcase
		name_text = qs(0xd83650ac)
		icon = browsebygenre_icon
		large_icon = browse_by_genre_lrg
		info_text = qs(0x86e10564)
	}
	{
		leaderboard = user_content_title_az
		name_text = qs(0xa22c24d9)
		icon = search_icon
		large_icon = search_lrg
		info_text = qs(0xf15684a8)
	}
]

script ghtunes_choose_leaderboard 
	clean_up_user_control_helpers
	ghtunes_sort_scrolling_menu :menu_getselectedindex
	if gotparam \{forced_index}
		<selected_index> = (<forced_index>.index)
	endif
	formattext checksumname = op_name 'alias_sort_op%a' a = <selected_index>
	launchevent \{type = unfocus
		target = ghtunes_sort_scrolling_menu}
	if NOT gotparam \{forced_index}
		<op_name> :setprops rgba = [0 0 0 255]
	endif
	soundevent \{event = ghtunes_ui_select}
	<board> = ($ghtunes_leaderboard [<selected_index>].leaderboard)
	ghtunes_element :settags {current_leaderboard_index = <selected_index>}
	if (<selected_index> = 6)
		if gotparam \{forced_index}
			ghtunes_genre_choose index = ($jam_curr_genre_selected) start_at = (<forced_index>.start_at)
			return
		else
			spawnscriptnow \{ghtunes_create_genre_menu
				id = ghtunes_spawns}
			return
		endif
	endif
	if (<selected_index> = 7)
		if NOT ($jam_ghtunes_last_search_text = qs(0x00000000))
			spawnscriptnow id = ghtunes_spawns ghtunes_string_search params = {text = ($jam_ghtunes_last_search_text)}
		else
			spawnscriptnow \{ghtunes_create_alphasearch_menu
				id = ghtunes_spawns}
		endif
		return
	endif
	leaderboard_index = 0
	getarraysize ($net_user_content_leaderboards)
	begin
	if ($net_user_content_leaderboards [<leaderboard_index>].checksum = <board>)
		if NOT ($net_user_content_leaderboards [<leaderboard_index>].active = 1)
			jam_ghtunes_leaderboard_select_failed dialog = 0 leaderboard_name = ($ghtunes_leaderboard [<selected_index>].name_text)
			return
		endif
	endif
	<leaderboard_index> = (<leaderboard_index> + 1)
	repeat <array_size>
	if (user_content_top_artists = <board>)
		if NOT ($is_user_content_top_artists_active = 1)
			jam_ghtunes_leaderboard_select_failed dialog = 0 leaderboard_name = ($ghtunes_leaderboard [<selected_index>].name_text)
			return
		endif
	endif
	spawnscriptnow ghtunes_add_header id = ghtunes_spawns params = {leaderboard_name = ($ghtunes_leaderboard [<selected_index>].name_text) icon = ($ghtunes_leaderboard [<selected_index>].icon) large_icon = ($ghtunes_leaderboard [<selected_index>].large_icon)}
	launchevent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	ghtunes_element :setprops \{page_text = qs(0x053599bd)}
	ghtunes_clear_leaderboard
	ghtunes_remove_leaderboard_screen
	if gotparam \{forced_index}
		change jam_ghtunes_curr_start_at = (<forced_index>.start_at)
	else
		change \{jam_ghtunes_curr_start_at = 0}
	endif
	change \{jam_ghtunes_max_start_at = 999999999}
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	ghtunes_add_loading_screen
	if NOT (<board> = user_content_top_artists)
		getjamusercontentstats leaderboard = <board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
	else
		getjamtopartiststats leaderboard = <board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
	endif
endscript

script ghtunes_create_genre_menu \{start_at = 0}
	launchevent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	launchevent \{type = unfocus
		target = ghtunes_sort_scrolling_menu}
	if ghtunes_element :desc_resolvealias \{name = alias_genre_icon}
		<resolved_id> :se_setprops scale = 1 pos = (-79.0, -6.0) rgba = [220 220 220 255]
	endif
	make_menu \{vmenu_id = genre_select_vmenu
		menu_bg = list_container
		pos = (540.0, 478.0)
		bg_pos = (520.0, 465.0)
		bg_scale = (0.25, 0.17)
		extra_z = 30
		pad_back_script = ghtunes_submenu_back
		scroll_down_sfx = ghtunes_scroll
		scroll_up_sfx = ghtunes_scroll}
	add_menu_item \{text = qs(0x5dc56fd0)
		heading}
	ghtunes_element :gettags
	getarraysize ($jam_genre_list)
	index = <last_genre_searched>
	begin
	add_menu_item {
		pad_choose_script = ghtunes_genre_choose
		pad_choose_params = {index = <index> start_at = <start_at>}
		additional_focus_script = ghtunes_genre_focus
		additional_focus_params = {index = <index>}
		pad_choose_sound = nullsound
	}
	if (<index> = <last_genre_searched>)
		createscreenelement {
			type = textblockelement
			parent = <item_container_id>
			id = ghtunes_genre_text
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [left center]
			scale = 1
			rgba = [200 200 200 255]
			pos = (125.0, -10.0)
			dims = (180.0, 38.0)
			text = ($jam_genre_list [<index>].name_text)
			z_priority = 45
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = proportional
			text_case = original
		}
	endif
	<index> = (<index> + 1)
	if (<index> >= <array_size>)
		<index> = 0
	endif
	repeat <array_size>
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	launchevent \{type = focus
		target = genre_select_vmenu}
endscript

script ghtunes_genre_focus 
	curr_genre = ($jam_genre_list [<index>].name_text)
	ghtunes_genre_text :se_setprops text = <curr_genre>
endscript
jam_curr_genre_selected = 0

script ghtunes_genre_choose \{start_at = 0}
	soundevent \{event = ghtunes_ui_select}
	if screenelementexists \{id = genre_select_vmenu}
		launchevent \{type = unfocus
			target = genre_select_vmenu}
	endif
	ghtunes_element :setprops \{page_text = qs(0xabf4f150)}
	generic_ui_destroy
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	ghtunes_element :settags {last_genre_searched = <index>}
	change jam_curr_genre_selected = <index>
	generic_ui_destroy
	launchevent \{type = unfocus
		target = ghtunes_sort_scrolling_menu}
	ghtunes_reset_selection
	change jam_ghtunes_curr_start_at = <start_at>
	change \{jam_ghtunes_max_start_at = 999999999}
	leaderboard_index = 0
	getarraysize ($net_user_content_leaderboards)
	begin
	if ($net_user_content_leaderboards [<leaderboard_index>].checksum = ($jam_genre_list [<index>].leaderboard))
		if NOT ($net_user_content_leaderboards [<leaderboard_index>].active = 1)
			jam_ghtunes_leaderboard_select_failed dialog = 0 leaderboard_name = ($jam_genre_list [<index>].name_text)
			return
		endif
	endif
	<leaderboard_index> = (<leaderboard_index> + 1)
	repeat <array_size>
	spawnscriptnow ghtunes_add_header id = ghtunes_spawns params = {leaderboard_name = ($jam_genre_list [<index>].name_text) icon = ($ghtunes_leaderboard [6].icon) large_icon = ($ghtunes_leaderboard [6].large_icon)}
	ghtunes_clear_leaderboard
	ghtunes_remove_leaderboard_screen
	ghtunes_add_loading_screen
	getjamusercontentstats leaderboard = ($jam_genre_list [<index>].leaderboard) start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
endscript

script ghtunes_create_alphasearch_menu 
	change \{jam_ghtunes_max_start_at = 999999999}
	if NOT ($net_user_content_leaderboards [1].active = 1)
		jam_ghtunes_leaderboard_select_failed dialog = 0 leaderboard_name = ($ghtunes_leaderboard [7].name_text)
		return
	endif
	launchevent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	launchevent \{type = unfocus
		target = ghtunes_sort_scrolling_menu}
	if ghtunes_element :desc_resolvealias \{name = alias_search_icon}
		<resolved_id> :se_setprops scale = 1 pos = (-79.0, -6.0) rgba = [220 220 220 255]
	endif
	make_menu \{parent = ghtunes_element
		vmenu_id = text_entry_vmenu
		menu_bg = list_container
		pos = (540.0, 518.0)
		bg_pos = (520.0, 505.0)
		bg_scale = (0.25, 0.17)
		extra_z = 30}
	add_menu_item \{text = qs(0x3ab6314f)
		heading}
	change \{num_name_size = 12}
	text_entry_add_item \{pad_choose_script = ghtunes_string_search
		pad_choose_params = {
		}
		pad_back_script = ghtunes_submenu_back
		validity_message = qs(0x49e73e1b)
		dims = (200.0, 40.0)
		pos = (40.0, 0.0)
		rgba = [
			200
			200
			200
			255
		]}
	clean_up_user_control_helpers
	ui_cas_text_entry_helper_text
	launchevent \{type = focus
		target = text_entry_vmenu
		data = {
			child_index = 1
		}}
	launchevent \{type = pad_choose}
endscript

script ghtunes_submenu_back 
	soundevent \{event = ghtunes_ui_back}
	generic_ui_destroy
	wait \{2
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
	launchevent \{type = focus
		target = ghtunes_sort_scrolling_menu}
endscript

script ghtunes_string_search 
	if screenelementexists \{id = text_entry_vmenu}
		launchevent \{type = unfocus
			target = text_entry_vmenu}
	endif
	launchevent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	ghtunes_element :setprops \{page_text = qs(0xabf4f150)}
	generic_ui_destroy
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	formattext textname = title qs(0xe91be69c) a = ($ghtunes_leaderboard [7].name_text) b = <text>
	spawnscriptnow ghtunes_add_header id = ghtunes_spawns params = {leaderboard_name = <title> icon = ($ghtunes_leaderboard [7].icon) large_icon = ($ghtunes_leaderboard [7].large_icon)}
	ghtunes_clear_leaderboard
	ghtunes_remove_leaderboard_screen
	ghtunes_add_loading_screen
	generic_ui_destroy
	launchevent \{type = unfocus
		target = ghtunes_sort_scrolling_menu}
	ghtunes_reset_selection
	change jam_ghtunes_last_search_text = <text>
	searchjamusercontent leaderboard = user_content_title_az num_results = $jam_ghtunes_num_results search_string = <text>
endscript

script ghtunes_signin_check 
	begin
	if ($blade_active = 0)
		if NOT checkforsignin controller_index = ($primary_controller)
			if isps3
				if screenelementexists \{id = ghtunes_element}
					launchevent \{type = unfocus
						target = ghtunes_element}
				endif
				if screenelementexists \{id = ghtunes_leaderboard_menu}
					launchevent \{type = unfocus
						target = ghtunes_leaderboard_menu}
				endif
				jam_ghtunes_failed_dialog \{dialog = 0}
				return
			endif
			if NOT checkforsignin network_platform_only controller_index = ($primary_controller)
				jam_ghtunes_failed_dialog \{dialog = 3}
				return \{false}
			endif
			if checkforsignin local controller_index = ($primary_controller)
				if netsessionfunc \{func = iscableunplugged}
					if screenelementexists \{id = ghtunes_element}
						launchevent \{type = unfocus
							target = ghtunes_element}
					endif
					if screenelementexists \{id = ghtunes_leaderboard_menu}
						launchevent \{type = unfocus
							target = ghtunes_leaderboard_menu}
					endif
					jam_ghtunes_failed_dialog \{dialog = 3}
					return
				endif
			else
				if screenelementexists \{id = ghtunes_element}
					launchevent \{type = unfocus
						target = ghtunes_element}
				endif
				if screenelementexists \{id = ghtunes_leaderboard_menu}
					launchevent \{type = unfocus
						target = ghtunes_leaderboard_menu}
				endif
				jam_ghtunes_failed_dialog \{dialog = 4}
				return
			endif
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script ghtunes_signin_check_unspawned 
	netsessionfunc \{func = stats_init}
	if netsessionfunc \{func = iscableunplugged}
		jam_ghtunes_failed_dialog \{dialog = 3}
		return
	endif
	if NOT checkforsignin controller_index = ($primary_controller)
		if isps3
			if screenelementexists \{id = ghtunes_element}
				launchevent \{type = unfocus
					target = ghtunes_element}
			endif
			if screenelementexists \{id = ghtunes_leaderboard_menu}
				launchevent \{type = unfocus
					target = ghtunes_leaderboard_menu}
			endif
			jam_ghtunes_failed_dialog \{dialog = 0}
			return
		endif
		if NOT checkforsignin network_platform_only controller_index = ($primary_controller)
			printf \{'not connected to platform'
				channel = jrdebug}
			jam_ghtunes_failed_dialog \{dialog = 3}
			return \{false}
		endif
		if checkforsignin local controller_index = ($primary_controller)
			if netsessionfunc \{func = iscableunplugged}
				if screenelementexists \{id = song_preview_element}
					launchevent \{type = unfocus
						target = song_preview_element}
				endif
				jam_ghtunes_failed_dialog \{dialog = 3}
				return \{false}
			endif
		else
			if screenelementexists \{id = song_preview_element}
				launchevent \{type = unfocus
					target = song_preview_element}
			endif
			jam_ghtunes_failed_dialog \{dialog = 4}
			return \{false}
		endif
	endif
	if isxenon
		if netsessionfunc \{func = xenonisguest}
			jam_ghtunes_failed_dialog \{dialog = 9}
			return \{false}
		endif
	endif
	if NOT netsessionfunc \{func = is_ghtunes_lobby_available}
		wait \{1
			gameframe}
		show_ghtunes_connecting_popup
		<timeout> = 20.0
		resettimer
		begin
		if netsessionfunc \{func = is_ghtunes_lobby_available}
			destroy_popup_warning_menu
			break
		else
			if (<is_connecting> = 0)
				if (<failed_get_server_list> = 0)
					destroy_popup_warning_menu
					if netsessionfunc \{func = iscableunplugged}
						jam_ghtunes_failed_dialog \{dialog = 3}
					else
						jam_ghtunes_failed_dialog \{dialog = 8}
					endif
				else
					destroy_popup_warning_menu
					jam_ghtunes_failed_dialog \{dialog = 5}
				endif
				return
			endif
		endif
		if timegreaterthan <timeout>
			destroy_popup_warning_menu
			jam_ghtunes_failed_dialog \{dialog = 5}
			return
		endif
		wait \{1
			gameframe}
		repeat
	endif
	return \{true}
endscript

script ghtunes_pad_up 
	wait \{1
		gameframe}
	soundevent \{event = ghtunes_ui_scroll}
	ghtunes_leaderboard_menu :menu_getselectedindex
	ghtunes_element :setprops item_select_pos = ((102.0, 207.0) + ((0.0, 31.75) * <selected_index>))
	printf channel = jam_publish qs(0x88ca9ef1) s = <selected_index>
endscript

script ghtunes_pad_down 
	wait \{1
		gameframe}
	soundevent \{event = ghtunes_ui_scroll}
	ghtunes_leaderboard_menu :menu_getselectedindex
	ghtunes_element :setprops item_select_pos = ((102.0, 207.0) + ((0.0, 31.75) * <selected_index>))
	printf channel = jam_publish qs(0xa8cb3393) s = <selected_index>
endscript

script ghtunes_reset_selection 
	ghtunes_element :setprops \{item_select_pos = (102.0, 207.0)}
endscript

script ghtunes_view_user_content 
	if gotparam \{selected_index}
		if (($ghtunes_curr_content_array [<selected_index>].has_content) = 0)
			return
		endif
	endif
	if screenelementexists \{id = song_preview_element}
		launchevent \{type = unfocus
			target = song_preview_element}
	else
		launchevent \{type = unfocus
			target = ghtunes_sort_scrolling_menu}
		launchevent \{type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	if gotparam \{selected_index}
		user_id = ($ghtunes_curr_content_array [<selected_index>].user_id)
		user_name = ($ghtunes_curr_content_array [<selected_index>].user_name)
	endif
	destroy_jam_ghtunes_menu
	jam_upload_song_dialog \{ghtunes = 1
		dialog = 3}
	getjamusercontentlist user_id = <user_id>
	block \{type = get_jam_user_content_list}
	if (<event_data>.failed = 1)
		jam_upload_song_failed \{dialog = 18}
	else
		slot_array = $jam_curr_slot_array
		stoprendering
		if ui_event_exists_in_stack \{name = 'jam_download_slot'}
			generic_event_back state = uistate_jam_download_slot data = {slot_array = <slot_array> board_index = <board_index> start_at = ($jam_ghtunes_curr_start_at) user_name = <user_name> user_id = <user_id>}
		else
			generic_event_choose state = uistate_jam_download_slot data = {slot_array = <slot_array> board_index = <board_index> start_at = ($jam_ghtunes_curr_start_at) user_name = <user_name> user_id = <user_id>}
		endif
		jam_upload_song_dialog_destroy
	endif
endscript

script ghtunes_pad_choose 
	if screenelementexists \{id = ghtunes_leaderboard_menu}
		ghtunes_leaderboard_menu :menu_getselectedindex
	endif
	if gotparam \{selected_index}
		if (($ghtunes_curr_content_array [<selected_index>].has_content) = 0)
			return
		endif
	endif
	if screenelementexists \{id = ghtunes_element}
		launchevent \{type = unfocus
			target = ghtunes_element}
	endif
	if screenelementexists \{id = ghtunes_leaderboard_menu}
		launchevent \{type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	if screenelementexists \{id = ghtunes_element}
		ghtunes_element :gettags
	endif
	top_artist_board_download = 0
	if gotparam \{file_id}
		<top_artist_board_download> = 1
	endif
	if NOT (<top_artist_board_download> = 1)
		<board> = ($ghtunes_leaderboard [<current_leaderboard_index>].leaderboard)
		if (<board> = user_content_top_artists)
			ghtunes_leaderboard_menu :menu_getselectedindex
			ghtunes_view_user_content selected_index = <selected_index> board_index = 3
			return
		endif
	endif
	if gotparam \{board_index}
		current_leaderboard_index = <board_index>
	endif
	killspawnedscript \{name = ghtunes_signin_check}
	wait \{1
		gameframe}
	soundevent \{event = ghtunes_ui_select}
	jam_get_num_songs
	if (<downloaded_song_count> >= ($jam_max_downloaded_songs))
		jam_ghtunes_download_failed_dialog dialog = 0 start_at = ($jam_ghtunes_curr_start_at) board_index = <current_leaderboard_index>
		return
	endif
	if NOT (<top_artist_board_download> = 1)
		ghtunes_leaderboard_menu :menu_getselectedindex
		if ($ghtunes_curr_content_array [<selected_index>].file_id = 0)
			return
		endif
		file_id = ($ghtunes_curr_content_array [<selected_index>].file_id)
		filename = ($ghtunes_curr_content_array [<selected_index>].filename)
		launchevent \{type = unfocus
			target = ghtunes_element}
		launchevent \{type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	clean_up_user_control_helpers
	soundevent \{event = ghtunes_off}
	jam_upload_song_dialog \{ghtunes = 1
		dialog = 2}
	jam_recording_create_editable_arrays
	jam_init_scales
	<no_effects> = [0 0 0 0 0]
	change jam_current_instrument_effects = <no_effects>
	change jam_current_active_effects = <no_effects>
	jam_highway_create_fretbars
	jam_recording_setup_timesig
	clearjamsession
	getarraysize \{$jam_tracks}
	index = 0
	begin
	switch <index>
		case 0
		pan = ($jam_rhythm_pan)
		case 1
		pan = ($jam_lead_pan)
		case 4
		pan = ($jam_melody_pan)
		default
		pan = 0
	endswitch
	settrackinfo track = ($jam_tracks [<index>].id) volume = 10 pan = <pan> tuning = 0 bpm = ($jam_current_bpm) effect = ($jam_current_instrument_effects [<index>])
	<index> = (<index> + 1)
	repeat <array_size>
	jam_init_volumes
	jam_init_pan
	mark_unsafe_for_shutdown
	getjamusercontent controller = ($primary_controller) file_id = <file_id>
	block \{type = get_jam_user_content}
	if (<event_data>.failed = 0)
		setsonginfo \{song_version = $jam_song_version
			downloaded = 1}
		jam_init_volumes
		jam_load_effect
		destroy_jam_ghtunes_menu
		formattext textname = title_text qs(0x73307931) s = <filename>
		jam_upload_song_dialog_destroy
		if gotparam \{selected_index}
			<user_id> = ($ghtunes_curr_content_array [<selected_index>].user_id)
			<user_name> = ($ghtunes_curr_content_array [<selected_index>].user_name)
		endif
		if NOT (<top_artist_board_download> = 1)
			create_song_preview_menu {
				filename = <title_text>
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
				filename = <title_text>
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
		clearjamsession
		if screenelementexists \{id = ghtunes_element}
			ghtunes_element :setprops \{rot_angle = 0
				time = 0}
		endif
		jam_ghtunes_download_failed_dialog dialog = 4 start_at = ($jam_ghtunes_curr_start_at) board_index = <current_leaderboard_index>
	endif
	mark_safe_for_shutdown
	printf channel = jam_publish qs(0x24e69674) s = <selected_index> a = <title_text>
endscript

script ghtunes_pad_start 
	if isxenon
		ghtunes_leaderboard_menu :menu_getselectedindex
		user_id = ($ghtunes_curr_content_array [<selected_index>].user_id)
		if gotparam \{user_id}
			if NOT (<user_id> = 0)
				netsessionfunc func = showgamercard params = {player_xuid = (<user_id>.user_id)}
			endif
		endif
	endif
endscript

script getjamusercontent_callback 
	printf \{channel = jam_publish
		qs(0xe9ac6c70)}
	broadcastevent \{type = get_jam_user_content
		data = {
			failed = 0
		}}
endscript

script getjamusercontent_failed_callback 
	printf \{channel = jam_publish
		qs(0xe9ac6c70)}
	broadcastevent \{type = get_jam_user_content
		data = {
			failed = 1
		}}
endscript

script verifyjamusercontent_callback 
	printf \{channel = jam_publish
		qs(0x61d4bb2f)}
	broadcastevent \{type = verify_jam_user_content}
endscript

script jam_get_primary_user_id 
	netsessionfunc func = get_user_id params = {controller_index = ($primary_controller)}
	return primary_user_id = <user_id>
endscript

script jam_ghtunes_download_failed_dialog \{dialog = 0}
	if screenelementexists \{id = ghtunes_element}
		launchevent \{type = unfocus
			target = ghtunes_element}
		launchevent \{type = unfocus
			target = ghtunes_leaderboard_menu}
	else
		destroy_generic_menu
	endif
	soundevent \{event = menu_warning_sfx}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		formattext \{textname = dialog
			qs(0xa90142cf)
			s = $jam_max_downloaded_songs}
		case 1
		formattext \{textname = dialog
			qs(0xd71479ba)}
		case 2
		formattext \{textname = dialog
			qs(0x14d13c8d)}
		case 4
		formattext \{textname = dialog
			qs(0x0be88eb4)}
		case 5
		formattext \{textname = dialog
			qs(0x1f37151d)}
		case 6
		formattext \{textname = dialog
			qs(0xb0323e79)}
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs(0x5c49397b)
		textblock = {
			text = <dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_ghtunes_download_failed_go_back}
				func_params = {<...>}
				text = qs(0x320a8d1c)
			}
		]
		long
	}
endscript

script jam_ghtunes_download_failed_go_back 
	destroy_popup_warning_menu
	destroy_generic_menu
	ui_event event = menu_back state = uistate_jam_ghtunes data = {straight_to_leaderbrd = {index = <board_index> start_at = <start_at>}}
endscript

script jam_ghtunes_leaderboard_select_failed \{dialog = 0}
	launchevent \{type = unfocus
		target = ghtunes_element}
	launchevent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	launchevent \{type = unfocus
		target = ghtunes_sort_scrolling_menu}
	soundevent \{event = menu_warning_sfx}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		formattext textname = dialog qs(0x6673e635) a = <leaderboard_name>
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs(0x5204e0ef)
		textblock = {
			text = <dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_ghtunes_leaderboard_select_failed_back}
				text = qs(0x320a8d1c)
			}
		]
	}
endscript

script jam_ghtunes_leaderboard_select_failed_back 
	destroy_popup_warning_menu
	ghtunes_board_back
endscript
ghtunes_rating_for_5star = 8.6
ghtunes_curr_content_array = [
]

script getjamusercontentstats_callback 
	wait \{2
		seconds}
	if NOT screenelementexists \{id = ghtunes_element}
		return
	endif
	if NOT screenelementexists \{id = ghtunes_leaderboard_menu}
		return
	endif
	if screenelementexists \{id = popup_warning_container}
		return
	endif
	ghtunes_element :se_setprops \{stats_heading_alpha = 1
		top_artist_heading_alpha = 0}
	launchevent \{type = focus
		target = ghtunes_leaderboard_menu
		data = {
			child_index = 0
		}}
	ghtunes_reset_selection
	printf \{channel = jam_publish
		qs(0x75ff3b6c)}
	is_showcase = 0
	ghtunes_element :getsingletag \{current_leaderboard_index}
	if (<current_leaderboard_index> = 4)
		<is_showcase> = 1
	endif
	if (<current_leaderboard_index> = 7)
		if structurecontains structure = (<content_array> [0]) name = rank
			change jam_ghtunes_curr_start_at = (<content_array> [0].rank [1])
		else
			change \{jam_ghtunes_curr_start_at = 0}
		endif
	endif
	change ghtunes_curr_content_array = <content_array>
	if ghtunes_element :desc_resolvealias \{name = jam_user_content_leaderboard}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			results_array_size = <array_size>
			if NOT (<results_array_size> = 0)
				i = 0
				begin
				has_content = 0
				if ((<content_array> [<i>].has_content) = 1)
					formattext textname = title_text qs(0x73307931) s = (<content_array> [<i>].filename)
					(<children> [<i>]) :setprops title_text = <title_text>
					formattext textname = number_text qs(0x73307931) s = (<i> + 1 + ($jam_ghtunes_num_results * ($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results)))
					(<children> [<i>]) :setprops number_text = <number_text>
					<rating> = (<content_array> [<i>].rating)
					if (<rating> >= ($ghtunes_rating_for_5star) || <is_showcase> = 1)
						(<children> [<i>]) :setprops stars_texture = five_star_glow five_star_full_rgba = [255 255 0 255]
						(<children> [<i>]) :setprops five_star_off_alpha = 1 five_star_full_alpha = 1 star_clip_dims = (134 * (1.0, 0.0) + (0.0, 25.0))
						(<children> [<i>]) :obj_killspawnedscript name = ghtunes_animate_5stars
						(<children> [<i>]) :obj_spawnscript ghtunes_animate_5stars params = {id = (<children> [<i>])}
					else
						<new_x_dims> = ((<rating> / 9.0) * 132)
						(<children> [<i>]) :obj_killspawnedscript name = ghtunes_animate_5stars
						(<children> [<i>]) :setprops stars_texture = five_star_full five_star_full_rgba = [255 255 255 255] five_star_off_alpha = 1 five_star_full_alpha = 1 star_clip_dims = (<new_x_dims> * (1.0, 0.0) + (0.0, 25.0))
					endif
					formattext textname = user_text qs(0x73307931) s = (<content_array> [<i>].user_name)
					(<children> [<i>]) :setprops user_id_text = <user_text>
					printf qs(0x8d6e97cf) a = <i> b = (<content_array> [<i>].file_id.file_id [1]) c = (<content_array> [<i>].filename) d = (<content_array> [<i>].version)
					getarraysize \{$jam_genre_list}
					genre_count = 0
					genre_text = qs(0x00000000)
					begin
					printf channel = jam_mode qs(0xe8173fbb) s = ($jam_genre_list [<genre_count>].checksum) a = (<content_array> [<i>].genre)
					if (($jam_genre_list [<genre_count>].checksum) = (<content_array> [<i>].genre))
						genre_text = ($jam_genre_list [<genre_count>].abrev_text)
						break
					endif
					<genre_count> = (<genre_count> + 1)
					repeat <array_size>
					(<children> [<i>]) :setprops genre_text = <genre_text>
				else
					change jam_ghtunes_max_start_at = ($jam_ghtunes_curr_start_at + <i>)
					break
				endif
				i = (<i> + 1)
				repeat <results_array_size>
			endif
		endif
	endif
	formattext textname = page_text qs(0x85daac1b) s = (($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1)
	clean_up_user_control_helpers
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
	if isxenon
		add_user_control_helper \{text = qs(0x9a7d1fe5)
			button = start
			z = 10000}
	endif
	ghtunes_element :setprops page_text = <page_text>
	ghtunes_element :setprops \{item_select_alpha = 10000}
	ghtunes_remove_loading_screen
endscript

script getjamtopartiststats_callback 
	wait \{2
		seconds}
	if NOT screenelementexists \{id = ghtunes_element}
		return
	endif
	if NOT screenelementexists \{id = ghtunes_leaderboard_menu}
		return
	endif
	ghtunes_element :se_setprops \{stats_heading_alpha = 0
		top_artist_heading_alpha = 1}
	launchevent \{type = focus
		target = ghtunes_leaderboard_menu
		data = {
			child_index = 0
		}}
	ghtunes_reset_selection
	printf \{channel = jam_publish
		qs(0xf0b74a6e)}
	change ghtunes_curr_content_array = <content_array>
	if ghtunes_element :desc_resolvealias \{name = jam_user_content_leaderboard}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			results_array_size = <array_size>
			printf \{channel = jam_publish
				qs(0x7a447205)}
			if NOT (<results_array_size> = 0)
				i = 0
				begin
				has_content = 0
				if ((<content_array> [<i>].has_content) = 1)
					printf \{channel = jam_publish
						qs(0x516921c6)}
					formattext textname = artist_text qs(0x73307931) s = (<content_array> [<i>].user_name)
					(<children> [<i>]) :setprops title_text = <artist_text>
					formattext textname = number_text qs(0x73307931) s = (<i> + 1 + ($jam_ghtunes_num_results * ($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results)))
					(<children> [<i>]) :setprops number_text = <number_text>
				else
					change jam_ghtunes_max_start_at = ($jam_ghtunes_curr_start_at + <i>)
					break
				endif
				i = (<i> + 1)
				repeat <results_array_size>
			endif
		endif
	endif
	formattext textname = page_text qs(0x85daac1b) s = (($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1)
	clean_up_user_control_helpers
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
	if isxenon
		add_user_control_helper \{text = qs(0x9a7d1fe5)
			button = start
			z = 10000}
	endif
	ghtunes_element :setprops page_text = <page_text>
	ghtunes_element :setprops \{item_select_alpha = 10000}
	ghtunes_remove_loading_screen
endscript

script ghtunes_animate_5stars 
	begin
	getrandomvalue \{name = glow_time
		a = 0.7
		b = 1.0}
	if screenelementexists id = <id>
		<id> :se_setprops stars_texture = five_star_glow five_star_full_scale = 1 five_star_full_rgba = [255 255 255 255] time = <glow_time>
		<id> :se_waitprops
	else
		break
	endif
	getrandomvalue \{name = glow_time
		a = 0.7
		b = 1.0}
	if screenelementexists id = <id>
		<id> :se_setprops stars_texture = five_star_glow five_star_full_scale = 1.02 five_star_full_rgba = [255 252 100 255] time = <glow_time>
		<id> :se_waitprops
	else
		break
	endif
	repeat
endscript

script getjamusercontentstats_failed_callback 
	wait \{2
		seconds}
	jam_upload_song_dialog_destroy
	if screenelementexists \{id = ghtunes_element}
		launchevent \{type = unfocus
			target = ghtunes_element}
	endif
	if screenelementexists \{id = ghtunes_element}
		launchevent \{type = unfocus
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
	if scriptisrunning \{ghtunes_spam_lock}
		return
	else
		spawnscriptnow \{ghtunes_spam_lock
			id = ghtunes_spawns}
	endif
	if ($jam_ghtunes_curr_start_at = 0)
		change jam_ghtunes_curr_start_at = ($jam_ghtunes_num_results + 1)
	else
		change jam_ghtunes_curr_start_at = ($jam_ghtunes_curr_start_at + $jam_ghtunes_num_results)
	endif
	if ($jam_ghtunes_curr_start_at > $jam_ghtunes_max_start_at)
		change jam_ghtunes_curr_start_at = ($jam_ghtunes_curr_start_at - $jam_ghtunes_num_results)
		return
	endif
	soundevent \{event = ghtunes_ui_select}
	ghtunes_clear_leaderboard
	launchevent \{type = unfocus
		target = ghtunes_element}
	launchevent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	ghtunes_element :setprops \{page_text = qs(0x053599bd)}
	ghtunes_element :setprops \{item_select_alpha = 0}
	ghtunes_reset_selection
	ghtunes_add_loading_screen
	ghtunes_element :gettags
	if NOT gotparam \{current_leaderboard_index}
		current_leaderboard_index = 0
	endif
	<board> = ($ghtunes_leaderboard [<current_leaderboard_index>].leaderboard)
	if NOT (<board> = user_content_top_artists)
		if (<current_leaderboard_index> = 6)
			getjamusercontentstats leaderboard = ($jam_genre_list [<last_genre_searched>].leaderboard) start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
		else
			getjamusercontentstats leaderboard = <board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
		endif
	else
		getjamtopartiststats leaderboard = <board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
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
	if scriptisrunning \{ghtunes_spam_lock}
		return
	else
		spawnscriptnow \{ghtunes_spam_lock
			id = ghtunes_spawns}
	endif
	change jam_ghtunes_curr_start_at = ($jam_ghtunes_curr_start_at - $jam_ghtunes_num_results)
	if ($jam_ghtunes_curr_start_at < 0)
		change \{jam_ghtunes_curr_start_at = 0}
		return
	endif
	soundevent \{event = ghtunes_ui_back}
	ghtunes_clear_leaderboard
	launchevent \{type = unfocus
		target = ghtunes_element}
	launchevent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	ghtunes_element :setprops \{page_text = qs(0x053599bd)}
	ghtunes_element :setprops \{item_select_alpha = 0}
	ghtunes_reset_selection
	ghtunes_add_loading_screen
	ghtunes_element :gettags
	if NOT gotparam \{current_leaderboard_index}
		current_leaderboard_index = 0
	endif
	<board> = ($ghtunes_leaderboard [<current_leaderboard_index>].leaderboard)
	if NOT (<board> = user_content_top_artists)
		if (<current_leaderboard_index> = 6)
			getjamusercontentstats leaderboard = ($jam_genre_list [<last_genre_searched>].leaderboard) start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
		else
			getjamusercontentstats leaderboard = <board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
		endif
	else
		getjamtopartiststats leaderboard = <board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
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
	if screenelementexists \{id = ghtunes_element}
		ghtunes_element :gettags
		if (<current_leaderboard_index> = 3)
			return
		endif
	endif
	ghtunes_leaderboard_menu :menu_getselectedindex
	formattext textname = dialog qs(0xd3b930b2) s = ($ghtunes_curr_content_array [<selected_index>].filename)
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	create_popup_warning_menu {
		title = qs(0xd5fd99f0)
		textblock = {
			text = <dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {ghtunes_add_to_showcase_go_back}
				func_params = {selected_index = <selected_index>}
				text = qs(0x320a8d1c)
			}
			{
				func = {ghtunes_add_to_showcase_confirm}
				func_params = {selected_index = <selected_index>}
				text = qs(0x182f0173)
			}
		]
	}
	launchevent \{type = unfocus
		target = ghtunes_element}
	launchevent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	soundevent \{event = menu_warning_sfx}
endscript

script ghtunes_add_to_showcase_success 
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	create_popup_warning_menu {
		title = qs(0xd5fd99f0)
		textblock = {
			text = qs(0x85c3fab3)
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {ghtunes_add_to_showcase_go_back}
				func_params = {selected_index = <selected_index>}
				text = qs(0x320a8d1c)
			}
		]
	}
	launchevent \{type = unfocus
		target = ghtunes_element}
	launchevent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	soundevent \{event = menu_warning_sfx}
endscript

script ghtunes_add_to_showcase_confirm 
	if (($ghtunes_curr_content_array [<selected_index>].file_id) = 0)
		return
	endif
	addtoshowcase controller = ($primary_controller) file_id = ($ghtunes_curr_content_array [<selected_index>].file_id)
	block \{type = add_to_showcase}
	ghtunes_add_to_showcase_success
endscript

script ghtunes_add_to_showcase_go_back 
	current_leaderboard_index = 0
	if screenelementexists \{id = ghtunes_element}
		ghtunes_element :gettags
	endif
	jam_ghtunes_download_failed_go_back start_at = ($jam_ghtunes_curr_start_at) board_index = <current_leaderboard_index>
endscript

script addtoshowcase_callback 
	printf \{channel = jam_mode
		qs(0xce7010a8)}
	broadcastevent \{type = add_to_showcase}
endscript

script ghtunes_spam_lock \{time = 1}
	wait <time> seconds
endscript

script ghtunes_clear_leaderboard 
	if ghtunes_element :desc_resolvealias \{name = jam_user_content_leaderboard}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			if NOT (<array_size> = 0)
				i = 0
				begin
				(<children> [<i>]) :setprops number_text = qs(0x00000000)
				(<children> [<i>]) :setprops title_text = qs(0x00000000)
				(<children> [<i>]) :setprops rating_text = qs(0x00000000)
				(<children> [<i>]) :setprops user_id_text = qs(0x00000000)
				(<children> [<i>]) :setprops genre_text = qs(0x00000000)
				(<children> [<i>]) :setprops five_star_off_alpha = 0 five_star_full_alpha = 0
				i = (<i> + 1)
				repeat <array_size>
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
	soundevent \{event = ghtunes_ui_back}
	launchevent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	set_focus_color \{rgba = [
			220
			220
			220
			255
		]}
	set_unfocus_color \{rgba = [
			64
			64
			64
			255
		]}
	launchevent \{type = focus
		target = ghtunes_sort_scrolling_menu}
	change \{jam_ghtunes_last_search_text = qs(0x00000000)}
	ghtunes_reset_selection
	ghtunes_add_leaderboard_screen
endscript

script ghtunes_menu_back \{dialog = 0}
	destroy_popup_warning_menu
	soundevent \{event = ghtunes_ui_back}
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
		set_focus_color \{rgba = [
				220
				220
				220
				255
			]}
		set_unfocus_color \{rgba = [
				64
				64
				64
				255
			]}
		launchevent \{type = focus
			target = ghtunes_sort_scrolling_menu}
		ghtunes_remove_loading_screen
		ghtunes_add_leaderboard_screen
	else
		if screenelementexists \{id = ghtunes_element}
			soundevent \{event = ghtunes_off}
			launchevent \{type = unfocus
				target = ghtunes_element}
			ghtunes_element :setprops \{alpha = 0}
		endif
		generic_event_back \{state = uistate_jam
			nosound = nosound}
	endif
endscript
lost_network_message_xenon = qs(0xf2c57a36)
lost_network_message_ps3 = qs(0x834f4172)

script jam_ghtunes_failed_dialog \{dialog = 0}
	if screenelementexists \{id = ghtunes_leaderboard_menu}
		launchevent \{type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	if screenelementexists \{id = ghtunes_sort_scrolling_menu}
		launchevent \{type = unfocus
			target = ghtunes_sort_scrolling_menu}
	endif
	if screenelementexists \{id = text_entry_vmenu}
		launchevent \{type = unfocus
			target = text_entry_vmenu}
	endif
	ui_event_wait_for_safe
	clean_up_user_control_helpers
	destroy_popup_warning_menu
	switch <dialog>
		case 0
		if isxenon
			dialog_txt = qs(0xb9f3b9df)
		elseif isps3
			dialog_txt = qs(0x9b1326fe)
		endif
		case 1
		if isxenon
			dialog_txt = $lost_network_message_xenon
		elseif isps3
			dialog_txt = $lost_network_message_ps3
		endif
		case 2
		if isxenon
			dialog_txt = qs(0x3ec48030)
		elseif isps3
			dialog_txt = qs(0x052f0757)
		endif
		case 3
		dialog_txt = qs(0xb9f3b9df)
		case 4
		if isxenon
			dialog_txt = qs(0x3ff28f88)
		elseif isps3
			dialog_txt = qs(0x9b1326fe)
		endif
		case 5
		dialog_txt = qs(0xb9f3b9df)
		case 6
		dialog_txt = qs(0xe50cc88e)
		case 7
		dialog_txt = qs(0xb9f3b9df)
		case 8
		dialog_txt = qs(0xe957958e)
		case 9
		dialog_txt = qs(0xb9fd7c2c)
	endswitch
	create_popup_warning_menu {
		title = qs(0x19b842e2)
		textblock = {
			text = <dialog_txt>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {ghtunes_menu_back}
				func_params = {dialog = <dialog>}
				text = qs(0x320a8d1c)
			}
		]
		long
	}
endscript

script ghtunes_add_leaderboard_screen 
	ghtunes_element :se_setprops \{stats_heading_alpha = 0
		top_artist_heading_alpha = 0}
	ghtunes_clear_leaderboard
	spawnscriptnow \{ghtunes_remove_header
		id = ghtunes_spawns}
	ghtunes_element :setprops \{leaderboard_select_alpha = 1
		time = 0.3}
	ghtunes_element :se_waitprops
endscript

script ghtunes_remove_leaderboard_screen 
	ghtunes_element :setprops \{leaderboard_select_alpha = 0
		time = 0.3}
	ghtunes_element :se_waitprops
endscript

script ghtunes_add_loading_screen 
	spawnscriptnow \{ghtunes_animate_spinning_record
		id = ghtunes_spawns}
	spawnscriptnow \{ghtunes_update_loading_text
		id = ghtunes_spawns}
	ghtunes_element :setprops \{loading_alpha = 1
		time = 0.3}
	ghtunes_element :se_waitprops
endscript

script ghtunes_remove_loading_screen 
	ghtunes_element :setprops \{loading_alpha = 0
		time = 0.3}
	ghtunes_element :se_waitprops
	killspawnedscript \{name = ghtunes_animate_spinning_record}
	killspawnedscript \{name = ghtunes_update_loading_text}
endscript

script ghtunes_animate_spinning_record 
	rot_angle = 0
	begin
	ghtunes_element :setprops record_rot_angle = <rot_angle>
	<rot_angle> = (<rot_angle> + 4)
	if (<rot_angle> >= 360)
		<rot_angle> = 0
	endif
	wait \{1
		gameframe}
	repeat
endscript

script ghtunes_update_loading_text 
	time_between = 0.25
	loading_text_base = qs(0xabf4f150)
	period_array = [qs(0x00000000) qs(0xefb47879) qs(0xab24dd29) qs(0xb723938a)]
	count = 0
	begin
	formattext textname = loading_text qs(0xeef7df84) s = <loading_text_base> a = (<period_array> [<count>])
	ghtunes_element :setprops loading_text = <loading_text>
	wait <time_between> seconds
	<count> = (<count> + 1)
	if (<count> > 3)
		<count> = 0
	endif
	repeat
endscript

script ghtunes_add_header \{leaderboard_name = qs(0x40529ba2)
		icon = rising_star_icon
		large_icon = rising_star_lrg}
	spawnscriptnow ghtunes_add_watermark id = ghtunes_spawns params = {icon = <large_icon>}
	ghtunes_element :setprops leaderboard_name_text = <leaderboard_name> icon_texture = <icon>
	ghtunes_element :setprops \{header_pos = (-266.0, 0.0)
		time = 0.4}
	ghtunes_element :se_waitprops
endscript

script ghtunes_remove_header 
	spawnscriptnow \{ghtunes_remove_watermark
		id = ghtunes_spawns}
	ghtunes_element :setprops \{header_pos = (-266.0, 118.0)
		time = 0.2}
	ghtunes_element :se_waitprops
endscript

script ghtunes_add_watermark \{icon = rising_star_lrg}
	ghtunes_element :setprops watermark_texture = <icon> watermark_alpha = 0
	ghtunes_element :setprops \{watermark_alpha = 0.2
		time = 0.4}
	ghtunes_element :se_waitprops
endscript

script ghtunes_remove_watermark 
	ghtunes_element :setprops \{watermark_alpha = 0
		time = 0.2}
	ghtunes_element :se_waitprops
endscript

script destroy_jam_ghtunes_menu 
	destroy_song_preview_menu \{ghtunes = 1}
	killspawnedscript \{name = guitar_jam_playback_recording}
	killspawnedscript \{name = guitar_jam_drum_playback}
	killspawnedscript \{id = ghtunes_spawns}
	killspawnedscript \{name = ghtunes_animate_5stars}
	clean_up_user_control_helpers
	if screenelementexists \{id = ghtunes_element}
		launchevent \{type = unfocus
			target = ghtunes_element}
		launchevent \{type = unfocus
			target = ghtunes_leaderboard_menu}
		destroyscreenelement \{id = ghtunes_element}
	endif
	if screenelementexists \{id = ghtunes_terms_dialog_box}
		destroyscreenelement \{id = ghtunes_terms_dialog_box}
	endif
	if screenelementexists \{id = song_preview_element}
		destroyscreenelement \{id = song_preview_element}
	endif
endscript

script ghtunes_show_terms_of_service 
	soundevent \{event = ghtunes_ui_select}
	if screenelementexists id = <parent_menu>
		launchevent type = unfocus target = <parent_menu>
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	resettimer
	show_ghtunes_connecting_popup
	jamupdatetermsofuse controller = ($primary_controller)
	block \{type = verify_update_terms_of_use}
	getstarttime
	begin
	getelapsedtime starttime = <starttime>
	if (<elapsedtime> > 1000.0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	destroy_popup_warning_menu
	terms_of_service_error = 0
	if (<event_data>.failed = 1)
		<terms_of_service_error> = 1
	endif
	if NOT globalexists \{name = ghtunes_terms_of_service_array}
		<terms_of_service_error> = 1
	else
		getarraysize \{$ghtunes_terms_of_service_array}
		if (<array_size> <= 0)
			<terms_of_service_error> = 1
		endif
	endif
	if (<terms_of_service_error> = 1)
		jam_ghtunes_failed_dialog \{dialog = 7}
		return
	endif
	if checksumequals a = <parent_menu> b = song_preview_element
		parent = song_preview_element
	else
		parent = ghtunes_element
	endif
	createscreenelement {
		parent = <parent>
		type = descinterface
		id = ghtunes_terms_dialog_box
		desc = 'ghtunes_legal_dialog'
		pos = (0.0, 0.0)
		scale = 1
		z_priority = 75
		event_handlers = [
			{pad_up ghtunes_terms_scroll params = {up}}
			{pad_down ghtunes_terms_scroll params = {down}}
			{pad_back ghtunes_terms_back params = {parent_menu = <parent_menu> user_id = <user_id> selected_index = <selected_index>}}
		]
	}
	ghtunes_terms_dialog_box :setprops legal_title_text = ($ghtunes_terms_of_service_array [0])
	if ghtunes_terms_dialog_box :desc_resolvealias \{name = alias_text_menu}
		getarraysize ($ghtunes_terms_of_service_array)
		<i> = 1
		begin
		createscreenelement {
			type = textblockelement
			parent = <resolved_id>
			font = fontgrid_text_a3
			just = [left top]
			internal_just = [left top]
			scale = 1
			internal_scale = 0.6
			rgba = [200 200 200 255]
			dims = (985.0, 30.0)
			text = ($ghtunes_terms_of_service_array [<i>])
			z_priority = 11
			fit_width = wrap
			fit_height = `expand dims`
			scale_mode = proportional
			text_case = original
			alpha = 0
		}
		<i> = (<i> + 1)
		repeat (<array_size> -1)
		ghtunes_terms_hide_offscreen_text parent = <resolved_id>
	endif
	launchevent \{type = focus
		target = ghtunes_terms_dialog_box}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script ghtunes_terms_hide_offscreen_text 
	getscreenelementchildren id = <parent>
	getscreenelementprops id = <parent>
	<parent_y_pos> = (<pos>.(0.0, 1.0))
	getarraysize <children>
	<i> = 0
	begin
	<child> = (<children> [<i>])
	getscreenelementprops id = <child>
	<child_y_pos> = (<pos>.(0.0, 1.0))
	<y_pos> = (<parent_y_pos> + <child_y_pos>)
	getscreenelementdims id = <child>
	<y_dims> = (<dims>.(1.0, 0.0))
	<y_check_top> = (<y_dims> * -1)
	<y_check_bottom> = (720 + <y_dims>)
	if (<y_pos> < <y_check_top> || <y_pos> > <y_check_bottom>)
		<child> :se_setprops alpha = 0
	elseif NOT (<alpha> = 1)
		<child> :se_setprops alpha = 1
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script ghtunes_destroy_terms_of_service 
	soundevent \{event = ghtunes_ui_back}
	if screenelementexists \{id = ghtunes_terms_dialog_box}
		destroyscreenelement \{id = ghtunes_terms_dialog_box}
	endif
endscript

script ghtunes_terms_scroll 
	<scroll_speed> = (0.0, 20.0)
	if ghtunes_terms_dialog_box :desc_resolvealias \{name = alias_text_menu}
		getscreenelementprops id = <resolved_id>
		<up_limit> = 0
		<down_limit> = (((<dims> [1]) * -1) + 400)
		if gotparam \{up}
			if ((<pos> [1]) < <up_limit>)
				<new_pos> = (<pos> + <scroll_speed>)
			else
				<new_pos> = (1.0, 0.0)
			endif
		elseif gotparam \{down}
			if ((<pos> [1]) > <down_limit>)
				<new_pos> = (<pos> - <scroll_speed>)
			else
				<new_pos> = ((1.0, 0.0) + (<down_limit> * (0.0, 1.0)))
			endif
		endif
		<ratio> = (360.0 / (<down_limit> * -1))
		<scroll_pos_y> = (((<new_pos> [1] * -1) * <ratio>) + 42)
		<scroll_pos> = ((1.0, 0.0) + ((<scroll_pos_y>) * (0.0, 1.0)))
		ghtunes_terms_dialog_box :setprops scrollbar_pos = <scroll_pos>
		<resolved_id> :setprops pos = <new_pos>
		ghtunes_terms_hide_offscreen_text parent = <resolved_id>
	endif
endscript

script ghtunes_terms_back 
	clean_up_user_control_helpers
	ghtunes_destroy_terms_of_service
	if checksumequals a = <parent_menu> b = ghtunes_leaderboard_menu
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0x43b287ab)
			button = green
			z = 10000}
		if screenelementexists \{id = ghtunes_element}
			ghtunes_element :gettags
			if gotparam \{current_leaderboard_index}
				if (<current_leaderboard_index> = 3)
					clean_up_user_control_helpers
					add_user_control_helper \{text = qs(0x9c6459c5)
						button = green
						z = 10000}
				endif
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
		if isxenon
			add_user_control_helper \{text = qs(0x9a7d1fe5)
				button = start
				z = 10000}
		endif
	elseif checksumequals a = <parent_menu> b = ghtunes_sort_scrolling_menu
		set_focus_color \{rgba = [
				220
				220
				220
				255
			]}
		set_unfocus_color \{rgba = [
				64
				64
				64
				255
			]}
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
		song_preview_control_helpers \{ghtunes = 1}
	endif
	if screenelementexists id = <parent_menu>
		launchevent type = focus target = <parent_menu>
	endif
endscript

script jamupdatetermsofuse_callback 
	wait \{1
		gameframe}
	broadcastevent \{type = verify_update_terms_of_use
		data = {
			failed = 0
		}}
endscript

script jamupdatetermsofuse_failed_callback 
	wait \{1
		gameframe}
	broadcastevent \{type = verify_update_terms_of_use
		data = {
			failed = 1
		}}
endscript

script jamupdatesubmissionagreement_callback 
	wait \{1
		gameframe}
	broadcastevent \{type = verify_update_submission_agreement
		data = {
			failed = 0
		}}
endscript

script jamupdatesubmissionagreement_failed_callback 
	wait \{1
		gameframe}
	broadcastevent \{type = verify_update_submission_agreement
		data = {
			failed = 1
		}}
endscript

script show_ghtunes_connecting_popup 
	destroy_popup_warning_menu
	create_popup_warning_menu {
		player_device = ($primary_controller)
		title = qs(0x91605db4)
		textblock = {
			text = qs(0x6a64ee7c)
		}
	}
	createscreenelement {
		type = spriteelement
		parent = popup_warning_container
		id = loading_record
		texture = load_record
		pos = (640.0, 512.0)
		z_priority = 10000
		rot_angle = RandomFloat (0.0, 360.0)
	}
	popup_warning_container :obj_spawnscript \{jam_recording_animate_spinning_record}
endscript
