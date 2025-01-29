
script ui_create_cash_reward 
	ui_create_cash_reward_menu
endscript

script ui_destroy_cash_reward 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = cash_rewards_desc}
endscript

script ui_cash_reward_continue 
	gamemode_gettype
	if (<Type> = quickplay)
		ui_win_song_continue_next_menu
	else
		ui_win_song_career_continue
	endif
endscript

script ui_create_cash_reward_menu \{collection = [
		]}
	<collection> = $cash_milestones_collection
	if ScreenElementExists \{id = cash_rewards_desc}
		DestroyScreenElement \{id = cash_rewards_desc}
	endif
	CreateScreenElement \{parent = root_window
		id = cash_rewards_desc
		Type = descinterface
		desc = 'cash_reward2'
		Pos = (0.0, 0.0)
		z_priority = 10
		dims = (1280.0, 720.0)
		auto_dims = FALSE}
	cash_rewards_desc :desc_resolvealias \{Name = alias_menu
		param = menu}
	gamemode_getnumplayers
	GetArraySize <collection>
	if (<array_Size> > 0)
		<player_idx> = 0
		begin
		getplayerinfo (<player_idx> + 1) part
		ui_get_instrument_text part = <part>
		<text> = <instrument_text>
		CreateScreenElement {
			parent = <menu>
			Type = descinterface
			desc = 'cash_reward2_title_row'
			label_text = <text>
			dims = (0.0, 105.0)
			auto_dims = FALSE
		}
		ForEachIn (<collection> [<player_idx>]) do = ui_cash_reward_add_item params = {menu = <menu>}
		<player_idx> = (<player_idx> + 1)
		repeat <num_players>
		GetScreenElementDims id = <menu>
		<menu> :se_setprops Pos = ((0.0, -1.0) * <height>) time = 0
		<menu> :se_setprops Pos = (0.0, 0.0) motion = ease_out time = (<height> / 250.0)
	endif
	SpawnScriptNow ui_cash_reward_set_menu_handlers params = {menu = <menu> max_height = <height>}
endscript

script ui_cash_reward_set_menu_handlers 
	<menu> :se_waitprops
	<menu> :se_setprops {
		event_handlers = [
			{pad_choose ui_cash_reward_continue}
			{pad_up ui_cash_reward_scroll params = {Dir = 1 max_height = <max_height>}}
			{pad_down ui_cash_reward_scroll params = {Dir = -1 max_height = <max_height>}}
		]
	}
	LaunchEvent Type = focus target = <menu>
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100}
endscript

script ui_cash_reward_add_item 
	<label> = ($cash_milestones.<milestone>.text)
	formatText TextName = reward qs(0x447de8d3) d = <cash>
	CreateScreenElement {
		parent = <menu>
		Type = descinterface
		desc = 'cash_reward2_row'
		label_text = <label>
		reward_text = <reward>
		dims = (0.0, 85.0)
		auto_dims = FALSE
	}
endscript

script ui_cash_reward_scroll \{Dir = 1}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	se_getprops
	<new_pos> = ((0.0, 100.0) * <Dir> + <Pos>)
	if (<new_pos> [1] > 0)
		<new_pos> = (0.0, 0.0)
	elseif (<new_pos> [1] > <max_height>)
		<new_pos> = ((0.0, -1.0) * <max_height>)
	endif
	se_setprops Pos = <new_pos> motion = smooth time = 0.25
	se_waitprops
endscript
