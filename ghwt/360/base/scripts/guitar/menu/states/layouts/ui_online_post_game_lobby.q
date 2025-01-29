network_game_postgame_lobby = 0

script ui_init_online_post_game_lobby 
	Change \{playing_song = 0}
	SpawnScriptNow \{idle_for_post_game_lobby}
	next_id = ($online_song_choice_id + 1)
	GetNumPlayers
	if (<next_id> > (<num_players> - 1))
		<next_id> = 0
	endif
	Change online_song_choice_id = <next_id>
	disable_pause
endscript

script ui_deinit_online_post_game_lobby 
	SpawnScriptLater \{kill_idle_for_post_game_lobby}
endscript

script kill_idle_for_post_game_lobby 
	hide_crowd_models
	destroy_crowd_models
	destroy_bg_viewport
	destroy_cameracuts
	Transition_KillAll
	Change \{current_transition = None}
endscript

script idle_for_post_game_lobby 
	resetyieldinfo \{yield = true}
	printf \{qs(0x2fc96321)}
	KillSpawnedScript \{Name = yieldmonitor}
	SpawnScriptNow \{yieldmonitor}
	yield
	band_playtransitionidles
	bandmanager_stopallanimiterators
	kill_gem_scroller \{Type = Normal}
	yield \{'kill_gem_scroller'}
	create_crowd_models
	setup_bg_viewport
	yield \{'setup_bg_viewport'}
	create_cameracuts
	Change \{current_transition = Intro}
	Transition_Play \{Type = loading}
	yield
	UnPauseGame
	yield
	StartRendering
endscript

script ui_create_online_post_game_lobby 
	NetSessionFunc \{Obj = voice
		func = turnteamtalkoff}
	GetActiveControllers
	GetArraySize <active_controllers>
	ingame_controllers = []
	i = 0
	begin
	if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
		AddArrayElement array = <ingame_controllers> element = <i>
		<ingame_controllers> = <array>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	CreateScreenElement {
		parent = root_window
		id = onlinelobbyinterface
		Type = descinterface
		desc = 'online_postgame_lobby'
		Pos = (0.0, -1000.0)
		exclusive_device = <ingame_controllers>
		tags = {
			menu_index = 0
			menu_items = 0
			loser_index = 0
			loser_items = 0
			loser_menu_id = NULL
			winner_index = 0
			winner_items = 0
			winner_menu_id = NULL
			postgame_menu_id = NULL
			locked_to_players = 0
			setlist_enabled = 0
			toggle_allowed = 1
		}
	}
	spawn_player_drop_listeners \{drop_player_script = lobby_drop_player_scr
		end_game_script = lobby_end_game_scr}
	SpawnScriptNow \{menu_music_on}
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
	onlinelobbyinterface :desc_checkversion \{desired = 3
		assertif = mismatch}
	Change \{network_game_postgame_lobby = 1}
	create_postgame_lobby_menu
	create_player_scores_postgame_container
	onlinelobbyinterface :Obj_SpawnScriptNow \{online_post_game_lobby_animate_in}
	menu_finish
	netoptions :pref_get \{Name = game_modes}
	if (<checksum> = p4_pro_faceoff || <checksum> = p2_quickplay || <checksum> = p4_quickplay || <checksum> = p8_pro_faceoff)
		GetActiveControllers
		GetArraySize <active_controllers>
		i = 0
		begin
		if (<active_controllers> [<i>] = 1)
			if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
				get_controller_type controller_index = <i>
				if (<controller_type> = guitar)
					add_user_control_helper text = qs(0x0d215c11) button = orange z = 100000 controller = <i>
					break
				endif
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script online_post_game_lobby_animate_in 
	Wait \{0.5
		Second}
	SoundEvent \{event = online_main_panel_in}
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :se_setprops \{Pos = (0.0, 30.0)
			time = 0.2
			anim = gentle}
	else
		return
	endif
	Wait \{0.22
		Second}
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :se_setprops \{Pos = (0.0, 0.0)
			time = 0.1
			anim = gentle}
	else
		return
	endif
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script ui_destroy_online_post_game_lobby 
	destroy_player_drop_events
	if ScreenElementExists \{id = onlinelobbyinterface}
		DestroyScreenElement \{id = onlinelobbyinterface}
	endif
	Change \{network_game_postgame_lobby = 0}
	generic_ui_destroy
endscript

script ui_return_online_post_game_lobby 
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
	clean_up_user_control_helpers
	menu_finish
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :GetTags
		if (<locked_to_players> = 0)
			netoptions :pref_get \{Name = game_modes}
			if (<checksum> = p4_pro_faceoff || <checksum> = p2_quickplay || <checksum> = p4_quickplay || <checksum> = p8_pro_faceoff)
				GetActiveControllers
				GetArraySize <active_controllers>
				i = 0
				begin
				if (<active_controllers> [<i>] = 1)
					if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
						get_controller_type controller_index = <i>
						if (<controller_type> = guitar)
							add_user_control_helper text = qs(0x0d215c11) button = orange z = 100000 controller = <i>
							break
						endif
					endif
				endif
				<i> = (<i> + 1)
				repeat <array_Size>
			endif
		endif
	endif
endscript

