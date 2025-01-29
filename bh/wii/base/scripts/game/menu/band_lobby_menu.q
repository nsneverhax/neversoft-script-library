
script band_lobby_setup_cameras 
	printf \{channel = band_lobby
		qs(0x6546bdc0)}
	menu_music_on
endscript

script band_lobby_update_button_helpers 
	printf \{channel = band_lobby
		qs(0x8a8318a6)}
	if GotParam \{menu}
		if (<menu> = generic_popup || <menu> = leave_lobby)
			return
		endif
	endif
	clean = true
	if GotParam \{menu}
		switch <menu>
			case playerslist
			case matchmaking
			case matchmaking_done
			clean = FALSE
		endswitch
	endif
	if (<clean> = true)
		clean_up_user_control_helpers
	endif
	if is_roadie_battle_mode
		roadie_battle_update_user_control_helpers menu = <menu>
		return
	endif
	if GotParam \{menu}
		switch <menu>
			case playerslist
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			case matchmaking
			if (1 = $global_should_use_net_debugging)
				add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_debug_desirable) button = green z = 100000
			endif
			if NetSessionFunc \{Obj = party
					func = is_host}
				add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_cancel_search) button = red z = 100000
			endif
			case matchmaking_done
			gamemode_gettype
			if checksumequals a = <Type> b = quickplay
				if band_lobby_can_toggle_guitar_bass
					add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_guitar_bass) button = blue z = 100000
				endif
			endif
			case teams
			if NOT InNetGame
				add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_continue) button = green z = 100000
			endif
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_switch_team) button = blue z = 100000
			case friendslist
			getplayerinfo <Player> controller
			add_gamertag_helper exclusive_device = <controller>
			if CheckForSignIn controller_index = <controller> dont_set_primary
				if ($g_career_search = NULL)
					if NOT InNetGame
						if ((isps3) || (isngc))
							if NetSessionFunc \{Obj = party
									func = is_party_session_available}
								NetSessionFunc \{Obj = friends
									func = get_num_friends}
								if (<num_friends> > 0)
									add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_invite) button = green z = 100000
								endif
							endif
						else
							add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_invite) button = green z = 100000
						endif
					endif
				endif
			endif
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			if isxenonorwindx
				if NetSessionFunc func = canviewprofile controller_index = <controller>
					add_user_control_helper text = ($band_lobby_strings.button_player_card) button = yellow z = 100000
				endif
			elseif ((isps3) || (isngc))
				if NetSessionFunc \{func = isoldenoughforonline}
					if NOT InNetGame
						if ($g_career_search = NULL)
							add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_display_invtes) button = yellow z = 100000
						endif
					endif
				endif
			endif
			if ScreenElementExists \{id = band_lobby_popup_menu}
				GetScreenElementChildren \{id = band_lobby_popup_menu}
				band_lobby_popup_menu :menu_getselectedindex
				if (<selected_index> >= 0)
					if GotParam \{children}
						GetArraySize <children>
						if (<array_Size> > <selected_index>)
							(<children> [<selected_index>]) :band_lobby_popup_begin_polling_for_rock_record controlling_player = <Player>
						endif
					endif
				endif
			endif
			if isxenonorwindx
				NetSessionFunc \{Obj = plat_party
					func = get_num_party_players}
				if (<num_plat_party_players> = 0)
				else
					add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_invite_plat_party) button = orange z = 100000
				endif
			endif
			case inviteslist
			getplayerinfo <Player> controller
			add_gamertag_helper exclusive_device = <controller>
			if CheckForSignIn controller_index = <controller> dont_set_primary
				add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_accept_invite) button = green z = 100000
			endif
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_delete_invite) button = yellow z = 100000
			case leave_lobby
			case leave_lobby_roadie_battle
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_select) button = green z = 100000
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			case game_rules
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_select) button = green z = 100000
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			add_user_control_helper controller = <controller> text = qs(0x9c8312f4) button = blue z = 100000
			case error_msg
			case dlc_error_msg
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			case generic_vote
			add_user_control_helper controller = <controller> text = ($g_vote_items_text_helper_0) button = blue z = 100000
			add_user_control_helper controller = <controller> text = ($g_vote_items_text_helper_1) button = yellow z = 100000
			case delete_rocker
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_select) button = green z = 100000
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			default
		endswitch
	else
		managing = 0
		if ScreenElementExists \{id = band_lobby_desc_id}
			if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
				if NOT <resolved_id> :GetSingleTag managing
					managing = 0
				endif
			endif
		endif
		if ($g_leader_player_num > 0)
			getplayerinfo ($g_leader_player_num) controller
			if (<managing> = 1)
				add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_select) button = green z = 100000
				add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
				getplayerinfo ($g_leader_player_num) part
				if (<part> = vocals)
					add_user_control_helper controller = <controller> text = ($band_lobby_strings.0xaa07b490) button = dpad_updown z = 100000
				endif
			endif
			getnumplayersingame \{local}
			has_managed = 0
			if band_lobby_has_managed_submenu
				has_managed = 1
			endif
			if (<managing> = 0 || (<managing> = 1 && <num_players> != 1) || <has_managed> = 1)
				if ((band_lobby_live_profile_ingame) || (isngc))
					if ($g_ngc_friends_enabled = 1)
						if ($g_career_search = NULL)
							add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_friends) button = yellow z = 100000
						endif
					endif
				endif
				if NOT is_roadie_battle_mode
					if ($g_career_search = NULL)
						add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_players) button = blue z = 100000
					endif
				endif
			endif
			if (<managing> = 0)
				getnumplayersingame
				if ininternetmode
					if ($g_career_search = NULL)
						if NOT InNetGame
							if NetSessionFunc \{Obj = party
									func = is_host}
								add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_search) button = orange z = 100000
								add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_play) button = start z = 100000
							endif
						else
							if IsHost
								add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_play) button = start z = 100000
							endif
						endif
					else
						if NetSessionFunc \{Obj = party
								func = is_host}
							if (<num_players> != 4)
								add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_cancel_search) button = orange z = 100000
							endif
							if ($g_career_search = host_only)
								add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_finish_search) button = start z = 100000
							endif
						endif
					endif
				elseif NOT is_roadie_battle_mode
					add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_search) button = orange z = 100000
					add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_play) button = start z = 100000
				endif
			endif
		else
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
		endif
	endif
endscript

script band_lobby_go_back 
	printf \{channel = band_lobby
		qs(0x0aff04f9)}
	session_stats_reset
	if (GMan_GoalIsActive goal = career)
		quick_remove_goal \{goal_name = career}
	endif
	songlist_clear_playlist
	menu_transition_stoprender
	generic_event_back \{nosound = 1
		state = uistate_mainmenu}
endscript

script band_lobby_create_viewport_and_menus 
	printf \{channel = band_lobby
		qs(0x16f3dc73)}
	RequireParams \{[
			viewport_vmenu
		]
		all}
	i = 0
	begin
	ResolveScreenElementID id = [
		{id = <viewport_vmenu>}
		{index = <i>}
	]
	desc_id = <resolved_id>
	RemoveParameter \{resolved_id}
	band_lobby_get_player_color viewport = <i>
	if ScreenElementExists id = <desc_id>
		formatText TextName = player_num qs(0x48c6d14c) d = (<i> + 1)
		<desc_id> :se_setprops {
			gamertag_bg_rgba = <rgba_md>
			gamertag_rgba = <rgba_md>
			menu_bg_rgba = [0 0 0 255]
			scrollbar_rgba = <rgba_md>
			scroll_arrow_up_rgba = [125 125 125 255]
			scroll_arrow_dn_rgba = [125 125 125 255]
			scroll_thumb_rgba = [125 125 125 255]
			band_leader_rgba = <rgba>
			event_handlers = [
				{focus band_lobby_viewport_change_focus params = {focus_type = focus submenu_index = <i>}}
				{unfocus band_lobby_viewport_change_focus params = {focus_type = unfocus submenu_index = <i>}}
				{pad_choose band_lobby_select_band_member params = {viewport_index = <i>}}
			]
		}
		band_lobby_update_submenu_data submenu_index = <i> element = desc_id value = <desc_id>
		<desc_id> :Obj_SpawnScriptNow band_lobby_update_submenu_instrument params = {submenu_index = <i>}
		<desc_id> :Obj_SpawnScriptNow band_lobby_update_gamertag params = {submenu_index = <i>}
		<desc_id> :Obj_SpawnScriptNow band_lobby_update_leader_icon params = {submenu_index = <i>}
		<desc_id> :Obj_SpawnScriptNow band_lobby_update_menu_loop params = {submenu_index = <i>}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_character_window_hmenu}
		ResolveScreenElementID id = [
			{id = <resolved_id>}
			{index = <i>}
		]
		character_window_cont_id = <resolved_id>
		RemoveParameter \{resolved_id}
		if NOT freestyle_is_active
			if ScreenElementExists id = <character_window_cont_id>
				formatText checksumName = viewport 'band_viewport_%i' i = <i>
				formatText checksumName = viewport_texture 'viewport%i' i = <i>
				CreateScreenElement {
					id = <viewport>
					Type = ViewportElement
					parent = <character_window_cont_id>
					texture = black
					dims = (220.0, 410.0)
					just = [left top]
					Pos = (4.0, 0.0)
					z_priority = 5
					Priority = -1000
					style = band_viewports
					alpha = 1
					Scale = (-1.0, 1.0)
					blend = None
				}
				RunScriptOnScreenElement id = <viewport> band_lobby_play_viewport_camera params = {
					viewport_index = <i>
				}
			endif
		endif
	endif
	<desc_id> :desc_resolvealias Name = alias_viewport_vmenu param = resolved_id
	if ScreenElementExists id = <resolved_id>
		SetArrayElement ArrayName = band_lobby_viewport_menus globalarray index = <i> NewValue = <resolved_id>
		band_lobby_add_menu_update_to_queue submenu_index = <i> focus = 0
		RemoveParameter \{resolved_id}
	endif
	<i> = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
endscript

script band_lobby_create_submenus_remote 
	RequireParams \{[
			remote_players_menu
		]
		all}
	printf \{channel = band_lobby
		qs(0xa33e18fa)}
	i = 0
	begin
	ResolveScreenElementID id = [
		{id = <remote_players_menu>}
		{index = <i>}
	]
	if ScreenElementExists id = <resolved_id>
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = (<i> + 4)
		<resolved_id> :obj_spawnscript band_lobby_update_remote_ui_loop params = {submenu_data = <submenu_data>}
		RemoveParameter \{resolved_id}
	endif
	i = (<i> + 1)
	repeat 4
endscript

script band_lobby_update_remote_ui_loop 
	RequireParams \{[
			submenu_data
		]
		all}
	printf \{channel = band_lobby
		qs(0x05523af2)}
	Obj_GetID
	occupied = 0
	update = 0
	text = qs(0x00000000)
	begin
	if (($<submenu_data>.occupied) = 1)
		getplayerinfo ($<submenu_data>.Player) gamertag
		temp_gt = ($<gamertag>)
		if (($<submenu_data>.occupied) != <occupied>)
			alpha = 0.6
			occupied = ($<submenu_data>.occupied)
			update = 1
		endif
		if (<temp_gt> != <text>)
			text = <temp_gt>
			update = 1
		endif
		if (<update> = 1)
			if ResolveScreenElementID id = {<objID> child = gamertag}
				<resolved_id> :se_setprops text = <text> alpha = <alpha>
			endif
			update = 0
		endif
	else
		if (($<submenu_data>.occupied) != <occupied>)
			text = qs(0x00000000)
			alpha = 0.0
			if ResolveScreenElementID id = {<objID> child = gamertag}
				<resolved_id> :se_setprops text = <text> alpha = <alpha>
			endif
			occupied = ($<submenu_data>.occupied)
		endif
	endif
	Wait \{1
		Second}
	repeat
endscript

script band_lobby_play_viewport_camera 
	begin
	printf channel = band_lobby qs(0xffd9bb9e) i = <viewport_index>
	RequireParams \{[
			viewport_index
		]
		all}
	if NOT GotParam \{viewport_cam}
		formatText checksumName = viewport_cam 'band_viewport_cam_%i' i = <viewport_index>
	endif
	if NOT GotParam \{viewport}
		formatText checksumName = viewport 'band_viewport_%i' i = <viewport_index>
	endif
	if NOT ScreenElementExists id = <viewport>
		return
	endif
	KillCamAnim Name = <viewport_cam>
	Wait \{1
		gameframe}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	band_lobby_get_character_id Player = ($<submenu_data>.Player)
	if NOT GotParam \{lock_to_target}
		getplayerinfo ($<submenu_data>.Player) band_member out = lock_to_target
	endif
	if NOT ObjectExists id = <lock_to_target>
		return
	endif
	getplayerinfo ($<submenu_data>.Player) part
	if (<part> = drum)
		pos_h = (1.0, 0.0, 0.0)
	else
		pos_h = (1.5, 0.0, 0.0)
	endif
	getplayerinfo ($<submenu_data>.Player) band_member
	printf qs(0xe8d4ed4c) m = <band_member>
	offset = (0.0, -0.7)
	if (<character_id> = gh_rocker_lars)
		dist = 0.71999997
	else
		dist = 0.65000004
	endif
	switch <viewport_index>
		case 0
		PlayIGCCam {
			Name = <viewport_cam>
			viewport = <viewport>
			LockTo = <lock_to_target>
			LockToBone = control_root
			Pos = (<pos_h> + (0.0, 1.5, 0.1))
			Quat = (0.70710003, 0.70710003, 0.0)
			FOV = 45
			LookAt = <lock_to_target>
			LookAtBone = Bone_Neck
			ScreenOffset = <offset>
			distfromlookat = (<dist> + 0.05)
			play_hold
		}
		case 1
		PlayIGCCam {
			Name = <viewport_cam>
			viewport = <viewport>
			LockTo = <lock_to_target>
			LockToBone = control_root
			Pos = (<pos_h> + (0.0, 1.5, 0.0))
			Quat = (0.70710003, 0.70710003, 0.0)
			FOV = 45
			LookAt = <lock_to_target>
			LookAtBone = Bone_Neck
			ScreenOffset = <offset>
			distfromlookat = (<dist> + 0.01)
			play_hold
		}
		case 2
		PlayIGCCam {
			Name = <viewport_cam>
			viewport = <viewport>
			LockTo = <lock_to_target>
			LockToBone = control_root
			Pos = (<pos_h> + (0.0, 1.5, -0.1))
			Quat = (0.70710003, 0.70710003, 0.0)
			FOV = 45
			LookAt = <lock_to_target>
			LookAtBone = Bone_Neck
			ScreenOffset = <offset>
			distfromlookat = <dist>
			play_hold
		}
		case 3
		PlayIGCCam {
			Name = <viewport_cam>
			viewport = <viewport>
			LockTo = <lock_to_target>
			LockToBone = control_root
			Pos = (<pos_h> + (0.0, 1.5, 0.0))
			Quat = (0.70710003, 0.70710003, 0.0)
			FOV = 45
			LookAt = <lock_to_target>
			LookAtBone = Bone_Neck
			ScreenOffset = <offset>
			distfromlookat = (<dist> + 0.02)
			play_hold
		}
		default
		ScriptAssert \{qs(0xb8d70593)}
	endswitch
	<lock_to_target> :obj_setvisibility viewport = <viewport> exclusive
	Wait \{2.5
		Seconds}
	repeat 2
