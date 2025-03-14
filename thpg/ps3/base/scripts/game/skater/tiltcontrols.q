tilt_default_settings = {
	motionbalanceactive = false
	motionsteeringactive = false
	motiontricksactive = false
	motionsensitivity = 6
}
tilt_params = {
	debug_display = 0
	use_lowlevel_filter = 1
	lowlevel_filter_cutoff = 20
	filter_sensor_frames = 2
	filter_gravity_frames = 3000
	filter_center_frames = 800
	gravity_adjustment = 0.9
	sensitivity_ui_min = 1
	sensitivity_ui_max = 10
	sensitivity_angle_mult_min = 1.5
	sensitivity_angle_mult_max = 0.6
	stick_angles_fb = [
		5
		40
	]
	stick_angles_lr = [
		2
		60
	]
	impulse_angles = [
		2
		7
	]
	twist_amount = [
		0.1
		0.4
	]
	digital_button_tol_angle = 0.15
	digital_button_tol_impulse = 0.98999995
	digital_button_tol_twist = 0.46
	balance_abs_tilt_factor = 0.2
	balance_impulse_factor = 0.23
	balance_instability_mult = 0.2
	steering_min_pct = 0.22
	steering_fast_pct = 0.83
	brake_full_pct = 0.7
	brake_steering_noanimate_pct = 0.2
	use_for_ntt = 1
	ntt_debug_display = 0
	ntt_center_all = 1
	ntt_center_twist_mult = 0.8
	ntt_no_flip_shoveit = 1
	ntt_fb_pct = 0.4
	ntt_fb_impulse = 0.95
	ntt_lr_pct = 0.35000002
	ntt_lr_impulse = 0.9
	ntt_variance_pct_threshold = 0.15
	ntt_variance_amt = 0.15
	ntt_twist_reset_center_frames = 200
	ntt_twist_increase_total_mult = 0.96
	ntt_twist_amount_total = 2.0
	ntt_twist_amount_impulse = 0.37
}
