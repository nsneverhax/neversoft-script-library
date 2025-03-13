
script ui_create_leaderboard_difficulty 
	createscreenelement {
		parent = root_window
		id = 0x49e27bfc
		type = descinterface
		desc = 'options_menu'
		title_text = qs(0xa1ae7e56)
		exclusive_device = ($primary_controller)
		helper_text_text = qs(0x03ac90f0)
	}
	if NOT 0x49e27bfc :desc_resolvealias \{name = 0xa39f6109
			param = 0xd27b45a1}
		softassert \{qs(0xb547c6cd)}
		return
	endif
	assignalias id = <0xd27b45a1> alias = current_menu
	current_menu :settags \{smooth_morph_time = 0.1
		0x86b76cb5 = 1}
	current_menu :se_setprops \{event_handlers = [
			{
				pad_up
				0x0c5f870a
				params = {
					desc_id = 0x49e27bfc
					up
				}
			}
			{
				pad_up
				smoothmenuscroll
				params = {
					dir = -1
					isvertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_down
				0x0c5f870a
				params = {
					desc_id = 0x49e27bfc
					down
				}
			}
			{
				pad_down
				smoothmenuscroll
				params = {
					dir = 1
					isvertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_left
				0x0c5f870a
				params = {
					desc_id = 0x49e27bfc
					up
				}
			}
			{
				pad_left
				smoothmenuscroll
				params = {
					dir = -1
					isvertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_right
				0x0c5f870a
				params = {
					desc_id = 0x49e27bfc
					down
				}
			}
			{
				pad_down
				smoothmenuscroll
				params = {
					dir = 1
					isvertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_back
				generic_event_back
			}
		]}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_difficulty_select
		pad_choose_params = {mode = <mode> difficulty = beginner}
		text = qs(0x74d6a0a0)
		parent = current_menu
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_difficulty_select
		pad_choose_params = {mode = <mode> difficulty = easy}
		text = qs(0x8d657387)
		parent = current_menu
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_difficulty_select
		pad_choose_params = {mode = <mode> difficulty = medium}
		text = qs(0x6ef11a01)
		parent = current_menu
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_difficulty_select
		pad_choose_params = {mode = <mode> difficulty = hard}
		text = qs(0x51b06d2f)
		parent = current_menu
	}
	add_generic_barrel_menu_text_item {
		pad_choose_script = ui_leaderboard_difficulty_select
		pad_choose_params = {mode = <mode> difficulty = expert}
		text = qs(0x334908ac)
		parent = current_menu
	}
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
	if screenelementexists \{id = 0x49e27bfc}
		destroyscreenelement \{id = 0x49e27bfc}
	endif
endscript

script ui_leaderboard_difficulty_select 
	change current_leaderboard_difficulty = <difficulty>
	songlist_clear
	generic_event_choose state = uistate_songlist data = {mode = <mode>}
endscript
