is_changing_levels = 0

script generic_menu_pad_back 
	printf \{qs(0xd7d7f670)}
	generic_menu_pad_back_sound
	if GotParam \{callback}
		<callback> <...>
	endif
endscript

script generic_event_back \{object = 1
		data = {
		}}
	ui_set_dialogue \{value = 0}
	if ($start_edit_character = 1)
		if ($disable_cas_back = 1)
			return
		endif
	endif
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	if NOT GotParam \{nosound}
		generic_menu_pad_back_sound
	endif
	if GotParam \{menu_music}
		switch <menu_music>
			case On
			SpawnScriptNow \{menu_music_on}
			case OFF
			menu_music_off
			default
			printf \{channel = sfx
				qs(0xf791d105)}
		endswitch
	endif
	if GotParam \{voting_screen}
		kill_voting_screen_sfx
	endif
	if GotParam \{no_assert}
		no_assert_flag = {no_assert}
	endif
	getcallerinfo
	if NOT GotParam \{Wait}
		ui_event event = menu_back object = <object> data = <data> <no_assert_flag> line = <line> file = <file> caller = <caller>
	else
		ui_event_wait event = menu_back object = <object> data = <data> <no_assert_flag> line = <line> file = <file> caller = <caller>
	endif
endscript

script generic_event_back_block \{object = 1
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	if NOT GotParam \{nosound}
		generic_menu_pad_back_sound
	endif
	getcallerinfo
	ui_event_block event = menu_back object = <object> data = <data> line = <line> file = <file> caller = <caller>
endscript

script generic_event_back_refresh \{object = 1
		data = ScriptAssert
		': Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
	if NOT GotParam \{no_sound}
		generic_menu_pad_choose_sound
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
		generic_menu_pad_choose_sound
	endif
	getcallerinfo
	ui_event event = <event> data = <data> object = <object> line = <line> file = <file> caller = <caller>
endscript

script generic_menu_pad_back_sound 
	if GotParam \{mode}
		if (<mode> = music_store)
			music_store_back_sfx
		else
			SoundEvent \{event = Generic_Menu_Back_SFX}
		endif
	else
		SoundEvent \{event = Generic_Menu_Back_SFX}
	endif
endscript

script generic_menu_pad_choose_sound 
	SoundEvent \{event = ui_sfx_select}
endscript
disable_menu_sounds = 0

script generic_menu_up_or_down_sound \{menu_id = current_menu}
	if ($disable_menu_sounds = 0)
		if GotParam \{down}
			SoundEvent \{event = ui_sfx_scroll_down}
		else
			SoundEvent \{event = ui_sfx_scroll_up}
		endif
	endif
endscript

script menu_scroll_end_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{event = menu_scroll_end}
	endif
endscript

script menu_audio_settings_band_volume_sound \{popup = 0}
	ScriptAssert \{'menu_audio_settings_band_volume_sound: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script menu_audio_settings_guitar_volume_sound \{popup = 0}
	ScriptAssert \{'menu_audio_settings_guitar_volume_sound: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script menu_audio_settings_fx_volume_sound \{popup = 0}
	ScriptAssert \{'menu_audio_settings_fx_volume_sound: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script menu_audio_settings_mic_volume_sound 
	if ($disable_menu_sounds = 0)
		printf \{'STUBBED: gamemenu_helpers.q, menu_audio_settings_mic_volume_sound'}
	endif
endscript

script menu_video_settings_lefty_flip_sound 
	ScriptAssert \{'menu_video_settings_lefty_flip_sound: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script menu_video_settings_calibrate_strum_sound 
	ScriptAssert \{'menu_video_settings_calibrate_strum_sound: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script menu_video_settings_calibrate_reset_to_zero_sound 
	ScriptAssert \{'menu_video_settings_calibrate_reset_to_zero_sound: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script menu_song_complete_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{event = ui_sfx_select}
	endif
endscript

script menu_get_sponsor_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{event = gh4_gigcomplete_sponsor}
	endif
endscript

script ghmix_pad_back_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{event = ghmix_back}
	endif
endscript

script ghmix_pad_choose_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{event = ghmix_select}
	endif
endscript

script ghmix_pad_up_down 
	if ($disable_menu_sounds = 0)
		SoundEvent \{event = ghmix_scroll_up_down}
	endif
endscript

script menu_setlist_bonus_tab_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{event = ui_sfx_select}
	endif
endscript

script menu_setlist_downloads_tab_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{event = ui_sfx_select}
	endif
endscript

script menu_setlist_setlist_tab_sound 
	if ($disable_menu_sounds = 0)
		SoundEvent \{event = ui_sfx_select}
	endif
endscript

script screenelement_get_tags 
	RequireParams \{[
			id
		]
		all}
	<id> :GetTags
	RemoveParameter \{id}
	return {tags = <...>}
endscript
