
script hud_create_message \{Priority = 0
		style_script = hud_message_wait_and_die
		font = fontgrid_text_a6}
	if NOT ScreenElementExists \{id = hud_root}
		return
	endif
	if NOT GotParam \{Band}
		if (<Player> = 2)
			if ($boss_battle = 1)
				return
			endif
		endif
		if NOT gethudmessageparent Player = <Player>
			return
		endif
	else
		if NOT ScreenElementExists \{id = hud_band_messages}
			CreateScreenElement \{Type = ContainerElement
				id = hud_band_messages
				parent = hud_root
				Pos = (640.0, 280.0)
				dims = (640.0, 100.0)
				just = [
					center
					center
				]}
		endif
		message_parent = hud_band_messages
	endif
	RunScriptOnScreenElement id = <message_parent> hud_wait_and_create_message params = <...>
endscript

script hud_wait_and_create_message 
	begin
	if ResolveScreenElementID id = {<message_parent> child = 0}
		<resolved_id> :GetSingleTag message_priority
		if (<Priority> = -1)
			if (<message_priority> = -1)
				break
			else
				return
			endif
		else
			if (<Priority> <= <message_priority>)
				begin
				if NOT ScreenElementExists id = <resolved_id>
					break
				endif
				Wait \{1
					gameframe}
				repeat
			else
				break
			endif
		endif
	else
		break
	endif
	Wait \{2
		gameframes}
	repeat
	DestroyScreenElement id = <message_parent> preserve_parent
	GetScreenElementDims id = <message_parent>
	<dims> = ((<width> * (1.0, 0.0)) + (<height> * (0.0, 1.0)))
	CreateScreenElement {
		parent = <message_parent>
		Type = TextBlockElement
		font = <font>
		text = <text>
		rgba = [223 223 223 255]
		Pos = (0.0, 0.0)
		pos_anchor = [center top]
		just = [center top]
		internal_just = [center top]
		dims = <dims>
		internal_scale = 0.5
		fit_width = `scale	each	line	if	larger`
		z_priority = 50
		Shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		allow_expansion
		tags = {message_priority = <Priority>}
	}
	RunScriptOnScreenElement id = <id> <style_script> params = <style_script_params>
endscript

script test_hud_messages 
	<i> = 1
	begin
	SpawnScriptNow test_hud_messages_2 params = {Player = <i>}
	<i> = (<i> + 1)
	repeat 2
endscript

script test_hud_messages_2 
	SpawnScriptNow hud_create_message params = {Player = <Player> text = qs(0xa943996f)}
	Wait \{0.25
		Second}
	SpawnScriptNow hud_create_message params = {Player = <Player> text = qs(0x69cc2864)}
	Wait \{0.25
		Second}
	SpawnScriptNow hud_create_message params = {Player = <Player> text = qs(0xe99c37e4)}
	Wait \{0.25
		Second}
	SpawnScriptNow hud_create_message params = {Player = <Player> text = qs(0x87753db7) Priority = 2}
	Wait \{0.25
		Second}
	SpawnScriptNow hud_create_message params = {Player = <Player> text = qs(0x044adb3e)}
endscript

script hud_message_wait_and_die 
	se_setprops \{alpha = 0}
	se_setprops \{alpha = 1.0
		time = 0.1}
	se_waitprops
	Wait \{2
		Seconds
		ignoreslomo}
	Die
endscript

script hud_message_band_streak_style 
	Obj_GetID
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
		CreateScreenElement {
			Type = SpriteElement
			parent = <objID>
			Pos = ((320.0, 28.0) + <offs> - <center>)
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
		Scale = 0
		rgba = [
			255
			172
			0
			0
		]}
	se_setprops \{alpha = 1.0
		Scale = 1.0
		rgba = [
			255
			172
			64
			255
		]
		time = 0.5}
	se_waitprops
	Wait \{2
		Seconds
		ignoreslomo}
	se_setprops \{alpha = 0.0
		Scale = 1.1
		rgba = [
			255
			172
			0
			0
		]
		time = 0.5}
	se_waitprops
	Die
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
		SoundEvent \{event = star_power_available_gh4}
	endif
	se_setprops \{alpha = 1.0
		time = 0.1}
	se_waitprops
	Wait \{2
		Seconds
		ignoreslomo}
	Die
endscript

script hud_message_flame_style_note_streak 
	hud_message_flame_style {notestreak = 1 highway_num = <highway_num>}
endscript

script hud_message_flame_style_starpower_ready 
	hud_message_flame_style2 {starpower = 1 highway_num = <highway_num>}
endscript

script hud_message_flame_style 
	se_setprops \{alpha = 0
		Scale = (0.5, 0.5)
		z_priority = 0.01
		Pos = (0.0, 70.0)
		rgba = [
			255
			128
			64
			0
		]}
	hud_move_flame_container {starpower = <starpower> notestreak = <notestreak> highway_num = <highway_num> 0xe4c0e190}
	Wait \{0.3
		Seconds}
	if GotParam \{starpower}
		if NOT ($is_attract_mode = 1)
			SoundEvent \{event = star_power_available_gh4}
		endif
	endif
	se_setprops \{alpha = 1
		Scale = (0.5, 0.5)
		rgba = [
			255
			128
			0
			255
		]
		Pos = (0.0, 70.0)
		time = 0.1}
	Wait \{0.1
		Seconds}
	se_setprops \{alpha = 1
		Scale = (0.75, 0.75)
		Pos = (0.0, 0.0)
		rgba = [
			255
			200
			64
			255
		]
		time = 0.5}
	Wait \{0.75
		Seconds}
	hud_move_flame_container {highway_num = <highway_num> 0x325e947d}
	se_setprops \{alpha = 0
		Scale = (0.78999996, 0.78999996)
		Pos = (0.0, 0.0)
		rgba = [
			255
			200
			64
			0
		]
		time = 1.0}
	Wait \{1.0
		Seconds
		ignoreslomo}
	Die
endscript

script hud_message_flame_style2 
	se_setprops \{alpha = 0
		Scale = (0.5, 0.5)
		z_priority = 0.01
		Pos = (0.0, 70.0)
		rgba = [
			0
			255
			255
			0
		]}
	hud_move_flame_container {starpower = <starpower> notestreak = <notestreak> highway_num = <highway_num> 0xe4c0e190}
	Wait \{0.3
		Seconds}
	if GotParam \{starpower}
		if NOT ($is_attract_mode = 1)
			SoundEvent \{event = star_power_available_gh4}
		endif
	endif
	se_setprops \{alpha = 1
		Scale = (0.5, 0.5)
		rgba = [
			0
			255
			255
			255
		]
		Pos = (0.0, 70.0)
		time = 0.1}
	Wait \{0.1
		Seconds}
	se_setprops \{alpha = 1
		Scale = (0.75, 0.75)
		Pos = (0.0, 0.0)
		rgba = [
			255
			255
			255
			255
		]
		time = 0.5}
	Wait \{0.75
		Seconds}
	hud_move_flame_container {highway_num = <highway_num> 0x325e947d}
	se_setprops \{alpha = 0
		Scale = (0.78999996, 0.78999996)
		Pos = (0.0, 0.0)
		rgba = [
			128
			255
			255
			0
		]
		time = 1.0}
	Wait \{1.0
		Seconds
		ignoreslomo}
	Die
endscript
