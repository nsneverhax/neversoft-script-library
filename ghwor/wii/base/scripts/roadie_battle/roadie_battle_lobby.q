roadie_battle_lobby_pane_slide_time_secs = 0.35000002
roadie_battle_in_lobby = FALSE
roadie_battle_lobby_first_time = true
roadie_battle_lobby_showing_pane_pos = (0.0, 0.0)
roadie_battle_lobby_hidden_pane_pos = (0.0, 0.0)
roadie_battle_lobby_scrolling_names = [
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
	qs(0x03ac90f0)
]
roadie_battle_band_lobby_popup_pending_via_ticker = FALSE

script roadie_battle_lobby_create 
	if ($roadie_battle_in_lobby = FALSE)
		Change \{roadie_battle_in_lobby = true}
		Change \{roadie_battle_lobby_scrolling_names = [
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
				qs(0x03ac90f0)
			]}
		roadie_battle_lobby_create_roadie_bars
		roadie_battle_lobby_send_all_player_info
		roadie_battle_lobby_enter
	endif
endscript

script roadie_battle_lobby_destroy 
	if ($roadie_battle_in_lobby = true)
		Change \{roadie_battle_in_lobby = FALSE}
		wiidscommunication :sendmessage \{set_holding_mode}
	endif
endscript

script roadie_battle_lobby_continue 
	roadie_battle_lobby_destroy
	Change \{roadie_battle_lobby_first_time = FALSE}
endscript

script roadie_battle_lobby_create_roadie_bars 
	<viewport> = 0
	band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu
		param = vmenu_id}
	begin
	ResolveScreenElementID id = [
		{id = <vmenu_id>}
		{index = <viewport>}
	]
	formatText checksumName = bar_id 'roadie_bar_%v' v = <viewport>
	CreateScreenElement {
		parent = <resolved_id>
		id = <bar_id>
		Type = descinterface
		desc = 'roadie_battle_roadie_lobby_bar'
		Pos = (-12.0, 300.0)
		pos_anchor = [center center]
		just = [center center]
		tags = {
			state = showing
		}
	}
	<viewport> = (<viewport> + 1)
	repeat $max_roadie_count
	roadie_bar_0 :desc_resolvealias \{Name = alias_roadie_pane
		param = pane_id}
	<pane_id> :se_getprops
	Change roadie_battle_lobby_showing_pane_pos = <Pos>
	setpaircomponents hide_pos X = (<Pos> [0]) y = (<Pos> [1] - <dims> [1])
	Change roadie_battle_lobby_hidden_pane_pos = <hide_pos>
	<Player> = 1
	begin
	if roadie_battle_find_roadie_for_player Player = <Player>
		roadie_battle_lobby_show_roadie_bar Player = <Player> instant = true
	else
		roadie_battle_lobby_hide_roadie_bar Player = <Player> instant = true
	endif
	<Player> = (<Player> + 1)
	repeat $max_roadie_count
endscript

script roadie_battle_lobby_enter 
	<roadie> = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = Active
	roadie_battle_get_roadie_info roadie = <roadie> param = ds_aid
	if (<Active> = true)
		if ($roadie_battle_lobby_first_time = true)
			roadie_battle_lobby_request_signin ds_aid = <ds_aid>
		endif
		roadie_battle_lobby_goto_initial_ds_menu roadie = <roadie>
	endif
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
endscript

script roadie_battle_lobby_all_goto_initial_ds_menu 
	<roadie> = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = Active
	if (<Active> = true)
		roadie_battle_lobby_goto_initial_ds_menu roadie = <roadie>
	endif
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
endscript

script roadie_battle_lobby_goto_initial_ds_menu \{roadie = !i1768515945}
	roadie_battle_get_roadie_info roadie = <roadie> param = ds_aid
	roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
	roadie_battle_get_roadie_info roadie = <roadie> param = avatar
	roadie_battle_get_roadie_info roadie = <roadie> param = Player
	if (<signed_in> = FALSE)
		roadie_battle_goto_ds_menu aid = <ds_aid> menu_name = signin
	elseif (<avatar> = -1)
		roadie_battle_goto_ds_menu aid = <ds_aid> menu_name = chooseavatar
	elseif (<Player> = -1)
		roadie_battle_goto_ds_menu aid = <ds_aid> menu_name = choosepartner
	else
		roadie_battle_goto_ds_menu aid = <ds_aid> menu_name = ready
	endif
endscript

script roadie_battle_lobby_request_avatar \{ds_aid = !i1768515945
		avatar = !i1768515945}
	if ($roadie_battle_in_lobby = FALSE)
		return
	endif
	if roadie_battle_find_roadie_by_aid aid = <ds_aid>
		<allow> = FALSE
		<target_roadie> = <roadie>
		<requested_avatar> = <avatar>
		if (<avatar> >= 0)
			<roadie> = 0
			<allow> = true
			begin
			roadie_battle_get_roadie_info roadie = <roadie> param = Active
			roadie_battle_get_roadie_info roadie = <roadie> param = avatar
			if ((<Active> = true) && (<avatar> = <requested_avatar>) && (<roadie> != <target_roadie>))
				<allow> = FALSE
				break
			endif
			<roadie> = (<roadie> + 1)
			repeat $max_roadie_count
		else
			<allow> = true
		endif
		if (<allow> = true)
			roadie_battle_set_roadie_info roadie = <target_roadie> param = avatar value = <requested_avatar>
			roadie_battle_get_roadie_info roadie = <target_roadie> param = Player
			if ((<Player> >= 1) && (<requested_avatar> >= 0))
				roadie_battle_lobby_update_roadie_portrait Player = <Player>
			endif
			wiidscommunication :sendmessage {
				roadie_confirm_avatar
				ds_aid = <ds_aid>
				avatar = <requested_avatar>
			}
		endif
	endif
endscript

script roadie_battle_lobby_request_partner \{ds_aid = !i1768515945
		Player = !i1768515945}
	if ($roadie_battle_in_lobby = FALSE)
		return
	endif
	if roadie_battle_find_roadie_by_aid aid = <ds_aid>
		<allow> = FALSE
		<target_roadie> = <roadie>
		if (<Player> >= 1)
			<allow> = true
			if roadie_battle_find_roadie_for_player Player = <Player>
				if (<roadie> != <target_roadie>)
					<allow> = FALSE
				endif
			endif
		else
			<allow> = true
		endif
		if (<allow> = true)
			roadie_battle_get_roadie_info roadie = <target_roadie> param = Player return_param = old_player
			roadie_battle_assign_roadie_to_player roadie = <target_roadie> Player = <Player>
			if (<old_player> >= 1)
				roadie_battle_lobby_hide_roadie_bar Player = <old_player>
			endif
			if (<Player> >= 1)
				roadie_battle_lobby_show_roadie_bar Player = <Player>
			endif
			if (<Player> >= 1)
				SoundEvent \{event = audio_ui_band_lobby_complete}
				roadie_battle_play_roadie_vo roadie = <target_roadie> vo_type = join
			endif
			wiidscommunication :sendmessage {
				roadie_confirm_partner
				ds_aid = <ds_aid>
				Player = <Player>
			}
		endif
	endif
endscript

script roadie_battle_lobby_request_signin \{ds_aid = !i1768515945}
	if ($roadie_battle_in_lobby = true)
		if roadie_battle_find_roadie_by_aid aid = <ds_aid>
			roadie_battle_signin roadie = <roadie>
			wiidscommunication :sendmessage {
				roadie_confirm_signin
				ds_aid = <ds_aid>
			}
		endif
	endif
endscript

script roadie_battle_lobby_request_signout \{ds_aid = !i1768515945}
	if ($roadie_battle_in_lobby = true)
		if roadie_battle_find_roadie_by_aid aid = <ds_aid>
			roadie_battle_lobby_request_avatar ds_aid = <ds_aid> avatar = -1
			roadie_battle_lobby_request_partner ds_aid = <ds_aid> Player = -1
			roadie_battle_signout roadie = <roadie>
			wiidscommunication :sendmessage {
				roadie_confirm_signout
				ds_aid = <ds_aid>
			}
		endif
	endif
