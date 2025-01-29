ISOLATE_2D_RENDER = 0
pix_output = 0

script HiResScreenshot \{Scale = 1}
	if CutsceneFinished \{Name = cutscene}
		PauseGame
		GetCurrentCameraObject
	else
		PlayIGCCam \{Name = hires_cutscene_hack
			interrupt_current
			play_hold}
		WaitOneGameFrame
		GetSkaterCamAnimParams \{Name = hires_cutscene_hack}
		<cameraid> = <cam_object_id>
	endif
	<cameraid> = <camid>
	printstruct <...>
	<i> = 0
	Wait \{30
		frames
		ignoreslomo}
	printf \{'11111111111111111111111111111111111111'}
	begin
	<j> = 0
	begin
	printf \{'222222222222222222222222222222222'}
	formatText TextName = text 'hi_res_screen_%a_%b_' a = <i> b = <j>
	sub = ((<i> * <Scale>) + <j>)
	<cameraid> :SetSubFrustum res = <Scale> subImage = <sub>
	Wait \{16
		Frame
		ignoreslomo}
	ScreenShot FileName = <text>
	Wait \{16
		frames
		ignoreslomo}
	<j> = (<j> + 1)
	repeat <Scale>
	<i> = (<i> + 1)
	repeat <Scale>
	<cameraid> :SetSubFrustum res = 1 subImage = 0
	root_window :DoMorph \{alpha = 1}
	if GotParam \{Do2D}
		if isXenon
			Change \{ISOLATE_2D_RENDER = 1}
			Wait \{3
				frames}
			<i> = 0
			begin
			<j> = 0
			begin
			formatText TextName = text 'hi_res_screen_2d_%a_%b_' a = <i> b = <j>
			sub = ((<i> * <Scale>) + <j>)
			<cameraid> :SetSubFrustum res = <Scale> subImage = <sub>
			Wait \{16
				frames}
			ScreenShot FileName = <text>
			Wait \{16
				frames}
			<j> = (<j> + 1)
			repeat <Scale>
			<i> = (<i> + 1)
			repeat <Scale>
			<cameraid> :SetSubFrustum res = 1 subImage = 0
			Change \{ISOLATE_2D_RENDER = 0}
		endif
	endif
	if CutsceneFinished \{Name = cutscene}
		UnPauseGame
	else
		KillSkaterCamAnim \{Name = hires_cutscene_hack}
	endif
endscript

script SpawnHiResScreenshot 
	SpawnScriptLater HiResScreenshot params = <...>
endscript

script CubeMapScreenshots 
	Change \{Show_Zone_budget_Warnings = 0}
	Change \{no_render_metrics = 1}
	root_window :DoMorph \{alpha = 0}
	if CompositeObjectExists \{skater}
		skater :Hide
	endif
	SetScreen \{Aspect = 1.0}
	lock_cam_cube_dir \{Dir = (1.0, 0.0, 0.0)}
	Wait \{16
		gameframes}
	ScreenShot \{FileName = 'cubemap_screen_A'}
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (-1.0, 0.0, 0.0)}
	Wait \{16
		gameframes}
	ScreenShot \{FileName = 'cubemap_screen_B'}
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (0.0, 1.0, 0.0)}
	Wait \{16
		gameframes}
	ScreenShot \{FileName = 'cubemap_screen_C'}
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (0.0, -1.0, 0.0)}
	Wait \{16
		gameframes}
	ScreenShot \{FileName = 'cubemap_screen_D'}
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (0.0, 0.0, 1.0)}
	Wait \{16
		gameframes}
	ScreenShot \{FileName = 'cubemap_screen_F'}
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (0.0, 0.0, -1.0)}
	Wait \{16
		gameframes}
	ScreenShot \{FileName = 'cubemap_screen_E'}
	Wait \{16
		gameframes}
	SetScreen \{Aspect = 1.3333334}
	root_window :DoMorph \{alpha = 1}
	skater :unhide
	KillSkaterCamAnim \{all}
	Change \{Show_Zone_budget_Warnings = 1}
	Change \{no_render_metrics = 0}
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
		Pos = <Pos>
		FOV = <hfov>
		play_hold
	}
endscript

script lock_cam_cube_dir \{Dir = (1.0, 0.0, 0.0)}
	KillSkaterCamAnim \{all}
	GetCurrentCameraObject
	<camid> :Obj_GetPosition
	<camid> :GetHFov
	PlayIGCCam {
		facing = <Dir>
		Pos = <Pos>
		FOV = 90.0
		play_hold
	}
endscript
