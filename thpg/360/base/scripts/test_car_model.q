create_test_vehicle_menu = [
	{
		name = "veh_workvan"
		model = 'Veh\\veh_workvan\\veh_workvan.mdl'
		skeletonname = veh_workvan
	}
	{
		name = "veh_american_small_sedan"
		model = 'Veh\\veh_american_small_sedan\\veh_american_small_sedan.mdl'
		skeletonname = veh_american_small_sedan
	}
	{
		name = "veh_american_large_sedan"
		model = 'Veh\\veh_american_large_sedan\\veh_american_large_sedan.mdl'
		skeletonname = veh_american_large_sedan
	}
	{
		name = "veh_pickup_truck"
		model = 'Veh\\veh_pickup_truck\\veh_pickup_truck.mdl'
		skeletonname = veh_pickup_truck
	}
	{
		name = "veh_mini_van"
		model = 'Veh\\veh_mini_van\\veh_mini_van.mdl'
		skeletonname = veh_mini_van
	}
	{
		name = "veh_jeep_liberty"
		model = 'Veh\\veh_jeep_liberty\\veh_jeep_liberty.mdl'
		skeletonname = robot_kick_in_count
	}
	{
		name = "veh_jeep_patriot"
		model = 'Veh\\veh_jeep_patriot\\veh_jeep_patriot.mdl'
		skeletonname = veh_jeep_patriot
	}
	{
		name = "veh_vintage"
		model = 'Veh\\veh_vintage\\veh_vintage.mdl'
		skeletonname = veh_vintage
	}
]

script CreateTestCarModel model = 'Veh\\veh_pickup_truck\\veh_pickup_truck.mdl' skeletonname = veh_pickup_truck
	if compositeobjectexists TestCar
		TestCar :die
	endif
	skater :obj_getposition
	skater :obj_getquat
	skater :obj_getorientation
	createcompositeobject {
		components = [
			{component = input
				controller = 1
			}
			{component = vehiclephysics
				vehicle_physics = $VehiclePhysics_Default
			}
			{component = animtree
			}
			{component = skeleton
				skeletonname = <skeletonname>
				nonskinned
			}
			{component = dynarail
			}
			{component = model
			}
			{component = displayorientationdebug
			}
		]
		params = {
			name = TestCar
			pos = (<pos> + 4 * ((1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>) + (0.0, 0.0, 0.0))
			orientation = <quat>
			model = <model>
		}
	}
	TestCar :anim_inittree tree = TestCarTree
	TestCar :obj_forceupdate
	TestCar :obj_makematerialunique
	TestCar :vehiclephysics_enablecontrollerinput
endscript
TestCarTree = {
	type = vehiclephysicssource
}
