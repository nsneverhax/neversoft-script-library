detailed_stats_font = text_a3
detailed_stats_text_color = [
	0
	0
	0
	255
]
detailed_stats_text_scale = 1
initial_column_y_end = 340
left_column_num_elements = 0
left_column_x = 250
left_column_y_end = 100
left_column_just = [
	left
	top
]
center_column_num_elements = 0
center_column_y_end = 100
center_column_x = 640
center_column_just = [
	center
	top
]
right_column_num_elements = 0
right_column_x = 1030
right_column_y_end = 100
right_column_just = [
	right
	top
]
relative_screen_y_position = 0
up_down_y_change = 50
bottom_gap = 150

script create_detailed_stats_menu 
	change \{left_column_num_elements = 0}
	change left_column_y_end = ($initial_column_y_end)
	change \{center_column_num_elements = 0}
	change center_column_y_end = ($initial_column_y_end)
	change \{right_column_num_elements = 0}
	change right_column_y_end = ($initial_column_y_end)
	change \{relative_screen_y_position = 0}
	change center_column_x = (($left_column_x) + (0.5 * ($right_column_x - $left_column_x)))
	notes_ratio = ["" ""]
	sp_ratio = ["" ""]
	avg_multiplier = ["" ""]
	lead_percentage = ["" ""]
	attacks_thrown = ["" ""]
	p1_notes_hit = ($player1_status.notes_hit)
	p1_notes_max = ($player1_status.total_notes)
	p1_sp_phrases_hit = ($player1_status.sp_phrases_hit)
	p1_sp_phrases_max = ($player1_status.sp_phrases_total)
	if ($player1_status.base_score > 0)
		p1_avg_multiplier_val = ($player1_status.score / (1.0 * $player1_status.base_score))
		if (<p1_avg_multiplier_val> < 1.0)
			p1_avg_multiplier_val = 1.0
		endif
	else
		p1_avg_multiplier_val = 1.0
	endif
	if ($game_mode = p2_coop || $game_mode = p2_quickplay)
		if ($player1_status.base_score = 0 &&
				$player2_status.base_score = 0)
			p1_avg_multiplier_val = 1.0
		else
			p1_avg_multiplier_val = (($player1_status.score + $player2_status.score)
				/ (1.0 * ($player1_status.base_score + $player2_status.base_score)))
			if (<p1_avg_multiplier_val> < 1.0)
				p1_avg_multiplier_val = 1.0
			endif
		endif
	endif
	formattext textname = p1_notes_ratio "%a/%b" a = <p1_notes_hit> b = <p1_notes_max>
	setarrayelement arrayname = notes_ratio index = 0 newvalue = <p1_notes_ratio>
	if NOT ($game_mode = p2_battle || $current_song = bossjoe)
		formattext textname = p1_sp_ratio "%a/%b" a = <p1_sp_phrases_hit> b = <p1_sp_phrases_max>
		setarrayelement arrayname = sp_ratio index = 0 newvalue = <p1_sp_ratio>
		formattext textname = p1_avg_multiplier "%d X" d = <p1_avg_multiplier_val>
		setarrayelement arrayname = avg_multiplier index = 0 newvalue = <p1_avg_multiplier>
	else
		formattext textname = p1_attacks_thrown "%a" a = ($player1_status.battle_num_attacks)
		setarrayelement arrayname = attacks_thrown index = 0 newvalue = <p1_attacks_thrown>
	endif
	if ($current_num_players = 2)
		p1_time_in_lead = 0
		p2_time_in_lead = 0
		total_time = ($player1_status.time_in_lead + $player2_status.time_in_lead)
		if (<total_time> > 0)
			p1_time_in_lead = ((100 * $player1_status.time_in_lead / <total_time>) + 0.5)
			casttointeger \{p1_time_in_lead}
			p2_time_in_lead = (100 - <p1_time_in_lead>)
		endif
		if NOT ($game_mode = p2_battle || $current_song = bossjoe)
			formattext textname = p1_lead_percent "%d\\%" d = <p1_time_in_lead>
			setarrayelement arrayname = lead_percentage index = 0 newvalue = <p1_lead_percent>
		endif
		p2_notes_hit = ($player2_status.notes_hit)
		p2_notes_max = ($player2_status.total_notes)
		p2_sp_phrases_hit = ($player2_status.sp_phrases_hit)
		p2_sp_phrases_max = ($player2_status.sp_phrases_total)
		if ($player2_status.base_score > 0)
			p2_avg_multiplier_val = ($player2_status.score / (1.0 * $player2_status.base_score))
			if (<p2_avg_multiplier_val> < 1.0)
				p2_avg_multiplier_val = 1.0
			endif
		else
			p2_avg_multiplier_val = 1.0
		endif
		formattext textname = p2_notes_ratio "%a/%b" a = <p2_notes_hit> b = <p2_notes_max>
		setarrayelement arrayname = notes_ratio index = 1 newvalue = <p2_notes_ratio>
		if NOT ($game_mode = p2_battle || $current_song = bossjoe)
			formattext textname = p2_sp_ratio "%a/%b" a = <p2_sp_phrases_hit> b = <p2_sp_phrases_max>
			setarrayelement arrayname = sp_ratio index = 1 newvalue = <p2_sp_ratio>
			formattext textname = p2_avg_multiplier "%d X" d = <p2_avg_multiplier_val>
			setarrayelement arrayname = avg_multiplier index = 1 newvalue = <p2_avg_multiplier>
			formattext textname = p2_lead_percent "%d\\%" d = <p2_time_in_lead>
			setarrayelement arrayname = lead_percentage index = 1 newvalue = <p2_lead_percent>
		else
			formattext textname = p2_attacks_thrown "%a" a = ($player2_status.battle_num_attacks)
			setarrayelement arrayname = attacks_thrown index = 1 newvalue = <p2_attacks_thrown>
		endif
	endif
	if ($game_mode = p2_battle)
		p1_sp_ratio = "N/A"
		p1_avg_multiplier = "N/A"
		p1_lead_percent = "N/A"
		p2_sp_ratio = "N/A"
		p2_avg_multiplier = "N/A"
		p2_lead_percent = "N/A"
	endif
	left_margin = 400
	right_margin = 800
	basic_stats_y_offset = 100
	if ($current_num_players = 1)
		desc_internal_just = [left top]
		desc_x_offset = <left_margin>
		p1_stat_internal_just = [right top]
		p1_stat_x_offset = <right_margin>
	else
		desc_internal_just = [center top]
		desc_x_offset = 640
		p1_stat_internal_just = [left top]
		p1_stat_x_offset = <left_margin>
		p2_stat_internal_just = [right top]
		p2_stat_x_offset = <right_margin>
	endif
	detailed_stats_create_container
	if ($current_num_players = 2)
		add_text_to_column \{column = 'left'
			text = "PLAYER ONE"}
		add_text_to_column \{column = 'right'
			text = "PLAYER TWO"}
		add_text_to_column \{column = 'center'
			text = ""}
		add_text_to_column \{column = 'left'
			text = ""}
		add_text_to_column \{column = 'center'
			text = ""}
		add_text_to_column \{column = 'right'
			text = ""}
	endif
	add_basic_stats_desc
	add_basic_stats notes_ratio = <notes_ratio> sp_ratio = <sp_ratio> lead_percentage = <lead_percentage> avg_multiplier = <avg_multiplier> attacks_thrown = <attacks_thrown>
	add_text_to_column \{column = 'left'
		text = ""}
	add_text_to_column \{column = 'center'
		text = ""}
	add_text_to_column \{column = 'right'
		text = ""}
	add_text_to_column \{column = 'left'
		text = ""}
	add_text_to_column \{column = 'right'
		text = ""}
	if NOT ($game_mode = p2_coop || $game_mode = p2_quickplay)
		add_text_to_column \{column = 'center'
			text = ""}
	else
		add_divider_graphic \{first_divider = 1}
	endif
	add_divider_graphic
	get_song_prefix song = ($current_song)
	formattext checksumname = song_section_array '%s_markers' s = <song_prefix>
	getmarkerarraysize array = (<song_section_array>)
	section_index = 0
	highlight = 1
	if (<array_size> > 0)
		begin
		get_highest_lowest_stats section_index = <section_index> section_array = <song_section_array>
		<section_index> = (<section_index> + 1)
		repeat <array_size>
	endif
	section_index = 0
	highlight = 1
	if (<array_size> > 0)
		begin
		add_section_stats_and_desc section_index = <section_index> section_array = <song_section_array> highlight = <highlight>
		if (<highlight> = 1)
			<highlight> = 0
		else
			<highlight> = 1
		endif
		<section_index> = (<section_index> + 1)
		repeat <array_size>
	endif
	menu_detailed_stats_add_paper_sprites
	circle_pos = [(327.0, 349.0) , (873.9, 349.0)]
	best_pos = [(595.0, 365.0) , (665.0, 365.0)]
	rot_vals = [-3 , 3]
	if NOT ($game_mode = p2_coop || $game_mode = p2_quickplay)
		if ($current_num_players = 2)
			tie = 0
			if ($game_mode = p2_battle)
				if (($player2_status.current_health) > ($player1_status.current_health))
					better_player = 1
					c = 'right'
				elseif ($player1_status.score > $player2_status.score)
					better_player = 0
					c = 'left'
				else
					<tie> = 1
				endif
			else
				if ($player2_status.score > $player1_status.score)
					better_player = 1
					c = 'right'
				elseif ($player1_status.score > $player2_status.score)
					better_player = 0
					c = 'left'
				else
					<tie> = 1
				endif
			endif
			if (<tie> = 0)
				formattext checksumname = entry_id '%c_column_%d' c = <c> d = 0
				getscreenelementprops id = <entry_id>
				getscreenelementdims id = <entry_id>
				createscreenelement {
					type = spriteelement
					parent = ds_container
					pos = (<circle_pos> [<better_player>])
					texture = circle_pen
					just = [center center]
					dims = ((1.8, 0.0) * <width> + (0.0, 4.25) * <height>)
					rgba = [60 70 115 100]
					z_priority = 7
				}
				createscreenelement {
					type = textelement
					parent = ds_container
					pos = (<best_pos> [<better_player>])
					text = "BEST!"
					font = text_a3
					rot_angle = (<rot_vals> [<better_player>])
					id = best_text
					z_priority = 7
					rgba = [60 70 115 100]
					scale = 1.4
				}
			endif
		endif
	endif
	add_user_control_helper \{text = "CONTINUE"
		button = green
		z = 100}
	add_user_control_helper \{text = "BACK"
		button = red
		z = 100}
	add_user_control_helper \{text = "UP/DOWN"
		button = strumbar
		z = 100}
