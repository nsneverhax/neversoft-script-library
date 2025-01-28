Force_Particle_Update_Time = 1.0

script CreateFlexibleParticleSystem \{groupID = 0}
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{params_Script}
		Script_Assert \{"No <params_script> parameter"}
	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists Name = <params_Script> Type = Structure
			Printf "Global particle %s could not be found." S = <params_Script>
			return
		endif
	endif
	if NOT GotParam \{ObjID}
		Obj_GetID
	endif
	MangleChecksums A = <Name> B = <ObjID>
	if NOT ObjectExists Id = <mangled_ID>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyFlexibleParticleSystem
				ignore_duplicates
				Name = <mangled_ID>
				destroy_params = {Name = <Name> ObjID = <ObjID>}
			}
		endif
		alloc_flexible_particle params_Script = (<params_Script>) Name = <mangled_ID> ObjID = <ObjID> Bone = <Bone> attachNode = <attachNode> Bone = <Bone> groupID = <groupID> PERM = <PERM>
	endif
endscript

script CreateFlexibleParticleSystem_Editor 
	KillSpawnedScript \{Name = CreateFlexibleParticleSystem_Editor_Spawned}
	SpawnScriptNow CreateFlexibleParticleSystem_Editor_Spawned Params = <...>
endscript

script CreateFlexibleParticleSystem_Editor_Spawned \{groupID = 0}
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{params_Script}
		Script_Assert \{"No <params_script> parameter"}
	endif
	if NOT GotParam \{ObjID}
		Obj_GetID
	endif
	if GotParam \{attachObjID}
		<ObjID> = <attachObjID>
	endif
	if GotParam \{ObjID}
		attachObjID = <ObjID>
	endif
	if GotParam \{ObjID}
		MangleChecksums A = <Name> B = <attachObjID>
	else
		<mangled_ID> = <Name>
	endif
	if (IsCreated <Name>)
		<Name> :DIE
		Wait \{1
			Frame}
	endif
	if (IsCreated <mangled_ID>)
		<mangled_ID> :DIE
		Wait \{1
			Frame}
	endif
	if NOT IsCreated <mangled_ID>
		if (GotParam Attach)
			alloc_flexible_particle params_Script = (<params_Script>) Name = <mangled_ID> ObjID = <attachObjID> attachNode = <attachNode> Bone = <Bone> groupID = <groupID> PERM = <PERM>
		else
			alloc_flexible_particle params_Script = (<params_Script>) Name = <mangled_ID> groupID = <groupID> PERM = <PERM>
		endif
	endif
endscript

script GetFlexibleParticleSystem 
	if NOT GotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{ObjID}
		Obj_GetID
	endif
	MangleChecksums A = <Name> B = <ObjID>
	if ObjectExists Id = <mangled_ID>
		return systemID = <mangled_ID>
	endif
endscript

script DestroyFlexibleParticleSystem 
	if NOT GotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{ObjID}
		Obj_GetID
	endif
	MangleChecksums A = <Name> B = <ObjID>
	if ObjectExists Id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <mangled_ID>
		endif
		<mangled_ID> :DestroyParticles
	endif
endscript

script DestroyFlexibleParticleSystem_Editor 
	if NOT GotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{ObjID}
		Obj_GetID
	endif
	MangleChecksums A = <Name> B = <ObjID>
	if ObjectExists Id = <Name>
		<Name> :DestroyParticles
	endif
	if ObjectExists Id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <mangled_ID>
		endif
		<mangled_ID> :DestroyParticles
	endif
endscript
LockableFlexibleParticleComponents = [
	{
		Component = LockObj
	}
	{
		Component = FlexibleParticle
	}
]

script alloc_flexible_particle \{groupID = 0}
	if NOT CheckFlexibleParticleStructure <params_Script>
		Printf \{"Invalid particle structure"}
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
	CreateGameObject Priority = <Priority> Heap = <Heap> Components = $LockableFlexibleParticleComponents Params = {
		Name = <Name>
		<params_Script>
		IgnoreLockDie
		Id = <ObjID>
		parent_object = <ObjID>
		Bone = <Bone>
		groupID = <groupID>
		attachNode = <attachNode>
		object_type = Particle
	}
endscript
SuspendibleFlexibleParticleComponents = [
	{
		Component = FlexibleParticle
	}
]
FlexibleParticleComponents = [
	{
		Component = FlexibleParticle
	}
]

script CreateGlobalFlexParticleSystem \{groupID = 0}
	if NOT CheckFlexibleParticleStructure <params_Script>
		Printf \{"Invalid particle structure"}
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
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{params_Script}
		Script_Assert \{"No <params_script> parameter"}
	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists Name = <params_Script> Type = Structure
			Printf "Global particle %s could not be found." S = <params_Script>
			return
		endif
	endif
	if NOT ObjectExists Id = <Name>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyGlobalFlexParticleSystem
				ignore_duplicates
				Name = <Name>
				destroy_params = {Name = <Name>}
			}
		endif
		if StructureContains \{Structure = params_Script
				SuspendDistance}
			CreateGameObject Priority = <Priority> Heap = <Heap> Components = $SuspendibleFlexibleParticleComponents Params = {
				Name = <Name>
				<params_Script>
				groupID = <groupID>
				Pos = <Pos>
				object_type = Particle
			}
		else
			CreateGameObject Priority = <Priority> Heap = <Heap> Components = $FlexibleParticleComponents Params = {
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
		Script_Assert \{"No <name> parameter"}
	endif
	if ObjectExists Id = <Name>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <Name>
		endif
		<Name> :DestroyParticles
	endif
endscript

script CreateFastParticleSystem \{groupID = 0}
	CreateSplineParticleSystem Params = <...>
endscript

script CreateSplineParticleSystem \{groupID = 0}
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{params_Script}
		Script_Assert \{"No <params_script> parameter"}
	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists Name = <params_Script> Type = Structure
			Printf "Global particle %s could not be found." S = <params_Script>
			return
		endif
	endif
	if GotParam \{attachObjID}
		<ObjID> = <attachObjID>
	endif
	if GotParam \{ObjID}
		attachObjID = <ObjID>
	endif
	if GotParam \{ObjID}
		MangleChecksums A = <Name> B = <attachObjID>
	else
		<mangled_ID> = <Name>
	endif
	if NOT IsCreated <mangled_ID>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyFastParticleSystem
				ignore_duplicates
				Name = <mangled_ID>
				destroy_params = {Name = <Name> attachObjID = <attachObjID>}
			}
		endif
		alloc_spline_particle {params_Script = <params_Script> Name = <mangled_ID> attachObjID = <ObjID> ObjID = <ObjID> Bone = <Bone> groupID = <groupID>
			attachNode = <attachNode> emit_script = <emit_script> emit_params = <emit_params> PERM = <PERM> creation_node = <creation_node>}
	endif
	if ((IsCreated <mangled_ID>) && (GotParam ObjID) && (StructureContains Structure = params_Script ApplyEnvBrightness))
		<mangled_ID> :ApplyEnvBrightness from = <ObjID>
	endif
	if IsCreated <mangled_ID>
		return systemID = <mangled_ID>
	endif
endscript

script CreateSplineParticleSystem_Editor 
	KillSpawnedScript \{Name = CreateSplineParticleSystem_Editor_Spawned}
	SpawnScriptNow CreateSplineParticleSystem_Editor_Spawned Params = <...>
endscript

