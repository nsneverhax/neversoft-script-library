
script ghmix_tutorial_live_rec 
	training_create_narrator_icons
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
	lessonheader :se_setprops \{Pos = (100.0, 0.0)}
	create_ui_frame \{frame_dims = (436.0, 320.0)
		center_pos = (983.0, 265.0)
		parent = training_header_container
		frame_rgba = [
			50
			30
			30
			150
		]
		fill_rgba = [
			0
			0
			0
			150
		]
		z_priority = 79.9
		offset_top = 16
		offset_side = 16
		min_fill_pad_width = 73
		min_fill_pad_height = 129
		tex_param = 'simple'
		suffix = 0}
	0xc1c4e84c \{0xd607e2e6 = 1
		mode = tutorials
		tutorial = jam
		Force = 1}
	if jam_studio_element :desc_resolvealias \{Name = dialog_box}
		<resolved_id> :SetProps alpha = 0
	endif
	Wait \{1.5
		Second}
	Change \{0xbcacb187 = 0}
	training_show_title \{title = qs(0x39538c1a)}
	Wait \{1
		Second}
	0x4de05aff \{mode = 0xcf1935b4}
	training_play_sound \{Sound = 'Tut_RS_GHMix_01_BAS'}
	0x1baed16a
	0xd53de9cc
	Wait \{3
		Seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'
		expression = 2}
	training_wait_for_sound \{Sound = 'Tut_RS_GHMix_01_BAS'}
	Wait \{0.5
		Second}
	training_show_narrator \{narrator = 'bassist'
		expression = 0}
	training_play_sound \{Sound = 'Tut_RS_GHMix_02_BAS'
		Wait}
	training_hide_narrator
	training_show_title \{title = qs(0xdf38b19a)}
	Wait \{1
		Second}
	0x4de05aff \{mode = 0x8301d424}
	training_play_sound \{Sound = 'Tut_RS_LiveRec_01_BAS'}
	0x1baed16a
	0xd53de9cc
	Wait \{3
		Seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_LiveRec_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_live_rec_challenge
	training_show_narrator \{narrator = 'bassist'
		expression = 0}
	training_play_sound \{Sound = 'Tut_RS_LiveRec_02_BAS'
		Wait}
	training_hide_narrator
	training_hide_placeholder
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
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = qs(0x9bde6454)}
	lessonheader :0x8e6af868 \{child = lesson_text
		rgba = [
			220
			220
			220
			255
		]}
	if (controllerhasdpad controller = $primary_controller)
		training_add_lesson_body_text \{number = 1
			text = qs(0x2afc5ae9)}
		current_step_num = 2
	else
		ghmix_tutorial_force_snap \{setting = 4}
		current_step_num = 1
	endif
	training_set_task_header_body \{text = qs(0x7a002b7c)}
	<notes_required> = 10
	training_show_lesson_header
	training_show_task_header
	training_display_notes_hit notes_hit = 0 notes_required = <notes_required>
	if (controllerhasdpad controller = $primary_controller)
		begin
		Block \{Type = ghmix_snap_changed}
		if ($jam_current_quantize = 4)
			ControllerDebounce \{left}
			ControllerDebounce \{right}
			break
		endif
		repeat
	endif
	training_add_lesson_body_text number = <current_step_num> text = qs(0x67cb9e93)
	current_step_num = (<current_step_num> + 1)
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
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size_before = ($<appended_id>)
	Block \{Type = ghmix_start_rec}
	training_add_lesson_body_text number = <current_step_num> text = qs(0x1fb1c505)
	current_step_num = (<current_step_num> + 1)
	begin
	<num_new_notes> = ((($<appended_id>) - <notetrack_size_before>) / 2)
	if (<num_new_notes> >= <notes_required>)
		training_display_notes_hit notes_hit = <notes_required> notes_required = <notes_required>
		break
	else
		training_display_notes_hit notes_hit = <num_new_notes> notes_required = <notes_required>
	endif
	Wait \{1
		gameframe}
	repeat
	training_add_lesson_body_text number = <current_step_num> text = qs(0x77caf33b)
	Block \{Type = ghmix_stop_rec}
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
	training_play_sound \{Sound = 'Tut_RS_LiveRec_04_BAS'
		Wait}
	training_hide_lesson_header
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
	training_show_title \{title = qs(0x34edebf6)}
	Wait \{1
		Second}
	0x4de05aff \{mode = 0xed5863b9}
	training_play_sound \{Sound = 'Tut_RS_StepRec_01_BAS'}
	0xeb3a43f7
	0xd53de9cc
	Wait \{3
		Seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_StepRec_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_step_rec_switch_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_StepRec_02_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_step_rec_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_StepRec_03_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
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
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x3cbb46a6)}
	lessonheader :0x8e6af868 \{child = lesson_text
		rgba = [
			220
			220
			220
			255
		]}
	training_add_lesson_body_text \{number = 1
		text = qs(0x43ddadac)}
	training_set_task_header_body \{text = qs(0x9faebecd)}
	training_show_lesson_header
	training_show_task_header
	begin
	if ($jam_control_selected = 13)
		jam_studio_element :SetTags \{block_updown = 1}
		ControllerDebounce \{up}
		ControllerDebounce \{down}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	training_add_lesson_body_text \{number = 2
		text = qs(0x7564ed22)}
	begin
	if ($jam_current_track = 2)
		ControllerDebounce \{X}
		break
	endif
	Wait \{1
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
	training_hide_lesson_header
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
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = qs(0x81a770e1)}
	lessonheader :0x8e6af868 \{child = lesson_text
		rgba = [
			220
			220
			220
			255
		]}
	training_add_lesson_body_text \{number = 1
		text = qs(0x22aaab84)}
	training_set_task_header_body \{text = qs(0x355d28ac)}
	<notes_required> = 10
	training_show_lesson_header
	training_show_task_header
	training_display_notes_hit notes_hit = 0 notes_required = <notes_required>
	begin
	if ($jam_control_selected = 4)
		jam_studio_element :SetTags \{block_updown = 1}
		ControllerDebounce \{up}
		ControllerDebounce \{down}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	training_add_lesson_body_text \{number = 2
		text = qs(0x67cb9e93)}
	<gem_array> = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size_before = ($<appended_id>)
	Block \{Type = ghmix_start_step}
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
	Wait \{1
		gameframe}
	repeat
	training_add_lesson_body_text \{number = 4
		text = qs(0x77caf33b)}
	Block \{Type = ghmix_stop_step}
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
	training_play_sound \{Sound = 'Tut_RS_StepRec_05_BAS'
		Wait}
	training_hide_lesson_header
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
	Wait \{1
		gameframe}
	repeat
	training_show_title \{title = qs(0xf33198ca)}
	Wait \{1
		Second}
	0x4de05aff \{mode = 0xdcc2ca89}
	training_play_sound \{Sound = 'Tut_RS_Del_01_BAS'}
	0xeb3a43f7
	0xd53de9cc
	Wait \{3
		Seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_Del_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_delete_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_Del_03_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	jam_tutorial_lesson_complete
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{practice
			params = {
				rs_ghmix_editing_lesson = complete
			}}
	endif
	jam_tutorial_segment_cleanup
	Change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_delete_challenge 
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = $0x68c1bbc5}
	lessonheader :0x8e6af868 \{child = lesson_text
		rgba = [
			220
			220
			220
			255
		]}
	training_add_lesson_body_text \{number = 1
		text = qs(0x70fc1e48)}
	training_set_task_header_body \{text = qs(0xef4901df)}
	training_show_lesson_header
	training_show_task_header
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
		ControllerDebounce \{X}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 2
		text = qs(0x571c432c)}
	training_play_sound \{Sound = 'Tut_RS_Del_02_BAS'}
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
	Wait \{1
		gameframe}
	repeat
	Block \{Type = ghmix_delete_start}
	training_add_lesson_body_text \{number = 3
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
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_play_sound \{Sound = 'Tut_RS_LiveRec_04_BAS'}
	jam_studio_element :SetTags \{delete_controls = [
			delete
		]}
	training_add_lesson_body_text \{number = 4
		text = qs(0x42785339)}
	Block \{Type = ghmix_delete_done}
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
	training_hide_lesson_header
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
	lessonheader :se_setprops \{Pos = (100.0, 0.0)}
	create_ui_frame \{frame_dims = (436.0, 320.0)
		center_pos = (983.0, 265.0)
		parent = training_header_container
		frame_rgba = [
			50
			30
			30
			150
		]
		fill_rgba = [
			0
			0
			0
			150
		]
		z_priority = 79.9
		offset_top = 16
		offset_side = 16
		min_fill_pad_width = 73
		min_fill_pad_height = 129
		tex_param = 'simple'
		suffix = 0}
	0xc1c4e84c \{0xd607e2e6 = 1
		mode = tutorials
		tutorial = jam
		Force = 1}
	ghmix_tutorial_force_snap \{setting = 3}
	begin
	if ($jam_current_track = 4)
		break
	endif
	jam_recording_switch_instrument
	Wait \{1
		gameframe}
	repeat
	if jam_studio_element :desc_resolvealias \{Name = dialog_box}
		<resolved_id> :SetProps alpha = 0
	endif
	training_show_title \{title = qs(0x6635f479)}
	Wait \{1
		Second}
	Change \{0xbcacb187 = 0}
	0x4de05aff \{mode = 0xcb56d0e4}
	training_play_sound \{Sound = 'Tut_RS_Copy_01_BAS'}
	0x1baed16a
	0xd53de9cc
	Wait \{3
		Seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_Copy_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_copypaste_copy_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_Copy_02_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_copypaste_paste_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_Copy_04_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_studio_element :SetTags {challenges_complete = <challenges_complete>}
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	Change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_copypaste_copy_challenge 
	training_set_lesson_header_text \{number = qs(0x22ee76e7)
		text = $0xbc6b12c4}
	lessonheader :0x8e6af868 \{child = lesson_text
		rgba = [
			220
			220
			220
			255
		]}
	training_add_lesson_body_text \{number = 1
		text = qs(0xaa739555)}
	training_set_task_header_body \{text = qs(0x1991b14c)}
	training_show_lesson_header
	training_show_task_header
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
		ControllerDebounce \{X}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 2
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
			strum
		]}
	Block \{Type = ghmix_start_copy}
	training_add_lesson_body_text \{number = 3
		text = qs(0xb89f5d8e)}
	jam_studio_show_helper_arrow target = <chorus_end_time>
	begin
	if (($jam_highway_play_time > (<chorus_end_time> -100)) && ($jam_highway_play_time < (<chorus_end_time> + 100)))
		ControllerDebounce \{up}
		ControllerDebounce \{down}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 4
		text = qs(0x22cfa0f3)}
	jam_studio_element :SetTags \{copy_controls = [
			copy
		]}
	Block \{Type = ghmix_stop_copy}
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
	training_hide_lesson_header
