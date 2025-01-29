
script band_lobby_setup_cameras 
	printf \{channel = band_lobby
		qs(0x6546bdc0)}
	if ScriptExists \{z_credits_ampzilla_stopanimate}
		z_credits_ampzilla_stopanimate
	endif
	audio_ui_menu_music_on
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
			if CheckForSignIn controller_index = <controller> dont_set_primary
				if ($g_career_search = NULL)
					if NOT InNetGame
						if isps3
							if NetSessionFunc \{Obj = party
									func = is_party_session_available}
								add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_invite) button = green z = 100000
							endif
						else
							add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_invite) button = green z = 100000
						endif
					endif
				endif
			endif
			if isxenonorwindx
				if NetSessionFunc func = canviewprofile controller_index = <controller>
					add_user_control_helper text = ($band_lobby_strings.button_player_card) button = yellow z = 100000
				endif
			elseif isps3
				if NetSessionFunc \{func = isoldenoughforonline}
					if NOT InNetGame
						if ($g_career_search = NULL)
							add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_display_invtes) button = yellow z = 100000
						endif
					endif
				endif
			endif
			if ScreenElementExists \{id = band_lobby_popup_menu}
				if GetScreenElementChildren \{id = band_lobby_popup_menu}
					band_lobby_popup_menu :menu_getselectedindex
					if GotParam \{children}
						GetArraySize <children>
						if (<array_Size> > <selected_index>)
							(<children> [<selected_index>]) :band_lobby_popup_begin_polling_for_rock_record controlling_player = <Player>
						endif
					endif
				endif
			endif
			if isxenonorwindx
				if NOT InNetGame
					NetSessionFunc \{Obj = plat_party
						func = get_num_party_players}
					if (<num_plat_party_players> = 0)
					else
						add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_invite_plat_party) button = orange z = 100000
					endif
				endif
			endif
			case leave_lobby
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_select) button = green z = 100000
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			case game_rules
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_select) button = green z = 100000
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			add_user_control_helper controller = <controller> text = qs(0x9c8312f4) button = blue z = 100000
			case error_msg
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
			endif
			getnumplayersingame \{local}
			has_managed = 0
			if band_lobby_has_managed_submenu
				has_managed = 1
			endif
			if demobuild
				add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_play) button = start z = 100000
			else
				if (<managing> = 0 || (<managing> = 1 && <num_players> != 1) || <has_managed> = 1)
					add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_friends) button = yellow z = 100000
					add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_players) button = blue z = 100000
				endif
				if (<managing> = 0)
					getnumplayersingame
					if ininternetmode
						if ($g_career_search = NULL)
							if NOT InNetGame
								if NetSessionFunc \{Obj = party
										func = is_host}
									if bl_should_display_challenge_shortcut
										add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_cancel_challenge) button = orange z = 100000
									else
										add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_search) button = orange z = 100000
									endif
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
					else
						if bl_should_display_challenge_shortcut
							add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_cancel_challenge) button = orange z = 100000
						else
							add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_search) button = orange z = 100000
						endif
						add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_play) button = start z = 100000
					endif
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
		gman_quickremovegoal \{goal_name = career}
	endif
	if (GMan_GoalIsActive goal = quickplay)
		gman_quickremovegoal \{goal_name = quickplay}
	endif
	songlist_clear_playlist
	generic_event_back \{state = uistate_mainmenu}
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
	band_lobby_get_player_color submenu_index = <i>
	if ScreenElementExists id = <desc_id>
		formatText TextName = player_num qs(0x48c6d14c) d = (<i> + 1)
		<desc_id> :se_setprops {
			gamertag_rgba = <rgba_lt>
			frame_highlight_alpha = 0.0
			instrument_color_alpha = 1.0
			instrument_color_flame01_alpha = 0.0
			event_handlers = [
				{focus band_lobby_viewport_change_focus params = {focus_type = focus submenu_index = <i>}}
				{unfocus band_lobby_viewport_change_focus params = {focus_type = unfocus submenu_index = <i>}}
				{pad_choose band_lobby_select_band_member params = {submenu_index = <i>}}
			]
		}
		band_lobby_update_submenu_data submenu_index = <i> element = desc_id value = <desc_id>
		<desc_id> :Obj_SpawnScriptNow band_lobby_update_submenu_instrument params = {submenu_index = <i>}
		<desc_id> :Obj_SpawnScriptNow band_lobby_update_gamertag params = {submenu_index = <i>}
		<desc_id> :Obj_SpawnScriptNow band_lobby_update_leader_icon params = {submenu_index = <i>}
		<desc_id> :Obj_SpawnScriptNow band_lobby_update_viewport_mask params = {submenu_index = <i>}
		<desc_id> :Obj_SpawnScriptNow band_lobby_update_menu_loop params = {submenu_index = <i>}
		<desc_id> :Obj_SpawnScriptNow bl_update_menu_presence params = {submenu_index = <i>}
		if isps3
			band_lobby_update_submenu_data submenu_index = <i> element = menu value = ps3_init
		endif
	endif
	if <desc_id> :desc_resolvealias Name = alias_viewport_cont
		character_window_cont_id = <resolved_id>
		RemoveParameter \{resolved_id}
		if ScreenElementExists id = <character_window_cont_id>
			formatText checksumName = viewport 'band_viewport_%i' i = <i>
			formatText checksumName = viewport_texture 'viewport%i' i = <i>
			CreateScreenElement {
				id = <viewport>
				Type = ViewportElement
				parent = <character_window_cont_id>
				texture = <viewport_texture>
				dims = (248.0, 415.0)
				just = [left top]
				Pos = (0.0, 0.0)
				z_priority = -50
				style = band_viewports
				capability = $band_viewport_capabilities
				alpha = 1
			}
			band_lobby_play_viewport_camera {
				viewport_index = <i>
			}
			if <desc_id> :desc_resolvealias Name = alias_leader_glow param = leader_glow_id
				<leader_glow_id> :Obj_SpawnScriptNow ui_band_lobby_leader_pulse
			else
				ScriptAssert \{'dschorn1'}
			endif
			if <desc_id> :desc_resolvealias Name = alias_dragon_eye_l param = dragon_eye_l_id
				<dragon_eye_l_id> :Obj_SpawnScriptNow ui_alphablast_02
			else
				ScriptAssert \{'dschorn1'}
			endif
			if <desc_id> :desc_resolvealias Name = alias_dragon_eye_r param = dragon_eye_r_id
				<dragon_eye_r_id> :Obj_SpawnScriptNow ui_alphablast_02
			else
				ScriptAssert \{'dschorn1'}
			endif
			TOD_Proxim_Update_LightFX fxParam = $lobby_viewport_tod_manager viewport = <viewport> time = 0.0
			venue_screenfx viewport = <viewport>
			if screenFX_FXInstanceExists viewport = <viewport> Name = motion_blur
				ScreenFX_RemoveFXInstance viewport = <viewport> Name = motion_blur
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
			alpha = 1.0
			occupied = ($<submenu_data>.occupied)
			update = 1
		endif
		if (<temp_gt> != <text>)
			text = <temp_gt>
			update = 1
		endif
		if (<update> = 1)
			se_setprops alpha = <alpha>
			if ResolveScreenElementID id = {<objID> child = gamertag}
				<resolved_id> :se_setprops text = <text>
			endif
			update = 0
		endif
	else
		if (($<submenu_data>.occupied) != <occupied>)
			text = qs(0x00000000)
			alpha = 0.0
			se_setprops alpha = <alpha>
			if ResolveScreenElementID id = {<objID> child = gamertag}
				<resolved_id> :se_setprops text = <text>
			endif
			occupied = ($<submenu_data>.occupied)
		endif
	endif
	Wait \{1
		Second}
	repeat
endscript

script band_lobby_play_viewport_camera \{fix_camera_shudder = 0}
	printf \{channel = band_lobby
		qs(0x757cda63)}
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
	if <lock_to_target> :modelbuilder_getavatarname
		offset = (0.0, 0.4)
		dist = 0.78
	else
		offset = (0.0, -0.1)
		if ((<character_id> = gh_rocker_lars) || (<character_id> = gh_rocker_lars_2) || (<character_id> = gh_rocker_lars_2_ghost) || (<character_id> = gh_rocker_axel) || (<character_id> = gh_rocker_axel_2) || (<character_id> = gh_rocker_axel_2_ghost) || (<character_id> = gh_rocker_arthas))
			dist = 0.71999997
		else
			if (<character_id> = gh_rocker_minotaur)
				dist = 0.8
			else
				dist = 0.65000004
			endif
		endif
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
	bg_fx_set_blur viewport = <viewport> appendstrength = 0.5
	character_hide_particle_systems object_name = <lock_to_target>
	<lock_to_target> :obj_setvisibility viewport = <viewport> exclusive
	character_unhide_particle_systems object_name = <lock_to_target>
	if (<fix_camera_shudder> = 1)
		SetViewportProperties viewport = <viewport> Active = FALSE
		<lock_to_target> :Obj_SpawnScriptNow band_lobby_reenable_viewport params = {viewport = <viewport>}
	endif
endscript

script band_lobby_reenable_viewport \{viewport = !q1768515945}
	setscriptcannotpause
	OnExitRun band_lobby_reenable_viewport_died params = {viewport = <viewport>}
	Wait \{16
		gameframes}
endscript

script band_lobby_reenable_viewport_died 
	SetViewportProperties viewport = <viewport> Active = true
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
		band_lobby_mask_viewport submenu_index = <submenu_index>
	endif
endscript

script band_lobby_mask_viewport 
	RequireParams \{[
			submenu_index
		]
		all}
	if ($in_band_lobby = 0 || submenu_index > 3)
		return
	endif
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	element_id = ($<submenu_data>.desc_id)
	if ScreenElementExists id = <element_id>
		<element_id> :se_setprops block_viewport_alpha = 0
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
		band_lobby_unmask_viewport submenu_index = <submenu_index> time = <time>
	endif
endscript

script band_lobby_unmask_viewport \{time = 0.1}
	RequireParams \{[
			submenu_index
		]
		all}
	if ($in_band_lobby = 0 || submenu_index > 3)
		return
	endif
	KillSpawnedScript \{Name = band_lobby_mask_viewport}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	element_id = ($<submenu_data>.desc_id)
	if ScreenElementExists id = <element_id>
		if ($<submenu_data>.occupied = 1 || $<submenu_data>.is_managed = 1)
			<element_id> :se_setprops block_viewport_alpha = 0.0 time = <time>
		else
			<element_id> :se_setprops block_viewport_alpha = 0.0 time = <time>
		endif
	endif
endscript

script band_lobby_scroll_submenu 
	RequireParams \{[
			Dir
			Player
			submenu_index
		]
		all}
	Obj_GetID
	<objID> :menu_getselectedindex
	<objID> :se_getprops Pos
	if GetScreenElementChildren id = <objID>
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
		GetArraySize <children>
		if ScreenElementExists id = ($<submenu_data>.desc_id)
			if (<Dir> = up)
				printf \{channel = sfx
					qs(0xa49092fb)}
				if NOT (<selected_index> <= 0)
					audio_ui_band_lobby_sfx_logic player_num = <Player> up = 1
					if ScreenElementExists id = (<children> [<selected_index>])
						LaunchEvent Type = unfocus target = <objID>
					endif
					Wait \{2
						gameframes}
					($<submenu_data>.desc_id) :Obj_SpawnScriptNow band_lobby_animate_scroll_bar params = {Dir = <Dir> num_menu_items = <array_Size>}
					($<submenu_data>.desc_id) :Obj_SpawnScriptNow band_lobby_animate_scroll_bar_arrows params = {Dir = <Dir>}
					if (<selected_index> > 1 && <selected_index> < (<array_Size> - 1))
						<objID> :se_setprops Pos = (<Pos> + ((0.0, 1.0) * ($g_submenu_element_y))) time = 0.1
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
					if ScreenElementExists id = (<children> [(<selected_index> - 1)])
						LaunchEvent Type = focus target = <objID> data = {child_index = (<selected_index> - 1)}
					endif
				endif
			elseif (<Dir> = down)
				printf \{channel = sfx
					qs(0x53e69f18)}
				if ((<selected_index> + 1) < <array_Size>)
					audio_ui_band_lobby_sfx_logic player_num = <Player> down = 1
					if ScreenElementExists id = (<children> [<selected_index>])
						LaunchEvent Type = unfocus target = <objID>
					endif
					Wait \{2
						gameframes}
					($<submenu_data>.desc_id) :Obj_SpawnScriptNow band_lobby_animate_scroll_bar params = {Dir = <Dir> num_menu_items = <array_Size>}
					($<submenu_data>.desc_id) :Obj_SpawnScriptNow band_lobby_animate_scroll_bar_arrows params = {Dir = <Dir>}
					if (<selected_index> > 0 && <selected_index> < (<array_Size> - 2))
						<objID> :se_setprops Pos = (<Pos> + ((0.0, -1.0) * ($g_submenu_element_y))) time = 0.1
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
					if ScreenElementExists id = (<children> [(<selected_index> + 1)])
						LaunchEvent Type = focus target = <objID> data = {child_index = (<selected_index> + 1)}
					endif
				endif
			endif
		endif
	endif
endscript

script band_lobby_animate_scroll_bar 
	printf \{channel = band_lobby
		qs(0x0f7801dc)}
	RequireParams \{[
			Dir
			num_menu_items
		]
		all}
	Obj_GetID
	<objID> :se_getprops
	if (<num_menu_items> > 1)
		num_steps = (<num_menu_items> - 1)
	else
		num_steps = 1
	endif
	scrollbar_step = ((<scrollbar_dims> [1] - (<scroll_thumb_dims> [1] * <scroll_thumb_scale> [1])) / <num_steps>)
	if (<Dir> = up)
		scroll_thumb_pos = (<scroll_thumb_pos> + ((0.0, -1.0) * <scrollbar_step>))
	elseif (<Dir> = down)
		scroll_thumb_pos = (<scroll_thumb_pos> + ((0.0, 1.0) * <scrollbar_step>))
	endif
	<objID> :se_setprops scroll_thumb_pos = <scroll_thumb_pos> time = 0.1
	<objID> :se_waitprops
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
			submenu_index
			focus_type
		]
		all}
	printf channel = band_lobby qs(0x4643faf2) p = <Player>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
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
			switch <submenu_index>
				case 0
				rgba = p1_md
				case 1
				rgba = p2_md
				case 2
				rgba = p3_md
				case 3
				rgba = p4_md
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
			{local_id = highlight_bar2}
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
				<resolved_id> :se_setprops rgba = [249 243 190 255]
			else
				<resolved_id> :se_setprops rgba = gh6_gold
			endif
		endif
		<objID> :se_getparentid
		<parent_id> :GetSingleTag last_item_selected
		if NOT GotParam \{last_item_selected}
			<last_item_selected> = None
		endif
		if (<last_item_selected> != <objID>)
			if GotParam \{additional_focus_script}
				<additional_focus_script> <additional_focus_params>
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
			band_lobby_get_player_color submenu_index = <submenu_index>
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
			{local_id = highlight_bar2}
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
				<resolved_id> :se_setprops rgba = gh6_gold
			else
				<resolved_id> :se_setprops rgba = grey_md
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
		if desc_resolvealias \{Name = alias_lobby_frame_hl}
			<resolved_id> :obj_spawnscript ui_band_lobby_pulse
		endif
	elseif (<focus_type> = unfocus)
		se_setprops \{frame_highlight_alpha = 0.0}
		if desc_resolvealias \{Name = alias_lobby_frame_hl}
			<resolved_id> :Obj_KillSpawnedScript Name = ui_band_lobby_pulse
		endif
	endif
	if (<focus_type> = unfocus)
		this_index = <submenu_index>
		band_lobby_get_player_submenu_index player_num = ($g_leader_player_num)
		if (-1 != <submenu_index>)
			if (<this_index> != <submenu_index>)
				LaunchEvent Type = focus target = ($band_lobby_viewport_menus [<this_index>])
			endif
		endif
		<submenu_index> = <this_index>
	endif
endscript

script bl_submenus_anim_in 
	printf \{channel = band_lobby
		qs(0xe6fd410d)}
	GetArraySize ($band_lobby_viewport_menus)
	<submenu_index> = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	if ($g_band_lobby_error_msg != NULL)
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
				get_savegame_from_controller controller = <controller>
				if NOT should_scan_dlc
					if isps3
						RemoveParameter \{load_savegame}
					endif
					if get_savegame_has_saved_game savegame = <savegame>
						RemoveParameter \{load_savegame}
					endif
					if NOT is_autosave_on savegame = <savegame>
						RemoveParameter \{load_savegame}
					endif
					if demobuild
						RemoveParameter \{load_savegame}
					endif
				endif
				if InNetGame
					gamemode_gettype
					if (<Type> = career)
						RemoveParameter \{load_savegame}
					endif
				endif
				printstruct <...>
				if GotParam \{load_savegame}
					savegame_async_button_in savegame = <savegame> callback = lobby_mc_loading_callback data = {
						Player = ($<submenu_data>.Player)
						submenu_index = <submenu_index>
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
	if ScreenElementExists id = ($band_lobby_viewport_menus [<submenu_index>])
		if playerinfoequals ($<submenu_data>.Player) is_local_client = 1
			($band_lobby_viewport_menus [<submenu_index>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {menu = <menu> action = forward Player = ($<submenu_data>.Player) submenu_index = <submenu_index> focus = <focus>}
		else
			($band_lobby_viewport_menus [<submenu_index>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {menu = <menu> action = forward Player = ($<submenu_data>.Player) submenu_index = <submenu_index> focus = <focus> no_forced}
		endif
	endif
	<submenu_index> = (<submenu_index> + 1)
	repeat <array_Size>
endscript

script band_lobby_force_all_ready_players_to_main_menu 
	GetArraySize ($band_lobby_viewport_menus)
	i = 0
	begin
	band_lobby_get_submenu_data submenu_index = <i> param = focus_type
	band_lobby_get_submenu_data submenu_index = <i> param = occupied
	if (<occupied> = 1)
		if ScreenElementExists id = ($band_lobby_viewport_menus [<i>])
			if NOT band_lobby_is_in_forced_flow submenu_index = <i>
				band_lobby_get_submenu_data submenu_index = <i> param = menu_indices out = array
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
				($band_lobby_viewport_menus [<i>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {menu = main action = back Player = ($<submenu_data>.Player) submenu_index = <i> focus = <focus_type>}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script band_lobby_is_in_forced_flow 
	RequireParams \{[
			submenu_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
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
			submenu_index
		]
		all}
	printf channel = band_lobby qs(0x3789bcae) v = <submenu_index>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	if (($<submenu_data>.occupied) = 1)
		getplayerinfo ($<submenu_data>.Player) is_local_client
		if (<is_local_client> = 1)
			getplayerinfo ($<submenu_data>.Player) controller
			getplayerinfo ($<submenu_data>.Player) part
			controller_type = None
			if NOT iscontrollerpluggedin controller = <controller>
				<controller_type> = <part>
			else
				if band_lobby_isguitarcontroller Player = ($<submenu_data>.Player) submenu_index = <submenu_index>
					<controller_type> = guitar
				elseif band_lobby_isdrumcontroller Player = ($<submenu_data>.Player) submenu_index = <submenu_index>
					<controller_type> = drum
				elseif band_lobby_isvocalscontroller Player = ($<submenu_data>.Player) submenu_index = <submenu_index>
					<controller_type> = vocals
				endif
			endif
			if ($allow_controller_for_all_instruments = 1)
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
							return \{true
								forced_menu = forced_lefty_flip}
						endif
					endif
				endif
				get_progression_instrument_user_option controller = <controller> part = <part> option = 'difficulty'
				if (<user_option> = None)
					if ($skip_band_lobby_forced_flow = 0)
						return \{true
							forced_menu = forced_difficulty}
					endif
				endif
			elseif (<controller_type> = guitar || <controller_type> = bass)
				get_progression_instrument_user_option controller = <controller> option = 'guitar_bass_flip'
				guitar_bass_flip = <user_option>
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
				get_progression_instrument_user_option controller = <controller> part = <part> option = 'lefty_flip'
				if (<user_option> < 0)
					if ($skip_band_lobby_forced_flow = 0)
						return \{true
							forced_menu = forced_instruments}
					endif
				endif
				get_progression_instrument_user_option controller = <controller> part = <part> option = 'difficulty'
				if (<user_option> = None)
					if ($skip_band_lobby_forced_flow = 0)
						return \{true
							forced_menu = forced_instruments}
					endif
				endif
			elseif (<controller_type> = drum)
				get_progression_instrument_user_option controller = <controller> part = drum option = 'lefty_flip'
				if (<user_option> < 0)
					if ($skip_band_lobby_forced_flow = 0)
						return \{true
							forced_menu = forced_lefty_flip}
					endif
				endif
				part = drum
				get_progression_instrument_user_option controller = <controller> part = <part> option = 'difficulty'
				if (<user_option> = None)
					if ($skip_band_lobby_forced_flow = 0)
						return \{true
							forced_menu = forced_lefty_flip}
					endif
				endif
			elseif (<controller_type> = vocals)
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
						if band_lobby_should_force_highway_view Player = ($<submenu_data>.Player)
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
	return \{FALSE}
endscript

script band_lobby_force_submenu_change_all \{menu = !q1768515945
		action = forward
		submenu_data_match = occupied
		match_value = 0}
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
		if playerinfoequals ($<submenu_data>.Player) is_local_client = 1
			if ScreenElementExists id = ($band_lobby_viewport_menus [<i>])
				($band_lobby_viewport_menus [<i>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {menu = <menu> action = <action> Player = ($<submenu_data>.Player) submenu_index = <i> focus = <focus>}
			endif
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
	band_lobby_get_submenu_data submenu_index = <submenu_index> param = update_queue
	<new_menu_update> = {
		menu = <menu>
		action = <action>
		focus = <focus>
		menu_index = <menu_index>
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

script band_lobby_update_menu \{submenu_index = !i1768515945}
	printf channel = band_lobby qs(0x9438b3e0) v = <submenu_index>
	if ScreenElementExists id = ($band_lobby_viewport_menus [<submenu_index>])
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = is_updating value = 1
		if isscreenelementinfocus id = ($band_lobby_viewport_menus [<submenu_index>])
			current_focus_value = ($<submenu_data>.focus_type)
			LaunchEvent Type = unfocus target = ($band_lobby_viewport_menus [<submenu_index>])
		else
			current_focus_value = ($<submenu_data>.focus_type)
		endif
		if GotParam \{menu_index}
			if (-1 = <menu_index>)
				($band_lobby_viewport_menus [<submenu_index>]) :menu_getselectedindex
				<index> = <selected_index>
			else
				<index> = <menu_index>
			endif
		else
			<index> = ($<submenu_data>.menu_indices [0])
		endif
		if GotParam \{action}
			band_lobby_create_new_submenu submenu_index = <submenu_index> action = <action>
		else
			if ScreenElementExists id = ($band_lobby_viewport_menus [<submenu_index>])
				DestroyScreenElement id = ($band_lobby_viewport_menus [<submenu_index>]) preserve_parent
			endif
			new_vmenu = ($band_lobby_viewport_menus [<submenu_index>])
		endif
		menu = ($<submenu_data>.menu)
		band_lobby_get_player_color submenu_index = <submenu_index>
		($<submenu_data>.desc_id) :se_setprops subheading_text = ($band_lobby_submenu_states.<menu>.title)
		if ($<submenu_data>.is_managed = 1)
			($<submenu_data>.desc_id) :se_setprops lobby_frame_sm_rgba = red_md
		else
			($<submenu_data>.desc_id) :se_setprops lobby_frame_sm_rgba = <rgba_xdk>
		endif
		band_lobby_get_num_menu_options Player = ($<submenu_data>.Player) submenu_index = <submenu_index>
		menu_options = ($band_lobby_submenu_states.<menu>.options)
		no_highlight_bar = FALSE
		no_highlight_bar = ($band_lobby_submenu_states.<menu>.no_highlight_bar)
		text_fit_width = truncate
		text_fit_width = ($band_lobby_submenu_states.<menu>.text_fit_width)
		if (<no_highlight_bar> = FALSE)
			scrollbar_alpha = 1
			color_alpha = 1
			instrument_color_alpha = 1
			instrument_color_flame01_alpha = 1
		else
			scrollbar_alpha = 0
			color_alpha = 0
			instrument_color_alpha = 1
			instrument_color_flame01_alpha = 0
		endif
		($<submenu_data>.desc_id) :se_setprops color_alpha = <color_alpha> time = 0.1
		($<submenu_data>.desc_id) :se_setprops scrollbar_alpha = <scrollbar_alpha> time = 0.1
		($<submenu_data>.desc_id) :se_setprops instrument_color_alpha = <instrument_color_alpha> time = 0.1
		($<submenu_data>.desc_id) :se_setprops instrument_color_flame01_alpha = <instrument_color_flame01_alpha> time = 0.1
		if ($<submenu_data>.is_managed = 1 && $<submenu_data>.occupied = 0)
			Player = $g_leader_player_num
		else
			Player = ($<submenu_data>.Player)
		endif
		standard_params = {Player = <Player> submenu_index = <submenu_index>}
		GetArraySize <menu_options>
		if (<array_Size> > 0)
			j = 0
			begin
			if StructureContains structure = (<menu_options> [<j>]) condition
				if (<menu_options> [<j>].condition) <standard_params> (<menu_options> [<j>].condition_params)
					add_element = 1
				else
					add_element = 0
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
					dims = ((235.0, 0.0) + (0.0, 1.0) * ($g_submenu_element_y))
					just = [left top]
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
				switch <submenu_index>
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
						texture = light_bar
						just = [left top]
						alpha = 0.0
						dims = (244.0, 35.0)
						Pos = (0.0, 0.0)
						z_priority = 10.1
						material = band_lobby_fire_bar
					}
					CreateScreenElement {
						parent = <container_id>
						local_id = highlight_bar2
						Type = SpriteElement
						texture = light_bar
						just = [left top]
						alpha = 0.0
						dims = (244.0, 35.0)
						Pos = (0.0, 0.0)
						z_priority = 10
					}
				endif
				text_nudge = (0.0, 0.0)
				if StructureContains structure = (<menu_options> [<j>]) texture
					CreateScreenElement {
						parent = <container_id>
						Type = SpriteElement
						texture = (<menu_options> [<j>].texture)
						Pos = (0.0, 40.0)
						pos_anchor = [center center]
						just = [center center]
						autosizedims = true
						z_priority = 10
					}
				endif
				if StructureContains structure = (<menu_options> [<j>]) desc_id
					CreateScreenElement {
						parent = <container_id>
						Type = descinterface
						desc = (<menu_options> [<j>].desc_id)
						Pos = (0.0, 20.0)
						pos_anchor = [center center]
						just = [center center]
						autosizedims = true
						Scale = (0.75, 0.75)
						z_priority = 7
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
						text_rgba = gh6_gold
					else
						text_rgba = grey_md
					endif
					if (($<submenu_data>.menu) != join)
						CreateScreenElement {
							parent = <container_id>
							local_id = text
							Type = TextBlockElement
							Pos = (8.0, -5.0)
							dims = (224.0, 40.0)
							fit_width = `scale	each	line	if	larger`
							fit_height = `scale	down	if	larger`
							scale_mode = `per	axis`
							enable_min_scale = FALSE
							font = fontgrid_text_a1
							rgba = <text_rgba>
							text = <text>
							just = [left top]
							internal_scale = (0.4, 0.52)
							internal_just = [center , center]
							z_priority = 11.22
							Shadow
							shadow_offs = (2.0, 2.0)
							shadow_rgba = [0 0 0 255]
						}
					else
						band_lobby_helperpilltext <standard_params>
						CreateScreenElement {
							parent = <container_id>
							Type = menuelement
							Pos = (112.0, 0.0)
							dims = (1.0, 100.0)
							just = [center top]
							internal_just = [center center]
							isvertical = FALSE
							major_axis_fit = `expand	if	content	larger`
						}
						h_menu_id = <id>
						CreateScreenElement {
							parent = <h_menu_id>
							local_id = text
							Type = TextBlockElement
							dims = (1.0, 8.0)
							font = fontgrid_text_a1
							rgba = <text_rgba>
							text = (<text_params>.a)
							internal_just = [right , center]
							fit_width = `expand	dims`
							fit_height = `expand	dims`
							z_priority = 11.22
						}
						CreateScreenElement {
							parent = <h_menu_id>
							local_id = text
							Type = TextBlockElement
							dims = (1.0, 40.0)
							fit_width = `expand	dims`
							fit_height = `scale	down	if	larger`
							scale_mode = `per	axis`
							enable_min_scale = FALSE
							font = fontgrid_text_a1
							rgba = <text_rgba>
							text = <text>
							internal_scale = (0.4, 0.52)
							internal_just = [left , center]
							z_priority = 11.22
						}
					endif
					if StructureContains structure = (<menu_options> [<j>]) text_params
						<id> :SetTags original_text = (<menu_options> [<j>].text) text_params_func = (<menu_options> [<j>].text_params) standard_params = <standard_params>
					endif
				endif
			endif
			j = (<j> + 1)
			repeat <array_Size>
			if GotParam \{focus}
				if (<focus> = 1)
					band_lobby_update_submenu_data submenu_index = <submenu_index> element = focus_type value = focus
				else
					band_lobby_update_submenu_data submenu_index = <submenu_index> element = focus_type value = unfocus
				endif
			else
				band_lobby_update_submenu_data submenu_index = <submenu_index> element = focus_type value = <current_focus_value>
			endif
			band_lobby_update_submenu_scroll_bar submenu_index = <submenu_index> VMenu = <new_vmenu>
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
				submenu_index = <submenu_index>
				pad_back_script = ($band_lobby_submenu_states.<menu>.back_script)
				pad_back_params = {<standard_params> ($band_lobby_submenu_states.<menu>.back_params)}
				add_shortcuts = ($band_lobby_submenu_states.<menu>.add_shortcuts)
			}
		else
			if ScreenElementExists id = <new_vmenu>
				DestroyScreenElement id = <new_vmenu>
			endif
		endif
		LaunchEvent Type = ($<submenu_data>.focus_type) target = ($band_lobby_viewport_menus [<submenu_index>]) data = {child_index = <index>}
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = is_updating value = 0
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

script band_lobby_create_new_submenu 
	RequireParams \{[
			submenu_index
			action
		]
		all}
	printf channel = band_lobby qs(0x92b8970c) v = <submenu_index>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	($band_lobby_viewport_menus [<submenu_index>]) :se_getprops
	($band_lobby_viewport_menus [<submenu_index>]) :se_getparentid
	if ($<submenu_data>.is_managed = 1)
		getplayerinfo ($g_leader_player_num) controller
		Player = ($g_leader_player_num)
	else
		getplayerinfo ($<submenu_data>.Player) controller
		Player = ($<submenu_data>.Player)
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
	band_lobby_get_num_menu_options Player = <Player> submenu_index = <submenu_index>
	if (($<submenu_data>.menu_indices [0]) > <num_options> || ($<submenu_data>.menu_indices [0]) < 0)
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = menu_indices value = [0 0 0]
	endif
	if (($<submenu_data>.menu_indices [0]) = 0 || ($<submenu_data>.menu_indices [0]) = 1)
		Pos = ((1.0, 0.0) * <starting_x>)
	elseif (($<submenu_data>.menu_indices [0]) = (<num_options> - 1) || ($<submenu_data>.menu_indices [0]) = (<num_options> - 2))
		Pos = (((1.0, 0.0) * <starting_x>) - ((0.0, 1.0) * ((<num_options> - 3) * ($g_submenu_element_y))))
	else
		Pos = (((1.0, 0.0) * <starting_x>) - ((0.0, 1.0) * (($<submenu_data>.menu_indices [0] - 1) * ($g_submenu_element_y))))
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

script band_lobby_update_ticker \{msg_checksum = !q1768515945
		msg_count = 3}
	printf \{channel = band_lobby
		qs(0x9de6efa4)}
	if ScreenElementExists \{id = band_lobby_desc_id}
		if StructureContains structure = ($band_lobby_strings) <msg_checksum>
			switch <msg_checksum>
				default
				msg = ($band_lobby_strings.<msg_checksum>)
			endswitch
			if band_lobby_desc_id :desc_resolvealias \{Name = alias_transient_msg_cont}
				<resolved_id> :Obj_KillSpawnedScript Name = bl_update_new_ticker
				<resolved_id> :Obj_SpawnScriptNow bl_update_new_ticker params = {
					ticker_text = <msg>
					ticker_space = ($g_ticker_spacing)
					ticker_pos = (0.0, 5.0)
					ticker_just = [top left]
					ticker_parent = <resolved_id>
					ticker_font = fontgrid_text_a1
					ticker_x_scale = 0.4
					ticker_y_scale = 0.35000002
					ticker_rgba1 = [239 232 164 255]
					ticker_rgba2 = [239 232 164 255]
					ticker_z_priority = 18
					msg_count = <msg_count>
				}
			endif
		endif
	endif
endscript

script bl_clear_ticker 
	printf \{channel = band_lobby
		qs(0x0de5627c)}
	if ScreenElementExists \{id = band_lobby_desc_id}
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_transient_msg_cont
				param = msg_cont}
			if (0 < $g_num_scrolling_texts)
				<resolved_id> :Obj_KillSpawnedScript Name = scroll_ticker_text
				<index> = (($g_num_scrolling_texts) - 1)
				begin
				formatText checksumName = ticker_text_id_1 'scrolling_ticker_text_%i_1' i = <index>
				formatText checksumName = ticker_text_id_2 'scrolling_ticker_text_%i_2' i = <index>
				DestroyScreenElement id = <ticker_text_id_1>
				DestroyScreenElement id = <ticker_text_id_2>
				<index> = (<index> - 1)
				repeat ($g_num_scrolling_texts)
			endif
			changeglobalinteger \{global_name = g_num_scrolling_texts
				new_value = 0}
		endif
	endif
endscript

script bl_update_new_ticker \{ticker_parent = !q1768515945
		msg_count = 3
		ticker_z_priority = -1
		use_shadow = 0
		ticker_x_scale = 0.6
		ticker_y_scale = 0.6
		ticker_font = fontgrid_text_a1
		ticker_rgba1 = [
			230
			230
			230
			255
		]
		ticker_rgba2 = [
			230
			230
			230
			255
		]
		ticker_shadow_rgba = [
			0
			0
			0
			255
		]
		ticker_just = [
			left
			top
		]
		ticker_pos = (128.0, 598.0)
		ticker_text = qs(0x73dbd1ae)
		ticker_space = qs(0x713755f7)}
	printf \{channel = band_lobby
		qs(0xf2e0aafd)}
	Obj_GetID
	OnExitRun bl_cleanup_ticker params = {parent_id = <objID>}
	if (0 < <msg_count>)
		DestroyScreenElement id = <objID> preserve_parent
		GetScreenElementDims id = <objID>
		<text_plus_spacing> = (<ticker_text> + <ticker_space>)
		StringLength string = <text_plus_spacing>
		<time> = (<str_len> / ($g_ticker_scroll_rate))
		<starting_pos> = (((1.0, 0.0) * <width>) + ((0.0, 1.0) * <ticker_pos> [1]))
		begin
		CreateScreenElement {
			Type = TextElement
			just = <ticker_just>
			parent = <ticker_parent>
			Pos = <starting_pos>
			Scale = ((<ticker_x_scale> * (1.0, 0.0)) + (<ticker_y_scale> * (0.0, 1.0)))
			font = <ticker_font>
			text = <text_plus_spacing>
			rgba = <ticker_rgba1>
			alpha = 1.0
			z_priority = <ticker_z_priority>
		}
		<id> :Obj_SpawnScriptNow bl_scroll_ticker_element params = {starting_pos = <starting_pos> time = <time>}
		Block \{Type = ticker_halt}
		repeat <msg_count>
		begin
		if NOT ScriptIsRunning \{bl_scroll_ticker_element}
			break
		endif
		WaitOneGameFrame
		repeat
	endif
endscript

script bl_scroll_ticker_element \{starting_pos = 0x69696969
		time = 3.0}
	Obj_GetID
	GetScreenElementDims id = <objID>
	<Pos> = (((-1.0, 0.0) * <width>) + ((0.0, 1.0) * (<starting_pos> [1])))
	se_setprops Pos = <Pos> time = <time>
	begin
	se_getprops
	if ((<starting_pos> [0] - <Pos> [0]) >= <width>)
		broadcastevent \{Type = ticker_halt}
		break
	endif
	WaitOneGameFrame
	repeat
	se_waitprops
	Die
endscript

script bl_cleanup_ticker \{parent_id = !q1768515945}
	if screenelementexistssimpleid id = <parent_id>
		DestroyScreenElement id = <parent_id> preserve_parent
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
			submenu_index
			VMenu
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	if GetScreenElementChildren id = <VMenu>
		GetArraySize <children>
		if ScreenElementExists id = ($<submenu_data>.desc_id)
			($<submenu_data>.desc_id) :se_getprops
			if (<array_Size> > 1)
				num_steps = (<array_Size> - 1)
			else
				num_steps = 1
			endif
			printstruct <...>
			scrollbar_step = ((<scrollbar_dims> [1] - (<scroll_thumb_dims> [1] * <scroll_thumb_scale> [1])) / <num_steps>)
			scroll_thumb_pos = (((1.0, 0.0) * (<scroll_thumb_pos> [0])) + (0.0, 19.0) + ((0.0, 1.0) * (<scrollbar_step> * ($<submenu_data>.menu_indices [0]))))
			($<submenu_data>.desc_id) :se_setprops scroll_thumb_pos = <scroll_thumb_pos> time = 0.1
		endif
	endif
endscript

script band_lobby_update_submenu_pad_handlers 
	RequireParams \{[
			submenu_index
			pad_back_script
			pad_back_params
			add_shortcuts
		]
		all}
	printf channel = band_lobby qs(0x192bfd25) c = <submenu_index>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	if ($<submenu_data>.is_managed = 1)
		Player = $g_leader_player_num
	else
		Player = ($<submenu_data>.Player)
	endif
	standard_params = {Player = <Player> submenu_index = <submenu_index>}
	array = [
		{pad_up band_lobby_scroll_submenu params = {<standard_params> Dir = up}}
		{pad_down band_lobby_scroll_submenu params = {<standard_params> Dir = down}}
		{pad_back band_lobby_submenu_pad_handler_wrapper params = {choose_script = <pad_back_script> submenu_index = <submenu_index> params = <pad_back_params> back = 1}}
	]
	if (<add_shortcuts> = 1)
		AddArrayElement array = <array> element = {pad_option band_lobby_submenu_pad_handler_wrapper params = {choose_script = band_lobby_players submenu_index = <submenu_index> params = <standard_params>}}
		AddArrayElement array = <array> element = {pad_option2 band_lobby_submenu_pad_handler_wrapper params = {choose_script = band_lobby_friendslist submenu_index = <submenu_index> params = <standard_params>}}
		if (0 = $<submenu_data>.is_managed)
			if bl_should_display_challenge_shortcut
				AddArrayElement array = <array> element = {pad_start band_lobby_submenu_pad_handler_wrapper params = {choose_script = bl_challenge_shortcut_checks submenu_index = <submenu_index> params = <standard_params>}}
			else
				if (quickmatch != $g_career_search)
					AddArrayElement array = <array> element = {pad_start band_lobby_submenu_pad_handler_wrapper params = {choose_script = band_lobby_continue submenu_index = <submenu_index> params = <standard_params>}}
				endif
			endif
		endif
	endif
	if ($<submenu_data>.is_managed = 0)
		if InNetGame
			if (NULL != $g_career_search)
				AddArrayElement array = <array> element = {pad_L1 band_lobby_submenu_pad_handler_wrapper params = {choose_script = band_lobby_net_continue submenu_index = <submenu_index> params = <standard_params> choose = 1}}
			endif
		else
			if bl_should_display_challenge_shortcut
				AddArrayElement array = <array> element = {pad_L1 band_lobby_submenu_pad_handler_wrapper params = {choose_script = bl_cancel_challenge submenu_index = <submenu_index> params = <standard_params>}}
			else
				AddArrayElement array = <array> element = {pad_L1 band_lobby_submenu_pad_handler_wrapper params = {choose_script = band_lobby_net_continue submenu_index = <submenu_index> params = <standard_params> choose = 1}}
			endif
		endif
	endif
	($band_lobby_viewport_menus [<submenu_index>]) :se_setprops {
		event_handlers = <array>
		replace_handlers
	}
endscript

script band_lobby_submenu_pad_handler_wrapper 
	RequireParams \{[
			submenu_index
			choose_script
		]
		all}
	printf \{channel = band_lobby
		qs(0xef7eea69)}
	band_lobby_get_submenu_data submenu_index = <submenu_index> param = update_queue
	band_lobby_get_submenu_data submenu_index = <submenu_index> param = is_updating
	GetArraySize <update_queue>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	if ((<array_Size> = 0) && (<is_updating> = 0) && 0 = $g_band_lobby_kill_switch)
		if GotParam \{back}
			if (<choose_script> = band_lobby_leave)
			else
				if band_lobby_can_leave
					audio_ui_band_lobby_sfx_logic player_num = <Player> back = 1
				endif
			endif
		elseif GotParam \{choose}
			if (($<submenu_data>.menu) = join)
				if NOT (<choose_script> = band_lobby_net_continue)
					audio_ui_band_lobby_sfx_logic player_num = <Player> choose = 1
				endif
			else
				if NOT (<choose_script> = band_lobby_net_continue)
					audio_ui_band_lobby_sfx_logic player_num = <Player> choose = 1
				endif
			endif
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
	begin
	Player = ($<submenu_data>.Player)
	if ($g_net_leader_player_num = <Player>)
		if (<is_leader> = 0)
			is_leader = 1
			update = 1
			band_leader_alpha = 1.0
			spawn_blink = 1
		endif
	else
		if (<is_leader> = 1)
			is_leader = 0
			update = 1
			band_leader_alpha = 0.0
			spawn_blink = 0
		endif
	endif
	if (<update> = 1)
		update = 0
		se_setprops lobby_frame_sm_banner_alpha = <band_leader_alpha> icon_leader_alpha = <band_leader_alpha>
	endif
	Wait ($band_lobby_wait_times.leader_update) Seconds
	repeat
endscript

script band_lobby_update_viewport_mask 
	printf \{channel = band_lobby
		qs(0x40180a42)}
	RequireParams \{[
			submenu_index
		]
		all}
	is_career_unoccupied = 0
	is_career = 0
	career_update = 0
	career_occupied_update = 0
	begin
	if band_lobby_is_career_state
		band_lobby_get_submenu_data submenu_index = <submenu_index> param = occupied
		if (<occupied> = 0)
			if (<is_career_unoccupied> = 0)
				is_career_unoccupied = 1
				gamertag_text_alpha = 0.0
				career_occupied_update = 1
			endif
		else
			if (<is_career_unoccupied> = 1)
				is_career_unoccupied = 0
				gamertag_text_alpha = 1.0
				career_occupied_update = 1
			endif
		endif
		if (<is_career> = 0)
			is_career = 1
			viewport_mask_alpha = 1.0
			career_update = 1
		endif
	else
		if (<is_career_unoccupied> = 1)
			is_career_unoccupied = 0
			gamertag_text_alpha = 1.0
			career_occupied_update = 1
		endif
		if (<is_career> = 1)
			is_career = 0
			viewport_mask_alpha = 0.0
			career_update = 1
		endif
	endif
	if (<career_occupied_update> = 1)
		career_occupied_update = 0
		se_setprops {
			gamertag_alpha = <gamertag_text_alpha>
		}
		if (<is_career_unoccupied> = 1)
			se_setprops \{not_focusable}
		else
			se_setprops \{focusable}
		endif
	endif
	if (<career_update> = 1)
		career_update = 0
		se_setprops player_window_fog_cont_alpha = <viewport_mask_alpha> time = 0.3
		se_waitprops
	endif
	Wait ($band_lobby_wait_times.mask_update) Seconds
	repeat
endscript

script band_lobby_update_submenu_instrument 
	RequireParams \{[
			submenu_index
		]
		all}
	printf channel = band_lobby qs(0x0207edad) a = <submenu_index>
	Obj_GetID
	current_part = NULL
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	band_lobby_get_player_color submenu_index = <submenu_index>
	begin
	if ScreenElementExists \{id = band_lobby_desc_id}
		getplayerinfo ($<submenu_data>.Player) part
		if (<part> != <current_part>)
			current_part = <part>
			if <objID> :desc_resolvealias Name = alias_instrument_icon param = icon_element_id
				<icon_element_id> :band_lobby_vocals_destroy_icon_update
				<icon_element_id> :Obj_KillSpawnedScript Name = band_lobby_vocals_icon_update
				<icon_element_id> :Obj_KillSpawnedScript Name = band_lobby_controller_connected_update
			endif
			switch <part>
				case guitar
				AddParam \{structure_name = lobby_props
					Name = instrument_icon_texture
					value = mixer_icon_guitar}
				case bass
				AddParam \{structure_name = lobby_props
					Name = instrument_icon_texture
					value = mixer_icon_bass}
				case drum
				AddParam \{structure_name = lobby_props
					Name = instrument_icon_texture
					value = mixer_icon_drums}
				case vocals
				if <objID> :desc_resolvealias Name = alias_instrument_icon param = icon_element_id
					<icon_element_id> :Obj_SpawnScriptNow band_lobby_vocals_icon_update params = {submenu_index = <submenu_index>}
				endif
			endswitch
			if <objID> :desc_resolvealias Name = alias_instrument_icon param = icon_element_id
				<icon_element_id> :obj_spawnscript band_lobby_controller_connected_update params = {submenu_index = <submenu_index>}
			endif
			se_setprops <lobby_props>
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
	Player = ($<submenu_data>.Player)
	if (($<submenu_data>.occupied) = 1)
		if band_lobby_is_career_state
			get_fullname_for_player Player = <Player> no_character_name
		else
			get_fullname_for_player Player = <Player>
		endif
		gamertag_text = <fullname>
	else
		getplayerinfo <Player> character_id
		getplayerinfo <Player> character_savegame
		if (career != $g_lobby_state)
			if GotParam \{character_savegame}
				get_fullname_of_character savegame = <character_savegame> id = <character_id> profanity_allowed
				if NOT playerinfoequals <Player> is_local_client = 1
				endif
				gamertag_text = <fullname>
			else
				gamertag_text = qs(0x00000000)
			endif
		else
			gamertag_text = qs(0x00000000)
		endif
	endif
	se_setprops gamertag_text = <gamertag_text>
	waitseconds num_seconds = ($band_lobby_wait_times.gamertag_update)
	repeat
endscript

script bl_update_menu_presence \{submenu_index = !i1768515945}
	<prev_occupied_flag> = 0
	<update> = 1
	begin
	band_lobby_get_submenu_data submenu_index = <submenu_index> param = occupied
	if (<occupied> != <prev_occupied_flag> || 1 = <update>)
		if (1 = <occupied>)
			<alpha> = 1.0
			<alpha_2> = 0.75
			bl_get_submenu_color submenu_index = <submenu_index>
		else
			<alpha> = 0.0
			<alpha_2> = 0.0
			<rgba_md> = ntscwhite
			<rgba_lt> = ntscwhite
		endif
		<update> = 1
	endif
	if (1 = <update>)
		AddParam structure_name = lobby_props Name = instrument_color_rgba value = <rgba_lt>
		AddParam structure_name = lobby_props Name = instrument_color_flame01_rgba value = <rgba_lt>
		se_setprops {
			presence_visuals_alpha = <alpha>
			presence_visuals_2_alpha = <alpha_2>
			presence_visuals_rgba = <rgba_md>
			presence_visuals_2_rgba = <rgba_lt>
		}
	endif
	<prev_occupied_flag> = <occupied>
	<update> = 0
	WaitOneGameFrame
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
		if ($g_lobby_net_state = net_private)
			<private_game> = 1
		else
			<private_game> = 0
		endif
		SendStructure callback = band_lobby_display_final_matchmaking_players_career data_to_send = {player_num = ($g_leader_player_num) private_game = <private_game>}
		band_lobby_display_final_matchmaking_players_career player_num = ($g_leader_player_num) private_game = <private_game>
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
			update_camera_for_viewport submenu_index = <i> Player = (<available_player_nums> [0])
			RemoveArrayElement array = <available_player_nums> index = 0
			available_player_nums = <array>
		endif
		i = (<i> + 1)
		repeat <used_submenus_size>
	endif
endscript

script band_lobby_display_final_matchmaking_players_career \{private_game = 0}
	printf \{channel = band_lobby
		qs(0xb98d280f)}
	Change g_net_leader_player_num = <player_num>
	Change \{g_career_search = NULL}
	<submenu_index> = 0
	begin
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
	if (($<submenu_data>.occupied) = 1)
		if (1 = <private_game>)
			band_lobby_add_menu_update_to_queue submenu_index = <submenu_index> menu_index = -1 focus = 0
		else
			if playerinfoequals ($<submenu_data>.Player) is_local_client = 1
				if band_lobby_is_select_rocker_menu menu = ($<submenu_data>.menu)
					($band_lobby_viewport_menus [<submenu_index>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {action = back menu = main Player = ($<submenu_data>.Player) submenu_index = <submenu_index> focus = 1}
				else
					band_lobby_add_menu_update_to_queue submenu_index = <submenu_index> action = forward focus = 1
				endif
			else
				($band_lobby_viewport_menus [<submenu_index>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {action = forward menu = remote_player Player = ($<submenu_data>.Player) submenu_index = <submenu_index> focus = 0 no_forced}
			endif
		endif
	else
		($band_lobby_viewport_menus [<submenu_index>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {action = forward menu = empty Player = ($<submenu_data>.Player) submenu_index = <submenu_index> focus = 0 no_forced}
	endif
	($band_lobby_viewport_menus [<submenu_index>]) :Obj_SpawnScriptNow check_for_net_appearance_arrival params = {Player = ($<submenu_data>.Player)}
	<submenu_index> = (1 + <submenu_index>)
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
		<remote_player_already_added> = 0
		<submenu_index> = 0
		begin
		getplayerinfo <remote_player> net_id_first
		getplayerinfo <remote_player> net_id_second
		band_lobby_get_submenu_data submenu_index = <submenu_index> param = occupied
		band_lobby_get_submenu_data submenu_index = <submenu_index> param = net_id
		if ((<net_id_first> = (<net_id> [0])) && (<net_id_second> = (<net_id> [1])) && 1 = <occupied>)
			if isps3
				getplayerinfo <remote_player> gamertag
				band_lobby_get_submenu_data submenu_index = <submenu_index> param = gamertag_checksum
				if (($<gamertag>) = ($<gamertag_checksum>))
					<remote_player_already_added> = 1
					break
				endif
			else
				<remote_player_already_added> = 1
				break
			endif
		endif
		<submenu_index> = (1 + <submenu_index>)
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
				if isps3
					submenu_gamertag = ($<submenu_data>.gamertag_checksum)
					if (($<gamertag>) = ($<submenu_gamertag>))
						if (<found_leader> = 1)
							if (<set_leader> = 0)
								<set_leader> = 1
								Change g_leader_player_num = <Player>
								band_lobby_update_primary_controller
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
							band_lobby_update_primary_controller
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
		if IsHost
			Change g_net_leader_player_num = ($g_leader_player_num)
			SendStructure callback = net_set_online_leader_num data_to_send = {player_num = ($g_leader_player_num)}
			choose_random_band_names
		endif
		band_lobby_create_popup_menu {
			menu = playerslist
			list_type = matchmaking_done
			Player = ($g_leader_player_num)
			container = <resolved_id>
		}
		Wait ($band_lobby_wait_times.net_display_final_players) Seconds
		if gamemode_iscooperative
			gman_startgamemodegoal
			pushdisablerendering \{context = going_into_songlist
				Type = unchecked}
			band_lobby_continue_menu_change \{new_state = uistate_songlist}
		elseif teammodeequals \{team_mode = two_teams}
			if checksumequals a = ($competitive_rules) b = band_vs_band
				lock_player_parts
			endif
			band_lobby_continue_menu_change \{new_state = uistate_team_select}
		else
			pushdisablerendering \{context = going_into_songlist
				Type = unchecked}
			band_lobby_continue_menu_change \{new_state = uistate_songlist}
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
		<submenu_index> = 0
		begin
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
		if (($<submenu_data>.occupied) = 0)
			if ScreenElementExists id = ($band_lobby_viewport_menus [<submenu_index>])
				if (<private> = 1)
					menu = empty
				else
					menu = searching
				endif
				($band_lobby_viewport_menus [<submenu_index>]) :Obj_SpawnScriptNow band_lobby_change_menu params = {menu = <menu> action = forward Player = ($<submenu_data>.Player) submenu_index = <submenu_index> focus = 0 no_forced}
			endif
		else
			if (1 = <private>)
				band_lobby_add_menu_update_to_queue submenu_index = <submenu_index> menu_index = -1 focus = 0
			endif
		endif
		<submenu_index> = (1 + <submenu_index>)
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
				GetArraySize ($<submenu_data>.update_queue)
				if (($<submenu_data>.is_updating) = 1)
					band_lobby_update_submenu_data submenu_index = <i> element = focus_type value = <focus_type>
				elseif (<array_Size> > 0)
					if (<focus_type> = focus)
						band_lobby_add_menu_update_to_queue submenu_index = <i> focus = 1
					else
						band_lobby_add_menu_update_to_queue submenu_index = <i> focus = 0
					endif
				else
					band_lobby_update_submenu_data submenu_index = <i> element = focus_type value = <focus_type>
					LaunchEvent Type = <focus_type> target = ($band_lobby_viewport_menus [<i>])
				endif
			elseif ((<skip_index_array> [<j>]) = <i>)
				GetArraySize \{skip_index_array}
				if ((<j> + 1) < <array_Size>)
					<j> = (<j> + 1)
				endif
			else
				GetArraySize ($<submenu_data>.update_queue)
				if (($<submenu_data>.is_updating) = 1)
					band_lobby_update_submenu_data submenu_index = <i> element = focus_type value = <focus_type>
				elseif (<array_Size> > 0)
					if (<focus_type> = focus)
						band_lobby_add_menu_update_to_queue submenu_index = <i> focus = 1
					else
						band_lobby_add_menu_update_to_queue submenu_index = <i> focus = 0
					endif
				else
					band_lobby_update_submenu_data submenu_index = <i> element = focus_type value = <focus_type>
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
			submenu_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	if (($<submenu_data>.occupied) = 0)
		return \{rgba_lt = [
				255
				255
				255
				255
			]
			rgba_md = grey_md
			rgba_dk = [
				255
				255
				255
				255
			]
			rgba_xdk = gh6_red}
	else
		switch <submenu_index>
			case 0
			return \{rgba_lt = p1_lt
				rgba_md = p1_md
				rgba_dk = p1_lt
				rgba_xdk = p1_md}
			case 1
			return \{rgba_lt = p2_lt
				rgba_md = p2_md
				rgba_dk = p2_lt
				rgba_xdk = p2_md}
			case 2
			return \{rgba_lt = p3_lt
				rgba_md = p3_md
				rgba_dk = p3_lt
				rgba_xdk = p3_md}
			case 3
			return \{rgba_lt = p4_lt
				rgba_md = p4_md
				rgba_dk = p4_lt
				rgba_xdk = p4_md}
			default
			return \{rgba_lt = [
					255
					255
					255
					0
				]
				rgba_md = [
					255
					255
					255
					0
				]
				rgba_dk = [
					255
					255
					255
					0
				]
				rgba_xdk = [
					255
					255
					255
					0
				]}
		endswitch
	endif
endscript

script bl_get_submenu_color \{submenu_index = !i1768515945}
	switch <submenu_index>
		case 0
		return \{rgba_lt = p1_lt
			rgba_md = p1_md
			rgba_dk = p1_lt
			rgba_xdk = p1_md}
		case 1
		return \{rgba_lt = p2_lt
			rgba_md = p2_md
			rgba_dk = p2_lt
			rgba_xdk = p2_md}
		case 2
		return \{rgba_lt = p3_lt
			rgba_md = p3_md
			rgba_dk = p3_lt
			rgba_xdk = p3_md}
		case 3
		return \{rgba_lt = p4_lt
			rgba_md = p4_md
			rgba_dk = p4_lt
			rgba_xdk = p4_md}
		default
		return \{rgba_lt = [
				255
				255
				255
				0
			]
			rgba_md = [
				255
				255
				255
				0
			]
			rgba_dk = [
				255
				255
				255
				0
			]
			rgba_xdk = [
				255
				255
				255
				0
			]}
	endswitch
endscript

script band_lobby_manage_band_members \{Player = !i1768515945
		submenu_index = !i1768515945
		action = !q1768515945
		forced_deselect_for_join = 0}
	printf channel = band_lobby qs(0x88184b2d) d = <submenu_index> c = <Player>
	if (<action> = select)
		net_counter_increment \{counter_name = globalcounter_edit_band_lineup}
	endif
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
		LaunchEvent Type = unfocus target = ($band_lobby_viewport_menus [<submenu_index>])
		managed_submenu_index = <submenu_index>
		band_lobby_get_player_submenu_index player_num = ($g_leader_player_num)
		band_leader_submenu_index = <submenu_index>
		getplayerinfo ($g_leader_player_num) controller
		<resolved_id> :se_setprops {
			exclusive_device = <controller>
			event_handlers = [
				{pad_back band_lobby_band_memebers_back params = {submenu_index = <managed_submenu_index>}}
				{pad_up audio_ui_band_lobby_sfx_logic params = {player_num = <Player> up = 1}}
				{pad_down audio_ui_band_lobby_sfx_logic params = {player_num = <Player> down = 1}}
				{pad_back audio_ui_band_lobby_sfx_logic params = {player_num = <Player> back = 1}}
				{pad_right audio_ui_band_lobby_sfx_logic params = {player_num = <Player> up = 1}}
				{pad_left audio_ui_band_lobby_sfx_logic params = {player_num = <Player> down = 1}}
			]
			replace_handlers
		}
		band_lobby_set_exclusive_devices_on_submenus controller = <controller>
		<resolved_id> :SetTags managing = 1
		LaunchEvent Type = focus target = <resolved_id> data = {child_index = <managed_submenu_index>}
		if (<action> = deselect)
			band_lobby_update_submenu_data submenu_index = <managed_submenu_index> element = is_managed value = 0
			formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <managed_submenu_index>
			if (0 = <forced_deselect_for_join>)
				persistent_band_get_index_from_player Player = <Player>
				if (($g_persistent_band_data [<index>].building) = 0)
					band_lobby_unmask_viewport submenu_index = <managed_submenu_index>
				endif
			endif
			if (1 = ($<submenu_data>.occupied))
				band_lobby_get_player_color submenu_index = <managed_submenu_index>
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
			band_lobby_update_submenu_data submenu_index = <managed_submenu_index> element = menu_indices value = <array>
			band_lobby_change_menu action = back menu = ($<submenu_data>.return_menu) Player = <Player> submenu_index = <managed_submenu_index>
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
		band_lobby_manage_band_members action = deselect Player = ($<submenu_data>.Player) submenu_index = <managed_submenu>
	endif
	if ScreenElementExists \{id = band_lobby_desc_id}
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
			printf \{qs(0x946eaeb8)}
			if <resolved_id> :GetSingleTag managing
				if (<managing> = 1)
					printf \{qs(0x7b12c908)}
					band_lobby_get_player_submenu_index player_num = ($g_leader_player_num)
					if (-1 != <submenu_index>)
						band_lobby_band_memebers_back submenu_index = <submenu_index>
						band_lobby_add_menu_update_to_queue submenu_index = <submenu_index> action = forward focus = 1
					endif
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
			submenu_index
		]
		all}
	if ($allow_controller_for_all_instruments = 1)
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
		getplayerinfo ($<submenu_data>.Player) part
		switch (<part>)
			case guitar
			case bass
			band_lobby_change_menu action = back menu = forced_instruments Player = <Player> submenu_index = <submenu_index> no_forced
			case drum
			case vocals
			band_lobby_leave_forced_flow Player = <Player> submenu_index = <submenu_index>
		endswitch
	elseif band_lobby_isguitarcontroller Player = <Player> submenu_index = <submenu_index>
		band_lobby_change_menu action = back menu = forced_instruments Player = <Player> submenu_index = <submenu_index> no_forced
	else
		band_lobby_leave_forced_flow Player = <Player> submenu_index = <submenu_index>
	endif
endscript

script band_lobby_forced_difficulty_back 
	RequireParams \{[
			Player
			submenu_index
		]
		all}
	if ($allow_controller_for_all_instruments = 1)
		formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
		getplayerinfo ($<submenu_data>.Player) part
		switch (<part>)
			case guitar
			case bass
			case drum
			band_lobby_change_menu action = back menu = forced_lefty_flip Player = <Player> submenu_index = <submenu_index> no_forced
			case vocals
			band_lobby_vocals_forced_menu Player = <Player> action = back previous_menu = forced_difficulty submenu_index = <submenu_index>
		endswitch
	elseif band_lobby_check_is_guitar_or_drum_controller Player = <Player> submenu_index = <submenu_index>
		band_lobby_change_menu action = back menu = forced_lefty_flip Player = <Player> submenu_index = <submenu_index> no_forced
	elseif band_lobby_isvocalscontroller Player = <Player> submenu_index = <submenu_index>
		band_lobby_vocals_forced_menu Player = <Player> action = back previous_menu = forced_difficulty submenu_index = <submenu_index>
	else
		ScriptAssert \{qs(0xd0b915fb)}
	endif
endscript

script band_lobby_vocals_forced_menu 
	RequireParams \{[
			Player
			action
			submenu_index
			previous_menu
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%i' i = <submenu_index>
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
				band_lobby_leave_forced_flow Player = <Player> submenu_index = <submenu_index>
				return
			endif
			case forced_vocal_highway
			if (<show_mic_preference> = true)
				menu = forced_mic_preference
			else
				band_lobby_leave_forced_flow Player = <Player> submenu_index = <submenu_index>
				return
			endif
		endswitch
	endif
	if (<menu> = NULL)
		SoftAssert \{qs(0x1dc71b34)}
	endif
	band_lobby_change_menu action = <action> menu = <menu> Player = <Player> submenu_index = <submenu_index> no_forced
endscript

script band_lobby_forced_vocal_highway_back 
	RequireParams \{[
			Player
			submenu_index
		]
		all}
	band_lobby_change_menu action = back menu = forced_mic_preference Player = <Player> submenu_index = <submenu_index> no_forced
endscript

script band_lobby_build_select_venue_submenu 
	printf \{channel = band_lobby
		qs(0xdee4a4c9)}
	check_venue_unlocks
	getplayerinfo ($g_leader_player_num) controller
	get_savegame_from_controller controller = <controller>
	submenu_states = $band_lobby_submenu_states
	array = []
	GetArraySize \{$LevelZoneArray}
	array_count = 0
	begin
	level_checksum = ($LevelZoneArray [<array_count>])
	if is_venue_unlocked venue = <level_checksum> savegame = <savegame>
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
					submenu_index = <submenu_index>
				}
			}
		}
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
			submenu_index = <submenu_index>
		}
	}
	<submenu_states> = {<submenu_states> select_venue = <venue_options>}
	Change band_lobby_submenu_states = <submenu_states>
	band_lobby_change_menu action = forward menu = select_venue Player = <Player> submenu_index = <submenu_index>
endscript

script band_lobby_select_band_member 
	RequireParams \{[
			submenu_index
		]
		all}
	printf channel = band_lobby qs(0x3a72a194) c = <submenu_index>
	managed_submenu_index = <submenu_index>
	band_lobby_get_player_submenu_index player_num = ($g_leader_player_num)
	band_leader_submenu_index = <submenu_index>
	formatText checksumName = managing_submenu_data 'band_lobby_submenu_data_%d' d = <band_leader_submenu_index>
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <managed_submenu_index>
	if (<managed_submenu_index> = <band_leader_submenu_index>)
		audio_ui_band_lobby_sfx_logic player_num = ($g_leader_player_num) choose = 1
		band_lobby_band_memebers_back submenu_index = <band_leader_submenu_index>
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
					audio_ui_band_lobby_sfx_logic player_num = ($g_leader_player_num) error = 1
					return
					default
					can_manage = 1
					managed_menu = manage_member
				endswitch
			endif
		endif
		printstruct {} a = $<submenu_data>
		if (<can_manage> = 1)
			audio_ui_band_lobby_sfx_logic player_num = ($g_leader_player_num) choose = 1
			if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
				band_lobby_change_focus_submenu_all \{focus_type = unfocus}
				LaunchEvent Type = unfocus target = <resolved_id>
				array = []
				if (<band_leader_submenu_index> < <managed_submenu_index>)
					AddArrayElement array = <array> element = <band_leader_submenu_index>
					AddArrayElement array = <array> element = <managed_submenu_index>
				else
					AddArrayElement array = <array> element = <managed_submenu_index>
					AddArrayElement array = <array> element = <band_leader_submenu_index>
				endif
				band_lobby_change_focus_submenu_all focus_type = focus skip_index_array = <array>
				band_lobby_update_submenu_data submenu_index = <managed_submenu_index> element = is_managed value = 1
				persistent_band_get_index_from_player Player = ($<submenu_data>.Player)
				if (($g_persistent_band_data [<index>].building) = 0)
					band_lobby_unmask_viewport submenu_index = <managed_submenu_index>
				endif
				if band_lobby_get_forced_menu submenu_index = <managed_submenu_index>
					band_lobby_update_submenu_data submenu_index = <managed_submenu_index> element = return_menu value = <forced_menu>
				else
					band_lobby_update_submenu_data submenu_index = <managed_submenu_index> element = return_menu value = <return_menu>
				endif
				set_chosen_character_id Player = ($<submenu_data>.Player) id = None
				band_lobby_refresh_band_leader_characters \{no_refresh}
				persistent_band_refresh_changed_characters
				if (<forced_flow> = 1)
					band_lobby_change_menu action = forward menu = <managed_menu> Player = ($<managing_submenu_data>.Player) submenu_index = <managed_submenu_index> no_forced
				else
					band_lobby_change_menu action = forward menu = <managed_menu> Player = ($<managing_submenu_data>.Player) submenu_index = <managed_submenu_index>
				endif
			endif
		else
			audio_ui_band_lobby_sfx_logic player_num = ($g_leader_player_num) error = 1
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
			submenu_index
		]
		all}
	can_continue = 0
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
		getplayerinfo <Player> controller
		if CheckForSignIn controller_index = <controller> dont_set_primary network_platform_only
			if isxenonorwindx
				if NOT NetSessionFunc func = xenonisguest params = {controller_index = <controller>}
					can_continue = 1
				endif
			elseif isps3
				can_continue = 1
			endif
		endif
	endif
	if (<can_continue> = 1)
		audio_ui_band_lobby_sfx_logic player_num = <Player> choose = 1
		NetSessionFunc {
			Obj = friends
			func = begin_retrieve_friends_list
			params = {
				callback = band_lobby_friendslist_callback
				device_num = <controller>
				callback_params = {
					submenu_index = <submenu_index>
				}
			}
		}
		if NOT isps3
			band_lobby_really_create_friendslist container = <resolved_id> Player = <Player> controller = <controller>
		else
			band_lobby_pre_create_friendslist container = <resolved_id> Player = <Player> controller = <controller>
		endif
	else
		ui_sfx \{menustate = Generic
			uitype = warningmessage}
		if isxenonorwindx
			msg_checksum = not_connted_to_live
		else
			msg_checksum = signin_to_profile
		endif
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
			band_lobby_create_popup_menu {
				menu = change_profile
				Player = <Player>
				container = <resolved_id>
				msg_checksum = <msg_checksum>
			}
		endif
	endif
endscript

script band_lobby_really_create_friendslist 
	printf \{qs(0x2d3890e6)}
	band_lobby_create_popup_menu {
		menu = friendslist
		Player = <Player>
		container = <container>
	}
endscript

script band_lobby_pre_create_friendslist 
	printf \{qs(0xc2de23e7)}
	band_lobby_seamless_net_change {
		network = net_private
		Player = <Player>
		callback = band_lobby_really_create_friendslist
		callback_params = {
			Player = <Player>
			container = <container>
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
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_pu_cont_parent}
		audio_ui_band_lobby_sfx_logic player_num = <Player> choose = 1
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
					setplayerinfo <Player> in_game = 0
					band_lobby_update_submenu_data submenu_index = <submenu_index> element = occupied value = 0
					band_lobby_change_menu menu = searching action = back Player = <Player> submenu_index = <submenu_index> focus = 0
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
			band_lobby_change_menu menu = <new_menu> action = <action> Player = ($<submenu_data>.Player) submenu_index = (<submenu_indices> [<i>]) focus = 0
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
			if <condition> Player = <Player> submenu_index = <submenu_index> <params>
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
		if (vs = $g_lobby_state)
			<msg_checksum> = matchmaking_timeout_vs
		else
			<msg_checksum> = matchmaking_timeout_qp
		endif
		create_dialog_box {
			dlg_z_priority = 1000
			heading_text = ($band_lobby_strings.popup_title_matchmake)
			body_text = ($band_lobby_strings.<msg_checksum>)
			parent = root_window
			no_background
			options = [
				{
					func = net_matchmaking_searching_timeout_cleanup
					text = ($band_lobby_strings.button_continue)
				}
				{
					func = net_matchmaking_searching_timout_cancel
					text = ($band_lobby_strings.popup_cancel_mm)
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
	audio_ui_band_lobby_sfx_logic player_num = <Player> choose = 1
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

script band_lobby_check_show_instrument_option 
	printf channel = band_lobby qs(0x683bf2a1) p = <Player> v = <submenu_index>
	RequireParams \{[
			Player
			submenu_index
		]
		all}
	formatText checksumName = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	getplayerinfo ($<submenu_data>.Player) controller
	getplayerinfo ($<submenu_data>.Player) part
	if iscontrollerpluggedin controller = <controller>
		if band_lobby_isguitarcontroller Player = <Player> submenu_index = <submenu_index>
			return \{true}
		endif
	else
		if (<part> = guitar || <part> = bass)
			return \{true}
		endif
	endif
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
	printf \{channel = band_lobby
		qs(0x432cafa0)}
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
					if sendplayerappearancedata Player = <Player> flags = {all}
						SetArrayElement ArrayName = playercharacteridarray index = (<Player> -1) NewValue = {character_id = <character_id>}
						printf channel = band_lobby qs(0xd99aa37c) p = <i> i = <character_id>
					endif
				endif
				getnextplayer Player = <Player> local
				repeat <num_players>
			endif
		endif
	else
		break
	endif
	Wait \{1.0
		Seconds}
	repeat
endscript

script update_headset_status 
	headset_icon_alpha = 0
	has_headset = 0
	is_talking = 0
	begin
	<has_headset> = 0
	<is_talking> = 0
	if (NetSessionFunc Obj = voice func = hasheadset params = {player_xuid = <uid>})
		<has_headset> = 1
	endif
	if (<has_headset> = 1)
		if (NetSessionFunc Obj = voice func = istalking params = {player_xuid = <uid>})
			<is_talking> = 1
		endif
		if (<is_talking> = 1)
			headset_icon_alpha = 1.0
		else
			headset_icon_alpha = 0.5
		endif
	else
		headset_icon_alpha = 0
	endif
	if ScreenElementExists id = <obj_id>
		<obj_id> :se_setprops headset_icon_alpha = <headset_icon_alpha>
	endif
	Wait \{1.0
		Second}
	repeat
endscript

script bl_menu_layout_anim_in 
	if ScreenElementExists \{id = friends_feed_desc_id}
		friends_feed_desc_id :se_setprops \{alpha = 0.0}
	endif
	se_setprops \{band_lobby_viewport1_pos = (233.0, -555.0)
		band_lobby_viewport2_pos = (502.0, -575.0)
		band_lobby_viewport3_pos = (772.0, -625.0)
		band_lobby_viewport4_pos = (1042.0, -675.0)
		paper_bg_fade_alpha = 1.0
		time = 0.45000002
		motion = ease_in}
	se_waitprops
	SoundEvent \{event = audio_ui_band_lobby_animate_in}
	se_setprops \{band_lobby_viewport1_pos = (233.0, 385.0)
		band_lobby_viewport2_pos = (502.0, 410.0)
		band_lobby_viewport3_pos = (772.0, 395.0)
		band_lobby_viewport4_pos = (1042.0, 465.0)
		paper_bg_fade_alpha = 1.0
		time = 0.15
		motion = ease_out}
	se_waitprops
	SoundEvent \{event = audio_band_lobby_animate_in_hit}
	se_setprops \{band_lobby_viewport1_pos = (233.0, 335.0)
		band_lobby_viewport2_pos = (502.0, 325.0)
		band_lobby_viewport3_pos = (772.0, 350.0)
		band_lobby_viewport4_pos = (1042.0, 330.0)
		paper_bg_fade_alpha = 0.95
		time = 0.125
		motion = ease_in}
	se_waitprops
	se_setprops \{band_lobby_viewport1_pos = (233.0, 370.0)
		band_lobby_viewport2_pos = (502.0, 400.0)
		band_lobby_viewport3_pos = (772.0, 380.0)
		band_lobby_viewport4_pos = (1042.0, 385.0)
		paper_bg_fade_alpha = 0.5
		ticker_alpha = 0.0
		time = 0.1
		motion = ease_out}
	if ScreenElementExists \{id = friends_feed_desc_id}
		friends_feed_desc_id :se_setprops \{alpha = 0.0
			time = 0.1}
	endif
	se_waitprops
	se_setprops \{band_lobby_viewport1_pos = (233.0, 368.0)
		band_lobby_viewport2_pos = (502.0, 368.0)
		band_lobby_viewport3_pos = (772.0, 368.0)
		band_lobby_viewport4_pos = (1042.0, 368.0)
		paper_bg_fade_alpha = 0.0
		ticker_alpha = 0.5
		time = 0.25
		motion = ease_in}
	if ScreenElementExists \{id = friends_feed_desc_id}
		friends_feed_desc_id :se_setprops \{alpha = 0.5
			time = 0.25
			motion = smooth}
	endif
	se_waitprops
	se_setprops \{ticker_alpha = 1.0
		time = 0.5
		motion = smooth}
	if ScreenElementExists \{id = friends_feed_desc_id}
		friends_feed_desc_id :se_setprops \{alpha = 1.0
			time = 0.5
			motion = smooth}
	endif
	se_waitprops
endscript

script bl_toggle_player_menu_representation \{action = On}
	printf \{channel = band_lobby
		qs(0x01a338d9)}
	if screenelementexistssimpleid \{id = band_lobby_desc_id}
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu
				param = vand_viewport_vmenu}
			if countscreenelementchildren id = <vand_viewport_vmenu>
				<index> = 0
				begin
				if ResolveScreenElementID id = [
						{id = <vand_viewport_vmenu>}
						{index = <index>}
					]
					if (OFF = <action>)
						<resolved_id> :Obj_KillSpawnedScript Name = band_lobby_update_submenu_instrument
						<resolved_id> :Obj_KillSpawnedScript Name = band_lobby_update_gamertag
						<resolved_id> :Obj_KillSpawnedScript Name = band_lobby_update_leader_icon
						<resolved_id> :Obj_KillSpawnedScript Name = band_lobby_update_viewport_mask
						<resolved_id> :Obj_KillSpawnedScript Name = bl_update_menu_presence
					else
						<resolved_id> :Obj_SpawnScriptNow band_lobby_update_submenu_instrument params = {submenu_index = <index>}
						<resolved_id> :Obj_SpawnScriptNow band_lobby_update_gamertag params = {submenu_index = <index>}
						<resolved_id> :Obj_SpawnScriptNow band_lobby_update_leader_icon params = {submenu_index = <index>}
						<resolved_id> :Obj_SpawnScriptNow band_lobby_update_viewport_mask params = {submenu_index = <index>}
						<resolved_id> :Obj_SpawnScriptNow bl_update_menu_presence params = {submenu_index = <index>}
					endif
				endif
				<index> = (1 + <index>)
				repeat <num_children>
			endif
		endif
	endif
endscript

script bl_local_challenge_menu_change \{revert = 0
		focus_overide = -1}
	fastgetarraysize \{array = $band_lobby_viewport_menus}
	if (0 < <array_Size>)
		<submenu_index> = 0
		begin
		band_lobby_get_submenu_data submenu_index = <submenu_index> param = occupied
		band_lobby_get_submenu_data submenu_index = <submenu_index> param = Player
		if (1 = <revert>)
			if (1 = <occupied>)
				if playerinfoequals <Player> is_local_client = 1
					<menu> = main
				else
					<menu> = remote_player
				endif
			else
				<menu> = join
			endif
			<action> = back
			if (<focus_overide> = -1)
				<focus> = 1
			else
				<focus> = <focus_overide>
			endif
		else
			if (1 = <occupied>)
				if playerinfoequals <Player> is_local_client = 1
					<menu> = ps3_init
				else
					<menu> = ps3_init
				endif
			else
				<menu> = empty
			endif
			<action> = forward
			if (<focus_overide> = -1)
				<focus> = 0
			else
				<focus> = <focus_overide>
			endif
		endif
		band_lobby_change_menu {
			action = <action>
			menu = <menu>
			Player = <Player>
			submenu_index = <submenu_index>
			focus = <focus>
			no_forced
		}
		<submenu_index> = (1 + <submenu_index>)
		repeat <array_Size>
	endif
endscript

script bl_wait_and_update_chat_restrictions_message 
	waitseconds \{num_seconds = 3.0}
	if NOT NetSessionFunc \{Obj = voice
			func = voice_allowed}
		band_lobby_update_ticker \{msg_checksum = ps3_chat_warning_message
			msg_count = 3}
	endif
endscript
