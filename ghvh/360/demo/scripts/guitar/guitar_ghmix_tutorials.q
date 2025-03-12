
script ghmix_tutorial_live_rec 
	jam_studio_element :settags \{challenges_complete = 0
		challenges_req = 3}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]
		tool_controls = [
		]}
	if jam_studio_element :desc_resolvealias \{name = dialog_box}
		<resolved_id> :setprops alpha = 0
	endif
	wait \{1.5
		second}
	training_show_title \{title = qs(0x39538c1a)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_GHMix_01_BAS'}
	wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'
		expression = 2}
	training_wait_for_sound \{sound = 'Tut_RS_GHMix_01_BAS'}
	wait \{0.5
		second}
	training_show_narrator \{narrator = 'bassist'
		expression = 0}
	training_play_sound \{sound = 'Tut_RS_GHMix_02_BAS'
		wait}
	training_hide_narrator
	training_show_title \{title = qs(0xdf38b19a)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_LiveRec_01_BAS'}
	wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{sound = 'Tut_RS_LiveRec_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_live_rec_challenge
	training_show_narrator \{narrator = 'bassist'
		expression = 0}
	training_play_sound \{sound = 'Tut_RS_LiveRec_02_BAS'
		wait}
	training_hide_narrator
	training_hide_placeholder
	jam_tutorial_lesson_complete
	jam_studio_element :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_studio_element :settags {challenges_complete = <challenges_complete>}
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_live_rec_challenge 
	jam_control_goto \{option_index = 3}
	ghmix_tutorial_force_snap \{setting = 6}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		tool_controls = [
		]
		block_snap = 0}
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x9bde6454)}
	training_add_lesson_body_text \{number = 1
		text = qs(0xe55ab6d0)}
	training_set_task_header_body \{text = qs(0x7a002b7c)}
	<notes_required> = 10
	training_show_lesson_header
	training_show_task_header
	training_display_notes_hit notes_hit = 0 notes_required = <notes_required>
	begin
	block \{type = ghmix_snap_changed}
	if ($jam_current_quantize = 4)
		controllerdebounce \{left}
		controllerdebounce \{right}
		break
	endif
	repeat
	training_add_lesson_body_text \{number = 2
		text = qs(0xd256eb97)}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			1
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		block_snap = 1}
	<gem_array> = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	appendsuffixtochecksum base = <gem_array> suffixstring = <suffix>
	notetrack_size_before = ($<appended_id>)
	block \{type = ghmix_start_rec}
	training_add_lesson_body_text \{number = 3
		text = qs(0x1fb1c505)}
	begin
	<num_new_notes> = ((($<appended_id>) - <notetrack_size_before>) / 2)
	if (<num_new_notes> >= <notes_required>)
		training_display_notes_hit notes_hit = <notes_required> notes_required = <notes_required>
		break
	else
		training_display_notes_hit notes_hit = <num_new_notes> notes_required = <notes_required>
	endif
	wait \{1
		gameframe}
	repeat
	training_add_lesson_body_text \{number = 4
		text = qs(0x77caf33b)}
	block \{type = ghmix_stop_rec}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		block_snap = 1}
	training_play_sound \{sound = 'Tut_RS_LiveRec_04_BAS'
		wait}
	training_hide_lesson_header
endscript

script ghmix_tutorial_step_rec 
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		tool_controls = [
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	training_show_title \{title = qs(0x34edebf6)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_StepRec_01_BAS'}
	wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{sound = 'Tut_RS_StepRec_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_step_rec_switch_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{sound = 'Tut_RS_StepRec_02_BAS'
		wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_step_rec_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{sound = 'Tut_RS_StepRec_03_BAS'
		wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	jam_tutorial_lesson_complete
	jam_studio_element :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_studio_element :settags {challenges_complete = <challenges_complete>}
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_step_rec_switch_challenge 
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]
		block_updown = 0}
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0xb778e832)}
	training_add_lesson_body_text \{number = 1
		text = qs(0x43ddadac)}
	training_set_task_header_body \{text = qs(0x9faebecd)}
	training_show_lesson_header
	training_show_task_header
	begin
	if ($jam_control_selected = 13)
		jam_studio_element :settags \{block_updown = 1}
		controllerdebounce \{up}
		controllerdebounce \{down}
		break
	endif
	wait \{1
		gameframe}
	repeat
	training_add_lesson_body_text \{number = 2
		text = qs(0x31671808)}
	begin
	if ($jam_current_track = 2)
		controllerdebounce \{x}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		block_updown = 1}
	training_hide_lesson_header
