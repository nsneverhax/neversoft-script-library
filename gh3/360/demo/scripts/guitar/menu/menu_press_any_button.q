
script create_press_any_button_menu 
	Change \{primary_controller_assigned = 0}
	Change \{main_menu_movie_first_time = 0}
	SoundEvent \{event = menu_guitar_lick_sfx}
	SpawnScriptNow \{menu_music_on
		params = {
			waitforguitarlick = 1
		}}
	create_menu_backdrop \{texture = bootup_copyright_bg}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = pab_container
		Pos = (0.0, 0.0)}
	menu_press_any_button_create_obvious_text
	SpawnScriptNow \{check_for_any_input}
	if NotCD
		if ($show_movies = 0)
			return
		endif
	endif
	SpawnScriptNow \{attract_mode_spawner}
endscript

script destroy_press_any_button_menu 
	destroy_menu \{menu_id = pab_container}
	destroy_menu_backdrop
	KillSpawnedScript \{Name = check_for_any_input}
	KillSpawnedScript \{Name = attract_mode_spawner}
endscript

script attract_mode_spawner 
	return
	if NotCD
		wait_time = 5
	else
		wait_time = 110
	endif
	begin
	printf "Wait_time for begin attract %i" i = <wait_time>
	if (<wait_time> = 0)
		break
	endif
	Wait \{1
		Second}
	wait_time = (<wait_time> - 1)
	repeat
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = enter_attract_mode
			play_sound = 0
		}}
