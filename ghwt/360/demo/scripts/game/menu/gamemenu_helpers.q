default_font_colors = [
	[
		200
		200
		200
		255
	]
	[
		180
		80
		80
		255
	]
	[
		80
		120
		180
		255
	]
	[
		80
		180
		120
		255
	]
	[
		180
		140
		60
		255
	]
	[
		200
		100
		40
		255
	]
	[
		140
		100
		180
		255
	]
	[
		0
		180
		180
		255
	]
	[
		0
		0
		0
		255
	]
	[
		40
		40
		40
		255
	]
	[
		90
		90
		90
		255
	]
	[
		140
		140
		140
		255
	]
	[
		190
		150
		110
		255
	]
]
is_changing_levels = 0

script generic_menu_pad_back 
	printf \{qs(0xd7d7f670)}
	generic_menu_pad_back_sound
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
	if NOT gotparam \{nosound}
		generic_menu_pad_back_sound
	endif
	ui_event event = menu_back object = <object> data = <data>
endscript

script generic_event_back_block \{object = 1
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	if NOT gotparam \{nosound}
		generic_menu_pad_back_sound
	endif
	ui_event_block event = menu_back object = <object> data = <data>
endscript

script generic_event_back_refresh \{object = 1
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	if NOT gotparam \{no_sound}
		generic_menu_pad_back_sound
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
	if NOT gotparam \{no_sound}
		generic_menu_pad_choose_sound
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
	if NOT gotparam \{no_sound}
		generic_menu_pad_choose_sound
	endif
	ui_event event = <event> data = <data> object = <object>
endscript

script generic_menu_pad_back_sound 
	soundevent \{event = generic_menu_back_sfx}
endscript

script generic_menu_pad_choose_sound 
	soundevent \{event = ui_sfx_select}
endscript
disable_menu_sounds = 0

script generic_menu_up_or_down_sound \{menu_id = current_menu}
	if ($disable_menu_sounds = 0)
		if gotparam \{down}
			soundevent \{event = ui_sfx_scroll_down}
		else
			soundevent \{event = ui_sfx_scroll_up}
		endif
	endif
endscript

script menu_scroll_end_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = menu_scroll_end}
	endif
endscript

script menu_audio_settings_band_volume_sound 
	if ($disable_menu_sounds = 0)
	endif
endscript

script menu_audio_settings_guitar_volume_sound 
	if ($disable_menu_sounds = 0)
	endif
endscript

script menu_audio_settings_fx_volume_sound 
	if ($disable_menu_sounds = 0)
	endif
endscript

script menu_audio_settings_mic_volume_sound 
	if ($disable_menu_sounds = 0)
		printf \{'STUBBED: gamemenu_helpers.q, menu_audio_settings_mic_volume_sound'}
	endif
endscript

script menu_video_settings_lefty_flip_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = box_check_sfx}
	endif
endscript

script menu_video_settings_calibrate_strum_sound 
	if ($disable_menu_sounds = 0)
		generic_menu_up_or_down_sound
	endif
endscript

script menu_video_settings_calibrate_reset_to_zero_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ui_sfx_select}
	endif
endscript

script menu_song_complete_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ui_sfx_select}
	endif
endscript

script menu_get_sponsor_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = gh4_gigcomplete_sponsor}
	endif
endscript

script ghmix_pad_back_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ghmix_back}
	endif
endscript

script ghmix_pad_choose_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ghmix_select}
	endif
endscript

script ghmix_pad_up_down 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ghmix_scroll_up_down}
	endif
endscript

script menu_setlist_bonus_tab_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ui_sfx_select}
	endif
endscript

script menu_setlist_downloads_tab_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ui_sfx_select}
	endif
endscript

script menu_setlist_setlist_tab_sound 
	if ($disable_menu_sounds = 0)
		soundevent \{event = ui_sfx_select}
	endif
endscript

script screenelement_get_tags 
	requireparams \{[
			id
		]
		all}
	<id> :gettags
	removeparameter \{id}
	return {tags = <...>}
endscript
