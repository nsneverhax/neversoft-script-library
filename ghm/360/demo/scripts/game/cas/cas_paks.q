cas_num_finishes_pak = 3
cas_rawpaks = {
	cas_female_bodypak = {
		name = 'cas_female_bodypak'
	}
	cas_male_bodypak = {
		name = 'cas_male_bodypak'
	}
	cas_female_accpak = {
		name = 'cas_female_accpak'
	}
	cas_male_accpak = {
		name = 'cas_male_accpak'
	}
	cas_female_torsopak = {
		name = 'cas_female_torsopak'
	}
	cas_male_torsopak = {
		name = 'cas_male_torsopak'
	}
	cas_female_legspak = {
		name = 'cas_female_legspak'
	}
	cas_male_legspak = {
		name = 'cas_male_legspak'
	}
	cas_female_shoespak = {
		name = 'cas_female_shoespak'
	}
	cas_male_shoespak = {
		name = 'cas_male_shoespak'
	}
	cas_guitarpak = {
		name = 'cas_guitarpak'
	}
	cas_guitarpak_finishes_0 = {
		name = 'cas_guitarpak_finishes_0'
	}
	cas_guitarpak_finishes_1 = {
		name = 'cas_guitarpak_finishes_1'
	}
	cas_guitarpak_finishes_2 = {
		name = 'cas_guitarpak_finishes_2'
	}
	cas_guitarpak_nh = {
		name = 'cas_guitarpak_nh'
	}
	cas_basspak = {
		name = 'cas_basspak'
	}
	cas_basspak_finishes_0 = {
		name = 'cas_basspak_finishes_0'
	}
	cas_basspak_finishes_1 = {
		name = 'cas_basspak_finishes_1'
	}
	cas_basspak_finishes_2 = {
		name = 'cas_basspak_finishes_2'
	}
	cas_basspak_nh = {
		name = 'cas_basspak_nh'
	}
	cas_drumspak = {
		name = 'cas_drumspak'
	}
	cas_vocalspak = {
		name = 'cas_vocalspak'
	}
}
dont_use_cas_archive_pak = 0
cas_archive_paks = [
	'cas_female_bodypak'
	'cas_male_bodypak'
	'cas_female_accpak'
	'cas_male_accpak'
	'cas_female_torsopak'
	'cas_male_torsopak'
	'cas_female_legspak'
	'cas_male_legspak'
	'cas_female_shoespak'
	'cas_male_shoespak'
	'cas_guitarpak'
	'cas_guitarpak_finishes_0'
	'cas_guitarpak_finishes_1'
	'cas_guitarpak_finishes_2'
	'cas_guitarpak_nh'
	'cas_basspak'
	'cas_basspak_finishes_0'
	'cas_basspak_finishes_1'
	'cas_basspak_finishes_2'
	'cas_basspak_nh'
	'cas_drumspak'
	'cas_vocalspak'
	'cas_preset_texswaps'
	'cas_full_parts'
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
