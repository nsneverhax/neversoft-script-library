sysnotify_old_position = NULL
wii_notification_strings = {
	received_invite = qs(0x12d53ef4)
	friend_left_game = qs(0x5bc2702e)
	lost_connection = qs(0xfe105c77)
	connected_to_wifi = qs(0x94ae377f)
	connected_to_gameservers = qs(0x916f8da0)
	disconnected_from_gameservers = qs(0x29e6f90b)
	disconnected_from_wifi = qs(0x5042605c)
	connection_failed = qs(0xe9b1a3fa)
	friend_signed_on = qs(0xb4a0e4b1)
	friend_signed_off = qs(0xe34df6ab)
	friend_is_online = qs(0x68f4da59)
	friends_are_online = qs(0x3ba37965)
	rival_is_online = qs(0x24d66cca)
	rivals_are_online = qs(0x17ddd297)
	friend_joined = qs(0xff420d69)
	friends_imported = qs(0xf2031d5c)
	friends_removed = qs(0xa295a16f)
	receive_rival_request = qs(0xba1bd9a1)
	accept_rival_request = qs(0xffbdac13)
	press_2_when_not_online = qs(0x2930c43a)
	rival_add_available = qs(0x2707f544)
	invites_menu_disabled_in_music_store = qs(0x6a520ad0)
	invites_menu_disabled_in_rock_archive = qs(0xbfa54418)
}
current_notification = {
	position = topright
	display_time = 0.0
	text = qs(0x00000000)
	Type = Default
}
defer_current_notification = 0

script create_notification_popup_main \{id = !q1768515945
		text = 0x69696969
		z = !f1768515945
		image = !q1768515945}
	CreateScreenElement {
		id = <id>
		parent = root_window
		Type = descinterface
		desc = 'net_wii_notification'
		notificationtext_text = <text>
		z_priority = <z>
		icon_texture = <image>
	}
	return id = <id>
endscript

script create_notification_popup_main_award \{id = !q1768515945
		text = 0x69696969
		z = !f1768515945
		image = !q1768515945}
	printf \{'-- create_notification_popup_main_award --'}
	CreateScreenElement {
		id = <id>
		parent = root_window
		Type = descinterface
		desc = 'net_wii_notification'
		notificationtextaward_text = <text>
		z_priority = <z>
		icon_texture = <image>
	}
	return id = <id>
endscript

script add_roadie_to_notification_popup \{parent = !q1768515945
		z = !f1768515945}
	getrandomarrayelement \{$audience_party_roadie_names}
	CreateScreenElement {
		Type = SpriteElement
		parent = <parent>
		texture = <element>
		Pos = (380.0, 47.0)
		Scale = 1.4
		rgba = [201 174 139 180]
		z_priority = <z>
	}
endscript

script create_notification_popup \{position = !q1768515945
		display_time = !f1768515945
		text = 0x69696969
		Type = Default}
	printf \{'-- create_notification_popup --'}
	setscriptcannotpause
	audio_ui_band_lobby_sfx_logic \{choose = 1}
	setnotificationsdelayed \{true}
	Change current_notification = <...>
	printstruct ($current_notification)
	convert_notification_position Pos = <position>
	get_notification_icon_image notification_type = <Type>
	<notification_z> = 1000000.0
	if (<Type> = award)
		create_notification_popup_main_award {
			id = wii_notification_popup
			text = <text>
			z = <notification_z>
			image = <image>
		}
	else
		create_notification_popup_main {
			id = wii_notification_popup
			text = <text>
			z = <notification_z>
			image = <image>
		}
	endif
	<id> :desc_resolvealias Name = alias_notificationbox
	<resolved_id> :se_setprops Pos = (0.0, 0.0) just = <just> pos_anchor = <just> alpha = 0.0
	play_notification_sound notification_type = <Type>
	if (<Type> = award)
		add_roadie_to_notification_popup parent = <resolved_id> z = (<notification_z> + 1)
	endif
	<fade_time> = 0.6
	GetTrueStartTime
	begin
	GetTrueElapsedTime starttime = <starttime>
	<ElapsedTime> = (<ElapsedTime> / 1000.0)
	if (<ElapsedTime> > (<fade_time> + <display_time>))
		break
	endif
	<alpha> = (<ElapsedTime> / <fade_time>)
	if (<alpha> > 1)
		<alpha> = 1
	endif
	getnotificationsposition
	convert_notification_position Pos = <notification_position>
	<resolved_id> :se_setprops Pos = (0.0, 0.0) just = <just> pos_anchor = <just> alpha = <alpha>
	RemoveParameter \{alpha}
	RemoveParameter \{just}
	RemoveParameter \{notification_position}
	WaitOneGameFrame
	repeat
	GetTrueStartTime
	begin
	GetTrueElapsedTime starttime = <starttime>
	<ElapsedTime> = (<ElapsedTime> / 1000.0)
	if (<ElapsedTime> > <fade_time>)
		break
	endif
	<alpha> = (1.0 - (<ElapsedTime> / <fade_time>))
	if (<alpha> < 0)
		<alpha> = 0
	endif
	getnotificationsposition
	convert_notification_position Pos = <notification_position>
	<resolved_id> :se_setprops Pos = (0.0, 0.0) just = <just> pos_anchor = <just> alpha = <alpha>
	RemoveParameter \{alpha}
	RemoveParameter \{just}
	RemoveParameter \{notification_position}
	WaitOneGameFrame
	repeat
	DestroyScreenElement id = <id>
	setnotificationsdelayed \{FALSE}
endscript

script convert_notification_position 
	RequireParams \{[
			Pos
		]
		all}
	switch (<Pos>)
		case topleft
		horizontal = left
		vertical = top
		case topcenter
		horizontal = center
		vertical = top
		case topright
		horizontal = right
		vertical = top
		case centerleft
		horizontal = left
		vertical = center
		case center
		horizontal = center
		vertical = center
		case centerright
		horizontal = 1.15
		vertical = 0.0
		case bottomleft
		horizontal = left
		vertical = bottom
		case bottomcenter
		horizontal = center
		vertical = bottom
		case bottomright
		horizontal = right
		vertical = bottom
	endswitch
	if NOT GotParam \{horizontal}
		ScriptAssert \{'Invalid position parameter <pos>'}
	endif
	array = []
	AddArrayElement array = <array> element = <horizontal>
	AddArrayElement array = <array> element = <vertical>
	return just = <array>
endscript

script get_notification_icon_image \{notification_type = !q1768515945}
	image = net_notification_box_icon
	switch (<notification_type>)
		case connected
		<image> = net_notification_box_icon_neton
		case invites_list_offline
		case disconnected
		<image> = net_notification_box_icon_netoff
		case friend
		<image> = net_notification_box_icon_frnd
		case rival
		<image> = net_notification_box_icon_strgr
		case invite
		<image> = net_notification_box_icon_envlp
		case award
		<image> = net_notification_box_icon_cup
	endswitch
	return image = <image>
endscript

script play_notification_sound \{notification_type = !q1768515945}
	event = wii_notification_default
	switch (<notification_type>)
		case connected
		<event> = wii_notification_connected
		case disconnected
		<event> = wii_notification_disconnected
		case friend
		<event> = wii_notification_friend
		case rival
		<event> = wii_notification_rival
		case invite
		<event> = wii_notification_invite
		case award
		<event> = wii_notification_wiiward
	endswitch
	SoundEvent event = <event>
endscript

script halt_wii_notifications 
	if ScreenElementExists \{id = wii_notification_popup}
		DestroyScreenElement \{id = wii_notification_popup}
		Change \{defer_current_notification = 1}
	endif
	setnotificationsdelayed \{true}
endscript

script allow_wii_notifications 
	if ($defer_current_notification = 1)
		displaynotification {
			position = (($current_notification).position)
			display_time = (($current_notification).display_time)
			text = (($current_notification).text)
			high_priority
		}
		Change \{defer_current_notification = 0}
	endif
	setnotificationsdelayed \{FALSE}
endscript

script display_exclusive_notification \{display_time = 1.5
		position = NULL
		text = qs(0x00000000)}
	if (<position> = NULL)
		<position> = $sysnotify_ingame_position
	endif
	StringLength string = <text>
	if (<str_len> > 0)
		if NOT ScreenElementExists \{id = wii_notification_popup}
			SpawnScriptNow create_notification_popup params = {
				position = <position>
				display_time = <display_time>
				text = <text>
			}
		endif
	endif
endscript

script wait_for_connection_failed_notification 
	Wait \{10
		Seconds}
	if NOT CheckForSignIn \{controller_index = 0
			dont_set_primary}
		if NOT NetSessionFunc \{Obj = friends
				func = list_is_refreshed}
			NetSessionFunc \{Obj = friends
				func = connection_failed}
		endif
	endif
endscript

script is_notification_of_type_on_screen \{Type = !q1768515945}
	ret_value = 0
	if ScreenElementExists \{id = wii_notification_popup}
		if (($current_notification.Type) = <Type>)
			<ret_value> = 1
		endif
	endif
	return exists = <ret_value>
endscript
