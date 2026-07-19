Force_Particle_Update_Time = 1.0

script CreateParticleSystem_WithScript 
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{name}
		script_assert \{qs("\LNo <name> parameter")}
	endif
	if NOT GotParam \{params_Script}
		printf \{qs("\LNo <params_script> parameter")}
		return
	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists name = <params_Script> type = Structure
			printf qs("\LGlobal particle %s could not be found.") s = <params_Script>
			return
		endif
	endif
	if GotParam \{ObjID}
		attachObjID = <ObjID>
		MangleChecksums a = <name> b = <attachObjID>
	else
		<mangled_ID> = <name>
	endif
	if ObjectExists id = <mangled_ID>
		printf \{qs("\LFailed to create particle object. Object already exists.")}
		return
	endif
	GetParticleType params_Script = <params_Script>
	if GotParam \{pos}
		if (<type> = Fast)
			CreateGlobalFastParticleSystem <...>
		else
			CreateGlobalFlexParticlesystem <...>
		endif
	else
		if (<type> = Fast)
			if CutsceneDestroyListActive
				AddToCutsceneDestroyList {
					destroy_func = DestroyFastParticleSystem
					name = <mangled_ID>
					destroy_params = {name = <name> attachObjID = <attachObjID>}
				}
			endif
			alloc_spline_particle {params_Script = <params_Script> name = <mangled_ID> attachObjID = <ObjID> ObjID = <ObjID> bone = <bone> groupID = <groupID>
				attachNode = <attachNode> emit_script = <emit_script> emit_params = <emit_params> PERM = <PERM> creation_node = <creation_node>}
		else
			if CutsceneDestroyListActive
				AddToCutsceneDestroyList {
					destroy_func = DestroyFlexibleParticleSystem
					name = <mangled_ID>
					destroy_params = {name = <name> ObjID = <ObjID>}
				}
			endif
			alloc_flexible_particle params_Script = (<params_Script>) name = <mangled_ID> ObjID = <ObjID> bone = <bone> attachNode = <attachNode> bone = <bone> groupID = <groupID> PERM = <PERM>
		endif
	endif
endscript

script CreateFlexibleParticleSystem \{groupID = 0}
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{name}
		script_assert \{qs("\LNo <name> parameter")}
	endif
	if NOT GotParam \{params_Script}
		script_assert \{qs("\LNo <params_script> parameter")}
	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists name = <params_Script> type = Structure
			printf qs("\LGlobal particle %s could not be found.") s = <params_Script>
			return
		endif
	endif
	if NOT GotParam \{ObjID}
		Obj_GetID
	endif
	MangleChecksums a = <name> b = <ObjID>
	if NOT ObjectExists id = <mangled_ID>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyFlexibleParticleSystem
				ignore_duplicates
				name = <mangled_ID>
				destroy_params = {name = <name> ObjID = <ObjID>}
			}
		endif
		alloc_flexible_particle params_Script = (<params_Script>) name = <mangled_ID> ObjID = <ObjID> bone = <bone> attachNode = <attachNode> bone = <bone> groupID = <groupID> PERM = <PERM>
	endif
endscript

script CreateFlexibleParticleSystem_Editor 
	KillSpawnedScript \{name = CreateFlexibleParticleSystem_Editor_Spawned}
	spawnscriptnow CreateFlexibleParticleSystem_Editor_Spawned params = <...>
endscript

