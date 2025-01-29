default_visualizer_audio_params = {
	main = {
		waveform_dampening = 0
		spectrum_dampening = 0
		spectrum_decay_amount = 0.85
		spectrum_normalize = 1
		spectrum_windowing = 1
	}
	p1 = {
		raw_audio_dampening = 0
	}
	p2 = {
		raw_audio_dampeninfg = 0
	}
	p3 = {
		raw_audio_dampening = 0
	}
	p4 = {
		raw_audio_dampening = 0
	}
}
global_visualizer_banks = {
	alternative = [
		donut_visualizer_bank
	]
	`big	band` = [
		default_visualizer_bank
	]
	`black	metal` = [
		metal_visualizer_bank
	]
	blues = [
		default_visualizer_bank
	]
	`blues	rock` = [
		pop_visualizer_bank
	]
	`classic	rock` = [
		default_visualizer_bank
	]
	country = [
		default_visualizer_bank
	]
	dance = [
		dance_visualizer_bank
	]
	`death	metal` = [
		metal_visualizer_bank
	]
	disco = [
		disco_visualizer_bank
	]
	electronic = [
		dance_visualizer_bank
	]
	experimental = [
		disco_visualizer_bank
	]
	funk = [
		default_visualizer_bank
	]
	`glam	rock` = [
		metal_visualizer_bank
	]
	grunge = [
		disco_visualizer_bank
	]
	`hard	rock` = [
		default_visualizer_bank
	]
	hardcore = [
		disco_visualizer_bank
	]
	hip_hop = [
		metal_visualizer_bank
	]
	`indie	rock` = [
		pop_visualizer_bank
	]
	industrial = [
		dance_visualizer_bank
	]
	international = [
		default_visualizer_bank
	]
	jazz = [
		default_visualizer_bank
	]
	metal = [
		metal_visualizer_bank
	]
	`modern	rock` = [
		default_visualizer_bank
	]
	`new	wave` = [
		disco_visualizer_bank
	]
	`nu	metal` = [
		metal_visualizer_bank
	]
	pop = [
		pop_visualizer_bank
	]
	`pop	rock` = [
		pop_visualizer_bank
	]
	`pop	punk` = [
		pop_visualizer_bank
	]
	`prog	rock` = [
		default_visualizer_bank
	]
	punk = [
		disco_visualizer_bank
	]
	`r&b` = [
		default_visualizer_bank
	]
	reggae = [
		default_visualizer_bank
	]
	rock = [
		default_visualizer_bank
	]
	rockabilly = [
		default_visualizer_bank
	]
	`ska	punk` = [
		disco_visualizer_bank
	]
	`southern	rock` = [
		default_visualizer_bank
	]
	`speed	metal` = [
		metal_visualizer_bank
	]
	`surf	rock` = [
		dance_visualizer_bank
	]
	other = [
		default_visualizer_bank
	]
}
default_visualizer_bank = {
	pak = 'Default_Visualizer_Bank'
	Intro = [
		$og_frequency_clouds_electric_b
	]
	blackout = [
		$og_frequency_clouds_c
	]
	flare = [
		$jow_viz_diamondstar
	]
	strobe = [
		$og_frequency_rays_response_a
	]
	wash = [
		$og_frequency_rays_response_b
	]
	prelude = [
		$og_frequency_rays_response_c
	]
	exposition = [
		$og_frequency_rays_response_a
	]
	risingaction = [
		$jow_viz_diamondstar
	]
	tension = [
		$og_frequency_rays_response_c
	]
	climax = [
		$og_frequency_rays_response_a
	]
	fallingaction = [
		$og_frequency_clouds_c
	]
	resolution = [
		$og_frequency_clouds_electric_ba
	]
	silhouette = [
		$og_frequency_clouds_electric_b
	]
	pyro = [
		$og_frequency_clouds_electric_ba
	]
	starpower = [
		$og_cloud_rays_b
	]
	menu = [
		$og_frequency_clouds_electric_c
	]
}
dance_visualizer_bank = {
	pak = 'Dance_Visualizer_Bank'
	Intro = [
		$og_jam_4player_cube_b
	]
	blackout = [
		$og_jam_4player_cube
	]
	flare = [
		$og_jam_4player_cube_c
	]
	strobe = [
		$og_jam_4player_cube_c
	]
	wash = [
		$jow_cube_expansion_white
	]
	prelude = [
		$og_jam_4player_cube_d
	]
	exposition = [
		$og_jam_4player_cube_e
	]
	risingaction = [
		$jow_cube_expansion_dark
	]
	tension = [
		$og_jam_4player_cube_a
	]
	climax = [
		$jow_cube_expansion
	]
	fallingaction = [
		$og_jam_4player_cube_d
	]
	resolution = [
		$jow_cube_expansion_white_dark
	]
	silhouette = [
		$og_jam_4player_cube
	]
	pyro = [
		$og_jam_4player_cube_e
	]
	starpower = [
		$jow_cube_expansion_dark
	]
	menu = [
		$og_jam_4player_cube_b
	]
}
disco_visualizer_bank = {
	pak = 'Disco_Visualizer_Bank'
	Intro = [
		$og_element_sparkler
	]
	blackout = [
		$jow_powerrings_quiet
	]
	flare = [
		$og_circles_trail_symmetry_c
	]
	strobe = [
		$og_circles_trail_symmetry_c
	]
	wash = [
		$og_circles_trail_symmetry
	]
	prelude = [
		$og_element_spirograph
	]
	exposition = [
		$jow_viz_electrictunnel_b
	]
	risingaction = [
		$og_element_sparkler
	]
	tension = [
		$og_element_spirograph
	]
	climax = [
		$jow_viz_electrictunnel_b
	]
	fallingaction = [
		$og_element_spirograph
	]
	resolution = [
		$jow_powerrings
	]
	silhouette = [
		$jow_powerrings_quiet
	]
	pyro = [
		$og_circles_trail_symmetry
	]
	starpower = [
		$og_frequency_burst
	]
	menu = [
		$og_element_sparkler
	]
}
metal_visualizer_bank = {
	pak = 'Metal_Visualizer_Bank'
	Intro = [
		$og_element_spirograph
	]
	blackout = [
		$og_element_spirograph
	]
	flare = [
		$og_explosives_a
	]
	strobe = [
		$og_explosives_a
	]
	wash = [
		$og_explosives_b
	]
	prelude = [
		$og_explosives_e
	]
	exposition = [
		$og_explosives_b
	]
	risingaction = [
		$og_explosives_e
	]
	tension = [
		$og_explosives_b
	]
	climax = [
		$og_explosives_f
	]
	fallingaction = [
		$og_element_spirograph
	]
	resolution = [
		$og_explosives_c
	]
	silhouette = [
		$og_explosives_f
	]
	pyro = [
		$og_explosives_a
	]
	starpower = [
		$og_explosives_d
	]
	menu = [
		$og_explosives_d
	]
}
pop_visualizer_bank = {
	pak = 'Pop_Visualizer_Bank'
	Intro = [
		$og_circles_centered_dark
	]
	blackout = [
		$og_circles_centered_dark
	]
	flare = [
		$og_circles_trail_symmetry_c
	]
	strobe = [
		$og_circles_trail_symmetry_c
	]
	wash = [
		$og_circles_centered
	]
	prelude = [
		$og_circles_trail_symmetry_yoffsetblend
	]
	exposition = [
		$og_circles_trail_symmetry_yoffsetblend
	]
	risingaction = [
		$og_circles_trail_symmetry_d
	]
	tension = [
		$og_circles_trail_symmetry_yoffsetblend
	]
	climax = [
		$og_circles_centered
	]
	fallingaction = [
		$og_circles_trail_symmetry_d
	]
	resolution = [
		$og_circles_centered
	]
	silhouette = [
		$og_circles_centered_dark
	]
	pyro = [
		$og_circles_trail_symmetry_c
	]
	starpower = [
		$og_circles_centered_rays
	]
	menu = [
		$og_circles_centered
	]
}
donut_visualizer_bank = {
	pak = 'Donut_Visualizer_Bank'
	Intro = [
		$og_enerdonut
	]
	blackout = [
		$og_enerdonut
	]
	flare = [
		$og_enerdonut_climax_b
	]
	strobe = [
		$og_enerdonut_climax_b
	]
	wash = [
		$og_enerdonut_b
	]
	prelude = [
		$og_enerdonut_c
	]
	exposition = [
		$jow_viz_pinktunnel
	]
	risingaction = [
		$og_enerdonut_e
	]
	tension = [
		$og_enerdonut_f
	]
	climax = [
		$og_enerdonut_climax
	]
	fallingaction = [
		$og_enerdonut_d
	]
	resolution = [
		$og_enerdonut_b
	]
	silhouette = [
		$og_enerdonut
	]
	pyro = [
		$jow_viz_pinktunnel
	]
	starpower = [
		$og_enerdonut_climax_b
	]
	menu = [
		$og_enerdonut_climax_b
	]
}
