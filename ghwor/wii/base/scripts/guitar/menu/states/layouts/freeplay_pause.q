
script freeplay_show_highway_helpers 
	RequireParams \{[
			Player
		]
		all}
	formatText checksumName = helper_id 'highway_helperp%p' p = <Player>
	if ScreenElementExists id = <helper_id>
		<helper_id> :se_setprops alpha = 1 time = 0.3
	endif
endscript

script freeplay_hide_highway_helpers 
	RequireParams \{[
			Player
		]
		all}
	formatText checksumName = helper_id 'highway_helperp%p' p = <Player>
	if ScreenElementExists id = <helper_id>
		<helper_id> :se_setprops alpha = 0
	endif
endscript

script freeplay_update_highway_helpers 
endscript

script destroy_freeplay_instrument_menu 
	get_highway_hud_menu_parent Player = <Player>
	DestroyScreenElement id = {<menu_parent> child = freeplay_menu}
	freeplay_hide_highway_helpers Player = <Player>
endscript

script create_freeplay_instrument_menu 
	get_actual_controller Player = <Player>
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
		Scale = ($freeplay_menu_scale)
	}
	instrument_menu_id = <id>
	<instrument_menu_id> :se_setprops alpha = 1 time = 0.3
	<instrument_menu_id> :desc_resolvealias Name = alias_menu param = menu_id
	<menu_id> :se_setprops {
		event_handlers = [
			{menu_selection_changed audio_ui_freeplay_play_sfx params = {Type = up Player = <Player>}}
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
			{pad_choose audio_ui_freeplay_play_sfx params = {Type = instrument Player = <Player>}}
			{pad_choose freeplay_instrument_jump_player_in params = {instrument = (<instrument_menu_entries> [<idx>].instrument) Player = <Player>}}
		]
	}
	<id> :freeplay_unfocus_menu_element time = 0
	idx = (<idx> + 1)
	repeat <array_Size>
	freeplay_set_menu_background_dims menu_parent = <menu_parent> menu_width = <menu_width>
	freeplay_set_menu_highlight_dims menu_id = <menu_id> menu_width = <menu_width> num_elements = <array_Size>
	LaunchEvent Type = focus target = <menu_id>
	freeplay_show_highway_helpers Player = <Player>
endscript

script freeplay_instrument_menu_back 
	destroy_freeplay_instrument_menu Player = <Player>
	audio_ui_freeplay_play_sfx Type = drop Player = <Player>
	freeplay_drop_player_out Player = <Player>
	freeplay_hide_highway_helpers Player = <Player>
endscript

script destroy_freeplay_difficulty_menu 
	SpawnScriptNow \{audio_auto_mic_check}
	get_highway_hud_menu_parent Player = <Player>
	DestroyScreenElement id = {<menu_parent> child = freeplay_menu}
	freeplay_hide_highway_helpers Player = <Player>
endscript

script create_freeplay_difficulty_menu 
	get_actual_controller Player = <Player>
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
		Type = menuelement
		local_id = freeplay_menu
		Pos = (-10.0, -16.0)
		autosizedims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		internal_just = [center , center]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
		isvertical = FALSE
		spacing_between = 5
		Scale = ($freeplay_menu_scale)
	}
	<horizontal_menu_id> = <id>
	freeplay_add_song_intensity_to_difficulty_menu {
		hmenu_id = <horizontal_menu_id>
		Player = <Player>
	}
	CreateScreenElement {
		parent = <horizontal_menu_id>
		Type = descinterface
		local_id = freeplay_sub_menu
		desc = 'freeplay_highway_menu'
		Pos = (0.0, 0.0)
		dims = (100.0, 200.0)
		autosizedims = true
		pos_anchor = [left , center]
		just = [left , center]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
		Scale = ($freeplay_menu_scale)
	}
	Wait \{1
		gameframe}
	<difficulty_menu_id> = <id>
	<difficulty_menu_id> :se_setprops alpha = 1 time = 0.3
	<horizontal_menu_id> :se_setprops alpha = 1 time = 0.3
	<difficulty_menu_id> :desc_resolvealias Name = alias_menu param = menu_id
	<menu_id> :se_setprops {
		event_handlers = [
			{menu_selection_changed audio_ui_freeplay_play_sfx params = {Type = up Player = <Player>}}
		]
	}
	<difficulty_menu_entries> = [
		{difficulty = beginner text = qs(0x25b2ecac) icon_texture = icon_difficulty_beginner}
		{difficulty = easy text = qs(0xbf7ffd2d) icon_texture = icon_difficulty_easy}
		{difficulty = medium text = qs(0xeac0f52d) icon_texture = icon_difficulty_medium}
		{difficulty = hard text = qs(0x63aae385) icon_texture = icon_difficulty_hard}
		{difficulty = expert text = qs(0xb778e780) icon_texture = icon_difficulty_expert}
	]
	scrolling = 0
	if (<part> = drum)
		if any_song_has_double_kick
			AddArrayElement array = <difficulty_menu_entries> element = {difficulty = expert_plus text = qs(0x739da581) icon_texture = icon_difficulty_expert_plus}
			<difficulty_menu_entries> = <array>
			<scrolling> = 1
		endif
	endif
	<menu_width> = 0
	<idx> = 0
	GetArraySize \{difficulty_menu_entries}
	begin
	if (<difficulty> = <difficulty_menu_entries> [<idx>].difficulty)
		GetArraySize \{difficulty_menu_entries}
		player_difficulty_idx = <idx>
	endif
	freeplay_create_highway_element {
		parent = <menu_id>
		text = (<difficulty_menu_entries> [<idx>].text)
		has_icon = 1
		icon_texture = (<difficulty_menu_entries> [<idx>].icon_texture)
	}
	if (<menu_width> < <element_width>)
		<menu_width> = <element_width>
	endif
	<id> :se_setprops {
		event_handlers = [
			{focus freeplay_focus_menu_element}
			{unfocus freeplay_unfocus_menu_element}
			{pad_back freeplay_difficulty_menu_back params = {Player = <Player> back_target = <back_target>}}
			{pad_choose audio_ui_freeplay_play_sfx params = {Type = select Player = <Player>}}
			{pad_choose freeplay_finish_jump_player_in params = {difficulty = (<difficulty_menu_entries> [<idx>].difficulty) Player = <Player>}}
		]
	}
	<id> :freeplay_unfocus_menu_element time = 0
	<idx> = (<idx> + 1)
	repeat <array_Size>
	if NOT GotParam \{player_difficulty_idx}
		ScriptAssert \{qs(0xac85b027)}
	endif
	freeplay_set_menu_background_dims menu_parent = <menu_parent> menu_width = <menu_width>
	freeplay_set_menu_highlight_dims menu_id = <menu_id> menu_width = <menu_width> num_elements = <array_Size>
	LaunchEvent Type = focus target = <menu_id> data = {child_index = <player_difficulty_idx>}
	freeplay_show_highway_helpers Player = <Player>
endscript

script freeplay_difficulty_menu_back 
	destroy_freeplay_difficulty_menu Player = <Player>
	switch <back_target>
		case dropped
		audio_ui_freeplay_play_sfx Type = drop Player = <Player>
		freeplay_drop_player_out Player = <Player>
		freeplay_hide_highway_helpers Player = <Player>
		case pause_menu
		audio_ui_freeplay_play_sfx Type = back Player = <Player>
		create_freeplay_pause_menu Player = <Player>
		case instrument
		audio_ui_freeplay_play_sfx Type = back Player = <Player>
		create_freeplay_instrument_menu Player = <Player>
		case mic
		audio_ui_freeplay_play_sfx Type = back Player = <Player>
		if demobuild
			freeplay_drop_player_out Player = <Player>
		else
			create_freeplay_mic_preference_menu Player = <Player>
		endif
	endswitch
endscript

script destroy_freeplay_mic_preference_menu 
	get_highway_hud_menu_parent Player = <Player>
	DestroyScreenElement id = {<menu_parent> child = freeplay_menu}
	freeplay_hide_highway_helpers Player = <Player>
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
	getplayerinfo <Player> bot_play
	if (<bot_play> = 1)
		freeplay_mic_preference_jump_player_in Player = <Player> device_num = <controller> mic_preference = mic
		return
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
		Scale = ($freeplay_menu_scale)
	}
	mic_preference_menu_id = <id>
	<mic_preference_menu_id> :se_setprops alpha = 1 time = 0.3
	<mic_preference_menu_id> :desc_resolvealias Name = alias_menu param = menu_id
	<menu_id> :se_setprops {
		event_handlers = [
			{menu_selection_changed audio_ui_freeplay_play_sfx params = {Type = up Player = <Player>}}
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
			{pad_choose audio_ui_freeplay_play_sfx params = {Type = instrument Player = <Player>}}
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
	if demobuild
		<menu_id> :obj_spawnscript freeplay_mic_preference_jump_player_in params = {mic_preference = mic Player = <Player> device_num = <controller>}
	endif
	freeplay_show_highway_helpers Player = <Player>
endscript

script freeplay_determine_mic_preference_grayed_out_state \{mic_preference = !q1768515945
		controller = !i1768515945}
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

script freeplay_focus_mic_preference_menu_element \{mic_preference = !q1768515945
		controller = !i1768515945}
	freeplay_determine_mic_preference_grayed_out_state mic_preference = <mic_preference> controller = <controller>
	freeplay_focus_menu_element grayed_out = <grayed_out>
endscript

script freeplay_unfocus_mic_preference_menu_element \{mic_preference = !q1768515945
		controller = !i1768515945}
	freeplay_determine_mic_preference_grayed_out_state mic_preference = <mic_preference> controller = <controller>
	freeplay_unfocus_menu_element grayed_out = <grayed_out>
endscript

script freeplay_mic_preference_menu_update_element_state \{mic_preference = !q1768515945
		controller = !i1768515945}
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

script freeplay_mic_preference_menu_update_state \{Player = !i1768515945}
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
	audio_ui_freeplay_play_sfx Player = <Player> Type = drop
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
		Scale = ($freeplay_menu_scale)
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

script freeplay_connect_mic_menu_update_state \{Player = !i1768515945}
	getplayerinfo <Player> controller
	Obj_GetID
	OnExitRun \{freeplay_connect_mic_menu_update_state_exit}
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
	audio_ui_freeplay_play_sfx Type = drop Player = <Player>
	freeplay_drop_player_out Player = <Player>
endscript

script freeplay_destroy_all_possible_menus \{Player = !i1768515945}
	destroy_freeplay_instrument_menu Player = <Player>
	destroy_freeplay_difficulty_menu Player = <Player>
	destroy_freeplay_mic_preference_menu Player = <Player>
	destroy_freeplay_connect_mic_menu Player = <Player>
	destroy_freeplay_menu Player = <Player>
endscript

script refresh_freeplay_menu \{menu_state = !q1768515945
		Player = !i1768515945
		focus_idx = 0}
	destroy_freeplay_menu Player = <Player>
	create_freeplay_menu Player = <Player> menu_state = <menu_state> menu_focus_idx = <focus_idx> wtf = <focus_idx>
endscript

script destroy_freeplay_menu 
	get_highway_hud_menu_parent Player = <Player>
	DestroyScreenElement id = {<menu_parent> child = freeplay_menu}
	freeplay_hide_highway_helpers Player = <Player>
endscript

script create_freeplay_menu \{menu_state = !q1768515945
		Player = !i1768515945}
	get_actual_controller Player = <Player>
	<menu_entries> = ($freeplay_menu_states.<menu_state>.entries)
	if NOT GotParam \{menu_entries}
		($freeplay_menu_states.<menu_state>.generate_entries_script) Player = <Player> menu_focus_idx = <menu_focus_idx>
	endif
	GetArraySize \{menu_entries}
	<num_menu_entries> = <array_Size>
	<scrolling> = 0
	<min_entries_for_scrolling> = 7
	if (<menu_state> = venue && <num_menu_entries> >= <min_entries_for_scrolling>)
		<scrolling> = 1
	endif
	getplayerinfo <Player> part
	if (<part> = drum && <menu_state> = difficulty)
		<scrolling> = 1
	endif
	<entry_focus_scr> = ($freeplay_menu_states.<menu_state>.entry_focus_scr)
	if GotParam \{entry_focus_scr}
		<entry_focus_scr> Player = <Player>
		<menu_focus_idx> = <focus_idx>
	endif
	get_highway_hud_menu_parent Player = <Player>
	<highway_menu_parent> = <menu_parent>
	<local_id> = freeplay_menu
	<ignore_parent_alpha> = true
	<has_intensity_menu> = ($freeplay_menu_states.<menu_state>.has_intensity_menu)
	if GotParam \{has_intensity_menu}
		if (<has_intensity_menu> = 1)
			CreateScreenElement {
				parent = <menu_parent>
				Type = menuelement
				local_id = <local_id>
				Pos = (-10.0, -15.0)
				autosizedims = true
				pos_anchor = [center , bottom]
				just = [center , bottom]
				internal_just = [center , center]
				exclusive_device = <controller>
				ignore_parent_alpha = <ignore_parent_alpha>
				alpha = 1
				isvertical = FALSE
				spacing_between = 5
				Scale = ($freeplay_menu_scale)
			}
			<horizontal_menu_id> = <id>
			<highway_menu_parent> = <horizontal_menu_id>
			<local_id> = freeplay_sub_menu
			freeplay_add_song_intensity_to_difficulty_menu {
				hmenu_id = <horizontal_menu_id>
				Player = <Player>
			}
		endif
	endif
	CreateScreenElement {
		parent = <highway_menu_parent>
		Type = descinterface
		local_id = <local_id>
		desc = 'freeplay_highway_menu'
		Pos = (0.0, 0.0)
		autosizedims = true
		pos_anchor = [center , bottom]
		just = [center , bottom]
		exclusive_device = <controller>
		ignore_parent_alpha = true
		alpha = 0
		Scale = ($freeplay_menu_scale)
		menu_pos = (54.0, -250.0)
	}
	<desc_id> = <id>
	<desc_id> :se_setprops alpha = 1 time = 0.3
	<desc_id> :desc_resolvealias Name = alias_menu param = menu_id
	<menu_id> :se_setprops {
		event_handlers = [
			{menu_selection_changed audio_ui_freeplay_play_sfx params = {Type = up Player = <Player>}}
		]
	}
	if (<menu_state> = venue)
		<desc_id> :se_setprops scrollingmenu_pos = (1.0, -185.0)
	endif
	<menu_width> = 0
	<idx> = 0
	<focus_idx> = 0
	GetArraySize \{menu_entries}
	begin
	<include_entry> = true
	if StructureContains structure = (<menu_entries> [<idx>]) condition_scr
		if NOT (<menu_entries> [<idx>].condition_scr) Player = <Player>
			<include_entry> = FALSE
		endif
	endif
	if (<include_entry> = true)
		<has_icon> = 0
		if StructureContains structure = (<menu_entries> [<idx>]) icon_texture
			<has_icon> = 1
		endif
		<disable_audio> = 0
		if StructureContains structure = (<menu_entries> [<idx>]) disable_audio
			<disable_audio> = 1
		endif
		if (<has_icon> = 0)
			freeplay_create_highway_element {
				parent = <menu_id>
				text = (<menu_entries> [<idx>].text)
			}
		else
			freeplay_create_highway_element {
				parent = <menu_id>
				text = (<menu_entries> [<idx>].text)
				has_icon = 1
				icon_texture = (<menu_entries> [<idx>].icon_texture)
			}
		endif
		if (<menu_width> < <element_width>)
			<menu_width> = <element_width>
		endif
		if (<disable_audio> = 0)
			<id> :se_setprops {
				event_handlers = [
					{focus freeplay_focus_menu_element}
					{unfocus freeplay_unfocus_menu_element}
					{pad_back audio_ui_freeplay_play_sfx params = {Type = back Player = <Player>}}
					{pad_back freeplay_menu_pop params = {Player = <Player>}}
					{pad_choose audio_ui_freeplay_play_sfx params = {Type = select Player = <Player>}}
					{pad_choose (<menu_entries> [<idx>].Scr) params = ({Player = <Player> focus_idx = <focus_idx> (<menu_entries> [<idx>].params)})}
				]
			}
		else
			<id> :se_setprops {
				event_handlers = [
					{focus freeplay_focus_menu_element}
					{unfocus freeplay_unfocus_menu_element}
					{pad_back audio_ui_freeplay_play_sfx params = {Type = back Player = <Player>}}
					{pad_back freeplay_menu_pop params = {Player = <Player>}}
					{pad_choose (<menu_entries> [<idx>].Scr) params = ({Player = <Player> focus_idx = <focus_idx> (<menu_entries> [<idx>].params)})}
				]
			}
		endif
		<id> :freeplay_unfocus_menu_element time = 0
		<focus_idx> = (<focus_idx> + 1)
	endif
	<idx> = (<idx> + 1)
	repeat <array_Size>
	freeplay_set_menu_background_dims menu_parent = <menu_parent> menu_width = <menu_width>
	freeplay_set_menu_highlight_dims menu_id = <menu_id> menu_width = <menu_width> num_elements = <array_Size>
	LaunchEvent Type = focus target = <menu_id> data = {child_index = <menu_focus_idx>}
	freeplay_show_highway_helpers Player = <Player>
endscript

script freeplay_add_song_intensity_to_difficulty_menu \{hmenu_id = !q1768515945
		Player = !i1768515945}
	playlist_getcurrentsong
	get_song_difficulty_ratings song = <current_song>
	<max_intensity> = 10
	getplayerinfo <Player> part
	switch <part>
		case guitar
		<intensity_value> = <guitar_difficulty_rating>
		case bass
		<intensity_value> = <bass_difficulty_rating>
		case drum
		<intensity_value> = <drums_difficulty_rating>
		case vocals
		<intensity_value> = <vocals_difficulty_rating>
		default
		SoftAssert 'Part not found: %p for Party Play difficulty menu' p = <part>
	endswitch
	formatText checksumName = instrument_out 'icon_%i_out' i = ($instrument_list.<part>.text_nl)
	formatText checksumName = instrument_fill 'icon_%i_fill' i = ($instrument_list.<part>.text_nl)
	CreateScreenElement {
		parent = <hmenu_id>
		Type = descinterface
		desc = 'freeplay_highway_song_intensity_menu'
		local_id = intensity_sub_menu
		autosizedims = true
		Pos = (0.0, 0.0)
		pos_anchor = [left , top]
		just = [left , top]
		alpha = 0
		freeplay_song_intensity_instr_out_texture = <instrument_out>
		freeplay_song_intensity_instr_fill_texture = <instrument_fill>
		ignore_parent_alpha = true
	}
	<id> :se_setprops alpha = 1 time = 0.3
	<on_rgba> = [45 100 110 255]
	<off_rgba> = [255 255 255 255]
	<off_alpha> = 1
	<on_alpha> = 0.0
	<intensity_idx> = 1
	begin
	<intensity_struct> = {}
	formatText checksumName = intensity_tick_rgba_id 'freeplay_song_intensity_%a_rgba' a = <intensity_idx>
	formatText checksumName = intensity_tick_alpha_id 'freeplay_song_intensity_%a_alpha' a = <intensity_idx>
	if (<intensity_idx> <= <intensity_value>)
		AddParam structure_name = intensity_struct Name = <intensity_tick_rgba_id> value = <on_rgba>
		AddParam structure_name = intensity_struct Name = <intensity_tick_alpha_id> value = <on_alpha>
	else
		AddParam structure_name = intensity_struct Name = <intensity_tick_rgba_id> value = <off_rgba>
		AddParam structure_name = intensity_struct Name = <intensity_tick_alpha_id> value = <off_alpha>
	endif
	<id> :se_setprops {
		<intensity_struct>
	}
	<intensity_idx> = (<intensity_idx> + 1)
	repeat <max_intensity>
endscript

script freeplay_init_menu_state_stack \{Player = !i1768515945}
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

script freeplay_get_menu_state_stack \{Player = !i1768515945}
	get_highway_hud_menu_parent Player = <Player>
	<menu_parent> :GetSingleTag freeplay_menu_state_stack
	<menu_parent> :GetSingleTag freeplay_menu_state_stack_top
	return {
		freeplay_menu_state_stack_top = <freeplay_menu_state_stack_top>
		freeplay_menu_state_stack = <freeplay_menu_state_stack>
	}
endscript

script freeplay_set_menu_state_stack \{Player = !i1768515945
		freeplay_menu_state_stack = !a1768515945
		freeplay_menu_state_stack_top = !i1768515945}
	get_highway_hud_menu_parent Player = <Player>
	<menu_parent> :SetTags {
		freeplay_menu_state_stack_top = <freeplay_menu_state_stack_top>
		freeplay_menu_state_stack = <freeplay_menu_state_stack>
	}
endscript

script freeplay_menu_push \{state = !q1768515945
		Player = !i1768515945}
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

script freeplay_menu_pop \{Player = !i1768515945}
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
	audio_ui_freeplay_play_sfx Type = drop Player = <Player>
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

script freeplay_pause_menu_full_pause \{Player = !i1768515945}
	destroy_freeplay_menu Player = <Player>
	freeplay_resume_player Player = <Player>
	audience_party_hide_playlist_popup
	gh_start_pressed device_num = <device_num> from_handler really_pause
endscript

script freeplay_pause_menu_songlist_pause \{Player = !i1768515945
		pause_type = !q1768515945}
	hide_glitch \{num_frames = 7}
	StopRendering
	active_player = <Player>
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	if NOT playerinfoequals <Player> freeplay_state = dropped
		destroy_freeplay_menu Player = <Player>
		freeplay_resume_player Player = <Player>
	endif
	getnextplayer Player = <Player> on_screen
	repeat <num_players_shown>
	playlist_getcurrentsong
	freeplay_prepare_for_pause \{increment_ref_count = FALSE}
	gh_start_pressed {
		device_num = <device_num>
		from_handler
		really_pause
		pause_ui_state = uistate_freeplay_pause
		pause_ui_state_params = {
			pause_type = <pause_type>
			previous_first_song = <current_song>
			Player = <active_player>
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
				playlist_getcurrentsong
				if (<current_song> != <previous_first_song>)
					restart_song_required = true
				endif
			endif
		endif
		SpawnScriptNow freeplay_unpause_spawned params = {restart_song_required = <restart_song_required>}
	endif
endscript

script freeplay_pause_spawned \{Player = !i1768515945
		songlist_mode = !q1768515945}
	audio_ui_menu_music_off
	disable_pause
	if (<songlist_mode> = playlist)
		playlist_getsize
		<array> = []
		<index> = 0
		begin
		playlist_getsongname index = <index>
		AddArrayElement array = <array> element = <requested_song_name>
		<index> = (<index> + 1)
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
	DestroyScreenElement \{id = freeplay_ds_helper_pill}
	DestroyScreenElement \{id = freeplay_extra_helper_pill_menu}
	getplayerinfo <Player> controller
	pushdisablerendering \{context = going_into_songlist
		Type = unchecked}
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
	audio_ui_menu_music_off
	freeplay_prepare_for_unpause
	if (<restart_song_required> = true)
		play_cameracut \{prefix = 'cameras_no_band'}
		kill_gem_scroller \{restarting
			freeplay_visualizer_hack}
		Change \{gameplay_restart_song = 1}
		Change \{gameplay_loading_transition = 1}
		generic_event_back \{state = Uistate_gameplay}
		freeplay_end_of_song
		freeplay_unpause_sound
		UnpauseSoundsByBuss \{Master}
		Change \{gh_pause_ui_called = 0}
	else
		gh_start_pressed \{from_handler}
	endif
endscript

script freeplay_prepare_for_pause \{hide_hud = true
		increment_ref_count = true}
	gamemode_gettype
	if NOT (<Type> = freeplay)
		return
	endif
	freeplay_disable_menus defer_system_notifications_while_disabled = FALSE increment_ref_count = <increment_ref_count>
	if (<hide_hud> = true)
		set_all_highway_prepass_props \{alpha = 0.0}
		safe_hide \{id = highway_root_window}
		safe_hide \{id = vocals_highway_root}
		safe_hide \{id = hud_root}
		getmaxlocalplayers
		Player = 1
		begin
		get_highway_hud_menu_parent Player = <Player>
		if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu}
			<resolved_id> :se_setprops ignore_parent_alpha = FALSE
			if ResolveScreenElementID id = {<resolved_id> child = freeplay_sub_menu} param = out
				<out> :se_setprops ignore_parent_alpha = FALSE
			endif
			if ResolveScreenElementID id = {<resolved_id> child = intensity_sub_menu} param = out
				<out> :se_setprops ignore_parent_alpha = FALSE
			endif
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
		intro_container :freeplay_pause_fade_out_intro
	endif
endscript

script freeplay_prepare_for_unpause 
	gamemode_gettype
	if NOT (<Type> = freeplay)
		return
	endif
	sap_setmastervolume \{vol = -100}
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
		if ResolveScreenElementID id = {<resolved_id> child = freeplay_sub_menu} param = out
			<out> :se_setprops ignore_parent_alpha = true
		endif
		if ResolveScreenElementID id = {<resolved_id> child = intensity_sub_menu} param = out
			<out> :se_setprops ignore_parent_alpha = true
		endif
	endif
	if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
		<resolved_id> :se_setprops ignore_parent_alpha = true
	endif
	if ResolveScreenElementID id = {<menu_parent> child = results_panel}
		<resolved_id> :se_setprops ignore_parent_alpha = true
	endif
	Player = (<Player> + 1)
	repeat <max_players>
	set_all_highway_prepass_props \{alpha = 1.0}
	SpawnScriptNow \{spawned_waiting_then_fading_in_from_unpausing_freeplay}
endscript

script spawned_waiting_then_fading_in_from_unpausing_freeplay 
	Wait \{1
		gameframe}
	sap_setmastervolume \{vol = 0
		time = 0.5}
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
		item_text_rgba = ntscwhite
	else
		item_text_rgba = gh6_gold
	endif
	se_setprops highlight_btn_alpha = 0.5 item_text_rgba = <item_text_rgba> time = <time>
endscript

script freeplay_unfocus_menu_element \{grayed_out = FALSE
		time = 0.15}
	if (<grayed_out> = FALSE)
		item_text_rgba = gh6_gold
	else
		item_text_rgba = [100 100 100 255]
	endif
	se_setprops highlight_btn_alpha = 0 item_text_rgba = <item_text_rgba> time = <time>
endscript

script freeplay_create_highway_element \{has_icon = 0}
	if (<has_icon> = 0)
		<highway_element_desc> = 'freeplay_highway_menu_element'
	else
		if NOT GotParam \{icon_texture}
			ScriptAssert \{'missing icon texture for creating freeplay highway element'}
		endif
		<highway_element_desc> = 'freeplay_highway_menu_element_with_icon'
	endif
	CreateScreenElement {
		parent = <parent>
		Type = descinterface
		desc = <highway_element_desc>
		Pos = (0.0, 0.0)
		pos_anchor = [left , top]
		just = [left , top]
		item_text_text = <text>
		internal_just = [center , center]
		autosizedims = true
	}
	if (<has_icon> = 1)
		<id> :se_setprops {
			item_icon_texture = <icon_texture>
			tags = {
				has_icon = 1
			}
		}
	endif
	<id> :desc_resolvealias Name = alias_item_text param = text_id
	<text_id> :se_getprops
	<text_internal_scale> = <internal_scale>
	ResolveScreenElementID id = {<text_id> child = 0}
	<resolved_id> :se_getprops dims
	<element_width> = (<dims> [0] * <text_internal_scale> [0])
	if (<has_icon> = 1)
		<id> :desc_resolvealias Name = alias_item_icon param = icon_id
		<icon_id> :se_getprops dims
		<icon_width> = (<dims> [0])
		<id> :desc_resolvealias Name = alias_item_menu param = item_menu_id
		<item_menu_id> :se_getprops spacing_between
		<element_width> = (<element_width> + <icon_width> + <spacing_between>)
	endif
	return id = <id> element_width = <element_width>
endscript

script freeplay_set_menu_background_dims \{menu_parent = !q1768515945
		menu_width = !f1768515945}
	background_width = (<menu_width> + 144)
	if (<background_width> < 300)
		background_width = 300
	elseif (<background_width> > 360)
		background_width = 360
	endif
	light_box_dims = (<background_width> * (1.0, 0.0) + (0.0, 320.0))
	ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
	<resolved_id> :se_setprops light_box_dims = <light_box_dims>
endscript

script freeplay_set_menu_highlight_dims \{menu_width = !f1768515945
		menu_id = !q1768515945
		num_elements = !i1768515945}
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

script freeplay_create_stats_ui 
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
		freeplay_get_percent_notes_hit player_index = <Player>
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

script freeplay_get_percent_notes_hit 
	getplayerinfo <player_index> notes_hit
	getplayerinfo <player_index> total_notes
	getplayerinfo <player_index> vocal_phrase_quality
	getplayerinfo <player_index> vocal_phrase_fp_max_qual
	if NOT playerinfoequals <player_index> part = vocals
		if (<total_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <total_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
	else
		printstruct channel = zdebug <...>
		if (<vocal_phrase_fp_max_qual> > 0)
			<percent_notes_hit> = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_fp_max_qual>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
	endif
	MathFloor <percent_notes_hit>
	<percent_notes_hit> = <floor>
	return percent_notes_hit = <percent_notes_hit>
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
			if ResolveScreenElementID id = {<resolved_id> child = freeplay_sub_menu} param = out
				<out> :se_setprops block_events alpha = 0 time = 1
			endif
			if ResolveScreenElementID id = {<resolved_id> child = intensity_sub_menu} param = out
				<out> :se_setprops block_events alpha = 0 time = 1
			endif
		endif
		if ResolveScreenElementID id = {<menu_parent> child = freeplay_menu_background}
			<resolved_id> :se_setprops alpha = 0 time = 1
		endif
		freeplay_get_next_active_player Player = <Player>
		repeat <num_active_players>
	endif
	destroy_dialog_box
endscript

script freeplay_enable_menus 
	Change vv_freeplay_menu_disable_refcnt = (($vv_freeplay_menu_disable_refcnt) - 1)
	if (($vv_freeplay_menu_disable_refcnt) < 0)
		Change \{vv_freeplay_menu_disable_refcnt = 0}
	endif
	if (($vv_freeplay_menu_disable_refcnt) > 0)
		return
	endif
	if ui_event_exists_in_stack \{Name = 'ds_connection_handler'}
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
			<sub_menu_parent> = <resolved_id>
			if ResolveScreenElementID id = {<resolved_id> child = freeplay_sub_menu}
			endif
			if ResolveScreenElementID id = {<resolved_id> child = intensity_sub_menu} param = out
				<out> :se_setprops unblock_events alpha = 1 time = 1
			endif
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
	popdisablerendering \{context = freeplay_venue_change
		Type = unchecked}
	if ($freeplay_demo_quit_warning_shown = 1)
		if NOT ScreenElementExists \{id = dialog_box_container}
			Change \{freeplay_demo_quit_warning_shown = 0}
		endif
	endif
endscript

script freeplay_pause_difficulty_entry_focus \{Player = !i1768515945}
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

script freeplay_pause_choose_difficulty \{Player = !i1768515945
		difficulty = !q1768515945}
	if (<difficulty> = expert_plus)
		setplayerinfo <Player> double_kick_drum = 1
		difficulty = expert
	else
		setplayerinfo <Player> double_kick_drum = 0
	endif
	setplayerinfo <Player> difficulty = <difficulty>
	freeplay_pause_menu_resume Player = <Player>
endscript

script freeplay_pause_instrument_entry_focus \{Player = !i1768515945}
	getplayerinfo <Player> part
	switch <part>
		case guitar
		return \{focus_idx = 0}
		case bass
		return \{focus_idx = 1}
	endswitch
	ScriptAssert \{qs(0x51812774)}
endscript

script freeplay_pause_choose_instrument \{Player = !i1768515945
		part = !q1768515945}
	if NOT playerinfoequals <Player> part = <part>
		freeplay_set_player_part Player = <Player> part = <part>
		setplayerinfo <Player> star_power_amount = 0
		setplayerinfo <Player> current_run = 0
		resetplayernotestreak Player = <Player>
		updaterunchange Player = <Player>
		freeplay_update_instrument_icons Player = <Player>
	endif
	freeplay_pause_menu_resume Player = <Player>
endscript

script freeplay_pause_lefty_entry_focus \{Player = !i1768515945}
	getplayerinfo <Player> lefty_flip
	return focus_idx = <lefty_flip>
endscript

script freeplay_pause_choose_lefty \{Player = !i1768515945
		lefty_flip = !i1768515945}
	setplayerinfo <Player> lefty_flip = <lefty_flip>
	setplayerinfo <Player> lefthanded_gems = <lefty_flip>
	setplayerinfo <Player> lefthanded_button_ups = <lefty_flip>
	getplayerinfo <Player> part
	if NOT (<part> = drum)
		refresh_button_models Player = <Player>
	endif
	freeplay_pause_menu_resume Player = <Player>
endscript

script freeplay_condition_lefty_flip \{Player = !i1768515945}
	getplayerinfo <Player> part
	switch <part>
		case guitar
		case bass
		case drum
		return \{true}
	endswitch
	return \{FALSE}
endscript

script freeplay_condition_instrument \{Player = !i1768515945}
	playlist_getcurrentsong
	get_song_difficulty_ratings song = <current_song>
	song_contains_guitar_and_bass_parts = 1
	if GotParam \{guitar_difficulty_rating}
		if (<guitar_difficulty_rating> = 0 || <bass_difficulty_rating> = 0)
			song_contains_guitar_and_bass_parts = 0
		endif
	endif
	getplayerinfo <Player> part
	switch <part>
		case guitar
		case bass
		if (<song_contains_guitar_and_bass_parts> = 1)
			return \{true}
		else
			return \{FALSE}
		endif
	endswitch
	return \{FALSE}
endscript

script freeplay_condition_expert_plus \{Player = !i1768515945}
	getplayerinfo <Player> part
	switch <part>
		case drum
		return \{true}
	endswitch
	return \{FALSE}
endscript

script freeplay_condition_xblademo 
	if demobuild
		if ($g_kiosk_demo = 0)
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script freeplay_condition_notdemo 
	if demobuild
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script freeplay_condition_options \{Player = !i1768515945}
	getplayerinfo <Player> part
	switch <part>
		case guitar
		case bass
		case drum
		return \{true}
	endswitch
	return \{FALSE}
endscript

script freeplay_condition_no_options \{Player = !i1768515945}
	if NOT freeplay_condition_options Player = <Player>
		return \{true}
	endif
	return \{FALSE}
endscript

script freeplay_pause_generate_entries_venue 
	<focus_idx> = 0
	<array> = []
	GetArraySize \{$LevelZoneArray}
	<zone_idx> = 0
	<menu_idx> = 0
	begin
	<zone_load> = ($LevelZoneArray [<zone_idx>])
	if is_venue_unlocked venue = <zone_load>
		<zone_data> = ($LevelZones.<zone_load>)
		text = (<zone_data>.title)
		<new_entry> = {
			text = <text>
			Scr = freeplay_change_venue
			params = {
				zone = <zone_load>
			}
		}
		if ($current_level = <zone_load>)
			focus_idx = <menu_idx>
		endif
		AddArrayElement array = <array> element = <new_entry>
		<menu_idx> = (<menu_idx> + 1)
	endif
	<zone_idx> = (<zone_idx> + 1)
	repeat <array_Size>
	return menu_focus_idx = <focus_idx> menu_entries = <array>
endscript

script freeplay_pause_generate_entries_extras \{menu_focus_idx = 0}
	<array> = []
	<extras> = ($band_lobby_submenu_states.extras.options)
	GetArraySize <extras>
	<menu_idx> = 0
	begin
	standard_params = {Player = <Player> submenu_index = <menu_idx>}
	if StructureContains structure = (<extras> [<menu_idx>]) condition
		if (<extras> [<menu_idx>].condition) <standard_params> (<extras> [<menu_idx>].condition_params)
			add_element = 1
		else
			add_element = 0
		endif
	else
		add_element = 1
	endif
	if (<add_element> = 1)
		if StructureContains structure = (<extras> [<menu_idx>]) text_params
			text = qs(0x874f5ede)
			tp_params = {}
			if StructureContains structure = (<extras> [<menu_idx>]) tp_params
				tp_params = (<extras> [<menu_idx>].tp_params)
			endif
			(<extras> [<menu_idx>].text_params) <standard_params> <tp_params>
			formatText TextName = text (<extras> [<menu_idx>].text) <text_params>
		else
			text = (<menu_options> [<j>].text)
		endif
		<new_entry> = {
			text = <text>
			Scr = freeplay_pause_extra_select
			params = {
				<standard_params>
				(<extras> [<menu_idx>].select_params)
				focus_idx = <focus_idx>
				script_to_call = (<extras> [<menu_idx>].choose_script)
			}
		}
		AddArrayElement array = <array> element = <new_entry>
	endif
	<menu_idx> = (<menu_idx> + 1)
	repeat <array_Size>
	return menu_focus_idx = <menu_focus_idx> menu_entries = <array>
endscript

script gamemode_isnotfreeplay 
	gamemode_gettype
	if (<Type> = freeplay)
		return \{FALSE}
	endif
	return \{true}
endscript

script freeplay_pause_extra_select 
	<script_to_call> <...>
	getplayerinfo <Player> cheat_hyperspeed_value
	setplayerinfo <Player> Hyperspeed = <cheat_hyperspeed_value>
	sethighwaydifficulty Player = <Player>
endscript

script freeplay_reset_hyperspeed 
	setplayerinfo <Player> Cheat_Hyperspeed = 0
	setplayerinfo <Player> cheat_hyperspeed_value = 1.0
	setplayerinfo <Player> Hyperspeed = 1.0
	sethighwaydifficulty Player = <Player>
endscript

script freeplay_setup_highway_menu_background \{Player = !i1768515945}
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
			light_box_dims = (300.0, 260.0)
			Scale = ($freeplay_menu_scale)
		}
		menu_background_id = <id>
		if ScreenElementExists id = <menu_background_id>
			formatText checksumName = helper_id 'highway_helperp%p' p = <Player>
			CreateScreenElement {
				parent = <menu_background_id>
				id = <helper_id>
				Type = ContainerElement
				Pos = (0.0, 0.0)
				autosizedims = true
				pos_anchor = [center , bottom]
				just = [center , top]
				alpha = 0
			}
		endif
		return true menu_background_id = <menu_background_id>
	endif
	return \{FALSE}
endscript

script freeplay_condition_no_ds_connected 
	if NOT is_ds_connected
		return \{true}
	endif
	return \{FALSE}
endscript

script freeplay_condition_ds_connected 
	if freeplay_condition_no_ds_connected
		return \{FALSE}
	endif
	return \{true}
endscript
