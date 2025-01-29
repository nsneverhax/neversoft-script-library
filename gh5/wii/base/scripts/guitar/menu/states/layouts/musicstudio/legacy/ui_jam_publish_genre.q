
script ui_create_jam_publish_genre 
	make_generic_menu \{title = qs(0x5f98cef0)
		vmenu_id = jam_publish_genre_vmenu
		desc = 'generic_musicstudio_menu'}
	GetArraySize ($jam_genre_list)
	i = 0
	begin
	add_generic_musicstudio_menu_text_item {
		text = (($jam_genre_list) [<i>].name_text)
		pad_choose_script = <choose_script>
		pad_choose_params = {genre = <i>}
	}
	i = (<i> + 1)
	repeat <array_Size>
	menu_finish
endscript

script ui_destroy_jam_publish_genre 
	StopRendering
	destroy_generic_menu
endscript
