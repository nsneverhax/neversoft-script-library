bink_debug_info = [
	{
		menu_text = ""
		name = 'intro'
	}
	{
		menu_text = ""
		name = 'atvi'
	}
	{
		menu_text = ""
		name = 'CityMapScreen_010'
	}
	{
		menu_text = ""
		name = 'City_Map'
	}
	{
		menu_text = ""
		name = 'ClassicGoal_Left'
	}
	{
		menu_text = ""
		name = 'ClassicGoal_Right'
	}
	{
		menu_text = ""
		name = 'cut_test_20_sec'
	}
	{
		menu_text = ""
		name = 'DuringGoals_Pause'
	}
	{
		menu_text = ""
		name = 'FilmerGoal'
	}
	{
		menu_text = ""
		name = 'intro'
	}
	{
		menu_text = ""
		name = 'In_Goal_Pause'
	}
	{
		menu_text = ""
		name = 'loading_2player'
	}
	{
		menu_text = ""
		name = 'loading_gen_loop'
	}
	{
		menu_text = ""
		name = 'loading_online'
	}
	{
		menu_text = ""
		name = 'loading_yourcrib'
	}
	{
		menu_text = ""
		name = 'love_park_can_gap'
	}
	{
		menu_text = ""
		name = 'love_park_fountain_gap'
	}
	{
		menu_text = ""
		name = 'MainMenu'
	}
	{
		menu_text = ""
		name = 'ns_logo'
	}
	{
		menu_text = ""
		name = 'PhotoGoal'
	}
	{
		menu_text = ""
		name = 'ProGoal'
	}
	{
		menu_text = ""
		name = 'skaterselect_01'
	}
	{
		menu_text = ""
		name = 'SkateShop'
	}
	{
		menu_text = ""
		name = 'SkateVidTest_02'
	}
	{
		menu_text = ""
		name = 'Sub_Menu'
	}
	{
		menu_text = ""
		name = 'YouWin_01'
	}
]

script bink_debug_menu_create 
	bink_debug_menu_destroy
	make_cas_menu \{menu_id = debug_menu
		vmenu_id = debug_vmenu
		title = "BINK DEBUG"
		scrolling
		pad_back_script = generic_menu_pad_back
		pad_back_params = {
			callback = create_debug_options_menu
		}
		not_centered
		pausemenu
		width = 700}
	foreachin \{$bink_debug_info
		do = bink_debug_menu_add_item}
	cas_menu_finish
endscript

script bink_debug_menu_destroy 
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	generic_ui_destroy
endscript

script bink_debug_menu_add_item 
	formattext textname = text "%a - %b" a = <name> b = <menu_text>
	add_cas_menu_item {
		text = <text>
		pad_choose_script = bink_debug_menu_play
		pad_choose_params = <...>
	}
endscript

script bink_debug_menu_play 
	killallmovies \{blocking}
	bink_debug_menu_destroy
	kill_start_key_binding
	<old_game_framerate> = $game_lock_framerate
	change \{game_lock_framerate = 2}
	playmovie {
		movie = <name>
		textureslot = 0
		texturepri = 0
	}
	controllerdebounce \{x}
	begin
	if controllerpressed \{x}
		break
	endif
	wait \{1
		gameframes}
	repeat
	killallmovies \{blocking}
	change game_lock_framerate = <old_game_framerate>
	restore_start_key_binding
	bink_debug_menu_create
endscript
