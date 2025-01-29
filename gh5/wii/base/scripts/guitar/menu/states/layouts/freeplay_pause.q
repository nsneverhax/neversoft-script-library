
script destroy_freeplay_instrument_menu 
	get_highway_hud_menu_parent Player = <Player>
	DestroyScreenElement id = {<menu_parent> child = freeplay_menu}
endscript

script create_freeplay_instrument_menu 
	getplayerinfo <Player> controller
	get_highway_hud_menu_parent Player = <Player>
	CreateScreenElement {
		parent = <menu_parent>
		Type = descinterface
		local_id = freeplay_menu
		desc = 'freeplay_highway_menu'
		Pos = (0.0, 0.0)
		autosizedims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
	}
	instrument_menu_id = <id>
	<instrument_menu_id> :se_setprops alpha = 1 time = 0.3
	<instrument_menu_id> :desc_resolvealias Name = alias_menu param = menu_id
	<menu_id> :se_setprops {
		event_handlers = [
			{menu_selection_changed ui_sfx_freeplay params = {Type = up Player = <Player>}}
		]
	}
	instrument_menu_entries = [
		{instrument = guitar text = qs(0x11355666)}
		{instrument = bass text = qs(0x4f551cbe)}
	]
	menu_width = 0
	idx = 0
	GetArraySize \{instrument_menu_entries}
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
			{pad_back freeplay_instrument_menu_back params = {Player = <Player>}}
			{pad_choose ui_sfx_freeplay params = {Type = instrument Player = <Player>}}
			{pad_choose freeplay_instrument_jump_player_in params = {instrument = (<instrument_menu_entries> [<idx>].instrument) Player = <Player>}}
		]
	}
	<id> :freeplay_unfocus_menu_element time = 0
	idx = (<idx> + 1)
	repeat <array_Size>
	freeplay_set_menu_background_dims menu_parent = <menu_parent> menu_width = <menu_width>
	freeplay_set_menu_highlight_dims menu_id = <menu_id> menu_width = <menu_width> num_elements = <array_Size>
	LaunchEvent Type = focus target = <menu_id>
endscript

script freeplay_instrument_menu_back 
	destroy_freeplay_instrument_menu Player = <Player>
	ui_sfx_freeplay Type = drop Player = <Player>
	freeplay_drop_player_out Player = <Player>
endscript

script destroy_freeplay_difficulty_menu 
	get_highway_hud_menu_parent Player = <Player>
	DestroyScreenElement id = {<menu_parent> child = freeplay_menu}
endscript

script create_freeplay_difficulty_menu 
	getplayerinfo <Player> controller
	getplayerinfo <Player> difficulty
	getplayerinfo <Player> part
	if (<difficulty> = expert)
		if (<part> = drum)
			getplayerinfo <Player> double_kick_drum
			if (<double_kick_drum> = 1)
				difficulty = expert_plus
			endif
		endif
	endif
	get_highway_hud_menu_parent Player = <Player>
	CreateScreenElement {
		parent = <menu_parent>
		Type = descinterface
		local_id = freeplay_menu
		desc = 'freeplay_highway_menu'
		Pos = (0.0, 0.0)
		autosizedims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
	}
	difficulty_menu_id = <id>
	<difficulty_menu_id> :se_setprops alpha = 1 time = 0.3
	<difficulty_menu_id> :desc_resolvealias Name = alias_menu param = menu_id
	<menu_id> :se_setprops {
		event_handlers = [
			{menu_selection_changed ui_sfx_freeplay params = {Type = up Player = <Player>}}
		]
	}
	if (<part> = drum)
		difficulty_menu_entries = [
			{difficulty = beginner text = qs(0x25b2ecac)}
			{difficulty = easy text = qs(0xbf7ffd2d)}
			{difficulty = medium text = qs(0xeac0f52d)}
			{difficulty = hard text = qs(0x63aae385)}
			{difficulty = expert text = qs(0xb778e780)}
			{difficulty = expert_plus text = qs(0x739da581)}
		]
	else
		difficulty_menu_entries = [
			{difficulty = beginner text = qs(0x25b2ecac)}
			{difficulty = easy text = qs(0xbf7ffd2d)}
			{difficulty = medium text = qs(0xeac0f52d)}
			{difficulty = hard text = qs(0x63aae385)}
			{difficulty = expert text = qs(0xb778e780)}
		]
	endif
	menu_width = 0
	idx = 0
	GetArraySize \{difficulty_menu_entries}
	begin
	if (<difficulty> = <difficulty_menu_entries> [<idx>].difficulty)
		GetArraySize \{difficulty_menu_entries}
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
			{pad_back freeplay_difficulty_menu_back params = {Player = <Player> back_target = <back_target>}}
			{pad_choose ui_sfx_freeplay params = {Type = select Player = <Player>}}
			{pad_choose freeplay_finish_jump_player_in params = {difficulty = (<difficulty_menu_entries> [<idx>].difficulty) Player = <Player>}}
		]
	}
	<id> :freeplay_unfocus_menu_element time = 0
	idx = (<idx> + 1)
	repeat <array_Size>
	if NOT GotParam \{player_difficulty_idx}
		ScriptAssert \{qs(0xac85b027)}
	endif
	freeplay_set_menu_background_dims menu_parent = <menu_parent> menu_width = <menu_width>
	freeplay_set_menu_highlight_dims menu_id = <menu_id> menu_width = <menu_width> num_elements = <array_Size>
	LaunchEvent Type = focus target = <menu_id> data = {child_index = <player_difficulty_idx>}
