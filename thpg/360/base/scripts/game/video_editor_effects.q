ve_max_combined_effects = 3
ve_effects_list = [
	none
	bloom
	dof
	noise
	mono
	contrast
	fisheye
	red
	yellow
	orange
	green
	blue
	purple
	pink1984
	pinktrails
	darktrails
	purpleglow
	plasmagoo
	starburst
	grit
	sunblast
	blurry
	filmnoir
	fadeout
	fadein
]
ve_active_effects_name_list = [
]
ve_effects = {
	none = {
		text = "none"
		add = {
			type = bloom
			on = 0
			contrast = 0.0
			brightness = 0.0
		}
		blend_in = {
			contrast = 0.0
			brightness = 0.0
		}
		blend_out = {
			contrast = 0.0
			brightness = 0.0
		}
		strength_script = nullscript
		default_strength = 1.0
	}
	bloom = {
		text = "bloom"
		add = {
			scefname = blm1
			type = bloom
			on = 1
			materialfilter = 0
			autoluminancemod = 1
			distancemod = 0.0
			bloom1 = 5.0
			bloom2 = 5.0
			materialfilter = 0
			strength = [
				0
				0
				0
			]
			color = [
				64
				64
				64
			]
			falloff1 = 1
			falloff2 = 1
			R_VE_Bloom = 255
			G_VE_Bloom = 255
			B_VE_Bloom = 255
		}
		blend_in = {
			strength = [
				128
				128
				128
			]
		}
		blend_out = {
			strength = [
				0
				0
				0
			]
		}
		strength_script = ve_modify_effect_strength_bloom
	}
	dof = {
		text = "depth of field"
		add = {
			scefname = dof
			type = dof
			on = 1
			strength = 0.0
			backdist = 0.1
			crossfade = 1.0
		}
		blend_in = {
			strength = 1.0
		}
		blend_out = {
			strength = 0.0
		}
		strength_script = ve_modify_effect_strength_dof
	}
	noise = {
		text = "noise"
		add = {
			scefname = noise
			type = noise
			on = 1
			intensity = 0.0
			color = [
				255
				255
				255
			]
		}
		blend_in = {
			intensity = 0.6
		}
		blend_out = {
			intensity = 0.0
		}
		strength_script = ve_modify_effect_strength_noise
		purchase_cost = 50
	}
	mono = {
		text = "monochrome"
		add = {
			scefname = bright_sat
			type = bright_sat
			on = 1
			saturation = 1.0
		}
		blend_in = {
			saturation = 0.0
		}
		blend_out = {
			saturation = 1.0
		}
		default_blend = 0
		default_strength = 1.0
		strength_script = ve_modify_effect_strength_mono
		purchase_cost = 50
	}
	contrast = {
		text = "high contrast"
		add = {
			scefname = bright_sat
			type = bright_sat
			on = 1
			contrast = 1.0
		}
		blend_in = {
			contrast = 2.0
		}
		blend_out = {
			contrast = 1.0
		}
		strength_script = ve_modify_effect_strength_contrast
		purchase_cost = 50
	}
	fisheye = {
		text = "fisheye lens"
		add = {
			scefname = fisheye
			type = fisheye
			on = 1
			warp_strength = 0.0
		}
		blend_in = {
			warp_strength = 1.5
		}
		blend_out = {
			warp_strength = 0.0
		}
		strength_script = ve_modify_effect_strength_fisheye
		purchase_cost = 50
	}
	red = {
		text = "red filter"
		add = {
			scefname = bright_sat
			type = bright_sat
			on = 1
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
		}
		blend_in = {
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0.0
				0.5
				0.0
			]
			blue_mix = [
				0.0
				0.0
				0.5
			]
		}
		blend_out = {
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
		}
		strength_script = ve_modify_effect_strength_color
		purchase_cost = 50
	}
	yellow = {
		text = "yellow filter"
		add = {
			scefname = bright_sat
			type = bright_sat
			on = 1
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
		}
		blend_in = {
			red_mix = [
				0.16
				0.68
				-0.56
			]
			green_mix = [
				1.3499999
				0.42000002
				-0.53
			]
			blue_mix = [
				0.11
				0.69
				-0.69
			]
		}
		blend_out = {
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
		}
		strength_script = ve_modify_effect_strength_color
		purchase_cost = 50
	}
	orange = {
		text = "orange filter"
		add = {
			scefname = bright_sat
			type = bright_sat
			on = 1
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
		}
		blend_in = {
			red_mix = [
				0.9
				0.0
				0.0
			]
			green_mix = [
				0.0
				0.75
				0.0
			]
			blue_mix = [
				0.0
				0.0
				0.15
			]
		}
		blend_out = {
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
		}
		strength_script = ve_modify_effect_strength_color
		purchase_cost = 50
	}
	green = {
		text = "green filter"
		add = {
			scefname = bright_sat
			type = bright_sat
			on = 1
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
		}
		blend_in = {
			red_mix = [
				0.5
				0.0
				0.0
			]
			green_mix = [
				0.0
				1.0
				0.0
			]
			blue_mix = [
				0.0
				0.0
				0.5
			]
		}
		blend_out = {
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
		}
		strength_script = ve_modify_effect_strength_color
		purchase_cost = 50
	}
	blue = {
		text = "blue filter"
		add = {
			scefname = bright_sat
			type = bright_sat
			on = 1
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
		}
		blend_in = {
			red_mix = [
				0.25
				0.0
				0.0
			]
			green_mix = [
				0.0
				0.25
				0.0
			]
			blue_mix = [
				0
				0
				1
			]
		}
		blend_out = {
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
		}
		strength_script = ve_modify_effect_strength_color
		purchase_cost = 50
	}
	purple = {
		text = "purple filter"
		add = {
			scefname = bright_sat
			type = bright_sat
			on = 1
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
		}
		blend_in = {
			red_mix = [
				1.13
				-1.2900001
				0.84000003
			]
			green_mix = [
				1.24
				-1.24
				1.3299999
			]
			blue_mix = [
				1.1700001
				-1.11
				1.14
			]
		}
		blend_out = {
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
		}
		strength_script = ve_modify_effect_strength_color
		purchase_cost = 50
	}
	pink1984 = {
		text = "pink1984 filter"
		add = {
			scefname = bright_sat
			type = bright_sat
			on = 1
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
		}
		blend_in = {
			red_mix = [
				-1.3299999
				-0.19
				0.69
			]
			green_mix = [
				1.2900001
				-1.24
				1.3299999
			]
			blue_mix = [
				1.3299999
				-1.38
				1.38
			]
		}
		blend_out = {
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
		}
		strength_script = ve_modify_effect_strength_color
		purchase_cost = 150
	}
	pinktrails = {
		text = "pink trails"
		add = {
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 1
			backdist = 0
			frontdist = 0.015
			strength = 0.0
			color = [
				255
				128
				192
				0
			]
		}
		blend_in = {
			strength = 1.0
		}
		blend_out = {
			strength = 0.0
		}
		strength_script = ve_modify_effect_strength_dof
		purchase_cost = 300
	}
	darktrails = {
		text = "black trails"
		add = {
			scefname = fog
			type = fog
			on = 1
			foregroundonly = 1
			backdist = 0
			frontdist = 0.015
			strength = 0.0
			color = [
				0
				0
				0
				0
			]
		}
		blend_in = {
			strength = 1.0
		}
		blend_out = {
			strength = 0.0
		}
		strength_script = ve_modify_effect_strength_dof
		purchase_cost = 300
	}
	purpleglow = {
		text = "purple glow"
		add = {
			scefname = ve_purpleglow
			type = bloom
			on = 1
			bloom1 = 1
			bloom2 = 1
			autoluminancemod = 1
			materialfilter = 0
			distancemod = 54.649998
			strength = [
				0
				0
				0
			]
			color = [
				255
				174
				94
			]
			falloff1 = 5
			falloff2 = 5
		}
		blend_in = {
			strength = [
				112
				70
				198
			]
		}
		blend_out = {
			strength = [
				0
				0
				0
			]
		}
		strength_script = ve_modify_effect_strength_bloom
		purchase_cost = 300
	}
	plasmagoo = {
		text = "plasmagoo"
		add = {
			scefname = plasmagoo
			type = simple_bloom
			on = 1
			bloom1 = 0.85
			materialfilter = 0
			bloom2 = 0.0
			autoluminancemod = 0
			distancemod = 0.0
			strength = [
				0
				0
				0
			]
			color = [
				128
				255
				255
			]
			falloff1 = 1.9499999
			falloff2 = 0.0
		}
		blend_in = {
			strength = [
				146
				251
				4
			]
		}
		blend_out = {
			strength = [
				0
				0
				0
			]
		}
		strength_script = ve_modify_effect_strength_bloom
		purchase_cost = 300
	}
	starburst = {
		text = "Starburst"
		add = {
			scefname = ve_starburst
			type = fisheye
			on = 1
			warp_x = 1.43
			warp_y = 1.43
			warp_strength = 0.0
			aperture_start = 0.06
			aperture_end = 0.90999997
			aperture_x = 1
			aperture_y = 1
			scale_x = 0.120000005
			scale_y = 0.120000005
		}
		blend_in = {
			warp_strength = 1.5
		}
		blend_out = {
			warp_strength = 0.0
		}
		default_blend = 0
		strength_script = ve_modify_effect_strength_fisheye
		purchase_cost = 500
	}
	grit = {
		text = "Grit"
		add = {
			scefname = ve_grit
			type = noise
			on = 1
			intensity = 0.0
			color = [
				192
				192
				192
			]
			scale = 0.85
			mode = subsrcmulinvdst
			jitterrate = 0
			jitteramount = 0
			maskintensity = 0.61
			maskscale = 10
		}
		blend_in = {
			intensity = 0.48000002
		}
		blend_out = {
			intensity = 0.0
		}
		strength_script = ve_modify_effect_strength_noise
		default_strength = 1.0
		purchase_cost = 300
	}
	sunblast = {
		text = "Sunblast"
		add = {
			scefname = ve_intenselight
			type = dof
			on = 1
			backdist = 0.005
			frontdist = 0.003
			strength = 0.0
			blurradius = 0.13
			blurresolution = half
		}
		blend_in = {
			strength = 1.0
		}
		blend_out = {
			strength = 0.0
		}
		strength_script = ve_modify_effect_strength_dof
		purchase_cost = 1000
	}
	sunblast = {
		text = "Sunblast"
		add = {
			scefname = ve_intenselight
			type = dof
			on = 1
			backdist = 0.005
			frontdist = 0.003
			strength = 0
			blurradius = 0.13
			blurresolution = half
		}
		blend_in = {
			strength = 1.0
		}
		blend_out = {
			strength = 0.0
		}
		default_blend = 0
		strength_script = ve_modify_effect_strength_dof
		purchase_cost = 1000
	}
	blurry = {
		text = "Blurry"
		add = {
			scefname = ve_blurry
			type = dof
			on = 1
			backdist = 0.03
			frontdist = 0.006
			strength = 1
			blurradius = 3.08
			blurresolution = quarter
		}
		blend_in = {
			strength = 1.0
		}
		blend_out = {
			strength = 0.0
		}
		default_strength = 1.0
		strength_script = ve_modify_effect_strength_dof
		purchase_cost = 200
	}
	filmnoir = {
		text = "Filmnoir"
		add = {
			scefname = ve_filmnoir
			type = bright_sat
			on = 1
			red_mix = [
				1
				0
				0
			]
			green_mix = [
				0
				1
				0
			]
			blue_mix = [
				0
				0
				1
			]
			contrast = 1.0
			brightness = 1.0
		}
		blend_in = {
			contrast = 1.4499999
			brightness = 3.57
			saturation = 0
			hue = 0
		}
		blend_out = {
			contrast = 1.0
			brightness = 1.0
			saturation = 1.0
			hue = 1.0
		}
		default_strength = 1.0
		default_blend = 0
		strength_script = ve_modify_effect_strength_color
		purchase_cost = 250
	}
	fadeout = {
		text = "fade to black"
		add = {
			scefname = bright_sat
			type = bright_sat
			on = 1
			contrast = 1.0
			brightness = 1.0
		}
		blend_in = {
			contrast = 0.0
			brightness = 0.0
		}
		blend_out = {
			contrast = 0.0
			brightness = 0.0
		}
		strength_script = ve_modify_effect_strength_fadeout
		default_strength = 1.0
		fade_out_effect
		purchase_cost = 50
	}
	fadein = {
		text = "fade in from black"
		add = {
			scefname = bright_sat
			type = bright_sat
			on = 1
			contrast = 0.0
			brightness = 0.0
		}
		blend_in = {
			contrast = 0.0
			brightness = 0.0
		}
		blend_out = {
			contrast = 1.0
			brightness = 1.0
		}
		strength_script = ve_modify_effect_strength_fadein
		default_strength = 1.0
		fade_in_effect
		purchase_cost = 50
	}
}

