
script ui_create_tutorial_menu_lessons 
	tutorial_system_get_tutorial tutorial_header = <tutorial_header> tutorial_id = <tutorial_id>
	make_generic_menu {
		title = (<tutorial_struct>.title)
		pad_back_script = generic_event_back
		pad_back_params = {state = uistate_tutorial_menu_skill_level data = {check_lefty_flip = 0}}
		dims = (400.0, 400.0)
		desc = 'generic_tutorial_select'
	}
	generic_menu :se_setprops \{help_text_caption_text = qs(0x00000000)}
	generic_menu :se_setprops \{challenge_instrument_rgba = [
			255
			255
			255
			255
		]}
	generic_menu :se_setprops \{challenge_instrument_alpha = 1.0}
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
		generic_menu :se_setprops \{challenge_instrument_rgba = yellow_lt}
	endswitch
	if gotparam \{icon}
		generic_menu :se_setprops challenge_instrument_texture = <icon>
	endif
	get_savegame_from_controller controller = ($primary_controller)
	getarraysize (<tutorial_struct>.lessons)
	i = 0
	begin
	lesson_struct = (<tutorial_struct>.lessons [<i>])
	if tutorial_system_is_lesson_complete {
			savegame = <savegame>
			tutorial_header = <tutorial_header>
			tutorial_id = (<tutorial_struct>.id)
			lesson_id = (<lesson_struct>.id)
		}
		icon = gh_studio_checked
	else
		icon = gh_studio_unchecked
	endif
	if structurecontains structure = <lesson_struct> is_new
		formattext textname = text qs(0xdd89ff73) s = (<lesson_struct>.title)
	else
		text = (<lesson_struct>.title)
	endif
	focus_params = {}
	if structurecontains structure = <lesson_struct> hardware
		if NOT tutorial_system_hardware_check hardware = (<lesson_struct>.hardware)
			addparam \{structure_name = focus_params
				name = not_focusable
				value = 1}
		endif
	endif
	add_generic_tutorial_menu_icon_item {
		icon = <icon>
		text = <text>
		pad_choose_script = generic_event_choose
		pad_choose_params = {
			state = uistate_tutorial_setup
			data = {
				tutorial_header = <tutorial_header>
				tutorial_id = (<tutorial_struct>.id)
				lesson_id = (<lesson_struct>.id)
			}
		}
		<focus_params>
		additional_focus_script = tutorial_system_menu_focus
		additional_focus_params = {item_struct = <lesson_struct>}
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
endscript

script ui_destroy_tutorial_menu_lessons 
	destroy_generic_menu
endscript
