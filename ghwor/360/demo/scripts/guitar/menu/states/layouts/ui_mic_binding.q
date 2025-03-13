mic_binding_status_windows = [
	alias_status_1
	alias_status_2
	alias_status_3
	alias_status_4
]
mic_binding_text = {
	choose_controller_title = qs(0x74acfbac)
	choose_controller = qs(0x74f5e6e0)
	choose_controller_guest = qs(0x5ca0998b)
	choose_controller_ps3 = qs(0xfb5f65f0)
	bind_mic = qs(0xc330f74f)
	sing_title = qs(0x5f81a86f)
	sing = qs(0x8804a0cf)
	chosen_headset = qs(0xe15f3ac4)
	chosen_mic = qs(0x90c220f8)
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
	no_valid_mics = qs(0x2fd9323b)
	no_valid_mics_text = qs(0x7032d244)
}
mic_binding_mic0 = -1
mic_binding_mic1 = -1
mic_binding_mic2 = -1
mic_binding_mic3 = -1
mic_binding_noise_gate = 0.02
mic_binding_curr_player = 0
mic_binding_chosen_mic_type = none

script ui_create_mic_binding \{from_pause_menu = 0}
	change \{mic_binding_mic0 = -1}
	change \{mic_binding_mic1 = -1}
	change \{mic_binding_mic2 = -1}
	change \{mic_binding_mic3 = -1}
	<root_id> = hud_mic_binding
	createscreenelement \{type = descinterface
		desc = 'mic_binding'
		id = hud_mic_binding
		parent = root_window
		pos = (0.0, 0.0)
		z_priority = 200}
	if hud_mic_binding :desc_resolvealias \{name = alias_mic_menu
			param = mic_menu_id}
		<mic_menu_id> :se_setprops {
			event_handlers = [
				{menu_selection_changed ui_sfx params = {menustate = generic uitype = scrollup}}
			]
		}
	endif
	if gotparam \{controller}
		hud_mic_binding :se_setprops exclusive_device = <controller>
	endif
	<root_id> :se_setprops {
		event_handlers = [
			{pad_back mic_binding_end}
		]
	}
	mic_binding_update_button_helpers
	vocals_deinit_all_mics
	mic_binding_setup_all_status_windows
	vocals_distribute_mics
	mic_binding_initialize_mics
	spawnscriptnow \{mic_binding_update_mic_icons
		id = mic_binding}
	launchevent \{type = focus
		target = hud_mic_binding}
	hud_mic_binding :obj_spawnscriptnow \{mic_binding_start_flow}
endscript

script mic_binding_initialize_mics 
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
	if playerinfoequals <player> is_local_client = 1
		if playerinfoequals <player> part = vocals
			getplayerinfo <player> mic_type
			getplayerinfo <player> controller
			if NOT (<mic_type> = headset || <mic_type> = none)
				mic_binding_init_mic controller = <controller> mic_type = <mic_type> noise_gate = ($mic_binding_noise_gate)
				mics_activated = (<mics_activated> + 1)
			endif
		endif
	endif
	getnextplayer on_screen player = <player>
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
endscript