script ve_modify_effect_strength_bloom 
	if (<step> = blend_in)
		Strength_array = (<struct>.strength)
		strengthR_val = (<Strength_array> [0] * <strength> * 1.0)
		strengthG_val = (<Strength_array> [1] * <strength> * 1.0)
		strengthB_val = (<Strength_array> [2] * <strength> * 1.0)
		casttointeger strengthR_val
		casttointeger strengthG_val
		casttointeger strengthB_val
		setarrayelement arrayname = Strength_array index = 0 newvalue = <strengthR_val>
		setarrayelement arrayname = Strength_array index = 1 newvalue = <strengthG_val>
		setarrayelement arrayname = Strength_array index = 2 newvalue = <strengthB_val>
		return true struct = {<struct> strength = <Strength_array>}
	endif
endscript

script ve_modify_effect_strength_dof 
	if (<step> = blend_in)
		return true struct = {<struct> strength = (<strength> * (<struct>.strength))}
	endif
endscript

script ve_modify_effect_strength_noise 
	if (<step> = blend_in)
		return true struct = {<struct> intensity = (<strength> * (<struct>.intensity))}
	endif
endscript

script ve_modify_effect_strength_mono 
	if (<step> = blend_in)
		return true struct = {<struct> saturation = (1.0 - (<strength> * 1.0))}
	endif
endscript

script ve_modify_effect_strength_contrast 
	if (<step> = blend_in)
		return true struct = {<struct> contrast = (1.0 + (<strength> * 1.0))}
	endif
endscript

script ve_modify_effect_strength_color 
	if (<step> = blend_in)
		if structurecontains structure = <struct> red_mix
			ve_modify_effect_strength_color_array src_array = [1.0 0.0 0.0] array = (<struct>.red_mix) strength = <strength>
			red_mix = <mod_array>
			ve_modify_effect_strength_color_array src_array = [0.0 1.0 0.0] array = (<struct>.green_mix) strength = <strength>
			green_mix = <mod_array>
			ve_modify_effect_strength_color_array src_array = [0.0 0.0 1.0] array = (<struct>.blue_mix) strength = <strength>
			blue_mix = <mod_array>
		endif
		if structurecontains structure = <struct> brightness
			linearmap result = brightness from = 1.0 to = (<struct>.brightness) basedon = <strength> lowerbound = 0.0 upperbound = 1.0
		endif
		if structurecontains structure = <struct> contrast
			linearmap result = contrast from = 1.0 to = (<struct>.contrast) basedon = <strength> lowerbound = 0.0 upperbound = 1.0
		endif
		if structurecontains structure = <struct> saturation
			linearmap result = saturation from = 1.0 to = (<struct>.saturation) basedon = <strength> lowerbound = 0.0 upperbound = 1.0
		endif
		return true struct = {
			<struct>
			red_mix = <red_mix>
			green_mix = <green_mix>
			blue_mix = <blue_mix>
			brightness = <brightness>
			contrast = <contrast>
			saturation = <saturation>
		}
	endif
endscript

script ve_modify_effect_strength_color_array 
	mod_array = [0.0 0.0 0.0]
	linearmap result = arrayA from = (<src_array> [0]) to = (<array> [0]) basedon = <strength> lowerbound = 0.0 upperbound = 1.0
	linearmap result = arrayB from = (<src_array> [1]) to = (<array> [1]) basedon = <strength> lowerbound = 0.0 upperbound = 1.0
	linearmap result = arrayC from = (<src_array> [2]) to = (<array> [2]) basedon = <strength> lowerbound = 0.0 upperbound = 1.0
	setarrayelement arrayname = mod_array index = 0 newvalue = <arrayA>
	setarrayelement arrayname = mod_array index = 1 newvalue = <arrayB>
	setarrayelement arrayname = mod_array index = 2 newvalue = <arrayC>
	return mod_array = <mod_array>
endscript

script ve_modify_effect_strength_fisheye 
	if (<step> = blend_in)
		return true struct = {<struct> warp_strength = ((<strength> * (<struct>.warp_strength)))}
	endif
endscript

script ve_modify_effect_strength_fadeout 
	if (<step> = add)
		return true struct = {<struct> contrast = 1.0 brightness = 1.0}
	else
		return true struct = {<struct> contrast = (1.0 - (<strength> * 1.0)) brightness = (1.0 - (<strength> * 1.0))}
	endif
