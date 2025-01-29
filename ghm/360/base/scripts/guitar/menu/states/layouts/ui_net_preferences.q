
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
	Obj_GetID
	LaunchEvent \{Type = unfocus
		target = current_menu}
	<objID> :se_getprops
	GetScreenElementPosition id = <objID> absolute
	CreateScreenElement {
		Type = descinterface
		parent = onlinelobbyinterface
		desc = 'online_lobby_submenu'
		Pos = <screenelementpos>
		id = netprefinterface
		exclusive_device = <device_num>
		z_priority = (<z_priority> + 1)
		tags = {
			menu_index = 0
			menu_items = 0
			player_num = <info_index>
			exit_Script = <exit_Script>
			submenu_id = NULL
		}
	}
	netprefinterface :se_setprops \{title_text = qs(0xed494bd1)}
	if netprefinterface :desc_resolvealias \{Name = alias_online_lobby_scrollbar
			param = scrollbar_id}
		<scrollbar_id> :Die
	endif
	create_net_preferences_menu controller = <device_num> <...>
	create_submenu_fade submenu_z = (<z_priority> + 1) fade_id = preferences_fade
	<id> :Obj_SpawnScriptNow animate_submenu_transition params = {id = netprefinterface direction = in focus_index = 0}
	clean_up_user_control_helpers
	adjust_highlight_z z_pri = (<z_priority> + 2)
	add_gamertag_helper exclusive_device = <device_num>
	menu_finish
endscript

script ui_destroy_net_preferences 
	turn_off_highlight
	destroy_submenu_fade \{fade_id = preferences_fade}
	if ScreenElementExists \{id = netprefinterface}
		netprefinterface :GetTags
		generic_menu_pad_back_sound
		animate_submenu_transition \{id = netprefinterface
			direction = out}
		DestroyScreenElement \{id = netprefinterface}
		if GotParam \{no_focus}
			SpawnScriptNow <exit_Script> params = {no_focus}
		else
			SpawnScriptNow <exit_Script>
		endif
	endif
	adjust_highlight_z \{z_pri = 2}
endscript

script set_net_preferences_helper_text 
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
	if netprefinterface :desc_resolvealias \{Name = alias_popup_vmenu}
		<resolved_id> :se_setprops {
			event_handlers = [
				{pad_back ui_destroy_net_preferences}
				{pad_up net_preferences_up_or_down_action params = {action = up}}
				{pad_down net_preferences_up_or_down_action params = {action = down}}
			]
		}
		get_local_rockers_data device_num = <controller>
		get_savegame_from_controller controller = <controller>
		if NOT GotParam \{post_game_lobby}
			characters = []
			get_musician_profile_size savegame = <savegame>
			added_characters = 0
			i = 0
			<height> = 0
			begin
			get_musician_profile_struct_by_index index = <i> savegame = <savegame>
			netprefinterface :GetTags
			getplayerinfo <player_num> part
			if display_character_logic savegame = <savegame> profile_struct = <profile_struct> part = <part>
				character_id = (<profile_struct>.Name)
				if is_profile_purchased id = <character_id> savegame = <savegame>
					get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
					get_car_photo_icon profile_struct = <profile_struct> savegame = <savegame> character_id = <character_id>
					<new_character> = {
						text = (<profile_struct>.fullname)
						checksum = <character_id>
						pic_texture = <icon>
					}
					AddArrayElement array = <characters> element = <new_character>
					<characters> = <array>
					<added_characters> = (<added_characters> + 1)
					<height> = (<height> + 42)
				endif
			endif
			i = (<i> + 1)
			repeat <array_Size>
			add_net_preferences_item {
				vmenu_id = <resolved_id>
				text = qs(0x5920e67a)
				msg_checksum = pref_character
				pic = <character_icon>
				choose_script = create_net_preferences_submenu
				choose_script_params = {
					Name = qs(0xdd110956)
					submenu_height = (<height> + 40)
					submenu_type = character
					choose_script = select_net_preferences_character
					items = <characters>
					scroll_bar
				}
			}
			AssignAlias id = <id> alias = rocker_pref_item
		endif
		net_prefs_get_difficulty_items controller = <controller>
		add_net_preferences_item {
			vmenu_id = <resolved_id>
			text = qs(0x84359337)
			msg_checksum = pref_difficulty
			pic = <difficulty_icon>
			choose_script = create_net_preferences_submenu
			choose_script_params = {
				Name = qs(0x9f281c76)
				submenu_type = difficulty
				submenu_height = <diff_height>
				choose_script = select_net_preferences_difficulty
				items = <items>
			}
		}
		AssignAlias id = <id> alias = difficulty_pref_item
		get_functional_options_by_controller device_num = <controller>
		add_net_preferences_item {
			vmenu_id = <resolved_id>
			text = qs(0x83adf584)
			msg_checksum = pref_lefty_flip
			checkbox_tick = <lefty_flip_flag>
			choose_script = select_net_preferences_lefty_flip
		}
		demo_mode_disable = <demo_mode_disable>
		add_net_preferences_item {
			vmenu_id = <resolved_id>
			text = qs(0x804b43ff)
			msg_checksum = pref_vocal_style
			checkbox_tick = <scrolling_vocals_flag>
			choose_script = select_net_preferences_vocal_style
		}
		add_net_preferences_item {
			vmenu_id = <resolved_id>
			text = qs(0xd22e8941)
			menu_type = star_power_clap
			checkbox_tick = <star_power_clap_flag>
			choose_script = select_net_preferences_star_power_clap
		}
		add_net_preferences_item {
			vmenu_id = <resolved_id>
			text = qs(0x629b3d19)
			msg_checksum = pref_star_power_tilt
			checkbox_tick = <star_power_tilt_flag>
			choose_script = select_net_preferences_star_power_tilt
		}
		add_net_preferences_item {
			vmenu_id = <resolved_id>
			text = qs(0xf4397d0c)
			msg_checksum = pref_touch_strip
			checkbox_tick = <touch_strip_flag>
			choose_script = select_net_preferences_touch_strip
		}
		AssignAlias id = <resolved_id> alias = net_preferences_popup
	endif
endscript

script net_prefs_get_difficulty_items 
	RequireParams \{[
			controller
		]
		all}
	netoptions :pref_get \{Name = game_modes}
	netprefinterface :GetTags
	if (<checksum> = p2_battle)
		if (isdrumcontroller controller = <controller>)
			diff_height = ((5 * 42) + 40)
			items = [
				{
					text = qs(0x8d657387)
					checksum = easy
					pic_texture = icon_difficulty_easy
				}
				{
					text = qs(0x6ef11a01)
					checksum = medium
					pic_texture = icon_difficulty_medium
				}
				{
					text = qs(0x51b06d2f)
					checksum = hard
					pic_texture = icon_difficulty_hard
				}
				{
					text = qs(0x334908ac)
					checksum = expert
					pic_texture = icon_difficulty_expert
				}
				{
					text = qs(0x7a19b5f7)
					checksum = expert_plus
					pic_texture = setlist_b_db_icon
				}
			]
		else
			diff_height = ((4 * 42) + 40)
			items = [
				{
					text = qs(0x8d657387)
					checksum = easy
					pic_texture = icon_difficulty_easy
				}
				{
					text = qs(0x6ef11a01)
					checksum = medium
					pic_texture = icon_difficulty_medium
				}
				{
					text = qs(0x51b06d2f)
					checksum = hard
					pic_texture = icon_difficulty_hard
				}
				{
					text = qs(0x334908ac)
					checksum = expert
					pic_texture = icon_difficulty_expert
				}
			]
		endif
	else
		if (isdrumcontroller controller = <controller>)
			diff_height = ((6 * 42) + 40)
			items = [
				{
					text = qs(0x74d6a0a0)
					checksum = easy_rhythm
					pic_texture = icon_difficulty_beginner
				}
				{
					text = qs(0x8d657387)
					checksum = easy
					pic_texture = icon_difficulty_easy
				}
				{
					text = qs(0x6ef11a01)
					checksum = medium
					pic_texture = icon_difficulty_medium
				}
				{
					text = qs(0x51b06d2f)
					checksum = hard
					pic_texture = icon_difficulty_hard
				}
				{
					text = qs(0x334908ac)
					checksum = expert
					pic_texture = icon_difficulty_expert
				}
				{
					text = qs(0x7a19b5f7)
					checksum = expert_plus
					pic_texture = setlist_b_db_icon
				}
			]
		else
			diff_height = ((5 * 42) + 40)
			items = [
				{
					text = qs(0x74d6a0a0)
					checksum = easy_rhythm
					pic_texture = icon_difficulty_beginner
				}
				{
					text = qs(0x8d657387)
					checksum = easy
					pic_texture = icon_difficulty_easy
				}
				{
					text = qs(0x6ef11a01)
					checksum = medium
					pic_texture = icon_difficulty_medium
				}
				{
					text = qs(0x51b06d2f)
					checksum = hard
					pic_texture = icon_difficulty_hard
				}
				{
					text = qs(0x334908ac)
					checksum = expert
					pic_texture = icon_difficulty_expert
				}
			]
		endif
	endif
	return items = <items>
