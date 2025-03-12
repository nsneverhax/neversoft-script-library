
script hud_create_message \{priority = 0
		style_script = hud_message_wait_and_die
		font = fontgrid_title_a1}
	if NOT screenelementexists \{id = hud_root}
		return
	endif
	if gotparam \{post_on_highway}
		requireparams \{[
				player
			]
			all}
		get_highway_hud_message_parent player = <player>
	else
		if NOT gotparam \{band}
			requireparams \{[
					player
				]
				all}
			if gotparam \{text}
				formattext textname = t1 qs(0x57adb0e0) p = <player> t = <text>
				text = <t1>
			endif
		endif
		if NOT hud_root :desc_resolvealias \{name = alias_message_container
				param = message_parent}
			scriptassert \{'cannot resolve message parent'}
		endif
	endif
	runscriptonscreenelement id = <message_parent> hud_wait_and_create_message params = <...>
endscript

script hud_wait_and_create_message 
	begin
	if resolvescreenelementid id = {<message_parent> child = 0}
		<resolved_id> :getsingletag message_priority
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
		type = textblockelement
		font = <font>
		text = <text>
		rgba = [223 223 223 255]
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
		enable_min_scale = false
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
	num_players = 0
	getarraysize <players>
	num_players = <array_size>
	<i> = 0
	<icons_displayed> = 0
	if (<array_size> > 0)
		getscreenelementdims id = <objid>
		<dims> = ((<width> * (1.0, 0.0)) + (<height> * (0.0, 1.0)))
		createscreenelement {
			type = hmenu
			parent = <objid>
			id = icon_menu
			pos = (0.0, 32.0)
			dims = <dims>
			just = [left top]
			pos_anchor = [left top]
			internal_just = [center top]
		}
		begin
		p = (<players> [<i>])
		getplayerinfo <p> part
		if NOT gotparam \{broken_icons}
			switch <part>
				case vocals
				texture = mixer_icon_vox
				case bass
				texture = mixer_icon_bass
				case drum
				texture = mixer_icon_drums
				case guitar
				default
				texture = mixer_icon_guitar
			endswitch
			rgba = [255 172 64 255]
		else
			switch <part>
				case vocals
				texture = band_hud_microphone2
				case bass
				texture = band_hud_bass2
				case drum
				texture = band_hud_drums2
				case guitar
				default
				texture = band_hud_guitar2
			endswitch
			rgba = ($vocals_hud_glow_rgba [(<p> -1)])
		endif
		createscreenelement {
			type = spriteelement
			parent = icon_menu
			dims = (64.0, 64.0)
			texture = <texture>
			rgba = <rgba>
		}
		<icons_displayed> = (<icons_displayed> + 1)
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	se_setprops \{alpha = 0
		scale = 0.8
		rgba = [
			255
			172
			0
			0
		]}
	se_setprops \{alpha = 1.0
		rgba = [
			255
			255
			255
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
	soundevent \{event = audio_star_power_available}
	se_setprops \{alpha = 1.0
		time = 0.1}
	se_waitprops
	wait \{2
		seconds
		ignoreslomo}
	die
endscript

script hud_message_flame_style_note_streak 
	hud_message_flame_style {notestreak = 1 highway_num = <player>}
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
		soundevent \{event = audio_star_power_available}
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
		soundevent \{event = audio_star_power_available}
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

script hud_move_flame_container \{pos = (0.0, 0.0)
		scale = (1.0, 1.0)
		time = 0.3
		highway_num = 1}
	get_highway_hud_root_id player = <highway_num>
	if <highway_hud_root> :desc_resolvealias name = alias_hud_message_fire param = flame_container
		<flame_container> :desc_resolvealias name = alias_flame_container param = flame_id
	endif
	if gotparam \{flame_id}
		if screenelementexists id = <flame_id>
			if gotparam \{notestreak}
				setscreenelementprops {
					id = {<flame_id> child = 0}
					alpha = 1
				}
				setscreenelementprops {
					id = {<flame_id> child = 1}
					alpha = 0
				}
			elseif gotparam \{starpower}
				setscreenelementprops {
					id = {<flame_id> child = 1}
					alpha = 1
				}
				setscreenelementprops {
					id = {<flame_id> child = 0}
					alpha = 0
				}
			endif
			setscreenelementprops {
				id = <flame_id>
				pos = <pos>
				scale = <scale>
				time = <time>
			}
		endif
	endif
endscript

script hud_show_drumfill_score 
	getnumplayersingame
	if (<num_players> = 1)
		formattext textname = text qs(0x9b704576) d = <score>
		hud_create_message player = <player> text = <text>
	endif
endscript

script hud_show_drumsolo_score 
	formattext textname = text qs(0x8e2da9b3) d = <score>
	hud_create_message player = <player> text = <text>
endscript

script hud_show_drumfill_challenge 
	hud_create_message player = <player> text = qs(0x200e0af0)
endscript
