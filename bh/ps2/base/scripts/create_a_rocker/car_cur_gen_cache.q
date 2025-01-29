0x1f144dea = [
]
0xd9ed6f85 = 4
0xa32e828a = {
}
0x44007ccb = {
	0x288ddb10 = [
		cas_torso_art
		cas_left_arm_art
		cas_right_arm_art
		cas_eye_makeup
		cas_lip_makeup
		cas_eyes
		cas_female_hair
		cas_female_hat_hair
		cas_male_facial_hair
		cas_male_hair
		cas_male_hat_hair
	]
	0x658a2d2c = [
		cas_female_torso
		cas_female_legs
		cas_female_shoes
		cas_female_acc_left
		cas_female_acc_right
		cas_female_acc_face
		cas_female_acc_ears
		cas_female_hair
		cas_female_hat_hair
		cas_female_hat
		cas_male_torso
		cas_male_legs
		cas_male_shoes
		cas_male_acc_left
		cas_male_acc_right
		cas_male_acc_face
		cas_male_acc_ears
		cas_male_hair
		cas_male_hat_hair
		cas_male_hat
	]
}

script 0xcd94e1bc 
	Change \{0x1f144dea = [
		]}
endscript

script 0xc4dfc41c 
	0x508a0517 <...>
	if NOT (<index> = -1)
		return 0x9c8a3b7a = ($0x1f144dea [<index>])
	endif
endscript

script 0x44a395ce 
	0x508a0517 <...>
	if (<index> = -1)
		RemoveParameter \{index}
		if GotParam \{0x1fe128af}
			RemoveParameter \{0x1fe128af}
			0x1ff90073 = {<...> ref_count = 0}
		else
			0x1ff90073 = {<...> ref_count = 1}
		endif
		AddArrayElement array = ($0x1f144dea) element = <0x1ff90073>
		Change 0x1f144dea = <array>
	else
		0x1ff90073 = ($0x1f144dea [<index>])
		if GotParam \{0x1fe128af}
			0x5eb1d8b0 = (<0x1ff90073>.ref_count)
		else
			0x5eb1d8b0 = (<0x1ff90073>.ref_count + 1)
		endif
		0x1ff90073 = {<0x1ff90073> ref_count = <0x5eb1d8b0>}
		SetArrayElement ArrayName = 0x1f144dea index = <index> NewValue = <0x1ff90073> globalarray ResolveGlobals = 0
	endif
endscript

script 0x51979d5e 
	0x508a0517 <...>
	if (<index> = -1)
		switch (<part_type>)
			case cas_body
			case cas_physique
			case cas_full_instrument
			return
			default
			0x8dbdaee4 \{qs(0x5dce1217)}
		endswitch
	else
		0x1ff90073 = ($0x1f144dea [<index>])
		0x5eb1d8b0 = ((<0x1ff90073>.ref_count) - 1)
		if (<0x5eb1d8b0> < 0)
			0x5eb1d8b0 = 0
		endif
		0x1ff90073 = {<0x1ff90073> ref_count = <0x5eb1d8b0>}
		SetArrayElement ArrayName = 0x1f144dea index = <index> NewValue = <0x1ff90073> globalarray ResolveGlobals = 0
	endif
	if GotParam \{0x4b1eab50}
		0xe30b16ca
	endif
endscript

script 0xbaf89f2d 
	resolvebodyspecificpartinappearance appearance = <appearance> part = <part_type>
	part_type = <part>
	if NOT GotParam \{desc_id}
		if StructureContains structure = <appearance> <part_type>
			desc_id = (<appearance>.<part_type>.desc_id)
		else
			0x93d8d5cf \{qs(0x9018370d)}
			return
		endif
	endif
	if getactualcasoptionstruct part = <part_type> desc_id = <desc_id>
		RemoveParameter \{appearance}
		RemoveParameter \{part}
		0x44a395ce <...>
		if NOT GotParam \{0x88fd222e}
			if GotParam \{add_to_nodes}
				0x219d4ef3 = <desc_id>
				0xc7e33433 = <add_to_nodes>
				GetArraySize <add_to_nodes>
				i = 0
				begin
				node_child_struct = (<0xc7e33433> [<i>])
				if GotParam \{0x1fe128af}
					0xbaf89f2d part_type = (<node_child_struct>.part_type) desc_id = (<node_child_struct>.desc_id) 0x1fe128af 0x88fd222e
				else
					0xbaf89f2d part_type = (<node_child_struct>.part_type) desc_id = (<node_child_struct>.desc_id) 0x88fd222e
				endif
				i = (<i> + 1)
				repeat <array_Size>
			endif
		endif
		if GotParam \{hat_hair}
			switch (<part_type>)
				case cas_male_hair
				case cas_male_hat
				part = cas_male_hat_hair
				case cas_female_hair
				case cas_female_hat
				part = cas_female_hat_hair
				default
				0x93d8d5cf \{qs(0xea6f7c2d)}
			endswitch
			if NOT (<hat_hair> = original_hair)
				0xcc05dce0 = 0
				if NOT load_part_desc_pak part_type = <part>
					0xcc05dce0 = 1
				endif
				if GotParam \{0x1fe128af}
					0xbaf89f2d part_type = <part> desc_id = <hat_hair> 0x1fe128af
				else
					0xbaf89f2d part_type = <part> desc_id = <hat_hair>
				endif
				if (<0xcc05dce0> = 1)
					unload_part_desc_pak part_type = <part>
				endif
			endif
		endif
	else
		0x93d8d5cf qs(0x0e84b604) a = <desc_id> b = <part_type>
	endif
endscript

script 0x4f3fed72 
	resolvebodyspecificpartinappearance appearance = <appearance> part = <part_type>
	if StructureContains structure = <appearance> <part>
		desc_id = (<appearance>.<part>.desc_id)
		0x51979d5e part_type = <part> desc_id = <desc_id>
	endif
endscript

script 0xfb4ec1d6 
	if 0xccaf9669 <...>
		begin
		if NOT 0x7f5001ce appearance = <appearance>
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	0xe71b17e8
endscript

script 0x4b6e50ba \{async = 0}
	if NOT GotParam \{0x9c8a3b7a}
		0xc4dfc41c part = <part> desc_id = <desc_id>
	endif
	if StructureContains structure = <0x9c8a3b7a> add_to_nodes
		PushAssetContext context = <asset_context>
		GetArraySize (<0x9c8a3b7a>.add_to_nodes)
		i = 0
		begin
		node_child_struct = (<0x9c8a3b7a>.add_to_nodes [<i>])
		if getactualcasoptionstruct part = (<node_child_struct>.part_type) desc_id = (<node_child_struct>.desc_id)
			if (<async> = 1)
				incrementpartpakloading
				LoadPak <pak> Heap = <Heap> load_callback = loadpartpak_done callback_data = None
			else
				LoadPak <pak> Heap = <Heap>
			endif
		endif
		i = (<i> + 1)
		repeat <array_Size>
		PopAssetContext
		return \{true}
	elseif StructureContains structure = <0x9c8a3b7a> pak
		pak = (<0x9c8a3b7a>.pak)
		PushAssetContext context = <asset_context>
		if (<async> = 1)
			incrementpartpakloading
			LoadPak <pak> Heap = <Heap> load_callback = loadpartpak_done callback_data = None
		else
			LoadPak <pak> Heap = <Heap>
		endif
		PopAssetContext
		return \{true}
	endif
	return \{FALSE}
endscript

script 0xfcdb12cb 
	if NOT GotParam \{0x9c8a3b7a}
		0xc4dfc41c part = <part> desc_id = <desc_id>
	endif
	if StructureContains structure = <0x9c8a3b7a> 0x74303e14
		GetArraySize (<0x9c8a3b7a>.0x74303e14)
		i = 0
		begin
		0xc04dade1 = (<0x9c8a3b7a>.0x74303e14 [<i>])
		if (<async> = 1)
			incrementpartpakunloading
			SpawnScriptLater unloadappearancepak_async params = {asset_context = <asset_context> pak = <0xc04dade1>}
		else
			PushAssetContext context = <asset_context>
			UnLoadPak <0xc04dade1>
			if NOT GotParam \{no_wait}
				WaitUnloadPak <0xc04dade1> Block
			endif
			PopAssetContext
		endif
		i = (<i> + 1)
		repeat <array_Size>
		return \{true}
	elseif StructureContains structure = <0x9c8a3b7a> pak
		pak = (<0x9c8a3b7a>.pak)
		if (<async> = 1)
			incrementpartpakunloading
			SpawnScriptLater unloadappearancepak_async params = {asset_context = <asset_context> pak = <pak>}
		else
			PushAssetContext context = <asset_context>
			UnLoadPak <pak>
			if NOT GotParam \{no_wait}
				WaitUnloadPak <pak> Block
			endif
			PopAssetContext
		endif
		return \{true}
	endif
endscript

script 0x39cf47f4 
	0x8dbdaee4 \{qs(0xc080aee1)}
	0xc245fbf7 = []
	GetArraySize ($0x1f144dea)
	if (<array_Size> < 1)
		0x8dbdaee4 \{qs(0x3de76e3b)}
		return
	endif
	i = 0
	begin
	0x1ff90073 = ($0x1f144dea [<i>])
	0x6eeda48a = 1
	if GotParam \{part_type}
		if NOT (<0x1ff90073>.part_type = <part_type>)
			0x6eeda48a = 0
		endif
	endif
	if GotParam \{desc_id}
		if NOT (<0x1ff90073>.desc_id = <desc_id>)
			0x6eeda48a = 0
		endif
	endif
	if (<0x6eeda48a> = 1)
		AddArrayElement array = <0xc245fbf7> element = <0x1ff90073>
		0xc245fbf7 = <array>
	endif
	i = (<i> + 1)
	repeat <array_Size>
	0xe6b61ea6 <0xc245fbf7>
endscript

script load_part_desc_pak \{Heap = heap_song}
	if NOT StructureContains structure = ($car_part_desc_paks) <part_type>
		0x8dbdaee4 qs(0x7f310966) a = <part_type>
		return \{true}
	endif
	temp_struct = ($car_part_desc_paks.<part_type>)
	if NOT StructureContains structure = <temp_struct> 0xe4313507
		temp_struct = {<temp_struct> 0xe4313507 = 0}
	endif
	if NOT (<temp_struct>.0xe4313507 = 1)
		PushAssetContext context = <Heap>
		LoadPak (<temp_struct>.pak) Heap = <Heap>
		PopAssetContext
		temp_struct = {<temp_struct> 0xe4313507 = 1 Heap = <Heap>}
		updatestructelement struct = $car_part_desc_paks element = <part_type> value = <temp_struct>
		Change car_part_desc_paks = <newstruct>
		return \{FALSE}
	endif
	return \{true}
endscript

script unload_part_desc_pak 
	if NOT StructureContains structure = ($car_part_desc_paks) <part_type>
		switch (<part_type>)
			case cas_body
			case cas_physique
			case cas_full_instrument
			return
			default
			0x93d8d5cf \{qs(0xae803f64)}
		endswitch
	endif
	temp_struct = ($car_part_desc_paks.<part_type>)
	if NOT StructureContains structure = <temp_struct> 0xe4313507
		return
	endif
	if (<temp_struct>.0xe4313507 = 1)
		PushAssetContext context = (<temp_struct>.Heap)
		UnLoadPak (<temp_struct>.pak)
		PopAssetContext
		temp_struct = {<temp_struct> 0xe4313507 = 0}
		updatestructelement struct = $car_part_desc_paks element = <part_type> value = <temp_struct>
		Change car_part_desc_paks = <newstruct>
	endif
endscript

script 0xd4905dfc 
	0x9f6a53bc = [heap_song BottomUpHeap]
	if GotParam \{0xb17c6bb3}
		if (<0xb17c6bb3> = 1)
			0x9f6a53bc = [heap_song BottomUpHeap]
		endif
	endif
	GetArraySize (<0x9f6a53bc>)
	0x90627e26 = (<array_Size> - 1)
	0x5caa84a4 = 0
	GetArraySize ($master_editable_list)
	i = 0
	begin
	0x61e827a0 = ($master_editable_list [<i>])
	part_type = (<0x61e827a0>.part)
	Heap = (<0x9f6a53bc> [<0x5caa84a4>])
	if StructureContains structure = ($car_part_desc_paks) <part_type>
		if 0xe86416fc file = ($car_part_desc_paks.<part_type>.pak) context = <Heap>
			load_part_desc_pak part_type = <part_type> Heap = <Heap>
		else
			0x5caa84a4 = (<0x5caa84a4> + 1)
			if (<0x5caa84a4> > <0x90627e26>)
				0x93d8d5cf \{qs(0xec94660e)}
			endif
			i = (<i> - 1)
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script 0xf8e735a8 
	if NOT GlobalExists \{Name = car_part_desc_paks}
		return
	endif
	GetArraySize ($master_editable_list)
	i = 0
	begin
	0x61e827a0 = ($master_editable_list [<i>])
	part_type = (<0x61e827a0>.part)
	if StructureContains structure = ($car_part_desc_paks) <part_type>
		unload_part_desc_pak part_type = <part_type>
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script 0x6af9e5dc 
	0x8dbdaee4 \{qs(0x84d2d657)}
	0x31e13444 = 0
	GetArraySize ($master_editable_list)
	i = 0
	begin
	0x61e827a0 = ($master_editable_list [<i>])
	part_type = (<0x61e827a0>.part)
	if StructureContains structure = ($car_part_desc_paks) <part_type>
		temp_struct = ($car_part_desc_paks.<part_type>)
		0xe4313507 = 0
		if StructureContains structure = <temp_struct> 0xe4313507
			0xe4313507 = (<temp_struct>.0xe4313507)
		endif
		0x0bbdd740 = None
		if StructureContains structure = <temp_struct> Heap
			if ispakloaded (<temp_struct>.pak) Heap = (<temp_struct>.Heap)
				0x0bbdd740 = (<temp_struct>.Heap)
			endif
		endif
		if (<0xe4313507> = 0)
			if NOT (<0x0bbdd740> = None)
				0x8dbdaee4 qs(0x4c341dde) a = <part_type> b = <0x0bbdd740>
				0x31e13444 = 1
			endif
		else
			if NOT (<0x0bbdd740> = None)
				0x8dbdaee4 qs(0xf4efa7ad) a = <part_type> b = <0x0bbdd740>
			else
				0x8dbdaee4 qs(0x560c3271) a = <part_type>
				0x31e13444 = 1
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	if GotParam \{assert}
		if (<0x31e13444> = 1)
			0x93d8d5cf \{qs(0xbb5e6c67)}
		endif
	endif
endscript

script 0xbe6e9296 
	0x63cedf49 = []
	GetArraySize <part_list>
	if (<array_Size> < 1)
		return \{0x63cedf49 = [
			]}
	endif
	i = 0
	begin
	if NOT load_part_desc_pak part_type = (<part_list> [<i>])
		AddArrayElement array = <0x63cedf49> element = (<part_list> [<i>])
		0x63cedf49 = <array>
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return 0x63cedf49 = <0x63cedf49>
endscript

script 0x9219fac2 
	GetArraySize <part_list>
	if (<array_Size> < 1)
		return
	endif
	i = 0
	begin
	unload_part_desc_pak part_type = (<part_list> [<i>])
	i = (<i> + 1)
	repeat <array_Size>
endscript

script 0xe55f0d87 
	if StructureContains structure = ($0xa32e828a) <genre>
		if NOT StructureContains structure = ($0xa32e828a.<genre>) <part_type>
			Dummy_struct = ($0xa32e828a.<genre>)
			AddParam structure_name = Dummy_struct Name = <part_type> value = []
			updatestructelement struct = $0xa32e828a element = <genre> value = <Dummy_struct>
			Change 0xa32e828a = <newstruct>
		endif
	else
		Dummy_struct = {}
		AddParam \{structure_name = Dummy_struct
			Name = 0x93157503
			value = [
			]}
		AddParam structure_name = Dummy_struct Name = <part_type> value = []
		updatestructelement struct = 0xa32e828a element = <genre> value = <Dummy_struct>
		Change 0xa32e828a = <newstruct>
	endif
endscript

