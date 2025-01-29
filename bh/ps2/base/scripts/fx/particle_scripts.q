Force_Particle_Update_Time = 1.0

script createparticlesystem_withscript 
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{Name}

	endif
	if NOT GotParam \{params_Script}

		return
	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists Name = <params_Script> Type = structure

			return
		endif
	endif
	if GotParam \{objID}
		attachObjId = <objID>
		MangleChecksums a = <Name> b = <attachObjId>
	else
		<mangled_ID> = <Name>
	endif
	if ObjectExists id = <mangled_ID>

		return
	endif
	GetParticleType params_Script = <params_Script>
	if GotParam \{Pos}
		if (<Type> = FAST)
			CreateGlobalFastParticleSystem <...>
		else
			CreateGlobalFlexParticleSystem <...>
		endif
	else
		if (<Type> = FAST)
			if CutsceneDestroyListActive
				AddToCutsceneDestroyList {
					destroy_func = DestroyFastParticleSystem
					Name = <mangled_ID>
					destroy_params = {Name = <Name> attachObjId = <attachObjId>}
				}
			endif
			alloc_spline_particle {params_Script = <params_Script> Name = <mangled_ID> attachObjId = <objID> objID = <objID> bone = <bone> groupID = <groupID>
				attachNode = <attachNode> emit_script = <emit_script> emit_params = <emit_params> PERM = <PERM> creation_node = <creation_node>}
		else
			if CutsceneDestroyListActive
				AddToCutsceneDestroyList {
					destroy_func = DestroyFlexibleParticleSystem
					Name = <mangled_ID>
					destroy_params = {Name = <Name> objID = <objID>}
				}
			endif
			alloc_flexible_particle params_Script = (<params_Script>) Name = <mangled_ID> objID = <objID> bone = <bone> attachNode = <attachNode> bone = <bone> groupID = <groupID> PERM = <PERM>
		endif
	endif
endscript

script CreateFlexibleParticleSystem \{groupID = 0}
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{Name}

	endif
	if NOT GotParam \{params_Script}

	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists Name = <params_Script> Type = structure

			return
		endif
	endif
	if NOT GotParam \{objID}
		Obj_GetID
	endif
	MangleChecksums a = <Name> b = <objID>
	if NOT ObjectExists id = <mangled_ID>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyFlexibleParticleSystem
				ignore_duplicates
				Name = <mangled_ID>
				destroy_params = {Name = <Name> objID = <objID>}
			}
		endif
		alloc_flexible_particle params_Script = (<params_Script>) Name = <mangled_ID> objID = <objID> bone = <bone> attachNode = <attachNode> bone = <bone> groupID = <groupID> PERM = <PERM>
	endif
endscript

script CreateFlexibleParticleSystem_Editor 
	KillSpawnedScript \{Name = CreateFlexibleParticleSystem_Editor_Spawned}
	SpawnScriptNow CreateFlexibleParticleSystem_Editor_Spawned params = <...>
endscript

script CreateFlexibleParticleSystem_Editor_Spawned \{groupID = 0}
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{Name}

	endif
	if NOT GotParam \{params_Script}

	endif
	if NOT GotParam \{objID}
	endif
	if GotParam \{attachObjId}
		<objID> = <attachObjId>
	endif
	if GotParam \{objID}
		attachObjId = <objID>
	endif
	if GotParam \{objID}
		MangleChecksums a = <Name> b = <attachObjId>
	else
		<mangled_ID> = <Name>
	endif
	if (IsCreated <Name>)
		<Name> :Die
		Wait \{1
			Frame}
	endif
	if (IsCreated <mangled_ID>)
		<mangled_ID> :Die
		Wait \{1
			Frame}
	endif
	if NOT IsCreated <mangled_ID>
		if (GotParam Attach)
			alloc_flexible_particle params_Script = (<params_Script>) Name = <mangled_ID> objID = <attachObjId> attachNode = <attachNode> bone = <bone> groupID = <groupID> PERM = <PERM>
		else
			alloc_flexible_particle params_Script = (<params_Script>) Name = <mangled_ID> groupID = <groupID> PERM = <PERM>
		endif
	endif
