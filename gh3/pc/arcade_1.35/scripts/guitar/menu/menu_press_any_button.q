watchdog_audit_retries = 0
Attract_Mode_Info = [
	{
		level = load_z_budokan
		song = slowride
		mode = p1_quickplay
		p1_character_id = Midori
		p2_character_id = Izzy
		p1_instrument_id = Instrument_Guitar_Rojimbo
		p2_instrument_id = Instrument_Star_Guitar_Red
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_wikker
		song = surfingwiththealien
		mode = p1_quickplay
		p1_character_id = Izzy
		p2_character_id = Johnny
		p1_instrument_id = Instrument_Star_Guitar_Red
		p2_instrument_id = Instrument_Star_England
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_prison
		song = barracuda
		mode = p1_quickplay
		p1_character_id = Johnny
		p2_character_id = Axel
		p1_instrument_id = Instrument_Star_England
		p2_instrument_id = Instrument_Guitar_King
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_artdeco
		song = stricken
		mode = p1_quickplay
		p1_character_id = Axel
		p2_character_id = Lars
		p1_instrument_id = Instrument_Guitar_King
		p2_instrument_id = Instrument_Bat
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_party
		song = paranoid
		mode = p1_quickplay
		p1_character_id = Lars
		p2_character_id = Midori
		p1_instrument_id = Instrument_Bat
		p2_instrument_id = Instrument_Guitar_Rojimbo
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_wikker
		song = monsters
		mode = p1_quickplay
		p1_character_id = Midori
		p2_character_id = Izzy
		p1_instrument_id = Instrument_Guitar_Fortune
		p2_instrument_id = Instrument_Guitar_Messenger
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_prison
		song = reptilia
		mode = p1_quickplay
		p1_character_id = Izzy
		p2_character_id = Johnny
		p1_instrument_id = Instrument_Guitar_Messenger
		p2_instrument_id = Instrument_Jolly
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_artdeco
		song = lagrange
		mode = p1_quickplay
		p1_character_id = Johnny
		p2_character_id = Axel
		p1_instrument_id = Instrument_Jolly
		p2_instrument_id = Instrument_Guitar_Razer
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_party
		song = yellow
		mode = p1_quickplay
		p1_character_id = Axel
		p2_character_id = Lars
		p1_instrument_id = Instrument_Guitar_Razer
		p2_instrument_id = Instrument_Guitar_Dragon
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
	{
		level = load_z_budokan
		song = cherubrock
		mode = p1_quickplay
		p1_character_id = Lars
		p2_character_id = Midori
		p1_instrument_id = Instrument_Guitar_Dragon
		p2_instrument_id = Instrument_Guitar_Fortune
		p1_difficulty = easy
		p2_difficulty = easy
		p1_outfit = 1
		p2_outfit = 1
		p1_style = 1
		p2_style = 1
	}
]
last_attract_mode = -1
last_attract_song = -1
is_attract_mode = 0
master_outside_attract = 0

script create_attract_mode 
	printf \{"create_attract_mode: checking all volumes"}
	Change \{menu_flow_locked = 1}
	Change \{left_player_continue = 0}
	Change \{right_player_continue = 0}
	Change \{active_player = 0}
	Change \{in_continue_screen = 0}
	Change \{is_test_mode = 0}
	Change \{coin_handling_enabled = 0}
	Change \{arcade_not_ok_to_accept_start_switches = 1}
	menu_top_rockers_clear_new_band_name
	create_loading_screen
	GetGlobalTags \{arcade_hardware_adjustments}
	GetGlobalTags \{user_options}
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
	GetArraySize ($gh3_arcade_tier_songs)
	num_playable_songs = <array_Size>
	begin
	GetRandomValue a = 0 b = (<num_playable_songs> -1) Name = random_song_index integer
	random_song_name = ($gh3_arcade_tier_songs [<random_song_index>])
	Progression_IsSongRestricted tier_global = GH3_General_Songs song = <random_song_name>
	printf "create_attract_mode: restricted = %a num_playable_songs = %b random_song_index = %c last_attract_song = %d" a = <restricted> b = <num_playable_songs> c = <random_song_index> d = $last_attract_song
	if (<restricted> = 0 && (<random_song_index> = 0 || <random_song_index> != $last_attract_song))
		Change last_attract_song = <random_song_index>
		break
	endif
	repeat
	song = <random_song_name>
	Change \{structurename = player1_status
		bot_play = 1}
	Change \{structurename = player2_status
		bot_play = 1}
	Change current_level = <level>
	Change \{g_last_venue_selected = $current_level}
	Change game_mode = <mode>
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		Change \{current_num_players = 2}
	else
		Change \{current_num_players = 1}
	endif
	Change \{debug_forcescore = good}
	Change structurename = player1_status character_id = <p1_character_id>
	Change structurename = player2_status character_id = <p2_character_id>
	Change structurename = player1_status instrument_id = <p1_instrument_id>
	Change structurename = player2_status instrument_id = <p2_instrument_id>
	Change structurename = player1_status outfit = <p1_outfit>
	Change structurename = player2_status outfit = <p2_outfit>
	Change structurename = player1_status style = <p1_style>
	Change structurename = player2_status style = <p2_style>
	if (<arcade_attract_audio_on> = 1)
		GetGlobalTags \{user_options}
		GetGlobalTags \{arcade_hardware_adjustments}
		output_current_sound_info
		GetGlobalTags \{arcade_hardware_adjustments}
		printf "Setting attract volume to %d" d = <master_attract_volume>
		SoundBussUnlock \{Master}
		setsoundbussparams {Master = {vol = (<master_attract_volume>)}} time = 0
		SoundBussLock \{Master}
		output_current_sound_info
	else
		GetGlobalTags \{user_options}
		GetGlobalTags \{arcade_hardware_adjustments}
		output_current_sound_info
		mute_attract_sounds
		output_current_sound_info
	endif
	mark_unsafe_for_shutdown
	UnPauseGame
	Load_Venue
	GetGlobalTags \{arcade_hardware_adjustments}
	printf "create_attract_mode: attract_audio=%d" d = <arcade_attract_audio_on>
	printf "create_attract_mode: device_num=%a" a = ($player1_status.controller)
	start_gem_scroller song_name = <song> difficulty = <p1_difficulty> difficulty2 = <p2_difficulty> starttime = 0 device_num = ($player1_status.controller) play_audio = <arcade_attract_audio_on>
	StopRendering
	destroy_loading_screen
	destroy_top_rockers_loading_screen
	SpawnScriptNow \{reallow_start_and_coins}
	Change \{menu_flow_locked = 0}
endscript

script reallow_start_and_coins 
	Wait \{0.25
		Seconds}
	Change \{arcade_not_ok_to_accept_start_switches = 0}
	Change \{coin_handling_enabled = 1}
endscript

script create_attract_mode_text 
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = am_container
		Pos = (0.0, 0.0)}
	text = "PRESS ANY BUTTON TO ROCK..."
	text_pos = (640.0, 637.0)
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
	CreateScreenElement \{Type = SpriteElement
		parent = am_container
		texture = logo_GH3_LoR_256
		dims = (225.0, 225.0)
		Pos = (640.0, 490.0)
		just = [
			center
			center
		]}
