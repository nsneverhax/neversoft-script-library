Default_TOD_Manager = default_tod_manager_bloomoff
default_tod_manager_bl_test_all = {
	screen_FX = [
		{
			time = 0
			Type = Simple_Bloom
			On = 1
			Bloom1 = 2.0
			Bloom2 = 1.8499999
			bloom_type = cutoff_bloom
			Strength = 1.0
			cutoff_type = saturate_cutoff
			Color = [
				25
				25
				25
			]
			scefName = sbloom
		}
	]
}
0xa8b72bc2 = {
	screen_FX = [
		{
			time = 0
			Type = Simple_Bloom
			On = 1
			Bloom1 = 2.0
			Bloom2 = 1.4
			bloom_type = cutoff_bloom
			Strength = 1.0
			cutoff_type = saturate_cutoff
			Color = [
				15
				15
				15
			]
			scefName = sbloom
		}
	]
}
0xffcf0d97 = {
	screen_FX = [
		{
			time = 0
			Type = Simple_Bloom
			On = 1
			Bloom1 = 2.0
			Bloom2 = 1.1700001
			bloom_type = cutoff_bloom
			Strength = 1.0
			cutoff_type = saturate_cutoff
			Color = [
				35
				35
				35
			]
			scefName = sbloom
		}
	]
}
0xda6255da = {
	screen_FX = [
		{
			time = 0
			Type = Simple_Bloom
			On = 1
			Bloom1 = 1.9
			Bloom2 = 1.1
			bloom_type = cutoff_bloom
			Strength = 1.0
			cutoff_type = saturate_cutoff
			Color = [
				30
				30
				30
			]
			scefName = sbloom
		}
	]
}
0x549a0476 = {
	screen_FX = [
		{
			time = 0
			Type = Simple_Bloom
			On = 1
			Bloom1 = 1.7
			Bloom2 = 1.0
			bloom_type = cutoff_bloom
			Strength = 1.0
			cutoff_type = saturate_cutoff
			Color = [
				27
				27
				27
			]
			scefName = sbloom
		}
	]
}
0x1ec83eac = {
	screen_FX = [
		{
			time = 0
			Type = Simple_Bloom
			On = 1
			Bloom1 = 1.0
			Bloom2 = 0.8
			bloom_type = cutoff_bloom
			Strength = 1.0
			cutoff_type = saturate_cutoff
			Color = [
				25
				25
				25
			]
			scefName = sbloom
		}
	]
}
0x7436c1f6 = {
	screen_FX = [
		{
			time = 0
			Type = Simple_Bloom
			On = 1
			Bloom1 = 1.0
			Bloom2 = 0.75
			bloom_type = 0x153dbb65
			Strength = 1.0
			cutoff_type = saturate_cutoff
			Color = [
				30
				30
				30
			]
			scefName = sbloom
		}
	]
}
default_tod_manager_bl_other = {
	screen_FX = [
		{
			time = 0
			Type = Simple_Bloom
			On = 1
			Bloom1 = 1.0
			Bloom2 = 1.0
			bloom_type = 0x153dbb65
			Strength = 1.0
			cutoff_type = saturate_cutoff
			Color = [
				25
				25
				25
			]
			scefName = sbloom
		}
	]
}
default_tod_manager_bloomblur = {
	screen_FX = [
		{
			time = 0
			Type = Simple_Bloom
			On = 1
			Bloom1 = 3.0
			Bloom2 = 0.8
			bloom_type = cutoff_bloom
			Strength = 1.0
			cutoff_type = saturate_cutoff
			Color = [
				10
				10
				10
			]
			scefName = sbloom
		}
	]
}
default_tod_manager_bloomnoblur = {
	screen_FX = [
		{
			time = 0
			Type = Simple_Bloom
			On = 1
			Bloom1 = 3.0
			Bloom2 = 0.8
			bloom_type = cutoff_bloom
			Strength = 1.0
			cutoff_type = saturate_cutoff
			Color = [
				10
				10
				10
			]
			scefName = sbloom
		}
	]
}
default_tod_manager_bloomoff = {
	screen_FX = [
		{
			time = 0
			Type = Simple_Bloom
			FallOff1 = 5
			Bloom2 = 1.0
			On = 0
			DistanceMod = 0.0
			MaterialFilter = 1
			bloom_type = cutoff_bloom
			cutoff_type = saturate_cutoff
			Strength = 0.0
			scefName = sbloom
			Color = [
				10
				10
				10
			]
			FallOff2 = 0.0
			AutoLuminanceMod = 0
			Bloom1 = 1.0
		}
	]
}
default_tod_manager_freestyle = {
	screen_FX = [
		{
			time = 0
			Type = Simple_Bloom
			On = 1
			Bloom1 = 3.0
			Bloom2 = 0.8
			bloom_type = cutoff_bloom
			Strength = 1.0
			cutoff_type = saturate_cutoff
			Color = [
				10
				10
				10
			]
			scefName = sbloom
		}
	]
}
dof_car_accl_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.5
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_armaccl_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 4
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0025000002
			Strength = 1.0
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_main_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.5
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_sel_drums_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.5
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_sel_drumsticks_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.5
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_sel_glasses_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 4
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_sel_guitar_hardware_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.5
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_sel_guitar_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.5
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_sel_instr_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.5
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_sel_microphone_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.5
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0025000002
			Strength = 1.0
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_sel_micstand_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.01
			Strength = 1.0
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_sel_tat_l_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 4
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0075000003
			Strength = 1.0
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_sel_tat_r_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 4
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0075000003
			Strength = 1.0
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_selchar_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.5
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_select_far_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 3
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.01
			Strength = 1.0
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_select_fshoes_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 4
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.005
			Strength = 1.0
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_select_mshoes_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 4
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.005
			Strength = 1.0
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_selecttorso_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.5
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_car_selgender_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.5
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_cu_b01_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.6
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
DOF_CloseUp01_TOD_Manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.6
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
DOF_CloseUp02_TOD_Manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.6
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
DOF_CloseUp03_TOD_Manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.6
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_closeup04_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.6
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_endsongblur_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.002
			Strength = 0.6
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_l_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.07
			Strength = 1
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_el_f01_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 4
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.08
		}
	]
}
dof_el_f02_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 4
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.9
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.13
		}
	]
}
dof_el_f03_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 4
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 1.0
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.18
		}
	]
}
dof_long01_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.4
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.06
		}
	]
}
dof_mainmenublur_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.052500002
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_m_b01_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.025
			Strength = 0.6
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
DOF_Medium01_TOD_Manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 1.5
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.025
			Strength = 0.5
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_m_b02_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.03
			Strength = 0.6
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
DOF_Medium02_TOD_Manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 3
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.03
			Strength = 0.6
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
DOF_Off_TOD_Manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 0
			BlurResolution = 2
			BackDist = 1
			Strength = 0
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_stage01_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 3
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.03
			Strength = 0.6
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
DOF_Temp_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.1
			Strength = 0.3
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_uiblur_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.012
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_slight_near_1_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 3
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.03
			Strength = 0.6
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_venue_mid_1_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.4
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.06
		}
	]
}
dof_l_f03_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 3
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.06
		}
	]
}
dof_subway_audience_1_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.5
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.05
		}
	]
}
dof_cu_b02_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.01
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_slight_near_3_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.01
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_subway_audience_3_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.5
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.05
		}
	]
}
dof_cu_b03_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.5
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_moment1_1_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2.5
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.015
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_orbit_1_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.05
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_ecu_b01_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 3
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0025000002
			Strength = 1.0
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_guitar_solo_1_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 3
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0025000002
			Strength = 1.0
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_guitar_solo_2_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 3
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0025000002
			Strength = 1.0
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
dof_m_f01_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.015
		}
	]
}
dof_m_f02_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.025
		}
	]
}
dof_slight_near_2_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 3
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.6
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.025
		}
	]
}
dof_l_f02_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.04
		}
	]
}
dof_across_stage_1_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.04
		}
	]
}
dof_l_f01_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.03
		}
	]
}
dof_across_stage_2_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.03
		}
	]
}
dof_slight_near_6_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.03
		}
	]
}
dof_slight_near_4_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.03
		}
	]
}
dof_slight_near_5_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 2
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.0
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.03
		}
	]
}
z_mexicocity_dof_midshot02_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.55
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
z_mexicocity_dof_generic_stage_shot_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.07
			Strength = 1
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
z_mexicocity_dof_midshot_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.1
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
z_lhc_dof_midshot_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.1
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
z_lhc_dof_midshot02_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.1
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
z_lhc_dof_generic_stage_shot_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.07
			Strength = 1
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
z_lhc_dof_audience_r_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.55
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
z_lhc_dof_vert_front01_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.1
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
z_lhc_dof_noband_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.1
			Strength = 0.7
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
gigroom_section02_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.052500002
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
gigroom_section03_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.052500002
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
gigroom_section04_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.052500002
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
gigroom_section05_tod_manager = {
	screen_FX = [
		{
			vdivs = 0
			order = 0
			time = 0
			Type = DOF
			BlurRadius = 0
			crossfade = 0
			udivs = 0
			On = 1
			BlurResolution = 2
			BackDist = 0.052500002
			Strength = 0.8
			scefName = DOF
			frontcolor = (0.0, 0.0, 0.0)
			backcolor = (0.0, 0.0, 0.0)
			FrontDist = 0.0
		}
	]
}
grain_off_tod_manager = {
	screen_FX = [
		{
			Type = noise
			Intensity = 0.0
			doffilter = 0
			On = 0
			scefName = noise
		}
	]
}
grain_on_dof_tod_manager = {
	screen_FX = [
		{
			Type = noise
			Intensity = 1.0
			doffilter = 1
			On = 1
			scefName = noise
		}
	]
}
grain_on_tod_manager = {
	screen_FX = [
		{
			Type = noise
			Intensity = 1.0
			doffilter = 0
			On = 1
			scefName = noise
		}
	]
}
ScreenFlash_tod_manager = {
	screen_FX = [
		{
			Red_Mix = [
				1
				0
				0
			]
			Type = Bright_Sat
			Saturation = 1
			Brightness = 2.5
			Blue_Mix = [
				0
				0
				1
			]
			On = 1
			Hue = 1
			Green_Mix = [
				0
				1
				0
			]
			Contrast = 0.6
			scefName = BS
		}
	]
}
ScreenToBlack_tod_manager = {
	screen_FX = [
		{
			Outer_Radius = 1.5
			Type = Vignette
			inner_radius = 1.0
			alpha = 0
			On = 1
			scefName = VG
		}
	]
}
