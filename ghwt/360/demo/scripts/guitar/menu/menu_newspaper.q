np_5star_headlines = [
	qs(0x71426a73)
	qs(0xbf00e8ea)
	qs(0x3823372f)
	qs(0x9fdfe9bd)
]
num_5star_headlines = 4
np_4star_headlines = [
	qs(0xccfdb8e4)
	qs(0xf99a0d37)
	qs(0x04fda245)
]
num_4star_headlines = 3
np_3star_headlines = [
	qs(0xe0459f6b)
	qs(0xf2e83feb)
	qs(0xfd54146c)
]
num_3star_headlines = 3
g_np_option_props = [
	{
		pos = (680.0, 208.0)
		rot = 1
		offset = (-30.0, 5.0)
	}
	{
		pos = (680.0, 241.0)
		rot = 1
		offset = (-30.0, 5.0)
	}
	{
		pos = (680.0, 274.0)
		rot = 0.5
		offset = (-30.0, 5.0)
	}
	{
		pos = (680.0, 306.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
	{
		pos = (680.0, 162.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
	{
		pos = (680.0, 195.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
	{
		pos = (680.0, 228.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
	{
		pos = (680.0, 261.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
	{
		pos = (680.0, 294.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
]
g_np_menu_icon_offset = (225.0, -22.0)
g_np_options_index = 0
g_ss_mag_number = 0
g_grey = [
	128
	128
	128
	255
]
g_ss_offwhite = [
	230
	230
	230
	255
]
g_ss_black = [
	0
	0
	0
	255
]
g_ss_orangeish = [
	200
	135
	55
	255
]
g_ss_ap_reddish = [
	200
	60
	55
	255
]
g_ss_ap_blueish = [
	55
	80
	135
	255
]
g_ss_ap_yellowish = [
	230
	220
	25
	255
]
g_ss_decibel_magentaish = [
	180
	40
	160
	255
]
g_ss_decibel_yellowish = [
	230
	220
	25
	255
]
g_ss_decibel_greenish = [
	180
	185
	85
	255
]
g_ss_gp_blueish = [
	40
	110
	130
	255
]
g_ss_gp_greyish = [
	90
	90
	90
	255
]
g_ss_kerrang_reddish = [
	170
	50
	55
	255
]
g_ss_paste_beigeish = [
	195
	190
	155
	255
]
g_ss_paste_brownish = [
	140
	100
	40
	255
]
g_ss_paste_maroonish = [
	80
	20
	10
	255
]
g_ss_hell_lighter_reddish = [
	220
	200
	190
	255
]
g_ss_hell_darker_reddish = [
	130
	45
	35
	255
]
g_ss_p1_orangeish = [
	210
	165
	110
	255
]
g_ss_p2_violetish = [
	180
	155
	205
	255
]
g_ss_2p_song_title_whiteish = [
	220
	220
	220
	255
]
use_last_player_scores = 0
old_song = none

script create_newspaper_menu \{for_practice = 0}
	menu_song_complete_sound
	stopsoundsbybuss \{binkcutscenes}
	resetscoreupdateready
	if isxenon
		writesongdatatofile
	endif
	disable_pause
	change \{blade_active = 0}
	my_song = ($current_song)
	if NOT ($old_song = none)
		my_song = ($old_song)
		change \{old_song = none}
	endif
	set_focus_color \{rgba = $g_ss_offwhite}
	set_unfocus_color \{rgba = $g_ss_black}
	show_replay = 1
	replay_flow_params = {action = try_again}
	if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
		menu_top_rockers_check_for_new_top_score \{nowrite = 1}
		if NOT (<new_score> = -1)
			show_replay = 0
		endif
		if (<newbestscore> = 1)
			replay_flow_params = {action = save_and_try_again}
		endif
	endif
	if ($game_mode = training)
		if viewportexists \{id = bg_viewport}
			disable_bg_viewport
		endif
		if screenelementexists \{id = practice_sectiontext}
			setscreenelementprops \{id = practice_sectiontext
				alpha = 0}
		endif
		change \{g_np_options_index = 4}
		destroy_band_hud
		getmaxplayers
		player = 1
		begin
		formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
		formattext textname = player_text 'p%i' i = <player> addtostringlookup
		destroy_hud player_text = <player_text> player = <player>
		repeat <max_players>
	endif
	np_event_handlers = [
		{pad_up np_scroll_up params = {for_practice = <for_practice> show_replay = <show_replay>}}
		{pad_down np_scroll_down params = {for_practice = <for_practice> show_replay = <show_replay>}}
		{pad_option2 generic_event_choose params = {state = uistate_leaderboard}}
	]
	if ($player1_status.bot_play = 1)
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_career ||
				$game_mode = p2_faceoff ||
				$game_mode = p2_pro_faceoff ||
				$game_mode = p2_battle ||
				$game_mode = p2_quickplay)
			removeparameter \{exclusive_device}
			get_all_exclusive_devices
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	new_menu scrollid = newspaper_scroll vmenuid = current_menu use_backdrop = 0 event_handlers = <np_event_handlers> exclusive_device = <exclusive_device>
	if ($game_mode = p2_coop)
		stars = (($player1_status.stars + $player2_status.stars) / 2)
	else
		stars = ($player1_status.stars)
	endif
	p1_score = ($player1_status.score)
	p2_score = ($player2_status.score)
	p1_health = ($player1_status.current_health)
	p2_health = ($player2_status.current_health)
	p1_gp_score = ($player1_status.guitar_performance_score)
	p2_gp_score = ($player2_status.guitar_performance_score)
	win_sqs = '0'
	p1_note_streak = ($player1_status.best_run)
	p2_note_streak = ($player2_status.best_run)
	p1_percent_complete = 0
	if ($player1_status.total_notes > 0)
		<p1_percent_complete> = (100 * $player1_status.notes_hit / $player1_status.total_notes)
	endif
	p2_percent_complete = 0
	if ($player2_status.total_notes > 0)
		<p2_percent_complete> = (100 * $player2_status.notes_hit / $player2_status.total_notes)
	endif
	if ($game_mode = p2_career || $game_mode = p2_coop || $game_mode = p2_quickplay)
		<p1_score> = (<p1_score> + <p2_score>)
		if (<p1_note_streak> < <p2_note_streak>)
			<p1_note_streak> = <p2_note_streak>
		endif
		if (<p1_percent_complete> < <p2_percent_complete>)
			<p1_percent_complete> = <p2_percent_complete>
		endif
	endif
	casttointeger \{p1_score}
	casttointeger \{p2_score}
	createscreenelement \{type = containerelement
		parent = root_window
		id = newspaper_container
		pos = (0.0, 0.0)}
	formattext textname = p1_note_streak_text qs(0x76b3fda7) d = <p1_note_streak>
	formattext textname = p2_note_streak_text qs(0x76b3fda7) d = <p2_note_streak>
	formattext textname = p1_score_text qs(0x73307931) s = <p1_score>
	formattext textname = p2_score_text qs(0x73307931) s = <p2_score>
	formattext textname = p1_gp_score_text qs(0x8f00b7bf) s = <p1_gp_score>
	formattext textname = p2_gp_score_text qs(0x64370cbc) s = <p2_gp_score>
	get_progression_globals ($current_progression_flag) game_mode = ($game_mode) use_current_tab = 1
	getglobaltags \{progression
		params = current_tier}
	show_stars = 1
	if gotparam \{current_tier}
		if progression_isbosssong tier_global = <tier_global> tier = <current_tier> song = <my_song>
			show_stars = 0
		endif
	endif
	get_song_title song = <my_song>
	get_difficulty_text difficulty = ($player1_status.difficulty)
	if (<stars> < 3)
		<stars> = 3
	endif
	offwhite = [223 223 223 255]
	reddish = [170 70 70 255]
	switch <current_tier>
		case 1
		change \{g_ss_mag_number = 0}
		case 2
		change \{g_ss_mag_number = 1}
		case 3
		change \{g_ss_mag_number = 2}
		case 4
		change \{g_ss_mag_number = 3}
		case 5
		change \{g_ss_mag_number = 4}
		case 6
		change \{g_ss_mag_number = 5}
		case 7
		change \{g_ss_mag_number = 6}
		case 8
		change \{g_ss_mag_number = 7}
		default
		change \{g_ss_mag_number = 0}
	endswitch
	if NOT ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p2_coop || $game_mode = p1_quickplay || $game_mode = p2_quickplay || $game_mode = p3_quickplay || $game_mode = p4_quickplay || <for_practice> = 1)
		if NOT ($g_ss_mag_number = 7)
			create_menu_backdrop \{texture = 2p_song_summary_bg}
		else
			create_menu_backdrop \{texture = 2p_song_summary_bg_hell}
		endif
		switch $g_ss_mag_number
			case 0
			<ss_logo> = song_summary_logo_backyard
			<ss_logo_sm> = song_summary_logo_backyard_sm
			<ss_sidebar> = song_summary_sidebar_backyard
			<ss_percent_color> = $g_ss_black
			<ss_score_color> = $g_ss_black
			<ss_notestreak_fill_color> = $g_ss_black
			<ss_notestreak_color> = $g_ss_offwhite
			<ss_notestreak_text_color> = $g_ss_offwhite
			case 1
			<ss_logo> = song_summary_logo_bar
			<ss_logo_sm> = song_summary_logo_bar_sm
			<ss_sidebar> = song_summary_sidebar_bar
			<ss_percent_color> = $g_ss_black
			<ss_score_color> = $g_ss_black
			<ss_notestreak_fill_color> = $g_ss_black
			<ss_notestreak_color> = $g_ss_offwhite
			<ss_notestreak_text_color> = $g_ss_offwhite
			case 2
			<ss_logo> = song_summary_logo_paste
			<ss_logo_sm> = song_summary_logo_paste_sm
			<ss_sidebar> = song_summary_sidebar_paste
			<ss_percent_color> = $g_ss_paste_maroonish
			<ss_score_color> = $g_ss_paste_brownish
			<ss_notestreak_fill_color> = $g_ss_paste_beigeish
			<ss_notestreak_color> = $g_ss_paste_maroonish
			<ss_notestreak_text_color> = $g_ss_paste_brownish
			case 3
			<ss_logo> = song_summary_logo_decibel
			<ss_logo_sm> = song_summary_logo_decibel_sm
			<ss_sidebar> = song_summary_sidebar_decibel
			<ss_percent_color> = $g_ss_decibel_magentaish
			<ss_score_color> = $g_ss_black
			<ss_notestreak_fill_color> = $g_ss_decibel_greenish
			<ss_notestreak_color> = $g_ss_decibel_magentaish
			<ss_notestreak_text_color> = $g_ss_black
			case 4
			<ss_logo> = song_summary_logo_ap
			<ss_logo_sm> = song_summary_logo_ap_sm
			<ss_sidebar> = song_summary_sidebar_ap
			<ss_percent_color> = $g_ss_ap_reddish
			<ss_score_color> = $g_ss_ap_blueish
			<ss_notestreak_fill_color> = $g_ss_ap_reddish
			<ss_notestreak_color> = $g_ss_ap_yellowish
			<ss_notestreak_text_color> = $g_ss_ap_yellowish
			case 5
			<ss_logo> = song_summary_logo_kerrang
			<ss_logo_sm> = song_summary_logo_kerrang_sm
			<ss_sidebar> = song_summary_sidebar_kerrang
			<ss_percent_color> = $g_ss_black
			<ss_score_color> = $g_ss_kerrang_reddish
			<ss_notestreak_fill_color> = $g_ss_black
			<ss_notestreak_color> = $g_ss_offwhite
			<ss_notestreak_text_color> = $g_ss_offwhite
			case 6
			<ss_logo> = song_summary_logo_gplayer
			<ss_logo_sm> = song_summary_logo_gplayer_sm
			<ss_sidebar> = song_summary_sidebar_gplayer
			<ss_percent_color> = $g_ss_gp_greyish
			<ss_score_color> = $g_ss_gp_blueish
			<ss_notestreak_fill_color> = $g_ss_gp_greyish
			<ss_notestreak_color> = $g_ss_offwhite
			<ss_notestreak_text_color> = $g_ss_offwhite
			case 7
			<ss_logo> = song_summary_logo_hell
			<ss_logo_sm> = song_summary_logo_hell_sm
			<ss_sidebar> = song_summary_sidebar_hell
			<ss_percent_color> = $g_ss_black
			<ss_score_color> = [100 15 5 255]
			<ss_notestreak_fill_color> = $g_ss_black
			<ss_notestreak_color> = [150 65 55 255]
			<ss_notestreak_text_color> = $g_ss_hell_lighter_reddish
		endswitch
		if ($game_mode = p2_battle)
			if (<p2_health> > <p1_health>)
				<winner> = qs(0x09c32524)
				<win_sqs> = '2'
				<winner_color> = $g_ss_p2_violetish
			else
				<winner> = qs(0x22ee76e7)
				<win_sqs> = '1'
				<winner_color> = $g_ss_p1_orangeish
			endif
		else
			if (<p2_score> > <p1_score>)
				<winner> = qs(0x09c32524)
				<win_sqs> = '2'
				<winner_color> = $g_ss_p2_violetish
			elseif (<p1_score> > <p2_score>)
				<winner> = qs(0x22ee76e7)
				<win_sqs> = '1'
				<winner_color> = $g_ss_p1_orangeish
			else
				<winner> = qs(0x3bf547a6)
				<win_sqs> = '0'
			endif
		endif
		if (<win_sqs> = '0')
			rand_status = Random (@ 1 @ 2 )
			formattext checksumname = player_status 'player%i_status' i = <rand_status>
		else
			formattext checksumname = player_status 'player%i_status' i = <win_sqs>
		endif
		if ($game_mode = p2_battle)
			displaytext {
				parent = newspaper_container
				text = qs(0x3cec6d9f)
				just = [left top]
				pos = (256.0, 264.0)
				scale = 0.75
				font = fontgrid_text_a11
				rgba = <winner_color>
				rot = -7.5
				noshadow
			}
			formattext textname = winner_text qs(0x72f23aff) d = <winner>
			if ($is_network_game)
				if (<winner> = qs(0x5356b971))
					winner_text = $opponent_gamertag
				else
					if (netsessionfunc obj = match func = get_gamertag)
						winner_text = <name>
					endif
				endif
			endif
			formattext textname = who_won_text qs(0x29407cfe) s = <winner_text>
			displaytext {
				parent = newspaper_container
				text = <who_won_text>
				just = [left top]
				pos = (262.0, 302.0)
				scale = 0.75
				font = fontgrid_text_a11
				rgba = <winner_color>
				rot = -7.5
				noshadow
			}
			<final_blow_powerup> = ($<player_status>.final_blow_powerup)
			if (<final_blow_powerup> > -1)
				createscreenelement \{type = textblockelement
					parent = newspaper_container
					just = [
						left
						top
					]
					pos = (320.0, 415.0)
					rot_angle = -7.5
					scale = 0.45000002
					text = qs(0x1be693f8)
					font = fontgrid_title_a1
					rgba = [
						223
						223
						223
						255
					]
					dims = (300.0, 300.0)}
				select = <final_blow_powerup>
				getglobaltags \{user_options}
				if (<winner> = qs(0x787beab2))
					is_lefty_flip = <lefty_flip_p2>
				else
					is_lefty_flip = <lefty_flip_p1>
				endif
				if (<select> = 4 && <is_lefty_flip> = 1)
					getuppercasestring ($battlemode_powerups [<select>].alt_name_text)
				else
					getuppercasestring ($battlemode_powerups [<select>].name_text)
				endif
				final_blow_attack_text = <uppercasestring>
				final_blow_attack_icon = ($battlemode_powerups [<select>].card_texture)
				createscreenelement {
					type = textblockelement
					parent = newspaper_container
					just = [left top]
					internal_just = [left top]
					pos = (345.0, 486.0)
					rot_angle = -7.5
					scale = 0.4
					text = <final_blow_attack_text>
					font = fontgrid_title_a1
					rgba = [223 223 223 255]
					dims = (600.0, 200.0)
				}
				formattext \{checksumname = card_checksum
					'battlecard_final_blow'}
				createscreenelement {
					type = spriteelement
					id = <card_checksum>
					parent = newspaper_container
					texture = <final_blow_attack_icon>
					rgba = [255 255 255 255]
					just = [left top]
					rot_angle = -7.5
					pos = (286.0, 472.0)
					dims = (42.0, 42.0)
				}
			endif
		else
			winner_text = <winner>
			formattext textname = winner_text qs(0x72f23aff) d = <winner>
			if ($is_network_game)
				if (<winner> = qs(0x5356b971))
					winner_text = $opponent_gamertag
				else
					if (netsessionfunc obj = match func = get_gamertag)
						winner_text = <name>
					endif
				endif
			endif
			if (<winner> = qs(0x3bf547a6))
				who_won_text = qs(0x10ba6add)
			else
				if (<win_sqs> = '1')
					<percent> = ((<p2_score> * 1.0) / <p1_score>)
				else
					<percent> = ((<p1_score> * 1.0) / <p2_score>)
				endif
				if (<percent> <= 0.25)
					formattext textname = who_won_text qs(0xa1726d11) d = <winner_text>
				elseif ((<percent> > 0.25) && (<percent> < 0.75))
					formattext textname = who_won_text qs(0x277d87de) d = <winner_text>
				else
					formattext textname = who_won_text qs(0xdb890271) d = <winner_text>
				endif
			endif
			createscreenelement {
				type = textblockelement
				parent = newspaper_container
				just = [left bottom]
				internal_just = [left bottom]
				pos = (270.0, 345.0)
				scale = 0.7
				text = <who_won_text>
				font = fontgrid_text_a11
				rgba = <winner_color>
				dims = (350.0, 200.0)
				line_spacing = 0.85
				rot_angle = -7.5
			}
		endif
		displaysprite {
			parent = newspaper_container
			tex = <ss_logo>
			pos = (158.0, 25.0)
		}
		displaysprite {
			parent = newspaper_container
			tex = <ss_sidebar>
			pos = (858.0, 130.0)
		}
		getuppercasestring <song_title>
		createscreenelement {
			id = ss_song_title_text_block_id
			type = textblockelement
			parent = newspaper_container
			just = [left top]
			internal_just = [left top]
			pos = (270.0, 352.0)
			scale = (0.55, 0.55)
			text = <uppercasestring>
			font = fontgrid_text_a11
			rgba = $g_ss_2p_song_title_whiteish
			dims = (400.0, 134.0)
			line_spacing = 0.85
			rot_angle = -7.5
			noshadow
		}
		get_song_artist song = <my_song>
		getuppercasestring <song_artist>
		<band_name> = <uppercasestring>
		getscreenelementchildren \{id = ss_song_title_text_block_id}
		getarraysize (<children>)
		if (<array_size> = 1)
			<artist_pos> = (276.0, 386.0)
		else
			<artist_pos> = (280.0, 416.0)
		endif
		if ($g_ss_mag_number = 0 || $g_ss_mag_number = 1)
			<band_name_color> = $g_ss_offwhite
		else
			<band_name_color> = $g_ss_p1_orangeish
		endif
		createscreenelement {
			id = ss_artist_text_block_id
			type = textblockelement
			parent = newspaper_container
			just = [left top]
			internal_just = [left top]
			pos = <artist_pos>
			scale = (0.45000002, 0.45000002)
			text = <band_name>
			font = fontgrid_text_a8
			rgba = <band_name_color>
			dims = (400.0, 134.0)
			line_spacing = 0.85
			rot_angle = -7.5
		}
		get_difficulty_text_upper difficulty = ($player1_status.difficulty)
		name_text_1 = qs(0x18c281f6)
		if ($is_network_game)
			if (netsessionfunc obj = match func = get_gamertag)
				name_text_1 = <name>
			endif
		endif
		formattext textname = p1_difficulty_text qs(0xf49e223b) d = <difficulty_text> n = <name_text_1>
		displaytext {
			parent = newspaper_container
			text = <p1_difficulty_text>
			pos = (298.0, 522.0)
			scale = (0.5, 0.55)
			font = fontgrid_text_a11
			rgba = $g_ss_p1_orangeish
			rot = -7.5
			noshadow
		}
		setscreenelementprops id = <id> font_spacing = 2 space_spacing = 2
		get_difficulty_text_upper difficulty = ($player2_status.difficulty)
		name_text_2 = qs(0x33efd235)
		if ($is_network_game)
			name_text_2 = $opponent_gamertag
		endif
		formattext textname = p2_difficulty_text qs(0xf49e223b) d = <difficulty_text> n = <name_text_2>
		displaytext {
			parent = newspaper_container
			text = <p2_difficulty_text>
			pos = (302.0, 552.0)
			scale = (0.5, 0.55)
			font = fontgrid_text_a11
			rgba = $g_ss_p2_violetish
			rot = -7.5
			noshadow
		}
		setscreenelementprops id = <id> font_spacing = 2 space_spacing = 2
		displaysprite {
			parent = newspaper_container
			tex = <ss_logo_sm>
			pos = (946.0, 86.0)
		}
		<p1_stats_pos> = (668.0, 260.0)
		<p2_stats_pos> = (864.0, 260.0)
		displaysprite {
			id = np_circle_1
			parent = newspaper_container
			tex = 2p_song_summary_circle
			pos = (<p1_stats_pos> + (61.0, 61.0))
			rgba = $g_ss_p1_orangeish
			rot_angle = 180
			z = 8
		}
		displaysprite {
			id = np_circle_2
			parent = newspaper_container
			tex = 2p_song_summary_circle
			pos = <p2_stats_pos>
			rgba = $g_ss_p2_violetish
			z = 8
		}
		displaytext {
			parent = newspaper_container
			text = qs(0x22ee76e7)
			pos = (<p1_stats_pos> + (23.0, 3.0))
			scale = (0.9, 0.6)
			font = fontgrid_text_a11
			rgba = $g_ss_2p_song_title_whiteish
			z = 9
		}
		displaytext {
			parent = newspaper_container
			text = qs(0x09c32524)
			pos = (<p2_stats_pos> + (21.0, 3.0))
			scale = (0.9, 0.6)
			font = fontgrid_text_a11
			rgba = $g_ss_2p_song_title_whiteish
			z = 9
		}
		if (<winner> = qs(0x22ee76e7))
			<l_wing_pos> = (<p1_stats_pos> + (-44.0, 0.0))
			<r_wing_pos> = (<p1_stats_pos> + (39.0, 0.0))
		else
			<l_wing_pos> = (<p2_stats_pos> + (-44.0, 0.0))
			<r_wing_pos> = (<p2_stats_pos> + (44.0, 0.0))
		endif
		if NOT (<winner> = qs(0x3bf547a6))
			displaysprite {
				id = np_left_wing
				parent = newspaper_container
				tex = 2p_song_summary_wing
				pos = <l_wing_pos>
				z = 7
			}
			displaysprite {
				id = np_right_wing
				parent = newspaper_container
				tex = 2p_song_summary_wing_flipped
				pos = <r_wing_pos>
				z = 7
			}
			if (<winner> = qs(0x22ee76e7))
				displaysprite {
					parent = newspaper_container
					tex = 2p_song_summary_guitar_winner
					pos = (<p1_stats_pos> + (46.0, 0.0))
					z = 6
				}
				displaysprite {
					parent = newspaper_container
					tex = 2p_song_summary_guitar_loser
					pos = (<p2_stats_pos> + (-44.0, 0.0))
					flip_v
					z = 6
				}
			else
				displaysprite {
					parent = newspaper_container
					tex = 2p_song_summary_guitar_winner
					pos = (<p2_stats_pos> + (-110.0, 0.0))
					flip_v
					z = 6
				}
				displaysprite {
					parent = newspaper_container
					tex = 2p_song_summary_guitar_loser
					pos = (<p1_stats_pos> + (44.0, 0.0))
					z = 6
				}
			endif
		endif
		displaysprite {
			id = ss_p1_note_streak_fill
			parent = newspaper_container
			tex = song_summary_notestreak_fill
			pos = (<p1_stats_pos> + (-8.0, 44.0))
			rgba = <ss_notestreak_fill_color>
		}
		displaysprite {
			id = ss_p2_note_streak_fill
			parent = newspaper_container
			tex = song_summary_notestreak_fill
			pos = (<p2_stats_pos> + (61.0, 174.0))
			rgba = <ss_notestreak_fill_color>
			rot_angle = 182
		}
		if (<p1_note_streak> > 999)
			<ss_p1_notestreak_pos> = (<p1_stats_pos> + (13.0, 43.0))
			<ss_notestreak_scale> = (1.12, 1.5)
		elseif (<p1_note_streak> > 99)
			<ss_p1_notestreak_pos> = (<p1_stats_pos> + (12.0, 43.0))
			<ss_notestreak_scale> = 1.5
		elseif (<p1_note_streak> < 10)
			<ss_p1_notestreak_pos> = (<p1_stats_pos> + (39.0, 43.0))
			<ss_notestreak_scale> = 1.5
		else
			<ss_p1_notestreak_pos> = (<p1_stats_pos> + (25.0, 43.0))
			<ss_notestreak_scale> = 1.5
		endif
		displaytext {
			id = ss_p1_note_streak
			parent = newspaper_container
			text = <p1_note_streak_text>
			pos = <ss_p1_notestreak_pos>
			scale = <ss_notestreak_scale>
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_notestreak_color>
			noshadow
		}
		displaytext {
			id = ss_p1_note_streak_text
			parent = newspaper_container
			text = qs(0xde3b3448)
			just = [center center]
			pos = (<p1_stats_pos> + (52.0, 130.0))
			scale = (0.55, 0.7)
			font = fontgrid_text_a11
			z = 4
			rgba = <ss_notestreak_text_color>
			noshadow
		}
		getscreenelementdims id = <id>
		fit_text_in_rectangle id = ss_p1_note_streak_text dims = ((90.0, 0.0) + (0.0, 1.0) * <height>) pos = (<p1_stats_pos> + (52.0, 130.0)) start_x_scale = 0.55 start_y_scale = 0.7 only_if_larger_x = 1
		if (<p2_note_streak> > 999)
			<ss_p2_notestreak_pos> = (<p2_stats_pos> + (-40.0, 43.0))
			<ss_notestreak_scale> = (1.12, 1.5)
		elseif (<p2_note_streak> > 99)
			<ss_p2_notestreak_pos> = (<p2_stats_pos> + (-40.0, 43.0))
			<ss_notestreak_scale> = 1.5
		elseif (<p2_note_streak> < 10)
			<ss_p2_notestreak_pos> = (<p2_stats_pos> + (-10.0, 43.0))
			<ss_notestreak_scale> = 1.5
		else
			<ss_p2_notestreak_pos> = (<p2_stats_pos> + (-26.0, 43.0))
			<ss_notestreak_scale> = 1.5
		endif
		displaytext {
			id = ss_p2_note_streak
			parent = newspaper_container
			text = <p2_note_streak_text>
			pos = <ss_p2_notestreak_pos>
			scale = <ss_notestreak_scale>
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_notestreak_color>
			noshadow
		}
		displaytext {
			id = ss_p2_note_streak_text
			parent = newspaper_container
			text = qs(0xde3b3448)
			just = [center center]
			pos = (<p2_stats_pos> + (-2.0, 130.0))
			scale = (0.55, 0.7)
			font = fontgrid_text_a11
			z = 4
			rgba = <ss_notestreak_text_color>
			noshadow
		}
		getscreenelementdims id = <id>
		fit_text_in_rectangle id = ss_p2_note_streak_text dims = ((90.0, 0.0) + (0.0, 1.0) * <height>) pos = (<p2_stats_pos> + (-2.0, 130.0)) start_x_scale = 0.55 start_y_scale = 0.7 only_if_larger_x = 1
		if NOT ($g_ss_mag_number = 7)
			displaysprite {
				id = ss_p1_score_fill
				parent = newspaper_container
				tex = 2p_song_summary_score_bg
				pos = (<p1_stats_pos> + (-12.0, 160.0))
				rgba = <ss_score_color>
			}
			displaysprite {
				id = ss_p2_score_fill
				parent = newspaper_container
				tex = 2p_song_summary_score_bg
				pos = (<p2_stats_pos> + (54.0, 192.0))
				rgba = <ss_score_color>
				rot_angle = 181
			}
		else
			displaysprite {
				id = ss_p1_score_fill
				parent = newspaper_container
				tex = 2p_song_summary_score_bg
				pos = (<p1_stats_pos> + (-12.0, 160.0))
				rgba = $g_ss_hell_darker_reddish
			}
			displaysprite {
				id = ss_p2_score_fill
				parent = newspaper_container
				tex = 2p_song_summary_score_bg
				pos = (<p2_stats_pos> + (54.0, 192.0))
				rgba = $g_ss_hell_darker_reddish
				rot_angle = 181
			}
		endif
		displaytext {
			id = ss_p1_score_text
			parent = newspaper_container
			text = qs(0x302c47e0)
			pos = (<p1_stats_pos> + (10.0, 155.0))
			scale = (0.7, 0.5)
			font = fontgrid_text_a11
			z = 4
			rgba = $g_ss_2p_song_title_whiteish
			noshadow
			rot = -2
		}
		displaytext {
			id = ss_p2_score_text
			parent = newspaper_container
			text = qs(0x302c47e0)
			pos = (<p2_stats_pos> + (-50.0, 155.0))
			scale = (0.7, 0.5)
			font = fontgrid_text_a11
			z = 4
			rgba = $g_ss_2p_song_title_whiteish
			noshadow
			rot = -2
		}
		displaytext {
			id = ss_p1_score
			parent = newspaper_container
			text = <p1_score_text>
			just = [center center]
			pos = (<p1_stats_pos> + (48.0, 200.0))
			scale = (0.8, 1.0)
			font = fontgrid_text_a8
			rgba = <ss_score_color>
			z = 3
			noshadow
		}
		displaytext {
			id = ss_p2_score
			parent = newspaper_container
			text = <p2_score_text>
			just = [center center]
			pos = (<p2_stats_pos> + (-12.0, 200.0))
			scale = (0.8, 1.0)
			font = fontgrid_text_a8
			rgba = <ss_score_color>
			z = 3
			noshadow
		}
		formattext textname = p1_notes_hit qs(0x76b3fda7) d = <p1_percent_complete>
		if (<p1_percent_complete> = 100)
			<ss_percent_pos> = (<p1_stats_pos> + (2.0, 204.0))
			<ss_percent_scale> = (0.7, 1.47)
		elseif (<p1_percent_complete> < 10)
			<ss_percent_pos> = (<p1_stats_pos> + (10.0, 206.0))
			<ss_percent_scale> = (1.6, 1.47)
		else
			<ss_percent_pos> = (<p1_stats_pos> + (6.0, 207.0))
			<ss_percent_scale> = (0.9, 1.47)
		endif
		displaytext {
			id = ss_p1_notes_hit
			parent = newspaper_container
			text = <p1_notes_hit>
			pos = <ss_percent_pos>
			scale = <ss_percent_scale>
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		formattext textname = p2_notes_hit qs(0x76b3fda7) d = <p2_percent_complete>
		if (<p2_percent_complete> = 100)
			<ss_percent_pos> = (<p2_stats_pos> + (-70.0, 204.0))
			<ss_percent_scale> = (0.7, 1.47)
		elseif (<p2_percent_complete> < 10)
			<ss_percent_pos> = (<p2_stats_pos> + (-62.0, 206.0))
			<ss_percent_scale> = (1.6, 1.47)
		else
			<ss_percent_pos> = (<p2_stats_pos> + (-66.0, 207.0))
			<ss_percent_scale> = (0.9, 1.47)
		endif
		displaytext {
			id = ss_p2_notes_hit
			parent = newspaper_container
			text = <p2_notes_hit>
			pos = <ss_percent_pos>
			scale = <ss_percent_scale>
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		displaytext {
			id = ss_p1_percent_sign
			parent = newspaper_container
			text = qs(0x0c40a1b2)
			pos = (<p1_stats_pos> + (60.0, 226.0))
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_percent_color>
			rot = 50
			scale = (0.7, 0.5)
			noshadow
		}
		displaytext {
			id = ss_p1_notes_text
			parent = newspaper_container
			text = qs(0xdc574f01)
			pos = (<p1_stats_pos> + (66.0, 232.0))
			scale = (0.4, 0.7)
			font = fontgrid_text_a3
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		setscreenelementprops id = <id> font_spacing = 4
		fit_text_in_rectangle id = ss_p1_notes_text dims = (38.0, 30.0) pos = (<p1_stats_pos> + (66.0, 232.0)) start_x_scale = 0.4 start_y_scale = 0.7 only_if_larger_x = 1
		displaytext {
			id = ss_p1_hit_text
			parent = newspaper_container
			text = qs(0xf336345a)
			pos = (<p1_stats_pos> + (67.0, 257.0))
			scale = (0.4, 0.6)
			font = fontgrid_text_a3
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		setscreenelementprops id = <id> font_spacing = 6
		fit_text_in_rectangle id = ss_p1_hit_text dims = (38.0, 30.0) pos = (<p1_stats_pos> + (67.0, 257.0)) start_x_scale = 0.4 start_y_scale = 0.6 only_if_larger_x = 1
		displaytext {
			id = ss_p2_percent_sign
			parent = newspaper_container
			text = qs(0x0c40a1b2)
			pos = (<p2_stats_pos> + (-12.0, 226.0))
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_percent_color>
			rot = 50
			scale = (0.7, 0.5)
			noshadow
		}
		displaytext {
			id = ss_p2_notes_text
			parent = newspaper_container
			text = qs(0xdc574f01)
			pos = (<p2_stats_pos> + (-6.0, 232.0))
			scale = (0.4, 0.7)
			font = fontgrid_text_a3
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		setscreenelementprops id = <id> font_spacing = 4
		fit_text_in_rectangle id = ss_p2_notes_text dims = (45.0, 30.0) pos = (<p2_stats_pos> + (-6.0, 232.0)) start_x_scale = 0.4 start_y_scale = 0.7 only_if_larger_x = 1
		displaytext {
			id = ss_p2_hit_text
			parent = newspaper_container
			text = qs(0xf336345a)
			pos = (<p2_stats_pos> + (-5.0, 257.0))
			scale = (0.4, 0.6)
			font = fontgrid_text_a3
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		setscreenelementprops id = <id> font_spacing = 6
		fit_text_in_rectangle id = ss_p2_hit_text dims = (45.0, 30.0) pos = (<p2_stats_pos> + (-5.0, 257.0)) start_x_scale = 0.4 start_y_scale = 0.6 only_if_larger_x = 1
		if (<winner> = qs(0x22ee76e7))
			displaysprite {
				id = np_icon_thumb
				parent = newspaper_container
				tex = 2p_song_summary_icon_winner
				pos = (<p1_stats_pos> + (46.0, 330.0))
				rgba = $g_ss_p1_orangeish
				just = [center center]
				dims = (64.0, 64.0)
			}
			displaysprite {
				id = np_icon_skull
				parent = newspaper_container
				tex = 2p_song_summary_icon_loser
				pos = (<p2_stats_pos> + (-55.0, 294.0))
				rgba = $g_ss_p2_violetish
				dims = (64.0, 64.0)
			}
		elseif (<winner> = qs(0x09c32524))
			displaysprite {
				id = np_icon_thumb
				parent = newspaper_container
				tex = 2p_song_summary_icon_winner
				pos = (<p2_stats_pos> + (-16.0, 320.0))
				rgba = $g_ss_p2_violetish
				just = [center center]
				dims = (64.0, 64.0)
				flip_v
			}
			displaysprite {
				id = np_icon_skull
				parent = newspaper_container
				tex = 2p_song_summary_icon_loser
				pos = (<p1_stats_pos> + (22.0, 294.0))
				rgba = $g_ss_p1_orangeish
				dims = (64.0, 64.0)
				flip_v
			}
		endif
		if NOT (<winner> = qs(0x3bf547a6))
			<i> = 1
			begin
			formattext checksumname = hilite_id 'ss_hilite%d_p%p' d = <i> p = <win_sqs>
			if (<i> = 3)
				<i> = 2
			endif
			formattext checksumname = hilite_tex 'Char_Select_Hilite%d' d = <i>
			<hilite_rgba> = [200 90 40 255]
			<hilite_pos> = (<p1_stats_pos> + (46.0, 330.0))
			if (<win_sqs> = '2')
				<hilite_rgba> = [180 130 220 255]
				<hilite_pos> = (<p2_stats_pos> + (-16.0, 320.0))
			endif
			displaysprite {
				id = <hilite_id>
				parent = newspaper_container
				pos = <hilite_pos>
				tex = <hilite_tex>
				dims = (220.0, 220.0)
				just = 0
				z = 1
			}
			if (<i> = 1)
				<id> :se_setprops rgba = <hilite_rgba> alpha = 0.25 dims = (180.0, 180.0)
			endif
			<i> = (<i> + 1)
			repeat 3
		endif
		outfit = ($<player_status>.outfit)
		style = ($<player_status>.style)
		displaysprite \{parent = newspaper_container
			tex = magazine1_viewport
			dims = (640.0, 640.0)
			pos = (175.0, -10.0)
			z = -1}
		if NOT (<winner> = qs(0x3bf547a6))
			spawnscriptnow \{np_2p_flap_wings}
			spawnscriptnow \{np_2p_thumb_zoom}
			spawnscriptnow np_2p_fade_to_grey params = {winner = <winner>}
		endif
		if (<winner> = qs(0x22ee76e7))
			spawnscriptnow \{np_2p_hilites_p1}
		elseif (<winner> = qs(0x09c32524))
			spawnscriptnow \{np_2p_hilites_p2}
		endif
	else
		if NOT ($g_ss_mag_number = 7)
			create_menu_backdrop \{texture = song_summary_bg}
		else
			create_menu_backdrop \{texture = song_summary_bg_hell}
		endif
		switch $g_ss_mag_number
			case 0
			<ss_logo> = song_summary_logo_backyard
			<ss_sidebar> = song_summary_sidebar_backyard
			<ss_percent_fill> = song_summary_percent_fill_backyard
			<ss_percent_color> = $g_ss_black
			<ss_star_good_color> = $g_ss_offwhite
			<ss_star_bad_color> = [100 100 100 255]
			<ss_score_fill_l_color> = $g_ss_black
			<ss_score_color> = $g_ss_offwhite
			<ss_score_fill_r_color> = $g_ss_offwhite
			<ss_score_text_color> = $g_ss_black
			<ss_notestreak_fill_color> = $g_ss_offwhite
			<ss_notestreak_color> = $g_ss_black
			<ss_notestreak_text_color> = $g_ss_black
			case 1
			<ss_logo> = song_summary_logo_bar
			<ss_sidebar> = song_summary_sidebar_bar
			<ss_percent_fill> = song_summary_percent_fill_bar
			<ss_percent_color> = $g_ss_black
			<ss_star_good_color> = $g_ss_offwhite
			<ss_star_bad_color> = [100 100 100 255]
			<ss_score_fill_l_color> = $g_ss_black
			<ss_score_color> = $g_ss_offwhite
			<ss_score_fill_r_color> = $g_ss_gp_greyish
			<ss_score_text_color> = $g_ss_offwhite
			<ss_notestreak_fill_color> = $g_ss_gp_greyish
			<ss_notestreak_color> = $g_ss_offwhite
			<ss_notestreak_text_color> = $g_ss_offwhite
			case 2
			<ss_logo> = song_summary_logo_paste
			<ss_sidebar> = song_summary_sidebar_paste
			<ss_percent_fill> = song_summary_percent_fill_paste
			<ss_percent_color> = $g_ss_paste_beigeish
			<ss_star_good_color> = $g_ss_paste_brownish
			<ss_star_bad_color> = $g_ss_offwhite
			<ss_score_fill_l_color> = $g_ss_paste_beigeish
			<ss_score_color> = $g_ss_paste_maroonish
			<ss_score_fill_r_color> = $g_ss_paste_brownish
			<ss_score_text_color> = $g_ss_paste_beigeish
			<ss_notestreak_fill_color> = $g_ss_paste_beigeish
			<ss_notestreak_color> = $g_ss_paste_maroonish
			<ss_notestreak_text_color> = $g_ss_paste_brownish
			case 3
			<ss_logo> = song_summary_logo_decibel
			<ss_sidebar> = song_summary_sidebar_decibel
			<ss_percent_fill> = song_summary_percent_fill_decibel
			<ss_percent_color> = $g_ss_decibel_magentaish
			<ss_star_good_color> = $g_ss_orangeish
			<ss_star_bad_color> = $g_ss_offwhite
			<ss_score_fill_l_color> = $g_ss_black
			<ss_score_color> = $g_ss_decibel_yellowish
			<ss_score_fill_r_color> = $g_ss_decibel_greenish
			<ss_score_text_color> = $g_ss_decibel_magentaish
			<ss_notestreak_fill_color> = $g_ss_decibel_greenish
			<ss_notestreak_color> = $g_ss_decibel_magentaish
			<ss_notestreak_text_color> = $g_ss_black
			case 4
			<ss_logo> = song_summary_logo_ap
			<ss_sidebar> = song_summary_sidebar_ap
			<ss_percent_fill> = song_summary_percent_fill_ap
			<ss_percent_color> = $g_ss_ap_yellowish
			<ss_star_good_color> = $g_ss_ap_reddish
			<ss_star_bad_color> = $g_ss_offwhite
			<ss_score_fill_l_color> = $g_ss_ap_blueish
			<ss_score_color> = $g_ss_ap_yellowish
			<ss_score_fill_r_color> = $g_ss_ap_reddish
			<ss_score_text_color> = $g_ss_ap_yellowish
			<ss_notestreak_fill_color> = $g_ss_ap_reddish
			<ss_notestreak_color> = $g_ss_ap_yellowish
			<ss_notestreak_text_color> = $g_ss_ap_yellowish
			case 5
			<ss_logo> = song_summary_logo_kerrang
			<ss_sidebar> = song_summary_sidebar_kerrang
			<ss_percent_fill> = song_summary_percent_fill_kerrang
			<ss_percent_color> = $g_ss_offwhite
			<ss_star_good_color> = $g_ss_orangeish
			<ss_star_bad_color> = $g_ss_offwhite
			<ss_score_fill_l_color> = $g_ss_black
			<ss_score_color> = $g_ss_offwhite
			<ss_score_fill_r_color> = $g_ss_offwhite
			<ss_score_text_color> = $g_ss_black
			<ss_notestreak_fill_color> = $g_ss_black
			<ss_notestreak_color> = $g_ss_offwhite
			<ss_notestreak_text_color> = $g_ss_offwhite
			case 6
			<ss_logo> = song_summary_logo_gplayer
			<ss_sidebar> = song_summary_sidebar_gplayer
			<ss_percent_fill> = song_summary_percent_fill_gplayer
			<ss_percent_color> = $g_ss_gp_blueish
			<ss_star_good_color> = $g_ss_orangeish
			<ss_star_bad_color> = $g_ss_offwhite
			<ss_score_fill_l_color> = $g_ss_gp_blueish
			<ss_score_color> = $g_ss_offwhite
			<ss_score_fill_r_color> = $g_ss_gp_greyish
			<ss_score_text_color> = $g_ss_offwhite
			<ss_notestreak_fill_color> = $g_ss_offwhite
			<ss_notestreak_color> = $g_ss_gp_blueish
			<ss_notestreak_text_color> = $g_ss_gp_greyish
			case 7
			<ss_logo> = song_summary_logo_hell
			<ss_sidebar> = song_summary_sidebar_hell
			<ss_percent_fill> = song_summary_percent_fill_hell
			<ss_percent_color> = $g_ss_hell_darker_reddish
			<ss_star_good_color> = $g_ss_orangeish
			<ss_star_bad_color> = $g_ss_offwhite
			<ss_score_fill_l_color> = $g_ss_black
			<ss_score_color> = $g_ss_hell_lighter_reddish
			<ss_score_fill_r_color> = $g_ss_hell_darker_reddish
			<ss_score_text_color> = $g_ss_black
			<ss_notestreak_fill_color> = $g_ss_hell_darker_reddish
			<ss_notestreak_color> = $g_ss_black
			<ss_notestreak_text_color> = $g_ss_black
		endswitch
		displaysprite {
			parent = newspaper_container
			tex = <ss_logo>
			pos = (158.0, 25.0)
		}
		displaysprite {
			parent = newspaper_container
			tex = <ss_sidebar>
			pos = (858.0, 130.0)
		}
		get_song_artist song = <my_song>
		getuppercasestring <song_artist>
		<band_name> = <uppercasestring>
		song_internal_scale = 1.0
		stringlength string = <song_title>
		if (<str_len> >= 19)
			<song_internal_scale> = 0.75
		endif
		mypos = (262.0, 345.0)
		createscreenelement {
			id = ss_song_title_text_block_id
			type = textblockelement
			parent = newspaper_container
			just = [left bottom]
			internal_just = [left bottom]
			pos = <mypos>
			scale = 0.75
			text = <song_title>
			font = fontgrid_text_a11
			rgba = $g_ss_offwhite
			dims = (300.0, 200.0)
			line_spacing = 0.85
			rot_angle = -7.5
			internal_scale = <song_internal_scale>
		}
		<artist_pos> = (<mypos> + (0.0, 5.0))
		if ($g_ss_mag_number = 0 || $g_ss_mag_number = 1)
			<band_name_color> = $g_ss_offwhite
		else
			<band_name_color> = $g_ss_orangeish
		endif
		createscreenelement {
			id = ss_artist_text_block_id
			type = textblockelement
			parent = newspaper_container
			just = [left top]
			internal_just = [left top]
			pos = <artist_pos>
			scale = (0.5, 0.55)
			text = <band_name>
			font = fontgrid_text_a8
			rgba = <band_name_color>
			dims = (400.0, 134.0)
			line_spacing = 0.85
			rot_angle = -7.5
		}
		displaysprite {
			parent = newspaper_container
			tex = <ss_percent_fill>
			pos = (267.0, 460.0)
			dims = (336.0, 168.0)
		}
		formattext textname = p1_notes_hit qs(0x76b3fda7) d = <p1_percent_complete>
		if (<p1_percent_complete> = 100)
			<ss_percent_pos> = (290.0, 503.0)
			<ss_percent_scale> = (1.3, 1.6)
		elseif (<p1_percent_complete> < 10)
			<ss_percent_pos> = (332.0, 496.0)
			<ss_percent_scale> = 1.6
		else
			<ss_percent_pos> = (302.0, 501.0)
			<ss_percent_scale> = 1.6
		endif
		displaytext {
			parent = newspaper_container
			text = <p1_notes_hit>
			pos = <ss_percent_pos>
			scale = <ss_percent_scale>
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_percent_color>
			rot = -10
			noshadow
		}
		displaytext {
			parent = newspaper_container
			text = qs(0x0c40a1b2)
			pos = (364.0, 500.0)
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_percent_color>
			rot = -10
			noshadow
		}
		if NOT ($g_ss_mag_number = 7)
			<np_notes_hit_color> = $g_ss_black
		else
			<np_notes_hit_color> = $g_ss_hell_lighter_reddish
		endif
		displaytext {
			parent = newspaper_container
			text = qs(0x01d1caa9)
			pos = (403.0, 522.0)
			scale = (0.44, 0.7)
			font = fontgrid_text_a3
			z = 4
			rgba = <np_notes_hit_color>
			rot = -10
			noshadow
		}
		setscreenelementprops id = <id> font_spacing = 6 space_spacing = 1
		getscreenelementdims id = <id>
		if (<width> > 79)
			setscreenelementprops id = <id> scale = 1
			fit_text_in_rectangle id = <id> dims = (66.0, 35.0) pos = (403.0, 522.0)
		endif
		displaysprite {
			parent = newspaper_container
			tex = song_summary_score_fill_l
			pos = (674.0, 90.0)
			rgba = <ss_score_fill_l_color>
			dims = (268.0, 67.0)
		}
		if (<for_practice> = 0)
			if (<show_stars> = 1)
				<star_pos> = (686.0, 120.0)
				<star_add> = (23.0, 0.0)
				<i> = 0
				begin
				<star_offset> = (0.0, 0.0)
				if (<i> = 1)
					<star_rot> = 20
					<star_offset> = (4.0, -3.0)
				elseif (<i> = 3)
					<star_rot> = -20
					<star_offset> = (-2.0, 3.0)
				else
					<star_rot> = 0
				endif
				if ((<stars> - <i>) < 1)
					<star_color> = <ss_star_bad_color>
				else
					<star_color> = <ss_star_good_color>
				endif
				displaysprite {
					parent = newspaper_container
					pos = (<star_pos> + <star_offset>)
					scale = 0.65000004
					tex = song_summary_score_star
					z = 4
					rgba = <star_color>
					rot_angle = <star_rot>
				}
				<i> = (<i> + 1)
				<star_pos> = (<star_pos> + <star_add>)
				repeat 5
			endif
			displaytext {
				id = np_score_text
				parent = newspaper_container
				text = <p1_score_text>
				just = [right center]
				pos = (926.0, 116.0)
				scale = (0.9, 0.65000004)
				font = fontgrid_text_a8
				rgba = <ss_score_color>
				z = 3
				noshadow
			}
			<curr_dif> = ($player1_status.difficulty)
			if ($game_mode = p2_career || $game_mode = p2_quickplay)
				<index1> = ($difficulty_list_props.($player1_status.difficulty).index)
				<index2> = ($difficulty_list_props.($player2_status.difficulty).index)
				if (<index2> < <index1>)
					<curr_dif> = ($player2_status.difficulty)
				endif
			endif
			get_difficulty_text_upper difficulty = <curr_dif>
			displaytext {
				parent = newspaper_container
				just = [left bottom]
				text = <difficulty_text>
				pos = (946.0, 133.0)
				scale = (0.7, 0.6)
				font = fontgrid_text_a11
				z = 4
				rgba = <ss_score_text_color>
				noshadow
			}
			setscreenelementprops id = <id> font_spacing = 3
			fit_text_in_rectangle id = <id> dims = (100.0, 100.0) only_if_larger_x = 1 keep_ar = 1 start_x_scale = 0.7 start_y_scale = 0.6 debug_me
		else
			notes_hit = ($player1_status.notes_hit)
			notes_total = ($player1_status.total_notes)
			formattext textname = notes_hit_out_of_total qs(0x9a622f4e) a = <notes_hit> b = <notes_total>
			displaytext {
				id = np_score_text
				parent = newspaper_container
				text = <notes_hit_out_of_total>
				just = [right center]
				pos = (911.0, 117.0)
				scale = (0.9, 0.65000004)
				font = fontgrid_text_a8
				rgba = <ss_score_color>
				z = 3
				noshadow
				rot = -2
			}
			getscreenelementdims id = <id>
			setscreenelementprops id = <id> scale = (0.9, 0.65000004)
			fit_text_in_rectangle id = <id> dims = ((200.0, 0.0) + <height> * (0.0, 0.65000004))
			displaytext {
				parent = newspaper_container
				text = qs(0xc6f89ca2)
				pos = (946.0, 98.0)
				scale = (0.7, 0.6)
				font = fontgrid_text_a11
				z = 4
				rgba = <ss_score_text_color>
				noshadow
			}
			getscreenelementdims id = <id>
			setscreenelementprops id = <id> scale = (0.7, 0.6)
			fit_text_in_rectangle id = <id> dims = ((70.0, 0.0) + <height> * (0.0, 0.6))
		endif
		displaysprite {
			parent = newspaper_container
			tex = song_summary_score_fill_r
			pos = (934.0, 83.0)
			rgba = <ss_score_fill_r_color>
			dims = (134.0, 67.0)
		}
		displaysprite {
			parent = newspaper_container
			tex = song_summary_notestreak_fill
			pos = (719.0, 359.0)
			rgba = <ss_notestreak_fill_color>
		}
		if (<p1_note_streak> > 999)
			<ss_notestreak_pos> = (740.0, 358.0)
			<ss_notestreak_scale> = (1.12, 1.5)
		elseif (<p1_note_streak> > 99)
			<ss_notestreak_pos> = (739.0, 358.0)
			<ss_notestreak_scale> = 1.5
		elseif (<p1_note_streak> < 10)
			<ss_notestreak_pos> = (766.0, 358.0)
			<ss_notestreak_scale> = 1.5
		else
			<ss_notestreak_pos> = (752.0, 358.0)
			<ss_notestreak_scale> = 1.5
		endif
		displaytext {
			parent = newspaper_container
			text = <p1_note_streak_text>
			pos = <ss_notestreak_pos>
			scale = <ss_notestreak_scale>
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_notestreak_color>
			noshadow
		}
		displaytext {
			parent = newspaper_container
			text = qs(0xde3b3448)
			pos = (732.0, 425.0)
			scale = (0.44, 0.55)
			font = fontgrid_text_a11
			z = 4
			rgba = <ss_notestreak_text_color>
			noshadow
		}
		setscreenelementprops id = <id> font_spacing = 5 space_spacing = 3 scale = 1
		fit_text_in_rectangle id = <id> dims = (80.0, 35.0) pos = (732.0, 425.0)
		outfit = ($player1_status.outfit)
		style = ($player1_status.style)
		displaysprite \{parent = newspaper_container
			tex = magazine1_viewport
			dims = (640.0, 640.0)
			pos = (175.0, -10.0)
			z = -1}
	endif
	if ($is_network_game)
		np_net_create_options_menu pos = (770.0, 460.0) rot = <rot> scale = 1 for_practice = <for_practice> show_replay = <show_replay> replay_flow_params = <replay_flow_params>
	elseif ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p1_quickplay || $game_mode = p2_quickplay)
		np_create_options_menu pos = (770.0, 460.0) rot = <rot> scale = 1 for_practice = <for_practice> show_replay = <show_replay> replay_flow_params = <replay_flow_params>
	else
		np_create_options_menu pos = (770.0, 360.0) rot = <rot> scale = 1 for_practice = <for_practice> show_replay = <show_replay> replay_flow_params = <replay_flow_params>
	endif
	get_song_struct song = <my_song>
	if ((structurecontains structure = <song_struct> boss) || $game_mode = p2_battle)
		set_current_battle_first_play
	endif
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	if ($is_network_game = 1)
		add_user_control_helper \{text = qs(0x182f0173)
			button = green
			z = 100}
	else
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100}
	endif
	if (($is_network_game) && (isxenon))
		add_user_control_helper \{text = qs(0x9a7d1fe5)
			button = start
			z = 100}
	endif
	if ($is_network_game = 1)
		get_number_of_songs
		if NOT ((($net_song_num) != (<num_songs> - 1)) || ($game_mode = p2_coop))
			clean_up_user_control_helpers
		endif
	endif
	add_user_control_helper \{text = qs(0x87251a1f)
		button = yellow
		z = 100}
	if NOT ($is_network_game)
	endif
endscript

script destroy_newspaper_menu 
	clean_up_user_control_helpers
	killspawnedscript \{name = np_2p_flap_wings}
	killspawnedscript \{name = np_2p_thumb_zoom}
	killspawnedscript \{name = np_2p_fade_to_grey}
	killspawnedscript \{name = np_2p_hilites_p1}
	killspawnedscript \{name = np_2p_hilites_p2}
	destroy_menu \{menu_id = newspaper_scroll}
	destroy_menu \{menu_id = newspaper_container}
	destroy_menu_backdrop
	net_destroy_newspaper_menu
	change \{g_np_options_index = 0}
endscript

script np_scroll_text_horizontal \{time = 5
		band_name = qs(0x03ac90f0)
		song_name = qs(0x03ac90f0)
		band_rgba = [
			0
			0
			0
			255
		]
		song_rgba = [
			0
			0
			0
			255
		]}
	start_pos = <pos>
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = np_scroll_text_container
		pos = (0.0, 0.0)
	}
	num = 0
	formattext checksumname = nid '%d' d = <num>
	displaytext id = <nid> parent = np_scroll_text_container pos = <pos> scale = 1 font = <font> text = <band_name> rgba = <band_rgba>
	getscreenelementdims id = <nid>
	band_width = <width>
	<num> = (<num> + 1)
	formattext checksumname = nid '%d' d = <num>
	<pos> = (<pos> + (1.0, 0.0) * <band_width>)
	displaytext id = <nid> parent = np_scroll_text_container pos = <pos> scale = 1 font = <font> text = <song_name> rgba = <song_rgba>
	getscreenelementdims id = <nid>
	song_width = <width>
	end_pos = (<start_pos> - ((<band_width> + <song_width>) * (1.0, 0.0)))
	multi = (<blockwidth> / (<band_width> + <song_width>))
	if NOT (<multi>)
		<multi> = 1
	endif
	onband = 1
	if (<multi>)
		begin
		if (<onband>)
			<pos> = (<pos> + ((1.0, 0.0) * <song_width>))
			<num> = (<num> + 1)
			formattext checksumname = nid '%d' d = <num>
			displaytext id = <nid> parent = np_scroll_text_container pos = <pos> scale = 1 font = <font> text = <band_name> rgba = <band_rgba>
			<onband> = 0
		else
			<pos> = (<pos> + ((1.0, 0.0) * <band_width>))
			<num> = (<num> + 1)
			formattext checksumname = nid '%d' d = <num>
			displaytext id = <nid> parent = np_scroll_text_container pos = <pos> scale = 1 font = <font> text = <song_name> rgba = <song_rgba>
			<onband> = 1
		endif
		repeat (<multi> * 2)
	endif
	begin
	legacydoscreenelementmorph id = np_scroll_text_container pos = <end_pos> time = <time>
	wait <time> seconds
	setscreenelementprops id = np_scroll_text_container pos = <start_pos>
	repeat
endscript

script np_create_text \{pos = (200.0, 200.0)
		rot = 0
		text = qs(0x5e45925d)
		parent = newspaper_container
		scale = 1
		rgba = [
			0
			0
			0
			255
		]
		just = [
			center
			top
		]
		internal_just = [
			left
			left
		]}
	if gotparam \{dims}
		createscreenelement {
			type = textblockelement
			parent = <parent>
			just = <just>
			internal_just = <internal_just>
			pos = <pos>
			rot_angle = <rot>
			scale = <scale>
			text = <text>
			font = fontgrid_title_a1
			rgba = <rgba>
			z_priority = 3
			dims = <dims>
		}
	else
		createscreenelement {
			type = textelement
			parent = <parent>
			just = <just>
			internal_just = <internal_just>
			pos = <pos>
			rot_angle = <rot>
			scale = <scale>
			text = <text>
			font = fontgrid_title_a1
			rgba = <rgba>
			z_priority = 3
		}
	endif
endscript

script np_create_options_menu \{pos = (600.0, 300.0)
		rot = 0
		scale = 0.8
		menu_font = fontgrid_text_a11
		for_practice = 0}
	setscreenelementprops id = newspaper_scroll pos = <pos>
	set_focus_color \{rgba = $g_ss_offwhite}
	set_unfocus_color \{rgba = $g_ss_black}
	if (<for_practice> = 1)
		<menu_offset> = (0.0, -6.0)
	elseif NOT ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p2_coop || $game_mode = p1_quickplay || $game_mode = p2_quickplay)
		<menu_offset> = (0.0, -65.0)
	else
		<menu_offset> = (0.0, 0.0)
	endif
	if (<for_practice> = 1)
		displaytext id = np_option_0 parent = newspaper_container text = qs(0x182f0173) pos = (($g_np_option_props [4].pos) + <menu_offset>) scale = (0.85, 0.7) rot = ($g_np_option_props [4].rot) font = <menu_font> noshadow
		displaytext id = np_option_1 parent = newspaper_container text = qs(0xb8790f2f) pos = (($g_np_option_props [5].pos) + <menu_offset>) scale = (0.8, 0.7) rot = ($g_np_option_props [5].rot) font = <menu_font> noshadow
		displaytext id = np_option_2 parent = newspaper_container text = qs(0xcc2da18b) pos = (($g_np_option_props [6].pos) + <menu_offset>) scale = (0.8, 0.7) rot = ($g_np_option_props [6].rot) font = <menu_font> noshadow
		displaytext id = np_option_3 parent = newspaper_container text = qs(0x68bd3039) pos = (($g_np_option_props [7].pos) + <menu_offset>) scale = (0.8, 0.7) rot = ($g_np_option_props [7].rot) font = <menu_font> noshadow
		displaytext id = np_option_4 parent = newspaper_container text = qs(0x67d9c56d) pos = (($g_np_option_props [8].pos) + <menu_offset>) scale = (0.8, 0.7) rot = ($g_np_option_props [8].rot) font = <menu_font> noshadow
		retail_menu_unfocus \{id = np_option_4}
		<initial_hl_pos> = (($g_np_option_props [4].pos) + ($g_np_option_props [4].offset) + <menu_offset>)
	else
		displaytext id = np_option_0 parent = newspaper_container text = qs(0x182f0173) pos = (($g_np_option_props [0].pos) + <menu_offset>) scale = (0.85, 0.7) rot = ($g_np_option_props [0].rot) font = <menu_font> noshadow
		setscreenelementprops id = <id> font_spacing = 2 space_spacing = 4
		if NOT ($end_credits = 1)
			if (<show_replay> = 1)
				displaytext id = np_option_1 parent = newspaper_container text = qs(0x647b5a84) pos = (($g_np_option_props [1].pos) + <menu_offset>) scale = (0.8, 0.7) rot = ($g_np_option_props [1].rot) font = <menu_font> noshadow
				setscreenelementprops id = <id> font_spacing = 2 space_spacing = 4
				displaytext id = np_option_2 parent = newspaper_container text = qs(0x3f11367e) pos = (($g_np_option_props [2].pos) + <menu_offset>) scale = (0.8, 0.7) rot = ($g_np_option_props [2].rot) font = <menu_font> noshadow
				setscreenelementprops id = <id> font_spacing = 2 space_spacing = 4
			else
				displaytext id = np_option_1 parent = newspaper_container text = qs(0x3f11367e) pos = (($g_np_option_props [1].pos) + <menu_offset>) scale = (0.8, 0.7) rot = ($g_np_option_props [2].rot) font = <menu_font> noshadow
				setscreenelementprops id = <id> font_spacing = 2 space_spacing = 4
			endif
		endif
		<initial_hl_pos> = (($g_np_option_props [0].pos) + ($g_np_option_props [0].offset) + <menu_offset>)
	endif
	if ($guitar_motion_enable_test = 1)
		destroyscreenelement \{id = guitar_motion_performance_menu}
		createscreenelement \{id = guitar_motion_performance_menu
			parent = newspaper_container
			type = vmenu
			pos = (700.0, 300.0)
			just = [
				top
				left
			]
			internal_just = [
				top
				left
			]
			z_priority = 100}
		destroyscreenelement \{id = guitar_motion_performance_menu_bg}
		createscreenelement \{id = guitar_motion_performance_menu_bg
			parent = newspaper_container
			type = spriteelement
			dims = (400.0, 250.0)
			pos = (700.0, 300.0)
			texture = white
			rgba = [
				0
				0
				0
				160
			]
			just = [
				top
				left
			]
			z_priority = 99}
		createscreenelement \{parent = guitar_motion_performance_menu
			type = textelement
			dims = (100.0, 10.0)
			text = qs(0xf8a08c25)
			font = fontgrid_text_a8
			just = [
				top
				left
			]
			scale = (0.8, 0.65000004)
			rgba = [
				240
				240
				0
				255
			]
			allow_expansion}
		foreachin \{$guitar_motions_test_performed
			do = guitar_motion_show_performance_tally
			pass_index}
	endif
	retail_menu_focus \{id = np_option_0}
	retail_menu_unfocus \{id = np_option_1}
	retail_menu_unfocus \{id = np_option_2}
	retail_menu_unfocus \{id = np_option_3}
	switch $g_ss_mag_number
		case 0
		<ss_hilite_color> = $g_ss_black
		<ss_menu_icon> = song_summary_menu_icon_backyard
		case 1
		<ss_hilite_color> = [109 76 44 255]
		<ss_menu_icon> = song_summary_menu_icon_bar
		case 2
		<ss_hilite_color> = $g_ss_paste_brownish
		<ss_menu_icon> = song_summary_menu_icon_paste
		case 3
		<ss_hilite_color> = $g_ss_decibel_magentaish
		<ss_menu_icon> = song_summary_menu_icon_decibel
		case 4
		<ss_hilite_color> = $g_ss_ap_blueish
		<ss_menu_icon> = song_summary_menu_icon_ap
		case 5
		<ss_hilite_color> = $g_ss_kerrang_reddish
		<ss_menu_icon> = song_summary_menu_icon_kerrang
		case 6
		<ss_hilite_color> = $g_ss_gp_blueish
		<ss_menu_icon> = song_summary_menu_icon_gplayer
		case 7
		<ss_hilite_color> = $g_ss_hell_darker_reddish
		<ss_menu_icon> = song_summary_menu_icon_hell
	endswitch
	displaysprite {
		id = ss_menu_hilite_id
		parent = newspaper_container
		tex = song_summary_menu_hilite
		pos = <initial_hl_pos>
		rgba = <ss_hilite_color>
		rot_angle = (($g_np_option_props [$g_np_options_index].rot) + 0.5)
		dims = (320.0, 40.0)
		z = 1
	}
	displaysprite {
		id = ss_menu_icon_id
		parent = newspaper_container
		tex = <ss_menu_icon>
		pos = (<initial_hl_pos> + ($g_np_menu_icon_offset))
		rot_angle = ($g_np_option_props [$g_np_options_index].rot)
		dims = (80.0, 80.0)
		z = 3
	}
	if (<for_practice> = 1)
		continue_handlers = [
			{focus retail_menu_focus}
			{focus setscreenelementprops params = {id = np_option_0 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
			{unfocus retail_menu_unfocus}
			{unfocus setscreenelementprops params = {id = np_option_0 no_shadow}}
			{pad_choose generic_event_back params = {state = uistate_setlist no_jamsession}}
		]
		createscreenelement {
			type = textelement
			parent = current_menu
			font = <menu_font>
			event_handlers = <continue_handlers>
		}
		createscreenelement {
			type = textelement
			parent = current_menu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus setscreenelementprops params = {id = np_option_1 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus setscreenelementprops params = {id = np_option_1 no_shadow}}
				{pad_choose practice_restart_song}
			]
		}
		createscreenelement {
			type = textelement
			parent = current_menu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus setscreenelementprops params = {id = np_option_2 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus setscreenelementprops params = {id = np_option_2 no_shadow}}
				{pad_choose generic_event_back params = {state = uistate_practice_select_speed}}
			]
		}
		createscreenelement {
			type = textelement
			parent = current_menu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus setscreenelementprops params = {id = np_option_3 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus setscreenelementprops params = {id = np_option_3 no_shadow}}
				{pad_choose generic_event_back params = {state = uistate_select_song_section}}
			]
		}
		createscreenelement {
			type = textelement
			parent = current_menu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus setscreenelementprops params = {id = np_option_4 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus setscreenelementprops params = {id = np_option_4 no_shadow}}
				{pad_choose generic_event_back params = {state = uistate_mainmenu}}
			]
		}
	else
		createscreenelement {
			type = textelement
			parent = current_menu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus setscreenelementprops params = {id = np_option_0 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus setscreenelementprops params = {id = np_option_0 no_shadow}}
				{pad_choose ui_win_song_continue}
			]
		}
		if NOT ($end_credits = 1)
			more_stats_option_id = np_option_1
			if (<show_replay> = 1)
				createscreenelement {
					type = textelement
					parent = current_menu
					font = <menu_font>
					event_handlers = [
						{focus retail_menu_focus}
						{focus setscreenelementprops params = {id = np_option_1 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
						{unfocus retail_menu_unfocus}
						{unfocus setscreenelementprops params = {id = np_option_1 no_shadow}}
						{pad_choose restart_warning_select_restart}
					]
				}
				more_stats_option_id = np_option_2
			endif
			createscreenelement {
				type = textelement
				parent = current_menu
				font = <menu_font>
				event_handlers = [
					{focus retail_menu_focus}
					{focus setscreenelementprops params = {id = <more_stats_option_id> shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
					{unfocus retail_menu_unfocus}
					{unfocus setscreenelementprops params = {id = <more_stats_option_id> no_shadow}}
					{pad_choose generic_event_choose params = {state = uistate_detailed_stats}}
				]
			}
		endif
	endif
endscript

script np_scroll_down \{for_practice = 0}
	if ($end_credits = 1)
		return
	endif
	if ($is_network_game)
		return
	endif
	generic_menu_up_or_down_sound \{down}
	if (<for_practice> = 1)
		<menu_offset> = (0.0, -6.0)
	elseif NOT ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p2_coop || $game_mode = p1_quickplay || $game_mode = p2_quickplay)
		<menu_offset> = (0.0, -65.0)
	else
		<menu_offset> = (0.0, 0.0)
	endif
	if (<for_practice> = 1)
		formattext checksumname = option_id 'np_option_%d' d = ($g_np_options_index - 4)
	else
		formattext \{checksumname = option_id
			'np_option_%d'
			d = $g_np_options_index}
	endif
	retail_menu_unfocus id = <option_id>
	change g_np_options_index = ($g_np_options_index + 1)
	printf qs(0xd958d091) d = ($g_np_options_index)
	if (<for_practice> = 1)
		if ($g_np_options_index > 8)
			change \{g_np_options_index = 4}
		endif
		formattext checksumname = option_id 'np_option_%d' d = ($g_np_options_index - 4)
	else
		if (<show_replay> = 1)
			if ($g_np_options_index > 2)
				change \{g_np_options_index = 0}
			endif
		else
			if ($g_np_options_index > 1)
				change \{g_np_options_index = 0}
			endif
		endif
		formattext \{checksumname = option_id
			'np_option_%d'
			d = $g_np_options_index}
	endif
	retail_menu_focus id = <option_id>
	legacydoscreenelementmorph {
		id = ss_menu_hilite_id
		pos = (($g_np_option_props [$g_np_options_index].pos) + ($g_np_option_props [$g_np_options_index].offset) + <menu_offset>)
		rot_angle = (($g_np_option_props [$g_np_options_index].rot) + 0.5)
		time = 0.05
	}
	legacydoscreenelementmorph {
		id = ss_menu_icon_id
		pos = (($g_np_option_props [$g_np_options_index].pos) + ($g_np_option_props [$g_np_options_index].offset) + ($g_np_menu_icon_offset) + <menu_offset>)
		rot_angle = ($g_np_option_props [$g_np_options_index].rot)
		time = 0.05
	}
endscript

script np_scroll_up \{for_practice = 0}
	if ($end_credits = 1)
		return
	endif
	if ($is_network_game)
		return
	endif
	generic_menu_up_or_down_sound \{up}
	if (<for_practice> = 1)
		<menu_offset> = (0.0, -6.0)
	elseif NOT ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p2_coop || $game_mode = p1_quickplay || $game_mode = p2_quickplay)
		<menu_offset> = (0.0, -65.0)
	else
		<menu_offset> = (0.0, 0.0)
	endif
	if (<for_practice> = 1)
		formattext checksumname = option_id 'np_option_%d' d = ($g_np_options_index - 4)
	else
		formattext \{checksumname = option_id
			'np_option_%d'
			d = $g_np_options_index}
	endif
	retail_menu_unfocus id = <option_id>
	change g_np_options_index = ($g_np_options_index -1)
	if (<for_practice> = 1)
		if ($g_np_options_index < 4)
			change \{g_np_options_index = 8}
		endif
		formattext checksumname = option_id 'np_option_%d' d = ($g_np_options_index - 4)
	else
		if (<show_replay> = 1)
			if ($g_np_options_index < 0)
				change \{g_np_options_index = 2}
			endif
		else
			if ($g_np_options_index < 0)
				change \{g_np_options_index = 1}
			endif
		endif
		formattext \{checksumname = option_id
			'np_option_%d'
			d = $g_np_options_index}
	endif
	retail_menu_focus id = <option_id>
	legacydoscreenelementmorph {
		id = ss_menu_hilite_id
		pos = (($g_np_option_props [$g_np_options_index].pos) + ($g_np_option_props [$g_np_options_index].offset) + <menu_offset>)
		rot_angle = (($g_np_option_props [$g_np_options_index].rot) + 0.5)
		time = 0.05
	}
	legacydoscreenelementmorph {
		id = ss_menu_icon_id
		pos = (($g_np_option_props [$g_np_options_index].pos) + ($g_np_option_props [$g_np_options_index].offset) + ($g_np_menu_icon_offset) + <menu_offset>)
		rot_angle = ($g_np_option_props [$g_np_options_index].rot)
		time = 0.05
	}
endscript

script scale_textblock \{reset_scale = 0}
	getscreenelementdims id = <id>
	block_width = (<width> * 1.0)
	block_height = (<height> * 1.0)
	getscreenelementchildren id = <id>
	if gotparam \{children}
		i = 0
		getarraysize <children>
		begin
		getscreenelementdims id = (<children> [<i>])
		width_scale = (<block_width> / <width>)
		height_scale = ((<block_height> / <array_size>) / <height>)
		if (<reset_scale> = 1)
			text_scale = (((1.0 / <width_scale>) * (1.0, 0.0)) + ((0.0, 1.0) * 1.0))
		else
			text_scale = (((1.0, 0.0) * <width_scale>) + ((0.0, 1.0) * 1.0))
		endif
		setscreenelementprops id = (<children> [<i>]) scale = <text_scale>
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return num_children = <array_size>
endscript

script np_2p_hilite_sections 
	black = [0 0 0 255]
	time = 1
	begin
	i = 0
	j = 2
	begin
	if (<i> = 2)
		<j> = 3
	else
		<j> = 2
	endif
	np_set_section_color p = 1 i = <i> j = <j> color = <black>
	np_set_section_color p = 2 i = <i> j = <j> color = <black>
	wait <time> seconds
	np_set_section_color p = 1 i = <i> j = <j> color = $g_grey
	np_set_section_color p = 2 i = <i> j = <j> color = $g_grey
	<i> = <new_i>
	repeat 3
	repeat
endscript

script np_set_section_color 
	begin
	formattext checksumname = section_id 'p%p_np_%d' p = <p> d = <i>
	setscreenelementprops id = <section_id> rgba = <color>
	<i> = (<i> + 1)
	repeat <j>
	return new_i = <i>
endscript

script np_2p_flap_wings 
	<flap_time> = 0.6
	getscreenelementprops \{id = np_left_wing}
	setscreenelementprops \{id = np_left_wing
		just = [
			0.9688
			0.68750006
		]}
	setscreenelementprops \{id = np_right_wing
		just = [
			-0.9688
			0.68750006
		]}
	begin
	legacydoscreenelementmorph id = np_left_wing rot_angle = 20 time = <flap_time> motion = ease_out
	legacydoscreenelementmorph id = np_right_wing rot_angle = -20 time = <flap_time> motion = ease_out
	wait <flap_time> seconds
	legacydoscreenelementmorph id = np_left_wing rot_angle = -20 time = <flap_time> motion = ease_in
	legacydoscreenelementmorph id = np_right_wing rot_angle = 20 time = <flap_time> motion = ease_in
	wait (<flap_time> * 2) seconds
	repeat
endscript

script np_2p_thumb_zoom 
	<zoom_time> = 0.4
	<bounce_time> = 0.5
	<thumb_orig_pos> = (240.0, -30.0)
	<thumb_orig_alpha> = 0.25
	<thumb_orig_scale> = 12
	getscreenelementprops \{id = np_icon_thumb}
	<thumb_final_pos> = <pos>
	<thumb_final_alpha> = 1.0
	<thumb_bounce_scale> = 1.5
	setscreenelementprops {
		id = np_icon_thumb
		pos = <thumb_orig_pos>
		alpha = <thumb_orig_alpha>
		scale = <thumb_orig_scale>
		relative_scale
		preserve_flip
	}
	legacydoscreenelementmorph {
		id = np_icon_thumb
		pos = <thumb_final_pos>
		alpha = <thumb_final_alpha>
		scale = 1
		relative_scale
		time = <zoom_time>
	}
	wait (<zoom_time> * 1.5) seconds
	begin
	legacydoscreenelementmorph {
		id = np_icon_thumb
		scale = <thumb_bounce_scale>
		relative_scale
		time = <bounce_time>
		motion = ease_in
	}
	wait <bounce_time> seconds
	legacydoscreenelementmorph {
		id = np_icon_thumb
		scale = 1
		relative_scale
		time = <bounce_time>
		motion = ease_out
	}
	wait <bounce_time> seconds
	repeat
endscript

script np_2p_fade_to_grey 
	wait \{1
		second}
	if (<winner> = qs(0x09c32524))
		<stroke_pos> = (798.0, 260.0)
	else
		<stroke_pos> = (934.0, 280.0)
	endif
	displaysprite {
		id = ss_stroke_1
		parent = newspaper_container
		tex = 2p_song_summary_brushstroke
		pos = <stroke_pos>
		rgba = $g_ss_ap_reddish
		z = 80
		rot_angle = 25
		scale = 0.125
		relative_scale
	}
	legacydoscreenelementmorph id = ss_stroke_1 scale = 10.0 relative_scale pos = (<stroke_pos> + (-8.0, -10.0)) time = 0.15 motion = ease_in
	wait \{0.2
		seconds}
	displaysprite {
		id = ss_stroke_2
		parent = newspaper_container
		tex = 2p_song_summary_brushstroke
		pos = (<stroke_pos> + (-110.0, -30.0))
		rgba = [255 0 0 255]
		z = 80
		rot_angle = -10
		flip_v
		flip_h
		scale = 0.125
		relative_scale
	}
	legacydoscreenelementmorph id = ss_stroke_2 scale = 12.0 relative_scale pos = (<stroke_pos> + (-120.0, -30.0)) time = 0.125 motion = ease_out
	wait \{0.125
		seconds}
	<drain_time> = 2
	if (<winner> = qs(0x09c32524))
		if NOT ($g_ss_mag_number = 7)
			legacydoscreenelementmorph id = ss_p1_note_streak_fill rgba = [128 128 128 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_note_streak rgba = [210 210 210 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_note_streak_text rgba = [220 220 220 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_score_fill rgba = [128 128 128 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_score_text rgba = [220 220 220 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_score rgba = [128 128 128 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_notes_hit rgba = [128 128 128 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_percent_sign rgba = [64 64 64 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_notes_text rgba = [64 64 64 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_hit_text rgba = [64 64 64 255] time = <drain_time>
			legacydoscreenelementmorph id = np_circle_1 rgba = [192 192 192 255] time = <drain_time>
		else
			legacydoscreenelementmorph id = ss_p1_note_streak_fill rgba = [128 118 118 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_note_streak rgba = [210 200 200 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_note_streak_text rgba = [220 210 210 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_score_fill rgba = [128 118 118 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_score_text rgba = [220 210 210 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_score rgba = [128 118 118 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_notes_hit rgba = [128 118 118 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_percent_sign rgba = [64 54 54 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_notes_text rgba = [64 54 54 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p1_hit_text rgba = [64 54 54 255] time = <drain_time>
			legacydoscreenelementmorph id = np_circle_1 rgba = [192 182 182 255] time = <drain_time>
		endif
	else
		if NOT ($g_ss_mag_number = 7)
			legacydoscreenelementmorph id = ss_p2_note_streak_fill rgba = [128 128 128 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_note_streak rgba = [210 210 210 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_note_streak_text rgba = [220 220 220 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_score_fill rgba = [128 128 128 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_score_text rgba = [220 220 220 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_score rgba = [128 128 128 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_notes_hit rgba = [128 128 128 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_percent_sign rgba = [64 64 64 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_notes_text rgba = [64 64 64 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_hit_text rgba = [64 64 64 255] time = <drain_time>
			legacydoscreenelementmorph id = np_circle_2 rgba = [192 192 192 255] time = <drain_time>
		else
			legacydoscreenelementmorph id = ss_p2_note_streak_fill rgba = [128 118 118 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_note_streak rgba = [210 200 200 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_note_streak_text rgba = [220 210 210 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_score_fill rgba = [128 118 118 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_score_text rgba = [220 210 210 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_score rgba = [128 118 118 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_notes_hit rgba = [128 118 118 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_percent_sign rgba = [64 54 54 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_notes_text rgba = [64 54 54 255] time = <drain_time>
			legacydoscreenelementmorph id = ss_p2_hit_text rgba = [64 54 54 255] time = <drain_time>
			legacydoscreenelementmorph id = np_circle_2 rgba = [192 182 182 255] time = <drain_time>
		endif
	endif
	legacydoscreenelementmorph id = np_icon_skull rgba = [192 192 192 255] time = <drain_time>
	wait (<drain_time> + 0.5) seconds
	legacydoscreenelementmorph \{id = ss_stroke_1
		alpha = 0
		time = 0.25}
	legacydoscreenelementmorph \{id = ss_stroke_2
		alpha = 0
		z = 1
		time = 0.25}
endscript

script np_2p_hilites_p1 \{time = 3.0}
	rot1 = 360
	rot2 = 180
	alpha1 = 1
	alpha2 = 1
	setscreenelementprops \{id = ss_hilite2_p1
		rot_angle = 0
		alpha = 0}
	setscreenelementprops \{id = ss_hilite3_p1
		rot_angle = 0
		alpha = 0}
	begin
	i = 1
	begin
	if screenelementexists \{id = ss_hilite2_p1}
		legacydoscreenelementmorph id = ss_hilite2_p1 rot_angle = <rot1> alpha = <alpha1> time = <time>
	endif
	if screenelementexists \{id = ss_hilite3_p1}
		legacydoscreenelementmorph id = ss_hilite3_p1 rot_angle = <rot2> alpha = <alpha2> time = <time>
	endif
	<i> = (<i> + 1)
	repeat 2
	<rot1> = (<rot1> + 360)
	<rot2> = (<rot2> + 180)
	if (<alpha1> = 1)
		<alpha1> = 0
	else
		<alpha1> = 1
	endif
	if (<alpha2> = 1)
		<alpha2> = 0
	else
		<alpha2> = 1
	endif
	wait <time> seconds
	repeat
endscript

script np_2p_hilites_p2 \{time = 3.0}
	rot1 = 360
	rot2 = 180
	alpha1 = 1
	alpha2 = 1
	setscreenelementprops \{id = ss_hilite2_p2
		rot_angle = 0
		alpha = 0}
	setscreenelementprops \{id = ss_hilite3_p2
		rot_angle = 0
		alpha = 0}
	begin
	i = 1
	begin
	if screenelementexists \{id = ss_hilite2_p2}
		legacydoscreenelementmorph id = ss_hilite2_p2 rot_angle = <rot1> alpha = <alpha1> time = <time>
	endif
	if screenelementexists \{id = ss_hilite3_p2}
		legacydoscreenelementmorph id = ss_hilite3_p2 rot_angle = <rot2> alpha = <alpha2> time = <time>
	endif
	<i> = (<i> + 1)
	repeat 2
	<rot1> = (<rot1> + 360)
	<rot2> = (<rot2> + 180)
	if (<alpha1> = 1)
		<alpha1> = 0
	else
		<alpha1> = 1
	endif
	if (<alpha2> = 1)
		<alpha2> = 0
	else
		<alpha2> = 1
	endif
	wait <time> seconds
	repeat
endscript
