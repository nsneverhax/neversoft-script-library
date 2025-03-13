
script ui_create_jam_publish_genre 
	make_generic_menu \{title = qs(0x5f98cef0)
		vmenu_id = jam_publish_genre_vmenu
		desc = 'generic_musicstudio_menu'
		$musicstudio_menu_sound_scripts
		pad_back_params = {
			nosound
		}}
	getarraysize ($jam_genre_list)
	i = 0
	begin
	add_generic_musicstudio_menu_text_item {
		text = (($jam_genre_list) [<i>].name_text)
		pad_choose_script = <choose_script>
		pad_choose_params = {genre = <i>}
	}
	i = (<i> + 1)
	repeat <array_size>
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		z = 100}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		z = 100}
endscript

script ui_destroy_jam_publish_genre 
	stoprendering
	destroy_generic_menu
endscript
