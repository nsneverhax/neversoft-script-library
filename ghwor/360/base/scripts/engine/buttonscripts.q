select_shift = 0
memcard_screenshots = 0
skater_cam_0_mode = 2
skater_cam_1_mode = 2
screenshotmode = 0
disable_screenshots = 0
alternate_viewer_hud_behavior = 0
g_debug_win_song_stars = 5.0
arl_text = qs(0xfa6448fa)
arr_text = qs(0x1994c5f0)
aru_text = qs(0xe2af40e0)
ard_text = qs(0x92c68649)
all_text = qs(0x56ec18ea)
alr_text = qs(0xebf66988)
alu_text = qs(0x1a0d9384)
ald_text = qs(0x6bbf81bd)
root_text = {
	arl_text = qs(0xfa6448fa)
	arr_text = qs(0x1994c5f0)
	aru_text = qs(0xe2af40e0)
	ard_text = qs(0x92c68649)
	all_text = qs(0x56ec18ea)
	alr_text = qs(0xebf66988)
	alu_text = qs(0x1a0d9384)
	ald_text = qs(0x6bbf81bd)
}
modelviewer_text = {
	arl_text = qs(0xfa6448fa)
	arr_text = qs(0xe1145bb2)
	aru_text = qs(0xe2af40e0)
	ard_text = qs(0x92c68649)
	all_text = qs(0x21114c03)
	alr_text = qs(0x6d6e0b45)
	alu_text = qs(0x1a0d9384)
	ald_text = qs(0x6bbf81bd)
}
select_text = root_text

script set_select_text \{text = $root_text}
	Change all_text = (<text>.all_text)
	Change alr_text = (<text>.alr_text)
	Change alu_text = (<text>.alu_text)
	Change ald_text = (<text>.ald_text)
	Change arl_text = (<text>.arl_text)
	Change arr_text = (<text>.arr_text)
	Change aru_text = (<text>.aru_text)
	Change ard_text = (<text>.ard_text)
	Change select_text = <text>
	refresh_analog_options
endscript

script refresh_analog_options 
	hide_analog_options
	show_analog_options
endscript

script UserSelectSelect 
	if IsObserving
		return
	endif
	if IsSurveying
		return
	endif
	if ScreenElementExists \{id = current_menu_anchor}
		return
	endif
	if ScreenElementExists \{id = root_window}
		if root_window :GetSingleTag \{menu_state}
			if (<menu_state> = On)
				return
			endif
		endif
	endif
	if ScreenElementExists \{id = videophone_notification}
		return
	endif
	if ObjectExists \{id = skatercam0}
		switch skater_cam_0_mode
			case 1
			Change \{skater_cam_0_mode = 2}
			case 2
			Change \{skater_cam_0_mode = 3}
			case 3
			Change \{skater_cam_0_mode = 4}
			case 4
			Change \{skater_cam_0_mode = 1}
		endswitch
		skatercam0 :sc_setmode \{mode = skater_cam_0_mode}
	endif
endscript

script UserSelectSelect2 
	if IsObserving
		return
	endif
	if IsSurveying
		return
	endif
	if ScreenElementExists \{id = current_menu_anchor}
		return
	endif
	if ScreenElementExists \{id = root_window}
		if root_window :GetSingleTag \{menu_state}
			if (<menu_state> = On)
				return
			endif
		endif
	endif
	if ObjectExists \{id = skatercam1}
		switch skater_cam_1_mode
			case 1
			Change \{skater_cam_1_mode = 2}
			case 2
			Change \{skater_cam_1_mode = 3}
			case 3
			Change \{skater_cam_1_mode = 4}
			case 4
			Change \{skater_cam_1_mode = 1}
		endswitch
		skatercam1 :sc_setmode \{mode = skater_cam_1_mode}
	endif
endscript
view_mode = 0
render_mode = 0
wireframe_mode = 0
drop_in_car = 0
drop_in_car_setup = MiniBajaCarSetup