script CreateFlexibleParticleSystem_Editor_Spawned \{groupID = 0}
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{name}
		script_assert \{qs("\LNo <name> parameter")}
	endif
	if NOT GotParam \{params_Script}
		script_assert \{qs("\LNo <params_script> parameter")}
	endif
	if NOT GotParam \{ObjID}
	endif
	if GotParam \{attachObjID}
		<ObjID> = <attachObjID>
	endif
	if GotParam \{ObjID}
		attachObjID = <ObjID>
	endif
	if GotParam \{ObjID}
		MangleChecksums a = <name> b = <attachObjID>
	else
		<mangled_ID> = <name>
	endif
	if (IsCreated <name>)
		<name> :Die
		Wait \{1
			frame}
	endif
	if (IsCreated <mangled_ID>)
		<mangled_ID> :Die
		Wait \{1
			frame}
	endif
	if NOT IsCreated <mangled_ID>
		if (GotParam attach)
			alloc_flexible_particle params_Script = (<params_Script>) name = <mangled_ID> ObjID = <attachObjID> attachNode = <attachNode> bone = <bone> groupID = <groupID> PERM = <PERM>
		else
			alloc_flexible_particle params_Script = (<params_Script>) name = <mangled_ID> groupID = <groupID> PERM = <PERM>
		endif
	endif
endscript

script GetFlexibleParticleSystem 
	if NOT GotParam \{name}
		script_assert \{qs("\LNo <name> parameter")}
	endif
	if NOT GotParam \{ObjID}
		Obj_GetID
	endif
	MangleChecksums a = <name> b = <ObjID>
	if ObjectExists id = <mangled_ID>
		return systemID = <mangled_ID>
	endif
endscript

script DestroyFlexibleParticleSystem 
	if NOT GotParam \{name}
		script_assert \{qs("\LNo <name> parameter")}
	endif
	if NOT GotParam \{ObjID}
		Obj_GetID
	endif
	MangleChecksums a = <name> b = <ObjID>
	if ObjectExists id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList name = <mangled_ID>
		endif
		<mangled_ID> :DestroyParticles
	endif
endscript

script DestroyFlexibleParticleSystem_Editor 
	if NOT GotParam \{name}
		script_assert \{qs("\LNo <name> parameter")}
	endif
	if NOT GotParam \{ObjID}
		Obj_GetID
	endif
	MangleChecksums a = <name> b = <ObjID>
	if ObjectExists id = <name>
		<name> :DestroyParticles
	endif
	if ObjectExists id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList name = <mangled_ID>
		endif
		<mangled_ID> :DestroyParticles
	endif
endscript
LockableFlexibleParticleComponents = [
	{
		Component = attach
	}
	{
		Component = flexibleparticle
	}
]

script alloc_flexible_particle \{groupID = 0}
	if NOT CheckFlexibleParticleStructure <params_Script>
		printf \{qs("\LInvalid particle structure")}
		return
	endif
	if GotParam \{PERM}
		if (<PERM> = 1)
			priority = COIM_Priority_Permanent
			heap = GameObj
		else
			priority = COIM_Priority_Effects
			heap = particle
		endif
	else
		priority = COIM_Priority_Effects
		heap = particle
	endif
	if GotParam \{ObjID}
		CreateGameObject priority = <priority> heap = <heap> Components = $LockableFlexibleParticleComponents params = {
			name = <name>
			<params_Script>
			IgnoreLockDie
			id = <ObjID>
			Attach_Target = <ObjID>
			parent_object = <ObjID>
			bone = <bone>
			Attach_Bone = <bone>
			groupID = <groupID>
			attachNode = <attachNode>
			object_type = particle
		}
	else
		CreateGameObject priority = <priority> heap = <heap> Components = $FlexibleParticleComponents params = {
			name = <name>
			<params_Script>
			groupID = <groupID>
			object_type = particle
			pos = <pos>
		}
	endif
endscript
SuspendibleFlexibleParticleComponents = [
	{
		Component = flexibleparticle
	}
]
FlexibleParticleComponents = [
	{
		Component = flexibleparticle
	}
]

script CreateGlobalFlexParticlesystem \{groupID = 0}
	if NOT CheckFlexibleParticleStructure <params_Script>
		printf \{qs("\LInvalid particle structure")}
		return
	endif
	if GotParam \{PERM}
		priority = COIM_Priority_Permanent
		heap = GameObj
	else
		priority = COIM_Priority_Effects
		heap = particle
	endif
	if NOT GotParam \{name}
		script_assert \{qs("\LNo <name> parameter")}
	endif
	if NOT GotParam \{params_Script}
		script_assert \{qs("\LNo <params_script> parameter")}
	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists name = <params_Script> type = Structure
			printf qs("\LGlobal particle %s could not be found.") s = <params_Script>
			return
		endif
	endif
	if NOT ObjectExists id = <name>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyGlobalFlexParticleSystem
				ignore_duplicates
				name = <name>
				destroy_params = {name = <name>}
			}
		endif
		if StructureContains \{Structure = params_Script
				SuspendDistance}
			CreateGameObject priority = <priority> heap = <heap> Components = $SuspendibleFlexibleParticleComponents params = {
				name = <name>
				<params_Script>
				groupID = <groupID>
				pos = <pos>
				object_type = particle
			}
		else
			CreateGameObject priority = <priority> heap = <heap> Components = $FlexibleParticleComponents params = {
				name = <name>
				<params_Script>
				groupID = <groupID>
				pos = <pos>
				object_type = particle
			}
		endif
	endif
endscript

script DestroyGlobalFlexParticleSystem 
	if NOT GotParam \{name}
		script_assert \{qs("\LNo <name> parameter")}
	endif
	if ObjectExists id = <name>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList name = <name>
		endif
		<name> :DestroyParticles
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
	if NOT GotParam \{name}
		script_assert \{qs("\LNo <name> parameter")}
	endif
	if NOT GotParam \{params_Script}
		script_assert \{qs("\LNo <params_script> parameter")}
	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists name = <params_Script> type = Structure
			printf qs("\LGlobal particle %s could not be found.") s = <params_Script>
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
		MangleChecksums a = <name> b = <attachObjID>
	else
		<mangled_ID> = <name>
	endif
	if NOT IsCreated <mangled_ID>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyFastParticleSystem
				ignore_duplicates
				name = <mangled_ID>
				destroy_params = {name = <name> attachObjID = <attachObjID>}
			}
		endif
		alloc_spline_particle {params_Script = <params_Script> name = <mangled_ID> attachObjID = <ObjID> ObjID = <ObjID> bone = <bone> groupID = <groupID>
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
	KillSpawnedScript \{name = CreateSplineParticleSystem_Editor_Spawned}
	spawnscriptnow CreateSplineParticleSystem_Editor_Spawned params = <...>
endscript

script CreateSplineParticleSystem_Editor_Spawned \{groupID = 0}
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{name}
		script_assert \{qs("\LNo <name> parameter")}
	endif
	if NOT GotParam \{params_Script}
		script_assert \{qs("\LNo <params_script> parameter")}
	endif
	if GotParam \{attachObjID}
		<ObjID> = <attachObjID>
	endif
	if GotParam \{ObjID}
		attachObjID = <ObjID>
	endif
	if GotParam \{ObjID}
		MangleChecksums a = <name> b = <attachObjID>
	else
		<mangled_ID> = <name>
	endif
	if (IsCreated <name>)
		<name> :Die
		Wait \{1
			frame}
	endif
	if (IsCreated <mangled_ID>)
		<mangled_ID> :Die
		Wait \{1
			frame}
	endif
	if (IsCreated <mangled_ID>)
		<mangled_ID> :UpdateParams {params_Script = <params_Script>}
		if GotParam \{attach}
			<mangled_ID> :Obj_LockToObject objectname = <ObjID>
		else
			<mangled_ID> :Obj_LockToObject off objectname = <ObjID>
		endif
	else
		alloc_spline_particle {params_Script = <params_Script> name = <mangled_ID> attachObjID = <ObjID> ObjID = <ObjID> bone = <bone> groupID = <groupID>
			attachNode = <attachNode> emit_script = <emit_script> emit_params = <emit_params> PERM = <PERM> creation_node = <creation_node>}
	endif
endscript
SuspendibleFastParticleComponents = [
	{
		Component = particle
	}
]
FastParticleComponents = [
	{
		Component = particle
	}
]

script CreateGlobalFastParticleSystem \{groupID = 0}
	if NOT CheckSplineParticleStructure <params_Script>
		printf \{qs("\LInvalid particle structure")}
		return
	endif
	if GotParam \{PERM}
		priority = COIM_Priority_Permanent
		heap = GameObj
	else
		priority = COIM_Priority_Effects
		heap = particle
	endif
	if NOT GotParam \{name}
		script_assert \{qs("\LNo <name> parameter")}
	endif
	if NOT GotParam \{params_Script}
		script_assert \{qs("\LNo <params_script> parameter")}
	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists name = <params_Script> type = Structure
			printf qs("\LGlobal particle %s could not be found.") s = <params_Script>
			return
		endif
	endif
	if NOT IsCreated <name>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyGlobalFastParticleSystem
				ignore_duplicates
				name = <name>
				destroy_params = {name = <name>}
			}
		endif
		if StructureContains \{Structure = params_Script
				SuspendDistance}
			CreateGameObject priority = <priority> heap = <heap> Components = SuspendibleFastParticleComponents params = {
				name = <name>
				parent_object = <ObjID>
				groupID = <groupID>
				<params_Script>
				pos = <pos>
				object_type = particle
			}
		else
			CreateGameObject priority = <priority> heap = <heap> Components = $FastParticleComponents params = {
				name = <name>
				parent_object = <ObjID>
				groupID = <groupID>
				<params_Script>
				pos = <pos>
				object_type = particle
			}
		endif
	endif
	if IsCreated <name>
		if GotParam \{emit_script}
			<name> :Obj_SpawnScriptLater <emit_script> params = <emit_params>
		endif
	endif
