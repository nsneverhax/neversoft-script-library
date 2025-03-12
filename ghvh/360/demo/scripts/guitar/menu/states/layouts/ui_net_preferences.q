
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
	obj_getid
	launchevent \{type = unfocus
		target = current_menu}
	<objid> :se_getprops
	prefs_z = (<z_priority> + 1)
	getscreenelementposition id = <objid> absolute
	createscreenelement {
		type = descinterface
		parent = onlinelobbyinterface
		desc = 'online_lobby_submenu'
		pos = <screenelementpos>
		id = netprefinterface
		exclusive_device = <device_num>
		z_priority = <prefs_z>
		tags = {
			menu_index = 0
			menu_items = 0
			player_num = <info_index>
			exit_script = <exit_script>
			submenu_id = null
		}
	}
	netprefinterface :se_setprops \{title_text = qs(0xed494bd1)}
	if netprefinterface :desc_resolvealias \{name = alias_online_lobby_scrollbar
			param = scrollbar_id}
		<scrollbar_id> :die
	endif
	create_submenu_fade submenu_z = <prefs_z> fade_id = prefs_z
	create_net_preferences_menu controller = <device_num> <...>
	clean_up_user_control_helpers
	adjust_highlight_z z_pri = (<z_priority> + 2)
	add_gamertag_helper exclusive_device = <device_num>
	menu_finish
endscript

script ui_destroy_net_preferences 
	turn_off_highlight
	destroy_submenu_fade \{fade_id = prefs_z}
	if screenelementexists \{id = netprefinterface}
		netprefinterface :gettags
		generic_menu_pad_back_sound
		destroyscreenelement \{id = netprefinterface}
		if gotparam \{no_focus}
			spawnscriptnow <exit_script> params = {no_focus}
		else
			spawnscriptnow <exit_script>
		endif
	endif
	adjust_highlight_z \{z_pri = 2}
endscript

