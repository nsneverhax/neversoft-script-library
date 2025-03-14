cas_num_finishes_pak = 3
cas_rawpaks = {
}
dont_use_cas_archive_pak = 0
cas_archive_paks = [
]

script cas_rawpaks_pakman_init 
	printf \{'cas_rawpaks_PakMan_Init'}
	printstruct <...>
endscript

script cas_rawpaks_pakman_deinit 
	printf \{'cas_rawpaks_PakMan_DeInit'}
	printstruct <...>
endscript

script cas_rawpak_setup 
	if NOT existspakmanmap \{map = cas_rawpaks}
		mempushcontext \{heap_cas}
		createpakmanmap \{map = cas_rawpaks
			links = cas_rawpaks
			folder = 'pak/cas/'
			is_raw}
		mempopcontext
	endif
endscript

script cas_rawpak_free 
	if existspakmanmap \{map = cas_rawpaks}
		blockpendingpakmanloads \{map = cas_rawpaks
			block_scripts = 1}
		setpakmancurrentblock \{map = cas_rawpaks
			pak = none
			block_scripts = 1}
		destroypakmanmap \{map = cas_rawpaks}
	endif
endscript

script cas_rawpak_is_loading 
	if existspakmanmap \{map = cas_rawpaks}
		if ispakmanloading \{map = cas_rawpaks}
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script cas_rawpak_check_current 
	getpakmancurrent \{map = cas_rawpaks}
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
		wait \{1
			gameframe}
		repeat
	endif
endscript

script cas_rawpak_clear 
	change \{cas_queue_rawpak = none}
	blockpendingpakmanloads \{map = cas_rawpaks
		block_scripts = 1}
	setpakmancurrentblock \{map = cas_rawpaks
		pak = none
		block_scripts = 1}
endscript
