cas_num_finishes_pak = 3
cas_rawpaks = {
}
dont_use_cas_archive_pak = 0
cas_archive_paks = [
]

script cas_rawpaks_PakMan_Init 
	printf \{'cas_rawpaks_PakMan_Init'}
	printstruct <...>
endscript

script cas_rawpaks_PakMan_DeInit 
	printf \{'cas_rawpaks_PakMan_DeInit'}
	printstruct <...>
endscript

script cas_rawpak_setup 
	if NOT ExistsPakManMap \{map = cas_rawpaks}
		MemPushContext \{heap_cas}
		CreatePakManMap \{map = cas_rawpaks
			links = cas_rawpaks
			folder = 'pak/cas/'
			is_raw}
		MemPopContext
	endif
endscript

script cas_rawpak_free 
	if ExistsPakManMap \{map = cas_rawpaks}
		BlockPendingPakManLoads \{map = cas_rawpaks
			block_scripts = 1}
		SetPakManCurrentBlock \{map = cas_rawpaks
			pak = none
			block_scripts = 1}
		DestroyPakManMap \{map = cas_rawpaks}
	endif
endscript

script cas_rawpak_is_loading 
	if ExistsPakManMap \{map = cas_rawpaks}
		if IsPakManLoading \{map = cas_rawpaks}
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script cas_rawpak_check_current 
	GetPakManCurrent \{map = cas_rawpaks}
	if (<pak> = <check>)
		return \{true}
	endif
	return \{false}
endscript

script cas_rawpak_set 
	change cas_queue_rawpak = <pak>
	change cas_queue_rawpak_player = (($cas_current_player) - 1)
	spawnscriptnow \{cas_queue_update}
endscript

script cas_rawpak_wait_for_load 
	if cas_rawpak_is_loading
		begin
		if NOT cas_rawpak_is_loading
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
endscript

script cas_rawpak_clear 
	change \{cas_queue_rawpak = none}
	BlockPendingPakManLoads \{map = cas_rawpaks
		block_scripts = 1}
	SetPakManCurrentBlock \{map = cas_rawpaks
		pak = none
		block_scripts = 1}
endscript