endscript

script ghmix_tutorial_step_rec_challenge 
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			1
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		block_updown = 0}
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0x81a770e1)}
	training_add_lesson_body_text \{number = 1
		text = qs(0x22aaab84)}
	training_set_task_header_body \{text = qs(0x355d28ac)}
	<notes_required> = 10
	training_show_lesson_header
	training_show_task_header
	training_display_notes_hit notes_hit = 0 notes_required = <notes_required>
	begin
	if ($jam_control_selected = 4)
		jam_studio_element :settags \{block_updown = 1}
		controllerdebounce \{up}
		controllerdebounce \{down}
		break
	endif
	wait \{1
		gameframe}
	repeat
	training_add_lesson_body_text \{number = 2
		text = qs(0xf218664e)}
	<gem_array> = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	appendsuffixtochecksum base = <gem_array> suffixstring = <suffix>
	notetrack_size_before = ($<appended_id>)
	block \{type = ghmix_start_step}
	training_add_lesson_body_text \{number = 3
		text = qs(0x1fb1c505)}
	begin
	<num_new_notes> = ((($<appended_id>) - <notetrack_size_before>) / 2)
	if (<num_new_notes> >= <notes_required>)
		training_display_notes_hit notes_hit = <notes_required> notes_required = <notes_required>
		break
	else
		training_display_notes_hit notes_hit = <num_new_notes> notes_required = <notes_required>
	endif
	wait \{1
		gameframe}
	repeat
	training_add_lesson_body_text \{number = 4
		text = qs(0x77caf33b)}
	block \{type = ghmix_stop_step}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]}
	training_play_sound \{sound = 'Tut_RS_StepRec_05_BAS'
		wait}
	training_hide_lesson_header
endscript

script ghmix_tutorial_delete 
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		tool_controls = [
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	ghmix_tutorial_force_snap \{setting = 3}
	begin
	if ($jam_current_track = 3)
		break
	endif
	jam_recording_switch_instrument
	wait \{1
		gameframe}
	repeat
	training_show_title \{title = qs(0xf33198ca)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Del_01_BAS'}
	wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{sound = 'Tut_RS_Del_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_delete_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{sound = 'Tut_RS_Del_03_BAS'
		wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	jam_tutorial_lesson_complete
	jam_studio_element :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		setglobaltags \{training
			params = {
				rs_ghmix_editing_lesson = complete
			}}
	endif
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_delete_challenge 
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x448b1a21)}
	training_add_lesson_body_text \{number = 1
		text = qs(0x70fc1e48)}
	training_set_task_header_body \{text = qs(0xef4901df)}
	training_show_lesson_header
	training_show_task_header
	jam_studio_element :settags \{controls_enabled = [
			1
			1
			0
			0
			0
			1
			1
			0
			0
			0
			0
			0
			0
			0
		]
		block_snap = 0
		block_updown = 0
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	<bad_solo_start_time> = 18000
	<bad_solo_end_time> = 26000
	ghmix_tutorial_highlight start_time = <bad_solo_start_time> end_time = <bad_solo_end_time>
	jam_studio_show_helper_arrow target = <bad_solo_start_time>
	begin
	if (($jam_highway_play_time > (<bad_solo_start_time> -100)) && ($jam_highway_play_time < (<bad_solo_start_time> + 100)))
		jam_studio_element :settags \{controls_enabled = [
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
			]}
		controllerdebounce \{x}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 2
		text = qs(0x571c432c)}
	training_play_sound \{sound = 'Tut_RS_Del_02_BAS'}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
			0
			0
			0
			0
			0
		]}
	begin
	if ($jam_control_selected = 8)
		jam_studio_element :settags \{block_updown = 1}
		controllerdebounce \{up}
		controllerdebounce \{down}
		break
	endif
	wait \{1
		gameframe}
	repeat
	block \{type = ghmix_delete_start}
	training_add_lesson_body_text \{number = 3
		text = qs(0x311853b3)}
	jam_studio_element :settags \{delete_controls = [
			select
		]}
	jam_studio_show_helper_arrow target = <bad_solo_end_time>
	begin
	if (($jam_highway_play_time > (<bad_solo_end_time> -100)) && ($jam_highway_play_time < (<bad_solo_end_time> + 100)))
		controllerdebounce \{up}
		controllerdebounce \{down}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_play_sound \{sound = 'Tut_RS_LiveRec_04_BAS'}
	jam_studio_element :settags \{delete_controls = [
			delete
		]}
	training_add_lesson_body_text \{number = 4
		text = qs(0x42785339)}
	block \{type = ghmix_delete_done}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	training_hide_lesson_header