script UserSelectTriangle 
	if ($view_mode = 1)
		return
	endif
	if ($screenshotmode = 0)
		Change \{screenshotmode = 1}
		<text> = qs(0x6e88b80c)
	else
		Change \{screenshotmode = 0}
		<text> = qs(0x20ffabb3)
	endif
	if ScreenElementExists \{id = center_tri}
		SetScreenElementProps {
			id = center_tri
			text = <text>
		}
	endif
	return
	if NotCD
		switch $render_mode
			case 0
			Change \{render_mode = 1}
			show_wireframe_mode
			case 1
			Change \{render_mode = 2}
			show_wireframe_mode
			case 2
			Change \{render_mode = 3}
			toggle_wireframe_skins
			case 3
			Change \{render_mode = 4}
			toggle_wireframe_skins
			case 4
			Change \{render_mode = 0}
			toggle_wireframe_skins
		endswitch
		if (($render_mode = 3) || ($render_mode = 4))
			setRenderMode \{mode = 0}
		else
			setRenderMode \{mode = $render_mode}
		endif
	endif
endscript
viewer_taking_screenshot = 0

script do_screenshot 
	Change \{viewer_taking_screenshot = 1}
	hide_analog_options
	if toggle2d \{OFF}
		Wait \{2
			frames}
		hide_analog_options
		Wait \{2
			frames}
		ScreenShot
		Wait \{2
			frames}
		toggle2d \{On}
		Change \{viewer_taking_screenshot = 0}
	else
		Wait \{2
			frames}
		hide_analog_options
		Wait \{2
			frames}
		ScreenShot
		Wait \{2
			frames}
		Change \{viewer_taking_screenshot = 0}
	endif
endscript

script UserSelectSquare 
	if NotCD
		SpawnScriptLater \{do_screenshot}
	endif
endscript

script UserSelectCircle 
	ToggleMetrics
endscript

script UserSelectStart 
	if NotCD
		Change \{render_mode = 0}
		setRenderMode \{mode = $render_mode}
		TogglePass \{pass = 0}
	endif
endscript
debug_show_analog_options = 1

script debug_analog_options_enable 
	Change \{debug_show_analog_options = 1}
endscript

script debug_analog_options_disable 
	Change \{debug_show_analog_options = 0}
endscript