endscript
Attract_Mode_Info = [
	{
		level = load_z_budokan
		song = cherubrock
		mode = p1_quickplay
		p1_character_id = Midori
		p2_character_id = Judy
		p1_instrument_id = instrument_sg_goddess_blue
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Judy
		p2_character_id = Casey
		p1_instrument_id = instrument_firebird_blue
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Xavier
		p2_character_id = Judy
		p1_instrument_id = instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Johnny
		p2_character_id = Judy
		p1_instrument_id = instrument_white_vee
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Casey
		p2_character_id = Judy
		p1_instrument_id = instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Judy
		p2_character_id = Judy
		p1_instrument_id = instrument_epipaul01
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Casey
		p2_character_id = Judy
		p1_instrument_id = instrument_wylde
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Johnny
		p2_character_id = Judy
		p1_instrument_id = instrument_es400_red
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Lars
		p2_character_id = Judy
		p1_instrument_id = instrument_silver_vee
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Casey
		p2_character_id = Judy
		p1_instrument_id = instrument_focus02
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Xavier
		p2_character_id = Judy
		p1_instrument_id = instrument_marauder_nato
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Xavier
		p2_character_id = Judy
		p1_instrument_id = instrument_focus02
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Judy
		p2_character_id = Judy
		p1_instrument_id = Instrument_Les_Paul_Black
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Casey
		p2_character_id = Judy
		p1_instrument_id = instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Johnny
		p2_character_id = Judy
		p1_instrument_id = instrument_les_paul_red
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Axel
		p2_character_id = Judy
		p1_instrument_id = instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Judy
		p2_character_id = Judy
		p1_instrument_id = instrument_explorer_black
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Axel
		p2_character_id = Judy
		p1_instrument_id = instrument_wyldeb
		p2_instrument_id = Instrument_Les_Paul_Black
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
		p1_character_id = Lars
		p2_character_id = Judy
		p1_instrument_id = instrument_ebony_vee
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 2
		p2_style = 1
	}
	{
		level = load_z_prison
		song = TalkDirtyToMe
		mode = p1_quickplay
		p1_character_id = Izzy
		p2_character_id = Judy
		p1_instrument_id = instrument_firebird_cherry
		p2_instrument_id = Instrument_Les_Paul_Black
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
	Change \{is_attract_mode = 1}
	create_loading_screen
	SoundBussUnlock \{Guitar_Balance}
	SoundBussUnlock \{band_Balance}
	setsoundbussparams \{Guitar_Balance = {
			vol = -100.0
		}
		time = 1.5}
	setsoundbussparams \{band_Balance = {
			vol = -100.0
		}
		time = 1.5}
	SoundBussLock \{Guitar_Balance}
	SoundBussLock \{band_Balance}
	kill_start_key_binding
	GetArraySize \{$Attract_Mode_Info}
	if (<array_Size> = 1)
		attract_mode_index = 0
	else
		if ($last_attract_mode >= 0)
			GetRandomValue Name = attract_mode_index integer a = 0 b = (<array_Size> - 2)
			if (<attract_mode_index> >= $last_attract_mode)
				attract_mode_index = (<attract_mode_index> + 1)
			endif
		else
			GetRandomValue Name = attract_mode_index integer a = 0 b = (<array_Size> - 1)
		endif
		Change last_attract_mode = <attract_mode_index>
	endif
	p1_outfit = 1
	p2_outfit = 1
	p1_style = 1
	p2_style = 1
	AddParams ($Attract_Mode_Info [<attract_mode_index>])
	Change \{structurename = player1_status
		bot_play = 1}
	Change \{structurename = player2_status
		bot_play = 1}
	Change current_level = <level>
	Change game_mode = <mode>
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		Change \{current_num_players = 2}
	else
		Change \{current_num_players = 1}
	endif
	Change structurename = player1_status character_id = <p1_character_id>
	Change structurename = player2_status character_id = <p2_character_id>
	Change structurename = player1_status instrument_id = <p1_instrument_id>
	Change structurename = player2_status instrument_id = <p2_instrument_id>
	Change structurename = player1_status outfit = <p1_outfit>
	Change structurename = player2_status outfit = <p2_outfit>
	Change structurename = player1_status style = <p1_style>
	Change structurename = player2_status style = <p2_style>
	SoundBussUnlock \{Master}
	setsoundbussparams \{Master = {
			vol = -11.0
		}
		time = 0.5}
	SoundBussLock \{Master}
	mark_unsafe_for_shutdown
	UnPauseGame
	Load_Venue
	start_gem_scroller song_name = <song> difficulty = <p1_difficulty> difficulty2 = <p2_difficulty> starttime = 0 device_num = ($player1_status.controller)
	create_attract_mode_text
	StopRendering
	destroy_loading_screen
	SoundBussUnlock \{Guitar_Balance}
	SoundBussUnlock \{band_Balance}
	setsoundbussparams {Guitar_Balance = {vol = (($default_BussSet.Guitar_Balance.vol) - 2.5)}}
	setsoundbussparams {band_Balance = {vol = (($default_BussSet.band_Balance.vol) - 2.5)}}
	SoundBussLock \{Guitar_Balance}
	SoundBussLock \{band_Balance}
	SpawnScriptNow \{check_for_attract_mode_input}
endscript

script create_attract_mode_text 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = am_container
		Pos = (0.0, 0.0)}
	text = "PRESS ANY BUTTON TO ROCK..."
	text_pos = (640.0, 537.0)
	CreateScreenElement {
		Type = TextElement
		text = <text>
		Pos = <text_pos>
		parent = am_container
		rgba = [220 220 220 255]
		font = fontgrid_title_gh3
		just = [center bottom]
		Scale = 0.9
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [110 20 80 250]
	}
endscript

script destroy_attract_mode_text 
	destroy_menu \{menu_id = am_container}
	StopAllSounds
	SoundBussUnlock \{Master}
	setsoundbussparams {Master = {vol = ($default_BussSet.Master.vol)}}
	SoundBussLock \{Master}
endscript

script check_for_attract_mode_input 
	begin
	GetButtonsPressed
	if NOT (<makes> = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	wait_for_safe_shutdown
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = exit_attract_mode
		}}
endscript

script destroy_attract_mode 
	PauseGame
	destroy_attract_mode_text
	KillSpawnedScript \{Name = check_for_attract_mode_input}
	kill_gem_scroller
	Change \{structurename = player1_status
		bot_play = 0}
	Change \{structurename = player2_status
		bot_play = 0}
	UnPauseGame
	kill_start_key_binding
	Change \{is_attract_mode = 0}
endscript

script check_for_any_input 
	begin
	GetButtonsPressed
	if (<makes> = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	begin
	GetButtonsPressed
	if NOT (<makes> = 0)
		SpawnScriptNow ui_flow_manager_respond_to_action params = {action = continue flow_state_func_params = {device_num = <device_num>}}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script menu_press_any_button_create_obvious_text 
	text = "PRESS ANY BUTTON TO ROCK..."
	text_pos = (670.0, 425.0)
	CreateScreenElement {
		Type = TextBlockElement
		parent = pab_container
		font = text_a6
		text = <text>
		dims = (500.0, 200.0)
		Pos = <text_pos>
		just = [left top]
		internal_just = [center top]
		rgba = [215 120 40 255]
		Scale = 0.7
		allow_expansion
	}
endscript
