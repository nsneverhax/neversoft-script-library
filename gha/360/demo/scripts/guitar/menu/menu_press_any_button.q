g_pab_need_to_pause = 0

script create_press_any_button_menu 
	reacquirecontrollers
	change \{primary_controller_assigned = 0}
	clearxusersignininfo
	change \{main_menu_movie_first_time = 0}
	if NOT isusermusicplaying
		soundevent \{event = menu_guitar_lick_sfx}
		spawnscriptnow \{menu_music_on
			params = {
				waitforguitarlick = 1
			}}
	else
		spawnscriptnow \{menu_music_on}
	endif
	createscreenelement \{type = containerelement
		parent = root_window
		id = pab_container
		pos = (0.0, 0.0)}
	createscreenelement \{type = spriteelement
		parent = pab_container
		id = pab_menu_backdrop
		texture = boot_copyright_bg
		rgba = [
			255
			255
			255
			255
		]
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z_priority = 0}
	menu_press_any_button_create_obvious_text
	if ($g_pab_need_to_pause = 1)
		wait \{0.3
			seconds}
		change \{g_pab_need_to_pause = 0}
	endif
	spawnscriptnow \{check_for_any_input}
	if notcd
		if ($show_movies = 0)
			return
		endif
	endif
	spawnscriptnow \{attract_mode_spawner}
endscript

script destroy_press_any_button_menu 
	destroy_menu \{menu_id = pab_container}
	killspawnedscript \{name = check_for_any_input}
	killspawnedscript \{name = attract_mode_spawner}
endscript

script attract_mode_spawner 
	if notcd
		wait_time = 5
	else
		wait_time = 110
	endif
	begin
	printf "Wait_time for begin attract %i" i = <wait_time>
	if (<wait_time> = 0)
		break
	endif
	wait \{1
		second}
	wait_time = (<wait_time> - 1)
	repeat
	change \{g_pab_need_to_pause = 1}
	if ($invalid_controller_lock = 1)
		begin
		if ($invalid_controller_lock = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = enter_attract_mode
			play_sound = 0
		}}
endscript
attract_mode_info = [
	{
		level = load_z_nine_lives
		song = sweetemotion
		mode = p1_quickplay
		band = aerosmith_band
		p1_character_id = judy
		p2_character_id = casey
		p1_instrument_id = instrument_firebird_blue
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = expert
		p2_difficulty = expert
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 5
		p2_style = 5
	}
	{
		level = load_z_nine_lives
		song = walkthiswayrundmc
		mode = p1_quickplay
		band = aerosmith_band_dmc
		p1_character_id = judy
		p2_character_id = casey
		p1_instrument_id = instrument_firebird_blue
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = expert
		p2_difficulty = expert
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 5
		p2_style = 5
	}
	{
		level = load_z_nine_lives
		song = dreamon
		mode = p1_quickplay
		band = aerosmith_band
		p1_character_id = judy
		p2_character_id = judy
		p1_instrument_id = instrument_epipaul01
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = expert
		p2_difficulty = expert
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 5
		p2_style = 5
	}
	{
		level = load_z_nine_lives
		song = ihatemyselfforlovingyou
		mode = p1_quickplay
		band = default_band
		p1_character_id = casey
		p2_character_id = judy
		p1_instrument_id = instrument_es400_red
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = expert
		p2_difficulty = expert
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 5
		p2_style = 5
	}
]
last_attract_mode = -1
is_attract_mode = 0

script create_attract_mode 
	change \{is_attract_mode = 1}
	create_loading_screen
	soundbussunlock \{guitar_balance}
	soundbussunlock \{band_balance}
	setsoundbussparams \{guitar_balance = {
			vol = -100.0
		}
		time = 1.5}
	setsoundbussparams \{band_balance = {
			vol = -100.0
		}
		time = 1.5}
	soundbusslock \{guitar_balance}
	soundbusslock \{band_balance}
	enableusermusic \{disable}
	kill_start_key_binding
	getarraysize \{$attract_mode_info}
	if (<array_size> = 1)
		attract_mode_index = 0
	else
		if ($last_attract_mode >= 0)
			getrandomvalue name = attract_mode_index integer a = 0 b = (<array_size> - 2)
			if (<attract_mode_index> >= $last_attract_mode)
				attract_mode_index = (<attract_mode_index> + 1)
			endif
		else
			getrandomvalue name = attract_mode_index integer a = 0 b = (<array_size> - 1)
		endif
		change last_attract_mode = <attract_mode_index>
	endif
	p1_outfit = 1
	p2_outfit = 1
	p1_style = 1
	p2_style = 1
	addparams ($attract_mode_info [<attract_mode_index>])
	change \{structurename = player1_status
		bot_play = 1}
	change \{structurename = player2_status
		bot_play = 1}
	change current_level = <level>
	change game_mode = <mode>
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		change \{current_num_players = 2}
	else
		change \{current_num_players = 1}
	endif
	change structurename = player1_status character_id = <p1_character_id>
	change structurename = player2_status character_id = <p2_character_id>
	change structurename = player1_status instrument_id = <p1_instrument_id>
	change structurename = player2_status instrument_id = <p2_instrument_id>
	change structurename = player1_status outfit = <p1_outfit>
	change structurename = player2_status outfit = <p2_outfit>
	change structurename = player1_status style = <p1_style>
	change structurename = player2_status style = <p2_style>
	soundbussunlock \{master}
	setsoundbussparams \{master = {
			vol = -11.0
		}
		time = 0.5}
	soundbusslock \{master}
	mark_unsafe_for_shutdown
	unpausegame
	load_venue
	start_gem_scroller song_name = <song> difficulty = <p1_difficulty> difficulty2 = <p2_difficulty> starttime = 0 device_num = ($player1_status.controller)
	create_attract_mode_text
	stoprendering
	destroy_loading_screen
	change \{is_changing_levels = 0}
	soundbussunlock \{guitar_balance}
	soundbussunlock \{band_balance}
	setsoundbussparams {guitar_balance = {vol = (($default_bussset.guitar_balance.vol) - 1.5)}}
	setsoundbussparams {band_balance = {vol = (($default_bussset.band_balance.vol) - 1.5)}}
	soundbusslock \{guitar_balance}
	soundbusslock \{band_balance}
	spawnscriptnow \{check_for_attract_mode_input}
