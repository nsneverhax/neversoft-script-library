
script setup_competitive_meter 
	if ($Cheat_HUDFreeMode = 1)
		return
	endif
	GetNumPlayersInGame \{on_screen}
	GetNumPlayersInGame \{local}
	if (<num_players> > 0)
		GetFirstPlayer \{local}
		begin
		attach_competitive_meters_to_highway player = <player>
		GetNextPlayer player = <player> local
		repeat <num_players>
	endif
	GetNumPlayersInGame \{remote}
	if (<num_players> > 0)
		GetFirstPlayer \{remote}
		begin
		GetPlayerInfo <player> is_onscreen
		if (<is_onscreen> = 0)
			add_player_to_competitive_scoreboard player = <player>
		else
			attach_competitive_meters_to_highway player = <player>
		endif
		GetNextPlayer player = <player> remote
		repeat <num_players>
	endif
endscript

script attach_competitive_meters_to_highway 
	RequireParams \{[
			player
		]}
	GetPlayerInfo <player> part
	get_highway_hud_root_id player = <player>
	alpha = 1.0
	if (($Cheat_HUDFreeMode >= 1) || ($end_credits = 1))
		alpha = 0.0
	endif
	if (<part> != vocals)
		FormatText checksumname = hud_cont 'sidebar_container_left_hudp%p' p = <player> AddToStringLookup = true
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
		FormatText checksumname = rank_id 'p%p_competitive_rank' p = <player>
		if ScreenElementExists id = <rank_id>
			DestroyScreenElement id = <rank_id>
		endif
		CreateScreenElement {
			parent = <hud_cont>
			id = <rank_id>
			type = DescInterface
			desc = 'HUD_SideBar_RankMeter'
			Pos = <Pos>
			autoSizeDims = true
			preserve_local_orientation = true
			rot_angle = 0
		}
		<rank_id> :Obj_SpawnScript update_combo_meter_sp_glow params = {obj_id = <rank_id>}
		if NOT ScreenElementExists id = <highway_hud_root>
			ScriptAssert 'player %p hud root not found in attach_competitive_meters_to_highway!' p = <player>
		endif
		if <highway_hud_root> :Desc_ResolveAlias name = alias_player_meter param = hud_player_meter
			safe_show id = <hud_player_meter>
			if <hud_player_meter> :Desc_ResolveAlias name = alias_HUD_Sidebar_RankMeter param = side_rank_meter
				safe_hide id = <side_rank_meter>
			endif
			if <hud_player_meter> :Desc_ResolveAlias name = alias_vocals_strikes_meter param = strikes_meter
				safe_hide id = <strikes_meter>
			endif
		endif
	else
		if NOT ScreenElementExists id = <highway_hud_root>
			ScriptAssert 'player %p hud root not found to attach vocals competitive meter' p = <player>
		endif
		vocal_highway_hud_init_competitive_meter highway_hud_root = <highway_hud_root> player = <player>
		return
	endif
	get_highway_hud_root_id player = <player>
	if NOT ScreenElementExists id = <highway_hud_root>
		ScriptAssert 'Player %p hud root not found for update_comptitive_highway_meter' p = <player>
	endif
	if <highway_hud_root> :Desc_ResolveAlias name = alias_player_meter param = hud_player_meter
		<hud_player_meter> :Desc_ResolveAlias name = alias_competitive_score param = score_id
	endif
	get_num_non_vocals_players_onscreen
	GetNumPlayersInGame \{on_screen}
	if (<num_players_shown> = 1 && <num_non_vocals_players> = 1)
		net_one_highway_meter_pos = (10.0, -153.0)
		<highway_hud_root> :SE_SetProps player_meter_pos = <net_one_highway_meter_pos>
	endif
	ruleset = ($competitive_rules)
	if (<ruleset> = faceoff)
		if (<part> = vocals)
			<divide_by_10> = true
		else
			<divide_by_10> = false
		endif
		GetPlayerInfo <player> hud_id
		AttachHudWidget {
			Input = {
				Object = <hud_id>
				value = note_streak
			}
			outputs = [
				{
					type = SEIntToString
					desc_id = <hud_player_meter>
					property = meter_text
					divide_by_10 = <divide_by_10>
				}
				{
					type = ScreenElementConditionalInt
					desc_id = <hud_player_meter>
					property = meter_text_alpha
					value_range = [30 10000000]
				}
			]
		}
	endif
	GMan_CompetitiveMeterFunc {
		goal = competitive
		tool = comp_meter
		func = set_element_props
		params = {player = <player> attached_to_highway = 1 element_id = <rank_id>}
	}
