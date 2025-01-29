
script ui_create_cash_milestones 
	ui_cash_milestones_build_page_for_1p
endscript

script ui_destroy_cash_milestones 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_milestones_id}
endscript

script ui_deinit_cash_milestones 
	progression_cashmilestonesclear
endscript

script ui_cash_milestones_build_page_for_mp 
	get_current_band_info
	GetGlobalTags <band_info>
	if ScreenElementExists \{id = my_milestones_id}
		DestroyScreenElement \{id = my_milestones_id}
	endif
	CreateScreenElement \{parent = root_window
		id = my_milestones_id
		Type = descinterface
		desc = 'cash_milestones_mp_band'}
	my_milestones_id :obj_spawnscript \{highlight_motion
		params = {
			menu_id = my_milestones_id
		}}
	if my_milestones_id :desc_resolvealias \{Name = alias_cash_milestones_mp_list}
	else
		ScriptAssert \{qs(0xd06d1448)}
	endif
	cnt = 0
	begin
	p_cash = (($cash_milestones_band_ui) [<cnt>])
	gig_cash_earned = (<p_cash>.total_cash)
	formatText TextName = gig_cash qs(0x447de8d3) d = <gig_cash_earned>
	cash_ranks_get_rank Player = (<cnt> + 1)
	cash_ranks_get_icon_id Player = (<cnt> + 1)
	formatText TextName = player_name qs(0x8c021f45) d = (<cnt> + 1)
	getplayerinfo (<cnt> + 1) part
	switch (<part>)
		case guitar
		icon_texture = mixer_icon_guitar
		case bass
		icon_texture = mixer_icon_bass
		case drum
		icon_texture = mixer_icon_drums
		case vocals
		icon_texture = mixer_icon_vox
	endswitch
	formatText TextName = car_earnings_txt qs(0x447de8d3) d = (<career_earnings> + <gig_cash_earned>)
	formatText TextName = rank_txt qs(0x48c6d14c) d = <rank>
	CreateScreenElement {
		parent = <resolved_id>
		Type = descinterface
		desc = 'cash_milestones_row_mp'
		autosizedims = true
		gig_cash_text = <gig_cash>
		career_earnings_text = qs(0xc768e0ed)
		cash_milestones_icon_texture = <cash_icon_id>
		player_name_text = <player_name>
		mixer_icon_guitar_texture = <icon_texture>
		career_earnings_text = <car_earnings_txt>
		number_text_text = <rank_txt>
		event_handlers = [
			{pad_back generic_event_back}
		]
		v}
	cnt = (<cnt> + 1)
	repeat ($current_num_players)
	SpawnScriptNow ui_milestones_set_focus_to_menu params = {menu_id = <resolved_id>}
endscript

script ui_cash_milestones_build_page_for_1p 
	my_get_player_data
	gig_earnings = ($cash_milestones_gig_total)
	cash_ranks_get_rank
	cash_ranks_get_patch_id
	formatText TextName = car_earn qs(0xbe2b541b) d = <career_earnings> usecommas
	formatText TextName = car_rank qs(0xce985b63) d = <rank>
	formatText TextName = gig_earn qs(0xc5d1b38b) d = <gig_earnings> usecommas
	if ScreenElementExists \{id = my_milestones_id}
		DestroyScreenElement \{id = my_milestones_id}
	endif
	get_current_band_info
	GetGlobalTags <band_info> param = Name
	CreateScreenElement {
		parent = root_window
		id = my_milestones_id
		Type = descinterface
		desc = 'cash_milestones'
		cash_milestone_player_name_text = <Name>
		cash_milestones_career_total_text = <car_earn>
		cash_milestones_title_text = <car_rank>
		cash_milestones_patch_texture = <cash_patch_id>
	}
	my_milestones_id :obj_spawnscript \{highlight_motion
		params = {
			menu_id = my_milestones_id
		}}
	ui_cash_milestones_build_cash_rank_list <...>
	index = (<rank> -1)
	GetArraySize \{$cash_rank_blurbs}
	if (<index> < 0)
		index = 0
	elseif (<index> >= <array_Size>)
		index = (<array_Size> - 1)
	endif
	blurb = (($cash_rank_blurbs) [<index>])
	SetScreenElementProps {
		id = my_milestones_id
		cash_milestones_title_text = <blurb>
	}
	SpawnScriptNow ui_milestones_set_focus_to_menu params = {menu_id = <resolved_id> focus_index = <focus_index>}
endscript

script ui_cash_milestones_build_cash_rank_list 
	if my_milestones_id :desc_resolvealias \{Name = alias_cash_milestones_list}
	else
		ScriptAssert \{qs(0x2fd38b2c)}
	endif
	focus_index = 0
	i = 1
	begin
	formatText TextName = num_text qs(0xa61fa3a1) d = <i>
	CreateScreenElement {
		parent = <resolved_id>
		Type = descinterface
		desc = 'cash_milestones_row'
		autosizedims = true
		list_highlight_alpha = 0
		number_text_text = <num_text>
		tags = {
			index = (<i> - 1)
		}
		event_handlers = [
			{pad_back generic_event_back}
		]
	}
	if (<i> = 1)
		<thresh> = 0
	else
		<thresh> = (($cash_rank_thresholds) [(<i> -2)])
	endif
	if (<i> < 10)
		formatText checksumName = tex_name 'cash_milestone_icon_00%d' d = <i>
	else
		formatText checksumName = tex_name 'cash_milestone_icon_0%d' d = <i>
	endif
	formatText TextName = amnt qs(0x447de8d3) d = <thresh>
	SetScreenElementProps {
		id = <id>
		cash_milestones_icon_pho_texture = <tex_name>
		cash_milestone_item_name_text = <amnt>
		event_handlers = [
			{focus ui_cash_milestones_set_focus params = {id = <id>}}
			{unfocus ui_cash_milestones_set_unfocus params = {id = <id>}}
		]
	}
	if (<career_earnings> < <thresh>)
		SetScreenElementProps {
			id = <id>
			cash_milestone_check_alpha = 0
		}
	else
		focus_index = (<focus_index> + 1)
	endif
	i = (<i> + 1)
	repeat 30
	return <...>
endscript

script ui_cash_milestones_build_cash_rank_list_elite 
	if my_milestones_id :desc_resolvealias \{Name = alias_cash_milestones_list}
	else
		ScriptAssert \{qs(0x2fd38b2c)}
	endif
	focus_index = 0
	i = 1
	begin
	formatText TextName = num_text qs(0xa61fa3a1) d = (1 + (<i> * 50))
	CreateScreenElement {
		parent = <resolved_id>
		Type = descinterface
		desc = 'cash_milestones_row'
		autosizedims = true
		list_highlight_alpha = 0
		number_text_text = <num_text>
		tags = {
			index = (<i> - 1)
		}
	}
	<thresh> = (<i> * (($cash_rank_thresholds) [29]))
	formatText checksumName = tex_name 'cash_milestone_icon_05%d' d = <i>
	formatText TextName = amnt qs(0x447de8d3) d = <thresh>
	SetScreenElementProps {
		id = <id>
		cash_milestones_icon_pho_texture = <tex_name>
		cash_milestone_item_name_text = <amnt>
		event_handlers = [
			{pad_back generic_event_back}
			{focus ui_cash_milestones_set_focus params = {id = <id>}}
			{unfocus ui_cash_milestones_set_unfocus params = {id = <id>}}
		]
	}
	if (<career_earnings> < <thresh>)
		SetScreenElementProps {
			id = <id>
			cash_milestone_check_alpha = 0
		}
	else
		focus_index = (<focus_index> + 1)
	endif
	i = (<i> + 1)
	repeat 5
	return <...>
endscript

script ui_cash_milestones_continue_to_next_screen 
	printf \{channel = mychannel
		qs(0x59360a51)}
	gamemode_gettype
	printf channel = mychannel qs(0xc9c7ed06) t = <Type>
	if (<Type> = career)
		ui_win_song_career_continue
	else
		ui_win_song_continue
	endif
endscript

script ui_cash_milestones_set_focus 
	Obj_GetID
	GetTags
	printf channel = mychannel qs(0x0ad25ba7) i = <index>
	if ((<index> + 1) < 10)
		formatText checksumName = patch_id 'cash_milestones_patch_00%d' d = (<index> + 1)
	else
		formatText checksumName = patch_id 'cash_milestones_patch_0%d' d = (<index> + 1)
	endif
	my_milestones_id :se_setprops cash_milestones_patch_texture = <patch_id>
	<ratio> = (<index> / 31.5)
	Pos = ((403.0, -111.0) + ((0.0, 1.0) * (<ratio> * 320)))
	my_milestones_id :se_setprops scrollbar_thumb_pos = <Pos>
	if my_milestones_id :desc_resolvealias \{Name = alias_highlight}
		Wait \{2
			gameframe}
		GetScreenElementDims id = <objID>
		Scale = (((1.0, 0.0) * (((<width> + 100.0) / 256.0))) + (0.0, 1.5))
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute <screenelementpos>} Scale = <Scale>
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + (0.0, -10.0))} time = 0.05
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute <screenelementpos>} Scale = <Scale> time = 0.05
		<resolved_id> :se_waitprops
	endif
	generic_menu_up_or_down_sound
endscript

script ui_cash_milestones_set_unfocus 
	SetScreenElementProps {
		id = <id>
		list_highlight_alpha = 0
	}
endscript

script ui_milestones_set_focus_to_menu 
	if GotParam \{focus_index}
		LaunchEvent Type = focus target = <menu_id> data = {child_index = (<focus_index> -1)}
	else
		LaunchEvent Type = focus target = <menu_id>
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript
