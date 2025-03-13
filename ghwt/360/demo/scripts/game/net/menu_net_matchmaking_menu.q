global_should_use_net_debugging = 0
online_lobby_item_text_color = [
	200
	200
	200
	255
]
online_player_slot_bg_team1 = [
	255
	255
	0
	255
]
online_player_slot_bg_team2 = [
	83
	45
	106
	255
]
online_player_slot_bg_gray = [
	89
	90
	92
	255
]
ps3_chat_warning_text = [
	150
	150
	150
	255
]
default_online_warning_pos = (980.0, 480.0)
net_num_player_settings_ack = 0
net_starting_matchmaking = 0
net_block_matchmaking = 0
online_to_setlist_count = 10
net_num_players = 0
gamertag_0 = qs(0x00000000)
gamertag_1 = qs(0x00000000)
gamertag_2 = qs(0x00000000)
gamertag_3 = qs(0x00000000)
gamertag_4 = qs(0x00000000)
gamertag_5 = qs(0x00000000)
gamertag_6 = qs(0x00000000)
gamertag_7 = qs(0x00000000)
net_helper_text_strings = {
	find_a_game_text = qs(0xc1201c11)
	debug_create_match_text = qs(0x10b0727c)
	debug_custom_search_text = qs(0x9d1520dd)
	game_mode_text = qs(0xde03dba6)
	start_matchmaking_text = qs(0x07f6b71c)
	matchmaking_complete_text = qs(0x869701dc)
	friends_text = qs(0x3f4b229f)
	timer_5_text = qs(0xbf481dd4)
	timer_4_text = qs(0xa6532c95)
	timer_3_text = qs(0xe912ba52)
	timer_2_text = qs(0xf0098b13)
	timer_1_text = qs(0xdb24d8d0)
	timer_0_text = qs(0xc23fe991)
	postgame_play_again_text = qs(0xd02307b1)
	postgame_party_up_text = qs(0x0a4ae9af)
	p2_pro_faceoff_text = qs(0x61385580)
	p4_pro_faceoff_text = qs(0xc7550a40)
	p2_faceoff_text = qs(0xb8805f63)
	p2_battle_text = qs(0x09d42ee1)
	p2_quickplay_text = qs(0x958a1731)
	p4_quickplay_text = qs(0x7847bad8)
	p8_pro_faceoff_text = qs(0xeecf4e99)
	p4_career_text = qs(0x82f80e32)
}
net_helper_text_strings_xen = {
	preferences_text = qs(0xdf6376f3)
	pref_character_text = qs(0xe0d87a1c)
	pref_difficulty_text = qs(0x58fe6093)
	pref_lefty_flip_text = qs(0xebce6360)
	pref_venue_text = qs(0x4a1fdafa)
	pref_vocal_style_text = qs(0x743fe478)
	gamer_card_text = qs(0x3aa38ab5)
	sign_in_text = qs(0x7ca9368d)
	postgame_quit_text = qs(0xdb9fcce6)
	friends_menu_text = qs(0x5ee2a003)
	blank_text = qs(0x00000000)
}
net_helper_text_strings_ps3 = {
	preferences_text = qs(0x5e4232a5)
	pref_character_text = qs(0x2154e6be)
	pref_difficulty_text = qs(0xe2a82b91)
	pref_lefty_flip_text = qs(0x026e3d2c)
	pref_venue_text = qs(0x78503805)
	pref_vocal_style_text = qs(0xaffa5a09)
	gamer_card_text = qs(0x00000000)
	postgame_quit_text = qs(0xdf3c37a3)
	friends_menu_text = qs(0x0f66f204)
}
has_invite_join_result_callback_completed = 0
need_to_refresh_player_slots = 0
net_no_focus_warning = 0

script net_spawned_wait_and_set_joinable 
	if netsessionfunc \{obj = party
			func = is_host}
		wait \{2
			seconds}
		netsessionfunc \{obj = party
			func = set_party_joinable
			params = {
				joinable = 1
			}}
	endif
endscript

script create_net_matchmaking_menu 
	netsessionfunc \{obj = voice
		func = turnteamtalkoff}
	frontend_load_soundcheck \{loadingscreen}
	createscreenelement \{parent = root_window
		id = onlinelobbyinterface
		type = descinterface
		desc = 'online_lobby'
		pos = (0.0, -1000.0)
		tags = {
			menu_index = 0
			menu_items = 0
			slots_index = -1
			slot_items = 0
			player_slots_menu_id = 0
			locked_to_players = 0
			toggle_allowed = 1
		}}
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
	onlinelobbyinterface :desc_checkversion \{desired = 16
		assertif = mismatch}
	getactivecontrollers
	getarraysize <active_controllers>
	i = 0
	begin
	if (<active_controllers> [<i>] = 1)
		if netsessionfunc func = iscontrolleringame params = {controller = <i>}
			restore_save_net_preferences controller_index = <i>
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	create_matchmaking_menu_and_items
	create_player_slots_container
	spawnscriptnow \{task_menu_default_anim_in
		params = {
			base_name = 'band_hub'
		}}
	create_signin_container
	change \{net_no_focus_warning = 0}
	online_lobby_setup_helper_controls
	if gotparam \{accepting_invite}
		create_joining_invite_popup
	else
		if onlinelobbyinterface :desc_resolvealias \{name = alias_matchmaking_vmenu
				param = vmenu_id}
			onlinelobbyinterface :obj_spawnscriptnow online_lobby_animate_in params = {<...>}
		endif
	endif
	if isps3
		if NOT netsessionfunc \{obj = voice
				func = voice_allowed}
			create_ps3_chat_warning_message \{message = qs(0x925535f4)}
		endif
	endif
endscript

script online_lobby_setup_helper_controls \{menu_type = left_hand}
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :gettags
		clean_up_user_control_helpers
		if checksumequals a = left_hand b = <menu_type>
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
		elseif checksumequals a = right_hand b = <menu_type>
			if isxenon
				if gotparam \{gamer_card}
					if (<gamer_card> = 1)
						add_user_control_helper \{text = qs(0xfcc51f45)
							button = green
							z = 100000}
					endif
				endif
			endif
		endif
		getactivecontrollers
		getarraysize <active_controllers>
		i = 0
		begin
		if (<active_controllers> [<i>] = 1)
			if netsessionfunc func = iscontrolleringame params = {controller = <i>}
				get_controller_type controller_index = <i>
				if (<controller_type> = guitar)
					add_user_control_helper text = qs(0x0d215c11) button = orange z = 100000 controller = <i>
					break
				endif
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		if ($is_multiplayer_beta = 0)
			if isps3
				add_user_control_helper \{text = qs(0x306229d7)
					button = yellow
					z = 100000}
			endif
		endif
	endif
endscript

script online_lobby_animate_in 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	wait \{0.5
		second}
	soundevent \{event = online_main_panel_in}
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :se_setprops \{pos = (0.0, 30.0)
			time = 0.2
			anim = gentle}
	else
		return
	endif
	wait \{0.22
		second}
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :se_setprops \{pos = (0.0, 0.0)
			time = 0.1
			anim = gentle}
	else
		return
	endif
	assignalias id = <vmenu_id> alias = current_menu
	launchevent \{type = focus
		target = current_menu}
	resolvescreenelementid \{id = [
			{
				id = onlinelobbyinterface
			}
			{
				local_id = lobby_menu
			}
			{
				local_id = matchmaking_container
			}
			{
				local_id = right_side_container
			}
		]}
	online_lobby_swing id = <resolved_id>
	if gotparam \{lost_party}
		create_online_warning_message \{title = qs(0x50c3c667)
			message = qs(0x1715dfdb)
			alpha = 0.0}
		display_online_warning_message
	endif
endscript

script online_lobby_swing 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	if (RandomInteger (0.0, 1.0) = 1)
		swing_direction = 1
	else
		swing_direction = -1
	endif
	swing_direction = (<swing_direction> * RandomFloat (0.3, 1.0))
	if screenelementexists id = <id>
		<id> :se_setprops rot_angle = (<swing_direction> * 2) anim = gentle time = 0.2
	else
		return
	endif
	wait \{0.25
		second}
	if screenelementexists id = <id>
		<id> :se_setprops rot_angle = (<swing_direction> * -1.75) anim = gentle time = 0.2
	else
		return
	endif
	wait \{0.25
		second}
	if screenelementexists id = <id>
		<id> :se_setprops rot_angle = (<swing_direction> * 1.5) anim = gentle time = 0.2
	else
		return
	endif
	wait \{0.25
		second}
	if screenelementexists id = <id>
		<id> :se_setprops rot_angle = (<swing_direction> * -1.25) anim = gentle time = 0.2
	else
		return
	endif
	wait \{0.25
		second}
	if screenelementexists id = <id>
		<id> :se_setprops rot_angle = (<swing_direction> * 1.0) anim = gentle time = 0.2
	else
		return
	endif
	wait \{0.25
		second}
	if screenelementexists id = <id>
		<id> :se_setprops rot_angle = (<swing_direction> * -0.5) anim = gentle time = 0.2
	else
		return
	endif
	wait \{0.25
		second}
	if screenelementexists id = <id>
		<id> :se_setprops rot_angle = (<swing_direction> * 0.25) anim = gentle time = 0.2
	else
		return
	endif
	wait \{0.25
		second}
	if screenelementexists id = <id>
		<id> :se_setprops rot_angle = 0 anim = gentle time = 0.1
	else
		return
	endif
endscript

script online_lobby_transition_in 
	online_lobby_setup_helper_controls
	resolvescreenelementid \{id = [
			{
				id = onlinelobbyinterface
			}
			{
				local_id = lobby_menu
			}
			{
				local_id = matchmaking_container
			}
			{
				local_id = left_side_container
			}
		]}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	soundevent \{event = online_panel_in}
	if screenelementexists \{id = onlinelobbyinterface}
		<resolved_id> :se_setprops pos = {(0.0, 1000.0) relative} time = 0.15 anim = gentle
	else
		return
	endif
	wait \{0.15
		second}
	if NOT gotparam \{no_focus}
		launchevent \{type = focus
			target = current_menu}
	endif
endscript

script online_lobby_transition_out 
	resolvescreenelementid \{id = [
			{
				id = onlinelobbyinterface
			}
			{
				local_id = lobby_menu
			}
			{
				local_id = matchmaking_container
			}
			{
				local_id = left_side_container
			}
		]}
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	if screenelementexists \{id = onlinelobbyinterface}
		<resolved_id> :se_setprops pos = {(0.0, -1000.0) relative} time = 0.15 anim = gentle
	else
		return
	endif
	wait \{0.15
		second}
endscript

script destroy_net_matchmaking_menu 
	if screenelementexists \{id = onlinelobbyinterface}
		destroyscreenelement \{id = onlinelobbyinterface}
	endif
	killspawnedscript \{name = set_net_ui_to_finished_searching}
	generic_ui_destroy
endscript

script create_joining_invite_popup 
	printf \{qs(0x7c8c6783)}
	if ($has_invite_join_result_callback_completed = 0)
		create_popup_warning_menu \{title = qs(0x4d21d20e)
			textblock = {
				text = qs(0x00000000)
			}
			parent = current_menu
			no_background
			options = [
				{
					func = kill_online_popup
					text = qs(0x7343df39)
				}
			]}
		createscreenelement \{type = spriteelement
			parent = popupelement
			texture = load_wheel
			pos = (440.0, 300.0)
			dims = (128.0, 128.0)
			just = [
				center
				center
			]
			z_priority = 520}
		popupelement :obj_spawnscriptnow animate_online_icon params = {id = <id>}
		assignalias \{id = pu_warning_vmenu
			alias = current_menu}
	endif
endscript

script cleanup_invite_popup 
	printf \{qs(0xd693e89b)}
	destroy_popup_warning_menu
	launchevent \{type = focus
		target = current_menu}
endscript

script animate_online_icon 
	rot_angle = -360
	begin
	<id> :se_setprops rot_angle = <rot_angle> time = 1.0
	<id> :se_waitprops
	<rot_angle> = (<rot_angle> - 360)
	repeat
endscript

script create_online_warning_message title = qs(0x134b7e69) message = qs(0xa609d4d1) pos = ($default_online_warning_pos) parent = onlinelobbyinterface alpha = 1.0
	if NOT screenelementexists id = <parent>
		return
	endif
	if screenelementexists \{id = online_warning_message_container}
		destroyscreenelement \{id = online_warning_message_container}
	endif
	getscreenelementzpriority id = <parent>
	createscreenelement {
		type = containerelement
		id = online_warning_message_container
		parent = <parent>
		pos = <pos>
		just = [center center]
		z_priority = (<z_priority> + 20)
		alpha = <alpha>
	}
	menu_anchor = <id>
	createscreenelement {
		type = spriteelement
		parent = <menu_anchor>
		texture = online_dialog_bg
		dims = (360.0, 360.0)
		pos = (0.0, 0.0)
		just = [center center]
		z_priority = (<z_priority> + 21)
		alpha = 1.0
	}
	createscreenelement {
		type = textblockelement
		parent = <menu_anchor>
		id = online_warning_message_title
		font = fontgrid_text_a6
		rgba = ($online_lobby_item_text_color)
		text = <title>
		just = [center center]
		internal_just = [center center]
		z_priority = (<z_priority> + 22)
		pos = (0.0, -115.0)
		dims = (150.0, 36.0)
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = `per axis`
	}
	createscreenelement {
		type = textblockelement
		parent = <menu_anchor>
		id = online_warning_message_text
		font = fontgrid_text_a6
		rgba = ($online_lobby_item_text_color)
		text = <message>
		just = [center center]
		internal_just = [center center]
		internal_scale = 0.7
		z_priority = (<z_priority> + 22)
		pos = (0.0, 25.0)
		dims = (300.0, 200.0)
		single_line = false
		fit_width = wrap
		fit_height = `scale down if larger`
		scale_mode = `per axis`
	}
endscript

script destroy_online_warning_message 
	if screenelementexists \{id = online_warning_message_container}
		destroyscreenelement \{id = online_warning_message_container}
	endif
endscript

script display_online_warning_message 
	if screenelementexists \{id = online_warning_message_container}
		online_warning_message_container :obj_spawnscriptnow \{online_warning_message_animate}
	endif
endscript

script online_warning_message_animate 
	if screenelementexists \{id = online_warning_message_container}
		online_warning_message_container :se_setprops \{alpha = 1.0
			time = 0.2}
		online_warning_message_container :se_waitprops
	endif
	wait \{2.0
		seconds}
	if screenelementexists \{id = online_warning_message_container}
		online_warning_message_container :se_setprops \{alpha = 0.0
			time = 0.2}
		online_warning_message_container :se_waitprops
	endif
	destroy_online_warning_message
endscript

script create_ps3_chat_warning_message 
	createscreenelement {
		type = textblockelement
		parent = onlinelobbyinterface
		id = ps3_chat_warning_text
		font = fontgrid_text_a6
		rgba = ($ps3_chat_warning_text)
		pos = (870.0, 550.0)
		dims = (515.0, 200.0)
		text = <message>
		just = [center center]
		internal_just = [center center]
		internal_scale = 0.5
		z_priority = 3.1
		single_line = false
		fit_width = wrap
		fit_height = `scale down if larger`
		scale_mode = `per axis`
	}
endscript

script destroy_ps3_chat_warning_message 
	if screenelementexists \{id = ps3_chat_warning_text}
		destroyscreenelement \{id = ps3_chat_warning_text}
	endif
endscript

script create_matchmaking_menu_and_items 
	if ($is_multiplayer_beta = 1)
		demo_mode_disable = {rgba = [128 128 128 255] generic_list_menu_item_text_rgba = [128 128 128 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	if onlinelobbyinterface :desc_resolvealias \{name = alias_matchmaking_vmenu}
		if ($is_multiplayer_beta = 0)
			if isps3
				new_event_handlers = [
					{pad_back leave_net_main_menu params = {id = <resolved_id>}}
					{pad_up net_up_down_action params = {action = up}}
					{pad_down net_up_down_action params = {action = down}}
					{pad_option2 ps3_display_invites_received}
					{pad_l1 toggle_guitar_part}
				]
			else
				new_event_handlers = [
					{pad_back leave_net_main_menu params = {id = <resolved_id>}}
					{pad_up net_up_down_action params = {action = up}}
					{pad_down net_up_down_action params = {action = down}}
					{pad_l1 toggle_guitar_part}
				]
			endif
			<resolved_id> :se_setprops {
				event_handlers = <new_event_handlers>
			}
		else
			<resolved_id> :se_setprops {
				event_handlers = [
					{pad_back leave_net_main_menu params = {id = <resolved_id>}}
					{pad_up net_up_down_action params = {action = up}}
					{pad_down net_up_down_action params = {action = down}}
				]
			}
		endif
		<matchmaking_vmenu_id> = <resolved_id>
		menu_items = 0
		if netsessionfunc \{obj = party
				func = is_host}
		else
			focusable = not_focusable
		endif
		resolvescreenelementid id = {<matchmaking_vmenu_id> child = start_matchmaking}
		<resolved_id> :se_setprops {
			<focusable>
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose start_matchmaking}
			]
		}
		if gotparam \{focusable}
			if (<focusable> = not_focusable)
				resolvescreenelementid id = [
					{id = <resolved_id>}
					{local_id = text}
				]
				<menu_items> = (<menu_items> - 1)
				<resolved_id> :se_setprops alpha = 0.5
			endif
		endif
		choose_first_viewable_mode \{net_pref_name = game_modes}
		netoptions :pref_get \{name = game_modes}
		formattext textname = game_mode_text qs(0xed77b849) d = <display_string>
		resolvescreenelementid id = [
			{id = <matchmaking_vmenu_id>}
			{local_id = game_mode}
			{local_id = text}
		]
		start_matchmaking_params = {
			net_pref_name = game_modes
			base_text = qs(0xbd07b80c)
			vmenu_id = current_menu
			text_id = <resolved_id>
			net_pref_name = game_modes
		}
		resolvescreenelementid id = {<matchmaking_vmenu_id> child = game_mode}
		<resolved_id> :se_setprops {
			<focusable>
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose try_create_matchmaking_submenu params = {<start_matchmaking_params> title = qs(0x876172e8)}}
			]
		}
		if gotparam \{focusable}
			if (<focusable> = not_focusable)
				resolvescreenelementid id = [
					{id = <resolved_id>}
					{local_id = text}
				]
				<resolved_id> :se_setprops alpha = 0.5
			endif
		endif
		onlinelobbyinterface :se_setprops {
			matchmaking_game_mode_text = <game_mode_text>
		}
		resolvescreenelementid id = {<matchmaking_vmenu_id> child = friends}
		<resolved_id> :se_setprops {
			<demo_mode_disable>
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose ui_menu_select_sfx}
				{pad_choose start_friendslist}
			]
		}
		if ($is_multiplayer_beta = 1)
			resolvescreenelementid id = [
				{id = <resolved_id>}
				{local_id = text}
			]
			<resolved_id> :se_setprops {<demo_mode_disable>}
		endif
		resolvescreenelementid id = {<matchmaking_vmenu_id> child = preferences}
		<resolved_id> :se_setprops {
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose ui_menu_select_sfx}
				{pad_choose start_net_preferences}
			]
		}
		<menu_items> = 0
		getscreenelementchildren id = <matchmaking_vmenu_id>
		getarraysize <children>
		j = 0
		begin
		if NOT (<children> [<j>]) :getsingletag tag_not_focusable
			<menu_items> = (<menu_items> + 1)
		endif
		j = (<j> + 1)
		repeat <array_size>
		onlinelobbyinterface :settags menu_items = <menu_items>
		change \{net_starting_matchmaking = 0}
		if (1 = $global_should_use_net_debugging)
			add_matchmaking_item {
				vmenu_id = <matchmaking_vmenu_id>
				msg_checksum = debug_create_match
				text = qs(0x3e236307)
				choose_script = net_quick_create
				<focusable>
			}
			add_matchmaking_item {
				vmenu_id = <matchmaking_vmenu_id>
				msg_checksum = debug_custom_search
				text = qs(0xe57d4656)
				choose_script = net_custom_search
				<focusable>
			}
		endif
	endif
