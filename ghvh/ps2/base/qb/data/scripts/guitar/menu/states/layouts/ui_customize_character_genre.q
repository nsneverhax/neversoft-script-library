
script ui_create_customize_character_genre 
	make_generic_menu \{title = qs(0x5f98cef0)
		vmenu_id = create_customize_character_genre_vmenu}
	create_ui_history_header \{text = qs(0x5f98cef0)
		num_icons = 1}
	setup_cas_menu_handlers_restricted \{vmenu_id = create_customize_character_genre_vmenu}
	GetArraySize ($genre_list)
	i = 0
	begin
	add_generic_menu_text_item {
		text = (($genre_list) [<i>].frontend_desc)
		pad_choose_script = <choose_script>
		additional_focus_script = select_genre
		additional_focus_params = {genre = (($genre_list) [<i>].desc_id)}
	}
	i = (<i> + 1)
	repeat <array_Size>
	menu_finish \{car_helper_text}
endscript

script ui_destroy_customize_character_genre 
	generic_ui_destroy
endscript

script select_genre 

	editcasappearance target = setgenre targetparams = {genre = <genre>}
endscript