endscript

script ve_modify_effect_strength_fadein 
	if (<step> = blend_out)
		return true struct = {<struct> contrast = 1.0 brightness = 1.0}
	else
		return true struct = {<struct> contrast = (1.0 - (<strength> * 1.0)) brightness = (1.0 - (<strength> * 1.0))}
	endif
endscript

script ve_convert_effects_to_cuts 
	getarraysize <effects>
	num_effects = <array_size>
	cuts = []
	fx_name_list = []
	fx_name_list_entry = [none]
	i = 0
	curr_time = 0.0
	effect_id_index = 0
	if (<num_effects> > 0)
		begin
		effects_list = ((<effects> [<i>]).effects)
		getarraysize <effects_list>
		effects_list_size = <array_size>
		list_index = 0
		begin
		time_end = (<curr_time> + ((<effects> [<i>]).length))
		formattext checksumname = effect_id 'effect_%d' d = <effect_id_index>
		effect_id_index = (<effect_id_index> + 1)
		setarrayelement arrayname = fx_name_list_entry index = 0 newvalue = <effect_id>
		fx_name_list = (<fx_name_list> + <fx_name_list_entry>)
		if (<time_end> > <start_time>)
			blend_in = ((<effects> [<i>]).blend_in)
			blend_out = ((<effects> [<i>]).blend_out)
			effect_listed_name = (<effects_list> [<list_index>])
			if (<curr_time> < <start_time>)
				blend_in = 0
			endif
			if (<effect_listed_name> = fadein)
				blend_in = 1
				blend_out = 1
			endif
			if (<effect_listed_name> = fadeout)
				blend_in = 1
				blend_out = 1
			endif
			ve_convert_single_effect_to_cuts {
				effect_params = {
					((<effects> [<i>]).params)
					effect_id = <effect_id>
				}
				effect_name = <effect_listed_name>
				effect_details = {
					strength = ((<effects> [<i>]).strength)
					blend_in = <blend_in>
					blend_out = <blend_out>
				}
				time_start = <curr_time>
				time_end = <time_end>
			}
			cuts = (<cuts> + <new_cuts>)
		endif
		list_index = (<list_index> + 1)
		repeat <effects_list_size>
		curr_time = <time_end>
		i = (<i> + 1)
		repeat <num_effects>
	endif
	change ve_active_effects_name_list = <fx_name_list>
	return cuts = <cuts>
endscript

script ve_convert_single_effect_to_cuts 
	len = (<time_end> - <time_start>)
	blend_time = 0.5
	if (<blend_time> > (<len> * 0.25))
		blend_time = (<len> * 0.25)
	endif
	if ve_effect_has_flag effect = <effect_name> flag = fade_out_effect
		blend_time = <len>
	endif
	blend_in_time = 0.001
	if NOT ve_effect_has_flag effect = <effect_name> flag = fade_in_effect
		if ((<effect_details>.blend_in) = 1)
			blend_in_time = <blend_time>
		endif
	endif
	effect_cut_params = {
		effect = <effect_name>
		<effect_params>
		strength = (<effect_details>.strength)
	}
	cut_in = {
		time = <time_start>
		type = effect
		params = {
			<effect_cut_params>
			effect_start
			blend_time = <blend_in_time>
		}
	}
	if ve_effect_has_flag effect = <effect_name> flag = fade_in_effect
		blend_time = (<len> - <blend_time>)
	endif
	if ((<effect_details>.blend_out) = 1)
		cut_blend_out = {
			time = (<time_end> - <blend_time>)
			type = effect
			params = {
				<effect_cut_params>
				effect_blend_out
				blend_time = <blend_time>
			}
		}
	endif
	cut_out = {
		time = <time_end>
		type = effect
		params = {
			<effect_cut_params>
			effect_end
		}
	}
	if ((<effect_details>.blend_out) = 1)
		new_cuts = [{<cut_in>} {<cut_blend_out>} {<cut_out>}]
	else
		new_cuts = [{<cut_in>} {<cut_out>}]
	endif
	return new_cuts = <new_cuts>
endscript

script ve_effect_has_flag 
	if NOT structurecontains structure = ($ve_effects) <effect>
		scriptassert 'Effect %s doesnt exist' s = <effect>
	endif
	if structurecontains structure = (($ve_effects).<effect>) <flag>
		return \{true}
	endif
	return \{false}
endscript

script ve_process_cut 
	switch (<cut>.type)
		case effect
		params = (<cut>.params)
		effect_type = (<params>.effect)
		if structurecontains structure = ($ve_effects) <effect_type>
			effect_data = {(($ve_effects).<effect_type>) ve_fx}
			if structurecontains structure = <effect_data> strength_script
				strength = (<params>.strength)
				if ((<effect_data>).strength_script) strength = <strength> struct = (<effect_data>.add) step = add
					effect_data = {<effect_data> add = <struct>}
				endif
				if ((<effect_data>).strength_script) strength = <strength> struct = (<effect_data>.blend_in) step = blend_in
					effect_data = {<effect_data> blend_in = <struct>}
				endif
				if ((<effect_data>).strength_script) strength = <strength> struct = (<effect_data>.blend_out) step = blend_out
					effect_data = {<effect_data> blend_out = <struct>}
				endif
			endif
			if structurecontains structure = <params> effect_start
				if NOT screenfx_fxinstanceexists viewport = <viewport> name = (<params>.effect_id)
					screenfx_addfxinstance {
						viewport = <viewport>
						name = (<params>.effect_id)
						(<effect_data>.add)
					}
					screenfx_updatefxinstanceparams {
						viewport = <viewport>
						name = (<params>.effect_id)
						time = (<params>.blend_time)
						(<effect_data>.blend_in)
					}
				endif
			elseif structurecontains structure = <params> effect_blend_out
				if screenfx_fxinstanceexists viewport = <viewport> name = (<params>.effect_id)
					screenfx_updatefxinstanceparams {
						viewport = <viewport>
						name = (<params>.effect_id)
						time = (<params>.blend_time)
						(<effect_data>.blend_out)
					}
				endif
			elseif structurecontains structure = (<cut>.params) effect_end
				if screenfx_fxinstanceexists viewport = <viewport> name = (<params>.effect_id)
					screenfx_removefxinstance viewport = <viewport> name = (<params>.effect_id)
				endif
			endif
		else
			scriptassert 'Effect %s doesnt exist' s = <effect_type>
		endif
		case bink
		if NOT (<terminated_cuts> = 1)
			params = (<cut>.params)
			ve_kill_bink
			bink = (($video_editor_bink_details).(<params>.name))
			if structurecontains structure = <bink> movie
				spawnscriptnow ve_play_bink params = {
					bink = <bink>
					viewport = <viewport>
				}
			endif
		endif
	endswitch
endscript

script ve_get_effect_text effect = {}
	effect_text = ""
	effect_list = (<effect>.effects)
	getarraysize <effect_list>
	if (<array_size> = 0)
		effect_text = "None"
	else
		effect_text = ""
		if NOT gotparam NoName
			i = 0
			begin
			this_effect_name = (<effect_list> [<i>])
			this_effect_text = ((($ve_effects).<this_effect_name>).text)
			effect_text = (<effect_text> + <this_effect_text>)
			i = (<i> + 1)
			if (<i> < <array_size>)
				effect_text = (<effect_text> + "+")
			endif
			repeat <array_size>
			effect_text = (<effect_text> + " ")
		endif
		if NOT gotparam noProps
			strength = (((<effect>.strength) * 100.0) + 0.5)
			casttointeger strength
			formattext textname = appendage "%d\\% " d = <strength>
			effect_text = (<effect_text> + <appendage>)
			if ((<effect>.blend_in) = 0)
				effect_text = (<effect_text> + "HARD-IN ")
			endif
			if ((<effect>.blend_out) = 0)
				effect_text = (<effect_text> + "HARD-OUT")
			endif
		endif
	endif
	return effect_text = <effect_text>
