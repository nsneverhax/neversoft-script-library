
script togglerigidbodydebug 
	script_assert \{"This cfunc has been deprecated (due to the removal of CRigidBodyOldComponent)."}
endscript

script GetRigidBodyDebugData 
	script_assert \{"This cfunc has been deprecated (due to the removal of CRigidBodyOldComponent)."}
endscript

script create_debug_menu 
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	pause_menu_gradient off
	make_cas_menu {
		menu_id = debug_menu
		vmenu_id = debug_vmenu
		title = "DEBUG"
		scrolling
		pad_back_script = generic_menu_pad_back
		pad_back_params = {callback = create_debug_options_menu}
		pausemenu
		width = 750
	}
	add_cas_menu_item text = "Launch Viewer" id = menu_launchviewer pad_choose_script = debug_menu_launch_viewer
	add_cas_menu_item text = "Toggle Render Metrics" id = menu_rendermetrics pad_choose_script = show_render_metrics_toggle
	add_cas_menu_item text = "Toggle Lock Frustrum" pad_choose_script = lock_frustums_toggle
	add_cas_menu_item text = "Toggle Uberfrig Lines" pad_choose_script = toggle_uberfrig_lines
	add_cas_menu_item text = "Find Geo Seams" pad_choose_script = debug_find_geo_seams
	add_cas_menu_item text = "Dump Heaps" id = menu_dumpheaps pad_choose_script = debug_dumpheaps
	add_cas_menu_item text = "Screen Calibration" id = menu_screencal pad_choose_script = debug_screencal
	add_cas_menu_item text = "Toggle Skater Pos" id = skaterpos pad_choose_script = show_skater_coords
	add_cas_menu_item text = "Camera: Standard" pad_choose_script = skatercam_standard_menu_create
	add_cas_menu_item text = "Camera: Dramatic" pad_choose_script = skatercam_dramatic_menu_create
	add_cas_menu_item text = "Tweak Processor Params" id = processor pad_choose_script = debug_tweak_processor_params
	add_cas_menu_item text = "Rail Display Toggle" pad_choose_script = toggle_rails
	add_cas_menu_item text = "Bouncy Object Debug Display Toggle" pad_choose_script = toggle_rigidbody
	add_cas_menu_item text = "Toggle Debug Camera" pad_choose_script = toggle_debug_camera
	add_cas_menu_item text = "Toggle Ragdoll Bail" pad_choose_script = toggle_ragdoll_bail
	add_cas_menu_item text = "Toggle Ped NavMesh Polys" id = navmesh_poly pad_choose_script = toggle_navmesh_polydraw
	add_cas_menu_item text = "Toggle Ped NavMesh Lines" id = navmesh_lines pad_choose_script = toggle_navmesh_draw
	add_cas_menu_item text = "Toggle Ped Debug Info" id = menu_peddebug pad_choose_script = toggle_ped_debug
	add_cas_menu_item text = "Toggle Profiler" id = menu_profiler pad_choose_script = launch_toggle_profiler
	add_cas_menu_item text = "Toggle FPS Display" id = menu_fps pad_choose_script = launch_toggle_fps
	add_cas_menu_item text = "Toggle Feeler Stats" id = menu_feeler_stats pad_choose_script = launch_toggle_feeler_stats pad_choose_params = {display_offset = (0.0, 50.0)}
	add_cas_menu_item text = "Toggle Anim Times" id = menu_anim_times pad_choose_script = launch_toggle_anim_times
	add_cas_menu_item text = "Toggle Anim Cache State" id = menu_animcache_state pad_choose_script = launch_toggle_animcache_state pad_choose_params = {display_offset = (0.0, 50.0)}
	add_cas_menu_item text = "Toggle Anim Count" id = menu_animcount pad_choose_script = ToggleAnimCount
	add_cas_menu_item text = "Toggle Rigid Body Times" id = menu_rigid_body_times pad_choose_script = launch_toggle_rigid_body_times
	add_cas_menu_item text = "Toggle Particle Times" id = menu_particle_times pad_choose_script = launch_toggle_particle_times
	add_cas_menu_item text = "Toggle Particle Emit Dir Display" id = menu_emit pad_choose_script = launch_toggle_emit_dir
	add_cas_menu_item text = "Toggle Model Scene Light Display" id = menu_light_model pad_choose_script = launch_toggle_lights pad_choose_params = {light_type = model}
	add_cas_menu_item text = "Toggle Geom Scene Light Display" id = menu_light_geom pad_choose_script = launch_toggle_lights pad_choose_params = {light_type = geom}
	add_cas_menu_item text = "Toggle Active Scene Light Display" id = menu_light_active pad_choose_script = launch_toggle_lights pad_choose_params = {light_type = active}
	add_cas_menu_item text = "Toggle Geom Stats" id = menu_geom_stats pad_choose_script = launch_toggle_geom_stats
	add_cas_menu_item text = "Toggle Poly Count" id = menu_poly pad_choose_script = show_poly_count
	add_cas_menu_item text = "Toggle Free Memory" id = menu_mem pad_choose_script = show_free_mem
	add_cas_menu_item text = "Toggle Struct Usage" id = menu_struct_usage pad_choose_script = toggle_struct_usage
	add_cas_menu_item text = "Toggle Got Cash Msg" id = menu_struct_usage pad_choose_script = toggle_got_cash_Msg
	add_cas_menu_item text = "Defrag Animation Cache" id = menu_defrag_anim pad_choose_script = show_defrag_anim_cache
	if cd
		add_cas_menu_item text = "Start AutoTest" id = menu_start_autotest pad_choose_script = menu_start_autotest
		add_cas_menu_item text = "Stop AutoTest" id = menu_stop_autotest pad_choose_script = menu_stop_autotest
	endif
	add_cas_menu_item text = "Wireframe Toggle" pad_choose_script = toggle_wireframe
	add_cas_menu_item text = "Wireframe Skins Toggle" pad_choose_script = toggle_wireframe_skins
	add_cas_menu_item text = "Show Vert Polys" pad_choose_script = toggle_show_polys pad_choose_params = {showscript = show_vert}
	add_cas_menu_item text = "Show Wallride Polys" pad_choose_script = toggle_show_polys pad_choose_params = {showscript = show_wallride}
	add_cas_menu_item text = "Show Trigger Polys" pad_choose_script = toggle_show_polys pad_choose_params = {showscript = show_trigger}
	add_cas_menu_item text = "Show Camera Polys" pad_choose_script = toggle_show_polys pad_choose_params = {showscript = show_camera_collide}
	add_cas_menu_item text = "Show Not Skateable" pad_choose_script = toggle_show_polys pad_choose_params = {showscript = show_not_skatable}
	add_cas_menu_item text = "Hide HUD" pad_choose_script = debug_menu_hide_hud
	add_cas_menu_item text = "Graphic Test" pad_choose_script = launch_graphic_test
	add_cas_menu_item text = "CAS Skater Select" pad_choose_script = launch_cas_skater_select
	add_cas_menu_item text = "Toggle Goal States Display" pad_choose_script = toggle_goal_states_display
	add_cas_menu_item text = "Toggle Lifestyle Display" pad_choose_script = toggle_lifestyle_display
	add_cas_menu_item text = "Create Test Vehicle" pad_choose_script = ui_debug_test_vehicles
	add_cas_menu_item text = "Never Rain" pad_choose_script = ui_debug_disable_rain
	add_cas_menu_item text = "Always Rain" pad_choose_script = ui_debug_enable_rain
	add_cas_menu_item text = "Goal Track Teleport" pad_choose_script = ui_debug_toggle_goal_track_teleport
	add_cas_menu_item text = "Toggle All Goals" pad_choose_script = ui_debug_toggle_all_goals
	add_cas_menu_item text = "Toggle CAP piece names" pad_choose_script = debug_toggle_cap_names
	add_cas_menu_item text = "Toggle version number" pad_choose_script = debug_toggle_changelist
	add_cas_menu_item text = "Done" id = menu_done pad_choose_script = create_debug_options_menu
	cas_menu_finish
endscript

script launch_cas_skater_select 
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	make_cas_menu {
		title = "SKATER"
		pad_back_script = create_debug_menu
	}
	GetCurrentSkaterProfileIndex
	GetSingleSkaterProfileInfo player = <currentskaterprofileindex> character_type
	GetCharacterTypeName character_type = <character_type>
	add_cas_menu_item {
		text = "CHARACTER:"
		extra_text = <character_type_name>
		option_arrows
		option_arrows_callback = debug_change_character
	}
	add_cas_menu_item {
		text = "DONE"
		pad_choose_script = create_debug_menu
	}
	cas_menu_finish
endscript

script debug_screencal 
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = screencal_container
		pos = (0.0, 0.0)
		just = [center center]
		event_handlers = [
			{pad_back create_debug_menu}
		]
	}
	assignalias id = screencal_container alias = current_menu_anchor
	createscreenelement {
		type = spriteelement
		texture = video_calibration_x
		parent = screencal_container
		scale = 0.4
		pos = (320.0, 220.0)
		z_priority = 10
	}
	createscreenelement {
		type = spriteelement
		texture = white
		parent = screencal_container
		scale = (170.0, 120.0)
		pos = (320.0, 220.0)
		z_priority = 1
		rgba = [0 0 0 255]
	}
	launchevent type = focus target = current_menu_anchor
	create_helper_text helper_text_elements = [{text = "\\m1 Back"}]
endscript

script debug_change_character_at_launch 
	begin
	if objectexists \{id = skater}
		break
	endif
	wait \{10
		frames}
	repeat
	wait \{10
		frames}
	GetCurrentSkaterProfileIndex
	SetSkaterProfileInfo player = <currentskaterprofileindex> params = {character_type = <character_type>}
	GetCharacterAppearance character_type = <character_type>
	SetPlayerAppearance player = <currentskaterprofileindex> appearance_structure = <character_appearance>
	RefreshSkaterModel skater = 0 profile = <currentskaterprofileindex>
endscript

script debug_change_character 
	if NOT objectexists id = skater
		spawnscriptlater debug_change_character_at_launch params = {<...>}
		return
	endif
	GetCurrentSkaterProfileIndex
	if NOT gotparam character_type
		if NOT infrontend
			GetSingleSkaterProfileInfo player = <currentskaterprofileindex> character_type
			getsingletag id
			if gotparam left
				GetCharacterIterated character_type = <character_type> down
			else
				GetCharacterIterated character_type = <character_type> up
			endif
			GetCharacterTypeName character_type = <character_type>
			setscreenelementprops {id = {<id> child = extra_text} text = <character_type_name>}
		endif
	endif
	SetSkaterProfileInfo player = <currentskaterprofileindex> params = {character_type = <character_type>}
	GetCharacterAppearance character_type = <character_type>
	SetPlayerAppearance player = <currentskaterprofileindex> appearance_structure = <character_appearance>
	RefreshSkaterModel skater = 0 profile = <currentskaterprofileindex>
