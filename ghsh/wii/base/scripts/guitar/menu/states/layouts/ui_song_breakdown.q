track_last_song = None
ui_song_breakdown_players_rdy = [
	0
	0
	0
	0
]
ui_song_breakdown_wrote_tr = 0
ui_song_breakdown_pulsate_helper_pill = 0
ui_song_breakdown_helper_params = {
}
ui_song_breakdown_was_practice = 0

script ui_init_song_breakdown 
	Change \{playing_song = 0}
	Change \{my_trans_flag = 0}
	Change \{ui_song_breakdown_was_practice = 0}
	gamemode_gettype
	if (<Type> = training)
		SpawnScriptNow \{kill_gem_scroller}
		SpawnScriptNow \{task_menu_default_anim_in
			params = {
				base_name = 'select_song_section'
			}}
		Change \{ui_song_breakdown_was_practice = 1}
		return
	endif
	if NOT (<Type> = career || <Type> = quickplay)
		ui_gig_cash_clear_gig_earnings
	endif
	Change \{ui_song_breakdown_wrote_tr = 0}
	if (<Type> = quickplay)
		if ($track_last_song != jamsession)
			menu_top_rockers_check_for_new_top_score \{nowrite = 1}
			if (<new_score> != -1)
				Change \{ui_song_breakdown_pulsate_helper_pill = 1}
			endif
		endif
	endif
endscript

script ui_create_song_breakdown 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	Change \{ui_song_breakdown_helper_params = {
		}}
	if should_use_all_buttons
		Change \{ui_song_breakdown_helper_params = {
				all_buttons
			}}
	endif
	if ScreenElementExists \{id = You_Rock}
		DestroyScreenElement \{id = You_Rock}
	endif
	gamemode_gettype
	if (<Type> = training)
		load_songqpak song_name = ($current_song) async = 0
	endif
	ui_song_breakdown_clear_ready_up_book_keeping
	set_focus_color
	set_unfocus_color
	if ScreenElementExists \{id = my_breakdown_id}
		DestroyScreenElement \{id = my_breakdown_id}
	endif
	get_current_band_info
	GetGlobalTags <band_info>
	bandname = <Name>
	my_song = ($current_song)
	if NOT ($track_last_song = None)
		my_song = ($track_last_song)
	endif
	get_song_title song = <my_song>
	gamemode_gettype
	if (<Type> = training)
		ui_create_song_breakdown_practice <...>
	else
		ui_create_song_breakdown_normal <...>
	endif
	0xc003e921
	destroy_loading_screen
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_create_song_breakdown_normal 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	gamemode_gettype
	if ((<Type> = battle) || (<Type> = faceoff) || (<Type> = pro_faceoff))
		desc = 'song_complete_h2h'
	else
		desc = 'song_complete_4p'
	endif
	gamemode_getnumplayersshown
	trim_boss_from_num_players_show
	SetButtonEventMappings \{unblock_menu_input}
	star_texture = song_complete_star_perfect
	p = 1
	begin
	get_percent_notes_hit player_index = <p>
	if GotParam \{percent_notes_hit}
		getplayerinfo <p> part
		if (<part> = vocals)
			if ($current_song = yyz)
				<percent_notes_hit> = 100
			endif
		endif
		if (<percent_notes_hit> < 100)
			star_texture = song_complete_star_white
		endif
	endif
	p = (<p> + 1)
	repeat <num_players_shown>
	get_all_exclusive_devices
	CreateScreenElement {
		parent = root_window
		id = my_breakdown_id
		Type = descinterface
		desc = <desc>
		title_text = <song_title>
		song_complete_stars_texture = <star_texture>
		exclusive_device = <exclusive_device>
	}
	SoundEvent \{event = menu_song_complete_in}
	if (<Type> = battle)
		<player1_health> = ($player1_status.current_health)
		<player2_health> = ($player2_status.current_health)
		if (<player1_health> > <player2_health>)
			<winner> = 1
			my_breakdown_id :se_setprops \{winner_highlight_p1_alpha = 1}
			my_breakdown_id :se_setprops \{patch_highlight_p1_alpha = 1}
		elseif (<player1_health> < <player2_health>)
			<winner> = 2
			my_breakdown_id :se_setprops \{winner_highlight_p2_alpha = 1}
			my_breakdown_id :se_setprops \{patch_highlight_p2_alpha = 1}
		else
			<winner> = -1
			my_breakdown_id :se_setprops \{winner_highlight_p1_alpha = 1}
			my_breakdown_id :se_setprops \{patch_highlight_p1_alpha = 1}
			my_breakdown_id :se_setprops \{winner_highlight_p2_alpha = 1}
			my_breakdown_id :se_setprops \{patch_highlight_p2_alpha = 1}
		endif
		my_breakdown_id :se_setprops \{player_patch01_alpha = 0}
		my_breakdown_id :se_setprops \{player_patch02_alpha = 0}
	elseif ((<Type> = faceoff) || (<Type> = pro_faceoff))
		<player1_score> = ($player1_status.score)
		<player2_score> = ($player2_status.score)
		if (<player1_score> > <player2_score>)
			<winner> = 1
			my_breakdown_id :se_setprops \{winner_highlight_p1_alpha = 1}
			my_breakdown_id :se_setprops \{patch_highlight_p1_alpha = 1}
		elseif (<player1_score> < <player2_score>)
			<winner> = 2
			my_breakdown_id :se_setprops \{winner_highlight_p2_alpha = 1}
			my_breakdown_id :se_setprops \{patch_highlight_p2_alpha = 1}
		else
			<winner> = -1
			my_breakdown_id :se_setprops \{winner_highlight_p1_alpha = 1}
			my_breakdown_id :se_setprops \{patch_highlight_p1_alpha = 1}
			my_breakdown_id :se_setprops \{winner_highlight_p2_alpha = 1}
			my_breakdown_id :se_setprops \{patch_highlight_p2_alpha = 1}
		endif
	endif
	ui_song_breakdown_hide_player_data
	song_breakdown_assign_strips_data winner = <winner>
	if ((<Type> = battle) || (<Type> = faceoff) || (<Type> = pro_faceoff))
		song_breakdown_assign_player_data_faceoff
	else
		song_breakdown_resize_for_num_players
		song_breakdown_assign_band_data band_cash = <band_cash> star_texture = <star_texture>
	endif
	if GotParam \{gig_complete}
		printf \{channel = mychannel
			qs(0x894d7755)}
		ui_song_breakdown_add_components_for_gig_complete
	elseif GotParam \{for_encore}
		ui_song_breakdown_add_components_for_encore <for_encore>
	else
	endif
	if GotParam \{0xaa56f464}
		SpawnScriptNow ui_song_breakdown_pause_between_songs params = <...>
	endif
	if (($my_trans_flag) = 1)
		ui_song_breakdown_pause_between_songs <...>
	endif
	my_breakdown_id :Obj_SpawnScriptNow \{ui_song_breakdown_pulse_stars}
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_song_breakdown_pulse_stars 
	Wait \{1
		Second}
	begin
	se_setprops \{song_complete_stars_scale = 1.4499999
		time = 0.015}
	se_waitprops
	se_setprops \{song_complete_stars_scale = 1.2
		time = 0.015}
	se_waitprops
	se_setprops \{song_complete_stars_scale = 0.9
		time = 0.015}
	se_waitprops
	se_setprops \{song_complete_stars_scale = 1
		time = 0.015}
	se_waitprops
	se_setprops \{song_complete_stars_scale = 1.15
		time = 0.015}
	se_waitprops
	se_setprops \{song_complete_stars_scale = 1
		time = 0.015}
	Wait \{1
		Second}
	repeat