endscript

script roadie_battle_lobby_continue_check 
	getnumplayersingame
	vocals_get_num_vocalists
	if (<num_vocalists> > 0)
		return \{FALSE
			reason = roadie_battle_vocals_not_supported}
	endif
	if ($ds_debug_skipped_connection = true)
		return \{true}
	endif
	if roadie_battle_are_there_disconnected_dses
		return \{FALSE
			reason = roadie_battle_connection_problems}
	endif
	if ($signed_in_roadie_count > <num_players>)
		return \{FALSE
			reason = roadie_battle_need_more_players}
	endif
	if ($signed_in_roadie_count = 0)
		return \{FALSE
			reason = roadie_battle_roadies_not_ready}
	endif
	if NOT roadie_battle_lobby_are_roadies_ready
		return \{FALSE
			reason = roadie_battle_roadies_not_ready}
	endif
	if ($roadie_battle_mode = competitive)
		if (<num_players> < 2)
			return \{FALSE
				reason = roadie_battle_competitive_need_more_players}
		elseif (<num_players> != $signed_in_roadie_count)
			return \{FALSE
				reason = roadie_battle_competitive_invalid_roadies}
		elseif NOT band_lobby_is_matching_instruments
			return \{FALSE
				reason = roadie_battle_competitive_invalid_instruments}
		endif
	endif
	return \{true}
endscript

script roadie_battle_lobby_is_roadie_ready \{roadie = !i1768515945}
	roadie_battle_get_roadie_info roadie = <roadie> param = Player
	roadie_battle_get_roadie_info roadie = <roadie> param = avatar
	if ((<Player> = -1) || (<avatar> = -1))
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script roadie_battle_lobby_are_roadies_ready 
	<roadie> = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
	if (<signed_in> = true)
		if NOT roadie_battle_lobby_is_roadie_ready roadie = <roadie>
			return \{FALSE}
		endif
	endif
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
	return \{true}
endscript

script roadie_battle_lobby_send_all_player_info 
	getmaxlocalplayers
	<Player> = 1
	begin
	roadie_battle_lobby_update_player_info Player = <Player>
	<Player> = (<Player> + 1)
	repeat <max_players>
endscript

script roadie_battle_lobby_update_player_info \{Player = !i1768515945}
	getplayerinfo Player = <Player> in_game
	getplayerinfo Player = <Player> controller
	getplayerinfo Player = <Player> difficulty
	getplayerinfo Player = <Player> part
	getplayerinfo Player = <Player> lefty_flip
	getplayerinfo Player = <Player> character_id
	getplayerinfo Player = <Player> character_savegame
	get_fullname_for_player Player = <Player>
	convert_to_ds_enum {
		order_array_name = roadie_battle_player_difficulty_order
		checksum_value = <difficulty>
		out_name = ds_difficulty
	}
	convert_to_ds_enum {
		order_array_name = roadie_battle_instrument_order
		checksum_value = <part>
		out_name = ds_instrument
	}
	wiidscommunication :sendmessage {
		player_info
		player_index = <Player>
		in_game = <in_game>
		controller = <controller>
		instrument = <ds_instrument>
		difficulty = <ds_difficulty>
		lefty = <lefty_flip>
		Name = <fullname>
	}
	<unassign_roadie> = FALSE
	if (<in_game> = 0)
		<unassign_roadie> = true
	elseif (<part> = vocals)
		<unassign_roadie> = true
	endif
	if (<unassign_roadie> = true)
		if roadie_battle_find_roadie_for_player Player = <Player>
			roadie_battle_get_roadie_info roadie = <roadie> param = ds_aid
			roadie_battle_lobby_request_signout ds_aid = <ds_aid>
			roadie_battle_goto_ds_menu aid = <ds_aid> menu_name = signin
		endif
	endif
endscript

