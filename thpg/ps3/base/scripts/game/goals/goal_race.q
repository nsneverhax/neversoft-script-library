
script goal_race_message 
	ui_kill_message_hack \{id = ui_alert_uber}
	switch <color>
		case blue
		<color> = bluelt
		case yellow
		<color> = amber
	endswitch
	ui_display_message {
		type = uberalert
		text = <text>
		color = <color>
		has_background
	}
endscript
