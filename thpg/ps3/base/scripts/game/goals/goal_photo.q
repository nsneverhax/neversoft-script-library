max_profile_photos = 50
goal_photo_transworld_logo_pos = (210.0, 125.0)
goal_photo_slap_logo_pos = (265.0, 120.0)
goal_photo_focus_logo_pos = (210.0, 110.0)

script goal_photo_init_mobile_cam is_cursor = true
	if NOT iscreated rigger_cam_camera
		obj_getid
		<objid> :obj_getposition
		createcompositeobject {
			components = [
				{component = suspend}
				{component = motion}
				{component = lockobj}
				{component = model}
				{component = input
					player = 0
				}
				{component = cameraaim
					speed = 1.5
				}
			]
			params = {
				name = rigger_cam_camera
				model = 'props\\digital_camera_icon\\digital_camera_icon.mdl'
				pos = (<pos> + (0.0, 1.7, 0.0))
				scale = 1.5
				suspenddistance = 120
				lod_dist1 = 10
				lod_dist2 = 100
			}
		}
		if (<is_cursor> = true)
			rigger_cam_camera :settags state = mobile picture_taken = false
			<objid> :obj_getorientation
			rigger_cam_camera :obj_setorientation x = <x> y = <y> z = <z>
			rigger_cam_camera :obj_locktoobject objectname = <objid> (0.0, 1.7, 0.0)
		endif
		createcompositeobject {
			components = [
				{component = suspend}
				{component = motion}
				{component = lockobj}
				{component = objectproximity}
				{component = model}
			]
			params = {
				name = rigger_cam_target
				model = 'Props\\RK_camera_target\\RK_camera_target.mdl'
				pos = <pos>
				scale = 1.0
				suspenddistance = 120
				lod_dist1 = 10
				lod_dist2 = 100
			}
		}
		rigger_cam_target :obj_locktoobject objectname = rigger_cam_camera (0.0, 0.0, 6.0)
		rigger_cam_camera :settags target_offset = 6.0
	endif
endscript

script goal_photo_init_static_cam enable_adjust = true
	obj_getid
	change cap_rigger_cam_id = <objid>
	if iscreated rigger_cam_camera
		rigger_cam_camera :obj_locktoobject objectname = <objid> off
		<objid> :obj_getposition
		rigger_cam_camera :obj_setposition position = (<pos> + (0.0, 1.7, 0.0))
	else
		goal_photo_init_mobile_cam is_cursor = false
	endif
	rigger_cam_camera :settags state = static picture_taken = false
	if gotparam cam_quat
		goal_photo_update_cam_details cam_quat = <cam_quat> cam_zoom = <cam_zoom> cam_target_offset = <cam_target_offset> cam_target_scale = <cam_target_scale>
	else
		rigger_cam_camera :settags fov = 65.0 target_scale = 1.0
		runscriptonobject {
			id = rigger_cam_target
			goal_photo_target_out_set_in
		}
	endif
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if (<goal_type> = photo)
			<enable_adjust> = false
		endif
	endif
	if inmultiplayergame
		<enable_adjust> = false
	endif
	if (<enable_adjust> = true)
		obj_getposition
		if FeelerCheck start_pos = <pos> end_pos = (<pos> - (0.0, 100.0, 0.0))
			if objectexists id = rigger_cam_adjust_proxim
				rigger_cam_adjust_proxim :die
			endif
			createcompositeobject {
				components = [
					{component = suspend}
					{component = objectproximity}
				]
				params = {
					name = rigger_cam_adjust_proxim
					pos = <hit_pos>
					suspenddistance = 120
					lod_dist1 = 10
					lod_dist2 = 100
				}
			}
			runscriptonobject {
				id = rigger_cam_adjust_proxim
				setup_ped_speech
				params = {
					ped_id = rigger_cam_adjust_proxim
					accept_text = "\\m5 Adjust Camera"
					activation_script = goal_photo_fine_adjust_cam
					inner_radius = 2
					outer_radius = 2
					dont_deactivate_goals
				}
			}
		else
			printf "Rigger camera placed but feeler got no hit to place fine adjust proxim obj"
		endif
	endif
	if gman_getactivatedgoalid
		if gman_getconstant name = script_on_place
			<script_on_place>
		endif
	endif
endscript
goal_photo_skater_adjusting_cam = 0

script goal_photo_fine_adjust_cam 
	if screenelementexists id = goal_photo_camera_hud
		return
	endif
	if inmultiplayergame
		return
	endif
	root_window :gettags
	if checksumequals a = <menu_state> b = on
		return
	endif
	if NOT objectexists id = rigger_cam_camera
		return
	endif
	change goal_photo_skater_adjusting_cam = 1
	gman_pauseallgoals
	goal_photo_lock_skater
	createscreenelement {
		id = goal_photo_cam_handle
		type = containerelement
		parent = root_window
		pos = (0.0, 0.0)
	}
	setscreenelementprops {
		id = goal_photo_cam_handle
		event_handlers = [
			{pad_btn_bottom goal_photo_accept_cam}
		]
		replace_handlers
	}
	launchevent type = focus target = goal_photo_cam_handle
	rigger_cam_camera :cameraaim_activate
	spawnscriptnow goal_photo_handle_zoom
	playigccam {
		controlscript = goal_photo_cam_control
		play_hold
		name = fine_adjust_cam
	}
	goal_photo_add_reticule_overlay
	goal_photo_add_screen_fx
	create_helper_text {
		parent = root_window
		anchor_id = goal_photo_fine_adjust_helper
		helper_text_elements = [
			{text = "\\bk LOOK"}
			{text = "\\bl SCALE"}
			{text = "\\be\\bf ZOOM"}
			{text = "\\bg\\bh PUSH/PULL"}
			{text = "\\m0 ACCEPT"}
		]
	}
endscript

script goal_photo_cam_control 
	begin
	rigger_cam_camera :gettags
	ccam_domorph {
		lockto = rigger_cam_camera
		pos = (0.0, 0.0, 0.2)
		quat = (0.0, 0.0, 0.0)
		fov = <fov>
	}
	wait \{0.1
		second}
	repeat
endscript

script goal_photo_accept_cam exit_only = false
	if screenelementexists id = goal_photo_cam_handle
		destroyscreenelement id = goal_photo_cam_handle
	endif
	if screenelementexists id = goal_photo_fine_adjust_helper
		destroyscreenelement id = goal_photo_fine_adjust_helper
	endif
	killspawnedscript name = goal_photo_handle_zoom
	killskatercamanim name = fine_adjust_cam
	if objectexists id = rigger_cam_camera
		rigger_cam_camera :cameraaim_deactivate
	endif
	if (<exit_only> = false)
		<unhide_all> = 1
	else
		<unhide_all> = 0
	endif
	goal_photo_remove_screen_fx unhide_all = <unhide_all>
	goal_photo_remove_reticule_overlay
	if (<exit_only> = false)
		runscriptonobject {
			id = rigger_cam_target
			goal_photo_target_out_set_in
		}
		cap_commit_changes
		wait 2 gameframes
		goal_photo_unlock_skater
		gman_unpauseallgoals
	endif
	change goal_photo_skater_adjusting_cam = 0
endscript

script goal_photo_handle_zoom 
	begin
	<do_zoom> = false
	<do_move> = false
	<do_scale> = false
	if controllerpressed l1
		<z_fov> = 0.5
		<do_zoom> = true
	elseif controllerpressed r1
		<z_fov> = -0.5
		<do_zoom> = true
	elseif controllerpressed l2
		<dz> = -0.2
		<do_move> = true
	elseif controllerpressed r2
		<dz> = 0.2
		<do_move> = true
	elseif RightAnalogHeld up
		<dscale> = 0.1
		<do_scale> = true
	elseif RightAnalogHeld down
		<dscale> = -0.1
		<do_scale> = true
	endif
	if (<do_zoom> = true)
		rigger_cam_camera :gettags
		<fov> = (<fov> + <z_fov>)
		if ((<fov> < 90.0) && (<fov> > 2.0))
			rigger_cam_camera :settags fov = <fov>
			if (<z_fov> > 0)
				soundevent event = photo_SFX_zoom_out
			else
				soundevent event = photo_SFX_zoom_in
			endif
		endif
	elseif (<do_move> = true)
		rigger_cam_camera :gettags
		<target_offset> = (<target_offset> + <dz>)
		if ((<target_offset> < 20.0) && (<target_offset> > 2.0) && (<target_offset> > (<target_scale> + 2.0)))
			rigger_cam_camera :settags target_offset = <target_offset>
			<new_offset> = ((0.0, 0.0, 1.0) * <target_offset>)
			rigger_cam_target :obj_locktoobject objectname = rigger_cam_camera <new_offset>
			if (<dz> > 0)
				soundevent event = sk9_photo_Aperture_Out
			else
				soundevent event = sk9_photo_Aperture_In
			endif
		endif
	elseif (<do_scale> = true)
		rigger_cam_camera :gettags
		<target_scale> = (<target_scale> + <dscale>)
		if ((<target_scale> < 6.1) && (<target_scale> > 1.0) && (<target_offset> > (<target_scale> + 2.0)))
			rigger_cam_camera :settags target_scale = <target_scale>
			rigger_cam_target :obj_applyscaling x = <target_scale> y = <target_scale> z = <target_scale>
			if (<dscale> > 0.0)
				soundevent event = sk9_photo_Aperture_Out
			else
				soundevent event = sk9_photo_Aperture_In
			endif
		endif
	endif
	wait 2 gameframes
	repeat
endscript

script goal_photo_target_out_set_in unhide_all = 0 do_proxim = 1 do_proxim_only = 0
	if (<do_proxim> = 1)
		rigger_cam_camera :gettags
		cleareventhandlergroup
		obj_setinnerradius <target_scale>
		seteventhandler event = objectinradius scr = goal_photo_target_in_set_out response = call_script
	endif
	if inmultiplayergame
		return
	endif
	if iscreated skater
		if skater :export_isrecording
			return
		endif
	endif
	if ($video_editor_in_video_editor = 1)
		return
	endif
	if ($cap_in_menu = 1)
		return
	endif
	if (<do_proxim_only> = 0)
		debounce select 0.5
		change goal_photo_in_target = false
		goal_photo_destroy_picture_control
		if screenelementexists id = goal_photo_take_pic_helper
			destroyscreenelement id = goal_photo_take_pic_helper
		endif
		if iscreated skater
			skater :walk_restorecamera
		endif
		rigger_cam_camera :gettags
		if (<picture_taken> = false)
			restore_start_key_binding
		endif
		killskatercamanim name = in_target_cam
		setslomo 1.0
		goal_photo_remove_screen_fx unhide_all = <unhide_all>
		goal_photo_remove_reticule_overlay
		soundevent event = photo_proto_SFX_stop_shutters
		if iscreated rigger_cam_target
			rigger_cam_target :unhide
		endif
		if rigger_cam_camera :getsingletag script_on_exit_target
			rigger_cam_camera :getsingletag params_on_exit_target
			<script_on_exit_target> <params_on_exit_target>
		endif
		restore_r3_binding
		if (<picture_taken> = true)
			<show_picture> = true
			if gman_getactivatedgoalid
				if gman_getconstant name = flags_tool
					if gman_flagfunc goal = <activated_goal_id> tool = <flags_tool> func = exists params = {flag = got_pic}
						<show_picture> = false
					endif
				endif
			endif
			if (<show_picture> = true)
				spawnscriptnow goal_photo_show_picture params = {do_rollout = false}
			else
				do_actual_unpause
				restore_start_key_binding
				show_all_hud_items
			endif
		else
			show_all_hud_items
		endif
	endif
endscript
goal_photo_in_target = false

script goal_photo_target_in_set_out do_proxim = 1
	printf "goal_photo_target_in_set_out"
	if (<do_proxim> = 1)
		rigger_cam_camera :gettags
		cleareventhandlergroup
		obj_setouterradius <target_scale>
		seteventhandler event = objectoutofradius scr = goal_photo_target_out_set_in response = call_script params = {unhide_all = 1}
	endif
	rigger_cam_camera :settags picture_taken = false
	if iscreated skater
		if skater :export_isrecording
			return
		endif
	endif
	if ($video_editor_in_video_editor = 1)
		return
	endif
	if ($ingame_save_active = 1)
		return
	endif
	if ($goal_photo_skater_adjusting_cam = 1)
		return
	endif
	if ($cap_in_menu = 1)
		return
	endif
	if inmultiplayergame
		return
	endif
	root_window :gettags
	if checksumequals a = <menu_state> b = on
		return
	endif
	change goal_photo_in_target = true
	if iscreated skater
		skater :walk_usemoviecamera
	endif
	kill_start_key_binding
	rigger_cam_camera :gettags
	playigccam {
		lockto = rigger_cam_camera
		pos = (0.0, 0.0, 0.2)
		quat = (0.0, 0.0, 0.0)
		fov = <fov>
		play_hold
		name = in_target_cam
	}
	skater :killspecial forcekill
	goal_in_game_episode_menu_exit hide_only = true
	kill_r3_binding
	setslomo 0.2
	spawnscriptnow goal_photo_hold_slomo
	goal_photo_add_reticule_overlay
	goal_photo_add_screen_fx
	if iscreated rigger_cam_target
		rigger_cam_target :hide
	endif
	if rigger_cam_camera :getsingletag script_on_enter_target
		rigger_cam_camera :getsingletag params_on_enter_target
		<script_on_enter_target> <params_on_enter_target>
	endif
	goal_photo_create_picture_control
	create_helper_text {
		parent = root_window
		anchor_id = goal_photo_take_pic_helper
		helper_text_elements = [
			{text = "\\m2 EXIT"}
			{text = "\\bm TAKE PICTURE"}
		]
	}
endscript

script goal_photo_create_picture_control 
	createscreenelement \{id = goal_photo_picture_handle
		type = containerelement
		parent = root_window
		pos = (0.0, 0.0)}
	setscreenelementprops \{id = goal_photo_picture_handle
		event_handlers = [
			{
				pad_r3
				goal_photo_take_picture
			}
			{
				pad_select
				goal_photo_exit_cam_target
			}
		]
		replace_handlers}
	launchevent \{type = focus
		target = goal_photo_picture_handle}
endscript

script goal_photo_exit_cam_target 
	if ($goal_photo_in_target = true)
		runscriptonobject \{id = rigger_cam_target
			goal_photo_target_wait_out_set_in}
		goal_photo_target_out_set_in \{do_proxim = 0}
	endif
endscript

script goal_photo_target_wait_out_set_in 
	rigger_cam_camera :gettags
	cleareventhandlergroup
	obj_setouterradius <target_scale>
	seteventhandler \{event = objectoutofradius
		scr = goal_photo_target_out_set_in
		response = call_script
		params = {
			do_proxim_only = 1
		}}
endscript
goal_photo_taking_picture = false

script goal_photo_reset_taking_picture 
	change \{goal_photo_taking_picture = false}
endscript

script goal_photo_take_picture 
	if ($goal_photo_taking_picture = true)
		return
	endif
	if ($goal_photo_in_target = false)
		return
	endif
	if ($ingame_save_active = 1)
		return
	endif
	if skater :held \{l3}
		return
	endif
	rigger_cam_camera :gettags
	if (<picture_taken> = false)
		spawnscriptlater \{goal_photo_take_picture_spawned}
	endif
endscript

script goal_photo_take_picture_spawned 
	change goal_photo_taking_picture = true
	onexitrun goal_photo_reset_taking_picture
	if ($goal_photo_in_target = false)
		return
	endif
	skater :pausephysics
	pauseskaters
	begin
	if skater :held l3
		skater :unpausephysics
		unpauseskaters
		return
	endif
	wait 1 gameframe
	repeat 5
	skater :unpausephysics
	unpauseskaters
	if ($goal_photo_in_target = false)
		return
	endif
	if ($ingame_save_active = 1)
		return false
	endif
	soundevent event = PhotoSFX_Take_Photo
	soundevent event = Stop_m_ru_SFX_Check
	if gman_getactivatedgoalid
		if gman_getconstant name = flags_tool
			if gman_flagfunc goal = <activated_goal_id> tool = <flags_tool> func = exists params = {flag = got_pic}
				gman_flagfunc goal = <activated_goal_id> tool = <flags_tool> func = set params = {flag = got_pic value = 1}
			endif
		endif
	endif
	goal_photo_destroy_picture_control
	if screenelementexists id = goal_photo_take_pic_helper
		destroyscreenelement id = goal_photo_take_pic_helper
	endif
	do_actual_pause
	if screenelementexists id = goal_photo_viewport_container
		printf "goal_photo_take_picture_spawned - DESTROYING VIEWPORT!!!!"
		destroyscreenelement id = goal_photo_viewport_container
		wait 10 gameframes ignoreslomo
	endif
	createscreenelement {
		type = containerelement
		parent = root_window
		id = goal_photo_viewport_container
		just = [center center]
		pos = (640.0, 320.0)
		z_priority = 1000
		alpha = 0
	}
	createscreenelement {
		parent = goal_photo_viewport_container
		id = goal_photo_viewport_photo_haze
		type = spriteelement
		pos = (0.01, 0.01)
		dims = (830.0, 468.0)
		just = [center center]
		texture = HUD_photo_overlay
		rgba = [50 42 38 150]
		z_priority = 5000
		Random (@ flip_h @ flip_v @ )
	}
	mempushcontext bottomupheap
	createscreenelement {
		type = viewportelement
		parent = goal_photo_viewport_container
		id = goal_photo_viewport_photo
		texture = viewport1
		just = [center center]
		pos = (0.0, 0.0)
		scale = (1.55 * (16.0, 9.0))
		has_shadow = true
	}
	mempopcontext
	createscreenelement {
		type = spriteelement
		parent = goal_photo_viewport_container
		id = goal_photo_viewport_background
		texture = white2
		just = [center center]
		pos = (0.0, 0.0)
		scale = (6.5 * (16.0, 9.0))
		rgba = [255 255 255 255]
	}
	createscreenelement {
		type = spriteelement
		parent = goal_photo_viewport_container
		id = goal_photo_viewport_border
		texture = white2
		just = [center center]
		pos = (0.0, 0.0)
		scale = (6.55 * (16.0, 9.0))
		rgba = [0 0 0 255]
	}
	if gman_getactivatedgoalid
		if gman_getconstant goal = <activated_goal_id> name = photo_sponsor
			switch <photo_sponsor>
				case Transworld
				<pos> = $goal_photo_transworld_logo_pos
				<sponsor_logo> = HUD_transworld
				case slap
				<pos> = $goal_photo_slap_logo_pos
				<sponsor_logo> = HUD_slap_magazine
				case focus
				<pos> = $goal_photo_focus_logo_pos
				<sponsor_logo> = HUD_focus_magazine
			endswitch
			createscreenelement {
				type = spriteelement
				parent = goal_photo_viewport_container
				pos = <pos>
				dims = (350.0, 175.0)
				texture = <sponsor_logo>
				z_priority = 5010
				rot_angle = -17
			}
		endif
	endif
	rigger_cam_camera :gettags
	<fov> = (<fov> - 12.0)
	if (<fov> < 2.0)
		<fov> = 2.0
	endif
	playigccam {
		name = temp_snap_cam
		viewport = goal_photo_viewport_photo
		lockto = rigger_cam_camera
		pos = (0.0, 0.0, 0.2)
		quat = (0.0, 0.0, 0.0)
		fov = <fov>
	}
	if rigger_cam_camera :getsingletag script_on_snap
		rigger_cam_camera :getsingletag params_on_snap
		<script_on_snap> <params_on_snap>
	endif
	wait 1 gameframes ignoreslomo
	rigger_cam_camera :settags picture_taken = true
	if screenelementexists id = goal_photo_viewport_photo
		goal_photo_viewport_photo :clearcamera
	endif
	killskatercamanim name = temp_snap_cam
	screenflash
	if screenelementexists id = goal_photo_viewport_container
		doscreenelementmorph id = goal_photo_viewport_container alpha = 1
		wait 5 gameframes ignoreslomo
		doscreenelementmorph id = goal_photo_viewport_container alpha = 0 time = 1
		wait 1 second ignoreslomo
	endif
	goal_photo_exit_cam_target
endscript

script goal_photo_destroy_picture_control 
	if screenelementexists \{id = goal_photo_picture_handle}
		destroyscreenelement \{id = goal_photo_picture_handle}
	endif
endscript

script goal_photo_save_picture_control 
	if game_progress_has_valid_save
		<event_handlers> = [
			{pad_btn_right goal_photo_save_fire_event params = {action = done}}
			{pad_btn_left goal_photo_save_fire_event params = {action = save}}
		]
		<helper_text_elements> = [
			{text = "\\m5 SAVE"}
			{text = "\\m1 EXIT"}
		]
	else
		<event_handlers> = [
			{pad_btn_right goal_photo_save_fire_event params = {action = done}}
		]
		<helper_text_elements> = [
			{text = "\\m1 EXIT"}
		]
	endif
	if screenelementexists id = goal_photo_save_handle
		destroyscreenelement id = goal_photo_save_handle
	endif
	createscreenelement {
		id = goal_photo_save_handle
		type = containerelement
		parent = root_window
		pos = (0.0, 0.0)
	}
	setscreenelementprops {
		id = goal_photo_save_handle
		event_handlers = <event_handlers>
		replace_handlers
	}
	launchevent type = focus target = goal_photo_save_handle
	create_helper_text {
		parent = root_window
		anchor_id = goal_photo_save_helper
		helper_text_elements = <helper_text_elements>
	}
endscript

script goal_photo_save_fire_event 
	launchevent broadcast type = goal_photo_save_option_selected data = {action = <action>}
endscript

script goal_photo_hold_skater_for_show 
	begin
	kill_start_key_binding
	skater :disableplayerinput
	skater :disablecameracontrol
	pauseskaters
	skater :pausephysics
	gman_pauseallgoals
	wait \{1
		gameframe}
	repeat
endscript

script goal_photo_unhold_skater_for_show 
	change \{goal_photo_showing_picture = false}
	killspawnedscript \{name = goal_photo_hold_skater_for_show}
endscript
goal_photo_showing_picture = false

script goal_photo_show_picture deactivate_tools = 0 set_pending_grade = false do_rollout = true
	if screenelementexists id = goal_photo_viewport_container
		if gman_getactivatedgoalid
			gman_getgoaltype goal = <activated_goal_id>
			if checksumequals a = <goal_type> b = photo
				if NOT checksumequals a = <activated_goal_id> b = m_photo_bowl_monuments
					begin
					root_window :gettags
					if checksumequals a = <menu_state> b = off
						break
					endif
					printf "goal_photo_show_picture - WAITING FOR PAUSE"
					wait 1 gameframe
					repeat
				endif
			endif
		endif
		change goal_photo_showing_picture = true
		goal_trigger_dialog_kill
		if (<do_rollout> = true)
			goal_rollout_skater deactivate_tools = <deactivate_tools>
		endif
		onexitrun goal_photo_unhold_skater_for_show
		spawnscriptnow goal_photo_hold_skater_for_show
		if objectexists id = rigger_cam_camera
			if rigger_cam_camera :getsingletag script_before_preview
				rigger_cam_camera :getsingletag params_before_preview
				<script_before_preview> <params_before_preview>
			endif
		else
			if gman_getactivatedgoalid
				if gman_getconstant goal = <activated_goal_id> name = script_before_preview
					gman_getconstant goal = <activated_goal_id> name = params_before_preview
					<script_before_preview> <params_before_preview>
				endif
			endif
		endif
		soundevent event = PhotoSFX_Show_Photo
		setscreenelementprops id = goal_photo_viewport_container pos = (1000.0, 1200.0)
		doscreenelementmorph id = goal_photo_viewport_container alpha = 1
		doscreenelementmorph id = goal_photo_viewport_container pos = (640.0, 320.0) rot_angle = 350 anim = fast_out time = 0.2
		goal_photo_save_picture_control
		block untilevent = goal_photo_save_option_selected
		soundevent event = PhotoSFX_Remove_Photo
		if screenelementexists id = goal_photo_viewport_container
			doscreenelementmorph id = goal_photo_viewport_container alpha = 0
		endif
		if screenelementexists id = goal_photo_save_handle
			destroyscreenelement id = goal_photo_save_handle
		endif
		if screenelementexists id = goal_photo_save_helper
			destroyscreenelement id = goal_photo_save_helper
		endif
		if ((<event_data>.action) = save)
			if isxenon
				if goal_photo_save_photo
					saved_photo = 1
				endif
			else
				if goal_photo_save_photo
					saved_photo = 1
				endif
			endif
		endif
		if screenelementexists id = goal_photo_viewport_container
			destroyscreenelement id = goal_photo_viewport_container
		endif
		if gotparam saved_photo
			if gman_hasactivegoals
				change goal_save_extra_data = 1
			else
				spawnscriptlater do_autosave
			endif
		endif
		onexitrun nullscript
		goal_photo_unhold_skater_for_show
		do_actual_unpause
		show_all_hud_items
		change goal_photo_showing_picture = false
		if ((gotparam goal) && (gotparam grade))
			if (<set_pending_grade> = true)
				gman_setpendinggrade goal = <goal> grade = <grade>
			else
				gman_setgrade goal = <goal> grade = <grade>
			endif
			gman_passcheckpoint goal = <goal> do_rollout = 0
		else
			restore_start_key_binding
			skater :enableplayerinput
			skater :enablecameracontrol
			unpauseskaters
			skater :unpausephysics
			gman_unpauseallgoals
		endif
		if objectexists id = rigger_cam_camera
			if rigger_cam_camera :getsingletag script_after_preview
				rigger_cam_camera :getsingletag params_after_preview
				spawnscriptlater <script_after_preview> params = {<params_after_preview>}
			endif
		else
			if gman_getactivatedgoalid
				if gman_getconstant goal = <activated_goal_id> name = script_after_preview
					gman_getconstant goal = <activated_goal_id> name = params_after_preview
					spawnscriptlater <script_after_preview> params = {<params_after_preview>}
				endif
			endif
		endif
	endif
endscript
goal_photo_save_photo_success = 0

script goal_photo_save_photo 
	printf 'goal_photo_save_photo'
	PhotoFunc get_count
	if (<count> >= $max_profile_photos)
		printf 'No more room in profile for this photo'
		pausegame
		create_dialog_box {
			preserve_case
			text_dims = (820.0, 0.0)
			vmenu_width = 720
			title = "Photo Album Full"
			text = "Your photo album is full.\\nYou'll need to delete some existing photos for you to be able to save new ones."
			buttons = [
				{font = text_a1 text = "Cancel Save" pad_choose_script = goal_photo_album_full_cancel}
			]
		}
		block type = goal_album_full_dialog_done
		unpausegame
		return false
	endif
	if NOT MC_SpaceForNewFile filetype = photo
		pausegame
		do_ok_dialog_box {title = "No space to save"
			text = "No space to save new photos. Please delete some existing data."
			text_dims = (280.0, 0.0)
		}
		unpausegame
		return false
	endif
	current_zone = unknown
	if getpakmancurrentname map = zones
		formattext checksumname = current_zone '%s' s = <pakname>
	endif
	if gman_getactivatedgoalid
		if gman_getconstant goal = <activated_goal_id> name = photo_sponsor
			photo_sponsor = <photo_sponsor>
		endif
	endif
	PhotoFunc get_new_id
	formattext textname = <text_name> "Photo %d" d = <new_id>
	manglechecksums a = <new_id> b = 0
	photo_meta_data = {
		zone = <current_zone>
		name = <mangled_id>
		text = <text_name>
		photo_sponsor = <photo_sponsor>
	}
	mempushcontext animexportdata
	pushassetcontext context = photos
	printf 'PhotoCreateTexture'
	PhotoCreateTexture viewport = goal_photo_viewport_photo meta_data = <photo_meta_data>
	popassetcontext
	mempopcontext
	change goal_photo_save_photo_success = 0
	spawnscriptnow goal_photo_save_to_mc params = {filename = <mangled_id>}
	block type = photo_mc_save_finished
	if ($goal_photo_save_photo_success = 1)
		PhotoFunc add meta_data = <photo_meta_data>
	endif
	printf 'PhotoDeleteTexture'
	PhotoDeleteTexture
	if ($goal_photo_save_photo_success = 1)
		soundevent event = photo_saved_sfx
		return true
	endif
	return false
endscript

script goal_photo_album_full_cancel 
	dialog_box_exit
	unpausespawnedscript \{goal_photo_save_photo}
	broadcastevent \{type = goal_album_full_dialog_done}
endscript

script goal_photo_album_delete 
	dialog_box_exit
	unpausespawnedscript \{goal_photo_save_photo}
	broadcastevent \{type = goal_album_full_dialog_done}
endscript

script goal_photo_add_reticule_overlay 
	<rgba_camera_hud> = [170 195 200 100]
	createscreenelement {
		type = containerelement
		parent = root_window
		id = goal_photo_camera_hud
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = 100
	}
	tilesprite {
		texture = hud_interlace
		parent = goal_photo_camera_hud
		tile_dims = (1280.0, 720.0)
		dims = (128.0, 128.0)
		pos = (0.0, 0.0)
		sprite_props = {rgba = [80 125 150 20]}
		container_props = {z_priority = -4}
	}
	createscreenelement {
		type = containerelement
		parent = goal_photo_camera_hud
		id = reticule_lines
		just = [center center]
		dims = (900.0, 506.0)
		pos = (640.0, 360.0)
	}
	createscreenelement {
		type = spriteelement
		parent = reticule_lines
		texture = hud_cam_reticule
		just = [center center]
		dims = (180.0, 180.0)
		rgba = <rgba_camera_hud>
		pos = {(0.5, 0.5) proportional}
	}
	createscreenelement {
		type = spriteelement
		parent = reticule_lines
		texture = white
		just = [left top]
		dims = (100.0, 5.0)
		rgba = <rgba_camera_hud>
		pos = {(0.0, 0.0) proportional}
	}
	createscreenelement {
		type = spriteelement
		parent = reticule_lines
		texture = white
		just = [right top]
		dims = (100.0, 5.0)
		rgba = <rgba_camera_hud>
		pos = {(1.0, 0.0) proportional}
	}
	createscreenelement {
		type = spriteelement
		parent = reticule_lines
		texture = white
		just = [left top]
		dims = (100.0, 5.0)
		rgba = <rgba_camera_hud>
		pos = {(0.0, 0.0) proportional}
		rot_angle = 90
	}
	createscreenelement {
		type = spriteelement
		parent = reticule_lines
		texture = white
		just = [right top]
		dims = (100.0, 5.0)
		rgba = <rgba_camera_hud>
		pos = {(1.0, 0.0) proportional}
		rot_angle = -90
	}
	createscreenelement {
		type = spriteelement
		parent = reticule_lines
		texture = white
		just = [left top]
		dims = (100.0, 5.0)
		rgba = <rgba_camera_hud>
		pos = {(0.0, 1.0) proportional}
	}
	createscreenelement {
		type = spriteelement
		parent = reticule_lines
		texture = white
		just = [left top]
		dims = (100.0, 5.0)
		rgba = <rgba_camera_hud>
		pos = {(0.0, 1.0) proportional}
		rot_angle = -90
	}
	createscreenelement {
		type = spriteelement
		parent = reticule_lines
		texture = white
		just = [right top]
		dims = (100.0, 5.0)
		rgba = <rgba_camera_hud>
		pos = {(1.0, 1.0) proportional}
	}
	createscreenelement {
		type = spriteelement
		parent = reticule_lines
		texture = white
		just = [right top]
		dims = (100.0, 5.0)
		rgba = <rgba_camera_hud>
		pos = {(1.0, 1.0) proportional}
		rot_angle = 90
	}
endscript

script goal_photo_remove_reticule_overlay 
	if screenelementexists \{id = goal_photo_camera_hud}
		destroyscreenelement \{id = goal_photo_camera_hud}
	endif
endscript

script goal_photo_add_screen_fx viewport = 0
	hide_all_hud_items
	screenfx_addfxinstance {name = photo_Noise viewport = <viewport> type = noise on = 1 intensity = 0.075 color = [200 180 20]}
	screenfx_addfxinstance {name = photo_Bright_Sat viewport = <viewport> type = bright_sat on = 1 saturation = 0.8}
	screenfx_addfxinstance {name = photo_Poisson_DOF viewport = <viewport> type = poisson_dof on = 1 backdist = 0.01 focaldist = 0.005 frontdist = 0.0 clampback = 0.1}
	screenfx_addfxinstance {name = photo_Fisheye viewport = <viewport> type = fisheye on = 1 warp_strength = 0.4}
endscript

