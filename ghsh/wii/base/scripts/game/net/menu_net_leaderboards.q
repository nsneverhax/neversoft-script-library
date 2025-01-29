
script create_leaderboard_menu 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = leaderboard}
	create_menu_backdrop \{texture = xb_online_bg}
	if ($current_leaderboard_group = song)
		get_leaderboard_headers \{song = true}
		Change lb_rating_value = (($LeaderboardDiffValue) + 1)
	else
		get_leaderboard_headers \{song = FALSE}
		Change \{lb_rating_value = 0}
	endif
	switch ($LeaderboardSearchValue)
		case 0
		search_title = qs(0x8ec67d7c)
		case 1
		search_title = qs(0xa1241173)
		case 2
		search_title = qs(0x258ad5d4)
	endswitch
	menu_backdrop_container :SetTags <...>
	if isngc
		menu_backdrop_container :GetTags
		my_data = [qs(0x0cb4d476) qs(0x00000000) qs(0x00000000) qs(0xabfbfc18)]
		new_leaderboard_menu {
			title = <title>
			my_data = <my_data>
			search_type_title = <search_title>
			column_pos = <column_pos>
			headers = <headers>
		}
		Change \{user_control_pill_text_color = [
				255
				255
				255
				255
			]}
		Change \{user_control_pill_color = [
				0
				0
				0
				255
			]}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
		add_user_control_helper \{text = qs(0xc018ff6d)
			button = yellow
			z = 100}
		if ($kickingtomain = 0)
			enable_network_wait_variable
		endif
		if (($current_leaderboard_group) = song)
			Type = 1
		else
			Type = 0
		endif
		if (($checking_coop_song_flag) = 1)
			0x49fcb976 = true
		else
			0x49fcb976 = FALSE
		endif
		NetSessionFunc {
			Obj = stats
			func = get_stats
			params = {
				leaderboard_id = ($current_leaderboard_id)
				callback = create_leaderboard_menu2
				listtype = <Type>
				coop = <0x49fcb976>
				me = 1
				columns = <columns>
				num_rows = 1
				0xd6ed1d3c = ($0x75de1cd4)
			}
		}
		Change \{0x432a975d = 1}
		Wait \{1
			gameframe}
		Change \{0x75de1cd4 = 0}
		if ($kickingtomain = 0)
			create_generic_popup \{title = qs(0x86c4c555)
				loading_window
				can_cancel
				message = qs(0xef150e6b)
				wait_variable = network_wait_var
				cancel_eventhandlers = [
					{
						focus
						popup_menu_focus
					}
					{
						unfocus
						popup_menu_unfocus
					}
					{
						pad_choose
						0xfc09b2a9
					}
				]}
		endif
	else
		create_leaderboard_loading_bar
		NetSessionFunc {
			Obj = stats
			func = get_stats
			params = {
				leaderboard_id = ($current_leaderboard_id)
				callback = create_leaderboard_menu2
				listtype = me
				columns = <columns>
				num_rows = 1
			}
		}
	endif
endscript

script destroy_leaderboard_loading_bar 
	if ScreenElementExists \{id = net_leaderboards_loading_cont}
		DestroyScreenElement \{id = net_leaderboards_loading_cont}
	endif
endscript

script create_leaderboard_loading_bar 
	destroy_leaderboard_loading_bar
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = net_leaderboards_loading_cont
		z_priority = 1500
		just = [
			left
			top
		]
		Pos = (570.0, 280.0)}
	<cont_id> = <id>
	CreateScreenElement {
		Type = TextElement
		parent = <cont_id>
		font = 0x5f855b0b
		text = qs(0xabf4f150)
		rgba = ($online_medium_blue)
		just = [left top]
		alpha = 0
	}
	text_id = <id>
	RunScriptOnScreenElement id = <text_id> leaderboard_loading_bar_animate
	RunScriptOnScreenElement id = <cont_id> 0xada61db7
endscript

script 0xada61db7 
	Wait \{10
		Seconds}
	generic_event_back
endscript

script leaderboard_loading_bar_animate 
	Obj_GetID
	Wait \{0.5
		Seconds}
	<objID> :se_setprops alpha = 1
	i = 0
	begin
	text = qs(0xabf4f150)
	switch (<i>)
		case 0
		text = qs(0xabf4f150)
		case 1
		text = qs(0x7b063d06)
		case 2
		text = qs(0x053599bd)
		case 3
		text = qs(0xd3bff70c)
	endswitch
	<objID> :se_setprops text = <text>
	Wait \{0.5
		Seconds}
	i = (<i> + 1)
	if (<i> > 3)
		i = 0
	endif
	repeat
endscript

script create_leaderboard_menu2 
	printf \{qs(0x68991d37)}
	GetArraySize \{leaderboard_data}
	if (<array_Size> > 0)
		my_data = (<leaderboard_data> [0].data)
	else
		my_data = [qs(0x0cb4d476) qs(0x00000000) qs(0x00000000) qs(0xabfbfc18)]
		SetScreenElementProps id = leaderboard_your_score text = (<my_data> [3])
	endif
	SpawnScriptLater create_leaderboard_menu3 params = {my_data = <my_data>}
endscript

