
script ui_create_practice_select_part \{rhythm_track = 0}
	destroy_loading_screen
	ui_get_controller_parts_allowed controller = ($primary_controller)
	make_generic_menu \{title = qs(0x6117f9fc)}
	get_song_rhythm_track song = ($current_song)
	<parts> = [
		{text = qs(0x9504b94a)
			rhythm_text = qs(0x0cc7d9b2)
			id = cpp_guitar
			part = guitar
		}
		{text = qs(0x7d4f9214)
			rhythm_text = qs(0x1f0659c1)
			id = cpp_bass
			part = bass
		}
		{text = qs(0x388cd3db)
			id = cpp_drum
			part = drum
		}
		{text = qs(0x1b9f6f84)
			id = cpp_vocals
			part = vocals
		}
	]
	<num_not_focusable> = 0
	GetArraySize <parts>
	<i> = 0
	begin
	<part_struct> = (<parts> [<i>])
	focus = {}
	if NOT StructureContains structure = <allowed> (<part_struct>.part)
		focus = {not_focusable}
		<num_not_focusable> = (<num_not_focusable> + 1)
	endif
	if (<rhythm_track> = 1)
		<part_text> = (<part_struct>.rhythm_text)
	else
		<part_text> = (<part_struct>.text)
	endif
	add_generic_menu_text_item {
		text = <part_text>
		pad_choose_script = ui_practice_select_part
		pad_choose_params = {part = (<part_struct>.part)}
		<focus>
	}
	i = (<i> + 1)
	repeat <array_Size>
	menu_finish
	if (<num_not_focusable> = 4)
		if isXenon
			warning_text = qs(0xec4dbd17)
		else
			warning_text = qs(0x588788f4)
		endif
		create_popup_warning_menu {
			textblock = {
				text = <warning_text>
			}
			player_device = ($primary_controller)
			options = [
				{
					func = generic_event_back
					text = qs(0x320a8d1c)
					no_sound
				}
			]
			no_background
		}
	endif
endscript

script ui_destroy_practice_select_part 
	if ScreenElementExists \{id = popup_warning_container}
		destroy_popup_warning_menu
	endif
	generic_ui_destroy
endscript

script ui_practice_select_part 
	ui_get_controller_parts_allowed controller = ($primary_controller)
	if NOT StructureContains structure = <allowed> <part>
		generic_event_choose state = uistate_select_instrument_warning data = {instrument = <part> controller = ($primary_controller)}
	endif
	Change structurename = player1_status part = <part>
	vocals_distribute_mics
	set_song_section_array \{Player = 1}
	generic_event_choose \{state = uistate_practice_select_difficulty}
endscript
