debug_friends_list = 0
invite_sent_display_position = (640.0, 360.0)

script ui_create_friends_list 
	RequireParams \{[
			exit_Script
		]
		all}
	<my_parent> = root_window
	if ScreenElementExists \{id = onlinelobbyinterface}
		<my_parent> = onlinelobbyinterface
	endif
	CreateScreenElement {
		Type = descinterface
		parent = <my_parent>
		desc = 'online_lobby_left_side'
		Pos = (0.0, -1000.0)
		id = friendslistinterface
		exclusive_device = <device_num>
		tags = {
			menu_index = 0
			menu_items = 0
			device_num = <device_num>
			exit_Script = <exit_Script>
			scrollbar_id = NULL
		}
	}
	friendslistinterface :desc_checkversion \{desired = 2
		assertif = mismatch}
	<id> :se_setprops title_text = qs(0xf41fb4ee)
	set_friends_helper_text \{msg_checksum = friends_menu}
	if friendslistinterface :desc_resolvealias \{Name = alias_online_lobby_scrollbar
			param = scrollbar_id}
		friendslistinterface :SetTags scrollbar_id = <scrollbar_id>
	endif
	<id> :Obj_SpawnScriptNow animate_left_side params = {direction = in}
	create_friendslist_menu device_num = <device_num>
	clean_up_user_control_helpers
	menu_finish
endscript

script animate_left_side \{id = friendslistinterface}
	if ScreenElementExists id = <id>
		switch (<direction>)
			case out
			<id> :se_setprops Pos = {(0.0, -1000.0) relative} time = 0.15 anim = gentle
			case in
			<id> :se_setprops Pos = {(0.0, 1000.0) relative} time = 0.15 anim = gentle
		endswitch
	else
		return
	endif
	Wait \{0.15
		Second}
	if GotParam \{focus_id}
		LaunchEvent Type = focus target = <focus_id> data = {child_index = (<focus_index>)}
	endif
endscript

script ui_destroy_friends_list 
	if ScreenElementExists \{id = friendslistinterface}
		generic_menu_pad_back_sound
		NetSessionFunc \{func = friends_uninit}
		animate_left_side \{direction = out}
		friendslistinterface :GetTags
		DestroyScreenElement \{id = friendslistinterface}
		if GotParam \{no_focus}
			SpawnScriptNow <exit_Script> params = {no_focus}
		else
			SpawnScriptNow <exit_Script>
		endif
	endif
endscript

script set_friends_helper_text 
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
		if ScreenElementExists \{id = friendslistinterface}
			friendslistinterface :se_setprops info_text = ($<plat_helper_strings>.<appended_id>)
		endif
	elseif StructureContains structure = ($net_helper_text_strings) <appended_id>
		if ScreenElementExists \{id = friendslistinterface}
			friendslistinterface :se_setprops info_text = ($net_helper_text_strings.<appended_id>)
		endif
	endif
endscript

script create_friendslist_menu 
	if friendslistinterface :desc_resolvealias \{Name = alias_left_side_vmenu}
		<resolved_id> :se_setprops {
			event_handlers = [
				{pad_up friendslist_up_or_down_action params = {action = up}}
				{pad_down friendslist_up_or_down_action params = {action = down}}
			]
		}
		if isps3
			add_friendslist_item {
				vmenu_id = <resolved_id>
				text = qs(0x0ee400a5)
				choose_script = invite_to_game
				choose_script_params = {
					net_id = <net_id>
					Name = <Name>
					instrument = guitar
				}
			}
			add_friendslist_item {
				vmenu_id = <resolved_id>
				text = qs(0xfd92cde8)
				choose_script = invite_to_game
				choose_script_params = {
					net_id = <net_id>
					Name = <Name>
					instrument = drum
				}
			}
			add_friendslist_item {
				vmenu_id = <resolved_id>
				text = qs(0x72d3f53a)
				choose_script = invite_to_game
				choose_script_params = {
					net_id = <net_id>
					Name = <Name>
					instrument = mic
				}
			}
			friendslistinterface :GetTags
			DestroyScreenElement id = <scrollbar_id>
			friendslistinterface :SetTags \{scrollbar_id = NULL}
		else
			NetSessionFunc \{func = friends_init}
			NetSessionFunc Obj = friends func = begin_retrieve_friends_list params = {callback = friendslist_callback device_num = <device_num> callback_params = {None}}
		endif
		AssignAlias id = <resolved_id> alias = current_menu
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
endscript

