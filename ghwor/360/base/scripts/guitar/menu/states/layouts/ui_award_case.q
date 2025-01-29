g_max_num_friends = 100
g_award_case_lb_mode = friends
g_num_song_lb_rows = 30
g_num_total_lb_rows = 0
g_award_case_num_visible_rows = 7
g_award_case_player_index = -1
g_award_case_player_offset = -1
g_award_case_skip_offline_message = 0
g_default_stats_text_rgba = [
	205
	185
	123
	200
]
g_player_stats_text_rgba = [
	185
	185
	185
	255
]
g_first_stats_text_rgba = [
	205
	185
	123
	200
]
g_award_case_focus_wait = 2.75
q_award_case_current_goal_name = None
g_award_case_leaderboard_wait_time = 0.0

script ui_init_award_case 
	net_counter_increment \{counter_name = globalcounter_leaderboard}
	if CheckForSignIn network_platform_only controller_index = <device_num>
		<check_friends> = 1
		if isps3
			if NOT NetSessionFunc \{func = isoldenoughforonline}
				<check_friends> = 0
			endif
		endif
		if (<check_friends> = 1)
			NetSessionFunc {
				Obj = friends
				func = begin_retrieve_friends_list
				params = {
					callback = award_case_friendslist_callback
					device_num = <device_num>
					callback_params = {}
				}
			}
			Block \{Type = award_case_friendslist_complete}
		endif
	endif
endscript

script award_case_friendslist_callback 
	Change \{g_award_case_lb_mode = friends}
	if GotParam \{friendlist}
		GetArraySize \{friendlist}
		if (<array_Size> <= 0)
			Change \{g_award_case_lb_mode = overall}
		endif
	endif
	award_case_update_column_name_text
	broadcastevent \{Type = award_case_friendslist_complete}
endscript

script award_case_update_column_name_text 
	if ScreenElementExists \{id = award_case_desc_id}
		if ($g_award_case_lb_mode = friends)
			if NOT awardcase :awardcaseuistack_isofflinemode
				<name_text> = qs(0x3bea1560)
				if isps3
					<name_text> = qs(0x337fa079)
				endif
			else
				<name_text> = qs(0xd6a68e98)
				if isps3
					<name_text> = qs(0x88c76c4c)
				endif
			endif
			award_case_desc_id :se_setprops name_column_text = <name_text>
		else
			<name_text> = qs(0xd6a68e98)
			if isps3
				<name_text> = qs(0x88c76c4c)
			endif
			award_case_desc_id :se_setprops name_column_text = <name_text>
		endif
	endif
endscript

script ui_create_award_case \{return_from_song = 0
		from_signin = 0}
	Change \{lb_offset = 0}
	Change lb_controller = <device_num>
	get_savegame_from_controller controller = <device_num>
	ui_event_add_params \{selected_index = 0}
	setsoundbussparams \{Music_Setlist = {
			vol = -3
		}
		time = 1}
	if NOT GotParam \{song}
		awardcase :awardcaseuistack_setawardleaderboard \{On}
		Change current_leaderboard_id = <leaderboard_id>
		Change \{q_award_case_current_goal_name = qp_score_points}
		Change \{g_award_case_lb_mode = overall}
		<desc> = 'leaderboard'
		<leader_text> = qs(0x00000000)
		if isxenonorwindx
			NetSessionFunc Obj = match func = get_gamertag params = {controller = <device_num>}
			<leader_text> = <Name>
		elseif NetSessionFunc Obj = match func = get_gamertag params = {controller = <device_num>}
			<leader_text> = <Name>
		endif
		Change \{g_award_case_num_visible_rows = 8}
	else
		<desc> = 'award_case_layout'
		get_song_name song = <song>
		get_song_title song = <song>
		awardcase :awardcaseuistack_setcurrentsong song = <song>
		formatText checksumName = leaderboard_id '%s_guitar' s = <song_name>
		Change current_leaderboard_id = <leaderboard_id>
		Change \{q_award_case_current_goal_name = qp_score_points}
		quickplay_get_awards_for_song song_name = <song> savegame = <savegame>
		quickplay_get_best_stars_for_song song = <song>
		formatText TextName = title qs(0x73307931) s = <song_title>
		formatText TextName = awards_text qs(0xc120ac58) c = <challenge_awards> t = <challenge_awards_total>
		formatText TextName = stars_text qs(0xd7b01dd6) s = <best_stars>
		Change \{g_award_case_num_visible_rows = 7}
	endif
	uistack_createboundscreenelement {
		parent = root_window
		id = award_case_desc_id
		Type = descinterface
		desc = <desc>
		z_priority = 155.0
		tags = {
			song = <song>
			stats_menu = 0
			is_song_lb = 0
			num_start_received = 0
			easy_start = -1
			medium_start = -1
			hard_start = -1
			expert_start = -1
			expert_plus_start = -1
		}
		title_text = <title>
		exclusive_device = <device_num>
		awards_complete_text = <awards_text>
		best_stars_number_text = <stars_text>
		leader_text = <leader_text>
		difficulty_scroll_alpha = 0
		stats_menu_alpha = 0.0
		power_challenge_header_alpha = 0.0
	}
	if GotParam \{no_targeting}
		awardcase :awardcaseuistack_settargetingenabled \{OFF}
	endif
	award_case_update_column_name_text
	if award_case_desc_id :desc_resolvealias \{Name = alias_challenges_vmenu}
		<resolved_id> :se_setprops {
			focus_events_on_index_change_only = true
			allow_wrap = FALSE
			event_handlers = [
				{menu_selection_changed ui_sfx params = {menustate = leaderboard uitype = scrollupbig}}
				{pad_back ui_sfx params = {menustateleader = Board uitype = back}}
				{pad_back award_case_back}
			]
		}
		award_case_desc_id :se_setprops \{gold_threshold_bling_alpha = 0}
		award_case_desc_id :se_setprops \{plat_threshold_bling_alpha = 0}
		award_case_desc_id :se_setprops \{diamond_threshold_bling_alpha = 0}
		if NOT awardcase :awardcaseuistack_isawardleaderboard
			award_case_desc_id :Obj_SpawnScriptNow \{threshold_bling}
		endif
		if award_case_desc_id :desc_resolvealias \{Name = alias_instrument_spinner
				param = spinner_id}
			<spinner_id> :Obj_SpawnScriptNow instrument_spinner_ui_icon_anim
		endif
		if award_case_desc_id :desc_resolvealias \{Name = alias_generic_scrollbar_wgt
				param = scrollbar_id}
			AssignAlias id = <scrollbar_id> alias = award_case_scrollbar_wgt
			generic_scrollbar_wgt_initialize \{id = award_case_scrollbar_wgt}
		endif
		if award_case_desc_id :desc_resolvealias \{Name = alias_difficulty_scrollbar_wgt
				param = scrollbar_id}
			generic_scrollbar_wgt_initialize id = <scrollbar_id>
			<scrollbar_id> :obj_setchecksumtag tag_name = difficulty_lb checksum_value = None
		endif
		if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
				param = scrollbar_id}
			generic_scrollbar_wgt_initialize id = <scrollbar_id>
			if awardcase :awardcaseuistack_isawardleaderboard
				<scrollbar_id> :se_setprops alpha = 1.0
			endif
		endif
		if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
				param = menu_id}
			if award_case_desc_id :desc_resolvealias \{Name = alias_default_leader_data
					param = leader_id}
				<leader_id> :se_setprops {
					event_handlers = [
						{focus ui_sfx params = {menustate = leaderboard uitype = scrollup}}
						{pad_back ui_sfx params = {menustate = leaderboard uitype = back}}
						{focus award_case_stats_item_focus params = {alpha = 1.0 text_rgba = ($g_default_stats_text_rgba) leader = 1}}
						{focus award_case_update_helper_pills params = {is_song_lb = 0 stats_menu = 1 goal_name = None}}
						{unfocus award_case_stats_item_focus params = {alpha = 0.0 text_rgba = ($g_first_stats_text_rgba)}}
						{pad_down leader_pad_down params = {leader_id = <leader_id> stats_menu = <menu_id>}}
					]
				}
			else
				ScriptAssert \{'Unable to find alias_default_leader_data'}
			endif
			if award_case_desc_id :desc_resolvealias \{Name = alias_power_score_leader_data
					param = leader_id}
				<leader_id> :se_setprops {
					alpha = 1.0
					event_handlers = [
						{focus ui_sfx params = {menustate = leaderboard uitype = scrollup}}
						{pad_back ui_sfx params = {menustate = leaderboard uitype = back}}
						{focus award_case_stats_item_focus params = {alpha = 1.0 text_rgba = ($g_default_stats_text_rgba) leader = 1}}
						{focus award_case_update_helper_pills params = {is_song_lb = 0 stats_menu = 1 goal_name = None}}
						{unfocus award_case_stats_item_focus params = {alpha = 0.0 text_rgba = ($g_first_stats_text_rgba)}}
						{pad_down leader_pad_down params = {leader_id = <leader_id> stats_menu = <menu_id>}}
					]
				}
			endif
			if awardcase :awardcaseuistack_isawardleaderboard
				<menu_id> :se_setprops {
					event_handlers = [
						{menu_selection_changed ui_sfx params = {menustate = leaderboard uitype = scrollup}}
						{pad_back ui_sfx params = {menustate = leaderboard uitype = back}}
						{pad_up award_case_lb_scroll params = {Dir = up}}
						{pad_down award_case_lb_scroll params = {Dir = down}}
						{pad_back award_case_back}
						{pad_L1 award_case_toggle_lb_mode}
					]
				}
				<leader_id> :se_setprops {
					event_handlers = [
						{pad_back award_case_back}
						{pad_L1 award_case_toggle_lb_mode}
					]
				}
			else
				quickplay_songlist_update_awards song_checksum = <song> objID = award_case_desc_id
				<menu_id> :se_setprops {
					event_handlers = [
						{menu_selection_changed ui_sfx params = {menustate = leaderboard uitype = scrollup}}
					]
				}
			endif
		endif
		if CheckForSignIn controller_index = <device_num> dont_set_primary network_platform_only
			GetNetID controller_index = (<device_num>)
		else
			net_id_first = 0
			net_id_second = 0
		endif
		array = [0 0]
		SetArrayElement ArrayName = array index = 0 NewValue = <net_id_first>
		SetArrayElement ArrayName = array index = 1 NewValue = <net_id_second>
		net_id = <array>
		if awardcase :awardcaseuistack_isawardleaderboard
			LaunchEvent Type = focus target = <menu_id>
			award_case_update_helper_pills \{is_song_lb = 1
				goal_name = None}
			award_case_show_leader_row \{goal_name = None
				time = 0.0}
		else
			award_case_update_helper_pills \{is_song_lb = 1
				goal_name = None}
			award_case_show_leader_row \{goal_name = None
				time = 0.0}
			award_case_setup_challenge_menus return_from_song = <return_from_song>
			LaunchEvent Type = focus target = <resolved_id>
		endif
		uistack_spawnboundscriptnow request_award_case_leaderboard params = {net_id = <net_id> device_num = ($lb_controller) song = <song> from_signin = <from_signin>}
		Wait \{3
			gameframes}
	endif
endscript

script award_case_back 
	award_case_desc_id :se_setprops \{block_events}
	generic_event_back
endscript

script award_case_get_leader_id \{goal_name = qp_score_points}
	if ScreenElementExists \{id = award_case_desc_id}
		if checksumequals a = <goal_name> b = qp_power_score_points
			if award_case_desc_id :desc_resolvealias \{Name = alias_power_score_leader_data
					param = leader_id}
				return leader_id = <leader_id>
			endif
		else
			if award_case_desc_id :desc_resolvealias \{Name = alias_default_leader_data
					param = leader_id}
				return leader_id = <leader_id>
			endif
		endif
	endif
endscript

script award_case_show_leader_row \{goal_name = qp_score_points
		time = 0.15}
	if ScreenElementExists \{id = award_case_desc_id}
		if checksumequals a = <goal_name> b = qp_power_score_points
			if award_case_desc_id :desc_resolvealias \{Name = alias_power_score_leader_data
					param = leader_id}
				<leader_id> :se_setprops alpha = 1.0 time = <time>
			endif
			if award_case_desc_id :desc_resolvealias \{Name = alias_default_leader_data
					param = leader_id}
				<leader_id> :se_setprops alpha = 0.0
			endif
		else
			if award_case_desc_id :desc_resolvealias \{Name = alias_default_leader_data
					param = leader_id}
				<leader_id> :se_setprops alpha = 1.0 time = <time>
			endif
			if award_case_desc_id :desc_resolvealias \{Name = alias_power_score_leader_data
					param = leader_id}
				<leader_id> :se_setprops alpha = 0.0
			endif
		endif
	endif
endscript

script ui_destroy_award_case 
	if ScreenElementExists \{id = dialog_box_container}
		destroy_dialog_box
	endif
	KillSpawnedScript \{Name = award_case_leaderboard_callback}
	KillSpawnedScript \{Name = award_case_friends_song_leaderboard_callback}
	KillSpawnedScript \{Name = award_case_load_song_score_stats}
	KillSpawnedScript \{Name = award_case_display_error_message}
	KillSpawnedScript \{Name = award_case_request_quickplay_stars}
	clean_up_user_control_helpers
endscript

script ui_return_award_case 
	printf \{channel = award_case
		qs(0x75b215d8)}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = award_case_desc_id}
		award_case_desc_id :se_setprops \{unblock_events}
	endif
	if ObjectExists \{id = awardcase}
		if NOT ui_event_exists_in_stack \{Name = 'gameplay'}
			awardcase :awardcaseuistack_getcurrentsong
			songlist_update_song_preview song = <song> do_not_fade_preview
		endif
		if NOT awardcase :awardcaseuistack_isawardleaderboard
			if award_case_desc_id :obj_getintegertag \{tag_name = instrument_index
					assert = 0}
				<instrument_index> = <integer_value>
				if award_case_desc_id :obj_getchecksumtag \{tag_name = goal_name
						assert = 0}
					if award_case_desc_id :obj_getintegertag \{tag_name = stats_menu
							assert = 0}
						<stats_menu> = <integer_value>
						<is_song_lb> = 0
						if (<stats_menu> = 0)
							if award_case_desc_id :obj_getintegertag \{tag_name = is_song_lb
									assert = 0}
								<is_song_lb> = <integer_value>
							endif
						endif
						if ($current_leaderboard_id = None)
							award_case_update_helper_pills is_song_lb = <is_song_lb> stats_menu = <stats_menu> goal_name = <checksum_value>
						else
							award_case_update_helper_pills is_song_lb = <is_song_lb> stats_menu = <stats_menu> instrument_index = <instrument_index> goal_name = <checksum_value>
						endif
					endif
				endif
			endif
			<stats_in_focus> = 0
			if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
					param = menu_id}
				if isscreenelementinfocus id = <menu_id> ignore_temp_out_of_focus = true
					<stats_in_focus> = 1
				endif
			endif
			if (<stats_in_focus> = 0)
				award_case_get_leader_id goal_name = <checksum_value>
				if ScreenElementExists id = <leader_id>
					if isscreenelementinfocus id = <leader_id> ignore_temp_out_of_focus = true
						<stats_in_focus> = 1
					endif
				endif
			endif
			if (<stats_in_focus> = 0)
				if award_case_desc_id :desc_resolvealias \{Name = alias_challenges_vmenu
						param = menu_id}
					<menu_id> :se_setprops unblock_events
					<menu_id> :menu_getselectedindex
					if GetScreenElementChildren id = <menu_id>
						if ScreenElementExists id = (<children> [<selected_index>])
							(<children> [<selected_index>]) :se_setprops unblock_events
							if awardcase :awardcaseuistack_isofflinemode
								LaunchEvent Type = unfocus target = <menu_id>
								LaunchEvent Type = focus target = <menu_id> data = {child_index = <selected_index>}
							endif
						endif
					endif
				endif
			endif
		else
			award_case_update_helper_pills \{is_song_lb = 1
				stats_menu = 1
				goal_name = None}
		endif
	endif
endscript

script award_case_update_helper_pills \{is_song_lb = !i1768515945
		stats_menu = 0
		no_goal = 0
		only_back = 0
		no_scores = 0
		instrument_index = 0
		goal_name = !q1768515945}
	ui_event_get_top
	if NOT (<base_name> = 'award_case')
		return
	elseif ScreenElementExists \{id = dialog_box_container}
		return
	endif
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = ($lb_controller)
	if NOT awardcase :awardcaseuistack_isawardleaderboard
		if (<stats_menu> = 0)
			if awardcase :awardcaseuistack_istargetingenabled
				add_user_control_helper \{text = qs(0xc18d5e76)
					button = green
					z = 100000}
			elseif (<no_goal> = 0)
				add_user_control_helper \{text = qs(0xc18d5e76)
					button = green
					z = 100000}
			endif
		endif
	endif
	if awardcase :awardcaseuistack_istargetingenabled
		if (<stats_menu> = 1 && <only_back> = 0)
			add_user_control_helper \{text = qs(0xbeb307ce)
				button = green
				z = 100000}
		endif
	endif
	add_user_control_helper controller = ($lb_controller) text = qs(0xaf4d5dd2) button = red z = 100000
	GetNetID controller_index = ($lb_controller)
	array = [0 0]
	SetArrayElement ArrayName = array index = 0 NewValue = <net_id_first>
	SetArrayElement ArrayName = array index = 1 NewValue = <net_id_second>
	<net_id> = <array>
	if NOT awardcase :awardcaseuistack_isawardleaderboard
		if NOT awardcase :awardcaseuistack_isofflinemode
			if (<is_song_lb> = 1)
				if ($g_award_case_lb_mode = friends)
					add_super_user_control_helper \{text = qs(0xb4c39a21)
						button = blue}
				elseif ($g_award_case_lb_mode = overall)
					if awardcase :awardcaseuistack_hassongscore instrument_index = <instrument_index> player_id = <net_id> goal_name = <goal_name>
						add_super_user_control_helper \{text = qs(0x3acb1b43)
							button = blue}
					else
						add_super_user_control_helper \{text = qs(0x8c691206)
							button = blue}
					endif
				else
					add_super_user_control_helper \{text = qs(0x8c691206)
						button = blue}
				endif
			endif
		endif
	endif
	if (<stats_menu> = 1)
		if NOT awardcase :awardcaseuistack_isofflinemode
			if (<only_back> = 0)
				if (<no_scores> = 0)
					if isXenon
						add_user_control_helper controller = ($lb_controller) text = qs(0x9a7d1fe5) button = yellow z = 100000
					endif
					if CheckForSignIn network_platform_only controller_index = ($lb_controller)
						add_user_control_helper controller = ($lb_controller) text = qs(0xbe4c0e5b) button = blue z = 100000
					endif
				endif
			endif
		endif
	elseif awardcase :awardcaseuistack_istargetingenabled
		add_user_control_helper controller = ($lb_controller) text = qs(0xbeb307ce) button = start z = 100000
	endif
	if awardcase :awardcaseuistack_isawardleaderboard
		if NOT awardcase :awardcaseuistack_isofflinemode
			if awardcase :awardcaseuistack_hasinitialized \{instrument_index = 0}
				if ($g_award_case_lb_mode = friends)
					add_super_user_control_helper \{text = qs(0xb4c39a21)}
				elseif ($g_award_case_lb_mode = overall)
					if awardcase :awardcaseuistack_hassongscore instrument_index = <instrument_index> player_id = <net_id> goal_name = <goal_name>
						add_super_user_control_helper \{text = qs(0x3acb1b43)}
					else
						add_super_user_control_helper \{text = qs(0x8c691206)}
					endif
				else
					add_super_user_control_helper \{text = qs(0x8c691206)}
				endif
			endif
		endif
	endif
endscript