script postgame_lobby_transition_in 
	if ScreenElementExists \{id = onlinelobbyinterface}
		if onlinelobbyinterface :desc_resolvealias \{Name = alias_left_side
				param = left_side}
			<left_side> :se_setprops Pos = {(0.0, 1000.0) relative} time = 0.15 anim = gentle
		endif
	else
		return
	endif
	onlinelobbyinterface :GetTags
	if (<locked_to_players> = 0)
		ui_return_online_post_game_lobby
		Wait \{0.15
			Second}
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
endscript

script postgame_lobby_transition_out 
	if ScreenElementExists \{id = onlinelobbyinterface}
		if onlinelobbyinterface :desc_resolvealias \{Name = alias_left_side
				param = left_side}
			<left_side> :se_setprops Pos = {(0.0, -1000.0) relative} time = 0.15 anim = gentle
		endif
	else
		return
	endif
	Wait \{0.15
		Second}
endscript

script create_postgame_lobby_menu 
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_left_side
			param = left_side}
		if <left_side> :desc_resolvealias Name = alias_online_lobby_scrollbar param = scrollbar_id
			<scrollbar_id> :Die
		endif
		if <left_side> :desc_resolvealias Name = alias_left_side_vmenu param = left_side_menu
			AssignAlias id = <left_side_menu> alias = current_menu
			netoptions :pref_get \{Name = game_modes}
			if (<checksum> = p4_pro_faceoff || <checksum> = p2_quickplay || <checksum> = p4_quickplay || <checksum> = p8_pro_faceoff)
				current_menu :se_setprops \{event_handlers = [
						{
							pad_back
							postgame_lobby_quit
						}
						{
							pad_up
							postgame_lobby_up_down_action
							params = {
								action = up
							}
						}
						{
							pad_down
							postgame_lobby_up_down_action
							params = {
								action = down
							}
						}
						{
							pad_L1
							post_game_toggle_guitar_part
						}
					]}
			else
				current_menu :se_setprops \{event_handlers = [
						{
							pad_back
							postgame_lobby_quit
						}
						{
							pad_up
							postgame_lobby_up_down_action
							params = {
								action = up
							}
						}
						{
							pad_down
							postgame_lobby_up_down_action
							params = {
								action = down
							}
						}
					]}
			endif
			<left_side> :se_setprops title_text = qs(0x84382872)
			GetNumPlayers
			current_num_players = <num_players>
			gamemode_getnumplayers
			if (<current_num_players> = <num_players>)
				add_matchmaking_item {
					vmenu_id = <left_side_menu>
					msg_checksum = postgame_play_again
					text = qs(0x6bdab26c)
					choose_script = postgame_lobby_to_setlist
					focus_script = postgame_item_change_focus
				}
				onlinelobbyinterface :SetTags \{setlist_enabled = 1}
			endif
			add_matchmaking_item {
				vmenu_id = <left_side_menu>
				msg_checksum = preferences
				text = qs(0xed494bd1)
				choose_script = postgame_net_preferences
				focus_script = postgame_item_change_focus
			}
			add_matchmaking_item {
				vmenu_id = <left_side_menu>
				msg_checksum = postgame_quit
				text = qs(0x67d9c56d)
				choose_script = postgame_lobby_quit
				focus_script = postgame_item_change_focus
			}
			onlinelobbyinterface :SetTags postgame_menu_id = <left_side_menu>
		endif
	endif
endscript

script local_player_is_choosing_song 
	player_idx = 1
	gamemode_getnumplayers
	begin
	getplayerinfo <player_idx> is_local_client
	if (<is_local_client> = 1)
		getplayerinfo <player_idx> net_obj_id
		if ($online_song_choice_id = <net_obj_id>)
			printf qs(0xb21f476b) d = ($online_song_choice_id)
			return \{true}
		endif
	endif
	<player_idx> = (<player_idx> + 1)
	repeat <num_players>
	return \{FALSE}
endscript

