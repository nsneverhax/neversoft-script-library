
script ui_create_atom_unlock 
	if NOT GotParam \{atom}
		make_generic_menu \{title = qs(0x5dce9962)}
		add_generic_menu_text_item \{text = qs(0xd7fe2811)
			choose_state = uistate_atom_unlock
			choose_state_data = {
				atom = Progression
			}}
		add_generic_menu_text_item \{text = qs(0x9a55b1e5)
			choose_state = uistate_atom_unlock
			choose_state_data = {
				atom = unlock
			}}
	else
		switch (<atom>)
			case Progression
			make_generic_menu \{title = qs(0xa0aecfb3)
				scrolling
				selection_width = 625
				bg_scale = (1.5, 1.0)
				bg_pos = (-200.0, 0.0)}
			get_progression_globals <...>
			if NOT (<progression_global> = None)
				GetArraySize $<progression_global>
				if (<array_Size> > 0)
					i = 0
					begin
					formatText TextName = Name qs(0x0bc409e2) a = ($<progression_global> [<i>].Name) DontAssertForChecksums
					add_generic_menu_text_item {
						text = <Name>
						pad_choose_script = ui_atom_unlock
						pad_choose_params = {Name = Progression atom = ($<progression_global> [<i>].Name)}
						additional_focus_script = ui_atom_unlock_focus
						additional_focus_params = {atom = ($<progression_global> [<i>])}
					}
					i = (<i> + 1)
					repeat <array_Size>
				endif
			endif
			case unlock
			make_generic_menu \{title = qs(0x3b1ac07f)
				scrolling
				selection_width = 625
				bg_scale = (1.5, 1.0)
				bg_pos = (-200.0, 0.0)}
			GetArraySize \{$unlock_atoms}
			if (<array_Size> > 0)
				i = 0
				begin
				formatText TextName = Name qs(0x0bc409e2) a = ($unlock_atoms [<i>].Name) DontAssertForChecksums
				add_generic_menu_text_item {
					text = <Name>
					pad_choose_script = ui_atom_unlock
					pad_choose_params = {Name = Progression atom = ($unlock_atoms [<i>].Name)}
					additional_focus_script = ui_atom_unlock_focus
					additional_focus_params = {atom = ($unlock_atoms [<i>])}
				}
				i = (<i> + 1)
				repeat <array_Size>
			endif
		endswitch
	endif
	menu_finish
endscript

script ui_destroy_atom_unlock 
	generic_ui_destroy
endscript

script ui_atom_unlock 
	debugforceatomunlock Name = <Name> atom = <atom>
endscript

script ui_atom_unlock_focus 
endscript
