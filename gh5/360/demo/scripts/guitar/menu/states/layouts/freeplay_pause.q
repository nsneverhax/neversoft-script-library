
script destroy_freeplay_instrument_menu 
	get_highway_hud_menu_parent player = <player>
	destroyscreenelement id = {<menu_parent> child = freeplay_menu}
endscript

script create_freeplay_instrument_menu 
	getplayerinfo <player> controller
	get_highway_hud_menu_parent player = <player>
	createscreenelement {
		parent = <menu_parent>
		type = descinterface
		local_id = freeplay_menu
		desc = 'freeplay_highway_menu'
		pos = (0.0, 0.0)
		autosizedims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
	}
	instrument_menu_id = <id>
	<instrument_menu_id> :se_setprops alpha = 1 time = 0.3
	<instrument_menu_id> :desc_resolvealias name = alias_menu param = menu_id
	<menu_id> :se_setprops {
		event_handlers = [
			{menu_selection_changed ui_sfx_freeplay params = {type = up player = <player>}}
		]
	}
	instrument_menu_entries = [
		{instrument = guitar text = qs(0x11355666)}
		{instrument = bass text = qs(0x4f551cbe)}
	]
	menu_width = 0
	idx = 0
	getarraysize \{instrument_menu_entries}
	begin
	freeplay_create_highway_element {
		parent = <menu_id>
		text = (<instrument_menu_entries> [<idx>].text)
	}
	if (<menu_width> < <element_width>)
		menu_width = <element_width>
	endif
	<id> :se_setprops {
		event_handlers = [
			{focus freeplay_focus_menu_element}
			{unfocus freeplay_unfocus_menu_element}
			{pad_back freeplay_instrument_menu_back params = {player = <player>}}
			{pad_choose ui_sfx_freeplay params = {type = instrument player = <player>}}
			{pad_choose freeplay_instrument_jump_player_in params = {instrument = (<instrument_menu_entries> [<idx>].instrument) player = <player>}}
		]
	}
	<id> :freeplay_unfocus_menu_element time = 0
	idx = (<idx> + 1)
	repeat <array_size>
	freeplay_set_menu_background_dims menu_parent = <menu_parent> menu_width = <menu_width>
	freeplay_set_menu_highlight_dims menu_id = <menu_id> menu_width = <menu_width> num_elements = <array_size>
	launchevent type = focus target = <menu_id>
endscript

script freeplay_instrument_menu_back 
	destroy_freeplay_instrument_menu player = <player>
	ui_sfx_freeplay type = drop player = <player>
	freeplay_drop_player_out player = <player>
endscript

script destroy_freeplay_difficulty_menu 
	get_highway_hud_menu_parent player = <player>
	destroyscreenelement id = {<menu_parent> child = freeplay_menu}
endscript

script create_freeplay_difficulty_menu 
	getplayerinfo <player> controller
	getplayerinfo <player> difficulty
	getplayerinfo <player> part
	if (<difficulty> = expert)
		if (<part> = drum)
			getplayerinfo <player> double_kick_drum
			if (<double_kick_drum> = 1)
				difficulty = expert_plus
			endif
		endif
	endif
	get_highway_hud_menu_parent player = <player>
	createscreenelement {
		parent = <menu_parent>
		type = descinterface
		local_id = freeplay_menu
		desc = 'freeplay_highway_menu'
		pos = (0.0, 0.0)
		autosizedims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
	}
	difficulty_menu_id = <id>
	<difficulty_menu_id> :se_setprops alpha = 1 time = 0.3
	<difficulty_menu_id> :desc_resolvealias name = alias_menu param = menu_id
	<menu_id> :se_setprops {
		event_handlers = [
			{menu_selection_changed ui_sfx_freeplay params = {type = up player = <player>}}
		]
	}
	difficulty_menu_entries = [
		{difficulty = beginner text = qs(0x25b2ecac)}
		{difficulty = easy text = qs(0xbf7ffd2d)}
		{difficulty = medium text = qs(0xeac0f52d)}
		{difficulty = hard text = qs(0x63aae385)}
		{difficulty = expert text = qs(0xb778e780)}
	]
	if NOT demobuild
		if (<part> = drum)
			addarrayelement \{array = [
				]
				element = {
					difficulty = expert_plus
					text = qs(0x739da581)
				}}
			difficulty_menu_entries = <array>
		endif
	endif
	menu_width = 0
	idx = 0
	getarraysize \{difficulty_menu_entries}
	begin
	if (<difficulty> = <difficulty_menu_entries> [<idx>].difficulty)
		getarraysize \{difficulty_menu_entries}
		player_difficulty_idx = <idx>
	endif
	freeplay_create_highway_element {
		parent = <menu_id>
		text = (<difficulty_menu_entries> [<idx>].text)
	}
	if (<menu_width> < <element_width>)
		menu_width = <element_width>
	endif
	<id> :se_setprops {
		event_handlers = [
			{focus freeplay_focus_menu_element}
			{unfocus freeplay_unfocus_menu_element}
			{pad_back freeplay_difficulty_menu_back params = {player = <player> back_target = <back_target>}}
			{pad_choose ui_sfx_freeplay params = {type = select player = <player>}}
			{pad_choose freeplay_finish_jump_player_in params = {difficulty = (<difficulty_menu_entries> [<idx>].difficulty) player = <player>}}
		]
	}
	<id> :freeplay_unfocus_menu_element time = 0
	idx = (<idx> + 1)
	repeat <array_size>
	if NOT gotparam \{player_difficulty_idx}
		scriptassert \{qs(0xac85b027)}
	endif
	freeplay_set_menu_background_dims menu_parent = <menu_parent> menu_width = <menu_width>
	freeplay_set_menu_highlight_dims menu_id = <menu_id> menu_width = <menu_width> num_elements = <array_size>
	launchevent type = focus target = <menu_id> data = {child_index = <player_difficulty_idx>}
