
script goal_collect_create_object 
	if NOT StructureContains \{structure = object
			Name}
		ScriptAssert \{text = qs(0x7bfce663)}
	endif
	if NOT StructureContains \{structure = object
			Pos}
		ScriptAssert \{text = qs(0x60a8a680)}
	endif
	CreateCompositeObject {
		components = [
			{component = motion}
			{component = Model}
			{component = Hover}
			{component = Suspend}
			{component = Proximity}
		]
		params = {
			Name = (<object>.Name)
			Model = (<object>.Model)
			Pos = (<object>.Pos)
			SuspendDistance = 60
			lod_dist1 = 200
			lod_dist2 = 300
		}
	}
endscript

script goal_collect_destroy_object 
	if IsCreated (<object>.Name)
		if StructureContains structure = <object> Model
			(<object>.Name) :Die
		else
			kill Name = (<object>.Name)
		endif
	endif
endscript
goal_collect_initing_multiple_objects = FALSE

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
		elseif ($goal_collect_initing_multiple_objects = FALSE)
			if IsCreated ((<objects> [<index>]).Name)
				SpawnScriptLater goal_collect_destroy_object params = {object = (<objects> [<index>])}
			endif
		endif
	endif
	if (<do_init> = 1)
		if NOT IsCreated ((<objects> [<index>]).Name)
			if StructureContains structure = (<objects> [<index>]) Model
				goal_collect_create_object object = (<objects> [<index>])
			else
				create Name = ((<objects> [<index>]).Name)
			endif
		endif
		((<objects> [<index>]).Name) :obj_spawnscript {
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
	repeat <array_Size>
	if ((GotParam show_arrow) && (GotParam init_index))
		goal_collect_create_arrow object_id = (<objects> [<init_index>].Name)
	endif
endscript

script goal_collect_init_object 
	if GotParam \{letter}
		SetTags letter = <letter>
	endif
	if ContainsComponent \{Name = motion}
		Obj_StopMoving
		Obj_StopRotating
	endif
	if NOT GotParam \{Pos}
		GetNode <Name>
		Pos = (<node>.Pos)
	endif
	Obj_SetPosition position = <Pos>
	if NOT GotParam \{dont_animate}
		if ContainsComponent \{Name = motion}
			Obj_RotY \{speed = 200}
		endif
		if ContainsComponent \{Name = Hover}
			obj_hover \{amp = 0.25
				freq = 2}
		endif
	endif
	Obj_SetNoSizeCull
	obj_visible
	proximity_init {
		proximities = [
			{
				InnerRadius = <radius>
				outerradius = (<radius> + 0.1)
				enterproximityscript = goal_collect_got_object
			}
		]
		proximityscriptparams = {
			goal_id = <goal_id>
			checkpoint_id = <checkpoint_id>
			tool_id = <tool_id>
			object_id = <Name>
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
	if IsCreated ((<objects> [<index>]).Name)
		<do_uninit> = 0
		if GotParam \{all}
			<do_uninit> = 1
		else
			if (<uninit_index> = <index>)
				<do_uninit> = 1
			endif
		endif
		if (<do_uninit> = 1)
			goal_collect_destroy_object object = (<objects> [<index>])
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
endscript

script goal_collect_got_object 
	if <triggeringobject> :Obj_HasComponent bodymotion
		<got_object> = 1
		if GotParam \{required_state}
			<got_object> = 0
			if ((gman_getconstant goal = <goal_id> Name = skater_state_tool) && (gman_skaterfunc goal = <goal_id> tool = <skater_state_tool> func = is_in_state params = {state = <required_state>}))
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
			SpawnScriptLater goal_collect_destroy_object params = {object = {Name = <object_id> Model = <Model>}}
			gman_gotcollectobject goal = <goal_id> checkpoint = <checkpoint_id> tool = <tool_id> object = <object_id> index = <object_index>
		endif
	endif
endscript

script goal_collect_got_object_fx 
	switch <fx_type>
		case skate_letter
		SoundEvent \{event = skate_letter_collect_sfx}
		ScreenFlash \{time = 0.4}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeobjectID \{preferredID = classic_skate_letter}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_woodshattersmoke
		case combo_letter
		SoundEvent \{event = combo_letter_collect_sfx}
		ScreenFlash \{time = 0.4}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeobjectID \{preferredID = classic_combo_letter}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_woodshattersmoke
		case secret_tape
		if NOT IsSoundEventPlaying \{medal_am_sfx}
			if NOT IsSoundEventPlaying \{medal_pro_sfx}
				if NOT IsSoundEventPlaying \{medal_sick_sfx}
					SoundEvent \{event = sk8_collect_cd}
					ScreenFlash \{time = 0.4}
					if GetNode <object_id>
						<Pos> = (<node>.Pos)
					else
						<object_id> :Obj_GetPosition
					endif
					GetUniqueCompositeobjectID \{preferredID = classic_combo_letter}
					CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_woodshattersmoke
				endif
			endif
		endif
		printf \{qs(0xd87c2839)}
		case grind_pellet
		SoundEvent \{event = hawkman_get_pellet_grind}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeobjectID \{preferredID = grindpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_grind
		GetUniqueCompositeobjectID \{preferredID = grindpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_grind02
		GetUniqueCompositeobjectID \{preferredID = grindpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_grind03
		GetUniqueCompositeobjectID \{preferredID = grindpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_grind08
		GetUniqueCompositeobjectID \{preferredID = manualpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_manual04
		case manual_pellet
		SoundEvent \{event = hawkman_get_pellet_man}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeobjectID \{preferredID = manualpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_grind02
		GetUniqueCompositeobjectID \{preferredID = manualpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_manual01
		GetUniqueCompositeobjectID \{preferredID = manualpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_manual02
		GetUniqueCompositeobjectID \{preferredID = manualpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_manual03
		GetUniqueCompositeobjectID \{preferredID = manualpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_manual04
		case wallride_pellet
		SoundEvent \{event = hawkman_get_pellet_wall}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeobjectID \{preferredID = wallridepelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_grind02
		GetUniqueCompositeobjectID \{preferredID = wallridepelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_wallride01
		GetUniqueCompositeobjectID \{preferredID = wallridepelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_wallride02
		GetUniqueCompositeobjectID \{preferredID = manualpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_manual04
		GetUniqueCompositeobjectID \{preferredID = manualpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_grind09
		case transfer_pellet
		SoundEvent \{event = hawkman_get_pellet_tran}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeobjectID \{preferredID = transferpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_grind02
		GetUniqueCompositeobjectID \{preferredID = transferpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_grind05
		GetUniqueCompositeobjectID \{preferredID = transferpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_grind06
		GetUniqueCompositeobjectID \{preferredID = transferpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_grind07
		GetUniqueCompositeobjectID \{preferredID = manualpelletfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_pellet_manual04
		case smash
		SoundEvent \{event = sk9_stamp_rip}
		SoundEvent \{event = sk8_poster_sfx}
		ScreenFlash \{time = 0.4}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeobjectID \{preferredID = classic_smash}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_woodshattersmoke
		case smash_fdr
		SoundEvent \{event = sk9_metal_sign_punch}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		<modified_pos> = (<Pos> + (0.0, 1.2, 0.0))
		skater :Obj_GetVelocity
		NormalizeVector <vel>
		ScreenFlash \{time = 0.4}
		GetUniqueCompositeobjectID \{preferredID = classic_fdr01}
		CreateParticleSystem Name = <uniqueID> Pos = <modified_pos> params_Script = $gp_ph_woodshattersmoke
		GetUniqueCompositeobjectID \{preferredID = classic_fdr01}
		CreateParticleSystem Name = <uniqueID> Pos = <modified_pos> params_Script = {$gp_ph_signpieces_white Emit_Target = <norm>}
		case smash_lansdown
		SoundEvent \{event = shoe_stall_sfx}
		ScreenFlash \{time = 0.4}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeobjectID \{preferredID = classic_lansdowne}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_woodshattersmoke
		case smash_slums
		SoundEvent \{event = sk9_stamp_rip}
		ScreenFlash \{time = 0.4}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeobjectID \{preferredID = classic_slums01}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_signsmoke01
		SoundEvent \{event = sk8_poster_sfx}
		case smash_monuments
		SoundEvent \{event = skate_letter_collect_sfx}
		case smash_museums
		SoundEvent \{event = skate_letter_collect_sfx}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		<modified_pos> = (<Pos> + (0.0, 1.75, 0.0))
		skater :Obj_GetVelocity
		NormalizeVector <vel>
		GetUniqueCompositeobjectID \{preferredID = classic_musuems_signshatter01}
		CreateParticleSystem Name = <uniqueID> Pos = <modified_pos> params_Script = {$gp_ph_signpieces_blue Emit_Target = <norm>}
		GetUniqueCompositeobjectID \{preferredID = classic_musuems_signshatter01}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_signsmoke01
		case smash_harbor
		SoundEvent \{event = skate_letter_collect_sfx}
		ScreenFlash \{time = 0.4}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		skater :Obj_GetVelocity
		NormalizeVector <vel>
		GetUniqueCompositeobjectID \{preferredID = crabboxfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_crabsmoke01
		GetUniqueCompositeobjectID \{preferredID = crabboxfx}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = {$gp_ph_crabwoodpieces01 Emit_Target = <norm>}
		case smash_wp_bridge
		SoundEvent \{event = skate_poster_rip}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeobjectID \{preferredID = classic_musuems_signshatter01}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_woodshattersmoke
		ScreenFlash \{time = 0.4}
		case smash_squid
		SoundEvent \{event = natas_squid_sfx}
		case jackhammer
		SoundEvent \{event = jackhammer_sfx}
		if GetNode <object_id>
			<Pos> = (<node>.Pos)
		else
			<object_id> :Obj_GetPosition
		endif
		GetUniqueCompositeobjectID \{preferredID = classic_bw_bridge01}
		CreateParticleSystem Name = <uniqueID> Pos = <Pos> params_Script = $gp_ph_woodshattersmoke
		ScreenFlash \{time = 0.4}
		case race_collect_sfx
		SoundEvent \{event = sk9_checkpoint_sfx}
		default
		SoundEvent \{event = skate_letter_collect_sfx}
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
	se_setprops \{rgba = [
			127
			102
			0
			255
		]
		Pos = (320.0, 100.0)}
	legacydomorph \{alpha = 1.0
		Scale = 0.9}
	Wait \{1000}
	Die
endscript

script goal_collect_create_arrow 
endscript

script goal_collect_destroy_arrow 
endscript