endscript

script song_breakdown_resize_for_num_players 
	num_players = ($current_num_players)
	if (<num_players> > 3)
		return
	endif
	Scale = 1
	player_strips_offset = (0.0, 0.0)
	offset = (0.0, 26.0)
	switch <num_players>
		case 1
		<Scale> = 1.5
		<offset> = (0.0, 45.0)
		<player_strips_offset> = (0.0, 90.0)
		case 2
		<Scale> = 1.3499999
		<offset> = (0.0, 33.0)
		<player_strips_offset> = (0.0, 64.0)
		case 3
		<Scale> = 1.2
		<offset> = (0.0, 18.0)
		<player_strips_offset> = (0.0, 40.0)
	endswitch
	my_breakdown_id :se_setprops band_info_patch_scale = <Scale>
	my_breakdown_id :se_setprops band_info_patch_pos = {relative <offset>}
	my_breakdown_id :se_setprops strips_pos = {relative <player_strips_offset>}
	<pos_scalar> = (4 - <num_players>)
	<new_pos> = ((<pos_scalar> * 62) * (0.0, -1.0) + <player_strips_offset>)
	my_breakdown_id :se_setprops paper_bottom_pos = {<new_pos> relative}
endscript

script ui_song_breakdown_pulse_stars 
	Wait \{1
		Second}
	begin
	se_setprops \{song_complete_stars_scale = 1.4499999
		time = 0.015}
	se_waitprops
	se_setprops \{song_complete_stars_scale = 1.2
		time = 0.015}
	se_waitprops
	se_setprops \{song_complete_stars_scale = 0.9
		time = 0.015}
	se_waitprops
	se_setprops \{song_complete_stars_scale = 1
		time = 0.015}
	se_waitprops
	se_setprops \{song_complete_stars_scale = 1.15
		time = 0.015}
	se_waitprops
	se_setprops \{song_complete_stars_scale = 1
		time = 0.015}
	Wait \{1
		Second}
	repeat
endscript