endscript

script freeplay_difficulty_menu_back 
	destroy_freeplay_difficulty_menu player = <player>
	switch <back_target>
		case dropped
		ui_sfx_freeplay type = drop player = <player>
		freeplay_drop_player_out player = <player>
		case pause_menu
		ui_sfx_freeplay type = back player = <player>
		create_freeplay_pause_menu player = <player>
		case instrument
		ui_sfx_freeplay type = back player = <player>
		create_freeplay_instrument_menu player = <player>
		case mic
		ui_sfx_freeplay type = back player = <player>
		if demobuild
			freeplay_drop_player_out player = <player>
		else
			create_freeplay_mic_preference_menu player = <player>
		endif
	endswitch
endscript

script destroy_freeplay_mic_preference_menu 
	get_highway_hud_menu_parent player = <player>
	destroyscreenelement id = {<menu_parent> child = freeplay_menu}
endscript

script create_freeplay_mic_preference_menu 
	getplayerinfo <player> controller
	setplayerinfo <player> mic_type = none
	vocals_deinitmic controller = <controller>
	headset_unavailable = true
	if freeplay_is_headset_allowed_for_vocals
		if controller_has_headset controller = <controller>
			headset_unavailable = false
		endif
	endif
	mic_unavailable = true
	if freeplay_is_any_mic_free
		mic_unavailable = false
	endif
	if (<headset_unavailable> = true && <mic_unavailable> = true)
		create_freeplay_connect_mic_menu player = <player>
		return
	endif
	if NOT freeplay_is_headset_allowed_for_vocals
		freeplay_mic_preference_jump_player_in player = <player> device_num = <controller> mic_preference = mic
		return
	endif
	getplayerinfo <player> mic_preference out = focus_mic_preference
	if (<headset_unavailable> = true)
		focus_mic_preference = mic
	elseif (<mic_unavailable> = true)
		focus_mic_preference = headset
	endif
	get_highway_hud_menu_parent player = <player>
	createscreenelement {
		parent = <menu_parent>
		type = descinterface
		local_id = freeplay_menu
		desc = 'freeplay_highway_menu'
		pos = (0.0, 0.0)
		autosizedims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
	}
	mic_preference_menu_id = <id>
	<mic_preference_menu_id> :se_setprops alpha = 1 time = 0.3
	<mic_preference_menu_id> :desc_resolvealias name = alias_menu param = menu_id
	<menu_id> :se_setprops {
		event_handlers = [
			{menu_selection_changed ui_sfx_freeplay params = {type = up player = <player>}}
		]
	}
	mic_preference_menu_entries = [
		{mic_preference = mic text = qs(0xf505c703)}
		{mic_preference = headset text = qs(0x949ad871)}
	]
	menu_width = 0
	idx = 0
	getarraysize \{mic_preference_menu_entries}
	begin
	this_mic_preference = (<mic_preference_menu_entries> [<idx>].mic_preference)
	if (<focus_mic_preference> = <this_mic_preference>)
		getarraysize \{mic_preference_menu_entries}
		player_mic_preference_idx = <idx>
	endif
	freeplay_create_highway_element {
		parent = <menu_id>
		text = (<mic_preference_menu_entries> [<idx>].text)
	}
	if (<menu_width> < <element_width>)
		menu_width = <element_width>
	endif
	<id> :se_setprops {
		event_handlers = [
			{focus freeplay_focus_mic_preference_menu_element params = {mic_preference = <this_mic_preference> controller = <controller> player = <player>}}
			{unfocus freeplay_unfocus_mic_preference_menu_element params = {mic_preference = <this_mic_preference> controller = <controller>}}
			{pad_back freeplay_mic_preference_menu_back params = {player = <player>}}
			{pad_choose ui_sfx_freeplay params = {type = instrument player = <player>}}
			{pad_choose freeplay_mic_preference_jump_player_in params = {mic_preference = <this_mic_preference> player = <player>}}
		]
	}
	<id> :freeplay_unfocus_menu_element time = 0
	<id> :obj_spawnscript freeplay_mic_preference_menu_update_element_state params = {mic_preference = <this_mic_preference> controller = <controller> player = <player>}
	idx = (<idx> + 1)
	repeat <array_size>
	freeplay_set_menu_background_dims menu_parent = <menu_parent> menu_width = <menu_width>
	freeplay_set_menu_highlight_dims menu_id = <menu_id> menu_width = <menu_width> num_elements = <array_size>
	launchevent type = focus target = <menu_id> data = {child_index = <player_mic_preference_idx>}
	<menu_id> :obj_spawnscript freeplay_mic_preference_menu_update_state params = {player = <player>}
	if demobuild
		<menu_id> :obj_spawnscript freeplay_mic_preference_jump_player_in params = {mic_preference = mic player = <player> device_num = <controller>}
	endif
endscript

script freeplay_determine_mic_preference_grayed_out_state 
	requireparams \{[
			mic_preference
			controller
		]
		all}
	switch <mic_preference>
		case mic
		if freeplay_is_any_mic_free
			return \{grayed_out = false}
		else
			return \{grayed_out = true}
		endif
		case headset
		if controller_has_headset controller = <controller>
			return \{grayed_out = false}
		else
			return \{grayed_out = true}
		endif
	endswitch