script create_player_scores_postgame_container 
	if NOT gamemode_iscooperative
		determine_game_scores_and_winner
		gamemode_getnumplayers
		if (<opponent_team_score> > <team_score>)
			setup_slot_menu menu = alias_winner_vmenu checksum = winner Color = ($online_player_slot_bg_team1) score = <opponent_team_score> start_index = ((<num_players> / 2) + 1) num_players = (<num_players> / 2)
			onlinelobbyinterface :SetTags winner_menu_id = <menu_id>
			setup_slot_menu menu = alias_loser_vmenu checksum = loser Color = ($online_player_slot_bg_team2) score = <team_score> start_index = 1 num_players = (<num_players> / 2)
			onlinelobbyinterface :SetTags loser_menu_id = <menu_id>
			onlinelobbyinterface :SetTags {
				winner_items = (<num_players> / 2)
				loser_items = (<num_players> / 2)
			}
			formatText TextName = winner_score qs(0x48c6d14c) d = <opponent_team_score>
			formatText TextName = loser_score qs(0x48c6d14c) d = <team_score>
			onlinelobbyinterface :se_setprops {
				winner_score = <winner_score>
				loser_score = <loser_score>
			}
		else
			setup_slot_menu menu = alias_winner_vmenu checksum = winner Color = ($online_player_slot_bg_team1) score = <team_score> start_index = 1 num_players = (<num_players> / 2)
			onlinelobbyinterface :SetTags winner_menu_id = <menu_id>
			setup_slot_menu menu = alias_loser_vmenu checksum = loser Color = ($online_player_slot_bg_team2) score = <opponent_team_score> start_index = ((<num_players> / 2) + 1) num_players = (<num_players> / 2)
			onlinelobbyinterface :SetTags loser_menu_id = <menu_id>
			onlinelobbyinterface :SetTags {
				winner_items = (<num_players> / 2)
				loser_items = (<num_players> / 2)
			}
			formatText TextName = winner_score qs(0x48c6d14c) d = <team_score>
			formatText TextName = loser_score qs(0x48c6d14c) d = <opponent_team_score>
			onlinelobbyinterface :se_setprops {
				winner_score = <winner_score>
				loser_score = <loser_score>
			}
		endif
		if (<tie> = true)
			stamp_texture = stamp_tie
			if French
				<stamp_texture> = stamp_tie_french
			elseif Spanish
				<stamp_texture> = stamp_tie_spanish
			elseif German
				<stamp_texture> = stamp_tie_german
			elseif Italian
				<stamp_texture> = stamp_tie_italian
			endif
			onlinelobbyinterface :se_setprops {
				menu_loser_texture = tie_bg_lowerpart
				counter_winner_texture = counter_loser
				counter_winner_dims = (256.0, 64.0)
				counter_winner_pos = (660.0, 122.0)
				stamp_rot_angle = 0
				loser_stamp_alpha = 1
				menu_loser_pos = (690.0, 295.0)
				winner_stamp_texture = <stamp_texture>
				loser_stamp_texture = <stamp_texture>
			}
			if onlinelobbyinterface :desc_resolvealias \{Name = alias_hand_devil_horn
					param = winner_hand}
				<winner_hand> :Die
			endif
			if onlinelobbyinterface :desc_resolvealias \{Name = alias_hand_thumb_down
					param = loser_hand}
				<loser_hand> :Die
			endif
		else
			stamp_texture = stamp
			if French
				<stamp_texture> = stamp_winner_french
			elseif Spanish
				<stamp_texture> = stamp_winner_spanish
			elseif German
				<stamp_texture> = stamp_winner_german
			elseif Italian
				<stamp_texture> = stamp_winner_italian
			endif
			onlinelobbyinterface :se_setprops {
				winner_stamp_texture = <stamp_texture>
				loser_stamp_texture = <stamp_texture>
			}
		endif
	else
		gamemode_getnumplayers
		<team_score> = ($band1_status.score)
		CastToInteger \{team_score}
		setup_slot_menu menu = alias_winner_vmenu checksum = winner Color = ($online_player_slot_bg_team1) score = <team_score> start_index = 1 num_players = <num_players>
		onlinelobbyinterface :SetTags winner_menu_id = <menu_id>
		formatText TextName = winner_score qs(0x48c6d14c) d = <team_score>
		onlinelobbyinterface :se_setprops {
			winner_score = <winner_score>
		}
		onlinelobbyinterface :SetTags {
			winner_items = <num_players>
			loser_items = 0
		}
		ResolveScreenElementID \{param = loser_container
			id = [
				{
					id = onlinelobbyinterface
				}
				{
					local_id = winner_vs_loser_menu
				}
				{
					local_id = loser
				}
			]}
		if ScreenElementExists id = <loser_container>
			DestroyScreenElement id = <loser_container>
		endif
		ResolveScreenElementID \{param = menu_chain_id
			id = [
				{
					id = onlinelobbyinterface
				}
				{
					local_id = winner_vs_loser_menu
				}
				{
					local_id = winner
				}
				{
					local_id = menu_chain
				}
			]}
		if ScreenElementExists id = <menu_chain_id>
			DestroyScreenElement id = <menu_chain_id>
		endif
		ResolveScreenElementID \{param = stamp_id
			id = [
				{
					id = onlinelobbyinterface
				}
				{
					local_id = winner_vs_loser_menu
				}
				{
					local_id = winner
				}
				{
					local_id = stamp
				}
			]}
		if ScreenElementExists id = <stamp_id>
			DestroyScreenElement id = <stamp_id>
		endif
	endif
	gamemode_gettype
	if (<Type> = battle)
		if onlinelobbyinterface :desc_resolvealias \{Name = alias_winner_score_container
				param = winner_score}
			<winner_score> :Die
		endif
		if onlinelobbyinterface :desc_resolvealias \{Name = alias_loser_score_container
				param = loser_score}
			<loser_score> :Die
		endif
	endif
endscript

script destroy_player_scores_postgame_container 
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :GetTags
		if ScreenElementExists id = <loser_menu_id>
			DestroyScreenElement id = <loser_menu_id> preserve_parent
		endif
		if ScreenElementExists id = <winner_menu_id>
			DestroyScreenElement id = <winner_menu_id> preserve_parent
		endif
	endif
endscript

script determine_game_scores_and_winner 
	team_score = 0
	opponent_team_score = 0
	tie = FALSE
	gamemode_getnumplayers
	if (<num_players> > 2)
		<opponent_team_score> = ($band2_status.score)
		<team_score> = ($band1_status.score)
	else
		if ($game_mode = p2_battle)
			<team_score> = ($player1_status.save_health)
			<opponent_team_score> = ($player2_status.save_health)
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			<team_score> = ($player1_status.score)
			<opponent_team_score> = ($player2_status.score)
		endif
	endif
	if (<team_score> = <opponent_team_score>)
		<tie> = true
	endif
	CastToInteger \{team_score}
	CastToInteger \{opponent_team_score}
	return team_score = <team_score> opponent_team_score = <opponent_team_score> tie = <tie>
endscript

script refresh_player_scores_postgame_container 
	printf \{qs(0x7de0e7be)}
	onlinelobbyinterface :GetTags
	if ScreenElementExists id = <loser_menu_id>
		if isscreenelementinfocus id = <loser_menu_id>
			LaunchEvent Type = unfocus target = <loser_menu_id>
			focus_id = <loser_menu_id>
			focus_index = <loser_index>
		endif
	endif
	if ScreenElementExists id = <winner_menu_id>
		if isscreenelementinfocus id = <winner_menu_id>
			LaunchEvent Type = unfocus target = <winner_menu_id>
			focus_id = <winner_menu_id>
			focus_index = <winner_index>
		endif
	endif
	destroy_player_scores_postgame_container
	create_player_scores_postgame_container
	if GotParam \{locked}
		onlinelobbyinterface :GetTags
		new_event_handlers = [
			{pad_up postgame_lobby_up_down_action params = {action = up}}
			{pad_down postgame_lobby_up_down_action params = {action = down}}
		]
		if ScreenElementExists id = <loser_menu_id>
			SetScreenElementProps {
				id = <loser_menu_id>
				event_handlers = []
				replace_handlers
			}
			SetScreenElementProps {
				id = <loser_menu_id>
				event_handlers = <new_event_handlers>
				replace_handlers
			}
		endif
		if ScreenElementExists id = <winner_menu_id>
			SetScreenElementProps {
				id = <winner_menu_id>
				event_handlers = []
				replace_handlers
			}
			SetScreenElementProps {
				id = <winner_menu_id>
				event_handlers = <new_event_handlers>
				replace_handlers
			}
		endif
		onlinelobbyinterface :SetTags \{locked_to_players = 1}
		if ScreenElementExists \{id = netprefinterface}
			ui_destroy_net_preferences
		endif
		ui_event_get_top
		if (<base_name> = 'online_quit_warning')
			generic_event_back
		endif
		if ScreenElementExists \{id = current_menu}
			if isscreenelementinfocus \{id = current_menu}
				LaunchEvent \{Type = unfocus
					target = current_menu}
			endif
		endif
		if ScreenElementExists id = <winner_menu_id>
			if NOT isscreenelementinfocus id = <winner_menu_id>
				if NOT isscreenelementinfocus id = <loser_menu_id>
					onlinelobbyinterface :SetTags \{winner_index = 0}
					LaunchEvent Type = focus target = <winner_menu_id> data = {child_index = 0}
				endif
			endif
		endif
		clean_up_user_control_helpers
		menu_finish
	elseif GotParam \{unlock}
		onlinelobbyinterface :GetTags
		if ScreenElementExists id = <loser_menu_id>
			<new_event_handlers> = [
				{pad_back postgame_lobby_quit params = {id = <loser_menu_id>}}
				{pad_up postgame_lobby_up_down_action params = {action = up}}
				{pad_down postgame_lobby_up_down_action params = {action = down}}
			]
			SetScreenElementProps {
				id = <loser_menu_id>
				event_handlers = []
				replace_handlers
			}
			SetScreenElementProps {
				id = <loser_menu_id>
				event_handlers = <new_event_handlers>
				replace_handlers
			}
		endif
		if ScreenElementExists id = <winner_menu_id>
			<new_event_handlers> = [
				{pad_back postgame_lobby_quit params = {id = <winner_menu_id>}}
				{pad_up postgame_lobby_up_down_action params = {action = up}}
				{pad_down postgame_lobby_up_down_action params = {action = down}}
			]
			SetScreenElementProps {
				id = <winner_menu_id>
				event_handlers = []
				replace_handlers
			}
			SetScreenElementProps {
				id = <winner_menu_id>
				event_handlers = <new_event_handlers>
				replace_handlers
			}
		endif
	endif
	if GotParam \{focus_id}
		LaunchEvent Type = focus target = <focus_id> data = {child_index = <focus_index>}
	endif
	printf \{qs(0xbb30d99b)}
endscript

script postgame_lobby_to_setlist 
	if IsHost
		SendStructure \{callback = postgame_goto_setlist
			data_to_send = {
				None
			}}
		onlinelobbyinterface :Obj_SpawnScriptLater \{song_being_selected}
	else
		SendStructure \{callback = postgame_goto_setlist
			data_to_send = {
				None
			}}
	endif
endscript

script postgame_goto_setlist 
	if IsHost
		begin
		if ScreenElementExists \{id = onlinelobbyinterface}
			break
		endif
		Wait \{1
			gameframe}
		repeat
		onlinelobbyinterface :Obj_SpawnScriptLater \{song_being_selected}
		SendStructure \{callback = postgame_goto_setlist
			data_to_send = {
				None
			}}
	else
		begin
		if ScreenElementExists \{id = onlinelobbyinterface}
			break
		endif
		Wait \{1
			gameframe}
		repeat
		onlinelobbyinterface :Obj_SpawnScriptNow \{song_being_selected}
	endif
endscript

script song_being_selected 
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :GetTags
		onlinelobbyinterface :SetTags \{setlist_enabled = 0}
		ResolveScreenElementID id = {<postgame_menu_id> child = 0}
		if (<menu_index> = 0)
			if isscreenelementinfocus \{id = current_menu}
				LaunchEvent \{Type = unfocus
					target = current_menu}
				LaunchEvent \{Type = focus
					target = current_menu
					data = {
						child_index = 1
					}}
			endif
			onlinelobbyinterface :SetTags \{menu_index = 0}
			onlinelobbyinterface :SetTags menu_items = (<menu_items> - 1)
		endif
		<resolved_id> :se_setprops {not_focusable}
		ResolveScreenElementID id = {<resolved_id> child = text}
		<resolved_id> :se_setprops {alpha = 0.5}
		index = ($online_to_setlist_count)
		begin
		formatText TextName = timer_msg qs(0xbd40792a) d = <index>
		printf qs(0x73307931) s = <timer_msg>
		if ScreenElementExists \{id = onlinelobbyinterface}
			if onlinelobbyinterface :desc_resolvealias \{Name = alias_left_side
					param = left_side}
				<left_side> :se_setprops info_text = <timer_msg>
			endif
		endif
		if (<index> = 5)
			onlinelobbyinterface :SetTags \{toggle_allowed = 0}
			refresh_player_scores_postgame_container \{locked}
		elseif (<index> = 4)
			host_start_player_settings_sync
		endif
		if (<index> = 0)
			break
		endif
		index = (<index> - 1)
		Wait \{1
			Second}
		repeat
		generic_event_back \{state = uistate_setlist
			data = {
				no_jamsession
			}}
	else
		printf \{qs(0xb8033e72)}
	endif
endscript

script postgame_lobby_quit 
	if GotParam \{device_num}
		if (<device_num> = $primary_controller)
			if GotParam \{id}
				LaunchEvent Type = unfocus target = <id>
			endif
			ui_event_get_top
			if GotParam \{is_popup}
				generic_event_replace \{state = uistate_online_quit_warning
					data = {
						is_popup
					}}
			else
				generic_event_choose \{state = uistate_online_quit_warning
					data = {
						is_popup
					}}
			endif
		endif
	endif
endscript

script postgame_net_preferences 
	LaunchEvent \{Type = unfocus
		target = current_menu}
	postgame_lobby_transition_out
	ui_create_net_preferences device_num = <device_num> exit_Script = postgame_lobby_transition_in post_game_lobby
endscript

script postgame_lobby_add_player_slot \{cash_text = qs(0x6160dbf3)
		cash_icon_id = cash_milestone_icon_001}
	RequireParams \{[
			Name
			controller_texture
			xuid
			bg_rgba
			parent
			local
			player_num
		]
		all}
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :GetTags
		formatText checksumName = player_slot_id 'player_slot_p%p' p = <player_num> AddToStringLookup
		CreateScreenElement {
			Type = descinterface
			desc = 'online_lobby_player_slot_item'
			id = <player_slot_id>
			parent = <parent>
			auto_dims = FALSE
			dims = (450.0, 50.0)
			event_handlers = [
				{focus postgame_player_slot_change_focus params = {focus}}
				{unfocus postgame_player_slot_change_focus params = {unfocus}}
			]
			tags = {local_player = 0}
		}
		if isXenon
			if GotParam \{xuid}
				<id> :se_setprops event_handlers = [{pad_choose ui_menu_select_sfx}
					{pad_choose menu_show_gamercard_from_netid params = {net_id = <xuid>}}
				]
			endif
		endif
		if isXenon
			formatText checksumName = player_status 'player%d_status' d = (<player_num>)
			<id> :Obj_SpawnScriptLater update_headset_status params = {obj_id = <id> uid = <xuid>}
		endif
		<id> :desc_checkversion desired = 2 assertif = mismatch
		<id> :se_setprops {
			player_slot_name_text = <Name>
			player_instrument_logo_texture = <controller_texture>
			player_slot_bg_rgba = <bg_rgba>
			cash_icon_texture = <cash_icon_id>
			cash_rank_text = <cash_text>
			cash_icon_alpha = 1
		}
		if <id> :desc_resolvealias Name = alias_sign_in_button param = signin_id
			<signin_id> :Die
		endif
		<id> :SetTags msg_checksum = gamer_card
		<id> :SetTags local_player = <local>
	endif
endscript