endscript

script GetFlexibleParticleSystem 
	if NOT GotParam \{Name}

	endif
	if NOT GotParam \{objID}
		Obj_GetID
	endif
	MangleChecksums a = <Name> b = <objID>
	if ObjectExists id = <mangled_ID>
		return systemID = <mangled_ID>
	endif
endscript

script DestroyFlexibleParticleSystem 
	if NOT GotParam \{Name}

	endif
	if NOT GotParam \{objID}
		Obj_GetID
	endif
	MangleChecksums a = <Name> b = <objID>
	if ObjectExists id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <mangled_ID>
		endif
		<mangled_ID> :DestroyParticles
	endif
endscript

script DestroyFlexibleParticleSystem_Editor 
	if NOT GotParam \{Name}

	endif
	if NOT GotParam \{objID}
		Obj_GetID
	endif
	MangleChecksums a = <Name> b = <objID>
	if ObjectExists id = <Name>
		<Name> :DestroyParticles
	endif
	if ObjectExists id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <mangled_ID>
		endif
		<mangled_ID> :DestroyParticles
	endif
endscript
LockableFlexibleParticleComponents = [
	{
		component = Attach
	}
	{
		component = FlexibleParticle
	}
]

script alloc_flexible_particle \{groupID = 0}
	if NOT CheckFlexibleParticleStructure <params_Script>

		return
	endif
	if GotParam \{PERM}
		if (<PERM> = 1)
			Priority = COIM_Priority_Permanent
			Heap = GameObj
		else
			Priority = COIM_Priority_Effects
			Heap = Particle
		endif
	else
		Priority = COIM_Priority_Effects
		Heap = Particle
	endif
	CreateGameObject Priority = <Priority> Heap = <Heap> components = $LockableFlexibleParticleComponents params = {
		Name = <Name>
		<params_Script>
		IgnoreLockDie
		id = <objID>
		attach_target = <objID>
		parent_object = <objID>
		bone = <bone>
		attach_bone = <bone>
		groupID = <groupID>
		attachNode = <attachNode>
		object_type = Particle
	}
endscript
SuspendibleFlexibleParticleComponents = [
	{
		component = FlexibleParticle
	}
]
FlexibleParticleComponents = [
	{
		component = FlexibleParticle
	}
]

script CreateGlobalFlexParticleSystem \{groupID = 0}
	if NOT CheckFlexibleParticleStructure <params_Script>

		return
	endif
	if GotParam \{PERM}
		Priority = COIM_Priority_Permanent
		Heap = GameObj
	else
		Priority = COIM_Priority_Effects
		Heap = Particle
	endif
	if NOT GotParam \{Name}

	endif
	if NOT GotParam \{params_Script}

	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists Name = <params_Script> Type = structure

			return
		endif
	endif
	if NOT ObjectExists id = <Name>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyGlobalFlexParticleSystem
				ignore_duplicates
				Name = <Name>
				destroy_params = {Name = <Name>}
			}
		endif
		if StructureContains \{structure = params_Script
				SuspendDistance}
			CreateGameObject Priority = <Priority> Heap = <Heap> components = $SuspendibleFlexibleParticleComponents params = {
				Name = <Name>
				<params_Script>
				groupID = <groupID>
				Pos = <Pos>
				object_type = Particle
			}
		else
			CreateGameObject Priority = <Priority> Heap = <Heap> components = $FlexibleParticleComponents params = {
				Name = <Name>
				<params_Script>
				groupID = <groupID>
				Pos = <Pos>
				object_type = Particle
			}
		endif
	endif
endscript