endscript

script ghmix_tutorial_copypaste 
	jam_studio_element :settags \{challenges_complete = 0
		challenges_req = 3}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		tool_controls = [
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	ghmix_tutorial_force_snap \{setting = 3}
	begin
	if ($jam_current_track = 4)
		break
	endif
	jam_recording_switch_instrument
	wait \{1
		gameframe}
	repeat
	if jam_studio_element :desc_resolvealias \{name = dialog_box}
		<resolved_id> :setprops alpha = 0
	endif
	training_show_title \{title = qs(0x6635f479)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Copy_01_BAS'}
	wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{sound = 'Tut_RS_Copy_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_copypaste_copy_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{sound = 'Tut_RS_Copy_02_BAS'
		wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_copypaste_paste_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{sound = 'Tut_RS_Copy_04_BAS'
		wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	jam_studio_element :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_studio_element :settags {challenges_complete = <challenges_complete>}
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_copypaste_copy_challenge 
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0xb90c5290)}
	training_add_lesson_body_text \{number = 1
		text = qs(0xaa739555)}
	training_set_task_header_body \{text = qs(0x1991b14c)}
	training_show_lesson_header
	training_show_task_header
	jam_studio_element :settags \{controls_enabled = [
			1
			1
			0
			0
			0
			1
			1
			0
			0
			0
			0
			0
			0
			0
		]
		block_snap = 0
		block_updown = 0
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	<chorus_start_time> = 2000
	<chorus_end_time> = 18000
	ghmix_tutorial_highlight start_time = <chorus_start_time> end_time = <chorus_end_time>
	jam_studio_show_helper_arrow target = <chorus_start_time>
	begin
	if (($jam_highway_play_time > (<chorus_start_time> -100)) && ($jam_highway_play_time < (<chorus_start_time> + 100)))
		jam_studio_element :settags \{controls_enabled = [
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
			]
			block_updown = 1}
		controllerdebounce \{x}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 2
		text = qs(0x04084d04)}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			1
			0
			0
			0
			0
		]
		block_updown = 0}
	jam_studio_element :settags \{copy_controls = [
			strum
		]}
	block \{type = ghmix_start_copy}
	training_add_lesson_body_text \{number = 3
		text = qs(0xb89f5d8e)}
	jam_studio_show_helper_arrow target = <chorus_end_time>
	begin
	if (($jam_highway_play_time > (<chorus_end_time> -100)) && ($jam_highway_play_time < (<chorus_end_time> + 100)))
		controllerdebounce \{up}
		controllerdebounce \{down}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 4
		text = qs(0x22cfa0f3)}
	jam_studio_element :settags \{copy_controls = [
			copy
		]}
	block \{type = ghmix_stop_copy}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		block_updown = 1}
	training_hide_lesson_header
endscript

script ghmix_tutorial_copypaste_paste_challenge 
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x24495be1)}
	training_add_lesson_body_text \{number = 1
		text = qs(0xd23943a6)}
	training_set_task_header_body \{text = qs(0x0f693743)}
	training_show_lesson_header
	training_show_task_header
	jam_studio_element :settags \{controls_enabled = [
			1
			1
			0
			0
			0
			1
			1
			0
			0
			0
			0
			0
			0
			0
		]
		block_snap = 0
		block_updown = 0
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	<start_time> = 34000
	<end_time> = 48000
	ghmix_tutorial_highlight start_time = <start_time> end_time = <end_time>
	jam_studio_show_helper_arrow target = <start_time>
	begin
	if (($jam_highway_play_time > (<start_time> -100)) && ($jam_highway_play_time < (<start_time> + 100)))
		jam_studio_element :settags \{controls_enabled = [
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
			]
			block_snap = 1
			block_updown = 1}
		controllerdebounce \{x}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 2
		text = qs(0xc8717e90)}
	training_play_sound \{sound = 'Tut_RS_Copy_03_BAS'}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			1
			0
			0
			0
		]
		block_snap = 1
		block_updown = 0}
	block \{type = ghmix_paste_start}
	training_add_lesson_body_text \{number = 3
		text = qs(0x3fb1ec42)}
	jam_studio_element :settags \{paste_controls = [
			paste_one
		]}
	block \{type = ghmix_paste_pasted}
	training_add_lesson_body_text \{number = 4
		text = qs(0x602a3034)}
	jam_studio_element :settags \{paste_controls = [
			cancel
		]}
	block \{type = ghmix_paste_done}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		block_snap = 1
		block_updown = 1}
	training_hide_lesson_header
endscript

script ghmix_tutorial_loops 
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		tool_controls = [
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	begin
	if ($jam_current_track = 3)
		break
	endif
	jam_recording_switch_instrument
	wait \{1
		gameframe}
	repeat
	jam_highway_move_beginning
	training_show_title \{title = qs(0xbaa6e9d3)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Loop_01_BAS'}
	wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{sound = 'Tut_RS_Loop_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_lay_loop_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{sound = 'Tut_RS_Loop_02_BAS'
		wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_loops_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{sound = 'Tut_RS_Loop_03_BAS'
		wait}
	training_hide_narrator \{narrator = 'bassist'}
	jam_tutorial_lesson_complete
	jam_studio_element :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_studio_element :settags {challenges_complete = <challenges_complete>}
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_lay_loop_challenge 
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0x93e1d59c)}
	training_add_lesson_body_text \{number = 1
		text = qs(0xa51135ae)}
	training_set_task_header_body \{text = qs(0xe1c6bbee)}
	training_show_lesson_header
	training_show_task_header
	<start_time> = 2000
	<end_time> = 6000
	ghmix_tutorial_highlight start_time = <start_time> end_time = <end_time>
	ghmix_tutorial_force_snap \{setting = 2}
	jam_studio_element :settags \{controls_enabled = [
			1
			1
			0
			0
			0
			1
			1
			0
			0
			0
			0
			0
			0
			0
		]
		block_snap = 0
		block_updown = 0
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	jam_studio_show_helper_arrow target = <start_time>
	begin
	if (($jam_highway_play_time > (<start_time> -100)) && ($jam_highway_play_time < (<start_time> + 100)))
		controllerdebounce \{x}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 2
		text = qs(0xbe0c9bc1)}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			1
			0
			0
			0
			0
			0
			0
		]
		block_snap = 0
		block_updown = 0
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	block \{type = ghmix_start_loop}
	training_add_lesson_body_text \{number = 3
		text = qs(0xf00fcfb1)}
	jam_studio_element :settags \{loop_controls = [
			select_area
		]}
	jam_studio_show_helper_arrow target = <end_time>
	begin
	if (($jam_highway_play_time > (<end_time> -100)) && ($jam_highway_play_time < (<end_time> + 100)))
		controllerdebounce \{up}
		controllerdebounce \{down}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 4
		text = qs(0x32c913b6)}
	jam_studio_element :settags \{loop_controls = [
			set_loop
		]}
	block \{type = ghmix_loop_set}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		tool_controls = [
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	training_hide_lesson_header
endscript

script ghmix_tutorial_loops_challenge 
	if screenelementexists \{id = jam_studio_element}
		if jam_studio_element :desc_resolvealias \{name = percussion_box}
			<resolved_id> :setprops alpha = 0
		endif
	endif
	ghmix_tutorial_force_snap \{setting = 4}
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0xcea13225)}
	training_add_lesson_body_text \{number = 1
		text = qs(0x05208678)}
	training_set_task_header_body \{text = qs(0xf0356cc3)}
	training_show_lesson_header
	training_show_task_header
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			1
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		block_updown = 0}
	block \{type = ghmix_start_rec}
	training_add_lesson_body_text \{number = 2
		text = qs(0x9e30ca06)}
	training_add_lesson_body_text \{number = 3
		text = qs(0xe3fa127c)}
	training_add_lesson_body_text \{number = 4
		text = qs(0xb2feef47)}
	<gem_array> = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	appendsuffixtochecksum base = <gem_array> suffixstring = <suffix>
	<notetrack_size_before> = ($<appended_id>)
	<notes_required> = 3
	begin
	<num_new_notes> = ((($<appended_id>) - <notetrack_size_before>) / 2)
	if (<num_new_notes> >= <notes_required>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	training_add_lesson_body_text \{number = 5
		text = qs(0x77caf33b)}
	block \{type = ghmix_stop_rec}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		tool_controls = [
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	training_hide_lesson_header
endscript

script ghmix_tutorial_nudge 
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		tool_controls = [
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	ghmix_tutorial_force_snap \{setting = 3}
	begin
	if ($jam_current_track = 1)
		break
	endif
	jam_recording_switch_instrument
	wait \{1
		gameframe}
	repeat
	jam_highway_move_beginning
	training_show_title \{title = qs(0x0f8a8a9b)}
	wait \{1
		second}
	training_play_sound \{sound = 'Tut_RS_Nudge_01_BAS'}
	wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{sound = 'Tut_RS_Nudge_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_nudge_challenge
	training_play_sound \{sound = 'Tut_RS_Nudge_02_BAS'
		wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	jam_tutorial_lesson_complete
	jam_studio_element :gettags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		setglobaltags \{training
			params = {
				rs_ghmix_pro_techniques_tools_lesson = complete
			}}
	endif
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_nudge_challenge 
	training_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = qs(0xa743fb6f)}
	training_add_lesson_body_text \{number = 1
		text = qs(0xad2acbd5)}
	training_set_task_header_body \{text = qs(0xc2e4064d)}
	training_show_lesson_header
	training_show_task_header
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			1
			0
			0
		]
		block_updown = 0}
	jam_studio_element :settags \{nudge_controls = [
			nudge_all
		]}
	<start_time> = 0
	<end_time> = 2000
	ghmix_tutorial_highlight start_time = <start_time> end_time = <end_time>
	block \{type = ghmix_start_nudge}
	training_add_lesson_body_text \{number = 2
		text = qs(0xa8bbe9e5)}
	jam_studio_show_helper_arrow target = <end_time>
	begin
	if (($jam_highway_play_time > (<end_time> -100)) && ($jam_highway_play_time < (<end_time> + 100)))
		controllerdebounce \{x}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	jam_studio_element :settags \{nudge_controls = [
			cancel
		]}
	training_add_lesson_body_text \{number = 3
		text = qs(0x2aa39f96)}
	block \{type = ghmix_stop_nudge}
	jam_studio_element :settags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	training_hide_lesson_header
endscript

script ghmix_tutorial_highlight \{start_time = 0
		end_time = 500
		color = [
			10
			255
			10
			50
		]}
	if screenelementexists \{id = ghmix_tut_highlight}
		destroyscreenelement \{id = ghmix_tut_highlight}
	endif
	low_pos = ((<start_time> / 1000.0) * $jam_highway_pixels_per_second)
	high_pos = ((<end_time> / 1000.0) * $jam_highway_pixels_per_second)
	highlight_pos = (<low_pos> + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
	createscreenelement {
		type = spriteelement
		parent = jam_highway_container
		id = ghmix_tut_highlight
		texture = white
		just = [left top]
		rgba = <color>
		pos = (<low_pos> + (0.0, 55.0))
		dims = ((0.0, 175.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
		z_priority = 10
	}
endscript

script ghmix_tutorial_force_snap \{setting = 3}
	change jam_current_quantize = <setting>
	jam_studio_element :setprops snap_text = ($jam_quantize [$jam_current_quantize].name_text)
endscript

script jam_studio_show_helper_arrow 
	killspawnedscript \{name = jam_studio_show_helper_arrow_spawned}
	spawnscriptnow jam_studio_show_helper_arrow_spawned id = jam_tutorial_spawns params = {<...>}
endscript

script jam_studio_cancel_helper_arrow 
	killspawnedscript \{name = jam_studio_show_helper_arrow_spawned}
endscript

script jam_studio_show_helper_arrow_spawned \{target = 2000
		time = 5}
	begin
	if ($jam_highway_play_time < (<target> -500))
		jam_tutorial_add_arrow \{pos = (550.0, 150.0)
			life = 1
			scale = 0.5
			rot = 180}
	elseif ($jam_highway_play_time > (<target> + 200))
		jam_tutorial_add_arrow \{pos = (550.0, 550.0)
			life = 1
			scale = 0.5}
	else
	endif
	wait <time> seconds
	repeat
endscript
