proximobj_composite_structure = [
	{
		component = sound
	}
]
particle_composite_structure = [
	{
		component = suspend
	}
	{
		component = particle
	}
]
moving_particle_composite_structure = [
	{
		component = suspend
	}
	{
		component = motion
	}
	{
		component = particle
	}
]
flexparticle_composite_structure = [
	{
		component = suspend
	}
	{
		component = flexibleparticle
	}
]
moving_flexparticle_composite_structure = [
	{
		component = suspend
	}
	{
		component = motion
	}
	{
		component = flexibleparticle
	}
]
viewercam_composite_structure = [
	{
		component = camera
		far_clip = $camera_default_far_clip
	}
	{
		component = proximtrigger
		cube_length = 0.4
		trigger_checksum = camera
		inactive
	}
]
levellight_composite_structure = [
	{
		component = positionmorph
	}
	{
		component = dynamiclight
	}
]
igc_camera_structure = [
	{
		component = cinematiccamera
		updatewhencamerainactive = false
	}
	{
		component = camera
	}
]
gridobj_composite_structure = [
	{
		component = suspend
	}
]
geometryobject_structure = [
	{
		component = geometryobject
	}
]
master_node_composite_structure = [
	{
		component = eventcache
	}
	{
		component = statemachinemanager
	}
]
gameobj_composite_structure = [
	{
		component = lockobj
		off
	}
	{
		component = motion
	}
]
constraint_composite_structure = [
	{
		component = constraint
	}
]
bouncy_composite_structure = [
	{
		component = suspend
	}
	{
		component = rigidbody
	}
	{
		component = sound
	}
]

script processorgroup_registerdefault 
	registerprocessorgroupdesc \{name = processorgroup_compositesystem
		processors = [
			{
				name = processor_default
				task = {
					name = ptask_default
				}
			}
		]}
	processormgr_init \{group = processorgroup_compositesystem}
endscript

script passgroup_registerdefault 
	registerpassgroupdesc \{name = passgroup_compositesystem
		passes = [
			{
				name = pass_default
				processors = [
					processor_default
				]
			}
			{
				name = pass_agent
				processors = [
					processor_default
				]
			}
			{
				name = pass_behavior
				processors = [
					processor_default
				]
			}
			{
				name = pass_anim
				processors = [
					processor_default
				]
			}
			{
				name = pass_move
				processors = [
					processor_default
				]
			}
			{
				name = pass_model
				processors = [
					processor_default
				]
			}
		]}
	passmgr_init \{group = passgroup_compositesystem}
endscript

script compositeobjects_registerdefault 
	passdefault_components = [
		{name = suspend}
		{name = bbox}
		{name = objectproximity}
		{name = sound}
		{name = stream}
	]
	registercompositeobjectdesc {
		name = compositehuman
		callback = compositeagent_customizecomponents
		passes =
		[
			{pass = pass_default
				components = <passdefault_components>
			}
			{pass = pass_agent
				components = [{name = pedlife}
					{name = aiinfo}
					{name = agent}
					{name = fam}
					{name = locator}
					{name = itemcontrol}
					{name = vision}
					{name = collisioncache
						params = {bbox_min = (-0.1, -20.0, -0.1)
							bbox_max = (0.1, 10.0, 0.1)
							layer = static_geometry_feeler}}
					{name = navigation}
					{name = motion}
					{name = ragdoll}
				]
			}
			{pass = pass_behavior
				components = [{name = eventcache}
					{name = behaviorsystem}
					{name = inventory}
					{name = seek}
					{name = passenger}
					{name = targetable}
					{name = proximity}
					{name = interact}
					{name = skaterloopingsound}
					{name = animtree}
					{name = lockobj
						params = {lock_to_object_matrix
							off}}
					{name = navcollision}
					{name = aligntoground
						params = {off}}
				]
			}
			{pass = pass_model
				components = [{name = skeleton}
					{name = model}
					{name = specialitem}
					{name = proximtrigger
						params = {trigger_checksum = ped , cube_length = 0.4}}
				]
			}
		]
	}
	registercompositeobjectdesc {
		name = compositevehicle
		callback = compositeagent_customizecomponents
		passes =
		[
			{pass = pass_default
				components = <passdefault_components>
			}
			{pass = pass_agent
				components = [{name = pedlife}
					{name = aiinfo}
					{name = agent}
					{name = fam}
					{name = locator}
					{name = itemcontrol}
					{name = collisioncache
						params = {bbox_min = (-0.1, -20.0, -0.1)
							bbox_max = (0.1, 10.0, 0.1)
							layer = static_geometry_feeler}}
					{name = navigation}
					{name = motion}
				]
			}
			{pass = pass_behavior
				components = [{name = eventcache}
					{name = behaviorsystem}
					{name = seek}
					{name = interact}
					{name = vehiclephysics}
					{name = animtree}
					{name = input
						params = {controller = 1}}
				]
			}
			{pass = pass_model
				components = [{name = skeleton}
					{name = model}
					{name = proximtrigger
						params = {trigger_checksum = vehicle , cube_length = 0.4}}
				]
			}]
	}
	registercompositeobjectdesc \{name = compositegameobject_simplehover
		callback = nullscript
		passes = [
			{
				pass = pass_default
				components = [
					{
						name = suspend
					}
				]
			}
			{
				pass = pass_move
				components = [
					{
						name = hover
					}
				]
			}
			{
				pass = pass_model
				components = [
					{
						name = objectproximity
					}
					{
						name = model
					}
				]
			}
		]}
	registercompositeobjectdesc \{name = compositegameobject_standardrigidbody
		callback = nullscript
		passes = [
			{
				pass = pass_default
				components = [
					{
						name = suspend
					}
				]
			}
			{
				pass = pass_move
				components = [
					{
						name = rigidbody
					}
				]
			}
			{
				pass = pass_model
				components = [
					{
						name = sound
					}
					{
						name = model
					}
				]
			}
		]}
	adobject_components = [{name = model}
		{name = motion}
	]
	massive_components = [{name = massivead}]
	adobject_components = (<adobject_components> + <massive_components>)
	registercompositeobjectdesc {
		name = compositegameobject_adobject
		callback = nullscript
		passes =
		[
			{pass = pass_default
				components = <adobject_components>
			}
		]
	}
endscript

script compositeagent_customizecomponents 
	if gotparam \{compassbliptype}
		createcomponentfromstructure component = compassblip <...>
	endif
	if gotparam \{voice_profile}
		if structurecontains \{structure = appearance
				voice_profile}
			voice_profile = (<appearance>.voice_profile)
		else
			voice_profile = (<profile>.voice_profile)
		endif
		if structurecontains structure = $noticevovoiceprofiles <voice_profile>
			has_notice_vo = ($noticevovoiceprofiles.<voice_profile>)
		else
			has_notice_vo = false
		endif
		settags {
			profile = <profile>
			voice_profile = <voice_profile>
			has_notice_vo = <has_notice_vo>
		}
	endif
endscript
