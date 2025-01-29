
script hud_create_message \{Priority = 0
		style_script = hud_message_wait_and_die
		font = fontgrid_title_a1}
	if NOT ScreenElementExists \{id = hud_root}
		return
	endif
	if GotParam \{post_on_highway}
		RequireParams \{[
				player
			]
			all}
		get_highway_hud_message_parent player = <player>
	else
		if NOT GotParam \{Band}
			RequireParams \{[
					player
				]
				all}
			if GotParam \{text}
				FormatText TextName = t1 qs(0x57adb0e0) p = <player> t = <text>
				text = <t1>
			endif
		endif
		if NOT hud_root :Desc_ResolveAlias \{name = alias_message_container
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
	DestroyScreenElement id = <message_parent> preserve_parent
	GetScreenElementDims id = <message_parent>
	<dims> = ((<width> * (1.0, 0.0)) + (<height> * (0.0, 1.0)))
	CreateScreenElement {
		parent = <message_parent>
		type = TextBlockElement
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
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		allow_expansion
		tags = {message_priority = <Priority>}
		enable_min_scale = false
	}
	RunScriptOnScreenElement id = <id> <style_script> params = <style_script_params>
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
	SE_SetProps \{alpha = 0}
	SE_SetProps \{alpha = 1.0
		time = 0.1}
	SE_WaitProps
	wait \{2
		seconds
		ignoreslomo}
	Die
endscript

script hud_message_band_streak_style 
	Obj_GetID
	num_players = 0
	GetArraySize <players>
	num_players = <array_size>
	<i> = 0
	<icons_displayed> = 0
	if (<array_size> > 0)
		GetScreenElementDims id = <objID>
		<dims> = ((<width> * (1.0, 0.0)) + (<height> * (0.0, 1.0)))
		CreateScreenElement {
			type = HMenu
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
		GetPlayerInfo <p> part
		if NOT GotParam \{broken_icons}
			switch <part>
				case vocals
				texture = mixer_icon_vox
				case bass
				texture = mixer_icon_bass
				case Drum
				texture = mixer_icon_drums
				case guitar
				default
				texture = mixer_icon_guitar
			endswitch
			rgba = [255 172 64 255]
		else
			switch <part>
				case vocals
				texture = band_HUD_microphone2
				case bass
				texture = band_hud_bass2
				case Drum
				texture = band_hud_drums2
				case guitar
				default
				texture = band_HUD_guitar2
			endswitch
			rgba = ($vocals_hud_glow_rgba [(<p> -1)])
		endif
		CreateScreenElement {
			type = SpriteElement
			parent = icon_menu
			dims = (64.0, 64.0)
			texture = <texture>
			rgba = <rgba>
		}
		<icons_displayed> = (<icons_displayed> + 1)
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	SE_SetProps \{alpha = 0
		scale = 0.8
		rgba = [
			255
			172
			0
			0
		]}
	SE_SetProps \{alpha = 1.0
		rgba = [
			255
			255
			255
			255
		]
		time = 0.5}
	SE_WaitProps
	wait \{2
		seconds
		ignoreslomo}
	SE_SetProps \{alpha = 0.0
		scale = 1.1
		rgba = [
			255
			172
			0
			0
		]
		time = 0.5}
	SE_WaitProps
	Die
endscript

script hud_message_starpower_ready_style 
	SE_SetProps \{rgba = [
			145
			215
			235
			250
		]
		alpha = 0}
	SoundEvent \{event = Star_Power_Available_GH4}
	SE_SetProps \{alpha = 1.0
		time = 0.1}
	SE_WaitProps
	wait \{2
		seconds
		ignoreslomo}
	Die
endscript

script hud_message_flame_style_note_streak 
	hud_message_flame_style {notestreak = 1 highway_num = <player>}
endscript

script hud_message_flame_style_starpower_ready 
	hud_message_flame_style2 {StarPower = 1 highway_num = <highway_num>}
endscript

script hud_message_flame_style 
	SE_SetProps \{alpha = 0
		scale = (0.5, 0.5)
		z_priority = 0.01
		Pos = (0.0, 70.0)
		rgba = [
			255
			128
			64
			0
		]}
	HUD_move_flame_container {Pos = (0.0, -60.0) scale = (0.5, 0.0) StarPower = <StarPower> notestreak = <notestreak> highway_num = <highway_num>}
	wait \{0.3
		seconds}
	if GotParam \{StarPower}
		SoundEvent \{event = Star_Power_Available_GH4}
	endif
	HUD_move_flame_container {scale = (0.9, 1.0) Pos = (0.0, 10.0) time = 0.5 highway_num = <highway_num>}
	SE_SetProps \{alpha = 1
		scale = (0.5, 0.5)
		rgba = [
			255
			128
			0
			255
		]
		Pos = (0.0, 70.0)
		time = 0.1}
	wait \{0.1
		seconds}
	SE_SetProps \{alpha = 1
		scale = (0.75, 0.75)
		Pos = (0.0, 0.0)
		rgba = [
			255
			200
			64
			255
		]
		time = 0.5}
	wait \{0.75
		seconds}
	HUD_move_flame_container {scale = (1.0, 0.0) Pos = (0.0, -40.0) time = 0.2 highway_num = <highway_num>}
	SE_SetProps \{alpha = 0
		scale = (0.78999996, 0.78999996)
		Pos = (0.0, 0.0)
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
	Die
endscript

script hud_message_flame_style2 
	SE_SetProps \{alpha = 0
		scale = (0.5, 0.5)
		z_priority = 0.01
		Pos = (0.0, 70.0)
		rgba = [
			0
			255
			255
			0
		]}
	HUD_move_flame_container {Pos = (0.0, -60.0) scale = (0.5, 0.0) StarPower = <StarPower> notestreak = <notestreak> highway_num = <highway_num>}
	wait \{0.3
		seconds}
	if GotParam \{StarPower}
		SoundEvent \{event = Star_Power_Available_GH4}
	endif
	HUD_move_flame_container {scale = (0.9, 1.0) Pos = (0.0, 10.0) time = 0.5 highway_num = <highway_num>}
	SE_SetProps \{alpha = 1
		scale = (0.5, 0.5)
		rgba = [
			0
			255
			255
			255
		]
		Pos = (0.0, 70.0)
		time = 0.1}
	wait \{0.1
		seconds}
	SE_SetProps \{alpha = 1
		scale = (0.75, 0.75)
		Pos = (0.0, 0.0)
		rgba = [
			255
			255
			255
			255
		]
		time = 0.5}
	wait \{0.75
		seconds}
	HUD_move_flame_container {scale = (1.0, 0.0) Pos = (0.0, -40.0) time = 0.2 highway_num = <highway_num>}
	SE_SetProps \{alpha = 0
		scale = (0.78999996, 0.78999996)
		Pos = (0.0, 0.0)
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
	Die
endscript
