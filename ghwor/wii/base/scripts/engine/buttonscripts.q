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
ard_text = qs(0xb4520bf6)
all_text = qs(0x56ec18ea)
alr_text = qs(0xebf66988)
alu_text = qs(0x1a0d9384)
ald_text = qs(0x6bbf81bd)
root_text = {
	arl_text = qs(0xfa6448fa)
	arr_text = qs(0x1994c5f0)
	aru_text = qs(0xe2af40e0)
	ard_text = qs(0xb4520bf6)
	all_text = qs(0x56ec18ea)
	alr_text = qs(0xebf66988)
	alu_text = qs(0x1a0d9384)
	ald_text = qs(0x6bbf81bd)
}
modelviewer_text = {
	arl_text = qs(0xfa6448fa)
	arr_text = qs(0xe1145bb2)
	aru_text = qs(0xe2af40e0)
	ard_text = qs(0xb4520bf6)
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
	ScriptAssert \{'UserSelectSelect: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script UserSelectSelect2 
	ScriptAssert \{'UserSelectSelect2: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
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
	Dumpheaps
endscript

script UserSelectStart 
	if NotCD
		Change \{render_mode = 0}
		setRenderMode \{mode = $render_mode}
		TogglePass \{pass = 0}
	endif
endscript

script refresh_fps_text 
	if NOT ScreenElementExists \{id = wii_fps_anchor}
		if NOT ($fps_hidden = 1)
			show_fps_wii
		endif
	endif
	if ScreenElementExists \{id = fpstext}
		formatText \{TextName = fps
			qs(0x48c6d14c)
			d = $framerate_value}
		SetScreenElementProps id = fpstext text = <fps>
	endif
	if ScreenElementExists \{id = gpu_total_id}
		formatText \{TextName = gpu_total
			qs(0x48c6d14c)
			d = $gpu_total}
		SetScreenElementProps id = gpu_total_id text = <gpu_total>
	endif
endscript
fps_hidden = 0

script show_fps_wii 
	if NOT ScreenElementExists \{id = wii_fps_anchor}
		SetScreenElementLock \{id = root_window
			OFF}
		CreateScreenElement \{id = wii_fps_anchor
			Type = ContainerElement
			parent = root_window
			Pos = (128.0, 0.0)
			z_priority = 6000}
		printf \{qs(0x9ee4a9ad)}
		CreateScreenElement \{id = viewer_options_bg
			Type = SpriteElement
			parent = wii_fps_anchor
			dims = (93.0, 74.0)
			Pos = (35.0, 55.0)
			just = [
				left
				left
			]
			rgba = [
				0
				0
				0
				128
			]
			alpha = 1
			z_priority = 6000}
		CreateScreenElement \{id = fpstext
			Type = TextElement
			parent = wii_fps_anchor
			font = text_a1
			text = $framerate_value
			Pos = (40.0, 60.0)
			Scale = 0.5
			just = [
				left
				left
			]
			rgba = [
				255
				255
				255
				255
			]
			z_priority = 6001}
		CreateScreenElement \{id = gpu_total_id
			Type = TextElement
			parent = wii_fps_anchor
			font = text_a1
			text = $gpu_total
			Pos = (40.0, 90.0)
			Scale = 0.5
			just = [
				left
				left
			]
			rgba = [
				255
				255
				255
				255
			]
			z_priority = 6001}
		SetScreenElementLock \{id = root_window
			On}
	endif
endscript

script hide_fps_wii 
	if ScreenElementExists \{id = wii_fps_anchor}
		DestroyScreenElement \{id = wii_fps_anchor}
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
	if ($profiling_gpu = true)
		return
	endif
	if ($debug_show_analog_options = 0)
		return
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
		if ($g_viewerlockedtocamera = 1)
			viewertogglelocktocamera
		endif
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
		enable_bg_viewport
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
			SetViewportCameraOrient viewport = bg_viewport at = <at> left = <left> up = <up>
			SetViewportCameraPos viewport = bg_viewport Pos = <Pos>
		endif
	endif
	if ($view_mode = 2)
		ToggleViewMode \{no_reload}
	endif
endscript
g_viewerlockedtocamera = 0

script viewertogglelocktocamera 
	if ($g_viewerlockedtocamera = 0)
		Change \{g_viewerlockedtocamera = 1}
		viewer_cam :SetHFOV hfov = ($camera_fov)
		SetEnableMovies \{1}
		enable_bg_viewport_properties
	else
		SetEnableMovies \{0}
		Change \{g_viewerlockedtocamera = 0}
		switch_to_obj_speed
		set_viewer_speed
		unpausespawnedscript \{update_crowd_model_cam}
		disable_bg_viewport
		enable_crowd_models_cfunc \{Active = true}
	endif
endscript
NEWSCREENSHOTMODE = 0

script UserSelectX 
	if IsGuitarController \{controller = 0}
		UserSelectLeftAnalogUp
		return
	endif
	if IsTrue \{$soft_assert_active}
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
	ToggleMetrics
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
endscript
Viewer_move_mode = 1
Obj_Viewer_move_mode = 0
Env_Viewer_move_mode = 2
viewer_speed = env
USER_VIEWER_TRIANGLE_TOD = 1

script UserViewerTriangle 
	viewertogglelocktocamera
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

script UserViewerL1 
	if userviewerinfe
		return
	endif
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
		GetCurrentCameraObject
		<camid> :GetHFov
		hfov = (<hfov> + 1)
		if (<hfov> > 150)
			hfov = 150
		endif
		<camid> :SetHFOV hfov = <hfov>
		viewer_print_debug_info
	endif
endscript

script ViewerRight 
	if (($cas_free_cam_active) = 0)
		GetCurrentCameraObject
		<camid> :GetHFov
		hfov = (<hfov> -1)
		if (<hfov> < 5)
			hfov = 5
		endif
		<camid> :SetHFOV hfov = <hfov>
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
	GetCurrentCameraObject
	<camid> :GetHFov
	printstruct <...>
endscript
