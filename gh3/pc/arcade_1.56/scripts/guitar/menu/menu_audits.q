audits_menu_font = fontgrid_title_gh3
audits_menu_line_pos = (420.0, 360.0)
audits_hilite_pos0 = (1060.0, 612.0)
audits_hilite_dims0 = (135.0, 30.0)
audits_hilite_pos1 = (1060.0, 642.0)
audits_hilite_dims1 = (135.0, 30.0)
audits_hilite_pos2 = (1060.0, 672.0)
audits_hilite_dims2 = (135.0, 30.0)
audits_hilite_unselected = [
	50
	0
	0
	255
]
audits_hilite_selected = [
	165
	95
	50
	255
]
audits_results = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]
audits_real_time_requirement = 0
audits_dirty = 0
audits_end_checks = 0
audits_started_finish = 0
audits_cap = 200
audit_page = 0
total_money = 1.1
audits_cur_coords = (0.0, 0.0)
audits_col_1 = (300.0, 0.0)
audits_col_2 = (650.0, 0.0)
audits_col_3 = (1000.0, 0.0)
audits_col_data_offset = (270.0, 0.0)
audits_indent_offset = (40.0, 0.0)
audits_postsymbol_offset = (120.0, 0.0)
audits_row_start = (0.0, 80.0)
audits_row_offset = (0.0, 20.0)
audits_early_window = -100
audits_late_window = 400
cl_ready_for_audits = 0
audits_most_recent_in_game_setting = 0

script create_audits_menu \{from_in_game = 1}
	Change audits_most_recent_in_game_setting = <from_in_game>
	if IsWinPort
		if ($audits_most_recent_in_game_setting = 1)
			kill_start_key_binding
		endif
	else
		kill_start_key_binding
	endif
	if ViewportExists \{id = bg_viewport}
		disable_bg_viewport
	endif
	Change \{audits_end_checks = 0}
	Change \{audits_started_finish = 0}
	Change \{audit_page = 0}
	set_focus_color \{rgba = [
			230
			230
			230
			255
		]}
	set_unfocus_color \{rgba = $audits_hilite_unselected}
	z = 100
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = cl_container
		Pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = Venue_BG}
	CreateScreenElement {
		Type = SpriteElement
		parent = cl_container
		id = as_light_overlay
		texture = Venue_Overlay
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [center center]
		z_priority = (<z> - 1)
	}
	displaySprite {
		parent = cl_container
		tex = Options_Calibrate_Poster
		Pos = (50.0, 0.0)
		dims = (216.0, 477.0)
		z = <z>
	}
	displaySprite {
		parent = cl_container
		tex = Options_Calibrate_Paper
		Pos = (225.0, -140.0)
		dims = (1250.0, 1800.0)
		z = (<z> -2)
	}
	displaySprite {
		parent = cl_container
		tex = Toprockers_Tape_2
		Pos = (295.0, -100.0)
		dims = (180.0, 80.0)
		z = (<z> + 2)
		rot_angle = 93
	}
	displaySprite {
		parent = cl_container
		tex = Toprockers_Tape_2
		rgba = [0 0 0 128]
		Pos = (300.0, -102.0)
		dims = (180.0, 80.0)
		z = (<z> + 2)
		rot_angle = 93
	}
	displaySprite {
		parent = cl_container
		tex = tape_H_02
		Pos = (20.0, 266.0)
		dims = (132.0, 64.0)
		z = (<z> + 2)
		rot_angle = 8
	}
	displaySprite {
		parent = cl_container
		tex = tape_H_02
		rgba = [0 0 0 128]
		Pos = (12.0, 272.0)
		dims = (132.0, 64.0)
		z = (<z> + 2)
		rot_angle = 8
	}
	displayText parent = cl_container text = "AUDITS" Pos = (1068.0, 25.0) z = <z> Scale = 1.25 just = [center center] rgba = [50 0 0 255] font = text_a11_Large rot = 1 noshadow
	displayText parent = cl_container text = "AUDITS" Pos = (1063.0, 30.0) z = <z> Scale = 1.25 just = [center center] rgba = [160 130 105 255] font = text_a11_Large rot = 2 noshadow
	audits_update_text z = <z>
	audits_fill_options z = <z> from_in_game = <from_in_game>
	SpawnScriptNow \{audits_periodic_update}
	Change \{user_control_pill_text_color = [
			0
			0
			0
			255
		]}
	Change \{user_control_pill_color = [
			180
			180
			180
			255
		]}
	add_user_control_helper \{text = "SELECT"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
endscript

script audits_periodic_update 
	begin
	if ($audit_page = 0)
		audits_update_text
	endif
	Wait \{1
		Second}
	repeat
endscript

script audits_fill_options \{z = 100}
	if (<from_in_game>)
		<controller> = ($last_start_pressed_device)
	else
		<controller> = ($primary_controller)
	endif
	displaySprite parent = cl_container id = audits_hilite tex = Options_Calibrate_Hilite Pos = $audits_hilite_pos0 rgba = $audits_hilite_unselected z = <z>
	audits_eh = [
		{pad_back menu_audits_go_back}
	]
	new_menu scrollid = cl_scroll vmenuid = cl_vmenu menu_pos = (1085.0, 600.0) event_handlers = <audits_eh> exclusive_device = None text_left default_colors = 0
	text_params = {parent = cl_vmenu Type = TextElement font = ($audits_menu_font) rgba = ($menu_unfocus_color) Scale = 0.5}
	CreateScreenElement {
		<text_params>
		id = audits_next
		text = "NEXT"
		event_handlers = [
			{focus menu_audits_focus params = {index = 0}}
			{unfocus menu_audits_unfocus params = {index = 0}}
			{pad_choose menu_audits_next params = {z = <z>}}
		]
		z_priority = (<z> + 1)
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> dims = ((340.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1
	CreateScreenElement {
		<text_params>
		id = audits_previous
		text = "PREVIOUS"
		event_handlers = [
			{focus menu_audits_focus params = {index = 1}}
			{unfocus menu_audits_unfocus params = {index = 1}}
			{pad_choose menu_audits_prev params = {z = <z>}}
		]
		z_priority = (<z> + 1)
		Pos = (0.0, 14.0)
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> dims = ((340.0, 0.0) + <height> * (0.0, 1.0)) only_if_larger_x = 1
	SetScreenElementLock \{id = cl_vmenu
		On}
	LaunchEvent \{Type = focus
		target = cl_vmenu}
endscript

script audits_format_time 
	ahr = (<atime> / 3600.0)
	CastToInteger \{ahr}
	if (<ahr> > 0)
		<atime> = (<atime> - (<ahr> * 3600.0))
	endif
	amin = (<atime> / 60.0)
	CastToInteger \{amin}
	if (<amin> > 0)
		<atime> = (<atime> - (<amin> * 60.0))
	endif
	asec = <atime>
	CastToInteger \{asec}
	if (<ahr> < 10 && <amin> < 10 && <asec> < 10)
		formatText TextName = total_time_text "0%a:0%b:0%c" a = <ahr> b = <amin> c = <asec>
	elseif (<ahr> < 10 && <amin> < 10 && <asec> >= 10)
		formatText TextName = total_time_text "0%a:0%b:%c" a = <ahr> b = <amin> c = <asec>
	elseif (<ahr> < 10 && <amin> >= 10 && <asec> < 10)
		formatText TextName = total_time_text "0%a:%b:0%c" a = <ahr> b = <amin> c = <asec>
	elseif (<ahr> < 10 && <amin> >= 10 && <asec> >= 10)
		formatText TextName = total_time_text "0%a:%b:%c" a = <ahr> b = <amin> c = <asec>
	elseif (<ahr> >= 10 && <amin> < 10 && <asec> < 10)
		formatText TextName = total_time_text "%a:0%b:0%c" a = <ahr> b = <amin> c = <asec>
	elseif (<ahr> >= 10 && <amin> < 10 && <asec> >= 10)
		formatText TextName = total_time_text "%a:0%b:%c" a = <ahr> b = <amin> c = <asec>
	elseif (<ahr> >= 10 && <amin> >= 10 && <asec> < 10)
		formatText TextName = total_time_text "%a:%b:0%c" a = <ahr> b = <amin> c = <asec>
	else
		formatText TextName = total_time_text "%a:%b:%c" a = <ahr> b = <amin> c = <asec>
	endif
	return time_text = <total_time_text>
endscript

script audits_update_song_detail 
endscript

script audits_convert_to_money 
	printf "audits_convert_to_money: called with %a coins and %b bills" a = <coins> b = <bills>
	dollars = (<bills> / 4)
	temp_coins = (<coins> - <bills>)
	temp_dollars = (<temp_coins> / 4)
	<temp_coins> = (<temp_coins> - (<temp_dollars> * 4))
	<dollars> = (<dollars> + <temp_dollars>)
	cents = (<temp_coins> * 25)
	if (<cents> = 0)
		formatText TextName = total_money_text "$%a.00" a = <dollars>
	elseif (<cents> = 50)
		formatText TextName = total_money_text "$%a.50" a = <dollars>
	else
		formatText TextName = total_money_text "$%a.%b" a = <dollars> b = <cents>
	endif
	return money_text = <total_money_text>
endscript

script audits_update_text \{z = 100}
	printf \{"audits_update_text: creating page %a"
		a = $audit_page}
	GetGlobalTags \{arcade_audits}
	GetGlobalTags \{arcade_adjustments}
	if (audit_page = 0)
		destroy_menu \{menu_id = audit_container}
		CreateScreenElement \{Type = ContainerElement
			parent = cl_container
			id = audit_container
			Pos = (0.0, 0.0)}
		create_rt_version_get_string \{stringID = $rt_version_string_main}
		formatText TextName = audit_ver_txt "Version: %t" t = <versionString>
		displayText parent = audit_container text = <audit_ver_txt> Pos = (($audits_col_3 + (0.0, 100.0))) z = <z> rgba = [0 0 128 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = ($audits_col_1 + $audits_row_start)
		displayText parent = audit_container text = "Earnings Data" Pos = <audits_cur_coords> z = <z> rgba = [0 128 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_row_offset)
		displayText parent = audit_container text = "Coin Pulses" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_coins_text "%a" a = <arcade_total_coins> usecommas
		displayText parent = audit_container text = <total_coins_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Bill Pulses" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_bill_text "%a" a = <arcade_num_bills> usecommas
		displayText parent = audit_container text = <total_bill_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset)
		<audits_cur_coords> = (<audits_cur_coords> + $audits_row_offset)
		displayText parent = audit_container text = "Standard Credits" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_credits_text "%a" a = <arcade_total_credits> usecommas
		displayText parent = audit_container text = <total_credits_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Bonus Credits" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_bonus_text "%a" a = <arcade_total_bonus_credits> usecommas
		displayText parent = audit_container text = <total_bonus_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Service Credits" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_service_text "%a" a = <arcade_service_credits> usecommas
		displayText parent = audit_container text = <total_service_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + (2 * $audits_row_offset))
		displayText parent = audit_container text = "Play Data" Pos = <audits_cur_coords> z = <z> rgba = [0 128 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_row_offset)
		displayText parent = audit_container text = "Total Plays" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_play_text "%a" a = <arcade_total_plays> usecommas
		displayText parent = audit_container text = <total_play_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Total Left Starts" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_left_start_text "%a" a = <arcade_left_starts> usecommas
		displayText parent = audit_container text = <total_left_start_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Total Right Starts" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_right_start_text "%a" a = <arcade_right_starts> usecommas
		displayText parent = audit_container text = <total_right_start_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Total Left Continues" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_left_continue_text "%a" a = <arcade_left_continues> usecommas
		displayText parent = audit_container text = <total_left_continue_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Total Right Continues" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_right_continue_text "%a" a = <arcade_right_continues> usecommas
		displayText parent = audit_container text = <total_right_continue_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Total Single Player" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_singleplay_text "%a" a = (<arcade_total_plays> - <arcade_total_multiplayer_plays>) usecommas
		displayText parent = audit_container text = <total_singleplay_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Wins" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_wins_text "%a" a = <arcade_total_wins> usecommas
		displayText parent = audit_container text = <total_wins_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Fails" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_fails_text "%a" a = <arcade_total_fails> usecommas
		displayText parent = audit_container text = <total_fails_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Total Multiplayer" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_mutliplay_text "%a" a = <arcade_total_multiplayer_plays> usecommas
		displayText parent = audit_container text = <total_mutliplay_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Faceoff" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_faceoff_text "%a" a = <arcade_total_faceoff_plays> usecommas
		displayText parent = audit_container text = <total_faceoff_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Pro Faceoff" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_profaceoff_text "%a" a = <arcade_total_pro_faceoff_plays> usecommas
		displayText parent = audit_container text = <total_profaceoff_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Co-op" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_coop_text "%a" a = <arcade_total_coop_plays> usecommas
		displayText parent = audit_container text = <total_coop_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Total Lefty Plays" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_unfinished_text "%a" a = (<arcade_lefty_p1_plays> + <arcade_lefty_p2_plays>) usecommas
		displayText parent = audit_container text = <total_unfinished_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Left Player" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_unfinished_text "%a" a = (<arcade_lefty_p1_plays>) usecommas
		displayText parent = audit_container text = <total_unfinished_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Right Player" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_unfinished_text "%a" a = (<arcade_lefty_p2_plays>) usecommas
		displayText parent = audit_container text = <total_unfinished_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Total Premium" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_premium_text "%a" a = <arcade_total_premium> usecommas
		displayText parent = audit_container text = <total_premium_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Total Unfinished" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_unfinished_text "%a" a = (<arcade_total_plays> - <arcade_total_finished> - <arcade_total_test_in_game>) usecommas
		displayText parent = audit_container text = <total_unfinished_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = ($audits_col_2 + $audits_row_start)
		displayText parent = audit_container text = "Diagnostic Data" Pos = <audits_cur_coords> z = <z> rgba = [0 128 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_row_offset)
		displayText parent = audit_container text = "Total Boots" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_boots_text "%a" a = <arcade_total_boots> usecommas
		displayText parent = audit_container text = <total_boots_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Maint. Reboots" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_maint_boots_text "%a" a = <arcade_total_maintenance_resets> usecommas
		displayText parent = audit_container text = <total_maint_boots_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Watchdog Reboots" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		GetWDFlagState
		if (<wd_flag> = 1)
			formatText TextName = total_watchdog_boots_text "*%b" b = <arcade_total_watchdog_resets> usecommas
		else
			formatText TextName = total_watchdog_boots_text "%b" b = <arcade_total_watchdog_resets> usecommas
		endif
		displayText parent = audit_container text = <total_watchdog_boots_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Guitar Reboots" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_drop_boots_text "%a" a = <arcade_guitar_drop_reboots> usecommas
		displayText parent = audit_container text = <total_drop_boots_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "In-Game Drops" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_game_drops_text "%a" a = <arcade_guitar_drops_in_game> usecommas
		displayText parent = audit_container text = <total_game_drops_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Left Guitar Missing" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_left_drops_text "%a" a = <arcade_guitar_left_drops> usecommas
		displayText parent = audit_container text = <total_left_drops_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Right Guitar Missing" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_right_drops_text "%a" a = <arcade_guitar_right_drops> usecommas
		displayText parent = audit_container text = <total_right_drops_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "I/O Board Drops" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = total_IO_drops_text "%a" a = <arcade_io_drops> usecommas
		displayText parent = audit_container text = <total_IO_drops_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Total Time On" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		audits_format_time atime = <arcade_total_time>
		displayText parent = audit_container text = <time_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Boot Time On" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		audits_format_time atime = <arcade_boot_time>
		displayText parent = audit_container text = <time_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Total Play Time" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		audits_format_time atime = <arcade_total_play_time>
		displayText parent = audit_container text = <time_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Total Menu Time" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		audits_format_time atime = <arcade_total_menu_time>
		displayText parent = audit_container text = <time_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Avg. Play Time" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		if (<arcade_total_plays> > 0)
			avg_play_time = (<arcade_total_play_time> / <arcade_total_plays>)
		else
			avg_play_time = 0
		endif
		audits_format_time atime = <avg_play_time>
		displayText parent = audit_container text = <time_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Avg. Menu Time" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		if (<arcade_total_plays> > 0)
			printf "audits_update_text: menu_time = %d, total_plays = %e" d = <arcade_total_menu_time> e = <arcade_total_plays>
			avg_menu_time = (<arcade_total_menu_time> / <arcade_total_plays>)
		else
			avg_menu_time = 0
		endif
		audits_format_time atime = <avg_menu_time>
		displayText parent = audit_container text = <time_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + (2 * $audits_row_offset))
		displayText parent = audit_container text = "Difficulty Totals" Pos = <audits_cur_coords> z = <z> rgba = [0 128 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_row_offset)
		displayText parent = audit_container text = "Beginner" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = beginner_text "%a" a = <arcade_total_beginner> usecommas
		displayText parent = audit_container text = <beginner_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Passed" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = passed_beginner_text "%a" a = <arcade_total_beginner_passed> usecommas
		displayText parent = audit_container text = <passed_beginner_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Easy" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = easy_text "%a" a = <arcade_total_easy> usecommas
		displayText parent = audit_container text = <easy_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Passed" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = passed_easy_text "%a" a = <arcade_total_easy_passed> usecommas
		displayText parent = audit_container text = <passed_easy_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Medium" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = medium_text "%a" a = <arcade_total_medium> usecommas
		displayText parent = audit_container text = <medium_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Passed" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = passed_medium_text "%a" a = <arcade_total_medium_passed> usecommas
		displayText parent = audit_container text = <passed_medium_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Hard" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = hard_text "%a" a = <arcade_total_hard> usecommas
		displayText parent = audit_container text = <hard_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Passed" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = passed_hard_text "%a" a = <arcade_total_hard_passed> usecommas
		displayText parent = audit_container text = <passed_hard_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = "Expert" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = expert_text "%a" a = <arcade_total_expert> usecommas
		displayText parent = audit_container text = <expert_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> - $audits_col_data_offset + $audits_row_offset)
		displayText parent = audit_container text = " - Passed" Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		<audits_cur_coords> = (<audits_cur_coords> + $audits_col_data_offset)
		formatText TextName = passed_expert_text "%a" a = <arcade_total_expert_passed> usecommas
		displayText parent = audit_container text = <passed_expert_text> Pos = <audits_cur_coords> z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
	elseif (audit_page = 1)
		destroy_menu \{menu_id = audit_container}
		CreateScreenElement \{Type = ContainerElement
			parent = cl_container
			id = audit_container
			Pos = (0.0, 0.0)}
		displayText parent = audit_container text = "total" Pos = (586.0, 90.0) z = <z> rgba = [0 0 0 255] Scale = 0.32000002 just = [center top] font = text_a4 noshadow
		displayText parent = audit_container text = "p/w" Pos = (586.0, 105.0) z = <z> rgba = [0 0 0 255] Scale = 0.32000002 just = [center top] font = text_a4 noshadow
		displayText parent = audit_container text = "multi" Pos = (620.0, 90.0) z = <z> rgba = [0 0 0 255] Scale = 0.32000002 just = [center top] font = text_a4 noshadow
		displayText parent = audit_container text = "p" Pos = (620.0, 105.0) z = <z> rgba = [0 0 0 255] Scale = 0.32000002 just = [center top] font = text_a4 noshadow
		displayText parent = audit_container text = "diff" Pos = (680.0, 90.0) z = <z> rgba = [0 0 0 255] Scale = 0.32000002 just = [center top] font = text_a4 noshadow
		displayText parent = audit_container text = "b/e/m/h/x" Pos = (680.0, 105.0) z = <z> rgba = [0 0 0 255] Scale = 0.32000002 just = [center top] font = text_a4 noshadow
		displayText parent = audit_container text = "total" Pos = (1056.0, 90.0) z = <z> rgba = [0 0 0 255] Scale = 0.32000002 just = [center top] font = text_a4 noshadow
		displayText parent = audit_container text = "p/w" Pos = (1056.0, 105.0) z = <z> rgba = [0 0 0 255] Scale = 0.32000002 just = [center top] font = text_a4 noshadow
		displayText parent = audit_container text = "multi" Pos = (1090.0, 90.0) z = <z> rgba = [0 0 0 255] Scale = 0.32000002 just = [center top] font = text_a4 noshadow
		displayText parent = audit_container text = "p" Pos = (1090.0, 105.0) z = <z> rgba = [0 0 0 255] Scale = 0.32000002 just = [center top] font = text_a4 noshadow
		displayText parent = audit_container text = "diff" Pos = (1150.0, 90.0) z = <z> rgba = [0 0 0 255] Scale = 0.32000002 just = [center top] font = text_a4 noshadow
		displayText parent = audit_container text = "b/e/m/h/x" Pos = (1150.0, 105.0) z = <z> rgba = [0 0 0 255] Scale = 0.32000002 just = [center top] font = text_a4 noshadow
		GetArraySize \{$gh3_arcade_tier_songs}
		num_arcade_songs = <array_Size>
		start_song_pos = (270.0, 120.0)
		song_stat_offset_pos = (450.0, 0.0)
		col_offset_pos = (470.0, 0.0)
		next_song_offset_pos = (0.0, 20.0)
		num_songs_per_column = 26
		cur_pos = <start_song_pos>
		array_count = 0
		song_col_count = 0
		num_columns_count = 0
		temp_song_name = ''
		begin
		<temp_song_name> = ($gh3_arcade_tier_songs [<array_count>])
		formatText checksumName = song_stats 'arcade_song_stats_%s' s = ($permanent_songlist_props.<temp_song_name>.Name)
		GetGlobalTags <song_stats>
		formatText TextName = total_play_text "%a/%b  %h  %j/%c/%d/%e/%f" a = <played> b = <passed> h = <multiplayer_played> j = <beginner_played> c = <easy_played> d = <medium_played> e = <hard_played> f = <expert_played>
		get_song_title song = ($gh3_arcade_tier_songs [<array_count>])
		StringToCharArray string = <song_title>
		GetArraySize <char_array>
		max_characters = 14
		if (<array_Size> >= <max_characters>)
			new_song_text = ""
			char_index = 0
			begin
			<new_song_text> = (<new_song_text> + (<char_array> [<char_index>]))
			<char_index> = (<char_index> + 1)
			if (<char_index> >= <array_Size>)
				break
			endif
			if (<char_index> >= <max_characters>)
				if ((<char_array> [<char_index>]) = " ")
					printf \{"found space"}
					break
				endif
			endif
			repeat
			if (<song_title> != <new_song_text>)
				<song_title> = (<new_song_text> + "...")
			endif
		endif
		displayText parent = audit_container text = <song_title> Pos = <cur_pos> z = <z> rgba = [50 0 0 255] Scale = 0.5 font = text_a4 noshadow
		displayText parent = audit_container text = <total_play_text> Pos = (<cur_pos> + <song_stat_offset_pos>) z = <z> rgba = [50 0 0 255] Scale = 0.5 just = [right top] font = text_a4 noshadow
		<cur_pos> = (<cur_pos> + <next_song_offset_pos>)
		Increment \{array_count}
		Increment \{song_col_count}
		if (<song_col_count> = <num_songs_per_column>)
			Increment \{num_columns_count}
			<song_col_count> = 0
			<cur_pos> = (<start_song_pos> + (<col_offset_pos> * <num_columns_count>))
		endif
		repeat <num_arcade_songs>
	endif
endscript

script destroy_audits_menu 
	KillSpawnedScript \{Name = audits_periodic_update}
	if IsWinPort
		if ($audits_most_recent_in_game_setting = 1)
			restore_start_key_binding
		endif
	else
		restore_start_key_binding
	endif
	SpawnScriptNow \{menu_music_on}
	if ViewportExists \{id = bg_viewport}
		enable_bg_viewport
	endif
	Change \{audits_dirty = 0}
	destroy_menu_backdrop
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = do_audits_update}
	destroy_menu \{menu_id = cl_scroll}
	destroy_menu \{menu_id = cl_container}
	if ScreenElementExists \{id = cl_manual_adjust_handler}
		DestroyScreenElement \{id = cl_manual_adjust_handler}
	endif
	LaunchEvent \{Type = focus
		target = root_window}
endscript

script menu_audits_focus 
	generic_menu_up_or_down_sound
	Wait \{1
		gameframes}
	if (<index> = 0)
		retail_menu_focus
		SetScreenElementProps \{id = audits_hilite
			Pos = $audits_hilite_pos0
			dims = $audits_hilite_dims0}
	else (<index> = 1)
		retail_menu_focus
		SetScreenElementProps \{id = audits_hilite
			Pos = $audits_hilite_pos1
			dims = $audits_hilite_dims1}
	endif
endscript

script menu_audits_unfocus 
	if (<index> = 0)
		retail_menu_unfocus
	else (<index> = 1)
		retail_menu_unfocus
	endif
endscript

script menu_audits_prev 
	Change audit_page = ($audit_page - 1)
	if (audit_page < 0)
		Change \{audit_page = 1}
	endif
	audits_update_text
	return
endscript

script menu_audits_next 
	Change audit_page = ($audit_page + 1)
	if (audit_page > 1)
		Change \{audit_page = 0}
	endif
	audits_update_text
	return
endscript

script menu_audits_go_back 
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	if ScreenElementExists \{id = cl_scroll}
		LaunchEvent \{Type = unfocus
			target = cl_scroll}
	endif
	if ScreenElementExists \{id = cl_vmenu}
		LaunchEvent \{Type = unfocus
			target = cl_vmenu}
	endif
	if ($audits_dirty = 1)
		ui_flow_manager_respond_to_action \{action = continue}
	else
		ui_flow_manager_respond_to_action \{action = go_back}
	endif
endscript

script menu_audits_manual_choose 
	SetScreenElementProps \{id = audits_hilite
		rgba = $audits_hilite_selected}
	SetScreenElementProps \{id = cl_vmenu
		block_events}
	CreateScreenElement \{Type = ContainerElement
		parent = cl_container
		id = cl_manual_adjust_handler
		event_handlers = [
			{
				pad_up
				menu_audits_manual_up
			}
			{
				pad_down
				menu_audits_manual_down
			}
			{
				pad_choose
				menu_audits_manual_back
			}
			{
				pad_back
				menu_audits_manual_back
			}
		]}
	LaunchEvent \{Type = focus
		target = cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
endscript

script menu_audits_manual_back 
	SetScreenElementProps \{id = audits_hilite
		rgba = $audits_hilite_unselected}
	SetScreenElementProps \{id = cl_vmenu
		unblock_events}
	DestroyScreenElement \{id = cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
endscript

script menu_audits_manual_up 
	generic_menu_up_or_down_sound
endscript

script menu_audits_manual_down 
	generic_menu_up_or_down_sound
endscript

script menu_audits_adjust \{value = 1}
	GetGlobalTags \{user_options}
	Change \{audits_dirty = 1}
	audits_update_text
	return \{true}
endscript

script spawn_background_audit_handling 
	SpawnScriptNow \{update_audit_timers}
endscript

script update_audit_timers 
	printf \{"update_audit_timers: spawn"}
	local_arcade_total_time = 0.0
	local_arcade_total_play_time = 0.0
	local_arcade_total_menu_time = 0.0
	local_arcade_boot_time = 0.0
	Wait \{1
		Seconds}
	GetGlobalTags \{arcade_audits}
	old_arcade_total_time = <arcade_total_time>
	old_arcade_total_play_time = <arcade_total_play_time>
	old_arcade_total_menu_time = <arcade_total_menu_time>
	old_arcade_boot_time = <arcade_boot_time>
	begin
	GetGlobalTags \{arcade_audits}
	GetDeltaTime
	if ($arcade_in_game = 1)
		<local_arcade_total_play_time> = (<local_arcade_total_play_time> + <delta_time>)
		temp_local_arcade_total_play_time = <local_arcade_total_play_time>
		CastToInteger \{temp_local_arcade_total_play_time}
		<arcade_total_play_time> = (<old_arcade_total_play_time> + <temp_local_arcade_total_play_time>)
	elseif ($arcade_in_menu = 1)
		<local_arcade_total_play_time> = (<local_arcade_total_play_time> + <delta_time>)
		temp_local_arcade_total_play_time = <local_arcade_total_play_time>
		CastToInteger \{temp_local_arcade_total_play_time}
		<arcade_total_play_time> = (<old_arcade_total_play_time> + <temp_local_arcade_total_play_time>)
		<local_arcade_total_menu_time> = (<local_arcade_total_menu_time> + <delta_time>)
		temp_local_arcade_total_menu_time = <local_arcade_total_menu_time>
		CastToInteger \{temp_local_arcade_total_menu_time}
		<arcade_total_menu_time> = (<old_arcade_total_menu_time> + <temp_local_arcade_total_menu_time>)
	else
	endif
	<local_arcade_total_time> = (<local_arcade_total_time> + <delta_time>)
	temp_local_arcade_total_time = <local_arcade_total_time>
	CastToInteger \{temp_local_arcade_total_time}
	<arcade_total_time> = (<old_arcade_total_time> + <temp_local_arcade_total_time>)
	<local_arcade_boot_time> = (<local_arcade_boot_time> + <delta_time>)
	temp_local_arcade_boot_time = <local_arcade_boot_time>
	CastToInteger \{temp_local_arcade_boot_time}
	<arcade_boot_time> = (<old_arcade_boot_time> + <temp_local_arcade_boot_time>)
	SetGlobalTags arcade_audits params = {
		arcade_total_time = <arcade_total_time> ,
		arcade_boot_time = <arcade_boot_time> ,
		arcade_total_menu_time = <arcade_total_menu_time> ,
		arcade_total_play_time = <arcade_total_play_time>
	}
	Wait \{1
		gameframe}
	repeat
endscript