endscript

script destroy_detailed_stats_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = ds_container}
	destroy_menu \{menu_id = temp_ds_background}
	destroy_menu \{menu_id = continue_text}
	destroy_menu \{menu_id = detailed_stats_bg_container}
	destroy_menu \{menu_id = ds_spotlight}
endscript

script add_basic_stats_desc 
	if ($current_num_players = 1)
		desc_column = 'left'
	else
		desc_column = 'center'
	endif
	add_text_to_column column = <desc_column> text = "NOTES HIT" dims = (400.0, 0.0)
	if NOT ($game_mode = p2_battle || $current_song = bossjoe)
		add_text_to_column column = <desc_column> text = "SP PHRASES" dims = (400.0, 0.0)
		if NOT ($game_mode = p2_coop || $game_mode = p2_quickplay)
			add_text_to_column column = <desc_column> text = "AVG MULTIPLIER" dims = (400.0, 0.0)
			if ($current_num_players = 2)
				add_text_to_column column = <desc_column> text = "TIME IN LEAD" dims = (400.0, 0.0)
			endif
		else
			add_text_to_column \{column = 'center'
				text = ""}
			add_text_to_column \{column = 'center'
				text = "AVG MULTIPLIER"
				dims = (400.0, 0.0)}
		endif
	else
		add_text_to_column column = <desc_column> text = "ATTACKS THROWN" dims = (400.0, 0.0)
	endif
