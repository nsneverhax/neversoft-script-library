
script CameraCutsEffect_FOVPulse_GetType 
	RequireParams \{[
			type
		]
		all}
	switch <type>
		case pulse1
		<pulseParams> = {
			amplitude_curve = [
				{(0.0, -0.05)}
				{(0.3, -0.05)}
				{(1.0, 0.0)}
			]
			offset_curve = [
				{(0.0, -0.07)}
				{(1.0, 0.0)}
			]
			frequency = 15
		}
		case pulse2
		<pulseParams> = {
			amplitude_curve = [
				{(0.0, -0.2)}
				{(1.0, -0.2)}
			]
			offset_curve = [
				{(0.0, -0.07)}
				{(1.0, 0.0)}
			]
			frequency = 15
		}
		case pulse3
		<pulseParams> = {
			amplitude_curve = [
				(0.0, -10.0)
				(1.0, -10.0)
			]
			offset_curve = [
				(0.0, -7.0)
				(1.0, 0.0)
			]
			frequency = 15
		}
		case pulse4
		<pulseParams> = {
			amplitude_curve = [
				{(0.0, -0.025)}
				{(0.3, -0.025)}
				{(1.0, 0.0)}
			]
			offset_curve = [
				{(0.0, -0.07)}
				{(1.0, 0.0)}
			]
			frequency = 15
		}
		case pulse5
		<pulseParams> = {
			amplitude_curve = [
				{(0.0, -0.017499998)}
				{(0.3, -0.017499998)}
				{(1.0, 0.0)}
			]
			offset_curve = [
				{(0.0, -0.07)}
				{(1.0, 0.0)}
			]
			frequency = 15
		}
		case zoom_in_quick_small
		<pulseParams> = {
			amplitude_curve = [
				{(0.0, 0.0)}
				{(1.0, 0.0)}
			]
			offset_curve = [
				{(0.0, 0.0)}
				{(0.05, -0.2) smooth}
				{(1.0, -0.2) ease_out}
			]
			frequency = 15
		}
		case zoom_in_quick_large
		<pulseParams> = {
			amplitude_curve = [
				{(0.0, 0.0)}
				{(1.0, 0.0)}
			]
			offset_curve = [
				{(0.0, 0.0)}
				{(0.05, -0.4) smooth}
				{(1.0, -0.4) ease_out}
			]
			frequency = 15
		}
		case zoom_in_slow_small
		<pulseParams> = {
			amplitude_curve = [
				{(0.0, 0.0)}
				{(1.0, 0.0)}
			]
			offset_curve = [
				{(0.0, 0.0)}
				{(0.15, -0.2) smooth}
				{(1.0, -0.2) ease_out}
			]
			frequency = 15
		}
		case zoom_in_slow_large
		<pulseParams> = {
			amplitude_curve = [
				{(0.0, 0.0)}
				{(1.0, 0.0)}
			]
			offset_curve = [
				{(0.0, 0.0)}
				{(0.15, -0.4) smooth}
				{(1.0, -0.4) ease_out}
			]
			frequency = 15
		}
		case zoom_out_quick_small
		<pulseParams> = {
			amplitude_curve = [
				{(0.0, 0.0)}
				{(1.0, 0.0)}
			]
			offset_curve = [
				{(0.0, 0.0)}
				{(0.05, 0.2) smooth}
				{(1.0, 0.2) ease_out}
			]
			frequency = 15
		}
		case zoom_out_quick_large
		<pulseParams> = {
			amplitude_curve = [
				{(0.0, 0.0)}
				{(1.0, 0.0)}
			]
			offset_curve = [
				{(0.0, 0.0)}
				{(0.05, 0.4) smooth}
				{(1.0, 0.4) ease_out}
			]
			frequency = 15
		}
		case zoom_out_slow_small
		<pulseParams> = {
			amplitude_curve = [
				{(0.0, 0.0)}
				{(1.0, 0.0)}
			]
			offset_curve = [
				{(0.0, 0.0)}
				{(0.15, 0.2) smooth}
				{(1.0, 0.2) ease_out}
			]
			frequency = 15
		}
		case zoom_out_slow_large
		<pulseParams> = {
			amplitude_curve = [
				{(0.0, 0.0)}
				{(1.0, 0.0)}
			]
			offset_curve = [
				{(0.0, 0.0)}
				{(0.15, 0.4) smooth}
				{(1.0, 0.4) ease_out}
			]
			frequency = 15
		}
		default
		ScriptAssert qs(0x7a6dbe3a) s = <type>
	endswitch
	return pulseParams = <pulseParams>
endscript

script CameraCutsEffect_FOVPulse \{type = pulse1
		time = 1.0}
	if ($game_mode = training || $game_mode = tutorial || $game_mode = practice)
		return
	elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1)
		return
	elseif ($current_song = jamsession)
		return
	endif
	if GetSkaterCamAnimParams \{name = CameraCutCam}
		if GotParam \{cam_object_id}
			CameraCutsEffect_FOVPulse_GetType type = <type> time = <time>
			if GotParam \{show_graph}
				<debugParam> = {debug_graph_domain_range = [-0.1 , 5.0 , -0.35000002 , 0.35000002]}
			endif
			<cam_object_id> :CCam_PulseFinalFOV {
				<pulseParams>
				<debugParam>
				seconds = <time>
			}
		endif
	endif
endscript
