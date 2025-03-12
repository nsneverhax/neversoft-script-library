
script ui_create_jam_publish_text_entry \{save_as = 0
		save_as_and_quit = 0
		song_view = 0}
	make_generic_menu \{vmenu_id = text_entry_vmenu
		title = qs(0x00000000)
		desc = 'generic_musicstudio_menu'
		$musicstudio_menu_sound_scripts
		pad_back_params = {
			nosound
		}}
	<cancel_script> = jam_publish_text_entry_go_back
	formattext \{textname = dialog_text
		qs(0xfc8eef97)}
	if (<save_as> = 1 || <save_as_and_quit> = 1)
		<accept_script> = jam_publish_save_as_confirm
		<accept_params> = {save_as = <save_as> save_as_and_quit = <save_as_and_quit> song_view = <song_view>}
	else
		<accept_script> = <choose_script>
		<accept_params> = <choose_params>
	endif
	spawnscriptnow os_keyboard_spawned_script params = {
		controller = ($primary_controller)
		max_length = 17
		dialog_text = <dialog_text>
		initial_text = <text>
		accept_script = <accept_script>
		accept_params = <accept_params>
		cancel_script = <cancel_script>
		os_kb_flags = {xenon_highlight_text ps3_alphabet_input}
		valid_characters = [
			$name_entry_upper_characters
			$name_entry_lower_characters
			$name_entry_space_character
			$name_entry_number_characters
		]
		string_validation_script = musicstudio_is_text_valid
	}
	generic_menu :se_setprops \{scroll_bar_alpha = 0}
	menu_finish \{no_helper_text}
	musicsudio_text_entry_helper_text_linear_flow
	generic_menu :se_setprops \{alpha = 0}
	startrendering
endscript

script jam_publish_text_entry_go_back 
	ui_event_wait_for_safe
	generic_event_back \{nosound
		data = {
			editing = 1
		}}
	musicstudio_menu_music_back
endscript

script jam_publish_save_as_confirm 
	jam_recording_get_unique_name prefix = <text>
	change memcard_jamsession_file_name = <song>
	if (<save_as> = 1)
		change \{memcard_after_func = musicstudio_save_after_func}
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
		change \{memcard_after_func = musicstudio_save_after_func}
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
	destroy_generic_menu
endscript
