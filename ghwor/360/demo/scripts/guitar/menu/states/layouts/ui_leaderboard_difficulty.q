
script ui_create_leaderboard_difficulty 
	make_generic_barrel_menu
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_difficulty_select
		pad_choose_params = {mode = <mode> difficulty = beginner}
		text = qs(0x74d6a0a0)
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_difficulty_select
		pad_choose_params = {mode = <mode> difficulty = easy}
		text = qs(0x8d657387)
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_difficulty_select
		pad_choose_params = {mode = <mode> difficulty = medium}
		text = qs(0x6ef11a01)
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_difficulty_select
		pad_choose_params = {mode = <mode> difficulty = hard}
		text = qs(0x51b06d2f)
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_difficulty_select
		pad_choose_params = {mode = <mode> difficulty = expert}
		text = qs(0x334908ac)
	}
	set_focus_color
	set_unfocus_color
	generic_barrel_menu_finish
	if gotparam \{vmenu_id}
		assignalias id = <vmenu_id> alias = current_menu
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	launchevent \{type = focus
		target = current_menu
		data = {
			child_index = 2
		}}
endscript

script ui_destroy_leaderboard_difficulty 
	clean_up_user_control_helpers
	destroy_generic_barrel_menu
endscript

script ui_leaderboard_difficulty_select 
	ui_sfx \{menustate = generic
		uitype = select}
	change current_leaderboard_difficulty = <difficulty>
	songlist_clear
	generic_event_choose state = uistate_songlist data = {mode = <mode>}
endscript