script request_award_case_leaderboard 
	<use_offline_award_case> = 0
	<age_restricted> = 0
	<not_signed_in> = 0
	if NOT CheckForSignIn network_platform_only controller_index = <device_num>
		<use_offline_award_case> = 1
		<not_signed_in> = 1
	elseif isps3
		if NOT NetSessionFunc \{func = isoldenoughforonline}
			<age_restricted> = 1
			<use_offline_award_case> = 1
		endif
	elseif NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
		<use_offline_award_case> = 1
		<not_signed_in> = 1
	endif
	if (<use_offline_award_case> = 0)
		<use_offline_award_case> = 1
		begin
		ui_leaderboard_reinit
		if (<net_id> [0] = 0 && <net_id> [1] = 0)
			GetNetID controller_index = (<device_num>)
			array = [0 0]
			SetArrayElement ArrayName = array index = 0 NewValue = <net_id_first>
			SetArrayElement ArrayName = array index = 1 NewValue = <net_id_second>
			net_id = <array>
		endif
		if NetSessionFunc \{func = is_leaderboard_lobby_available}
			<use_offline_award_case> = 0
			break
		endif
		Wait \{1
			Second}
		repeat 30
	endif
	if (<use_offline_award_case> = 0)
		Change \{g_award_case_skip_offline_message = 0}
		if ($g_award_case_leaderboard_wait_time > 0)
			Wait ($g_award_case_leaderboard_wait_time) Seconds
			Change \{g_award_case_leaderboard_wait_time = 0}
		else
			Change g_award_case_leaderboard_wait_time = ($g_award_case_leaderboard_wait_time + 1.5)
		endif
		if awardcase :awardcaseuistack_isawardleaderboard
			readleaderboardbyfriendslist {
				callback = award_case_friends_song_leaderboard_callback
				callback_mode = ($g_award_case_lb_mode)
				leaderboard_id = ($current_leaderboard_id)
				offset = 0
				num_rows = ($g_max_num_friends)
				controller_id = ($lb_controller)
			}
		else
			if awardcase :awardcaseuistack_getnextleaderboardid
				Change current_leaderboard_id = <leaderboard_id>
				readleaderboardbyfriendslist {
					callback = award_case_friends_song_leaderboard_callback
					callback_mode = ($g_award_case_lb_mode)
					leaderboard_id = ($current_leaderboard_id)
					offset = 0
					num_rows = ($g_max_num_friends)
					controller_id = ($lb_controller)
				}
			else
				Change current_leaderboard_id = <leaderboard_id>
				readleaderboardbyfriendslist {
					callback = award_case_leaderboard_callback
					callback_mode = ($g_award_case_lb_mode)
					leaderboard_id = ($current_leaderboard_id)
					offset = 0
					num_rows = ($g_max_num_friends)
					controller_id = ($lb_controller)
				}
			endif
		endif
	else
		ui_event_wait_for_safe
		if ((<age_restricted> = 1 && <from_signin> = 1) || ($g_award_case_skip_offline_message = 0 && <age_restricted> = 0))
			SpawnScriptNow \{award_case_display_error_message
				params = {
					skip_future_offline_msgs = 1
				}}
		else
			award_case_show_offline_view
		endif
	endif
endscript

script award_case_display_error_message \{reason = None
		skip_future_offline_msgs = 0}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	printscriptinfo \{channel = award_case
		'award_case_display_error_message'}
	if ObjectExists \{id = awardcase}
		if NOT awardcase :awardcaseuistack_isofflinemode
			printf \{channel = award_case
				qs(0x4c4cce1f)}
			ui_event_wait_for_safe
			ui_event_get_top
			if (<base_name> != 'generic_dialog_box' && <base_name> = 'award_case')
				printf \{channel = award_case
					qs(0xb0a07e09)}
				ui_leaderboard_get_error_text reason = <reason>
				<options> = [
					{
						func = award_case_error_cancel
						text = qs(0xf7723015)
					}
					{
						func = award_case_show_offline_view
						func_params = {go_back = 1 skip_future_offline_msgs = <skip_future_offline_msgs>}
						text = qs(0xaec82a2f)
					}
				]
				if isps3
					if NOT CheckForSignIn controller_index = ($lb_controller) network_platform_only
						if NetSessionFunc \{func = has_network_platform_account}
							<options> = [
								{
									func = award_case_error_cancel
									text = qs(0xf7723015)
								}
								{
									func = award_case_signin_ps3
									text = qs(0x17df5913)
								}
								{
									func = award_case_show_offline_view
									func_params = {go_back = 1 skip_future_offline_msgs = <skip_future_offline_msgs>}
									text = qs(0xaec82a2f)
								}
							]
						endif
					endif
				endif
				award_case_desc_id :se_setprops \{block_events}
				generic_event_choose {
					state = uistate_generic_dialog_box
					data = {
						is_popup
						options = <options>
						back_button_script = award_case_error_cancel
						heading_text = qs(0xaa163738)
						body_text = <error_text>
					}
				}
			elseif (<base_name> != 'generic_dialog_box')
				award_case_show_offline_view \{go_back = 0
					no_focus = 1}
			endif
		endif
	endif
endscript

script award_case_signin_ps3 
	NetSessionFunc \{func = OnlineSignIn
		params = {
			callback = award_case_signin_ps3_callback
		}}
	printf \{channel = award_case
		qs(0x8bd10575)}
endscript

script award_case_signin_ps3_callback 
	printf \{channel = award_case
		qs(0xc198c6ad)}
	signin_complete_callback
	NetSessionFunc \{func = is_lobby_available}
	award_case_desc_id :se_setprops \{unblock_events}
	generic_event_back
	ui_event_wait_for_safe
	ui_event \{event = menu_refresh
		data = {
			from_signin = 1
		}}
endscript

script award_case_show_offline_view \{go_back = 0
		skip_future_offline_msgs = 0
		no_focus = 0}
	printf \{channel = award_case
		qs(0xe479c683)}
	if (<no_focus> = 0)
		award_case_desc_id :se_setprops \{unblock_events}
	endif
	if (<go_back> = 1)
		generic_event_back
	endif
	printf \{channel = award_case
		qs(0xb4501804)}
	awardcase :awardcaseuistack_setofflinemode \{On}
	award_case_retrieve_offline_data
	Change \{g_award_case_lb_mode = friends}
	if (<no_focus> = 0)
		if NOT awardcase :awardcaseuistack_isawardleaderboard
			if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
					param = menu_id}
				if isscreenelementinfocus id = <menu_id>
					award_case_stats_menu_back is_song_lb = 1 goal_name = ($q_award_case_current_goal_name)
				endif
			endif
			award_case_get_leader_id goal_name = <goal_name>
			if ScreenElementExists id = <leader_id>
				if isscreenelementinfocus id = <leader_id>
					award_case_stats_menu_back is_song_lb = 1 goal_name = ($q_award_case_current_goal_name)
				endif
			endif
			if award_case_desc_id :desc_resolvealias \{Name = alias_challenges_vmenu
					param = menu_id}
				<menu_id> :se_setprops unblock_events
				<menu_id> :menu_getselectedindex
				if GetScreenElementChildren id = <menu_id>
					if ScreenElementExists id = (<children> [<selected_index>])
						(<children> [<selected_index>]) :se_setprops unblock_events
					endif
				endif
			endif
		endif
	endif
	if (<skip_future_offline_msgs> = 1)
		printf \{channel = award_case
			qs(0x76c15c26)}
		Change \{g_award_case_skip_offline_message = 1}
	endif
	award_case_update_column_name_text
	if (<no_focus> = 0)
		if awardcase :awardcaseuistack_isawardleaderboard
			award_case_load_award_leaderboard_stats
		else
			if award_case_desc_id :obj_getintegertag \{tag_name = instrument_index
					assert = 0}
				<instrument_index> = <integer_value>
				if award_case_desc_id :obj_getchecksumtag \{tag_name = goal_name
						assert = 0}
					if award_case_desc_id :obj_getintegertag \{tag_name = stats_menu
							assert = 0}
						<stats_menu> = <integer_value>
						<is_song_lb> = 0
						if (<stats_menu> = 0)
							if award_case_desc_id :obj_getintegertag \{tag_name = is_song_lb
									assert = 0}
								<is_song_lb> = <integer_value>
							endif
						endif
						if ($current_leaderboard_id = None)
							award_case_update_helper_pills is_song_lb = <is_song_lb> stats_menu = <stats_menu> goal_name = <checksum_value>
						else
							award_case_update_helper_pills is_song_lb = <is_song_lb> stats_menu = <stats_menu> instrument_index = <instrument_index> goal_name = <checksum_value>
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script award_case_error_cancel 
	award_case_desc_id :se_setprops \{unblock_events}
	printf \{channel = award_case
		qs(0x3d2f3f6b)}
	if ui_event_exists_in_stack \{Name = 'song_summary_details'}
		printf \{channel = award_case
			qs(0x16a4dc43)}
		generic_event_back \{state = uistate_song_summary_details}
	elseif awardcase :awardcaseuistack_isawardleaderboard
		printf \{channel = award_case
			qs(0xf95e58ae)}
		if ui_event_exists_in_stack \{Name = 'hall_of_records'}
			printf \{channel = award_case
				qs(0x76335c28)}
			generic_event_back \{state = uistate_hall_of_records}
		else
			printf \{channel = award_case
				qs(0x45306244)}
			generic_event_back \{state = uistate_songlist}
		endif
	else
		printf \{channel = award_case
			qs(0x45306244)}
		generic_event_back \{state = uistate_songlist}
	endif
endscript

script award_case_friends_song_leaderboard_callback 
	printf \{channel = award_case
		qs(0x3e8421ba)}
	if ObjectExists \{id = awardcase}
		if NOT checksumequals a = <status> b = failed
			awardcase :awardcaseuistack_getcurrentsongleaderboardinfo
			awardcase :awardcaseuistack_setsongscores rows = <rows> instrument_index = <config_idx>
			printf channel = award_case qs(0x62e9a1d5) c = <config_idx>
			if awardcase :awardcaseuistack_isawardleaderboard
				if ScreenElementExists \{id = award_case_desc_id}
					award_case_desc_id :se_setprops \{instrument_spinner_alpha = 0.0}
				endif
				award_case_load_award_leaderboard_stats
				award_case_desc_id :Obj_SpawnScriptNow \{award_case_decay_leaderboard_wait_times}
			else
				Change g_award_case_leaderboard_wait_time = ($g_award_case_leaderboard_wait_time + 1.5)
				if ObjectExists \{id = awardcase}
					if awardcase :awardcaseuistack_getnextleaderboardid
						Change current_leaderboard_id = <leaderboard_id>
						readleaderboardbyfriendslist {
							callback = award_case_friends_song_leaderboard_callback
							callback_mode = ($g_award_case_lb_mode)
							leaderboard_id = ($current_leaderboard_id)
							offset = 0
							num_rows = ($g_max_num_friends)
							controller_id = ($lb_controller)
						}
					else
						Change current_leaderboard_id = <leaderboard_id>
						readleaderboardbyfriendslist {
							callback = award_case_leaderboard_callback
							callback_mode = ($g_award_case_lb_mode)
							leaderboard_id = ($current_leaderboard_id)
							offset = 0
							num_rows = ($g_max_num_friends)
							controller_id = ($lb_controller)
						}
					endif
				endif
			endif
		else
			SpawnScriptNow award_case_display_error_message params = {reason = <reason>}
		endif
	endif
endscript

script award_case_leaderboard_callback 
	printf \{channel = award_case
		qs(0xa58b0d8f)}
	if ScreenElementExists \{id = award_case_desc_id}
		if ObjectExists \{id = awardcase}
			if NOT checksumequals a = <status> b = failed
				if GotParam \{rows}
					Change g_award_case_leaderboard_wait_time = ($g_award_case_leaderboard_wait_time + 1.5)
					award_case_desc_id :se_setprops \{instrument_spinner_alpha = 0.0}
					awardcase :awardcaseuistack_setchallengedata rows = <rows>
					printf \{channel = award_case
						qs(0xd013e55d)}
					readleaderboardbyfriendslist {
						callback = award_case_quickplay_ranks_callback
						callback_mode = ($g_award_case_lb_mode)
						leaderboard_id = lb_rock_record_2
						offset = 0
						num_rows = ($g_max_num_friends)
						controller_id = ($lb_controller)
					}
					award_case_desc_id :Obj_SpawnScriptNow \{award_case_decay_leaderboard_wait_times}
				else
					SpawnScriptNow award_case_display_error_message params = {reason = <reason>}
				endif
			else
				SpawnScriptNow award_case_display_error_message params = {reason = <reason>}
			endif
		endif
	endif
endscript

script award_case_decay_leaderboard_wait_times 
	begin
	Wait \{1.0
		Seconds}
	Change g_award_case_leaderboard_wait_time = ($g_award_case_leaderboard_wait_time - 1.0)
	repeat
endscript

script award_case_quickplay_ranks_callback 
	if ScreenElementExists \{id = award_case_desc_id}
		if ObjectExists \{id = awardcase}
			if (<status> != failed)
				if GotParam \{rows}
					awardcase :awardcaseuistack_setfriendquickplaystars rows = <rows>
				endif
			else
				SpawnScriptNow award_case_display_error_message params = {reason = <reason>}
			endif
		endif
	endif
endscript

script award_case_request_quickplay_stars \{rows = !a1768515945
		callback = award_case_overall_quickplay_ranks_callback
		mode = !q1768515945}
	printf \{channel = award_case
		qs(0xab0c90b3)}
	if ObjectExists \{id = awardcase}
		if NOT awardcase :awardcaseuistack_isawardleaderboard
			GetArraySize \{rows}
			if (<array_Size> > 0)
				<index> = 0
				<uid_list> = []
				begin
				<net_id> = (<rows> [<index>].player_id)
				AddArrayElement array = <uid_list> element = <net_id>
				<uid_list> = <array>
				RemoveParameter \{array}
				<index> = (<index> + 1)
				repeat <array_Size>
				if awardcase :awardcaseuistack_getoverallsongscores \{rank = 1}
					AddArrayElement array = <uid_list> element = (<row>.player_id)
					<uid_list> = <array>
				endif
				Wait \{1.0
					Seconds}
				Change g_award_case_leaderboard_wait_time = ($g_award_case_leaderboard_wait_time + 1.0)
				readleaderboardbyuidlist callback = <callback> leaderboard_id = lb_rock_record_2 user_id_list = <uid_list> callback_mode = <mode>
			else
				<callback> rows = <rows> status = succeeded reason = rows_empty mode = <mode>
			endif
		endif
	endif
endscript

script award_case_overall_quickplay_ranks_callback 
	printf \{channel = award_case
		qs(0x9b720c3f)}
	if ScreenElementExists \{id = award_case_desc_id}
		awardcase :awardcaseuistack_getcurrentsong
		get_song_name song = <song>
		formatText checksumName = lb_band_id '%s_%p' s = <song_name> p = 'band'
		formatText checksumName = leaderboard_id '%s_%p' s = <song_name> p = 'altband'
		formatText checksumName = power_lb_id '%s_%p' s = <song_name> p = 'challenge'
		<use_friends_scrollbar> = 0
		<goal_name> = qp_score_points
		if checksumequals a = ($current_leaderboard_id) b = <lb_band_id>
			<goal_name> = qp_score_points_stdband
			<use_friends_scrollbar> = 1
		elseif checksumequals a = ($current_leaderboard_id) b = <leaderboard_id>
			<goal_name> = qp_score_points_band
			<use_friends_scrollbar> = 1
		elseif checksumequals a = ($current_leaderboard_id) b = <power_lb_id>
			<goal_name> = qp_power_score_points
		endif
		if (<status> != failed)
			awardcase :awardcaseuistack_getcurrentsongleaderboardinfo
			if (<mode> = $g_award_case_lb_mode && $current_leaderboard_id != None)
				if GotParam \{rows}
					awardcase :awardcaseuistack_setoverallquickplaystars rows = <rows>
					if ($g_award_case_lb_mode = me)
						GetNetID controller_index = ($lb_controller)
						array = [0 0]
						SetArrayElement ArrayName = array index = 0 NewValue = <net_id_first>
						SetArrayElement ArrayName = array index = 1 NewValue = <net_id_second>
						<net_id> = <array>
					endif
					if awardcase :awardcaseuistack_getoverallsongscores net_id = <net_id>
						award_case_display_leaderboard_rows challenge_lb = 0 rows = <display_rows> target_index = <target_index> goal_name = <goal_name>
						<no_goal> = 0
						GetArraySize \{display_rows}
						if (<array_Size> = 0)
							<no_goal> = 1
						endif
						award_case_update_helper_pills is_song_lb = 1 instrument_index = <config_idx> no_goal = <no_goal> goal_name = <goal_name>
						if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
								param = menu_id}
							if NOT ($g_award_case_lb_mode = overall)
								if (<fake_focus_index_for_centering> != -1)
									if ($g_award_case_player_index < 0)
										<fake_focus_index_for_centering> = 0
									endif
									award_case_desc_id :se_setprops \{unblock_events}
									<menu_id> :se_setprops unblock_events
									LaunchEvent Type = focus target = <menu_id> data = {child_index = <fake_focus_index_for_centering>}
									LaunchEvent Type = unfocus target = <menu_id>
								endif
							endif
						endif
					else
						<has_entries> = 0
					endif
				endif
				if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
						param = menu_id}
					<menu_id> :Obj_SpawnScriptNow award_case_wait_and_fade_in params = {goal_name = <goal_name> has_entries = <has_entries> show_challenge_prompt = <show_challenge_prompt>}
				endif
			endif
		else
			SpawnScriptNow award_case_display_error_message params = {reason = <reason>}
		endif
		if ObjectExists \{id = awardcase}
			awardcase :awardcaseuistack_setloadingstats \{FALSE}
		endif
	endif
endscript

script award_case_overall_quickplay_ranks_dynamic_callback 
	printf \{channel = award_case
		qs(0x92590ae0)}
	if ScreenElementExists \{id = award_case_desc_id}
		if ObjectExists \{id = awardcase}
			if (<status> != failed)
				if GotParam \{rows}
					awardcase :awardcaseuistack_setoverallquickplaystars rows = <rows>
					if awardcase :awardcaseuistack_getoverallsongscores
						awardcase :awardcaseuistack_getcurrentsongleaderboardinfo
						<inst_config> = ($g_qp_required_challenge_props_order [<config_idx>])
						if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
								param = menu_id}
							award_case_update_visible_rows rows = <display_rows> goal_name = <goal_name> inst_config = <inst_config> menu_id = <menu_id>
						endif
					endif
				endif
			else
				SpawnScriptNow award_case_display_error_message params = {reason = <reason>}
			endif
		endif
	endif
endscript