endscript

script create_attract_mode_text 
	createscreenelement \{type = containerelement
		parent = root_window
		id = am_container
		pos = (0.0, 0.0)}
	text = "JUST PUSH ANY BUTTON TO PLAY..."
	text_pos = (640.0, 637.0)
	createscreenelement {
		type = textelement
		text = <text>
		pos = <text_pos>
		parent = am_container
		rgba = [220 220 220 255]
		font = fontgrid_title_gh3
		just = [center bottom]
		scale = 0.9
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = (($g_menu_colors).violet_focus)
	}
	getscreenelementdims id = <id>
	fit_text_in_rectangle id = <id> dims = ((700.0, 0.0) + (<height> * (0.0, 1.0))) start_x_scale = 0.9 start_y_scale = 0.9 only_if_larger_x = 1
	createscreenelement \{type = spriteelement
		parent = am_container
		texture = main_menu_logo
		scale = 0.9
		pos = (640.0, 465.0)
		just = [
			center
			center
		]}
endscript

script destroy_attract_mode_text 
	destroy_menu \{menu_id = am_container}
	stopallsounds
	soundbussunlock \{master}
	setsoundbussparams {master = {vol = ($default_bussset.master.vol)}}
	soundbusslock \{master}
endscript

script check_for_attract_mode_input 
	begin
	getbuttonspressed
	if NOT (<makes> = 0)
		break
	endif
	if NOT ($invite_controller = -1)
		break
	endif
	wait \{1
		gameframe}
	repeat
	wait_for_safe_shutdown
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = exit_attract_mode
		}}
endscript

script destroy_attract_mode 
	pausegame
	destroy_attract_mode_text
	killspawnedscript \{name = check_for_attract_mode_input}
	kill_gem_scroller
	change \{structurename = player1_status
		bot_play = 0}
	change \{structurename = player2_status
		bot_play = 0}
	unpausegame
	kill_start_key_binding
	change \{is_attract_mode = 0}
	enableusermusic
endscript
invalid_controller_lock = 0

script check_for_any_input \{button1 = {
		}
		button2 = {
		}}
	begin
	getbuttonspressed
	if (<makes> = 0)
		break
	endif
	wait \{1
		gameframe}
	repeat
	begin
	if NOT ($invite_controller = -1)
		spawnscriptnow ui_flow_manager_respond_to_action params = {action = continue flow_state_func_params = {device_num = ($invite_controller)}}
		break
	endif
	continue = 0
	if gotparam \{use_primary_controller}
		if guitarcontrollermake <button1> ($primary_controller)
			<continue> = 1
		elseif guitarcontrollermake <button2> ($primary_controller)
			<continue> = 1
		endif
	else
		getbuttonspressed <button1>
		if NOT (<makes> = 0)
			<continue> = 1
		endif
	endif
	if (<continue> = 1)
		spawnscriptnow ui_flow_manager_respond_to_action params = {action = continue flow_state_func_params = {device_num = <device_num>}}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script menu_press_any_button_create_obvious_text 
	text = "JUST PUSH ANY BUTTON TO PLAY..."
	text_pos = (665.0, 425.0)
	createscreenelement {
		type = textblockelement
		parent = pab_container
		font = text_a5
		text = <text>
		dims = (500.0, 200.0)
		pos = <text_pos>
		just = [left top]
		internal_just = [center top]
		rgba = [160 160 195 255]
		scale = 0.7
		allow_expansion
	}
endscript