endscript

script destroy_attract_mode_text 
	destroy_menu \{menu_id = am_container}
	GH3_SFX_fail_song_stop_sounds
	GetGlobalTags \{user_options}
	GetGlobalTags \{arcade_hardware_adjustments}
	if (<arcade_attract_audio_on> = 1)
	else
	endif
endscript

script check_for_attract_mode_input 
	check_button = 65536
	begin
	GetHeldPattern controller = ($primary_controller) nobrokenstring
	if (<hold_pattern> && <check_button>)
		if (coin_start_ok = 1)
			remove_credit
			break
		else
			printf \{"check_for_attract_mode_input: not enough credits to start"}
		endif
	endif
	if NOT ($invite_controller = -1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	wait_for_safe_shutdown
	Change \{leave_attract_skip_fade = 1}
	SpawnScriptNow \{ui_flow_manager_respond_to_action
		params = {
			action = exit_attract_mode
		}}
endscript

script destroy_attract_mode 
	printf \{"destroy_attract_mode: enter"}
	Change \{menu_flow_locked = 1}
	GetGlobalTags \{arcade_audits}
	GetGlobalTags \{arcade_hardware_adjustments}
	PauseGame
	Change \{debug_forcescore = OFF}
	destroy_attract_mode_text
	kill_gem_scroller
	Change \{structurename = player1_status
		bot_play = 0}
	Change \{structurename = player2_status
		bot_play = 0}
	UnPauseGame
	kill_start_key_binding
	GetSoundBussParams \{Guitar_Balance = {
			vol
		}}
	Change \{menu_flow_locked = 0}
endscript
invalid_controller_lock = 0

script menu_press_any_button_create_obvious_text 
	text = "PRESS ANY BUTTON TO STOP THE MEMORY LEAK..."
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

script increment_watchdog_audit 
	printf \{"increment_watchdog_audit: we have watchdog"}
	GetGlobalTags \{arcade_audits}
	temp_watchdog_resets = <arcade_total_watchdog_resets>
	Increment \{arcade_total_watchdog_resets}
	SetGlobalTags arcade_audits params = {arcade_total_watchdog_resets = <arcade_total_watchdog_resets>}
	memcard_sequence_begin_autosave
	memcard_sequence_cleanup_generic \{display_anything = 0}
	if ($rt_file_watchdog_logging_enabled)
		write_rt_debug_info \{output_text = 'Watchdog reboot detected'}
	endif
	GetGlobalTags \{arcade_audits}
	if (<arcade_total_watchdog_resets> = <temp_watchdog_resets>)
		Increment \{watchdog_audit_retries}
		printf \{"increment_watchdog_audit: Ok, something went wrong.  These two shouldn't be equal, let's try it again"}
		Increment \{arcade_total_watchdog_resets}
		SetGlobalTags arcade_audits params = {arcade_total_watchdog_resets = <arcade_total_watchdog_resets>}
		memcard_sequence_begin_autosave
		memcard_sequence_cleanup_generic \{display_anything = 0}
	endif
	ClearWDRecdState
endscript

script increment_maintenance_audit 
	printf \{"increment_maintenance_audit"}
	GetGlobalTags \{arcade_audits}
	printf "arcade_total_maintenance_resets: %a" a = <arcade_total_maintenance_resets>
	Increment \{arcade_total_maintenance_resets}
	SetGlobalTags arcade_audits params = {arcade_total_maintenance_resets = <arcade_total_maintenance_resets>}
	printf "arcade_total_maintenance_resets: %b" b = <arcade_total_maintenance_resets>
	write_rt_debug_info \{output_text = 'Maintenance reboot'}
	printf \{"save start"}
	memcard_sequence_begin_autosave
	memcard_sequence_cleanup_generic \{display_anything = 0}
	printf \{"save done"}
endscript
