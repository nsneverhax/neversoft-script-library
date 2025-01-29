DEBUG_FRIENDS_LIST = 0
invite_sent_display_position = (640.0, 360.0)

script ui_create_friends_list 
	RequireParams \{[
			exit_Script
		]
		all}
	<my_parent> = root_window
	if ScreenElementExists \{id = OnlineLobbyInterface}
		<my_parent> = OnlineLobbyInterface
	endif
	CreateScreenElement {
		type = DescInterface
		parent = <my_parent>
		desc = 'online_lobby_left_side'
		Pos = (0.0, -1000.0)
		id = FriendsListInterface
		exclusive_device = <device_num>
		tags = {
			menu_index = 0
			menu_items = 0
			device_num = <device_num>
			exit_Script = <exit_Script>
			scrollbar_id = null
		}
	}
	FriendsListInterface :Desc_CheckVersion \{desired = 2
		AssertIf = Mismatch}
	<id> :SE_SetProps title_text = qs(0xf41fb4ee)
	set_friends_helper_text \{msg_checksum = friends_menu}
	if FriendsListInterface :Desc_ResolveAlias \{name = alias_online_lobby_scrollbar
			param = scrollbar_id}
		FriendsListInterface :SetTags scrollbar_id = <scrollbar_id>
	endif
	<id> :Obj_SpawnScriptNow animate_left_side params = {direction = in}
	create_friendslist_menu device_num = <device_num>
	clean_up_user_control_helpers
	menu_finish
endscript

script animate_left_side \{id = FriendsListInterface}
	if ScreenElementExists id = <id>
		switch (<direction>)
			case out
			<id> :SE_SetProps Pos = {(0.0, -1000.0) relative} time = 0.15 anim = gentle
			case in
			<id> :SE_SetProps Pos = {(0.0, 1000.0) relative} time = 0.15 anim = gentle
		endswitch
	else
		return
	endif
	wait \{0.15
		second}
	if GotParam \{focus_id}
		LaunchEvent type = focus target = <focus_id> data = {child_index = (<focus_index>)}
	endif
endscript

script ui_destroy_friends_list 
	if ScreenElementExists \{id = FriendsListInterface}
		generic_menu_pad_back_sound
		NetSessionFunc \{func = friends_uninit}
		animate_left_side \{direction = out}
		FriendsListInterface :GetTags
		DestroyScreenElement \{id = FriendsListInterface}
		if GotParam \{no_focus}
			spawnscriptnow <exit_Script> params = {no_focus}
		else
			spawnscriptnow <exit_Script>
		endif
	endif
endscript

script set_friends_helper_text 
	if NOT GotParam \{msg_checksum}
		return
	endif
	if IsXenonOrWinDX
		plat_helper_strings = net_helper_text_strings_xen
	elseif IsPS3
		plat_helper_strings = net_helper_text_strings_ps3
	endif
	AppendSuffixToChecksum base = <msg_checksum> SuffixString = '_text'
	if StructureContains structure = ($<plat_helper_strings>) <appended_id>
		if ScreenElementExists \{id = FriendsListInterface}
			FriendsListInterface :SE_SetProps info_text = ($<plat_helper_strings>.<appended_id>)
		endif
	elseif StructureContains structure = ($net_helper_text_strings) <appended_id>
		if ScreenElementExists \{id = FriendsListInterface}
			FriendsListInterface :SE_SetProps info_text = ($net_helper_text_strings.<appended_id>)
		endif
	endif
endscript

script create_friendslist_menu 
	if FriendsListInterface :Desc_ResolveAlias \{name = alias_left_side_vmenu}
		<resolved_id> :SE_SetProps {
			event_handlers = [
				{pad_up friendslist_up_or_down_action params = {action = up}}
				{pad_down friendslist_up_or_down_action params = {action = down}}
			]
		}
		if IsPS3
			add_friendslist_item {
				vmenu_id = <resolved_id>
				text = qs(0x0ee400a5)
				choose_script = invite_to_game
				choose_script_params = {
					net_id = <net_id>
					name = <name>
					instrument = guitar
				}
			}
			add_friendslist_item {
				vmenu_id = <resolved_id>
				text = qs(0xfd92cde8)
				choose_script = invite_to_game
				choose_script_params = {
					net_id = <net_id>
					name = <name>
					instrument = Drum
				}
			}
			add_friendslist_item {
				vmenu_id = <resolved_id>
				text = qs(0x72d3f53a)
				choose_script = invite_to_game
				choose_script_params = {
					net_id = <net_id>
					name = <name>
					instrument = mic
				}
			}
			FriendsListInterface :GetTags
			DestroyScreenElement id = <scrollbar_id>
			FriendsListInterface :SetTags \{scrollbar_id = null}
		else
			NetSessionFunc \{func = friends_init}
			NetSessionFunc Obj = friends func = begin_retrieve_friends_list params = {callback = friendslist_callback device_num = <device_num> callback_params = {None}}
		endif
		AssignAlias id = <resolved_id> alias = current_menu
		LaunchEvent \{type = focus
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
	FriendsListInterface :GetTags
	if (<action> = up)
		generic_menu_up_or_down_sound \{up}
		if (<menu_index> = 0)
			FriendsListInterface :SetTags menu_index = (<menu_items> - 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :SE_SetProps scrollbar_thumb_pos = (0.0, 175.0)
			endif
		else
			FriendsListInterface :SetTags menu_index = (<menu_index> - 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :GetTags
				Pos = ((0.0, -1.0) * <scroll_increment>)
				<scrollbar_id> :SE_SetProps scrollbar_thumb_pos = {<Pos> relative}
			endif
		endif
	elseif (<action> = down)
		generic_menu_up_or_down_sound \{down}
		if (<menu_index> = (<menu_items> - 1))
			FriendsListInterface :SetTags \{menu_index = 0}
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :SE_SetProps scrollbar_thumb_pos = (0.0, 0.0)
			endif
		else
			FriendsListInterface :SetTags menu_index = (<menu_index> + 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :GetTags
				Pos = ((0.0, 1.0) * (<scroll_increment>))
				<scrollbar_id> :SE_SetProps scrollbar_thumb_pos = {<Pos> relative}
			endif
		endif
	endif
endscript

script friendslist_callback 
	printf \{qs(0x984d6ecc)}
	if GotParam \{friendlist}
		if ScreenElementExists \{id = FriendsListInterface}
			if FriendsListInterface :Desc_ResolveAlias \{name = alias_left_side_vmenu}
				GetArraySize <friendlist>
				if (<array_size> > 0)
					i = 0
					begin
					if IsXenonOrWinDX
						if (0 != <friendlist> [<i>].LocalPlayer)
							CANT_INVITE = 1
						elseif (0 != <friendlist> [<i>].AlreadyInGame)
							CANT_INVITE = 1
						else
							CANT_INVITE = 0
						endif
						add_friendslist_item {
							vmenu_id = <resolved_id>
							text = (<friendlist> [<i>].name)
							status = (<friendlist> [<i>].friendstate)
							choose_script = create_friendslist_submenu
							choose_script_params = {
								net_id = (<friendlist> [<i>].id)
								name = (<friendlist> [<i>].name)
								CANT_INVITE = <CANT_INVITE>
							}
						}
					else
						if NetSessionFunc \{Obj = party
								func = is_party_session_available}
							CANT_INVITE = 0
						else
							CANT_INVITE = 1
						endif
						add_friendslist_item {
							vmenu_id = <resolved_id>
							text = (<friendlist> [<i>].name)
							choose_script = create_friendslist_submenu
							choose_script_params = {
								net_id = (<friendlist> [<i>].id)
								name = (<friendlist> [<i>].name)
								CANT_INVITE = <CANT_INVITE>
							}
						}
					endif
					<i> = (<i> + 1)
					repeat <array_size>
					if ($DEBUG_FRIENDS_LIST = 1)
						begin
						add_friendslist_item {
							vmenu_id = <resolved_id>
							text = qs(0x89810324)
							choose_script = create_friendslist_submenu
							choose_script_params = {
								net_id = 0
								name = qs(0x89810324)
							}
						}
						repeat 92
					endif
					LaunchEvent type = focus target = <resolved_id> data = {child_index = 0}
				else
					add_friendslist_item {
						vmenu_id = <resolved_id>
						text = qs(0x3e8a16b2)
					}
					LaunchEvent type = focus target = <resolved_id> data = {child_index = 0}
				endif
				FriendsListInterface :GetTags
				if (<menu_items> > 1)
					scroll_increment = (175 / (<menu_items> -1))
					<scrollbar_id> :SetTags scroll_increment = <scroll_increment>
					<scrollbar_id> :SE_SetProps scrollbar_thumb_pos = (0.0, 0.0)
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
		type = ContainerElement
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
		FriendsListInterface :GetTags
		FriendsListInterface :SetTags menu_items = (<menu_items> + 1)
		width = 385
		text_width = 275
		text_adjust = 0
	endif
	CreateScreenElement {
		type = TextBlockElement
		parent = <container_id>
		local_id = text
		font = fontgrid_text_A1
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
			type = SpriteElement
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
			name
		]
		all}
	LaunchEvent \{type = unfocus
		target = current_menu}
	Obj_GetID
	<objID> :SE_GetProps
	<z_priority> = (<z_priority> + 1)
	if FriendsListInterface :Desc_ResolveAlias \{name = alias_left_side_vscollingmenu}
		<resolved_id> :SE_SetProps dims = (256.0, 1000.0) time = 0.2
		ResolveScreenElementID \{id = [
				{
					id = FriendsListInterface
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
			<objID> :SE_SetProps dims = (385.0, 575.0)
			<resolved_id> :SE_SetProps Pos = {((0.0, 1.0) * <difference>) relative}
			break
		endif
		<objID> :SE_SetProps dims = ((0.0, 1.0) * <dim_y> + (385.0, 0.0))
		<resolved_id> :SE_SetProps Pos = {(0.0, 45.0) relative}
		wait \{1
			gameframe}
		repeat
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = <objID>
		id = friendslist_submenu_container
		Pos = (0.0, 0.0)
		just = [left top]
		z_priority = <z_priority>
	}
	container_id = <id>
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		texture = list_container
		Pos = (-35.0, 50.0)
		dims = (400.0, 215.0)
		just = [left top]
		alpha = 1.0
		z_priority = (<z_priority> + 0.2)
	}
	CreateScreenElement {
		type = vmenu
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
	DONT_SHOW_INVITE_OPTIONS = 0
	if GotParam \{CANT_INVITE}
		if (1 = <CANT_INVITE>)
			<DONT_SHOW_INVITE_OPTIONS> = 1
		endif
	endif
	if (0 = <DONT_SHOW_INVITE_OPTIONS>)
		add_friendslist_item {
			sub_menu_item
			vmenu_id = <subvmenu_id>
			text = qs(0x0ee400a5)
			z_priority = (<z_priority> + 2)
			choose_script = invite_to_game
			choose_script_params = {
				net_id = <net_id>
				name = <name>
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
				name = <name>
				instrument = Drum
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
				name = <name>
				instrument = mic
			}
		}
	endif
	AssignAlias id = <subvmenu_id> alias = current_menu
	LaunchEvent \{type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
endscript

script destroy_friendslist_submenu 
	if ScreenElementExists \{id = friendslist_submenu_container}
		DestroyScreenElement \{id = friendslist_submenu_container}
	endif
	FriendsListInterface :GetTags
	if FriendsListInterface :Desc_ResolveAlias \{name = alias_left_side_vmenu}
		menu_id = <resolved_id>
		ResolveScreenElementID \{id = [
				{
					id = FriendsListInterface
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
			<info_container> :SE_SetProps Pos = {((0.0, -1.0) * <difference>) relative}
			<resolved_id> :SE_SetProps dims = (385.0, 42.0)
			break
		endif
		<resolved_id> :SE_SetProps dims = (((0.0, 1.0) * <dim_y>) + (385.0, 0.0))
		<info_container> :SE_SetProps Pos = {(0.0, -45.0) relative}
		wait \{1
			gameframe}
		repeat
		if FriendsListInterface :Desc_ResolveAlias \{name = alias_left_side_vscollingmenu}
			<resolved_id> :SE_SetProps dims = (256.0, 215.0)
		endif
		LaunchEvent type = focus target = <menu_id> data = {child_index = (<menu_index>)}
	endif
	if FriendsListInterface :Desc_ResolveAlias \{name = alias_left_side_vmenu}
		wait \{3
			gameframes}
		AssignAlias id = <resolved_id> alias = current_menu
	endif
endscript

script invite_to_game 
	RequireParams \{[
			instrument
		]
		all}
	invite_title = qs(0xb8b553b3)
	base_msg = qs(0xa7e4b1ac)
	switch (<instrument>)
		case guitar
		FormatText TextName = invite_msg qs(0xb3a143ba) s = <base_msg> i = qs(0x00000000)
		case Drum
		FormatText TextName = invite_msg qs(0xb3a143ba) s = <base_msg> i = qs(0x00000000)
		case mic
		FormatText TextName = invite_msg qs(0xb3a143ba) s = <base_msg> i = qs(0x00000000)
	endswitch
	userList = [
		{
			name = <name>
			id = <net_id>
		}
	]
	invite_successful = 0
	if NetSessionFunc func = CreateCustomInvite params = {
			userList = <userList>
			game_msg = <invite_msg>
			Title = <invite_title>
			game_specific = <instrument>
			device_num = <device_num>
		}
		invite_successful = 1
	endif
	if ($g_band_lobby_flag = 1)
		if ScreenElementExists \{id = current_band_lobby_popup}
			if IsXenonOrWinDX
				current_band_lobby_popup :Obj_SpawnScriptNow create_invite_sent_dialog params = {invite_successful = <invite_successful>}
			endif
		endif
		if (<invite_successful> = 1)
			Change \{g_lobby_invite_flag = 1}
		endif
		j = 0
		begin
		band_lobby_add_menu_update_to_queue submenu_index = <j> focus = 0
		j = (<j> + 1)
		repeat ($g_num_lobby_local_submenus)
	else
		if IsXenonOrWinDX
			GameMode_GetType
			if (<type> = career)
				if ScreenElementExists \{id = MyInterfaceElement}
					MyInterfaceElement :Obj_SpawnScriptNow create_invite_sent_dialog params = {menu_index = <menu_index>}
				endif
			else
				my_parent = FriendsListInterface
				if ScreenElementExists \{id = OnlineLobbyInterface}
					<my_parent> = OnlineLobbyInterface
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
	RequireParams \{[
			invite_successful
		]
		all}
	if ($g_band_lobby_flag = 1)
		GetScreenElementZPriority \{id = band_lobby_popup_menu}
		begin
		if NOT (ScreenElementExists id = invite_sent_container)
			break
		endif
		wait \{1
			gameframe}
		repeat
		CreateScreenElement {
			type = ContainerElement
			id = invite_sent_container
			parent = current_band_lobby_popup
			Pos = (640.0, 120.0)
			alpha = 1.0
			z_priority = (<z_priority> + 10)
			just = [center , center]
			tags = {debug_me}
		}
		CreateScreenElement \{parent = invite_sent_container
			id = InviteSentInterface
			type = DescInterface
			desc = 'container_gamer_invite'
			Pos = (0.0, 0.0)
			dims = (100.0, 100.0)
			scale = 1.0
			just = [
				center
				center
			]}
		if (<invite_successful> = 0)
			<id> :SE_SetProps text_popup_text = ($band_lobby_strings.invite_failed)
		endif
		invite_sent_container :SE_SetProps \{alpha = 1.0
			time = 1.0}
		invite_sent_container :SE_WaitProps
		wait \{1.0
			second}
		invite_sent_container :SE_SetProps \{alpha = 0.0
			time = 1.0}
		invite_sent_container :SE_WaitProps
		if ScreenElementExists \{id = invite_sent_container}
			DestroyScreenElement \{id = invite_sent_container}
		endif
	else
		GameMode_GetType
		if (<type> = career)
			GetScreenElementZPriority \{id = MyInterfaceElement}
		else
			GetScreenElementZPriority \{id = FriendsListInterface}
		endif
		begin
		if NOT (ScreenElementExists id = invite_sent_container)
			break
		endif
		wait \{1
			gameframe}
		repeat
		if (<type> = career)
			my_parent = MyInterfaceElement
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
			scale = 0.7
		else
			my_parent = FriendsListInterface
			if ScreenElementExists \{id = OnlineLobbyInterface}
				<my_parent> = OnlineLobbyInterface
			endif
			scale = 1.0
		endif
		CreateScreenElement {
			type = ContainerElement
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
			id = InviteSentInterface
			type = DescInterface
			desc = 'container_gamer_invite'
			Pos = (0.0, 0.0)
			dims = (100.0, 100.0)
			scale = <scale>
			just = [center , center]
		}
		invite_sent_container :SE_SetProps \{alpha = 1.0
			time = 1.0}
		invite_sent_container :SE_WaitProps
		wait \{1.0
			second}
		invite_sent_container :SE_SetProps \{alpha = 0.0
			time = 1.0}
		invite_sent_container :SE_WaitProps
		if ScreenElementExists \{id = invite_sent_container}
			DestroyScreenElement \{id = invite_sent_container}
		endif
		Change \{invite_sent_display_position = (640.0, 360.0)}
	endif
endscript
