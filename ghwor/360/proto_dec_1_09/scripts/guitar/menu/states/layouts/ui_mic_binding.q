mic_binding_status_windows = [
	alias_status_1
	alias_status_2
	alias_status_3
	alias_status_4
]
mic_binding_text = {
	choose_controller_title = qs(0x74acfbac)
	choose_controller = qs(0x74f5e6e0)
	choose_controller_ps3 = qs(0xfb5f65f0)
	bind_mic = qs(0xc330f74f)
	sing_title = qs(0x5f81a86f)
	sing = qs(0x8804a0cf)
	chosen_headset = qs(0xe15f3ac4)
	confirm_title = qs(0xfcc1ea3b)
	confirm_text_headset = qs(0xf532d055)
	confirm_text_mic = qs(0xc601ef28)
	confirm_text_default = qs(0x3009ed04)
	mic = qs(0xc0b34c9f)
	headset = qs(0x089aeca5)
	yes = qs(0x58e0a1fb)
	no = qs(0xd2915c27)
	continue = qs(0x182f0173)
	done = qs(0x3fc1c076)
	ok = qs(0x0e41fe46)
	retry = qs(0x5d8b66a0)
	button_select = qs(0xc18d5e76)
	button_back = qs(0xaf4d5dd2)
	binding = qs(0x984a2e6d)
	waiting = qs(0x177b26f0)
	binding_complete = qs(0xe6ceea62)
	error = qs(0x79597197)
	error_no_mics_ps3 = qs(0x57bd9c45)
	invalid_mic = qs(0x23980f0d)
	invalid_mic_text = qs(0x1399d3f6)
}
mic_binding_mic0 = -1
mic_binding_mic1 = -1
mic_binding_mic2 = -1
mic_binding_mic3 = -1
mic_binding_noise_gate = 0.02
mic_binding_curr_player = 0
mic_binding_chosen_mic_type = None

script ui_create_mic_binding \{from_pause_menu = 0}
	Change \{mic_binding_mic0 = -1}
	Change \{mic_binding_mic1 = -1}
	Change \{mic_binding_mic2 = -1}
	Change \{mic_binding_mic3 = -1}
	<root_id> = hud_mic_binding
	CreateScreenElement \{Type = descinterface
		desc = 'mic_binding'
		id = hud_mic_binding
		parent = root_window
		Pos = (0.0, 0.0)
		z_priority = 100}
	<root_id> :se_setprops {
		event_handlers = [
			{pad_back mic_binding_end}
		]
	}
	mic_binding_update_button_helpers
	vocals_deinit_all_mics
	mic_binding_setup_all_status_windows
	vocals_distribute_mics
	vocals_getavailablemics
	getnumplayersingame \{on_screen}
	if isps3
		if (<available_mics> = 0)
			mic_binding_error_no_mics
			return
		endif
	endif
	mic_array = [mic0 mic1 mic2 mic3]
	mic_binding_reset_mic_globals
	mics_activated = 0
	mic_index = 0
	getfirstplayer \{on_screen}
	begin
	if playerinfoequals <Player> is_local_client = 1
		if playerinfoequals <Player> part = vocals
			getplayerinfo <Player> mic_type
			getplayerinfo <Player> controller
			if NOT (<mic_type> = headset || <mic_type> = None)
				mic_binding_init_mic controller = <controller> mic_type = <mic_type> noise_gate = ($mic_binding_noise_gate)
				mics_activated = (<mics_activated> + 1)
			endif
		endif
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
	if (<mics_activated> < <available_mics>)
		num_remaining = (<available_mics> - <mics_activated>)
		controller_index = 0
		begin
		if NOT mic_binding_controller_used controller = <controller_index>
			mic_binding_init_mic controller = <controller_index> mic_type = first_free_mic noise_gate = ($mic_binding_noise_gate)
			mics_activated = (<mics_activated> + 1)
			if (<mics_activated> = <available_mics>)
				break
			endif
		endif
		controller_index = (<controller_index> + 1)
		repeat 4
	endif
	SpawnScriptNow \{mic_binding_update_mic_icons
		id = mic_binding}
	LaunchEvent \{Type = focus
		target = hud_mic_binding}
	SpawnScriptNow \{mic_binding_start_flow}
endscript

