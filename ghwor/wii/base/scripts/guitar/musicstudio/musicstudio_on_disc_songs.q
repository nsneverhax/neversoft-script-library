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
		display_name = qs(0x8df35e35)
		FileName = qs(0xb7f9ae26)
		artist = qs(0x9f921afb)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 310086
		musicstudio_genre = 4
	}
	{
		display_name = qs(0xbe666ed0)
		FileName = qs(0xf011998e)
		artist = qs(0x9f921afb)
		playback_track1 = 0
		playback_track2 = 4
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 139159
		musicstudio_genre = 4
	}
	{
		display_name = qs(0xe4bcdde4)
		FileName = qs(0x6c234f27)
		artist = qs(0x9f921afb)
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 306657
		musicstudio_genre = 7
	}
	{
		display_name = qs(0xbad50e75)
		FileName = qs(0xe793b645)
		artist = qs(0x3e6d5b4a)
		playback_track1 = 0
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 125086
		musicstudio_genre = 5
	}
	{
		display_name = qs(0xca37d0ca)
		FileName = qs(0x5850c356)
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
		FileName = qs(0x7fe1dd10)
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
		FileName = qs(0x6f486ad7)
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
		FileName = qs(0xc1af1ffe)
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
		FileName = qs(0x08094856)
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
		FileName = qs(0xe8e1fdf3)
		artist = qs(0x0978b483)
		playback_track1 = 0
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
		musicstudio_song_length = 176970
		musicstudio_genre = 6
	}
]

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
	formatText TextName = filename_localized qs(0x73307931) s = <file_name>
	musicstudio_mainobj :musicstudio_addsong song_name = <filename_localized>
	loadjamsessionfrompak jamname = <file_path>
	SetSearchAllAssetContexts \{OFF}
	setsonginfo \{song_version = $jam_song_version
		example_song = 1}
	UnLoadPak \{'pak/jams/jam1.pak'}
	WaitUnloadPak \{'pak/jams/jam1.pak'
		Block}
endscript
