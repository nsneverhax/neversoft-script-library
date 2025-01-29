
script hud_create_message \{Priority = 0
		style_script = hud_message_wait_and_die
		font = fontgrid_title_a1}
	if NOT ScreenElementExists \{id = hud_root}
		return
	endif
	if GotParam \{post_on_highway}
		RequireParams \{[
				Player
			]
			all}
		get_highway_hud_message_parent Player = <Player>
	else
		if NOT GotParam \{Band}
			RequireParams \{[
					Player
				]
				all}
			if GotParam \{text}
				formatText TextName = t1 qs(0xa97b4e9a) p = <Player> t = <text>
				text = <t1>
			endif
		endif
		if NOT hud_root :desc_resolvealias \{Name = alias_message_container
				param = message_parent}
			ScriptAssert \{'cannot resolve message parent'}
		endif
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
		enable_min_scale = FALSE
	}
	RunScriptOnScreenElement id = <id> <style_script> params = <style_script_params>
endscript

script test_hud_messages 
	ScriptAssert \{'test_hud_messages: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
	num_players = 0
	GetArraySize <players>
	num_players = <array_Size>
	<i> = 0
	<icons_displayed> = 0
	if (<array_Size> > 0)
		GetScreenElementDims id = <objID>
		<dims> = ((<width> * (1.0, 0.0)) + (<height> * (0.0, 1.0)))
		CreateScreenElement {
			Type = HMenu
			parent = <objID>
			id = icon_menu
			Pos = (0.0, 32.0)
			dims = <dims>
			just = [left top]
			pos_anchor = [left top]
			internal_just = [center top]
		}
		begin
		p = (<players> [<i>])
		getplayerinfo <p> part
		if NOT GotParam \{broken_icons}
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
		endif
		CreateScreenElement {
			Type = SpriteElement
			parent = icon_menu
			dims = (64.0, 64.0)
			texture = <texture>
			rgba = [255 172 64 255]
		}
		<icons_displayed> = (<icons_displayed> + 1)
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	se_setprops \{alpha = 0
		Scale = 0.8
		rgba = [
			255
			172
			0
			0
		]}
	se_setprops \{alpha = 1.0
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
	ScriptAssert \{'hud_message_starpower_ready_style: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script hud_message_flame_style_note_streak 
	hud_message_flame_style {notestreak = 1 highway_num = <Player>}
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
	hud_move_flame_container {Pos = (0.0, -60.0) Scale = (0.5, 0.0) starpower = <starpower> notestreak = <notestreak> highway_num = <highway_num>}
	Wait \{0.3
		Seconds}
	if GotParam \{starpower}
		SoundEvent \{event = star_power_available_gh4}
	endif
	hud_move_flame_container {Scale = (0.9, 1.0) Pos = (0.0, 10.0) time = 0.5 highway_num = <highway_num>}
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
	hud_move_flame_container {Scale = (1.0, 0.0) Pos = (0.0, -40.0) time = 0.2 highway_num = <highway_num>}
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
	hud_move_flame_container {Pos = (0.0, -60.0) Scale = (0.5, 0.0) starpower = <starpower> notestreak = <notestreak> highway_num = <highway_num>}
	Wait \{0.3
		Seconds}
	if GotParam \{starpower}
		SoundEvent \{event = star_power_available_gh4}
	endif
	hud_move_flame_container {Scale = (0.9, 1.0) Pos = (0.0, 10.0) time = 0.5 highway_num = <highway_num>}
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
	hud_move_flame_container {Scale = (1.0, 0.0) Pos = (0.0, -40.0) time = 0.2 highway_num = <highway_num>}
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
