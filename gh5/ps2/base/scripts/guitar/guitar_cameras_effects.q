ccam_min_fov_interp = 5
ccam_max_fov_interp = 100

script cameracutseffect_fovpulse_gettype 

	switch <Type>
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

	endswitch
	return pulseparams = <pulseparams>
endscript
