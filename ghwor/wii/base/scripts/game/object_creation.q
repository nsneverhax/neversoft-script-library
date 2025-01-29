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
		component = CinematicCamera
		UpdateWhenCameraInactive = FALSE
	}
]
levellight_composite_structure = [
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
		component = Attach
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
				Name = Pass_Move
				processors = [
					Processor_Default
				]
			}
		]}
	PassMgr_Init \{group = PassGroup_CompositeSystem}
endscript

script CompositeObjects_RegisterDefault 
	AdObject_components = [{Name = Model}
		{Name = motion}
	]
	RegisterCompositeObjectDesc \{Name = compositeobject_defaultuistackobject
		callback = nullscript
		passes = [
			{
				pass = Pass_Default
				components = [
					{
						Name = requireduistack
					}
				]
			}
		]}
	RegisterCompositeObjectDesc \{Name = compositeobject_debuguistackobject
		callback = nullscript
		passes = [
			{
				pass = Pass_Default
				components = [
					{
						Name = requireduistack
					}
					{
						Name = debuguistack
					}
				]
			}
		]}
	RegisterCompositeObjectDesc \{Name = compositeobject_exampleuistackobject
		callback = nullscript
		passes = [
			{
				pass = Pass_Default
				components = [
					{
						Name = requireduistack
					}
					{
						Name = exampleuistack
					}
				]
			}
		]}
	RegisterCompositeObjectDesc \{Name = compositeobject_songlistuistackobject
		callback = nullscript
		passes = [
			{
				pass = Pass_Default
				components = [
					{
						Name = requireduistack
					}
					{
						Name = songlistuistack
					}
				]
			}
		]}
	RegisterCompositeObjectDesc \{Name = compositeobject_freeplayuistackobject
		callback = nullscript
		passes = [
			{
				pass = Pass_Default
				components = [
					{
						Name = requireduistack
					}
					{
						Name = freeplayuistack
					}
				]
			}
		]}
	RegisterCompositeObjectDesc \{Name = compositeobject_awardcaseuistackobject
		callback = nullscript
		passes = [
			{
				pass = Pass_Default
				components = [
					{
						Name = requireduistack
					}
					{
						Name = awardcaseuistack
					}
				]
			}
		]}
	RegisterCompositeObjectDesc \{Name = animpassgameobject
		callback = nullscript
		passes = [
			{
				pass = Pass_Anim
				components = [
					{
						Name = AnimTree
					}
				]
			}
			{
				pass = Pass_Default
				components = [
					{
						Name = SetDisplayMatrix
					}
					{
						Name = motion
					}
					{
						Name = Skeleton
					}
					{
						Name = Model
					}
				]
			}
		]}
	RegisterCompositeObjectDesc \{Name = ampzillagameobject
		callback = nullscript
		passes = [
			{
				pass = Pass_Anim
				components = [
					{
						Name = AnimTree
					}
				]
			}
			{
				pass = Pass_Default
				components = [
					{
						Name = Skeleton
					}
					{
						Name = SetDisplayMatrix
					}
					{
						Name = Model
					}
					{
						Name = motion
					}
				]
			}
		]}
	RegisterCompositeObjectDesc \{Name = animpasswithlockgameobject
		callback = nullscript
		passes = [
			{
				pass = Pass_Anim
				components = [
					{
						Name = AnimTree
					}
				]
			}
			{
				pass = Pass_Default
				components = [
					{
						Name = SetDisplayMatrix
					}
					{
						Name = motion
					}
					{
						Name = Skeleton
					}
					{
						Name = Model
					}
					{
						Name = LockObj
					}
				]
			}
		]}
endscript

script RegisterCompositeObjectDesc 
	newglobal Name = <Name> value = <...>
endscript
