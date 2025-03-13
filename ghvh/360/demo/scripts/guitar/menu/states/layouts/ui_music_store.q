special_packs_text = qs(0x376473ad)

script ui_init_music_store 
	if isps3
		music_store_image_size = ($default_music_store_image_size_ps3)
		music_store_sound_size = ($default_music_store_sound_size_ps3)
		music_store_image_cache_size = ($default_music_store_image_cache_size_ps3)
		music_store_sound_cache_size = ($default_music_store_sound_cache_size_ps3)
	else
		music_store_image_size = ($default_music_store_image_size_xenon)
		music_store_sound_size = ($default_music_store_sound_size_xenon)
		music_store_image_cache_size = ($default_music_store_image_cache_size_xenon)
		music_store_sound_cache_size = ($default_music_store_sound_cache_size_xenon)
	endif
	initmusicstorecache {
		music_store_image_cache_size = <music_store_image_cache_size>
		music_store_sound_cache_size = <music_store_sound_cache_size>
		music_store_max_file_requests = ($default_music_store_max_file_requests)
		music_store_image_size = <music_store_image_size>
		music_store_sound_size = <music_store_sound_size>
		music_store_image_vram_size = ($default_music_store_image_vram_size)
		music_store_sound_vram_size = ($default_music_store_sound_vram_size)
	}
	create_music_store_menu exclusive_device = ($primary_controller) pad_back_script = music_store_exit_check
	music_store_create_ui_list
endscript

script ui_create_music_store 
	spawnscriptnow \{bg_crowd_front_end_silence
		params = {
			immediate = 1
		}}
	spawnscriptnow \{menu_music_off}
	if isxenon
		music_store_add_sort_info_item \{text = qs(0xb0bcf58b)
			focused}
	endif
	music_store_get_new_arrival_list
	music_store_get_list_subset list = <list> num_elements = 20
	add_music_store_item {
		text = qs(0x13ac2a2b)
		choose_state = uistate_music_store_newarrivals
		additional_focus_script = music_store_preview_list
		additional_focus_params = {list = <list>}
		additional_unfocus_script = music_store_end_preview_list
	}
	if gotparam \{list}
		addarrayelement array = [] element = <list>
		removeparameter \{list}
	endif
	music_store_get_song_list
	music_store_get_list_subset list = <list> num_elements = 20
	add_music_store_item {
		text = qs(0x1cec7f8c)
		choose_state = uistate_music_store_songs
		additional_focus_script = music_store_preview_list
		additional_focus_params = {list = <list>}
		additional_unfocus_script = music_store_end_preview_list
	}
	if gotparam \{list}
		addarrayelement array = <array> element = <list>
		removeparameter \{list}
	endif
	music_store_get_pack_list
	music_store_get_list_subset list = <list> num_elements = 20
	add_music_store_item {
		text = ($special_packs_text)
		choose_state = uistate_music_store_specialpacks
		additional_focus_script = music_store_preview_list
		additional_focus_params = {list = <list>}
		additional_unfocus_script = music_store_end_preview_list
	}
	if gotparam \{list}
		addarrayelement array = <array> element = <list>
		removeparameter \{list}
	endif
	music_store_get_album_list
	music_store_get_list_subset list = <list> num_elements = 20
	add_music_store_item {
		text = qs(0x6479f782)
		choose_state = uistate_music_store_albums
		additional_focus_script = music_store_preview_list
		additional_focus_params = {list = <list>}
		additional_unfocus_script = music_store_end_preview_list
	}
	if gotparam \{list}
		addarrayelement array = <array> element = <list>
		removeparameter \{list}
	endif
	music_store_main_preload_album_covers list_array = <array>
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
	if NOT gotparam \{selected_index}
		netsessionfunc \{obj = motd
			func = get_demonware_motd
			params = {
				callback = music_store_motd_callback
			}}
		spawnscriptnow \{music_store_wipe_in_options}
		spawnscriptnow \{music_store_wipe_in_album_info}
	else
		spawnscriptnow \{music_store_fade_in_options}
	endif
	launchevent \{type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
endscript

script ui_destroy_music_store 
	destroy_music_store_menus
	musicstorecancelallrequests
endscript

script ui_deinit_music_store 
	destroy_music_store
	musicstorecancelallrequests
	musicstoreunloadall
	shutdownmusicstorecache
endscript

script music_store_exit_check 
	ui_event_get_stack
	getarraysize <stack>
	if (<array_size> > 0)
		if (<stack> [0].base_name = 'music_store')
			if isxenon
				if marketplacefunc \{func = currently_downloading
						any}
					music_store_exit_check_warning \{title = qs(0x3ed675b6)
						text = qs(0x1f452ee3)
						options = [
							{
								func = music_store_exit_check_warning_cancel
								text = qs(0x1d5e92a7)
							}
							{
								func = music_store_exit_check_warning
								func_params = {
									text = qs(0x857c04db)
									options = [
										{
											func = music_store_exit_check_warning_exit
											text = qs(0x0e41fe46)
										}
									]
								}
								text = qs(0x35f01644)
							}
						]}
					return
				endif
			else
				if ($music_store_attempted_purchase = 1)
					music_store_exit_check_warning \{text = qs(0x01e002ea)
						options = [
							{
								func = music_store_exit_check_warning_exit
								text = qs(0x29fff5f2)
							}
							{
								func = music_store_exit_check_warning_cancel
								text = qs(0xd583470f)
							}
						]
						long_flag = {
							long
						}}
					return
				endif
			endif
		endif
		if (<stack> [0].base_name = 'music_store_unavailible')
			return
		endif
		if (<stack> [0].base_name = 'music_store_scan_marketplace')
			return
		endif
	endif
	generic_event_back
endscript

script music_store_exit_check_warning 
	launchevent \{type = unfocus
		target = current_menu}
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = <title>
		options = <options>
		textblock = {
			text = <text>
			dims = (800.0, 400.0)
			scale = 0.45000002
		}
		<long_flag>
		menu_pos = (640.0, 520.0)
		player_device = ($primary_controller)
	}
endscript

script music_store_exit_check_warning_cancel 
	destroy_popup_warning_menu
	launchevent \{type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
	add_gamertag_helper exclusive_device = ($primary_controller)
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100000}
endscript

script music_store_exit_check_warning_exit 
	destroy_popup_warning_menu
	launchevent \{type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
	generic_event_back \{nosound}
endscript

script music_store_get_list_subset 
	requireparams \{[
			list
			num_elements
		]
		all}
	array = []
	getarraysize <list>
	if (<array_size> > 0)
		if (<array_size> > <num_elements>)
			array_size = <num_elements>
		endif
		i = 0
		begin
		addarrayelement array = <array> element = (<list> [<i>])
		i = (<i> + 1)
		repeat <array_size>
	endif
	return list = <array>
endscript
