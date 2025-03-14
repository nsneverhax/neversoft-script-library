pager_window_title_color = [
	60
	128
	60
	128
]
pager_window_message_color = [
	50
	90
	128
	128
]
pager_window_bg_alpha = 0.15
pager_message_count_pos = (25.0, 18.0)
show_pausemenu_phone = 0

script pager_message_list_changed 
	printf '--- pager_message_list_changed'
	if gotparam flag
		setglobalflag flag = <flag>
	endif
	if istrue $game_progress_debug_active
		return
	endif
	if gotparam send_delay
		wait <send_delay> seconds
	endif
	if NOT screenelementexists id = pager_anchor
		if gotparam message_num
			if NOT Pager_IsNewMessage message_num = <message_num>
				return
			endif
		endif
		change show_pausemenu_phone = 1
		if gotparam priority_message
			BlockUntilScreenClear
			ui_change_state state = UIstate_videophone_priority
		else
			WaitUntilScreenClear callback = videophone_notify_user
		endif
	endif
endscript
