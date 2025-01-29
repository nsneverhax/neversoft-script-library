
script ui_create_leaderboard_difficulty 
	CreateScreenElement {
		parent = root_window
		id = leaderboards_difficulty
		type = DescInterface
		desc = 'options_menu'
		title_text = qs(0xa1ae7e56)
		exclusive_device = ($primary_controller)
		helper_text_text = qs(0x03ac90f0)
	}
	if NOT leaderboards_difficulty :Desc_ResolveAlias \{name = alias_options_vmenu
			param = options_vmenu}
		softassert \{qs(0xb547c6cd)}
		return
	endif
	AssignAlias id = <options_vmenu> alias = current_menu
	current_menu :SetTags \{smooth_morph_time = 0.1
		create_dummy_items = 1}
	current_menu :SE_SetProps \{event_handlers = [
			{
				pad_up
				ui_flash_scroll_arrow
				params = {
					desc_id = leaderboards_difficulty
					up
				}
			}
			{
				pad_up
				SmoothMenuScroll
				params = {
					Dir = -1
					isVertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_down
				ui_flash_scroll_arrow
				params = {
					desc_id = leaderboards_difficulty
					down
				}
			}
			{
				pad_down
				SmoothMenuScroll
				params = {
					Dir = 1
					isVertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_left
				ui_flash_scroll_arrow
				params = {
					desc_id = leaderboards_difficulty
					up
				}
			}
			{
				pad_left
				SmoothMenuScroll
				params = {
					Dir = -1
					isVertical = true
					play_scroll_sound = 1
				}
			}
			{
				pad_right
				ui_flash_scroll_arrow
				params = {
					desc_id = leaderboards_difficulty
					down
				}
			}
			{
				pad_down
				SmoothMenuScroll
				params = {
					Dir = 1
					isVertical = true
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
	LaunchEvent \{type = focus
		target = current_menu
		data = {
			child_index = 2
		}}
endscript

script ui_destroy_leaderboard_difficulty 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = leaderboards_difficulty}
		DestroyScreenElement \{id = leaderboards_difficulty}
	endif
endscript

script ui_leaderboard_difficulty_select 
	Change current_leaderboard_difficulty = <difficulty>
	songlist_clear
	generic_event_choose state = uistate_songlist data = {mode = <mode>}
endscript
