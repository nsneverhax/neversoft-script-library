intial_genre_focus_hack = 0

script ui_create_create_character_genre 
	0x7d8b2005
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
	add_generic_menu_text_item {
		text = (($genre_list) [<i>].frontend_desc)
		pad_choose_script = cas_create_character_genre_chosen
		additional_focus_script = cas_create_character_genre_focus
		additional_focus_params = {genre = <genre>}
	}
	i = (<i> + 1)
	repeat <array_Size>
	bx_refreshmenuitemsindexes \{vmenu_id = create_create_character_genre_vmenu}
	bx_genericmenu_setupscrollbar num_items = <num_items>
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

script 0xcfaf046b 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	Wait \{1
		Second}
	0x4662e021 genre = (<0x5223e023>)
endscript

script cas_create_character_genre_focus 
	SpawnScriptNow cas_create_character_genre_focus_spawned params = {<...>}
endscript

script cas_create_character_genre_focus_spawned 
	SetSpawnInstanceLimits \{Max = 1
		management = kill_oldest}
	if ($intial_genre_focus_hack = 1)
		Change \{intial_genre_focus_hack = 0}
		return
	endif
	SpawnScriptNow 0xcfaf046b params = {0x5223e023 = <genre>}
endscript

script 0x4662e021 
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
		case folk
		anim = heavymetal
		default
		anim = rock
	endswitch
	Wait \{0.5
		Second}
	SetButtonEventMappings \{block_menu_input}
	random_character_throttled is_female = ($cas_current_is_female) genre = <genre> anim = <anim> genre_select
	SpawnScriptNow \{cas_unblock_input_after_randomize}
endscript

script cas_create_character_genre_chosen 
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
	menu_start_transition
	generic_event_choose \{no_sound
		state = uistate_customize_character
		data = {
			0x10003bba = 1
		}}
endscript

script cas_create_character_rerandomize 
	SetButtonEventMappings \{block_menu_input}
	if getcasappearance
		if StructureContains structure = <appearance> genre
			generic_menu_pad_choose_sound
			random_character_throttled is_female = ($cas_current_is_female) genre = (<appearance>.genre) genre_select
		endif
	endif
	SpawnScriptNow \{cas_unblock_input_after_randomize}
endscript

script cas_unblock_input_after_randomize 
	begin
	if NOT ScriptIsRunning \{random_character_throttled_spawned}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	SetButtonEventMappings \{unblock_menu_input}
endscript
