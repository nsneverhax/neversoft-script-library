
script ui_create_net_preferences 
	RequireParams \{[
			exit_Script
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
	if ScreenElementExists \{id = onlinelobbyinterface}
		<my_parent> = onlinelobbyinterface
	endif
	CreateScreenElement {
		Type = descinterface
		parent = <my_parent>
		desc = 'online_lobby_left_side'
		Pos = (0.0, -1000.0)
		id = netprefinterface
		exclusive_device = <device_num>
		tags = {
			menu_index = 0
			menu_items = 0
			submenu_id = NULL
			player_num = <info_index>
			exit_Script = <exit_Script>
		}
	}
	netprefinterface :desc_checkversion \{desired = 2
		assertif = mismatch}
	<id> :se_setprops title_text = qs(0xed494bd1)
	if netprefinterface :desc_resolvealias \{Name = alias_online_lobby_scrollbar
			param = scrollbar_id}
		<scrollbar_id> :Die
	endif
	create_net_preferences_menu controller = <device_num> <...>
	<id> :Obj_SpawnScriptNow animate_left_side params = {id = netprefinterface direction = in}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
	menu_finish
endscript

script ui_destroy_net_preferences 
	if ScreenElementExists \{id = netprefinterface}
		netprefinterface :GetTags
		generic_menu_pad_back_sound
		animate_left_side \{id = netprefinterface
			direction = out}
		DestroyScreenElement \{id = netprefinterface}
		if GotParam \{no_focus}
			SpawnScriptNow <exit_Script> params = {no_focus}
		else
			SpawnScriptNow <exit_Script>
		endif
	endif
endscript

script set_net_preferences_helper_text 
	if NOT GotParam \{msg_checksum}
		return
	endif
	if isxenonorwindx
		plat_helper_strings = net_helper_text_strings_xen
	elseif isps3
		plat_helper_strings = net_helper_text_strings_ps3
	endif
	AppendSuffixToChecksum Base = <msg_checksum> SuffixString = '_text'
	if StructureContains structure = ($<plat_helper_strings>) <appended_id>
		if ScreenElementExists \{id = netprefinterface}
			netprefinterface :se_setprops info_text = ($<plat_helper_strings>.<appended_id>)
		endif
	elseif StructureContains structure = ($net_helper_text_strings) <appended_id>
		if ScreenElementExists \{id = netprefinterface}
			netprefinterface :se_setprops info_text = ($net_helper_text_strings.<appended_id>)
		endif
	endif
endscript

script create_net_preferences_menu \{container_id = netprefinterface}
	if netprefinterface :desc_resolvealias \{Name = alias_left_side_vmenu}
		<resolved_id> :se_setprops {
			event_handlers = [
				{pad_back ui_destroy_net_preferences}
				{pad_up net_preferences_up_or_down_action params = {action = up}}
				{pad_down net_preferences_up_or_down_action params = {action = down}}
			]
		}
		get_savegame_from_controller controller = <controller>
		if NOT GotParam \{post_game_lobby}
			characters = []
			characterprofilegetlist savegame = <savegame>
			GetArraySize <profile_list>
			added_characters = 0
			i = 0
			<height> = 0
			begin
			characterprofilegetstruct savegame = <savegame> Name = (<profile_list> [<i>])
			netprefinterface :GetTags
			getplayerinfo <player_num> part
			if display_character_logic savegame = <savegame> profile_struct = <profile_struct> part = <part>
				character_id = (<profile_struct>.Name)
				get_fullname_of_character savegame = <savegame> id = (<profile_struct>.Name) profanity_allowed
				<new_character> = {
					text = <fullname>
					checksum = <character_id>
				}
				AddArrayElement array = <characters> element = <new_character>
				<characters> = <array>
				<added_characters> = (<added_characters> + 1)
				<height> = (<height> + 42)
			endif
			i = (<i> + 1)
			repeat <array_Size>
			add_net_preferences_item {
				vmenu_id = <resolved_id>
				text = qs(0xdd110956)
				msg_checksum = pref_character
				choose_script = create_net_preferences_submenu
				choose_script_params = {
					Name = qs(0xdd110956)
					submenu_height = (<height> + 40)
					submenu_type = character
					choose_script = select_net_preferences_character
					choose_script_params = {savegame = <savegame>}
					items = <characters>
					scroll_bar
				}
			}
		endif
		netoptions :pref_get \{Name = game_modes}
		netprefinterface :GetTags
		add_net_preferences_item {
			vmenu_id = <resolved_id>
			text = qs(0x9f281c76)
			msg_checksum = pref_difficulty
			choose_script = create_net_preferences_submenu
			choose_script_params = {
				Name = qs(0x9f281c76)
				submenu_type = difficulty
				submenu_height = ((5 * 42) + 40)
				choose_script = select_net_preferences_difficulty
				items = [
					{
						text = qs(0x74d6a0a0)
						checksum = beginner
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
		add_net_preferences_item {
			vmenu_id = <resolved_id>
			text = qs(0x2e9b1b43)
			msg_checksum = pref_lefty_flip
			choose_script = create_net_preferences_submenu
			choose_script_params = {
				Name = qs(0x2e9b1b43)
				submenu_type = lefty_flip
				choose_script = select_net_preferences_lefty_flip
				submenu_height = 122
				items = [
					{
						text = qs(0x73360a03)
						checksum = On
					}
					{
						text = qs(0xa86f0987)
						checksum = OFF
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
				Name = qs(0x589b1fee)
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
		AssignAlias id = <resolved_id> alias = net_preferences_popup
		LaunchEvent \{Type = focus
			target = net_preferences_popup}
	endif
endscript

script create_net_preferences_submenu \{selected_index = 0
		submenu_height = 250}
	if NOT GotParam \{submenu_type}
		return
	endif
	if NOT GotParam \{Name}
		return
	endif
	LaunchEvent \{Type = unfocus
		target = net_preferences_popup}
	Obj_GetID
	<objID> :se_getprops
	<z_priority> = (<z_priority> + 1)
	if netprefinterface :desc_resolvealias \{Name = alias_left_side_vscollingmenu}
		<resolved_id> :se_setprops dims = (256.0, 1000.0) time = 0.2
		ResolveScreenElementID \{id = [
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
	if (<submenu_height> > 425)
		<submenu_height> = 425
	endif
	if ScreenElementExists \{id = net_preferences_submenu_container}
		DestroyScreenElement \{id = net_preferences_submenu_container}
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <objID>
		id = net_preferences_submenu_container
		Pos = (0.0, 0.0)
		just = [left top]
		z_priority = <z_priority>
		tags = {
			menu_items = 0
			menu_index = 0
			scrollbar_id = net_pref_submenu_scrollbar
		}
	}
	container_id = <id>
	if GotParam \{scroll_bar}
		printf \{qs(0x86641c92)}
		CreateScreenElement {
			Type = descinterface
			parent = <container_id>
			desc = 'online_lobby_scrollbar'
			Pos = (325.0, 56.0)
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
	CreateScreenElement {
		Type = SpriteElement
		parent = <container_id>
		texture = list_container
		Pos = (-35.0, 42.0)
		dims = ((0.0, 1.0) * <submenu_height> + (400.0, 16.0))
		just = [left top]
		alpha = 1.0
		z_priority = (<z_priority> + 0.2)
	}
	CreateScreenElement {
		Type = VScrollingMenu
		parent = <container_id>
		id = net_preferences_submenu_vscollingmenu
		just = [left top]
		dims = ((300.0, 0.0) + (0.0, 1.0) * <submenu_height>)
		Pos = (15.0, 50.0)
		z_priority = (<z_priority> + 0.4)
	}
	CreateScreenElement {
		Type = VMenu
		parent = <id>
		just = [left top]
		internal_just = [left center]
		dims = ((300.0, 0.0) + (0.0, 1.0) * <submenu_height>)
		Pos = (15.0, 50.0)
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
	netprefinterface :SetTags submenu_id = <subvmenu_id>
	SetScreenElementProps {
		id = <subvmenu_id>
		event_handlers = [
			{pad_back generic_menu_pad_back_sound}
			{pad_back destroy_net_preferences_submenu}
		]
	}
	netprefinterface :GetTags
	<current_checksum> = 0
	switch (<submenu_type>)
		case character
		getplayerinfo <player_num> character_id
		<current_checksum> = <character_id>
		case difficulty
		<current_checksum> = ($default_difficulty [<device_num>])
		case lefty_flip
		getplayerinfo <player_num> lefty_flip
		<current_checksum> = OFF
		if (<lefty_flip> = 1)
			<current_checksum> = On
		endif
		case vocal_style
		getplayerinfo <player_num> vocals_highway_view
		<current_checksum> = <vocals_highway_view>
	endswitch
	<selected_index> = 0
	GetArraySize <items>
	if (<array_Size> > 0)
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
		repeat <array_Size>
	endif
	net_preferences_submenu_container :GetTags
	if ScreenElementExists id = <scrollbar_id>
		scroll_increment = (385 / (<menu_items> -1))
		<scrollbar_id> :SetTags scroll_increment = <scroll_increment>
		<scrollbar_id> :se_setprops scrollbar_thumb_pos = ((0.0, 10.0) + ((0.0, 1.0) * (<scroll_increment> * <selected_index>)))
	endif
	net_preferences_submenu_container :SetTags menu_index = <selected_index>
	LaunchEvent Type = focus target = <subvmenu_id> data = {child_index = <selected_index>}
endscript

script destroy_net_preferences_submenu 
	if ScreenElementExists \{id = net_preferences_submenu_container}
		DestroyScreenElement \{id = net_preferences_submenu_container}
	endif
	netprefinterface :GetTags
	netprefinterface :SetTags \{submenu_id = NULL}
	if netprefinterface :desc_resolvealias \{Name = alias_left_side_vmenu}
		menu_id = <resolved_id>
		ResolveScreenElementID \{param = info_container
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
		ResolveScreenElementID param = menu_item id = [
			{id = <menu_id>}
			{index = <menu_index>}
		]
		dim_y = 575
		begin
		if NOT ScreenElementExists id = <info_container>
			break
		endif
		if NOT ScreenElementExists id = <menu_item>
			break
		endif
		<dim_y> = (<dim_y> - 45)
		if (<dim_y> <= 42)
			difference = (42 - <dim_y>)
			<dim_y> = 42
			<info_container> :se_setprops Pos = {((0.0, -1.0) * <difference>) relative}
			<menu_item> :se_setprops dims = (385.0, 42.0)
			break
		endif
		<menu_item> :se_setprops dims = (((0.0, 1.0) * <dim_y>) + (385.0, 0.0))
		<info_container> :se_setprops Pos = {(0.0, -45.0) relative}
		Wait \{1
			gameframe}
		repeat
		if ScreenElementExists \{id = netprefinterface}
			if netprefinterface :desc_resolvealias \{Name = alias_left_side_vscollingmenu}
				<resolved_id> :se_setprops dims = (256.0, 215.0)
			endif
			LaunchEvent Type = focus target = <menu_id> data = {child_index = (<menu_index>)}
		endif
	endif
endscript

script net_preferences_submenu_up 
	if ScreenElementExists \{id = net_preferences_submenu_container}
		net_preferences_submenu_container :GetTags
		printstruct <...>
		if (<menu_index> = 0)
			net_preferences_submenu_container :SetTags menu_index = (<menu_items> - 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 385.0)
			endif
		else
			net_preferences_submenu_container :SetTags menu_index = (<menu_index> - 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :GetTags
				Pos = ((0.0, -1.0) * <scroll_increment>)
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = {<Pos> relative}
			endif
		endif
	endif
endscript

script net_preferences_submenu_down 
	if ScreenElementExists \{id = net_preferences_submenu_container}
		net_preferences_submenu_container :GetTags
		if ((<menu_index> + 1) = <menu_items>)
			net_preferences_submenu_container :SetTags \{menu_index = 0}
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 10.0)
			endif
		else
			net_preferences_submenu_container :SetTags menu_index = (<menu_index> + 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :GetTags
				Pos = ((0.0, 1.0) * (<scroll_increment>))
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = {<Pos> relative}
			endif
		endif
	endif
endscript

script net_preferences_up_or_down_action 
	if NOT GotParam \{action}
		return
	endif
	if NOT ScreenElementExists \{id = net_preferences_popup}
		return
	endif
	netprefinterface :GetTags
	if (<action> = up)
		generic_menu_up_or_down_sound \{up}
		if (<menu_index> = 0)
			netprefinterface :SetTags menu_index = (<menu_items> - 1)
		else
			netprefinterface :SetTags menu_index = (<menu_index> - 1)
		endif
	elseif (<action> = down)
		generic_menu_up_or_down_sound \{down}
		if (<menu_index> = (<menu_items> - 1))
			netprefinterface :SetTags \{menu_index = 0}
		else
			netprefinterface :SetTags menu_index = (<menu_index> + 1)
		endif
	endif
endscript

script net_preferences_item_change_focus 
	Obj_GetID
	<objID> :GetTags
	set_net_preferences_helper_text msg_checksum = <msg_checksum>
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

script add_net_preferences_item \{vmenu_id = net_preferences_vmenu
		z_priority = 6.2}
	if NOT GotParam \{vmenu_id}
		return
	endif
	if NOT GotParam \{text}
		text = qs(0x134b7e69)
	endif
	if NOT GotParam \{msg_checksum}
		msg_checksum = None
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <vmenu_id>
		Pos = (0.0, 0.0)
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
	if GotParam \{choose_script}
		SetScreenElementProps {
			id = <container_id>
			event_handlers = [
				{pad_choose ui_menu_select_sfx}
				{pad_choose <choose_script> params = <choose_script_params>}
			]
		}
	endif
	if NOT GotParam \{sub_menu_item}
		netprefinterface :GetTags
		netprefinterface :SetTags menu_items = (<menu_items> + 1)
	elseif ScreenElementExists \{id = net_preferences_submenu_container}
		net_preferences_submenu_container :GetTags
		net_preferences_submenu_container :SetTags menu_items = (<menu_items> + 1)
	endif
	if NOT GotParam \{item_width}
		item_width = 285
	endif
	CreateScreenElement {
		Type = TextBlockElement
		parent = <container_id>
		local_id = text
		font = fontgrid_text_a1
		dims = ((0.0, 42.0) + (1.0, 0.0) * (<item_width> - 30))
		rgba = ($menu_unfocus_color)
		Pos = (15.0, 0.0)
		alpha = 1.0
		text = <text>
		just = [left top]
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		internal_just = [left center]
	}
	return id = <container_id>
endscript

script select_net_preferences_character 
	if NOT GotParam \{checksum}
		return
	endif
	netprefinterface :GetTags
	setplayerinfo <player_num> character_id = <checksum>
	setplayerinfo <player_num> character_savegame = <savegame>
	destroy_net_preferences_submenu
endscript

script select_net_preferences_difficulty 
	if NOT GotParam \{checksum}
		return
	endif
	netprefinterface :GetTags
	if ((<player_num> <= 4) && (<player_num> >= 1))
		setplayerinfo <player_num> difficulty = <checksum>
		SetArrayElement ArrayName = default_difficulty globalarray index = <device_num> NewValue = <checksum>
	endif
	destroy_net_preferences_submenu
endscript

script select_net_preferences_lefty_flip 
	if NOT GotParam \{checksum}
		return
	endif
	netprefinterface :GetTags
	value = 0
	switch (<checksum>)
		case On
		<value> = 1
		case OFF
		<value> = 0
	endswitch
	setplayerinfo <player_num> lefty_flip = <value>
	setplayerinfo <player_num> lefthanded_gems = <value>
	setplayerinfo <player_num> lefthanded_button_ups = <value>
	setplayerinfo <player_num> lefthanded_button_ups_flip_save = <value>
	setplayerinfo <player_num> lefthanded_gems_flip_save = <value>
	get_savegame_from_controller controller = <device_num>
	if isxenonorwindx
		SetGlobalTags savegame = <savegame> user_options params = {lefty_flip_save = <value>}
	elseif (<device_num> = $primary_controller)
		SetGlobalTags savegame = <savegame> user_options params = {lefty_flip_save = <value>}
	endif
	monitorcontrollerstates
	destroy_net_preferences_submenu
endscript

script select_net_preferences_vocal_style 
	if NOT GotParam \{checksum}
		return
	endif
	netprefinterface :GetTags
	get_savegame_from_controller controller = <device_num>
	setplayerinfo <player_num> vocals_highway_view = <checksum>
	if isxenonorwindx
		SetGlobalTags savegame = <savegame> user_options params = {vocals_highway_view_save = <checksum>}
	elseif (<device_num> = $primary_controller)
		SetGlobalTags savegame = <savegame> user_options params = {vocals_highway_view_save = <checksum>}
	endif
	destroy_net_preferences_submenu
endscript
