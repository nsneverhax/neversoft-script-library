
script cameracutseffect_fovpulse_gettype 
	requireparams \{[
			type
		]
		all}
	switch <type>
		case pulse1
		<pulseparams> = {
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
		<pulseparams> = {
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
		<pulseparams> = {
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
		<pulseparams> = {
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
		<pulseparams> = {
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
		<pulseparams> = {
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
		<pulseparams> = {
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
		<pulseparams> = {
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
		<pulseparams> = {
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
		<pulseparams> = {
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
		<pulseparams> = {
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
		<pulseparams> = {
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
		<pulseparams> = {
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
		scriptassert qs(0x7a6dbe3a) s = <type>
	endswitch
	return pulseparams = <pulseparams>
endscript

script cameracutseffect_fovpulse \{type = pulse1
		time = 1.0}
	if ($game_mode = training || $game_mode = tutorial || $game_mode = practice)
		return
	elseif ($current_song = jamsession)
		return
	endif
	if getskatercamanimparams \{name = cameracutcam}
		if gotparam \{cam_object_id}
			cameracutseffect_fovpulse_gettype type = <type> time = <time>
			if gotparam \{show_graph}
				<debugparam> = {debug_graph_domain_range = [-0.1 , 5.0 , -0.35000002 , 0.35000002]}
			endif
			<cam_object_id> :ccam_pulsefinalfov {
				<pulseparams>
				<debugparam>
				seconds = <time>
			}
		endif
	endif
endscript