endscript

script ghmix_tutorial_copypaste_paste_challenge 
	training_set_lesson_header_text \{number = qs(0x09c32524)
		text = qs(0x24495be1)}
	lessonheader :0x8e6af868 \{child = lesson_text
		rgba = [
			220
			220
			220
			255
		]}
	training_add_lesson_body_text \{number = 1
		text = qs(0xd23943a6)}
	training_set_task_header_body \{text = qs(0x0f693743)}
	training_show_lesson_header
	training_show_task_header
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
		ControllerDebounce \{X}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 2
		text = qs(0xc8717e90)}
	training_play_sound \{Sound = 'Tut_RS_Copy_03_BAS'}
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
	Block \{Type = ghmix_paste_start}
	training_add_lesson_body_text \{number = 3
		text = qs(0x66535e18)}
	jam_studio_element :SetTags \{paste_controls = [
			paste_one
		]}
	Block \{Type = ghmix_paste_pasted}
	training_add_lesson_body_text \{number = 4
		text = qs(0x9e50944f)}
	jam_studio_element :SetTags \{paste_controls = [
			cancel
		]}
	Block \{Type = ghmix_paste_done}
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
	training_hide_lesson_header
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
	Wait \{1
		gameframe}
	repeat
	jam_highway_move_beginning
	training_show_title \{title = qs(0xbaa6e9d3)}
	Wait \{1
		Second}
	0x4de05aff \{mode = 0x27b37688}
	training_play_sound \{Sound = 'Tut_RS_Loop_01_BAS'}
	0x1baed16a
	0xd53de9cc
	Wait \{3
		Seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_Loop_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_lay_loop_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_Loop_02_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_loops_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_Loop_03_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	jam_tutorial_lesson_complete
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_studio_element :SetTags {challenges_complete = <challenges_complete>}
	jam_tutorial_segment_cleanup
	Change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_lay_loop_challenge 
	training_set_lesson_header_text \{number = qs(0x10d81465)
		text = $0x3d0610f4}
	lessonheader :0x8e6af868 \{child = lesson_text
		rgba = [
			220
			220
			220
			255
		]}
	training_add_lesson_body_text \{number = 1
		text = qs(0xa51135ae)}
	training_set_task_header_body \{text = qs(0xe1c6bbee)}
	training_show_lesson_header
	training_show_task_header
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
		ControllerDebounce \{X}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 2
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
	Block \{Type = ghmix_start_loop}
	training_add_lesson_body_text \{number = 3
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
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 4
		text = qs(0x32c913b6)}
	jam_studio_element :SetTags \{loop_controls = [
			set_loop
		]}
	Block \{Type = ghmix_loop_set}
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
	training_hide_lesson_header
endscript

script ghmix_tutorial_loops_challenge 
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :desc_resolvealias \{Name = percussion_box}
			<resolved_id> :SetProps alpha = 0
		endif
	endif
	ghmix_tutorial_force_snap \{setting = 4}
	training_set_lesson_header_text \{number = qs(0x5f9982a2)
		text = qs(0xcea13225)}
	lessonheader :0x8e6af868 \{child = lesson_text
		rgba = [
			220
			220
			220
			255
		]}
	training_add_lesson_body_text \{number = 1
		text = qs(0x05208678)}
	training_set_task_header_body \{text = qs(0xf0356cc3)}
	training_show_lesson_header
	training_show_task_header
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
	Block \{Type = ghmix_start_rec}
	training_add_lesson_body_text \{number = 2
		text = qs(0x50265a39)}
	training_add_lesson_body_text \{number = 3
		text = qs(0x4b2b6512)}
	training_add_lesson_body_text \{number = 4
		text = qs(0xb2feef47)}
	<gem_array> = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	<notetrack_size_before> = ($<appended_id>)
	<notes_required> = 3
	begin
	<num_new_notes> = ((($<appended_id>) - <notetrack_size_before>) / 2)
	if (<num_new_notes> >= <notes_required>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	training_add_lesson_body_text \{number = 5
		text = qs(0x77caf33b)}
	Block \{Type = ghmix_stop_rec}
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
	training_hide_lesson_header
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
	Wait \{1
		gameframe}
	repeat
	jam_highway_move_beginning
	training_show_title \{title = qs(0x0f8a8a9b)}
	Wait \{1
		Second}
	0x4de05aff \{mode = 0x922ea25f}
	training_play_sound \{Sound = 'Tut_RS_Nudge_01_BAS'}
	0x1baed16a
	0xd53de9cc
	Wait \{3
		Seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_Nudge_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_nudge_challenge
	training_play_sound \{Sound = 'Tut_RS_Nudge_02_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	jam_tutorial_lesson_complete
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{practice
			params = {
				rs_ghmix_pro_techniques_tools_lesson = complete
			}}
	endif
	jam_tutorial_segment_cleanup
	Change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_nudge_challenge 
	training_set_lesson_header_text \{number = qs(0x4682b3e3)
		text = $0x911747cf}
	lessonheader :0x8e6af868 \{child = lesson_text
		rgba = [
			220
			220
			220
			255
		]}
	training_add_lesson_body_text \{number = 1
		text = qs(0xad2acbd5)}
	training_set_task_header_body \{text = qs(0xc2e4064d)}
	training_show_lesson_header
	training_show_task_header
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
	Block \{Type = ghmix_start_nudge}
	training_add_lesson_body_text \{number = 2
		text = qs(0x7b177ddd)}
	jam_studio_show_helper_arrow target = <end_time>
	begin
	if (($jam_highway_play_time > (<end_time> -100)) && ($jam_highway_play_time < (<end_time> + 100)))
		ControllerDebounce \{X}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	jam_studio_element :SetTags \{nudge_controls = [
			cancel
		]}
	training_add_lesson_body_text \{number = 3
		text = qs(0x19925f64)}
	Block \{Type = ghmix_stop_nudge}
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
	training_hide_lesson_header
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
	second_end_time = -1
	if ScreenElementExists \{id = ghmix_tut_highlight2}
		DestroyScreenElement \{id = ghmix_tut_highlight2}
	endif
	if ((<end_time> - <start_time>) > 12000)
		<second_end_time> = <end_time>
		<end_time> = (<start_time> + 12000)
	endif
	low_pos = ((<start_time> / 1000.0) * $jam_highway_pixels_per_second)
	high_pos = ((<end_time> / 1000.0) * $jam_highway_pixels_per_second)
	highlight_pos = (<low_pos> + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
	CreateScreenElement {
		Type = SpriteElement
		parent = jam_highway_container
		id = ghmix_tut_highlight
		texture = white
		just = [left top]
		rgba = <Color>
		Pos = (<low_pos> + (0.0, 55.0))
		dims = ((0.0, 175.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
		z_priority = 10
	}
	if (<second_end_time> > 0)
		start_time = <end_time>
		end_time = <second_end_time>
		low_pos = ((<start_time> / 1000.0) * $jam_highway_pixels_per_second)
		high_pos = ((<end_time> / 1000.0) * $jam_highway_pixels_per_second)
		highlight_pos = (<low_pos> + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
		CreateScreenElement {
			Type = SpriteElement
			parent = jam_highway_container
			id = ghmix_tut_highlight2
			texture = white
			just = [left top]
			rgba = <Color>
			Pos = (<low_pos> + (0.0, 55.0))
			dims = ((0.0, 175.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
			z_priority = 10
		}
	endif
endscript

script ghmix_tutorial_force_snap \{setting = 3}
	Change jam_current_quantize = <setting>
	jam_studio_element :SetProps snap_text = ($jam_quantize [$jam_current_quantize].name_text)
endscript

script jam_studio_show_helper_arrow 
	KillSpawnedScript \{Name = jam_studio_show_helper_arrow_spawned}
	SpawnScriptNow jam_studio_show_helper_arrow_spawned id = jam_tutorial_spawns params = {<...>}
endscript

script jam_studio_cancel_helper_arrow 
	KillSpawnedScript \{Name = jam_studio_show_helper_arrow_spawned}
endscript

script jam_studio_show_helper_arrow_spawned \{target = 2000
		time = 5}
	begin
	if ($jam_highway_play_time < (<target> -500))
		jam_tutorial_add_arrow \{Pos = (550.0, 150.0)
			life = 1
			rot = 180}
	elseif ($jam_highway_play_time > (<target> + 200))
		jam_tutorial_add_arrow \{Pos = (550.0, 550.0)
			life = 1}
	else
	endif
	Wait <time> Seconds
	repeat
endscript