script friendslist_up_or_down_action 
	if NOT GotParam \{action}
		return
	endif
	if NOT ScreenElementExists \{id = current_menu}
		return
	endif
	friendslistinterface :GetTags
	if (<action> = up)
		generic_menu_up_or_down_sound \{up}
		if (<menu_index> = 0)
			friendslistinterface :SetTags menu_index = (<menu_items> - 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 175.0)
			endif
		else
			friendslistinterface :SetTags menu_index = (<menu_index> - 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :GetTags
				Pos = ((0.0, -1.0) * <scroll_increment>)
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = {<Pos> relative}
			endif
		endif
	elseif (<action> = down)
		generic_menu_up_or_down_sound \{down}
		if (<menu_index> = (<menu_items> - 1))
			friendslistinterface :SetTags \{menu_index = 0}
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 0.0)
			endif
		else
			friendslistinterface :SetTags menu_index = (<menu_index> + 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :GetTags
				Pos = ((0.0, 1.0) * (<scroll_increment>))
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = {<Pos> relative}
			endif
		endif
	endif
endscript

script friendslist_callback 
	printf \{qs(0x984d6ecc)}
	if GotParam \{friendlist}
		if ScreenElementExists \{id = friendslistinterface}
			if friendslistinterface :desc_resolvealias \{Name = alias_left_side_vmenu}
				GetArraySize <friendlist>
				if (<array_Size> > 0)
					i = 0
					begin
					if isxenonorwindx
						if (0 != <friendlist> [<i>].localplayer)
							cant_invite = 1
						elseif (0 != <friendlist> [<i>].alreadyingame)
							cant_invite = 1
						else
							cant_invite = 0
						endif
						add_friendslist_item {
							vmenu_id = <resolved_id>
							text = (<friendlist> [<i>].Name)
							status = (<friendlist> [<i>].friendstate)
							choose_script = create_friendslist_submenu
							choose_script_params = {
								net_id = (<friendlist> [<i>].id)
								Name = (<friendlist> [<i>].Name)
								cant_invite = <cant_invite>
							}
						}
					else
						if NetSessionFunc \{Obj = party
								func = is_party_session_available}
							cant_invite = 0
						else
							cant_invite = 1
						endif
						add_friendslist_item {
							vmenu_id = <resolved_id>
							text = (<friendlist> [<i>].Name)
							choose_script = create_friendslist_submenu
							choose_script_params = {
								net_id = (<friendlist> [<i>].id)
								Name = (<friendlist> [<i>].Name)
								cant_invite = <cant_invite>
							}
						}
					endif
					<i> = (<i> + 1)
					repeat <array_Size>
					if ($debug_friends_list = 1)
						begin
						add_friendslist_item {
							vmenu_id = <resolved_id>
							text = qs(0x89810324)
							choose_script = create_friendslist_submenu
							choose_script_params = {
								net_id = 0
								Name = qs(0x89810324)
							}
						}
						repeat 92
					endif
					LaunchEvent Type = focus target = <resolved_id> data = {child_index = 0}
				else
					add_friendslist_item {
						vmenu_id = <resolved_id>
						text = qs(0x3e8a16b2)
					}
					LaunchEvent Type = focus target = <resolved_id> data = {child_index = 0}
				endif
				friendslistinterface :GetTags
				if (<menu_items> > 1)
					scroll_increment = (175 / (<menu_items> -1))
					<scrollbar_id> :SetTags scroll_increment = <scroll_increment>
					<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 0.0)
				else
					DestroyScreenElement id = <scrollbar_id>
				endif
			endif
		endif
	endif
endscript

script friendslist_item_change_focus 
	Obj_GetID
	ResolveScreenElementID id = [
		{id = <objID>}
		{local_id = text}
	]
	if GotParam \{focus}
		retail_menu_focus id = <resolved_id> fire_font
	elseif GotParam \{unfocus}
		retail_menu_unfocus id = <resolved_id>
	endif
endscript

