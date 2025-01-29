vocals_current_pitch_midinote = 0

script vocalist_kill_spawnscripts 
	killspawnedscriptsbyname \{Name = band_lookat_on}
	killspawnedscriptsbyname \{Name = band_lookat_off}
	killspawnedscriptsbyname \{Name = band_lookat}
endscript

script vocalist_reset_globals 
	vocalist_kill_spawnscripts
	Change \{vocal_note = 0}
	enable_tempo
endscript
