
script ui_create_jam_ratesong 
	printf \{'in create ratesong'}
	bg_crowd_front_end_silence \{immediate = 1}
	spawnscriptnow \{jam_ratesong_menu
		id = jam_ratesong_spawn}
endscript

script ui_destroy_jam_ratesong 
endscript

script ui_init_jam_ratesong 
endscript

script ui_deinit_jam_ratesong 
	if screenelementexists \{id = jam_ratesong_dialog}
		destroyscreenelement \{id = jam_ratesong_dialog}
	endif
endscript

script jam_ratesong_menu 
	create_menu_backdrop \{texture = boot_brick_bg}
	createscreenelement \{parent = root_window
		id = jam_ratesong_dialog
		type = descinterface
		desc = 'jam_ratesong'
		pos = (0.0, 0.0)}
	jam_ratesong_dialog :settags \{current_rating = 7}
	<current_rating> = 7
	mod a = <current_rating> b = 2
	if (<mod> = 0)
		formattext textname = rating_text qs(0xb283ed85) a = (<current_rating> / 2) decimalplaces = 0
	else
		<decimal_rating> = (<current_rating> / 2.0)
		formattext textname = rating_text qs(0xb283ed85) a = <decimal_rating> decimalplaces = 1
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
	launchevent \{type = focus
		target = vmenu_ratesong}
endscript

script jam_ratesong_updown 
	jam_ratesong_dialog :gettags
	if gotparam \{up}
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
	elseif gotparam \{down}
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
	casttointeger \{base_rating}
	mod a = <current_rating> b = 2
	fraction = <mod>
	<i> = 1
	begin
	formattext checksumname = star_id 'alias_star_on%a' a = <i>
	if jam_ratesong_dialog :desc_resolvealias name = <star_id>
		if (<base_rating> >= <i>)
			<resolved_id> :setprops texture = one_star_lrg_full rgba = <lit_color>
		elseif ((<base_rating> + 1) = <i>)
			if (<fraction> = 0)
				<resolved_id> :setprops texture = one_star_lrg_off rgba = [255 255 255 0]
			else
				<resolved_id> :setprops texture = one_star_lrg_half rgba = <lit_color>
			endif
		elseif ((<base_rating> + 1) < <i>)
			<resolved_id> :setprops texture = one_star_lrg_off rgba = [255 255 255 0]
		endif
	endif
	<i> = (<i> + 1)
	repeat 5
	if jam_ratesong_dialog :desc_resolvealias \{name = alias_rating_words}
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
		<resolved_id> :setprops text = <new_text>
	endif
	jam_ratesong_dialog :settags {current_rating = <current_rating>}
endscript

script jam_ratesong 
	if screenelementexists \{id = scrolling_ratesong}
		scrolling_ratesong :se_setprops \{block_events}
	endif
	netsessionfunc \{func = stats_init}
	if NOT netsessionfunc \{func = is_ghtunes_lobby_available}
		wait \{1
			gameframe}
		show_ghtunes_connecting_popup
		<timeout> = 20.0
		resettimer
		begin
		if netsessionfunc \{func = is_ghtunes_lobby_available}
			destroy_popup_warning_menu
			break
		else
			if (<is_connecting> = 0)
				destroy_popup_warning_menu
				jam_ratesong_continue
				return
			endif
		endif
		if timegreaterthan <timeout>
			destroy_popup_warning_menu
			jam_ratesong_continue
		endif
		wait \{1
			gameframe}
		repeat
	endif
	generic_menu_pad_choose_sound
	launchevent \{type = unfocus
		target = vmenu_ratesong}
	jam_upload_song_dialog \{dialog = 5
		ghtunes = 1}
	jam_ratesong_dialog :gettags
	rateusercontent rating = (<current_rating> -1)
endscript

script jam_ratesong_completed 
	getglobaltags \{user_options
		param = ghtunes_num_songs_rated}
	new_num_songs_rated = (<ghtunes_num_songs_rated> + 1)
	setglobaltags user_options params = {ghtunes_num_songs_rated = <new_num_songs_rated>}
	getsonginfo
	<new_array> = (($jam_songs_rated_this_session) + (<file_id>.file_id))
	change jam_songs_rated_this_session = <new_array>
	jam_upload_song_dialog_destroy
	jam_ratesong_continue
endscript

script jam_ratesong_failed 
	jam_upload_song_dialog_destroy
	if gotparam \{fail_type}
		if (<fail_type> = 1)
			msg_txt = ($rating_failed_nonexistant_song_txt)
		endif
	else
		if isps3
			msg_txt = qs(0xb9836f21)
		else
			msg_txt = qs(0xb9f3b9df)
		endif
	endif
	create_popup_warning_menu {
		textblock = {
			text = <msg_txt>
			pos = (640.0, 370.0)
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
	if screenelementexists \{id = scrolling_ratesong}
		scrolling_ratesong :se_setprops \{block_events}
	endif
	destroy_popup_warning_menu
	if ui_event_exists_in_stack \{name = 'jam'}
		ui_memcard_autosave \{state = uistate_jam}
		if gotparam \{skip}
			generic_menu_pad_choose_sound
		endif
	elseif ui_event_exists_in_stack \{name = 'setlist'}
		change \{songtime_paused = 0}
		clean_up_user_control_helpers
		jam_quickplay_do_next_song
		return
	endif
endscript

script jam_ratesong_check_for_rating 
	getsonginfo
	if NOT gotparam \{downloaded}
		<downloaded> = 0
	endif
	if gotparam \{from_setlist}
		if ($last_track_song != jamsession)
			<downloaded> = 0
		endif
	endif
	if (<downloaded> = 1)
		<song_is_rated> = 0
		<rated_ids> = $jam_songs_rated_this_session
		getarraysize <rated_ids>
		<i> = 0
		begin
		if (<array_size> = 0)
			break
		endif
		if (((<rated_ids> [<i>]) = ((<file_id>.file_id) [0])) && ((<rated_ids> [<i> + 1]) = ((<file_id>.file_id) [1])))
			<song_is_rated> = 1
			break
		endif
		<i> = (<i> + 2)
		repeat (<array_size> / 2)
		if (<song_is_rated> = 0)
			generic_menu_pad_choose_sound
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_jam_ratesong
				}}
		else
			if ui_event_exists_in_stack \{name = 'jam'}
				ui_memcard_autosave \{state = uistate_jam}
			elseif ui_event_exists_in_stack \{name = 'setlist'}
				generic_menu_pad_choose_sound
				jam_quickplay_do_next_song
			endif
		endif
	else
		if ui_event_exists_in_stack \{name = 'jam'}
			ui_memcard_autosave \{state = uistate_jam}
		elseif ui_event_exists_in_stack \{name = 'setlist'}
			jam_quickplay_do_next_song
		endif
	endif
endscript