script goal_photo_remove_screen_fx viewport = 0
	if (<unhide_all> = 1)
		show_all_hud_items
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = photo_Noise
		screenfx_removefxinstance viewport = <viewport> name = photo_Noise
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = photo_Bright_Sat
		screenfx_removefxinstance viewport = <viewport> name = photo_Bright_Sat
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = photo_Poisson_DOF
		screenfx_removefxinstance viewport = <viewport> name = photo_Poisson_DOF
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = photo_Fisheye
		screenfx_removefxinstance viewport = <viewport> name = photo_Fisheye
	endif
endscript

script goal_photo_fine_adjust_cleanup 
	if iscreated \{skater}
		skater :obj_killspawnedscript \{name = goal_photo_fine_adjust_cam}
	endif
	goal_photo_accept_cam \{exit_only = true}
endscript

script goal_photo_kill_cam 
	goal_photo_fine_adjust_cleanup
	killspawnedscript name = goal_photo_show_picture
	if screenelementexists id = goal_photo_viewport_container
		destroyscreenelement id = goal_photo_viewport_container
	endif
	change goal_photo_in_target = false
	do_callback = true
	if gotparam replace_camera
		delete = true
		removecomponent delete_from_script
	endif
	if screenelementexists id = ped_speech_dialog
		destroyscreenelement id = ped_speech_dialog
	endif
	if gotparam finish
		<do_callback> = false
		if iscreated rigger_cam_camera
			rigger_cam_camera :gettags
			if (<state> = mobile)
				rigger_cam_camera :die
				if iscreated rigger_cam_target
					rigger_cam_target :die
				endif
			endif
		endif
	endif
	if gotparam scroll
		<do_callback> = false
		if iscreated rigger_cam_camera
			rigger_cam_camera :gettags
			if (<state> = mobile)
				rigger_cam_camera :die
				if iscreated rigger_cam_target
					rigger_cam_target :die
				endif
			endif
		endif
	endif
	if gotparam delete_cursor
		<do_callback> = false
		if iscreated rigger_cam_camera
			rigger_cam_camera :gettags
			if (<state> = mobile)
				rigger_cam_camera :die
				if iscreated rigger_cam_target
					rigger_cam_target :die
				endif
			endif
		endif
	endif
	if gotparam grab_this
		if objectexists id = rigger_cam_adjust_proxim
			rigger_cam_adjust_proxim :die
		endif
		if iscreated rigger_cam_camera
			rigger_cam_camera :die
		endif
		if iscreated rigger_cam_target
			rigger_cam_target :die
		endif
		if ((($cap_current_type) = special) && (($cap_current_index) = 0))
			spawnscriptnow goal_photo_wait_reinit_mobile_cam
		endif
		change cap_rigger_cam_id = null
	endif
	if gotparam delete
		if objectexists id = rigger_cam_adjust_proxim
			rigger_cam_adjust_proxim :die
		endif
		if iscreated rigger_cam_camera
			rigger_cam_camera :die
		endif
		if iscreated rigger_cam_target
			rigger_cam_target :die
		endif
		if ((($cap_current_type) = special) && (($cap_current_index) = 0))
			spawnscriptnow goal_photo_wait_reinit_mobile_cam
		endif
		change cap_rigger_cam_id = null
	endif
	if gotparam delete_all
		if objectexists id = rigger_cam_adjust_proxim
			rigger_cam_adjust_proxim :die
		endif
		if iscreated rigger_cam_camera
			rigger_cam_camera :gettags
			rigger_cam_camera :die
		endif
		if iscreated rigger_cam_target
			rigger_cam_target :die
		endif
		if screenelementexists id = goal_photo_take_pic_helper
			destroyscreenelement id = goal_photo_take_pic_helper
		endif
		killskatercamanim name = in_target_cam
		setslomo 1.0
		goal_photo_remove_screen_fx unhide_all = 1
		goal_photo_remove_reticule_overlay
		goal_photo_destroy_picture_control
		change cap_rigger_cam_id = null
	endif
	if gotparam delete_from_script
		if objectexists id = rigger_cam_adjust_proxim
			rigger_cam_adjust_proxim :die
		endif
		if iscreated rigger_cam_camera
			rigger_cam_camera :gettags
			rigger_cam_camera :die
		endif
		if iscreated rigger_cam_target
			rigger_cam_target :die
		endif
		restore_start_key_binding
		if screenelementexists id = goal_photo_take_pic_helper
			destroyscreenelement id = goal_photo_take_pic_helper
		endif
		killskatercamanim name = in_target_cam
		setslomo 1.0
		goal_photo_remove_screen_fx unhide_all = 1
		goal_photo_remove_reticule_overlay
		goal_photo_destroy_picture_control
		change cap_rigger_cam_id = null
	endif
	if (<do_callback> = true)
		if gman_getactivatedgoalid
			if gman_getconstant name = script_on_destroy
				<script_on_destroy>
			endif
		endif
	endif
endscript

script goal_photo_wait_reinit_mobile_cam 
	wait \{2
		gameframes}
	runscriptonobject \{id = rigakit_cursor
		goal_photo_init_mobile_cam}
endscript

script goal_photo_lock_skater 
	MakeSkaterGoto \{SkaterInit}
	skater :pausephysics
	skater :disableplayerinput
	skater :hide
	MakeSkaterGoto \{SkaterInit}
	skater :setspeed \{0}
	pauseskaters
	kill_start_key_binding
endscript

script goal_photo_unlock_skater 
	debounce \{x
		0.5}
	MakeSkaterGoto \{SkaterInit}
	skater :unpausephysics
	skater :unhide
	skater :enableplayerinput
	unpauseskaters
	skater :setspeed \{0}
	restore_start_key_binding
endscript

