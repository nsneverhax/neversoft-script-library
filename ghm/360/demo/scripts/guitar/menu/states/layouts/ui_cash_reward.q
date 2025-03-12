
script ui_create_cash_reward 
	ui_create_cash_reward_menu
endscript

script ui_destroy_cash_reward 
	clean_up_user_control_helpers
	destroyscreenelement \{id = cash_rewards_desc}
endscript

script ui_cash_reward_continue 
	gamemode_gettype
	if (<type> = quickplay)
		ui_win_song_continue_next_menu
	else
		ui_win_song_career_continue
	endif
endscript

script ui_create_cash_reward_menu \{collection = [
		]}
	<collection> = $cash_milestones_collection
	if screenelementexists \{id = cash_rewards_desc}
		destroyscreenelement \{id = cash_rewards_desc}
	endif
	createscreenelement \{parent = root_window
		id = cash_rewards_desc
		type = descinterface
		desc = 'cash_reward2'
		pos = (0.0, 0.0)
		z_priority = 10
		dims = (1280.0, 720.0)
		auto_dims = false}
	cash_rewards_desc :desc_resolvealias \{name = alias_menu
		param = menu}
	gamemode_getnumplayers
	getarraysize <collection>
	if (<array_size> > 0)
		<player_idx> = 0
		begin
		getplayerinfo (<player_idx> + 1) part
		ui_get_instrument_text part = <part>
		<text> = <instrument_text>
		createscreenelement {
			parent = <menu>
			type = descinterface
			desc = 'cash_reward2_title_row'
			label_text = <text>
			dims = (0.0, 105.0)
			auto_dims = false
		}
		foreachin (<collection> [<player_idx>]) do = ui_cash_reward_add_item params = {menu = <menu>}
		<player_idx> = (<player_idx> + 1)
		repeat <num_players>
		getscreenelementdims id = <menu>
		<menu> :se_setprops pos = ((0.0, -1.0) * <height>) time = 0
		<menu> :se_setprops pos = (0.0, 0.0) motion = ease_out time = (<height> / 250.0)
	endif
	spawnscriptnow ui_cash_reward_set_menu_handlers params = {menu = <menu> max_height = <height>}
endscript

script ui_cash_reward_set_menu_handlers 
	<menu> :se_waitprops
	<menu> :se_setprops {
		event_handlers = [
			{pad_choose ui_cash_reward_continue}
			{pad_up ui_cash_reward_scroll params = {dir = 1 max_height = <max_height>}}
			{pad_down ui_cash_reward_scroll params = {dir = -1 max_height = <max_height>}}
		]
	}
	launchevent type = focus target = <menu>
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100}
endscript

script ui_cash_reward_add_item 
	<label> = ($cash_milestones.<milestone>.text)
	formattext textname = reward qs(0x447de8d3) d = <cash>
	createscreenelement {
		parent = <menu>
		type = descinterface
		desc = 'cash_reward2_row'
		label_text = <label>
		reward_text = <reward>
		dims = (0.0, 85.0)
		auto_dims = false
	}
endscript

script ui_cash_reward_scroll \{dir = 1}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	se_getprops
	<new_pos> = ((0.0, 100.0) * <dir> + <pos>)
	if (<new_pos> [1] > 0)
		<new_pos> = (0.0, 0.0)
	elseif (<new_pos> [1] > <max_height>)
		<new_pos> = ((0.0, -1.0) * <max_height>)
	endif
	se_setprops pos = <new_pos> motion = smooth time = 0.25
	se_waitprops
endscript