script roadie_battle_lobby_show_roadie_bar \{Player = !i1768515945
		instant = 0x00000028}
	if roadie_battle_find_roadie_for_player Player = <Player> assert = true
		roadie_battle_get_roadie_info roadie = <roadie> param = avatar
		formatText checksumName = bar_id 'roadie_bar_%v' v = (<Player> - 1)
		formatText checksumName = icon_texture 'lobby_roadie_portrait_%c' c = (<avatar> + 1)
		<bar_id> :GetTags
		<bar_id> :se_setprops portrait_sprite_texture = <icon_texture>
		if (<instant> = true)
			<bar_id> :se_setprops portrait_sprite_alpha = 1.0 roadie_pane_pos = $roadie_battle_lobby_showing_pane_pos
			<bar_id> :SetTags state = showing
		elseif ((<state> != showing) && (<state> != sliding_in))
			<bar_id> :obj_killallspawnedscripts
			<bar_id> :Obj_SpawnScriptNow {
				roadie_battle_lobby_slide_in_pane
				params = {
					instant = <instant>
				}
			}
		endif
	endif
endscript

script roadie_battle_lobby_hide_roadie_bar \{Player = !i1768515945
		instant = 0x00000028}
	formatText checksumName = bar_id 'roadie_bar_%v' v = (<Player> - 1)
	<bar_id> :GetTags
	if (<instant> = true)
		<bar_id> :se_setprops portrait_sprite_alpha = 0.0 roadie_pane_pos = $roadie_battle_lobby_hidden_pane_pos
		<bar_id> :SetTags state = hidden
	elseif ((<state> != hidden) && (<state> != sliding_out))
		<bar_id> :obj_killallspawnedscripts
		<bar_id> :Obj_SpawnScriptNow {
			roadie_battle_lobby_slide_out_pane
			params = {
				instant = <instant>
			}
		}
	endif
endscript

script roadie_battle_lobby_update_roadie_portrait \{Player = !i1768515945}
	if roadie_battle_find_roadie_for_player Player = <Player> assert = true
		roadie_battle_get_roadie_info roadie = <roadie> param = avatar
		formatText checksumName = bar_id 'roadie_bar_%v' v = (<Player> - 1)
		formatText checksumName = icon_texture 'lobby_roadie_portrait_%c' c = (<avatar> + 1)
		<bar_id> :GetTags
		if (<state> = showing)
			<bar_id> :Obj_SpawnScriptNow {
				roadie_battle_lobby_change_portrait_fade
				params = {
					portrait_sprite_texture = <icon_texture>
				}
			}
		else
			<bar_id> :se_setprops portrait_sprite_texture = <icon_texture>
		endif
	endif
endscript

script roadie_battle_lobby_slide_in_pane 
	SetTags \{state = sliding_in}
	desc_resolvealias \{Name = alias_roadie_pane
		param = pane_id}
	<pane_id> :se_setprops {
		Pos = $roadie_battle_lobby_showing_pane_pos
		time = $roadie_battle_lobby_pane_slide_time_secs
		motion = ease_out
	}
	Wait ($roadie_battle_lobby_pane_slide_time_secs / 2) Seconds
	se_setprops {
		portrait_sprite_alpha = 1.0
		time = ($roadie_battle_lobby_pane_slide_time_secs / 2)
		motion = ease_in
	}
	se_waitprops
	SetTags \{state = showing}
endscript

script roadie_battle_lobby_slide_out_pane 
	SetTags \{state = sliding_out}
	se_setprops {
		portrait_sprite_alpha = 0.0
		time = ($roadie_battle_lobby_pane_slide_time_secs / 2)
	}
	Wait ($roadie_battle_lobby_pane_slide_time_secs / 2) Seconds
	desc_resolvealias \{Name = alias_roadie_pane
		param = pane_id}
	<pane_id> :se_setprops {
		Pos = $roadie_battle_lobby_hidden_pane_pos
		time = $roadie_battle_lobby_pane_slide_time_secs
		motion = ease_in
	}
	<pane_id> :se_waitprops
	SetTags \{state = hidden}
endscript

script roadie_battle_lobby_change_portrait_fade \{portrait_sprite_texture = !q1768515945}
	se_setprops \{portrait_sprite_alpha = 0.0
		time = 0.25}
	se_waitprops
	se_setprops portrait_sprite_texture = <portrait_sprite_texture>
	se_setprops \{portrait_sprite_alpha = 1.0
		time = 0.25}
endscript

script roadie_battle_lobby_resolve_gamertag_objects \{viewport = !i1768515945}
	band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu
		param = vmenu_id}
	if NOT ResolveScreenElementID id = [{id = <vmenu_id>} {index = <viewport>}]
		ScriptAssert \{'Can\'t find viewport'}
	endif
	if NOT ResolveScreenElementID id = {<resolved_id> child = viewport_menu}
		ScriptAssert \{'Can\'t find ScreenElement viewport_menu'}
	endif
	if NOT ResolveScreenElementID id = {<resolved_id> child = player_info_cont}
		ScriptAssert \{'Can\'t find ScreenElement player_info_cont'}
	endif
	if NOT ResolveScreenElementID id = {<resolved_id> child = gamertag} param = gamertag_container
		ScriptAssert \{'Can\'t find ScreenElement GamerTag'}
	endif
	if NOT ResolveScreenElementID id = {<gamertag_container> child = gamertag} param = gamertag_text
		ScriptAssert \{'Can\'t find ScreenElement GamerTag'}
	endif
	return gamertag_container = <gamertag_container> gamertag_text = <gamertag_text>
endscript

script roadie_battle_lobby_should_scroll_names \{names = 0x69696969}
	roadie_battle_lobby_resolve_gamertag_objects \{viewport = 0}
	<gamertag_text> :se_getprops
	calculate_text_width {
		text = <names>
		font = <font>
		Scale = <internal_scale>
	}
	if (<text_width> >= (<dims> [0]))
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script roadie_battle_lobby_destroy_scrolling_names \{viewport = !i1768515945}
	formatText checksumName = window_id 'roadie_names_%v' v = <viewport>
	if ScreenElementExists id = <window_id>
		DestroyScreenElement id = <window_id>
	endif
	SetArrayElement {
		globalarray
		ArrayName = roadie_battle_lobby_scrolling_names
		index = <viewport>
		NewValue = qs(0x03ac90f0)
	}
endscript

script roadie_battle_lobby_create_scrolling_names \{viewport = !i1768515945
		names = 0x69696969}
	if ($roadie_battle_in_lobby = FALSE)
		return
	endif
	if ($roadie_battle_lobby_scrolling_names [<viewport>] != <names>)
		formatText checksumName = window_id 'roadie_names_%v' v = <viewport>
		if ScreenElementExists id = <window_id>
			DestroyScreenElement id = <window_id>
		endif
		roadie_battle_lobby_resolve_gamertag_objects viewport = <viewport>
		<gamertag_text> :se_getprops
		CreateScreenElement {
			id = <window_id>
			parent = <gamertag_container>
			Type = WindowElement
			Pos = <Pos>
			pos_anchor = <pos_anchor>
			dims = <dims>
			just = [center center]
			internal_just = [center center]
			z_priority = <z_priority>
		}
		<window_id> :obj_spawnscript {
			scroll_ticker_text
			params = {
				ticker_text = <names>
				ticker_space = qs(0x8b73fd0e)
				ticker_pos = (0.0, 18.0)
				ticker_just = <just>
				ticker_parent = <window_id>
				ticker_font = <font>
				ticker_x_scale = (<internal_scale> [0])
				ticker_y_scale = (<internal_scale> [1])
				ticker_rgba1 = <rgba>
				ticker_rgba2 = <rgba>
				ticker_alpha = 1.0
				ticker_z_priority = <z_priority>
				time = 16
				use_shadow = 1
			}
		}
		SetArrayElement {
			globalarray
			ArrayName = roadie_battle_lobby_scrolling_names
			index = <viewport>
			NewValue = <names>
		}
	endif
endscript

script roadie_battle_allow_beginner_difficulty \{Player = !i1768515945}
	if inroadiebattlemode
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script roadie_battle_change_difficulty_if_not_allowed \{Player = !i1768515945}
	getplayerinfo <Player> difficulty
	if (<difficulty> = beginner)
		if NOT roadie_battle_allow_beginner_difficulty Player = <Player>
			setplayerinfo <Player> difficulty = easy
		endif
	endif
endscript

script roadie_battle_lobby_goto_roadie_battle \{device_num = !i1768515945}
	if NOT roadie_battle_lobby_should_have_roadie_button
		return
	endif
	getplayerinfo ($g_leader_player_num) controller out = leader_controller
	if (<device_num> != <leader_controller>)
		return
	endif
	band_lobby_desc_id :se_setprops \{block_events}
	switch ($g_lobby_state)
		case quickplay
		<default_selection> = roadie_battle_mode_coop
		case vs
		<default_selection> = roadie_battle_mode_competitive
		default
		ScriptAssert \{'unsupported mode'}
	endswitch
	ui_sfx \{menustate = Generic
		uitype = select}
	SpawnScriptNow {
		roadie_battle_lobby_build_ui_stack_to_mode_select
		params = {
			device_num = <device_num>
			default_selection = <default_selection>
		}
	}
endscript

script roadie_battle_lobby_should_have_roadie_button 
	if ininternetmode
		return \{FALSE}
	elseif band_lobby_is_career_state
		return \{FALSE}
	elseif inroadiebattlemode
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script roadie_battle_goto_lobby \{device_num = !i1768515945}
	switch ($roadie_battle_mode)
		case coop
		main_menu_select_band_lobby lobby_mode = quickplay device_num = <device_num>
		case competitive
		main_menu_select_band_lobby lobby_mode = vs device_num = <device_num>
		default
		ScriptAssert \{'unhandled roadie battle mode %m'
			m = $roadie_battle_mode}
	endswitch
endscript

script roadie_battle_lobby_back 
	wiidscommunication :sendmessage \{set_holding_mode}
	<roadie> = 0
	begin
	roadie_battle_get_roadie_info roadie = <roadie> param = signed_in
	if (<signed_in> = true)
		roadie_battle_get_roadie_info roadie = <roadie> param = ds_aid
		roadie_battle_lobby_request_signout ds_aid = <ds_aid>
	endif
	<roadie> = (<roadie> + 1)
	repeat $max_roadie_count
	generic_event_back \{state = uistate_roadie_battle_choose_mode}
endscript

script roadie_battle_lobby_get_mode_name \{mode = 0x00000018}
	switch (<mode>)
		case coop
		<mode_name> = qs(0x8b3e98a6)
		case competitive
		<mode_name> = qs(0x86c44e4e)
	endswitch
	return text_params = {a = <mode_name>}
endscript

script roadie_battle_lobby_get_current_mode_name 
	roadie_battle_lobby_get_mode_name mode = ($roadie_battle_mode)
	return text_params = <text_params>
endscript

script roadie_battle_lobby_change_mode \{mode = 0x00000018
		Player = !i1768515945
		submenu_index = !i1768515945}
	Change roadie_battle_mode = <mode>
	roadie_battle_send_mode
	switch (<mode>)
		case coop
		<lobby> = quickplay
		case competitive
		<lobby> = vs
	endswitch
	band_lobby_change_lobby Player = <Player> submenu_index = <submenu_index> lobby = <lobby> action = back
endscript

script roadie_battle_lobby_build_ui_stack_to_mode_select \{device_num = !i1768515945
		default_selection = !q1768515945}
	pushdisablerendering \{context = build_roadie_battle_stack
		Type = stack}
	pushblockbuttoneventmappings
	ui_event_wait_for_safe
	ui_event \{event = menu_back
		state = uistate_mainmenu}
	ui_event_wait_for_safe
	ui_event {
		event = menu_change
		state = uistate_roadie_battle_choose_mode
		data = {
			device_num = <device_num>
			default_selection = <default_selection>
		}
	}
	ui_event_wait_for_safe
	popdisablerendering \{context = build_roadie_battle_stack
		Type = stack}
	popblockbuttoneventmappings
endscript
