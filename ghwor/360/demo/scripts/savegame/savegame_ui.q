
script savegame_ui_begin \{type = !q1768515945
		show_mainmenu_bg = 0}
	if NOT gotparam \{no_cleanup_messages}
		memcard_cleanup_messages
	endif
	savegame_get_ui_id savegame = <savegame>
	if screenelementexists id = <ui_id>
		<ui_id> :die
	endif
	if gotparam \{hide_on_ps3}
		if isps3
			return
		endif
	endif
	<screen_offset> = (0.0, 0.0)
	if ($boot_movie_done = 0)
		<screen_offset> = (2000.0, 0.0)
	endif
	switch <type>
		case dlc_scan
		case network
		createscreenelement {
			id = <ui_id>
			parent = root_window
			type = descinterface
			desc = 'savegame_indicator'
			pos = <screen_offset>
			z_priority = 1000000.0
		}
		if gotparam \{savegame}
			<ui_id> :savegame_ui_set_gamertag savegame = <savegame>
		else
			<ui_id> :se_setprops gamertag_text = qs(0x00000000)
		endif
		<ui_id> :se_setprops pleasewait_text = $please_dont_turn_off_text
		if gotparam \{text}
			<ui_id> :se_setprops savetext_text = <text>
		endif
		if <ui_id> :desc_resolvealias name = alias_instrument_spinner param = instrument_spinner
			<instrument_spinner> :obj_spawnscriptnow instrument_spinner_ui_icon_anim
		else
			scriptassert \{'UI Art'}
		endif
		case loading
		case deleting
		case boot_scan
		case checking
		case saving
		case autosave
		createscreenelement {
			id = <ui_id>
			parent = root_window
			type = descinterface
			desc = 'autosave_icon'
			pos = <screen_offset>
			z_priority = 1000000.0
		}
		<ui_id> :obj_spawnscriptnow autosave_spinner_ui_icon_anim
		default
		scriptassert 'Unknown savegame_ui type %t' t = <type>
	endswitch
	if (<show_mainmenu_bg> = 1)
		create_mainmenu_bg
	endif
	<ui_id> :settags show_mainmenu_bg = <show_mainmenu_bg>
	if ($boot_movie_done = 0)
		killspawnedscript \{name = savegame_ui_switch_in_after_movie}
		spawnscriptnow savegame_ui_switch_in_after_movie params = <...>
	endif
	<ui_id> :removetags [delay_ui_destroy_time]
	<ui_id> :obj_killspawnedscript name = savegame_ui_delayed_death_script
	<ui_id> :obj_spawnscriptnow savegame_ui_delayed_death_script params = {savegame = <savegame>}
endscript

script savegame_set_ui_state 
	requireparams \{[
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
		scriptassert 'Invalid state %s' s = <state>
	endswitch
	change savegame_ui_state = <state>
endscript

script savegame_get_ui_id 
	if ($savegame_ui_state = boot)
		formattext \{checksumname = ui_id
			'savegame_boot_ui'}
	else
		formattext \{checksumname = ui_id
			'savegame_corner_thing_ui'}
	endif
	return ui_id = <ui_id>
endscript

script savegame_ui_delayed_death_script 
	setscriptcannotpause
	begin
	wait \{1
		gameframe}
	settags \{renderedonce = 1}
	if getsingletag \{delay_ui_destroy_time}
		printf \{'memcard ui requested to be killed off'}
		break
	endif
	repeat
	if getsingletag \{renderedonce}
		if ($savegame_ui_state != boot)
			wait <delay_ui_destroy_time> seconds ignoreslomo
		endif
	endif
	die
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
		gettruestarttime
		change g_long_dlc_scan_at_boot_start_time = <starttime>
		change \{g_long_dlc_scan_at_boot = 1}
		return
	endif
	wait \{1
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
	requireparams \{[
			savegame
		]
		all}
	if cd
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
		killspawnedscript \{name = savegame_ui_switch_in_after_movie}
	endif
	if screenelementexists id = <ui_id>
		if gotparam \{delay_ui_destroy_time}
			<ui_id> :settags delay_ui_destroy_time = <delay_ui_destroy_time>
		else
			<ui_id> :getsingletag show_mainmenu_bg
			if (<show_mainmenu_bg> = 1)
				destroy_mainmenu_bg
			endif
			if <ui_id> :getsingletag delay_ui_destroy_time
				return
			endif
			<ui_id> :die
		endif
	endif
endscript
