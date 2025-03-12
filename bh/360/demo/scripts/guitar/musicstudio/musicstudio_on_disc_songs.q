jam_song_assets = [
	{
		display_name = qs(0xca37d0ca)
		filename = qs(0x3341b29c)
		artist = qs(0x0978b483)
		playback_track1 = 0
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 220304
		musicstudio_genre = 6
	}
	{
		display_name = qs(0x6d40ec0a)
		filename = qs(0x7fe1dd10)
		artist = qs(0x0978b483)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 112314
		musicstudio_genre = 4
	}
	{
		display_name = qs(0xa22c120f)
		filename = qs(0x6f486ad7)
		artist = qs(0x0978b483)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 275984
		musicstudio_genre = 4
	}
	{
		display_name = qs(0xd18e49ea)
		filename = qs(0xc1af1ffe)
		artist = qs(0x0978b483)
		playback_track1 = 0
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 76607
		musicstudio_genre = 1
	}
	{
		display_name = qs(0xca2bfac9)
		filename = qs(0x08094856)
		artist = qs(0x0978b483)
		playback_track1 = 0
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 106813
		musicstudio_genre = 2
	}
	{
		display_name = qs(0x12d8c8d5)
		filename = qs(0xe8e1fdf3)
		artist = qs(0x0978b483)
		playback_track1 = 0
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 176970
		musicstudio_genre = 6
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
	formattext textname = file_path '%a%b.jam' a = <prepend> b = <file_name>
	printf channel = jam_mode qs(0x86fca5dc) s = <file_path>
	savejamsessiontofile jamname = <file_path>
endscript

script load_jam_assets 
	getarraysize <directorylisting>
	num_saves = <array_size>
	getarraysize ($jam_song_assets)
	num_assets = <array_size>
	if (<num_assets> <= 0)
		return
	endif
	i = 0
	new_asset = 0
	begin
	curr_asset = ($jam_song_assets [<i>].filename)
	j = 0
	found_for_add = 0
	begin
	if (<num_saves> <= 0)
		break
	endif
	curr_save = (<directorylisting> [<j>].filename)
	if (<curr_save> = <curr_asset>)
		<found_for_add> = 1
	endif
	<j> = (<j> + 1)
	repeat <num_saves>
	if NOT (<found_for_add> = 1)
		formattext textname = curr_asset '%s' s = <curr_asset>
		loadjam file_name = <curr_asset>
		<new_asset> = 1
	else
		printf channel = jam_mode qs(0x472cadcd) s = <curr_asset>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return new_asset = <new_asset>
endscript

script loadjam \{file_name = 'output'
		save = 1}
	loadpak \{'jams/jam1.pak'}
	prepend = 'jams/'
	formattext textname = file_path '%a%b.jam' a = <prepend> b = <file_name>
	printf channel = jam_mode qs(0x56336457) s = <file_path>
	setsearchallassetcontexts
	musicstudio_mainobj :musicstudio_addsong song_name = <song_name>
	loadjamsessionfrompak jamname = <file_path>
	setsearchallassetcontexts \{off}
	setsonginfo \{song_version = $jam_song_version
		example_song = 1}
	unloadpak \{'jams/jam1.pak'}
	waitunloadpak \{'jams/jam1.pak'}
endscript
