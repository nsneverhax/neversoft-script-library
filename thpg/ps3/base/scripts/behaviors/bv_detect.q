
script RegisterBehaviors_DetectThreats 
	registerstate \{name = Bv_DetectThreats
		task = {
			name = Task_DetectThreats
		}
		transitions = [
			{
				events = [
					enter_behavior
				]
				responses = [
					{
						replacement = vision
						state = Bv_EnableVision
					}
				]
			}
		]}
endscript

script RegisterBehaviors_DetectVehicles 
	registerstate {
		name = Bv_DetectVehicles
		task = {name = Task_DetectVehicles
			params = {search_radius = 15
				min_find_delay = 1.0
				max_find_delay = 1.0
				found_event_id = Got_DetectVehicle
				lost_event_id = Lost_DetectVehicle}}
		transitions = []}
	registerstate {
		name = Bv_DetectAndAcquireVehicles
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = child state = bv_blank}
					{replacement = detect state = Bv_DetectVehicles}
				]
			}
			{events = [Got_DetectVehicle] ,
				recur = true
				responses = [{replacement = child
						state = Bv_EnterVehicle
						params = [{name = attach_type val = driver}]
					}]
			}
			{events = [Lost_DetectVehicle] ,
				responses = [{replacement = child state = bv_blank}]
			}
			{events = [AcquireVehicle_Failed] ,
				responses = [{replacement = this state = Bv_DetectAndAcquireVehicles}]
			}
		]}
	registerstate {
		name = Bv_DetectObstacles
		task = {name = Task_DetectObstacles
			params = {update_delay = 0.0}
		}
		transitions = []
	}
endscript

script RegisterBehaviors_DetectDynamiteProximity 
	registerstate \{name = Bv_DetectDynamiteProximity
		task = {
			name = Task_DetectDynamiteProximity
			params = {
				min_reaction_time = 0.1
				max_reaction_time = 1.3
				max_detect_dist = 3
			}
		}
		transitions = [
		]}
endscript

script RegisterBehaviors_DetectNoiseVolume 
	registerstate \{name = Bv_DetectNoiseVolume
		task = {
			name = Task_DetectNoiseVolume
			params = {
				min_reaction_time = 0.0
				max_reaction_time = 0.0
				high_vol_dist = 17.5
				mid_vol_dist = 30
				low_vol_dist = 37.5
			}
		}
		transitions = [
		]}
endscript
