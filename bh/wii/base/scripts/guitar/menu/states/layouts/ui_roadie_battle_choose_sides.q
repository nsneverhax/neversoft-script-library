roadie_infos = [
	{
	}
	{
	}
]

script ui_init_roadie_battle_choose_sides 
	CreateScreenElement \{parent = root_window
		id = ds_event_listener
		Type = ContainerElement
		Pos = (0.0, 0.0)
		dims = (0.0, 0.0)
		event_handlers = [
			{
				ds_disconnect
				roadie_battle_choose_sides_ds_disconnect_handler
			}
			{
				controller_acquired
				roadie_battle_handle_controller_changes
			}
		]}
	Change \{g_num_lobby_local_submenus = 2}
	Change \{g_lobby_enter_from_main_menu = 1}
	Player = 1
	begin
	setplayerinfo <Player> part = guitar
	<Player> = (<Player> + 1)
	repeat 4
	ui_init_band_lobby <...>
	Change \{g_num_lobby_local_submenus = 4}
	get_current_ds_count
	roadie_battle_update_roadie_infos \{default_name = qs(0x00000000)
		default_player = 0}
	setplayerinfo \{2
		part = guitar}
	setplayerinfo \{3
		part = vocals}
	setplayerinfo \{4
		part = drum}
	setplayerinfo \{1
		in_game = 1}
	LoadPak \{'pak/oogame/oogamerb_roadie_anims.pak'
		Heap = quota_samples}
endscript

script ui_deinit_roadie_battle_choose_sides 
	if ScreenElementExists \{id = ds_event_listener}
		DestroyScreenElement \{id = ds_event_listener}
	else
		ScriptAssert \{'ds_event_listener screen element should have existed up to this point!'}
	endif
	ui_deinit_band_lobby <...>
	UnLoadPak \{'pak/oogame/oogamerb_roadie_anims.pak'}
endscript

script ui_create_roadie_battle_choose_sides 
	Change \{roadie_battle_ignore_choose_side_messages = 0}
	setplayerinfo 1 controller = ($primary_controller)
	CreateScreenElement \{parent = root_window
		id = roadie_battle_choose_sides_tree
		Type = descinterface
		desc = 'roadie_battle_choose_sides_tree'}
	ds_event_listener :se_setprops \{event_handlers = [
			{
				ds_disconnect
				roadie_battle_choose_sides_ds_disconnect_handler
			}
		]
		replace_handlers}
	if roadie_battle_choose_sides_tree :desc_resolvealias \{Name = alias_band_lobby_holder}
		Change \{g_num_lobby_local_submenus = 2}
		ui_create_band_lobby
		printf \{'----CREATED BAND LOBBY----'}
		ui_roadie_battle_get_band_lobby_menu_ids \{Player = 2}
		<desc_id_2> = <desc_id>
		<character_window_cont_id_2> = <character_window_cont_id>
		ui_roadie_battle_get_band_lobby_menu_ids \{Player = 4}
		<desc_id> :se_getprops Pos
		<desc_id_2> :se_setprops Pos = <Pos>
		<desc_id> :se_setprops alpha = 0
		<character_window_cont_id> :se_getprops Pos
		<character_window_cont_id_2> :se_setprops Pos = <Pos>
		<character_window_cont_id> :se_setprops alpha = 0
		ui_roadie_battle_get_band_lobby_menu_ids \{Player = 3}
		<desc_id> :se_setprops alpha = 0
		<character_window_cont_id> :se_setprops alpha = 0
		i = 1
		begin
		ui_roadie_battle_get_band_lobby_menu_ids Player = <i>
		<desc_id> :se_setprops Pos = {(0.0, 20.0) relative}
		if (<i> = 1)
			<desc_id> :se_setprops Pos = {(-12.0, 0.0) relative}
			<character_window_cont_id> :se_setprops Pos = {(-12.0, 0.0) relative}
		endif
		<character_window_cont_id> :se_setprops Pos = {(0.0, 20.0) relative}
		<i> = (<i> + 1)
		repeat 2
		band_lobby_desc_id :se_setprops \{band_name_text = qs(0x7ba8c686)
			game_state_text = qs(0x86c44e4e)}
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_game_state}
			<resolved_id> :se_setprops Pos = {(0.0, -20.0) relative}
		endif
	endif
	SpawnScriptNow \{roadie_battle_handle_controller_changes}
	<i> = 0
	begin
	<roadie_info> = ($roadie_infos [<i>])
	<Player> = (<roadie_info>.Player)
	<Name> = (<roadie_info>.Name)
	SpawnScriptNow roadie_battle_choose_roadie_side params = {ds_num = (<i> + 1) player_index = <Player>}
	<i> = (<i> + 1)
	formatText TextName = nametmp qs(0xb22939c6) n = <Name>
	ui_roadie_battle_choose_sides_set_ds_name ds = <i> Name = <nametmp>
	repeat 2
	wiidscommunication :sendmessage \{set_choose_sides_mode}
	<i> = 0
	begin
	<roadie_info> = ($roadie_infos [<i>])
	<Player> = (<roadie_info>.Player)
	<i> = (<i> + 1)
	if (<Player> > 0)
		wiidscommunication :sendmessage set_roadie_team ds_num = <i> team_index = (<Player> -1)
	endif
	repeat 2
	ui_roadie_battle_spawn_controller_lights \{Player = 1
		device_num = $primary_controller}
	<Player> = 1
	begin
	0x1606f4d5 Player = <Player>
	<Player> = (<Player> + 1)
	repeat 2
	Change \{g_leader_player_num = 1}
	Change \{g_net_leader_player_num = 1}
	if ($roadie_battle_hack_p2_controller_save != -1)
		band_lobby_leave \{Player = 2
			viewport_index = 1}
		band_lobby_join submenu_index = 1 device_num = ($roadie_battle_hack_p2_controller_save)
	endif
	if ($enable_debug = 0)
		get_current_ds_count
		if (<current_ds_count> = 0)
			roadie_battle_choose_sides_ds_disconnect_handler
		endif
	endif
endscript

script roadie_battle_set_ds_name_callback 
	RequireParams \{[
			ds_number
			ds_name
		]
		all}
	ds_index = (<ds_number> -1)
	SetArrayElement ArrayName = ds_infos globalarray index = <ds_index> NewValue = {ds_name = <ds_name>}
	roadie_battle_update_roadie_infos
	formatText TextName = Name qs(0xb22939c6) n = <ds_name>
	ui_roadie_battle_choose_sides_set_ds_name ds = <ds_number> Name = <Name>
endscript

script roadie_battle_update_roadie_infos 
	get_current_ds_count
	<i> = 0
	begin
	if (<i> < <current_ds_count>)
		if GotParam \{default_name}
			<ds_name> = <default_name>
		else
			<ds_info> = ($ds_infos [<i>])
			<ds_name> = (<ds_info>.ds_name)
		endif
		<is_ai> = 0
	else
		<ds_name> = qs(0xf6ca6599)
		<is_ai> = 1
	endif
	if (<current_ds_count> = 0)
		<Player> = (<i> + 1)
	else
		if GotParam \{default_player}
			<Player> = <default_player>
		else
			<Player> = ($roadie_infos [<i>].Player)
		endif
	endif
	SetArrayElement ArrayName = roadie_infos globalarray index = <i> NewValue = {Player = <Player> Name = <ds_name> is_ai = <is_ai> previous_action = Attack}
	<i> = (<i> + 1)
	repeat 2
endscript

script ui_destroy_roadie_battle_choose_sides 
	Change \{g_num_lobby_local_submenus = 4}
	ui_destroy_band_lobby
	DestroyScreenElement \{id = roadie_battle_choose_sides_tree}
endscript

script ui_roadie_battle_choose_sides_back 
	cancel_ds_operation
	if GotParam \{destroy_popup}
		destroy_generic_popup
	endif
	band_lobby_go_back
endscript

script ui_roadie_battle_check_player_configuration 
	getnumplayersingame
	gamemode_getminplayers
	if (<num_players> > 2)
		return \{FALSE}
	endif
	<is_valid> = 0
	if (<num_players> > 0)
		<all_guitar> = 1
		getfirstplayer
		begin
		if NOT playerinfoequals <Player> part = guitar
			<all_guitar> = 0
			break
		elseif NOT band_lobby_check_single_controller Player = <Player>
			<all_guitar> = 0
			break
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
		<is_valid> = <all_guitar>
	endif
	if (<is_valid> = 0)
		return \{FALSE}
	endif
	return \{true}
endscript
roadie_battle_hack_p2_controller_save = -1
roadie_battle_ignore_choose_side_messages = 0

script ui_roadie_battle_choose_sides_try_continue 
	roadie_battle_choose_sides_can_continue
	if GotParam \{can_continue}
		Change \{roadie_battle_ignore_choose_side_messages = 1}
		wiidscommunication :sendmessage \{set_holding_mode}
		ds_event_listener :se_setprops \{event_handlers = [
				{
					ds_disconnect
					roadie_battle_in_game_disconnect_handler
				}
			]
			replace_handlers}
		<num_players> = 2
		gamemode_updatenumplayers num_players = <num_players>
		Band = 1
		<Player> = 1
		begin
		setplayerinfo <Player> Band = <Band>
		<Player> = (<Player> + 1)
		<Band> = (<Band> + 1)
		repeat <num_players>
		getplayerinfo \{2
			in_game}
		if (<in_game> = 1)
			getplayerinfo \{2
				controller}
			Change roadie_battle_hack_p2_controller_save = <controller>
		else
			Change \{roadie_battle_hack_p2_controller_save = -1}
		endif
		SpawnScriptNow \{0xa2c68338}
	else
		band_lobby_change_focus_submenu_all \{focus_type = focus}
		SoundEvent \{event = ui_sfx_negative_select}
	endif
endscript

script 0xa2c68338 
	menu_transition_stoprender
	generic_event_choose \{state = uistate_songlist
		data = {
			pad_back_script = 0x779a1e05
		}}
endscript

script roadie_battle_choose_sides_can_continue 
	if NOT ui_roadie_battle_check_player_configuration
		return
	endif
	if NOT ($roadie_battle_choose_sides_block_continue = 0)
		return
	endif
	get_current_ds_count
	switch <current_ds_count>
		case 0
		return \{can_continue}
		case 1
		<roadie_info> = ($roadie_infos [0])
		if ((<roadie_info>.Player) = 0)
			return
		else
			return \{can_continue}
		endif
		case 2
		<roadie_info_1> = ($roadie_infos [0])
		<roadie_info_2> = ($roadie_infos [1])
		if ((<roadie_info_1>.Player) = (<roadie_info_2>.Player) || (<roadie_info_1>.Player) = 0 || (<roadie_info_2>.Player) = 0)
			return
		else
			return \{can_continue}
		endif
	endswitch
endscript
roadie_battle_ds_disconnect_popup_visible = 0

script roadie_battle_choose_sides_ds_disconnect_handler 
	begin
	if NOT ScreenElementExists \{id = dialog_box_desc_id}
		break
	endif
	Wait \{0.2
		Seconds}
	repeat
	Wait \{0.2
		Seconds}
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	Change \{roadie_battle_ds_disconnect_popup_visible = 1}
	create_dialog_box \{use_all_controllers
		heading_text = qs(0x79597197)
		body_text = qs(0xccf81252)
		options = [
			{
				func = roadie_battle_choose_sides_ds_disconnect_handler_continue
				text = qs(0x0e41fe46)
			}
		]
		dlog_event_handlers = [
			{
				pad_up
				nullscript
			}
			{
				pad_down
				nullscript
			}
		]}
endscript

script roadie_battle_choose_sides_ds_disconnect_handler_continue 
	Change \{roadie_battle_ds_disconnect_popup_visible = 0}
	destroy_dialog_box
	ui_roadie_battle_choose_sides_back
endscript
roadie_battle_choose_sides_block_continue = 0

script roadie_battle_choose_roadie_side \{player_index = 0}
	if ($roadie_battle_ignore_choose_side_messages = 1)
		return
	endif
	RequireParams \{[
			ds_num
		]
		all}
	Change \{roadie_battle_choose_sides_block_continue = 1}
	formatText checksumName = roadie_alias_var 'alias_roadie_%i' i = <ds_num>
	roadie_battle_choose_sides_tree :desc_resolvealias Name = <roadie_alias_var>
	<roadie_id> = <resolved_id>
	<roadie_info_array_index> = (<ds_num> -1)
	<roadie_info> = ($roadie_infos [<roadie_info_array_index>])
	<current_player> = (<roadie_info>.Player)
	<time> = 0.2
	if (<current_player> = 0 || <player_index> = 0)
		<time> = 0.1
	endif
	formatText checksumName = arrow_alias_var 'alias_roadie_battle_select_side_arrow_%i' i = <ds_num>
	roadie_battle_choose_sides_tree :desc_resolvealias Name = <arrow_alias_var>
	<arrow_id> = <resolved_id>
	formatText checksumName = arrow_alias_var 'alias_DS_%i_name' i = <ds_num>
	roadie_battle_choose_sides_tree :desc_resolvealias Name = <arrow_alias_var>
	<text_id> = <resolved_id>
	if (<player_index> = 0)
		if ScreenElementExists id = <arrow_id>
			<arrow_id> :se_setprops alpha = 1.0 time = <time>
			<text_id> :se_setprops rgba = [0 0 0 255] time = <time>
		endif
	else
		if ScreenElementExists id = <arrow_id>
			<arrow_id> :se_setprops alpha = 0.0 time = <time>
			<text_id> :se_setprops rgba = [255 255 255 255] time = <time>
		endif
	endif
	<roadie_info> = (($roadie_infos [<roadie_info_array_index>]) + {Player = <player_index>})
	SetArrayElement ArrayName = roadie_infos globalarray index = <roadie_info_array_index> NewValue = <roadie_info>
	switch <player_index>
		case 1
		<pos_anchor> = [left , center]
		SoundEvent \{event = ui_sfx_select}
		if NOT (($roadie_infos [(<ds_num> -1)].is_ai) = 1)
			GetRandomValue \{Name = random_sfx
				integer
				a = 0
				b = 1}
			if (<random_sfx> = 0)
				StopSoundsByBuss \{roadie_battle_p1_mode}
				SoundEvent \{event = roadie_battle_roadie1_choosesides}
			else
				StopSoundsByBuss \{roadie_battle_p1_mode}
				SoundEvent \{event = roadie_battle_roadie1_choosesides2}
			endif
		endif
		case 2
		<pos_anchor> = [right , center]
		SoundEvent \{event = ui_sfx_select}
		if NOT (($roadie_infos [(<ds_num> -1)].is_ai) = 1)
			GetRandomValue \{Name = random_sfx
				integer
				a = 0
				b = 1}
			if (<random_sfx> = 0)
				StopSoundsByBuss \{roadie_battle_p2_mode}
				SoundEvent \{event = roadie_battle_roadie2_choosesides}
			else
				StopSoundsByBuss \{roadie_battle_p2_mode}
				SoundEvent \{event = roadie_battle_roadie2_choosesides2}
			endif
		endif
		case 0
		<pos_anchor> = [center , center]
		default
		printf \{'Invalid player index supplied.'}
		Change \{roadie_battle_choose_sides_block_continue = 0}
		return
	endswitch
	if ScreenElementExists id = <roadie_id>
		<roadie_id> :se_setprops pos_anchor = <pos_anchor>
		<roadie_id> :se_setprops Pos = (0.0, 0.0) time = <time>
	endif
	get_current_ds_count
	if (<current_ds_count> < 2)
		if NOT GotParam \{auto_ai_move}
			<other_ds_num> = (3 - <ds_num>)
			<other_player_index> = 0
			if (<player_index> > 0)
				<other_player_index> = (3 - <player_index>)
			endif
			SpawnScriptNow {
				roadie_battle_choose_roadie_side
				params = {
					ds_num = <other_ds_num>
					player_index = <other_player_index>
					auto_ai_move
				}
			}
		endif
	endif
	wiidscommunication :sendmessage set_roadie_team ds_num = <ds_num> team_index = (<player_index> -1)
	Wait \{0.25
		Seconds}
	Change \{roadie_battle_choose_sides_block_continue = 0}
	if ScreenElementExists id = <roadie_id>
		roadie_battle_update_user_control_helpers
	endif
endscript

script roadie_battle_update_user_control_helpers 
	if ScreenElementExists \{id = dialog_box_desc_id}
		return
	endif
	roadie_battle_choose_sides_can_continue
	clean_up_user_control_helpers
	if GotParam \{menu}
		if (<menu> = leave_lobby_roadie_battle)
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 1000}
		else
			if GotParam \{can_continue}
				add_user_control_helper \{text = qs(0x182f0173)
					button = start
					z = 1000}
			endif
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 1000}
		endif
	else
		if GotParam \{can_continue}
			add_user_control_helper \{text = qs(0x182f0173)
				button = start
				z = 1000}
		endif
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 1000}
	endif
endscript

script ui_roadie_battle_get_band_lobby_menu_ids 
	<i> = (<Player> - 1)
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
		ResolveScreenElementID id = [
			{id = <resolved_id>}
			{index = <i>}
		]
		<desc_id> = <resolved_id>
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_character_window_hmenu}
		ResolveScreenElementID id = [
			{id = <resolved_id>}
			{index = <i>}
		]
		<character_window_cont_id> = <resolved_id>
	endif
	return desc_id = <desc_id> character_window_cont_id = <character_window_cont_id>
endscript

script ui_roadie_battle_choose_sides_set_ds_name 
	RequireParams \{[
			ds
			Name
		]
		all}
	if (<ds> = 1)
		roadie_battle_choose_sides_tree :se_setprops {roadie_name_1_text = <Name>}
	elseif (<ds> = 2)
		roadie_battle_choose_sides_tree :se_setprops {roadie_name_2_text = <Name>}
	else
		ScriptAssert \{'Invalid DS number given! (Must be 1 or 2)'}
	endif
endscript

script ui_roadie_battle_spawn_controller_lights 
	RequireParams \{[
			Player
			device_num
		]
		all}
	ui_roadie_battle_get_band_lobby_menu_ids Player = <Player>
	if GotParam \{desc_id}
		freestyle_spawn_controller_lights {
			Pos = (150.0, 290.0)
			Scale = 1
			spacing = 16
			z_priority = 100
			parent = <desc_id>
			Player = <Player>
			controller = <device_num>
		}
		<light_id> :se_setprops alpha = 0.0
		<light_id> :se_setprops alpha = 1.0 time = 0.5 motion = ease_in
	endif
endscript

script ui_roadie_battle_destroy_controller_lights 
	RequireParams \{[
			Player
		]
		all}
	formatText checksumName = light_id 'controller_lights_%i' i = <Player>
	if ScreenElementExists id = <light_id>
		<light_id> :se_setprops alpha = 0.0 time = 0.5 motion = ease_out
		<light_id> :se_waitprops
		freestyle_destroy_controller_lights Player = <Player>
	endif
endscript
roadie_battle_in_controller_disconnected_popup = 0

script roadie_battle_handle_controller_changes 
	ui_event_wait_for_safe
	begin
	if NOT ScreenElementExists \{id = dialog_box_container}
		break
	endif
	WaitOneGameFrame
	repeat
	Wait \{0.5
		Seconds}
	ui_event_get_top
	if (<base_name> = 'roadie_battle_choose_sides')
		if ($roadie_battle_in_controller_disconnected_popup = 0)
			if NOT band_lobby_check_single_controller \{Player = 1}
				band_lobby_change_focus_submenu_all \{focus_type = unfocus}
				LaunchEvent \{Type = unfocus
					target = ds_event_listener}
				getplayerinfo \{1
					controller}
				data = {device_num = <controller> is_popup from_roadie_battle_choose_sides}
				ui_event event = menu_change state = uistate_controller_disconnect data = <data>
				Change \{roadie_battle_in_controller_disconnected_popup = 1}
			endif
		endif
		if NOT band_lobby_check_single_controller \{Player = 2}
			band_lobby_leave \{Player = 2
				viewport_index = 1}
		endif
	endif
endscript

script ui_roadie_battle_choose_sides_controller_disconnect_update 
	setscriptcannotpause
	SetButtonEventMappings \{unblock_menu_input}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = unfocus
			target = menu_tutorial}
	endif
	old_text = qs(0x03ac90f0)
	begin
	RemoveParameter \{array_Size}
	disconnected_controllers = []
	Player = 1
	begin
	band_lobby_get_submenu_data viewport_index = (<Player> -1) param = occupied
	printf <submenu_data>
	if ((<Player> = 1) || (<submenu_data> = 1))
		if NOT band_lobby_check_single_controller Player = <Player>
			getplayerinfo <Player> controller
			AddArrayElement array = <disconnected_controllers> element = <controller>
			<disconnected_controllers> = <array>
		endif
	endif
	Player = (<Player> + 1)
	repeat 2
	GetArraySize <disconnected_controllers>
	if (<array_Size> > 0)
		text = qs(0xfbc815c6)
		i = 0
		begin
		controller = (<disconnected_controllers> [<i>])
		get_player_num_from_controller controller_index = <controller>
		if (<player_num> != -1)
			getplayerinfo <player_num> part
			player_display = (<controller> + 1)
			switch (<part>)
				case guitar
				case bass
				formatText TextName = text $wii_controller_disconnect_guitar t = <text> j = <player_display>
				case drum
				formatText TextName = text $wii_controller_disconnect_drums t = <text> j = <player_display>
				case vocals
				formatText TextName = text $wii_controller_disconnect_mic t = <text> j = <player_display>
			endswitch
		endif
		i = (<i> + 1)
		repeat <array_Size>
	else
		ui_controller_disconnect_continue
		return
	endif
	if NOT GotParam \{no_text}
		if NOT (<old_text> = <text>)
			clean_up_user_control_helpers
			set_user_control_color \{text_rgba = [
					200
					200
					200
					255
				]
				bg_rgba = [
					0
					0
					0
					200
				]}
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 1000000
				all_buttons}
			se_setprops {dlog_body_text = <text>}
			old_text = <text>
		endif
	else
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ui_return_roadie_battle_choose_sides 
	roadie_battle_update_user_control_helpers
endscript
