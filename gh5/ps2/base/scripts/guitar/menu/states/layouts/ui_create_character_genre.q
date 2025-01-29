intial_genre_focus_hack = 0

script ui_create_create_character_genre 
	make_generic_menu \{title = qs(0x818a5b51)
		vmenu_id = create_create_character_genre_vmenu}
	if <desc_id> :desc_resolvealias Name = 0x44475582 param = 0x7363d093
		<0x7363d093> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x187899ed 0xffd05882 = $0xddccbea4}
	else

	endif
	if <desc_id> :desc_resolvealias Name = 0xf313b252 param = 0x7c09a415
		<0x7c09a415> :obj_spawnscript 0xa7a510a8 params = {0x4d641ae8 0xe99089a3 = $0x52565f88 0xffd05882 = $0xddccbea4}
	else

	endif
	Change \{intial_genre_focus_hack = 1}
	current_genre = (($cas_current_appearance).genre)
	GetArraySize ($genre_list)
	i = 0
	begin
	genre = (($genre_list) [<i>].desc_id)
	if (<genre> = <current_genre>)
		select_index = <i>
	endif
	add_generic_menu_text_item {
		icon = (($genre_list) [<i>].icon)
		text = (($genre_list) [<i>].frontend_desc)
		pad_choose_script = 0xea169d59
		pad_choose_params = {state = uistate_customize_character 0xeec2d226 = create_create_character_genre_vmenu}
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
	if getcurrentcasobject
		bandmanager_changestance Name = <cas_object> stance = stance_old no_wait
	endif
	ui_load_cas_rawpak \{part = cas_body}
endscript
0xc7b81333 = 0.75

script cas_create_character_genre_focus 
	SetScreenElementProps {
		id = create_create_character_genre_vmenu
		event_handlers =
		[
			{pad_option2 cas_create_character_rerandomize params = {genre = <genre>}}
		]
		replace_handlers
	}
	if ($intial_genre_focus_hack = 1)
		Change \{intial_genre_focus_hack = 0}
		return
	endif
	KillSpawnedScript \{Name = 0x4ec30caf}
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
	SpawnScriptNow 0x4ec30caf params = {is_female = ($cas_current_is_female) genre = <genre> anim = <anim> Wait genre_select}
endscript

script cas_create_character_rerandomize 
	KillSpawnedScript \{Name = 0x4ec30caf}
	generic_menu_pad_choose_sound
	if GotParam \{genre}
		SpawnScriptNow 0x4ec30caf params = {is_female = ($cas_current_is_female) genre = <genre> genre_select}
	else
		if getcasappearance
			if StructureContains structure = <appearance> genre
				SpawnScriptNow 0x4ec30caf params = {is_female = ($cas_current_is_female) genre = (<appearance>.genre) genre_select}
			endif
		endif
	endif
endscript

script cas_unblock_input_after_randomize 
	begin
	if NOT ScriptIsRunning \{0x4ec30caf}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	SetButtonEventMappings \{unblock_menu_input}
endscript
