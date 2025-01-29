freestyle_mii_options = [
]
0xc89dd984 = {
	guitar = 0
	drums = 1
	bass = 2
	ds = 3
}
0x4ba416ef = [
]
freestyle_band_lobby_player_states = [
	not_joined
	not_joined
	not_joined
	not_joined
]
freestyle_band_lobby_background_positions = [
	(242.0, -50.0)
	(14.0, -50.0)
	(-232.0, -50.0)
	(14.0, 50.0)
]
freestyle_band_lobby_headers = [
	qs(0xaecdfaea)
	qs(0x40351ace)
	qs(0x1fe7d0f9)
	qs(0x1fc734cf)
]
0x02b0e892 = [
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
]
freestyle_band_lobby_original_rerecording_data = [
	{
	}
	{
	}
	{
	}
]
freestyle_band_lobby_viewport_colors = [
	[
		255
		203
		40
		255
	]
	[
		0
		235
		255
		255
	]
	[
		255
		129
		40
		255
	]
	[
		255
		255
		255
		255
	]
]
freestyle_band_lobby_first_pass = true
freestyle_band_lobby_is_safe = true
0x0d3d7955 = (-74.0, -170.0)
0x08516ebe = 0.65000004
freestyle_band_lobby_selection_delay = 0.5
freestyle_band_lobby_scroll_delay = 0.2
freestyle_mii_on_bg = [
	0
	0
	0
	0
]

script freestyle_band_lobby_hold 
	RequireParams \{[
			Player
			time
		]
		all}
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
		ResolveScreenElementID id = {<resolved_id> child = <Player>}
	endif
	<resolved_id> :SetTags not_on_hold = FALSE
	Wait <time> Seconds
	<resolved_id> :SetTags not_on_hold = true
endscript

script freestyle_band_lobby_mark_as_unsafe 
	RequireParams \{[
			time
		]
		all}
	Change \{freestyle_band_lobby_is_safe = FALSE}
	Wait <time> Seconds
	Change \{freestyle_band_lobby_is_safe = true}
endscript

script freestyle_band_lobby_isnt_constrained 
	if GotParam \{Player}
		if ScreenElementExists \{id = band_lobby_desc_id}
			if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
				ResolveScreenElementID id = {<resolved_id> child = <Player>}
			endif
			<resolved_id> :GetTags not_on_hold
			return <not_on_hold>
		else
			return \{true}
		endif
	else
		if ScreenElementExists \{id = band_lobby_desc_id}
			band_lobby_not_on_hold = true
			counter = 0
			begin
			if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
				ResolveScreenElementID id = {<resolved_id> child = <counter>}
			endif
			<resolved_id> :GetTags not_on_hold
			if (<not_on_hold> = FALSE)
				band_lobby_not_on_hold = FALSE
			endif
			counter = (<counter> + 1)
			repeat 4
			return <band_lobby_not_on_hold>
		else
			return \{true}
		endif
	endif
endscript

script freestyle_band_lobbby_init 
	getmiicount
	freestyle_mii_options = []
	Change \{g_lobby_enter_from_main_menu = 0}
	if (<mii_count> > 0)
		counter = 0
		begin
		temporary_array = [{}]
		temporary_struct = {}
		getmiiname index = <counter> database = FrontEnd
		temporary_struct = {
			text = <mii_name>
			choose_script = freestyle_band_lobby_select_mii
			select_params = {mii_index = <counter>}
			additional_focus_script = freestyle_band_lobby_focus_mii
			additional_focus_params = {mii_index = <counter>}
		}
		SetArrayElement ArrayName = temporary_array index = 0 NewValue = <temporary_struct>
		freestyle_mii_options = (<freestyle_mii_options> + <temporary_array>)
		counter = (<counter> + 1)
		repeat <mii_count>
	endif
	temporary_array = [{}]
	temporary_struct = {
		text = qs(0x8f5d9f37)
		choose_script = freestyle_band_lobby_select_mii
		select_params = {mii_index = -1 random_mii}
		additional_focus_script = freestyle_band_lobby_focus_mii
		additional_focus_params = {mii_index = -1 random_mii}
	}
	SetArrayElement ArrayName = temporary_array index = 0 NewValue = <temporary_struct>
	freestyle_mii_options = (<freestyle_mii_options> + <temporary_array>)
	new_mii_select_menu_state = {
		options = <freestyle_mii_options>
		back_script = freestyle_band_lobby_change_menu
		back_params = {action = back menu = freestyle_unjoin}
		title = qs(0xc0a65789)
	}
	new_menu_state_struct = ($band_lobby_submenu_states)
	setstructureparam struct_name = new_menu_state_struct param = freestyle_mii_select value = <new_mii_select_menu_state>
	Change band_lobby_submenu_states = <new_menu_state_struct>
	setplayerinfo \{1
		in_game = 0}
	setplayerinfo \{2
		in_game = 0}
	setplayerinfo \{3
		in_game = 0}
	setplayerinfo \{4
		in_game = 0}
	state_array = ($freestyle_band_lobby_player_states)
	SetArrayElement \{ArrayName = state_array
		index = 0
		NewValue = not_joined}
	SetArrayElement \{ArrayName = state_array
		index = 1
		NewValue = not_joined}
	SetArrayElement \{ArrayName = state_array
		index = 2
		NewValue = not_joined}
	SetArrayElement \{ArrayName = state_array
		index = 3
		NewValue = not_joined}
	Change freestyle_band_lobby_player_states = <state_array>
	array = [NULL NULL NULL NULL]
	SetArrayElement {
		ArrayName = array
		index = ($0xc89dd984.guitar)
		NewValue = guitar
	}
	SetArrayElement {
		ArrayName = array
		index = ($0xc89dd984.drums)
		NewValue = drums
	}
	SetArrayElement {
		ArrayName = array
		index = ($0xc89dd984.bass)
		NewValue = bass
	}
	SetArrayElement {
		ArrayName = array
		index = ($0xc89dd984.ds)
		NewValue = ds
	}
	Change 0x4ba416ef = <array>
endscript

