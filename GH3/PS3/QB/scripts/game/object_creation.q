proximobj_composite_structure = [
	{
		Component = Sound
	}
]
particle_composite_structure = [
	{
		Component = Suspend
	}
	{
		Component = Particle
	}
]
moving_particle_composite_structure = [
	{
		Component = Suspend
	}
	{
		Component = Motion
	}
	{
		Component = Particle
	}
]
flexparticle_composite_structure = [
	{
		Component = Suspend
	}
	{
		Component = FlexibleParticle
	}
]
moving_flexparticle_composite_structure = [
	{
		Component = Suspend
	}
	{
		Component = Motion
	}
	{
		Component = FlexibleParticle
	}
]
viewercam_composite_structure = [
	{
		Component = Camera
		far_clip = $camera_default_far_clip
	}
	{
		Component = proximtrigger
		cube_length = 0.4
		trigger_checksum = Camera
		Inactive
	}
]
levellight_composite_structure = [
	{
		Component = PositionMorph
	}
	{
		Component = dynamiclight
	}
]
igc_camera_structure = [
	{
		Component = CinematicCamera
		UpdateWhenCameraInactive = FALSE
	}
	{
		Component = Camera
	}
]
gridobj_composite_structure = [
	{
		Component = Suspend
	}
]
GeometryObject_structure = [
	{
		Component = GeometryObject
	}
]
master_node_composite_structure = [
	{
		Component = EventCache
	}
	{
		Component = StateMachineManager
	}
]
gameobj_composite_structure = [
	{
		Component = LockObj
		OFF
	}
	{
		Component = Motion
	}
]
constraint_composite_structure = [
	{
		Component = constraint
	}
]
bouncy_composite_structure = [
	{
		Component = Suspend
	}
	{
		Component = rigidbody
	}
	{
		Component = Sound
	}
]

script ProcessorGroup_RegisterDefault 
	RegisterProcessorGroupDesc \{Name = ProcessorGroup_CompositeSystem
		processors = [
			{
				Name = Processor_Default
				Task = {
					Name = PTask_Default
				}
			}
		]}
	ProcessorMgr_Init \{Group = ProcessorGroup_CompositeSystem}
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
	PassMgr_Init \{Group = PassGroup_CompositeSystem}
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
				Components = <PassDefault_components>
			}
			{pass = Pass_Agent
				Components = [{Name = PedLife}
					{Name = AiInfo}
					{Name = Agent}
					{Name = FAM}
					{Name = Locator}
					{Name = ItemControl}
					{Name = Vision}
					{Name = CollisionCache
						Params = {bbox_min = (-0.1, -20.0, -0.1)
							bbox_max = (0.1, 10.0, 0.1)
							layer = static_geometry_feeler}}
					{Name = Navigation}
					{Name = Motion}
					{Name = Ragdoll}
				]
			}
			{pass = Pass_Behavior
				Components = [{Name = EventCache}
					{Name = BehaviorSystem}
					{Name = Inventory}
					{Name = Seek}
					{Name = Passenger}
					{Name = Targetable}
					{Name = Proximity}
					{Name = Interact}
					{Name = SkaterLoopingSound}
					{Name = AnimTree}
					{Name = LockObj
						Params = {lock_to_object_matrix
							OFF}}
					{Name = NavCollision}
					{Name = AlignToGround
						Params = {OFF}}
				]
			}
			{pass = Pass_Model
				Components = [{Name = Skeleton}
					{Name = Model}
					{Name = SpecialItem}
					{Name = proximtrigger
						Params = {trigger_checksum = Ped , cube_length = 0.4}}
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
				Components = <PassDefault_components>
			}
			{pass = Pass_Agent
				Components = [{Name = PedLife}
					{Name = AiInfo}
					{Name = Agent}
					{Name = FAM}
					{Name = Locator}
					{Name = ItemControl}
					{Name = CollisionCache
						Params = {bbox_min = (-0.1, -20.0, -0.1)
							bbox_max = (0.1, 10.0, 0.1)
							layer = static_geometry_feeler}}
					{Name = Navigation}
					{Name = Motion}
				]
			}
			{pass = Pass_Behavior
				Components = [{Name = EventCache}
					{Name = BehaviorSystem}
					{Name = Seek}
					{Name = Interact}
					{Name = VehiclePhysics}
					{Name = AnimTree}
					{Name = Input
						Params = {controller = 1}}
				]
			}
			{pass = Pass_Model
				Components = [{Name = Skeleton}
					{Name = Model}
					{Name = proximtrigger
						Params = {trigger_checksum = Vehicle , cube_length = 0.4}}
				]
			}]
	}
	RegisterCompositeObjectDesc \{Name = CompositeGameObject_SimpleHover
		callback = NullScript
		passes = [
			{
				pass = Pass_Default
				Components = [
					{
						Name = Suspend
					}
				]
			}
			{
				pass = Pass_Move
				Components = [
					{
						Name = Hover
					}
				]
			}
			{
				pass = Pass_Model
				Components = [
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
		callback = NullScript
		passes = [
			{
				pass = Pass_Default
				Components = [
					{
						Name = Suspend
					}
				]
			}
			{
				pass = Pass_Move
				Components = [
					{
						Name = rigidbody
					}
				]
			}
			{
				pass = Pass_Model
				Components = [
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
		{Name = Motion}
	]
	Massive_components = [{Name = MassiveAd}]
	AdObject_components = (<AdObject_components> + <Massive_components>)
	RegisterCompositeObjectDesc {
		Name = CompositeGameObject_AdObject
		callback = NullScript
		passes =
		[
			{pass = Pass_Default
				Components = <AdObject_components>
			}
		]
	}
endscript

script CompositeAgent_CustomizeComponents 
	if GotParam \{CompassBlipType}
		CreateComponentFromStructure Component = CompassBlip <...>
	endif
	if GotParam \{voice_profile}
		if StructureContains \{Structure = appearance
				voice_profile}
			voice_profile = (<appearance>.voice_profile)
		else
			voice_profile = (<Profile>.voice_profile)
		endif
		if StructureContains Structure = $NoticeVoVoiceProfiles <voice_profile>
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
