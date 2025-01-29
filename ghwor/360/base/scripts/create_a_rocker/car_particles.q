
script character_add_particle_systems \{particle_systems = !a1768515945
		object_name = !q1768515945
		desc_id = !q1768515945}
	ExtendCrc <desc_id> '_NodeArray' out = node_array_name
	GetArraySize <particle_systems>
	if (<array_Size> > 0)
		<i> = 0
		begin
		character_add_single_particle_system {
			id = <i>
			object_name = <object_name>
			params = (<particle_systems> [<i>])
			node_array_name = <node_array_name>
		}
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	<object_name> :SetTags {
		particle_system_destroy_id = <desc_id>
		particle_system_array = <particle_systems>
		particles_added = 1
	}
endscript

script character_add_single_particle_system \{id = !i1768515945
		object_name = !q1768515945
		params = 0x69696969
		node_array_name = !q1768515945}
	formatText checksumName = pref_id 'character_particle_%i' i = <id> AddToStringLookup = true
	GetUniqueCompositeobjectID preferredID = <pref_id>
	printstruct {
		Name = <uniqueID>
		objID = <object_name>
		groupID = <object_name>
		<params>
	}
	if StructureContains structure = <params> custom_script
		MangleChecksums a = custom_particle_script b = <object_name>
		<custom_script_params> = (<params>.custom_script_params)
		SpawnScriptNow (<params>.custom_script) id = <mangled_ID> params = {
			<custom_script_params>
			object_name = <object_name>
		}
	else
		CreateParticleSystem {
			Name = <uniqueID>
			objID = <object_name>
			groupID = <object_name>
			node_array_name = <node_array_name>
			<params>
		}
	endif
endscript

script character_destroy_particle_systems \{object_name = !q1768515945}
	DestroyParticlesByGroupID groupID = <object_name>
	MangleChecksums a = custom_particle_script b = <object_name>
	KillSpawnedScript id = <mangled_ID>
endscript

script character_hide_particle_systems \{object_name = !q1768515945}
	if <object_name> :GetSingleTag particles_added
		if (<particles_added> = 0)
			return
		endif
	endif
	character_destroy_particle_systems {
		object_name = <object_name>
	}
	<object_name> :SetTags particles_added = 0
endscript

script character_unhide_particle_systems \{object_name = !q1768515945}
	if <object_name> :GetSingleTag particles_added
		if (<particles_added> = 1)
			return
		endif
	endif
	if <object_name> :GetSingleTag particle_system_array
		<object_name> :GetSingleTag particle_system_destroy_id
		character_add_particle_systems {
			object_name = <object_name>
			particle_systems = <particle_system_array>
			desc_id = <particle_system_destroy_id>
		}
		<object_name> :SetTags particles_added = 1
	endif
endscript
