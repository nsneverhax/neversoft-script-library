tr_max_band_characters = 14
num_top_scores = 10
g_tr_went_past_max_width = 0

script create_top_rockers_menu \{for_options = 0}
	printf \{"Enter create_top_rockers_menu"}
	disable_pause
	create_menu_backdrop \{texture = Toprockers_bg}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = tr_container
		Pos = (0.0, 0.0)}
	menu_top_rockers_create_poster
	new_score = -1
	if (<for_options> = 0)
		menu_top_rockers_check_for_new_top_score
		printf "create_top_rockers_menu: new score = %d" d = <new_score>
	endif
	printf \{"create_top_rockers_menu: creating paper highlight"}
	menu_top_rockers_create_paper highlight_index = (<new_score> + 1)
	if NOT (<new_score> = -1)
		printf \{"create_top_rockers_menu: We have a new score"}
		menu_top_rockers_init_band_name_creation score_index = <new_score>
		clean_up_user_control_helpers
		add_user_control_helper \{text = "SELECT"
			button = green
			z = 100}
		add_user_control_helper \{text = "DELETE"
			button = red
			z = 100}
		add_user_control_helper \{text = "UP/DOWN"
			button = strumbar
			z = 100}
		add_user_control_helper \{text = "ACCEPT"
			button = blue
			z = 100}
		SpawnScriptNow tr_watch_timer params = {score_index = <new_score>}
	else
		if ($is_attract_mode = 0)
			SpawnScriptNow \{top_rockers_wait_for_time_or_input}
			hide_countdown_timer
		endif
	endif
endscript

script destroy_top_rockers_menu 
	printf \{"destroy_top_rockers_menu: enter"}
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = tr_container}
	destroy_menu \{menu_id = continue_button}
	destroy_menu \{menu_id = back_button}
	KillSpawnedScript \{Name = menu_tr_flash_newest_character}
	KillSpawnedScript \{Name = tr_watch_timer}
	printf \{"destroy_top_rockers_menu: exit"}
endscript

script tr_watch_timer 
	SpawnScriptNow \{set_countdown_timer
		params = {
			timer_value = 45
			warning_val = 10
		}}
	begin
	check_countdown_timer
	if (<timer_has_expired> = 1)
		break
	endif
	Wait \{1
		Second}
	repeat
	menu_tr_confirm_band_name_timeout score_index = <score_index>
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = continue
		}}
endscript

script top_rockers_wait_for_time_or_input 
	printf \{"create_top_rockers_menu: No new score, let's hang out for a few seconds then exit"}
	add_user_control_helper \{text = "DONE"
		button = red
		z = 100}
	check_button = 4096
	wait_time = (350)
	begin
	GetHeldPattern controller = ($primary_controller) nobrokenstring
	if (<hold_pattern> && <check_button>)
		printf \{"create_top_rockers_menu: button pressed"}
		break
	endif
	if (<wait_time> = 0)
		printf \{"create_top_rockers_menu: time out"}
		break
	endif
	Wait \{1
		gameframe}
	wait_time = (<wait_time> - 1)
	repeat
	printf \{"create_top_rockers_menu: exit"}
	clean_up_user_control_helpers
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = continue
			play_sound = 0
		}}
endscript

script menu_top_rockers_create_poster 
	displaySprite \{parent = tr_container
		tex = Venue_Overlay
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 50}
	CreateScreenElement \{Type = SpriteElement
		parent = tr_container
		texture = Toprockers_poster
		Pos = (740.0, 30.0)
		just = [
			right
			top
		]
		dims = (620.0, 620.0)
		z_priority = 1.2
		rot_angle = -3}
	formatText \{TextName = Rockers_title
		"\\c9%T\\c0%R"
		t = "TOP"
		r = "ROCKERS"}
	CreateScreenElement {
		Type = TextElement
		parent = tr_container
		Pos = (460.0, 625.0)
		just = [center center]
		z_priority = 1.3
		font = fontgrid_title_gh3
		rot_angle = -4
		text = <Rockers_title>
	}
	fit_text_in_rectangle id = <id> dims = (380.0, 100.0) keep_ar = 1
endscript

script menu_top_rockers_create_paper 
	CreateScreenElement \{Type = ContainerElement
		parent = tr_container
		id = tr_paper_container
		Pos = (630.0, 90.0)}
	get_difficulty_text_nl difficulty = ($current_difficulty)
	get_song_prefix song = ($current_song)
	formatText checksumName = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
	GetGlobalTags <songname>
	get_difficulty_text difficulty = ($current_difficulty)
	get_song_title song = ($current_song)
	GetUpperCaseString <song_title>
	song_title = <UppercaseString>
	GetUpperCaseString <difficulty_text>
	difficulty_text = <UppercaseString>
	StringToCharArray string = <song_title>
	GetArraySize <char_array>
	max_width = 190
	printf "menu_top_rockers_create_paper: song title = %s, length = %d" s = <song_title> d = <array_Size>
	max_characters = 20
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
		<max_width> = 270
	endif
	formatText TextName = song_diff_text "\\c9%s \\c2%d" s = <song_title> d = <difficulty_text>
	CreateScreenElement {
		Type = TextElement
		parent = tr_container
		id = tr_song_name
		Pos = (435.0, 115.0)
		just = [center center]
		z_priority = 1.3
		font = fontgrid_title_gh3
		rot_angle = -3
		text = <song_diff_text>
	}
	fit_text_in_rectangle id = <id> dims = (380.0, 100.0) keep_ar = 1
	displaySprite \{parent = tr_container
		tex = Toprockers_Tape_1
		Pos = (500.0, -10.0)
		dims = (140.0, 70.0)
		z = 50}
	displaySprite \{parent = tr_container
		tex = Toprockers_Tape_2
		Pos = (280.0, 240.0)
		z = 50
		rot_angle = 90
		dims = (140.0, 70.0)}
	column_x = 65
	number_offset = (-55.0, 0.0)
	current_y_position = (20.0, 80.0)
	name_offset = (140.0, 7.0)
	bar_offset = (-100.0, 0.0)
	skull_offset = (-20.0, 0.0)
	score_val = 1
	begin
	formatText checksumName = song_score_cs 'score%d' d = <score_val>
	formatText TextName = song_score_text "%s" s = (<...>.<song_score_cs>) usecommas
	formatText checksumName = score_name_cs 'name%d' d = <score_val>
	formatText TextName = score_name_text "%s" s = (<...>.<score_name_cs>)
	formatText TextName = number_text "%n" n = <score_val>
	formatText checksumName = song_score_id 'song_score%d' d = <score_val>
	formatText checksumName = score_name_id 'score_name%d' d = <score_val>
	score_scale = (0.6, 0.8)
	rand = Random (@ 1 @ 2 )
	formatText checksumName = bar_tex 'Toprockers_Bar_%d' d = <rand>
	bar_flags = {}
	<rand> = Random (@ 1 @ 2 @ 3 )
	if (<rand> = 1)
		<bar_flags> = {flip_h}
	elseif (<rand> = 2)
		<bar_flags> = {flip_v}
	else
		<bar_flags> = {flip_v flip_h}
	endif
	bar_rgba = [150 70 95 255]
	text_rgba = [220 220 220 255]
	show_num = 1
	if (<score_val> = <highlight_index>)
		<bar_rgba> = [0 0 0 255]
		<text_rgba> = [190 160 30 255]
		<show_num> = 0
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = tr_paper_container
		Pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + <bar_offset>)
		z_priority = 1.0
		rgba = <bar_rgba>
		just = [left bottom]
		texture = <bar_tex>
		dims = (800.0, 45.0)
		<bar_flags>
	}
	if (<show_num> = 1)
		CreateScreenElement {
			Scale = 1.0
			Type = TextElement
			parent = tr_paper_container
			Pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + (0.0, 17.0))
			z_priority = 1.3
			rgba = [0 0 0 255]
			just = [left bottom]
			text = <number_text>
			font = fontgrid_title_gh3
		}
	else
		CreateScreenElement {
			Type = SpriteElement
			parent = tr_paper_container
			Pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + <skull_offset>)
			z_priority = 1.3
			rgba = [255 255 255 255]
			just = [left bottom]
			texture = Toprockers_Skull
			dims = (48.0, 48.0)
		}
	endif
	CreateScreenElement {
		Scale = <score_scale>
		Type = TextElement
		parent = tr_paper_container
		Pos = ((1.0, 0.0) * <column_x> + <current_y_position> + (0.0, 10.0))
		z_priority = 1.3
		rgba = <text_rgba>
		just = [left bottom]
		text = <song_score_text>
		font = fontgrid_title_gh3
		id = <song_score_id>
	}
	CreateScreenElement {
		Scale = (0.8, 0.8)
		Type = TextElement
		parent = tr_paper_container
		Pos = ((1.0, 0.0) * <column_x> + <current_y_position> + <name_offset> + (0.0, 3.0))
		z_priority = 1.3
		rgba = <text_rgba>
		just = [left bottom]
		text = <score_name_text>
		font = fontgrid_title_gh3
		id = <score_name_id>
	}
	GetScreenElementDims id = <id>
	<current_y_position> = (<current_y_position> + (0.0, 50.0))
	<score_val> = (<score_val> + 1)
	repeat ($num_top_scores)
endscript

script menu_top_rockers_create_continue_button 
	CreateScreenElement {
		Type = TextElement
		parent = root_window
		id = continue_button
		Scale = 0.9
		Pos = (690.0, 590.0)
		font = ($gh3_button_font)
		rgba = [255 255 255 255]
		just = [left top]
		z_priority = 4
	}
	CreateScreenElement {
		Type = TextElement
		parent = continue_button
		id = continue_text
		Scale = 0.8
		Pos = (40.0, 23.0)
		font = ($cash_reward_font)
		rgba = [0 0 0 255]
		just = [left center]
		z_priority = 4
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action params = {action = continue}}
		]
	}
	LaunchEvent \{Type = focus
		target = continue_text}
endscript

script menu_top_rockers_check_for_new_top_score \{nowrite = 0}
	printf \{"menu_top_rockers_check_for_new_top_score: Checking for new score"}
	newbestscore = 0
	player_score = ($player1_status.score)
	CastToInteger \{player_score}
	player_stars = ($player1_status.stars)
	get_difficulty_text_nl difficulty = ($current_difficulty)
	get_song_prefix song = ($current_song)
	formatText checksumName = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
	GetGlobalTags <songname>
	score_array = [0 0 0 0 0 0 0 0 0 0]
	name_array = ["" "" "" "" "" "" "" "" "" ""]
	stars_array = [0 0 0 0 0 0 0 0 0 0]
	score_index = 0
	begin
	formatText checksumName = score_cs 'score%d' d = (<score_index> + 1)
	formatText checksumName = name_cs 'name%d' d = (<score_index> + 1)
	formatText checksumName = stars_cs 'stars%d' d = (<score_index> + 1)
	SetArrayElement ArrayName = score_array index = <score_index> NewValue = (<...>.<score_cs>)
	SetArrayElement ArrayName = name_array index = <score_index> NewValue = (<...>.<name_cs>)
	SetArrayElement ArrayName = stars_array index = <score_index> NewValue = (<...>.<stars_cs>)
	<score_index> = (<score_index> + 1)
	repeat ($num_top_scores)
	<score_index> = 0
	new_score = -1
	begin
	if (<player_score> > (<score_array> [<score_index>]))
		<new_score> = <score_index>
		if (<nowrite> = 0)
			score_shift_index = ($num_top_scores - 2)
			if NOT (($num_top_scores - (<score_index> + 1)) = 0)
				begin
				SetArrayElement ArrayName = score_array index = (<score_shift_index> + 1) NewValue = (<score_array> [<score_shift_index>])
				SetArrayElement ArrayName = name_array index = (<score_shift_index> + 1) NewValue = (<name_array> [<score_shift_index>])
				SetArrayElement ArrayName = stars_array index = (<score_shift_index> + 1) NewValue = (<stars_array> [<score_shift_index>])
				<score_shift_index> = (<score_shift_index> - 1)
				repeat ($num_top_scores - (<score_index> + 1))
			endif
			SetArrayElement ArrayName = score_array index = <score_index> NewValue = <player_score>
			SetArrayElement ArrayName = stars_array index = <score_index> NewValue = <player_stars>
		endif
		break
	endif
	<score_index> = (<score_index> + 1)
	repeat ($num_top_scores)
	if (<bestscore> < <player_score>)
		bestscore = <player_score>
		beststars = <player_stars>
		SetGlobalTags <songname> params = {bestscore = <bestscore>}
		SetGlobalTags <songname> params = {beststars = <beststars>}
		newbestscore = 1
	endif
	if (<nowrite> = 1)
		return new_score = <new_score> newbestscore = 1
	endif
	SetGlobalTags <songname> params = {score1 = (<score_array> [0]) score2 = (<score_array> [1]) score3 = (<score_array> [2]) score4 = (<score_array> [3]) score5 = (<score_array> [4]) score6 = (<score_array> [5]) score7 = (<score_array> [6]) score8 = (<score_array> [7]) score9 = (<score_array> [8]) score10 = (<score_array> [9])}
	SetGlobalTags <songname> params = {name1 = (<name_array> [0]) name2 = (<name_array> [1]) name3 = (<name_array> [2]) name4 = (<name_array> [3]) name5 = (<name_array> [4]) name6 = (<name_array> [5]) name7 = (<name_array> [6]) name8 = (<name_array> [7]) name9 = (<name_array> [8]) name10 = (<name_array> [9])}
	SetGlobalTags <songname> params = {stars1 = (<stars_array> [0]) stars2 = (<stars_array> [1]) stars3 = (<stars_array> [2]) stars4 = (<stars_array> [3]) stars5 = (<stars_array> [4]) stars6 = (<stars_array> [5]) stars7 = (<stars_array> [6]) stars8 = (<stars_array> [7]) stars9 = (<stars_array> [8]) stars10 = (<stars_array> [9])}
	return new_score = <new_score> newbestscore = 0
endscript

script menu_top_rockers_clear_new_band_name 
	Change \{new_band_name = [
			"A"
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
			""
		]}
	Change \{default_band_indexes = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]}
	Change \{new_band_index = 0}
	Change \{tr_first_time_initialised = 1}
endscript
tr_first_time_initialised = 0

script menu_top_rockers_init_band_name_creation \{score_index = 0}
	printf \{"menu_top_rockers_init_band_name_creation: enter with new band name = %s"
		s = $new_band_name}
	if ($left_player_continue = 0 && $right_player_continue = 0)
		menu_top_rockers_clear_new_band_name
		Change \{new_band_name = [
				"A"
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
			]}
		Change \{default_band_indexes = [
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
			]}
		Change \{new_band_index = 0}
	endif
	exclusive_dev = $primary_controller
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				null_script
			}
		]
		replace_handlers}
	event_handlers = [
		{pad_up menu_tr_change_character params = {up score_index = (<score_index>)}}
		{pad_down menu_tr_change_character params = {down score_index = (<score_index>)}}
		{pad_choose menu_tr_band_advance_pointer params = {score_index = (<score_index>)}}
		{pad_back menu_tr_band_retreat_pointer params = {score_index = (<score_index>)}}
		{pad_square menu_tr_confirm_band_name params = {score_index = (<score_index>)}}
	]
	formatText checksumName = score_name_id 'score_name%d' d = (<score_index> + 1)
	SetScreenElementProps id = <score_name_id> event_handlers = <event_handlers> exclusive_device = <exclusive_dev> replace_handlers
	LaunchEvent Type = focus target = <score_name_id>
	menu_tr_refresh_band_name score_index = <score_index>
	SpawnScriptNow menu_tr_flash_newest_character params = {score_index = <score_index>}
endscript

script menu_tr_get_band_name_text_flash 
	temp_new_band_name = ["A" "" "" "" "" "" "" "" "" ""
		"" "" "" "" "" ""]
	i = 0
	begin
	SetArrayElement ArrayName = temp_new_band_name index = <i> NewValue = ($new_band_name [<i>])
	<i> = (<i> + 1)
	repeat 16
	newest_char = (<temp_new_band_name> [$new_band_index])
	SetArrayElement \{ArrayName = temp_new_band_name
		index = $new_band_index
		NewValue = ""}
	formatText TextName = band_name_text_string_flash "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p" a = (<temp_new_band_name> [0]) b = (<temp_new_band_name> [1]) c = (<temp_new_band_name> [2]) d = (<temp_new_band_name> [3]) e = (<temp_new_band_name> [4]) f = (<temp_new_band_name> [5]) g = (<temp_new_band_name> [6]) h = (<temp_new_band_name> [7]) i = (<temp_new_band_name> [8]) j = (<temp_new_band_name> [9]) k = (<temp_new_band_name> [10]) l = (<temp_new_band_name> [11]) m = (<temp_new_band_name> [12]) n = (<temp_new_band_name> [13]) o = (<temp_new_band_name> [14]) p = (<temp_new_band_name> [15])
	SetArrayElement ArrayName = temp_new_band_name index = $new_band_index NewValue = <newest_char>
	return band_name_text_string_flash = <band_name_text_string_flash>
endscript

script menu_tr_flash_newest_character \{score_index = 0}
	flash_counter = 0
	begin
	formatText checksumName = score_name_id 'score_name%d' d = (<score_index> + 1)
	if ($new_band_index < $tr_max_band_characters)
		MathMod a = <flash_counter> b = 30
		if (<Mod> < 15)
			if (<Mod> = 0)
			endif
			menu_tr_get_band_name_text_flash
			SetScreenElementProps id = <score_name_id> text = (<band_name_text_string_flash>)
		else
			if (<Mod> = 15)
			endif
			menu_tr_get_band_name_text
			SetScreenElementProps id = <score_name_id> text = (<band_name_text_string>)
		endif
	else
		menu_tr_get_band_name_text
		SetScreenElementProps id = <score_name_id> text = (<band_name_text_string>)
	endif
	<flash_counter> = (<flash_counter> + 1)
	Wait \{1
		gameframe}
	repeat
endscript

script menu_tr_get_band_name_text 
	formatText TextName = band_name_text_string "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p" a = ($new_band_name [0]) b = ($new_band_name [1]) c = ($new_band_name [2]) d = ($new_band_name [3]) e = ($new_band_name [4]) f = ($new_band_name [5]) g = ($new_band_name [6]) h = ($new_band_name [7]) i = ($new_band_name [8]) j = ($new_band_name [9]) k = ($new_band_name [10]) l = ($new_band_name [11]) m = ($new_band_name [12]) n = ($new_band_name [13]) o = ($new_band_name [14]) p = ($new_band_name [15])
	return band_name_text_string = <band_name_text_string>
endscript

script menu_tr_refresh_band_name \{score_index = 0}
	printf "Score index is %d" d = <score_index>
	formatText checksumName = score_name_id 'score_name%d' d = (<score_index> + 1)
	formatText TextName = temp_score_name_id "score_name%d" d = (<score_index> + 1)
	menu_tr_get_band_name_text
	SetScreenElementProps id = <score_name_id> text = (<band_name_text_string>)
	GetScreenElementDims id = <score_name_id>
	printf "id %a OLD WIDTH: %d" a = <temp_score_name_id> d = <width>
endscript

