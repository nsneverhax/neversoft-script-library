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
	Obj_GetID
	LaunchEvent \{Type = unfocus
		target = current_menu}
	<objID> :se_getprops
	friends_list_z = (<z_priority> + 100)
	GetScreenElementPosition id = <objID> absolute
	CreateScreenElement {
		Type = descinterface
		parent = <my_parent>
		desc = 'online_lobby_submenu'
		Pos = $bx_matchmaking_submenu_pos
		id = friendslistinterface
		exclusive_device = <device_num>
		z_priority = <friends_list_z>
		tags = {
			menu_index = 0
			menu_items = 0
			device_num = <device_num>
			exit_Script = <exit_Script>
			scrollbar_id = NULL
		}
	}
	friendslistinterface :se_setprops \{title_text = qs(0xf41fb4ee)}
	adjust_highlight_z z_pri = (<friends_list_z> + 1)
	if friendslistinterface :desc_resolvealias \{Name = alias_online_lobby_scrollbar
			param = scrollbar_id}
		friendslistinterface :SetTags scrollbar_id = <scrollbar_id>
	endif
	create_submenu_fade submenu_z = (<friends_list_z> - 110) fade_id = friends_list_z parent = friendslistinterface
	create_friendslist_menu device_num = <device_num>
	clean_up_user_control_helpers
	menu_finish
endscript

script animate_submenu_transition 
	RequireParams \{[
			id
			direction
		]
		all}
	if ScreenElementExists id = <id>
		if (<direction> = out)
		elseif (<direction> = in)
			RequireParams \{[
					focus_index
				]
				all}
			if <id> :desc_resolvealias Name = alias_popup_vmenu
				LaunchEvent Type = focus target = <resolved_id> data = {child_index = (<focus_index>)}
			endif
		endif
	endif
endscript

script ui_destroy_friends_list 
	destroy_submenu_fade \{fade_id = friends_list_z}
	if ScreenElementExists \{id = friendslistinterface}
		highlightstars :se_setprops \{alpha = 0}
		generic_menu_pad_back_sound
		NetSessionFunc \{func = friends_uninit}
		animate_submenu_transition \{id = friendslistinterface
			direction = out}
		friendslistinterface :GetTags
		DestroyScreenElement \{id = friendslistinterface}
		if GotParam \{no_focus}
			SpawnScriptNow <exit_Script> params = {no_focus}
		else
			SpawnScriptNow <exit_Script>
		endif
	endif
	adjust_highlight_z \{z_pri = 2}
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
	if friendslistinterface :desc_resolvealias \{Name = alias_popup_vmenu}
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
			if friendslistinterface :desc_resolvealias \{Name = alias_online_lobby_scrollbar
					param = scrollbar_id}
				<scrollbar_id> :Die
			endif
			friendslistinterface :SetTags \{scrollbar_id = NULL}
			friendslistinterface :Obj_SpawnScriptNow \{animate_submenu_transition
				params = {
					id = friendslistinterface
					direction = in
					focus_index = 0
				}}
		else
			NetSessionFunc \{func = friends_init}
			NetSessionFunc Obj = friends func = begin_retrieve_friends_list params = {callback = friendslist_callback device_num = <device_num> callback_params = {None}}
		endif
		AssignAlias id = <resolved_id> alias = friends_list_popup
	endif
endscript

script friendslist_up_or_down_action 
	if NOT GotParam \{action}
		return
	endif
	if NOT ScreenElementExists \{id = friends_list_popup}
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
			if friendslistinterface :desc_resolvealias \{Name = alias_popup_vmenu}
				GetArraySize <friendlist>
				if (<array_Size> > 0)
					i = 0
					begin
					if isXenon
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
							isfriend
						}
					else
						add_friendslist_item {
							vmenu_id = <resolved_id>
							text = (<friendlist> [<i>].Name)
							choose_script = create_friendslist_submenu
							choose_script_params = {
								net_id = (<friendlist> [<i>].id)
								Name = (<friendlist> [<i>].Name)
							}
							isfriend
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
							isfriend
						}
						repeat 92
					endif
					friendslistinterface :Obj_SpawnScriptNow \{animate_submenu_transition
						params = {
							id = friendslistinterface
							direction = in
							focus_index = 0
						}}
				else
					add_friendslist_item {
						vmenu_id = <resolved_id>
						text = qs(0x3e8a16b2)
					}
					friendslistinterface :Obj_SpawnScriptNow \{animate_submenu_transition
						params = {
							id = friendslistinterface
							direction = in
							focus_index = 0
						}}
				endif
				friendslistinterface :GetTags
				if (<menu_items> > 5)
					scroll_increment = (175 / (<menu_items> -1))
					<scrollbar_id> :SetTags scroll_increment = <scroll_increment>
					<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 0.0)
				else
					DestroyScreenElement id = <scrollbar_id>
					friendslistinterface :se_setprops \{h_padding_scale = 0}
				endif
			endif
		endif
	endif
endscript

script friendslist_item_change_focus 
	GetTags
	if GotParam \{focus}
		Wait \{1
			gameframe}
		<text_id> :se_setprops rgba = (($g_menu_colors).menu_title)
		bx_focushighlightstarson objID = <text_id>
	else
		<text_id> :se_setprops rgba = (($g_menu_colors).menu_gold)
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
	if GotParam \{isfriend}
		dims = (410.0, 48.0)
	else
		dims = (410.0, 55.0)
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <vmenu_id>
		Pos = (0.0, 0.0)
		dims = <dims>
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
		font = fontgrid_bordello
		rgba = (($g_menu_colors).menu_gold)
		Shadow
		shadow_rgba = $UI_text_shadow_color
		shadow_offs = (3.0, 3.0)
		Pos = (18.0, 0.0)
		dims = <dims>
		alpha = 1.0
		text = <text>
		just = [left top]
		z_priority = (<z_priority> + 0.5)
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		internal_just = [left center]
	}
	bx_resizetextfield {
		id = <id>
		dims = <dims>
		fit_width = `scale	each	line	if	larger`
	}
	<id> :se_getprops
	<container_id> :se_setprops dims = <dims>
	<container_id> :SetTags text_id = <id>
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
		icon_pos = (((<Pos> + <dims>) / 2) + (-230.0, 0.0))
		CreateScreenElement {
			Type = SpriteElement
			parent = <container_id>
			texture = <status_texture>
			Pos = <icon_pos>
			dims = (32.0, 32.0)
			just = [center center]
			z_priority = (<z_priority> + 1)
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
		target = friends_list_popup}
	Obj_GetID
	<objID> :se_getprops
	<z_priority> = (<z_priority> + 5)
	adjust_highlight_z z_pri = (<z_priority> + 6)
	GetScreenElementPosition id = <objID> absolute
	if ((<screenelementpos>.(0.0, 1.0)) > 320)
		X = (<screenelementpos>.(1.0, 0.0))
		<screenelementpos> = (((1.0, 0.0) * <X>) + ((0.0, 1.0) * 320))
	endif
	friendslistinterface :se_setprops \{alpha = 0.01}
	CreateScreenElement {
		Type = descinterface
		parent = friendslistinterface
		desc = 'online_lobby_submenu'
		id = friendssubmenuinterface
		Pos = $bx_matchmaking_submenu_pos
		z_priority = <z_priority>
		tags = {
			menu_items = 0
			menu_index = 0
			scrollbar_id = net_pref_submenu_scrollbar
		}
		alpha = 100.0
	}
	friendssubmenuinterface :se_setprops title_text = <Name>
	create_submenu_fade submenu_z = (<z_priority> - 10) fade_id = friends_list_submenu_z parent = friendssubmenuinterface
	if ScreenElementExists \{id = invite_sent_container}
		invite_sent_container :se_setprops \{alpha = 0.0}
		DestroyScreenElement \{id = invite_sent_container}
	endif
	if friendssubmenuinterface :desc_resolvealias \{Name = alias_popup_vmenu
			param = subvmenu_id}
		SetScreenElementProps {
			id = <subvmenu_id>
			event_handlers = [
				{pad_back generic_menu_pad_back_sound}
				{pad_back destroy_friendslist_submenu}
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		}
		if friendssubmenuinterface :desc_resolvealias \{Name = alias_online_lobby_scrollbar
				param = scrollbar_id}
			<scrollbar_id> :Die
		endif
		if isXenon
			add_friendslist_item {
				sub_menu_item
				vmenu_id = <subvmenu_id>
				text = qs(0xce3d9374)
				z_priority = (<z_priority> + 2)
				choose_script = menu_show_gamercard_from_netid
				choose_script_params = {
					net_id = <net_id>
				}
			}
		endif
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
		friendssubmenuinterface :Obj_SpawnScriptNow \{animate_submenu_transition
			params = {
				id = friendssubmenuinterface
				direction = in
				focus_index = 0
			}}
	endif
endscript

script destroy_friendslist_submenu 
	destroy_submenu_fade \{fade_id = friends_list_submenu_z}
	animate_submenu_transition \{id = friendssubmenuinterface
		direction = out}
	if ScreenElementExists \{id = friendssubmenuinterface}
		DestroyScreenElement \{id = friendssubmenuinterface}
	endif
	friendslistinterface :GetTags
	highlightstars :se_setprops \{alpha = 0}
	friendslistinterface :se_setprops \{alpha = 1.0}
	if friendslistinterface :desc_resolvealias \{Name = alias_popup_vmenu}
		menu_id = <resolved_id>
		ResolveScreenElementID id = [
			{id = <menu_id>}
			{index = <menu_index>}
		]
		friendslistinterface :se_getprops \{z_priority}
		adjust_highlight_z z_pri = (<z_priority> + 1)
		LaunchEvent Type = focus target = <menu_id> data = {child_index = (<menu_index>)}
	endif
endscript

script invite_to_game 
	RequireParams \{[
			instrument
		]
		all}
	if isXenon
		bx_join_text = qs(0xe02544a2)
		bx_invite_text = qs(0xc2b47af8)
	else
		formatText \{TextName = bx_join_text
			qs(0x192157bd)
			a = $bx_game_title
			AddToStringLookup}
		formatText \{TextName = bx_invite_text
			qs(0x68644f2b)
			a = $bx_short_game_title
			AddToStringLookup}
	endif
	base_msg = <bx_join_text>
	invite_title = <bx_invite_text>
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
endscript

script create_invite_sent_dialog 
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
	SpawnScriptNow \{check_to_hide_element
		params = {
			elementtohide = invite_sent_container
		}}
	if ScreenElementExists \{id = friendslistinterface}
		invite_sent_container :se_setprops \{alpha = 1.0
			time = 0.5}
		invite_sent_container :se_waitprops
	endif
	Wait \{0.5
		Second}
	if ScreenElementExists \{id = invite_sent_container}
		invite_sent_container :se_setprops \{alpha = 0.0
			time = 1.0}
		invite_sent_container :se_waitprops
		DestroyScreenElement \{id = invite_sent_container}
	endif
	Change \{invite_sent_display_position = (640.0, 360.0)}
endscript

script check_to_hide_element 
	begin
	if NOT (ScreenElementExists id = <elementtohide>)
		break
	else
		if NOT (ScreenElementExists id = friendslistinterface)
			<elementtohide> :se_setprops alpha = 0.0
			DestroyScreenElement id = <elementtohide>
			break
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript
