
script setup_competitive_meter 
	if ($cheat_hudfreemode = 1)
		return
	endif
	getnumplayersingame \{on_screen}
	getnumplayersingame \{local}
	if (<num_players> > 0)
		getfirstplayer \{local}
		begin
		attach_competitive_meters_to_highway Player = <Player>
		getnextplayer Player = <Player> local
		repeat <num_players>
	endif
	getnumplayersingame \{remote}
	if (<num_players> > 0)
		getfirstplayer \{remote}
		begin
		getplayerinfo <Player> is_onscreen
		if (<is_onscreen> = 0)
			add_player_to_competitive_scoreboard Player = <Player>
		else
			attach_competitive_meters_to_highway Player = <Player>
		endif
		getnextplayer Player = <Player> remote
		repeat <num_players>
	endif
endscript

script attach_competitive_meters_to_highway 
	RequireParams \{[
			Player
		]}
	getplayerinfo <Player> part
	get_highway_hud_root_id Player = <Player>
	alpha = 1.0
	if (($cheat_hudfreemode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	if (<part> != vocals)
		formatText checksumName = hud_cont 'sidebar_container_left_hudp%p' p = <Player> AddToStringLookup = true
		if NOT ScreenElementExists id = <hud_cont>
			return
		endif
		get_num_non_vocals_players_onscreen
		Pos = (0.0, 0.0)
		switch <num_non_vocals_players>
			case 1
			<Pos> = (-115.0, 105.0)
			case 2
			<Pos> = (-105.0, 105.0)
			case 3
			<Pos> = (-102.0, 95.0)
			case 4
			<Pos> = (-95.0, 80.0)
		endswitch
		formatText checksumName = rank_id 'p%p_competitive_rank' p = <Player>
		if ScreenElementExists id = <rank_id>
			DestroyScreenElement id = <rank_id>
		endif
		CreateScreenElement {
			parent = <hud_cont>
			id = <rank_id>
			Type = descinterface
			desc = 'HUD_SideBar_RankMeter'
			Pos = <Pos>
			autosizedims = true
			preserve_local_orientation = true
			rot_angle = 0
		}
		<rank_id> :obj_spawnscript update_combo_meter_sp_glow params = {obj_id = <rank_id>}
		if NOT ScreenElementExists id = <highway_hud_root>
			ScriptAssert 'player %p hud root not found in attach_competitive_meters_to_highway!' p = <Player>
		endif
		if <highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
			safe_show id = <hud_player_meter>
			if <hud_player_meter> :desc_resolvealias Name = alias_hud_sidebar_rankmeter param = side_rank_meter
				safe_hide id = <side_rank_meter>
			endif
			if <hud_player_meter> :desc_resolvealias Name = alias_vocals_strikes_meter param = strikes_meter
				safe_hide id = <strikes_meter>
			endif
		endif
	else
		if NOT ScreenElementExists id = <highway_hud_root>
			ScriptAssert 'player %p hud root not found to attach vocals competitive meter' p = <Player>
		endif
		vocal_highway_hud_init_competitive_meter highway_hud_root = <highway_hud_root> Player = <Player>
		return
	endif
	get_highway_hud_root_id Player = <Player>
	if NOT ScreenElementExists id = <highway_hud_root>
		ScriptAssert 'Player %p hud root not found for update_comptitive_highway_meter' p = <Player>
	endif
	if <highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
		<hud_player_meter> :desc_resolvealias Name = alias_competitive_score param = score_id
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
			<divide_by_10> = FALSE
		endif
		getplayerinfo <Player> hud_id
		attachhudwidget {
			Input = {
				object = <hud_id>
				value = note_streak
			}
			outputs = [
				{
					Type = seinttostring
					desc_id = <hud_player_meter>
					property = meter_text
					divide_by_10 = <divide_by_10>
				}
				{
					Type = screenelementconditionalint
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
		params = {Player = <Player> attached_to_highway = 1 element_id = <rank_id>}
	}
endscript

script update_competitive_highway_meter 
	RequireParams \{[
			Player
			rank_id
			rank
			score
		]
		all}
	getplayerinfo <Player> part
	if (<part> != vocals)
		formatText checksumName = rank_id 'p%p_competitive_rank' p = <Player>
		if NOT ScreenElementExists id = <rank_id>
			printf qs(0xabb60701) a = <rank_id> p = <Player>
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
	get_highway_hud_root_id Player = <Player>
	if NOT ScreenElementExists id = <highway_hud_root>
		printf qs(0x2b813925) p = <Player>
		return
	endif
	if (<part> = vocals)
		formatText checksumName = competitive_meters_id 'comp_meters_p%a' a = <Player>
		if NOT ScreenElementExists id = <competitive_meters_id>
			printf qs(0xa2194316) a = <Player>
			return
		endif
		<competitive_meters_id> :desc_resolvealias Name = alias_competitive_score param = score_id
	else
		get_highway_hud_root_id Player = <Player>
		if <highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
			<hud_player_meter> :desc_resolvealias Name = alias_competitive_score param = score_id
		endif
		highway_hud_id = <highway_hud_root>
	endif
	if NOT ScreenElementExists id = <score_id>
		printf qs(0xc9653fcc) p = <Player>
		return
	endif
	formatText TextName = score_text qs(0x8c5c152d) n = <score>
	<score_id> :se_setprops text_text = <score_text>
endscript

script competitive_meter_get_rank_text 
	rank_text = qs(0x3216e324)
	switch <rank>
		case 0
		rank_text = qs(0xc4992bba)
		case 1
		formatText TextName = rank_text qs(0x886c78ab) n = <rank>
		case 2
		formatText TextName = rank_text qs(0x60dde5b8) n = <rank>
		case 3
		formatText TextName = rank_text qs(0x7a120d9f) n = <rank>
		case 4
		formatText TextName = rank_text qs(0xf3cc1d4f) n = <rank>
		case 5
		formatText TextName = rank_text qs(0xf3cc1d4f) n = <rank>
		case 6
		formatText TextName = rank_text qs(0xf3cc1d4f) n = <rank>
		case 7
		formatText TextName = rank_text qs(0xf3cc1d4f) n = <rank>
		case 8
		formatText TextName = rank_text qs(0xf3cc1d4f) n = <rank>
	endswitch
	return rank_text = <rank_text>
endscript

script add_player_to_competitive_scoreboard 
	RequireParams \{[
			Player
		]
		all}
	vocals_get_num_vocalists_onscreen
	get_num_non_vocals_players_onscreen
	if (<num_vocalists_shown> > 0 && <num_non_vocals_players> > 0)
		return
	endif
	if (<num_vocalists_shown> > 1 && <num_non_vocals_players> = 0)
		if hud_root :desc_resolvealias \{Name = alias_versus_meter
				param = versus_meter}
			return
		endif
	endif
	GetScreenElementChildren \{id = hud_root}
	if NOT ScreenElementExists \{id = hud_root}
		ScriptAssert \{'hud root not found for add player to scoreboard'}
	endif
	if NOT hud_root :desc_resolvealias \{Name = alias_scoreboard_menu
			param = scoreboard_menu}
		ScriptAssert \{'alias_scoreboard_menu not found for add player to scoreboard'}
	endif
	vocals_get_num_vocalists_onscreen
	if (<num_vocalists_shown> > 1)
		getfirstplayer \{local
			out = first_player}
		getplayerinfo <first_player> vocals_highway_view
		if (<vocals_highway_view> = scrolling)
			<scoreboard_menu> :se_setprops Pos = (625.0, 220.0)
		else
			<scoreboard_menu> :se_setprops Pos = (625.0, 253.0)
		endif
	endif
	CreateScreenElement {
		parent = <scoreboard_menu>
		Type = descinterface
		desc = 'comp_scoreboard_player'
		autosizedims = true
	}
	countscreenelementchildren id = <scoreboard_menu>
	if (<num_children> > 4)
		if (<num_vocalists_shown> > 1)
			<scoreboard_menu> :se_setprops Scale = (0.63, 0.63)
		else
			<scoreboard_menu> :se_setprops Scale = (0.74, 0.74)
		endif
	endif
	getplayerinfo <Player> gamertag
	<id> :se_setprops gamertag_text = ($<gamertag>)
	if <id> :desc_resolvealias Name = alias_rankmeter param = rank_meter
		<rank_meter> :obj_spawnscript update_combo_meter_sp_glow params = {obj_id = <rank_meter>}
	endif
	gman_competitivemeterfunc {
		goal = competitive
		tool = comp_meter
		func = set_element_props
		params = {Player = <Player> attached_to_highway = 0 element_id = <id>}
	}
	safe_show id = <scoreboard_menu>
endscript

script update_competitive_scoreboard_meter 
	RequireParams \{[
			Player
			scoreboard_id
			rank
			score
		]
		all}
	if NOT ScreenElementExists id = <scoreboard_id>
		ScriptAssert 'scoreboard %a not found in update_comptitive_scoreboard_meter' a = <scoreboard_id> p = <Player>
	endif
	if <scoreboard_id> :desc_resolvealias Name = alias_rankmeter param = rank_meter
		competitive_meter_get_rank_text rank = <rank>
		<rank_meter> :se_setprops rank_text = <rank_text>
		if (<rank> = 1)
			<rank_meter> :se_setprops burstcontainer_alpha = 1
		else
			<rank_meter> :se_setprops burstcontainer_alpha = 0
		endif
	endif
	formatText TextName = score_text qs(0x8c5c152d) n = <score> usecommas
	<scoreboard_id> :se_setprops score_text = <score_text>
endscript

script destroy_competitive_scoreboard 
	if ScreenElementExists \{id = comp_scoreboard}
		DestroyScreenElement \{id = comp_scoreboard}
	endif
endscript

script competitive_meter_update_strikes 
	printf channel = goal 'Goal Utility: Competitive Meter: Update Strikes (%s for player %p)' p = <Player> s = <strikes>
	getplayerinfo <Player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	get_highway_hud_root_id Player = <Player>
	getplayerinfo <Player> part
	if (<part> = vocals)
		formatText checksumName = container_id 'comp_strike_box_p%p' p = <Player>
		if NOT ScreenElementExists id = <container_id>
			getplayerinfo <Player> part
			if NOT (<part> = vocals)
				formatText checksumName = parent_id 'gem_containerp%p' p = <Player>
				CreateScreenElement {
					id = <container_id>
					Type = ContainerElement
					parent = <parent_id>
				}
			else
				formatText checksumName = parent_id 'comp_meters_p%p' p = <Player>
				CreateScreenElement {
					id = <container_id>
					Type = ContainerElement
					parent = <parent_id>
				}
			endif
		endif
		DestroyScreenElement id = <container_id> preserve_parent
		formatText checksumName = competitive_meters_id 'comp_meters_p%a' a = <Player>
		if ScreenElementExists id = <competitive_meters_id>
			<competitive_meters_id> :desc_resolvealias Name = alias_vocals_strikes_meter param = strikes_meter
		endif
	else
		<highway_hud_root> :desc_resolvealias Name = alias_player_meter param = hud_player_meter
		<hud_player_meter> :desc_resolvealias Name = alias_vocals_strikes_meter param = strikes_meter
	endif
	if GotParam \{strikes_meter}
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
			ScriptAssert \{'Players can only have between 0-2 strikes'}
		endswitch
	endif
endscript
