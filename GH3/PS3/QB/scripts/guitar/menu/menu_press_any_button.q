
script create_press_any_button_menu 
	ReAcquireControllers
	Change \{primary_controller_assigned = 0}
	Change \{main_menu_movie_first_time = 0}
	SoundEvent \{Event = Menu_Guitar_Lick_SFX}
	SpawnScriptNow \{Menu_Music_On
		Params = {
			waitforguitarlick = 1
		}}
	create_menu_backdrop \{texture = bootup_copyright_bg}
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = pab_container
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
	if NotCD
		wait_time = 5
	else
		wait_time = 110
	endif
	begin
	Printf "Wait_time for begin attract %i" I = <wait_time>
	if (<wait_time> = 0)
		break
	endif
	Wait \{1
		Second}
	wait_time = (<wait_time> - 1)
	repeat
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		Params = {
			action = enter_attract_mode
			play_sound = 0
		}}
endscript
Attract_Mode_Info = [
	{
		Level = load_z_budokan
		Song = cherubrock
		mode = p1_quickplay
		p1_character_id = MIDORI
		p2_character_id = JUDY
		p1_instrument_id = Instrument_SG_Goddess_Blue
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 3
		p2_style = 1
	}
	{
		Level = load_z_artdeco
		Song = evenflow
		mode = p1_quickplay
		p1_character_id = JUDY
		p2_character_id = CASEY
		p1_instrument_id = Instrument_Firebird_Blue
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 3
		p2_style = 1
	}
	{
		Level = load_z_wikker
		Song = CultOfPersonality
		mode = p1_quickplay
		p1_character_id = XAVIER
		p2_character_id = JUDY
		p1_instrument_id = Instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		Level = load_z_dive
		Song = anarchyintheuk
		mode = p1_quickplay
		p1_character_id = JOHNNY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_White_Vee
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		Level = load_z_artdeco
		Song = knightsofcydonia
		mode = p1_quickplay
		p1_character_id = CASEY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		Level = load_z_party
		Song = mynameisjonas
		mode = p1_quickplay
		p1_character_id = JUDY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_EpiPaul01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		Level = load_z_prison
		Song = mississippiqueen
		mode = p1_quickplay
		p1_character_id = CASEY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_wylde
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		Level = load_z_wikker
		Song = paintitblack
		mode = p1_quickplay
		p1_character_id = JOHNNY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_ES400_Red
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		Level = load_z_party
		Song = MissMurder
		mode = p1_quickplay
		p1_character_id = LARS
		p2_character_id = JUDY
		p1_instrument_id = Instrument_Silver_Vee
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		Level = load_z_budokan
		Song = sabotage
		mode = p1_quickplay
		p1_character_id = CASEY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_focus02
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		Level = load_z_artdeco
		Song = theseeker
		mode = p1_quickplay
		p1_character_id = XAVIER
		p2_character_id = JUDY
		p1_instrument_id = Instrument_Marauder_NATO
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 2
		p2_style = 1
	}
	{
		Level = load_z_dive
		Song = pridenjoy
		mode = p1_quickplay
		p1_character_id = XAVIER
		p2_character_id = JUDY
		p1_instrument_id = Instrument_focus02
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 4
		p2_style = 1
	}
	{
		Level = load_z_artdeco
		Song = Barracuda
		mode = p1_quickplay
		p1_character_id = JUDY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_Les_Paul_Black
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		Level = load_z_dive
		Song = bullsonparade
		mode = p1_quickplay
		p1_character_id = CASEY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 3
		p2_style = 1
	}
	{
		Level = load_z_party
		Song = prayeroftherefugee
		mode = p1_quickplay
		p1_character_id = JOHNNY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_Les_Paul_Red
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		Level = load_z_dive
		Song = LayDown
		mode = p1_quickplay
		p1_character_id = Axel
		p2_character_id = JUDY
		p1_instrument_id = Instrument_focus01
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		Level = load_z_wikker
		Song = threesandsevens
		mode = p1_quickplay
		p1_character_id = JUDY
		p2_character_id = JUDY
		p1_instrument_id = Instrument_Explorer_Black
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 3
		p2_style = 1
	}
	{
		Level = load_z_budokan
		Song = mycurse
		mode = p1_quickplay
		p1_character_id = Axel
		p2_character_id = JUDY
		p1_instrument_id = Instrument_wyldeb
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		Level = load_z_prison
		Song = Paranoid
		mode = p1_quickplay
		p1_character_id = LARS
		p2_character_id = JUDY
		p1_instrument_id = Instrument_Ebony_Vee
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
		p1_outfit = 2
		p2_outfit = 1
		p1_style = 2
		p2_style = 1
	}
	{
		Level = load_z_prison
		Song = talkdirtytome
		mode = p1_quickplay
		p1_character_id = Izzy
		p2_character_id = JUDY
		p1_instrument_id = Instrument_Firebird_Cherry
		p2_instrument_id = Instrument_Les_Paul_Black
		p1_difficulty = EASY
		p2_difficulty = EASY
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
	SoundBussUnlock \{Band_Balance}
	SetSoundBussParams \{Guitar_Balance = {
			vol = -100.0
		}
		Time = 1.5}
	SetSoundBussParams \{Band_Balance = {
			vol = -100.0
		}
		Time = 1.5}
	SoundBussLock \{Guitar_Balance}
	SoundBussLock \{Band_Balance}
	kill_start_key_binding
	GetArraySize \{$Attract_Mode_Info}
	if (<array_Size> = 1)
		attract_mode_index = 0
	else
		if ($last_attract_mode >= 0)
			GetRandomValue Name = attract_mode_index Integer A = 0 B = (<array_Size> - 2)
			if (<attract_mode_index> >= $last_attract_mode)
				attract_mode_index = (<attract_mode_index> + 1)
			endif
		else
			GetRandomValue Name = attract_mode_index Integer A = 0 B = (<array_Size> - 1)
		endif
		Change last_attract_mode = <attract_mode_index>
	endif
	p1_outfit = 1
	p2_outfit = 1
	p1_style = 1
	p2_style = 1
	AddParams ($Attract_Mode_Info [<attract_mode_index>])
	Change \{StructureName = player1_status
		bot_play = 1}
	Change \{StructureName = player2_status
		bot_play = 1}
	Change current_level = <Level>
	Change game_mode = <mode>
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		Change \{current_num_players = 2}
	else
		Change \{current_num_players = 1}
	endif
	Change StructureName = player1_status character_id = <p1_character_id>
	Change StructureName = player2_status character_id = <p2_character_id>
	Change StructureName = player1_status instrument_id = <p1_instrument_id>
	Change StructureName = player2_status instrument_id = <p2_instrument_id>
	Change StructureName = player1_status outfit = <p1_outfit>
	Change StructureName = player2_status outfit = <p2_outfit>
	Change StructureName = player1_status style = <p1_style>
	Change StructureName = player2_status style = <p2_style>
	SoundBussUnlock \{Master}
	SetSoundBussParams \{Master = {
			vol = -11.0
		}
		Time = 0.5}
	SoundBussLock \{Master}
	mark_unsafe_for_shutdown
	UnPauseGame
	Load_Venue
	start_gem_scroller song_name = <Song> DIFFICULTY = <p1_difficulty> difficulty2 = <p2_difficulty> StartTime = 0 device_num = ($player1_status.controller)
	create_attract_mode_text
	StopRendering
	destroy_loading_screen
	SoundBussUnlock \{Guitar_Balance}
	SoundBussUnlock \{Band_Balance}
	SetSoundBussParams {Guitar_Balance = {vol = (($Default_BussSet.Guitar_Balance.vol) - 1.5)}}
	SetSoundBussParams {Band_Balance = {vol = (($Default_BussSet.Band_Balance.vol) - 1.5)}}
	SoundBussLock \{Guitar_Balance}
	SoundBussLock \{Band_Balance}
	SpawnScriptNow \{check_for_attract_mode_input}
endscript

script create_attract_mode_text 
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = am_container
		Pos = (0.0, 0.0)}
	Text = "PRESS ANY BUTTON TO ROCK..."
	text_pos = (640.0, 637.0)
	CreateScreenElement {
		Type = TextElement
		Text = <Text>
		Pos = <text_pos>
		PARENT = am_container
		rgba = [220 220 220 255]
		font = fontgrid_title_gh3
		just = [Center Bottom]
		Scale = 0.9
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [110 20 80 250]
	}
	CreateScreenElement \{Type = SpriteElement
		PARENT = am_container
		texture = logo_GH3_LoR_256
		Dims = (225.0, 225.0)
		Pos = (640.0, 490.0)
		just = [
			Center
			Center
		]}
endscript

script destroy_attract_mode_text 
	destroy_menu \{menu_id = am_container}
	StopAllSounds
	SoundBussUnlock \{Master}
	SetSoundBussParams {Master = {vol = ($Default_BussSet.Master.vol)}}
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
	Wait \{1
		GameFrame}
	repeat
	wait_for_safe_shutdown
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		Params = {
			action = exit_attract_mode
		}}
