
script goal_collect_create_object 
	if NOT StructureContains \{structure = Object
			name}
		ScriptAssert \{text = qs(0x7bfce663)}
	endif
	if NOT StructureContains \{structure = Object
			Pos}
		ScriptAssert \{text = qs(0x60a8a680)}
	endif
	CreateCompositeObject {
		components = [
			{component = motion}
			{component = Model}
			{component = hover}
			{component = Suspend}
			{component = proximity}
		]
		params = {
			name = (<Object>.name)
			Model = (<Object>.Model)
			Pos = (<Object>.Pos)
			SuspendDistance = 60
			lod_dist1 = 200
			lod_dist2 = 300
		}
	}
endscript

script goal_collect_destroy_object 
	if IsCreated (<Object>.name)
		if StructureContains structure = <Object> Model
			(<Object>.name) :Die
		else
			kill name = (<Object>.name)
		endif
	endif
endscript
goal_collect_initing_multiple_objects = false

script goal_collect_init_objects 
	GetArraySize \{objects}
	<index> = 0
	begin
	<do_init> = 0
	if GotParam \{all}
		<do_init> = 1
	else
		if (<init_index> = <index>)
			<do_init> = 1
		elseif ($goal_collect_initing_multiple_objects = false)
			if IsCreated ((<objects> [<index>]).name)
				spawnscriptlater goal_collect_destroy_object params = {Object = (<objects> [<index>])}
			endif
		endif
	endif
	if (<do_init> = 1)
		if NOT IsCreated ((<objects> [<index>]).name)
			if StructureContains structure = (<objects> [<index>]) Model
				goal_collect_create_object Object = (<objects> [<index>])
			else
				create name = ((<objects> [<index>]).name)
			endif
		endif
		((<objects> [<index>]).name) :Obj_SpawnScript {
			goal_collect_init_object
			params = {
				(<objects> [<index>])
				object_index = <index>
				goal_id = <goal_id>
				checkpoint_id = <checkpoint_id>
				tool_id = <tool_id>
			}
		}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	if ((GotParam show_arrow) && (GotParam init_index))
		goal_collect_create_arrow object_id = (<objects> [<init_index>].name)
	endif
endscript

script goal_collect_init_object 
	if GotParam \{letter}
		SetTags letter = <letter>
	endif
	if ContainsComponent \{name = motion}
		Obj_StopMoving
		Obj_StopRotating
	endif
	if NOT GotParam \{Pos}
		GetNode <name>
		Pos = (<node>.Pos)
	endif
	Obj_SetPosition position = <Pos>
	if NOT GotParam \{dont_animate}
		if ContainsComponent \{name = motion}
			Obj_RotY \{speed = 200}
		endif
		if ContainsComponent \{name = hover}
			Obj_Hover \{amp = 0.25
				Freq = 2}
		endif
	endif
	Obj_SetNoSizeCull
	Obj_Visible
	Proximity_Init {
		Proximities = [
			{
				InnerRadius = <radius>
				outerRadius = (<radius> + 0.1)
				EnterProximityScript = goal_collect_got_object
			}
		]
		ProximityScriptParams = {
			goal_id = <goal_id>
			checkpoint_id = <checkpoint_id>
			tool_id = <tool_id>
			object_id = <name>
			object_index = <object_index>
			Model = <Model>
			fx_type = <fx_type>
			required_state = <required_state>
			test_script = <test_script>
			test_params = <test_params>
		}
	}
endscript