script mic_binding_error_no_mics 
	return
	if NOT isps3
		return
	endif
	hud_mic_binding :se_setprops {
		main_title_text = ($mic_binding_text.error)
		main_text = ($mic_binding_text.error_no_mics_ps3)
	}
	mic_binding_setup_menu \{player = -1}
	mic_binding_add_menu_element text = ($mic_binding_text.ok) choose_script = mic_binding_end choose_params = {player = <player> play_sound = 0}
	if hud_mic_binding :desc_resolvealias \{name = alias_mic_menu
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
	if playerinfoequals <player> is_local_client = 1
		if playerinfoequals <player> controller = <controller>
			if playerinfoequals <player> mic_type = headset
				return \{true}
			endif
			break
		endif
	endif
	getnextplayer on_screen player = <player>
	repeat <num_players_shown>
	index = 0
	begin
	mic_global = (<mic_globals> [<index>])
	if ($<mic_global> = <controller>)
		return \{true}
	endif
	index = (<index> + 1)
	repeat 4
	return \{false}
endscript

script mic_binding_update_mic_icons 
	getnumplayersingame \{on_screen}
	begin
	getfirstplayer \{on_screen}
	begin
	if (<player> = -1)
		break
	endif
	if playerinfoequals <player> is_local_client = 1
		if playerinfoequals <player> part = vocals
			getplayerinfo <player> controller
			vocals_getmicamplitude controller = <controller>
			mic_binding_get_status_id player = <player>
			if (<amplitude> > 0.05)
				<status_id> :se_setprops mic_rgba = [255 0 0 255]
			else
				<status_id> :se_setprops mic_rgba = [255 255 255 255]
			endif
		endif
	endif
	getnextplayer on_screen player = <player>
	repeat <num_players_shown>
	wait \{1
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
	destroyscreenelement \{id = hud_mic_binding}
	killspawnedscript \{id = mic_binding}
	killspawnedscript \{id = amp_check}
endscript

script mic_binding_setup_all_status_windows 
	status_index = 1
	begin
	mic_binding_disable_status_window player = <status_index>
	<status_index> = (<status_index> + 1)
	repeat 4
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	if playerinfoequals <player> is_local_client = 1
		getplayerinfo <player> part
		if (<part> = vocals)
			mic_binding_setup_status_window player = <player>
		endif
	endif
	getnextplayer on_screen player = <player>
	repeat <num_players_shown>
endscript

script mic_binding_get_status_id 
	player_index = (<player> -1)
	hud_mic_binding :desc_resolvealias name = ($mic_binding_status_windows [<player_index>]) param = status_id
	return status_id = <status_id>
endscript

script mic_binding_animate_status 
	begin
	se_setprops \{alpha = 0.35000002
		scale = 1
		time = 0.5}
	wait \{0.5
		seconds}
	se_setprops \{alpha = 1
		scale = 1.01
		time = 0.5}
	wait \{0.5
		seconds}
	repeat
endscript

script mic_binding_setup_status_window 
	mic_binding_get_status_id player = <player>
	getplayerinfo <player> mic_preference
	if (<mic_preference> = headset)
		headset_alpha = 1
		mic_alpha = 0
	elseif (<mic_preference> = none || <mic_preference> = invalid)
		headset_alpha = 0
		mic_alpha = 0
	else
		headset_alpha = 0
		getplayerinfo <player> mic_type
		if NOT (<mic_type> = none)
			mic_alpha = 1
		endif
	endif
	if ($mic_binding_curr_player = <player>)
		highlight_alpha = 1
		new_status_text = ($mic_binding_text.binding)
	else
		highlight_alpha = 0
		new_status_text = ($mic_binding_text.waiting)
	endif
	if gotparam \{status_text}
		new_status_text = <status_text>
	endif
	getplayerinfo <player> controller
	get_controller_or_gamertag_text_name controller = <controller>
	playername_text = <controller_text>
	<status_id> :se_setprops {
		alpha = 1.0
		player_text = <playername_text>
		tags = {state = in}
		exclusive_device = <controller>
		headset_alpha = <headset_alpha>
		mic_alpha = <mic_alpha>
		status_text = <new_status_text>
		event_handlers = [
			{pad_back mic_binding_end params = {player = <player>}}
		]
	}
	<status_id> :desc_resolvealias name = alias_focus_highlight param = highlight_id
	<highlight_id> :obj_killspawnedscript id = animate_status
	<highlight_id> :se_setprops {
		alpha = <highlight_alpha>
	}
	if (<highlight_alpha> = 1.0)
		<highlight_id> :obj_spawnscript mic_binding_animate_status id = animate_status
	endif
	launchevent type = focus target = <status_id>
endscript

script mic_binding_disable_status_window 
	mic_binding_get_status_id player = <player>
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
	mic_binding_get_status_id player = <player>
	<status_id> :se_setprops {
		alpha = 1.0
		tags = {state = in}
		replace_handlers
		event_handlers = [
			{pad_back mic_binding_drop_out params = {player = <player>}}
		]
	}
endscript

script mic_binding_drop_out 
	ui_sfx \{menustate = generic
		uitype = back}
	mic_binding_get_status_id player = <player>
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
	hud_mic_binding :desc_resolvealias \{name = alias_mic_menu
		param = mic_menu_id}
	if isps3
		icon = mixer_icon_vox
	endif
	if gotparam \{not_focusable}
		createscreenelement {
			type = descinterface
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
				{pad_choose ui_sfx params = {menustate = generic uitype = select}}
				{focus mic_binding_focus}
				{unfocus mic_binding_unfocus}
			]
		}
	else
		createscreenelement {
			type = descinterface
			desc = 'mic_binding_selection'
			parent = <mic_menu_id>
			text_text = <text>
			icon_texture = <icon>
			icon_alpha = <icon_alpha>
			autosizedims = true
			event_handlers = [
				{pad_choose <choose_script> params = <choose_params>}
				{pad_choose ui_sfx params = {menustate = generic uitype = select}}
				{focus mic_binding_focus}
				{unfocus mic_binding_unfocus}
			]
		}
	endif
	<id> :mic_binding_unfocus
	if gotparam \{spawn_headset_watcher}
		<id> :obj_spawnscript mic_binding_headset_watcher id = headset_watcher params = {player = <player>}
	endif
endscript

script mic_binding_headset_watcher 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> controller
	hud_mic_binding :desc_resolvealias \{name = alias_mic_menu
		param = mic_menu_id}
	begin
	if controller_has_headset controller = <controller>
		se_setprops \{focusable
			alpha = 1.0}
	else
		<should_return> = 0
		if checkforsignin controller_index = <controller> network_platform_only dont_set_primary
			if isxenonorwindx
				if netsessionfunc func = xenonisguest params = {controller_index = <controller>}
					hud_mic_binding :se_setprops {
						main_text = ($mic_binding_text.choose_controller_guest)
					}
					<should_return> = 1
				endif
			endif
		endif
		se_setprops \{not_focusable
			alpha = 0.3}
		launchevent type = unfocus target = <mic_menu_id>
		launchevent type = focus target = <mic_menu_id> data = {child_index = 0}
		if (<should_return> = 1)
			return
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script mic_binding_start_flow 
	player = 1
	begin
	mic_binding_get_status_id player = <player>
	<status_id> :getsingletag state
	if gotparam \{state}
		if (<state> = in)
			mic_binding_player_flow player = <player>
			return
		endif
	endif
	removeparameter \{state}
	player = (<player> + 1)
	repeat 4
endscript

script mic_binding_player_flow 
	change mic_binding_curr_player = <player>
	mic_binding_setup_all_status_windows
	if isps3
		hud_mic_binding :se_setprops {
			main_title_text = ($mic_binding_text.choose_controller_title)
			main_text = ($mic_binding_text.choose_controller_ps3)
		}
		mic_binding_setup_menu player = <player>
		mic_binding_add_menu_element text = ($mic_binding_text.bind_mic) icon = mixer_icon_vox icon_alpha = 1 choose_script = mic_binding_set_mic_type choose_params = {player = <player> new_mic_type = mic}
		if hud_mic_binding :desc_resolvealias \{name = alias_mic_menu
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
		mic_binding_setup_menu player = <player>
		getplayerinfo <player> controller
		if controller_has_headset controller = <controller>
			not_focusable = 1
		endif
		mic_binding_add_menu_element text = ($mic_binding_text.mic) icon = mixer_icon_vox icon_alpha = 1 choose_script = mic_binding_set_mic_type choose_params = {player = <player> new_mic_type = mic}
		mic_binding_add_menu_element spawn_headset_watcher player = <player> not_focusable = <not_focusable> text = ($mic_binding_text.headset) icon = logo_headset icon_alpha = 1 choose_script = mic_binding_set_mic_type choose_params = {player = <player> new_mic_type = headset}
	endif
	hud_mic_binding :desc_resolvealias \{name = alias_mic_menu
		param = mic_menu_id}
	getplayerinfo <player> controller
	<mic_menu_id> :se_setprops {
		exclusive_device = <controller>
	}
	launchevent type = focus target = <mic_menu_id> data = {child_index = 0}
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
	requireparams \{[
			player
		]
		all}
	if screenelementexists \{id = hud_mic_binding}
		if NOT hud_mic_binding :desc_resolvealias \{name = alias_mic_menu
				param = mic_menu_id}
			scriptassert \{'couldnt find mic menu id'}
		endif
		launchevent type = unfocus target = <mic_menu_id>
		wait \{0.1
			seconds}
		destroyscreenelement id = <mic_menu_id> preserve_parent
		if NOT (<player> = -1)
			getplayerinfo <player> controller
			<mic_menu_id> :se_setprops {
				exclusive_device = <controller>
			}
		endif
		launchevent type = focus target = <mic_menu_id>
	endif
endscript

script mic_binding_add_sfx_handlers 
	se_setprops \{event_handlers = [
			{
				pad_up
				ui_sfx
				params = {
					menustate = generic
					uitype = scrollup
				}
			}
			{
				pad_down
				ui_sfx
				params = {
					menustate = generic
					uitype = scrollup
				}
			}
		]
		replace_handlers}
endscript

script mic_binding_remove_sfx_handlers 
	se_setprops \{event_handlers = [
			{
				pad_up
				nullscript
			}
			{
				pad_down
				nullscript
			}
		]
		replace_handlers}
endscript

script mic_binding_set_mic_type 
	killspawnedscript \{id = headset_watcher}
	wait \{1
		gameframe}
	mic_binding_setup_menu player = <player>
	getplayerinfo <player> controller
	getplayerinfo <player> mic_type
	if (<new_mic_type> = mic)
		band_lobby_set_mic_preference player = <player> mic_preference = mic
		vocals_deinit_all_mics
		vocals_distribute_mics
		vocals_getavailablemics
		mic_binding_initialize_mics
		getplayerinfo <player> mic_type
		<icon> = mixer_icon_vox
		if (<mic_type> = headset)
			setplayerinfo <player> mic_type = none
			if NOT isps3
				<icon> = logo_headset
			endif
		endif
		mic_binding_setup_status_window player = <player>
		if (<available_mics> > 1)
			hud_mic_binding :se_setprops {
				main_title_text = ($mic_binding_text.sing_title)
				main_text = ($mic_binding_text.sing)
			}
			mic_binding_add_menu_element text = ($mic_binding_text.done) icon = <icon> choose_script = mic_binding_player_flow_confirm choose_params = {player = <player>}
			spawnscriptnow mic_binding_bind_mic id = mic_binding params = {player = <player>}
		elseif (<available_mics> = 1)
			hud_mic_binding :se_setprops {
				main_title_text = ($mic_binding_text.sing_title)
				main_text = ($mic_binding_text.chosen_mic)
			}
			mic_binding_add_menu_element text = ($mic_binding_text.done) icon = <icon> choose_script = mic_binding_player_flow_confirm choose_params = {player = <player>}
		else
			hud_mic_binding :se_setprops {
				main_title_text = ($mic_binding_text.no_valid_mics)
				main_text = ($mic_binding_text.no_valid_mics_text)
			}
			mic_binding_add_menu_element text = ($mic_binding_text.retry) icon = <icon> choose_script = mic_binding_player_flow choose_params = {player = <player>}
			mic_binding_add_menu_element text = ($mic_binding_text.continue) icon = <icon> choose_script = mic_binding_player_flow_next_player choose_params = {player = <player>}
		endif
	else
		band_lobby_set_mic_preference player = <player> mic_preference = headset
		hud_mic_binding :se_setprops {
			main_title_text = ($mic_binding_text.sing_title)
			main_text = ($mic_binding_text.chosen_headset)
		}
		setplayerinfo <player> mic_type = headset
		mic_binding_add_menu_element text = ($mic_binding_text.continue) choose_script = mic_binding_player_flow_confirm choose_params = {player = <player>}
	endif
	if hud_mic_binding :desc_resolvealias \{name = alias_mic_menu
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
		mic_binding_bind_mic_finished player = <player> controller = <controller> mic_type = (<mic_types> [<index>])
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script mic_binding_bind_mic 
	getplayerinfo <player> mic_type
	curr_player = <player>
	getnumplayersingame \{on_screen}
	mic_globals = [mic_binding_mic0 mic_binding_mic1 mic_binding_mic2 mic_binding_mic3]
	mic_types = [mic0 mic1 mic2 mic3]
	index = 0
	begin
	spawnscriptnow mic_binding_check_amplitude id = amp_check params = {index = <index> player = <curr_player>}
	index = (<index> + 1)
	repeat 4
	return
endscript

script mic_binding_bind_mic_finished 
	mic_globals = [mic_binding_mic0 mic_binding_mic1 mic_binding_mic2 mic_binding_mic3]
	mic_types = [mic0 mic1 mic2 mic3]
	controller_b = <controller>
	mic_type_b = <mic_type>
	getplayerinfo <player> controller
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
	if NOT gotparam \{mic_type_a}
		mic_type_a = none
	endif
	player_a = <player>
	player_b = -1
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	if playerinfoequals <player> is_local_client = 1
		if playerinfoequals <player> controller = <controller_b>
			player_b = <player>
			break
		endif
	endif
	getnextplayer on_screen player = <player>
	repeat <num_players_shown>
	if (<mic_type_b> = headset)
		setplayerinfo <player_a> mic_type = headset
	else
		mic_binding_deinit_mic controller = <controller_b> mic_type = <mic_type_b>
		if NOT (<mic_type_a> = headset || <mic_type_a> = none)
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
					setplayerinfo <player_b> mic_type = none
				endif
			endif
		endif
		mic_binding_init_mic controller = <controller_a> mic_type = <mic_type_b>
		setplayerinfo <player_a> mic_type = <mic_type_b>
	endif
	mic_binding_setup_all_status_windows
	mic_binding_player_flow_confirm player = <player_a>
endscript

script mic_binding_player_flow_confirm 
	mic_binding_setup_status_window player = <player> status_text = ($mic_binding_text.binding_complete)
	mic_binding_setup_menu player = <player>
	if playerinfoequals <player> mic_type = none
		hud_mic_binding :se_setprops {
			main_title_text = ($mic_binding_text.invalid_mic)
			main_text = ($mic_binding_text.invalid_mic_text)
		}
		mic_binding_add_menu_element text = ($mic_binding_text.retry) choose_script = mic_binding_player_flow choose_params = {player = <player>}
		mic_binding_add_menu_element text = ($mic_binding_text.continue) choose_script = mic_binding_player_flow_next_player choose_params = {player = <player>}
	else
		getplayerinfo <player> mic_preference
		if (<mic_preference> = mic)
			main_text = ($mic_binding_text.confirm_text_mic)
			<icon> = mixer_icon_vox
		elseif NOT isps3
			main_text = ($mic_binding_text.confirm_text_headset)
			<icon> = logo_headset
		else
			main_text = ($mic_binding_text.confirm_text_default)
			<icon> = mixer_icon_vox
		endif
		hud_mic_binding :se_setprops {
			main_title_text = ($mic_binding_text.confirm_title)
			main_text = <main_text>
		}
		mic_binding_add_menu_element text = ($mic_binding_text.yes) icon = <icon> choose_script = mic_binding_player_flow_next_player choose_params = {player = <player>}
		mic_binding_add_menu_element text = ($mic_binding_text.no) icon = <icon> choose_script = mic_binding_player_flow choose_params = {player = <player>}
		hud_mic_binding :desc_resolvealias \{name = alias_mic_menu
			param = mic_menu_id}
		getplayerinfo <player> controller
		<mic_menu_id> :se_setprops {
			exclusive_device = <controller>
		}
		launchevent type = focus target = <mic_menu_id> data = {child_index = 0}
	endif
	killspawnedscript \{id = amp_check}
endscript

script mic_binding_player_flow_next_player 
	killspawnedscript \{id = amp_check}
	begin
	getnextplayer on_screen player = <player>
	if (<player> = -1)
		mic_binding_end
		return
	endif
	if playerinfoequals <player> is_local_client = 1
		if playerinfoequals <player> part = vocals
			mic_binding_player_flow player = <player>
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
		softassert \{qs(0x9f887b0d)}
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
	change globalname = <mic_global> newvalue = <controller>
	vocals_initmic controller = <controller> mic_type = <mic_type> noise_gate = 0.02
	printf channel = vocals qs(0x9a024601) a = <mic_type> b = <controller>
endscript

script mic_binding_deinit_mic 
	if NOT (<mic_type> = headset || <mic_type> = none)
		mic_binding_get_mic_global mic_type = <mic_type>
		change globalname = <mic_global> newvalue = -1
		printf channel = vocals qs(0x95686418) a = <mic_type> b = <controller>
		vocals_deinitmic controller = <controller>
	endif
endscript

script mic_binding_reset_mic_globals 
	mic_globals = [mic_binding_mic0 mic_binding_mic1 mic_binding_mic2 mic_binding_mic3]
	index = 0
	begin
	mic_global = (<mic_globals> [<index>])
	change globalname = <mic_global> newvalue = -1
	index = (<index> + 1)
	repeat 4
endscript

script mic_binding_end \{play_sound = 1}
	if (<play_sound> = 1)
		ui_sfx \{menustate = generic
			uitype = back}
	endif
	if ui_event_exists_in_stack \{name = 'gameplay'}
		gamemode_gettype
		if (<type> = practice)
			ui_destroy_mic_binding
			practice_restart_song
		else
			if (<type> = quickplay)
				quickplay_unload_challenges
			endif
			change \{gameplay_restart_song = 1}
		endif
		create_loading_screen
		generic_event_back \{state = uistate_gameplay}
		return
	endif
	generic_event_back
endscript