script setup_slot_menu menu = alias_winner_vmenu Color = ($online_player_slot_bg_team1)
	RequireParams \{[
			score
			start_index
			num_players
		]
		all}
	if ScreenElementExists \{id = onlinelobbyinterface}
		if onlinelobbyinterface :desc_resolvealias Name = <menu> param = slot_menu
			netoptions :pref_get \{Name = game_modes}
			if (<checksum> = p4_pro_faceoff || <checksum> = p2_quickplay || <checksum> = p4_quickplay || <checksum> = p8_pro_faceoff)
				<slot_menu> :se_setprops {
					replace_handlers
					event_handlers = [
						{pad_back postgame_lobby_quit params = {id = <slot_menu>}}
						{pad_up postgame_lobby_up_down_action params = {action = up}}
						{pad_down postgame_lobby_up_down_action params = {action = down}}
						{pad_L1 post_game_toggle_guitar_part}
					]
				}
			else
				<slot_menu> :se_setprops {
					replace_handlers
					event_handlers = [
						{pad_back postgame_lobby_quit params = {id = <slot_menu>}}
						{pad_up postgame_lobby_up_down_action params = {action = up}}
						{pad_down postgame_lobby_up_down_action params = {action = down}}
					]
				}
			endif
			begin
			getplayerinfo <start_index> net_id_first
			getplayerinfo <start_index> net_id_second
			getplayerinfo <start_index> part
			getplayerinfo <start_index> is_local_client
			switch (<part>)
				case guitar
				icon_texture = logo_guitar_grayscale
				case bass
				icon_texture = logo_bass_grayscale
				case drum
				icon_texture = logo_drum_grayscale
				case vocals
				icon_texture = logo_vocal_grayscale
			endswitch
			formatText checksumName = gamertag 'gamertag_%d' d = (<start_index> - 1)
			Name = $<gamertag>
			xuid = [0 0]
			SetArrayElement ArrayName = xuid index = 0 NewValue = (<net_id_first>)
			SetArrayElement ArrayName = xuid index = 1 NewValue = (<net_id_second>)
			getplayerinfo <start_index> career_earnings
			cash_get_info_from_earnings earnings = <career_earnings>
			formatText TextName = cash_text qs(0x48c6d14c) d = <rank>
			getplayerinfo \{1
				team}
			yellow_team = <team>
			getplayerinfo <start_index> team
			Color = $online_player_slot_bg_team1
			if (<team> != <yellow_team>)
				<Color> = $online_player_slot_bg_team2
			endif
			postgame_lobby_add_player_slot {
				Name = <Name>
				controller_texture = <icon_texture>
				xuid = <xuid>
				bg_rgba = <Color>
				parent = <slot_menu>
				cash_text = <cash_text>
				cash_icon_id = <cash_icon_id>
				player_num = <start_index>
				local = <is_local_client>
			}
			<start_index> = (<start_index> + 1)
			repeat <num_players>
			return menu_id = <slot_menu>
		endif
	endif
endscript

script postgame_item_change_focus 
	Obj_GetID
	<objID> :GetTags
	ResolveScreenElementID id = [
		{id = <objID>}
		{local_id = text}
	]
	if GotParam \{focus}
		if GotParam \{msg_checksum}
			set_postgame_dialog_message msg_checksum = <msg_checksum>
		endif
		retail_menu_focus id = <resolved_id>
	elseif GotParam \{unfocus}
		retail_menu_unfocus id = <resolved_id>
	endif
endscript

script postgame_player_slot_change_focus 
	Obj_GetID
	<objID> :GetTags
	ResolveScreenElementID id = [
		{id = <objID>}
		{local_id = online_player_slots_item}
		{local_id = player_slot_name}
	]
	if GotParam \{focus}
		if GotParam \{msg_checksum}
			set_postgame_dialog_message msg_checksum = <msg_checksum>
		endif
		retail_menu_focus id = <resolved_id>
	elseif GotParam \{unfocus}
		retail_menu_unfocus id = <resolved_id>
	endif
endscript

script set_postgame_dialog_message 
	if NOT GotParam \{msg_checksum}
		return
	endif
	if isXenon
		plat_helper_strings = net_helper_text_strings_xen
	elseif isps3
		plat_helper_strings = net_helper_text_strings_ps3
	endif
	AppendSuffixToChecksum Base = <msg_checksum> SuffixString = '_text'
	if StructureContains structure = ($<plat_helper_strings>) <appended_id>
		if ScreenElementExists \{id = onlinelobbyinterface}
			if onlinelobbyinterface :desc_resolvealias \{Name = alias_left_side
					param = left_side}
				<left_side> :se_setprops info_text = ($<plat_helper_strings>.<appended_id>)
			endif
		endif
	elseif StructureContains structure = ($net_helper_text_strings) <appended_id>
		if ScreenElementExists \{id = onlinelobbyinterface}
			if onlinelobbyinterface :desc_resolvealias \{Name = alias_left_side
					param = left_side}
				<left_side> :se_setprops info_text = ($net_helper_text_strings.<appended_id>)
			endif
		endif
	endif
endscript

script postgame_lobby_up_down_action 
	onlinelobbyinterface :GetTags
	if NOT GotParam \{action}
		return
	endif
	if NOT ScreenElementExists \{id = current_menu}
		return
	endif
	if NOT ScreenElementExists id = <winner_menu_id>
		return
	endif
	generic_menu_up_or_down_sound
	printf \{qs(0xdbdbcf54)}
	if isscreenelementinfocus \{id = current_menu}
		if (<action> = up)
			generic_menu_up_or_down_sound \{up}
			if (<menu_index> = 0)
				if (<loser_items> > 0)
					LaunchEvent \{Type = unfocus
						target = current_menu}
					LaunchEvent Type = focus target = <loser_menu_id> data = {child_index = (<loser_items> - 1)}
					onlinelobbyinterface :SetTags loser_index = (<loser_items> - 1)
				else
					LaunchEvent \{Type = unfocus
						target = current_menu}
					LaunchEvent Type = focus target = <winner_menu_id> data = {child_index = (<winner_items> - 1)}
					onlinelobbyinterface :SetTags winner_index = (<winner_items> - 1)
				endif
			else
				onlinelobbyinterface :SetTags menu_index = (<menu_index> - 1)
			endif
		elseif (<action> = down)
			generic_menu_up_or_down_sound \{down}
			if (<menu_index> = (<menu_items> - 1))
				if (<winner_items> > 0)
					LaunchEvent \{Type = unfocus
						target = current_menu}
					LaunchEvent Type = focus target = <winner_menu_id> data = {child_index = 0}
					onlinelobbyinterface :SetTags \{winner_index = 0}
				else
					onlinelobbyinterface :SetTags \{menu_index = 0}
				endif
			else
				onlinelobbyinterface :SetTags menu_index = (<menu_index> + 1)
			endif
		endif
	elseif isscreenelementinfocus id = <winner_menu_id>
		if (<action> = up)
			generic_menu_up_or_down_sound \{up}
			if (<winner_index> = 0)
				if (<locked_to_players> = 0)
					LaunchEvent Type = unfocus target = <winner_menu_id>
					LaunchEvent Type = focus target = current_menu data = {child_index = (<menu_items> - 1)}
					onlinelobbyinterface :SetTags menu_index = (<menu_items> - 1)
				elseif (<loser_items> > 0)
					LaunchEvent Type = unfocus target = <winner_menu_id>
					LaunchEvent Type = focus target = <loser_menu_id> data = {child_index = 0}
					onlinelobbyinterface :SetTags \{loser_index = 0}
				else
					onlinelobbyinterface :SetTags winner_index = (<winner_items> - 1)
				endif
			else
				onlinelobbyinterface :SetTags winner_index = (<winner_index> - 1)
			endif
		elseif (<action> = down)
			generic_menu_up_or_down_sound \{down}
			if (<winner_index> = (<winner_items> - 1))
				if (<loser_items> > 0)
					LaunchEvent Type = unfocus target = <winner_menu_id>
					LaunchEvent Type = focus target = <loser_menu_id> data = {child_index = 0}
					onlinelobbyinterface :SetTags \{loser_index = 0}
				elseif (<locked_to_players> = 0)
					LaunchEvent Type = unfocus target = <winner_menu_id>
					LaunchEvent \{Type = focus
						target = current_menu
						data = {
							child_index = 0
						}}
					onlinelobbyinterface :SetTags \{menu_index = 0}
				else
					onlinelobbyinterface :SetTags \{winner_index = 0}
				endif
			else
				onlinelobbyinterface :SetTags winner_index = (<winner_index> + 1)
			endif
		endif
	elseif isscreenelementinfocus id = <loser_menu_id>
		if (<action> = up)
			generic_menu_up_or_down_sound \{up}
			if (<loser_index> = 0)
				LaunchEvent Type = unfocus target = <loser_menu_id>
				LaunchEvent Type = focus target = <winner_menu_id> data = {child_index = (<winner_items> - 1)}
				onlinelobbyinterface :SetTags winner_index = (<winner_items> - 1)
			else
				onlinelobbyinterface :SetTags loser_index = (<loser_index> - 1)
			endif
		elseif (<action> = down)
			generic_menu_up_or_down_sound \{down}
			if (<loser_index> = (<loser_items> - 1))
				if (<locked_to_players> = 0)
					LaunchEvent Type = unfocus target = <loser_menu_id>
					LaunchEvent \{Type = focus
						target = current_menu
						data = {
							child_index = 0
						}}
					onlinelobbyinterface :SetTags \{menu_index = 0}
				else
					LaunchEvent Type = unfocus target = <loser_menu_id>
					LaunchEvent Type = focus target = <winner_menu_id> data = {child_index = 0}
					onlinelobbyinterface :SetTags \{winner_index = 0}
				endif
			else
				onlinelobbyinterface :SetTags loser_index = (<loser_index> + 1)
			endif
		endif
	endif
endscript

script post_game_toggle_guitar_part 
	printf \{qs(0x7f246a05)}
	onlinelobbyinterface :GetSingleTag \{toggle_allowed}
	if (<toggle_allowed> = 0)
		return
	endif
	RequireParams \{[
			device_num
		]
		all}
	info_index = 1
	index = 1
	begin
	getplayerinfo <index> controller
	if (<device_num> = <controller>)
		<info_index> = <index>
		break
	endif
	index = (<index> + 1)
	repeat 8
	get_controller_type controller_index = <device_num>
	if (<controller_type> = guitar || <controller_type> = controller)
		getplayerinfo <info_index> part
		if (<part> = guitar)
			setplayerinfo <info_index> part = bass
			getplayerinfo <info_index> net_id_first
			getplayerinfo <info_index> net_id_second
			formatText checksumName = gamertag 'gamertag_%d' d = (<index> - 1)
			SendStructure callback = update_postgame_part data_to_send = {first_id = <net_id_first> second_id = <net_id_second> Name = ($<gamertag>) part = bass}
			update_postgame_part first_id = <net_id_first> second_id = <net_id_second> Name = ($<gamertag>) part = bass
		elseif (<part> = bass)
			setplayerinfo <info_index> part = guitar
			getplayerinfo <info_index> net_id_first
			getplayerinfo <info_index> net_id_second
			formatText checksumName = gamertag 'gamertag_%d' d = (<index> - 1)
			SendStructure callback = update_postgame_part data_to_send = {first_id = <net_id_first> second_id = <net_id_second> Name = ($<gamertag>) part = guitar}
			update_postgame_part first_id = <net_id_first> second_id = <net_id_second> Name = ($<gamertag>) part = guitar
		endif
	endif
endscript

script update_postgame_part 
	if IsHost
		SendStructure callback = update_postgame_part data_to_send = <...>
	endif
	printf \{qs(0x42b1f802)}
	found = 0
	info_index = 1
	begin
	getplayerinfo <info_index> net_id_first
	getplayerinfo <info_index> net_id_second
	formatText checksumName = gamertag 'gamertag_%d' d = (<info_index> - 1)
	if ((<net_id_first> = <first_id>) && (<net_id_second> = <second_id>))
		if isXenon
			<found> = 1
			break
		elseif LocalizedStringEquals a = <Name> b = ($<gamertag>)
			<found> = 1
			break
		endif
	endif
	info_index = (<info_index> + 1)
	repeat 8
	if (<found> = 1)
		setplayerinfo <info_index> part = <part>
		if ScreenElementExists \{id = onlinelobbyinterface}
			refresh_player_scores_postgame_container
		endif
	endif
endscript

script lobby_drop_player_scr 
	printf \{qs(0xd2c6f893)}
	KillSpawnedScript \{Name = postgame_goto_setlist}
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :GetTags
		onlinelobbyinterface :Obj_KillSpawnedScript \{Name = song_being_selected}
		if (<dropped_player_num> = 0)
			if ScreenElementExists \{id = netprefinterface}
				netprefinterface :GetTags
				if ScreenElementExists id = <submenu_id>
					LaunchEvent Type = unfocus target = <submenu_id>
				else
					LaunchEvent \{Type = unfocus
						target = net_preferences_popup}
				endif
			else
				LaunchEvent \{Type = unfocus
					target = current_menu}
			endif
			formatText \{TextName = popup_text}
			create_net_popup \{title = qs(0x5ca2c535)
				popup_text = qs(0x433296b8)}
			Wait \{3
				Seconds}
			destroy_net_popup
			set_focus_color rgba = ($online_lobby_item_text_color)
			set_unfocus_color rgba = ($online_lobby_item_text_color)
			if ScreenElementExists \{id = netprefinterface}
				netprefinterface :GetTags
				if ScreenElementExists id = <submenu_id>
					LaunchEvent Type = focus target = <submenu_id>
				else
					LaunchEvent \{Type = focus
						target = net_preferences_popup}
				endif
			else
				LaunchEvent \{Type = focus
					target = current_menu}
			endif
			if (<locked_to_players> = 1)
				onlinelobbyinterface :SetTags \{locked_to_players = 0}
				refresh_player_scores_postgame_container \{unlock}
			endif
			Player = 1
			gamemode_getnumplayers
			begin
			formatText checksumName = player_slot_id 'player_slot_p%p' p = <Player>
			<player_slot_id> :GetTags
			if (<local_player> = 0)
				<player_slot_id> :se_setprops {alpha = 0.35000002}
			endif
			<Player> = (<Player> + 1)
			repeat <num_players>
		else
			formatText checksumName = player_slot_id 'player_slot_p%p' p = <dropped_player_num>
			<player_slot_id> :se_setprops {alpha = 0.35000002}
			if (<locked_to_players> = 1)
				onlinelobbyinterface :SetTags \{locked_to_players = 0}
				refresh_player_scores_postgame_container \{unlock}
			endif
		endif
		if (<setlist_enabled> = 1)
			onlinelobbyinterface :SetTags \{setlist_enabled = 0}
			onlinelobbyinterface :GetTags
			ResolveScreenElementID id = {<postgame_menu_id> child = 0}
			if (<menu_index> = 0)
				LaunchEvent \{Type = unfocus
					target = current_menu}
				if NOT ScreenElementExists \{id = netprefinterface}
					LaunchEvent \{Type = focus
						target = current_menu
						data = {
							child_index = 1
						}}
				endif
				onlinelobbyinterface :SetTags \{menu_index = 0}
			else
				onlinelobbyinterface :SetTags menu_index = (<menu_index> - 1)
			endif
			onlinelobbyinterface :SetTags menu_items = (<menu_items> - 1)
			<resolved_id> :se_setprops {not_focusable}
			ResolveScreenElementID id = {<resolved_id> child = text}
			<resolved_id> :se_setprops {alpha = 0.5}
		endif
	endif
endscript

script lobby_end_game_scr 
	printf \{qs(0xa6595096)}
endscript