endscript

script ve_apply_weather_effect 
	if gotparam weather
		if structurecontains structure = (<weather>.tod_settings) tod
			if ischecksum (<weather>.tod_settings.tod)
				tod_proxim_update_lightfx fxparam = (<weather>.tod_settings.tod) time = 0.05 exception_list = ($ve_active_effects_name_list) viewport = <viewport>
			endif
		endif
		linearmap result = rain_start from = (<weather>.rain_start) to = (<weather>.rain_end) basedon = <start_percent> lowerbound = 0.0 upperbound = 1.0
		linearmap result = rain_end from = (<weather>.rain_start) to = (<weather>.rain_end) basedon = <end_percent> lowerbound = 0.0 upperbound = 1.0
		linearmap result = rain_light_start from = (<weather>.rain_light_start) to = (<weather>.rain_light_end) basedon = <start_percent> lowerbound = 0.0 upperbound = 1.0
		linearmap result = rain_light_end from = (<weather>.rain_light_start) to = (<weather>.rain_light_end) basedon = <end_percent> lowerbound = 0.0 upperbound = 1.0
		linearmap result = rain_puddles_start from = (<weather>.rain_puddles_start) to = (<weather>.rain_puddles_end) basedon = <start_percent> lowerbound = 0.0 upperbound = 1.0
		linearmap result = rain_puddles_end from = (<weather>.rain_puddles_start) to = (<weather>.rain_puddles_end) basedon = <end_percent> lowerbound = 0.0 upperbound = 1.0
		Rain_Do_Rain_Transition i = <rain_start> time = 0
		Rain_Do_Lighting_Transition i = <rain_light_start> time = 0
		Rain_Do_Puddles_Transition i = <rain_puddles_start> time = 0
		killspawnedscript id = Rain_Transition
		if (<time> > 0.1)
			spawnscriptnow Rain_Do_Rain_Transition id = Rain_Transition params = {i = <rain_end> time = <time>}
			spawnscriptnow Rain_Do_Lighting_Transition id = Rain_Transition params = {i = <rain_light_end> time = <time>}
			spawnscriptnow Rain_Do_Puddles_Transition id = Rain_Transition params = {i = <rain_puddles_end> time = <time>}
		endif
	else
		tod_proxim_reapply_lightfx exception_list = ($ve_active_effects_name_list) viewport = <viewport>
	endif
endscript
ve_weather_effects_remember_CurRainIntensity = 0.0
ve_weather_effects_remember_CurRainPuddlesIntensity = 0.0
ve_weather_effects_remember_CurRainLightingIntensity = 0.0
ve_weather_effects_remember_CurTOD = {
}

script ve_weather_effects_remember 
	change ve_weather_effects_remember_CurRainIntensity = ($CurRainIntensity)
	change ve_weather_effects_remember_CurRainPuddlesIntensity = ($currainpuddlesintensity)
	change ve_weather_effects_remember_CurRainLightingIntensity = ($CurRainLightingIntensity)
	change ve_weather_effects_remember_CurTOD = ($currenttodsettings)
endscript

script ve_weather_effects_clear 
	ve_clear_non_env_effects viewport = <viewport>
	tod_proxim_update_lightfx fxparam = (($ve_weather_effects_remember_CurTOD).tod) time = 0.05
	Rain_Do_Rain_Transition i = ($ve_weather_effects_remember_CurRainIntensity) time = 0
	Rain_Do_Puddles_Transition i = ($ve_weather_effects_remember_CurRainPuddlesIntensity) time = 0
	Rain_Do_Lighting_Transition i = ($ve_weather_effects_remember_CurRainLightingIntensity) time = 0
	killspawnedscript \{id = Rain_Transition}
endscript

script ve_clear_non_env_effects 
	screenfx_clearfxinstances {
		viewport = <viewport>
		exception_list = [global_brightness todDOFFX todFogFX todPMBloomFX todIntBloomFX todBS1FX todVignetteFX]
	}
endscript
