
script ghmix_tutorial_live_rec 
	jam_studio_element :SetTags \{challenges_complete = 0
		challenges_req = 3}
	jam_studio_element :SetTags \{controls_enabled = [
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
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps alpha = 0
	endif
	wait \{1.5
		second}
	tutorial_show_title \{Title = qs(0x39538c1a)}
	wait \{1
		second}
	tutorial_play_sound \{Sound = 'Tut_RS_GHMix_01_BAS'}
	wait \{3
		seconds}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'
		expression = 2}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_GHMix_01_BAS'}
	wait \{0.5
		second}
	tutorial_show_narrator \{narrator = 'bassist'
		expression = 0}
	tutorial_play_sound \{Sound = 'Tut_RS_GHMix_02_BAS'
		wait}
	tutorial_hide_narrator
	tutorial_show_title \{Title = qs(0xdf38b19a)}
	wait \{1
		second}
	tutorial_play_sound \{Sound = 'Tut_RS_LiveRec_01_BAS'}
	wait \{3
		seconds}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_LiveRec_01_BAS'}
	tutorial_hide_narrator \{narrator = 'bassist'}
	tutorial_hide_placeholder
	ghmix_tutorial_live_rec_challenge
	tutorial_show_narrator \{narrator = 'bassist'
		expression = 0}
	tutorial_play_sound \{Sound = 'Tut_RS_LiveRec_02_BAS'
		wait}
	tutorial_hide_narrator
	tutorial_hide_placeholder
	jam_tutorial_lesson_complete
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_studio_element :SetTags {challenges_complete = <challenges_complete>}
	jam_tutorial_segment_cleanup
	Change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_live_rec_challenge 
	jam_control_goto \{option_index = 3}
	ghmix_tutorial_force_snap \{setting = 6}
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x9bde6454)}
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0xe55ab6d0)}
	tutorial_set_task_header_body \{text = qs(0x7a002b7c)}
	<notes_required> = 10
	tutorial_show_lesson_header
	tutorial_show_task_header
	tutorial_display_notes_hit notes_hit = 0 notes_required = <notes_required>
	begin
	Block \{type = ghmix_snap_changed}
	if ($jam_current_quantize = 4)
		ControllerDebounce \{left}
		ControllerDebounce \{right}
		break
	endif
	repeat
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0xa30e9861)}
	jam_studio_element :SetTags \{controls_enabled = [
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
	AppendSuffixToChecksum base = <gem_array> SuffixString = <suffix>
	notetrack_size_before = ($<appended_id>)
	Block \{type = ghmix_start_rec}
	tutorial_add_lesson_body_text \{number = 3
		text = qs(0x1fb1c505)}
	begin
	<num_new_notes> = ((($<appended_id>) - <notetrack_size_before>) / 2)
	if (<num_new_notes> >= <notes_required>)
		tutorial_display_notes_hit notes_hit = <notes_required> notes_required = <notes_required>
		break
	else
		tutorial_display_notes_hit notes_hit = <num_new_notes> notes_required = <notes_required>
	endif
	wait \{1
		gameframe}
	repeat
	tutorial_add_lesson_body_text \{number = 4
		text = qs(0x77caf33b)}
	Block \{type = ghmix_stop_rec}
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_play_sound \{Sound = 'Tut_RS_LiveRec_04_BAS'
		wait}
	tutorial_hide_lesson_header
endscript

script ghmix_tutorial_step_rec 
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_show_title \{Title = qs(0x34edebf6)}
	wait \{1
		second}
	tutorial_play_sound \{Sound = 'Tut_RS_StepRec_01_BAS'}
	wait \{3
		seconds}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_StepRec_01_BAS'}
	tutorial_hide_narrator \{narrator = 'bassist'}
	tutorial_hide_placeholder
	ghmix_tutorial_step_rec_switch_challenge
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_play_sound \{Sound = 'Tut_RS_StepRec_02_BAS'
		wait}
	tutorial_hide_narrator \{narrator = 'bassist'}
	tutorial_hide_placeholder
	ghmix_tutorial_step_rec_challenge
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_play_sound \{Sound = 'Tut_RS_StepRec_03_BAS'
		wait}
	tutorial_hide_narrator \{narrator = 'bassist'}
	tutorial_hide_placeholder
	jam_tutorial_lesson_complete
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_studio_element :SetTags {challenges_complete = <challenges_complete>}
	jam_tutorial_segment_cleanup
	Change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_step_rec_switch_challenge 
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0xb778e832)}
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0x43ddadac)}
	tutorial_set_task_header_body \{text = qs(0x9faebecd)}
	tutorial_show_lesson_header
	tutorial_show_task_header
	begin
	if ($jam_control_selected = 13)
		jam_studio_element :SetTags \{block_updown = 1}
		ControllerDebounce \{up}
		ControllerDebounce \{down}
		break
	endif
	wait \{1
		gameframe}
	repeat
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0xba8d0fed)}
	begin
	if ($jam_current_track = 2)
		ControllerDebounce \{x}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_hide_lesson_header
