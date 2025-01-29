intial_genre_focus_hack = 0

script ui_create_create_character_genre 
	make_generic_menu \{title = qs(0x5f98cef0)
		vmenu_id = create_create_character_genre_vmenu
		scrolling}
	Change \{intial_genre_focus_hack = 1}
	SetScreenElementProps \{id = create_create_character_genre_vmenu
		event_handlers = [
			{
				pad_option2
				cas_create_character_rerandomize
			}
		]
		replace_handlers}
	current_genre = (($cas_current_appearance).genre)
	GetArraySize ($genre_list)
	i = 0
	begin
	genre = (($genre_list) [<i>].desc_id)
	if (<genre> = <current_genre>)
		select_index = <i>
	endif
	add_generic_menu_icon_item {
		icon = (($genre_list) [<i>].icon)
		text = (($genre_list) [<i>].frontend_desc)
		pad_choose_script = cas_create_character_genre_chosen
		additional_focus_script = cas_create_character_genre_focus
		additional_focus_params = {genre = <genre>}
	}
	i = (<i> + 1)
	repeat <array_Size>
	menu_finish \{no_rotate_zoom_text}
	LaunchEvent Type = focus target = create_create_character_genre_vmenu data = {child_index = <select_index>}
	add_user_control_helper \{text = qs(0xec8fbaef)
		button = yellow
		z = 100000}
endscript

script ui_destroy_create_character_genre 
	destroy_generic_menu
endscript

script ui_init_create_character_genre 
	ui_load_cas_rawpak \{part = cas_body}
endscript

script cas_create_character_genre_focus 
	if ($intial_genre_focus_hack = 1)
		Change \{intial_genre_focus_hack = 0}
		return
	endif
	switch <genre>
		case rock
		anim = rock
		case punk
		anim = punk
		case `heavy	metal`
		anim = heavymetal
		case `glam	rock`
		anim = glam
		case `black	metal`
		anim = blackmetal
		case `classic	rock`
		anim = classic
		case goth
		anim = goth
		case pop
		anim = pop
		default
		anim = rock
	endswitch
	random_character_throttled is_female = ($cas_current_is_female) genre = <genre> anim = <anim> genre_select
endscript

script cas_create_character_genre_chosen 
	destroy_generic_menu
	begin
	if NOT ScriptIsRunning \{random_character_throttled_spawned}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	cas_queue_wait \{characters_only = 1}
	if (($cas_editing_new_character) = true)
		cas_save_photo_of_car character_name = ($cas_current_profile) savegame = ($cas_current_savegame) do_not_modify = 1
	endif
	generic_event_choose \{no_sound
		state = uistate_customize_character}
endscript

script cas_create_character_rerandomize 
	if getcasappearance
		if StructureContains structure = <appearance> genre
			generic_menu_pad_choose_sound
			random_character_throttled is_female = ($cas_current_is_female) genre = (<appearance>.genre) genre_select
		endif
	endif
endscript
