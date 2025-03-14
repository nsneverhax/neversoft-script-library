net_rounds_settings_struct = {
	score_mode = rounds
	rounds = 10
}
net_rounds_score_mode_options = [
	{
		name = "Rounds"
		checksum = rounds
	}
	{
		name = "Points"
		checksum = points
	}
]
net_rounds_round_num_options = [
	{
		name = "1"
		value = 1
	}
	{
		name = "3"
		value = 3
	}
	{
		name = "5"
		value = 5
	}
]
net_rounds_point_num_options = [
	{
		name = "1"
		value = 1
	}
	{
		name = "5"
		value = 5
	}
	{
		name = "10"
		value = 10
	}
	{
		name = "20"
		value = 20
	}
	{
		name = "40"
		value = 40
	}
]

script ui_create_net_round_settings 
	printf 'UI: ui_create_net_round_settings'
	make_cas_menu {
		title = "Game Settings"
		pausemenu
	}
	arrow_params = {
		id = net_round_settings_score_mode_item
		item_name = score_mode
		array = $net_rounds_score_mode_options
		element = checksum
		type = checksum
		global = net_rounds_settings_struct
		redraw_script = ui_create_net_round_settings
	}
	add_cas_menu_item {
		text = "SCORE MODE:"
		extra_text = "null"
		id = net_round_settings_score_mode_item
		option_arrows
		option_arrows_callback = net_gametype_adjust_host_option
		option_arrows_callback_params = <arrow_params>
	}
	net_gametype_adjust_host_option <arrow_params>
	switch (($net_rounds_settings_struct).score_mode)
		case rounds
		arrow_params = {
			id = net_round_settings_score_value_item
			item_name = rounds
			array = $net_rounds_round_num_options
			element = value
			type = int
			global = net_rounds_settings_struct
		}
		add_cas_menu_item {
			text = "ROUNDS:"
			extra_text = "null"
			id = net_round_settings_score_value_item
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
		}
		net_gametype_adjust_host_option <arrow_params>
		case points
		arrow_params = {
			id = net_round_settings_score_value_item
			item_name = points
			array = $net_rounds_point_num_options
			element = value
			type = int
			global = net_rounds_settings_struct
		}
		add_cas_menu_item {
			text = "POINTS:"
			extra_text = "null"
			id = net_round_settings_score_value_item
			option_arrows
			option_arrows_callback = net_gametype_adjust_host_option
			option_arrows_callback_params = <arrow_params>
		}
		net_gametype_adjust_host_option <arrow_params>
	endswitch
	add_cas_menu_item {
		text = "DONE"
		pad_choose_script = net_round_settings_apply_exit
	}
	cas_menu_finish
endscript

script net_round_settings_apply_exit 
	NetRoundFunc {
		func = set_game_settings
		params = ($net_rounds_settings_struct)
	}
	wait \{5
		gameframes}
	ui_change_state \{state = uistate_pausemenu}
endscript

script ui_destroy_net_round_settings 
	printf \{'UI: ui_destroy_net_round_settings'}
	generic_ui_destroy
endscript
