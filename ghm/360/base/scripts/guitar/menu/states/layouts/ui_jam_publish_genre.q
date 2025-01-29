
script ui_create_jam_publish_genre 
	make_generic_menu \{title = qs(0x5f98cef0)
		vmenu_id = jam_publish_genre_vmenu}
	GetArraySize ($jam_genre_list)
	i = 0
	begin
	add_generic_menu_text_item {
		text = (($jam_genre_list) [<i>].name_text)
		pad_choose_script = <choose_script>
		pad_choose_params = {genre = <i>}
	}
	i = (<i> + 1)
	repeat <array_Size>
	menu_finish
	generic_menu :se_setprops \{skull_eye_anim_alpha = 0}
	generic_menu :se_setprops \{studio_skull_anim_alpha = 1}
	generic_menu :Obj_SpawnScriptNow \{studio_skull_anim}
endscript

script ui_destroy_jam_publish_genre 
	if ($invite_controller = -1)
		StopRendering
	endif
	destroy_generic_menu
	KillSpawnedScript \{Name = studio_skull_anim}
endscript