endscript

script freeplay_difficulty_menu_back 
	destroy_freeplay_difficulty_menu Player = <Player>
	switch <back_target>
		case dropped
		ui_sfx_freeplay Type = drop Player = <Player>
		freeplay_drop_player_out Player = <Player>
		case pause_menu
		ui_sfx_freeplay Type = back Player = <Player>
		create_freeplay_pause_menu Player = <Player>
		case instrument
		ui_sfx_freeplay Type = back Player = <Player>
		create_freeplay_instrument_menu Player = <Player>
		case mic
		ui_sfx_freeplay Type = back Player = <Player>
		create_freeplay_mic_preference_menu Player = <Player>
	endswitch
endscript

script destroy_freeplay_mic_preference_menu 
	get_highway_hud_menu_parent Player = <Player>
	DestroyScreenElement id = {<menu_parent> child = freeplay_menu}
endscript

script create_freeplay_mic_preference_menu 
	getplayerinfo <Player> controller
	setplayerinfo <Player> mic_type = None
	vocals_deinitmic controller = <controller>
	headset_unavailable = true
	mic_unavailable = true
	if freeplay_is_any_mic_free
		mic_unavailable = FALSE
	endif
	if (<headset_unavailable> = true && <mic_unavailable> = true)
		create_freeplay_connect_mic_menu Player = <Player>
		return
	endif
	if NOT freeplay_is_headset_allowed_for_vocals
		freeplay_mic_preference_jump_player_in Player = <Player> device_num = <controller> mic_preference = mic
		return
	endif
	getplayerinfo <Player> mic_preference out = focus_mic_preference
	if (<headset_unavailable> = true)
		focus_mic_preference = mic
	elseif (<mic_unavailable> = true)
		focus_mic_preference = headset
	endif
	get_highway_hud_menu_parent Player = <Player>
	CreateScreenElement {
		parent = <menu_parent>
		Type = descinterface
		local_id = freeplay_menu
		desc = 'freeplay_highway_menu'
		Pos = (0.0, 0.0)
		autosizedims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
	}
	mic_preference_menu_id = <id>
	<mic_preference_menu_id> :se_setprops alpha = 1 time = 0.3
	<mic_preference_menu_id> :desc_resolvealias Name = alias_menu param = menu_id
	<menu_id> :se_setprops {
		event_handlers = [
			{menu_selection_changed ui_sfx_freeplay params = {Type = up Player = <Player>}}
		]
	}
	mic_preference_menu_entries = [
		{mic_preference = mic text = qs(0xf505c703)}
		{mic_preference = headset text = qs(0x949ad871)}
	]
	menu_width = 0
	idx = 0
	GetArraySize \{mic_preference_menu_entries}
	begin
	this_mic_preference = (<mic_preference_menu_entries> [<idx>].mic_preference)
	if (<focus_mic_preference> = <this_mic_preference>)
		GetArraySize \{mic_preference_menu_entries}
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
			{focus freeplay_focus_mic_preference_menu_element params = {mic_preference = <this_mic_preference> controller = <controller> Player = <Player>}}
			{unfocus freeplay_unfocus_mic_preference_menu_element params = {mic_preference = <this_mic_preference> controller = <controller>}}
			{pad_back freeplay_mic_preference_menu_back params = {Player = <Player>}}
			{pad_choose ui_sfx_freeplay params = {Type = instrument Player = <Player>}}
			{pad_choose freeplay_mic_preference_jump_player_in params = {mic_preference = <this_mic_preference> Player = <Player>}}
		]
	}
	<id> :freeplay_unfocus_menu_element time = 0
	<id> :obj_spawnscript freeplay_mic_preference_menu_update_element_state params = {mic_preference = <this_mic_preference> controller = <controller> Player = <Player>}
	idx = (<idx> + 1)
	repeat <array_Size>
	freeplay_set_menu_background_dims menu_parent = <menu_parent> menu_width = <menu_width>
	freeplay_set_menu_highlight_dims menu_id = <menu_id> menu_width = <menu_width> num_elements = <array_Size>
	LaunchEvent Type = focus target = <menu_id> data = {child_index = <player_mic_preference_idx>}
	<menu_id> :obj_spawnscript freeplay_mic_preference_menu_update_state params = {Player = <Player>}
endscript

script freeplay_determine_mic_preference_grayed_out_state 
	RequireParams \{[
			mic_preference
			controller
		]
		all}
	switch <mic_preference>
		case mic
		if freeplay_is_any_mic_free
			return \{grayed_out = FALSE}
		else
			return \{grayed_out = true}
		endif
		case headset
		if controller_has_headset controller = <controller>
			return \{grayed_out = FALSE}
		else
			return \{grayed_out = true}
		endif
	endswitch
endscript

script freeplay_focus_mic_preference_menu_element 
	RequireParams \{[
			mic_preference
			controller
		]
		all}
	freeplay_determine_mic_preference_grayed_out_state mic_preference = <mic_preference> controller = <controller>
	freeplay_focus_menu_element grayed_out = <grayed_out>
