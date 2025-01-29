wii_sfx_current_mode = None
wii_sfx_current_crowd = None
wii_sfx_current_rhythm_effect = -1
wii_sfx_current_lead_effect = -1

script wii_unload_all_sfx 
	wii_unload_mode_sfx
	wii_unload_crowd_sfx
	unloaddrumkitall \{async = 0}
endscript

script wii_load_mode_sfx \{mode = !q1768515945}
	if (<mode> != $wii_sfx_current_mode)
		wii_unload_mode_sfx
		<paks> = ($wii_sfx_mode_paks.<mode>)
		GetArraySize <paks>
		<i> = 0
		begin
		<pak> = (<paks> [<i>].pak)
		<Heap> = (<paks> [<i>].Heap)
		LoadPak <pak> Heap = <Heap>
		<i> = (<i> + 1)
		repeat <array_Size>
		Change wii_sfx_current_mode = <mode>
	endif
endscript

script wii_unload_mode_sfx 
	if ($wii_sfx_current_mode != None)
		<paks> = ($wii_sfx_mode_paks.$wii_sfx_current_mode)
		GetArraySize <paks>
		<i> = 0
		begin
		<pak> = (<paks> [<i>].pak)
		unload_pak_and_wait pak = <pak>
		<i> = (<i> + 1)
		repeat <array_Size>
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
	playlist_getcurrentsong
	if (<current_song> = jamsession)
		return
	endif
	GetPakManCurrentName \{map = zones}
	formatText checksumName = scriptgetvenuesize '%s_sfx_Get_Venue_Size' s = <pakname> AddToStringLookup = true
	if ScriptExists <scriptgetvenuesize>
		<scriptgetvenuesize>
	else
		<venuesize> = 'nothing'
	endif
	if (<venuesize> != $wii_sfx_current_crowd)
		wii_unload_crowd_sfx
		wii_get_crowd_pak crowd_type = <venuesize>
		if NOT (<venuesize> = 'nothing')
			LoadPak <pak> Heap = quota_crowd_sfx
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
