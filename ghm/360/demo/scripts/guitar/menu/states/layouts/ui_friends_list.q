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
	friends_list_z = (<z_priority> + 1)
	getscreenelementposition id = <objid> absolute
	createscreenelement {
		type = descinterface
		parent = <my_parent>
		desc = 'online_lobby_submenu'
		pos = <screenelementpos>
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
	create_submenu_fade submenu_z = <friends_list_z> fade_id = friends_list_z
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
			<id> :se_setprops pos = {(0.0, -1000.0) relative} rot_angle = (360 * 8) time = 0.15 anim = gentle
			<id> :se_waitprops
		elseif (<direction> = in)
			requireparams \{[
					focus_index
				]
				all}
			<id> :se_getprops
			final_scale = <scale>
			final_rot = <rot_angle>
			getrandomvalue \{name = rot
				integer
				a = -60
				b = 60}
			<id> :se_setprops submenu_sub_scale = (<scale> * (2)) rot_angle = <rot>
			wait \{1
				gameframe}
			<id> :se_setprops submenu_sub_scale = <final_scale> rot_angle = <final_rot> time = 0.05 anim = gentle
			<id> :se_waitprops
			if <id> :desc_resolvealias name = alias_popup_vmenu
				launchevent type = focus target = <resolved_id> data = {child_index = (<focus_index>)}
			endif
		endif
	endif
endscript

script ui_destroy_friends_list 
	turn_off_highlight
	destroy_submenu_fade \{fade_id = friends_list_z}
	if screenelementexists \{id = friendslistinterface}
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
	if gotparam \{focus}
		if current_menu_anchor :desc_resolvealias \{name = alias_highlight}
			assignalias id = <resolved_id> alias = highlight
			wait \{2
				gameframe}
			getscreenelementdims id = (<objid>)
			scale = (((1.0, 0.0) * (((<width> - 60.0) / 256.0))) + (0.0, 1.5))
			turn_on_highlight
			getscreenelementposition id = (<objid>) summed
			highlight :se_setprops pos = {absolute (<screenelementpos> + (25.0, 0.0))} scale = <scale> rot_angle = -1.5
			highlight :se_waitprops
			getscreenelementposition id = (<objid>) summed
			highlight :se_setprops pos = {absolute (<screenelementpos> + (25.0, 10.0))} time = 0.05
			highlight :se_waitprops
			getscreenelementposition id = (<objid>) summed
			highlight :se_setprops pos = {absolute (<screenelementpos> + (25.0, 0.0))} scale = <scale> time = 0.05
			highlight :se_waitprops
		endif
	elseif gotparam \{unfocus}
		turn_off_highlight
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
		font = fontgrid_text_a8
		rgba = [0 0 0 255]
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
	createscreenelement {
		type = descinterface
		parent = <objid>
		desc = 'online_lobby_submenu'
		id = friendssubmenuinterface
		pos = {<screenelementpos> absolute}
		z_priority = <z_priority>
		tags = {
			menu_items = 0
			menu_index = 0
			scrollbar_id = net_pref_submenu_scrollbar
		}
	}
	friendssubmenuinterface :se_setprops title_text = <name>
	create_submenu_fade submenu_z = <z_priority> fade_id = friends_list_submenu_z
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
	turn_off_highlight
	destroy_submenu_fade \{fade_id = friends_list_submenu_z}
	animate_submenu_transition \{id = friendssubmenuinterface
		direction = out}
	if screenelementexists \{id = friendssubmenuinterface}
		destroyscreenelement \{id = friendssubmenuinterface}
	endif
	friendslistinterface :gettags
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
	invite_title = qs(0xb8eda7ee)
	base_msg = qs(0x4d5318e7)
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
endscript
