intial_genre_focus_hack = 0
is_in_genre_select = 0

script ui_create_create_character_genre 
	Change \{is_in_genre_select = 1}
	make_generic_car_menu {
		Title = qs(0x818a5b51)
		vmenu_id = create_create_character_genre_vmenu
		exclusive_device = <state_device>
		scrolling
	}
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
	GetArraySize ($cas_genre_list)
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
	LaunchEvent type = focus target = create_create_character_genre_vmenu data = {child_index = <select_index>}
	add_user_control_helper controller = <state_device> text = qs(0xc18d5e76) button = green z = 100000
	add_user_control_helper controller = <state_device> text = qs(0xaf4d5dd2) button = red z = 100000
	add_user_control_helper controller = <state_device> text = qs(0x9093ca74) button = yellow z = 100000
	if (($autolaunch_cas_instrument != None) || ($autolaunch_cas_new_char != None))
		Change \{autolaunch_cas_new_char = None}
		SpawnScriptDelayed \{frames = 20
			cas_create_character_genre_chosen}
	endif
endscript

script ui_destroy_create_character_genre 
	Change \{is_in_genre_select = 0}
	destroy_generic_menu
endscript

script ui_init_create_character_genre 
endscript

script cas_create_character_genre_focus 
	if ($intial_genre_focus_hack = 1)
		Change \{intial_genre_focus_hack = 0}
		return
	endif
	switch <genre>
		case rock
		anim = rock
		case Punk
		anim = Punk
		case `Heavy	Metal`
		anim = HeavyMetal
		case `Glam	Rock`
		anim = Glam
		case `Black	Metal`
		anim = BlackMetal
		case `Classic	Rock`
		anim = classic
		case Goth
		anim = Goth
		case Pop
		anim = Pop
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
	Change \{leaving_genre_select = 1}
	CasCancelLoading
	begin
	if NOT ScriptIsRunning \{random_character_throttled_spawned}
		break
	endif
	wait \{1
		gameframe}
	repeat
	generic_event_choose no_sound state = UIstate_customize_character_enter data = {force_id = cas_current_appearance new_data = {state_device = ($primary_controller)}}
endscript

script cas_create_character_rerandomize 
	if GetCASAppearance
		if StructureContains structure = <appearance> genre
			generic_menu_pad_choose_sound
			random_character_throttled char_type = ($cas_current_new_char_type) genre = (<appearance>.genre) genre_select
		endif
	endif
endscript
