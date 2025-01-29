g_max_num_friends = 100
g_award_case_lb_mode = friends
g_num_song_lb_rows = 30
g_num_total_lb_rows = 0

script ui_create_award_case 
	if ($g_award_case_lb_mode = overall)
		Change \{lb_offset = 0}
	endif
	Change lb_controller = <device_num>
	get_song_name song = <song>
	get_song_title song = <song>
	awardcase :awardcaseuistack_setcurrentsong song = <song>
	formatText checksumName = leaderboard_id '%s_guitar' s = <song_name>
	Change current_leaderboard_id = <leaderboard_id>
	quickplay_get_awards_for_song Player = -1 song_name = <song> controller = <device_num>
	quickplay_get_best_stars_for_song song = <song>
	formatText TextName = title qs(0x4d4555da) s = <song_title>
	formatText TextName = awards_text qs(0xb4cd9c9c) c = <awards_earned> t = <awards_total>
	formatText TextName = stars_text qs(0x4d4555da) s = <best_stars>
	<icon_alpha> = 0
	if (<instrument> != None)
		if (<instrument> != Band)
			formatText checksumName = instrument_icon 'icon_%i_fill' i = ($instrument_list.<instrument>.text_nl)
		endif
		<icon_alpha> = 1
	endif
	uistack_createboundscreenelement {
		parent = root_window
		id = award_case_desc_id
		Type = descinterface
		desc = 'award_case_layout'
		z_priority = 125.0
		tags = {
			song = <song>
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
		best_stars_icon_texture = <instrument_icon>
		best_stars_number_text = <stars_text>
		best_stars_icon_alpha = <icon_alpha>
		difficulty_scroll_alpha = 0
	}
	if GotParam \{no_targeting}
		awardcase :awardcaseuistack_settargetingenabled \{OFF}
	endif
	if award_case_desc_id :desc_resolvealias \{Name = alias_challenges_vmenu}
		<resolved_id> :se_setprops {
			allow_wrap = FALSE
			event_handlers = [
				{pad_back ui_sfx params = {menustate = Generic uitype = back}}
				{pad_back award_case_back}
			]
		}
		if award_case_desc_id :desc_resolvealias \{Name = alias_instrument_spinner
				param = spinner_id}
			<spinner_id> :Obj_SpawnScriptNow savegame_ui_icon_anim
		endif
		if award_case_desc_id :desc_resolvealias \{Name = alias_generic_scrollbar_wgt
				param = scrollbar_id}
			AssignAlias id = <scrollbar_id> alias = award_case_scrollbar_wgt
			generic_scrollbar_wgt_initialize \{id = award_case_scrollbar_wgt}
		endif
		if award_case_desc_id :desc_resolvealias \{Name = alias_difficulty_scrollbar_wgt
				param = scrollbar_id}
			generic_scrollbar_wgt_initialize id = <scrollbar_id>
		endif
		if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
				param = scrollbar_id}
			generic_scrollbar_wgt_initialize id = <scrollbar_id>
		endif
		if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
				param = menu_id}
			<menu_id> :se_setprops {
				event_handlers = [
					{pad_up award_case_lb_scroll params = {Dir = up}}
					{pad_down award_case_lb_scroll params = {Dir = down}}
				]
			}
		endif
		award_case_update_helper_pills \{is_song_lb = 1}
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
		printstruct <...>
		uistack_spawnboundscriptnow request_award_case_leaderboard params = {net_id = <net_id> device_num = ($lb_controller) song = <song>}
		AssignAlias id = <resolved_id> alias = 0xcf2ff4c9
	endif
endscript

script award_case_back 
	if ui_event_exists_in_stack \{Name = 'songlist_options'}
		generic_event_back \{state = uistate_songlist}
	else
		generic_event_back
	endif
endscript

script ui_destroy_award_case 
endscript

script award_case_update_helper_pills \{is_song_lb = !i1768515945
		stats_menu = 0
		no_goal = 0
		only_back = 0}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
	if (<stats_menu> = 0)
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
	endif
	if awardcase :awardcaseuistack_istargetingenabled
		if (<stats_menu> = 1 && <only_back> = 0)
			add_user_control_helper \{text = qs(0xbeb307ce)
				button = green
				z = 100000}
		endif
	endif
	add_user_control_helper controller = ($lb_controller) text = qs(0xaf4d5dd2) button = red z = 100000
	if NOT awardcase :awardcaseuistack_isofflinemode
		if (<is_song_lb> = 1)
			if ($g_award_case_lb_mode = friends)
				add_user_control_helper controller = ($lb_controller) text = qs(0xccb53cc9) button = blue z = 100000
			else
				add_user_control_helper controller = ($lb_controller) text = qs(0xf41fb4ee) button = blue z = 100000
			endif
		endif
	endif
	if (<stats_menu> = 1)
		if (<only_back> = 0)
			if CheckForSignIn network_platform_only controller_index = ($lb_controller)
				add_user_control_helper controller = ($lb_controller) text = qs(0xbe4c0e5b) button = blue z = 100000
			endif
			if isXenon
				add_user_control_helper controller = ($lb_controller) text = qs(0x9a7d1fe5) button = yellow z = 100000
			endif
		endif
	elseif awardcase :awardcaseuistack_istargetingenabled
		if (<no_goal> = 0)
			add_user_control_helper controller = ($lb_controller) text = qs(0xbeb307ce) button = start z = 100000
		endif
	endif
endscript

