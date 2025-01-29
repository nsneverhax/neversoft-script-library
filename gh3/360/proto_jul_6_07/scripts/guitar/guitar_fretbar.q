thin_fretbar_timesigs = {
	t2d4 = $thin_fretbar_8note_params
	t3d4 = $thin_fretbar_8note_params
	t4d4 = $thin_fretbar_8note_params
	t5d4 = $thin_fretbar_8note_params
	t6d4 = $thin_fretbar_8note_params
	t3d8 = $thin_fretbar_16note_params
	t6d8 = $thin_fretbar_16note_params
	t12d8 = $thin_fretbar_16note_params
}
thin_fretbar_8note_params = {
	low_bpm = 1
	high_bpm = 180
}
thin_fretbar_16note_params = {
	low_bpm = 1
	high_bpm = 120
}
fretbar_prefix_type = {
	thin = 'thin'
	medium = 'medium'
	thick = 'thick'
}

script create_fretbar \{scale = (40.0, 0.25)}
	create2dfretbar <...>
endscript

script fretbar_iterator 
	printf "Fretbar Iterator started with time %d" d = <time_offset>
	get_song_prefix song = <song_name>
	formattext checksumname = timesig '%s_timesig' s = <song_prefix> addtostringlookup
	getarraysize $<timesig>
	timesig_entry = 0
	timesig_size = <array_size>
	timesig_num = 0
	measure_count = 0
	song = ($<player_status>.current_song_fretbar_array)
	array_entry = 0
	fretbar_count = 0
	getarraysize $<song>
	formattext checksumname = song_expert '%s_song_expert' s = <song_prefix> addtostringlookup
	get_song_end_time song = <song_expert>
	begin
	<entry> = (<array_size> -2)
	<fret_time> = ($<song> [<entry>])
	if (<total_end_time> > <fret_time>)
		break
	endif
	<array_size> = (<array_size> - 1)
	repeat
	getsongtimems time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if (<timesig_entry> < <timesig_size>)
			if ($<timesig> [<timesig_entry>] [0] <= $<song> [<array_entry>])
				<timesig_num> = ($<timesig> [<timesig_entry>] [1])
				<timesig_den> = ($<timesig> [<timesig_entry>] [2])
				fretbar_count = 0
				timesig_entry = (<timesig_entry> + 1)
			endif
		endif
		if ((<time> - <skipleadin>) < $<song> [<array_entry>])
			break
		endif
		array_entry = (<array_entry> + 1)
		fretbar_count = (<fretbar_count> + 1)
		if (<fretbar_count> = <timesig_num>)
			measure_count = (<measure_count> + 1)
			fretbar_count = 0
		endif
		repeat <array_size>
		final_array_entry = (<array_size> - 1)
		array_size = (<array_size> - <array_entry>)
		begin
		begin
		if (<time> >= $<song> [<array_entry>])
			if (<timesig_entry> < <timesig_size>)
				if ($<timesig> [<timesig_entry>] [0] <= $<song> [<array_entry>])
					<timesig_num> = ($<timesig> [<timesig_entry>] [1])
					<timesig_den> = ($<timesig> [<timesig_entry>] [2])
					fretbar_count = 0
					timesig_entry = (<timesig_entry> + 1)
				endif
			endif
			if (<array_entry> < <final_array_entry>)
				change structurename = <player_status> current_song_beat_time = ($<song> [(<array_entry> + 1)] - $<song> [<array_entry>])
				change structurename = <player_status> current_song_measure_time = (<timesig_num> * $<player_status>.current_song_beat_time)
			endif
			break
		endif
		wait 1 gameframe
		getsongtimems time_offset = <time_offset>
		repeat
		marker = ($<song> [<array_entry>])
		if (<fretbar_count> = 0)
			fretbar_scale = thick
			scale = (40.0, 1.0)
		else
			fretbar_scale = medium
			scale = (40.0, 0.25)
		endif
		spawnscriptnow <fretbar_function> params = {time = <time> marker = <marker>
			scale = <scale> fretbar_scale = <fretbar_scale>
			player = <player> player_status = <player_status> player_text = <player_text>
			array_entry = <array_entry> measure = <measure_count>}
		if gotparam thin_fretbars
			formattext checksumname = 0x5974e563 't%td%i' t = <timesig_num> i = <timesig_den>
			if structurecontains structure = $thin_fretbar_timesigs <0x5974e563>
				addparams ($thin_fretbar_timesigs.<0x5974e563>)
				0x61af4ac5 = ($<player_status>.current_song_beat_time / 1000.0)
				current_bpm = (60.0 / <0x61af4ac5>)
				if (<low_bpm> < <current_bpm> &&
						<high_bpm> > <current_bpm> &&
						<array_entry> < <final_array_entry>)
					<marker> = (($<song> [<array_entry>] + $<song> [(<array_entry> + 1)]) / 2)
					begin
					if (<time> >= <marker>)
						fretbar_scale = thin
						scale = (40.0, 5.0)
						spawnscriptnow <fretbar_function> params = {time = <time> marker = <marker>
							scale = <scale> fretbar_scale = <fretbar_scale>
							player = <player> player_status = <player_status> player_text = <player_text>
							array_entry = <array_entry> measure = <measure_count>}
						break
					endif
					wait 1 gameframe
					getsongtimems time_offset = <time_offset>
					repeat
				endif
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		fretbar_count = (<fretbar_count> + 1)
		if (<fretbar_count> = <timesig_num>)
			measure_count = (<measure_count> + 1)
			fretbar_count = 0
		endif
		repeat <array_size>
	endif
endscript

script kill_fretbar2d 
	if screenelementexists id = <fretbar_id>
		destroygem name = <fretbar_id>
	endif
endscript

script fretbar_events 
	seteventhandler response = switch_script event = kill_objects scr = kill_fretbar2d params = {<...>} group = gem_group
endscript

script fretbar_update_tempo 
	get_song_prefix song = <song_name>
	formattext checksumname = timesig '%s_timesig' s = <song_prefix> addtostringlookup
	getarraysize $<timesig>
	timesig_entry = 0
	timesig_size = <array_size>
	timesig_num = 0
	measure_count = 0
	0x2e85635d = ($<player_status>.current_song_fretbar_array)
	fretbar_entry = 0
	getarraysize $<0x2e85635d>
	fretbar_array_size = <array_size>
	begin
	getsongtimems time_offset = <time_offset>
	begin
	if (<timesig_entry> < <timesig_size>)
		if ($<timesig> [<timesig_entry>] [0] <= $<0x2e85635d> [<fretbar_entry>])
			<timesig_num> = ($<timesig> [<timesig_entry>] [1])
			<timesig_den> = ($<timesig> [<timesig_entry>] [2])
			timesig_entry = (<timesig_entry> + 1)
		else
			break
		endif
	else
		break
	endif
	repeat
	if ((<fretbar_entry> + 1) < <fretbar_array_size>)
		if (<time> >= $<0x2e85635d> [<fretbar_entry>])
			change structurename = <player_status> playline_song_beat_time = ($<0x2e85635d> [(<fretbar_entry> + 1)] - $<0x2e85635d> [<fretbar_entry>])
			change structurename = <player_status> playline_song_measure_time = ($<player_status>.playline_song_beat_time * <timesig_num>)
			<fretbar_entry> = (<fretbar_entry> + 1)
		else
			wait 1 gameframe
		endif
	else
		wait 1 gameframe
	endif
	repeat
endscript

script fretbar_update_hammer_on_tolerance 
	get_song_prefix song = <song_name>
	formattext checksumname = timesig '%s_timesig' s = <song_prefix> addtostringlookup
	getarraysize $<timesig>
	timesig_entry = 0
	timesig_size = <array_size>
	timesig_num = 0
	0x2e85635d = ($<player_status>.current_song_fretbar_array)
	fretbar_entry = 0
	getarraysize $<0x2e85635d>
	fretbar_array_size = <array_size>
	begin
	getsongtimems time_offset = <time_offset>
	begin
	if (<timesig_entry> < <timesig_size>)
		if ($<timesig> [<timesig_entry>] [0] <= $<0x2e85635d> [<fretbar_entry>])
			<timesig_num> = ($<timesig> [<timesig_entry>] [1])
			<timesig_den> = ($<timesig> [<timesig_entry>] [2])
			timesig_entry = (<timesig_entry> + 1)
		else
			break
		endif
	else
		break
	endif
	repeat
	if ((<fretbar_entry> + 1) < <fretbar_array_size>)
		if (<time> >= $<0x2e85635d> [<fretbar_entry>])
			<song_beat_time> = ($<0x2e85635d> [(<fretbar_entry> + 1)] - $<0x2e85635d> [<fretbar_entry>])
			<note_len> = (<timesig_den> / 4)
			change structurename = <player_status> hammer_on_tolerance = ((<song_beat_time> / $hammer_on_measure_scale) * <note_len>)
			<fretbar_entry> = (<fretbar_entry> + 1)
		else
			wait 1 gameframe
		endif
	else
		wait 1 gameframe
	endif
	repeat
endscript

script create_debug_measure_text 
	if NOT (<fretbar_scale> = thick)
		return
	endif
	if NOT screenelementexists id = hud_destroygroup_windowp1
		return
	endif
	if NOT screenelementexists id = debug_measure_window
		createscreenelement {
			type = containerelement
			parent = hud_destroygroup_windowp1
			id = debug_measure_window
			pos = (0.0, 0.0)
			just = [left top]
		}
	endif
	formattext textname = measure_text "%i" i = <measure>
	formattext checksumname = measure_checksum 'measuretext_%i' i = <measure>
	createscreenelement {
		type = textelement
		parent = debug_measure_window
		id = <measure_checksum>
		font = text_a1
		pos = (2000.0, 32.0)
		just = [center top]
		scale = 1.0
		rgba = [210 210 210 250]
		text = <measure_text>
		z_priority = 1.0
	}
	spawnscriptnow move_debug_measure_text params = {<...>} id = debug_measure_text
endscript

script move_debug_measure_text 
	begin
	if compositeobjectexists <fretbar_id>
		<fretbar_id> :obj_getposition
		pos = (<pos> + (2.0, 0.0, 0.0))
		getviewport2dposfrom3d viewport = 1 pos = <pos>
		pos = (<posx> * (1.0, 0.0) + <posy> * (0.0, 1.0))
		<measure_checksum> :domorph pos = <pos>
		wait \{1
			gameframe}
	else
		destroyscreenelement id = <measure_checksum>
		break
	endif
	repeat
endscript

script destroy_debug_measure_text 
	if screenelementexists \{id = debug_measure_window}
		destroyscreenelement \{id = debug_measure_window}
	endif
	killspawnedscript \{id = debug_measure_text}
endscript
