
script ui_create_jam_publish_track_select 
	if (<guitar_num> = 1)
		formattext \{textname = menu_title
			qs(0xa0a71efa)}
		valid_inst = [0 1 4]
	else
		formattext \{textname = menu_title
			qs(0x06d100f2)}
		valid_inst = [2 4]
	endif
	make_generic_menu {
		title = <menu_title>
		vmenu_id = jam_publish_track_select_vmenu
	}
	getarraysize ($jam_tracks)
	track_array_size = <array_size>
	getarraysize <valid_inst>
	valid_inst_array_size = <array_size>
	other_track_has_melody = 0
	if (<guitar_num> = 1)
		if (<playback_track2> = 4)
			<other_track_has_melody> = 1
		endif
	else
		if (<playback_track1> = 4)
			<other_track_has_melody> = 1
		endif
	endif
	i = 0
	num_items = 0
	begin
	j = 0
	begin
	if (<i> = (<valid_inst> [<j>]))
		gem_array = ($jam_tracks [<i>].gem_array)
		appendsuffixtochecksum base = <gem_array> suffixstring = '_size'
		gem_array_size = <appended_id>
		if (($<gem_array_size>) > 0)
			if NOT (<other_track_has_melody> = 1 && <i> = 4)
				formattext textname = track_text qs(0x3ab01745) a = (($jam_tracks) [<i>].name_text) b = (($<gem_array_size>) / 2)
				add_generic_menu_text_item {
					text = <track_text>
					pad_choose_script = <choose_script>
					pad_choose_params = {track = <i> guitar_num = <guitar_num>}
				}
			else
				if (<playback_track2> = 4)
					formattext textname = track_text qs(0x37b43e47) a = (($jam_tracks) [<i>].name_text) s = qs(0xf98b5f71)
				else
					formattext textname = track_text qs(0x37b43e47) a = (($jam_tracks) [<i>].name_text) s = qs(0x7ffa7a67)
				endif
				add_generic_menu_text_item {
					text = <track_text>
					not_focusable
				}
			endif
			<num_items> = (<num_items> + 1)
		else
			formattext textname = track_text qs(0xc7f4341c) a = (($jam_tracks) [<i>].name_text)
			add_generic_menu_text_item {
				text = <track_text>
				not_focusable
			}
		endif
	endif
	j = (<j> + 1)
	repeat <valid_inst_array_size>
	i = (<i> + 1)
	repeat <track_array_size>
	if (<num_items> = 0)
		if (<guitar_num> = 1)
			no_valid_text = qs(0xfd8ad583)
		else
			no_valid_text = qs(0xd6cac76c)
		endif
		add_generic_menu_text_item {
			text = <no_valid_text>
			pad_choose_script = <choose_script>
			pad_choose_params = {track = -1 guitar_num = <guitar_num>}
		}
	endif
	menu_finish
endscript

script jam_publish_update_playback_track \{guitar_num = 1}
	getsonginfo
	if (<guitar_num> = 1)
		valid_inst = [0 1]
		has_notes = [0 0 0]
		curr_playback_track = <playback_track1>
	else
		valid_inst = [2 4]
		has_notes = [0 0]
		curr_playback_track = <playback_track2>
	endif
	other_track_has_melody = 0
	if (<guitar_num> = 1)
		if (<playback_track2> = 4)
			<other_track_has_melody> = 1
		endif
	else
		if (<playback_track1> = 4)
			<other_track_has_melody> = 1
		endif
	endif
	getarraysize ($jam_tracks)
	track_array_size = <array_size>
	getarraysize <valid_inst>
	valid_inst_array_size = <array_size>
	new_playback_track = -1
	i = 0
	num_items = 0
	begin
	j = 0
	begin
	if (<i> = (<valid_inst> [<j>]))
		gettracksize track = ($jam_tracks [<i>].id)
		if (<track_size> > 0)
			setarrayelement arrayname = has_notes index = <j> newvalue = 1
			if (<i> = <curr_playback_track>)
				printf channel = jam_mode qs(0x15893a8d) s = ($jam_tracks [<i>].name_text)
				<new_playback_track> = <curr_playback_track>
			endif
		endif
	endif
	j = (<j> + 1)
	repeat <valid_inst_array_size>
	i = (<i> + 1)
	repeat <track_array_size>
	if (<new_playback_track> < 0)
		i = 0
		begin
		if (<has_notes> [<i>] = 1)
			<new_playback_track> = (<valid_inst> [<i>])
			printf channel = jam_mode qs(0x3c916600) b = ($jam_tracks [<new_playback_track>].name_text)
			break
		endif
		<i> = (<i> + 1)
		repeat <valid_inst_array_size>
	endif
	if (<new_playback_track> < 0)
		printf \{channel = jam_mode
			qs(0x8c726605)}
	endif
	if (<other_track_has_melody> = 1 && <new_playback_track> = 4)
		printf \{channel = jam_mode
			qs(0x14c59d32)}
		<new_playback_track> = -1
	endif
	if (<guitar_num> = 1)
		setsonginfo playback_track1 = <new_playback_track>
		change memcard_jamsession_playback_track1 = <new_playback_track>
	else
		setsonginfo playback_track2 = <new_playback_track>
		change memcard_jamsession_playback_track2 = <new_playback_track>
	endif
endscript

script jam_publish_update_playback_drumvocal_track 
	gettracksize track = ($jam_tracks [3].id)
	if (<track_size> > 0)
		setsonginfo \{playback_track_drums = 1}
		change \{memcard_jamsession_playback_track_drums = 1}
	else
		setsonginfo \{playback_track_drums = 0}
		change \{memcard_jamsession_playback_track_drums = 0}
	endif
	gettracksize track = ($jam_tracks [5].id)
	if (<track_size> > 0)
		setsonginfo \{playback_track_vocals = 1}
		change \{memcard_jamsession_playback_track_vocals = 1}
	else
		setsonginfo \{playback_track_vocals = 0}
		change \{memcard_jamsession_playback_track_vocals = 0}
	endif
endscript

script ui_destroy_jam_publish_track_select 
	stoprendering
	destroy_generic_menu
endscript