endscript

script add_basic_stats 
	player = 0
	begin
	if ($current_num_players = 1)
		stat_column = 'right'
	else
		if (<player> = 0)
			stat_column = 'left'
		else
			stat_column = 'right'
		endif
	endif
	add_text_to_column column = <stat_column> text = (<notes_ratio> [<player>]) dims = (150.0, 0.0)
	if NOT ($game_mode = p2_battle || $current_song = bossjoe)
		add_text_to_column column = <stat_column> text = (<sp_ratio> [<player>]) dims = (150.0, 0.0)
		if NOT ($game_mode = p2_coop || $game_mode = p2_quickplay)
			add_text_to_column column = <stat_column> text = (<avg_multiplier> [<player>]) dims = (150.0, 0.0)
			if ($current_num_players = 2)
				add_text_to_column column = <stat_column> text = (<lead_percentage> [<player>]) dims = (150.0, 0.0)
			endif
		endif
	else
		add_text_to_column column = <stat_column> text = (<attacks_thrown> [<player>]) dims = (150.0, 0.0)
	endif
	<player> = (<player> + 1)
	repeat ($current_num_players)
	if ($game_mode = p2_coop || $game_mode = p2_quickplay)
		add_text_to_column column = 'center' text = (<avg_multiplier> [0]) dims = (150.0, 0.0)
		add_text_to_column \{column = 'left'
			text = ""}
		add_text_to_column \{column = 'right'
			text = ""}
		add_text_to_column \{column = 'left'
			text = ""}
		add_text_to_column \{column = 'right'
			text = ""}
	endif