script freestyle_band_lobbby_create 
	if ScreenElementExists \{id = band_lobby_desc_id}
		SpawnScriptNow \{freestyle_band_lobby_mark_as_unsafe
			params = {
				time = 2
			}}
		band_lobby_desc_id :se_setprops \{band_name_text = qs(0xba4399a4)
			game_state_text = qs(0x13dd7891)}
		SpawnScriptNow \{freestyle_update_drum_icons
			id = drum_icon_updater}
		freestyle_band_lobby_insert_default_text
		freestyle_band_lobby_create_viewport_backgrounds
		if (($freestyle_recording_mode) = overdub)
			freestyle_band_lobby_setup_for_rerecording
		endif
		CreateScreenElement \{Type = menuelement
			id = join_catcher
			parent = band_lobby_desc_id
			event_handlers = [
				{
					pad_choose
					0x8848c3a5
					params = {
						instrument = drums
						Type = nunchuk
					}
				}
				{
					pad_option
					0x8848c3a5
					params = {
						instrument = drums
						Type = drumkit
					}
				}
				{
					pad_option2
					0x8848c3a5
					params = {
						instrument = guitar
					}
				}
				{
					pad_L1
					0x8848c3a5
					params = {
						instrument = bass
					}
				}
				{
					pad_back
					freestyle_band_lobby_leave
				}
				{
					pad_select
					0xf34cf1c5
				}
				{
					pad_start
					freestyle_select_finished
				}
			]}
		LaunchEvent \{Type = focus
			target = join_catcher}
		if (($freestyle_game_from_postgame) = 1)
			join_catcher :se_setprops \{event_handlers = [
					{
						pad_back
						freestyle_band_lobby_leave
					}
				]
				replace_handlers}
		endif
		freestyle_mainmenu_config_ds_handler \{band_lobby}
		CreateScreenElement \{Type = menuelement
			id = control_catcher
			parent = band_lobby_desc_id
			event_handlers = [
				{
					pad_up
					freestyle_band_lobby_scroll
					params = {
						Dir = up
					}
				}
				{
					pad_down
					freestyle_band_lobby_scroll
					params = {
						Dir = down
					}
				}
				{
					pad_choose
					freestyle_band_lobby_choose
				}
				{
					pad_back
					freestyle_band_lobby_back
				}
				{
					pad_select
					0xf34cf1c5
				}
				{
					pad_start
					freestyle_select_finished
				}
			]
			exclusive_device = 4}
		LaunchEvent \{Type = focus
			target = control_catcher}
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		counter = 0
		begin
		band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
		ResolveScreenElementID id = [
			{id = <resolved_id>}
			{index = <counter>}
		]
		LaunchEvent Type = unfocus target = <resolved_id>
		counter = (<counter> + 1)
		repeat 4
		freestyle_band_lobby_update_helpers
		SpawnScriptLater \{freestyle_band_lobby_default_icons}
		SpawnScriptNow \{freestyle_band_lobby_bouncer
			id = bouncer}
		ds_index = ($0xc89dd984.ds)
		if is_ds_connected
			Change freestyle_stage_manager_name = ($ds_infos [0].ds_name)
			if (($freestyle_stage_manager_ds) = true)
				if NOT (($freestyle_recording_mode) = overdub)
					freestyle_band_lobby_join_ds
				else
					freestyle_band_lobby_unjoin_ds
				endif
			endif
		else
			if NOT (($freestyle_recording_mode) = overdub)
				text = ($freestyle_band_lobby_headers [<ds_index>])
			else
				if (($freestyle_current_performance_data.stage_manager_ds) = true)
					text = ($freestyle_current_performance_data.stage_manager_name)
				else
					text = $wii_freestyle_cpu_text
				endif
			endif
			array = ($0x02b0e892)
			SetArrayElement {
				ArrayName = array
				index = <ds_index>
				NewValue = <text>
			}
			Change 0x02b0e892 = <array>
		endif
		if (($freestyle_band_lobby_first_pass) = FALSE)
			freestyle_band_lobby_reload_state_from_player_data
		else
			freestyle_set_default_player_data
			getmiicount
			if (<mii_count> <= 0)
				freestyle_band_lobby_update_event_catcher \{unfocus}
				create_dialog_box \{use_all_controllers
					heading_text = qs(0xcf5deb58)
					body_text = qs(0x6e2c4355)
					options = [
						{
							func = destroy_dialog_box
							func_params = {
								dont_remove_helpers
							}
							text = qs(0x0e41fe46)
						}
					]
					dlog_event_handlers = [
						{
							pad_up
							generic_menu_up_or_down_sound
							params = {
								up
							}
						}
						{
							pad_down
							generic_menu_up_or_down_sound
							params = {
								down
							}
						}
					]
					on_destroy_script = freestyle_band_lobby_update_event_catcher
					on_destroy_script_params = {
					}}
			endif
		endif
		SpawnScriptNow \{freestyle_band_lobby_hold
			params = {
				Player = 0
				time = $freestyle_band_lobby_selection_delay
			}}
		SpawnScriptNow \{freestyle_band_lobby_hold
			params = {
				Player = 1
				time = $freestyle_band_lobby_selection_delay
			}}
		SpawnScriptNow \{freestyle_band_lobby_hold
			params = {
				Player = 2
				time = $freestyle_band_lobby_selection_delay
			}}
		SpawnScriptNow \{freestyle_band_lobby_hold
			params = {
				Player = 3
				time = $freestyle_band_lobby_selection_delay
			}}
	else
		ScriptAssert \{qs(0x86c4d0ad)}
	endif
endscript

script freestyle_band_lobby_reload_state_from_player_data 
	if ($freestyle_game_from_postgame = 1)
		freestyle_retrieve_stats_from_stone
	endif
	GetArraySize ($freestyle_player_data)
	counter = 0
	begin
	if ((($freestyle_player_data [<counter>].player_type) = human))
		controller = ($freestyle_player_data [<counter>].controller)
		orig_controller_type = ($freestyle_player_data [<counter>].controller_type)
		getwiicontrollertype controller = <controller>
		if (<controller_type> = <orig_controller_type>)
			state_array = ($freestyle_band_lobby_player_states)
			SetArrayElement ArrayName = state_array index = <counter> NewValue = done
			Change freestyle_band_lobby_player_states = <state_array>
			freestyle_band_lobby_update_event_catcher
			freestyle_band_lobby_destroy_button_prompt viewport_index = <counter>
			formatText checksumName = background_id 'background_%i' i = <counter>
			<background_id> :se_setprops {
				rgba = [255 255 255 255]
			}
			0xa80f0dcc state = 0xaa02f6fc index = <counter>
			if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
				ResolveScreenElementID id = {<resolved_id> child = <counter>}
			endif
			freestyle_spawn_controller_lights {
				parent = <resolved_id>
				Player = <counter>
				controller = ($freestyle_player_data [<counter>].controller)
				state = freestyle_band_lobby
			}
			formatText checksumName = mii_face_id 'mii_face_%i' i = <counter>
			if ScreenElementExists id = <mii_face_id>
				DestroyScreenElement id = <mii_face_id>
			endif
			mii_database = ($freestyle_player_data [<counter>].mii_database)
			mii_index = ($freestyle_player_data [<counter>].mii_index)
			if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
				ResolveScreenElementID id = {<resolved_id> child = <counter>}
			endif
			if NOT ((<mii_database> = randomdb) || (<mii_database> = None))
				CreateScreenElement {
					id = <mii_face_id>
					Type = miiiconelement
					parent = <resolved_id>
					pos_anchor = [center center]
					just = [center center]
					Pos = $0x0d3d7955
					z_priority = 7
					mii_expression = Normal
					mii_bgcolor = $freestyle_mii_on_bg
					mii_dims = (256.0, 256.0)
					mii_index = <mii_index>
					mii_database = <mii_database>
					Scale = $0x08516ebe
				}
				getmiiname index = <mii_index> database = <mii_database>
				array = ($0x02b0e892)
				SetArrayElement {
					ArrayName = array
					index = <counter>
					NewValue = <mii_name>
				}
				Change 0x02b0e892 = <array>
			else
				CreateScreenElement {
					id = <mii_face_id>
					Type = SpriteElement
					parent = <resolved_id>
					pos_anchor = [center center]
					just = [center center]
					dims = (256.0, 256.0)
					Pos = $0x0d3d7955
					z_priority = 7
					texture = freestylemiirandomselected
					Scale = $0x08516ebe
				}
				array = ($0x02b0e892)
				SetArrayElement {
					ArrayName = array
					index = <counter>
					NewValue = ($freestyle_band_lobby_headers [<counter>])
				}
				Change 0x02b0e892 = <array>
			endif
			<mii_face_id> :Obj_SpawnScriptNow freestyle_hud_pop_graphic_in params = {Scale = $0x08516ebe}
		else
			setstructureparam {
				array_name = freestyle_player_data
				array_index = <counter>
				param = instrument
				value = None
			}
			setstructureparam {
				array_name = freestyle_player_data
				array_index = <counter>
				param = controller
				value = -1
			}
			setstructureparam {
				array_name = freestyle_player_data
				array_index = <counter>
				param = player_type
				value = None
			}
			setstructureparam {
				array_name = freestyle_player_data
				array_index = <counter>
				param = controller_type
				value = None
			}
		endif
	endif
	counter = (<counter> + 1)
	repeat <array_Size>
	freestyle_band_lobby_update_helpers
	Change \{freestyle_game_from_postgame = 0}
endscript

script freestyle_band_lobby_leave 
	ui_event_get_stack
	if (($freestyle_recording_mode = overdub) && (<stack_size> > 2))
		generic_event_back
	else
		generic_event_choose \{state = uistate_freestyle_mainmenu
			data = {
				clear_previous_stack
			}}
	endif
endscript

script freestyle_band_lobby_default_icons 
	freestyle_get_drum_status
	if (<status> = nunchuk_only)
		drum_texture = mixer_icon_airdrums
	else
		drum_texture = mixer_icon_drums
	endif
	band_lobby_desc_id :se_setprops {
		instrument_icon_1_texture = mixer_icon_guitar
		instrument_icon_2_texture = <drum_texture>
		instrument_icon_3_texture = mixer_icon_bass
		instrument_icon_4_texture = mixer_icon_ds
	}
endscript

script freestyle_update_drum_icons 
	freestyle_get_drum_status
	previous_state = <status>
	if (<previous_state> = error)
		previous_state = mixed
	endif
	begin
	drum_index = ($0xc89dd984.drums)
	if (($freestyle_band_lobby_player_states [<drum_index>]) = not_joined)
		freestyle_get_drum_status
		current_state = <status>
		if (<status> = nunchuk_only)
			drum_texture = mixer_icon_airdrums
		else
			drum_texture = mixer_icon_drums
		endif
		band_lobby_desc_id :se_setprops {
			instrument_icon_2_texture = <drum_texture>
		}
		if (<current_state> = error)
			current_state = mixed
		endif
		if NOT (<current_state> = <previous_state>)
			if freestyle_band_lobby_isnt_constrained Player = <drum_index>
				SpawnScriptNow freestyle_band_lobby_hold params = {Player = <drum_index> time = $freestyle_band_lobby_selection_delay}
				band_lobby_change_menu action = forward menu = join Player = (<drum_index> + 1) viewport_index = <drum_index>
			endif
			previous_state = <current_state>
		endif
	else
		switch ($freestyle_player_data [<drum_index>].instrument_handler)
			case drums_kit
			band_lobby_desc_id :se_setprops \{instrument_icon_2_texture = mixer_icon_drums}
			case drums_nunchuk
			band_lobby_desc_id :se_setprops \{instrument_icon_2_texture = mixer_icon_airdrums}
		endswitch
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script freestyle_band_lobby_insert_default_text 
	if NOT (($freestyle_recording_mode) = overdub)
		counter = 0
		begin
		array = ($0x02b0e892)
		SetArrayElement {
			ArrayName = array
			index = <counter>
			NewValue = ($freestyle_band_lobby_headers [<counter>])
		}
		Change 0x02b0e892 = <array>
		counter = (<counter> + 1)
		repeat 4
	else
		counter = 0
		begin
		player_type = ($freestyle_band_lobby_original_rerecording_data [<counter>].original_player_type)
		if (<player_type> = human)
			mii_index = ($freestyle_band_lobby_original_rerecording_data [<counter>].mii_index)
			mii_database = ($freestyle_band_lobby_original_rerecording_data [<counter>].mii_database)
			if NOT (<mii_database> = randomdb)
				getmiiname index = <mii_index> database = <mii_database>
			else
				mii_name = ($freestyle_band_lobby_headers [<counter>])
			endif
			text = <mii_name>
		elseif (<player_type> = ai)
			author_type = ($freestyle_band_lobby_original_rerecording_data [<counter>].author_type)
			if (<author_type> = ai)
				text = ($wii_freestyle_cpu_text)
			else
				text = ($freestyle_band_lobby_headers [<counter>])
			endif
		else
			text = ($freestyle_band_lobby_headers [<counter>])
		endif
		array = ($0x02b0e892)
		SetArrayElement {
			ArrayName = array
			index = <counter>
			NewValue = <text>
		}
		Change 0x02b0e892 = <array>
		counter = (<counter> + 1)
		repeat ($freestyle_max_players)
		array = ($0x02b0e892)
		SetArrayElement {
			ArrayName = array
			index = 3
			NewValue = ($freestyle_current_performance_data.stage_manager_name)
		}
		Change 0x02b0e892 = <array>
	endif
endscript

script freestyle_band_lobby_get_button_prompt 
	RequireParams \{[
			viewport_index
		]
		all}
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
		ResolveScreenElementID id = {<resolved_id> child = <viewport_index>}
		instrument = ($0x4ba416ef [<viewport_index>])
		switch <instrument>
			case guitar
			if (($freestyle_recording_mode) = overdub)
				text = qs(0xda7427ac)
			else
				text = qs(0xaf870953)
			endif
			button = qs(0x2d42382d)
			lines = 1
			case drums
			if (($freestyle_recording_mode) = overdub)
				text = qs(0xda7427ac)
			else
				text = qs(0xaf870953)
			endif
			freestyle_get_drum_status
			if (<status> = drumkit_only)
				button = qs(0x927ae1ef)
				lines = 1
			elseif (<status> = nunchuk_only)
				button = qs(0x7b189fab)
				lines = 1
			elseif ((<status> = mixed) || (<status> = error))
				formatText TextName = text qs(0xe1e0777f) a = <text>
				button = qs(0xfd0f3ca1)
				lines = 2
			endif
			case bass
			if (($freestyle_recording_mode) = overdub)
				text = qs(0xda7427ac)
			else
				text = qs(0xaf870953)
			endif
			button = qs(0xb3c115a3)
			lines = 1
			case ds
			if is_ds_connected
				if (($freestyle_band_lobby_player_states [<viewport_index>]) = done)
					text = qs(0x88a90545)
				else
					if (($freestyle_recording_mode) = overdub)
						text = qs(0xda7427ac)
					else
						text = qs(0xaf870953)
					endif
				endif
			else
				text = qs(0x53d31238)
			endif
			button = qs(0x6d168df3)
			lines = 1
		endswitch
		return text = <text> button = <button> lines = <lines>
	endif
endscript

script freestyle_band_lobby_create_viewport_backgrounds 
	counter = 0
	begin
	band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
	ResolveScreenElementID id = {<resolved_id> child = <counter>}
	formatText checksumName = window_id 'window_%i' i = <counter>
	CreateScreenElement {
		id = <window_id>
		Type = WindowElement
		parent = <resolved_id>
		pos_anchor = [center center]
		just = [center center]
		Pos = (-70.0, -55.0)
		z_priority = 6
		dims = (236.0, 412.0)
	}
	formatText checksumName = background_id 'background_%i' i = <counter>
	CreateScreenElement {
		id = <background_id>
		Type = SpriteElement
		parent = <window_id>
		pos_anchor = [center center]
		just = [center center]
		Pos = ($freestyle_band_lobby_background_positions [<counter>])
		z_priority = 3
		texture = Stage
		dims = (1024.0, 512.0)
		rgba = [128 128 128 255]
	}
	counter = (<counter> + 1)
	repeat 4
endscript

script freestyle_band_lobby_update_event_catcher 
	if NOT GotParam \{unfocus}
		if GotParam \{focus}
			i = 0
			begin
			LaunchEvent Type = focus target = ($band_lobby_viewport_menus [<i>])
			i = (<i> + 1)
			repeat 3
		endif
		counter = 0
		joined_array = []
		unjoined_array = []
		temp_array = [0]
		begin
		if NOT freestyle_band_lobby_has_controller_joined controller = <counter>
			SetArrayElement ArrayName = temp_array index = 0 NewValue = <counter>
			unjoined_array = (<unjoined_array> + <temp_array>)
		else
			SetArrayElement ArrayName = temp_array index = 0 NewValue = <counter>
			joined_array = (<joined_array> + <temp_array>)
		endif
		counter = (<counter> + 1)
		repeat 4
		GetArraySize <unjoined_array>
		if (<array_Size> > 0)
			join_catcher :se_setprops {
				exclusive_device = <unjoined_array>
			}
			LaunchEvent \{Type = focus
				target = join_catcher}
		else
			join_catcher :se_setprops \{exclusive_device = 4}
		endif
		GetArraySize <joined_array>
		if (<array_Size> > 0)
			control_catcher :se_setprops {
				exclusive_device = <joined_array>
			}
			LaunchEvent \{Type = focus
				target = control_catcher}
		else
			control_catcher :se_setprops \{exclusive_device = 4}
		endif
		ds_catcher :se_setprops \{exclusive_device = [
				0
				1
				2
				3
			]}
	else
		join_catcher :se_setprops \{exclusive_device = [
				4
				4
				4
				4
			]}
		control_catcher :se_setprops \{exclusive_device = [
				4
				4
				4
				4
			]}
		ds_catcher :se_setprops \{exclusive_device = [
				4
				4
				4
				4
			]}
		i = 0
		begin
		LaunchEvent Type = unfocus target = ($band_lobby_viewport_menus [<i>])
		i = (<i> + 1)
		repeat 3
	endif
	freestyle_band_lobby_update_helpers
	Change \{g_leader_player_num = -1}