endscript

script get_functional_options_by_controller 
	RequireParams \{[
			device_num
		]
		all}
	lefty_flip_flag = 0
	scrolling_vocals_flag = 0
	star_power_clap_flag = 0
	star_power_tilt_flag = 0
	touch_strip_flag = 0
	player_num = 1
	index = 1
	begin
	getplayerinfo <index> controller
	if (<device_num> = <controller>)
		<player_num> = <index>
		break
	endif
	index = (<index> + 1)
	repeat 4
	getplayerinfo <player_num> lefty_flip
	lefty_flip_flag = <lefty_flip>
	getplayerinfo <player_num> vocals_highway_view
	if (<vocals_highway_view> = scrolling)
		scrolling_vocals_flag = 1
	elseif (<vocals_highway_view> = static)
		scrolling_vocals_flag = 0
	else
		ScriptAssert qs(0x0c87805f) a = <vocals_highway_view> b = <controller> c = <Player>
	endif
	getplayerinfo <player_num> vocals_sp_clap
	star_power_clap_flag = <vocals_sp_clap>
	getplayerinfo <player_num> use_tilt_for_starpower
	star_power_tilt_flag = <use_tilt_for_starpower>
	getplayerinfo <player_num> enable_touch_strip
	touch_strip_flag = <enable_touch_strip>
	return lefty_flip_flag = <lefty_flip_flag> scrolling_vocals_flag = <scrolling_vocals_flag> star_power_clap_flag = <star_power_clap_flag> star_power_tilt_flag = <star_power_tilt_flag> touch_strip_flag = <touch_strip_flag>
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
	adjust_highlight_z z_pri = (<z_priority> + 10)
	GetScreenElementPosition \{id = netprefinterface
		absolute}
	if ScreenElementExists \{id = prefssubmenuinterface}
		DestroyScreenElement \{id = prefssubmenuinterface}
	endif
	CreateScreenElement {
		Type = descinterface
		parent = <objID>
		desc = 'online_lobby_submenu'
		id = prefssubmenuinterface
		z_priority = <z_priority>
		tags = {
			menu_items = 0
			menu_index = 0
			scrollbar_id = net_pref_submenu_scrollbar
		}
	}
	prefssubmenuinterface :se_setprops title_text = <Name>
	create_submenu_fade submenu_z = (<z_priority> + 10) fade_id = preferences_submenu_fade
	if prefssubmenuinterface :desc_resolvealias \{Name = alias_popup_vmenu
			param = submenu_vmenu}
		<submenu_vmenu> :se_setprops {
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_up net_preferences_submenu_up}
				{pad_down generic_menu_up_or_down_sound params = {down}}
				{pad_down net_preferences_submenu_down}
			]
		}
		netprefinterface :SetTags submenu_id = <submenu_vmenu>
		SetScreenElementProps {
			id = <submenu_vmenu>
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
			if (<current_checksum> = expert)
				getplayerinfo <player_num> double_kick_drum
				if (<double_kick_drum> = 1)
					<current_checksum> = expert_plus
				endif
			endif
			if prefssubmenuinterface :desc_resolvealias \{Name = alias_online_lobby_scrollbar
					param = scrollbar_id}
				<scrollbar_id> :Die
			endif
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
				pic = (<items> [<index>].pic_texture)
				item_width = <submenu_width>
				vmenu_id = <submenu_vmenu>
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
		if prefssubmenuinterface :desc_resolvealias \{Name = alias_online_lobby_scrollbar
				param = scrollbar_id}
			prefssubmenuinterface :SetTags scrollbar_id = <scrollbar_id>
		endif
		prefssubmenuinterface :GetTags
		if ScreenElementExists id = <scrollbar_id>
			scroll_increment = (185 / (<menu_items> -1))
			<scrollbar_id> :SetTags scroll_increment = <scroll_increment>
			<scrollbar_id> :se_setprops scrollbar_thumb_pos = ((0.0, -5.0) + ((0.0, 1.0) * (<scroll_increment> * <selected_index>)))
		endif
		prefssubmenuinterface :SetTags menu_index = <selected_index>
		prefssubmenuinterface :Obj_SpawnScriptNow animate_submenu_transition params = {id = prefssubmenuinterface direction = in focus_index = <selected_index>}
	endif
endscript

script destroy_net_preferences_submenu 
	turn_off_highlight
	destroy_submenu_fade \{fade_id = preferences_submenu_fade}
	animate_submenu_transition \{id = prefssubmenuinterface
		direction = out}
	if ScreenElementExists \{id = prefssubmenuinterface}
		DestroyScreenElement \{id = prefssubmenuinterface}
	endif
	netprefinterface :GetTags
	netprefinterface :SetTags \{submenu_id = NULL}
	if ScreenElementExists \{id = netprefinterface}
		if netprefinterface :desc_resolvealias \{Name = alias_popup_vmenu}
			menu_id = <resolved_id>
			ResolveScreenElementID param = menu_item id = [
				{id = <menu_id>}
				{index = <menu_index>}
			]
			netprefinterface :se_getprops \{z_priority}
			adjust_highlight_z z_pri = (<z_priority> + 2)
			LaunchEvent Type = focus target = <menu_id> data = {child_index = (<menu_index>)}
		endif
	endif
endscript

script net_preferences_submenu_up 
	if ScreenElementExists \{id = prefssubmenuinterface}
		prefssubmenuinterface :GetTags
		if (<menu_index> = 0)
			prefssubmenuinterface :SetTags menu_index = (<menu_items> - 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = ((0.0, 185.0) + (0.0, -5.0))
			endif
		else
			prefssubmenuinterface :SetTags menu_index = (<menu_index> - 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :GetTags
				Pos = ((0.0, -1.0) * <scroll_increment>)
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = {<Pos> relative}
			endif
		endif
	endif
endscript

script net_preferences_submenu_down 
	if ScreenElementExists \{id = prefssubmenuinterface}
		prefssubmenuinterface :GetTags
		if ((<menu_index> + 1) = <menu_items>)
			prefssubmenuinterface :SetTags \{menu_index = 0}
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, -5.0)
			endif
		else
			prefssubmenuinterface :SetTags menu_index = (<menu_index> + 1)
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
		if ScreenElementExists \{id = current_menu_anchor}
			online_submenu_focus id = <resolved_id>
		endif
	elseif GotParam \{unfocus}
		turn_off_highlight
	endif
endscript

script online_submenu_focus 
	Obj_GetID
	GetTags
	if current_menu_anchor :desc_resolvealias \{Name = alias_highlight}
		AssignAlias id = <resolved_id> alias = highlight
		Wait \{2
			gameframe}
		if <objID> :desc_resolvealias Name = alias_submenu_text
			GetScreenElementChildren id = <resolved_id>
			GetScreenElementDims id = (<children> [0])
			Scale = (((1.0, 0.0) * (((<width> - 30.0) / 256.0))) + (0.0, 1.5))
			GetScreenElementPosition id = (<children> [0]) summed
			highlight :se_setprops Pos = {absolute (<screenelementpos> + (15.0, 15.0))} Scale = <Scale> rot_angle = -1.5
			highlight :se_waitprops
			turn_on_highlight
			GetScreenElementPosition id = (<children> [0]) summed
			highlight :se_setprops Pos = {absolute (<screenelementpos> + (15.0, 25.0))} time = 0.05
			highlight :se_waitprops
			GetScreenElementPosition id = (<children> [0]) summed
			highlight :se_setprops Pos = {absolute (<screenelementpos> + (15.0, 15.0))} Scale = <Scale> time = 0.05
			highlight :se_waitprops
		endif
	endif
endscript

script online_submenu_unfocus 
	turn_off_highlight
endscript

script add_net_preferences_item \{vmenu_id = net_preferences_vmenu
		z_priority = 6.2}
	if NOT GotParam \{text}
		text = qs(0x134b7e69)
	endif
	if NOT GotParam \{msg_checksum}
		msg_checksum = None
	endif
	CreateScreenElement {
		Type = descinterface
		parent = <vmenu_id>
		desc = 'online_submenu_item'
		autosizedims = true
		event_handlers = [
			{focus net_preferences_item_change_focus params = {focus}}
			{unfocus net_preferences_item_change_focus params = {unfocus}}
		]
	}
	submenu_item_id = <id>
	if GotParam \{pic}
		if (<pic> = setlist_b_db_icon)
			submenu_item_pic_scale = (1.9, 1.0)
		else
			submenu_item_pic_scale = (1.0, 1.0)
		endif
		<submenu_item_id> :se_setprops submenu_item_texture = <pic>
		<submenu_item_id> :se_setprops submenu_item_tex_scale = <submenu_item_pic_scale>
		<submenu_item_id> :se_setprops submenu_item_pic_alpha = 1.0
		<submenu_item_id> :se_setprops checkbox_alpha = 0.0
		SetScreenElementProps {
			id = <submenu_item_id>
			event_handlers = [
				{pad_choose ui_menu_select_sfx}
			]
		}
	else
		if GotParam \{checkbox_tick}
			if (<checkbox_tick> = 1)
				<submenu_item_id> :se_setprops check_alpha = 1.0
				<submenu_item_id> :se_setprops cross_alpha = 0.0
			else
				<submenu_item_id> :se_setprops check_alpha = 0.0
				<submenu_item_id> :se_setprops cross_alpha = 1.0
			endif
		endif
		<submenu_item_id> :se_setprops submenu_item_pic_alpha = 0.0
		<submenu_item_id> :se_setprops checkbox_alpha = 1.0
	endif
	if GotParam \{choose_script}
		SetScreenElementProps {
			id = <submenu_item_id>
			event_handlers = [
				{pad_choose <choose_script> params = <choose_script_params>}
			]
		}
	endif
	if NOT GotParam \{sub_menu_item}
		netprefinterface :GetTags
		netprefinterface :SetTags menu_items = (<menu_items> + 1)
	elseif ScreenElementExists \{id = prefssubmenuinterface}
		prefssubmenuinterface :GetTags
		prefssubmenuinterface :SetTags menu_items = (<menu_items> + 1)
	endif
	<submenu_item_id> :se_setprops submenu_item_text = <text>
	return id = <submenu_item_id>
endscript

script select_net_preferences_character 
	if NOT GotParam \{checksum}
		return
	endif
	netprefinterface :GetTags
	setplayerinfo <player_num> character_id = <checksum>
	getplayerinfo <player_num> is_local_client
	if (<is_local_client> = 1)
		getplayerinfo <player_num> controller
		if (<controller> < 4)
			get_savegame_from_controller controller = <controller>
			set_band_character_id_globaltag savegame = <savegame> controller = <controller> character_id = <checksum> Player = <player_num>
			get_musician_profile_struct_by_id id = <checksum> savegame = <savegame>
			get_car_photo_icon profile_struct = <profile_struct> savegame = <savegame> character_id = <checksum>
			rocker_pref_item :se_setprops submenu_item_texture = <icon>
		endif
	endif
	ui_menu_select_sfx
	destroy_net_preferences_submenu
endscript

script select_net_preferences_difficulty 
	if NOT GotParam \{checksum}
		return
	endif
	netprefinterface :GetTags
	if ((<player_num> <= 4) && (<player_num> >= 1))
		if (<checksum> = expert_plus)
			setplayerinfo <player_num> difficulty = expert
			setplayerinfo <player_num> double_kick_drum = 1
			SetArrayElement ArrayName = default_difficulty globalarray index = <device_num> NewValue = expert
		else
			if (isdrumcontroller controller = <device_num>)
				setplayerinfo <player_num> double_kick_drum = 0
			endif
			setplayerinfo <player_num> difficulty = <checksum>
			SetArrayElement ArrayName = default_difficulty globalarray index = <device_num> NewValue = <checksum>
		endif
		icon = icon_difficulty_expert
		switch (<checksum>)
			case easy_rhythm
			<icon> = icon_difficulty_beginner
			case easy
			<icon> = icon_difficulty_easy
			case medium
			<icon> = icon_difficulty_medium
			case hard
			<icon> = icon_difficulty_hard
			case expert
			<icon> = icon_difficulty_expert
			case expert_plus
			<icon> = setlist_b_db_icon
		endswitch
		if (<icon> = setlist_b_db_icon)
			icon_scale = (1.9, 1.0)
		else
			icon_scale = (1.0, 1.0)
		endif
		difficulty_pref_item :se_setprops submenu_item_texture = <icon>
		difficulty_pref_item :se_setprops submenu_item_tex_scale = <icon_scale>
	endif
	ui_menu_select_sfx
	destroy_net_preferences_submenu
endscript

script select_net_preferences_lefty_flip 
	netprefinterface :GetTags \{player_num}
	getplayerinfo <player_num> lefty_flip
	if (<lefty_flip> = 1)
		value = 0
		SoundEvent \{event = Checkbox_SFX}
	else
		value = 1
		SoundEvent \{event = CheckBox_Check_SFX}
	endif
	Obj_GetID
	tick_untick_checkbox value = <value> submenu_item_id = <objID>
	setplayerinfo <player_num> lefty_flip = <value>
	setplayerinfo <player_num> lefthanded_gems = <value>
	setplayerinfo <player_num> lefthanded_button_ups = <value>
	setplayerinfo <player_num> lefthanded_button_ups_flip_save = <value>
	setplayerinfo <player_num> lefthanded_gems_flip_save = <value>
	get_savegame_from_controller controller = <device_num>
	if isXenon
		SetGlobalTags savegame = <savegame> user_options params = {lefty_flip_save = <value>}
	elseif (<device_num> = $primary_controller)
		SetGlobalTags savegame = <savegame> user_options params = {lefty_flip_save = <value>}
	endif
	monitorcontrollerstates
endscript

script select_net_preferences_vocal_style 
	netprefinterface :GetTags \{player_num}
	getplayerinfo <player_num> vocals_highway_view
	if (<vocals_highway_view> = scrolling)
		value = 0
		new_view = static
		SoundEvent \{event = Checkbox_SFX}
	else
		value = 1
		new_view = scrolling
		SoundEvent \{event = CheckBox_Check_SFX}
	endif
	Obj_GetID
	tick_untick_checkbox value = <value> submenu_item_id = <objID>
	setplayerinfo <player_num> vocals_highway_view = <new_view>
	get_savegame_from_controller controller = <device_num>
	if isXenon
		SetGlobalTags savegame = <savegame> user_options params = {vocals_highway_view_save = <new_view>}
	elseif (<device_num> = $primary_controller)
		SetGlobalTags savegame = <savegame> user_options params = {vocals_highway_view_save = <new_view>}
	endif
endscript

script select_net_preferences_star_power_clap 
	netprefinterface :GetTags \{player_num}
	getplayerinfo <player_num> vocals_sp_clap
	if (<vocals_sp_clap> = 1)
		value = 0
		SoundEvent \{event = Checkbox_SFX}
	else
		value = 1
		SoundEvent \{event = CheckBox_Check_SFX}
	endif
	Obj_GetID
	tick_untick_checkbox value = <value> submenu_item_id = <objID>
	setplayerinfo <player_num> vocals_sp_clap = <value>
	get_savegame_from_controller controller = <device_num>
	if isXenon
		SetGlobalTags savegame = <savegame> user_options params = {vocals_sp_clap_save = <value>}
	elseif (<device_num> = $primary_controller)
		SetGlobalTags savegame = <savegame> user_options params = {vocals_sp_clap_save = <value>}
	endif
endscript

script select_net_preferences_star_power_tilt 
	netprefinterface :GetTags \{player_num}
	getplayerinfo <player_num> use_tilt_for_starpower
	if (<use_tilt_for_starpower> = 1)
		value = 0
		SoundEvent \{event = Checkbox_SFX}
	else
		value = 1
		SoundEvent \{event = CheckBox_Check_SFX}
	endif
	Obj_GetID
	tick_untick_checkbox value = <value> submenu_item_id = <objID>
	setplayerinfo <player_num> use_tilt_for_starpower = <value>
	get_savegame_from_controller controller = <device_num>
	if isXenon
		SetGlobalTags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = <value>}
	elseif (<device_num> = $primary_controller)
		SetGlobalTags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = <value>}
	endif