script create_leaderboard_menu3 
	printf \{qs(0x71822c76)}
	if NOT isngc
		menu_backdrop_container :GetTags
		Wait \{1
			gameframes}
		new_leaderboard_menu {
			title = <title>
			my_data = <my_data>
			search_type_title = <search_title>
			column_pos = <column_pos>
			headers = <headers>
		}
	endif
	if ($lb_list_type = friends)
		Change \{lb_offset = 0}
	endif
	request_leaderboard <...> <params>
	if NOT isngc
		Change \{user_control_pill_text_color = [
				255
				255
				255
				255
			]}
		Change \{user_control_pill_color = [
				0
				0
				0
				255
			]}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100}
		add_user_control_helper \{text = qs(0xc018ff6d)
			button = yellow
			z = 100}
		if isXenon
			add_user_control_helper \{text = qs(0x9a7d1fe5)
				button = start
				z = 100}
		endif
	endif
endscript

script add_leaderboard_rows_to_menu 
	printf \{qs(0x65771e43)}
	if NOT isngc
		destroy_leaderboard_loading_bar
	elseif GotParam \{0x59310f7d}
		Change 0xa9120e09 = <0x59310f7d>
	endif
	if ($lb_list_type = me)
		if isngc
			Change lb_offset = <offset>
			Change lb_selection_index = <selection_index>
			Change \{lb_list_type = None}
		else
			NetSessionFunc \{Obj = match
				func = get_gamertag}
		endif
	endif
	if ScreenElementExists \{id = arrow_down}
		SetScreenElementProps id = arrow_down rgba = ($online_light_blue)
	endif
	if ScreenElementExists \{id = arrow_up}
		SetScreenElementProps id = arrow_up rgba = ($online_light_blue) flip_h
	endif
	if GotParam \{leaderboard_data}
		<array_count> = 0
		GetArraySize <leaderboard_data>
		begin
		if (<array_Size> <= 0)
			break
		endif
		formatText checksumName = leaderboard_rank 'leaderboard_entry_%i_rank' i = <array_count>
		formatText checksumName = leaderboard_entry 'leaderboard_entry_%i_gamertag' i = <array_count>
		formatText checksumName = leaderboard_name 'leaderboard_entry_%i_name' i = <array_count>
		formatText checksumName = leaderboard_score 'leaderboard_entry_%i_score' i = <array_count>
		formatText checksumName = leaderboard_difficulty 'leaderboard_entry_%i_difficulty' i = <array_count>
		formatText TextName = rank qs(0x0bc409e2) a = (<leaderboard_data> [<array_count>].data [0])
		formatText TextName = text qs(0x0bc409e2) a = (<leaderboard_data> [<array_count>].data [1])
		if ScreenElementExists id = <leaderboard_difficulty>
			if NOT isngc
				formatText TextName = score qs(0x0bc409e2) a = (<leaderboard_data> [<array_count>].data [3])
				get_diff_string_from_string_num num = (<leaderboard_data> [<array_count>].data [2])
				formatText TextName = difficulty qs(0x83f32bd8) a = <diff>
			else
				difficulty = qs(0xccb5e83d)
				if ((<leaderboard_data> [<array_count>].data [2]) = qs(0x22ee76e7))
					difficulty = qs(0xc21c9652)
				elseif ((<leaderboard_data> [<array_count>].data [2]) = qs(0x09c32524))
					difficulty = qs(0x07a8bebd)
				elseif ((<leaderboard_data> [<array_count>].data [2]) = qs(0x10d81465))
					difficulty = qs(0x30764e8f)
				elseif ((<leaderboard_data> [<array_count>].data [2]) = qs(0x5f9982a2))
					difficulty = qs(0xa6163c97)
				endif
				formatText TextName = score qs(0x0bc409e2) a = (<leaderboard_data> [<array_count>].data [3])
			endif
		else
			formatText TextName = score qs(0x0bc409e2) a = (<leaderboard_data> [<array_count>].data [3])
		endif
		<leaderboard_rank> :se_setprops text = <rank>
		<leaderboard_entry> :se_setprops unblock_events
		<leaderboard_rank> :se_setprops text = <rank>
		if NOT isngc
			<leaderboard_entry> :SetTags player_xuid = (<leaderboard_data> [<array_count>].player_xuid)
			<leaderboard_score> :se_setprops text = <score>
			<leaderboard_name> :se_setprops text = <text>
		endif
		fit_text_into_menu_item id = <leaderboard_score> max_width = 175
		fit_text_into_menu_item id = <leaderboard_name> max_width = 220
		if ScreenElementExists id = <leaderboard_difficulty>
			<leaderboard_difficulty> :se_setprops text = <difficulty>
		endif
		if NOT isngc
			if ($lb_list_type = me)
				if (<Name> = (<leaderboard_data> [<array_count>].data [1]))
					Change lb_offset = <offset>
					Change lb_selection_index = <array_count>
					Change \{lb_list_type = None}
				endif
			endif
		endif
		if ($lb_list_type = rating)
			Change lb_offset = <offset>
			Change \{lb_list_type = None}
		endif
		<array_count> = (<array_count> + 1)
		repeat <array_Size>
		if (<array_count> < 10)
			Change \{0xa9120e09 = 1}
			Change 0x4a5f38c1 = (<array_count> - 1)
			begin
			if (<array_count> >= 10)
				break
			endif
			formatText checksumName = leaderboard_rank 'leaderboard_entry_%i_rank' i = <array_count>
			formatText checksumName = leaderboard_entry 'leaderboard_entry_%i_gamertag' i = <array_count>
			formatText checksumName = leaderboard_score 'leaderboard_entry_%i_score' i = <array_count>
			formatText checksumName = leaderboard_difficulty 'leaderboard_entry_%i_difficulty' i = <array_count>
			<leaderboard_rank> :se_setprops text = qs(0x03ac90f0)
			SetScreenElementProps {
				id = {<leaderboard_entry> child = the_text}
				text = qs(0x03ac90f0)
			}
			<leaderboard_entry> :se_setprops block_events
			<leaderboard_score> :se_setprops text = qs(0x03ac90f0)
			<leaderboard_difficulty> :se_setprops text = qs(0x03ac90f0)
			<array_count> = (<array_count> + 1)
			repeat
		else
			Change \{0x4a5f38c1 = 9}
			printf \{qs(0xe184c09f)}
		endif
	else
		printf \{qs(0xcd9cf27d)}
	endif
	formatText checksumName = leaderboard_entry 'leaderboard_entry_%i_gamertag' i = ($lb_selection_index)
	if isngc
		clear_network_wait_variable
	endif
	gamertag_vmenu :Obj_SpawnScriptLater return_focus_to_leaderboard params = {target = <leaderboard_entry>}
