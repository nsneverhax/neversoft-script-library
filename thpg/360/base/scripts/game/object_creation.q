DefaultObjectSuspendDistance = 55
DefaultObjectRenderDistance1 = 55
DefaultObjectRenderDistance2 = 56
ObjectSuspendDistanceLarge = 150
ObjectRenderDistanceLarge1 = 150
ObjectRenderDistanceLarge2 = 151
object_update_culling_active = 1
proximobj_composite_structure = [
	{
		component = sound
	}
]
particle_composite_structure = [
	{
		component = particle
	}
]
moving_particle_composite_structure = [
	{
		component = motion
	}
	{
		component = particle
	}
]
flexparticle_composite_structure = [
	{
		component = flexibleparticle
	}
]
moving_flexparticle_composite_structure = [
	{
		component = motion
	}
	{
		component = flexibleparticle
	}
]
skatercam_composite_structure = [
	{
		component = cameralookaround
	}
	{
		component = skatercamera
	}
	{
		component = walkcamera
	}
	{
		component = camera
		far_clip = $camera_default_far_clip
	}
	{
		component = compassdisplay
	}
	{
		component = proximtrigger
		cube_length = 0.4
		trigger_checksum = camera
	}
	{
		component = input
	}
	{
		component = nailthetrickcamera
	}
	{
		component = animexportcamera
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
		component = locator
	}
	{
		component = camera
	}
	{
		component = animexportcamera
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
		component = suspend
	}
	{
		component = lockobj
		off
	}
	{
		component = motion
	}
	{
		component = objectproximity
	}
	{
		component = sound
	}
	{
		component = bbox
	}
	{
		component = hover
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
ped_composite_structure = [
	{
		component = suspend
	}
	{
		component = bbox
	}
	{
		component = objectproximity
	}
	{
		component = sound
	}
	{
		component = stream
	}
	{
		component = pedlife
	}
	{
		component = aiinfo
	}
	{
		component = agent
	}
	{
		component = fam
	}
	{
		component = locator
	}
	{
		component = itemcontrol
	}
	{
		component = collisioncache
		bbox_min = (-0.1, -20.0, -0.1)
		bbox_max = (0.1, 10.0, 0.1)
	}
	{
		component = navigation
	}
	{
		component = motion
	}
	{
		component = eventcache
	}
	{
		component = behaviorsystem
	}
	{
		component = inventory
	}
	{
		component = seek
	}
	{
		component = passenger
	}
	{
		component = targetable
	}
	{
		component = proximity
	}
	{
		component = interact
	}
	{
		component = skaterloopingsound
	}
]

script ped_add_components_agent 
	add_vision_component = true
	if gotparam has_vision
		if (<has_vision> = false)
			<add_vision_component> = false
		endif
	endif
	if (<add_vision_component> = true)
		createcomponentfromstructure {
			component = vision
		}
	endif
	if NOT gotparam animeventtablename
		GetAnimEventTableName AnimType = <type>
	endif
	if gotparam skeletonname
		createcomponentfromstructure {
			component = animtree
			skeletonname = <skeletonname>
			animeventtablename = <animeventtablename>
			defaultcommandtarget = pedmainanimparentnode
			defaultwaittarget = pedmainanimparentnode
		}
	endif
	createcomponentfromstructure {
		component = lockobj
		lock_to_object_matrix
		off
	}
	createcomponentfromstructure {component = navcollision <...>}
	if gotparam char_collision
		createcomponentfromstructure {
			component = charactercollision
			<char_collision>
			<char_collision_height>
			<char_collision_radius>
		}
	endif
	if gotparam has_havok_collision
		if (<has_havok_collision> = true)
			createcomponentfromstructure {
				component = collision
				collisionmode = <collisionmode>
				model = <model>
			}
		endif
	endif
	createcomponentfromstructure component = aligntoground off
	if gotparam skeletonname
		pushmemprofile 'Pedestrian Skeletons'
		createcomponentfromstructure component = skeleton <...> skeletonname = <skeletonname>
		popmemprofile
	endif
	createcomponentfromstructure component = model <...> usemodellights
	if gotparam compassbliptype
		createcomponentfromstructure component = compassblip <...>
	endif
	if gotparam specialitem
		createcomponentfromstructure component = specialitem <...>
	endif
	if gotparam proximtrigger
		createcomponentfromstructure component = proximtrigger trigger_checksum = ped cube_length = 0.4 <...>
	endif
	if gotparam voice_profile
		if structurecontains structure = appearance voice_profile
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

script dummy_ped_init 
	Navigation_ScenePauseMovement
endscript

script ped_init_model 
	ped_create_special_item <...>
	if gotparam profile
		if structurecontains structure = <profile> model
			obj_initmodel model = (<profile>.model) <...>
		else
			voice_profile = (<profile>.voice_profile)
			if structurecontains structure = <profile> random_parts
				CreateRandomAppearance profile = <profile>
				if structurecontains structure = profile voice_profile
					voice_profile = (<profile>.voice_profile)
				endif
			endif
			settags voice_profile = <voice_profile>
			obj_initmodelfromprofile struct = <profile> buildscript = create_ped_model_from_appearance
		endif
	else
		if NOT gotparam model
			script_assert "no model name!"
		endif
		obj_initmodel model = <model> <...>
	endif
	obj_makematerialunique
	if gotparam fade_distance
		obj_blendalpha time = $ped_fade_time from = 0.0 to = 1.0
	endif
	if gotparam custom_material_id
		obj_setmaterialcolor material = body material = <custom_material_id> color = <custom_material_color>
	endif
	obj_getid
	runscriptonobject id = <objid> set_ped_anim_handlers
	if (<species> = vehicle)
		spawnscriptlater Create_Vehicle_FX params = {objid = <objid> skeletonname = <skeletonname>}
	endif
endscript

script ped_fade_and_destroy 
	obj_blendalpha \{time = $ped_fade_time
		to = 0.0}
	obj_spawnscriptlater \{ped_fade_and_destroy_spawned}
endscript

script ped_fade_and_destroy_spawned 
	wait \{0.7
		seconds}
	die
endscript

script ped_create_special_item 
	addparams <profile>
	if gotparam \{specialitem}
		TurnOnSpecialItem ped NotSkater specialitem_details = <specialitem>
		if getsingletag \{specialitemid}
			if iscreated <specialitemid>
				settags board_id = <specialitemid>
			endif
		endif
	endif
endscript

script ped_init_skateboard 
	<found_goalped> = false
	if gotparam goal_giver
		if (<goal_giver> = true)
			<found_goalped> = true
		endif
	endif
	if (<found_goalped> = true)
		agent_pushreactionstate state = goalped
	else
		agent_pushreactionstate state = normal
	endif
	if gotparam skateboard_profile
		obj_getid
		getuniquecompositeobjectid preferredid = <objid>
		object_params = {<skateboard_profile>
			name = <uniqueid>
			object_type = object_type_ped
			scale = <scale>
			assetcontext = <assetcontext>}
		createcompositeobject {
			components = (($ai_items).skateboard.components)
			params = <object_params>
		}
		<uniqueid> :ped_init_model {profile = <skateboard_profile> <object_params>}
		<uniqueid> :agent_finalizeinitialization
		<uniqueid> :Teleport object = <objid>
		<objid> :Interest_SetVehicle vehicle = <uniqueid>
		<objid> :agent_placeonvehicle <object_params>
		if NOT (<found_goalped> = true)
			agent_pushreactionstate state = skate
		endif
		<uniqueid> :settags profile = <skateboard_profile>
		<uniqueid> :obj_makematerialunique
	endif
endscript

script master_node_init 
	fsm_replace \{replacement = child
		state = Bv_RunMasterNodeAction}
endscript

script processorgroup_registerdefault 
	if ($object_update_culling_active = 1)
		registerprocessorgroupdesc {
			name = processorgroup_compositesystem
			processors =
			[
				{name = Processor_ObjectSuspend
					task = {name = ptask_camdistanceupdate}
				}
				{name = processor_default
					task = {name = ptask_default}
				}
			]
		}
	else
		registerprocessorgroupdesc {
			name = processorgroup_compositesystem
			processors =
			[
				{name = processor_default
					task = {name = ptask_default}
				}
			]
		}
	endif
	processormgr_init group = processorgroup_compositesystem
endscript

script passgroup_registerdefault 
	if ($object_update_culling_active = 1)
		registerpassgroupdesc {
			name = passgroup_compositesystem
			passes =
			[
				{name = pass_default
					processors = [Processor_ObjectSuspend , processor_default]}
				{name = pass_agent
					processors = [processor_default]}
				{name = pass_behavior
					processors = [processor_default]}
				{name = pass_anim
					processors = [processor_default]}
				{name = pass_move
					processors = [processor_default]}
				{name = pass_model
					processors = [processor_default]}
			]
		}
	else
		registerpassgroupdesc {
			name = passgroup_compositesystem
			passes =
			[
				{name = pass_default
					processors = [processor_default]}
				{name = pass_agent
					processors = [processor_default]}
				{name = pass_behavior
					processors = [processor_default]}
				{name = pass_anim
					processors = [processor_default]}
				{name = pass_move
					processors = [processor_default]}
				{name = pass_model
					processors = [processor_default]}
			]
		}
	endif
	passmgr_init group = passgroup_compositesystem
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
					{name = dynarail}
					{name = model}
					{name = proximtrigger
						params = {trigger_checksum = vehicle , cube_length = 0.4}}
				]
			}]
	}
	registercompositeobjectdesc {
		name = compositegameobject_simplehover
		callback = nullscript
		passes =
		[
			{pass = pass_default
				components = [{name = suspend}
					{name = hover}
					{name = objectproximity}
					{name = model}
				]
			}
		]
	}
	registercompositeobjectdesc {
		name = CompositeGameObject_SimpleSpin
		callback = nullscript
		passes =
		[
			{pass = pass_default
				components = [{name = suspend}
					{name = motion}
					{name = model}
				]
			}
		]
	}
	registercompositeobjectdesc {
		name = CompositeGameObject_HoverSpinCollectable
		callback = nullscript
		passes =
		[
			{pass = pass_default
				components = [{name = suspend}
					{name = hover}
					{name = motion}
					{name = objectproximity}
					{name = model}
				]
			}
		]
	}
	registercompositeobjectdesc {
		name = CompositeGameObject_HoverCollectable
		callback = nullscript
		passes =
		[
			{pass = pass_default
				components = [{name = suspend}
					{name = hover}
					{name = objectproximity}
					{name = model}
				]
			}
		]
	}
	registercompositeobjectdesc {
		name = CompositeGameObject_SpinCollectable
		callback = nullscript
		passes =
		[
			{pass = pass_default
				components = [{name = suspend}
					{name = motion}
					{name = objectproximity}
					{name = model}
				]
			}
		]
	}
	registercompositeobjectdesc {
		name = CompositeGameObject_StaticCollectable
		callback = nullscript
		passes =
		[
			{pass = pass_default
				components = [{name = suspend}
					{name = setdisplaymatrix}
					{name = objectproximity}
					{name = model}
				]
			}
		]
	}
	registercompositeobjectdesc {
		name = CompositeGameObject_StaticRailCollectable
		callback = nullscript
		passes =
		[
			{pass = pass_default
				components = [{name = suspend}
					{name = setdisplaymatrix}
					{name = objectproximity}
					{name = dynarail}
					{name = model}
				]
			}
		]
	}
	registercompositeobjectdesc {
		name = CompositeGameObject_ArcadeMachine
		callback = nullscript
		passes =
		[
			{pass = pass_default
				components = [
					{name = suspend}
					{name = setdisplaymatrix}
					{name = objectproximity}
					{name = collision}
					{name = model}
				]
			}
		]
	}
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
	registercompositeobjectdesc {
		name = compositegameobject_standardrigidbody
		callback = nullscript
		passes =
		[
			{pass = pass_default
				components = [{name = suspend}
					{name = rigidbody}
					{name = sound}
					{name = model}
				]
			}
		]
	}
endscript

script compositeagent_customizecomponents 
	if gotparam compassbliptype
		createcomponentfromstructure component = compassblip <...>
	endif
	if gotparam voice_profile
		if structurecontains structure = appearance voice_profile
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