script CreateSplineParticleSystem_Editor_Spawned \{groupID = 0}
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{params_Script}
		Script_Assert \{"No <params_script> parameter"}
	endif
	if GotParam \{attachObjID}
		<ObjID> = <attachObjID>
	endif
	if GotParam \{ObjID}
		attachObjID = <ObjID>
	endif
	if GotParam \{ObjID}
		MangleChecksums A = <Name> B = <attachObjID>
	else
		<mangled_ID> = <Name>
	endif
	if (IsCreated <Name>)
		<Name> :DIE
		Wait \{1
			Frame}
	endif
	if (IsCreated <mangled_ID>)
		<mangled_ID> :DIE
		Wait \{1
			Frame}
	endif
	if (IsCreated <mangled_ID>)
		<mangled_ID> :UpdateParams {params_Script = <params_Script>}
		if GotParam \{Attach}
			<mangled_ID> :Obj_LockToObject ObjectName = <ObjID>
		else
			<mangled_ID> :Obj_LockToObject OFF ObjectName = <ObjID>
		endif
	else
		alloc_spline_particle {params_Script = <params_Script> Name = <mangled_ID> attachObjID = <ObjID> ObjID = <ObjID> Bone = <Bone> groupID = <groupID>
			attachNode = <attachNode> emit_script = <emit_script> emit_params = <emit_params> PERM = <PERM> creation_node = <creation_node>}
	endif
endscript
SuspendibleFastParticleComponents = [
	{
		Component = Particle
	}
]
FastParticleComponents = [
	{
		Component = Particle
	}
]

script CreateGlobalFastParticleSystem \{groupID = 0}
	if NOT CheckSplineParticleStructure <params_Script>
		Printf \{"Invalid particle structure"}
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
		Script_Assert \{"No <name> parameter"}
	endif
	if NOT GotParam \{params_Script}
		Script_Assert \{"No <params_script> parameter"}
	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists Name = <params_Script> Type = Structure
			Printf "Global particle %s could not be found." S = <params_Script>
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
		if StructureContains \{Structure = params_Script
				SuspendDistance}
			CreateGameObject Priority = <Priority> Heap = <Heap> Components = SuspendibleFastParticleComponents Params = {
				Name = <Name>
				parent_object = <ObjID>
				groupID = <groupID>
				<params_Script>
				Pos = <Pos>
				object_type = Particle
			}
		else
			CreateGameObject Priority = <Priority> Heap = <Heap> Components = $FastParticleComponents Params = {
				Name = <Name>
				parent_object = <ObjID>
				groupID = <groupID>
				<params_Script>
				Pos = <Pos>
				object_type = Particle
			}
		endif
	endif
	if IsCreated <Name>
		if GotParam \{emit_script}
			<Name> :Obj_SpawnScriptLater <emit_script> Params = <emit_params>
		endif
	endif
endscript

script DestroyGlobalFastParticleSystem 
	if NOT GotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if ObjectExists Id = <Name>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <Name>
		endif
		<Name> :DIE
	endif
endscript

script DestroyFastParticleSystem 
	if NOT GotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if GotParam \{ObjID}
		attachObjID = <ObjID>
	endif
	if GotParam \{attachObjID}
		MangleChecksums A = <Name> B = <attachObjID>
	else
		<mangled_ID> = <Name>
	endif
	if ObjectExists Id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <mangled_ID>
		endif
		<mangled_ID> :DIE
	endif
endscript

script DestroyParticleSystem_Editor 
	KillSpawnedScript \{Name = DestroyParticleSystem_Editor_Spawn}
	SpawnScriptNow DestroyParticleSystem_Editor_Spawn Params = <...>
endscript

script DestroyParticleSystem_Editor_Spawn 
	if NOT GotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if GotParam \{ObjID}
		attachObjID = <ObjID>
	endif
	if GotParam \{attachObjID}
		MangleChecksums A = <Name> B = <attachObjID>
	else
		<mangled_ID> = <Name>
	endif
	if ObjectExists Id = <mangled_ID>
		<mangled_ID> :DIE
	endif
	if ObjectExists Id = <Name>
		<Name> :DIE
	endif
endscript

script DestroySplineParticleSystem_Editor 
	if NOT GotParam \{Name}
		Script_Assert \{"No <name> parameter"}
	endif
	if GotParam \{ObjID}
		attachObjID = <ObjID>
	endif
	if GotParam \{attachObjID}
		MangleChecksums A = <Name> B = <attachObjID>
	else
		<mangled_ID> = <Name>
	endif
	if ObjectExists Id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <mangled_ID>
		endif
		<mangled_ID> :DIE
	endif
	if ObjectExists Id = <Name>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList Name = <Name>
		endif
		<Name> :DIE
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
	DIE
