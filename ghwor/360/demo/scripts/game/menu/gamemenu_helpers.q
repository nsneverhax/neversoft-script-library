is_changing_levels = 0

script generic_menu_pad_back 
	printf \{qs(0xd7d7f670)}
	if gotparam \{callback}
		<callback> <...>
	endif
endscript

script generic_event_back \{object = 1
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	if gotparam \{menu_music}
		switch <menu_music>
			case on
			spawnscriptnow \{audio_ui_menu_music_on}
			case off
			audio_ui_menu_music_off
			default
			printf \{channel = sfx
				qs(0xf791d105)}
		endswitch
	endif
	if gotparam \{voting_screen}
		audio_ui_play_kill_voting_screen_sfx
	endif
	if gotparam \{no_assert}
		no_assert_flag = {no_assert}
	endif
	ui_event event = menu_back object = <object> data = <data> <no_assert_flag>
endscript

script generic_event_back_block \{object = 1
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	ui_event_block event = menu_back object = <object> data = <data>
endscript

script generic_event_back_refresh \{object = 1
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	ui_event event = menu_back object = <object> data = {refresh_previous_state <data>}
endscript

script generic_event_refresh \{object = 1}
	ui_event event = menu_refresh object = <object>
endscript

script generic_event_choose \{event = menu_change
		object = 1
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	ui_event event = <event> data = <data> object = <object>
endscript

script generic_event_replace \{event = menu_replace
		object = 1
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	ui_event event = <event> data = <data> object = <object>
endscript
disable_menu_sounds = 0

script screenelement_get_tags 
	requireparams \{[
			id
		]
		all}
	<id> :gettags
	removeparameter \{id}
	return {tags = <...>}
endscript
