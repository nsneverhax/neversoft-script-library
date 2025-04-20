ui_repos_skater = 0

script ui_create_cas_base 
	printf \{"UI: ui_create_cas_base"}
	pause_menu_fmv_kill
	getcurrentlevel
	if (<level> = load_z_mainmenu)
		pushassetcontext \{context = z_mainmenu}
	else
		pushassetcontext \{context = z_bedroom}
	endif
	create_edit_skater_menu \{came_from_main_menu}
endscript

script ui_destroy_cas_base 
	soundevent \{event = CAS_Pan_Left_SFX}
	printf \{"UI: ui_destroy_cas_base"}
	generic_ui_destroy
	popassetcontext
endscript
