
script ui_create_customize_character_genre 
	make_generic_menu \{title = qs(0x5f98cef0)
		vmenu_id = create_customize_character_genre_vmenu}
	if <desc_id> :desc_resolvealias Name = 0x44475582 param = 0x7363d093
		<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xf313b252 param = 0x7c09a415
		<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
	else

	endif
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