script set_net_preferences_helper_text 
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
	if netprefinterface :desc_resolvealias \{name = alias_popup_vmenu}
		<resolved_id> :se_setprops {
			event_handlers = [
				{pad_back ui_destroy_net_preferences}
				{pad_up net_preferences_up_or_down_action params = {action = up}}
				{pad_down net_preferences_up_or_down_action params = {action = down}}
			]
		}
		get_local_rockers_data device_num = <controller>
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
				if is_profile_purchased id = <character_id> savegame = <savegame>
					get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
					get_car_photo_icon profile_struct = <profile_struct> savegame = <savegame> character_id = <character_id>
					<new_character> = {
						text = (<profile_struct>.fullname)
						checksum = <character_id>
						pic_texture = <icon>
					}
					addarrayelement array = <characters> element = <new_character>
					<characters> = <array>
					<added_characters> = (<added_characters> + 1)
					<height> = (<height> + 42)
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
			add_net_preferences_item {
				vmenu_id = <resolved_id>
				text = qs(0x5920e67a)
				msg_checksum = pref_character
				pic = <character_icon>
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
			assignalias id = <id> alias = rocker_pref_item
		endif
		net_prefs_get_difficulty_items controller = <controller>
		add_net_preferences_item {
			vmenu_id = <resolved_id>
			text = qs(0x84359337)
			msg_checksum = pref_difficulty
			pic = <difficulty_icon>
			choose_script = create_net_preferences_submenu
			choose_script_params = {
				name = qs(0x9f281c76)
				submenu_type = difficulty
				submenu_height = <diff_height>
				choose_script = select_net_preferences_difficulty
				items = <items>
			}
		}
		assignalias id = <id> alias = difficulty_pref_item
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
		assignalias id = <resolved_id> alias = net_preferences_popup
		launchevent \{type = focus
			target = net_preferences_popup}
	endif
endscript

script net_prefs_get_difficulty_items 
	requireparams \{[
			controller
		]
		all}
	netoptions :pref_get \{name = game_modes}
	netprefinterface :gettags
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
	requireparams \{[
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
		scriptassert qs(0x0c87805f) a = <vocals_highway_view> b = <controller> c = <player>
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
	adjust_highlight_z z_pri = (<z_priority> + 10)
	getscreenelementposition \{id = netprefinterface
		absolute}
	if screenelementexists \{id = prefssubmenuinterface}
		destroyscreenelement \{id = prefssubmenuinterface}
	endif
	createscreenelement {
		type = descinterface
		parent = <objid>
		desc = 'online_lobby_submenu'
		id = prefssubmenuinterface
		z_priority = <z_priority>
		tags = {
			menu_items = 0
			menu_index = 0
			scrollbar_id = net_pref_submenu_scrollbar
		}
	}
	prefssubmenuinterface :se_setprops title_text = <name>
	if prefssubmenuinterface :desc_resolvealias \{name = alias_popup_vmenu
			param = submenu_vmenu}
		<submenu_vmenu> :se_setprops {
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_up net_preferences_submenu_up}
				{pad_down generic_menu_up_or_down_sound params = {down}}
				{pad_down net_preferences_submenu_down}
			]
		}
		netprefinterface :settags submenu_id = <submenu_vmenu>
		setscreenelementprops {
			id = <submenu_vmenu>
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
			if prefssubmenuinterface :desc_resolvealias \{name = alias_online_lobby_scrollbar
					param = scrollbar_id}
				<scrollbar_id> :die
			endif
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
			repeat <array_size>
		endif
		if prefssubmenuinterface :desc_resolvealias \{name = alias_online_lobby_scrollbar
				param = scrollbar_id}
			prefssubmenuinterface :settags scrollbar_id = <scrollbar_id>
		endif
		prefssubmenuinterface :gettags
		if screenelementexists id = <scrollbar_id>
			scroll_increment = (185 / (<menu_items> -1))
			<scrollbar_id> :settags scroll_increment = <scroll_increment>
			<scrollbar_id> :se_setprops scrollbar_thumb_pos = ((0.0, -5.0) + ((0.0, 1.0) * (<scroll_increment> * <selected_index>)))
		endif
		prefssubmenuinterface :settags menu_index = <selected_index>
		launchevent type = focus target = <submenu_vmenu> data = {child_index = <selected_index>}
	endif
endscript

script destroy_net_preferences_submenu 
	turn_off_highlight
	if current_menu_anchor :desc_resolvealias \{name = alias_spinner}
		<resolved_id> :se_setprops alpha = 0.0
	endif
	if screenelementexists \{id = prefssubmenuinterface}
		destroyscreenelement \{id = prefssubmenuinterface}
	endif
	netprefinterface :gettags
	netprefinterface :settags \{submenu_id = null}
	if screenelementexists \{id = netprefinterface}
		if netprefinterface :desc_resolvealias \{name = alias_popup_vmenu}
			menu_id = <resolved_id>
			resolvescreenelementid param = menu_item id = [
				{id = <menu_id>}
				{index = <menu_index>}
			]
			netprefinterface :se_getprops \{z_priority}
			adjust_highlight_z z_pri = (<z_priority> + 2)
			launchevent type = focus target = <menu_id> data = {child_index = (<menu_index>)}
		endif
	endif
endscript

script net_preferences_submenu_up 
	if screenelementexists \{id = prefssubmenuinterface}
		prefssubmenuinterface :gettags
		printstruct <...>
		if (<menu_index> = 0)
			prefssubmenuinterface :settags menu_index = (<menu_items> - 1)
			if screenelementexists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = ((0.0, 185.0) + (0.0, -5.0))
			endif
		else
			prefssubmenuinterface :settags menu_index = (<menu_index> - 1)
			if screenelementexists id = <scrollbar_id>
				<scrollbar_id> :gettags
				pos = ((0.0, -1.0) * <scroll_increment>)
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = {<pos> relative}
			endif
		endif
	endif
endscript

script net_preferences_submenu_down 
	if screenelementexists \{id = prefssubmenuinterface}
		prefssubmenuinterface :gettags
		if ((<menu_index> + 1) = <menu_items>)
			prefssubmenuinterface :settags \{menu_index = 0}
			if screenelementexists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, -5.0)
			endif
		else
			prefssubmenuinterface :settags menu_index = (<menu_index> + 1)
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
	<objid> :desc_resolvealias name = alias_submenu_text
	if gotparam \{focus}
		if screenelementexists \{id = current_menu_anchor}
			online_submenu_focus id = <resolved_id>
		endif
	elseif gotparam \{unfocus}
		online_submenu_unfocus id = <resolved_id>
	endif
endscript

script online_submenu_focus 
	obj_getid
	gettags
	<id> :se_setprops rgba = ($menu_focus_color)
	if current_menu_anchor :desc_resolvealias \{name = alias_spinner}
		<resolved_id> :se_setprops alpha = 1.0
		<id> :menu_focus_set_highlight spinner_offset = 40 spinner_voffset = 10
	endif
endscript

script online_submenu_unfocus 
	turn_off_highlight
	<id> :se_setprops rgba = ($menu_unfocus_color)
	if current_menu_anchor :desc_resolvealias \{name = alias_spinner}
		<resolved_id> :se_setprops alpha = 0.0
	endif
endscript

script add_net_preferences_item \{vmenu_id = net_preferences_vmenu
		z_priority = 6.2}
	if NOT gotparam \{text}
		text = qs(0x134b7e69)
	endif
	if NOT gotparam \{msg_checksum}
		msg_checksum = none
	endif
	createscreenelement {
		type = descinterface
		parent = <vmenu_id>
		desc = 'online_submenu_item'
		autosizedims = true
		event_handlers = [
			{focus net_preferences_item_change_focus params = {focus}}
			{unfocus net_preferences_item_change_focus params = {unfocus}}
		]
	}
	submenu_item_id = <id>
	if gotparam \{pic}
		<submenu_item_id> :se_setprops submenu_item_texture = <pic>
		<submenu_item_id> :se_setprops submenu_item_pic_alpha = 1.0
		<submenu_item_id> :se_setprops checkbox_alpha = 0.0
		setscreenelementprops {
			id = <submenu_item_id>
			event_handlers = [
				{pad_choose ui_menu_select_sfx}
			]
		}
		if (<pic> = setlist_b_db_icon)
			printf \{channel = kim
				qs(0xef04d3d6)}
			if resolvescreenelementid id = [{id = <submenu_item_id>} {local_id = submenu_item} {local_id = submenu_item_pic}]
				<resolved_id> :se_setprops dims = (120.0, 60.0)
				printf \{channel = kim
					qs(0x4063c065)}
			endif
		endif
	else
		if gotparam \{checkbox_tick}
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
	if gotparam \{choose_script}
		setscreenelementprops {
			id = <submenu_item_id>
			event_handlers = [
				{pad_choose <choose_script> params = <choose_script_params>}
			]
		}
	endif
	if NOT gotparam \{sub_menu_item}
		netprefinterface :gettags
		netprefinterface :settags menu_items = (<menu_items> + 1)
	elseif screenelementexists \{id = prefssubmenuinterface}
		prefssubmenuinterface :gettags
		prefssubmenuinterface :settags menu_items = (<menu_items> + 1)
	endif
	<submenu_item_id> :se_setprops submenu_item_text = <text>
	return id = <submenu_item_id>
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
			get_musician_profile_struct_by_id id = <checksum> savegame = <savegame>
			get_car_photo_icon profile_struct = <profile_struct> savegame = <savegame> character_id = <checksum>
			rocker_pref_item :se_setprops submenu_item_texture = <icon>
		endif
	endif
	ui_menu_select_sfx
	destroy_net_preferences_submenu
endscript

script select_net_preferences_difficulty 
	if NOT gotparam \{checksum}
		return
	endif
	netprefinterface :gettags
	if ((<player_num> <= 4) && (<player_num> >= 1))
		if (<checksum> = expert_plus)
			setplayerinfo <player_num> difficulty = expert
			setplayerinfo <player_num> double_kick_drum = 1
			setarrayelement arrayname = default_difficulty globalarray index = <device_num> newvalue = expert
		else
			if (isdrumcontroller controller = <device_num>)
				setplayerinfo <player_num> double_kick_drum = 0
			endif
			setplayerinfo <player_num> difficulty = <checksum>
			setarrayelement arrayname = default_difficulty globalarray index = <device_num> newvalue = <checksum>
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
			<icon> = icon_difficulty_expert_plus
		endswitch
		difficulty_pref_item :se_setprops submenu_item_texture = <icon>
	endif
	ui_menu_select_sfx
	destroy_net_preferences_submenu
endscript

script select_net_preferences_lefty_flip 
	netprefinterface :gettags \{player_num}
	getplayerinfo <player_num> lefty_flip
	if (<lefty_flip> = 1)
		value = 0
		soundevent \{event = checkbox_sfx}
	else
		value = 1
		soundevent \{event = checkbox_check_sfx}
	endif
	obj_getid
	tick_untick_checkbox value = <value> submenu_item_id = <objid>
	setplayerinfo <player_num> lefty_flip = <value>
	setplayerinfo <player_num> lefthanded_gems = <value>
	setplayerinfo <player_num> lefthanded_button_ups = <value>
	setplayerinfo <player_num> lefthanded_button_ups_flip_save = <value>
	setplayerinfo <player_num> lefthanded_gems_flip_save = <value>
	get_savegame_from_controller controller = <device_num>
	printf channel = kim qs(0xda79f4d4) f = <value> p = <player_num>
	if isxenon
		setglobaltags savegame = <savegame> user_options params = {lefty_flip_save = <value>}
	elseif (<device_num> = $primary_controller)
		setglobaltags savegame = <savegame> user_options params = {lefty_flip_save = <value>}
	endif
	monitorcontrollerstates
endscript

script select_net_preferences_vocal_style 
	netprefinterface :gettags \{player_num}
	getplayerinfo <player_num> vocals_highway_view
	if (<vocals_highway_view> = scrolling)
		value = 0
		new_view = static
		soundevent \{event = checkbox_sfx}
	else
		value = 1
		new_view = scrolling
		soundevent \{event = checkbox_check_sfx}
	endif
	obj_getid
	tick_untick_checkbox value = <value> submenu_item_id = <objid>
	setplayerinfo <player_num> vocals_highway_view = <new_view>
	get_savegame_from_controller controller = <device_num>
	if isxenon
		setglobaltags savegame = <savegame> user_options params = {vocals_highway_view_save = <new_view>}
	elseif (<device_num> = $primary_controller)
		setglobaltags savegame = <savegame> user_options params = {vocals_highway_view_save = <new_view>}
	endif
endscript

script select_net_preferences_star_power_clap 
	netprefinterface :gettags \{player_num}
	getplayerinfo <player_num> vocals_sp_clap
	if (<vocals_sp_clap> = 1)
		value = 0
		soundevent \{event = checkbox_sfx}
	else
		value = 1
		soundevent \{event = checkbox_check_sfx}
	endif
	obj_getid
	tick_untick_checkbox value = <value> submenu_item_id = <objid>
	setplayerinfo <player_num> vocals_sp_clap = <value>
	get_savegame_from_controller controller = <device_num>
	if isxenon
		setglobaltags savegame = <savegame> user_options params = {vocals_sp_clap_save = <value>}
	elseif (<device_num> = $primary_controller)
		setglobaltags savegame = <savegame> user_options params = {vocals_sp_clap_save = <value>}
	endif
endscript

script select_net_preferences_star_power_tilt 
	netprefinterface :gettags \{player_num}
	getplayerinfo <player_num> use_tilt_for_starpower
	if (<use_tilt_for_starpower> = 1)
		value = 0
		soundevent \{event = checkbox_sfx}
	else
		value = 1
		soundevent \{event = checkbox_check_sfx}
	endif
	obj_getid
	tick_untick_checkbox value = <value> submenu_item_id = <objid>
	setplayerinfo <player_num> use_tilt_for_starpower = <value>
	get_savegame_from_controller controller = <device_num>
	if isxenon
		setglobaltags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = <value>}
	elseif (<device_num> = $primary_controller)
		setglobaltags savegame = <savegame> user_options params = {use_tilt_for_starpower_save = <value>}
	endif
