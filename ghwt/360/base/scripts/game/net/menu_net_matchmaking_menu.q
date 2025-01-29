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
	NetSessionFunc \{Obj = voice
		func = turnteamtalkoff}
	frontend_load_soundcheck \{loadingscreen}
	CreateScreenElement \{parent = root_window
		id = onlinelobbyinterface
		Type = descinterface
		desc = 'online_lobby'
		Pos = (0.0, -1000.0)
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
	create_player_slots_container
	SpawnScriptNow \{task_menu_default_anim_in
		params = {
			base_name = 'band_hub'
		}}
	create_signin_container
	Change \{net_no_focus_warning = 0}
	online_lobby_setup_helper_controls
	if GotParam \{accepting_invite}
		create_joining_invite_popup
	else
		if onlinelobbyinterface :desc_resolvealias \{Name = alias_matchmaking_vmenu
				param = vmenu_id}
			onlinelobbyinterface :Obj_SpawnScriptNow online_lobby_animate_in params = {<...>}
		endif
	endif
	if isps3
		if NOT NetSessionFunc \{Obj = voice
				func = voice_allowed}
			create_ps3_chat_warning_message \{message = qs(0x925535f4)}
		endif
	endif
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
		GetActiveControllers
		GetArraySize <active_controllers>
		i = 0
		begin
		if (<active_controllers> [<i>] = 1)
			if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
				get_controller_type controller_index = <i>
				if (<controller_type> = guitar)
					add_user_control_helper text = qs(0x0d215c11) button = orange z = 100000 controller = <i>
					break
				endif
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
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
	AssignAlias id = <vmenu_id> alias = current_menu
	LaunchEvent \{Type = focus
		target = current_menu}
	ResolveScreenElementID \{id = [
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
	if GotParam \{lost_party}
		create_online_warning_message \{title = qs(0x50c3c667)
			message = qs(0x1715dfdb)
			alpha = 0.0}
		display_online_warning_message
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
	ResolveScreenElementID \{id = [
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
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	SoundEvent \{event = online_panel_in}
	if ScreenElementExists \{id = onlinelobbyinterface}
		<resolved_id> :se_setprops Pos = {(0.0, 1000.0) relative} time = 0.15 anim = gentle
	else
		return
	endif
	Wait \{0.15
		Second}
	if NOT GotParam \{no_focus}
		LaunchEvent \{Type = focus
			target = current_menu}
	endif
endscript

script online_lobby_transition_out 
	ResolveScreenElementID \{id = [
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
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if ScreenElementExists \{id = onlinelobbyinterface}
		<resolved_id> :se_setprops Pos = {(0.0, -1000.0) relative} time = 0.15 anim = gentle
	else
		return
	endif
	Wait \{0.15
		Second}
endscript

script destroy_net_matchmaking_menu 
	if ScreenElementExists \{id = onlinelobbyinterface}
		DestroyScreenElement \{id = onlinelobbyinterface}
	endif
	KillSpawnedScript \{Name = set_net_ui_to_finished_searching}
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
	begin
	<id> :se_setprops rot_angle = <rot_angle> time = 1.0
	<id> :se_waitprops
	<rot_angle> = (<rot_angle> - 360)
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
		texture = online_dialog_bg
		dims = (360.0, 360.0)
		Pos = (0.0, 0.0)
		just = [center center]
		z_priority = (<z_priority> + 21)
		alpha = 1.0
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <menu_anchor>
		id = online_warning_message_title
		font = fontgrid_text_a6
		rgba = ($online_lobby_item_text_color)
		text = <title>
		just = [center center]
		internal_just = [center center]
		z_priority = (<z_priority> + 22)
		Pos = (0.0, -115.0)
		dims = (150.0, 36.0)
		fit_width = `scale	each	line	if	larger`
		fit_height = `scale	down	if	larger`
		scale_mode = `per	axis`
	}
	CreateScreenElement {
		Type = TextBlockElement
		parent = <menu_anchor>
		id = online_warning_message_text
		font = fontgrid_text_a6
		rgba = ($online_lobby_item_text_color)
		text = <message>
		just = [center center]
		internal_just = [center center]
		internal_scale = 0.7
		z_priority = (<z_priority> + 22)
		Pos = (0.0, 25.0)
		dims = (300.0, 200.0)
		single_line = FALSE
		fit_width = wrap
		fit_height = `scale	down	if	larger`
		scale_mode = `per	axis`
	}
endscript

script destroy_online_warning_message 
	if ScreenElementExists \{id = online_warning_message_container}
		DestroyScreenElement \{id = online_warning_message_container}
	endif
endscript

script display_online_warning_message 
	if ScreenElementExists \{id = online_warning_message_container}
		online_warning_message_container :Obj_SpawnScriptNow \{online_warning_message_animate}
	endif
endscript

script online_warning_message_animate 
	if ScreenElementExists \{id = online_warning_message_container}
		online_warning_message_container :se_setprops \{alpha = 1.0
			time = 0.2}
		online_warning_message_container :se_waitprops
	endif
	Wait \{2.0
		Seconds}
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
		font = fontgrid_text_a6
		rgba = ($ps3_chat_warning_text)
		Pos = (870.0, 550.0)
		dims = (515.0, 200.0)
		text = <message>
		just = [center center]
		internal_just = [center center]
		internal_scale = 0.5
		z_priority = 3.1
		single_line = FALSE
		fit_width = wrap
		fit_height = `scale	down	if	larger`
		scale_mode = `per	axis`
	}
endscript

script destroy_ps3_chat_warning_message 
	if ScreenElementExists \{id = ps3_chat_warning_text}
		DestroyScreenElement \{id = ps3_chat_warning_text}
	endif
endscript

script create_matchmaking_menu_and_items 
	if ($is_multiplayer_beta = 1)
		demo_mode_disable = {rgba = [128 128 128 255] generic_list_menu_item_text_rgba = [128 128 128 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_matchmaking_vmenu}
		if ($is_multiplayer_beta = 0)
			if isps3
				new_event_handlers = [
					{pad_back leave_net_main_menu params = {id = <resolved_id>}}
					{pad_up net_up_down_action params = {action = up}}
					{pad_down net_up_down_action params = {action = down}}
					{pad_option2 ps3_display_invites_received}
					{pad_L1 toggle_guitar_part}
				]
			else
				new_event_handlers = [
					{pad_back leave_net_main_menu params = {id = <resolved_id>}}
					{pad_up net_up_down_action params = {action = up}}
					{pad_down net_up_down_action params = {action = down}}
					{pad_L1 toggle_guitar_part}
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
		if NetSessionFunc \{Obj = party
				func = is_host}
		else
			focusable = not_focusable
		endif
		ResolveScreenElementID id = {<matchmaking_vmenu_id> child = start_matchmaking}
		<resolved_id> :se_setprops {
			<focusable>
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose start_matchmaking}
			]
		}
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
		choose_first_viewable_mode \{net_pref_name = game_modes}
		netoptions :pref_get \{Name = game_modes}
		formatText TextName = game_mode_text qs(0xed77b849) d = <display_string>
		ResolveScreenElementID id = [
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
		ResolveScreenElementID id = {<matchmaking_vmenu_id> child = game_mode}
		<resolved_id> :se_setprops {
			<focusable>
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose try_create_matchmaking_submenu params = {<start_matchmaking_params> title = qs(0x876172e8)}}
			]
		}
		if GotParam \{focusable}
			if (<focusable> = not_focusable)
				ResolveScreenElementID id = [
					{id = <resolved_id>}
					{local_id = text}
				]
				<resolved_id> :se_setprops alpha = 0.5
			endif
		endif
		onlinelobbyinterface :se_setprops {
			matchmaking_game_mode_text = <game_mode_text>
		}
		ResolveScreenElementID id = {<matchmaking_vmenu_id> child = friends}
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
			ResolveScreenElementID id = [
				{id = <resolved_id>}
				{local_id = text}
			]
			<resolved_id> :se_setprops {<demo_mode_disable>}
		endif
		ResolveScreenElementID id = {<matchmaking_vmenu_id> child = preferences}
		<resolved_id> :se_setprops {
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose ui_menu_select_sfx}
				{pad_choose start_net_preferences}
			]
		}
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
	if ScreenElementExists \{id = matchmaking_vscollingmenu}
		DestroyScreenElement \{id = matchmaking_vscollingmenu}
	endif
endscript

script net_up_down_action 
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
					if (<slot_items> > 0)
						LaunchEvent \{Type = unfocus
							target = current_menu}
						online_lobby_setup_helper_controls \{menu_type = right_hand}
						LaunchEvent Type = focus target = <player_slots_menu_id> data = {child_index = (<slot_items> - 1)}
						onlinelobbyinterface :SetTags slots_index = (<slot_items> - 1)
					else
						onlinelobbyinterface :SetTags menu_index = (<menu_items> - 1)
					endif
				else
					onlinelobbyinterface :SetTags menu_index = (<menu_index> - 1)
				endif
			elseif (<action> = down)
				if (<menu_index> = (<menu_items> - 1))
					if (<slot_items> > 0)
						LaunchEvent \{Type = unfocus
							target = current_menu}
						online_lobby_setup_helper_controls \{menu_type = right_hand}
						LaunchEvent Type = focus target = <player_slots_menu_id> data = {child_index = 0}
						onlinelobbyinterface :SetTags \{slots_index = 0}
					else
						onlinelobbyinterface :SetTags \{menu_index = 0}
					endif
				else
					onlinelobbyinterface :SetTags menu_index = (<menu_index> + 1)
				endif
			endif
		elseif isscreenelementinfocus id = <player_slots_menu_id>
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
endscript

script choose_first_viewable_mode 
	netoptions :pref_get \{Name = game_modes}
	is_gamemode_visible mode = <checksum>
	if (<item_is_visible>)
		return
	endif
	netoptions :pref_size \{Name = game_modes}
	i = 0
	begin
	netoptions :pref_get Name = game_modes index = <i>
	is_gamemode_visible mode = <checksum>
	if (<item_is_visible>)
		netoptions :pref_choose Name = game_modes index = <i>
		return
	endif
	<i> = (<i> + 1)
	repeat <size>
	if NetSessionFunc \{Obj = party
			func = is_host}
		netoptions :pref_get \{Name = game_modes}
		NetSessionFunc Obj = party func = append_shared_data params = {data = {game_mode = <i>}}
	endif
endscript

script is_gamemode_visible 
	<returnvalue> = 0
	get_visible_game_modes
	if ArrayContains array = <modes> contains = <mode>
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
	RequireParams \{[
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
	CreateScreenElement {
		Type = descinterface
		parent = onlinelobbyinterface
		desc = 'online_lobby_left_side'
		Pos = (0.0, -1000.0)
		id = onlinesubmenuinterface
		exclusive_device = <device_num>
		tags = {
			menu_index = 0
			menu_items = 0
			player_num = <info_index>
			exit_Script = <exit_Script>
			scrollbar_id = NULL
		}
	}
	onlinesubmenuinterface :desc_checkversion \{desired = 2
		assertif = mismatch}
	<id> :se_setprops title_text = <title>
	left_side_id = <id>
	if onlinesubmenuinterface :desc_resolvealias \{Name = alias_online_lobby_scrollbar
			param = scrollbar_id}
		onlinesubmenuinterface :SetTags scrollbar_id = <scrollbar_id>
	endif
	if onlinesubmenuinterface :desc_resolvealias \{Name = alias_left_side_vmenu}
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
		netoptions :pref_getstruct Name = <net_pref_name>
		if GotParam \{pref_struct}
			<checksum> = (<pref_struct>.search_chk)
		endif
		<current_index> = 0
		netoptions :pref_size Name = <net_pref_name>
		i = 0
		<menu_index> = 0
		<item_is_visible> = 1
		begin
		netoptions :pref_getstruct Name = <net_pref_name> index = <i>
		if StructureContains structure = <pref_struct> func
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
				text = (<pref_struct>.Name)
				choose_script = select_submenu_item
				focus_script = matchmaking_submenu_item_change_focus
				choose_script_params = {
					net_pref_name = <net_pref_name>
					base_text = <base_text>
					text = (<pref_struct>.Name)
					text_id = <text_id>
					index = <i>
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
		LaunchEvent Type = unfocus target = <vmenu_id>
	endif
	clean_up_user_control_helpers
	menu_finish
	if GotParam \{title}
		switch <title>
			case qs(0x876172e8)
			SoundEvent \{event = online_panel_in}
		endswitch
	endif
	if GotParam \{subvmenu_id}
		<left_side_id> :Obj_SpawnScriptNow animate_left_side params = {id = <left_side_id> direction = in focus_id = <subvmenu_id> focus_index = <current_index>}
	else
		<left_side_id> :Obj_SpawnScriptNow animate_left_side params = {id = <left_side_id> direction = in}
	endif
endscript

script destroy_matchmaking_submenu 
	if NOT ((GotParam container_id) || (GotParam vmenu_id) || (GotParam parent_id))
		return
	endif
	if ScreenElementExists id = <vmenu_id>
		LaunchEvent Type = unfocus target = <vmenu_id>
	endif
	if ScreenElementExists id = <container_id>
		animate_left_side id = <container_id> direction = out
		DestroyScreenElement id = <container_id>
		online_lobby_transition_in
	endif
	if ScreenElementExists id = <parent_id>
		LaunchEvent Type = focus target = <parent_id>
	endif
endscript

script select_submenu_item 
	if GotParam \{text_id}
		if ScreenElementExists id = <text_id>
			formatText TextName = new_string qs(0x3080c264) s = <base_text> d = <text>
			SetScreenElementProps id = <text_id> text = <new_string>
			netoptions :pref_choose Name = <net_pref_name> index = <index>
			if NetSessionFunc \{Obj = party
					func = is_host}
				netoptions :pref_get Name = <net_pref_name>
				NetSessionFunc Obj = party func = append_shared_data params = {data = {game_mode = <index>}}
			endif
		endif
	endif
	destroy_matchmaking_submenu container_id = <container_id> vmenu_id = <vmenu_id> parent_id = <parent_id>
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

script add_matchmaking_item \{focus_script = matchmaking_item_change_focus}
	if NOT GotParam \{vmenu_id}
		return
	endif
	if NOT GotParam \{text}
		text = qs(0x134b7e69)
	endif
	text_alpha = 1
	if GotParam \{not_focusable}
		focusable = not_focusable
		text_alpha = 0.5
	endif
	CreateScreenElement {
		Type = ContainerElement
		parent = <vmenu_id>
		Pos = (0.0, 0.0)
		dims = (256.0, 40.0)
		<focusable>
		event_handlers = [
			{focus <focus_script> params = {focus}}
			{unfocus <focus_script> params = {unfocus}}
		]
	}
	container_id = <id>
	if GotParam \{msg_checksum}
		<container_id> :SetTags msg_checksum = <msg_checksum>
	endif
	if GotParam \{choose_script}
		SetScreenElementProps {
			id = <container_id>
			event_handlers = [
				{pad_choose ui_menu_select_sfx}
				{pad_choose <choose_script> params = <choose_script_params>}
			]
		}
	endif
	if GotParam \{sub_menu_item}
		width = 285
		if ScreenElementExists \{id = onlinesubmenuinterface}
			onlinesubmenuinterface :GetTags
			onlinesubmenuinterface :SetTags menu_items = (<menu_items> + 1)
		endif
	else
		if NOT GotParam \{not_focusable}
			onlinelobbyinterface :GetTags
			onlinelobbyinterface :SetTags menu_items = (<menu_items> + 1)
		endif
		width = 285
	endif
	getscreenelementzpriority id = <container_id>
	<text_pos> = (10.0, 0.0)
	if GotParam \{slide_left}
		<text_pos> = (0.0, 0.0)
	endif
	if GotParam \{text_id}
		CreateScreenElement {
			Type = TextBlockElement
			parent = <container_id>
			id = <text_id>
			local_id = text
			font = fontgrid_text_a6
			rgba = ($online_lobby_item_text_color)
			Pos = <text_pos>
			alpha = <text_alpha>
			dims = (325.0, 42.0)
			text = <text>
			just = [left top]
			z_priority = (<z_priority> + 1.5)
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = `per	axis`
		}
	else
		CreateScreenElement {
			Type = TextBlockElement
			parent = <container_id>
			local_id = text
			font = fontgrid_text_a6
			rgba = ($online_lobby_item_text_color)
			Pos = <text_pos>
			alpha = <text_alpha>
			dims = (325.0, 42.0)
			text = <text>
			just = [left top]
			z_priority = (<z_priority> + 1.5)
			fit_width = `scale	each	line	if	larger`
			fit_height = `scale	down	if	larger`
			scale_mode = `per	axis`
		}
	endif
	return id = <container_id>
endscript

script matchmaking_item_change_focus 
	Obj_GetID
	<objID> :GetTags
	ResolveScreenElementID id = [
		{id = <objID>}
		{local_id = text}
	]
	if GotParam \{focus}
		if GotParam \{msg_checksum}
			set_net_dialog_message msg_checksum = <msg_checksum>
		endif
		retail_menu_focus id = <resolved_id>
	elseif GotParam \{unfocus}
		retail_menu_unfocus id = <resolved_id>
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
	endif
	AppendSuffixToChecksum Base = <msg_checksum> SuffixString = '_text'
	if StructureContains structure = ($<plat_helper_strings>) <appended_id>
		if ScreenElementExists \{id = onlinelobbyinterface}
			onlinelobbyinterface :se_setprops matchmaking_info_text = ($<plat_helper_strings>.<appended_id>)
		endif
	elseif StructureContains structure = ($net_helper_text_strings) <appended_id>
		if ScreenElementExists \{id = onlinelobbyinterface}
			onlinelobbyinterface :se_setprops matchmaking_info_text = ($net_helper_text_strings.<appended_id>)
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
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_player_slots_vmenu}
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
		if NetSessionFunc \{Obj = party
				func = is_host}
			get_ui_slot_corresponding_controller target_ui_slot = <count>
			add_player_slot_to_menu index = <count> player_type = not_signed_in controller = <controller>
		endif
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
	printscriptinfo \{qs(0x73ccf700)}
	if ScreenElementExists \{id = onlinelobbyinterface}
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
	endif
endscript

script player_slot_change_focus 
	Obj_GetID
	<objID> :GetTags
	ResolveScreenElementID id = [
		{id = <objID>}
		{local_id = online_player_slots_item}
		{local_id = player_slot_name}
	]
	if GotParam \{focus}
		if GotParam \{msg_checksum}
			set_net_dialog_message msg_checksum = <msg_checksum>
		endif
		if GotParam \{view_gamer_card}
			online_lobby_setup_helper_controls menu_type = right_hand gamer_card = <view_gamer_card>
		endif
		retail_menu_focus id = <resolved_id>
	elseif GotParam \{unfocus}
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
			controller = ($<player_status>.controller)
			if NOT NetSessionFunc func = iscontrolleringame params = {controller = <controller>}
				Name = qs(0x12f727b9)
				<keep_sign_in_button> = 1
			else
				NetSessionFunc func = get_gamertag params = {controller = ($<player_status>.controller)}
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
		desc = 'online_lobby_player_slot_item'
		parent = <player_slots_menu_id>
		auto_dims = FALSE
		dims = (450.0, 50.0)
		event_handlers = [
			{focus player_slot_change_focus params = {focus view_gamer_card = <view_gamer_card>}}
			{unfocus player_slot_change_focus params = {unfocus}}
		]
	}
	<id> :desc_checkversion desired = 2 assertif = mismatch
	<id> :se_setprops {
		player_slot_name_text = <Name>
		player_instrument_logo_texture = <controller_texture>
		player_slot_bg_rgba = ($online_player_slot_bg_gray)
		cash_icon_texture = <cash_icon_id>
		cash_rank_text = <cash_text>
		cash_icon_alpha = <cash_icon_alpha>
	}
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
	headset_icon_alpha = 0
	has_headset = 0
	is_talking = 0
	begin
	<has_headset> = 0
	<is_talking> = 0
	if (NetSessionFunc Obj = voice func = hasheadset params = {player_xuid = <uid>})
		<has_headset> = 1
	endif
	if (<has_headset> = 1)
		if (NetSessionFunc Obj = voice func = istalking params = {player_xuid = <uid>})
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
	if ScreenElementExists id = <obj_id>
		<obj_id> :se_setprops headset_icon_alpha = <headset_icon_alpha>
	endif
	Wait \{1.0
		Second}
	repeat
endscript

script update_player_slots_ui 
	begin
	get_active_local_controllers
	get_signin_status_local_controllers
	poll_party_object
	Change \{net_block_matchmaking = 0}
	if ($need_to_refresh_player_slots = 1)
		refresh_player_slots_ui
		Change \{need_to_refresh_player_slots = 0}
	endif
	Wait \{1
		Second}
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
		if (<Change>)
			if isXenon
				if NOT CheckForSignIn controller_index = <controller_index>
					get_controller_corresponding_ui_slot controller = <controller_index>
					add_remove_player_to_net_ui action = remove ui_slot = <ui_slot> index = <controller_index> player_type = local_not_signed_in
				endif
			else
				if (<controller_index> != $primary_controller)
					NetSessionFunc func = removecontroller params = {controller = <controller_index>}
					get_controller_corresponding_ui_slot controller = <controller_index>
					add_remove_player_to_net_ui action = remove ui_slot = <ui_slot> index = <controller_index> player_type = local_not_signed_in
				endif
			endif
		endif
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_Size>
endscript

script get_signin_status_local_controllers 
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_player_slots_vmenu}
		<resolved_id> :GetTags
		GetArraySize <local_controllers>
		controller_index = 0
		begin
		if NOT (<local_controllers> [<controller_index>] = unplugged)
			if CheckForSignIn controller_index = <controller_index>
				check_for_signin_signin_change controller_index = <controller_index> state = signed_in
				if (<Change>)
					if NetSessionFunc \{Obj = party
							func = is_host}
						if NOT party_is_full controller = <controller_index>
							add_remove_player_to_net_ui action = replace index = <controller_index> player_type = local_signed_in
						else
							printf \{qs(0x027c88b5)}
						endif
					elseif NetSessionFunc func = iscontrolleringame params = {controller = <controller_index>}
						add_remove_player_to_net_ui action = replace index = <controller_index> player_type = local_signed_in
					endif
				endif
			else
				check_for_signin_signin_change controller_index = <controller_index> state = signed_out
				if (<Change>)
					if NetSessionFunc \{Obj = party
							func = is_host}
						NetSessionFunc func = removecontroller params = {controller = <controller_index>}
						add_remove_player_to_net_ui action = replace index = <controller_index> player_type = local_not_signed_in
					endif
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
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_player_slots_vmenu}
		if (<controller_index> = -1)
			printf \{qs(0x32764d51)}
			return
		endif
		<resolved_id> :GetTags
		if (<state> = Active)
			if (<local_controllers> [<controller_index>] = unplugged)
				if NetSessionFunc \{Obj = party
						func = is_host}
					if NOT party_is_full controller = <controller_index>
						if NOT (ui_slots_are_full)
							return \{Change = 1}
						else
							return \{Change = 0}
						endif
					else
						return \{Change = 0}
					endif
				elseif NetSessionFunc func = iscontrolleringame params = {controller = <controller_index>}
					return \{Change = 1}
				else
					return \{Change = 0}
				endif
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
endscript

script check_for_signin_signin_change \{controller_index = -1}
	if onlinelobbyinterface :desc_resolvealias \{Name = alias_player_slots_vmenu}
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
					printscriptinfo \{qs(0xee7a58ed)}
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
	if NetSessionFunc \{Obj = party
			func = is_host}
		if (<device_num> = $primary_controller)
			NetSessionFunc \{Obj = party
				func = get_party_members}
			has_remote = 0
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
			if (<has_remote> = 1)
				if GotParam \{id}
					LaunchEvent Type = unfocus target = <id>
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
			NetSessionFunc func = removecontroller params = {controller = <device_num>}
			Change \{need_to_refresh_player_slots = 1}
		endif
	else
		if (<device_num> = $primary_controller)
			if GotParam \{id}
				LaunchEvent Type = unfocus target = <id>
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
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if is_ui_event_running
		return
	endif
	NetSessionFunc \{Obj = party
		func = leave_party}
	net_clear_all_remote_player_status
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :Obj_SpawnScriptLater \{refresh_online_lobby}
	endif
	generic_event_back
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
	CreateScreenElement \{Type = SpriteElement
		parent = popupelement
		texture = online_load_wheel_bg
		Pos = (960.0, 600.0)
		dims = (128.0, 128.0)
		just = [
			center
			center
		]
		z_priority = 520}
	CreateScreenElement \{Type = SpriteElement
		parent = popupelement
		texture = online_load_wheel
		Pos = (960.0, 600.0)
		dims = (128.0, 128.0)
		just = [
			center
			center
		]
		z_priority = 521}
	popupelement :Obj_SpawnScriptNow animate_online_icon params = {id = <id>}
	popupelement :Obj_SpawnScriptNow \{update_players_found}
	NetSessionFunc \{Obj = party
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
	LaunchEvent \{Type = unfocus
		target = current_menu}
	destroy_popup_warning_menu
	create_popup_warning_menu \{title = qs(0xddccf0c3)
		textblock = {
			text = qs(0x00000000)
		}
		parent = onlinelobbyinterface
		no_background}
	CreateScreenElement \{Type = SpriteElement
		parent = popupelement
		texture = online_load_wheel_bg
		Pos = (960.0, 600.0)
		dims = (128.0, 128.0)
		just = [
			center
			center
		]
		z_priority = 520}
	CreateScreenElement \{Type = SpriteElement
		parent = popupelement
		texture = online_load_wheel
		Pos = (960.0, 600.0)
		dims = (128.0, 128.0)
		just = [
			center
			center
		]
		z_priority = 521}
	popupelement :Obj_SpawnScriptNow animate_online_icon params = {id = <id>}
	popupelement :Obj_SpawnScriptNow client_check_for_cancel_matchmaking params = {id = <id>}
endscript

script client_check_for_cancel_matchmaking 
	Change \{respond_to_signin_changed_all_players = 1}
	players_found = 0
	begin
	NetSessionFunc \{Obj = match
		func = get_num_matchmaking_players}
	NetSessionFunc \{Obj = party
		func = get_party_members}
	NetSessionFunc \{Obj = party
		func = get_shared_data}
	GetArraySize <connections>
	if StructureContains structure = <party_shared_data> matchmaking
		if (<party_shared_data>.matchmaking = 0)
			destroy_searching_ui
			Change \{respond_to_signin_changed_all_players = 0}
			if ScreenElementExists \{id = onlinelobbyinterface}
				onlinelobbyinterface :GetTags
				if ScreenElementExists id = <player_slots_menu_id>
					<player_slots_menu_id> :Obj_SpawnScriptLater update_player_slots_ui
				endif
			endif
			online_lobby_setup_helper_controls
			LaunchEvent \{Type = focus
				target = current_menu}
			break
		endif
	endif
	if GotParam \{num_matchmaking_players}
		<players_found> = (<num_matchmaking_players> - <array_Size>)
		if (<players_found> < 0)
			<players_found> = 0
		endif
	else
		<players_found> = 0
	endif
	if (<players_found> = 0)
		message = qs(0xbb856970)
	else
		formatText TextName = message qs(0x18cc19f0) d = <players_found>
	endif
	if ScreenElementExists \{id = popupelement}
		popupelement :SetProps {
			popupbody_text = <message>
		}
	endif
	if ScriptIsRunning \{set_net_ui_to_finished_searching}
		destroy_searching_ui
		break
	endif
	Wait \{1.0
		Seconds}
	repeat
endscript

script cancel_start_matchmaking 
	if NetSessionFunc \{Obj = match
			func = cancel_join_server}
		NetSessionFunc \{Obj = party
			func = set_party_joinable
			params = {
				joinable = 1
			}}
		Change \{net_new_matchmaking_ui_flag = 0}
		Change \{respond_to_signin_changed_all_players = 0}
		onlinelobbyinterface :GetTags
		<player_slots_menu_id> :Obj_SpawnScriptLater update_player_slots_ui
		NetSessionFunc \{Obj = party
			func = append_shared_data
			params = {
				data = {
					matchmaking = 0
				}
			}}
		destroy_searching_ui
		online_lobby_setup_helper_controls
		Change \{net_starting_matchmaking = 0}
		LaunchEvent \{Type = focus
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
	NetSessionFunc \{Obj = match
		func = get_num_matchmaking_players}
	NetSessionFunc \{Obj = party
		func = get_party_members}
	GetArraySize <connections>
	if (<time_waited> >= 45)
		if GotParam \{num_matchmaking_players}
			if (<array_Size> >= <num_matchmaking_players>)
				gamemode_getminplayers
				if (<min_players> > <num_matchmaking_players>)
					create_confirm_search_again
					break
				endif
			endif
		endif
	endif
	if GotParam \{num_matchmaking_players}
		<players_found> = (<num_matchmaking_players> - <array_Size>)
		if (<players_found> < 0)
			<players_found> = 0
		endif
	else
		<players_found> = 0
	endif
	if (<players_found> = 0)
		message = qs(0xbb856970)
	else
		formatText TextName = message qs(0x18cc19f0) d = <players_found>
	endif
	if ScreenElementExists \{id = popupelement}
		popupelement :SetProps {
			popupbody_text = <message>
		}
	endif
	Wait \{1.0
		Seconds}
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
		if onlinelobbyinterface :desc_resolvealias \{Name = alias_player_slots_vmenu}
			<resolved_id> :se_setprops {exclusive_device = <signed_in_controllers>}
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
						if onlinelobbyinterface :desc_resolvealias \{Name = alias_player_slots_vmenu
								param = player_slots_menu}
							<player_slots_menu> :Obj_KillSpawnedScript Name = update_player_slots_ui
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
						if onlinelobbyinterface :desc_resolvealias \{Name = alias_player_slots_vmenu
								param = player_slots_menu}
							<player_slots_menu> :Obj_SpawnScriptNow update_player_slots_ui
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

script can_add_vocals_player 
	already_has_vocals = 0
	get_controller_type controller_index = <device_num>
	if NOT (<controller_type> = vocals || <controller_type> = controller)
		return \{true}
	endif
	GetActiveControllers
	GetArraySize <active_controllers>
	i = 0
	begin
	if (<active_controllers> [<i>] = 1)
		if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
			get_controller_type controller_index = <i>
			if (<controller_type> = vocals || <controller_type> = controller)
				<already_has_vocals> = 1
				break
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	if (<already_has_vocals> = 0)
		if ismicrophonepluggedin \{number = 0}
			return \{true}
		elseif ismicrophonepluggedin \{number = 1}
			return \{true}
		elseif controller_has_headset controller = <device_num>
			return \{true}
		endif
	endif
	return \{FALSE}
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
		if ScreenElementExists \{id = popupelement}
			popupelement :Obj_SpawnScriptNow \{wait_and_kill_vocals_warning_popup}
		endif
	endif
endscript

script wait_and_kill_vocals_warning_popup 
	Wait \{3.0
		Seconds}
	destroy_net_popup
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
endscript

script start_matchmaking 
	printf \{qs(0x14c9ca0a)}
	if ($net_starting_matchmaking = 1)
		return
	endif
	Change \{respond_to_signin_changed_all_players = 1}
	RequireParams \{[
			device_num
		]
		all}
	if (<device_num> = $primary_controller)
		if all_clients_are_ready
			if vocalist_has_mic
				if is_valid_instrument_config
					if CheckForSignIn controller_index = <device_num>
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
							Change \{net_starting_matchmaking = 1}
							NetSessionFunc \{Obj = party
								func = set_party_joinable
								params = {
									joinable = 0
								}}
							begin
							if ($net_block_matchmaking = 0)
								break
							endif
							Wait \{1
								gameframe}
							repeat
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
							ui_menu_select_sfx
							set_net_ui_to_searching
							clear_temp_net_id_array
							setup_temp_net_id_array
							Change \{net_new_matchmaking_ui_flag = 1}
							Change \{net_num_player_settings_ack = 0}
							set_network_preferences
							net_dummy_get_needed_search_params
							NetSessionFunc Obj = match func = set_search_params params = <...>
							NetSessionFunc \{Obj = match
								func = set_server_list_mode
								params = {
									automatch
								}}
							NetSessionFunc {
								Obj = match
								func = start_server_list
								params = {
									callback = xboxlive_menu_optimatch_results_item_add
									callback_complete = xboxlive_menu_optimatch_results_stop
									controller = <device_num>
								}
							}
							SetServerMode
							StartServer
							SetJoinMode \{$JOIN_MODE_PLAY}
							JoinServer
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
	NetSessionFunc \{Obj = party
		func = get_party_members}
	NetSessionFunc \{Obj = party
		func = get_shared_data}
	GetArraySize <connections>
	if (<array_Size> > 0)
		index = 0
		begin
		formatText checksumName = player_data 'player_%d' d = ((<connections> [<index>]).party_id)
		if NOT StructureContains structure = <party_shared_data> <player_data>
			<all_clients_are_ready> = 0
			break
		endif
		<index> = (<index> + 1)
		repeat <array_Size>
	endif
	if (<all_clients_are_ready> = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script setup_temp_net_id_array 
	GetActiveControllers
	GetArraySize <active_controllers>
	i = 0
	begin
	if NetSessionFunc func = iscontrolleringame params = {controller = <i>}
		GetNetID controller_index = (<i>)
		NetSessionFunc func = get_gamertag params = {controller = <i>}
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
	else
		popup_text = qs(0xec4dbd17)
	endif
	create_net_popup title = qs(0xaa163738) popup_text = <popup_text>
	if ScreenElementExists \{id = popupelement}
		popupelement :Obj_SpawnScriptNow \{wait_and_kill_config_warning_popup}
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
	NetSessionFunc \{Obj = party
		func = get_party_members}
	NetSessionFunc \{Obj = party
		func = get_shared_data}
	netoptions :pref_getstruct \{Name = game_modes}
	search_mode = (<pref_struct>.search_chk)
	GetArraySize <connections>
	if (<array_Size> > 0)
		num_players = <array_Size>
		index = 0
		begin
		if ((<connections> [<index>]).is_local = 1)
			<num_local_players> = (<num_local_players> + 1)
		endif
		formatText checksumName = player_data 'player_%d' d = ((<connections> [<index>]).party_id)
		if StructureContains structure = <party_shared_data> <player_data>
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
		repeat <array_Size>
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
		return \{FALSE}
		default
		return \{FALSE}
	endswitch
	return \{FALSE}
endscript

script create_intrument_config_warning 
	Change \{net_no_focus_warning = 1}
	LaunchEvent \{Type = unfocus
		target = current_menu}
	create_net_popup \{title = qs(0xaa163738)
		popup_text = qs(0x2d14c74a)}
	if ScreenElementExists \{id = popupelement}
		popupelement :Obj_SpawnScriptNow \{wait_and_kill_config_warning_popup}
	endif
endscript

script wait_and_kill_config_warning_popup 
	Wait \{3.0
		Seconds}
	destroy_net_popup
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
	online_lobby_setup_helper_controls
	Change \{net_no_focus_warning = 0}
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script net_quick_create 
	printf \{qs(0xeed4fc3d)}
	RequireParams \{[
			device_num
		]
		all}
	if (<device_num> = $primary_controller)
		if CheckForSignIn controller_index = <device_num>
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
				NetSessionFunc \{Obj = party
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
				Change \{net_new_matchmaking_ui_flag = 1}
				Change \{net_num_player_settings_ack = 0}
				set_network_preferences
				net_dummy_get_needed_search_params
				NetSessionFunc Obj = match func = set_search_params params = <...>
				NetSessionFunc \{Obj = match
					func = set_server_list_mode
					params = {
						host_only
					}}
				NetSessionFunc {
					Obj = match
					func = start_server_list
					params = {
						callback = xboxlive_menu_optimatch_results_item_add
						callback_complete = xboxlive_menu_optimatch_results_stop
						controller = <device_num>
					}
				}
				if NOT CD
					net_create_matchmaking_status_window
				endif
				SetServerMode
				StartServer
				SetJoinMode \{$JOIN_MODE_PLAY}
				JoinServer
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
	onlinelobbyinterface :GetTags
	LaunchEvent \{Type = unfocus
		target = current_menu}
	create_start_matchmaking_container
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
		begin
		formatText TextName = timer_msg qs(0xbd40792a) d = <index>
		if ScreenElementExists \{id = onlinelobbyinterface}
			onlinelobbyinterface :se_setprops matchmaking_info_text = (<timer_msg>)
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
		if NOT ($net_match_dlc_sync_finished = 1)
			if isps3
				title = qs(0xe60e3e4a)
			else
				title = qs(0x2725b21f)
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
				texture = online_load_wheel_bg
				Pos = (960.0, 600.0)
				dims = (128.0, 128.0)
				just = [
					center
					center
				]
				z_priority = 520}
			CreateScreenElement \{Type = SpriteElement
				parent = popupelement
				texture = online_load_wheel
				Pos = (960.0, 600.0)
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
	Color = ($online_player_slot_bg_team1)
	if NOT gamemode_iscooperative
		if (<index> > <num_players> / 2)
			Color = ($online_player_slot_bg_team2)
		endif
	endif
	getplayerinfo <index> career_earnings
	cash_get_info_from_earnings earnings = <career_earnings>
	getplayerinfo <index> controller
	getplayerinfo <index> is_local_client
	formatText TextName = cash_text qs(0x48c6d14c) d = <rank>
	online_lobby_add_player_slot {
		Name = <Name>
		controller_texture = <icon_texture>
		xuid = <xuid>
		bg_rgba = <Color>
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
					add_user_control_helper text = qs(0x0d215c11) button = orange z = 100000 controller = <i>
					break
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

script online_lobby_add_player_slot \{cash_text = qs(0x6160dbf3)
		cash_icon_id = cash_milestone_icon_002}
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :GetTags
		CreateScreenElement {
			Type = descinterface
			desc = 'online_lobby_player_slot_item'
			parent = <parent>
			auto_dims = FALSE
			dims = (450.0, 50.0)
			event_handlers = [
				{focus player_slot_change_focus params = {focus}}
				{unfocus player_slot_change_focus params = {unfocus}}
			]
		}
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
		<id> :desc_checkversion desired = 2 assertif = mismatch
		<id> :se_setprops {
			player_slot_name_text = <Name>
			player_instrument_logo_texture = <controller_texture>
			player_slot_bg_rgba = <bg_rgba>
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
		get_local_players_in_game
		NetSessionFunc \{Obj = party
			func = get_party_members}
		GetArraySize <connections>
		if ((<array_Size> = <num_local_players>) && (<array_Size> = <total_players>))
			Wait \{1
				Second}
			Change \{net_match_dlc_sync_finished = 1}
			net_match_set_available_items
			finalizejoinprocesslocalonly
		endif
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
		if NOT IsHost
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
			if (($net_num_players) = ($net_num_player_settings_ack))
				lock_player_parts
			endif
			gamemode_gettype
			if (<Type> = career)
				if ScreenElementExists \{id = myinterfaceelement}
					myinterfaceelement :Obj_SpawnScriptNow \{host_wait_for_player_settings_request_ack}
				endif
			endif
		endif
	endif
endscript
player_drop_in_setting_sync = 0

script host_wait_for_player_settings_request_ack 
	GetNumPlayers
	starting_players = (<num_players> + ($net_dropped_players_flag))
	begin
	GetNumPlayers
	if (<num_players> < <starting_players>)
		Change \{player_drop_in_setting_sync = 1}
		break
	endif
	Wait \{1
		Second}
	repeat
	printf \{qs(0x800db563)}
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
	if ($player_drop_in_setting_sync = 0)
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
		if (($net_num_players) = ($net_num_player_settings_ack))
			gamemode_gettype
			if (<Type> = career)
				if ScreenElementExists \{id = myinterfaceelement}
					myinterfaceelement :Obj_KillSpawnedScript \{Name = host_wait_for_player_settings_request_ack}
				endif
			endif
			printf \{qs(0x016b9c08)}
			Change \{net_num_player_settings_ack = 0}
			Change \{player_drop_in_setting_sync = 0}
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

script net_party_host_started_matchmaking 
	printf \{qs(0xea82e4e2)}
	gamemode_gettype
	if (<Type> = career)
		NetSessionFunc \{Obj = party
			func = get_party_members}
		GetArraySize <connections>
		Change \{net_career_invite_flag = 1}
		Change \{net_band_mode_menu = lobby}
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
		Change num_players_in_band = <array_Size>
		ui_event \{event = menu_change
			data = {
				state = uistate_band_mode
			}}
	else
		begin
		if ScreenElementExists \{id = current_menu}
			break
		endif
		Wait \{1
			gameframe}
		repeat
		remove_empty_slots_from_status_structs
		Change \{net_new_matchmaking_ui_flag = 1}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		set_net_dialog_message \{msg_checksum = start_matchmaking}
		if ScreenElementExists \{id = onlinelobbyinterface}
			onlinelobbyinterface :GetTags
			if ScreenElementExists id = <player_slots_menu_id>
				<player_slots_menu_id> :Obj_KillSpawnedScript Name = update_player_slots_ui
				if isscreenelementinfocus id = <player_slots_menu_id>
					LaunchEvent Type = unfocus target = <player_slots_menu_id>
				endif
			endif
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
		if ScreenElementExists \{id = netprefinterface}
			ui_destroy_net_preferences \{no_focus}
		endif
		if ScreenElementExists \{id = friendslistinterface}
			ui_destroy_friends_list \{no_focus}
		endif
		clear_temp_net_id_array
		setup_temp_net_id_array
		client_create_start_matchmaking_container
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
		if (<Type> = career)
			GetArraySize <stack>
			count = 0
			i = 0
			begin
			if ((<stack> [<i>].base_name) = 'band_mode')
				count = (<count> + 1)
			endif
			i = (<i> + 1)
			repeat <array_Size>
			if (<count> > 1)
				return
			endif
			wait_for_safe_shutdown
			Change \{net_ready_to_start = 1}
			ui_event \{event = menu_back
				data = {
					state = uistate_group_play
				}}
			create_net_popup \{title = qs(0x5ca2c535)
				popup_text = qs(0x6c53663a)}
			SpawnScriptNow \{net_party_lost_party_connection_kill_popup}
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
	Wait \{3
		Seconds}
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
	NetSessionFunc \{Obj = party
		func = get_party_members}
	GetArraySize <connections>
	if (<array_Size> >= 8)
		if NOT GotParam \{controller}
			return \{true}
		else
			i = 0
			begin
			if ((<connections> [<i>]).is_local = 1)
				if ((<connections> [<i>]).controller_index = <controller>)
					return \{FALSE}
				endif
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
			return \{true}
		endif
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
		online_lobby_transition_out
		SoundEvent \{event = online_panel_in}
		ui_create_friends_list device_num = <device_num> exit_Script = online_lobby_transition_in
	endif
endscript

script start_net_preferences 
	if NOT ScreenElementExists \{id = netprefinterface}
		LaunchEvent \{Type = unfocus
			target = current_menu}
		online_lobby_transition_out
		SoundEvent \{event = online_panel_in}
		ui_create_net_preferences device_num = <device_num> exit_Script = online_lobby_transition_in
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
			if GotParam \{finished_matchmaking}
				setplayerinfo <info_index> part = bass
				getplayerinfo <info_index> net_id_first
				getplayerinfo <info_index> net_id_second
				formatText checksumName = gamertag 'gamertag_%d' d = (<index> - 1)
				SendStructure callback = update_player_part data_to_send = {first_id = <net_id_first> second_id = <net_id_second> Name = ($<gamertag>) part = bass}
				update_player_part first_id = <net_id_first> second_id = <net_id_second> Name = ($<gamertag>) part = bass
			else
				update_party_player_part info_index = <info_index> part = bass controller = <device_num>
			endif
		elseif (<part> = bass)
			if GotParam \{finished_matchmaking}
				setplayerinfo <info_index> part = guitar
				getplayerinfo <info_index> net_id_first
				getplayerinfo <info_index> net_id_second
				formatText checksumName = gamertag 'gamertag_%d' d = (<index> - 1)
				SendStructure callback = update_player_part data_to_send = {first_id = <net_id_first> second_id = <net_id_second> Name = ($<gamertag>) part = guitar}
				update_player_part first_id = <net_id_first> second_id = <net_id_second> Name = ($<gamertag>) part = guitar
			else
				update_party_player_part info_index = <info_index> part = guitar controller = <device_num>
			endif
		endif
	endif
endscript

script update_party_player_part 
	NetSessionFunc \{Obj = party
		func = get_shared_data}
	getplayerinfo <info_index> party_id
	formatText checksumName = player_data 'player_%d' d = <party_id>
	if StructureContains structure = <party_shared_data> <player_data>
		setplayerinfo <info_index> part = <part>
		get_savegame_from_controller controller = <controller>
		get_current_band_info
		GetGlobalTags <band_info> savegame = <savegame> param = career_earnings
		party_info = {}
		appendstruct {
			struct = party_info
			Field = <player_data>
			params = {
				player_part = <part>
				player_career_earnings = <career_earnings>
			}
		}
		NetSessionFunc Obj = party func = append_shared_data params = {data = <party_info>}
		refresh_player_slots_ui
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
	wait_for_safe_shutdown
	if ScreenElementExists \{id = onlinelobbyinterface}
		onlinelobbyinterface :Obj_KillSpawnedScript \{Name = set_net_ui_to_finished_searching}
		KillSpawnedScript \{Name = set_net_ui_to_finished_searching}
		if onlinelobbyinterface :desc_resolvealias \{Name = alias_player_slots_vmenu
				param = player_slots_menu}
			LaunchEvent Type = unfocus target = <player_slots_menu>
		endif
	endif
	create_net_popup \{title = qs(0x5ca2c535)
		popup_text = qs(0x32f94482)}
	Wait \{3
		Seconds}
	destroy_net_popup
	quit_network_game
	refresh_online_lobby
endscript

script matchmaking_countdown_drop_player_script 
	printf \{qs(0x24956f54)}
	printf \{qs(0x1708dab5)}
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