script menu_tr_censor_bad_words 
	badwords = [
		"FUCK" "BITCH" "NIGGER" "CUNT" "POONANI"
		"SHIT" "SLUT" "ASS" "VAGINA" "WETBACK"
		"GOOK" "FAGGOT" "PUSSY" "TITS" "WHORE"
		"MIDWAY" "NIGGA" "TWAT" "JISM" "JIZM"
		"FAG" "CLIT" "ARSE" "DILDO" "PUSSIES"
		"HOLE" "LESBO" "SHIZ" "BUKKAKE" "WIGGER"
		"WIGGA" "JIZZ" "TITTIES" "TITTY" "STFU"
		"GTFO" "DYKE" "FOAD" "FUK" "FOOK"
		"RETARD" "WANK" "WANG" "PRICK" "NAZI"
		"HITLER" "CHINK" "GOATSE" "FOCK" "FECK"
		"JACKOFF" "QUEER" "HOMO" "GAY" "PENIS"
		"COCK" "SUCK" "DICK" "DOUCHE" "KLAN"
		"RAPE" "SEX" "BEYOTCH" "BIOTCH" "BASTARD"
		"FUQ" "FUK" "FUX" "SHLONG" "SCHLONG"
		"SKANK" "CRAP" "PISS" "BONER" "BOOB"
		"LESBIAN" "NUTSACK" "TESTES" "LABIA" "PRICK"
		"KKK" "SPIC" "BEANER" "PINKO" "DARKIE"
		"COON" "SPOOK" "OSAMA" "SADDAM" "HUSSEIN"
		"GIZZ" "GISM" "GIZM" "GUZZLE" "SEMEN"
		"CUM" "SPOOGE" "PHUQ" "PHUX" "NIPPLE"
		"PHAGGOT" "PHUK" "PHOCK" "PHUCK" "FART"
		"KWEER" "KUNT" "KVNT" "CVNT" "KLIT"
		"COOCHIE" "ORALLUV" "ANALLUV" "COCAINE" "DOWEED"
		"DOCOKE" "DOLSD" "DODRUGS" "CONDOM" "ANALDRP"
		"ANLDRIP" "MUFDIVR" "LEZBO" "GAGONIT" "BLOWJOB"
		"BLOWME" "CAMLTOE" "CAMELTO" "EATME" "HANDJOB"
		"ORGASM" "SUKONIT" "SUCKNIT" "PECKER" "TAMPON"
		"HOOKER" "BONGHIT" "PORN" "FACIAL" "PUBIC"
		"FECES" "FECAL" "KYJELLY" "PHUC" "CHODE"
		"PUZZY" "PUZZIES" "LEZBIAN" "SODOMY" "DOCRACK"
		"FAH Q" "KHUNT" "SKULFUK" "MERDE" "BICH"
		"BEATOFF" "BIATCH" "CONDOM" "FISTING" "FUUCK"
		"JIZ" "LEZZY" "MUFF" "SCROTUM" "VULVA"
		"FCK" "CNT" "SHT" "FGT" "BCH"
		"BEAVER" "BLOJOB" "CACK" "GONAD" "JEW"
		"KIKE" "SPERM" "SPUNK" "TURD" "QUIFF"
		"SECKS" "KNOBJOB" "HEADGIVER" "DAGO" "BINDU"
	]
	goodwords = [
		"AXEL" "JOHNNY" "JUDY" "IZZY" "CASEY" "LARS" "MIDORI" "SLASH"
	]
	new_band_name_trimmed = ["" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""]
	new_band_name_char_idx = 0
	new_band_name_trimmed_char_idx = 0
	badwords_idx = 0
	got_bad_word = 0
	GetArraySize <badwords>
	numbadwords = <array_Size>
	GetArraySize <goodwords>
	numgoodwords = <array_Size>
	printf \{"menu_tr_censor_bad_words: new_band_index = %d"
		d = $new_band_index}
	if ($new_band_index)
		begin
		printf "menu_tr_censor_bad_words: checking character %d" d = <new_band_name_char_idx>
		if ($new_band_name [<new_band_name_char_idx>] = "")
			printf \{"menu_tr_censor_bad_words: we have a null"}
		elseif ($new_band_name [<new_band_name_char_idx>] = " ")
			printf \{"menu_tr_censor_bad_words: we have a space"}
		elseif ($new_band_name [<new_band_name_char_idx>] = "")
			printf \{"menu_tr_censor_bad_words: we have a backslash L"}
		else
			printf \{"menu_tr_censor_bad_words: I don't know what we have"}
		endif
		if (($new_band_name [<new_band_name_char_idx>] != "") && ($new_band_name [<new_band_name_char_idx>] != " ") && ($new_band_name [<new_band_name_char_idx>] != ""))
			switch ($new_band_name [<new_band_name_char_idx>])
				case "1"
				printf \{"menu_tr_censor_bad_words: case 1"}
				if ($new_band_name [(<new_band_name_char_idx> + 1)] = "3")
					SetArrayElement ArrayName = new_band_name_trimmed index = <new_band_name_trimmed_char_idx> NewValue = "B"
					<new_band_name_char_idx> = (<new_band_name_char_idx> + 1)
				else
					SetArrayElement ArrayName = new_band_name_trimmed index = <new_band_name_trimmed_char_idx> NewValue = "I"
				endif
				case "2"
				printf \{"menu_tr_censor_bad_words: case 2"}
				SetArrayElement ArrayName = new_band_name_trimmed index = <new_band_name_trimmed_char_idx> NewValue = "Z"
				case "3"
				printf \{"menu_tr_censor_bad_words: case 3"}
				SetArrayElement ArrayName = new_band_name_trimmed index = <new_band_name_trimmed_char_idx> NewValue = "E"
				case "4"
				printf \{"menu_tr_censor_bad_words: case 4"}
				SetArrayElement ArrayName = new_band_name_trimmed index = <new_band_name_trimmed_char_idx> NewValue = "A"
				case "5"
				printf \{"menu_tr_censor_bad_words: case 5"}
				SetArrayElement ArrayName = new_band_name_trimmed index = <new_band_name_trimmed_char_idx> NewValue = "S"
				case "6"
				printf \{"menu_tr_censor_bad_words: case 6"}
				SetArrayElement ArrayName = new_band_name_trimmed index = <new_band_name_trimmed_char_idx> NewValue = "B"
				case "7"
				printf \{"menu_tr_censor_bad_words: case 7"}
				SetArrayElement ArrayName = new_band_name_trimmed index = <new_band_name_trimmed_char_idx> NewValue = "T"
				case "8"
				printf \{"menu_tr_censor_bad_words: case 8"}
				SetArrayElement ArrayName = new_band_name_trimmed index = <new_band_name_trimmed_char_idx> NewValue = "B"
				case "9"
				printf \{"menu_tr_censor_bad_words: case 9"}
				SetArrayElement ArrayName = new_band_name_trimmed index = <new_band_name_trimmed_char_idx> NewValue = "G"
				case "0"
				printf \{"menu_tr_censor_bad_words: case 0"}
				SetArrayElement ArrayName = new_band_name_trimmed index = <new_band_name_trimmed_char_idx> NewValue = "O"
				default
				printf \{"menu_tr_censor_bad_words: default"}
				SetArrayElement ArrayName = new_band_name_trimmed index = <new_band_name_trimmed_char_idx> NewValue = ($new_band_name [<new_band_name_char_idx>])
			endswitch
			<new_band_name_trimmed_char_idx> = (<new_band_name_trimmed_char_idx> + 1)
		else
			printf "menu_tr_censor_bad_words: blank found at index %d" d = <new_band_name_char_idx>
		endif
		<new_band_name_char_idx> = (<new_band_name_char_idx> + 1)
		repeat ($new_band_index)
	endif
	printf "menu_tr_censor_bad_words: trimmed name length is %d" d = <new_band_name_trimmed_char_idx>
	if (<new_band_name_trimmed_char_idx> > 0)
		begin
		StringToCharArray string = (<badwords> [<badwords_idx>])
		GetArraySize <char_array>
		string_search_idx = 0
		begin
		substring_search_idx = 0
		if ((<new_band_name_trimmed> [<string_search_idx>]) = (<char_array> [<substring_search_idx>]))
			begin
			if ((<new_band_name_trimmed> [(<string_search_idx> + <substring_search_idx>)]) != (<char_array> [<substring_search_idx>]))
				break
			endif
			<substring_search_idx> = (<substring_search_idx> + 1)
			repeat (<array_Size>)
			if (<substring_search_idx> = <array_Size>)
				<got_bad_word> = 1
				break
			endif
		endif
		<string_search_idx> = (<string_search_idx> + 1)
		repeat (<new_band_name_trimmed_char_idx>)
		if (<got_bad_word> = 1)
			break
		endif
		<badwords_idx> = (<badwords_idx> + 1)
		repeat (<numbadwords>)
	endif
	if ((<got_bad_word> = 1) || (<new_band_name_trimmed_char_idx> = 0))
		printf \{"menu_tr_censor_bad_words: bad word found, replacing"}
		GetRandomValue Name = random_value integer a = 0 b = (<numgoodwords> -1)
		StringToCharArray string = (<goodwords> [<random_value>])
		GetArraySize <char_array>
		char_array_size = <array_Size>
		Change \{new_band_name = [
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
				""
			]}
		Change \{default_band_indexes = [
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
			]}
		bad_word_replace_idx = 0
		begin
		SetArrayElement ArrayName = new_band_name globalarray index = <bad_word_replace_idx> NewValue = (<char_array> [<bad_word_replace_idx>])
		GetArraySize \{$default_band_characters}
		dbc_index = 0
		begin
		if (($default_band_characters [<dbc_index>]) = (<char_array> [<bad_word_replace_idx>]))
			break
		endif
		<dbc_index> = (<dbc_index> + 1)
		repeat (<array_Size>)
		SetArrayElement ArrayName = default_band_indexes globalarray index = <bad_word_replace_idx> NewValue = <dbc_index>
		<bad_word_replace_idx> = (<bad_word_replace_idx> + 1)
		repeat (<char_array_size>)
		Change new_band_index = <char_array_size>
	endif
endscript

script menu_tr_confirm_band_name 
	if (($new_band_index + 1) < $tr_max_band_characters)
		newest_char = ($new_band_name [$new_band_index])
		SetArrayElement \{ArrayName = new_band_name
			globalarray
			index = $new_band_index
			NewValue = ""}
		formatText TextName = band_name_text_string_flash "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p" a = ($new_band_name [0]) b = ($new_band_name [1]) c = ($new_band_name [2]) d = ($new_band_name [3]) e = ($new_band_name [4]) f = ($new_band_name [5]) g = ($new_band_name [6]) h = ($new_band_name [7]) i = ($new_band_name [8]) j = ($new_band_name [9]) k = ($new_band_name [10]) l = ($new_band_name [11]) m = ($new_band_name [12]) n = ($new_band_name [13]) o = ($new_band_name [14]) p = ($new_band_name [15])
		formatText TextName = band_name_text_string "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p" a = ($new_band_name [0]) b = ($new_band_name [1]) c = ($new_band_name [2]) d = ($new_band_name [3]) e = ($new_band_name [4]) f = ($new_band_name [5]) g = ($new_band_name [6]) h = ($new_band_name [7]) i = ($new_band_name [8]) j = ($new_band_name [9]) k = ($new_band_name [10]) l = ($new_band_name [11]) m = ($new_band_name [12]) n = ($new_band_name [13]) o = ($new_band_name [14]) p = ($new_band_name [15])
		menu_tr_refresh_band_name score_index = <score_index>
	endif
	Wait \{0.25
		Second}
	menu_tr_censor_bad_words
	menu_tr_get_band_name_text
	StringRemoveTrailingWhitespace string = <band_name_text_string>
	get_difficulty_text_nl difficulty = ($current_difficulty)
	get_song_prefix song = ($current_song)
	formatText checksumName = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
	switch (<score_index> + 1)
		case 1
		SetGlobalTags <songname> params = {name1 = <new_string>}
		case 2
		SetGlobalTags <songname> params = {name2 = <new_string>}
		case 3
		SetGlobalTags <songname> params = {name3 = <new_string>}
		case 4
		SetGlobalTags <songname> params = {name4 = <new_string>}
		case 5
		SetGlobalTags <songname> params = {name5 = <new_string>}
		case 6
		SetGlobalTags <songname> params = {name6 = <new_string>}
		case 7
		SetGlobalTags <songname> params = {name7 = <new_string>}
		case 8
		SetGlobalTags <songname> params = {name8 = <new_string>}
		case 9
		SetGlobalTags <songname> params = {name9 = <new_string>}
		case 10
		SetGlobalTags <songname> params = {name10 = <new_string>}
	endswitch
	ui_flow_manager_respond_to_action \{action = continue}