script DestroyGlobalFlexParticleSystem 
	if NOT GotParam \{Name}

	endif
	if ObjectExists id = <Name>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <Name>
		endif
		<Name> :DestroyParticles
	endif
endscript

script CreateFastParticleSystem \{groupID = 0}
	CreateSplineParticleSystem params = <...>
endscript

script CreateSplineParticleSystem \{groupID = 0}
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{Name}

	endif
	if NOT GotParam \{params_Script}

	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists Name = <params_Script> Type = structure

			return
		endif
	endif
	if GotParam \{attachObjId}
		<objID> = <attachObjId>
	endif
	if GotParam \{objID}
		attachObjId = <objID>
	endif
	if GotParam \{objID}
		MangleChecksums a = <Name> b = <attachObjId>
	else
		<mangled_ID> = <Name>
	endif
	if NOT IsCreated <mangled_ID>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyFastParticleSystem
				ignore_duplicates
				Name = <mangled_ID>
				destroy_params = {Name = <Name> attachObjId = <attachObjId>}
			}
		endif
		alloc_spline_particle {params_Script = <params_Script> Name = <mangled_ID> attachObjId = <objID> objID = <objID> bone = <bone> groupID = <groupID>
			attachNode = <attachNode> emit_script = <emit_script> emit_params = <emit_params> PERM = <PERM> creation_node = <creation_node>}
	endif
	if ((IsCreated <mangled_ID>) && (GotParam objID) && (StructureContains structure = params_Script ApplyEnvBrightness))
		<mangled_ID> :ApplyEnvBrightness from = <objID>
	endif
	if IsCreated <mangled_ID>
		return systemID = <mangled_ID>
	endif
endscript

script CreateSplineParticleSystem_Editor 
	KillSpawnedScript \{Name = CreateSplineParticleSystem_Editor_Spawned}
	SpawnScriptNow CreateSplineParticleSystem_Editor_Spawned params = <...>
endscript

script CreateSplineParticleSystem_Editor_Spawned \{groupID = 0}
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{Name}

	endif
	if NOT GotParam \{params_Script}

	endif
	if GotParam \{attachObjId}
		<objID> = <attachObjId>
	endif
	if GotParam \{objID}
		attachObjId = <objID>
	endif
	if GotParam \{objID}
		MangleChecksums a = <Name> b = <attachObjId>
	else
		<mangled_ID> = <Name>
	endif
	if (IsCreated <Name>)
		<Name> :Die
		Wait \{1
			Frame}
	endif
	if (IsCreated <mangled_ID>)
		<mangled_ID> :Die
		Wait \{1
			Frame}
	endif
	if (IsCreated <mangled_ID>)
		<mangled_ID> :UpdateParams {params_Script = <params_Script>}
		if GotParam \{Attach}
			<mangled_ID> :Obj_LockToObject objectName = <objID>
		else
			<mangled_ID> :Obj_LockToObject OFF objectName = <objID>
		endif
	else
		alloc_spline_particle {params_Script = <params_Script> Name = <mangled_ID> attachObjId = <objID> objID = <objID> bone = <bone> groupID = <groupID>
			attachNode = <attachNode> emit_script = <emit_script> emit_params = <emit_params> PERM = <PERM> creation_node = <creation_node>}
	endif
endscript
SuspendibleFastParticleComponents = [
	{
		component = Particle
	}
]
FastParticleComponents = [
	{
		component = Particle
	}
]

script CreateGlobalFastParticleSystem \{groupID = 0}
	if NOT CheckSplineParticleStructure <params_Script>

		return
	endif
	if GotParam \{PERM}
		Priority = COIM_Priority_Permanent
		Heap = GameObj
	else
		Priority = COIM_Priority_Effects
		Heap = Particle
	endif
	if NOT GotParam \{Name}

	endif
	if NOT GotParam \{params_Script}

	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists Name = <params_Script> Type = structure

			return
		endif
	endif
	if NOT IsCreated <Name>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyGlobalFastParticleSystem
				ignore_duplicates
				Name = <Name>
				destroy_params = {Name = <Name>}
			}
		endif
		if StructureContains \{structure = params_Script
				SuspendDistance}
			CreateGameObject Priority = <Priority> Heap = <Heap> components = SuspendibleFastParticleComponents params = {
				Name = <Name>
				parent_object = <objID>
				groupID = <groupID>
				<params_Script>
				Pos = <Pos>
				object_type = Particle
			}
		else
			CreateGameObject Priority = <Priority> Heap = <Heap> components = $FastParticleComponents params = {
				Name = <Name>
				parent_object = <objID>
				groupID = <groupID>
				<params_Script>
				Pos = <Pos>
				object_type = Particle
			}
		endif
	endif
	if IsCreated <Name>
		if GotParam \{emit_script}
			<Name> :Obj_SpawnScriptLater <emit_script> params = <emit_params>
		endif
	endif
endscript

script DestroyGlobalFastParticleSystem 
	if NOT GotParam \{Name}

	endif
	if ObjectExists id = <Name>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <Name>
		endif
		<Name> :Die
	endif
endscript

script DestroyFastParticleSystem 
	if NOT GotParam \{Name}

	endif
	if GotParam \{objID}
		attachObjId = <objID>
	endif
	if GotParam \{attachObjId}
		MangleChecksums a = <Name> b = <attachObjId>
	else
		<mangled_ID> = <Name>
	endif
	if ObjectExists id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <mangled_ID>
		endif
		<mangled_ID> :Die
	endif
endscript

script DestroyParticleSystem_Editor 
	KillSpawnedScript \{Name = DestroyParticleSystem_Editor_Spawn}
	SpawnScriptNow DestroyParticleSystem_Editor_Spawn params = <...>
endscript

script DestroyParticleSystem_Editor_Spawn 
	if NOT GotParam \{Name}

	endif
	if GotParam \{objID}
		attachObjId = <objID>
	endif
	if GotParam \{attachObjId}
		MangleChecksums a = <Name> b = <attachObjId>
	else
		<mangled_ID> = <Name>
	endif
	if ObjectExists id = <mangled_ID>
		<mangled_ID> :Die
	endif
	if ObjectExists id = <Name>
		<Name> :Die
	endif
endscript

script DestroySplineParticleSystem_Editor 
	if NOT GotParam \{Name}

	endif
	if GotParam \{objID}
		attachObjId = <objID>
	endif
	if GotParam \{attachObjId}
		MangleChecksums a = <Name> b = <attachObjId>
	else
		<mangled_ID> = <Name>
	endif
	if ObjectExists id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <mangled_ID>
		endif
		<mangled_ID> :Die
	endif
	if ObjectExists id = <Name>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <Name>
		endif
		<Name> :Die
	endif
endscript

script EmitFastParticles 
	if GotParam \{wait_frames}
		Wait <wait_frames> frames
	else
		Wait <wait_seconds> Seconds
	endif
	SetEmitRate \{0}
	begin
	if NOT IsEmitting
		break
	endif
	Wait \{1
		Frame}
	repeat
	Die
endscript
LockableSplineParticleComponents = [
	{
		component = Attach
	}
	{
		component = Particle
	}
]

script alloc_spline_particle \{groupID = 0}
	if NOT CheckSplineParticleStructure <params_Script>

		return
	endif
	if GotParam \{PERM}
		if (<PERM> = 1)
			Priority = COIM_Priority_Permanent
			Heap = GameObj
		else
			Priority = COIM_Priority_Effects
			Heap = Particle
		endif
	else
		Priority = COIM_Priority_Effects
		Heap = Particle
	endif
	if NOT ObjectExists id = <Name>
		if GotParam \{attachObjId}
			CreateGameObject Priority = <Priority> Heap = <Heap> components = $LockableSplineParticleComponents params = {
				Name = <Name>
				<params_Script>
				id = <attachObjId>
				attach_target = <attachObjId>
				IgnoreLockDie
				parent_object = <attachObjId>
				bone = <bone>
				attach_bone = <bone>
				groupID = <groupID>
				LocalSpace
				creation_node = <creation_node>
				object_type = Particle
			}
		else
			CreateGameObject Priority = <Priority> Heap = <Heap> {
				components = [
					{
						component = Particle
						Name = <Name>
						bone = <bone>
						groupID = <groupID>
						<params_Script>
					}
				]
				params = {
					Name = <Name>
					bone = <bone>
					creation_node = <creation_node>
					object_type = Particle
				}
			}
			if StructureContains \{structure = params_Script
					LocalSpace}
				if NOT StructureContains \{structure = params_Script
						boxPositions}


				endif
				if ObjectExists id = <Name>
					<Name> :SetStartPos (<params_Script>.boxPositions [1])
				endif
			endif
		endif
	endif
	if ObjectExists id = <Name>
		if GotParam \{emit_script}
			<Name> :Obj_SpawnScriptLater <emit_script> params = <emit_params>
		endif
	endif
endscript

script alloc_fast_particle \{groupID = 0}
	if NOT GotParam \{params_Script}
		if NOT GlobalExists Name = <params_Script> Type = structure

			return
		endif
	endif
	if GotParam \{PERM}
		if (<PERM> = 1)
			Priority = COIM_Priority_Permanent
			Heap = GameObj
		else
			Priority = COIM_Priority_Effects
			Heap = Particle
		endif
	else
		Priority = COIM_Priority_Effects
		Heap = Particle
	endif
	if NOT ObjectExists id = <Name>
		if GotParam \{attachObjId}
			CreateGameObject Priority = <Priority> Heap = <Heap> {
				components = [
					{
						component = Attach
						attach_target = <attachObjId>
						<params_Script>
						IgnoreLockDie
					}
					{
						component = Particle
						Name = <Name>
						groupID = <groupID>
						parent_object = <attachObjId>
						bone = <bone>
						<params_Script>
						systemLifetime = (<params_Script>.EmitDuration)
						systemLifetime = <systemLifetime>
					}
				]
				params = {
					Name = <Name>
					bone = <bone>
					LocalSpace
					creation_node = <creation_node>
					object_type = Particle
				}
			}
		else
			CreateGameObject Priority = <Priority> Heap = <Heap> {
				components = [
					{
						component = Particle
						Name = <Name>
						bone = <bone>
						groupID = <groupID>
						<params_Script>
					}
				]
				params = {
					Name = <Name>
					bone = <bone>
					creation_node = <creation_node>
					object_type = Particle
				}
			}
			if StructureContains \{structure = params_Script
					LocalSpace}
				if NOT StructureContains \{structure = params_Script
						boxPositions}


				endif
				if ObjectExists id = <Name>
					<Name> :SetStartPos (<params_Script>.boxPositions [1])
				endif
			endif
		endif
	endif
	if ObjectExists id = <Name>
		if GotParam \{emit_script}
			<Name> :Obj_SpawnScriptLater <emit_script> params = <emit_params>
		endif
	endif
endscript

script CreateGameObject 
	if IsCompositeObjectManagerEnabled
		CreateCompositeObject <...>
	else
		CreateCompositeObjectInstance <...>
	endif
endscript

script JOW_RGBAToVector \{rgba = [
			0
			0
			0
			0
		]}
	return rgb = (<rgba> [0] * (1.0, 0.0, 0.0) + <rgba> [1] * (0.0, 1.0, 0.0) + <rgba> [2] * (0.0, 0.0, 1.0)) a = (<rgba> [3])
endscript

