
script savegame_ui_begin \{Type = !q1768515945
		show_mainmenu_bg = 0}
	if NOT GotParam \{no_cleanup_messages}
		memcard_cleanup_messages
	endif
	savegame_get_ui_id savegame = <savegame>
	if ScreenElementExists id = <ui_id>
		<ui_id> :Die
	endif
	if GotParam \{hide_on_ps3}
		if isps3
			return
		endif
	endif
	<screen_offset> = (0.0, 0.0)
	if ($boot_movie_done = 0)
		<screen_offset> = (2000.0, 0.0)
	endif
	switch <Type>
		case dlc_scan
		case network
		CreateScreenElement {
			id = <ui_id>
			parent = root_window
			Type = descinterface
			desc = 'savegame_indicator'
			Pos = <screen_offset>
			z_priority = 1000000.0
		}
		if GotParam \{savegame}
			<ui_id> :savegame_ui_set_gamertag savegame = <savegame>
		else
			<ui_id> :se_setprops gamertag_text = qs(0x00000000)
		endif
		<ui_id> :se_setprops pleasewait_text = $please_dont_turn_off_text
		if GotParam \{text}
			<ui_id> :se_setprops savetext_text = <text>
		endif
		if <ui_id> :desc_resolvealias Name = alias_instrument_spinner param = instrument_spinner
			<instrument_spinner> :Obj_SpawnScriptNow instrument_spinner_ui_icon_anim
		else
			ScriptAssert \{'UI Art'}
		endif
		case loading
		case deleting
		case boot_scan
		case checking
		case saving
		case autosave
		CreateScreenElement {
			id = <ui_id>
			parent = root_window
			Type = descinterface
			desc = 'autosave_icon'
			Pos = <screen_offset>
			z_priority = 1000000.0
		}
		<ui_id> :Obj_SpawnScriptNow autosave_spinner_ui_icon_anim
		default
		ScriptAssert 'Unknown savegame_ui type %t' t = <Type>
	endswitch
	if (<show_mainmenu_bg> = 1)
		create_mainmenu_bg
	endif
	<ui_id> :SetTags show_mainmenu_bg = <show_mainmenu_bg>
	if ($boot_movie_done = 0)
		KillSpawnedScript \{Name = savegame_ui_switch_in_after_movie}
		SpawnScriptNow savegame_ui_switch_in_after_movie params = <...>
	endif
	<ui_id> :RemoveTags [delay_ui_destroy_time]
	<ui_id> :Obj_KillSpawnedScript Name = savegame_ui_delayed_death_script
	<ui_id> :Obj_SpawnScriptNow savegame_ui_delayed_death_script params = {savegame = <savegame>}
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
		formatText \{checksumName = ui_id
			'savegame_corner_thing_ui'}
	endif
	return ui_id = <ui_id>
endscript

script savegame_ui_delayed_death_script 
	setscriptcannotpause
	begin
	Wait \{1
		gameframe}
	SetTags \{renderedonce = 1}
	if GetSingleTag \{delay_ui_destroy_time}
		printf \{'memcard ui requested to be killed off'}
		break
	endif
	repeat
	if GetSingleTag \{renderedonce}
		if ($savegame_ui_state != boot)
			Wait <delay_ui_destroy_time> Seconds ignoreslomo
		endif
	endif
	Die
endscript

script savegame_ui_switch_in_after_movie 
	setscriptcannotpause
	begin
	if ($boot_movie_done = 1)
		printf \{'boot movie done!'}
		savegame_ui_end \{destroy_switch_script = 0}
		savegame_ui_begin {
			<...>
			show_mainmenu_bg = 1
		}
		GetTrueStartTime
		Change g_long_dlc_scan_at_boot_start_time = <starttime>
		Change \{g_long_dlc_scan_at_boot = 1}
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script instrument_spinner_ui_icon_anim 
	<i> = 0
	begin
	se_setprops rot_angle = (-1 * <i>)
	begin
	i = (<i> -90)
	se_setprops rot_angle = (-1 * <i>) time = 0.25 anim = linear
	se_waitprops
	repeat 4
	i = (<i> + 360)
	repeat
endscript

script autosave_spinner_ui_icon_anim 
	setscriptcannotpause
	se_setprops \{light_bar_alpha = 0.3}
	se_setprops \{bass_square_alpha = 0.2
		time = 0}
	se_setprops \{drum_square_alpha = 0.2
		time = 0}
	se_setprops \{vocal_square_alpha = 0.2
		time = 0}
	begin
	se_setprops \{guitar_square_alpha = 0.4
		time = 0.1}
	se_setprops \{bass_square_alpha = 1
		time = 0.1}
	se_waitprops
	se_setprops \{bass_square_alpha = 0.4
		time = 0.1}
	se_setprops \{vocal_square_alpha = 1
		time = 0.1}
	se_waitprops
	se_setprops \{vocal_square_alpha = 0.4
		time = 0.1}
	se_setprops \{drum_square_alpha = 1
		time = 0.1}
	se_waitprops
	se_setprops \{drum_square_alpha = 0.4
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
	if CD
		se_setprops \{gamertag_text = qs(0x00000000)}
	else
		if isxenonorwindx
			getlocalgamertag controller = <savegame>
			se_setprops gamertag_text = (qs(0x505ed5ba) + <gamertag>)
		else
			se_setprops \{gamertag_text = qs(0x00000000)}
		endif
	endif
endscript

script savegame_ui_end \{destroy_switch_script = 1}
	savegame_get_ui_id savegame = <savegame>
	if (<destroy_switch_script> = 1)
		KillSpawnedScript \{Name = savegame_ui_switch_in_after_movie}
	endif
	if ScreenElementExists id = <ui_id>
		if GotParam \{delay_ui_destroy_time}
			<ui_id> :SetTags delay_ui_destroy_time = <delay_ui_destroy_time>
		else
			<ui_id> :GetSingleTag show_mainmenu_bg
			if (<show_mainmenu_bg> = 1)
				destroy_mainmenu_bg
			endif
			if <ui_id> :GetSingleTag delay_ui_destroy_time
				return
			endif
			<ui_id> :Die
		endif
	endif
endscript