endscript

script ghmix_tutorial_step_rec_challenge 
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0x81a770e1)}
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0x22aaab84)}
	tutorial_set_task_header_body \{text = qs(0x355d28ac)}
	<notes_required> = 10
	tutorial_show_lesson_header
	tutorial_show_task_header
	tutorial_display_notes_hit notes_hit = 0 notes_required = <notes_required>
	begin
	if ($jam_control_selected = 4)
		jam_studio_element :SetTags \{block_updown = 1}
		ControllerDebounce \{up}
		ControllerDebounce \{down}
		break
	endif
	wait \{1
		gameframe}
	repeat
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0x834015b8)}
	<gem_array> = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum base = <gem_array> SuffixString = <suffix>
	notetrack_size_before = ($<appended_id>)
	Block \{type = ghmix_start_step}
	tutorial_add_lesson_body_text \{number = 3
		text = qs(0x1fb1c505)}
	begin
	<num_new_notes> = ((($<appended_id>) - <notetrack_size_before>) / 2)
	if (<num_new_notes> >= <notes_required>)
		tutorial_display_notes_hit notes_hit = <notes_required> notes_required = <notes_required>
		break
	else
		tutorial_display_notes_hit notes_hit = <num_new_notes> notes_required = <notes_required>
	endif
	wait \{1
		gameframe}
	repeat
	tutorial_add_lesson_body_text \{number = 4
		text = qs(0x77caf33b)}
	Block \{type = ghmix_stop_step}
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_play_sound \{Sound = 'Tut_RS_StepRec_05_BAS'
		wait}
	tutorial_hide_lesson_header
endscript

