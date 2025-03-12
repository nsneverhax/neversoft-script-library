debug_friends_list = 0
invite_sent_display_position = (640.0, 360.0)

script ui_create_friends_list 
	requireparams \{[
			exit_script
		]
		all}
	<my_parent> = root_window
	if screenelementexists \{id = onlinelobbyinterface}
		<my_parent> = onlinelobbyinterface
	endif
	createscreenelement {
		type = descinterface
		parent = <my_parent>
		desc = 'online_lobby_left_side'
		pos = (0.0, -1000.0)
		id = friendslistinterface
		exclusive_device = <device_num>
		tags = {
			menu_index = 0
			menu_items = 0
			device_num = <device_num>
			exit_script = <exit_script>
			scrollbar_id = null
		}
	}
	friendslistinterface :desc_checkversion \{desired = 2
		assertif = mismatch}
	<id> :se_setprops title_text = qs(0xf41fb4ee)
	set_friends_helper_text \{msg_checksum = friends_menu}
	if friendslistinterface :desc_resolvealias \{name = alias_online_lobby_scrollbar
			param = scrollbar_id}
		friendslistinterface :settags scrollbar_id = <scrollbar_id>
	endif
	<id> :obj_spawnscriptnow animate_left_side params = {direction = in}
	create_friendslist_menu device_num = <device_num>
	clean_up_user_control_helpers
	menu_finish
endscript

script animate_left_side \{id = friendslistinterface}
	if screenelementexists id = <id>
		switch (<direction>)
			case out
			<id> :se_setprops pos = {(0.0, -1000.0) relative} time = 0.15 anim = gentle
			case in
			<id> :se_setprops pos = {(0.0, 1000.0) relative} time = 0.15 anim = gentle
		endswitch
	else
		return
	endif
	wait \{0.15
		second}
	if gotparam \{focus_id}
		launchevent type = focus target = <focus_id> data = {child_index = (<focus_index>)}
	endif
endscript

script ui_destroy_friends_list 
	if screenelementexists \{id = friendslistinterface}
		generic_menu_pad_back_sound
		netsessionfunc \{func = friends_uninit}
		animate_left_side \{direction = out}
		friendslistinterface :gettags
		destroyscreenelement \{id = friendslistinterface}
		if gotparam \{no_focus}
			spawnscriptnow <exit_script> params = {no_focus}
		else
			spawnscriptnow <exit_script>
		endif
	endif
endscript

script set_friends_helper_text 
	if NOT gotparam \{msg_checksum}
		return
	endif
	if isxenonorwindx
		plat_helper_strings = net_helper_text_strings_xen
	elseif isps3
		plat_helper_strings = net_helper_text_strings_ps3
	endif
	appendsuffixtochecksum base = <msg_checksum> suffixstring = '_text'
	if structurecontains structure = ($<plat_helper_strings>) <appended_id>
		if screenelementexists \{id = friendslistinterface}
			friendslistinterface :se_setprops info_text = ($<plat_helper_strings>.<appended_id>)
		endif
	elseif structurecontains structure = ($net_helper_text_strings) <appended_id>
		if screenelementexists \{id = friendslistinterface}
			friendslistinterface :se_setprops info_text = ($net_helper_text_strings.<appended_id>)
		endif
	endif
endscript

script create_friendslist_menu 
	if friendslistinterface :desc_resolvealias \{name = alias_left_side_vmenu}
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
					instrument = drum
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
			friendslistinterface :gettags
			destroyscreenelement id = <scrollbar_id>
			friendslistinterface :settags \{scrollbar_id = null}
		else
			netsessionfunc \{func = friends_init}
			netsessionfunc obj = friends func = begin_retrieve_friends_list params = {callback = friendslist_callback device_num = <device_num> callback_params = {none}}
		endif
		assignalias id = <resolved_id> alias = current_menu
		launchevent \{type = focus
			target = current_menu}
	endif
endscript

script friendslist_up_or_down_action 
	if NOT gotparam \{action}
		return
	endif
	if NOT screenelementexists \{id = current_menu}
		return
	endif
	friendslistinterface :gettags
	if (<action> = up)
		generic_menu_up_or_down_sound \{up}
		if (<menu_index> = 0)
			friendslistinterface :settags menu_index = (<menu_items> - 1)
			if screenelementexists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 175.0)
			endif
		else
			friendslistinterface :settags menu_index = (<menu_index> - 1)
			if screenelementexists id = <scrollbar_id>
				<scrollbar_id> :gettags
				pos = ((0.0, -1.0) * <scroll_increment>)
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = {<pos> relative}
			endif
		endif
	elseif (<action> = down)
		generic_menu_up_or_down_sound \{down}
		if (<menu_index> = (<menu_items> - 1))
			friendslistinterface :settags \{menu_index = 0}
			if screenelementexists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 0.0)
			endif
		else
			friendslistinterface :settags menu_index = (<menu_index> + 1)
			if screenelementexists id = <scrollbar_id>
				<scrollbar_id> :gettags
				pos = ((0.0, 1.0) * (<scroll_increment>))
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = {<pos> relative}
			endif
		endif
	endif
endscript

script friendslist_callback 
	printf \{qs(0x984d6ecc)}
	if gotparam \{friendlist}
		if screenelementexists \{id = friendslistinterface}
			if friendslistinterface :desc_resolvealias \{name = alias_left_side_vmenu}
				getarraysize <friendlist>
				if (<array_size> > 0)
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
							text = (<friendlist> [<i>].name)
							status = (<friendlist> [<i>].friendstate)
							choose_script = create_friendslist_submenu
							choose_script_params = {
								net_id = (<friendlist> [<i>].id)
								name = (<friendlist> [<i>].name)
								cant_invite = <cant_invite>
							}
						}
					else
						if netsessionfunc \{obj = party
								func = is_party_session_available}
							cant_invite = 0
						else
							cant_invite = 1
						endif
						add_friendslist_item {
							vmenu_id = <resolved_id>
							text = (<friendlist> [<i>].name)
							choose_script = create_friendslist_submenu
							choose_script_params = {
								net_id = (<friendlist> [<i>].id)
								name = (<friendlist> [<i>].name)
								cant_invite = <cant_invite>
							}
						}
					endif
					<i> = (<i> + 1)
					repeat <array_size>
					if ($debug_friends_list = 1)
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
					launchevent type = focus target = <resolved_id> data = {child_index = 0}
				else
					add_friendslist_item {
						vmenu_id = <resolved_id>
						text = qs(0x3e8a16b2)
					}
					launchevent type = focus target = <resolved_id> data = {child_index = 0}
				endif
				friendslistinterface :gettags
				if (<menu_items> > 1)
					scroll_increment = (175 / (<menu_items> -1))
					<scrollbar_id> :settags scroll_increment = <scroll_increment>
					<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 0.0)
				else
					destroyscreenelement id = <scrollbar_id>
				endif
			endif
		endif
	endif
endscript

script friendslist_item_change_focus 
	obj_getid
	resolvescreenelementid id = [
		{id = <objid>}
		{local_id = text}
	]
	if gotparam \{focus}
		retail_menu_focus id = <resolved_id> fire_font
	elseif gotparam \{unfocus}
		retail_menu_unfocus id = <resolved_id>
	endif
endscript

script add_friendslist_item \{vmenu_id = friendslist_vmenu
		z_priority = 8.2}
	if NOT gotparam \{vmenu_id}
		return
	endif
	if NOT gotparam \{text}
		text = qs(0x134b7e69)
	endif
	createscreenelement {
		type = containerelement
		parent = <vmenu_id>
		pos = (0.0, 0.0)
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
	if gotparam \{choose_script}
		addarrayelement array = <event_handlers> element = {pad_choose generic_menu_pad_choose_sound}
		<event_handlers> = <array>
		addarrayelement array = <event_handlers> element = {pad_choose <choose_script> params = <choose_script_params>}
		<event_handlers> = <array>
	endif
	setscreenelementprops {
		id = <container_id>
		event_handlers = <event_handlers>
	}
	if gotparam \{sub_menu_item}
		text_width = 265
		text_adjust = 15
	else
		friendslistinterface :gettags
		friendslistinterface :settags menu_items = (<menu_items> + 1)
		width = 385
		text_width = 275
		text_adjust = 0
	endif
	createscreenelement {
		type = textblockelement
		parent = <container_id>
		local_id = text
		font = fontgrid_text_a1
		rgba = ($menu_unfocus_color)
		pos = ((0.0, 0.0) + (1.0, 0.0) * <text_adjust>)
		dims = ((0.0, 42.0) + (1.0, 0.0) * <text_width>)
		alpha = 1.0
		text = <text>
		just = [left top]
		z_priority = (<z_priority> + 0.5)
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = `per axis`
		internal_just = [left center]
	}
	if gotparam \{status}
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
		createscreenelement {
			type = spriteelement
			parent = <container_id>
			texture = <status_texture>
			pos = ((32.0, 5.0) + (1.0, 0.0) * <text_width>)
			dims = (32.0, 32.0)
			just = [center top]
			z_priority = (<z_priority> + 5)
		}
	endif
	return id = <container_id>
endscript

script create_friendslist_submenu 
	requireparams \{[
			net_id
			name
		]
		all}
	launchevent \{type = unfocus
		target = current_menu}
	obj_getid
	<objid> :se_getprops
	<z_priority> = (<z_priority> + 1)
	if friendslistinterface :desc_resolvealias \{name = alias_left_side_vscollingmenu}
		<resolved_id> :se_setprops dims = (256.0, 1000.0) time = 0.2
		resolvescreenelementid \{id = [
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
			<objid> :se_setprops dims = (385.0, 575.0)
			<resolved_id> :se_setprops pos = {((0.0, 1.0) * <difference>) relative}
			break
		endif
		<objid> :se_setprops dims = ((0.0, 1.0) * <dim_y> + (385.0, 0.0))
		<resolved_id> :se_setprops pos = {(0.0, 45.0) relative}
		wait \{1
			gameframe}
		repeat
	endif
	createscreenelement {
		type = containerelement
		parent = <objid>
		id = friendslist_submenu_container
		pos = (0.0, 0.0)
		just = [left top]
		z_priority = <z_priority>
	}
	container_id = <id>
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = list_container
		pos = (-35.0, 50.0)
		dims = (400.0, 215.0)
		just = [left top]
		alpha = 1.0
		z_priority = (<z_priority> + 0.2)
	}
	createscreenelement {
		type = vmenu
		parent = <container_id>
		just = [left top]
		internal_just = [left center]
		dims = (300.0, 200.0)
		pos = (15.0, 50.0)
		z_priority = (<z_priority> + 0.4)
		spacing_between = 5
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	subvmenu_id = <id>
	setscreenelementprops {
		id = <subvmenu_id>
		event_handlers = [
			{pad_back generic_menu_pad_back_sound}
			{pad_back destroy_friendslist_submenu}
		]
	}
	dont_show_invite_options = 0
	if gotparam \{cant_invite}
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
				name = <name>
				instrument = mic
			}
		}
	endif
	assignalias id = <subvmenu_id> alias = current_menu
	launchevent \{type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
endscript

script destroy_friendslist_submenu 
	if screenelementexists \{id = friendslist_submenu_container}
		destroyscreenelement \{id = friendslist_submenu_container}
	endif
	friendslistinterface :gettags
	if friendslistinterface :desc_resolvealias \{name = alias_left_side_vmenu}
		menu_id = <resolved_id>
		resolvescreenelementid \{id = [
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
		resolvescreenelementid id = [
			{id = <menu_id>}
			{index = <menu_index>}
		]
		dim_y = 575
		begin
		<dim_y> = (<dim_y> - 45)
		if (<dim_y> <= 42)
			difference = (42 - <dim_y>)
			<dim_y> = 42
			<info_container> :se_setprops pos = {((0.0, -1.0) * <difference>) relative}
			<resolved_id> :se_setprops dims = (385.0, 42.0)
			break
		endif
		<resolved_id> :se_setprops dims = (((0.0, 1.0) * <dim_y>) + (385.0, 0.0))
		<info_container> :se_setprops pos = {(0.0, -45.0) relative}
		wait \{1
			gameframe}
		repeat
		if friendslistinterface :desc_resolvealias \{name = alias_left_side_vscollingmenu}
			<resolved_id> :se_setprops dims = (256.0, 215.0)
		endif
		launchevent type = focus target = <menu_id> data = {child_index = (<menu_index>)}
	endif
	if friendslistinterface :desc_resolvealias \{name = alias_left_side_vmenu}
		wait \{3
			gameframes}
		assignalias id = <resolved_id> alias = current_menu
	endif
endscript

script invite_to_game 
	requireparams \{[
			instrument
		]
		all}
	invite_title = qs(0x14988bb8)
	base_msg = qs(0x943b89d1)
	switch (<instrument>)
		case guitar
		formattext textname = invite_msg qs(0xb3a143ba) s = <base_msg> i = qs(0x00000000)
		case drum
		formattext textname = invite_msg qs(0xb3a143ba) s = <base_msg> i = qs(0x00000000)
		case mic
		formattext textname = invite_msg qs(0xb3a143ba) s = <base_msg> i = qs(0x00000000)
	endswitch
	userlist = [
		{
			name = <name>
			id = <net_id>
		}
	]
	invite_successful = 0
	if netsessionfunc func = createcustominvite params = {
			userlist = <userlist>
			game_msg = <invite_msg>
			title = <invite_title>
			game_specific = <instrument>
			device_num = <device_num>
		}
		invite_successful = 1
	endif
	if ($g_band_lobby_flag = 1)
		if screenelementexists \{id = current_band_lobby_popup}
			if isxenonorwindx
				current_band_lobby_popup :obj_spawnscriptnow create_invite_sent_dialog params = {invite_successful = <invite_successful>}
			endif
		endif
		if (<invite_successful> = 1)
			change \{g_lobby_invite_flag = 1}
		endif
		j = 0
		begin
		band_lobby_add_menu_update_to_queue submenu_index = <j> focus = 0
		j = (<j> + 1)
		repeat ($g_num_lobby_local_submenus)
	else
		if isxenonorwindx
			gamemode_gettype
			if (<type> = career)
				if screenelementexists \{id = myinterfaceelement}
					myinterfaceelement :obj_spawnscriptnow create_invite_sent_dialog params = {menu_index = <menu_index>}
				endif
			else
				my_parent = friendslistinterface
				if screenelementexists \{id = onlinelobbyinterface}
					<my_parent> = onlinelobbyinterface
				endif
				<my_parent> :obj_spawnscriptnow create_invite_sent_dialog
				destroy_friendslist_submenu
			endif
		else
			ui_destroy_friends_list
		endif
	endif
endscript

script create_invite_sent_dialog 
	requireparams \{[
			invite_successful
		]
		all}
	if ($g_band_lobby_flag = 1)
		getscreenelementzpriority \{id = band_lobby_popup_menu}
		begin
		if NOT (screenelementexists id = invite_sent_container)
			break
		endif
		wait \{1
			gameframe}
		repeat
		createscreenelement {
			type = containerelement
			id = invite_sent_container
			parent = current_band_lobby_popup
			pos = (640.0, 120.0)
			alpha = 1.0
			z_priority = (<z_priority> + 10)
			just = [center , center]
			tags = {debug_me}
		}
		createscreenelement \{parent = invite_sent_container
			id = invitesentinterface
			type = descinterface
			desc = 'container_gamer_invite'
			pos = (0.0, 0.0)
			dims = (100.0, 100.0)
			scale = 1.0
			just = [
				center
				center
			]}
		if (<invite_successful> = 0)
			<id> :se_setprops text_popup_text = ($band_lobby_strings.invite_failed)
		endif
		invite_sent_container :se_setprops \{alpha = 1.0
			time = 1.0}
		invite_sent_container :se_waitprops
		wait \{1.0
			second}
		invite_sent_container :se_setprops \{alpha = 0.0
			time = 1.0}
		invite_sent_container :se_waitprops
		if screenelementexists \{id = invite_sent_container}
			destroyscreenelement \{id = invite_sent_container}
		endif
	else
		gamemode_gettype
		if (<type> = career)
			getscreenelementzpriority \{id = myinterfaceelement}
		else
			getscreenelementzpriority \{id = friendslistinterface}
		endif
		begin
		if NOT (screenelementexists id = invite_sent_container)
			break
		endif
		wait \{1
			gameframe}
		repeat
		if (<type> = career)
			my_parent = myinterfaceelement
			switch <menu_index>
				case 0
				change \{invite_sent_display_position = (250.0, 290.0)}
				case 1
				change \{invite_sent_display_position = (510.0, 290.0)}
				case 2
				change \{invite_sent_display_position = (770.0, 290.0)}
				case 3
				change \{invite_sent_display_position = (1030.0, 290.0)}
			endswitch
			scale = 0.7
		else
			my_parent = friendslistinterface
			if screenelementexists \{id = onlinelobbyinterface}
				<my_parent> = onlinelobbyinterface
			endif
			scale = 1.0
		endif
		createscreenelement {
			type = containerelement
			id = invite_sent_container
			parent = <my_parent>
			pos = $invite_sent_display_position
			alpha = 0.0
			z_priority = (<z_priority> + 10)
			just = [center , center]
			tags = {debug_me}
		}
		createscreenelement {
			parent = invite_sent_container
			id = invitesentinterface
			type = descinterface
			desc = 'container_gamer_invite'
			pos = (0.0, 0.0)
			dims = (100.0, 100.0)
			scale = <scale>
			just = [center , center]
		}
		invite_sent_container :se_setprops \{alpha = 1.0
			time = 1.0}
		invite_sent_container :se_waitprops
		wait \{1.0
			second}
		invite_sent_container :se_setprops \{alpha = 0.0
			time = 1.0}
		invite_sent_container :se_waitprops
		if screenelementexists \{id = invite_sent_container}
			destroyscreenelement \{id = invite_sent_container}
		endif
		change \{invite_sent_display_position = (640.0, 360.0)}
	endif
endscript