endscript

script DestroyGlobalFastParticleSystem 
	if NOT GotParam \{name}
		script_assert \{qs("\LNo <name> parameter")}
	endif
	if ObjectExists id = <name>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList name = <name>
		endif
		<name> :Die
	endif
endscript

script DestroyFastParticleSystem 
	if NOT GotParam \{name}
		script_assert \{qs("\LNo <name> parameter")}
	endif
	if GotParam \{ObjID}
		attachObjID = <ObjID>
	endif
	if GotParam \{attachObjID}
		MangleChecksums a = <name> b = <attachObjID>
	else
		<mangled_ID> = <name>
	endif
	if ObjectExists id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList name = <mangled_ID>
		endif
		<mangled_ID> :Die
	endif
endscript

script DestroyParticleSystem_Editor 
	KillSpawnedScript \{name = DestroyParticleSystem_Editor_Spawn}
	spawnscriptnow DestroyParticleSystem_Editor_Spawn params = <...>
endscript

script DestroyParticleSystem_Editor_Spawn 
	if NOT GotParam \{name}
		script_assert \{qs("\LNo <name> parameter")}
	endif
	if GotParam \{ObjID}
		attachObjID = <ObjID>
	endif
	if GotParam \{attachObjID}
		MangleChecksums a = <name> b = <attachObjID>
	else
		<mangled_ID> = <name>
	endif
	if ObjectExists id = <mangled_ID>
		<mangled_ID> :Die
	endif
	if ObjectExists id = <name>
		<name> :Die
	endif
endscript

script DestroySplineParticleSystem_Editor 
	if NOT GotParam \{name}
		script_assert \{qs("\LNo <name> parameter")}
	endif
	if GotParam \{ObjID}
		attachObjID = <ObjID>
	endif
	if GotParam \{attachObjID}
		MangleChecksums a = <name> b = <attachObjID>
	else
		<mangled_ID> = <name>
	endif
	if ObjectExists id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList name = <mangled_ID>
		endif
		<mangled_ID> :Die
	endif
	if ObjectExists id = <name>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList name = <name>
		endif
		<name> :Die
	endif
endscript

