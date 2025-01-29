jam_tutorial_menu_topics = [
	{
		Name = qs(0xd603d741)
		desc = qs(0x14f2ac12)
		lesson_tag = rs_introduction_lesson
		allow_drums = 1
		sections = [
			jam_tutorial_intro
			jam_tutorial_intro_noise
			jam_tutorial_intro_recording
		]
	}
	{
		Name = qs(0x39a07e53)
		desc = qs(0x8abea749)
		lesson_tag = rs_lead_and_bass_lesson
		allow_drums = 0
		sections = [
			jam_tutorial_lead
			jam_tutorial_open_strum
			jam_tutorial_play_scale
			jam_tutorial_tilt
		]
	}
	{
		Name = qs(0x7d5eb9c0)
		desc = qs(0x5c2fe125)
		lesson_tag = rs_rhythm_lesson
		allow_drums = 0
		sections = [
			jam_tutorial_rhythm
			jam_tutorial_effects
		]
	}
	{
		Name = qs(0xf3e03f27)
		desc = qs(0x7402ce0f)
		lesson_tag = rs_drums_lesson
		allow_drums = 1
		sections = [
			jam_tutorial_drums
			jam_tutorial_drum_kits
		]
	}
	{
		Name = qs(0x09aa4fdd)
		desc = qs(0xd7f2be22)
		lesson_tag = rs_melody_lesson
		allow_drums = 0
		sections = [
			jam_tutorial_melody
		]
	}
	{
		Name = qs(0x581ec86b)
		desc = qs(0x6b9fb8f1)
		lesson_tag = rs_recording_lesson
		allow_drums = 0
		sections = [
			jam_tutorial_recording
			jam_tutorial_ghtunes
		]
	}
	{
		Name = qs(0x0c16e29c)
		desc = qs(0xb17eb78b)
		lesson_tag = rs_pro_guitar_lesson
		allow_drums = 0
		sections = [
			jam_tutorial_sustains
			jam_tutorial_hos
			jam_tutorial_pms
		]
	}
	{
		Name = qs(0xf0e6e156)
		desc = qs(0xc479f2b0)
		lesson_tag = rs_advanced_tools_lesson
		allow_drums = 0
		sections = [
			jam_tutorial_arpeggiator
			jam_tutorial_drum_machine
		]
	}
	{
		Name = qs(0xabf968ed)
		desc = qs(0xc90915c4)
		lesson_tag = rs_ghmix_editing_lesson
		allow_drums = 0
		ghmix_tutorial = 1
		sections = [
			ghmix_tutorial_live_rec
			ghmix_tutorial_step_rec
			ghmix_tutorial_delete
		]
	}
	{
		Name = qs(0xde40c77b)
		desc = qs(0x3753ed6e)
		lesson_tag = rs_ghmix_pro_techniques_tools_lesson
		allow_drums = 0
		ghmix_tutorial = 2
		sections = [
			ghmix_tutorial_copypaste
			ghmix_tutorial_loops
			ghmix_tutorial_nudge
		]
	}
]

script ui_create_jam_tutorials 
	SpawnScriptNow \{jam_create_tutorial_menu}
endscript

script ui_destroy_jam_tutorials 
endscript

script ui_init_jam_tutorials 
endscript

script ui_deinit_jam_tutorials 
	jam_destroy_tutorial_menu
endscript