endscript

script freeplay_focus_mic_preference_menu_element 
	requireparams \{[
			mic_preference
			controller
		]
		all}
	freeplay_determine_mic_preference_grayed_out_state mic_preference = <mic_preference> controller = <controller>
	freeplay_focus_menu_element grayed_out = <grayed_out>
endscript

script freeplay_unfocus_mic_preference_menu_element 
	requireparams \{[
			mic_preference
			controller
		]
		all}
	freeplay_determine_mic_preference_grayed_out_state mic_preference = <mic_preference> controller = <controller>
	freeplay_unfocus_menu_element grayed_out = <grayed_out>
endscript

script freeplay_mic_preference_menu_update_element_state 
	requireparams \{[
			mic_preference
			controller
		]
		all}
	obj_getid
	begin
	freeplay_determine_mic_preference_grayed_out_state mic_preference = <mic_preference> controller = <controller>
	if isscreenelementinfocus id = <objid>
		freeplay_focus_menu_element grayed_out = <grayed_out>
	else
		freeplay_unfocus_menu_element grayed_out = <grayed_out>
	endif
	wait \{0.5
		seconds}
	repeat
endscript

script freeplay_mic_preference_menu_update_state 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> controller
	begin
	wait \{0.5
		seconds}
	if NOT freeplay_is_any_mic_free
		if NOT controller_has_headset controller = <controller>
			spawnscriptnow freeplay_drop_player_out params = {player = <player>}
			return
		endif
	endif
	repeat
endscript

script freeplay_mic_preference_menu_back 
	ui_sfx_freeplay player = <player> type = drop
	destroy_freeplay_mic_preference_menu player = <player>
	freeplay_drop_player_out player = <player>
endscript

script destroy_freeplay_connect_mic_menu 
	get_highway_hud_menu_parent player = <player>
	destroyscreenelement id = {<menu_parent> child = freeplay_menu}
endscript

script create_freeplay_connect_mic_menu 
	getplayerinfo <player> controller
	if freeplay_is_headset_allowed_for_vocals
		message_text = qs(0x057800ff)
	else
		message_text = qs(0x663f51cd)
	endif
	get_highway_hud_menu_parent player = <player>
	createscreenelement {
		parent = <menu_parent>
		type = descinterface
		local_id = freeplay_menu
		desc = 'freeplay_highway_menu'
		pos = (0.0, 0.0)
		autosizedims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
		message_text = <message_text>
	}
	connect_mic_menu_id = <id>
	<connect_mic_menu_id> :se_setprops alpha = 1 time = 0.3
	<connect_mic_menu_id> :desc_resolvealias name = alias_menu param = message_id
	resolvescreenelementid id = {<menu_parent> child = freeplay_menu_background}
	<resolved_id> :se_setprops light_box_dims = (300.0, 320.0)
	<message_id> :se_setprops {
		event_handlers = [
			{event_mic_connected freeplay_connect_mic_menu_mic_connected params = {player = <player>}}
			{pad_back freeplay_connect_mic_menu_back params = {player = <player>}}
		]
	}
	launchevent type = focus target = <message_id>
	<message_id> :obj_spawnscript freeplay_connect_mic_menu_update_state params = {player = <player>}
endscript

script freeplay_connect_mic_menu_update_state 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> controller
	obj_getid
	onexitrun \{freeplay_connect_mic_menu_update_state_exit}
	requestmicdetection \{enable = true}
	begin
	begin
	wait \{0.5
		seconds}
	if freeplay_is_any_mic_free
		break
	endif
	if controller_has_headset controller = <controller>
		break
	endif
	repeat
	launchevent type = event_mic_connected target = <objid>
	repeat
endscript

script freeplay_connect_mic_menu_update_state_exit 
	requestmicdetection \{enable = false}
endscript

script freeplay_connect_mic_menu_mic_connected 
	se_getprops
	if (<events_blocked> = 1)
		return
	endif
	destroy_freeplay_connect_mic_menu player = <player>
	create_freeplay_mic_preference_menu player = <player>
endscript

script freeplay_connect_mic_menu_back 
	destroy_freeplay_connect_mic_menu player = <player>
	ui_sfx_freeplay type = drop player = <player>
	freeplay_drop_player_out player = <player>
endscript

script freeplay_destroy_all_possible_menus 
	requireparams \{[
			player
		]
		all}
	destroy_freeplay_instrument_menu player = <player>
	destroy_freeplay_difficulty_menu player = <player>
	destroy_freeplay_mic_preference_menu player = <player>
	destroy_freeplay_connect_mic_menu player = <player>
	destroy_freeplay_menu player = <player>
endscript

script destroy_freeplay_menu 
	get_highway_hud_menu_parent player = <player>
	destroyscreenelement id = {<menu_parent> child = freeplay_menu}
endscript