script EmitFastParticles 
	if GotParam \{wait_frames}
		Wait <wait_frames> frames
	else
		Wait <wait_seconds> seconds
	endif
	SetEmitRate \{0}
	begin
	if NOT IsEmitting
		break
	endif
	Wait \{1
		frame}
	repeat
	Die
endscript
LockableSplineParticleComponents = [
	{
		Component = attach
	}
	{
		Component = particle
	}
]

script alloc_spline_particle \{groupID = 0}
	if NOT CheckSplineParticleStructure <params_Script>
		printf \{qs("\LInvalid particle structure")}
		return
	endif
	if GotParam \{PERM}
		if (<PERM> = 1)
			priority = COIM_Priority_Permanent
			heap = GameObj
		else
			priority = COIM_Priority_Effects
			heap = particle
		endif
	else
		priority = COIM_Priority_Effects
		heap = particle
	endif
	if NOT ObjectExists id = <name>
		if GotParam \{attachObjID}
			CreateGameObject priority = <priority> heap = <heap> Components = $LockableSplineParticleComponents params = {
				name = <name>
				<params_Script>
				id = <attachObjID>
				Attach_Target = <attachObjID>
				IgnoreLockDie
				parent_object = <attachObjID>
				bone = <bone>
				Attach_Bone = <bone>
				groupID = <groupID>
				LocalSpace
				creation_node = <creation_node>
				object_type = particle
			}
		else
			CreateGameObject priority = <priority> heap = <heap> {
				Components = [
					{
						Component = particle
						name = <name>
						bone = <bone>
						groupID = <groupID>
						<params_Script>
					}
				]
				params = {
					name = <name>
					bone = <bone>
					creation_node = <creation_node>
					object_type = particle
				}
			}
			if StructureContains \{Structure = params_Script
					LocalSpace}
				if NOT StructureContains \{Structure = params_Script
						boxPositions}
					printstruct <params_Script>
					script_assert \{qs("\LNo <boxPositions> parameter...  system should not have been defined in LocalSpace")}
				endif
				if ObjectExists id = <name>
					<name> :SetStartPos (<params_Script>.boxPositions [1])
				endif
			endif
		endif
	endif
	if ObjectExists id = <name>
		if GotParam \{emit_script}
			<name> :Obj_SpawnScriptLater <emit_script> params = <emit_params>
		endif
	endif
endscript