endscript

script destroy_matchmaking_menu_and_items 
	if screenelementexists \{id = matchmaking_vscollingmenu}
		destroyscreenelement \{id = matchmaking_vscollingmenu}
	endif
endscript

script net_up_down_action 
	onlinelobbyinterface :gettags
	if NOT gotparam \{action}
		return
	endif
	if NOT screenelementexists \{id = current_menu}
		return
	endif
	if NOT screenelementexists id = <player_slots_menu_id>
		return
	endif
	generic_menu_up_or_down_sound <action>
	if (<locked_to_players> = 0)
		if isscreenelementinfocus \{id = current_menu}
			if (<action> = up)
				if (<menu_index> = 0)
					if (<slot_items> > 0)
						launchevent \{type = unfocus
							target = current_menu}
						online_lobby_setup_helper_controls \{menu_type = right_hand}
						launchevent type = focus target = <player_slots_menu_id> data = {child_index = (<slot_items> - 1)}
						onlinelobbyinterface :settags slots_index = (<slot_items> - 1)
					else
						onlinelobbyinterface :settags menu_index = (<menu_items> - 1)
					endif
				else
					onlinelobbyinterface :settags menu_index = (<menu_index> - 1)
				endif
			elseif (<action> = down)
				if (<menu_index> = (<menu_items> - 1))
					if (<slot_items> > 0)
						launchevent \{type = unfocus
							target = current_menu}
						online_lobby_setup_helper_controls \{menu_type = right_hand}
						launchevent type = focus target = <player_slots_menu_id> data = {child_index = 0}
						onlinelobbyinterface :settags \{slots_index = 0}
					else
						onlinelobbyinterface :settags \{menu_index = 0}
					endif
				else
					onlinelobbyinterface :settags menu_index = (<menu_index> + 1)
				endif
			endif
		elseif isscreenelementinfocus id = <player_slots_menu_id>
			if (<action> = up)
				if (<slots_index> = 0)
					if (<menu_items> > 0)
						launchevent type = unfocus target = <player_slots_menu_id>
						online_lobby_setup_helper_controls
						launchevent type = focus target = current_menu data = {child_index = (<menu_items> - 1)}
						onlinelobbyinterface :settags \{slots_index = -1}
						onlinelobbyinterface :settags menu_index = (<menu_items> - 1)
					else
						onlinelobbyinterface :settags slots_index = (<slots_items> - 1)
					endif
				else
					if (<slots_index> = -1)
						<slots_index> = 1
					endif
					onlinelobbyinterface :settags slots_index = (<slots_index> - 1)
				endif
			elseif (<action> = down)
				if (<slots_index> = (<slot_items> - 1))
					if (<menu_items> > 0)
						launchevent type = unfocus target = <player_slots_menu_id>
						online_lobby_setup_helper_controls
						launchevent \{type = focus
							target = current_menu
							data = {
								child_index = 0
							}}
						onlinelobbyinterface :settags \{slots_index = -1}
						onlinelobbyinterface :settags \{menu_index = 0}
					else
						onlinelobbyinterface :settags slots_index = (<slots_items> - 1)
					endif
				else
					if (<slots_index> = -1)
						<slots_index> = 0
					endif
					onlinelobbyinterface :settags slots_index = (<slots_index> + 1)
				endif
			endif
		endif
	endif
endscript

script choose_first_viewable_mode 
	netoptions :pref_get \{name = game_modes}
	is_gamemode_visible mode = <checksum>
	if (<item_is_visible>)
		return
	endif
	netoptions :pref_size \{name = game_modes}
	i = 0
	begin
	netoptions :pref_get name = game_modes index = <i>
	is_gamemode_visible mode = <checksum>
	if (<item_is_visible>)
		netoptions :pref_choose name = game_modes index = <i>
		return
	endif
	<i> = (<i> + 1)
	repeat <size>
	if netsessionfunc \{obj = party
			func = is_host}
		netoptions :pref_get \{name = game_modes}
		netsessionfunc obj = party func = append_shared_data params = {data = {game_mode = <i>}}
	endif
endscript

script is_gamemode_visible 
	<returnvalue> = 0
	get_visible_game_modes
	if arraycontains array = <modes> contains = <mode>
		<returnvalue> = 1
	endif
	return item_is_visible = <returnvalue>
endscript

script get_visible_game_modes 
	available_modes = [
		p2_pro_faceoff
		p4_pro_faceoff
		p2_faceoff
		p2_pro_faceoff
		p2_faceoff
		p2_battle
		p2_quickplay
		p4_quickplay
		p8_pro_faceoff
	]
	return modes = <available_modes>
endscript

script try_create_matchmaking_submenu 
	requireparams \{[
			device_num
			title
		]
		all}
	if (<device_num> = $primary_controller)
		ui_menu_select_sfx
		create_matchmaking_submenu <...>
	else
		menu_scroll_end_sound
	endif
endscript

script create_matchmaking_submenu \{title = qs(0xae01dcbe)}
	online_lobby_transition_out
	createscreenelement {
		type = descinterface
		parent = onlinelobbyinterface
		desc = 'online_lobby_left_side'
		pos = (0.0, -1000.0)
		id = onlinesubmenuinterface
		exclusive_device = <device_num>
		tags = {
			menu_index = 0
			menu_items = 0
			player_num = <info_index>
			exit_script = <exit_script>
			scrollbar_id = null
		}
	}
	onlinesubmenuinterface :desc_checkversion \{desired = 2
		assertif = mismatch}
	<id> :se_setprops title_text = <title>
	left_side_id = <id>
	if onlinesubmenuinterface :desc_resolvealias \{name = alias_online_lobby_scrollbar
			param = scrollbar_id}
		onlinesubmenuinterface :settags scrollbar_id = <scrollbar_id>
	endif
	if onlinesubmenuinterface :desc_resolvealias \{name = alias_left_side_vmenu}
		<resolved_id> :se_setprops {
			event_handlers = [
				{pad_back generic_menu_pad_back_sound}
				{pad_back destroy_matchmaking_submenu params = {container_id = onlinesubmenuinterface vmenu_id = <subvmenu_id> parent_id = <vmenu_id>}}
				{pad_up generic_menu_up_or_down_sound}
				{pad_up online_lobby_submenu_up}
				{pad_down generic_menu_up_or_down_sound}
				{pad_down online_lobby_submenu_down}
			]
		}
		subvmenu_id = <resolved_id>
		netoptions :pref_getstruct name = <net_pref_name>
		if gotparam \{pref_struct}
			<checksum> = (<pref_struct>.search_chk)
		endif
		<current_index> = 0
		netoptions :pref_size name = <net_pref_name>
		i = 0
		<menu_index> = 0
		<item_is_visible> = 1
		begin
		netoptions :pref_getstruct name = <net_pref_name> index = <i>
		if structurecontains structure = <pref_struct> func
			(<pref_struct>.func) mode = (<pref_struct>.checksum)
		endif
		if (<item_is_visible>)
			if (<checksum> = <pref_struct>.search_chk)
				<current_index> = <menu_index>
			endif
			add_matchmaking_item {
				sub_menu_item
				slide_left
				vmenu_id = <subvmenu_id>
				text = (<pref_struct>.name)
				choose_script = select_submenu_item
				focus_script = matchmaking_submenu_item_change_focus
				choose_script_params = {
					net_pref_name = <net_pref_name>
					base_text = <base_text>
					text = (<pref_struct>.name)
					text_id = <text_id>
					index = <i>
					container_id = onlinesubmenuinterface
					vmenu_id = <subvmenu_id>
					parent_id = <vmenu_id>
				}
			}
			if gotparam \{id}
				<id> :settags msg_checksum = (<pref_struct>.checksum)
			endif
			<menu_index> = (<menu_index> + 1)
		endif
		i = (<i> + 1)
		repeat <size>
		if screenelementexists id = <scrollbar_id>
			onlinesubmenuinterface :gettags
			scroll_increment = (175 / (<menu_items> -1))
			<scrollbar_id> :settags scroll_increment = <scroll_increment>
			<scrollbar_id> :se_setprops scrollbar_thumb_pos = ((0.0, 1.0) * (<scroll_increment> * <current_index>))
		endif
		onlinesubmenuinterface :settags menu_index = <current_index>
		launchevent type = unfocus target = <vmenu_id>
	endif
	clean_up_user_control_helpers
	menu_finish
	if gotparam \{title}
		switch <title>
			case qs(0x876172e8)
			soundevent \{event = online_panel_in}
		endswitch
	endif
	if gotparam \{subvmenu_id}
		<left_side_id> :obj_spawnscriptnow animate_left_side params = {id = <left_side_id> direction = in focus_id = <subvmenu_id> focus_index = <current_index>}
	else
		<left_side_id> :obj_spawnscriptnow animate_left_side params = {id = <left_side_id> direction = in}
	endif
endscript

script destroy_matchmaking_submenu 
	if NOT ((gotparam container_id) || (gotparam vmenu_id) || (gotparam parent_id))
		return
	endif
	if screenelementexists id = <vmenu_id>
		launchevent type = unfocus target = <vmenu_id>
	endif
	if screenelementexists id = <container_id>
		animate_left_side id = <container_id> direction = out
		destroyscreenelement id = <container_id>
		online_lobby_transition_in
	endif
	if screenelementexists id = <parent_id>
		launchevent type = focus target = <parent_id>
	endif
endscript

script select_submenu_item 
	if gotparam \{text_id}
		if screenelementexists id = <text_id>
			formattext textname = new_string qs(0x3080c264) s = <base_text> d = <text>
			setscreenelementprops id = <text_id> text = <new_string>
			netoptions :pref_choose name = <net_pref_name> index = <index>
			if netsessionfunc \{obj = party
					func = is_host}
				netoptions :pref_get name = <net_pref_name>
				netsessionfunc obj = party func = append_shared_data params = {data = {game_mode = <index>}}
			endif
		endif
	endif
	destroy_matchmaking_submenu container_id = <container_id> vmenu_id = <vmenu_id> parent_id = <parent_id>
endscript

script online_lobby_submenu_up 
	if screenelementexists \{id = onlinesubmenuinterface}
		onlinesubmenuinterface :gettags
		if (<menu_index> = 0)
			onlinesubmenuinterface :settags menu_index = (<menu_items> - 1)
			if screenelementexists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 175.0)
			endif
		else
			onlinesubmenuinterface :settags menu_index = (<menu_index> - 1)
			if screenelementexists id = <scrollbar_id>
				<scrollbar_id> :gettags
				pos = ((0.0, -1.0) * <scroll_increment>)
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = {<pos> relative}
			endif
		endif
	endif
endscript

script online_lobby_submenu_down 
	if screenelementexists \{id = onlinesubmenuinterface}
		onlinesubmenuinterface :gettags
		if ((<menu_index> + 1) = <menu_items>)
			onlinesubmenuinterface :settags \{menu_index = 0}
			if screenelementexists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 0.0)
			endif
		else
			onlinesubmenuinterface :settags menu_index = (<menu_index> + 1)
			if screenelementexists id = <scrollbar_id>
				<scrollbar_id> :gettags
				pos = ((0.0, 1.0) * (<scroll_increment>))
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = {<pos> relative}
			endif
		endif
	endif
endscript

script add_matchmaking_item \{focus_script = matchmaking_item_change_focus}
	if NOT gotparam \{vmenu_id}
		return
	endif
	if NOT gotparam \{text}
		text = qs(0x134b7e69)
	endif
	text_alpha = 1
	if gotparam \{not_focusable}
		focusable = not_focusable
		text_alpha = 0.5
	endif
	createscreenelement {
		type = containerelement
		parent = <vmenu_id>
		pos = (0.0, 0.0)
		dims = (256.0, 40.0)
		<focusable>
		event_handlers = [
			{focus <focus_script> params = {focus}}
			{unfocus <focus_script> params = {unfocus}}
		]
	}
	container_id = <id>
	if gotparam \{msg_checksum}
		<container_id> :settags msg_checksum = <msg_checksum>
	endif
	if gotparam \{choose_script}
		setscreenelementprops {
			id = <container_id>
			event_handlers = [
				{pad_choose ui_menu_select_sfx}
				{pad_choose <choose_script> params = <choose_script_params>}
			]
		}
	endif
	if gotparam \{sub_menu_item}
		width = 285
		if screenelementexists \{id = onlinesubmenuinterface}
			onlinesubmenuinterface :gettags
			onlinesubmenuinterface :settags menu_items = (<menu_items> + 1)
		endif
	else
		if NOT gotparam \{not_focusable}
			onlinelobbyinterface :gettags
			onlinelobbyinterface :settags menu_items = (<menu_items> + 1)
		endif
		width = 285
	endif
	getscreenelementzpriority id = <container_id>
	<text_pos> = (10.0, 0.0)
	if gotparam \{slide_left}
		<text_pos> = (0.0, 0.0)
	endif
	if gotparam \{text_id}
		createscreenelement {
			type = textblockelement
			parent = <container_id>
			id = <text_id>
			local_id = text
			font = fontgrid_text_a6
			rgba = ($online_lobby_item_text_color)
			pos = <text_pos>
			alpha = <text_alpha>
			dims = (325.0, 42.0)
			text = <text>
			just = [left top]
			z_priority = (<z_priority> + 1.5)
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = `per axis`
		}
	else
		createscreenelement {
			type = textblockelement
			parent = <container_id>
			local_id = text
			font = fontgrid_text_a6
			rgba = ($online_lobby_item_text_color)
			pos = <text_pos>
			alpha = <text_alpha>
			dims = (325.0, 42.0)
			text = <text>
			just = [left top]
			z_priority = (<z_priority> + 1.5)
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = `per axis`
		}
	endif
	return id = <container_id>
endscript

script matchmaking_item_change_focus 
	obj_getid
	<objid> :gettags
	resolvescreenelementid id = [
		{id = <objid>}
		{local_id = text}
	]
	if gotparam \{focus}
		if gotparam \{msg_checksum}
			set_net_dialog_message msg_checksum = <msg_checksum>
		endif
		retail_menu_focus id = <resolved_id>
	elseif gotparam \{unfocus}
		retail_menu_unfocus id = <resolved_id>
	endif
endscript

script set_net_dialog_message 
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
		if screenelementexists \{id = onlinelobbyinterface}
			onlinelobbyinterface :se_setprops matchmaking_info_text = ($<plat_helper_strings>.<appended_id>)
		endif
	elseif structurecontains structure = ($net_helper_text_strings) <appended_id>
		if screenelementexists \{id = onlinelobbyinterface}
			onlinelobbyinterface :se_setprops matchmaking_info_text = ($net_helper_text_strings.<appended_id>)
		endif
	endif
endscript

script matchmaking_submenu_item_change_focus 
	obj_getid
	<objid> :gettags
	resolvescreenelementid id = [
		{id = <objid>}
		{local_id = text}
	]
	if gotparam \{focus}
		if gotparam \{msg_checksum}
			set_submenu_helper_text msg_checksum = <msg_checksum>
		endif
		retail_menu_focus id = <resolved_id>
	elseif gotparam \{unfocus}
		retail_menu_unfocus id = <resolved_id>
	endif
endscript

script set_submenu_helper_text 
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
		if screenelementexists \{id = onlinesubmenuinterface}
			onlinesubmenuinterface :se_setprops info_text = ($<plat_helper_strings>.<appended_id>)
		endif
	elseif structurecontains structure = ($net_helper_text_strings) <appended_id>
		if screenelementexists \{id = onlinesubmenuinterface}
			onlinesubmenuinterface :se_setprops info_text = ($net_helper_text_strings.<appended_id>)
		endif
	endif
endscript

script create_player_slots_container 
	if onlinelobbyinterface :desc_resolvealias \{name = alias_player_slots_vmenu}
		<player_slots_menu_id> = <resolved_id>
		onlinelobbyinterface :settags player_slots_menu_id = <player_slots_menu_id>
		if isps3
			new_event_handlers = [
				{pad_back leave_net_main_menu params = {id = <player_slots_menu_id>}}
				{pad_up net_up_down_action params = {action = up}}
				{pad_down net_up_down_action params = {action = down}}
				{pad_option2 ps3_display_invites_received}
				{pad_l1 toggle_guitar_part}
			]
		else
			new_event_handlers = [
				{pad_back leave_net_main_menu params = {id = <player_slots_menu_id>}}
				{pad_up net_up_down_action params = {action = up}}
				{pad_down net_up_down_action params = {action = down}}
				{pad_l1 toggle_guitar_part}
			]
		endif
		<player_slots_menu_id> :se_setprops {
			event_handlers = <new_event_handlers>
		}
		<player_slots_menu_id> :settags {
			num_players_in_session = 0
			safe_to_refresh_player_slots = 1
			all_players_checksum = [
				empty
				empty
				empty
				empty
				empty
				empty
				empty
				empty
			]
			local_controllers = [
				unplugged
				unplugged
				unplugged
				unplugged
				unplugged
				unplugged
				unplugged
			]
		}
		<player_slots_menu_id> :obj_spawnscriptlater update_player_slots_ui
	endif
endscript

script create_player_slots_ui 
	onlinelobbyinterface :gettags
	<player_slots_menu_id> :gettags
	getarraysize \{all_players_checksum}
	count = 0
	begin
	if (<all_players_checksum> [<count>] = local_signed_in)
		add_player_slot_to_menu index = <count> player_type = local
	elseif (<all_players_checksum> [<count>] = remote)
		add_player_slot_to_menu index = <count> player_type = remote
	elseif (<all_players_checksum> [<count>] = local_not_signed_in)
		if netsessionfunc \{obj = party
				func = is_host}
			get_ui_slot_corresponding_controller target_ui_slot = <count>
			add_player_slot_to_menu index = <count> player_type = not_signed_in controller = <controller>
		endif
	endif
	count = (<count> + 1)
	repeat <array_size>
endscript

script destroy_player_slots_ui 
	onlinelobbyinterface :gettags
	if screenelementexists id = <player_slots_menu_id>
		destroyscreenelement id = <player_slots_menu_id> preserve_parent
	endif
	onlinelobbyinterface :settags \{slot_items = 0}
endscript

script refresh_player_slots_ui 
	printscriptinfo \{qs(0x73ccf700)}
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :gettags
		begin
		<player_slots_menu_id> :gettags
		if (<safe_to_refresh_player_slots> = 1)
			break
		endif
		wait \{1
			frame}
		repeat
		<player_slots_menu_id> :settags safe_to_refresh_player_slots = 0
		onlinelobbyinterface :gettags
		launchevent type = unfocus target = <player_slots_menu_id>
		if (<slots_index> != -1)
			target_slots_index = <slots_index>
		endif
		destroy_player_slots_ui
		create_player_slots_ui
		update_signed_in_controllers
		if gotparam \{target_slots_index}
			onlinelobbyinterface :gettags
			if (<slot_items> = 0)
				onlinelobbyinterface :settags \{menu_index = 0}
				launchevent \{type = focus
					target = current_menu
					data = {
						child_index = 0
					}}
			else
				if ((<target_slots_index> + 1) > <slot_items>)
					onlinelobbyinterface :settags \{slots_index = 0}
					launchevent type = focus target = <player_slots_menu_id> data = {child_index = 0}
				else
					onlinelobbyinterface :settags slots_index = <target_slots_index>
					launchevent type = focus target = <player_slots_menu_id> data = {child_index = <target_slots_index>}
				endif
			endif
		endif
		<player_slots_menu_id> :settags safe_to_refresh_player_slots = 1
	endif
endscript

script player_slot_change_focus 
	obj_getid
	<objid> :gettags
	resolvescreenelementid id = [
		{id = <objid>}
		{local_id = online_player_slots_item}
		{local_id = player_slot_name}
	]
	if gotparam \{focus}
		if gotparam \{msg_checksum}
			set_net_dialog_message msg_checksum = <msg_checksum>
		endif
		if gotparam \{view_gamer_card}
			online_lobby_setup_helper_controls menu_type = right_hand gamer_card = <view_gamer_card>
		endif
		retail_menu_focus id = <resolved_id>
	elseif gotparam \{unfocus}
		retail_menu_unfocus id = <resolved_id>
	endif
endscript

script add_player_slot_to_menu 
	keep_sign_in_button = 0
	cash_icon_alpha = 0
	cash_icon_id = cash_milestone_icon_002
	cash_text = qs(0x00000000)
	if (4 < <index>)
		if isps3
			destroy_ps3_chat_warning_message
		endif
	endif
	if (<player_type> = not_signed_in)
		name = qs(0x09aff446)
		get_controller_type controller_index = <controller>
		formattext checksumname = controller_texture 'Logo_%d_GrayScale' d = ($controller_lookup_table.<controller_type>)
		<keep_sign_in_button> = 1
		<cash_text> = qs(0x00000000)
	elseif (<player_type> = local || <player_type> = remote)
		formattext checksumname = gamertag 'gamertag_%d' d = <index>
		formattext checksumname = player_status 'player%d_status' d = (<index> + 1)
		xuid = [0 0]
		setarrayelement arrayname = xuid index = 0 newvalue = ($<player_status>.net_id_first)
		setarrayelement arrayname = xuid index = 1 newvalue = ($<player_status>.net_id_second)
		sign_in_button_alpha = 0
		if (<player_type> = remote)
			name = $<gamertag>
			formattext checksumname = controller_texture 'Logo_%d_GrayScale' d = ($controller_lookup_table.($<player_status>.part))
			cash_get_info_from_earnings earnings = (($<player_status>.career_earnings))
			formattext textname = cash_text qs(0x76b3fda7) d = <rank>
			<cash_icon_alpha> = 1
		else
			controller = ($<player_status>.controller)
			if NOT netsessionfunc func = iscontrolleringame params = {controller = <controller>}
				name = qs(0x12f727b9)
				<keep_sign_in_button> = 1
			else
				netsessionfunc func = get_gamertag params = {controller = ($<player_status>.controller)}
				change globalname = <gamertag> newvalue = <name>
				cash_ranks_get_icon_id player = (<index> + 1)
				cash_ranks_get_rank player = (<index> + 1)
				formattext textname = cash_text qs(0x76b3fda7) d = <rank>
				<cash_icon_alpha> = 1
				<keep_sign_in_button> = 0
			endif
			if ($net_starting_matchmaking = 0)
				get_controller_type controller_index = ($<player_status>.controller)
				formattext checksumname = controller_texture 'Logo_%d_GrayScale' d = ($controller_lookup_table.<controller_type>)
				if (<controller_type> = guitar)
					formattext checksumname = controller_texture 'Logo_%d_GrayScale' d = ($controller_lookup_table.($<player_status>.part))
				endif
			else
				formattext checksumname = controller_texture 'Logo_%d_GrayScale' d = ($controller_lookup_table.($<player_status>.part))
			endif
		endif
	endif
	<view_gamer_card> = 0
	if isxenon
		if gotparam \{xuid}
			if (<keep_sign_in_button> = 0)
				<view_gamer_card> = 1
			endif
		endif
	endif
	onlinelobbyinterface :gettags
	createscreenelement {
		type = descinterface
		desc = 'online_lobby_player_slot_item'
		parent = <player_slots_menu_id>
		auto_dims = false
		dims = (450.0, 50.0)
		event_handlers = [
			{focus player_slot_change_focus params = {focus view_gamer_card = <view_gamer_card>}}
			{unfocus player_slot_change_focus params = {unfocus}}
		]
	}
	<id> :desc_checkversion desired = 2 assertif = mismatch
	<id> :se_setprops {
		player_slot_name_text = <name>
		player_instrument_logo_texture = <controller_texture>
		player_slot_bg_rgba = ($online_player_slot_bg_gray)
		cash_icon_texture = <cash_icon_id>
		cash_rank_text = <cash_text>
		cash_icon_alpha = <cash_icon_alpha>
	}
	if gotparam \{controller}
		if ((<controller> >= 0) || (<controller> < 4))
			if <id> :desc_resolvealias name = alias_sign_in_button param = signin_id
				<signin_id> :setprops {
					metaremapenableauto = false
					metaremapdevicetouse = <controller>
				}
			endif
		endif
	endif
	if (<keep_sign_in_button> = 0)
		if <id> :desc_resolvealias name = alias_sign_in_button param = signin_id
			<signin_id> :die
		endif
		if isxenon
			formattext checksumname = player_status 'player%d_status' d = (<index> + 1)
			if (<player_type> = remote)
				<id> :obj_spawnscriptlater update_headset_status params = {obj_id = <id> uid = <xuid>}
			elseif NOT netsessionfunc func = xenonisguest params = {controller_index = ($<player_status>.controller)}
				<id> :obj_spawnscriptlater update_headset_status params = {obj_id = <id> uid = <xuid>}
			endif
		endif
	endif
	if isxenon
		if gotparam \{xuid}
			if (<keep_sign_in_button> = 0)
				<id> :se_setprops event_handlers = [{pad_choose ui_menu_select_sfx}
					{pad_choose menu_show_gamercard_from_netid params = {net_id = <xuid>}}
				]
			else
				<id> :se_setprops event_handlers = [{pad_choose menu_scroll_end_sound}]
			endif
		else
			<id> :se_setprops event_handlers = [{pad_choose menu_scroll_end_sound}]
		endif
		if (<player_type> = not_signed_in)
			<id> :settags msg_checksum = sign_in
		elseif (<player_type> = remote)
			<id> :settags msg_checksum = gamer_card
		elseif netsessionfunc func = iscontrolleringame params = {controller = <controller>}
			<id> :settags msg_checksum = gamer_card
		else
			<id> :settags msg_checksum = blank
		endif
	else
		<id> :se_setprops event_handlers = [{pad_choose menu_scroll_end_sound}]
	endif
	onlinelobbyinterface :gettags
	onlinelobbyinterface :settags slot_items = (<slot_items> + 1)
endscript

script update_headset_status 
	headset_icon_alpha = 0
	has_headset = 0
	is_talking = 0
	begin
	<has_headset> = 0
	<is_talking> = 0
	if (netsessionfunc obj = voice func = hasheadset params = {player_xuid = <uid>})
		<has_headset> = 1
	endif
	if (<has_headset> = 1)
		if (netsessionfunc obj = voice func = istalking params = {player_xuid = <uid>})
			<is_talking> = 1
		endif
		if (<is_talking> = 1)
			headset_icon_alpha = 1.0
		else
			headset_icon_alpha = 0.5
		endif
	else
		headset_icon_alpha = 0
	endif
	if screenelementexists id = <obj_id>
		<obj_id> :se_setprops headset_icon_alpha = <headset_icon_alpha>
	endif
	wait \{1.0
		second}
	repeat
endscript

script update_player_slots_ui 
	begin
	get_active_local_controllers
	get_signin_status_local_controllers
	poll_party_object
	change \{net_block_matchmaking = 0}
	if ($need_to_refresh_player_slots = 1)
		refresh_player_slots_ui
		change \{need_to_refresh_player_slots = 0}
	endif
	wait \{1
		second}
	repeat
endscript

script get_active_local_controllers 
	getactivecontrollers
	getarraysize <active_controllers>
	controller_index = 0
	begin
	if (<active_controllers> [<controller_index>] = 1)
		check_for_local_controller_change controller_index = <controller_index> state = active
		if (<change>)
			add_remove_player_to_net_ui action = add index = <controller_index> player_type = local_not_signed_in
		endif
	endif
	if (<active_controllers> [<controller_index>] = 0)
		check_for_local_controller_change controller_index = <controller_index> state = inactive
		if (<change>)
			if isxenon
				if NOT checkforsignin controller_index = <controller_index>
					get_controller_corresponding_ui_slot controller = <controller_index>
					add_remove_player_to_net_ui action = remove ui_slot = <ui_slot> index = <controller_index> player_type = local_not_signed_in
				endif
			else
				if (<controller_index> != $primary_controller)
					netsessionfunc func = removecontroller params = {controller = <controller_index>}
					get_controller_corresponding_ui_slot controller = <controller_index>
					add_remove_player_to_net_ui action = remove ui_slot = <ui_slot> index = <controller_index> player_type = local_not_signed_in
				endif
			endif
		endif
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_size>
endscript

script get_signin_status_local_controllers 
	if onlinelobbyinterface :desc_resolvealias \{name = alias_player_slots_vmenu}
		<resolved_id> :gettags
		getarraysize <local_controllers>
		controller_index = 0
		begin
		if NOT (<local_controllers> [<controller_index>] = unplugged)
			if checkforsignin controller_index = <controller_index>
				check_for_signin_signin_change controller_index = <controller_index> state = signed_in
				if (<change>)
					if netsessionfunc \{obj = party
							func = is_host}
						if NOT party_is_full controller = <controller_index>
							add_remove_player_to_net_ui action = replace index = <controller_index> player_type = local_signed_in
						else
							printf \{qs(0x027c88b5)}
						endif
					elseif netsessionfunc func = iscontrolleringame params = {controller = <controller_index>}
						add_remove_player_to_net_ui action = replace index = <controller_index> player_type = local_signed_in
					endif
				endif
			else
				check_for_signin_signin_change controller_index = <controller_index> state = signed_out
				if (<change>)
					if netsessionfunc \{obj = party
							func = is_host}
						netsessionfunc func = removecontroller params = {controller = <controller_index>}
						add_remove_player_to_net_ui action = replace index = <controller_index> player_type = local_not_signed_in
					endif
				endif
			endif
		endif
		controller_index = (<controller_index> + 1)
		repeat <array_size>
	endif
endscript

script is_net_player_in_struct 
	info_index = 1
	begin
	getplayerinfo <info_index> net_id_first
	getplayerinfo <info_index> net_id_second
	getplayerinfo <info_index> controller
	if ((<net_id_first> = <user_id_first>) && (<net_id_second> = <user_id_second>))
		if (<controller> = <controller_index>)
			return player_in_struct = 1 info_index = <info_index>
		endif
	endif
	info_index = (<info_index> + 1)
	repeat 8
	return \{player_in_struct = 0}
endscript

script restore_save_net_preferences 
	printf \{qs(0xf0dd7111)}
	requireparams \{[
			controller_index
		]
		all}
	get_savegame_from_controller controller = <controller_index>
	found = 0
	index = 1
	begin
	getplayerinfo <index> is_local_client
	if (<is_local_client> = 1)
		getplayerinfo <index> controller
		if (<controller_index> = <controller>)
			load_settings = 0
			if isxenon
				<load_settings> = 1
			elseif (<controller_index> = $primary_controller)
				<load_settings> = 1
			endif
			if (<load_settings> = 1)
				getglobaltags savegame = <savegame> user_options param = lefty_flip_save
				getglobaltags savegame = <savegame> user_options param = vocals_highway_view_save
				setplayerinfo <index> vocals_highway_view = <vocals_highway_view_save>
				setplayerinfo <index> lefty_flip = <lefty_flip_save>
				setplayerinfo <index> lefthanded_gems = <lefty_flip_save>
				setplayerinfo <index> lefthanded_button_ups = <lefty_flip_save>
				setplayerinfo <index> lefthanded_button_ups_flip_save = <lefty_flip_save>
				setplayerinfo <index> lefthanded_gems_flip_save = <lefty_flip_save>
				setplayerinfo <index> difficulty = ($default_difficulty [<controller_index>])
			endif
			get_controller_part controller = <controller_index>
			get_last_band_character_recorded player = <index> part = <controller_part> no_band_leader_grab
			if (<character_id> = none)
				cas_get_random_preset_character savegame = <savegame> part = <controller_part>
			endif
			setplayerinfo <index> character_id = <character_id>
		endif
	endif
	index = (<index> + 1)
	repeat 8
endscript