endscript

script select_net_preferences_touch_strip 
	netprefinterface :GetTags \{player_num}
	getplayerinfo <player_num> enable_touch_strip
	if (<enable_touch_strip> = 1)
		value = 0
		SoundEvent \{event = Checkbox_SFX}
	else
		value = 1
		SoundEvent \{event = CheckBox_Check_SFX}
	endif
	Obj_GetID
	tick_untick_checkbox value = <value> submenu_item_id = <objID>
	setplayerinfo <player_num> enable_touch_strip = <value>
	get_savegame_from_controller controller = <device_num>
	if isXenon
		SetGlobalTags savegame = <savegame> user_options params = {enable_touch_strip_save = <value>}
	elseif (<device_num> = $primary_controller)
		SetGlobalTags savegame = <savegame> user_options params = {enable_touch_strip_save = <value>}
	endif
endscript

script tick_untick_checkbox 
	RequireParams \{[
			value
			submenu_item_id
		]
		all}
	if ScreenElementExists id = <submenu_item_id>
		if (<value> = 1)
			<submenu_item_id> :se_setprops check_alpha = 1.0
			<submenu_item_id> :se_setprops cross_alpha = 0.0
		else
			<submenu_item_id> :se_setprops check_alpha = 0.0
			<submenu_item_id> :se_setprops cross_alpha = 1.0
		endif
	endif
endscript