script mic_binding_error_no_mics 
	if NOT isps3
		return
	endif
	hud_mic_binding :se_setprops {
		main_title_text = ($mic_binding_text.error)
		main_text = ($mic_binding_text.error_no_mics_ps3)
	}
	mic_binding_setup_menu \{Player = -1}
	mic_binding_add_menu_element text = ($mic_binding_text.ok) choose_script = mic_binding_end choose_params = {Player = <Player>}
	if hud_mic_binding :desc_resolvealias \{Name = alias_mic_menu
			param = mic_menu_id}
		<mic_menu_id> :se_setprops {
			event_handlers = [
				{pad_up nullscript}
				{pad_down nullscript}
			]
			replace_handlers
		}
	endif
endscript

script mic_binding_update_button_helpers 
	clean_up_user_control_helpers
	add_user_control_helper text = ($mic_binding_text.button_select) button = green z = 100000
	add_user_control_helper text = ($mic_binding_text.button_back) button = red z = 100000
endscript

script mic_binding_controller_used 
	mic_globals = [mic_binding_mic0 mic_binding_mic1 mic_binding_mic2 mic_binding_mic3]
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	if playerinfoequals <Player> is_local_client = 1
		if playerinfoequals <Player> controller = <controller>
			if playerinfoequals <Player> mic_type = headset
				return \{true}
			endif
			break
		endif
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
	index = 0
	begin
	mic_global = (<mic_globals> [<index>])
	if ($<mic_global> = <controller>)
		return \{true}
	endif
	index = (<index> + 1)
	repeat 4
	return \{FALSE}
endscript

script mic_binding_update_mic_icons 
	getnumplayersingame \{on_screen}
	begin
	getfirstplayer \{on_screen}
	begin
	if (<Player> = -1)
		break
	endif
	if playerinfoequals <Player> is_local_client = 1
		if playerinfoequals <Player> part = vocals
			getplayerinfo <Player> controller
			vocals_getmicamplitude controller = <controller>
			mic_binding_get_status_id Player = <Player>
			if (<amplitude> > 0.05)
				<status_id> :se_setprops mic_rgba = [255 0 0 255]
			else
				<status_id> :se_setprops mic_rgba = [255 255 255 255]
			endif
		endif
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
	Wait \{1
		gameframe}
	repeat
endscript

script ui_destroy_mic_binding 
	mic_globals = [mic_binding_mic0 mic_binding_mic1 mic_binding_mic2 mic_binding_mic3]
	mic_types = [mic0 mic1 mic2 mic3]
	index = 0
	begin
	mic_global = (<mic_globals> [<index>])
	if ($<mic_global> != -1)
		mic_binding_deinit_mic controller = ($<mic_global>) mic_type = (<mic_types> [<index>])
	endif
	index = (<index> + 1)
	repeat 4
	DestroyScreenElement \{id = hud_mic_binding}
	KillSpawnedScript \{id = mic_binding}
	KillSpawnedScript \{id = amp_check}
endscript

script mic_binding_create_button_helpers 
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script mic_binding_setup_all_status_windows 
	status_index = 1
	begin
	mic_binding_disable_status_window Player = <status_index>
	<status_index> = (<status_index> + 1)
	repeat 4
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	if playerinfoequals <Player> is_local_client = 1
		getplayerinfo <Player> part
		if (<part> = vocals)
			mic_binding_setup_status_window Player = <Player>
		endif
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
endscript

script mic_binding_get_status_id 
	player_index = (<Player> -1)
	hud_mic_binding :desc_resolvealias Name = ($mic_binding_status_windows [<player_index>]) param = status_id
	return status_id = <status_id>
endscript

script mic_binding_animate_status 
	begin
	se_setprops \{alpha = 0.35000002
		Scale = 1
		time = 0.5}
	Wait \{0.5
		Seconds}
	se_setprops \{alpha = 1
		Scale = 1.01
		time = 0.5}
	Wait \{0.5
		Seconds}
	repeat
endscript