endscript

script freestyle_band_lobby_has_controller_joined 
	RequireParams \{[
			controller
		]
		all}
	counter = 0
	GetArraySize ($freestyle_player_data)
	begin
	player_controller = ($freestyle_player_data [<counter>].controller)
	if (<player_controller> = <controller>)
		return \{true}
	endif
	counter = (<counter> + 1)
	repeat <array_Size>
	return \{FALSE}
endscript

script 0x8848c3a5 
	RequireParams \{[
			instrument
			device_num
		]
		all}
	getwiicontrollertype controller = <device_num>
	if ((<controller_type> = guitar) || (<controller_type> = drumkit) || (<controller_type> = nunchuk) || (($allow_controller_for_all_instruments) = 1))
		if (($allow_controller_for_all_instruments) = 1)
			instrument = guitar
		endif
		if NOT freestyle_band_lobby_has_controller_joined controller = <device_num>
			viewport = ($0xc89dd984.<instrument>)
			switch <instrument>
				case drums
				if NOT freestyle_band_lobby_is_instrument_taken \{instrument = drums}
					if (<controller_type> = <Type>)
						if freestyle_band_lobby_isnt_constrained Player = <viewport>
							freestyle_band_lobby_join {
								instrument = drums
								device_num = <device_num>
							}
						endif
					endif
				endif
				case guitar
				if NOT freestyle_band_lobby_is_instrument_taken \{instrument = guitar}
					if ((<controller_type> = guitar) || (($allow_controller_for_all_instruments) = 1))
						if freestyle_band_lobby_isnt_constrained Player = <viewport>
							freestyle_band_lobby_join {
								instrument = guitar
								device_num = <device_num>
							}
						endif
					endif
				endif
				case bass
				if NOT freestyle_band_lobby_is_instrument_taken \{instrument = bass}
					if (<controller_type> = guitar)
						if freestyle_band_lobby_isnt_constrained Player = <viewport>
							freestyle_band_lobby_join {
								instrument = bass
								device_num = <device_num>
							}
						endif
					endif
				endif
			endswitch
			freestyle_band_lobby_update_event_catcher
			freestyle_band_lobby_update_helpers
		endif
	else
		if (($freestyle_band_lobby_is_safe) = true)
			if freestyle_band_lobby_isnt_constrained
				if NOT ScreenElementExists \{id = dialog_box_desc_id}
					if ((<controller_type> = None) || (<controller_type> = rb_drumkit) || (<controller_type> = rb_guitar))
						freestyle_band_lobby_update_event_catcher \{unfocus}
						create_dialog_box {
							player_device = <device_num>
							heading_text = qs(0xaa163738)
							body_text = qs(0xdf39fa26)
							options = [
								{
									func = destroy_dialog_box
									func_params = {dont_remove_helpers}
									text = qs(0x0e41fe46)
								}
							]
							dlog_event_handlers = [
								{pad_up generic_menu_up_or_down_sound params = {up}}
								{pad_down generic_menu_up_or_down_sound params = {down}}
							]
							on_destroy_script = freestyle_band_lobby_update_event_catcher
							on_destroy_script_params = {focus}
						}
						return
					elseif (<controller_type> = wiimote)
						freestyle_band_lobby_update_event_catcher \{unfocus}
						create_dialog_box {
							player_device = <device_num>
							heading_text = qs(0xaa163738)
							body_text = qs(0x2f9e2f19)
							options = [
								{
									func = destroy_dialog_box
									func_params = {dont_remove_helpers}
									text = qs(0x0e41fe46)
								}
							]
							dlog_event_handlers = [
								{pad_up generic_menu_up_or_down_sound params = {up}}
								{pad_down generic_menu_up_or_down_sound params = {down}}
							]
							on_destroy_script = freestyle_band_lobby_update_event_catcher
							on_destroy_script_params = {focus}
						}
						return
					else
						freestyle_band_lobby_update_event_catcher \{unfocus}
						create_dialog_box {
							player_device = <device_num>
							heading_text = qs(0xaa163738)
							body_text = qs(0xc74e8551)
							options = [
								{
									func = destroy_dialog_box
									func_params = {dont_remove_helpers}
									text = qs(0x0e41fe46)
								}
							]
							dlog_event_handlers = [
								{pad_up generic_menu_up_or_down_sound params = {up}}
								{pad_down generic_menu_up_or_down_sound params = {down}}
							]
							on_destroy_script = freestyle_band_lobby_update_event_catcher
							on_destroy_script_params = {focus}
						}
						return
					endif
				else
					return
				endif
			endif
		endif
	endif
endscript

script freestyle_band_lobby_join 
	RequireParams \{[
			instrument
			device_num
		]
		all}
	index = ($0xc89dd984.<instrument>)
	if NOT (<instrument> = ds)
		gh5_band_screen_ui_sound player_num = (<index> + 1) choose = 1
		freestyle_band_lobby_destroy_button_prompt viewport_index = <index>
		formatText checksumName = background_id 'background_%i' i = <index>
		<background_id> :se_setprops {
			rgba = [255 255 255 255]
		}
		0xa80f0dcc state = 0xaa02f6fc index = <index>
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
			ResolveScreenElementID id = {<resolved_id> child = <index>}
		endif
		freestyle_spawn_controller_lights {
			parent = <resolved_id>
			Player = <index>
			controller = <device_num>
			state = freestyle_band_lobby
		}
		state_array = ($freestyle_band_lobby_player_states)
		SetArrayElement ArrayName = state_array index = <index> NewValue = in_progress
		Change freestyle_band_lobby_player_states = <state_array>
		setstructureparam {
			array_name = freestyle_player_data
			array_index = <index>
			param = controller
			value = <device_num>
		}
		freestyle_setup_human_player Player = <index>
		freestyle_setup_instrument Player = <index> instrument = <instrument>
		setstructureparam {
			array_name = freestyle_player_data
			array_index = <index>
			param = instrument
			value = <instrument>
		}
		band_lobby_change_menu {
			menu = freestyle_mii_select
			action = forward
			Player = (<index> + 1)
			viewport_index = <index>
		}
		SpawnScriptNow freestyle_band_lobby_hold params = {Player = <index> time = $freestyle_band_lobby_selection_delay}
	endif
endscript

script freestyle_is_active 
	if 0x1469760b
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script freestyle_get_drum_status 
	drumkit_count = 0
	nunchuk_count = 0
	counter = 0
	begin
	getwiicontrollertype controller = <counter>
	if (<controller_type> = nunchuk)
		nunchuk_count = (<nunchuk_count> + 1)
	elseif (<controller_type> = drumkit)
		drumkit_count = (<drumkit_count> + 1)
	endif
	counter = (<counter> + 1)
	repeat 4
	if ((<drumkit_count> > 0) && (<nunchuk_count> = 0))
		return \{status = drumkit_only}
	elseif ((<drumkit_count> = 0) && (<nunchuk_count> > 0))
		return \{status = nunchuk_only}
	elseif ((<drumkit_count> > 0) && (<nunchuk_count> > 0))
		return \{status = mixed}
	else
		return \{status = error}
	endif
endscript

script freestyle_band_lobby_is_instrument_taken 
	RequireParams \{[
			instrument
		]
		all}
	index = ($0xc89dd984.<instrument>)
	if (($freestyle_band_lobby_player_states [<index>]) = not_joined)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script freestyle_band_lobby_scroll 
	RequireParams \{[
			Dir
		]
		all}
	printf 'Device: %d %s' d = <device_num> s = <Dir>
	freestyle_band_lobby_get_player_from_controller controller = <device_num>
	if freestyle_band_lobby_isnt_constrained Player = (<Player> -1)
		SpawnScriptNow freestyle_band_lobby_hold params = {Player = (<Player> -1) time = $freestyle_band_lobby_scroll_delay}
		($band_lobby_viewport_menus [(<Player> -1)]) :Obj_SpawnScriptNow band_lobby_scroll_submenu params = {Player = <Player> viewport_index = (<Player> -1) Dir = <Dir>}
	endif
endscript

script freestyle_band_lobby_choose 
	printf 'Device: %d choose' d = <device_num>
	freestyle_band_lobby_get_player_from_controller controller = <device_num>
	if freestyle_band_lobby_isnt_constrained Player = (<Player> -1)
		gh5_band_screen_ui_sound player_num = <Player> choose = 1
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = (<Player> -1)
		current_menu = ($<submenu_data>.menu)
		menu_options = ($band_lobby_submenu_states.<current_menu>.options)
		($band_lobby_viewport_menus [(<Player> -1)]) :menu_getselectedindex
		(<menu_options> [<selected_index>].choose_script) (<menu_options> [<selected_index>].select_params) <...>
		SpawnScriptNow freestyle_band_lobby_hold params = {Player = (<Player> -1) time = $freestyle_band_lobby_selection_delay}
	endif
endscript

script freestyle_band_lobby_back 
	printf 'Device: %d back' d = <device_num>
	freestyle_band_lobby_get_player_from_controller controller = <device_num>
	if freestyle_band_lobby_isnt_constrained Player = (<Player> -1)
		player_state = ($freestyle_band_lobby_player_states [(<Player> -1)])
		if NOT (<player_state> = not_joined)
			gh5_band_screen_ui_sound player_num = <Player> choose = 1
			formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = (<Player> -1)
			current_menu = ($<submenu_data>.menu)
			back_script = ($band_lobby_submenu_states.<current_menu>.back_script)
			back_params = ($band_lobby_submenu_states.<current_menu>.back_params)
			<back_script> <back_params> <...>
		else
			freestyle_band_lobby_leave
		endif
		SpawnScriptNow freestyle_band_lobby_hold params = {Player = (<Player> -1) time = $freestyle_band_lobby_selection_delay}
	endif
endscript

script freestyle_band_lobby_change_menu 
	RequireParams \{[
			action
			menu
			Player
		]
		all}
	if GotParam \{device_num}
		printf 'Device: %d change' d = <device_num>
	endif
	player_state = ($freestyle_band_lobby_player_states [(<Player> -1)])
	if NOT (<menu> = freestyle_unjoin)
		if (<action> = back)
			if (<player_state> = done)
				band_lobby_change_menu {
					menu = freestyle_final
					action = <action>
					Player = <Player>
					viewport_index = (<Player> -1)
				}
			elseif (<player_state> = in_progress)
				band_lobby_change_menu {
					menu = <menu>
					action = <action>
					Player = <Player>
					viewport_index = (<Player> -1)
				}
			endif
		elseif (<action> = forward)
			band_lobby_change_menu {
				menu = <menu>
				action = <action>
				Player = <Player>
				viewport_index = (<Player> -1)
			}
		endif
	else
		if (<player_state> = done)
			band_lobby_change_menu {
				menu = freestyle_final
				action = <action>
				Player = <Player>
				viewport_index = (<Player> -1)
			}
		else
			freestyle_band_lobby_unjoin Player = <Player>
		endif
	endif
endscript

script freestyle_band_lobby_get_player_from_controller 
	RequireParams \{[
			controller
		]
		all}
	counter = 0
	GetArraySize ($freestyle_player_data)
	begin
	player_controller = ($freestyle_player_data [<counter>].controller)
	if (<player_controller> = <controller>)
		return Player = (<counter> + 1)
	endif
	counter = (<counter> + 1)
	repeat <array_Size>
	return \{Player = 0}
endscript

script freestyle_band_lobby_select_mii 
	RequireParams \{[
			mii_index
			Player
		]
		all}
	printf \{qs(0xf5b0a3df)}
	if NOT GotParam \{random_mii}
		printf 'Mii Index = %d Player = %e' d = <mii_index> e = <Player>
		setstructureparam {
			array_name = freestyle_player_data
			array_index = (<Player> -1)
			param = mii_index
			value = <mii_index>
		}
		setstructureparam {
			array_name = freestyle_player_data
			array_index = (<Player> -1)
			param = mii_database
			value = FrontEnd
		}
		setstructureparam {
			array_name = freestyle_player_data
			array_index = (<Player> -1)
			param = mii_random_type
			value = None
		}
		getmiiname index = <mii_index> database = FrontEnd
		array = ($0x02b0e892)
		SetArrayElement {
			ArrayName = array
			index = (<Player> -1)
			NewValue = <mii_name>
		}
		Change 0x02b0e892 = <array>
	else
		printf 'Mii Index = Random Player = %e' d = <mii_index> e = <Player>
		setstructureparam {
			array_name = freestyle_player_data
			array_index = (<Player> -1)
			param = mii_index
			value = -1
		}
		setstructureparam {
			array_name = freestyle_player_data
			array_index = (<Player> -1)
			param = mii_database
			value = None
		}
		setstructureparam {
			array_name = freestyle_player_data
			array_index = (<Player> -1)
			param = mii_random_type
			value = generated
		}
		array = ($0x02b0e892)
		SetArrayElement {
			ArrayName = array
			index = (<Player> -1)
			NewValue = ($freestyle_band_lobby_headers [(<Player> -1)])
		}
		Change 0x02b0e892 = <array>
	endif
	player_state = ($freestyle_band_lobby_player_states [(<Player> -1)])
	if (<player_state> = in_progress)
		freestyle_band_lobby_change_menu menu = freestyle_hand_select action = forward Player = <Player>
	elseif (<player_state> = done)
		freestyle_band_lobby_change_menu menu = freestyle_final action = forward Player = <Player>
	endif
endscript

script freestyle_band_lobby_focus_mii 
	RequireParams \{[
			mii_index
			viewport_index
		]
		all}
	printf \{qs(0x21715d62)}
	printstruct <...>
	formatText checksumName = mii_face_id 'mii_face_%i' i = <viewport_index>
	if ScreenElementExists id = <mii_face_id>
		DestroyScreenElement id = <mii_face_id>
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
		ResolveScreenElementID id = {<resolved_id> child = <viewport_index>}
	endif
	if NOT GotParam \{random_mii}
		CreateScreenElement {
			id = <mii_face_id>
			Type = miiiconelement
			parent = <resolved_id>
			pos_anchor = [center center]
			just = [center center]
			Pos = $0x0d3d7955
			z_priority = 7
			mii_expression = Normal
			mii_bgcolor = $freestyle_mii_on_bg
			mii_dims = (256.0, 256.0)
			mii_index = <mii_index>
			Scale = $0x08516ebe
		}
	else
		CreateScreenElement {
			id = <mii_face_id>
			Type = SpriteElement
			parent = <resolved_id>
			pos_anchor = [center center]
			just = [center center]
			dims = (256.0, 256.0)
			Pos = $0x0d3d7955
			z_priority = 7
			texture = freestylemiirandomselected
			Scale = $0x08516ebe
		}
	endif
	<mii_face_id> :Obj_SpawnScriptNow freestyle_hud_pop_graphic_in params = {Scale = $0x08516ebe}
endscript

script freestyle_select_handedness 
	RequireParams \{[
			Player
			lefty
		]
		all}
	freestyle_set_lefty_flip Player = (<Player> -1) lefty = <lefty>
	player_state = ($freestyle_band_lobby_player_states [(<Player> -1)])
	if (<player_state> = in_progress)
		freestyle_band_lobby_change_menu menu = freestyle_difficulty_select action = forward Player = <Player>
	elseif (<player_state> = done)
		freestyle_band_lobby_change_menu menu = freestyle_final action = forward Player = <Player>
	endif
endscript

script freestyle_select_difficulty 
	RequireParams \{[
			Player
			difficulty
		]
		all}
	state_array = ($freestyle_band_lobby_player_states)
	SetArrayElement ArrayName = state_array index = (<Player> -1) NewValue = done
	Change freestyle_band_lobby_player_states = <state_array>
	setstructureparam {
		array_name = freestyle_player_data
		array_index = (<Player> -1)
		param = difficulty
		value = <difficulty>
	}
	freestyle_band_lobby_change_menu menu = freestyle_final action = forward Player = <Player>
	freestyle_band_lobby_update_helpers
endscript

script freestyle_select_finished 
	GetArraySize ($freestyle_band_lobby_player_states)
	isready = true
	num_ready = 0
	counter = 0
	begin
	if (($freestyle_band_lobby_player_states [<counter>]) = in_progress)
		isready = FALSE
	elseif (($freestyle_band_lobby_player_states [<counter>]) = done)
		num_ready = (<num_ready> + 1)
	endif
	counter = (<counter> + 1)
	repeat (<array_Size>)
	if ((<isready> = true) && (<num_ready> > 0))
		Change \{freestyle_band_lobby_first_pass = FALSE}
		Change primary_controller = <device_num>
		Change last_start_pressed_device = <device_num>
		counter = 0
		begin
		if NOT (($freestyle_band_lobby_player_states [<counter>]) = done)
			freestyle_band_lobby_fill_empty_player Player = <counter>
			if NOT (($freestyle_recording_mode) = overdub)
				setstructureparam array_name = freestyle_player_data array_index = <counter> param = original_player_type value = ai
			else
				setstructureparam array_name = freestyle_player_data array_index = <counter> param = original_player_type value = ($freestyle_band_lobby_original_rerecording_data [<counter>].original_player_type)
			endif
		else
			setstructureparam array_name = freestyle_player_data array_index = <counter> param = original_player_type value = human
			if (($freestyle_recording_mode) = overdub)
				freestyle_band_lobby_setup_player_for_overdubbing Player = <counter>
			endif
		endif
		counter = (<counter> + 1)
		repeat ($freestyle_max_players)
		freestyle_choose_default_settings_based_on_difficulty
		ds_index = ($0xc89dd984.ds)
		if (($freestyle_band_lobby_player_states [<ds_index>]) = done)
			if is_ds_connected
				if NOT StructureContains structure = ($ds_infos [0]) ds_name
					Change \{freestyle_stage_manager_name = qs(0x54ddb253)}
				else
					Change freestyle_stage_manager_name = ($ds_infos [0].ds_name)
				endif
				Change \{freestyle_stage_manager_ds = true}
			else
				Change \{freestyle_stage_manager_name = $wii_freestyle_cpu_text}
				Change \{freestyle_stage_manager_ds = FALSE}
			endif
		else
			if NOT (($freestyle_recording_mode) = overdub)
				Change \{freestyle_stage_manager_name = $wii_freestyle_cpu_text}
				Change \{freestyle_stage_manager_ds = FALSE}
			else
				if (($freestyle_current_performance_data.stage_manager_ds) = true)
					Change freestyle_stage_manager_name = ($freestyle_current_performance_data.stage_manager_name)
					Change freestyle_stage_manager_ds = ($freestyle_current_performance_data.stage_manager_ds)
				else
					Change \{freestyle_stage_manager_name = $wii_freestyle_cpu_text}
					Change \{freestyle_stage_manager_ds = FALSE}
				endif
			endif
		endif
		freestyle_mainmenu_config_ds_handler \{standard}
		if ScreenElementExists \{id = dialog_box_container}
			DestroyScreenElement \{id = dialog_box_container}
		endif
		Change \{freestyle_styleselect_after_song = 0}
		Change \{freestyle_replay_last_song_selected = 0}
		if (($freestyle_recording_mode) = overdub)
			Change \{freestyle_postgame_is_saved = -1}
		endif
		if ((<num_ready> = 1) && ($freestyle_stage_manager_ds = true))
			generic_event_choose \{state = uistate_freestyle_advanced_setup
				data = {
					ds_only
				}}
		elseif ($freestyle_needs_advanced_setup = 1)
			generic_event_choose \{state = uistate_freestyle_advanced_setup}
		elseif (($freestyle_recording_mode) = overdub)
			generic_event_replace \{data = {
					state = uistate_freestyle_game
					clear_previous_stack
				}}
		else
			generic_event_choose \{state = uistate_freestyle_styleselect}
		endif
	endif
endscript

script freestyle_band_lobby_setup_player_for_overdubbing 
	RequireParams \{[
			Player
		]
		all}
	controller = ($freestyle_player_data [<Player>].controller)
	instrument = ($freestyle_player_data [<Player>].instrument)
	mii_index = ($freestyle_player_data [<Player>].mii_index)
	mii_database = ($freestyle_player_data [<Player>].mii_database)
	mii_random_type = ($freestyle_player_data [<Player>].mii_random_type)
	original_player_type = ($freestyle_player_data [<Player>].original_player_type)
	lefty = ($freestyle_player_data [<Player>].lefty)
	difficulty = ($freestyle_player_data [<Player>].difficulty)
	player_data = ($freestyle_player_data)
	SetArrayElement ArrayName = player_data index = <Player> NewValue = ($freestyle_band_lobby_original_rerecording_data [<Player>])
	Change freestyle_player_data = <player_data>
	freestyle_set_player_param Player = <Player> param = controller value = <controller>
	freestyle_set_player_param Player = <Player> param = mii_index value = <mii_index>
	freestyle_set_player_param Player = <Player> param = mii_database value = <mii_database>
	freestyle_set_player_param Player = <Player> param = mii_random_type value = <mii_random_type>
	freestyle_set_player_param Player = <Player> param = original_player_type value = <original_player_type>
	freestyle_set_player_param Player = <Player> param = lefty value = <lefty>
	freestyle_set_player_param Player = <Player> param = difficulty value = <difficulty>
	freestyle_setup_human_player Player = <Player>
	freestyle_setup_instrument Player = <Player> instrument = <instrument>
endscript

script freestyle_band_lobby_player_allowed_for_default 
	RequireParams \{[
			Player
		]
		all}
	if NOT (($freestyle_recording_mode) = overdub)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script freestyle_get_unused_instrument 
	instrument_list = [guitar drums bass]
	GetArraySize \{instrument_list}
	counter_1 = 0
	counter_2 = 0
	begin
	current_instrument = (<instrument_list> [<counter_1>])
	instrument_is_used = FALSE
	counter_2 = 0
	begin
	if (($freestyle_player_data [<counter_2>].instrument) = <current_instrument>)
		instrument_is_used = true
	endif
	counter_2 = (<counter_2> + 1)
	repeat ($freestyle_max_players)
	if (<instrument_is_used> = FALSE)
		return unused_instrument = <current_instrument>
	endif
	counter_1 = (<counter_1> + 1)
	repeat <array_Size>
endscript

script freestyle_band_lobby_fill_empty_player 
	RequireParams \{[
			Player
		]
		all}
	if NOT (($freestyle_recording_mode) = overdub)
		freestyle_setup_ai_player Player = <Player>
		instrument = ($0x4ba416ef [<Player>])
		freestyle_setup_instrument Player = <Player> instrument = <instrument>
	else
		player_data = ($freestyle_player_data)
		SetArrayElement ArrayName = player_data index = <Player> NewValue = ($freestyle_band_lobby_original_rerecording_data [<Player>])
		Change freestyle_player_data = <player_data>
		freestyle_setup_ai_player Player = <Player>
	endif
endscript

script freestyle_band_lobby_unjoin 
	printf \{'---------UNJOINED----------'}
	formatText checksumName = mii_id 'mii_face_%i' i = (<Player> -1)
	if ScreenElementExists id = <mii_id>
		DestroyScreenElement id = <mii_id>
	endif
	formatText checksumName = background_id 'background_%i' i = (<Player> -1)
	<background_id> :se_setprops {
		rgba = [128 128 128 255]
	}
	0xa80f0dcc state = 0x41db207a index = (<Player> -1)
	freestyle_destroy_controller_lights Player = (<Player> -1)
	setstructureparam {
		array_name = freestyle_player_data
		array_index = (<Player> -1)
		param = instrument
		value = None
	}
	setstructureparam {
		array_name = freestyle_player_data
		array_index = (<Player> -1)
		param = controller
		value = -1
	}
	setstructureparam {
		array_name = freestyle_player_data
		array_index = (<Player> -1)
		param = player_type
		value = None
	}
	if NOT (($freestyle_recording_mode) = overdub)
		array = ($0x02b0e892)
		SetArrayElement {
			ArrayName = array
			index = (<Player> -1)
			NewValue = ($freestyle_band_lobby_headers [(<Player> -1)])
		}
		Change 0x02b0e892 = <array>
	else
		freestyle_band_lobby_show_rerecording_face viewport_index = (<Player> -1)
		mii_index = ($freestyle_band_lobby_original_rerecording_data [(<Player> -1)].mii_index)
		mii_database = ($freestyle_band_lobby_original_rerecording_data [(<Player> -1)].mii_database)
		getmiiname index = <mii_index> database = <mii_database>
		if (($freestyle_band_lobby_original_rerecording_data [(<Player> -1)].original_player_type) = human)
			if NOT (<mii_database> = randomdb)
				text = <mii_name>
			else
				text = ($freestyle_band_lobby_headers [(<Player> -1)])
			endif
		elseif (($freestyle_band_lobby_original_rerecording_data [(<Player> -1)].original_player_type) = ai)
			if (($freestyle_band_lobby_original_rerecording_data [(<Player> -1)].author_type) = ai)
				text = ($wii_freestyle_cpu_text)
			else
				text = ($freestyle_band_lobby_headers [(<Player> -1)])
			endif
		else
			text = ($freestyle_band_lobby_headers [(<Player> -1)])
		endif
		array = ($0x02b0e892)
		SetArrayElement {
			ArrayName = array
			index = (<Player> -1)
			NewValue = <text>
		}
		Change 0x02b0e892 = <array>
	endif
	state_array = ($freestyle_band_lobby_player_states)
	SetArrayElement ArrayName = state_array index = (<Player> -1) NewValue = not_joined
	Change freestyle_band_lobby_player_states = <state_array>
	freestyle_band_lobby_update_event_catcher
	band_lobby_change_menu action = back menu = join Player = <Player> viewport_index = (<Player> -1)
	freestyle_band_lobby_update_helpers
endscript

script freestyle_band_lobby_setup_for_rerecording 
	counter = 0
	begin
	freestyle_band_lobby_show_rerecording_face viewport_index = <counter>
	counter = (<counter> + 1)
	repeat 4
endscript

script freestyle_band_lobby_show_rerecording_face 
	RequireParams \{[
			viewport_index
		]
		all}
	ds_index = ($0xc89dd984.ds)
	if NOT (<viewport_index> = <ds_index>)
		formatText checksumName = mii_face_id 'mii_face_%i' i = <viewport_index>
		if ScreenElementExists id = <mii_face_id>
			DestroyScreenElement id = <mii_face_id>
		endif
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
			ResolveScreenElementID id = {<resolved_id> child = <viewport_index>}
		endif
		mii_index = ($freestyle_band_lobby_original_rerecording_data [<viewport_index>].mii_index)
		mii_database = ($freestyle_band_lobby_original_rerecording_data [<viewport_index>].mii_database)
		if NOT (<mii_database> = None)
			if (($freestyle_band_lobby_original_rerecording_data [<viewport_index>].author_type) = human)
				CreateScreenElement {
					id = <mii_face_id>
					Type = miiiconelement
					parent = <resolved_id>
					pos_anchor = [center center]
					just = [center center]
					Pos = $0x0d3d7955
					z_priority = 7
					mii_expression = Normal
					mii_bgcolor = $freestyle_mii_on_bg
					mii_dims = (128.0, 128.0)
					mii_index = <mii_index>
					mii_database = <mii_database>
				}
			elseif (($freestyle_band_lobby_original_rerecording_data [<viewport_index>].author_type) = ai)
				CreateScreenElement {
					id = <mii_face_id>
					Type = miiiconelement
					parent = <resolved_id>
					pos_anchor = [center center]
					just = [center center]
					Pos = $0x0d3d7955
					z_priority = 7
					mii_expression = Normal
					mii_bgcolor = $freestyle_mii_on_bg
					mii_dims = (128.0, 128.0)
					mii_index = <mii_index>
					mii_database = <mii_database>
				}
			endif
		else
			CreateScreenElement {
				id = <mii_face_id>
				Type = SpriteElement
				parent = <resolved_id>
				pos_anchor = [center center]
				just = [center center]
				dims = (128.0, 128.0)
				Pos = $0x0d3d7955
				z_priority = 7
				texture = freestylemiirandomselected
			}
		endif
		<mii_face_id> :Obj_SpawnScriptNow freestyle_hud_pop_graphic_in
	else
		if (($freestyle_current_performance_data.stage_manager_ds) = true)
			if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
				ResolveScreenElementID id = {<resolved_id> child = <viewport_index>}
			endif
			if ScreenElementExists \{id = ds_join_icon}
				DestroyScreenElement \{id = ds_join_icon}
			endif
			CreateScreenElement {
				id = ds_join_icon
				Type = SpriteElement
				parent = <resolved_id>
				pos_anchor = [center center]
				just = [center center]
				dims = (256.0, 256.0)
				Pos = $0x0d3d7955
				z_priority = 7
				texture = freestyledsselected
				Scale = (0.5, 0.5)
			}
			ds_join_icon :Obj_SpawnScriptNow \{freestyle_hud_pop_graphic_in
				params = {
					Scale = 0.5
				}}
		endif
	endif
endscript

script freestyle_band_lobby_open_ds_connect 
	index = ($0xc89dd984.ds)
	if freestyle_band_lobby_isnt_constrained Player = <index>
		if NOT is_ds_connected
			clean_up_user_control_helpers
			ui_create_ds_connection_handler mode = freestyle from = freestyle_band_lobby device_num = <device_num>
			freestyle_band_lobby_update_event_catcher \{unfocus}
		else
			if (($freestyle_band_lobby_player_states [<index>]) = done)
				freestyle_band_lobby_unjoin_ds
				Change \{freestyle_stage_manager_ds = FALSE}
			else
				freestyle_band_lobby_join_ds
				Change \{freestyle_stage_manager_ds = true}
			endif
		endif
	endif
endscript

script freestyle_band_lobby_close_ds_connect 
	ui_destroy_ds_connection_handler
	freestyle_band_lobby_update_helpers
	freestyle_band_lobby_update_event_catcher \{focus}
endscript

script freestyle_band_lobby_ds_connection_complete 
	freestyle_band_lobby_close_ds_connect
	freestyle_band_lobby_join_ds
endscript

script freestyle_band_lobby_join_ds 
	if is_ds_connected
		wiidscommunication :sendmessage \{set_lobby_status
			is_joined = 1}
		index = ($0xc89dd984.ds)
		gh5_band_screen_ui_sound player_num = (<index> + 1) choose = 1
		formatText checksumName = background_id 'background_%i' i = <index>
		<background_id> :se_setprops {
			rgba = [255 255 255 255]
		}
		0xa80f0dcc state = 0xaa02f6fc index = <index>
		state_array = ($freestyle_band_lobby_player_states)
		SetArrayElement ArrayName = state_array index = <index> NewValue = done
		Change freestyle_band_lobby_player_states = <state_array>
		Change \{freestyle_stage_manager_ds = true}
		Change freestyle_stage_manager_name = ($ds_infos [0].ds_name)
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
			ResolveScreenElementID id = {<resolved_id> child = <index>}
			array = ($0x02b0e892)
			SetArrayElement {
				ArrayName = array
				index = <index>
				NewValue = ($freestyle_stage_manager_name)
			}
			Change 0x02b0e892 = <array>
			if ScreenElementExists \{id = ds_join_icon}
				DestroyScreenElement \{id = ds_join_icon}
			endif
			CreateScreenElement {
				id = ds_join_icon
				Type = SpriteElement
				parent = <resolved_id>
				pos_anchor = [center center]
				just = [center center]
				dims = (256.0, 256.0)
				Pos = $0x0d3d7955
				z_priority = 7
				texture = freestyledsselected
				Scale = (0.75, 0.75)
			}
			ds_join_icon :Obj_SpawnScriptNow \{freestyle_hud_pop_graphic_in
				params = {
					Scale = 0.75
				}}
		endif
	endif
	SpawnScriptNow freestyle_band_lobby_hold params = {Player = <index> time = $freestyle_band_lobby_selection_delay}
	band_lobby_change_menu action = forward menu = join Player = (<index> + 1) viewport_index = <index>
	freestyle_band_lobby_update_helpers
endscript

script freestyle_band_lobby_unjoin_ds 
	if is_ds_connected
		wiidscommunication :sendmessage \{set_lobby_status
			is_joined = 0}
	endif
	index = ($0xc89dd984.ds)
	gh5_band_screen_ui_sound player_num = (<index> + 1) choose = 1
	formatText checksumName = background_id 'background_%i' i = <index>
	<background_id> :se_setprops {
		rgba = [128 128 128 255]
	}
	0xa80f0dcc state = 0x41db207a index = <index>
	if (($freestyle_recording_mode) = overdub)
		freestyle_band_lobby_show_rerecording_face viewport_index = <index>
	endif
	state_array = ($freestyle_band_lobby_player_states)
	SetArrayElement ArrayName = state_array index = <index> NewValue = not_joined
	Change freestyle_band_lobby_player_states = <state_array>
	Change \{freestyle_stage_manager_ds = FALSE}
	if NOT (($freestyle_recording_mode) = overdub)
		if is_ds_connected
			text = $wii_freestyle_cpu_text
		else
			text = ($freestyle_band_lobby_headers [<index>])
		endif
	else
		if (($freestyle_current_performance_data.stage_manager_ds) = true)
			text = ($freestyle_current_performance_data.stage_manager_name)
		else
			text = $wii_freestyle_cpu_text
		endif
	endif
	array = ($0x02b0e892)
	SetArrayElement {
		ArrayName = array
		index = <index>
		NewValue = <text>
	}
	Change 0x02b0e892 = <array>
	DestroyScreenElement \{id = ds_join_icon}
	SpawnScriptNow freestyle_band_lobby_hold params = {Player = <index> time = $freestyle_band_lobby_selection_delay}
	band_lobby_change_menu action = back menu = join Player = (<index> + 1) viewport_index = <index>
	freestyle_band_lobby_update_helpers
endscript

script freestyle_band_lobby_update_helpers 
	GetArraySize ($freestyle_band_lobby_player_states)
	counter = 0
	start_allowed = true
	number_of_players_ready = 0
	number_of_players_in_progress = 0
	if (<array_Size> > 0)
		begin
		state = ($freestyle_band_lobby_player_states [<counter>])
		if NOT (<state> = not_joined)
			if (<state> = done)
				number_of_players_ready = (<number_of_players_ready> + 1)
			else
				number_of_players_in_progress = (<number_of_players_in_progress> + 1)
				start_allowed = FALSE
			endif
		endif
		counter = (<counter> + 1)
		repeat <array_Size>
	else
		start_allowed = FALSE
	endif
	if (<start_allowed> = true)
		if NOT (<number_of_players_ready> > 0)
			start_allowed = FALSE
		endif
	endif
	clean_up_user_control_helpers
	if (<start_allowed> = true)
		if (<number_of_players_ready> = 1)
			if (($freestyle_band_lobby_player_states [3]) = done)
				add_user_control_helper \{button = red
					text = qs(0xaf4d5dd2)
					z = 1000}
				add_user_control_helper \{button = start
					text = qs(0xe4edd14e)
					z = 1000}
			else
				add_user_control_helper \{button = green
					text = qs(0xc18d5e76)
					z = 1000}
				add_user_control_helper \{button = red
					text = qs(0xaf4d5dd2)
					z = 1000}
				add_user_control_helper \{button = start
					text = qs(0xe4edd14e)
					z = 1000}
			endif
		else
			add_user_control_helper \{button = green
				text = qs(0xc18d5e76)
				z = 1000}
			add_user_control_helper \{button = red
				text = qs(0xaf4d5dd2)
				z = 1000}
			add_user_control_helper \{button = start
				text = qs(0xe4edd14e)
				z = 1000}
		endif
	else
		if NOT (<number_of_players_ready> > 0)
			if (<number_of_players_in_progress> > 0)
				add_user_control_helper \{button = green
					text = qs(0xc18d5e76)
					z = 1000}
				add_user_control_helper \{button = red
					text = qs(0xaf4d5dd2)
					z = 1000}
			else
				add_user_control_helper \{button = red
					text = qs(0xaf4d5dd2)
					z = 1000}
			endif
		else
			add_user_control_helper \{button = green
				text = qs(0xc18d5e76)
				z = 1000}
			add_user_control_helper \{button = red
				text = qs(0xaf4d5dd2)
				z = 1000}
		endif
	endif
endscript

script freestyle_band_lobby_bouncer 
	begin
	counter = 0
	begin
	0xfb853cfc = FALSE
	if ScreenElementExists \{id = ds_connection_handler_tree}
		<0xfb853cfc> = true
	elseif ($allow_controller_for_all_instruments = 1)
		<0xfb853cfc> = true
	endif
	if (<0xfb853cfc> = FALSE)
		if NOT (($freestyle_band_lobby_player_states [<counter>]) = not_joined)
			controller = ($freestyle_player_data [<counter>].controller)
			getwiicontrollertype controller = <controller>
			if (($freestyle_player_data [<counter>].instrument) = drums)
				if NOT ((<controller_type> = drumkit) || (<controller_type> = nunchuk))
					freestyle_band_lobby_unjoin Player = (<counter> + 1)
				endif
			elseif ((($freestyle_player_data [<counter>].instrument) = guitar) || (($freestyle_player_data [<counter>].instrument) = bass))
				if NOT (<controller_type> = guitar)
					freestyle_band_lobby_unjoin Player = (<counter> + 1)
				endif
			endif
		endif
	endif
	counter = (<counter> + 1)
	repeat ($freestyle_max_players)
	Wait \{1
		gameframe}
	repeat
endscript

script 0xf34cf1c5 
	LaunchEvent Type = pad_select target = ds_catcher data = {device_num = <device_num>}
endscript
