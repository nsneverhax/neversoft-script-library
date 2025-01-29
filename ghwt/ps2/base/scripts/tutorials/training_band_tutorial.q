training_band_tutorial_script = [
	{
		call = training_band_tutorial_startup
	}
	{
		time = 1000
		call = training_band_tutorial_show_title
	}
	{
		lesson = 1
		call = training_6_1_show_lesson_header
	}
	{
		call = training_6_1_complete_message
	}
	{
		lesson = 2
		call = training_6_2_show_lesson_header
	}
	{
		call = training_6_2_show_instruments
	}
	{
		call = training_6_2_show_highway
	}
	{
		call = training_6_2_show_items_on_highway
	}
	{
		call = training_6_2_show_bands_rock_meter_and_demo
	}
	{
		call = training_6_2_show_individual_indicators_and_demo
	}
	{
		call = training_6_2_show_individual_note_streak_and_demo
	}
	{
		call = training_6_2_complete_message
	}
	{
		lesson = 3
		call = training_6_3_show_lesson_header
	}
	{
		call = training_6_3_show_highway
	}
	{
		call = training_6_3_show_bands_rock_meter_and_demo
	}
	{
		call = training_6_3_show_band_playing_in_unison
	}
	{
		call = training_6_3_complete_message
	}
	{
		call = training_band_tutorial_1_end
	}
]

script training_band_tutorial_startup 

	training_init_session
	0xc1c4e84c \{mode = tutorials
		tutorial = 1}
	LaunchEvent \{Type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_band_tutorial_show_title 
	Change \{g_training_lessons_completed = 0}

	training_show_title \{title = qs(0xab248876)}
	begin
	if ($transitions_locked = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	Wait \{3
		Seconds}
	training_destroy_title
endscript

script training_6_1_show_lesson_header 

	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x80328de0)}
	training_show_lesson_header
	create_training_pause_handler
	training_show_narrator \{narrator = 'bassist'}
	0x4de05aff \{mode = 0xb33bf552}
	training_play_sound \{Sound = 'Tut_Band_Intro_01_BAS'
		Wait}
	Wait \{0.25
		Seconds}
	training_play_sound \{Sound = 'Tut_Band_Intro_02_BAS'
		Wait}
	training_hide_narrator
endscript

script training_6_1_complete_message 

	training_generic_lesson_complete
endscript