script poll_party_object 
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize <connections>
	<connections_size> = <array_size>
	if (<connections_size> > 0)
		<index> = 0
		begin
		if ((<connections> [<index>]).is_local = 0)
			is_net_player_in_struct {
				user_id_first = ((<connections> [<index>]).user_id [0])
				user_id_second = ((<connections> [<index>]).user_id [1])
				controller_index = ((<connections> [<index>]).controller_index)
			}
			if (<player_in_struct> = 0)
				printf \{qs(0xf1d57f89)}
				change \{respond_to_signin_changed_all_players = 1}
				netsessionfunc \{obj = party
					func = get_shared_data}
				formattext checksumname = player_data 'player_%d' d = ((<connections> [<index>]).party_id)
				if structurecontains structure = <party_shared_data> <player_data>
					part = ((<party_shared_data>.<player_data>).player_part)
					earnings = ((<party_shared_data>.<player_data>).player_career_earnings)
				else
					switch ((<connections> [<index>]).instrument)
						case eguitar
						part = guitar
						case emicrophone
						part = vocals
						case edrums
						part = drum
						default
						part = guitar
					endswitch
					earnings = 0
				endif
				if ui_slots_are_full
					printf \{qs(0x28f1e81b)}
					remove_locals_not_ingame \{one_player}
				endif
				add_remove_player_to_net_ui {
					action = add
					index = ((<connections> [<index>]).controller_index)
					player_type = remote
					name = ((<connections> [<index>]).gamertag)
					net_id_first = ((<connections> [<index>]).user_id [0])
					net_id_second = ((<connections> [<index>]).user_id [1])
					controller_type = controller
					part = <part>
					career_earnings = <earnings>
					local_client = 0
					obj_id = -1
				}
			else
				netsessionfunc \{obj = party
					func = get_shared_data}
				formattext checksumname = player_data 'player_%d' d = ((<connections> [<index>]).party_id)
				if structurecontains structure = <party_shared_data> <player_data>
					getplayerinfo <info_index> part
					getplayerinfo <info_index> career_earnings
					if NOT (((<party_shared_data>.<player_data>).player_part = <part>))
						setplayerinfo <info_index> part = ((<party_shared_data>.<player_data>).player_part)
						setplayerinfo <info_index> career_earnings = ((<party_shared_data>.<player_data>).player_career_earnings)
						change \{need_to_refresh_player_slots = 1}
					elseif NOT (((<party_shared_data>.<player_data>).player_career_earnings = <career_earnings>))
						setplayerinfo <info_index> career_earnings = ((<party_shared_data>.<player_data>).player_career_earnings)
						change \{need_to_refresh_player_slots = 1}
					endif
				endif
			endif
		else
			is_net_player_in_struct {
				user_id_first = ((<connections> [<index>]).user_id [0])
				user_id_second = ((<connections> [<index>]).user_id [1])
				controller_index = ((<connections> [<index>]).controller_index)
			}
			if (<player_in_struct> = 1)
				getplayerinfo <info_index> controller
				if netsessionfunc func = iscontrolleringame params = {controller = <controller>}
					netsessionfunc \{obj = party
						func = get_shared_data}
					formattext checksumname = player_data 'player_%d' d = ((<connections> [<index>]).party_id)
					setplayerinfo <info_index> party_id = ((<connections> [<index>]).party_id)
					if structurecontains structure = <party_shared_data> <player_data>
						getplayerinfo <info_index> part
						get_controller_type controller_index = ((<connections> [<index>]).controller_index)
						if (<controller_type> = controller)
							<controller_type> = vocals
						endif
						if (<controller_type> != <part>)
							if NOT (<controller_type> = guitar && <part> = bass)
								<part> = <controller_type>
								setplayerinfo <info_index> part = <part>
								change \{need_to_refresh_player_slots = 1}
							endif
						endif
						if NOT (((<party_shared_data>.<player_data>).player_part = <part>))
							printf \{qs(0x387789dc)}
							get_savegame_from_controller controller = <controller>
							get_current_band_info
							getglobaltags <band_info> savegame = <savegame> param = career_earnings
							formattext checksumname = player_info 'player_%d' d = ((<connections> [<index>]).party_id)
							formattext checksumname = player_status 'player%d_status' d = <info_index>
							party_info = {}
							appendstruct {
								struct = party_info
								field = <player_info>
								params = {
									player_part = ($<player_status>.part)
									player_career_earnings = <career_earnings>
								}
							}
							netsessionfunc obj = party func = append_shared_data params = {data = <party_info>}
						endif
					else
						printf \{qs(0xde83dcfe)}
						get_savegame_from_controller controller = <controller>
						get_current_band_info
						getglobaltags <band_info> savegame = <savegame> param = career_earnings
						formattext checksumname = player_info 'player_%d' d = ((<connections> [<index>]).party_id)
						formattext checksumname = player_status 'player%d_status' d = <info_index>
						party_info = {}
						appendstruct {
							struct = party_info
							field = <player_info>
							params = {
								player_part = ($<player_status>.part)
								player_career_earnings = <career_earnings>
							}
						}
						netsessionfunc obj = party func = append_shared_data params = {data = <party_info>}
					endif
				endif
			endif
		endif
		<index> = (<index> + 1)
		repeat <connections_size>
	endif
	onlinelobbyinterface :gettags
	if screenelementexists id = <player_slots_menu_id>
		<player_slots_menu_id> :gettags
		getarraysize \{all_players_checksum}
		i = 0
		begin
		if (<all_players_checksum> [<i>] = remote)
			if (<connections_size> > 0)
				<index> = 0
				<found> = 0
				begin
				if ((<connections> [<index>]).is_local = 0)
					getplayerinfo (<i> + 1) net_id_first
					getplayerinfo (<i> + 1) net_id_second
					if ((((<connections> [<index>]).user_id [0]) = <net_id_first>) &&
							(((<connections> [<index>]).user_id [1]) = <net_id_second>))
						if isps3
							formattext checksumname = gamertag 'gamertag_%d' d = <i>
							if localizedstringequals a = ((<connections> [<index>]).gamertag) b = ($<gamertag>)
								<found> = 1
								break
							endif
						else
							<found> = 1
							break
						endif
					endif
				endif
				<index> = (<index> + 1)
				repeat <connections_size>
				if (<found> = 0)
					change_handle_signin_if_no_remotes
					add_remove_player_to_net_ui {
						action = remove
						ui_slot = <i>
						player_type = remote
					}
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if NOT netsessionfunc \{obj = party
			func = is_host}
		netsessionfunc \{obj = party
			func = get_shared_data}
		if structurecontains structure = <party_shared_data> game_mode
			netoptions :pref_choose name = game_modes index = (<party_shared_data>.game_mode)
			netoptions :pref_get \{name = game_modes}
			formattext textname = game_mode_text qs(0xed77b849) d = <display_string>
			if screenelementexists \{id = onlinelobbyinterface}
				onlinelobbyinterface :se_setprops {
					matchmaking_game_mode_text = <game_mode_text>
				}
			endif
		endif
	endif
endscript

script change_handle_signin_if_no_remotes 
	has_remote = 0
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize <connections>
	if (<array_size> > 0)
		i = 0
		begin
		if ((<connections> [<i>]).is_local = 0)
			<has_remote> = 1
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	if (<has_remote> = 0)
		change \{respond_to_signin_changed_all_players = 0}
	endif
endscript

script check_for_local_controller_change \{controller_index = -1}
	if onlinelobbyinterface :desc_resolvealias \{name = alias_player_slots_vmenu}
		if (<controller_index> = -1)
			printf \{qs(0x32764d51)}
			return
		endif
		<resolved_id> :gettags
		if (<state> = active)
			if (<local_controllers> [<controller_index>] = unplugged)
				if netsessionfunc \{obj = party
						func = is_host}
					if NOT party_is_full controller = <controller_index>
						if NOT (ui_slots_are_full)
							return \{change = 1}
						else
							return \{change = 0}
						endif
					else
						return \{change = 0}
					endif
				elseif netsessionfunc func = iscontrolleringame params = {controller = <controller_index>}
					return \{change = 1}
				else
					return \{change = 0}
				endif
			else
				return \{change = 0}
			endif
		elseif (<state> = inactive)
			if NOT (<local_controllers> [<controller_index>] = unplugged)
				return \{change = 1}
			else
				return \{change = 0}
			endif
		endif
	endif
endscript

script check_for_signin_signin_change \{controller_index = -1}
	if onlinelobbyinterface :desc_resolvealias \{name = alias_player_slots_vmenu}
		if (<controller_index> = -1)
			printf \{qs(0x32764d51)}
			return
		endif
		<resolved_id> :gettags
		get_controller_corresponding_ui_slot controller = <controller_index>
		if (<state> = signed_in)
			if (<all_players_checksum> [<ui_slot>] = local_not_signed_in)
				return \{change = 1}
			else
				return \{change = 0}
			endif
		elseif (<state> = signed_out)
			if (<all_players_checksum> [<ui_slot>] = local_signed_in)
				return \{change = 1}
			else
				return \{change = 0}
			endif
		endif
	endif
endscript

script add_remove_player_to_net_ui 
	if NOT screenelementexists \{id = onlinelobbyinterface}
		return
	endif
	onlinelobbyinterface :gettags
	if screenelementexists id = <player_slots_menu_id>
		<player_slots_menu_id> :gettags
		if (<action> = add)
			printf qs(0xd4bafb84) d = <player_type>
			if (<player_type> = local_signed_in || <player_type> = remote)
				players_to_add = 1
			else
				players_to_add = 0
			endif
			get_next_available_slot slot_type = <player_type>
			if (<available_slot> = -1)
				printf \{qs(0x2f5d1c34)}
				return
			endif
			<player_slots_menu_id> :gettags
			if (<player_type> = local_not_signed_in || <player_type> = local_signed_in)
				formattext checksumname = controller_status 'plugged_in_%d' d = <available_slot>
				if (-1 != <index>)
					setarrayelement arrayname = local_controllers index = <index> newvalue = <controller_status>
				else
					printf \{qs(0xd140ddc4)}
					printstruct <...>
					printscriptinfo \{qs(0xee7a58ed)}
					return
				endif
			endif
			setarrayelement arrayname = all_players_checksum index = <available_slot> newvalue = <player_type>
			<player_slots_menu_id> :settags {
				all_players_checksum = <all_players_checksum>
				local_controllers = <local_controllers>
				num_players_in_session = (<num_players_in_session> + <players_to_add>)
			}
			if (<player_type> = local_signed_in || <player_type> = remote)
				add_player_to_player_status_structs <...>
			endif
		elseif (<action> = remove)
			printf qs(0xc42a0a4d) d = <player_type>
			if (<player_type> = local_signed_in || <player_type> = remote)
				players_to_remove = 1
			else
				players_to_remove = 0
			endif
			if (<player_type> = local_not_signed_in || <player_type> = local_signed_in)
				if (-1 != <index>)
					setarrayelement arrayname = local_controllers index = <index> newvalue = unplugged
					setarrayelement arrayname = all_players_checksum index = <ui_slot> newvalue = empty
				else
					printf \{qs(0x07d124a8)}
					printstruct <...>
					return
				endif
			else
				setarrayelement arrayname = all_players_checksum index = <ui_slot> newvalue = empty
			endif
			<player_slots_menu_id> :settags {
				all_players_checksum = <all_players_checksum>
				local_controllers = <local_controllers>
				num_players_in_session = (<num_players_in_session> - <players_to_remove>)
			}
			remove_player_from_player_status_structs index = <ui_slot>
		elseif (<action> = replace)
			printf qs(0xa1c6e951) d = <player_type>
			get_controller_corresponding_ui_slot controller = <index>
			setarrayelement arrayname = local_controllers index = <index> newvalue = unplugged
			setarrayelement arrayname = all_players_checksum index = <ui_slot> newvalue = empty
			<player_slots_menu_id> :settags {
				all_players_checksum = <all_players_checksum>
				local_controllers = <local_controllers>
			}
			add_remove_player_to_net_ui action = add index = <index> player_type = <player_type>
			return
		endif
		change \{need_to_refresh_player_slots = 1}
	endif
endscript

script add_player_to_player_status_structs 
	formattext checksumname = player_status 'player%d_status' d = (<available_slot> + 1)
	if (<player_type> = local_signed_in)
		netsessionfunc obj = match func = get_gamertag params = {controller = <index>}
		getnetid controller_index = <index>
		get_controller_type controller_index = <index>
		change structurename = <player_status> controller = <index>
		local_client = 1
		obj_id = -1
		get_savegame_from_controller controller = <index>
		get_current_band_info
		getglobaltags <band_info> savegame = <savegame> param = career_earnings
		if NOT gotparam \{part}
			part = <controller_type>
			if (<part> = controller)
				<part> = vocals
			endif
		endif
	elseif (<player_type> = remote)
		change structurename = <player_status> controller = <index>
		local_client = 0
	endif
	formattext checksumname = gamertag 'gamertag_%d' d = <available_slot>
	change globalname = <gamertag> newvalue = <name>
	change structurename = <player_status> gamertag = <gamertag>
	change structurename = <player_status> net_id_first = <net_id_first>
	change structurename = <player_status> net_id_second = <net_id_second>
	change structurename = <player_status> controller_type = <controller_type>
	change structurename = <player_status> is_local_client = <local_client>
	change structurename = <player_status> net_obj_id = <obj_id>
	if gotparam \{part}
		change structurename = <player_status> part = <part>
	endif
	if gotparam \{career_earnings}
		change structurename = <player_status> career_earnings = <career_earnings>
	endif
endscript

script remove_player_from_player_status_structs 
	formattext checksumname = player_status 'player%d_status' d = (<index> + 1)
	change structurename = <player_status> net_id_first = 0
	change structurename = <player_status> net_id_second = 0
	change structurename = <player_status> is_local_client = 0
	change structurename = <player_status> net_obj_id = -1
	change structurename = <player_status> career_earnings = 0
	change structurename = <player_status> lefty_flip = 0
endscript

script get_next_available_slot 
	onlinelobbyinterface :gettags
	<player_slots_menu_id> :gettags
	slot = -1
	if (<slot_type> = local_not_signed_in)
		getarraysize \{all_players_checksum}
		i = 0
		begin
		if (<all_players_checksum> [<i>] = empty)
			<slot> = <i>
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	elseif (<slot_type> = remote)
		getarraysize \{all_players_checksum}
		i = 0
		begin
		if (<all_players_checksum> [<i>] = empty)
			<slot> = <i>
			break
		elseif (<all_players_checksum> [<i>] = local_not_signed_in)
			shift_player_slots starting_point = <i>
			<slot> = <i>
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	elseif (<slot_type> = local_signed_in)
		getarraysize \{all_players_checksum}
		i = 0
		begin
		if (<all_players_checksum> [<i>] = empty)
			<slot> = <i>
			break
		elseif (<all_players_checksum> [<i>] = remote)
			shift_player_slots starting_point = <i>
			<slot> = <i>
			break
		elseif (<all_players_checksum> [<i>] = local_not_signed_in)
			shift_player_slots starting_point = <i>
			<slot> = <i>
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return available_slot = <slot>
endscript

script shift_player_slots 
	onlinelobbyinterface :gettags
	<player_slots_menu_id> :gettags
	getarraysize \{all_players_checksum}
	i = <starting_point>
	shift_value_current = (<all_players_checksum> [<i>])
	shift_value_next = (<all_players_checksum> [(<i> + 1)])
	getplayerinfo (<i> + 1) net_id_first
	getplayerinfo (<i> + 1) net_id_second
	getplayerinfo (<i> + 1) controller
	getplayerinfo (<i> + 1) is_local_client
	getplayerinfo (<i> + 1) part
	getplayerinfo (<i> + 1) career_earnings
	getplayerinfo (<i> + 1) difficulty
	getplayerinfo (<i> + 1) lefty_flip
	getplayerinfo (<i> + 1) character_id
	getplayerinfo (<i> + 1) vocals_highway_view
	formattext checksumname = gamertag 'gamertag_%d' d = (<i>)
	current_net_info = {
		net_id_first = <net_id_first>
		net_id_second = <net_id_second>
		gamertag = ($<gamertag>)
		controller = <controller>
		is_local = <is_local_client>
		part = <part>
		earnings = <career_earnings>
		difficulty = <difficulty>
		lefty_flip = <lefty_flip>
		character_id = <character_id>
		vocals_highway_view = <vocals_highway_view>
	}
	formattext checksumname = gamertag 'gamertag_%d' d = (<i> + 1)
	getplayerinfo (<i> + 2) net_id_first
	getplayerinfo (<i> + 2) net_id_second
	getplayerinfo (<i> + 2) controller
	getplayerinfo (<i> + 2) is_local_client
	getplayerinfo (<i> + 2) part
	getplayerinfo (<i> + 2) career_earnings
	getplayerinfo (<i> + 2) difficulty
	getplayerinfo (<i> + 2) lefty_flip
	getplayerinfo (<i> + 2) character_id
	getplayerinfo (<i> + 2) vocals_highway_view
	next_net_info = {
		net_id_first = <net_id_first>
		net_id_second = <net_id_second>
		gamertag = ($<gamertag>)
		controller = <controller>
		is_local = <is_local_client>
		part = <part>
		earnings = <career_earnings>
		difficulty = <difficulty>
		lefty_flip = <lefty_flip>
		character_id = <character_id>
		vocals_highway_view = <vocals_highway_view>
	}
	get_ui_slot_corresponding_controller target_ui_slot = <i>
	if (<controller> = -1)
		controller_value = unplugged
	else
		controller_value = (<local_controllers> [<controller>])
	endif
	setarrayelement arrayname = all_players_checksum index = <i> newvalue = empty
	begin
	if NOT (<controller_value> = unplugged)
		formattext checksumname = controller_status 'plugged_in_%d' d = (<i> + 1)
		setarrayelement arrayname = local_controllers index = <controller> newvalue = <controller_status>
	endif
	setarrayelement arrayname = all_players_checksum index = (<i> + 1) newvalue = <shift_value_current>
	copy_net_info_into_struct destination_index = (<i> + 2) info = <current_net_info>
	if ((<i> + 2) = <array_size>)
		break
	endif
	current_net_info = {
		net_id_first = (<next_net_info>.net_id_first)
		net_id_second = (<next_net_info>.net_id_second)
		gamertag = (<next_net_info>.gamertag)
		controller = (<next_net_info>.controller)
		is_local = (<next_net_info>.is_local)
		part = (<next_net_info>.part)
		earnings = (<next_net_info>.earnings)
		difficulty = (<next_net_info>.difficulty)
		lefty_flip = (<next_net_info>.lefty_flip)
		character_id = (<next_net_info>.character_id)
		vocals_highway_view = (<next_net_info>.vocals_highway_view)
	}
	getplayerinfo (<i> + 3) net_id_first
	getplayerinfo (<i> + 3) net_id_second
	getplayerinfo (<i> + 3) controller
	getplayerinfo (<i> + 3) is_local_client
	getplayerinfo (<i> + 3) part
	getplayerinfo (<i> + 3) career_earnings
	getplayerinfo (<i> + 3) difficulty
	getplayerinfo (<i> + 3) lefty_flip
	getplayerinfo (<i> + 3) character_id
	getplayerinfo (<i> + 3) vocals_highway_view
	formattext checksumname = gamertag 'gamertag_%d' d = (<i> + 2)
	next_net_info = {
		net_id_first = <net_id_first>
		net_id_second = <net_id_second>
		gamertag = ($<gamertag>)
		controller = <controller>
		is_local = <is_local_client>
		part = <part>
		earnings = <career_earnings>
		difficulty = <difficulty>
		lefty_flip = <lefty_flip>
		character_id = <character_id>
		vocals_highway_view = <vocals_highway_view>
	}
	shift_value_current = <shift_value_next>
	shift_value_next = (<all_players_checksum> [(<i> + 2)])
	get_ui_slot_corresponding_controller target_ui_slot = (<i> + 1)
	if (<controller> = -1)
		controller_value = unplugged
	else
		controller_value = (<local_controllers> [<controller>])
	endif
	i = (<i> + 1)
	repeat <array_size>
	<player_slots_menu_id> :settags all_players_checksum = <all_players_checksum> local_controllers = <local_controllers>