script create_freeplay_menu 
	requireparams \{[
			menu_state
			player
		]
		all}
	getplayerinfo <player> controller
	menu_entries = ($freeplay_menu_states.<menu_state>.entries)
	entry_focus_scr = ($freeplay_menu_states.<menu_state>.entry_focus_scr)
	if gotparam \{entry_focus_scr}
		<entry_focus_scr> player = <player>
		menu_focus_idx = <focus_idx>
	endif
	get_highway_hud_menu_parent player = <player>
	createscreenelement {
		parent = <menu_parent>
		type = descinterface
		local_id = freeplay_menu
		desc = 'freeplay_highway_menu'
		pos = (0.0, 0.0)
		autosizedims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
	}
	desc_id = <id>
	<desc_id> :se_setprops alpha = 1 time = 0.3
	<desc_id> :desc_resolvealias name = alias_menu param = menu_id
	<menu_id> :se_setprops {
		event_handlers = [
			{menu_selection_changed ui_sfx_freeplay params = {type = up player = <player>}}
		]
	}
	menu_width = 0
	idx = 0
	focus_idx = 0
	getarraysize \{menu_entries}
	begin
	include_entry = true
	if structurecontains structure = (<menu_entries> [<idx>]) condition_scr
		if NOT (<menu_entries> [<idx>].condition_scr) player = <player>
			include_entry = false
		endif
	endif
	if (<include_entry> = true)
		freeplay_create_highway_element {
			parent = <menu_id>
			text = (<menu_entries> [<idx>].text)
		}
		if (<menu_width> < <element_width>)
			menu_width = <element_width>
		endif
		<id> :se_setprops {
			event_handlers = [
				{focus freeplay_focus_menu_element}
				{unfocus freeplay_unfocus_menu_element}
				{pad_back ui_sfx_freeplay params = {type = back player = <player>}}
				{pad_back freeplay_menu_pop params = {player = <player>}}
				{pad_choose ui_sfx_freeplay params = {type = select player = <player>}}
				{pad_choose (<menu_entries> [<idx>].scr) params = ({player = <player> focus_idx = <focus_idx> (<menu_entries> [<idx>].params)})}
			]
		}
		<id> :freeplay_unfocus_menu_element time = 0
		focus_idx = (<focus_idx> + 1)
	endif
	idx = (<idx> + 1)
	repeat <array_size>
	freeplay_set_menu_background_dims menu_parent = <menu_parent> menu_width = <menu_width>
	freeplay_set_menu_highlight_dims menu_id = <menu_id> menu_width = <menu_width> num_elements = <array_size>
	launchevent type = focus target = <menu_id> data = {child_index = <menu_focus_idx>}
endscript

script freeplay_init_menu_state_stack 
	requireparams \{[
			player
		]
		all}
	get_highway_hud_menu_parent player = <player>
	<menu_parent> :settags {
		freeplay_menu_state_stack_top = 0
		freeplay_menu_state_stack = [
			{state = null focus = unset}
			{state = null focus = unset}
			{state = null focus = unset}
			{state = null focus = unset}
		]
	}
endscript

script freeplay_get_menu_state_stack 
	requireparams \{[
			player
		]
		all}
	get_highway_hud_menu_parent player = <player>
	<menu_parent> :getsingletag freeplay_menu_state_stack
	<menu_parent> :getsingletag freeplay_menu_state_stack_top
	return {
		freeplay_menu_state_stack_top = <freeplay_menu_state_stack_top>
		freeplay_menu_state_stack = <freeplay_menu_state_stack>
	}
endscript

script freeplay_set_menu_state_stack 
	requireparams \{[
			player
			freeplay_menu_state_stack
			freeplay_menu_state_stack_top
		]
		all}
	get_highway_hud_menu_parent player = <player>
	<menu_parent> :settags {
		freeplay_menu_state_stack_top = <freeplay_menu_state_stack_top>
		freeplay_menu_state_stack = <freeplay_menu_state_stack>
	}
endscript

script freeplay_menu_push 
	requireparams \{[
			state
			player
		]
		all}
	destroy_freeplay_menu player = <player>
	freeplay_get_menu_state_stack player = <player>
	if gotparam \{focus_idx}
		current_state = (<freeplay_menu_state_stack> [(<freeplay_menu_state_stack_top> - 1)].state)
		setarrayelement arrayname = freeplay_menu_state_stack index = (<freeplay_menu_state_stack_top> - 1) newvalue = {state = <current_state> focus_idx = <focus_idx>}
	endif
	setarrayelement arrayname = freeplay_menu_state_stack index = <freeplay_menu_state_stack_top> newvalue = {state = <state>}
	freeplay_menu_state_stack_top = (<freeplay_menu_state_stack_top> + 1)
	freeplay_set_menu_state_stack player = <player> {
		freeplay_menu_state_stack = <freeplay_menu_state_stack>
		freeplay_menu_state_stack_top = <freeplay_menu_state_stack_top>
	}
	create_freeplay_menu player = <player> menu_state = <state>
endscript

script freeplay_menu_pop 
	requireparams \{[
			player
		]
		all}
	destroy_freeplay_menu player = <player>
	freeplay_get_menu_state_stack player = <player>
	if (<freeplay_menu_state_stack_top> > 1)
		freeplay_menu_state_stack_top = (<freeplay_menu_state_stack_top> - 1)
		freeplay_set_menu_state_stack player = <player> {
			freeplay_menu_state_stack = <freeplay_menu_state_stack>
			freeplay_menu_state_stack_top = <freeplay_menu_state_stack_top>
		}
		state = (<freeplay_menu_state_stack> [(<freeplay_menu_state_stack_top> - 1)].state)
		focus_idx = (<freeplay_menu_state_stack> [(<freeplay_menu_state_stack_top> - 1)].focus_idx)
		create_freeplay_menu player = <player> menu_state = <state> menu_focus_idx = <focus_idx>
	else
		freeplay_menu_state_stack_top = (<freeplay_menu_state_stack_top> - 1)
		freeplay_set_menu_state_stack player = <player> {
			freeplay_menu_state_stack = <freeplay_menu_state_stack>
			freeplay_menu_state_stack_top = <freeplay_menu_state_stack_top>
		}
		freeplay_resume_player player = <player>
	endif