endscript
g_players_lowest_stat = [
	0.0
	0.0
]
g_players_highest_stat = [
	0.0
	0.0
]

script get_highest_lowest_stats 
	get_section_stats section_index = <section_index> section_array = <section_array>
	player = 0
	begin
	if (<section_index> = 0)
		setarrayelement arrayname = g_players_lowest_stat globalarray index = <player> newvalue = 99.9
		setarrayelement arrayname = g_players_highest_stat globalarray index = <player> newvalue = 0.1
	endif
	if (<notes_max> [<player>] > 0)
		hit_percent = ((100 * (<notes_hit> [<player>])) / (<notes_max> [<player>]))
		if (<hit_percent> < $g_players_lowest_stat [<player>])
			setarrayelement arrayname = g_players_lowest_stat globalarray index = <player> newvalue = <hit_percent>
		endif
		if (<hit_percent> > $g_players_highest_stat [<player>])
			setarrayelement arrayname = g_players_highest_stat globalarray index = <player> newvalue = <hit_percent>
		endif
	endif
	<player> = (<player> + 1)
	repeat ($current_num_players)
endscript

script add_section_stats_and_desc \{section_index = 0
		highlight = 0
		for_practice = 0}
	get_section_stats section_index = <section_index> section_array = <section_array>
	if ($current_num_players = 1)
		desc_column = 'left'
	else
		desc_column = 'center'
	endif
	add_text_to_column column = <desc_column> text = <section_name> for_practice = <for_practice> dims = (500.0, 0.0)
	player = 0
	begin
	if ($current_num_players = 1)
		stat_column = 'right'
	else
		if (<player> = 0)
			stat_column = 'left'
		else
			stat_column = 'right'
		endif
	endif
	if (<notes_max> [<player>] > 0)
		hit_percent = ((100 * (<notes_hit> [<player>])) / (<notes_max> [<player>]))
		formattext textname = section_percent "%d \\%" d = <hit_percent>
		if (<hit_percent> = 100)
			add_text_to_column column = <stat_column> text = <section_percent> rgba = [20 165 0 255] highlight = <highlight> for_practice = <for_practice>
		elseif (<hit_percent> = $g_players_lowest_stat [<player>])
			add_text_to_column column = <stat_column> text = <section_percent> rgba = [165 0 0 255] highlight = <highlight> for_practice = <for_practice>
		else
			add_text_to_column column = <stat_column> text = <section_percent> highlight = <highlight> for_practice = <for_practice>
		endif
	else
		hit_percent = 0
		formattext \{textname = section_percent
			"N/A"}
		add_text_to_column column = <stat_column> text = <section_percent> highlight = <highlight> for_practice = <for_practice>
	endif
	<player> = (<player> + 1)
	repeat ($current_num_players)
endscript

script detailed_stats_create_container \{for_practice = 0}
	if ($player1_status.bot_play = 1)
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_faceoff ||
				$game_mode = p2_pro_faceoff ||
				$game_mode = p2_battle ||
				$game_mode = p2_quickplay)
			exclusive_mp_controllers = [0 , 0]
			setarrayelement arrayname = exclusive_mp_controllers index = 0 newvalue = ($player1_device)
			setarrayelement arrayname = exclusive_mp_controllers index = 1 newvalue = ($player2_device)
			exclusive_device = <exclusive_mp_controllers>
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	createscreenelement \{type = containerelement
		parent = root_window
		id = ds_container
		pos = (0.0, 0.0)}
	createscreenelement {
		type = textelement
		parent = root_window
		id = continue_text
		scale = 0.8
		pos = (50.0, 23.0)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [left center]
		z_priority = 101
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
			{pad_choose ui_flow_manager_respond_to_action params = {action = continue}}
			{pad_down menu_detailed_stats_move_screen_up}
			{pad_up menu_detailed_stats_move_screen_down}
			{pad_start menu_show_gamercard}
		]
		exclusive_device = <exclusive_device>
	}
	if (<for_practice> = 0)
		launchevent \{type = focus
			target = continue_text}
	endif
	createscreenelement \{type = spriteelement
		id = detailed_stats_paper_top
		parent = ds_container
		texture = detailed_stats_sheet_top
		rot_angle = 2
		pos = (140.0, 50.0)
		just = [
			left
			top
		]
		z_priority = 1}
	if (<for_practice> = 1)
		createscreenelement {
			type = textelement
			parent = ds_container
			pos = ((1.0, 0.0) * ($left_column_x) + (0.0, 125.0))
			just = [left top]
			z_priority = 2
			font = ($detailed_stats_font)
			text = "PRACTICE SECTIONS"
			rgba = [118 29 30 255]
			scale = (1.7, 2.25)
		}
	else
		createscreenelement {
			type = textelement
			parent = ds_container
			pos = ((1.0, 0.0) * ($left_column_x) + (0.0, 125.0))
			just = [left top]
			z_priority = 2
			font = ($detailed_stats_font)
			text = "DETAILED"
			rgba = [118 29 30 255]
			scale = 2.75
		}
		createscreenelement {
			type = textelement
			parent = ds_container
			pos = ((1.0, 0.0) * ($left_column_x) + (0.0, 215.0))
			just = [left top]
			z_priority = 2
			font = ($detailed_stats_font)
			text = "BREAKDOWN"
			rgba = [118 29 30 255]
			scale = 2.75
		}
	endif
	createscreenelement \{type = containerelement
		id = detailed_stats_bg_container
		parent = root_window
		pos = (0.0, 0.0)}
	createscreenelement \{type = spriteelement
		id = detailed_stats_bg0
		parent = detailed_stats_bg_container
		texture = detailed_stats_bg
		rgba = [
			255
			255
			255
			255
		]
		pos = (0.0, 0.0)
		dims = (1280.0, 240.0)
		just = [
			left
			top
		]
		z_priority = 0}
	createscreenelement \{type = spriteelement
		id = detailed_stats_bg1
		parent = detailed_stats_bg_container
		texture = detailed_stats_bg
		rgba = [
			255
			255
			255
			255
		]
		pos = (0.0, 240.0)
		dims = (1280.0, 240.0)
		just = [
			left
			top
		]
		z_priority = 0}
	createscreenelement \{type = spriteelement
		id = detailed_stats_bg2
		parent = detailed_stats_bg_container
		texture = detailed_stats_bg
		rgba = [
			255
			255
			255
			255
		]
		pos = (0.0, 480.0)
		dims = (1280.0, 240.0)
		just = [
			left
			top
		]
		z_priority = 0}
	createscreenelement \{type = spriteelement
		id = detailed_stats_bg3
		parent = detailed_stats_bg_container
		texture = detailed_stats_bg
		rgba = [
			255
			255
			255
			255
		]
		pos = (0.0, 720.0)
		dims = (1280.0, 240.0)
		just = [
			left
			top
		]
		z_priority = 0}
	createscreenelement \{type = spriteelement
		parent = root_window
		id = ds_spotlight
		texture = detailed_stats_spotlight_overlay
		rgba = [
			255
			255
			255
			255
		]
		dims = (1280.0, 720.0)
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		z_priority = 7
		blend = sub}
endscript

script add_text_to_column {
		column = 'left'
		text = "No string"
		rgba = [75 75 75 255]
		scale = ($detailed_stats_text_scale)
		rot = 0
		highlight = 0
		font = ($detailed_stats_font)
		for_practice = 0
	}
	formattext checksumname = column_x '%s_column_x' s = (<column>)
	formattext checksumname = column_y_end '%s_column_y_end' s = (<column>)
	formattext checksumname = column_just '%s_column_just' s = (<column>)
	formattext checksumname = column_elements '%s_column_num_elements' s = <column>
	formattext checksumname = entry_id '%s_column_%d' s = <column> d = (<column_elements>)
	getuppercasestring <text>
	if (<for_practice> = 1)
		<uppercasestring> = ""
		font = text_a4
	endif
	if gotparam \{dont_force_caps}
		<display_string> = <text>
	else
		<display_string> = <uppercasestring>
	endif
	createscreenelement {
		type = textelement
		parent = ds_container
		id = <entry_id>
		font = <font>
		rgba = <rgba>
		scale = <scale>
		rot_angle = <rot>
		pos = ((1.0, 0.0) * <column_x> + (0.0, 1.0) * <column_y_end>)
		just = (<column_just>)
		text = <display_string>
		z_priority = 6
		font_spacing = 4
	}
	if gotparam \{dims}
		getscreenelementdims id = <id>
		if NOT (<width> = 0)
			fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = (((<dims>.(1.0, 0.0)) * (1.0, 0.0)) + <height> * (0.0, 1.0))
		endif
	endif
	getscreenelementdims id = <entry_id>
	if (<for_practice> = 1)
		height = (<height> - 1)
	endif
	highlight_width = ($right_column_x - $left_column_x + 50)
	if (<highlight> = 1)
		createscreenelement {
			type = spriteelement
			parent = ds_container
			pos = ((1.0, 0.0) * ($left_column_x - 25) + (0.0, 1.0) * (<column_y_end> - 4))
			dims = ((1.0, 0.0) * <highlight_width> + (0.0, 1.0) * <height>)
			rgba = [0 0 0 25]
			just = [left top]
			z_priority = 3
		}
	endif
	new_column_y_end = (<column_y_end> + <height>)
	new_num_column_elements = (<column_elements> + 1)
	change globalname = <column_y_end> newvalue = <new_column_y_end>
	change globalname = <column_elements> newvalue = <new_num_column_elements>
endscript

script get_section_stats \{section_index = 0}
	notes_hit = [0 0]
	notes_max = [1 1]
	setarrayelement arrayname = notes_hit index = 0 newvalue = ($p1_last_song_detailed_stats [<section_index>])
	setarrayelement arrayname = notes_hit index = 1 newvalue = ($p2_last_song_detailed_stats [<section_index>])
	setarrayelement arrayname = notes_max index = 0 newvalue = ($p1_last_song_detailed_stats_max [<section_index>])
	setarrayelement arrayname = notes_max index = 1 newvalue = ($p2_last_song_detailed_stats_max [<section_index>])
	section_name = ((<section_array> [<section_index>]).marker)
	return <...>
endscript

script menu_detailed_stats_move_screen_down 
	if (($relative_screen_y_position + $up_down_y_change) < 0)
		change relative_screen_y_position = ($relative_screen_y_position + $up_down_y_change)
		generic_menu_up_or_down_sound
	else
		change \{relative_screen_y_position = 0}
	endif
	setscreenelementprops id = ds_container pos = ((0.0, 1.0) * ($relative_screen_y_position))
	menu_ds_scroll_all
endscript

script menu_detailed_stats_move_screen_up 
	stats_end = ($relative_screen_y_position + $left_column_y_end)
	getscreenelementdims \{id = root_window}
	bottom_end = (<height> - $bottom_gap)
	if ((<stats_end> - $up_down_y_change) > <bottom_end>)
		change relative_screen_y_position = ($relative_screen_y_position - $up_down_y_change)
		generic_menu_up_or_down_sound
	endif
	setscreenelementprops id = ds_container pos = ((0.0, 1.0) * ($relative_screen_y_position))
	menu_ds_scroll_all
