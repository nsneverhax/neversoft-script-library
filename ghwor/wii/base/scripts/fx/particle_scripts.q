Force_Particle_Update_Time = 1.0
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
		printf \{qs(0xc23eea76)}
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
		node_array_name = <node_array_name>
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
		printf \{qs(0xdc89d56a)}
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
					printstruct <params_Script>
					script_assert \{qs(0xc57b8c30)}
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
	Wait \{1
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