script ghmix_tutorial_delete 
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_show_title \{Title = qs(0xf33198ca)}
	wait \{1
		second}
	tutorial_play_sound \{Sound = 'Tut_RS_Del_01_BAS'}
	wait \{3
		seconds}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Del_01_BAS'}
	tutorial_hide_narrator \{narrator = 'bassist'}
	tutorial_hide_placeholder
	ghmix_tutorial_delete_challenge
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_play_sound \{Sound = 'Tut_RS_Del_03_BAS'
		wait}
	tutorial_hide_narrator \{narrator = 'bassist'}
	tutorial_hide_placeholder
	jam_tutorial_lesson_complete
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{tutorials
			params = {
				rs_ghmix_editing_lesson = complete
			}}
	endif
	jam_tutorial_segment_cleanup
	Change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_delete_challenge 
	tutorial_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0x448b1a21)}
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0x70fc1e48)}
	tutorial_set_task_header_body \{text = qs(0xef4901df)}
	tutorial_show_lesson_header
	tutorial_show_task_header
	jam_studio_element :SetTags \{controls_enabled = [
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
		jam_studio_element :SetTags \{controls_enabled = [
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
		ControllerDebounce \{x}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0x571c432c)}
	tutorial_play_sound \{Sound = 'Tut_RS_Del_02_BAS'}
	jam_studio_element :SetTags \{controls_enabled = [
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
		jam_studio_element :SetTags \{block_updown = 1}
		ControllerDebounce \{up}
		ControllerDebounce \{down}
		break
	endif
	wait \{1
		gameframe}
	repeat
	Block \{type = ghmix_delete_start}
	tutorial_add_lesson_body_text \{number = 3
		text = qs(0x311853b3)}
	jam_studio_element :SetTags \{delete_controls = [
			select
		]}
	jam_studio_show_helper_arrow target = <bad_solo_end_time>
	begin
	if (($jam_highway_play_time > (<bad_solo_end_time> -100)) && ($jam_highway_play_time < (<bad_solo_end_time> + 100)))
		ControllerDebounce \{up}
		ControllerDebounce \{down}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	tutorial_play_sound \{Sound = 'Tut_RS_LiveRec_04_BAS'}
	jam_studio_element :SetTags \{delete_controls = [
			delete
		]}
	tutorial_add_lesson_body_text \{number = 4
		text = qs(0x42785339)}
	Block \{type = ghmix_delete_done}
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_hide_lesson_header
endscript

script ghmix_tutorial_copypaste 
	jam_studio_element :SetTags \{challenges_complete = 0
		challenges_req = 3}
	jam_studio_element :SetTags \{controls_enabled = [
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
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps alpha = 0
	endif
	tutorial_show_title \{Title = qs(0x6635f479)}
	wait \{1
		second}
	tutorial_play_sound \{Sound = 'Tut_RS_Copy_01_BAS'}
	wait \{3
		seconds}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Copy_01_BAS'}
	tutorial_hide_narrator \{narrator = 'bassist'}
	tutorial_hide_placeholder
	ghmix_tutorial_copypaste_copy_challenge
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_play_sound \{Sound = 'Tut_RS_Copy_02_BAS'
		wait}
	tutorial_hide_narrator \{narrator = 'bassist'}
	tutorial_hide_placeholder
	ghmix_tutorial_copypaste_paste_challenge
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_play_sound \{Sound = 'Tut_RS_Copy_04_BAS'
		wait}
	tutorial_hide_narrator \{narrator = 'bassist'}
	tutorial_hide_placeholder
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_studio_element :SetTags {challenges_complete = <challenges_complete>}
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	Change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_copypaste_copy_challenge 
	tutorial_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0xb90c5290)}
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0xaa739555)}
	tutorial_set_task_header_body \{text = qs(0x1991b14c)}
	tutorial_show_lesson_header
	tutorial_show_task_header
	jam_studio_element :SetTags \{controls_enabled = [
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
		jam_studio_element :SetTags \{controls_enabled = [
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
		ControllerDebounce \{x}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0x04084d04)}
	jam_studio_element :SetTags \{controls_enabled = [
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
	jam_studio_element :SetTags \{copy_controls = [
			Strum
		]}
	Block \{type = ghmix_start_copy}
	tutorial_add_lesson_body_text \{number = 3
		text = qs(0xb89f5d8e)}
	jam_studio_show_helper_arrow target = <chorus_end_time>
	begin
	if (($jam_highway_play_time > (<chorus_end_time> -100)) && ($jam_highway_play_time < (<chorus_end_time> + 100)))
		ControllerDebounce \{up}
		ControllerDebounce \{down}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	tutorial_add_lesson_body_text \{number = 4
		text = qs(0x22cfa0f3)}
	jam_studio_element :SetTags \{copy_controls = [
			copy
		]}
	Block \{type = ghmix_stop_copy}
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_hide_lesson_header
endscript

script ghmix_tutorial_copypaste_paste_challenge 
	tutorial_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x24495be1)}
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0xd23943a6)}
	tutorial_set_task_header_body \{text = qs(0x0f693743)}
	tutorial_show_lesson_header
	tutorial_show_task_header
	jam_studio_element :SetTags \{controls_enabled = [
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
		jam_studio_element :SetTags \{controls_enabled = [
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
		ControllerDebounce \{x}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0xc8717e90)}
	tutorial_play_sound \{Sound = 'Tut_RS_Copy_03_BAS'}
	jam_studio_element :SetTags \{controls_enabled = [
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
	Block \{type = ghmix_paste_start}
	tutorial_add_lesson_body_text \{number = 3
		text = qs(0x3fb1ec42)}
	jam_studio_element :SetTags \{paste_controls = [
			paste_one
		]}
	Block \{type = ghmix_paste_pasted}
	tutorial_add_lesson_body_text \{number = 4
		text = qs(0x602a3034)}
	jam_studio_element :SetTags \{paste_controls = [
			cancel
		]}
	Block \{type = ghmix_paste_done}
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_hide_lesson_header
endscript

script ghmix_tutorial_loops 
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_show_title \{Title = qs(0xbaa6e9d3)}
	wait \{1
		second}
	tutorial_play_sound \{Sound = 'Tut_RS_Loop_01_BAS'}
	wait \{3
		seconds}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Loop_01_BAS'}
	tutorial_hide_narrator \{narrator = 'bassist'}
	tutorial_hide_placeholder
	ghmix_tutorial_lay_loop_challenge
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_play_sound \{Sound = 'Tut_RS_Loop_02_BAS'
		wait}
	tutorial_hide_narrator \{narrator = 'bassist'}
	tutorial_hide_placeholder
	ghmix_tutorial_loops_challenge
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_play_sound \{Sound = 'Tut_RS_Loop_03_BAS'
		wait}
	tutorial_hide_narrator \{narrator = 'bassist'}
	jam_tutorial_lesson_complete
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_studio_element :SetTags {challenges_complete = <challenges_complete>}
	jam_tutorial_segment_cleanup
	Change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_lay_loop_challenge 
	tutorial_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0x93e1d59c)}
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0xa51135ae)}
	tutorial_set_task_header_body \{text = qs(0xe1c6bbee)}
	tutorial_show_lesson_header
	tutorial_show_task_header
	<start_time> = 2000
	<end_time> = 6000
	ghmix_tutorial_highlight start_time = <start_time> end_time = <end_time>
	ghmix_tutorial_force_snap \{setting = 2}
	jam_studio_element :SetTags \{controls_enabled = [
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
		ControllerDebounce \{x}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0xbe0c9bc1)}
	jam_studio_element :SetTags \{controls_enabled = [
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
	Block \{type = ghmix_start_loop}
	tutorial_add_lesson_body_text \{number = 3
		text = qs(0xf00fcfb1)}
	jam_studio_element :SetTags \{loop_controls = [
			select_area
		]}
	jam_studio_show_helper_arrow target = <end_time>
	begin
	if (($jam_highway_play_time > (<end_time> -100)) && ($jam_highway_play_time < (<end_time> + 100)))
		ControllerDebounce \{up}
		ControllerDebounce \{down}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	tutorial_add_lesson_body_text \{number = 4
		text = qs(0x32c913b6)}
	jam_studio_element :SetTags \{loop_controls = [
			set_loop
		]}
	Block \{type = ghmix_loop_set}
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_hide_lesson_header
endscript

script ghmix_tutorial_loops_challenge 
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :Desc_ResolveAlias \{name = percussion_box}
			<resolved_id> :SetProps alpha = 0
		endif
	endif
	ghmix_tutorial_force_snap \{setting = 4}
	tutorial_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0xcea13225)}
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0x05208678)}
	tutorial_set_task_header_body \{text = qs(0xf0356cc3)}
	tutorial_show_lesson_header
	tutorial_show_task_header
	jam_studio_element :SetTags \{controls_enabled = [
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
	Block \{type = ghmix_start_rec}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0x9e30ca06)}
	tutorial_add_lesson_body_text \{number = 3
		text = qs(0xe3fa127c)}
	tutorial_add_lesson_body_text \{number = 4
		text = qs(0xb2feef47)}
	<gem_array> = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum base = <gem_array> SuffixString = <suffix>
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
	tutorial_add_lesson_body_text \{number = 5
		text = qs(0x77caf33b)}
	Block \{type = ghmix_stop_rec}
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_hide_lesson_header
endscript