endscript

script menu_ds_scroll_all 
	menu_ds_scroll_background
endscript

script menu_ds_scroll_background 
	scroll_position = (-1 * ($relative_screen_y_position))
	printf "Scroll position is %d" d = <scroll_position>
	if (<scroll_position> < 240)
		setscreenelementprops id = detailed_stats_bg_container pos = ((0.0, -1.0) * <scroll_position>)
	else
		mod a = <scroll_position> b = 240
		setscreenelementprops id = detailed_stats_bg_container pos = ((0.0, -1.0) * <mod>)
	endif
endscript

script menu_detailed_stats_add_paper_sprites 
	createscreenelement {
		type = spriteelement
		parent = ds_container
		pos = ((1.0, 0.0) * 129 + (0.0, 1.0) * ($left_column_y_end))
		rot_angle = 2
		dims = (1016.0, 128.0)
		texture = detailed_stats_sheet_bottom
		just = [left top]
		z_priority = 2
	}
	num_left_side_paper_repetitions = 3
	y_position = 304
	total_desired_dim = ($left_column_y_end - $initial_column_y_end)
	piecewise_desired_dim = ((<total_desired_dim> + 39) / <num_left_side_paper_repetitions>)
	begin
	createscreenelement {
		type = spriteelement
		parent = ds_container
		pos = ((1.0, 0.0) * 129 + (0.0, 1.0) * <y_position>)
		dims = ((32.0, 0.0) + (0.0, 1.0) * <piecewise_desired_dim>)
		texture = detailed_stats_sheet_l
		just = [left top]
		z_priority = 2
	}
	<y_position> = (<y_position> + <piecewise_desired_dim>)
	repeat <num_left_side_paper_repetitions>
	num_right_side_paper_repetitions = 3
	y_position = 339
	piecewise_desired_dim = ((<total_desired_dim> + 37) / <num_right_side_paper_repetitions>)
	begin
	createscreenelement {
		type = spriteelement
		parent = ds_container
		pos = ((1.0, 0.0) * 1087 + (0.0, 1.0) * <y_position>)
		dims = ((64.0, 0.0) + (0.0, 1.0) * <piecewise_desired_dim>)
		texture = detailed_stats_sheet_r
		just = [left top]
		z_priority = 2
	}
	<y_position> = (<y_position> + <piecewise_desired_dim>)
	repeat <num_right_side_paper_repetitions>
	createscreenelement {
		type = spriteelement
		parent = ds_container
		pos = (139.0, 304.0)
		dims = ((1.0, 0.0) * 976 + (0.0, 1.0) * (<total_desired_dim> + 70))
		rgba = [255 255 255 255]
		z_priority = 1
		just = [left top]
	}
endscript

script add_divider_graphic \{first_divider = 0}
	c = 'left'
	if ($is_network_game)
		divider_element_num = 8
	elseif ($current_num_players = 1)
		divider_element_num = 4
	else
		if ($game_mode = p2_faceoff ||
				$game_mode = p2_pro_faceoff)
			divider_element_num = 7
		elseif ($game_mode = p2_battle)
			divider_element_num = 5
		elseif ($game_mode = p2_coop || $game_mode = p2_quickplay)
			if (<first_divider> = 1)
				divider_element_num = 5
			else
				divider_element_num = 7
			endif
			c = 'center'
		else
			divider_element_num = 6
		endif
	endif
	if ($current_song = bossjoe)
		divider_element_num = 3
	endif
	formattext checksumname = entry_id '%c_column_%d' c = <c> d = <divider_element_num>
	getscreenelementprops id = <entry_id>
	divider_y = (<pos> [1])
	printf "Divider_y = %d" d = <divider_y>
	createscreenelement {
		type = spriteelement
		parent = ds_container
		pos = ((1.0, 0.0) * $center_column_x + (0.0, 1.0) * (<divider_y> - 8))
		scale = (2.5, 1.4)
		texture = detailed_stats_divider
		just = [center center]
		z_priority = 5
	}
endscript
