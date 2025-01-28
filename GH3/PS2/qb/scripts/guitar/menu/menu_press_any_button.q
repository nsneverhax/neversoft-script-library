
script create_press_any_button_menu 
	reacquirecontrollers
	change \{primary_controller_assigned = 0}
	soundevent \{event = menu_guitar_lick_sfx}
	spawnscriptnow \{menu_music_on
		params = {
			waitforguitarlick = 1
		}}
	create_menu_backdrop \{texture = bootup_copyright_bg}
	createscreenelement \{type = containerelement
		parent = root_window
		id = pab_container
		pos = (0.0, 0.0)}
	menu_press_any_button_create_obvious_text
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
	destroy_menu_backdrop
	killspawnedscript \{name = check_for_any_input}
	killspawnedscript \{name = attract_mode_spawner}
endscript

script attract_mode_spawner 
	wait_time = 30
	begin

	if (<wait_time> = 0)
		break
	endif
	wait \{1
		second}
	wait_time = (<wait_time> - 1)
	repeat
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = enter_attract_mode
			play_sound = 0
		}}
endscript
attract_mode_info = [
	{
		level = load_z_budokan
		song = cherubrock
		mode = p1_quickplay
		p1_character_id = midori
		p2_character_id = judy
		p1_instrument_id = instrument_sg_goddess_blue
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 3
		p2_style = 1
	}
	{
		level = load_z_artdeco
		song = evenflow
		mode = p1_quickplay
		p1_character_id = judy
		p2_character_id = casey
		p1_instrument_id = instrument_firebird_blue
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 3
		p2_style = 1
	}
	{
		level = load_z_wikker
		song = cultofpersonality
		mode = p1_quickplay
		p1_character_id = xavier
		p2_character_id = judy
		p1_instrument_id = instrument_focus01
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_dive
		song = anarchyintheuk
		mode = p1_quickplay
		p1_character_id = johnny
		p2_character_id = judy
		p1_instrument_id = instrument_white_vee
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_artdeco
		song = knightsofcydonia
		mode = p1_quickplay
		p1_character_id = casey
		p2_character_id = judy
		p1_instrument_id = instrument_focus01
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_party
		song = mynameisjonas
		mode = p1_quickplay
		p1_character_id = judy
		p2_character_id = judy
		p1_instrument_id = instrument_epipaul01
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		level = load_z_prison
		song = mississippiqueen
		mode = p1_quickplay
		p1_character_id = casey
		p2_character_id = judy
		p1_instrument_id = instrument_wylde
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		level = load_z_wikker
		song = paintitblack
		mode = p1_quickplay
		p1_character_id = johnny
		p2_character_id = judy
		p1_instrument_id = instrument_es400_red
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		level = load_z_party
		song = missmurder
		mode = p1_quickplay
		p1_character_id = lars
		p2_character_id = judy
		p1_instrument_id = instrument_silver_vee
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_budokan
		song = sabotage
		mode = p1_quickplay
		p1_character_id = casey
		p2_character_id = judy
		p1_instrument_id = instrument_focus02
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		level = load_z_artdeco
		song = theseeker
		mode = p1_quickplay
		p1_character_id = xavier
		p2_character_id = judy
		p1_instrument_id = instrument_marauder_nato
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 2
		p2_style = 1
	}
	{
		level = load_z_dive
		song = pridenjoy
		mode = p1_quickplay
		p1_character_id = xavier
		p2_character_id = judy
		p1_instrument_id = instrument_focus02
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		level = load_z_artdeco
		song = barracuda
		mode = p1_quickplay
		p1_character_id = judy
		p2_character_id = judy
		p1_instrument_id = instrument_les_paul_black
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_dive
		song = bullsonparade
		mode = p1_quickplay
		p1_character_id = casey
		p2_character_id = judy
		p1_instrument_id = instrument_focus01
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 3
		p2_style = 1
	}
	{
		level = load_z_party
		song = prayeroftherefugee
		mode = p1_quickplay
		p1_character_id = johnny
		p2_character_id = judy
		p1_instrument_id = instrument_les_paul_red
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_dive
		song = laydown
		mode = p1_quickplay
		p1_character_id = axel
		p2_character_id = judy
		p1_instrument_id = instrument_focus01
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_wikker
		song = threesandsevens
		mode = p1_quickplay
		p1_character_id = judy
		p2_character_id = judy
		p1_instrument_id = instrument_explorer_black
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 3
		p2_style = 1
	}
	{
		level = load_z_budokan
		song = mycurse
		mode = p1_quickplay
		p1_character_id = axel
		p2_character_id = judy
		p1_instrument_id = instrument_wyldeb
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_prison
		song = paranoid
		mode = p1_quickplay
		p1_character_id = lars
		p2_character_id = judy
		p1_instrument_id = instrument_ebony_vee
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 2
		p2_style = 1
	}
	{
		level = load_z_prison
		song = talkdirtytome
		mode = p1_quickplay
		p1_character_id = izzy
		p2_character_id = judy
		p1_instrument_id = instrument_firebird_cherry
		p2_instrument_id = instrument_les_paul_black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
]
last_attract_mode = -1
is_attract_mode = 0

script create_attract_mode 
	change \{is_attract_mode = 1}
	create_loading_screen
	menu_music_off
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
	start_song song_name = <song> difficulty = <p1_difficulty> difficulty2 = <p2_difficulty> starttime = 0 device_num = ($player1_status.controller)
	create_attract_mode_text
	stoprendering
	destroy_loading_screen
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
	text = 'PRESS ANY BUTTON TO ROCK...'
	text_pos = (640.0, 637.0)
	createscreenelement {
		type = textelement
		text = <text>
		pos = <text_pos>
		parent = am_container
		rgba = [220 220 220 255]
		font = fontgrid_title_gh3
		just = [center bottom]
		scale = 1.2
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [110 20 80 250]
	}
	createscreenelement \{type = spriteelement
		parent = am_container
		texture = 0x709b0d2b
		dims = (225.0, 225.0)
		pos = (640.0, 490.0)
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
	waitonegameframe
	repeat
	wait_for_safe_shutdown
	0x3e5d7af6
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
endscript

script check_for_any_input \{mode = {
		}}
	begin
	getbuttonspressed
	if (<makes> = 0)
		break
	endif
	waitonegameframe
	repeat
	begin
	getbuttonspressed <mode>
	if NOT ($invite_controller = -1)
		spawnscriptnow ui_flow_manager_respond_to_action params = {action = continue flow_state_func_params = {device_num = ($invite_controller)}}
		break
	endif
	if NOT (<makes> = 0)
		spawnscriptnow ui_flow_manager_respond_to_action params = {action = continue flow_state_func_params = {device_num = <device_num>}}
		break
	endif
	waitonegameframe
	repeat
endscript

script menu_press_any_button_create_obvious_text 
	text = 'PRESS ANY BUTTON TO ROCK...'
	text_pos = (620.0, 425.0)
	createscreenelement {
		type = textblockelement
		parent = pab_container
		font = text_a6
		text = <text>
		dims = (500.0, 200.0)
		pos = <text_pos>
		just = [left top]
		internal_just = [center top]
		rgba = [215 120 40 255]
		scale = 0.9
		allow_expansion
	}
endscript