script training_6_2_show_lesson_header 

	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x9a21156c)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_6_2_show_instruments 

	create_training_pause_handler
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (0.0, 0.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	LaunchEvent \{Type = focus
		target = menu_tutorial}
	CreateScreenElement \{parent = menu_tutorial
		id = training_instrument_select_hub
		Type = descinterface
		desc = 'band_play'}
	training_instrument_select_hub :se_getprops
	if training_instrument_select_hub :desc_resolvealias \{Name = alias_hmenu}
		band_hmenu = <resolved_id>
	endif
	menu_array = []
	desc_array = []
	i = 0
	begin
	ResolveScreenElementID id = [
		{id = <band_hmenu>}
		{index = <i>}
	]
	AddArrayElement array = <desc_array> element = <resolved_id>
	desc_array = <array>
	<resolved_id> :desc_resolvealias Name = alias_menu
	if ScreenElementExists id = <resolved_id>
		allowed = {guitar bass drum vocals}
		<resolved_id> :SetTags {
			menu = instrument
			instrument = None
			difficulty = None
			controller = <i>
			allowed = <allowed>
			index = <i>
		}
		DestroyScreenElement id = <resolved_id> preserve_parent
		LaunchEvent Type = focus target = <resolved_id> data = {child_index = 0}
		text_params = {
			Type = TextBlockElement
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			parent = <resolved_id>
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			dims = (200.0, 40.0)
		}
		CreateScreenElement {
			<text_params>
			text = qs(0x9504b94a)
		}
		CreateScreenElement {
			<text_params>
			text = qs(0x7d4f9214)
		}
		CreateScreenElement {
			<text_params>
			text = qs(0x388cd3db)
		}
		CreateScreenElement {
			<text_params>
			text = qs(0x1b9f6f84)
		}
		AddArrayElement array = <menu_array> element = <resolved_id>
		menu_array = <array>
		if (<i> > 0)
			begin
			LaunchEvent Type = pad_down target = <resolved_id>
			repeat <i>
		endif
	endif
	i = (<i> + 1)
	repeat 4
	training_instrument_select_hub :SetTags {menus = <menu_array> descs = <desc_array>}
	menu_finish
	clean_up_user_control_helpers
	training_show_narrator \{narrator = 'bassist'}
	0x4de05aff \{mode = 0xd37d8f70}
	training_play_sound \{Sound = 'Tut_Band_Play_01_BAS'
		Wait}
	training_hide_narrator
	destroy_menu \{menu_id = menu_tutorial}
	training_hide_lesson_header
endscript

script training_6_2_show_highway 

	setplayerinfo \{2
		four_lane_highway = 0}
	training_start_gem_scroller \{players = 4
		song = tut_demo
		bot_array = [
			1
			1
			1
			1
		]}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	create_training_pause_handler
	Change \{structurename = band1_status
		score = 3141975}
	training_wait_for_gem_scroller_startup
endscript

script training_6_2_show_items_on_highway 

	create_training_pause_handler
	Wait \{3.6
		Seconds
		ignoreslomo}
	training_pause_gem_scroller
	0x4de05aff \{mode = 0x442f0bde}
	training_play_sound \{Sound = 'Tut_Band_Star_01_BAS'}
	Wait \{2
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow2
		life = 2
		Pos = (640.0, 120.0)
		Scale = 2.3
		rot = 180}
	Wait \{2
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow2
		life = 2
		Pos = (235.0, 360.0)
		Scale = 2.3}
	training_add_arrow \{id = training_arrow2
		life = 2
		Pos = (1045.0, 360.0)
		Scale = 2.3}
	training_add_arrow \{id = training_arrow2
		life = 2
		Pos = (640.0, 360.0)
		Scale = 2.3}
	Wait \{3
		Seconds
		ignoreslomo}
	training_destroy_all_arrows
endscript

script training_6_2_spawn_meter_changing 

	training_add_arrow \{id = training_arrow2
		life = 4
		Pos = (275.0, 100.0)
		Scale = 2.3
		rot = 90}
	Wait \{9
		Seconds
		ignoreslomo}
	Wait \{2
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		params = {
			health = 1.6
		}
		id = training_spawned_script}
	Wait \{2
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = training_set_health}
	SpawnScriptNow \{training_set_health
		params = {
			health = 0.4
		}
		id = training_spawned_script}
	Wait \{2
		Seconds
		ignoreslomo}
	training_start_hud_flashing_red
endscript

script training_6_2_show_bands_rock_meter_and_demo 

	create_training_pause_handler
	SpawnScriptNow \{training_6_2_spawn_meter_changing
		id = training_spawned_script}
	training_play_sound \{Sound = 'Tut_Band_Star_02_BAS'
		Wait}
	training_stop_hud_flashing_red
endscript

script training_6_2_move_individual_indicators 

	training_add_arrow \{id = training_arrow2
		life = 4
		Pos = (275.0, 170.0)
		Scale = 2.3
		rot = 90}
	player_status = player1_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 0.5 ignore_band_members} id = training_spawned_script
	player_status = player2_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 0.2 ignore_band_members} id = training_spawned_script
	player_status = player3_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 1.4 ignore_band_members} id = training_spawned_script
	player_status = player4_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 0.8 ignore_band_members} id = training_spawned_script
	Wait \{2.0
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = training_set_health}
	player_status = player1_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 0.2 ignore_band_members} id = training_spawned_script
	player_status = player2_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 1.1 ignore_band_members} id = training_spawned_script
	player_status = player3_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 0.8 ignore_band_members} id = training_spawned_script
	player_status = player4_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 1.6 ignore_band_members} id = training_spawned_script
	Wait \{2.0
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = training_set_health}
	player_status = player1_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 1.1 ignore_band_members} id = training_spawned_script
	player_status = player2_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 0.6 ignore_band_members} id = training_spawned_script
	player_status = player3_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 1.6 ignore_band_members} id = training_spawned_script
	player_status = player4_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 0.2 ignore_band_members} id = training_spawned_script
	Wait \{2.0
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = training_set_health}
	player_status = player1_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 0.2 ignore_band_members} id = training_spawned_script
	player_status = player2_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 0.2 ignore_band_members} id = training_spawned_script
	player_status = player3_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 0.2 ignore_band_members} id = training_spawned_script
	player_status = player4_status
	SpawnScriptNow training_set_health params = {player_status = <player_status> health = 0.2 ignore_band_members} id = training_spawned_script
endscript

script training_6_2_show_individual_indicators_and_demo 

	create_training_pause_handler
	Wait \{2.0
		Seconds
		ignoreslomo}
	SpawnScriptNow \{training_6_2_move_individual_indicators
		id = training_spawned_script}
	training_play_sound \{Sound = 'Tut_Band_Star_03_BAS'
		Wait}
	Wait \{1.0
		Seconds
		ignoreslomo}
endscript

script training_6_2_show_note_streak_indicator 

	Wait \{4.0
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow2
		life = 4
		Pos = (275.0, 250.0)
		Scale = 2.3
		rot = 90}
endscript

script training_6_2_show_individual_note_streak_and_demo 

	create_training_pause_handler
	gamemode_updatecooperative \{cooperative = 1}
	tutorialsetbandstreak \{streak = 50}
	SpawnScriptNow \{training_6_2_show_note_streak_indicator
		id = training_spawned_script}
	training_play_sound \{Sound = 'Tut_Band_Star_04_BAS'
		Wait}
	tutorialsetbandstreak \{streak = 0}
	gamemode_updatecooperative \{cooperative = 0}
endscript

script training_6_2_complete_message 

	training_play_sound \{Sound = 'Tut_Band_Star_05_BAS'
		Wait}
	training_resume_gem_scroller
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_generic_lesson_complete
endscript

script training_6_3_show_lesson_header 

	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0x9b6522a5)}
	create_training_pause_handler
	0x4de05aff \{mode = 0x442f0bde}
endscript

script training_6_3_show_highway 

	setplayerinfo \{2
		four_lane_highway = 0}
	training_start_gem_scroller \{players = 4
		song = tut_demo
		bot_array = [
			1
			1
			1
			1
		]}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	LaunchEvent \{Type = focus
		target = menu_tutorial}
	Change \{structurename = band1_status
		score = 3141975}
	training_wait_for_gem_scroller_startup
endscript

script training_6_3_trigger_band_star_power 

	Change \{structurename = band1_status
		star_power_display_amount = 100}
	<i> = 1
	begin
	getplayerinfo <i> checksum
	getplayerinfo <i> Player
	getplayerinfo <i> text
	Change structurename = <checksum> star_power_amount = 100
	SpawnScriptNow star_power_activate_and_drain params = {player_status = <checksum> Player = <Player> player_text = <text>}
	<i> = (<i> + 1)
	repeat 4
endscript

script training_6_3_show_arrow_pointing_to_bulbs 

	Wait \{3.0
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow2
		life = 4
		Pos = (275.0, 75.0)
		Scale = 2.3
		rot = 90}
endscript

script training_6_3_show_bands_rock_meter_and_demo 

	create_training_pause_handler
	Wait \{3.6
		Seconds
		ignoreslomo}
	training_pause_gem_scroller
	SpawnScriptNow \{training_6_3_show_arrow_pointing_to_bulbs
		id = training_spawned_script}
	training_play_sound \{Sound = 'Tut_Band_Star_06_BAS'
		Wait}
endscript

script training_6_3_show_band_playing_in_unison 

	create_training_pause_handler
	training_6_3_trigger_band_star_power
	Wait \{4.0
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Band_Star_07_BAS'
		Wait}
	Wait \{0.5
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Band_Star_08_BAS'
		Wait}
	training_clear_out_star_power
	Wait \{3.0
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Band_Star_09_BAS'
		Wait}
endscript

script training_6_3_complete_message 

	training_play_sound \{Sound = 'Tut_Band_Star_10_BAS'
		Wait}
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_hide_lesson_header
	training_destroy_gem_scroller
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	SpawnScriptNow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0x9e47f4d7)
			text_physics = 0
			placement = ps2_tut_top
		}}
	SpawnScriptNow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'complete_text'
			text = qs(0x232d1eaf)
			text_physics = 0
			placement = ps2_tut_bottom
		}}
	Wait \{7
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_all_exploding_text
	Change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_6_4_show_lesson_header 

	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x05c40f31)}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_6_4_show_highway 

endscript

script set_faked_ui_to_final_player_slots \{slot = 0}
	GetPlatform
	if (<Platform> = Xenon)
		<player_1_name> = qs(0x7c104666)
		<player_2_name> = qs(0x573d15a5)
		<player_3_name> = qs(0x4e2624e4)
		<player_4_name> = qs(0x0167b223)
		<player_5_name> = qs(0x187c8362)
		<player_6_name> = qs(0x3351d0a1)
		<player_7_name> = qs(0x2a4ae1e0)
		<player_8_name> = qs(0xadd2fd2f)
	elseif (<Platform> = PS3)
		<player_1_name> = qs(0xddcad4ac)
		<player_2_name> = qs(0xf6e7876f)
		<player_3_name> = qs(0xeffcb62e)
		<player_4_name> = qs(0xa0bd20e9)
		<player_5_name> = qs(0xb9a611a8)
		<player_6_name> = qs(0x928b426b)
		<player_7_name> = qs(0x8b90732a)
		<player_8_name> = qs(0x0c086fe5)
	else

	endif
	<player_1_cash> = 3620
	<player_2_cash> = 16462
	<player_3_cash> = 27863
	<player_4_cash> = 47985
	<player_5_cash> = 66836
	<player_6_cash> = 76548
	<player_7_cash> = 97433
	<player_8_cash> = 107923
	<player_1_color> = $online_player_slot_bg_team1
	<player_2_color> = $online_player_slot_bg_team1
	<player_3_color> = $online_player_slot_bg_team1
	<player_4_color> = $online_player_slot_bg_team1
	<player_5_color> = $online_player_slot_bg_team2
	<player_6_color> = $online_player_slot_bg_team2
	<player_7_color> = $online_player_slot_bg_team2
	<player_8_color> = $online_player_slot_bg_team2
	<player_1_instrument> = logo_guitar_grayscale
	<player_2_instrument> = logo_bass_grayscale
	<player_3_instrument> = logo_drum_grayscale
	<player_4_instrument> = logo_vocal_grayscale
	<player_5_instrument> = logo_guitar_grayscale
	<player_6_instrument> = logo_bass_grayscale
	<player_7_instrument> = logo_drum_grayscale
	<player_8_instrument> = logo_vocal_grayscale
	onlinelobbyinterface :GetTags
	cash_get_info_from_earnings earnings = <player_1_cash>
	formatText TextName = cash_text qs(0x76b3fda7) d = <rank>

	online_lobby_add_player_slot {
		Name = <player_1_name>
		controller_texture = <player_1_instrument>
		bg_rgba = <player_1_color>
		parent = <player_slots_menu_id>
		cash_text = <cash_text>
		cash_icon_id = <cash_icon_id>
	}
	cash_get_info_from_earnings earnings = <player_2_cash>
	formatText TextName = cash_text qs(0x76b3fda7) d = <rank>

	online_lobby_add_player_slot {
		Name = <player_2_name>
		controller_texture = <player_2_instrument>
		bg_rgba = <player_2_color>
		parent = <player_slots_menu_id>
		cash_text = <cash_text>
		cash_icon_id = <cash_icon_id>
	}
	cash_get_info_from_earnings earnings = <player_3_cash>
	formatText TextName = cash_text qs(0x76b3fda7) d = <rank>

	online_lobby_add_player_slot {
		Name = <player_3_name>
		controller_texture = <player_3_instrument>
		bg_rgba = <player_3_color>
		parent = <player_slots_menu_id>
		cash_text = <cash_text>
		cash_icon_id = <cash_icon_id>
	}
	cash_get_info_from_earnings earnings = <player_4_cash>
	formatText TextName = cash_text qs(0x76b3fda7) d = <rank>

	online_lobby_add_player_slot {
		Name = <player_4_name>
		controller_texture = <player_4_instrument>
		bg_rgba = <player_4_color>
		parent = <player_slots_menu_id>
		cash_text = <cash_text>
		cash_icon_id = <cash_icon_id>
	}
	cash_get_info_from_earnings earnings = <player_5_cash>
	formatText TextName = cash_text qs(0x76b3fda7) d = <rank>

	online_lobby_add_player_slot {
		Name = <player_5_name>
		controller_texture = <player_5_instrument>
		bg_rgba = <player_5_color>
		parent = <player_slots_menu_id>
		cash_text = <cash_text>
		cash_icon_id = <cash_icon_id>
	}
	cash_get_info_from_earnings earnings = <player_6_cash>
	formatText TextName = cash_text qs(0x76b3fda7) d = <rank>

	online_lobby_add_player_slot {
		Name = <player_6_name>
		controller_texture = <player_6_instrument>
		bg_rgba = <player_6_color>
		parent = <player_slots_menu_id>
		cash_text = <cash_text>
		cash_icon_id = <cash_icon_id>
	}
	cash_get_info_from_earnings earnings = <player_7_cash>
	formatText TextName = cash_text qs(0x76b3fda7) d = <rank>

	online_lobby_add_player_slot {
		Name = <player_7_name>
		controller_texture = <player_7_instrument>
		bg_rgba = <player_7_color>
		parent = <player_slots_menu_id>
		cash_text = <cash_text>
		cash_icon_id = <cash_icon_id>
	}
	cash_get_info_from_earnings earnings = <player_8_cash>
	formatText TextName = cash_text qs(0x76b3fda7) d = <rank>

	online_lobby_add_player_slot {
		Name = <player_8_name>
		controller_texture = <player_8_instrument>
		bg_rgba = <player_8_color>
		parent = <player_slots_menu_id>
		cash_text = <cash_text>
		cash_icon_id = <cash_icon_id>
	}
