g_p1_scores = [
	0
	0
	0
	0
	0
	0
	0
]
g_p2_scores = [
	0
	0
	0
	0
	0
	0
	0
]
g_best_streaks = [
	0
	0
]
g_high_scores = [
	0
	0
]

script create_net_detailed_stats_menu 
	change left_column_num_elements = 0
	change left_column_y_end = ($initial_column_y_end)
	change center_column_num_elements = 0
	change center_column_y_end = ($initial_column_y_end)
	change right_column_num_elements = 0
	change right_column_y_end = ($initial_column_y_end)
	change relative_screen_y_position = 0
	change center_column_x = (($left_column_x) + (0.5 * ($right_column_x - $left_column_x)))
	left_margin = 400
	right_margin = 800
	basic_stats_y_offset = 100
	desc_internal_just = [center top]
	desc_x_offset = 640
	p1_stat_internal_just = [left top]
	p1_stat_x_offset = <left_margin>
	p2_stat_internal_just = [right top]
	p2_stat_x_offset = <right_margin>
	detailed_stats_create_container
	netsessionfunc obj = match func = get_gamertag
	add_text_to_column column = 'left' text = <name> rgba = ($player1_color)
	add_text_to_column column = 'center' text = ""
	add_text_to_column column = 'right' text = ""
	add_text_to_column column = 'left' text = ""
	add_text_to_column column = 'center' text = "VS."
	add_text_to_column column = 'right' text = ""
	add_text_to_column column = 'left' text = ""
	add_text_to_column column = 'center' text = ""
	add_text_to_column column = 'right' text = ($opponent_gamertag) rgba = ($player2_color) scale = (0.75, 1.0)
	add_text_to_column column = 'left' text = ""
	add_text_to_column column = 'center' text = ""
	add_text_to_column column = 'right' text = ""
	net_add_basic_stats
	add_text_to_column column = 'left' text = ""
	add_text_to_column column = 'center' text = ""
	add_text_to_column column = 'right' text = ""
	add_text_to_column column = 'left' text = ""
	add_text_to_column column = 'center' text = ""
	add_text_to_column column = 'right' text = ""
	add_divider_graphic
	get_number_of_songs
	set_index = 0
	highlight = 1
	begin
	net_add_stats_and_desc_row set_index = <set_index> highlight = <highlight>
	if (<highlight> = 1)
		<highlight> = 0
	else
		<highlight> = 1
	endif
	<set_index> = (<set_index> + 1)
	repeat <num_songs>
	menu_detailed_stats_add_paper_sprites
	circle_pos = [(400.0, 349.0) , (773.9, 449.0)]
	best_pos = [(595.0, 365.0) , (665.0, 365.0)]
	rot_vals = [-3 , 3]
endscript

script net_add_basic_stats 
	net_stats_calculate_wins
	player = 0
	begin
	wins_color = $detailed_stats_text_color
	streak_color = $detailed_stats_text_color
	score_color = $detailed_stats_text_color
	if (<player> = 0)
		stat_column = 'left'
		formattext textname = wins_text "%d" d = <p1_wins>
		color = $player1_color
	else
		stat_column = 'right'
		formattext textname = wins_text "%d" d = <p2_wins>
		color = $player2_color
	endif
	formattext textname = streak_text "%d" d = ($g_best_streaks [<player>])
	formattext textname = score_text "%d" d = ($g_high_scores [<player>])
	add_text_to_column column = <stat_column> text = <wins_text> rgba = <color>
	add_text_to_column column = <stat_column> text = <streak_text> rgba = <color>
	add_text_to_column column = <stat_column> text = <score_text> rgba = <color>
	<player> = (<player> + 1)
	repeat 2
	desc_column = 'center'
	add_text_to_column column = <desc_column> text = "WINS"
	add_text_to_column column = <desc_column> text = "BEST STREAK"
	add_text_to_column column = <desc_column> text = "HIGHEST SCORE"
endscript

script net_add_stats_and_desc_row set_index = 0 highlight = 0
	desc_column = 'center'
	get_song_title song = ($net_setlist_songs [<set_index>])
	add_text_to_column column = <desc_column> text = <song_title> scale = (0.8, 1.0)
	player = 0
	begin
	color = $detailed_stats_text_color
	if (<player> = 0)
		stat_column = 'left'
		score = ($g_p1_scores [<set_index>])
		color = ($player1_color)
	else
		stat_column = 'right'
		score = ($g_p2_scores [<set_index>])
		color = ($player2_color)
	endif
	formattext textname = score_text "%d" d = <score>
	add_text_to_column column = <stat_column> text = <score_text> rgba = <color> highlight = <highlight>
	<player> = (<player> + 1)
	repeat 2
endscript

script net_stats_calculate_wins 
	p1_wins = 0
	p2_wins = 0
	get_number_of_songs
	array_count = 0
	begin
	if ($g_p1_scores [<array_count>] > $g_p2_scores [<array_count>])
		<p1_wins> = (<p1_wins> + 1)
	elseif ($g_p2_scores [<array_count>] > $g_p1_scores [<array_count>])
		<p2_wins> = (<p2_wins> + 1)
	endif
	<array_count> = (<array_count> + 1)
	repeat <num_songs>
	return <...>
endscript

script reset_net_stats_menu 
	player = 0
	get_number_of_songs
	begin
	array_count = 0
	begin
	formattext checksumname = scores_array 'g_p%p_scores' p = (<player> + 1)
	setarrayelement arrayname = <scores_array> globalarray index = <array_count> newvalue = 0
	<array_count> = (<array_count> + 1)
	repeat <num_songs>
	setarrayelement arrayname = g_best_streaks globalarray index = <player> newvalue = 0
	setarrayelement arrayname = g_high_scores globalarray index = <player> newvalue = 0
	<player> = (<player> + 1)
	repeat 2
endscript

script record_net_statistics 
	player = 0
	begin
	formattext checksumname = player_status 'player%p_status' p = (<player> + 1)
	player_score = ($<player_status>.score)
	casttointeger player_score
	formattext checksumname = scores_array 'g_p%p_scores' p = (<player> + 1)
	setarrayelement arrayname = <scores_array> globalarray index = ($net_song_num) newvalue = <player_score>
	if ($<player_status>.best_run > $g_best_streaks [<player>])
		setarrayelement arrayname = g_best_streaks globalarray index = <player> newvalue = ($<player_status>.best_run)
	endif
	if ($<player_status>.score > $g_high_scores [<player>])
		setarrayelement arrayname = g_high_scores globalarray index = <player> newvalue = <player_score>
	endif
	<player> = (<player> + 1)
	repeat 2
endscript