script award_case_challenge_item_focus \{is_focus = 0
		challenge_text = qs(0x00000000)
		config_text = qs(0x00000000)
		challenge_targets = [
		]}
	printf \{channel = award_case
		qs(0x9d438b00)}
	Obj_GetID
	if (<is_focus> = 1)
		if GotParam \{is_song_lb}
			Change \{lb_offset = 0}
			<display_rows> = []
			if ($g_award_case_lb_mode = friends || <is_song_lb> = 0)
				if GotParam \{instrument_index}
					awardcase :awardcaseuistack_getsongscores instrument_index = <instrument_index> goal_name = <goal_name>
				elseif GotParam \{challenge_id}
					awardcase :awardcaseuistack_getchallengeleaderboard challenge_index = <challenge_id>
				endif
			else
				awardcase :awardcaseuistack_getoverallsongscores
			endif
			GetArraySize \{display_rows}
			if (<array_Size> = 0)
				<no_goal> = 1
			endif
			award_case_desc_id :obj_setintegertag tag_name = is_song_lb integer_value = <is_song_lb>
			award_case_update_helper_pills is_song_lb = <is_song_lb> instrument_index = <instrument_index> no_goal = <no_goal> goal_name = <goal_name>
		endif
		<objID> :se_setprops frame_highlight_alpha = 1
		Change \{g_award_case_player_index = -1}
		Change \{g_award_case_player_offset = -1}
		if ScreenElementExists \{id = award_case_desc_id}
			<gpd_records> = 1.0
			<power_illustration> = 0.0
			<threshold_stars> = 1.0
			<power_challenge_header_alpha> = 0.0
			if checksumequals a = <goal_name> b = qp_power_score_points
				<gpd_records> = 0.0
				<threshold_stars> = 0.0
				<power_challenge_header_alpha> = 1.0
				<power_illustration> = 1.0
			endif
			if (<goal_name> = qp_power_score_points)
				AddParam \{structure_name = award_case_props
					Name = challenge_icons_top_alpha
					value = 0.0}
			else
				quickplay_get_challenge_icon base_name = <goal_name>
				AddParam structure_name = award_case_props Name = top_row_icon_texture value = <icon_name>
				AddParam \{structure_name = award_case_props
					Name = top_row_icon_alpha
					value = 1.0}
				AddParam \{structure_name = award_case_props
					Name = challenge_icons_top_alpha
					value = 1.0}
			endif
			AddParam structure_name = award_case_props Name = power_challenge_header_alpha value = <power_challenge_header_alpha>
			AddParam structure_name = award_case_props Name = threshold_frames_alpha value = <gpd_records>
			AddParam structure_name = award_case_props Name = power_challenge_ill_alpha value = <power_illustration>
			AddParam structure_name = award_case_props Name = silver_star_markers_alpha value = <threshold_stars>
			AddParam structure_name = award_case_props Name = challenge_title_text value = <challenge_text>
			AddParam structure_name = award_case_props Name = config_text value = <config_text>
			AddParam \{structure_name = award_case_props
				Name = config_icon_alpha
				value = 1.0}
			if (<goal_name> = qp_power_score_points)
				AddParam \{structure_name = award_case_props
					Name = icon_inside_alpha
					value = 0.0}
				AddParam \{structure_name = award_case_props
					Name = config_icon_alpha
					value = 0.0}
			else
				if (<config> = Band || <config> = traditional_band)
					AddParam \{structure_name = award_case_props
						Name = config_icon_texture
						value = icon_band}
					AddParam \{structure_name = award_case_props
						Name = icon_inside_alpha
						value = 0.0}
					AddParam \{structure_name = award_case_props
						Name = config_icon_rgba
						value = [
							255
							255
							255
							255
						]}
				else
					formatText checksumName = icon_texture 'icon_%i_out' i = ($instrument_list.<config>.text_nl)
					formatText checksumName = icon_inside_texture 'icon_%i_fill' i = ($instrument_list.<config>.text_nl)
					AddParam structure_name = award_case_props Name = config_icon_texture value = <icon_texture>
					AddParam structure_name = award_case_props Name = icon_inside_texture value = <icon_inside_texture>
					AddParam \{structure_name = award_case_props
						Name = icon_inside_alpha
						value = 1.0}
					AddParam \{structure_name = award_case_props
						Name = icon_inside_rgba
						value = [
							255
							255
							255
							255
						]}
					AddParam \{structure_name = award_case_props
						Name = config_icon_rgba
						value = black}
				endif
			endif
			if (<config> = traditional_band)
				AddParam \{structure_name = award_case_props
					Name = config_text
					value = qs(0xc617defb)}
			else
				AddParam structure_name = award_case_props Name = config_text value = ($instrument_list.<config>.text)
			endif
			<index> = 0
			begin
			formatText checksumName = star_alpha 'star_%d_alpha' d = <index>
			formatText checksumName = challenge_alpha 'challenge_level_%d_alpha' d = <index>
			if (<challenge_grade> > <index>)
				AddParam structure_name = award_case_props Name = <star_alpha> value = 1.0
				AddParam structure_name = award_case_props Name = <challenge_alpha> value = 0.0
			else
				AddParam structure_name = award_case_props Name = <star_alpha> value = 0.0
				AddParam structure_name = award_case_props Name = <challenge_alpha> value = 0.4
			endif
			<index> = (<index> + 1)
			repeat 3
			ExtendCrc <goal_name> '_info' out = challenge_struct
			if StructureContains structure = ($<challenge_struct>) constants
				if StructureContains structure = ($<challenge_struct>.constants) leaderboard_metric_string
					AddParam structure_name = award_case_props Name = score_column_text value = ($<challenge_struct>.constants.leaderboard_metric_string)
				endif
			endif
			if (<challenge_grade> > 2)
				award_case_desc_id :se_setprops \{gold_threshold_bling_alpha = 1}
				award_case_desc_id :se_setprops \{plat_threshold_bling_alpha = 1}
				award_case_desc_id :se_setprops \{diamond_threshold_bling_alpha = 1}
			elseif (<challenge_grade> > 1)
				award_case_desc_id :se_setprops \{gold_threshold_bling_alpha = 1}
				award_case_desc_id :se_setprops \{plat_threshold_bling_alpha = 1}
				award_case_desc_id :se_setprops \{diamond_threshold_bling_alpha = 0}
			elseif (<challenge_grade> > 0)
				award_case_desc_id :se_setprops \{gold_threshold_bling_alpha = 1}
				award_case_desc_id :se_setprops \{plat_threshold_bling_alpha = 0}
				award_case_desc_id :se_setprops \{diamond_threshold_bling_alpha = 0}
			else
				award_case_desc_id :se_setprops \{gold_threshold_bling_alpha = 0}
				award_case_desc_id :se_setprops \{plat_threshold_bling_alpha = 0}
				award_case_desc_id :se_setprops \{diamond_threshold_bling_alpha = 0}
			endif
			GetArraySize \{challenge_targets}
			if (<array_Size> >= 3)
				if (<goal_name> != NULL)
					qp_get_score_string goal_name = <goal_name> score = (<challenge_targets> [0]) out = gold_text
					gold_text = <score_text>
					qp_get_score_string goal_name = <goal_name> score = (<challenge_targets> [1]) out = platinum_text
					platinum_text = <score_text>
					qp_get_score_string goal_name = <goal_name> score = (<challenge_targets> [2]) out = diamond_text
					diamond_text = <score_text>
				else
					gold_text = qs(0x777345cd)
					platinum_text = qs(0x777345cd)
					diamond_text = qs(0x777345cd)
				endif
				AddParam structure_name = award_case_props Name = gold_threshold_value_text value = <gold_text>
				AddParam structure_name = award_case_props Name = platinum_threshold_value_text value = <platinum_text>
				AddParam structure_name = award_case_props Name = diamond_threshold_value_text value = <diamond_text>
			else
				AddParam \{structure_name = award_case_props
					Name = gold_threshold_value_text
					value = qs(0x00000000)}
				AddParam \{structure_name = award_case_props
					Name = platinum_threshold_value_text
					value = qs(0x00000000)}
				AddParam \{structure_name = award_case_props
					Name = diamond_threshold_value_text
					value = qs(0x00000000)}
			endif
			if GotParam \{instrument_index}
				award_case_desc_id :obj_setintegertag tag_name = instrument_index integer_value = <instrument_index>
				award_case_desc_id :obj_setchecksumtag tag_name = goal_name checksum_value = <goal_name>
			else
				award_case_desc_id :obj_setintegertag \{tag_name = instrument_index
					integer_value = -1}
				award_case_desc_id :obj_setchecksumtag \{tag_name = goal_name
					checksum_value = None}
			endif
			award_case_desc_id :se_setprops <award_case_props>
			if award_case_desc_id :desc_resolvealias \{Name = alias_challenges_vmenu}
				<resolved_id> :menu_getselectedindex
				if GetScreenElementChildren id = <resolved_id>
					GetArraySize \{children}
					if (<array_Size> > 0)
						if (<selected_index> >= 0 && <selected_index> < <array_Size>)
							generic_scrollbar_wgt_update_thumb_pos id = award_case_scrollbar_wgt index = <selected_index>
						endif
					endif
				endif
			endif
		endif
	else
		<objID> :se_setprops frame_highlight_alpha = 0
	endif
endscript

script award_case_load_song_score_stats \{instrument_index = !i1768515945
		goal_name = !q1768515945
		inst_config = !q1768515945
		wait_for_settle = 1}
	printf \{channel = award_case
		qs(0xa5799365)}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if ScriptIsRunning \{award_case_load_challenge_stats}
		KillSpawnedScript \{Name = award_case_load_challenge_stats}
		KillSpawnedScript \{Name = award_case_read_leader_row_callback}
		KillSpawnedScript \{Name = award_case_request_quickplay_stars}
	endif
	if NOT awardcase :awardcaseuistack_isofflinemode
		begin
		if awardcase :awardcaseuistack_hasinitialized instrument_index = <instrument_index> goal_name = <goal_name>
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	awardcase :awardcaseuistack_getcurrentsong
	awardcase :awardcaseuistack_getsongscores instrument_index = <instrument_index> goal_name = <goal_name>
	GetNetID controller_index = ($lb_controller)
	array = [0 0]
	SetArrayElement ArrayName = array index = 0 NewValue = <net_id_first>
	SetArrayElement ArrayName = array index = 1 NewValue = <net_id_second>
	<net_id> = <array>
	if ($g_award_case_lb_mode = me)
		if NOT awardcase :awardcaseuistack_hassongscore instrument_index = <instrument_index> player_id = <net_id> goal_name = <goal_name>
			Change \{g_award_case_lb_mode = friends}
		endif
	endif
	if ($g_award_case_lb_mode = friends)
		get_song_name song = <song>
		awardcase :awardcaseuistack_getnextleaderboardid instrument_index = <instrument_index> goal_name = <goal_name>
		Change current_leaderboard_id = <leaderboard_id>
		Change q_award_case_current_goal_name = <goal_name>
		if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
				param = scrollbar_id}
			GetArraySize \{display_rows}
			generic_scrollbar_wgt_set_resolution id = <scrollbar_id> num_elements = <array_Size>
			<scrollbar_id> :se_setprops alpha = 0
		endif
		award_case_display_leaderboard_rows challenge_lb = 0 rows = <display_rows> goal_name = <goal_name> inst_config = <inst_config> instrument_index = <instrument_index>
		award_case_update_column_name_text
		<default_headers_alpha> = 1.0
		<power_challenge_header_alpha> = 0.0
		<power_illustration> = 0.0
		<gpd_records> = 1.0
		<threshold_stars> = 1.0
		if checksumequals a = <goal_name> b = qp_power_score_points
			<default_headers_alpha> = 0.0
			<gpd_records> = 0.0
			<threshold_stars> = 0.0
			<power_challenge_header_alpha> = 1.0
		endif
		<stats_menu_alpha> = 0.0
		<play_challenge_prompt_alpha> = 0.0
		if (<has_entries> = 1)
			<stats_menu_alpha> = 1.0
			award_case_show_leader_row goal_name = <goal_name>
			if (<show_challenge_prompt> = 1)
				<play_challenge_prompt_alpha> = 1.0
			endif
		else
			<play_challenge_prompt_alpha> = 1.0
		endif
		KillSpawnedScript \{Name = award_case_wait_and_fade_in}
		award_case_desc_id :se_setprops {
			stats_menu_alpha = <stats_menu_alpha>
			default_headers_alpha = <default_headers_alpha>
			play_challenge_prompt_alpha = <play_challenge_prompt_alpha>
			power_challenge_header_alpha = <power_challenge_header_alpha>
			threshold_frames_alpha = <gpd_records>
			silver_star_markers_alpha = <threshold_stars>
			time = 0.15
		}
		award_case_desc_id :se_setprops \{instrument_spinner_alpha = 0.0
			time = 0.1}
	else
		if isps3
			if NOT CheckForSignIn controller_index = ($lb_controller) network_platform_only
				SpawnScriptNow \{award_case_display_error_message}
				return
			endif
		endif
		awardcase :awardcaseuistack_setloadingstats instrument_index = <instrument_index> goal_name = <goal_name> true
		award_case_desc_id :se_setprops \{instrument_spinner_alpha = 1.0
			play_challenge_prompt_alpha = 0.0
			stats_menu_alpha = 0.0}
		awardcase :awardcaseuistack_getnextleaderboardid instrument_index = <instrument_index> goal_name = <goal_name>
		Change current_leaderboard_id = <leaderboard_id>
		Change q_award_case_current_goal_name = <goal_name>
		if (<wait_for_settle> = 1)
			Wait ($g_award_case_focus_wait) Seconds
			Obj_GetID
			if NOT isscreenelementinfocus id = <objID>
				return
			endif
		endif
		if (<inst_config> != Band && <inst_config> != traditional_band)
			if award_case_desc_id :desc_resolvealias \{Name = alias_difficulty_scrollbar_wgt
					param = diff_scrollber_wgt}
				if <diff_scrollber_wgt> :obj_getchecksumtag tag_name = difficulty_lb assert = 0
					if NOT checksumequals a = <checksum_value> b = <leaderboard_id>
						printf \{channel = award_case
							qs(0x6d28436c)}
						<diff_scrollber_wgt> :obj_setchecksumtag tag_name = difficulty_lb checksum_value = <leaderboard_id>
						award_case_desc_id :SetTags \{num_start_received = 0
							easy_start = -1
							medium_start = -1
							hard_start = -1
							expert_start = -1
							expert_plus_start = -1}
						if checksumequals a = <goal_name> b = qp_power_score_points
							<difficulty_bits> = 16
						endif
						Wait \{6.5
							Seconds}
						Change g_award_case_leaderboard_wait_time = ($g_award_case_leaderboard_wait_time + 7.0)
						readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = easy bits = <difficulty_bits>
						readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = medium bits = <difficulty_bits>
						readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = hard bits = <difficulty_bits>
						readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = expert bits = <difficulty_bits>
						readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = expert_plus bits = <difficulty_bits>
						if checksumequals a = <goal_name> b = qp_power_score_points
							readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = None bits = <difficulty_bits>
						endif
					endif
				endif
			endif
		endif
		award_case_update_column_name_text
		award_case_desc_id :se_setprops \{instrument_spinner_alpha = 1.0
			play_challenge_prompt_alpha = 0.0}
		Change g_award_case_leaderboard_wait_time = ($g_award_case_leaderboard_wait_time + 1.5)
		awardcase :awardcaseuistack_getleaderboardsizes
		if ($g_award_case_lb_mode = overall)
			readleaderboardbyoffset {
				callback = award_case_display_song_lb_rows
				callback_mode = ($g_award_case_lb_mode)
				leaderboard_id = <leaderboard_id>
				offset = ($lb_offset)
				num_rows = <page_size>
			}
		else
			readleaderboardbyoffset {
				callback = award_case_read_leader_row_callback
				callback_mode = ($g_award_case_lb_mode)
				leaderboard_id = <leaderboard_id>
				offset = 0
				num_rows = 1
			}
		endif
	endif
endscript

script award_case_read_leader_row_callback 
	printf \{channel = award_case
		qs(0xf6772129)}
	if NOT ScriptIsRunning \{award_case_load_song_score_stats}
		if NOT ScriptIsRunning \{award_case_load_challenge_stats}
			if (<leaderboard_id> = $current_leaderboard_id && <mode> = $g_award_case_lb_mode)
				if (<status> != failed)
					if ObjectExists \{id = awardcase}
						awardcase :awardcaseuistack_setoverallscores rows = <rows>
						Wait \{1.0
							Seconds}
						Change g_award_case_leaderboard_wait_time = ($g_award_case_leaderboard_wait_time + 1.5)
						awardcase :awardcaseuistack_getleaderboardsizes
						readleaderboardbypivot {
							callback_mode = <mode>
							callback = award_case_display_song_lb_rows
							leaderboard_id = <leaderboard_id>
							controller_index = ($lb_controller)
							num_rows = <page_size>
						}
					endif
				else
					SpawnScriptNow award_case_display_error_message params = {reason = <reason>}
				endif
			endif
		endif
	endif
endscript

script award_case_load_challenge_stats \{challenge_id = !i1768515945
		goal_name = !q1768515945
		inst_config = !q1768515945}
	printf \{channel = award_case
		qs(0xac11bbf3)}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if ScriptIsRunning \{award_case_load_song_score_stats}
		KillSpawnedScript \{Name = award_case_load_song_score_stats}
		KillSpawnedScript \{Name = award_case_read_leader_row_callback}
		KillSpawnedScript \{Name = award_case_request_quickplay_stars}
	endif
	award_case_desc_id :se_setprops \{stats_menu_alpha = 0.0
		time = 0.15}
	if NOT awardcase :awardcaseuistack_isofflinemode
		begin
		if awardcase :awardcaseuistack_hasinitialized instrument_index = <instrument_index>
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	awardcase :awardcaseuistack_getcurrentsong
	awardcase :awardcaseuistack_getchallengeleaderboard challenge_index = <challenge_id>
	Change \{current_leaderboard_id = None}
	Change q_award_case_current_goal_name = <goal_name>
	if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
			param = scrollbar_id}
		GetArraySize \{display_rows}
		generic_scrollbar_wgt_set_resolution id = <scrollbar_id> num_elements = <array_Size>
		<scrollbar_id> :se_setprops alpha = 0
	endif
	award_case_display_leaderboard_rows rows = <display_rows> goal_name = <goal_name> inst_config = <inst_config> challenge_id = <challenge_id>
	award_case_update_column_name_text
	<stats_menu_alpha> = 0.0
	<play_challenge_prompt_alpha> = 0.0
	if (<has_entries> = 1)
		<stats_menu_alpha> = 1.0
		award_case_show_leader_row goal_name = <goal_name>
		if (<show_challenge_prompt> = 1)
			<play_challenge_prompt_alpha> = 1.0
		endif
	else
		<play_challenge_prompt_alpha> = 1.0
	endif
	award_case_desc_id :se_setprops {
		stats_menu_alpha = <stats_menu_alpha>
		play_challenge_prompt_alpha = <play_challenge_prompt_alpha>
		default_headers_alpha = <default_headers_alpha>
		default_headers_alpha = 1.0
		silver_star_markers_alpha = 1.0
		threshold_frames_alpha = 1.0
		power_challenge_header_alpha = 0.0
		time = 0.15
	}
	award_case_desc_id :se_setprops \{instrument_spinner_alpha = 0.0
		time = 0.1}
endscript

script award_case_load_award_leaderboard_stats 
	if NOT awardcase :awardcaseuistack_isofflinemode
		if NOT awardcase :awardcaseuistack_hasinitialized \{instrument_index = 0}
			return
		endif
	endif
	if ($g_award_case_lb_mode = friends)
		awardcase :awardcaseuistack_getsongscores \{instrument_index = 0}
		if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
				param = scrollbar_id}
			GetArraySize \{display_rows}
			generic_scrollbar_wgt_set_resolution id = <scrollbar_id> num_elements = <array_Size>
		endif
		award_case_desc_id :se_setprops \{stats_menu_alpha = 0.0
			play_challenge_prompt_alpha = 0.0}
		award_case_display_leaderboard_rows challenge_lb = 0 rows = <display_rows> goal_name = <goal_name> inst_config = <inst_config>
		award_case_update_helper_pills \{is_song_lb = 0
			stats_menu = 1
			goal_name = None}
		if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
				param = scrollbar_id}
			generic_scrollbar_wgt_update_thumb_pos id = <scrollbar_id> index = ($g_award_case_player_index)
		endif
		if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
				param = menu_id}
			if (<fake_focus_index_for_centering> != -1)
				<menu_id> :se_setprops unblock_events
				LaunchEvent Type = focus target = <menu_id> data = {child_index = <fake_focus_index_for_centering>}
				Wait \{3
					gameframes}
				LaunchEvent Type = unfocus target = <menu_id>
				Wait \{0.15
					Seconds}
			endif
		endif
		<stats_menu_alpha> = 0.0
		<play_challenge_prompt_alpha> = 0.0
		if (<has_entries> = 1)
			<stats_menu_alpha> = 1.0
			award_case_show_leader_row goal_name = <goal_name>
			if (<show_challenge_prompt> = 1)
				<play_challenge_prompt_alpha> = 1.0
			endif
		else
			<play_challenge_prompt_alpha> = 1.0
		endif
		KillSpawnedScript \{Name = award_case_wait_and_fade_in}
		if ($g_award_case_player_index = -1)
			award_case_get_leader_id
			if ScreenElementExists id = <leader_id>
				<leader_id> :se_setprops unblock_events
				LaunchEvent Type = focus target = <leader_id>
			endif
		else
			if ($g_award_case_player_index < 0)
				award_case_get_leader_id
				if ScreenElementExists id = <leader_id>
					<leader_id> :se_setprops unblock_events
					LaunchEvent Type = focus target = <leader_id>
				endif
			else
				<menu_id> :se_setprops unblock_events
				LaunchEvent Type = focus target = <menu_id> data = {child_index = ($g_award_case_player_index)}
			endif
		endif
		award_case_desc_id :se_setprops {
			stats_menu_alpha = <stats_menu_alpha>
			play_challenge_prompt_alpha = <play_challenge_prompt_alpha>
			instrument_spinner_alpha = 0.0
			time = 0.15
		}
	else
		if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
				param = menu_id}
			LaunchEvent Type = unfocus target = <menu_id>
			<menu_id> :se_setprops block_events
		endif
		award_case_desc_id :se_setprops \{stats_menu_alpha = 0.0
			play_challenge_prompt_alpha = 0.0
			time = 0.15}
		award_case_get_leader_id
		if ScreenElementExists id = <leader_id>
			LaunchEvent Type = unfocus target = <leader_id>
			<leader_id> :se_setprops block_events
		endif
		award_case_desc_id :se_setprops \{block_events
			instrument_spinner_alpha = 1.0}
		Change g_award_case_leaderboard_wait_time = ($g_award_case_leaderboard_wait_time + 1.5)
		awardcase :awardcaseuistack_getleaderboardsizes
		if ($g_award_case_lb_mode = overall)
			readleaderboardbyoffset {
				callback = award_case_display_song_lb_rows
				callback_mode = ($g_award_case_lb_mode)
				leaderboard_id = ($current_leaderboard_id)
				offset = ($lb_offset)
				num_rows = <page_size>
			}
		else
			readleaderboardbyoffset {
				callback = award_case_read_leader_row_callback
				callback_mode = ($g_award_case_lb_mode)
				leaderboard_id = ($current_leaderboard_id)
				offset = 0
				num_rows = 1
			}
		endif
	endif
