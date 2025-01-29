
script spawn_reject 
	begin
	if NOT isdwcinpotentiallyblockingcall
		break
	else
		printf \{qs(0x76848ad4)}
		Wait \{1
			gameframe}
	endif
	repeat
	if NOT NetSessionFunc \{Obj = session
			func = is_matchmaking_active}
		printf \{qs(0x3f1263f9)}
		return
	endif
	ui_event_get_top
	if (<base_name> = 'band_mode')
		cancel_career_search_early
	else
		if NOT cancel_start_matchmaking
			return \{FALSE}
		endif
	endif
	getfriendname index = <index>
	formatText TextName = reject_text ($wii_reject_dialog) a = <nickname> b = ($reject_phrases_full [<phrase>])
	create_generic_popup {
		title = $wii_rejected
		ok_menu
		message = <reject_text>
		ok_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose destroy_invite_popups}
		]
		Priority = 5
		back_script = destroy_invite_popups
	}
	return \{true}
endscript
should_spawn_disconnect = 0

script safe_spawn_disconnect 
	Change \{should_spawn_disconnect = 1}
endscript

script check_player_disconnect 
	begin
	if ($should_spawn_disconnect = 1)
		if spawn_disconnect
			Change \{should_spawn_disconnect = 0}
			return
		endif
	endif
	if NOT NetSessionFunc \{Obj = session
			func = is_matchmaking_active}
		printf \{qs(0xa02f6eba)}
		return
	endif
	Wait \{10
		gameframes}
	repeat
endscript

script check_invite_valid 
	RequireParams \{[
			friend_index
		]
		all}
	begin
	getfriendinfo
	if NOT check_invite index = <friend_index>
		Wait \{30.0
			Seconds}
		if NOT check_invite index = <friend_index>
			if spawn_invite_invalid
				return
			endif
		endif
	endif
	if NOT NetSessionFunc \{Obj = session
			func = is_matchmaking_active}
		printf \{qs(0xe2dfc758)}
		return
	endif
	Wait \{10
		gameframes}
	repeat
endscript

script spawn_invite_invalid 
	ui_event_get_top
	if (<base_name> = 'band_mode')
		cancel_career_search_early
	else
		if NOT cancel_start_matchmaking \{from_invalid}
			return \{FALSE}
		endif
	endif
	create_generic_popup \{title = $wii_error
		ok_menu
		message = $wii_invite_error_invalid
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				destroy_invite_popups
			}
		]
		Priority = 5
		back_script = destroy_invite_popups}
	return \{true}
endscript

script spawn_disconnect 
	ui_event_get_top
	if (<base_name> = 'band_mode')
		cancel_career_search_early
	else
		if NOT cancel_start_matchmaking
			return \{FALSE}
		endif
	endif
	create_generic_popup \{title = $wii_error
		ok_menu
		message = $wii_wifi_friend_disconnect
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				destroy_generic_popup
			}
		]
		Priority = 5
		back_script = destroy_generic_popup}
	return \{true}
endscript

script ok_after_reject 
	destroy_generic_popup
	LaunchEvent \{Type = pad_back}
endscript

