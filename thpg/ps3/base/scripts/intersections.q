DefaultTrafficLightSecs = 10.0
TestLevel_A1_Intersection_Center4Way = {
	state_callback = TestIntersectionStateCallback
	light_callback = IntersectionLightCallback
	main_light_info = IntersectionMainLightInfo_Default
	crossing_light_info = IntersectionCrossingLightInfo_Default
	main_yellow_duration = 2.0
	crossing_yellow_duration = 2.0
	sequence = [
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State0
			main_nodes = [
				{
					node = Z_TestLevel_A1_VehicleIntersection_02
					state = go
				}
				{
					node = Z_TestLevel_A1_VehicleIntersection_04
					state = go
				}
				{
					node = Z_TestLevel_A1_VehicleIntersection_01
					state = stop
				}
				{
					node = Z_TestLevel_A1_VehicleIntersection_03
					state = stop
				}
			]
			crossing_nodes = [
				{
					node = Z_testlevel_A1_Crosswalk_01
					state = stop
				}
			]
			main_lights = [
				{
					light = Z_testlevel_A1_TrafficLight_01
					color = green
				}
				{
					light = Z_testlevel_A1_TrafficLight_03
					color = green
				}
				{
					light = Z_testlevel_A1_TrafficLight_02
					color = red
				}
				{
					light = Z_testlevel_A1_TrafficLight_04
					color = red
				}
			]
			crossing_lights = [
				{
					light = Z_testlevel_A1_CrosswalkLight_01
					color = green
				}
				{
					light = Z_testlevel_A1_CrosswalkLight_02
					color = green
				}
				{
					light = Z_testlevel_A1_CrosswalkLight_03
					color = green
				}
				{
					light = Z_testlevel_A1_CrosswalkLight_04
					color = green
				}
				{
					light = Z_testlevel_A1_CrosswalkLight_05
					color = red
				}
				{
					light = Z_testlevel_A1_CrosswalkLight_06
					color = red
				}
				{
					light = Z_testlevel_A1_CrosswalkLight_07
					color = red
				}
				{
					light = Z_testlevel_A1_CrosswalkLight_08
					color = red
				}
			]
		}
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State1
			main_nodes = [
				{
					node = Z_TestLevel_A1_VehicleIntersection_02
					state = stop
				}
				{
					node = Z_TestLevel_A1_VehicleIntersection_04
					state = stop
				}
				{
					node = Z_TestLevel_A1_VehicleIntersection_01
					state = go
				}
				{
					node = Z_TestLevel_A1_VehicleIntersection_03
					state = go
				}
			]
			crossing_nodes = [
				{
					node = Z_testlevel_A1_Crosswalk_01
					state = go
				}
			]
			main_lights = [
				{
					light = Z_testlevel_A1_TrafficLight_01
					color = red
				}
				{
					light = Z_testlevel_A1_TrafficLight_03
					color = red
				}
				{
					light = Z_testlevel_A1_TrafficLight_02
					color = green
				}
				{
					light = Z_testlevel_A1_TrafficLight_04
					color = green
				}
			]
			crossing_lights = [
				{
					light = Z_testlevel_A1_CrosswalkLight_01
					color = red
				}
				{
					light = Z_testlevel_A1_CrosswalkLight_02
					color = red
				}
				{
					light = Z_testlevel_A1_CrosswalkLight_03
					color = red
				}
				{
					light = Z_testlevel_A1_CrosswalkLight_04
					color = red
				}
				{
					light = Z_testlevel_A1_CrosswalkLight_05
					color = green
				}
				{
					light = Z_testlevel_A1_CrosswalkLight_06
					color = green
				}
				{
					light = Z_testlevel_A1_CrosswalkLight_07
					color = green
				}
				{
					light = Z_testlevel_A1_CrosswalkLight_08
					color = green
				}
			]
		}
	]
}
Vehicles_Intersection_01 = {
	state_callback = TestIntersectionStateCallback
	light_callback = IntersectionLightCallback
	main_light_info = IntersectionMainLightInfo_Default
	crossing_light_info = IntersectionCrossingLightInfo_Default
	main_yellow_duration = 2.0
	crossing_yellow_duration = 2.0
	sequence = [
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State0
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_01
					state = go
				}
				{
					node = Z_Vehicles_VehicleIntersection_02
					state = go
				}
				{
					node = Z_Vehicles_VehicleIntersection_03
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_04
					state = stop
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_03A
					state = stop
				}
				{
					node = Z_Vehicles_Crosswalk_01A
					state = go
				}
				{
					node = Z_Vehicles_Crosswalk_02A
					state = stop
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_01
					color = green
				}
				{
					light = Z_Vehicles_I_TrafficLight_02
					color = green
				}
				{
					light = Z_Vehicles_I_TrafficLight_03
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_04
					color = red
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_01
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_02
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_03
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_04
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_05
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_06
					color = red
				}
			]
		}
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State1
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_01
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_02
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_03
					state = go
				}
				{
					node = Z_Vehicles_VehicleIntersection_04
					state = go
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_03A
					state = go
				}
				{
					node = Z_Vehicles_Crosswalk_01A
					state = stop
				}
				{
					node = Z_Vehicles_Crosswalk_02A
					state = stop
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_01
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_02
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_03
					color = green
				}
				{
					light = Z_Vehicles_I_TrafficLight_04
					color = green
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_01
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_02
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_03
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_04
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_05
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_06
					color = red
				}
			]
		}
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State2
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_01
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_02
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_03
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_04
					state = stop
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_03A
					state = stop
				}
				{
					node = Z_Vehicles_Crosswalk_01A
					state = stop
				}
				{
					node = Z_Vehicles_Crosswalk_02A
					state = go
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_01
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_02
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_03
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_04
					color = red
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_01
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_02
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_03
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_04
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_05
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_06
					color = green
				}
			]
		}
	]
}
Vehicles_Intersection_02 = {
	state_callback = TestIntersectionStateCallback
	light_callback = IntersectionLightCallback
	main_light_info = IntersectionMainLightInfo_Default
	crossing_light_info = IntersectionCrossingLightInfo_Default
	main_yellow_duration = 2.0
	crossing_yellow_duration = 2.0
	sequence = [
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State0
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_05
					state = go
				}
				{
					node = Z_Vehicles_VehicleIntersection_06
					state = go
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_04A
					state = stop
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_05
					color = green
				}
				{
					light = Z_Vehicles_I_TrafficLight_06
					color = green
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_07
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_08
					color = red
				}
			]
		}
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State1
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_05
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_06
					state = stop
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_04A
					state = go
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_05
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_06
					color = red
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_07
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_08
					color = green
				}
			]
		}
	]
}
Vehicles_Intersection_03 = {
	state_callback = TestIntersectionStateCallback
	light_callback = IntersectionLightCallback
	main_light_info = IntersectionMainLightInfo_Default
	crossing_light_info = IntersectionCrossingLightInfo_Default
	main_yellow_duration = 2.0
	crossing_yellow_duration = 2.0
	sequence = [
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State0
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_07
					state = go
				}
				{
					node = Z_Vehicles_VehicleIntersection_09
					state = go
				}
				{
					node = Z_Vehicles_VehicleIntersection_08
					state = stop
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_05A
					state = stop
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_07
					color = green
				}
				{
					light = Z_Vehicles_I_TrafficLight_09
					color = green
				}
				{
					light = Z_Vehicles_I_TrafficLight_08
					color = red
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_09
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_10
					color = red
				}
			]
		}
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State1
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_07
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_09
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_08
					state = go
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_05A
					state = stop
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_07
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_09
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_08
					color = green
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_09
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_10
					color = red
				}
			]
		}
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State2
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_07
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_09
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_08
					state = stop
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_05A
					state = go
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_07
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_09
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_08
					color = red
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_09
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_10
					color = green
				}
			]
		}
	]
}
Vehicles_Intersection_04 = {
	state_callback = TestIntersectionStateCallback
	light_callback = IntersectionLightCallback
	main_light_info = IntersectionMainLightInfo_Default
	crossing_light_info = IntersectionCrossingLightInfo_Default
	main_yellow_duration = 2.0
	crossing_yellow_duration = 2.0
	sequence = [
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State0
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_10
					state = go
				}
				{
					node = Z_Vehicles_VehicleIntersection_11
					state = go
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_06A
					state = stop
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_10
					color = green
				}
				{
					light = Z_Vehicles_I_TrafficLight_11
					color = green
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_11
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_12
					color = red
				}
			]
		}
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State1
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_10
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_11
					state = stop
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_06A
					state = go
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_10
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_11
					color = red
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_11
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_12
					color = green
				}
			]
		}
	]
}
Vehicles_Intersection_05 = {
	state_callback = TestIntersectionStateCallback
	light_callback = IntersectionLightCallback
	main_light_info = IntersectionMainLightInfo_Default
	crossing_light_info = IntersectionCrossingLightInfo_Default
	main_yellow_duration = 2.0
	crossing_yellow_duration = 2.0
	sequence = [
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State0
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_12
					state = go
				}
				{
					node = Z_Vehicles_VehicleIntersection_13
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_14
					state = stop
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_07A
					state = stop
				}
				{
					node = Z_Vehicles_Crosswalk_08A
					state = go
				}
				{
					node = Z_Vehicles_Crosswalk_09A
					state = go
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_12
					color = green
				}
				{
					light = Z_Vehicles_I_TrafficLight_13
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_14
					color = red
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_14
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_15
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_16
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_17
					color = green
				}
			]
		}
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State1
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_12
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_13
					state = go
				}
				{
					node = Z_Vehicles_VehicleIntersection_14
					state = go
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_07A
					state = go
				}
				{
					node = Z_Vehicles_Crosswalk_08A
					state = stop
				}
				{
					node = Z_Vehicles_Crosswalk_09A
					state = stop
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_12
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_13
					color = green
				}
				{
					light = Z_Vehicles_I_TrafficLight_14
					color = green
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_14
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_15
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_16
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_17
					color = red
				}
			]
		}
	]
}
Vehicles_Intersection_06 = {
	state_callback = TestIntersectionStateCallback
	light_callback = IntersectionLightCallback
	main_light_info = IntersectionMainLightInfo_Default
	crossing_light_info = IntersectionCrossingLightInfo_Default
	main_yellow_duration = 2.0
	crossing_yellow_duration = 2.0
	sequence = [
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State0
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_15
					state = go
				}
				{
					node = Z_Vehicles_VehicleIntersection_16
					state = stop
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_10A
					state = stop
				}
				{
					node = Z_Vehicles_Crosswalk_11A
					state = go
				}
			]
			main_lights = [
			]
			crossing_lights = [
			]
		}
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State1
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_15
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_16
					state = go
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_10A
					state = go
				}
				{
					node = Z_Vehicles_Crosswalk_11A
					state = stop
				}
			]
			main_lights = [
			]
			crossing_lights = [
			]
		}
	]
}
Vehicles_Intersection_07 = {
	state_callback = TestIntersectionStateCallback
	light_callback = IntersectionLightCallback
	main_light_info = IntersectionMainLightInfo_Default
	crossing_light_info = IntersectionCrossingLightInfo_Default
	main_yellow_duration = 2.0
	crossing_yellow_duration = 2.0
	sequence = [
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State0
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_17
					state = go
				}
				{
					node = Z_Vehicles_VehicleIntersection_18
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_19
					state = stop
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_12A
					state = stop
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_17
					color = green
				}
				{
					light = Z_Vehicles_I_TrafficLight_18
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_19
					color = red
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_23
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_24
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_41
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_40
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_39
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_38
					color = green
				}
			]
		}
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State1
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_17
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_18
					state = go
				}
				{
					node = Z_Vehicles_VehicleIntersection_19
					state = go
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_12A
					state = go
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_17
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_18
					color = green
				}
				{
					light = Z_Vehicles_I_TrafficLight_19
					color = green
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_23
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_24
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_41
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_40
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_39
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_38
					color = red
				}
			]
		}
	]
}
Vehicles_Intersection_08 = {
	state_callback = TestIntersectionStateCallback
	light_callback = IntersectionLightCallback
	main_light_info = IntersectionMainLightInfo_Default
	crossing_light_info = IntersectionCrossingLightInfo_Default
	main_yellow_duration = 2.0
	crossing_yellow_duration = 2.0
	sequence = [
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State0
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_20
					state = go
				}
				{
					node = Z_Vehicles_VehicleIntersection_21
					state = go
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_17A
					state = stop
				}
			]
			main_lights = [
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_29
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_30
					color = red
				}
			]
		}
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State1
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_20
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_21
					state = stop
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_17A
					state = go
				}
			]
			main_lights = [
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_29
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_30
					color = green
				}
			]
		}
	]
}
Vehicles_Intersection_09 = {
	state_callback = TestIntersectionStateCallback
	light_callback = IntersectionLightCallback
	main_light_info = IntersectionMainLightInfo_Default
	crossing_light_info = IntersectionCrossingLightInfo_Default
	main_yellow_duration = 2.0
	crossing_yellow_duration = 2.0
	sequence = [
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State0
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_22
					state = go
				}
				{
					node = Z_Vehicles_VehicleIntersection_23
					state = go
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_18A
					state = stop
				}
			]
			main_lights = [
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_31
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_32
					color = red
				}
			]
		}
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State1
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_22
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_23
					state = stop
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_18A
					state = go
				}
			]
			main_lights = [
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_31
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_32
					color = green
				}
			]
		}
	]
}
Vehicles_Intersection_10 = {
	state_callback = TestIntersectionStateCallback
	light_callback = IntersectionLightCallback
	main_light_info = IntersectionMainLightInfo_Default
	crossing_light_info = IntersectionCrossingLightInfo_Default
	main_yellow_duration = 2.0
	crossing_yellow_duration = 2.0
	sequence = [
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State0
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_24
					state = go
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_19A
					state = stop
				}
			]
			main_lights = [
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_34
					color = red
				}
			]
		}
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State1
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_24
					state = stop
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_19A
					state = go
				}
			]
			main_lights = [
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_34
					color = green
				}
			]
		}
	]
}
Vehicles_Intersection_11 = {
	state_callback = TestIntersectionStateCallback
	light_callback = IntersectionLightCallback
	main_light_info = IntersectionMainLightInfo_Default
	crossing_light_info = IntersectionCrossingLightInfo_Default
	main_yellow_duration = 2.0
	crossing_yellow_duration = 2.0
	sequence = [
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State0
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_25
					state = stop
				}
				{
					node = Z_Vehicles_VehicleIntersection_26
					state = stop
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_20A
					state = go
				}
				{
					node = Z_Vehicles_Crosswalk_21A
					state = go
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_28
					color = red
				}
				{
					light = Z_Vehicles_I_TrafficLight_27
					color = red
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_35
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_36
					color = green
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_37
					color = green
				}
			]
		}
		{
			stable_duration = $DefaultTrafficLightSecs
			callback_data = State1
			main_nodes = [
				{
					node = Z_Vehicles_VehicleIntersection_25
					state = go
				}
				{
					node = Z_Vehicles_VehicleIntersection_26
					state = go
				}
			]
			crossing_nodes = [
				{
					node = Z_Vehicles_Crosswalk_20A
					state = stop
				}
				{
					node = Z_Vehicles_Crosswalk_21A
					state = stop
				}
			]
			main_lights = [
				{
					light = Z_Vehicles_I_TrafficLight_28
					color = green
				}
				{
					light = Z_Vehicles_I_TrafficLight_27
					color = green
				}
			]
			crossing_lights = [
				{
					light = Z_Vehicles_I_CrosswalkLight_35
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_36
					color = red
				}
				{
					light = Z_Vehicles_I_CrosswalkLight_37
					color = red
				}
			]
		}
	]
}
pathdesc_slowroad = {
	move_desc = {
		stick_to_path = true
		max_environment_speed = 30.0
	}
}
PathDesc_FastRoad = {
	move_desc = {
		stick_to_path = true
		max_environment_speed = -1.0
	}
}
IntersectionMainLightInfo_Default = {
	green_offset = 0.33
	yellow_offset = 0.66
	red_offset = 0.0
	material = [
		TRAFFIC
		TRAFFIC
	]
}
IntersectionCrossingLightInfo_Default = {
	green_offset = 1.75
	yellow_offset = 0.0
	red_offset = 0.0
	material = [
		WALK
	]
}

script IntersectionLightCallback 
	if (<color> = green)
		offset = ($<light_info>.green_offset)
	elseif (<color> = yellow)
		offset = ($<light_info>.yellow_offset)
	elseif (<color> = red)
		offset = ($<light_info>.red_offset)
	else
		scriptassert "Invalid color %a sent to IntersectionLightCallback for light object %b." a = <color> b = <light>
	endif
	material = ($<light_info>.material)
	getarraysize material
	<index> = 0
	begin
	SetObjectVOffset name = <light> material = (<material> [<index>]) offset = <offset>
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script TestIntersectionStateCallback 
endscript