endscript

script menu_tr_confirm_band_name_timeout 
	if (($new_band_index + 1) < $tr_max_band_characters)
		newest_char = ($new_band_name [$new_band_index])
		SetArrayElement \{ArrayName = new_band_name
			globalarray
			index = $new_band_index
			NewValue = ""}
		formatText TextName = band_name_text_string_flash "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p" a = ($new_band_name [0]) b = ($new_band_name [1]) c = ($new_band_name [2]) d = ($new_band_name [3]) e = ($new_band_name [4]) f = ($new_band_name [5]) g = ($new_band_name [6]) h = ($new_band_name [7]) i = ($new_band_name [8]) j = ($new_band_name [9]) k = ($new_band_name [10]) l = ($new_band_name [11]) m = ($new_band_name [12]) n = ($new_band_name [13]) o = ($new_band_name [14]) p = ($new_band_name [15])
		formatText TextName = band_name_text_string "%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p" a = ($new_band_name [0]) b = ($new_band_name [1]) c = ($new_band_name [2]) d = ($new_band_name [3]) e = ($new_band_name [4]) f = ($new_band_name [5]) g = ($new_band_name [6]) h = ($new_band_name [7]) i = ($new_band_name [8]) j = ($new_band_name [9]) k = ($new_band_name [10]) l = ($new_band_name [11]) m = ($new_band_name [12]) n = ($new_band_name [13]) o = ($new_band_name [14]) p = ($new_band_name [15])
		menu_tr_refresh_band_name score_index = <score_index>
	endif
	Wait \{0.25
		Second}
	menu_tr_censor_bad_words
	menu_tr_get_band_name_text
	StringRemoveTrailingWhitespace string = <band_name_text_string>
	get_difficulty_text_nl difficulty = ($current_difficulty)
	get_song_prefix song = ($current_song)
	formatText checksumName = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
	switch (<score_index> + 1)
		case 1
		SetGlobalTags <songname> params = {name1 = <new_string>}
		case 2
		SetGlobalTags <songname> params = {name2 = <new_string>}
		case 3
		SetGlobalTags <songname> params = {name3 = <new_string>}
		case 4
		SetGlobalTags <songname> params = {name4 = <new_string>}
		case 5
		SetGlobalTags <songname> params = {name5 = <new_string>}
		case 6
		SetGlobalTags <songname> params = {name6 = <new_string>}
		case 7
		SetGlobalTags <songname> params = {name7 = <new_string>}
		case 8
		SetGlobalTags <songname> params = {name8 = <new_string>}
		case 9
		SetGlobalTags <songname> params = {name9 = <new_string>}
		case 10
		SetGlobalTags <songname> params = {name10 = <new_string>}
	endswitch
endscript

script menu_tr_change_character_up 
	generic_menu_up_or_down_sound \{up}
	SetArrayElement ArrayName = default_band_indexes globalarray index = $new_band_index NewValue = ($default_band_indexes [$new_band_index] + 1)
	GetArraySize \{$default_band_characters}
	if ($default_band_indexes [$new_band_index] > (<array_Size> -1))
		SetArrayElement \{ArrayName = default_band_indexes
			globalarray
			index = $new_band_index
			NewValue = 0}
	endif
	SetArrayElement ArrayName = new_band_name globalarray index = $new_band_index NewValue = ($default_band_characters [($default_band_indexes [$new_band_index])])
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_change_character_down 
	generic_menu_up_or_down_sound \{down}
	SetArrayElement ArrayName = default_band_indexes globalarray index = $new_band_index NewValue = ($default_band_indexes [$new_band_index] -1)
	GetArraySize \{$default_band_characters}
	if ($default_band_indexes [$new_band_index] < 0)
		SetArrayElement ArrayName = default_band_indexes globalarray index = $new_band_index NewValue = (<array_Size> -1)
	endif
	SetArrayElement ArrayName = new_band_name globalarray index = $new_band_index NewValue = ($default_band_characters [($default_band_indexes [$new_band_index])])
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_band_advance_pointer 
	if (($new_band_index + 1) < $tr_max_band_characters)
		Change new_band_index = ($new_band_index + 1)
		printf \{"menu_tr_band_advance_pointer: new_band_index = %d"
			d = $new_band_index}
		SetArrayElement ArrayName = new_band_name globalarray index = $new_band_index NewValue = ($default_band_characters [($default_band_indexes [$new_band_index])])
		menu_tr_refresh_band_name score_index = <score_index> add_2_width
	else
		menu_tr_confirm_band_name score_index = <score_index>
	endif
endscript

script menu_tr_band_retreat_pointer 
	if (($new_band_index -1) > -1)
		SetArrayElement ArrayName = default_band_indexes globalarray index = ($new_band_index) NewValue = 0
		Change new_band_index = ($new_band_index -1)
		printf \{"menu_tr_band_retreat_pointer: new_band_index = %d"
			d = $new_band_index}
		SetArrayElement ArrayName = new_band_name globalarray index = ($new_band_index + 1) NewValue = ""
		menu_tr_refresh_band_name score_index = <score_index>
	endif
endscript

script menu_tr_change_character 
	if IsGuitarController controller = <device_num>
		if GotParam \{up}
			menu_tr_change_character_down score_index = <score_index>
		else
			menu_tr_change_character_up score_index = <score_index>
		endif
	else
		if GotParam \{up}
			menu_tr_change_character_up score_index = <score_index>
		else
			menu_tr_change_character_down score_index = <score_index>
		endif
	endif
endscript