endscript

script debug_dumpheaps 
	dumpheaps
endscript

script debug_pendingzone 
	FinishPendingZoneLoads
endscript

script debug_menu_hide_hud 
	if ($ui_gameplay_show_hud = 1)
		change \{ui_gameplay_show_hud = 0}
	else
		change \{ui_gameplay_show_hud = 1}
	endif
	do_actual_unpause
	ui_change_state \{state = uistate_gameplay}
endscript

script exit_test_menu 
	if (istrue $useplayerposforviewerobjpos)
		skater :unhide
	endif
	create_debug_options_menu
endscript

script create_test_menu 
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	pause_menu_gradient off
	dialog_box_exit
	make_new_menu {
		menu_id = debug_menu
		vmenu_id = debug_vmenu
		menu_title = "TEST"
		type = vscrollingmenu
		dims = (200.0, 350.0)
		padding_scale = 0.95
		pos = (543.0, 350.0)
	}
	setscreenelementprops {id = debug_menu
		event_handlers = [
			{pad_back exit_test_menu}
		]
	}
	make_text_sub_menu_item text = "Toggle Memory Card Test" id = menu_memcard pad_choose_script = memcardtest_toggle
	make_text_sub_menu_item text = "View Cars" id = menu_view_car_models pad_choose_script = launch_view_models_menu pad_choose_params = {model_set = car}
	make_text_sub_menu_item text = "View Cutscenes" id = menu_view_cutscenes pad_choose_script = launch_view_cutscenes_menu
	make_text_sub_menu_item text = "dialog box" id = menu_dialog pad_choose_script = create_test_dialog
	make_text_sub_menu_item text = "Face Texture Test" id = menu_face_texture pad_choose_script = face_texture_test
	make_text_sub_menu_item text = "View High Scores" id = menu_hs_displaye pad_choose_script = high_scores_menu_create pad_choose_params = {new_initials = "ABC"}
	make_text_sub_menu_item text = "Keyboard" pad_choose_script = launch_keyboard
	make_text_sub_menu_item text = "Done" id = menu_done pad_choose_script = create_debug_options_menu
	runscriptonscreenelement id = current_menu_anchor animate_in params = {final_pos = (320.0, 134.0)}
endscript

script autorail_level 
	Autorail
endscript

script hole_check 
	checkforholes
	pause_game_and_create_pause_menu
endscript

script launch_toggle_profiler 
	togglemetrics
	pause_game_and_create_pause_menu
endscript

script launch_toggle_fps 
	togglefps
	pause_game_and_create_pause_menu
endscript

script launch_toggle_anim_times 
	ToggleAnimTimes
	pause_game_and_create_pause_menu
endscript

script launch_toggle_rigid_body_times 
	ToggleRigidBodyTimes
	pause_game_and_create_pause_menu
endscript

script launch_toggle_particle_times 
	ToggleParticleTimes
	pause_game_and_create_pause_menu
endscript

script launch_toggle_emit_dir 
	ToggleDrawEmitDir
	pause_game_and_create_pause_menu
endscript

script launch_toggle_lights 
	ToggleDrawLights <...>
	pause_game_and_create_pause_menu
endscript

script launch_toggle_geom_stats 
	ToggleGeomStats
	pause_game_and_create_pause_menu
endscript

script toggle_rails 
	ToggleRails
	pulse_item
endscript

script toggle_rigidbody 
	togglerigidbodydebug
	pulse_item
endscript
Debug_Camera_On = 0

script toggle_debug_camera 
	if skater :obj_hascomponent \{debugcamera}
		if (Debug_Camera_On = 1)
			change \{Debug_Camera_On = 0}
			skater :debugcamera_disable
		else
			change \{Debug_Camera_On = 1}
			skater :debugcamera_enable
		endif
	endif
endscript

script toggle_ragdoll_bail 
	if ($Bails_Disabled = 1)
		change \{Bails_Disabled = 0}
	else
		change \{Bails_Disabled = 1}
	endif
	pulse_item
endscript

script toggle_wireframe 
	togglerendermode
	show_all
	pulse_item
endscript
toggled_geom_stats_on = 0

script ToggleGeomStats 
	if ($toggled_geom_stats_on = 1)
		change toggled_geom_stats_on = 0
		killspawnedscript name = refreshgeomstatsdisplay
		wait 0.2 seconds
		if objectexists id = geom_stats_anchor
			destroyscreenelement id = geom_stats_anchor
		endif
	else
		change toggled_geom_stats_on = 1
		setscreenelementlock id = root_window off
		if objectexists id = geom_stats_anchor
			destroyscreenelement id = geom_stats_anchor
		endif
		createscreenelement {
			type = containerelement
			parent = root_window
			id = geom_stats_anchor
			pos = (430.0, 80.0)
			just = [center center]
			internal_just = [left center]
		}
		createscreenelement {
			type = textblockelement
			parent = geom_stats_anchor
			id = geom_stats_text
			pos = (0.0, -47.0)
			dims = (300.0, 100.0)
			allow_expansion
			text = "blah"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.7
			line_spacing = 0.8
		}
		setscreenelementlock id = root_window on
		spawnscriptlater refreshgeomstatsdisplay
	endif
endscript

script refreshgeomstatsdisplay interval = 0.1
	begin
	if objectexists id = geom_stats_anchor
		getcurrentgeomstats
		formattext {textname = gstat
			"Total=%a\\nInactive=%b\\nSky=%c\\nTransformed=%d\\nInstances=%%instance\\nSkeletal=%e\\nCameraSphere=%f\\nClipCull=%g\\nCulled=%h\\nLeafCulled=%i\\nBoxCheck=%j\\nBocCheckCulled=%k\\nOccludeCheck=%l\\nOccludedObject=%m\\nnOccludedLeaf=%%occluded_leaf\\nColored=%n\\nLeaf=%o\\nMinLeaf=%p\\nWibbleUV=%q\\nWibbleVC=%r\\nEnvMapped=%s\\nSendContext=%t\\nSorted=%u\\nShadow=%v\\nBillboard=%w\\nFastParticles=%x\\nFastParticleSys=%%fast_sys\\nFlexParticles=%y\\nFlexParticleSys=%z\\nFlexParticlePrims=%_"
			a = <geom_stats_total>
			b = <geom_stats_inactive>
			c = <geom_stats_sky>
			d = <geom_stats_transformed>
			instance = <geom_stats_instance>
			e = <geom_stats_skeletal>
			f = <geom_stats_camera_sphere>
			g = <geom_stats_clipcull>
			h = <geom_stats_culled>
			i = <geom_stats_leaf_culled>
			j = <geom_stats_boxcheck>
			k = <geom_stats_boxcheck_culled>
			l = <geom_stats_occludecheck>
			m = <geom_stats_occluded_object>
			occluded_leaf = <geom_stats_occluded_leaf>
			n = <geom_stats_colored>
			o = <geom_stats_leaf>
			p = <geom_stats_minimal_leaf>
			q = <geom_stats_wibbleUV>
			r = <geom_stats_wibbleVC>
			s = <geom_stats_envmapped>
			t = <geom_stats_sendcontext>
			u = <geom_stats_sorted>
			v = <geom_stats_shadow>
			w = <geom_stats_billboard>
			x = <geom_stats_new_particles>
			fast_sys = <geom_stats_new_particle_systems>
			y = <geom_stats_old_particles>
			z = <geom_stats_old_particle_systems>
			_ = <geom_stats_old_particle_prims>
		}
		setscreenelementprops id = geom_stats_text text = <gstat>
	else
		killspawnedscript id = refreshgeomstatsdisplay
		change toggled_geom_stats_on = 0
	endif
	wait <interval> seconds
	repeat
endscript
DrawEmitLines = 0

script ToggleDrawEmitDir 
	if ($DrawEmitLines = 1)
		change \{DrawEmitLines = 0}
	else
		change \{DrawEmitLines = 1}
	endif
endscript
DrawModelLights = 0
DrawGeomLights = 0
DrawActiveLights = 0

script ToggleDrawLights 
	switch <light_type>
		case model
		if (($DrawModelLights) = 1)
			change DrawModelLights = 0
			DestroyLightCountDisplay <...>
		else
			change DrawModelLights = 1
			CreateLightCountDisplay <...>
		endif
		case geom
		if (($DrawGeomLights) = 1)
			change DrawGeomLights = 0
			DestroyLightCountDisplay <...>
		else
			change DrawGeomLights = 1
			CreateLightCountDisplay <...>
		endif
		case active
		if (($DrawActiveLights) = 1)
			change DrawActiveLights = 0
			DestroyLightCountDisplay <...>
		else
			change DrawActiveLights = 1
			CreateLightCountDisplay <...>
		endif
	endswitch
endscript

script CreateLightCountDisplay 
	switch <light_type>
		case model
		<root_id> = mlight_anchor
		<text_id> = mlight_text
		<text> = "Model Lights"
		<pos> = (400.0, 40.0)
		<rgba> = [255 255 0 255]
		case geom
		<root_id> = glight_anchor
		<text_id> = glight_text
		<text> = "Geom Lights"
		<pos> = (400.0, 55.0)
		<rgba> = [255 0 255 255]
		case active
		<root_id> = alight_anchor
		<text_id> = alight_text
		<text> = "Active Lights"
		<pos> = (400.0, 70.0)
		<rgba> = [255 0 0 255]
	endswitch
	setscreenelementlock id = root_window off
	createscreenelement {
		type = containerelement
		parent = root_window
		id = <root_id>
		pos = <pos>
		just = [center center]
		internal_just = [left center]
	}
	createscreenelement {
		type = textelement
		parent = <root_id>
		id = <text_id>
		pos = (0.0, 0.0)
		text = <text>
		font = text_a1
		rgba = <rgba>
		just = [left center]
		scale = 1.0
	}
	setscreenelementlock id = root_window on
endscript

script ModifyLightCountDisplay 
	switch <light_type>
		case model
		<text_id> = mlight_text
		formattext textname = text "Model Lights: %d/%e" e = <count> d = <active>
		case geom
		<text_id> = glight_text
		formattext textname = text "Geom Lights: %d/%e" e = <count> d = <active>
		case active
		<text_id> = alight_text
		formattext textname = text "Active Lights"
	endswitch
	if objectexists id = <text_id>
		setscreenelementprops id = <text_id> text = <text>
	endif
endscript

script DestroyLightCountDisplay 
	switch <light_type>
		case model
		<root_id> = mlight_anchor
		case geom
		<root_id> = glight_anchor
		case active
		<root_id> = alight_anchor
	endswitch
	if objectexists id = <root_id>
		destroyscreenelement id = <root_id>
	endif
endscript
toggled_fps_on = 0
framerate_warning = 29.0

script togglefps 
	if ($toggled_fps_on = 1)
		change toggled_fps_on = 0
		killspawnedscript name = refreshfpsdisplay
		wait 0.2 seconds
		if objectexists id = fps_anchor
			destroyscreenelement id = fps_anchor
		endif
	else
		change toggled_fps_on = 1
		setscreenelementlock id = root_window off
		if objectexists id = fps_anchor
			destroyscreenelement id = fps_anchor
		endif
		createscreenelement {
			type = containerelement
			parent = root_window
			id = fps_anchor
			pos = (50.0, 240.0)
			just = [center center]
			internal_just = [left center]
		}
		createscreenelement {
			type = textelement
			parent = fps_anchor
			id = fps_text
			pos = (20.0, -15.0)
			text = "FPS: "
			font = text_a1
			rgba = [120 120 200 200]
			just = [left center]
			scale = 0.75
		}
		createscreenelement {
			type = spriteelement
			parent = fps_anchor
			pos = (16.0, -34.0)
			texture = white2
			rgba = [10 10 10 180]
			just = [left top]
			scale = (19.5, 4.0)
			z_priority = 0
		}
		setscreenelementlock id = root_window on
		spawnscriptlater refreshfpsdisplay
	endif
endscript

script refreshfpsdisplay interval = 0.1
	begin
	if objectexists id = fps_anchor
		formattext textname = fps "FPS: %d" d = ($framerate_value)
		setscreenelementprops id = fps_text text = <fps>
		if (($framerate_value) < $framerate_warning)
			setscreenelementprops id = fps_text rgba = [160 20 20 255]
		else
			setscreenelementprops id = fps_text rgba = [100 100 100 255]
		endif
	else
		killspawnedscript id = refreshfpsdisplay
		change toggled_fps_on = 0
	endif
	wait <interval> seconds
	repeat
endscript

script toggle_city_map_cam_debug 
	if ($debug_city_map_cams = 0)
		change \{debug_city_map_cams = 1}
		spawnscriptnow \{noqbid
			debug_city_map_show_cams}
	else
		change \{debug_city_map_cams = 0}
		debug_city_map_show_cams \{die}
	endif
	pulse_item
endscript
show_goal_states = 0

script toggle_goal_states_display 
	killspawnedscript \{name = goal_debug_show_states}
	if ($show_goal_states = 0)
		change \{show_goal_states = 1}
		spawnscriptnow \{noqbid
			goal_debug_show_states}
	else
		change \{show_goal_states = 0}
		if screenelementexists \{id = goal_debug_state_menu}
			destroyscreenelement \{id = goal_debug_state_menu}
		endif
	endif
	pulse_item
endscript

script toggle_lifestyle_display 
	killspawnedscript \{name = test_lifestyle_weight}
	if ($test_lifestyle_display = 0)
		change \{test_lifestyle_display = 1}
		spawnscriptnow \{noqbid
			test_lifestyle_weight}
	else
		change \{test_lifestyle_display = 0}
		if screenelementexists \{id = test_lifestyle_weight_container}
			destroyscreenelement \{id = test_lifestyle_weight_container}
		endif
	endif
	pulse_item
endscript
AnimCount = 0

script ToggleAnimCount 
	if ($AnimCount = 1)
		change AnimCount = 0
		killspawnedscript name = RefreshAnimCount
		if objectexists id = animcount_anchor
			destroyscreenelement id = animcount_anchor
		endif
	else
		change AnimCount = 1
		setscreenelementlock id = root_window off
		if objectexists id = animcount_anchor
			destroyscreenelement id = animcount_anchor
		endif
		scale = 0.6
		rgba = [200 200 200 255]
		createscreenelement {
			type = containerelement
			parent = root_window
			id = animcount_anchor
			pos = (50.0, 240.0)
			just = [center center]
			internal_just = [left center]
		}
		createscreenelement {
			type = textelement
			parent = animcount_anchor
			id = text_anim_count_anim_single_frame
			pos = (20.0, 15.0)
			text = "Anims: "
			font = text_a1
			rgba = <rgba>
			just = [left center]
			scale = <scale>
		}
		createscreenelement {
			type = textelement
			parent = animcount_anchor
			id = text_anim_count_anim_multi_frame
			pos = (20.0, 35.0)
			text = "Anims: "
			font = text_a1
			rgba = <rgba>
			just = [left center]
			scale = <scale>
		}
		createscreenelement {
			type = textelement
			parent = animcount_anchor
			id = text_anim_count_anim_total
			pos = (20.0, 55.0)
			text = "Anims: "
			font = text_a1
			rgba = <rgba>
			just = [left center]
			scale = <scale>
		}
		createscreenelement {
			type = textelement
			parent = animcount_anchor
			id = text_anim_count_add
			pos = (20.0, 75.0)
			text = "Anims: "
			font = text_a1
			rgba = <rgba>
			just = [left center]
			scale = <scale>
		}
		createscreenelement {
			type = textelement
			parent = animcount_anchor
			id = text_anim_count_blend
			pos = (20.0, 95.0)
			text = "Anims: "
			font = text_a1
			rgba = <rgba>
			just = [left center]
			scale = <scale>
		}
		createscreenelement {
			type = spriteelement
			parent = animcount_anchor
			pos = (10.0, 0.0)
			texture = white2
			rgba = [10 10 10 180]
			just = [left top]
			scale = (30.0, 14.0)
			z_priority = 0
		}
		setscreenelementlock id = root_window on
		spawnscriptlater RefreshAnimCount
	endif
endscript

script RefreshAnimCount {
		interval = 0.1
		count_anim_single_frame_max = 200
		count_anim_multi_frame_max = 200
		count_anim_total_max = 20
		count_add_max = 200
		count_blend_max = 200
	}
	begin
	if objectexists id = animcount_anchor
		skater :anim_getcounts
		UpdateSingleAnimCount {
			id = text_anim_count_anim_single_frame
			count = <count_anim_single_frame>
			max = <count_anim_single_frame_max>
			string = "Single Frame Anims: %d"
		}
		UpdateSingleAnimCount {
			id = text_anim_count_anim_multi_frame
			count = <count_anim_multi_frame>
			max = <count_anim_multi_frame_max>
			string = "Multi Frame Anims: %d"
		}
		UpdateSingleAnimCount {
			id = text_anim_count_anim_total
			count = (<count_anim_multi_frame> + <count_anim_single_frame>)
			max = <count_anim_total_max>
			string = "Total Anims: %d"
		}
		UpdateSingleAnimCount {
			id = text_anim_count_add
			count = <count_add>
			max = <count_add_max>
			string = "Adds: %d"
		}
		UpdateSingleAnimCount {
			id = text_anim_count_blend
			count = <count_blend>
			max = <count_blend_max>
			string = "Blends: %d"
		}
	else
		killspawnedscript id = RefreshAnimCount
		change AnimCount = 0
	endif
	wait <interval> seconds
	repeat
endscript

script UpdateSingleAnimCount 
	formattext textname = text <string> d = <count>
	setscreenelementprops id = <id> text = <text>
	if (<count> > <max>)
		setscreenelementprops id = <id> rgba = [200 20 20 255]
	else
		setscreenelementprops id = <id> rgba = [100 100 100 255]
	endif
endscript
toggled_anim_times_on = 0

