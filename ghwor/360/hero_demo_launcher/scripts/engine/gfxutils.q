isolate_2d_render = 0
pix_output = 0

script hiresscreenshot \{scale = 1}
	if cutscenefinished \{name = cutscene}
		pausegame
		getcurrentcameraobject
	else
		playigccam \{name = hires_cutscene_hack
			interrupt_current
			play_hold}
		wait \{1
			gameframes}
		getskatercamanimparams \{name = hires_cutscene_hack}
		<cameraid> = <cam_object_id>
	endif
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
	formattext textname = text 'hi_res_screen_%a_%b_' a = <i> b = <j>
	sub = ((<i> * <scale>) + <j>)
	<cameraid> :setsubfrustum res = <scale> subimage = <sub>
	wait \{16
		frame
		ignoreslomo}
	screenshot filename = <text>
	wait \{16
		frames
		ignoreslomo}
	<j> = (<j> + 1)
	repeat <scale>
	<i> = (<i> + 1)
	repeat <scale>
	<cameraid> :setsubfrustum res = 1 subimage = 0
	root_window :legacydomorph \{alpha = 1}
	if gotparam \{do2d}
		if isxenon
			change \{isolate_2d_render = 1}
			wait \{3
				frames}
			<i> = 0
			begin
			<j> = 0
			begin
			formattext textname = text 'hi_res_screen_2d_%a_%b_' a = <i> b = <j>
			sub = ((<i> * <scale>) + <j>)
			<cameraid> :setsubfrustum res = <scale> subimage = <sub>
			wait \{16
				frames}
			screenshot filename = <text>
			wait \{16
				frames}
			<j> = (<j> + 1)
			repeat <scale>
			<i> = (<i> + 1)
			repeat <scale>
			<cameraid> :setsubfrustum res = 1 subimage = 0
			change \{isolate_2d_render = 0}
		endif
	endif
	if cutscenefinished \{name = cutscene}
		unpausegame
	else
		killskatercamanim \{name = hires_cutscene_hack}
	endif
	broadcastevent \{type = hires_screenshot_finished}
endscript

script spawnhiresscreenshot 
	spawnscriptlater hiresscreenshot params = <...>
endscript

script cubemapscreenshots 
	if viewportexists \{id = bg_viewport}
		destroy_cameracuts
		hide_crowd_models \{active = true}
	endif
	setenablemovies \{1}
	setviewmode \{2}
	change \{show_zone_budget_warnings = 0}
	change \{no_render_metrics = 1}
	root_window :legacydomorph \{alpha = 0}
	if compositeobjectexists \{skater}
		skater :hide
	endif
	if compositeobjectexists \{player0_body}
		player0_body :hide
	endif
	setscreen \{aspect = 1.0
		angle = 90.0}
	lock_cam_cube_dir \{dir = (1.0, 0.0, 0.0)}
	wait \{16
		gameframes}
	screenshot \{filename = 'cubemap_screen_A'}
	wait \{16
		gameframes}
	lock_cam_cube_dir \{dir = (-1.0, 0.0, 0.0)}
	wait \{16
		gameframes}
	screenshot \{filename = 'cubemap_screen_B'}
	wait \{16
		gameframes}
	lock_cam_cube_dir \{dir = (0.0, 1.0, 0.0)}
	wait \{16
		gameframes}
	screenshot \{filename = 'cubemap_screen_C'}
	wait \{16
		gameframes}
	lock_cam_cube_dir \{dir = (0.0, -1.0, 0.0)}
	wait \{16
		gameframes}
	screenshot \{filename = 'cubemap_screen_D'}
	wait \{16
		gameframes}
	lock_cam_cube_dir \{dir = (0.0, 0.0, 1.0)}
	wait \{16
		gameframes}
	screenshot \{filename = 'cubemap_screen_F'}
	wait \{16
		gameframes}
	lock_cam_cube_dir \{dir = (0.0, 0.0, -1.0)}
	wait \{16
		gameframes}
	screenshot \{filename = 'cubemap_screen_E'}
	wait \{16
		gameframes}
	setscreen \{aspect = 1.3333334
		angle = $widescreen_camera_fov}
	root_window :legacydomorph \{alpha = 1}
	if compositeobjectexists \{skater}
		skater :unhide
	endif
	if compositeobjectexists \{player0_body}
		player0_body :unhide
	endif
	change \{show_zone_budget_warnings = 1}
	change \{no_render_metrics = 0}
	if viewportexists \{id = bg_viewport}
		hide_crowd_models \{active = false}
		create_cameracuts
	endif
	setviewmode \{0}
	setenablemovies \{0}
	toggleviewmode
	toggleviewmode
endscript

script spawncubemapscreenshots 
	spawnscriptlater cubemapscreenshots params = <...>
endscript

script lock_cam_top_down 
	killskatercamanim \{all}
	getcurrentcameraobject
	<camid> :obj_getposition
	<camid> :gethfov
	playigccam {
		facing = (0.0, -1.0, 0.0)
		pos = <pos>
		fov = <hfov>
		play_hold
	}
endscript

script lock_cam_cube_dir \{dir = (1.0, 0.0, 0.0)}
	getcurrentcameraobject
	<camid> :obj_getposition
	<camid> :gethfov
	if viewportexists \{id = bg_viewport}
		setviewportcameraorient viewport = bg_viewport at = ((0.0, 0.0, 0.0) - <dir>)
	else
		setviewportcameraorient viewport = 0 at = ((0.0, 0.0, 0.0) - <dir>)
	endif
endscript
