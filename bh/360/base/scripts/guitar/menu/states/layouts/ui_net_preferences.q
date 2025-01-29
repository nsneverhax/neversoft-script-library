
script ui_create_net_preferences 
	RequireParams \{[
			exit_Script
		]
		all}
	info_index = 1
	index = 1
	begin
	GetPlayerInfo <index> controller
	if (<device_num> = <controller>)
		<info_index> = <index>
		break
	endif
	index = (<index> + 1)
	repeat 8
	<my_parent> = root_window
	if ScreenElementExists \{id = OnlineLobbyInterface}
		<my_parent> = OnlineLobbyInterface
	endif
	CreateScreenElement {
		type = DescInterface
		parent = <my_parent>
		desc = 'online_lobby_left_side'
		Pos = (0.0, -1000.0)
		id = NetPrefInterface
		exclusive_device = <device_num>
		tags = {
			menu_index = 0
			menu_items = 0
			submenu_id = null
			player_num = <info_index>
			exit_Script = <exit_Script>
		}
	}
	NetPrefInterface :Desc_CheckVersion \{desired = 2
		AssertIf = Mismatch}
	<id> :SE_SetProps title_text = qs(0xed494bd1)
	if NetPrefInterface :Desc_ResolveAlias \{name = alias_online_lobby_scrollbar
			param = scrollbar_id}
		<scrollbar_id> :Die
	endif
	create_net_preferences_menu controller = <device_num> <...>
	<id> :Obj_SpawnScriptNow animate_left_side params = {id = NetPrefInterface direction = in}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
	menu_finish
endscript

script ui_destroy_net_preferences 
	if ScreenElementExists \{id = NetPrefInterface}
		NetPrefInterface :GetTags
		generic_menu_pad_back_sound
		animate_left_side \{id = NetPrefInterface
			direction = out}
		DestroyScreenElement \{id = NetPrefInterface}
		if GotParam \{no_focus}
			spawnscriptnow <exit_Script> params = {no_focus}
		else
			spawnscriptnow <exit_Script>
		endif
	endif
endscript

script set_net_preferences_helper_text 
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
		if ScreenElementExists \{id = NetPrefInterface}
			NetPrefInterface :SE_SetProps info_text = ($<plat_helper_strings>.<appended_id>)
		endif
	elseif StructureContains structure = ($net_helper_text_strings) <appended_id>
		if ScreenElementExists \{id = NetPrefInterface}
			NetPrefInterface :SE_SetProps info_text = ($net_helper_text_strings.<appended_id>)
		endif
	endif
endscript

script create_net_preferences_menu \{container_id = NetPrefInterface}
	if NetPrefInterface :Desc_ResolveAlias \{name = alias_left_side_vmenu}
		<resolved_id> :SE_SetProps {
			event_handlers = [
				{pad_back ui_destroy_net_preferences}
				{pad_up net_preferences_up_or_down_action params = {action = up}}
				{pad_down net_preferences_up_or_down_action params = {action = down}}
			]
		}
		get_savegame_from_controller controller = <controller>
		if NOT GotParam \{post_game_lobby}
			Characters = []
			CharacterProfileGetList savegame = <savegame>
			GetArraySize <profile_list>
			added_characters = 0
			i = 0
			<height> = 0
			begin
			CharacterProfileGetStruct savegame = <savegame> name = (<profile_list> [<i>])
			NetPrefInterface :GetTags
			GetPlayerInfo <player_num> part
			if display_character_logic savegame = <savegame> profile_struct = <profile_struct> part = <part>
				character_id = (<profile_struct>.name)
				get_fullname_of_character savegame = <savegame> id = (<profile_struct>.name) profanity_allowed
				<new_character> = {
					text = <fullname>
					checksum = <character_id>
				}
				AddArrayElement array = <Characters> element = <new_character>
				<Characters> = <array>
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
					choose_script_params = {savegame = <savegame>}
					items = <Characters>
					scroll_bar
				}
			}
		endif
		NetOptions :Pref_Get \{name = game_modes}
		NetPrefInterface :GetTags
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
		AssignAlias id = <resolved_id> alias = net_preferences_popup
		LaunchEvent \{type = focus
			target = net_preferences_popup}
	endif
endscript

