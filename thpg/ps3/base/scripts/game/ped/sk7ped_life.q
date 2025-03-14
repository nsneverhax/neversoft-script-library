global_capped_max_objects = 15
life_capped_max_objects = 10
Life_Current_Max_Objects = 5
global_max_ai_budget = 10.0
max_scene_budget = 6.0
max_expected_agents = 30.0
ai_overbudget_kill_relevance_mod = 0.3
ai_budget_costs = {
	ped = 1.0
	dummy = 0.6
	vehicle = 0.75
}
block_pedspawn = 0
block_vehiclespawn = 0
block_scenespawn = 0
ped_fade_time = 0.75
vehicle_coim_max_distance = 70.0
human_coim_max_distance = 40.0
default_spawn_params = {
	min_relevance = 0.3
	ignore_validity = false
	distance_weight = 0.3
	min_distance = 27.0
	optimal_distance = 27.0
	distance_boolean = true
	max_distance = 35.0
	max_height_weight = 1.0
	max_height_above_player = 2.0
	projected_dist_weight = 0.4
	max_dist_from_projected_pos = 20.0
	projected_time = 1.0
	vision_weight = 0.3
	vision_type = occluded
	random_weight = 0.2
	cooldown_weight = 1.0
	cooldown_boolean = true
	cooldown_time = 6.0
	expected_velocity_weight = 0.0
	expected_speed = 0.0
}
vehicle_spawn_params = {
	min_relevance = 0.3
	ignore_validity = false
	distance_weight = 0.15
	min_distance = 50.0
	optimal_distance = 54.0
	distance_boolean = true
	max_distance = 64.0
	max_height_weight = 1.0
	max_height_above_player = 4.0
	projected_dist_weight = 0.15
	max_dist_from_projected_pos = 30.0
	projected_time = 2.0
	vision_weight = 0.35000002
	vision_type = occluded
	random_weight = 0.15
	cooldown_weight = 1.0
	cooldown_boolean = true
	cooldown_time = 6.0
	expected_velocity_weight = 0.7
	expected_speed = 5.0
}
always_spawn_params = {
	ignore_validity = true
	check_all_nodes = false
	min_relevance = 0.1
	distance_weight = 0.3
	distance_boolean = false
	max_height_weight = 0.0
	max_height_above_player = 4.0
	min_distance = 0
	max_distance = 26.0
	optimal_distance = 10.0
	vision_weight = 0
	check_occlusion = true
	random_weight = 0.0
	cooldown_weight = 0.5
	cooldown_boolean = false
	cooldown_time = 6
	projected_dist_weight = 0
	max_dist_from_projected_pos = 30.0
	projected_time = 2.0
	expected_velocity_weight = 0.0
	expected_speed = 0.0
}
crib_spawn_params = {
	ignore_validity = true
	check_all_nodes = false
	min_relevance = 0.1
	distance_weight = 0.3
	distance_boolean = false
	min_distance = 0
	max_distance = 30.0
	optimal_distance = 10.0
	max_height_weight = 0.0
	max_height_above_player = 4.0
	vision_weight = 0
	check_occlusion = true
	random_weight = 0.0
	cooldown_weight = 1
	cooldown_boolean = true
	cooldown_time = 0
	projected_dist_weight = 0
	max_dist_from_projected_pos = 30.0
	projected_time = 2.0
	expected_velocity_weight = 0.0
	expected_speed = 0.0
}
refresh_spawn_params = {
	ignore_validity = true
	check_all_nodes = false
	min_relevance = 0.5
	distance_weight = 0.3
	distance_boolean = false
	min_distance = 0
	max_distance = 34.0
	optimal_distance = 10.0
	max_height_weight = 0.0
	max_height_above_player = 6.0
	vision_weight = 0
	check_occlusion = true
	random_weight = 0.3
	cooldown_weight = 0.9
	cooldown_boolean = true
	cooldown_time = 6
	projected_dist_weight = 0
	max_dist_from_projected_pos = 30.0
	projected_time = 2.0
	expected_velocity_weight = 0.0
	expected_speed = 0.0
}
ambient_ped_names = [
	Ped01
	Ped02
	Ped03
	Ped04
	Ped05
	Ped06
	Ped07
	Ped08
	Ped09
	Ped10
	Ped11
	Ped12
	Ped13
	Ped14
	Ped15
	Ped16
	Ped17
	Ped18
	Ped19
	Ped20
	Ped21
	Ped22
	Ped23
	Ped24
	Ped25
	Ped26
	Ped27
	Ped28
	Ped29
	Ped30
	Ped31
	Ped32
	Ped33
	Ped34
	Ped35
	Ped36
	Ped37
	Ped38
	Ped39
	Ped40
]
crib_career_lifestyle_params = {
	type = career
	profiles = [
		$RPed_Businessmen01
	]
}
crib_hardcore_lifestyle_params = {
	type = hardcore
	profiles = [
		$RPed_SecurityGuard01
	]
}
crib_rigger_lifestyle_params = {
	type = rigger
	profiles = [
		$RPed_Skater_Teens_M
	]
}
crib_generic_lifestyle_params = {
	type = generic
	profiles = [
		$RPed_Businesswomen01
	]
}
ambient_object_types = {
	`default` = {
		spawn_params = default_spawn_params
		profiles = civilians_pedlife_profiles
	}
	businessmen = {
		spawn_params = default_spawn_params
		profiles = Businessmen_pedlife_profiles
	}
	bums = {
		spawn_params = default_spawn_params
		profiles = Bum_pedlife_profiles
	}
	cops = {
		spawn_params = default_spawn_params
		profiles = civilians_pedlife_profiles
	}
	tourists = {
		spawn_params = default_spawn_params
		profiles = Tourist_pedlife_profiles
	}
	vehicles = {
		spawn_params = vehicle_spawn_params
		profiles = global_vehicle_profiles
	}
	skater = {
		spawn_params = default_spawn_params
		profiles = SkaterKids_pedlife_profiles
	}
	gang = {
		spawn_params = default_spawn_params
		profiles = civilians_pedlife_profiles
	}
	groupie = {
		spawn_params = default_spawn_params
		profiles = civilians_pedlife_profiles
	}
	workers = {
		spawn_params = default_spawn_params
		profiles = ConstructionWorker_pedlife_profiles
	}
	landsdowne_local = {
		spawn_params = default_spawn_params
		profiles = LansLocals_pedlife_profiles
	}
	fbi = {
		spawn_params = default_spawn_params
		profiles = Businessmen_pedlife_profiles
	}
	civilian = {
		spawn_params = default_spawn_params
		profiles = civilians_pedlife_profiles
	}
}
zone_population_raining = {
	`default` = {
		vehicles = 0.7
	}
	z_fdr = {
		skater = 0.5
		gang = 0.2
		groupie = 0.1
		bums = 0.2
	}
	z_lansdowne = {
		skater = 0.3
		landsdowne_local = 0.3
		bums = 0.2
		groupie = 0.0
		vehicles = 0.0
	}
	z_monuments = {
		vehicles = 0.5
		tourists = 0.0
		skater = 0.3
		civilian = 0.2
	}
	z_museums = {
		tourists = 0.2
		businessmen = 0.2
		civilian = 0.4
		skater = 0.2
	}
	z_slums = {
		bums = 0.2
		civilian = 0.3
		skater = 0.2
		vehicles = 0.1
	}
	z_wp_bridge = {
		tourists = 0.2
		businessmen = 0.2
		civilian = 0.2
		bums = 0.2
		workers = 0.2
	}
	z_museum_int = {
		tourists = 0.5
		businessmen = 0.2
		civilian = 0.3
	}
}
zone_population = {
	`default` = {
	}
	z_bcity = {
		businessmen = 0.2
		civilian = 0.4
		vehicles = 0.2
		bums = 0.0
		skater = 0.2
	}
	z_bell = {
		vehicles = 0.1
		civilian = 0.4
		businessmen = 0.1
		tourists = 0.1
		workers = 0.1
		skater = 0.2
	}
	z_bw_bridge = {
		vehicles = 0.4
		bums = 0.2
		workers = 0.3
		civilian = 0.1
	}
	z_fdr = {
		skater = 0.6
		gang = 0.1
		groupie = 0.2
		bums = 0.1
	}
	z_harbor = {
		vehicles = 0.1
		civilian = 0.4
		tourists = 0.1
		businessmen = 0.1
		landsdowne_local = 0.1
		skater = 0.2
	}
	z_lansdowne = {
		skater = 0.4
		landsdowne_local = 0.3
		bums = 0.0
		groupie = 0.1
	}
	z_love = {
		skater = 0.2
		businessmen = 0.1
		tourists = 0.1
		vehicles = 0.2
		civilian = 0.4
	}
	z_monuments = {
		vehicles = 0.1
		tourists = 0.25
		skater = 0.25
		civilian = 0.4
	}
	z_museums = {
		tourists = 0.25
		businessmen = 0.25
		civilian = 0.3
		skater = 0.2
	}
	z_pb_bridge = {
		vehicles = 0.3
		bums = 0.0
		workers = 0.0
		civilian = 0.4
		businessmen = 0.3
	}
	z_slums = {
		bums = 0.2
		civilian = 0.3
		skater = 0.2
		vehicles = 0.1
	}
	z_wp_bridge = {
		tourists = 0.3
		businessmen = 0.2
		civilian = 0.4
		bums = 0.1
		workers = 0.0
	}
	z_museum_int = {
		tourists = 0.5
		businessmen = 0.2
		civilian = 0.3
	}
}
default_ped_profile_list = [
]

script LoadZonePedProfiles \{ped_profile_list = default_ped_profile_list}
	SetZoneProfiles <ped_profile_list>
endscript

script spawn_nearby_ped 
	ped = {
		ped_type = ped_life
		priority = 2
		nearby
		profile = <profile>
	}
	SpawnPed <ped>
endscript

script skate_block_pedlife 
	change \{block_pedspawn = 1}
	KillAllPedLifeObjects
endscript

script skate_unblock_pedlife 
	change \{block_pedspawn = 0}
endscript

script PedlifeSpawner populate = false
	begin
	if compositeobjectexists skater
		break
	endif
	printf "PedlifeSpawner - No Skater yet"
	wait 1 seconds
	repeat
	if (inmultiplayergame)
		return
	endif
	if (<populate> = true)
		if (<level> = 'Z_Crib')
			PedLife_CribRefresh
			return
		else
			Pedlife_Refresh
		endif
	endif
	begin
	if NOT ($disable_pedlife = 1)
		GetAvailablePedBudget
		if (($block_pedspawn = 0) && ($cutscene_is_playing = 0) && (ShouldSpawnPed priority = $coim_priority_pedlife) && (<budget> > 0.0))
			new_ped = {
				priority = $coim_priority_pedlife
				ped_type = ped_life
			}
			if SpawnAmbientObject <new_ped>
			else
			endif
			wait 1 gameframe
		else
			wait 1 gameframe
		endif
	else
		wait 2 seconds
	endif
	repeat
endscript

script Pedlife_Refresh 
	if NOT compositeobjectexists skater
		soft_assert "Trying to call Pedlife_Refresh before skater exists"
	endif
	killspawnedscript name = AmbientScenes_ManagePak
	spawnscriptlater AmbientScenes_ManagePak
	if (inmultiplayergame)
		return
	endif
	if ($disable_pedlife = 1)
		return
	endif
	if ($block_pedspawn = 1)
		return
	endif
	KillAllPedLifeObjects
	wait 1 gameframe
	if ($Life_Current_Max_Objects = 0)
		return
	endif
	begin
	if (ShouldSpawnPed priority = $coim_priority_pedlife)
		new_ped = {
			priority = $coim_priority_pedlife
			ped_type = ped_life
			spawn_params = $refresh_spawn_params
		}
		if SpawnAmbientObject <new_ped>
			GetNumPedLifeObjects
		else
		endif
	else
	endif
	repeat $Life_Current_Max_Objects
endscript

script PedLife_CribRefresh 
	if NOT compositeobjectexists skater
		soft_assert "Trying to call Pedlife_CribRefresh before skater exists"
	endif
	if (inmultiplayergame)
		return
	endif
	if ($disable_pedlife = 1)
		return
	endif
	if ($block_pedspawn = 1)
		return
	endif
	KillAllPedLifeObjects
	wait 1 gameframe
	game_progress_get_lifestyle_ped_attract
	<total_peds> = 0
	<num_generic_peds> = (<total_peds> * <generic_weight>)
	casttointeger num_generic_peds
	<num_career_peds> = (<total_peds> * <career_weight>)
	casttointeger num_career_peds
	<num_hardcore_peds> = (<total_peds> * <hardcore_weight>)
	casttointeger num_hardcore_peds
	<num_rigger_peds> = (<total_peds> * <rigger_weight>)
	casttointeger num_rigger_peds
	<ped_lifestyles> = [
		{$crib_career_lifestyle_params
			count = <num_career_peds>
		}
		{$crib_hardcore_lifestyle_params
			count = <num_hardcore_peds>
		}
		{$crib_rigger_lifestyle_params
			count = <num_rigger_peds>
		}
		{$crib_generic_lifestyle_params
			count = <num_generic_peds>
		}
	]
	getarraysize <ped_lifestyles>
	<num_ped_lifestyles> = <array_size>
	<lifestyle_idx> = 0
	begin
	<ped_lifestyle> = (<ped_lifestyles> [<lifestyle_idx>])
	<num_peds> = (<ped_lifestyle>.count)
	printf "Creating %n peds for lifestyle %l:" n = <num_peds> l = (<ped_lifestyle>.type)
	if (<num_peds> > 0)
		begin
		if (ShouldSpawnPed priority = $coim_priority_permanent)
			getarraysize (<ped_lifestyle>.profiles)
			getrandomvalue name = random_profile_idx a = 0 b = (<array_size> - 1) integer
			<element> = (<ped_lifestyle>.profiles [<random_profile_idx>])
			new_ped = {
				priority = $coim_priority_permanent
				ped_type = ped_life
				spawn_params = $crib_spawn_params
				profile = <element>
				object_type = any
			}
			if SpawnAmbientObject <new_ped>
				GetNumPedLifeObjects
			else
			endif
		else
		endif
		repeat <num_peds>
	endif
	<lifestyle_idx> = (<lifestyle_idx> + 1)
	repeat <num_ped_lifestyles>
endscript

script create_cutscene_ped 
	printf \{"Create_Cutscene_Ped"}
	printstruct <...>
	SpawnAmbientObject {
		priority = $coim_priority_permanent
		ped_type = mission
		spawn_node_name = <node>
		name = <node>
	}
endscript

script create_cutscene_peds 
	getarraysize <nodes>
	<index> = 0
	begin
	create_cutscene_ped node = (<nodes> [<index>])
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script destroy_cutscene_peds 
	getarraysize <nodes>
	<index> = 0
	begin
	(<nodes> [<index>]) :die
	<index> = (<index> + 1)
	repeat <array_size>
endscript
