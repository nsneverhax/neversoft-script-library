
script ui_init_gig_posters 
	cas_destroy_all_characters
endscript

script ui_create_gig_posters 
	destroy_loading_screen
	SpawnScriptNow create_gig_posters_menu params = <...>
endscript

script ui_destroy_gig_posters 
	destroy_gig_posters_menu
	clean_up_user_control_helpers
endscript

script ui_create_handslapper \{Pos = (640.0, 360.0)
		time = 0.2
		callback = nullscript}
	if ScreenElementExists \{id = handslapper}
		DestroyScreenElement \{id = handslapper}
	endif
	CreateScreenElement \{parent = root_window
		id = handslapper
		Type = descinterface
		desc = 'gig_board_handslapper'
		z_priority = 0}
	handslapper :Obj_SpawnScriptNow anim_handslapper params = {Pos = <Pos> time = <time> callback = <callback>}
endscript

script anim_handslapper 
	se_setprops {
		handslapper_pos = <Pos>
		handslapper_scale = 5
		handslapper_alpha = 0
		handslapper_open_alpha = 0
		fireburst_01_alpha = 0
		fireburst_02_alpha = 0
		fireburst_03_alpha = 0
		time = 0
	}
	se_waitprops
	se_setprops {
		handslapper_scale = 1
		handslapper_alpha = 1
		time = <time>
		motion = ease_in
	}
	se_waitprops
	SpawnScriptNow <callback>
	se_setprops \{handslapper_open_alpha = 1
		handslapper_closed_alpha = 0}
	se_setprops \{handslapper_scale = 1.1
		handslapper_sleeve_rot = -5
		time = 0.1
		motion = ease_out}
	se_waitprops
	se_setprops \{handslapper_scale = 1.0
		time = 0.1
		motion = ease_in}
	se_waitprops
	se_setprops \{fireburst_01_alpha = 1
		time = 0.1
		motion = ease_in}
	se_waitprops
	se_setprops \{fireburst_01_alpha = 0
		fireburst_02_alpha = 1
		time = 0.1}
	se_waitprops
	se_setprops \{fireburst_02_alpha = 0
		fireburst_03_alpha = 1
		time = 0.1}
	se_waitprops
	se_setprops {
		fireburst_03_alpha = 0
		fireburst_03_scale = (1.5, 1.7)
		fireburst_03_pos = (0.0, -150.0)
		handslapper_sleeve_rot = -15
		handslapper_pos = (<Pos> + (0.0, 50.0))
		time = 0.2
		motion = ease_out
	}
	se_waitprops
	se_setprops {
		handslapper_pos = (<Pos> + (0.0, 700.0))
		handslapper_alpha = 0
		handslapper_sleeve_rot = -30
		time = 0.8
		motion = ease_in
	}
	se_waitprops
	Die
endscript
