global_should_use_net_debugging = 0
online_lobby_item_text_color = [
	0
	0
	0
	255
]
player_slot_team1 = [
	206
	43
	43
	255
]
player_slot_team2 = [
	17
	65
	132
	255
]
bx_matchmaking_submenu_pos = {
	absolute
	(247.0, 160.0)
}
ps3_chat_warning_text = [
	0
	0
	0
	255
]
default_online_warning_pos = (650.0, 360.0)
net_num_player_settings_ack = 0
net_starting_matchmaking = 0
net_block_matchmaking = 0
online_to_setlist_count = 10
net_num_players = 0
num_local_players = 0
0x3d374000 = 0
0xa038a176 = 0
0xdc5984ad = 0
0x415665db = 0
gamertag_0 = qs(0x00000000)
gamertag_1 = qs(0x00000000)
gamertag_2 = qs(0x00000000)
gamertag_3 = qs(0x00000000)
gamertag_4 = qs(0x00000000)
gamertag_5 = qs(0x00000000)
gamertag_6 = qs(0x00000000)
gamertag_7 = qs(0x00000000)
wii_add_error1 = qs(0x487e301f)
wii_add_error2 = qs(0xbd8bbdc6)
wii_add_error3 = qs(0x186f9d89)
wii_add_error4 = qs(0xfe19d09b)
wii_add_error5 = qs(0x6b57c58a)
net_helper_text_strings = {
	0x07a6596e = qs(0x5ef73051)
	find_a_game_text = qs(0x43b2e373)
	debug_create_match_text = qs(0x10b0727c)
	debug_custom_search_text = qs(0x9d1520dd)
	game_mode_text = qs(0xde03dba6)
	start_matchmaking_text = qs(0x60416b5a)
	0x9f2de921 = qs(0x96e0368a)
	matchmaking_complete_text = qs(0x869701dc)
	friends_text = qs(0x5be77a0e)
	friends_menu_text = qs(0x9825552f)
	timer_5_text = qs(0xbf481dd4)
	timer_4_text = qs(0xa6532c95)
	timer_3_text = qs(0xe912ba52)
	timer_2_text = qs(0xf0098b13)
	timer_1_text = qs(0xdb24d8d0)
	timer_0_text = qs(0xc23fe991)
	0xa4a36430 = qs(0x54a29d26)
	0xc463733d = qs(0x539f0aa6)
	0xc2e641cf = qs(0xa8e9637f)
	0x877d46e7 = qs(0x0d79e9c6)
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
net_helper_text_strings_wii = {
	preferences_text = qs(0x4a4d2521)
	pref_character_text = qs(0x8461b479)
	pref_difficulty_text = qs(0x3c964571)
	pref_lefty_flip_text = qs(0x2f87392c)
	pref_venue_text = qs(0xb00fe2ca)
	pref_vocal_style_text = qs(0x40f0bdb3)
	gamer_card_text = qs(0x00000000)
	postgame_quit_text = qs(0xdf3c37a3)
	log_out_text = qs(0x5ef73051)
	music_store_text = qs(0x4f712e41)
}
has_invite_join_result_callback_completed = 0
need_to_refresh_player_slots = 0
net_no_focus_warning = 0
0x93955a40 = 0
0xd99154a8 = 0

script net_spawned_wait_and_set_joinable 
	if NetSessionFunc \{Obj = party
			func = is_host}
		Wait \{2
			Seconds}
		NetSessionFunc \{Obj = party
			func = set_party_joinable
			params = {
				joinable = 1
			}}
	endif
endscript

script create_net_matchmaking_menu 
	frontend_load_soundcheck \{loadingscreen}
	CreateScreenElement \{parent = root_window
		id = onlinelobbyinterface
		Type = descinterface
		desc = 'online_lobby'
		tags = {
			menu_index = 0
			menu_items = 0
			slots_index = -1
			slot_items = 0
			player_slots_menu_id = 0
			locked_to_players = 0
			toggle_allowed = 1
		}
		log_out_text = qs(0x5ee56993)
		matchmaking_title_text = qs(0x976cf9e7)}
	bx_createhighlightstars \{parent = onlinelobbyinterface}
	onlinelobbyinterface :desc_resolvealias \{Name = alias_matchmaking_vmenu}
	GetScreenElementChildren id = <resolved_id>
	GetArraySize <children>
	c = 0
	begin
	bx_resizetextfield {
		id = (<children> [<c>])
		dims = (480.0, 36.0)
		fit_width = `scale	each	line	if	larger`
	}
	<c> = (<c> + 1)
	repeat <array_Size>
	onlinelobbyinterface :Obj_SpawnScriptNow \{bg_swap}
	AssignAlias id = <id> alias = current_menu_anchor
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
	GetActiveControllers
	GetArraySize <active_controllers>
	i = 0
	begin
	if (<active_controllers> [<i>] = 1)
		if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
			restore_save_net_preferences controller_index = <i>
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	create_matchmaking_menu_and_items
	Wait \{0.5
		Seconds}
	create_player_slots_container
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_local_rockers}
		<resolved_id> :Obj_SpawnScriptNow setup_local_rockers
	endif
	SpawnScriptNow \{task_menu_default_anim_in
		params = {
			base_name = 'band_hub'
		}}
	if isXenon
		create_signin_container
	endif
	Change \{net_no_focus_warning = 0}
	online_lobby_setup_helper_controls
	if GotParam \{accepting_invite}
		create_joining_invite_popup
	else
		if onlinelobbyinterface :desc_resolvealias \{Name = alias_matchmaking_vmenu
				param = vmenu_id}
			AssignAlias id = <vmenu_id> alias = current_menu
			LaunchEvent \{Type = focus
				target = current_menu
				data = {
					child_index = 3
				}}
		endif
	endif
	Change \{0x04788997 = 0}
endscript
default_local_rockers_scale = (0.96999997, 0.9)
local_rockers_off_alpha = 0.3

script setup_local_rockers 
	Obj_GetID
	if <objID> :desc_resolvealias Name = alias_local_rocker_1
		<resolved_id> :Obj_SpawnScriptNow local_rocker_heartbeat params = {controller = 0}
	endif
	if <objID> :desc_resolvealias Name = alias_local_rocker_2
		<resolved_id> :Obj_SpawnScriptNow local_rocker_heartbeat params = {controller = 1}
	endif
	if <objID> :desc_resolvealias Name = alias_local_rocker_3
		<resolved_id> :Obj_SpawnScriptNow local_rocker_heartbeat params = {controller = 2}
	endif
	if <objID> :desc_resolvealias Name = alias_local_rocker_4
		<resolved_id> :Obj_SpawnScriptNow local_rocker_heartbeat params = {controller = 3}
	endif
	begin
	controller = 0
	begin
	update_local_rocker controller = <controller>
	<controller> = (<controller> + 1)
	repeat 4
	Wait \{1
		Second}
	repeat
endscript

script update_local_rocker 
	RequireParams \{[
			controller
		]
		all}
	activate = 1
	box_index = (<controller> + 1)
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_local_rockers
			param = local_rockers}
		formatText checksumName = local_rocker_alias 'alias_local_rocker_%d' d = <box_index>
		formatText checksumName = difficulty_texture 'difficulty%d_texture' d = <box_index>
		formatText checksumName = difficulty_scale 'difficulty%d_scale' d = <box_index>
		formatText checksumName = character_texture 'character%d_texture' d = <box_index>
		formatText checksumName = instrument_texture 'instrument%d_texture' d = <box_index>
		if <local_rockers> :desc_resolvealias Name = <local_rocker_alias> param = this_local_rocker
			if NetSessionFunc func = iscontrolleringame params = {controller = <controller>}
				<this_local_rocker> :se_setprops alpha = 1.0
				get_local_rockers_data device_num = <controller>
				AddParam structure_name = local_rocker_props Name = <difficulty_texture> value = <difficulty_icon>
				AddParam structure_name = local_rocker_props Name = <difficulty_scale> value = <difficulty_scale_value>
				AddParam structure_name = local_rocker_props Name = <character_texture> value = <character_icon>
				AddParam structure_name = local_rocker_props Name = <instrument_texture> value = <instrument_icon>
				<local_rockers> :se_setprops <local_rocker_props>
			else
				<this_local_rocker> :se_setprops alpha = ($local_rockers_off_alpha)
				<this_local_rocker> :se_setprops Scale = ($default_local_rockers_scale)
			endif
		endif
	endif
endscript

script local_rocker_heartbeat 
	RequireParams \{[
			controller
		]
		all}
	Obj_GetID
	<objID> :se_getprops Scale
	original_scale = <Scale>
	high_scale = (<Scale> * 1.025)
	begin
	if NetSessionFunc func = iscontrolleringame params = {controller = <controller>}
		begin
		<objID> :se_setprops Scale = <high_scale> time = 0.05
		<objID> :se_waitprops
		<objID> :se_setprops Scale = <original_scale> time = 0.08
		<objID> :se_waitprops
		Wait \{0.15
			Seconds}
		repeat 2
	endif
	Wait \{0.75
		Second}
	repeat
endscript

script get_local_rockers_data 
	RequireParams \{[
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
				difficulty_icon = setlist_b_db_icon_sm
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
	if (<difficulty_icon> = setlist_b_db_icon)
		difficulty_scale = (1.9, 1.0)
	else
		difficulty_scale = (1.0, 1.0)
	endif
	return difficulty_icon = <difficulty_icon> difficulty_scale_value = <difficulty_scale> instrument_icon = <instrument_icon> character_icon = <icon>
endscript

script online_lobby_setup_helper_controls \{menu_type = left_hand}
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :GetTags
		clean_up_user_control_helpers
		if checksumequals a = left_hand b = <menu_type>
			add_user_control_helper \{text = qs(0xc18d5e76)
				button = green
				z = 100000}
		elseif checksumequals a = right_hand b = <menu_type>
			if isXenon
				if GotParam \{gamer_card}
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
		GetActiveControllers
		GetArraySize <active_controllers>
		i = 0
		begin
		if (<active_controllers> [<i>] = 1)
			if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
				get_controller_type controller_index = <i>
				if (<controller_type> = guitar)
					netoptions :pref_get \{Name = game_modes}
					if NOT (<checksum> = p2_battle)
						add_user_control_helper text = qs(0x0d215c11) button = 0x99d195c9 z = 100000 controller = <i> use_guitar_button = 1
						break
					endif
				endif
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		add_user_control_helper \{text = qs(0x6e1a97ed)
			button = blue
			z = 100000}
	endif
endscript

script online_lobby_animate_in 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Wait \{0.5
		Second}
	SoundEvent \{event = online_main_panel_in}
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :se_setprops \{Pos = (0.0, 30.0)
			time = 0.2
			anim = gentle}
	else
		return
	endif
	Wait \{0.22
		Second}
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :se_setprops \{Pos = (0.0, 0.0)
			time = 0.1
			anim = gentle}
	else
		return
	endif
endscript

script online_lobby_swing 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if (RandomInteger (0.0, 1.0) = 1)
		swing_direction = 1
	else
		swing_direction = -1
	endif
	swing_direction = (<swing_direction> * RandomFloat (0.3, 1.0))
	if ScreenElementExists id = <id>
		<id> :se_setprops rot_angle = (<swing_direction> * 2) anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		Second}
	if ScreenElementExists id = <id>
		<id> :se_setprops rot_angle = (<swing_direction> * -1.75) anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		Second}
	if ScreenElementExists id = <id>
		<id> :se_setprops rot_angle = (<swing_direction> * 1.5) anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		Second}
	if ScreenElementExists id = <id>
		<id> :se_setprops rot_angle = (<swing_direction> * -1.25) anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		Second}
	if ScreenElementExists id = <id>
		<id> :se_setprops rot_angle = (<swing_direction> * 1.0) anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		Second}
	if ScreenElementExists id = <id>
		<id> :se_setprops rot_angle = (<swing_direction> * -0.5) anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		Second}
	if ScreenElementExists id = <id>
		<id> :se_setprops rot_angle = (<swing_direction> * 0.25) anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		Second}
	if ScreenElementExists id = <id>
		<id> :se_setprops rot_angle = 0 anim = gentle time = 0.1
	else
		return
	endif
endscript

script online_lobby_transition_in 
	online_lobby_setup_helper_controls
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if NOT GotParam \{no_focus}
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
endscript

script online_lobby_transition_out 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	menu_transition_out \{menu = current_menu_anchor}
endscript

script destroy_net_matchmaking_menu 
	if ScreenElementExists \{id = onlinelobbyinterface}
		DestroyScreenElement \{id = onlinelobbyinterface}
	endif
	if NOT ($0x04788997 = 0)
		if ScreenElementExists \{id = $0x04788997}
			DestroyScreenElement \{id = $0x04788997}
		endif
	endif
	KillSpawnedScript \{Name = set_net_ui_to_finished_searching}
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
		CreateScreenElement \{Type = SpriteElement
			parent = popupelement
			texture = load_wheel
			Pos = (440.0, 300.0)
			dims = (128.0, 128.0)
			just = [
				center
				center
			]
			z_priority = 520}
		popupelement :Obj_SpawnScriptNow animate_online_icon params = {id = <id>}
		AssignAlias \{id = pu_warning_vmenu
			alias = current_menu}
	endif
endscript

script cleanup_invite_popup 
	printf \{qs(0xd693e89b)}
	destroy_popup_warning_menu
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script animate_online_icon 
	rot_angle = -360
	rot_angle = 360
	begin
	<id> :se_setprops rot_angle = 0
	<id> :se_setprops rot_angle = 180 time = 0.75
	<id> :se_waitprops
	<rot_angle> = (<rot_angle> - 360)
	<rot_angle> = (<rot_angle> + 360)
	<id> :se_setprops rot_angle = 360 time = 0.75
	<id> :se_waitprops
	repeat
endscript

script create_online_warning_message title = qs(0x134b7e69) message = qs(0xa609d4d1) Pos = ($default_online_warning_pos) parent = onlinelobbyinterface alpha = 1.0
	if NOT ScreenElementExists id = <parent>
		return
	endif
	if ScreenElementExists \{id = online_warning_message_container}
		DestroyScreenElement \{id = online_warning_message_container}
	endif
	getscreenelementzpriority id = <parent>
	CreateScreenElement {
		Type = ContainerElement
		id = online_warning_message_container
		parent = <parent>
		Pos = <Pos>
		just = [center center]
		z_priority = (<z_priority> + 20)
		alpha = <alpha>
	}
	menu_anchor = <id>
	CreateScreenElement {
		Type = SpriteElement
		parent = <menu_anchor>
		texture = popup_small
		dims = (550.0, 330.0)
		just = [center center]
		z_priority = (<z_priority> + 21)
		alpha = 1.0
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <menu_anchor>
		id = online_warning_message_text
		font = fontgrid_bordello
		rgba = (($g_menu_colors).menu_gold)
		text = <message>
		just = [center center]
		internal_just = [center center]
		internal_scale = 0.7
		z_priority = (<z_priority> + 22)
		dims = (460.0, 230.0)
		single_line = FALSE
		fit_width = wrap
		fit_height = `scale	down	if	larger`
		Pos = (0.0, 20.0)
		use_shadow = true
		shadow_rgba = [0 , 0 , 0 , 255]
		shadow_offs = (3.0, 3.0)
		scale_mode = proportional
	}
endscript

script destroy_online_warning_message 
	if ScreenElementExists \{id = online_warning_message_container}
		DestroyScreenElement \{id = online_warning_message_container}
	endif
endscript

script display_online_warning_message \{wait_time = 2.0}
	if ScreenElementExists \{id = online_warning_message_container}
		online_warning_message_container :Obj_SpawnScriptNow online_warning_message_animate params = {wait_time = <wait_time>}
	endif
endscript

script online_warning_message_animate 
	if ScreenElementExists \{id = online_warning_message_container}
		online_warning_message_container :se_setprops \{alpha = 1.0
			time = 0.2}
		online_warning_message_container :se_waitprops
	endif
	Wait <wait_time> Seconds
	if ScreenElementExists \{id = online_warning_message_container}
		online_warning_message_container :se_setprops \{alpha = 0.0
			time = 0.2}
		online_warning_message_container :se_waitprops
	endif
	destroy_online_warning_message
endscript

script create_ps3_chat_warning_message 
	CreateScreenElement {
		Type = TextBlockElement
		parent = onlinelobbyinterface
		id = ps3_chat_warning_text
		font = fontgrid_denim_title
		rgba = ($ps3_chat_warning_text)
		Pos = (970.0, 535.0)
		dims = (515.0, 200.0)
		text = <message>
		just = [center center]
		internal_just = [center center]
		internal_scale = 0.5
		z_priority = 3.1
		single_line = FALSE
		fit_width = wrap
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		rot_angle = -1
	}
endscript

script destroy_ps3_chat_warning_message 
	if ScreenElementExists \{id = ps3_chat_warning_text}
		DestroyScreenElement \{id = ps3_chat_warning_text}
	endif
endscript

script create_matchmaking_menu_and_items 
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_matchmaking_vmenu}
		<resolved_id> :se_setprops {
			event_handlers = [
				{pad_back leave_net_main_menu params = {id = <resolved_id>}}
				{pad_up net_up_down_action params = {action = up}}
				{pad_down net_up_down_action params = {action = down}}
				{pad_option generic_event_choose params = {state = uistate_wii_sign_in data = {online = 0 enable_if_online = 1}}}
				{pad_L1 toggle_guitar_part}
			]
		}
		<matchmaking_vmenu_id> = <resolved_id>
		menu_items = 0
		if NetSessionFunc \{Obj = party
				func = is_host}
		else
			focusable = not_focusable
		endif
		onlinelobbyinterface :desc_resolvealias \{Name = alias_start_matchmaking}
		<resolved_id> :se_setprops {
			<focusable>
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose 0x513955d0 params = {pad_choose_script = start_matchmaking}}
			]
		}
		<resolved_id> :SetTags msg_checksum = find_a_game
		if GotParam \{focusable}
			if (<focusable> = not_focusable)
				ResolveScreenElementID id = [
					{id = <resolved_id>}
					{local_id = text}
				]
				<menu_items> = (<menu_items> - 1)
				<resolved_id> :se_setprops alpha = 0.5
			endif
		endif
		choose_first_viewable_mode
		netoptions :pref_get \{Name = game_modes}
		formatText TextName = game_mode_text qs(0xed77b849) d = <display_string>
		onlinelobbyinterface :desc_resolvealias \{Name = alias_game_mode}
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
		<resolved_id> :SetTags msg_checksum = game_mode
		if GotParam \{focusable}
			if (<focusable> = not_focusable)
				<resolved_id> :se_setprops alpha = 0.5
			endif
		endif
		onlinelobbyinterface :se_setprops {
			matchmaking_game_mode_text = <game_mode_text>
		}
		if onlinelobbyinterface :desc_resolvealias \{Name = alias_game_mode
				param = game_mode_tf}
			bx_resizetextfield {
				id = <game_mode_tf>
				dims = (480.0, 36.0)
				fit_width = `scale	each	line	if	larger`
			}
		endif
		onlinelobbyinterface :desc_resolvealias \{Name = alias_friends}
		<resolved_id> :se_setprops {
			<demo_mode_disable>
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose ui_menu_select_sfx}
				{pad_choose 0x811282ed}
			]
		}
		<resolved_id> :SetTags msg_checksum = friends
		onlinelobbyinterface :desc_resolvealias \{Name = alias_preferences}
		<resolved_id> :se_setprops {
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose ui_menu_select_sfx}
				{pad_choose start_net_preferences}
			]
		}
		<resolved_id> :SetTags msg_checksum = preferences
		onlinelobbyinterface :desc_resolvealias \{Name = 0x78b5fcf4}
		<resolved_id> :se_setprops {
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose ui_menu_select_sfx}
				{pad_choose 0xf69978d8}
			]
		}
		<resolved_id> :SetTags msg_checksum = 0x29f0bbbd
		<menu_items> = 0
		GetScreenElementChildren id = <matchmaking_vmenu_id>
		GetArraySize <children>
		j = 0
		begin
		if NOT (<children> [<j>]) :GetSingleTag tag_not_focusable
			<menu_items> = (<menu_items> + 1)
		endif
		j = (<j> + 1)
		repeat <array_Size>
		onlinelobbyinterface :SetTags menu_items = <menu_items>
		Change \{net_starting_matchmaking = 0}
	endif
endscript

script destroy_matchmaking_menu_and_items 
	if ScreenElementExists \{id = matchmaking_vscollingmenu}
		DestroyScreenElement \{id = matchmaking_vscollingmenu}
	endif
endscript

script net_up_down_action 
	RequireParams \{[
			device_num
		]
		all}
	printf qs(0x30bc7ac9) d = <device_num>
	is_controller_online controller_index = <device_num>
	printf qs(0x7f460d52) d = <online>
	if (<online> = 1)
		onlinelobbyinterface :GetTags
		if NOT GotParam \{action}
			return
		endif
		if NOT ScreenElementExists \{id = current_menu}
			return
		endif
		if NOT ScreenElementExists id = <player_slots_menu_id>
			return
		endif
		generic_menu_up_or_down_sound <action>
		if (<locked_to_players> = 0)
			if isscreenelementinfocus \{id = current_menu}
				if (<action> = up)
					if (<menu_index> = 0)
						onlinelobbyinterface :SetTags menu_index = (<menu_items> - 1)
					else
						onlinelobbyinterface :SetTags menu_index = (<menu_index> - 1)
					endif
				elseif (<action> = down)
					if (<menu_index> = (<menu_items> - 1))
						onlinelobbyinterface :SetTags \{menu_index = 0}
					else
						onlinelobbyinterface :SetTags menu_index = (<menu_index> + 1)
					endif
				endif
			elseif isscreenelementinfocus id = <player_slots_menu_id>
				printf qs(0xd99e91f0) d = <slots_index> s = <slot_items>
				if (<action> = up)
					if (<slots_index> = 0)
						if (<menu_items> > 0)
							LaunchEvent Type = unfocus target = <player_slots_menu_id>
							online_lobby_setup_helper_controls
							LaunchEvent Type = focus target = current_menu data = {child_index = (<menu_items> - 1)}
							onlinelobbyinterface :SetTags \{slots_index = -1}
							onlinelobbyinterface :SetTags menu_index = (<menu_items> - 1)
						else
							onlinelobbyinterface :SetTags slots_index = (<slots_items> - 1)
						endif
					else
						if (<slots_index> = -1)
							<slots_index> = 1
						endif
						onlinelobbyinterface :SetTags slots_index = (<slots_index> - 1)
					endif
				elseif (<action> = down)
					if (<slots_index> = (<slot_items> - 1))
						if (<menu_items> > 0)
							LaunchEvent Type = unfocus target = <player_slots_menu_id>
							online_lobby_setup_helper_controls
							LaunchEvent \{Type = focus
								target = current_menu
								data = {
									child_index = 0
								}}
							onlinelobbyinterface :SetTags \{slots_index = -1}
							onlinelobbyinterface :SetTags \{menu_index = 0}
						else
							onlinelobbyinterface :SetTags slots_index = (<slots_items> - 1)
						endif
					else
						if (<slots_index> = -1)
							<slots_index> = 0
						endif
						onlinelobbyinterface :SetTags slots_index = (<slots_index> + 1)
					endif
				endif
			endif
		endif
	else
		generic_menu_up_or_down_sound <action>
	endif
endscript

script choose_first_viewable_mode 
	netoptions :pref_getstruct \{Name = game_modes}
	is_gamemode_visible search_mode = (<pref_struct>.checksum)
	if (<item_is_visible>)
		return
	endif
	is_gamemode_visible search_mode = (<pref_struct>.search_chk)
	if (<item_is_visible>)
		return
	endif
	printf \{qs(0x6f72e635)}
	printstruct <...>
	netoptions :pref_size \{Name = game_modes}
	i = 0
	begin
	netoptions :pref_getstruct Name = game_modes index = <i>
	is_gamemode_visible search_mode = (<pref_struct>.checksum)
	if (<item_is_visible>)
		printf qs(0x423370a0) d = <i>
		netoptions :pref_choose Name = game_modes index = <i>
		return
	endif
	<i> = (<i> + 1)
	repeat <size>
endscript

script is_gamemode_visible 
	RequireParams \{[
			search_mode
		]
		all}
	<returnvalue> = 0
	get_visible_game_modes
	if ArrayContains array = <modes> contains = <search_mode>
		<returnvalue> = 1
	endif
	return item_is_visible = <returnvalue>
endscript

script get_visible_game_modes 
	GetActiveControllers
	GetArraySize <active_controllers>
	controller_index = 0
	num_players = 0
	available_modes = []
	begin
	if (<active_controllers> [<controller_index>] = 1)
		if CheckForSignIn controller_index = <controller_index>
			num_players = (<num_players> + 1)
		endif
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_Size>
	Change num_local_players = <num_players>
	printf \{qs(0xcbebbfc5)}
	printf ($num_local_players)
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
	RequireParams \{[
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
	Obj_GetID
	LaunchEvent \{Type = unfocus
		target = current_menu}
	<objID> :se_getprops
	GetScreenElementPosition id = <objID> absolute
	adjust_highlight_z z_pri = (<z_priority> + 3)
	CreateScreenElement {
		Type = descinterface
		parent = onlinelobbyinterface
		desc = 'online_lobby_submenu'
		id = onlinesubmenuinterface
		exclusive_device = <device_num>
		z_priority = (<z_priority> + 100)
		tags = {
			menu_index = 0
			menu_items = 0
			player_num = <info_index>
			exit_Script = <exit_Script>
			scrollbar_id = NULL
		}
		Pos = $bx_matchmaking_submenu_pos
	}
	Change \{bx_highlightstars_focuswaittime = 2}
	onlinesubmenuinterface :se_setprops \{title_text = qs(0x876172e8)}
	create_submenu_fade submenu_z = (<z_priority> -10) fade_id = game_mode_submenu_fade parent = onlinesubmenuinterface
	if onlinesubmenuinterface :desc_resolvealias \{Name = alias_online_lobby_scrollbar
			param = scrollbar_id}
		onlinesubmenuinterface :SetTags scrollbar_id = <scrollbar_id>
	endif
	if onlinesubmenuinterface :desc_resolvealias \{Name = alias_popup_vmenu
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
		netoptions :pref_getstruct \{Name = game_modes}
		if GotParam \{pref_struct}
			<checksum> = (<pref_struct>.search_chk)
		endif
		<current_index> = 0
		netoptions :pref_size \{Name = game_modes}
		i = 0
		<menu_index> = 0
		<item_is_visible> = 1
		begin
		netoptions :pref_getstruct Name = game_modes index = <i>
		if StructureContains structure = <pref_struct> func
			(<pref_struct>.func) search_mode = (<pref_struct>.search_chk)
		endif
		if (<item_is_visible>)
			if (<checksum> = <pref_struct>.search_chk)
				<current_index> = <menu_index>
			endif
			add_game_mode_item_to_submenu {
				vmenu_id = <popup_vmenu>
				gamemode_text = (<pref_struct>.Name)
				choose_script_params = {
					base_text = <base_text>
					text = (<pref_struct>.Name)
					text_id = <text_id>
					mode_checksum = (<pref_struct>.checksum)
					container_id = onlinesubmenuinterface
					vmenu_id = <subvmenu_id>
					parent_id = <vmenu_id>
				}
			}
			if GotParam \{id}
				<id> :SetTags msg_checksum = (<pref_struct>.checksum)
			endif
			<menu_index> = (<menu_index> + 1)
		endif
		i = (<i> + 1)
		repeat <size>
		if ScreenElementExists id = <scrollbar_id>
			onlinesubmenuinterface :GetTags
			scroll_increment = (175 / (<menu_items> -1))
			<scrollbar_id> :SetTags scroll_increment = <scroll_increment>
			<scrollbar_id> :se_setprops scrollbar_thumb_pos = ((0.0, 1.0) * (<scroll_increment> * <current_index>))
		endif
		onlinesubmenuinterface :SetTags menu_index = <current_index>
	endif
	clean_up_user_control_helpers
	menu_finish
	if GotParam \{title}
		switch <title>
			case qs(0x876172e8)
			SoundEvent \{event = online_panel_in}
		endswitch
	endif
	onlinesubmenuinterface :Obj_SpawnScriptNow animate_submenu_transition params = {direction = in id = onlinesubmenuinterface focus_id = <popup_vmenu> focus_index = <current_index>}
endscript

script destroy_gamemode_submenu 
	turn_off_highlight
	if NOT ((GotParam container_id) || (GotParam vmenu_id) || (GotParam parent_id))
		return
	endif
	if ScreenElementExists id = <vmenu_id>
		LaunchEvent Type = unfocus target = <vmenu_id>
	endif
	if ScreenElementExists \{id = onlinesubmenuinterface}
		animate_submenu_transition \{id = onlinesubmenuinterface
			direction = out}
		DestroyScreenElement \{id = onlinesubmenuinterface}
		online_lobby_transition_in
	endif
	destroy_submenu_fade \{fade_id = game_mode_submenu_fade}
	adjust_highlight_z \{z_pri = 2}
endscript

script create_submenu_fade 
	RequireParams \{[
			submenu_z
			fade_id
		]}
	destroy_submenu_fade fade_id = <fade_id>
	if ScreenElementExists \{id = onlinelobbyinterface}
		if NOT GotParam \{parent}
			parent = onlinelobbyinterface
		endif
		CreateScreenElement {
			Type = SpriteElement
			id = <fade_id>
			parent = <parent>
			pos_anchor = [left top]
			just = [left top]
			rgba = [0 0 0 255]
			Pos = {(-247.0, -160.0) absolute}
			dims = (1280.0, 720.0)
			alpha = 0.4
			z_priority = (<submenu_z> - 0.01)
			tags = [debug_me]
		}
	endif
endscript

script destroy_submenu_fade 
	RequireParams \{[
			fade_id
		]}
	if ScreenElementExists id = <fade_id>
		DestroyScreenElement id = <fade_id>
	endif
endscript

script select_gamemode 
	if GotParam \{text_id}
		if ScreenElementExists id = <text_id>
			formatText TextName = new_string qs(0x93802bc1) s = <base_text> d = <text>
			SetScreenElementProps id = <text_id> text = <new_string>
			bx_resizetextfield {
				id = <text_id>
				dims = (480.0, 36.0)
				fit_width = `scale	each	line	if	larger`
			}
			Change \{bx_highlightstars_focuswaittime = 2}
			netoptions :pref_choose Name = game_modes checksum = <mode_checksum>
			if (<mode_checksum> = p2_battle)
				GetActiveControllers
				GetArraySize <active_controllers>
				i = 0
				begin
				if (<active_controllers> [<i>] = 1)
					if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
						get_controller_type controller_index = <i>
						if (<controller_type> = guitar)
							toggle_guitar_part device_num = <i>
						endif
					endif
				endif
				<i> = (<i> + 1)
				repeat <array_Size>
			endif
		endif
	endif
	destroy_gamemode_submenu container_id = <container_id> vmenu_id = <vmenu_id>
endscript

script online_lobby_submenu_up 
	if ScreenElementExists \{id = onlinesubmenuinterface}
		onlinesubmenuinterface :GetTags
		if (<menu_index> = 0)
			onlinesubmenuinterface :SetTags menu_index = (<menu_items> - 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 175.0)
			endif
		else
			onlinesubmenuinterface :SetTags menu_index = (<menu_index> - 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :GetTags
				Pos = ((0.0, -1.0) * <scroll_increment>)
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = {<Pos> relative}
			endif
		endif
	endif
endscript

script online_lobby_submenu_down 
	if ScreenElementExists \{id = onlinesubmenuinterface}
		onlinesubmenuinterface :GetTags
		if ((<menu_index> + 1) = <menu_items>)
			onlinesubmenuinterface :SetTags \{menu_index = 0}
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = (0.0, 0.0)
			endif
		else
			onlinesubmenuinterface :SetTags menu_index = (<menu_index> + 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :GetTags
				Pos = ((0.0, 1.0) * (<scroll_increment>))
				<scrollbar_id> :se_setprops scrollbar_thumb_pos = {<Pos> relative}
			endif
		endif
	endif
endscript

script add_game_mode_item_to_submenu 
	RequireParams \{[
			vmenu_id
		]
		all}
	<vmenu_id> :se_getprops
	z_priority = (<z_priority> + 5)
	dims = (440.0, 48.0)
	CreateScreenElement {
		Type = TextBlockElement
		parent = <vmenu_id>
		dims = <dims>
		font = fontgrid_bordello
		rgba = (($g_menu_colors).menu_gold)
		Shadow
		shadow_rgba = $UI_text_shadow_color
		shadow_offs = (3.0, 3.0)
		text = <gamemode_text>
		just = [center center]
		z_priority = <z_priority>
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = proportional
		event_handlers = [
			{focus matchmaking_item_change_focus params = {focus}}
			{unfocus matchmaking_item_change_focus params = {unfocus}}
			{pad_choose ui_menu_select_sfx}
			{pad_choose select_gamemode params = <choose_script_params>}
		]
	}
	bx_resizetextfield {
		id = <id>
		dims = <dims>
		fit_width = `scale	each	line	if	larger`
	}
	if ScreenElementExists \{id = onlinesubmenuinterface}
		onlinesubmenuinterface :GetTags
		onlinesubmenuinterface :SetTags menu_items = (<menu_items> + 1)
	endif
endscript

script matchmaking_item_change_focus 
	Obj_GetID
	<objID> :GetTags
	if GotParam \{focus}
		if GotParam \{msg_checksum}
			set_net_dialog_message msg_checksum = <msg_checksum>
		endif
		Wait \{1
			gameframe}
		mainmenu_focus
	elseif GotParam \{unfocus}
		mainmenu_unfocus
	endif
endscript

script set_net_dialog_message 
	if NOT GotParam \{msg_checksum}
		return
	endif
	if isXenon
		plat_helper_strings = net_helper_text_strings_xen
	elseif isps3
		plat_helper_strings = net_helper_text_strings_ps3
	elseif isngc
		plat_helper_strings = net_helper_text_strings_wii
	endif
	AppendSuffixToChecksum Base = <msg_checksum> SuffixString = '_text'
	if StructureContains structure = ($<plat_helper_strings>) <appended_id>
		if ScreenElementExists \{id = onlinelobbyinterface}
			if NOT onlinelobbyinterface :GetSingleTag \{0x1fec3149}
				onlinelobbyinterface :se_setprops net_info_text = ($<plat_helper_strings>.<appended_id>)
			endif
		endif
	elseif StructureContains structure = ($net_helper_text_strings) <appended_id>
		if ScreenElementExists \{id = onlinelobbyinterface}
			if NOT onlinelobbyinterface :GetSingleTag \{0x1fec3149}
				onlinelobbyinterface :se_setprops net_info_text = ($net_helper_text_strings.<appended_id>)
			endif
		endif
	endif
endscript

script matchmaking_submenu_item_change_focus 
	Obj_GetID
	<objID> :GetTags
	ResolveScreenElementID id = [
		{id = <objID>}
		{local_id = text}
	]
	if GotParam \{focus}
		if GotParam \{msg_checksum}
			set_submenu_helper_text msg_checksum = <msg_checksum>
		endif
		retail_menu_focus id = <resolved_id>
	elseif GotParam \{unfocus}
		retail_menu_unfocus id = <resolved_id>
	endif
endscript

script set_submenu_helper_text 
	if NOT GotParam \{msg_checksum}
		return
	endif
	if isXenon
		plat_helper_strings = net_helper_text_strings_xen
	elseif isps3
		plat_helper_strings = net_helper_text_strings_ps3
	elseif isngc
		plat_helper_strings = net_helper_text_strings_wii
	endif
	AppendSuffixToChecksum Base = <msg_checksum> SuffixString = '_text'
	if StructureContains structure = ($<plat_helper_strings>) <appended_id>
		if ScreenElementExists \{id = onlinesubmenuinterface}
			onlinesubmenuinterface :se_setprops info_text = ($<plat_helper_strings>.<appended_id>)
		endif
	elseif StructureContains structure = ($net_helper_text_strings) <appended_id>
		if ScreenElementExists \{id = onlinesubmenuinterface}
			onlinesubmenuinterface :se_setprops info_text = ($net_helper_text_strings.<appended_id>)
		endif
	endif
endscript

script create_player_slots_container 
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_online_lobby_right_side}
		if <resolved_id> :desc_resolvealias Name = alias_player_slots_menu
			<player_slots_menu_id> = <resolved_id>
			onlinelobbyinterface :SetTags player_slots_menu_id = <player_slots_menu_id>
			if isps3
				new_event_handlers = [
					{pad_back leave_net_main_menu params = {id = <player_slots_menu_id>}}
					{pad_up net_up_down_action params = {action = up}}
					{pad_down net_up_down_action params = {action = down}}
					{pad_option2 ps3_display_invites_received}
					{pad_L1 toggle_guitar_part}
				]
			else
				new_event_handlers = [
					{pad_back leave_net_main_menu params = {id = <player_slots_menu_id>}}
					{pad_up net_up_down_action params = {action = up}}
					{pad_down net_up_down_action params = {action = down}}
					{pad_L1 toggle_guitar_part}
				]
			endif
			<player_slots_menu_id> :se_setprops {
				event_handlers = <new_event_handlers>
			}
			<player_slots_menu_id> :SetTags {
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
			<player_slots_menu_id> :Obj_SpawnScriptLater update_player_slots_ui
		endif
	endif
endscript

script create_player_slots_ui 
	onlinelobbyinterface :GetTags
	<player_slots_menu_id> :GetTags
	GetArraySize \{all_players_checksum}
	count = 0
	begin
	if (<all_players_checksum> [<count>] = local_signed_in)
		add_player_slot_to_menu index = <count> player_type = local
	elseif (<all_players_checksum> [<count>] = remote)
		add_player_slot_to_menu index = <count> player_type = remote
	elseif (<all_players_checksum> [<count>] = local_not_signed_in)
		get_ui_slot_corresponding_controller target_ui_slot = <count>
		add_player_slot_to_menu index = <count> player_type = not_signed_in controller = <controller>
	endif
	count = (<count> + 1)
	repeat <array_Size>
endscript

script destroy_player_slots_ui 
	onlinelobbyinterface :GetTags
	if ScreenElementExists id = <player_slots_menu_id>
		DestroyScreenElement id = <player_slots_menu_id> preserve_parent
	endif
	onlinelobbyinterface :SetTags \{slot_items = 0}
endscript

script refresh_player_slots_ui 
	printscriptinfo \{'---refresh_player_slots_ui'}
	if ScreenElementExists \{id = onlinelobbyinterface}
		SetButtonEventMappings \{block_menu_input}
		onlinelobbyinterface :GetTags
		begin
		<player_slots_menu_id> :GetTags
		if (<safe_to_refresh_player_slots> = 1)
			break
		endif
		Wait \{1
			Frame}
		repeat
		<player_slots_menu_id> :SetTags safe_to_refresh_player_slots = 0
		onlinelobbyinterface :GetTags
		LaunchEvent Type = unfocus target = <player_slots_menu_id>
		if (<slots_index> != -1)
			target_slots_index = <slots_index>
		endif
		destroy_player_slots_ui
		create_player_slots_ui
		update_signed_in_controllers
		if isscreenelementinfocus \{id = current_menu}
			online_lobby_setup_helper_controls
		endif
		if GotParam \{target_slots_index}
			onlinelobbyinterface :GetTags
			if (<slot_items> = 0)
				onlinelobbyinterface :SetTags \{menu_index = 0}
				LaunchEvent \{Type = focus
					target = current_menu
					data = {
						child_index = 0
					}}
			else
				if ((<target_slots_index> + 1) > <slot_items>)
					onlinelobbyinterface :SetTags \{slots_index = 0}
					LaunchEvent Type = focus target = <player_slots_menu_id> data = {child_index = 0}
				else
					onlinelobbyinterface :SetTags slots_index = <target_slots_index>
					LaunchEvent Type = focus target = <player_slots_menu_id> data = {child_index = <target_slots_index>}
				endif
			endif
		endif
		<player_slots_menu_id> :SetTags safe_to_refresh_player_slots = 1
		SetButtonEventMappings \{unblock_menu_input}
	endif
endscript

script player_slot_change_focus 
	Obj_GetID
	<objID> :GetTags
	if GotParam \{focus}
		if ScreenElementExists \{id = highlightstars}
			highlightstars :se_setprops \{alpha = 0}
		endif
		if GotParam \{msg_checksum}
			set_net_dialog_message msg_checksum = <msg_checksum>
		endif
		if GotParam \{view_gamer_card}
		endif
	elseif GotParam \{unfocus}
		mainmenu_unfocus
		Color = (($g_menu_colors).menu_online_player_slot_team1)
		if GotParam \{unfocus_color}
			<Color> = <unfocus_color>
		endif
		se_setprops player_slot_rgba = <Color>
	endif
endscript

script add_player_slot_to_menu 
	keep_sign_in_button = 0
	cash_icon_alpha = 0
	cash_icon_id = cash_milestone_icon_002
	cash_text = qs(0x00000000)
	if (<player_type> = not_signed_in)
		Name = qs(0x09aff446)
		get_controller_type controller_index = <controller>
		formatText checksumName = controller_texture 'Logo_%d_GrayScale' d = ($controller_lookup_table.<controller_type>)
		<keep_sign_in_button> = 1
		<cash_text> = qs(0x00000000)
	elseif (<player_type> = local || <player_type> = remote)
		formatText checksumName = gamertag 'gamertag_%d' d = <index>
		formatText checksumName = player_status 'player%d_status' d = (<index> + 1)
		xuid = [0 0]
		SetArrayElement ArrayName = xuid index = 0 NewValue = ($<player_status>.net_id_first)
		SetArrayElement ArrayName = xuid index = 1 NewValue = ($<player_status>.net_id_second)
		sign_in_button_alpha = 0
		if (<player_type> = remote)
			Name = $<gamertag>
			formatText checksumName = controller_texture 'Logo_%d_GrayScale' d = ($controller_lookup_table.($<player_status>.part))
			cash_get_info_from_earnings earnings = (($<player_status>.career_earnings))
			formatText TextName = cash_text qs(0x76b3fda7) d = <rank>
			<cash_icon_alpha> = 1
		else
			if NOT NetSessionFunc func = iscontrolleringame params = {controller = ($<player_status>.controller)}
				Name = qs(0x12f727b9)
				<keep_sign_in_button> = 1
			else
				NetSessionFunc Obj = match func = get_gamertag params = {controller = ($<player_status>.controller)}
				Change GlobalName = <gamertag> NewValue = <Name>
				cash_ranks_get_icon_id Player = (<index> + 1)
				cash_ranks_get_rank Player = (<index> + 1)
				formatText TextName = cash_text qs(0x76b3fda7) d = <rank>
				<cash_icon_alpha> = 1
				<keep_sign_in_button> = 0
			endif
			if ($net_starting_matchmaking = 0)
				get_controller_type controller_index = ($<player_status>.controller)
				formatText checksumName = controller_texture 'Logo_%d_GrayScale' d = ($controller_lookup_table.<controller_type>)
				if (<controller_type> = guitar)
					formatText checksumName = controller_texture 'Logo_%d_GrayScale' d = ($controller_lookup_table.($<player_status>.part))
				endif
			else
				formatText checksumName = controller_texture 'Logo_%d_GrayScale' d = ($controller_lookup_table.($<player_status>.part))
			endif
		endif
	endif
	<view_gamer_card> = 0
	if isXenon
		if GotParam \{xuid}
			if (<keep_sign_in_button> = 0)
				<view_gamer_card> = 1
			endif
		endif
	endif
	onlinelobbyinterface :GetTags
	CreateScreenElement {
		Type = descinterface
		desc = 'online_lobby_player_slot'
		parent = <player_slots_menu_id>
		auto_dims = FALSE
		dims = (474.0, 50.0)
		event_handlers = [
			{focus player_slot_change_focus params = {focus view_gamer_card = <view_gamer_card>}}
			{unfocus player_slot_change_focus params = {unfocus}}
		]
	}
	<id> :se_setprops {
		player_slot_name_text = <Name>
		player_instrument_logo_texture = <controller_texture>
		cash_icon_texture = <cash_icon_id>
		cash_rank_text = <cash_text>
		cash_icon_alpha = <cash_icon_alpha>
	}
	ngc_getwide
	if (<widescreen> = true)
		if <id> :desc_resolvealias Name = alias_sign_in_button param = signin_id
			<signin_id> :SetProps {
				internal_scale = (0.9, 0.9)
			}
		endif
	endif
	if GotParam \{controller}
		if ((<controller> >= 0) || (<controller> < 4))
			if <id> :desc_resolvealias Name = alias_sign_in_button param = signin_id
				<signin_id> :SetProps {
					metaremapenableauto = FALSE
					metaremapdevicetouse = <controller>
				}
			endif
		endif
	endif
	if (<keep_sign_in_button> = 0)
		if <id> :desc_resolvealias Name = alias_sign_in_button param = signin_id
			<signin_id> :Die
		endif
		if isXenon
			formatText checksumName = player_status 'player%d_status' d = (<index> + 1)
			if (<player_type> = remote)
				<id> :Obj_SpawnScriptLater update_headset_status params = {obj_id = <id> uid = <xuid>}
			elseif NOT NetSessionFunc func = xenonisguest params = {controller_index = ($<player_status>.controller)}
				<id> :Obj_SpawnScriptLater update_headset_status params = {obj_id = <id> uid = <xuid>}
			endif
		endif
	else
		if (<player_type> = not_signed_in)
			get_controller_type controller_index = <controller>
			if ((<controller_type> = controller) || (<controller_type> = vocals))
				if <id> :desc_resolvealias Name = alias_sign_in_button param = signin_id
					<signin_id> :se_setprops text = qs(0x9f330107)
				endif
			else
				if <id> :desc_resolvealias Name = alias_sign_in_button param = signin_id
					<signin_id> :se_setprops text = qs(0xbb0b71dd)
				endif
			endif
		endif
	endif
	if isXenon
		if GotParam \{xuid}
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
			<id> :SetTags msg_checksum = sign_in
		elseif (<player_type> = remote)
			<id> :SetTags msg_checksum = gamer_card
		elseif NetSessionFunc func = iscontrolleringame params = {controller = <controller>}
			<id> :SetTags msg_checksum = gamer_card
		else
			<id> :SetTags msg_checksum = Blank
		endif
	else
		<id> :se_setprops event_handlers = [{pad_choose menu_scroll_end_sound}]
	endif
	onlinelobbyinterface :GetTags
	onlinelobbyinterface :SetTags slot_items = (<slot_items> + 1)
endscript

script update_headset_status 
endscript

script update_player_slots_ui 
	begin
	get_active_local_controllers
	get_signin_status_local_controllers
	0x312e5692
	Change \{net_block_matchmaking = 0}
	if ($need_to_refresh_player_slots = 1)
		refresh_player_slots_ui
		Change \{need_to_refresh_player_slots = 0}
	endif
	Wait \{0.1
		Seconds}
	repeat
endscript

script get_active_local_controllers 
	GetActiveControllers
	GetArraySize <active_controllers>
	controller_index = 0
	begin
	if (<active_controllers> [<controller_index>] = 1)
		check_for_local_controller_change controller_index = <controller_index> state = Active
		if (<Change>)
			add_remove_player_to_net_ui action = add index = <controller_index> player_type = local_not_signed_in
		endif
	endif
	if (<active_controllers> [<controller_index>] = 0)
		check_for_local_controller_change controller_index = <controller_index> state = inactive
		if CheckForSignIn controller_index = <controller_index>
			NetSessionFunc func = removecontroller params = {controller = <controller_index>}
		endif
		if (<Change>)
			if NOT CheckForSignIn controller_index = <controller_index>
				get_controller_corresponding_ui_slot controller = <controller_index>
				add_remove_player_to_net_ui action = remove ui_slot = <ui_slot> index = <controller_index> player_type = local_not_signed_in
			endif
		endif
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_Size>
endscript

script get_signin_status_local_controllers 
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_online_lobby_right_side}
		if <resolved_id> :desc_resolvealias Name = alias_player_slots_menu
			<resolved_id> :GetTags
			GetArraySize <local_controllers>
			controller_index = 0
			begin
			if NOT (<local_controllers> [<controller_index>] = unplugged)
				if CheckForSignIn controller_index = <controller_index>
					check_for_signin_signin_change controller_index = <controller_index> state = signed_in
					if (<Change>)
						add_remove_player_to_net_ui action = replace index = <controller_index> player_type = local_signed_in
					endif
				else
					check_for_signin_signin_change controller_index = <controller_index> state = signed_out
					if (<Change>)
						NetSessionFunc func = removecontroller params = {controller = <controller_index>}
						add_remove_player_to_net_ui action = replace index = <controller_index> player_type = local_not_signed_in
					endif
				endif
			endif
			controller_index = (<controller_index> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script 0x312e5692 
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_player_slots_vmenu}
		<resolved_id> :GetTags
		GetArraySize <local_controllers>
		controller_index = 0
		begin
		if NOT (<local_controllers> [<controller_index>] = unplugged)
			if CheckForSignIn controller_index = <controller_index>
				0xe30030cb controller_index = <controller_index>
				if (<Change>)
					add_remove_player_to_net_ui action = replace index = <controller_index> player_type = local_signed_in
				endif
			else
				0xe30030cb controller_index = <controller_index>
				if (<Change>)
					NetSessionFunc func = removecontroller params = {controller = <controller_index>}
					add_remove_player_to_net_ui action = replace index = <controller_index> player_type = local_not_signed_in
				endif
			endif
		endif
		controller_index = (<controller_index> + 1)
		repeat <array_Size>
	endif
endscript

script 0xbf02b723 
	begin
	if NOT NetSessionFunc \{Obj = session
			func = is_matchmaking_active}
		printf \{qs(0x68c883cd)}
		break
	endif
	if 0x0a6962a1
		break
	endif
	Wait \{0.1
		Second}
	repeat
	SpawnScriptNow \{0xd8a5be9f}
endscript

script 0xd8a5be9f 
	begin
	if NOT NetSessionFunc \{Obj = session
			func = is_matchmaking_active}
		printf \{qs(0x68c883cd)}
		break
	endif
	if ScriptIsRunning \{cancel_start_matchmaking}
		break
	endif
	if cancel_start_matchmaking \{0x838f9476}
		break
	endif
	Wait \{0.1
		Seconds}
	repeat
endscript

script 0x0a6962a1 
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_player_slots_vmenu}
		<resolved_id> :GetTags
		GetActiveControllers
		GetArraySize <local_controllers>
		controller_index = 0
		begin
		if NOT (<local_controllers> [<controller_index>] = unplugged)
			if CheckForSignIn controller_index = <controller_index>
				0xe30030cb controller_index = <controller_index>
				if (<Change> = 1)
					return \{true}
				endif
				if (<active_controllers> [<controller_index>] = 0)
					return \{true}
				endif
			endif
		endif
		controller_index = (<controller_index> + 1)
		repeat <array_Size>
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
	RequireParams \{[
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
			if isXenon
				<load_settings> = 1
			elseif (<controller_index> = $primary_controller)
				<load_settings> = 1
			endif
			if (<load_settings> = 1)
				GetGlobalTags savegame = <savegame> user_options param = lefty_flip_save
				GetGlobalTags savegame = <savegame> user_options param = vocals_highway_view_save
				setplayerinfo <index> vocals_highway_view = <vocals_highway_view_save>
				setplayerinfo <index> lefty_flip = <lefty_flip_save>
				setplayerinfo <index> lefthanded_gems = <lefty_flip_save>
				setplayerinfo <index> lefthanded_button_ups = <lefty_flip_save>
				setplayerinfo <index> lefthanded_button_ups_flip_save = <lefty_flip_save>
				setplayerinfo <index> lefthanded_gems_flip_save = <lefty_flip_save>
				setplayerinfo <index> difficulty = ($default_difficulty [<controller_index>])
			endif
			get_controller_part controller = <controller_index>
			get_last_band_character_recorded Player = <index> part = <controller_part> no_band_leader_grab
			if (<character_id> = None)
				cas_get_random_preset_character savegame = <savegame> part = <controller_part>
			endif
			setplayerinfo <index> character_id = <character_id>
		endif
	endif
	index = (<index> + 1)
	repeat 8
endscript

script poll_party_object 
	NetSessionFunc \{Obj = party
		func = get_party_members}
	GetArraySize <connections>
	<connections_size> = <array_Size>
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
				Change \{respond_to_signin_changed_all_players = 1}
				NetSessionFunc \{Obj = party
					func = get_shared_data}
				formatText checksumName = player_data 'player_%d' d = ((<connections> [<index>]).party_id)
				if StructureContains structure = <party_shared_data> <player_data>
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
					Name = ((<connections> [<index>]).gamertag)
					net_id_first = ((<connections> [<index>]).user_id [0])
					net_id_second = ((<connections> [<index>]).user_id [1])
					controller_type = controller
					part = <part>
					career_earnings = <earnings>
					local_client = 0
					obj_id = -1
				}
			else
				NetSessionFunc \{Obj = party
					func = get_shared_data}
				formatText checksumName = player_data 'player_%d' d = ((<connections> [<index>]).party_id)
				if StructureContains structure = <party_shared_data> <player_data>
					getplayerinfo <info_index> part
					getplayerinfo <info_index> career_earnings
					if NOT (((<party_shared_data>.<player_data>).player_part = <part>))
						setplayerinfo <info_index> part = ((<party_shared_data>.<player_data>).player_part)
						setplayerinfo <info_index> career_earnings = ((<party_shared_data>.<player_data>).player_career_earnings)
						Change \{need_to_refresh_player_slots = 1}
					elseif NOT (((<party_shared_data>.<player_data>).player_career_earnings = <career_earnings>))
						setplayerinfo <info_index> career_earnings = ((<party_shared_data>.<player_data>).player_career_earnings)
						Change \{need_to_refresh_player_slots = 1}
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
				if NetSessionFunc func = iscontrolleringame params = {controller = <controller>}
					NetSessionFunc \{Obj = party
						func = get_shared_data}
					formatText checksumName = player_data 'player_%d' d = ((<connections> [<index>]).party_id)
					setplayerinfo <info_index> party_id = ((<connections> [<index>]).party_id)
					if StructureContains structure = <party_shared_data> <player_data>
						getplayerinfo <info_index> part
						get_controller_type controller_index = ((<connections> [<index>]).controller_index)
						if (<controller_type> = controller)
							<controller_type> = vocals
						endif
						if (<controller_type> != <part>)
							if NOT (<controller_type> = guitar && <part> = bass)
								<part> = <controller_type>
								setplayerinfo <info_index> part = <part>
								Change \{need_to_refresh_player_slots = 1}
							endif
						endif
						if NOT (((<party_shared_data>.<player_data>).player_part = <part>))
							printf \{qs(0x387789dc)}
							get_savegame_from_controller controller = <controller>
							get_current_band_info
							GetGlobalTags <band_info> savegame = <savegame> param = career_earnings
							formatText checksumName = player_info 'player_%d' d = ((<connections> [<index>]).party_id)
							formatText checksumName = player_status 'player%d_status' d = <info_index>
							party_info = {}
							appendstruct {
								struct = party_info
								Field = <player_info>
								params = {
									player_part = ($<player_status>.part)
									player_career_earnings = <career_earnings>
								}
							}
							NetSessionFunc Obj = party func = append_shared_data params = {data = <party_info>}
						endif
					else
						printf \{qs(0xde83dcfe)}
						get_savegame_from_controller controller = <controller>
						get_current_band_info
						GetGlobalTags <band_info> savegame = <savegame> param = career_earnings
						formatText checksumName = player_info 'player_%d' d = ((<connections> [<index>]).party_id)
						formatText checksumName = player_status 'player%d_status' d = <info_index>
						party_info = {}
						appendstruct {
							struct = party_info
							Field = <player_info>
							params = {
								player_part = ($<player_status>.part)
								player_career_earnings = <career_earnings>
							}
						}
						NetSessionFunc Obj = party func = append_shared_data params = {data = <party_info>}
					endif
				endif
			endif
		endif
		<index> = (<index> + 1)
		repeat <connections_size>
	endif
	onlinelobbyinterface :GetTags
	if ScreenElementExists id = <player_slots_menu_id>
		<player_slots_menu_id> :GetTags
		GetArraySize \{all_players_checksum}
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
							formatText checksumName = gamertag 'gamertag_%d' d = <i>
							if LocalizedStringEquals a = ((<connections> [<index>]).gamertag) b = ($<gamertag>)
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
		repeat <array_Size>
	endif
	if NOT NetSessionFunc \{Obj = party
			func = is_host}
		NetSessionFunc \{Obj = party
			func = get_shared_data}
		if StructureContains structure = <party_shared_data> game_mode
			netoptions :pref_choose Name = game_modes index = (<party_shared_data>.game_mode)
			netoptions :pref_get \{Name = game_modes}
			formatText TextName = game_mode_text qs(0xed77b849) d = <display_string>
			if ScreenElementExists \{id = onlinelobbyinterface}
				onlinelobbyinterface :se_setprops {
					matchmaking_game_mode_text = <game_mode_text>
				}
				if onlinelobbyinterface :desc_resolvealias \{Name = alias_game_mode
						param = game_mode_tf}
					bx_resizetextfield {
						id = <game_mode_tf>
						dims = (480.0, 36.0)
						fit_width = `scale	each	line	if	larger`
					}
				endif
			endif
		endif
	endif
endscript

script change_handle_signin_if_no_remotes 
	has_remote = 0
	NetSessionFunc \{Obj = party
		func = get_party_members}
	GetArraySize <connections>
	if (<array_Size> > 0)
		i = 0
		begin
		if ((<connections> [<i>]).is_local = 0)
			<has_remote> = 1
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	if (<has_remote> = 0)
		Change \{respond_to_signin_changed_all_players = 0}
	endif
endscript

script check_for_local_controller_change \{controller_index = -1}
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_online_lobby_right_side}
		if <resolved_id> :desc_resolvealias Name = alias_player_slots_menu
			if (<controller_index> = -1)
				printf \{qs(0x32764d51)}
				return
			endif
			<resolved_id> :GetTags
			if (<state> = Active)
				if (<local_controllers> [<controller_index>] = unplugged)
					return \{Change = 1}
				else
					return \{Change = 0}
				endif
			elseif (<state> = inactive)
				if NOT (<local_controllers> [<controller_index>] = unplugged)
					return \{Change = 1}
				else
					return \{Change = 0}
				endif
			endif
		endif
	endif
endscript

script check_for_signin_signin_change \{controller_index = -1}
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_online_lobby_right_side}
		if <resolved_id> :desc_resolvealias Name = alias_player_slots_menu
			if (<controller_index> = -1)
				printf \{qs(0x32764d51)}
				return
			endif
			<resolved_id> :GetTags
			get_controller_corresponding_ui_slot controller = <controller_index>
			if (<state> = signed_in)
				if (<all_players_checksum> [<ui_slot>] = local_not_signed_in)
					return \{Change = 1}
				else
					return \{Change = 0}
				endif
			elseif (<state> = signed_out)
				if (<all_players_checksum> [<ui_slot>] = local_signed_in)
					return \{Change = 1}
				else
					return \{Change = 0}
				endif
			endif
		endif
	endif
endscript

script 0xe30030cb \{controller_index = -1}
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_player_slots_vmenu}
		if (<controller_index> = -1)
			printf \{qs(0x32764d51)}
			return
		endif
		get_player_num_from_controller controller_index = <controller_index>
		get_controller_type controller_index = <controller_index>
		if (<player_num> > 0)
			getplayerinfo <player_num> part
			switch <controller_type>
				case guitar
				if NOT (<part> = bass || <part> = guitar)
					netoptions :pref_getstruct \{Name = game_modes}
					search_mode = (<pref_struct>.search_chk)
					if (<search_mode> = p2_pro_faceoff_bass || <search_mode> = p2_faceoff_bass)
						setplayerinfo <player_num> part = bass
					else
						setplayerinfo <player_num> part = guitar
					endif
					return \{Change = 1}
				endif
				case drum
				if NOT (<part> = drum)
					setplayerinfo <player_num> part = drum
					return \{Change = 1}
				endif
				case vocals
				case controller
				if NOT (<part> = vocals)
					setplayerinfo <player_num> part = vocals
					return \{Change = 1}
				endif
			endswitch
		endif
		return \{Change = 0}
	endif
endscript

script add_remove_player_to_net_ui 
	if NOT ScreenElementExists \{id = onlinelobbyinterface}
		return
	endif
	onlinelobbyinterface :GetTags
	if ScreenElementExists id = <player_slots_menu_id>
		<player_slots_menu_id> :GetTags
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
			<player_slots_menu_id> :GetTags
			if (<player_type> = local_not_signed_in || <player_type> = local_signed_in)
				formatText checksumName = controller_status 'plugged_in_%d' d = <available_slot>
				if (-1 != <index>)
					SetArrayElement ArrayName = local_controllers index = <index> NewValue = <controller_status>
				else
					printf \{qs(0xd140ddc4)}
					printstruct <...>
					printscriptinfo \{'add_remove_player_to_net_ui'}
					return
				endif
			endif
			SetArrayElement ArrayName = all_players_checksum index = <available_slot> NewValue = <player_type>
			<player_slots_menu_id> :SetTags {
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
					get_controller_corresponding_ui_slot controller = <index>
					SetArrayElement ArrayName = local_controllers index = <index> NewValue = unplugged
					SetArrayElement ArrayName = all_players_checksum index = <ui_slot> NewValue = empty
				else
					printf \{qs(0x07d124a8)}
					printstruct <...>
					return
				endif
			else
				SetArrayElement ArrayName = all_players_checksum index = <ui_slot> NewValue = empty
			endif
			<player_slots_menu_id> :SetTags {
				all_players_checksum = <all_players_checksum>
				local_controllers = <local_controllers>
				num_players_in_session = (<num_players_in_session> - <players_to_remove>)
			}
			if NOT (<player_type> = remote)
				is_controller_online controller_index = <index>
				if (<online> = 1)
					NetSessionFunc func = removecontroller params = {controller = <index>}
				endif
			endif
			remove_player_from_player_status_structs index = <ui_slot>
		elseif (<action> = replace)
			printf qs(0xa1c6e951) d = <player_type>
			get_controller_corresponding_ui_slot controller = <index>
			SetArrayElement ArrayName = local_controllers index = <index> NewValue = unplugged
			SetArrayElement ArrayName = all_players_checksum index = <ui_slot> NewValue = empty
			<player_slots_menu_id> :SetTags {
				all_players_checksum = <all_players_checksum>
				local_controllers = <local_controllers>
			}
			add_remove_player_to_net_ui action = add index = <index> player_type = <player_type>
			return
		endif
		Change \{need_to_refresh_player_slots = 1}
	endif
endscript

script add_player_to_player_status_structs 
	formatText checksumName = player_status 'player%d_status' d = (<available_slot> + 1)
	if (<player_type> = local_signed_in)
		NetSessionFunc Obj = match func = get_gamertag params = {controller = <index>}
		GetNetID controller_index = <index>
		get_controller_type controller_index = <index>
		Change structurename = <player_status> controller = <index>
		local_client = 1
		obj_id = -1
		get_savegame_from_controller controller = <index>
		get_current_band_info
		GetGlobalTags <band_info> savegame = <savegame> param = career_earnings
		if NOT GotParam \{part}
			part = <controller_type>
			if (<part> = guitar && ($<player_status>.part = bass))
				<part> = bass
			endif
			if (<part> = controller)
				<part> = vocals
			endif
		endif
	elseif (<player_type> = remote)
		Change structurename = <player_status> controller = <index>
		local_client = 0
	endif
	formatText checksumName = gamertag 'gamertag_%d' d = <available_slot>
	Change GlobalName = <gamertag> NewValue = <Name>
	Change structurename = <player_status> gamertag = <gamertag>
	Change structurename = <player_status> net_id_first = <net_id_first>
	Change structurename = <player_status> net_id_second = <net_id_second>
	Change structurename = <player_status> controller_type = <controller_type>
	Change structurename = <player_status> is_local_client = <local_client>
	Change structurename = <player_status> net_obj_id = <obj_id>
	if GotParam \{part}
		Change structurename = <player_status> part = <part>
	endif
	if GotParam \{career_earnings}
		Change structurename = <player_status> career_earnings = <career_earnings>
	endif
endscript

script remove_player_from_player_status_structs 
	formatText checksumName = player_status 'player%d_status' d = (<index> + 1)
	Change structurename = <player_status> net_id_first = 0
	Change structurename = <player_status> net_id_second = 0
	Change structurename = <player_status> is_local_client = 0
	Change structurename = <player_status> net_obj_id = -1
	Change structurename = <player_status> career_earnings = 0
	Change structurename = <player_status> lefty_flip = 0
endscript

script get_next_available_slot 
	onlinelobbyinterface :GetTags
	<player_slots_menu_id> :GetTags
	slot = -1
	if (<slot_type> = local_not_signed_in)
		GetArraySize \{all_players_checksum}
		i = 0
		begin
		if (<all_players_checksum> [<i>] = empty)
			<slot> = <i>
			break
		endif
		i = (<i> + 1)
		repeat <array_Size>
	elseif (<slot_type> = remote)
		GetArraySize \{all_players_checksum}
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
		repeat <array_Size>
	elseif (<slot_type> = local_signed_in)
		GetArraySize \{all_players_checksum}
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
		repeat <array_Size>
	endif
	return available_slot = <slot>
endscript

script shift_player_slots 
	onlinelobbyinterface :GetTags
	<player_slots_menu_id> :GetTags
	GetArraySize \{all_players_checksum}
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
	formatText checksumName = gamertag 'gamertag_%d' d = (<i>)
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
	formatText checksumName = gamertag 'gamertag_%d' d = (<i> + 1)
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
	SetArrayElement ArrayName = all_players_checksum index = <i> NewValue = empty
	begin
	if NOT (<controller_value> = unplugged)
		formatText checksumName = controller_status 'plugged_in_%d' d = (<i> + 1)
		SetArrayElement ArrayName = local_controllers index = <controller> NewValue = <controller_status>
	endif
	SetArrayElement ArrayName = all_players_checksum index = (<i> + 1) NewValue = <shift_value_current>
	copy_net_info_into_struct destination_index = (<i> + 2) info = <current_net_info>
	if ((<i> + 2) = <array_Size>)
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
	formatText checksumName = gamertag 'gamertag_%d' d = (<i> + 2)
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
	repeat <array_Size>
	<player_slots_menu_id> :SetTags all_players_checksum = <all_players_checksum> local_controllers = <local_controllers>
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
	formatText checksumName = gamertag 'gamertag_%d' d = (<destination_index> -1)
	Change GlobalName = <gamertag> NewValue = (<info>.gamertag)
	monitorcontrollerstates
endscript

script get_controller_corresponding_ui_slot 
	onlinelobbyinterface :GetTags
	<player_slots_menu_id> :GetTags
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
	onlinelobbyinterface :GetTags
	<player_slots_menu_id> :GetTags
	GetArraySize \{local_controllers}
	controller = 0
	begin
	get_controller_corresponding_ui_slot controller = <controller>
	printf qs(0xd99ce6fd) d = <controller> e = <ui_slot> f = <target_ui_slot>
	if (<ui_slot> = <target_ui_slot>)
		return controller = <controller>
	endif
	controller = (<controller> + 1)
	repeat <array_Size>
	return \{controller = -1}
endscript

script leave_net_main_menu 
	RequireParams \{[
			device_num
		]
		all}
	create_loading_screen \{0xdf3c5641}
	generic_event_back \{state = uistate_mainmenu}
	Change \{is_network_game = 0}
endscript

script refresh_online_lobby 
	Wait \{10
		gameframes}
	printf \{qs(0xda926fa0)}
	ui_event_wait \{event = menu_refresh}
endscript

script matchmaking_host_disband_party 
	printf \{qs(0xafd082fe)}
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if is_ui_event_running
		return
	endif
	NetSessionFunc \{Obj = party
		func = disband_party_session}
	net_clear_all_remote_player_status
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :Obj_SpawnScriptLater \{refresh_online_lobby}
	endif
	generic_event_back
endscript

script 0xc70c0398 
	begin
	if cancel_start_matchmaking
		WaitOneGameFrame
		formatText TextName = errortext qs(0x22ed234f) s = (qs(0x87c9b5d7))
		create_new_generic_popup {
			popup_type = error_menu
			text = <errortext>
			error_func = destroy_generic_popup
		}
		return
	endif
	WaitOneGameFrame
	repeat
endscript

script 0xdcd27ce1 
	begin
	if cntsdpeekcardwasejected
		SpawnScriptNow \{0xc70c0398}
		return
	endif
	WaitOneGameFrame
	repeat
endscript
0x9f2803de = (100.0, 50.0)
0xa74f74f3 = (50.0, 50.0)
0x86e09116 = (101.0, 52.0)
0xf59acc97 = (45.0, 45.0)

script 0x61406d12 
	<Scale> = (1.0, 1.0)
	<offset> = (0.0, 0.0)
	GetDisplaySettings
	if (<widescreen> = true)
		<Scale> = (0.81, 1.0)
		<offset> = (64.0, 0.0)
	endif
	if GotParam \{0x646b2ed6}
		<0x2356f8e2> = (($0x86e09116 * <Scale>) + <offset>)
		<0x889c768f> = ($0xf59acc97 * <Scale>)
	else
		<0x2356f8e2> = (($0x9f2803de * <Scale>) + <offset>)
		<0x889c768f> = ($0xa74f74f3 * <Scale>)
	endif
	return 0x2356f8e2 = <0x2356f8e2> 0x889c768f = <0x889c768f>
endscript

script create_start_matchmaking_container \{friends = None
		action = HOST}
	destroy_popup_warning_menu
	if NOT (<friends> = None)
		if (<friends> = HOST)
			if GotParam \{friend_name}
				formatText TextName = text qs(0x20e6bde1) s = <friend_name>
			else
				text = qs(0xe2b76602)
			endif
		else
			if GotParam \{friend_name}
				formatText TextName = text qs(0x00d56316) s = <friend_name>
			else
				text = qs(0x8dd4c859)
			endif
		endif
		create_popup_warning_menu {
			title = qs(0x982360c4)
			textblock = {
				text = <text>
			}
			parent = onlinelobbyinterface
			no_background
			use_all_controllers
			options = [
				{
					func = cancel_start_matchmaking
					func_params = {friends}
					text = qs(0xf7723015)
				}
			]
		}
	else
		create_popup_warning_menu \{title = qs(0xddccf0c3)
			textblock = {
				text = qs(0xbb856970)
			}
			parent = onlinelobbyinterface
			no_background
			use_all_controllers
			options = [
				{
					func = cancel_start_matchmaking
					text = qs(0xf7723015)
				}
			]}
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
	endif
	CreateScreenElement \{Type = SpriteElement
		parent = popupelement
		texture = online_load_wheel
		Pos = (642.0, 435.0)
		dims = (128.0, 128.0)
		just = [
			center
			center
		]
		z_priority = 521}
	if popupelement :desc_resolvealias \{Name = alias_dlog_message}
		<resolved_id> :se_setprops Pos = {relative (0.0, -20.0)}
	endif
	if popupelement :desc_resolvealias \{Name = alias_dlog_vmenu}
		<resolved_id> :se_setprops Pos = {relative (0.0, 20.0)}
	endif
	popupelement :Obj_SpawnScriptNow animate_online_icon params = {id = <id>}
	popupelement :Obj_SpawnScriptNow update_players_found params = {<...>}
	if (($0xee5eccd5) = 1)
		RunScriptOnScreenElement \{id = popupelement
			0xdcd27ce1}
	endif
	popupelement :Obj_SpawnScriptNow \{0xd8c4019c
		params = {
			condition = {
				0xaea6ae61
				struct = {
					is_valid_instrument_config
					0x9865d28d
				}
			}
			call = {
				cancel_start_matchmaking
				0x7d982792
			}
		}}
endscript
last_cancel_matchmaking_time = 0

script cancel_start_matchmaking 
	begin
	if NOT isdwcinpotentiallyblockingcall
		if NOT GotParam \{from_invalid}
			if ScriptIsRunning \{check_invite_valid}
				KillSpawnedScript \{Name = check_invite_valid}
			endif
		endif
		if GotParam \{friends}
			GetTrueStartTime
			Change last_cancel_matchmaking_time = <starttime>
		endif
		NetSessionFunc \{Obj = match
			func = cancel_join_server}
		NetSessionFunc \{Obj = session
			func = get_matchmaking_status}
		if (<state> = esearching)
			cancel_join_server
			printf \{qs(0xcd8bb11c)}
		else
			quit_network_game
			printf \{qs(0xbff4520f)}
		endif
		Change \{net_new_matchmaking_ui_flag = 0}
		onlinelobbyinterface :GetTags
		if NOT GotParam \{0xd57d1d8c}
			<player_slots_menu_id> :Obj_SpawnScriptLater update_player_slots_ui
		endif
		<player_slots_menu_id> :Obj_KillSpawnedScript Name = 0xbf02b723
		destroy_searching_ui
		if GotParam \{0xd57d1d8c}
			Change \{net_starting_matchmaking = 0}
			0x811282ed
			return \{true}
		endif
		Wait \{1
			Seconds}
		online_lobby_setup_helper_controls
		Change \{net_starting_matchmaking = 0}
		refresh_player_slots_ui
		LaunchEvent \{Type = focus
			target = current_menu}
		if GotParam \{0x7d982792}
			create_intrument_config_warning
		endif
		return \{true}
	else
		stars
		printf \{qs(0x996de991)}
		stars
		if NOT GotParam \{0x7d982792}
			return \{FALSE}
		endif
	endif
	repeat
endscript

script destroy_searching_ui 
	destroy_popup_warning_menu
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
endscript

script update_players_found 
	<time_waited> = 0
	begin
	if NOT isdwcinpotentiallyblockingcall
		if (<time_waited> >= 120)
			create_confirm_search_again <...>
			break
		endif
	endif
	Wait \{1.0
		Seconds}
	<time_waited> = (<time_waited> + 1.0)
	repeat
endscript

script create_confirm_search_again \{friends = None}
	destroy_searching_ui
	Change \{menu_focus_color = $default_menu_focus_color}
	if (<friends> = None)
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
	else
		create_popup_warning_menu {
			title = qs(0x3954a4af)
			textblock = {
				text = qs(0x5f8ebe3e)
			}
			parent = current_menu
			no_background
			options = [
				{
					func = continue_matchmaking_search
					func_params = {<...>}
					text = qs(0x182f0173)
				}
				{
					func = cancel_start_matchmaking
					func_params = {friends}
					text = qs(0xf7723015)
				}
			]
		}
	endif
	if (($0xee5eccd5) = 1)
		RunScriptOnScreenElement \{id = popupelement
			0xdcd27ce1}
	endif
endscript

script continue_matchmaking_search 
	destroy_popup_warning_menu
	create_start_matchmaking_container <...>
endscript

script create_signin_container 
	CreateScreenElement \{Type = ContainerElement
		parent = onlinelobbyinterface
		id = online_lobby_signin_container
		event_handlers = [
			{
				pad_choose
				signin_or_join_game
			}
		]}
	update_signed_in_controllers
	LaunchEvent \{Type = focus
		target = online_lobby_signin_container}
endscript

script update_signed_in_controllers 
	printf \{qs(0xb0cba5b5)}
	if ScreenElementExists \{id = onlinelobbyinterface}
		if ScreenElementExists \{id = online_lobby_signin_container}
			non_signed_in_controllers = []
			signed_in_controllers = []
			GetActiveControllers
			GetArraySize <active_controllers>
			i = 0
			begin
			if (<active_controllers> [<i>] = 1)
				if NOT CheckForSignIn controller_index = <i> dont_set_primary
					AddArrayElement array = <non_signed_in_controllers> element = <i>
					<non_signed_in_controllers> = <array>
				elseif NOT NetSessionFunc func = iscontrolleringame params = {controller = <i>}
					AddArrayElement array = <non_signed_in_controllers> element = <i>
					<non_signed_in_controllers> = <array>
				else
					AddArrayElement array = <signed_in_controllers> element = <i>
					<signed_in_controllers> = <array>
				endif
			else
				AddArrayElement array = <non_signed_in_controllers> element = <i>
				<non_signed_in_controllers> = <array>
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
			AddArrayElement array = <non_signed_in_controllers> element = <i>
			<non_signed_in_controllers> = <array>
			online_lobby_signin_container :se_setprops {exclusive_device = <non_signed_in_controllers>}
			GetArraySize <non_signed_in_controllers>
		endif
		if onlinelobbyinterface :desc_resolvealias \{Name = alias_matchmaking_vmenu}
			<resolved_id> :se_setprops {exclusive_device = <signed_in_controllers>}
		endif
		if onlinelobbyinterface :desc_resolvealias \{Name = alias_online_lobby_right_side}
			if <resolved_id> :desc_resolvealias Name = alias_player_slots_menu
				<resolved_id> :se_setprops {exclusive_device = <signed_in_controllers>}
			endif
		endif
	endif
endscript

script signin_or_join_game 
	printf \{qs(0xab5ccbec)}
	RequireParams \{[
			device_num
		]
		all}
	if NetSessionFunc \{Obj = party
			func = is_host}
		if ($net_starting_matchmaking = 0)
			Change \{net_block_matchmaking = 1}
			if NOT (party_is_full)
				if isXenon
					if NOT CheckForSignIn controller_index = <device_num> dont_set_primary
						generic_menu_pad_choose_sound
						if onlinelobbyinterface :desc_resolvealias \{Name = alias_online_lobby_right_side}
							if <resolved_id> :desc_resolvealias Name = alias_player_slots_menu
								<resolved_id> :Obj_KillSpawnedScript Name = update_player_slots_ui
							endif
						endif
						if CheckForSignIn local controller controller_index = <device_num>
							NetSessionFunc \{func = showsigninui
								params = {
									convert_offline_to_guest
								}}
						else
							NetSessionFunc \{func = showsigninui4pane
								params = {
									online_only
								}}
						endif
						wait_for_blade_complete
						Wait \{1.0
							Seconds}
						if onlinelobbyinterface :desc_resolvealias \{Name = alias_online_lobby_right_side}
							if <resolved_id> :desc_resolvealias Name = alias_player_slots_menu
								<resolved_id> :Obj_SpawnScriptNow update_player_slots_ui
							endif
						endif
					else
						generic_menu_pad_choose_sound
						if can_add_vocals_player device_num = <device_num>
							NetSessionFunc func = addcontrollers params = {controller = <device_num>}
							if NOT NetSessionFunc func = xenonisguest params = {controller_index = <device_num>}
								net_clear_all_remote_player_status
								generic_event_replace no_sound state = uistate_signin data = {device_num = <device_num> allow_back = 0 new_state = uistate_online primary = 0}
							else
								if isscreenelementinfocus \{id = current_menu}
									online_lobby_setup_helper_controls
								else
									online_lobby_setup_helper_controls \{menu_type = right_hand}
								endif
								Change \{need_to_refresh_player_slots = 1}
							endif
						else
							create_vocals_warning
						endif
					endif
				else
					if can_add_vocals_player device_num = <device_num>
						NetSessionFunc func = addcontrollers params = {controller = <device_num>}
						restore_save_net_preferences controller_index = <device_num>
						if isscreenelementinfocus \{id = current_menu}
							online_lobby_setup_helper_controls
						else
							online_lobby_setup_helper_controls \{menu_type = right_hand}
						endif
						Change \{need_to_refresh_player_slots = 1}
					else
						create_vocals_warning
					endif
				endif
			endif
		endif
	endif
endscript

script set_gamemode_by_instrument 
	RequireParams \{[
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
	netoptions :pref_get \{Name = game_modes}
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
	netoptions :pref_getstruct \{Name = game_modes}
	printf qs(0x6473d26f) d = <player_num> s = <part> g = (<pref_struct>.search_chk)
endscript

script set_game_mode_by_search_mode 
	RequireParams \{[
			search_checksum
		]
		all}
	netoptions :pref_size \{Name = game_modes}
	found = 0
	i = 0
	begin
	netoptions :pref_getstruct Name = game_modes index = <i>
	if (<pref_struct>.search_chk = <search_checksum>)
		printf qs(0x4ad03a75) i = <i>
		netoptions :pref_choose Name = game_modes index = <i>
		<found> = 1
		break
	endif
	<i> = (<i> + 1)
	repeat <size>
	if (<found> = 1)
		if NetSessionFunc \{Obj = party
				func = is_host}
			netoptions :pref_get \{Name = game_modes}
			NetSessionFunc Obj = party func = append_shared_data params = {data = {game_mode = <index>}}
		endif
	else
		ScriptAssert qs(0x32e227bd) d = <search_checksum>
	endif
endscript

script start_matchmaking 
	printf \{qs(0x14c9ca0a)}
	RequireParams \{[
			device_num
		]
		all}
	if CheckForSignIn controller_index = <device_num>
		if vocalist_has_mic
			netoptions :pref_get \{Name = game_modes}
			if ((<checksum> = p2_pro_faceoff) || (<checksum> = p2_faceoff))
				set_gamemode_by_instrument device_num = <device_num>
			endif
			if is_valid_instrument_config
				set_characters_by_controller
				if NOT 0x37193edf \{0x26c0a068}
					return
				endif
				Change \{0x93955a40 = 0}
				Change \{0xd99154a8 = 0}
				destroy_online_warning_message
				if isps3
					destroy_ps3_chat_warning_message
				endif
				netoptions :pref_get \{Name = game_modes}
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
				<rand> = Random (@ 0 @ 1 )
				if (<rand> = 0)
					action = join
				else
					action = HOST
				endif
				ui_menu_select_sfx
				set_net_ui_to_searching action = <action>
				clear_temp_net_id_array
				setup_temp_net_id_array
				Change \{net_new_matchmaking_ui_flag = 1}
				Change \{net_num_player_settings_ack = 0}
				if (<action> = HOST)
					printf \{qs(0xb24bfaa0)}
					0xdc63a126
					set_network_preferences
					setup_and_post_game device_num = <device_num>
					onlinelobbyinterface :GetTags
					<player_slots_menu_id> :Obj_SpawnScriptNow 0xbf02b723
				else
					printf \{qs(0x96fee678)}
					get_custom_match_search_params
					set_network_preferences
					0x324d7178 <...> 0x0cb4e4f6 = 0
					onlinelobbyinterface :GetTags
					<player_slots_menu_id> :Obj_SpawnScriptNow 0xbf02b723
				endif
			else
				menu_scroll_end_sound
				create_intrument_config_warning
			endif
		else
			menu_scroll_end_sound
			create_microphone_warning
		endif
	else
		menu_scroll_end_sound
	endif
endscript

script setup_temp_net_id_array 
	GetActiveControllers
	GetArraySize <active_controllers>
	i = 0
	begin
	if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
		GetNetID controller_index = (<i>)
		NetSessionFunc Obj = match func = get_gamertag params = {controller = <i>}
		SetArrayElement ArrayName = temp_net_id globalarray index = <i> NewValue = {net_id_first = <net_id_first> net_id_second = <net_id_second> Name = <Name>}
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script vocalist_has_mic 
	found_vocalist = 0
	GetActiveControllers
	GetArraySize <active_controllers>
	i = 0
	begin
	if (<active_controllers> [<i>] = 1)
		if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
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
	repeat <array_Size>
	if (<found_vocalist> = 1)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script create_microphone_warning 
	Change \{net_no_focus_warning = 1}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	if isps3
		popup_text = qs(0xe2f3f704)
	elseif isXenon
		popup_text = qs(0xec4dbd17)
	else
		popup_text = qs(0x403a6f27)
	endif
	create_net_popup title = qs(0xaa163738) popup_text = <popup_text>
	if ScreenElementExists \{id = popupelement}
		popupelement :Obj_SpawnScriptNow \{wait_and_kill_config_warning_popup
			params = {
				helper_controls_script = online_lobby_setup_helper_controls
			}}
	endif
endscript

script is_valid_instrument_config 
	if NOT GotParam \{0x9865d28d}
		printf \{qs(0x5f460716)}
	endif
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
	0x8292b3e0 = 0
	if GotParam \{game_mode}
		search_mode = <game_mode>
		<0x8292b3e0> = 1
	else
		netoptions :pref_getstruct \{Name = game_modes}
		search_mode = (<pref_struct>.search_chk)
	endif
	index = 0
	0x299a851e = -1
	begin
	if NetSessionFunc func = iscontrolleringame params = {controller = <index>}
		<num_local_players> = (<num_local_players> + 1)
		<num_players> = (<num_players> + 1)
		get_player_num_from_controller controller_index = <index>
		get_controller_type controller_index = <index>
		getplayerinfo <player_num> part
		if NOT GotParam \{0x9865d28d}
			printf qs(0x3216a9a6) d = <controller_type> s = <part>
		endif
		switch <controller_type>
			case guitar
			if NOT (<part> = bass || <part> = guitar)
				return \{FALSE}
			endif
			case drum
			if NOT (<part> = drum)
				return \{FALSE}
			endif
			case vocals
			case controller
			if NOT (<part> = vocals)
				return \{FALSE}
			endif
		endswitch
		switch (<part>)
			case bass
			<num_bass> = (<num_bass> + 1)
			<num_local_bass> = (<num_local_bass> + 1)
			<num_guitars> = (<num_guitars> + 1)
			<num_local_guitars> = (<num_local_guitars> + 1)
			case guitar
			<num_guitars> = (<num_guitars> + 1)
			<num_local_guitars> = (<num_local_guitars> + 1)
			<0x299a851e> = <player_num>
			case drum
			<num_drums> = (<num_drums> + 1)
			<num_local_drums> = (<num_local_drums> + 1)
			case vocals
			<num_mics> = (<num_mics> + 1)
			<num_local_mics> = (<num_local_mics> + 1)
		endswitch
		if NOT GotParam \{0x9865d28d}
			printf qs(0x7751799a) d = <player_num> e = <part>
		endif
	endif
	<index> = (<index> + 1)
	repeat 4
	if NOT GotParam \{0x9865d28d}
		printstruct <...>
	endif
	if ((<num_guitars> > 4) || (<num_drums> > 2) || (<num_mics> > 2) ||
			(<num_local_guitars> > 2) || (<num_local_drums> > 1) || (<num_local_mics> > 1))
		return \{FALSE}
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
			elseif (<0x8292b3e0> = 1 && <num_players> = 1 && <num_local_guitars> = 1)
				setplayerinfo <0x299a851e> part = bass
				return \{true}
			elseif (<0x8292b3e0> = 1 && <num_players> = 2 && <num_local_guitars> = 1 && <num_guitars> = 2)
				setplayerinfo <0x299a851e> part = bass
				return \{true}
			endif
		endif
		case p4_pro_faceoff
		if (<num_local_players> = 2 && <num_players> <= 4 && <num_mics> = 0 && <num_drums> = 0 && <num_guitars> = 2)
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
		if (<num_local_players> = 4 && <num_mics> = 1 && <num_guitars> = 2 && <num_drums> = 1)
			return \{true}
		endif
		if (<num_local_players> = 3 && <num_mics> = 0 && <num_guitars> = 2 && <num_drums> = 1)
			return \{true}
		endif
		return \{FALSE}
		case p2_career
		return \{FALSE}
		default
		return \{FALSE}
	endswitch
	return \{FALSE}
endscript

script create_intrument_config_warning \{helper_controls_script = online_lobby_setup_helper_controls
		msg_txt = qs(0x2d14c74a)}
	Change \{net_no_focus_warning = 1}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	create_net_popup title = qs(0xaa163738) popup_text = <msg_txt>
	if ScreenElementExists \{id = popupelement}
		popupelement :Obj_SpawnScriptNow wait_and_kill_config_warning_popup params = {helper_controls_script = <helper_controls_script>}
	endif
endscript

script wait_and_kill_config_warning_popup 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	setscriptcannotpause
	0x79db87d7
	Wait \{3.0
		Seconds}
	destroy_net_popup
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
	<helper_controls_script>
	Change \{net_no_focus_warning = 0}
	LaunchEvent \{Type = focus
		target = current_menu}
	0xf00f29a9
endscript

script net_quick_create 
	printf \{qs(0xeed4fc3d)}
	RequireParams \{[
			device_num
		]
		all}
	if (<device_num> = $primary_controller)
		if CheckForSignIn controller_index = <device_num>
			if NOT 0x37193edf \{0x26c0a068}
				return
			endif
			Change \{0x93955a40 = 0}
			Change \{0xd99154a8 = 0}
			destroy_online_warning_message
			if isps3
				destroy_ps3_chat_warning_message
			endif
			ui_menu_select_sfx
			set_net_ui_to_searching
			Change \{net_new_matchmaking_ui_flag = 1}
			Change \{net_num_player_settings_ack = 0}
			0xdc63a126
			get_custom_match_search_params
			set_network_preferences
			0x324d7178 <...> 0x0cb4e4f6 = 0
			SpawnScriptLater \{0x829905f8}
			if NOT CD
				net_create_matchmaking_status_window
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

script 0x811282ed \{for_invite = 0}
	if (<for_invite> = 1)
		netoptions :pref_get \{Name = game_modes}
		if ((<checksum> = p2_pro_faceoff) || (<checksum> = p2_faceoff))
			set_gamemode_by_instrument device_num = <device_num>
		endif
		if NOT is_valid_instrument_config
			create_intrument_config_warning
			return
		endif
	endif
	launch_friends_list for_invite = <for_invite>
endscript

script 0x46565f08 
	generic_event_choose \{state = uistate_dlc_menu}
endscript

script set_net_ui_to_searching \{action = HOST}
	begin
	if ScreenElementExists \{id = current_menu}
		break
	endif
	printf \{qs(0x6be160ca)}
	Wait \{1
		Frame}
	repeat
	onlinelobbyinterface :GetTags
	LaunchEvent \{Type = unfocus
		target = current_menu}
	Wait \{2
		Second}
	create_start_matchmaking_container friends = <friends> friend_name = <friend_name> action = <action>
	<player_slots_menu_id> :Obj_KillSpawnedScript Name = update_player_slots_ui
	remove_locals_not_ingame
	<player_slots_menu_id> :GetTags
	GetArraySize \{all_players_checksum}
	i = 0
	begin
	if (<all_players_checksum> [<i>] = empty)
		if ((<i> + 1) = <array_Size>)
			printf qs(0xb065622b) m = <i> d = <j>
			break
		endif
		j = (<i> + 1)
		second_loop = (<array_Size> - <j>)
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
			<player_slots_menu_id> :GetSingleTag all_players_checksum
			break
		endif
		j = (<j> + 1)
		repeat <second_loop>
	endif
	i = (<i> + 1)
	repeat <array_Size>
	remove_empty_slots_from_status_structs
	refresh_player_slots_ui
	set_net_dialog_message \{msg_checksum = start_matchmaking}
endscript

script remove_locals_not_ingame 
	onlinelobbyinterface :GetTags
	<player_slots_menu_id> :GetTags
	GetArraySize \{all_players_checksum}
	i = 0
	begin
	if (<all_players_checksum> [<i>] = local_not_signed_in)
		get_ui_slot_corresponding_controller target_ui_slot = <i>
		add_remove_player_to_net_ui action = remove ui_slot = <i> index = <controller> player_type = local_not_signed_in
		if GotParam \{one_player}
			return
		endif
	elseif (<all_players_checksum> [<i>] = local_signed_in)
		get_ui_slot_corresponding_controller target_ui_slot = <i>
		if NOT NetSessionFunc func = iscontrolleringame params = {controller = <controller>}
			add_remove_player_to_net_ui action = remove ui_slot = <i> index = <controller> player_type = local_signed_in
			if GotParam \{one_player}
				return
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script remove_empty_slots_from_status_structs 
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :GetTags
		<player_slots_menu_id> :GetTags
		GetArraySize \{all_players_checksum}
		i = 0
		begin
		if (<all_players_checksum> [<i>] = empty)
			formatText checksumName = player_status 'player%d_status' d = (<i> + 1)
			Change structurename = <player_status> is_local_client = 0
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script set_net_ui_to_finished_searching 
	printf \{qs(0x385807d3)}
	if ScreenElementExists \{id = onlinelobbyinterface}
		spawn_player_drop_listeners \{drop_player_script = matchmaking_countdown_drop_player_script
			end_game_script = matchmaking_countdown_end_game_script}
		destroy_searching_ui
		sent_settings_sync = 0
		set_ui_to_final_player_slots
		Change \{online_song_choice_id = 0}
		index = ($online_to_setlist_count)
		onlinelobbyinterface :SetTags \{0x1fec3149 = 1}
		begin
		formatText TextName = timer_msg qs(0x51bb1984) d = <index>
		if ScreenElementExists \{id = onlinelobbyinterface}
			onlinelobbyinterface :se_setprops net_info_text = (<timer_msg>)
		endif
		if (<index> = 5)
			onlinelobbyinterface :SetTags \{toggle_allowed = 0}
			set_ui_to_final_player_slots \{locked}
		elseif (<index> < 5 && (<sent_settings_sync> = 0))
			<sent_settings_sync> = 1
			host_start_player_settings_sync
		endif
		if (<index> = 0)
			break
		endif
		index = (<index> - 1)
		Wait \{1
			Second}
		repeat
		onlinelobbyinterface :RemoveTags \{[
				0x1fec3149
			]}
		vocals_distribute_mics
		0xf7e0f992 \{Wait}
		if NOT ($net_match_dlc_sync_finished = 1)
			if isps3
				title = qs(0xe60e3e4a)
			else
				title = qs(0x37f4c584)
			endif
			destroy_popup_warning_menu
			create_popup_warning_menu {
				title = <title>
				title_props = {Scale = 1.0}
				textblock = {
					text = qs(0x1fb396f2)
					Pos = (640.0, 380.0)
				}
				no_background
			}
			CreateScreenElement \{Type = SpriteElement
				parent = popupelement
				texture = online_load_wheel
				Pos = (642.0, 420.0)
				dims = (128.0, 128.0)
				just = [
					center
					center
				]
				z_priority = 521}
			popupelement :Obj_SpawnScriptNow animate_online_icon params = {id = <id>}
			wait_time = 0
			begin
			if ($net_match_dlc_sync_finished = 1)
				break
			elseif (<wait_time> > 15)
				KillSpawnedScript \{Name = net_match_send_available_items}
				break
			endif
			<wait_time> = (<wait_time> + 1)
			Wait \{1.0
				Seconds}
			repeat
			destroy_popup_warning_menu
		endif
		ui_event_get_top
		if GotParam \{is_popup}
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
	if IsHost
		gamemode_getnumplayers
		index = 1
		num_bass = [0 0]
		num_guitar = [0 0]
		begin
		getplayerinfo <index> part
		getplayerinfo <index> team
		if (<part> = guitar || <part> = bass)
			if (<part> = guitar)
				SetArrayElement ArrayName = num_guitar index = <team> NewValue = (<num_guitar> [<team>] + 1)
				if (<num_guitar> [<team>] > 1)
					setplayerinfo <index> part = bass
				else
					setplayerinfo <index> part = guitar
				endif
			elseif (<part> = bass)
				SetArrayElement ArrayName = num_bass index = <team> NewValue = (<num_bass> [<team>] + 1)
				if (<num_bass> [<team>] > 1)
					setplayerinfo <index> part = guitar
				else
					setplayerinfo <index> part = bass
				endif
			endif
		endif
		<index> = (<index> + 1)
		repeat (<num_players>)
		if ScreenElementExists \{id = onlinelobbyinterface}
			if ($network_game_postgame_lobby = 0)
				onlinelobbyinterface :GetTags
				set_ui_to_final_player_slots slot = <slot_index> locked
			else
				refresh_player_scores_postgame_container \{locked}
			endif
		endif
	endif
endscript

script set_ui_to_final_player_slots \{slot = 0}
	destroy_player_slots_ui
	onlinelobbyinterface :GetTags
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
	formatText checksumName = gamertag 'gamertag_%d' d = (<index> - 1)
	Name = $<gamertag>
	xuid = [0 0]
	SetArrayElement ArrayName = xuid index = 0 NewValue = (<net_id_first>)
	SetArrayElement ArrayName = xuid index = 1 NewValue = (<net_id_second>)
	Color = ($player_slot_team1)
	if NOT gamemode_iscooperative
		if (<index> > <num_players> / 2)
			Color = ($player_slot_team2)
		endif
	endif
	getplayerinfo <index> career_earnings
	cash_get_info_from_earnings earnings = <career_earnings>
	getplayerinfo <index> controller
	getplayerinfo <index> is_local_client
	formatText TextName = cash_text qs(0x76b3fda7) d = <rank>
	online_lobby_add_player_slot {
		Name = <Name>
		controller_texture = <icon_texture>
		xuid = <xuid>
		player_slot_rgba = <Color>
		parent = <player_slots_menu_id>
		cash_text = <cash_text>
		cash_icon_id = <cash_icon_id>
		controller = <controller>
		is_local_client = <is_local_client>
	}
	<index> = (<index> + 1)
	repeat <num_players>
	clean_up_user_control_helpers
	netoptions :pref_get \{Name = game_modes}
	if GotParam \{locked}
		new_event_handlers = [
			{pad_up net_up_down_action params = {action = up}}
			{pad_down net_up_down_action params = {action = down}}
		]
		if isXenon
			add_user_control_helper \{text = qs(0xfcc51f45)
				button = green
				z = 100000}
		endif
	elseif (<checksum> = p4_pro_faceoff || <checksum> = p2_quickplay || <checksum> = p4_quickplay || <checksum> = p8_pro_faceoff)
		new_event_handlers = [
			{pad_up net_up_down_action params = {action = up}}
			{pad_down net_up_down_action params = {action = down}}
			{pad_L1 toggle_guitar_part params = {finished_matchmaking}}
		]
		if isXenon
			add_user_control_helper \{text = qs(0xfcc51f45)
				button = green
				z = 100000}
		endif
		GetActiveControllers
		GetArraySize <active_controllers>
		i = 0
		begin
		if (<active_controllers> [<i>] = 1)
			if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
				get_controller_type controller_index = <i>
				if (<controller_type> = guitar)
					netoptions :pref_get \{Name = game_modes}
					if NOT (<checksum> = p2_battle)
						add_user_control_helper text = qs(0x0d215c11) button = 0x99d195c9 z = 100000 controller = <i> use_guitar_button = 1
						break
					endif
				endif
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	else
		new_event_handlers = [
			{pad_up net_up_down_action params = {action = up}}
			{pad_down net_up_down_action params = {action = down}}
		]
		if isXenon
			add_user_control_helper \{text = qs(0xfcc51f45)
				button = green
				z = 100000}
		endif
	endif
	SetScreenElementProps {
		id = <player_slots_menu_id>
		event_handlers = []
		replace_handlers
	}
	SetScreenElementProps {
		id = <player_slots_menu_id>
		event_handlers = <new_event_handlers>
		replace_handlers
	}
	onlinelobbyinterface :SetTags slot_items = <num_players> menu_items = 0 slot_index = 0 locked_to_players = 1
	LaunchEvent Type = focus target = <player_slots_menu_id> data = {child_index = <slot>}
endscript

script online_lobby_add_player_slot \{cash_text = qs(0x3bf547a6)
		cash_icon_id = cash_milestone_icon_002}
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :GetTags
		unfocus_color_param = {}
		if GotParam \{player_slot_rgba}
			<unfocus_color_param> = {unfocus_color = <player_slot_rgba>}
		endif
		CreateScreenElement {
			Type = descinterface
			desc = 'online_lobby_player_slot'
			parent = <parent>
			auto_dims = FALSE
			dims = (474.0, 50.0)
			event_handlers = [
				{focus player_slot_change_focus params = {focus}}
				{unfocus player_slot_change_focus params = {unfocus <unfocus_color_param>}}
			]
		}
		ngc_getwide
		if (<widescreen> = true)
			if <id> :desc_resolvealias Name = alias_sign_in_button param = signin_id
				<signin_id> :SetProps {
					internal_scale = (0.9, 0.9)
				}
			endif
		endif
		if isXenon
			if GotParam \{xuid}
				<id> :se_setprops event_handlers = [{pad_choose ui_menu_select_sfx}
					{pad_choose menu_show_gamercard_from_netid params = {net_id = <xuid>}}
				]
				if (<is_local_client> = 0)
					<id> :Obj_SpawnScriptLater update_headset_status params = {obj_id = <id> uid = <xuid>}
				elseif GotParam \{controller}
					if NOT NetSessionFunc func = xenonisguest params = {controller_index = (<controller>)}
						<id> :Obj_SpawnScriptLater update_headset_status params = {obj_id = <id> uid = <xuid>}
					endif
				endif
			endif
		endif
		<id> :se_setprops {
			player_slot_name_text = <Name>
			player_instrument_logo_texture = <controller_texture>
			player_slot_rgba = <player_slot_rgba>
			cash_icon_texture = <cash_icon_id>
			cash_rank_text = <cash_text>
			cash_icon_alpha = 1
		}
		if <id> :desc_resolvealias Name = alias_sign_in_button param = signin_id
			<signin_id> :Die
		endif
	endif
endscript

script update_ui_total_players 
	printf \{qs(0xdbe11d09)}
	KillSpawnedScript \{Name = check_invite_valid}
	KillSpawnedScript \{Name = check_player_disconnect}
	KillSpawnedScript \{Name = 0xd8a5be9f}
	onlinelobbyinterface :GetTags
	<player_slots_menu_id> :Obj_KillSpawnedScript Name = 0xbf02b723
	get_local_players_in_game
	0x39d845f7 = (<total_players> - <num_local_players>)
	if (<0x39d845f7> = 1)
		formatText TextName = message qs(0xf9d8c389) d = <0x39d845f7>
	else
		formatText TextName = message qs(0xec3e63e5) d = <0x39d845f7>
	endif
	if ScreenElementExists \{id = popupelement}
		popupelement :SetProps {
			popupbody_text = <message>
		}
	endif
	gamemode_gettype
	if (<Type> = career)
		printf \{qs(0x810d64d1)}
		get_local_players_in_game
		if (($num_players_in_band = <num_local_players>) && ($num_players_in_band = <total_players>))
			Wait \{1
				Second}
			finalizejoinprocesslocalonly
		endif
	else
	endif
	Change net_num_players = <total_players>
endscript

script net_msg_update_player_ui 
	printf \{qs(0x315363a3)}
	gamemode_gettype
	if (<Type> = career)
		net_add_player_to_career_ui {
			Name = <gamertag_string>
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
	if (<Type> = career)
		if ($0x0c2faa8d = 1)
			printf \{qs(0x30ae5bd0)}
			Change \{0x0c2faa8d = 0}
		endif
		if NOT IsHost
			register_new_progression_atoms \{career_band}
			proceed_to_band_lobby
		else
			ui_band_mode_change_menu_focus_all \{focus_type = focus
				local_only}
			get_player_num_from_controller controller_index = ($primary_controller)
			SendStructure callback = net_career_asign_band_leader_icon data_to_send = {player_num = <player_num>}
			if ScreenElementExists \{id = myinterfaceelement}
				myinterfaceelement :obj_spawnscript \{net_career_host_finalize_menu_ui}
			endif
		endif
	else
		if ScreenElementExists \{id = onlinelobbyinterface}
			onlinelobbyinterface :Obj_SpawnScriptLater \{set_net_ui_to_finished_searching}
		else
			SpawnScriptLater \{set_net_ui_to_finished_searching}
		endif
	endif
endscript

script choose_random_venue 
	GetArraySize ($LevelZoneArray)
	begin
	GetRandomValue Name = level_index integer a = 0 b = (<array_Size> -1)
	get_LevelZoneArray_checksum index = <level_index>
	if NOT StructureContains structure = ($LevelZones.<level_checksum>) debug_only
		Change current_level = <level_checksum>
		break
	endif
	repeat
endscript

script host_start_player_settings_sync 
	if IsHost
		if ($net_num_player_settings_ack = 0)
			printf \{qs(0xd493fca3)}
			SendStructure \{callback = player_settings_request
				data_to_send = {
					None
				}}
			i = 1
			num_local_players = 4
			begin
			formatText checksumName = player_status 'player%d_status' d = <i>
			if ((($<player_status>.is_local_client) = 1) && (($<player_status>.net_obj_id) >= 0))
				Change net_num_player_settings_ack = ($net_num_player_settings_ack + 1)
				printf ($net_num_player_settings_ack)
			endif
			i = (<i> + 1)
			repeat <num_local_players>
		else
			gamemode_gettype
			if (<Type> = quickplay)
				i = 1
				num_max_local_players = 4
				num_local_players = 0
				begin
				formatText checksumName = player_status 'player%d_status' d = <i>
				if ((($<player_status>.is_local_client) = 1) && (($<player_status>.net_obj_id) >= 0))
					num_local_players = (<num_local_players> + 1)
				endif
				i = (<i> + 1)
				repeat <num_max_local_players>
				if (($net_num_players) = <num_local_players>)
					lock_player_parts
				endif
			endif
		endif
	endif
endscript
player_drop_in_setting_sync = 0

script 0xc245765c 
	generic_event_choose \{state = uistate_setlist}
endscript

script player_settings_request 
	printf \{qs(0xbe85d6ff)}
	gamemode_gettype
	if (<Type> = career)
		begin
		if ($net_career_data_sync_done = 0)
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	num_local_players = 4
	player_data = {}
	i = 1
	begin
	formatText checksumName = player_status 'player%d_status' d = <i>
	if ((($<player_status>.is_local_client) = 1) && (($<player_status>.net_obj_id) >= 0))
		netoptions :pref_getstruct \{Name = game_modes}
		switch (<pref_struct>.search_chk)
			case p2_pro_faceoff_bass
			case p2_faceoff_bass
			if ($<player_status>.part = guitar)
				setplayerinfo <i> part = bass
			endif
			case p2_pro_faceoff
			case p2_faceoff
			if ($<player_status>.part = bass)
				setplayerinfo <i> part = guitar
			endif
		endswitch
		appendstruct {
			struct = player_data
			Field = <player_status>
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
	if NOT (<Type> = career)
		if ScreenElementExists \{id = onlinelobbyinterface}
			if ($network_game_postgame_lobby = 0)
				onlinelobbyinterface :GetTags
				set_ui_to_final_player_slots slot = <slot_index> locked
			endif
		endif
	endif
	SendStructure callback = player_settings_request_ack data_to_send = {player_data = <player_data>} to_server
endscript

script player_settings_request_ack 
	printf \{qs(0xefe6d493)}
	if GotParam \{player_data}
		num_local_players = 4
		i = 1
		begin
		formatText checksumName = player_status 'player%d_status' d = <i>
		if StructureContains structure = <player_data> <player_status>
			num_net_players = 8
			j = 1
			begin
			getplayerinfo <j> net_obj_id
			if (<net_obj_id> = <player_data>.<player_status>.player_obj_id)
				Change net_num_player_settings_ack = ($net_num_player_settings_ack + 1)
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
	gamemode_getnumplayers
	Change net_num_players = <num_players>
	if (($net_num_players) = ($net_num_player_settings_ack))
		printf \{qs(0x016b9c08)}
		Change \{net_num_player_settings_ack = 0}
		gamemode_gettype
		if (<Type> = career)
			net_career_check_instruments
		else
			lock_player_parts
		endif
		num_valid_players = 0
		player_data = {}
		i = 0
		begin
		formatText checksumName = player_status 'player%d_status' d = (<i> + 1)
		if (($<player_status>.net_obj_id) >= 0)
			appendstruct {
				struct = player_data
				Field = <player_status>
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
		SendStructure callback = finish_player_settings_sync data_to_send = {player_data = <player_data>}
		if (<Type> = career)
			count = 0
			i = 1
			num_local_players = 4
			begin
			formatText checksumName = player_status 'player%d_status' d = <i>
			if ((($<player_status>.net_obj_id) >= 0) && (($<player_status>.is_local_client) = 1))
				Change net_num_player_settings_ack = (($net_num_player_settings_ack) + 1)
				printf qs(0xfe4ea33f) d = ($net_num_player_settings_ack)
			endif
			i = (<i> + 1)
			repeat <num_local_players>
			if ScreenElementExists \{id = myinterfaceelement}
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
endscript

script finish_player_settings_sync 
	printf \{qs(0xc8dc30a5)}
	printstruct <...>
	if GotParam \{player_data}
		num_net_players = 8
		i = 1
		begin
		formatText checksumName = player_status 'player%d_status' d = <i>
		if StructureContains structure = <player_data> <player_status>
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
	if (<Type> = career)
		if ScreenElementExists \{id = myinterfaceelement}
			myinterfaceelement :SetTags \{settings_finalized = 1}
		endif
		count = 0
		i = 1
		num_local_players = 4
		begin
		formatText checksumName = player_status 'player%d_status' d = <i>
		if ((($<player_status>.net_obj_id) >= 0) && (($<player_status>.is_local_client) = 1))
			count = (<count> + 1)
		endif
		i = (<i> + 1)
		repeat <num_local_players>
		SendStructure callback = finish_player_settings_sync_ack data_to_send = {num_ready = <count>}
	else
		if ScreenElementExists \{id = onlinelobbyinterface}
			if ($network_game_postgame_lobby = 0)
				onlinelobbyinterface :GetTags
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
	if (<Type> = career)
		Change net_num_player_settings_ack = (($net_num_player_settings_ack) + <num_ready>)
		printf qs(0xab067796) d = ($net_num_player_settings_ack)
	endif
endscript

script set_characters_by_controller 
	player_num = 1
	begin
	getplayerinfo <player_num> is_local_client
	if (<is_local_client> = 1)
		getplayerinfo <player_num> controller
		getplayerinfo <player_num> character_id
		if (0 <= <controller> && <controller> < 4)
			if NetSessionFunc func = iscontrolleringame params = {controller = <controller>}
				get_savegame_from_controller controller = <controller>
				set_band_character_id_globaltag savegame = <savegame> controller = <controller> character_id = <character_id> Player = <player_num>
			endif
		endif
	endif
	player_num = (<player_num> + 1)
	repeat 4
endscript

script net_party_host_started_matchmaking 
	printf \{qs(0xea82e4e2)}
	set_characters_by_controller
	gamemode_gettype
	if (<Type> = career)
		Change \{net_band_mode_menu = lobby}
		Change \{0x0c2faa8d = 1}
		get_local_players_in_game
		Change num_players_in_band = <num_local_players>
		ui_event \{event = menu_change
			data = {
				state = uistate_band_mode
			}}
	else
		remove_empty_slots_from_status_structs
		Change \{net_new_matchmaking_ui_flag = 1}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		set_net_dialog_message \{msg_checksum = start_matchmaking}
	endif
endscript

script net_party_attempted_join_result 
	printf \{qs(0x781f28a3)}
	RequireParams \{[
			join_result
			join_mode
		]
		all}
	Change \{has_invite_join_result_callback_completed = 1}
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
			Change \{game_mode = p4_career}
			Change \{net_band_mode_menu = invite}
			net_party_save_off_invite_controllers
			netoptions :pref_choose \{Name = game_modes
				checksum = p4_career}
			destroy_loading_screen
			ui_event \{event = menu_change
				data = {
					state = uistate_net_setup
				}}
		else
			Change \{game_mode = p2_faceoff}
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
			if GotParam \{reason}
				if (<reason> = bad_state)
					<popup_text> = qs(0x33923e7f)
				endif
			endif
		else
			popup_text = qs(0x4e216451)
			if GotParam \{reason}
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
			no_background
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
		}}
endscript

script net_party_lost_party_connection 
	printf \{qs(0xb6121789)}
	ui_event_get_stack
	if NOT ((<stack> [0].base_name) = 'mainmenu')
		gamemode_gettype
		if (<Type> = career)
			wait_for_safe_shutdown
			Change \{net_ready_to_start = 1}
			if ui_event_exists_in_stack \{Name = 'group_play'}
				printf \{qs(0x2cbfbd37)}
				Change \{is_network_game = 0}
				ui_event \{event = menu_back
					data = {
						state = uistate_group_play
					}}
			elseif ui_event_exists_in_stack \{Name = 'online'}
				printf \{qs(0x1bd529ce)}
				ui_event \{event = menu_back
					data = {
						state = uistate_online
					}}
			endif
			create_net_popup \{title = qs(0x5ca2c535)
				popup_text = qs(0x6c53663a)}
			Wait \{3
				Seconds}
			destroy_net_popup
		else
			Player = 1
			gamemode_getnumplayers
			begin
			formatText checksumName = player_status 'player%p_status' p = <Player>
			if ($<player_status>.is_local_client = 0)
				net_clear_player_status player_status = <player_status>
			endif
			<Player> = (<Player> + 1)
			repeat <num_players>
			ui_event \{event = menu_refresh
				data = {
					lost_party
				}}
		endif
	endif
endscript

script net_party_receive_host_party_info 
	printf \{qs(0x3529c519)}
endscript

script party_is_full 
	NetSessionFunc \{Obj = party
		func = get_party_members}
	GetArraySize <connections>
	if (<array_Size> >= 8)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script ui_slots_are_full 
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :GetTags
		if ScreenElementExists id = <player_slots_menu_id>
			<player_slots_menu_id> :GetTags
			GetArraySize <all_players_checksum>
			if (<array_Size> > 0)
				index = 0
				begin
				if (<all_players_checksum> [<index>] = empty)
					return \{FALSE}
				endif
				index = (<index> + 1)
				repeat <array_Size>
			endif
		endif
	endif
	return \{true}
endscript

script menu_net_matchmaking_init 
	printf \{qs(0xcc5ed367)}
	printf qs(0x7456dde0) d = ($primary_controller)
	NetSessionFunc {
		Obj = party
		func = create_party_session
		params = {
			controller_index = ($primary_controller)
		}
	}
	NetSessionFunc \{Obj = party
		func = set_joiner_mode
		params = {
			mode = online_menu
		}}
endscript

script net_party_debug_dump 
	printf \{qs(0x5243db76)}
	NetSessionFunc \{Obj = party
		func = get_party_members}
	printstruct <...>
endscript

script menu_net_matchmaking_deinit 
	printf \{qs(0x56ab650d)}
	NetSessionFunc \{Obj = party
		func = stop_party_session}
endscript
temp_net_id = [
	{
		net_id_first = 0
		net_id_second = 0
		Name = qs(0x00000000)
	}
	{
		net_id_first = 0
		net_id_second = 0
		Name = qs(0x00000000)
	}
	{
		net_id_first = 0
		net_id_second = 0
		Name = qs(0x00000000)
	}
	{
		net_id_first = 0
		net_id_second = 0
		Name = qs(0x00000000)
	}
	{
		net_id_first = 0
		net_id_second = 0
		Name = qs(0x00000000)
	}
	{
		net_id_first = 0
		net_id_second = 0
		Name = qs(0x00000000)
	}
	{
		net_id_first = 0
		net_id_second = 0
		Name = qs(0x00000000)
	}
]

script clear_temp_net_id_array 
	Change \{temp_net_id = [
			{
				net_id_first = 0
				net_id_second = 0
				Name = qs(0x00000000)
			}
			{
				net_id_first = 0
				net_id_second = 0
				Name = qs(0x00000000)
			}
			{
				net_id_first = 0
				net_id_second = 0
				Name = qs(0x00000000)
			}
			{
				net_id_first = 0
				net_id_second = 0
				Name = qs(0x00000000)
			}
			{
				net_id_first = 0
				net_id_second = 0
				Name = qs(0x00000000)
			}
			{
				net_id_first = 0
				net_id_second = 0
				Name = qs(0x00000000)
			}
			{
				net_id_first = 0
				net_id_second = 0
				Name = qs(0x00000000)
			}
		]}
endscript

script net_party_save_off_invite_controllers 
	printf \{qs(0x6ce8d99e)}
	get_local_players_in_game
	GetArraySize \{local_players}
	if (<array_Size> > 0)
		i = 0
		begin
		if ((<local_players> [<i>]) = 1)
			GetNetID controller_index = <i>
			NetSessionFunc func = get_gamertag params = {controller = <i>}
			SetArrayElement {
				globalarray
				ArrayName = temp_net_id
				index = <i>
				NewValue = {
					net_id_first = <net_id_first>
					net_id_second = <net_id_second>
					Name = <Name>
				}
			}
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script start_friendslist 
	printf \{qs(0x8beb3927)}
	if NOT ScreenElementExists \{id = friendslistinterface}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		SoundEvent \{event = online_panel_in}
		ui_create_friends_list device_num = <device_num> exit_Script = online_lobby_transition_in
	endif
endscript

script start_net_preferences 
	is_controller_online controller_index = <device_num>
	if (<online> = 1)
		if NOT ScreenElementExists \{id = netprefinterface}
			LaunchEvent \{Type = unfocus
				target = current_menu}
			SoundEvent \{event = online_panel_in}
			ui_create_net_preferences device_num = <device_num> exit_Script = online_lobby_transition_in
		endif
	endif
endscript

script toggle_guitar_part 
	printf \{qs(0x7f246a05)}
	onlinelobbyinterface :GetSingleTag \{toggle_allowed}
	if (<toggle_allowed> = 0)
		return
	endif
	RequireParams \{[
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
		SoundEvent \{event = online_instrument_change}
		if (<part> = guitar)
			netoptions :pref_get \{Name = game_modes}
			if NOT (<checksum> = p2_battle)
				setplayerinfo <info_index> part = bass
				if GotParam \{finished_matchmaking}
					getplayerinfo <info_index> net_id_first
					getplayerinfo <info_index> net_id_second
					formatText checksumName = gamertag 'gamertag_%d' d = (<index> - 1)
					SendStructure callback = update_player_part data_to_send = {first_id = <net_id_first> second_id = <net_id_second> Name = ($<gamertag>) part = bass}
					update_player_part first_id = <net_id_first> second_id = <net_id_second> Name = ($<gamertag>) part = bass
				else
					refresh_player_slots_ui
				endif
			endif
		elseif (<part> = bass)
			setplayerinfo <info_index> part = guitar
			if GotParam \{finished_matchmaking}
				getplayerinfo <info_index> net_id_first
				getplayerinfo <info_index> net_id_second
				formatText checksumName = gamertag 'gamertag_%d' d = (<index> - 1)
				SendStructure callback = update_player_part data_to_send = {first_id = <net_id_first> second_id = <net_id_second> Name = ($<gamertag>) part = guitar}
				update_player_part first_id = <net_id_first> second_id = <net_id_second> Name = ($<gamertag>) part = guitar
			else
				refresh_player_slots_ui
			endif
		endif
	endif
endscript

script update_player_part 
	if IsHost
		SendStructure callback = update_player_part data_to_send = <...>
	endif
	found = 0
	info_index = 1
	begin
	getplayerinfo <info_index> net_id_first
	getplayerinfo <info_index> net_id_second
	formatText checksumName = gamertag 'gamertag_%d' d = (<info_index> - 1)
	if ((<net_id_first> = <first_id>) && (<net_id_second> = <second_id>))
		if isXenon
			<found> = 1
			break
		elseif LocalizedStringEquals a = <Name> b = ($<gamertag>)
			<found> = 1
			break
		endif
	endif
	info_index = (<info_index> + 1)
	repeat 8
	if (<found> = 1)
		setplayerinfo <info_index> part = <part>
		if ScreenElementExists \{id = onlinelobbyinterface}
			onlinelobbyinterface :GetTags
			set_ui_to_final_player_slots slot = <slot_index>
		endif
	endif
endscript

script ps3_display_invites_received 
	NetSessionFunc \{func = displayandacceptinvites
		params = {
			callback = ps3_invite_callback
		}}
endscript

script ps3_invite_callback 
	printf \{qs(0xb8afcd4a)}
endscript

script matchmaking_countdown_end_game_script 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	wait_for_safe_shutdown
	ui_event_wait_for_safe
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :Obj_KillSpawnedScript \{Name = set_net_ui_to_finished_searching}
		KillSpawnedScript \{Name = set_net_ui_to_finished_searching}
		if onlinelobbyinterface :desc_resolvealias \{Name = alias_online_lobby_right_side}
			if <resolved_id> :desc_resolvealias Name = alias_player_slots_menu
				LaunchEvent Type = unfocus target = <player_slots_menu>
			endif
		endif
	endif
	create_net_popup \{title = qs(0x5ca2c535)
		popup_text = qs(0x32f94482)}
	Wait \{3
		Seconds}
	destroy_net_popup
	quit_network_game
	ui_event_get_top
	if NOT (<base_name> = 'online')
		ui_event_block \{event = menu_back
			state = uistate_online}
	endif
	refresh_online_lobby
endscript

script matchmaking_countdown_drop_player_script 
	printf \{qs(0x24956f54)}
	matchmaking_countdown_end_game_script <...>
endscript

script print_net_ui_status 
	onlinelobbyinterface :GetTags
	<player_slots_menu_id> :GetTags
	printstruct <...>
endscript

script print_current_net_prefs 
	netoptions :pref_get \{Name = game_modes}
	printstruct <...>
	netoptions :pref_get \{Name = Ranked}
	printstruct <...>
endscript

script check_signin_wrapper 
	printstruct <...>
	if CheckForSignIn local controller controller_index = <device_num>
		NetSessionFunc \{func = showsigninui
			params = {
				convert_offline_to_guest
			}}
	else
		NetSessionFunc \{func = showsigninui4pane
			params = {
				online_only
			}}
	endif
	wait_for_blade_complete
	if CheckForSignIn controller_index = <device_num>
		printf \{qs(0x08ec2e8b)}
	else
		if isXenon
			if CheckForSignIn local controller controller_index = <device_num>
				NetSessionFunc \{func = showsigninui
					params = {
						convert_offline_to_guest
					}}
			else
				NetSessionFunc \{func = showsigninui4pane
					params = {
						online_only
					}}
			endif
			wait_for_blade_complete
		endif
	endif
endscript

script debug_4player_signin 
	if isXenon
		NetSessionFunc \{func = showsigninui4pane}
		wait_for_blade_complete
	endif
endscript

script print_player_status_structs_net_info 
	printf \{qs(0xad29dbe4)}
	i = 1
	begin
	formatText checksumName = player_status 'player%d_status' d = <i>
	formatText checksumName = gamertag 'gamertag_%i' i = (<i> - 1)
	Name = $<gamertag>
	printf <player_status>
	printf qs(0x8eca38c7) d = ($<player_status>.is_local_client)
	printf qs(0xa5bccced) d = ($<player_status>.net_id_first)
	printf qs(0x084465d1) d = ($<player_status>.net_id_second)
	printf qs(0x5b7377e6) g = <Name>
	printf qs(0xdd16850f) d = ($<player_status>.net_obj_id)
	printf ($<player_status>.part)
	printf ($<player_status>.net_difficulty)
	printf ($<player_status>.controller)
	printf ($<player_status>.career_earnings)
	i = (<i> + 1)
	repeat 8
endscript

script adjust_highlight_z \{z_pri = 100}
	printf qs(0x770d926c) s = <z_pri>
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_highlight
			param = highlight_bars}
		<highlight_bars> :se_setprops z_priority = <z_pri>
		ResolveScreenElementID id = [
			{id = <highlight_bars>}
			{local_id = highlight_scribble_01}
		]
		<resolved_id> :se_setprops z_priority = (<z_pri> + 0.1)
		ResolveScreenElementID id = [
			{id = <highlight_bars>}
			{local_id = highlight_scribble_02}
		]
		<resolved_id> :se_setprops z_priority = (<z_pri> + 0.1)
		ResolveScreenElementID id = [
			{id = <highlight_bars>}
			{local_id = highlight_scribble_03}
		]
		<resolved_id> :se_setprops z_priority = (<z_pri> + 0.1)
	endif
endscript

script 0x513955d0 
	RequireParams \{[
			device_num
			pad_choose_script
		]
		all}
	printf qs(0x37917242) d = <device_num>
	is_controller_online controller_index = <device_num>
	if (<online> = 0)
		printf qs(0xf825f1f2) d = <device_num>
	else
		<pad_choose_script> <...>
	endif
endscript

script is_controller_online 
	RequireParams \{[
			controller_index
		]
		all}
	formatText checksumName = 0xbf2e6723 'controller%d_wants_online' d = <controller_index>
	return online = ($<0xbf2e6723>)
endscript

script 0xf69978d8 
	leave_net_main_menu \{device_num = $primary_controller}
	logout
endscript

script 0x829905f8 
	Wait \{0.1
		Seconds}
	begin
	if NOT NetSessionFunc \{Obj = session
			func = is_matchmaking_active}
		printf \{qs(0x68c883cd)}
		break
	endif
	NetSessionFunc \{Obj = session
		func = get_matchmaking_status}
	if NOT isdwcinpotentiallyblockingcall
		if (<hosting_time_left> > 22)
			if (<state> = esearching)
				printf \{qs(0xb24bfaa0)}
				cancel_join_server
				0xdc63a126
				setup_and_post_game device_num = <device_num>
				printf \{qs(0x7c83f0e4)}
			else
				printf \{qs(0x96fee678)}
				quit_network_game
				get_custom_match_search_params
				set_network_preferences
				0x324d7178 <...> 0x0cb4e4f6 = 0
				Change 0xd99154a8 = ($0xd99154a8 + 1)
				printf \{qs(0x0884516b)}
				printf ($0xd99154a8)
			endif
		endif
	endif
	Wait \{0.1
		Seconds}
	repeat
endscript

script start_invite_matchmaking \{action = HOST}
	netoptions :pref_get \{Name = game_modes}
	printf \{qs(0xff66475e)}
	printstruct <...>
	if is_valid_instrument_config
		if NOT 0x37193edf \{0x26c0a068
				invite}
			return
		endif
		if (<action> = HOST)
			printf \{qs(0x7cdfddf5)}
			set_net_ui_to_searching friends = HOST friend_name = <friend_name> action = HOST
			set_net_dialog_message \{msg_checksum = 0xee1d3e8a}
			Change \{net_new_matchmaking_ui_flag = 1}
			0xdc63a126
			get_custom_match_search_params
			set_network_preferences
			post_network_game controller = <device_num> 0x41d5263e = friends friend_index = <friend_index>
			spawnscript \{check_player_disconnect}
			onlinelobbyinterface :GetTags
			<player_slots_menu_id> :Obj_SpawnScriptNow 0xbf02b723
		else
			printf \{qs(0x4046259a)}
			set_net_ui_to_searching friends = CLIENT friend_name = <friend_name> action = join
			Change \{net_new_matchmaking_ui_flag = 1}
			0xdc63a126
			get_custom_match_search_params
			set_network_preferences
			0x324d7178 <...> 0x0cb4e4f6 = 1 friend_index = <friend_index>
			spawnscript check_invite_valid params = {friend_index = <friend_index>}
			onlinelobbyinterface :GetTags
			<player_slots_menu_id> :Obj_SpawnScriptNow 0xbf02b723
		endif
	else
		menu_scroll_end_sound
		create_intrument_config_warning
	endif
	if GotParam \{0xe28d8c21}
		SetButtonEventMappings \{unblock_menu_input}
	endif
endscript

script 0x73ecf69c 
	i = 0
	num_guitars = 0
	0x782408bc = 0
	0xabf297f4 = 0
	begin
	if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
		get_controller_type controller_index = <i>
		printf qs(0x84de2289) d = <controller_type>
		switch <controller_type>
			case guitar
			num_guitars = (<num_guitars> + 1)
			case drum
			0x782408bc = 1
			case vocals
			0xabf297f4 = 1
		endswitch
	endif
	i = (<i> + 1)
	repeat 4
	return {
		num_guitars = <num_guitars>
		0x782408bc = <0x782408bc>
		0xabf297f4 = <0xabf297f4>
	}
endscript
0xee5eccd5 = 0
0x43bf161a = 0

script 0x09479973 
	Change \{0x43bf161a = 1}
	destroy_generic_popup
endscript

script 0x37193edf 
	printf \{'---handle_online_SD_enumeration'}
	cntsdcardwasejected
	Change \{sd_songstruct = {
		}}
	Change \{0xee5eccd5 = 0}
	if NOT cntsdiscardpresent
		return \{true}
	endif
	if cntsdiscardusable
		cntsdgetcontentindices
		if NOT GotParam \{error}
			cntsdcountsdsongs
			if (<sd_song_count> > $dlc_max_songs_on_sd)
				formatText TextName = error qs(0x1cd32936) d = ($dlc_max_songs_on_sd)
			endif
			if NOT GotParam \{error}
				0x2308e284
				if (<catalog_status> = wrong_wii)
					<error> = (qs(0x9693d484))
				endif
			endif
		endif
		if GotParam \{error}
			<index_array> = []
		endif
		GetArraySize \{gh4_download_songlist
			globalarray}
		<0x1cecfa59> = (<array_Size> + 1)
		printf '--gh4_download_songlist len=%a' a = <array_Size>
		GetArraySize <index_array>
		if (<array_Size> > 0)
			<index> = 0
			begin
			<song_index> = (<index_array> [<index>])
			if (<song_index> > <0x1cecfa59>)
				Change \{0xee5eccd5 = 0}
				Change \{sd_songstruct = {
					}}
				<error> = qs(0x9c14e8d4)
				break
			endif
			if (<song_index> > 1)
				cntgetflags index = <song_index>
				if (<flag_owned> = true && <flag_present> = FALSE && <flag_corrupt> = FALSE)
					formatText checksumName = song_checksum 'dlc%d' d = <song_index>
					Change \{0xee5eccd5 = 1}
					Change sd_songstruct = (($sd_songstruct) + {<song_checksum>})
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
	endif
	if cntsdcardwasejected
		<error> = (qs(0x87c9b5d7))
		<0x26c0a068> = 1
		Change \{0xee5eccd5 = 0}
		Change \{sd_songstruct = {
			}}
	endif
	if NOT GotParam \{error}
		printstruct ($sd_songstruct)
		if ($0xee5eccd5 = 0)
			return \{true}
		elseif sd_cachesizecheck
			return \{true}
		endif
		if GotParam \{error_include_blocks}
			formatText TextName = error <error> d = <blocks>
		endif
	endif
	Change \{0xee5eccd5 = 0}
	if GotParam \{error_sd_corrupt_from_usable}
		<error> = (qs(0x3db066b9))
	endif
	if GotParam \{error_include_name}
		formatText TextName = error <error> s = qs(0x9c331616)
	endif
	Change \{0x43bf161a = 0}
	if GotParam \{0x26c0a068}
		if 0xf82b3905 \{param
				invite}
			SetButtonEventMappings \{unblock_menu_input}
		endif
		formatText TextName = errortext qs(0xdb9ce3ff) s = <error>
		create_new_generic_popup {
			popup_type = error_menu
			text = <errortext>
			error_func = destroy_generic_popup
		}
	else
		formatText TextName = errortext qs(0xf3d5afc2) s = <error>
		<options> = [
			{
				func = 0x09479973
				text = qs(0x494b4d7f)
			}
			{
				func = destroy_generic_popup
				text = qs(0x7343df39)
			}
		]
		create_new_generic_popup {
			popup_type = message_options
			back_script = destroy_generic_popup
			title = qs(0x79597197)
			text = <errortext>
			options = <options>
			title_effect
		}
	endif
	begin
	if NOT ScreenElementExists \{id = generic_popupelement}
		break
	endif
	WaitOneGameFrame
	repeat
	if ($0x43bf161a = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript
