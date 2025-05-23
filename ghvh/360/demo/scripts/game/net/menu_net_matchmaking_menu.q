global_should_use_net_debugging = 0
online_lobby_item_text_color = [
	0
	0
	0
	255
]
player_slot_team1 = [
	179
	131
	0
	255
]
player_slot_team2 = [
	17
	65
	132
	255
]
ps3_chat_warning_text = [
	0
	0
	0
	255
]
default_online_warning_pos = (920.0, 380.0)
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
	find_a_game_text = qs(0x1cf9c325)
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
	gamer_card_text = qs(0x3e683866)
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

script reset_stats 
	netsessionfunc \{obj = stats
		func = reset_all_stats}
endscript

script create_net_matchmaking_menu_spawned 
	netsessionfunc \{obj = voice
		func = turnteamtalkoff}
	change \{rich_presence_context = presence_menus}
	ui_fx_set_blur \{amount = 0.0
		time = 0.0}
	frontend_load_soundcheck \{loadingscreen}
	createscreenelement \{parent = root_window
		id = onlinelobbyinterface
		type = descinterface
		desc = 'online_lobby'
		tags = {
			menu_index = 0
			menu_items = 0
			slots_index = -1
			slot_items = 0
			player_slots_menu_id = 0
			locked_to_players = 0
			toggle_allowed = 1
		}}
	assignalias id = <id> alias = current_menu_anchor
	current_menu_anchor :obj_spawnscript \{highlight_motion}
	set_focus_color
	set_unfocus_color
	onlinelobbyinterface :desc_checkversion \{desired = 29
		assertif = mismatch}
	getactivecontrollers \{include_signed_in}
	getarraysize <active_controllers>
	i = 0
	player_num = 1
	begin
	if (<active_controllers> [<i>] = 1)
		if netsessionfunc func = iscontrolleringame params = {controller = <i>}
			restore_save_net_preferences controller_index = <i> player_status_index = (<player_num>)
			<player_num> = (<player_num> + 1)
		endif
	elseif netsessionfunc \{obj = party
			func = is_host}
		netsessionfunc func = removecontroller params = {controller = <i>}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	create_matchmaking_menu_and_items
	create_player_slots_container
	if onlinelobbyinterface :desc_resolvealias \{name = alias_local_rockers}
		<resolved_id> :obj_spawnscriptnow setup_local_rockers
	endif
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
			create_ps3_chat_warning_message \{message = qs(0xbc1b25f8)}
		endif
	endif
	unblock_invites
endscript
default_local_rockers_scale = (0.96999997, 0.9)
local_rockers_off_alpha = 0.3

script setup_local_rockers 
	obj_getid
	if <objid> :desc_resolvealias name = alias_local_rocker_1
		<resolved_id> :obj_spawnscriptnow local_rocker_heartbeat params = {controller = 0}
	endif
	if <objid> :desc_resolvealias name = alias_local_rocker_2
		<resolved_id> :obj_spawnscriptnow local_rocker_heartbeat params = {controller = 1}
	endif
	if <objid> :desc_resolvealias name = alias_local_rocker_3
		<resolved_id> :obj_spawnscriptnow local_rocker_heartbeat params = {controller = 2}
	endif
	if <objid> :desc_resolvealias name = alias_local_rocker_4
		<resolved_id> :obj_spawnscriptnow local_rocker_heartbeat params = {controller = 3}
	endif
	begin
	controller = 0
	begin
	update_local_rocker controller = <controller>
	<controller> = (<controller> + 1)
	repeat 4
	wait \{1
		second}
	repeat
endscript

script update_local_rocker 
	requireparams \{[
			controller
		]
		all}
	activate = 1
	box_index = (<controller> + 1)
	if onlinelobbyinterface :desc_resolvealias \{name = alias_local_rockers
			param = local_rockers}
		formattext checksumname = local_rocker_alias 'alias_local_rocker_%d' d = <box_index>
		formattext checksumname = difficulty_texture 'difficulty%d_texture' d = <box_index>
		formattext checksumname = character_texture 'character%d_texture' d = <box_index>
		formattext checksumname = instrument_texture 'instrument%d_texture' d = <box_index>
		if <local_rockers> :desc_resolvealias name = <local_rocker_alias> param = this_local_rocker
			if netsessionfunc func = iscontrolleringame params = {controller = <controller>}
				<this_local_rocker> :se_setprops alpha = 1.0
				get_local_rockers_data device_num = <controller>
				addparam structure_name = local_rocker_props name = <difficulty_texture> value = <difficulty_icon>
				addparam structure_name = local_rocker_props name = <character_texture> value = <character_icon>
				addparam structure_name = local_rocker_props name = <instrument_texture> value = <instrument_icon>
				<local_rockers> :se_setprops <local_rocker_props>
			else
				<this_local_rocker> :se_setprops alpha = ($local_rockers_off_alpha)
				<this_local_rocker> :se_setprops scale = ($default_local_rockers_scale)
			endif
		endif
	endif
endscript

script local_rocker_heartbeat 
	requireparams \{[
			controller
		]
		all}
	obj_getid
	<objid> :se_getprops scale
	original_scale = <scale>
	high_scale = (<scale> * 1.025)
	begin
	if netsessionfunc func = iscontrolleringame params = {controller = <controller>}
		begin
		<objid> :se_setprops scale = <high_scale> time = 0.05
		<objid> :se_waitprops
		<objid> :se_setprops scale = <original_scale> time = 0.08
		<objid> :se_waitprops
		wait \{0.15
			seconds}
		repeat 2
	endif
	wait \{0.75
		second}
	repeat
endscript

script get_local_rockers_data 
	requireparams \{[
			device_num
		]
		all}
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
	get_controller_type controller_index = <device_num>
	instrument_icon = mixer_icon_guitar
	switch (<controller_type>)
		case guitar
		getplayerinfo <player_num> part
		if (<part> = bass)
			instrument_icon = mixer_icon_bass
		else
			instrument_icon = mixer_icon_guitar
		endif
		case drum
		instrument_icon = mixer_icon_drums
		case controller
		instrument_icon = mixer_icon_vox
		case vocals
		instrument_icon = mixer_icon_vox
	endswitch
	difficulty = ($default_difficulty [<device_num>])
	difficulty_icon = icon_difficulty_expert
	switch (<difficulty>)
		case easy_rhythm
		difficulty_icon = icon_difficulty_beginner
		case easy
		difficulty_icon = icon_difficulty_easy
		case medium
		difficulty_icon = icon_difficulty_medium
		case hard
		difficulty_icon = icon_difficulty_hard
		case expert
		if (<controller_type> = drum)
			getplayerinfo <player_num> double_kick_drum
			if (<double_kick_drum> = 1)
				difficulty_icon = icon_difficulty_expert_plus
			else
				difficulty_icon = icon_difficulty_expert
			endif
		else
			difficulty_icon = icon_difficulty_expert
		endif
	endswitch
	get_savegame_from_controller controller = <device_num>
	getplayerinfo <player_num> character_id
	get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
	get_car_photo_icon profile_struct = <profile_struct> savegame = <savegame> character_id = <character_id>
	return difficulty_icon = <difficulty_icon> instrument_icon = <instrument_icon> character_icon = <icon>
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
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		getactivecontrollers \{include_signed_in}
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
	soundevent \{event = online_main_panel_in}
	if NOT screenelementexists \{id = onlinelobbyinterface}
		return
	endif
	assignalias id = <vmenu_id> alias = current_menu
	launchevent \{type = focus
		target = current_menu}
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
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	if NOT gotparam \{no_focus}
		launchevent \{type = focus
			target = current_menu}
	endif
endscript

script online_lobby_transition_out 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	menu_transition_out \{menu = current_menu_anchor}
endscript

script destroy_net_matchmaking_menu 
	if screenelementexists \{id = onlinelobbyinterface}
		destroyscreenelement \{id = onlinelobbyinterface}
	endif
	killspawnedscript \{name = set_net_ui_to_finished_searching}
	generic_ui_destroy
	cleanup_all_photo_assets
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
	<id> :se_setprops rot_angle = <rot_angle> time = 1.5
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
		texture = popup_small
		dims = (600.0, 335.0)
		just = [center center]
		z_priority = (<z_priority> + 21)
		alpha = 1.0
	}
	createscreenelement {
		type = textblockelement
		parent = <menu_anchor>
		id = online_warning_message_text
		font = fontgrid_text_3
		rgba = [149 48 48 255]
		text = <message>
		just = [center center]
		internal_just = [center center]
		internal_scale = 0.7
		z_priority = (<z_priority> + 22)
		dims = (500.0, 280.0)
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

script display_online_warning_message \{wait_time = 2.0}
	if screenelementexists \{id = online_warning_message_container}
		online_warning_message_container :obj_spawnscriptnow online_warning_message_animate params = {wait_time = <wait_time>}
	endif
endscript

script online_warning_message_animate 
	if screenelementexists \{id = online_warning_message_container}
		online_warning_message_container :se_setprops \{alpha = 1.0
			time = 0.2}
		online_warning_message_container :se_waitprops
	endif
	wait <wait_time> seconds
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
		font = fontgrid_text_a11_b
		rgba = ($ps3_chat_warning_text)
		pos = (895.0, 550.0)
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
		onlinelobbyinterface :desc_resolvealias \{name = alias_start_matchmaking}
		<resolved_id> :se_setprops {
			<focusable>
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose start_matchmaking}
			]
		}
		<resolved_id> :settags msg_checksum = find_a_game
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
		choose_first_viewable_mode
		netoptions :pref_get \{name = game_modes}
		formattext textname = game_mode_text qs(0xed77b849) d = <display_string>
		onlinelobbyinterface :desc_resolvealias \{name = alias_game_mode}
		gamemode_params = {
			base_text = qs(0xbd07b80c)
			vmenu_id = current_menu
			text_id = <resolved_id>
		}
		<resolved_id> :se_setprops {
			<focusable>
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose try_select_gamemode params = {<gamemode_params> title = qs(0x876172e8)}}
			]
		}
		<resolved_id> :settags msg_checksum = game_mode
		if gotparam \{focusable}
			if (<focusable> = not_focusable)
				<resolved_id> :se_setprops alpha = 0.5
			endif
		endif
		onlinelobbyinterface :se_setprops {
			matchmaking_game_mode_text = <game_mode_text>
		}
		onlinelobbyinterface :desc_resolvealias \{name = alias_friends}
		<resolved_id> :se_setprops {
			<demo_mode_disable>
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose ui_menu_select_sfx}
				{pad_choose start_friendslist}
			]
		}
		<resolved_id> :settags msg_checksum = friends
		if isxenon
			onlinelobbyinterface :se_setprops \{friends_list_text = qs(0x175e26d4)}
		endif
		if ($is_multiplayer_beta = 1)
			resolvescreenelementid id = [
				{id = <resolved_id>}
				{local_id = text}
			]
			<resolved_id> :se_setprops {<demo_mode_disable>}
		endif
		onlinelobbyinterface :desc_resolvealias \{name = alias_preferences}
		<resolved_id> :se_setprops {
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose ui_menu_select_sfx}
				{pad_choose start_net_preferences}
			]
		}
		<resolved_id> :settags msg_checksum = preferences
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
	netoptions :pref_getstruct \{name = game_modes}
	is_gamemode_visible search_mode = (<pref_struct>.search_chk)
	if (<item_is_visible>)
		return
	endif
	netoptions :pref_size \{name = game_modes}
	i = 0
	begin
	netoptions :pref_getstruct name = game_modes index = <i>
	is_gamemode_visible search_mode = (<pref_struct>.search_chk)
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
	requireparams \{[
			search_mode
		]
		all}
	<returnvalue> = 0
	get_visible_game_modes
	if arraycontains array = <modes> contains = <search_mode>
		<returnvalue> = 1
	endif
	return item_is_visible = <returnvalue>
endscript

script get_visible_game_modes 
	available_modes = [
		p2_pro_faceoff
		p4_pro_faceoff
		p2_faceoff
		p2_battle
		p2_coop
		p4_quickplay
		p8_pro_faceoff
	]
	return modes = <available_modes>
endscript

script try_select_gamemode 
	requireparams \{[
			device_num
			title
		]
		all}
	if (<device_num> = $primary_controller)
		ui_menu_select_sfx
		create_gamemode_submenu <...>
	else
		menu_scroll_end_sound
	endif
endscript