endscript

script band_lobby_persistent_band_mask 
	RequireParams \{[
			Player
		]
		all}
	if ($in_band_lobby = 0)
		return
	endif
	band_lobby_get_player_submenu_index player_num = <Player>
	if (<submenu_index> >= 0)
		band_lobby_mask_viewport viewport_index = <submenu_index>
	endif
endscript

script band_lobby_mask_viewport 
	RequireParams \{[
			viewport_index
		]
		all}
	if ($in_band_lobby = 0 || viewport_index > 3)
		return
	endif
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	element_id = ($<submenu_data>.desc_id)
	if ScreenElementExists id = <element_id>
		<element_id> :se_setprops block_viewport_alpha = 1
	endif
endscript

script band_lobby_persistent_band_unmask 
	RequireParams \{[
			Player
		]
		all}
	if ($in_band_lobby = 0)
		return
	endif
	band_lobby_get_player_submenu_index player_num = <Player>
	if (<submenu_index> >= 0)
		band_lobby_unmask_viewport viewport_index = <submenu_index> time = <time>
	endif
endscript

script band_lobby_unmask_viewport \{time = 0.1}
	RequireParams \{[
			viewport_index
		]
		all}
	if ($in_band_lobby = 0 || viewport_index > 3)
		return
	endif
	KillSpawnedScript \{Name = band_lobby_mask_viewport}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	element_id = ($<submenu_data>.desc_id)
	if ScreenElementExists id = <element_id>
		if ($<submenu_data>.occupied = 1 || $<submenu_data>.is_managed = 1)
			<element_id> :se_setprops block_viewport_alpha = 0.0 time = <time>
		else
			<element_id> :se_setprops block_viewport_alpha = 0.6 time = <time>
		endif
	endif
endscript

script band_lobby_scroll_submenu 
	RequireParams \{[
			Dir
			Player
			viewport_index
		]
		all}
	Obj_GetID
	<objID> :menu_getselectedindex
	<objID> :se_getprops Pos
	if GetScreenElementChildren id = <objID>
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
		GetArraySize <children>
		if (<Dir> = up)
			printf \{channel = sfx
				qs(0xa49092fb)}
			if NOT (<selected_index> <= 0)
				gh5_band_screen_ui_sound player_num = <Player> up = 1
				if ScreenElementExists id = (<children> [<selected_index>])
					LaunchEvent Type = unfocus target = <objID>
				endif
				menu_changeselection \{up}
				<selected_index> = (<selected_index> - 1)
				Wait \{2
					gameframes}
				($<submenu_data>.desc_id) :Obj_SpawnScriptNow band_lobby_animate_scroll_bar params = {num_menu_items = <array_Size> selected_index = <selected_index>}
				($<submenu_data>.desc_id) :Obj_SpawnScriptNow band_lobby_animate_scroll_bar_arrows params = {Dir = <Dir>}
				if (<selected_index> > 0 && <selected_index> < (<array_Size> - 2))
					<objID> :se_waitprops
					GetScreenElementPosition id = <objID>
					Pos = ((0.0, 20.0) - ((0.0, 33.0) * <selected_index>))
					<Pos> = (<Pos> + (<screenelementpos>.(1.0, 0.0) * (1.0, 0.0)))
					<objID> :se_setprops Pos = <Pos> time = 0.1
					<objID> :se_waitprops
				else
					Wait \{0.1
						Seconds}
				endif
				if band_lobby_does_popup_exist
					return
				elseif ui_event_exists_in_stack \{above = 'band_lobby'
						Name = 'band_lobby_popup'}
					return
				endif
				if ScreenElementExists id = (<children> [<selected_index>])
					LaunchEvent Type = focus target = <objID> data = {child_index = <selected_index>}
				endif
			endif
		elseif (<Dir> = down)
			printf \{channel = sfx
				qs(0x53e69f18)}
			if ((<selected_index> + 1) < <array_Size>)
				gh5_band_screen_ui_sound player_num = <Player> down = 1
				if ScreenElementExists id = (<children> [<selected_index>])
					LaunchEvent Type = unfocus target = <objID>
				endif
				menu_changeselection \{down}
				<selected_index> = (<selected_index> + 1)
				Wait \{2
					gameframes}
				($<submenu_data>.desc_id) :Obj_SpawnScriptNow band_lobby_animate_scroll_bar params = {num_menu_items = <array_Size> selected_index = <selected_index>}
				($<submenu_data>.desc_id) :Obj_SpawnScriptNow band_lobby_animate_scroll_bar_arrows params = {Dir = <Dir>}
				if (<selected_index> > 0 && <selected_index> < (<array_Size> - 2))
					<objID> :se_waitprops
					GetScreenElementPosition id = <objID>
					Pos = ((0.0, 20.0) - ((0.0, 33.0) * <selected_index>))
					<Pos> = (<Pos> + (<screenelementpos>.(1.0, 0.0) * (1.0, 0.0)))
					<objID> :se_setprops Pos = <Pos> time = 0.1
					<objID> :se_waitprops
				else
					Wait \{0.1
						Seconds}
				endif
				if band_lobby_does_popup_exist
					return
				elseif ui_event_exists_in_stack \{above = 'band_lobby'
						Name = 'band_lobby_popup'}
					return
				endif
				if ScreenElementExists id = (<children> [<selected_index>])
					LaunchEvent Type = focus target = <objID> data = {child_index = <selected_index>}
				endif
			endif
		endif
	endif
endscript

script band_lobby_animate_scroll_bar 
	printf \{channel = band_lobby
		qs(0x0f7801dc)}
	printscriptinfo \{'band_lobby_animate_scroll_bar'
		channel = band_lobby}
	RequireParams \{[
			num_menu_items
			selected_index
		]
		all}
	printstruct <...> channel = band_lobby
	Obj_GetID
	<objID> :desc_resolvealias Name = 0x742e70f0
	<resolved_id> :se_getprops
	if (<num_menu_items> > 1)
		num_steps = (<num_menu_items> - 1)
	else
		num_steps = 1
	endif
	scrollbar_step = (<scrollbar_dims> [1] / <num_steps>)
	scrollbar_thumb_pos = ((<scrollbar_dims> [1] * (0.0, -0.82)) + ((0.0, 1.72) * <scrollbar_step> * <selected_index>))
	<resolved_id> :se_setprops scrollbar_thumb_pos = <scrollbar_thumb_pos> time = 0.1
	<resolved_id> :se_waitprops
endscript

script band_lobby_animate_scroll_bar_arrows 
	printf \{channel = band_lobby
		qs(0xb0e60220)}
	RequireParams \{[
			Dir
		]
		all}
	Obj_GetID
	if (<Dir> = up)
		<objID> :se_setprops scroll_arrow_up_scale = 1.5 time = 0.05
	elseif (<Dir> = down)
		<objID> :se_setprops scroll_arrow_dn_scale = 1.5 time = 0.05
	endif
	<objID> :se_waitprops
	if (<Dir> = up)
		<objID> :se_setprops scroll_arrow_up_scale = 1.0 time = 0.05
	elseif (<Dir> = down)
		<objID> :se_setprops scroll_arrow_dn_scale = 1.0 time = 0.05
	endif
	<objID> :se_waitprops
endscript

script band_lobby_animate_vmenu 
	printf \{channel = band_lobby
		qs(0xc45dfb9e)}
	RequireParams \{[
			Dir
		]
		all}
	Obj_GetID
	<objID> :se_getprops Pos
	if (<Dir> = up)
		<objID> :se_setprops Pos = (<Pos> + (0.0, 33.0)) time = 0.1
	elseif (<Dir> = down)
		<objID> :se_setprops Pos = (<Pos> + (0.0, -33.0)) time = 0.1
	endif
	<objID> :se_waitprops
endscript

script band_lobby_submenu_change_focus 
	RequireParams \{[
			Player
			viewport_index
			focus_type
		]
		all}
	printf channel = band_lobby qs(0x4643faf2) p = <Player>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	Obj_GetID
	<objID> :GetTags
	if (<focus_type> = focus)
		ResolveScreenElementID id = [
			{id = <objID>}
			{local_id = button_icon}
		]
		if ScreenElementExists id = <resolved_id>
			getplayerinfo <Player> controller
			user_control_helper_get_buttonchar button = green controller = <controller>
			<resolved_id> :se_setprops text = <buttonchar>
			RemoveParameter \{resolved_id}
		endif
		ResolveScreenElementID id = [
			{id = <objID>}
			{local_id = text}
		]
		if ScreenElementExists id = <resolved_id>
			switch <viewport_index>
				case 0
				rgba = p1_dk
				case 1
				rgba = p2_dk
				case 2
				rgba = p3_dk
				case 3
				rgba = p4_dk
			endswitch
			RemoveParameter \{resolved_id}
		endif
		ResolveScreenElementID id = [
			{id = <objID>}
			{local_id = highlight_bar}
		]
		if ScreenElementExists id = <resolved_id>
			<resolved_id> :se_setprops alpha = 1.0 time = 0.1
		endif
		ResolveScreenElementID id = [
			{id = <objID>}
			{local_id = text}
		]
		if ScreenElementExists id = <resolved_id>
			if (($<submenu_data>.menu) != join &&
					($<submenu_data>.menu) != remote_player &&
					($<submenu_data>.menu) != mc_checking &&
					($<submenu_data>.menu) != mc_loading &&
					($<submenu_data>.menu) != mc_saving &&
					($<submenu_data>.menu) != mc_dlc_scan &&
					($<submenu_data>.menu) != searching &&
					($<submenu_data>.menu) != found_player &&
					($<submenu_data>.menu) != remote_player)
				<resolved_id> :se_setprops rgba = [0 0 0 255]
			else
				<resolved_id> :se_setprops rgba = [255 255 255 255]
			endif
		endif
		<objID> :se_getparentid
		<parent_id> :GetSingleTag last_item_selected
		if NOT GotParam \{last_item_selected}
			<last_item_selected> = None
		endif
		if (<last_item_selected> != <objID>)
			if GotParam \{additional_focus_script}
				if NOT freestyle_is_active
					<additional_focus_script> <additional_focus_params>
				else
					<additional_focus_script> <additional_focus_params> Player = <Player> viewport_index = <viewport_index>
				endif
			endif
		endif
		<parent_id> :SetTags last_item_selected = <objID>
	elseif (<focus_type> = unfocus)
		ResolveScreenElementID id = [
			{id = <objID>}
			{local_id = button_icon}
		]
		if ScreenElementExists id = <resolved_id>
			<resolved_id> :se_setprops text = qs(0x00000000)
			RemoveParameter \{resolved_id}
		endif
		ResolveScreenElementID id = [
			{id = <objID>}
			{local_id = text}
		]
		if ScreenElementExists id = <resolved_id>
			band_lobby_get_player_color viewport = <viewport_index>
			RemoveParameter \{resolved_id}
		endif
		ResolveScreenElementID id = [
			{id = <objID>}
			{local_id = highlight_bar}
		]
		if ScreenElementExists id = <resolved_id>
			<resolved_id> :se_setprops alpha = 0.0 time = 0.1
		endif
		ResolveScreenElementID id = [
			{id = <objID>}
			{local_id = text}
		]
		if ScreenElementExists id = <resolved_id>
			if (<selectable> = 1)
				<resolved_id> :se_setprops rgba = ($uicolorref_palette.ntscwhite.rgba)
			else
				<resolved_id> :se_setprops rgba = ($uicolorref_palette.grey_md.rgba)
			endif
		endif
		if GotParam \{additional_unfocus_script}
			<additional_unfocus_script> <additional_unfocus_params>
		endif
	endif
endscript

script band_lobby_viewport_change_focus 
	printf \{channel = band_lobby
		qs(0x0b83e9a1)}
	RequireParams \{[
			focus_type
			submenu_index
		]
		all}
	if (<focus_type> = focus)
		se_setprops \{frame_highlight_alpha = 1.0}
		if desc_resolvealias \{Name = alias_highlight_anim}
			<resolved_id> :obj_spawnscript 0x46ef0e03
		endif
	elseif (<focus_type> = unfocus)
		se_setprops \{frame_highlight_alpha = 0.0}
		if desc_resolvealias \{Name = alias_highlight_anim}
			<resolved_id> :Obj_KillSpawnedScript Name = 0x46ef0e03
		endif
	endif
	if (<focus_type> = unfocus)
		this_index = <submenu_index>
		if get_submenu_index_from_player Player = ($g_leader_player_num)
			if (<this_index> != <submenu_index>)
				LaunchEvent Type = focus target = ($band_lobby_viewport_menus [<this_index>])
			endif
		endif
		<submenu_index> = <this_index>
	endif
endscript

script 0x1550adfb 
	begin
	if ScreenElementExists \{id = band_lobby_desc_id}
		break
	endif
	Wait \{1
		gameframe}
	repeat 100
	viewport_index = 0
	begin
	band_lobby_get_submenu_data viewport_index = <viewport_index> param = occupied
	occupied = <submenu_data>
	if (<occupied> = 1)
		if ScreenElementExists \{id = band_lobby_desc_id}
			if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
				GetScreenElementChildren id = <resolved_id>
				<viewport> = (<children> [<viewport_index>])
				band_lobby_get_player_color viewport = <viewport_index>
				<viewport> :se_setprops lobby_frame_sm_rgba = <rgba_md> time = 0.2
			endif
		endif
	endif
	<viewport_index> = (<viewport_index> + 1)
	repeat 4
endscript
ui_band_ds_returned = 0

script ui_band_lobby_anim_in 
	if ($ui_band_ds_returned = 1)
		Change \{ui_band_ds_returned = 0}
		return
	endif
	printf \{channel = band_lobby
		qs(0xf1e10cb5)}
	if ($g_suppress_anim_in = 0)
		if (($g_lobby_net_state = net_private) || ($g_lobby_net_state = net_public))
			if NOT ininternetmode
				if NOT band_lobby_net_setup
					Change \{g_lobby_net_state = local}
				endif
				band_lobby_update_lobby_title
				band_lobby_update_button_helpers
				band_lobby_update_ticker \{msg_checksum = current_state}
			else
				band_lobby_poll_party_object
			endif
		else
			Wait \{3
				gameframes}
		endif
		band_lobby_change_viewport_menus
		if NOT ($g_band_lobby_error_msg = NULL)
			if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
				band_lobby_create_popup_menu {
					menu = error_msg
					Player = ($g_leader_player_num)
					container = <resolved_id>
				}
			endif
		endif
	endif
	Change \{g_suppress_anim_in = 0}
endscript

script ui_band_lobby_anim_out 
endscript

script band_lobby_change_viewport_menus 
	printf \{channel = band_lobby
		qs(0xdcd7fe40)}
	GetArraySize ($band_lobby_viewport_menus)
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	if NOT ($g_band_lobby_error_msg = NULL)
		menu = join
		focus = 0
	else
		getplayerinfo ($<submenu_data>.Player) in_game
		getplayerinfo ($<submenu_data>.Player) is_local_client
		if (<in_game> = 1)
			if (<is_local_client> = 1)
				getplayerinfo ($<submenu_data>.Player) controller
				if band_lobby_controller_can_save controller = <controller>
					load_savegame = 1
				endif
				if ((isps3) || (isngc))
					RemoveParameter \{load_savegame}
				endif
				get_savegame_from_controller controller = <controller>
				if get_savegame_has_saved_game savegame = <savegame>
					RemoveParameter \{load_savegame}
				endif
				if NOT is_autosave_on savegame = <savegame>
					RemoveParameter \{load_savegame}
				endif
				printstruct <...>
				if GotParam \{load_savegame}
					savegame_async_button_in savegame = <savegame> callback = lobby_mc_loading_callback data = {
						Player = ($<submenu_data>.Player)
						viewport_index = <i>
						controller = <controller>
					}
					menu = mc_checking
					focus = 0
				else
					menu = main
					focus = 1
				endif
			else
				menu = remote_player
				if InNetGame
					focus = 0
				else
					focus = 1
				endif
			endif
		else
			if InNetGame
				menu = empty
				focus = 0
			else
				menu = join
				focus = 1
			endif
		endif
	endif
	if ScreenElementExists id = ($band_lobby_viewport_menus [<i>])
		if playerinfoequals ($<submenu_data>.Player) is_local_client = 1
			($band_lobby_viewport_menus [<i>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {menu = <menu> action = forward Player = ($<submenu_data>.Player) viewport_index = <i> focus = <focus>}
		else
			($band_lobby_viewport_menus [<i>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {menu = <menu> action = forward Player = ($<submenu_data>.Player) viewport_index = <i> focus = <focus> no_forced}
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script band_lobby_force_all_ready_players_to_main_menu 
	GetArraySize ($band_lobby_viewport_menus)
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	if isscreenelementinfocus id = ($band_lobby_viewport_menus [<i>])
		focus = 1
	else
		focus = 0
	endif
	if (($<submenu_data>.occupied) = 1)
		if ScreenElementExists id = ($band_lobby_viewport_menus [<i>])
			if NOT band_lobby_is_in_forced_flow viewport_index = <i>
				array = ($<submenu_data>.menu_indices)
				SetArrayElement \{ArrayName = array
					index = 0
					NewValue = 0}
				SetArrayElement \{ArrayName = array
					index = 1
					NewValue = 0}
				SetArrayElement \{ArrayName = array
					index = 2
					NewValue = 0}
				band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = <array>
				($band_lobby_viewport_menus [<i>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {menu = main action = back Player = ($<submenu_data>.Player) viewport_index = <i> focus = <focus>}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script band_lobby_is_in_forced_flow 
	RequireParams \{[
			viewport_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	switch ($<submenu_data>.menu)
		case forced_difficulty
		case forced_instruments
		case forced_vocal_highway
		case forced_mic_preference
		case forced_lefty_flip
		return \{true}
		default
		return \{FALSE}
	endswitch
	return \{FALSE}
endscript

script band_lobby_get_forced_menu 
	RequireParams \{[
			viewport_index
		]
		all}
	printf channel = band_lobby qs(0x3d1916c6) v = <viewport_index>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	if NOT freestyle_is_active
		if (($<submenu_data>.occupied) = 1)
			getplayerinfo ($<submenu_data>.Player) is_local_client
			if (<is_local_client> = 1)
				getplayerinfo ($<submenu_data>.Player) controller
				if ($allow_controller_for_all_instruments = 1)
					getplayerinfo ($<submenu_data>.Player) part
					if (<part> = vocals)
						if band_lobby_should_show_mic_preference Player = ($<submenu_data>.Player)
							get_progression_instrument_user_option controller = <controller> part = vocals option = 'mic_preference'
							if (<user_option> = None)
								if ($skip_band_lobby_forced_flow = 0)
									return \{true
										forced_menu = forced_mic_preference}
								endif
							endif
						endif
						if band_lobby_should_force_highway_view Player = ($<submenu_data>.Player)
							get_progression_instrument_user_option controller = <controller> part = vocals option = 'highway_view'
							if (<user_option> = None)
								if ($skip_band_lobby_forced_flow = 0)
									return \{true
										forced_menu = forced_vocal_highway}
								endif
							endif
						endif
					else
						get_progression_instrument_user_option controller = <controller> part = <part> option = 'lefty_flip'
						if (<user_option> < 0)
							if ($skip_band_lobby_forced_flow = 0)
								if is_roadie_battle_mode
									return \{true
										forced_menu = roadie_battle_forced_lefty_flip}
								else
									return \{true
										forced_menu = forced_lefty_flip}
								endif
							endif
						endif
					endif
					get_progression_instrument_user_option controller = <controller> part = <part> option = 'difficulty'
					if (<user_option> = None)
						if ($skip_band_lobby_forced_flow = 0)
							if is_roadie_battle_mode
								return \{true
									forced_menu = roadie_battle_forced_difficulty}
							else
								return \{true
									forced_menu = forced_difficulty}
							endif
						endif
					endif
				elseif band_lobby_isguitarcontroller Player = ($<submenu_data>.Player) viewport_index = <viewport_index>
					get_progression_instrument_user_option controller = <controller> option = 'guitar_bass_flip'
					guitar_bass_flip = <user_option>
					if is_roadie_battle_mode
						part = guitar
					else
						if (<guitar_bass_flip> = None)
							if ($skip_band_lobby_forced_flow = 1)
								part = guitar
							else
								return \{true
									forced_menu = forced_instruments}
							endif
						else
							part = <guitar_bass_flip>
						endif
					endif
					get_progression_instrument_user_option controller = <controller> part = <part> option = 'lefty_flip'
					if (<user_option> < 0)
						if ($skip_band_lobby_forced_flow = 0)
							if is_roadie_battle_mode
								return \{true
									forced_menu = roadie_battle_forced_lefty_flip}
							else
								return \{true
									forced_menu = forced_instruments}
							endif
						endif
					endif
					get_progression_instrument_user_option controller = <controller> part = <part> option = 'difficulty'
					if (<user_option> = None)
						if ($skip_band_lobby_forced_flow = 0)
							if is_roadie_battle_mode
								return \{true
									forced_menu = roadie_battle_forced_lefty_flip}
							else
								return \{true
									forced_menu = forced_instruments}
							endif
						endif
					endif
				elseif band_lobby_isdrumcontroller Player = ($<submenu_data>.Player) viewport_index = <viewport_index>
					get_progression_instrument_user_option controller = <controller> part = drum option = 'lefty_flip'
					if (<user_option> < 0)
						if ($skip_band_lobby_forced_flow = 0)
							if is_roadie_battle_mode
								return \{true
									forced_menu = roadie_battle_forced_lefty_flip}
							else
								return \{true
									forced_menu = forced_lefty_flip}
							endif
						endif
					endif
					part = drum
					get_progression_instrument_user_option controller = <controller> part = <part> option = 'difficulty'
					if (<user_option> = None)
						if ($skip_band_lobby_forced_flow = 0)
							if is_roadie_battle_mode
								return \{true
									forced_menu = roadie_battle_forced_lefty_flip}
							else
								return \{true
									forced_menu = forced_lefty_flip}
							endif
						endif
					endif
				elseif band_lobby_isvocalscontroller Player = ($<submenu_data>.Player) viewport_index = <viewport_index>
					if band_lobby_should_show_mic_preference Player = ($<submenu_data>.Player)
						get_progression_instrument_user_option controller = <controller> part = vocals option = 'mic_preference'
						if (<user_option> = None)
							if ($skip_band_lobby_forced_flow = 0)
								return \{true
									forced_menu = forced_mic_preference}
							endif
						endif
					endif
					if band_lobby_should_force_highway_view Player = ($<submenu_data>.Player)
						get_progression_instrument_user_option controller = <controller> part = vocals option = 'highway_view'
						if (<user_option> = None)
							if ($skip_band_lobby_forced_flow = 0)
								return \{true
									forced_menu = forced_vocal_highway}
							endif
						endif
					endif
					part = vocals
					get_progression_instrument_user_option controller = <controller> part = <part> option = 'difficulty'
					if (<user_option> = None)
						if ($skip_band_lobby_forced_flow = 0)
							if is_roadie_battle_mode
								return \{true
									forced_menu = roadie_battle_forced_difficulty}
							elseif band_lobby_should_force_highway_view Player = ($<submenu_data>.Player)
								return \{true
									forced_menu = forced_vocal_highway}
							else
								return \{true
									forced_menu = forced_difficulty}
							endif
						endif
					endif
				else
					ScriptAssert \{qs(0xd0b915fb)}
				endif
			endif
		endif
	endif
	return \{FALSE}
endscript

script band_lobby_force_submenu_change_all \{submenu_data_match = occupied
		match_value = 0}
	RequireParams \{[
			menu
		]
		all}
	printf \{channel = band_lobby
		qs(0xbb5cb6a8)}
	GetArraySize ($band_lobby_viewport_menus)
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	if NOT GotParam \{focus}
		if isscreenelementinfocus id = ($band_lobby_viewport_menus [<i>])
			focus = 1
		else
			focus = 0
		endif
	endif
	if (($<submenu_data>.<submenu_data_match>) = <match_value>)
		if ScreenElementExists id = ($band_lobby_viewport_menus [<i>])
			($band_lobby_viewport_menus [<i>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {menu = <menu> action = forward Player = ($<submenu_data>.Player) viewport_index = <i> focus = <focus>}
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script band_lobby_refresh_all_submenus 
	RequireParams \{[
			Type
		]
		all}
	printf \{channel = band_lobby
		qs(0xb8604599)}
	begin
	if NOT ScriptIsRunning \{band_lobby_update_menu}
		break
	endif
	Wait \{0.2
		Seconds}
	repeat
	Wait \{1
		gameframe}
	if (<Type> = local)
		client_type = 1
	elseif (<Type> = remote)
		client_type = 0
	elseif (<Type> = in_game)
		in_game = 1
	elseif (<Type> = not_in_game)
		in_game = 0
	endif
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	if isscreenelementinfocus id = ($band_lobby_viewport_menus [<i>])
		return_focus = 1
	else
		return_focus = 0
	endif
	if GotParam \{client_type}
		if playerinfoequals ($<submenu_data>.Player) is_local_client = <client_type>
			band_lobby_add_menu_update_to_queue submenu_index = <i> action = forward focus = <return_focus>
		endif
	elseif GotParam \{in_game}
		if playerinfoequals ($<submenu_data>.Player) in_game = <in_game>
			band_lobby_add_menu_update_to_queue submenu_index = <i> action = forward focus = <return_focus>
		endif
	else
		band_lobby_add_menu_update_to_queue submenu_index = <i> action = forward focus = <return_focus>
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
endscript

script band_lobby_refresh_all_submenus_new 
	printf \{channel = band_lobby
		qs(0xca8431bf)}
	i = 0
	begin
	band_lobby_add_menu_update_to_queue submenu_index = <i> <...>
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
endscript

script band_lobby_wait_for_menu_update 
	RequireParams \{[
			submenu_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x3a31d224)}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	begin
	Wait \{1
		gameframe}
	if (($<submenu_data>.is_updating) = 0)
		GetArraySize ($<submenu_data>.update_queue)
		if (<array_Size> = 0)
			break
		endif
	endif
	repeat
endscript

script band_lobby_wait_for_menu_update_all 
	printf \{channel = band_lobby
		qs(0xb59f76a3)}
	array = []
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	AddArrayElement array = <array> element = <submenu_data>
	repeat ($g_num_lobby_local_submenus)
	GetArraySize <array> param = num_updating_menus
	begin
	Wait \{1
		gameframe}
	i = 0
	update_in_progress = 0
	begin
	submenu_data = (<array> [<i>])
	GetArraySize ($<submenu_data>.update_queue)
	if (<array_Size> > 0)
		update_in_progress = 1
		break
	elseif (($<submenu_data>.is_updating) = 1)
		update_in_progress = 1
		break
	endif
	i = (<i> + 1)
	repeat <num_updating_menus>
	if (<update_in_progress> = 0)
		break
	endif
	repeat
endscript

script band_lobby_add_menu_update_to_queue 
	RequireParams \{[
			submenu_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x25bb351a)}
	band_lobby_get_submenu_data_new submenu_index = <submenu_index> param = update_queue
	new_menu_update = {
		menu = <menu>
		action = <action>
		focus = <focus>
		submenu_index = <submenu_index>
	}
	AddArrayElement array = <update_queue> element = <new_menu_update>
	band_lobby_update_submenu_data submenu_index = <submenu_index> element = update_queue value = <array>
endscript

script band_lobby_update_menu_loop 
	RequireParams \{[
			submenu_index
		]
		all}
	printf \{channel = band_lobby
		qs(0xf450d5b6)}
	OnExitRun band_lobby_update_submenu_data params = {submenu_index = <submenu_index> element = update_queue value = []}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	begin
	if (($<submenu_data>.is_updating) = 0)
		GetArraySize ($<submenu_data>.update_queue)
		if (<array_Size> > 0)
			if ScreenElementExists id = ($<submenu_data>.desc_id)
				($<submenu_data>.desc_id) :Obj_SpawnScriptNow band_lobby_update_menu params = {($<submenu_data>.update_queue [0])}
			endif
			RemoveArrayElement array = ($<submenu_data>.update_queue) index = 0
			band_lobby_update_submenu_data submenu_index = <submenu_index> element = update_queue value = <array>
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script band_lobby_update_menu 
	RequireParams \{[
			submenu_index
		]
		all}
	printf channel = band_lobby qs(0xc35cca6d) v = <submenu_index>
	if ScreenElementExists id = ($band_lobby_viewport_menus [<submenu_index>])
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = is_updating value = 1
		if isscreenelementinfocus id = ($band_lobby_viewport_menus [<submenu_index>])
			current_focus_value = ($<submenu_data>.focus_type)
			LaunchEvent Type = unfocus target = ($band_lobby_viewport_menus [<submenu_index>])
		else
			current_focus_value = ($<submenu_data>.focus_type)
		endif
		if GotParam \{action}
			band_lobby_create_new_submenu viewport_index = <submenu_index> action = <action>
		else
			if ScreenElementExists id = ($band_lobby_viewport_menus [<submenu_index>])
				DestroyScreenElement id = ($band_lobby_viewport_menus [<submenu_index>]) preserve_parent
			endif
			new_vmenu = ($band_lobby_viewport_menus [<submenu_index>])
		endif
		menu = ($<submenu_data>.menu)
		if is_roadie_battle_mode
			if (<menu> = join)
				<exclusive_array> = [0 1 2 3]
				<i> = 0
				begin
				if playerinfoequals (<i> + 1) in_game = 1
					getplayerinfo (<i> + 1) controller
					SetArrayElement ArrayName = exclusive_array index = <controller> NewValue = -1
				endif
				<i> = (<i> + 1)
				repeat 4
				<new_vmenu> :se_setprops exclusive_device = <exclusive_array>
				printstruct <...>
				RemoveParameter \{exclusive_array}
				removeparamater \{i}
			endif
		elseif freestyle_is_active
			getplayerinfo (<submenu_index> + 1) controller
			<new_vmenu> :se_setprops exclusive_device = <controller>
		endif
		band_lobby_get_player_color viewport = <submenu_index>
		($<submenu_data>.desc_id) :se_setprops subheading_text = ($band_lobby_submenu_states.<menu>.title)
		($<submenu_data>.desc_id) :se_setprops subheading_rgba = <rgba_md>
		if NOT 0x3e572301
			if ($<submenu_data>.is_managed = 1)
				($<submenu_data>.desc_id) :se_setprops lobby_frame_sm_rgba = ($uicolorref_palette.red_md.rgba)
			else
				if (($<submenu_data>.occupied) = 0)
					($<submenu_data>.desc_id) :se_setprops lobby_frame_sm_rgba = [128 128 128 255] time = 0.2
				endif
			endif
		else
			if ($<submenu_data>.is_managed = 1)
				($<submenu_data>.desc_id) :se_setprops lobby_frame_sm_rgba = ($uicolorref_palette.red_md.rgba)
			else
				if (($<submenu_data>.occupied) = 0)
					if NOT freestyle_is_active
						($<submenu_data>.desc_id) :se_setprops {
							0xd6f201e8 = ($0x180ccff4)
							0x86f0c4f2 = ($0x8c78bd9e)
						}
					else
						if (($freestyle_band_lobby_player_states [<submenu_index>]) = not_joined)
							0xa80f0dcc state = 0x41db207a index = <submenu_index>
						else
							0xa80f0dcc state = 0xaa02f6fc index = <submenu_index>
						endif
					endif
				endif
			endif
		endif
		band_lobby_get_player_color viewport = <submenu_index>
		formatText checksumName = instrument_icon_rgba_prop 'instrument_icon_%d_rgba' d = (<submenu_index> + 1)
		lobby_props = {}
		AddParam structure_name = lobby_props Name = <instrument_icon_rgba_prop> value = <rgba_md>
		band_lobby_desc_id :se_setprops <lobby_props>
		band_lobby_get_num_menu_options Player = ($<submenu_data>.Player) submenu_index = <submenu_index>
		menu_options = ($band_lobby_submenu_states.<menu>.options)
		no_highlight_bar = FALSE
		no_highlight_bar = ($band_lobby_submenu_states.<menu>.no_highlight_bar)
		if (<no_highlight_bar> = FALSE)
			scrollbar_alpha = 1
		else
			scrollbar_alpha = 0
		endif
		($<submenu_data>.desc_id) :se_setprops scrollbar_alpha = <scrollbar_alpha> time = 0.1
		text_fit_width = truncate
		text_fit_width = ($band_lobby_submenu_states.<menu>.text_fit_width)
		if ($<submenu_data>.is_managed = 1 && $<submenu_data>.occupied = 0)
			Player = $g_leader_player_num
		else
			Player = ($<submenu_data>.Player)
		endif
		standard_params = {Player = <Player> viewport_index = <submenu_index>}
		GetArraySize <menu_options>
		menu_items = <array_Size>
		if (<array_Size> > 0)
			j = 0
			begin
			if StructureContains structure = (<menu_options> [<j>]) condition
				if (<menu_options> [<j>].condition) <standard_params> (<menu_options> [<j>].condition_params)
					add_element = 1
				else
					add_element = 0
					menu_items = (<menu_items> - 1)
				endif
			else
				add_element = 1
			endif
			if (<add_element> = 1)
				selectable = 1
				if StructureContains structure = (<menu_options> [<j>]) is_selectable_condition
					if NOT (<menu_options> [<j>].is_selectable_condition) <standard_params>
						selectable = 0
					endif
				endif
				CreateScreenElement {
					parent = <new_vmenu>
					Type = ContainerElement
					local_id = menu_item_cont
					dims = (412.0, 33.0)
					internal_just = [left center]
					just = [left center]
					event_handlers = [
						{focus band_lobby_submenu_change_focus params = {<standard_params> focus_type = focus additional_focus_script = (<menu_options> [<j>].additional_focus_script) additional_focus_params = (<menu_options> [<j>].additional_focus_params)}}
						{unfocus band_lobby_submenu_change_focus params = {<standard_params> focus_type = unfocus additional_unfocus_script = (<menu_options> [<j>].additional_unfocus_script) additional_unfocus_params = (<menu_options> [<j>].additional_unfocus_params)}}
						{pad_choose band_lobby_submenu_pad_handler_wrapper params = {choose_script = (<menu_options> [<j>].choose_script) submenu_index = <submenu_index> params = {<standard_params> (<menu_options> [<j>].select_params)} choose = 1}}
					]
					tags = {
						selectable = <selectable>
					}
				}
				container_id = <id>
				switch <viewport_index>
					case 0
					rgba = p1_lt
					case 1
					rgba = p2_lt
					case 2
					rgba = p3_lt
					case 3
					rgba = p4_lt
				endswitch
				if (<no_highlight_bar> = FALSE)
					CreateScreenElement {
						parent = <container_id>
						local_id = highlight_bar
						Type = SpriteElement
						texture = highlight_03
						just = [center center]
						alpha = 0.0
						dims = (395.0, 59.0)
						Pos = (199.0, 26.0)
						Scale = (1.0, 0.6)
						z_priority = 4
						rgba = p1_lt
					}
				endif
				text_nudge = (0.0, 0.0)
				if StructureContains structure = (<menu_options> [<j>]) texture
					CreateScreenElement {
						parent = <container_id>
						Type = SpriteElement
						texture = (<menu_options> [<j>].texture)
						Pos = (0.0, 60.0)
						pos_anchor = [center center]
						just = [center center]
						autosizedims = true
						Scale = (1.7294999, 1.0)
						z_priority = 4
					}
				endif
				if StructureContains structure = (<menu_options> [<j>]) desc_id
					CreateScreenElement {
						parent = <container_id>
						Type = descinterface
						desc = (<menu_options> [<j>].desc_id)
						Pos = (0.0, 45.0)
						pos_anchor = [center center]
						just = [center center]
						autosizedims = true
						Scale = (1.7294999, 1.0)
						z_priority = 1
					}
					if StructureContains structure = (<menu_options> [<j>]) anim_script
						<id> :Obj_SpawnScriptNow (<menu_options> [<j>].anim_script)
					endif
				endif
				if StructureContains structure = (<menu_options> [<j>]) text
					if StructureContains structure = (<menu_options> [<j>]) text_params
						text = qs(0x874f5ede)
						tp_params = {}
						if StructureContains structure = (<menu_options> [<j>]) tp_params
							tp_params = (<menu_options> [<j>].tp_params)
						endif
						(<menu_options> [<j>].text_params) <standard_params> <tp_params>
						formatText TextName = text (<menu_options> [<j>].text) <text_params>
					else
						text = (<menu_options> [<j>].text)
					endif
					if (<selectable> = 1)
						text_rgba = ($uicolorref_palette.ntscwhite.rgba)
					else
						text_rgba = ($uicolorref_palette.grey_md.rgba)
					endif
					if (($<submenu_data>.menu) != join)
						switch ($<submenu_data>.menu)
							case mc_checking
							case mc_loading
							case mc_saving
							case mc_dlc_scan
							fit_width = `scale	each	line	if	larger`
							default
							fit_width = `scale	down	if	larger`
						endswitch
						CreateScreenElement {
							parent = <container_id>
							local_id = text
							Type = TextBlockElement
							Pos = (201.0, 3.5)
							dims = (355.0, 40.0)
							fit_width = <text_fit_width>
							fit_height = <fit_width>
							scale_mode = `per	axis`
							enable_min_scale = FALSE
							font = fontgrid_text_a1
							rgba = <text_rgba>
							text = <text>
							just = [center top]
							internal_scale = (0.69, 0.54)
							internal_just = [center , center]
							z_priority = 5
						}
					else
						if NOT freestyle_is_active
							band_lobby_helperpilltext <standard_params>
						else
							freestyle_band_lobby_get_button_prompt viewport_index = <submenu_index>
						endif
						if NOT freestyle_is_active
							CreateScreenElement {
								parent = <container_id>
								Type = menuelement
								Pos = (201.0, -15.0)
								dims = (1.0, 100.0)
								just = [center top]
								internal_just = [center center]
								isvertical = FALSE
								major_axis_fit = `expand	if	content	larger`
							}
							h_menu_id = <id>
						else
							if (<lines> = 1)
								CreateScreenElement {
									parent = <container_id>
									Type = menuelement
									Pos = (201.0, -15.0)
									dims = (1.0, 100.0)
									just = [center top]
									internal_just = [center center]
									isvertical = FALSE
									major_axis_fit = `expand	if	content	larger`
								}
								h_menu_id = <id>
							elseif (<lines> = 2)
								CreateScreenElement {
									parent = <container_id>
									Type = menuelement
									Pos = (201.0, 3.0)
									dims = (1.0, 100.0)
									just = [center top]
									internal_just = [center center]
									isvertical = FALSE
									major_axis_fit = `expand	if	content	larger`
								}
								h_menu_id = <id>
							endif
						endif
						if NOT freestyle_is_active
							CreateScreenElement {
								parent = <h_menu_id>
								local_id = text
								Type = TextBlockElement
								dims = (1.0, 8.0)
								font = fontgrid_text_a1
								rgba = <text_rgba>
								text = (<text_params>.a)
								internal_scale = (0.9 * (1.7294999, 1.0))
								internal_just = [right , center]
								fit_width = `expand	dims`
								fit_height = `expand	dims`
								z_priority = 5
							}
							CreateScreenElement {
								parent = <h_menu_id>
								local_id = text
								Type = TextBlockElement
								dims = (1.0, 8.0)
								fit_width = `expand	dims`
								fit_height = `expand	dims`
								enable_min_scale = FALSE
								font = fontgrid_text_a1
								rgba = <text_rgba>
								text = <text>
								internal_scale = (0.69, 0.54)
								internal_just = [left , center]
								z_priority = 5
							}
						else
							CreateScreenElement {
								parent = <h_menu_id>
								local_id = text
								Type = TextBlockElement
								dims = (74.0, 74.0)
								font = fontgrid_text_a1
								rgba = <text_rgba>
								text = <button>
								internal_scale = (0.9 * (1.7294999, 1.0))
								internal_just = [right , center]
								fit_width = `scale	each	line	if	larger`
								fit_height = `scale	down	if	larger`
								z_priority = 5
							}
							CreateScreenElement {
								parent = <h_menu_id>
								local_id = text
								Type = TextBlockElement
								dims = (1.0, 8.0)
								fit_width = `expand	dims`
								fit_height = `expand	dims`
								enable_min_scale = FALSE
								font = fontgrid_text_a1
								rgba = <text_rgba>
								text = <text>
								internal_scale = (0.69, 0.54)
								internal_just = [left , center]
								z_priority = 5
							}
						endif
					endif
					if StructureContains structure = (<menu_options> [<j>]) text_params
						<id> :SetTags original_text = (<menu_options> [<j>].text) text_params_func = (<menu_options> [<j>].text_params) standard_params = <standard_params>
						if StructureContains structure = (<menu_options> [<j>]) tp_params
							<id> :SetTags tp_params = (<menu_options> [<j>].tp_params)
						endif
					endif
				endif
			endif
			j = (<j> + 1)
			repeat <array_Size>
			if band_lobby_does_popup_exist
				focus = 0
			endif
			if GotParam \{focus}
				if (<focus> = 1)
					band_lobby_update_submenu_data submenu_index = <submenu_index> element = focus_type value = focus
				else
					band_lobby_update_submenu_data submenu_index = <submenu_index> element = focus_type value = unfocus
				endif
			else
				band_lobby_update_submenu_data submenu_index = <submenu_index> element = focus_type value = <current_focus_value>
			endif
			band_lobby_update_submenu_scroll_bar viewport_index = <submenu_index> VMenu = <new_vmenu>
			if GotParam \{action}
				if (<action> = forward)
					($band_lobby_viewport_menus [<submenu_index>]) :se_getprops Pos
					($band_lobby_viewport_menus [<submenu_index>]) :se_setprops Pos = ((-500.0, 0.0) + <Pos>) time = 0.4
					<new_vmenu> :se_getprops Pos
					<new_vmenu> :se_setprops Pos = ((-500.0, 0.0) + <Pos>) time = 0.4
				elseif (<action> = back)
					($band_lobby_viewport_menus [<submenu_index>]) :se_getprops Pos
					($band_lobby_viewport_menus [<submenu_index>]) :se_setprops Pos = ((500.0, 0.0) + <Pos>) time = 0.4
					<new_vmenu> :se_getprops Pos
					<new_vmenu> :se_setprops Pos = ((500.0, 0.0) + <Pos>) time = 0.4
				endif
				<new_vmenu> :se_waitprops
				DestroyScreenElement id = ($band_lobby_viewport_menus [<submenu_index>])
				SetArrayElement ArrayName = band_lobby_viewport_menus globalarray index = <submenu_index> NewValue = <new_vmenu>
			endif
			band_lobby_update_submenu_pad_handlers {
				viewport_index = <submenu_index>
				pad_back_script = ($band_lobby_submenu_states.<menu>.back_script)
				pad_back_params = {<standard_params> ($band_lobby_submenu_states.<menu>.back_params)}
				add_shortcuts = ($band_lobby_submenu_states.<menu>.add_shortcuts)
			}
		else
			if ScreenElementExists id = <new_vmenu>
				DestroyScreenElement id = <new_vmenu>
			endif
		endif
		if NOT freestyle_is_active
			if NOT (($<submenu_data>.desc_id) = NULL)
				LaunchEvent Type = ($<submenu_data>.focus_type) target = ($band_lobby_viewport_menus [<submenu_index>]) data = {child_index = ($<submenu_data>.menu_indices [0])}
				($<submenu_data>.desc_id) :Obj_SpawnScriptNow band_lobby_animate_scroll_bar params = {num_menu_items = <menu_items> selected_index = ($<submenu_data>.menu_indices [0])}
				band_lobby_update_submenu_data submenu_index = <submenu_index> element = is_updating value = 0
			endif
		else
			if NOT (($freestyle_band_lobby_player_states [<submenu_index>]) = not_joined)
				LaunchEvent Type = focus target = ($band_lobby_viewport_menus [<submenu_index>]) data = {child_index = ($<submenu_data>.menu_indices [0])}
			endif
			band_lobby_update_submenu_data submenu_index = <submenu_index> element = is_updating value = 0
		endif
	endif
endscript

script band_lobby_refresh_menu_text 
	RequireParams \{[
			id
		]
		all}
	GetScreenElementChildren id = <id>
	GetArraySize <children>
	index = 0
	begin
	GetScreenElementProps id = (<children> [<index>])
	if GotParam \{local_id}
		if (<local_id> = text)
			(<children> [<index>]) :GetTags
			text = qs(0x874f5ede)
			<text_params_func> <standard_params> <extra_params>
			formatText TextName = text <original_text> <text_params>
			(<children> [<index>]) :se_setprops text = <text>
			return
		endif
		RemoveParameter \{local_id}
	endif
	index = (<index> + 1)
	repeat <array_Size>
endscript

script 0xe85ffd6c 
	RequireParams \{[
			id
		]
		all}
	GetScreenElementChildren id = <id>
	GetArraySize <children>
	index = 0
	begin
	GetScreenElementProps id = (<children> [<index>])
	if GotParam \{local_id}
		if (<local_id> = text)
			(<children> [<index>]) :GetTags
			text = qs(0x874f5ede)
			<text_params_func> <standard_params> <tp_params>
			formatText TextName = text <original_text> <text_params>
			(<children> [<index>]) :se_setprops text = <text>
			return
		endif
		RemoveParameter \{local_id}
	endif
	index = (<index> + 1)
	repeat <array_Size>
endscript

script band_lobby_create_new_submenu 
	RequireParams \{[
			viewport_index
			action
		]
		all}
	printf channel = band_lobby qs(0x0d9494dc) v = <viewport_index>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	($band_lobby_viewport_menus [<viewport_index>]) :se_getprops
	($band_lobby_viewport_menus [<viewport_index>]) :se_getparentid
	if NOT freestyle_is_active
		if ($<submenu_data>.is_managed = 1)
			getplayerinfo ($g_leader_player_num) controller
			Player = ($g_leader_player_num)
		else
			getplayerinfo ($<submenu_data>.Player) controller
			Player = ($<submenu_data>.Player)
		endif
	else
		Player = (<viewport_index> + 1)
		getplayerinfo <Player> controller
	endif
	if (<action> = forward)
		starting_x = 500
		printf \{channel = sfx
			qs(0x242db7f2)}
	elseif (<action> = back)
		starting_x = -500
		printf \{channel = sfx
			qs(0x675834ee)}
	endif
	band_lobby_get_num_menu_options Player = <Player> submenu_index = <viewport_index>
	if (($<submenu_data>.menu_indices [0]) > <num_options> || ($<submenu_data>.menu_indices [0]) < 0)
		band_lobby_update_submenu_data submenu_index = <viewport_index> element = menu_indices value = [0 0 0]
	endif
	if (($<submenu_data>.menu_indices [0]) = 0 || ($<submenu_data>.menu_indices [0]) = 1)
		Pos = (((1.0, 0.0) * <starting_x>) + ((0.0, 20.0) - ((0.0, 33.0) * 1)))
	elseif (($<submenu_data>.menu_indices [0]) = (<num_options> - 1))
		Pos = (((1.0, 0.0) * <starting_x>) + ((0.0, 20.0) - ((0.0, 33.0) * (<num_options> - 2))))
	else
		Pos = (((1.0, 0.0) * <starting_x>) + ((0.0, 20.0) - ((0.0, 33.0) * ($<submenu_data>.menu_indices [0]))))
	endif
	CreateScreenElement {
		Type = VMenu
		local_id = viewport_vmenu
		parent = <parent_id>
		Pos = <Pos>
		just = <just>
		internal_just = <internal_just>
		pos_anchor = <pos_anchor>
		dims = <dims>
		spacing_between = <spacing_between>
		hiddenlocal = <hiddenlocal>
		alpha = <alpha>
		z_priority = <z_priority>
		Scale = <Scale>
		rot_angle = <rot_angle>
		rgba = <rgba>
		events_blocked = <events_blocked>
		isvertical = <isvertical>
		regular_space_amount = <regular_space_amount>
		padding_scale = <padding_scale>
		position_children = <position_children>
		fit_major = <fit_major>
		fit_minor = <fit_minor>
		scale_mode = <scale_mode>
		allow_wrap = <allow_wrap>
		exclusive_device = <controller>
		preserve_local_orientation = <preserve_local_orientation>
		allow_alternate_directional_events = <allow_alternate_directional_events>
	}
	return new_vmenu = <id>
endscript

script band_lobby_update_lobby_title 
	printf \{channel = band_lobby
		qs(0xd79dbde8)}
	if ScreenElementExists \{id = band_lobby_desc_id}
		if ($g_leader_player_num > 0)
			getplayerinfo ($g_leader_player_num) controller
			get_savegame_from_controller controller = <controller>
			if get_current_band_name savegame = <savegame>
				band_lobby_desc_id :se_setprops band_name_text = <band_name>
			endif
		else
			if get_current_band_name
				band_lobby_desc_id :se_setprops band_name_text = <band_name>
			endif
		endif
		band_lobby_create_lobby_status_string
		band_lobby_desc_id :se_setprops game_state_text = <text>
	endif
endscript

script band_lobby_create_lobby_status_string 
	printf \{channel = band_lobby
		qs(0xf2432c55)}
	if (1 = $global_should_use_net_debugging)
		formatText TextName = text qs(0x53cfde30) a = ($band_lobby_strings.($g_lobby_state)) b = ($band_lobby_strings.($g_lobby_net_state))
	else
		formatText TextName = text qs(0x35b12509) a = ($band_lobby_strings.($g_lobby_state))
	endif
	return text = <text>
endscript

script band_lobby_update_ticker 
	printf \{channel = band_lobby
		qs(0x9de6efa4)}
	RequireParams \{[
			msg_checksum
		]
		all}
	if ScreenElementExists \{id = band_lobby_desc_id}
		if StructureContains structure = ($band_lobby_strings) <msg_checksum>
			switch <msg_checksum>
				default
				msg = ($band_lobby_strings.<msg_checksum>)
			endswitch
			if band_lobby_desc_id :desc_resolvealias \{Name = alias_transient_msg_cont}
				if checksumequals a = <msg_checksum> b = current_state
					band_lobby_remote_name_fader \{fade = OFF}
					<resolved_id> :se_setprops alpha = 0.0 time = 0.25
				else
					band_lobby_remote_name_fader \{fade = On}
					<resolved_id> :se_setprops alpha = 1.0 time = 0.25
				endif
				if ($g_num_scrolling_texts > 0)
					<resolved_id> :Obj_KillSpawnedScript Name = scroll_ticker_text
					i = (($g_num_scrolling_texts) - 1)
					begin
					formatText checksumName = ticker_text_id_1 'scrolling_ticker_text_%i_1' i = <i>
					formatText checksumName = ticker_text_id_2 'scrolling_ticker_text_%i_2' i = <i>
					if ScreenElementExists id = <ticker_text_id_1>
						<ticker_text_id_1> :GetSingleTag ticker_text
						if GotParam \{ticker_text}
							if (<ticker_text> = <msg>)
								return
							endif
							RemoveParameter \{ticker_text}
						endif
					endif
					DestroyScreenElement id = <ticker_text_id_1>
					DestroyScreenElement id = <ticker_text_id_2>
					i = (<i> - 1)
					repeat ($g_num_scrolling_texts)
				endif
				if ScreenElementExists \{id = band_lobby_desc_id}
					<resolved_id> :Obj_SpawnScriptLater scroll_ticker_text params = {
						ticker_text = <msg>
						ticker_space = qs(0xc059c1be)
						ticker_pos = (0.0, 2.0)
						ticker_just = [top left]
						ticker_parent = <resolved_id>
						ticker_font = fontgrid_text_a3
						ticker_x_scale = 0.4
						ticker_y_scale = 0.35000002
						ticker_rgba1 = gh51_purple_lt
						ticker_rgba2 = gh51_purple_lt
						ticker_alpha = 1.0
						ticker_z_priority = 18
						time = 16
					}
				endif
			endif
		endif
	endif
endscript

script band_lobby_remote_name_fader 
	printf \{qs(0xc64663b5)}
	alpha = 0
	do_it = 1
	switch <fade>
		case On
		alpha = 0.05
		case OFF
		alpha = 0.6
		default
		printf \{qs(0xcef53bb4)}
		do_it = 0
	endswitch
	if (<do_it> = 1)
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_remote_players_menu}
			remote_players_menu = <resolved_id>
			i = 0
			begin
			formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = (<i> + 4)
			if (($<submenu_data>.occupied) = 1)
				ResolveScreenElementID id = [
					{id = <remote_players_menu>}
					{index = <i>}
				]
				if ScreenElementExists id = <resolved_id>
					if ResolveScreenElementID id = {<resolved_id> child = gamertag}
						<resolved_id> :se_setprops alpha = <alpha> time = 0.1
					endif
					RemoveParameter \{resolved_id}
				endif
			endif
			i = (<i> + 1)
			repeat 4
		endif
	endif
endscript

script band_lobby_flash_ticker_msg 
	RequireParams \{[
			msg_checksum
			time
		]
		all}
	printf \{channel = band_lobby
		qs(0x54d3a948)}
	if ScreenElementExists \{id = band_lobby_desc_id}
		band_lobby_desc_id :Obj_SpawnScriptNow band_lobby_display_ticker_msg_wait_and_kill params = {msg_checksum = <msg_checksum> time = <time>}
	endif
endscript

script band_lobby_display_ticker_msg_wait_and_kill 
	RequireParams \{[
			msg_checksum
			time
		]
		all}
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	printf \{channel = band_lobby
		qs(0xdeb0b049)}
	band_lobby_update_ticker msg_checksum = <msg_checksum>
	Wait <time> Seconds
	band_lobby_update_ticker \{msg_checksum = current_state}
endscript

script band_lobby_update_submenu_scroll_bar 
	printf \{channel = band_lobby
		qs(0x23fb9ce2)}
	RequireParams \{[
			viewport_index
			VMenu
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	if GetScreenElementChildren id = <VMenu>
		GetArraySize <children>
		($<submenu_data>.desc_id) :se_getprops
		if (<array_Size> > 1)
			num_steps = (<array_Size> - 1)
		else
			num_steps = 1
		endif
		scrollbar_step = ((<scrollbar_dims> [1] - (<scroll_thumb_dims> [1] * <scroll_thumb_scale> [1])) / <num_steps>)
		scroll_thumb_pos = (((1.0, 0.0) * (<scroll_thumb_pos> [0])) + (0.0, 4.0) + ((0.0, 1.0) * (<scrollbar_step> * ($<submenu_data>.menu_indices [0]))))
		($<submenu_data>.desc_id) :se_setprops scroll_thumb_pos = <scroll_thumb_pos> time = 0.1
	endif
endscript

script band_lobby_update_submenu_pad_handlers 
	RequireParams \{[
			viewport_index
			pad_back_script
			pad_back_params
		]
		all}
	printf channel = band_lobby qs(0xb189d8a2) c = <viewport_index>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	if NOT freestyle_is_active
		if ($<submenu_data>.is_managed = 1)
			Player = $g_leader_player_num
		else
			Player = ($<submenu_data>.Player)
		endif
	else
		Player = ($<submenu_data>.Player)
	endif
	standard_params = {Player = <Player> viewport_index = <viewport_index>}
	array = [
		{pad_up band_lobby_scroll_submenu params = {<standard_params> Dir = up}}
		{pad_down band_lobby_scroll_submenu params = {<standard_params> Dir = down}}
		{pad_back band_lobby_submenu_pad_handler_wrapper params = {choose_script = <pad_back_script> submenu_index = <viewport_index> params = <pad_back_params> back = 1}}
	]
	if NOT freestyle_is_active
		RequireParams \{[
				add_shortcuts
			]
			all}
		if (<add_shortcuts> = 1)
			if NOT is_roadie_battle_mode
				AddArrayElement array = <array> element = {pad_option band_lobby_submenu_pad_handler_wrapper params = {choose_script = band_lobby_players submenu_index = <viewport_index> params = <standard_params>}}
				if ($g_ngc_friends_enabled = 1)
					AddArrayElement array = <array> element = {pad_option2 band_lobby_submenu_pad_handler_wrapper params = {choose_script = band_lobby_friendslist submenu_index = <viewport_index> params = <standard_params>}}
				endif
			endif
			if ($<submenu_data>.is_managed = 0)
				AddArrayElement array = <array> element = {pad_start band_lobby_submenu_pad_handler_wrapper params = {choose_script = band_lobby_continue submenu_index = <viewport_index> params = <standard_params>}}
			endif
		endif
		if NOT is_roadie_battle_mode
			if ($<submenu_data>.is_managed = 0)
				if InNetGame
					if ($g_career_search != NULL)
						AddArrayElement array = <array> element = {pad_L1 band_lobby_submenu_pad_handler_wrapper params = {choose_script = band_lobby_net_continue submenu_index = <viewport_index> params = <standard_params> choose = 1}}
					endif
				else
					AddArrayElement array = <array> element = {pad_L1 band_lobby_submenu_pad_handler_wrapper params = {choose_script = band_lobby_net_continue submenu_index = <viewport_index> params = <standard_params> choose = 1}}
				endif
			endif
		endif
		($band_lobby_viewport_menus [<viewport_index>]) :se_setprops {
			event_handlers = <array>
			replace_handlers
		}
	else
		getplayerinfo <Player> controller
		($band_lobby_viewport_menus [<viewport_index>]) :se_setprops {
			exclusive_device = <controller>
		}
	endif
endscript

script band_lobby_submenu_pad_handler_wrapper 
	RequireParams \{[
			submenu_index
			choose_script
		]
		all}
	printf \{channel = band_lobby
		qs(0xef7eea69)}
	band_lobby_get_submenu_data_new submenu_index = <submenu_index> param = update_queue
	band_lobby_get_submenu_data_new submenu_index = <submenu_index> param = is_updating
	GetArraySize <update_queue>
	if ((<array_Size> = 0) && (<is_updating> = 0))
		if GotParam \{back}
			gh5_band_screen_ui_sound player_num = <Player> back = 1
		elseif GotParam \{choose}
			gh5_band_screen_ui_sound player_num = <Player> choose = 1
		endif
		<choose_script> <params> device_num = <device_num>
	endif
endscript

script band_lobby_update_leader_icon 
	printf \{channel = band_lobby
		qs(0x571bcd80)}
	RequireParams \{[
			submenu_index
		]
		all}
	is_leader = 1
	update = 0
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	formatText checksumName = viewport_property_icon_leader_alpha 'viewport_%d_icon_leader_alpha' d = (<submenu_index> + 1)
	begin
	Player = ($<submenu_data>.Player)
	if ($g_net_leader_player_num = <Player>)
		if (<is_leader> = 0)
			is_leader = 1
			update = 1
			band_leader_alpha = 1.0
			lobby_props = {}
			AddParam structure_name = lobby_props Name = <viewport_property_icon_leader_alpha> value = <band_leader_alpha>
		endif
	else
		if (<is_leader> = 1)
			is_leader = 0
			update = 1
			band_leader_alpha = 0.0
			lobby_props = {}
			AddParam structure_name = lobby_props Name = <viewport_property_icon_leader_alpha> value = <band_leader_alpha>
		endif
	endif
	if freestyle_is_active
		band_leader_alpha = 0
	endif
	if (<update> = 1)
		update = 0
		if ScreenElementExists \{id = band_lobby_desc_id}
			se_setprops frame_leader_alpha = <band_leader_alpha>
			band_lobby_desc_id :se_setprops <lobby_props>
		endif
	endif
	Wait ($band_lobby_wait_times.leader_update) Seconds
	repeat
endscript

script band_lobby_update_submenu_instrument 
	printf \{channel = band_lobby
		qs(0x454867f2)}
	RequireParams \{[
			submenu_index
		]
		all}
	if freestyle_is_active
		return
	endif
	current_part = NULL
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	band_lobby_get_player_color viewport = <submenu_index>
	begin
	Player = ($<submenu_data>.Player)
	getplayerinfo <Player> part
	if (<part> != <current_part>)
		current_part = <part>
		formatText checksumName = icon_alias 'alias_instrument_icon_%d' d = (<submenu_index> + 1)
		if ScreenElementExists \{id = band_lobby_desc_id}
			band_lobby_desc_id :desc_resolvealias Name = <icon_alias> param = icon_element_id
			<icon_element_id> :band_lobby_vocals_destroy_icon_update
			<icon_element_id> :Obj_KillSpawnedScript Name = band_lobby_vocals_icon_update
			<icon_element_id> :Obj_KillSpawnedScript Name = band_lobby_controller_connected_update
		endif
		formatText checksumName = instrument_icon_texture 'instrument_icon_%d_texture' d = (<submenu_index> + 1)
		switch <part>
			case guitar
			AddParam structure_name = lobby_props Name = <instrument_icon_texture> value = mixer_icon_guitar
			case bass
			AddParam structure_name = lobby_props Name = <instrument_icon_texture> value = mixer_icon_bass
			case drum
			AddParam structure_name = lobby_props Name = <instrument_icon_texture> value = mixer_icon_drums
			case vocals
			if ScreenElementExists \{id = band_lobby_desc_id}
				<icon_element_id> :Obj_SpawnScriptNow band_lobby_vocals_icon_update params = {submenu_index = <submenu_index>}
			endif
		endswitch
		band_lobby_get_player_color viewport = <submenu_index>
		formatText checksumName = instrument_icon_rgba_prop 'instrument_icon_%d_rgba' d = (<submenu_index> + 1)
		AddParam structure_name = lobby_props Name = <instrument_icon_rgba_prop> value = <rgba_md>
		if ScreenElementExists \{id = band_lobby_desc_id}
			if NOT is_roadie_battle_mode
				<icon_element_id> :obj_spawnscript band_lobby_controller_connected_update params = {submenu_index = <submenu_index>}
			endif
		endif
		band_lobby_get_player_color viewport = <submenu_index>
		formatText checksumName = lobby_player_rgba 'lobby_player_0%d_rgba' d = (<submenu_index> + 1)
		AddParam structure_name = lobby_props Name = <lobby_player_rgba> value = [0 0 0 0]
		if ScreenElementExists \{id = band_lobby_desc_id}
			band_lobby_desc_id :se_setprops <lobby_props>
		endif
	endif
	Wait ($band_lobby_wait_times.instrument_update) Seconds
	repeat
endscript

script band_lobby_update_gamertag 
	printf \{channel = band_lobby
		qs(0x50fbd2d1)}
	RequireParams \{[
			submenu_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	begin
	if NOT freestyle_is_active
		Player = ($<submenu_data>.Player)
		if (($<submenu_data>.occupied) = 1)
			get_fullname_for_player Player = <Player>
			gamertag_text = <fullname>
		else
			getplayerinfo <Player> character_id
			getplayerinfo <Player> character_savegame
			if GotParam \{character_savegame}
				get_fullname_of_character savegame = <character_savegame> id = <character_id> profanity_allowed
				if NOT playerinfoequals <Player> is_local_client = 1
				endif
				gamertag_text = <fullname>
			else
				gamertag_text = qs(0x00000000)
			endif
		endif
		band_lobby_get_player_color viewport = <submenu_index>
		se_setprops {
			gamertag_rgba = <rgba_dk>
			gamertag_text = <gamertag_text>
		}
	else
		band_lobby_get_player_color viewport = <submenu_index>
		se_setprops {
			gamertag_rgba = <rgba_dk>
			gamertag_text = ($0x02b0e892 [<submenu_index>])
		}
	endif
	Wait ($band_lobby_wait_times.gamertag_update) Seconds
	repeat
endscript

script band_lobby_update_career_players 
	printf \{channel = band_lobby
		qs(0xb07ceb35)}
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	band_lobby_return_from_any_popup
	band_lobby_post_matchmaking_player_adjustments
	band_lobby_add_career_joiners_to_submenus
	band_lobby_make_visible_players_mutually_exclusive
	spawn_player_drop_listeners \{drop_player_script = band_lobby_drop_player
		end_game_script = band_lobby_end_game}
	if IsHost
		SendStructure callback = band_lobby_display_final_matchmaking_players_career data_to_send = {player_num = ($g_leader_player_num)}
		band_lobby_display_final_matchmaking_players_career player_num = ($g_leader_player_num)
		if ($g_lobby_net_state = net_private)
			spawnscript \{band_lobby_continue_career}
		endif
	endif
endscript

script band_lobby_make_visible_players_mutually_exclusive 
	printf \{channel = band_lobby
		qs(0xcca217ea)}
	available_player_nums = [1 2 3 4]
	used_submenus = []
	used_player_nums = []
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	if (($<submenu_data>.occupied) = 1)
		AddArrayElement array = <used_submenus> element = 1
		used_submenus = <array>
		AddArrayElement array = <used_player_nums> element = ($<submenu_data>.Player)
		used_player_nums = <array>
	else
		AddArrayElement array = <used_submenus> element = 0
		used_submenus = <array>
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	GetArraySize <used_player_nums> param = used_player_nums_size
	if (<used_player_nums_size> > 0)
		i = 0
		begin
		GetArraySize <available_player_nums> param = available_player_nums_size
		if (<available_player_nums_size> > 0)
			j = 0
			begin
			if ((<used_player_nums> [<i>]) = (<available_player_nums> [<j>]))
				RemoveArrayElement array = <available_player_nums> index = <j>
				available_player_nums = <array>
				break
			endif
			j = (<j> + 1)
			repeat <available_player_nums_size>
		endif
		i = (<i> + 1)
		repeat <used_player_nums_size>
	endif
	GetArraySize <used_submenus> param = used_submenus_size
	if (<used_submenus_size> > 0)
		i = 0
		begin
		if ((<used_submenus> [<i>]) = 0)
			setplayerinfo (<available_player_nums> [0]) controller = <i>
			band_lobby_update_submenu_data submenu_index = <i> element = Player value = (<available_player_nums> [0])
			update_camera_for_viewport viewport_index = <i> Player = (<available_player_nums> [0])
			RemoveArrayElement array = <available_player_nums> index = 0
			available_player_nums = <array>
		endif
		i = (<i> + 1)
		repeat <used_submenus_size>
	endif
endscript

script band_lobby_display_final_matchmaking_players_career 
	printf \{channel = band_lobby
		qs(0xb98d280f)}
	Change g_net_leader_player_num = <player_num>
	Change \{g_career_search = NULL}
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	if (($<submenu_data>.occupied) = 1)
		if playerinfoequals ($<submenu_data>.Player) is_local_client = 1
			band_lobby_add_menu_update_to_queue submenu_index = <i> action = forward focus = 1
		else
			($band_lobby_viewport_menus [<i>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {action = forward menu = remote_player Player = ($<submenu_data>.Player) viewport_index = <i> focus = 0 no_forced}
		endif
	else
		($band_lobby_viewport_menus [<i>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {action = forward menu = empty Player = ($<submenu_data>.Player) viewport_index = <i> focus = 0 no_forced}
	endif
	band_lobby_get_submenu_data viewport_index = <i> param = Player
	($band_lobby_viewport_menus [<i>]) :Obj_SpawnScriptNow check_for_net_appearance_arrival params = {Player = <submenu_data>}
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	band_lobby_update_button_helpers
endscript

script band_lobby_add_career_joiners_to_submenus 
	printf \{channel = band_lobby
		qs(0xcab8c196)}
	getnumplayersingame \{remote}
	if (<num_players> > 0)
		getfirstplayer \{remote
			out = remote_player}
		begin
		remote_player_already_added = 0
		i = 0
		begin
		band_lobby_get_submenu_data_new submenu_index = <i> param = occupied
		band_lobby_get_submenu_data_new submenu_index = <i> param = Player
		if ((<Player> = <remote_player>) && (<occupied> = 1))
			remote_player_already_added = 1
			break
		endif
		i = (<i> + 1)
		repeat ($g_num_lobby_local_submenus)
		if (<remote_player_already_added> = 0)
			band_lobby_find_available_submenu_data
			if NOT (<submenu_data_index> = -1)
				array = []
				getplayerinfo <remote_player> net_id_first
				getplayerinfo <remote_player> net_id_second
				AddArrayElement array = <array> element = <net_id_first>
				AddArrayElement array = <array> element = <net_id_second>
				band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = net_id value = <array>
				band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = Player value = <remote_player>
				band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = occupied value = 1
			else
				ScriptAssert \{qs(0x8af336e1)}
			endif
		endif
		getnextplayer Player = <remote_player> remote out = remote_player
		repeat <num_players>
	endif
endscript

script band_lobby_post_matchmaking_player_adjustments 
	printf \{channel = band_lobby
		qs(0x5023a62f)}
	gamemode_gettype
	found_leader = 0
	set_leader = 0
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	if ((($<submenu_data>.net_id [0]) != 0) && (($<submenu_data>.net_id [1]) != 0) && (($<submenu_data>.occupied) = 1))
		if (($<submenu_data>.Player) = ($g_leader_player_num))
			found_leader = 1
		endif
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			getplayerinfo <Player> net_id_first
			getplayerinfo <Player> net_id_second
			getplayerinfo <Player> gamertag
			if ((<net_id_first> = ($<submenu_data>.net_id [0])) && (<net_id_second> = ($<submenu_data>.net_id [1])))
				if ((isps3) || (isngc))
					submenu_gamertag = ($<submenu_data>.gamertag_checksum)
					if (($<gamertag>) = ($<submenu_gamertag>))
						if (<found_leader> = 1)
							if (<set_leader> = 0)
								<set_leader> = 1
								Change g_leader_player_num = <Player>
							endif
						endif
						if (<Type> = career)
							band_lobby_update_submenu_data submenu_index = <i> element = Player value = <Player>
						endif
						break
					endif
				else
					if (<found_leader> = 1)
						if (<set_leader> = 0)
							<set_leader> = 1
							Change g_leader_player_num = <Player>
						endif
					endif
					if (<Type> = career)
						band_lobby_update_submenu_data submenu_index = <i> element = Player value = <Player>
					endif
					break
				endif
			endif
			getnextplayer Player = <Player>
			repeat <num_players>
		endif
		<found_leader> = 0
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
endscript

script band_lobby_display_final_matchmaking_players 
	printf \{channel = band_lobby
		qs(0xee8125af)}
	Change \{online_song_choice_id = 0}
	band_lobby_post_matchmaking_player_adjustments
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
		band_lobby_create_popup_menu {
			menu = playerslist
			list_type = matchmaking_done
			Player = ($g_leader_player_num)
			container = <resolved_id>
		}
		if IsHost
			Change g_net_leader_player_num = ($g_leader_player_num)
			SendStructure callback = net_set_online_leader_num data_to_send = {player_num = ($g_leader_player_num)}
			choose_random_band_names
		endif
		Wait ($band_lobby_wait_times.net_display_final_players) Seconds
		if gamemode_iscooperative
			band_lobby_continue_menu_change \{state = uistate_songlist}
		elseif gamemode_isteamgame
			if checksumequals a = ($competitive_rules) b = p8_pro_faceoff
				lock_player_parts
			endif
			band_lobby_continue_menu_change \{state = uistate_team_select}
		else
			band_lobby_continue_menu_change \{state = uistate_songlist}
		endif
	endif
endscript

script net_set_online_leader_num 
	Change g_net_leader_player_num = <player_num>
endscript

script band_lobby_return_from_any_popup 
	printf \{channel = band_lobby
		qs(0xc01598ef)}
	if band_lobby_does_popup_exist
		if ScreenElementExists \{id = band_lobby_desc_id}
			band_lobby_desc_id :Obj_SpawnScriptNow \{band_lobby_destroy_popup_menu
				params = {
					no_focus
				}}
		endif
	endif
	ui_event_get_stack
	if ((<stack> [0].base_name) != 'band_lobby')
		ui_event \{event = menu_back}
	endif
endscript

script band_lobby_proceed_to_voting_popup 
	RequireParams \{[
			voting_items_array
		]
		all}
	printf \{channel = band_lobby
		qs(0x344cae80)}
	if ScreenElementExists \{id = band_lobby_desc_id}
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
			band_lobby_create_popup_menu {
				menu = generic_vote
				Player = ($g_leader_player_num)
				container = <resolved_id>
				voting_items_array = <voting_items_array>
			}
		endif
	endif
endscript

script band_lobby_display_matchmaking_progress_ui 
	RequireParams \{[
			Player
			private
		]
		all}
	printf channel = band_lobby qs(0x69032f99) c = <Player>
	if ($g_lobby_state = career)
		objID = band_lobby_desc_id
		GetArraySize ($band_lobby_viewport_menus)
		i = 0
		begin
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <i>
		if (($<submenu_data>.occupied) = 0)
			if ScreenElementExists id = ($band_lobby_viewport_menus [<i>])
				if (<private> = 1)
					menu = empty
				else
					menu = searching
				endif
				($band_lobby_viewport_menus [<i>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {menu = <menu> action = forward Player = ($<submenu_data>.Player) viewport_index = <i> focus = 0 no_forced}
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
	else
		objID = current_band_lobby_popup
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
			band_lobby_create_popup_menu {
				menu = playerslist
				Player = <Player>
				container = <resolved_id>
				list_type = matchmaking
			}
		endif
	endif
	if ScreenElementExists id = <objID>
		<objID> :Obj_SpawnScriptNow band_lobby_matchmaking_update_loop
	endif
endscript

script band_lobby_change_focus_submenu_all 
	printf \{channel = band_lobby
		qs(0xc58ca1b1)}
	RequireParams \{[
			focus_type
		]
		all}
	if band_lobby_does_popup_exist
		if ScreenElementExists \{id = band_lobby_popup_menu}
			LaunchEvent Type = <focus_type> target = band_lobby_popup_menu
		endif
	else
		i = 0
		j = 0
		begin
		if ScreenElementExists id = ($band_lobby_viewport_menus [<i>])
			formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <i>
			if NOT GotParam \{skip_index_array}
				if (($<submenu_data>.is_updating) = 1)
					band_lobby_update_submenu_data submenu_index = <i> element = focus_type value = <focus_type>
				else
					LaunchEvent Type = <focus_type> target = ($band_lobby_viewport_menus [<i>])
				endif
			elseif ((<skip_index_array> [<j>]) = <i>)
				GetArraySize \{skip_index_array}
				if ((<j> + 1) < <array_Size>)
					j = (<j> + 1)
				endif
			else
				if (($<submenu_data>.is_updating) = 1)
					band_lobby_update_submenu_data submenu_index = <i> element = focus_type value = <focus_type>
				else
					LaunchEvent Type = <focus_type> target = ($band_lobby_viewport_menus [<i>])
				endif
			endif
		endif
		i = (<i> + 1)
		repeat ($g_num_lobby_local_submenus)
	endif
endscript

script band_lobby_get_player_color 
	RequireParams \{[
			viewport
		]
		all}
	if NOT freestyle_is_active
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <viewport>
		if (($<submenu_data>.occupied) = 0)
			return rgba_lt = ($uicolorref_palette.gh5_blue_lt.rgba) rgba_md = ($uicolorref_palette.gh5_blue_lt.rgba) rgba_dk = ($uicolorref_palette.gh5_blue_dk.rgba) rgba_xdk = ($uicolorref_palette.p1_xdk.rgba)
		else
			switch <viewport>
				case 0
				return rgba_lt = ($uicolorref_palette.p1_lt.rgba) rgba_md = ($uicolorref_palette.p1_md.rgba) rgba_dk = ($uicolorref_palette.p1_dk.rgba) rgba_xdk = ($uicolorref_palette.p1_xdk.rgba)
				case 1
				return rgba_lt = ($uicolorref_palette.p2_lt.rgba) rgba_md = ($uicolorref_palette.p2_md.rgba) rgba_dk = ($uicolorref_palette.p2_dk.rgba) rgba_xdk = ($uicolorref_palette.p2_xdk.rgba)
				case 2
				return rgba_lt = ($uicolorref_palette.p3_lt.rgba) rgba_md = ($uicolorref_palette.p3_md.rgba) rgba_dk = ($uicolorref_palette.p3_dk.rgba) rgba_xdk = ($uicolorref_palette.p3_xdk.rgba)
				case 3
				return rgba_lt = ($uicolorref_palette.p4_lt.rgba) rgba_md = ($uicolorref_palette.p4_md.rgba) rgba_dk = ($uicolorref_palette.p4_dk.rgba) rgba_xdk = ($uicolorref_palette.p4_xdk.rgba)
				default
				return \{rgba = [
						255
						255
						255
						0
					]
					icon_rgba = [
						255
						255
						255
						0
					]
					bg_rgba = [
						255
						255
						255
						0
					]}
			endswitch
		endif
	else
		if (($freestyle_band_lobby_player_states [<viewport>]) = not_joined)
			return rgba_lt = ($uicolorref_palette.gh5_blue_lt.rgba) rgba_md = ($uicolorref_palette.gh5_blue_lt.rgba) rgba_dk = ($uicolorref_palette.gh5_blue_dk.rgba) rgba_xdk = ($uicolorref_palette.p1_xdk.rgba)
		else
			return rgba_lt = ($freestyle_band_lobby_viewport_colors [<viewport>]) rgba_md = ($freestyle_band_lobby_viewport_colors [<viewport>]) rgba_dk = ($freestyle_band_lobby_viewport_colors [<viewport>]) rgba_xdk = ($freestyle_band_lobby_viewport_colors [<viewport>])
		endif
	endif
endscript

script band_lobby_manage_band_members 
	RequireParams \{[
			Player
			viewport_index
			action
		]
		all}
	printf channel = band_lobby qs(0xa4d3381d) d = <viewport_index> c = <Player>
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
		LaunchEvent Type = unfocus target = ($band_lobby_viewport_menus [<viewport_index>])
		band_lobby_get_player_submenu_index player_num = ($g_leader_player_num)
		getplayerinfo ($g_leader_player_num) controller
		<resolved_id> :se_setprops {
			exclusive_device = <controller>
			event_handlers = [
				{pad_back band_lobby_band_memebers_back params = {viewport_index = <submenu_index>}}
				{pad_up gh5_band_screen_ui_sound params = {player_num = <Player> up = 1}}
				{pad_down gh5_band_screen_ui_sound params = {player_num = <Player> down = 1}}
				{pad_back gh5_band_screen_ui_sound params = {player_num = <Player> back = 1}}
				{pad_right gh5_band_screen_ui_sound params = {player_num = <Player> up = 1}}
				{pad_left gh5_band_screen_ui_sound params = {player_num = <Player> down = 1}}
			]
			replace_handlers
		}
		band_lobby_set_exclusive_devices_on_submenus controller = <controller>
		<resolved_id> :SetTags managing = 1
		LaunchEvent Type = focus target = <resolved_id> data = {child_index = <viewport_index>}
		if (<action> = deselect)
			band_lobby_update_submenu_data submenu_index = <viewport_index> element = is_managed value = 0
			formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
			persistent_band_get_index_from_player Player = <Player>
			if (($persistent_band_data [<index>].building) = 0)
				band_lobby_unmask_viewport viewport_index = <viewport_index>
			endif
			0x9217bffa = <submenu_data>
			band_lobby_get_submenu_data viewport_index = <viewport_index> param = occupied
			occupied = <submenu_data>
			<submenu_data> = <0x9217bffa>
			if (<occupied> = 1)
				band_lobby_get_player_color viewport = <viewport_index>
				($<submenu_data>.desc_id) :se_setprops lobby_frame_sm_rgba = <rgba_lt> time = 0.2
			endif
			array = ($<submenu_data>.menu_indices)
			SetArrayElement \{ArrayName = array
				index = 0
				NewValue = 0}
			SetArrayElement \{ArrayName = array
				index = 1
				NewValue = 0}
			SetArrayElement \{ArrayName = array
				index = 2
				NewValue = 0}
			band_lobby_update_submenu_data submenu_index = <viewport_index> element = menu_indices value = <array>
			band_lobby_change_menu action = back menu = ($<submenu_data>.return_menu) Player = <Player> viewport_index = <viewport_index>
		endif
		band_lobby_update_button_helpers
	endif
endscript

script band_lobby_band_memebers_back 
	printf \{channel = band_lobby
		qs(0x6548e6b3)}
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
		<resolved_id> :SetTags managing = 0
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		LaunchEvent Type = unfocus target = <resolved_id>
		band_lobby_change_focus_submenu_all \{focus_type = focus}
		band_lobby_update_button_helpers
	endif
endscript

script band_lobby_kick_leader_out_of_band_manage 
	printf \{qs(0xd02aee4b)}
	if band_lobby_has_managed_submenu
		printf \{qs(0x04fea79a)}
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <managed_submenu>
		band_lobby_manage_band_members action = deselect Player = ($<submenu_data>.Player) viewport_index = <managed_submenu>
	endif
	if ScreenElementExists \{id = band_lobby_desc_id}
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
			printf \{qs(0x946eaeb8)}
			if <resolved_id> :GetSingleTag managing
				if (<managing> = 1)
					printf \{qs(0x7b12c908)}
					get_submenu_index_from_player Player = ($g_leader_player_num)
					band_lobby_band_memebers_back viewport_index = <submenu_index>
					band_lobby_add_menu_update_to_queue submenu_index = <submenu_index> action = forward focus = 1
				endif
			else
				printf \{qs(0x9ddaf782)}
			endif
		endif
	endif
	printf \{qs(0xaf2b11bb)}
endscript

script band_lobby_forced_lefty_flip_back 
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	if is_roadie_battle_mode
		band_lobby_leave Player = <Player> viewport_index = <viewport_index>
	else
		if ($allow_controller_for_all_instruments = 1)
			formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
			getplayerinfo ($<submenu_data>.Player) part
			switch (<part>)
				case guitar
				case bass
				band_lobby_change_menu action = back menu = forced_instruments Player = <Player> viewport_index = <viewport_index> no_forced
				case drum
				case vocals
				band_lobby_leave_forced_flow Player = <Player> viewport_index = <viewport_index>
			endswitch
		elseif band_lobby_isguitarcontroller Player = <Player> viewport_index = <viewport_index>
			band_lobby_change_menu action = back menu = forced_instruments Player = <Player> viewport_index = <viewport_index> no_forced
		else
			band_lobby_leave_forced_flow Player = <Player> viewport_index = <viewport_index>
		endif
	endif
endscript

script band_lobby_forced_difficulty_back 
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	if ($allow_controller_for_all_instruments = 1)
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
		getplayerinfo ($<submenu_data>.Player) part
		switch (<part>)
			case guitar
			case bass
			case drum
			band_lobby_change_menu action = back menu = forced_lefty_flip Player = <Player> viewport_index = <viewport_index> no_forced
			case vocals
			band_lobby_vocals_forced_menu Player = <Player> action = back previous_menu = forced_difficulty viewport_index = <viewport_index>
		endswitch
	elseif band_lobby_check_is_guitar_or_drum_controller Player = <Player> viewport_index = <viewport_index>
		if is_roadie_battle_mode
			band_lobby_change_menu action = back menu = roadie_battle_forced_lefty_flip Player = <Player> viewport_index = <viewport_index> no_forced
		else
			band_lobby_change_menu action = back menu = forced_lefty_flip Player = <Player> viewport_index = <viewport_index> no_forced
		endif
	elseif band_lobby_isvocalscontroller Player = <Player> viewport_index = <viewport_index>
		band_lobby_vocals_forced_menu Player = <Player> action = back previous_menu = forced_difficulty viewport_index = <viewport_index>
	else
		ScriptAssert \{qs(0xd0b915fb)}
	endif
endscript

script band_lobby_vocals_forced_menu 
	RequireParams \{[
			Player
			action
			viewport_index
			previous_menu
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	if band_lobby_should_show_mic_preference Player = ($<submenu_data>.Player)
		show_mic_preference = true
	else
		show_mic_preference = FALSE
	endif
	if band_lobby_should_force_highway_view Player = ($<submenu_data>.Player)
		show_highway_view = true
	else
		show_highway_view = FALSE
	endif
	menu = NULL
	if (<action> = forward)
		switch <previous_menu>
			case forced_mic_preference
			if (<show_highway_view> = true)
				menu = forced_vocal_highway
			else
				menu = forced_difficulty
			endif
			case forced_vocal_highway
			menu = forced_difficulty
		endswitch
	else
		switch <previous_menu>
			case forced_difficulty
			if (<show_highway_view> = true)
				menu = forced_vocal_highway
			elseif (<show_mic_preference> = true)
				menu = forced_mic_preference
			else
				band_lobby_leave_forced_flow Player = <Player> viewport_index = <viewport_index>
				return
			endif
			case forced_vocal_highway
			if (<show_mic_preference> = true)
				menu = forced_mic_preference
			else
				band_lobby_leave_forced_flow Player = <Player> viewport_index = <viewport_index>
				return
			endif
		endswitch
	endif
	if (<menu> = NULL)
		SoftAssert \{qs(0x1dc71b34)}
	endif
	band_lobby_change_menu action = <action> menu = <menu> Player = <Player> viewport_index = <viewport_index> no_forced
endscript

script band_lobby_forced_vocal_highway_back 
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	band_lobby_change_menu action = back menu = forced_mic_preference Player = <Player> viewport_index = <viewport_index> no_forced
endscript
careerlevelzonearray = [
	0x39914645
	load_z_montreux
	load_z_cabo
	load_z_centralpark
	load_z_tokyo
	load_z_easterisland
	0xa72a91a6
	load_z_gorge
	load_z_paris
	0x8362270b
	load_z_cube
	load_z_visualizer
	load_z_vvstudio
]

script band_lobby_build_select_venue_submenu 
	printf \{channel = band_lobby
		qs(0xdee4a4c9)}
	getplayerinfo ($g_leader_player_num) controller
	get_savegame_from_controller controller = <controller>
	submenu_states = $band_lobby_submenu_states
	array = []
	GetArraySize \{$careerlevelzonearray}
	array_count = 0
	begin
	level_checksum = ($careerlevelzonearray [<array_count>])
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		formatText checksumName = load_venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name)
		GetGlobalTags savegame = <savegame> <load_venue_checksum>
		if (<unlocked> = 1)
			AddArrayElement {
				array = <array>
				element = {
					text = ($LevelZones.<level_checksum>.title)
					checksum = <level_checksum>
					choose_script = band_lobby_change_global
					select_params = {
						Global = g_band_lobby_current_level
						value = <level_checksum>
						action = back
						menu = main
						Player = <Player>
						viewport_index = <viewport_index>
					}
				}
			}
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_Size>
	venue_options = {
		(<submenu_states>.select_venue)
		options = <array>
		focus_param = venue
		back_script = band_lobby_change_menu
		back_params = {
			menu = main
			action = back
			Player = <Player>
			viewport_index = <viewport_index>
		}
	}
	<submenu_states> = {<submenu_states> select_venue = <venue_options>}
	Change band_lobby_submenu_states = <submenu_states>
	band_lobby_change_menu action = forward menu = select_venue Player = <Player> viewport_index = <viewport_index>
endscript

script band_lobby_select_band_member 
	RequireParams \{[
			viewport_index
		]
		all}
	printf channel = band_lobby qs(0x2e8a79dd) c = <viewport_index>
	band_lobby_get_player_submenu_index player_num = ($g_leader_player_num)
	formatText checksumName = managing_submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	if (<submenu_index> = <viewport_index>)
		gh5_band_screen_ui_sound player_num = ($g_leader_player_num) back = 1
		band_lobby_band_memebers_back viewport_index = <submenu_index>
	else
		can_manage = 0
		forced_flow = 0
		return_menu = main
		if (($<submenu_data>.occupied) = 0)
			can_manage = 1
			managed_menu = manage_member
			return_menu = join
		else
			if playerinfoequals ($<submenu_data>.Player) is_local_client = 1
				switch ($<submenu_data>.menu)
					case forced_difficulty
					case forced_instruments
					case forced_vocal_highway
					case forced_mic_preference
					case forced_lefty_flip
					can_manage = 1
					<forced_flow> = 1
					managed_menu = ($<submenu_data>.menu)
					case mc_checking
					case mc_loading
					case mc_saving
					case mc_dlc_scan
					gh5_band_screen_ui_sound player_num = ($g_leader_player_num) error = 1
					return
					default
					can_manage = 1
					managed_menu = manage_member
				endswitch
			endif
		endif
		printstruct {} a = $<submenu_data>
		if (<can_manage> = 1)
			gh5_band_screen_ui_sound player_num = ($g_leader_player_num) choose = 1
			if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
				band_lobby_change_focus_submenu_all \{focus_type = unfocus}
				LaunchEvent Type = unfocus target = <resolved_id>
				array = []
				if (<submenu_index> < <viewport_index>)
					AddArrayElement array = <array> element = <submenu_index>
					AddArrayElement array = <array> element = <viewport_index>
				else
					AddArrayElement array = <array> element = <viewport_index>
					AddArrayElement array = <array> element = <submenu_index>
				endif
				band_lobby_change_focus_submenu_all focus_type = focus skip_index_array = <array>
				band_lobby_update_submenu_data submenu_index = <viewport_index> element = is_managed value = 1
				persistent_band_get_index_from_player Player = ($<submenu_data>.Player)
				if (($persistent_band_data [<index>].building) = 0)
					band_lobby_unmask_viewport viewport_index = <viewport_index>
				endif
				if band_lobby_get_forced_menu viewport_index = <viewport_index>
					band_lobby_update_submenu_data submenu_index = <viewport_index> element = return_menu value = <forced_menu>
				else
					band_lobby_update_submenu_data submenu_index = <viewport_index> element = return_menu value = <return_menu>
				endif
				setplayerinfo ($<submenu_data>.Player) chosen_character_id = None
				setplayerinfo ($<submenu_data>.Player) chosen_character_savegame = -1
				band_lobby_refresh_band_leader_characters \{no_refresh}
				persistent_band_refresh_changed_characters
				if (<forced_flow> = 1)
					band_lobby_change_menu action = forward menu = <managed_menu> Player = ($<managing_submenu_data>.Player) viewport_index = <viewport_index> no_forced
				else
					band_lobby_change_menu action = forward menu = <managed_menu> Player = ($<managing_submenu_data>.Player) viewport_index = <viewport_index>
				endif
			endif
		endif
		band_lobby_update_button_helpers
	endif
endscript

script band_lobby_game_rules 
	RequireParams \{[
			Player
		]
		all}
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
		band_lobby_create_popup_menu {
			menu = game_rules
			Player = <Player>
			container = <resolved_id>
		}
	endif
endscript

script band_lobby_friendslist 
	printf \{channel = band_lobby
		qs(0xc9b42674)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	if ($g_career_search != NULL)
		return
	endif
	can_continue = 0
	online = 0
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
		getplayerinfo <Player> controller
		if ((CheckForSignIn controller_index = <controller> dont_set_primary) && (NetSessionFunc func = is_lobby_available))
			if isxenonorwindx
				if NOT NetSessionFunc func = xenonisguest params = {controller_index = <controller>}
					can_continue = 1
				endif
			elseif ((isps3) || (isngc))
				if iswiiconnect24ok
					can_continue = 1
					<online> = 1
				else
					show_nwc24_error {
						unfocus_script = band_lobby_change_focus_submenu_all
						unfocus_params = {focus_type = unfocus}
						continue_script = band_lobby_return_from_error
						error_code = <error_code>
						error_checksum = <error_checksum>
					}
				endif
			endif
		elseif NetSessionFunc \{Obj = friends
				func = offline_friends_are_ok}
			can_continue = 1
		else
			show_last_connection_error \{unfocus_script = band_lobby_change_focus_submenu_all
				unfocus_params = {
					focus_type = unfocus
				}
				continue_script = band_lobby_return_from_error}
		endif
	endif
	if (<can_continue> = 1)
		show_error = 0
		if (<online> = 1)
			if NOT NetSessionFunc \{func = can_view_user_content
					params = {
						set_explicit_error_code
					}}
				<online> = 0
				<show_error> = 1
			endif
		endif
		if (<show_error> = 1)
			show_last_connection_error {
				unfocus_script = band_lobby_change_focus_submenu_all
				unfocus_params = {focus_type = unfocus}
				continue_script = band_lobby_continue_to_friendslist
				continue_params = {
					container = <resolved_id>
					Player = <Player>
					controller = <controller>
					online = <online>
					viewport_index = <viewport_index>
					reset = <show_error>
				}
			}
		else
			gh5_band_screen_ui_sound player_num = <Player> choose = 1
			NetSessionFunc {
				Obj = friends
				func = begin_retrieve_friends_list
				params = {
					callback = band_lobby_friendslist_callback
					device_num = <controller>
					callback_params = {
						submenu_index = <viewport_index>
					}
				}
			}
			Change \{g_friendlist_ready_for_refresh = 0}
			if ((isXenon) || (<online> = 0))
				band_lobby_really_create_friendslist container = <resolved_id> Player = <Player> controller = <controller> online = <online> viewport_index = <viewport_index>
			else
				band_lobby_pre_create_friendslist container = <resolved_id> Player = <Player> controller = <controller> online = <online> viewport_index = <viewport_index>
			endif
		endif
	endif
endscript

script band_lobby_really_create_friendslist 
	printf \{qs(0x2d3890e6)}
	RequireParams \{[
			viewport_index
		]
		all}
	band_lobby_create_popup_menu {
		menu = friendslist
		Player = <Player>
		container = <container>
		online = <online>
		viewport_index = <viewport_index>
	}
endscript

script band_lobby_pre_create_friendslist 
	printf \{qs(0xc2de23e7)}
	RequireParams \{[
			viewport_index
		]
		all}
	band_lobby_seamless_net_change {
		network = net_private
		Player = <Player>
		callback = band_lobby_really_create_friendslist
		callback_params = {
			Player = <Player>
			container = <container>
			online = <online>
			viewport_index = <viewport_index>
		}
		from_friendslist
	}
endscript

script band_lobby_players 
	printf \{channel = band_lobby
		qs(0x05243124)}
	RequireParams \{[
			Player
		]
		all}
	if ($g_career_search != NULL)
		return
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
		gh5_band_screen_ui_sound player_num = <Player> choose = 1
		band_lobby_create_popup_menu {
			menu = playerslist
			Player = <Player>
			container = <resolved_id>
		}
	endif
endscript

script band_lobby_matchmaking_update_loop 
	printf \{channel = band_lobby
		qs(0x2c2dd979)}
	gamemode_gettype
	NetSessionFunc \{Obj = party
		func = get_party_members}
	GetArraySize \{connections}
	current_num_players_in_party = <array_Size>
	current_num_matchmaking_players = <array_Size>
	if (<Type> = career)
		array = []
		i = 0
		begin
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <i>
		if (($<submenu_data>.occupied) = 0)
			AddArrayElement array = <array> element = <i>
		endif
		i = (<i> + 1)
		repeat ($g_num_lobby_local_submenus)
	endif
	begin
	if NetSessionFunc \{Obj = match
			func = get_num_matchmaking_players}
		if (<num_matchmaking_players> > 0)
			NetSessionFunc \{Obj = party
				func = get_party_members}
			GetArraySize \{connections}
			if (<array_Size> < <current_num_players_in_party>)
				band_lobby_remove_party_member_ui_from_matchmaking current_num_players_in_party = <current_num_players_in_party>
			endif
			if (<array_Size> > <num_matchmaking_players>)
				num_matchmaking_players = <array_Size>
			endif
			num_players_to_update = (<num_matchmaking_players> - <current_num_matchmaking_players>)
			if (<num_players_to_update> != 0)
				if (<num_players_to_update> < 0)
					update = remove
					num_players_to_update = ((-1) * <num_players_to_update>)
				else
					update = add
				endif
				begin
				if (<Type> = career)
					band_lobby_update_searching_player_ui update = <update> submenu_indices = <array>
				else
					if ScreenElementExists \{id = band_lobby_popup_menu}
						band_lobby_update_popup_player_ui update = <update> player_index = (-1) parent_id = band_lobby_popup_menu
					endif
				endif
				repeat <num_players_to_update>
				current_num_matchmaking_players = <num_matchmaking_players>
			endif
		endif
	endif
	Wait \{1
		Second}
	repeat
endscript

script band_lobby_remove_party_member_ui_from_matchmaking 
	RequireParams \{[
			current_num_players_in_party
		]
		all}
	printf \{channel = band_lobby
		qs(0xf1f8371c)}
	gamemode_gettype
	getnumplayersingame
	if (<num_players> > 0)
		getfirstplayer
		begin
		if NOT band_lobby_is_player_party_member player_num = <Player>
			if (<Type> = career)
				band_lobby_get_player_submenu_index player_num = <Player> occupied
				if (<submenu_index> != -1)
					band_lobby_update_submenu_data submenu_index = <submenu_index> element = occupied value = 0
					band_lobby_change_menu menu = searching action = back Player = <Player> viewport_index = <submenu_index> focus = 0
				endif
			else
				if ScreenElementExists \{id = band_lobby_popup_menu}
					band_lobby_remove_player_ui_from_popup player_index = <Player> parent_id = band_lobby_popup_menu
				endif
			endif
		endif
		getnextplayer Player = <Player>
		repeat <num_players>
		current_num_players_in_party = <array_Size>
	endif
	current_num_players_in_party = <current_num_players_in_party>
endscript

script band_lobby_update_searching_player_ui 
	RequireParams \{[
			update
			submenu_indices
		]
		all}
	printf \{channel = band_lobby
		qs(0x43b99ab0)}
	if (<update> = add)
		current_menu = searching
		new_menu = found_player
		action = forward
	elseif (<update> = remove)
		current_menu = found_player
		new_menu = searching
		action = back
	endif
	GetArraySize \{submenu_indices}
	if (<array_Size> > 0)
		i = 0
		begin
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = (<submenu_indices> [<i>])
		if (($<submenu_data>.menu) = <current_menu>)
			band_lobby_change_menu menu = <new_menu> action = <action> Player = ($<submenu_data>.Player) viewport_index = (<submenu_indices> [<i>]) focus = 0
			break
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script band_lobby_get_num_menu_options 
	RequireParams \{[
			Player
			submenu_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	size = 0
	index = 0
	menu = ($<submenu_data>.menu)
	menu_options = ($band_lobby_submenu_states.<menu>.options)
	GetArraySize <menu_options>
	if (<array_Size> > 0)
		begin
		<option> = ($band_lobby_submenu_states.<menu>.options [<index>])
		if StructureContains structure = <option> condition
			<condition> = (<option>.condition)
			if StructureContains structure = <option> condition_params
				params = (<option>.condition_params)
			endif
			if <condition> Player = <Player> viewport_index = <submenu_index> <params>
				<size> = (<size> + 1)
			endif
		else
			<size> = (<size> + 1)
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
	endif
	return num_options = <size>
endscript

script band_lobby_searching_timeout 
	printf \{qs(0x49c69245)}
	show_dialog = 1
	begin
	if NetSessionFunc \{Obj = match
			func = has_found_players}
		NetSessionFunc \{Obj = match
			func = get_num_matchmaking_players}
		NetSessionFunc \{Obj = party
			func = get_party_members}
		GetArraySize <connections>
		if (<array_Size> > 1)
			if NOT NetSessionFunc \{Obj = party
					func = is_host}
				show_dialog = 0
				break
			endif
		endif
		if (<num_matchmaking_players> > <array_Size>)
			show_dialog = 0
			break
		endif
	endif
	Wait \{1
		Second}
	repeat ($net_matchmaking_timeout)
	printf \{qs(0x3ae32b0b)}
	if (<show_dialog> = 1)
		if ScreenElementExists \{id = matchmaking_difficulty_loosen_menu}
			destroy_dialog_box
		endif
		if ScreenElementExists \{id = dialog_box_container}
			printf \{qs(0x6e40243e)}
			return
		endif
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		create_dialog_box {
			dlg_z_priority = 1100
			heading_text = qs(0x92fadeaa)
			body_text = qs(0xb17da010)
			parent = root_window
			no_background
			options = [
				{
					func = net_matchmaking_searching_timeout_cleanup
					text = qs(0x182f0173)
				}
				{
					func = net_matchmaking_searching_timout_cancel
					text = qs(0x19ca33a5)
				}
			]
			player_device = <controller>
		}
		AssignAlias id = <menu_id> alias = matchmaking_timeout_menu
		LaunchEvent \{Type = focus
			target = matchmaking_timeout_menu}
		RunScriptOnScreenElement \{id = matchmaking_timeout_menu
			net_matchmaking_searching_timeout_late_found_players}
	endif
endscript

script net_matchmaking_searching_timeout_cleanup 
	printf \{qs(0x3168ce91)}
	if ScreenElementExists \{id = matchmaking_timeout_menu}
		destroy_dialog_box
	endif
	if NOT user_control_helper_exists \{button = gamertag}
		add_gamertag_helper exclusive_device = <device_num>
	endif
	band_lobby_update_button_helpers \{menu = matchmaking}
	band_lobby_change_focus_submenu_all \{focus_type = focus}
endscript

script net_matchmaking_searching_timout_cancel 
	printf \{qs(0xebf001b3)}
	if ScreenElementExists \{id = matchmaking_timeout_menu}
		destroy_dialog_box
	endif
	band_lobby_cancel_matchmaking
endscript

script net_matchmaking_searching_timeout_late_found_players 
	printf \{qs(0xcf115662)}
	begin
	if NetSessionFunc \{Obj = match
			func = has_found_players}
		NetSessionFunc \{Obj = match
			func = get_num_matchmaking_players}
		NetSessionFunc \{Obj = party
			func = get_party_members}
		GetArraySize <connections>
		if (<num_matchmaking_players> > <array_Size>)
			net_matchmaking_searching_timeout_cleanup
			break
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script band_lobby_searching_update 
	printf \{qs(0xd609d762)}
	gh5_band_screen_ui_sound player_num = <Player> choose = 1
	begin
	if ScreenElementExists \{id = current_band_lobby_popup}
		band_lobby_searching_update_screen
	else
		break
	endif
	Wait \{0.5
		Seconds}
	repeat
endscript

script band_lobby_searching_update_screen 
	printf \{qs(0x9a329dd3)}
	NetSessionFunc \{Obj = match
		func = get_matchmaking_status}
	<show_time> = 0
	if GotParam \{matchmaking_remaining_time}
		if (<matchmaking_remaining_time> > 0)
			if (<matchmaking_remaining_time> < 15)
				<show_time> = 1
			endif
		endif
	endif
	if (<show_time> = 1)
		formatText TextName = countdown_text ($band_lobby_strings.popup_game_will_start) d = <matchmaking_remaining_time>
		current_band_lobby_popup :se_setprops {
			pu_helper_msg_2_text = <countdown_text>
			pu_helper_msg_2_alpha = 1
		}
	else
		current_band_lobby_popup :se_setprops \{pu_helper_msg_2_text = qs(0x00000000)
			pu_helper_msg_2_alpha = 0}
	endif
	if GotParam \{state}
		if checksumequals a = ehosting b = <state>
			state_text = ($band_lobby_strings.popup_wait_for_additional)
		elseif checksumequals a = eidle b = <state>
			state_text = ($band_lobby_strings.popup_wait_for_additional)
		else
			printstruct <...>
			state_text = ($band_lobby_strings.popup_search_for_game)
		endif
		current_band_lobby_popup :se_setprops pu_helper_msg_text = <state_text>
	else
		current_band_lobby_popup :se_setprops \{pu_helper_msg_text = qs(0x00000000)}
	endif
endscript

script band_lobby_has_managed_submenu 
	i = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	if (($<submenu_data>.is_managed) = 1)
		return true managed_submenu = <i>
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	return \{FALSE}
endscript

script band_lobby_watchdog_all_player_appearance_change 
	playercharacteridarray = []
	i = 1
	begin
	getplayerinfo <i> character_id
	item = {character_id = <character_id>}
	AddArrayElement array = <playercharacteridarray> element = <item>
	<playercharacteridarray> = <array>
	i = (<i> + 1)
	repeat 4
	begin
	printf \{qs(0x432cafa0)}
	if InNetGame
		gamemode_gettype
		if (<Type> = career)
			i = 1
			getnumplayersingame \{local}
			if (<num_players> > 0)
				getfirstplayer \{local}
				begin
				getplayerinfo <Player> character_id
				if NOT (<playercharacteridarray> [<Player> - 1].character_id = (<character_id>))
					if sendplayerappearancedata Player = <Player>
						SetArrayElement ArrayName = playercharacteridarray index = (<Player> -1) NewValue = {character_id = <character_id>}
						printf qs(0xd99aa37c) p = <i> i = <character_id>
					endif
				endif
				getnextplayer Player = <Player> local
				repeat <num_players>
			endif
		endif
	else
		break
	endif
	Wait \{2.0
		Seconds}
	repeat
endscript

script band_lobby_inviteslist 
	printf \{channel = band_lobby
		qs(0x93f76d85)}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
		getplayerinfo <Player> controller
		if CheckForSignIn controller_index = <controller> dont_set_primary network_platform_only
			band_lobby_create_popup_menu {
				menu = inviteslist
				Player = <Player>
				container = <resolved_id>
				viewport_index = <viewport_index>
			}
			NetSessionFunc \{Obj = friends
				func = get_invite_list
				params = {
					callback = band_lobby_inviteslist_callback
				}}
		endif
	endif
endscript

script band_lobby_continue_to_friendslist 
	band_lobby_return_from_error
	band_lobby_really_create_friendslist <...>
	gh5_band_screen_ui_sound player_num = <Player> choose = 1
	NetSessionFunc {
		Obj = friends
		func = begin_retrieve_friends_list
		params = {
			callback = band_lobby_friendslist_callback
			device_num = <controller>
			callback_params = {
				submenu_index = <viewport_index>
			}
		}
	}
	Change \{g_friendlist_ready_for_refresh = 0}
endscript