endscript
LockableSplineParticleComponents = [
	{
		Component = LockObj
	}
	{
		Component = Particle
	}
]

script alloc_spline_particle \{groupID = 0}
	if NOT CheckSplineParticleStructure <params_Script>
		Printf \{"Invalid particle structure"}
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
	if NOT ObjectExists Id = <Name>
		if GotParam \{attachObjID}
			CreateGameObject Priority = <Priority> Heap = <Heap> Components = $LockableSplineParticleComponents Params = {
				Name = <Name>
				<params_Script>
				Id = <attachObjID>
				IgnoreLockDie
				parent_object = <attachObjID>
				Bone = <Bone>
				groupID = <groupID>
				LocalSpace
				creation_node = <creation_node>
				object_type = Particle
			}
		else
			CreateGameObject Priority = <Priority> Heap = <Heap> {
				Components = [
					{
						Component = Particle
						Name = <Name>
						Bone = <Bone>
						groupID = <groupID>
						<params_Script>
					}
				]
				Params = {
					Name = <Name>
					Bone = <Bone>
					creation_node = <creation_node>
					object_type = Particle
				}
			}
			if StructureContains \{Structure = params_Script
					LocalSpace}
				if NOT StructureContains \{Structure = params_Script
						boxPositions}
					PrintStruct <params_Script>
					Script_Assert \{"No <boxPositions> parameter...  system should not have been defined in LocalSpace"}
				endif
				if ObjectExists Id = <Name>
					<Name> :SetStartPos (<params_Script>.boxPositions [1])
				endif
			endif
		endif
	endif
	if ObjectExists Id = <Name>
		if GotParam \{emit_script}
			<Name> :Obj_SpawnScriptLater <emit_script> Params = <emit_params>
		endif
	endif
endscript

script alloc_fast_particle \{groupID = 0}
	if NOT GotParam \{params_Script}
		if NOT GlobalExists Name = <params_Script> Type = Structure
			Printf "Global particle %s could not be found." S = <params_Script>
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
	if NOT ObjectExists Id = <Name>
		if GotParam \{attachObjID}
			CreateGameObject Priority = <Priority> Heap = <Heap> {
				Components = [
					{
						Component = LockObj
						Id = <attachObjID>
						<params_Script>
						IgnoreLockDie
					}
					{
						Component = Particle
						Name = <Name>
						groupID = <groupID>
						parent_object = <attachObjID>
						Bone = <Bone>
						<params_Script>
						systemLifetime = (<params_Script>.EmitDuration)
						systemLifetime = <systemLifetime>
					}
				]
				Params = {
					Name = <Name>
					Bone = <Bone>
					LocalSpace
					creation_node = <creation_node>
					object_type = Particle
				}
			}
		else
			CreateGameObject Priority = <Priority> Heap = <Heap> {
				Components = [
					{
						Component = Particle
						Name = <Name>
						Bone = <Bone>
						groupID = <groupID>
						<params_Script>
					}
				]
				Params = {
					Name = <Name>
					Bone = <Bone>
					creation_node = <creation_node>
					object_type = Particle
				}
			}
			if StructureContains \{Structure = params_Script
					LocalSpace}
				if NOT StructureContains \{Structure = params_Script
						boxPositions}
					PrintStruct <params_Script>
					Script_Assert \{"No <boxPositions> parameter...  system should not have been defined in LocalSpace"}
				endif
				if ObjectExists Id = <Name>
					<Name> :SetStartPos (<params_Script>.boxPositions [1])
				endif
			endif
		endif
	endif
	if ObjectExists Id = <Name>
		if GotParam \{emit_script}
			<Name> :Obj_SpawnScriptLater <emit_script> Params = <emit_params>
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
	return rgb = (<rgba> [0] * (1.0, 0.0, 0.0) + <rgba> [1] * (0.0, 1.0, 0.0) + <rgba> [2] * (0.0, 0.0, 1.0)) A = (<rgba> [3])
