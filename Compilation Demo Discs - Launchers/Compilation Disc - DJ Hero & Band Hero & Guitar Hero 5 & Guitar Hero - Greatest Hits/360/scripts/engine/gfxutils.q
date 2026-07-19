ISOLATE_2D_RENDER = 0
pix_output = 0

script HiResScreenshot \{scale = 1}
	if CutsceneFinished \{name = cutscene}
		PauseGame
		GetCurrentCameraObject
	else
		PlayIGCCam \{name = hires_cutscene_hack
			interrupt_current
			Play_hold}
		Wait \{1
			gameframes}
		GetSkaterCamAnimParams \{name = hires_cutscene_hack}
		<cameraid> = <cam_object_id>
	endif
	<cameraid> = <camid>
	printstruct <...>
	<i> = 0
	Wait \{30
		frames
		ignoreslomo}
	printf \{qs("\L11111111111111111111111111111111111111")}
	begin
	<j> = 0
	begin
	printf \{qs("\L222222222222222222222222222222222")}
	FormatText TextName = text 'hi_res_screen_%a_%b_' a = <i> b = <j>
	sub = ((<i> * <scale>) + <j>)
	<cameraid> :SetSubFrustum res = <scale> subImage = <sub>
	Wait \{16
		frame
		ignoreslomo}
	ScreenShot filename = <text>
	Wait \{16
		frames
		ignoreslomo}
	<j> = (<j> + 1)
	repeat <scale>
	<i> = (<i> + 1)
	repeat <scale>
	<cameraid> :SetSubFrustum res = 1 subImage = 0
	root_window :LegacyDoMorph \{alpha = 1}
	if GotParam \{Do2D}
		if isXenon
			change \{ISOLATE_2D_RENDER = 1}
			Wait \{3
				frames}
			<i> = 0
			begin
			<j> = 0
			begin
			FormatText TextName = text 'hi_res_screen_2d_%a_%b_' a = <i> b = <j>
			sub = ((<i> * <scale>) + <j>)
			<cameraid> :SetSubFrustum res = <scale> subImage = <sub>
			Wait \{16
				frames}
			ScreenShot filename = <text>
			Wait \{16
				frames}
			<j> = (<j> + 1)
			repeat <scale>
			<i> = (<i> + 1)
			repeat <scale>
			<cameraid> :SetSubFrustum res = 1 subImage = 0
			change \{ISOLATE_2D_RENDER = 0}
		endif
	endif
	if CutsceneFinished \{name = cutscene}
		UnPauseGame
	else
		KillSkaterCamAnim \{name = hires_cutscene_hack}
	endif
	BroadcastEvent \{type = hires_screenshot_finished}
endscript

script SpawnHiResScreenShot 
	SpawnScriptLater HiResScreenshot params = <...>
endscript

script CubeMapScreenshots 
	if ViewportExists \{id = bg_viewport}
		destroy_cameracuts
		hide_crowd_models \{active = true}
	endif
	SetEnableMovies \{1}
	SetViewMode \{2}
	change \{Show_Zone_budget_Warnings = 0}
	change \{no_render_metrics = 1}
	root_window :LegacyDoMorph \{alpha = 0}
	if CompositeObjectExists \{skater}
		skater :hide
	endif
	if CompositeObjectExists \{player0_body}
		player0_body :hide
	endif
	SetScreen \{Aspect = 1.0
		Angle = 90.0}
	lock_cam_cube_dir \{dir = (1.0, 0.0, 0.0)}
	Wait \{16
		gameframes}
	ScreenShot \{filename = 'cubemap_screen_A'}
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{dir = (-1.0, 0.0, 0.0)}
	Wait \{16
		gameframes}
	ScreenShot \{filename = 'cubemap_screen_B'}
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{dir = (0.0, 1.0, 0.0)}
	Wait \{16
		gameframes}
	ScreenShot \{filename = 'cubemap_screen_C'}
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{dir = (0.0, -1.0, 0.0)}
	Wait \{16
		gameframes}
	ScreenShot \{filename = 'cubemap_screen_D'}
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{dir = (0.0, 0.0, 1.0)}
	Wait \{16
		gameframes}
	ScreenShot \{filename = 'cubemap_screen_F'}
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{dir = (0.0, 0.0, -1.0)}
	Wait \{16
		gameframes}
	ScreenShot \{filename = 'cubemap_screen_E'}
	Wait \{16
		gameframes}
	SetScreen \{Aspect = 1.3333334
		Angle = $widescreen_camera_fov}
	root_window :LegacyDoMorph \{alpha = 1}
	if CompositeObjectExists \{skater}
		skater :unhide
	endif
	if CompositeObjectExists \{player0_body}
		player0_body :unhide
	endif
	change \{Show_Zone_budget_Warnings = 1}
	change \{no_render_metrics = 0}
	if ViewportExists \{id = bg_viewport}
		hide_crowd_models \{active = false}
		create_cameracuts
	endif
	SetViewMode \{0}
	SetEnableMovies \{0}
	ToggleViewMode
	ToggleViewMode
endscript

script SpawnCubeMapScreenshots 
	SpawnScriptLater CubeMapScreenshots params = <...>
endscript

script lock_cam_top_down 
	KillSkaterCamAnim \{all}
	GetCurrentCameraObject
	<camid> :Obj_GetPosition
	<camid> :GetHFov
	PlayIGCCam {
		facing = (0.0, -1.0, 0.0)
		pos = <pos>
		FOV = <hfov>
		Play_hold
	}
endscript

script lock_cam_cube_dir \{dir = (1.0, 0.0, 0.0)}
	GetCurrentCameraObject
	<camid> :Obj_GetPosition
	<camid> :GetHFov
	if ViewportExists \{id = bg_viewport}
		SetViewportCameraOrient viewport = bg_viewport at = ((0.0, 0.0, 0.0) - <dir>)
	else
		SetViewportCameraOrient viewport = 0 at = ((0.0, 0.0, 0.0) - <dir>)
	endif
endscript