script goal_photo_hold_slomo 
	begin
	if ($goal_photo_in_target = false)
		break
	endif
	setslomo \{0.2}
	wait \{1
		gameframe}
	repeat
endscript

script goal_photo_print_default_camera_position 
	WriteRigAKitPiecesToArray array_name = pieces
	getarraysize pieces
	if (<array_size> > 0)
		<index> = 0
		begin
		if checksumequals a = (<pieces> [<index>].piece_type) b = special
			if ((<pieces> [<index>].piece_index) = 0)
				if iscreated rigger_cam_camera
					rigger_cam_camera :obj_getquat
				endif
				<cam_quat> = <quat>
				<cam_stand_pos> = (<pieces> [<index>].pos)
				<cam_stand_quat> = (<pieces> [<index>].quat)
				rigger_cam_camera :gettags
				<cam_target_offset> = <target_offset>
				<cam_target_scale> = <target_scale>
				<cam_zoom> = <fov>
				removecomponent quat
				removecomponent index
				removecomponent id
				removecomponent state
				removecomponent picture_taken
				removecomponent target_offset
				removecomponent target_scale
				removecomponent fov
				break
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	removecomponent pieces
	removecomponent array_size
	if ((gotparam cam_quat) && (gotparam cam_stand_pos) && (gotparam cam_stand_quat))
		printf ''
		printf ''
		printf 'RIGGER CAMERA INFO'
		printstruct <...>
		printf ''
		printf ''
	else
		printf ''
		printf ''
		printf 'COULDN\'T FIND RIGGER CAMERA'
		printf ''
		printf ''
	endif
endscript

script goal_photo_update_cam_details 
	if gotparam cam_quat
		rigger_cam_camera :obj_setorientation quat = <cam_quat>
	endif
	if gotparam cam_zoom
		rigger_cam_camera :settags fov = <cam_zoom>
	endif
	if gotparam cam_target_offset
		rigger_cam_camera :settags target_offset = <cam_target_offset>
		<new_offset> = ((0.0, 0.0, 1.0) * <cam_target_offset>)
		rigger_cam_target :obj_locktoobject objectname = rigger_cam_camera <new_offset>
	endif
	if gotparam cam_target_scale
		rigger_cam_camera :settags target_scale = <cam_target_scale>
		rigger_cam_target :obj_applyscaling x = <cam_target_scale> y = <cam_target_scale> z = <cam_target_scale>
		runscriptonobject {
			id = rigger_cam_target
			goal_photo_target_out_set_in
		}
	endif
endscript

script goal_photo_place_default_camera 
	choose_new_cap_object_name
	create_new_cap_object {
		pos = <cam_stand_pos>
		quat = <cam_stand_quat>
		constructtype = special
		constructindex = 0
		name = <name>
		callback_details = <callback_details>
	}
	goal_photo_update_cam_details cam_quat = <cam_quat> cam_zoom = <cam_zoom> cam_target_offset = <cam_target_offset> cam_target_scale = <cam_target_scale>
	change cap_rigger_cam_id = <name>
endscript

script goal_photo_remove_default_camera 
	if checksumequals a = ($cap_rigger_cam_id) b = null
		printf "goal_photo_remove_default_camera - DEFAULT CAM IS NULL"
	else
		if compositeobjectexists ($cap_rigger_cam_id)
			($cap_rigger_cam_id) :rak_getpiecetype
			($cap_rigger_cam_id) :rak_getpieceindex
			<cap_rigger_cam_object_id> = ($cap_rigger_cam_id)
			CAP_Run_Callback_Script {
				object_id = ($cap_rigger_cam_id)
				script_type = delete_script
				params_type = delete_script_params
				callback_details = {delete_from_script replace_camera = <replace_camera>}
			}
			<cap_rigger_cam_object_id> :die
			change cap_rigger_cam_id = null
			cap_update_piece_count_display
		endif
	endif
endscript
goal_photo_save_retry_filename_int = 0

script goal_photo_save_to_mc 
	casttointeger filename
	change goal_photo_save_retry_filename_int = <filename>
	formattext textname = textname "%d" d = <filename> integer_width = 6
	printf 'goal_photo_save_to_mc'
	setsavefilename filetype = photo name = <textname>
	change RetryScript = goal_photo_save_to_mc_retry
	change abortscript = goal_photo_save_to_mc_abort
	change DoneScript = goal_photo_save_to_mc_done
	change savingorloading = saving
	if ($memcard_using_new_save_system = 1)
		check_card no_message filetype = photo save ValidateForAutoSave = 1 force = <force> saving_extra_data
		ingame_quicksave filetype = photo delete_fail_is_okay no_pools filename = <textname> suspend_ui
	else
		check_card filetype = photo save
		ingame_quicksave filetype = photo delete_fail_is_okay no_pools
	endif
endscript

script goal_photo_save_to_mc_done 
	printf \{'goal_photo_save_to_mc_done'}
	printstruct <...>
	setsavefilename \{filetype = photo
		clear}
	change \{goal_photo_save_photo_success = 1}
	broadcastevent \{type = photo_mc_save_finished}
endscript

script goal_photo_save_to_mc_abort 
	printf \{'goal_photo_save_to_mc_abort'}
	wait \{2
		gameframes}
	memcard_menus_cleanup
	wait \{2
		gameframes}
	setsavefilename \{filetype = photo
		clear}
	broadcastevent \{type = photo_mc_save_finished}
endscript

script goal_photo_save_to_mc_retry 
	printf \{'goal_photo_save_to_mc_retry'}
	memcard_menus_cleanup
	goto goal_photo_save_to_mc params = {filename = ($goal_photo_save_retry_filename_int) <...>}
endscript