endscript

script freeplay_unfocus_mic_preference_menu_element 
	RequireParams \{[
			mic_preference
			controller
		]
		all}
	freeplay_determine_mic_preference_grayed_out_state mic_preference = <mic_preference> controller = <controller>
	freeplay_unfocus_menu_element grayed_out = <grayed_out>
endscript

script freeplay_mic_preference_menu_update_element_state 
	RequireParams \{[
			mic_preference
			controller
		]
		all}
	Obj_GetID
	begin
	freeplay_determine_mic_preference_grayed_out_state mic_preference = <mic_preference> controller = <controller>
	if isscreenelementinfocus id = <objID>
		freeplay_focus_menu_element grayed_out = <grayed_out>
	else
		freeplay_unfocus_menu_element grayed_out = <grayed_out>
	endif
	Wait \{0.5
		Seconds}
	repeat
endscript

script freeplay_mic_preference_menu_update_state 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> controller
	begin
	Wait \{0.5
		Seconds}
	if NOT freeplay_is_any_mic_free
		if NOT controller_has_headset controller = <controller>
			SpawnScriptNow freeplay_drop_player_out params = {Player = <Player>}
			return
		endif
	endif
	repeat
endscript

script freeplay_mic_preference_menu_back 
	ui_sfx_freeplay Player = <Player> Type = drop
	destroy_freeplay_mic_preference_menu Player = <Player>
	freeplay_drop_player_out Player = <Player>
endscript

script destroy_freeplay_connect_mic_menu 
	get_highway_hud_menu_parent Player = <Player>
	DestroyScreenElement id = {<menu_parent> child = freeplay_menu}
endscript

script create_freeplay_connect_mic_menu 
	getplayerinfo <Player> controller
	if freeplay_is_headset_allowed_for_vocals
		message_text = qs(0x38dc4dc6)
	else
		message_text = qs(0x4260ae81)
	endif
	get_highway_hud_menu_parent Player = <Player>
	CreateScreenElement {
		parent = <menu_parent>
		Type = descinterface
		local_id = freeplay_menu
		desc = 'freeplay_highway_menu'
		Pos = (0.0, 0.0)
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
	<connect_mic_menu_id> :desc_resolvealias Name = alias_menu param = message_id
	ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
	<resolved_id> :se_setprops light_box_dims = (300.0, 320.0)
	<message_id> :se_setprops {
		event_handlers = [
			{event_mic_connected freeplay_connect_mic_menu_mic_connected params = {Player = <Player>}}
			{pad_back freeplay_connect_mic_menu_back params = {Player = <Player>}}
		]
	}
	LaunchEvent Type = focus target = <message_id>
	<message_id> :obj_spawnscript freeplay_connect_mic_menu_update_state params = {Player = <Player>}
endscript

script freeplay_connect_mic_menu_update_state 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> controller
	Obj_GetID
	OnExitRun \{freeplay_connect_mic_menu_update_state_exit}
	requestmicdetection \{enable = true}
	begin
	begin
	Wait \{0.5
		Seconds}
	if freeplay_is_any_mic_free
		break
	endif
	if controller_has_headset controller = <controller>
		break
	endif
	repeat
	LaunchEvent Type = event_mic_connected target = <objID>
	repeat
endscript

script freeplay_connect_mic_menu_update_state_exit 
	requestmicdetection \{enable = FALSE}
endscript

script freeplay_connect_mic_menu_mic_connected 
	se_getprops
	if (<events_blocked> = 1)
		return
	endif
	destroy_freeplay_connect_mic_menu Player = <Player>
	create_freeplay_mic_preference_menu Player = <Player>
endscript

script freeplay_connect_mic_menu_back 
	destroy_freeplay_connect_mic_menu Player = <Player>
	ui_sfx_freeplay Type = drop Player = <Player>
	freeplay_drop_player_out Player = <Player>
endscript

script freeplay_destroy_all_possible_menus 
	RequireParams \{[
			Player
		]
		all}
	destroy_freeplay_instrument_menu Player = <Player>
	destroy_freeplay_difficulty_menu Player = <Player>
	destroy_freeplay_mic_preference_menu Player = <Player>
	destroy_freeplay_connect_mic_menu Player = <Player>
	destroy_freeplay_menu Player = <Player>
endscript

script destroy_freeplay_menu 
	get_highway_hud_menu_parent Player = <Player>
	DestroyScreenElement id = {<menu_parent> child = freeplay_menu}
endscript

script create_freeplay_menu 
	RequireParams \{[
			menu_state
			Player
		]
		all}
	getplayerinfo <Player> controller
	menu_entries = ($freeplay_menu_states.<menu_state>.entries)
	entry_focus_scr = ($freeplay_menu_states.<menu_state>.entry_focus_scr)
	if GotParam \{entry_focus_scr}
		<entry_focus_scr> Player = <Player>
		menu_focus_idx = <focus_idx>
	endif
	get_highway_hud_menu_parent Player = <Player>
	CreateScreenElement {
		parent = <menu_parent>
		Type = descinterface
		local_id = freeplay_menu
		desc = 'freeplay_highway_menu'
		Pos = (0.0, 0.0)
		autosizedims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
	}
	desc_id = <id>
	<desc_id> :se_setprops alpha = 1 time = 0.3
	<desc_id> :desc_resolvealias Name = alias_menu param = menu_id
	<menu_id> :se_setprops {
		event_handlers = [
			{menu_selection_changed ui_sfx_freeplay params = {Type = up Player = <Player>}}
		]
	}
	menu_width = 0
	idx = 0
	focus_idx = 0
	GetArraySize \{menu_entries}
	begin
	include_entry = true
	if StructureContains structure = (<menu_entries> [<idx>]) condition_scr
		if NOT (<menu_entries> [<idx>].condition_scr) Player = <Player>
			include_entry = FALSE
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
				{pad_back ui_sfx_freeplay params = {Type = back Player = <Player>}}
				{pad_back freeplay_menu_pop params = {Player = <Player>}}
				{pad_choose ui_sfx_freeplay params = {Type = select Player = <Player>}}
				{pad_choose (<menu_entries> [<idx>].Scr) params = ({Player = <Player> focus_idx = <focus_idx> (<menu_entries> [<idx>].params)})}
			]
		}
		<id> :freeplay_unfocus_menu_element time = 0
		focus_idx = (<focus_idx> + 1)
	endif
	idx = (<idx> + 1)
	repeat <array_Size>
	freeplay_set_menu_background_dims menu_parent = <menu_parent> menu_width = <menu_width>
	freeplay_set_menu_highlight_dims menu_id = <menu_id> menu_width = <menu_width> num_elements = <array_Size>
	LaunchEvent Type = focus target = <menu_id> data = {child_index = <menu_focus_idx>}
endscript

script freeplay_init_menu_state_stack 
	RequireParams \{[
			Player
		]
		all}
	get_highway_hud_menu_parent Player = <Player>
	<menu_parent> :SetTags {
		freeplay_menu_state_stack_top = 0
		freeplay_menu_state_stack = [
			{state = NULL focus = unset}
			{state = NULL focus = unset}
			{state = NULL focus = unset}
			{state = NULL focus = unset}
		]
	}
endscript

script freeplay_get_menu_state_stack 
	RequireParams \{[
			Player
		]
		all}
	get_highway_hud_menu_parent Player = <Player>
	<menu_parent> :GetSingleTag freeplay_menu_state_stack
	<menu_parent> :GetSingleTag freeplay_menu_state_stack_top
	return {
		freeplay_menu_state_stack_top = <freeplay_menu_state_stack_top>
		freeplay_menu_state_stack = <freeplay_menu_state_stack>
	}
endscript

script freeplay_set_menu_state_stack 
	RequireParams \{[
			Player
			freeplay_menu_state_stack
			freeplay_menu_state_stack_top
		]
		all}
	get_highway_hud_menu_parent Player = <Player>
	<menu_parent> :SetTags {
		freeplay_menu_state_stack_top = <freeplay_menu_state_stack_top>
		freeplay_menu_state_stack = <freeplay_menu_state_stack>
	}
endscript

script freeplay_menu_push 
	RequireParams \{[
			state
			Player
		]
		all}
	destroy_freeplay_menu Player = <Player>
	freeplay_get_menu_state_stack Player = <Player>
	if GotParam \{focus_idx}
		current_state = (<freeplay_menu_state_stack> [(<freeplay_menu_state_stack_top> - 1)].state)
		SetArrayElement ArrayName = freeplay_menu_state_stack index = (<freeplay_menu_state_stack_top> - 1) NewValue = {state = <current_state> focus_idx = <focus_idx>}
	endif
	SetArrayElement ArrayName = freeplay_menu_state_stack index = <freeplay_menu_state_stack_top> NewValue = {state = <state>}
	freeplay_menu_state_stack_top = (<freeplay_menu_state_stack_top> + 1)
	freeplay_set_menu_state_stack Player = <Player> {
		freeplay_menu_state_stack = <freeplay_menu_state_stack>
		freeplay_menu_state_stack_top = <freeplay_menu_state_stack_top>
	}
	create_freeplay_menu Player = <Player> menu_state = <state>
endscript

script freeplay_menu_pop 
	RequireParams \{[
			Player
		]
		all}
	destroy_freeplay_menu Player = <Player>
	freeplay_get_menu_state_stack Player = <Player>
	if (<freeplay_menu_state_stack_top> > 1)
		freeplay_menu_state_stack_top = (<freeplay_menu_state_stack_top> - 1)
		freeplay_set_menu_state_stack Player = <Player> {
			freeplay_menu_state_stack = <freeplay_menu_state_stack>
			freeplay_menu_state_stack_top = <freeplay_menu_state_stack_top>
		}
		state = (<freeplay_menu_state_stack> [(<freeplay_menu_state_stack_top> - 1)].state)
		focus_idx = (<freeplay_menu_state_stack> [(<freeplay_menu_state_stack_top> - 1)].focus_idx)
		create_freeplay_menu Player = <Player> menu_state = <state> menu_focus_idx = <focus_idx>
	else
		freeplay_menu_state_stack_top = (<freeplay_menu_state_stack_top> - 1)
		freeplay_set_menu_state_stack Player = <Player> {
			freeplay_menu_state_stack = <freeplay_menu_state_stack>
			freeplay_menu_state_stack_top = <freeplay_menu_state_stack_top>
		}
		freeplay_resume_player Player = <Player>
	endif
endscript

script create_freeplay_pause_menu 
	freeplay_menu_push state = Base Player = <Player>
endscript

script freeplay_pause_menu_resume 
	destroy_freeplay_menu Player = <Player>
	freeplay_resume_player Player = <Player>
endscript

script freeplay_pause_menu_dropout 
	SpawnScriptNow freeplay_pause_menu_dropout_ignore_go_to_main_menu_for_one_frame params = {Player = <Player>}
	destroy_freeplay_menu Player = <Player>
	ui_sfx_freeplay Type = drop Player = <Player>
	freeplay_drop_player_out Player = <Player>
endscript

script freeplay_pause_menu_dropout_ignore_go_to_main_menu_for_one_frame 
	OnExitRun freeplay_pause_menu_dropout_ignore_go_to_main_menu_for_one_frame_on_exit_run params = {Player = <Player>}
	freeplay_join_event_handler :GetSingleTag \{ignore_go_to_main_menu_for_players}
	SetArrayElement ArrayName = ignore_go_to_main_menu_for_players index = (<Player> - 1) NewValue = true
	freeplay_join_event_handler :SetTags ignore_go_to_main_menu_for_players = <ignore_go_to_main_menu_for_players>
	Wait \{1
		gameframe}
endscript

script freeplay_pause_menu_dropout_ignore_go_to_main_menu_for_one_frame_on_exit_run 
	if NOT ScreenElementExists \{id = freeplay_join_event_handler}
		return
	endif
	freeplay_join_event_handler :GetSingleTag \{ignore_go_to_main_menu_for_players}
	SetArrayElement ArrayName = ignore_go_to_main_menu_for_players index = (<Player> - 1) NewValue = FALSE
	freeplay_join_event_handler :SetTags ignore_go_to_main_menu_for_players = <ignore_go_to_main_menu_for_players>
endscript

script freeplay_pause_menu_difficulty 
	destroy_freeplay_menu Player = <Player>
	create_freeplay_difficulty_menu Player = <Player> back_target = pause_menu
endscript

script freeplay_pause_menu_full_pause 
	RequireParams \{[
			Player
		]
		all}
	destroy_freeplay_menu Player = <Player>
	freeplay_resume_player Player = <Player>
	gh3_start_pressed device_num = <device_num> from_handler really_pause
endscript

script freeplay_pause_menu_songlist_pause 
	RequireParams \{[
			Player
			pause_type
		]
		all}
	StopRendering
	destroy_freeplay_menu Player = <Player>
	freeplay_resume_player Player = <Player>
	gman_songfunc \{func = get_current_song}
	freeplay_prepare_for_pause \{increment_ref_count = FALSE}
	gh3_start_pressed {
		device_num = <device_num>
		from_handler
		really_pause
		pause_ui_state = uistate_freeplay_pause
		pause_ui_state_params = {
			pause_type = <pause_type>
			previous_first_song = <current_song>
			Player = <Player>
		}
	}
endscript

script ui_create_freeplay_pause \{songlist_change_canceled = FALSE}
	if NOT GotParam \{old_base_name}
		switch <pause_type>
			case new_song
			songlist_mode = play_song
			case edit_playlist
			songlist_mode = playlist
			case new_playlist
			songlist_mode = new_playlist
		endswitch
		freeplay_pause_spawned songlist_mode = <songlist_mode> Player = <Player>
	else
		restart_song_required = FALSE
		if (<songlist_change_canceled> = FALSE)
			if (<pause_type> = new_song)
				restart_song_required = true
			elseif
				gman_songfunc \{func = get_current_song}
				if (<current_song> != <previous_first_song>)
					restart_song_required = true
				endif
			endif
		endif
		SpawnScriptNow freeplay_unpause_spawned params = {restart_song_required = <restart_song_required>}
	endif
endscript

script freeplay_pause_spawned 
	RequireParams \{[
			songlist_mode
			Player
		]
		all}
	menu_music_off
	disable_pause
	if (<songlist_mode> = playlist)
		gman_songfunc \{func = get_playlist_size}
		array = []
		index = 0
		begin
		gman_songfunc func = get_songname_by_index params = {index = <index>}
		AddArrayElement array = <array> element = <requested_song_name>
		index = (<index> + 1)
		repeat <playlist_size>
		Change current_playlist = <array>
	elseif (<songlist_mode> = new_playlist)
		Change \{current_playlist = [
			]}
		<songlist_mode> = playlist
	else
		Change \{current_playlist = [
			]}
	endif
	DestroyScreenElement \{id = freeplay_extra_helper_pill}
	getplayerinfo <Player> controller
	ui_event_wait event = menu_change data = {state = uistate_songlist mode = <songlist_mode> exclusive_device = <controller>}
endscript