script request_award_case_leaderboard 
	<use_offline_award_case> = 0
	if NOT CheckForSignIn network_platform_only controller_index = <device_num>
		<use_offline_award_case> = 1
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
		if awardcase :awardcaseuistack_getnextleaderboardid
			Change current_leaderboard_id = <leaderboard_id>
			readleaderboardbyfriendslist {
				callback = award_case_friends_song_leaderboard_callback
				leaderboard_id = ($current_leaderboard_id)
				offset = 0
				num_rows = ($g_max_num_friends)
				controller_id = ($lb_controller)
			}
		else
			Change current_leaderboard_id = <leaderboard_id>
			readleaderboardbyfriendslist {
				callback = award_case_leaderboard_callback
				leaderboard_id = ($current_leaderboard_id)
				offset = 0
				num_rows = ($g_max_num_friends)
				controller_id = ($lb_controller)
			}
		endif
	else
		awardcase :awardcaseuistack_setofflinemode \{On}
		award_case_retrieve_offline_data
		award_case_setup_challenge_menus
	endif
endscript

script award_case_friends_song_leaderboard_callback 
	printf \{qs(0x3e8421ba)}
	if ObjectExists \{id = awardcase}
		if NOT checksumequals a = <status> b = failed
			awardcase :awardcaseuistack_getcurrentsongleaderboardinfo
			inst_config = ($g_qp_required_challenge_props_order [<config_idx>])
			awardcase :awardcaseuistack_getcurrentsong
			awardcase :awardcaseuistack_setsongscores rows = <rows> instrument_index = <config_idx>
			if awardcase :awardcaseuistack_getnextleaderboardid
				Change current_leaderboard_id = <leaderboard_id>
				readleaderboardbyfriendslist {
					callback = award_case_friends_song_leaderboard_callback
					leaderboard_id = ($current_leaderboard_id)
					offset = 0
					num_rows = ($g_max_num_friends)
					controller_id = ($lb_controller)
				}
			else
				Change current_leaderboard_id = <leaderboard_id>
				readleaderboardbyfriendslist {
					callback = award_case_leaderboard_callback
					leaderboard_id = ($current_leaderboard_id)
					offset = 0
					num_rows = ($g_max_num_friends)
					controller_id = ($lb_controller)
				}
			endif
		else
			awardcase :awardcaseuistack_setofflinemode \{On}
			award_case_retrieve_offline_data
			award_case_setup_challenge_menus
		endif
	endif
endscript

script award_case_leaderboard_callback 
	printf \{qs(0xa58b0d8f)}
	printstruct <...>
	if ScreenElementExists \{id = award_case_desc_id}
		if GotParam \{rows}
			award_case_desc_id :se_setprops \{instrument_spinner_alpha = 0.0}
			awardcase :awardcaseuistack_setchallengedata rows = <rows>
			award_case_setup_challenge_menus
		endif
	endif
endscript

script award_case_challenge_item_focus \{is_focus = 0
		challenge_text = qs(0x00000000)
		challenge_targets = [
		]}
	Obj_GetID
	if GotParam \{is_song_lb}
		printf \{qs(0xb496518f)}
		award_case_desc_id :se_setprops \{difficulty_scroll_alpha = 0}
		if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
				param = menu_id}
			if (<is_song_lb> = 1)
				<menu_id> :se_setprops {
					replace_handlers
					event_handlers = [
						{pad_up award_case_lb_scroll params = {Dir = up}}
						{pad_down award_case_lb_scroll params = {Dir = down}}
					]
				}
			else
				<menu_id> :se_setprops {
					replace_handlers
					event_handlers = []
				}
			endif
		endif
		award_case_update_helper_pills is_song_lb = <is_song_lb> no_goal = <no_goal>
	endif
	if (<is_focus> = 1)
		<objID> :se_setprops frame_highlight_alpha = 1
		<objID> :se_setprops icon_alpha = 1
		if ScreenElementExists \{id = award_case_desc_id}
			if award_case_desc_id :desc_resolvealias \{Name = alias_challenges_vmenu}
				<resolved_id> :menu_getselectedindex
				generic_scrollbar_wgt_update_thumb_pos id = award_case_scrollbar_wgt index = <selected_index>
			endif
			if ($g_award_case_lb_mode = friends || <is_song_lb> = 0)
				if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
						param = scrollbar_id}
					<scrollbar_id> :se_setprops alpha = 1.0
				endif
			endif
			AddParam structure_name = award_case_props Name = challenge_title_text value = <challenge_text>
			<index> = 0
			begin
			formatText checksumName = star_alpha 'star_%d_alpha' d = <index>
			formatText checksumName = challenge_alpha 'challenge_level_%d_alpha' d = <index>
			if (<challenge_grade> > <index>)
				AddParam structure_name = award_case_props Name = <star_alpha> value = 1.0
				AddParam structure_name = award_case_props Name = <challenge_alpha> value = 0.0
			else
				AddParam structure_name = award_case_props Name = <star_alpha> value = 0.0
				AddParam structure_name = award_case_props Name = <challenge_alpha> value = 0.7
			endif
			<index> = (<index> + 1)
			repeat 3
			GetArraySize \{challenge_targets}
			if (<array_Size> >= 3)
				formatText TextName = gold_text qs(0x4d4555da) s = (<challenge_targets> [0])
				formatText TextName = platinum_text qs(0x4d4555da) s = (<challenge_targets> [1])
				formatText TextName = diamond_text qs(0x4d4555da) s = (<challenge_targets> [2])
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
			award_case_desc_id :se_setprops <award_case_props>
		endif
	else
		<objID> :se_setprops frame_highlight_alpha = 0
		<objID> :se_setprops icon_alpha = 0.5
	endif
endscript

script award_case_load_song_score_stats \{instrument_index = !i1768515945
		goal_name = !q1768515945
		inst_config = !q1768515945}
	printf \{qs(0xa5799365)}
	awardcase :awardcaseuistack_getcurrentsong
	awardcase :awardcaseuistack_getsongscores instrument_index = <instrument_index>
	printf \{qs(0x2fb5f829)}
	if ($g_award_case_lb_mode = friends)
		get_song_name song = <song>
		formatText checksumName = leaderboard_id '%s_challenge' s = <song_name>
		Change current_leaderboard_id = <leaderboard_id>
		if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
				param = scrollbar_id}
			GetArraySize \{display_rows}
			generic_scrollbar_wgt_set_resolution id = <scrollbar_id> num_elements = <array_Size>
		endif
		award_case_display_leaderboard_rows challenge_lb = 0 display_rows = <display_rows> goal_name = <goal_name> inst_config = <inst_config>
	else
		awardcase :awardcaseuistack_getnextleaderboardid instrument_index = <instrument_index>
		Change current_leaderboard_id = <leaderboard_id>
		award_case_desc_id :SetTags \{num_start_received = 0
			easy_start = -1
			medium_start = -1
			hard_start = -1
			expert_start = -1
			expert_plus_start = -1}
		readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = easy
		readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = medium
		readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = hard
		readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = expert
		readleaderboardbydifficulty callback = ui_leaderboard_get_difficulty_start leaderboard_id = ($current_leaderboard_id) num_rows = 1 difficulty = expert_plus
		readleaderboardbyoffset {
			callback = award_case_display_song_lb_rows
			leaderboard_id = <leaderboard_id>
			offset = ($lb_offset)
			num_rows = ($g_num_song_lb_rows)
		}
	endif
	printstruct <...>
endscript

script award_case_load_challenge_stats \{challenge_id = !i1768515945
		goal_name = !q1768515945
		inst_config = !q1768515945}
	printf \{qs(0xac11bbf3)}
	awardcase :awardcaseuistack_getcurrentsong
	awardcase :awardcaseuistack_getchallengeleaderboard challenge_index = <challenge_id>
	printf \{qs(0x2fb5f829)}
	printstruct <...>
	if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
			param = scrollbar_id}
		GetArraySize \{display_rows}
		generic_scrollbar_wgt_set_resolution id = <scrollbar_id> num_elements = <array_Size>
	endif
	award_case_display_leaderboard_rows display_rows = <display_rows> goal_name = <goal_name> inst_config = <inst_config>
endscript

script award_case_display_leaderboard_rows \{display_rows = !a1768515945
		goal_name = qp_score_points
		inst_config = guitar
		challenge_lb = 1}
	if ScreenElementExists \{id = award_case_desc_id}
		if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
				param = menu_id}
			DestroyScreenElement id = <menu_id> preserve_parent
			<menu_id> :se_setprops {
				alpha = 0
			}
			GetArraySize <display_rows>
			if (<array_Size> > 0)
				awardcase :awardcaseuistack_getcurrentsong
				<index> = 0
				begin
				if NOT StructureContains structure = (<display_rows> [<index>]) rank
					<rank> = (<index> + 1)
				else
					<rank> = (<display_rows> [<index>].rank)
				endif
				if (<rank> != -1)
					formatText TextName = rank_text qs(0x545e649b) r = <rank>
				endif
				formatText TextName = score_text qs(0x4d4555da) s = (<display_rows> [<index>].score)
				<difficulty_alpha> = 0
				if StructureContains structure = (<display_rows> [<index>]) difficulty
					if checksumequals a = (<display_rows> [<index>].difficulty) b = expert_plus
						<difficulty_icon> = icon_difficulty_expert_plus
						<difficulty_alpha> = 1
					elseif NOT checksumequals a = (<display_rows> [<index>].difficulty) b = None
						get_difficulty_text_nl difficulty = (<display_rows> [<index>].difficulty)
						formatText checksumName = difficulty_icon 'icon_difficulty_%i' i = <difficulty_text_nl>
						<difficulty_alpha> = 1
					endif
				endif
				<gamertag_text> = qs(0x00000000)
				if StructureContains structure = (<display_rows> [<index>]) gamertag
					<gamertag_text> = (<display_rows> [<index>].gamertag)
				elseif StructureContains structure = (<display_rows> [<index>]) gamer_tag
					<gamertag_text> = (<display_rows> [<index>].gamer_tag)
				endif
				CreateScreenElement {
					parent = <menu_id>
					Type = descinterface
					desc = 'award_case_stats_entry'
					autosizedims = true
					tags = {
						song = <song>
						rank = <rank>
						valid = 1
					}
					rank_text = <rank_text>
					gamertag_text = <gamertag_text>
					score_text = <score_text>
					difficulty_icon_alpha = <difficulty_alpha>
					difficulty_icon_texture = <difficulty_icon>
				}
				<net_id> = (<display_rows> [<index>].player_id)
				g_award_case_lb_mode = ($g_award_case_lb_mode)
				if NOT (<challenge_lb> = 1 || $g_award_case_lb_mode = friends)
					awardcase :awardcaseuistack_getcurrentsongleaderboardinfo
					<inst_config> = ($g_qp_required_challenge_props_order [<config_idx>])
					<goal_name> = qp_score_points
					if (checksumequals a = <inst_config> b = Band)
						<goal_name> = qp_score_points_band
					elseif (checksumequals a = <inst_config> b = traditional_band)
						<goal_name> = qp_score_points_stdband
					endif
				endif
				<id> :se_setprops {
					event_handlers = [
						{focus award_case_stats_item_focus params = {alpha = 1.0}}
						{unfocus award_case_stats_item_focus params = {alpha = 0.0}}
						{pad_option2 award_case_display_gamer_card params = {net_id = <net_id>}}
						{pad_option award_case_display_rock_record params = {net_id = <net_id> menu_id = <menu_id>}}
						{
							pad_start
							award_case_start_targeted_challenge
							params = {
								friend_scores = <display_rows>
								target_index = <index>
								song_name = <song>
								challenge_name = <goal_name>
								instrument = <inst_config>
								has_friend_scores = 1
							}
						}
						{pad_choose
							award_case_start_targeted_challenge
							params = {
								friend_scores = <display_rows>
								target_index = <index>
								song_name = <song>
								challenge_name = <goal_name>
								instrument = <inst_config>
								has_friend_scores = 1
							}
						}
					]
				}
				<index> = (<index> + 1)
				repeat <array_Size>
			else
				CreateScreenElement {
					parent = <menu_id>
					Type = descinterface
					desc = 'award_case_stats_entry'
					autosizedims = true
					tags = {
						song = <song>
					}
					rank_text = qs(0x03ac90f0)
					gamertag_text = qs(0x2958f2b1)
					score_text = qs(0x03ac90f0)
					difficulty_icon_alpha = 0
					event_handlers = [
						{focus award_case_stats_item_focus params = {alpha = 1.0}}
						{focus award_case_update_helper_pills params = {is_song_lb = 0 stats_menu = 1 only_back = 1}}
						{unfocus award_case_stats_item_focus params = {alpha = 0.0}}
					]
				}
			endif
			<menu_id> :se_setprops {
				alpha = 1
			}
		endif
	endif
endscript

script award_case_display_song_lb_rows 
	if (<status> != failed)
		Change g_num_total_lb_rows = <total_size>
		award_case_display_leaderboard_rows challenge_lb = 0 display_rows = <rows>
	endif
endscript

script award_case_choose_stats_menu 
	if award_case_desc_id :desc_resolvealias \{Name = alias_challenges_vmenu
			param = menu_id}
		<menu_id> :se_setprops block_events
	endif
	award_case_update_helper_pills is_song_lb = 0 no_goal = <no_goal> stats_menu = 1
	if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
			param = menu_id}
		<menu_id> :se_setprops {
			replace_handlers
			event_handlers = [
				{pad_back award_case_stats_menu_back params = {is_song_lb = <is_song_lb>}}
			]
		}
		LaunchEvent Type = focus target = <menu_id>
	endif
endscript

script award_case_toggle_lb_mode 
	printf \{qs(0x7893f0d9)}
	if ObjectExists \{id = awardcase}
		if NOT awardcase :awardcaseuistack_isofflinemode
			if ($g_award_case_lb_mode = friends)
				Change \{g_award_case_lb_mode = overall}
				Change \{lb_offset = 0}
				if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
						param = scrollbar_id}
					<scrollbar_id> :se_setprops alpha = 0.0
				endif
				award_case_update_helper_pills is_song_lb = 1 no_goal = <no_goal>
				award_case_load_song_score_stats instrument_index = <instrument_index> goal_name = <goal_name> inst_config = <inst_config>
			else
				Change \{g_award_case_lb_mode = friends}
				award_case_desc_id :se_setprops \{difficulty_scroll_alpha = 0}
				if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar
						param = scrollbar_id}
					<scrollbar_id> :se_setprops alpha = 1.0
				endif
				award_case_update_helper_pills is_song_lb = 1 no_goal = <no_goal>
				award_case_load_song_score_stats instrument_index = <instrument_index> goal_name = <goal_name> inst_config = <inst_config>
			endif
		endif
	endif
endscript

script award_case_lb_scroll 
	if ObjectExists \{id = awardcase}
		if ($g_award_case_lb_mode = overall)
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
						award_case_add_new_rank_row parent_id = <objID> rank = ($lb_offset + 1)
					endif
				endif
			elseif (<Dir> = up)
				<at_the_top> = 0
				Change lb_offset = ($lb_offset - 1)
				if ($lb_offset < 0)
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
						award_case_add_new_rank_row parent_id = <objID> rank = ($lb_offset + 1) new_index = (<array_Size> - 1) is_top
					endif
				endif
			endif
		endif
	endif
endscript

script award_case_add_new_rank_row 
	formatText TextName = rank_text qs(0x545e649b) r = <rank>
	CreateScreenElement {
		parent = <parent_id>
		Type = descinterface
		desc = 'award_case_stats_entry'
		autosizedims = true
		tags = {
			song = <song>
			rank = <rank>
			valid = 0
		}
		rank_text = <rank_text>
		gamertag_text = qs(0x9e0cb7ef)
		score_text = qs(0x9e0cb7ef)
		difficulty_icon_alpha = 0
		event_handlers = [
			{focus award_case_update_helper_pills params = {is_song_lb = 0 stats_menu = 0 no_goal = 1}}
			{focus award_case_stats_item_focus params = {alpha = 1.0}}
			{focus award_case_settle_retrieve_stats params = {rank = <rank>}}
			{unfocus award_case_stats_item_focus params = {alpha = 0.0}}
		]
	}
	if GotParam \{is_top}
		<parent_id> :menu_setitemindex index = <new_index> newindex = 0
	endif
endscript

script award_case_stats_menu_back 
	if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
			param = menu_id}
		LaunchEvent Type = unfocus target = <menu_id>
	endif
	if award_case_desc_id :desc_resolvealias \{Name = alias_challenges_vmenu
			param = menu_id}
		<menu_id> :se_setprops unblock_events
	endif
	award_case_update_helper_pills is_song_lb = <is_song_lb>
endscript

script award_case_stats_item_focus 
	Obj_GetID
	if (<alpha> = 1.0)
		<objID> :se_setprops highlight_alpha = <alpha>
	else
		<objID> :se_setprops highlight_alpha = <alpha> time = 0.25
	endif
	if ($g_award_case_lb_mode = overall)
		if award_case_desc_id :desc_resolvealias \{Name = alias_difficulty_scrollbar_wgt}
			if <objID> :GetSingleTag rank
				generic_scrollbar_wgt_update_thumb_pos id = <resolved_id> index = (<rank> - 1)
			endif
		endif
	endif
	if award_case_desc_id :desc_resolvealias \{Name = alias_friends_scrollbar}
		if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
				param = menu_id}
			<menu_id> :menu_getselectedindex
			generic_scrollbar_wgt_update_thumb_pos id = <resolved_id> index = <selected_index>
		endif
	endif
endscript

script award_case_settle_retrieve_stats 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Wait \{3.0
		Seconds}
	printf qs(0x3d01bc9b) d = <rank>
	<offset> = (<rank> - ($g_num_song_lb_rows / 2))
	if (<offset> < 0)
		<offset> = 0
	endif
	readleaderboardbyoffset {
		callback = award_case_dynamic_rows_update
		leaderboard_id = ($current_leaderboard_id)
		offset = <offset>
		num_rows = ($g_num_song_lb_rows)
	}
endscript

script award_case_dynamic_rows_update 
	printf \{qs(0xabe96a26)}
	if ObjectExists \{id = awardcase}
		awardcase :awardcaseuistack_getcurrentsongleaderboardinfo
		<inst_config> = ($g_qp_required_challenge_props_order [<config_idx>])
		awardcase :awardcaseuistack_getcurrentsong
		<goal_name> = qp_score_points
		if (checksumequals a = <inst_config> b = Band)
			<goal_name> = qp_score_points_band
		elseif (checksumequals a = <inst_config> b = traditional_band)
			<goal_name> = qp_score_points_stdband
		endif
		if (<status> = succeeded)
			if ($current_leaderboard_id = <leaderboard_id>)
				Change g_num_total_lb_rows = <total_size>
				if award_case_desc_id :desc_resolvealias \{Name = alias_stats_vmenu
						param = menu_id}
					GetArraySize <rows>
					if (<array_Size> > 0)
						<lowest_rank> = (<rows> [0].rank)
						<highest_rank> = (<rows> [(<array_Size> - 1)].rank)
						<row_index> = 0
						if GetScreenElementChildren id = <menu_id>
							GetArraySize <children> param = children_size
							printstruct <...>
							if (<children_size> > 0)
								<index> = 0
								begin
								<child_id> = (<children> [<index>])
								if <child_id> :GetSingleTag rank
									if (<rank> < <lowest_rank> || <rank> > <highest_rank>)
										<child_id> :se_setprops {
											gamertag_text = qs(0x9e0cb7ef)
											score_text = qs(0x9e0cb7ef)
											difficulty_icon_alpha = 0
											replace_handlers
											event_handlers = [
												{focus award_case_stats_item_focus params = {alpha = 1.0}}
												{focus award_case_update_helper_pills params = {is_song_lb = 0 stats_menu = 0 no_goal = 1}}
												{focus award_case_settle_retrieve_stats params = {rank = <rank>}}
												{unfocus award_case_stats_item_focus params = {alpha = 0.0}}
											]
										}
										if isscreenelementinfocus id = <child_id>
											award_case_update_helper_pills \{is_song_lb = 0
												stats_menu = 0
												no_goal = 1}
										endif
									else
										if (<row_index> >= 0 && <row_index> < <array_Size>)
											<row_index> = 0
											begin
											if ((<rows> [<row_index>].rank) = <rank>)
												formatText TextName = score_text qs(0x4d4555da) s = (<rows> [<row_index>].score)
												<difficulty_alpha> = 0
												if StructureContains structure = (<rows> [<row_index>]) difficulty
													if NOT checksumequals a = (<rows> [<row_index>].difficulty) b = None
														get_difficulty_text_nl difficulty = (<rows> [<row_index>].difficulty)
														formatText checksumName = difficulty_icon 'icon_difficulty_%i' i = <difficulty_text_nl>
														<difficulty_alpha> = 1
													endif
												endif
												net_id = (<rows> [<row_index>].player_id)
												<child_id> :se_setprops {
													gamertag_text = (<rows> [<row_index>].gamer_tag)
													score_text = <score_text>
													difficulty_icon_alpha = <difficulty_alpha>
													difficulty_icon_texture = <difficulty_icon>
													replace_handlers
													event_handlers = [
														{focus award_case_stats_item_focus params = {alpha = 1.0}}
														{focus award_case_update_helper_pills params = {is_song_lb = 0 stats_menu = 1}}
														{unfocus award_case_stats_item_focus params = {alpha = 0.0}}
														{pad_option2 award_case_display_gamer_card params = {net_id = <net_id>}}
														{pad_option award_case_display_rock_record params = {net_id = <net_id> unfocus_id = <menu_id>}}
														{
															pad_start
															award_case_start_targeted_challenge
															params = {
																friend_scores = <rows>
																target_index = <row_index>
																song_name = <song>
																challenge_name = <goal_name>
																instrument = <inst_config>
																has_friend_scores = 1
															}
														}
														{pad_choose
															award_case_start_targeted_challenge
															params = {
																friend_scores = <rows>
																target_index = <row_index>
																song_name = <song>
																challenge_name = <goal_name>
																instrument = <inst_config>
																has_friend_scores = 1
															}
														}
													]
												}
												<row_index> = (<row_index> + 1)
												if isscreenelementinfocus id = <child_id>
													award_case_update_helper_pills \{is_song_lb = 0
														stats_menu = 1}
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
					endif
				endif
			endif
		endif
	endif
endscript

script award_case_retrieve_offline_data 
	printf \{qs(0x6ffc238e)}
	awardcase :awardcaseuistack_getcurrentsong
	getsavegamefromcontroller controller = ($lb_controller)
	GetGlobalTags savegame = <savegame> <song>
	get_local_in_game_player_num_from_controller controller_index = ($lb_controller)
	if (<player_num> != -1)
		get_fullname_for_player Player = <player_num>
	else
		formatText TextName = fullname qs(0x72f23aff) d = ($lb_controller + 1)
	endif
	gman_getsongchallengeprops song_name = <song>
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
			<score_value> = (<...>.<score_checksum>)
			<goal_name> = (<challenge_props>.<config> [<index>].goal_name)
			if ((checksumequals a = <goal_name> b = qp_score_points) || (checksumequals a = <goal_name> b = qp_score_points_band))
				if (<score_value> != 0)
					awardcase :awardcaseuistack_setsongscores rows = [{score = (<...>.<score_checksum>) player_id = [0 0] gamer_tag = <fullname> difficulty = easy}] instrument_index = <config_idx>
				endif
			else
				if (<score_value> != 0)
					AddArrayElement array = <challenges_data> element = {valid = 1 challenge_score = <score_value> challenge_config = <config_idx> challenge_id = 1 difficulty = easy}
				else
					AddArrayElement array = <challenges_data> element = {valid = 0 challenge_score = <score_value> challenge_config = <config_idx> challenge_id = 0 difficulty = easy}
				endif
				<challenges_data> = <array>
			endif
			<challenges_index> = (<challenges_index> + 1)
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
	endif
	<config_idx> = (<config_idx> + 1)
	repeat <config_size>
	awardcase :awardcaseuistack_setchallengedata {
		rows = [
			{
				gamer_tag = <fullname>
				player_id = [0 0]
				challenges = <challenges_data>
			}
		]
	}
endscript

