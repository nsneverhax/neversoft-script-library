ISOLATE_2D_RENDER = 0
pix_output = 0

script HiResScreenshot \{Scale = 1}
	PauseGame
	setslomo \{visualeffects = 0.0}
	GetCurrentCameraObject
	<cameraid> = <camid>
	printstruct <...>
	<i> = 0
	Wait \{30
		frames
		ignoreslomo}
	printf \{qs(0xeb008437)}
	begin
	<j> = 0
	begin
	printf \{qs(0x9f298246)}
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
	root_window :se_setprops \{alpha = 1}
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
	setslomo \{visualeffects = 1.0}
	if CutsceneFinished \{Name = cutscene}
		UnPauseGame
	else
		KillSkaterCamAnim \{Name = hires_cutscene_hack}
	endif
endscript

script SpawnHiResScreenshot 
	SpawnScriptLater HiResScreenshot params = <...>
endscript
g_cur_screenshot_call = 0

script CubeMapScreenshots 
	if ViewportExists \{id = bg_viewport}
		destroy_cameracuts
		hide_crowd_models \{Active = true}
	endif
	SetEnableMovies \{1}
	SetViewMode \{2}
	Change \{Show_Zone_budget_Warnings = 0}
	Change \{no_render_metrics = 1}
	root_window :se_setprops \{alpha = 0}
	if CompositeObjectExists \{skater}
		skater :Hide
	endif
	if CompositeObjectExists \{player0_body}
		player0_body :Hide
	endif
	if (($g_cur_screenshot_call) > 9)
		formatText TextName = screennamea 'cubemap_screen_%iA' i = ($g_cur_screenshot_call)
		formatText TextName = screennameb 'cubemap_screen_%iB' i = ($g_cur_screenshot_call)
		formatText TextName = screennamec 'cubemap_screen_%iC' i = ($g_cur_screenshot_call)
		formatText TextName = screennamed 'cubemap_screen_%iD' i = ($g_cur_screenshot_call)
		formatText TextName = screennamee 'cubemap_screen_%iE' i = ($g_cur_screenshot_call)
		formatText TextName = screennamef 'cubemap_screen_%iF' i = ($g_cur_screenshot_call)
	else
		formatText TextName = screennamea 'cubemap_screen_0%iA' i = ($g_cur_screenshot_call)
		formatText TextName = screennameb 'cubemap_screen_0%iB' i = ($g_cur_screenshot_call)
		formatText TextName = screennamec 'cubemap_screen_0%iC' i = ($g_cur_screenshot_call)
		formatText TextName = screennamed 'cubemap_screen_0%iD' i = ($g_cur_screenshot_call)
		formatText TextName = screennamee 'cubemap_screen_0%iE' i = ($g_cur_screenshot_call)
		formatText TextName = screennamef 'cubemap_screen_0%iF' i = ($g_cur_screenshot_call)
	endif
	printstruct <...>
	SetScreen \{Aspect = 1.0
		angle = 90.0}
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (1.0, 0.0, 0.0)}
	Wait \{16
		gameframes}
	ScreenShot FileName = <screennamea>
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (-1.0, 0.0, 0.0)}
	Wait \{16
		gameframes}
	ScreenShot FileName = <screennameb>
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (0.0, -1.0, 0.0)
		left = (-1.0, 0.0, 0.0)
		up = (0.0, 0.0, -1.0)}
	Wait \{16
		gameframes}
	ScreenShot FileName = <screennamec>
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (0.0, 1.0, 0.0)}
	Wait \{16
		gameframes}
	ScreenShot FileName = <screennamed>
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (0.0, 0.0, -1.0)}
	Wait \{16
		gameframes}
	ScreenShot FileName = <screennamee>
	Wait \{16
		gameframes}
	lock_cam_cube_dir \{Dir = (0.0, 0.0, 1.0)}
	Wait \{16
		gameframes}
	ScreenShot FileName = <screennamef>
	Wait \{16
		gameframes}
	SetScreen \{Aspect = 1.3333334
		angle = $widescreen_camera_fov}
	Change g_cur_screenshot_call = ($g_cur_screenshot_call + 1)
	root_window :se_setprops \{alpha = 1}
	if CompositeObjectExists \{skater}
		skater :unhide
	endif
	if CompositeObjectExists \{player0_body}
		player0_body :unhide
	endif
	Change \{Show_Zone_budget_Warnings = 1}
	Change \{no_render_metrics = 0}
	if ViewportExists \{id = bg_viewport}
		hide_crowd_models \{Active = FALSE}
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
		Pos = <Pos>
		FOV = <hfov>
		play_hold
	}
endscript

script lock_cam_cube_dir \{Dir = (1.0, 0.0, 0.0)}
	GetCurrentCameraObject
	<camid> :Obj_GetPosition
	<camid> :GetHFov
	if ViewportExists \{id = bg_viewport}
		SetViewportCameraOrient viewport = bg_viewport at = <Dir> <...>
	else
		SetViewportCameraOrient viewport = 0 at = <Dir> <...>
	endif
endscript
gp_explosion_energy01_sparks02 = {
	Pos = (4.10814, 0.0, 8.215465)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	EmitRangeDims = (0.5, 0.5, 0.5)
	DoCircularEmit
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.0, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	AngleSpread = 360.0
	LifeRange = (0.1, 0.3)
	Emit_Rate = 100.0
	Max = 0
	TimeSeed = 0.1
	LifeTime = 0.0
	EmitNum = 8
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(2.0, 2.0)
		(3.0, 3.0)
	]
	SpeedRange = (10.0, 12.0)
	RotVel = (-0.2, 0.2)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 0.0
	History = 2
	HistoryListCoordinateSpace = World
	Color = -7996417
	LOD_Default
	QuickMaterial = {
		TextureLayout = layout1x2
		DiffuseTextureEnabled
		DiffuseTexture = jow_splatter01
		SpecularPower = 0
		AlphaCutoff = 1
		BlendMode = add
		QuadAnimationFPS = 0
	}
	Knot = [
		(-1.722729, 0.0, -0.0)
		(-1.722729, 0.0, -0.0)
		(-1.16097, 0.0, -0.0)
		(-1.089128, 0.0, -0.0)
		(-0.52737, 0.0, -0.0)
		(0.071839005, 0.0, -0.0)
		(1.1609659, 0.0, -0.0)
		(1.760176, 0.0, -0.0)
		(1.760176, 0.0, -0.0)
	]
	ParticleColor = [
		-1
		-1
		-1
		-1
		-256
		-256
	]
	VertexWeight = [
		0.343208
		1.0
	]
}
gp_pwr_earth_long_projectile_out_explosion02 = {
	Pos = (4.9795074, 0.0, 9.2645035)
	Angles = (0.0, 0.0, 0.0)
	Class = ParticleObject
	ParticleType = FlexParticle
	Type = flat
	Active
	CreatedAtStart
	Attach
	EmitRangeDims = (3.0, 0.0, 3.0)
	DoCircularEmit
	Emit_Target = (0.0, 1.0, 0.0)
	EmitAngle = (0.0, 0.0, 0.0)
	Force = (0.0, 0.5, 0.0)
	WindCoeff = 0.0
	LocalWindCoeff = 0.0
	EmitterVelocityWeight = 0.0
	Radiate
	ElevSpread = (110.0, 140.0)
	SweepSpread = (0.0, 360.0)
	LifeRange = (0.6, 1.0)
	Emit_Rate = 0.0
	Max = 0
	TimeSeed = 0.0
	LifeTime = 0.0
	EmitNum = 32
	FollowEmitter = 0.0
	EmitFunction = constant
	EmitPeriod = 1.0
	SizeRange = [
		(2.0, 2.0)
		(4.0, 4.0)
	]
	SpeedRange = (1.0, 1.5)
	RotVel = (-0.2, 0.2)
	RotVelTimeScale = 1.0
	EmitDelayStart = 0.0
	PathFollowTime = 2.0
	History = 20
	HistoryListCoordinateSpace = World
	Color = -1891753436
	LOD_Default
	QuickMaterial = {
		DiffuseTextureEnabled
		DiffuseTexture = jow_explosion01
		SpecularPower = 0
		AlphaCutoff = 12
		BlendMode = add
		SortGroup = 3
		DrawOrder = 12.0
		QuadAnimationFPS = 0
	}
	Knot = [
		(-1.722729, 0.0, -0.0)
		(-1.722729, 0.0, -0.0)
		(-1.16097, 0.0, -0.0)
		(-0.886428, 0.0, -0.0)
		(-0.32467005, 0.0, -0.0)
		(0.27454, 0.0, -0.0)
		(1.1609659, 0.0, -0.0)
		(1.760176, 0.0, -0.0)
		(1.760176, 0.0, -0.0)
	]
	ParticleColor = [
		-1044266497
		-303174145
		-1212696577
		-1
		-1027423744
		-256
	]
	VertexWeight = [
		0.401406
		1.0
	]
}
