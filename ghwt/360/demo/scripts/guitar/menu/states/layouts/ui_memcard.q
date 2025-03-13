ps3_autosave_warning_shown = 0
memcard_initial_boot = 0
memcard_state_active = 0

script ui_init_memcard 
	memcard_controller_reset
	if (<type> = autosave)
		if gotparam \{event_params}
			if structurecontains structure = <event_params> data
				if structurecontains structure = (<event_params>.data) requested_autosave
					requested_autosave = (<event_params>.data.requested_autosave)
				endif
			endif
		endif
		stars
		if isps3
			printf \{'Regular PS3 save'}
			memcard_controller_add controller = ($primary_controller) requested_autosave = <requested_autosave>
		else
			if gotparam \{event_params}
				if structurecontains structure = <event_params> data
					if structurecontains structure = (<event_params>.data) savegame
						printf 'Saving specific savegame %d' d = ((<event_params>.data).savegame)
						memcard_controller_add controller = ((<event_params>.data).savegame) requested_autosave = <requested_autosave>
						done_something = 1
					elseif structurecontains structure = (<event_params>.data) all_active_players
						memcard_controller_add_signed_in_and_valid
						done_something = 1
					endif
				endif
			endif
			if NOT gotparam \{done_something}
				printf 'Saving primary controller %d' d = ($primary_controller)
				memcard_controller_add controller = ($primary_controller)
			endif
		endif
		stars
	endif
endscript
memcard_after_func = none

script ui_create_memcard \{event_params = {
			event = menu_back
		}}
	change \{memcard_state_active = 1}
	if ($is_network_game = 1)
		original_type = <type>
		gamemode_gettype
		if (<type> = career)
			spawn_player_drop_listeners \{drop_player_script = net_career_memcard_drop_player
				end_game_script = net_career_memcard_end_game}
		endif
		type = <original_type>
	endif
	startrendering
	createscreenelement {
		type = containerelement
		parent = root_window
		id = current_menu
		pos = (0.0, 0.0)
		just = [left center]
		z_priority = 0
		tags = {
			type = <type>
			event_params = <event_params>
			signin_changed = ($respond_to_signin_changed)
		}
	}
	change \{respond_to_signin_changed = 1}
	switch <type>
		case boot
		change \{memcard_initial_boot = 1}
		if isxenon
			if netsessionfunc \{func = xenonisguest
					params = {
						controller_index = $primary_controller
					}}
				call = memcard_guest_profile_warning
			else
				call = memcard_sequence_begin_bootup
			endif
		else
			call = memcard_sequence_begin_bootup
		endif
		storageselectorforce = 1
		case autosave
		call = memcard_sequence_begin_autosave
		requested_autosave = 0
		if gotparam \{event_params}
			if structurecontains \{structure = event_params
					data}
				requested_autosave = (<event_params>.data.requested_autosave)
			endif
		endif
		case autoload
		call = memcard_sequence_begin_autoload
		case save
		call = memcard_sequence_begin_save
		case load
		call = memcard_sequence_begin_load
		case save_jam
		call = memcard_sequence_begin_save_jam
		case load_jam
		call = memcard_sequence_begin_load_jam
		case delete_jam
		call = memcard_sequence_begin_delete_jam
		case rename_jam
		call = memcard_sequence_begin_rename_jam
		case secondary_signin_load
		scriptassert \{qs(0x2c2b1078)}
		call = memcard_sequence_begin_ss_load
		default
		scriptassert 'invalid type: %t' t = <type>
	endswitch
	if (<type> = autosave)
		if NOT memcard_controller_get_next
			ui_event_wait <event_params>
			return
		endif
	endif
	if isxenon
		if netsessionfunc func = xenonisguest params = {controller_index = <controller>}
			printf 'Controller %d is guest, aborting memcard' d = <controller>
			ui_event_wait <event_params>
			return
		endif
		if NOT checkforsignin local controller_index = <controller>
			printf 'Controller %d not signed in, aborting' d = <controller>
			ui_event_wait <event_params>
			return
		endif
	endif
	if isps3
		if is_autosave_on \{savegame = 0}
			if ($ps3_autosave_warning_shown = 0)
				change \{ps3_autosave_warning_shown = 1}
				do_ps3_memcard_warning func = <call> func_params = <...>
				return
			endif
		endif
	endif
	<call> <...>
endscript

script ui_destroy_memcard 
	if screenelementexists \{id = current_menu}
		current_menu :die
	endif
	spawnscriptnow \{memcard_sequence_cleanup_generic}
	change \{memcard_state_active = 0}
endscript

script ui_deinit_memcard 
	ui_options_audio_set_dolby_digital
	update_all_volumes
	change \{memcard_initial_boot = 0}
endscript

script ui_memcard_finish 
	ui_event_get_stack
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	current_menu :gettags
	if NOT (<type> = boot)
		change respond_to_signin_changed = <signin_changed>
	endif
	if (<type> = autosave)
		if memcard_controller_has_next
			mc_waitasyncopsfinished
			memcard_cleanup_messages
			if screenelementexists \{id = current_menu}
				current_menu :die
			endif
			ui_create_memcard {
				controller = <controller>
				type = <type>
				event_params = <event_params>
			}
			return
		endif
	endif
	switch <type>
		case boot
		if gotparam \{success}
			if current_band_has_band_name controller = <controller>
				ui_event_wait event = menu_replace data = {state = uistate_boot_download_scan controller = <controller>}
			else
				ui_event_wait \{event = menu_replace
					data = {
						state = uistate_band_name_logo
						from_boot = 1
						do_not_hide = 1
					}}
			endif
		elseif gotparam \{failed}
			ui_event_wait \{event = menu_replace
				data = {
					state = uistate_band_name_logo
					from_boot = 1
					do_not_hide = 1
				}}
		endif
		case autosave
		if scriptisrunning \{handle_signin_changed}
			mark_safe_for_shutdown
			return
		endif
		if gotparam \{event_params}
			if structurecontains structure = <event_params> data
				if structurecontains structure = (<event_params>.data) pass_to_gigboard
					create_loading_screen \{destroy_state = 'gig_posters'}
				endif
			endif
		endif
		if gotparam \{success}
			ui_event_wait <event_params>
		elseif gotparam \{failed}
			ui_event_wait <event_params>
		endif
		case autoload
		if gotparam \{success}
			if current_band_has_band_name controller = <controller>
				ui_event_wait event = menu_replace data = {state = uistate_boot_download_scan event_params = <event_params> controller = <controller>}
			else
				ui_event_wait event = menu_replace data = {state = uistate_band_name_logo event_params = <event_params> from_save = 1 controller = <controller>}
			endif
		elseif gotparam \{failed}
			ui_event_wait <event_params>
		endif
		case save
		if gotparam \{success}
			ui_event_wait <event_params>
		elseif gotparam \{failed}
			ui_event_wait <event_params>
		endif
		case load
		if gotparam \{success}
			ui_event_wait <event_params>
		elseif gotparam \{failed}
			ui_event_wait \{event = menu_back}
		endif
		case save_jam
		if gotparam \{success}
			ui_event <event_params>
		elseif gotparam \{failed}
			ui_event <event_params>
		endif
		case load_jam
		if gotparam \{success}
			ui_event <event_params>
		elseif gotparam \{failed}
			ui_event \{event = menu_back}
		endif
		case delete_jam
		if gotparam \{success}
			ui_event <event_params>
		elseif gotparam \{failed}
			ui_event \{event = menu_back}
		endif
		case rename_jam
		if gotparam \{success}
			ui_event <event_params>
		elseif gotparam \{failed}
			ui_event \{event = menu_back}
		endif
		case secondary_signin_load
		scriptassert \{qs(0x2c2b1078)}
		if gotparam \{success}
			ui_event_wait <event_params>
		elseif gotparam \{failed}
			ui_event_wait \{event = menu_back}
		endif
	endswitch
	if ($memcard_after_func != none)
		if gotparam \{success}
			($memcard_after_func) success
		elseif gotparam \{failed}
			($memcard_after_func) failed
		else
			scriptassert \{'Yeah, something is wrong'}
		endif
		change \{memcard_after_func = none}
	endif
endscript

script ui_memcard_autosave \{event = menu_back
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose no_sound state = uistate_memcard data = {type = autosave event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_autosave_replace \{event = menu_back
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	ui_event event = menu_replace data = {state = uistate_memcard type = autosave event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_autoload \{this_event = menu_change
		event = menu_replace
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose no_sound event = <this_event> state = uistate_memcard data = {type = autoload event_params = {event = <event> data = <data>} controller = <controller>}
endscript

script ui_memcard_save \{event = menu_replace
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {type = save event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_load \{this_event = menu_change
		event = menu_replace
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose event = <this_event> state = uistate_memcard data = {type = load event_params = {event = <event> data = <data>}}
endscript
jam_memcard_signin_save_after_func = none

script jam_memcard_signin_load_after_func 
	change \{memcard_after_func = $jam_memcard_signin_save_after_func}
endscript

script ui_memcard_save_jam \{event = menu_replace
		data = {
		}}
	if isxenon
		if NOT checkforsignin local controller_index = <controller>
			change \{jam_memcard_signin_save_after_func = $memcard_after_func}
			change \{memcard_after_func = jam_memcard_signin_load_after_func}
			generic_event_choose {
				state = uistate_signin
				data = {
					no_sound
					new_state = uistate_memcard
					new_data = {
						type = save_jam
						event_params = {
							event = <event>
							data = <data>
						}
					}
				}
			}
			return
		endif
	endif
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose no_sound state = uistate_memcard data = {type = save_jam event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_rename_jam \{event = menu_replace
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {type = rename_jam event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_delete_jam \{event = menu_replace
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {type = delete_jam event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_secondary_siginin_load \{event = menu_replace
		data = {
		}}
	scriptassert \{qs(0x2c2b1078)}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {type = secondary_signin_load event_params = {event = <event> data = <data>}}
endscript
memcard_controller_iterator = 0
memcard_controller_list = [
]

script memcard_controller_reset 
	change \{memcard_controller_iterator = 0}
	change \{memcard_controller_list = [
		]}
endscript

script memcard_controller_add \{requested_autosave = 0}
	if isxenon
		if NOT checkforsignin local controller_index = <controller>
			printf qs(0x637aadd2) d = <controller>
			return
		endif
		if netsessionfunc func = xenonisguest params = {controller_index = <controller>}
			printf qs(0xb916c871) d = <controller>
			return
		endif
	endif
	get_savegame_from_controller controller = <controller>
	getglobaltags savegame = <savegame> user_options
	if (<requested_autosave> = 0)
		if (<autosave> = 0)
			printf qs(0xee8ab3f5) i = <controller>
			return
		endif
	endif
	if NOT arraycontains array = $memcard_controller_list contains = <controller>
		addarrayelement array = $memcard_controller_list element = <controller>
		change memcard_controller_list = <array>
	endif
endscript

script memcard_controller_add_signed_in_and_valid 
	memcard_controller_add controller = ($primary_controller)
	printf 'memcard_controller_add_signed_in_and_valid - Saving %d' d = ($primary_controller)
	if isxenon
		gamemode_getnumplayersshown
		if (($current_num_players) > 0)
			i = 0
			begin
			formattext checksumname = player_status 'player%d_status' d = (<i> + 1)
			controller = ($<player_status>.controller)
			getsavegamefromcontroller controller = <controller>
			if checkforsignin local controller_index = <savegame>
				printf 'memcard_controller_add_signed_in_and_valid - Saving %d' d = <savegame>
				memcard_controller_add controller = <savegame>
			endif
			i = (<i> + 1)
			repeat <num_players_shown>
		endif
	endif
endscript

script memcard_controller_has_next 
	getarraysize \{$memcard_controller_list}
	if ($memcard_controller_iterator < <array_size>)
		return \{true}
	endif
	return \{false}
endscript

script memcard_controller_get_next 
	getarraysize \{$memcard_controller_list}
	if ($memcard_controller_iterator < <array_size>)
		ctl = ($memcard_controller_list [($memcard_controller_iterator)])
		change memcard_controller_iterator = ($memcard_controller_iterator + 1)
		return true controller = <ctl>
	endif
	return \{false}
endscript

script memcard_guest_profile_warning 
	change \{memcarddonescript = memcard_sequence_generic_done}
	<options_array> = [
		{
			func = {signin_warning_select_signin params = {allow_back = 1}}
			text = qs(0x17df5913)
		}
		{
			func = memcard_disable_saves_and_quit
			text = qs(0x06d0b6b0)
		}
		{
			func = {generic_event_replace params = {state = uistate_boot_iis}}
			text = qs(0xf7723015)
		}
	]
	create_popup_warning_menu {
		textblock = {
			text = qs(0xe6d4cc00)
			pos = (640.0, 380.0)
			scale = 0.6
		}
		player_device = ($primary_controller)
		menu_pos = (640.0, 465.0)
		dialog_pos = (640.0, 455.0)
		options = <options_array>
	}
endscript
