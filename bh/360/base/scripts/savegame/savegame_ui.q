
script savegame_ui_begin 
	if NOT GotParam \{no_cleanup_messages}
		memcard_cleanup_messages
	endif
	savegame_get_ui_id savegame = <savegame>
	if ScreenElementExists id = <ui_id>
		<ui_id> :Die
	endif
	if GotParam \{hide_on_ps3}
		if IsPS3
			return
		endif
	endif
	screen_offset = (0.0, 0.0)
	if ($boot_movie_done = 0)
		screen_offset = (-560.0, 0.0)
	endif
	CreateScreenElement {
		id = <ui_id>
		parent = root_window
		type = DescInterface
		desc = 'savegame_indicator'
		Pos = <screen_offset>
		z_priority = 1000000.0
	}
	<ui_id> :Obj_SpawnScriptNow savegame_ui_icon_anim
	if GotParam \{savegame}
		<ui_id> :savegame_ui_set_gamertag savegame = <savegame>
	else
		<ui_id> :SE_SetProps GamerTag_text = qs(0x00000000)
	endif
	<ui_id> :SE_SetProps pleaseWait_text = $please_dont_turn_off_text
	if GotParam \{text}
		<ui_id> :SE_SetProps saveText_text = <text>
	endif
	<ui_id> :RemoveTags [Die]
	<ui_id> :Obj_KillSpawnedScript name = savegame_ui_spawnscript
	<ui_id> :Obj_SpawnScriptNow savegame_ui_spawnscript params = {savegame = <savegame>}
endscript

script savegame_set_ui_state 
	RequireParams \{[
			state
		]
		all}
	printscriptinfo 'savegame_ui_state %s' s = <state>
	switch <state>
		case boot
		case lobby
		case fullScreen
		printf 'Changing from %s to %t' s = ($savegame_ui_state) t = <state>
		default
		ScriptAssert 'Invalid state %s' s = <state>
	endswitch
	Change savegame_ui_state = <state>
endscript

script savegame_get_ui_id 
	if ($savegame_ui_state = boot)
		FormatText \{checksumname = ui_id
			'savegame_boot_ui'}
	else
		RequireParams \{[
				savegame
			]
			all}
		FormatText checksumname = ui_id 'savegame%d_ui' d = <savegame>
	endif
	return ui_id = <ui_id>
endscript

script savegame_ui_spawnscript 
	SetScriptCannotPause
	begin
	wait \{1
		gameframe}
	SetTags \{renderedOnce = 1}
	if GetSingleTag \{Die}
		printf \{'memcard ui requested to be killed off'}
		break
	endif
	repeat
	if GetSingleTag \{renderedOnce}
		if ($savegame_ui_state != boot)
			wait \{0.2
				seconds
				ignoreslomo}
		endif
	endif
	Die
endscript

script savegame_ui_icon_anim 
	SetScriptCannotPause
	SE_SetProps \{light_bar_alpha = 0.3}
	SE_SetProps \{bass_square_alpha = 0.2
		time = 0}
	SE_SetProps \{drum_square_alpha = 0.2
		time = 0}
	SE_SetProps \{vocal_square_alpha = 0.2
		time = 0}
	begin
	SE_SetProps \{guitar_square_alpha = 0.2
		time = 0.1}
	SE_SetProps \{bass_square_alpha = 1
		time = 0.1}
	SE_WaitProps
	SE_SetProps \{bass_square_alpha = 0.2
		time = 0.1}
	SE_SetProps \{vocal_square_alpha = 1
		time = 0.1}
	SE_WaitProps
	SE_SetProps \{vocal_square_alpha = 0.2
		time = 0.1}
	SE_SetProps \{drum_square_alpha = 1
		time = 0.1}
	SE_WaitProps
	SE_SetProps \{drum_square_alpha = 0.2
		time = 0.1}
	SE_SetProps \{guitar_square_alpha = 1
		time = 0.1}
	SE_WaitProps
	repeat
endscript

script savegame_ui_set_gamertag 
	RequireParams \{[
			savegame
		]
		all}
	if RetailBuild
		SE_SetProps \{GamerTag_text = qs(0x00000000)}
	else
		if IsXenonOrWinDX
			GetLocalGamerTag controller = <savegame>
			SE_SetProps GamerTag_text = (qs(0x505ed5ba) + <GamerTag>)
		else
			SE_SetProps \{GamerTag_text = qs(0x00000000)}
		endif
	endif
endscript

script savegame_ui_end 
	savegame_get_ui_id savegame = <savegame>
	if ScreenElementExists id = <ui_id>
		<ui_id> :SetTags Die = 1
	endif
endscript
