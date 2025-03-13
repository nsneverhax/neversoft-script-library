intial_genre_focus_hack = 0
is_in_genre_select = 0

script ui_create_create_character_genre 
	change \{is_in_genre_select = 1}
	make_generic_car_menu {
		title = qs(0x818a5b51)
		vmenu_id = create_create_character_genre_vmenu
		exclusive_device = <state_device>
		scrolling
	}
	change \{intial_genre_focus_hack = 1}
	setscreenelementprops \{id = create_create_character_genre_vmenu
		event_handlers = [
			{
				pad_option2
				cas_create_character_rerandomize
			}
		]
		replace_handlers}
	current_genre = (($cas_current_appearance).genre)
	getarraysize ($cas_genre_list)
	i = 0
	begin
	genre = (($cas_genre_list) [<i>].desc_id)
	if (<genre> = <current_genre>)
		select_index = <i>
	endif
	add_car_menu_text_item {
		icon = (($cas_genre_list) [<i>].icon)
		text = (($cas_genre_list) [<i>].frontend_desc)
		pad_choose_script = cas_create_character_genre_chosen
		additional_focus_script = cas_create_character_genre_focus
		additional_focus_params = {genre = <genre>}
	}
	i = (<i> + 1)
	repeat <array_size>
	menu_finish no_rotate_zoom_text controller = <state_device>
	launchevent type = focus target = create_create_character_genre_vmenu data = {child_index = <select_index>}
	add_user_control_helper controller = <state_device> text = qs(0xc18d5e76) button = green z = 100000
	add_user_control_helper controller = <state_device> text = qs(0xaf4d5dd2) button = red z = 100000
	add_user_control_helper controller = <state_device> text = qs(0x9093ca74) button = yellow z = 100000
	if (($autolaunch_cas_instrument != none) || ($autolaunch_cas_new_char != none))
		change \{autolaunch_cas_new_char = none}
		spawnscriptdelayed \{frames = 20
			cas_create_character_genre_chosen}
	endif
endscript

script ui_destroy_create_character_genre 
	change \{is_in_genre_select = 0}
	destroy_generic_menu
endscript

script ui_init_create_character_genre 
endscript

script cas_create_character_genre_focus 
	if ($intial_genre_focus_hack = 1)
		change \{intial_genre_focus_hack = 0}
		return
	endif
	switch <genre>
		case rock
		anim = rock
		case punk
		anim = punk
		case `heavy metal`
		anim = heavymetal
		case `glam rock`
		anim = glam
		case `black metal`
		anim = blackmetal
		case `classic rock`
		anim = classic
		case goth
		anim = goth
		case pop
		anim = pop
		default
		anim = rock
	endswitch
	random_character_throttled char_type = ($cas_current_new_char_type) genre = <genre> anim = <anim> genre_select
endscript

script cas_create_character_genre_chosen 
	cas_advance_from_gender_genre_to_customize
endscript

script cas_advance_from_gender_genre_to_customize 
	destroy_generic_menu
	change \{leaving_genre_select = 1}
	cascancelloading
	begin
	if NOT scriptisrunning \{random_character_throttled_spawned}
		break
	endif
	wait \{1
		gameframe}
	repeat
	generic_event_choose no_sound state = uistate_customize_character_enter data = {force_id = cas_current_appearance new_data = {state_device = ($primary_controller)}}
endscript

script cas_create_character_rerandomize 
	if getcasappearance
		if structurecontains structure = <appearance> genre
			generic_menu_pad_choose_sound
			random_character_throttled char_type = ($cas_current_new_char_type) genre = (<appearance>.genre) genre_select
		endif
	endif
endscript