endscript

script create_faked_net_matchmaking_menu 

	CreateScreenElement \{parent = training_container
		id = onlinelobbyinterface
		Type = descinterface
		desc = 'online_lobby'
		Pos = (0.0, 0.0)
		z_priority = 500
		tags = {
			menu_index = 0
			menu_items = 0
			slots_index = 0
			slot_items = 0
			player_slots_menu_id = 0
			locked_to_players = 0
		}}
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
	onlinelobbyinterface :desc_checkversion \{desired = 16
		assertif = mismatch}
	create_matchmaking_menu_and_items
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_player_slots_vmenu}
		<player_slots_menu_id> = <resolved_id>
		onlinelobbyinterface :SetTags player_slots_menu_id = <player_slots_menu_id>
	endif
	onlinelobbyinterface :se_setprops \{matchmaking_game_mode_text = qs(0xb39401d6)}
	SpawnScriptNow \{task_menu_default_anim_in
		params = {
			base_name = 'band_hub'
		}}
	set_faked_ui_to_final_player_slots
	online_lobby_setup_helper_controls
endscript

script training_6_4_show_band_vs_band 

	create_training_pause_handler
	Wait \{2.0
		Seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Band_Vs_01_BAS'}
	training_hide_lesson_header
	Wait \{3
		Seconds}
	create_faked_net_matchmaking_menu
	Wait \{3
		Seconds}
	training_add_arrow \{id = training_arrow2
		life = 2
		z = 510
		Pos = (536.0, 204.0)
		Scale = 2.3
		rot = 90}
	Wait \{7
		Seconds}
	training_add_arrow \{id = training_arrow2
		life = 2
		z = 510
		Pos = (791.0, 88.0)
		Scale = 2.3
		rot = 270}
	training_wait_for_sound \{Sound = 'Tut_Band_Vs_01_BAS'}
	if ScreenElementExists \{id = onlinelobbyinterface}
		DestroyScreenElement \{id = onlinelobbyinterface}
	endif
	Wait \{1
		Seconds
		ignoreslomo}
	training_resume_gem_scroller
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
endscript

script training_6_4_animate_band_vs_band 

	Wait \{13.0
		Seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow2
		life = 2
		Pos = (500.0, 360.0)
		Scale = 2.3
		rot = 180}
	training_add_arrow \{id = training_arrow2
		life = 2
		Pos = (780.0, 360.0)
		Scale = 2.3
		rot = 180}

	Change \{structurename = player1_status
		score = 1000}
	Change \{structurename = player2_status
		score = 1000}
	Change \{structurename = player3_status
		score = 1000}
	Change \{structurename = player4_status
		score = 1000}
	Change \{structurename = band1_status
		score = 4000}
	Wait \{0.5
		Seconds
		ignoreslomo}
	Change \{structurename = player5_status
		score = 2000}
	Change \{structurename = player6_status
		score = 2000}
	Change \{structurename = player7_status
		score = 2000}
	Change \{structurename = player8_status
		score = 2000}
	Change \{structurename = band2_status
		score = 8000}
	Wait \{0.5
		Seconds
		ignoreslomo}
	Change \{structurename = player1_status
		score = 10000}
	Change \{structurename = player2_status
		score = 10000}
	Change \{structurename = player3_status
		score = 10000}
	Change \{structurename = player4_status
		score = 10000}
	Change \{structurename = band1_status
		score = 44000}
	Wait \{0.5
		Seconds
		ignoreslomo}
	Change \{structurename = player5_status
		score = 20000}
	Change \{structurename = player6_status
		score = 20000}
	Change \{structurename = player7_status
		score = 20000}
	Change \{structurename = player8_status
		score = 20000}
	Change \{structurename = band2_status
		score = 88000}
	Wait \{0.5
		Seconds
		ignoreslomo}
	Change \{structurename = player1_status
		score = 1000000}
	Change \{structurename = player2_status
		score = 1000000}
	Change \{structurename = player3_status
		score = 1000000}
	Change \{structurename = player4_status
		score = 1000000}
	Change \{structurename = band1_status
		score = 4152001}
	Wait \{0.5
		Seconds
		ignoreslomo}
	Change \{structurename = player5_status
		score = 2000000}
	Change \{structurename = player6_status
		score = 2000000}
	Change \{structurename = player7_status
		score = 2000000}
	Change \{structurename = player8_status
		score = 2000000}
	Change \{structurename = band2_status
		score = 8061997}
	Wait \{0.5
		Seconds
		ignoreslomo}
endscript

script training_6_4_complete_message 

	training_destroy_title
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	training_hide_lesson_header
	training_destroy_gem_scroller
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	SpawnScriptNow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs(0x9e47f4d7)
			text_physics = 0
			placement = top
		}}
	SpawnScriptNow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'complete_text'
			text = qs(0x232d1eaf)
			text_physics = 0
			placement = bottom
		}}
	Wait \{7
		Seconds
		ignoreslomo}
	KillSpawnedScript \{Name = create_exploding_text}
	destroy_all_exploding_text
	Change g_training_lessons_completed = ($g_training_lessons_completed + 1)
endscript

script training_band_tutorial_1_end 

	training_container :GetTags
	if ($g_training_lessons_completed = 3)
		SetGlobalTags \{training
			params = {
				band_lesson = complete
			}}
	endif
	training_kill_session
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_destroy_narrator_icons
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
	training_check_for_all_tutorials_finished
	decide_tutorial_back_destination
endscript
