
script savegame_ui_begin 
	savegame_get_ui_id savegame = <savegame>
	if ScreenElementExists id = <ui_id>
		<ui_id> :Die
	endif
	if GotParam \{hide_on_ps3}
		if isps3
			return
		endif
	endif
	change_system_notification_position_temp \{Pos = topleft}
	CreateScreenElement {
		id = <ui_id>
		parent = root_window
		Type = descinterface
		desc = 'savegame_indicator'
		Pos = (0.0, 0.0)
		z_priority = 1000000.0
	}
	<ui_id> :Obj_SpawnScriptNow savegame_ui_icon_anim
	if GotParam \{savegame}
		<ui_id> :savegame_ui_set_gamertag savegame = <savegame>
	else
		<ui_id> :se_setprops gamertag_text = qs(0x00000000)
	endif
	<ui_id> :se_setprops pleasewait_text = $please_dont_turn_off_text
	if GotParam \{text}
		<ui_id> :se_setprops savetext_text = <text>
	endif
	<ui_id> :RemoveTags [Die]
	<ui_id> :Obj_KillSpawnedScript Name = savegame_ui_spawnscript
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
		case fullscreen
		printf 'Changing from %s to %t' s = ($savegame_ui_state) t = <state>
		default
		ScriptAssert 'Invalid state %s' s = <state>
	endswitch
	Change savegame_ui_state = <state>
endscript

script savegame_get_ui_id 
	if ($savegame_ui_state = boot)
		formatText \{checksumName = ui_id
			'savegame_boot_ui'}
	else
		RequireParams \{[
				savegame
			]
			all}
		formatText TextName = temp_savegame '%s' s = <savegame>
		formatText checksumName = ui_id 'savegame%d_ui' d = <temp_savegame>
	endif
	return ui_id = <ui_id>
endscript

script savegame_ui_spawnscript 
	setscriptcannotpause
	begin
	Wait \{1
		gameframe}
	SetTags \{renderedonce = 1}
	if GetSingleTag \{Die}
		printf \{'memcard ui requested to be killed off'}
		break
	endif
	repeat
	if GetSingleTag \{renderedonce}
		if ($savegame_ui_state != boot)
			Wait \{0.2
				Seconds
				ignoreslomo}
		endif
	endif
	Die
	restore_system_notifications_position
endscript

script savegame_ui_icon_anim 
	setscriptcannotpause
	se_setprops \{light_bar_alpha = 0.3}
	se_setprops \{bass_square_alpha = 0.2
		time = 0}
	se_setprops \{drum_square_alpha = 0.2
		time = 0}
	se_setprops \{vocal_square_alpha = 0.2
		time = 0}
	begin
	se_setprops \{guitar_square_alpha = 0.2
		time = 0.1}
	se_setprops \{bass_square_alpha = 1
		time = 0.1}
	se_waitprops
	se_setprops \{bass_square_alpha = 0.2
		time = 0.1}
	se_setprops \{vocal_square_alpha = 1
		time = 0.1}
	se_waitprops
	se_setprops \{vocal_square_alpha = 0.2
		time = 0.1}
	se_setprops \{drum_square_alpha = 1
		time = 0.1}
	se_waitprops
	se_setprops \{drum_square_alpha = 0.2
		time = 0.1}
	se_setprops \{guitar_square_alpha = 1
		time = 0.1}
	se_waitprops
	repeat
endscript

script savegame_ui_set_gamertag 
	RequireParams \{[
			savegame
		]
		all}
	if isXenon
		getlocalgamertag controller = <savegame>
		se_setprops gamertag_text = <gamertag>
	else
		se_setprops \{gamertag_text = qs(0x00000000)}
	endif
endscript

script savegame_ui_end 
	savegame_get_ui_id savegame = <savegame>
	if ScreenElementExists id = <ui_id>
		<ui_id> :SetTags Die = 1
	endif
endscript
