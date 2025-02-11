proximobj_composite_structure = [
	{
		component = Sound
	}
]
particle_composite_structure = [
	{
		component = Suspend
	}
	{
		component = Particle
	}
]
moving_particle_composite_structure = [
	{
		component = Suspend
	}
	{
		component = motion
	}
	{
		component = Particle
	}
]
flexparticle_composite_structure = [
	{
		component = Suspend
	}
	{
		component = FlexibleParticle
	}
]
moving_flexparticle_composite_structure = [
	{
		component = Suspend
	}
	{
		component = motion
	}
	{
		component = FlexibleParticle
	}
]
viewercam_composite_structure = [
	{
		component = Camera
		far_clip = $camera_default_far_clip
	}
	{
		component = proximtrigger
		cube_length = 0.4
		trigger_checksum = Camera
		inactive
	}
]
levellight_composite_structure = [
	{
		component = PositionMorph
	}
	{
		component = dynamiclight
	}
]
igc_camera_structure = [
	{
		component = CinematicCamera
		UpdateWhenCameraInactive = FALSE
	}
	{
		component = Camera
	}
]
gridobj_composite_structure = [
	{
		component = Suspend
	}
]
GeometryObject_structure = [
	{
		component = GeometryObject
	}
]
master_node_composite_structure = [
	{
		component = EventCache
	}
	{
		component = StateMachineManager
	}
]
gameobj_composite_structure = [
	{
		component = LockObj
		OFF
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
		component = Suspend
	}
	{
		component = rigidbody
	}
	{
		component = Sound
	}
]

script ProcessorGroup_RegisterDefault 
	RegisterProcessorGroupDesc \{Name = ProcessorGroup_CompositeSystem
		processors = [
			{
				Name = Processor_Default
				task = {
					Name = PTask_Default
				}
			}
		]}
	ProcessorMgr_Init \{group = ProcessorGroup_CompositeSystem}
endscript

script PassGroup_RegisterDefault 
	RegisterPassGroupDesc \{Name = PassGroup_CompositeSystem
		passes = [
			{
				Name = Pass_Default
				processors = [
					Processor_Default
				]
			}
			{
				Name = Pass_Agent
				processors = [
					Processor_Default
				]
			}
			{
				Name = Pass_Behavior
				processors = [
					Processor_Default
				]
			}
			{
				Name = Pass_Anim
				processors = [
					Processor_Default
				]
			}
			{
				Name = Pass_Move
				processors = [
					Processor_Default
				]
			}
			{
				Name = Pass_Model
				processors = [
					Processor_Default
				]
			}
		]}
	PassMgr_Init \{group = PassGroup_CompositeSystem}
endscript

script CompositeObjects_RegisterDefault 
	PassDefault_components = [
		{Name = Suspend}
		{Name = BBox}
		{Name = ObjectProximity}
		{Name = Sound}
		{Name = Stream}
	]
	RegisterCompositeObjectDesc {
		Name = CompositeHuman
		callback = CompositeAgent_CustomizeComponents
		passes =
		[
			{pass = Pass_Default
				components = <PassDefault_components>
			}
			{pass = Pass_Agent
				components = [{Name = PedLife}
					{Name = AiInfo}
					{Name = Agent}
					{Name = FAM}
					{Name = Locator}
					{Name = ItemControl}
					{Name = Vision}
					{Name = CollisionCache
						params = {bbox_min = (-0.1, -20.0, -0.1)
							bbox_max = (0.1, 10.0, 0.1)
							layer = static_geometry_feeler}}
					{Name = navigation}
					{Name = motion}
					{Name = ragdoll}
				]
			}
			{pass = Pass_Behavior
				components = [{Name = EventCache}
					{Name = BehaviorSystem}
					{Name = inventory}
					{Name = Seek}
					{Name = Passenger}
					{Name = Targetable}
					{Name = Proximity}
					{Name = Interact}
					{Name = SkaterLoopingSound}
					{Name = AnimTree}
					{Name = LockObj
						params = {lock_to_object_matrix
							OFF}}
					{Name = NavCollision}
					{Name = AlignToGround
						params = {OFF}}
				]
			}
			{pass = Pass_Model
				components = [{Name = Skeleton}
					{Name = Model}
					{Name = SpecialItem}
					{Name = proximtrigger
						params = {trigger_checksum = Ped , cube_length = 0.4}}
				]
			}
		]
	}
	RegisterCompositeObjectDesc {
		Name = CompositeVehicle
		callback = CompositeAgent_CustomizeComponents
		passes =
		[
			{pass = Pass_Default
				components = <PassDefault_components>
			}
			{pass = Pass_Agent
				components = [{Name = PedLife}
					{Name = AiInfo}
					{Name = Agent}
					{Name = FAM}
					{Name = Locator}
					{Name = ItemControl}
					{Name = CollisionCache
						params = {bbox_min = (-0.1, -20.0, -0.1)
							bbox_max = (0.1, 10.0, 0.1)
							layer = static_geometry_feeler}}
					{Name = navigation}
					{Name = motion}
				]
			}
			{pass = Pass_Behavior
				components = [{Name = EventCache}
					{Name = BehaviorSystem}
					{Name = Seek}
					{Name = Interact}
					{Name = VehiclePhysics}
					{Name = AnimTree}
					{Name = Input
						params = {controller = 1}}
				]
			}
			{pass = Pass_Model
				components = [{Name = Skeleton}
					{Name = Model}
					{Name = proximtrigger
						params = {trigger_checksum = Vehicle , cube_length = 0.4}}
				]
			}]
	}
	RegisterCompositeObjectDesc \{Name = CompositeGameObject_SimpleHover
		callback = nullscript
		passes = [
			{
				pass = Pass_Default
				components = [
					{
						Name = Suspend
					}
				]
			}
			{
				pass = Pass_Move
				components = [
					{
						Name = Hover
					}
				]
			}
			{
				pass = Pass_Model
				components = [
					{
						Name = ObjectProximity
					}
					{
						Name = Model
					}
				]
			}
		]}
	RegisterCompositeObjectDesc \{Name = CompositeGameObject_StandardRigidBody
		callback = nullscript
		passes = [
			{
				pass = Pass_Default
				components = [
					{
						Name = Suspend
					}
				]
			}
			{
				pass = Pass_Move
				components = [
					{
						Name = rigidbody
					}
				]
			}
			{
				pass = Pass_Model
				components = [
					{
						Name = Sound
					}
					{
						Name = Model
					}
				]
			}
		]}
	AdObject_components = [{Name = Model}
		{Name = motion}
	]
	Massive_components = [{Name = MassiveAd}]
	AdObject_components = (<AdObject_components> + <Massive_components>)
	RegisterCompositeObjectDesc {
		Name = CompositeGameObject_AdObject
		callback = nullscript
		passes =
		[
			{pass = Pass_Default
				components = <AdObject_components>
			}
		]
	}
endscript

script CompositeAgent_CustomizeComponents 
	if GotParam \{CompassBlipType}
		CreateComponentFromStructure component = CompassBlip <...>
	endif
	if GotParam \{voice_profile}
		if StructureContains \{structure = appearance
				voice_profile}
			voice_profile = (<appearance>.voice_profile)
		else
			voice_profile = (<Profile>.voice_profile)
		endif
		if StructureContains structure = $NoticeVoVoiceProfiles <voice_profile>
			has_notice_vo = ($NoticeVoVoiceProfiles.<voice_profile>)
		else
			has_notice_vo = FALSE
		endif
		SetTags {
			Profile = <Profile>
			voice_profile = <voice_profile>
			has_notice_vo = <has_notice_vo>
		}
	endif
endscript
