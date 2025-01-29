Force_Particle_Update_Time = 1.0

script CreateMultiParticleSystems_Editor 
	if NOT GotParam \{ParamsArray}
		printf \{qs(0xd7f16651)}
		return
	endif
	GetArraySize \{ParamsArray}
	printf qs(0x633784b4) n = <array_size>
	wait_frames = 0
	k = 0
	begin
	<name> = (<ParamsArray> [<k>].name)
	if StructureContains structure = (<ParamsArray> [<k>]) attach
		<objID> = (<ParamsArray> [<k>].objID)
		MangleChecksums a = <name> b = <objID>
	else
		<mangled_ID> = <name>
	endif
	if ObjectExists id = <mangled_ID>
		printf qs(0xc877d999) n = <mangled_ID>
		<mangled_ID> :Die
		<wait_frames> = 2
	endif
	k = (<k> + 1)
	repeat <array_size>
	wait <wait_frames> frames
	k = 0
	begin
	<params_Script> = (<ParamsArray> [<k>].params_Script)
	<name> = (<ParamsArray> [<k>].name)
	<objID> = (<ParamsArray> [<k>].objID)
	if StructureContains structure = (<ParamsArray> [<k>]) attach
		CreateParticleSystem_Editor params_Script = <params_Script> name = <name> objID = <objID> attach
	else
		CreateParticleSystem_Editor params_Script = <params_Script> name = <name>
	endif
	k = (<k> + 1)
	repeat <array_size>
endscript

script CreateParticleSystem_Editor 
	if NOT GotParam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT GotParam \{params_Script}
		printf \{qs(0x655e60db)}
		return
	endif
	if GotParam \{objID}
		MangleChecksums a = <name> b = <objID>
	else
		<mangled_ID> = <name>
	endif
	if ObjectExists id = <mangled_ID>
		printf qs(0xe167f684) n = <mangled_ID>
		<mangled_ID> :Die
		wait \{2
			frames}
	endif
	GetParticleType params_Script = <params_Script>
	if (<type> = FAST)
		if GotParam \{objID}
			alloc_spline_particle {params_Script = <params_Script> name = <mangled_ID> attachObjId = <objID> objID = <objID> bone = <bone> groupID = <groupID>
				attachNode = <attachNode> emit_script = <emit_script> emit_params = <emit_params> creation_node = <creation_node>}
		else
			alloc_spline_particle {params_Script = <params_Script> name = <name> groupID = <groupID>
				attachNode = <attachNode> emit_script = <emit_script> emit_params = <emit_params> creation_node = <creation_node>}
		endif
	else
		if GotParam \{objID}
			alloc_flexible_particle {params_Script = (<params_Script>) name = <mangled_ID> objID = <objID> bone = <bone> attachNode = <attachNode> groupID = <groupID>}
		else
			alloc_flexible_particle {params_Script = (<params_Script>) name = <name> groupID = <groupID>}
		endif
	endif
endscript

