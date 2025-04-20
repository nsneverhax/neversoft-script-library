InAir_data = {
	struct = InAir_data
	base_anim = sk8_w_base_F
	takeoff_anim = Sk8_W_JumpIdleInto_F
	apex_anim = sk8_w_jumpidleair_F
	land_anim = sk8_w_jumpIdlePrepLand_F
	takeoff_blend_curve = [
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		1.0
		0.0
	]
	takeoff_blend_time = 0.9
	land_blend_curve = [
		1.0
		0.8
		0.5
		0.2
		0.0
	]
	land_blend_time = 0.5
	land_blend_max = 0.1
	blendduration = 0.05
}
InAir_slow_left_data = {
	struct = InAir_data
	base_anim = sk8_w_base_F
	takeoff_anim = Sk8_W_JumpInto_LF_xSlw_Fx
	apex_anim = sk8_w_jumpidleair_F
	land_anim = Sk8_W_JumpPrepLand_xSlw_Fx
	takeoff_blend_curve = [
		1.0
		0.0
	]
	takeoff_blend_time = 0.37
	land_blend_curve = [
		1.0
		0.2
		0.0
	]
	land_blend_time = 0.3
	land_blend_max = 0.1
	blendduration = 0.1
}
InAir_slow_right_data = {
	struct = InAir_data
	base_anim = sk8_w_base_F
	takeoff_anim = Sk8_W_JumpInto_RF_xSlw_Fx
	apex_anim = sk8_w_jumpidleair_F
	land_anim = Sk8_W_JumpPrepLand_xSlw_Fx
	takeoff_blend_curve = [
		1.0
		0.0
	]
	takeoff_blend_time = 0.37
	land_blend_curve = [
		1.0
		0.0
	]
	land_blend_time = 0.3
	land_blend_max = 0.1
	blendduration = 0.1
}
InAir_med_left_data = {
	struct = InAir_data
	base_anim = sk8_w_base_F
	takeoff_anim = Sk8_W_JumpInto_LF_xMed_Fx
	apex_anim = sk8_w_jumpidleair_F
	land_anim = Sk8_W_JumpPrepLand_xFst_Fx
	takeoff_blend_curve = [
		1.0
		0.0
	]
	takeoff_blend_time = 1.0
	land_blend_curve = [
		1.0
		0.0
	]
	land_blend_time = 0.3
	land_blend_max = 0.1
	blendduration = 0.1
}
InAir_med_right_data = {
	struct = InAir_data
	base_anim = sk8_w_base_F
	takeoff_anim = Sk8_W_JumpInto_RF_xMed_Fx
	apex_anim = sk8_w_jumpidleair_F
	land_anim = Sk8_W_JumpPrepLand_xFst_Fx
	takeoff_blend_curve = [
		1.0
		0.0
	]
	takeoff_blend_time = 1.0
	land_blend_curve = [
		1.0
		0.0
	]
	land_blend_time = 0.3
	land_blend_max = 0.1
	blendduration = 0.1
}
InAir_fast_right_data = {
	struct = InAir_data
	base_anim = sk8_w_base_F
	takeoff_anim = Sk8_W_JumpInto_RF_xFst_Fx
	apex_anim = sk8_w_jumpidleair_F
	land_anim = Sk8_W_JumpPrepLand_xFst_Fx
	takeoff_blend_curve = [
		1.0
		0.8
		0.0
	]
	takeoff_blend_time = 1.0
	land_blend_curve = [
		1.0
		0.0
	]
	land_blend_time = 0.3
	land_blend_max = 0.7
	blendduration = 0.1
}
InAir_fast_left_data = {
	struct = InAir_data
	base_anim = sk8_w_base_F
	takeoff_anim = Sk8_W_JumpInto_LF_xFst_Fx
	apex_anim = sk8_w_jumpidleair_F
	land_anim = Sk8_W_JumpPrepLand_xFst_Fx
	takeoff_blend_curve = [
		1.0
		0.8
		0.0
	]
	takeoff_blend_time = 1.5
	land_blend_curve = [
		1.0
		0.0
	]
	land_blend_time = 0.3
	land_blend_max = 0.7
	blendduration = 0.1
}
InAir_vault_data = {
	struct = InAir_data
	base_anim = sk8_w_base_F
	takeoff_anim = Sk8_W_VaultIdleAir_F
	apex_anim = Sk8_W_VaultIdleAir_F
	land_anim = Sk8_W_VaultPrepLand_F
	takeoff_blend_curve = [
		1.0
		0.2
		0.0
	]
	takeoff_blend_time = 0.5
	land_blend_curve = [
		1.0
		0.0
	]
	land_blend_time = 0.4
	land_blend_max = 0.7
	blendduration = 0.1
}
InAir_skate_to_air_data = {
	struct = InAir_data
	base_anim = Sk8_Ollie_Ollie_Base_F
	takeoff_anim = Sk8_W_SkToStndTO_F
	apex_anim = Sk8_W_SkToStndApx_F
	land_anim = Sk8_W_SkToStndLnd_F
	takeoff_blend_curve = [
		1.0
		0.0
	]
	takeoff_blend_time = 0.37
	land_blend_curve = [
		1.0
		0.0
	]
	land_blend_time = 0.01
	land_blend_max = 0.7
	blendduration = 0.1
	play_apex_once = 1
}
