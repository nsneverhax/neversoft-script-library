cas_num_finishes_pak = 3
cas_rawpaks = {
	cas_female_bodypak = {
		Name = 'cas_female_bodypak'
	}
	cas_male_bodypak = {
		Name = 'cas_male_bodypak'
	}
	cas_female_accpak = {
		Name = 'cas_female_accpak'
	}
	cas_male_accpak = {
		Name = 'cas_male_accpak'
	}
	cas_female_torsopak = {
		Name = 'cas_female_torsopak'
	}
	cas_male_torsopak = {
		Name = 'cas_male_torsopak'
	}
	cas_female_legspak = {
		Name = 'cas_female_legspak'
	}
	cas_male_legspak = {
		Name = 'cas_male_legspak'
	}
	cas_female_shoespak = {
		Name = 'cas_female_shoespak'
	}
	cas_male_shoespak = {
		Name = 'cas_male_shoespak'
	}
	cas_guitarpak = {
		Name = 'cas_guitarpak'
	}
	cas_guitarpak_finishes_0 = {
		Name = 'cas_guitarpak_finishes_0'
	}
	cas_guitarpak_finishes_1 = {
		Name = 'cas_guitarpak_finishes_1'
	}
	cas_guitarpak_finishes_2 = {
		Name = 'cas_guitarpak_finishes_2'
	}
	cas_guitarpak_nh = {
		Name = 'cas_guitarpak_nh'
	}
	cas_basspak = {
		Name = 'cas_basspak'
	}
	cas_basspak_finishes_0 = {
		Name = 'cas_basspak_finishes_0'
	}
	cas_basspak_finishes_1 = {
		Name = 'cas_basspak_finishes_1'
	}
	cas_basspak_finishes_2 = {
		Name = 'cas_basspak_finishes_2'
	}
	cas_basspak_nh = {
		Name = 'cas_basspak_nh'
	}
	cas_drumspak = {
		Name = 'cas_drumspak'
	}
	cas_vocalspak = {
		Name = 'cas_vocalspak'
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


endscript

script cas_rawpaks_pakman_deinit 


endscript

script cas_rawpak_setup 

endscript

script cas_rawpak_free 
	if existspakmanmap \{map = cas_rawpaks}
		BlockPendingPakManLoads \{map = cas_rawpaks
			block_scripts = 1}
		SetPakManCurrentBlock \{map = cas_rawpaks
			pak = None
			block_scripts = 1}
		DestroyPakManMap \{map = cas_rawpaks}
	endif
endscript

script cas_rawpak_is_loading 
	if existspakmanmap \{map = cas_rawpaks}
		if ispakmanloading \{map = cas_rawpaks}
			return \{true}
		else
			return \{FALSE}
		endif
	endif
endscript

script cas_rawpak_check_current 
	GetPakManCurrent \{map = cas_rawpaks}
	if (<pak> = <check>)
		return \{true}
	endif
	return \{FALSE}
endscript

script cas_rawpak_set 
	Change cas_queue_rawpak = <pak>
	Change cas_queue_rawpak_player = (($cas_current_player) - 1)
	SpawnScriptNow \{cas_queue_update}
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
	Change \{cas_queue_rawpak = None}
	BlockPendingPakManLoads \{map = cas_rawpaks
		block_scripts = 1}
	SetPakManCurrentBlock \{map = cas_rawpaks
		pak = None
		block_scripts = 1}
endscript