endscript

script copy_net_info_into_struct 
	setplayerinfo <destination_index> net_id_first = (<info>.net_id_first)
	setplayerinfo <destination_index> net_id_second = (<info>.net_id_second)
	setplayerinfo <destination_index> controller = (<info>.controller)
	setplayerinfo <destination_index> is_local_client = (<info>.is_local)
	setplayerinfo <destination_index> part = (<info>.part)
	setplayerinfo <destination_index> career_earnings = (<info>.earnings)
	setplayerinfo <destination_index> difficulty = (<info>.difficulty)
	setplayerinfo <destination_index> lefty_flip = (<info>.lefty_flip)
	setplayerinfo <destination_index> lefthanded_gems = (<info>.lefty_flip)
	setplayerinfo <destination_index> lefthanded_button_ups = (<info>.lefty_flip)
	setplayerinfo <destination_index> lefthanded_button_ups_flip_save = (<info>.lefty_flip)
	setplayerinfo <destination_index> lefthanded_gems_flip_save = (<info>.lefty_flip)
	setplayerinfo <destination_index> character_id = (<info>.character_id)
	setplayerinfo <destination_index> vocals_highway_view = (<info>.vocals_highway_view)
	formattext checksumname = gamertag 'gamertag_%d' d = (<destination_index> -1)
	change globalname = <gamertag> newvalue = (<info>.gamertag)
	monitorcontrollerstates
endscript

script get_controller_corresponding_ui_slot 
	onlinelobbyinterface :gettags
	<player_slots_menu_id> :gettags
	switch (<local_controllers> [<controller>])
		case plugged_in_0
		return \{ui_slot = 0}
		case plugged_in_1
		return \{ui_slot = 1}
		case plugged_in_2
		return \{ui_slot = 2}
		case plugged_in_3
		return \{ui_slot = 3}
		case plugged_in_4
		return \{ui_slot = 4}
		case plugged_in_5
		return \{ui_slot = 5}
		case plugged_in_6
		return \{ui_slot = 6}
		case plugged_in_7
		return \{ui_slot = 7}
		default
		return \{ui_slot = -1}
	endswitch
endscript

script get_ui_slot_corresponding_controller 
	onlinelobbyinterface :gettags
	<player_slots_menu_id> :gettags
	getarraysize \{local_controllers}
	controller = 0
	begin
	get_controller_corresponding_ui_slot controller = <controller>
	if (<ui_slot> = <target_ui_slot>)
		return controller = <controller>
	endif
	controller = (<controller> + 1)
	repeat <array_size>
	return \{controller = -1}
endscript

script leave_net_main_menu 
	requireparams \{[
			device_num
		]
		all}
	if netsessionfunc \{obj = party
			func = is_host}
		if (<device_num> = $primary_controller)
			netsessionfunc \{obj = party
				func = get_party_members}
			has_remote = 0
			getarraysize <connections>
			if (<array_size> > 0)
				i = 0
				begin
				if ((<connections> [<i>]).is_local = 0)
					<has_remote> = 1
					break
				endif
				<i> = (<i> + 1)
				repeat <array_size>
			endif
			if (<has_remote> = 1)
				if gotparam \{id}
					launchevent type = unfocus target = <id>
				endif
				generic_event_choose \{state = uistate_online_quit_warning
					data = {
						is_popup
						confirm_script = matchmaking_host_disband_party
					}}
			else
				generic_event_back \{state = uistate_mainmenu}
			endif
		else
			netsessionfunc func = removecontroller params = {controller = <device_num>}
			change \{need_to_refresh_player_slots = 1}
		endif
	else
		if (<device_num> = $primary_controller)
			if gotparam \{id}
				launchevent type = unfocus target = <id>
			endif
			generic_event_choose \{state = uistate_online_quit_warning
				data = {
					is_popup
					confirm_script = matchmaking_leave_party_confirm
				}}
		endif
	endif
endscript

script matchmaking_leave_party_confirm 
	printf \{qs(0x02e0ff4d)}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if is_ui_event_running
		return
	endif
	netsessionfunc \{obj = party
		func = leave_party}
	net_clear_all_remote_player_status
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :obj_spawnscriptlater \{refresh_online_lobby}
	endif
	generic_event_back
endscript

script refresh_online_lobby 
	wait \{10
		gameframes}
	printf \{qs(0xda926fa0)}
	ui_event_wait \{event = menu_refresh}
endscript

script matchmaking_host_disband_party 
	printf \{qs(0xafd082fe)}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if is_ui_event_running
		return
	endif
	netsessionfunc \{obj = party
		func = disband_party_session}
	net_clear_all_remote_player_status
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :obj_spawnscriptlater \{refresh_online_lobby}
	endif
	generic_event_back
endscript

script create_start_matchmaking_container 
	destroy_popup_warning_menu
	create_popup_warning_menu \{title = qs(0xddccf0c3)
		textblock = {
			text = qs(0x00000000)
		}
		parent = onlinelobbyinterface
		no_background
		options = [
			{
				func = cancel_start_matchmaking
				text = qs(0xf7723015)
			}
		]}
	createscreenelement \{type = spriteelement
		parent = popupelement
		texture = online_load_wheel_bg
		pos = (960.0, 600.0)
		dims = (128.0, 128.0)
		just = [
			center
			center
		]
		z_priority = 520}
	createscreenelement \{type = spriteelement
		parent = popupelement
		texture = online_load_wheel
		pos = (960.0, 600.0)
		dims = (128.0, 128.0)
		just = [
			center
			center
		]
		z_priority = 521}
	popupelement :obj_spawnscriptnow animate_online_icon params = {id = <id>}
	popupelement :obj_spawnscriptnow \{update_players_found}
	netsessionfunc \{obj = party
		func = append_shared_data
		params = {
			data = {
				matchmaking = 1
			}
		}}
endscript

script client_create_start_matchmaking_container 
	ui_event_get_top
	if (<base_name> = 'online_quit_warning')
		ui_event_block \{event = menu_back}
	endif
	launchevent \{type = unfocus
		target = current_menu}
	destroy_popup_warning_menu
	create_popup_warning_menu \{title = qs(0xddccf0c3)
		textblock = {
			text = qs(0x00000000)
		}
		parent = onlinelobbyinterface
		no_background}
	createscreenelement \{type = spriteelement
		parent = popupelement
		texture = online_load_wheel_bg
		pos = (960.0, 600.0)
		dims = (128.0, 128.0)
		just = [
			center
			center
		]
		z_priority = 520}
	createscreenelement \{type = spriteelement
		parent = popupelement
		texture = online_load_wheel
		pos = (960.0, 600.0)
		dims = (128.0, 128.0)
		just = [
			center
			center
		]
		z_priority = 521}
	popupelement :obj_spawnscriptnow animate_online_icon params = {id = <id>}
	popupelement :obj_spawnscriptnow client_check_for_cancel_matchmaking params = {id = <id>}
endscript

script client_check_for_cancel_matchmaking 
	change \{respond_to_signin_changed_all_players = 1}
	players_found = 0
	begin
	netsessionfunc \{obj = match
		func = get_num_matchmaking_players}
	netsessionfunc \{obj = party
		func = get_party_members}
	netsessionfunc \{obj = party
		func = get_shared_data}
	getarraysize <connections>
	if structurecontains structure = <party_shared_data> matchmaking
		if (<party_shared_data>.matchmaking = 0)
			destroy_searching_ui
			change \{respond_to_signin_changed_all_players = 0}
			if screenelementexists \{id = onlinelobbyinterface}
				onlinelobbyinterface :gettags
				if screenelementexists id = <player_slots_menu_id>
					<player_slots_menu_id> :obj_spawnscriptlater update_player_slots_ui
				endif
			endif
			online_lobby_setup_helper_controls
			launchevent \{type = focus
				target = current_menu}
			break
		endif
	endif
	if gotparam \{num_matchmaking_players}
		<players_found> = (<num_matchmaking_players> - <array_size>)
		if (<players_found> < 0)
			<players_found> = 0
		endif
	else
		<players_found> = 0
	endif
	if (<players_found> = 0)
		message = qs(0xbb856970)
	else
		formattext textname = message qs(0x18cc19f0) d = <players_found>
	endif
	if screenelementexists \{id = popupelement}
		popupelement :setprops {
			popupbody_text = <message>
		}
	endif
	if scriptisrunning \{set_net_ui_to_finished_searching}
		destroy_searching_ui
		break
	endif
	wait \{1.0
		seconds}
	repeat
endscript

script cancel_start_matchmaking 
	if netsessionfunc \{obj = match
			func = cancel_join_server}
		netsessionfunc \{obj = party
			func = set_party_joinable
			params = {
				joinable = 1
			}}
		change \{net_new_matchmaking_ui_flag = 0}
		change \{respond_to_signin_changed_all_players = 0}
		onlinelobbyinterface :gettags
		<player_slots_menu_id> :obj_spawnscriptlater update_player_slots_ui
		netsessionfunc \{obj = party
			func = append_shared_data
			params = {
				data = {
					matchmaking = 0
				}
			}}
		destroy_searching_ui
		online_lobby_setup_helper_controls
		change \{net_starting_matchmaking = 0}
		launchevent \{type = focus
			target = current_menu}
	endif
endscript

script destroy_searching_ui 
	destroy_popup_warning_menu
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
endscript

script update_players_found 
	players_found = 0
	<time_waited> = 0
	begin
	netsessionfunc \{obj = match
		func = get_num_matchmaking_players}
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize <connections>
	if (<time_waited> >= 45)
		if gotparam \{num_matchmaking_players}
			if (<array_size> >= <num_matchmaking_players>)
				gamemode_getminplayers
				if (<min_players> > <num_matchmaking_players>)
					create_confirm_search_again
					break
				endif
			endif
		endif
	endif
	if gotparam \{num_matchmaking_players}
		<players_found> = (<num_matchmaking_players> - <array_size>)
		if (<players_found> < 0)
			<players_found> = 0
		endif
	else
		<players_found> = 0
	endif
	if (<players_found> = 0)
		message = qs(0xbb856970)
	else
		formattext textname = message qs(0x18cc19f0) d = <players_found>
	endif
	if screenelementexists \{id = popupelement}
		popupelement :setprops {
			popupbody_text = <message>
		}
	endif
	wait \{1.0
		seconds}
	<time_waited> = (<time_waited> + 1.0)
	repeat
endscript

script create_confirm_search_again 
	destroy_searching_ui
	create_popup_warning_menu \{title = qs(0x3954a4af)
		textblock = {
			text = qs(0x54edfd91)
		}
		parent = current_menu
		no_background
		options = [
			{
				func = continue_matchmaking_search
				text = qs(0x182f0173)
			}
			{
				func = cancel_start_matchmaking
				text = qs(0x6683b73b)
			}
		]}
endscript

script continue_matchmaking_search 
	destroy_popup_warning_menu
	create_start_matchmaking_container
endscript

script create_signin_container 
	createscreenelement \{type = containerelement
		parent = onlinelobbyinterface
		id = online_lobby_signin_container
		event_handlers = [
			{
				pad_choose
				signin_or_join_game
			}
		]}
	update_signed_in_controllers
	launchevent \{type = focus
		target = online_lobby_signin_container}
endscript

script update_signed_in_controllers 
	printf \{qs(0xb0cba5b5)}
	if screenelementexists \{id = onlinelobbyinterface}
		if screenelementexists \{id = online_lobby_signin_container}
			non_signed_in_controllers = []
			signed_in_controllers = []
			getactivecontrollers
			getarraysize <active_controllers>
			i = 0
			begin
			if (<active_controllers> [<i>] = 1)
				if NOT checkforsignin controller_index = <i> dont_set_primary
					addarrayelement array = <non_signed_in_controllers> element = <i>
					<non_signed_in_controllers> = <array>
				elseif NOT netsessionfunc func = iscontrolleringame params = {controller = <i>}
					addarrayelement array = <non_signed_in_controllers> element = <i>
					<non_signed_in_controllers> = <array>
				else
					addarrayelement array = <signed_in_controllers> element = <i>
					<signed_in_controllers> = <array>
				endif
			else
				addarrayelement array = <non_signed_in_controllers> element = <i>
				<non_signed_in_controllers> = <array>
			endif
			<i> = (<i> + 1)
			repeat <array_size>
			addarrayelement array = <non_signed_in_controllers> element = <i>
			<non_signed_in_controllers> = <array>
			online_lobby_signin_container :se_setprops {exclusive_device = <non_signed_in_controllers>}
			getarraysize <non_signed_in_controllers>
		endif
		if onlinelobbyinterface :desc_resolvealias \{name = alias_matchmaking_vmenu}
			<resolved_id> :se_setprops {exclusive_device = <signed_in_controllers>}
		endif
		if onlinelobbyinterface :desc_resolvealias \{name = alias_player_slots_vmenu}
			<resolved_id> :se_setprops {exclusive_device = <signed_in_controllers>}
		endif
	endif
endscript

script signin_or_join_game 
	printf \{qs(0xab5ccbec)}
	requireparams \{[
			device_num
		]
		all}
	if netsessionfunc \{obj = party
			func = is_host}
		if ($net_starting_matchmaking = 0)
			change \{net_block_matchmaking = 1}
			if NOT (party_is_full)
				if isxenon
					if NOT checkforsignin controller_index = <device_num> dont_set_primary
						generic_menu_pad_choose_sound
						if onlinelobbyinterface :desc_resolvealias \{name = alias_player_slots_vmenu
								param = player_slots_menu}
							<player_slots_menu> :obj_killspawnedscript name = update_player_slots_ui
						endif
						if checkforsignin local controller controller_index = <device_num>
							netsessionfunc \{func = showsigninui
								params = {
									convert_offline_to_guest
								}}
						else
							netsessionfunc \{func = showsigninui4pane
								params = {
									online_only
								}}
						endif
						wait_for_blade_complete
						wait \{1.0
							seconds}
						if onlinelobbyinterface :desc_resolvealias \{name = alias_player_slots_vmenu
								param = player_slots_menu}
							<player_slots_menu> :obj_spawnscriptnow update_player_slots_ui
						endif
					else
						generic_menu_pad_choose_sound
						if can_add_vocals_player device_num = <device_num>
							netsessionfunc func = addcontrollers params = {controller = <device_num>}
							if NOT netsessionfunc func = xenonisguest params = {controller_index = <device_num>}
								net_clear_all_remote_player_status
								generic_event_replace no_sound state = uistate_signin data = {device_num = <device_num> allow_back = 0 new_state = uistate_online primary = 0}
							else
								if isscreenelementinfocus \{id = current_menu}
									online_lobby_setup_helper_controls
								else
									online_lobby_setup_helper_controls \{menu_type = right_hand}
								endif
								change \{need_to_refresh_player_slots = 1}
							endif
						else
							create_vocals_warning
						endif
					endif
				else
					if can_add_vocals_player device_num = <device_num>
						netsessionfunc func = addcontrollers params = {controller = <device_num>}
						restore_save_net_preferences controller_index = <device_num>
						if isscreenelementinfocus \{id = current_menu}
							online_lobby_setup_helper_controls
						else
							online_lobby_setup_helper_controls \{menu_type = right_hand}
						endif
						change \{need_to_refresh_player_slots = 1}
					else
						create_vocals_warning
					endif
				endif
			endif
		endif
	endif
endscript

script can_add_vocals_player 
	already_has_vocals = 0
	get_controller_type controller_index = <device_num>
	if NOT (<controller_type> = vocals || <controller_type> = controller)
		return \{true}
	endif
	getactivecontrollers
	getarraysize <active_controllers>
	i = 0
	begin
	if (<active_controllers> [<i>] = 1)
		if netsessionfunc func = iscontrolleringame params = {controller = <i>}
			get_controller_type controller_index = <i>
			if (<controller_type> = vocals || <controller_type> = controller)
				<already_has_vocals> = 1
				break
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if (<already_has_vocals> = 0)
		if ismicrophonepluggedin \{number = 0}
			return \{true}
		elseif ismicrophonepluggedin \{number = 1}
			return \{true}
		elseif controller_has_headset controller = <device_num>
			return \{true}
		endif
	endif
	return \{false}
endscript

script create_vocals_warning 
	if ($net_no_focus_warning = 0)
		if isps3
			popup_text = qs(0x1fe26012)
		else
			popup_text = qs(0x396e303f)
		endif
		destroy_popup_warning_menu
		create_popup_warning_menu {
			title = qs(0xaa163738)
			textblock = {
				text = <popup_text>
			}
			no_background
			no_helpers
		}
		set_focus_color rgba = ($online_lobby_item_text_color)
		set_unfocus_color rgba = ($online_lobby_item_text_color)
		if screenelementexists \{id = popupelement}
			popupelement :obj_spawnscriptnow \{wait_and_kill_vocals_warning_popup}
		endif
	endif
endscript

script wait_and_kill_vocals_warning_popup 
	wait \{3.0
		seconds}
	destroy_net_popup
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
endscript

script start_matchmaking 
	printf \{qs(0x14c9ca0a)}
	if ($net_starting_matchmaking = 1)
		return
	endif
	change \{respond_to_signin_changed_all_players = 1}
	requireparams \{[
			device_num
		]
		all}
	if (<device_num> = $primary_controller)
		if all_clients_are_ready
			if vocalist_has_mic
				if is_valid_instrument_config
					if checkforsignin controller_index = <device_num>
						can_continue = 1
						if ($is_multiplayer_beta = 1)
							getcontrollertype controller = <device_num>
							if checksumequals a = guitar b = <controller_type>
							else
								printf \{qs(0x17ce1c7d)}
								can_continue = 0
							endif
						endif
						if (<can_continue> = 1)
							change \{net_starting_matchmaking = 1}
							netsessionfunc \{obj = party
								func = set_party_joinable
								params = {
									joinable = 0
								}}
							begin
							if ($net_block_matchmaking = 0)
								break
							endif
							wait \{1
								gameframe}
							repeat
							destroy_online_warning_message
							if isps3
								destroy_ps3_chat_warning_message
							endif
							netoptions :pref_get \{name = game_modes}
							if (<checksum> = p2_battle)
								get_player_num_from_controller controller_index = ($primary_controller)
								if (<player_num> != -1)
									getplayerinfo <player_num> difficulty
									if (<difficulty> = easy_rhythm)
										checksum = easy
										setplayerinfo <player_num> difficulty = <checksum>
									endif
								endif
							endif
							ui_menu_select_sfx
							set_net_ui_to_searching
							clear_temp_net_id_array
							setup_temp_net_id_array
							change \{net_new_matchmaking_ui_flag = 1}
							change \{net_num_player_settings_ack = 0}
							set_network_preferences
							net_dummy_get_needed_search_params
							netsessionfunc obj = match func = set_search_params params = <...>
							netsessionfunc \{obj = match
								func = set_server_list_mode
								params = {
									automatch
								}}
							netsessionfunc {
								obj = match
								func = start_server_list
								params = {
									callback = xboxlive_menu_optimatch_results_item_add
									callback_complete = xboxlive_menu_optimatch_results_stop
									controller = <device_num>
								}
							}
							setservermode
							startserver
							setjoinmode \{$join_mode_play}
							joinserver
						else
							menu_scroll_end_sound
						endif
					else
						menu_scroll_end_sound
					endif
				else
					menu_scroll_end_sound
					create_intrument_config_warning
				endif
			else
				menu_scroll_end_sound
				create_microphone_warning
			endif
		endif
	else
		menu_scroll_end_sound
	endif
endscript