script goal_collect_uninit_objects 
	GetArraySize \{objects}
	<index> = 0
	begin
	if IsCreated ((<objects> [<index>]).name)
		<do_uninit> = 0
		if GotParam \{all}
			<do_uninit> = 1
		else
			if (<uninit_index> = <index>)
				<do_uninit> = 1
			endif
		endif
		if (<do_uninit> = 1)
			goal_collect_destroy_object Object = (<objects> [<index>])
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script goal_collect_got_object 
	if <triggeringobject> :Obj_HasComponent BodyMotion
		<got_object> = 1
		if GotParam \{required_state}
			<got_object> = 0
			if ((GMan_GetConstant goal = <goal_id> name = skater_state_tool) && (GMan_SkaterFunc goal = <goal_id> tool = <skater_state_tool> func = is_in_state params = {state = <required_state>}))
				<got_object> = 1
			endif
		endif
		if GotParam \{test_script}
			if <test_script> triggeringobject = <triggeringobject> <test_params>
				<got_object> = 1
			else
				<got_object> = 0
			endif
		endif
		if (<got_object> = 1)
			goal_collect_got_object_fx fx_type = <fx_type> object_id = <object_id>
			spawnscriptlater goal_collect_destroy_object params = {Object = {name = <object_id> Model = <Model>}}
			GMan_GotCollectObject goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> Object = <object_id> index = <object_index>
		endif
	endif
endscript

script goal_collect_got_object_fx 
	switch <fx_type>
		case skate_letter
		SoundEvent \{event = Skate_Letter_Collect_SFX}
		screenflash \{time = 0.4}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeObjectID \{preferredID = Classic_Skate_Letter}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_WoodShatterSmoke
		case combo_letter
		SoundEvent \{event = Combo_Letter_Collect_SFX}
		screenflash \{time = 0.4}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeObjectID \{preferredID = Classic_Combo_Letter}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_WoodShatterSmoke
		case secret_tape
		if NOT IsSoundEventPlaying \{Medal_AM_SFX}
			if NOT IsSoundEventPlaying \{Medal_Pro_SFX}
				if NOT IsSoundEventPlaying \{Medal_SICK_SFX}
					SoundEvent \{event = sk8_Collect_CD}
					screenflash \{time = 0.4}
					if GetNode <object_id>
						<Pos> = (<node>.Pos)
					else
						<object_id> :Obj_GetPosition
					endif
					GetUniqueCompositeObjectID \{preferredID = Classic_Combo_Letter}
					CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_WoodShatterSmoke
				endif
			endif
		endif
		printf \{qs(0xd87c2839)}
		case grind_pellet
		SoundEvent \{event = Hawkman_Get_Pellet_Grind}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeObjectID \{preferredID = GrindPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Grind
		GetUniqueCompositeObjectID \{preferredID = GrindPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Grind02
		GetUniqueCompositeObjectID \{preferredID = GrindPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Grind03
		GetUniqueCompositeObjectID \{preferredID = GrindPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Grind08
		GetUniqueCompositeObjectID \{preferredID = ManualPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Manual04
		case manual_pellet
		SoundEvent \{event = Hawkman_Get_Pellet_Man}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeObjectID \{preferredID = ManualPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Grind02
		GetUniqueCompositeObjectID \{preferredID = ManualPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Manual01
		GetUniqueCompositeObjectID \{preferredID = ManualPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Manual02
		GetUniqueCompositeObjectID \{preferredID = ManualPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Manual03
		GetUniqueCompositeObjectID \{preferredID = ManualPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Manual04
		case wallride_pellet
		SoundEvent \{event = Hawkman_Get_Pellet_Wall}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeObjectID \{preferredID = WallridePelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Grind02
		GetUniqueCompositeObjectID \{preferredID = WallridePelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Wallride01
		GetUniqueCompositeObjectID \{preferredID = WallridePelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Wallride02
		GetUniqueCompositeObjectID \{preferredID = ManualPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Manual04
		GetUniqueCompositeObjectID \{preferredID = ManualPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Grind09
		case transfer_pellet
		SoundEvent \{event = Hawkman_Get_Pellet_Tran}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeObjectID \{preferredID = TransferPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Grind02
		GetUniqueCompositeObjectID \{preferredID = TransferPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Grind05
		GetUniqueCompositeObjectID \{preferredID = TransferPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Grind06
		GetUniqueCompositeObjectID \{preferredID = TransferPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Grind07
		GetUniqueCompositeObjectID \{preferredID = ManualPelletFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_Pellet_Manual04
		case smash
		SoundEvent \{event = sk9_Stamp_Rip}
		SoundEvent \{event = sk8_Poster_SFX}
		screenflash \{time = 0.4}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeObjectID \{preferredID = Classic_Smash}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_WoodShatterSmoke
		case smash_fdr
		SoundEvent \{event = sk9_Metal_Sign_Punch}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		<modified_pos> = (<Pos> + (0.0, 1.2, 0.0))
		skater :Obj_GetVelocity
		NormalizeVector <vel>
		screenflash \{time = 0.4}
		GetUniqueCompositeObjectID \{preferredID = Classic_FDR01}
		CreateParticleSystem name = <uniqueID> Pos = <modified_pos> params_Script = $GP_PH_WoodShatterSmoke
		GetUniqueCompositeObjectID \{preferredID = Classic_FDR01}
		CreateParticleSystem name = <uniqueID> Pos = <modified_pos> params_Script = {$GP_PH_SignPieces_White Emit_Target = <norm>}
		case smash_lansdown
		SoundEvent \{event = shoe_stall_sfx}
		screenflash \{time = 0.4}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeObjectID \{preferredID = Classic_Lansdowne}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_WoodShatterSmoke
		case smash_slums
		SoundEvent \{event = sk9_Stamp_Rip}
		screenflash \{time = 0.4}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeObjectID \{preferredID = Classic_Slums01}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_SignSmoke01
		SoundEvent \{event = sk8_Poster_SFX}
		case smash_monuments
		SoundEvent \{event = Skate_Letter_Collect_SFX}
		case smash_museums
		SoundEvent \{event = Skate_Letter_Collect_SFX}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		<modified_pos> = (<Pos> + (0.0, 1.75, 0.0))
		skater :Obj_GetVelocity
		NormalizeVector <vel>
		GetUniqueCompositeObjectID \{preferredID = Classic_Musuems_SignShatter01}
		CreateParticleSystem name = <uniqueID> Pos = <modified_pos> params_Script = {$GP_PH_SignPieces_Blue Emit_Target = <norm>}
		GetUniqueCompositeObjectID \{preferredID = Classic_Musuems_SignShatter01}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_SignSmoke01
		case smash_harbor
		SoundEvent \{event = Skate_Letter_Collect_SFX}
		screenflash \{time = 0.4}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		skater :Obj_GetVelocity
		NormalizeVector <vel>
		GetUniqueCompositeObjectID \{preferredID = CrabBoxFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_CrabSmoke01
		GetUniqueCompositeObjectID \{preferredID = CrabBoxFX}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = {$GP_PH_CrabWoodPieces01 Emit_Target = <norm>}
		case smash_wp_bridge
		SoundEvent \{event = skate_poster_rip}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeObjectID \{preferredID = Classic_Musuems_SignShatter01}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_WoodShatterSmoke
		screenflash \{time = 0.4}
		case smash_squid
		SoundEvent \{event = natas_squid_sfx}
		case jackhammer
		SoundEvent \{event = jackhammer_sfx}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeObjectID \{preferredID = Classic_BW_Bridge01}
		CreateParticleSystem name = <uniqueID> Pos = <Pos> params_Script = $GP_PH_WoodShatterSmoke
		screenflash \{time = 0.4}
		case race_collect_sfx
		SoundEvent \{event = sk9_Checkpoint_SFX}
		default
		SoundEvent \{event = Skate_Letter_Collect_SFX}
	endswitch
endscript

script goal_collect_got_object_msg 
	goal_create_counter {
		initial_count = <num_collected>
		total_number = <num_objects>
		hud_counter_caption = <collect_text>
		time = 5
	}
endscript

script goal_collect_text_style 
	SE_SetProps \{rgba = [
			127
			102
			0
			255
		]
		Pos = (320.0, 100.0)}
	LegacyDoMorph \{alpha = 1.0
		scale = 0.9}
	wait \{1000}
	Die
endscript

script goal_collect_create_arrow 
endscript

script goal_collect_destroy_arrow 
endscript