script award_case_setup_challenge_menus 
	printf \{qs(0x0dcce442)}
	award_case_desc_id :se_setprops \{instrument_spinner_alpha = 0.0}
	get_local_in_game_player_num_from_controller controller_index = ($lb_controller)
	if (<player_num> = -1)
		get_controller_type controller_index = ($lb_controller)
		<part> = <controller_type>
		if (<part> != guitar && <part> != drum && <part> != vocals)
			<part> = guitar
		endif
	else
		getplayerinfo <player_num> part
	endif
	awardcase :awardcaseuistack_getcurrentsong
	gman_getsongchallengeprops song_name = <song>
	if award_case_desc_id :desc_resolvealias \{Name = alias_challenges_vmenu
			param = menu_id}
		award_case_desc_id :GetSingleTag \{song}
		gman_getsongchallengeprops song_name = <song>
		getsavegamefromcontroller controller = ($lb_controller)
		GetGlobalTags savegame = <savegame> <song>
		<challenge_configs> = ($g_qp_required_challenge_props_order)
		GetArraySize <challenge_configs>
		<config_size> = <array_Size>
		<config_size> = (<config_size> - 1)
		<config_idx> = 0
		<num_challenges> = 0
		<matching_config_index> = 0
		<num_menu_items> = 0
		begin
		<0x9650076a> = 0
		<config> = (<challenge_configs> [<config_idx>])
		<inst_config> = ($g_qp_required_challenge_props_order [<config_idx>])
		if StructureContains structure = challenge_props <config>
			GetArraySize (<challenge_props>.<config>)
			if (<array_Size> > 0)
				<index> = 0
				begin
				ExtendCrc (<challenge_props>.<config> [<index>].goal_name) '_info' out = challenge_struct
				if StructureContains structure = ($<challenge_struct>) constants
					if StructureContains structure = ($<challenge_struct>.constants) desc_txt
						formatText TextName = challenge_text qs(0xd41bc274) p = ($g_qp_challenge_instrument_strings [<config_idx>]) g = ($<challenge_struct>.constants.desc_txt)
						awardcase :awardcaseuistack_getcurrentsong
						goal_name = (<challenge_props>.<config> [<index>].goal_name)
						if (<num_menu_items> < 10)
							formatText checksumName = grade_checksum 'challenge0%s_grade' s = (<num_menu_items> + 1)
						else
							formatText checksumName = grade_checksum 'challenge%s_grade' s = (<num_menu_items> + 1)
						endif
						<challenge_grade> = (<...>.<grade_checksum>)
						<frame_alpha> = 1
						if (<challenge_grade> = 1)
							<frame_texture> = ac_wgt_gold_frame
						elseif (<challenge_grade> = 2)
							<frame_texture> = ac_wgt_silver_frame
						elseif (<challenge_grade> = 3)
							<frame_texture> = ac_wgt_diamond_frame
						else
							<frame_alpha> = 0
						endif
						quickplay_get_challenge_icon base_name = <goal_name>
						CreateScreenElement {
							parent = <menu_id>
							Type = descinterface
							desc = 'award_case_challenge_entry'
							autosizedims = true
							frame_highlight_alpha = 0
							challenge_entry_icon_texture = <icon_name>
							challenge_level_border_texture = <frame_texture>
							challenge_level_alpha = <frame_alpha>
						}
						gman_getchallengetargets song_name = <song> goal_name = <goal_name> instrument = <inst_config>
						if ((checksumequals a = <goal_name> b = qp_score_points) || (checksumequals a = <goal_name> b = qp_score_points_band) || (checksumequals a = <goal_name> b = qp_score_points_stdband))
							<0x9650076a> = 1
							<event_handlers> = [
								{focus award_case_challenge_item_focus params = {is_song_lb = 1 is_focus = 1 challenge_text = <challenge_text> challenge_targets = <challenge_targets> challenge_grade = <challenge_grade>}}
								{focus award_case_load_song_score_stats params = {instrument_index = <config_idx> goal_name = <goal_name> inst_config = <inst_config>}}
								{unfocus award_case_challenge_item_focus params = {}}
								{pad_choose award_case_choose_stats_menu params = {is_song_lb = 1}}
								{pad_option award_case_toggle_lb_mode params = {instrument_index = <config_idx> goal_name = <goal_name> inst_config = <inst_config>}}
								{pad_start award_case_start_targeted_challenge params = {song_name = <song> challenge_name = <goal_name> instrument = <inst_config>}}
							]
						else
							<event_handlers> = [
								{focus award_case_challenge_item_focus params = {is_song_lb = 0 is_focus = 1 challenge_text = <challenge_text> challenge_targets = <challenge_targets> challenge_grade = <challenge_grade>}}
								{focus award_case_load_challenge_stats params = {challenge_id = <num_challenges> goal_name = <goal_name> inst_config = <inst_config>}}
								{unfocus award_case_challenge_item_focus params = {}}
								{pad_choose award_case_choose_stats_menu params = {is_song_lb = 0}}
								{pad_start award_case_start_targeted_challenge params = {song_name = <song> challenge_name = <goal_name> instrument = <inst_config>}}
							]
						endif
						<id> :se_setprops {
							event_handlers = <event_handlers>
						}
						if checksumequals a = <config> b = <part>
							<menu_id> :menu_setitemindex index = <num_menu_items> newindex = <matching_config_index>
							<matching_config_index> = (<matching_config_index> + 1)
						endif
					endif
				endif
				if NOT checksumequals a = (<challenge_props>.<config> [<index>].goal_name) b = qp_score_points
					if NOT checksumequals a = (<challenge_props>.<config> [<index>].goal_name) b = qp_score_points_band
						if NOT checksumequals a = (<challenge_props>.<config> [<index>].goal_name) b = qp_score_points_stdband
							<num_challenges> = (<num_challenges> + 1)
						endif
					endif
				endif
				<num_menu_items> = (<num_menu_items> + 1)
				<index> = (<index> + 1)
				repeat <array_Size>
			endif
		endif
		if (<0x9650076a> = 0)
			formatText TextName = challenge_text qs(0xd41bc274) p = ($g_qp_challenge_instrument_strings [<config_idx>]) g = qs(0x08952d17)
			CreateScreenElement {
				parent = <menu_id>
				Type = descinterface
				desc = 'award_case_challenge_entry'
				autosizedims = true
				challenge_level_alpha = 0
			}
			if (checksumequals a = <config> b = Band)
				gman_getchallengetargets song_name = <song> goal_name = qp_score_points_band instrument = <inst_config>
				<goal_name> = qp_score_points_band
				<event_handlers> = [
					{focus award_case_challenge_item_focus params = {is_song_lb = 1 no_goal = 1 is_focus = 1 challenge_text = <challenge_text> challenge_targets = <challenge_targets> challenge_grade = <challenge_grade>}}
					{focus award_case_load_song_score_stats params = {instrument_index = <config_idx> goal_name = qp_score_points_band inst_config = <inst_config>}}
					{unfocus award_case_challenge_item_focus params = {}}
					{pad_choose award_case_choose_stats_menu params = {is_song_lb = 1 no_goal = 1}}
					{pad_option award_case_toggle_lb_mode params = {instrument_index = <config_idx> goal_name = qp_score_points_band inst_config = <inst_config> no_goal = 1}}
				]
			elseif (checksumequals a = <config> b = traditional_band)
				gman_getchallengetargets song_name = <song> goal_name = qp_score_points_stdband instrument = <inst_config>
				<goal_name> = qp_score_points_stdband
				<event_handlers> = [
					{focus award_case_challenge_item_focus params = {is_song_lb = 1 no_goal = 1 is_focus = 1 challenge_text = <challenge_text> challenge_targets = <challenge_targets> challenge_grade = <challenge_grade>}}
					{focus award_case_load_song_score_stats params = {instrument_index = <config_idx> goal_name = qp_score_points_stdband inst_config = <inst_config>}}
					{unfocus award_case_challenge_item_focus params = {}}
					{pad_choose award_case_choose_stats_menu params = {is_song_lb = 1 no_goal = 1}}
					{pad_option award_case_toggle_lb_mode params = {instrument_index = <config_idx> goal_name = qp_score_points_stdband inst_config = <inst_config> no_goal = 1}}
				]
			else
				gman_getchallengetargets song_name = <song> goal_name = qp_score_points instrument = <inst_config>
				<goal_name> = qp_score_points
				<event_handlers> = [
					{focus award_case_challenge_item_focus params = {is_song_lb = 1 no_goal = 1 is_focus = 1 challenge_text = <challenge_text> challenge_targets = <challenge_targets> challenge_grade = <challenge_grade>}}
					{focus award_case_load_song_score_stats params = {instrument_index = <config_idx> goal_name = qp_score_points inst_config = <inst_config>}}
					{unfocus award_case_challenge_item_focus params = {}}
					{pad_choose award_case_choose_stats_menu params = {is_song_lb = 1 no_goal = 1}}
					{pad_option award_case_toggle_lb_mode params = {instrument_index = <config_idx> goal_name = qp_score_points inst_config = <inst_config> no_goal = 1}}
				]
			endif
			quickplay_get_challenge_icon base_name = <goal_name>
			<num_menu_items> = (<num_menu_items> + 1)
			<id> :se_setprops {
				challenge_entry_icon_texture = <icon_name>
				event_handlers = <event_handlers>
			}
		endif
		<config_idx> = (<config_idx> + 1)
		repeat <config_size>
		generic_scrollbar_wgt_set_resolution id = award_case_scrollbar_wgt num_elements = <num_menu_items>
	endif
endscript

script award_case_display_gamer_card 
	if NOT isps3
		if (<net_id> [0] != 0 && <net_id> [1] != 0)
			rock_record_show_gamercard net_id = <net_id> device_num = <device_num>
		endif
	endif
endscript

script award_case_display_rock_record 
	if (<net_id> [0] != 0 && <net_id> [1] != 0)
		if CheckForSignIn controller_index = <device_num> network_platform_only
			display_rock_record net_id = <net_id> unfocus_id = <menu_id> device_num = <device_num>
		endif
	endif
endscript

script award_case_start_targeted_challenge \{song_name = !q1768515945
		challenge_name = !q1768515945
		instrument = !q1768515945
		has_friend_scores = 0
		enable_warnings = 1
		new_difficulty = None
		new_instrument = None}
	if awardcase :awardcaseuistack_istargetingenabled
		if (<enable_warnings> = 1)
			<show_challenge_warning> = 0
			getnumplayersingame
			if (<num_players> > 0)
				if (<num_players> < 2 && (<instrument> = Band || <instrument> = traditional_band))
					<show_challenge_warning> = 1
				elseif (<instrument> = traditional_band)
					if NOT is_traditional_game
						<show_challenge_warning> = 1
					endif
				else
					<found_one> = 0
					<lb_player_found> = 1
					getfirstplayer
					begin
					if playerinfoequals <Player> part = <instrument>
						<found_one> = 1
						if playerinfoequals <Player> controller = ($lb_controller)
							<lb_player_found> = 1
						endif
					endif
					if playerinfoequals <Player> controller = ($lb_controller)
						getplayerinfo <Player> part out = lb_player_part
						getplayerinfo <Player> difficulty out = lb_player_difficulty
						getplayerinfo <Player> double_kick_drum out = lb_player_double_kick_drum
					endif
					getnextplayer Player = <Player>
					repeat <num_players>
					if (<found_one> = 0)
						<show_challenge_warning> = 1
					elseif (((<instrument> = bass && <lb_player_part> = guitar)
								|| (<instrument> = guitar && <lb_player_part> = bass)) && <lb_player_found> = 0)
						<show_challenge_warning> = 1
					endif
				endif
			endif
			<show_difficulty> = 0
			if (<has_friend_scores> = 1 && <instrument> != Band && <instrument> != traditional_band)
				<target_difficulty> = (<friend_scores> [<target_index>].difficulty)
				if (<target_difficulty> != <lb_player_difficulty>)
					if NOT (<lb_player_part> = drum && <lb_player_double_kick_drum> = 1 && <target_difficulty> = expert && <lb_player_difficulty> = expert)
						<show_difficulty> = 1
					endif
				endif
			endif
			if (<show_challenge_warning> = 1)
				if (<has_friend_scores> = 0)
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
				<continue_script> = award_case_start_targeted_challenge
				<continue_script_params> = {
					song_name = <song_name>
					challenge_name = <challenge_name>
					instrument = <instrument>
					friend_scores = <friend_scores>
					target_index = <target_index>
					has_friend_scores = <has_friend_scores>
					new_difficulty = <target_difficulty>
					new_instrument = <instrument>
					enable_warnings = 0
				}
				<0xfc42bcb7> = <continue_script>
				<0x8dc83618> = {
					song_name = <song_name>
					challenge_name = <challenge_name>
					instrument = <instrument>
					friend_scores = <friend_scores>
					target_index = <target_index>
					has_friend_scores = <has_friend_scores>
					enable_warnings = 0
				}
				if (<can_switch_instrument> = 0)
					<text_format> = qs(0x0cd431b4)
					formatText TextName = dialog_text <text_format> s = ($g_qp_challenge_instrument_strings [<index>])
					<0xfc42bcb7> = award_case_cancel_targeted_challenge
					<0x8dc83618> = {menu_id = <menu_id>}
					<continue_script_params> = {
						song_name = <song_name>
						challenge_name = <challenge_name>
						instrument = <instrument>
						friend_scores = <friend_scores>
						target_index = <target_index>
						has_friend_scores = <has_friend_scores>
						enable_warnings = 0
					}
				elseif (<show_difficulty> = 1)
					<difficulty_text> = qs(0xa841e548)
					if (<target_difficulty> != expert_plus)
						get_difficulty_text difficulty = <target_difficulty>
					endif
					<text_format> = qs(0xdea1292e)
					formatText TextName = dialog_text <text_format> a = <difficulty_text> b = ($g_qp_challenge_instrument_strings [<index>]) c = <difficulty_text> d = ($g_qp_challenge_instrument_strings [<index>])
				else
					<text_format> = qs(0x4528008f)
					formatText TextName = dialog_text <text_format> i = ($g_qp_challenge_instrument_strings [<index>]) d = ($g_qp_challenge_instrument_strings [<index>])
				endif
				create_dialog_box {
					heading_text = qs(0xaa163738)
					body_text = <dialog_text>
					player_device = ($lb_controller)
					options = [
						{
							func = <0xfc42bcb7>
							func_params = <0x8dc83618>
							text = qs(0xd2915c27)
						}
						{
							func = <continue_script>
							func_params = <continue_script_params>
							text = qs(0x58e0a1fb)
						}
					]
					back_button_script = award_case_cancel_targeted_challenge
					back_button_params = {menu_id = <menu_id>}
				}
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
				endif
				break
			endif
			getnextplayer Player = <Player>
			repeat <num_players>
		endif
		if (<has_friend_scores> = 1)
			quickplay_save_specific_friend_stat friend_scores = <friend_scores> target_index = <target_index>
		endif
		if ui_event_exists_in_stack \{Name = 'songlist'}
			songlist_deinit_music_store
		endif
		quickplay_start_targeted_challenge song_name = <song_name> challenge_name = <challenge_name> instrument = <instrument>
	endif
endscript

script award_case_cancel_targeted_challenge \{menu_id = !q1768515945}
	if ScreenElementExists id = <menu_id>
		<menu_id> :se_setprops unblock_events
	endif
	destroy_dialog_box
endscript