script mic_binding_setup_status_window 
	mic_binding_get_status_id Player = <Player>
	getplayerinfo <Player> mic_preference
	if (<mic_preference> = headset)
		headset_alpha = 1
		mic_alpha = 0
	elseif (<mic_preference> = None || <mic_preference> = invalid)
		headset_alpha = 0
		mic_alpha = 0
	else
		headset_alpha = 0
		getplayerinfo <Player> mic_type
		if NOT (<mic_type> = None)
			mic_alpha = 1
		endif
	endif
	if ($mic_binding_curr_player = <Player>)
		highlight_alpha = 1
		new_status_text = ($mic_binding_text.binding)
	else
		highlight_alpha = 0
		new_status_text = ($mic_binding_text.waiting)
	endif
	if GotParam \{status_text}
		new_status_text = <status_text>
	endif
	get_fullname_for_player Player = <Player> no_character_name
	playername_text = <fullname>
	getplayerinfo <Player> controller
	<status_id> :se_setprops {
		alpha = 1.0
		player_text = <playername_text>
		tags = {state = in}
		exclusive_device = <controller>
		headset_alpha = <headset_alpha>
		mic_alpha = <mic_alpha>
		status_text = <new_status_text>
		event_handlers = [
			{pad_back mic_binding_end params = {Player = <Player>}}
		]
	}
	<status_id> :desc_resolvealias Name = alias_focus_highlight param = highlight_id
	<highlight_id> :Obj_KillSpawnedScript id = animate_status
	<highlight_id> :se_setprops {
		alpha = <highlight_alpha>
	}
	if (<highlight_alpha> = 1.0)
		<highlight_id> :obj_spawnscript mic_binding_animate_status id = animate_status
	endif
	LaunchEvent Type = focus target = <status_id>
endscript

script mic_binding_disable_status_window 
	mic_binding_get_status_id Player = <Player>
	<status_id> :se_setprops {
		alpha = 0.3
		player_text = qs(0x00000000)
		headset_alpha = 0
		mic_alpha = 0
		status_text = qs(0x00000000)
		replace_handlers
	}
endscript

script mic_binding_join_in 
	mic_binding_get_status_id Player = <Player>
	<status_id> :se_setprops {
		alpha = 1.0
		tags = {state = in}
		replace_handlers
		event_handlers = [
			{pad_back mic_binding_drop_out params = {Player = <Player>}}
		]
	}
endscript

script mic_binding_drop_out 
	ui_sfx \{menustate = Generic
		uitype = back}
	mic_binding_get_status_id Player = <Player>
	<status_id> :se_setprops {
		alpha = 0.5
		tags = {state = out}
		replace_handlers
		event_handlers = [
			{pad_back mic_binding_end}
		]
	}
endscript

script mic_binding_add_menu_element 
	hud_mic_binding :desc_resolvealias \{Name = alias_mic_menu
		param = mic_menu_id}
	if GotParam \{not_focusable}
		CreateScreenElement {
			Type = descinterface
			desc = 'mic_binding_selection'
			parent = <mic_menu_id>
			text_text = <text>
			icon_texture = <icon>
			icon_alpha = <icon_alpha>
			not_focusable
			alpha = 0.3
			autosizedims = true
			event_handlers = [
				{pad_choose <choose_script> params = <choose_params>}
				{pad_choose ui_sfx params = {menustate = Generic uitype = select}}
				{focus mic_binding_focus}
				{unfocus mic_binding_unfocus}
			]
		}
	else
		CreateScreenElement {
			Type = descinterface
			desc = 'mic_binding_selection'
			parent = <mic_menu_id>
			text_text = <text>
			icon_texture = <icon>
			icon_alpha = <icon_alpha>
			autosizedims = true
			event_handlers = [
				{pad_choose <choose_script> params = <choose_params>}
				{pad_choose ui_sfx params = {menustate = Generic uitype = select}}
				{focus mic_binding_focus}
				{unfocus mic_binding_unfocus}
			]
		}
	endif
	<id> :mic_binding_unfocus
	if GotParam \{spawn_headset_watcher}
		<id> :obj_spawnscript mic_binding_headset_watcher id = headset_watcher params = {Player = <Player>}
	endif
endscript

script mic_binding_headset_watcher 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> controller
	hud_mic_binding :desc_resolvealias \{Name = alias_mic_menu
		param = mic_menu_id}
	begin
	if controller_has_headset controller = <controller>
		se_setprops \{focusable
			alpha = 1.0}
	else
		se_setprops \{not_focusable
			alpha = 0.3}
		LaunchEvent Type = unfocus target = <mic_menu_id>
		LaunchEvent Type = focus target = <mic_menu_id> data = {child_index = 0}
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script mic_binding_start_flow 
	Player = 1
	begin
	mic_binding_get_status_id Player = <Player>
	<status_id> :GetSingleTag state
	if GotParam \{state}
		if (<state> = in)
			mic_binding_player_flow Player = <Player>
			return
		endif
	endif
	RemoveParameter \{state}
	Player = (<Player> + 1)
	repeat 4
endscript

script mic_binding_player_flow 
	Change mic_binding_curr_player = <Player>
	mic_binding_setup_all_status_windows
	if isps3
		hud_mic_binding :se_setprops {
			main_title_text = ($mic_binding_text.choose_controller_title)
			main_text = ($mic_binding_text.choose_controller_ps3)
		}
		mic_binding_setup_menu Player = <Player>
		mic_binding_add_menu_element text = ($mic_binding_text.bind_mic) icon = mixer_icon_vox icon_alpha = 1 choose_script = mic_binding_set_mic_type choose_params = {Player = <Player> new_mic_type = mic}
		if hud_mic_binding :desc_resolvealias \{Name = alias_mic_menu
				param = mic_menu_id}
			<mic_menu_id> :se_setprops {
				event_handlers = [
					{pad_up nullscript}
					{pad_down nullscript}
				]
				replace_handlers
			}
		endif
	else
		hud_mic_binding :se_setprops {
			main_title_text = ($mic_binding_text.choose_controller_title)
			main_text = ($mic_binding_text.choose_controller)
		}
		mic_binding_setup_menu Player = <Player>
		getplayerinfo <Player> controller
		if controller_has_headset controller = <controller>
			not_focusable = 1
		endif
		mic_binding_add_menu_element text = ($mic_binding_text.mic) icon = mixer_icon_vox icon_alpha = 1 choose_script = mic_binding_set_mic_type choose_params = {Player = <Player> new_mic_type = mic}
		mic_binding_add_menu_element spawn_headset_watcher Player = <Player> not_focusable = <not_focusable> text = ($mic_binding_text.headset) icon = logo_headset icon_alpha = 1 choose_script = mic_binding_set_mic_type choose_params = {Player = <Player> new_mic_type = headset}
	endif
	hud_mic_binding :desc_resolvealias \{Name = alias_mic_menu
		param = mic_menu_id}
	getplayerinfo <Player> controller
	<mic_menu_id> :se_setprops {
		exclusive_device = <controller>
	}
	LaunchEvent Type = focus target = <mic_menu_id> data = {child_index = 0}
endscript

script mic_binding_focus 
	se_setprops \{highlight_alpha = 1
		text_rgba = [
			249
			243
			190
			255
		]}
endscript

script mic_binding_unfocus 
	se_setprops \{highlight_alpha = 0
		text_rgba = [
			206
			196
			124
			255
		]}
endscript

script mic_binding_setup_menu 
	RequireParams \{[
			Player
		]
		all}
	hud_mic_binding :desc_resolvealias \{Name = alias_mic_menu
		param = mic_menu_id}
	LaunchEvent Type = unfocus target = <mic_menu_id>
	Wait \{0.1
		Seconds}
	DestroyScreenElement id = <mic_menu_id> preserve_parent
	if NOT (<Player> = -1)
		getplayerinfo <Player> controller
		<mic_menu_id> :se_setprops {
			exclusive_device = <controller>
			event_handlers = [
				{pad_up ui_sfx params = {menustate = Generic uitype = scrollup}}
				{pad_down ui_sfx params = {menustate = Generic uitype = scrolldown}}
			]
		}
	endif
	LaunchEvent Type = focus target = <mic_menu_id>
endscript

script mic_binding_set_mic_type 
	KillSpawnedScript \{id = headset_watcher}
	Wait \{1
		gameframe}
	mic_binding_setup_menu Player = <Player>
	getplayerinfo <Player> controller
	getplayerinfo <Player> mic_type
	if (<new_mic_type> = mic)
		band_lobby_set_mic_preference Player = <Player> mic_preference = mic
		if (<mic_type> = headset)
			setplayerinfo <Player> mic_type = None
			mic_binding_setup_status_window Player = <Player>
		endif
		hud_mic_binding :se_setprops {
			main_title_text = ($mic_binding_text.sing_title)
			main_text = ($mic_binding_text.sing)
		}
		mic_binding_add_menu_element text = ($mic_binding_text.done) choose_script = mic_binding_player_flow_confirm choose_params = {Player = <Player>}
		SpawnScriptNow mic_binding_bind_mic id = mic_binding params = {Player = <Player>}
	else
		band_lobby_set_mic_preference Player = <Player> mic_preference = headset
		hud_mic_binding :se_setprops {
			main_title_text = ($mic_binding_text.sing_title)
			main_text = ($mic_binding_text.chosen_headset)
		}
		setplayerinfo <Player> mic_type = headset
		mic_binding_add_menu_element text = ($mic_binding_text.continue) choose_script = mic_binding_player_flow_confirm choose_params = {Player = <Player>}
	endif
	if hud_mic_binding :desc_resolvealias \{Name = alias_mic_menu
			param = mic_menu_id}
		<mic_menu_id> :se_setprops {
			event_handlers = [
				{pad_up nullscript}
				{pad_down nullscript}
			]
			replace_handlers
		}
	endif
endscript

script mic_binding_check_amplitude 
	mic_globals = [mic_binding_mic0 mic_binding_mic1 mic_binding_mic2 mic_binding_mic3]
	mic_types = [mic0 mic1 mic2 mic3]
	count = 0
	begin
	mic_global = (<mic_globals> [<index>])
	controller = ($<mic_global>)
	if NOT (<controller> = -1)
		vocals_getmicamplitude controller = <controller>
		if (<amplitude> > 0.05)
			count = (<count> + 1)
		else
			count = 0
		endif
	else
		count = 0
	endif
	if (<count> > 30)
		mic_binding_bind_mic_finished Player = <Player> controller = <controller> mic_type = (<mic_types> [<index>])
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script mic_binding_bind_mic 
	getplayerinfo <Player> mic_type
	curr_player = <Player>
	getnumplayersingame \{on_screen}
	mic_globals = [mic_binding_mic0 mic_binding_mic1 mic_binding_mic2 mic_binding_mic3]
	mic_types = [mic0 mic1 mic2 mic3]
	index = 0
	begin
	SpawnScriptNow mic_binding_check_amplitude id = amp_check params = {index = <index> Player = <curr_player>}
	index = (<index> + 1)
	repeat 4
	return
endscript

script mic_binding_bind_mic_finished 
	mic_globals = [mic_binding_mic0 mic_binding_mic1 mic_binding_mic2 mic_binding_mic3]
	mic_types = [mic0 mic1 mic2 mic3]
	controller_b = <controller>
	mic_type_b = <mic_type>
	getplayerinfo <Player> controller
	controller_a = <controller>
	index = 0
	begin
	mic_global = (<mic_globals> [<index>])
	if ($<mic_global> = <controller>)
		mic_type_a = (<mic_types> [<index>])
		break
	endif
	index = (<index> + 1)
	repeat 4
	if NOT GotParam \{mic_type_a}
		mic_type_a = None
	endif
	player_a = <Player>
	player_b = -1
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	if playerinfoequals <Player> is_local_client = 1
		if playerinfoequals <Player> controller = <controller_b>
			player_b = <Player>
			break
		endif
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
	if (<mic_type_b> = headset)
		setplayerinfo <player_a> mic_type = headset
	else
		mic_binding_deinit_mic controller = <controller_b> mic_type = <mic_type_b>
		if NOT (<mic_type_a> = headset || <mic_type_a> = None)
			mic_binding_deinit_mic controller = <controller_a> mic_type = <mic_type_a>
			mic_binding_init_mic controller = <controller_b> mic_type = <mic_type_a>
			if NOT (<player_b> = -1)
				if NOT playerinfoequals <player_b> mic_type = headset
					setplayerinfo <player_b> mic_type = <mic_type_a>
				endif
			endif
		else
			if NOT (<player_b> = -1)
				if NOT playerinfoequals <player_b> mic_type = headset
					setplayerinfo <player_b> mic_type = None
				endif
			endif
		endif
		mic_binding_init_mic controller = <controller_a> mic_type = <mic_type_b>
		setplayerinfo <player_a> mic_type = <mic_type_b>
	endif
	mic_binding_setup_all_status_windows
	mic_binding_player_flow_confirm Player = <player_a>
endscript

script mic_binding_player_flow_confirm 
	mic_binding_setup_status_window Player = <Player> status_text = ($mic_binding_text.binding_complete)
	mic_binding_setup_menu Player = <Player>
	if playerinfoequals <Player> mic_type = None
		hud_mic_binding :se_setprops {
			main_title_text = ($mic_binding_text.invalid_mic)
			main_text = ($mic_binding_text.invalid_mic_text)
		}
		mic_binding_add_menu_element text = ($mic_binding_text.retry) choose_script = mic_binding_player_flow choose_params = {Player = <Player>}
		mic_binding_add_menu_element text = ($mic_binding_text.continue) choose_script = mic_binding_player_flow_next_player choose_params = {Player = <Player>}
	else
		getplayerinfo <Player> mic_preference
		if (<mic_preference> = mic)
			main_text = ($mic_binding_text.confirm_text_mic)
		elseif NOT isps3
			main_text = ($mic_binding_text.confirm_text_headset)
		else
			main_text = ($mic_binding_text.confirm_text_default)
		endif
		hud_mic_binding :se_setprops {
			main_title_text = ($mic_binding_text.confirm_title)
			main_text = <main_text>
		}
		mic_binding_add_menu_element text = ($mic_binding_text.yes) choose_script = mic_binding_player_flow_next_player choose_params = {Player = <Player>}
		mic_binding_add_menu_element text = ($mic_binding_text.no) choose_script = mic_binding_player_flow choose_params = {Player = <Player>}
		hud_mic_binding :desc_resolvealias \{Name = alias_mic_menu
			param = mic_menu_id}
		getplayerinfo <Player> controller
		<mic_menu_id> :se_setprops {
			exclusive_device = <controller>
		}
		LaunchEvent Type = focus target = <mic_menu_id> data = {child_index = 0}
	endif
	KillSpawnedScript \{id = amp_check}
endscript

script mic_binding_player_flow_next_player 
	KillSpawnedScript \{id = amp_check}
	begin
	getnextplayer on_screen Player = <Player>
	if (<Player> = -1)
		mic_binding_end
		return
	endif
	if playerinfoequals <Player> is_local_client = 1
		if playerinfoequals <Player> part = vocals
			mic_binding_player_flow Player = <Player>
			return
		endif
	endif
	repeat
endscript

script mic_binding_get_mic_global 
	switch <mic_type>
		case mic0
		mic_global = mic_binding_mic0
		case mic1
		mic_global = mic_binding_mic1
		case mic2
		mic_global = mic_binding_mic2
		case mic3
		mic_global = mic_binding_mic3
		default
		SoftAssert \{qs(0x9f887b0d)}
	endswitch
	return mic_global = <mic_global>
endscript

script mic_binding_init_mic 
	if (<mic_type> = first_free_mic)
		mic_array = [mic0 mic1 mic2 mic3]
		mic_globals = [mic_binding_mic0 mic_binding_mic1 mic_binding_mic2 mic_binding_mic3]
		index = 0
		begin
		mic_global = (<mic_globals> [<index>])
		if ($<mic_global> = -1)
			mic_type = (<mic_array> [<index>])
			break
		endif
		index = (<index> + 1)
		repeat 4
	endif
	mic_binding_get_mic_global mic_type = <mic_type>
	Change GlobalName = <mic_global> NewValue = <controller>
	vocals_initmic controller = <controller> mic_type = <mic_type> noise_gate = 0.02
	printf channel = vocals qs(0x9a024601) a = <mic_type> b = <controller>
endscript

script mic_binding_deinit_mic 
	if NOT (<mic_type> = headset || <mic_type> = None)
		mic_binding_get_mic_global mic_type = <mic_type>
		Change GlobalName = <mic_global> NewValue = -1
		printf channel = vocals qs(0x95686418) a = <mic_type> b = <controller>
		vocals_deinitmic controller = <controller>
	endif
endscript

script mic_binding_reset_mic_globals 
	mic_globals = [mic_binding_mic0 mic_binding_mic1 mic_binding_mic2 mic_binding_mic3]
	index = 0
	begin
	mic_global = (<mic_globals> [<index>])
	Change GlobalName = <mic_global> NewValue = -1
	index = (<index> + 1)
	repeat 4
endscript

script mic_binding_end 
	ui_sfx \{menustate = Generic
		uitype = back}
	if ui_event_exists_in_stack \{Name = 'gameplay'}
		gamemode_gettype
		if (<Type> = practice)
			ui_destroy_mic_binding
			practice_restart_song
		else
			Change \{gameplay_restart_song = 1}
		endif
		generic_event_back \{state = Uistate_gameplay}
		return
	endif
	generic_event_back
endscript
