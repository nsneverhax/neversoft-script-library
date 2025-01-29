
script savegame_ui_begin 
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
	CreateScreenElement {
		id = <ui_id>
		parent = root_window
		Type = descinterface
		desc = 'autosave_icon'
		Pos = <screen_offset>
		z_priority = 1000000.0
	}
	<ui_id> :Obj_SpawnScriptNow autosave_spinner_ui_icon_anim
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

script spawn_instrument_spinner_ui_icon \{parent = dialog_box_container}
	if NOT ScreenElementExists \{id = instrument_spinner_icon}
		CreateScreenElement {
			Type = descinterface
			desc = 'instrument_spinner'
			parent = <parent>
			id = instrument_spinner_icon
			Pos = (640.0, 492.0)
			just = [center center]
			z_priority = 200001
			autosizedims = true
		}
		instrument_spinner_icon :Obj_SpawnScriptNow \{instrument_spinner_ui_icon_anim}
	endif
endscript

script spawn_autosave_ui_icon \{parent = dialog_box_container}
	if NOT ScreenElementExists \{id = instrument_spinner_icon}
		CreateScreenElement {
			Type = descinterface
			desc = 'autosave_icon'
			parent = <parent>
			id = autosave_icon
			Pos = (640.0, 492.0)
			just = [center center]
			z_priority = 200001
			autosizedims = true
		}
		autosave_icon :Obj_SpawnScriptNow \{autosave_spinner_ui_icon_anim}
	endif
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

script savegame_ui_end 
	savegame_get_ui_id savegame = <savegame>
	if ScreenElementExists id = <ui_id>
		if GotParam \{delay_ui_destroy_time}
			<ui_id> :SetTags delay_ui_destroy_time = <delay_ui_destroy_time>
		else
			if <ui_id> :GetSingleTag delay_ui_destroy_time
				return
			endif
			<ui_id> :Die
		endif
	endif
endscript

script wii_savegame_ui_end_because_sd_eject 
	displaynotification ($cntsd_messages.rvlcntsd_message_0017b) high_priority
endscript