endscript

script return_focus_to_leaderboard 
	Wait \{0.8
		Seconds}
	LaunchEvent Type = focus target = gamertag_vmenu data = {child_id = <target>}
	if ($lb_list_type = me)
		LaunchEvent Type = focus target = <target>
	endif
endscript

script destroy_leaderboard_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = online_leaderboard_menu}
	destroy_menu_backdrop
	if ScreenElementExists \{id = leaderboard_container}
		DestroyScreenElement \{id = leaderboard_container}
	endif
	if ScreenElementExists \{id = leaderboard_filter_container}
		DestroyScreenElement \{id = leaderboard_filter_container}
	endif
endscript

script get_leaderboard_headers \{song = true}
	GetArraySize ($current_leaderboard_array)
	if (<song> = true)
		if isXenon
			<columns> = ($master_leaderboard_song_list [0].column_ids)
			<headers> = ($master_leaderboard_song_list [0].headers)
			column_pos = ($master_leaderboard_song_list [0].column_pos)
		elseif isngc
			<columns> = ($0x3a16a1d7 [0].column_ids)
			<headers> = ($0x3a16a1d7 [0].headers)
			column_pos = ($0x3a16a1d7 [0].column_pos)
		else
			<columns> = ($master_leaderboard_song_list_ps3 [0].column_ids)
			<headers> = ($master_leaderboard_song_list_ps3 [0].headers)
			column_pos = ($master_leaderboard_song_list_ps3 [0].column_pos)
		endif
		if ($checking_coop_song_flag = 1)
			get_song_title song = ($song_checksum)
			formatText TextName = title qs(0x2b84b057) s = <song_title>
		else
			get_song_title song = ($current_leaderboard_id)
			<title> = <song_title>
		endif
	else
		GetArraySize ($current_leaderboard_array)
		array_entry = 0
		begin
		if ((($current_leaderboard_array) [<array_entry>].leaderboard_id) = ($current_leaderboard_id))
			<columns> = (($current_leaderboard_array) [<array_entry>].column_ids)
			<headers> = (($current_leaderboard_array) [<array_entry>].headers)
			<title> = (($current_leaderboard_array) [<array_entry>].title)
			column_pos = (($current_leaderboard_array) [<array_entry>].column_pos)
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_Size>
	endif
	return columns = <columns> headers = <headers> title = <title> column_pos = <column_pos>
endscript

script leaderboard_previous_leaderboard 
	get_prev_leaderboard_from_checksum leaderboard = ($current_leaderboard_id)
	Change current_leaderboard_id = <leaderboard>
	ui_event \{event = menu_refresh}
endscript

script leaderboard_next_leaderboard 
	get_next_leaderboard_from_checksum leaderboard = ($current_leaderboard_id)
	Change current_leaderboard_id = <leaderboard>
	ui_event \{event = menu_refresh}
endscript

script leaderboard_back_action 
	generic_event_back
endscript

script submit_filter_query 
	SetButtonEventMappings \{block_menu_input}
	Change \{0x1518e133 = 0}
	switch ($LeaderboardSearchValue)
		case 0
		Change \{lb_list_type = rating}
		case 1
		Change \{lb_list_type = me}
		case 2
		Change \{lb_list_type = friends}
	endswitch
	Change \{lb_offset = 0}
	Change \{0x75de1cd4 = 1}
	if (($current_leaderboard_group = song) && ($LeaderboardSongTypeValue = 1))
		if NOT isngc
			formatText checksumName = coop_song_checksum 'lb_coop_%s' s = ($current_leaderboard_id) DontAssertForChecksums
			Change \{current_leaderboard_id = coop_song_checksum}
		endif
		Change \{checking_coop_song_flag = 1}
	elseif (($current_leaderboard_group = song) && ($LeaderboardSongTypeValue = 0))
		Change current_leaderboard_id = ($song_checksum)
		Change \{checking_coop_song_flag = 0}
	endif
	if ScreenElementExists \{id = leaderboard_filter_container}
		DestroyScreenElement \{id = leaderboard_filter_container}
	endif
	if ScreenElementExists \{id = leaderboard_container}
		DestroyScreenElement \{id = leaderboard_container}
	endif
	if ScreenElementExists \{id = menu_backdrop_container}
		DestroyScreenElement \{id = menu_backdrop_container}
	endif
	clean_up_user_control_helpers
	ui_event \{event = menu_refresh}
endscript

