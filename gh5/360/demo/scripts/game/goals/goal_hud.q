
script setup_competitive_meter 
	if ($cheat_hudfreemode = 1)
		return
	endif
	getnumplayersingame \{on_screen}
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		attach_competitive_meters_to_highway player = <player>
		getnextplayer player = <player> local
		repeat <num_players>
	endif
	getnumplayersingame \{remote}
	if (<num_players> > 0)
		getfirstplayer \{remote}
		begin
		getplayerinfo <player> is_onscreen
		if (<is_onscreen> = 0)
			add_player_to_competitive_scoreboard player = <player>
		else
			attach_competitive_meters_to_highway player = <player>
		endif
		getnextplayer player = <player> remote
		repeat <num_players>
	endif
endscript

script attach_competitive_meters_to_highway 
	requireparams \{[
			player
		]}
	getplayerinfo <player> part
	get_highway_hud_root_id player = <player>
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	if (<part> != vocals)
		formattext checksumname = hud_cont 'sidebar_container_left_hudp%p' p = <player> addtostringlookup = true
		if NOT screenelementexists id = <hud_cont>
			return
		endif
		get_num_non_vocals_players_onscreen
		pos = (0.0, 0.0)
		switch <num_non_vocals_players>
			case 1
			<pos> = (-115.0, 105.0)
			case 2
			<pos> = (-105.0, 105.0)
			case 3
			<pos> = (-102.0, 95.0)
			case 4
			<pos> = (-95.0, 80.0)
		endswitch
		formattext checksumname = rank_id 'p%p_competitive_rank' p = <player>
		if screenelementexists id = <rank_id>
			destroyscreenelement id = <rank_id>
		endif
		createscreenelement {
			parent = <hud_cont>
			id = <rank_id>
			type = descinterface
			desc = 'HUD_SideBar_RankMeter'
			pos = <pos>
			autosizedims = true
			preserve_local_orientation = true
			rot_angle = 0
		}
		<rank_id> :obj_spawnscript update_combo_meter_sp_glow params = {obj_id = <rank_id>}
		if NOT screenelementexists id = <highway_hud_root>
			scriptassert 'player %p hud root not found in attach_competitive_meters_to_highway!' p = <player>
		endif
		if <highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
			safe_show id = <hud_player_meter>
			if <hud_player_meter> :desc_resolvealias name = alias_hud_sidebar_rankmeter param = side_rank_meter
				safe_hide id = <side_rank_meter>
			endif
			if <hud_player_meter> :desc_resolvealias name = alias_vocals_strikes_meter param = strikes_meter
				safe_hide id = <strikes_meter>
			endif
		endif
	else
		if NOT screenelementexists id = <highway_hud_root>
			scriptassert 'player %p hud root not found to attach vocals competitive meter' p = <player>
		endif
		vocal_highway_hud_init_competitive_meter highway_hud_root = <highway_hud_root> player = <player>
		return
	endif
	get_highway_hud_root_id player = <player>
	if NOT screenelementexists id = <highway_hud_root>
		scriptassert 'Player %p hud root not found for update_comptitive_highway_meter' p = <player>
	endif
	if <highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
		<hud_player_meter> :desc_resolvealias name = alias_competitive_score param = score_id
	endif
	get_num_non_vocals_players_onscreen
	getnumplayersingame \{on_screen}
	if (<num_players_shown> = 1 && <num_non_vocals_players> = 1)
		net_one_highway_meter_pos = (10.0, -153.0)
		<highway_hud_root> :se_setprops player_meter_pos = <net_one_highway_meter_pos>
	endif
	ruleset = ($competitive_rules)
	if (<ruleset> = faceoff)
		if (<part> = vocals)
			<divide_by_10> = true
		else
			<divide_by_10> = false
		endif
		getplayerinfo <player> hud_id
		attachhudwidget {
			input = {
				object = <hud_id>
				value = note_streak
			}
			outputs = [
				{
					type = seinttostring
					desc_id = <hud_player_meter>
					property = meter_text
					divide_by_10 = <divide_by_10>
				}
				{
					type = screenelementconditionalint
					desc_id = <hud_player_meter>
					property = meter_text_alpha
					value_range = [30 10000000]
				}
			]
		}
	endif
	gman_competitivemeterfunc {
		goal = competitive
		tool = comp_meter
		func = set_element_props
		params = {player = <player> attached_to_highway = 1 element_id = <rank_id>}
	}
endscript

script update_competitive_highway_meter 
	requireparams \{[
			player
			rank_id
			rank
			score
		]
		all}
	getplayerinfo <player> part
	if (<part> != vocals)
		formattext checksumname = rank_id 'p%p_competitive_rank' p = <player>
		if NOT screenelementexists id = <rank_id>
			printf qs(0xabb60701) a = <rank_id> p = <player>
			return
		endif
	endif
	competitive_meter_get_rank_text rank = <rank>
	<rank_id> :se_setprops rank_text = <rank_text>
	if (<rank> = 1)
		<rank_id> :se_setprops burstcontainer_alpha = 1
	else
		<rank_id> :se_setprops burstcontainer_alpha = 0
	endif
	get_highway_hud_root_id player = <player>
	if NOT screenelementexists id = <highway_hud_root>
		printf qs(0x2b813925) p = <player>
		return
	endif
	if (<part> = vocals)
		formattext checksumname = competitive_meters_id 'comp_meters_p%a' a = <player>
		if NOT screenelementexists id = <competitive_meters_id>
			printf qs(0xa2194316) a = <player>
			return
		endif
		<competitive_meters_id> :desc_resolvealias name = alias_competitive_score param = score_id
	else
		get_highway_hud_root_id player = <player>
		if <highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
			<hud_player_meter> :desc_resolvealias name = alias_competitive_score param = score_id
		endif
		highway_hud_id = <highway_hud_root>
	endif
	if NOT screenelementexists id = <score_id>
		printf qs(0xc9653fcc) p = <player>
		return
	endif
	formattext textname = score_text qs(0x8c5c152d) n = <score>
	<score_id> :se_setprops text_text = <score_text>
endscript

script competitive_meter_get_rank_text 
	rank_text = qs(0x3216e324)
	switch <rank>
		case 0
		rank_text = qs(0xc4992bba)
		case 1
		formattext textname = rank_text qs(0x886c78ab) n = <rank>
		case 2
		formattext textname = rank_text qs(0x60dde5b8) n = <rank>
		case 3
		formattext textname = rank_text qs(0x7a120d9f) n = <rank>
		case 4
		formattext textname = rank_text qs(0xf3cc1d4f) n = <rank>
		case 5
		formattext textname = rank_text qs(0xf3cc1d4f) n = <rank>
		case 6
		formattext textname = rank_text qs(0xf3cc1d4f) n = <rank>
		case 7
		formattext textname = rank_text qs(0xf3cc1d4f) n = <rank>
		case 8
		formattext textname = rank_text qs(0xf3cc1d4f) n = <rank>
	endswitch
	return rank_text = <rank_text>
endscript

script add_player_to_competitive_scoreboard 
	requireparams \{[
			player
		]
		all}
	vocals_get_num_vocalists_onscreen
	get_num_non_vocals_players_onscreen
	if (<num_vocalists_shown> > 0 && <num_non_vocals_players> > 0)
		return
	endif
	if (<num_vocalists_shown> > 1 && <num_non_vocals_players> = 0)
		if hud_root :desc_resolvealias \{name = alias_versus_meter
				param = versus_meter}
			return
		endif
	endif
	getscreenelementchildren \{id = hud_root}
	if NOT screenelementexists \{id = hud_root}
		scriptassert \{'hud root not found for add player to scoreboard'}
	endif
	if NOT hud_root :desc_resolvealias \{name = alias_scoreboard_menu
			param = scoreboard_menu}
		scriptassert \{'alias_scoreboard_menu not found for add player to scoreboard'}
	endif
	vocals_get_num_vocalists_onscreen
	if (<num_vocalists_shown> > 1)
		getfirstplayer \{local
			out = first_player}
		getplayerinfo <first_player> vocals_highway_view
		if (<vocals_highway_view> = scrolling)
			<scoreboard_menu> :se_setprops pos = (625.0, 220.0)
		else
			<scoreboard_menu> :se_setprops pos = (625.0, 253.0)
		endif
	endif
	createscreenelement {
		parent = <scoreboard_menu>
		type = descinterface
		desc = 'comp_scoreboard_player'
		autosizedims = true
	}
	countscreenelementchildren id = <scoreboard_menu>
	if (<num_children> > 4)
		if (<num_vocalists_shown> > 1)
			<scoreboard_menu> :se_setprops scale = (0.63, 0.63)
		else
			<scoreboard_menu> :se_setprops scale = (0.74, 0.74)
		endif
	endif
	getplayerinfo <player> gamertag
	<id> :se_setprops gamertag_text = ($<gamertag>)
	if <id> :desc_resolvealias name = alias_rankmeter param = rank_meter
		<rank_meter> :obj_spawnscript update_combo_meter_sp_glow params = {obj_id = <rank_meter>}
	endif
	gman_competitivemeterfunc {
		goal = competitive
		tool = comp_meter
		func = set_element_props
		params = {player = <player> attached_to_highway = 0 element_id = <id>}
	}
	safe_show id = <scoreboard_menu>
endscript

script update_competitive_scoreboard_meter 
	requireparams \{[
			player
			scoreboard_id
			rank
			score
		]
		all}
	if NOT screenelementexists id = <scoreboard_id>
		scriptassert 'scoreboard %a not found in update_comptitive_scoreboard_meter' a = <scoreboard_id> p = <player>
	endif
	if <scoreboard_id> :desc_resolvealias name = alias_rankmeter param = rank_meter
		competitive_meter_get_rank_text rank = <rank>
		<rank_meter> :se_setprops rank_text = <rank_text>
		if (<rank> = 1)
			<rank_meter> :se_setprops burstcontainer_alpha = 1
		else
			<rank_meter> :se_setprops burstcontainer_alpha = 0
		endif
	endif
	formattext textname = score_text qs(0x8c5c152d) n = <score> usecommas
	<scoreboard_id> :se_setprops score_text = <score_text>
endscript

script destroy_competitive_scoreboard 
	if screenelementexists \{id = comp_scoreboard}
		destroyscreenelement \{id = comp_scoreboard}
	endif
endscript

script competitive_meter_update_strikes 
	printf channel = goal 'Goal Utility: Competitive Meter: Update Strikes (%s for player %p)' p = <player> s = <strikes>
	getplayerinfo <player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	get_highway_hud_root_id player = <player>
	getplayerinfo <player> part
	if (<part> = vocals)
		formattext checksumname = container_id 'comp_strike_box_p%p' p = <player>
		if NOT screenelementexists id = <container_id>
			getplayerinfo <player> part
			if NOT (<part> = vocals)
				formattext checksumname = parent_id 'gem_containerp%p' p = <player>
				createscreenelement {
					id = <container_id>
					type = containerelement
					parent = <parent_id>
				}
			else
				formattext checksumname = parent_id 'comp_meters_p%p' p = <player>
				createscreenelement {
					id = <container_id>
					type = containerelement
					parent = <parent_id>
				}
			endif
		endif
		destroyscreenelement id = <container_id> preserve_parent
		formattext checksumname = competitive_meters_id 'comp_meters_p%a' a = <player>
		if screenelementexists id = <competitive_meters_id>
			<competitive_meters_id> :desc_resolvealias name = alias_vocals_strikes_meter param = strikes_meter
		endif
	else
		<highway_hud_root> :desc_resolvealias name = alias_player_meter param = hud_player_meter
		<hud_player_meter> :desc_resolvealias name = alias_vocals_strikes_meter param = strikes_meter
	endif
	if gotparam \{strikes_meter}
		switch (<strikes>)
			case 0
			printf \{qs(0xa207fbc2)}
			safe_hide id = <strikes_meter>
			<strikes_meter> :se_setprops strike1_alpha = 0.0
			<strikes_meter> :se_setprops strike2_alpha = 0.0
			case 1
			printf \{qs(0x14fc6730)}
			safe_show id = <strikes_meter>
			<strikes_meter> :se_setprops strike1_alpha = 1.0
			<strikes_meter> :se_setprops strike2_alpha = 0.0
			case 2
			printf \{qs(0xa13eb8b0)}
			safe_show id = <strikes_meter>
			<strikes_meter> :se_setprops strike1_alpha = 1.0
			<strikes_meter> :se_setprops strike2_alpha = 1.0
			default
			scriptassert \{'Players can only have between 0-2 strikes'}
		endswitch
	endif
endscript
