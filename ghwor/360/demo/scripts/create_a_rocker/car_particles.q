
script character_add_particle_systems \{particle_systems = !a1768515945
		object_name = !q1768515945
		desc_id = !q1768515945}
	extendcrc <desc_id> '_NodeArray' out = node_array_name
	getarraysize <particle_systems>
	if (<array_size> > 0)
		<i> = 0
		begin
		character_add_single_particle_system {
			id = <i>
			object_name = <object_name>
			params = (<particle_systems> [<i>])
			node_array_name = <node_array_name>
		}
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	<object_name> :settags {
		particle_system_destroy_id = <desc_id>
		particle_system_array = <particle_systems>
		particles_added = 1
	}
endscript

script character_add_single_particle_system \{id = !i1768515945
		object_name = !q1768515945
		params = 0x69696969
		node_array_name = !q1768515945}
	formattext checksumname = pref_id 'character_particle_%i' i = <id> addtostringlookup = true
	getuniquecompositeobjectid preferredid = <pref_id>
	printstruct {
		name = <uniqueid>
		objid = <object_name>
		groupid = <object_name>
		<params>
	}
	if structurecontains structure = <params> custom_script
		manglechecksums a = custom_particle_script b = <object_name>
		<custom_script_params> = (<params>.custom_script_params)
		spawnscriptnow (<params>.custom_script) id = <mangled_id> params = {
			<custom_script_params>
			object_name = <object_name>
		}
	else
		createparticlesystem {
			name = <uniqueid>
			objid = <object_name>
			groupid = <object_name>
			node_array_name = <node_array_name>
			<params>
		}
	endif
endscript

script character_destroy_particle_systems \{object_name = !q1768515945}
	destroyparticlesbygroupid groupid = <object_name>
	manglechecksums a = custom_particle_script b = <object_name>
	killspawnedscript id = <mangled_id>
endscript

script character_hide_particle_systems \{object_name = !q1768515945}
	if <object_name> :getsingletag particles_added
		if (<particles_added> = 0)
			return
		endif
	endif
	character_destroy_particle_systems {
		object_name = <object_name>
	}
	<object_name> :settags particles_added = 0
endscript

script character_unhide_particle_systems \{object_name = !q1768515945}
	if <object_name> :getsingletag particles_added
		if (<particles_added> = 1)
			return
		endif
	endif
	if <object_name> :getsingletag particle_system_array
		<object_name> :getsingletag particle_system_destroy_id
		character_add_particle_systems {
			object_name = <object_name>
			particle_systems = <particle_system_array>
			desc_id = <particle_system_destroy_id>
		}
		<object_name> :settags particles_added = 1
	endif
endscript