script new_leaderboard_menu 
	printf \{qs(0x9b67a9ec)}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = leaderboard_container
		just = [
			left
			top
		]
		Pos = (0.0, 0.0)}
	anchor_id = <id>
	CreateScreenElement {
		Type = SpriteElement
		id = net_leaderboard_bg
		texture = xb_online_frame_large
		parent = <anchor_id>
		just = [left top]
		Pos = (60.0, 40.0)
	}
	scale_element_to_size {
		id = <id>
		target_width = 1170
		target_height = 600
	}
	create_leaderboard_headers {
		parent = <anchor_id>
		headers = <headers>
		column_pos = <column_pos>
	}
	text_scale = (0.8, 1.0)
	CreateScreenElement {
		Type = TextElement
		parent = <anchor_id>
		id = current_leaderboard_title_extra
		font = fontgrid_title_a1
		Scale = <text_scale>
		rgba = ($online_dark_purple)
		text = <search_type_title>
		just = [right top]
		Pos = (590.0, 85.0)
		z_priority = 20
	}
	fit_text_into_menu_item id = <id> max_width = 320
	CreateScreenElement {
		Type = TextElement
		parent = <anchor_id>
		id = current_leaderboard_title
		font = fontgrid_title_a1
		Scale = <text_scale>
		rgba = [210 210 210 250]
		text = <title>
		just = [left top]
		Pos = (610.0, 85.0)
		z_priority = 10
	}
	fit_text_into_menu_item id = <id> max_width = 400
	CreateScreenElement {
		Type = SpriteElement
		parent = <anchor_id>
		texture = 0x73409eea
		Pos = (320.0, 250.0)
		id = net_leaderboard_icon
		z_priority = 10
		just = [left top]
		Scale = 1.5
	}
	NetSessionFunc \{Obj = match
		func = get_gamertag}
	CreateScreenElement {
		Type = TextElement
		parent = <anchor_id>
		id = leaderboard_your_gamertag
		font = 0x5f855b0b
		Pos = (380.0, 350.0)
		text = <Name>
		rgba = ($online_light_blue)
		z_priority = 20
		Scale = (0.6, 0.8)
	}
	fit_text_into_menu_item id = <id> max_width = 220
	score = (<my_data> [3])
	if ((($current_leaderboard_id) = lb_faceoff_winratio) || (($current_leaderboard_id) = lb_pro_faceoff_winratio) || (($current_leaderboard_id) = lb_battle_winratio))
		if NOT ((<my_data> [3]) = qs(0xabfbfc18))
			winlosevalue = (<my_data> [3])
			WideStringToInteger \{winlosevalue}
			GetLeaderboardWinLoseValue winlosevalue = <winlosevalue>
			formatText TextName = score qs(0x0bc409e2) a = <win> b = <lose>
		endif
	elseif ($current_leaderboard_group = song)
		if ((<my_data> [3]) = qs(0xabfbfc18))
			formatText TextName = score qs(0x0bc409e2) a = (<my_data> [3])
		else
			get_diff_string_from_string_num num = (<my_data> [2])
			formatText TextName = score qs(0x849938f5) a = (<my_data> [3]) b = <diff>
		endif
	endif
	CreateScreenElement {
		Type = TextElement
		parent = <anchor_id>
		id = leaderboard_your_score
		font = 0x5f855b0b
		Pos = (370.0, 390.0)
		text = <score>
		rgba = ($online_light_purple)
		z_priority = 20
		Scale = (0.5, 0.7)
		alpha = 1
	}
	CreateScreenElement {
		Type = SpriteElement
		id = arrow_up
		texture = xb_online_arrow
		parent = <anchor_id>
		just = [left top]
		Pos = (750.0, 195.0)
		z_priority = 20
		Scale = 1
		rgba = ($online_light_blue)
	}
	<id> :se_setprops flip_h
	CreateScreenElement {
		Type = SpriteElement
		id = arrow_down
		texture = xb_online_arrow
		parent = <anchor_id>
		just = [left top]
		Pos = (750.0, 590.0)
		z_priority = 20
		Scale = 1
		rgba = ($online_light_blue)
	}
	CreateScreenElement \{Type = VScrollingMenu
		parent = leaderboard_container
		id = gamertag_scrolling_menu
		internal_just = [
			left
			top
		]
		just = [
			left
			top
		]
		dims = (400.0, 480.0)
		Pos = (580.0, 210.0)}
	CreateScreenElement \{Type = VMenu
		parent = gamertag_scrolling_menu
		id = gamertag_vmenu
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				leaderboard_scroll
				params = {
					Dir = up
				}
			}
			{
				pad_down
				leaderboard_scroll
				params = {
					Dir = down
				}
			}
			{
				pad_option2
				hide_unhide_current_leaderboard
				params = {
					Hide
				}
			}
			{
				pad_option2
				create_leaderboard_filter_dialog
			}
			{
				pad_back
				leaderboard_back_action
			}
		]}
	array_count = 0
	Color = black
	begin
	formatText checksumName = leaderboard_rank 'leaderboard_entry_%i_rank' i = <array_count>
	formatText checksumName = leaderboard_entry 'leaderboard_entry_%i_gamertag' i = <array_count>
	formatText checksumName = leaderboard_name 'leaderboard_entry_%i_name' i = <array_count>
	formatText checksumName = leaderboard_score 'leaderboard_entry_%i_score' i = <array_count>
	formatText checksumName = leaderboard_difficulty 'leaderboard_entry_%i_difficulty' i = <array_count>
	CreateScreenElement {
		Type = ContainerElement
		dims = (30.0, 35.0)
		parent = gamertag_vmenu
		id = <leaderboard_entry>
		event_handlers = [
			{focus leaderboard_custom_focus}
			{unfocus leaderboard_custom_unfocus}
			{pad_back leaderboard_back_action}
		]
	}
	if isXenon
		<id> :se_setprops event_handlers = [{pad_start show_gamercard}]
	endif
	cont_id = <id>
	text_scale = 0.65000004
	if isngc
		text_offset = (-80.0, 7.0)
	else
		text_offset = (-80.0, 0.0)
	endif
	CreateScreenElement {
		Type = TextElement
		parent = <cont_id>
		id = <leaderboard_rank>
		local_id = rank
		font = 0x5f855b0b
		Scale = <text_scale>
		Pos = (<text_offset> + (1.0, 0.0) * <column_pos> [0])
		rgba = ($online_light_blue)
		text = qs(0xc4992bba)
		just = [left top]
		z_priority = 10
	}
	CreateScreenElement {
		Type = TextElement
		parent = <cont_id>
		id = <leaderboard_name>
		local_id = the_text
		font = 0x5f855b0b
		Scale = <text_scale>
		rgba = ($online_light_blue)
		text = qs(0xc4992bba)
		just = [left top]
		z_priority = 10
		Pos = (<text_offset> + (1.0, 0.0) * <column_pos> [1])
	}
	CreateScreenElement {
		Type = TextElement
		parent = <cont_id>
		local_id = score
		id = <leaderboard_score>
		font = 0x5f855b0b
		Scale = <text_scale>
		rgba = ($online_light_blue)
		text = qs(0xc4992bba)
		just = [right top]
		Pos = (<text_offset> + (1.0, 0.0) * <column_pos> [2])
		block_events
		z_priority = 10
	}
	GetArraySize \{headers}
	if (<array_Size> = 4)
		CreateScreenElement {
			Type = TextElement
			parent = <cont_id>
			local_id = difficulty
			id = <leaderboard_difficulty>
			font = 0x5f855b0b
			Scale = <text_scale>
			rgba = ($online_light_blue)
			text = qs(0xc4992bba)
			just = [left top]
			Pos = (<text_offset> + (1.0, 0.0) * <column_pos> [3])
			block_events
			z_priority = 10
		}
	endif
	if checksumequals a = black b = <Color>
		bg_color = [0 0 0 100]
		Color = grey
	else
		bg_color = [128 128 128 100]
		Color = black
	endif
	<cont_id> :SetTags orig_bg_color = <bg_color>
	CreateScreenElement {
		Type = SpriteElement
		parent = <cont_id>
		local_id = bg_bar
		texture = white
		Pos = (-125.0, 5.0)
		just = [left top]
		rgba = <bg_color>
		z_priority = 5
	}
	scale_element_to_size {
		id = <id>
		target_width = 555
		target_height = 35
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <cont_id>
		local_id = bg_bar_left
		texture = character_hub_hilite_bookend
		Pos = (-152.0, 5.0)
		just = [left top]
		rgba = ($online_light_blue)
		alpha = 0
		z_priority = 5
	}
	scale_element_to_size {
		id = <id>
		target_width = 40
		target_height = 35
	}
	CreateScreenElement {
		Type = SpriteElement
		parent = <cont_id>
		local_id = bg_bar_right
		texture = character_hub_hilite_bookend
		Pos = (430.0, 5.0)
		just = [left top]
		rgba = ($online_light_blue)
		alpha = 0
		z_priority = 5
	}
	scale_element_to_size {
		id = <id>
		target_width = 40
		target_height = 35
	}
	<array_count> = (<array_count> + 1)
	repeat 10
	if isngc
		LaunchEvent \{Type = focus
			target = gamertag_vmenu}
	endif
endscript

script create_leaderboard_headers \{Pos = (500.0, 160.0)
		parent = leaderboard_container
		headers = [
			qs(0x219cb424)
			qs(0xd6a68e98)
			qs(0xfb40ab1c)
		]
		column_pos = [
			0
			80
			480
		]
		text_scale = 0.7}
	printf \{qs(0x8bfe563a)}
	if NOT ScreenElementExists id = <parent>
		printf \{qs(0x4e79d20e)}
		return
	endif
	if ScreenElementExists \{id = leaderboard_column_header_cont}
		DestroyScreenElement \{id = leaderboard_column_header_cont}
	endif
	CreateScreenElement {
		Type = ContainerElement
		id = leaderboard_column_header_cont
		parent = <parent>
		Pos = <Pos>
		just = [left top]
	}
	cont_id = <id>
	CreateScreenElement {
		Type = SpriteElement
		id = leaderboard_header_bg
		parent = <cont_id>
		Pos = (-55.0, -14.0)
		texture = store_frame_bottom_bg
		rgba = ($online_dark_purple)
		just = [left top]
	}
	scale_element_to_size {
		id = <id>
		target_width = 580
		target_height = 75
	}
	if isngc
		0x8820e1cc = (0.0, 7.0)
	else
		0x8820e1cc = (0.0, 0.0)
	endif
	GetArraySize \{headers}
	CreateScreenElement {
		Type = TextElement
		parent = <cont_id>
		font = 0x5f855b0b
		Scale = <text_scale>
		Pos = ((-35.0, 0.0) + <0x8820e1cc> + (1.0, 0.0) * <column_pos> [0])
		rgba = ($online_light_purple)
		text = (<headers> [0])
		just = [left top]
		z_priority = 10
	}
	fit_text_into_menu_item id = <id> max_width = 100
	CreateScreenElement {
		Type = TextElement
		parent = <cont_id>
		font = 0x5f855b0b
		Scale = <text_scale>
		Pos = (<0x8820e1cc> + (1.0, 0.0) * <column_pos> [1])
		rgba = ($online_light_purple)
		text = (<headers> [1])
		just = [left top]
		z_priority = 10
	}
	fit_text_into_menu_item id = <id> max_width = 200
	CreateScreenElement {
		Type = TextElement
		parent = <cont_id>
		font = 0x5f855b0b
		Scale = <text_scale>
		Pos = (<0x8820e1cc> + (1.0, 0.0) * <column_pos> [2])
		rgba = ($online_light_purple)
		text = (<headers> [2])
		just = [right top]
		z_priority = 10
	}
	if (<array_Size> > 3)
		formatText TextName = new_text qs(0x0ca98c87) s = (<headers> [2]) d = (<headers> [3])
		<id> :se_setprops {
			text = <new_text>
			just = [right top]
			Pos = ((1.0, 0.0) * <column_pos> [3] + <0x8820e1cc> + (50.0, 0.0))
		}
	endif
	fit_text_into_menu_item id = <id> max_width = 200
endscript

script leaderboard_custom_focus 
	Obj_GetID
	if ScreenElementExists id = {<objID> child = rank}
		SetScreenElementProps id = {<objID> child = rank} rgba = ($online_dark_purple)
	endif
	if ScreenElementExists id = {<objID> child = the_text}
		SetScreenElementProps id = {<objID> child = the_text} rgba = ($online_dark_purple)
	endif
	if ScreenElementExists id = {<objID> child = score}
		SetScreenElementProps id = {<objID> child = score} rgba = ($online_dark_purple)
	endif
	if ScreenElementExists id = {<objID> child = difficulty}
		SetScreenElementProps id = {<objID> child = difficulty} rgba = ($online_dark_purple)
	endif
	if ScreenElementExists id = {<objID> child = bg_bar}
		SetScreenElementProps id = {<objID> child = bg_bar} rgba = ($online_light_blue)
	endif
	if ScreenElementExists id = {<objID> child = bg_bar_right}
		SetScreenElementProps id = {<objID> child = bg_bar_right} alpha = 1
	endif
	if ScreenElementExists id = {<objID> child = bg_bar_left}
		SetScreenElementProps id = {<objID> child = bg_bar_left} alpha = 1
	endif
endscript

script leaderboard_custom_unfocus 
	Obj_GetID
	if ScreenElementExists id = {<objID> child = rank}
		SetScreenElementProps id = {<objID> child = rank} rgba = ($online_light_blue)
	endif
	if ScreenElementExists id = {<objID> child = the_text}
		SetScreenElementProps id = {<objID> child = the_text} rgba = ($online_light_blue)
	endif
	if ScreenElementExists id = {<objID> child = score}
		SetScreenElementProps id = {<objID> child = score} rgba = ($online_light_blue)
	endif
	if ScreenElementExists id = {<objID> child = difficulty}
		SetScreenElementProps id = {<objID> child = difficulty} rgba = ($online_light_blue)
	endif
	<objID> :GetSingleTag orig_bg_color
	if ScreenElementExists id = {<objID> child = bg_bar}
		SetScreenElementProps id = {<objID> child = bg_bar} rgba = <orig_bg_color>
	endif
	if ScreenElementExists id = {<objID> child = bg_bar_right}
		SetScreenElementProps id = {<objID> child = bg_bar_right} alpha = 0
	endif
	if ScreenElementExists id = {<objID> child = bg_bar_left}
		SetScreenElementProps id = {<objID> child = bg_bar_left} alpha = 0
	endif
endscript

script leaderboard_scroll \{Dir = down}
	if (<Dir> = down)
		if ($lb_selection_index = $0x4a5f38c1)
			if ($0xa9120e09 = 1)
				SetScreenElementProps \{id = gamertag_vmenu
					dont_allow_wrap}
				return
			endif
			LaunchEvent \{Type = unfocus
				target = gamertag_vmenu}
			Change \{lb_selection_index = 0}
			Change lb_offset = ($lb_offset + 10)
			if ($current_leaderboard_group = song)
				get_leaderboard_headers \{song = true}
			else
				get_leaderboard_headers \{song = FALSE}
			endif
			if ScreenElementExists \{id = arrow_down}
				SetScreenElementProps id = arrow_down rgba = ($online_dark_purple)
				Wait \{0.2
					Seconds}
			endif
			request_leaderboard <...>
		else
			Change lb_selection_index = ($lb_selection_index + 1)
			SetScreenElementProps \{id = gamertag_vmenu
				allow_wrap}
		endif
	else
		if ($lb_selection_index = 0)
			if ($lb_offset <= 0)
				SetScreenElementProps \{id = gamertag_vmenu
					dont_allow_wrap}
				return
			else
				SetScreenElementProps \{id = gamertag_vmenu
					allow_wrap}
				Change lb_offset = ($lb_offset - 10)
				if ($lb_offset < 0)
					Change \{lb_offset = 0}
				endif
			endif
			LaunchEvent \{Type = unfocus
				target = gamertag_vmenu}
			Change \{lb_selection_index = 9}
			if ($current_leaderboard_group = song)
				get_leaderboard_headers \{song = true}
			else
				get_leaderboard_headers \{song = FALSE}
			endif
			if ScreenElementExists \{id = arrow_up}
				SetScreenElementProps id = arrow_up rgba = ($online_dark_purple) flip_h
				Wait \{0.2
					Seconds}
			endif
			request_leaderboard <...>
		else
			Change lb_selection_index = ($lb_selection_index - 1)
		endif
	endif
	generic_menu_up_or_down_sound <Dir>
