
script jam_update_volume \{Volume = 0}
	update_volume = <Volume>
	if NOT ($current_song_qpak = jamsession)
		return
	endif
	if (<Volume> = 0)
		<new_vol> = 100
	endif
	getsonginfo
	getplayerinfo <Player> part
	if (<part> = guitar)
		inst = <playback_track1>
	elseif (<part> = bass)
		inst = <playback_track2>
	else
		return
	endif
	if ((<inst> < 0) || (<inst> > 4))
		return
	endif
	gettrackinfo track = ($jam_tracks [<inst>].id)
	new_vol = ((10 - <Volume>) * 2)
	vocals_get_num_vocalists
	if (<num_vocalists> > 0 && <inst> = 4)
		return
	endif
	switch <inst>
		case 0
		if (<update_volume> = 0)
			0xd535eb88 \{slot = 4}
		else
			0xd535eb88 \{slot = 4
				0x0533119f = 0}
			Change 0xd0f42bdf = (<Volume> * 10)
		endif
		case 1
		if (<update_volume> = 0)
			0xd535eb88 \{slot = 5}
		else
			0xd535eb88 \{slot = 5
				0x0533119f = 0}
			Change 0xb483d0a1 = (<Volume> * 10)
		endif
		case 2
		if (<update_volume> = 0)
			0xd535eb88 \{slot = 6}
		else
			0xd535eb88 \{slot = 6
				0x0533119f = 0}
			Change 0x1b560918 = (<Volume> * 10)
		endif
		case 4
		if (<update_volume> = 0)
			0xd535eb88 \{slot = 8}
		else
			0xd535eb88 \{slot = 8
				0x0533119f = 0}
			Change 0xaf59d0a1 = (<Volume> * 10)
		endif
	endswitch
endscript