script jam_create_tutorial_menu 
	Change \{target_jam_camera_prop = jam_tutorials}
	jam_camera_wait
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = jam_tutorial_select_container}
	make_generic_menu \{title = qs(0x800a3aa0)
		pad_back_script = jam_exit_tutorial_menu
		vmenu_id = jam_tutorial_menu}
	tutorial_text_params = {Type = TextElement font = fontgrid_text_a3 just = [left center] Scale = 0.6 rot_angle = -5 rgba = [20 255 20 255]}
	CreateScreenElement {
		Type = TextBlockElement
		font = fontgrid_text_a3
		just = [left top]
		Scale = 1
		internal_scale = 0.75
		rgba = [20 255 20 255]
		parent = jam_tutorial_select_container
		id = jam_tutorial_select_info
		Pos = (635.0, 140.0)
		dims = (425.0, 235.0)
		rot_angle = 1
		z_priority = (5)
	}
	safe_hide \{id = jam_tutorial_select_info}
	<tutorial_topics> = ($jam_tutorial_menu_topics)
	GetArraySize <tutorial_topics>
	index = 0
	allow = 1
	begin
	if isdrumcontroller controller = ($primary_controller)
		if StructureContains structure = (<tutorial_topics> [<index>]) Name = allow_drums
			<allow> = (<tutorial_topics> [<index>].allow_drums)
		endif
	endif
	<ghmix_tutorial> = 0
	if StructureContains structure = (<tutorial_topics> [<index>]) Name = ghmix_tutorial
		<ghmix_tutorial> = (<tutorial_topics> [<index>].ghmix_tutorial)
	endif
	if (<allow> = 1)
		GetGlobalTags \{training}
		<lesson_tag> = (<tutorial_topics> [<index>].lesson_tag)
		if ((<...>.<lesson_tag>) = complete)
			<icon> = tutorial_complete
		else
			<icon> = tutorial_incomplete
		endif
		add_generic_menu_icon_item {
			icon = <icon>
			text = (<tutorial_topics> [<index>].Name)
			pad_choose_script = select_jam_tutorial_option
			pad_choose_params = {index = <index> ghmix_tut = <ghmix_tutorial>}
			additional_focus_script = focus_jam_tutorial_option
			additional_focus_params = {index = <index>}
		}
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
	LaunchEvent \{Type = focus
		target = current_menu}
endscript

script focus_jam_tutorial_option 
	retail_menu_focus id = <id>
	jam_camera_wait
	<tutorial_topics> = ($jam_tutorial_menu_topics)
	formatText TextName = run_text qs(0x8eeadaba) s = (<tutorial_topics> [<index>].desc)
	jam_tutorial_select_info :se_setprops text = <run_text>
	safe_show \{id = jam_tutorial_select_info}
endscript

script select_jam_tutorial_option 
	jam_destroy_tutorial_menu
	<wrong> = 0
	<tutorial_topics> = ($jam_tutorial_menu_topics)
	if IsGuitarController controller = ($primary_controller)
	elseif isdrumcontroller controller = ($primary_controller)
		if StructureContains structure = (<tutorial_topics> [<index>]) Name = allow_drums
			if NOT ((<tutorial_topics> [<index>].allow_drums) = 1)
				LaunchEvent \{Type = unfocus
					target = current_menu}
				create_popup_warning_menu \{no_background
					title = qs(0xaa163738)
					textblock = {
						text = qs(0x97c303c6)
					}
					options = [
						{
							func = {
								select_jam_tutorial_option_retry
							}
							func_params = {
							}
							text = qs(0x0e41fe46)
						}
					]}
				<wrong> = 1
			endif
		endif
	else
		if NOT ($allow_controller_for_all_instruments = 1)
			jam_exit_tutorial_menu
			<wrong> = 1
		endif
	endif
	if (<wrong> = 0)
		SpawnScriptNow jam_play_tutorial_topic id = jam_tutorial_topic_spawn params = {index = <index> ghmix_tut = <ghmix_tut>}
	endif
endscript

script select_jam_tutorial_option_retry 
	destroy_popup_warning_menu
	LaunchEvent \{Type = focus
		target = current_menu}
	jam_create_tutorial_menu
endscript

script jam_exit_tutorial_menu 
	KillSpawnedScript \{id = jam_tutorial_topic_spawn}
	jam_destroy_tutorial_menu
	generic_event_back \{state = uistate_jam}
endscript

script jam_destroy_tutorial_menu 
	set_focus_color
	set_unfocus_color
	Change \{game_mode = p1_quickplay}
	KillSpawnedScript \{id = jam_tutorial_spawns}
	if ScreenElementExists \{id = jam_tut_text}
		DestroyScreenElement \{id = jam_tut_text}
	endif
	if ScreenElementExists \{id = jam_tutorial_select_container}
		DestroyScreenElement \{id = jam_tutorial_select_container}
	endif
	destroy_generic_menu
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript
