top_rockers_enabled = 0

script ui_init_top_rockers_mode 
	Change \{top_rockers_enabled = 1}
endscript

script ui_create_top_rockers_mode 
	0xc396230c \{state = 0x73b56f9e}
	if 0x8658e568
		destroy_loading_screen
	endif
	Change \{rich_presence_context = presence_leaderboards}
	Change lb_controller = ($primary_controller)
	CreateScreenElement {
		Type = descinterface
		desc = 'leaderboards'
		parent = root_window
		id = current_menu_anchor
		just = [center center]
		exclusive_device = ($primary_controller)
	}
	bx_createhighlightstars \{parent = current_menu_anchor
		focuswaittime = 2}
	if current_menu_anchor :desc_resolvealias \{Name = alias_menu_items}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops \{event_handlers = [
				{
					pad_up
					generic_menu_up_or_down_sound
					params = {
						up
					}
				}
				{
					pad_down
					generic_menu_up_or_down_sound
					params = {
						down
					}
				}
				{
					pad_back
					generic_event_back
				}
			]}
		if isXenon
			add_menu_frontend_item {
				text = qs(0x2725b21f)
				rgba = (($g_menu_colors).menu_title)
				not_focusable
				internal_scale = 2
				font = fontgrid_denim_title
				item_height = 70
			}
		else
			add_menu_frontend_item {
				text = qs(0x623fd166)
				rgba = (($g_menu_colors).menu_title)
				not_focusable
				internal_scale = 0.9
				font = fontgrid_denim_title
				item_height = 70
			}
		endif
		add_menu_frontend_item \{text = qs(0xd7809370)
			pad_choose_script = ui_leaderboard_group_select
			pad_choose_params = {
				group = song
			}
			focus_script = mainmenu_focus
			unfocus_script = mainmenu_unfocus
			internal_scale = 0.9}
		add_menu_frontend_item \{text = qs(0x5a4f279f)
			pad_choose_script = ui_leaderboard_group_select
			pad_choose_params = {
				group = career
			}
			focus_script = mainmenu_focus
			unfocus_script = mainmenu_unfocus
			internal_scale = 0.9}
		add_menu_frontend_item \{text = qs(0xd1cfe6c8)
			pad_choose_script = ui_leaderboard_list_cash
			focus_script = mainmenu_focus
			unfocus_script = mainmenu_unfocus
			internal_scale = 0.9}
		add_menu_frontend_item {
			text = qs(0x558a0b89)
			rgba = (($g_menu_colors).menu_title)
			not_focusable
			internal_scale = 0.9
			font = fontgrid_denim_title
			item_height = 70
		}
		add_menu_frontend_item \{text = qs(0x53edf88c)
			pad_choose_script = setup_top_rockers_single
			focus_script = mainmenu_focus
			unfocus_script = mainmenu_unfocus
			internal_scale = 0.9}
		LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
	endif
	menu_finish
	current_menu_anchor :Obj_SpawnScriptNow \{frontend_bg_swap}
endscript

script leaderboard_skull_anim 
	se_getprops \{pirate_skull_eye_pos}
	<org_pos> = <pirate_skull_eye_pos>
	se_getprops \{pirate_skull_eye_scale}
	<org_scale> = <pirate_skull_eye_scale>
	a = Random (@ 0.25 @ 0.05 @ 0.02 @ 0.065 )
	begin
	se_setprops \{pirate_skull_eye_pos = (141.9972, -72.655136)}
	se_waitprops
	se_setprops \{pirate_skull_eye_pos = (143.9972, -76.655136)
		time = 0.02
		motion = ease_in}
	se_waitprops
	se_setprops \{pirate_skull_eye_scale = 1.3
		time = 0.02
		motion = ease_in}
	se_waitprops
	se_setprops \{pirate_skull_eye_scale = 1.2
		time = 0.02
		motion = ease_in}
	se_waitprops
	se_setprops \{pirate_skull_eye_scale = 1.25
		time = 0.02
		motion = ease_in}
	se_waitprops
	time = Random (@ 2 @ 1.4 @ 0.5 @ 3 @ 0.5 )
	repeat
endscript

script ui_destroy_top_rockers_mode 
	KillSpawnedScript \{Name = frontend_bg_swap}
	generic_ui_destroy
endscript

script ui_deinit_top_rockers_mode 
	Change \{top_rockers_enabled = 0}
endscript

script ui_top_rockers_mode_anim_in 
	menu_transition_in \{menu = current_menu_anchor}
endscript

script ui_top_rockers_mode_anim_out 
	menu_transition_out \{menu = current_menu_anchor}
endscript

script ui_top_rockers_mode_focus 
	Obj_GetID
	GetTags
	if current_menu_anchor :desc_resolvealias \{Name = alias_highlight}
		Wait \{2
			gameframe}
		<objID> :se_getparentid
		<parent_id> :se_getprops
		<resolved_id> :se_setprops rot_angle = <rot_angle>
		GetScreenElementDims id = <objID>
		Scale = (((1.0, 0.0) * (((<width> + 20.0) / 256.0))) + (0.0, 1.5))
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute <screenelementpos>} Scale = <Scale>
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute (<screenelementpos> + (0.0, -10.0))} time = 0.05
		<resolved_id> :se_waitprops
		GetScreenElementPosition id = <objID> summed
		<resolved_id> :se_setprops Pos = {absolute <screenelementpos>} Scale = <Scale> time = 0.05
		<resolved_id> :se_waitprops
	endif
endscript

script ui_top_rockers_mode_unfocus 
endscript
