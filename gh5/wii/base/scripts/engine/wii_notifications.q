sysnotify_old_position = NULL
wii_notification_strings = {
	received_invite = qs(0x1773bbd9)
	friend_left_game = qs(0x5bc2702e)
	lost_connection = qs(0xfe105c77)
	connected_to_wifi = qs(0xdb4c6c23)
	connected_to_gameservers = qs(0x916f8da0)
	disconnected_from_gameservers = qs(0x29e6f90b)
	disconnected_from_wifi = qs(0x6efaee8f)
	connection_failed = qs(0x183f3919)
	friend_signed_on = qs(0xb4a0e4b1)
	friend_signed_off = qs(0xe34df6ab)
	friend_is_online = qs(0xa287000e)
	friends_are_online = qs(0x92c4ff03)
	friend_joined = qs(0xff420d69)
	friends_imported = qs(0x4e8f586c)
	friends_removed = qs(0x7b659e0f)
}

script create_notification_popup 
	RequireParams \{[
			position
			display_time
			text
		]
		all}
	printf \{'-- create_notification_popup --'}
	setscriptcannotpause
	gh5_band_screen_ui_sound \{choose = 1}
	setnotificationsdelayed \{true}
	convert_notification_position Pos = <position>
	CreateScreenElement {
		id = wii_notification_popup
		parent = root_window
		Type = descinterface
		desc = 'net_wii_notification'
		notificationtext_text = <text>
		z_priority = 1000000.0
	}
	<id> :desc_resolvealias Name = alias_notificationbox
	<resolved_id> :se_setprops Pos = (0.0, 0.0) just = <just> pos_anchor = <just> alpha = 0.0
	<fade_time> = 0.6
	GetStartTime
	begin
	getelapsedtime starttime = <starttime>
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
	GetStartTime
	begin
	getelapsedtime starttime = <starttime>
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
		horizontal = right
		vertical = center
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

script halt_wii_notifications 
	setnotificationsdelayed \{true}
endscript

script allow_wii_notifications 
	setnotificationsdelayed \{FALSE}
endscript

script display_exclusive_notification \{display_time = 1.0
		position = topright}
	RequireParams \{[
			position
			display_time
			text
		]
		all}
	if NOT ScreenElementExists \{id = wii_notification_popup}
		SpawnScriptNow create_notification_popup params = {
			position = <position>
			display_time = <display_time>
			text = <text>
		}
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

script change_system_notification_position_temp 
	RequireParams \{[
			Pos
		]
		all}
	printf \{'-- change_system_notification_position_temp --'}
	Change sysnotify_old_position = ($sysnotify_ingame_position)
	Change sysnotify_ingame_position = <Pos>
	setsystemnotificationposition Pos = ($sysnotify_ingame_position)
endscript

script restore_system_notifications_position 
	printf \{'-- restore_system_notifications_position --'}
	Change sysnotify_ingame_position = ($sysnotify_old_position)
	setsystemnotificationposition Pos = ($sysnotify_ingame_position)
endscript
