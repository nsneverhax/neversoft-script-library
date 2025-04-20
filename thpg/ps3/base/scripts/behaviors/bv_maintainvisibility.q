
script RegisterBehaviors_MaintainVisibility 
	registerstate {
		name = Bv_MaintainVisibility_Center
		task = {name = Task_GenEvents params = {event_gen_id = viewdistance_center}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = vis state = Bv_GenEvents_Visibility_Center}
					{replacement = look state = Bv_LookAt_Center}]}
			{events = [lost_visibility_center] ,
				responses = [{replacement = this state = Bv_MaintainVisibility_Center_LostVisibility}]}
			{events = [viewdistance_center_far] ,
				responses = [{replacement = this state = Bv_MaintainVisibility_Center_LostDistance}]}
		]}
	registerstate {
		name = Bv_MaintainVisibility_Center_LostVisibility
		task = {name = Task_GenEvents params = {event_gen_id = viewdistance_center}}
		transitions = [{events = [lost_visibility_center] ,
				responses = [{replacement = vis state = Bv_GenEvents_Visibility_Center}
					{replacement = move state = `tex/models/characters/layers/cag/esp/gtr63f_esp_ex_ld_06.img`}
					{replacement = look state = Bv_LookAt_Center}]}
			{events = [got_visibility_center] ,
				responses = [{replacement = this state = Bv_MaintainVisibility_Center}]}
			{events = [viewdistance_center_far] ,
				responses = [{replacement = this state = Bv_MaintainVisibility_Center_LostDistance}]}
		]}
	registerstate {
		name = Bv_MaintainVisibility_Center_LostDistance
		task = {name = Task_GenEvents params = {event_gen_id = viewdistance_center}}
		transitions = [{events = [lost_visibility_center] ,
				responses = [{replacement = move state = `tex/models/characters/layers/cag/esp/gtr63f_esp_ex_ld_06.img`}
					{replacement = look state = Bv_LookAt_Center}]}
			{events = [viewdistance_center_near] ,
				responses = [{replacement = this state = Bv_MaintainVisibility_Center}]}
		]}
	registerstate {
		name = Bv_MaintainVisibility_Enemy
		task = {name = Task_GenEvents params = {event_gen_id = viewdistance_enemy}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = vis state = Bv_GenEvents_Visibility_Enemy}
					{replacement = look state = Bv_LookAt_Enemy}]}
			{events = [lost_visibility_enemy] ,
				responses = [{replacement = this state = Bv_MaintainVisibility_Enemy_LostVisibility}]}
			{events = [viewdistance_enemy_far] ,
				responses = [{replacement = this state = Bv_MaintainVisibility_Enemy_LostDistance}]}
		]}
	registerstate {
		name = Bv_MaintainVisibility_Enemy_LostVisibility
		task = {name = Task_GenEvents params = {event_gen_id = viewdistance_enemy}}
		transitions = [{events = [lost_visibility_enemy] ,
				responses = [{replacement = vis state = Bv_GenEvents_Visibility_Enemy}
					{replacement = move state = Bv_MoveTo_Loop_Enemy}
					{replacement = look state = Bv_LookAt_Enemy}]}
			{events = [got_visibility_enemy] ,
				responses = [{replacement = this state = Bv_MaintainVisibility_Enemy}]}
			{events = [viewdistance_enemy_far] ,
				responses = [{replacement = this state = Bv_MaintainVisibility_Enemy_LostDistance}]}
		]}
	registerstate {
		name = Bv_MaintainVisibility_Enemy_LostDistance
		task = {name = Task_GenEvents params = {event_gen_id = viewdistance_enemy}}
		transitions = [{events = [lost_visibility_enemy] ,
				responses = [{replacement = move state = Bv_MoveTo_Loop_Enemy}
					{replacement = look state = Bv_LookAt_Enemy}]}
			{events = [viewdistance_enemy_near] ,
				responses = [{replacement = this state = Bv_MaintainVisibility_Enemy}]}
		]}
	registerstate {
		name = Bv_MaintainVisibility_Target
		task = {name = Task_GenEvents params = {event_gen_id = viewdistance_target}}
		transitions = [{events = [enter_behavior] ,
				responses = [{replacement = vis state = Bv_GenEvents_Visibility_Target}
					{replacement = look state = Bv_LookAt_Target}]}
			{events = [lost_visibility_target] ,
				responses = [{replacement = this state = Bv_MaintainVisibility_Target_LostVisibility}]}
			{events = [viewdistance_target_far] ,
				responses = [{replacement = this state = Bv_MaintainVisibility_Target_LostDistance}]}
		]}
	registerstate {
		name = Bv_MaintainVisibility_Target_LostVisibility
		task = {name = Task_GenEvents params = {event_gen_id = viewdistance_target}}
		transitions = [{events = [lost_visibility_target] ,
				responses = [{replacement = vis state = Bv_GenEvents_Visibility_Target}
					{replacement = move state = Bv_MoveTo_Loop_Target}
					{replacement = look state = Bv_LookAt_Target}]}
			{events = [got_visibility_target] ,
				responses = [{replacement = this state = Bv_MaintainVisibility_Target}]}
			{events = [viewdistance_target_far] ,
				responses = [{replacement = this state = Bv_MaintainVisibility_Target_LostDistance}]}
		]}
	registerstate {
		name = Bv_MaintainVisibility_Target_LostDistance
		task = {name = Task_GenEvents params = {event_gen_id = viewdistance_target}}
		transitions = [{events = [lost_visibility_target] ,
				responses = [{replacement = move state = Bv_MoveTo_Loop_Target}
					{replacement = look state = Bv_LookAt_Target}]}
			{events = [viewdistance_target_near] ,
				responses = [{replacement = this state = Bv_MaintainVisibility_Target}]}
		]}
endscript