endscript

script update_competitive_highway_meter 
	RequireParams \{[
			player
			rank_id
			rank
			score
		]
		all}
	GetPlayerInfo <player> part
	if (<part> != vocals)
		FormatText checksumname = rank_id 'p%p_competitive_rank' p = <player>
		if NOT ScreenElementExists id = <rank_id>
			printf qs(0xabb60701) a = <rank_id> p = <player>
			return
		endif
	endif
	competitive_meter_get_rank_text rank = <rank>
	<rank_id> :SE_SetProps rank_text = <rank_text>
	if (<rank> = 1)
		<rank_id> :SE_SetProps BurstContainer_alpha = 1
	else
		<rank_id> :SE_SetProps BurstContainer_alpha = 0
	endif
	get_highway_hud_root_id player = <player>
	if NOT ScreenElementExists id = <highway_hud_root>
		printf qs(0x2b813925) p = <player>
		return
	endif
	if (<part> = vocals)
		FormatText checksumname = competitive_meters_id 'comp_meters_p%a' a = <player>
		if NOT ScreenElementExists id = <competitive_meters_id>
			printf qs(0xa2194316) a = <player>
			return
		endif
		<competitive_meters_id> :Desc_ResolveAlias name = alias_competitive_score param = score_id
	else
		get_highway_hud_root_id player = <player>
		if <highway_hud_root> :Desc_ResolveAlias name = alias_player_meter param = hud_player_meter
			<hud_player_meter> :Desc_ResolveAlias name = alias_competitive_score param = score_id
		endif
		highway_hud_id = <highway_hud_root>
	endif
	if NOT ScreenElementExists id = <score_id>
		printf qs(0xc9653fcc) p = <player>
		return
	endif
	FormatText TextName = score_text qs(0x8c5c152d) n = <score>
	<score_id> :SE_SetProps text_text = <score_text>
endscript

script competitive_meter_get_rank_text 
	rank_text = qs(0x3216e324)
	switch <rank>
		case 0
		rank_text = qs(0xc4992bba)
		case 1
		FormatText TextName = rank_text qs(0x886c78ab) n = <rank>
		case 2
		FormatText TextName = rank_text qs(0x60dde5b8) n = <rank>
		case 3
		FormatText TextName = rank_text qs(0x7a120d9f) n = <rank>
		case 4
		FormatText TextName = rank_text qs(0xf3cc1d4f) n = <rank>
		case 5
		FormatText TextName = rank_text qs(0xf3cc1d4f) n = <rank>
		case 6
		FormatText TextName = rank_text qs(0xf3cc1d4f) n = <rank>
		case 7
		FormatText TextName = rank_text qs(0xf3cc1d4f) n = <rank>
		case 8
		FormatText TextName = rank_text qs(0xf3cc1d4f) n = <rank>
	endswitch
	return rank_text = <rank_text>
endscript

script add_player_to_competitive_scoreboard 
	RequireParams \{[
			player
		]
		all}
	vocals_get_num_vocalists_onscreen
	get_num_non_vocals_players_onscreen
	if (<num_vocalists_shown> > 0 && <num_non_vocals_players> > 0)
		return
	endif
	if (<num_vocalists_shown> > 1 && <num_non_vocals_players> = 0)
		if hud_root :Desc_ResolveAlias \{name = alias_versus_meter
				param = versus_meter}
			return
		endif
	endif
	GetScreenElementChildren \{id = hud_root}
	if NOT ScreenElementExists \{id = hud_root}
		ScriptAssert \{'hud root not found for add player to scoreboard'}
	endif
	if NOT hud_root :Desc_ResolveAlias \{name = alias_scoreboard_menu
			param = scoreboard_menu}
		ScriptAssert \{'alias_scoreboard_menu not found for add player to scoreboard'}
	endif
	vocals_get_num_vocalists_onscreen
	if (<num_vocalists_shown> > 1)
		GetFirstPlayer \{local
			out = first_player}
		GetPlayerInfo <first_player> vocals_highway_view
		if (<vocals_highway_view> = scrolling)
			<scoreboard_menu> :SE_SetProps Pos = (625.0, 220.0)
		else
			<scoreboard_menu> :SE_SetProps Pos = (625.0, 253.0)
		endif
	endif
	CreateScreenElement {
		parent = <scoreboard_menu>
		type = DescInterface
		desc = 'comp_scoreboard_player'
		autoSizeDims = true
	}
	CountScreenElementChildren id = <scoreboard_menu>
	if (<num_children> > 4)
		if (<num_vocalists_shown> > 1)
			<scoreboard_menu> :SE_SetProps scale = (0.63, 0.63)
		else
			<scoreboard_menu> :SE_SetProps scale = (0.74, 0.74)
		endif
	endif
	GetPlayerInfo <player> GamerTag
	<id> :SE_SetProps GamerTag_text = ($<GamerTag>)
	if <id> :Desc_ResolveAlias name = alias_RankMeter param = rank_meter
		<rank_meter> :Obj_SpawnScript update_combo_meter_sp_glow params = {obj_id = <rank_meter>}
	endif
	GMan_CompetitiveMeterFunc {
		goal = competitive
		tool = comp_meter
		func = set_element_props
		params = {player = <player> attached_to_highway = 0 element_id = <id>}
	}
	safe_show id = <scoreboard_menu>
