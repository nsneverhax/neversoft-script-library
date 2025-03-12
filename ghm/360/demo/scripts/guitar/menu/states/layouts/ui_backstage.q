
script ui_create_backstage 
	update_ingame_controllers controller = ($primary_controller)
	if getpakmancurrent \{map = zones}
		if NOT (<pak> = z_soundcheck)
			spawnscriptnow ui_create_backstage_spawned params = {<...> spawned}
			return
		endif
	endif
	ui_create_backstage_spawned
endscript

script ui_destroy_backstage 
	killspawnedscript \{name = ui_create_backstage_spawned}
	killspawnedscript \{name = backstage_skull_anim}
	generic_ui_destroy
endscript

script ui_deinit_backstage 
	change \{practice_enabled = 0}
endscript

script ui_create_backstage_spawned 
	change \{rich_presence_context = presence_menus}
	if gotparam \{spawned}
		create_loading_screen
		destroy_band
		destroy_bandname_viewport
		frontend_load_soundcheck
		destroy_loading_screen
	endif
	signin_params = {local}
	if isps3
		signin_params = {}
	endif
	if NOT checkforsignin <signin_params> controller_index = ($primary_controller)
		not_signed_in = 1
	endif
	createscreenelement {
		type = descinterface
		desc = 'backstage'
		id = current_menu_anchor
		parent = root_window
		just = [center center]
		exclusive_device = ($primary_controller)
	}
	if current_menu_anchor :desc_resolvealias \{name = alias_menu_items}
		assignalias id = <resolved_id> alias = current_menu
		current_menu :se_setprops \{event_handlers = [
				{
					pad_back
					generic_event_back
				}
			]}
		add_menu_frontend_item \{text = qs(0x6fc392c5)
			pad_choose_script = ui_select_practice_mode_choose
			pad_choose_params = {
				practice = 1
			}
			focus_script = ui_backstage_focus
			unfocus_script = ui_backstage_unfocus
			font = fontgrid_text_a8
			internal_scale = 1}
		<item_container_id> :se_setprops focusable = false alpha = 0.4
		add_menu_frontend_item \{text = qs(0x200cb5ef)
			choose_state = uistate_extras
			focus_script = ui_backstage_focus
			unfocus_script = ui_backstage_unfocus
			font = fontgrid_text_a8
			internal_scale = 1}
		<item_container_id> :se_setprops focusable = false alpha = 0.4
		add_menu_frontend_item \{text = qs(0x21790444)
			pad_choose_script = main_menu_select_cas
			focus_script = ui_backstage_focus
			unfocus_script = ui_backstage_unfocus
			font = fontgrid_text_a8
			internal_scale = 0.95}
		add_menu_frontend_item \{text = qs(0x28d033df)
			choose_state = uistate_top_rockers_mode
			focus_script = ui_backstage_focus
			unfocus_script = ui_backstage_unfocus
			font = fontgrid_text_a8
			internal_scale = 1}
		<item_container_id> :se_setprops focusable = false alpha = 0.4
		add_menu_frontend_item \{text = qs(0x12c4b22a)
			choose_state = uistate_guitarhero_com
			focus_script = ui_backstage_focus
			unfocus_script = ui_backstage_unfocus
			font = fontgrid_text_a8
			internal_scale = 1}
		<item_container_id> :se_setprops focusable = false alpha = 0.4
		if gotparam \{not_signed_in}
		endif
		current_menu :obj_spawnscript \{highlight_motion}
		if gotparam \{spawned}
			launchevent type = focus target = current_menu data = {child_index = <selected_index>}
		endif
	endif
	current_menu_anchor :obj_spawnscriptnow \{backstage_skull_anim}
	menu_finish
	destroy_loading_screen
endscript

script backstage_skull_anim 
	se_getprops \{backstage_skull_anim_pos}
	<org_pos> = <backstage_skull_anim_pos>
	begin
	<scale> = Random (@ 1.1 @ 1.3 @ 1 )
	a = Random (@ 1.2 @ 0.5 @ 1 )
	se_setprops \{backstage_skull_anim_pos = (100.0, 100.0)}
	se_setprops \{burning_skull_jaw_rot_angle = 0}
	se_setprops \{burning_skull_jaw_rot_angle = 10
		time = 0.02
		motion = linear}
	se_setprops backstage_skull_anim_scale = <scale> time = 0.05
	se_setprops \{backstage_skull_anim_pos = (111.0, 115.0)
		time = 0.02
		motion = ease_in}
	se_waitprops
	se_setprops \{burning_skull_jaw_rot_angle = -2
		time = 0.01
		motion = ease_in}
	se_setprops \{backstage_skull_anim_scale = 1.0
		time = 0.01
		motion = ease_in}
	se_setprops \{backstage_skull_anim_pos = (95.0, 92.0)
		time = 0.01
		motion = ease_in}
	se_waitprops
	se_setprops \{burning_skull_jaw_rot_angle = 0
		time = 0.02
		motion = ease_in}
	ui_fx_set_blur amount = <a>
	se_waitprops
	se_setprops \{burning_skull_jaw_rot_angle = -2
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{burning_skull_jaw_rot_angle = 0
		time = 0.05
		motion = ease_out}
	ui_fx_set_blur \{amount = 0.0}
	se_waitprops
	se_setprops \{burning_skull_jaw_rot_angle = -2
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{burning_skull_jaw_rot_angle = 0
		time = 0.02
		motion = ease_in}
	se_waitprops
	se_setprops \{burning_skull_jaw_rot_angle = -2
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{burning_skull_jaw_rot_angle = 0
		time = 0.05
		motion = ease_out}
	se_waitprops
	se_setprops \{burning_skull_jaw_rot_angle = -2
		time = 0.01
		motion = ease_out}
	se_waitprops
	se_setprops \{burning_skull_jaw_rot_angle = 20
		time = 0.05
		motion = ease_out}
	se_waitprops
	<time> = Random (@ 4 @ 5.5 @ 6 @ 5.2 @ 2.8 )
	wait <time> seconds
	repeat
endscript

script ui_backstage_focus 
	obj_getid
	gettags
	if current_menu_anchor :desc_resolvealias \{name = alias_highlight}
		wait \{2
			gameframe}
		<objid> :se_getparentid
		<parent_id> :se_getprops
		<resolved_id> :se_setprops rot_angle = <rot_angle>
		getscreenelementdims id = <objid>
		scale = (((1.0, 0.0) * (((<width> + 20.0) / 256.0))) + (0.0, 1.5))
		getscreenelementposition id = <objid> summed
		<resolved_id> :se_setprops pos = {absolute <screenelementpos>} scale = <scale>
		<resolved_id> :se_waitprops
		getscreenelementposition id = <objid> summed
		<resolved_id> :se_setprops pos = {absolute (<screenelementpos> + (0.0, -10.0))} time = 0.05
		<resolved_id> :se_waitprops
		getscreenelementposition id = <objid> summed
		<resolved_id> :se_setprops pos = {absolute <screenelementpos>} scale = <scale> time = 0.05
		<resolved_id> :se_waitprops
	endif
endscript

script ui_backstage_unfocus 
endscript

script ui_backstage_anim_in 
	menu_transition_in \{menu = current_menu_anchor}
endscript

script ui_backstage_anim_out 
	menu_transition_out \{menu = current_menu_anchor}
endscript