script show_analog_options 
	if ($viewer_taking_screenshot = 1)
		return
	endif
	if ($profiling_cameracuts = true)
		return
	endif
	if ($debug_show_analog_options = 0)
		return
	endif
	if NOT ScreenElementExists \{id = viewer_options_anchor}
		SetScreenElementLock \{id = root_window
			OFF}
		CreateScreenElement \{id = viewer_options_anchor
			Type = ContainerElement
			parent = root_window
			Pos = (0.0, 0.0)
			z_priority = 6000}
		CreateScreenElement \{id = viewer_options_bg
			Type = SpriteElement
			parent = viewer_options_anchor
			dims = (1280.0, 160.0)
			Pos = (0.0, 20.0)
			just = [
				left
				top
			]
			rgba = [
				0
				0
				0
				255
			]
			alpha = 0.3}
		CreateScreenElement \{id = left_anchor
			Type = ContainerElement
			parent = viewer_options_anchor
			Scale = 1.0
			Pos = (256.0, 96.0)
			just = [
				left
				top
			]}
		CreateScreenElement \{id = analog_l_l
			Type = TextElement
			parent = left_anchor
			font = debug
			text = $all_text
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				right
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_l_r
			Type = TextElement
			parent = left_anchor
			font = debug
			text = $alr_text
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				left
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_l_t_button
			Type = TextElement
			parent = left_anchor
			font = debug
			text = qs(0xbb0b71dd)
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				center
				bottom
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_l_t
			Type = TextElement
			parent = left_anchor
			font = debug
			text = $alu_text
			Scale = 0.8
			Pos = (0.0, -28.0)
			just = [
				center
				bottom
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_l_b_button
			Type = TextElement
			parent = left_anchor
			font = debug
			text = qs(0x9026221e)
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_l_b
			Type = TextElement
			parent = left_anchor
			font = debug
			text = $ald_text
			Scale = 0.8
			Pos = (0.0, 32.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = right_anchor
			Type = ContainerElement
			parent = viewer_options_anchor
			Scale = 1.0
			Pos = (1024.0, 96.0)
			just = [
				left
				top
			]}
		CreateScreenElement \{id = analog_r_l
			Type = TextElement
			parent = right_anchor
			font = debug
			text = $arl_text
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				right
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_r_r
			Type = TextElement
			parent = right_anchor
			font = debug
			text = $arr_text
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				left
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_r_t_button
			Type = TextElement
			parent = right_anchor
			font = debug
			text = qs(0xbb0b71dd)
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				center
				bottom
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_r_t
			Type = TextElement
			parent = right_anchor
			font = debug
			text = $aru_text
			Scale = 0.8
			Pos = (0.0, -28.0)
			just = [
				center
				bottom
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_r_b_button
			Type = TextElement
			parent = right_anchor
			font = debug
			text = qs(0x9026221e)
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = analog_r_b
			Type = TextElement
			parent = right_anchor
			font = debug
			text = $ard_text
			Scale = 0.8
			Pos = (0.0, 32.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = center_anchor
			Type = ContainerElement
			parent = viewer_options_anchor
			Scale = 1.0
			Pos = (640.0, 96.0)
			just = [
				left
				top
			]}
		CreateScreenElement \{id = center_square
			Type = TextElement
			parent = center_anchor
			font = debug
			text = qs(0x3c0326f0)
			Scale = 0.8
			Pos = (-16.0, 0.0)
			just = [
				right
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = center_circle
			Type = TextElement
			parent = center_anchor
			font = debug
			text = qs(0x2d551b2a)
			Scale = 0.8
			Pos = (16.0, 0.0)
			just = [
				left
				center
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = center_tri_button
			Type = TextElement
			parent = center_anchor
			font = debug
			text = qs(0xf44ae71a)
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				center
				bottom
			]
			rgba = [
				100
				100
				100
				255
			]}
		if ($screenshotmode = 0)
			<text> = qs(0x20ffabb3)
		else
			<text> = qs(0x6e88b80c)
		endif
		CreateScreenElement {
			id = center_tri
			Type = TextElement
			parent = center_anchor
			font = debug
			text = <text>
			Scale = 0.8
			Pos = (0.0, -16.0)
			just = [center bottom]
			rgba = [100 100 100 255]
		}
		CreateScreenElement \{id = center_x_button
			Type = TextElement
			parent = center_anchor
			font = debug
			text = qs(0xdf67b4d9)
			Scale = 0.8
			Pos = (0.0, 0.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		CreateScreenElement \{id = center_x
			Type = TextElement
			parent = center_anchor
			font = debug
			text = qs(0x761a966f)
			Scale = 0.8
			Pos = (0.0, 32.0)
			just = [
				center
				top
			]
			rgba = [
				100
				100
				100
				255
			]}
		SetScreenElementLock \{id = root_window
			On}
	endif
endscript

script hide_analog_options 
	if ScreenElementExists \{id = viewer_options_anchor}
		DestroyScreenElement \{id = viewer_options_anchor}
	endif
endscript
toggleviewmode_enabled = true

script ToggleViewMode 
	if ($toggleviewmode_enabled = FALSE)
		return
	endif
	switch $view_mode
		case 0
		if ViewportExists \{id = bg_viewport}
			GetViewportCameraPos \{viewport = bg_viewport}
			GetViewportCameraOrient \{viewport = bg_viewport}
		endif
		Change \{viewercam_nofail = 1}
		SetSaveZoneNameToCurrent
		SetAnalogStickActiveForMenus \{0}
		Change \{view_mode = 1}
		SetEnableMovies \{0}
		MakeGemsVisibleOnAllViewports
		if NOT userviewerinfe
			gh_pause_ui
			enable_pause
			Change \{pause_grace_period = -1.0}
		else
			switch_to_obj_speed
			set_viewer_speed
		endif
		unpausespawnedscript \{update_crowd_model_cam}
		if ViewportExists \{id = bg_viewport}
			disable_bg_viewport
		endif
		enable_crowd_models_cfunc \{Active = true}
		hide_hud
		case 1
		Change \{view_mode = 2}
		case 2
		Change \{viewercam_nofail = 0}
		if NOT GotParam \{no_reload}
			GetSaveZoneName
			SetPakManCurrentBlock map = zones pakname = <save_zone>
		endif
		Change \{view_mode = 0}
		SetAnalogStickActiveForMenus \{1}
		viewer_cam :SetHFOV hfov = ($camera_fov)
		SetEnableMovies \{1}
		show_hud
		if ViewportExists \{id = bg_viewport}
			enable_bg_viewport
		endif
		gh_unpause_ui
		Change \{pause_grace_period = -1.0}
		if userviewerinfe
			disable_pause
		else
			enable_pause
		endif
	endswitch
	SetViewMode \{$view_mode}
	if ($view_mode = 1)
		if NOT GotParam \{viewerreload}
			if ViewportExists \{id = bg_viewport}
				if GotParam \{at}
					SetViewportCameraOrient viewport = bg_viewport at = <at> left = <left> up = <up>
					SetViewportCameraPos viewport = bg_viewport Pos = <Pos>
				endif
			endif
		endif
	endif
	if ($view_mode = 2)
		ToggleViewMode
	endif
endscript

script UserSelectX 
	if IsGuitarController \{controller = 0}
		UserSelectLeftAnalogUp
		return
	endif
	if soft_assert_is_active
		return
	endif
	Change \{viewer_rotation_angle = 0}
	ToggleViewMode
	switch_to_env_speed
	if ($view_mode = 1)
		set_viewer_speed
	endif
endscript

script UserSelectRightAnalogUp 
	if ($objviewer_light_test = 1)
		LightShow_CycleNextSnapshot \{UseSnapshotPositions = true
			save = true}
	else
		lightshow_debugcycle
	endif
endscript

script UserSelectRightAnalogDown 
	if ($objviewer_light_test = 1)
		LightShow_CycleNextSnapshot \{UseSnapshotPositions = true
			save = true}
	else
		lightshow_debugcycle \{Dir = -1}
	endif
endscript

script flip_crowd_debug_mode 
	if ($crowd_debug_mode = 1)
		Change \{crowd_debug_mode = 0}
	else
		Change \{crowd_debug_mode = 1}
	endif
endscript
pak_mode = 0
debug_encore = 0
debug_career_transformations = 0

script UserSelectRightAnalogLeft 
	debug_menu_select_start_song \{force_transformation = 1}
endscript
toggle_nav_view_mode = 0

script UserSelectRightAnalogRight 
	Pos = (1000.0, 170.0)
	if ($debug_forcescore = OFF)
		Change \{debug_forcescore_dir = up}
		Change \{debug_forcescore = poor}
		create_panel_message text = qs(0x43c6fab9) Pos = <Pos> id = autoplay
	elseif ($debug_forcescore = poor &&
			$debug_forcescore_dir = up)
		Change \{debug_forcescore = medium}
		create_panel_message text = qs(0x97004065) Pos = <Pos> id = autoplay
	elseif ($debug_forcescore = medium &&
			$debug_forcescore_dir = up)
		Change \{debug_forcescore = good}
		create_panel_message text = qs(0x2920775c) Pos = <Pos> id = autoplay
	elseif ($debug_forcescore = good)
		Change \{debug_forcescore_dir = down}
		Change \{debug_forcescore = medium}
		create_panel_message text = qs(0x97004065) Pos = <Pos> id = autoplay
	elseif ($debug_forcescore = medium &&
			$debug_forcescore_dir = down)
		Change \{debug_forcescore = poor}
		create_panel_message text = qs(0x43c6fab9) Pos = <Pos> id = autoplay
	elseif ($debug_forcescore = poor &&
			$debug_forcescore_dir = down)
		Change \{debug_forcescore = OFF}
		create_panel_message text = qs(0x7234ebca) Pos = <Pos> id = autoplay
	endif
	CrowdIncrease \{Player = 1}
endscript
g_double_click_time = 0

script UserSelectLeftAnalogUp 
	getfirstplayer
	calc_songscoreinfo Player = <Player>
	cutoff = ($star_rating_cutoffs [4])
	getplayerinfo <Player> base_score
	getplayerinfo <Player> max_notes
	getplayerinfo <Player> total_notes
	if ($debug_forcescore = OFF)
		setplayerinfo <Player> score = (<base_score> * <cutoff> + 1)
		setplayerinfo <Player> total_notes = <max_notes>
		setplayerinfo <Player> notes_hit = <total_notes>
	elseif ($debug_forcescore = poor)
		setplayerinfo <Player> score = (<base_score> / 2 + 1)
	elseif ($debug_forcescore = medium)
		setplayerinfo <Player> score = (<base_score> + 1)
	elseif ($debug_forcescore = good)
		setplayerinfo <Player> score = (<base_score> * <cutoff> + 1)
		setplayerinfo <Player> total_notes = <max_notes>
		setplayerinfo <Player> notes_hit = <total_notes>
	endif
	gamemode_gettype
	GetTrueElapsedTime starttime = ($g_double_click_time)
	GetTrueStartTime
	Change g_double_click_time = <starttime>
	if (<Type> = career && <ElapsedTime> <= 750)
		chapter_global = ($current_chapter)
		chapter_data = ($<chapter_global>)
		quest_progression_get_song_stars_for_domination chapter = <chapter_global>
		setplayerinfo <Player> projected_song_stars = <stars_req_per_song_float>
		getplayerinfo <Player> Band
		setbandinfo <Band> projected_song_stars = <stars_req_per_song_float>
		return
	else
		setplayerinfo <Player> projected_song_stars = ($g_debug_win_song_stars)
		getplayerinfo <Player> Band
		setbandinfo <Band> projected_song_stars = ($g_debug_win_song_stars)
	endif
	gamemode_gettype
	if (<Type> = practice)
		finish_practice_song
		return
	elseif (<Type> = career)
	endif
	<reset_scene> = 1
	if (<Type> = career)
		playlist_getcurrentsong
		if StructureContains structure = $g_rush_data <current_song>
			<reset_scene> = 0
		endif
	endif
	if (<reset_scene> = 1)
		scene_swap \{Name = main}
	endif
	broadcastevent \{Type = song_wonp1}
endscript

script UserSelectLeftAnalogDown 
	if NOT ScreenElementExists \{id = view_models_menu}
		set_select_text \{text = $modelviewer_text}
	else
		set_select_text \{text = $root_text}
	endif
	switch_to_obj_speed
	toggle_model_viewer
	if ScreenElementExists \{id = view_models_menu}
		set_viewer_speed
	endif
endscript

script UserSelectLeftAnalogLeft 
	if ScreenElementExists \{id = view_models_menu}
		set_player_to_model
	else
		SpawnScriptNow \{profile_camera_cuts}
	endif
endscript

script UserSelectLeftAnalogRight 
	if ScreenElementExists \{id = view_models_menu}
		ResetModelViewerCamera
	endif
endscript
viewer_rotation_angle = 0

script UserViewerX 
	SpawnScriptNow \{userviewerx_frame_step}
endscript

script userviewerx_frame_step 
	UnPauseGame
	Wait \{2
		gameframe}
	if CompositeObjectExists \{GUITARIST}
		GUITARIST :userviewerx_update_character
	endif
	if CompositeObjectExists \{BASSIST}
		BASSIST :userviewerx_update_character
	endif
	if CompositeObjectExists \{drummer}
		drummer :userviewerx_update_character
	endif
	if CompositeObjectExists \{vocalist}
		vocalist :userviewerx_update_character
	endif
	PauseGame
endscript

script userviewerx_update_character 
endscript

script UserViewerSquare 
	if (($cas_free_cam_active) = 1)
		if ($viewer_rotation_angle = 0)
			Change \{viewer_rotation_angle = 1}
			CenterCamera \{X = -10
				y = -90
				Scale = 0.7}
		else
			if ($viewer_rotation_angle = 1)
				CenterCamera \{X = -10
					y = -180
					Scale = 0.7}
				Change \{viewer_rotation_angle = 2}
			else
				if ($viewer_rotation_angle = 2)
					Change \{viewer_rotation_angle = 3}
					CenterCamera \{X = -10
						y = -270
						Scale = 0.7}
				else
					if ($viewer_rotation_angle = 3)
						Change \{viewer_rotation_angle = 0}
						CenterCamera \{X = -10
							y = 0
							Scale = 0.7}
					endif
				endif
			endif
		endif
	endif
endscript
Viewer_move_mode = 1
Obj_Viewer_move_mode = 0
Env_Viewer_move_mode = 2
viewer_speed = env
USER_VIEWER_TRIANGLE_TOD = 1

script UserViewerTriangle 
	if (($cas_free_cam_active) = 1)
		if ($viewer_rotation_angle = 0)
			Change \{viewer_rotation_angle = 1}
			CenterCamera \{Scale = 0.5
				y = -45}
		else
			if ($viewer_rotation_angle = 1)
				CenterCamera \{Scale = 0.5
					y = -135}
				Change \{viewer_rotation_angle = 2}
			else
				if ($viewer_rotation_angle = 2)
					Change \{viewer_rotation_angle = 3}
					CenterCamera \{Scale = 0.5
						y = -225}
				else
					if ($viewer_rotation_angle = 3)
						Change \{viewer_rotation_angle = 0}
						CenterCamera \{Scale = 0.5
							y = -315}
					endif
				endif
			endif
		endif
	endif
endscript

script switch_to_env_speed 
	Change Viewer_move_mode = ($Env_Viewer_move_mode)
	Change \{viewer_speed = env}
endscript

script switch_to_obj_speed 
	Change Viewer_move_mode = ($Obj_Viewer_move_mode)
	Change \{viewer_speed = Obj}
endscript

script set_viewer_speed 
	switch $Viewer_move_mode
		case 0
		SetMovementVelocity \{2.5}
		SetRotateVelocity \{50}
		create_panel_message \{id = viewermovemode
			text = qs(0x4028308f)
			Pos = (320.0, 84.0)
			rgba = [
				128
				0
				0
				255
			]}
		case 1
		SetMovementVelocity \{6}
		SetRotateVelocity \{80}
		create_panel_message \{id = viewermovemode
			text = qs(0xd1a924c7)
			Pos = (320.0, 84.0)
			rgba = [
				255
				128
				0
				255
			]}
		case 2
		SetMovementVelocity \{18}
		SetRotateVelocity \{120}
		create_panel_message \{id = viewermovemode
			text = qs(0x1bc03998)
			Pos = (320.0, 84.0)
			rgba = [
				200
				200
				0
				255
			]}
		case 3
		SetMovementVelocity \{43}
		SetRotateVelocity \{160}
		create_panel_message \{id = viewermovemode
			text = qs(0xe32ca150)
			Pos = (320.0, 84.0)
			rgba = [
				255
				255
				0
				255
			]}
		case 4
		SetMovementVelocity \{127}
		SetRotateVelocity \{200}
		create_panel_message \{id = viewermovemode
			text = qs(0xf94c0af9)
			Pos = (320.0, 84.0)
			rgba = [
				0
				255
				0
				255
			]}
	endswitch
	if ($viewer_speed = env)
		Change Env_Viewer_move_mode = ($Viewer_move_mode)
	else
		Change Obj_Viewer_move_mode = ($Viewer_move_mode)
	endif
endscript

script userviewerl1_anytime 
	printf \{'UserViewerL1_Anytime'}
	printf \{'++++++++++++++++++++++++++++++++++++++++++++++++++++++++'}
	printf \{'++++++++++++++++++++++++++++++++++++++++++++++++++++++++'}
	printf \{'++++++++++++++++++++++++++++++++++++++++++++++++++++++++'}
	dumpspawnedscriptstatus
	printf \{'++++++++++++++++++++++++++++++++++++++++++++++++++++++++'}
	printf \{'++++++++++++++++++++++++++++++++++++++++++++++++++++++++'}
	printf \{'++++++++++++++++++++++++++++++++++++++++++++++++++++++++'}
	ui_print_states
	printf \{'++++++++++++++++++++++++++++++++++++++++++++++++++++++++'}
	printf \{'++++++++++++++++++++++++++++++++++++++++++++++++++++++++'}
	printf \{'++++++++++++++++++++++++++++++++++++++++++++++++++++++++'}
	if GameIsPaused
		printf \{'game is paused'}
	else
		printf \{'game is unpaused'}
	endif
	if RenderingEnabled
		printf \{'rendering is enabled'}
	else
		printf \{'rendering is disabled'}
	endif
	printf \{'++++++++++++++++++++++++++++++++++++++++++++++++++++++++'}
	printf \{'++++++++++++++++++++++++++++++++++++++++++++++++++++++++'}
	printf \{'++++++++++++++++++++++++++++++++++++++++++++++++++++++++'}
endscript

script UserViewerL1 
	Change \{viewer_rotation_angle = 0}
	switch $Viewer_move_mode
		case 0
		Change \{Viewer_move_mode = 1}
		case 1
		Change \{Viewer_move_mode = 2}
		case 2
		Change \{Viewer_move_mode = 3}
		case 3
		Change \{Viewer_move_mode = 4}
		case 4
		Change \{Viewer_move_mode = 0}
	endswitch
	set_viewer_speed
endscript

script UserViewerL2 
	if userviewerinfe
		return
	endif
	Change \{viewer_rotation_angle = 0}
	switch $Viewer_move_mode
		case 0
		Change \{Viewer_move_mode = 4}
		case 1
		Change \{Viewer_move_mode = 0}
		case 2
		Change \{Viewer_move_mode = 1}
		case 3
		Change \{Viewer_move_mode = 2}
		case 4
		Change \{Viewer_move_mode = 3}
	endswitch
	set_viewer_speed
endscript

script userviewerinfe 
	if ($is_in_cas = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script show_wireframe_mode 
	switch wireframe_mode
		case 0
		wireframe_message \{text = qs(0xdfe67166)}
		case 1
		wireframe_message \{text = qs(0xd2c77ba0)}
		case 2
		wireframe_message \{text = qs(0x005bdf57)}
		case 3
		wireframe_message \{text = qs(0x996bfb67)}
		case 4
		wireframe_message \{text = qs(0x929d2efd)}
		case 5
		wireframe_message \{text = qs(0xd914aa8a)}
		case 6
		wireframe_message \{text = qs(0x52b5a4d5)}
	endswitch
endscript

script wireframe_message \{text = qs(0x3d6b48c8)}
	create_panel_message text = <text> id = wireframe_mess rgba = [200 128 128 128] Pos = (20.0, 340.0) just = [left center] Scale = 5 style = wireframe_style
endscript

script wireframe_style 
	legacydomorph \{time = 0
		Scale = (1.0, 1.0)}
	legacydomorph \{time = 3
		Scale = (1.0, 1.0)}
	legacydomorph \{time = 1
		alpha = 0}
	Die
endscript

script ViewerLeft 
	if (($cas_free_cam_active) = 0)
		viewer_cam :GetHFov
		hfov = (<hfov> + 1)
		if (<hfov> > 150)
			hfov = 150
		endif
		viewer_cam :SetHFOV hfov = <hfov>
		viewer_print_debug_info
	endif
endscript

script ViewerRight 
	if (($cas_free_cam_active) = 0)
		viewer_cam :GetHFov
		hfov = (<hfov> -1)
		if (<hfov> < 5)
			hfov = 5
		endif
		viewer_cam :SetHFOV hfov = <hfov>
		viewer_print_debug_info
	endif
endscript

script ViewerUp 
	printf \{qs(0xe6609ef6)}
endscript

script ViewerDown 
	printf \{qs(0xd7ab2617)}
endscript

script viewer_print_debug_info 
endscript