script menu_top_rockers_create_attract_poster \{coinup = 0}
	displaySprite \{parent = tr_container
		tex = Venue_Overlay
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 50}
	if (<coinup> = 1)
		CreateScreenElement \{Type = SpriteElement
			parent = tr_container
			texture = Toprockers_poster_blue
			Pos = (500.0, -530.0)
			just = [
				right
				top
			]
			dims = (620.0, 620.0)
			z_priority = 0.8
			rot_angle = -5}
		formatText \{TextName = of_the_world
			"\\c9%O\\c9%T\\c2%W"
			o = "OF"
			t = "THE"
			w = "WORLD"}
		CreateScreenElement {
			Type = TextElement
			parent = tr_container
			text = <of_the_world>
			rgba = [182 95 122 255]
			Pos = (340.0, 90.0)
			just = [center center]
			z_priority = 1.4
			font = fontgrid_title_gh3
			rot_angle = -6
			z_priority = 0.82
			Scale = 0.8
		}
	else
		CreateScreenElement \{Type = SpriteElement
			parent = tr_container
			texture = Toprockers_poster
			Pos = (500.0, -530.0)
			just = [
				right
				top
			]
			dims = (620.0, 620.0)
			z_priority = 0.8
			rot_angle = -5}
	endif
	CreateScreenElement \{Type = SpriteElement
		parent = tr_container
		texture = Multiplayer_2p_Jacket_02
		Pos = (455.0, -360.0)
		just = [
			left
			top
		]
		dims = (480.0, 480.0)
		z_priority = 0.8
		rot_angle = -2}
	formatText \{TextName = Rockers_title
		"\\c9%T\\c0%R"
		t = "TOP"
		r = "ROCKERS"}
	CreateScreenElement {
		Type = TextElement
		parent = tr_container
		Pos = (240.0, 75.0)
		just = [center center]
		z_priority = 1.3
		font = fontgrid_title_gh3
		rot_angle = -6
		text = <Rockers_title>
		z_priority = 0.81
	}
	fit_text_in_rectangle id = <id> dims = (380.0, 100.0) keep_ar = 1
	displayText parent = tr_container text = "EASY" Pos = (192.0, 145.0) z = <z> Scale = 1.0 just = [center center] rgba = [255 255 255 255] font = fontgrid_title_gh3 rot = -2 Shadow
	displayText parent = tr_container text = "MEDIUM" Pos = (497.0, 146.0) z = <z> Scale = 1.0 just = [center center] rgba = [255 255 255 255] font = fontgrid_title_gh3 rot = -3 Shadow
	displayText parent = tr_container text = "HARD" Pos = (814.0, 145.0) z = <z> Scale = 1.0 just = [center center] rgba = [255 255 255 255] font = fontgrid_title_gh3 rot = -1 Shadow
	displayText parent = tr_container text = "EXPERT" Pos = (1116.0, 144.0) z = <z> Scale = 1.0 just = [center center] rgba = [255 255 255 255] font = fontgrid_title_gh3 rot = -2 Shadow
endscript