script get_percent_notes_hit 
	ui_song_breakdown_get_basic_player_data player_index = <player_index>
	if NOT playerinfoequals <player_index> part = vocals
		if (<max_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		adjust_percent_for_display percent = <percent_notes_hit>
		<percent_notes_hit> = <adjusted_percent>
	else
		if (<vocal_phrase_max_qual> > 0)
			<percent_notes_hit> = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		adjust_percent_for_display percent = <percent_notes_hit>
		<percent_notes_hit> = <adjusted_percent>
	endif
	return percent_notes_hit = <percent_notes_hit>
endscript

script ui_destroy_song_breakdown 
	KillSpawnedScript \{Name = ui_song_breakdown_pulse_stars}
	clean_up_user_control_helpers
	KillSpawnedScript \{Name = pulsate_helper_pill}
	gamemode_gettype
	DestroyScreenElement \{id = my_breakdown_practice_id}
	DestroyScreenElement \{id = my_breakdown_id}
	if NOT (<Type> = training)
		ui_destroy_encore_confirmation
	endif
endscript

script ui_deinit_song_breakdown 
	printf \{channel = mychannel
		qs(0xf4674b8a)}
	if ($ui_song_breakdown_was_practice = 0)
		if ($track_last_song != jamsession)
			song_breakdown_auto_write_top_rockers
		endif
		ui_song_breakdown_clean_up_highest_multipliers
		clear_cash_milestones_per_song
		ui_gig_cash_increase_earnings_for_all
		progression_clearnewcash
	else
		Change \{ui_song_breakdown_was_practice = 0}
		printf \{qs(0x8daadaff)
			channel = what}
	endif
	gamemode_gettype
	if (<Type> = training)
		unload_songqpak
	endif
endscript

script song_breakdown_assign_strips_data \{winner = -1}
	if NOT my_breakdown_id :desc_resolvealias \{Name = alias_player_stats_element}
		ScriptAssert \{qs(0xcced482f)}
	endif
	gamemode_gettype
	0x4e456279 = 0
	if (<Type> = battle || <Type> = faceoff || <Type> = pro_faceoff)
		0x4e456279 = 1
	endif
	gamemode_getnumplayersshown
	trim_boss_from_num_players_show
	GetScreenElementChildren id = <resolved_id>
	band_cash = 0
	Player = 1
	begin
	if (<0x4e456279> = 1)
		getplayerinfo <Player> is_local_client
		if (<is_local_client> = 1)
			getplayerinfo <Player> checksum
			get_savegame_from_player_status player_status = <checksum>
			get_current_band_info
			GetGlobalTags savegame = <savegame> <band_info> param = career_earnings
			setplayerinfo <Player> career_earnings = <career_earnings>
		endif
	endif
	ui_song_breakdown_get_basic_player_data player_index = <Player>
	getplayerinfo <Player> double_kick_drum
	getplayerinfo <Player> part
	if (<double_kick_drum> = 1 && <part> = drum)
		<expert_plus_alpha> = 1
		<icon_difficulty_alpha> = 0
	else
		<expert_plus_alpha> = 0
		<icon_difficulty_alpha> = 1
	endif
	band_cash = (<band_cash> + <new_cash>)
	cut_alpha_val = 1
	gamemode_gettype
	if NOT (<Type> = career || <Type> = quickplay)
		cash_text = qs(0x00000000)
		cut_alpha_val = 0
	endif
	if (<Player> = <winner>)
		<winner_alpha> = 1
		<loser_alpha> = 0
	else
		<winner_alpha> = 0
		<loser_alpha> = 1
	endif
	cash_alpha = 1
	if (<0x4e456279> = 1)
		level_up_alpha = 0
		cash_icon_id = qs(0x00000000)
		cash_alpha = 0
	endif
	SetScreenElementProps {
		id = (<children> [(<Player> - 1)])
		player_name_text = <player_text>
		notes_hit_text = <percent_text>
		note_streak_text = <streak_text>
		cut_text = <cash_text>
		mixer_icon_guitar_texture = <icon_texture>
		cash_milestones_icon_pho_texture = <cash_icon_id>
		number_text_text = <rank_text>
		icon_difficulty_texture = <diff_texture>
		check_mark_alpha = 0
		hand_devil_horn_alpha = <winner_alpha>
		hand_thumb_down_alpha = <loser_alpha>
		expert_plus_alpha = <expert_plus_alpha>
		icon_difficulty_alpha = <icon_difficulty_alpha>
		level_up_alpha = <level_up_alpha>
		0x4b0df2ff = <cash_alpha>
	}
	SetScreenElementProps {
		id = my_breakdown_id
		cut_alpha = <cut_alpha_val>
	}
	Player = (<Player> + 1)
	repeat <num_players_shown>
	return band_cash = <band_cash>
endscript

script song_breakdown_assign_player_data_faceoff 
	gamemode_gettype
	<player_index> = 1
	begin
	formatText checksumName = player_patch 'alias_song_complete_h2h_player_patch_%p' p = <player_index>
	my_breakdown_id :desc_resolvealias Name = <player_patch>
	if NOT GotParam \{resolved_id}
		scriptsoftassert \{'Could not find my_breakdown_id'}
		return
	endif
	ui_song_breakdown_get_basic_player_data player_index = <player_index>
	getplayerinfo <player_index> highest_multiplier
	formatText TextName = score_text qs(0x21379b76) n = <score> DecimalPlaces = 0 usecommas
	formatText TextName = multiplier_text qs(0xff33e928) n = <highest_multiplier>
	getplayerinfo <player_index> part
	if (<part> = vocals)
		formatText TextName = high_note_streak qs(0xe0550ad3) n = (<best_run> / 10)
	else
		formatText TextName = high_note_streak qs(0xedf69b30) n = <best_run>
	endif
	getplayerinfo <player_index> current_health
	if (<current_health> = 1.0)
		<winner_alpha> = 1
	else
		<winner_alpha> = 0
	endif
	SetScreenElementProps {
		id = <resolved_id>
		notestreak_entry_text = <high_note_streak>
		score_entry_text = <score_text>
		multiplier_entry_text = <multiplier_text>
		player_name_text = <player_text>
		hand_devil_horn_alpha = <winner_alpha>
		hand_thumb_down_alpha = (1.0 - <winner_alpha>)
	}
	<player_index> = (<player_index> + 1)
	repeat 2
endscript

script song_breakdown_assign_band_data 
	if (($current_num_players) = 1 || (($current_num_players) = 2 && ($boss_battle) = 1))
		gamemode_gettype
		if (<Type> = career || <Type> = quickplay)
			getscorefromdetailedstats \{Player = 1}
			getstarsfromdetailedstats \{Player = 1}
		else
			getplayerinfo \{1
				score}
			getplayerinfo \{1
				stars}
		endif
		getplayerinfo \{1
			highest_multiplier}
		formatText TextName = band_score_text qs(0x21379b76) n = <score> DecimalPlaces = 0 usecommas
		formatText TextName = multiplier_text qs(0xff33e928) n = <highest_multiplier>
		SetScreenElementProps {
			id = my_breakdown_id
			cash_entry_alpha = 0
			notestreak_entry_alpha = 0
			score_entry_text = <band_score_text>
			multiplier_entry_text = <multiplier_text>
		}
	else
		gamemode_getnumplayersshown
		trim_boss_from_num_players_show
		b_note_streak = ($gig_detailed_stats_band.high_2p_streak)
		if (($gig_detailed_stats_band.high_3p_streak) > <b_note_streak>)
			b_note_streak = ($gig_detailed_stats_band.high_3p_streak)
		endif
		if (($gig_detailed_stats_band.high_4p_streak) > <b_note_streak>)
			b_note_streak = ($gig_detailed_stats_band.high_4p_streak)
		endif
		score = ($gig_detailed_stats_band.score)
		b_high_mult = ($gig_detailed_stats_band.high_mult)
		CastToInteger \{b_high_mult}
		CastToInteger \{score}
		formatText TextName = band_score_text qs(0x21379b76) n = <score> DecimalPlaces = 0 usecommas
		formatText TextName = band_cash_entry_text qs(0x53f4fb31) n = <band_cash> DecimalPlaces = 0 usecommas
		formatText TextName = band_high_mult_text qs(0xff33e928) n = <b_high_mult>
		formatText TextName = band_high_note_streak qs(0xedf69b30) n = <b_note_streak>
		SetScreenElementProps {
			id = my_breakdown_id
			score_entry_text = <band_score_text>
			cash_entry_text = <band_cash_entry_text>
			multiplier_entry_text = <band_high_mult_text>
			notestreak_entry_text = <band_high_note_streak>
		}
		stars = ($gig_detailed_stats_band.stars)
	endif
	if (<stars> > 3)
		if my_breakdown_id :desc_resolvealias \{Name = alias_song_complete_stars}
		else
			ScriptAssert \{qs(0xcd7237ca)}
		endif
		CreateScreenElement {
			parent = <resolved_id>
			Type = SpriteElement
			dims = (34.0, 34.0)
			texture = <star_texture>
		}
		if (<stars> > 4)
			CreateScreenElement {
				parent = <resolved_id>
				Type = SpriteElement
				dims = (34.0, 34.0)
				texture = <star_texture>
			}
		endif
	endif
endscript

script ui_song_breakdown_hide_player_data 
	num_players = ($current_num_players)
	b_battle = ($boss_battle)
	if (<b_battle> = 1)
		num_players = 1
	endif
	if (<num_players> < 4)
		SetScreenElementProps \{id = my_breakdown_id
			form_songcomplete_p4_alpha = 0
			song_complete_player_stats_p4_alpha = 0}
	endif
	if (<num_players> < 3)
		SetScreenElementProps \{id = my_breakdown_id
			form_songcomplete_p3_alpha = 0
			song_complete_player_stats_p3_alpha = 0}
	endif
	if (<num_players> < 2)
		SetScreenElementProps \{id = my_breakdown_id
			form_songcomplete_p2_alpha = 0
			song_complete_player_stats_p2_alpha = 0}
	endif
endscript

script ui_song_breakdown_get_basic_player_data \{player_index = 1}
	gamemode_gettype
	if ($is_network_game = 1)
		getplayerinfo <player_index> best_run
		getplayerinfo <player_index> score
		getplayerinfo <player_index> max_notes
		getplayerinfo <player_index> notes_hit
		getplayerinfo <player_index> stars
		getplayerinfo <player_index> cash_rank_up
		getplayerinfo <player_index> vocal_streak_phrases
		getplayerinfo <player_index> vocal_phrase_quality
		getplayerinfo <player_index> vocal_phrase_max_qual
		getplayerinfo <player_index> total_notes
		getplayerinfo <player_index> career_earnings
	elseif (<Type> = career || <Type> = quickplay)
		getscorefromdetailedstats Player = <player_index>
		getbestrunfromdetailedstats Player = <player_index>
		getmaxnotesfromdetailedstats Player = <player_index>
		getnoteshitfromdetailedstats Player = <player_index>
		getstarsfromdetailedstats Player = <player_index>
		getvocalstreakphrasesfromdetailedstats Player = <player_index>
		getvocalphrasequalityfromdetailedstats Player = <player_index>
		getvocalphrasemaxqualfromdetailedstats Player = <player_index>
		gettotalnotesfromdetailedstats Player = <player_index>
		getcareerearningsfromdetailedstats Player = <player_index>
		getcashrankupfromdetailedstats Player = <player_index>
		if isps3
			gamemode_getnumplayersshown
			if (<num_players_shown> > 1 && $is_network_game = 0 && $band_mode_current_leader != -1)
				get_player_num_from_controller controller_index = ($band_mode_current_leader)
				getcashrankupfromdetailedstats Player = <player_num>
			endif
		endif
	else
		getplayerinfo <player_index> best_run
		getplayerinfo <player_index> score
		getplayerinfo <player_index> max_notes
		getplayerinfo <player_index> notes_hit
		getplayerinfo <player_index> stars
		getplayerinfo <player_index> cash_rank_up
		getplayerinfo <player_index> vocal_streak_phrases
		getplayerinfo <player_index> vocal_phrase_quality
		getplayerinfo <player_index> vocal_phrase_max_qual
		getplayerinfo <player_index> total_notes
		getplayerinfo <player_index> career_earnings
	endif
	getplayerinfo <player_index> part
	getplayerinfo <player_index> difficulty
	getplayerinfo <player_index> new_cash
	level_up_alpha = <cash_rank_up>
	if (<max_notes> = 0)
		max_notes = 1
	endif
	if (<stars> < 3)
		stars = 3
	endif
	switch <player_index>
		case 1
		get_difficulty_text difficulty = ($player1_status.difficulty)
		case 2
		get_difficulty_text difficulty = ($player2_status.difficulty)
		case 3
		get_difficulty_text difficulty = ($player3_status.difficulty)
		case 4
		get_difficulty_text difficulty = ($player4_status.difficulty)
	endswitch
	cash_get_info_from_earnings earnings = <career_earnings>
	CastToInteger \{score}
	<Name> = qs(0x00000000)
	if ($is_network_game = 1)
		getplayerinfo <player_index> gamertag
		Name = $<gamertag>
	else
		if isXenon
			getplayerinfo <player_index> controller
			if NOT ((<controller> < 0) || (<controller> > 3))
				if getlocalgamertag controller = <controller>
					<Name> = <gamertag>
				endif
			endif
		endif
	endif
	if (<Name> = qs(0x00000000))
		formatText TextName = player_text qs(0x5c5cedaa) p = <player_index>
	else
		<player_text> = <Name>
	endif
	formatText TextName = score_text qs(0x73307931) s = <score> usecommas
	if NOT playerinfoequals <player_index> part = vocals
		if (<Type> = training)
			if (<total_notes> > 0)
				<percent_notes_hit> = (((<notes_hit> * 1.0) / <total_notes>) * 100.0)
			else
				<percent_notes_hit> = 0
			endif
		else
			if (<max_notes> > 0)
				<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
			else
				<percent_notes_hit> = 0
			endif
		endif
		adjust_percent_for_display percent = <percent_notes_hit>
		<percent_notes_hit> = <adjusted_percent>
		formatText TextName = percent_text qs(0xea41c83d) p = <percent_notes_hit>
		formatText TextName = streak_text qs(0x8c5c152d) n = <best_run> DecimalPlaces = 0
	else
		if (<vocal_phrase_max_qual> > 0)
			percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
			adjust_percent_for_display percent = <percent_notes_hit>
			<percent_notes_hit> = <adjusted_percent>
			formatText TextName = percent_text qs(0xea41c83d) p = <percent_notes_hit> DecimalPlaces = 0
		else
			<percent_text> = qs(0x6a5cf46c)
		endif
		formatText TextName = streak_text qs(0x8c5c152d) n = <vocal_streak_phrases> DecimalPlaces = 0
	endif
	formatText TextName = cash_text qs(0x31c078e8) n = <new_cash> usecommas
	formatText TextName = rank_text qs(0x8c5c152d) n = <rank>
	<icon_difficulty_medium_scale> = 1
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
	switch (<difficulty>)
		case easy_rhythm
		diff_texture = icon_difficulty_beginner
		case easy
		diff_texture = icon_difficulty_easy
		case medium
		diff_texture = icon_difficulty_medium
		case hard
		diff_texture = icon_difficulty_hard
		case expert
		diff_texture = icon_difficulty_expert
	endswitch
	getplayerinfo <player_index> double_kick_drum
	getplayerinfo <player_index> part
	<diff_medium_alpha> = 1
	<diff_expert_plus_alpha> = 0
	if (<part> = drum && <double_kick_drum> = 1)
		<difficulty_text> = qs(0x7a19b5f7)
		<diff_texture> = setlist_b_db_icon
		<diff_medium_alpha> = 0
		<diff_expert_plus_alpha> = 1
		<icon_difficulty_medium_scale> = 1.25
	endif
	printf qs(0xc0a62370) n = <player_index>
	return <...>
endscript

script ui_song_breakdown_show_continue_button 
	ui_song_breakdown_add_components_for_continue
endscript

script ui_song_breakdown_someone_signed_in 
	if IsLoggedIn \{0x5f495f02}
		return \{true}
	endif
	return \{FALSE}
endscript

script 0x59983fb5 
	if ($transitions_locked = 1 || $menu_flow_locked > 0)
		return
	endif
	if ScreenElementExists \{id = my_breakdown_id}
		ui_song_breakdown_ready_up device_num = <device_num>
		if (<everyone_is_ready> = 0)
			return
		endif
	endif
endscript

script ui_song_breakdown_add_components_for_continue 
	gamemode_gettype
	if ($is_network_game = 1)
		array = [
			{pad_choose net_ui_song_breakdown_continue_to_next_screen_gig_complete}
		]
	else
		if isXenon
			array = [
				{pad_btn_right generic_event_choose params = {state = uistate_song_summary_details}}
				{pad_choose ui_song_breakdown_continue_to_next_screen_gig_complete}
			]
		else
			array = [
				{pad_back generic_event_choose params = {state = uistate_song_summary_details}}
				{pad_choose ui_song_breakdown_continue_to_next_screen_gig_complete}
			]
		endif
		if (<Type> = quickplay)
			AddArrayElement array = <array> element = {pad_option song_breakdown_run_top_rockers}
		endif
		if ($current_song = jamsession)
			array = [
				{pad_choose ui_song_breakdown_continue_to_next_screen_gig_complete}
			]
		endif
	endif
	SetScreenElementProps {
		id = my_breakdown_id
		event_handlers = <array>
	}
	add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x182f0173) button = green z = 100000
	if ($is_network_game = 0)
		if ($track_last_song != jamsession)
			add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x3f11367e) button = red z = 100000
			if (<Type> = quickplay)
				add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x88572463) button = blue z = 100000
				if (($ui_song_breakdown_pulsate_helper_pill) = 1)
					SpawnScriptLater pulsate_helper_pill params = {id = <helper_pill_id> time = 0.5}
				endif
			endif
		endif
	endif
	AssignAlias \{id = my_breakdown_id
		alias = current_menu}