script freeplay_unpause_spawned 
	if (<restart_song_required> = true)
		set_all_highway_props \{alpha = 0}
		hide_glitch \{num_frames = 30}
	else
		destroy_loading_screen
	endif
	ui_event_wait_for_safe
	menu_music_off
	freeplay_prepare_for_unpause
	if (<restart_song_required> = true)
		play_cameracut \{prefix = 'cameras_no_band'}
		kill_gem_scroller \{restarting}
		Change \{gameplay_restart_song = 1}
		Change \{gameplay_loading_transition = 1}
		generic_event_back \{state = Uistate_gameplay}
		freeplay_end_of_song
		unmuteeffectsend slot = ($venue_sendeffect_slot)
		vocaldspsetparams \{unmute_all}
		GH3_SFX_Stop_Sounds_For_KillSong \{Type = Normal}
		StopSoundsByBuss \{user_misc}
		StopSoundsByBuss \{Crowd_One_Shots}
		StopSoundsByBuss \{Crowd_Cheers}
		StopSoundsByBuss \{Crowd_Star_Power}
		UnpauseSoundsByBuss \{Master}
	else
		gh3_start_pressed \{from_handler}
	endif
	freeplay_update_microphone_muting_unmute
endscript

script freeplay_update_microphone_muting_unmute 
	getmaxlocalplayers
	Player = 1
	begin
	getplayerinfo <Player> part
	getplayerinfo <Player> interactive
	if (<part> = vocals)
		if (<interactive> = 1)
			vocals_muteoutput Player = <Player> mute = FALSE
		endif
	endif
	Player = (<Player> + 1)
	repeat <max_players>
endscript

script freeplay_update_microphone_muting_mute 
	getmaxlocalplayers
	Player = 1
	begin
	getplayerinfo <Player> part
	getplayerinfo <Player> interactive
	if (<part> = vocals)
		if (<interactive> = 1)
			vocals_muteoutput Player = <Player> mute = true
		endif
	endif
	Player = (<Player> + 1)
	repeat <max_players>
endscript

script freeplay_prepare_for_pause \{hide_hud = true
		increment_ref_count = true}
	gamemode_gettype
	if NOT (<Type> = freeplay)
		return
	endif
	freeplay_disable_menus defer_system_notifications_while_disabled = FALSE increment_ref_count = <increment_ref_count>
	if (<hide_hud> = true)
		safe_hide \{id = highway_root_window}
		safe_hide \{id = vocals_highway_root}
		safe_hide \{id = hud_root}
		getmaxlocalplayers
		Player = 1
		begin
		get_highway_hud_menu_parent Player = <Player>
		if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu}
			<resolved_id> :se_setprops ignore_parent_alpha = FALSE
		endif
		if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
			<resolved_id> :se_setprops ignore_parent_alpha = FALSE
		endif
		if ResolveScreenElementID id = {<menu_parent> child = results_panel}
			<resolved_id> :se_setprops ignore_parent_alpha = FALSE
		endif
		Player = (<Player> + 1)
		repeat <max_players>
	endif
	if ScreenElementExists \{id = intro_container}
		intro_container :se_setprops \{song_intro_container_alpha = 0.0}
	endif
endscript

script freeplay_prepare_for_unpause 
	gamemode_gettype
	if NOT (<Type> = freeplay)
		return
	endif
	safe_show \{id = highway_root_window}
	safe_show \{id = vocals_highway_root}
	if ScreenElementExists \{id = intro_container}
		intro_container :freeplay_unpause_fade_in_intro
	endif
	if NOT ($Cheat_PerformanceMode = 1)
		safe_show \{id = hud_root}
	endif
	getmaxlocalplayers
	Player = 1
	begin
	getplayerinfo <Player> part
	getplayerinfo <Player> interactive
	if (<part> = vocals)
		if (<interactive> = 1)
			vocals_muteoutput Player = <Player> mute = FALSE
		endif
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	getmaxlocalplayers
	Player = 1
	begin
	get_highway_hud_menu_parent Player = <Player>
	if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu}
		<resolved_id> :se_setprops ignore_parent_alpha = true
	endif
	if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
		<resolved_id> :se_setprops ignore_parent_alpha = true
	endif
	if ResolveScreenElementID id = {<menu_parent> child = results_panel}
		<resolved_id> :se_setprops ignore_parent_alpha = true
	endif
	Player = (<Player> + 1)
	repeat <max_players>
endscript

script freeplay_pause_fade_out_intro 
	se_setprops \{song_intro_container_alpha = 0.0}
endscript

script freeplay_unpause_fade_in_intro 
	se_setprops \{song_intro_container_alpha = 1.0
		time = 1.0}
endscript

script freeplay_focus_menu_element \{grayed_out = FALSE
		time = 0.15}
	if (<grayed_out> = FALSE)
		item_text_rgba = [30 30 30 255]
	else
		item_text_rgba = [100 100 100 255]
	endif
	se_setprops highlight_btn_alpha = 0.5 item_text_rgba = <item_text_rgba> time = <time>
endscript

script freeplay_unfocus_menu_element \{grayed_out = FALSE
		time = 0.15}
	if (<grayed_out> = FALSE)
		item_text_rgba = [224 224 224 255]
	else
		item_text_rgba = [100 100 100 255]
	endif
	se_setprops highlight_btn_alpha = 0 item_text_rgba = <item_text_rgba> time = <time>
endscript

script freeplay_create_highway_element 
	CreateScreenElement {
		parent = <parent>
		Type = descinterface
		desc = 'freeplay_highway_menu_element'
		item_text_text = <text>
		internal_just = [center , center]
		autosizedims = true
	}
	create_2d_spring_system desc_id = <id> num_springs = 2 stiffness = 50 rest_length = 1
	<id> :desc_resolvealias Name = alias_item_text param = text_id
	<text_id> :se_getprops
	text_internal_scale = <internal_scale>
	ResolveScreenElementID id = {<text_id> child = 0}
	<resolved_id> :se_getprops
	element_width = (<dims> [0] * <text_internal_scale> [0])
	return id = <id> element_width = <element_width>