script all_clients_are_ready 
	all_clients_are_ready = 1
	netsessionfunc \{obj = party
		func = get_party_members}
	netsessionfunc \{obj = party
		func = get_shared_data}
	getarraysize <connections>
	if (<array_size> > 0)
		index = 0
		begin
		formattext checksumname = player_data 'player_%d' d = ((<connections> [<index>]).party_id)
		if NOT structurecontains structure = <party_shared_data> <player_data>
			<all_clients_are_ready> = 0
			break
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	if (<all_clients_are_ready> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script setup_temp_net_id_array 
	getactivecontrollers
	getarraysize <active_controllers>
	i = 0
	begin
	if netsessionfunc func = iscontrolleringame params = {controller = <i>}
		getnetid controller_index = (<i>)
		netsessionfunc func = get_gamertag params = {controller = <i>}
		setarrayelement arrayname = temp_net_id globalarray index = <i> newvalue = {net_id_first = <net_id_first> net_id_second = <net_id_second> name = <name>}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script vocalist_has_mic 
	found_vocalist = 0
	getactivecontrollers
	getarraysize <active_controllers>
	i = 0
	begin
	if (<active_controllers> [<i>] = 1)
		if netsessionfunc func = iscontrolleringame params = {controller = <i>}
			get_controller_type controller_index = <i>
			if (<controller_type> = vocals || <controller_type> = controller)
				<found_vocalist> = 1
				if ismicrophonepluggedin \{number = 0}
					vocals_distribute_mics
					return \{true}
				elseif ismicrophonepluggedin \{number = 1}
					vocals_distribute_mics
					return \{true}
				elseif controller_has_headset controller = <i>
					vocals_distribute_mics
					return \{true}
				endif
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if (<found_vocalist> = 1)
		return \{false}
	else
		return \{true}
	endif
endscript

script create_microphone_warning 
	change \{net_no_focus_warning = 1}
	launchevent \{type = unfocus
		target = current_menu}
	if isps3
		popup_text = qs(0xe2f3f704)
	else
		popup_text = qs(0xec4dbd17)
	endif
	create_net_popup title = qs(0xaa163738) popup_text = <popup_text>
	if screenelementexists \{id = popupelement}
		popupelement :obj_spawnscriptnow \{wait_and_kill_config_warning_popup}
	endif
endscript

script is_valid_instrument_config 
	printf \{qs(0x5f460716)}
	num_bass = 0
	num_guitars = 0
	num_drums = 0
	num_mics = 0
	num_local_bass = 0
	num_local_guitars = 0
	num_local_drums = 0
	num_local_mics = 0
	num_local_players = 0
	num_players = 0
	netsessionfunc \{obj = party
		func = get_party_members}
	netsessionfunc \{obj = party
		func = get_shared_data}
	netoptions :pref_getstruct \{name = game_modes}
	search_mode = (<pref_struct>.search_chk)
	getarraysize <connections>
	if (<array_size> > 0)
		num_players = <array_size>
		index = 0
		begin
		if ((<connections> [<index>]).is_local = 1)
			<num_local_players> = (<num_local_players> + 1)
		endif
		formattext checksumname = player_data 'player_%d' d = ((<connections> [<index>]).party_id)
		if structurecontains structure = <party_shared_data> <player_data>
			part = ((<party_shared_data>.<player_data>).player_part)
		else
			switch ((<connections> [<index>]).instrument)
				case eguitar
				part = guitar
				case emicrophone
				part = vocals
				case edrums
				part = drum
				default
				part = guitar
			endswitch
		endif
		if ((<connections> [<index>]).is_local = 1)
			get_controller_type controller_index = ((<connections> [<index>]).controller_index)
			if (<controller_type> != <part> && <controller_type> != controller)
				if NOT (<controller_type> = guitar && <part> = bass)
					<part> = <controller_type>
				endif
			endif
		endif
		switch (<part>)
			case bass
			<num_bass> = (<num_bass> + 1)
			if ((<connections> [<index>]).is_local = 1)
				<num_local_bass> = (<num_local_bass> + 1)
			endif
			<num_guitars> = (<num_guitars> + 1)
			if ((<connections> [<index>]).is_local = 1)
				<num_local_guitars> = (<num_local_guitars> + 1)
			endif
			case guitar
			<num_guitars> = (<num_guitars> + 1)
			if ((<connections> [<index>]).is_local = 1)
				<num_local_guitars> = (<num_local_guitars> + 1)
			endif
			case drum
			<num_drums> = (<num_drums> + 1)
			if ((<connections> [<index>]).is_local = 1)
				<num_local_drums> = (<num_local_drums> + 1)
			endif
			case vocals
			<num_mics> = (<num_mics> + 1)
			if ((<connections> [<index>]).is_local = 1)
				<num_local_mics> = (<num_local_mics> + 1)
			endif
		endswitch
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	if ((<num_guitars> > 4) || (<num_drums> > 2) || (<num_mics> > 2) ||
			(<num_local_guitars> > 2) || (<num_local_drums> > 1) || (<num_local_mics> > 1))
		return \{false}
	endif
	switch (<search_mode>)
		case p2_battle
		if (<num_local_players> = 1)
			if (<num_players> <= 2 && <num_drums> = 0 && <num_mics> = 0 && <num_bass> = 0)
				return \{true}
			endif
		endif
		case p2_faceoff
		case p2_pro_faceoff
		if (<num_local_players> = 1 && <num_players> <= 2)
			if (<num_guitars> != 0 && <num_mics> = 0 && <num_drums> = 0 && <num_bass> = 0)
				return \{true}
			endif
		endif
		case p2_pro_faceoff_bass
		case p2_faceoff_bass
		if (<num_local_players> = 1 && <num_mics> = 0 && <num_drums> = 0 && <num_bass> > 0)
			if (<num_players> = 1 && <num_local_bass> = 1)
				return \{true}
			elseif (<num_players> = 2 && <num_local_bass> = 1 && <num_bass> = 2)
				return \{true}
			endif
		endif
		case p4_pro_faceoff
		if (<num_local_players> <= 2 && <num_players> <= 4 && <num_mics> = 0 && <num_drums> = 0 && <num_guitars> > 0)
			return \{true}
		endif
		case p2_coop
		if (<num_local_players> = 1 && <num_mics> = 0 && <num_drums> = 0 && <num_players> <= 2)
			return \{true}
		endif
		case p4_quickplay
		if (<num_local_players> < 4 && <num_players> <= 4)
			if (<num_guitars> <= 2 && <num_drums> <= 1 && <num_mics> <= 1)
				return \{true}
			endif
		endif
		case p2_pro_faceoff_drums
		case mode_extra_1
		if (<num_local_players> = 1 && <num_mics> = 0 && <num_guitars> = 0)
			if (<num_players> = 1 && <num_local_drums> = 1)
				return \{true}
			elseif (<num_players> = 2 && <num_local_drums> = 1 && <num_drums> = 2)
				return \{true}
			endif
		endif
		case p8_pro_faceoff
		return \{true}
		case p2_career
		return \{false}
		default
		return \{false}
	endswitch
	return \{false}
endscript

script create_intrument_config_warning 
	change \{net_no_focus_warning = 1}
	launchevent \{type = unfocus
		target = current_menu}
	create_net_popup \{title = qs(0xaa163738)
		popup_text = qs(0x2d14c74a)}
	if screenelementexists \{id = popupelement}
		popupelement :obj_spawnscriptnow \{wait_and_kill_config_warning_popup}
	endif
endscript

script wait_and_kill_config_warning_popup 
	wait \{3.0
		seconds}
	destroy_net_popup
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
	online_lobby_setup_helper_controls
	change \{net_no_focus_warning = 0}
	launchevent \{type = focus
		target = current_menu}
endscript

script net_quick_create 
	printf \{qs(0xeed4fc3d)}
	requireparams \{[
			device_num
		]
		all}
	if (<device_num> = $primary_controller)
		if checkforsignin controller_index = <device_num>
			can_continue = 1
			if ($is_multiplayer_beta = 1)
				getcontrollertype controller = <device_num>
				if checksumequals a = guitar b = <controller_type>
				else
					printf \{qs(0x17ce1c7d)}
					can_continue = 0
				endif
			endif
			if (<can_continue> = 1)
				netsessionfunc \{obj = party
					func = set_party_joinable
					params = {
						joinable = 0
					}}
				destroy_online_warning_message
				if isps3
					destroy_ps3_chat_warning_message
				endif
				ui_menu_select_sfx
				set_net_ui_to_searching
				change \{net_new_matchmaking_ui_flag = 1}
				change \{net_num_player_settings_ack = 0}
				set_network_preferences
				net_dummy_get_needed_search_params
				netsessionfunc obj = match func = set_search_params params = <...>
				netsessionfunc \{obj = match
					func = set_server_list_mode
					params = {
						host_only
					}}
				netsessionfunc {
					obj = match
					func = start_server_list
					params = {
						callback = xboxlive_menu_optimatch_results_item_add
						callback_complete = xboxlive_menu_optimatch_results_stop
						controller = <device_num>
					}
				}
				if NOT cd
					net_create_matchmaking_status_window
				endif
				setservermode
				startserver
				setjoinmode \{$join_mode_play}
				joinserver
			else
				menu_scroll_end_sound
			endif
		else
			menu_scroll_end_sound
		endif
	else
		menu_scroll_end_sound
	endif
endscript

script net_custom_search 
	generic_event_choose state = uistate_net_custom_search data = {device_num = <device_num>}
endscript

script set_net_ui_to_searching 
	onlinelobbyinterface :gettags
	launchevent \{type = unfocus
		target = current_menu}
	create_start_matchmaking_container
	<player_slots_menu_id> :obj_killspawnedscript name = update_player_slots_ui
	remove_locals_not_ingame
	<player_slots_menu_id> :gettags
	getarraysize \{all_players_checksum}
	i = 0
	begin
	if (<all_players_checksum> [<i>] = empty)
		if ((<i> + 1) = <array_size>)
			printf qs(0xb065622b) m = <i> d = <j>
			break
		endif
		j = (<i> + 1)
		second_loop = (<array_size> - <j>)
		begin
		if (<all_players_checksum> [<j>] = local_signed_in)
			get_ui_slot_corresponding_controller target_ui_slot = <j>
			getplayerinfo (<j> + 1) part
			getplayerinfo (<j> + 1) difficulty
			getplayerinfo (<j> + 1) lefty_flip
			getplayerinfo (<j> + 1) character_id
			getplayerinfo (<j> + 1) vocals_highway_view
			add_remove_player_to_net_ui action = remove ui_slot = <j> index = <controller> player_type = local_signed_in
			add_remove_player_to_net_ui action = add index = <controller> player_type = local_signed_in part = <part>
			get_controller_corresponding_ui_slot controller = <controller>
			if (<ui_slot> != -1)
				setplayerinfo (<ui_slot> + 1) difficulty = <difficulty>
				setplayerinfo (<ui_slot> + 1) lefty_flip = <lefty_flip>
				setplayerinfo (<ui_slot> + 1) character_id = <character_id>
				setplayerinfo (<ui_slot> + 1) vocals_highway_view = <vocals_highway_view>
			endif
			<player_slots_menu_id> :getsingletag all_players_checksum
			break
		endif
		j = (<j> + 1)
		repeat <second_loop>
	endif
	i = (<i> + 1)
	repeat <array_size>
	remove_empty_slots_from_status_structs
	refresh_player_slots_ui
	set_net_dialog_message \{msg_checksum = start_matchmaking}
endscript

script remove_locals_not_ingame 
	onlinelobbyinterface :gettags
	<player_slots_menu_id> :gettags
	getarraysize \{all_players_checksum}
	i = 0
	begin
	if (<all_players_checksum> [<i>] = local_not_signed_in)
		get_ui_slot_corresponding_controller target_ui_slot = <i>
		add_remove_player_to_net_ui action = remove ui_slot = <i> index = <controller> player_type = local_not_signed_in
		if gotparam \{one_player}
			return
		endif
	elseif (<all_players_checksum> [<i>] = local_signed_in)
		get_ui_slot_corresponding_controller target_ui_slot = <i>
		if NOT netsessionfunc func = iscontrolleringame params = {controller = <controller>}
			add_remove_player_to_net_ui action = remove ui_slot = <i> index = <controller> player_type = local_signed_in
			if gotparam \{one_player}
				return
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script remove_empty_slots_from_status_structs 
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :gettags
		<player_slots_menu_id> :gettags
		getarraysize \{all_players_checksum}
		i = 0
		begin
		if (<all_players_checksum> [<i>] = empty)
			formattext checksumname = player_status 'player%d_status' d = (<i> + 1)
			change structurename = <player_status> is_local_client = 0
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script set_net_ui_to_finished_searching 
	printf \{qs(0x385807d3)}
	if screenelementexists \{id = onlinelobbyinterface}
		spawn_player_drop_listeners \{drop_player_script = matchmaking_countdown_drop_player_script
			end_game_script = matchmaking_countdown_end_game_script}
		destroy_searching_ui
		sent_settings_sync = 0
		set_ui_to_final_player_slots
		change \{online_song_choice_id = 0}
		index = ($online_to_setlist_count)
		begin
		formattext textname = timer_msg qs(0xbd40792a) d = <index>
		if screenelementexists \{id = onlinelobbyinterface}
			onlinelobbyinterface :se_setprops matchmaking_info_text = (<timer_msg>)
		endif
		if (<index> = 5)
			onlinelobbyinterface :settags \{toggle_allowed = 0}
			set_ui_to_final_player_slots \{locked}
		elseif (<index> < 5 && (<sent_settings_sync> = 0))
			<sent_settings_sync> = 1
			host_start_player_settings_sync
		endif
		if (<index> = 0)
			break
		endif
		index = (<index> - 1)
		wait \{1
			second}
		repeat
		if NOT ($net_match_dlc_sync_finished = 1)
			if isps3
				title = qs(0xe60e3e4a)
			else
				title = qs(0x2725b21f)
			endif
			destroy_popup_warning_menu
			create_popup_warning_menu {
				title = <title>
				title_props = {scale = 1.0}
				textblock = {
					text = qs(0x1fb396f2)
					pos = (640.0, 380.0)
				}
				no_background
			}
			createscreenelement \{type = spriteelement
				parent = popupelement
				texture = online_load_wheel_bg
				pos = (960.0, 600.0)
				dims = (128.0, 128.0)
				just = [
					center
					center
				]
				z_priority = 520}
			createscreenelement \{type = spriteelement
				parent = popupelement
				texture = online_load_wheel
				pos = (960.0, 600.0)
				dims = (128.0, 128.0)
				just = [
					center
					center
				]
				z_priority = 521}
			popupelement :obj_spawnscriptnow animate_online_icon params = {id = <id>}
			wait_time = 0
			begin
			if ($net_match_dlc_sync_finished = 1)
				break
			elseif (<wait_time> > 15)
				killspawnedscript \{name = net_match_send_available_items}
				break
			endif
			<wait_time> = (<wait_time> + 1)
			wait \{1.0
				seconds}
			repeat
			destroy_popup_warning_menu
		endif
		ui_event_get_top
		if gotparam \{is_popup}
			generic_event_replace \{state = uistate_setlist
				data = {
					no_jamsession
				}}
		else
			generic_event_choose \{state = uistate_setlist
				data = {
					no_jamsession
				}}
		endif
	else
		printf \{qs(0xb8033e72)}
	endif
endscript

script lock_player_parts 
	printf \{qs(0x861fd6e0)}
	if ishost
		gamemode_getnumplayers
		index = 1
		num_bass = [0 0]
		num_guitar = [0 0]
		begin
		getplayerinfo <index> part
		getplayerinfo <index> team
		if (<part> = guitar || <part> = bass)
			if (<part> = guitar)
				setarrayelement arrayname = num_guitar index = <team> newvalue = (<num_guitar> [<team>] + 1)
				if (<num_guitar> [<team>] > 1)
					setplayerinfo <index> part = bass
				else
					setplayerinfo <index> part = guitar
				endif
			elseif (<part> = bass)
				setarrayelement arrayname = num_bass index = <team> newvalue = (<num_bass> [<team>] + 1)
				if (<num_bass> [<team>] > 1)
					setplayerinfo <index> part = guitar
				else
					setplayerinfo <index> part = bass
				endif
			endif
		endif
		<index> = (<index> + 1)
		repeat (<num_players>)
		if screenelementexists \{id = onlinelobbyinterface}
			if ($network_game_postgame_lobby = 0)
				onlinelobbyinterface :gettags
				set_ui_to_final_player_slots slot = <slot_index> locked
			else
				refresh_player_scores_postgame_container \{locked}
			endif
		endif
	endif
endscript

script set_ui_to_final_player_slots \{slot = 0}
	destroy_player_slots_ui
	onlinelobbyinterface :gettags
	gamemode_getnumplayers
	<index> = 1
	begin
	getplayerinfo <index> net_id_first
	getplayerinfo <index> net_id_second
	getplayerinfo <index> part
	switch (<part>)
		case guitar
		icon_texture = logo_guitar_grayscale
		case bass
		icon_texture = logo_bass_grayscale
		case drum
		icon_texture = logo_drum_grayscale
		case vocals
		icon_texture = logo_vocal_grayscale
	endswitch
	formattext checksumname = gamertag 'gamertag_%d' d = (<index> - 1)
	name = $<gamertag>
	xuid = [0 0]
	setarrayelement arrayname = xuid index = 0 newvalue = (<net_id_first>)
	setarrayelement arrayname = xuid index = 1 newvalue = (<net_id_second>)
	color = ($online_player_slot_bg_team1)
	if NOT gamemode_iscooperative
		if (<index> > <num_players> / 2)
			color = ($online_player_slot_bg_team2)
		endif
	endif
	getplayerinfo <index> career_earnings
	cash_get_info_from_earnings earnings = <career_earnings>
	getplayerinfo <index> controller
	getplayerinfo <index> is_local_client
	formattext textname = cash_text qs(0x48c6d14c) d = <rank>
	online_lobby_add_player_slot {
		name = <name>
		controller_texture = <icon_texture>
		xuid = <xuid>
		bg_rgba = <color>
		parent = <player_slots_menu_id>
		cash_text = <cash_text>
		cash_icon_id = <cash_icon_id>
		controller = <controller>
		is_local_client = <is_local_client>
	}
	<index> = (<index> + 1)
	repeat <num_players>
	clean_up_user_control_helpers
	netoptions :pref_get \{name = game_modes}
	if gotparam \{locked}
		new_event_handlers = [
			{pad_up net_up_down_action params = {action = up}}
			{pad_down net_up_down_action params = {action = down}}
		]
		if isxenon
			add_user_control_helper \{text = qs(0xfcc51f45)
				button = green
				z = 100000}
		endif
	elseif (<checksum> = p4_pro_faceoff || <checksum> = p2_quickplay || <checksum> = p4_quickplay || <checksum> = p8_pro_faceoff)
		new_event_handlers = [
			{pad_up net_up_down_action params = {action = up}}
			{pad_down net_up_down_action params = {action = down}}
			{pad_l1 toggle_guitar_part params = {finished_matchmaking}}
		]
		if isxenon
			add_user_control_helper \{text = qs(0xfcc51f45)
				button = green
				z = 100000}
		endif
		getactivecontrollers
		getarraysize <active_controllers>
		i = 0
		begin
		if (<active_controllers> [<i>] = 1)
			if netsessionfunc func = iscontrolleringame params = {controller = <i>}
				get_controller_type controller_index = <i>
				if (<controller_type> = guitar)
					add_user_control_helper text = qs(0x0d215c11) button = orange z = 100000 controller = <i>
					break
				endif
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	else
		new_event_handlers = [
			{pad_up net_up_down_action params = {action = up}}
			{pad_down net_up_down_action params = {action = down}}
		]
		if isxenon
			add_user_control_helper \{text = qs(0xfcc51f45)
				button = green
				z = 100000}
		endif
	endif
	setscreenelementprops {
		id = <player_slots_menu_id>
		event_handlers = []
		replace_handlers
	}
	setscreenelementprops {
		id = <player_slots_menu_id>
		event_handlers = <new_event_handlers>
		replace_handlers
	}
	onlinelobbyinterface :settags slot_items = <num_players> menu_items = 0 slot_index = 0 locked_to_players = 1
	launchevent type = focus target = <player_slots_menu_id> data = {child_index = <slot>}
endscript

script online_lobby_add_player_slot \{cash_text = qs(0x6160dbf3)
		cash_icon_id = cash_milestone_icon_002}
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :gettags
		createscreenelement {
			type = descinterface
			desc = 'online_lobby_player_slot_item'
			parent = <parent>
			auto_dims = false
			dims = (450.0, 50.0)
			event_handlers = [
				{focus player_slot_change_focus params = {focus}}
				{unfocus player_slot_change_focus params = {unfocus}}
			]
		}
		if isxenon
			if gotparam \{xuid}
				<id> :se_setprops event_handlers = [{pad_choose ui_menu_select_sfx}
					{pad_choose menu_show_gamercard_from_netid params = {net_id = <xuid>}}
				]
				if (<is_local_client> = 0)
					<id> :obj_spawnscriptlater update_headset_status params = {obj_id = <id> uid = <xuid>}
				elseif gotparam \{controller}
					if NOT netsessionfunc func = xenonisguest params = {controller_index = (<controller>)}
						<id> :obj_spawnscriptlater update_headset_status params = {obj_id = <id> uid = <xuid>}
					endif
				endif
			endif
		endif
		<id> :desc_checkversion desired = 2 assertif = mismatch
		<id> :se_setprops {
			player_slot_name_text = <name>
			player_instrument_logo_texture = <controller_texture>
			player_slot_bg_rgba = <bg_rgba>
			cash_icon_texture = <cash_icon_id>
			cash_rank_text = <cash_text>
			cash_icon_alpha = 1
		}
		if <id> :desc_resolvealias name = alias_sign_in_button param = signin_id
			<signin_id> :die
		endif
	endif
endscript

script update_ui_total_players 
	printf \{qs(0xdbe11d09)}
	gamemode_gettype
	if (<type> = career)
		printf \{qs(0x810d64d1)}
		get_local_players_in_game
		if (($num_players_in_band = <num_local_players>) && ($num_players_in_band = <total_players>))
			wait \{1
				second}
			finalizejoinprocesslocalonly
		endif
	else
		get_local_players_in_game
		netsessionfunc \{obj = party
			func = get_party_members}
		getarraysize <connections>
		if ((<array_size> = <num_local_players>) && (<array_size> = <total_players>))
			wait \{1
				second}
			change \{net_match_dlc_sync_finished = 1}
			net_match_set_available_items
			finalizejoinprocesslocalonly
		endif
	endif
	change net_num_players = <total_players>
endscript

script net_msg_update_player_ui 
	printf \{qs(0x315363a3)}
	gamemode_gettype
	if (<type> = career)
		net_add_player_to_career_ui {
			name = <gamertag_string>
			player_num = <player_num>
			net_id_first = <net_id_first>
			net_id_second = <net_id_second>
			local_client = <local_client>
			obj_id = <obj_id>
			part = <part>
			difficulty = <difficulty>
		}
	endif
endscript

script net_msg_update_joining_ui 
	printf \{qs(0x1adf4bb7)}
	gamemode_gettype
	if (<type> = career)
		if NOT ishost
			register_new_progression_atoms \{career_band}
			ui_event_get_stack
			if NOT ((<stack> [1].base_name) = 'band_mode')
				proceed_to_band_lobby
			else
				ui_event \{event = menu_refresh}
			endif
		else
			ui_band_mode_change_menu_focus_all \{focus_type = focus
				local_only}
			get_player_num_from_controller controller_index = ($primary_controller)
			sendstructure callback = net_career_asign_band_leader_icon data_to_send = {player_num = <player_num>}
			if screenelementexists \{id = myinterfaceelement}
				myinterfaceelement :obj_spawnscript \{net_career_host_finalize_menu_ui}
			endif
		endif
	else
		if screenelementexists \{id = onlinelobbyinterface}
			onlinelobbyinterface :obj_spawnscriptlater \{set_net_ui_to_finished_searching}
		else
			spawnscriptlater \{set_net_ui_to_finished_searching}
		endif
	endif
endscript

script choose_random_venue 
	getarraysize ($levelzonearray)
	begin
	getrandomvalue name = level_index integer a = 0 b = (<array_size> -1)
	get_levelzonearray_checksum index = <level_index>
	if NOT structurecontains structure = ($levelzones.<level_checksum>) debug_only
		change current_level = <level_checksum>
		break
	endif
	repeat
endscript

script host_start_player_settings_sync 
	if ishost
		if ($net_num_player_settings_ack = 0)
			printf \{qs(0xd493fca3)}
			sendstructure \{callback = player_settings_request
				data_to_send = {
					none
				}}
			i = 1
			num_local_players = 4
			begin
			formattext checksumname = player_status 'player%d_status' d = <i>
			if ((($<player_status>.is_local_client) = 1) && (($<player_status>.net_obj_id) >= 0))
				change net_num_player_settings_ack = ($net_num_player_settings_ack + 1)
				printf ($net_num_player_settings_ack)
			endif
			i = (<i> + 1)
			repeat <num_local_players>
			if (($net_num_players) = ($net_num_player_settings_ack))
				lock_player_parts
			endif
			gamemode_gettype
			if (<type> = career)
				if screenelementexists \{id = myinterfaceelement}
					myinterfaceelement :obj_spawnscriptnow \{host_wait_for_player_settings_request_ack}
				endif
			endif
		endif
	endif
endscript
player_drop_in_setting_sync = 0

script host_wait_for_player_settings_request_ack 
	getnumplayers
	starting_players = (<num_players> + ($net_dropped_players_flag))
	begin
	getnumplayers
	if (<num_players> < <starting_players>)
		change \{player_drop_in_setting_sync = 1}
		break
	endif
	wait \{1
		second}
	repeat
	printf \{qs(0x800db563)}
	change \{net_num_player_settings_ack = 0}
	gamemode_gettype
	if (<type> = career)
		net_career_check_instruments
	else
		lock_player_parts
	endif
	num_valid_players = 0
	player_data = {}
	i = 0
	begin
	formattext checksumname = player_status 'player%d_status' d = (<i> + 1)
	if (($<player_status>.net_obj_id) >= 0)
		appendstruct {
			struct = player_data
			field = <player_status>
			params = {
				player_difficulty = ($<player_status>.difficulty)
				player_obj_id = ($<player_status>.net_obj_id)
				player_lefty_flip = ($<player_status>.lefty_flip)
				player_part = ($<player_status>.part)
			}
		}
		num_valid_players = (<num_valid_players> + 1)
	endif
	if ($net_num_players = <num_valid_players>)
		break
	endif
	i = (<i> + 1)
	repeat 8
	printf \{qs(0x8528c58d)}
	printstruct <player_data>
	sendstructure callback = finish_player_settings_sync data_to_send = {player_data = <player_data>}
	if (<type> = career)
		count = 0
		i = 1
		num_local_players = 4
		begin
		formattext checksumname = player_status 'player%d_status' d = <i>
		if ((($<player_status>.net_obj_id) >= 0) && (($<player_status>.is_local_client) = 1))
			change net_num_player_settings_ack = (($net_num_player_settings_ack) + 1)
			printf qs(0xfe4ea33f) d = ($net_num_player_settings_ack)
		endif
		i = (<i> + 1)
		repeat <num_local_players>
		if screenelementexists \{id = myinterfaceelement}
			myinterfaceelement :obj_spawnscript \{net_career_wait_to_proceed_to_online_play}
		endif
	else
		if ($network_game_postgame_lobby = 0)
			get_local_players_in_game
			gamemode_getnumplayers
			if (<num_players> != <num_local_players>)
				net_match_send_available_items
			endif
		endif
	endif
endscript

script player_settings_request 
	printf \{qs(0xbe85d6ff)}
	gamemode_gettype
	if (<type> = career)
		begin
		if ($net_career_data_sync_done = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
	num_local_players = 4
	player_data = {}
	i = 1
	begin
	formattext checksumname = player_status 'player%d_status' d = <i>
	if ((($<player_status>.is_local_client) = 1) && (($<player_status>.net_obj_id) >= 0))
		appendstruct {
			struct = player_data
			field = <player_status>
			params = {
				player_difficulty = ($<player_status>.difficulty)
				player_obj_id = ($<player_status>.net_obj_id)
				player_lefty_flip = ($<player_status>.lefty_flip)
				player_part = ($<player_status>.part)
			}
		}
	endif
	i = (<i> + 1)
	repeat <num_local_players>
	if NOT (<type> = career)
		if screenelementexists \{id = onlinelobbyinterface}
			if ($network_game_postgame_lobby = 0)
				onlinelobbyinterface :gettags
				set_ui_to_final_player_slots slot = <slot_index> locked
			endif
		endif
	endif
	sendstructure callback = player_settings_request_ack data_to_send = {player_data = <player_data>} to_server
endscript

script player_settings_request_ack 
	printf \{qs(0xefe6d493)}
	if ($player_drop_in_setting_sync = 0)
		if gotparam \{player_data}
			num_local_players = 4
			i = 1
			begin
			formattext checksumname = player_status 'player%d_status' d = <i>
			if structurecontains structure = <player_data> <player_status>
				num_net_players = 8
				j = 1
				begin
				getplayerinfo <j> net_obj_id
				if (<net_obj_id> = <player_data>.<player_status>.player_obj_id)
					change net_num_player_settings_ack = ($net_num_player_settings_ack + 1)
					printf ($net_num_player_settings_ack)
					setplayerinfo <j> difficulty = (<player_data>.<player_status>.player_difficulty)
					setplayerinfo <j> lefty_flip = (<player_data>.<player_status>.player_lefty_flip)
					setplayerinfo <j> lefthanded_gems = (<player_data>.<player_status>.player_lefty_flip)
					setplayerinfo <j> lefthanded_button_ups = (<player_data>.<player_status>.player_lefty_flip)
					setplayerinfo <j> lefthanded_button_ups_flip_save = (<player_data>.<player_status>.player_lefty_flip)
					setplayerinfo <j> lefthanded_gems_flip_save = (<player_data>.<player_status>.player_lefty_flip)
					setplayerinfo <j> part = (<player_data>.<player_status>.player_part)
				endif
				j = (<j> + 1)
				repeat <num_net_players>
			endif
			i = (<i> + 1)
			repeat <num_local_players>
		endif
		if (($net_num_players) = ($net_num_player_settings_ack))
			gamemode_gettype
			if (<type> = career)
				if screenelementexists \{id = myinterfaceelement}
					myinterfaceelement :obj_killspawnedscript \{name = host_wait_for_player_settings_request_ack}
				endif
			endif
			printf \{qs(0x016b9c08)}
			change \{net_num_player_settings_ack = 0}
			change \{player_drop_in_setting_sync = 0}
			gamemode_gettype
			if (<type> = career)
				net_career_check_instruments
			else
				lock_player_parts
			endif
			num_valid_players = 0
			player_data = {}
			i = 0
			begin
			formattext checksumname = player_status 'player%d_status' d = (<i> + 1)
			if (($<player_status>.net_obj_id) >= 0)
				appendstruct {
					struct = player_data
					field = <player_status>
					params = {
						player_difficulty = ($<player_status>.difficulty)
						player_obj_id = ($<player_status>.net_obj_id)
						player_lefty_flip = ($<player_status>.lefty_flip)
						player_part = ($<player_status>.part)
					}
				}
				num_valid_players = (<num_valid_players> + 1)
			endif
			if ($net_num_players = <num_valid_players>)
				break
			endif
			i = (<i> + 1)
			repeat 8
			printf \{qs(0x8528c58d)}
			printstruct <player_data>
			sendstructure callback = finish_player_settings_sync data_to_send = {player_data = <player_data>}
			if (<type> = career)
				count = 0
				i = 1
				num_local_players = 4
				begin
				formattext checksumname = player_status 'player%d_status' d = <i>
				if ((($<player_status>.net_obj_id) >= 0) && (($<player_status>.is_local_client) = 1))
					change net_num_player_settings_ack = (($net_num_player_settings_ack) + 1)
					printf qs(0xfe4ea33f) d = ($net_num_player_settings_ack)
				endif
				i = (<i> + 1)
				repeat <num_local_players>
				if screenelementexists \{id = myinterfaceelement}
					myinterfaceelement :obj_spawnscript \{net_career_wait_to_proceed_to_online_play}
				endif
			else
				if ($network_game_postgame_lobby = 0)
					get_local_players_in_game
					gamemode_getnumplayers
					if (<num_players> != <num_local_players>)
						net_match_send_available_items
					endif
				endif
			endif
		endif
	endif
endscript

script finish_player_settings_sync 
	printf \{qs(0xc8dc30a5)}
	printstruct <...>
	if gotparam \{player_data}
		num_net_players = 8
		i = 1
		begin
		formattext checksumname = player_status 'player%d_status' d = <i>
		if structurecontains structure = <player_data> <player_status>
			num_net_players = 8
			j = 1
			begin
			getplayerinfo <j> net_obj_id
			if (<net_obj_id> = <player_data>.<player_status>.player_obj_id)
				setplayerinfo <j> difficulty = (<player_data>.<player_status>.player_difficulty)
				setplayerinfo <j> lefty_flip = (<player_data>.<player_status>.player_lefty_flip)
				setplayerinfo <j> lefthanded_gems = (<player_data>.<player_status>.player_lefty_flip)
				setplayerinfo <j> lefthanded_button_ups = (<player_data>.<player_status>.player_lefty_flip)
				setplayerinfo <j> lefthanded_button_ups_flip_save = (<player_data>.<player_status>.player_lefty_flip)
				setplayerinfo <j> lefthanded_gems_flip_save = (<player_data>.<player_status>.player_lefty_flip)
				setplayerinfo <j> part = (<player_data>.<player_status>.player_part)
			endif
			j = (<j> + 1)
			repeat <num_net_players>
		endif
		i = (<i> + 1)
		repeat <num_net_players>
	endif
	gamemode_gettype
	if (<type> = career)
		count = 0
		i = 1
		num_local_players = 4
		begin
		formattext checksumname = player_status 'player%d_status' d = <i>
		if ((($<player_status>.net_obj_id) >= 0) && (($<player_status>.is_local_client) = 1))
			count = (<count> + 1)
		endif
		i = (<i> + 1)
		repeat <num_local_players>
		sendstructure callback = finish_player_settings_sync_ack data_to_send = {num_ready = <count>}
	else
		if screenelementexists \{id = onlinelobbyinterface}
			if ($network_game_postgame_lobby = 0)
				onlinelobbyinterface :gettags
				get_local_players_in_game
				gamemode_getnumplayers
				if (<num_players> != <num_local_players>)
					net_match_send_available_items
				endif
				set_ui_to_final_player_slots slot = <slot_index> locked
			else
				refresh_player_scores_postgame_container \{locked}
			endif
		endif
	endif
endscript

script finish_player_settings_sync_ack 
	gamemode_gettype
	if (<type> = career)
		change net_num_player_settings_ack = (($net_num_player_settings_ack) + <num_ready>)
		printf qs(0xab067796) d = ($net_num_player_settings_ack)
	endif
endscript

script net_party_host_started_matchmaking 
	printf \{qs(0xea82e4e2)}
	gamemode_gettype
	if (<type> = career)
		netsessionfunc \{obj = party
			func = get_party_members}
		getarraysize <connections>
		change \{net_career_invite_flag = 1}
		change \{net_band_mode_menu = lobby}
		get_local_players_in_game
		i = 0
		begin
		if (<i> < <num_local_players>)
			value = 1
		else
			value = 0
		endif
		setplayerinfo (<i> + 1) is_local_client = <value>
		i = (<i> + 1)
		repeat 4
		change num_players_in_band = <array_size>
		ui_event \{event = menu_change
			data = {
				state = uistate_band_mode
			}}
	else
		begin
		if screenelementexists \{id = current_menu}
			break
		endif
		wait \{1
			gameframe}
		repeat
		remove_empty_slots_from_status_structs
		change \{net_new_matchmaking_ui_flag = 1}
		launchevent \{type = unfocus
			target = current_menu}
		set_net_dialog_message \{msg_checksum = start_matchmaking}
		if screenelementexists \{id = onlinelobbyinterface}
			onlinelobbyinterface :gettags
			if screenelementexists id = <player_slots_menu_id>
				<player_slots_menu_id> :obj_killspawnedscript name = update_player_slots_ui
				if isscreenelementinfocus id = <player_slots_menu_id>
					launchevent type = unfocus target = <player_slots_menu_id>
				endif
			endif
		endif
		netoptions :pref_get \{name = game_modes}
		if (<checksum> = p2_battle)
			get_player_num_from_controller controller_index = ($primary_controller)
			if (<player_num> != -1)
				getplayerinfo <player_num> difficulty
				if (<difficulty> = easy_rhythm)
					checksum = easy
					setplayerinfo <player_num> difficulty = <checksum>
				endif
			endif
		endif
		if screenelementexists \{id = netprefinterface}
			ui_destroy_net_preferences \{no_focus}
		endif
		if screenelementexists \{id = friendslistinterface}
			ui_destroy_friends_list \{no_focus}
		endif
		clear_temp_net_id_array
		setup_temp_net_id_array
		client_create_start_matchmaking_container
	endif
endscript

script net_party_attempted_join_result 
	printf \{qs(0x781f28a3)}
	requireparams \{[
			join_result
			join_mode
		]
		all}
	change \{has_invite_join_result_callback_completed = 1}
	if (<join_result> = 1)
		printf \{qs(0x9014f167)}
		if checksumequals a = <join_mode> b = career_join
			ui_event_block \{event = menu_add
				data = {
					state = uistate_game_mode
					base_name = 'game_mode'
				}}
			ui_event_block \{event = menu_add
				data = {
					state = uistate_group_play
					base_name = 'group_play'
				}}
			change \{game_mode = p4_career}
			change \{net_band_mode_menu = invite}
			net_party_save_off_invite_controllers
			netoptions :pref_choose \{name = game_modes
				checksum = p4_career}
			destroy_loading_screen
			ui_event \{event = menu_change
				data = {
					state = uistate_net_setup
				}}
		else
			change \{game_mode = p2_faceoff}
			ui_event_block \{event = menu_change
				data = {
					state = uistate_net_setup
				}}
		endif
	else
		shut_down_net_play
		printf \{qs(0x71dfc671)}
		if isps3
			popup_text = qs(0x366e10c6)
			if gotparam \{reason}
				if (<reason> = bad_state)
					<popup_text> = qs(0x33923e7f)
				endif
			endif
		else
			popup_text = qs(0x4e216451)
			if gotparam \{reason}
				if (<reason> = bad_state)
					<popup_text> = qs(0x3c913dd8)
				endif
			endif
		endif
		create_popup_warning_menu {
			title = qs(0x4d21d20e)
			textblock = {
				text = <popup_text>
			}
			parent = root_window
			options = [
				{
					func = net_party_failed_join_attempt_continue
					text = qs(0x494b4d7f)
				}
			]
		}
		destroy_loading_screen
	endif
endscript

script net_party_failed_join_attempt_continue 
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	ui_event \{event = menu_refresh
		data = {
			lost_party
			refresh_animate
		}}
endscript

script net_party_lost_party_connection 
	printf \{qs(0xb6121789)}
	ui_event_get_stack
	if NOT ((<stack> [0].base_name) = 'mainmenu')
		gamemode_gettype
		if (<type> = career)
			getarraysize <stack>
			count = 0
			i = 0
			begin
			if ((<stack> [<i>].base_name) = 'band_mode')
				count = (<count> + 1)
			endif
			i = (<i> + 1)
			repeat <array_size>
			if (<count> > 1)
				return
			endif
			wait_for_safe_shutdown
			change \{net_ready_to_start = 1}
			ui_event \{event = menu_back
				data = {
					state = uistate_group_play
				}}
			create_net_popup \{title = qs(0x5ca2c535)
				popup_text = qs(0x6c53663a)}
			spawnscriptnow \{net_party_lost_party_connection_kill_popup}
		else
			ui_event_get_top
			if (<base_name> = 'online')
				net_clear_all_remote_player_status
				destroy_popup_warning_menu
				ui_event \{event = menu_refresh
					data = {
						lost_party
					}}
			endif
		endif
	endif
endscript

script net_party_lost_party_connection_kill_popup 
	wait \{3
		seconds}
	ui_event_get_stack
	if ((<stack> [0].base_name) = 'connection_loss')
		return
	endif
	destroy_net_popup
endscript

script net_party_receive_host_party_info 
	printf \{qs(0x3529c519)}
endscript

script party_is_full 
	netsessionfunc \{obj = party
		func = get_party_members}
	getarraysize <connections>
	if (<array_size> >= 8)
		if NOT gotparam \{controller}
			return \{true}
		else
			i = 0
			begin
			if ((<connections> [<i>]).is_local = 1)
				if ((<connections> [<i>]).controller_index = <controller>)
					return \{false}
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_size>
			return \{true}
		endif
	else
		return \{false}
	endif
endscript

script ui_slots_are_full 
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :gettags
		if screenelementexists id = <player_slots_menu_id>
			<player_slots_menu_id> :gettags
			getarraysize <all_players_checksum>
			if (<array_size> > 0)
				index = 0
				begin
				if (<all_players_checksum> [<index>] = empty)
					return \{false}
				endif
				index = (<index> + 1)
				repeat <array_size>
			endif
		endif
	endif
	return \{true}
endscript

script menu_net_matchmaking_init 
	printf \{qs(0xcc5ed367)}
	printf qs(0x7456dde0) d = ($primary_controller)
	netsessionfunc {
		obj = party
		func = create_party_session
		params = {
			controller_index = ($primary_controller)
		}
	}
	netsessionfunc \{obj = party
		func = set_joiner_mode
		params = {
			mode = online_menu
		}}
endscript

script net_party_debug_dump 
	printf \{qs(0x5243db76)}
	netsessionfunc \{obj = party
		func = get_party_members}
	printstruct <...>
endscript

script menu_net_matchmaking_deinit 
	printf \{qs(0x56ab650d)}
	netsessionfunc \{obj = party
		func = stop_party_session}
endscript
temp_net_id = [
	{
		net_id_first = 0
		net_id_second = 0
		name = qs(0x00000000)
	}
	{
		net_id_first = 0
		net_id_second = 0
		name = qs(0x00000000)
	}
	{
		net_id_first = 0
		net_id_second = 0
		name = qs(0x00000000)
	}
	{
		net_id_first = 0
		net_id_second = 0
		name = qs(0x00000000)
	}
	{
		net_id_first = 0
		net_id_second = 0
		name = qs(0x00000000)
	}
	{
		net_id_first = 0
		net_id_second = 0
		name = qs(0x00000000)
	}
	{
		net_id_first = 0
		net_id_second = 0
		name = qs(0x00000000)
	}
]

script clear_temp_net_id_array 
	change \{temp_net_id = [
			{
				net_id_first = 0
				net_id_second = 0
				name = qs(0x00000000)
			}
			{
				net_id_first = 0
				net_id_second = 0
				name = qs(0x00000000)
			}
			{
				net_id_first = 0
				net_id_second = 0
				name = qs(0x00000000)
			}
			{
				net_id_first = 0
				net_id_second = 0
				name = qs(0x00000000)
			}
			{
				net_id_first = 0
				net_id_second = 0
				name = qs(0x00000000)
			}
			{
				net_id_first = 0
				net_id_second = 0
				name = qs(0x00000000)
			}
			{
				net_id_first = 0
				net_id_second = 0
				name = qs(0x00000000)
			}
		]}
endscript

script net_party_save_off_invite_controllers 
	printf \{qs(0x6ce8d99e)}
	get_local_players_in_game
	getarraysize \{local_players}
	if (<array_size> > 0)
		i = 0
		begin
		if ((<local_players> [<i>]) = 1)
			getnetid controller_index = <i>
			netsessionfunc func = get_gamertag params = {controller = <i>}
			setarrayelement {
				globalarray
				arrayname = temp_net_id
				index = <i>
				newvalue = {
					net_id_first = <net_id_first>
					net_id_second = <net_id_second>
					name = <name>
				}
			}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script start_friendslist 
	printf \{qs(0x8beb3927)}
	if NOT screenelementexists \{id = friendslistinterface}
		launchevent \{type = unfocus
			target = current_menu}
		online_lobby_transition_out
		soundevent \{event = online_panel_in}
		ui_create_friends_list device_num = <device_num> exit_script = online_lobby_transition_in
	endif
endscript

script start_net_preferences 
	if NOT screenelementexists \{id = netprefinterface}
		launchevent \{type = unfocus
			target = current_menu}
		online_lobby_transition_out
		soundevent \{event = online_panel_in}
		ui_create_net_preferences device_num = <device_num> exit_script = online_lobby_transition_in
	endif
endscript

script toggle_guitar_part 
	printf \{qs(0x7f246a05)}
	onlinelobbyinterface :getsingletag \{toggle_allowed}
	if (<toggle_allowed> = 0)
		return
	endif
	requireparams \{[
			device_num
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
	get_controller_type controller_index = <device_num>
	if (<controller_type> = guitar)
		getplayerinfo <info_index> part
		soundevent \{event = online_instrument_change}
		if (<part> = guitar)
			if gotparam \{finished_matchmaking}
				setplayerinfo <info_index> part = bass
				getplayerinfo <info_index> net_id_first
				getplayerinfo <info_index> net_id_second
				formattext checksumname = gamertag 'gamertag_%d' d = (<index> - 1)
				sendstructure callback = update_player_part data_to_send = {first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = bass}
				update_player_part first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = bass
			else
				update_party_player_part info_index = <info_index> part = bass controller = <device_num>
			endif
		elseif (<part> = bass)
			if gotparam \{finished_matchmaking}
				setplayerinfo <info_index> part = guitar
				getplayerinfo <info_index> net_id_first
				getplayerinfo <info_index> net_id_second
				formattext checksumname = gamertag 'gamertag_%d' d = (<index> - 1)
				sendstructure callback = update_player_part data_to_send = {first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = guitar}
				update_player_part first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = guitar
			else
				update_party_player_part info_index = <info_index> part = guitar controller = <device_num>
			endif
		endif
	endif
endscript

script update_party_player_part 
	netsessionfunc \{obj = party
		func = get_shared_data}
	getplayerinfo <info_index> party_id
	formattext checksumname = player_data 'player_%d' d = <party_id>
	if structurecontains structure = <party_shared_data> <player_data>
		setplayerinfo <info_index> part = <part>
		get_savegame_from_controller controller = <controller>
		get_current_band_info
		getglobaltags <band_info> savegame = <savegame> param = career_earnings
		party_info = {}
		appendstruct {
			struct = party_info
			field = <player_data>
			params = {
				player_part = <part>
				player_career_earnings = <career_earnings>
			}
		}
		netsessionfunc obj = party func = append_shared_data params = {data = <party_info>}
		refresh_player_slots_ui
	endif
endscript

script update_player_part 
	if ishost
		sendstructure callback = update_player_part data_to_send = <...>
	endif
	found = 0
	info_index = 1
	begin
	getplayerinfo <info_index> net_id_first
	getplayerinfo <info_index> net_id_second
	formattext checksumname = gamertag 'gamertag_%d' d = (<info_index> - 1)
	if ((<net_id_first> = <first_id>) && (<net_id_second> = <second_id>))
		if isxenon
			<found> = 1
			break
		elseif localizedstringequals a = <name> b = ($<gamertag>)
			<found> = 1
			break
		endif
	endif
	info_index = (<info_index> + 1)
	repeat 8
	if (<found> = 1)
		setplayerinfo <info_index> part = <part>
		if screenelementexists \{id = onlinelobbyinterface}
			onlinelobbyinterface :gettags
			set_ui_to_final_player_slots slot = <slot_index>
		endif
	endif
endscript

script ps3_display_invites_received 
	netsessionfunc \{func = displayandacceptinvites
		params = {
			callback = ps3_invite_callback
		}}
endscript

script ps3_invite_callback 
	printf \{qs(0xb8afcd4a)}
endscript

script matchmaking_countdown_end_game_script 
	wait_for_safe_shutdown
	if screenelementexists \{id = onlinelobbyinterface}
		onlinelobbyinterface :obj_killspawnedscript \{name = set_net_ui_to_finished_searching}
		killspawnedscript \{name = set_net_ui_to_finished_searching}
		if onlinelobbyinterface :desc_resolvealias \{name = alias_player_slots_vmenu
				param = player_slots_menu}
			launchevent type = unfocus target = <player_slots_menu>
		endif
	endif
	create_net_popup \{title = qs(0x5ca2c535)
		popup_text = qs(0x32f94482)}
	wait \{3
		seconds}
	destroy_net_popup
	quit_network_game
	refresh_online_lobby
endscript

script matchmaking_countdown_drop_player_script 
	printf \{qs(0x24956f54)}
	printf \{qs(0x1708dab5)}
endscript

script print_net_ui_status 
	onlinelobbyinterface :gettags
	<player_slots_menu_id> :gettags
	printstruct <...>
endscript

script print_current_net_prefs 
	netoptions :pref_get \{name = game_modes}
	printstruct <...>
	netoptions :pref_get \{name = ranked}
	printstruct <...>
endscript

script check_signin_wrapper 
	printstruct <...>
	if checkforsignin local controller controller_index = <device_num>
		netsessionfunc \{func = showsigninui
			params = {
				convert_offline_to_guest
			}}
	else
		netsessionfunc \{func = showsigninui4pane
			params = {
				online_only
			}}
	endif
	wait_for_blade_complete
	if checkforsignin controller_index = <device_num>
		printf \{qs(0x08ec2e8b)}
	else
		if isxenon
			if checkforsignin local controller controller_index = <device_num>
				netsessionfunc \{func = showsigninui
					params = {
						convert_offline_to_guest
					}}
			else
				netsessionfunc \{func = showsigninui4pane
					params = {
						online_only
					}}
			endif
			wait_for_blade_complete
		endif
	endif
endscript

script debug_4player_signin 
	if isxenon
		netsessionfunc \{func = showsigninui4pane}
		wait_for_blade_complete
	endif
endscript

script print_player_status_structs_net_info 
	printf \{qs(0xad29dbe4)}
	i = 1
	begin
	formattext checksumname = player_status 'player%d_status' d = <i>
	formattext checksumname = gamertag 'gamertag_%i' i = (<i> - 1)
	name = $<gamertag>
	printf <player_status>
	printf qs(0x8eca38c7) d = ($<player_status>.is_local_client)
	printf qs(0xa5bccced) d = ($<player_status>.net_id_first)
	printf qs(0x084465d1) d = ($<player_status>.net_id_second)
	printf qs(0x5b7377e6) g = <name>
	printf qs(0xdd16850f) d = ($<player_status>.net_obj_id)
	printf ($<player_status>.part)
	printf ($<player_status>.net_difficulty)
	printf ($<player_status>.controller)
	printf ($<player_status>.career_earnings)
	i = (<i> + 1)
	repeat 8
endscript