endscript

script select_net_preferences_touch_strip 
	netprefinterface :gettags \{player_num}
	getplayerinfo <player_num> enable_touch_strip
	if (<enable_touch_strip> = 1)
		value = 0
		soundevent \{event = checkbox_sfx}
	else
		value = 1
		soundevent \{event = checkbox_check_sfx}
	endif
	obj_getid
	tick_untick_checkbox value = <value> submenu_item_id = <objid>
	setplayerinfo <player_num> enable_touch_strip = <value>
	get_savegame_from_controller controller = <device_num>
	if isxenon
		setglobaltags savegame = <savegame> user_options params = {enable_touch_strip_save = <value>}
	elseif (<device_num> = $primary_controller)
		setglobaltags savegame = <savegame> user_options params = {enable_touch_strip_save = <value>}
	endif
endscript

script tick_untick_checkbox 
	requireparams \{[
			value
			submenu_item_id
		]
		all}
	if screenelementexists id = <submenu_item_id>
		if (<value> = 1)
			<submenu_item_id> :se_setprops check_alpha = 1.0
			<submenu_item_id> :se_setprops cross_alpha = 0.0
		else
			<submenu_item_id> :se_setprops check_alpha = 0.0
			<submenu_item_id> :se_setprops cross_alpha = 1.0
		endif
	endif
endscript