script add_friendslist_item \{vmenu_id = friendslist_vmenu
		z_priority = 8.2}
	if NOT GotParam \{vmenu_id}
		return
	endif
	if NOT GotParam \{text}
		text = qs(0x134b7e69)
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <vmenu_id>
		Pos = (0.0, 0.0)
		dims = (385.0, 42.0)
		event_handlers = [
			{focus friendslist_item_change_focus params = {focus}}
			{unfocus friendslist_item_change_focus params = {unfocus}}
		]
	}
	container_id = <id>
	event_handlers = [
		{pad_back ui_destroy_friends_list}
	]
	if GotParam \{choose_script}
		AddArrayElement array = <event_handlers> element = {pad_choose generic_menu_pad_choose_sound}
		<event_handlers> = <array>
		AddArrayElement array = <event_handlers> element = {pad_choose <choose_script> params = <choose_script_params>}
		<event_handlers> = <array>
	endif
	SetScreenElementProps {
		id = <container_id>
		event_handlers = <event_handlers>
	}
	if GotParam \{sub_menu_item}
		text_width = 265
		text_adjust = 15
	else
		friendslistinterface :GetTags
		friendslistinterface :SetTags menu_items = (<menu_items> + 1)
		width = 385
		text_width = 275
		text_adjust = 0
	endif
	CreateScreenElement {
		Type = TextBlockElement
		parent = <container_id>
		local_id = text
		font = fontgrid_text_a1
		rgba = ($menu_unfocus_color)
		Pos = ((0.0, 0.0) + (1.0, 0.0) * <text_adjust>)
		dims = ((0.0, 42.0) + (1.0, 0.0) * <text_width>)
		alpha = 1.0
		text = <text>
		just = [left top]
		z_priority = (<z_priority> + 0.5)
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = `per	axis`
		internal_just = [left center]
	}
	if GotParam \{status}
		switch (<status>)
			case online
			<status_texture> = friendslist_online
			case offline
			<status_texture> = friendslist_offline
			case away
			<status_texture> = friendslist_away
			case busy
			<status_texture> = friendslist_busy
		endswitch
		CreateScreenElement {
			Type = SpriteElement
			parent = <container_id>
			texture = <status_texture>
			Pos = ((32.0, 5.0) + (1.0, 0.0) * <text_width>)
			dims = (32.0, 32.0)
			just = [center top]
			z_priority = (<z_priority> + 5)
		}
	endif
	return id = <container_id>
endscript

script create_friendslist_submenu 
	RequireParams \{[
			net_id
			Name
		]
		all}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	Obj_GetID
	<objID> :se_getprops
	<z_priority> = (<z_priority> + 1)
	if friendslistinterface :desc_resolvealias \{Name = alias_left_side_vscollingmenu}
		<resolved_id> :se_setprops dims = (256.0, 1000.0) time = 0.2
		ResolveScreenElementID \{id = [
				{
					id = friendslistinterface
				}
				{
					local_id = lobby_menu
				}
				{
					local_id = left_side_container
				}
				{
					local_id = info_pane_container
				}
			]}
		dim_y = 42
		begin
		<dim_y> = (<dim_y> + 45)
		if (<dim_y> >= 575)
			difference = (<dim_y> - 575)
			<dim_y> = 575
			<objID> :se_setprops dims = (385.0, 575.0)
			<resolved_id> :se_setprops Pos = {((0.0, 1.0) * <difference>) relative}
			break
		endif
		<objID> :se_setprops dims = ((0.0, 1.0) * <dim_y> + (385.0, 0.0))
		<resolved_id> :se_setprops Pos = {(0.0, 45.0) relative}
		Wait \{1
			gameframe}
		repeat
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <objID>
		id = friendslist_submenu_container
		Pos = (0.0, 0.0)
		just = [left top]
		z_priority = <z_priority>
	}
	container_id = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = list_container
		Pos = (-35.0, 50.0)
		dims = (400.0, 215.0)
		just = [left top]
		alpha = 1.0
		z_priority = (<z_priority> + 0.2)
	}
	CreateScreenElement {
		Type = VMenu
		parent = <container_id>
		just = [left top]
		internal_just = [left center]
		dims = (300.0, 200.0)
		Pos = (15.0, 50.0)
		z_priority = (<z_priority> + 0.4)
		spacing_between = 5
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	subvmenu_id = <id>
	SetScreenElementProps {
		id = <subvmenu_id>
		event_handlers = [
			{pad_back generic_menu_pad_back_sound}
			{pad_back destroy_friendslist_submenu}
		]
	}
	dont_show_invite_options = 0
	if GotParam \{cant_invite}
		if (1 = <cant_invite>)
			<dont_show_invite_options> = 1
		endif
	endif
	if (0 = <dont_show_invite_options>)
		add_friendslist_item {
			sub_menu_item
			vmenu_id = <subvmenu_id>
			text = qs(0x0ee400a5)
			z_priority = (<z_priority> + 2)
			choose_script = invite_to_game
			choose_script_params = {
				net_id = <net_id>
				Name = <Name>
				instrument = guitar
			}
		}
		add_friendslist_item {
			sub_menu_item
			vmenu_id = <subvmenu_id>
			text = qs(0xfd92cde8)
			z_priority = (<z_priority> + 2)
			choose_script = invite_to_game
			choose_script_params = {
				net_id = <net_id>
				Name = <Name>
				instrument = drum
			}
		}
		add_friendslist_item {
			sub_menu_item
			vmenu_id = <subvmenu_id>
			text = qs(0x72d3f53a)
			z_priority = (<z_priority> + 2)
			choose_script = invite_to_game
			choose_script_params = {
				net_id = <net_id>
				Name = <Name>
				instrument = mic
			}
		}
	endif
	AssignAlias id = <subvmenu_id> alias = current_menu
	LaunchEvent \{Type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
endscript

script destroy_friendslist_submenu 
	if ScreenElementExists \{id = friendslist_submenu_container}
		DestroyScreenElement \{id = friendslist_submenu_container}
	endif
	friendslistinterface :GetTags
	if friendslistinterface :desc_resolvealias \{Name = alias_left_side_vmenu}
		menu_id = <resolved_id>
		ResolveScreenElementID \{id = [
				{
					id = friendslistinterface
				}
				{
					local_id = lobby_menu
				}
				{
					local_id = left_side_container
				}
				{
					local_id = info_pane_container
				}
			]}
		info_container = <resolved_id>
		ResolveScreenElementID id = [
			{id = <menu_id>}
			{index = <menu_index>}
		]
		dim_y = 575
		begin
		<dim_y> = (<dim_y> - 45)
		if (<dim_y> <= 42)
			difference = (42 - <dim_y>)
			<dim_y> = 42
			<info_container> :se_setprops Pos = {((0.0, -1.0) * <difference>) relative}
			<resolved_id> :se_setprops dims = (385.0, 42.0)
			break
		endif
		<resolved_id> :se_setprops dims = (((0.0, 1.0) * <dim_y>) + (385.0, 0.0))
		<info_container> :se_setprops Pos = {(0.0, -45.0) relative}
		Wait \{1
			gameframe}
		repeat
		if friendslistinterface :desc_resolvealias \{Name = alias_left_side_vscollingmenu}
			<resolved_id> :se_setprops dims = (256.0, 215.0)
		endif
		LaunchEvent Type = focus target = <menu_id> data = {child_index = (<menu_index>)}
	endif
	if friendslistinterface :desc_resolvealias \{Name = alias_left_side_vmenu}
		Wait \{3
			gameframes}
		AssignAlias id = <resolved_id> alias = current_menu
	endif
endscript

script invite_to_game 
	RequireParams \{[
			instrument
		]
		all}
	invite_title = qs(0x14988bb8)
	base_msg = qs(0x655f2f82)
	switch (<instrument>)
		case guitar
		formatText TextName = invite_msg qs(0xb3a143ba) s = <base_msg> i = qs(0xbaa820f9)
		case drum
		formatText TextName = invite_msg qs(0xb3a143ba) s = <base_msg> i = qs(0x67a46594)
		case mic
		formatText TextName = invite_msg qs(0xb3a143ba) s = <base_msg> i = qs(0x252af8f9)
	endswitch
	userlist = [
		{
			Name = <Name>
			id = <net_id>
		}
	]
	NetSessionFunc func = createcustominvite params = {
		userlist = <userlist>
		game_msg = <invite_msg>
		title = <invite_title>
		game_specific = <instrument>
		device_num = <device_num>
	}
	if ($g_band_lobby_flag = 1)
		if ScreenElementExists \{id = current_band_lobby_popup}
			current_band_lobby_popup :Obj_SpawnScriptNow \{create_invite_sent_dialog}
		endif
	else
		if isXenon
			gamemode_gettype
			if (<Type> = career)
				if ScreenElementExists \{id = myinterfaceelement}
					myinterfaceelement :Obj_SpawnScriptNow create_invite_sent_dialog params = {menu_index = <menu_index>}
				endif
			else
				my_parent = friendslistinterface
				if ScreenElementExists \{id = onlinelobbyinterface}
					<my_parent> = onlinelobbyinterface
				endif
				<my_parent> :Obj_SpawnScriptNow create_invite_sent_dialog
				destroy_friendslist_submenu
			endif
		else
			ui_destroy_friends_list
		endif
	endif
endscript

script create_invite_sent_dialog 
	if ($g_band_lobby_flag = 1)
		getscreenelementzpriority \{id = current_band_lobby_popup}
		begin
		if NOT (ScreenElementExists id = invite_sent_container)
			break
		endif
		Wait \{1
			gameframe}
		repeat
		CreateScreenElement {
			Type = ContainerElement
			id = invite_sent_container
			parent = current_band_lobby_popup
			Pos = (640.0, 120.0)
			alpha = 1.0
			z_priority = (<z_priority> + 100)
			just = [center , center]
			tags = {debug_me}
		}
		CreateScreenElement \{parent = invite_sent_container
			id = invitesentinterface
			Type = descinterface
			desc = 'container_gamer_invite'
			Pos = (0.0, 0.0)
			dims = (100.0, 100.0)
			Scale = 1.0
			just = [
				center
				center
			]}
		invite_sent_container :se_setprops \{alpha = 1.0
			time = 1.0}
		invite_sent_container :se_waitprops
		Wait \{1.0
			Second}
		invite_sent_container :se_setprops \{alpha = 0.0
			time = 1.0}
		invite_sent_container :se_waitprops
		if ScreenElementExists \{id = invite_sent_container}
			DestroyScreenElement \{id = invite_sent_container}
		endif
	else
		gamemode_gettype
		if (<Type> = career)
			getscreenelementzpriority \{id = myinterfaceelement}
		else
			getscreenelementzpriority \{id = friendslistinterface}
		endif
		begin
		if NOT (ScreenElementExists id = invite_sent_container)
			break
		endif
		Wait \{1
			gameframe}
		repeat
		if (<Type> = career)
			my_parent = myinterfaceelement
			switch <menu_index>
				case 0
				Change \{invite_sent_display_position = (250.0, 290.0)}
				case 1
				Change \{invite_sent_display_position = (510.0, 290.0)}
				case 2
				Change \{invite_sent_display_position = (770.0, 290.0)}
				case 3
				Change \{invite_sent_display_position = (1030.0, 290.0)}
			endswitch
			Scale = 0.7
		else
			my_parent = friendslistinterface
			if ScreenElementExists \{id = onlinelobbyinterface}
				<my_parent> = onlinelobbyinterface
			endif
			Scale = 1.0
		endif
		CreateScreenElement {
			Type = ContainerElement
			id = invite_sent_container
			parent = <my_parent>
			Pos = $invite_sent_display_position
			alpha = 0.0
			z_priority = (<z_priority> + 10)
			just = [center , center]
			tags = {debug_me}
		}
		CreateScreenElement {
			parent = invite_sent_container
			id = invitesentinterface
			Type = descinterface
			desc = 'container_gamer_invite'
			Pos = (0.0, 0.0)
			dims = (100.0, 100.0)
			Scale = <Scale>
			just = [center , center]
		}
		invite_sent_container :se_setprops \{alpha = 1.0
			time = 1.0}
		invite_sent_container :se_waitprops
		Wait \{1.0
			Second}
		invite_sent_container :se_setprops \{alpha = 0.0
			time = 1.0}
		invite_sent_container :se_waitprops
		if ScreenElementExists \{id = invite_sent_container}
			DestroyScreenElement \{id = invite_sent_container}
		endif
		Change \{invite_sent_display_position = (640.0, 360.0)}
	endif
endscript

script pre_friends_accept_invite \{index = 0}
	printf \{qs(0xd76e1833)}
	band_lobby_change_focus_submenu_all \{focus_type = unfocus}
	RequireParams \{[
			Player
			viewport_index
		]
		all}
	band_lobby_whole_band_autosave choose_script = friends_accept_invite <...> scan_dlc_if_online
endscript

script friends_accept_invite \{index = 0}
	printf \{qs(0x3ee15c27)}
	if ($demonware_stun_failed = 1)
		if ScreenElementExists \{id = current_band_lobby_popup}
			if current_band_lobby_popup :se_getparentid
				band_lobby_destroy_popup_menu container = <parent_id>
			endif
		endif
		formatText \{TextName = dialog_text
			qs(0xcfb2fe82)
			s = $wii_demonware_error_not_available
			d = 11500}
		band_lobby_change_focus_submenu_all \{focus_type = unfocus}
		create_dialog_box {
			template = large_body
			heading_text = qs(0x79597197)
			body_text = <dialog_text>
			options = [
				{
					func = friends_accept_invite_failed_dialog_ok
					text = qs(0x0e41fe46)
				}
			]
		}
		return
	endif
	NetSessionFunc Obj = friends func = accept_invite params = {net_id = <net_id>}
	band_lobby_remove_invite_from_popup net_id = <net_id>
endscript

script friends_accept_invite_failed_already_in_session 
	if ScreenElementExists \{id = invitelist_popup}
		invitelist_popup :GetTags
		if GotParam \{Player}
			getplayerinfo <Player> controller
			band_lobby_update_button_helpers menu = inviteslist Player = <Player> controller = <controller>
			band_lobby_change_focus_submenu_all \{focus_type = focus}
		endif
	endif
endscript

script friends_accept_invite_failed_dialog_ok 
	destroy_dialog_box
	band_lobby_update_button_helpers
	band_lobby_change_focus_submenu_all \{focus_type = focus}
endscript

script invite_send_failed_dialog 
	printf \{qs(0xa7bbcf57)}
	if (($g_inviting_player) = -1)
		ScriptAssert \{qs(0x2eb90d23)}
	else
		current_player = ($g_inviting_player)
		Change \{g_inviting_player = -1}
	endif
	if ($g_lobby_was_local_before_invite = 1)
		band_lobby_change_network network = local focus = 0 Player = <current_player>
	else
		Change \{g_lobby_was_local_before_invite = 1}
	endif
	if ScreenElementExists \{id = current_band_lobby_popup}
		if current_band_lobby_popup :se_getparentid
			band_lobby_destroy_popup_menu container = <parent_id>
		endif
	endif
	sdcardmanagerfunc \{func = net_hold_ejects
		OFF}
	show_last_connection_error \{unfocus_script = band_lobby_change_focus_submenu_all
		unfocus_params = {
			focus_type = unfocus
		}
		continue_script = band_lobby_return_from_error}
endscript

script friend_dbg_print_invites 
	NetSessionFunc \{Obj = friends
		func = print_invites}
endscript

script friend_dbg_accept_invite \{index = 0}
	NetSessionFunc Obj = friends func = accept_invite params = {index = <index>}
endscript

script friend_dbg_remove_invite \{index = 0}
	NetSessionFunc Obj = friends func = remove_invite params = {index = <index>}
endscript

script friend_dbg_begin_retrieve_friend_list 
	NetSessionFunc \{Obj = friends
		func = begin_retrieve_friends_list
		params = {
			callback = test_friends_callback
			callback_params = {
				None
			}
		}}
endscript

script friend_dbg_get_demonware_friends 
	NetSessionFunc \{Obj = friends
		func = get_demonware_friends}
endscript

script friend_dbg_get_incoming_proposals 
	NetSessionFunc \{Obj = friends
		func = get_incoming_proposals}
endscript

script friend_dbg_get_outgoing_proposals 
	NetSessionFunc \{Obj = friends
		func = get_outgoing_proposals}
endscript

script friend_dbg_send_friend_request \{userid = 0}
	NetSessionFunc Obj = friends func = send_friend_request params = {userid = <userid>}
endscript

script friend_dbg_accept_proposal \{userid = 0}
	NetSessionFunc Obj = friends func = accept_proposal params = {userid = <userid>}
endscript

script friend_dbg_reject_proposal \{userid = 0}
	NetSessionFunc Obj = friends func = reject_proposal params = {userid = <userid>}
endscript

script friend_dbg_withdraw_proposal \{userid = 0}
	NetSessionFunc Obj = friends func = withdraw_proposal params = {userid = <userid>}
endscript

script friend_dbg_remove_friend \{userid = 0}
	NetSessionFunc Obj = friends func = remove_friend params = {userid = <userid>}
endscript

script friend_dbg_get_id 
	NetSessionFunc \{func = get_user_id
		params = {
			controller_index = 0
		}}
endscript