endscript

script request_leaderboard 
	if NOT isngc
		create_leaderboard_loading_bar
	endif
	printf \{qs(0x3cdff06f)}
	if isngc
		if (($current_leaderboard_group) = song)
			Type = 1
		else
			Type = 0
		endif
		if (($checking_coop_song_flag) = 1)
			0x49fcb976 = true
		else
			0x49fcb976 = FALSE
		endif
		NetSessionFunc {
			Obj = stats
			func = get_stats
			params = {
				leaderboard_id = ($current_leaderboard_id)
				callback = add_leaderboard_rows_to_menu
				listtype = <Type>
				sort_type = ($lb_list_type)
				offset = ($lb_offset)
				coop = <0x49fcb976>
				columns = <columns>
				num_rows = 10
				0xd6ed1d3c = ($0x75de1cd4)
			}
		}
	else
		NetSessionFunc {
			Obj = stats
			func = get_stats
			params = {
				leaderboard_id = ($current_leaderboard_id)
				callback = add_leaderboard_rows_to_menu
				offset = ($lb_offset)
				columns = <columns>
				num_rows = 10
				listtype = ($lb_list_type)
				rating_val = ($lb_rating_value)
			}
		}
	endif
endscript

script show_gamercard 
	formatText checksumName = leaderboard_entry 'leaderboard_entry_%i_gamertag' i = ($lb_selection_index)
	<leaderboard_entry> :GetTags
	NetSessionFunc func = showGamerCard params = {player_xuid = <player_xuid>}
endscript