endscript

script JOW_VectorToRGBA \{rgb = (0.0, 0.0, 0.0)
		A = 0}
	rgba = [0 0 0 0]
	val = (<rgb>.(1.0, 0.0, 0.0))
	CastToInteger \{val}
	SetArrayElement ArrayName = rgba Index = 0 NewValue = <val>
	val = (<rgb>.(0.0, 1.0, 0.0))
	CastToInteger \{val}
	SetArrayElement ArrayName = rgba Index = 1 NewValue = <val>
	val = (<rgb>.(0.0, 0.0, 1.0))
	CastToInteger \{val}
	SetArrayElement ArrayName = rgba Index = 2 NewValue = <val>
	CastToInteger \{A}
	SetArrayElement ArrayName = rgba Index = 3 NewValue = <A>
	return rgba = <rgba>
endscript

script Hero_ContinuousTerrainParticles_Off 
	ClearEventHandlerGroup
	SetEventHandler \{Event = NewTerrainType
		Scr = Hero_ContinuousTerrainParticles_On
		Response = switch_script}
	OnExceptionRun
	Block
endscript

script Hero_ContinuousTerrainParticles_On 
	GetTerrainTypeParam Param = TreadActions terrain_id = <TerrainType>
	if NOT StructureContains \{Structure = TreadActions
			HeroContinuousParticleParams}
		Goto \{Hero_ContinuousTerrainParticles_Off}
	endif
	GetUniqueCompositeObjectID \{PreferredId = Hero_ContinuousTerrainParticles}
	ClearEventHandlerGroup
	SetEventHandler Event = NewTerrainType Scr = Hero_ContinuousTerrainParticles_Switch Response = switch_script Params = {ParticleId = <UniqueId>}
	OnExceptionRun
	begin
	if NOT CompositeObjectExists <UniqueId>
		CreateGameObject Priority = COIM_Priority_Effects Heap = Particle OldHeap = COM Components = [
			{Component = FlexibleParticle}
		] Params = {
			Name = <UniqueId>
			(<TreadActions>.HeroContinuousParticleParams)
			NoVisibilityTest
			object_type = Particle
		}
	endif
	Obj_GetVelocity
	NormalizeVector <vel>
	Obj_GetPosition
	if CompositeObjectExists <UniqueId>
		<UniqueId> :Obj_SetPosition Position = (((1.0, 0.0, 1.0) && <Pos>) + (0.0, 1.0, 0.0) * <TerrainParticleHeight> + (((1.0, 0.0, 1.0) && <norm>) * 0.1 * <Length>))
	endif
	Wait \{1
		GameFrame}
	repeat
endscript

script Hero_ContinuousTerrainParticles_Switch 
	if CompositeObjectExists <ParticleId>
		<ParticleId> :EmitRate RATE = 0
		<ParticleId> :Destroy IfEmpty = 1
	endif
	Goto Hero_ContinuousTerrainParticles_On Params = <...>
endscript

script GetParticleType \{params_Script}
	Type = FLEXIBLE
	if CheckFlexibleParticleStructure <params_Script>
		if GlobalExists Name = <params_Script> Type = Structure
			if StructureContains Structure = (<params_Script>) ParticleType
				switch (<params_Script>.ParticleType)
					case FlexParticle
					Type = FLEXIBLE
					case SplineParticle
					Type = FAST
				endswitch
			else
				if StructureContains Structure = (<params_Script>) Class
					if ((<params_Script>.Class) = ParticleObject)
						Type = FAST
					endif
				endif
			endif
		endif
	endif
	if CheckSplineParticleStructure <params_Script>
		if GlobalExists Name = <params_Script> Type = Structure
			if StructureContains Structure = (<params_Script>) ParticleType
				switch (<params_Script>.ParticleType)
					case FlexParticle
					Type = FLEXIBLE
					case SplineParticle
					Type = FAST
				endswitch
			else
				if StructureContains Structure = (<params_Script>) Class
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
