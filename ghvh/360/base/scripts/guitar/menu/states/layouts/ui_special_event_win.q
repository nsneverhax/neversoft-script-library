
script ui_create_special_event_win 
	create_special_event_win_menu <...>
endscript

script ui_destroy_special_event_win 
	destroy_special_event_win_menu <...>
endscript

script create_special_event_win_menu \{quit_segment = 0}
	getplayerinfo \{1
		part}
	formatText \{checksumName = event_num
		'special_event%d'
		d = $current_special_event_num}
	formatText \{checksumName = challenge_num
		'challenge%d'
		d = $current_special_event_challenge_num}
	formatText checksumName = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
	event_won = 0
	event_failed = 0
	show_song_stats = 1
	no_time_left = 0
	if ($current_special_event_num = 1)
		special_event_copy_over_stats
		still_fresh_stage = 1
		Change \{special_event_stage = 2}
		success = 0
		if check_current_special_event_percentages \{dont_count_unplayed_sections}
			<success> = 1
		endif
		if (<success> = 1 && <quit_segment> = 0)
			<event_won> = 1
			Change special_event_stage = ($special_event_stage + 1)
			event_handlers = [
				{pad_choose ui_win_song_continue}
			]
		else
			getspecialeventtimer
			if (<time> <= 0)
				<event_failed> = 1
				event_handlers = [
					{pad_choose generic_event_back params = {state = uistate_special_events}}
				]
			endif
		endif
		getspecialeventtimer
		if (<time> < <total_time_left_in_sections>)
			<no_time_left> = 1
			<event_failed> = 1
			event_handlers = [
				{pad_choose generic_event_back params = {state = uistate_special_events}}
			]
		endif
	elseif ($current_special_event_num = 2)
		special_event_copy_over_stats
		still_fresh_stage = 2
		special_event_get_time_wasted
		getspecialeventtimer
		<time> = (<time> - <time_wasted>)
		if (<time> < 0)
			<time> = 0
		endif
		setspecialeventtimer time = <time>
		success = 0
		if check_current_special_event_percentages section_to_check = ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [0])
			<success> = 1
		endif
		if (<success> = 1 && <quit_segment> = 0)
			<event_won> = 1
			Change special_event_stage = ($special_event_stage + 1)
			event_handlers = [
				{pad_choose ui_win_song_continue}
			]
		else
			if (<time> <= 0)
				<event_failed> = 1
				event_handlers = [
					{pad_choose generic_event_back params = {state = uistate_special_events}}
				]
			else
				event_handlers = [
					{pad_choose special_event_2_ingame_setup}
				]
			endif
		endif
	elseif ($current_special_event_num = 3)
		<event_won> = <songwriter_result>
		<event_failed> = 1
		<show_song_stats> = 0
		event_handlers = [
			{pad_choose generic_event_back params = {state = uistate_special_events}}
		]
	endif
	if GotParam \{check_special_event_and_return}
		return
	endif
	if NOT GotParam \{event_handlers}
		event_handlers = [
			{pad_choose generic_event_back params = {state = uistate_select_song_section}}
		]
	endif
	create_menu_backdrop \{texture = black}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = sewin_container}
	if (<event_failed> = 1)
		CreateScreenElement \{Type = TextElement
			parent = sewin_container
			font = fontgrid_text_a3
			text = qs(0xb1cbd49c)
			Pos = (640.0, 90.0)
			just = [
				center
				center
			]
			Scale = 2
			rgba = [
				200
				20
				20
				255
			]}
	endif
	if (<event_won> = 1)
		CreateScreenElement \{Type = TextElement
			parent = sewin_container
			font = fontgrid_text_a3
			text = qs(0x2a9de11a)
			Pos = (640.0, 90.0)
			just = [
				center
				center
			]
			Scale = 2
			rgba = [
				20
				200
				20
				255
			]}
	endif
	if (<no_time_left> = 1)
		CreateScreenElement \{Type = TextElement
			parent = sewin_container
			font = fontgrid_text_a3
			text = qs(0xf2c6cc33)
			Pos = (640.0, 150.0)
			just = [
				center
				center
			]
			Scale = 1.125
			rgba = [
				200
				20
				20
				255
			]}
	endif
	if (<show_song_stats> = 1)
		get_song_title \{song = $current_song}
		CreateScreenElement {
			Type = TextElement
			parent = sewin_container
			font = fontgrid_text_a3
			text = <song_title>
			Pos = (640.0, 200.0)
			just = [center center]
			rgba = [200 200 200 255]
		}
		getspecialeventtimer
		format_time_from_seconds time = <time>
		CreateScreenElement {
			Type = TextElement
			parent = sewin_container
			font = fontgrid_text_a3
			text = (qs(0x5660e4ee) + <time_formatted>)
			Pos = (640.0, 250.0)
			just = [center center]
			rgba = [200 200 200 255]
		}
		entry = 0
		GetArraySize ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections)
		use_special_event_section_array = 1
		if (<array_Size> = 0)
			<use_special_event_section_array> = 0
			get_song_section_array
			getmarkerarraysize array = <song_section_array>
		endif
		text_pos = (640.0, 320.0)
		begin
		if (<use_special_event_section_array> = 1)
			section_index = ($special_events_challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [<entry>])
		else
			section_index = <entry>
		endif
		if (<section_index> >= $practice_start_index && (<section_index> + 1) <= $practice_end_index)
			show_pass_or_fail = 1
			if ($special_event_stage > <still_fresh_stage>)
				if is_special_event_completion_on index = <section_index>
					<show_pass_or_fail> = 0
				endif
			endif
			if (<event_failed> = 1)
				<show_pass_or_fail> = 1
			endif
			if (<show_pass_or_fail> = 1)
				special_event_copy_over_stats_at_index entry = <section_index>
				formatText TextName = section_and_percentage qs(0x89fa5168) a = <section_name> b = <new_note_percentage>
				<section_and_percentage> = (<section_and_percentage> + qs(0x0c40a1b2))
				check_current_special_event_percentages section_to_check = <section_index>
				CreateScreenElement {
					Type = TextElement
					parent = sewin_container
					font = fontgrid_text_a3
					text = <section_and_percentage>
					Pos = <text_pos>
					just = [center center]
					rgba = [200 200 200 255]
				}
				failed_or_passed_text = qs(0xee9c6b08)
				failed_or_passed_color = [220 20 20 255]
				if (<new_note_percentage> = 100 && <note_missed> = 0)
					<failed_or_passed_text> = qs(0xe5fb2e74)
					<failed_or_passed_color> = [20 220 20 255]
				elseif (<new_note_percentage> = 100 && <note_missed> = 1)
					GetScreenElementProps id = <id>
					<text_pos> = (<Pos> - (150.0, 0.0))
					SetScreenElementProps id = <id> Pos = <text_pos>
					<failed_or_passed_text> = (<failed_or_passed_text> + qs(0xee91a7db))
				endif
				GetScreenElementDims id = <id>
				CreateScreenElement {
					Type = TextElement
					parent = sewin_container
					font = fontgrid_text_a3
					text = <failed_or_passed_text>
					Pos = (<text_pos> + <width> * (0.5, 0.0) + (10.0, 0.0))
					just = [left center]
					rgba = <failed_or_passed_color>
					Scale = 0.8
				}
				<text_pos> = (<text_pos> + (0.0, 50.0))
			endif
			set_special_event_completion_on index = <section_index>
		endif
		<entry> = (<entry> + 1)
		repeat <array_Size>
	endif
	new_menu {
		scrollid = sewin_scrolling_menu vmenuid = current_menu use_backdrop = (0) menu_pos = (640.0, 360.0)
		dims = (100.0, 900.0)
		event_handlers = <event_handlers>
		position_children = FALSE
	}
	sewin_container :obj_spawnscript \{menu_music_on}
	set_focus_color rgba = ($default_menu_focus_color)
	set_unfocus_color rgba = ($default_menu_unfocus_color)
	add_user_control_helper \{text = qs(0x182f0173)
		button = green
		z = 100000}
endscript

script destroy_special_event_win_menu 
	destroy_menu_backdrop
	clean_up_user_control_helpers
	destroy_menu \{menu_id = sewin_container}
	destroy_menu \{menu_id = sewin_scrolling_menu}
	destroy_menu \{menu_id = current_menu}
endscript