endscript

script update_competitive_scoreboard_meter 
	RequireParams \{[
			player
			scoreboard_id
			rank
			score
		]
		all}
	if NOT ScreenElementExists id = <scoreboard_id>
		ScriptAssert 'scoreboard %a not found in update_comptitive_scoreboard_meter' a = <scoreboard_id> p = <player>
	endif
	if <scoreboard_id> :Desc_ResolveAlias name = alias_RankMeter param = rank_meter
		competitive_meter_get_rank_text rank = <rank>
		<rank_meter> :SE_SetProps rank_text = <rank_text>
		if (<rank> = 1)
			<rank_meter> :SE_SetProps BurstContainer_alpha = 1
		else
			<rank_meter> :SE_SetProps BurstContainer_alpha = 0
		endif
	endif
	FormatText TextName = score_text qs(0x8c5c152d) n = <score> UseCommas
	<scoreboard_id> :SE_SetProps score_text = <score_text>
endscript

script destroy_competitive_scoreboard 
	if ScreenElementExists \{id = comp_scoreboard}
		DestroyScreenElement \{id = comp_scoreboard}
	endif
endscript

script competitive_meter_update_strikes 
	printf channel = goal 'Goal Utility: Competitive Meter: Update Strikes (%s for player %p)' p = <player> s = <strikes>
	GetPlayerInfo <player> is_onscreen
	if (<is_onscreen> = 0)
		return
	endif
	get_highway_hud_root_id player = <player>
	GetPlayerInfo <player> part
	if (<part> = vocals)
		FormatText checksumname = container_id 'comp_strike_box_p%p' p = <player>
		if NOT ScreenElementExists id = <container_id>
			GetPlayerInfo <player> part
			if NOT (<part> = vocals)
				FormatText checksumname = parent_id 'gem_containerp%p' p = <player>
				CreateScreenElement {
					id = <container_id>
					type = ContainerElement
					parent = <parent_id>
				}
			else
				FormatText checksumname = parent_id 'comp_meters_p%p' p = <player>
				CreateScreenElement {
					id = <container_id>
					type = ContainerElement
					parent = <parent_id>
				}
			endif
		endif
		DestroyScreenElement id = <container_id> preserve_parent
		FormatText checksumname = competitive_meters_id 'comp_meters_p%a' a = <player>
		if ScreenElementExists id = <competitive_meters_id>
			<competitive_meters_id> :Desc_ResolveAlias name = alias_vocals_strikes_meter param = strikes_meter
		endif
	else
		<highway_hud_root> :Desc_ResolveAlias name = alias_player_meter param = hud_player_meter
		<hud_player_meter> :Desc_ResolveAlias name = alias_vocals_strikes_meter param = strikes_meter
	endif
	if GotParam \{strikes_meter}
		switch (<strikes>)
			case 0
			printf \{qs(0xa207fbc2)}
			safe_hide id = <strikes_meter>
			<strikes_meter> :SE_SetProps strike1_alpha = 0.0
			<strikes_meter> :SE_SetProps strike2_alpha = 0.0
			case 1
			printf \{qs(0x14fc6730)}
			safe_show id = <strikes_meter>
			<strikes_meter> :SE_SetProps strike1_alpha = 1.0
			<strikes_meter> :SE_SetProps strike2_alpha = 0.0
			case 2
			printf \{qs(0xa13eb8b0)}
			safe_show id = <strikes_meter>
			<strikes_meter> :SE_SetProps strike1_alpha = 1.0
			<strikes_meter> :SE_SetProps strike2_alpha = 1.0
			default
			ScriptAssert \{'Players can only have between 0-2 strikes'}
		endswitch
	endif
endscript
