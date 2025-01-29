drumtest = 1

script drummer_kill_spawnscripts 
	KillSpawnedScript \{Name = drumdroid_timers}
	KillSpawnedScript \{Name = hide_non_drummers}
	KillSpawnedScript \{Name = hit_drumkit_piece}
	KillSpawnedScript \{Name = default_kit_anims}
	KillSpawnedScript \{Name = default_drummer_state}
	KillSpawnedScript \{Name = drummer_controlscript}
	KillSpawnedScript \{Name = drummer_transit}
	KillSpawnedScript \{Name = drummer_transit_loops}
	KillSpawnedScript \{Name = drummer_transit_idles}
	KillSpawnedScript \{Name = create_trans_diff}
	KillSpawnedScript \{Name = drummer_current_tempo}
	KillSpawnedScript \{Name = set_drummer_active_values}
	KillSpawnedScript \{Name = drummer_offset_anims}
endscript

script drummer_reset_globals 
	drummer_kill_spawnscripts
endscript
