
script hud_create_message \{priority = 0
		style_script = hud_message_wait_and_die
		font = fontgrid_bordello}
	if NOT screenelementexists \{id = hud_root}
		return
	endif
	if NOT gotparam \{band}
		if (<player> = 2)
			if ($boss_battle = 1)
				return
			endif
		endif
		if NOT gethudmessageparent player = <player>
			return
		endif
	else
		if NOT screenelementexists \{id = hud_band_messages}
			createscreenelement \{type = containerelement
				id = hud_band_messages
				parent = hud_root
				pos = (640.0, 270.0)
				dims = (640.0, 100.0)
				just = [
					center
					center
				]}
		endif
		message_parent = hud_band_messages
	endif
	runscriptonscreenelement id = <message_parent> hud_wait_and_create_message params = <...>
endscript

script hud_wait_and_create_message \{rgba = [
			223
			223
			223
			255
		]}
	begin
	if resolvescreenelementid id = {<message_parent> child = hud_message}
		if <resolved_id> :getsingletag message_priority
			if (<priority> = -1)
				if (<message_priority> = -1)
					break
				else
					return
				endif
			else
				if (<priority> <= <message_priority>)
					begin
					if NOT screenelementexists id = <resolved_id>
						break
					endif
					wait \{1
						gameframe}
					repeat
				else
					break
				endif
			endif
		endif
	else
		break
	endif
	wait \{2
		gameframes}
	repeat
	destroyscreenelement id = <message_parent> preserve_parent
	getscreenelementdims id = <message_parent>
	<dims> = ((<width> * (1.0, 0.0)) + (<height> * (0.0, 1.0)))
	createscreenelement {
		parent = <message_parent>
		local_id = hud_message
		type = textblockelement
		font = <font>
		text = <text>
		rgba = <rgba>
		pos = (0.0, 0.0)
		pos_anchor = [center top]
		just = [center top]
		internal_just = [center top]
		dims = <dims>
		internal_scale = 0.5
		fit_width = `scale each line if larger`
		z_priority = 50
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		allow_expansion
		tags = {message_priority = <priority>}
	}
	runscriptonscreenelement id = <id> <style_script> params = <style_script_params>
endscript

script test_hud_messages 
	<i> = 1
	begin
	spawnscriptnow test_hud_messages_2 params = {player = <i>}
	<i> = (<i> + 1)
	repeat 2
endscript

script test_hud_messages_2 
	spawnscriptnow hud_create_message params = {player = <player> text = qs(0xa943996f)}
	wait \{0.25
		second}
	spawnscriptnow hud_create_message params = {player = <player> text = qs(0x69cc2864)}
	wait \{0.25
		second}
	spawnscriptnow hud_create_message params = {player = <player> text = qs(0xe99c37e4)}
	wait \{0.25
		second}
	spawnscriptnow hud_create_message params = {player = <player> text = qs(0x87753db7) priority = 2}
	wait \{0.25
		second}
	spawnscriptnow hud_create_message params = {player = <player> text = qs(0x044adb3e)}
endscript

script hud_message_wait_and_die 
	se_setprops \{alpha = 0}
	se_setprops \{alpha = 1.0
		time = 0.1}
	se_waitprops
	wait \{2
		seconds
		ignoreslomo}
	die
endscript

script hud_message_band_streak_style 
	obj_getid
	gamemode_getnumplayersshown
	streak_players = 0
	<i> = 0
	begin
	if (<players> [<i>] = 1)
		streak_players = (<streak_players> + 1)
	endif
	<i> = (<i> + 1)
	repeat <num_players_shown>
	<i> = 0
	<icons_displayed> = 0
	begin
	if (<players> [<i>] = 1)
		p = (<i> + 1)
		getplayerinfo <p> part
		switch <part>
			case vocals
			texture = band_hud_microphone
			case bass
			texture = band_hud_bass
			case drum
			texture = band_hud_drums
			case guitar
			default
			texture = band_hud_guitar
		endswitch
		<center> = ((<streak_players> / 2.0) * (36.0, 0.0))
		<offs> = ((<icons_displayed> + 0.5) * (36.0, 0.0))
		createscreenelement {
			type = spriteelement
			parent = <objid>
			pos = ((320.0, -55.0) + <offs> - <center>)
			dims = (64.0, 64.0)
			pos_anchor = [center top]
			just = [center top]
			internal_just = [center top]
			texture = <texture>
			rgba = [255 172 64 255]
		}
		<icons_displayed> = (<icons_displayed> + 1)
	endif
	<i> = (<i> + 1)
	repeat <num_players_shown>
	se_setprops \{alpha = 0
		scale = 0
		rgba = [
			255
			172
			0
			0
		]}
	se_setprops \{alpha = 1.0
		scale = 1.0
		rgba = [
			255
			172
			64
			255
		]
		time = 0.5}
	se_waitprops
	wait \{2
		seconds
		ignoreslomo}
	se_setprops \{alpha = 0.0
		scale = 1.1
		rgba = [
			255
			172
			0
			0
		]
		time = 0.5}
	se_waitprops
	die
endscript

script hud_message_starpower_ready_style 
	se_setprops \{rgba = [
			145
			215
			235
			250
		]
		alpha = 0}
	if NOT ($is_attract_mode = 1)
		soundevent \{event = star_power_available_gh4}
	endif
	se_setprops \{alpha = 1.0
		time = 0.1}
	se_waitprops
	wait \{2
		seconds
		ignoreslomo}
	die
endscript

script hud_message_flame_style_note_streak 
	hud_message_flame_style {notestreak = 1 highway_num = <highway_num>}
endscript

script hud_message_flame_style_starpower_ready 
	hud_message_flame_style2 {starpower = 1 highway_num = <highway_num>}
endscript

script hud_message_flame_style 
	se_setprops \{alpha = 0
		scale = (0.5, 0.5)
		z_priority = 0.01
		pos = (0.0, 70.0)
		rgba = [
			255
			128
			64
			0
		]}
	hud_move_flame_container {pos = (0.0, -60.0) scale = (0.5, 0.0) starpower = <starpower> notestreak = <notestreak> highway_num = <highway_num>}
	wait \{0.3
		seconds}
	if gotparam \{starpower}
		if NOT ($is_attract_mode = 1)
			soundevent \{event = star_power_available_gh4}
		endif
	endif
	hud_move_flame_container {scale = (0.9, 1.0) pos = (0.0, 10.0) time = 0.5 highway_num = <highway_num>}
	se_setprops \{alpha = 1
		scale = (0.5, 0.5)
		rgba = [
			255
			128
			0
			255
		]
		pos = (0.0, 70.0)
		time = 0.1}
	wait \{0.1
		seconds}
	se_setprops \{alpha = 1
		scale = (0.75, 0.75)
		pos = (0.0, 0.0)
		rgba = [
			255
			200
			64
			255
		]
		time = 0.5}
	wait \{0.75
		seconds}
	hud_move_flame_container {scale = (1.0, 0.0) pos = (0.0, -40.0) time = 0.2 highway_num = <highway_num>}
	se_setprops \{alpha = 0
		scale = (0.78999996, 0.78999996)
		pos = (0.0, 0.0)
		rgba = [
			255
			200
			64
			0
		]
		time = 1.0}
	wait \{1.0
		seconds
		ignoreslomo}
	die
endscript

script hud_message_flame_style2 
	se_setprops \{alpha = 0
		scale = (0.5, 0.5)
		z_priority = 0.01
		pos = (0.0, 70.0)
		rgba = [
			0
			255
			255
			0
		]}
	hud_move_flame_container {pos = (0.0, -60.0) scale = (0.5, 0.0) starpower = <starpower> notestreak = <notestreak> highway_num = <highway_num>}
	wait \{0.3
		seconds}
	if gotparam \{starpower}
		if NOT ($is_attract_mode = 1)
			soundevent \{event = star_power_available_gh4}
		endif
	endif
	hud_move_flame_container {scale = (0.9, 1.0) pos = (0.0, 10.0) time = 0.5 highway_num = <highway_num>}
	se_setprops \{alpha = 1
		scale = (0.5, 0.5)
		rgba = [
			0
			255
			255
			255
		]
		pos = (0.0, 70.0)
		time = 0.1}
	wait \{0.1
		seconds}
	se_setprops \{alpha = 1
		scale = (0.75, 0.75)
		pos = (0.0, 0.0)
		rgba = [
			255
			255
			255
			255
		]
		time = 0.5}
	wait \{0.75
		seconds}
	hud_move_flame_container {scale = (1.0, 0.0) pos = (0.0, -40.0) time = 0.2 highway_num = <highway_num>}
	se_setprops \{alpha = 0
		scale = (0.78999996, 0.78999996)
		pos = (0.0, 0.0)
		rgba = [
			128
			255
			255
			0
		]
		time = 1.0}
	wait \{1.0
		seconds
		ignoreslomo}
	die
endscript