endscript

script award_case_display_leaderboard_rows \{rows = !a1768515945
		goal_name = qp_score_points
		inst_config = guitar
		challenge_lb = 1
		target_index = 0}
	printf \{channel = award_case
		qs(0xa38cc01b)}
	<fake_focus_index_for_centering> = -1
	<has_entries> = 1
	<show_challenge_prompt> = 0
	if ScreenElementExists \{id = award_case_desc_id}
		if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
				param = menu_id}
			DestroyScreenElement id = <menu_id> preserve_parent
			if awardcase :awardcaseuistack_isawardleaderboard
				<menu_id> :se_setprops {
					dims = (990.0, 32.0)
					Pos = (0.0, 0.0)
				}
			else
				<menu_id> :se_setprops {
					dims = (800.0, 32.0)
					Pos = (0.0, 0.0)
				}
			endif
			if award_case_desc_id :desc_resolvealias \{Name = alias_stats_scrolling_menu
					param = scrolling_menu}
				if awardcase :awardcaseuistack_isawardleaderboard
					<scrolling_menu> :se_setprops {
						dims = (990.0, 0.0)
						Hide
					}
				else
					<scrolling_menu> :se_setprops {
						dims = (800.0, 0.0)
						Hide
					}
				endif
			endif
			GetArraySize <rows>
			Change \{g_award_case_player_index = -1}
			Change \{g_award_case_player_offset = -1}
			<leader_included> = 0
			awardcase :awardcaseuistack_getcurrentsong
			awardcase :awardcaseuistack_getleaderboardsizes
			if (<array_Size> > 0)
				NetSessionFunc func = get_user_id params = {controller_index = ($lb_controller)}
				<index> = 0
				<window_index> = 0
				if ($g_award_case_lb_mode = friends)
					<window_size> = ($g_max_num_friends)
				endif
				begin
				if (<array_Size> <= <index>)
					break
				endif
				if NOT StructureContains structure = (<rows> [<index>]) rank
					<rank> = (<index> + 1)
				else
					<rank> = (<rows> [<index>].rank)
				endif
				if (<rank> != -1)
					formatText TextName = rank_text qs(0x545e649b) r = <rank>
				endif
				<score> = (<rows> [<index>].score)
				CastToInteger \{score}
				qp_get_score_string goal_name = <goal_name> score = <score>
				<difficulty_alpha> = 0
				if StructureContains structure = (<rows> [<index>]) difficulty
					if checksumequals a = (<rows> [<index>].difficulty) b = expert_plus
						<difficulty_icon> = icon_difficulty_expert_plus
						<difficulty_alpha> = 1
					elseif NOT checksumequals a = (<rows> [<index>].difficulty) b = None
						get_difficulty_text_nl difficulty = (<rows> [<index>].difficulty)
						formatText checksumName = difficulty_icon 'icon_difficulty_%i' i = <difficulty_text_nl>
						<difficulty_alpha> = 1
					endif
				endif
				<gamertag_text> = qs(0x00000000)
				if StructureContains structure = (<rows> [<index>]) gamertag
					<gamertag_text> = (<rows> [<index>].gamertag)
				elseif StructureContains structure = (<rows> [<index>]) gamer_tag
					<gamertag_text> = (<rows> [<index>].gamer_tag)
				endif
				<net_id> = (<rows> [<index>].player_id)
				<text_rgba> = ($g_default_stats_text_rgba)
				if (<net_id> [0] = <user_id> [0] && <net_id> [1] = <user_id> [1])
					<text_rgba> = ($g_player_stats_text_rgba)
					Change g_award_case_player_index = (<window_index> - 1)
					Change g_award_case_player_offset = (<rank> - 1)
				elseif (<net_id> [0] = 0 && <net_id> [1] = 0)
					<text_rgba> = ($g_player_stats_text_rgba)
					Change g_award_case_player_index = (<window_index> - 1)
					Change g_award_case_player_offset = (<rank> - 1)
				endif
				if ($g_award_case_player_index != -1 && <fake_focus_index_for_centering> = -1 &&
						((<window_index> - $g_award_case_player_index) = ($g_award_case_num_visible_rows / 2) ||
							<window_index> = (<window_size> - 1) || <index> = (<array_Size> - 1)))
					<fake_focus_index_for_centering> = <window_index>
				endif
				<desc> = 'award_case_stats_entry'
				<power_star_text> = qs(0x03ac90f0)
				RemoveParameter \{instrument_icon_texture}
				if checksumequals a = <goal_name> b = qp_power_score_points
					<desc> = 'award_case_stats_entry_powerstar'
					if StructureContains structure = (<rows> [<index>]) song_stars
						formatText TextName = power_star_text qs(0x4d4555da) s = (<rows> [<index>].song_stars)
					endif
					if StructureContains structure = (<rows> [<index>]) instrument
						if StructureContains structure = ($instrument_list) (<rows> [<index>].instrument)
							<instrument> = (<rows> [<index>].instrument)
							formatText checksumName = instrument_icon_texture 'icon_%i_fill' i = ($instrument_list.<instrument>.text_nl)
						endif
					endif
				endif
				if awardcase :awardcaseuistack_isawardleaderboard
					<desc> = 'leaderboard_row'
					if StructureContains structure = (<rows> [<index>]) total_time_playing_in_seconds
						<array> = []
						AddArrayElement array = <array> element = (<rows> [<index>].total_time_playing_in_seconds)
						rr_get_time_string data = <array> new_format = 1
						<time_string> = <data_text>
					endif
					quickplay_get_award_rank_ui_data award_points = <score>
				elseif StructureContains structure = (<rows> [<index>]) quickplay_stars
					quickplay_get_award_rank_ui_data award_points = (<rows> [<index>].quickplay_stars)
				endif
				<rock_record_unfocus_id> = <menu_id>
				if (<rank> = 1)
					<leader_included> = 1
					award_case_get_leader_id goal_name = <goal_name>
					if ScreenElementExists id = <leader_id>
						<id> = <leader_id>
						<rock_record_unfocus_id> = <id>
						<id> :se_setprops {
							tags = {
								song = <song>
								rank = <rank>
								valid = 1
							}
							rank_text = <rank_text>
							gamertag_text = <gamertag_text>
							score_text = <score_text>
							text_rgba = <text_rgba>
							difficulty_icon_alpha = <difficulty_alpha>
							difficulty_icon_texture = <difficulty_icon>
							date_text = <time_string>
							rank_number_text = <rank_number_text>
							rank_container_texture = <rank_container_texture>
							instrument_icon_texture = <instrument_icon_texture>
							star_number_id_text = <power_star_text>
							rank_alpha = 1
							star_number_id_alpha = 1
						}
						<id> :obj_setmultipletags tags = {song = <song> rank = <rank> valid = 1}
					endif
				else
					CreateScreenElement {
						parent = <menu_id>
						Type = descinterface
						desc = <desc>
						autosizedims = true
						tags = {
							song = <song>
							rank = <rank>
							valid = 1
						}
						rank_text = <rank_text>
						gamertag_text = <gamertag_text>
						score_text = <score_text>
						text_rgba = <text_rgba>
						difficulty_icon_alpha = <difficulty_alpha>
						difficulty_icon_texture = <difficulty_icon>
						date_text = <time_string>
						rank_number_text = <rank_number_text>
						rank_container_texture = <rank_container_texture>
						instrument_icon_texture = <instrument_icon_texture>
						rank_container_dims = <rank_container_dims>
						star_number_id_text = <power_star_text>
					}
				endif
				if NOT (<challenge_lb> = 1 || $g_award_case_lb_mode = friends)
					if checksumequals a = <goal_name> b = qp_power_score_points
						get_local_in_game_player_num_from_controller controller_index = ($lb_controller)
						if (<player_num> = -1)
							get_controller_type controller_index = ($lb_controller)
							<inst_config> = <controller_type>
							if (<inst_config> != guitar && <inst_config> != drum && <inst_config> != vocals)
								<inst_config> = vocals
							endif
						else
							getplayerinfo <player_num> part out = inst_config
						endif
					else
						awardcase :awardcaseuistack_getcurrentsongleaderboardinfo
						<inst_config> = ($g_qp_required_challenge_props_order [<config_idx>])
					endif
				endif
				<array> = [
					{focus award_case_stats_item_focus params = {alpha = 1.0 text_rgba = ($g_default_stats_text_rgba)}}
					{unfocus award_case_stats_item_focus params = {alpha = 0.0 text_rgba = <text_rgba>}}
					{pad_option2 award_case_display_gamer_card params = {net_id = <net_id>}}
					{pad_option award_case_display_rock_record params = {net_id = <net_id> menu_id = <rock_record_unfocus_id>}}
				]
				if NOT awardcase :awardcaseuistack_isawardleaderboard
					AddArrayElement array = <array> element = {
						pad_start
						award_case_start_targeted_challenge
						params = {
							target_index = <index>
							instrument_index = <instrument_index>
							challenge_id = <challenge_id>
							challenge_name = <goal_name>
							instrument = <inst_config>
							has_friend_scores = 1
						}
					}
					AddArrayElement array = <array> element = {
						pad_choose
						award_case_start_targeted_challenge
						params = {
							target_index = <index>
							instrument_index = <instrument_index>
							challenge_id = <challenge_id>
							challenge_name = <goal_name>
							instrument = <inst_config>
							has_friend_scores = 1
						}
					}
				else
					AddArrayElement array = <array> element = {
						pad_choose
						award_case_display_rock_record
						params = {
							net_id = <net_id>
							menu_id = <rock_record_unfocus_id>
						}
					}
				endif
				<id> :se_setprops {
					replace_handlers
					event_handlers = <array>
				}
				if (<window_index> >= $g_award_case_num_visible_rows)
					<id> :se_setprops Hide
				endif
				<window_index> = (<window_index> + 1)
				if (<index> = 0 && <target_index> != 0)
					<index> = <target_index>
				else
					<index> = (<index> + 1)
				endif
				repeat (<window_size> + 1)
				if (<array_Size> = 1)
					if (<net_id> [0] = <user_id> [0] && <net_id> [1] = <user_id> [1])
						if NOT awardcase :awardcaseuistack_isawardleaderboard
							if NOT awardcase :awardcaseuistack_isofflinemode
								if ($g_award_case_lb_mode = friends)
									<prompt_text> = qs(0x2d701908)
									<show_challenge_prompt> = 1
									award_case_desc_id :se_setprops {
										play_challenge_prompt_text = <prompt_text>
									}
								endif
							endif
						endif
					endif
				endif
				if ($g_award_case_lb_mode = overall)
					Change \{g_award_case_player_index = -1}
				endif
			else
				<desc> = 'award_case_stats_entry'
				<gamertag_text> = qs(0x2a619664)
				if awardcase :awardcaseuistack_isawardleaderboard
					<desc> = 'leaderboard_row'
					<gamertag_text> = qs(0x49a79140)
				endif
				<has_entries> = 0
				<show_challenge_prompt> = 1
				award_case_desc_id :se_setprops {
					play_challenge_prompt_text = <gamertag_text>
				}
				award_case_get_leader_id goal_name = <goal_name>
				if ScreenElementExists id = <leader_id>
					<event_handlers> = [
						{focus award_case_stats_item_focus params = {alpha = 1.0 text_rgba = ($g_default_stats_text_rgba)}}
						{focus award_case_update_helper_pills params = {is_song_lb = 0 stats_menu = 1 no_scores = 1 goal_name = <goal_name>}}
						{unfocus award_case_stats_item_focus params = {alpha = 0.0 text_rgba = gh6_gold_md}}
						{pad_option2 empty_script}
						{pad_option empty_script}
					]
					if NOT awardcase :awardcaseuistack_isawardleaderboard
						AddArrayElement array = <event_handlers> element = {pad_choose award_case_start_targeted_challenge params = {challenge_name = <goal_name> instrument = <inst_config> no_scores = 1}}
						<event_handlers> = <array>
						AddArrayElement array = <event_handlers> element = {pad_start award_case_start_targeted_challenge params = {challenge_name = <goal_name> instrument = <inst_config> no_scores = 1}}
						<event_handlers> = <array>
					else
						AddArrayElement array = <event_handlers> element = {pad_choose empty_script}
						<event_handlers> = <array>
					endif
					<leader_id> :se_setprops {
						tags = {
							song = <song>
						}
						rank_text = qs(0x03ac90f0)
						gamertag_text = qs(0x03ac90f0)
						score_text = qs(0x03ac90f0)
						date_text = qs(0x03ac90f0)
						rank_number_text = qs(0x03ac90f0)
						star_number_id_text = qs(0x03ac90f0)
						rank_container_dims = (0.0, 0.0)
						text_rgba = gh6_gold_md
						difficulty_icon_alpha = 0
						rank_alpha = 0
						star_number_id_alpha = 0
						replace_handlers
						event_handlers = <event_handlers>
					}
				endif
			endif
		endif
	endif
	if award_case_desc_id :desc_resolvealias \{Name = alias_stats_scrolling_menu
			param = scrolling_menu}
		if awardcase :awardcaseuistack_isawardleaderboard
			<scrolling_menu> :se_setprops {
				dims = (990.0, 340.0)
				unhide
			}
		else
			<scrolling_menu> :se_setprops {
				dims = (800.0, 240.0)
				unhide
			}
		endif
	endif
	return fake_focus_index_for_centering = <fake_focus_index_for_centering> has_entries = <has_entries> show_challenge_prompt = <show_challenge_prompt>
endscript

script award_case_display_song_lb_rows 
	printf \{channel = award_case
		qs(0x5b6e8c73)}
	if ScreenElementExists \{id = award_case_desc_id}
		if ObjectExists \{id = awardcase}
			if (<status> != failed)
				if ($current_leaderboard_id = <leaderboard_id> && <mode> = $g_award_case_lb_mode)
					if ObjectExists \{id = awardcase}
						if ($g_award_case_lb_mode = me)
							GetNetID controller_index = ($lb_controller)
							array = [0 0]
							SetArrayElement ArrayName = array index = 0 NewValue = <net_id_first>
							SetArrayElement ArrayName = array index = 1 NewValue = <net_id_second>
							<net_id> = <array>
						endif
						awardcase :awardcaseuistack_setoverallscores rows = <rows> net_id = <net_id>
						Change g_num_total_lb_rows = <total_size>
						if NOT awardcase :awardcaseuistack_isawardleaderboard
							awardcase :awardcaseuistack_getcurrentsong
							get_song_name song = <song>
							formatText checksumName = lb_band_id '%s_%p' s = <song_name> p = 'band'
							formatText checksumName = leaderboard_id '%s_%p' s = <song_name> p = 'altband'
							<use_friends_scrollbar> = 0
							if checksumequals a = ($current_leaderboard_id) b = <lb_band_id>
								<use_friends_scrollbar> = 1
							elseif checksumequals a = ($current_leaderboard_id) b = <leaderboard_id>
								<use_friends_scrollbar> = 1
							endif
							if (<use_friends_scrollbar> = 1)
								if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
										param = scrollbar_id}
									if NOT GotParam \{total_size}
										<total_size> = 0
									endif
									generic_scrollbar_wgt_set_resolution id = <scrollbar_id> num_elements = <total_size>
									<scrollbar_id> :se_setprops alpha = 0
								endif
							endif
							award_case_request_quickplay_stars rows = <rows> mode = <mode>
							return
						else
							if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
									param = scrollbar_id}
								generic_scrollbar_wgt_set_resolution id = <scrollbar_id> num_elements = ($g_num_total_lb_rows)
							endif
						endif
						award_case_display_leaderboard_rows challenge_lb = 0 rows = <rows> target_index = <target_index>
						if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
								param = menu_id}
							if NOT ($g_award_case_lb_mode = overall)
								if (<fake_focus_index_for_centering> != -1)
									award_case_desc_id :se_setprops \{unblock_events}
									<menu_id> :se_setprops unblock_events
									LaunchEvent Type = focus target = <menu_id> data = {child_index = <fake_focus_index_for_centering>}
									LaunchEvent Type = unfocus target = <menu_id>
								endif
							endif
						endif
						award_case_desc_id :se_setprops \{unblock_events}
						award_case_update_helper_pills \{is_song_lb = 0
							stats_menu = 1
							goal_name = None}
						if ($g_award_case_player_index = -1 || $g_award_case_lb_mode = overall)
							Change \{lb_offset = 0}
							award_case_get_leader_id
							if ScreenElementExists id = <leader_id>
								<leader_id> :se_setprops unblock_events
								LaunchEvent Type = focus target = <leader_id>
								if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
										param = scrollbar_id}
									generic_scrollbar_wgt_update_thumb_pos id = <scrollbar_id> index = 0
								endif
							endif
						else
							Change lb_offset = ($g_award_case_player_offset)
							if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
									param = menu_id}
								<menu_id> :se_setprops unblock_events
								LaunchEvent Type = focus target = <menu_id> data = {child_index = ($g_award_case_player_index)}
							endif
							if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
									param = scrollbar_id}
								generic_scrollbar_wgt_update_thumb_pos id = <scrollbar_id> index = ($g_award_case_player_offset)
							endif
						endif
					endif
					if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
							param = menu_id}
						<menu_id> :Obj_SpawnScriptNow award_case_wait_and_fade_in
					endif
				endif
			else
				SpawnScriptNow award_case_display_error_message params = {reason = <reason>}
			endif
		endif
	endif
	if ObjectExists \{id = awardcase}
		awardcase :awardcaseuistack_setloadingstats \{FALSE}
	endif
endscript

script award_case_wait_and_fade_in \{goal_name = qp_score_points
		has_entries = 1
		show_challenge_prompt = 0}
	printf \{channel = award_case
		qs(0x1b3aac7a)}
	Wait \{0.5
		Seconds}
	se_setprops \{alpha = 1.0
		time = 0.15}
	<default_headers_alpha> = 1.0
	<power_challenge_header_alpha> = 0.0
	if checksumequals a = <goal_name> b = qp_power_score_points
		<default_headers_alpha> = 0.0
		<power_challenge_header_alpha> = 1.0
	endif
	<stats_menu_alpha> = 0.0
	<play_challenge_prompt_alpha> = 0.0
	if (<has_entries> = 1)
		<stats_menu_alpha> = 1.0
		award_case_show_leader_row goal_name = <goal_name>
		if (<show_challenge_prompt> = 1)
			<play_challenge_prompt_alpha> = 1.0
		endif
	else
		<play_challenge_prompt_alpha> = 1.0
	endif
	award_case_desc_id :se_setprops {
		stats_menu_alpha = <stats_menu_alpha>
		play_challenge_prompt_alpha = <play_challenge_prompt_alpha>
		default_headers_alpha = <default_headers_alpha>
		power_challenge_header_alpha = <power_challenge_header_alpha>
		time = 0.15
	}
	ui_event_wait_for_safe
	ui_event_get_top
	if (<base_name> = 'award_case')
		award_case_desc_id :se_setprops \{unblock_events
			instrument_spinner_alpha = 0.0
			time = 0.1}
	else
		award_case_desc_id :se_setprops \{instrument_spinner_alpha = 0.0
			time = 0.1}
	endif
endscript

script award_case_choose_stats_menu 
	printf \{channel = award_case
		qs(0xc64b3737)}
	if NOT awardcase :awardcaseuistack_isofflinemode
		if NOT awardcase :awardcaseuistack_hasinitialized instrument_index = <instrument_index> goal_name = <goal_name>
			printf \{channel = award_case
				qs(0x9b465c15)}
			return
		endif
	endif
	if (<is_song_lb> = 1 && $g_award_case_lb_mode != friends)
		if awardcase :awardcaseuistack_isloadingstats instrument_index = <instrument_index> goal_name = <goal_name>
			printf \{channel = award_case
				qs(0xb5be769b)}
			return
		endif
	endif
	<display_rows> = []
	if ($g_award_case_lb_mode = friends || <is_song_lb> = 0)
		if GotParam \{instrument_index}
			awardcase :awardcaseuistack_getsongscores instrument_index = <instrument_index> goal_name = <goal_name>
		elseif GotParam \{challenge_id}
			awardcase :awardcaseuistack_getchallengeleaderboard challenge_index = <challenge_id>
		endif
	else
		awardcase :awardcaseuistack_getoverallsongscores
	endif
	GetArraySize \{display_rows}
	if (<array_Size> = 0)
		award_case_start_targeted_challenge challenge_name = <goal_name> instrument = <inst_config> no_scores = 1 stats_menu = 0
		return
	endif
	if award_case_desc_id :desc_resolvealias \{Name = alias_challenges_vmenu
			param = menu_id}
		<menu_id> :se_setprops block_events
	endif
	award_case_update_helper_pills is_song_lb = 0 no_goal = <no_goal> stats_menu = 1 goal_name = <goal_name>
	if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
			param = menu_id}
		ui_sfx \{menustate = leaderboard
			uitype = select}
		award_case_desc_id :obj_setintegertag \{tag_name = stats_menu
			integer_value = 1}
		award_case_desc_id :obj_setintegertag \{tag_name = is_song_lb
			integer_value = 1}
		<menu_id> :se_setprops {
			unblock_events
			replace_handlers
			event_handlers = [
				{pad_back award_case_stats_menu_back params = {is_song_lb = <is_song_lb> goal_name = <goal_name> instrument_index = <instrument_index>}}
				{pad_up award_case_lb_scroll params = {Dir = up is_song_lb = <is_song_lb> goal_name = <goal_name> instrument_index = <instrument_index> inst_config = <inst_config>}}
				{pad_down award_case_lb_scroll params = {Dir = down is_song_lb = <is_song_lb> goal_name = <goal_name> instrument_index = <instrument_index> inst_config = <inst_config>}}
			]
		}
		award_case_get_leader_id goal_name = <goal_name>
		if ScreenElementExists id = <leader_id>
			<leader_id> :se_setprops {
				unblock_events
				replace_handlers
				event_handlers = [
					{pad_back award_case_stats_menu_back params = {is_song_lb = <is_song_lb> instrument_index = <instrument_index> goal_name = <goal_name>}}
				]
			}
		endif
		if NOT award_case_desc_id :desc_resolvealias \{Name = alias_difficulty_scrollbar_wgt
				param = diff_scrollber_wgt}
			ScriptAssert \{'Unable to find alias_difficulty_scrollbar_wgt'}
		endif
		if NOT award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
				param = friends_scrollbar_wgt}
			ScriptAssert \{'Unable to find alias_friends_scrollbar'}
		endif
		if ($g_award_case_player_index = -1)
			award_case_get_leader_id goal_name = <goal_name>
			if ScreenElementExists id = <leader_id>
				LaunchEvent Type = focus target = <leader_id>
				generic_scrollbar_wgt_update_thumb_pos id = <diff_scrollber_wgt> index = 0
				generic_scrollbar_wgt_update_thumb_pos id = <friends_scrollbar_wgt> index = 0
			endif
		else
			Change lb_offset = ($g_award_case_player_offset)
			if (($g_award_case_player_index) < 0)
				award_case_get_leader_id goal_name = <goal_name>
				if ScreenElementExists id = <leader_id>
					LaunchEvent Type = focus target = <leader_id>
					generic_scrollbar_wgt_update_thumb_pos id = <diff_scrollber_wgt> index = 0
					generic_scrollbar_wgt_update_thumb_pos id = <friends_scrollbar_wgt> index = 0
				endif
			else
				<child_index> = ($g_award_case_player_index)
				if GetScreenElementChildren id = <menu_id>
					if (<children> [<child_index>]) :obj_getintegertag tag_name = rank assert = 0
						generic_scrollbar_wgt_update_thumb_pos id = <diff_scrollber_wgt> index = (<integer_value> - 1)
						generic_scrollbar_wgt_update_thumb_pos id = <friends_scrollbar_wgt> index = (<integer_value> - 1)
					endif
				endif
				LaunchEvent Type = focus target = <menu_id> data = {child_index = <child_index>}
			endif
		endif
		if GetScreenElementChildren id = <menu_id>
			GetArraySize \{children}
			if (<array_Size> > 0)
				if ($g_award_case_lb_mode = friends || <is_song_lb> = 0 || <inst_config> = Band || <inst_config> = traditional_band)
					award_case_desc_id :se_setprops \{difficulty_scroll_alpha = 0}
					<friends_scrollbar_wgt> :se_setprops alpha = 1.0 time = 0.15
				else
					<friends_scrollbar_wgt> :se_setprops alpha = 0.0
					award_case_desc_id :se_setprops \{difficulty_scroll_alpha = 1
						time = 0.15}
				endif
			endif
		endif
		award_case_scrollbar_wgt :se_setprops \{alpha = 0
			time = 0.15}
	endif
endscript

script award_case_toggle_lb_mode 
	printf \{channel = award_case
		qs(0x7893f0d9)}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if ObjectExists \{id = awardcase}
		if NOT awardcase :awardcaseuistack_isofflinemode
			if awardcase :awardcaseuistack_isawardleaderboard
				printf \{channel = award_case
					qs(0x98327172)}
				if NOT awardcase :awardcaseuistack_hasinitialized \{instrument_index = 0}
					printf \{channel = award_case
						qs(0x9cdd6205)}
					return
				endif
			endif
			ui_sfx \{menustate = leaderboard
				uitype = toggleon}
			GetNetID controller_index = ($lb_controller)
			array = [0 0]
			SetArrayElement ArrayName = array index = 0 NewValue = <net_id_first>
			SetArrayElement ArrayName = array index = 1 NewValue = <net_id_second>
			<net_id> = <array>
			if ($g_award_case_lb_mode = friends)
				Change \{g_award_case_lb_mode = overall}
				Change \{lb_offset = 0}
			elseif ($g_award_case_lb_mode = overall)
				if awardcase :awardcaseuistack_isawardleaderboard
					if awardcase :awardcaseuistack_hassongscore instrument_index = 0 player_id = <net_id>
						Change \{g_award_case_lb_mode = me}
					else
						Change \{g_award_case_lb_mode = friends}
					endif
				elseif awardcase :awardcaseuistack_hassongscore instrument_index = <instrument_index> player_id = <net_id> goal_name = <goal_name>
					Change \{g_award_case_lb_mode = me}
				else
					Change \{g_award_case_lb_mode = friends}
				endif
			else
				Change \{g_award_case_lb_mode = friends}
			endif
			award_case_update_column_name_text
			if awardcase :awardcaseuistack_isawardleaderboard
				award_case_update_helper_pills \{is_song_lb = 1
					goal_name = None}
				award_case_load_award_leaderboard_stats
			else
				<no_goal> = 1
				if ($g_award_case_lb_mode = friends)
					if GotParam \{instrument_index}
						awardcase :awardcaseuistack_getsongscores instrument_index = <instrument_index> goal_name = <goal_name>
						<display_rows> = []
						GetArraySize \{display_rows}
						if (<array_Size> > 0)
							<no_goal> = 0
						endif
					endif
				endif
				award_case_update_helper_pills is_song_lb = 1 instrument_index = <instrument_index> no_goal = <no_goal> goal_name = <goal_name>
				award_case_load_song_score_stats instrument_index = <instrument_index> goal_name = <goal_name> inst_config = <inst_config>
			endif
		endif
	endif
endscript

script award_case_lb_scroll \{is_song_lb = 1}
	if ObjectExists \{id = awardcase}
		if NOT awardcase :awardcaseuistack_isawardleaderboard
			if NOT award_case_desc_id :desc_resolvealias \{Name = alias_difficulty_scrollbar_wgt
					param = diff_scrollber_wgt}
				ScriptAssert \{'Unable to find alias_difficulty_scrollbar_wgt'}
			endif
		else
			if NOT awardcase :awardcaseuistack_hasinitialized \{instrument_index = 0}
				return
			endif
		endif
		if NOT award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
				param = friends_scrollbar_wgt}
			ScriptAssert \{'Unable to find alias_friends_scrollbar'}
		endif
		if ($g_award_case_lb_mode != friends && <is_song_lb> = 1)
			if (<Dir> = down)
				<at_the_bottom> = 0
				Change lb_offset = ($lb_offset + 1)
				if ($lb_offset >= $g_num_total_lb_rows)
					<at_the_bottom> = 1
					Change lb_offset = ($g_num_total_lb_rows - 1)
				endif
				menu_getselectedindex
				Obj_GetID
				if GetScreenElementChildren id = <objID>
					GetArraySize <children>
					if (<selected_index> = (<array_Size> - 1) && <at_the_bottom> = 0)
						DestroyScreenElement id = (<children> [0])
						award_case_add_new_rank_row parent_id = <objID> rank = ($lb_offset + 1) goal_name = <goal_name> inst_config = <inst_config> instrument_index = <instrument_index>
					endif
				endif
			elseif (<Dir> = up)
				<at_the_top> = 0
				Change lb_offset = ($lb_offset - 1)
				if ($lb_offset < 1)
					<at_the_top> = 1
					Change \{lb_offset = 0}
				endif
				menu_getselectedindex
				Obj_GetID
				if GetScreenElementChildren id = <objID>
					GetArraySize <children>
					if (<selected_index> = 0 && <at_the_top> = 0)
						<bottom_index> = (<array_Size> - 1)
						DestroyScreenElement id = (<children> [<bottom_index>])
						award_case_add_new_rank_row parent_id = <objID> rank = ($lb_offset + 1) new_index = (<array_Size> - 1) goal_name = <goal_name> inst_config = <inst_config> instrument_index = <instrument_index> is_top
					elseif (<selected_index> = 0)
						if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
								param = menu_id}
							LaunchEvent Type = unfocus target = <menu_id>
							<menu_id> :se_setprops block_events
						endif
						award_case_get_leader_id goal_name = <goal_name>
						if ScreenElementExists id = <leader_id>
							<leader_id> :se_setprops unblock_events
							ui_sfx \{menustate = leaderboard
								uitype = scrollup}
							LaunchEvent Type = focus target = <leader_id>
						endif
					endif
				endif
			endif
		else
			menu_getselectedindex
			if (<Dir> = up)
				if (<selected_index> = 0)
					if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
							param = menu_id}
						LaunchEvent Type = unfocus target = <menu_id>
						<menu_id> :se_setprops block_events
					endif
					award_case_get_leader_id goal_name = <goal_name>
					if ScreenElementExists id = <leader_id>
						<leader_id> :se_setprops unblock_events
						ui_sfx \{menustate = leaderboard
							uitype = scrollup}
						LaunchEvent Type = focus target = <leader_id>
					endif
				endif
			endif
			Obj_GetID
			if GetScreenElementChildren id = <objID>
				GetArraySize <children>
				if (<selected_index> != (<array_Size> - 1) || <Dir> = up)
				endif
			endif
		endif
	endif
endscript

script award_case_add_new_rank_row \{goal_name = qp_score_points}
	<text_rgba> = ($g_default_stats_text_rgba)
	<desc> = 'award_case_stats_entry'
	if checksumequals a = <goal_name> b = qp_power_score_points
		<desc> = 'award_case_stats_entry_powerstar'
	elseif awardcase :awardcaseuistack_isawardleaderboard
		<desc> = 'leaderboard_row'
	endif
	formatText TextName = rank_text qs(0x6a2b4870) r = <rank>
	<difficulty_alpha> = 0
	if awardcase :awardcaseuistack_getoverallsongscores <...>
		CastToInteger \{score}
		qp_get_score_string goal_name = <goal_name> score = (<row>.score)
		if checksumequals a = (<row>.difficulty) b = expert_plus
			<difficulty_icon> = icon_difficulty_expert_plus
			<difficulty_alpha> = 1
		elseif NOT checksumequals a = (<row>.difficulty) b = None
			get_difficulty_text_nl difficulty = (<row>.difficulty)
			formatText checksumName = difficulty_icon 'icon_difficulty_%i' i = <difficulty_text_nl>
			<difficulty_alpha> = 1
		endif
		<net_id> = (<row>.player_id)
		<valid> = 1
		<gamertag_text> = (<row>.gamer_tag)
		if awardcase :awardcaseuistack_isawardleaderboard
			if StructureContains structure = <row> total_time_playing_in_seconds
				<array> = []
				AddArrayElement array = <array> element = (<row>.total_time_playing_in_seconds)
				rr_get_time_string data = <array> new_format = 1
				<time_string> = <data_text>
			endif
			quickplay_get_award_rank_ui_data award_points = (<row>.score)
		elseif StructureContains structure = <row> quickplay_stars
			quickplay_get_award_rank_ui_data award_points = (<row>.quickplay_stars)
		endif
		NetSessionFunc func = get_user_id params = {controller_index = ($lb_controller)}
		if (<net_id> [0] = <user_id> [0] && <net_id> [1] = <user_id> [1])
			<text_rgba> = ($g_player_stats_text_rgba)
		endif
		if StructureContains structure = <row> song_stars
			formatText TextName = power_star_text qs(0x4d4555da) s = (<row>.song_stars)
		endif
		if StructureContains structure = <row> instrument
			if StructureContains structure = ($instrument_list) (<row>.instrument)
				<instrument> = (<row>.instrument)
				formatText checksumName = instrument_icon_texture 'icon_%i_fill' i = ($instrument_list.<instrument>.text_nl)
			endif
		endif
		if checksumequals a = <goal_name> b = qp_power_score_points
			get_local_in_game_player_num_from_controller controller_index = ($lb_controller)
			if (<player_num> = -1)
				get_controller_type controller_index = ($lb_controller)
				<inst_config> = <controller_type>
				if (<inst_config> != guitar && <inst_config> != drum && <inst_config> != vocals)
					<inst_config> = vocals
				endif
			else
				getplayerinfo <player_num> part out = inst_config
			endif
		else
			awardcase :awardcaseuistack_getcurrentsongleaderboardinfo
			<inst_config> = ($g_qp_required_challenge_props_order [<config_idx>])
		endif
		<array> = [
			{focus award_case_stats_item_focus params = {alpha = 1.0 text_rgba = ($g_default_stats_text_rgba)}}
			{unfocus award_case_stats_item_focus params = {alpha = 0.0 text_rgba = <text_rgba>}}
			{pad_option2 award_case_display_gamer_card params = {net_id = <net_id>}}
			{pad_option award_case_display_rock_record params = {net_id = <net_id> menu_id = <parent_id>}}
		]
		if NOT awardcase :awardcaseuistack_isawardleaderboard
			awardcase :awardcaseuistack_getcurrentsong
			AddArrayElement array = <array> element = {
				pad_start
				award_case_start_targeted_challenge
				params = {
					target_index = (<row>.index)
					instrument_index = <instrument_index>
					challenge_name = <goal_name>
					instrument = <inst_config>
					has_friend_scores = 1
				}
			}
			AddArrayElement array = <array> element = {
				pad_choose
				award_case_start_targeted_challenge
				params = {
					target_index = (<row>.index)
					instrument_index = <instrument_index>
					challenge_name = <goal_name>
					instrument = <inst_config>
					has_friend_scores = 1
				}
			}
		else
			AddArrayElement array = <array> element = {
				pad_choose
				award_case_display_rock_record
				params = {
					net_id = <net_id>
					menu_id = <parent_id>
				}
			}
		endif
		awardcase :awardcaseuistack_getleaderboardsizes
		if GotParam \{is_top}
			<page_trigger_point> = (((<page_size> / <page_divisor>)) - 1)
			if ((<row>.index) = <page_trigger_point>)
				<offset> = (((<row>.rank) - ((<page_size> / <page_divisor>) * (<page_divisor> / 2))) - 1)
				if (<offset> < 0)
					<offset> = 0
				endif
				readleaderboardbyoffset {
					callback = award_case_dynamic_rows_update
					callback_mode = ($g_award_case_lb_mode)
					leaderboard_id = ($current_leaderboard_id)
					offset = <offset>
					num_rows = <page_size>
				}
			endif
		elseif NOT GotParam \{no_more_entries}
			<page_trigger_point> = (((<page_size> / <page_divisor>) * (<page_divisor> - 1)) - 1)
			if ((<row>.index) = <page_trigger_point>)
				<offset> = ((<row>.rank) - ((<page_size> / <page_divisor>) * (<page_divisor> / 2)))
				if ($g_num_total_lb_rows < (<offset> + <page_size> + 1))
					<offset> = (($g_num_total_lb_rows - <page_size>) + 1)
					if (<offset> < 0)
						<offset> = 0
					endif
				endif
				readleaderboardbyoffset {
					callback = award_case_dynamic_rows_update
					callback_mode = ($g_award_case_lb_mode)
					leaderboard_id = ($current_leaderboard_id)
					offset = <offset>
					num_rows = <page_size>
				}
			endif
		endif
		CreateScreenElement {
			parent = <parent_id>
			Type = descinterface
			desc = <desc>
			autosizedims = true
			tags = {
				song = <song>
				rank = <rank>
				valid = <valid>
			}
			rank_text = <rank_text>
			gamertag_text = <gamertag_text>
			score_text = <score_text>
			date_text = <date_text>
			text_rgba = <text_rgba>
			date_text = <time_string>
			rank_number_text = <rank_number_text>
			instrument_icon_texture = <instrument_icon_texture>
			difficulty_icon_alpha = <difficulty_alpha>
			difficulty_icon_texture = <difficulty_icon>
			star_number_id_text = <power_star_text>
			event_handlers = <array>
		}
		if GotParam \{is_top}
			<parent_id> :menu_setitemindex index = <new_index> newindex = 0
		endif
	endif
endscript

script award_case_stats_menu_back 
	if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
			param = menu_id}
		if isscreenelementinfocus id = <menu_id>
			<menu_id> :se_setprops unblock_events
			LaunchEvent Type = unfocus target = <menu_id>
			<menu_id> :menu_getselectedindex
			Change g_award_case_player_index = <selected_index>
			Change g_award_case_player_offset = ($lb_offset)
		endif
		<menu_id> :se_setprops block_events
	endif
	award_case_get_leader_id goal_name = <goal_name>
	if ScreenElementExists id = <leader_id>
		if isscreenelementinfocus id = <leader_id>
			Change \{g_award_case_player_index = -1}
			<leader_id> :se_setprops unblock_events
			LaunchEvent Type = unfocus target = <leader_id>
		endif
		<leader_id> :se_setprops block_events
	endif
	award_case_desc_id :se_setprops \{difficulty_scroll_alpha = 0
		time = 0.15}
	if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
			param = friends_scrollbar_wgt}
		<friends_scrollbar_wgt> :se_setprops alpha = 0 time = 0.15
	endif
	if award_case_desc_id :desc_resolvealias \{Name = alias_challenges_vmenu
			param = menu_id}
		<menu_id> :se_setprops unblock_events
	endif
	award_case_scrollbar_wgt :se_setprops \{alpha = 1
		time = 0.15}
	award_case_desc_id :obj_setintegertag \{tag_name = stats_menu
		integer_value = 0}
	ui_sfx \{menustate = leaderboard
		uitype = back}
	award_case_update_helper_pills is_song_lb = <is_song_lb> instrument_index = <instrument_index> goal_name = <goal_name>
endscript