script 0xf9aae7bd 
	0xba84b155 <...>
	begin
	if NOT 0x8836ad8e
		break
	endif
	if GotParam \{async}
		Wait \{1
			gameframe}
	endif
	repeat
	0xbc13404f
endscript

script 0x971fa914 
	0x8a4e63f1 = {cas_body = {desc_id = gh4_car_male}}
	0x5a57a328 = {cas_body = {desc_id = gh4_car_female}}
	GetArraySize ($cas_randomized_parts)
	i = 0
	begin
	part_type = ($cas_randomized_parts [<i>].part)
	if resolvebodyspecificpartinappearance appearance = <0x8a4e63f1> part = <part_type>
		0xf9aae7bd part_type = <part>
		if resolvebodyspecificpartinappearance appearance = <0x5a57a328> part = <part_type>
			0xf9aae7bd part_type = <part>
		endif
	else
		0xf9aae7bd part_type = <part_type>
	endif
	i = (<i> + 1)
	repeat <array_Size>
endscript

script 0x5a2ee4d5 
	GetArraySize ($genre_list)
	genre_count = <array_Size>
	0xe54d3be1 = 0
	begin
	genre = (($genre_list [<0xe54d3be1>]).desc_id)
	if NOT (<genre> = any)
		0x0a881629 = ($0xa32e828a.<genre>.<part_type>)
		GetArraySize (<0x0a881629>)
		part_count = <array_Size>
		part_loop = 0
		begin
		0x51979d5e part_type = <part_type> desc_id = (<0x0a881629> [<part_loop>])
		part_loop = (<part_loop> + 1)
		repeat <part_count>
	endif
	0xe54d3be1 = (<0xe54d3be1> + 1)
	repeat <genre_count>
endscript

script 0xa2cdaafd 
	0x8a4e63f1 = {cas_body = {desc_id = gh4_car_male}}
	0x5a57a328 = {cas_body = {desc_id = gh4_car_female}}
	GetArraySize ($cas_randomized_parts)
	0x415fb9ae = <array_Size>
	0x49821931 = 0
	begin
	part_type = ($cas_randomized_parts [<0x49821931>].part)
	if resolvebodyspecificpartinappearance appearance = <0x8a4e63f1> part = <part_type>
		0x5a2ee4d5 {<...> part_type = <part>}
		if resolvebodyspecificpartinappearance appearance = <0x5a57a328> part = <part_type>
			0x5a2ee4d5 {<...> part_type = <part>}
		endif
	else
		0x5a2ee4d5 <...>
	endif
	0x49821931 = (<0x49821931> + 1)
	repeat <0x415fb9ae>
	Change \{0xa32e828a = {
		}}
endscript

script 0x35d95d03 
	if NOT StructureContains structure = ($0xa32e828a) <genre>
		<genre> = (($song_genre_list.<genre>).0xa30449d0)
	endif
	begin
	if NOT (<genre> = any)
		break
	endif
	GetArraySize ($genre_list)
	GetRandomValue Name = rand_val a = 0 b = (<array_Size> - 1) Name = idx integer
	genre = (($genre_list [<idx>]).desc_id)
	repeat
	0x0a881629 = ($0xa32e828a.<genre>.<part_type>)
	GetArraySize (<0x0a881629>)
	if (<array_Size> < 1)
		0xf9aae7bd part_type = <part_type> async
		0x0a881629 = ($0xa32e828a.<genre>.<part_type>)
		GetArraySize (<0x0a881629>)
	endif
	GetRandomValue Name = rand_val a = 0 b = (<array_Size> - 1) Name = idx integer
	0x2bbc2c14 = (($0xa32e828a.<genre>.<part_type>) [<idx>])
	if NOT 0x8017346b array = ($0xa32e828a.<genre>.0x93157503) element = <part_type>
		0x51979d5e part_type = <part_type> desc_id = <0x2bbc2c14>
		RemoveArrayElement array = <0x0a881629> index = <idx>
		0x0a881629 = <array>
		updatestructelement struct = ($0xa32e828a.<genre>) element = <part_type> value = <0x0a881629>
		updatestructelement struct = $0xa32e828a element = <genre> value = <newstruct>
		Change 0xa32e828a = <newstruct>
	endif
	return part_desc_id = <0x2bbc2c14>
endscript
