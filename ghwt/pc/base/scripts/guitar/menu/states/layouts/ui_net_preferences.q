
script ui_create_net_preferences 
	requireparams \{[
			exit_script
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
	<my_parent> = root_window
	if screenelementexists \{id = onlinelobbyinterface}
		<my_parent> = onlinelobbyinterface
	endif
	createscreenelement {
		type = descinterface
		parent = <my_parent>
		desc = 'online_lobby_left_side'
		pos = (0.0, -1000.0)
		id = netprefinterface
		exclusive_device = <device_num>
		tags = {
			menu_index = 0
			menu_items = 0
			submenu_id = null
			player_num = <info_index>
			exit_script = <exit_script>
		}
	}
	netprefinterface :desc_checkversion \{desired = 2
		assertif = mismatch}
	<id> :se_setprops title_text = qs(0xed494bd1)
	if netprefinterface :desc_resolvealias \{name = alias_online_lobby_scrollbar
			param = scrollbar_id}
		<scrollbar_id> :die
	endif
	create_net_preferences_menu controller = <device_num> <...>
	<id> :obj_spawnscriptnow animate_left_side params = {id = netprefinterface direction = in}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
	menu_finish
endscript

script ui_destroy_net_preferences 
	if screenelementexists \{id = netprefinterface}
		netprefinterface :gettags
		generic_menu_pad_back_sound
		animate_left_side \{id = netprefinterface
			direction = out}
		destroyscreenelement \{id = netprefinterface}
		if gotparam \{no_focus}
			spawnscriptnow <exit_script> params = {no_focus}
		else
			spawnscriptnow <exit_script>
		endif
	endif
endscript

script set_net_preferences_helper_text 
	if NOT gotparam \{msg_checksum}
		return
	endif
	if isxenon
		plat_helper_strings = net_helper_text_strings_ps3
	elseif isps3
		plat_helper_strings = net_helper_text_strings_ps3
	endif
	appendsuffixtochecksum base = <msg_checksum> suffixstring = '_text'
	if structurecontains structure = ($<plat_helper_strings>) <appended_id>
		if screenelementexists \{id = netprefinterface}
			netprefinterface :se_setprops info_text = ($<plat_helper_strings>.<appended_id>)
		endif
	elseif structurecontains structure = ($net_helper_text_strings) <appended_id>
		if screenelementexists \{id = netprefinterface}
			netprefinterface :se_setprops info_text = ($net_helper_text_strings.<appended_id>)
		endif
	endif
endscript

script create_net_preferences_menu \{container_id = netprefinterface}
	if netprefinterface :desc_resolvealias \{name = alias_left_side_vmenu}
		<resolved_id> :se_setprops {
			event_handlers = [
				{pad_back ui_destroy_net_preferences}
				{pad_up net_preferences_up_or_down_action params = {action = up}}
				{pad_down net_preferences_up_or_down_action params = {action = down}}
			]
		}
		get_savegame_from_controller controller = <controller>
		if NOT gotparam \{post_game_lobby}
			characters = []
			get_musician_profile_size savegame = <savegame>
			added_characters = 0
			i = 0
			<height> = 0
			begin
			get_musician_profile_struct_by_index index = <i> savegame = <savegame>
			netprefinterface :gettags
			getplayerinfo <player_num> part
			if display_character_logic savegame = <savegame> profile_struct = <profile_struct> part = <part>
				character_id = (<profile_struct>.name)
				<new_character> = {
					text = (<profile_struct>.fullname)
					checksum = <character_id>
				}
				addarrayelement array = <characters> element = <new_character>
				<characters> = <array>
				<added_characters> = (<added_characters> + 1)
				<height> = (<height> + 42)
			endif
			i = (<i> + 1)
			repeat <array_size>
			add_net_preferences_item {
				vmenu_id = <resolved_id>
				text = qs(0xdd110956)
				msg_checksum = pref_character
				choose_script = create_net_preferences_submenu
				choose_script_params = {
					name = qs(0xdd110956)
					submenu_height = (<height> + 40)
					submenu_type = character
					choose_script = select_net_preferences_character
					items = <characters>
					scroll_bar
				}
			}
		endif
		netoptions :pref_get \{name = game_modes}
		netprefinterface :gettags
		if (<checksum> = p2_battle)
			add_net_preferences_item {
				vmenu_id = <resolved_id>
				text = qs(0x9f281c76)
				msg_checksum = pref_difficulty
				choose_script = create_net_preferences_submenu
				choose_script_params = {
					name = qs(0x9f281c76)
					submenu_type = difficulty
					submenu_height = ((4 * 42) + 40)
					choose_script = select_net_preferences_difficulty
					items = [
						{
							text = qs(0x8d657387)
							checksum = easy
						}
						{
							text = qs(0x6ef11a01)
							checksum = medium
						}
						{
							text = qs(0x51b06d2f)
							checksum = hard
						}
						{
							text = qs(0x334908ac)
							checksum = expert
						}
					]
				}
			}
		else
			add_net_preferences_item {
				vmenu_id = <resolved_id>
				text = qs(0x9f281c76)
				msg_checksum = pref_difficulty
				choose_script = create_net_preferences_submenu
				choose_script_params = {
					name = qs(0x9f281c76)
					submenu_type = difficulty
					submenu_height = ((5 * 42) + 40)
					choose_script = select_net_preferences_difficulty
					items = [
						{
							text = qs(0x74d6a0a0)
							checksum = easy_rhythm
						}
						{
							text = qs(0x8d657387)
							checksum = easy
						}
						{
							text = qs(0x6ef11a01)
							checksum = medium
						}
						{
							text = qs(0x51b06d2f)
							checksum = hard
						}
						{
							text = qs(0x334908ac)
							checksum = expert
						}
					]
				}
			}
		endif
		add_net_preferences_item {
			vmenu_id = <resolved_id>
			text = qs(0x2e9b1b43)
			msg_checksum = pref_lefty_flip
			choose_script = create_net_preferences_submenu
			choose_script_params = {
				name = qs(0x2e9b1b43)
				submenu_type = lefty_flip
				choose_script = select_net_preferences_lefty_flip
				submenu_height = 122
				items = [
					{
						text = qs(0x73360a03)
						checksum = on
					}
					{
						text = qs(0xa86f0987)
						checksum = off
					}
				]
			}
		}
		demo_mode_disable = <demo_mode_disable>
		add_net_preferences_item {
			vmenu_id = <resolved_id>
			text = qs(0x589b1fee)
			msg_checksum = pref_vocal_style
			choose_script = create_net_preferences_submenu
			choose_script_params = {
				name = qs(0x589b1fee)
				submenu_type = vocal_style
				submenu_height = 122
				choose_script = select_net_preferences_vocal_style
				items = [
					{
						text = qs(0x737839f5)
						checksum = scrolling
					}
					{
						text = qs(0x305014bd)
						checksum = static
					}
				]
			}
		}
		assignalias id = <resolved_id> alias = net_preferences_popup
		launchevent \{type = focus
			target = net_preferences_popup}
	endif
endscript

script create_net_preferences_submenu \{selected_index = 0
		submenu_height = 250}
	if NOT gotparam \{submenu_type}
		return
	endif
	if NOT gotparam \{name}
		return
	endif
	launchevent \{type = unfocus
		target = net_preferences_popup}
	obj_getid
	<objid> :se_getprops
	<z_priority> = (<z_priority> + 1)
	if netprefinterface :desc_resolvealias \{name = alias_left_side_vscollingmenu}
		<resolved_id> :se_setprops dims = (256.0, 1000.0) time = 0.2
		resolvescreenelementid \{id = [
				{
					id = netprefinterface
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
	if (<submenu_height> > 425)
		<submenu_height> = 425
	endif
	if screenelementexists \{id = net_preferences_submenu_container}
		destroyscreenelement \{id = net_preferences_submenu_container}
	endif
	createscreenelement {
		type = containerelement
		parent = <objid>
		id = net_preferences_submenu_container
		pos = (0.0, 0.0)
		just = [left top]
		z_priority = <z_priority>
		tags = {
			menu_items = 0
			menu_index = 0
			scrollbar_id = net_pref_submenu_scrollbar
		}
	}
	container_id = <id>
	if gotparam \{scroll_bar}
		printf \{qs(0x86641c92)}
		createscreenelement {
			type = descinterface
			parent = <container_id>
			desc = 'online_lobby_scrollbar'
			pos = (325.0, 56.0)
			id = net_pref_submenu_scrollbar
			dims = (10.0, 10.0)
			z_priority = (<z_priority> + 0.2)
			tags = {
				scroll_increment = 0
			}
		}
		net_pref_submenu_scrollbar :se_setprops \{scrollbar_bg_dims = (16.0, 415.0)
			scrollbar_arrow_down_pos = (-1.0, 400.0)
			scrollbar_arrow_up_pos = {
				(0.0, 5.0)
				relative
			}}
	endif
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = list_container
		pos = (-35.0, 42.0)
		dims = ((0.0, 1.0) * <submenu_height> + (400.0, 16.0))
		just = [left top]
		alpha = 1.0
		z_priority = (<z_priority> + 0.2)
	}
	createscreenelement {
		type = vscrollingmenu
		parent = <container_id>
		id = net_preferences_submenu_vscollingmenu
		just = [left top]
		dims = ((300.0, 0.0) + (0.0, 1.0) * <submenu_height>)
		pos = (15.0, 50.0)
		z_priority = (<z_priority> + 0.4)
	}
	createscreenelement {
		type = vmenu
		parent = <id>
		just = [left top]
		internal_just = [left center]
		dims = ((300.0, 0.0) + (0.0, 1.0) * <submenu_height>)
		pos = (15.0, 50.0)
		z_priority = (<z_priority> + 0.4)
		spacing_between = 5
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_up net_preferences_submenu_up}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_down net_preferences_submenu_down}
		]
	}
	subvmenu_id = <id>
	netprefinterface :settags submenu_id = <subvmenu_id>
	setscreenelementprops {
		id = <subvmenu_id>
		event_handlers = [
			{pad_back generic_menu_pad_back_sound}
			{pad_back destroy_net_preferences_submenu}
		]
	}
	netprefinterface :gettags
	<current_checksum> = 0
	switch (<submenu_type>)
		case character
		getplayerinfo <player_num> character_id
		<current_checksum> = <character_id>
		case difficulty
		<current_checksum> = ($default_difficulty [<device_num>])
		case lefty_flip
		getplayerinfo <player_num> lefty_flip
		<current_checksum> = off
		if (<lefty_flip> = 1)
			<current_checksum> = on
		endif
		case vocal_style
		getplayerinfo <player_num> vocals_highway_view
		<current_checksum> = <vocals_highway_view>
	endswitch
	<selected_index> = 0
	getarraysize <items>
	if (<array_size> > 0)
		index = 0
		begin
		add_net_preferences_item {
			sub_menu_item
			item_width = <submenu_width>
			vmenu_id = <subvmenu_id>
			text = (<items> [<index>].text)
			choose_script = <choose_script>
			choose_script_params = {
				checksum = (<items> [<index>].checksum)
				index = <index>
			}
		}
		if ((<items> [<index>].checksum) = <current_checksum>)
			<selected_index> = <index>
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	net_preferences_submenu_container :gettags
	if screenelementexists id = <scrollbar_id>
		scroll_increment = (385 / (<menu_items> -1))
		<scrollbar_id> :settags scroll_increment = <scroll_increment>
		<scrollbar_id> :se_setprops scrollbar_thumb_pos = ((0.0, 10.0) + ((0.0, 1.0) * (<scroll_increment> * <selected_index>)))
	endif
	net_preferences_submenu_container :settags menu_index = <selected_index>
	launchevent type = focus target = <subvmenu_id> data = {child_index = <selected_index>}
endscript

script destroy_net_preferences_submenu 
	if screenelementexists \{id = net_preferences_submenu_container}
		destroyscreenelement \{id = net_preferences_submenu_container}
	endif
	netprefinterface :gettags
	netprefinterface :settags \{submenu_id = null}
	if netprefinterface :desc_resolvealias \{name = alias_left_side_vmenu}
		menu_id = <resolved_id>
		resolvescreenelementid \{param = info_container
			id = [
				{
					id = netprefinterface
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
		resolvescreenelementid param = menu_item id = [
			{id = <menu_id>}
			{index = <menu_index>}
		]
		dim_y = 575
		begin
		if NOT screenelementexists id = <info_container>
			break
		endif
		if NOT screenelementexists id = <menu_item>
			break
		endif
		<dim_y> = (<dim_y> - 45)
		if (<dim_y> <= 42)
			difference = (42 - <dim_y>)
			<dim_y> = 42
			<info_container> :se_setprops pos = {((0.0, -1.0) * <difference>) relative}
			<menu_item> :se_setprops dims = (385.0, 42.0)
			break
		endif
		<menu_item> :se_setprops dims = (((0.0, 1.0) * <dim_y>) + (385.0, 0.0))
		<info_container> :se_setprops pos = {(0.0, -45.0) relative}
		wait \{1
			gameframe}
		repeat
		if screenelementexists \{id = netprefinterface}
			if netprefinterface :desc_resolvealias \{name = alias_left_side_vscollingmenu}
				<resolved_id> :se_setprops dims = (256.0, 215.0)
			endif
			launchevent type = focus target = <menu_id> data = {child_index = (<menu_index>)}
		endif
	endif
endscript

script net_preferences_submenu_up 
	if screenelementexists \{id = net_preferences_submenu_container}
		net_preferences_submenu_container :gettags
		printstruct <...>
		if (<menu_index> = 0)
			net_preferences_submenu_container :settags menu_index = (<menu_items> - 1)
			if screenelementexists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 385.0)
			endif
		else
			net_preferences_submenu_container :settags menu_index = (<menu_index> - 1)
			if screenelementexists id = <scrollbar_id>
				<scrollbar_id> :gettags
				pos = ((0.0, -1.0) * <scroll_increment>)
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = {<pos> relative}
			endif
		endif
	endif
endscript

script net_preferences_submenu_down 
	if screenelementexists \{id = net_preferences_submenu_container}
		net_preferences_submenu_container :gettags
		if ((<menu_index> + 1) = <menu_items>)
			net_preferences_submenu_container :settags \{menu_index = 0}
			if screenelementexists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 10.0)
			endif
		else
			net_preferences_submenu_container :settags menu_index = (<menu_index> + 1)
			if screenelementexists id = <scrollbar_id>
				<scrollbar_id> :gettags
				pos = ((0.0, 1.0) * (<scroll_increment>))
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = {<pos> relative}
			endif
		endif
	endif
endscript

script net_preferences_up_or_down_action 
	if NOT gotparam \{action}
		return
	endif
	if NOT screenelementexists \{id = net_preferences_popup}
		return
	endif
	netprefinterface :gettags
	if (<action> = up)
		generic_menu_up_or_down_sound \{up}
		if (<menu_index> = 0)
			netprefinterface :settags menu_index = (<menu_items> - 1)
		else
			netprefinterface :settags menu_index = (<menu_index> - 1)
		endif
	elseif (<action> = down)
		generic_menu_up_or_down_sound \{down}
		if (<menu_index> = (<menu_items> - 1))
			netprefinterface :settags \{menu_index = 0}
		else
			netprefinterface :settags menu_index = (<menu_index> + 1)
		endif
	endif
endscript

script net_preferences_item_change_focus 
	obj_getid
	<objid> :gettags
	set_net_preferences_helper_text msg_checksum = <msg_checksum>
	resolvescreenelementid id = [
		{id = <objid>}
		{local_id = text}
	]
	if gotparam \{focus}
		retail_menu_focus id = <resolved_id>
	elseif gotparam \{unfocus}
		retail_menu_unfocus id = <resolved_id>
	endif
endscript

script add_net_preferences_item \{vmenu_id = net_preferences_vmenu
		z_priority = 6.2}
	if NOT gotparam \{vmenu_id}
		return
	endif
	if NOT gotparam \{text}
		text = qs(0x134b7e69)
	endif
	if NOT gotparam \{msg_checksum}
		msg_checksum = none
	endif
	createscreenelement {
		type = containerelement
		parent = <vmenu_id>
		pos = (0.0, 0.0)
		dims = (385.0, 42.0)
		event_handlers = [
			{focus net_preferences_item_change_focus params = {focus}}
			{unfocus net_preferences_item_change_focus params = {unfocus}}
		]
		tags = {
			msg_checksum = <msg_checksum>
		}
	}
	container_id = <id>
	if gotparam \{choose_script}
		setscreenelementprops {
			id = <container_id>
			event_handlers = [
				{pad_choose ui_menu_select_sfx}
				{pad_choose <choose_script> params = <choose_script_params>}
			]
		}
	endif
	if NOT gotparam \{sub_menu_item}
		netprefinterface :gettags
		netprefinterface :settags menu_items = (<menu_items> + 1)
	elseif screenelementexists \{id = net_preferences_submenu_container}
		net_preferences_submenu_container :gettags
		net_preferences_submenu_container :settags menu_items = (<menu_items> + 1)
	endif
	if NOT gotparam \{item_width}
		item_width = 285
	endif
	createscreenelement {
		type = textblockelement
		parent = <container_id>
		local_id = text
		font = fontgrid_text_a6
		dims = ((0.0, 42.0) + (1.0, 0.0) * (<item_width> - 30))
		rgba = ($menu_unfocus_color)
		pos = (15.0, 0.0)
		alpha = 1.0
		text = <text>
		just = [left top]
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		internal_just = [left center]
	}
	return id = <container_id>
endscript

script select_net_preferences_character 
	if NOT gotparam \{checksum}
		return
	endif
	netprefinterface :gettags
	setplayerinfo <player_num> character_id = <checksum>
	getplayerinfo <player_num> is_local_client
	if (<is_local_client> = 1)
		getplayerinfo <player_num> controller
		if (<controller> < 4)
			get_savegame_from_controller controller = <controller>
			set_band_character_id_globaltag savegame = <savegame> controller = <controller> character_id = <checksum> player = <player_num>
		endif
	endif
	destroy_net_preferences_submenu
endscript

script select_net_preferences_difficulty 
	if NOT gotparam \{checksum}
		return
	endif
	netprefinterface :gettags
	if ((<player_num> <= 4) && (<player_num> >= 1))
		setplayerinfo <player_num> difficulty = <checksum>
		setarrayelement arrayname = default_difficulty globalarray index = <device_num> newvalue = <checksum>
	endif
	destroy_net_preferences_submenu
endscript

script select_net_preferences_lefty_flip 
	if NOT gotparam \{checksum}
		return
	endif
	netprefinterface :gettags
	value = 0
	switch (<checksum>)
		case on
		<value> = 1
		case off
		<value> = 0
	endswitch
	setplayerinfo <player_num> lefty_flip = <value>
	setplayerinfo <player_num> lefthanded_gems = <value>
	setplayerinfo <player_num> lefthanded_button_ups = <value>
	setplayerinfo <player_num> lefthanded_button_ups_flip_save = <value>
	setplayerinfo <player_num> lefthanded_gems_flip_save = <value>
	get_savegame_from_controller controller = <device_num>
	if isxenon
		setglobaltags savegame = <savegame> user_options params = {lefty_flip_save = <value>}
	elseif (<device_num> = $primary_controller)
		setglobaltags savegame = <savegame> user_options params = {lefty_flip_save = <value>}
	endif
	monitorcontrollerstates
	destroy_net_preferences_submenu
endscript

script select_net_preferences_vocal_style 
	if NOT gotparam \{checksum}
		return
	endif
	netprefinterface :gettags
	get_savegame_from_controller controller = <device_num>
	setplayerinfo <player_num> vocals_highway_view = <checksum>
	if isxenon
		setglobaltags savegame = <savegame> user_options params = {vocals_highway_view_save = <checksum>}
	elseif (<device_num> = $primary_controller)
		setglobaltags savegame = <savegame> user_options params = {vocals_highway_view_save = <checksum>}
	endif
	destroy_net_preferences_submenu
endscript
