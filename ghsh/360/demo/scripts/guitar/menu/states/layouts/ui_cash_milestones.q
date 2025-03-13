last_index_reached = 0
current_element_highlighted = 0
nb_item_displayed_at_once = 4

script ui_create_cash_milestones 
	ui_cash_milestones_build_page_for_1p
endscript

script ui_destroy_cash_milestones 
	change \{last_index_reached = 0}
	change \{current_element_highlighted = 0}
	clean_up_user_control_helpers
	destroyscreenelement \{id = my_milestones_id}
endscript

script ui_deinit_cash_milestones 
	progression_cashmilestonesclear
endscript

script ui_cash_milestones_build_page_for_mp 
	get_current_band_info
	getglobaltags <band_info>
	if screenelementexists \{id = my_milestones_id}
		destroyscreenelement \{id = my_milestones_id}
	endif
	createscreenelement \{parent = root_window
		id = my_milestones_id
		type = descinterface
		desc = 'cash_milestones_mp_band'}
	my_milestones_id :obj_spawnscript \{highlight_motion
		params = {
			menu_id = my_milestones_id
		}}
	if my_milestones_id :desc_resolvealias \{name = alias_cash_milestones_mp_list}
	else
		scriptassert \{qs(0xd06d1448)}
	endif
	cnt = 0
	begin
	p_cash = (($cash_milestones_band_ui) [<cnt>])
	gig_cash_earned = (<p_cash>.total_cash)
	formattext textname = gig_cash qs(0x447de8d3) d = <gig_cash_earned>
	cash_ranks_get_rank player = (<cnt> + 1)
	cash_ranks_get_icon_id player = (<cnt> + 1)
	formattext textname = player_name qs(0x8c021f45) d = (<cnt> + 1)
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
	formattext textname = car_earnings_txt qs(0x447de8d3) d = (<career_earnings> + <gig_cash_earned>)
	formattext textname = rank_txt qs(0x48c6d14c) d = <rank>
	createscreenelement {
		parent = <resolved_id>
		type = descinterface
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
	}
	cnt = (<cnt> + 1)
	repeat ($current_num_players)
	spawnscriptnow ui_milestones_set_focus_to_menu params = {menu_id = <resolved_id>}
endscript

script ui_cash_milestones_build_page_for_1p 
	my_get_player_data
	gig_earnings = ($cash_milestones_gig_total)
	cash_ranks_get_rank
	cash_ranks_get_patch_id
	formattext textname = car_earn qs(0xbe2b541b) d = <career_earnings> usecommas
	formattext textname = car_rank qs(0xce985b63) d = <rank>
	formattext textname = gig_earn qs(0xc5d1b38b) d = <gig_earnings> usecommas
	if screenelementexists \{id = my_milestones_id}
		destroyscreenelement \{id = my_milestones_id}
	endif
	get_current_band_info
	getglobaltags <band_info> param = name
	createscreenelement {
		parent = root_window
		id = my_milestones_id
		type = descinterface
		desc = 'cash_milestones'
		cash_milestone_player_name_text = <name>
		cash_milestones_career_total_text = <car_earn>
		cash_milestones_title_text = <car_rank>
		cash_milestones_patch_texture = <cash_patch_id>
	}
	my_milestones_id :obj_spawnscript \{bg_swap}
	ui_cash_milestones_build_cash_rank_list <...>
	index = (<rank> -1)
	getarraysize \{$cash_rank_blurbs}
	if (<index> < 0)
		index = 0
	elseif (<index> >= <array_size>)
		index = (<array_size> - 1)
	endif
	blurb = (($cash_rank_blurbs) [<index>])
	setscreenelementprops {
		id = my_milestones_id
		cash_milestones_title_text = <blurb>
	}
	spawnscriptnow ui_milestones_set_focus_to_menu params = {menu_id = <resolved_id> focus_index = <focus_index>}
endscript

script ui_cash_milestones_build_cash_rank_list 
	if my_milestones_id :desc_resolvealias \{name = alias_cash_milestones_list}
	else
		scriptassert \{qs(0x2fd38b2c)}
	endif
	focus_index = 0
	i = 1
	begin
	formattext textname = num_text qs(0xa61fa3a1) d = <i>
	createscreenelement {
		parent = <resolved_id>
		type = descinterface
		desc = 'cash_milestones_row'
		autosizedims = true
		list_highlight_alpha = 0
		number_text_text = <num_text>
		tags = {
			index = (<i> - 1)
		}
		event_handlers = [
			{pad_back generic_event_back}
			{focus list_change_focus params = {focus}}
			{unfocus list_change_focus params = {unfocus}}
		]
	}
	if (<i> = 1)
		<thresh> = 0
	else
		<thresh> = (($cash_rank_thresholds) [(<i> -2)])
	endif
	if (<i> < 10)
		formattext checksumname = tex_name 'cash_milestone_icon_00%d' d = <i>
	else
		formattext checksumname = tex_name 'cash_milestone_icon_0%d' d = <i>
	endif
	formattext textname = amnt qs(0x447de8d3) d = <thresh>
	setscreenelementprops {
		id = <id>
		cash_milestones_icon_pho_texture = <tex_name>
		cash_milestone_item_name_text = <amnt>
		event_handlers = [
			{focus ui_cash_milestones_set_focus params = {id = <id>}}
			{unfocus ui_cash_milestones_set_unfocus params = {id = <id>}}
		]
	}
	if (<career_earnings> < <thresh>)
		setscreenelementprops {
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

script list_change_focus 
	obj_getid
	<objid> :gettags
	if gotparam \{focus}
		if screenelementexists \{id = my_milestones_id}
		else
			scriptassert \{qs(0x0c51ced6)}
		endif
		if my_milestones_id :desc_resolvealias \{name = alias_highlight_bar}
		else
			scriptassert \{qs(0x70452630)}
		endif
		<resolved_id> :se_setprops pos = ((0.0, 0.0) + ((0.0, 55.0) * ($current_element_highlighted)))
	endif
endscript

script ui_cash_milestones_build_cash_rank_list_elite 
	if my_milestones_id :desc_resolvealias \{name = alias_cash_milestones_list}
	else
		scriptassert \{qs(0x2fd38b2c)}
	endif
	focus_index = 0
	i = 1
	begin
	formattext textname = num_text qs(0xa61fa3a1) d = (1 + (<i> * 50))
	createscreenelement {
		parent = <resolved_id>
		type = descinterface
		desc = 'cash_milestones_row'
		autosizedims = true
		list_highlight_alpha = 0
		number_text_text = <num_text>
		tags = {
			index = (<i> - 1)
		}
	}
	<thresh> = (<i> * (($cash_rank_thresholds) [29]))
	formattext checksumname = tex_name 'cash_milestone_icon_05%d' d = <i>
	formattext textname = amnt qs(0x447de8d3) d = <thresh>
	setscreenelementprops {
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
		setscreenelementprops {
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
	printf channel = mychannel qs(0xc9c7ed06) t = <type>
	if (<type> = career)
		ui_win_song_career_continue
	else
		ui_win_song_continue
	endif
endscript

script ui_cash_milestones_set_focus 
	obj_getid
	gettags
	if ((<index> + 1) < 10)
		formattext checksumname = patch_id 'cash_milestones_patch_00%d' d = (<index> + 1)
	else
		formattext checksumname = patch_id 'cash_milestones_patch_0%d' d = (<index> + 1)
	endif
	my_milestones_id :se_setprops cash_milestones_patch_texture = <patch_id>
	<ratio> = (<index> / 31.5)
	pos = ((400.5, -111.0) + ((0.0, 1.0) * (<ratio> * 320)))
	my_milestones_id :se_setprops scrollbar_thumb_pos = <pos>
	setscreenelementprops {
		id = <id>
		list_highlight_alpha = 255
	}
	if (($current_element_highlighted) = 0 && ($last_index_reached) = 0)
		if (<index> >= 4)
			change last_index_reached = <index>
			change \{current_element_highlighted = 4}
		else
			if NOT (<index> = 1)
				change last_index_reached = <index>
				change current_element_highlighted = <index>
			endif
		endif
	endif
	getarraysize \{$cash_rank_blurbs}
	if ((<index> = (<array_size> - 3)) && (($last_index_reached) = 0))
		change current_element_highlighted = ($nb_item_displayed_at_once)
	elseif ((<index> = 0) && (($last_index_reached) = (<array_size> - 3)))
		change \{current_element_highlighted = 0}
	endif
	if (<index> > ($last_index_reached))
		if ($current_element_highlighted < ($nb_item_displayed_at_once))
			change current_element_highlighted = (($current_element_highlighted) + 1)
		endif
	elseif (<index> < ($last_index_reached))
		if ($current_element_highlighted > 0)
			change current_element_highlighted = (($current_element_highlighted) - 1)
		endif
	endif
	rgba_white_value = [255 255 255 255]
	rgba_black_value = [0 0 0 255]
	if my_milestones_id :desc_resolvealias \{name = alias_cash_milestones_list}
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			assignalias id = (<children> [<index>]) alias = current_child
			assignalias id = (<children> [($last_index_reached)]) alias = last_child
			if (<index> = ($last_index_reached))
				current_child :se_setprops cash_milestone_item_name_rgba = <rgba_white_value> number_text_rgba = <rgba_white_value>
			else
				current_child :se_setprops cash_milestone_item_name_rgba = <rgba_white_value> number_text_rgba = <rgba_white_value>
				last_child :se_setprops cash_milestone_item_name_rgba = <rgba_black_value> number_text_rgba = <rgba_black_value>
			endif
		endif
	endif
	change last_index_reached = <index>
	generic_menu_up_or_down_sound
endscript

script ui_cash_milestones_set_unfocus 
	setscreenelementprops {
		id = <id>
		list_highlight_alpha = 0
	}
endscript

script ui_milestones_set_focus_to_menu 
	if gotparam \{focus_index}
		launchevent type = focus target = <menu_id> data = {child_index = (<focus_index> -1)}
	else
		launchevent type = focus target = <menu_id>
	endif
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript
