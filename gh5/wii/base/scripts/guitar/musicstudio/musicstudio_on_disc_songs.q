jam_song_assets = [
	{
		display_name = qs(0x7263dce3)
		FileName = qs(0x65ef6e21)
		artist = qs(0x0978b483)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 160492
		musicstudio_genre = 5
	}
	{
		display_name = qs(0x8624353d)
		FileName = qs(0x2c1bba18)
		artist = qs(0x0978b483)
		playback_track1 = 1
		playback_track2 = 4
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 120590
		musicstudio_genre = 5
	}
	{
		display_name = qs(0x5a304c83)
		FileName = qs(0xef335d7b)
		artist = qs(0x0978b483)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 108661
		musicstudio_genre = 4
	}
	{
		display_name = qs(0x96e5ce12)
		FileName = qs(0xedcb5c0a)
		artist = qs(0x0978b483)
		playback_track1 = 0
		playback_track2 = 4
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 113563
		musicstudio_genre = 0
	}
	{
		display_name = qs(0xfe7eb780)
		FileName = qs(0x8d766274)
		artist = qs(0x0978b483)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 64302
		musicstudio_genre = 2
	}
	{
		display_name = qs(0xa499a801)
		FileName = qs(0xa499a801)
		artist = qs(0x0978b483)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 217723
		musicstudio_genre = 5
	}
	{
		display_name = qs(0xeb695c2c)
		FileName = qs(0x77ba416c)
		artist = qs(0x0978b483)
		playback_track1 = 1
		playback_track2 = 4
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 141742
		musicstudio_genre = 2
	}
]

script savejam \{file_name = 'output'
		artist = qs(0x0978b483)}
	jam_publish_update_playback_track \{guitar_num = 1}
	jam_publish_update_playback_track \{guitar_num = 2}
	jam_publish_update_playback_drumvocal_track
	setsonginfo \{downloaded = 0
		file_id = {
			file_id = [
				0
				0
			]
		}}
	setsonginfo artist = <artist>
	getsonginfo
	musicstudio_mainobj :musicstudio_getsonglength
	printf \{qs(0xb44d4175)}
	printf \{qs(0x03ac90f0)}
	printf qs(0xb2101cbd) s = <playback_track1>
	printf qs(0x3c9f1b5e) s = <playback_track2>
	printf qs(0x914e7e69) s = <playback_track_drums>
	printf qs(0xb3a19c9b) s = <playback_track_vocals>
	printf qs(0x4d5bca79) s = <song_length>
	printf qs(0x25e9811e) s = <genre>
	printf \{qs(0x03ac90f0)}
	printf \{qs(0xb44d4175)}
	printf
	prepend = 'dumps\\'
	formatText TextName = file_path '%a%b.jam' a = <prepend> b = <file_name>
	printf channel = jam_mode qs(0x86fca5dc) s = <file_path>
	savejamsessiontofile jamname = <file_path>
endscript

script load_jam_assets 
	GetArraySize <directorylisting>
	num_saves = <array_Size>
	GetArraySize ($jam_song_assets)
	num_assets = <array_Size>
	if (<num_assets> <= 0)
		return
	endif
	i = 0
	new_asset = 0
	begin
	curr_asset = ($jam_song_assets [<i>].FileName)
	j = 0
	found_for_add = 0
	begin
	if (<num_saves> <= 0)
		break
	endif
	curr_save = (<directorylisting> [<j>].FileName)
	if (<curr_save> = <curr_asset>)
		<found_for_add> = 1
	endif
	<j> = (<j> + 1)
	repeat <num_saves>
	if NOT (<found_for_add> = 1)
		formatText TextName = curr_asset '%s' s = <curr_asset>
		loadjam file_name = <curr_asset>
		<new_asset> = 1
	else
		printf channel = jam_mode qs(0x472cadcd) s = <curr_asset>
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	return new_asset = <new_asset>
endscript

script loadjam \{file_name = 'output'
		save = 1}
	if NOT GotParam \{Heap}
		musicstudio_mainobj :musicstudio_getcurrentheap
	endif
	LoadPak 'pak/jams/jam1.pak' Heap = <Heap>
	prepend = 'pak/jams/'
	formatText TextName = file_path '%a%b.jam' a = <prepend> b = <file_name>
	printf channel = jam_mode qs(0x56336457) s = <file_path>
	SetSearchAllAssetContexts
	musicstudio_mainobj :musicstudio_addsong song_name = <song_name>
	loadjamsessionfrompak jamname = <file_path>
	SetSearchAllAssetContexts \{OFF}
	setsonginfo \{song_version = $jam_song_version
		example_song = 1}
	UnLoadPak \{'pak/jams/jam1.pak'}
	WaitUnloadPak \{'pak/jams/jam1.pak'}
endscript
