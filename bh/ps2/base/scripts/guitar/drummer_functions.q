drumtest = 1

script drummer_kill_spawnscripts 
	KillSpawnedScript \{Name = drumdroid_timers}
	KillSpawnedScript \{Name = hide_non_drummers}
	KillSpawnedScript \{Name = hit_drumkit_piece}
	KillSpawnedScript \{Name = default_kit_anims}
	KillSpawnedScript \{Name = default_drummer_state}
	KillSpawnedScript \{Name = drummer_controlscript}
	KillSpawnedScript \{Name = drummer_transit_base_short}
	KillSpawnedScript \{Name = drummer_transit_base_long}
	KillSpawnedScript \{Name = drummer_transit_arm_r}
	KillSpawnedScript \{Name = drummer_transit_arm_l}
	KillSpawnedScript \{Name = drummer_transit_loops}
	KillSpawnedScript \{Name = drummer_transit_idles}
	KillSpawnedScript \{Name = drummer_current_tempo}
	KillSpawnedScript \{Name = set_drummer_active_values}
	KillSpawnedScript \{Name = hold_transit_requests}
	KillSpawnedScript \{Name = hold_transit_arms}
	KillSpawnedScript \{Name = hold_active_values}
	KillSpawnedScript \{Name = drummer_anticipation_arms}
	KillSpawnedScript \{Name = hold_drummer_anticipation_arms}
	KillSpawnedScript \{Name = hold_drumkit_piece}
	KillSpawnedScript \{Name = hold_body_trans}
	KillSpawnedScript \{Name = hold_body_loops}
	KillSpawnedScript \{Name = idle_check}
endscript

script drummer_reset_globals 
	Change \{use_db_branch_l = 1}
	Change \{use_db_branch_r = 1}
	Change \{use_db_base = 1}
	Change \{current_db_base = 1}
	Change \{drummer_idle = true}
	drummer_kill_spawnscripts
endscript
