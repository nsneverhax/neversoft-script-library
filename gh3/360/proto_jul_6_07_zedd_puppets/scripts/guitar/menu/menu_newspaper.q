np_5star_headlines = [
	"AUDIENCE KILLED BY SONIC ATTACK FROM %b"
	"%b BLOWS UP THE WORLD WITH THEIR AWESOMENESS"
	"10 OUT OF 10 ROCKERS LOVE %b"
	"LOCK  UP YOUR DAUGHTERS, %b IS IN TOWN"
]
num_5star_headlines = 4
np_4star_headlines = [
	"%b IMPRESSES AUDIENCE WITH GOOD SET"
	"SENIOR CITIZENS AGREE, %B IS TOO LOUD"
	"AUDIENCE ENJOYS GOOD SHOW FROM %b"
]
num_4star_headlines = 3
np_3star_headlines = [
	"%b DOESNT SUCK TOO HORRIBLY"
	"CROWD SLIGHTLY INTERESTED IN %b"
	"%b SOUNDS BETTER THAN FINGERNAILS ON A CHALKBOARD"
]
num_3star_headlines = 3
g_np_option_props = [
	{
		pos = (680.0, 168.0)
		rot = 1
		offset = (-30.0, 5.0)
	}
	{
		pos = (680.0, 201.0)
		rot = 1
		offset = (-30.0, 5.0)
	}
	{
		pos = (680.0, 234.0)
		rot = 0.5
		offset = (-30.0, 5.0)
	}
	{
		pos = (680.0, 266.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
	{
		pos = (680.0, 168.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
	{
		pos = (680.0, 201.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
	{
		pos = (680.0, 234.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
	{
		pos = (680.0, 267.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
	{
		pos = (680.0, 300.0)
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

script create_newspaper_menu for_practice = 0
	menu_song_complete_sound
	disable_pause
	if (<for_practice> = 1)
		disable_bg_viewport
		if screenelementexists id = practice_sectiontext
			setscreenelementprops id = practice_sectiontext alpha = 0
		endif
		change g_np_options_index = 4
	endif
	np_event_handlers = [
		{pad_up np_scroll_up params = {for_practice = <for_practice>}}
		{pad_down np_scroll_down params = {for_practice = <for_practice>}}
	]
	if ($player1_status.bot_play = 1)
		exclusive_device = ($primary_controller)
	else
		if ($game_mode = p2_career ||
				$game_mode = p2_faceoff ||
				$game_mode = p2_pro_faceoff ||
				$game_mode = p2_battle)
			exclusive_mp_controllers = [0 , 0]
			setarrayelement arrayname = exclusive_mp_controllers index = 0 newvalue = ($player1_device)
			setarrayelement arrayname = exclusive_mp_controllers index = 1 newvalue = ($player2_device)
			exclusive_device = <exclusive_mp_controllers>
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	new_menu scrollid = newspaper_scroll vmenuid = newspaper_vmenu use_backdrop = 0 event_handlers = <np_event_handlers> exclusive_device = <exclusive_device>
	if NOT ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p1_quickplay)
		create_menu_backdrop texture = newspaper_bg_2p
	else
		create_menu_backdrop texture = newspaper_bg
	endif
	stars = ($player1_status.stars)
	p1_score = ($player1_status.score)
	p2_score = ($player2_status.score)
	p1_health = ($player1_status.current_health)
	p2_health = ($player2_status.current_health)
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
	if ($game_mode = p2_career)
		<p1_score> = (<p1_score> + <p2_score>)
		if (<p1_note_streak> < <p2_note_streak>)
			<p1_note_streak> = <p2_note_streak>
		endif
		if (<p1_percent_complete> < <p2_percent_complete>)
			<p1_percent_complete> = <p2_percent_complete>
		endif
	endif
	casttointeger p1_score
	casttointeger p2_score
	set_focus_color rgba = [180 0 0 250]
	set_unfocus_color rgba = [0 0 0 250]
	createscreenelement {
		type = containerelement
		parent = root_window
		id = newspaper_container
		pos = (0.0, 0.0)
	}
	formattext textname = p1_note_streak_text "%d" d = <p1_note_streak>
	formattext textname = p2_note_streak_text "%d" d = <p2_note_streak>
	formattext textname = p1_score_text "%s" s = <p1_score>
	formattext textname = p2_score_text "%s" s = <p2_score>
	get_progression_globals game_mode = ($game_mode) use_current_tab = 1
	getglobaltags progression params = current_tier
	show_stars = 1
	if gotparam current_tier
		if progression_isbosssong tier_global = <tier_global> tier = <current_tier> song = ($current_song)
			show_stars = 0
		endif
	endif
	get_song_title song = ($current_song)
	get_difficulty_text difficulty = ($current_difficulty)
	if (<stars> < 3)
		<stars> = 3
	endif
	offwhite = [223 223 223 255]
	reddish = [170 70 70 255]
	switch <current_tier>
		case 1
		change g_ss_mag_number = 0
		case 2
		change g_ss_mag_number = 1
		case 3
		change g_ss_mag_number = 2
		case 4
		change g_ss_mag_number = 3
		case 5
		change g_ss_mag_number = 4
		case 6
		change g_ss_mag_number = 0
		case 7
		change g_ss_mag_number = 0
		case 8
		change g_ss_mag_number = 0
		default
		change g_ss_mag_number = 0
	endswitch
	if NOT ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p1_quickplay || <for_practice> = 1)
		switch $g_ss_mag_number
			case 0
			<ss_logo> = song_summary_logo_paste
			<ss_logo_sm> = song_summary_logo_paste_sm
			<ss_sidebar> = song_summary_sidebar_paste
			<ss_percent_color> = $g_ss_paste_maroonish
			<ss_score_color> = $g_ss_paste_brownish
			<ss_notestreak_fill_color> = $g_ss_paste_beigeish
			<ss_notestreak_color> = $g_ss_paste_maroonish
			<ss_notestreak_text_color> = $g_ss_paste_brownish
			case 1
			<ss_logo> = song_summary_logo_decibel
			<ss_logo_sm> = song_summary_logo_decibel_sm
			<ss_sidebar> = song_summary_sidebar_decibel
			<ss_percent_color> = $g_ss_decibel_magentaish
			<ss_score_color> = $g_ss_black
			<ss_notestreak_fill_color> = $g_ss_decibel_greenish
			<ss_notestreak_color> = $g_ss_decibel_magentaish
			<ss_notestreak_text_color> = $g_ss_black
			case 2
			<ss_logo> = song_summary_logo_ap
			<ss_logo_sm> = song_summary_logo_ap_sm
			<ss_sidebar> = song_summary_sidebar_ap
			<ss_percent_color> = $g_ss_ap_reddish
			<ss_score_color> = $g_ss_ap_blueish
			<ss_notestreak_fill_color> = $g_ss_ap_reddish
			<ss_notestreak_color> = $g_ss_ap_yellowish
			<ss_notestreak_text_color> = $g_ss_ap_yellowish
			case 3
			<ss_logo> = song_summary_logo_kerrang
			<ss_logo_sm> = song_summary_logo_kerrang_sm
			<ss_sidebar> = song_summary_sidebar_kerrang
			<ss_percent_color> = $g_ss_black
			<ss_score_color> = $g_ss_kerrang_reddish
			<ss_notestreak_fill_color> = $g_ss_black
			<ss_notestreak_color> = $g_ss_offwhite
			<ss_notestreak_text_color> = $g_ss_offwhite
			case 4
			<ss_logo> = song_summary_logo_gplayer
			<ss_logo_sm> = song_summary_logo_gplayer_sm
			<ss_sidebar> = song_summary_sidebar_gplayer
			<ss_percent_color> = $g_ss_gp_greyish
			<ss_score_color> = $g_ss_gp_blueish
			<ss_notestreak_fill_color> = $g_ss_gp_greyish
			<ss_notestreak_color> = $g_ss_offwhite
			<ss_notestreak_text_color> = $g_ss_offwhite
		endswitch
		if ($game_mode = p2_battle)
			if (<p2_health> > <p1_health>)
				<winner> = "2"
				<win_sqs> = '2'
				<winner_color> = $g_ss_p2_violetish
			else
				<winner> = "1"
				<win_sqs> = '1'
				<winner_color> = $g_ss_p1_orangeish
			endif
		else
			if (<p1_score> < <p2_score>)
				<winner> = "2"
				<win_sqs> = '2'
				<winner_color> = $g_ss_p2_violetish
			else
				<winner> = "1"
				<win_sqs> = '1'
				<winner_color> = $g_ss_p1_orangeish
			endif
		endif
		formattext checksumname = player_status 'player%i_status' i = <win_sqs>
		if ($game_mode = p2_battle)
			displaytext {
				parent = newspaper_container
				text = "EPIC BATTLE"
				just = [left top]
				pos = (256.0, 264.0)
				scale = 0.75
				font = text_a11
				rgba = <winner_color>
				rot = -7.5
				noshadow
			}
			formattext textname = who_won_text "Player %s  Dominates!" s = <winner>
			displaytext {
				parent = newspaper_container
				text = <who_won_text>
				just = [left top]
				pos = (262.0, 302.0)
				scale = 0.75
				font = text_a11
				rgba = <winner_color>
				rot = -7.5
				noshadow
			}
			<final_blow_powerup> = ($<player_status>.final_blow_powerup)
			if (<final_blow_powerup> > -1)
				createscreenelement {
					type = textblockelement
					parent = newspaper_container
					just = [left top]
					pos = (324.0, 380.0)
					rot_angle = -7.5
					scale = 0.55
					text = "FINAL BLOW:"
					font = fontgrid_title_gh3
					rgba = [223 223 223 255]
					dims = (300.0, 300.0)
				}
				select = <final_blow_powerup>
				final_blow_attack_text = ($battlemode_powerups [<select>].name_text)
				final_blow_attack_icon = ($battlemode_powerups [<select>].card_texture)
				createscreenelement {
					type = textblockelement
					parent = newspaper_container
					just = [left top]
					pos = (324.0, 440.0)
					rot_angle = -7.5
					scale = 0.45000002
					text = <final_blow_attack_text>
					font = fontgrid_title_gh3
					rgba = [223 223 223 255]
					dims = (400.0, 200.0)
				}
				formattext checksumname = card_checksum 'battlecard_final_blow'
				createscreenelement {
					type = spriteelement
					id = <card_checksum>
					parent = newspaper_container
					texture = <final_blow_attack_icon>
					rgba = [255 255 255 255]
					just = [left top]
					rot_angle = -7.5
					pos = (278.0, 442.0)
					dims = (64.0, 64.0)
				}
			endif
		else
			formattext textname = who_won_text "Player %s Conquers With Authority!" s = <winner>
			createscreenelement {
				type = textblockelement
				parent = newspaper_container
				just = [left top]
				internal_just = [left top]
				pos = (256.0, 264.0)
				scale = 0.75
				text = <who_won_text>
				font = text_a11
				rgba = <winner_color>
				dims = (300.0, 134.0)
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
			type = textblockelement
			parent = newspaper_container
			just = [left top]
			internal_just = [left top]
			pos = (270.0, 352.0)
			scale = (0.55, 0.55)
			text = <uppercasestring>
			font = text_a11
			rgba = $g_ss_2p_song_title_whiteish
			dims = (258.0, 134.0)
			line_spacing = 0.85
			rot_angle = -7.5
			noshadow
		}
		get_difficulty_text_upper difficulty = ($current_difficulty)
		formattext textname = p1_difficulty_text "PLAYER 1, %d" d = <difficulty_text>
		displaytext {
			parent = newspaper_container
			text = <p1_difficulty_text>
			pos = (298.0, 522.0)
			scale = (0.5, 0.55)
			font = text_a11
			rgba = $g_ss_p1_orangeish
			rot = -7.5
			noshadow
		}
		get_difficulty_text_upper difficulty = ($current_difficulty2)
		formattext textname = p2_difficulty_text "PLAYER 2, %d" d = <difficulty_text>
		displaytext {
			parent = newspaper_container
			text = <p2_difficulty_text>
			pos = (302.0, 552.0)
			scale = (0.5, 0.55)
			font = text_a11
			rgba = $g_ss_p2_violetish
			rot = -7.5
			noshadow
		}
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
			tex = song_summary_circle_2p
			pos = (<p1_stats_pos> + (61.0, 61.0))
			rgba = $g_ss_p1_orangeish
			rot_angle = 180
			z = 8
		}
		displaysprite {
			id = np_circle_2
			parent = newspaper_container
			tex = song_summary_circle_2p
			pos = <p2_stats_pos>
			rgba = $g_ss_p2_violetish
			z = 8
		}
		displaytext {
			parent = newspaper_container
			text = "1"
			pos = (<p1_stats_pos> + (23.0, 3.0))
			scale = (0.9, 0.6)
			font = text_a11
			rgba = $g_ss_2p_song_title_whiteish
			z = 9
		}
		displaytext {
			parent = newspaper_container
			text = "2"
			pos = (<p2_stats_pos> + (21.0, 3.0))
			scale = (0.9, 0.6)
			font = text_a11
			rgba = $g_ss_2p_song_title_whiteish
			z = 9
		}
		if (<winner> = "1")
			<l_wing_pos> = (<p1_stats_pos> + (-44.0, 0.0))
			<r_wing_pos> = (<p1_stats_pos> + (39.0, 0.0))
		else
			<l_wing_pos> = (<p2_stats_pos> + (-44.0, 0.0))
			<r_wing_pos> = (<p2_stats_pos> + (44.0, 0.0))
		endif
		displaysprite {
			id = np_left_wing
			parent = newspaper_container
			tex = song_summary_wing_2p
			pos = <l_wing_pos>
			z = 7
		}
		displaysprite {
			id = np_right_wing
			parent = newspaper_container
			tex = song_summary_wing_2p_flipped
			pos = <r_wing_pos>
			z = 7
		}
		if (<winner> = "1")
			displaysprite {
				parent = newspaper_container
				tex = song_summary_guitar_winner_2p
				pos = (<p1_stats_pos> + (46.0, 0.0))
				z = 6
			}
			displaysprite {
				parent = newspaper_container
				tex = song_summary_guitar_loser_2p
				pos = (<p2_stats_pos> + (-44.0, 0.0))
				flip_v
				z = 6
			}
		else
			displaysprite {
				parent = newspaper_container
				tex = song_summary_guitar_winner_2p
				pos = (<p2_stats_pos> + (-110.0, 0.0))
				flip_v
				z = 6
			}
			displaysprite {
				parent = newspaper_container
				tex = song_summary_guitar_loser_2p
				pos = (<p1_stats_pos> + (44.0, 0.0))
				z = 6
			}
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
			font = text_a4
			z = 4
			rgba = <ss_notestreak_color>
			noshadow
		}
		displaytext {
			id = ss_p1_note_streak_text
			parent = newspaper_container
			text = "note streak"
			pos = (<p1_stats_pos> + (6.0, 110.0))
			scale = (0.55, 0.55)
			font = text_a11
			z = 4
			rgba = <ss_notestreak_text_color>
			noshadow
		}
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
			font = text_a4
			z = 4
			rgba = <ss_notestreak_color>
			noshadow
		}
		displaytext {
			id = ss_p2_note_streak_text
			parent = newspaper_container
			text = "note streak"
			pos = (<p2_stats_pos> + (-50.0, 110.0))
			scale = (0.55, 0.55)
			font = text_a11
			z = 4
			rgba = <ss_notestreak_text_color>
			noshadow
		}
		displaysprite {
			id = ss_p1_score_fill
			parent = newspaper_container
			tex = song_summary_score_bg_2p
			pos = (<p1_stats_pos> + (-12.0, 160.0))
			rgba = <ss_score_color>
		}
		displaysprite {
			id = ss_p2_score_fill
			parent = newspaper_container
			tex = song_summary_score_bg_2p
			pos = (<p2_stats_pos> + (54.0, 192.0))
			rgba = <ss_score_color>
			rot_angle = 181
		}
		displaytext {
			id = ss_p1_score_text
			parent = newspaper_container
			text = "Score"
			pos = (<p1_stats_pos> + (10.0, 155.0))
			scale = (0.7, 0.5)
			font = text_a11
			z = 4
			rgba = $g_ss_2p_song_title_whiteish
			noshadow
			rot = -2
		}
		displaytext {
			id = ss_p2_score_text
			parent = newspaper_container
			text = "Score"
			pos = (<p2_stats_pos> + (-50.0, 155.0))
			scale = (0.7, 0.5)
			font = text_a11
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
			font = text_a4
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
			font = text_a4
			rgba = <ss_score_color>
			z = 3
			noshadow
		}
		formattext textname = p1_notes_hit "%d" d = <p1_percent_complete>
		if (<p1_percent_complete> = 100)
			<ss_percent_pos> = (<p1_stats_pos> + (2.0, 204.0))
			<ss_percent_scale> = (0.7, 1.57)
		elseif (<p1_percent_complete> < 10)
			<ss_percent_pos> = (<p1_stats_pos> + (10.0, 206.0))
			<ss_percent_scale> = (1.6, 1.57)
		else
			<ss_percent_pos> = (<p1_stats_pos> + (6.0, 207.0))
			<ss_percent_scale> = (0.9, 1.57)
		endif
		displaytext {
			id = ss_p1_notes_hit
			parent = newspaper_container
			text = <p1_notes_hit>
			pos = <ss_percent_pos>
			scale = <ss_percent_scale>
			font = text_a4
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		formattext textname = p2_notes_hit "%d" d = <p2_percent_complete>
		if (<p2_percent_complete> = 100)
			<ss_percent_pos> = (<p2_stats_pos> + (-70.0, 204.0))
			<ss_percent_scale> = (0.7, 1.57)
		elseif (<p2_percent_complete> < 10)
			<ss_percent_pos> = (<p2_stats_pos> + (-62.0, 206.0))
			<ss_percent_scale> = (1.6, 1.57)
		else
			<ss_percent_pos> = (<p2_stats_pos> + (-66.0, 207.0))
			<ss_percent_scale> = (0.9, 1.57)
		endif
		displaytext {
			id = ss_p2_notes_hit
			parent = newspaper_container
			text = <p2_notes_hit>
			pos = <ss_percent_pos>
			scale = <ss_percent_scale>
			font = text_a4
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		displaytext {
			id = ss_p1_percent_sign
			parent = newspaper_container
			text = "%"
			pos = (<p1_stats_pos> + (60.0, 226.0))
			font = text_a4
			z = 4
			rgba = <ss_percent_color>
			rot = 50
			scale = (0.8, 0.6)
			noshadow
		}
		displaytext {
			id = ss_p2_percent_sign
			parent = newspaper_container
			text = "%"
			pos = (<p2_stats_pos> + (-12.0, 226.0))
			font = text_a4
			z = 4
			rgba = <ss_percent_color>
			rot = 50
			scale = (0.8, 0.6)
			noshadow
		}
		displaytext {
			id = ss_p1_notes_text
			parent = newspaper_container
			text = "NOTES"
			pos = (<p1_stats_pos> + (66.0, 232.0))
			scale = (0.4, 0.7)
			font = text_a3
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		displaytext {
			id = ss_p1_hit_text
			parent = newspaper_container
			text = "H IT"
			pos = (<p1_stats_pos> + (67.0, 257.0))
			scale = (0.5, 0.7)
			font = text_a3
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		displaytext {
			id = ss_p2_notes_text
			parent = newspaper_container
			text = "NOTES"
			pos = (<p2_stats_pos> + (-6.0, 232.0))
			scale = (0.4, 0.7)
			font = text_a3
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		displaytext {
			id = ss_p2_hit_text
			parent = newspaper_container
			text = "H IT"
			pos = (<p2_stats_pos> + (-5.0, 257.0))
			scale = (0.5, 0.7)
			font = text_a3
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		if (<winner> = "1")
			displaysprite {
				id = np_icon_thumb
				parent = newspaper_container
				tex = song_summary_icon_winner_2p
				pos = (<p1_stats_pos> + (46.0, 330.0))
				rgba = $g_ss_p1_orangeish
				just = [center center]
				dims = (64.0, 64.0)
			}
			displaysprite {
				id = np_icon_skull
				parent = newspaper_container
				tex = song_summary_icon_loser_2p
				pos = (<p2_stats_pos> + (-55.0, 294.0))
				rgba = $g_ss_p2_violetish
				dims = (64.0, 64.0)
			}
		else
			displaysprite {
				id = np_icon_thumb
				parent = newspaper_container
				tex = song_summary_icon_winner_2p
				pos = (<p2_stats_pos> + (-16.0, 320.0))
				rgba = $g_ss_p2_violetish
				just = [center center]
				dims = (64.0, 64.0)
				flip_v
			}
			displaysprite {
				id = np_icon_skull
				parent = newspaper_container
				tex = song_summary_icon_loser_2p
				pos = (<p1_stats_pos> + (22.0, 294.0))
				rgba = $g_ss_p1_orangeish
				dims = (64.0, 64.0)
				flip_v
			}
		endif
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
			<id> :setprops rgba = <hilite_rgba> alpha = 0.25 dims = (180.0, 180.0)
		endif
		<i> = (<i> + 1)
		repeat 3
		outfit = ($<player_status>.outfit)
		style = ($<player_status>.style)
		if find_profile_by_id id = ($<player_status>.character_id)
			get_musician_profile_struct index = <index>
			character_name = (<profile_struct>.name)
			formattext checksumname = the_body_id_i_need 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <outfit> s = <style>
			get_pak_filename desc_id = <the_body_id_i_need> type = body
			if (<found> = 1)
				<asset_context> = ($musician_body [<pak_index>].asset_context)
				pushassetcontext context = <asset_context>
			endif
		endif
		displaysprite {
			parent = newspaper_container
			tex = mag_photo
			dims = (640.0, 640.0)
			pos = (125.0, 34.0)
			z = -1
		}
		if (<found> = 1)
			popassetcontext
		endif
		spawnscriptnow np_2p_flap_wings
		spawnscriptnow np_2p_thumb_zoom
		spawnscriptnow np_2p_fade_to_grey params = {winner = <winner>}
		if (<winner> = "1")
			spawnscriptnow np_2p_hilites_p1
		else
			spawnscriptnow np_2p_hilites_p2
		endif
	else
		switch $g_ss_mag_number
			case 0
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
			case 1
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
			case 2
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
			case 3
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
			case 4
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
		get_song_artist song = ($current_song)
		getuppercasestring <song_artist>
		<band_name> = <uppercasestring>
		createscreenelement {
			id = ss_song_title_text_block_id
			type = textblockelement
			parent = newspaper_container
			just = [left top]
			internal_just = [left top]
			pos = (256.0, 264.0)
			scale = 0.75
			text = <song_title>
			font = text_a11
			rgba = $g_ss_offwhite
			dims = (248.0, 134.0)
			line_spacing = 0.85
			rot_angle = -7.5
		}
		getscreenelementchildren id = ss_song_title_text_block_id
		getarraysize (<children>)
		if (<array_size> = 1)
			<artist_pos> = (262.0, 312.0)
		else
			<artist_pos> = (268.0, 352.0)
		endif
		displaytext {
			parent = newspaper_container
			text = <band_name>
			pos = <artist_pos>
			scale = (0.5, 0.55)
			font = text_a4
			rgba = $g_ss_orangeish
			rot = -7.5
			noshadow
		}
		displaysprite {
			parent = newspaper_container
			tex = <ss_percent_fill>
			pos = (267.0, 460.0)
			dims = (336.0, 168.0)
		}
		formattext textname = p1_notes_hit "%d" d = <p1_percent_complete>
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
			font = text_a4
			z = 4
			rgba = <ss_percent_color>
			rot = -10
			noshadow
		}
		displaytext {
			parent = newspaper_container
			text = "%"
			pos = (364.0, 500.0)
			font = text_a4
			z = 4
			rgba = <ss_percent_color>
			rot = -10
			noshadow
		}
		displaytext {
			parent = newspaper_container
			text = "NOTES  HIT"
			pos = (403.0, 522.0)
			scale = (0.44, 0.7)
			font = text_a3
			z = 4
			rgba = $g_ss_black
			rot = -10
			noshadow
		}
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
				font = text_a4
				rgba = <ss_score_color>
				z = 3
				noshadow
			}
			displaytext {
				parent = newspaper_container
				text = "SCORE"
				pos = (946.0, 98.0)
				scale = (0.7, 0.6)
				font = text_a11
				z = 4
				rgba = <ss_score_text_color>
				noshadow
			}
		else
			notes_hit = ($player1_status.notes_hit)
			notes_total = ($player1_status.total_notes)
			formattext textname = notes_hit_out_of_total "%a OUT OF %b" a = <notes_hit> b = <notes_total>
			displaytext {
				id = np_score_text
				parent = newspaper_container
				text = <notes_hit_out_of_total>
				just = [right center]
				pos = (906.0, 116.0)
				scale = (0.9, 0.65000004)
				font = text_a4
				rgba = <ss_score_color>
				z = 3
				noshadow
			}
			displaytext {
				parent = newspaper_container
				text = "NOTES"
				pos = (946.0, 98.0)
				scale = (0.7, 0.6)
				font = text_a11
				z = 4
				rgba = <ss_score_text_color>
				noshadow
			}
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
			font = text_a4
			z = 4
			rgba = <ss_notestreak_color>
			noshadow
		}
		displaytext {
			parent = newspaper_container
			text = "note streak"
			pos = (743.0, 425.0)
			scale = (0.45000002, 0.55)
			font = text_a11
			z = 4
			rgba = <ss_notestreak_text_color>
			noshadow
		}
		outfit = ($player1_status.outfit)
		style = ($player1_status.style)
		if find_profile_by_id id = ($player1_status.character_id)
			get_musician_profile_struct index = <index>
			character_name = (<profile_struct>.name)
			formattext checksumname = the_body_id_i_need 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <outfit> s = <style>
			get_pak_filename desc_id = <the_body_id_i_need> type = body
			if (<found> = 1)
				<asset_context> = ($musician_body [<pak_index>].asset_context)
				pushassetcontext context = <asset_context>
			endif
		endif
		displaysprite {
			parent = newspaper_container
			tex = mag_photo
			dims = (640.0, 640.0)
			pos = (125.0, 34.0)
			z = -1
		}
		if (<found> = 1)
			popassetcontext
		endif
	endif
	if ($is_network_game)
		np_net_create_options_menu pos = (770.0, 460.0) rot = <rot> scale = 1 for_practice = <for_practice>
	elseif ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p1_quickplay)
		np_create_options_menu pos = (770.0, 460.0) rot = <rot> scale = 1 for_practice = <for_practice>
	else
		np_create_options_menu pos = (770.0, 360.0) rot = <rot> scale = 1 for_practice = <for_practice>
	endif
	get_song_struct song = ($current_song)
	if ((structurecontains structure = <song_struct> boss) || $game_mode = p2_battle)
		set_current_battle_first_play
	endif
	change user_control_pill_text_color = [0 0 0 255]
	change user_control_pill_color = [180 180 180 255]
	add_user_control_helper text = "SELECT" button = green z = 100
	add_user_control_helper text = "UP/DOWN" button = strumbar z = 100
endscript

script destroy_newspaper_menu 
	clean_up_user_control_helpers
	killspawnedscript \{name = np_2p_flap_wings}
	killspawnedscript \{name = np_2p_thumb_zoom}
	killspawnedscript \{name = np_2p_fade_to_grey}
	killspawnedscript \{name = np_2p_hilites_p1}
	killspawnedscript \{name = np_2p_hilites_p2}
	enable_pause
	destroy_menu \{menu_id = newspaper_scroll}
	destroy_menu \{menu_id = newspaper_container}
	destroy_menu_backdrop
	net_destroy_newspaper_menu
	change \{g_np_options_index = 0}
endscript

script np_scroll_text_horizontal time = 5 band_name = "" song_name = "" band_rgba = [0 0 0 255] song_rgba = [0 0 0 255]
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
	doscreenelementmorph id = np_scroll_text_container pos = <end_pos> time = <time>
	wait <time> seconds
	setscreenelementprops id = np_scroll_text_container pos = <start_pos>
	repeat
endscript

script np_create_text pos = (200.0, 200.0) rot = 0 text = "No text given" parent = newspaper_container scale = 1 rgba = [0 0 0 255] just = [center top] internal_just = [left left]
	if gotparam dims
		createscreenelement {
			type = textblockelement
			parent = <parent>
			just = <just>
			internal_just = <internal_just>
			pos = <pos>
			rot_angle = <rot>
			scale = <scale>
			text = <text>
			font = fontgrid_title_gh3
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
			font = fontgrid_title_gh3
			rgba = <rgba>
			z_priority = 3
		}
	endif
endscript

script np_create_options_menu pos = (600.0, 300.0) rot = 0 scale = 0.8 menu_font = text_a11 for_practice = 0
	setscreenelementprops id = newspaper_scroll pos = <pos>
	set_focus_color rgba = $g_ss_offwhite
	set_unfocus_color rgba = $g_ss_black
	if NOT ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p1_quickplay || <for_practice> = 1)
		<menu_offset> = (0.0, -65.0)
	else
		<menu_offset> = (0.0, 0.0)
	endif
	if (<for_practice> = 1)
		displaytext id = np_option_0 parent = newspaper_container text = "CONTINUE" pos = (($g_np_option_props [4].pos) + <menu_offset>) scale = (0.85, 0.7) rot = ($g_np_option_props [4].rot) font = <menu_font> noshadow
		displaytext id = np_option_1 parent = newspaper_container text = "RESTART" pos = (($g_np_option_props [5].pos) + <menu_offset>) scale = (0.8, 0.7) rot = ($g_np_option_props [5].rot) font = <menu_font> noshadow
		displaytext id = np_option_2 parent = newspaper_container text = "CHANGE SPEED" pos = (($g_np_option_props [6].pos) + <menu_offset>) scale = (0.8, 0.7) rot = ($g_np_option_props [6].rot) font = <menu_font> noshadow
		displaytext id = np_option_3 parent = newspaper_container text = "CHANGE SECTION" pos = (($g_np_option_props [7].pos) + <menu_offset>) scale = (0.8, 0.7) rot = ($g_np_option_props [7].rot) font = <menu_font> noshadow
		displaytext id = np_option_4 parent = newspaper_container text = "QUIT" pos = (($g_np_option_props [8].pos) + <menu_offset>) scale = (0.8, 0.7) rot = ($g_np_option_props [8].rot) font = <menu_font> noshadow
		retail_menu_unfocus id = np_option_4
	else
		displaytext id = np_option_0 parent = newspaper_container text = "CONTINUE" pos = (($g_np_option_props [0].pos) + <menu_offset>) scale = (0.85, 0.7) rot = ($g_np_option_props [0].rot) font = <menu_font> noshadow
		if NOT ($end_credits = 1)
			displaytext id = np_option_1 parent = newspaper_container text = "REPLAY" pos = (($g_np_option_props [1].pos) + <menu_offset>) scale = (0.8, 0.7) rot = ($g_np_option_props [1].rot) font = <menu_font> noshadow
			displaytext id = np_option_2 parent = newspaper_container text = "MORE STATS" pos = (($g_np_option_props [2].pos) + <menu_offset>) scale = (0.8, 0.7) rot = ($g_np_option_props [2].rot) font = <menu_font> noshadow
			displaytext id = np_option_3 parent = newspaper_container text = "QUIT" pos = (($g_np_option_props [3].pos) + <menu_offset>) scale = (0.85, 0.7) rot = ($g_np_option_props [3].rot) font = <menu_font> noshadow
		endif
	endif
	retail_menu_focus id = np_option_0
	retail_menu_unfocus id = np_option_1
	retail_menu_unfocus id = np_option_2
	retail_menu_unfocus id = np_option_3
	switch $g_ss_mag_number
		case 0
		<ss_hilite_color> = $g_ss_paste_brownish
		<ss_menu_icon> = song_summary_menu_icon_paste
		case 1
		<ss_hilite_color> = $g_ss_decibel_magentaish
		<ss_menu_icon> = song_summary_menu_icon_decibel
		case 2
		<ss_hilite_color> = $g_ss_ap_blueish
		<ss_menu_icon> = song_summary_menu_icon_ap
		case 3
		<ss_hilite_color> = $g_ss_kerrang_reddish
		<ss_menu_icon> = song_summary_menu_icon_kerrang
		case 4
		<ss_hilite_color> = $g_ss_gp_blueish
		<ss_menu_icon> = song_summary_menu_icon_gplayer
	endswitch
	displaysprite {
		id = ss_menu_hilite_id
		parent = newspaper_container
		tex = song_summary_menu_hilite
		pos = (($g_np_option_props [0].pos) + ($g_np_option_props [0].offset) + <menu_offset>)
		rgba = <ss_hilite_color>
		rot_angle = (($g_np_option_props [$g_np_options_index].rot) + 0.5)
		dims = (320.0, 40.0)
		z = 1
	}
	displaysprite {
		id = ss_menu_icon_id
		parent = newspaper_container
		tex = <ss_menu_icon>
		pos = (($g_np_option_props [0].pos) + ($g_np_option_props [0].offset) + ($g_np_menu_icon_offset) + <menu_offset>)
		rot_angle = ($g_np_option_props [$g_np_options_index].rot)
		dims = (80.0, 80.0)
		z = 3
	}
	if (<for_practice> = 1)
		createscreenelement {
			type = textelement
			parent = newspaper_vmenu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus setscreenelementprops params = {id = np_option_0 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus setscreenelementprops params = {id = np_option_0 no_shadow}}
				{pad_choose ui_flow_manager_respond_to_action params = {action = new_song}}
			]
		}
		createscreenelement {
			type = textelement
			parent = newspaper_vmenu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus setscreenelementprops params = {id = np_option_1 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus setscreenelementprops params = {id = np_option_1 no_shadow}}
				{pad_choose ui_flow_manager_respond_to_action params = {action = restart}}
			]
		}
		createscreenelement {
			type = textelement
			parent = newspaper_vmenu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus setscreenelementprops params = {id = np_option_2 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus setscreenelementprops params = {id = np_option_2 no_shadow}}
				{pad_choose ui_flow_manager_respond_to_action params = {action = change_speed}}
			]
		}
		createscreenelement {
			type = textelement
			parent = newspaper_vmenu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus setscreenelementprops params = {id = np_option_3 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus setscreenelementprops params = {id = np_option_3 no_shadow}}
				{pad_choose ui_flow_manager_respond_to_action params = {action = change_section}}
			]
		}
		createscreenelement {
			type = textelement
			parent = newspaper_vmenu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus setscreenelementprops params = {id = np_option_4 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus setscreenelementprops params = {id = np_option_4 no_shadow}}
				{pad_choose ui_flow_manager_respond_to_action params = {action = exit}}
			]
		}
	else
		createscreenelement {
			type = textelement
			parent = newspaper_vmenu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus setscreenelementprops params = {id = np_option_0 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus setscreenelementprops params = {id = np_option_0 no_shadow}}
				{pad_choose ui_flow_manager_respond_to_action params = {action = continue}}
			]
		}
		if NOT ($end_credits = 1)
			createscreenelement {
				type = textelement
				parent = newspaper_vmenu
				font = <menu_font>
				event_handlers = [
					{focus retail_menu_focus}
					{focus setscreenelementprops params = {id = np_option_1 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
					{unfocus retail_menu_unfocus}
					{unfocus setscreenelementprops params = {id = np_option_1 no_shadow}}
					{pad_choose ui_flow_manager_respond_to_action params = {action = try_again}}
				]
			}
			createscreenelement {
				type = textelement
				parent = newspaper_vmenu
				font = <menu_font>
				event_handlers = [
					{focus retail_menu_focus}
					{focus setscreenelementprops params = {id = np_option_2 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
					{unfocus retail_menu_unfocus}
					{unfocus setscreenelementprops params = {id = np_option_2 no_shadow}}
					{pad_choose ui_flow_manager_respond_to_action params = {action = select_detailed_stats}}
				]
			}
			createscreenelement {
				type = textelement
				parent = newspaper_vmenu
				font = <menu_font>
				event_handlers = [
					{focus retail_menu_focus}
					{focus setscreenelementprops params = {id = np_option_3 shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
					{unfocus retail_menu_unfocus}
					{unfocus setscreenelementprops params = {id = np_option_3 no_shadow}}
					{pad_choose ui_flow_manager_respond_to_action params = {action = quit}}
				]
			}
		endif
	endif
endscript

script np_scroll_down for_practice = 0
	if ($end_credits = 1)
		return
	endif
	if ($is_network_game)
		return
	endif
	generic_menu_up_or_down_sound
	if NOT ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p1_quickplay || <for_practice> = 1)
		<menu_offset> = (0.0, -65.0)
	else
		<menu_offset> = (0.0, 0.0)
	endif
	if (<for_practice> = 1)
		formattext checksumname = option_id 'np_option_%d' d = ($g_np_options_index - 4)
	else
		formattext checksumname = option_id 'np_option_%d' d = $g_np_options_index
	endif
	retail_menu_unfocus id = <option_id>
	change g_np_options_index = ($g_np_options_index + 1)
	printf "new g_np_options_index = %d" d = ($g_np_options_index)
	if (<for_practice> = 1)
		if ($g_np_options_index > 8)
			change g_np_options_index = 4
		endif
		formattext checksumname = option_id 'np_option_%d' d = ($g_np_options_index - 4)
	else
		if ($g_np_options_index > 3)
			change g_np_options_index = 0
		endif
		formattext checksumname = option_id 'np_option_%d' d = $g_np_options_index
	endif
	retail_menu_focus id = <option_id>
	doscreenelementmorph {
		id = ss_menu_hilite_id
		pos = (($g_np_option_props [$g_np_options_index].pos) + ($g_np_option_props [$g_np_options_index].offset) + <menu_offset>)
		rot_angle = (($g_np_option_props [$g_np_options_index].rot) + 0.5)
		time = 0.05
	}
	doscreenelementmorph {
		id = ss_menu_icon_id
		pos = (($g_np_option_props [$g_np_options_index].pos) + ($g_np_option_props [$g_np_options_index].offset) + ($g_np_menu_icon_offset) + <menu_offset>)
		rot_angle = ($g_np_option_props [$g_np_options_index].rot)
		time = 0.05
	}
endscript

script np_scroll_up for_practice = 0
	if ($end_credits = 1)
		return
	endif
	if ($is_network_game)
		return
	endif
	generic_menu_up_or_down_sound
	if NOT ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p1_quickplay || <for_practice> = 1)
		<menu_offset> = (0.0, -65.0)
	else
		<menu_offset> = (0.0, 0.0)
	endif
	if (<for_practice> = 1)
		formattext checksumname = option_id 'np_option_%d' d = ($g_np_options_index - 4)
	else
		formattext checksumname = option_id 'np_option_%d' d = $g_np_options_index
	endif
	retail_menu_unfocus id = <option_id>
	change g_np_options_index = ($g_np_options_index -1)
	if (<for_practice> = 1)
		if ($g_np_options_index < 4)
			change g_np_options_index = 8
		endif
		formattext checksumname = option_id 'np_option_%d' d = ($g_np_options_index - 4)
	else
		if ($g_np_options_index < 0)
			change g_np_options_index = 3
		endif
		formattext checksumname = option_id 'np_option_%d' d = $g_np_options_index
	endif
	retail_menu_focus id = <option_id>
	doscreenelementmorph {
		id = ss_menu_hilite_id
		pos = (($g_np_option_props [$g_np_options_index].pos) + ($g_np_option_props [$g_np_options_index].offset) + <menu_offset>)
		rot_angle = (($g_np_option_props [$g_np_options_index].rot) + 0.5)
		time = 0.05
	}
	doscreenelementmorph {
		id = ss_menu_icon_id
		pos = (($g_np_option_props [$g_np_options_index].pos) + ($g_np_option_props [$g_np_options_index].offset) + ($g_np_menu_icon_offset) + <menu_offset>)
		rot_angle = ($g_np_option_props [$g_np_options_index].rot)
		time = 0.05
	}
endscript

script scale_textblock reset_scale = 0
	getscreenelementdims id = <id>
	block_width = (<width> * 1.0)
	block_height = (<height> * 1.0)
	getscreenelementchildren id = <id>
	if gotparam children
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
	getscreenelementprops id = np_left_wing
	setscreenelementprops id = np_left_wing just = [0.9688 0.68750006]
	setscreenelementprops id = np_right_wing just = [-0.9688 0.68750006]
	begin
	doscreenelementmorph id = np_left_wing rot_angle = 20 time = <flap_time> motion = ease_out
	doscreenelementmorph id = np_right_wing rot_angle = -20 time = <flap_time> motion = ease_out
	wait <flap_time> seconds
	doscreenelementmorph id = np_left_wing rot_angle = -20 time = <flap_time> motion = ease_in
	doscreenelementmorph id = np_right_wing rot_angle = 20 time = <flap_time> motion = ease_in
	wait (<flap_time> * 2) seconds
	repeat
endscript

script np_2p_thumb_zoom 
	<zoom_time> = 0.4
	<bounce_time> = 0.5
	<thumb_orig_pos> = (240.0, -30.0)
	<thumb_orig_alpha> = 0.25
	<thumb_orig_scale> = 12
	getscreenelementprops id = np_icon_thumb
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
	doscreenelementmorph {
		id = np_icon_thumb
		pos = <thumb_final_pos>
		alpha = <thumb_final_alpha>
		scale = 1
		relative_scale
		time = <zoom_time>
	}
	wait (<zoom_time> * 1.5) seconds
	begin
	doscreenelementmorph {
		id = np_icon_thumb
		scale = <thumb_bounce_scale>
		relative_scale
		time = <bounce_time>
		motion = ease_in
	}
	wait <bounce_time> seconds
	doscreenelementmorph {
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
	wait 1 second
	if (<winner> = "2")
		<stroke_pos> = (798.0, 260.0)
	else
		<stroke_pos> = (934.0, 280.0)
	endif
	displaysprite {
		id = ss_stroke_1
		parent = newspaper_container
		tex = song_summary_brushstroke_2p
		pos = <stroke_pos>
		rgba = $g_ss_ap_reddish
		z = 80
		rot_angle = 25
		scale = 0.125
		relative_scale
	}
	doscreenelementmorph id = ss_stroke_1 scale = 10.0 relative_scale pos = (<stroke_pos> + (-8.0, -10.0)) time = 0.15 motion = ease_in
	wait 0.2 seconds
	displaysprite {
		id = ss_stroke_2
		parent = newspaper_container
		tex = song_summary_brushstroke_2p
		pos = (<stroke_pos> + (-110.0, -30.0))
		rgba = [255 0 0 255]
		z = 80
		rot_angle = -10
		flip_v
		flip_h
		scale = 0.125
		relative_scale
	}
	doscreenelementmorph id = ss_stroke_2 scale = 12.0 relative_scale pos = (<stroke_pos> + (-120.0, -30.0)) time = 0.125 motion = ease_out
	wait 0.125 seconds
	<drain_time> = 2
	if (<winner> = "2")
		doscreenelementmorph id = ss_p1_note_streak_fill rgba = [128 128 128 255] time = <drain_time>
		doscreenelementmorph id = ss_p1_note_streak rgba = [210 210 210 255] time = <drain_time>
		doscreenelementmorph id = ss_p1_note_streak_text rgba = [220 220 220 255] time = <drain_time>
		doscreenelementmorph id = ss_p1_score_fill rgba = [128 128 128 255] time = <drain_time>
		doscreenelementmorph id = ss_p1_score_text rgba = [220 220 220 255] time = <drain_time>
		doscreenelementmorph id = ss_p1_score rgba = [128 128 128 255] time = <drain_time>
		doscreenelementmorph id = ss_p1_notes_hit rgba = [128 128 128 255] time = <drain_time>
		doscreenelementmorph id = ss_p1_percent_sign rgba = [64 64 64 255] time = <drain_time>
		doscreenelementmorph id = ss_p1_notes_text rgba = [64 64 64 255] time = <drain_time>
		doscreenelementmorph id = ss_p1_hit_text rgba = [64 64 64 255] time = <drain_time>
		doscreenelementmorph id = np_circle_1 rgba = [192 192 192 255] time = <drain_time>
	else
		doscreenelementmorph id = ss_p2_note_streak_fill rgba = [128 128 128 255] time = <drain_time>
		doscreenelementmorph id = ss_p2_note_streak rgba = [210 210 210 255] time = <drain_time>
		doscreenelementmorph id = ss_p2_note_streak_text rgba = [220 220 220 255] time = <drain_time>
		doscreenelementmorph id = ss_p2_score_fill rgba = [128 128 128 255] time = <drain_time>
		doscreenelementmorph id = ss_p2_score_text rgba = [220 220 220 255] time = <drain_time>
		doscreenelementmorph id = ss_p2_score rgba = [128 128 128 255] time = <drain_time>
		doscreenelementmorph id = ss_p2_notes_hit rgba = [128 128 128 255] time = <drain_time>
		doscreenelementmorph id = ss_p2_percent_sign rgba = [64 64 64 255] time = <drain_time>
		doscreenelementmorph id = ss_p2_notes_text rgba = [64 64 64 255] time = <drain_time>
		doscreenelementmorph id = ss_p2_hit_text rgba = [64 64 64 255] time = <drain_time>
		doscreenelementmorph id = np_circle_2 rgba = [192 192 192 255] time = <drain_time>
	endif
	doscreenelementmorph id = np_icon_skull rgba = [192 192 192 255] time = <drain_time>
	wait (<drain_time> + 0.5) seconds
	doscreenelementmorph id = ss_stroke_1 alpha = 0 time = 0.25
	doscreenelementmorph id = ss_stroke_2 alpha = 0 z = 1 time = 0.25
endscript

script np_2p_hilites_p1 time = 3.0
	rot1 = 360
	rot2 = 180
	alpha1 = 1
	alpha2 = 1
	setscreenelementprops id = ss_hilite2_p1 rot_angle = 0 alpha = 0
	setscreenelementprops id = ss_hilite3_p1 rot_angle = 0 alpha = 0
	begin
	i = 1
	begin
	if screenelementexists id = ss_hilite2_p1
		doscreenelementmorph id = ss_hilite2_p1 rot_angle = <rot1> alpha = <alpha1> time = <time>
	endif
	if screenelementexists id = ss_hilite3_p1
		doscreenelementmorph id = ss_hilite3_p1 rot_angle = <rot2> alpha = <alpha2> time = <time>
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

script np_2p_hilites_p2 time = 3.0
	rot1 = 360
	rot2 = 180
	alpha1 = 1
	alpha2 = 1
	setscreenelementprops id = ss_hilite2_p2 rot_angle = 0 alpha = 0
	setscreenelementprops id = ss_hilite3_p2 rot_angle = 0 alpha = 0
	begin
	i = 1
	begin
	if screenelementexists id = ss_hilite2_p2
		doscreenelementmorph id = ss_hilite2_p2 rot_angle = <rot1> alpha = <alpha1> time = <time>
	endif
	if screenelementexists id = ss_hilite3_p2
		doscreenelementmorph id = ss_hilite3_p2 rot_angle = <rot2> alpha = <alpha2> time = <time>
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
