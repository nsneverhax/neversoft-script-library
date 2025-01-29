
script ui_create_jam_ratesong 
	printf \{'in create ratesong'}
	BG_Crowd_Front_End_Silence \{immediate = 1}
	SpawnScriptNow \{jam_ratesong_menu
		id = jam_ratesong_spawn}
endscript

script ui_destroy_jam_ratesong 
endscript

script ui_init_jam_ratesong 
endscript

script ui_deinit_jam_ratesong 
	if ScreenElementExists \{id = jam_ratesong_dialog}
		DestroyScreenElement \{id = jam_ratesong_dialog}
	endif
endscript

script jam_ratesong_menu 
	create_menu_backdrop \{texture = main_menu_bg_1}
	CreateScreenElement \{parent = root_window
		id = jam_ratesong_dialog
		Type = descinterface
		desc = 'jam_ratesong'
		Pos = (0.0, 0.0)}
	jam_ratesong_dialog :SetTags \{current_rating = 7}
	<current_rating> = 7
	Mod a = <current_rating> b = 2
	if (<Mod> = 0)
		formatText TextName = rating_text qs(0xb283ed85) a = (<current_rating> / 2) DecimalPlaces = 0
	else
		<decimal_rating> = (<current_rating> / 2.0)
		formatText TextName = rating_text qs(0xb283ed85) a = <decimal_rating> DecimalPlaces = 1
	endif
	getsonginfo
	jam_ratesong_dialog :se_setprops {song_name_text = ($jam_selected_song) artist_name_text = <artist> rating_number_text = <rating_text>}
	new_menu {
		scrollid = scrolling_ratesong
		vmenuid = vmenu_ratesong
		menu_pos = (0.0, 0.0)
		use_backdrop = 0
		default_colors = 0
		exclusive_device = <controller>
		event_handlers = [
			{pad_up jam_ratesong_updown params = {up}}
			{pad_down jam_ratesong_updown params = {down}}
			{pad_circle jam_ratesong_continue params = {skip}}
			{pad_choose jam_ratesong}
			{pad_start jam_ratesong}
		]
		menu_parent = jam_ratesong_dialog
	}
	add_user_control_helper \{text = qs(0xb73cb78f)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0x784c64ff)
		button = red
		z = 100}
	LaunchEvent \{Type = focus
		target = vmenu_ratesong}
endscript

script jam_ratesong_updown 
	jam_ratesong_dialog :GetTags
	if GotParam \{up}
		generic_menu_up_or_down_sound \{up}
		<current_rating> = (<current_rating> + 1)
		jam_ratesong_dialog :se_setprops \{up_arrow_scale = 1.3
			relative_scale}
		jam_ratesong_dialog :se_setprops \{up_arrow_scale = 1.0
			relative_scale
			time = 0.1}
		if (<current_rating> > 10)
			<current_rating> = 10
		endif
	elseif GotParam \{down}
		generic_menu_up_or_down_sound \{down}
		<current_rating> = (<current_rating> - 1)
		jam_ratesong_dialog :se_setprops \{down_arrow_scale = 1.3
			relative_scale}
		jam_ratesong_dialog :se_setprops \{down_arrow_scale = 1.0
			relative_scale
			time = 0.1}
		if (<current_rating> < 1)
			<current_rating> = 1
		endif
	endif
	lit_color = [255 255 255 255]
	base_rating = (<current_rating> / 2)
	CastToInteger \{base_rating}
	Mod a = <current_rating> b = 2
	fraction = <Mod>
	<i> = 1
	begin
	formatText checksumName = star_id 'alias_star_on%a' a = <i>
	if jam_ratesong_dialog :desc_resolvealias Name = <star_id>
		if (<base_rating> >= <i>)
			<resolved_id> :SetProps texture = one_star_lrg_full rgba = <lit_color>
		elseif ((<base_rating> + 1) = <i>)
			if (<fraction> = 0)
				<resolved_id> :SetProps texture = one_star_lrg_off rgba = [255 255 255 0]
			else
				<resolved_id> :SetProps texture = one_star_lrg_half rgba = <lit_color>
			endif
		elseif ((<base_rating> + 1) < <i>)
			<resolved_id> :SetProps texture = one_star_lrg_off rgba = [255 255 255 0]
		endif
	endif
	<i> = (<i> + 1)
	repeat 5
	if jam_ratesong_dialog :desc_resolvealias \{Name = alias_rating_words}
		switch (<current_rating>)
			case 1
			<new_text> = qs(0x2f1a8159)
			case 2
			<new_text> = qs(0xc341ca3a)
			case 3
			<new_text> = qs(0xe31d1f5e)
			case 4
			<new_text> = qs(0xb810c386)
			case 5
			<new_text> = qs(0xe30f2bec)
			case 6
			<new_text> = qs(0x2538c776)
			case 7
			<new_text> = qs(0x2d61429d)
			case 8
			<new_text> = qs(0x71b8c195)
			case 9
			<new_text> = qs(0x84476889)
			case 10
			<new_text> = qs(0xcee92ae3)
		endswitch
		<resolved_id> :SetProps text = <new_text>
	endif
	jam_ratesong_dialog :SetTags {current_rating = <current_rating>}