endscript

script ui_song_breakdown_add_components_for_gig_complete 
	gamemode_gettype
	if ($is_network_game = 1)
		array = [
			{pad_choose net_ui_song_breakdown_continue_to_next_screen_gig_complete}
		]
	else
		array = [
			{pad_back generic_event_choose params = {state = uistate_song_summary_details}}
			{pad_choose ui_song_breakdown_continue_to_next_screen_gig_complete}
		]
		if (<Type> = quickplay)
			AddArrayElement array = <array> element = {pad_option song_breakdown_run_top_rockers}
		endif
		if ($current_song = jamsession)
			array = [
				{pad_choose ui_song_breakdown_continue_to_next_screen_gig_complete}
			]
		endif
	endif
	SetScreenElementProps {
		id = my_breakdown_id
		event_handlers = <array>
	}
	add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x182f0173) button = green z = 100000
	if ($is_network_game = 0)
		if ($track_last_song != jamsession)
			add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x3f11367e) button = red z = 100000
			if (<Type> = quickplay)
				add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x88572463) button = blue z = 100000
				if (($ui_song_breakdown_pulsate_helper_pill) = 1)
					SpawnScriptLater pulsate_helper_pill params = {id = <helper_pill_id> time = 0.5}
				endif
			endif
		endif
	endif
	AssignAlias \{id = my_breakdown_id
		alias = current_menu}
