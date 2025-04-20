use_cap_pieces_info = [
	{
		name = "No"
		checksum = no_pieces
	}
	{
		name = "Yes"
		checksum = allow_pieces
	}
]

script net_get_cap_pieces 
	printf "--- net_get_cap_pieces"
	array = []
	settings = {}
	if (<level> = load_z_crib)
		if CAP_LoadRiggerSetup rigger_crib
			printf "load rigger crib success"
			printstruct <...>
			array = (<setup>.pieces)
			settings = (<setup>.crib_settings)
		else
			crib_set_default_settings
			array = ($crib_default_pieces)
			crib_get_default_settings
			settings = <settings>
		endif
	else
		if CAP_LoadRiggerSetup rigger_career
			printf "load rigger career success"
			printstruct <...>
			array = (<setup>.pieces)
		endif
	endif
endscript
net_saved_crib = [
]

script net_restore_cap_pieces 
	printf \{"--- net_restore_cap_pieces"}
	printstruct <...>
	cap_restore_pieces_from_array array = <array>
endscript
net_client_recieved_cap_data = 0

script net_load_cap_pieces 
	printf "--- net_load_cap_pieces"
	getcurrentlevel
	if (<level> = load_z_crib)
		crib_change_to_saved_crib block_scripts = 1
	endif
	i = 0
	begin
	if ($net_client_recieved_cap_data = 1)
		break
	endif
	if (<i> = 60)
		printf "waiting..."
		<i> = 0
	else
		<i> = (<i> + 1)
	endif
	wait 1 gameframe
	repeat
	GetTempNetCribStruct
	cap_restore_pieces_from_array array = <array>
	printstruct <...>
	if structurecontains structure = <settings> zone
		crib_set_theme theme = (<settings>.zone) block_scripts = 1
	endif
	if structurecontains structure = <settings> video
		change crib_current_video = (<settings>.video)
	endif
	if structurecontains structure = <settings> music
		change crib_current_music = (<settings>.music)
	endif
endscript

script net_mark_cap_data_needed 
	printf \{"--- net_mark_cap_data_needed"}
	change \{net_client_recieved_cap_data = 0}
endscript

script net_mark_cap_data_recieved 
	printf \{"---net_mark_cap_data_recieved"}
	change \{net_client_recieved_cap_data = 1}
endscript

script restore_saved_pieces 
	printf \{"--- restore_saved_pieces"}
	GetTempNetCribStruct
	cap_restore_pieces_from_array array = <array>
endscript

script net_should_skip_piece 
	if NOT gotparam \{piece}
		return
	endif
	if checksumequals a = special b = (<piece>.piece_type)
		if (<piece>.piece_index = 0)
			skip = 1
		endif
	endif
	return skip = <skip>
endscript
