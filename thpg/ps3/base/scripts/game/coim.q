coim_priority_permanent = 0
coim_priority_permanentcleanup = 1
COIM_Priority_NonPermanent_Scene = 2
coim_priority_nonpermanent = 3
coim_priority_pedlife_actor = 4
coim_priority_pedlife = 5
coim_priority_pedlifedead = 10
coim_priority_effects = 20
generic_coim_size = 2039808
career_pedlife_coim_size = 0
noncareer_pedlife_coim_size = 0
career_pedlife_xbox_coim_size = 256819
noncareer_pedlife_xbox_coim_size = 856064
generic_coim_blockalign = 8192
generic_xbox_coim_blockalign = 4096
classicmode_reservedcoimblocksforpermobjects = 170
coim_max_offscreen_seconds = 0.5
coim_perm_max_offscreen_seconds = 0.5
coim_min_offscreen_dist = 16.0
coim_vehicle_min_offscreen_dist = 32.0
coim_min_scratch_blocks = 9
generic_coim_params = {
	coim_max_peds_remove_atonce = 2
	coim_kill_relevance = 0.0
	coim_max_distance = $human_coim_max_distance
	coim_kill_priority = $COIM_Priority_NonPermanent_Scene
	coim_permanent_cleanup_relevance = 0.5
	coim_type_id = generic
}
spawner_cleanup_relevance_amount = 0.4
spawner_cleanup_min_count = 2

script coim_preallocate 
	<blocks> = (<size> / $generic_coim_blockalign)
	if gamemodeequals \{is_classic}
		reservecoimblocksforpermobjects (<blocks> / 3)
	else
		reservecoimblocksforpermobjects \{$classicmode_reservedcoimblocksforpermobjects}
	endif
endscript