script menu_top_rockers_create_attract_paper \{coinup = 0}
	CreateScreenElement \{Type = ContainerElement
		parent = tr_container
		id = tr_paper_container
		Pos
		(90.0, 90.0)}
	get_song_title song = ($current_song)
	GetUpperCaseString <song_title>
	song_title = <UppercaseString>
	StringToCharArray string = <song_title>
	GetArraySize <char_array>
	max_width = 190
	max_characters = 20
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
		<max_width> = 270
	endif
	formatText TextName = song_diff_text "\\c9%s" s = <song_title>
	CreateScreenElement {
		Type = TextElement
		parent = tr_container
		id = <tr_song_name>
		Pos = (705.0, 60.0)
		just = [center center]
		z_priority = 1.3
		font = fontgrid_title_gh3
		rot_angle = -1
		text = <song_diff_text>
	}
	fit_text_in_rectangle id = <id> dims = (380.0, 100.0) keep_ar = 1 only_if_larger_x = 1
	diff = easy
	diffidx = 1
	begin
	switch (<diffidx>)
		case 1
		<diff> = easy
		case 2
		<diff> = medium
		case 3
		<diff> = hard
		case 4
		<diff> = expert
	endswitch
	printf "%i %a" i = <diffidx> a = <diff>
	get_song_prefix song = ($current_song)
	get_difficulty_text_nl difficulty = (<diff>)
	formatText checksumName = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
	GetGlobalTags <songname>
	column_x = 65
	number_offset = (-40.0, 0.0)
	current_y_position = (20.0, 200.0)
	name_offset = (105.0, 7.0)
	bar_offset = (-15.0, 0.0)
	skull_offset = (-20.0, 0.0)
	score_val = 1
	begin
	formatText checksumName = song_score_cs 'score%d' d = <score_val>
	formatText TextName = song_score_text "%s" s = (<...>.<song_score_cs>) usecommas
	formatText checksumName = score_name_cs 'name%d' d = <score_val>
	formatText TextName = score_name_text "%s" s = (<...>.<score_name_cs>)
	formatText TextName = number_text "%n" n = <score_val>
	formatText checksumName = song_score_idId 'song_score%d%i' d = <score_val> i = <diffidx>
	formatText checksumName = score_name_idId 'score_name%d%i' d = <score_val> i = <diffidx>
	score_scale = (0.6, 0.75)
	rand = Random (@ 1 @ 2 )
	formatText checksumName = bar_tex 'Toprockers_Bar_%d' d = <rand>
	bar_flags = {}
	<rand> = Random (@ 1 @ 2 @ 3 )
	if (<rand> = 1)
		<bar_flags> = {flip_h}
	elseif (<rand> = 2)
		<bar_flags> = {flip_v}
	else
		<bar_flags> = {flip_v flip_h}
	endif
	if (<coinup> = 1)
		bar_rgba = [71 116 150 255]
	else
		bar_rgba = [150 70 95 255]
	endif
	text_rgba = [220 220 220 255]
	show_num = 1
	if (<score_val> = <highlight_index>)
		<bar_rgba> = [0 0 0 255]
		<text_rgba> = [190 160 30 255]
		<show_num> = 0
	endif
	CreateScreenElement {
		Type = SpriteElement
		parent = tr_paper_container
		Pos = ((310.0, 0.0) * (<diffidx> -1) + (1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + <bar_offset>)
		z_priority = 1.0
		rgba = <bar_rgba>
		just = [left bottom]
		texture = <bar_tex>
		dims = (300.0, 45.0)
		<bar_flags>
	}
	if (<show_num> = 1)
		CreateScreenElement {
			Scale = 0.9
			Type = TextElement
			parent = tr_paper_container
			Pos = ((310.0, 0.0) * (<diffidx> -1) + (1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + (0.0, 17.0))
			z_priority = 1.3
			rgba = [0 0 0 255]
			just = [left bottom]
			text = <number_text>
			font = fontgrid_title_gh3
		}
	else
		CreateScreenElement {
			Type = SpriteElement
			parent = tr_paper_container
			Pos = ((310.0, 0.0) * (<diffidx> -1) + (1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + <skull_offset>)
			z_priority = 1.3
			rgba = [255 255 255 255]
			just = [left bottom]
			texture = Toprockers_Skull
			dims = (48.0, 48.0)
		}
	endif
	CreateScreenElement {
		Scale = <score_scale>
		Type = TextElement
		parent = tr_paper_container
		Pos = ((310.0, 0.0) * (<diffidx> -1) + (1.0, 0.0) * <column_x> + <current_y_position> + (0.0, 10.0))
		z_priority = 1.3
		rgba = <text_rgba>
		just = [left bottom]
		text = <song_score_text>
		font = fontgrid_title_gh3
		id = <song_score_idId>
	}
	CreateScreenElement {
		Scale = (0.75, 0.75)
		Type = TextElement
		parent = tr_paper_container
		Pos = ((310.0, 0.0) * (<diffidx> -1) + (1.0, 0.0) * <column_x> + <current_y_position> + <name_offset> + (0.0, 3.0))
		z_priority = 1.3
		rgba = <text_rgba>
		just = [left bottom]
		text = <score_name_text>
		font = fontgrid_title_gh3
		id = <score_name_idId>
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> dims = (95.0, 35.0) only_if_larger_x = 1
	<current_y_position> = (<current_y_position> + (0.0, 50.0))
	<score_val> = (<score_val> + 1)
	repeat ($num_top_scores)
	<diffidx> = (<diffidx> + 1)
	repeat 4
endscript

script create_top_rockers_attract_menu \{coinup = 0}
	printf \{"Enter create_top_rockers_attract_menu"}
	disable_pause
	create_menu_backdrop \{texture = Toprockers_bg}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = tr_container
		Pos = (0.0, 0.0)
		dim = (1280.0, 720.0)}
	menu_top_rockers_create_attract_poster coinup = <coinup>
	printf \{"create_top_rockers_attract_menu: creating paper highlight"}
	menu_top_rockers_create_attract_paper highlight_index = (0) coinup = <coinup>
endscript

script destroy_top_rockers_attract_menu 
	printf \{"destroy_top_rockers_attract_menu: enter"}
	clean_up_user_control_helpers
	destroy_menu_backdrop
	destroy_menu \{menu_id = tr_container}
	destroy_menu \{menu_id = continue_button}
	destroy_menu \{menu_id = back_button}
	KillSpawnedScript \{Name = tr_watch_timer}
	printf \{"destroy_top_rockers_attract_menu: exit"}
	Change \{in_hst = 0}
endscript
g_top_rockers_loading_screen_split_container_id = id

script create_top_rockers_loading_screen \{coinup = 0}
	kill_start_key_binding
	if ($is_changing_levels = 1)
		return
	endif
	Change \{is_changing_levels = 1}
	if ($login_active)
		coinup = 1
	endif
	KillSpawnedScript \{Name = destroy_top_rockers_loading_screen_spawned}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = tr_ls_container
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = SpriteElement
		parent = tr_ls_container
		id = tr_ls_backdrop
		texture = Toprockers_bg
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 4500}
	displaySprite \{parent = tr_ls_container
		tex = Venue_Overlay
		Pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		z = 6000}
	if (<coinup> = 1)
		CreateScreenElement \{Type = SpriteElement
			parent = tr_ls_container
			texture = Toprockers_poster_blue
			Pos = (740.0, 30.0)
			just = [
				right
				top
			]
			dims = (620.0, 620.0)
			z_priority = 5010
			rot_angle = -3}
	else
		CreateScreenElement \{Type = SpriteElement
			parent = tr_ls_container
			texture = Toprockers_poster
			Pos = (740.0, 30.0)
			just = [
				right
				top
			]
			dims = (620.0, 620.0)
			z_priority = 5010
			rot_angle = -3}
	endif
	formatText \{TextName = Rockers_title
		"\\c9%T\\c0%R"
		t = "TOP"
		r = "ROCKERS"}
	CreateScreenElement {
		Type = TextElement
		parent = tr_ls_container
		Pos = (460.0, 625.0)
		just = [center center]
		z_priority = 5015
		font = fontgrid_title_gh3
		rot_angle = -4
		text = <Rockers_title>
	}
	fit_text_in_rectangle id = <id> dims = (380.0, 100.0) keep_ar = 1
	if (<coinup> = 1)
		formatText \{TextName = of_the_world
			"\\c9%O\\c9%T\\c2%W"
			o = "OF"
			t = "THE"
			w = "WORLD"}
		CreateScreenElement {
			Type = TextElement
			parent = tr_ls_container
			text = <of_the_world>
			rgba = [182 95 122 255]
			Pos = (560.0, 640.0)
			just = [center center]
			z_priority = 1.4
			font = fontgrid_title_gh3
			rot_angle = -6
			z_priority = 5020
			Scale = 0.8
		}
	endif
	CreateScreenElement \{Type = ContainerElement
		parent = tr_ls_container
		id = tr_ls_paper_container
		Pos = (630.0, 90.0)}
	get_difficulty_text_nl difficulty = ($current_difficulty)
	get_song_prefix song = ($current_song)
	formatText checksumName = songname '%s_%d' s = <song_prefix> d = <difficulty_text_nl>
	GetGlobalTags <songname>
	get_difficulty_text difficulty = ($current_difficulty)
	get_song_title song = ($current_song)
	GetUpperCaseString <song_title>
	song_title = <UppercaseString>
	GetUpperCaseString <difficulty_text>
	difficulty_text = <UppercaseString>
	StringToCharArray string = <song_title>
	GetArraySize <char_array>
	max_width = 190
	max_characters = 20
	if (<array_Size> >= <max_characters>)
		printf \{"create_top_rockers_loading_screen: shrinking song name"}
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
		<song_title> = (<new_song_text> + "...")
		<max_width> = 270
	endif
	formatText TextName = song_diff_text "\\c9%s \\c2%d" s = <song_title> d = <difficulty_text>
	CreateScreenElement {
		Type = TextElement
		parent = tr_ls_container
		id = tr_ls_song_name
		Pos = (432.0, 98.0)
		just = [center center]
		z_priority = 5020
		font = fontgrid_title_gh3
		rot_angle = -3
		text = <song_diff_text>
	}
	fit_text_in_rectangle id = <id> dims = (380.0, 100.0) keep_ar = 1
	displaySprite \{parent = tr_ls_container
		tex = Toprockers_Tape_1
		Pos = (500.0, -10.0)
		dims = (140.0, 70.0)
		z = 5025}
	displaySprite \{parent = tr_ls_container
		tex = Toprockers_Tape_2
		Pos = (280.0, 240.0)
		z = 5025
		rot_angle = 90
		dims = (140.0, 70.0)}
	displaySprite \{parent = tr_ls_container
		tex = Unlock_Dialog_BG
		Pos = (960.0, 85.0)
		dims = (530.0, 160.0)
		just = [
			center
			center
		]
		z = 5000}
	displayText \{parent = tr_ls_container
		id = tr_ls_top
		text = "TOP"
		Pos = (842.0, 68.0)
		z = 5020
		Scale = 1
		just = [
			center
			center
		]
		rgba = [
			128
			32
			32
			255
		]
		font = text_a10_Large
		rot = -1
		noshadow}
	displayText \{parent = tr_ls_container
		id = tr_ls_top_shadow
		text = "TOP"
		Pos = (847.0, 73.0)
		z = 5020
		Scale = 1
		just = [
			center
			center
		]
		rgba = [
			50
			0
			0
			255
		]
		font = text_a10_Large
		rot = -2
		noshadow}
	displayText \{parent = tr_ls_container
		id = tr_ls_three
		text = "THREE"
		Pos = (1022.0, 68.0)
		z = 5020
		Scale = 1
		just = [
			center
			center
		]
		rgba = [
			128
			32
			32
			255
		]
		font = text_a10_Large
		rot = 2
		noshadow}
	displayText \{parent = tr_ls_container
		id = tr_ls_three_shadow
		text = "THREE"
		Pos = (1027.0, 73.0)
		z = 5020
		Scale = 1
		just = [
			center
			center
		]
		rgba = [
			50
			0
			0
			255
		]
		font = text_a10_Large
		rot = 1
		noshadow}
	column_x = 65
	number_offset = (-55.0, 0.0)
	current_y_position = (20.0, 130.0)
	row_offset = (0.0, 75.0)
	name_offset = (180.0, 11.0)
	bar_offset = (-150.0, 0.0)
	skull_offset = (-20.0, 0.0)
	score_val = 1
	begin
	formatText checksumName = song_score_cs 'score%d' d = <score_val>
	formatText TextName = song_score_text "%s" s = (<...>.<song_score_cs>) usecommas
	formatText checksumName = score_name_cs 'name%d' d = <score_val>
	formatText TextName = score_name_text "%s" s = (<...>.<score_name_cs>)
	formatText TextName = number_text "%n" n = <score_val>
	formatText checksumName = song_score_id 'song_score%d' d = <score_val>
	formatText checksumName = score_name_id 'score_name%d' d = <score_val>
	score_scale = (0.9, 1.2)
	name_scale = (1.2, 1.2)
	rand = Random (@ 1 @ 2 )
	formatText checksumName = bar_tex 'Toprockers_Bar_%d' d = <rand>
	bar_flags = {}
	<rand> = Random (@ 1 @ 2 @ 3 )
	if (<rand> = 1)
		<bar_flags> = {flip_h}
	elseif (<rand> = 2)
		<bar_flags> = {flip_v}
	else
		<bar_flags> = {flip_v flip_h}
	endif
	if (<coinup> = 1)
		bar_rgba = [71 116 150 255]
	else
		bar_rgba = [150 70 95 255]
	endif
	text_rgba = [220 220 220 255]
	CreateScreenElement {
		Type = SpriteElement
		parent = tr_ls_paper_container
		Pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + <bar_offset>)
		z_priority = 4750
		rgba = <bar_rgba>
		just = [left bottom]
		texture = <bar_tex>
		dims = (800.0, 68.0)
		<bar_flags>
	}
	CreateScreenElement {
		Scale = 1.5
		Type = TextElement
		parent = tr_ls_paper_container
		Pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + (0.0, 25.0))
		z_priority = 4800
		rgba = [0 0 0 255]
		just = [left bottom]
		text = <number_text>
		font = fontgrid_title_gh3
	}
	CreateScreenElement {
		Scale = <score_scale>
		Type = TextElement
		parent = tr_ls_paper_container
		Pos = ((1.0, 0.0) * <column_x> + <current_y_position> + (0.0, 15.0))
		z_priority = 4800
		rgba = <text_rgba>
		just = [left bottom]
		text = <song_score_text>
		font = fontgrid_title_gh3
		id = <song_score_id>
	}
	CreateScreenElement {
		Scale = <name_scale>
		Type = TextElement
		parent = tr_ls_paper_container
		Pos = ((1.0, 0.0) * <column_x> + <current_y_position> + <name_offset> + (0.0, 5.0))
		z_priority = 4800
		rgba = <text_rgba>
		just = [left bottom]
		text = <score_name_text>
		font = fontgrid_title_gh3
		id = <score_name_id>
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> dims = (450.0, 90.0) only_if_larger_x = 1
	<current_y_position> = (<current_y_position> + <row_offset>)
	<score_val> = (<score_val> + 1)
	repeat (3)
	if (<coinup>)
		displaySprite \{parent = tr_ls_container
			tex = Unlock_Dialog_BG
			Pos = (960.0, 485.0)
			dims = (530.0, 160.0)
			just = [
				center
				center
			]
			z = 5000}
		displayText \{parent = tr_ls_container
			id = tr_ls_your
			text = "YOUR"
			Pos = (875.0, 468.0)
			z = 5020
			Scale = 1
			just = [
				center
				center
			]
			rgba = [
				128
				32
				32
				255
			]
			font = text_a10_Large
			rot = -1
			noshadow}
		displayText \{parent = tr_ls_container
			id = tr_ls_your_shadow
			text = "YOUR"
			Pos = (880.0, 473.0)
			z = 5020
			Scale = 1
			just = [
				center
				center
			]
			rgba = [
				50
				0
				0
				255
			]
			font = text_a10_Large
			rot = -2
			noshadow}
		displayText \{parent = tr_ls_container
			id = tr_ls_best
			text = "BEST"
			Pos = (1045.0, 468.0)
			z = 5020
			Scale = 1
			just = [
				center
				center
			]
			rgba = [
				128
				32
				32
				255
			]
			font = text_a10_Large
			rot = 2
			noshadow}
		displayText \{parent = tr_ls_container
			id = tr_ls_best_shadow
			text = "BEST"
			Pos = (1050.0, 473.0)
			z = 5020
			Scale = 1
			just = [
				center
				center
			]
			rgba = [
				50
				0
				0
				255
			]
			font = text_a10_Large
			rot = 1
			noshadow}
		<current_y_position> = (<current_y_position> + <row_offset>)
		<current_y_position> = (<current_y_position> + <row_offset>)
		<current_y_position> = (<current_y_position> + (0.0, 25.0))
		CreateScreenElement {
			Type = SpriteElement
			parent = tr_ls_paper_container
			Pos = ((1.0, 0.0) * <column_x> + <number_offset> + <current_y_position> + <bar_offset>)
			z_priority = 4750
			rgba = <bar_rgba>
			just = [left bottom]
			texture = <bar_tex>
			dims = (800.0, 68.0)
			<bar_flags>
		}
		CreateScreenElement {
			Scale = <score_scale>
			Type = TextElement
			parent = tr_ls_paper_container
			Pos = ((1.0, 0.0) * <column_x> + <current_y_position> + (0.0, 15.0))
			z_priority = 4800
			rgba = <text_rgba>
			just = [left bottom]
			text = "1,234"
			font = fontgrid_title_gh3
			id = tr_ls_best_score
		}
		CreateScreenElement {
			Scale = <name_scale>
			Type = TextElement
			parent = tr_ls_paper_container
			Pos = ((1.0, 0.0) * <column_x> + <current_y_position> + <name_offset> + (0.0, 5.0))
			z_priority = 4800
			rgba = <text_rgba>
			just = [left bottom]
			text = "YRNMHR"
			font = fontgrid_title_gh3
			id = tr_ls_best_name
		}
		GetScreenElementDims id = <id>
		fit_text_in_rectangle id = <id> dims = (450.0, 90.0) only_if_larger_x = 1
	else
		displaySprite \{parent = tr_ls_container
			tex = Dialog_Title_BG
			Pos = (960.0, 530.0)
			dims = (200.0, 200.0)
			just = [
				right
				center
			]
			z = 5000
			flip_v}
		displaySprite \{parent = tr_ls_container
			tex = Dialog_Title_BG
			Pos = (960.0, 530.0)
			dims = (200.0, 200.0)
			just = [
				left
				center
			]
			z = 5000}
		split_text_into_array_elements \{text = "LOADING"
			text_pos = (960.0, 515.0)
			centered
			space_between = (40.0, 0.0)
			flags = {
				rgba = [
					255
					255
					255
					255
				]
				Scale = 2.0
				z_priority = 6000
				font = text_a10
				just = [
					center
					center
				]
				alpha = 1
			}}
		Change g_top_rockers_loading_screen_split_container_id = <container_id>
		SpawnScriptNow \{jiggle_text_array_elements
			params = {
				id = $g_top_rockers_loading_screen_split_container_id
				time = 1.0
				wait_time = 0
				explode = 0
			}}
	endif
endscript

script destroy_top_rockers_loading_screen 
	printf \{"destroy_top_rockers_loading_screen: spawning the destroyer"}
	KillSpawnedScript \{Name = jiggle_text_array_elements}
	if ScreenElementExists \{id = $g_top_rockers_loading_screen_split_container_id}
		DestroyScreenElement \{id = $g_top_rockers_loading_screen_split_container_id}
	endif
	SpawnScriptNow \{destroy_top_rockers_loading_screen_spawned}
	HideLoadingScreen
	if ($playing_song = 0)
		Change \{is_changing_levels = 0}
	endif
endscript

script destroy_top_rockers_loading_screen_spawned \{time = 0.3}
	Change \{menu_flow_locked = 1}
	OnExitRun \{destroy_top_rockers_loading_screen_finish}
	if (<time> > 0)
		printf \{"destroy_top_rockers_loading_screen_spawned: fading out load screen"}
		if ScreenElementExists \{id = menu_backdrop_container}
			DoScreenElementMorph id = menu_backdrop_container alpha = 0 time = <time>
		endif
		if ScreenElementExists \{id = tr_ls_container}
			DoScreenElementMorph id = tr_ls_container alpha = 0 time = <time>
		endif
		Wait <time> Seconds
	endif
	Change \{menu_flow_locked = 0}
endscript

script destroy_top_rockers_loading_screen_finish 
	printf \{"destroy_top_rockers_loading_screen_finish: killing load screen"}
	if ScreenElementExists \{id = tr_ls_container}
		DestroyScreenElement \{id = tr_ls_container}
	endif
	destroy_menu_backdrop
endscript
