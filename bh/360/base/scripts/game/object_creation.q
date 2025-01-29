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
		UpdateWhenCameraInactive = false
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
	RegisterProcessorGroupDesc \{name = ProcessorGroup_CompositeSystem
		processors = [
			{
				name = Processor_DefaultStaged
				task = {
					name = PTask_DefaultStaged
				}
			}
			{
				name = Processor_Default
				task = {
					name = PTask_Default
				}
			}
		]}
	ProcessorMgr_Init \{group = ProcessorGroup_CompositeSystem}
endscript

script PassGroup_RegisterDefault 
	RegisterPassGroupDesc \{name = PassGroup_CompositeSystem
		passes = [
			{
				name = Pass_Anim
				processors = [
					Processor_DefaultStaged
				]
			}
			{
				name = Pass_Default
				processors = [
					Processor_Default
				]
			}
			{
				name = Pass_Move
				processors = [
					Processor_Default
				]
			}
		]}
	PassMgr_Init \{group = PassGroup_CompositeSystem}
endscript

script CompositeObjects_RegisterDefault 
	AdObject_components = [{name = Model}
		{name = motion}
	]
	Massive_components = [{name = DynamicAd}]
	AdObject_components = (<AdObject_components> + <Massive_components>)
	RegisterCompositeObjectDesc {
		name = CompositeGameObject_AdObject
		callback = nullscript
		passes =
		[
			{pass = Pass_Default
				components = <AdObject_components>
			}
		]
	}
	RegisterCompositeObjectDesc \{name = CompositeGameObject_LevelLight
		callback = nullscript
		passes = [
			{
				pass = Pass_Default
				components = [
					{
						name = PositionMorph
					}
					{
						name = dynamiclight
					}
				]
			}
		]}
	RegisterCompositeObjectDesc \{name = CompositeObject_BandMember
		callback = nullscript
		passes = [
			{
				pass = Pass_Anim
				components = [
					{
						name = AnimTree
					}
				]
			}
			{
				pass = Pass_Default
				components = [
					{
						name = Skeleton
					}
					{
						name = Ragdoll
					}
					{
						name = SetDisplayMatrix
					}
					{
						name = Accoutrement
					}
					{
						name = Model
					}
					{
						name = motion
					}
					{
						name = ModelBuilder
					}
					{
						name = AnimPreview
					}
					{
						name = AnimInfo
					}
				]
			}
		]}
	RegisterCompositeObjectDesc \{name = AnimPassGameObject
		callback = nullscript
		passes = [
			{
				pass = Pass_Anim
				components = [
					{
						name = AnimTree
					}
				]
			}
			{
				pass = Pass_Default
				components = [
					{
						name = SetDisplayMatrix
					}
					{
						name = motion
					}
					{
						name = Skeleton
					}
					{
						name = Model
					}
				]
			}
		]}
	RegisterCompositeObjectDesc \{name = BandLogoGameObject
		callback = nullscript
		passes = [
			{
				pass = Pass_Anim
				components = [
					{
						name = AnimTree
					}
				]
			}
			{
				pass = Pass_Default
				components = [
					{
						name = SetDisplayMatrix
					}
					{
						name = Skeleton
					}
					{
						name = Model
					}
					{
						name = ModelBuilder
					}
				]
			}
		]}
endscript