script ghmix_tutorial_nudge 
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_show_title \{Title = qs(0x0f8a8a9b)}
	wait \{1
		second}
	tutorial_play_sound \{Sound = 'Tut_RS_Nudge_01_BAS'}
	wait \{3
		seconds}
	tutorial_destroy_title
	tutorial_show_narrator \{narrator = 'bassist'}
	tutorial_wait_for_sound \{Sound = 'Tut_RS_Nudge_01_BAS'}
	tutorial_hide_narrator \{narrator = 'bassist'}
	tutorial_hide_placeholder
	ghmix_tutorial_nudge_challenge
	tutorial_play_sound \{Sound = 'Tut_RS_Nudge_02_BAS'
		wait}
	tutorial_hide_narrator \{narrator = 'bassist'}
	tutorial_hide_placeholder
	jam_tutorial_lesson_complete
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{tutorials
			params = {
				rs_ghmix_pro_techniques_tools_lesson = complete
			}}
	endif
	jam_tutorial_segment_cleanup
	Change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_nudge_challenge 
	tutorial_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = qs(0xa743fb6f)}
	tutorial_add_lesson_body_text \{number = 1
		text = qs(0xad2acbd5)}
	tutorial_set_task_header_body \{text = qs(0xc2e4064d)}
	tutorial_show_lesson_header
	tutorial_show_task_header
	jam_studio_element :SetTags \{controls_enabled = [
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
	jam_studio_element :SetTags \{nudge_controls = [
			nudge_all
		]}
	<start_time> = 0
	<end_time> = 2000
	ghmix_tutorial_highlight start_time = <start_time> end_time = <end_time>
	Block \{type = ghmix_start_nudge}
	tutorial_add_lesson_body_text \{number = 2
		text = qs(0xe4d6737d)}
	jam_studio_show_helper_arrow target = <end_time>
	begin
	if (($jam_highway_play_time > (<end_time> -100)) && ($jam_highway_play_time < (<end_time> + 100)))
		ControllerDebounce \{x}
		break
	endif
	wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	jam_studio_element :SetTags \{nudge_controls = [
			cancel
		]}
	tutorial_add_lesson_body_text \{number = 3
		text = qs(0x8017d44f)}
	Block \{type = ghmix_stop_nudge}
	jam_studio_element :SetTags \{controls_enabled = [
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
	tutorial_hide_lesson_header
endscript

script ghmix_tutorial_highlight \{start_time = 0
		end_time = 500
		Color = [
			10
			255
			10
			50
		]}
	if ScreenElementExists \{id = ghmix_tut_highlight}
		DestroyScreenElement \{id = ghmix_tut_highlight}
	endif
	low_pos = ((<start_time> / 1000.0) * $jam_highway_pixels_per_second)
	high_pos = ((<end_time> / 1000.0) * $jam_highway_pixels_per_second)
	highlight_pos = (<low_pos> + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
	CreateScreenElement {
		type = SpriteElement
		parent = jam_highway_container
		id = ghmix_tut_highlight
		texture = white
		just = [left top]
		rgba = <Color>
		Pos = (<low_pos> + (0.0, 55.0))
		dims = ((0.0, 175.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
		z_priority = 10
	}
endscript

script ghmix_tutorial_force_snap \{setting = 3}
	Change jam_current_quantize = <setting>
	jam_studio_element :SetProps snap_text = ($jam_quantize [$jam_current_quantize].name_text)
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
		jam_tutorial_add_arrow \{Pos = (550.0, 150.0)
			life = 1
			scale = 0.5
			rot = 180}
	elseif ($jam_highway_play_time > (<target> + 200))
		jam_tutorial_add_arrow \{Pos = (550.0, 550.0)
			life = 1
			scale = 0.5}
	else
	endif
	wait <time> seconds
	repeat
endscript
