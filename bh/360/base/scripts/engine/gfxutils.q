ISOLATE_2D_RENDER = 0
pix_output = 0

script HiResScreenshot \{scale = 1}
	PauseGame
	GetCurrentCameraObject
	<cameraid> = <camid>
	printstruct <...>
	<i> = 0
	wait \{30
		frames
		ignoreslomo}
	printf \{qs(0xeb008437)}
	begin
	<j> = 0
	begin
	printf \{qs(0x9f298246)}
	FormatText TextName = text 'hi_res_screen_%a_%b_' a = <i> b = <j>
	sub = ((<i> * <scale>) + <j>)
	<cameraid> :SetSubFrustum res = <scale> subImage = <sub>
	wait \{16
		frame
		ignoreslomo}
	ScreenShot FileName = <text>
	wait \{16
		frames
		ignoreslomo}
	<j> = (<j> + 1)
	repeat <scale>
	<i> = (<i> + 1)
	repeat <scale>
	<cameraid> :SetSubFrustum res = 1 subImage = 0
	root_window :SE_SetProps \{alpha = 1}
	if GotParam \{Do2D}
		if isXenon
			Change \{ISOLATE_2D_RENDER = 1}
			wait \{3
				frames}
			<i> = 0
			begin
			<j> = 0
			begin
			FormatText TextName = text 'hi_res_screen_2d_%a_%b_' a = <i> b = <j>
			sub = ((<i> * <scale>) + <j>)
			<cameraid> :SetSubFrustum res = <scale> subImage = <sub>
			wait \{16
				frames}
			ScreenShot FileName = <text>
			wait \{16
				frames}
			<j> = (<j> + 1)
			repeat <scale>
			<i> = (<i> + 1)
			repeat <scale>
			<cameraid> :SetSubFrustum res = 1 subImage = 0
			Change \{ISOLATE_2D_RENDER = 0}
		endif
	endif
	if CutsceneFinished \{name = cutscene}
		UnpauseGame
	else
		KillSkaterCamAnim \{name = hires_cutscene_hack}
	endif
endscript

script SpawnHiResScreenshot 
	spawnscriptlater HiResScreenshot params = <...>
endscript
g_cur_screenshot_call = 0

script CubeMapScreenshots 
	if ViewportExists \{id = bg_viewport}
		destroy_cameracuts
		hide_crowd_models \{active = true}
	endif
	SetEnableMovies \{1}
	SetViewMode \{2}
	Change \{Show_Zone_budget_Warnings = 0}
	Change \{no_render_metrics = 1}
	root_window :SE_SetProps \{alpha = 0}
	if CompositeObjectExists \{skater}
		skater :hide
	endif
	if CompositeObjectExists \{player0_body}
		player0_body :hide
	endif
	if (($g_cur_screenshot_call) > 9)
		FormatText TextName = screenNameA 'cubemap_screen_%iA' i = ($g_cur_screenshot_call)
		FormatText TextName = screenNameB 'cubemap_screen_%iB' i = ($g_cur_screenshot_call)
		FormatText TextName = screenNameC 'cubemap_screen_%iC' i = ($g_cur_screenshot_call)
		FormatText TextName = screenNameD 'cubemap_screen_%iD' i = ($g_cur_screenshot_call)
		FormatText TextName = screenNameE 'cubemap_screen_%iE' i = ($g_cur_screenshot_call)
		FormatText TextName = screenNameF 'cubemap_screen_%iF' i = ($g_cur_screenshot_call)
	else
		FormatText TextName = screenNameA 'cubemap_screen_0%iA' i = ($g_cur_screenshot_call)
		FormatText TextName = screenNameB 'cubemap_screen_0%iB' i = ($g_cur_screenshot_call)
		FormatText TextName = screenNameC 'cubemap_screen_0%iC' i = ($g_cur_screenshot_call)
		FormatText TextName = screenNameD 'cubemap_screen_0%iD' i = ($g_cur_screenshot_call)
		FormatText TextName = screenNameE 'cubemap_screen_0%iE' i = ($g_cur_screenshot_call)
		FormatText TextName = screenNameF 'cubemap_screen_0%iF' i = ($g_cur_screenshot_call)
	endif
	printstruct <...>
	SetScreen \{Aspect = 1.0
		angle = 90.0}
	lock_cam_cube_dir \{Dir = (1.0, 0.0, 0.0)}
	wait \{16
		gameframes}
	ScreenShot FileName = <screenNameA>
	wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (-1.0, 0.0, 0.0)}
	wait \{16
		gameframes}
	ScreenShot FileName = <screenNameB>
	wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (0.0, 1.0, 0.0)}
	wait \{16
		gameframes}
	ScreenShot FileName = <screenNameC>
	wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (0.0, -1.0, 0.0)}
	wait \{16
		gameframes}
	ScreenShot FileName = <screenNameD>
	wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (0.0, 0.0, 1.0)}
	wait \{16
		gameframes}
	ScreenShot FileName = <screenNameE>
	wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (0.0, 0.0, -1.0)}
	wait \{16
		gameframes}
	ScreenShot FileName = <screenNameF>
	wait \{16
		gameframes}
	SetScreen \{Aspect = 1.3333334
		angle = $widescreen_camera_fov}
	Change g_cur_screenshot_call = ($g_cur_screenshot_call + 1)
	root_window :SE_SetProps \{alpha = 1}
	if CompositeObjectExists \{skater}
		skater :unhide
	endif
	if CompositeObjectExists \{player0_body}
		player0_body :unhide
	endif
	Change \{Show_Zone_budget_Warnings = 1}
	Change \{no_render_metrics = 0}
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
	spawnscriptlater CubeMapScreenshots params = <...>
endscript

script lock_cam_top_down 
	KillSkaterCamAnim \{all}
	GetCurrentCameraObject
	<camid> :Obj_GetPosition
	<camid> :GetHFov
	PlayIGCCam {
		facing = (0.0, -1.0, 0.0)
		Pos = <Pos>
		FOV = <hfov>
		Play_hold
	}
endscript

script lock_cam_cube_dir \{Dir = (1.0, 0.0, 0.0)}
	GetCurrentCameraObject
	<camid> :Obj_GetPosition
	<camid> :GetHFov
	if ViewportExists \{id = bg_viewport}
		SetViewportCameraOrient viewport = bg_viewport at = ((0.0, 0.0, 0.0) - <Dir>)
	else
		SetViewportCameraOrient viewport = 0 at = ((0.0, 0.0, 0.0) - <Dir>)
	endif
endscript
