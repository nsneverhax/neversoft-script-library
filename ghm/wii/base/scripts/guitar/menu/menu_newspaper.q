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
		Pos = (680.0, 208.0)
		rot = 1
		offset = (-30.0, 5.0)
	}
	{
		Pos = (680.0, 241.0)
		rot = 1
		offset = (-30.0, 5.0)
	}
	{
		Pos = (680.0, 274.0)
		rot = 0.5
		offset = (-30.0, 5.0)
	}
	{
		Pos = (680.0, 306.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
	{
		Pos = (680.0, 162.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
	{
		Pos = (680.0, 195.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
	{
		Pos = (680.0, 228.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
	{
		Pos = (680.0, 261.0)
		rot = 0
		offset = (-30.0, 6.0)
	}
	{
		Pos = (680.0, 294.0)
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
g_ss_AP_reddish = [
	200
	60
	55
	255
]
g_ss_AP_blueish = [
	55
	80
	135
	255
]
g_ss_AP_yellowish = [
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
g_ss_GP_blueish = [
	40
	110
	130
	255
]
g_ss_GP_greyish = [
	90
	90
	90
	255
]
g_ss_Kerrang_reddish = [
	170
	50
	55
	255
]
g_ss_Paste_beigeish = [
	195
	190
	155
	255
]
g_ss_Paste_brownish = [
	140
	100
	40
	255
]
g_ss_Paste_maroonish = [
	80
	20
	10
	255
]
g_ss_HELL_lighter_reddish = [
	220
	200
	190
	255
]
g_ss_HELL_darker_reddish = [
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
old_song = None

script create_newspaper_menu \{for_practice = 0}
	menu_song_complete_sound
	StopSoundsByBuss \{binkcutscenes}
	resetscoreupdateready
	if isXenon
		writesongdatatofile
	endif
	disable_pause
	Change \{blade_active = 0}
	my_song = ($current_song)
	if NOT ($old_song = None)
		my_song = ($old_song)
		Change \{old_song = None}
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
		if ViewportExists \{id = bg_viewport}
			disable_bg_viewport
		endif
		if ScreenElementExists \{id = practice_sectiontext}
			SetScreenElementProps \{id = practice_sectiontext
				alpha = 0}
		endif
		Change \{g_np_options_index = 4}
		destroy_band_hud
		getmaxplayers
		Player = 1
		begin
		<player_status> = ($0x2994109a [<Player>])
		<player_text> = ($0x57e22f28 [<Player>])
		destroy_hud player_text = <player_text> Player = <Player>
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
			RemoveParameter \{exclusive_device}
			get_all_exclusive_devices
		else
			exclusive_device = ($primary_controller)
		endif
	endif
	new_menu scrollid = newspaper_scroll vmenuid = current_menu use_backdrop = 0 event_handlers = <np_event_handlers> exclusive_device = <exclusive_device>
	if ($game_mode = p2_coop)
		if ($is_network_game)
			stars = ($player1_status.stars)
		else
			stars = (($player1_status.stars + $player2_status.stars) / 2)
		endif
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
	CastToInteger \{p1_score}
	CastToInteger \{p2_score}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = newspaper_container
		Pos = (0.0, 0.0)}
	formatText TextName = p1_note_streak_text qs(0x76b3fda7) d = <p1_note_streak>
	formatText TextName = p2_note_streak_text qs(0x76b3fda7) d = <p2_note_streak>
	formatText TextName = p1_score_text qs(0x73307931) s = <p1_score>
	formatText TextName = p2_score_text qs(0x73307931) s = <p2_score>
	formatText TextName = p1_gp_score_text qs(0x8f00b7bf) s = <p1_gp_score>
	formatText TextName = p2_gp_score_text qs(0x64370cbc) s = <p2_gp_score>
	get_progression_globals ($current_progression_flag) game_mode = ($game_mode) use_current_tab = 1
	GetGlobalTags \{Progression
		params = current_tier}
	show_stars = 1
	if GotParam \{current_tier}
		if Progression_IsBossSong tier_global = <tier_global> Tier = <current_tier> song = <my_song>
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
		Change \{g_ss_mag_number = 0}
		case 2
		Change \{g_ss_mag_number = 1}
		case 3
		Change \{g_ss_mag_number = 2}
		case 4
		Change \{g_ss_mag_number = 3}
		case 5
		Change \{g_ss_mag_number = 4}
		case 6
		Change \{g_ss_mag_number = 5}
		case 7
		Change \{g_ss_mag_number = 6}
		case 8
		Change \{g_ss_mag_number = 7}
		default
		Change \{g_ss_mag_number = 0}
	endswitch
	if NOT ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p2_coop || $game_mode = p1_quickplay || $game_mode = p2_quickplay || $game_mode = p3_quickplay || $game_mode = p4_quickplay || <for_practice> = 1)
		if ($is_network_game)
			create_menu_backdrop \{texture = Newspaper_BG_2P
				BlendMode = blend}
		else
			if NOT ($g_ss_mag_number = 7)
				create_menu_backdrop \{texture = 2p_song_summary_bg
					BlendMode = blend}
			else
				create_menu_backdrop \{texture = 2p_song_summary_bg_hell
					BlendMode = blend}
			endif
		endif
		switch $g_ss_mag_number
			case 0
			<ss_logo> = Song_Summary_Logo_BACKYARD
			<ss_logo_sm> = Song_Summary_Logo_BACKYARD_sm
			<ss_sidebar> = Song_Summary_Sidebar_BACKYARD
			<ss_percent_color> = $g_ss_black
			<ss_score_color> = $g_ss_black
			<ss_notestreak_fill_color> = $g_ss_black
			<ss_notestreak_color> = $g_ss_offwhite
			<ss_notestreak_text_color> = $g_ss_offwhite
			case 1
			<ss_logo> = Song_Summary_Logo_BAR
			<ss_logo_sm> = Song_Summary_Logo_BAR_sm
			<ss_sidebar> = Song_Summary_Sidebar_BAR
			<ss_percent_color> = $g_ss_black
			<ss_score_color> = $g_ss_black
			<ss_notestreak_fill_color> = $g_ss_black
			<ss_notestreak_color> = $g_ss_offwhite
			<ss_notestreak_text_color> = $g_ss_offwhite
			case 2
			<ss_logo> = Song_Summary_Logo_Paste
			<ss_logo_sm> = Song_Summary_Logo_Paste_sm
			<ss_sidebar> = Song_Summary_Sidebar_Paste
			<ss_percent_color> = $g_ss_Paste_maroonish
			<ss_score_color> = $g_ss_Paste_brownish
			<ss_notestreak_fill_color> = $g_ss_Paste_beigeish
			<ss_notestreak_color> = $g_ss_Paste_maroonish
			<ss_notestreak_text_color> = $g_ss_Paste_brownish
			case 3
			<ss_logo> = Song_Summary_Logo_Decibel
			<ss_logo_sm> = Song_Summary_Logo_Decibel_sm
			<ss_sidebar> = Song_Summary_Sidebar_Decibel
			<ss_percent_color> = $g_ss_decibel_magentaish
			<ss_score_color> = $g_ss_black
			<ss_notestreak_fill_color> = $g_ss_decibel_greenish
			<ss_notestreak_color> = $g_ss_decibel_magentaish
			<ss_notestreak_text_color> = $g_ss_black
			case 4
			<ss_logo> = Song_Summary_Logo_AP
			<ss_logo_sm> = Song_Summary_Logo_AP_sm
			<ss_sidebar> = Song_Summary_Sidebar_AP
			<ss_percent_color> = $g_ss_AP_reddish
			<ss_score_color> = $g_ss_AP_blueish
			<ss_notestreak_fill_color> = $g_ss_AP_reddish
			<ss_notestreak_color> = $g_ss_AP_yellowish
			<ss_notestreak_text_color> = $g_ss_AP_yellowish
			case 5
			<ss_logo> = Song_Summary_Logo_Kerrang
			<ss_logo_sm> = Song_Summary_Logo_Kerrang_sm
			<ss_sidebar> = Song_Summary_Sidebar_Kerrang
			<ss_percent_color> = $g_ss_black
			<ss_score_color> = $g_ss_Kerrang_reddish
			<ss_notestreak_fill_color> = $g_ss_black
			<ss_notestreak_color> = $g_ss_offwhite
			<ss_notestreak_text_color> = $g_ss_offwhite
			case 6
			<ss_logo> = Song_Summary_Logo_GPlayer
			<ss_logo_sm> = Song_Summary_Logo_GPlayer_sm
			<ss_sidebar> = Song_Summary_Sidebar_GPlayer
			<ss_percent_color> = $g_ss_GP_greyish
			<ss_score_color> = $g_ss_GP_blueish
			<ss_notestreak_fill_color> = $g_ss_GP_greyish
			<ss_notestreak_color> = $g_ss_offwhite
			<ss_notestreak_text_color> = $g_ss_offwhite
			case 7
			<ss_logo> = Song_Summary_Logo_HELL
			<ss_logo_sm> = Song_Summary_Logo_HELL_sm
			<ss_sidebar> = Song_Summary_Sidebar_HELL
			<ss_percent_color> = $g_ss_black
			<ss_score_color> = [100 15 5 255]
			<ss_notestreak_fill_color> = $g_ss_black
			<ss_notestreak_color> = [150 65 55 255]
			<ss_notestreak_text_color> = $g_ss_HELL_lighter_reddish
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
			<player_status> = ($0x2994109a [<rand_status>])
		else
			<player_status> = ($0x2994109a [<win_sqs>])
		endif
		if ($game_mode = p2_battle)
			displayText {
				parent = newspaper_container
				text = qs(0x3cec6d9f)
				just = [left top]
				Pos = (256.0, 264.0)
				Scale = 0.75
				font = fontgrid_text_a11
				rgba = <winner_color>
				rot = -7.5
				noshadow
			}
			formatText TextName = winner_text qs(0x72f23aff) d = <winner>
			if ($is_network_game)
				if (<winner> = qs(0x5356b971))
					winner_text = $opponent_gamertag
				else
					if (NetSessionFunc Obj = match func = get_gamertag)
						winner_text = <Name>
					endif
				endif
			endif
			formatText TextName = who_won_text qs(0x29407cfe) s = <winner_text>
			displayText {
				parent = newspaper_container
				text = <who_won_text>
				just = [left top]
				Pos = (262.0, 302.0)
				Scale = 0.75
				font = fontgrid_text_a11
				rgba = <winner_color>
				rot = -7.5
				noshadow
			}
			<final_blow_powerup> = ($<player_status>.final_blow_powerup)
			if (<final_blow_powerup> > -1)
				CreateScreenElement \{Type = TextBlockElement
					parent = newspaper_container
					just = [
						left
						top
					]
					Pos = (320.0, 415.0)
					rot_angle = -7.5
					Scale = 0.45000002
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
				GetGlobalTags \{user_options}
				if (<winner> = qs(0x787beab2))
					is_lefty_flip = <lefty_flip_p2>
				else
					is_lefty_flip = <lefty_flip_p1>
				endif
				if (<select> = 4 && <is_lefty_flip> = 1)
					GetUpperCaseString ($battlemode_powerups [<select>].alt_name_text)
				else
					GetUpperCaseString ($battlemode_powerups [<select>].name_text)
				endif
				final_blow_attack_text = <UppercaseString>
				final_blow_attack_icon = ($battlemode_powerups [<select>].card_texture)
				CreateScreenElement {
					Type = TextBlockElement
					parent = newspaper_container
					just = [left top]
					internal_just = [left top]
					Pos = (345.0, 486.0)
					rot_angle = -7.5
					Scale = 0.4
					text = <final_blow_attack_text>
					font = fontgrid_title_a1
					rgba = [223 223 223 255]
					dims = (600.0, 200.0)
				}
				formatText \{checksumName = card_checksum
					'battlecard_final_blow'}
				CreateScreenElement {
					Type = SpriteElement
					id = <card_checksum>
					parent = newspaper_container
					texture = <final_blow_attack_icon>
					rgba = [255 255 255 255]
					just = [left top]
					rot_angle = -7.5
					Pos = (286.0, 472.0)
					dims = (42.0, 42.0)
				}
			endif
		else
			winner_text = <winner>
			formatText TextName = winner_text qs(0x72f23aff) d = <winner>
			if ($is_network_game)
				if (<winner> = qs(0x5356b971))
					winner_text = $opponent_gamertag
				else
					if (NetSessionFunc Obj = match func = get_gamertag)
						winner_text = <Name>
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
					formatText TextName = who_won_text qs(0xa1726d11) d = <winner_text>
				elseif ((<percent> > 0.25) && (<percent> < 0.75))
					formatText TextName = who_won_text qs(0x277d87de) d = <winner_text>
				else
					formatText TextName = who_won_text qs(0xdb890271) d = <winner_text>
				endif
			endif
			CreateScreenElement {
				Type = TextBlockElement
				parent = newspaper_container
				just = [left bottom]
				internal_just = [left bottom]
				Pos = (270.0, 345.0)
				Scale = 0.7
				text = <who_won_text>
				font = fontgrid_text_a11
				rgba = <winner_color>
				dims = (350.0, 200.0)
				line_spacing = 0.85
				rot_angle = -7.5
			}
		endif
		displaySprite {
			parent = newspaper_container
			tex = <ss_logo>
			Pos = (158.0, 25.0)
		}
		displaySprite {
			parent = newspaper_container
			tex = <ss_sidebar>
			Pos = (858.0, 130.0)
		}
		GetUpperCaseString <song_title>
		CreateScreenElement {
			id = ss_song_title_text_block_id
			Type = TextBlockElement
			parent = newspaper_container
			just = [left top]
			internal_just = [left top]
			Pos = (270.0, 352.0)
			Scale = (0.55, 0.55)
			text = <UppercaseString>
			font = fontgrid_text_a11
			rgba = $g_ss_2p_song_title_whiteish
			dims = (400.0, 134.0)
			line_spacing = 0.85
			rot_angle = -7.5
			noshadow
		}
		get_song_artist song = <my_song>
		GetUpperCaseString <song_artist>
		<band_name> = <UppercaseString>
		GetScreenElementChildren \{id = ss_song_title_text_block_id}
		GetArraySize (<children>)
		if (<array_Size> = 1)
			<artist_pos> = (276.0, 386.0)
		else
			<artist_pos> = (280.0, 416.0)
		endif
		if ($g_ss_mag_number = 0 || $g_ss_mag_number = 1)
			<band_name_color> = $g_ss_offwhite
		else
			<band_name_color> = $g_ss_p1_orangeish
		endif
		CreateScreenElement {
			id = ss_artist_text_block_id
			Type = TextBlockElement
			parent = newspaper_container
			just = [left top]
			internal_just = [left top]
			Pos = <artist_pos>
			Scale = (0.45000002, 0.45000002)
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
			if (NetSessionFunc Obj = match func = get_gamertag)
				name_text_1 = <Name>
			endif
		endif
		formatText TextName = p1_difficulty_text qs(0xf49e223b) d = <difficulty_text> n = <name_text_1>
		displayText {
			parent = newspaper_container
			text = <p1_difficulty_text>
			Pos = (298.0, 522.0)
			Scale = (0.5, 0.55)
			font = fontgrid_text_a11
			rgba = $g_ss_p1_orangeish
			rot = -7.5
			noshadow
		}
		SetScreenElementProps id = <id> font_spacing = 2 space_spacing = 2
		get_difficulty_text_upper difficulty = ($player2_status.difficulty)
		name_text_2 = qs(0x33efd235)
		if ($is_network_game)
			name_text_2 = $opponent_gamertag
		endif
		formatText TextName = p2_difficulty_text qs(0xf49e223b) d = <difficulty_text> n = <name_text_2>
		displayText {
			parent = newspaper_container
			text = <p2_difficulty_text>
			Pos = (302.0, 552.0)
			Scale = (0.5, 0.55)
			font = fontgrid_text_a11
			rgba = $g_ss_p2_violetish
			rot = -7.5
			noshadow
		}
		SetScreenElementProps id = <id> font_spacing = 2 space_spacing = 2
		displaySprite {
			parent = newspaper_container
			tex = <ss_logo_sm>
			Pos = (946.0, 86.0)
		}
		<p1_stats_pos> = (668.0, 260.0)
		<p2_stats_pos> = (864.0, 260.0)
		displaySprite {
			id = np_circle_1
			parent = newspaper_container
			tex = 2p_song_summary_circle
			Pos = (<p1_stats_pos> + (61.0, 61.0))
			rgba = $g_ss_p1_orangeish
			rot_angle = 180
			z = 8
		}
		displaySprite {
			id = np_circle_2
			parent = newspaper_container
			tex = 2p_song_summary_circle
			Pos = <p2_stats_pos>
			rgba = $g_ss_p2_violetish
			z = 8
		}
		displayText {
			parent = newspaper_container
			text = qs(0x22ee76e7)
			Pos = (<p1_stats_pos> + (23.0, 3.0))
			Scale = (0.9, 0.6)
			font = fontgrid_text_a11
			rgba = $g_ss_2p_song_title_whiteish
			z = 9
		}
		displayText {
			parent = newspaper_container
			text = qs(0x09c32524)
			Pos = (<p2_stats_pos> + (21.0, 3.0))
			Scale = (0.9, 0.6)
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
			displaySprite {
				id = np_left_wing
				parent = newspaper_container
				tex = 2p_song_summary_wing
				Pos = <l_wing_pos>
				z = 7
			}
			displaySprite {
				id = np_right_wing
				parent = newspaper_container
				tex = 2p_song_summary_wing_flipped
				Pos = <r_wing_pos>
				z = 7
			}
			if (<winner> = qs(0x22ee76e7))
				displaySprite {
					parent = newspaper_container
					tex = 2p_song_summary_guitar_winner
					Pos = (<p1_stats_pos> + (46.0, 0.0))
					z = 6
				}
				displaySprite {
					parent = newspaper_container
					tex = 2p_song_summary_guitar_loser
					Pos = (<p2_stats_pos> + (-44.0, 0.0))
					flip_v
					z = 6
				}
			else
				displaySprite {
					parent = newspaper_container
					tex = 2p_song_summary_guitar_winner
					Pos = (<p2_stats_pos> + (-110.0, 0.0))
					flip_v
					z = 6
				}
				displaySprite {
					parent = newspaper_container
					tex = 2p_song_summary_guitar_loser
					Pos = (<p1_stats_pos> + (44.0, 0.0))
					z = 6
				}
			endif
		endif
		displaySprite {
			id = ss_p1_note_streak_fill
			parent = newspaper_container
			tex = Song_Summary_Notestreak_Fill
			Pos = (<p1_stats_pos> + (-8.0, 44.0))
			rgba = <ss_notestreak_fill_color>
		}
		displaySprite {
			id = ss_p2_note_streak_fill
			parent = newspaper_container
			tex = Song_Summary_Notestreak_Fill
			Pos = (<p2_stats_pos> + (61.0, 174.0))
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
		displayText {
			id = ss_p1_note_streak
			parent = newspaper_container
			text = <p1_note_streak_text>
			Pos = <ss_p1_notestreak_pos>
			Scale = <ss_notestreak_scale>
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_notestreak_color>
			noshadow
		}
		displayText {
			id = ss_p1_note_streak_text
			parent = newspaper_container
			text = qs(0xde3b3448)
			just = [center center]
			Pos = (<p1_stats_pos> + (52.0, 130.0))
			Scale = (0.55, 0.7)
			font = fontgrid_text_a11
			z = 4
			rgba = <ss_notestreak_text_color>
			noshadow
		}
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = ss_p1_note_streak_text dims = ((90.0, 0.0) + (0.0, 1.0) * <height>) Pos = (<p1_stats_pos> + (52.0, 130.0)) start_x_scale = 0.55 start_y_scale = 0.7 only_if_larger_x = 1
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
		displayText {
			id = ss_p2_note_streak
			parent = newspaper_container
			text = <p2_note_streak_text>
			Pos = <ss_p2_notestreak_pos>
			Scale = <ss_notestreak_scale>
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_notestreak_color>
			noshadow
		}
		displayText {
			id = ss_p2_note_streak_text
			parent = newspaper_container
			text = qs(0xde3b3448)
			just = [center center]
			Pos = (<p2_stats_pos> + (-2.0, 130.0))
			Scale = (0.55, 0.7)
			font = fontgrid_text_a11
			z = 4
			rgba = <ss_notestreak_text_color>
			noshadow
		}
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = ss_p2_note_streak_text dims = ((90.0, 0.0) + (0.0, 1.0) * <height>) Pos = (<p2_stats_pos> + (-2.0, 130.0)) start_x_scale = 0.55 start_y_scale = 0.7 only_if_larger_x = 1
		if NOT ($g_ss_mag_number = 7)
			displaySprite {
				id = ss_p1_score_fill
				parent = newspaper_container
				tex = 2p_song_summary_score_bg
				Pos = (<p1_stats_pos> + (-12.0, 160.0))
				rgba = <ss_score_color>
			}
			displaySprite {
				id = ss_p2_score_fill
				parent = newspaper_container
				tex = 2p_song_summary_score_bg
				Pos = (<p2_stats_pos> + (54.0, 192.0))
				rgba = <ss_score_color>
				rot_angle = 181
			}
		else
			displaySprite {
				id = ss_p1_score_fill
				parent = newspaper_container
				tex = 2p_song_summary_score_bg
				Pos = (<p1_stats_pos> + (-12.0, 160.0))
				rgba = $g_ss_HELL_darker_reddish
			}
			displaySprite {
				id = ss_p2_score_fill
				parent = newspaper_container
				tex = 2p_song_summary_score_bg
				Pos = (<p2_stats_pos> + (54.0, 192.0))
				rgba = $g_ss_HELL_darker_reddish
				rot_angle = 181
			}
		endif
		displayText {
			id = ss_p1_score_text
			parent = newspaper_container
			text = qs(0x302c47e0)
			Pos = (<p1_stats_pos> + (10.0, 155.0))
			Scale = (0.7, 0.5)
			font = fontgrid_text_a11
			z = 4
			rgba = $g_ss_2p_song_title_whiteish
			noshadow
			rot = -2
		}
		displayText {
			id = ss_p2_score_text
			parent = newspaper_container
			text = qs(0x302c47e0)
			Pos = (<p2_stats_pos> + (-50.0, 155.0))
			Scale = (0.7, 0.5)
			font = fontgrid_text_a11
			z = 4
			rgba = $g_ss_2p_song_title_whiteish
			noshadow
			rot = -2
		}
		displayText {
			id = ss_p1_score
			parent = newspaper_container
			text = <p1_score_text>
			just = [center center]
			Pos = (<p1_stats_pos> + (48.0, 200.0))
			Scale = (0.8, 1.0)
			font = fontgrid_text_a8
			rgba = <ss_score_color>
			z = 3
			noshadow
		}
		displayText {
			id = ss_p2_score
			parent = newspaper_container
			text = <p2_score_text>
			just = [center center]
			Pos = (<p2_stats_pos> + (-12.0, 200.0))
			Scale = (0.8, 1.0)
			font = fontgrid_text_a8
			rgba = <ss_score_color>
			z = 3
			noshadow
		}
		formatText TextName = p1_notes_hit qs(0x76b3fda7) d = <p1_percent_complete>
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
		displayText {
			id = ss_p1_notes_hit
			parent = newspaper_container
			text = <p1_notes_hit>
			Pos = <ss_percent_pos>
			Scale = <ss_percent_scale>
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		formatText TextName = p2_notes_hit qs(0x76b3fda7) d = <p2_percent_complete>
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
		displayText {
			id = ss_p2_notes_hit
			parent = newspaper_container
			text = <p2_notes_hit>
			Pos = <ss_percent_pos>
			Scale = <ss_percent_scale>
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		displayText {
			id = ss_p1_percent_sign
			parent = newspaper_container
			text = qs(0x0c40a1b2)
			Pos = (<p1_stats_pos> + (60.0, 226.0))
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_percent_color>
			rot = 50
			Scale = (0.7, 0.5)
			noshadow
		}
		displayText {
			id = ss_p1_notes_text
			parent = newspaper_container
			text = qs(0xdc574f01)
			Pos = (<p1_stats_pos> + (66.0, 232.0))
			Scale = (0.4, 0.7)
			font = fontgrid_text_a3
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		SetScreenElementProps id = <id> font_spacing = 4
		fit_text_in_rectangle id = ss_p1_notes_text dims = (38.0, 30.0) Pos = (<p1_stats_pos> + (66.0, 232.0)) start_x_scale = 0.4 start_y_scale = 0.7 only_if_larger_x = 1
		displayText {
			id = ss_p1_hit_text
			parent = newspaper_container
			text = qs(0xf336345a)
			Pos = (<p1_stats_pos> + (67.0, 257.0))
			Scale = (0.4, 0.6)
			font = fontgrid_text_a3
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		SetScreenElementProps id = <id> font_spacing = 6
		fit_text_in_rectangle id = ss_p1_hit_text dims = (38.0, 30.0) Pos = (<p1_stats_pos> + (67.0, 257.0)) start_x_scale = 0.4 start_y_scale = 0.6 only_if_larger_x = 1
		displayText {
			id = ss_p2_percent_sign
			parent = newspaper_container
			text = qs(0x0c40a1b2)
			Pos = (<p2_stats_pos> + (-12.0, 226.0))
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_percent_color>
			rot = 50
			Scale = (0.7, 0.5)
			noshadow
		}
		displayText {
			id = ss_p2_notes_text
			parent = newspaper_container
			text = qs(0xdc574f01)
			Pos = (<p2_stats_pos> + (-6.0, 232.0))
			Scale = (0.4, 0.7)
			font = fontgrid_text_a3
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		SetScreenElementProps id = <id> font_spacing = 4
		fit_text_in_rectangle id = ss_p2_notes_text dims = (45.0, 30.0) Pos = (<p2_stats_pos> + (-6.0, 232.0)) start_x_scale = 0.4 start_y_scale = 0.7 only_if_larger_x = 1
		displayText {
			id = ss_p2_hit_text
			parent = newspaper_container
			text = qs(0xf336345a)
			Pos = (<p2_stats_pos> + (-5.0, 257.0))
			Scale = (0.4, 0.6)
			font = fontgrid_text_a3
			z = 4
			rgba = <ss_percent_color>
			noshadow
		}
		SetScreenElementProps id = <id> font_spacing = 6
		fit_text_in_rectangle id = ss_p2_hit_text dims = (45.0, 30.0) Pos = (<p2_stats_pos> + (-5.0, 257.0)) start_x_scale = 0.4 start_y_scale = 0.6 only_if_larger_x = 1
		if (<winner> = qs(0x22ee76e7))
			displaySprite {
				id = np_icon_thumb
				parent = newspaper_container
				tex = 2p_song_summary_icon_winner
				Pos = (<p1_stats_pos> + (46.0, 330.0))
				rgba = $g_ss_p1_orangeish
				just = [center center]
				dims = (64.0, 64.0)
			}
			displaySprite {
				id = np_icon_skull
				parent = newspaper_container
				tex = 2p_song_summary_icon_loser
				Pos = (<p2_stats_pos> + (-55.0, 294.0))
				rgba = $g_ss_p2_violetish
				dims = (64.0, 64.0)
			}
		elseif (<winner> = qs(0x09c32524))
			displaySprite {
				id = np_icon_thumb
				parent = newspaper_container
				tex = 2p_song_summary_icon_winner
				Pos = (<p2_stats_pos> + (-16.0, 320.0))
				rgba = $g_ss_p2_violetish
				just = [center center]
				dims = (64.0, 64.0)
				flip_v
			}
			displaySprite {
				id = np_icon_skull
				parent = newspaper_container
				tex = 2p_song_summary_icon_loser
				Pos = (<p1_stats_pos> + (22.0, 294.0))
				rgba = $g_ss_p1_orangeish
				dims = (64.0, 64.0)
				flip_v
			}
		endif
		if NOT (<winner> = qs(0x3bf547a6))
			<i> = 1
			begin
			formatText checksumName = hilite_id 'ss_hilite%d_p%p' d = <i> p = <win_sqs>
			if (<i> = 3)
				<i> = 2
			endif
			formatText checksumName = hilite_tex 'Char_Select_Hilite%d' d = <i>
			<hilite_rgba> = [200 90 40 255]
			<hilite_pos> = (<p1_stats_pos> + (46.0, 330.0))
			if (<win_sqs> = '2')
				<hilite_rgba> = [180 130 220 255]
				<hilite_pos> = (<p2_stats_pos> + (-16.0, 320.0))
			endif
			displaySprite {
				id = <hilite_id>
				parent = newspaper_container
				Pos = <hilite_pos>
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
		displaySprite \{parent = newspaper_container
			tex = magazine1_viewport
			dims = (640.0, 640.0)
			Pos = (175.0, -10.0)
			z = -1}
		if NOT (<winner> = qs(0x3bf547a6))
			SpawnScriptNow \{np_2p_flap_wings}
			SpawnScriptNow \{np_2p_thumb_zoom}
			SpawnScriptNow np_2p_fade_to_grey params = {winner = <winner>}
		endif
		if (<winner> = qs(0x22ee76e7))
			SpawnScriptNow \{np_2p_hilites_p1}
		elseif (<winner> = qs(0x09c32524))
			SpawnScriptNow \{np_2p_hilites_p2}
		endif
	else
		if ($is_network_game)
			create_menu_backdrop \{texture = Newspaper_BG
				BlendMode = blend}
		else
			if NOT ($g_ss_mag_number = 7)
				create_menu_backdrop \{texture = song_summary_bg
					BlendMode = blend}
			else
				create_menu_backdrop \{texture = Song_Summary_BG_HELL
					BlendMode = blend}
			endif
		endif
		switch $g_ss_mag_number
			case 0
			<ss_logo> = Song_Summary_Logo_BACKYARD
			<ss_sidebar> = Song_Summary_Sidebar_BACKYARD
			<ss_percent_fill> = Song_Summary_Percent_Fill_BACKYARD
			<ss_percent_color> = $g_ss_black
			<ss_star_good_color> = $g_ss_offwhite
			<ss_star_bad_color> = [100 100 100 255]
			<ss_score_fill_L_color> = $g_ss_black
			<ss_score_color> = $g_ss_offwhite
			<ss_score_fill_R_color> = $g_ss_offwhite
			<ss_score_text_color> = $g_ss_black
			<ss_notestreak_fill_color> = $g_ss_offwhite
			<ss_notestreak_color> = $g_ss_black
			<ss_notestreak_text_color> = $g_ss_black
			case 1
			<ss_logo> = Song_Summary_Logo_BAR
			<ss_sidebar> = Song_Summary_Sidebar_BAR
			<ss_percent_fill> = Song_Summary_Percent_Fill_BAR
			<ss_percent_color> = $g_ss_black
			<ss_star_good_color> = $g_ss_offwhite
			<ss_star_bad_color> = [100 100 100 255]
			<ss_score_fill_L_color> = $g_ss_black
			<ss_score_color> = $g_ss_offwhite
			<ss_score_fill_R_color> = $g_ss_GP_greyish
			<ss_score_text_color> = $g_ss_offwhite
			<ss_notestreak_fill_color> = $g_ss_GP_greyish
			<ss_notestreak_color> = $g_ss_offwhite
			<ss_notestreak_text_color> = $g_ss_offwhite
			case 2
			<ss_logo> = Song_Summary_Logo_Paste
			<ss_sidebar> = Song_Summary_Sidebar_Paste
			<ss_percent_fill> = Song_Summary_Percent_Fill_Paste
			<ss_percent_color> = $g_ss_Paste_beigeish
			<ss_star_good_color> = $g_ss_Paste_brownish
			<ss_star_bad_color> = $g_ss_offwhite
			<ss_score_fill_L_color> = $g_ss_Paste_beigeish
			<ss_score_color> = $g_ss_Paste_maroonish
			<ss_score_fill_R_color> = $g_ss_Paste_brownish
			<ss_score_text_color> = $g_ss_Paste_beigeish
			<ss_notestreak_fill_color> = $g_ss_Paste_beigeish
			<ss_notestreak_color> = $g_ss_Paste_maroonish
			<ss_notestreak_text_color> = $g_ss_Paste_brownish
			case 3
			<ss_logo> = Song_Summary_Logo_Decibel
			<ss_sidebar> = Song_Summary_Sidebar_Decibel
			<ss_percent_fill> = Song_Summary_Percent_Fill_Decibel
			<ss_percent_color> = $g_ss_decibel_magentaish
			<ss_star_good_color> = $g_ss_orangeish
			<ss_star_bad_color> = $g_ss_offwhite
			<ss_score_fill_L_color> = $g_ss_black
			<ss_score_color> = $g_ss_decibel_yellowish
			<ss_score_fill_R_color> = $g_ss_decibel_greenish
			<ss_score_text_color> = $g_ss_decibel_magentaish
			<ss_notestreak_fill_color> = $g_ss_decibel_greenish
			<ss_notestreak_color> = $g_ss_decibel_magentaish
			<ss_notestreak_text_color> = $g_ss_black
			case 4
			<ss_logo> = Song_Summary_Logo_AP
			<ss_sidebar> = Song_Summary_Sidebar_AP
			<ss_percent_fill> = Song_Summary_Percent_Fill_AP
			<ss_percent_color> = $g_ss_AP_yellowish
			<ss_star_good_color> = $g_ss_AP_reddish
			<ss_star_bad_color> = $g_ss_offwhite
			<ss_score_fill_L_color> = $g_ss_AP_blueish
			<ss_score_color> = $g_ss_AP_yellowish
			<ss_score_fill_R_color> = $g_ss_AP_reddish
			<ss_score_text_color> = $g_ss_AP_yellowish
			<ss_notestreak_fill_color> = $g_ss_AP_reddish
			<ss_notestreak_color> = $g_ss_AP_yellowish
			<ss_notestreak_text_color> = $g_ss_AP_yellowish
			case 5
			<ss_logo> = Song_Summary_Logo_Kerrang
			<ss_sidebar> = Song_Summary_Sidebar_Kerrang
			<ss_percent_fill> = Song_Summary_Percent_Fill_Kerrang
			<ss_percent_color> = $g_ss_offwhite
			<ss_star_good_color> = $g_ss_orangeish
			<ss_star_bad_color> = $g_ss_offwhite
			<ss_score_fill_L_color> = $g_ss_black
			<ss_score_color> = $g_ss_offwhite
			<ss_score_fill_R_color> = $g_ss_offwhite
			<ss_score_text_color> = $g_ss_black
			<ss_notestreak_fill_color> = $g_ss_black
			<ss_notestreak_color> = $g_ss_offwhite
			<ss_notestreak_text_color> = $g_ss_offwhite
			case 6
			<ss_logo> = Song_Summary_Logo_GPlayer
			<ss_sidebar> = Song_Summary_Sidebar_GPlayer
			<ss_percent_fill> = Song_Summary_Percent_Fill_GPlayer
			<ss_percent_color> = $g_ss_GP_blueish
			<ss_star_good_color> = $g_ss_orangeish
			<ss_star_bad_color> = $g_ss_offwhite
			<ss_score_fill_L_color> = $g_ss_GP_blueish
			<ss_score_color> = $g_ss_offwhite
			<ss_score_fill_R_color> = $g_ss_GP_greyish
			<ss_score_text_color> = $g_ss_offwhite
			<ss_notestreak_fill_color> = $g_ss_offwhite
			<ss_notestreak_color> = $g_ss_GP_blueish
			<ss_notestreak_text_color> = $g_ss_GP_greyish
			case 7
			<ss_logo> = Song_Summary_Logo_HELL
			<ss_sidebar> = Song_Summary_Sidebar_HELL
			<ss_percent_fill> = Song_Summary_Percent_Fill_HELL
			<ss_percent_color> = $g_ss_HELL_darker_reddish
			<ss_star_good_color> = $g_ss_orangeish
			<ss_star_bad_color> = $g_ss_offwhite
			<ss_score_fill_L_color> = $g_ss_black
			<ss_score_color> = $g_ss_HELL_lighter_reddish
			<ss_score_fill_R_color> = $g_ss_HELL_darker_reddish
			<ss_score_text_color> = $g_ss_black
			<ss_notestreak_fill_color> = $g_ss_HELL_darker_reddish
			<ss_notestreak_color> = $g_ss_black
			<ss_notestreak_text_color> = $g_ss_black
		endswitch
		displaySprite {
			parent = newspaper_container
			tex = <ss_logo>
			Pos = (158.0, 25.0)
		}
		displaySprite {
			parent = newspaper_container
			tex = <ss_sidebar>
			Pos = (858.0, 130.0)
		}
		get_song_artist song = <my_song>
		GetUpperCaseString <song_artist>
		<band_name> = <UppercaseString>
		song_internal_scale = 1.0
		StringLength string = <song_title>
		if (<str_len> >= 19)
			<song_internal_scale> = 0.75
		endif
		mypos = (262.0, 345.0)
		CreateScreenElement {
			id = ss_song_title_text_block_id
			Type = TextBlockElement
			parent = newspaper_container
			just = [left bottom]
			internal_just = [left bottom]
			Pos = <mypos>
			Scale = 0.75
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
		CreateScreenElement {
			id = ss_artist_text_block_id
			Type = TextBlockElement
			parent = newspaper_container
			just = [left top]
			internal_just = [left top]
			Pos = <artist_pos>
			Scale = (0.5, 0.55)
			text = <band_name>
			font = fontgrid_text_a8
			rgba = <band_name_color>
			dims = (400.0, 134.0)
			line_spacing = 0.85
			rot_angle = -7.5
		}
		displaySprite {
			parent = newspaper_container
			tex = <ss_percent_fill>
			Pos = (267.0, 460.0)
			dims = (336.0, 168.0)
		}
		formatText TextName = p1_notes_hit qs(0x76b3fda7) d = <p1_percent_complete>
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
		displayText {
			parent = newspaper_container
			text = <p1_notes_hit>
			Pos = <ss_percent_pos>
			Scale = <ss_percent_scale>
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_percent_color>
			rot = -10
			noshadow
		}
		displayText {
			parent = newspaper_container
			text = qs(0x0c40a1b2)
			Pos = (364.0, 500.0)
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_percent_color>
			rot = -10
			noshadow
		}
		if NOT ($g_ss_mag_number = 7)
			<np_notes_hit_color> = $g_ss_black
		else
			<np_notes_hit_color> = $g_ss_HELL_lighter_reddish
		endif
		displayText {
			parent = newspaper_container
			text = qs(0x01d1caa9)
			Pos = (403.0, 522.0)
			Scale = (0.44, 0.7)
			font = fontgrid_text_a3
			z = 4
			rgba = <np_notes_hit_color>
			rot = -10
			noshadow
		}
		SetScreenElementProps id = <id> font_spacing = 6 space_spacing = 1
		GetScreenElementDims id = <id>
		if (<width> > 79)
			SetScreenElementProps id = <id> Scale = 1
			fit_text_in_rectangle id = <id> dims = (66.0, 35.0) Pos = (403.0, 522.0)
		endif
		displaySprite {
			parent = newspaper_container
			tex = Song_Summary_Score_Fill_L
			Pos = (674.0, 90.0)
			rgba = <ss_score_fill_L_color>
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
				displaySprite {
					parent = newspaper_container
					Pos = (<star_pos> + <star_offset>)
					Scale = 0.65000004
					tex = Song_Summary_Score_Star
					z = 4
					rgba = <star_color>
					rot_angle = <star_rot>
				}
				<i> = (<i> + 1)
				<star_pos> = (<star_pos> + <star_add>)
				repeat 5
			endif
			displayText {
				id = np_score_text
				parent = newspaper_container
				text = <p1_score_text>
				just = [right center]
				Pos = (926.0, 116.0)
				Scale = (0.9, 0.65000004)
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
			displayText {
				parent = newspaper_container
				just = [left bottom]
				text = <difficulty_text>
				Pos = (946.0, 133.0)
				Scale = (0.7, 0.6)
				font = fontgrid_text_a11
				z = 4
				rgba = <ss_score_text_color>
				noshadow
			}
			SetScreenElementProps id = <id> font_spacing = 3
			fit_text_in_rectangle id = <id> dims = (100.0, 100.0) only_if_larger_x = 1 keep_ar = 1 start_x_scale = 0.7 start_y_scale = 0.6 debug_me
		else
			notes_hit = ($player1_status.notes_hit)
			notes_total = ($player1_status.total_notes)
			formatText TextName = notes_hit_out_of_total qs(0x9a622f4e) a = <notes_hit> b = <notes_total>
			displayText {
				id = np_score_text
				parent = newspaper_container
				text = <notes_hit_out_of_total>
				just = [right center]
				Pos = (911.0, 117.0)
				Scale = (0.9, 0.65000004)
				font = fontgrid_text_a8
				rgba = <ss_score_color>
				z = 3
				noshadow
				rot = -2
			}
			GetScreenElementDims id = <id>
			SetScreenElementProps id = <id> Scale = (0.9, 0.65000004)
			fit_text_in_rectangle id = <id> dims = ((200.0, 0.0) + <height> * (0.0, 0.65000004))
			displayText {
				parent = newspaper_container
				text = qs(0xc6f89ca2)
				Pos = (946.0, 98.0)
				Scale = (0.7, 0.6)
				font = fontgrid_text_a11
				z = 4
				rgba = <ss_score_text_color>
				noshadow
			}
			GetScreenElementDims id = <id>
			SetScreenElementProps id = <id> Scale = (0.7, 0.6)
			fit_text_in_rectangle id = <id> dims = ((70.0, 0.0) + <height> * (0.0, 0.6))
		endif
		displaySprite {
			parent = newspaper_container
			tex = Song_Summary_Score_Fill_R
			Pos = (934.0, 83.0)
			rgba = <ss_score_fill_R_color>
			dims = (134.0, 67.0)
		}
		displaySprite {
			parent = newspaper_container
			tex = Song_Summary_Notestreak_Fill
			Pos = (719.0, 359.0)
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
		displayText {
			parent = newspaper_container
			text = <p1_note_streak_text>
			Pos = <ss_notestreak_pos>
			Scale = <ss_notestreak_scale>
			font = fontgrid_text_a8
			z = 4
			rgba = <ss_notestreak_color>
			noshadow
		}
		displayText {
			parent = newspaper_container
			text = qs(0xde3b3448)
			Pos = (732.0, 425.0)
			Scale = (0.44, 0.55)
			font = fontgrid_text_a11
			z = 4
			rgba = <ss_notestreak_text_color>
			noshadow
		}
		SetScreenElementProps id = <id> font_spacing = 5 space_spacing = 3 Scale = 1
		fit_text_in_rectangle id = <id> dims = (80.0, 35.0) Pos = (732.0, 425.0)
		outfit = ($player1_status.outfit)
		style = ($player1_status.style)
		displaySprite \{parent = newspaper_container
			tex = magazine1_viewport
			dims = (640.0, 640.0)
			Pos = (175.0, -10.0)
			z = -1}
	endif
	if ($is_network_game)
		np_net_create_options_menu Pos = (770.0, 460.0) rot = <rot> Scale = 1 for_practice = <for_practice> show_replay = <show_replay> replay_flow_params = <replay_flow_params>
	elseif ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p1_quickplay || $game_mode = p2_quickplay)
		np_create_options_menu Pos = (770.0, 460.0) rot = <rot> Scale = 1 for_practice = <for_practice> show_replay = <show_replay> replay_flow_params = <replay_flow_params>
	else
		np_create_options_menu Pos = (770.0, 360.0) rot = <rot> Scale = 1 for_practice = <for_practice> show_replay = <show_replay> replay_flow_params = <replay_flow_params>
	endif
	get_song_struct song = <my_song>
	if ((StructureContains structure = <song_struct> boss) || $game_mode = p2_battle)
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
	if (($is_network_game) && (isXenon))
		add_user_control_helper \{text = qs(0x9a7d1fe5)
			button = start
			z = 100}
	endif
	if ($is_network_game = 1)
		add_user_control_helper \{text = qs(0x87251a1f)
			button = yellow
			z = 100}
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
	KillSpawnedScript \{Name = np_2p_flap_wings}
	KillSpawnedScript \{Name = np_2p_thumb_zoom}
	KillSpawnedScript \{Name = np_2p_fade_to_grey}
	KillSpawnedScript \{Name = np_2p_hilites_p1}
	KillSpawnedScript \{Name = np_2p_hilites_p2}
	destroy_menu \{menu_id = newspaper_scroll}
	destroy_menu \{menu_id = newspaper_container}
	destroy_menu_backdrop
	net_destroy_newspaper_menu
	Change \{g_np_options_index = 0}
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
	start_pos = <Pos>
	CreateScreenElement {
		Type = ContainerElement
		parent = <parent>
		id = np_scroll_text_container
		Pos = (0.0, 0.0)
	}
	num = 0
	formatText checksumName = nID '%d' d = <num>
	displayText id = <nID> parent = np_scroll_text_container Pos = <Pos> Scale = 1 font = <font> text = <band_name> rgba = <band_rgba>
	GetScreenElementDims id = <nID>
	band_width = <width>
	<num> = (<num> + 1)
	formatText checksumName = nID '%d' d = <num>
	<Pos> = (<Pos> + (1.0, 0.0) * <band_width>)
	displayText id = <nID> parent = np_scroll_text_container Pos = <Pos> Scale = 1 font = <font> text = <song_name> rgba = <song_rgba>
	GetScreenElementDims id = <nID>
	song_width = <width>
	end_pos = (<start_pos> - ((<band_width> + <song_width>) * (1.0, 0.0)))
	multi = (<blockWidth> / (<band_width> + <song_width>))
	if NOT (<multi>)
		<multi> = 1
	endif
	onband = 1
	if (<multi>)
		begin
		if (<onband>)
			<Pos> = (<Pos> + ((1.0, 0.0) * <song_width>))
			<num> = (<num> + 1)
			formatText checksumName = nID '%d' d = <num>
			displayText id = <nID> parent = np_scroll_text_container Pos = <Pos> Scale = 1 font = <font> text = <band_name> rgba = <band_rgba>
			<onband> = 0
		else
			<Pos> = (<Pos> + ((1.0, 0.0) * <band_width>))
			<num> = (<num> + 1)
			formatText checksumName = nID '%d' d = <num>
			displayText id = <nID> parent = np_scroll_text_container Pos = <Pos> Scale = 1 font = <font> text = <song_name> rgba = <song_rgba>
			<onband> = 1
		endif
		repeat (<multi> * 2)
	endif
	begin
	legacydoscreenelementmorph id = np_scroll_text_container Pos = <end_pos> time = <time>
	Wait <time> Seconds
	SetScreenElementProps id = np_scroll_text_container Pos = <start_pos>
	repeat
endscript

script np_create_text \{Pos = (200.0, 200.0)
		rot = 0
		text = qs(0x5e45925d)
		parent = newspaper_container
		Scale = 1
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
	if GotParam \{dims}
		CreateScreenElement {
			Type = TextBlockElement
			parent = <parent>
			just = <just>
			internal_just = <internal_just>
			Pos = <Pos>
			rot_angle = <rot>
			Scale = <Scale>
			text = <text>
			font = fontgrid_title_a1
			rgba = <rgba>
			z_priority = 3
			dims = <dims>
		}
	else
		CreateScreenElement {
			Type = TextElement
			parent = <parent>
			just = <just>
			internal_just = <internal_just>
			Pos = <Pos>
			rot_angle = <rot>
			Scale = <Scale>
			text = <text>
			font = fontgrid_title_a1
			rgba = <rgba>
			z_priority = 3
		}
	endif
endscript

script np_create_options_menu \{Pos = (600.0, 300.0)
		rot = 0
		Scale = 0.8
		menu_font = fontgrid_text_a11
		for_practice = 0}
	SetScreenElementProps id = newspaper_scroll Pos = <Pos>
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
		displayText id = np_option_0 parent = newspaper_container text = qs(0x182f0173) Pos = (($g_np_option_props [4].Pos) + <menu_offset>) Scale = (0.85, 0.7) rot = ($g_np_option_props [4].rot) font = <menu_font> noshadow
		displayText id = np_option_1 parent = newspaper_container text = qs(0xb8790f2f) Pos = (($g_np_option_props [5].Pos) + <menu_offset>) Scale = (0.8, 0.7) rot = ($g_np_option_props [5].rot) font = <menu_font> noshadow
		displayText id = np_option_2 parent = newspaper_container text = qs(0xcc2da18b) Pos = (($g_np_option_props [6].Pos) + <menu_offset>) Scale = (0.8, 0.7) rot = ($g_np_option_props [6].rot) font = <menu_font> noshadow
		displayText id = np_option_3 parent = newspaper_container text = qs(0x68bd3039) Pos = (($g_np_option_props [7].Pos) + <menu_offset>) Scale = (0.8, 0.7) rot = ($g_np_option_props [7].rot) font = <menu_font> noshadow
		displayText id = np_option_4 parent = newspaper_container text = qs(0x67d9c56d) Pos = (($g_np_option_props [8].Pos) + <menu_offset>) Scale = (0.8, 0.7) rot = ($g_np_option_props [8].rot) font = <menu_font> noshadow
		retail_menu_unfocus \{id = np_option_4}
		<initial_hl_pos> = (($g_np_option_props [4].Pos) + ($g_np_option_props [4].offset) + <menu_offset>)
	else
		displayText id = np_option_0 parent = newspaper_container text = qs(0x182f0173) Pos = (($g_np_option_props [0].Pos) + <menu_offset>) Scale = (0.85, 0.7) rot = ($g_np_option_props [0].rot) font = <menu_font> noshadow
		SetScreenElementProps id = <id> font_spacing = 2 space_spacing = 4
		if NOT ($end_credits = 1)
			if (<show_replay> = 1)
				displayText id = np_option_1 parent = newspaper_container text = qs(0x647b5a84) Pos = (($g_np_option_props [1].Pos) + <menu_offset>) Scale = (0.8, 0.7) rot = ($g_np_option_props [1].rot) font = <menu_font> noshadow
				SetScreenElementProps id = <id> font_spacing = 2 space_spacing = 4
				displayText id = np_option_2 parent = newspaper_container text = qs(0x3f11367e) Pos = (($g_np_option_props [2].Pos) + <menu_offset>) Scale = (0.8, 0.7) rot = ($g_np_option_props [2].rot) font = <menu_font> noshadow
				SetScreenElementProps id = <id> font_spacing = 2 space_spacing = 4
			else
				displayText id = np_option_1 parent = newspaper_container text = qs(0x3f11367e) Pos = (($g_np_option_props [1].Pos) + <menu_offset>) Scale = (0.8, 0.7) rot = ($g_np_option_props [2].rot) font = <menu_font> noshadow
				SetScreenElementProps id = <id> font_spacing = 2 space_spacing = 4
			endif
		endif
		<initial_hl_pos> = (($g_np_option_props [0].Pos) + ($g_np_option_props [0].offset) + <menu_offset>)
	endif
	if ($guitar_motion_enable_test = 1)
		DestroyScreenElement \{id = guitar_motion_performance_menu}
		CreateScreenElement \{id = guitar_motion_performance_menu
			parent = newspaper_container
			Type = VMenu
			Pos = (700.0, 300.0)
			just = [
				top
				left
			]
			internal_just = [
				top
				left
			]
			z_priority = 100}
		DestroyScreenElement \{id = guitar_motion_performance_menu_bg}
		CreateScreenElement \{id = guitar_motion_performance_menu_bg
			parent = newspaper_container
			Type = SpriteElement
			dims = (400.0, 250.0)
			Pos = (700.0, 300.0)
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
		CreateScreenElement \{parent = guitar_motion_performance_menu
			Type = TextElement
			dims = (100.0, 10.0)
			text = qs(0xf8a08c25)
			font = fontgrid_text_a8
			just = [
				top
				left
			]
			Scale = (0.8, 0.65000004)
			rgba = [
				240
				240
				0
				255
			]
			allow_expansion}
		ForEachIn \{$guitar_motions_test_performed
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
		<ss_menu_icon> = Song_Summary_Menu_Icon_BACKYARD
		case 1
		<ss_hilite_color> = [109 76 44 255]
		<ss_menu_icon> = Song_Summary_Menu_Icon_BAR
		case 2
		<ss_hilite_color> = $g_ss_Paste_brownish
		<ss_menu_icon> = Song_Summary_Menu_Icon_Paste
		case 3
		<ss_hilite_color> = $g_ss_decibel_magentaish
		<ss_menu_icon> = Song_Summary_Menu_Icon_Decibel
		case 4
		<ss_hilite_color> = $g_ss_AP_blueish
		<ss_menu_icon> = Song_Summary_Menu_Icon_AP
		case 5
		<ss_hilite_color> = $g_ss_Kerrang_reddish
		<ss_menu_icon> = Song_Summary_Menu_Icon_Kerrang
		case 6
		<ss_hilite_color> = $g_ss_GP_blueish
		<ss_menu_icon> = Song_Summary_Menu_Icon_GPlayer
		case 7
		<ss_hilite_color> = $g_ss_HELL_darker_reddish
		<ss_menu_icon> = Song_Summary_Menu_Icon_HELL
	endswitch
	displaySprite {
		id = ss_menu_hilite_id
		parent = newspaper_container
		tex = Song_Summary_Menu_Hilite
		Pos = <initial_hl_pos>
		rgba = <ss_hilite_color>
		rot_angle = (($g_np_option_props [$g_np_options_index].rot) + 0.5)
		dims = (320.0, 40.0)
		z = 1
	}
	displaySprite {
		id = ss_menu_icon_id
		parent = newspaper_container
		tex = <ss_menu_icon>
		Pos = (<initial_hl_pos> + ($g_np_menu_icon_offset))
		rot_angle = ($g_np_option_props [$g_np_options_index].rot)
		dims = (80.0, 80.0)
		z = 3
	}
	if (<for_practice> = 1)
		continue_handlers = [
			{focus retail_menu_focus}
			{focus SetScreenElementProps params = {id = np_option_0 Shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
			{unfocus retail_menu_unfocus}
			{unfocus SetScreenElementProps params = {id = np_option_0 no_shadow}}
			{pad_choose generic_event_back params = {state = uistate_setlist no_jamsession}}
		]
		CreateScreenElement {
			Type = TextElement
			parent = current_menu
			font = <menu_font>
			event_handlers = <continue_handlers>
		}
		CreateScreenElement {
			Type = TextElement
			parent = current_menu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus SetScreenElementProps params = {id = np_option_1 Shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus SetScreenElementProps params = {id = np_option_1 no_shadow}}
				{pad_choose practice_restart_song}
			]
		}
		CreateScreenElement {
			Type = TextElement
			parent = current_menu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus SetScreenElementProps params = {id = np_option_2 Shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus SetScreenElementProps params = {id = np_option_2 no_shadow}}
				{pad_choose generic_event_back params = {state = uistate_practice_select_speed}}
			]
		}
		CreateScreenElement {
			Type = TextElement
			parent = current_menu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus SetScreenElementProps params = {id = np_option_3 Shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus SetScreenElementProps params = {id = np_option_3 no_shadow}}
				{pad_choose generic_event_back params = {state = uistate_select_song_section}}
			]
		}
		CreateScreenElement {
			Type = TextElement
			parent = current_menu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus SetScreenElementProps params = {id = np_option_4 Shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus SetScreenElementProps params = {id = np_option_4 no_shadow}}
				{pad_choose generic_event_back params = {state = uistate_mainmenu}}
			]
		}
	else
		CreateScreenElement {
			Type = TextElement
			parent = current_menu
			font = <menu_font>
			event_handlers = [
				{focus retail_menu_focus}
				{focus SetScreenElementProps params = {id = np_option_0 Shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
				{unfocus retail_menu_unfocus}
				{unfocus SetScreenElementProps params = {id = np_option_0 no_shadow}}
				{pad_choose ui_win_song_continue}
			]
		}
		if NOT ($end_credits = 1)
			more_stats_option_id = np_option_1
			if (<show_replay> = 1)
				CreateScreenElement {
					Type = TextElement
					parent = current_menu
					font = <menu_font>
					event_handlers = [
						{focus retail_menu_focus}
						{focus SetScreenElementProps params = {id = np_option_1 Shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
						{unfocus retail_menu_unfocus}
						{unfocus SetScreenElementProps params = {id = np_option_1 no_shadow}}
						{pad_choose restart_warning_select_restart}
					]
				}
				more_stats_option_id = np_option_2
			endif
			CreateScreenElement {
				Type = TextElement
				parent = current_menu
				font = <menu_font>
				event_handlers = [
					{focus retail_menu_focus}
					{focus SetScreenElementProps params = {id = <more_stats_option_id> Shadow shadow_rgba = [0 0 0 255] shadow_offs = (2.0, 2.0)}}
					{unfocus retail_menu_unfocus}
					{unfocus SetScreenElementProps params = {id = <more_stats_option_id> no_shadow}}
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
		formatText checksumName = option_id 'np_option_%d' d = ($g_np_options_index - 4)
	else
		formatText \{checksumName = option_id
			'np_option_%d'
			d = $g_np_options_index}
	endif
	retail_menu_unfocus id = <option_id>
	Change g_np_options_index = ($g_np_options_index + 1)
	printf qs(0xd958d091) d = ($g_np_options_index)
	if (<for_practice> = 1)
		if ($g_np_options_index > 8)
			Change \{g_np_options_index = 4}
		endif
		formatText checksumName = option_id 'np_option_%d' d = ($g_np_options_index - 4)
	else
		if (<show_replay> = 1)
			if ($g_np_options_index > 2)
				Change \{g_np_options_index = 0}
			endif
		else
			if ($g_np_options_index > 1)
				Change \{g_np_options_index = 0}
			endif
		endif
		formatText \{checksumName = option_id
			'np_option_%d'
			d = $g_np_options_index}
	endif
	retail_menu_focus id = <option_id>
	legacydoscreenelementmorph {
		id = ss_menu_hilite_id
		Pos = (($g_np_option_props [$g_np_options_index].Pos) + ($g_np_option_props [$g_np_options_index].offset) + <menu_offset>)
		rot_angle = (($g_np_option_props [$g_np_options_index].rot) + 0.5)
		time = 0.05
	}
	legacydoscreenelementmorph {
		id = ss_menu_icon_id
		Pos = (($g_np_option_props [$g_np_options_index].Pos) + ($g_np_option_props [$g_np_options_index].offset) + ($g_np_menu_icon_offset) + <menu_offset>)
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
		formatText checksumName = option_id 'np_option_%d' d = ($g_np_options_index - 4)
	else
		formatText \{checksumName = option_id
			'np_option_%d'
			d = $g_np_options_index}
	endif
	retail_menu_unfocus id = <option_id>
	Change g_np_options_index = ($g_np_options_index -1)
	if (<for_practice> = 1)
		if ($g_np_options_index < 4)
			Change \{g_np_options_index = 8}
		endif
		formatText checksumName = option_id 'np_option_%d' d = ($g_np_options_index - 4)
	else
		if (<show_replay> = 1)
			if ($g_np_options_index < 0)
				Change \{g_np_options_index = 2}
			endif
		else
			if ($g_np_options_index < 0)
				Change \{g_np_options_index = 1}
			endif
		endif
		formatText \{checksumName = option_id
			'np_option_%d'
			d = $g_np_options_index}
	endif
	retail_menu_focus id = <option_id>
	legacydoscreenelementmorph {
		id = ss_menu_hilite_id
		Pos = (($g_np_option_props [$g_np_options_index].Pos) + ($g_np_option_props [$g_np_options_index].offset) + <menu_offset>)
		rot_angle = (($g_np_option_props [$g_np_options_index].rot) + 0.5)
		time = 0.05
	}
	legacydoscreenelementmorph {
		id = ss_menu_icon_id
		Pos = (($g_np_option_props [$g_np_options_index].Pos) + ($g_np_option_props [$g_np_options_index].offset) + ($g_np_menu_icon_offset) + <menu_offset>)
		rot_angle = ($g_np_option_props [$g_np_options_index].rot)
		time = 0.05
	}
endscript

script scale_textblock \{reset_scale = 0}
	GetScreenElementDims id = <id>
	block_width = (<width> * 1.0)
	block_height = (<height> * 1.0)
	GetScreenElementChildren id = <id>
	if GotParam \{children}
		i = 0
		GetArraySize <children>
		begin
		GetScreenElementDims id = (<children> [<i>])
		width_scale = (<block_width> / <width>)
		height_scale = ((<block_height> / <array_Size>) / <height>)
		if (<reset_scale> = 1)
			text_scale = (((1.0 / <width_scale>) * (1.0, 0.0)) + ((0.0, 1.0) * 1.0))
		else
			text_scale = (((1.0, 0.0) * <width_scale>) + ((0.0, 1.0) * 1.0))
		endif
		SetScreenElementProps id = (<children> [<i>]) Scale = <text_scale>
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return num_children = <array_Size>
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
	np_set_section_color p = 1 i = <i> j = <j> Color = <black>
	np_set_section_color p = 2 i = <i> j = <j> Color = <black>
	Wait <time> Seconds
	np_set_section_color p = 1 i = <i> j = <j> Color = $g_grey
	np_set_section_color p = 2 i = <i> j = <j> Color = $g_grey
	<i> = <new_i>
	repeat 3
	repeat
endscript

script np_set_section_color 
	begin
	formatText checksumName = section_id 'p%p_np_%d' p = <p> d = <i>
	SetScreenElementProps id = <section_id> rgba = <Color>
	<i> = (<i> + 1)
	repeat <j>
	return new_i = <i>
endscript

script np_2p_flap_wings 
	<flap_time> = 0.6
	GetScreenElementProps \{id = np_left_wing}
	SetScreenElementProps \{id = np_left_wing
		just = [
			0.9688
			0.68750006
		]}
	SetScreenElementProps \{id = np_right_wing
		just = [
			-0.9688
			0.68750006
		]}
	begin
	legacydoscreenelementmorph id = np_left_wing rot_angle = 20 time = <flap_time> motion = ease_out
	legacydoscreenelementmorph id = np_right_wing rot_angle = -20 time = <flap_time> motion = ease_out
	Wait <flap_time> Seconds
	legacydoscreenelementmorph id = np_left_wing rot_angle = -20 time = <flap_time> motion = ease_in
	legacydoscreenelementmorph id = np_right_wing rot_angle = 20 time = <flap_time> motion = ease_in
	Wait (<flap_time> * 2) Seconds
	repeat
endscript

script np_2p_thumb_zoom 
	<zoom_time> = 0.4
	<bounce_time> = 0.5
	<thumb_orig_pos> = (240.0, -30.0)
	<thumb_orig_alpha> = 0.25
	<thumb_orig_scale> = 12
	GetScreenElementProps \{id = np_icon_thumb}
	<thumb_final_pos> = <Pos>
	<thumb_final_alpha> = 1.0
	<thumb_bounce_scale> = 1.5
	SetScreenElementProps {
		id = np_icon_thumb
		Pos = <thumb_orig_pos>
		alpha = <thumb_orig_alpha>
		Scale = <thumb_orig_scale>
		relative_scale
		preserve_flip
	}
	legacydoscreenelementmorph {
		id = np_icon_thumb
		Pos = <thumb_final_pos>
		alpha = <thumb_final_alpha>
		Scale = 1
		relative_scale
		time = <zoom_time>
	}
	Wait (<zoom_time> * 1.5) Seconds
	begin
	legacydoscreenelementmorph {
		id = np_icon_thumb
		Scale = <thumb_bounce_scale>
		relative_scale
		time = <bounce_time>
		motion = ease_in
	}
	Wait <bounce_time> Seconds
	legacydoscreenelementmorph {
		id = np_icon_thumb
		Scale = 1
		relative_scale
		time = <bounce_time>
		motion = ease_out
	}
	Wait <bounce_time> Seconds
	repeat
endscript

script np_2p_fade_to_grey 
	Wait \{1
		Second}
	if (<winner> = qs(0x09c32524))
		<stroke_pos> = (798.0, 260.0)
	else
		<stroke_pos> = (934.0, 280.0)
	endif
	displaySprite {
		id = ss_stroke_1
		parent = newspaper_container
		tex = 2p_song_summary_brushstroke
		Pos = <stroke_pos>
		rgba = $g_ss_AP_reddish
		z = 80
		rot_angle = 25
		Scale = 0.125
		relative_scale
	}
	legacydoscreenelementmorph id = ss_stroke_1 Scale = 10.0 relative_scale Pos = (<stroke_pos> + (-8.0, -10.0)) time = 0.15 motion = ease_in
	Wait \{0.2
		Seconds}
	displaySprite {
		id = ss_stroke_2
		parent = newspaper_container
		tex = 2p_song_summary_brushstroke
		Pos = (<stroke_pos> + (-110.0, -30.0))
		rgba = [255 0 0 255]
		z = 80
		rot_angle = -10
		flip_v
		flip_h
		Scale = 0.125
		relative_scale
	}
	legacydoscreenelementmorph id = ss_stroke_2 Scale = 12.0 relative_scale Pos = (<stroke_pos> + (-120.0, -30.0)) time = 0.125 motion = ease_out
	Wait \{0.125
		Seconds}
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
	Wait (<drain_time> + 0.5) Seconds
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
	SetScreenElementProps \{id = ss_hilite2_p1
		rot_angle = 0
		alpha = 0}
	SetScreenElementProps \{id = ss_hilite3_p1
		rot_angle = 0
		alpha = 0}
	begin
	i = 1
	begin
	if ScreenElementExists \{id = ss_hilite2_p1}
		legacydoscreenelementmorph id = ss_hilite2_p1 rot_angle = <rot1> alpha = <alpha1> time = <time>
	endif
	if ScreenElementExists \{id = ss_hilite3_p1}
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
	Wait <time> Seconds
	repeat
endscript

script np_2p_hilites_p2 \{time = 3.0}
	rot1 = 360
	rot2 = 180
	alpha1 = 1
	alpha2 = 1
	SetScreenElementProps \{id = ss_hilite2_p2
		rot_angle = 0
		alpha = 0}
	SetScreenElementProps \{id = ss_hilite3_p2
		rot_angle = 0
		alpha = 0}
	begin
	i = 1
	begin
	if ScreenElementExists \{id = ss_hilite2_p2}
		legacydoscreenelementmorph id = ss_hilite2_p2 rot_angle = <rot1> alpha = <alpha1> time = <time>
	endif
	if ScreenElementExists \{id = ss_hilite3_p2}
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
	Wait <time> Seconds
	repeat
endscript