endscript

script create_freeplay_pause_menu 
	freeplay_menu_push state = base player = <player>
endscript

script freeplay_pause_menu_resume 
	destroy_freeplay_menu player = <player>
	freeplay_resume_player player = <player>
endscript

script freeplay_pause_menu_quit 
	if demobuild
		freeplay_pause_menu_dropout player = <player>
	else
		freeplay_menu_push player = <player> state = quit
	endif
endscript

script freeplay_pause_menu_dropout 
	spawnscriptnow freeplay_pause_menu_dropout_ignore_go_to_main_menu_for_one_frame params = {player = <player>}
	destroy_freeplay_menu player = <player>
	ui_sfx_freeplay type = drop player = <player>
	freeplay_drop_player_out player = <player>
endscript

script freeplay_pause_menu_dropout_ignore_go_to_main_menu_for_one_frame 
	onexitrun freeplay_pause_menu_dropout_ignore_go_to_main_menu_for_one_frame_on_exit_run params = {player = <player>}
	freeplay_join_event_handler :getsingletag \{ignore_go_to_main_menu_for_players}
	setarrayelement arrayname = ignore_go_to_main_menu_for_players index = (<player> - 1) newvalue = true
	freeplay_join_event_handler :settags ignore_go_to_main_menu_for_players = <ignore_go_to_main_menu_for_players>
	wait \{1
		gameframe}
endscript

script freeplay_pause_menu_dropout_ignore_go_to_main_menu_for_one_frame_on_exit_run 
	if NOT screenelementexists \{id = freeplay_join_event_handler}
		return
	endif
	freeplay_join_event_handler :getsingletag \{ignore_go_to_main_menu_for_players}
	setarrayelement arrayname = ignore_go_to_main_menu_for_players index = (<player> - 1) newvalue = false
	freeplay_join_event_handler :settags ignore_go_to_main_menu_for_players = <ignore_go_to_main_menu_for_players>
endscript

script freeplay_pause_menu_difficulty 
	destroy_freeplay_menu player = <player>
	create_freeplay_difficulty_menu player = <player> back_target = pause_menu
endscript

script freeplay_pause_menu_full_pause 
	requireparams \{[
			player
		]
		all}
	destroy_freeplay_menu player = <player>
	freeplay_resume_player player = <player>
	gh3_start_pressed device_num = <device_num> from_handler really_pause
endscript

script freeplay_pause_menu_songlist_pause 
	requireparams \{[
			player
			pause_type
		]
		all}
	stoprendering
	destroy_freeplay_menu player = <player>
	freeplay_resume_player player = <player>
	gman_songfunc \{func = get_current_song}
	freeplay_prepare_for_pause
	gh3_start_pressed {
		device_num = <device_num>
		from_handler
		really_pause
		pause_ui_state = uistate_freeplay_pause
		pause_ui_state_params = {
			pause_type = <pause_type>
			previous_first_song = <current_song>
			player = <player>
		}
	}
endscript

script freeplay_pause_menu_calibrate_lag 
	requireparams \{[
			player
			device_num
		]
		all}
	kill_intro_celeb_ui
	resetscoreupdateready
	gh3_sfx_fail_song_stop_sounds
	if scriptexists \{crowd_swells_during_stats_screen}
		killspawnedscript \{name = crowd_swells_during_stats_screen}
	endif
	if issoundeventplaying \{surge_during_stats_screen}
		stopsoundevent \{surge_during_stats_screen
			fade_time = 1.5
			fade_type = linear}
	endif
	change primary_controller = <device_num>
	change \{primary_controller_assigned = 1}
	stopsoundsbybuss \{encore_events}
	choose_calibrate_lag
endscript

script ui_create_freeplay_pause \{songlist_change_canceled = false}
	if NOT gotparam \{old_base_name}
		switch <pause_type>
			case new_song
			songlist_mode = play_song
			case edit_playlist
			songlist_mode = playlist
			case new_playlist
			songlist_mode = new_playlist
		endswitch
		freeplay_pause_spawned songlist_mode = <songlist_mode> player = <player>
	else
		restart_song_required = false
		if (<songlist_change_canceled> = false)
			if (<pause_type> = new_song)
				restart_song_required = true
			elseif
				gman_songfunc \{func = get_current_song}
				if (<current_song> != <previous_first_song>)
					restart_song_required = true
				endif
			endif
		endif
		spawnscriptnow freeplay_unpause_spawned params = {restart_song_required = <restart_song_required>}
	endif
endscript

script freeplay_pause_spawned 
	requireparams \{[
			songlist_mode
			player
		]
		all}
	disable_pause
	if (<songlist_mode> = playlist)
		gman_songfunc \{func = get_playlist_size}
		array = []
		index = 0
		begin
		gman_songfunc func = get_songname_by_index params = {index = <index>}
		addarrayelement array = <array> element = <requested_song_name>
		index = (<index> + 1)
		repeat <playlist_size>
		change current_playlist = <array>
	elseif (<songlist_mode> = new_playlist)
		change \{current_playlist = [
			]}
		<songlist_mode> = playlist
	else
		change \{current_playlist = [
			]}
	endif
	destroyscreenelement \{id = freeplay_extra_helper_pill}
	getplayerinfo <player> controller
	ui_event_wait event = menu_change data = {state = uistate_songlist mode = <songlist_mode> exclusive_device = <controller>}
endscript