script award_case_stats_item_focus \{leader = 0}
	Obj_GetID
	if (<alpha> = 1.0)
		<objID> :se_setprops highlight_alpha = <alpha>
		if <objID> :obj_getintegertag tag_name = rank assert = 0
			if NOT awardcase :awardcaseuistack_isawardleaderboard
				if award_case_desc_id :desc_resolvealias \{Name = alias_difficulty_scrollbar_wgt
						param = diff_scrollber_wgt}
					generic_scrollbar_wgt_update_thumb_pos id = <diff_scrollber_wgt> index = (<integer_value> - 1)
				endif
			endif
			if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
					param = friends_scrollbar_wgt}
				generic_scrollbar_wgt_update_thumb_pos id = <friends_scrollbar_wgt> index = (<integer_value> - 1)
			endif
		endif
	else
		<objID> :se_setprops highlight_alpha = <alpha> time = 0.25
	endif
endscript

script leader_pad_down 
	if GetScreenElementChildren id = <stats_menu>
		GetArraySize \{children
			param = children_size}
		if (<children_size> > 0)
			if NOT awardcase :awardcaseuistack_isawardleaderboard
				if NOT award_case_desc_id :desc_resolvealias \{Name = alias_difficulty_scrollbar_wgt
						param = diff_scrollber_wgt}
					ScriptAssert \{'Unable to find alias_difficulty_scrollbar_wgt'}
				endif
			endif
			if NOT award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
					param = friends_scrollbar_wgt}
				ScriptAssert \{'Unable to find alias_friends_scrollbar'}
			endif
			LaunchEvent Type = unfocus target = <leader_id>
			<leader_id> :se_setprops block_events
			<stats_menu> :se_setprops unblock_events
			LaunchEvent Type = unfocus target = <stats_menu>
			LaunchEvent Type = focus target = <stats_menu> data = {child_index = 0}
			ui_sfx \{menustate = leaderboard
				uitype = scrollup}
			Change lb_offset = ($lb_offset + 1)
		endif
	endif
endscript

script award_case_settle_retrieve_stats 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Wait \{3.0
		Seconds}
	printf channel = award_case qs(0x3d01bc9b) d = <rank>
	<offset> = (<rank> - ($g_num_song_lb_rows / 2))
	if (<offset> < 0)
		<offset> = 0
	endif
	readleaderboardbyoffset {
		callback = award_case_dynamic_rows_update
		callback_mode = ($g_award_case_lb_mode)
		leaderboard_id = ($current_leaderboard_id)
		offset = <offset>
		num_rows = ($g_num_song_lb_rows)
	}
endscript

script award_case_dynamic_rows_update 
	printf \{channel = award_case
		qs(0xabe96a26)}
	if ObjectExists \{id = awardcase}
		awardcase :awardcaseuistack_getcurrentsongleaderboardinfo
		<inst_config> = ($g_qp_required_challenge_props_order [<config_idx>])
		if (<status> = succeeded)
			if (<leaderboard_id> = $current_leaderboard_id && <mode> = $g_award_case_lb_mode)
				if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
						param = menu_id}
					GetArraySize <rows>
					if (<array_Size> > 0)
						if NOT ($g_award_case_lb_mode = friends)
							awardcase :awardcaseuistack_setoverallscores rows = <rows>
							Change g_num_total_lb_rows = <total_size>
							if NOT awardcase :awardcaseuistack_isawardleaderboard
								award_case_request_quickplay_stars rows = <rows> mode = <mode> callback = award_case_overall_quickplay_ranks_dynamic_callback
							else
								if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
										param = scrollbar_id}
									generic_scrollbar_wgt_set_resolution id = <scrollbar_id> num_elements = ($g_num_total_lb_rows)
								endif
								award_case_update_visible_rows rows = <rows> goal_name = <goal_name> inst_config = <inst_config> menu_id = <menu_id>
							endif
						else
							Change g_num_total_lb_rows = <total_size>
							award_case_update_visible_rows rows = <rows> goal_name = <goal_name> inst_config = <inst_config> menu_id = <menu_id>
						endif
					endif
				endif
			endif
		else
			SpawnScriptNow award_case_display_error_message params = {reason = <reason>}
		endif
	endif
endscript

script award_case_update_visible_rows \{rows = !a1768515945
		goal_name = !q1768515945
		inst_config = !q1768515945
		menu_id = !q1768515945}
	printf \{channel = award_case
		qs(0xc6d5272a)}
	GetArraySize <rows>
	<lowest_rank> = (<rows> [0].rank)
	<highest_rank> = (<rows> [(<array_Size> - 1)].rank)
	<row_index> = 0
	if (<lowest_rank> = 1)
		award_case_dynamic_leader_update rows = <rows> goal_name = <goal_name> inst_config = <inst_config>
	endif
	if GetScreenElementChildren id = <menu_id>
		GetArraySize <children> param = children_size
		if (<children_size> > 0)
			<index> = 0
			begin
			<row_index> = 0
			<child_id> = (<children> [<index>])
			if <child_id> :GetSingleTag rank
				if (<rank> < <lowest_rank> || <rank> > <highest_rank>)
					ScriptAssert \{'Missed entries in view'}
					<text_rgba> = ($g_default_stats_text_rgba)
					<child_id> :se_setprops {
						gamertag_text = qs(0x9e0cb7ef)
						score_text = qs(0x9e0cb7ef)
						date_text = qs(0x9e0cb7ef)
						text_rgba = <text_rgba>
						difficulty_icon_alpha = 0
						replace_handlers
						event_handlers = [
							{focus award_case_stats_item_focus params = {alpha = 1.0 text_rgba = ($g_default_stats_text_rgba)}}
							{focus award_case_update_helper_pills params = {is_song_lb = 0 stats_menu = 0 no_goal = 1 goal_name = <goal_name>}}
							{focus award_case_settle_retrieve_stats params = {rank = <rank>}}
							{unfocus award_case_stats_item_focus params = {alpha = 0.0 text_rgba = <text_rgba>}}
						]
					}
					if isscreenelementinfocus id = <child_id>
						award_case_update_helper_pills is_song_lb = 0 stats_menu = 0 no_goal = 1 goal_name = <goal_name>
					endif
				else
					if (<row_index> >= 0 && <row_index> < <array_Size>)
						NetSessionFunc func = get_user_id params = {controller_index = ($lb_controller)}
						begin
						if ((<rows> [<row_index>].rank) = <rank>)
							<score> = (<rows> [<row_index>].score)
							CastToInteger \{score}
							qp_get_score_string goal_name = <goal_name> score = <score>
							<difficulty_alpha> = 0
							if StructureContains structure = (<rows> [<row_index>]) difficulty
								if checksumequals a = (<rows> [<row_index>].difficulty) b = expert_plus
									<difficulty_icon> = icon_difficulty_expert_plus
									<difficulty_alpha> = 1
								elseif NOT checksumequals a = (<rows> [<row_index>].difficulty) b = None
									get_difficulty_text_nl difficulty = (<rows> [<row_index>].difficulty)
									formatText checksumName = difficulty_icon 'icon_difficulty_%i' i = <difficulty_text_nl>
									<difficulty_alpha> = 1
								endif
							endif
							net_id = (<rows> [<row_index>].player_id)
							<text_rgba> = ($g_default_stats_text_rgba)
							if (<net_id> [0] = <user_id> [0] && <net_id> [1] = <user_id> [1])
								<text_rgba> = ($g_player_stats_text_rgba)
							endif
							<text_rgba_now> = <text_rgba>
							if isscreenelementinfocus id = <child_id>
								<text_rgba_now> = ($g_default_stats_text_rgba)
							endif
							<event_handlers> = [
								{focus award_case_stats_item_focus params = {alpha = 1.0 text_rgba = ($g_default_stats_text_rgba)}}
								{focus award_case_update_helper_pills params = {is_song_lb = 0 stats_menu = 1 goal_name = <goal_name>}}
								{unfocus award_case_stats_item_focus params = {alpha = 0.0 text_rgba = <text_rgba>}}
								{pad_option2 award_case_display_gamer_card params = {net_id = <net_id>}}
								{pad_option award_case_display_rock_record params = {net_id = <net_id> menu_id = <menu_id>}}
							]
							if NOT awardcase :awardcaseuistack_isawardleaderboard
								AddArrayElement array = <event_handlers> element = {
									pad_start
									award_case_start_targeted_challenge
									params = {
										target_index = <row_index>
										challenge_name = <goal_name>
										instrument = <inst_config>
										has_friend_scores = 1
									}
								}
								AddArrayElement array = <array> element = {
									pad_choose
									award_case_start_targeted_challenge
									params = {
										target_index = <row_index>
										challenge_name = <goal_name>
										instrument = <inst_config>
										has_friend_scores = 1
									}
								}
								<event_handlers> = <array>
							else
								AddArrayElement array = <event_handlers> element = {
									pad_choose
									award_case_display_rock_record
									params = {
										net_id = <net_id>
										menu_id = <menu_id>
									}
								}
								<event_handlers> = <array>
								if StructureContains structure = (<rows> [<row_index>]) total_time_playing_in_seconds
									<array> = []
									AddArrayElement array = <array> element = (<rows> [<row_index>].total_time_playing_in_seconds)
									rr_get_time_string data = <array> new_format = 1
									<time_string> = <data_text>
								endif
								quickplay_get_award_rank_ui_data award_points = <score>
							endif
							<child_id> :se_setprops {
								gamertag_text = (<rows> [<row_index>].gamer_tag)
								score_text = <score_text>
								text_rgba = <text_rgba_now>
								difficulty_icon_alpha = <difficulty_alpha>
								difficulty_icon_texture = <difficulty_icon>
								date_text = <time_string>
								rank_number_text = <rank_number_text>
								rank_container_texture = <rank_container_texture>
								rank_container_dims = <rank_container_dims>
								replace_handlers
								event_handlers = <event_handlers>
							}
							<row_index> = (<row_index> + 1)
							if isscreenelementinfocus id = <child_id>
								award_case_update_helper_pills is_song_lb = 0 stats_menu = 1 goal_name = <goal_name>
							endif
							break
						endif
						<row_index> = (<row_index> + 1)
						repeat <array_Size>
					endif
				endif
			endif
			<index> = (<index> + 1)
			repeat <children_size>
		endif
	endif
endscript

script award_case_dynamic_leader_update \{rows = !a1768515945}
	award_case_get_leader_id goal_name = <goal_name>
	if ScreenElementExists id = <leader_id>
		<score> = (<rows> [0].score)
		CastToInteger \{score}
		qp_get_score_string goal_name = <goal_name> score = <score>
		<difficulty_alpha> = 0
		if StructureContains structure = (<rows> [0]) difficulty
			if checksumequals a = (<rows> [0].difficulty) b = expert_plus
				<difficulty_icon> = icon_difficulty_expert_plus
				<difficulty_alpha> = 1
			elseif NOT checksumequals a = (<rows> [0].difficulty) b = None
				get_difficulty_text_nl difficulty = (<rows> [0].difficulty)
				formatText checksumName = difficulty_icon 'icon_difficulty_%i' i = <difficulty_text_nl>
				<difficulty_alpha> = 1
			endif
		endif
		<net_id> = (<rows> [0].player_id)
		<text_rgba> = ($g_default_stats_text_rgba)
		NetSessionFunc func = get_user_id params = {controller_index = ($lb_controller)}
		if (<net_id> [0] = <user_id> [0] && <net_id> [1] = <user_id> [1])
			<text_rgba> = ($g_player_stats_text_rgba)
		endif
		<event_handlers> = [
			{pad_option2 award_case_display_gamer_card params = {net_id = <net_id>}}
			{pad_option award_case_display_rock_record params = {net_id = <net_id> menu_id = <leader_id>}}
		]
		if NOT awardcase :awardcaseuistack_isawardleaderboard
			AddArrayElement array = <event_handlers> element = {
				pad_start
				award_case_start_targeted_challenge
				params = {
					target_index = 0
					challenge_name = <goal_name>
					instrument = <inst_config>
					has_friend_scores = 1
				}
			}
			AddArrayElement array = <array> element = {
				pad_choose
				award_case_start_targeted_challenge
				params = {
					target_index = 0
					challenge_name = <goal_name>
					instrument = <inst_config>
					has_friend_scores = 1
				}
			}
			<event_handlers> = <array>
		else
			AddArrayElement array = <event_handlers> element = {
				pad_choose
				award_case_display_rock_record
				params = {
					net_id = <net_id>
					menu_id = <leader_id>
				}
			}
			<event_handlers> = <array>
			if StructureContains structure = (<rows> [0]) total_time_playing_in_seconds
				<array> = []
				AddArrayElement array = <array> element = (<rows> [0].total_time_playing_in_seconds)
				rr_get_time_string data = <array> new_format = 1
				<time_string> = <data_text>
			endif
			quickplay_get_award_rank_ui_data award_points = <score>
		endif
		<leader_id> :se_setprops {
			gamertag_text = (<rows> [0].gamer_tag)
			score_text = <score_text>
			text_rgba = <text_rgba>
			difficulty_icon_alpha = <difficulty_alpha>
			difficulty_icon_texture = <difficulty_icon>
			date_text = <time_string>
			rank_number_text = <rank_number_text>
			rank_container_texture = <rank_container_texture>
			rank_container_dims = <rank_container_dims>
			replace_handlers
			event_handlers = <event_handlers>
		}
	endif
endscript

script award_case_retrieve_offline_data 
	printf \{channel = award_case
		qs(0x6ffc238e)}
	<fullname> = qs(0x03ac90f0)
	NetSessionFunc \{func = match_init}
	if isxenonorwindx
		NetSessionFunc Obj = match func = get_gamertag params = {controller = <device_num>}
		<fullname> = <Name>
	elseif NetSessionFunc Obj = match func = get_gamertag params = {controller = <device_num>}
		<fullname> = <Name>
	endif
	if LocalizedStringEquals a = <fullname> b = qs(0x03ac90f0)
		formatText TextName = fullname qs(0x72f23aff) d = ($lb_controller + 1)
	endif
	quickplay_get_overall_awards_progress
	if awardcase :awardcaseuistack_isawardleaderboard
		if (<current_award_points_total> > 0)
			awardcase :awardcaseuistack_setsongscores rows = [{score = <current_award_points_total> player_id = [0 0] gamer_tag = <fullname> difficulty = easy}] instrument_index = 0
		endif
		award_case_desc_id :se_setprops \{instrument_spinner_alpha = 0.0}
	else
		awardcase :awardcaseuistack_getcurrentsong
		getsavegamefromcontroller controller = ($lb_controller)
		GetGlobalTags savegame = <savegame> <song>
		get_local_in_game_player_num_from_controller controller_index = ($lb_controller)
		if (<player_num> = -1)
			get_controller_type controller_index = ($lb_controller)
			<part> = <controller_type>
			if (<part> != guitar && <part> != drum && <part> != vocals)
				<part> = vocals
			endif
		else
			getplayerinfo <player_num> part
		endif
		gman_getsongchallengeprops song_name = <song> instrument = <part>
		<challenge_configs> = ($g_qp_required_challenge_props_order)
		GetArraySize <challenge_configs>
		<config_size> = <array_Size>
		<config_size> = (<config_size> - 1)
		<config_idx> = 0
		<challenges_data> = []
		<challenges_index> = 1
		begin
		<config> = (<challenge_configs> [<config_idx>])
		if StructureContains structure = challenge_props <config>
			GetArraySize (<challenge_props>.<config>)
			if (<array_Size> > 0)
				<index> = 0
				begin
				formatText checksumName = score_checksum 'challenge%s_best_score' s = <challenges_index> integer_width = 2
				formatText checksumName = diff_checksum 'challenge%s_best_diff' s = <challenges_index> integer_width = 2
				<score_value> = (<...>.<score_checksum>)
				<diff_value> = (<...>.<diff_checksum>)
				switch (<diff_value>)
					case 0
					<difficulty> = easy
					case 1
					<difficulty> = medium
					case 2
					<difficulty> = hard
					case 3
					<difficulty> = expert
					case 4
					<difficulty> = expert_plus
					default
					ScriptAssert \{'Invalid difficulty value from saved challenge data'}
				endswitch
				<goal_name> = (<challenge_props>.<config> [<index>].goal_name)
				if ((checksumequals a = <goal_name> b = qp_score_points) || (checksumequals a = <goal_name> b = qp_score_points_band) || (checksumequals a = <goal_name> b = qp_score_points_stdband))
					if (<score_value> != 0)
						<temp_config_index> = <config_idx>
						<temp_inst_config> = <inst_config>
						if ((checksumequals a = <goal_name> b = qp_score_points_stdband) && <config> = Band)
							<temp_config_index> = (<config_idx> + 1)
						endif
						awardcase :awardcaseuistack_setsongscores rows = [{score = (<...>.<score_checksum>) player_id = [0 0] gamer_tag = <fullname> difficulty = <difficulty>}] instrument_index = <temp_config_index>
					endif
					<challenges_index> = (<challenges_index> + 1)
				else
					if checksumequals a = <goal_name> b = qp_power_score_points
						if (<qp_power_best_score> != 0)
							formatText checksumName = grade_checksum 'challenge%s_grade' s = <challenges_index> integer_width = 2
							<power_score> = <qp_power_best_score>
							<power_difficulty> = <qp_power_best_diff>
							switch (<qp_power_best_diff>)
								case 0
								<power_difficulty> = easy
								case 1
								<power_difficulty> = medium
								case 2
								<power_difficulty> = hard
								case 3
								<power_difficulty> = expert
								case 4
								<power_difficulty> = expert_plus
								default
								ScriptAssert \{'Invalid difficulty value from saved challenge data'}
							endswitch
							switch (<qp_power_best_instrument>)
								case 4
								<power_instrument> = guitar
								case 3
								<power_instrument> = bass
								case 2
								<power_instrument> = drum
								case 1
								<power_instrument> = vocals
								default
								ScriptAssert \{'Invalid difficulty value from saved challenge data'}
							endswitch
							<power_stars> = <qp_power_best_stars>
						endif
					else
						<challenges_index> = (<challenges_index> + 1)
						if (<score_value> != 0)
							AddArrayElement array = <challenges_data> element = {valid = 1 challenge_score = <score_value> challenge_config = <config_idx> challenge_id = 1 difficulty = <difficulty>}
						else
							AddArrayElement array = <challenges_data> element = {valid = 0 challenge_score = <score_value> challenge_config = <config_idx> challenge_id = 0 difficulty = <difficulty>}
						endif
						<challenges_data> = <array>
					endif
				endif
				<index> = (<index> + 1)
				repeat <array_Size>
			endif
		endif
		<config_idx> = (<config_idx> + 1)
		repeat <config_size>
		awardcase :awardcaseuistack_setfriendquickplaystars rows = [{score = <current_award_points_total> player_id = [0 0] gamer_tag = <fullname>}]
		awardcase :awardcaseuistack_setchallengedata {
			rows = [
				{
					gamer_tag = <fullname>
					player_id = [0 0]
					score = <power_score>
					difficulty = <power_difficulty>
					song_stars = <power_stars>
					power_instrument = <power_instrument>
					challenges = <challenges_data>
				}
			]
		}
	endif
endscript

script award_case_setup_challenge_menus \{return_from_song = !i1768515945}
	printf \{channel = award_case
		qs(0x0dcce442)}
	get_local_in_game_player_num_from_controller controller_index = ($lb_controller)
	if (<player_num> = -1)
		get_controller_type controller_index = ($lb_controller)
		<part> = <controller_type>
		if (<part> != guitar && <part> != drum && <part> != vocals)
			<part> = vocals
		endif
	else
		getplayerinfo <player_num> part
	endif
	<band_config_first> = 0
	<power_score_last> = 0
	getnumplayersingame
	if (<num_players> > 1)
		<power_score_last> = 1
		<band_config_first> = 1
	endif
	awardcase :awardcaseuistack_getcurrentsong
	if award_case_desc_id :desc_resolvealias \{Name = alias_challenges_vmenu
			param = menu_id}
		award_case_desc_id :GetSingleTag \{song}
		gman_getsongchallengeprops song_name = <song> instrument = <part>
		get_song_difficulty_ratings song = <song>
		getsavegamefromcontroller controller = ($lb_controller)
		GetGlobalTags savegame = <savegame> <song>
		<qp_power_score_points_id> = None
		if (<part> = guitar && <guitar_difficulty_rating> = 0)
			<power_score_last> = 1
		elseif (<part> = bass && <bass_difficulty_rating> = 0)
			<power_score_last> = 1
		elseif (<part> = vocals && <vocals_difficulty_rating> = 0)
			<power_score_last> = 1
		elseif (<part> = drum && <drums_difficulty_rating> = 0)
			<power_score_last> = 1
		endif
		<challenge_configs> = ($g_qp_required_challenge_props_order)
		GetArraySize <challenge_configs>
		<config_size> = <array_Size>
		<config_size> = (<config_size> - 1)
		<config_idx> = 0
		<num_challenges> = 0
		<matching_config_index> = 0
		<band_config_index> = 0
		<std_band_config_index> = 0
		<num_menu_items> = 0
		<challenge_save_index> = 1
		begin
		<config> = (<challenge_configs> [<config_idx>])
		<inst_config> = ($g_qp_required_challenge_props_order [<config_idx>])
		<skip_config> = 0
		if (<inst_config> = guitar && <guitar_difficulty_rating> = 0)
			<skip_config> = 1
		elseif (<inst_config> = bass && <bass_difficulty_rating> = 0)
			<skip_config> = 1
		elseif (<inst_config> = vocals && <vocals_difficulty_rating> = 0)
			<skip_config> = 1
		elseif (<inst_config> = drum && <drums_difficulty_rating> = 0)
			<skip_config> = 1
		endif
		if StructureContains structure = challenge_props <config>
			GetArraySize (<challenge_props>.<config>)
			if (<array_Size> > 0)
				<index> = 0
				begin
				if (<skip_config> = 0)
					if award_case_validate_goal_name goal_name = (<challenge_props>.<config> [<index>].goal_name)
						get_local_in_game_player_num_from_controller controller_index = ($lb_controller)
						quickplay_get_challenge_name_string_from_checksum goal_name = (<challenge_props>.<config> [<index>].goal_name) Player = <player_num>
						challenge_text = <challenge_desc_string>
						<config_text> = ($g_qp_challenge_instrument_strings [<config_idx>])
						awardcase :awardcaseuistack_getcurrentsong
						goal_name = (<challenge_props>.<config> [<index>].goal_name)
						if StructureContains structure = (<challenge_props>.<inst_config> [<index>]) desc_txt_override
							<challenge_text> = (<challenge_props>.<inst_config> [<index>].desc_txt_override)
						endif
						if (<challenge_save_index> < 10)
							formatText checksumName = grade_checksum 'challenge0%s_grade' s = <challenge_save_index>
						else
							formatText checksumName = grade_checksum 'challenge%s_grade' s = <challenge_save_index>
						endif
						<challenge_grade> = (<...>.<grade_checksum>)
						<frame_alpha> = 1
						<frame_effects_alpha> = 0
						<icon_full_alpha> = 1
						<top_icon_alpha> = 0
						if (<goal_name> = qp_power_score_points)
							<frame_texture> = ac_wgt_vinyl_frame
							<frame_effects_alpha> = 0
						else
							if (<challenge_grade> = 0)
								<frame_texture> = ac_wgt_vinyl_frame
								<frame_effects_alpha> = 0
							elseif (<challenge_grade> = 1)
								<frame_texture> = ac_wgt_gold_frame
								<frame_effects_alpha> = 1
							elseif (<challenge_grade> = 2)
								<frame_texture> = ac_wgt_silver_frame
								<frame_effects_alpha> = 1
							elseif (<challenge_grade> = 3)
								<frame_texture> = ac_wgt_diamond_frame
								<frame_effects_alpha> = 1
							endif
						endif
						quickplay_get_challenge_icon base_name = <goal_name>
						if NOT checksumequals a = <goal_name> b = qp_power_score_points
							<top_icon_alpha> = 1
							<bottom_icon_alpha> = 1
							<top_icon_rgb> = [255 255 255 255]
							<bottom_icon_rgb> = black
							if (<inst_config> = Band || <inst_config> = traditional_band)
								<config_icon_texture> = icon_band_sm
								<config_icon_top_texture> = icon_band_sm
							else
								formatText checksumName = config_icon_texture 'icon_%i_out' i = ($instrument_list.<inst_config>.text_nl)
								formatText checksumName = config_icon_top_texture 'icon_%i_fill' i = ($instrument_list.<inst_config>.text_nl)
							endif
						else
							<top_icon_alpha> = 0
							<bottom_icon_alpha> = 0
						endif
						CreateScreenElement {
							parent = <menu_id>
							Type = descinterface
							desc = 'award_case_challenge_entry'
							autosizedims = true
							frame_highlight_alpha = 0
							challenge_entry_icon_texture = <icon_name>
							challenge_level_border_texture = <frame_texture>
							challenge_level_alpha = <frame_alpha>
							frame_effects_alpha = <frame_effects_alpha>
							diamondbling1_alpha = <diamondbling1_alpha>
							diamondbling2_alpha = <diamondbling2_alpha>
							icon_instrument_out_texture = <config_icon_texture>
							icon_instrument_bass_fill_texture = <config_icon_top_texture>
							icon_rgba = <icon_fill>
							icon_alpha = <icon_full_alpha>
							icon_instrument_out_rgba = <bottom_icon_rgb>
							icon_instrument_out_alpha = <top_icon_alpha>
							icon_instrument_bass_fill_rgba = <top_icon_rgb>
							icon_instrument_bass_fill_alpha = <bottom_icon_alpha>
							tags = {
								goal_name = <goal_name>
								instrument = <inst_config>
							}
						}
						if <id> :desc_resolvealias Name = alias_diamondbling1 param = diamondbling1_id
							<diamondbling1_id> :obj_spawnscript anim_bling_small_002
						else
							ScriptAssert \{'pdetrich'}
						endif
						if <id> :desc_resolvealias Name = alias_diamondbling2 param = diamondbling2_id
							<diamondbling2_id> :obj_spawnscript anim_bling_small_002
						else
							ScriptAssert \{'pdetrich'}
						endif
						gman_getchallengetargets song_name = <song> goal_name = <goal_name> instrument = <inst_config>
						if ((checksumequals a = <goal_name> b = qp_score_points)
								|| (checksumequals a = <goal_name> b = qp_score_points_band)
								|| (checksumequals a = <goal_name> b = qp_score_points_stdband)
								|| (checksumequals a = <goal_name> b = qp_power_score_points))
							<temp_config_index> = <config_idx>
							<temp_inst_config> = <inst_config>
							if ((checksumequals a = <goal_name> b = qp_score_points_stdband) && <inst_config> = Band)
								<temp_config_index> = (<config_idx> + 1)
								<temp_inst_config> = traditional_band
							endif
							<event_handlers> = [
								{focus award_case_challenge_item_focus params = {is_song_lb = 1 is_focus = 1 instrument_index = <temp_config_index> config = <temp_inst_config> config_text = <config_text> goal_name = <goal_name> challenge_text = <challenge_text> challenge_targets = <challenge_targets> challenge_grade = <challenge_grade>}}
								{focus award_case_load_song_score_stats params = {instrument_index = <temp_config_index> goal_name = <goal_name> inst_config = <temp_inst_config>}}
								{unfocus award_case_challenge_item_focus params = {}}
								{pad_choose award_case_choose_stats_menu params = {is_song_lb = 1 instrument_index = <temp_config_index> goal_name = <goal_name> inst_config = <temp_inst_config>}}
								{pad_option award_case_toggle_lb_mode params = {instrument_index = <temp_config_index> goal_name = <goal_name> inst_config = <temp_inst_config>}}
								{pad_start award_case_start_targeted_challenge params = {challenge_name = <goal_name> instrument = <temp_inst_config> stats_menu = 0}}
							]
						else
							<event_handlers> = [
								{focus award_case_challenge_item_focus params = {is_song_lb = 0 challenge_id = <num_challenges> is_focus = 1 config = <inst_config> config_text = <config_text> goal_name = <goal_name> challenge_text = <challenge_text> challenge_targets = <challenge_targets> challenge_grade = <challenge_grade>}}
								{focus award_case_load_challenge_stats params = {challenge_id = <num_challenges> goal_name = <goal_name> inst_config = <inst_config>}}
								{unfocus award_case_challenge_item_focus params = {}}
								{pad_choose award_case_choose_stats_menu params = {challenge_id = <num_challenges> is_song_lb = 0 goal_name = <goal_name> inst_config = <inst_config>}}
								{pad_start award_case_start_targeted_challenge params = {challenge_name = <goal_name> instrument = <inst_config> stats_menu = 0}}
							]
						endif
						<id> :se_setprops {
							event_handlers = <event_handlers>
						}
						if checksumequals a = <goal_name> b = qp_power_score_points
							if checksumequals a = <qp_power_score_points_id> b = None
								<qp_power_score_points_id> = <id>
							endif
						endif
						if checksumequals a = <config> b = <part>
							<menu_id> :menu_setitemindex index = <num_menu_items> newindex = <matching_config_index>
							<matching_config_index> = (<matching_config_index> + 1)
						elseif (<band_config_first> = 1 && (<config> = Band || <config> = traditional_band))
							<menu_index> = 0
							if is_traditional_game
								if GotParam \{temp_inst_config}
									if (<temp_inst_config> = traditional_band)
										<menu_index> = <std_band_config_index>
										<band_config_index> = (<band_config_index> + 1)
										<std_band_config_index> = (<std_band_config_index> + 1)
									else
										<menu_index> = <band_config_index>
										<band_config_index> = (<band_config_index> + 1)
									endif
								elseif (<config> = traditional_band)
									<menu_index> = <std_band_config_index>
									<band_config_index> = (<band_config_index> + 1)
									<std_band_config_index> = (<std_band_config_index> + 1)
								else
									<menu_index> = <band_config_index>
									<band_config_index> = (<band_config_index> + 1)
								endif
							else
								if GotParam \{temp_inst_config}
									if (<temp_inst_config> = Band)
										<menu_index> = <band_config_index>
										<band_config_index> = (<band_config_index> + 1)
										<std_band_config_index> = (<std_band_config_index> + 1)
									else
										<menu_index> = <std_band_config_index>
										<std_band_config_index> = (<std_band_config_index> + 1)
									endif
								elseif (<config> = Band)
									<menu_index> = <band_config_index>
									<band_config_index> = (<band_config_index> + 1)
									<std_band_config_index> = (<std_band_config_index> + 1)
								else
									<menu_index> = <std_band_config_index>
									<std_band_config_index> = (<std_band_config_index> + 1)
								endif
							endif
							<menu_id> :menu_setitemindex index = <num_menu_items> newindex = <menu_index>
						endif
						<num_menu_items> = (<num_menu_items> + 1)
					endif
				endif
				if NOT checksumequals a = (<challenge_props>.<config> [<index>].goal_name) b = qp_power_score_points
					<challenge_save_index> = (<challenge_save_index> + 1)
				endif
				if NOT checksumequals a = (<challenge_props>.<config> [<index>].goal_name) b = qp_score_points
					if NOT checksumequals a = (<challenge_props>.<config> [<index>].goal_name) b = qp_score_points_band
						if NOT checksumequals a = (<challenge_props>.<config> [<index>].goal_name) b = qp_score_points_stdband
							if NOT checksumequals a = (<challenge_props>.<config> [<index>].goal_name) b = qp_power_score_points
								<num_challenges> = (<num_challenges> + 1)
							endif
						endif
					endif
				endif
				<index> = (<index> + 1)
				repeat <array_Size>
			endif
		endif
		<config_idx> = (<config_idx> + 1)
		repeat <config_size>
		if NOT checksumequals a = <qp_power_score_points_id> b = None
			if (<power_score_last> = 0)
				<menu_id> :menu_setitemindex id = <qp_power_score_points_id> newindex = 0
			else
				<menu_id> :menu_setitemindex id = <qp_power_score_points_id> newindex = (<num_menu_items> - 1)
			endif
		endif
		generic_scrollbar_wgt_set_resolution id = award_case_scrollbar_wgt num_elements = <num_menu_items>
		generic_scrollbar_wgt_update_thumb_pos \{id = award_case_scrollbar_wgt
			index = 0}
		if (<return_from_song> = 1)
			if GetScreenElementChildren id = <menu_id>
				GetArraySize \{children}
				if (<array_Size> > 0)
					if GMan_GoalIsActive \{goal = quickplay}
						gman_getdata \{goal = quickplay
							Name = targeted_challenge}
						gman_getdata \{goal = quickplay
							Name = targeted_challenge_inst_config}
						<i> = 0
						begin
						if (<children> [<i>]) :obj_getchecksumtag tag_name = instrument assert = 0
							if (<checksum_value> = <targeted_challenge_inst_config>
									|| (<checksum_value> = Band && <targeted_challenge_inst_config> = traditional_band)
									|| (<checksum_value> = traditional_band && <targeted_challenge_inst_config> = Band))
								if (<children> [<i>]) :obj_getchecksumtag tag_name = goal_name assert = 0
									if (<targeted_challenge> = <checksum_value>)
										ui_event_add_params selected_index = <i>
										break
									endif
								endif
							endif
						endif
						<i> = (<i> + 1)
						repeat <array_Size>
					endif
				endif
			endif
		endif
	endif
endscript

script award_case_validate_goal_name \{goal_name = !q1768515945}
	GetArraySize ($g_net_live_invalid_goals)
	if (<array_Size> > 0)
		<index> = 0
		begin
		if checksumequals a = ($g_net_live_invalid_goals [<index>]) b = <goal_name>
			return \{FALSE}
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
	endif
	return \{true}
endscript

script award_case_display_gamer_card 
	if NOT isps3
		if (<net_id> [0] != 0 && <net_id> [1] != 0)
			if CheckForSignIn controller_index = <device_num> network_platform_only
				rock_record_show_gamercard net_id = <net_id> device_num = <device_num>
			else
				if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
						param = menu_id}
					<menu_id> :se_setprops block_events
				endif
				SpawnScriptNow \{award_case_display_error_message}
			endif
		endif
	endif
endscript

script award_case_display_rock_record 
	if (<net_id> [0] != 0 && <net_id> [1] != 0)
		if CheckForSignIn controller_index = <device_num> network_platform_only
			ui_sfx \{menustate = leaderboard
				uitype = select}
			display_rock_record net_id = <net_id> unfocus_id = <menu_id> device_num = <device_num>
		else
			if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
					param = menu_id}
				<menu_id> :se_setprops block_events
			endif
			SpawnScriptNow \{award_case_display_error_message}
		endif
	endif
endscript

script award_case_start_targeted_challenge \{challenge_name = !q1768515945
		instrument = !q1768515945
		has_friend_scores = 0
		no_scores = 0
		enable_warnings = 1
		check_playlist = 1
		stats_menu = 1
		only_back = 0
		new_difficulty = None
		new_instrument = None
		stats_entry_objid = None}
	Obj_GetID
	printf channel = award_case qs(0x5db445be) d = <objID>
	if awardcase :awardcaseuistack_istargetingenabled
		award_case_desc_id :se_setprops \{block_events}
		if checksumequals a = <stats_entry_objid> b = None
			printf channel = award_case qs(0x90101343) d = <objID>
			<stats_entry_objid> = <objID>
			<stats_entry_objid> :se_setprops block_events
			printf channel = award_case qs(0xab6eda97) d = <stats_entry_objid>
		endif
		if (<check_playlist> = 1)
			if display_target_challenge_playlist_warning
				if (<has_friend_scores> = 0 && <no_scores> = 0)
					if award_case_desc_id :desc_resolvealias \{Name = alias_challenges_vmenu
							param = menu_id}
						<menu_id> :se_setprops block_events
					endif
				else
					if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
							param = menu_id}
						<menu_id> :se_setprops block_events
					endif
				endif
				printf channel = award_case qs(0xab6eda97) d = <stats_entry_objid>
				<stats_entry_objid> :se_setprops block_events
				ui_sfx \{menustate = leaderboard
					uitype = negativeselect}
				create_dialog_box {
					heading_text = <heading_text>
					body_text = <body_text>
					player_device = ($lb_controller)
					back_button_script = award_case_cancel_targeted_challenge
					back_button_params = {menu_id = <menu_id> objID = <stats_entry_objid> stats_menu = <stats_menu> only_back = <only_back> no_scores = <no_scores>}
					options = [
						{
							func = award_case_cancel_targeted_challenge
							func_params = {menu_id = <menu_id> objID = <stats_entry_objid> stats_menu = <stats_menu> only_back = <only_back> no_scores = <no_scores>}
							text = <cancel_text>
						}
						{
							func = award_case_start_targeted_challenge
							func_params = {
								challenge_name = <challenge_name>
								instrument = <instrument>
								target_index = <target_index>
								has_friend_scores = <has_friend_scores>
								instrument_index = <instrument_index>
								challenge_id = <challenge_id>
								check_playlist = 0
								stats_entry_objid = <stats_entry_objid>
								stats_menu = <stats_menu>
								no_scores = <no_scores>
							}
							text = <continue_text>
						}
					]
				}
				return
			endif
		endif
		if (<has_friend_scores> = 1)
			printf \{channel = award_case
				qs(0x3d87dd32)}
			if GotParam \{challenge_id}
				printf \{channel = award_case
					qs(0x354e837a)}
				awardcase :awardcaseuistack_getchallengeleaderboard challenge_index = <challenge_id>
				<friend_scores> = <display_rows>
			elseif ($g_award_case_lb_mode = friends)
				printf \{channel = award_case
					qs(0xb0172cbc)}
				if GotParam \{instrument_index}
					printf \{channel = award_case
						qs(0x1887098f)}
					awardcase :awardcaseuistack_getsongscores instrument_index = <instrument_index> goal_name = <challenge_name>
					<friend_scores> = <display_rows>
				endif
			else
				printf \{channel = award_case
					qs(0x9ecc7849)}
				awardcase :awardcaseuistack_getoverallsongscores
				<friend_scores> = <display_rows>
			endif
		endif
		awardcase :awardcaseuistack_getcurrentsong
		if (<enable_warnings> = 1)
			if display_target_challenge_config_warning {
					target_scores = <friend_scores>
					goal_name = <challenge_name>
					target_index = <target_index>
					instrument = <instrument>
					controller = ($lb_controller)
					song = <song>
				}
				if (<has_friend_scores> = 0 && <no_scores> = 0)
					if award_case_desc_id :desc_resolvealias \{Name = alias_challenges_vmenu
							param = menu_id}
						<menu_id> :se_setprops block_events
					endif
				else
					if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
							param = menu_id}
						<menu_id> :se_setprops block_events
					endif
				endif
				printf channel = award_case qs(0xab6eda97) d = <stats_entry_objid>
				<stats_entry_objid> :se_setprops block_events
				if (<remove_targeted_challenge> = 1)
					<has_friend_scores> = 0
					<friend_scores> = []
					<target_index> = -1
					<challenge_name> = NULL
					<instrument> = NULL
				endif
				<continue_script> = award_case_start_targeted_challenge
				<continue_script_params> = {
					challenge_name = <challenge_name>
					instrument = <instrument>
					friend_scores = <friend_scores>
					target_index = <target_index>
					has_friend_scores = <has_friend_scores>
					stats_entry_objid = <stats_entry_objid>
					instrument_index = <instrument_index>
					challenge_id = <challenge_id>
					stats_menu = <stats_menu>
					only_back = <only_back>
					enable_warnings = 0
					check_playlist = 0
					no_scores = <no_scores>
				}
				<cancel_script> = <continue_script>
				<cancel_script_params> = {
					challenge_name = <challenge_name>
					instrument = <instrument>
					friend_scores = <friend_scores>
					target_index = <target_index>
					new_difficulty = <target_difficulty>
					new_instrument = <instrument>
					has_friend_scores = <has_friend_scores>
					stats_entry_objid = <stats_entry_objid>
					instrument_index = <instrument_index>
					challenge_id = <challenge_id>
					stats_menu = <stats_menu>
					only_back = <only_back>
					enable_warnings = 0
					check_playlist = 0
					no_scores = <no_scores>
				}
				if (<can_switch_instrument> = 0)
					<cancel_script> = award_case_cancel_targeted_challenge
					<cancel_script_params> = {menu_id = <menu_id> objID = <stats_entry_objid> stats_menu = <stats_menu> only_back = <only_back> no_scores = <no_scores>}
					<continue_script_params> = {
						challenge_name = <challenge_name>
						instrument = <instrument>
						friend_scores = <friend_scores>
						target_index = <target_index>
						has_friend_scores = <has_friend_scores>
						stats_entry_objid = <stats_entry_objid>
						instrument_index = <instrument_index>
						challenge_id = <challenge_id>
						stats_menu = <stats_menu>
						only_back = <only_back>
						enable_warnings = 0
						check_playlist = 0
						no_scores = <no_scores>
					}
				endif
				ui_sfx \{menustate = leaderboard
					uitype = negativeselect}
				if (<single_option> = 0)
					create_dialog_box {
						heading_text = <heading_text>
						body_text = <body_text>
						player_device = ($lb_controller)
						options = [
							{
								func = <continue_script>
								func_params = <continue_script_params>
								text = <continue_text>
							}
							{
								func = <cancel_script>
								func_params = <cancel_script_params>
								text = <cancel_text>
							}
						]
						back_button_script = award_case_cancel_targeted_challenge
						back_button_params = {menu_id = <menu_id> objID = <stats_entry_objid> stats_menu = <stats_menu> only_back = <only_back> no_scores = <no_scores>}
					}
				else
					create_dialog_box {
						heading_text = <heading_text>
						body_text = <body_text>
						player_device = ($lb_controller)
						options = [
							{
								func = <cancel_script>
								func_params = <cancel_script_params>
								text = <cancel_text>
							}
						]
						back_button_script = award_case_cancel_targeted_challenge
						back_button_params = {menu_id = <menu_id> objID = <stats_entry_objid> stats_menu = <stats_menu> only_back = <only_back> no_scores = <no_scores>}
					}
				endif
				return
			endif
		endif
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			if playerinfoequals <Player> controller = ($lb_controller)
				if (<new_difficulty> != None)
					if (<new_difficulty> = expert_plus)
						setplayerinfo <Player> difficulty = expert
						setplayerinfo <Player> double_kick_drum = 1
					else
						setplayerinfo <Player> difficulty = <new_difficulty>
					endif
				endif
				if (<new_instrument> != None && <new_instrument> != Band)
					setplayerinfo <Player> part = <new_instrument>
					get_progression_instrument_user_option controller = ($lb_controller) option = 'guitar_bass_flip'
					guitar_bass_flip = <user_option>
					if (<guitar_bass_flip> != <new_instrument>)
						band_lobby_set_dirty_save_flag Player = <Player> flag = 1
						save_progression_instrument_user_option controller = ($lb_controller) option = 'guitar_bass_flip' new_value = <new_instrument>
					endif
				endif
				<remove_targeted_challenge> = 0
				if playerinfoequals <Player> difficulty = beginner
					<remove_targeted_challenge> = 1
				elseif checksumequals a = <challenge_name> b = qp_power_score_points
					if NOT playerinfoequals <Player> part = <instrument>
						<remove_targeted_challenge> = 1
					endif
				endif
				if (<remove_targeted_challenge> = 1)
					<has_friend_scores> = 0
					<friend_scores> = []
					<target_index> = -1
					<challenge_name> = NULL
					<instrument> = NULL
				endif
				break
			endif
			getnextplayer Player = <Player>
			repeat <num_players>
		endif
		if NOT is_current_playlist_empty
			fill_auto_save_playlist
			songlist_clear_playlist
			Change \{g_songlist_refresh_menus = 1}
		endif
		if NOT playlist_isempty
			playlist_clear
		endif
		if ui_event_exists_in_stack \{Name = 'songlist'}
			songlist_deinit_music_store
		endif
		ui_sfx \{menustate = leaderboard
			uitype = select}
		universal_help_display_help_check help_context = quickplay_to_gameplay device_num = ($primary_controller)
		if checksumequals a = <challenge_name> b = qp_power_score_points
			destroy_dialog_box
			printf channel = award_case qs(0x603f4b33) d = <stats_entry_objid>
			if (<has_friend_scores> = 0 && <no_scores> = 0)
				if award_case_desc_id :desc_resolvealias \{Name = alias_challenges_vmenu
						param = menu_id}
					<menu_id> :se_setprops unblock_events
				endif
			else
				if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
						param = menu_id}
					<menu_id> :se_setprops unblock_events
				endif
			endif
			if (<show_help_page> = 1)
				ui_event_wait_for_safe
				generic_event_choose {
					state = uistate_universal_help
					data = {
						is_popup
						next_state_name = uistate_quickplay_power_select
						next_state_params = {
							song_name = <song>
							challenge_name = <challenge_name>
							instrument = <instrument>
							friend_scores = <friend_scores>
							target_index = <target_index>
							has_friend_scores = <has_friend_scores>
							device_num = ($lb_controller)
							previous_screen_id = <stats_entry_objid>
						}
						help_global_index = <help_index>
						next_state_event = menu_replace
						device_num = ($lb_controller)
					}
				}
			else
				ui_event_wait_for_safe
				generic_event_choose {
					state = uistate_quickplay_power_select
					data = {
						is_popup
						song_name = <song>
						challenge_name = <challenge_name>
						instrument = <instrument>
						friend_scores = <friend_scores>
						target_index = <target_index>
						has_friend_scores = <has_friend_scores>
						device_num = ($lb_controller)
						previous_screen_id = <stats_entry_objid>
					}
				}
			endif
		else
			printf channel = award_case qs(0x6be2570c) s = <challenge_name>
			Change g_songlist_targeted_song = <song>
			quickplay_reset_target_data
			if (<has_friend_scores> = 1)
				quickplay_save_specific_friend_stat friend_scores = <friend_scores> target_index = <target_index>
			endif
			if (<show_help_page> = 1)
				ui_event_wait_for_safe
				generic_event_replace {
					state = uistate_universal_help
					data = {
						next_state_script = quickplay_start_targeted_challenge
						next_state_params = {
							song_name = <song>
							challenge_name = <challenge_name>
							instrument = <instrument>
						}
						device_num = ($primary_controller)
						help_global_index = <help_index>
					}
				}
			else
				quickplay_start_targeted_challenge song_name = <song> challenge_name = <challenge_name> instrument = <instrument>
			endif
		endif
	endif
endscript

script award_case_cancel_targeted_challenge \{menu_id = !q1768515945
		objID = !q1768515945}
	if ScreenElementExists \{id = award_case_desc_id}
		award_case_desc_id :se_setprops \{unblock_events}
	endif
	if ScreenElementExists id = <menu_id>
		<menu_id> :se_setprops unblock_events
	endif
	if ScreenElementExists id = <objID>
		<objID> :se_setprops unblock_events
	endif
	ui_sfx \{menustate = leaderboard
		uitype = back}
	destroy_dialog_box
	clean_up_user_control_helpers
	if award_case_desc_id :obj_getintegertag \{tag_name = instrument_index
			assert = 0}
		if award_case_desc_id :obj_getchecksumtag \{tag_name = goal_name
				assert = 0}
			if ($current_leaderboard_id = None)
				award_case_update_helper_pills is_song_lb = 0 stats_menu = <stats_menu> no_scores = <no_scores> goal_name = <checksum_value>
			elseif (<stats_menu> = 1)
				award_case_update_helper_pills is_song_lb = 0 stats_menu = <stats_menu> only_back = <only_back> no_scores = <no_scores> goal_name = <checksum_value> instrument_index = <integer_value>
			else
				award_case_update_helper_pills is_song_lb = 1 stats_menu = <stats_menu> instrument_index = <integer_value> goal_name = <checksum_value> no_scores = <no_scores>
			endif
		endif
	endif
endscript

script quickplay_get_award_rank_ui_data \{award_points = !i1768515945}
	quickplay_find_award_point_level award_points = <award_points>
	formatText TextName = rank_number_text qs(0x76b3fda7) d = <award_point_level>
	<rank_container_texture> = ff_bord_rank
	return rank_container_texture = <rank_container_texture> rank_container_dims = <rank_container_dims> rank_number_text = <rank_number_text>
endscript

script display_target_challenge_playlist_warning 
	if NOT is_current_playlist_empty
		<heading_text> = qs(0xcf5deb58)
		<body_text> = qs(0x53c79277)
		<continue_text> = qs(0x182f0173)
		<cancel_text> = qs(0xf7723015)
		return true body_text = <body_text> heading_text = <heading_text> continue_text = <continue_text> cancel_text = <cancel_text>
	else
		return \{FALSE}
	endif
endscript

script display_target_challenge_config_warning \{target_scores = [
		]
		target_index = -1
		instrument = !q1768515945
		goal_name = !q1768515945
		controller = !i1768515945
		song = !q1768515945}
	<show_challenge_warning> = 0
	<solo_only_warning> = 0
	getnumplayersingame
	get_song_difficulty_ratings song = <song>
	<has_valid_instrument_for_song> = 0
	<lb_valid_instrument_for_song> = 0
	<band_not_valid> = 0
	if (<num_players> > 0)
		<found_one> = 0
		<lb_player_found> = 0
		getfirstplayer
		begin
		if playerinfoequals <Player> part = <instrument>
			<found_one> = 1
			if playerinfoequals <Player> controller = <controller>
				<lb_player_found> = 1
			endif
		endif
		getplayerinfo <Player> part
		if (<has_valid_instrument_for_song> = 0)
			if (<part> = guitar && <guitar_difficulty_rating> != 0)
				<has_valid_instrument_for_song> = 1
			elseif (<part> = bass && <bass_difficulty_rating> != 0)
				<has_valid_instrument_for_song> = 1
			elseif (<part> = vocals && <vocals_difficulty_rating> != 0)
				<has_valid_instrument_for_song> = 1
			elseif (<part> = drum && <drums_difficulty_rating> != 0)
				<has_valid_instrument_for_song> = 1
			endif
		endif
		if (<num_players> > 1)
			if ((<part> = guitar && <guitar_difficulty_rating> = 0) ||
					(<part> = bass && <bass_difficulty_rating> = 0))
				<band_not_valid> = 1
				<instrument_string> = ($instrument_list.<part>.text)
			endif
		endif
		if playerinfoequals <Player> controller = <controller>
			if (<part> = guitar && <guitar_difficulty_rating> != 0)
				<lb_valid_instrument_for_song> = 1
			elseif (<part> = bass && <bass_difficulty_rating> != 0)
				<lb_valid_instrument_for_song> = 1
			elseif (<part> = vocals && <vocals_difficulty_rating> != 0)
				<lb_valid_instrument_for_song> = 1
			elseif (<part> = drum && <drums_difficulty_rating> != 0)
				<lb_valid_instrument_for_song> = 1
			endif
			getplayerinfo <Player> part out = lb_player_part
			getplayerinfo <Player> difficulty out = lb_player_difficulty
			getplayerinfo <Player> double_kick_drum out = lb_player_double_kick_drum
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
		if (<num_players> < 2 && (<instrument> = Band || <instrument> = traditional_band))
			<show_challenge_warning> = 1
		elseif (<instrument> = traditional_band)
			if NOT is_traditional_game
				if (<goal_name> = qp_score_points_stdband)
					<show_challenge_warning> = 1
				endif
			endif
		elseif (<instrument> = Band)
			if is_traditional_game
				if (<goal_name> = qp_score_points_band)
					<show_challenge_warning> = 1
				endif
			endif
		elseif (<instrument> != Band)
			if (<num_players> > 1 && (<goal_name> = qp_power_score_points || <goal_name> = qp_score_points || <goal_name> = qp_score_spower || <goal_name> = qp_spower_banked || <goal_name> = qp_spower_time || <goal_name> = qp_rockout_time))
				<show_challenge_warning> = 1
				<solo_only_warning> = 1
			elseif (<found_one> = 0)
				<show_challenge_warning> = 1
			elseif (((<instrument> = bass && <lb_player_part> = guitar)
						|| (<instrument> = guitar && <lb_player_part> = bass)) && <lb_player_found> = 0)
				<show_challenge_warning> = 1
			endif
		endif
	endif
	<index> = 0
	GetArraySize ($g_qp_required_challenge_props_order)
	begin
	if checksumequals a = ($g_qp_required_challenge_props_order [<index>]) b = <instrument>
		break
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	<can_switch_instrument> = 0
	if (<instrument> != Band && <instrument> != traditional_band)
		if ((<instrument> = bass && <lb_player_part> = guitar)
				|| (<instrument> = guitar && <lb_player_part> = bass))
			<can_switch_instrument> = 1
		endif
	endif
	<show_difficulty> = 0
	if (<instrument> != Band && <instrument> != traditional_band && <goal_name> != qp_power_score_points)
		GetArraySize <target_scores>
		if (<array_Size> > 0)
			<target_difficulty> = (<target_scores> [<target_index>].difficulty)
			if (<lb_player_part> != drum && <goal_name> = qp_power_score_points && <target_difficulty> = expert_plus)
				<target_difficulty> = expert
			endif
			if (<target_difficulty> != <lb_player_difficulty> && (<can_switch_instrument> = 1 || <lb_player_part> = <instrument>))
				if NOT (<lb_player_part> = drum && <lb_player_double_kick_drum> = 1 && <target_difficulty> = expert_plus && <lb_player_difficulty> = expert)
					<show_difficulty> = 1
					<show_challenge_warning> = 1
				endif
			endif
		endif
	endif
	<continue_text> = qs(0xfe0bd04c)
	<cancel_text> = qs(0x84cb8da4)
	<remove_targeted_challenge> = 0
	if (<solo_only_warning> = 1)
		<text_format> = qs(0x9f7168e0)
		formatText TextName = dialog_text <text_format> s = ($g_qp_challenge_instrument_strings [<index>])
		<cancel_text> = qs(0xaf4d5dd2)
		<remove_targeted_challenge> = 1
		<can_switch_instrument> = 0
	elseif (<can_switch_instrument> = 0 && (<lb_player_part> != <instrument>))
		<text_format> = qs(0x0cd431b4)
		formatText TextName = dialog_text <text_format> s = ($g_qp_challenge_instrument_strings [<index>])
		if (<goal_name> = qp_score_points_band)
			<dialog_text> = qs(0x486d2994)
		elseif (<goal_name> = qp_score_points_stdband)
			<dialog_text> = qs(0x27e3570d)
		elseif (<instrument> = Band || <instrument> = traditional_band)
			<dialog_text> = qs(0x8db8751e)
		endif
		<cancel_text> = qs(0xaf4d5dd2)
		<remove_targeted_challenge> = 1
	elseif (<instrument> = drum && (isrbdrum controller = <controller>) &&
			(<goal_name> = qp_green_notes || <goal_name> = qp_orange_notes || <goal_name> = qp_blue_notes))
		<text_format> = qs(0xb7f846ed)
		formatText TextName = dialog_text <text_format> s = ($g_qp_challenge_instrument_strings [<index>])
		<cancel_text> = qs(0xaf4d5dd2)
		<remove_targeted_challenge> = 1
		<can_switch_instrument> = 0
		<show_challenge_warning> = 1
	elseif (<show_difficulty> = 1 && (<lb_player_part> = <instrument> || <can_switch_instrument> = 1) && <goal_name> != qp_power_score_points)
		<difficulty_text> = qs(0x7a19b5f7)
		if (<target_difficulty> != expert_plus)
			get_difficulty_text difficulty = <target_difficulty>
		endif
		<can_switch_instrument> = 1
		<text_format> = qs(0xfbd5618c)
		formatText TextName = dialog_text <text_format> a = <difficulty_text> b = ($g_qp_challenge_instrument_strings [<index>]) c = <difficulty_text> d = ($g_qp_challenge_instrument_strings [<index>])
	else
		<text_format> = qs(0x12812b55)
		formatText TextName = dialog_text <text_format> i = ($g_qp_challenge_instrument_strings [<index>]) d = ($g_qp_challenge_instrument_strings [<index>])
	endif
	<single_option> = 0
	if (<band_not_valid> = 1 && (<instrument> = Band || <instrument> = traditional_band))
		<show_challenge_warning> = 1
		<text_format> = qs(0x011bb4ab)
		formatText TextName = dialog_text <text_format> i = <instrument_string>
		<single_option> = 1
		<cancel_text> = qs(0xaf4d5dd2)
	elseif (<has_valid_instrument_for_song> = 0 && <can_switch_instrument> = 0)
		<show_challenge_warning> = 1
		<single_option> = 1
		<remove_targeted_challenge> = 1
		<i> = 0
		<instrument_string> = ($instrument_list.<lb_player_part>.text)
		GetArraySize ($g_qp_required_challenge_props_order)
		begin
		if checksumequals a = ($g_qp_required_challenge_props_order [<i>]) b = <lb_player_part>
			<instrument_string> = ($g_qp_challenge_instrument_strings [<i>])
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		<text_format> = qs(0x011bb4ab)
		formatText TextName = dialog_text <text_format> i = <instrument_string>
		<cancel_text> = qs(0xaf4d5dd2)
	elseif (<lb_valid_instrument_for_song> = 0 && <can_switch_instrument> = 0)
		<show_challenge_warning> = 1
		<i> = 0
		<instrument_string> = ($instrument_list.<lb_player_part>.text)
		GetArraySize ($g_qp_required_challenge_props_order)
		begin
		if checksumequals a = ($g_qp_required_challenge_props_order [<i>]) b = <lb_player_part>
			<instrument_string> = ($g_qp_challenge_instrument_strings [<i>])
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		if (<lb_player_part> = bass || <lb_player_part> = guitar)
			<text_format> = qs(0x011bb4ab)
			<single_option> = 1
		else
			<text_format> = qs(0xa1b01c1e)
		endif
		formatText TextName = dialog_text <text_format> i = <instrument_string>
		<cancel_text> = qs(0xaf4d5dd2)
	elseif (<has_valid_instrument_for_song> = 0 && <can_switch_instrument> = 1)
		<single_option> = 1
	endif
	if (<show_challenge_warning> = 1)
		return {
			true
			heading_text = qs(0xcf5deb58)
			body_text = <dialog_text>
			continue_text = <continue_text>
			cancel_text = <cancel_text>
			single_option = <single_option>
			can_switch_instrument = <can_switch_instrument>
			remove_targeted_challenge = <remove_targeted_challenge>
			target_difficulty = <target_difficulty>
		}
	else
		return \{FALSE}
	endif
endscript

script threshold_bling 
	if award_case_desc_id :desc_resolvealias \{Name = alias_diamondbling3
			param = diamondbling3_id}
		<diamondbling3_id> :obj_spawnscript anim_bling_small_002
	else
		ScriptAssert \{'pdetrich'}
	endif
	if award_case_desc_id :desc_resolvealias \{Name = alias_diamondbling4
			param = diamondbling4_id}
		<diamondbling4_id> :obj_spawnscript anim_bling_small_002
	else
		ScriptAssert \{'pdetrich'}
	endif
	if award_case_desc_id :desc_resolvealias \{Name = alias_diamondbling5
			param = diamondbling5_id}
		<diamondbling5_id> :obj_spawnscript anim_bling_small_002
	else
		ScriptAssert \{'pdetrich'}
	endif
	if award_case_desc_id :desc_resolvealias \{Name = alias_diamondbling6
			param = diamondbling6_id}
		<diamondbling6_id> :obj_spawnscript anim_bling_small_002
	else
		ScriptAssert \{'pdetrich'}
	endif
	if award_case_desc_id :desc_resolvealias \{Name = alias_diamondbling7
			param = diamondbling7_id}
		<diamondbling7_id> :obj_spawnscript anim_bling_small_002
	else
		ScriptAssert \{'pdetrich'}
	endif
	if award_case_desc_id :desc_resolvealias \{Name = alias_diamondbling8
			param = diamondbling8_id}
		<diamondbling8_id> :obj_spawnscript anim_bling_small_002
	else
		ScriptAssert \{'pdetrich'}
	endif
	if award_case_desc_id :desc_resolvealias \{Name = alias_diamondbling9
			param = diamondbling9_id}
		<diamondbling9_id> :obj_spawnscript anim_bling_small_002
	else
		ScriptAssert \{'pdetrich'}
	endif
	if award_case_desc_id :desc_resolvealias \{Name = alias_diamondbling10
			param = diamondbling10_id}
		<diamondbling10_id> :obj_spawnscript anim_bling_small_002
	else
		ScriptAssert \{'pdetrich'}
	endif
endscript
