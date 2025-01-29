wii_sfx_current_mode = None
wii_sfx_current_crowd = None
wii_sfx_current_rhythm_effect = -1
wii_sfx_current_lead_effect = -1

script wii_unload_all_sfx 
	wii_unload_mode_sfx
	wii_unload_crowd_sfx
	unloaddrumkitall \{async = 0}
	unloadmelodykit
	wii_unload_rhythm_guitar_samples
	wii_unload_lead_guitar_samples
endscript

script wii_load_mode_sfx 
	RequireParams \{[
			mode
		]
		all}
	if (<mode> != $wii_sfx_current_mode)
		wii_unload_mode_sfx
		paks = ($wii_sfx_mode_paks.<mode>)
		GetArraySize <paks>
		i = 0
		begin
		pak = (<paks> [<i>])
		if (<mode> = studio)
			LoadPak <pak> Heap = quota_samples
		else
			LoadPak <pak> Heap = quota_sfx
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
		if (<mode> = song_roadiebattle)
			LoadPak \{'pak/sounds/modes/sfx_mode_roadiebattle.pak'
				Heap = quota_samples}
		endif
		Change wii_sfx_current_mode = <mode>
	endif
endscript

script wii_unload_mode_sfx 
	if ($wii_sfx_current_mode != None)
		paks = ($wii_sfx_mode_paks.$wii_sfx_current_mode)
		GetArraySize <paks>
		i = 0
		begin
		pak = (<paks> [<i>])
		UnLoadPak <pak> Heap = quota_sfx
		<i> = (<i> + 1)
		repeat <array_Size>
		if ($wii_sfx_current_mode = song_roadiebattle)
			UnLoadPak \{'pak/sounds/modes/sfx_mode_roadiebattle.pak'
				Heap = quota_samples}
		endif
		Change \{wii_sfx_current_mode = None}
	endif
endscript

script wii_get_crowd_pak 
	RequireParams \{[
			crowd_type
		]
		all}
	formatText TextName = pak 'pak/sounds/crowd/sfx_crowd_%a.pak' a = <crowd_type>
	return pak = <pak>
endscript

script wii_load_crowd_sfx 
	GetPakManCurrentName \{map = zones}
	formatText checksumName = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		venuesize = 'nothing'
	endif
	if (<venuesize> != $wii_sfx_current_crowd)
		wii_unload_crowd_sfx
		wii_get_crowd_pak crowd_type = <venuesize>
		if NOT (<venuesize> = 'nothing')
			LoadPak <pak> Heap = quota_sfx
		endif
		Change wii_sfx_current_crowd = <venuesize>
	endif
endscript

script wii_unload_crowd_sfx 
	if ($wii_sfx_current_crowd != None)
		wii_get_crowd_pak \{crowd_type = $wii_sfx_current_crowd}
		UnLoadPak <pak> Heap = quota_sfx
		Change \{wii_sfx_current_crowd = None}
	endif
endscript

script wii_get_jam_pak 
	RequireParams \{[
			instrument_name
			effect_name
		]
		all}
	formatText TextName = pak 'pak/sounds/jam_mode/%a_%b.pak' a = <instrument_name> b = <effect_name>
	return pak = <pak>
endscript

script wii_load_rhythm_guitar_samples 
	RequireParams \{[
			effect_index
		]
		all}
	if (<effect_index> != $wii_sfx_current_rhythm_effect)
		wii_unload_rhythm_guitar_samples
		Change rhythm_jam_set = ($jam_rhythm_effects [<effect_index>].ps2_prefix)
		wii_get_jam_pak \{instrument_name = 'guitar_rhythm'
			effect_name = $rhythm_jam_set}
		LoadPak <pak> Heap = quota_samples
		Change wii_sfx_current_rhythm_effect = <effect_index>
	endif
endscript

script wii_unload_rhythm_guitar_samples 
	if ($wii_sfx_current_rhythm_effect != -1)
		wii_get_jam_pak \{instrument_name = 'guitar_rhythm'
			effect_name = $rhythm_jam_set}
		UnLoadPak <pak> Heap = quota_samples
		Change \{wii_sfx_current_rhythm_effect = -1}
	endif
endscript

script wii_load_lead_guitar_samples 
	RequireParams \{[
			effect_index
		]
		all}
	if (<effect_index> != $wii_sfx_current_lead_effect)
		wii_unload_lead_guitar_samples
		Change lead_jam_set = ($jam_lead_effects [<effect_index>].ps2_prefix)
		wii_get_jam_pak \{instrument_name = 'guitar_lead'
			effect_name = $lead_jam_set}
		LoadPak <pak> Heap = quota_samples
		Change wii_sfx_current_lead_effect = <effect_index>
	endif
endscript

script wii_unload_lead_guitar_samples 
	if ($wii_sfx_current_lead_effect != -1)
		wii_get_jam_pak \{instrument_name = 'guitar_lead'
			effect_name = $lead_jam_set}
		UnLoadPak <pak> Heap = quota_samples
		Change \{wii_sfx_current_lead_effect = -1}
	endif
endscript
