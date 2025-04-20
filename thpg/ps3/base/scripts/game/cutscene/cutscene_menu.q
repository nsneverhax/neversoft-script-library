cutscene_menu_override_mode = true
cutscene_menu_categories = [
	{
		MenuCategory = career
		label = "Career"
	}
	{
		MenuCategory = hardcore
		label = "Hardcore"
	}
	{
		MenuCategory = rigger
		label = "Rigger"
	}
	{
		label = "Other"
	}
]

script unlock_all_cutscenes 
endscript

script cutscene_scale_object \{scale_obj = skater
		startscale = 1
		endscale = 1
		sframes = 0}
endscript

script add_view_cutscenes_to_menu 
	getarraysize $skate_cutscene_info
	<i> = 0
	begin
	<info> = ($skate_cutscene_info [<i>])
	<i> = (<i> + 1)
	removeparameter show
	if gotparam MenuCategory
		<show> = false
		if structurecontains structure = <info> MenuCategory
			if checksumequals a = <MenuCategory> b = (<info>.MenuCategory)
				<show> = true
			endif
		endif
	else
		<show> = true
		if structurecontains structure = <info> MenuCategory
			<show> = false
		endif
	endif
	if (<show> = true)
		formattext textname = full_text "%b - %a" a = (<info>.name) b = (<info>.menutext)
		if structurecontains structure = <info> spacer
			<pad_choose_script> = nullscript
		else
			<pad_choose_script> = view_cutscene
		endif
		add_cas_menu_item {
			font_face = dialog
			text = <full_text>
			pad_choose_script = <pad_choose_script>
			pad_choose_params = {
				name = (<info>.name)
				MenuBarTitle = <MenuBarTitle>
				MenuCategory = <MenuCategory>
			}
		}
	endif
	repeat <array_size>
endscript

script launch_view_cutscenes_menu 
	create_view_cutscenes_menu <...>
endscript

script create_view_cutscenes_menu 
	make_cas_menu {
		dims = (600.0, 480.0)
		menu_id = view_cutscenes_menu
		vmenu_id = view_cutscenes_vmenu
		title = "CUTSCENES"
		scrolling
		pad_back_script = generic_menu_pad_back
		pad_back_params = {callback = create_debug_options_menu}
		not_centered
		pausemenu
	}
	foreachin $cutscene_menu_categories do = create_view_cutscenes_category_entry
	if ($cutscene_menu_override_mode = true)
		<toggle> = on
	else
		<toggle> = off
	endif
	add_cas_menu_item {
		extras_offset = (110.0, 0.0)
		id = menu_toggle_debug
		text = "FORCE PLAYMODE=FULL"
		toggle = <toggle>
		toggle_script = create_view_cutscenes_toggle_mode
		toggle_params = {}
	}
	cas_menu_finish
endscript

script create_view_cutscenes_toggle_mode 
	if ($cutscene_menu_override_mode = true)
		change \{cutscene_menu_override_mode = false}
	else
		change \{cutscene_menu_override_mode = true}
	endif
	printf ($cutscene_menu_override_mode)
endscript

script create_view_cutscenes_category_entry 
	formattext textname = MenuBarTitle "CUTSCENES - %a" a = <label>
	add_cas_menu_item {
		text = <MenuBarTitle>
		pad_choose_script = create_view_cutscenes_sub_menu
		pad_choose_params = {
			MenuBarTitle = <MenuBarTitle>
			MenuCategory = <MenuCategory>
		}
	}
endscript

script create_view_cutscenes_sub_menu 
	make_cas_menu {
		menu_id = view_cutscenes_menu
		vmenu_id = view_cutscenes_vmenu
		title = <MenuBarTitle>
		scrolling
		pad_back_script = generic_menu_pad_back
		pad_back_params = {callback = create_view_cutscenes_menu}
		not_centered
		width = 700
		pausemenu
	}
	add_view_cutscenes_to_menu {
		MenuBarTitle = <MenuBarTitle>
		MenuCategory = <MenuCategory>
	}
	cas_menu_finish
endscript

script view_cutscene 
	unpausegame
	pausemusic \{0}
	if screenelementexists \{id = helper_text_anchor}
		destroyscreenelement \{id = helper_text_anchor}
	endif
	Destroy_MenuFx
	playcutscene {
		<...>
		from_menu
		exitscript = view_cutscene_done
		exitparams = {
			MenuBarTitle = <MenuBarTitle>
			MenuCategory = <MenuCategory>
		}
	}
	runscriptonscreenelement \{id = current_menu_anchor
		menu_offscreen}
endscript

script view_cutscene_done 
	wait \{2
		gameframes}
	pausegame
	pausemusic \{1}
	startrendering
	Do_MenuFx fxparam = ($goal_ui_scheme.screen_fx)
	if gotparam \{MenuBarTitle}
		create_view_cutscenes_sub_menu {
			MenuBarTitle = <MenuBarTitle>
			MenuCategory = <MenuCategory>
		}
	else
		create_view_cutscenes_menu
	endif
endscript
