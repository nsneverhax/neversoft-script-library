is_changing_levels = 0

script generic_event_back \{object = 1
		data = {
		}}
	if ($start_edit_character = 1)
		if ($disable_cas_back = 1)
			return
		endif
	endif
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	if GotParam \{menu_music}
		switch <menu_music>
			case On
			SpawnScriptNow \{audio_ui_menu_music_on}
			case OFF
			audio_ui_menu_music_off
			default
			printf \{channel = sfx
				qs(0xf791d105)}
		endswitch
	endif
	if GotParam \{voting_screen}
		audio_ui_play_kill_voting_screen_sfx
	endif
	if GotParam \{no_assert}
		no_assert_flag = {no_assert}
	endif
	if NOT GotParam \{Wait}
		getcallerinfo
		ui_event event = menu_back object = <object> data = <data> <no_assert_flag> line = <line> file = <file> caller = <caller>
	else
		getcallerinfo
		ui_event_wait event = menu_back object = <object> data = <data> <no_assert_flag> line = <line> file = <file> caller = <caller>
	endif
endscript

script generic_event_back_block \{object = 1
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	getcallerinfo
	ui_event_block event = menu_back object = <object> data = <data> line = <line> file = <file> caller = <caller>
endscript

script generic_event_refresh \{object = 1}
	getcallerinfo
	ui_event event = menu_refresh object = <object> line = <line> file = <file> caller = <caller>
endscript

script generic_event_choose \{event = menu_change
		object = 1
		data = {
		}}
	printf \{qs(0x11ff5676)}
	printstruct <...>
	printf \{qs(0x11ff5676)}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	getcallerinfo
	ui_event event = <event> data = <data> object = <object> line = <line> file = <file> caller = <caller>
endscript

script generic_event_replace \{event = menu_replace
		object = 1
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	if NOT GotParam \{no_sound}
		ui_sfx \{menustate = Generic
			uitype = select}
	endif
	getcallerinfo
	ui_event event = <event> data = <data> object = <object> line = <line> file = <file> caller = <caller>
endscript
disable_menu_sounds = 0