script ToggleAnimTimes 
	if (toggled_anim_times_on = 1)
		change toggled_anim_times_on = 0
		killspawnedscript name = RefreshAnimTimesDisplay
		wait 0.2 seconds
		if objectexists id = anim_times_anchor
			destroyscreenelement id = anim_times_anchor
		endif
		change min_anim_boned_frame_pcnt_1 = 999.0
		change min_anim_boned_frame_pcnt_2 = 999.0
		change max_anim_boned_frame_pcnt_1 = 0.0
		change max_anim_boned_frame_pcnt_2 = 0.0
		change min_anim_channel_frame_pcnt_1 = 999.0
		change min_anim_channel_frame_pcnt_2 = 999.0
		change max_anim_channel_frame_pcnt_1 = 0.0
		change max_anim_channel_frame_pcnt_2 = 0.0
		change min_anim_subset_frame_pcnt_1 = 999.0
		change min_anim_subset_frame_pcnt_2 = 999.0
		change max_anim_subset_frame_pcnt_1 = 0.0
		change max_anim_subset_frame_pcnt_2 = 0.0
	else
		change toggled_anim_times_on = 1
		setscreenelementlock id = root_window off
		if objectexists id = anim_times_anchor
			destroyscreenelement id = anim_times_anchor
		endif
		createscreenelement {
			type = containerelement
			parent = root_window
			id = anim_times_anchor
			pos = (30.0, 180.0)
			just = [center center]
			internal_just = [left center]
		}
		createscreenelement {
			type = textelement
			parent = anim_times_anchor
			id = anim_times_text
			pos = (0.0, -75.0)
			text = "Animation Blending (pcnt/frame):"
			font = text_a1
			rgba = [0 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = anim_times_anchor
			id = anim_times_p_text
			pos = (0.0, -60.0)
			text = "Primary (hero+horse):"
			font = text_a1
			rgba = [60 0 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = anim_times_anchor
			id = anim_times_boned_text
			pos = (0.0, -45.0)
			text = "Boned Frames"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = anim_times_anchor
			id = anim_times_channel_text
			pos = (0.0, -30.0)
			text = "Channels"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = anim_times_anchor
			id = anim_times_subset_text
			pos = (0.0, -15.0)
			text = "Subset"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = anim_times_anchor
			id = anim_times_total_text
			pos = (0.0, 0.0)
			text = "Total"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = anim_times_anchor
			id = anim_times_break_text
			pos = (0.0, 15.0)
			text = "--------------------------"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = anim_times_anchor
			id = anim_times_s_text
			pos = (0.0, 30.0)
			text = "Secondary (peds):"
			font = text_a1
			rgba = [60 0 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = anim_times_anchor
			id = anim_times_boned_text_2
			pos = (0.0, 45.0)
			text = "Boned Frames"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = anim_times_anchor
			id = anim_times_channel_text_2
			pos = (0.0, 60.0)
			text = "Channels"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = anim_times_anchor
			id = anim_times_subset_text_2
			pos = (0.0, 75.0)
			text = "Subset"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = anim_times_anchor
			id = anim_times_total_text_2
			pos = (0.0, 90.0)
			text = "Total"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		setscreenelementlock id = root_window on
		spawnscriptlater RefreshAnimTimesDisplay
	endif
endscript
min_anim_boned_frame_pcnt_1 = 999.0
min_anim_boned_frame_pcnt_2 = 999.0
max_anim_boned_frame_pcnt_1 = 0.0
max_anim_boned_frame_pcnt_2 = 0.0
min_anim_channel_frame_pcnt_1 = 999.0
min_anim_channel_frame_pcnt_2 = 999.0
max_anim_channel_frame_pcnt_1 = 0.0
max_anim_channel_frame_pcnt_2 = 0.0
min_anim_subset_frame_pcnt_1 = 999.0
min_anim_subset_frame_pcnt_2 = 999.0
max_anim_subset_frame_pcnt_1 = 0.0
max_anim_subset_frame_pcnt_2 = 0.0

script RefreshAnimTimesDisplay 
	begin
	if objectexists id = anim_times_anchor
		GetCurrentAnimTimes
		if (<primary_boned_time> > (max_anim_boned_frame_pcnt_1))
			if (<primary_boned_time> < 100.0)
				change max_anim_boned_frame_pcnt_1 = <primary_boned_time>
			endif
		else
			if (<primary_boned_time> < (min_anim_boned_frame_pcnt_1))
				change min_anim_boned_frame_pcnt_1 = <primary_boned_time>
			endif
		endif
		if (<secondary_boned_time> > (max_anim_boned_frame_pcnt_2))
			if (<secondary_boned_time> < 100.0)
				change max_anim_boned_frame_pcnt_2 = <secondary_boned_time>
			endif
		else
			if (<secondary_boned_time> < (min_anim_boned_frame_pcnt_2))
				change min_anim_boned_frame_pcnt_2 = <secondary_boned_time>
			endif
		endif
		if (<primary_channel_time> > (max_anim_channel_frame_pcnt_1))
			if (<primary_channel_time> < 100.0)
				change max_anim_channel_frame_pcnt_1 = <primary_channel_time>
			endif
		else
			if (<primary_channel_time> < (min_anim_channel_frame_pcnt_1))
				change min_anim_channel_frame_pcnt_1 = <primary_channel_time>
			endif
		endif
		if (<secondary_channel_time> > (max_anim_channel_frame_pcnt_2))
			if (<secondary_channel_time> < 100.0)
				change max_anim_channel_frame_pcnt_2 = <secondary_channel_time>
			endif
		else
			if (<secondary_channel_time> < (min_anim_channel_frame_pcnt_2))
				change min_anim_channel_frame_pcnt_2 = <secondary_channel_time>
			endif
		endif
		if (<primary_subset_time> > (max_anim_subset_frame_pcnt_1))
			if (<primary_subset_time> < 100.0)
				change max_anim_subset_frame_pcnt_1 = <primary_subset_time>
			endif
		else
			if (<primary_subset_time> < (min_anim_subset_frame_pcnt_1))
				change min_anim_subset_frame_pcnt_1 = <primary_subset_time>
			endif
		endif
		if (<secondary_subset_time> > (max_anim_subset_frame_pcnt_2))
			if (<secondary_subset_time> < 100.0)
				change max_anim_subset_frame_pcnt_2 = <secondary_subset_time>
			endif
		else
			if (<secondary_subset_time> < (min_anim_subset_frame_pcnt_2))
				change min_anim_subset_frame_pcnt_2 = <secondary_subset_time>
			endif
		endif
		formattext textname = test1 "Boned: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <primary_boned_time> e = (min_anim_boned_frame_pcnt_1) f = (max_anim_boned_frame_pcnt_1)
		setscreenelementprops id = anim_times_boned_text text = <test1>
		formattext textname = test2 "Channel: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <primary_channel_time> e = (min_anim_channel_frame_pcnt_1) f = (max_anim_channel_frame_pcnt_1)
		setscreenelementprops id = anim_times_channel_text text = <test2>
		formattext textname = test3 "Subset: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <primary_subset_time> e = (min_anim_subset_frame_pcnt_1) f = (max_anim_subset_frame_pcnt_1)
		setscreenelementprops id = anim_times_subset_text text = <test3>
		formattext {
			textname = test4 "Total: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)"
			d = (<primary_boned_time> + <primary_channel_time> + <primary_subset_time>)
			e = ((min_anim_boned_frame_pcnt_1) + (min_anim_channel_frame_pcnt_1) + (min_anim_subset_frame_pcnt_1))
			f = ((max_anim_boned_frame_pcnt_1) + (max_anim_channel_frame_pcnt_1) + (max_anim_subset_frame_pcnt_1))
		}
		setscreenelementprops id = anim_times_total_text text = <test4>
		formattext textname = test5 "Boned: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <secondary_boned_time> e = (min_anim_boned_frame_pcnt_2) f = (max_anim_boned_frame_pcnt_2)
		setscreenelementprops id = anim_times_boned_text_2 text = <test5>
		formattext textname = test6 "Channel: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <secondary_channel_time> e = (min_anim_channel_frame_pcnt_2) f = (max_anim_channel_frame_pcnt_2)
		setscreenelementprops id = anim_times_channel_text_2 text = <test6>
		formattext textname = test7 "Subset: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <secondary_subset_time> e = (min_anim_subset_frame_pcnt_2) f = (max_anim_subset_frame_pcnt_2)
		setscreenelementprops id = anim_times_subset_text_2 text = <test7>
		formattext {
			textname = test8 "Total: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)"
			d = (<secondary_boned_time> + <secondary_channel_time> + <secondary_subset_time>)
			e = ((min_anim_boned_frame_pcnt_2) + (min_anim_channel_frame_pcnt_2) + (min_anim_subset_frame_pcnt_2))
			f = ((max_anim_boned_frame_pcnt_2) + (max_anim_channel_frame_pcnt_2) + (max_anim_subset_frame_pcnt_2))
		}
		setscreenelementprops id = anim_times_total_text_2 text = <test8>
	else
		killspawnedscript id = RefreshAnimTimesDisplay
		change toggled_anim_times_on = 0
	endif
	wait <interval> seconds
	repeat
endscript
struct_usage_active = 0

script toggle_struct_usage 
	if ($struct_usage_active = 1)
		killspawnedscript name = refresh_struct_usage
		destroyscreenelement id = debug_struct_usage_anchor
		change struct_usage_active = 0
	else
		change struct_usage_active = 1
		createscreenelement {
			type = containerelement
			parent = root_window
			id = debug_struct_usage_anchor
			pos = (2.0, 375.0)
			just = [center center]
			internal_just = [left center]
		}
		createscreenelement {
			type = textelement
			parent = debug_struct_usage_anchor
			id = debug_struct_usage_used
			pos = (40.0, 0.0)
			text = "Used:"
			font = text_a1
			rgba = [255 255 255 255]
			just = [left center]
			scale = 0.6
		}
		createscreenelement {
			type = textelement
			parent = debug_struct_usage_anchor
			id = debug_struct_usage_max
			pos = (40.0, 20.0)
			text = "Max:"
			font = text_a1
			rgba = [255 255 255 255]
			just = [left center]
			scale = 0.6
		}
		createscreenelement {
			type = textelement
			parent = debug_struct_usage_anchor
			id = debug_struct_usage_total
			pos = (40.0, 40.0)
			text = "Total:"
			font = text_a1
			rgba = [255 255 255 255]
			just = [left center]
			scale = 0.6
		}
		createscreenelement {
			type = spriteelement
			parent = debug_struct_usage_anchor
			pos = (30.0, -35.0)
			texture = white2
			rgba = [10 10 10 255]
			just = [left top]
			scale = (14.0, 12.0)
			z_priority = 0
		}
		spawnscriptnow refresh_struct_usage
	endif
endscript

script refresh_struct_usage 
	begin
	GetNumUsedStructs
	formattext textname = used_text "Used: %d" d = <used>
	setscreenelementprops {
		id = debug_struct_usage_used
		text = <used_text>
	}
	formattext textname = max_text "Max: %d" d = <max>
	setscreenelementprops {
		id = debug_struct_usage_max
		text = <max_text>
	}
	formattext textname = total_text "Total: %d" d = <total>
	setscreenelementprops {
		id = debug_struct_usage_total
		text = <total_text>
	}
	wait 10 frames
	repeat
endscript
toggle_show_stoken_msg = 1

script toggle_got_cash_Msg 
	change toggle_show_stoken_msg = (1 - $toggle_show_stoken_msg)
	if ($toggle_show_stoken_msg = 1)
		create_console_message \{text = "GOT CASH MSG: ON"}
	else
		create_console_message \{text = "GOT CASH MSG: OFF"}
	endif
endscript
toggled_particle_times_on = 0

script ToggleParticleTimes 
	if (toggled_particle_times_on = 1)
		change toggled_particle_times_on = 0
		killspawnedscript name = refreshparticletimesdisplay
		wait 0.2 seconds
		if objectexists id = particle_times_anchor
			destroyscreenelement id = particle_times_anchor
		endif
		if objectexists id = new_particle_times_anchor
			destroyscreenelement id = new_particle_times_anchor
		endif
		change min_particle_process_frame_pcnt = 999.0
		change max_particle_process_frame_pcnt = 0.0
		change min_particle_render_frame_pcnt = 999.0
		change max_particle_render_frame_pcnt = 0.0
		change min_particle_sys_count = 99999
		change max_particle_sys_count = 0
		change min_particle_num_count = 99999
		change max_particle_num_count = 0
		change min_particle_prim_count = 99999
		change max_particle_prim_count = 0
		change min_new_particle_process_frame_pcnt = 999.0
		change max_new_particle_process_frame_pcnt = 0.0
		change min_new_particle_render_frame_pcnt = 999.0
		change max_new_particle_render_frame_pcnt = 0.0
		change min_new_particle_sys_count = 99999
		change max_new_particle_sys_count = 0
		change min_new_particle_num_count = 99999
		change max_new_particle_num_count = 0
	else
		change toggled_particle_times_on = 1
		setscreenelementlock id = root_window off
		if objectexists id = particle_times_anchor
			destroyscreenelement id = particle_times_anchor
		endif
		if objectexists id = new_particle_times_anchor
			destroyscreenelement id = new_particle_times_anchor
		endif
		createscreenelement {
			type = containerelement
			parent = root_window
			id = particle_times_anchor
			pos = (30.0, 150.0)
			just = [center center]
			internal_just = [left center]
		}
		createscreenelement {
			type = textelement
			parent = particle_times_anchor
			id = particle_times_text
			pos = (0.0, -60.0)
			text = "Flexible Particles (pcnt/frame):"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = particle_times_anchor
			id = particle_times_process_text
			pos = (0.0, -45.0)
			text = "Process"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = particle_times_anchor
			id = particle_times_render_text
			pos = (0.0, -30.0)
			text = "Render"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = particle_times_anchor
			id = particle_times_total_text
			pos = (0.0, -15.0)
			text = "Total"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = particle_times_anchor
			id = particle_times_break_text
			pos = (0.0, 0.0)
			text = "--------------------------"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = particle_times_anchor
			id = particle_times_sys_text
			pos = (0.0, 15.0)
			text = "ParticleSys"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = particle_times_anchor
			id = particle_times_num_text
			pos = (0.0, 30.0)
			text = "ParticleNum"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = particle_times_anchor
			id = particle_times_prims_text
			pos = (0.0, 45.0)
			text = "ParticlePrims"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = containerelement
			parent = root_window
			id = new_particle_times_anchor
			pos = (30.0, 280.0)
			just = [center center]
			internal_just = [left center]
		}
		createscreenelement {
			type = textelement
			parent = new_particle_times_anchor
			id = new_particle_times_text
			pos = (0.0, -60.0)
			text = "Fast Particles (pcnt/frame):"
			font = text_a1
			rgba = [60 100 60 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = new_particle_times_anchor
			id = new_particle_times_process_text
			pos = (0.0, -45.0)
			text = "Process"
			font = text_a1
			rgba = [60 100 60 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = new_particle_times_anchor
			id = new_particle_times_render_text
			pos = (0.0, -30.0)
			text = "Render"
			font = text_a1
			rgba = [60 100 60 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = new_particle_times_anchor
			id = new_particle_times_total_text
			pos = (0.0, -15.0)
			text = "Total"
			font = text_a1
			rgba = [60 100 60 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = new_particle_times_anchor
			id = new_particle_times_break_text
			pos = (0.0, 0.0)
			text = "--------------------------"
			font = text_a1
			rgba = [60 100 60 1000]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = new_particle_times_anchor
			id = new_particle_times_sys_text
			pos = (0.0, 15.0)
			text = "ParticleSys"
			font = text_a1
			rgba = [60 100 60 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = new_particle_times_anchor
			id = new_particle_times_num_text
			pos = (0.0, 30.0)
			text = "ParticleNum"
			font = text_a1
			rgba = [60 100 60 100]
			just = [left center]
			scale = 0.8
		}
		setscreenelementlock id = root_window on
		spawnscriptlater refreshparticletimesdisplay
	endif
endscript
toggled_rigid_body_times_on = 0

script ToggleRigidBodyTimes 
	if (toggled_rigid_body_times_on = 1)
		change toggled_rigid_body_times_on = 0
		killspawnedscript name = RefreshRigidBodyTimesDisplay
		wait 0.2 seconds
		if objectexists id = rigid_body_times_anchor
			destroyscreenelement id = rigid_body_times_anchor
		endif
		if objectexists id = new_rigid_body_times_anchor
			destroyscreenelement id = new_rigid_body_times_anchor
		endif
		change min_rigid_body_update_time_frame_pcnt = 999.0
		change max_rigid_body_update_time_frame_pcnt = 0.0
		change min_num_rigid_bodies = 99999
		change max_num_rigid_bodies = 0
		change min_num_active_rigid_bodies = 99999
		change max_num_active_rigid_bodies = 0
	else
		change toggled_rigid_body_times_on = 1
		setscreenelementlock id = root_window off
		if objectexists id = rigid_body_times_anchor
			destroyscreenelement id = rigid_body_times_anchor
		endif
		if objectexists id = new_rigid_body_times_anchor
			destroyscreenelement id = new_rigid_body_times_anchor
		endif
		createscreenelement {
			type = containerelement
			parent = root_window
			id = rigid_body_times_anchor
			pos = (30.0, 120.0)
			just = [center center]
			internal_just = [left center]
		}
		createscreenelement {
			type = textelement
			parent = rigid_body_times_anchor
			id = rigid_body_times_text
			pos = (0.0, -60.0)
			text = "Rigid Bodies:"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = rigid_body_times_anchor
			id = rigid_body_update_time_text
			pos = (0.0, -45.0)
			text = "Update"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = rigid_body_times_anchor
			id = rigid_body_count_break_text
			pos = (0.0, -30.0)
			text = "--------------------------"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = rigid_body_times_anchor
			id = rigid_body_heading_text
			pos = (0.0, -15.0)
			text = "(Full Count)"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = rigid_body_times_anchor
			id = rigid_body_active_num_text
			pos = (0.0, 0.0)
			text = "Total Rigid Bodies"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = rigid_body_times_anchor
			id = rigid_body_num_text
			pos = (0.0, 15.0)
			text = "Active Rigid Bodies"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = rigid_body_times_anchor
			id = rigid_body_node_break_text
			pos = (0.0, 30.0)
			text = "--------------------------"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = rigid_body_times_anchor
			id = rigid_body_node_heading_text
			pos = (0.0, 45.0)
			text = "(Node Array Only)"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = rigid_body_times_anchor
			id = rigid_body_num_node_active_text
			pos = (0.0, 60.0)
			text = "Active Rigid Bodies (node array only)"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = rigid_body_times_anchor
			id = rigid_body_num_node_text
			pos = (0.0, 75.0)
			text = "Total Rigid Bodies (node array only)"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = rigid_body_times_anchor
			id = rigid_body_memory_text
			pos = (0.0, 90.0)
			text = "Memory (node array only)"
			font = text_a1
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		setscreenelementlock id = root_window on
		spawnscriptlater RefreshRigidBodyTimesDisplay
	endif
endscript
min_rigid_body_update_time_frame_pcnt = 999.0
max_rigid_body_update_time_frame_pcnt = 0.0
min_num_rigid_bodies = 99999
max_num_rigid_bodies = 0
min_num_active_rigid_bodies = 99999
max_num_active_rigid_bodies = 0
min_num_node_rigid_bodies = 99999
max_num_node_rigid_bodies = 0
min_num_node_active_rigid_bodies = 99999
max_num_node_active_rigid_bodies = 0
min_memory_rigid_bodies = 99999
max_memory_rigid_bodies = 0

script RefreshRigidBodyTimesDisplay 
	begin
	if objectexists id = rigid_body_times_anchor
		GetRigidBodyDebugData
		if (<update_time_frame_pcnt> > max_rigid_body_update_time_frame_pcnt)
			if (<update_time_frame_pcnt> < 100.0)
				change max_rigid_body_update_time_frame_pcnt = <update_time_frame_pcnt>
			endif
		else
			if (<update_time_frame_pcnt> < min_rigid_body_update_time_frame_pcnt)
				change min_rigid_body_update_time_frame_pcnt = <update_time_frame_pcnt>
			endif
		endif
		if (<num_rigid_bodies> > max_num_rigid_bodies)
			change max_num_rigid_bodies = <num_rigid_bodies>
		else
			if (<num_rigid_bodies> < min_num_rigid_bodies)
				change min_num_rigid_bodies = <num_rigid_bodies>
			endif
		endif
		if (<num_active_rigid_bodies> > max_num_active_rigid_bodies)
			change max_num_active_rigid_bodies = <num_active_rigid_bodies>
		else
			if (<num_active_rigid_bodies> < min_num_active_rigid_bodies)
				change min_num_active_rigid_bodies = <num_active_rigid_bodies>
			endif
		endif
		if (<num_node_rigid_bodies> > max_num_node_rigid_bodies)
			change max_num_node_rigid_bodies = <num_node_rigid_bodies>
		else
			if (<num_node_rigid_bodies> < min_num_node_rigid_bodies)
				change min_num_node_rigid_bodies = <num_node_rigid_bodies>
			endif
		endif
		if (<num_node_active_rigid_bodies> > max_num_node_active_rigid_bodies)
			change max_num_node_active_rigid_bodies = <num_node_active_rigid_bodies>
		else
			if (<num_node_active_rigid_bodies> < min_num_node_active_rigid_bodies)
				change min_num_node_active_rigid_bodies = <num_node_active_rigid_bodies>
			endif
		endif
		if (<memory_usage> > max_memory_rigid_bodies)
			change max_memory_rigid_bodies = <memory_usage>
		else
			if (<memory_usage> < min_memory_rigid_bodies)
				change min_memory_rigid_bodies = <memory_usage>
			endif
		endif
		formattext textname = test "Update (pcnt/frame): \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <update_time_frame_pcnt> e = (min_rigid_body_update_time_frame_pcnt) f = (max_rigid_body_update_time_frame_pcnt)
		setscreenelementprops id = rigid_body_update_time_text text = <test>
		formattext textname = test "Total Rigid Bodies: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <num_rigid_bodies> e = (min_num_rigid_bodies) f = (max_num_rigid_bodies)
		setscreenelementprops id = rigid_body_num_text text = <test>
		formattext textname = test "Active Rigid Bodies: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <num_active_rigid_bodies> e = (min_num_active_rigid_bodies) f = (max_num_active_rigid_bodies)
		setscreenelementprops id = rigid_body_active_num_text text = <test>
		formattext textname = test "Total Rigid Bodies: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <num_node_rigid_bodies> e = (min_num_node_rigid_bodies) f = (max_num_node_rigid_bodies)
		setscreenelementprops id = rigid_body_num_node_text text = <test>
		formattext textname = test "Active Rigid Bodies: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <num_node_active_rigid_bodies> e = (min_num_node_active_rigid_bodies) f = (max_num_node_active_rigid_bodies)
		setscreenelementprops id = rigid_body_num_node_active_text text = <test>
		formattext textname = test "Memory: \\c5%d K \\c0(\\c4%e K, \\c2%f K\\c0)" d = <memory_usage> e = (min_memory_rigid_bodies) f = (max_memory_rigid_bodies)
		setscreenelementprops id = rigid_body_memory_text text = <test>
	else
		killspawnedscript id = RefreshRigidBodyTimesDisplay
		change toggled_rigid_body_times_on = 0
	endif
	wait <interval> seconds
	repeat
endscript

script flexparticlewarning 
	setscreenelementlock id = root_window off
	if objectexists id = particle_warn_anchor
		destroyscreenelement id = particle_warn_anchor
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = particle_warn_anchor
		pos = (25.0, 80.0)
		just = [center center]
		internal_just = [left center]
	}
	createscreenelement {
		type = textelement
		parent = particle_warn_anchor
		id = particle_warn_text
		pos = (0.0, 0.0)
		text = "Particle failed: Too many at once"
		font = text_a1
		rgba = [255 0 0 255]
		just = [left top]
	}
	setscreenelementlock id = root_window on
	wait 2 seconds
	if objectexists id = particle_warn_anchor
		destroyscreenelement id = particle_warn_anchor
	endif
endscript
min_particle_process_frame_pcnt = 999.0
max_particle_process_frame_pcnt = 0.0
min_particle_render_frame_pcnt = 999.0
max_particle_render_frame_pcnt = 0.0
min_particle_sys_count = 99999
max_particle_sys_count = 0
min_particle_num_count = 99999
max_particle_num_count = 0
min_particle_prim_count = 99999
max_particle_prim_count = 0
min_new_particle_process_frame_pcnt = 999.0
max_new_particle_process_frame_pcnt = 0.0
min_new_particle_render_frame_pcnt = 999.0
max_new_particle_render_frame_pcnt = 0.0
min_new_particle_sys_count = 99999
max_new_particle_sys_count = 0
min_new_particle_num_count = 99999
max_new_particle_num_count = 0

script refreshparticletimesdisplay 
	begin
	if objectexists id = particle_times_anchor
		getcurrentparticletimes
		if (<particle_process_frame_pcnt> > (max_particle_process_frame_pcnt))
			if (<particle_process_frame_pcnt> < 100.0)
				change max_particle_process_frame_pcnt = <particle_process_frame_pcnt>
			endif
		else
			if (<particle_process_frame_pcnt> < (min_particle_process_frame_pcnt))
				change min_particle_process_frame_pcnt = <particle_process_frame_pcnt>
			endif
		endif
		if (<particle_render_frame_pcnt> > (max_particle_render_frame_pcnt))
			if (<particle_render_frame_pcnt> < 100.0)
				change max_particle_render_frame_pcnt = <particle_render_frame_pcnt>
			endif
		else
			if (<particle_render_frame_pcnt> < (min_particle_render_frame_pcnt))
				change min_particle_render_frame_pcnt = <particle_render_frame_pcnt>
			endif
		endif
		if (<geom_stats_old_particle_systems> > (max_particle_sys_count))
			change max_particle_sys_count = <geom_stats_old_particle_systems>
		else
			if (<geom_stats_old_particle_systems> < (min_particle_sys_count))
				change min_particle_sys_count = <geom_stats_old_particle_systems>
			endif
		endif
		if (<geom_stats_old_particles> > (max_particle_num_count))
			change max_particle_num_count = <geom_stats_old_particles>
		else
			if (<geom_stats_old_particles> < (min_particle_num_count))
				change min_particle_num_count = <geom_stats_old_particles>
			endif
		endif
		if (<geom_stats_old_particle_prims> > (max_particle_prim_count))
			change max_particle_prim_count = <geom_stats_old_particle_prims>
		else
			if (<geom_stats_old_particle_prims> < (min_particle_prim_count))
				change min_particle_prim_count = <geom_stats_old_particle_prims>
			endif
		endif
		formattext textname = test1 "Process: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <particle_process_frame_pcnt> e = (min_particle_process_frame_pcnt) f = (max_particle_process_frame_pcnt)
		setscreenelementprops id = particle_times_process_text text = <test1>
		formattext textname = test2 "Render: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <particle_render_frame_pcnt> e = (min_particle_render_frame_pcnt) f = (max_particle_render_frame_pcnt)
		setscreenelementprops id = particle_times_render_text text = <test2>
		formattext textname = test3 "Total: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = (<particle_process_frame_pcnt> + <particle_render_frame_pcnt>) e = ((min_particle_process_frame_pcnt) + (min_particle_render_frame_pcnt)) f = ((max_particle_process_frame_pcnt) + (max_particle_render_frame_pcnt))
		setscreenelementprops id = particle_times_total_text text = <test3>
		formattext textname = test4 "Particle Systems: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <geom_stats_old_particle_systems> e = (min_particle_sys_count) f = (max_particle_sys_count)
		setscreenelementprops id = particle_times_sys_text text = <test4>
		formattext textname = test5 "Particle Count: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <geom_stats_old_particles> e = (min_particle_num_count) f = (max_particle_num_count)
		setscreenelementprops id = particle_times_num_text text = <test5>
		formattext textname = test6 "Particle Primitives: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <geom_stats_old_particle_prims> e = (min_particle_prim_count) f = (max_particle_prim_count)
		setscreenelementprops id = particle_times_prims_text text = <test6>
		if (<new_particle_process_frame_pcnt> > (max_new_particle_process_frame_pcnt))
			if (<new_particle_process_frame_pcnt> < 100.0)
				change max_new_particle_process_frame_pcnt = <new_particle_process_frame_pcnt>
			endif
		else
			if (<new_particle_process_frame_pcnt> < (min_new_particle_process_frame_pcnt))
				change min_new_particle_process_frame_pcnt = <new_particle_process_frame_pcnt>
			endif
		endif
		if (<new_particle_render_frame_pcnt> > (max_new_particle_render_frame_pcnt))
			if (<new_particle_render_frame_pcnt> < 100.0)
				change max_new_particle_render_frame_pcnt = <new_particle_render_frame_pcnt>
			endif
		else
			if (<new_particle_render_frame_pcnt> < (min_new_particle_render_frame_pcnt))
				change min_new_particle_render_frame_pcnt = <new_particle_render_frame_pcnt>
			endif
		endif
		if (<geom_stats_new_particle_systems> > (max_new_particle_sys_count))
			change max_new_particle_sys_count = <geom_stats_new_particle_systems>
		else
			if (<geom_stats_new_particle_systems> < (min_new_particle_sys_count))
				change min_new_particle_sys_count = <geom_stats_new_particle_systems>
			endif
		endif
		if (<geom_stats_new_particles> > (max_new_particle_num_count))
			change max_new_particle_num_count = <geom_stats_new_particles>
		else
			if (<geom_stats_new_particles> < (min_new_particle_num_count))
				change min_new_particle_num_count = <geom_stats_new_particles>
			endif
		endif
		formattext textname = test1 "Process: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <new_particle_process_frame_pcnt> e = (min_new_particle_process_frame_pcnt) f = (max_new_particle_process_frame_pcnt)
		setscreenelementprops id = new_particle_times_process_text text = <test1>
		formattext textname = test2 "Render: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <new_particle_render_frame_pcnt> e = (min_new_particle_render_frame_pcnt) f = (max_new_particle_render_frame_pcnt)
		setscreenelementprops id = new_particle_times_render_text text = <test2>
		formattext textname = test3 "Total: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = (<new_particle_process_frame_pcnt> + <new_particle_render_frame_pcnt>) e = ((min_new_particle_process_frame_pcnt) + (min_new_particle_render_frame_pcnt)) f = ((max_new_particle_process_frame_pcnt) + (max_new_particle_render_frame_pcnt))
		setscreenelementprops id = new_particle_times_total_text text = <test3>
		formattext textname = test4 "Particle Systems: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <geom_stats_new_particle_systems> e = (min_new_particle_sys_count) f = (max_new_particle_sys_count)
		setscreenelementprops id = new_particle_times_sys_text text = <test4>
		formattext textname = test5 "Particle Count: \\c5%d \\c0(\\c4%e, \\c2%f\\c0)" d = <geom_stats_new_particles> e = (min_new_particle_num_count) f = (max_new_particle_num_count)
		setscreenelementprops id = new_particle_times_num_text text = <test5>
	else
		killspawnedscript id = refreshparticletimesdisplay
		change toggled_particle_times_on = 0
	endif
	wait <interval> seconds
	repeat
endscript

script toggle_wireframe_skins 
	if (wireframe_skins = 0)
		change \{wireframe_skins = 1}
	else
		if (wireframe_skins = 1)
			change \{wireframe_skins = 2}
		else
			change \{wireframe_skins = 0}
		endif
	endif
endscript

script show_free_mem_get_index 
	y_offset = 0
	free_mem_anchor :getsingletag \{y_offset}
	free_mem_anchor :settags y_offset = (<y_offset> + 1)
	return y_offset = <y_offset>
endscript

script show_free_mem_add_category 
	show_free_mem_get_index
	createscreenelement {
		type = textelement
		parent = free_mem_anchor
		pos = (<y_offset> * (0.0, 25.0))
		text = <label>
		font = text_a1
		rgba = [120 120 200 255]
		just = [left top]
		scale = 0.65000004
	}
	foreachin <items> do = show_free_mem_add_item
endscript

script show_free_mem_add_item 
	show_free_mem_get_index
	createscreenelement {
		type = textelement
		parent = free_mem_anchor
		local_id = <id>
		pos = (<y_offset> * (0.0, 25.0))
		text = ""
		font = text_a1
		rgba = [120 200 120 255]
		just = [left top]
		scale = 0.65000004
	}
endscript

script show_free_mem 
	if NOT screenelementexists id = free_mem_anchor
		doscreenelementmorph {
			id = the_score_sprite
			scale = 0
		}
		doscreenelementmorph {
			id = the_score
			scale = 0
		}
		categories = [
			{
				label = "Free Memory"
				items = [
					{id = bottomup}
					{id = script}
					{id = mission}
				]
			}
			{
				label = "Free Script Pool Items"
				items = [
					{id = CComponents}
					{id = CStructs}
				]
			}
		]
		createscreenelement {
			type = containerelement
			parent = root_window
			id = free_mem_anchor
			pos = (70.0, 30.0)
			just = [center center]
			internal_just = [left center]
			z_priority = 10001
		}
		foreachin <categories> do = show_free_mem_add_category
		show_free_mem_get_index
		createscreenelement {
			type = spriteelement
			parent = free_mem_anchor
			rgba = [0 0 0 200]
			texture = white2
			scale = ((90.0, 0.0) + <y_offset> * (0.0, 3.5))
			z_priority = 10000
			just = [left top]
		}
		spawnscriptlater noqbid RefreshFreeMemoryDisplay
	else
		killspawnedscript name = RefreshFreeMemoryDisplay
		destroyscreenelement id = free_mem_anchor
		doscreenelementmorph {
			id = the_score_sprite
			scale = 1
		}
		doscreenelementmorph {
			id = the_score
			scale = 1
		}
		show_compass_anchor
	endif
endscript

script RefreshFreeMemoryDisplay \{interval = 0.75}
	begin
	hide_compass_anchor
	DisplayFreeMem
	wait <interval> seconds
	repeat
endscript

script updatedisplayfreememory 
	if screenelementexists id = free_mem_anchor
		if resolvescreenelementid id = {free_mem_anchor child = <id>}
			formattext {
				textname = display
				"%s: %m of %t, low: %o"
				s = <text_name>
				m = <free>
				t = <total>
				o = <min>
				usecommas
				dontassertforchecksums
			}
			setscreenelementprops id = <resolved_id> text = <display>
		endif
	else
		killspawnedscript id = RefreshFreeMemoryDisplay
	endif
endscript

script show_defrag_anim_cache 
	printf \{"\\n\\n\\n************Before:***********************"}
	dumpheaps
	updateanimcache \{defrag}
	printf \{"\\n************After:***********************"}
	dumpheaps
endscript

script toggle_show_all 
	show_all
endscript

script toggle_show_polys \{showscript = show_vert}
	<showscript>
	pulse_item
endscript

script launch_keyboard 
	destroyscreenelement \{id = current_menu_anchor}
	create_onscreen_keyboard
endscript

script launch_cheats_menu 
	create_cheats_menu
endscript

script create_cheats_menu 
	goalmanager_hidepoints
	make_cas_menu {
		menu_id = cheats_menu
		vmenu_id = cheats_vmenu
		title = "CHEATS"
		pad_back_script = create_debug_options_menu
		scrolling
		pausemenu
		width = 750
		highlight_add = (150.0, 0.0)
	}
	if gamemodeequals is_career
		add_cas_menu_item text = "Atom Unlocking (expert use only)" pad_choose_script = game_progress_debug_menu_create
		add_cas_menu_item text = "Progression Checkpoints" pad_choose_script = game_progress_checkpoint_menu_create
	endif
	if ($all_levels_unlocked = 1)
		<unlocked> = "on"
	else
		<unlocked> = "off"
	endif
	add_cas_menu_item id = cheats_menu_level_lock text = ("All Levels Unlocked: " + <unlocked>) pad_choose_script = cheats_menu_change_level_lock
	add_cas_menu_item text = "+1000 goal points" pad_choose_script = cheats_goalpoints
	add_cas_menu_item text = "+$500 cash" pad_choose_script = cheat_add_cash
	add_cas_menu_item text = "+2000 skill points" pad_choose_script = cheats_skill_points
	add_cas_menu_item text = "Set stats 10" pad_choose_script = cheat_set_stats_10
	add_cas_menu_item text = "Toggle all abilities and rig pieces" pad_choose_script = cheat_give_all_abilities
	add_cas_menu_item text = "Unlock all sponsor items" pad_choose_script = cheats_menu_sponsors
	add_cas_menu_item text = "Toggle crouch use aggro speed" pad_choose_script = toggle_crouch_use_aggro_speed_from_menu
	cas_menu_finish
endscript

script cheats_menu_sponsors 
	CHEAT_UNLOCK_VANS_script
	CHEAT_UNLOCK_NIXON_script
	CHEAT_UNLOCK_ADIO_script
	CHEAT_UNLOCK_BIRDHOUSE_script
	CHEAT_UNLOCK_ELEMENT_script
	CHEAT_UNLOCK_QUIKSILVER_script
	CHEAT_UNLOCK_VOLCOM_script
	CHEAT_UNLOCK_DVS_script
	CHEAT_UNLOCK_ETNIES_script
	CHEAT_UNLOCK_ES_script
	CHEAT_UNLOCK_VON_ZIPPER_script
	CHEAT_UNLOCK_ELECTRIC_script
	CHEAT_UNLOCK_DGK_script
	CHEAT_UNLOCK_INDEPENDENT_script
	CHEAT_UNLOCK_ALMOST_script
	CHEAT_UNLOCK_MATIX_script
	CHEAT_UNLOCK_FLIP_script
	CHEAT_UNLOCK_HURLEY_script
	CHEAT_UNLOCK_BILLABONG_script
	CHEAT_UNLOCK_EMERICA_script
endscript

script cheats_menu_change_level_lock 
	gettags
	if IntegerEquals a = $all_levels_unlocked b = 1
		setscreenelementprops {
			id = {<id> child = 0}
			text = "All Levels Unlocked: off"
		}
		change all_levels_unlocked = 0
		lock_all_game_areas
	else
		if IntegerEquals a = $all_levels_unlocked b = 0
			setscreenelementprops {
				id = {<id> child = 0}
				text = "All Levels Unlocked: on"
			}
			change all_levels_unlocked = 1
			change demo_build = 0
			printf "changing demo build to 0"
			unlock_all_game_areas
		endif
	endif
	pulse_item
endscript

script cheats_menu_score5mil 
	skater :settrickname \{"You cheat like Kurt"}
	skater :settrickscore \{5000000}
	skater :display
endscript

script cheats_menu_UnBeatAllGoals 
	GMan_UnBeatAllGoals
	gman_uninitializeallgoals
	gman_initializeallgoals
endscript

script cheats_goalpoints 
	careerfunc \{func = addgoalpoints
		params = {
			goal_points = 1000
			type = generic
		}}
	careerfunc \{func = addgoalpoints
		params = {
			goal_points = 1000
			type = career
		}}
	careerfunc \{func = addgoalpoints
		params = {
			goal_points = 1000
			type = hardcore
		}}
	careerfunc \{func = addgoalpoints
		params = {
			goal_points = 1000
			type = rigger
		}}
	printf \{"Progression Session!"}
endscript

script cheat_add_cash 
	<AddCash> = 500
	careerfunc func = AddCash params = {cash = <AddCash>}
	careerfunc \{func = GetCash}
	formattext textname = points "+%g cash, available: %a" g = <AddCash> a = <cash>
	create_console_message text = <points>
endscript

script cheats_skill_points 
	<give_points> = 2000
	AwardSkillPoints skill_points = <give_points>
	GetSkillPoints
	formattext textname = points "+%g skill points, available: %a" g = <give_points> a = (<skill_points>.generic)
	create_console_message text = <points>
endscript

script cheat_set_stats_10 
	SetAllStats \{value = 10}
endscript

script cheat_give_all_abilities 
	if ($skater_cheat_all_abilities = 0)
		AbilityFlags_GiveAllAbilities
		careerfunc func = setallriggerpiecesavailability params = {availability = true}
		careerfunc func = setallcribpiecesavailability params = {availability = true}
		change skater_cheat_all_abilities = 1
		create_console_message text = "ADDED all abilities"
	else
		careerfunc func = setallriggerpiecesavailability params = {availability = false}
		careerfunc func = setallcribpiecesavailability params = {availability = false}
		getarraysize $skater_ability_ids
		<i> = 0
		begin
		AbilityFlags_SetAbilityValue ability = ($skater_ability_ids [<i>]) state = off
		<i> = (<i> + 1)
		repeat <array_size>
		SkillTree_Reset
		change skater_cheat_all_abilities = 0
		create_console_message text = "REMOVED all abilities"
	endif
endscript
navmesh_draw_enable = 0
navmesh_poly_draw_enable = 0

script navmesh_draw_update 
	begin
	if (navmesh_draw_enable = 0)
		break
	endif
	nav_show \{60}
	ShowNavNodeManager
	wait \{1
		second}
	repeat
endscript

script navmesh_poly_draw_update 
	begin
	if (navmesh_poly_draw_enable = 0)
		break
	endif
	nav_polyshow
	ShowNavNodeManager
	wait \{1
		second}
	repeat
endscript

script toggle_navmesh_draw 
	if (navmesh_draw_enable = 1)
		change \{navmesh_draw_enable = 0}
		killspawnedscript \{id = navmesh_draw_update_script}
		nav_show \{1}
	else
		change \{navmesh_draw_enable = 1}
		spawnscriptlater \{navmesh_draw_update
			id = navmesh_draw_update_script}
	endif
endscript

script toggle_navmesh_polydraw 
	if (navmesh_poly_draw_enable = 1)
		change \{navmesh_poly_draw_enable = 0}
		killspawnedscript \{id = navmesh_poly_draw_update_script}
		nav_polyclear
	else
		change \{navmesh_poly_draw_enable = 1}
		spawnscriptlater \{navmesh_poly_draw_update
			id = navmesh_poly_draw_update_script}
	endif
endscript
debug_pedinfo = 0

script toggle_ped_debug 
	change debug_pedinfo = (1 - debug_pedinfo)
endscript
debug_show_skater_coord_anchor = 0

script debug_display_skater_coords 
	change \{debug_show_skater_coord_anchor = 1}
endscript

script debug_display_skater_coords_internal 
	if screenelementexists id = skater_coord_anchor
		destroyscreenelement id = skater_coord_anchor
	endif
	setscreenelementlock off id = root_window
	<x> = 0
	<y> = 0
	<z> = 0
	if objectexists id = skater
		skater :get_skater_pos
	endif
	printstruct <...>
	if NOT gotparam x
		return
	endif
	formattext textname = text "POS=(%x,%y,%z)" x = <x> y = <y> z = <z>
	createscreenelement {
		type = textelement
		parent = root_window
		id = skater_coord_anchor
		text = <text>
		font = text_a1
		scale = 0.5
		rgba = [0 0 0 255]
		pos = (500.0, 420.0)
		z_priority = -10
	}
	createscreenelement {
		type = spriteelement
		parent = skater_coord_anchor
		texture = white
		scale = (70.0, 10.0)
		rgba = [100 100 100 200]
		pos = (-20.0, 0.0)
		z_priority = -11
		just = [left top]
	}
	spawnscriptlater debug_update_skater_coords
endscript

script debug_update_skater_coords 
	begin
	if objectexists \{id = skater}
		skater :get_skater_pos
	endif
	if gotparam \{x}
		formattext textname = text "POS=(%x,%y,%z)" x = <x> y = <y> z = <z>
		setscreenelementprops id = skater_coord_anchor text = <text>
	endif
	wait \{5
		frames}
	repeat
endscript

script show_skater_coords 
	if screenelementexists id = ui_skater_position
		destroyscreenelement id = ui_skater_position
		return
	endif
	createscreenelement {
		type = textelement
		parent = root_window
		id = ui_skater_position
		text = ""
		font = text_a1
		scale = 0.75
		rgba = [200 200 200 255]
		just = [left top]
		pos = {(0.055, 0.05) proportional}
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		z_priority = 100000
	}
	runscriptonscreenelement show_skater_coords_loop id = ui_skater_position
endscript

script get_skater_pos 
	GetSkaterPosition
	return <...>
endscript

script show_skater_coords_loop 
	begin
	skater :get_skater_pos
	if NOT gotparam x
		if screenelementexists id = ui_skater_position
			destroyscreenelement id = ui_skater_position
		endif
		return
	endif
	formattext textname = text "pos=(%x,%y,%z)" x = <x> y = <y> z = <z>
	if screenelementexists id = ui_skater_position
		setscreenelementprops id = ui_skater_position text = <text>
	else
		return
	endif
	wait 1 gameframe
	repeat
endscript

script debug_tweak_processor_params 
	if screenelementexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	if screenelementexists id = debug_menu
		destroyscreenelement id = debug_menu
	endif
	make_cas_menu title = "CPU SETTINGS" id = processor_menu pad_back_script = exit_tweak_processor_menu not_centered
	formattext textname = desired_average "%a" a = (g_desired_average)
	add_cas_menu_item {
		id = id_desired_average
		text = "Desired Avg."
		extra_text = <desired_average>
		option_arrows_callback = debug_adjust_desired_average
		option_arrows
	}
	formattext textname = low_average_threshold "%a" a = (g_low_average_threshold)
	add_cas_menu_item {
		id = id_low_average_threshold
		text = "Low Avg."
		extra_text = <low_average_threshold>
		option_arrows_callback = debug_adjust_low_average_threshold
		option_arrows
	}
	formattext textname = high_average_threshold "%a" a = (g_high_average_threshold)
	add_cas_menu_item {
		id = id_high_average_threshold
		text = "High Avg."
		extra_text = <high_average_threshold>
		option_arrows_callback = debug_adjust_high_average_threshold
		option_arrows
	}
	formattext textname = forced_catch_up_average "%a" a = (g_forced_catch_up_average)
	add_cas_menu_item {
		id = id_forced_catch_up_average
		text = "Catch Up Avg."
		extra_text = <forced_catch_up_average>
		option_arrows_callback = debug_adjust_forced_catch_up_average
		option_arrows
	}
	cas_menu_finish
endscript

script exit_tweak_processor_menu 
	setup_gs_idle_proc_params
	create_debug_menu
endscript

script debug_adjust_desired_average 
	if gotparam \{left}
		change g_desired_average = ((g_desired_average) - 1)
	else
		change g_desired_average = ((g_desired_average) + 1)
	endif
	if (g_desired_average < 1)
		change \{g_desired_average = 1}
	endif
	formattext textname = desired_average "%a" a = (g_desired_average)
	setscreenelementprops id = {id_desired_average child = extra_text} text = <desired_average>
endscript

script debug_adjust_low_average_threshold 
	if gotparam \{left}
		change g_low_average_threshold = ((g_low_average_threshold) - 0.05)
	else
		change g_low_average_threshold = ((g_low_average_threshold) + 0.05)
	endif
	if (g_low_average_threshold < 0.05)
		change \{g_low_average_threshold = 0.05}
	endif
	formattext textname = low_average_threshold "%a" a = (g_low_average_threshold)
	setscreenelementprops id = {id_low_average_threshold child = extra_text} text = <low_average_threshold>
endscript

script debug_adjust_high_average_threshold 
	if gotparam \{left}
		change g_high_average_threshold = ((g_high_average_threshold) - 0.05)
	else
		change g_high_average_threshold = ((g_high_average_threshold) + 0.05)
	endif
	if (g_high_average_threshold < 0.05)
		change \{g_high_average_threshold = 0.05}
	endif
	formattext textname = high_average_threshold "%a" a = (g_high_average_threshold)
	setscreenelementprops id = {id_high_average_threshold child = extra_text} text = <high_average_threshold>
endscript

script debug_adjust_forced_catch_up_average 
	if gotparam \{left}
		change g_forced_catch_up_average = ((g_forced_catch_up_average) - 0.05)
	else
		change g_forced_catch_up_average = ((g_forced_catch_up_average) + 0.05)
	endif
	if (g_forced_catch_up_average < 0.05)
		change \{g_forced_catch_up_average = 0.05}
	endif
	formattext textname = forced_catch_up_average "%a" a = (g_forced_catch_up_average)
	setscreenelementprops id = {id_forced_catch_up_average child = extra_text} text = <forced_catch_up_average>
endscript
component_usage_threshold = 0.95
struct_usage_threshold = 0.95
hash_item_usage_threshold = 0.95
pool_usage_warning_frame_count = 300

script pool_usage_warning_update 
	if NOT screenelementexists id = pool_usage_warning_anchor
		createscreenelement {
			type = containerelement
			parent = root_window
			pos = (0.0, 0.0)
			id = pool_usage_warning_anchor
		}
		createscreenelement {
			type = vmenu
			parent = pool_usage_warning_anchor
			id = pool_usage_warning_vmenu
			pos = (1200.0, 100.0)
			just = [right top]
			internal_just = [right top]
			scale = 0.6
		}
		createscreenelement {
			type = textelement
			parent = pool_usage_warning_vmenu
			id = hash_item_usage
			font = text_a1
			rgba = [220 40 40 255]
		}
		createscreenelement {
			type = textelement
			parent = pool_usage_warning_vmenu
			id = struct_usage
			font = text_a1
			rgba = [220 40 40 255]
		}
		createscreenelement {
			type = textelement
			parent = pool_usage_warning_vmenu
			id = component_usage
			font = text_a1
			rgba = [220 40 40 255]
		}
	endif
	formattext {
		textname = hash_item_usage_text
		"Hash Items: %u %t (%p\\%)"
		u = <hash_items_used>
		t = <total_hash_items>
		p = <hash_item_percentage>
	}
	formattext {
		textname = struct_usage_text
		"Structs: %u %t (%p\\%)"
		u = <structs_used>
		t = <total_structs>
		p = <struct_percentage>
	}
	formattext {
		textname = component_usage_text
		"components: %u %t (%p\\%)"
		u = <components_used>
		t = <total_components>
		p = <component_percentage>
	}
	setscreenelementprops {
		id = hash_item_usage
		text = <hash_item_usage_text>
	}
	setscreenelementprops {
		id = struct_usage
		text = <struct_usage_text>
	}
	setscreenelementprops {
		id = component_usage
		text = <component_usage_text>
	}
endscript

script pool_usage_warning_destroy 
	if screenelementexists \{id = pool_usage_warning_anchor}
		destroyscreenelement \{id = pool_usage_warning_anchor}
	endif
endscript

script debug_menu_launch_viewer 
	cheat_select_shift
	launchviewer
	change \{viewer_buttons_enabled = 1}
	change \{Enter_CAP_Trigger = $Enter_CAP_Debug}
	cheat_select_shift
endscript

script ui_debug_test_vehicles 
	if objectexists id = current_menu_anchor
		destroyscreenelement id = current_menu_anchor
	endif
	pause_menu_gradient off
	make_cas_menu {
		menu_id = debug_test_vehicles_menu
		vmenu_id = debug_test_vehicles_vmenu
		title = "TEST VEHICLES"
		scrolling
		pad_back_script = generic_menu_pad_back
		pad_back_params = {callback = create_debug_menu}
		pausemenu
		width = 750
	}
	getarraysize $create_test_vehicle_menu
	index = 0
	begin
	menu_entry = ($create_test_vehicle_menu [<index>])
	add_cas_menu_item text = (<menu_entry>.name) pad_choose_script = ui_debug_test_vehicles_pad_choose pad_choose_params = <menu_entry>
	index = (<index> + 1)
	repeat <array_size>
	cas_menu_finish
endscript

script ui_debug_test_vehicles_pad_choose 
	CreateTestCarModel model = <model> skeleltonName = <skeleltonName>
	do_actual_unpause
	ui_change_state \{state = uistate_gameplay}
endscript

script ui_debug_disable_rain 
	printf \{"*** Rain Always Disabled ***"}
	change \{CycleWeather = 0}
	Rain_Do_Rain_Transition \{i = 0
		time = 0}
	Rain_Do_Puddles_Transition \{i = 0
		time = 0}
	Rain_Do_Lighting_Transition \{i = 0
		time = 0}
endscript

script ui_debug_enable_rain 
	printf \{"*** Rain Always Enabled ***"}
	change \{CycleWeather = 0}
	Rain_Do_Rain_Transition \{i = 1
		time = 5}
	Rain_Do_Puddles_Transition \{i = 1
		time = 5}
	Rain_Do_Lighting_Transition \{i = 1
		time = 5}
endscript

script ui_debug_toggle_goal_track_teleport 
	if ($goal_track_no_travel = 1)
		create_console_message \{text = "Goal Track Teleport Disabled"}
		change \{goal_track_no_travel = 0}
	else
		create_console_message \{text = "Goal Track Teleport Enabled"}
		change \{goal_track_no_travel = 1}
	endif
endscript

script ui_debug_toggle_all_goals 
	if ($goals_for_gamemode_loaded = 1)
		deinit_goal_manager
	else
		init_goal_manager
	endif
endscript

script toggle_uberfrig_lines 
	if ($draw_uberfrig_lines = 0)
		change \{draw_uberfrig_lines = 1}
	else
		change \{draw_uberfrig_lines = 0}
	endif
	unpause_game_and_destroy_pause_menu
endscript

script debug_find_geo_seams 
	spawnscriptlater \{FindGeoSeams
		params = {
			divisions = 1000
			max_count = 2000
			radius = 0.5
		}}
	unpause_game_and_destroy_pause_menu
endscript
show_build_version = 0

script get_data_version 
	if globalexists \{name = dataversionnumber
			type = int}
		return \{build_version_string = $dataversionnumber}
	else
		return \{build_version_string = "<unknown>"}
	endif
endscript

script debug_toggle_changelist 
	if (($show_build_version = 0) || (gotparam show))
		change show_build_version = 1
		if screenelementexists id = debug_show_build_version_element
			return
		endif
		get_data_version
		formattext textname = build_version_text "changelist %v" v = <build_version_string>
		createscreenelement {
			type = textelement
			parent = root_window
			id = debug_show_build_version_element
			font = text_a1
			just = [right top]
			pos = {(0.945, 0.05) proportional}
			text = <build_version_text>
			rgba = [200 200 200 255]
			scale = 0.75
			shadow
			shadow_offs = (2.0, 2.0)
			shadow_rgba = [0 0 0 255]
			z_priority = 100000
		}
	else
		change show_build_version = 0
		if screenelementexists id = debug_show_build_version_element
			destroyscreenelement id = debug_show_build_version_element
		endif
	endif
endscript

script debug_toggle_cap_names 
	if ($cap_debug_names = 0)
		change \{cap_debug_names = 1}
		printf \{"CAP Piece names will now be shown."}
	else
		change \{cap_debug_names = 0}
		printf \{"CAP Piece names will now be hidden."}
	endif
endscript