endscript

script ui_song_breakdown_add_components_for_encore 
	gamemode_gettype
	array = []
	if ($is_network_game = 1)
		array = [
			{pad_choose ui_song_breakdown_continue_to_next_screen_encore}
		]
	else
		if isXenon
			array = [
				{pad_btn_right song_breakdown_go_to_stats_from_transition}
				{pad_choose ui_song_breakdown_continue_to_next_screen_encore}
			]
		else
			array = [
				{pad_back song_breakdown_go_to_stats_from_transition}
				{pad_choose ui_song_breakdown_continue_to_next_screen_encore}
			]
		endif
	endif
	SetScreenElementProps {
		id = my_breakdown_id
		event_handlers = <array>
	}
	if ($is_network_game = 1)
		add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x182f0173) button = green z = 100000
	else
		add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x182f0173) button = green z = 100000
		add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x3f11367e) button = red z = 100000
	endif
	AssignAlias \{id = my_breakdown_id
		alias = current_menu}
endscript

script song_breakdown_run_top_rockers_from_transition 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = my_breakdown_id}
		my_breakdown_id :se_setprops \{block_events}
	endif
	Change \{my_trans_flag = 1}
	ui_event_wait_for_safe
	song_breakdown_run_top_rockers
endscript

script song_breakdown_run_top_rockers 
	printf \{channel = mychannel
		qs(0xc8a705c8)}
	if (($ui_song_breakdown_wrote_tr) = 0)
		Change \{ui_song_breakdown_wrote_tr = 1}
		Change \{ui_song_breakdown_pulsate_helper_pill = 0}
		generic_event_choose \{state = uistate_top_rockers}
	else
		generic_event_choose \{state = uistate_top_rockers
			data = {
				for_options = 1
			}}
	endif
endscript

script song_breakdown_auto_write_top_rockers 
	gamemode_gettype
	if (<Type> = quickplay)
		if (($ui_song_breakdown_wrote_tr) = 0)
			Change \{ui_song_breakdown_wrote_tr = 1}
			Change \{ui_song_breakdown_pulsate_helper_pill = 0}
			menu_top_rockers_check_for_new_top_score \{nowrite = 0}
			printf \{channel = mychannel
				qs(0xc284fe5b)}
		endif
	endif
endscript

script ui_song_breakdown_anim_in_script 
endscript

script ui_song_breakdown_anim_out_script 
endscript

script song_breakdown_anim_band_banner_up 
endscript
got_sponsored_last_gig = 0
got_sponsored_tier_number = 0
got_sponsored_tier_catagory = 'guitar'

script ui_song_breakdown_continue_to_next_screen_gig_complete 
	printf \{channel = mychannel
		'continue on from song breakdown after gig complete'}
	ui_song_breakdown_ready_up device_num = <device_num>
	if (<everyone_is_ready> = 0)
		return
		GetPakManCurrent \{map = zones}
		printf \{channel = mychannel
			'continue on from song breakdown after gig complete'}
		if (<pak> != z_studio && <pak> != z_studio2 && <pak> != z_tool && <pak> != z_training)
			SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
				params = {
					BG_SFX_Area = frontend_menu_music
				}}
		endif
	endif
	printf \{qs(0x2bd3b055)}
	Change \{songtime_paused = 0}
	gamemode_gettype
	if (<Type> = career || <Type> = quickplay)
		SoundEvent \{event = menu_song_complete_out}
		GetPakManCurrent \{map = zones}
		printf \{channel = mychannel
			'continue on from song breakdown after gig complete'}
		if (<pak> != z_studio && <pak> != z_studio2 && <pak> != z_tool && <pak> != z_training)
			SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
				params = {
					BG_SFX_Area = frontend_menu_music
				}}
		endif
		generic_event_replace \{state = uistate_cash_rewards_3
			data = {
				from_song_complete = 1
			}}
	else
		ui_win_song_continue_next_menu
	endif
endscript

script net_ui_song_breakdown_continue_to_next_screen_gig_complete 
	SoundEvent \{event = menu_song_complete_out}
	printf \{channel = sfx
		qs(0x7751fe7c)}
	GetPakManCurrent \{map = zones}
	if (<pak> != z_studio && <pak> != z_studio2 && <pak> != z_tool && <pak> != z_training)
		SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
			params = {
				BG_SFX_Area = frontend_menu_music
			}}
	endif
	if IsHost
		if ($net_breakdown_continue_msg_sent = 0)
			Change \{net_breakdown_continue_msg_sent = 1}
		else
			return
		endif
	else
		SendStructure \{callback = net_ui_song_breakdown_continue_to_next_screen_gig_complete
			data_to_send = {
				None
			}}
		return
	endif
	ui_win_song_continue_next_menu
endscript

script song_breakdown_check_for_sponsor 
	RequireParams \{[
			Player
		]
		all}
endscript

script ui_song_breakdown_continue_to_next_screen_encore 
	if ($transitions_locked = 1 || $menu_flow_locked > 0)
		return
	endif
	if ($is_network_game = 0)
		ui_song_breakdown_ready_up device_num = <device_num>
		if (<everyone_is_ready> = 0)
			return
		endif
	else
		if IsHost
			if ($net_encore_msg_start_sent = 0)
				Change \{net_encore_msg_start_sent = 1}
				SendStructure \{callback = encore_play
					data_to_send = {
						None
					}}
			else
				return
			endif
		else
			SendStructure \{callback = ui_song_breakdown_continue_to_next_screen_encore
				data_to_send = {
					None
				}}
			SoundEvent \{event = menu_song_complete_out}
			return
		endif
	endif
	printf \{channel = mychannel
		'continue on to encore after song complete'}
	SoundEvent \{event = menu_song_complete_out}
	encore_play
endscript

script ui_create_song_breakdown_practice 
	Change menu_flow_locked = ($menu_flow_locked + 1)
	progression_updatedetailedstatsforgig
	get_song_title song = ($current_song)
	ui_song_breakdown_get_basic_player_data
	if NOT playerinfoequals <player_index> part = vocals
		if (<total_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <total_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		adjust_percent_for_display percent = <percent_notes_hit>
		<percent_notes_hit> = <adjusted_percent>
		formatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit>
	else
		if (<vocal_phrase_max_qual> > 0)
			percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
			adjust_percent_for_display percent = <percent_notes_hit>
			<percent_notes_hit> = <adjusted_percent>
			formatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit> DecimalPlaces = 0
		else
			<percent_text> = qs(0x3bf547a6)
		endif
	endif
	CreateScreenElement {
		parent = root_window
		id = my_breakdown_practice_id
		Type = descinterface
		desc = 'dialog_box_continue'
		dlog_title_text = <song_title>
		dlog_continue_notes_entry_text = <percent_text>
		dlog_continue_streak_entry_text = <streak_text>
		icon_difficulty_medium_texture = <diff_texture>
		dlog_fail_song_difficulty_text = <difficulty_text>
		icon_difficulty_medium_alpha = <diff_medium_alpha>
		icon_difficulty_expert_plus_alpha = <diff_expert_plus_alpha>
		icon_difficulty_medium_scale = <icon_difficulty_medium_scale>
		exclusive_device = ($primary_controller)
	}
	bx_createhighlightstars \{parent = my_breakdown_practice_id
		stars_id = popup_stars}
	my_breakdown_practice_id :Obj_SpawnScriptNow \{bg_swap}
	disable_pause
	my_breakdown_practice_id :desc_resolvealias \{Name = alias_dlog_vmenu}
	SetScreenElementProps {
		id = <resolved_id>
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up = 1}}
			{pad_down generic_menu_up_or_down_sound params = {down = 2}}
		]
	}
	if ($came_to_practice_from = main_menu)
		text = qs(0x3e482764)
	else
		if ($came_to_practice_from = p1_career)
			<text> = qs(0xb435bc8c)
		else
			<text> = qs(0x0a96ac96)
		endif
	endif
	Change menu_unfocus_color = (($g_menu_colors).menu_gold)
	CreateScreenElement {
		parent = <resolved_id>
		Type = TextBlockElement
		font = fontgrid_bordello
		text = <text>
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{focus bx_popup_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_song_summary_continue_next_screen params = {for_practice = 1}}
			{pad_choose menu_start_transition}
		]
	}
	CreateScreenElement {
		parent = <resolved_id>
		Type = TextBlockElement
		font = fontgrid_bordello
		text = qs(0x1d227332)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{focus bx_popup_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose generic_event_choose params = {state = uistate_song_summary_details}}
			{pad_choose menu_start_transition}
		]
	}
	CreateScreenElement {
		parent = <resolved_id>
		Type = TextBlockElement
		font = fontgrid_bordello
		text = qs(0x4994d173)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{focus bx_popup_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose practice_restart_song}
			{pad_choose menu_start_transition}
		]
	}
	if NOT playerinfoequals \{1
			part = vocals}
		CreateScreenElement {
			parent = <resolved_id>
			Type = TextBlockElement
			font = fontgrid_bordello
			text = qs(0x2586eb28)
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{focus bx_popup_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose generic_event_back params = {state = uistate_practice_select_speed}}
				{pad_choose menu_start_transition}
			]
		}
	endif
	CreateScreenElement {
		parent = <resolved_id>
		Type = TextBlockElement
		font = fontgrid_bordello
		text = qs(0xde4bb13a)
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{focus bx_popup_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose 0x6bc9fd43 params = {state = uistate_select_song_section}}
		]
	}
	AssignAlias id = <resolved_id> alias = current_menu
	GetScreenElementChildren \{id = current_menu}
	GetArraySize <children>
	c = 0
	begin
	child = (<children> [<c>])
	<child> :se_setprops {
		just = [center center]
		internal_just = [center center]
		internal_scale = (0.7, 0.7)
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = (($g_menu_colors).menu_shadow)
	}
	bx_resizetextfield {
		id = <child>
		dims = (630.0, 60.0)
		fit_width = `scale	each	line	if	larger`
	}
	<c> = (<c> + 1)
	repeat <array_Size>
	add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0xc18d5e76) button = green z = 100000
	Change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_song_breakdown_ready_up 
	gamemode_getnumplayersshown
	trim_boss_from_num_players_show
	Player = 1
	begin
	getplayerinfo <Player> controller
	if (<device_num> = <controller>)
		rdyarray = ($ui_song_breakdown_players_rdy)
		SetArrayElement ArrayName = rdyarray index = (<Player> - 1) NewValue = 1
		ui_song_breakdown_set_player_ready dev_num = (<Player> - 1)
		Change ui_song_breakdown_players_rdy = <rdyarray>
	endif
	Player = (<Player> + 1)
	repeat <num_players_shown>
	ui_song_breakdown_is_everyone_ready
	return everyone_is_ready = <everyone_is_ready>