script create_gamemode_submenu \{title = qs(0xae01dcbe)}
	obj_getid
	launchevent \{type = unfocus
		target = current_menu}
	<objid> :se_getprops
	getscreenelementposition id = <objid> absolute
	createscreenelement {
		type = descinterface
		parent = onlinelobbyinterface
		desc = 'online_lobby_submenu'
		pos = <screenelementpos>
		id = onlinesubmenuinterface
		exclusive_device = <device_num>
		z_priority = (<z_priority> + 1)
		tags = {
			menu_index = 0
			menu_items = 0
			player_num = <info_index>
			exit_script = <exit_script>
			scrollbar_id = null
		}
	}
	onlinesubmenuinterface :se_setprops \{title_text = qs(0x876172e8)}
	create_submenu_fade submenu_z = (<z_priority> + 1) fade_id = game_mode_submenu_fade
	if onlinesubmenuinterface :desc_resolvealias \{name = alias_online_lobby_scrollbar
			param = scrollbar_id}
		onlinesubmenuinterface :settags scrollbar_id = <scrollbar_id>
	endif
	if onlinesubmenuinterface :desc_resolvealias \{name = alias_popup_vmenu
			param = popup_vmenu}
		<popup_vmenu> :se_setprops {
			event_handlers = [
				{pad_back generic_menu_pad_back_sound}
				{pad_back destroy_gamemode_submenu params = {container_id = onlinesubmenuinterface vmenu_id = <popup_vmenu>}}
				{pad_up generic_menu_up_or_down_sound}
				{pad_up online_lobby_submenu_up}
				{pad_down generic_menu_up_or_down_sound}
				{pad_down online_lobby_submenu_down}
			]
		}
		netoptions :pref_getstruct \{name = game_modes}
		if gotparam \{pref_struct}
			<checksum> = (<pref_struct>.search_chk)
		endif
		<current_index> = 0
		netoptions :pref_size \{name = game_modes}
		i = 0
		<menu_index> = 0
		<item_is_visible> = 1
		begin
		netoptions :pref_getstruct name = game_modes index = <i>
		if structurecontains structure = <pref_struct> func
			(<pref_struct>.func) search_mode = (<pref_struct>.search_chk)
		endif
		if (<item_is_visible>)
			if (<checksum> = <pref_struct>.search_chk)
				<current_index> = <menu_index>
			endif
			add_game_mode_item_to_submenu {
				vmenu_id = <popup_vmenu>
				gamemode_text = (<pref_struct>.name)
				choose_script_params = {
					base_text = <base_text>
					text = (<pref_struct>.name)
					text_id = <text_id>
					mode_checksum = (<pref_struct>.checksum)
					container_id = onlinesubmenuinterface
					vmenu_id = <subvmenu_id>
					parent_id = <vmenu_id>
				}
			}
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
	endif
	clean_up_user_control_helpers
	menu_finish
	if gotparam \{title}
		switch <title>
			case qs(0x876172e8)
			soundevent \{event = online_panel_in}
		endswitch
	endif
	onlinesubmenuinterface :obj_spawnscriptnow animate_submenu_transition params = {direction = in id = onlinesubmenuinterface focus_id = <popup_vmenu> focus_index = <current_index>}
endscript

script destroy_gamemode_submenu 
	turn_off_highlight
	if current_menu_anchor :desc_resolvealias \{name = alias_spinner}
		<resolved_id> :se_setprops alpha = 0.0
	endif
	if NOT ((gotparam container_id) || (gotparam vmenu_id) || (gotparam parent_id))
		return
	endif
	if screenelementexists id = <vmenu_id>
		launchevent type = unfocus target = <vmenu_id>
	endif
	if screenelementexists \{id = onlinesubmenuinterface}
		animate_submenu_transition \{id = onlinesubmenuinterface
			direction = out}
		destroyscreenelement \{id = onlinesubmenuinterface}
		online_lobby_transition_in
	endif
	destroy_submenu_fade \{fade_id = game_mode_submenu_fade}
	adjust_highlight_z \{z_pri = 2}
endscript

script create_submenu_fade 
	requireparams \{[
			submenu_z
			fade_id
		]}
	destroy_submenu_fade fade_id = <fade_id>
	if screenelementexists \{id = onlinelobbyinterface}
		createscreenelement {
			type = spriteelement
			id = <fade_id>
			parent = onlinelobbyinterface
			pos_anchor = [center center]
			rgba = [0 0 0 255]
			pos = (0.0, 0.0)
			dims = (1500.0, 1000.0)
			alpha = 0.4
			z_priority = (<submenu_z> - 0.01)
			tags = [debug_me]
		}
	endif
endscript

script destroy_submenu_fade 
	requireparams \{[
			fade_id
		]}
	if screenelementexists id = <fade_id>
		destroyscreenelement id = <fade_id>
	endif
endscript

script select_gamemode 
	if gotparam \{text_id}
		if screenelementexists id = <text_id>
			formattext textname = new_string qs(0x3080c264) s = <base_text> d = <text>
			setscreenelementprops id = <text_id> text = <new_string>
			netoptions :pref_choose name = game_modes checksum = <mode_checksum>
			if netsessionfunc \{obj = party
					func = is_host}
				netoptions :pref_get \{name = game_modes}
				netsessionfunc obj = party func = append_shared_data params = {data = {game_mode = <mode_checksum>}}
			endif
		endif
	endif
	destroy_gamemode_submenu container_id = <container_id> vmenu_id = <vmenu_id>
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

script add_game_mode_item_to_submenu 
	requireparams \{[
			vmenu_id
		]
		all}
	<vmenu_id> :se_getprops
	z_priority = (<z_priority> + 5)
	createscreenelement {
		type = textblockelement
		parent = <vmenu_id>
		dims = (320.0, 44.0)
		font = text_a1
		rgba = ($online_lobby_item_text_color)
		text = <gamemode_text>
		just = [left center]
		z_priority = <z_priority>
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = `per axis`
		event_handlers = [
			{focus gamemode_change_focus params = {focus}}
			{unfocus gamemode_change_focus params = {unfocus}}
			{pad_choose ui_menu_select_sfx}
			{pad_choose select_gamemode params = <choose_script_params>}
		]
	}
	if screenelementexists \{id = onlinesubmenuinterface}
		onlinesubmenuinterface :gettags
		onlinesubmenuinterface :settags menu_items = (<menu_items> + 1)
	endif
endscript

script gamemode_change_focus 
	obj_getid
	<objid> :gettags
	if gotparam \{focus}
		se_setprops rgba = ($menu_focus_color)
		if current_menu_anchor :desc_resolvealias \{name = alias_spinner}
			<resolved_id> :se_setprops alpha = 1.0
			<objid> :menu_focus_set_highlight spinner_offset = -10
		endif
	elseif gotparam \{unfocus}
		turn_off_highlight
		se_setprops rgba = ($menu_unfocus_color)
		if current_menu_anchor :desc_resolvealias \{name = alias_spinner}
			<resolved_id> :se_setprops alpha = 0.0
		endif
	endif
endscript

script matchmaking_item_change_focus 
	obj_getid
	<objid> :gettags
	if gotparam \{focus}
		if gotparam \{msg_checksum}
			set_net_dialog_message msg_checksum = <msg_checksum>
		endif
		se_setprops rgba = ($menu_focus_color)
		if current_menu_anchor :desc_resolvealias \{name = alias_spinner}
			<resolved_id> :se_setprops alpha = 1.0
			obj_getid
			<objid> :menu_focus_set_highlight spinner_offset = -15
		endif
	elseif gotparam \{unfocus}
		if current_menu_anchor :desc_resolvealias \{name = alias_spinner}
			<resolved_id> :se_setprops alpha = 0.0
		endif
		se_setprops rgba = ($menu_unfocus_color)
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
			onlinelobbyinterface :se_setprops net_info_text = ($<plat_helper_strings>.<appended_id>)
		endif
	elseif structurecontains structure = ($net_helper_text_strings) <appended_id>
		if screenelementexists \{id = onlinelobbyinterface}
			onlinelobbyinterface :se_setprops net_info_text = ($net_helper_text_strings.<appended_id>)
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
	if onlinelobbyinterface :desc_resolvealias \{name = alias_online_lobby_right_side}
		if <resolved_id> :desc_resolvealias name = alias_player_slots_menu
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
	if gotparam \{focus}
		se_setprops player_slot_rgba = ($menu_focus_color)
		if current_menu_anchor :desc_resolvealias \{name = alias_spinner}
			<resolved_id> :se_setprops alpha = 1.0
			<objid> :menu_focus_set_highlight
		endif
		if gotparam \{msg_checksum}
			set_net_dialog_message msg_checksum = <msg_checksum>
		endif
		if gotparam \{view_gamer_card}
			online_lobby_setup_helper_controls menu_type = right_hand gamer_card = <view_gamer_card>
		endif
		post_game_nudge = (0.0, 0.0)
		if gotparam \{post_game}
			<post_game_nudge> = (15.0, 0.0)
		endif
	elseif gotparam \{unfocus}
		turn_off_highlight
		if current_menu_anchor :desc_resolvealias \{name = alias_spinner}
			<resolved_id> :se_setprops alpha = 0.0
		endif
		se_setprops player_slot_rgba = ($menu_unfocus_color)
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
		desc = 'online_lobby_player_slot'
		parent = <player_slots_menu_id>
		auto_dims = false
		dims = (450.0, 55.0)
		event_handlers = [
			{focus player_slot_change_focus params = {focus view_gamer_card = <view_gamer_card>}}
			{unfocus player_slot_change_focus params = {unfocus}}
		]
	}
	<id> :se_setprops {
		player_slot_name_text = <name>
		player_instrument_logo_texture = <controller_texture>
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
	begin
	if screenelementexists id = <obj_id>
		if NOT (netsessionfunc obj = voice func = hasheadset params = {player_xuid = <uid>})
			headset_icon_alpha = 0
		elseif (netsessionfunc obj = voice func = istalking params = {player_xuid = <uid>})
			headset_icon_alpha = 1.0
		else
			headset_icon_alpha = 0.5
		endif
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
	getactivecontrollers \{include_signed_in}
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
	if onlinelobbyinterface :desc_resolvealias \{name = alias_online_lobby_right_side}
		if <resolved_id> :desc_resolvealias name = alias_player_slots_menu
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
	printscriptinfo \{qs(0x90b9f43d)}
	requireparams \{[
			controller_index
		]
		all}
	get_savegame_from_controller controller = <controller_index>
	if gotparam \{player_status_index}
		net_load_saved_settings player_status_index = <player_status_index> controller = <controller_index> savegame = <savegame>
		get_controller_part controller = <controller_index>
		get_last_band_character_recorded player = <player_status_index> part = <controller_part> no_band_leader_grab
		printf qs(0xdb12ad0a) a = <controller_index> d = <player_status_index> c = <character_id>
		if (<character_id> = none)
			printf qs(0xd3d10873) a = <controller_index>
			cas_get_random_preset_character savegame = <savegame> part = <controller_part>
		endif
		setplayerinfo <player_status_index> character_id = <character_id>
	else
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
					net_load_saved_settings player_status_index = <index> controller = <controller_index> savegame = <savegame>
				endif
				get_controller_part controller = <controller_index>
				get_last_band_character_recorded player = <index> part = <controller_part> no_band_leader_grab borrowed_from_band_leader = <borrowed_from_band_leader>
				printf qs(0xba8e7aca) a = <controller_index> b = <character_id> c = <index>
				if (<character_id> = none)
					printf qs(0xc6807fb5) a = <controller_index>
					cas_get_random_preset_character savegame = <savegame> part = <controller_part>
				endif
				setplayerinfo <index> character_id = <character_id>
			endif
		endif
		index = (<index> + 1)
		repeat 8
	endif
endscript

script net_load_saved_settings 
	printf \{qs(0xd801a0ef)}
	restore_globals_from_global_tags savegame = <savegame>
	getglobaltags savegame = <savegame> user_options param = lefty_flip_save
	setplayerinfo <player_status_index> lefty_flip = <lefty_flip_save>
	setplayerinfo <player_status_index> lefthanded_gems = <lefty_flip_save>
	setplayerinfo <player_status_index> lefthanded_button_ups = <lefty_flip_save>
	setplayerinfo <player_status_index> lefthanded_button_ups_flip_save = <lefty_flip_save>
	setplayerinfo <player_status_index> lefthanded_gems_flip_save = <lefty_flip_save>
	setplayerinfo <player_status_index> difficulty = ($default_difficulty [<controller>])
	printstruct <...>
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
				change \{respond_to_signin_changed_all_players = 1}
				netsessionfunc \{obj = party
					func = get_shared_data}
				formattext checksumname = player_data 'player_%d' d = ((<connections> [<index>]).party_id)
				printf qs(0x73d390b5) d = ((<connections> [<index>]).party_id)
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
			netoptions :pref_choose name = game_modes checksum = (<party_shared_data>.game_mode)
			netoptions :pref_get \{name = game_modes}
			formattext textname = game_mode_text qs(0xed77b849) d = <display_string>
			if screenelementexists \{id = onlinelobbyinterface}
				onlinelobbyinterface :se_setprops {
					matchmaking_game_mode_text = <game_mode_text>
				}
			endif
		endif
	else
		netoptions :pref_get \{name = game_modes}
		netsessionfunc obj = party func = append_shared_data params = {data = {game_mode = <checksum>}}
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
	if onlinelobbyinterface :desc_resolvealias \{name = alias_online_lobby_right_side}
		if <resolved_id> :desc_resolvealias name = alias_player_slots_menu
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
	endif
endscript

script check_for_signin_signin_change \{controller_index = -1}
	if onlinelobbyinterface :desc_resolvealias \{name = alias_online_lobby_right_side}
		if <resolved_id> :desc_resolvealias name = alias_player_slots_menu
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
			printf qs(0xa2ea699f) d = <player_type> b = <index>
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
			printf qs(0x06069656) d = <player_type> b = <index>
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
			printf qs(0x80014c68) d = <player_type> b = <index>
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
	printf \{qs(0x476fbcbb)}
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
		net_load_saved_settings player_status_index = (<available_slot> + 1) controller = <index> savegame = <savegame>
		get_controller_part controller = <index>
		get_last_band_character_recorded player = (<available_slot> + 1) part = <controller_part> no_band_leader_grab
		printf qs(0x8033f563) a = <index> d = (<available_slot> + 1) c = <character_id>
		if (<character_id> = none)
			printf qs(0xd3d10873) a = <index>
			cas_get_random_preset_character savegame = <savegame> part = <controller_part>
		endif
		setplayerinfo (<available_slot> + 1) character_id = <character_id>
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
	printstruct <...>
	if gotparam \{name}
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
	printf qs(0x76aab8a7) d = <slot>
	return available_slot = <slot>
endscript

script shift_player_slots 
	printf qs(0x33ef93f3) d = <starting_point>
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
	getplayerinfo (<i> + 1) character_id
	getplayerinfo (<i> + 1) difficulty
	getplayerinfo (<i> + 1) double_kick_drum
	getplayerinfo (<i> + 1) lefty_flip
	getplayerinfo (<i> + 1) lefthanded_gems
	getplayerinfo (<i> + 1) lefthanded_button_ups
	getplayerinfo (<i> + 1) lefthanded_button_ups_flip_save
	getplayerinfo (<i> + 1) lefthanded_gems_flip_save
	getplayerinfo (<i> + 1) vocals_highway_view
	getplayerinfo (<i> + 1) vocals_sp_clap
	getplayerinfo (<i> + 1) use_tilt_for_starpower
	getplayerinfo (<i> + 1) enable_touch_strip
	formattext checksumname = gamertag 'gamertag_%d' d = (<i>)
	current_net_info = {
		net_id_first = <net_id_first>
		net_id_second = <net_id_second>
		gamertag = ($<gamertag>)
		controller = <controller>
		is_local = <is_local_client>
		part = <part>
		earnings = <career_earnings>
		character_id = <character_id>
		difficulty = <difficulty>
		double_kick_drum = <double_kick_drum>
		lefty_flip = <lefty_flip>
		lefthanded_gems = <lefthanded_gems>
		lefthanded_button_ups = <lefthanded_button_ups>
		lefthanded_button_ups_flip_save = <lefthanded_button_ups_flip_save>
		lefthanded_gems_flip_save = <lefthanded_gems_flip_save>
		vocals_highway_view = <vocals_highway_view>
		vocals_sp_clap = <vocals_sp_clap>
		use_tilt_for_starpower = <use_tilt_for_starpower>
		enable_touch_strip = <enable_touch_strip>
	}
	formattext checksumname = gamertag 'gamertag_%d' d = (<i> + 1)
	getplayerinfo (<i> + 2) net_id_first
	getplayerinfo (<i> + 2) net_id_second
	getplayerinfo (<i> + 2) controller
	getplayerinfo (<i> + 2) is_local_client
	getplayerinfo (<i> + 2) part
	getplayerinfo (<i> + 2) career_earnings
	getplayerinfo (<i> + 2) character_id
	getplayerinfo (<i> + 2) difficulty
	getplayerinfo (<i> + 2) double_kick_drum
	getplayerinfo (<i> + 2) lefty_flip
	getplayerinfo (<i> + 2) lefthanded_gems
	getplayerinfo (<i> + 2) lefthanded_button_ups
	getplayerinfo (<i> + 2) lefthanded_button_ups_flip_save
	getplayerinfo (<i> + 2) lefthanded_gems_flip_save
	getplayerinfo (<i> + 2) vocals_highway_view
	getplayerinfo (<i> + 2) vocals_sp_clap
	getplayerinfo (<i> + 2) use_tilt_for_starpower
	getplayerinfo (<i> + 2) enable_touch_strip
	next_net_info = {
		net_id_first = <net_id_first>
		net_id_second = <net_id_second>
		gamertag = ($<gamertag>)
		controller = <controller>
		is_local = <is_local_client>
		part = <part>
		earnings = <career_earnings>
		character_id = <character_id>
		difficulty = <difficulty>
		double_kick_drum = <double_kick_drum>
		lefty_flip = <lefty_flip>
		lefthanded_gems = <lefthanded_gems>
		lefthanded_button_ups = <lefthanded_button_ups>
		lefthanded_button_ups_flip_save = <lefthanded_button_ups_flip_save>
		lefthanded_gems_flip_save = <lefthanded_gems_flip_save>
		vocals_highway_view = <vocals_highway_view>
		vocals_sp_clap = <vocals_sp_clap>
		use_tilt_for_starpower = <use_tilt_for_starpower>
		enable_touch_strip = <enable_touch_strip>
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
		character_id = (<next_net_info>.character_id)
		difficulty = (<next_net_info>.difficulty)
		double_kick_drum = (<next_net_info>.double_kick_drum)
		lefty_flip = (<next_net_info>.lefty_flip)
		lefthanded_gems = (<next_net_info>.lefthanded_gems)
		lefthanded_button_ups = (<next_net_info>.lefthanded_button_ups)
		lefthanded_button_ups_flip_save = (<next_net_info>.lefthanded_button_ups_flip_save)
		lefthanded_gems_flip_save = (<next_net_info>.lefthanded_gems_flip_save)
		vocals_highway_view = (<next_net_info>.vocals_highway_view)
		vocals_sp_clap = (<next_net_info>.vocals_sp_clap)
		use_tilt_for_starpower = (<next_net_info>.use_tilt_for_starpower)
		enable_touch_strip = (<next_net_info>.enable_touch_strip)
	}
	getplayerinfo (<i> + 3) net_id_first
	getplayerinfo (<i> + 3) net_id_second
	getplayerinfo (<i> + 3) controller
	getplayerinfo (<i> + 3) is_local_client
	getplayerinfo (<i> + 3) part
	getplayerinfo (<i> + 3) career_earnings
	getplayerinfo (<i> + 3) character_id
	getplayerinfo (<i> + 3) difficulty
	getplayerinfo (<i> + 3) double_kick_drum
	getplayerinfo (<i> + 3) lefty_flip
	getplayerinfo (<i> + 3) lefthanded_gems
	getplayerinfo (<i> + 3) lefthanded_button_ups
	getplayerinfo (<i> + 3) lefthanded_button_ups_flip_save
	getplayerinfo (<i> + 3) lefthanded_gems_flip_save
	getplayerinfo (<i> + 3) vocals_highway_view
	getplayerinfo (<i> + 3) vocals_sp_clap
	getplayerinfo (<i> + 3) use_tilt_for_starpower
	getplayerinfo (<i> + 3) enable_touch_strip
	formattext checksumname = gamertag 'gamertag_%d' d = (<i> + 2)
	next_net_info = {
		net_id_first = <net_id_first>
		net_id_second = <net_id_second>
		gamertag = ($<gamertag>)
		controller = <controller>
		is_local = <is_local_client>
		part = <part>
		earnings = <career_earnings>
		character_id = <character_id>
		difficulty = <difficulty>
		double_kick_drum = <double_kick_drum>
		lefty_flip = <lefty_flip>
		lefthanded_gems = <lefthanded_gems>
		lefthanded_button_ups = <lefthanded_button_ups>
		lefthanded_button_ups_flip_save = <lefthanded_button_ups_flip_save>
		lefthanded_gems_flip_save = <lefthanded_gems_flip_save>
		vocals_highway_view = <vocals_highway_view>
		vocals_sp_clap = <vocals_sp_clap>
		use_tilt_for_starpower = <use_tilt_for_starpower>
		enable_touch_strip = <enable_touch_strip>
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
	setplayerinfo <destination_index> character_id = (<info>.character_id)
	setplayerinfo <destination_index> difficulty = (<info>.difficulty)
	setplayerinfo <destination_index> double_kick_drum = (<info>.double_kick_drum)
	setplayerinfo <destination_index> lefty_flip = (<info>.lefty_flip)
	setplayerinfo <destination_index> lefthanded_gems = (<info>.lefty_flip)
	setplayerinfo <destination_index> lefthanded_button_ups = (<info>.lefty_flip)
	setplayerinfo <destination_index> lefthanded_button_ups_flip_save = (<info>.lefty_flip)
	setplayerinfo <destination_index> lefthanded_gems_flip_save = (<info>.lefty_flip)
	setplayerinfo <destination_index> vocals_highway_view = (<info>.vocals_highway_view)
	setplayerinfo <destination_index> vocals_sp_clap = (<info>.vocals_sp_clap)
	setplayerinfo <destination_index> use_tilt_for_starpower = (<info>.use_tilt_for_starpower)
	setplayerinfo <destination_index> enable_touch_strip = (<info>.enable_touch_strip)
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
				create_loading_screen
				generic_event_back \{state = uistate_mainmenu}
			endif
		else
			netsessionfunc func = removecontroller params = {controller = <device_num>}
			update_signed_in_controllers
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
		texture = online_load_wheel
		pos = (654.0, 440.0)
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
	onlinelobbyinterface :gettags
	if screenelementexists id = <player_slots_menu_id>
		launchevent type = unfocus target = <player_slots_menu_id>
	endif
	destroy_popup_warning_menu
	create_popup_warning_menu \{title = qs(0xddccf0c3)
		textblock = {
			text = qs(0x00000000)
		}
		parent = onlinelobbyinterface
		no_background}
	createscreenelement \{type = spriteelement
		parent = popupelement
		texture = online_load_wheel
		pos = (654.0, 440.0)
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
		if (<players_found> = 1)
			formattext textname = message qs(0xf9d8c389) d = <players_found>
		else
			formattext textname = message qs(0xec3e63e5) d = <players_found>
		endif
	endif
	if screenelementexists \{id = popupelement}
		if NOT screenelementexists \{id = playersfoundtext}
			createscreenelement {
				type = textblockelement
				parent = popupelement
				id = playersfoundtext
				font = fontgrid_text_3
				rgba = [0 0 0 255]
				text = <message>
				pos = (650.0, 260.0)
				just = [center top]
				internal_just = [center top]
				internal_scale = 0.8
				z_priority = 605
				dims = (500.0, 120.0)
				single_line = false
				fit_width = wrap
				fit_height = `scale down if larger`
			}
		else
			playersfoundtext :se_setprops text = <message>
		endif
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
	set_focus_color
	set_unfocus_color
endscript

script update_players_found 
	players_found = 0
	<time_waited> = 0
	begin
	<players_found> = 0
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
		if (<players_found> = 1)
			formattext textname = message qs(0xf9d8c389) d = <players_found>
		else
			formattext textname = message qs(0xec3e63e5) d = <players_found>
		endif
	endif
	if screenelementexists \{id = popupelement}
		if NOT screenelementexists \{id = playersfoundtext}
			createscreenelement {
				type = textblockelement
				parent = popupelement
				id = playersfoundtext
				font = fontgrid_text_3
				rgba = [0 0 0 255]
				text = <message>
				pos = (650.0, 260.0)
				just = [center top]
				internal_just = [center top]
				internal_scale = 0.8
				z_priority = 605
				dims = (500.0, 120.0)
				single_line = false
				fit_width = wrap
				fit_height = `scale down if larger`
			}
		else
			playersfoundtext :se_setprops text = <message>
		endif
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
			getactivecontrollers \{include_signed_in}
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
			if onlinelobbyinterface :desc_resolvealias \{name = alias_start_matchmaking}
				<resolved_id> :se_setprops {exclusive_device = <signed_in_controllers>}
			endif
			if onlinelobbyinterface :desc_resolvealias \{name = alias_game_mode}
				<resolved_id> :se_setprops {exclusive_device = <signed_in_controllers>}
			endif
			if onlinelobbyinterface :desc_resolvealias \{name = alias_friends}
				<resolved_id> :se_setprops {exclusive_device = <signed_in_controllers>}
			endif
			if onlinelobbyinterface :desc_resolvealias \{name = alias_preferences}
				<resolved_id> :se_setprops {exclusive_device = <signed_in_controllers>}
			endif
		endif
		if onlinelobbyinterface :desc_resolvealias \{name = alias_online_lobby_right_side}
			if <resolved_id> :desc_resolvealias name = alias_player_slots_menu
				<resolved_id> :se_setprops {exclusive_device = <signed_in_controllers>}
			endif
		endif
	endif
endscript
signin_unpause_flag = 0

script signin_or_join_game 
	requireparams \{[
			device_num
		]
		all}
	if netsessionfunc \{obj = party
			func = is_host}
		if ($net_starting_matchmaking = 0)
			change \{net_block_matchmaking = 1}
			launchevent \{type = unfocus
				target = online_lobby_signin_container}
			if NOT (party_is_full)
				if isxenon
					if NOT checkforsignin controller_index = <device_num> dont_set_primary
						generic_menu_pad_choose_sound
						if onlinelobbyinterface :desc_resolvealias \{name = alias_online_lobby_right_side}
							if <resolved_id> :desc_resolvealias name = alias_player_slots_menu
								<resolved_id> :obj_killspawnedscript name = update_player_slots_ui
							endif
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
						if onlinelobbyinterface :desc_resolvealias \{name = alias_online_lobby_right_side}
							if <resolved_id> :desc_resolvealias name = alias_player_slots_menu
								<resolved_id> :obj_spawnscriptnow update_player_slots_ui
							endif
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
					if onlinelobbyinterface :desc_resolvealias \{name = alias_online_lobby_right_side}
						if <resolved_id> :desc_resolvealias name = alias_player_slots_menu
							<resolved_id> :obj_killspawnedscript name = update_player_slots_ui
						endif
					endif
					if NOT checkforsignin controller_index = <device_num> dont_set_primary
						if netsessionfunc func = showsigninui params = {controller_index = <device_num> flag = signin_unpause_flag}
							wait_for_sysnotify_unpause \{unpause_flag = signin_unpause_flag}
							netsessionfunc func = subsignin params = {controller = <device_num> flag = signin_unpause_flag}
							wait_for_sysnotify_unpause \{unpause_flag = signin_unpause_flag}
							netsessionfunc func = subsignincomplete params = {controller = <device_num>}
						endif
						change \{need_to_refresh_player_slots = 1}
					endif
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
					if onlinelobbyinterface :desc_resolvealias \{name = alias_online_lobby_right_side}
						if <resolved_id> :desc_resolvealias name = alias_player_slots_menu
							<resolved_id> :obj_spawnscriptnow update_player_slots_ui
						endif
					endif
				endif
			endif
			launchevent \{type = focus
				target = online_lobby_signin_container}
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
		set_focus_color
		set_unfocus_color
		if screenelementexists \{id = popupelement}
			popupelement :obj_spawnscriptnow \{wait_and_kill_vocals_warning_popup}
		endif
	endif
endscript

script wait_and_kill_vocals_warning_popup 
	wait \{3.0
		seconds}
	destroy_net_popup
	set_focus_color
	set_unfocus_color
	online_lobby_setup_helper_controls
endscript

script set_gamemode_by_instrument 
	requireparams \{[
			device_num
		]
		all}
	printf \{qs(0x736042ba)}
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
	getplayerinfo <player_num> part
	search_checksum = p2_pro_faceoff
	netoptions :pref_get \{name = game_modes}
	if (<checksum> = p2_pro_faceoff)
		switch (<part>)
			case guitar
			search_checksum = p2_pro_faceoff
			case bass
			search_checksum = p2_pro_faceoff_bass
			case drum
			search_checksum = p2_pro_faceoff_drums
		endswitch
	elseif (<checksum> = p2_faceoff)
		switch (<part>)
			case guitar
			search_checksum = p2_faceoff
			case bass
			search_checksum = p2_faceoff_bass
			case drum
			search_checksum = mode_extra_1
		endswitch
	endif
	set_game_mode_by_search_mode search_checksum = <search_checksum>
	netoptions :pref_getstruct \{name = game_modes}
	printf qs(0x6473d26f) d = <player_num> s = <part> g = (<pref_struct>.search_chk)
endscript

script set_game_mode_by_search_mode 
	requireparams \{[
			search_checksum
		]
		all}
	netoptions :pref_size \{name = game_modes}
	found = 0
	i = 0
	begin
	netoptions :pref_getstruct name = game_modes index = <i>
	if (<pref_struct>.search_chk = <search_checksum>)
		printf \{qs(0x2a6a3f62)}
		netoptions :pref_choose name = game_modes index = <i>
		<found> = 1
		break
	endif
	<i> = (<i> + 1)
	repeat <size>
	if (<found> = 1)
		if netsessionfunc \{obj = party
				func = is_host}
			netoptions :pref_get \{name = game_modes}
			netsessionfunc obj = party func = append_shared_data params = {data = {game_mode = <index>}}
		endif
	else
		scriptassert qs(0x32e227bd) d = <search_checksum>
	endif
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
				netoptions :pref_get \{name = game_modes}
				if ((<checksum> = p2_pro_faceoff) || (<checksum> = p2_faceoff))
					set_gamemode_by_instrument device_num = <device_num>
					netoptions :pref_getstruct \{name = game_modes}
					netsessionfunc obj = party func = append_shared_data params = {data = {search_chk = (<pref_struct>.search_chk)}}
				endif
				if is_valid_instrument_config
					set_characters_by_controller
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
							netoptions :pref_getstruct \{name = game_modes}
							search_mode = (<pref_struct>.search_chk)
							if (<search_mode> = p2_faceoff || <search_mode> = p2_pro_faceoff || <search_mode> = p2_battle)
								part = guitar
							elseif (<search_mode> = p2_pro_faceoff_bass || <search_mode> = p2_faceoff_bass)
								part = bass
							endif
							if gotparam \{part}
								netsessionfunc \{obj = party
									func = get_party_members}
								getarraysize <connections>
								if (<array_size> > 0)
									index = 0
									begin
									is_net_player_in_struct {
										user_id_first = ((<connections> [<index>]).user_id [0])
										user_id_second = ((<connections> [<index>]).user_id [1])
										controller_index = ((<connections> [<index>]).controller_index)
									}
									if (<player_in_struct> = 1)
										setplayerinfo <info_index> part = <part>
									endif
									<index> = (<index> + 1)
									repeat <array_size>
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
	getactivecontrollers \{include_signed_in}
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
	if (<array_size> = 0)
		printf \{qs(0x0f2e43f8)}
		return \{true}
	endif
	printf \{qs(0xd100e014)}
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
	set_focus_color
	set_unfocus_color
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
			getplayerinfo (<j> + 1) character_id
			getplayerinfo (<j> + 1) difficulty
			getplayerinfo (<j> + 1) double_kick_drum
			getplayerinfo (<j> + 1) lefty_flip
			getplayerinfo (<j> + 1) lefthanded_gems
			getplayerinfo (<j> + 1) lefthanded_button_ups
			getplayerinfo (<j> + 1) lefthanded_button_ups_flip_save
			getplayerinfo (<j> + 1) lefthanded_gems_flip_save
			getplayerinfo (<j> + 1) vocals_highway_view
			getplayerinfo (<j> + 1) vocals_sp_clap
			getplayerinfo (<j> + 1) use_tilt_for_starpower
			getplayerinfo (<j> + 1) enable_touch_strip
			add_remove_player_to_net_ui action = remove ui_slot = <j> index = <controller> player_type = local_signed_in
			add_remove_player_to_net_ui action = add index = <controller> player_type = local_signed_in part = <part>
			get_controller_corresponding_ui_slot controller = <controller>
			if (<ui_slot> != -1)
				setplayerinfo (<ui_slot> + 1) character_id = <character_id>
				setplayerinfo (<ui_slot> + 1) difficulty = <difficulty>
				setplayerinfo (<ui_slot> + 1) double_kick_drum = <double_kick_drum>
				setplayerinfo (<ui_slot> + 1) lefty_flip = <lefty_flip>
				setplayerinfo (<ui_slot> + 1) lefthanded_gems = <lefthanded_gems>
				setplayerinfo (<ui_slot> + 1) lefthanded_button_ups = <lefthanded_button_ups>
				setplayerinfo (<ui_slot> + 1) lefthanded_button_ups_flip_save = <lefthanded_button_ups_flip_save>
				setplayerinfo (<ui_slot> + 1) lefthanded_gems_flip_save = <lefthanded_gems_flip_save>
				setplayerinfo (<ui_slot> + 1) vocals_highway_view = <vocals_highway_view>
				setplayerinfo (<ui_slot> + 1) vocals_sp_clap = <vocals_sp_clap>
				setplayerinfo (<ui_slot> + 1) use_tilt_for_starpower = <use_tilt_for_starpower>
				setplayerinfo (<ui_slot> + 1) enable_touch_strip = <enable_touch_strip>
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

script dlc_warning_message 
	if isps3
		message_text = qs(0x965a49fd)
	else
		message_text = qs(0x9d749acd)
	endif
	create_online_warning_message message = <message_text> alpha = 0.0 pos = (360.0, 180.0)
	display_online_warning_message \{wait_time = 3.0}
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
			onlinelobbyinterface :se_setprops net_info_text = (<timer_msg>)
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
	getplayerinfo <index> career_earnings
	cash_get_info_from_earnings earnings = <career_earnings>
	getplayerinfo <index> controller
	getplayerinfo <index> is_local_client
	formattext textname = cash_text qs(0x48c6d14c) d = <rank>
	online_lobby_add_player_slot {
		name = <name>
		controller_texture = <icon_texture>
		xuid = <xuid>
		player_slot_rgba = ($menu_unfocus_color)
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
		getactivecontrollers \{include_signed_in}
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
			desc = 'online_lobby_player_slot'
			parent = <parent>
			auto_dims = false
			dims = (450.0, 55.0)
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
		<id> :se_setprops {
			player_slot_name_text = <name>
			player_instrument_logo_texture = <controller_texture>
			player_slot_rgba = <player_slot_rgba>
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
				change \{net_career_invite_flag = 0}
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

script host_start_player_settings_sync 
	host = ishost
	printf qs(0x9fd2ef3c) d = <host>
	printf \{qs(0x64ef8314)
		d = $net_num_player_settings_ack}
	printf \{qs(0xe1d27318)
		d = $net_num_players}
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
		else
			i = 1
			num_loc = 0
			num_local_players = 4
			begin
			formattext checksumname = player_status 'player%d_status' d = <i>
			if ((($<player_status>.is_local_client) = 1) && (($<player_status>.net_obj_id) >= 0))
				num_loc = (<num_loc> + 1)
			endif
			i = (<i> + 1)
			repeat <num_local_players>
			if (<num_loc> = $net_num_players)
				lock_player_parts
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
				player_double_kick = ($<player_status>.double_kick_drum)
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
				player_double_kick = ($<player_status>.double_kick_drum)
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
					setplayerinfo <j> double_kick_drum = (<player_data>.<player_status>.player_double_kick)
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
						player_double_kick = ($<player_status>.double_kick_drum)
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
				setplayerinfo <j> double_kick_drum = (<player_data>.<player_status>.player_double_kick)
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
		if screenelementexists \{id = myinterfaceelement}
			myinterfaceelement :settags \{settings_finalized = 1}
		endif
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

script set_characters_by_controller 
	printf \{qs(0xc3387cce)}
	cont = 0
	begin
	if netsessionfunc func = iscontrolleringame params = {controller = <cont>}
		<player_num> = -1
		<i> = 1
		begin
		getplayerinfo <i> controller
		if (<controller> = <cont>)
			<player_num> = <i>
			break
		endif
		<i> = (<i> + 1)
		repeat 4
		if (<player_num> = -1)
			scriptassert qs(0x8fecf23d) d = <cont>
			return
		else
			printf qs(0x8e5a06ae) a = <player_num> b = <cont>
		endif
		getplayerinfo <player_num> character_id
		get_savegame_from_controller controller = <cont>
		set_band_character_id_globaltag savegame = <savegame> controller = <cont> character_id = <character_id> player = <player_num>
	endif
	cont = (<cont> + 1)
	repeat 4
endscript
matchmaking_hold = 1

script check_matchmaking_start_hold 
	if ($is_shutdown_safe = 0)
		change \{matchmaking_hold = 1}
		return
	endif
	if screenelementexists \{id = popup_warning_container}
		change \{matchmaking_hold = 1}
		return
	endif
	if NOT screenelementexists \{id = onlinelobbyinterface}
		change \{matchmaking_hold = 1}
		return
	endif
	change \{matchmaking_hold = 0}
endscript

script net_party_host_started_matchmaking 
	printf \{qs(0xea82e4e2)}
	netsessionfunc \{obj = party
		func = get_shared_data}
	if structurecontains structure = <party_shared_data> search_chk
		printf qs(0xedf5a4b3) d = (<party_shared_data>.search_chk)
		set_game_mode_by_search_mode search_checksum = (<party_shared_data>.search_chk)
	endif
	set_characters_by_controller
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
		netoptions :pref_getstruct \{name = game_modes}
		search_mode = (<pref_struct>.search_chk)
		if (<search_mode> = p2_faceoff || <search_mode> = p2_pro_faceoff || <search_mode> = p2_battle)
			part = guitar
		elseif (<search_mode> = p2_pro_faceoff_bass || <search_mode> = p2_faceoff_bass)
			part = bass
		endif
		if gotparam \{part}
			netsessionfunc \{obj = party
				func = get_party_members}
			getarraysize <connections>
			if (<array_size> > 0)
				index = 0
				begin
				is_net_player_in_struct {
					user_id_first = ((<connections> [<index>]).user_id [0])
					user_id_second = ((<connections> [<index>]).user_id [1])
					controller_index = ((<connections> [<index>]).controller_index)
				}
				if (<player_in_struct> = 1)
					setplayerinfo <info_index> part = <part>
				endif
				<index> = (<index> + 1)
				repeat <array_size>
			endif
		endif
		refresh_player_slots_ui
		wait \{2
			gameframes}
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
		soundevent \{event = online_panel_in}
		ui_create_friends_list device_num = <device_num> exit_script = online_lobby_transition_in
	endif
endscript

script start_net_preferences 
	if NOT screenelementexists \{id = netprefinterface}
		launchevent \{type = unfocus
			target = current_menu}
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
	printf \{qs(0x6c737fc1)}
	spawnscriptnow matchmaking_countdown_end_game_script_spawned params = {<...>}
endscript

script matchmaking_countdown_end_game_script_spawned 
	ui_event_wait_for_safe
	wait_for_safe_shutdown
	ui_event_get_top
	if (<base_name> = 'setlist')
		printf \{qs(0x95eec34f)}
		setlist_end_game <...>
	else
		printf \{qs(0x6261b3fb)}
		if screenelementexists \{id = onlinelobbyinterface}
			onlinelobbyinterface :obj_killspawnedscript \{name = set_net_ui_to_finished_searching}
			killspawnedscript \{name = set_net_ui_to_finished_searching}
			if onlinelobbyinterface :desc_resolvealias \{name = alias_online_lobby_right_side}
				if <resolved_id> :desc_resolvealias name = alias_player_slots_menu
					launchevent type = unfocus target = <player_slots_menu>
				endif
			endif
		endif
		create_net_popup \{title = qs(0x5ca2c535)
			popup_text = qs(0x32f94482)}
		wait \{3
			seconds}
		destroy_net_popup
		quit_network_game
		refresh_online_lobby
	endif
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

script turn_off_highlight 
	if screenelementexists \{id = onlinelobbyinterface}
		if onlinelobbyinterface :desc_resolvealias \{name = alias_highlight}
		endif
	endif
endscript

script turn_on_highlight 
	if screenelementexists \{id = onlinelobbyinterface}
		if onlinelobbyinterface :desc_resolvealias \{name = alias_highlight}
		endif
	endif
endscript

script adjust_highlight_z \{z_pri = 100}
	printf qs(0x770d926c) s = <z_pri>
	if onlinelobbyinterface :desc_resolvealias \{name = alias_highlight
			param = highlight_bars}
		<highlight_bars> :se_setprops z_priority = <z_pri>
		resolvescreenelementid id = [
			{id = <highlight_bars>}
			{local_id = highlight_scribble_01}
		]
		<resolved_id> :se_setprops z_priority = (<z_pri> + 0.1)
		resolvescreenelementid id = [
			{id = <highlight_bars>}
			{local_id = highlight_scribble_02}
		]
		<resolved_id> :se_setprops z_priority = (<z_pri> + 0.1)
		resolvescreenelementid id = [
			{id = <highlight_bars>}
			{local_id = highlight_scribble_03}
		]
		<resolved_id> :se_setprops z_priority = (<z_pri> + 0.1)
	endif
endscript
