
script ui_create_extras 
	SpawnScriptNow \{Skate8_SFX_Backgrounds_New_Area
		params = {
			BG_SFX_Area = frontend_menu_music
		}}
	if GetPakManCurrent \{map = zones}
		if NOT (<pak> = z_soundcheck)
			SpawnScriptNow ui_create_extras_spawned params = {<...> spawned}
			return
		endif
	endif
	ui_create_extras_spawned
endscript

script ui_destroy_extras 
	KillSpawnedScript \{Name = ui_create_extras_spawned}
	KillSpawnedScript \{Name = extras_skull_anim}
	KillSpawnedScript \{Name = jaw_chatter}
	generic_ui_destroy
endscript

script ui_create_extras_spawned 
	if GotParam \{spawned}
		create_loading_screen
		destroy_band
		destroy_bandname_viewport
		frontend_load_soundcheck
		destroy_loading_screen
	endif
	CreateScreenElement {
		Type = descinterface
		desc = 'extras'
		id = current_menu_anchor
		parent = root_window
		just = [center center]
		exclusive_device = ($primary_controller)
	}
	if current_menu_anchor :desc_resolvealias \{Name = alias_menu_items}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :se_setprops \{spacing_between = 15
			event_handlers = [
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
		add_menu_frontend_item \{text = qs(0x1151140e)
			choose_state = uistate_bonus_videos
			focus_script = ui_backstage_focus
			unfocus_script = ui_backstage_unfocus
			internal_scale = 1}
		add_menu_frontend_item \{text = qs(0x5710d714)
			choose_state = uistate_setlist_lyrics
			focus_script = ui_backstage_focus
			unfocus_script = ui_backstage_unfocus
			internal_scale = 1}
		add_menu_frontend_item \{text = qs(0x92aa9e25)
			choose_state = uistate_gallery
			focus_script = ui_backstage_focus
			unfocus_script = ui_backstage_unfocus
			internal_scale = 1}
		add_menu_frontend_item \{text = qs(0x8df2d173)
			choose_state = uistate_soundboard
			focus_script = ui_backstage_focus
			unfocus_script = ui_backstage_unfocus
			internal_scale = 1}
		current_menu :obj_spawnscript \{highlight_motion}
		if GotParam \{spawned}
			LaunchEvent Type = focus target = current_menu data = {child_index = <selected_index>}
		endif
	endif
	current_menu_anchor :Obj_SpawnScriptNow \{extras_skull_anim}
	current_menu_anchor :Obj_SpawnScriptNow \{jaw_chatter}
	menu_finish
endscript

script ui_extras_anim_in 
	menu_transition_in \{menu = current_menu_anchor}
endscript

script ui_extras_anim_out 
	menu_transition_out \{menu = current_menu_anchor}
endscript

script extras_skull_anim 
	se_getprops \{eye_whole_pos}
	<org_pos> = <eye_whole_pos>
	r = Random (@ 1.1 @ -2 @ 2 @ -0.2 @ -3 )
	<time> = Random (@ 0.02 @ 0.01 @ 0.03 )
	begin
	se_setprops \{zombie_skull_pupil_pos = (175.443, -363.7636)}
	se_setprops \{eye_whole_pos = (100.0, 100.0)}
	se_setprops \{zombie_skull_bteeth_pos = (158.32951, 214.5378)}
	se_waitprops
	Wait \{2
		Seconds}
	se_setprops eye_whole_pos = (80.0, 110.0) time = <time> motion = ease_in
	se_setprops \{zombie_skull_pupil_scale = 1.0}
	se_waitprops
	se_setprops \{zombie_skull_pupil_scale = 1.5
		time = 0.05
		motion = ease_in}
	se_setprops \{zombie_skull_pupil_pos = (173.443, -363.7636)
		time = 0.05
		motion = ease_in}
	se_waitprops
	Wait \{3
		Seconds}
	se_setprops \{eye_whole_pos = (95.0, 120.0)
		time = 0.02
		motion = ease_in}
	se_setprops \{zombie_skull_pupil_pos = (176.443, -363.7636)
		motion = ease_in}
	se_waitprops
	Wait \{2
		Seconds}
	se_setprops \{eye_whole_pos = (80.0, 105.0)
		time = 0.02
		motion = ease_in}
	se_waitprops
	se_setprops \{zombie_skull_pupil_pos = (175.443, -363.7636)
		time = 0.05
		motion = ease_in}
	se_setprops \{eye_whole_pos = (100.0, 100.0)}
	se_waitprops
	Wait \{0.5
		Seconds}
	se_waitprops \{se_setprops
		zombie_skull_pupil_scale = 1.4
		time = 0.02
		motion = ease_out}
	se_waitprops
	se_setprops \{zombie_skull_pupil_scale = 1.9
		time = 0.02}
	se_waitprops
	se_setprops \{zombie_skull_pupil_scale = 1.0
		time = 0.05
		motion = ease_in}
	se_waitprops
	se_setprops \{zombie_skull_pupil_pos = (175.443, -363.7636)}
	se_setprops \{zombie_skull_pupil_scale = 1.0
		time = 0.05
		motion = ease_in}
	se_setprops \{eye_whole_pos = (100.0, 100.0)}
	se_waitprops
	se_setprops eye_whole_pos = (95.0, 105.0) time = <time> motion = ease_in
	se_setprops \{zombie_skull_pupil_scale = 1.5
		time = 0.05
		motion = ease_in}
	se_waitprops
	Wait \{0.2
		Seconds}
	se_setprops eye_whole_pos = (100.0, 90.0) time = <time> motion = ease_in
	se_setprops \{zombie_skull_pupil_scale = 1.0
		time = 0.05
		motion = ease_in}
	se_waitprops
	Wait \{0.5
		Seconds}
	se_setprops eye_whole_pos = (90.0, 90.0) time = <time> motion = ease_in
	se_waitprops
	Wait \{0.2
		Seconds}
	repeat
endscript

script jaw_chatter 
	se_getprops \{zombie_skull_bteeth_pos}
	<org_pos> = <zombie_skull_bteeth_pos>
	<time> = Random (@ 0.02 @ 0.01 @ 0.03 )
	begin
	se_setprops zombie_skull_bteeth_pos = (158.32951, 214.5378) time = <time> motion = ease_in
	se_waitprops
	se_setprops zombie_skull_bteeth_pos = (158.32951, 208.5378) time = <time> motion = ease_in
	se_waitprops
	repeat
endscript
