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
	motionx = {
		amplitude = 0.033999998
		center = 0.0
		periodbase = 0.012999999
		periodmultiples = [
			1
			3
			4
		]
	}
	motiony = {
		amplitude = 0.04
		center = 0.0
		periodbase = 0.016999999
		periodmultiples = [
			1
			3
			4
		]
	}
	amplitudeposition = {
		amplitude = 0.2
		center = 0.0
		periodbase = 0.0023
		periodmultiples = [
			1
			16
		]
	}
	amplituderotation = {
		amplitude = -0.3
		center = 0.0
		periodbase = 0.0023
		periodmultiples = [
			1
		]
	}
	zoomstabilitymap = [
		(1.3, 0.7)
		(30.0, 100.0)
	]
	driftslerpmap = [
		(0.0, 0.8)
		(0.05, 1.0)
	]
	zoomdriftmap = [
		(1.2, 0.6)
		(30.0, 100.0)
	]
	driftallowedamplitude = {
		amplitude = 0.4
		center = 1.0
		periodbase = 0.02
		periodmultiples = [
			1
		]
	}
}

script igc_runcamerascript 
	ccam_on
	if gotparam \{controlscript}
		<controlscript> <params> <extra_params>
	else
		ccam_setsmoothing \{type = all
			on = 1
			fast_lerp_factor = 0.6}
		<cam_params> = <...>
		removecomponent \{structure_name = cam_params
			name = time}
		ccam_domorph <cam_params>
		if gotparam \{frames}
			scriptassert \{qs(0xcfb468af)}
		endif
		if gotparam \{time}
			wait <time> seconds
		endif
	endif
	if gotparam \{play_hold}
		play_hold_value = <play_hold>
		if gotparam \{play_hold_value}
			if NOT (<play_hold_value> = 1)
				removeparameter \{play_hold}
			endif
		endif
		if gotparam \{play_hold}
			begin
			wait \{1
				gameframes}
			repeat
		endif
	endif
endscript

script igc_camera_update_frame_count 
	if NOT screenelementexists \{id = igc_camera_frame_info}
		setscreenelementlock \{id = root_window
			off}
		getdebugfont
		createscreenelement \{parent = root_window
			id = igc_camera_frame_info
			type = containerelement
			z_priority = 10000}
		createscreenelement {
			type = textelement
			parent = igc_camera_frame_info
			local_id = counter1
			pos = (25.0, 400.0)
			text = qs(0x03ac90f0)
			font = <debug_font>
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
		createscreenelement {
			type = textelement
			parent = igc_camera_frame_info
			local_id = counter2
			pos = (25.0, 418.0)
			text = qs(0x03ac90f0)
			font = <debug_font>
			rgba = [60 60 100 100]
			just = [left center]
			scale = 0.8
		}
	endif
	formattext {
		textname = text1
		qs(0x8aba2455)
		f = <frames>
	}
	formattext {
		textname = text2
		qs(0x6e90806a)
		m = <minutes>
		s = <seconds>
		p = <pct>
		integer_width = 2
	}
	setscreenelementprops id = {igc_camera_frame_info child = counter1} text = <text1>
	setscreenelementprops id = {igc_camera_frame_info child = counter2} text = <text2>
endscript

script igc_camera_frame_counter_kill 
	if screenelementexists \{id = igc_camera_frame_info}
		destroyscreenelement \{id = igc_camera_frame_info}
	endif
endscript