script spawn_friend_left 
	ScriptAssert \{'spawn_friend_left: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script ok_after_friend_left 
	destroy_generic_popup
	network_player_lobby_message \{Type = character_select
		action = deselect}
	if NOT ($ui_flow_manager_state [0] = online_character_select_fs)
		ui_flow_manager_respond_to_action \{action = handle_dropped_client}
		Wait \{1
			gameframe}
	endif
	quit_network_game
endscript
invite_pos = (150.0, 150.0)

script spawn_invite 
	getfriendname index = <index>
	formatText TextName = friendname qs(0x48c6d14c) d = <nickname>
	printf qs(0x08ca0eda) s = <nickname>
	formatText checksumName = invite_id '%n%i' n = <nickname> i = <index> AddToStringLookup = true
	if ScreenElementExists id = <invite_id>
		DestroyScreenElement id = <invite_id>
		Wait \{1
			gameframe}
	endif
	if ScreenElementExists \{id = invite_container}
		return
	endif
	CreateScreenElement \{Type = ContainerElement
		id = invite_container
		parent = root_window
		Pos = $invite_pos
		just = [
			left
			top
		]
		z_priority = 800.0}
	CreateScreenElement \{Type = SpriteElement
		id = invite_icon
		parent = invite_container
		dims = (128.0, 128.0)
		texture = general_invite_icon
		just = [
			left
			top
		]
		Pos = (0.0, 0.0)
		z_priority = 800.0
		alpha = 0.0}
	text_box_pos = (0.0, 0.0)
	<text_box_pos> = (<text_box_pos> + (100.0, 58.0))
	CreateScreenElement {
		Type = SpriteElement
		id = invite_name_box
		parent = invite_container
		rgba = [0 0 0 255]
		Pos = <text_box_pos>
		alpha = 1
		Scale = (1.0, 1.0)
		dims = (1.0, 35.0)
		just = [left top]
		z_priority = 799.0
	}
	text_pos = (<text_box_pos> + (30.0, -4.0))
	CreateScreenElement {
		Type = TextElement
		id = invite_text
		parent = invite_container
		rgba = [255 255 255 255]
		alpha = 0
		Pos = <text_pos>
		font = fontgrid_text_a1
		internal_scale = (0.5, 0.7)
		Scale = 0.8
		text = <friendname>
		just = [left top]
		z_priority = 800.0
	}
	GetScreenElementDims \{id = invite_text}
	printf qs(0x91737790) a = <width>
	box_width = ((<width>) * (1.0, 0.0) + (40.0, 1.0))
	invite_icon :legacydomorph \{alpha = 1.0
		time = 0.2
		anim = fast_out}
	invite_name_box :legacydomorph Scale = <box_width> scale_relative time = 0.2 anim = fast_out
	invite_text :legacydomorph \{alpha = 1
		time = 0.2
		anim = fast_out}
	Wait \{60
		gameframes}
	invite_container :legacydomorph \{alpha = 0.0
		time = 0.2
		anim = fast_in}
	if ScreenElementExists \{id = invite_container}
		DestroyScreenElement \{id = invite_container}
	endif
endscript

script check_invite 
	RequireParams \{[
			index
		]
		all}
	checkforinvite index = <index>
	if (<invite_type> = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script accept_invite 
	RequireParams \{[
			detail_game_mode
		]
		all}
	destroy_generic_popup
	getfriendinfo index = ($friendlist_selection_index)
	printstruct <...>
	printf qs(0x4cc3cd93) a = <nickname>
	if (<detail_game_mode> = p4_career)
		enable_network_wait_variable
		create_dialog_box \{wait_variable = network_wait_var
			heading_text = qs(0xabf4f150)
			body_text = $wii_loading_message
			full_blackout = 1}
		Change \{game_mode = p4_career}
		netoptions :pref_choose \{Name = game_modes
			checksum = p4_career}
		ui_event \{event = menu_replace
			data = {
				state = uistate_net_setup
				action = join
				controller = 0
			}}
		Wait \{2
			Seconds}
		ready_up_players_invite_client enabled_controllers = <enabled_controllers> resolved_friend_index = <resolvedindex>
		destroy_loading_screen
	else
		generic_event_back_block \{data = {
				state = uistate_online
			}}
		formatText TextName = friend_name qs(0x4d4555da) s = <nickname>
		start_invite_matchmaking action = join friend_index = <resolvedindex> <...>
	endif
endscript

script request_accept_invite 
	destroy_generic_popup
	<friend> = $friendlist_selection_index
	getfriendinfo index = <friend>
	printstruct <...>
	if NOT (<haspendinginvite> = 1)
		create_generic_popup \{ok_menu
			message = $wii_invite_error_invalid
			ok_eventhandlers = [
				{
					focus
					popup_menu_focus
				}
				{
					unfocus
					popup_menu_unfocus
				}
				{
					pad_choose
					block_refresh_and_destroy
				}
			]
			back_script = block_refresh_and_destroy}
		return
	endif
	if (<game_mode> = p4_career)
		base_game_mode = <game_mode>
	else
		netoptions :pref_size \{Name = game_modes}
		i = 0
		begin
		netoptions :pref_getstruct Name = game_modes index = <i>
		if (<game_mode> = <pref_struct>.search_chk)
			<base_game_mode> = (<pref_struct>.checksum)
			break
		endif
		i = (<i> + 1)
		repeat <size>
	endif
	get_required_inst_and_players friend = <friend> base_game_mode = <base_game_mode> detail_game_mode = <game_mode> num_inviting_players = <num_players>
	generic_event_choose data = {
		state = uistate_wii_invite_players
		online = 0
		min_players = <min_required_players>
		max_players = <max_required_players>
		game_mode = <base_game_mode>
		detail_game_mode = <game_mode>
		required_instruments = <required_instruments>
		enable_if_valid = 1
		pad_start_script = approve_accept_invite
	}
endscript

script get_required_inst_and_players 
	RequireParams \{[
			friend
			base_game_mode
			detail_game_mode
			num_inviting_players
		]
		all}
	game_mode_get_needed_instrument_set game_mode = <base_game_mode> detail_game_mode = <detail_game_mode> num_inviting_players = <num_inviting_players>
	printf \{qs(0xdf66fef2)}
	printstruct <...>
	instruments_needed = {}
	getfriendinfo index = <friend>
	if (<instrument_set> = same)
		if GotParam \{guitar1}
			instruments_needed = {<instruments_needed> guitar1}
		endif
		if GotParam \{guitar2}
			instruments_needed = {<instruments_needed> guitar2}
		endif
		if GotParam \{drums}
			instruments_needed = {<instruments_needed> drums}
		endif
		if GotParam \{vocals}
			instruments_needed = {<instruments_needed> vocals}
		endif
	else
		if NOT (GotParam guitar1)
			instruments_needed = {<instruments_needed> guitar1}
		endif
		if NOT (GotParam guitar2)
			if NOT (GotParam guitar1)
				instruments_needed = {<instruments_needed> guitar2}
			else
				instruments_needed = {<instruments_needed> guitar1}
			endif
		endif
		if NOT (GotParam drums)
			instruments_needed = {<instruments_needed> drums}
		endif
		if NOT (GotParam vocals)
			instruments_needed = {<instruments_needed> vocals}
		endif
	endif
	if (<player_match> = exact)
		<min_players> = <players_needed>
		<max_players> = <players_needed>
	else
		<min_players> = 1
		<max_players> = <players_needed>
	endif
	if (<detail_game_mode> = p2_coop)
		instruments_needed = {guitar1 guitar2}
	endif
	return required_instruments = <instruments_needed> min_required_players = <min_players> max_required_players = <max_players>
endscript

script game_mode_get_needed_instrument_set 
	RequireParams \{[
			game_mode
			num_inviting_players
			detail_game_mode
		]
		all}
	required_instruments = same
	players_needed = <num_inviting_players>
	player_match = exact
	AppendSuffixToChecksum Base = <game_mode> SuffixString = '_props'
	printstruct $<appended_id>
	gamemode_players = ($<appended_id>.num_players)
	printf qs(0x76b3fda7) d = <gamemode_players>
	if StructureContains structure = $<appended_id> faceoff
		<required_instruments> = same
		<players_needed> = <num_inviting_players>
		<player_match> = exact
	else
		if (($<appended_id>.Type) = battle)
			<required_instruments> = same
			<players_needed> = <num_inviting_players>
			<player_match> = exact
		else
			<required_instruments> = opposite
			<players_needed> = (<gamemode_players> - <num_inviting_players>)
			<player_match> = upto
		endif
	endif
	return instrument_set = <required_instruments> players_needed = <players_needed> player_match = <player_match>
endscript

script destroy_invite_popups 
	destroy_generic_popup
	gamemode_gettype
	if (<Type> = career)
		ui_band_mode_change_menu_focus_all \{focus_type = focus}
	endif
endscript
