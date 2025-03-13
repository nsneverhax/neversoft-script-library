
script ui_create_jam_download_slot 
	printf \{channel = jam_mode
		qs(0xec365933)}
	formattext textname = user_name qs(0x73307931) s = <user_name>
	i = 0
	num_filled = 0
	begin
	if ((<slot_array> [<i>].has_content) = 1)
		<num_filled> = (<num_filled> + 1)
	endif
	<i> = (<i> + 1)
	repeat $jam_ghtunes_max_num_slots
	menu_sound_struct = $musicstudio_menu_sound_scripts
	if NOT (<num_filled> >= 2)
		<menu_sound_struct> = {pad_back_sound = musicstudio_menu_music_back
			no_up_down_sound_handlers}
	endif
	make_generic_menu {
		title = <user_name>
		vmenu_id = jam_download_slot_vmenu
		pad_back_script = jam_download_slot_go_back
		pad_back_params = {start_at = <start_at> board_index = <board_index>}
		pad_start_script = song_preview_show_gamercard
		pad_start_params = {user_id = <user_id>}
		desc = 'generic_musicstudio_menu'
		<menu_sound_struct>
		pad_back_sound = nullscript
	}
	i = 0
	begin
	has_content = 0
	if ((<slot_array> [<i>].has_content) = 1)
		getarraysize \{$jam_genre_list}
		genre_count = 0
		genre_text = qs(0x00000000)
		begin
		if (($jam_genre_list [<genre_count>].checksum) = (<slot_array> [<i>].genre))
			genre_text = ($jam_genre_list [<genre_count>].name_text)
			break
		endif
		<genre_count> = (<genre_count> + 1)
		repeat <array_size>
		formattext textname = slot_text qs(0xc47d6d84) s = (<i> + 1) n = (<slot_array> [<i>].filename)
		add_generic_musicstudio_menu_text_item {
			text = <slot_text>
			pad_choose_script = jam_download_slot
			pad_choose_params = {slot = <i> genre_chk = (<slot_array> [<i>].genre) file_id = (<slot_array> [<i>].file_id) filename = (<slot_array> [<i>].filename) board_index = <board_index> user_id = <user_id> user_name = <user_name>}
		}
	else
		formattext textname = slot_text qs(0xeac75b19) s = (<i> + 1)
		add_generic_musicstudio_menu_text_item {
			not_focusable
			text = <slot_text>
		}
	endif
	i = (<i> + 1)
	repeat $jam_ghtunes_max_num_slots
	menu_finish
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0x43b287ab)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if isxenonorwindx
		if gotparam \{user_id}
			add_user_control_helper \{text = qs(0x9a7d1fe5)
				button = start
				z = 100000}
		endif
	endif
	startrendering
endscript

script ui_destroy_jam_download_slot 
	printf \{channel = jam_mode
		qs(0x7a870c64)}
	destroy_generic_menu
endscript

script jam_download_slot_go_back 
	ui_event nosound event = menu_back data = {straight_to_leaderbrd = {index = <board_index> start_at = <start_at> board_index = <board_index>}}
endscript

script jam_download_slot 
	printf \{channel = jam_mode
		qs(0xf186dfce)}
	ui_destroy_jam_download_slot
	ghtunes_pad_choose file_id = <file_id> filename = <filename> board_index = <board_index> num_ratings = 0 user_id = <user_id> user_name = <user_name>
endscript
