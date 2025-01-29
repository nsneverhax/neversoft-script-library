
script ui_create_jam_publish_text_entry \{save_as = 0
		save_as_and_quit = 0
		song_view = 0}
	Change \{num_name_size = 17}
	make_generic_menu \{vmenu_id = text_entry_vmenu
		title = qs(0xeecb2665)
		desc = 'generic_musicstudio_menu'
		$musicstudio_menu_sound_scripts
		pad_back_params = {
			nosound
		}}
	add_generic_musicstudio_menu_text_item \{text = qs(0xb60636a4)
		heading}
	font = fontgrid_text_a3
	warning_message = qs(0xe87803a4)
	if (<save_as> = 1 || <save_as_and_quit> = 1)
		text_entry_add_item {
			pad_back_script = jam_publish_text_entry_go_back
			pad_choose_script = jam_publish_save_as_confirm
			pad_choose_params = {text = <text> save_as = <save_as> save_as_and_quit = <save_as_and_quit> song_view = <song_view>}
			text = <text>
			font = fontgrid_text_a3
			rgba = [113 121 133 255]
			validity_message = <warning_message>
			linear_flow
			dims = (285.0, 29.0)
		}
	else
		text_entry_add_item {
			pad_back_script = jam_publish_text_entry_go_back
			pad_choose_script = <choose_script>
			pad_choose_params = <choose_params>
			text = <text>
			font = fontgrid_text_a3
			rgba = [113 121 133 255]
			validity_message = <warning_message>
			linear_flow
			dims = (285.0, 29.0)
		}
	endif
	generic_menu :se_setprops \{scroll_bar_alpha = 0}
	menu_finish \{no_helper_text}
	musicsudio_text_entry_helper_text_linear_flow
	LaunchEvent \{Type = focus
		target = text_entry_vmenu
		data = {
			child_index = 1
		}}
	LaunchEvent \{Type = pad_choose}
	StartRendering
endscript

script jam_publish_text_entry_go_back 
	generic_event_back \{nosound
		data = {
			editing = 1
		}}
	musicstudio_menu_music_back
endscript

script jam_publish_save_as_confirm 
	jam_recording_get_unique_name prefix = <text>
	Change memcard_jamsession_file_name = <song>
	fire_achievement Name = achievement_producer controller = ($primary_controller)
	if (<save_as> = 1)
		Change \{memcard_after_func = musicstudio_save_after_func}
		if (<song_view> = 1)
			ui_memcard_save_jam \{event = menu_back
				data = {
					state = uistate_musicstudio_ghmix_song
					editing = 1
				}}
		else
			ui_memcard_save_jam \{event = menu_back
				data = {
					state = uistate_musicstudio_ghmix
					editing = 1
				}}
		endif
	elseif (<save_as_and_quit> = 1)
		Change \{memcard_after_func = musicstudio_save_after_func}
		ui_memcard_save_jam \{event = menu_back
			data = {
				state = uistate_jam_select_song
				show_popup = 0
			}}
	endif
endscript

script ui_return_jam_publish_text_entry 
	clean_up_user_control_helpers
	musicsudio_text_entry_helper_text_linear_flow
endscript

script ui_destroy_jam_publish_text_entry 
	Change \{num_name_size = 17}
	destroy_generic_menu
endscript
