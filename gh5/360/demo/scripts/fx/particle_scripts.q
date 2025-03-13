force_particle_update_time = 1.0

script createparticlesystem_withscript 
	if gotparam \{perm}
		perm = 1
	else
		perm = 0
	endif
	if NOT gotparam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT gotparam \{params_script}
		printf \{qs(0x655e60db)}
		return
	endif
	if NOT gotparam \{params_script}
		if NOT globalexists name = <params_script> type = structure
			printf qs(0x8b7c4d9a) s = <params_script>
			return
		endif
	endif
	if gotparam \{objid}
		attachobjid = <objid>
		manglechecksums a = <name> b = <attachobjid>
	else
		<mangled_id> = <name>
	endif
	if objectexists id = <mangled_id>
		printf \{qs(0xe8472488)}
		return
	endif
	getparticletype params_script = <params_script>
	if gotparam \{pos}
		if (<type> = fast)
			createglobalfastparticlesystem <...>
		else
			createglobalflexparticlesystem <...>
		endif
	else
		if (<type> = fast)
			if cutscenedestroylistactive
				addtocutscenedestroylist {
					destroy_func = destroyfastparticlesystem
					name = <mangled_id>
					destroy_params = {name = <name> attachobjid = <attachobjid>}
				}
			endif
			alloc_spline_particle {params_script = <params_script> name = <mangled_id> attachobjid = <objid> objid = <objid> bone = <bone> groupid = <groupid>
				attachnode = <attachnode> emit_script = <emit_script> emit_params = <emit_params> perm = <perm> creation_node = <creation_node>}
		else
			if cutscenedestroylistactive
				addtocutscenedestroylist {
					destroy_func = destroyflexibleparticlesystem
					name = <mangled_id>
					destroy_params = {name = <name> objid = <objid>}
				}
			endif
			alloc_flexible_particle params_script = (<params_script>) name = <mangled_id> objid = <objid> bone = <bone> attachnode = <attachnode> bone = <bone> groupid = <groupid> perm = <perm>
		endif
	endif
endscript

script createflexibleparticlesystem \{groupid = 0}
	if gotparam \{perm}
		perm = 1
	else
		perm = 0
	endif
	if NOT gotparam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT gotparam \{params_script}
		script_assert \{qs(0x655e60db)}
	endif
	if NOT gotparam \{params_script}
		if NOT globalexists name = <params_script> type = structure
			printf qs(0x8b7c4d9a) s = <params_script>
			return
		endif
	endif
	if NOT gotparam \{objid}
		obj_getid
	endif
	manglechecksums a = <name> b = <objid>
	if NOT objectexists id = <mangled_id>
		if cutscenedestroylistactive
			addtocutscenedestroylist {
				destroy_func = destroyflexibleparticlesystem
				ignore_duplicates
				name = <mangled_id>
				destroy_params = {name = <name> objid = <objid>}
			}
		endif
		alloc_flexible_particle params_script = (<params_script>) name = <mangled_id> objid = <objid> bone = <bone> attachnode = <attachnode> bone = <bone> groupid = <groupid> perm = <perm>
	endif
endscript

script createflexibleparticlesystem_editor 
	killspawnedscript \{name = createflexibleparticlesystem_editor_spawned}
	spawnscriptnow createflexibleparticlesystem_editor_spawned params = <...>
endscript

script createflexibleparticlesystem_editor_spawned \{groupid = 0}
	if gotparam \{perm}
		perm = 1
	else
		perm = 0
	endif
	if NOT gotparam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT gotparam \{params_script}
		script_assert \{qs(0x655e60db)}
	endif
	if NOT gotparam \{objid}
	endif
	if gotparam \{attachobjid}
		<objid> = <attachobjid>
	endif
	if gotparam \{objid}
		attachobjid = <objid>
	endif
	if gotparam \{objid}
		manglechecksums a = <name> b = <attachobjid>
	else
		<mangled_id> = <name>
	endif
	if (iscreated <name>)
		<name> :destroy
		wait \{1
			frame}
	endif
	if (iscreated <mangled_id>)
		<mangled_id> :destroy
		wait \{1
			frame}
	endif
	if NOT iscreated <mangled_id>
		if (gotparam attach)
			alloc_flexible_particle params_script = (<params_script>) name = <mangled_id> objid = <attachobjid> attachnode = <attachnode> bone = <bone> groupid = <groupid> perm = <perm>
		else
			alloc_flexible_particle params_script = (<params_script>) name = <mangled_id> groupid = <groupid> perm = <perm>
		endif
	endif
endscript

script getflexibleparticlesystem 
	if NOT gotparam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT gotparam \{objid}
		obj_getid
	endif
	manglechecksums a = <name> b = <objid>
	if objectexists id = <mangled_id>
		return systemid = <mangled_id>
	endif
endscript

script destroyflexibleparticlesystem 
	if NOT gotparam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT gotparam \{objid}
		obj_getid
	endif
	manglechecksums a = <name> b = <objid>
	if objectexists id = <mangled_id>
		if cutscenedestroylistactive
			removefromcutscenedestroylist name = <mangled_id>
		endif
		<mangled_id> :destroyparticles
	endif
endscript

script destroyflexibleparticlesystem_editor 
	if NOT gotparam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT gotparam \{objid}
		obj_getid
	endif
	manglechecksums a = <name> b = <objid>
	if objectexists id = <name>
		<name> :destroyparticles
	endif
	if objectexists id = <mangled_id>
		if cutscenedestroylistactive
			removefromcutscenedestroylist name = <mangled_id>
		endif
		<mangled_id> :destroyparticles
	endif
endscript
lockableflexibleparticlecomponents = [
	{
		component = attach
	}
	{
		component = flexibleparticle
	}
]

script alloc_flexible_particle \{groupid = 0}
	if NOT checkflexibleparticlestructure <params_script>
		printf \{qs(0xc23eea76)}
		return
	endif
	if gotparam \{perm}
		if (<perm> = 1)
			priority = coim_priority_permanent
			heap = gameobj
		else
			priority = coim_priority_effects
			heap = particle
		endif
	else
		priority = coim_priority_effects
		heap = particle
	endif
	creategameobject priority = <priority> heap = <heap> components = $lockableflexibleparticlecomponents params = {
		name = <name>
		<params_script>
		ignorelockdie
		id = <objid>
		attach_target = <objid>
		parent_object = <objid>
		bone = <bone>
		attach_bone = <bone>
		groupid = <groupid>
		attachnode = <attachnode>
		object_type = particle
	}
endscript
suspendibleflexibleparticlecomponents = [
	{
		component = flexibleparticle
	}
]
flexibleparticlecomponents = [
	{
		component = flexibleparticle
	}
]

script createglobalflexparticlesystem \{groupid = 0}
	if NOT checkflexibleparticlestructure <params_script>
		printf \{qs(0x333ba401)}
		return
	endif
	if gotparam \{perm}
		priority = coim_priority_permanent
		heap = gameobj
	else
		priority = coim_priority_effects
		heap = particle
	endif
	if NOT gotparam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT gotparam \{params_script}
		script_assert \{qs(0x655e60db)}
	endif
	if NOT gotparam \{params_script}
		if NOT globalexists name = <params_script> type = structure
			printf qs(0x8b7c4d9a) s = <params_script>
			return
		endif
	endif
	if NOT objectexists id = <name>
		if cutscenedestroylistactive
			addtocutscenedestroylist {
				destroy_func = destroyglobalflexparticlesystem
				ignore_duplicates
				name = <name>
				destroy_params = {name = <name>}
			}
		endif
		if structurecontains \{structure = params_script
				suspenddistance}
			creategameobject priority = <priority> heap = <heap> components = $suspendibleflexibleparticlecomponents params = {
				name = <name>
				<params_script>
				groupid = <groupid>
				pos = <pos>
				object_type = particle
			}
		else
			creategameobject priority = <priority> heap = <heap> components = $flexibleparticlecomponents params = {
				name = <name>
				<params_script>
				groupid = <groupid>
				pos = <pos>
				object_type = particle
			}
		endif
	endif
endscript

script destroyglobalflexparticlesystem 
	if NOT gotparam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if objectexists id = <name>
		if cutscenedestroylistactive
			removefromcutscenedestroylist name = <name>
		endif
		<name> :destroyparticles
	endif
endscript

script createfastparticlesystem \{groupid = 0}
	createsplineparticlesystem params = <...>
endscript

script createsplineparticlesystem \{groupid = 0}
	if gotparam \{perm}
		perm = 1
	else
		perm = 0
	endif
	if NOT gotparam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT gotparam \{params_script}
		script_assert \{qs(0x655e60db)}
	endif
	if NOT gotparam \{params_script}
		if NOT globalexists name = <params_script> type = structure
			printf qs(0x8b7c4d9a) s = <params_script>
			return
		endif
	endif
	if gotparam \{attachobjid}
		<objid> = <attachobjid>
	endif
	if gotparam \{objid}
		attachobjid = <objid>
	endif
	if gotparam \{objid}
		manglechecksums a = <name> b = <attachobjid>
	else
		<mangled_id> = <name>
	endif
	if NOT iscreated <mangled_id>
		if cutscenedestroylistactive
			addtocutscenedestroylist {
				destroy_func = destroyfastparticlesystem
				ignore_duplicates
				name = <mangled_id>
				destroy_params = {name = <name> attachobjid = <attachobjid>}
			}
		endif
		alloc_spline_particle {params_script = <params_script> name = <mangled_id> attachobjid = <objid> objid = <objid> bone = <bone> groupid = <groupid>
			attachnode = <attachnode> emit_script = <emit_script> emit_params = <emit_params> perm = <perm> creation_node = <creation_node>}
	endif
	if ((iscreated <mangled_id>) && (gotparam objid) && (structurecontains structure = params_script applyenvbrightness))
		<mangled_id> :applyenvbrightness from = <objid>
	endif
	if iscreated <mangled_id>
		return systemid = <mangled_id>
	endif
endscript

script createsplineparticlesystem_editor 
	killspawnedscript \{name = createsplineparticlesystem_editor_spawned}
	spawnscriptnow createsplineparticlesystem_editor_spawned params = <...>
endscript

script createsplineparticlesystem_editor_spawned \{groupid = 0}
	if gotparam \{perm}
		perm = 1
	else
		perm = 0
	endif
	if NOT gotparam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT gotparam \{params_script}
		script_assert \{qs(0x655e60db)}
	endif
	if gotparam \{attachobjid}
		<objid> = <attachobjid>
	endif
	if gotparam \{objid}
		attachobjid = <objid>
	endif
	if gotparam \{objid}
		manglechecksums a = <name> b = <attachobjid>
	else
		<mangled_id> = <name>
	endif
	if (iscreated <name>)
		<name> :destroy
		wait \{1
			frame}
	endif
	if (iscreated <mangled_id>)
		<mangled_id> :destroy
		wait \{2
			frame}
	endif
	if (iscreated <mangled_id>)
		printf \{qs(0x8752c714)}
	else
		alloc_spline_particle {params_script = <params_script> name = <mangled_id> attachobjid = <objid> objid = <objid> bone = <bone> groupid = <groupid>
			attachnode = <attachnode> emit_script = <emit_script> emit_params = <emit_params> perm = <perm> creation_node = <creation_node>}
	endif
endscript
suspendiblefastparticlecomponents = [
	{
		component = particle
	}
]
fastparticlecomponents = [
	{
		component = particle
	}
]

script createglobalfastparticlesystem \{groupid = 0}
	if NOT checksplineparticlestructure <params_script>
		printf \{qs(0xe730d5e9)}
		return
	endif
	if gotparam \{perm}
		priority = coim_priority_permanent
		heap = gameobj
	else
		priority = coim_priority_effects
		heap = particle
	endif
	if NOT gotparam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if NOT gotparam \{params_script}
		script_assert \{qs(0x655e60db)}
	endif
	if NOT gotparam \{params_script}
		if NOT globalexists name = <params_script> type = structure
			printf qs(0x8b7c4d9a) s = <params_script>
			return
		endif
	endif
	if NOT iscreated <name>
		if cutscenedestroylistactive
			addtocutscenedestroylist {
				destroy_func = destroyglobalfastparticlesystem
				ignore_duplicates
				name = <name>
				destroy_params = {name = <name>}
			}
		endif
		if structurecontains \{structure = params_script
				suspenddistance}
			creategameobject priority = <priority> heap = <heap> components = suspendiblefastparticlecomponents params = {
				name = <name>
				parent_object = <objid>
				groupid = <groupid>
				<params_script>
				pos = <pos>
				object_type = particle
			}
		else
			creategameobject priority = <priority> heap = <heap> components = $fastparticlecomponents params = {
				name = <name>
				parent_object = <objid>
				groupid = <groupid>
				<params_script>
				pos = <pos>
				object_type = particle
			}
		endif
	endif
	if iscreated <name>
		if gotparam \{emit_script}
			<name> :obj_spawnscriptlater <emit_script> params = <emit_params>
		endif
	endif
endscript

script destroyglobalfastparticlesystem 
	if NOT gotparam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if objectexists id = <name>
		if cutscenedestroylistactive
			removefromcutscenedestroylist name = <name>
		endif
		<name> :die
	endif
endscript

script destroyfastparticlesystem 
	if NOT gotparam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if gotparam \{objid}
		attachobjid = <objid>
	endif
	if gotparam \{attachobjid}
		manglechecksums a = <name> b = <attachobjid>
	else
		<mangled_id> = <name>
	endif
	if objectexists id = <mangled_id>
		if cutscenedestroylistactive
			removefromcutscenedestroylist name = <mangled_id>
		endif
		<mangled_id> :die
	endif
endscript

script destroyparticlesystem_editor 
	killspawnedscript \{name = destroyparticlesystem_editor_spawn}
	spawnscriptnow destroyparticlesystem_editor_spawn params = <...>
endscript

script destroyparticlesystem_editor_spawn 
	if NOT gotparam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if gotparam \{objid}
		attachobjid = <objid>
	endif
	if gotparam \{attachobjid}
		manglechecksums a = <name> b = <attachobjid>
	else
		<mangled_id> = <name>
	endif
	if objectexists id = <mangled_id>
		<mangled_id> :die
	endif
	if objectexists id = <name>
		<name> :die
	endif
endscript

script destroysplineparticlesystem_editor 
	if NOT gotparam \{name}
		script_assert \{qs(0xdef61e20)}
	endif
	if gotparam \{objid}
		attachobjid = <objid>
	endif
	if gotparam \{attachobjid}
		manglechecksums a = <name> b = <attachobjid>
	else
		<mangled_id> = <name>
	endif
	if objectexists id = <mangled_id>
		if cutscenedestroylistactive
			removefromcutscenedestroylist name = <mangled_id>
		endif
		<mangled_id> :die
	endif
	if objectexists id = <name>
		if cutscenedestroylistactive
			removefromcutscenedestroylist name = <name>
		endif
		<name> :die
	endif
endscript

script emitfastparticles 
	if gotparam \{wait_frames}
		wait <wait_frames> frames
	else
		wait <wait_seconds> seconds
	endif
	setemitrate \{0}
	begin
	if NOT isemitting
		break
	endif
	wait \{1
		frame}
	repeat
	die
endscript
lockablesplineparticlecomponents = [
	{
		component = attach
	}
	{
		component = particle
	}
]

script alloc_spline_particle \{groupid = 0}
	if NOT checksplineparticlestructure <params_script>
		printf \{qs(0xdc89d56a)}
		return
	endif
	if gotparam \{perm}
		if (<perm> = 1)
			priority = coim_priority_permanent
			heap = gameobj
		else
			priority = coim_priority_effects
			heap = particle
		endif
	else
		priority = coim_priority_effects
		heap = particle
	endif
	if NOT objectexists id = <name>
		if gotparam \{attachobjid}
			creategameobject priority = <priority> heap = <heap> components = $lockablesplineparticlecomponents params = {
				name = <name>
				<params_script>
				id = <attachobjid>
				attach_target = <attachobjid>
				ignorelockdie
				parent_object = <attachobjid>
				bone = <bone>
				attach_bone = <bone>
				groupid = <groupid>
				localspace
				creation_node = <creation_node>
				object_type = particle
			}
		else
			creategameobject priority = <priority> heap = <heap> {
				components = [
					{
						component = particle
						name = <name>
						bone = <bone>
						groupid = <groupid>
						<params_script>
					}
				]
				params = {
					name = <name>
					bone = <bone>
					creation_node = <creation_node>
					object_type = particle
				}
			}
			if structurecontains \{structure = params_script
					localspace}
				if NOT structurecontains \{structure = params_script
						boxpositions}
					printstruct <params_script>
					script_assert \{qs(0xc57b8c30)}
				endif
				if objectexists id = <name>
					<name> :setstartpos (<params_script>.boxpositions [1])
				endif
			endif
		endif
	endif
	if objectexists id = <name>
		if gotparam \{emit_script}
			<name> :obj_spawnscriptlater <emit_script> params = <emit_params>
		endif
	endif
endscript

script alloc_fast_particle \{groupid = 0}
	if NOT gotparam \{params_script}
		if NOT globalexists name = <params_script> type = structure
			printf qs(0x8b7c4d9a) s = <params_script>
			return
		endif
	endif
	if gotparam \{perm}
		if (<perm> = 1)
			priority = coim_priority_permanent
			heap = gameobj
		else
			priority = coim_priority_effects
			heap = particle
		endif
	else
		priority = coim_priority_effects
		heap = particle
	endif
	if NOT objectexists id = <name>
		if gotparam \{attachobjid}
			creategameobject priority = <priority> heap = <heap> {
				components = [
					{
						component = attach
						attach_target = <attachobjid>
						<params_script>
						ignorelockdie
					}
					{
						component = particle
						name = <name>
						groupid = <groupid>
						parent_object = <attachobjid>
						bone = <bone>
						<params_script>
						systemlifetime = (<params_script>.emitduration)
						systemlifetime = <systemlifetime>
					}
				]
				params = {
					name = <name>
					bone = <bone>
					localspace
					creation_node = <creation_node>
					object_type = particle
				}
			}
		else
			creategameobject priority = <priority> heap = <heap> {
				components = [
					{
						component = particle
						name = <name>
						bone = <bone>
						groupid = <groupid>
						<params_script>
					}
				]
				params = {
					name = <name>
					bone = <bone>
					creation_node = <creation_node>
					object_type = particle
				}
			}
			if structurecontains \{structure = params_script
					localspace}
				if NOT structurecontains \{structure = params_script
						boxpositions}
					printstruct <params_script>
					script_assert \{qs(0xc57b8c30)}
				endif
				if objectexists id = <name>
					<name> :setstartpos (<params_script>.boxpositions [1])
				endif
			endif
		endif
	endif
	if objectexists id = <name>
		if gotparam \{emit_script}
			<name> :obj_spawnscriptlater <emit_script> params = <emit_params>
		endif
	endif
endscript

script creategameobject 
	if iscompositeobjectmanagerenabled
		createcompositeobject <...>
	else
		createcompositeobjectinstance <...>
	endif
endscript

script hero_continuousterrainparticles_off 
	cleareventhandlergroup
	seteventhandler \{event = newterraintype
		scr = hero_continuousterrainparticles_on
		response = switch_script}
	onexceptionrun
	block
endscript

script hero_continuousterrainparticles_on 
	getterraintypeparam param = treadactions terrain_id = <terraintype>
	if NOT structurecontains \{structure = treadactions
			herocontinuousparticleparams}
		goto \{hero_continuousterrainparticles_off}
	endif
	getuniquecompositeobjectid \{preferredid = hero_continuousterrainparticles}
	cleareventhandlergroup
	seteventhandler event = newterraintype scr = hero_continuousterrainparticles_switch response = switch_script params = {particleid = <uniqueid>}
	onexceptionrun
	begin
	if NOT compositeobjectexists <uniqueid>
		creategameobject priority = coim_priority_effects heap = particle oldheap = com components = [
			{component = flexibleparticle}
		] params = {
			name = <uniqueid>
			(<treadactions>.herocontinuousparticleparams)
			novisibilitytest
			object_type = particle
		}
	endif
	obj_getvelocity
	normalizevector <vel>
	obj_getposition
	if compositeobjectexists <uniqueid>
		<uniqueid> :obj_setposition position = (((1.0, 0.0, 1.0) && <pos>) + (0.0, 1.0, 0.0) * <terrainparticleheight> + (((1.0, 0.0, 1.0) && <norm>) * 0.1 * <length>))
	endif
	wait \{1
		gameframe}
	repeat
endscript

script hero_continuousterrainparticles_switch 
	if compositeobjectexists <particleid>
		<particleid> :emitrate rate = 0
		<particleid> :destroy ifempty = 1
	endif
	goto hero_continuousterrainparticles_on params = <...>
endscript

script getparticletype \{params_script}
	type = flexible
	if checkflexibleparticlestructure <params_script>
		type = flexible
		if globalexists name = <params_script> type = structure
			if structurecontains structure = (<params_script>) particletype
				switch (<params_script>.particletype)
					case flexparticle
					type = flexible
					case splineparticle
					type = fast
				endswitch
			else
				if structurecontains structure = (<params_script>) class
					if ((<params_script>.class) = particleobject)
						type = fast
					endif
				endif
			endif
		endif
	endif
	if checksplineparticlestructure <params_script>
		type = fast
		if globalexists name = <params_script> type = structure
			if structurecontains structure = (<params_script>) particletype
				switch (<params_script>.particletype)
					case flexparticle
					type = flexible
					case splineparticle
					type = fast
				endswitch
			else
				if structurecontains structure = (<params_script>) class
					if ((<params_script>.class) = particleobject)
						type = fast
					endif
				endif
			endif
		endif
	endif
	return type = <type>
endscript

script waterripplegenerated 
endscript
