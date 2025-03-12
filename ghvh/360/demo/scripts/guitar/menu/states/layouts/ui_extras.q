
script ui_create_extras 
	spawnscriptnow \{skate8_sfx_backgrounds_new_area
		params = {
			bg_sfx_area = frontend_menu_music
		}}
	if getpakmancurrent \{map = zones}
		if NOT (<pak> = z_soundcheck)
			spawnscriptnow ui_create_extras_spawned params = {<...> spawned}
			return
		endif
	endif
	ui_create_extras_spawned
endscript

script ui_destroy_extras 
	killspawnedscript \{name = ui_create_extras_spawned}
	generic_ui_destroy
endscript

script ui_create_extras_spawned 
	if gotparam \{spawned}
		create_loading_screen
		destroy_band
		destroy_bandname_viewport
		frontend_load_soundcheck
		destroy_loading_screen
	endif
	backstage_create_menu \{title = qs(0xa43d5ac3)}
	add_menu_frontend_item \{text = qs(0xd3213838)
		desc = 'backstage_menu_text'
		choose_state = uistate_setlist_lyrics
		font = fontgrid_text_3
		internal_scale = 1}
	add_menu_frontend_item \{text = qs(0x96ef5e32)
		desc = 'backstage_menu_text'
		choose_state = uistate_soundboard
		font = fontgrid_text_3
		internal_scale = 1}
	add_menu_frontend_item \{text = qs(0xeb365db4)
		choose_state = uistate_bonus_videos_credits
		desc = 'backstage_menu_text'
		font = fontgrid_text_3
		internal_scale = 1}
	if gotparam \{spawned}
		launchevent type = focus target = current_menu data = {child_index = <selected_index>}
	endif
	menu_finish
endscript

script ui_extras_anim_in 
	menu_transition_in \{menu = current_menu_anchor
		anim_type = zoom_blur}
endscript

script ui_extras_anim_out 
	menu_transition_out \{menu = current_menu_anchor
		anim_type = zoom_blur}
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
	wait \{2
		seconds}
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
	wait \{3
		seconds}
	se_setprops \{eye_whole_pos = (95.0, 120.0)
		time = 0.02
		motion = ease_in}
	se_setprops \{zombie_skull_pupil_pos = (176.443, -363.7636)
		motion = ease_in}
	se_waitprops
	wait \{2
		seconds}
	se_setprops \{eye_whole_pos = (80.0, 105.0)
		time = 0.02
		motion = ease_in}
	se_waitprops
	se_setprops \{zombie_skull_pupil_pos = (175.443, -363.7636)
		time = 0.05
		motion = ease_in}
	se_setprops \{eye_whole_pos = (100.0, 100.0)}
	se_waitprops
	wait \{0.5
		seconds}
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
	wait \{0.2
		seconds}
	se_setprops eye_whole_pos = (100.0, 90.0) time = <time> motion = ease_in
	se_setprops \{zombie_skull_pupil_scale = 1.0
		time = 0.05
		motion = ease_in}
	se_waitprops
	wait \{0.5
		seconds}
	se_setprops eye_whole_pos = (90.0, 90.0) time = <time> motion = ease_in
	se_waitprops
	wait \{0.2
		seconds}
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
