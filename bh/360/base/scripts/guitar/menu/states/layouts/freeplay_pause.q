
script destroy_freeplay_instrument_menu 
	get_highway_hud_menu_parent player = <player>
	DestroyScreenElement id = {<menu_parent> child = freeplay_menu}
endscript

script create_freeplay_instrument_menu 
	GetPlayerInfo <player> controller
	get_highway_hud_menu_parent player = <player>
	CreateScreenElement {
		parent = <menu_parent>
		type = DescInterface
		local_id = freeplay_menu
		desc = 'freeplay_highway_menu'
		Pos = (0.0, 0.0)
		autoSizeDims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
	}
	instrument_menu_id = <id>
	<instrument_menu_id> :SE_SetProps alpha = 1 time = 0.3
	<instrument_menu_id> :Desc_ResolveAlias name = alias_Menu param = menu_id
	<menu_id> :SE_SetProps {
		event_handlers = [
			{menu_selection_changed UI_SFX_Freeplay params = {type = up player = <player>}}
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
	<id> :SE_SetProps {
		event_handlers = [
			{focus freeplay_focus_menu_element}
			{unfocus freeplay_unfocus_menu_element}
			{pad_back freeplay_instrument_menu_back params = {player = <player>}}
			{pad_choose UI_SFX_Freeplay params = {type = instrument player = <player>}}
			{pad_choose freeplay_instrument_jump_player_in params = {instrument = (<instrument_menu_entries> [<idx>].instrument) player = <player>}}
		]
	}
	<id> :freeplay_unfocus_menu_element time = 0
	idx = (<idx> + 1)
	repeat <array_size>
	freeplay_set_menu_background_dims menu_parent = <menu_parent> menu_width = <menu_width>
	freeplay_set_menu_highlight_dims menu_id = <menu_id> menu_width = <menu_width> num_elements = <array_size>
	LaunchEvent type = focus target = <menu_id>
endscript

script freeplay_instrument_menu_back 
	destroy_freeplay_instrument_menu player = <player>
	UI_SFX_Freeplay type = drop player = <player>
	freeplay_drop_player_out player = <player>
endscript

script destroy_freeplay_difficulty_menu 
	get_highway_hud_menu_parent player = <player>
	DestroyScreenElement id = {<menu_parent> child = freeplay_menu}
endscript

script create_freeplay_difficulty_menu 
	GetPlayerInfo <player> controller
	GetPlayerInfo <player> difficulty
	GetPlayerInfo <player> part
	if (<difficulty> = expert)
		if (<part> = Drum)
			GetPlayerInfo <player> double_kick_drum
			if (<double_kick_drum> = 1)
				difficulty = expert_plus
			endif
		endif
	endif
	get_highway_hud_menu_parent player = <player>
	CreateScreenElement {
		parent = <menu_parent>
		type = DescInterface
		local_id = freeplay_menu
		desc = 'freeplay_highway_menu'
		Pos = (0.0, 0.0)
		autoSizeDims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
	}
	difficulty_menu_id = <id>
	<difficulty_menu_id> :SE_SetProps alpha = 1 time = 0.3
	<difficulty_menu_id> :Desc_ResolveAlias name = alias_Menu param = menu_id
	<menu_id> :SE_SetProps {
		event_handlers = [
			{menu_selection_changed UI_SFX_Freeplay params = {type = up player = <player>}}
		]
	}
	difficulty_menu_entries = [
		{difficulty = beginner text = qs(0x25b2ecac)}
		{difficulty = easy text = qs(0xbf7ffd2d)}
		{difficulty = medium text = qs(0xeac0f52d)}
		{difficulty = hard text = qs(0x63aae385)}
		{difficulty = expert text = qs(0xb778e780)}
	]
	if (<part> = Drum)
		if any_song_has_double_kick
			AddArrayElement array = <difficulty_menu_entries> element = {difficulty = expert_plus text = qs(0x739da581)}
			difficulty_menu_entries = <array>
		endif
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
	<id> :SE_SetProps {
		event_handlers = [
			{focus freeplay_focus_menu_element}
			{unfocus freeplay_unfocus_menu_element}
			{pad_back freeplay_difficulty_menu_back params = {player = <player> back_target = <back_target>}}
			{pad_choose UI_SFX_Freeplay params = {type = select player = <player>}}
			{pad_choose freeplay_finish_jump_player_in params = {difficulty = (<difficulty_menu_entries> [<idx>].difficulty) player = <player>}}
		]
	}
	<id> :freeplay_unfocus_menu_element time = 0
	idx = (<idx> + 1)
	repeat <array_size>
	if NOT GotParam \{player_difficulty_idx}
		ScriptAssert \{qs(0xac85b027)}
	endif
	freeplay_set_menu_background_dims menu_parent = <menu_parent> menu_width = <menu_width>
	freeplay_set_menu_highlight_dims menu_id = <menu_id> menu_width = <menu_width> num_elements = <array_size>
	LaunchEvent type = focus target = <menu_id> data = {child_index = <player_difficulty_idx>}
endscript

script freeplay_difficulty_menu_back 
	destroy_freeplay_difficulty_menu player = <player>
	switch <back_target>
		case dropped
		UI_SFX_Freeplay type = drop player = <player>
		freeplay_drop_player_out player = <player>
		case pause_menu
		UI_SFX_Freeplay type = back player = <player>
		create_freeplay_pause_menu player = <player>
		case instrument
		UI_SFX_Freeplay type = back player = <player>
		create_freeplay_instrument_menu player = <player>
		case mic
		UI_SFX_Freeplay type = back player = <player>
		create_freeplay_mic_preference_menu player = <player>
	endswitch
endscript

script destroy_freeplay_mic_preference_menu 
	get_highway_hud_menu_parent player = <player>
	DestroyScreenElement id = {<menu_parent> child = freeplay_menu}
endscript

script create_freeplay_mic_preference_menu 
	GetPlayerInfo <player> controller
	SetPlayerInfo <player> mic_type = None
	Vocals_DeinitMic controller = <controller>
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
	GetPlayerInfo <player> mic_preference out = focus_mic_preference
	if (<headset_unavailable> = true)
		focus_mic_preference = mic
	elseif (<mic_unavailable> = true)
		focus_mic_preference = headset
	endif
	get_highway_hud_menu_parent player = <player>
	CreateScreenElement {
		parent = <menu_parent>
		type = DescInterface
		local_id = freeplay_menu
		desc = 'freeplay_highway_menu'
		Pos = (0.0, 0.0)
		autoSizeDims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
	}
	mic_preference_menu_id = <id>
	<mic_preference_menu_id> :SE_SetProps alpha = 1 time = 0.3
	<mic_preference_menu_id> :Desc_ResolveAlias name = alias_Menu param = menu_id
	<menu_id> :SE_SetProps {
		event_handlers = [
			{menu_selection_changed UI_SFX_Freeplay params = {type = up player = <player>}}
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
	<id> :SE_SetProps {
		event_handlers = [
			{focus freeplay_focus_mic_preference_menu_element params = {mic_preference = <this_mic_preference> controller = <controller> player = <player>}}
			{unfocus freeplay_unfocus_mic_preference_menu_element params = {mic_preference = <this_mic_preference> controller = <controller>}}
			{pad_back freeplay_mic_preference_menu_back params = {player = <player>}}
			{pad_choose UI_SFX_Freeplay params = {type = instrument player = <player>}}
			{pad_choose freeplay_mic_preference_jump_player_in params = {mic_preference = <this_mic_preference> player = <player>}}
		]
	}
	<id> :freeplay_unfocus_menu_element time = 0
	<id> :Obj_SpawnScript freeplay_mic_preference_menu_update_element_state params = {mic_preference = <this_mic_preference> controller = <controller> player = <player>}
	idx = (<idx> + 1)
	repeat <array_size>
	freeplay_set_menu_background_dims menu_parent = <menu_parent> menu_width = <menu_width>
	freeplay_set_menu_highlight_dims menu_id = <menu_id> menu_width = <menu_width> num_elements = <array_size>
	LaunchEvent type = focus target = <menu_id> data = {child_index = <player_mic_preference_idx>}
	<menu_id> :Obj_SpawnScript freeplay_mic_preference_menu_update_state params = {player = <player>}
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
	if IsScreenElementInFocus id = <objID>
		freeplay_focus_menu_element grayed_out = <grayed_out>
	else
		freeplay_unfocus_menu_element grayed_out = <grayed_out>
	endif
	wait \{0.5
		seconds}
	repeat
endscript

script freeplay_mic_preference_menu_update_state 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> controller
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
	UI_SFX_Freeplay player = <player> type = drop
	destroy_freeplay_mic_preference_menu player = <player>
	freeplay_drop_player_out player = <player>
endscript

script destroy_freeplay_connect_mic_menu 
	get_highway_hud_menu_parent player = <player>
	DestroyScreenElement id = {<menu_parent> child = freeplay_menu}
endscript

script create_freeplay_connect_mic_menu 
	GetPlayerInfo <player> controller
	if freeplay_is_headset_allowed_for_vocals
		message_text = qs(0x057800ff)
	else
		message_text = qs(0x663f51cd)
	endif
	get_highway_hud_menu_parent player = <player>
	CreateScreenElement {
		parent = <menu_parent>
		type = DescInterface
		local_id = freeplay_menu
		desc = 'freeplay_highway_menu'
		Pos = (0.0, 0.0)
		autoSizeDims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
		message_text = <message_text>
	}
	connect_mic_menu_id = <id>
	<connect_mic_menu_id> :SE_SetProps alpha = 1 time = 0.3
	<connect_mic_menu_id> :Desc_ResolveAlias name = alias_Menu param = message_id
	ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
	<resolved_id> :SE_SetProps light_box_dims = (300.0, 260.0)
	<message_id> :SE_SetProps {
		event_handlers = [
			{event_mic_connected freeplay_connect_mic_menu_mic_connected params = {player = <player>}}
			{pad_back freeplay_connect_mic_menu_back params = {player = <player>}}
		]
	}
	LaunchEvent type = focus target = <message_id>
	<message_id> :Obj_SpawnScript freeplay_connect_mic_menu_update_state params = {player = <player>}
endscript

script freeplay_connect_mic_menu_update_state 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> controller
	Obj_GetID
	OnExitRun \{freeplay_connect_mic_menu_update_state_exit}
	RequestMicDetection \{enable = true}
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
	LaunchEvent type = event_mic_connected target = <objID>
	repeat
endscript

script freeplay_connect_mic_menu_update_state_exit 
	RequestMicDetection \{enable = false}
endscript

script freeplay_connect_mic_menu_mic_connected 
	SE_GetProps
	if (<events_blocked> = 1)
		return
	endif
	destroy_freeplay_connect_mic_menu player = <player>
	create_freeplay_mic_preference_menu player = <player>
endscript

script freeplay_connect_mic_menu_back 
	destroy_freeplay_connect_mic_menu player = <player>
	UI_SFX_Freeplay type = drop player = <player>
	freeplay_drop_player_out player = <player>
endscript

script freeplay_destroy_all_possible_menus 
	RequireParams \{[
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
	DestroyScreenElement id = {<menu_parent> child = freeplay_menu}
endscript

script create_freeplay_menu 
	RequireParams \{[
			menu_state
			player
		]
		all}
	GetPlayerInfo <player> controller
	menu_entries = ($freeplay_menu_states.<menu_state>.entries)
	entry_focus_scr = ($freeplay_menu_states.<menu_state>.entry_focus_scr)
	if GotParam \{entry_focus_scr}
		<entry_focus_scr> player = <player>
		menu_focus_idx = <focus_idx>
	endif
	get_highway_hud_menu_parent player = <player>
	CreateScreenElement {
		parent = <menu_parent>
		type = DescInterface
		local_id = freeplay_menu
		desc = 'freeplay_highway_menu'
		Pos = (0.0, 0.0)
		autoSizeDims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
	}
	desc_id = <id>
	<desc_id> :SE_SetProps alpha = 1 time = 0.3
	<desc_id> :Desc_ResolveAlias name = alias_Menu param = menu_id
	<menu_id> :SE_SetProps {
		event_handlers = [
			{menu_selection_changed UI_SFX_Freeplay params = {type = up player = <player>}}
		]
	}
	menu_width = 0
	idx = 0
	focus_idx = 0
	GetArraySize \{menu_entries}
	begin
	include_entry = true
	if StructureContains structure = (<menu_entries> [<idx>]) condition_scr
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
		<id> :SE_SetProps {
			event_handlers = [
				{focus freeplay_focus_menu_element}
				{unfocus freeplay_unfocus_menu_element}
				{pad_back UI_SFX_Freeplay params = {type = back player = <player>}}
				{pad_back freeplay_menu_pop params = {player = <player>}}
				{pad_choose UI_SFX_Freeplay params = {type = select player = <player>}}
				{pad_choose (<menu_entries> [<idx>].Scr) params = ({player = <player> focus_idx = <focus_idx> (<menu_entries> [<idx>].params)})}
			]
		}
		<id> :freeplay_unfocus_menu_element time = 0
		focus_idx = (<focus_idx> + 1)
	endif
	idx = (<idx> + 1)
	repeat <array_size>
	freeplay_set_menu_background_dims menu_parent = <menu_parent> menu_width = <menu_width>
	freeplay_set_menu_highlight_dims menu_id = <menu_id> menu_width = <menu_width> num_elements = <array_size>
	LaunchEvent type = focus target = <menu_id> data = {child_index = <menu_focus_idx>}
endscript

script freeplay_init_menu_state_stack 
	RequireParams \{[
			player
		]
		all}
	get_highway_hud_menu_parent player = <player>
	<menu_parent> :SetTags {
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
	RequireParams \{[
			player
		]
		all}
	get_highway_hud_menu_parent player = <player>
	<menu_parent> :GetSingleTag freeplay_menu_state_stack
	<menu_parent> :GetSingleTag freeplay_menu_state_stack_top
	return {
		freeplay_menu_state_stack_top = <freeplay_menu_state_stack_top>
		freeplay_menu_state_stack = <freeplay_menu_state_stack>
	}
endscript

script freeplay_set_menu_state_stack 
	RequireParams \{[
			player
			freeplay_menu_state_stack
			freeplay_menu_state_stack_top
		]
		all}
	get_highway_hud_menu_parent player = <player>
	<menu_parent> :SetTags {
		freeplay_menu_state_stack_top = <freeplay_menu_state_stack_top>
		freeplay_menu_state_stack = <freeplay_menu_state_stack>
	}
endscript

script freeplay_menu_push 
	RequireParams \{[
			state
			player
		]
		all}
	destroy_freeplay_menu player = <player>
	freeplay_get_menu_state_stack player = <player>
	if GotParam \{focus_idx}
		current_state = (<freeplay_menu_state_stack> [(<freeplay_menu_state_stack_top> - 1)].state)
		SetArrayElement arrayName = freeplay_menu_state_stack index = (<freeplay_menu_state_stack_top> - 1) newValue = {state = <current_state> focus_idx = <focus_idx>}
	endif
	SetArrayElement arrayName = freeplay_menu_state_stack index = <freeplay_menu_state_stack_top> newValue = {state = <state>}
	freeplay_menu_state_stack_top = (<freeplay_menu_state_stack_top> + 1)
	freeplay_set_menu_state_stack player = <player> {
		freeplay_menu_state_stack = <freeplay_menu_state_stack>
		freeplay_menu_state_stack_top = <freeplay_menu_state_stack_top>
	}
	create_freeplay_menu player = <player> menu_state = <state>
endscript

script freeplay_menu_pop 
	RequireParams \{[
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

script freeplay_pause_menu_dropout 
	spawnscriptnow freeplay_pause_menu_dropout_ignore_go_to_main_menu_for_one_frame params = {player = <player>}
	destroy_freeplay_menu player = <player>
	UI_SFX_Freeplay type = drop player = <player>
	freeplay_drop_player_out player = <player>
endscript

script freeplay_pause_menu_dropout_ignore_go_to_main_menu_for_one_frame 
	OnExitRun freeplay_pause_menu_dropout_ignore_go_to_main_menu_for_one_frame_on_exit_run params = {player = <player>}
	freeplay_join_event_handler :GetSingleTag \{ignore_go_to_main_menu_for_players}
	SetArrayElement arrayName = ignore_go_to_main_menu_for_players index = (<player> - 1) newValue = true
	freeplay_join_event_handler :SetTags ignore_go_to_main_menu_for_players = <ignore_go_to_main_menu_for_players>
	wait \{1
		gameframe}
endscript

script freeplay_pause_menu_dropout_ignore_go_to_main_menu_for_one_frame_on_exit_run 
	if NOT ScreenElementExists \{id = freeplay_join_event_handler}
		return
	endif
	freeplay_join_event_handler :GetSingleTag \{ignore_go_to_main_menu_for_players}
	SetArrayElement arrayName = ignore_go_to_main_menu_for_players index = (<player> - 1) newValue = false
	freeplay_join_event_handler :SetTags ignore_go_to_main_menu_for_players = <ignore_go_to_main_menu_for_players>
endscript

script freeplay_pause_menu_difficulty 
	destroy_freeplay_menu player = <player>
	create_freeplay_difficulty_menu player = <player> back_target = pause_menu
endscript

script freeplay_pause_menu_full_pause 
	RequireParams \{[
			player
		]
		all}
	destroy_freeplay_menu player = <player>
	freeplay_resume_player player = <player>
	gh3_start_pressed device_num = <device_num> from_handler really_pause
endscript

script freeplay_pause_menu_songlist_pause 
	RequireParams \{[
			player
			pause_type
		]
		all}
	StopRendering
	destroy_freeplay_menu player = <player>
	freeplay_resume_player player = <player>
	GMan_SongFunc \{func = get_current_song}
	freeplay_prepare_for_pause
	gh3_start_pressed {
		device_num = <device_num>
		from_handler
		really_pause
		pause_ui_state = UIstate_freeplay_pause
		pause_ui_state_params = {
			pause_type = <pause_type>
			previous_first_song = <current_song>
			player = <player>
		}
	}
endscript

script ui_create_freeplay_pause \{songlist_change_canceled = false}
	if NOT GotParam \{old_base_name}
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
				GMan_SongFunc \{func = get_current_song}
				if (<current_song> != <previous_first_song>)
					restart_song_required = true
				endif
			endif
		endif
		spawnscriptnow freeplay_unpause_spawned params = {restart_song_required = <restart_song_required>}
	endif
endscript

script freeplay_pause_spawned 
	RequireParams \{[
			songlist_mode
			player
		]
		all}
	disable_pause
	if (<songlist_mode> = playlist)
		GMan_SongFunc \{func = get_playlist_size}
		array = []
		index = 0
		begin
		GMan_SongFunc func = get_songname_by_index params = {index = <index>}
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
	GetPlayerInfo <player> controller
	ui_event_wait event = menu_change data = {state = uistate_songlist mode = <songlist_mode> exclusive_device = <controller>}
endscript

script freeplay_unpause_spawned 
	if (<restart_song_required> = true)
		set_all_highway_prepass_props \{alpha = 0}
		set_all_highway_props \{alpha = 0}
		hide_glitch \{num_frames = 30}
	endif
	ui_event_wait_for_safe
	Menu_Music_Off
	freeplay_prepare_for_unpause
	if (<restart_song_required> = true)
		play_cameracut \{prefix = 'cameras_no_band'}
		kill_gem_scroller \{restarting
			freeplay_visualizer_hack}
		Change \{gameplay_restart_song = 1}
		Change \{gameplay_loading_transition = 1}
		generic_event_back \{nosound
			state = uistate_gameplay}
		freeplay_end_of_song
		freeplay_unpause_sound
	else
		gh3_start_pressed \{from_handler}
	endif
endscript

script freeplay_prepare_for_pause \{hide_hud = true}
	GameMode_GetType
	if NOT (<type> = freeplay)
		return
	endif
	freeplay_disable_menus \{defer_system_notifications_while_disabled = false}
	if (<hide_hud> = true)
		safe_hide \{id = highway_root_window}
		safe_hide \{id = vocals_highway_root}
		safe_hide \{id = hud_root}
		GetMaxLocalPlayers
		player = 1
		begin
		get_highway_hud_menu_parent player = <player>
		if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu}
			<resolved_id> :SE_SetProps ignore_parent_alpha = false
		endif
		if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
			<resolved_id> :SE_SetProps ignore_parent_alpha = false
		endif
		if ResolveScreenElementID id = {<menu_parent> child = results_panel}
			<resolved_id> :SE_SetProps ignore_parent_alpha = false
		endif
		player = (<player> + 1)
		repeat <max_players>
	endif
	if ScreenElementExists \{id = intro_container}
		intro_container :freeplay_pause_fade_out_intro
	endif
endscript

script freeplay_prepare_for_unpause 
	GameMode_GetType
	if NOT (<type> = freeplay)
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
	GetMaxLocalPlayers
	player = 1
	begin
	get_highway_hud_menu_parent player = <player>
	if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu}
		<resolved_id> :SE_SetProps ignore_parent_alpha = true
	endif
	if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
		<resolved_id> :SE_SetProps ignore_parent_alpha = true
	endif
	if ResolveScreenElementID id = {<menu_parent> child = results_panel}
		<resolved_id> :SE_SetProps ignore_parent_alpha = true
	endif
	player = (<player> + 1)
	repeat <max_players>
endscript

script freeplay_pause_fade_out_intro 
	SE_SetProps \{song_intro_container_alpha = 0.0}
endscript

script freeplay_unpause_fade_in_intro 
	SE_SetProps \{song_intro_container_alpha = 1.0
		time = 1.0}
endscript

script freeplay_focus_menu_element \{grayed_out = false
		time = 0.15}
	if (<grayed_out> = false)
		item_text_rgba = [10 10 10 255]
	else
		item_text_rgba = [100 100 100 255]
	endif
	SE_SetProps highlight_btn_alpha = 0.9 item_text_rgba = <item_text_rgba> time = <time>
	SE_SetProps \{item_text_font = fontgrid_title_a1}
	if
		Obj_SpawnScript create_ui_highlight_particles params = {Pos = (642.0, 0.0) z = 26 parent = <highlight_btn_id> start_scale = (0.05, 0.05) end_scale = (0.1, 0.1) emit_spread = 3 velocity = 1.0}
	else
		ScriptAssert \{'UI_art'}
	endif
endscript

script freeplay_unfocus_menu_element \{grayed_out = false
		time = 0.15}
	if (<grayed_out> = false)
		item_text_rgba = [198 165 255 255]
	else
		item_text_rgba = [100 100 100 255]
	endif
	SE_SetProps highlight_btn_alpha = 0 item_text_rgba = <item_text_rgba> time = <time>
endscript

script freeplay_create_highway_element 
	CreateScreenElement {
		parent = <parent>
		type = DescInterface
		desc = 'freeplay_highway_menu_element'
		item_text_text = <text>
		internal_just = [center , center]
		autoSizeDims = true
	}
	<id> :Desc_ResolveAlias name = alias_item_text param = text_id
	<text_id> :SE_GetProps
	text_internal_scale = <internal_scale>
	ResolveScreenElementID id = {<text_id> child = 0}
	<resolved_id> :SE_GetProps
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
	light_box_dims = (<background_width> * (1.0, 0.0) + (0.0, 260.0))
	ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
	<resolved_id> :SE_SetProps light_box_dims = <light_box_dims>
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
	light_bar_dims = ((<light_bar_width> * (1.0, 0.0)) + (0.0, 200.0))
	idx = 0
	begin
	ResolveScreenElementID id = {<menu_id> child = <idx>}
	<resolved_id> :SE_SetProps light_bar_dims = <light_bar_dims>
	idx = (<idx> + 1)
	repeat <num_elements>
endscript

script freeplay_calculate_precent_notes_hit 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> part
	if (<part> = vocals)
		GetPlayerInfo <player> vocal_phrase_quality
		GetPlayerInfo <player> vocal_phrase_fp_max_qual
		if (<vocal_phrase_fp_max_qual> > 0)
			percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_fp_max_qual>) * 100.0)
			mathFloor <percent_notes_hit>
			<percent_notes_hit> = <floor>
			if (<percent_notes_hit> = 0 && <vocal_phrase_quality> > 0)
				<percent_notes_hit> = 1
			endif
		else
			<percent_notes_hit> = 0
		endif
		mathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
	else
		GetPlayerInfo <player> notes_hit
		GetPlayerInfo <player> notes_created
		if (<notes_created> > 0)
			percent_notes_hit = (100.0 * <notes_hit> / <notes_created>)
		else
			percent_notes_hit = 0
		endif
		mathFloor <percent_notes_hit>
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
		SoundEvent \{event = EndOfSong_Camera_Cheer}
		freeplay_get_first_active_player
		begin
		get_highway_hud_menu_parent player = <player>
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
			type = DescInterface
			local_id = results_panel
			desc = 'freeplay_results'
			Pos = (0.0, 0.0)
			autoSizeDims = true
			pos_anchor = [center , bottom]
			just = [center , bottom]
			ignore_parent_alpha = true
			alpha = 0
			scale = <overall_scale>
		}
		freeplay_calculate_precent_notes_hit player = <player>
		FormatText TextName = score_text qs(0xcfd55336) s = <percent_notes_hit>
		GetPlayerInfo <player> score
		CastToInteger \{score}
		FormatText TextName = score_amount_text qs(0x4d4555da) s = <score>
		<id> :SE_SetProps score_text = <score_text> score_amount_text = <score_amount_text> alpha = 1 time = 1
		get_highway_hud_menu_parent player = <player>
		<menu_parent> :Obj_KillSpawnedScript name = freeplay_dropout_player_if_inactive
		<menu_parent> :Obj_KillSpawnedScript name = freeplay_controller_pulling_observer
		<menu_parent> :Obj_KillSpawnedScript name = freeplay_debounce_starpower
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
		if ResolveScreenElementID id = {<menu_parent> child = results_panel}
			<resolved_id> :SE_SetProps alpha = 0 time = 1
		endif
		freeplay_get_next_active_player player = <player>
		repeat <num_active_players>
	endif
endscript

script freeplay_disable_menus \{defer_system_notifications_while_disabled = true}
	destroy_freeplay_jump_in_event_handler
	if (<defer_system_notifications_while_disabled> = true)
		GameMode_GetType
		if (<type> = freeplay)
			if ($freeplay_deferring_system_notification = false)
				StartDelaySystemUI
				Change \{freeplay_deferring_system_notification = true}
			endif
		endif
	endif
	if ($view_mode != 0)
		return
	endif
	freeplay_get_num_active_players
	if (<num_active_players> > 0)
		freeplay_get_first_active_player
		begin
		get_highway_hud_menu_parent player = <player>
		if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu}
			<resolved_id> :SE_SetProps block_events alpha = 0 time = 1
		endif
		if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
			<resolved_id> :SE_SetProps alpha = 0 time = 1
		endif
		freeplay_get_next_active_player player = <player>
		repeat <num_active_players>
	endif
endscript

script freeplay_enable_menus 
	if GameIsPaused
		return
	endif
	create_freeplay_jump_in_event_handler freeplay_auto_join_device = <freeplay_auto_join_device>
	if ($freeplay_deferring_system_notification = true)
		StopDelaySystemUI
		Change \{freeplay_deferring_system_notification = false}
	endif
	freeplay_get_num_active_players
	if (<num_active_players> > 0)
		freeplay_get_first_active_player
		begin
		get_highway_hud_menu_parent player = <player>
		if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu}
			<resolved_id> :SE_SetProps unblock_events alpha = 1 time = 1
			<resolved_id> :Desc_ResolveAlias name = alias_Menu param = menu_id
			LaunchEvent type = focus target = <menu_id>
			<menu_id> :Menu_GetSelectedIndex
			ResolveScreenElementID id = {<menu_id> child = <selected_index>}
			LaunchEvent type = focus target = <resolved_id>
		endif
		if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
			<resolved_id> :SE_SetProps alpha = 1 time = 1
		endif
		freeplay_get_next_active_player player = <player>
		repeat <num_active_players>
	endif
endscript

script freeplay_pause_difficulty_entry_focus 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> difficulty
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
		GetPlayerInfo <player> part
		if (<part> = Drum)
			GetPlayerInfo <player> double_kick_drum
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
			player
			difficulty
		]
		all}
	if (<difficulty> = expert_plus)
		SetPlayerInfo <player> double_kick_drum = 1
		difficulty = expert
	else
		SetPlayerInfo <player> double_kick_drum = 0
	endif
	SetPlayerInfo <player> difficulty = <difficulty>
	freeplay_pause_menu_resume player = <player>
endscript

script freeplay_pause_instrument_entry_focus 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> part
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
			player
			part
		]
		all}
	if NOT PlayerInfoEquals <player> part = <part>
		freeplay_set_player_part player = <player> part = <part>
		SetPlayerInfo <player> star_power_amount = 0
		SetPlayerInfo <player> current_run = 0
		ResetPlayerNoteStreak player = <player>
		UpdateRunChange player = <player>
	endif
	freeplay_pause_menu_resume player = <player>
endscript

script freeplay_pause_lefty_entry_focus 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> lefty_flip
	return focus_idx = <lefty_flip>
endscript

script freeplay_pause_choose_lefty 
	RequireParams \{[
			player
			lefty_flip
		]
		all}
	SetPlayerInfo <player> lefty_flip = <lefty_flip>
	SetPlayerInfo <player> lefthanded_gems = <lefty_flip>
	SetPlayerInfo <player> lefthanded_button_ups = <lefty_flip>
	refresh_button_models player = <player>
	freeplay_pause_menu_resume player = <player>
endscript

script freeplay_condition_lefty_flip 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> part
	switch <part>
		case guitar
		case bass
		case Drum
		return \{true}
	endswitch
	return \{false}
endscript

script freeplay_condition_instrument 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> part
	switch <part>
		case guitar
		case bass
		return \{true}
	endswitch
	return \{false}
endscript

script freeplay_condition_expert_plus 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> part
	switch <part>
		case Drum
		if any_song_has_double_kick
			return \{true}
		endif
	endswitch
	return \{false}
endscript

script freeplay_condition_options 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> part
	switch <part>
		case guitar
		case bass
		case Drum
		return \{true}
	endswitch
	return \{false}
endscript

script freeplay_condition_no_options 
	RequireParams \{[
			player
		]
		all}
	if NOT freeplay_condition_options player = <player>
		return \{true}
	endif
	return \{false}
endscript

script freeplay_setup_highway_menu_background 
	RequireParams \{[
			player
		]
		all}
	get_highway_hud_menu_parent player = <player>
	if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
		return true menu_background_id = <resolved_id>
	endif
	if ScreenElementExists id = <menu_parent>
		CreateScreenElement {
			parent = <menu_parent>
			type = DescInterface
			local_id = freeplay_menu_background
			desc = 'freeplay_highway_menu_background'
			Pos = (0.0, 0.0)
			autoSizeDims = true
			pos_anchor = [center , bottom]
			just = [center , bottom]
			ignore_parent_alpha = true
			alpha = 1
			light_box_dims = (300.0, 260.0)
		}
		return true menu_background_id = <id>
	endif
	return \{false}
endscript