script JOW_VectorToRGBA \{rgb = (0.0, 0.0, 0.0)
		a = 0}
	rgba = [0 0 0 0]
	val = (<rgb>.(1.0, 0.0, 0.0))
	CastToInteger \{val}
	SetArrayElement ArrayName = rgba index = 0 NewValue = <val>
	val = (<rgb>.(0.0, 1.0, 0.0))
	CastToInteger \{val}
	SetArrayElement ArrayName = rgba index = 1 NewValue = <val>
	val = (<rgb>.(0.0, 0.0, 1.0))
	CastToInteger \{val}
	SetArrayElement ArrayName = rgba index = 2 NewValue = <val>
	CastToInteger \{a}
	SetArrayElement ArrayName = rgba index = 3 NewValue = <a>
	return rgba = <rgba>
endscript

script Hero_ContinuousTerrainParticles_Off 
	ClearEventHandlerGroup
	SetEventHandler \{event = NewTerrainType
		Scr = Hero_ContinuousTerrainParticles_On
		response = switch_script}
	OnExceptionRun
	Block
endscript

script Hero_ContinuousTerrainParticles_On 
	GetTerrainTypeParam param = TreadActions terrain_id = <TerrainType>
	if NOT StructureContains \{structure = TreadActions
			HeroContinuousParticleParams}
		Goto \{Hero_ContinuousTerrainParticles_Off}
	endif
	GetUniqueCompositeobjectID \{preferredID = Hero_ContinuousTerrainParticles}
	ClearEventHandlerGroup
	SetEventHandler event = NewTerrainType Scr = Hero_ContinuousTerrainParticles_Switch response = switch_script params = {ParticleId = <uniqueID>}
	OnExceptionRun
	begin
	if NOT CompositeObjectExists <uniqueID>
		CreateGameObject Priority = COIM_Priority_Effects Heap = Particle OldHeap = COM components = [
			{component = FlexibleParticle}
		] params = {
			Name = <uniqueID>
			(<TreadActions>.HeroContinuousParticleParams)
			NoVisibilityTest
			object_type = Particle
		}
	endif
	Obj_GetVelocity
	NormalizeVector <vel>
	Obj_GetPosition
	if CompositeObjectExists <uniqueID>
		<uniqueID> :Obj_SetPosition position = (((1.0, 0.0, 1.0) && <Pos>) + (0.0, 1.0, 0.0) * <TerrainParticleHeight> + (((1.0, 0.0, 1.0) && <norm>) * 0.1 * <length>))
	endif
	WaitOneGameFrame
	repeat
endscript

script Hero_ContinuousTerrainParticles_Switch 
	if CompositeObjectExists <ParticleId>
		<ParticleId> :EmitRate rate = 0
		<ParticleId> :Destroy ifEmpty = 1
	endif
	Goto Hero_ContinuousTerrainParticles_On params = <...>
endscript

script GetParticleType \{params_Script}
	Type = FLEXIBLE
	if CheckFlexibleParticleStructure <params_Script>
		if GlobalExists Name = <params_Script> Type = structure
			if StructureContains structure = (<params_Script>) ParticleType
				switch (<params_Script>.ParticleType)
					case FlexParticle
					Type = FLEXIBLE
					case SplineParticle
					Type = FAST
				endswitch
			else
				if StructureContains structure = (<params_Script>) Class
					if ((<params_Script>.Class) = ParticleObject)
						Type = FAST
					endif
				endif
			endif
		endif
	endif
	if CheckSplineParticleStructure <params_Script>
		if GlobalExists Name = <params_Script> Type = structure
			if StructureContains structure = (<params_Script>) ParticleType
				switch (<params_Script>.ParticleType)
					case FlexParticle
					Type = FLEXIBLE
					case SplineParticle
					Type = FAST
				endswitch
			else
				if StructureContains structure = (<params_Script>) Class
					if ((<params_Script>.Class) = ParticleObject)
						Type = FAST
					endif
				endif
			endif
		endif
	endif
	return Type = <Type>
endscript

script WaterRippleGenerated 
endscript