script alloc_fast_particle \{groupID = 0}
	if NOT GotParam \{params_Script}
		if NOT GlobalExists name = <params_Script> type = Structure
			printf qs("\LGlobal particle %s could not be found.") s = <params_Script>
			return
		endif
	endif
	if GotParam \{PERM}
		if (<PERM> = 1)
			priority = COIM_Priority_Permanent
			heap = GameObj
		else
			priority = COIM_Priority_Effects
			heap = particle
		endif
	else
		priority = COIM_Priority_Effects
		heap = particle
	endif
	if NOT ObjectExists id = <name>
		if GotParam \{attachObjID}
			CreateGameObject priority = <priority> heap = <heap> {
				Components = [
					{
						Component = attach
						Attach_Target = <attachObjID>
						<params_Script>
						IgnoreLockDie
					}
					{
						Component = particle
						name = <name>
						groupID = <groupID>
						parent_object = <attachObjID>
						bone = <bone>
						<params_Script>
						systemLifetime = (<params_Script>.EmitDuration)
						systemLifetime = <systemLifetime>
					}
				]
				params = {
					name = <name>
					bone = <bone>
					LocalSpace
					creation_node = <creation_node>
					object_type = particle
				}
			}
		else
			CreateGameObject priority = <priority> heap = <heap> {
				Components = [
					{
						Component = particle
						name = <name>
						bone = <bone>
						groupID = <groupID>
						<params_Script>
					}
				]
				params = {
					name = <name>
					bone = <bone>
					creation_node = <creation_node>
					object_type = particle
				}
			}
			if StructureContains \{Structure = params_Script
					LocalSpace}
				if NOT StructureContains \{Structure = params_Script
						boxPositions}
					printstruct <params_Script>
					script_assert \{qs("\LNo <boxPositions> parameter...  system should not have been defined in LocalSpace")}
				endif
				if ObjectExists id = <name>
					<name> :SetStartPos (<params_Script>.boxPositions [1])
				endif
			endif
		endif
	endif
	if ObjectExists id = <name>
		if GotParam \{emit_script}
			<name> :Obj_SpawnScriptLater <emit_script> params = <emit_params>
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
	SetArrayElement ArrayName = rgba index = 0 newvalue = <val>
	val = (<rgb>.(0.0, 1.0, 0.0))
	CastToInteger \{val}
	SetArrayElement ArrayName = rgba index = 1 newvalue = <val>
	val = (<rgb>.(0.0, 0.0, 1.0))
	CastToInteger \{val}
	SetArrayElement ArrayName = rgba index = 2 newvalue = <val>
	CastToInteger \{a}
	SetArrayElement ArrayName = rgba index = 3 newvalue = <a>
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
	GetTerrainTypeParam param = treadActions terrain_id = <TerrainType>
	if NOT StructureContains \{Structure = treadActions
			HeroContinuousParticleParams}
		goto \{Hero_ContinuousTerrainParticles_Off}
	endif
	GetUniqueCompositeObjectID \{preferredID = Hero_ContinuousTerrainParticles}
	ClearEventHandlerGroup
	SetEventHandler event = NewTerrainType Scr = Hero_ContinuousTerrainParticles_Switch response = switch_script params = {ParticleId = <uniqueID>}
	OnExceptionRun
	begin
	if NOT CompositeObjectExists <uniqueID>
		CreateGameObject priority = COIM_Priority_Effects heap = particle OldHeap = COM Components = [
			{Component = flexibleparticle}
		] params = {
			name = <uniqueID>
			(<treadActions>.HeroContinuousParticleParams)
			NoVisibilityTest
			object_type = particle
		}
	endif
	Obj_GetVelocity
	NormalizeVector <vel>
	Obj_GetPosition
	if CompositeObjectExists <uniqueID>
		<uniqueID> :Obj_SetPosition position = (((1.0, 0.0, 1.0) && <pos>) + (0.0, 1.0, 0.0) * <TerrainParticleHeight> + (((1.0, 0.0, 1.0) && <norm>) * 0.1 * <length>))
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script Hero_ContinuousTerrainParticles_Switch 
	if CompositeObjectExists <ParticleId>
		<ParticleId> :EmitRate rate = 0
		<ParticleId> :destroy ifEmpty = 1
	endif
	goto Hero_ContinuousTerrainParticles_On params = <...>
endscript

script GetParticleType \{params_Script}
	type = FLEXIBLE
	if CheckFlexibleParticleStructure <params_Script>
		if GlobalExists name = <params_Script> type = Structure
			if StructureContains Structure = (<params_Script>) ParticleType
				switch (<params_Script>.ParticleType)
					case FlexParticle
					type = FLEXIBLE
					case SplineParticle
					type = Fast
				endswitch
			else
				if StructureContains Structure = (<params_Script>) Class
					if ((<params_Script>.Class) = ParticleObject)
						type = Fast
					endif
				endif
			endif
		endif
	endif
	if CheckSplineParticleStructure <params_Script>
		if GlobalExists name = <params_Script> type = Structure
			if StructureContains Structure = (<params_Script>) ParticleType
				switch (<params_Script>.ParticleType)
					case FlexParticle
					type = FLEXIBLE
					case SplineParticle
					type = Fast
				endswitch
			else
				if StructureContains Structure = (<params_Script>) Class
					if ((<params_Script>.Class) = ParticleObject)
						type = Fast
					endif
				endif
			endif
		endif
	endif
	return type = <type>
endscript

script WaterRippleGenerated 
endscript
