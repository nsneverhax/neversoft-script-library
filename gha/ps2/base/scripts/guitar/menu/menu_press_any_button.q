0xf2e0edf7 = 0

script create_press_any_button_menu 
	Change \{0xf2e0edf7 = 1}
	ReAcquireControllers
	Change \{primary_controller_assigned = 0}
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
	wait_time = 30
	begin

	if (<wait_time> = 0)
		break
	endif
	Wait \{1
		Second}
	wait_time = (<wait_time> - 1)
	repeat
	if ($invalid_controller_lock = 1)
		begin
		if ($invalid_controller_lock = 0)
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = enter_attract_mode
			play_sound = 0
		}}
endscript
Attract_Mode_Info = [
	{
		level = load_z_hof
		song = catscratchfever
		mode = p1_quickplay
		Band = default_band
		p1_character_id = Axel
		p2_character_id = Judy
		p1_instrument_id = instrument_sg_goddess_blue
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = expert
		p2_difficulty = expert
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 6
		p2_style = 1
	}
	{
		level = load_z_fenway
		song = sweetemotion
		mode = p1_quickplay
		Band = aerosmith_band
		p1_character_id = Judy
		p2_character_id = Casey
		p1_instrument_id = instrument_firebird_blue
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = expert
		p2_difficulty = expert
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_fenway
		song = walkthiswayrundmc
		mode = p1_quickplay
		Band = aerosmith_band_dmc
		p1_character_id = Judy
		p2_character_id = Casey
		p1_instrument_id = instrument_firebird_blue
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = expert
		p2_difficulty = expert
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 3
		p2_style = 1
	}
	{
		level = load_z_jpplay
		song = sextypething
		mode = p1_quickplay
		Band = default_band
		p1_character_id = Xavier
		p2_character_id = Judy
		p1_instrument_id = instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = expert
		p2_difficulty = expert
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 7
		p2_style = 1
	}
	{
		level = load_z_maxskc
		song = completecontrol
		mode = p1_quickplay
		Band = default_band
		p1_character_id = Johnny
		p2_character_id = Judy
		p1_instrument_id = instrument_white_vee
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = expert
		p2_difficulty = expert
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 7
		p2_style = 1
	}
	{
		level = load_z_nine_lives
		song = alldayandallofthenight
		mode = p1_quickplay
		Band = default_band
		p1_character_id = Casey
		p2_character_id = Judy
		p1_instrument_id = instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = expert
		p2_difficulty = expert
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 6
		p2_style = 1
	}
	{
		level = load_z_fenway
		song = dreamon
		mode = p1_quickplay
		Band = aerosmith_band
		p1_character_id = Judy
		p2_character_id = Judy
		p1_instrument_id = instrument_epipaul01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = expert
		p2_difficulty = expert
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		level = load_z_hof
		song = shesellssanctuary
		mode = p1_quickplay
		Band = default_band
		p1_character_id = Judy
		p2_character_id = Judy
		p1_instrument_id = instrument_wylde
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = expert
		p2_difficulty = expert
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_fenway
		song = ihatemyselfforlovingyou
		mode = p1_quickplay
		Band = default_band
		p1_character_id = Casey
		p2_character_id = Judy
		p1_instrument_id = instrument_es400_red
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = expert
		p2_difficulty = expert
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 6
		p2_style = 1
	}
	{
		level = load_z_jpplay
		song = ragdoll
		mode = p1_quickplay
		Band = aerosmith_band
		p1_character_id = Lars
		p2_character_id = Judy
		p1_instrument_id = instrument_silver_vee
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = expert
		p2_difficulty = expert
		p1_outfit = 2
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
	menu_music_off
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
	EnableUserMusic \{disable}
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
	start_song song_name = <song> difficulty = <p1_difficulty> difficulty2 = <p2_difficulty> starttime = 0 device_num = ($player1_status.controller)
	create_attract_mode_text
	StopRendering
	destroy_loading_screen
	SoundBussUnlock \{Guitar_Balance}
	SoundBussUnlock \{band_Balance}
	setsoundbussparams {Guitar_Balance = {vol = (($default_BussSet.Guitar_Balance.vol) - 1.5)}}
	setsoundbussparams {band_Balance = {vol = (($default_BussSet.band_Balance.vol) - 1.5)}}
	SoundBussLock \{Guitar_Balance}
	SoundBussLock \{band_Balance}
	SpawnScriptNow \{check_for_attract_mode_input}
endscript

script create_attract_mode_text 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = am_container
		Pos = (0.0, 0.0)}
	text = 'PRESS ANY BUTTON TO ROCK...'
	text_pos = (640.0, 637.0)
	CreateScreenElement {
		Type = TextElement
		text = <text>
		Pos = <text_pos>
		parent = am_container
		rgba = [220 220 220 255]
		font = fontgrid_title_gh3
		just = [center bottom]
		Scale = 1.2
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [110 20 80 250]
	}
	CreateScreenElement \{Type = SpriteElement
		parent = am_container
		texture = 0x39cafe29
		dims = (320.0, 160.0)
		Pos = (640.0, 490.0)
		just = [
			center
			center
		]}
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
	if NOT ($invite_controller = -1)
		break
	endif
	WaitOneGameFrame
	repeat
	wait_for_safe_shutdown
	0x3e5d7af6
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
	EnableUserMusic
endscript
invalid_controller_lock = 0

script check_for_any_input \{button1 = {
		}
		button2 = {
		}}
	begin
	GetButtonsPressed
	if (<makes> = 0)
		break
	endif
	WaitOneGameFrame
	repeat
	begin
	GetButtonsPressed <mode>
	if ($0xf2e0edf7 = 1)
		create_menu_backdrop \{texture = bootup_copyright_bg}
	endif
	if NOT isstandardguitarcontrollerpluggedin
		CreateScreenElement \{Type = SpriteElement
			id = controller_fader
			parent = root_window
			texture = black
			rgba = [
				0
				0
				0
				255
			]
			Pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = 509000
			alpha = 0.7}
		Change \{invalid_controller_lock = 1}
		begin
		if NOT isstandardguitarcontrollerpluggedin
			break
		endif
		Wait \{1
			gameframe}
		repeat
		DestroyScreenElement \{id = controller_fader}
		Change \{invalid_controller_lock = 0}
	endif
	if NOT ($invite_controller = -1)
		SpawnScriptNow ui_flow_manager_respond_to_action params = {action = continue flow_state_func_params = {device_num = ($invite_controller)}}
		break
	endif
	if NOT (<makes> = 0)
		SpawnScriptNow ui_flow_manager_respond_to_action params = {action = continue flow_state_func_params = {device_num = <device_num>}}
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script menu_press_any_button_create_obvious_text 
	text = 'JUST PRESS ANY BUTTON TO PLAY...'
	text_pos = (620.0, 425.0)
	CreateScreenElement {
		Type = TextBlockElement
		parent = pab_container
		font = text_a5
		text = <text>
		dims = (500.0, 200.0)
		Pos = <text_pos>
		just = [left top]
		internal_just = [center top]
		rgba = [160 160 195 255]
		Scale = 0.9
		allow_expansion
	}
endscript
