
script cutscene_set_temp_tod 
	spawnscriptlater {
		cutscene_set_temp_tod_spawned
		params = <...>
	}
endscript

script cutscene_set_temp_tod_spawned 
	printf \{"cutscene lighting change"
		bg_color = magenta}
	tod_manager_apply_perm_light_settings <...>
endscript
TR_1B_Shot1_Lighting_Values = {
	lev_red = 0
	lev_green = 0
	lev_blue = 0
	sky_red = 128
	sky_green = 128
	sky_blue = 128
	fog_on = 0
	fog_red = 0
	fog_green = 0
	fog_blue = 0
	fog_alpha = 108
	fog_dist = 350
	ambient_red = 30
	ambient_green = 30
	ambient_blue = 30
	ambient_mod_factor_lo = 0
	ambient_mod_factor_hi = 0.0
	heading_0 = 170
	pitch_0 = 330
	red_0 = 90
	green_0 = 60
	blue_0 = 55
	mod_factor_0_lo = 0
	mod_factor_0_hi = 0.0
	heading_1 = 40
	pitch_1 = 290
	red_1 = 50
	green_1 = 50
	blue_1 = 70
	mod_factor_1_lo = 0.0
	mod_factor_1_hi = 0.0
	headlights_on = 0
	bloom_on = 0
	bloom_color = [
		150
		100
		200
	]
	bloom1 = 30
	bloom2 = 100
	bloom_strength = [
		48
		64
		76
	]
	entry_script = nullscript
}
TR_1B_Shot2_Lighting_Values = {
	lev_red = 0
	lev_green = 0
	lev_blue = 0
	sky_red = 128
	sky_green = 128
	sky_blue = 128
	fog_on = 0
	fog_red = 0
	fog_green = 0
	fog_blue = 0
	fog_alpha = 108
	fog_dist = 350
	ambient_red = 30
	ambient_green = 30
	ambient_blue = 30
	ambient_mod_factor_lo = 0
	ambient_mod_factor_hi = 0.0
	heading_0 = 160
	pitch_0 = 190
	red_0 = 70
	green_0 = 70
	blue_0 = 70
	mod_factor_0_lo = 0
	mod_factor_0_hi = 0.0
	heading_1 = 20
	pitch_1 = 140
	red_1 = 60
	green_1 = 60
	blue_1 = 70
	mod_factor_1_lo = 0.0
	mod_factor_1_hi = 0.0
	headlights_on = 0
	bloom_on = 0
	bloom_color = [
		150
		100
		200
	]
	bloom1 = 30
	bloom2 = 100
	bloom_strength = [
		48
		64
		76
	]
	entry_script = nullscript
}
TR_1B_Shot3_Lighting_Values = {
	lev_red = 40
	lev_green = 30
	lev_blue = 40
	sky_red = 128
	sky_green = 128
	sky_blue = 128
	fog_on = 0
	fog_red = 0
	fog_green = 0
	fog_blue = 0
	fog_alpha = 108
	fog_dist = 350
	ambient_red = 35
	ambient_green = 30
	ambient_blue = 30
	ambient_mod_factor_lo = 0
	ambient_mod_factor_hi = 0.0
	heading_0 = 190
	pitch_0 = 210
	red_0 = 90
	green_0 = 45
	blue_0 = 45
	mod_factor_0_lo = 0
	mod_factor_0_hi = 0.0
	heading_1 = 310
	pitch_1 = 30
	red_1 = 0
	green_1 = 0
	blue_1 = 0
	mod_factor_1_lo = 0.0
	mod_factor_1_hi = 0.0
	headlights_on = 0
	bloom_on = 0
	bloom_color = [
		150
		100
		200
	]
	bloom1 = 30
	bloom2 = 100
	bloom_strength = [
		48
		64
		76
	]
	entry_script = nullscript
}
TR_1B_TonyBam_Lighting_Values = {
	lev_red = 70
	lev_green = 60
	lev_blue = 60
	sky_red = 128
	sky_green = 128
	sky_blue = 128
	fog_on = 0
	fog_red = 0
	fog_green = 0
	fog_blue = 0
	fog_alpha = 108
	fog_dist = 350
	ambient_red = 30
	ambient_green = 30
	ambient_blue = 30
	ambient_mod_factor_lo = 0
	ambient_mod_factor_hi = 0.0
	heading_0 = 80
	pitch_0 = 350
	red_0 = 75
	green_0 = 50
	blue_0 = 45
	mod_factor_0_lo = 0
	mod_factor_0_hi = 0.0
	heading_1 = 140
	pitch_1 = 250
	red_1 = 90
	green_1 = 80
	blue_1 = 80
	mod_factor_1_lo = 0.0
	mod_factor_1_hi = 0.0
	headlights_on = 0
	bloom_on = 0
	bloom_color = [
		150
		100
		200
	]
	bloom1 = 30
	bloom2 = 100
	bloom_strength = [
		48
		64
		76
	]
	entry_script = nullscript
}
TR_1B_Skaters_Lighting_Values = {
	lev_red = 70
	lev_green = 60
	lev_blue = 60
	sky_red = 128
	sky_green = 128
	sky_blue = 128
	fog_on = 0
	fog_red = 0
	fog_green = 0
	fog_blue = 0
	fog_alpha = 108
	fog_dist = 350
	ambient_red = 30
	ambient_green = 30
	ambient_blue = 30
	ambient_mod_factor_lo = 0
	ambient_mod_factor_hi = 0.0
	heading_0 = 170
	pitch_0 = 300
	red_0 = 60
	green_0 = 40
	blue_0 = 40
	mod_factor_0_lo = 0
	mod_factor_0_hi = 0.0
	heading_1 = 160
	pitch_1 = 340
	red_1 = 50
	green_1 = 50
	blue_1 = 70
	mod_factor_1_lo = 0.0
	mod_factor_1_hi = 0.0
	headlights_on = 0
	bloom_on = 0
	bloom_color = [
		150
		100
		200
	]
	bloom1 = 30
	bloom2 = 100
	bloom_strength = [
		48
		64
		76
	]
	entry_script = nullscript
}
TR_1B_PhilInvan_Lighting_Values = {
	lev_red = 30
	lev_green = 48
	lev_blue = 48
	sky_red = 128
	sky_green = 128
	sky_blue = 128
	fog_on = 0
	fog_red = 0
	fog_green = 0
	fog_blue = 0
	fog_alpha = 108
	fog_dist = 350
	ambient_red = 30
	ambient_green = 30
	ambient_blue = 30
	ambient_mod_factor_lo = 0
	ambient_mod_factor_hi = 0.0
	heading_0 = 350
	pitch_0 = 250
	red_0 = 60
	green_0 = 60
	blue_0 = 120
	mod_factor_0_lo = 0
	mod_factor_0_hi = 0.0
	heading_1 = 60
	pitch_1 = 190
	red_1 = 70
	green_1 = 30
	blue_1 = 30
	mod_factor_1_lo = 0.0
	mod_factor_1_hi = 0.0
	headlights_on = 0
	bloom_on = 0
	bloom_color = [
		150
		100
		200
	]
	bloom1 = 30
	bloom2 = 100
	bloom_strength = [
		48
		64
		76
	]
	entry_script = nullscript
}
Zero_Lighting_Values = {
	lev_red = 0
	lev_green = 0
	lev_blue = 0
	sky_red = 0
	sky_green = 0
	sky_blue = 0
	fog_on = 0
	fog_red = 0
	fog_green = 0
	fog_blue = 0
	fog_alpha = 108
	fog_dist = 350
	ambient_red = 0
	ambient_green = 0
	ambient_blue = 0
	ambient_mod_factor_lo = 0
	ambient_mod_factor_hi = 0.0
	heading_0 = 0
	pitch_0 = 0
	red_0 = 0
	green_0 = 0
	blue_0 = 0
	mod_factor_0_lo = 0
	mod_factor_0_hi = 0.0
	heading_1 = 0
	pitch_1 = 0
	red_1 = 0
	green_1 = 0
	blue_1 = 0
	mod_factor_1_lo = 0.0
	mod_factor_1_hi = 0.0
	headlights_on = 0
	bloom_on = 0
	bloom_color = [
		150
		100
		200
	]
	bloom1 = 30
	bloom2 = 100
	bloom_strength = [
		48
		64
		76
	]
	entry_script = nullscript
}

script SK_9_Livecard_Lighting 
	setlightambientcolor {
		r = 40
		g = 40
		b = 40
	}
	setlightdiffusecolor {
		index = 0
		r = 0
		g = 0
		b = 0
	}
	setlightdirection {
		index = 0
		heading = 0
		pitch = 0
	}
	setlightdiffusecolor {
		index = 1
		r = 0
		g = 0
		b = 0
	}
	setlightdirection {
		index = 1
		heading = 0
		pitch = 0
	}
endscript
TR_1C_Shot1_Lighting_Values = {
	lev_red = 70
	lev_green = 60
	lev_blue = 60
	sky_red = 128
	sky_green = 128
	sky_blue = 128
	fog_on = 0
	fog_red = 0
	fog_green = 0
	fog_blue = 0
	fog_alpha = 108
	fog_dist = 350
	ambient_red = 30
	ambient_green = 30
	ambient_blue = 30
	ambient_mod_factor_lo = 0
	ambient_mod_factor_hi = 0.0
	heading_0 = 230
	pitch_0 = 200
	red_0 = 55
	green_0 = 40
	blue_0 = 30
	mod_factor_0_lo = 0
	mod_factor_0_hi = 0.0
	heading_1 = 30
	pitch_1 = 190
	red_1 = 50
	green_1 = 60
	blue_1 = 50
	mod_factor_1_lo = 0.0
	mod_factor_1_hi = 0.0
	headlights_on = 0
	bloom_on = 0
	bloom_color = [
		150
		100
		200
	]
	bloom1 = 30
	bloom2 = 100
	bloom_strength = [
		48
		64
		76
	]
	entry_script = nullscript
}
TR_1C_Shot2_Lighting_Values = {
	lev_red = 70
	lev_green = 60
	lev_blue = 60
	sky_red = 128
	sky_green = 128
	sky_blue = 128
	fog_on = 0
	fog_red = 0
	fog_green = 0
	fog_blue = 0
	fog_alpha = 108
	fog_dist = 350
	ambient_red = 30
	ambient_green = 30
	ambient_blue = 30
	ambient_mod_factor_lo = 0
	ambient_mod_factor_hi = 0.0
	heading_0 = 40
	pitch_0 = 320
	red_0 = 85
	green_0 = 70
	blue_0 = 60
	mod_factor_0_lo = 0
	mod_factor_0_hi = 0.0
	heading_1 = 265
	pitch_1 = 320
	red_1 = 50
	green_1 = 60
	blue_1 = 50
	mod_factor_1_lo = 0.0
	mod_factor_1_hi = 0.0
	headlights_on = 0
	bloom_on = 0
	bloom_color = [
		150
		100
		200
	]
	bloom1 = 30
	bloom2 = 100
	bloom_strength = [
		48
		64
		76
	]
	entry_script = nullscript
}
