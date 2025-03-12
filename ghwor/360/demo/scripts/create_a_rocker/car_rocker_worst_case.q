worst_user_cap_entry = {
	texture = `tex/models/characters/skater_male/decals/cag_primitiveshape_009`
	color = red_orange_1
	a = 70
	x_trans = -22
	y_trans = 17
	x_skew = -18
	y_skew = -39
	x_scale = 21
	y_scale = 50
	rot = 3783
	flags = 3
}
worst_car_loc_string_name = qs(0xcc00d2c0)
worst_user_cap_entry_base = {
	base_tex = `tex\models\car_instruments\bass\cab_body_b1a_d_mls`
	layers = [
	]
}
worst_cap_preset_entry = {
	base_tex = `tex\models\car_instruments\bass\cab_body_b1a_d_mls`
	pre_layer = [
		{
			texture = `tex/models/characters/layers/cab/cab_body_arks_pale`
			flags = 4
			color = black_1guitar
		}
	]
}
worst_bones_entry = {
	headsize = -0.93299997
	facefullness = 0.4
	jawscale = 0.5
	chinsize = 0.661
	cheekboneshape = 0.82199997
	nosesize = 0.0
	noseposition = 0.0
	nosebridge = 0.5
	nosetip = 0.6
	mouthangle = 0.2
	mouthdepth = 0.4
	mouthposition = 0.6
	lowerlipthickness = 0.047
	mouthscale = 0.2
	lipshape = 0.2
	eyeangle = 0.7
	eyescale = 0.3
	eyedistance = 0.5
	eyeshape = 0.5
	eyeposition = 0.2
	browposition = 0.4
	eyebrowangle = 0.0
	eyebrowshape = 0.9
	browdepth = 0.2
	eyebrowdistance = 0.2
	eyedepth = 0.6
	upperlipthickness = 0.5
}
worst_additional_bone_entry = [
	{
		bone = bone_neck
		scaling = {
			value = (0.25, 0.25, 0.25)
			no_propagate
		}
	}
	{
		bone = bone_chest
		scaling = {
			value = (0.1, 0.4, 0.4)
			no_propagate
		}
	}
	{
		bone = bone_stomach_upper
		scaling = {
			value = (0.1, 0.25, 0.25)
			no_propagate
		}
	}
	{
		bone = bone_stomach_lower
		scaling = {
			value = (0.1, 0.25, 0.15)
			no_propagate
		}
	}
	{
		bone = bone_collar_r
		scaling = {
			value = (0.2, 0.2, 0.2)
			no_propagate
		}
		translation = {
			value = (0.0, 0.0, -0.07)
		}
	}
	{
		bone = bone_collar_l
		scaling = {
			value = (0.2, 0.2, 0.2)
			no_propagate
		}
		translation = {
			value = (0.0, 0.0, 0.07)
		}
	}
	{
		bone = bone_twist_bicep_top_r
		scaling = {
			value = (0.0, 0.65000004, 0.5)
			no_propagate
		}
	}
	{
		bone = bone_twist_bicep_mid_r
		scaling = {
			value = (0.0, 0.65000004, 0.5)
			no_propagate
		}
	}
	{
		bone = bone_bicep_r
		scaling = {
			value = (0.0, 0.65000004, 0.5)
			no_propagate
		}
	}
	{
		bone = bone_twist_bicep_top_l
		scaling = {
			value = (0.0, 0.65000004, 0.5)
			no_propagate
		}
	}
	{
		bone = bone_twist_bicep_mid_l
		scaling = {
			value = (0.0, 0.65000004, 0.5)
			no_propagate
		}
	}
	{
		bone = bone_bicep_l
		scaling = {
			value = (0.0, 0.65000004, 0.5)
			no_propagate
		}
	}
	{
		bone = bone_forearm_l
		scaling = {
			value = (0.0, 0.5, 0.35000002)
			no_propagate
		}
	}
	{
		bone = bone_forearm_r
		scaling = {
			value = (0.0, 0.5, 0.35000002)
			no_propagate
		}
	}
	{
		bone = bone_palm_l
		scaling = {
			value = (0.0, 0.3, 0.3)
		}
	}
	{
		bone = bone_palm_r
		scaling = {
			value = (0.0, 0.3, 0.3)
		}
	}
	{
		bone = bone_ankle_r
		scaling = {
			value = (0.13, 0.0, 0.3)
		}
	}
	{
		bone = bone_ankle_l
		scaling = {
			value = (0.13, 0.0, 0.3)
		}
	}
]
worst_chosen_materials_entry = {
	material1 = green_1
	material2 = grey_2
}
worst_car_defs = [
	{
		part = cas_body
		custom_cap_sections = 4
		cap_preset_layers = 2
		bones = true
		chosen_materials = 2
	}
	{
		part = cas_male_physique
		additional_bones = true
	}
	{
		part = cas_eyes
	}
	{
		part = cas_male_hair
		chosen_materials = 2
	}
	{
		part = cas_male_hat_hair
		chosen_materials = 2
	}
	{
		part = cas_male_facial_hair
		chosen_materials = 2
	}
	{
		part = cas_male_hat
		chosen_materials = 2
	}
	{
		part = cas_male_torso
		custom_cap_sections = 1
		chosen_materials = 2
	}
	{
		part = cas_male_legs
		chosen_materials = 2
	}
	{
		part = cas_male_shoes
		chosen_materials = 2
	}
	{
		part = cas_male_acc_left
		chosen_materials = 2
	}
	{
		part = cas_male_acc_right
		chosen_materials = 2
	}
	{
		part = cas_male_acc_face
		chosen_materials = 2
	}
	{
		part = cas_male_acc_ears
		chosen_materials = 2
	}
	{
		part = cas_male_age
	}
	{
		part = cas_male_teeth
	}
]
worst_preset_defs = [
	{
		part = cas_male_hair
		chosen_materials = 2
	}
	{
		part = cas_male_hat_hair
		chosen_materials = 2
	}
	{
		part = cas_male_facial_hair
		chosen_materials = 2
	}
	{
		part = cas_male_hat
		chosen_materials = 2
	}
	{
		part = cas_male_torso
		custom_cap_sections = 1
		chosen_materials = 2
	}
	{
		part = cas_male_legs
		chosen_materials = 2
	}
	{
		part = cas_male_shoes
		chosen_materials = 2
	}
	{
		part = cas_male_acc_left
		chosen_materials = 2
	}
	{
		part = cas_male_acc_right
		chosen_materials = 2
	}
	{
		part = cas_male_acc_face
		chosen_materials = 2
	}
	{
		part = cas_male_acc_ears
		chosen_materials = 2
	}
	{
		part = cas_male_age
	}
	{
		part = cas_male_teeth
	}
]
worst_guitar_defs = [
	{
		part = cas_guitar_body
		custom_cap_sections = 1
		cap_preset_layers = 2
		chosen_materials = 2
	}
	{
		part = cas_guitar_neck
		cap_preset_layers = 2
		chosen_materials = 2
	}
	{
		part = cas_guitar_head
		custom_cap_sections = 1
		cap_preset_layers = 2
		chosen_materials = 2
	}
	{
		part = cas_guitar_pickguards
		cap_preset_layers = 1
		chosen_materials = 2
	}
	{
		part = cas_guitar_bridges
		chosen_materials = 2
	}
	{
		part = cas_guitar_knobs
		chosen_materials = 2
	}
	{
		part = cas_guitar_pickups
		chosen_materials = 2
	}
	{
		part = cas_guitar_strings
	}
]
worst_bass_defs = [
	{
		part = cas_bass_body
		custom_cap_sections = 1
		cap_preset_layers = 2
		chosen_materials = 2
	}
	{
		part = cas_bass_neck
		cap_preset_layers = 2
		chosen_materials = 2
	}
	{
		part = cas_bass_head
		custom_cap_sections = 1
		cap_preset_layers = 2
		chosen_materials = 2
	}
	{
		part = cas_bass_pickguards
		cap_preset_layers = 1
		chosen_materials = 2
	}
	{
		part = cas_bass_bridges
		chosen_materials = 2
	}
	{
		part = cas_bass_knobs
		chosen_materials = 2
	}
	{
		part = cas_bass_pickups
		chosen_materials = 2
	}
	{
		part = cas_bass_strings
	}
]
worst_drum_defs = [
	{
		part = cas_drums
		custom_cap_sections = 1
		cap_preset_layers = 2
		chosen_materials = 2
	}
	{
		part = cas_drums_sticks
		chosen_materials = 2
	}
]
worst_vocals_defs = [
	{
		part = cas_mic
		chosen_materials = 2
	}
	{
		part = cas_mic_stand
		chosen_materials = 2
	}
]
worst_logo_defs = [
	{
		part = cas_band_logo
		custom_cap_sections = 1
	}
]
worst_entry_global = {
}

script generate_worst_cas_struct 
	requireparams \{[
			defs
		]
		all}
	change \{worst_entry_global = {
		}}
	foreachin <defs> do = generate_worst_cas_struct_foreach
	cas_struct = ($worst_entry_global)
	change \{worst_entry_global = {
		}}
	return cas_struct = <cas_struct>
endscript

script generate_worst_cas_struct_foreach 
	struct = ($worst_entry_global)
	new_entry = {
		desc_id = axelhighway
	}
	if gotparam \{chosen_materials}
		newstruct = {}
		i = 0
		begin
		formattext checksumname = field 'material%d' d = (<i> + 1)
		updatestructelement struct = <newstruct> element = <field> value = green_1
		i = (<i> + 1)
		repeat <chosen_materials>
		new_entry = {
			<new_entry>
			chosen_materials = <newstruct>
		}
	endif
	if gotparam \{bones}
		new_entry = {
			<new_entry>
			bones = ($worst_bones_entry)
		}
	endif
	if gotparam \{additional_bones}
		new_entry = {
			<new_entry>
			bones = ($worst_additional_bone_entry)
		}
	endif
	array = []
	if gotparam \{cap_preset_layers}
		i = 0
		begin
		addarrayelement array = <array> element = ($worst_cap_preset_entry)
		i = (<i> + 1)
		repeat <cap_preset_layers>
	endif
	if gotparam \{custom_cap_sections}
		i = 0
		begin
		cas_generate_worst_user_cap layers = ($max_cap_layers)
		addarrayelement array = <array> element = <user_cap>
		i = (<i> + 1)
		repeat <custom_cap_sections>
	endif
	getarraysize <array>
	if (<array_size> > 0)
		new_entry = {
			<new_entry>
			cap = <array>
		}
	endif
	new_entry = {
		<new_entry>
		name = ($worst_car_loc_string_name)
	}
	appendstruct struct = struct field = <part> params = <new_entry>
	change worst_entry_global = <struct>
endscript

script cas_generate_worst_user_cap 
	array = []
	i = 0
	begin
	addarrayelement array = <array> element = ($worst_user_cap_entry)
	i = (<i> + 1)
	repeat <layers>
	return user_cap = {($worst_user_cap_entry_base) layers = <array>}
endscript

script generate_worst_cas_struct_car 
	worst = {}
	generate_worst_cas_struct \{defs = $worst_car_defs}
	worst = {<worst> <cas_struct>}
	generate_worst_cas_struct \{defs = $worst_guitar_defs}
	worst = {<worst> <cas_struct>}
	generate_worst_cas_struct \{defs = $worst_bass_defs}
	worst = {<worst> <cas_struct>}
	generate_worst_cas_struct \{defs = $worst_drum_defs}
	worst = {<worst> <cas_struct>}
	generate_worst_cas_struct \{defs = $worst_vocals_defs}
	worst = {<worst> <cas_struct>}
	return cas_struct = <worst>
endscript

script generate_worst_cas_struct_preset 
	worst = {}
	generate_worst_cas_struct \{defs = $worst_preset_defs}
	worst = {<worst> <cas_struct>}
	generate_worst_cas_struct \{defs = $worst_guitar_defs}
	worst = {<worst> <cas_struct>}
	generate_worst_cas_struct \{defs = $worst_bass_defs}
	worst = {<worst> <cas_struct>}
	generate_worst_cas_struct \{defs = $worst_drum_defs}
	worst = {<worst> <cas_struct>}
	generate_worst_cas_struct \{defs = $worst_vocals_defs}
	worst = {<worst> <cas_struct>}
	return cas_struct = <worst>
endscript

script generate_worst_cas 
	printf \{''}
	printf \{'Name,Num,Components,Structs,Arrays,Vectors,WriteToBuffer,WriteToBufferSingle,WTBLZSS,WTBLZSSSingle'}
	generate_worst_cas_struct_car
	print_worst_cas cas_struct = <cas_struct> num = $max_num_create_a_rockers name = 'car'
	generate_worst_cas_struct_preset
	getarraysize \{$preset_musician_profiles_modifiable}
	print_worst_cas cas_struct = <cas_struct> num = <array_size> name = 'presetcar'
	generate_worst_cas_struct \{defs = $worst_guitar_defs}
	print_worst_cas cas_struct = <cas_struct> num = $max_num_instrument_saves name = 'guitar'
	generate_worst_cas_struct \{defs = $worst_bass_defs}
	print_worst_cas cas_struct = <cas_struct> num = $max_num_instrument_saves name = 'bass'
	generate_worst_cas_struct \{defs = $worst_drum_defs}
	print_worst_cas cas_struct = <cas_struct> num = $max_num_instrument_saves name = 'drum'
	generate_worst_cas_struct \{defs = $worst_vocals_defs}
	print_worst_cas cas_struct = <cas_struct> num = $max_num_instrument_saves name = 'vocals'
	generate_worst_cas_struct \{defs = $worst_logo_defs}
	print_worst_cas cas_struct = <cas_struct> num = $max_num_logo_saves name = 'logos'
	printf \{''}
	generate_worst_cas_struct_car
	print_worst_cas cas_struct = <cas_struct> num = 1 name = 'single car'
	printf \{''}
endscript

script print_worst_cas \{num = 1}
	getwritetobuffersize struct = <cas_struct> lzss
	buffer_size_lzss = <buffer_size>
	getwritetobuffersize struct = <cas_struct>
	getcomponentusage struct = <cas_struct>
	components_used = (<components_used> * <num>)
	structs_used = (<structs_used> * <num>)
	arrays_used = (<arrays_used> * <num>)
	vectors_used = (<vectors_used> * <num>)
	buffer_size_single = <buffer_size>
	buffer_size = (<buffer_size> * <num>)
	buffer_size_lzss_single = <buffer_size_lzss>
	buffer_size_lzss = (<buffer_size_lzss> * <num>)
	printf '%s,%x,%a,%b,%c,%d,%e,%f,%g,%h' s = <name> x = <num> a = <components_used> b = <structs_used> c = <arrays_used> d = <vectors_used> e = <buffer_size> f = <buffer_size_single> g = <buffer_size_lzss> h = <buffer_size_lzss_single>
endscript