script create_leaderboard_filter_dialog \{menu_id = online_leaderboard_filter_menu
		vmenu_id = online_leaderboard_filter_vmenu
		Pos = (400.0, 525.0)}
	if ($0x1518e133)
		return
	endif
	Change \{0x1518e133 = 1}
	LaunchEvent \{Type = unfocus
		target = gamertag_vmenu}
	search_vmenu_id = leaderboard_search_filter
	search_text_id = leaderboard_search_type
	difficulty_vmenu_id = difficulty_selection
	difficulty_text_id = lb_difficulty_selection_text
	song_vmenu_id = song_selection
	song_text_id = song_selection_text
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = leaderboard_filter_container
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = VScrollingMenu
		parent = leaderboard_filter_container
		id = <menu_id>
		just = [center top]
		dims = (500.0, 480.0)
		Pos = (640.0, 290.0)
		z_priority = 1
	}
	CreateScreenElement {
		Type = VMenu
		parent = <menu_id>
		id = <vmenu_id>
		Pos = (205.0, 0.0)
		just = [center top]
		internal_just = [left top]
		dims = (500.0, 480.0)
		event_handlers = [
			{pad_back hide_unhide_current_leaderboard}
			{pad_back destroy_leaderboard_filter}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		exclusive_device = ($primary_controller)
	}
	displaySprite \{id = leaderboard_filter_frame
		parent = leaderboard_filter_container
		tex = xb_online_frame_large
		Pos = (640.0, 100.0)
		just = [
			center
			top
		]
		z = 2}
	displaySprite \{id = leaderboard_filter_frame_crown
		parent = leaderboard_filter_container
		tex = xb_online_frame_crown
		Pos = (640.0, 42.0)
		just = [
			center
			top
		]
		z = 3
		dims = (256.0, 105.0)}
	CreateScreenElement {
		Type = TextElement
		parent = leaderboard_filter_container
		font = fontgrid_title_a1
		Scale = 0.85
		rgba = ($online_dark_purple)
		text = qs(0x261d8c2f)
		Pos = (640.0, 135.0)
		just = [center top]
		z_priority = 100.0
	}
	CreateScreenElement {
		Type = TextElement
		id = search
		parent = <vmenu_id>
		font = fontgrid_title_a1
		Scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0x18f8ab21)
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_ID = search text_id = <search_text_id> VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <search_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_ID = search text_id = <search_text_id> to = <search_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = LeaderboardSearchValue copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		Type = VMenu
		id = <search_vmenu_id>
		parent = search
		Pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <search_text_id> Global = CopyOfGlobal Type = search direction = up}}
			{pad_down net_custom_up_down params = {text = <search_text_id> Global = CopyOfGlobal Type = search direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <search_text_id> Global = LeaderboardSearchValue Type = search}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <search_vmenu_id> menu = search}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = LeaderboardSearchValue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <search_vmenu_id> menu = search}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		id = <search_text_id>
		parent = <search_vmenu_id>
		font = fontgrid_title_a1
		Scale = 1.0
		rgba = ($online_light_blue)
		text = ($FilterTypes.search.values [($LeaderboardSearchValue)])
		just = [left top]
		z_priority = 100.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	if NOT isngc
		CreateScreenElement {
			Type = TextElement
			id = lb_difficulty
			parent = <vmenu_id>
			font = fontgrid_title_a1
			Scale = 0.65000004
			rgba = ($online_light_blue)
			text = qs(0x48cdc36e)
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus net_custom_ui_focus params = {this_ID = lb_difficulty text_id = <difficulty_text_id> VMenu = <vmenu_id>}}
				{unfocus net_custom_ui_unfocus params = {text_id = <difficulty_text_id>}}
				{pad_choose net_custom_ui_change_focus params = {this_ID = lb_difficulty text_id = <difficulty_text_id> to = <difficulty_vmenu_id> from = <vmenu_id>}}
				{pad_choose net_copy_intial_params params = {copy_from = LeaderboardDiffValue copy_to = CopyOfGlobal}}
			]
		}
		CreateScreenElement {
			Type = VMenu
			id = <difficulty_vmenu_id>
			parent = lb_difficulty
			Pos = (550.0, 0.0)
			just = [left top]
			internal_just = [left top]
			event_handlers = [
				{pad_up animate_helper_arrows params = {direction = up}}
				{pad_down animate_helper_arrows params = {direction = down}}
				{pad_up net_custom_up_down params = {text = <difficulty_text_id> Global = CopyOfGlobal Type = lb_diff direction = up}}
				{pad_down net_custom_up_down params = {text = <difficulty_text_id> Global = CopyOfGlobal Type = lb_diff direction = down}}
				{pad_back net_commit_or_reset_params params = {text = <difficulty_text_id> Global = LeaderboardDiffValue Type = lb_diff}}
				{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <difficulty_vmenu_id> menu = search}}
				{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = LeaderboardDiffValue}}
				{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <difficulty_vmenu_id> menu = search}}
			]
		}
		CreateScreenElement {
			Type = TextElement
			id = <difficulty_text_id>
			parent = <difficulty_vmenu_id>
			font = fontgrid_title_a1
			Scale = 1.0
			rgba = ($online_light_blue)
			text = ($FilterTypes.lb_diff.values [($LeaderboardDiffValue)])
			just = [left top]
			z_priority = 100.0
		}
		fit_text_into_menu_item id = <id> max_width = 375
	endif
	CreateScreenElement {
		Type = TextElement
		id = song_type
		parent = <vmenu_id>
		font = fontgrid_title_a1
		Scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0x18f8ab21)
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_ID = song_type text_id = <song_text_id> VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <song_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_ID = song_type text_id = <song_text_id> to = <song_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = LeaderboardSongTypeValue copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		Type = VMenu
		id = <song_vmenu_id>
		parent = song_type
		Pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <song_text_id> Global = CopyOfGlobal Type = song_type direction = up}}
			{pad_down net_custom_up_down params = {text = <song_text_id> Global = CopyOfGlobal Type = song_type direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <song_text_id> Global = LeaderboardSongTypeValue Type = song_type}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <song_vmenu_id> menu = song_type}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = LeaderboardSongTypeValue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <song_vmenu_id> menu = song_type}}
		]
	}
	CreateScreenElement {
		Type = TextElement
		id = <song_text_id>
		parent = <song_vmenu_id>
		font = fontgrid_title_a1
		Scale = 1.0
		rgba = ($online_light_blue)
		text = ($FilterTypes.song_type.values [($LeaderboardSongTypeValue)])
		just = [left top]
		z_priority = 100.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	CreateScreenElement {
		Type = TextElement
		id = submit_selection
		parent = <vmenu_id>
		font = fontgrid_title_a1
		Scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0x3fc1c076)
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_ID = submit_selection VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus}
			{pad_choose submit_filter_query}
		]
	}
	<vmenu_id> :SetTags current_focus = first_time
	block_unblock_filter_criterias
	LaunchEvent Type = focus target = <vmenu_id>
endscript

script destroy_leaderboard_filter 
	Change \{0x1518e133 = 0}
	LaunchEvent \{Type = unfocus
		target = online_leaderboard_filter_vmenu}
	if ScreenElementExists \{id = leaderboard_filter_container}
		DestroyScreenElement \{id = leaderboard_filter_container}
	endif
	LaunchEvent \{Type = focus
		target = gamertag_vmenu}
endscript

script block_unblock_filter_criterias 
	if NOT ($current_leaderboard_group = song)
		if ScreenElementExists \{id = lb_difficulty}
			lb_difficulty :se_setprops not_focusable rgba = ($online_grey)
		endif
		if ScreenElementExists \{id = lb_difficulty_selection_text}
			lb_difficulty_selection_text :se_setprops rgba = ($online_grey) text = qs(0x6a5cf46c)
		endif
		if ScreenElementExists \{id = song_type}
			song_type :se_setprops not_focusable rgba = ($online_grey)
		endif
		if ScreenElementExists \{id = song_selection_text}
			song_selection_text :se_setprops rgba = ($online_grey) text = qs(0x6a5cf46c)
		endif
	endif
endscript

script hide_unhide_current_leaderboard 
	if GotParam \{Hide}
		alpha_value = 0.0
	else
		alpha_value = 1.0
	endif
	if ScreenElementExists \{id = leaderboard_container}
		SetScreenElementProps {
			id = leaderboard_container
			alpha = <alpha_value>
		}
	endif
endscript

script get_diff_string_from_string_num 
	if GotParam \{num}
		switch <num>
			case qs(0x22ee76e7)
			return \{diff = qs(0x69bdca15)}
			case qs(0x09c32524)
			return \{diff = qs(0xa164401d)}
			case qs(0x10d81465)
			return \{diff = qs(0xdc13b458)}
			case qs(0x5f9982a2)
			return \{diff = qs(0x3e66735b)}
		endswitch
	endif
endscript
