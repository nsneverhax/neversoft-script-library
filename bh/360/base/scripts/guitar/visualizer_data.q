Default_Visualizer_Audio_Params = {
	main = {
		waveform_Dampening = 0
		spectrum_Dampening = 0
		spectrum_Decay_Amount = 0.85
		spectrum_Normalize = 1
		spectrum_Windowing = 1
	}
	p1 = {
		raw_audio_Dampening = 0
	}
	p2 = {
		raw_audio_dampeninfg = 0
	}
	p3 = {
		raw_audio_Dampening = 0
	}
	p4 = {
		raw_audio_Dampening = 0
	}
}
Default_Visualizer_Bloom_Params = {
	on = 1
	materialFilter = 0
	fullScreen = 1
	subtract = [
		0
		0
		0
		0
	]
	colormodulate = [
		1.0
		1.0
		1.0
		0.8
	]
	saturation = 1.0
}
Global_Visualizer_Banks = {
	alternative = [
		Donut_Visualizer_Bank
	]
	`Big	Band` = [
		Default_Visualizer_Bank
	]
	`Black	Metal` = [
		Metal_Visualizer_Bank
	]
	Blues = [
		Default_Visualizer_Bank
	]
	`Blues	Rock` = [
		Pop_Visualizer_Bank
	]
	`Classic	Rock` = [
		Default_Visualizer_Bank
	]
	Country = [
		Default_Visualizer_Bank
	]
	Dance = [
		Dance_Visualizer_Bank
	]
	`Death	Metal` = [
		Metal_Visualizer_Bank
	]
	Disco = [
		Disco_Visualizer_Bank
	]
	electronic = [
		Dance_Visualizer_Bank
	]
	experimental = [
		Disco_Visualizer_Bank
	]
	Funk = [
		Default_Visualizer_Bank
	]
	`Glam	Rock` = [
		Metal_Visualizer_Bank
	]
	Grunge = [
		Disco_Visualizer_Bank
	]
	`Hard	Rock` = [
		Default_Visualizer_Bank
	]
	Hardcore = [
		Disco_Visualizer_Bank
	]
	hip_hop = [
		Metal_Visualizer_Bank
	]
	`Indie	Rock` = [
		Pop_Visualizer_Bank
	]
	Industrial = [
		Dance_Visualizer_Bank
	]
	International = [
		Default_Visualizer_Bank
	]
	Jazz = [
		Default_Visualizer_Bank
	]
	Metal = [
		Metal_Visualizer_Bank
	]
	`Modern	Rock` = [
		Default_Visualizer_Bank
	]
	`New	Wave` = [
		Disco_Visualizer_Bank
	]
	`Nu	Metal` = [
		Metal_Visualizer_Bank
	]
	Pop = [
		Pop_Visualizer_Bank
	]
	`Pop	Rock` = [
		Pop_Visualizer_Bank
	]
	`Pop	Punk` = [
		Pop_Visualizer_Bank
	]
	`Prog	Rock` = [
		Default_Visualizer_Bank
	]
	Punk = [
		Disco_Visualizer_Bank
	]
	`R&B` = [
		Default_Visualizer_Bank
	]
	Reggae = [
		Default_Visualizer_Bank
	]
	rock = [
		Default_Visualizer_Bank
	]
	Rockabilly = [
		Default_Visualizer_Bank
	]
	`Ska	Punk` = [
		Disco_Visualizer_Bank
	]
	`Southern	Rock` = [
		Default_Visualizer_Bank
	]
	`Speed	Metal` = [
		Metal_Visualizer_Bank
	]
	`Surf	Rock` = [
		Dance_Visualizer_Bank
	]
	other = [
		Default_Visualizer_Bank
	]
}
Default_Visualizer_Bank = {
	intro = [
		$OG_Frequency_Clouds_Electric_B
	]
	blackout = [
		$OG_Frequency_Clouds_C
	]
	Flare = [
		$JOW_Viz_DiamondStar
	]
	strobe = [
		$OG_Frequency_Rays_Response_A
	]
	Wash = [
		$OG_Frequency_Rays_Response_B
	]
	prelude = [
		$OG_Frequency_Rays_Response_C
	]
	exposition = [
		$OG_Frequency_Rays_Response_A
	]
	risingAction = [
		$JOW_Viz_DiamondStar
	]
	tension = [
		$OG_Frequency_Rays_Response_C
	]
	climax = [
		$OG_Frequency_Rays_Response_A
	]
	fallingAction = [
		$OG_Frequency_Clouds_C
	]
	resolution = [
		$OG_Frequency_Clouds_Electric_BA
	]
	Silhouette = [
		$OG_Frequency_Clouds_Electric_B
	]
	Pyro = [
		$OG_Frequency_Clouds_Electric_BA
	]
	StarPower = [
		$OG_Cloud_Rays_B
	]
	Menu = [
		$OG_Frequency_Clouds_Electric_C
	]
}
Dance_Visualizer_Bank = {
	intro = [
		$OG_Jam_4Player_Cube_B
	]
	blackout = [
		$OG_Jam_4Player_Cube
	]
	Flare = [
		$OG_Jam_4Player_Cube_C
	]
	strobe = [
		$OG_Jam_4Player_Cube_C
	]
	Wash = [
		$JOW_Cube_Expansion_White
	]
	prelude = [
		$OG_Jam_4Player_Cube_D
	]
	exposition = [
		$OG_Jam_4Player_Cube_E
	]
	risingAction = [
		$JOW_Cube_Expansion_Dark
	]
	tension = [
		$OG_Jam_4Player_Cube_A
	]
	climax = [
		$JOW_Cube_Expansion
	]
	fallingAction = [
		$OG_Jam_4Player_Cube_D
	]
	resolution = [
		$JOW_Cube_Expansion_White_Dark
	]
	Silhouette = [
		$OG_Jam_4Player_Cube
	]
	Pyro = [
		$OG_Jam_4Player_Cube_E
	]
	StarPower = [
		$JOW_Cube_Expansion_Dark
	]
	Menu = [
		$OG_Jam_4Player_Cube_B
	]
}
Disco_Visualizer_Bank = {
	intro = [
		$OG_Element_Sparkler
	]
	blackout = [
		$JOW_PowerRings_Quiet
	]
	Flare = [
		$OG_Circles_Trail_Symmetry_C
	]
	strobe = [
		$OG_Circles_Trail_Symmetry_C
	]
	Wash = [
		$OG_Circles_Trail_Symmetry
	]
	prelude = [
		$OG_Element_Spirograph
	]
	exposition = [
		$JOW_Viz_ElectricTunnel_B
	]
	risingAction = [
		$OG_Element_Sparkler
	]
	tension = [
		$OG_Element_Spirograph
	]
	climax = [
		$JOW_Viz_ElectricTunnel_B
	]
	fallingAction = [
		$OG_Element_Spirograph
	]
	resolution = [
		$JOW_PowerRings
	]
	Silhouette = [
		$JOW_PowerRings_Quiet
	]
	Pyro = [
		$OG_Circles_Trail_Symmetry
	]
	StarPower = [
		$OG_Frequency_Burst
	]
	Menu = [
		$OG_Element_Sparkler
	]
}
Metal_Visualizer_Bank = {
	intro = [
		$OG_Element_Spirograph
	]
	blackout = [
		$OG_Element_Spirograph
	]
	Flare = [
		$OG_Explosives_A
	]
	strobe = [
		$OG_Explosives_A
	]
	Wash = [
		$OG_Explosives_B
	]
	prelude = [
		$OG_Explosives_E
	]
	exposition = [
		$OG_Explosives_B
	]
	risingAction = [
		$OG_Explosives_E
	]
	tension = [
		$OG_Explosives_B
	]
	climax = [
		$OG_Explosives_F
	]
	fallingAction = [
		$OG_Element_Spirograph
	]
	resolution = [
		$OG_Explosives_C
	]
	Silhouette = [
		$OG_Explosives_F
	]
	Pyro = [
		$OG_Explosives_A
	]
	StarPower = [
		$OG_Explosives_D
	]
	Menu = [
		$OG_Explosives_D
	]
}
Pop_Visualizer_Bank = {
	intro = [
		$OG_Circles_Centered_Dark
	]
	blackout = [
		$OG_Circles_Centered_Dark
	]
	Flare = [
		$OG_Circles_Trail_Symmetry_C
	]
	strobe = [
		$OG_Circles_Trail_Symmetry_C
	]
	Wash = [
		$OG_Circles_Centered
	]
	prelude = [
		$OG_Circles_Trail_Symmetry_YOffsetBlend
	]
	exposition = [
		$OG_Circles_Trail_Symmetry_YOffsetBlend
	]
	risingAction = [
		$OG_Circles_Trail_Symmetry_D
	]
	tension = [
		$OG_Circles_Trail_Symmetry_YOffsetBlend
	]
	climax = [
		$OG_Circles_Centered
	]
	fallingAction = [
		$OG_Circles_Trail_Symmetry_D
	]
	resolution = [
		$OG_Circles_Centered
	]
	Silhouette = [
		$OG_Circles_Centered_Dark
	]
	Pyro = [
		$OG_Circles_Trail_Symmetry_C
	]
	StarPower = [
		$OG_Circles_Centered_Rays
	]
	Menu = [
		$OG_Circles_Centered
	]
}
Donut_Visualizer_Bank = {
	intro = [
		$OG_Enerdonut
	]
	blackout = [
		$OG_Enerdonut
	]
	Flare = [
		$OG_Enerdonut_Climax_B
	]
	strobe = [
		$OG_Enerdonut_Climax_B
	]
	Wash = [
		$OG_Enerdonut_B
	]
	prelude = [
		$OG_Enerdonut_C
	]
	exposition = [
		$JOW_Viz_PinkTunnel
	]
	risingAction = [
		$OG_Enerdonut_E
	]
	tension = [
		$OG_Enerdonut_F
	]
	climax = [
		$OG_Enerdonut_Climax
	]
	fallingAction = [
		$OG_Enerdonut_D
	]
	resolution = [
		$OG_Enerdonut_B
	]
	Silhouette = [
		$OG_Enerdonut
	]
	Pyro = [
		$JOW_Viz_PinkTunnel
	]
	StarPower = [
		$OG_Enerdonut_Climax_B
	]
	Menu = [
		$OG_Enerdonut_Climax_B
	]
}