endscript

script jam_ratesong 
	if ScreenElementExists \{id = scrolling_ratesong}
		scrolling_ratesong :se_setprops \{block_events}
	endif
	NetSessionFunc \{func = stats_init}
	if NOT NetSessionFunc \{func = is_ghtunes_lobby_available}
		Wait \{1
			gameframe}
		show_ghtunes_connecting_popup
		<timeout> = 20.0
		ResetTimer
		begin
		if NetSessionFunc \{func = is_ghtunes_lobby_available}
			destroy_popup_warning_menu
			break
		else
			if (<is_connecting> = 0)
				destroy_popup_warning_menu
				jam_ratesong_continue
				return
			endif
		endif
		if TimeGreaterThan <timeout>
			destroy_popup_warning_menu
			jam_ratesong_continue
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	generic_menu_pad_choose_sound
	LaunchEvent \{Type = unfocus
		target = vmenu_ratesong}
	jam_upload_song_dialog \{dialog = 5
		ghtunes = 1}
	jam_ratesong_dialog :GetTags
	rateusercontent rating = (<current_rating> -1)
endscript

script jam_ratesong_completed 
	GetGlobalTags \{user_options
		param = ghtunes_num_songs_rated}
	new_num_songs_rated = (<ghtunes_num_songs_rated> + 1)
	SetGlobalTags user_options params = {ghtunes_num_songs_rated = <new_num_songs_rated>}
	getsonginfo
	<new_array> = (($jam_songs_rated_this_session) + (<file_id>.file_id))
	Change jam_songs_rated_this_session = <new_array>
	jam_upload_song_dialog_destroy
	jam_ratesong_continue
endscript

script jam_ratesong_failed 
	jam_upload_song_dialog_destroy
	if GotParam \{fail_type}
		if (<fail_type> = 1)
			msg_txt = ($rating_failed_nonexistant_song_txt)
		endif
	else
		if isps3
			msg_txt = qs(0xb9836f21)
		else
			msg_txt = qs(0x11e85bf4)
		endif
	endif
	create_popup_warning_menu {
		textblock = {
			text = <msg_txt>
			Pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_ratesong_continue}
				text = qs(0x182f0173)
			}
		]
	}
endscript

script jam_ratesong_continue 
	if ScreenElementExists \{id = scrolling_ratesong}
		scrolling_ratesong :se_setprops \{block_events}
	endif
	destroy_popup_warning_menu
	if ui_event_exists_in_stack \{Name = 'jam'}
		ui_memcard_autosave \{state = uistate_jam}
		if GotParam \{skip}
			generic_menu_pad_choose_sound
		endif
	elseif ui_event_exists_in_stack \{Name = 'setlist'}
		Change \{songtime_paused = 0}
		clean_up_user_control_helpers
		jam_quickplay_do_next_song
		return
	endif
endscript

script jam_ratesong_check_for_rating 
	getsonginfo
	if NOT GotParam \{downloaded}
		<downloaded> = 0
	endif
	if GotParam \{from_setlist}
		if ($last_track_song != jamsession)
			<downloaded> = 0
		endif
	endif
	if (<downloaded> = 1)
		<song_is_rated> = 0
		<rated_ids> = $jam_songs_rated_this_session
		GetArraySize <rated_ids>
		<i> = 0
		begin
		if (<array_Size> = 0)
			break
		endif
		if (((<rated_ids> [<i>]) = ((<file_id>.file_id) [0])) && ((<rated_ids> [<i> + 1]) = ((<file_id>.file_id) [1])))
			<song_is_rated> = 1
			break
		endif
		<i> = (<i> + 2)
		repeat (<array_Size> / 2)
		if (<song_is_rated> = 0)
			generic_menu_pad_choose_sound
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_jam_ratesong
				}}
		else
			if ui_event_exists_in_stack \{Name = 'jam'}
				ui_memcard_autosave \{state = uistate_jam}
			elseif ui_event_exists_in_stack \{Name = 'setlist'}
				generic_menu_pad_choose_sound
				jam_quickplay_do_next_song
			endif
		endif
	else
		if ui_event_exists_in_stack \{Name = 'jam'}
			ui_memcard_autosave \{state = uistate_jam}
		elseif ui_event_exists_in_stack \{Name = 'setlist'}
			jam_quickplay_do_next_song
		endif
	endif
endscript