endscript

script freeplay_set_menu_background_dims 
	RequireParams \{[
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
	ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
	<resolved_id> :se_setprops light_box_dims = <light_box_dims>
endscript

script freeplay_set_menu_highlight_dims 
	RequireParams \{[
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
	ResolveScreenElementID id = {<menu_id> child = <idx>}
	<resolved_id> :se_setprops light_bar_dims = <light_bar_dims>
	idx = (<idx> + 1)
	repeat <num_elements>
endscript

script freeplay_calculate_precent_notes_hit 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> part
	if (<part> = vocals)
		getplayerinfo <Player> vocal_phrase_quality
		getplayerinfo <Player> vocal_phrase_fp_max_qual
		if (<vocal_phrase_fp_max_qual> > 0)
			percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_fp_max_qual>) * 100.0)
			MathFloor <percent_notes_hit>
			<percent_notes_hit> = <floor>
			if (<percent_notes_hit> = 0 && <vocal_phrase_quality> > 0)
				<percent_notes_hit> = 1
			endif
		else
			<percent_notes_hit> = 0
		endif
		MathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
	else
		getplayerinfo <Player> notes_hit
		getplayerinfo <Player> notes_created
		if (<notes_created> > 0)
			percent_notes_hit = (100.0 * <notes_hit> / <notes_created>)
		else
			percent_notes_hit = 0
		endif
		MathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
		if (<percent_notes_hit> = 0 && <notes_hit> > 0)
			percent_notes_hit = 1
		endif
	endif
	if NOT playerinfoequals <Player> part = vocals
		MathFloor <percent_notes_hit>
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
	destroy_freeplay_jump_in_event_handler
	clean_up_user_control_helpers
	DestroyScreenElement \{id = freeplay_extra_helper_pill}
	freeplay_get_num_active_players
	if (<num_active_players> > 0)
		SoundEvent \{event = endofsong_camera_cheer}
		freeplay_get_first_active_player
		begin
		get_highway_hud_menu_parent Player = <Player>
		DestroyScreenElement id = {<menu_parent> child = results_panel}
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
		CreateScreenElement {
			parent = <menu_parent>
			Type = descinterface
			local_id = results_panel
			desc = 'freeplay_results'
			Pos = (0.0, 0.0)
			autosizedims = true
			pos_anchor = [center , bottom]
			just = [center , bottom]
			ignore_parent_alpha = true
			alpha = 0
			Scale = <overall_scale>
		}
		freeplay_calculate_precent_notes_hit Player = <Player>
		formatText TextName = score_text qs(0xcfd55336) s = <percent_notes_hit>
		getplayerinfo <Player> score
		CastToInteger \{score}
		formatText TextName = score_amount_text qs(0x4d4555da) s = <score>
		<id> :se_setprops score_text = <score_text> score_amount_text = <score_amount_text> alpha = 1 time = 1
		get_highway_hud_menu_parent Player = <Player>
		<menu_parent> :Obj_KillSpawnedScript Name = freeplay_dropout_player_if_inactive
		<menu_parent> :Obj_KillSpawnedScript Name = freeplay_controller_pulling_observer
		<menu_parent> :Obj_KillSpawnedScript Name = freeplay_debounce_starpower
		freeplay_get_next_active_player Player = <Player>
		repeat <num_active_players>
	endif
endscript

script freeplay_destroy_stats_ui 
	freeplay_get_num_active_players
	if (<num_active_players> > 0)
		freeplay_get_first_active_player
		begin
		get_highway_hud_menu_parent Player = <Player>
		if ResolveScreenElementID id = {<menu_parent> child = results_panel}
			<resolved_id> :se_setprops alpha = 0 time = 1
		endif
		freeplay_get_next_active_player Player = <Player>
		repeat <num_active_players>
	endif
endscript
vv_freeplay_menu_disable_refcnt = 0

script freeplay_disable_menus \{defer_system_notifications_while_disabled = true
		increment_ref_count = true}
	destroy_freeplay_jump_in_event_handler
	if (<increment_ref_count> = true)
		Change vv_freeplay_menu_disable_refcnt = (($vv_freeplay_menu_disable_refcnt) + 1)
	endif
	if (<defer_system_notifications_while_disabled> = true)
		gamemode_gettype
		if (<Type> = freeplay)
			if ($freeplay_deferring_system_notification = FALSE)
				startdelaysystemui
				Change \{freeplay_deferring_system_notification = true}
			endif
		endif
	endif
	freeplay_get_num_active_players
	if (<num_active_players> > 0)
		freeplay_get_first_active_player
		begin
		get_highway_hud_menu_parent Player = <Player>
		if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu}
			<resolved_id> :se_setprops block_events alpha = 0 time = 1
		endif
		if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
			<resolved_id> :se_setprops alpha = 0 time = 1
		endif
		freeplay_get_next_active_player Player = <Player>
		repeat <num_active_players>
	endif
endscript

script freeplay_enable_menus 
	Change vv_freeplay_menu_disable_refcnt = (($vv_freeplay_menu_disable_refcnt) - 1)
	if (($vv_freeplay_menu_disable_refcnt) < 0)
		Change \{vv_freeplay_menu_disable_refcnt = 0}
	endif
	if (($vv_freeplay_menu_disable_refcnt) > 0)
		return
	endif
	set_home_button_allowed
	create_freeplay_jump_in_event_handler freeplay_auto_join_device = <freeplay_auto_join_device>
	if ($freeplay_deferring_system_notification = true)
		stopdelaysystemui
		Change \{freeplay_deferring_system_notification = FALSE}
	endif
	freeplay_get_num_active_players
	if (<num_active_players> > 0)
		freeplay_get_first_active_player
		begin
		get_highway_hud_menu_parent Player = <Player>
		if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu}
			<resolved_id> :se_setprops unblock_events alpha = 1 time = 1
			<resolved_id> :desc_resolvealias Name = alias_menu param = menu_id
			LaunchEvent Type = focus target = <menu_id>
			<menu_id> :menu_getselectedindex
			ResolveScreenElementID id = {<menu_id> child = <selected_index>}
			LaunchEvent Type = focus target = <resolved_id>
		endif
		if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
			<resolved_id> :se_setprops alpha = 1 time = 1
		endif
		freeplay_get_next_active_player Player = <Player>
		repeat <num_active_players>
	endif
endscript

script freeplay_pause_difficulty_entry_focus 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> difficulty
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
		getplayerinfo <Player> part
		if (<part> = drum)
			getplayerinfo <Player> double_kick_drum
			if (<double_kick_drum> = 0)
				return \{focus_idx = 4}
			else
				return \{focus_idx = 5}
			endif
		else
			return \{focus_idx = 4}
		endif
	endswitch
	ScriptAssert \{qs(0x0b2cf4b2)}
endscript

script freeplay_pause_choose_difficulty 
	RequireParams \{[
			Player
			difficulty
		]
		all}
	if (<difficulty> = expert_plus)
		setplayerinfo <Player> double_kick_drum = 1
		difficulty = expert
	else
		setplayerinfo <Player> double_kick_drum = 0
	endif
	setplayerinfo <Player> difficulty = <difficulty>
	freeplay_pause_menu_resume Player = <Player>
endscript

script freeplay_pause_instrument_entry_focus 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> part
	switch <part>
		case guitar
		return \{focus_idx = 0}
		case bass
		return \{focus_idx = 1}
	endswitch
	ScriptAssert \{qs(0x51812774)}
endscript

script freeplay_pause_choose_instrument 
	RequireParams \{[
			Player
			part
		]
		all}
	if NOT playerinfoequals <Player> part = <part>
		freeplay_set_player_part Player = <Player> part = <part>
		setplayerinfo <Player> star_power_amount = 0
	endif
	freeplay_pause_menu_resume Player = <Player>
endscript

script freeplay_pause_lefty_entry_focus 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> lefty_flip
	return focus_idx = <lefty_flip>
endscript

script freeplay_pause_choose_lefty 
	RequireParams \{[
			Player
			lefty_flip
		]
		all}
	setplayerinfo <Player> lefty_flip = <lefty_flip>
	setplayerinfo <Player> lefthanded_gems = <lefty_flip>
	setplayerinfo <Player> lefthanded_button_ups = <lefty_flip>
	getplayerinfo <Player> part
	if NOT (<part> = drum)
		refresh_button_models Player = <Player>
	endif
	freeplay_pause_menu_resume Player = <Player>
endscript

script freeplay_condition_lefty_flip 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> part
	switch <part>
		case guitar
		case bass
		case drum
		return \{true}
	endswitch
	return \{FALSE}
endscript

script freeplay_condition_instrument 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> part
	switch <part>
		case guitar
		case bass
		return \{true}
	endswitch
	return \{FALSE}
endscript

script freeplay_condition_expert_plus 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> part
	switch <part>
		case drum
		return \{true}
	endswitch
	return \{FALSE}
endscript

script freeplay_condition_options 
	RequireParams \{[
			Player
		]
		all}
	getplayerinfo <Player> part
	switch <part>
		case guitar
		case bass
		case drum
		return \{true}
	endswitch
	return \{FALSE}
endscript

script freeplay_condition_no_options 
	RequireParams \{[
			Player
		]
		all}
	if NOT freeplay_condition_options Player = <Player>
		return \{true}
	endif
	return \{FALSE}
endscript

script freeplay_setup_highway_menu_background 
	RequireParams \{[
			Player
		]
		all}
	get_highway_hud_menu_parent Player = <Player>
	if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
		return true menu_background_id = <resolved_id>
	endif
	if ScreenElementExists id = <menu_parent>
		CreateScreenElement {
			parent = <menu_parent>
			Type = descinterface
			local_id = freeplay_menu_background
			desc = 'freeplay_highway_menu_background'
			Pos = (0.0, 0.0)
			autosizedims = true
			pos_anchor = [center , bottom]
			just = [center , bottom]
			ignore_parent_alpha = true
			alpha = 1
			light_box_dims = (300.0, 320.0)
		}
		return true menu_background_id = <id>
	endif
	return \{FALSE}
endscript
