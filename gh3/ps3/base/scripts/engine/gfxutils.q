ISOLATE_2D_RENDER = 0
pix_output = 0

script HiResScreenshot \{Scale = 1}
	if CutsceneFinished \{Name = cutscene}
		PauseGame
		GetCurrentCameraObject
	else
		PlayIGCCam \{Name = hires_cutscene_hack
			interrupt_current
			Play_hold}
		Wait \{1
			GameFrames}
		GetSkaterCamAnimParams \{Name = hires_cutscene_hack}
		<cameraid> = <cam_object_id>
	endif
	<cameraid> = <camID>
	PrintStruct <...>
	<I> = 0
	Wait \{30
		frames
		IgnoreSlomo}
	Printf \{"11111111111111111111111111111111111111"}
	begin
	<J> = 0
	begin
	Printf \{"222222222222222222222222222222222"}
	FormatText TextName = Text 'hi_res_screen_%a_%b_' A = <I> B = <J>
	Sub = ((<I> * <Scale>) + <J>)
	<cameraid> :SetSubFrustum res = <Scale> subImage = <Sub>
	Wait \{16
		Frame
		IgnoreSlomo}
	ScreenShot FileName = <Text>
	Wait \{16
		frames
		IgnoreSlomo}
	<J> = (<J> + 1)
	repeat <Scale>
	<I> = (<I> + 1)
	repeat <Scale>
	<cameraid> :SetSubFrustum res = 1 subImage = 0
	root_window :DoMorph \{Alpha = 1}
	if GotParam \{Do2D}
		if IsXENON
			Change \{ISOLATE_2D_RENDER = 1}
			Wait \{3
				frames}
			<I> = 0
			begin
			<J> = 0
			begin
			FormatText TextName = Text 'hi_res_screen_2d_%a_%b_' A = <I> B = <J>
			Sub = ((<I> * <Scale>) + <J>)
			<cameraid> :SetSubFrustum res = <Scale> subImage = <Sub>
			Wait \{16
				frames}
			ScreenShot FileName = <Text>
			Wait \{16
				frames}
			<J> = (<J> + 1)
			repeat <Scale>
			<I> = (<I> + 1)
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

script SpawnHiResScreenShot 
	SpawnScriptLater HiResScreenshot Params = <...>
endscript

script CubeMapScreenshots 
	Change \{Show_Zone_budget_Warnings = 0}
	Change \{no_render_metrics = 1}
	root_window :DoMorph \{Alpha = 0}
	if CompositeObjectExists \{Skater}
		Skater :Hide
	endif
	SetScreen \{Aspect = 1.0}
	lock_cam_cube_dir \{Dir = (1.0, 0.0, 0.0)}
	Wait \{16
		GameFrames}
	ScreenShot \{FileName = 'cubemap_screen_A'}
	Wait \{16
		GameFrames}
	lock_cam_cube_dir \{Dir = (-1.0, 0.0, 0.0)}
	Wait \{16
		GameFrames}
	ScreenShot \{FileName = 'cubemap_screen_B'}
	Wait \{16
		GameFrames}
	lock_cam_cube_dir \{Dir = (0.0, 1.0, 0.0)}
	Wait \{16
		GameFrames}
	ScreenShot \{FileName = 'cubemap_screen_C'}
	Wait \{16
		GameFrames}
	lock_cam_cube_dir \{Dir = (0.0, -1.0, 0.0)}
	Wait \{16
		GameFrames}
	ScreenShot \{FileName = 'cubemap_screen_D'}
	Wait \{16
		GameFrames}
	lock_cam_cube_dir \{Dir = (0.0, 0.0, 1.0)}
	Wait \{16
		GameFrames}
	ScreenShot \{FileName = 'cubemap_screen_F'}
	Wait \{16
		GameFrames}
	lock_cam_cube_dir \{Dir = (0.0, 0.0, -1.0)}
	Wait \{16
		GameFrames}
	ScreenShot \{FileName = 'cubemap_screen_E'}
	Wait \{16
		GameFrames}
	SetScreen \{Aspect = 1.3333334}
	root_window :DoMorph \{Alpha = 1}
	Skater :UnHide
	KillSkaterCamAnim \{All}
	Change \{Show_Zone_budget_Warnings = 1}
	Change \{no_render_metrics = 0}
endscript

script SpawnCubeMapScreenshots 
	SpawnScriptLater CubeMapScreenshots Params = <...>
endscript

script lock_cam_top_down 
	KillSkaterCamAnim \{All}
	GetCurrentCameraObject
	<camID> :Obj_GetPosition
	<camID> :GetHFOV
	PlayIGCCam {
		Facing = (0.0, -1.0, 0.0)
		Pos = <Pos>
		FOV = <hFOV>
		Play_hold
	}
endscript

script lock_cam_cube_dir \{Dir = (1.0, 0.0, 0.0)}
	KillSkaterCamAnim \{All}
	GetCurrentCameraObject
	<camID> :Obj_GetPosition
	<camID> :GetHFOV
	PlayIGCCam {
		Facing = <Dir>
		Pos = <Pos>
		FOV = 90.0
		Play_hold
	}
endscript