script freeplay_unpause_spawned 
	if (<restart_song_required> = true)
		set_all_highway_prepass_props \{alpha = 0}
		set_all_highway_props \{alpha = 0}
		hide_glitch \{num_frames = 30}
	endif
	ui_event_wait_for_safe
	menu_music_off
	freeplay_prepare_for_unpause
	if (<restart_song_required> = true)
		play_cameracut \{prefix = 'cameras_no_band'}
		kill_gem_scroller \{restarting}
		change \{gameplay_restart_song = 1}
		change \{gameplay_loading_transition = 1}
		generic_event_back \{state = uistate_gameplay}
		freeplay_end_of_song
		unmuteeffectsend slot = ($venue_sendeffect_slot)
		vocaldspsetparams \{unmute_all}
		gh3_sfx_stop_sounds_for_killsong \{type = normal}
		stopsoundsbybuss \{user_misc}
		stopsoundsbybuss \{crowd_one_shots}
		stopsoundsbybuss \{crowd_cheers}
		stopsoundsbybuss \{crowd_star_power}
		unpausesoundsbybuss \{master}
	else
		gh3_start_pressed \{from_handler}
	endif
endscript

script freeplay_prepare_for_pause \{hide_hud = true}
	gamemode_gettype
	if NOT (<type> = freeplay)
		return
	endif
	freeplay_disable_menus \{defer_system_notifications_while_disabled = false}
	if (<hide_hud> = true)
		safe_hide \{id = highway_root_window}
		safe_hide \{id = vocals_highway_root}
		safe_hide \{id = hud_root}
		getmaxlocalplayers
		player = 1
		begin
		get_highway_hud_menu_parent player = <player>
		if resolvescreenelementid id = {<menu_parent> child = freeplay_menu}
			<resolved_id> :se_setprops ignore_parent_alpha = false
		endif
		if resolvescreenelementid id = {<menu_parent> child = freeplay_menu_background}
			<resolved_id> :se_setprops ignore_parent_alpha = false
		endif
		if resolvescreenelementid id = {<menu_parent> child = results_panel}
			<resolved_id> :se_setprops ignore_parent_alpha = false
		endif
		player = (<player> + 1)
		repeat <max_players>
	endif
	if screenelementexists \{id = intro_container}
		intro_container :freeplay_pause_fade_out_intro
	endif
endscript

script freeplay_prepare_for_unpause 
	gamemode_gettype
	if NOT (<type> = freeplay)
		return
	endif
	safe_show \{id = highway_root_window}
	safe_show \{id = vocals_highway_root}
	if screenelementexists \{id = intro_container}
		intro_container :freeplay_unpause_fade_in_intro
	endif
	if NOT ($cheat_performancemode = 1)
		safe_show \{id = hud_root}
	endif
	getmaxlocalplayers
	player = 1
	begin
	get_highway_hud_menu_parent player = <player>
	if resolvescreenelementid id = {<menu_parent> child = freeplay_menu}
		<resolved_id> :se_setprops ignore_parent_alpha = true
	endif
	if resolvescreenelementid id = {<menu_parent> child = freeplay_menu_background}
		<resolved_id> :se_setprops ignore_parent_alpha = true
	endif
	if resolvescreenelementid id = {<menu_parent> child = results_panel}
		<resolved_id> :se_setprops ignore_parent_alpha = true
	endif
	player = (<player> + 1)
	repeat <max_players>
endscript

script freeplay_pause_fade_out_intro 
	se_setprops \{song_intro_container_alpha = 0.0}
endscript

script freeplay_unpause_fade_in_intro 
	se_setprops \{song_intro_container_alpha = 1.0
		time = 1.0}
endscript

script freeplay_focus_menu_element \{grayed_out = false
		time = 0.15}
	if (<grayed_out> = false)
		item_text_rgba = [30 30 30 255]
	else
		item_text_rgba = [100 100 100 255]
	endif
	se_setprops highlight_btn_alpha = 0.5 item_text_rgba = <item_text_rgba> time = <time>
endscript

script freeplay_unfocus_menu_element \{grayed_out = false
		time = 0.15}
	if (<grayed_out> = false)
		item_text_rgba = [224 224 224 255]
	else
		item_text_rgba = [100 100 100 255]
	endif
	se_setprops highlight_btn_alpha = 0 item_text_rgba = <item_text_rgba> time = <time>
endscript

script freeplay_create_highway_element 
	createscreenelement {
		parent = <parent>
		type = descinterface
		desc = 'freeplay_highway_menu_element'
		item_text_text = <text>
		internal_just = [center , center]
		autosizedims = true
	}
	create_2d_spring_system desc_id = <id> num_springs = 2 stiffness = 50 rest_length = 1
	<id> :desc_resolvealias name = alias_item_text param = text_id
	<text_id> :se_getprops
	text_internal_scale = <internal_scale>
	resolvescreenelementid id = {<text_id> child = 0}
	<resolved_id> :se_getprops
	element_width = (<dims> [0] * <text_internal_scale> [0])
	return id = <id> element_width = <element_width>
endscript

script freeplay_set_menu_background_dims 
	requireparams \{[
			menu_parent
			menu_width
		]
		all}
	background_width = (<menu_width> + 144)
	if (<background_width> < 300)
		background_width = 300
	elseif (<background_width> > 386)
		background_width = 386
	endif
	light_box_dims = (<background_width> * (1.0, 0.0) + (0.0, 320.0))
	resolvescreenelementid id = {<menu_parent> child = freeplay_menu_background}
	<resolved_id> :se_setprops light_box_dims = <light_box_dims>
endscript

script freeplay_set_menu_highlight_dims 
	requireparams \{[
			menu_width
			menu_id
			num_elements
		]
		all}
	light_bar_width = (<menu_width> - 11)
	if (<light_bar_width> < 170)
		light_bar_width = 170
	elseif (<light_bar_width> > 231)
		light_bar_width = 231
	endif
	light_bar_dims = ((<light_bar_width> * (1.0, 0.0)) + (0.0, 80.0))
	idx = 0
	begin
	resolvescreenelementid id = {<menu_id> child = <idx>}
	<resolved_id> :se_setprops light_bar_dims = <light_bar_dims>
	idx = (<idx> + 1)
	repeat <num_elements>
endscript

script freeplay_calculate_precent_notes_hit 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> part
	if (<part> = vocals)
		getplayerinfo <player> vocal_phrase_quality
		getplayerinfo <player> vocal_phrase_fp_max_qual
		if (<vocal_phrase_fp_max_qual> > 0)
			percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_fp_max_qual>) * 100.0)
			mathfloor <percent_notes_hit>
			<percent_notes_hit> = <floor>
			if (<percent_notes_hit> = 0 && <vocal_phrase_quality> > 0)
				<percent_notes_hit> = 1
			endif
		else
			<percent_notes_hit> = 0
		endif
		mathfloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
	else
		getplayerinfo <player> notes_hit
		getplayerinfo <player> notes_created
		if (<notes_created> > 0)
			percent_notes_hit = (100.0 * <notes_hit> / <notes_created>)
		else
			percent_notes_hit = 0
		endif
		mathfloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
		if (<percent_notes_hit> = 0 && <notes_hit> > 0)
			percent_notes_hit = 1
		endif
	endif
	if (<percent_notes_hit> < 0)
		<percent_notes_hit> = 0
	elseif (<percent_notes_hit> > 100)
		<percent_notes_hit> = 100
	endif
	return percent_notes_hit = <percent_notes_hit>
endscript

script freeplay_create_stats_ui 
	freeplay_get_num_active_players
	if (<num_active_players> > 0)
		soundevent \{event = endofsong_camera_cheer}
		freeplay_get_first_active_player
		begin
		get_highway_hud_menu_parent player = <player>
		destroyscreenelement id = {<menu_parent> child = results_panel}
		freeplay_get_num_active_players
		freeplay_get_num_active_vocalists
		num_highways = (<num_active_players> - <num_active_vocalists>)
		switch <num_highways>
			case 1
			overall_scale = 1.0
			case 2
			overall_scale = 0.833
			case 3
			overall_scale = 0.666
			case 4
			overall_scale = 0.5
		endswitch
		createscreenelement {
			parent = <menu_parent>
			type = descinterface
			local_id = results_panel
			desc = 'freeplay_results'
			pos = (0.0, 0.0)
			autosizedims = true
			pos_anchor = [center , bottom]
			just = [center , bottom]
			ignore_parent_alpha = true
			alpha = 0
			scale = <overall_scale>
		}
		freeplay_calculate_precent_notes_hit player = <player>
		formattext textname = score_text qs(0xcfd55336) s = <percent_notes_hit>
		getplayerinfo <player> score
		casttointeger \{score}
		formattext textname = score_amount_text qs(0x4d4555da) s = <score>
		<id> :se_setprops score_text = <score_text> score_amount_text = <score_amount_text> alpha = 1 time = 1
		get_highway_hud_menu_parent player = <player>
		<menu_parent> :obj_killspawnedscript name = freeplay_dropout_player_if_inactive
		<menu_parent> :obj_killspawnedscript name = freeplay_controller_pulling_observer
		<menu_parent> :obj_killspawnedscript name = freeplay_debounce_starpower
		freeplay_get_next_active_player player = <player>
		repeat <num_active_players>
	endif
endscript

script freeplay_destroy_stats_ui 
	freeplay_get_num_active_players
	if (<num_active_players> > 0)
		freeplay_get_first_active_player
		begin
		get_highway_hud_menu_parent player = <player>
		if resolvescreenelementid id = {<menu_parent> child = results_panel}
			<resolved_id> :se_setprops alpha = 0 time = 1
		endif
		freeplay_get_next_active_player player = <player>
		repeat <num_active_players>
	endif
endscript

script freeplay_disable_menus \{defer_system_notifications_while_disabled = true}
	destroy_freeplay_jump_in_event_handler
	if (<defer_system_notifications_while_disabled> = true)
		gamemode_gettype
		if (<type> = freeplay)
			if ($freeplay_deferring_system_notification = false)
				startdelaysystemui
				change \{freeplay_deferring_system_notification = true}
			endif
		endif
	endif
	freeplay_get_num_active_players
	if (<num_active_players> > 0)
		freeplay_get_first_active_player
		begin
		get_highway_hud_menu_parent player = <player>
		if resolvescreenelementid id = {<menu_parent> child = freeplay_menu}
			<resolved_id> :se_setprops block_events alpha = 0 time = 1
		endif
		if resolvescreenelementid id = {<menu_parent> child = freeplay_menu_background}
			<resolved_id> :se_setprops alpha = 0 time = 1
		endif
		freeplay_get_next_active_player player = <player>
		repeat <num_active_players>
	endif
endscript