script CreateParticleSystem_WithScript 
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT GotParam \{params_Script}
		printf \{qs(0x655e60db)}
		return
	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists name = <params_Script> type = structure
			printf qs(0x8b7c4d9a) s = <params_Script>
			return
		endif
	endif
	if GotParam \{objID}
		attachObjId = <objID>
		MangleChecksums a = <name> b = <attachObjId>
	else
		<mangled_ID> = <name>
	endif
	if ObjectExists id = <mangled_ID>
		printf \{qs(0xe8472488)}
		return
	endif
	GetParticleType params_Script = <params_Script>
	if GotParam \{Pos}
		if (<type> = FAST)
			CreateGlobalFastParticleSystem <...>
		else
			CreateGlobalFlexParticleSystem <...>
		endif
	else
		if (<type> = FAST)
			if CutsceneDestroyListActive
				AddToCutsceneDestroyList {
					destroy_func = DestroyFastParticleSystem
					name = <mangled_ID>
					destroy_params = {name = <name> attachObjId = <attachObjId>}
				}
			endif
			alloc_spline_particle {params_Script = <params_Script> name = <mangled_ID> attachObjId = <objID> objID = <objID> bone = <bone> groupID = <groupID>
				attachNode = <attachNode> emit_script = <emit_script> emit_params = <emit_params> PERM = <PERM> creation_node = <creation_node>}
		else
			if CutsceneDestroyListActive
				AddToCutsceneDestroyList {
					destroy_func = DestroyFlexibleParticleSystem
					name = <mangled_ID>
					destroy_params = {name = <name> objID = <objID>}
				}
			endif
			alloc_flexible_particle params_Script = (<params_Script>) name = <mangled_ID> objID = <objID> bone = <bone> attachNode = <attachNode> bone = <bone> groupID = <groupID> PERM = <PERM>
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
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT GotParam \{params_Script}
		script_assert \{qs(0x655e60db)}
	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists name = <params_Script> type = structure
			printf qs(0x8b7c4d9a) s = <params_Script>
			return
		endif
	endif
	if NOT GotParam \{objID}
		Obj_GetID
	endif
	MangleChecksums a = <name> b = <objID>
	if NOT ObjectExists id = <mangled_ID>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyFlexibleParticleSystem
				ignore_duplicates
				name = <mangled_ID>
				destroy_params = {name = <name> objID = <objID>}
			}
		endif
		alloc_flexible_particle params_Script = (<params_Script>) name = <mangled_ID> objID = <objID> bone = <bone> attachNode = <attachNode> bone = <bone> groupID = <groupID> PERM = <PERM>
	endif
endscript

script CreateMultiFlexibleParticleSystem_Editor 
	if NOT GotParam \{ParamsArray}
		printf \{qs(0xd7f16651)}
		return
	endif
	GetArraySize \{ParamsArray}
	printf qs(0x633784b4) n = <array_size>
	k = 0
	begin
	<params_Script> = (<ParamsArray> [<k>].params_Script)
	<name> = (<ParamsArray> [<k>].name)
	<objID> = (<ParamsArray> [<k>].objID)
	if StructureContains structure = (<ParamsArray> [<k>]) attach
		CreateFlexibleParticleSystem_Editor_Spawned params_Script = <params_Script> name = <name> objID = <objID> attach
	else
		CreateFlexibleParticleSystem_Editor_Spawned params_Script = <params_Script> name = <name>
	endif
	k = (<k> + 1)
	repeat <array_size>
endscript

script CreateFlexibleParticleSystem_Editor 
	killspawnedscript \{name = CreateFlexibleParticleSystem_Editor_Spawned}
	spawnscriptnow CreateFlexibleParticleSystem_Editor_Spawned params = <...>
endscript

script CreateFlexibleParticleSystem_Editor_Spawned \{groupID = 0}
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT GotParam \{params_Script}
		script_assert \{qs(0x655e60db)}
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
		MangleChecksums a = <name> b = <attachObjId>
	else
		<mangled_ID> = <name>
	endif
	if (GotParam attach)
		if (IsCreated <mangled_ID>)
			<mangled_ID> :Destroy
			wait \{1
				frame}
		endif
		if NOT IsCreated <mangled_ID>
			alloc_flexible_particle {
				params_Script = (<params_Script>)
				name = <mangled_ID>
				objID = <attachObjId>
				attachNode = <attachNode>
				bone = <bone>
				groupID = <groupID>
				PERM = <PERM>
			}
		endif
	else
		if (IsCreated <name>)
			<name> :Destroy
			wait \{1
				frame}
		endif
		if NOT IsCreated <name>
			alloc_flexible_particle {
				params_Script = (<params_Script>)
				name = <name>
				groupID = <groupID>
				PERM = <PERM>
			}
		endif
	endif
endscript

script GetFlexibleParticleSystem 
	if NOT GotParam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT GotParam \{objID}
		Obj_GetID
	endif
	MangleChecksums a = <name> b = <objID>
	if ObjectExists id = <mangled_ID>
		return systemID = <mangled_ID>
	endif
endscript

script DestroyFlexibleParticleSystem 
	if NOT GotParam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT GotParam \{objID}
		Obj_GetID
	endif
	MangleChecksums a = <name> b = <objID>
	if ObjectExists id = <mangled_ID>
		if CutsceneDestroyListActive
			RemoveFromCutsceneDestroyList name = <mangled_ID>
		endif
		<mangled_ID> :DestroyParticles
	endif
endscript

script DestroyFlexibleParticleSystem_Editor 
	if NOT GotParam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT GotParam \{objID}
		Obj_GetID
	endif
	MangleChecksums a = <name> b = <objID>
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
		component = attach
	}
	{
		component = FlexibleParticle
	}
]

script alloc_flexible_particle \{groupID = 0}
	if NOT CheckFlexibleParticleStructure <params_Script>
		printf \{qs(0xc23eea76)}
		return
	endif
	if GotParam \{PERM}
		if (<PERM> = 1)
			Priority = COIM_Priority_Permanent
			heap = GameObj
		else
			Priority = COIM_Priority_Effects
			heap = Particle
		endif
	else
		Priority = COIM_Priority_Effects
		heap = Particle
	endif
	CreateGameObject Priority = <Priority> heap = <heap> components = $LockableFlexibleParticleComponents params = {
		name = <name>
		<params_Script>
		IgnoreLockDie
		id = <objID>
		Attach_Target = <objID>
		parent_object = <objID>
		bone = <bone>
		Attach_Bone = <bone>
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
		printf \{qs(0x333ba401)}
		return
	endif
	if GotParam \{PERM}
		Priority = COIM_Priority_Permanent
		heap = GameObj
	else
		Priority = COIM_Priority_Effects
		heap = Particle
	endif
	if NOT GotParam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT GotParam \{params_Script}
		script_assert \{qs(0x655e60db)}
	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists name = <params_Script> type = structure
			printf qs(0x8b7c4d9a) s = <params_Script>
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
		if StructureContains \{structure = params_Script
				SuspendDistance}
			CreateGameObject Priority = <Priority> heap = <heap> components = $SuspendibleFlexibleParticleComponents params = {
				name = <name>
				<params_Script>
				groupID = <groupID>
				Pos = <Pos>
				object_type = Particle
			}
		else
			CreateGameObject Priority = <Priority> heap = <heap> components = $FlexibleParticleComponents params = {
				name = <name>
				<params_Script>
				groupID = <groupID>
				Pos = <Pos>
				object_type = Particle
			}
		endif
	endif
endscript

script DestroyGlobalFlexParticleSystem 
	if NOT GotParam \{name}
		script_assert \{qs(0xdef61e20)}
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
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT GotParam \{params_Script}
		script_assert \{qs(0x655e60db)}
	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists name = <params_Script> type = structure
			printf qs(0x8b7c4d9a) s = <params_Script>
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
		MangleChecksums a = <name> b = <attachObjId>
	else
		<mangled_ID> = <name>
	endif
	if NOT IsCreated <mangled_ID>
		if CutsceneDestroyListActive
			AddToCutsceneDestroyList {
				destroy_func = DestroyFastParticleSystem
				ignore_duplicates
				name = <mangled_ID>
				destroy_params = {name = <name> attachObjId = <attachObjId>}
			}
		endif
		alloc_spline_particle {params_Script = <params_Script> name = <mangled_ID> attachObjId = <objID> objID = <objID> bone = <bone> groupID = <groupID>
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
	killspawnedscript \{name = CreateSplineParticleSystem_Editor_Spawned}
	spawnscriptnow CreateSplineParticleSystem_Editor_Spawned params = <...>
endscript

script CreateSplineParticleSystem_Editor_Spawned \{groupID = 0}
	if GotParam \{PERM}
		PERM = 1
	else
		PERM = 0
	endif
	if NOT GotParam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT GotParam \{params_Script}
		script_assert \{qs(0x655e60db)}
	endif
	if GotParam \{attachObjId}
		<objID> = <attachObjId>
	endif
	if GotParam \{objID}
		attachObjId = <objID>
	endif
	if GotParam \{objID}
		MangleChecksums a = <name> b = <attachObjId>
	else
		<mangled_ID> = <name>
	endif
	if (GotParam attach)
		if (IsCreated <mangled_ID>)
			<mangled_ID> :Destroy
			wait \{1
				frame}
		endif
		if NOT IsCreated <mangled_ID>
			alloc_spline_particle {
				params_Script = <params_Script>
				name = <mangled_ID>
				attachObjId = <objID>
				objID = <objID>
				bone = <bone>
				groupID = <groupID>
				attachNode = <attachNode>
				emit_script = <emit_script>
				emit_params = <emit_params>
				PERM = <PERM>
				creation_node = <creation_node>
			}
		endif
	else
		if (IsCreated <name>)
			<name> :Destroy
			wait \{1
				frame}
		endif
		if NOT IsCreated <name>
			alloc_spline_particle {
				params_Script = <params_Script>
				name = <name>
				groupID = <groupID>
				emit_script = <emit_script>
				emit_params = <emit_params>
				PERM = <PERM>
				creation_node = <creation_node>
			}
		endif
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
		printf \{qs(0xe730d5e9)}
		return
	endif
	if GotParam \{PERM}
		Priority = COIM_Priority_Permanent
		heap = GameObj
	else
		Priority = COIM_Priority_Effects
		heap = Particle
	endif
	if NOT GotParam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT GotParam \{params_Script}
		script_assert \{qs(0x655e60db)}
	endif
	if NOT GotParam \{params_Script}
		if NOT GlobalExists name = <params_Script> type = structure
			printf qs(0x8b7c4d9a) s = <params_Script>
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
		if StructureContains \{structure = params_Script
				SuspendDistance}
			CreateGameObject Priority = <Priority> heap = <heap> components = SuspendibleFastParticleComponents params = {
				name = <name>
				parent_object = <objID>
				groupID = <groupID>
				<params_Script>
				Pos = <Pos>
				object_type = Particle
			}
		else
			CreateGameObject Priority = <Priority> heap = <heap> components = $FastParticleComponents params = {
				name = <name>
				parent_object = <objID>
				groupID = <groupID>
				<params_Script>
				Pos = <Pos>
				object_type = Particle
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
		script_assert \{qs(0xdef61e20)}
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
		script_assert \{qs(0xdef61e20)}
	endif
	if GotParam \{objID}
		attachObjId = <objID>
	endif
	if GotParam \{attachObjId}
		MangleChecksums a = <name> b = <attachObjId>
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
	killspawnedscript \{name = DestroyParticleSystem_Editor_Spawn}
	spawnscriptnow DestroyParticleSystem_Editor_Spawn params = <...>
endscript

script DestroyParticleSystem_Editor_Spawn 
	if NOT GotParam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if GotParam \{objID}
		attachObjId = <objID>
	endif
	if GotParam \{attachObjId}
		MangleChecksums a = <name> b = <attachObjId>
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
		script_assert \{qs(0xdef61e20)}
	endif
	if GotParam \{objID}
		attachObjId = <objID>
	endif
	if GotParam \{attachObjId}
		MangleChecksums a = <name> b = <attachObjId>
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
		wait <wait_frames> frames
	else
		wait <wait_seconds> seconds
	endif
	SetEmitRate \{0}
	begin
	if NOT IsEmitting
		break
	endif
	wait \{1
		frame}
	repeat
	Die
endscript
LockableSplineParticleComponents = [
	{
		component = attach
	}
	{
		component = Particle
	}
]

script alloc_spline_particle \{groupID = 0}
	if NOT CheckSplineParticleStructure <params_Script>
		printf \{qs(0xdc89d56a)}
		return
	endif
	if GotParam \{PERM}
		if (<PERM> = 1)
			Priority = COIM_Priority_Permanent
			heap = GameObj
		else
			Priority = COIM_Priority_Effects
			heap = Particle
		endif
	else
		Priority = COIM_Priority_Effects
		heap = Particle
	endif
	if NOT ObjectExists id = <name>
		if GotParam \{attachObjId}
			CreateGameObject Priority = <Priority> heap = <heap> components = $LockableSplineParticleComponents params = {
				name = <name>
				<params_Script>
				id = <attachObjId>
				Attach_Target = <attachObjId>
				IgnoreLockDie
				parent_object = <attachObjId>
				bone = <bone>
				Attach_Bone = <bone>
				groupID = <groupID>
				LocalSpace
				creation_node = <creation_node>
				object_type = Particle
			}
		else
			CreateGameObject Priority = <Priority> heap = <heap> {
				components = [
					{
						component = Particle
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
					object_type = Particle
				}
			}
			if StructureContains \{structure = params_Script
					LocalSpace}
				if NOT StructureContains \{structure = params_Script
						boxPositions}
					printstruct <params_Script>
					script_assert \{qs(0xc57b8c30)}
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
		if NOT GlobalExists name = <params_Script> type = structure
			printf qs(0x8b7c4d9a) s = <params_Script>
			return
		endif
	endif
	if GotParam \{PERM}
		if (<PERM> = 1)
			Priority = COIM_Priority_Permanent
			heap = GameObj
		else
			Priority = COIM_Priority_Effects
			heap = Particle
		endif
	else
		Priority = COIM_Priority_Effects
		heap = Particle
	endif
	if NOT ObjectExists id = <name>
		if GotParam \{attachObjId}
			CreateGameObject Priority = <Priority> heap = <heap> {
				components = [
					{
						component = attach
						Attach_Target = <attachObjId>
						<params_Script>
						IgnoreLockDie
					}
					{
						component = Particle
						name = <name>
						groupID = <groupID>
						parent_object = <attachObjId>
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
					object_type = Particle
				}
			}
		else
			CreateGameObject Priority = <Priority> heap = <heap> {
				components = [
					{
						component = Particle
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
					object_type = Particle
				}
			}
			if StructureContains \{structure = params_Script
					LocalSpace}
				if NOT StructureContains \{structure = params_Script
						boxPositions}
					printstruct <params_Script>
					script_assert \{qs(0xc57b8c30)}
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
	GetUniqueCompositeObjectID \{preferredID = Hero_ContinuousTerrainParticles}
	ClearEventHandlerGroup
	SetEventHandler event = NewTerrainType Scr = Hero_ContinuousTerrainParticles_Switch response = switch_script params = {ParticleId = <uniqueID>}
	OnExceptionRun
	begin
	if NOT CompositeObjectExists <uniqueID>
		CreateGameObject Priority = COIM_Priority_Effects heap = Particle OldHeap = COM components = [
			{component = FlexibleParticle}
		] params = {
			name = <uniqueID>
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
	wait \{1
		gameframe}
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
	type = FLEXIBLE
	if CheckFlexibleParticleStructure <params_Script>
		type = FLEXIBLE
		if GlobalExists name = <params_Script> type = structure
			if StructureContains structure = (<params_Script>) ParticleType
				switch (<params_Script>.ParticleType)
					case FlexParticle
					type = FLEXIBLE
					case SplineParticle
					type = FAST
				endswitch
			else
				if StructureContains structure = (<params_Script>) Class
					if ((<params_Script>.Class) = ParticleObject)
						type = FAST
					endif
				endif
			endif
		endif
	endif
	if CheckSplineParticleStructure <params_Script>
		type = FAST
		if GlobalExists name = <params_Script> type = structure
			if StructureContains structure = (<params_Script>) ParticleType
				switch (<params_Script>.ParticleType)
					case FlexParticle
					type = FLEXIBLE
					case SplineParticle
					type = FAST
				endswitch
			else
				if StructureContains structure = (<params_Script>) Class
					if ((<params_Script>.Class) = ParticleObject)
						type = FAST
					endif
				endif
			endif
		endif
	endif
	return type = <type>
endscript

script WaterRippleGenerated 
endscript
