worst_user_cap_entry = {
	texture = `tex/models/Characters/Skater_Male/Decals/CAG_PrimitiveShape_009`
	Color = red_orange_1
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
	base_tex = `tex\models\CAR_Instruments\Bass\cab_body_b1a_d_mls`
	material = CAB_Body_Arcos_Primary
	diffuse
	layers = [
	]
}
worst_cap_preset_entry = {
	base_tex = `tex\models\CAR_Instruments\Bass\cab_body_b1a_d_mls`
	material = CAB_Body_Arcos_Primary
	diffuse
	pre_layer = [
		{
			texture = `tex/models/Characters/Layers/CAB/CAB_Body_ARKS_Pale`
			flags = 4
			Color = Black_1guitar
		}
	]
}
worst_bones_entry = {
	HeadSize = -0.93299997
	FaceFullness = 0.4
	JawScale = 0.5
	ChinSize = 0.661
	CheekboneShape = 0.82199997
	NoseSize = 0.0
	NosePosition = 0.0
	NoseBridge = 0.5
	NoseTip = 0.6
	MouthAngle = 0.2
	MouthDepth = 0.4
	MouthPosition = 0.6
	LowerLipThickness = 0.047
	MouthScale = 0.2
	LipShape = 0.2
	EyeAngle = 0.7
	EyeScale = 0.3
	EyeDistance = 0.5
	EyeShape = 0.5
	EyePosition = 0.2
	BrowPosition = 0.4
	EyebrowAngle = 0.0
	EyebrowShape = 0.9
	BrowDepth = 0.2
	EyebrowDistance = 0.2
	EyeDepth = 0.6
	UpperLipThickness = 0.5
}
worst_additional_bone_entry = [
	{
		bone = Bone_Neck
		scaling = {
			value = (0.25, 0.25, 0.25)
			no_propagate
		}
	}
	{
		bone = Bone_Chest
		scaling = {
			value = (0.1, 0.4, 0.4)
			no_propagate
		}
	}
	{
		bone = Bone_Stomach_Upper
		scaling = {
			value = (0.1, 0.25, 0.25)
			no_propagate
		}
	}
	{
		bone = Bone_Stomach_Lower
		scaling = {
			value = (0.1, 0.25, 0.15)
			no_propagate
		}
	}
	{
		bone = Bone_Collar_R
		scaling = {
			value = (0.2, 0.2, 0.2)
			no_propagate
		}
		translation = {
			value = (0.0, 0.0, -0.07)
		}
	}
	{
		bone = Bone_Collar_L
		scaling = {
			value = (0.2, 0.2, 0.2)
			no_propagate
		}
		translation = {
			value = (0.0, 0.0, 0.07)
		}
	}
	{
		bone = Bone_Twist_Bicep_Top_R
		scaling = {
			value = (0.0, 0.65000004, 0.5)
			no_propagate
		}
	}
	{
		bone = Bone_Twist_Bicep_Mid_R
		scaling = {
			value = (0.0, 0.65000004, 0.5)
			no_propagate
		}
	}
	{
		bone = Bone_Bicep_R
		scaling = {
			value = (0.0, 0.65000004, 0.5)
			no_propagate
		}
	}
	{
		bone = Bone_Twist_Bicep_Top_L
		scaling = {
			value = (0.0, 0.65000004, 0.5)
			no_propagate
		}
	}
	{
		bone = Bone_Twist_Bicep_Mid_L
		scaling = {
			value = (0.0, 0.65000004, 0.5)
			no_propagate
		}
	}
	{
		bone = Bone_Bicep_L
		scaling = {
			value = (0.0, 0.65000004, 0.5)
			no_propagate
		}
	}
	{
		bone = Bone_Forearm_L
		scaling = {
			value = (0.0, 0.5, 0.35000002)
			no_propagate
		}
	}
	{
		bone = Bone_Forearm_R
		scaling = {
			value = (0.0, 0.5, 0.35000002)
			no_propagate
		}
	}
	{
		bone = Bone_Palm_L
		scaling = {
			value = (0.0, 0.3, 0.3)
		}
	}
	{
		bone = Bone_Palm_R
		scaling = {
			value = (0.0, 0.3, 0.3)
		}
	}
	{
		bone = Bone_Ankle_R
		scaling = {
			value = (0.13, 0.0, 0.3)
		}
	}
	{
		bone = Bone_Ankle_L
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
		part = CAS_Body
		custom_cap_sections = 4
		cap_preset_layers = 2
		bones = true
		chosen_materials = 2
	}
	{
		part = CAS_Male_Physique
		additional_bones = true
	}
	{
		part = CAS_Eyes
	}
	{
		part = CAS_Male_Hair
		chosen_materials = 2
	}
	{
		part = CAS_Male_Hat_Hair
		chosen_materials = 2
	}
	{
		part = CAS_Male_Facial_Hair
		chosen_materials = 2
	}
	{
		part = CAS_Male_Hat
		chosen_materials = 2
	}
	{
		part = CAS_Male_Torso
		custom_cap_sections = 1
		chosen_materials = 2
	}
	{
		part = CAS_Male_Legs
		chosen_materials = 2
	}
	{
		part = CAS_Male_Shoes
		chosen_materials = 2
	}
	{
		part = CAS_Male_Acc_Left
		chosen_materials = 2
	}
	{
		part = CAS_Male_Acc_Right
		chosen_materials = 2
	}
	{
		part = CAS_Male_Acc_Face
		chosen_materials = 2
	}
	{
		part = CAS_Male_Acc_Ears
		chosen_materials = 2
	}
	{
		part = CAS_Male_Age
	}
	{
		part = CAS_Male_Teeth
	}
]
worst_preset_defs = [
	{
		part = CAS_Male_Hair
		chosen_materials = 2
	}
	{
		part = CAS_Male_Hat_Hair
		chosen_materials = 2
	}
	{
		part = CAS_Male_Facial_Hair
		chosen_materials = 2
	}
	{
		part = CAS_Male_Hat
		chosen_materials = 2
	}
	{
		part = CAS_Male_Torso
		custom_cap_sections = 1
		chosen_materials = 2
	}
	{
		part = CAS_Male_Legs
		chosen_materials = 2
	}
	{
		part = CAS_Male_Shoes
		chosen_materials = 2
	}
	{
		part = CAS_Male_Acc_Left
		chosen_materials = 2
	}
	{
		part = CAS_Male_Acc_Right
		chosen_materials = 2
	}
	{
		part = CAS_Male_Acc_Face
		chosen_materials = 2
	}
	{
		part = CAS_Male_Acc_Ears
		chosen_materials = 2
	}
	{
		part = CAS_Male_Age
	}
	{
		part = CAS_Male_Teeth
	}
]
worst_guitar_defs = [
	{
		part = CAS_Guitar_Body
		custom_cap_sections = 1
		cap_preset_layers = 2
		chosen_materials = 2
	}
	{
		part = CAS_Guitar_Neck
		cap_preset_layers = 2
		chosen_materials = 2
	}
	{
		part = CAS_Guitar_Head
		custom_cap_sections = 1
		cap_preset_layers = 2
		chosen_materials = 2
	}
	{
		part = CAS_Guitar_Pickguards
		cap_preset_layers = 1
		chosen_materials = 2
	}
	{
		part = CAS_Guitar_Bridges
		chosen_materials = 2
	}
	{
		part = CAS_Guitar_Knobs
		chosen_materials = 2
	}
	{
		part = CAS_Guitar_Pickups
		chosen_materials = 2
	}
	{
		part = CAS_Guitar_Strings
	}
]
worst_bass_defs = [
	{
		part = CAS_Bass_Body
		custom_cap_sections = 1
		cap_preset_layers = 2
		chosen_materials = 2
	}
	{
		part = CAS_Bass_Neck
		cap_preset_layers = 2
		chosen_materials = 2
	}
	{
		part = CAS_Bass_Head
		custom_cap_sections = 1
		cap_preset_layers = 2
		chosen_materials = 2
	}
	{
		part = CAS_Bass_Pickguards
		cap_preset_layers = 1
		chosen_materials = 2
	}
	{
		part = CAS_bass_Bridges
		chosen_materials = 2
	}
	{
		part = CAS_Bass_Knobs
		chosen_materials = 2
	}
	{
		part = CAS_Bass_Pickups
		chosen_materials = 2
	}
	{
		part = CAS_Bass_Strings
	}
]
worst_drum_defs = [
	{
		part = CAS_Drums
		custom_cap_sections = 1
		cap_preset_layers = 2
		chosen_materials = 2
	}
	{
		part = CAS_Drums_Sticks
		chosen_materials = 2
	}
]
worst_vocals_defs = [
	{
		part = CAS_Mic
		chosen_materials = 2
	}
	{
		part = CAS_Mic_Stand
		chosen_materials = 2
	}
]
worst_logo_defs = [
	{
		part = CAS_BAND_LOGO
		custom_cap_sections = 1
	}
]
worst_entry_global = {
}

script generate_worst_cas_struct 
	RequireParams \{[
			defs
		]
		all}
	Change \{worst_entry_global = {
		}}
	ForEachIn <defs> do = generate_worst_cas_struct_foreach
	cas_struct = ($worst_entry_global)
	Change \{worst_entry_global = {
		}}
	return cas_struct = <cas_struct>
endscript

script generate_worst_cas_struct_foreach 
	struct = ($worst_entry_global)
	new_entry = {
		desc_id = AxelHighway
	}
	if GotParam \{chosen_materials}
		newstruct = {}
		i = 0
		begin
		FormatText checksumname = Field 'material%d' d = (<i> + 1)
		UpdateStructElement struct = <newstruct> element = <Field> value = green_1
		i = (<i> + 1)
		repeat <chosen_materials>
		new_entry = {
			<new_entry>
			chosen_materials = <newstruct>
		}
	endif
	if GotParam \{bones}
		new_entry = {
			<new_entry>
			bones = ($worst_bones_entry)
		}
	endif
	if GotParam \{additional_bones}
		new_entry = {
			<new_entry>
			bones = ($worst_additional_bone_entry)
		}
	endif
	array = []
	if GotParam \{cap_preset_layers}
		i = 0
		begin
		AddArrayElement array = <array> element = ($worst_cap_preset_entry)
		i = (<i> + 1)
		repeat <cap_preset_layers>
	endif
	if GotParam \{custom_cap_sections}
		i = 0
		begin
		cas_generate_worst_user_cap layers = ($max_cap_layers)
		AddArrayElement array = <array> element = <user_cap>
		i = (<i> + 1)
		repeat <custom_cap_sections>
	endif
	GetArraySize <array>
	if (<array_size> > 0)
		new_entry = {
			<new_entry>
			CAP = <array>
		}
	endif
	new_entry = {
		<new_entry>
		name = ($worst_car_loc_string_name)
	}
	AppendStruct struct = struct Field = <part> params = <new_entry>
	Change worst_entry_global = <struct>
endscript

script cas_generate_worst_user_cap 
	array = []
	i = 0
	begin
	AddArrayElement array = <array> element = ($worst_user_cap_entry)
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
	GetArraySize \{$Preset_Musician_Profiles_Modifiable}
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
	GetWriteToBufferSize struct = <cas_struct> lzss
	buffer_size_lzss = <buffer_size>
	GetWriteToBufferSize struct = <cas_struct>
	GetComponentUsage struct = <cas_struct>
	components_used = (<components_used> * <num>)
	structs_used = (<structs_used> * <num>)
	arrays_used = (<arrays_used> * <num>)
	vectors_used = (<vectors_used> * <num>)
	buffer_size_single = <buffer_size>
	buffer_size = (<buffer_size> * <num>)
	buffer_size_lzss_single = <buffer_size_lzss>
	buffer_size_lzss = (<buffer_size_lzss> * <num>)
	printf '%s,%x,%a,%b,%c,%d,%e,%f,%g,%h' s = <name> x = <num> a = <components_used> b = <structs_used> c = <arrays_used> d = <vectors_used> e = <buffer_size> f = <buffer_size_single> g = <buffer_size_lzss> H = <buffer_size_lzss_single>
endscript
