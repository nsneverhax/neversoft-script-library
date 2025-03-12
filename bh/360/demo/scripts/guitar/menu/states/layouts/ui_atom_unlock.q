
script ui_create_atom_unlock 
	if NOT gotparam \{atom}
		make_generic_menu \{title = qs(0x5dce9962)}
		add_generic_menu_text_item \{text = qs(0xd7fe2811)
			choose_state = uistate_atom_unlock
			choose_state_data = {
				atom = progression
			}}
		add_generic_menu_text_item \{text = qs(0x9a55b1e5)
			choose_state = uistate_atom_unlock
			choose_state_data = {
				atom = unlock
			}}
	else
		switch (<atom>)
			case progression
			make_generic_menu \{title = qs(0xa0aecfb3)
				scrolling
				selection_width = 625
				bg_scale = (1.5, 1.0)
				bg_pos = (-200.0, 0.0)}
			get_progression_globals <...>
			if NOT (<progression_global> = none)
				getarraysize $<progression_global>
				if (<array_size> > 0)
					i = 0
					begin
					formattext textname = name qs(0x0bc409e2) a = ($<progression_global> [<i>].name) dontassertforchecksums
					add_generic_menu_text_item {
						text = <name>
						pad_choose_script = ui_atom_unlock
						pad_choose_params = {name = progression atom = ($<progression_global> [<i>].name)}
						additional_focus_script = ui_atom_unlock_focus
						additional_focus_params = {atom = ($<progression_global> [<i>])}
					}
					i = (<i> + 1)
					repeat <array_size>
				endif
			endif
			case unlock
			make_generic_menu \{title = qs(0x3b1ac07f)
				scrolling
				selection_width = 625
				bg_scale = (1.5, 1.0)
				bg_pos = (-200.0, 0.0)}
			getarraysize \{$unlock_atoms}
			if (<array_size> > 0)
				i = 0
				begin
				formattext textname = name qs(0x0bc409e2) a = ($unlock_atoms [<i>].name) dontassertforchecksums
				add_generic_menu_text_item {
					text = <name>
					pad_choose_script = ui_atom_unlock
					pad_choose_params = {name = progression atom = ($unlock_atoms [<i>].name)}
					additional_focus_script = ui_atom_unlock_focus
					additional_focus_params = {atom = ($unlock_atoms [<i>])}
				}
				i = (<i> + 1)
				repeat <array_size>
			endif
		endswitch
	endif
	menu_finish
endscript

script ui_destroy_atom_unlock 
	generic_ui_destroy
endscript

script ui_atom_unlock 
	debugforceatomunlock name = <name> atom = <atom>
endscript

script ui_atom_unlock_focus 
endscript
