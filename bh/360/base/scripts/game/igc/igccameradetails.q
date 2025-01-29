debug_igc_camera = 0
igc_camera_show_frame_info = 0
ccam_do_lookat_fov_adjustment = 1
ccam_min_fov_interp = 1.0
ccam_max_fov_interp = 100.0
ccam_fov_interp_param = 0.15
cinematic_camera_default_lerp_params = {
	type = all
	on = 1
	slow_lerp_factor = 0.6
	fast_lerp_factor = 0.0
	lerp_dropoff = 16.0
}
cinematic_camera_default_handcam_params = {
	motionX = {
		amplitude = 0.033999998
		center = 0.0
		periodBase = 0.012999999
		periodMultiples = [
			1
			3
			4
		]
	}
	motionY = {
		amplitude = 0.04
		center = 0.0
		periodBase = 0.016999999
		periodMultiples = [
			1
			3
			4
		]
	}
	amplitudePosition = {
		amplitude = 0.2
		center = 0.0
		periodBase = 0.0023
		periodMultiples = [
			1
			16
		]
	}
	amplituderotation = {
		amplitude = -0.3
		center = 0.0
		periodBase = 0.0023
		periodMultiples = [
			1
		]
	}
	zoomStabilityMap = [
		(1.3, 0.7)
		(30.0, 100.0)
	]
	driftSlerpMap = [
		(0.0, 0.8)
		(0.05, 1.0)
	]
	zoomDriftMap = [
		(1.2, 0.6)
		(30.0, 100.0)
	]
	driftAllowedAmplitude = {
		amplitude = 0.4
		center = 1.0
		periodBase = 0.02
		periodMultiples = [
			1
		]
	}
}

script IGC_RunCameraScript 
	CCam_On
	if GotParam \{controlscript}
		<controlscript> <params> <extra_params>
	else
		CCam_SetSmoothing \{type = all
			on = 1
			fast_lerp_factor = 0.6}
		<cam_params> = <...>
		RemoveComponent \{structure_name = cam_params
			name = time}
		CCam_DoMorph <cam_params>
		if GotParam \{frames}
			ScriptAssert \{qs(0xcfb468af)}
		endif
		if GotParam \{time}
			wait <time> seconds
		endif
	endif
	if GotParam \{Play_hold}
		play_hold_value = <Play_hold>
		if GotParam \{play_hold_value}
			if NOT (<play_hold_value> = 1)
				RemoveParameter \{Play_hold}
			endif
		endif
		if GotParam \{Play_hold}
			begin
			wait \{1
				gameframes}
			repeat
		endif
	endif
endscript

script igc_camera_update_frame_count 
	if NOT ScreenElementExists \{id = igc_camera_frame_info}
		SetScreenElementLock \{id = root_window
			off}
		GetDebugFont
		CreateScreenElement \{parent = root_window
			id = igc_camera_frame_info
			type = ContainerElement
			z_priority = 10000}
		CreateScreenElement {
			type = TextElement
			parent = igc_camera_frame_info
			local_id = counter1
			Pos = (25.0, 400.0)
			text = qs(0x03ac90f0)
			font = <debug_font>
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		CreateScreenElement {
			type = TextElement
			parent = igc_camera_frame_info
			local_id = counter2
			Pos = (25.0, 418.0)
			text = qs(0x03ac90f0)
			font = <debug_font>
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
	endif
	FormatText {
		TextName = text1
		qs(0x8aba2455)
		f = <frames>
	}
	FormatText {
		TextName = text2
		qs(0x6e90806a)
		m = <minutes>
		s = <seconds>
		p = <pct>
		integer_width = 2
	}
	SetScreenElementProps id = {igc_camera_frame_info child = counter1} text = <text1>
	SetScreenElementProps id = {igc_camera_frame_info child = counter2} text = <text2>
endscript

script igc_camera_frame_counter_kill 
	if ScreenElementExists \{id = igc_camera_frame_info}
		DestroyScreenElement \{id = igc_camera_frame_info}
	endif
endscript
