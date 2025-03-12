
script band_lobby_setup_cameras 
	printf \{channel = band_lobby
		qs(0x6546bdc0)}
	menu_music_on
endscript

script band_lobby_update_button_helpers 
	printf \{channel = band_lobby
		qs(0x8a8318a6)}
	if gotparam \{menu}
		if (<menu> = generic_popup || <menu> = leave_lobby)
			return
		endif
	endif
	clean = true
	if gotparam \{menu}
		switch <menu>
			case playerslist
			case matchmaking
			case matchmaking_done
			clean = false
		endswitch
	endif
	if (<clean> = true)
		clean_up_user_control_helpers
	endif
	if gotparam \{menu}
		switch <menu>
			case playerslist
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			case matchmaking
			if (1 = $global_should_use_net_debugging)
				add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_debug_desirable) button = green z = 100000
			endif
			if netsessionfunc \{obj = party
					func = is_host}
				add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_cancel_search) button = red z = 100000
			endif
			case matchmaking_done
			gamemode_gettype
			if checksumequals a = <type> b = quickplay
				if band_lobby_can_toggle_guitar_bass
					add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_guitar_bass) button = blue z = 100000
				endif
			endif
			case teams
			if NOT innetgame
				add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_continue) button = green z = 100000
			endif
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_switch_team) button = blue z = 100000
			case friendslist
			getplayerinfo <player> controller
			add_gamertag_helper exclusive_device = <controller>
			if checkforsignin controller_index = <controller> dont_set_primary
				if ($g_career_search = null)
					if NOT innetgame
						if isps3
							if netsessionfunc \{obj = party
									func = is_party_session_available}
								add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_invite) button = green z = 100000
							endif
						else
							add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_invite) button = green z = 100000
						endif
					endif
				endif
			endif
			add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_back) button = red z = 100000
			if isxenonorwindx
				if netsessionfunc func = canviewprofile controller_index = <controller>
					add_user_control_helper text = ($band_lobby_strings.button_player_card) button = yellow z = 100000
				endif
			elseif isps3
				if netsessionfunc \{func = isoldenoughforonline}
					if NOT innetgame
						if ($g_career_search = null)
							add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_display_invtes) button = yellow z = 100000
						endif
					endif
				endif
			endif
			if screenelementexists \{id = band_lobby_popup_menu}
				getscreenelementchildren \{id = band_lobby_popup_menu}
				band_lobby_popup_menu :menu_getselectedindex
				if gotparam \{children}
					getarraysize <children>
					if (<array_size> > <selected_index>)
						(<children> [<selected_index>]) :band_lobby_popup_begin_polling_for_rock_record controlling_player = <player>
					endif
				endif
			endif
			if isxenonorwindx
				netsessionfunc \{obj = plat_party
					func = get_num_party_players}
				if (<num_plat_party_players> = 0)
				else
					add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_invite_plat_party) button = orange z = 100000
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
		if screenelementexists \{id = band_lobby_desc_id}
			if band_lobby_desc_id :desc_resolvealias \{name = alias_band_viewport_vmenu}
				if NOT <resolved_id> :getsingletag managing
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
						if ($g_career_search = null)
							if NOT innetgame
								if netsessionfunc \{obj = party
										func = is_host}
									add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_search) button = orange z = 100000
									add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_play) button = start z = 100000
								endif
							else
								if ishost
									add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_play) button = start z = 100000
								endif
							endif
						else
							if netsessionfunc \{obj = party
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
						add_user_control_helper controller = <controller> text = ($band_lobby_strings.button_search) button = orange z = 100000
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
	if (gman_goalisactive goal = career)
		quick_remove_goal \{goal_name = career}
	endif
	songlist_clear_playlist
	generic_event_back \{nosound = 1
		state = uistate_mainmenu}
endscript

script band_lobby_create_viewport_and_menus 
	printf \{channel = band_lobby
		qs(0x16f3dc73)}
	requireparams \{[
			viewport_vmenu
		]
		all}
	i = 0
	begin
	resolvescreenelementid id = [
		{id = <viewport_vmenu>}
		{index = <i>}
	]
	desc_id = <resolved_id>
	removeparameter \{resolved_id}
	band_lobby_get_player_color viewport = <i>
	if screenelementexists id = <desc_id>
		formattext textname = player_num qs(0x48c6d14c) d = (<i> + 1)
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
		<desc_id> :obj_spawnscriptnow band_lobby_update_submenu_instrument params = {submenu_index = <i>}
		<desc_id> :obj_spawnscriptnow band_lobby_update_gamertag params = {submenu_index = <i>}
		<desc_id> :obj_spawnscriptnow band_lobby_update_leader_icon params = {submenu_index = <i>}
		<desc_id> :obj_spawnscriptnow band_lobby_update_menu_loop params = {submenu_index = <i>}
		if isps3
			band_lobby_update_submenu_data submenu_index = <i> element = menu value = ps3_init
		endif
	endif
	if band_lobby_desc_id :desc_resolvealias \{name = alias_character_window_hmenu}
		resolvescreenelementid id = [
			{id = <resolved_id>}
			{index = <i>}
		]
		character_window_cont_id = <resolved_id>
		removeparameter \{resolved_id}
		if screenelementexists id = <character_window_cont_id>
			formattext checksumname = viewport 'band_viewport_%i' i = <i>
			formattext checksumname = viewport_texture 'viewport%i' i = <i>
			createscreenelement {
				id = <viewport>
				type = viewportelement
				parent = <character_window_cont_id>
				texture = <viewport_texture>
				dims = (220.0, 405.0)
				just = [left top]
				pos = (4.0, 0.0)
				z_priority = 5
				priority = -1000
				style = band_viewports
				capability = $band_viewport_capabilities
				alpha = 1
			}
			band_lobby_play_viewport_camera {
				viewport_index = <i>
			}
			tod_proxim_update_lightfx fxparam = $lobby_viewport_tod_manager viewport = <viewport> time = 0.0
			venue_screenfx viewport = <viewport>
			if screenfx_fxinstanceexists viewport = <viewport> name = motion_blur
				screenfx_removefxinstance viewport = <viewport> name = motion_blur
			endif
		endif
	endif
	<desc_id> :desc_resolvealias name = alias_viewport_vmenu param = resolved_id
	if screenelementexists id = <resolved_id>
		setarrayelement arrayname = band_lobby_viewport_menus globalarray index = <i> newvalue = <resolved_id>
		band_lobby_add_menu_update_to_queue submenu_index = <i> focus = 0
		removeparameter \{resolved_id}
	endif
	<i> = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
endscript

script band_lobby_create_submenus_remote 
	requireparams \{[
			remote_players_menu
		]
		all}
	printf \{channel = band_lobby
		qs(0xa33e18fa)}
	i = 0
	begin
	resolvescreenelementid id = [
		{id = <remote_players_menu>}
		{index = <i>}
	]
	if screenelementexists id = <resolved_id>
		formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = (<i> + 4)
		<resolved_id> :obj_spawnscript band_lobby_update_remote_ui_loop params = {submenu_data = <submenu_data>}
		removeparameter \{resolved_id}
	endif
	i = (<i> + 1)
	repeat 4
endscript

script band_lobby_update_remote_ui_loop 
	requireparams \{[
			submenu_data
		]
		all}
	printf \{channel = band_lobby
		qs(0x05523af2)}
	obj_getid
	occupied = 0
	update = 0
	text = qs(0x00000000)
	begin
	if (($<submenu_data>.occupied) = 1)
		getplayerinfo ($<submenu_data>.player) gamertag
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
			if resolvescreenelementid id = {<objid> child = gamertag}
				<resolved_id> :se_setprops text = <text> alpha = <alpha>
			endif
			update = 0
		endif
	else
		if (($<submenu_data>.occupied) != <occupied>)
			text = qs(0x00000000)
			alpha = 0.0
			if resolvescreenelementid id = {<objid> child = gamertag}
				<resolved_id> :se_setprops text = <text> alpha = <alpha>
			endif
			occupied = ($<submenu_data>.occupied)
		endif
	endif
	wait \{1
		second}
	repeat
endscript

script band_lobby_play_viewport_camera 
	printf \{channel = band_lobby
		qs(0x757cda63)}
	requireparams \{[
			viewport_index
		]
		all}
	if NOT gotparam \{viewport_cam}
		formattext checksumname = viewport_cam 'band_viewport_cam_%i' i = <viewport_index>
	endif
	if NOT gotparam \{viewport}
		formattext checksumname = viewport 'band_viewport_%i' i = <viewport_index>
	endif
	if NOT screenelementexists id = <viewport>
		return
	endif
	killcamanim name = <viewport_cam>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	band_lobby_get_character_id player = ($<submenu_data>.player)
	if NOT gotparam \{lock_to_target}
		getplayerinfo ($<submenu_data>.player) band_member out = lock_to_target
	endif
	if NOT objectexists id = <lock_to_target>
		return
	endif
	getplayerinfo ($<submenu_data>.player) part
	if (<part> = drum)
		pos_h = (1.0, 0.0, 0.0)
	else
		pos_h = (1.5, 0.0, 0.0)
	endif
	if <lock_to_target> :modelbuilder_getavatarname
		offset = (0.0, -0.4)
		dist = 0.78
	else
		offset = (0.0, -0.7)
		if (<character_id> = gh_rocker_lars)
			dist = 0.71999997
		else
			dist = 0.65000004
		endif
	endif
	switch <viewport_index>
		case 0
		playigccam {
			name = <viewport_cam>
			viewport = <viewport>
			lockto = <lock_to_target>
			locktobone = control_root
			pos = (<pos_h> + (0.0, 1.5, 0.1))
			quat = (0.70710003, 0.70710003, 0.0)
			fov = 45
			lookat = <lock_to_target>
			lookatbone = bone_neck
			screenoffset = <offset>
			distfromlookat = (<dist> + 0.05)
			play_hold
		}
		case 1
		playigccam {
			name = <viewport_cam>
			viewport = <viewport>
			lockto = <lock_to_target>
			locktobone = control_root
			pos = (<pos_h> + (0.0, 1.5, 0.0))
			quat = (0.70710003, 0.70710003, 0.0)
			fov = 45
			lookat = <lock_to_target>
			lookatbone = bone_neck
			screenoffset = <offset>
			distfromlookat = (<dist> + 0.01)
			play_hold
		}
		case 2
		playigccam {
			name = <viewport_cam>
			viewport = <viewport>
			lockto = <lock_to_target>
			locktobone = control_root
			pos = (<pos_h> + (0.0, 1.5, -0.1))
			quat = (0.70710003, 0.70710003, 0.0)
			fov = 45
			lookat = <lock_to_target>
			lookatbone = bone_neck
			screenoffset = <offset>
			distfromlookat = <dist>
			play_hold
		}
		case 3
		playigccam {
			name = <viewport_cam>
			viewport = <viewport>
			lockto = <lock_to_target>
			locktobone = control_root
			pos = (<pos_h> + (0.0, 1.5, 0.0))
			quat = (0.70710003, 0.70710003, 0.0)
			fov = 45
			lookat = <lock_to_target>
			lookatbone = bone_neck
			screenoffset = <offset>
			distfromlookat = (<dist> + 0.02)
			play_hold
		}
		default
		scriptassert \{qs(0xb8d70593)}
	endswitch
	<lock_to_target> :obj_setvisibility viewport = <viewport> exclusive
endscript

script band_lobby_persistent_band_mask 
	requireparams \{[
			player
		]
		all}
	if ($in_band_lobby = 0)
		return
	endif
	band_lobby_get_player_submenu_index player_num = <player>
	if (<submenu_index> >= 0)
		band_lobby_mask_viewport viewport_index = <submenu_index>
	endif
endscript

script band_lobby_mask_viewport 
	requireparams \{[
			viewport_index
		]
		all}
	if ($in_band_lobby = 0 || viewport_index > 3)
		return
	endif
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	element_id = ($<submenu_data>.desc_id)
	if screenelementexists id = <element_id>
		<element_id> :se_setprops block_viewport_alpha = 1
	endif
endscript

script band_lobby_persistent_band_unmask 
	requireparams \{[
			player
		]
		all}
	if ($in_band_lobby = 0)
		return
	endif
	band_lobby_get_player_submenu_index player_num = <player>
	if (<submenu_index> >= 0)
		band_lobby_unmask_viewport viewport_index = <submenu_index> time = <time>
	endif
endscript

script band_lobby_unmask_viewport \{time = 0.1}
	requireparams \{[
			viewport_index
		]
		all}
	if ($in_band_lobby = 0 || viewport_index > 3)
		return
	endif
	killspawnedscript \{name = band_lobby_mask_viewport}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	element_id = ($<submenu_data>.desc_id)
	if screenelementexists id = <element_id>
		if ($<submenu_data>.occupied = 1 || $<submenu_data>.is_managed = 1)
			<element_id> :se_setprops block_viewport_alpha = 0.0 time = <time>
		else
			<element_id> :se_setprops block_viewport_alpha = 0.6 time = <time>
		endif
	endif
endscript

script band_lobby_scroll_submenu 
	requireparams \{[
			dir
			player
			viewport_index
		]
		all}
	obj_getid
	<objid> :menu_getselectedindex
	<objid> :se_getprops pos
	if getscreenelementchildren id = <objid>
		formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
		getarraysize <children>
		if (<dir> = up)
			printf \{channel = sfx
				qs(0xa49092fb)}
			if NOT (<selected_index> <= 0)
				gh5_band_screen_ui_sound player_num = <player> up = 1
				if screenelementexists id = (<children> [<selected_index>])
					launchevent type = unfocus target = <objid>
				endif
				menu_changeselection \{up}
				<selected_index> = (<selected_index> - 1)
				wait \{2
					gameframes}
				($<submenu_data>.desc_id) :obj_spawnscriptnow band_lobby_animate_scroll_bar params = {num_menu_items = <array_size> selected_index = <selected_index>}
				($<submenu_data>.desc_id) :obj_spawnscriptnow band_lobby_animate_scroll_bar_arrows params = {dir = <dir>}
				if (<selected_index> > 0 && <selected_index> < (<array_size> - 2))
					<objid> :se_waitprops
					getscreenelementposition id = <objid>
					pos = ((0.0, 20.0) - ((0.0, 33.0) * <selected_index>))
					<pos> = (<pos> + (<screenelementpos>.(1.0, 0.0) * (1.0, 0.0)))
					<objid> :se_setprops pos = <pos> time = 0.1
					<objid> :se_waitprops
				else
					wait \{0.1
						seconds}
				endif
				if band_lobby_does_popup_exist
					return
				elseif ui_event_exists_in_stack \{above = 'band_lobby'
						name = 'band_lobby_popup'}
					return
				endif
				if screenelementexists id = (<children> [<selected_index>])
					launchevent type = focus target = <objid> data = {child_index = <selected_index>}
				endif
			endif
		elseif (<dir> = down)
			printf \{channel = sfx
				qs(0x53e69f18)}
			if ((<selected_index> + 1) < <array_size>)
				gh5_band_screen_ui_sound player_num = <player> down = 1
				if screenelementexists id = (<children> [<selected_index>])
					launchevent type = unfocus target = <objid>
				endif
				menu_changeselection \{down}
				<selected_index> = (<selected_index> + 1)
				wait \{2
					gameframes}
				($<submenu_data>.desc_id) :obj_spawnscriptnow band_lobby_animate_scroll_bar params = {num_menu_items = <array_size> selected_index = <selected_index>}
				($<submenu_data>.desc_id) :obj_spawnscriptnow band_lobby_animate_scroll_bar_arrows params = {dir = <dir>}
				if (<selected_index> > 0 && <selected_index> < (<array_size> - 2))
					<objid> :se_waitprops
					getscreenelementposition id = <objid>
					pos = ((0.0, 20.0) - ((0.0, 33.0) * <selected_index>))
					<pos> = (<pos> + (<screenelementpos>.(1.0, 0.0) * (1.0, 0.0)))
					<objid> :se_setprops pos = <pos> time = 0.1
					<objid> :se_waitprops
				else
					wait \{0.1
						seconds}
				endif
				if band_lobby_does_popup_exist
					return
				elseif ui_event_exists_in_stack \{above = 'band_lobby'
						name = 'band_lobby_popup'}
					return
				endif
				if screenelementexists id = (<children> [<selected_index>])
					launchevent type = focus target = <objid> data = {child_index = <selected_index>}
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
	requireparams \{[
			num_menu_items
			selected_index
		]
		all}
	printstruct <...> channel = band_lobby
	obj_getid
	<objid> :desc_resolvealias name = 0x742e70f0
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
	requireparams \{[
			dir
		]
		all}
	obj_getid
	if (<dir> = up)
		<objid> :se_setprops scroll_arrow_up_scale = 1.5 time = 0.05
	elseif (<dir> = down)
		<objid> :se_setprops scroll_arrow_dn_scale = 1.5 time = 0.05
	endif
	<objid> :se_waitprops
	if (<dir> = up)
		<objid> :se_setprops scroll_arrow_up_scale = 1.0 time = 0.05
	elseif (<dir> = down)
		<objid> :se_setprops scroll_arrow_dn_scale = 1.0 time = 0.05
	endif
	<objid> :se_waitprops
endscript

script band_lobby_animate_vmenu 
	printf \{channel = band_lobby
		qs(0xc45dfb9e)}
	requireparams \{[
			dir
		]
		all}
	obj_getid
	<objid> :se_getprops pos
	if (<dir> = up)
		<objid> :se_setprops pos = (<pos> + (0.0, 33.0)) time = 0.1
	elseif (<dir> = down)
		<objid> :se_setprops pos = (<pos> + (0.0, -33.0)) time = 0.1
	endif
	<objid> :se_waitprops
endscript

script band_lobby_submenu_change_focus 
	requireparams \{[
			player
			viewport_index
			focus_type
		]
		all}
	printf channel = band_lobby qs(0x4643faf2) p = <player>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	obj_getid
	<objid> :gettags
	if (<focus_type> = focus)
		resolvescreenelementid id = [
			{id = <objid>}
			{local_id = button_icon}
		]
		if screenelementexists id = <resolved_id>
			getplayerinfo <player> controller
			user_control_helper_get_buttonchar button = green controller = <controller>
			<resolved_id> :se_setprops text = <buttonchar>
			removeparameter \{resolved_id}
		endif
		resolvescreenelementid id = [
			{id = <objid>}
			{local_id = text}
		]
		if screenelementexists id = <resolved_id>
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
			removeparameter \{resolved_id}
		endif
		resolvescreenelementid id = [
			{id = <objid>}
			{local_id = highlight_bar}
		]
		if screenelementexists id = <resolved_id>
			<resolved_id> :se_setprops alpha = 1.0 time = 0.1
		endif
		resolvescreenelementid id = [
			{id = <objid>}
			{local_id = text}
		]
		if screenelementexists id = <resolved_id>
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
		<objid> :se_getparentid
		<parent_id> :getsingletag last_item_selected
		if NOT gotparam \{last_item_selected}
			<last_item_selected> = none
		endif
		if (<last_item_selected> != <objid>)
			if gotparam \{additional_focus_script}
				<additional_focus_script> <additional_focus_params>
			endif
		endif
		<parent_id> :settags last_item_selected = <objid>
	elseif (<focus_type> = unfocus)
		resolvescreenelementid id = [
			{id = <objid>}
			{local_id = button_icon}
		]
		if screenelementexists id = <resolved_id>
			<resolved_id> :se_setprops text = qs(0x00000000)
			removeparameter \{resolved_id}
		endif
		resolvescreenelementid id = [
			{id = <objid>}
			{local_id = text}
		]
		if screenelementexists id = <resolved_id>
			band_lobby_get_player_color viewport = <viewport_index>
			removeparameter \{resolved_id}
		endif
		resolvescreenelementid id = [
			{id = <objid>}
			{local_id = highlight_bar}
		]
		if screenelementexists id = <resolved_id>
			<resolved_id> :se_setprops alpha = 0.0 time = 0.1
		endif
		resolvescreenelementid id = [
			{id = <objid>}
			{local_id = text}
		]
		if screenelementexists id = <resolved_id>
			if (<selectable> = 1)
				<resolved_id> :se_setprops rgba = ($uicolorref_palette.ntscwhite.rgba)
			else
				<resolved_id> :se_setprops rgba = ($uicolorref_palette.grey_md.rgba)
			endif
		endif
		if gotparam \{additional_unfocus_script}
			<additional_unfocus_script> <additional_unfocus_params>
		endif
	endif
endscript

script band_lobby_viewport_change_focus 
	printf \{channel = band_lobby
		qs(0x0b83e9a1)}
	requireparams \{[
			focus_type
			submenu_index
		]
		all}
	obj_getid
	resolvescreenelementid id = [
		{id = <objid>}
		{local_id = viewport_menu}
		{local_id = viewport_menu_cont}
		{local_id = menu_bg}
	]
	if screenelementexists id = <resolved_id>
		if (<focus_type> = focus)
			<resolved_id> :se_setprops rgba = [28 99 108 255]
		elseif (<focus_type> = unfocus)
			band_lobby_get_player_color viewport = <submenu_index>
			<resolved_id> :se_setprops rgba = [0 0 0 255]
		endif
	endif
	if (<focus_type> = focus)
		<objid> :se_setprops frame_highlight_alpha = 1.0
		if <objid> :desc_resolvealias name = alias_lobby_frame_hl
			<resolved_id> :obj_spawnscript 0x46ef0e03
		endif
	elseif (<focus_type> = unfocus)
		<objid> :se_setprops frame_highlight_alpha = 0.0
		if <objid> :desc_resolvealias name = alias_lobby_frame_hl
			<resolved_id> :obj_killspawnedscript name = 0x46ef0e03
		endif
	endif
	if (<focus_type> = unfocus)
		this_index = <submenu_index>
		if get_submenu_index_from_player player = ($g_leader_player_num)
			if (<this_index> != <submenu_index>)
				launchevent type = focus target = ($band_lobby_viewport_menus [<this_index>])
			endif
		endif
		<submenu_index> = <this_index>
	endif
endscript

script 0x1550adfb 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	begin
	if screenelementexists \{id = band_lobby_desc_id}
		break
	endif
	wait \{1
		gameframe}
	repeat 100
	viewport_index = 0
	begin
	band_lobby_get_submenu_data viewport_index = <viewport_index> param = occupied
	occupied = <submenu_data>
	if (<occupied> = 1)
		if screenelementexists \{id = band_lobby_desc_id}
			if band_lobby_desc_id :desc_resolvealias \{name = alias_band_viewport_vmenu}
				getscreenelementchildren id = <resolved_id>
				<viewport> = (<children> [<viewport_index>])
				band_lobby_get_player_color viewport = <viewport_index>
				<viewport> :se_setprops lobby_frame_sm_rgba = <rgba_md> time = 0.2
			endif
		endif
	endif
	<viewport_index> = (<viewport_index> + 1)
	repeat 4
endscript

script ui_band_lobby_anim_in 
	printf \{channel = band_lobby
		qs(0xf1e10cb5)}
	if ($g_suppress_anim_in = 0)
		if (($g_lobby_net_state = net_private) || ($g_lobby_net_state = net_public))
			if NOT ininternetmode
				if NOT band_lobby_net_setup
					change \{g_lobby_net_state = local}
				endif
				band_lobby_update_lobby_title
				band_lobby_update_button_helpers
				band_lobby_update_ticker \{msg_checksum = current_state}
			else
				band_lobby_poll_party_object
			endif
		else
			wait \{3
				gameframes}
		endif
		band_lobby_change_viewport_menus
		if isps3
			if NOT netsessionfunc \{obj = voice
					func = voice_allowed}
				band_lobby_update_ticker \{msg_checksum = ps3_chat_warning_message}
			endif
		endif
		if NOT ($g_band_lobby_error_msg = null)
			if band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent}
				band_lobby_create_popup_menu {
					menu = error_msg
					player = ($g_leader_player_num)
					container = <resolved_id>
				}
			endif
		endif
	endif
	change \{g_suppress_anim_in = 0}
endscript

script ui_band_lobby_anim_out 
endscript

script band_lobby_change_viewport_menus 
	printf \{channel = band_lobby
		qs(0xdcd7fe40)}
	getarraysize ($band_lobby_viewport_menus)
	i = 0
	begin
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	if NOT ($g_band_lobby_error_msg = null)
		menu = join
		focus = 0
	else
		getplayerinfo ($<submenu_data>.player) in_game
		getplayerinfo ($<submenu_data>.player) is_local_client
		if (<in_game> = 1)
			if (<is_local_client> = 1)
				getplayerinfo ($<submenu_data>.player) controller
				if band_lobby_controller_can_save controller = <controller>
					load_savegame = 1
				endif
				if isps3
					removeparameter \{load_savegame}
				endif
				get_savegame_from_controller controller = <controller>
				if get_savegame_has_saved_game savegame = <savegame>
					removeparameter \{load_savegame}
				endif
				if NOT is_autosave_on savegame = <savegame>
					removeparameter \{load_savegame}
				endif
				if demobuild
					removeparameter \{load_savegame}
				endif
				printstruct <...>
				if gotparam \{load_savegame}
					savegame_async_button_in savegame = <savegame> callback = lobby_mc_loading_callback data = {
						player = ($<submenu_data>.player)
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
				if innetgame
					focus = 0
				else
					focus = 1
				endif
			endif
		else
			if innetgame
				menu = empty
				focus = 0
			else
				menu = join
				focus = 1
			endif
		endif
	endif
	if screenelementexists id = ($band_lobby_viewport_menus [<i>])
		if playerinfoequals ($<submenu_data>.player) is_local_client = 1
			($band_lobby_viewport_menus [<i>]) :obj_spawnscriptnow band_lobby_change_menu params = {menu = <menu> action = forward player = ($<submenu_data>.player) viewport_index = <i> focus = <focus>}
		else
			($band_lobby_viewport_menus [<i>]) :obj_spawnscriptnow band_lobby_change_menu params = {menu = <menu> action = forward player = ($<submenu_data>.player) viewport_index = <i> focus = <focus> no_forced}
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script band_lobby_force_all_ready_players_to_main_menu 
	getarraysize ($band_lobby_viewport_menus)
	i = 0
	begin
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	if isscreenelementinfocus id = ($band_lobby_viewport_menus [<i>])
		focus = 1
	else
		focus = 0
	endif
	if (($<submenu_data>.occupied) = 1)
		if screenelementexists id = ($band_lobby_viewport_menus [<i>])
			if NOT band_lobby_is_in_forced_flow viewport_index = <i>
				array = ($<submenu_data>.menu_indices)
				setarrayelement \{arrayname = array
					index = 0
					newvalue = 0}
				setarrayelement \{arrayname = array
					index = 1
					newvalue = 0}
				setarrayelement \{arrayname = array
					index = 2
					newvalue = 0}
				band_lobby_update_submenu_data submenu_index = <i> element = menu_indices value = <array>
				($band_lobby_viewport_menus [<i>]) :obj_spawnscriptnow band_lobby_change_menu params = {menu = main action = back player = ($<submenu_data>.player) viewport_index = <i> focus = <focus>}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script band_lobby_is_in_forced_flow 
	requireparams \{[
			viewport_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	switch ($<submenu_data>.menu)
		case forced_difficulty
		case forced_instruments
		case forced_vocal_highway
		case forced_mic_preference
		case forced_lefty_flip
		return \{true}
		default
		return \{false}
	endswitch
	return \{false}
endscript

script band_lobby_get_forced_menu 
	requireparams \{[
			viewport_index
		]
		all}
	printf channel = band_lobby qs(0x3d1916c6) v = <viewport_index>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	if (($<submenu_data>.occupied) = 1)
		getplayerinfo ($<submenu_data>.player) is_local_client
		if (<is_local_client> = 1)
			getplayerinfo ($<submenu_data>.player) controller
			getplayerinfo ($<submenu_data>.player) part
			controller_type = none
			if NOT iscontrollerpluggedin controller = <controller>
				<controller_type> = <part>
			else
				if band_lobby_isguitarcontroller player = ($<submenu_data>.player) viewport_index = <viewport_index>
					<controller_type> = guitar
				elseif band_lobby_isdrumcontroller player = ($<submenu_data>.player) viewport_index = <viewport_index>
					<controller_type> = drum
				elseif band_lobby_isvocalscontroller player = ($<submenu_data>.player) viewport_index = <viewport_index>
					<controller_type> = vocals
				endif
			endif
			if ($allow_controller_for_all_instruments = 1)
				if (<part> = vocals)
					if band_lobby_should_show_mic_preference player = ($<submenu_data>.player)
						get_progression_instrument_user_option controller = <controller> part = vocals option = 'mic_preference'
						if (<user_option> = none)
							if ($skip_band_lobby_forced_flow = 0)
								return \{true
									forced_menu = forced_mic_preference}
							endif
						endif
					endif
					if band_lobby_should_force_highway_view player = ($<submenu_data>.player)
						get_progression_instrument_user_option controller = <controller> part = vocals option = 'highway_view'
						if (<user_option> = none)
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
				if (<user_option> = none)
					if ($skip_band_lobby_forced_flow = 0)
						return \{true
							forced_menu = forced_difficulty}
					endif
				endif
			elseif (<controller_type> = guitar || <controller_type> = bass)
				get_progression_instrument_user_option controller = <controller> option = 'guitar_bass_flip'
				guitar_bass_flip = <user_option>
				if (<guitar_bass_flip> = none)
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
				if (<user_option> = none)
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
				if (<user_option> = none)
					if ($skip_band_lobby_forced_flow = 0)
						return \{true
							forced_menu = forced_lefty_flip}
					endif
				endif
			elseif (<controller_type> = vocals)
				if band_lobby_should_show_mic_preference player = ($<submenu_data>.player)
					get_progression_instrument_user_option controller = <controller> part = vocals option = 'mic_preference'
					if (<user_option> = none)
						if ($skip_band_lobby_forced_flow = 0)
							return \{true
								forced_menu = forced_mic_preference}
						endif
					endif
				endif
				if band_lobby_should_force_highway_view player = ($<submenu_data>.player)
					get_progression_instrument_user_option controller = <controller> part = vocals option = 'highway_view'
					if (<user_option> = none)
						if ($skip_band_lobby_forced_flow = 0)
							return \{true
								forced_menu = forced_vocal_highway}
						endif
					endif
				endif
				part = vocals
				get_progression_instrument_user_option controller = <controller> part = <part> option = 'difficulty'
				if (<user_option> = none)
					if ($skip_band_lobby_forced_flow = 0)
						if band_lobby_should_force_highway_view player = ($<submenu_data>.player)
							return \{true
								forced_menu = forced_vocal_highway}
						else
							return \{true
								forced_menu = forced_difficulty}
						endif
					endif
				endif
			else
				scriptassert \{qs(0xd0b915fb)}
			endif
		endif
	endif
	return \{false}
endscript

script band_lobby_force_submenu_change_all \{submenu_data_match = occupied
		match_value = 0}
	requireparams \{[
			menu
		]
		all}
	printf \{channel = band_lobby
		qs(0xbb5cb6a8)}
	getarraysize ($band_lobby_viewport_menus)
	i = 0
	begin
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	if NOT gotparam \{focus}
		if isscreenelementinfocus id = ($band_lobby_viewport_menus [<i>])
			focus = 1
		else
			focus = 0
		endif
	endif
	if (($<submenu_data>.<submenu_data_match>) = <match_value>)
		if screenelementexists id = ($band_lobby_viewport_menus [<i>])
			($band_lobby_viewport_menus [<i>]) :obj_spawnscriptnow band_lobby_change_menu params = {menu = <menu> action = forward player = ($<submenu_data>.player) viewport_index = <i> focus = <focus>}
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script band_lobby_refresh_all_submenus 
	requireparams \{[
			type
		]
		all}
	printf \{channel = band_lobby
		qs(0xb8604599)}
	begin
	if NOT scriptisrunning \{band_lobby_update_menu}
		break
	endif
	wait \{0.2
		seconds}
	repeat
	wait \{1
		gameframe}
	if (<type> = local)
		client_type = 1
	elseif (<type> = remote)
		client_type = 0
	elseif (<type> = in_game)
		in_game = 1
	elseif (<type> = not_in_game)
		in_game = 0
	endif
	i = 0
	begin
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	if isscreenelementinfocus id = ($band_lobby_viewport_menus [<i>])
		return_focus = 1
	else
		return_focus = 0
	endif
	if gotparam \{client_type}
		if playerinfoequals ($<submenu_data>.player) is_local_client = <client_type>
			band_lobby_add_menu_update_to_queue submenu_index = <i> action = forward focus = <return_focus>
		endif
	elseif gotparam \{in_game}
		if playerinfoequals ($<submenu_data>.player) in_game = <in_game>
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
	requireparams \{[
			submenu_index
		]
		all}
	printf \{channel = band_lobby
		qs(0x3a31d224)}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	begin
	wait \{1
		gameframe}
	if (($<submenu_data>.is_updating) = 0)
		getarraysize ($<submenu_data>.update_queue)
		if (<array_size> = 0)
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
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	addarrayelement array = <array> element = <submenu_data>
	repeat ($g_num_lobby_local_submenus)
	getarraysize <array> param = num_updating_menus
	begin
	wait \{1
		gameframe}
	i = 0
	update_in_progress = 0
	begin
	submenu_data = (<array> [<i>])
	getarraysize ($<submenu_data>.update_queue)
	if (<array_size> > 0)
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
	requireparams \{[
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
	addarrayelement array = <update_queue> element = <new_menu_update>
	band_lobby_update_submenu_data submenu_index = <submenu_index> element = update_queue value = <array>
endscript

script band_lobby_update_menu_loop 
	requireparams \{[
			submenu_index
		]
		all}
	printf \{channel = band_lobby
		qs(0xf450d5b6)}
	onexitrun band_lobby_update_submenu_data params = {submenu_index = <submenu_index> element = update_queue value = []}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	begin
	if (($<submenu_data>.is_updating) = 0)
		getarraysize ($<submenu_data>.update_queue)
		if (<array_size> > 0)
			if screenelementexists id = ($<submenu_data>.desc_id)
				($<submenu_data>.desc_id) :obj_spawnscriptnow band_lobby_update_menu params = {($<submenu_data>.update_queue [0])}
			endif
			removearrayelement array = ($<submenu_data>.update_queue) index = 0
			band_lobby_update_submenu_data submenu_index = <submenu_index> element = update_queue value = <array>
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script band_lobby_update_menu 
	requireparams \{[
			submenu_index
		]
		all}
	printf channel = band_lobby qs(0xc35cca6d) v = <submenu_index>
	if screenelementexists id = ($band_lobby_viewport_menus [<submenu_index>])
		formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
		band_lobby_update_submenu_data submenu_index = <submenu_index> element = is_updating value = 1
		if isscreenelementinfocus id = ($band_lobby_viewport_menus [<submenu_index>])
			current_focus_value = ($<submenu_data>.focus_type)
			launchevent type = unfocus target = ($band_lobby_viewport_menus [<submenu_index>])
		else
			current_focus_value = ($<submenu_data>.focus_type)
		endif
		if gotparam \{action}
			band_lobby_create_new_submenu viewport_index = <submenu_index> action = <action>
		else
			if screenelementexists id = ($band_lobby_viewport_menus [<submenu_index>])
				destroyscreenelement id = ($band_lobby_viewport_menus [<submenu_index>]) preserve_parent
			endif
			new_vmenu = ($band_lobby_viewport_menus [<submenu_index>])
		endif
		menu = ($<submenu_data>.menu)
		band_lobby_get_player_color viewport = <submenu_index>
		($<submenu_data>.desc_id) :se_setprops subheading_text = ($band_lobby_submenu_states.<menu>.title)
		($<submenu_data>.desc_id) :se_setprops subheading_rgba = <rgba_md>
		if ($<submenu_data>.is_managed = 1)
			($<submenu_data>.desc_id) :se_setprops lobby_frame_sm_rgba = ($uicolorref_palette.red_md.rgba)
		else
			if (($<submenu_data>.occupied) = 0)
				($<submenu_data>.desc_id) :se_setprops lobby_frame_sm_rgba = [128 128 128 255] time = 0.2
			endif
		endif
		band_lobby_get_player_color viewport = <submenu_index>
		formattext checksumname = instrument_icon_rgba_prop 'instrument_icon_%d_rgba' d = (<submenu_index> + 1)
		lobby_props = {}
		addparam structure_name = lobby_props name = <instrument_icon_rgba_prop> value = <rgba_md>
		band_lobby_desc_id :se_setprops <lobby_props>
		band_lobby_get_num_menu_options player = ($<submenu_data>.player) submenu_index = <submenu_index>
		menu_options = ($band_lobby_submenu_states.<menu>.options)
		no_highlight_bar = false
		no_highlight_bar = ($band_lobby_submenu_states.<menu>.no_highlight_bar)
		if (<no_highlight_bar> = false)
			scrollbar_alpha = 1
		else
			scrollbar_alpha = 0
		endif
		($<submenu_data>.desc_id) :se_setprops scrollbar_alpha = <scrollbar_alpha> time = 0.1
		if ($<submenu_data>.is_managed = 1 && $<submenu_data>.occupied = 0)
			player = $g_leader_player_num
		else
			player = ($<submenu_data>.player)
		endif
		standard_params = {player = <player> viewport_index = <submenu_index>}
		getarraysize <menu_options>
		menu_items = <array_size>
		if (<array_size> > 0)
			j = 0
			begin
			if structurecontains structure = (<menu_options> [<j>]) condition
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
				if structurecontains structure = (<menu_options> [<j>]) is_selectable_condition
					if NOT (<menu_options> [<j>].is_selectable_condition) <standard_params>
						selectable = 0
					endif
				endif
				createscreenelement {
					parent = <new_vmenu>
					type = containerelement
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
				if (<no_highlight_bar> = false)
					createscreenelement {
						parent = <container_id>
						local_id = highlight_bar
						type = spriteelement
						texture = highlight_03
						just = [center center]
						alpha = 0.0
						dims = (395.0, 59.0)
						pos = (199.0, 26.0)
						scale = (1.0, 0.6)
						z_priority = 4
						rgba = p1_lt
					}
				endif
				text_nudge = (0.0, 0.0)
				if structurecontains structure = (<menu_options> [<j>]) texture
					createscreenelement {
						parent = <container_id>
						type = spriteelement
						texture = (<menu_options> [<j>].texture)
						pos = (0.0, 60.0)
						pos_anchor = [center center]
						just = [center center]
						autosizedims = true
						scale = (1.7294999, 1.0)
						z_priority = 4
					}
				endif
				if structurecontains structure = (<menu_options> [<j>]) desc_id
					createscreenelement {
						parent = <container_id>
						type = descinterface
						desc = (<menu_options> [<j>].desc_id)
						pos = (0.0, 45.0)
						pos_anchor = [center center]
						just = [center center]
						autosizedims = true
						scale = (1.7294999, 1.0)
						z_priority = 1
					}
					if structurecontains structure = (<menu_options> [<j>]) anim_script
						<id> :obj_spawnscriptnow (<menu_options> [<j>].anim_script)
					endif
				endif
				if structurecontains structure = (<menu_options> [<j>]) text
					if structurecontains structure = (<menu_options> [<j>]) text_params
						text = qs(0x874f5ede)
						tp_params = {}
						if structurecontains structure = (<menu_options> [<j>]) tp_params
							tp_params = (<menu_options> [<j>].tp_params)
						endif
						(<menu_options> [<j>].text_params) <standard_params> <tp_params>
						formattext textname = text (<menu_options> [<j>].text) <text_params>
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
							fit_width = `scale each line if larger`
							default
							fit_width = truncate
						endswitch
						createscreenelement {
							parent = <container_id>
							local_id = text
							type = textblockelement
							pos = (201.0, 3.5)
							dims = (355.0, 40.0)
							fit_width = <fit_width>
							fit_height = `scale down if larger`
							fit_scale_mode = `per axis`
							enable_min_scale = false
							font = fontgrid_text_a1
							rgba = <text_rgba>
							text = <text>
							just = [center top]
							internal_scale = 0.54
							internal_just = [center , center]
							z_priority = 5
						}
					else
						band_lobby_helperpilltext <standard_params>
						createscreenelement {
							parent = <container_id>
							type = menuelement
							pos = (201.0, -13.0)
							dims = (1.0, 100.0)
							just = [center top]
							internal_just = [center center]
							isvertical = false
							major_axis_fit = `expand if content larger`
						}
						h_menu_id = <id>
						createscreenelement {
							parent = <h_menu_id>
							local_id = text
							type = textblockelement
							dims = (1.0, 8.0)
							font = fontgrid_text_a1
							rgba = <text_rgba>
							text = (<text_params>.a)
							internal_scale = (0.9 * (1.7294999, 1.0))
							internal_just = [right , center]
							fit_width = `expand dims`
							fit_height = `expand dims`
							z_priority = 5
						}
						createscreenelement {
							parent = <h_menu_id>
							local_id = text
							type = textblockelement
							dims = (1.0, 8.0)
							fit_width = `expand dims`
							fit_height = `expand dims`
							enable_min_scale = false
							font = fontgrid_text_a1
							rgba = <text_rgba>
							text = <text>
							internal_scale = 0.54
							internal_just = [left , center]
							z_priority = 5
						}
					endif
					if structurecontains structure = (<menu_options> [<j>]) text_params
						<id> :settags original_text = (<menu_options> [<j>].text) text_params_func = (<menu_options> [<j>].text_params) standard_params = <standard_params>
						if structurecontains structure = (<menu_options> [<j>]) tp_params
							<id> :settags tp_params = (<menu_options> [<j>].tp_params)
						endif
					endif
				endif
			endif
			j = (<j> + 1)
			repeat <array_size>
			if gotparam \{focus}
				if (<focus> = 1)
					band_lobby_update_submenu_data submenu_index = <submenu_index> element = focus_type value = focus
				else
					band_lobby_update_submenu_data submenu_index = <submenu_index> element = focus_type value = unfocus
				endif
			else
				band_lobby_update_submenu_data submenu_index = <submenu_index> element = focus_type value = <current_focus_value>
			endif
			band_lobby_update_submenu_scroll_bar viewport_index = <submenu_index> vmenu = <new_vmenu>
			if gotparam \{action}
				if (<action> = forward)
					($band_lobby_viewport_menus [<submenu_index>]) :se_getprops pos
					($band_lobby_viewport_menus [<submenu_index>]) :se_setprops pos = ((-500.0, 0.0) + <pos>) time = 0.4
					<new_vmenu> :se_getprops pos
					<new_vmenu> :se_setprops pos = ((-500.0, 0.0) + <pos>) time = 0.4
				elseif (<action> = back)
					($band_lobby_viewport_menus [<submenu_index>]) :se_getprops pos
					($band_lobby_viewport_menus [<submenu_index>]) :se_setprops pos = ((500.0, 0.0) + <pos>) time = 0.4
					<new_vmenu> :se_getprops pos
					<new_vmenu> :se_setprops pos = ((500.0, 0.0) + <pos>) time = 0.4
				endif
				<new_vmenu> :se_waitprops
				destroyscreenelement id = ($band_lobby_viewport_menus [<submenu_index>])
				setarrayelement arrayname = band_lobby_viewport_menus globalarray index = <submenu_index> newvalue = <new_vmenu>
			endif
			band_lobby_update_submenu_pad_handlers {
				viewport_index = <submenu_index>
				pad_back_script = ($band_lobby_submenu_states.<menu>.back_script)
				pad_back_params = {<standard_params> ($band_lobby_submenu_states.<menu>.back_params)}
				add_shortcuts = ($band_lobby_submenu_states.<menu>.add_shortcuts)
			}
		else
			if screenelementexists id = <new_vmenu>
				destroyscreenelement id = <new_vmenu>
			endif
		endif
		if NOT (($<submenu_data>.desc_id) = null)
			launchevent type = ($<submenu_data>.focus_type) target = ($band_lobby_viewport_menus [<submenu_index>]) data = {child_index = ($<submenu_data>.menu_indices [0])}
			($<submenu_data>.desc_id) :obj_spawnscriptnow band_lobby_animate_scroll_bar params = {num_menu_items = <menu_items> selected_index = ($<submenu_data>.menu_indices [0])}
			band_lobby_update_submenu_data submenu_index = <submenu_index> element = is_updating value = 0
		endif
	endif
endscript

script band_lobby_refresh_menu_text 
	requireparams \{[
			id
		]
		all}
	getscreenelementchildren id = <id>
	getarraysize <children>
	index = 0
	begin
	getscreenelementprops id = (<children> [<index>])
	if gotparam \{local_id}
		if (<local_id> = text)
			(<children> [<index>]) :gettags
			text = qs(0x874f5ede)
			<text_params_func> <standard_params> <extra_params>
			formattext textname = text <original_text> <text_params>
			(<children> [<index>]) :se_setprops text = <text>
			return
		endif
		removeparameter \{local_id}
	endif
	index = (<index> + 1)
	repeat <array_size>
endscript

script 0xe85ffd6c 
	requireparams \{[
			id
		]
		all}
	getscreenelementchildren id = <id>
	getarraysize <children>
	index = 0
	begin
	getscreenelementprops id = (<children> [<index>])
	if gotparam \{local_id}
		if (<local_id> = text)
			(<children> [<index>]) :gettags
			text = qs(0x874f5ede)
			<text_params_func> <standard_params> <tp_params>
			formattext textname = text <original_text> <text_params>
			(<children> [<index>]) :se_setprops text = <text>
			return
		endif
		removeparameter \{local_id}
	endif
	index = (<index> + 1)
	repeat <array_size>
endscript

script band_lobby_create_new_submenu 
	requireparams \{[
			viewport_index
			action
		]
		all}
	printf channel = band_lobby qs(0x0d9494dc) v = <viewport_index>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	($band_lobby_viewport_menus [<viewport_index>]) :se_getprops
	($band_lobby_viewport_menus [<viewport_index>]) :se_getparentid
	if ($<submenu_data>.is_managed = 1)
		getplayerinfo ($g_leader_player_num) controller
		player = ($g_leader_player_num)
	else
		getplayerinfo ($<submenu_data>.player) controller
		player = ($<submenu_data>.player)
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
	band_lobby_get_num_menu_options player = <player> submenu_index = <viewport_index>
	if (($<submenu_data>.menu_indices [0]) > <num_options> || ($<submenu_data>.menu_indices [0]) < 0)
		band_lobby_update_submenu_data submenu_index = <viewport_index> element = menu_indices value = [0 0 0]
	endif
	if (($<submenu_data>.menu_indices [0]) = 0 || ($<submenu_data>.menu_indices [0]) = 1)
		pos = (((1.0, 0.0) * <starting_x>) + ((0.0, 20.0) - ((0.0, 33.0) * 1)))
	elseif (($<submenu_data>.menu_indices [0]) = (<num_options> - 1))
		pos = (((1.0, 0.0) * <starting_x>) + ((0.0, 20.0) - ((0.0, 33.0) * (<num_options> - 2))))
	else
		pos = (((1.0, 0.0) * <starting_x>) + ((0.0, 20.0) - ((0.0, 33.0) * ($<submenu_data>.menu_indices [0]))))
	endif
	createscreenelement {
		type = vmenu
		local_id = viewport_vmenu
		parent = <parent_id>
		pos = <pos>
		just = <just>
		internal_just = <internal_just>
		pos_anchor = <pos_anchor>
		dims = <dims>
		spacing_between = <spacing_between>
		hiddenlocal = <hiddenlocal>
		alpha = <alpha>
		z_priority = <z_priority>
		scale = <scale>
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
	if screenelementexists \{id = band_lobby_desc_id}
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
		formattext textname = text qs(0x53cfde30) a = ($band_lobby_strings.($g_lobby_state)) b = ($band_lobby_strings.($g_lobby_net_state))
	else
		formattext textname = text qs(0x35b12509) a = ($band_lobby_strings.($g_lobby_state))
	endif
	return text = <text>
endscript

script band_lobby_update_ticker 
	printf \{channel = band_lobby
		qs(0x9de6efa4)}
	requireparams \{[
			msg_checksum
		]
		all}
	if screenelementexists \{id = band_lobby_desc_id}
		if structurecontains structure = ($band_lobby_strings) <msg_checksum>
			switch <msg_checksum>
				default
				msg = ($band_lobby_strings.<msg_checksum>)
			endswitch
			if band_lobby_desc_id :desc_resolvealias \{name = alias_transient_msg_cont}
				if checksumequals a = <msg_checksum> b = current_state
					band_lobby_remote_name_fader \{fade = off}
					<resolved_id> :se_setprops alpha = 0.0 time = 0.25
				else
					band_lobby_remote_name_fader \{fade = on}
					<resolved_id> :se_setprops alpha = 1.0 time = 0.25
				endif
				if ($g_num_scrolling_texts > 0)
					<resolved_id> :obj_killspawnedscript name = scroll_ticker_text
					i = (($g_num_scrolling_texts) - 1)
					begin
					formattext checksumname = ticker_text_id_1 'scrolling_ticker_text_%i_1' i = <i>
					formattext checksumname = ticker_text_id_2 'scrolling_ticker_text_%i_2' i = <i>
					if screenelementexists id = <ticker_text_id_1>
						<ticker_text_id_1> :getsingletag ticker_text
						if gotparam \{ticker_text}
							if (<ticker_text> = <msg>)
								return
							endif
							removeparameter \{ticker_text}
						endif
					endif
					destroyscreenelement id = <ticker_text_id_1>
					destroyscreenelement id = <ticker_text_id_2>
					i = (<i> - 1)
					repeat ($g_num_scrolling_texts)
				endif
				if screenelementexists \{id = band_lobby_desc_id}
					<resolved_id> :obj_spawnscriptlater scroll_ticker_text params = {
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
		case on
		alpha = 0.05
		case off
		alpha = 0.6
		default
		printf \{qs(0xcef53bb4)}
		do_it = 0
	endswitch
	if (<do_it> = 1)
		if band_lobby_desc_id :desc_resolvealias \{name = alias_remote_players_menu}
			remote_players_menu = <resolved_id>
			i = 0
			begin
			formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = (<i> + 4)
			if (($<submenu_data>.occupied) = 1)
				resolvescreenelementid id = [
					{id = <remote_players_menu>}
					{index = <i>}
				]
				if screenelementexists id = <resolved_id>
					if resolvescreenelementid id = {<resolved_id> child = gamertag}
						<resolved_id> :se_setprops alpha = <alpha> time = 0.1
					endif
					removeparameter \{resolved_id}
				endif
			endif
			i = (<i> + 1)
			repeat 4
		endif
	endif
endscript

script band_lobby_flash_ticker_msg 
	requireparams \{[
			msg_checksum
			time
		]
		all}
	printf \{channel = band_lobby
		qs(0x54d3a948)}
	if screenelementexists \{id = band_lobby_desc_id}
		band_lobby_desc_id :obj_spawnscriptnow band_lobby_display_ticker_msg_wait_and_kill params = {msg_checksum = <msg_checksum> time = <time>}
	endif
endscript

script band_lobby_display_ticker_msg_wait_and_kill 
	requireparams \{[
			msg_checksum
			time
		]
		all}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	printf \{channel = band_lobby
		qs(0xdeb0b049)}
	band_lobby_update_ticker msg_checksum = <msg_checksum>
	wait <time> seconds
	band_lobby_update_ticker \{msg_checksum = current_state}
endscript

script band_lobby_update_submenu_scroll_bar 
	printf \{channel = band_lobby
		qs(0x23fb9ce2)}
	requireparams \{[
			viewport_index
			vmenu
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	if getscreenelementchildren id = <vmenu>
		getarraysize <children>
		($<submenu_data>.desc_id) :se_getprops
		if (<array_size> > 1)
			num_steps = (<array_size> - 1)
		else
			num_steps = 1
		endif
		scrollbar_step = ((<scrollbar_dims> [1] - (<scroll_thumb_dims> [1] * <scroll_thumb_scale> [1])) / <num_steps>)
		scroll_thumb_pos = (((1.0, 0.0) * (<scroll_thumb_pos> [0])) + (0.0, 4.0) + ((0.0, 1.0) * (<scrollbar_step> * ($<submenu_data>.menu_indices [0]))))
		($<submenu_data>.desc_id) :se_setprops scroll_thumb_pos = <scroll_thumb_pos> time = 0.1
	endif
endscript

script band_lobby_update_submenu_pad_handlers 
	requireparams \{[
			viewport_index
			pad_back_script
			pad_back_params
			add_shortcuts
		]
		all}
	printf channel = band_lobby qs(0xb189d8a2) c = <viewport_index>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	if ($<submenu_data>.is_managed = 1)
		player = $g_leader_player_num
	else
		player = ($<submenu_data>.player)
	endif
	standard_params = {player = <player> viewport_index = <viewport_index>}
	array = [
		{pad_up band_lobby_scroll_submenu params = {<standard_params> dir = up}}
		{pad_down band_lobby_scroll_submenu params = {<standard_params> dir = down}}
		{pad_back band_lobby_submenu_pad_handler_wrapper params = {choose_script = <pad_back_script> submenu_index = <viewport_index> params = <pad_back_params> back = 1}}
	]
	if (<add_shortcuts> = 1)
		addarrayelement array = <array> element = {pad_option band_lobby_submenu_pad_handler_wrapper params = {choose_script = band_lobby_players submenu_index = <viewport_index> params = <standard_params>}}
		addarrayelement array = <array> element = {pad_option2 band_lobby_submenu_pad_handler_wrapper params = {choose_script = band_lobby_friendslist submenu_index = <viewport_index> params = <standard_params>}}
		if ($<submenu_data>.is_managed = 0)
			addarrayelement array = <array> element = {pad_start band_lobby_submenu_pad_handler_wrapper params = {choose_script = band_lobby_continue submenu_index = <viewport_index> params = <standard_params>}}
		endif
	endif
	if ($<submenu_data>.is_managed = 0)
		if innetgame
			if ($g_career_search != null)
				addarrayelement array = <array> element = {pad_l1 band_lobby_submenu_pad_handler_wrapper params = {choose_script = band_lobby_net_continue submenu_index = <viewport_index> params = <standard_params> choose = 1}}
			endif
		else
			addarrayelement array = <array> element = {pad_l1 band_lobby_submenu_pad_handler_wrapper params = {choose_script = band_lobby_net_continue submenu_index = <viewport_index> params = <standard_params> choose = 1}}
		endif
	endif
	($band_lobby_viewport_menus [<viewport_index>]) :se_setprops {
		event_handlers = <array>
		replace_handlers
	}
endscript

script band_lobby_submenu_pad_handler_wrapper 
	requireparams \{[
			submenu_index
			choose_script
		]
		all}
	printf \{channel = band_lobby
		qs(0xef7eea69)}
	band_lobby_get_submenu_data_new submenu_index = <submenu_index> param = update_queue
	band_lobby_get_submenu_data_new submenu_index = <submenu_index> param = is_updating
	getarraysize <update_queue>
	if ((<array_size> = 0) && (<is_updating> = 0))
		if gotparam \{back}
			gh5_band_screen_ui_sound player_num = <player> back = 1
		elseif gotparam \{choose}
			gh5_band_screen_ui_sound player_num = <player> choose = 1
		endif
		<choose_script> <params> device_num = <device_num>
	endif
endscript

script band_lobby_update_leader_icon 
	printf \{channel = band_lobby
		qs(0x571bcd80)}
	requireparams \{[
			submenu_index
		]
		all}
	is_leader = 1
	update = 0
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	formattext checksumname = viewport_property_icon_leader_alpha 'viewport_%d_icon_leader_alpha' d = (<submenu_index> + 1)
	begin
	player = ($<submenu_data>.player)
	if ($g_net_leader_player_num = <player>)
		if (<is_leader> = 0)
			is_leader = 1
			update = 1
			band_leader_alpha = 1.0
			lobby_props = {}
			addparam structure_name = lobby_props name = <viewport_property_icon_leader_alpha> value = <band_leader_alpha>
		endif
	else
		if (<is_leader> = 1)
			is_leader = 0
			update = 1
			band_leader_alpha = 0.0
			lobby_props = {}
			addparam structure_name = lobby_props name = <viewport_property_icon_leader_alpha> value = <band_leader_alpha>
		endif
	endif
	if (<update> = 1)
		update = 0
		if screenelementexists \{id = band_lobby_desc_id}
			se_setprops frame_leader_alpha = <band_leader_alpha>
			band_lobby_desc_id :se_setprops <lobby_props>
		endif
	endif
	wait ($band_lobby_wait_times.leader_update) seconds
	repeat
endscript

script band_lobby_update_submenu_instrument 
	printf \{channel = band_lobby
		qs(0x454867f2)}
	requireparams \{[
			submenu_index
		]
		all}
	current_part = null
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	band_lobby_get_player_color viewport = <submenu_index>
	begin
	player = ($<submenu_data>.player)
	getplayerinfo <player> part
	if (<part> != <current_part>)
		current_part = <part>
		formattext checksumname = icon_alias 'alias_instrument_icon_%d' d = (<submenu_index> + 1)
		if screenelementexists \{id = band_lobby_desc_id}
			band_lobby_desc_id :desc_resolvealias name = <icon_alias> param = icon_element_id
			<icon_element_id> :band_lobby_vocals_destroy_icon_update
			<icon_element_id> :obj_killspawnedscript name = band_lobby_vocals_icon_update
			<icon_element_id> :obj_killspawnedscript name = band_lobby_controller_connected_update
		endif
		formattext checksumname = instrument_icon_texture 'instrument_icon_%d_texture' d = (<submenu_index> + 1)
		switch <part>
			case guitar
			addparam structure_name = lobby_props name = <instrument_icon_texture> value = mixer_icon_guitar
			case bass
			addparam structure_name = lobby_props name = <instrument_icon_texture> value = mixer_icon_bass
			case drum
			addparam structure_name = lobby_props name = <instrument_icon_texture> value = mixer_icon_drums
			case vocals
			if screenelementexists \{id = band_lobby_desc_id}
				<icon_element_id> :obj_spawnscriptnow band_lobby_vocals_icon_update params = {submenu_index = <submenu_index>}
			endif
		endswitch
		band_lobby_get_player_color viewport = <submenu_index>
		formattext checksumname = instrument_icon_rgba_prop 'instrument_icon_%d_rgba' d = (<submenu_index> + 1)
		addparam structure_name = lobby_props name = <instrument_icon_rgba_prop> value = <rgba_md>
		if screenelementexists \{id = band_lobby_desc_id}
			<icon_element_id> :obj_spawnscript band_lobby_controller_connected_update params = {submenu_index = <submenu_index>}
		endif
		band_lobby_get_player_color viewport = <submenu_index>
		formattext checksumname = lobby_player_rgba 'lobby_player_0%d_rgba' d = (<submenu_index> + 1)
		addparam structure_name = lobby_props name = <lobby_player_rgba> value = [0 0 0 0]
		if screenelementexists \{id = band_lobby_desc_id}
			band_lobby_desc_id :se_setprops <lobby_props>
		endif
	endif
	wait ($band_lobby_wait_times.instrument_update) seconds
	repeat
endscript

script band_lobby_update_gamertag 
	printf \{channel = band_lobby
		qs(0x50fbd2d1)}
	requireparams \{[
			submenu_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	begin
	player = ($<submenu_data>.player)
	if (($<submenu_data>.occupied) = 1)
		get_fullname_for_player player = <player>
		gamertag_text = <fullname>
	else
		getplayerinfo <player> character_id
		getplayerinfo <player> character_savegame
		if gotparam \{character_savegame}
			get_fullname_of_character savegame = <character_savegame> id = <character_id> profanity_allowed
			if NOT playerinfoequals <player> is_local_client = 1
			endif
			gamertag_text = <fullname>
		else
			gamertag_text = qs(0x00000000)
		endif
	endif
	band_lobby_get_player_color viewport = <submenu_index>
	se_setprops {
		gamertag_rgba = <rgba_md>
		gamertag_text = <gamertag_text>
	}
	wait ($band_lobby_wait_times.gamertag_update) seconds
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
	if ishost
		sendstructure callback = band_lobby_display_final_matchmaking_players_career data_to_send = {player_num = ($g_leader_player_num)}
		band_lobby_display_final_matchmaking_players_career player_num = ($g_leader_player_num)
		if ($g_lobby_net_state = net_private)
			band_lobby_continue_career
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
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	if (($<submenu_data>.occupied) = 1)
		addarrayelement array = <used_submenus> element = 1
		used_submenus = <array>
		addarrayelement array = <used_player_nums> element = ($<submenu_data>.player)
		used_player_nums = <array>
	else
		addarrayelement array = <used_submenus> element = 0
		used_submenus = <array>
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	getarraysize <used_player_nums> param = used_player_nums_size
	if (<used_player_nums_size> > 0)
		i = 0
		begin
		getarraysize <available_player_nums> param = available_player_nums_size
		if (<available_player_nums_size> > 0)
			j = 0
			begin
			if ((<used_player_nums> [<i>]) = (<available_player_nums> [<j>]))
				removearrayelement array = <available_player_nums> index = <j>
				available_player_nums = <array>
				break
			endif
			j = (<j> + 1)
			repeat <available_player_nums_size>
		endif
		i = (<i> + 1)
		repeat <used_player_nums_size>
	endif
	getarraysize <used_submenus> param = used_submenus_size
	if (<used_submenus_size> > 0)
		i = 0
		begin
		if ((<used_submenus> [<i>]) = 0)
			setplayerinfo (<available_player_nums> [0]) controller = <i>
			band_lobby_update_submenu_data submenu_index = <i> element = player value = (<available_player_nums> [0])
			update_camera_for_viewport viewport_index = <i> player = (<available_player_nums> [0])
			removearrayelement array = <available_player_nums> index = 0
			available_player_nums = <array>
		endif
		i = (<i> + 1)
		repeat <used_submenus_size>
	endif
endscript

script band_lobby_display_final_matchmaking_players_career 
	printf \{channel = band_lobby
		qs(0xb98d280f)}
	change g_net_leader_player_num = <player_num>
	change \{g_career_search = null}
	i = 0
	begin
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	if (($<submenu_data>.occupied) = 1)
		if playerinfoequals ($<submenu_data>.player) is_local_client = 1
			band_lobby_add_menu_update_to_queue submenu_index = <i> action = forward focus = 1
		else
			($band_lobby_viewport_menus [<i>]) :obj_spawnscriptnow band_lobby_change_menu params = {action = forward menu = remote_player player = ($<submenu_data>.player) viewport_index = <i> focus = 0 no_forced}
		endif
	else
		($band_lobby_viewport_menus [<i>]) :obj_spawnscriptnow band_lobby_change_menu params = {action = forward menu = empty player = ($<submenu_data>.player) viewport_index = <i> focus = 0 no_forced}
	endif
	band_lobby_get_submenu_data viewport_index = <i> param = player
	($band_lobby_viewport_menus [<i>]) :obj_spawnscriptnow check_for_net_appearance_arrival params = {player = <submenu_data>}
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
		band_lobby_get_submenu_data_new submenu_index = <i> param = player
		if ((<player> = <remote_player>) && (<occupied> = 1))
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
				addarrayelement array = <array> element = <net_id_first>
				addarrayelement array = <array> element = <net_id_second>
				band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = net_id value = <array>
				band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = player value = <remote_player>
				band_lobby_update_submenu_data submenu_index = <submenu_data_index> element = occupied value = 1
			else
				scriptassert \{qs(0x8af336e1)}
			endif
		endif
		getnextplayer player = <remote_player> remote out = remote_player
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
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <i>
	if ((($<submenu_data>.net_id [0]) != 0) && (($<submenu_data>.net_id [1]) != 0) && (($<submenu_data>.occupied) = 1))
		if (($<submenu_data>.player) = ($g_leader_player_num))
			found_leader = 1
		endif
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			getplayerinfo <player> net_id_first
			getplayerinfo <player> net_id_second
			getplayerinfo <player> gamertag
			if ((<net_id_first> = ($<submenu_data>.net_id [0])) && (<net_id_second> = ($<submenu_data>.net_id [1])))
				if isps3
					submenu_gamertag = ($<submenu_data>.gamertag_checksum)
					if (($<gamertag>) = ($<submenu_gamertag>))
						if (<found_leader> = 1)
							if (<set_leader> = 0)
								<set_leader> = 1
								change g_leader_player_num = <player>
							endif
						endif
						if (<type> = career)
							band_lobby_update_submenu_data submenu_index = <i> element = player value = <player>
						endif
						break
					endif
				else
					if (<found_leader> = 1)
						if (<set_leader> = 0)
							<set_leader> = 1
							change g_leader_player_num = <player>
						endif
					endif
					if (<type> = career)
						band_lobby_update_submenu_data submenu_index = <i> element = player value = <player>
					endif
					break
				endif
			endif
			getnextplayer player = <player>
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
	change \{online_song_choice_id = 0}
	band_lobby_post_matchmaking_player_adjustments
	if band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent}
		band_lobby_create_popup_menu {
			menu = playerslist
			list_type = matchmaking_done
			player = ($g_leader_player_num)
			container = <resolved_id>
		}
		if ishost
			change g_net_leader_player_num = ($g_leader_player_num)
			sendstructure callback = net_set_online_leader_num data_to_send = {player_num = ($g_leader_player_num)}
			choose_random_band_names
		endif
		wait ($band_lobby_wait_times.net_display_final_players) seconds
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
	change g_net_leader_player_num = <player_num>
endscript

script band_lobby_return_from_any_popup 
	printf \{channel = band_lobby
		qs(0xc01598ef)}
	if band_lobby_does_popup_exist
		if screenelementexists \{id = band_lobby_desc_id}
			band_lobby_desc_id :obj_spawnscriptnow \{band_lobby_destroy_popup_menu
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
	requireparams \{[
			voting_items_array
		]
		all}
	printf \{channel = band_lobby
		qs(0x344cae80)}
	if screenelementexists \{id = band_lobby_desc_id}
		if band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent}
			band_lobby_create_popup_menu {
				menu = generic_vote
				player = ($g_leader_player_num)
				container = <resolved_id>
				voting_items_array = <voting_items_array>
			}
		endif
	endif
endscript

script band_lobby_display_matchmaking_progress_ui 
	requireparams \{[
			player
			private
		]
		all}
	printf channel = band_lobby qs(0x69032f99) c = <player>
	if ($g_lobby_state = career)
		objid = band_lobby_desc_id
		getarraysize ($band_lobby_viewport_menus)
		i = 0
		begin
		formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <i>
		if (($<submenu_data>.occupied) = 0)
			if screenelementexists id = ($band_lobby_viewport_menus [<i>])
				if (<private> = 1)
					menu = empty
				else
					menu = searching
				endif
				($band_lobby_viewport_menus [<i>]) :obj_spawnscriptnow band_lobby_change_menu params = {menu = <menu> action = forward player = ($<submenu_data>.player) viewport_index = <i> focus = 0 no_forced}
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	else
		objid = current_band_lobby_popup
		if band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent}
			band_lobby_create_popup_menu {
				menu = playerslist
				player = <player>
				container = <resolved_id>
				list_type = matchmaking
			}
		endif
	endif
	if screenelementexists id = <objid>
		<objid> :obj_spawnscriptnow band_lobby_matchmaking_update_loop
	endif
endscript

script band_lobby_change_focus_submenu_all 
	printf \{channel = band_lobby
		qs(0xc58ca1b1)}
	requireparams \{[
			focus_type
		]
		all}
	if band_lobby_does_popup_exist
		if screenelementexists \{id = band_lobby_popup_menu}
			launchevent type = <focus_type> target = band_lobby_popup_menu
		endif
	else
		i = 0
		j = 0
		begin
		if screenelementexists id = ($band_lobby_viewport_menus [<i>])
			formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <i>
			if NOT gotparam \{skip_index_array}
				getarraysize ($<submenu_data>.update_queue)
				if (($<submenu_data>.is_updating) = 1)
					band_lobby_update_submenu_data submenu_index = <i> element = focus_type value = <focus_type>
				elseif (<array_size> > 0)
					if (<focus_type> = focus)
						band_lobby_add_menu_update_to_queue submenu_index = <i> focus = 1
					else
						band_lobby_add_menu_update_to_queue submenu_index = <i> focus = 0
					endif
				else
					launchevent type = <focus_type> target = ($band_lobby_viewport_menus [<i>])
				endif
			elseif ((<skip_index_array> [<j>]) = <i>)
				getarraysize \{skip_index_array}
				if ((<j> + 1) < <array_size>)
					j = (<j> + 1)
				endif
			else
				getarraysize ($<submenu_data>.update_queue)
				if (($<submenu_data>.is_updating) = 1)
					band_lobby_update_submenu_data submenu_index = <i> element = focus_type value = <focus_type>
				elseif (<array_size> > 0)
					if (<focus_type> = focus)
						band_lobby_add_menu_update_to_queue submenu_index = <i> focus = 1
					else
						band_lobby_add_menu_update_to_queue submenu_index = <i> focus = 0
					endif
				else
					launchevent type = <focus_type> target = ($band_lobby_viewport_menus [<i>])
				endif
			endif
		endif
		i = (<i> + 1)
		repeat ($g_num_lobby_local_submenus)
	endif
endscript

script band_lobby_get_player_color 
	requireparams \{[
			viewport
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <viewport>
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
endscript

script band_lobby_manage_band_members 
	requireparams \{[
			player
			viewport_index
			action
		]
		all}
	printf channel = band_lobby qs(0xa4d3381d) d = <viewport_index> c = <player>
	if band_lobby_desc_id :desc_resolvealias \{name = alias_band_viewport_vmenu}
		launchevent type = unfocus target = ($band_lobby_viewport_menus [<viewport_index>])
		band_lobby_get_player_submenu_index player_num = ($g_leader_player_num)
		getplayerinfo ($g_leader_player_num) controller
		<resolved_id> :se_setprops {
			exclusive_device = <controller>
			event_handlers = [
				{pad_back band_lobby_band_memebers_back params = {viewport_index = <submenu_index>}}
				{pad_up gh5_band_screen_ui_sound params = {player_num = <player> up = 1}}
				{pad_down gh5_band_screen_ui_sound params = {player_num = <player> down = 1}}
				{pad_back gh5_band_screen_ui_sound params = {player_num = <player> back = 1}}
				{pad_right gh5_band_screen_ui_sound params = {player_num = <player> up = 1}}
				{pad_left gh5_band_screen_ui_sound params = {player_num = <player> down = 1}}
			]
			replace_handlers
		}
		band_lobby_set_exclusive_devices_on_submenus controller = <controller>
		<resolved_id> :settags managing = 1
		launchevent type = focus target = <resolved_id> data = {child_index = <viewport_index>}
		if (<action> = deselect)
			band_lobby_update_submenu_data submenu_index = <viewport_index> element = is_managed value = 0
			formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
			persistent_band_get_index_from_player player = <player>
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
			setarrayelement \{arrayname = array
				index = 0
				newvalue = 0}
			setarrayelement \{arrayname = array
				index = 1
				newvalue = 0}
			setarrayelement \{arrayname = array
				index = 2
				newvalue = 0}
			band_lobby_update_submenu_data submenu_index = <viewport_index> element = menu_indices value = <array>
			band_lobby_change_menu action = back menu = ($<submenu_data>.return_menu) player = <player> viewport_index = <viewport_index>
		endif
		band_lobby_update_button_helpers
	endif
endscript

script band_lobby_band_memebers_back 
	printf \{channel = band_lobby
		qs(0x6548e6b3)}
	if band_lobby_desc_id :desc_resolvealias \{name = alias_band_viewport_vmenu}
		<resolved_id> :settags managing = 0
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		launchevent type = unfocus target = <resolved_id>
		band_lobby_change_focus_submenu_all \{focus_type = focus}
		band_lobby_update_button_helpers
	endif
endscript

script band_lobby_kick_leader_out_of_band_manage 
	printf \{qs(0xd02aee4b)}
	if band_lobby_has_managed_submenu
		printf \{qs(0x04fea79a)}
		formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <managed_submenu>
		band_lobby_manage_band_members action = deselect player = ($<submenu_data>.player) viewport_index = <managed_submenu>
	endif
	if screenelementexists \{id = band_lobby_desc_id}
		if band_lobby_desc_id :desc_resolvealias \{name = alias_band_viewport_vmenu}
			printf \{qs(0x946eaeb8)}
			if <resolved_id> :getsingletag managing
				if (<managing> = 1)
					printf \{qs(0x7b12c908)}
					get_submenu_index_from_player player = ($g_leader_player_num)
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
	requireparams \{[
			player
			viewport_index
		]
		all}
	if ($allow_controller_for_all_instruments = 1)
		formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
		getplayerinfo ($<submenu_data>.player) part
		switch (<part>)
			case guitar
			case bass
			band_lobby_change_menu action = back menu = forced_instruments player = <player> viewport_index = <viewport_index> no_forced
			case drum
			case vocals
			band_lobby_leave_forced_flow player = <player> viewport_index = <viewport_index>
		endswitch
	elseif band_lobby_isguitarcontroller player = <player> viewport_index = <viewport_index>
		band_lobby_change_menu action = back menu = forced_instruments player = <player> viewport_index = <viewport_index> no_forced
	else
		band_lobby_leave_forced_flow player = <player> viewport_index = <viewport_index>
	endif
endscript

script band_lobby_forced_difficulty_back 
	requireparams \{[
			player
			viewport_index
		]
		all}
	if ($allow_controller_for_all_instruments = 1)
		formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
		getplayerinfo ($<submenu_data>.player) part
		switch (<part>)
			case guitar
			case bass
			case drum
			band_lobby_change_menu action = back menu = forced_lefty_flip player = <player> viewport_index = <viewport_index> no_forced
			case vocals
			band_lobby_vocals_forced_menu player = <player> action = back previous_menu = forced_difficulty viewport_index = <viewport_index>
		endswitch
	elseif band_lobby_check_is_guitar_or_drum_controller player = <player> viewport_index = <viewport_index>
		band_lobby_change_menu action = back menu = forced_lefty_flip player = <player> viewport_index = <viewport_index> no_forced
	elseif band_lobby_isvocalscontroller player = <player> viewport_index = <viewport_index>
		band_lobby_vocals_forced_menu player = <player> action = back previous_menu = forced_difficulty viewport_index = <viewport_index>
	else
		scriptassert \{qs(0xd0b915fb)}
	endif
endscript

script band_lobby_vocals_forced_menu 
	requireparams \{[
			player
			action
			viewport_index
			previous_menu
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%i' i = <viewport_index>
	if band_lobby_should_show_mic_preference player = ($<submenu_data>.player)
		show_mic_preference = true
	else
		show_mic_preference = false
	endif
	if band_lobby_should_force_highway_view player = ($<submenu_data>.player)
		show_highway_view = true
	else
		show_highway_view = false
	endif
	menu = null
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
				band_lobby_leave_forced_flow player = <player> viewport_index = <viewport_index>
				return
			endif
			case forced_vocal_highway
			if (<show_mic_preference> = true)
				menu = forced_mic_preference
			else
				band_lobby_leave_forced_flow player = <player> viewport_index = <viewport_index>
				return
			endif
		endswitch
	endif
	if (<menu> = null)
		softassert \{qs(0x1dc71b34)}
	endif
	band_lobby_change_menu action = <action> menu = <menu> player = <player> viewport_index = <viewport_index> no_forced
endscript

script band_lobby_forced_vocal_highway_back 
	requireparams \{[
			player
			viewport_index
		]
		all}
	band_lobby_change_menu action = back menu = forced_mic_preference player = <player> viewport_index = <viewport_index> no_forced
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
]

script band_lobby_build_select_venue_submenu 
	printf \{channel = band_lobby
		qs(0xdee4a4c9)}
	getplayerinfo ($g_leader_player_num) controller
	get_savegame_from_controller controller = <controller>
	submenu_states = $band_lobby_submenu_states
	array = []
	getarraysize \{$careerlevelzonearray}
	array_count = 0
	begin
	level_checksum = ($careerlevelzonearray [<array_count>])
	if NOT structurecontains structure = ($levelzones.<level_checksum>) debug_only
		formattext checksumname = load_venue_checksum 'venue_%s' s = ($levelzones.<level_checksum>.name)
		getglobaltags savegame = <savegame> <load_venue_checksum>
		if (<unlocked> = 1)
			addarrayelement {
				array = <array>
				element = {
					text = ($levelzones.<level_checksum>.title)
					checksum = <level_checksum>
					choose_script = band_lobby_change_global
					select_params = {
						global = g_band_lobby_current_level
						value = <level_checksum>
						action = back
						menu = main
						player = <player>
						viewport_index = <viewport_index>
					}
				}
			}
		endif
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	venue_options = {
		(<submenu_states>.select_venue)
		options = <array>
		focus_param = venue
		back_script = band_lobby_change_menu
		back_params = {
			menu = main
			action = back
			player = <player>
			viewport_index = <viewport_index>
		}
	}
	<submenu_states> = {<submenu_states> select_venue = <venue_options>}
	change band_lobby_submenu_states = <submenu_states>
	band_lobby_change_menu action = forward menu = select_venue player = <player> viewport_index = <viewport_index>
endscript

script band_lobby_select_band_member 
	requireparams \{[
			viewport_index
		]
		all}
	printf channel = band_lobby qs(0x2e8a79dd) c = <viewport_index>
	band_lobby_get_player_submenu_index player_num = ($g_leader_player_num)
	formattext checksumname = managing_submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	if (<submenu_index> = <viewport_index>)
		gh5_band_screen_ui_sound player_num = ($g_leader_player_num) choose = 1
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
			if playerinfoequals ($<submenu_data>.player) is_local_client = 1
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
			if band_lobby_desc_id :desc_resolvealias \{name = alias_band_viewport_vmenu}
				band_lobby_change_focus_submenu_all \{focus_type = unfocus}
				launchevent type = unfocus target = <resolved_id>
				array = []
				if (<submenu_index> < <viewport_index>)
					addarrayelement array = <array> element = <submenu_index>
					addarrayelement array = <array> element = <viewport_index>
				else
					addarrayelement array = <array> element = <viewport_index>
					addarrayelement array = <array> element = <submenu_index>
				endif
				band_lobby_change_focus_submenu_all focus_type = focus skip_index_array = <array>
				band_lobby_update_submenu_data submenu_index = <viewport_index> element = is_managed value = 1
				persistent_band_get_index_from_player player = ($<submenu_data>.player)
				if (($persistent_band_data [<index>].building) = 0)
					band_lobby_unmask_viewport viewport_index = <viewport_index>
				endif
				if band_lobby_get_forced_menu viewport_index = <viewport_index>
					band_lobby_update_submenu_data submenu_index = <viewport_index> element = return_menu value = <forced_menu>
				else
					band_lobby_update_submenu_data submenu_index = <viewport_index> element = return_menu value = <return_menu>
				endif
				setplayerinfo ($<submenu_data>.player) chosen_character_id = none
				setplayerinfo ($<submenu_data>.player) chosen_character_savegame = -1
				band_lobby_refresh_band_leader_characters \{no_refresh}
				persistent_band_refresh_changed_characters
				if (<forced_flow> = 1)
					band_lobby_change_menu action = forward menu = <managed_menu> player = ($<managing_submenu_data>.player) viewport_index = <viewport_index> no_forced
				else
					band_lobby_change_menu action = forward menu = <managed_menu> player = ($<managing_submenu_data>.player) viewport_index = <viewport_index>
				endif
			endif
		else
			gh5_band_screen_ui_sound player_num = ($g_leader_player_num) error = 1
		endif
		band_lobby_update_button_helpers
	endif
endscript

script band_lobby_game_rules 
	requireparams \{[
			player
		]
		all}
	if band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent}
		band_lobby_create_popup_menu {
			menu = game_rules
			player = <player>
			container = <resolved_id>
		}
	endif
endscript

script band_lobby_friendslist 
	printf \{channel = band_lobby
		qs(0xc9b42674)}
	requireparams \{[
			player
			viewport_index
		]
		all}
	can_continue = 0
	if band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent}
		getplayerinfo <player> controller
		if checkforsignin controller_index = <controller> dont_set_primary network_platform_only
			if isxenonorwindx
				if NOT netsessionfunc func = xenonisguest params = {controller_index = <controller>}
					can_continue = 1
				endif
			elseif isps3
				can_continue = 1
			endif
		endif
	endif
	if (<can_continue> = 1)
		gh5_band_screen_ui_sound player_num = <player> choose = 1
		netsessionfunc {
			obj = friends
			func = begin_retrieve_friends_list
			params = {
				callback = band_lobby_friendslist_callback
				device_num = <controller>
				callback_params = {
					submenu_index = <viewport_index>
				}
			}
		}
		if NOT isps3
			band_lobby_really_create_friendslist container = <resolved_id> player = <player> controller = <controller>
		else
			band_lobby_pre_create_friendslist container = <resolved_id> player = <player> controller = <controller>
		endif
	else
		if isxenonorwindx
			msg_checksum = not_connted_to_live
		else
			msg_checksum = signin_to_profile
		endif
		if band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent}
			band_lobby_create_popup_menu {
				menu = change_profile
				player = <player>
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
		player = <player>
		container = <container>
	}
endscript

script band_lobby_pre_create_friendslist 
	printf \{qs(0xc2de23e7)}
	band_lobby_seamless_net_change {
		network = net_private
		player = <player>
		callback = band_lobby_really_create_friendslist
		callback_params = {
			player = <player>
			container = <container>
		}
		from_friendslist
	}
endscript

script band_lobby_players 
	printf \{channel = band_lobby
		qs(0x05243124)}
	requireparams \{[
			player
		]
		all}
	if band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent}
		gh5_band_screen_ui_sound player_num = <player> choose = 1
		band_lobby_create_popup_menu {
			menu = playerslist
			player = <player>
			container = <resolved_id>
		}
	endif
endscript

script band_lobby_matchmaking_update_loop 
	printf \{channel = band_lobby
		qs(0x2c2dd979)}
	gamemode_gettype
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize \{connections}
	current_num_players_in_party = <array_size>
	current_num_matchmaking_players = <array_size>
	if (<type> = career)
		array = []
		i = 0
		begin
		formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <i>
		if (($<submenu_data>.occupied) = 0)
			addarrayelement array = <array> element = <i>
		endif
		i = (<i> + 1)
		repeat ($g_num_lobby_local_submenus)
	endif
	begin
	if netsessionfunc \{obj = match
			func = get_num_matchmaking_players}
		if (<num_matchmaking_players> > 0)
			netsessionfunc \{obj = party
				func = get_party_members}
			getarraysize \{connections}
			if (<array_size> < <current_num_players_in_party>)
				band_lobby_remove_party_member_ui_from_matchmaking current_num_players_in_party = <current_num_players_in_party>
			endif
			if (<array_size> > <num_matchmaking_players>)
				num_matchmaking_players = <array_size>
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
				if (<type> = career)
					band_lobby_update_searching_player_ui update = <update> submenu_indices = <array>
				else
					if screenelementexists \{id = band_lobby_popup_menu}
						band_lobby_update_popup_player_ui update = <update> player_index = (-1) parent_id = band_lobby_popup_menu
					endif
				endif
				repeat <num_players_to_update>
				current_num_matchmaking_players = <num_matchmaking_players>
			endif
		endif
	endif
	wait \{1
		second}
	repeat
endscript

script band_lobby_remove_party_member_ui_from_matchmaking 
	requireparams \{[
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
		if NOT band_lobby_is_player_party_member player_num = <player>
			if (<type> = career)
				band_lobby_get_player_submenu_index player_num = <player> occupied
				if (<submenu_index> != -1)
					band_lobby_update_submenu_data submenu_index = <submenu_index> element = occupied value = 0
					band_lobby_change_menu menu = searching action = back player = <player> viewport_index = <submenu_index> focus = 0
				endif
			else
				if screenelementexists \{id = band_lobby_popup_menu}
					band_lobby_remove_player_ui_from_popup player_index = <player> parent_id = band_lobby_popup_menu
				endif
			endif
		endif
		getnextplayer player = <player>
		repeat <num_players>
		current_num_players_in_party = <array_size>
	endif
	current_num_players_in_party = <current_num_players_in_party>
endscript

script band_lobby_update_searching_player_ui 
	requireparams \{[
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
	getarraysize \{submenu_indices}
	if (<array_size> > 0)
		i = 0
		begin
		formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = (<submenu_indices> [<i>])
		if (($<submenu_data>.menu) = <current_menu>)
			band_lobby_change_menu menu = <new_menu> action = <action> player = ($<submenu_data>.player) viewport_index = (<submenu_indices> [<i>]) focus = 0
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script band_lobby_get_num_menu_options 
	requireparams \{[
			player
			submenu_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <submenu_index>
	size = 0
	index = 0
	menu = ($<submenu_data>.menu)
	menu_options = ($band_lobby_submenu_states.<menu>.options)
	getarraysize <menu_options>
	if (<array_size> > 0)
		begin
		<option> = ($band_lobby_submenu_states.<menu>.options [<index>])
		if structurecontains structure = <option> condition
			<condition> = (<option>.condition)
			if structurecontains structure = <option> condition_params
				params = (<option>.condition_params)
			endif
			if <condition> player = <player> viewport_index = <submenu_index> <params>
				<size> = (<size> + 1)
			endif
		else
			<size> = (<size> + 1)
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return num_options = <size>
endscript

script band_lobby_searching_timeout 
	printf \{qs(0x49c69245)}
	show_dialog = 1
	begin
	if netsessionfunc \{obj = match
			func = has_found_players}
		netsessionfunc \{obj = match
			func = get_num_matchmaking_players}
		netsessionfunc \{obj = party
			func = get_party_members}
		getarraysize <connections>
		if (<num_matchmaking_players> > <array_size>)
			show_dialog = 0
			break
		endif
	endif
	wait \{1
		second}
	repeat ($net_matchmaking_timeout)
	printf \{qs(0x3ae32b0b)}
	if (<show_dialog> = 1)
		if screenelementexists \{id = matchmaking_difficulty_loosen_menu}
			destroy_dialog_box
		endif
		if screenelementexists \{id = dialog_box_container}
			printf \{qs(0x6e40243e)}
			return
		endif
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		create_dialog_box {
			dlg_z_priority = 1000
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
		assignalias id = <menu_id> alias = matchmaking_timeout_menu
		launchevent \{type = focus
			target = matchmaking_timeout_menu}
		runscriptonscreenelement \{id = matchmaking_timeout_menu
			net_matchmaking_searching_timeout_late_found_players}
	endif
endscript

script net_matchmaking_searching_timeout_cleanup 
	printf \{qs(0x3168ce91)}
	if screenelementexists \{id = matchmaking_timeout_menu}
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
	if screenelementexists \{id = matchmaking_timeout_menu}
		destroy_dialog_box
	endif
	band_lobby_cancel_matchmaking
endscript

script net_matchmaking_searching_timeout_late_found_players 
	printf \{qs(0xcf115662)}
	begin
	if netsessionfunc \{obj = match
			func = has_found_players}
		netsessionfunc \{obj = match
			func = get_num_matchmaking_players}
		netsessionfunc \{obj = party
			func = get_party_members}
		getarraysize <connections>
		if (<num_matchmaking_players> > <array_size>)
			net_matchmaking_searching_timeout_cleanup
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script band_lobby_searching_update 
	printf \{qs(0xd609d762)}
	gh5_band_screen_ui_sound player_num = <player> choose = 1
	begin
	if screenelementexists \{id = current_band_lobby_popup}
		band_lobby_searching_update_screen
	else
		break
	endif
	wait \{0.5
		seconds}
	repeat
endscript

script band_lobby_searching_update_screen 
	printf \{qs(0x9a329dd3)}
	netsessionfunc \{obj = match
		func = get_matchmaking_status}
	<show_time> = 0
	if gotparam \{matchmaking_remaining_time}
		if (<matchmaking_remaining_time> > 0)
			if (<matchmaking_remaining_time> < 15)
				<show_time> = 1
			endif
		endif
	endif
	if (<show_time> = 1)
		formattext textname = countdown_text ($band_lobby_strings.popup_game_will_start) d = <matchmaking_remaining_time>
		current_band_lobby_popup :se_setprops {
			pu_helper_msg_2_text = <countdown_text>
			pu_helper_msg_2_alpha = 1
		}
	else
		current_band_lobby_popup :se_setprops \{pu_helper_msg_2_text = qs(0x00000000)
			pu_helper_msg_2_alpha = 0}
	endif
	if gotparam \{state}
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
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <i>
	if (($<submenu_data>.is_managed) = 1)
		return true managed_submenu = <i>
	endif
	i = (<i> + 1)
	repeat ($g_num_lobby_local_submenus)
	return \{false}
endscript

script band_lobby_check_show_instrument_option 
	printf channel = band_lobby qs(0xe374bcf2) p = <player> v = <viewport_index>
	requireparams \{[
			player
			viewport_index
		]
		all}
	formattext checksumname = submenu_data 'band_lobby_submenu_data_%d' d = <viewport_index>
	getplayerinfo ($<submenu_data>.player) controller
	getplayerinfo ($<submenu_data>.player) part
	if iscontrollerpluggedin controller = <controller>
		if band_lobby_isguitarcontroller player = <player> viewport_index = <viewport_index>
			return \{true}
		endif
	else
		if (<part> = guitar || <part> = bass)
			return \{true}
		endif
	endif
	return \{false}
endscript

script band_lobby_watchdog_all_player_appearance_change 
	playercharacteridarray = []
	i = 1
	begin
	getplayerinfo <i> character_id
	item = {character_id = <character_id>}
	addarrayelement array = <playercharacteridarray> element = <item>
	<playercharacteridarray> = <array>
	i = (<i> + 1)
	repeat 4
	begin
	printf \{qs(0x432cafa0)}
	if innetgame
		gamemode_gettype
		if (<type> = career)
			i = 1
			getnumplayersingame \{local}
			if (<num_players> > 0)
				getfirstplayer \{local}
				begin
				getplayerinfo <player> character_id
				if NOT (<playercharacteridarray> [<player> - 1].character_id = (<character_id>))
					if sendplayerappearancedata player = <player>
						setarrayelement arrayname = playercharacteridarray index = (<player> -1) newvalue = {character_id = <character_id>}
						printf qs(0xd99aa37c) p = <i> i = <character_id>
					endif
				endif
				getnextplayer player = <player> local
				repeat <num_players>
			endif
		endif
	else
		break
	endif
	wait \{2.0
		seconds}
	repeat
endscript