endscript

script destroy_attract_mode 
	PauseGame
	destroy_attract_mode_text
	KillSpawnedScript \{Name = check_for_attract_mode_input}
	kill_gem_scroller
	Change \{StructureName = player1_status
		bot_play = 0}
	Change \{StructureName = player2_status
		bot_play = 0}
	UnPauseGame
	kill_start_key_binding
	Change \{is_attract_mode = 0}
endscript

script check_for_any_input \{button1 = {
		}
		button2 = {
		}}
	begin
	GetButtonsPressed
	if (<makes> = 0)
		break
	endif
	Wait \{1
		GameFrame}
	repeat
	begin
	if NOT ($invite_controller = -1)
		SpawnScriptNow ui_flow_manager_respond_to_action Params = {action = Continue flow_state_func_params = {device_num = ($invite_controller)}}
		break
	endif
	Continue = 0
	if GotParam \{use_primary_controller}
		if GuitarControllerMake <button1> ($primary_controller)
			<Continue> = 1
		elseif GuitarControllerMake <button2> ($primary_controller)
			<Continue> = 1
		endif
	else
		GetButtonsPressed <button1>
		if NOT (<makes> = 0)
			<Continue> = 1
		endif
	endif
	if (<Continue> = 1)
		SpawnScriptNow ui_flow_manager_respond_to_action Params = {action = Continue flow_state_func_params = {device_num = <device_num>}}
		break
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script menu_press_any_button_create_obvious_text 
	Text = "PRESS ANY BUTTON TO ROCK..."
	text_pos = (670.0, 425.0)
	CreateScreenElement {
		Type = TextBlockElement
		PARENT = pab_container
		font = text_a6
		Text = <Text>
		Dims = (500.0, 200.0)
		Pos = <text_pos>
		just = [LEFT Top]
		internal_just = [Center Top]
		rgba = [215 120 40 255]
		Scale = 0.7
		allow_expansion
	}
endscript
