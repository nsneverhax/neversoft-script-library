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
	obj_getid
	launchevent \{type = unfocus
		target = current_menu}
	<objid> :se_getprops
	friends_list_z = (<z_priority> + 100)
	getscreenelementposition id = <objid> absolute
	createscreenelement {
		type = descinterface
		parent = <my_parent>
		desc = 'online_lobby_submenu'
		pos = $bx_matchmaking_submenu_pos
		id = friendslistinterface
		exclusive_device = <device_num>
		z_priority = <friends_list_z>
		tags = {
			menu_index = 0
			menu_items = 0
			device_num = <device_num>
			exit_script = <exit_script>
			scrollbar_id = null
		}
	}
	friendslistinterface :se_setprops \{title_text = qs(0xf41fb4ee)}
	adjust_highlight_z z_pri = (<friends_list_z> + 1)
	if friendslistinterface :desc_resolvealias \{name = alias_online_lobby_scrollbar
			param = scrollbar_id}
		friendslistinterface :settags scrollbar_id = <scrollbar_id>
	endif
	create_submenu_fade submenu_z = (<friends_list_z> - 110) fade_id = friends_list_z parent = friendslistinterface
	create_friendslist_menu device_num = <device_num>
	clean_up_user_control_helpers
	menu_finish
endscript

script animate_submenu_transition 
	requireparams \{[
			id
			direction
		]
		all}
	if screenelementexists id = <id>
		if (<direction> = out)
		elseif (<direction> = in)
			requireparams \{[
					focus_index
				]
				all}
			if <id> :desc_resolvealias name = alias_popup_vmenu
				launchevent type = focus target = <resolved_id> data = {child_index = (<focus_index>)}
			endif
		endif
	endif
endscript

script ui_destroy_friends_list 
	destroy_submenu_fade \{fade_id = friends_list_z}
	if screenelementexists \{id = friendslistinterface}
		highlightstars :se_setprops \{alpha = 0}
		generic_menu_pad_back_sound
		netsessionfunc \{func = friends_uninit}
		animate_submenu_transition \{id = friendslistinterface
			direction = out}
		friendslistinterface :gettags
		destroyscreenelement \{id = friendslistinterface}
		if gotparam \{no_focus}
			spawnscriptnow <exit_script> params = {no_focus}
		else
			spawnscriptnow <exit_script>
		endif
	endif
	adjust_highlight_z \{z_pri = 2}
endscript

script set_friends_helper_text 
	if NOT gotparam \{msg_checksum}
		return
	endif
	if isxenon
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
	if friendslistinterface :desc_resolvealias \{name = alias_popup_vmenu}
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
			if friendslistinterface :desc_resolvealias \{name = alias_online_lobby_scrollbar
					param = scrollbar_id}
				<scrollbar_id> :die
			endif
			friendslistinterface :settags \{scrollbar_id = null}
			friendslistinterface :obj_spawnscriptnow \{animate_submenu_transition
				params = {
					id = friendslistinterface
					direction = in
					focus_index = 0
				}}
		else
			netsessionfunc \{func = friends_init}
			netsessionfunc obj = friends func = begin_retrieve_friends_list params = {callback = friendslist_callback device_num = <device_num> callback_params = {none}}
		endif
		assignalias id = <resolved_id> alias = friends_list_popup
	endif
endscript

script friendslist_up_or_down_action 
	if NOT gotparam \{action}
		return
	endif
	if NOT screenelementexists \{id = friends_list_popup}
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
			if friendslistinterface :desc_resolvealias \{name = alias_popup_vmenu}
				getarraysize <friendlist>
				if (<array_size> > 0)
					i = 0
					begin
					if isxenon
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
							isfriend
						}
					else
						add_friendslist_item {
							vmenu_id = <resolved_id>
							text = (<friendlist> [<i>].name)
							choose_script = create_friendslist_submenu
							choose_script_params = {
								net_id = (<friendlist> [<i>].id)
								name = (<friendlist> [<i>].name)
							}
							isfriend
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
							isfriend
						}
						repeat 92
					endif
					friendslistinterface :obj_spawnscriptnow \{animate_submenu_transition
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
					friendslistinterface :obj_spawnscriptnow \{animate_submenu_transition
						params = {
							id = friendslistinterface
							direction = in
							focus_index = 0
						}}
				endif
				friendslistinterface :gettags
				if (<menu_items> > 5)
					scroll_increment = (175 / (<menu_items> -1))
					<scrollbar_id> :settags scroll_increment = <scroll_increment>
					<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 0.0)
				else
					destroyscreenelement id = <scrollbar_id>
					friendslistinterface :se_setprops \{h_padding_scale = 0}
				endif
			endif
		endif
	endif
endscript

script friendslist_item_change_focus 
	gettags
	if gotparam \{focus}
		wait \{1
			gameframe}
		<text_id> :se_setprops rgba = (($g_menu_colors).menu_title)
		bx_focushighlightstarson objid = <text_id>
	else
		<text_id> :se_setprops rgba = (($g_menu_colors).menu_gold)
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
	if gotparam \{isfriend}
		dims = (410.0, 48.0)
	else
		dims = (410.0, 55.0)
	endif
	createscreenelement {
		type = containerelement
		parent = <vmenu_id>
		pos = (0.0, 0.0)
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
		font = fontgrid_bordello
		rgba = (($g_menu_colors).menu_gold)
		shadow
		shadow_rgba = $ui_text_shadow_color
		shadow_offs = (3.0, 3.0)
		pos = (18.0, 0.0)
		dims = <dims>
		alpha = 1.0
		text = <text>
		just = [left top]
		z_priority = (<z_priority> + 0.5)
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		internal_just = [left center]
	}
	bx_resizetextfield {
		id = <id>
		dims = <dims>
		fit_width = `scale each line if larger`
	}
	<id> :se_getprops
	<container_id> :se_setprops dims = <dims>
	<container_id> :settags text_id = <id>
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
		icon_pos = (((<pos> + <dims>) / 2) + (-230.0, 0.0))
		createscreenelement {
			type = spriteelement
			parent = <container_id>
			texture = <status_texture>
			pos = <icon_pos>
			dims = (32.0, 32.0)
			just = [center center]
			z_priority = (<z_priority> + 1)
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
		target = friends_list_popup}
	obj_getid
	<objid> :se_getprops
	<z_priority> = (<z_priority> + 5)
	adjust_highlight_z z_pri = (<z_priority> + 6)
	getscreenelementposition id = <objid> absolute
	if ((<screenelementpos>.(0.0, 1.0)) > 320)
		x = (<screenelementpos>.(1.0, 0.0))
		<screenelementpos> = (((1.0, 0.0) * <x>) + ((0.0, 1.0) * 320))
	endif
	friendslistinterface :se_setprops \{alpha = 0.01}
	createscreenelement {
		type = descinterface
		parent = friendslistinterface
		desc = 'online_lobby_submenu'
		id = friendssubmenuinterface
		pos = $bx_matchmaking_submenu_pos
		z_priority = <z_priority>
		tags = {
			menu_items = 0
			menu_index = 0
			scrollbar_id = net_pref_submenu_scrollbar
		}
		alpha = 100.0
	}
	friendssubmenuinterface :se_setprops title_text = <name>
	create_submenu_fade submenu_z = (<z_priority> - 10) fade_id = friends_list_submenu_z parent = friendssubmenuinterface
	if screenelementexists \{id = invite_sent_container}
		invite_sent_container :se_setprops \{alpha = 0.0}
		destroyscreenelement \{id = invite_sent_container}
	endif
	if friendssubmenuinterface :desc_resolvealias \{name = alias_popup_vmenu
			param = subvmenu_id}
		setscreenelementprops {
			id = <subvmenu_id>
			event_handlers = [
				{pad_back generic_menu_pad_back_sound}
				{pad_back destroy_friendslist_submenu}
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		}
		if friendssubmenuinterface :desc_resolvealias \{name = alias_online_lobby_scrollbar
				param = scrollbar_id}
			<scrollbar_id> :die
		endif
		if isxenon
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
		friendssubmenuinterface :obj_spawnscriptnow \{animate_submenu_transition
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
	if screenelementexists \{id = friendssubmenuinterface}
		destroyscreenelement \{id = friendssubmenuinterface}
	endif
	friendslistinterface :gettags
	highlightstars :se_setprops \{alpha = 0}
	friendslistinterface :se_setprops \{alpha = 1.0}
	if friendslistinterface :desc_resolvealias \{name = alias_popup_vmenu}
		menu_id = <resolved_id>
		resolvescreenelementid id = [
			{id = <menu_id>}
			{index = <menu_index>}
		]
		friendslistinterface :se_getprops \{z_priority}
		adjust_highlight_z z_pri = (<z_priority> + 1)
		launchevent type = focus target = <menu_id> data = {child_index = (<menu_index>)}
	endif
endscript

script invite_to_game 
	requireparams \{[
			instrument
		]
		all}
	if isxenon
		bx_join_text = qs(0xe02544a2)
		bx_invite_text = qs(0xc2b47af8)
	else
		formattext \{textname = bx_join_text
			qs(0x192157bd)
			a = $bx_game_title
			addtostringlookup}
		formattext \{textname = bx_invite_text
			qs(0x68644f2b)
			a = $bx_short_game_title
			addtostringlookup}
	endif
	base_msg = <bx_join_text>
	invite_title = <bx_invite_text>
	switch (<instrument>)
		case guitar
		formattext textname = invite_msg qs(0xb3a143ba) s = <base_msg> i = qs(0xbaa820f9)
		case drum
		formattext textname = invite_msg qs(0xb3a143ba) s = <base_msg> i = qs(0x67a46594)
		case mic
		formattext textname = invite_msg qs(0xb3a143ba) s = <base_msg> i = qs(0x252af8f9)
	endswitch
	userlist = [
		{
			name = <name>
			id = <net_id>
		}
	]
	netsessionfunc func = createcustominvite params = {
		userlist = <userlist>
		game_msg = <invite_msg>
		title = <invite_title>
		game_specific = <instrument>
		device_num = <device_num>
	}
	if isxenon
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
endscript

script create_invite_sent_dialog 
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
	spawnscriptnow \{check_to_hide_element
		params = {
			elementtohide = invite_sent_container
		}}
	if screenelementexists \{id = friendslistinterface}
		invite_sent_container :se_setprops \{alpha = 1.0
			time = 0.5}
		invite_sent_container :se_waitprops
	endif
	wait \{0.5
		second}
	if screenelementexists \{id = invite_sent_container}
		invite_sent_container :se_setprops \{alpha = 0.0
			time = 1.0}
		invite_sent_container :se_waitprops
		destroyscreenelement \{id = invite_sent_container}
	endif
	change \{invite_sent_display_position = (640.0, 360.0)}
endscript

script check_to_hide_element 
	begin
	if NOT (screenelementexists id = <elementtohide>)
		break
	else
		if NOT (screenelementexists id = friendslistinterface)
			<elementtohide> :se_setprops alpha = 0.0
			destroyscreenelement id = <elementtohide>
			break
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript
