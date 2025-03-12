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
		component = attach
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
				name = processor_defaultstaged
				task = {
					name = ptask_defaultstaged
				}
			}
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
				name = pass_anim
				processors = [
					processor_defaultstaged
				]
			}
			{
				name = pass_default
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
		]}
	passmgr_init \{group = passgroup_compositesystem}
endscript

script compositeobjects_registerdefault 
	adobject_components = [{name = model}
		{name = motion}
	]
	massive_components = [{name = dynamicad}]
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
	registercompositeobjectdesc \{name = compositegameobject_levellight
		callback = nullscript
		passes = [
			{
				pass = pass_default
				components = [
					{
						name = positionmorph
					}
					{
						name = dynamiclight
					}
				]
			}
		]}
	registercompositeobjectdesc \{name = compositeobject_defaultuistackobject
		callback = nullscript
		passes = [
			{
				pass = pass_default
				components = [
					{
						name = requireduistack
					}
				]
			}
		]}
	registercompositeobjectdesc \{name = compositeobject_debuguistackobject
		callback = nullscript
		passes = [
			{
				pass = pass_default
				components = [
					{
						name = requireduistack
					}
					{
						name = debuguistack
					}
				]
			}
		]}
	registercompositeobjectdesc \{name = compositeobject_exampleuistackobject
		callback = nullscript
		passes = [
			{
				pass = pass_default
				components = [
					{
						name = requireduistack
					}
					{
						name = exampleuistack
					}
				]
			}
		]}
	registercompositeobjectdesc \{name = compositeobject_songlistuistackobject
		callback = nullscript
		passes = [
			{
				pass = pass_default
				components = [
					{
						name = requireduistack
					}
					{
						name = songlistuistack
					}
				]
			}
		]}
	registercompositeobjectdesc \{name = compositeobject_freeplayuistackobject
		callback = nullscript
		passes = [
			{
				pass = pass_default
				components = [
					{
						name = requireduistack
					}
					{
						name = freeplayuistack
					}
				]
			}
		]}
	registercompositeobjectdesc \{name = compositeobject_awardcaseuistackobject
		callback = nullscript
		passes = [
			{
				pass = pass_default
				components = [
					{
						name = requireduistack
					}
					{
						name = awardcaseuistack
					}
				]
			}
		]}
	registercompositeobjectdesc \{name = compositeobject_bandmember
		callback = nullscript
		passes = [
			{
				pass = pass_anim
				components = [
					{
						name = animtree
					}
				]
			}
			{
				pass = pass_default
				components = [
					{
						name = skeleton
					}
					{
						name = setdisplaymatrix
					}
					{
						name = lookatanim
					}
					{
						name = accoutrement
					}
					{
						name = lockobj
					}
					{
						name = model
					}
					{
						name = motion
					}
					{
						name = modelbuilder
					}
					{
						name = animpreview
					}
					{
						name = animinfo
					}
					{
						name = suspend
					}
					{
						name = curve
					}
				]
			}
		]}
	registercompositeobjectdesc \{name = animpassgameobject
		callback = nullscript
		passes = [
			{
				pass = pass_anim
				components = [
					{
						name = animtree
					}
				]
			}
			{
				pass = pass_default
				components = [
					{
						name = setdisplaymatrix
					}
					{
						name = motion
					}
					{
						name = skeleton
					}
					{
						name = model
					}
				]
			}
		]}
	registercompositeobjectdesc \{name = ampzillagameobject
		callback = nullscript
		passes = [
			{
				pass = pass_anim
				components = [
					{
						name = animtree
					}
				]
			}
			{
				pass = pass_default
				components = [
					{
						name = skeleton
					}
					{
						name = setdisplaymatrix
					}
					{
						name = accoutrement
					}
					{
						name = model
					}
					{
						name = motion
					}
				]
			}
		]}
	registercompositeobjectdesc \{name = animpasswithlockgameobject
		callback = nullscript
		passes = [
			{
				pass = pass_anim
				components = [
					{
						name = animtree
					}
				]
			}
			{
				pass = pass_default
				components = [
					{
						name = setdisplaymatrix
					}
					{
						name = motion
					}
					{
						name = skeleton
					}
					{
						name = lockobj
					}
					{
						name = model
					}
				]
			}
		]}
	registercompositeobjectdesc \{name = speakerconegameobject
		callback = nullscript
		passes = [
			{
				pass = pass_default
				components = [
					{
						name = model
					}
				]
			}
		]}
	registercompositeobjectdesc \{name = bandlogogameobject
		callback = nullscript
		passes = [
			{
				pass = pass_anim
				components = [
					{
						name = animtree
					}
				]
			}
			{
				pass = pass_default
				components = [
					{
						name = setdisplaymatrix
					}
					{
						name = skeleton
					}
					{
						name = model
					}
					{
						name = modelbuilder
					}
				]
			}
		]}
	registercompositeobjectdesc \{name = levelinstanceobject
		callback = nullscript
		passes = [
			{
				pass = pass_default
				components = [
					{
						name = skeleton
					}
					{
						name = model
					}
					{
						name = modelbuilder
					}
					{
						name = instancelist
					}
				]
			}
		]}
	registercompositeobjectdesc \{name = levelinstanceanimation
		callback = nullscript
		passes = [
			{
				pass = pass_anim
				components = [
					{
						name = animtree
					}
				]
			}
			{
				pass = pass_default
				components = [
					{
						name = skeleton
					}
					{
						name = animpreview
					}
					{
						name = animinfo
					}
				]
			}
		]}
endscript