script create_net_preferences_submenu \{selected_index = 0
		submenu_height = 250}
	if NOT GotParam \{submenu_type}
		return
	endif
	if NOT GotParam \{name}
		return
	endif
	LaunchEvent \{type = unfocus
		target = net_preferences_popup}
	Obj_GetID
	<objID> :SE_GetProps
	<z_priority> = (<z_priority> + 1)
	if NetPrefInterface :Desc_ResolveAlias \{name = alias_left_side_vscollingmenu}
		<resolved_id> :SE_SetProps dims = (256.0, 1000.0) time = 0.2
		ResolveScreenElementID \{id = [
				{
					id = NetPrefInterface
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
	if (<submenu_height> > 425)
		<submenu_height> = 425
	endif
	if ScreenElementExists \{id = net_preferences_submenu_container}
		DestroyScreenElement \{id = net_preferences_submenu_container}
	endif
	CreateScreenElement {
		type = ContainerElement
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
			type = DescInterface
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
		net_pref_submenu_scrollbar :SE_SetProps \{scrollbar_bg_dims = (16.0, 415.0)
			scrollbar_arrow_down_pos = (-1.0, 400.0)
			scrollbar_arrow_up_pos = {
				(0.0, 5.0)
				relative
			}}
	endif
	CreateScreenElement {
		type = SpriteElement
		parent = <container_id>
		texture = list_container
		Pos = (-35.0, 42.0)
		dims = ((0.0, 1.0) * <submenu_height> + (400.0, 16.0))
		just = [left top]
		alpha = 1.0
		z_priority = (<z_priority> + 0.2)
	}
	CreateScreenElement {
		type = vscrollingmenu
		parent = <container_id>
		id = net_preferences_submenu_vscollingmenu
		just = [left top]
		dims = ((300.0, 0.0) + (0.0, 1.0) * <submenu_height>)
		Pos = (15.0, 50.0)
		z_priority = (<z_priority> + 0.4)
	}
	CreateScreenElement {
		type = vmenu
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
	NetPrefInterface :SetTags submenu_id = <subvmenu_id>
	SetScreenElementProps {
		id = <subvmenu_id>
		event_handlers = [
			{pad_back generic_menu_pad_back_sound}
			{pad_back destroy_net_preferences_submenu}
		]
	}
	NetPrefInterface :GetTags
	<current_checksum> = 0
	switch (<submenu_type>)
		case character
		GetPlayerInfo <player_num> character_id
		<current_checksum> = <character_id>
		case difficulty
		<current_checksum> = ($default_difficulty [<device_num>])
		case lefty_flip
		GetPlayerInfo <player_num> lefty_flip
		<current_checksum> = off
		if (<lefty_flip> = 1)
			<current_checksum> = on
		endif
		case vocal_style
		GetPlayerInfo <player_num> vocals_highway_view
		<current_checksum> = <vocals_highway_view>
	endswitch
	<selected_index> = 0
	GetArraySize <items>
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
	net_preferences_submenu_container :GetTags
	if ScreenElementExists id = <scrollbar_id>
		scroll_increment = (385 / (<menu_items> -1))
		<scrollbar_id> :SetTags scroll_increment = <scroll_increment>
		<scrollbar_id> :SE_SetProps scrollbar_thumb_pos = ((0.0, 10.0) + ((0.0, 1.0) * (<scroll_increment> * <selected_index>)))
	endif
	net_preferences_submenu_container :SetTags menu_index = <selected_index>
	LaunchEvent type = focus target = <subvmenu_id> data = {child_index = <selected_index>}
endscript

script destroy_net_preferences_submenu 
	if ScreenElementExists \{id = net_preferences_submenu_container}
		DestroyScreenElement \{id = net_preferences_submenu_container}
	endif
	NetPrefInterface :GetTags
	NetPrefInterface :SetTags \{submenu_id = null}
	if NetPrefInterface :Desc_ResolveAlias \{name = alias_left_side_vmenu}
		menu_id = <resolved_id>
		ResolveScreenElementID \{param = info_container
			id = [
				{
					id = NetPrefInterface
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
			<info_container> :SE_SetProps Pos = {((0.0, -1.0) * <difference>) relative}
			<menu_item> :SE_SetProps dims = (385.0, 42.0)
			break
		endif
		<menu_item> :SE_SetProps dims = (((0.0, 1.0) * <dim_y>) + (385.0, 0.0))
		<info_container> :SE_SetProps Pos = {(0.0, -45.0) relative}
		wait \{1
			gameframe}
		repeat
		if ScreenElementExists \{id = NetPrefInterface}
			if NetPrefInterface :Desc_ResolveAlias \{name = alias_left_side_vscollingmenu}
				<resolved_id> :SE_SetProps dims = (256.0, 215.0)
			endif
			LaunchEvent type = focus target = <menu_id> data = {child_index = (<menu_index>)}
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
				<scrollbar_id> :SE_SetProps scrollbar_thumb_pos = (0.0, 385.0)
			endif
		else
			net_preferences_submenu_container :SetTags menu_index = (<menu_index> - 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :GetTags
				Pos = ((0.0, -1.0) * <scroll_increment>)
				<scrollbar_id> :SE_SetProps scrollbar_thumb_pos = {<Pos> relative}
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
				<scrollbar_id> :SE_SetProps scrollbar_thumb_pos = (0.0, 10.0)
			endif
		else
			net_preferences_submenu_container :SetTags menu_index = (<menu_index> + 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :GetTags
				Pos = ((0.0, 1.0) * (<scroll_increment>))
				<scrollbar_id> :SE_SetProps scrollbar_thumb_pos = {<Pos> relative}
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
	NetPrefInterface :GetTags
	if (<action> = up)
		generic_menu_up_or_down_sound \{up}
		if (<menu_index> = 0)
			NetPrefInterface :SetTags menu_index = (<menu_items> - 1)
		else
			NetPrefInterface :SetTags menu_index = (<menu_index> - 1)
		endif
	elseif (<action> = down)
		generic_menu_up_or_down_sound \{down}
		if (<menu_index> = (<menu_items> - 1))
			NetPrefInterface :SetTags \{menu_index = 0}
		else
			NetPrefInterface :SetTags menu_index = (<menu_index> + 1)
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
		type = ContainerElement
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
		NetPrefInterface :GetTags
		NetPrefInterface :SetTags menu_items = (<menu_items> + 1)
	elseif ScreenElementExists \{id = net_preferences_submenu_container}
		net_preferences_submenu_container :GetTags
		net_preferences_submenu_container :SetTags menu_items = (<menu_items> + 1)
	endif
	if NOT GotParam \{item_width}
		item_width = 285
	endif
	CreateScreenElement {
		type = TextBlockElement
		parent = <container_id>
		local_id = text
		font = fontgrid_text_A1
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
	NetPrefInterface :GetTags
	SetPlayerInfo <player_num> character_id = <checksum>
	SetPlayerInfo <player_num> character_savegame = <savegame>
	destroy_net_preferences_submenu
endscript

script select_net_preferences_difficulty 
	if NOT GotParam \{checksum}
		return
	endif
	NetPrefInterface :GetTags
	if ((<player_num> <= 4) && (<player_num> >= 1))
		SetPlayerInfo <player_num> difficulty = <checksum>
		SetArrayElement arrayName = default_difficulty GlobalArray index = <device_num> newValue = <checksum>
	endif
	destroy_net_preferences_submenu
endscript

script select_net_preferences_lefty_flip 
	if NOT GotParam \{checksum}
		return
	endif
	NetPrefInterface :GetTags
	value = 0
	switch (<checksum>)
		case on
		<value> = 1
		case off
		<value> = 0
	endswitch
	SetPlayerInfo <player_num> lefty_flip = <value>
	SetPlayerInfo <player_num> lefthanded_gems = <value>
	SetPlayerInfo <player_num> lefthanded_button_ups = <value>
	SetPlayerInfo <player_num> lefthanded_button_ups_flip_save = <value>
	SetPlayerInfo <player_num> lefthanded_gems_flip_save = <value>
	get_savegame_from_controller controller = <device_num>
	if IsXenonOrWinDX
		SetGlobalTags savegame = <savegame> user_options params = {lefty_flip_save = <value>}
	elseif (<device_num> = $primary_controller)
		SetGlobalTags savegame = <savegame> user_options params = {lefty_flip_save = <value>}
	endif
	MonitorControllerStates
	destroy_net_preferences_submenu
endscript

script select_net_preferences_vocal_style 
	if NOT GotParam \{checksum}
		return
	endif
	NetPrefInterface :GetTags
	get_savegame_from_controller controller = <device_num>
	SetPlayerInfo <player_num> vocals_highway_view = <checksum>
	if IsXenonOrWinDX
		SetGlobalTags savegame = <savegame> user_options params = {vocals_highway_view_save = <checksum>}
	elseif (<device_num> = $primary_controller)
		SetGlobalTags savegame = <savegame> user_options params = {vocals_highway_view_save = <checksum>}
	endif
	destroy_net_preferences_submenu
endscript