endscript

script ui_song_breakdown_num_players_ready 
	num_players_rdy = 0
	gamemode_getnumplayersshown
	trim_boss_from_num_players_show
	Player = 1
	begin
	getplayerinfo <Player> bot_play
	if (<bot_play> = 1)
		num_players_rdy = (<num_players_rdy> + 1)
	endif
	Player = (<Player> + 1)
	repeat <num_players_shown>
	rdy_up = ($ui_song_breakdown_players_rdy)
	i = 0
	begin
	num_players_rdy = (<num_players_rdy> + (<rdy_up> [<i>]))
	i = (<i> + 1)
	repeat <num_players_shown>
	return players_ready = <num_players_rdy>
endscript

script ui_song_breakdown_is_everyone_ready 
	everyone_is_ready = 1
	gamemode_getnumplayersshown
	trim_boss_from_num_players_show
	ui_song_breakdown_num_players_ready
	if (<num_players_shown> > <players_ready>)
		everyone_is_ready = 0
	endif
	return everyone_is_ready = <everyone_is_ready>
endscript

script ui_song_breakdown_set_player_ready 
	if my_breakdown_id :desc_resolvealias \{Name = alias_player_stats_element}
	else
		ScriptAssert \{qs(0xcced482f)}
	endif
	GetScreenElementChildren id = <resolved_id>
	GetScreenElementProps id = (<children> [<dev_num>])
	if (<check_mark_alpha> = 0)
		if (($game_mode = p1_career) || ($game_mode = training) || ($game_mode = tutorial) || ($game_mode = p1_quickplay))
			generic_menu_pad_choose_sound
		else
			SoundEvent \{event = Box_Check_SFX}
		endif
	endif
	SetScreenElementProps {
		id = (<children> [<dev_num>])
		check_mark_alpha = 1
	}
endscript
cash_milestones_collection_per_song = [
]

script clear_cash_milestones_per_song 
	Change \{cash_milestones_collection_per_song = [
			[
			]
			[
			]
			[
			]
			[
			]
		]}
endscript

script ui_song_breakdown_clear_ready_up_book_keeping 
	Change \{ui_song_breakdown_players_rdy = [
			0
			0
			0
			0
		]}
endscript

script ui_song_breakdown_clean_up_highest_multipliers 
	gamemode_getnumplayersshown
	trim_boss_from_num_players_show
	player_idx = 1
	begin
	setplayerinfo <player_idx> highest_multiplier = 1
	player_idx = (<player_idx> + 1)
	repeat <num_players_shown>
endscript

script ui_song_breakdown_pause_between_songs 
	ui_song_breakdown_add_components_for_transitions <...>
endscript

script ui_song_breakdown_add_components_for_transitions 
	printscriptinfo \{'ui_song_breakdown_add_components_for_transitions'}
	if GotParam \{for_encore}
		return
	endif
	printf \{channel = mychannel
		qs(0x4de80e59)}
	gamemode_gettype
	array = []
	if ($track_last_song = jamsession)
		printf \{'in song breakdown add components, song is jam'
			channel = jrdebug}
		array = [
			{pad_choose ui_song_breakdown_continue_to_next_screen_song_transition}
		]
		add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x182f0173) button = green z = 100000
	else
		if isXenon
			array = [
				{pad_btn_right song_breakdown_go_to_stats_from_transition}
				{pad_choose ui_song_breakdown_continue_to_next_screen_song_transition}
			]
		else
			array = [
				{pad_back song_breakdown_go_to_stats_from_transition}
				{pad_choose ui_song_breakdown_continue_to_next_screen_song_transition}
			]
		endif
		add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x182f0173) button = green z = 100000
		add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x3f11367e) button = red z = 100000
		if (<Type> = quickplay)
			add_user_control_helper ($ui_song_breakdown_helper_params) text = qs(0x88572463) button = blue z = 100000
			AddArrayElement array = <array> element = {pad_option song_breakdown_run_top_rockers_from_transition}
			if (($ui_song_breakdown_pulsate_helper_pill) = 1)
				SpawnScriptLater pulsate_helper_pill params = {id = <helper_pill_id> time = 0.5}
			endif
		endif
	endif
	get_all_exclusive_devices
	if ScreenElementExists \{id = my_breakdown_id}
		SetScreenElementProps {
			id = my_breakdown_id
			event_handlers = <array>
			exclusive_device = <exclusive_device>
		}
	endif
	if (($my_trans_flag) = 1)
		Change \{my_trans_flag = 0}
	else
		Wait \{10
			gameframes}
	endif
	if ScreenElementExists \{id = my_breakdown_id}
		LaunchEvent \{Type = focus
			target = my_breakdown_id}
	endif
endscript
my_trans_flag = 0

script song_breakdown_go_to_leaderboard_from_transition 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = my_breakdown_id}
		my_breakdown_id :se_setprops \{block_events}
	endif
	Change \{my_trans_flag = 1}
	ui_event_wait_for_safe
	ui_leaderboard_view_current_song my_song = ($track_last_song) device_num = <device_num>
endscript

script song_breakdown_go_to_stats_from_transition 
	if ($transitions_locked = 1 || $menu_flow_locked > 0)
		0x8dbdaee4 \{qs(0x2a7bcf8f)}
		return
	endif
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = my_breakdown_id}
		my_breakdown_id :se_setprops \{block_events}
	endif
	ui_event_wait_for_safe
	Change \{my_trans_flag = 1}
	generic_event_choose \{state = uistate_song_summary_details}
endscript

script ui_song_breakdown_continue_to_next_screen_song_transition 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	printscriptinfo \{'ui_song_breakdown_continue_to_next_screen_song_transition'}
	ui_song_breakdown_ready_up device_num = <device_num>
	if (<everyone_is_ready> = 0)
		return
	endif
	if NOT ($is_network_game = 0)
		if IsHost
			if ($0xed30382f = 0)
				Change \{0xed30382f = 1}
				SendStructure \{callback = 0x36a294e4
					data_to_send = {
						None
					}}
			else
				return
			endif
		else
			SendStructure \{callback = ui_song_breakdown_continue_to_next_screen_song_transition
				data_to_send = {
					None
				}}
			SoundEvent \{event = menu_song_complete_out}
			return
		endif
	endif
	0x36a294e4
endscript

