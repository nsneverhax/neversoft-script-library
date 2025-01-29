select_shift = 0
memcard_screenshots = 0
skater_cam_0_mode = 2
skater_cam_1_mode = 2
screenshotmode = 0
disable_screenshots = 0
arl_text = qs(0xfa6448fa)
arr_text = qs(0x1994c5f0)
aru_text = qs(0x30ff4bf5)
ard_text = qs(0xb4520bf6)
all_text = qs(0x56ec18ea)
alr_text = qs(0xebf66988)
alu_text = qs(0x1a0d9384)
ald_text = qs(0x6bbf81bd)
root_text = {
	arl_text = qs(0xfa6448fa)
	arr_text = qs(0x1994c5f0)
	aru_text = qs(0x30ff4bf5)
	ard_text = qs(0xb4520bf6)
	all_text = qs(0x56ec18ea)
	alr_text = qs(0xebf66988)
	alu_text = qs(0x1a0d9384)
	ald_text = qs(0x6bbf81bd)
}
modelviewer_text = {
	arl_text = qs(0xfa6448fa)
	arr_text = qs(0xe1145bb2)
	aru_text = qs(0x30ff4bf5)
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
	if ($NEWSCREENSHOTMODE)
	endif
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

script userselectr2 
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
	if ScreenElementExists \{id = gpuslowframes_id}
		formatText \{TextName = gpu
			qs(0x48c6d14c)
			d = $gpu_slowframes}
		SetScreenElementProps id = gpuslowframes_id text = <gpu>
	endif
	if ScreenElementExists \{id = gpu_total_id}
		formatText \{TextName = gpu_total
			qs(0x48c6d14c)
			d = $gpu_total}
		SetScreenElementProps id = gpu_total_id text = <gpu_total>
	endif
endscript

script show_spoofed_velocity 
	if NOT ScreenElementExists \{id = wii_drums_anchor}
		SetScreenElementLock \{id = root_window
			OFF}
		CreateScreenElement \{id = wii_drums_anchor
			Type = ContainerElement
			parent = root_window
			Pos = (1000.0, 0.0)
			z_priority = 6000}
		printf \{qs(0x9ee4a9ad)}
		CreateScreenElement \{id = viewer_drums_bg
			Type = SpriteElement
			parent = wii_drums_anchor
			dims = (93.0, 104.0)
			Pos = (35.0, 55.0)
			just = [
				left
				left
			]
			rgba = [
				0
				0
				0
				255
			]
			alpha = 1}
		CreateScreenElement \{id = drumspooftext
			Type = TextElement
			parent = wii_drums_anchor
			font = text_a1
			text = qs(0x00000000)
			Pos = (40.0, 60.0)
			Scale = 0.9
			just = [
				left
				left
			]
			rgba = [
				255
				255
				255
				255
			]}
		CreateScreenElement \{id = drumhittext
			Type = TextElement
			parent = wii_drums_anchor
			font = text_a1
			text = qs(0x00000000)
			Pos = (40.0, 90.0)
			Scale = 0.9
			just = [
				left
				left
			]
			rgba = [
				255
				255
				255
				255
			]}
		CreateScreenElement \{id = drumpercenttext
			Type = TextElement
			parent = wii_drums_anchor
			font = text_a1
			text = qs(0x00000000)
			Pos = (40.0, 120.0)
			Scale = 0.9
			just = [
				left
				left
			]
			rgba = [
				255
				255
				255
				255
			]}
		SetScreenElementLock \{id = root_window
			On}
	endif
	if (<error> = true)
		if (<spoof> = true)
			viewer_drums_bg :se_setprops \{rgba = [
					255
					0
					255
					255
				]}
			viewer_drums_bg :se_setprops \{rgba = [
					0
					0
					0
					255
				]
				time = 0.1}
		else
			viewer_drums_bg :se_setprops \{rgba = [
					255
					0
					0
					255
				]}
			viewer_drums_bg :se_setprops \{rgba = [
					0
					0
					0
					255
				]
				time = 0.1}
		endif
	elseif (<spoof> = true)
		viewer_drums_bg :se_setprops \{rgba = [
				0
				0
				255
				255
			]}
		viewer_drums_bg :se_setprops \{rgba = [
				0
				0
				0
				255
			]
			time = 0.1}
	endif
	formatText TextName = spoof_text qs(0x4d4555da) s = <spoofs>
	formatText TextName = hit_text qs(0x4d4555da) s = <hits>
	formatText TextName = percent_text qs(0x4d4555da) s = <errors>
	drumspooftext :se_setprops text = <spoof_text>
	drumhittext :se_setprops text = <hit_text>
	drumpercenttext :se_setprops text = <percent_text>
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
			dims = (93.0, 104.0)
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
		CreateScreenElement \{id = gpuslowframes_id
			Type = TextElement
			parent = wii_fps_anchor
			font = text_a1
			text = $gpu_slowframes
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
		CreateScreenElement \{id = gpu_total_id
			Type = TextElement
			parent = wii_fps_anchor
			font = text_a1
			text = $gpu_total
			Pos = (40.0, 120.0)
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
	if ($enable_debug = 0)
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
		if NOT ScreenElementExists \{id = viewer_options_bg}
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
		endif
		if NOT ScreenElementExists \{id = left_anchor}
			CreateScreenElement \{id = left_anchor
				Type = ContainerElement
				parent = viewer_options_anchor
				Scale = 1.0
				Pos = (256.0, 96.0)
				just = [
					left
					top
				]}
		endif
		if NOT ScreenElementExists \{id = analog_l_l}
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
		endif
		if NOT ScreenElementExists \{id = analog_l_r}
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
		endif
		if NOT ScreenElementExists \{id = analog_l_t_button}
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
		endif
		if NOT ScreenElementExists \{id = analog_l_t}
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
		endif
		if NOT ScreenElementExists \{id = analog_l_b_button}
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
		endif
		if NOT ScreenElementExists \{id = analog_l_b}
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
		endif
		if NOT ScreenElementExists \{id = right_anchor}
			CreateScreenElement \{id = right_anchor
				Type = ContainerElement
				parent = viewer_options_anchor
				Scale = 1.0
				Pos = (1024.0, 96.0)
				just = [
					left
					top
				]}
		endif
		if NOT ScreenElementExists \{id = analog_r_l}
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
		endif
		if NOT ScreenElementExists \{id = analog_r_r}
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
		endif
		if NOT ScreenElementExists \{id = analog_r_t_button}
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
		endif
		if NOT ScreenElementExists \{id = analog_r_t}
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
		endif
		if NOT ScreenElementExists \{id = analog_r_b_button}
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
		endif
		if NOT ScreenElementExists \{id = analog_r_b}
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
		endif
		if NOT ScreenElementExists \{id = center_anchor}
			CreateScreenElement \{id = center_anchor
				Type = ContainerElement
				parent = viewer_options_anchor
				Scale = 1.0
				Pos = (640.0, 96.0)
				just = [
					left
					top
				]}
		endif
		if NOT ScreenElementExists \{id = center_square}
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
		endif
		if NOT ScreenElementExists \{id = center_circle}
			CreateScreenElement \{id = center_circle
				Type = TextElement
				parent = center_anchor
				font = debug
				text = qs(0x192e1bdd)
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
		endif
		if NOT ScreenElementExists \{id = center_tri_button}
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
		endif
		if NOT ScreenElementExists \{id = center_tri}
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
		endif
		if NOT ScreenElementExists \{id = center_x_button}
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
		endif
		if NOT ScreenElementExists \{id = center_x}
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
		endif
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
		GetViewportCameraPos \{viewport = bg_viewport}
		GetViewportCameraOrient \{viewport = bg_viewport}
		Change \{viewercam_nofail = 1}
		SetSaveZoneNameToCurrent
		SetAnalogStickActiveForMenus \{0}
		Change \{view_mode = 1}
		SetEnableMovies \{0}
		MakeGemsVisibleOnAllViewports
		if NOT userviewerinfe
			if ($freestyle_active = 1)
				freestyle_pause
			else
				pausegh3
			endif
		else
			switch_to_obj_speed
			set_viewer_speed
		endif
		unpausespawnedscript \{update_crowd_model_cam}
		disable_bg_viewport
		enable_crowd_models_cfunc \{Active = true}
		if ($freestyle_active = 1)
			freestyle_hud_hide
		else
			hide_hud
		endif
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
		if ($freestyle_active = 1)
			freestyle_hud_show
		else
			show_hud
		endif
		enable_bg_viewport
		if ($freestyle_active = 1)
			freestyle_unpause
		else
			unpausegh3
			if userviewerinfe
				disable_pause
			else
				enable_pause
			endif
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
	toggle_highway
endscript

script UserSelectRightAnalogDown 
	ToggleMetrics
endscript

script flip_crowd_debug_mode 
	ScriptAssert \{'flip_crowd_debug_mode: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
pak_mode = 0
debug_encore = 0

script UserSelectRightAnalogLeft 
	Change \{current_transition = preencore}
	Change \{debug_encore = 1}
	UserSelectLeftAnalogUp <...>
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

script UserSelectLeftAnalogUp 
	if is_roadie_battle_mode
		GuitarEvent_SongWon
		return
	endif
	calc_songscoreinfo \{Player = 1}
	cutoff = ($star_rating_cutoffs.star5)
	getplayerinfo \{1
		base_score}
	if ($debug_forcescore = OFF)
		getplayerinfo \{1
			max_notes}
		getplayerinfo \{1
			total_notes}
		setplayerinfo 1 score = (<base_score> * <cutoff> + 1)
		setplayerinfo 1 total_notes = <max_notes>
		setplayerinfo 1 notes_hit = <total_notes>
	elseif ($debug_forcescore = poor)
		setplayerinfo 1 score = (<base_score> / 2 + 1)
	elseif ($debug_forcescore = medium)
		setplayerinfo 1 score = (<base_score> + 1)
	elseif ($debug_forcescore = good)
		setplayerinfo 1 score = (<base_score> * <cutoff> + 1)
		setplayerinfo 1 total_notes = <max_notes>
		setplayerinfo 1 notes_hit = <total_notes>
	endif
	gamemode_gettype
	if (<Type> = practice)
		finish_practice_song
		return
	elseif (<Type> = career)
		if GMan_GoalIsActive \{goal = career}
			if ($end_credits = 0)
				career_win_challenge
			endif
		endif
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
endscript

script UserViewerSquare 
endscript
Viewer_move_mode = 1
Obj_Viewer_move_mode = 0
Env_Viewer_move_mode = 2
viewer_speed = env
USER_VIEWER_TRIANGLE_TOD = 1

script UserViewerTriangle 
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
	if ($cas_heap_state = in_cas)
		return \{true}
	endif
	fe_asset_name = `zones/z_frontend/z_frontend.scn`
	if isassetloaded Name = <fe_asset_name>
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

script userselectdown 
endscript
