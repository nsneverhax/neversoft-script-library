
script ui_create_tutorial_menu_skill_level \{check_lefty_flip = 0}
	if (<check_lefty_flip> = 1)
		switch (<tutorial_header>)
			case 'guitar'
			part = guitar
			case 'drum'
			part = Drum
			case 'bass'
			part = bass
		endswitch
		get_progression_instrument_user_option controller = ($primary_controller) part = <part> option = 'lefty_flip'
		if (<user_option> < 0)
			tutorial_menu_ask_for_lefty_flip tutorial_header = <tutorial_header> Title = <Title>
			return
		else
			GetFirstPlayer
			SetPlayerInfo <player> lefty_flip = <user_option>
		endif
	endif
	clean_up_user_control_helpers
	make_generic_menu {
		vmenu_id = skill_level_vmenu
		Title = <Title>
		pad_back_script = tutorial_skill_level_back
		dims = (400.0, 400.0)
		desc = 'generic_tutorial_select'
	}
	generic_menu :SE_SetProps \{help_text_caption_text = qs(0x00000000)}
	generic_menu :SE_SetProps \{challenge_instrument_rgba = [
			255
			255
			255
			255
		]}
	generic_menu :SE_SetProps \{challenge_instrument_alpha = 1.0}
	switch (<tutorial_header>)
		case 'guitar'
		icon = mixer_icon_guitar
		case 'drum'
		icon = mixer_icon_drums
		case 'vocals'
		icon = mixer_icon_vox
		case 'bass'
		icon = mixer_icon_bass
		case 'band'
		icon = icon_band
		case 'gameplay'
		icon = gig_summary_star_256
		generic_menu :SE_SetProps challenge_instrument_rgba = ($UIColorRef_Palette.yellow_lt.rgba)
	endswitch
	if GotParam \{icon}
		generic_menu :SE_SetProps challenge_instrument_texture = <icon>
	endif
	get_savegame_from_controller controller = ($primary_controller)
	FormatText checksumname = tutorial_array '%s_tutorials' s = <tutorial_header>
	GetArraySize ($<tutorial_array>)
	i = 0
	begin
	tutorial_struct = ($<tutorial_array> [<i>])
	if tutorial_system_is_tutorial_complete {
			savegame = <savegame>
			tutorial_header = <tutorial_header>
			tutorial_id = (<tutorial_struct>.id)
		}
		icon = gh_studio_checked
	else
		icon = gh_studio_unchecked
	endif
	if (<tutorial_header> = 'guitar')
		switch (<i>)
			case 0
			<choose_state> = UIstate_tutorial_guitar_load_basic
			case 1
			<choose_state> = UIstate_tutorial_guitar_load_intermediate
			case 2
			<choose_state> = UIstate_tutorial_guitar_load_advanced
		endswitch
	else
		<choose_state> = uistate_tutorial_menu_lessons
	endif
	add_generic_tutorial_menu_icon_item {
		icon = <icon>
		text = (<tutorial_struct>.Title)
		choose_state = <choose_state>
		choose_state_data = {tutorial_header = <tutorial_header> tutorial_id = (<tutorial_struct>.id) part = <part>}
		additional_focus_script = tutorial_system_menu_focus
		additional_focus_params = {item_struct = <tutorial_struct>}
	}
	<i> = (<i> + 1)
	repeat <array_size>
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		all_buttons}
	LaunchEvent \{type = focus
		target = skill_level_vmenu}
endscript

script tutorial_skill_level_back 
	generic_event_back \{state = UIstate_tutorial_menu}
endscript

script tutorial_menu_ask_for_lefty_flip 
	RequireParams \{[
			tutorial_header
			Title
		]
		all}
	make_generic_menu \{vmenu_id = lefty_flip_vmenu
		pad_back_script = tutorial_skill_level_back
		desc = 'generic_tutorial_popup'
		z_priority = 50}
	generic_menu :SE_SetProps \{challenge_instrument_alpha = 0.0}
	generic_menu :SE_SetProps \{title_text = qs(0x83adf584)}
	generic_menu :SE_SetProps \{description_text = qs(0xe3a6bee8)}
	add_generic_tutorial_menu_text_item {
		text = qs(0x93115961)
		pad_choose_script = tutorial_lefty_no
		pad_choose_params = {tutorial_header = <tutorial_header> Title = <Title>}
	}
	add_generic_tutorial_menu_text_item {
		text = qs(0xdba5f206)
		pad_choose_script = tutorial_lefty_yes
		pad_choose_params = {tutorial_header = <tutorial_header> Title = <Title>}
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green
		all_buttons}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red
		all_buttons}
	LaunchEvent \{type = focus
		target = lefty_flip_vmenu}
endscript

script tutorial_lefty_no 
	RequireParams \{[
			tutorial_header
			Title
		]
		all}
	destroy_generic_menu
	GetFirstPlayer
	SetPlayerInfo <player> lefty_flip = 0
	GetPlayerInfo <player> controller
	GetPlayerInfo <player> part
	if (<part> = guitar || <part> = bass)
		save_progression_instrument_user_option part = guitar controller = <controller> option = 'lefty_flip' new_value = 0
		save_progression_instrument_user_option part = bass controller = <controller> option = 'lefty_flip' new_value = 0
	else
		save_progression_instrument_user_option part = Drum controller = <controller> option = 'lefty_flip' new_value = 0
	endif
	ui_create_tutorial_menu_skill_level tutorial_header = <tutorial_header> Title = <Title>
endscript

script tutorial_lefty_yes 
	RequireParams \{[
			tutorial_header
			Title
		]
		all}
	destroy_generic_menu
	GetFirstPlayer
	if (<player> < 1)
		get_local_player_num_from_controller controller_index = ($primary_controller)
		player = <local_player_num>
	endif
	SetPlayerInfo <player> lefty_flip = 1
	GetPlayerInfo <player> controller
	GetPlayerInfo <player> part
	if (<part> = guitar || <part> = bass)
		save_progression_instrument_user_option part = guitar controller = <controller> option = 'lefty_flip' new_value = 1
		save_progression_instrument_user_option part = bass controller = <controller> option = 'lefty_flip' new_value = 1
	else
		save_progression_instrument_user_option part = Drum controller = <controller> option = 'lefty_flip' new_value = 1
	endif
	ui_create_tutorial_menu_skill_level tutorial_header = <tutorial_header> Title = <Title>
endscript

script ui_destroy_tutorial_menu_skill_level 
	destroy_generic_menu
endscript