script 0x36a294e4 
	generic_menu_pad_choose_sound
	SoundEvent \{event = menu_song_complete_out}
	Change \{songtime_paused = 0}
	Change \{gameplay_loading_transition = 1}
	Change \{net_ready_to_start = 0}
	if search_for_tool_in_quickplay_list
		can_change_level = 0
	else
		can_change_level = 1
	endif
	generic_event_replace nosound state = uistate_play_song data = {
		can_change_level = <can_change_level>
		0xaa893ed2 = FALSE
	}
endscript

script trim_boss_from_num_players_show 
	b_battle = ($boss_battle)
	if NOT (<b_battle> = 1)
		return
	endif
	return \{num_players_shown = 1}
endscript

script my_is_active_controller \{dev_num = 0}
	gamemode_getnumplayersshown
	i = 1
	begin
	getplayerinfo <i> controller
	if (<dev_num> = <controller>)
		return \{is_active = 1}
	endif
	i = (<i> + 1)
	repeat <num_players_shown>
	return \{is_active = 0}
endscript

script my_get_active_devices 
	gamemode_getnumplayersshown
	trim_boss_from_num_players_show
	devices = []
	Player = 1
	begin
	getplayerinfo <Player> controller
	AddArrayElement array = <devices> element = <controller>
	devices = <array>
	Player = (<Player> + 1)
	repeat <num_players_shown>
	return devices = <devices>
endscript

script getscorefromdetailedstats \{Player = 1}
	score = ($gig_detailed_stats [(<Player> - 1)] [0].score)
	return score = <score>
endscript

script getbestrunfromdetailedstats \{Player = 1}
	best_run = ($gig_detailed_stats [(<Player> - 1)] [0].best_run)
	return best_run = <best_run>
endscript

script getstarsfromdetailedstats \{Player = 1}
	stars = ($gig_detailed_stats [(<Player> - 1)] [0].stars)
	return stars = <stars>
endscript

script getnoteshitfromdetailedstats \{Player = 1}
	notes_hit = ($gig_detailed_stats [(<Player> - 1)] [0].notes_hit)
	return notes_hit = <notes_hit>
endscript

script getmaxnotesfromdetailedstats \{Player = 1}
	max_notes = ($gig_detailed_stats [(<Player> - 1)] [0].max_notes)
	return max_notes = <max_notes>
endscript

script gettotalnotesfromdetailedstats \{Player = 1}
	total_notes = ($gig_detailed_stats [(<Player> - 1)] [0].total_notes)
	return total_notes = <total_notes>
endscript

script getspphraseshitfromdetailedstats \{Player = 1}
	sp_phrases_hit = ($gig_detailed_stats [(<Player> - 1)] [0].sp_phrases_hit)
	return sp_phrases_hit = <sp_phrases_hit>
endscript

script getspphrasestotalfromdetailedstats \{Player = 1}
	sp_phrases_total = ($gig_detailed_stats [(<Player> - 1)] [0].sp_phrases_total)
	return sp_phrases_total = <sp_phrases_total>
endscript

script getavgmultiplierfromdetailedstats \{Player = 1}
	avg_multiplier = ($gig_detailed_stats [(<Player> - 1)] [0].avg_multiplier)
	return avg_multiplier = <avg_multiplier>
endscript

script getvocalstreakphrasesfromdetailedstats \{Player = 1}
	vocal_streak_phrases = ($gig_detailed_stats [(<Player> - 1)] [0].vocal_streak_phrases)
	return vocal_streak_phrases = <vocal_streak_phrases>
endscript

script getvocalphrasequalityfromdetailedstats \{Player = 1}
	vocal_phrase_quality = ($gig_detailed_stats [(<Player> - 1)] [0].vocal_phrase_quality)
	return vocal_phrase_quality = <vocal_phrase_quality>
endscript

script getvocalphrasemaxqualfromdetailedstats \{Player = 1}
	vocal_phrase_max_qual = ($gig_detailed_stats [(<Player> - 1)] [0].vocal_phrase_max_qual)
	return vocal_phrase_max_qual = <vocal_phrase_max_qual>
endscript

script getcashrankupfromdetailedstats \{Player = 1}
	cash_rank_up = ($gig_detailed_stats [(<Player> - 1)] [0].cash_rank_up)
	return cash_rank_up = <cash_rank_up>
endscript

script getnewcashfromdetailedstats \{Player = 1}
	new_cash = ($gig_detailed_stats [(<Player> - 1)] [0].new_cash)
	return new_cash = <new_cash>
endscript

script getcareerearningsfromdetailedstats \{Player = 1}
	career_earnings = ($gig_detailed_stats [(<Player> - 1)] [0].career_earnings)
	return career_earnings = <career_earnings>
endscript

script song_breakdown_drop_player 
	printf \{qs(0xe0296c2b)}
	if (<is_game_over> = 0)
		gamemode_gettype
		if (<Type> = career)
			wait_for_safe_shutdown
			SpawnScriptNow gameplay_drop_player params = {<...>}
		endif
	endif
endscript

script song_breakdown_end_game 
	printf \{qs(0x47ac8b43)}
	destroy_popup_warning_menu
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		net_disable_pause
		switch <drop_reason>
			case net_message_player_quit
			formatText TextName = first_msg qs(0x567f10d8) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formatText TextName = first_msg qs(0xd4b272d7) s = <name_string>
			default
			first_msg = qs(0x00000000)
		endswitch
		formatText TextName = msg qs(0x78bb855f) s = <first_msg>
		ui_event_get_stack
		if ((<stack> [0].base_name) = 'encore_confirmation')
			Transition_KillAll
		endif
		create_net_popup title = qs(0x5ca2c535) popup_text = <msg>
		if ScreenElementExists \{id = popup_warning_container}
			popup_warning_container :se_setprops \{z_priority = 1500.2}
		endif
		if ScreenElementExists \{id = popupelement}
			popupelement :Obj_SpawnScriptNow song_breakdown_end_game_spawned id = not_ui_player_drop_scripts params = <...>
		endif
	endif
endscript

script song_breakdown_end_game_spawned 
	Change \{net_ready_to_start = 1}
	printf \{qs(0x60090de2)}
	Wait \{3
		Seconds}
	printf \{qs(0xa43fad2b)}
	destroy_net_popup
	gamemode_gettype
	if (<Type> = career)
		if ($playing_song = 1)
			kill_gem_scroller
		endif
		ui_memcard_autosave \{event = menu_back
			state = uistate_group_play
			data = {
				all_active_players = true
			}}
	endif
endscript

script 0x6bc9fd43 
	0xf7e0f992 \{Wait}
	generic_event_back state = <state>
endscript