script freeplay_enable_menus 
	if gameispaused
		return
	endif
	create_freeplay_jump_in_event_handler freeplay_auto_join_device = <freeplay_auto_join_device>
	if ($freeplay_deferring_system_notification = true)
		stopdelaysystemui
		change \{freeplay_deferring_system_notification = false}
	endif
	freeplay_get_num_active_players
	if (<num_active_players> > 0)
		freeplay_get_first_active_player
		begin
		get_highway_hud_menu_parent player = <player>
		if resolvescreenelementid id = {<menu_parent> child = freeplay_menu}
			<resolved_id> :se_setprops unblock_events alpha = 1 time = 1
			<resolved_id> :desc_resolvealias name = alias_menu param = menu_id
			launchevent type = focus target = <menu_id>
			<menu_id> :menu_getselectedindex
			resolvescreenelementid id = {<menu_id> child = <selected_index>}
			launchevent type = focus target = <resolved_id>
		endif
		if resolvescreenelementid id = {<menu_parent> child = freeplay_menu_background}
			<resolved_id> :se_setprops alpha = 1 time = 1
		endif
		freeplay_get_next_active_player player = <player>
		repeat <num_active_players>
	endif
	if ($freeplay_demo_quit_warning_shown = 1)
		if NOT screenelementexists \{id = dialog_box_container}
			change \{freeplay_demo_quit_warning_shown = 0}
		endif
	endif
endscript

script freeplay_pause_difficulty_entry_focus 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> difficulty
	switch <difficulty>
		case beginner
		return \{focus_idx = 0}
		case easy
		return \{focus_idx = 1}
		case medium
		return \{focus_idx = 2}
		case hard
		return \{focus_idx = 3}
		case expert
		getplayerinfo <player> part
		if (<part> = drum)
			getplayerinfo <player> double_kick_drum
			if (<double_kick_drum> = 0)
				return \{focus_idx = 4}
			else
				return \{focus_idx = 5}
			endif
		else
			return \{focus_idx = 4}
		endif
	endswitch
	scriptassert \{qs(0x0b2cf4b2)}
endscript

script freeplay_pause_choose_difficulty 
	requireparams \{[
			player
			difficulty
		]
		all}
	if (<difficulty> = expert_plus)
		setplayerinfo <player> double_kick_drum = 1
		difficulty = expert
	else
		setplayerinfo <player> double_kick_drum = 0
	endif
	setplayerinfo <player> difficulty = <difficulty>
	freeplay_pause_menu_resume player = <player>
endscript

script freeplay_pause_instrument_entry_focus 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> part
	switch <part>
		case guitar
		return \{focus_idx = 0}
		case bass
		return \{focus_idx = 1}
	endswitch
	scriptassert \{qs(0x51812774)}
endscript

script freeplay_pause_choose_instrument 
	requireparams \{[
			player
			part
		]
		all}
	if NOT playerinfoequals <player> part = <part>
		freeplay_set_player_part player = <player> part = <part>
		setplayerinfo <player> star_power_amount = 0
	endif
	freeplay_pause_menu_resume player = <player>
endscript

script freeplay_pause_lefty_entry_focus 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> lefty_flip
	return focus_idx = <lefty_flip>
endscript

script freeplay_pause_choose_lefty 
	requireparams \{[
			player
			lefty_flip
		]
		all}
	setplayerinfo <player> lefty_flip = <lefty_flip>
	setplayerinfo <player> lefthanded_gems = <lefty_flip>
	setplayerinfo <player> lefthanded_button_ups = <lefty_flip>
	refresh_button_models player = <player>
	freeplay_pause_menu_resume player = <player>
endscript

script freeplay_condition_lefty_flip 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> part
	switch <part>
		case guitar
		case bass
		case drum
		return \{true}
	endswitch
	return \{false}
endscript

script freeplay_condition_instrument 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> part
	switch <part>
		case guitar
		case bass
		return \{true}
	endswitch
	return \{false}
endscript

script freeplay_condition_expert_plus 
	requireparams \{[
			player
		]
		all}
	if demobuild
		return \{false}
	endif
	getplayerinfo <player> part
	switch <part>
		case drum
		return \{true}
	endswitch
	return \{false}
endscript

script freeplay_condition_xblademo 
	if demobuild \{0x52e0628e}
		if ($kiosk_demo = 0)
			return \{true}
		endif
	endif
	return \{false}
endscript

script freeplay_condition_notdemo 
	if demobuild
		return \{false}
	else
		return \{true}
	endif
endscript

script freeplay_condition_options 
	requireparams \{[
			player
		]
		all}
	getplayerinfo <player> part
	switch <part>
		case guitar
		case bass
		case drum
		return \{true}
	endswitch
	return \{false}
endscript

script freeplay_condition_no_options 
	requireparams \{[
			player
		]
		all}
	if NOT freeplay_condition_options player = <player>
		return \{true}
	endif
	return \{false}
endscript

script freeplay_setup_highway_menu_background 
	requireparams \{[
			player
		]
		all}
	get_highway_hud_menu_parent player = <player>
	if resolvescreenelementid id = {<menu_parent> child = freeplay_menu_background}
		return true menu_background_id = <resolved_id>
	endif
	if screenelementexists id = <menu_parent>
		createscreenelement {
			parent = <menu_parent>
			type = descinterface
			local_id = freeplay_menu_background
			desc = 'freeplay_highway_menu_background'
			pos = (0.0, 0.0)
			autosizedims = true
			pos_anchor = [center , bottom]
			just = [center , bottom]
			ignore_parent_alpha = true
			alpha = 1
			light_box_dims = (300.0, 320.0)
		}
		return true menu_background_id = <id>
	endif
	return \{false}
endscript
