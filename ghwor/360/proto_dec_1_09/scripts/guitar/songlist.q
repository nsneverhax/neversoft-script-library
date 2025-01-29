on_disc_list = gh6_songlist
on_disc_props = gh6_songlist_props
gh_songlist = [
	{
		list = gh6_songlist
		props = gh6_songlist_props
		frontend_desc = qs(0xf0402bc7)
		crc = gh6
		encryption_type = 6
	}
	{
		list = gh6_1_songlist
		props = gh6_1_songlist_props
		frontend_desc = qs(0xf74a02aa)
		crc = 0xa046a4d0
		encryption_type = 6
	}
	{
		list = gh6_dlc_songlist
		props = gh6_dlc_songlist_props
		frontend_desc = qs(0x60679f40)
		crc = gh6_dlc
	}
	{
		list = gh5_0_songlist
		props = gh5_0_songlist_props
		frontend_desc = qs(0x8fa4c515)
		crc = gh5
	}
	{
		list = gh5_dlc_songlist
		props = gh5_dlc_songlist_props
		frontend_desc = qs(0x60679f40)
		crc = gh5_dlc
	}
	{
		list = gh4_songlist
		props = gh4_songlist_props
		frontend_desc = qs(0x8e7c9c19)
		crc = gh4
	}
	{
		list = gh4_dlc_songlist
		props = gh4_dlc_songlist_props
		frontend_desc = qs(0x60679f40)
		crc = gh4_dlc
	}
	{
		list = gh4_1_songlist
		props = gh4_1_songlist_props
		frontend_desc = qs(0xbb9eb8e5)
		crc = gh4_1
	}
	{
		list = gh4_2_songlist
		props = gh4_2_songlist_props
		frontend_desc = qs(0x636cc2e9)
		frontend_desc_eu = qs(0x44268c08)
		crc = gh4_2
	}
	{
		list = gh4_3_songlist
		props = gh4_3_songlist_props
		frontend_desc = qs(0x8c15a2a7)
		crc = gh4_3
	}
	{
		list = gh5_1_songlist
		props = gh5_1_songlist_props
		frontend_desc = qs(0xbd6ede51)
		crc = gh5_1
	}
	{
		list = gh5_2_songlist
		props = gh5_2_songlist_props
		frontend_desc = qs(0x3e66dff6)
		crc = gh5_2
	}
	{
		list = gh5_3_songlist
		props = gh5_3_songlist_props
		frontend_desc = qs(0x277deeb7)
		crc = gh5_3
	}
	{
		list = gh5_4_songlist
		props = gh5_4_songlist_props
		frontend_desc = qs(0x683c7870)
		crc = gh5_4
	}
]
additional_songlist = [
	{
		list = debug_songlist
		props = debug_songlist_props
		frontend_desc = qs(0x2ae82c63)
		crc = debug
		encryption_type = 6
	}
	{
		list = tutorial_songlist
		props = tutorial_songlist_props
		frontend_desc = qs(0xae0e9bcf)
		crc = tutorial
		encryption_type = 6
	}
	{
		list = mt_songlist
		props = mt_songlist_props
		frontend_desc = qs(0x6f589a5e)
		crc = mt
		encryption_type = 6
	}
	{
		list = old_ondisc_songlist
		props = old_ondisc_songlist_props
		frontend_desc = qs(0x25ca4e0f)
		crc = gh5_old
		encryption_type = 6
	}
	{
		list = test_songlist
		props = test_songlist_props
		frontend_desc = qs(0x82511966)
		crc = test
	}
]
menu_songs = [
	blueorchid
	lithium
	onebigholiday
]
download_songlist_props = {
	$gh4_songlist_props
	$gh4_dlc_songlist_props
	$gh4_1_songlist_props
	$gh4_2_songlist_props
	$gh4_3_songlist_props
	$gh5_0_songlist_props
	$gh5_dlc_songlist_props
	$gh5_1_songlist_props
	$gh5_2_songlist_props
	$gh5_3_songlist_props
	$gh5_4_songlist_props
	$gh6_dlc_songlist_props
}
additional_songlist_props = {
	$test_songlist_props
	$debug_songlist_props
	$mt_songlist_props
	$old_ondisc_songlist_props
	$tutorial_songlist_props
}
gh_songlist_props = {
	$download_songlist_props
	$gh6_songlist_props
	$gh6_1_songlist_props
	$additional_songlist_props
	$jammode_songlist_props
	$example_jam_songlist_props
	$jamsession_songlist_props
}
gh6_demo_kiosk_songlist = [
]
gh6_demo_xbla_songlist = [
]
gh6_songlist = [
	aqualung
	blackwidow
	bloodlines
	calling
	callmethebreeze
	childrenofthegrave
	feelslikethefirsttime
	fortunateson
	getfree
	graduate
	machinehead
	moderndaycowboy
	motivation
	nosecretsthisyear
	renegade
	rockinamerica
	rush2112p1
	rush2112p2
	rush2112p3
	rush2112p4
	rush2112p5
	rush2112p6
	rush2112p7
	savior
	settingfire
	slowhands
	ticktickboom
]
debug_songlist = [
	debugbrokenchord
	debug_bandmoment
	debugchaltest1
	debugchaltest3
	debugchaltest5
	debugcymbalswell
	debugcymbalswelltest2
	debugdownextsust
	debugkicksustaintest
	debugnobass
	debugnodrums
	debugnoguitar
	debugnovocals
	debugnotetypetest
	debugvolband
	debugvolbass
	debugvolcrowd
	debugvoldrumcymbal
	debugvoldrumkick
	debugvoldrumsnare
	debugvoldrumtom
	debugvolguitar
	debugvolvocals
	debugvoxlag
	debugtesttones
	debugdrumstreamtest
	debugelevensecond
	debugsync
	debugsyncaudiovisual
	debugsyncmuting
	debugsyncplaytoaudio
	debugtensecond
	debugtwelvesecond
	debugtestmixlevels
	debugautofacial
	z_cavestagetran
	0x49ba803c
	0x49ba803c
	z_egypttran
	z_epicstagetran
	z_festivaltran
	z_festivaltran
	z_housebandtran
	z_mansionstudiotran
	z_punkstagetran
	z_riothousetran
]
old_ondisc_songlist = [
	apunk
	allalongthewatchtower
	blueorchid
	bulletsbutterfly
	demon
	doyoufeellikewedo
	donewitheverything
	duhast
	exgirlfriend
	lithium
	lovetoken
	nearlylostyou
	noonetodependon
	onebigholiday
	onlyhappywhenitrains
	playthatfunkymusic
	ringoffire
	scatterbrain
	smellsliketeenspirit
	song2
	spiritofradio
	twentyfirstcentury
	twominutestomidnight
	womanfromtokyo
	yougivelove
]
mt_songlist = [
	0xfaa60892
	0x8f67ea43
	0x6e86e8db
	0x49366488
	0x0681d8da
	0x91883b33
	0x58aaeb59
	0x2a89f43b
	0x7af582fa
	0x560354bb
	0x4cda9c0c
	0x298575c2
	0x0c9cc2b3
	0xc24b61b7
	0x334727d5
	0x8bfcb83a
	0x8bf475df
	0xb633f515
]
tutorial_songlist = [
	tut_bass_open
	tut_drums_accent
	tut_drums_basicbeat
	tut_drums_doublekick
	tut_drums_easy
	tut_drums_fill
	tut_drums_freeform
	tut_drums_kick
	tut_drums_roll
	tut_drums_sp
	tut_drums_swell
	tut_guitar_altstrum
	tut_guitar_chords
	tut_guitar_extended
	tut_guitar_fretting
	tut_guitar_g_only
	tut_guitar_gry
	tut_guitar_hammeron
	tut_guitar_high_note
	tut_guitar_hopochords
	tut_guitar_pulloff
	tut_guitar_sp
	tut_guitar_sp_sustains
	tut_guitar_sustains
	tut_guitar_tapping
	tut_vox_blank
	tut_vox_freeform
	tut_vox_held
	tut_vox_spoken
	tut_vox_tw
	tut_vox_tw_short
	tut_vox_tw_sp
]
example_jam_songlist = [
]
jammode_songlist = [
]
jammode_songlist_props = {
}
example_jam_songlist_props = {
}
0xa87d0628 = [
]
0x4a05e1f5 = {
}
jamsession_songlist_props = {
	jamsession = {
		checksum = jamsession
		Name = 'jamsession'
		title = qs(0xab6a4722)
		artist = qs(0x4194c91d)
		year = 2009
		year_num = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'hihat01'
		saved_in_globaltags = 0
		allowed_in_random = 0
		allowed_in_quickplay = 0
		never_show_in_setlist
	}
}
gh6_songlist_props = {
	aqualung = {
		checksum = aqualung
		Name = 'Aqualung'
		title = qs(0x0802a3e4)
		artist = qs(0x2111a97c)
		artist_text = $artist_text_by
		original_artist = 1
		year = 1971
		album_title = qs(0x0802a3e4)
		singer = male
		genre = `classic	rock`
		leaderboard = 1
		Duration = 392
		flags = 0
		double_kick = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 165
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 6
		band_difficulty_rating = 5
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Hihat02'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
				}
				{
					goal_name = qp_spower_banked
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_rockout_time
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_sustain_hits
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
				}
			]
			Band = [
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	blackwidow = {
		checksum = blackwidow
		Name = 'BlackWidow'
		title = qs(0xdfd15dee)
		artist = qs(0xde38711a)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2007
		album_title = qs(0xf95248b6)
		singer = male
		genre = `speed	metal`
		leaderboard = 1
		Duration = 445
		flags = 0
		double_kick = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 300
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 0
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Hihat03'
		overall_song_volume = 0.0
	}
	bloodlines = {
		checksum = bloodlines
		Name = 'Bloodlines'
		title = qs(0xedf779e4)
		artist = qs(0x50e0d803)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2009
		album_title = qs(0xe06ac7b6)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 220
		flags = 0
		double_kick = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 2
		drums_difficulty_rating = 9
		band_difficulty_rating = 5
		snare = 'Metal'
		kick = 'Metal'
		tom1 = 'Metal'
		tom2 = 'Metal'
		cymbal = 'Metal'
		drum_kit = 'Metal'
		countoff = 'Sticks_Huge'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
				}
				{
					goal_name = qp_spower_banked
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_alt_strum
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_drum_accents
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spoken_notes
				}
			]
			Band = [
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	calling = {
		checksum = calling
		Name = 'Calling'
		title = qs(0x8561c077)
		artist = qs(0xfde15c38)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2007
		album_title = qs(0xb913d8d8)
		singer = male
		genre = alternative
		leaderboard = 1
		Duration = 219
		flags = 0
		double_kick = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 8
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 8
		band_difficulty_rating = 5
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
				}
				{
					goal_name = qp_hit_chords
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_alt_strum
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_green_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
				}
			]
			Band = [
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	callmethebreeze = {
		checksum = callmethebreeze
		Name = 'CallMeTheBreeze'
		title = qs(0x90825f21)
		artist = qs(0xd8375309)
		artist_text = $artist_text_by
		original_artist = 1
		year = 1976
		album_title = qs(0x3fc33ad3)
		singer = male
		genre = `southern	rock`
		leaderboard = 1
		Duration = 330
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 300
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ClassicRock'
		kick = 'ClassicRock'
		tom1 = 'ClassicRock'
		tom2 = 'ClassicRock'
		hihat = 'ClassicRock'
		cymbal = 'ClassicRock'
		drum_kit = 'ClassicRock'
		countoff = 'Hihat03'
		overall_song_volume = 0.0
	}
	childrenofthegrave = {
		checksum = childrenofthegrave
		Name = 'ChildrenOfTheGrave'
		title = qs(0x6b01b5b0)
		artist = qs(0x775257ff)
		artist_text = $artist_text_by
		original_artist = 1
		year = 1971
		album_title = qs(0x29098a92)
		singer = male
		genre = metal
		leaderboard = 1
		Duration = 277
		flags = 0
		vocals_scroll_speed = 1.15
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 300
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 6
		band_difficulty_rating = 4
		snare = 'ClassicRock'
		kick = 'ClassicRock'
		tom1 = 'ClassicRock'
		tom2 = 'ClassicRock'
		hihat = 'ClassicRock'
		cymbal = 'ClassicRock'
		drum_kit = 'ClassicRock'
		countoff = 'Hihat03'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_blue_notes
				}
				{
					goal_name = qp_yellow_notes
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_red_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_orange_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spower_time
				}
			]
			Band = [
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	feelslikethefirsttime = {
		checksum = feelslikethefirsttime
		Name = 'FeelsLikeTheFirstTime'
		title = qs(0xe96973a4)
		artist = qs(0x5b3ab1bb)
		artist_text = $artist_text_by
		original_artist = 1
		year = 1977
		album_title = qs(0x5b3ab1bb)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 254
		flags = 0
		double_kick = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		parts_with_mic = [
			GUITARIST
			BASSIST
		]
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 6
		band_difficulty_rating = 5
		snare = 'ClassicRock'
		kick = 'ClassicRock'
		tom1 = 'ClassicRock'
		tom2 = 'ClassicRock'
		cymbal = 'ClassicRock'
		drum_kit = 'ClassicRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spower_banked
				}
				{
					goal_name = qp_hit_chords
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_tap_strum
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spower_time
				}
			]
			Band = [
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	fortunateson = {
		checksum = fortunateson
		Name = 'FortunateSon'
		title = qs(0x6230d9dc)
		artist = qs(0x68414f08)
		artist_text = $artist_text_by
		original_artist = 1
		year = 1969
		album_title = qs(0x0fe62cf3)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 157
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 2
		band_difficulty_rating = 4
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
				}
				{
					goal_name = qp_down_strum
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_up_strum
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spower_banked
				}
			]
			Band = [
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	getfree = {
		checksum = getfree
		Name = 'GetFree'
		title = qs(0x5ed4f223)
		artist = qs(0xb362d2df)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2002
		album_title = qs(0xe5b94845)
		singer = male
		genre = alternative
		leaderboard = 1
		Duration = 123
		flags = 0
		double_kick = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Hihat03'
		overall_song_volume = 0.0
	}
	graduate = {
		checksum = graduate
		Name = 'Graduate'
		title = qs(0x38e44de8)
		artist = qs(0x6fe0e5b5)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2009
		album_title = qs(0x26c88adc)
		singer = male
		genre = alternative
		leaderboard = 1
		Duration = 180
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Hihat02'
		overall_song_volume = 0.0
	}
	machinehead = {
		checksum = machinehead
		Name = 'Machinehead'
		title = qs(0xe413bb6f)
		artist = qs(0xdd247e0c)
		artist_text = $artist_text_by
		original_artist = 1
		year = 1994
		album_title = qs(0xa325db26)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 262
		flags = 0
		double_kick = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 4
		band_difficulty_rating = 4
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_alt_strum
				}
				{
					goal_name = qp_rockout_time
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_whammy_time
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
				}
			]
			Band = [
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	moderndaycowboy = {
		checksum = moderndaycowboy
		Name = 'ModernDayCowboy'
		title = qs(0x02338e49)
		artist = qs(0xbe87c326)
		artist_text = $artist_text_by
		original_artist = 1
		year = 1986
		album_title = qs(0x54b31c43)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 314
		flags = 0
		vocals_scroll_speed = 1.15
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 6
		band_difficulty_rating = 5
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Hihat02'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
				}
				{
					goal_name = qp_hit_hopos
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_alt_strum
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_open_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spower_time
				}
			]
			Band = [
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	motivation = {
		checksum = motivation
		Name = 'Motivation'
		title = qs(0x4067eadb)
		artist = qs(0xb9a0d7e2)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2001
		album_title = qs(0x586bfc13)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 172
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 300
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 8
		band_difficulty_rating = 6
		snare = 'HeavyRock'
		kick = 'HeavyRock'
		tom1 = 'HeavyRock'
		tom2 = 'HeavyRock'
		hihat = 'HeavyRock'
		cymbal = 'HeavyRock'
		drum_kit = 'HeavyRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	nosecretsthisyear = {
		checksum = nosecretsthisyear
		Name = 'NoSecretsThisYear'
		title = qs(0x69d3e460)
		artist = qs(0x3e6463ce)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2009
		album_title = qs(0x83fc9fc8)
		singer = male
		genre = alternative
		leaderboard = 1
		Duration = 273
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 4
		band_difficulty_rating = 4
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
				}
				{
					goal_name = qp_hit_chords
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_up_strum
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_green_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
				}
			]
			Band = [
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_spower_banked_band
				}
			]
		}
	}
	renegade = {
		checksum = renegade
		Name = 'Renegade'
		title = qs(0x5434ad4a)
		artist = qs(0x83166e29)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2009
		album_title = qs(0x26c88adc)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 266
		flags = 0
		double_kick = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 6
		band_difficulty_rating = 5
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_hopos
				}
				{
					goal_name = qp_hit_notes
					watched_sections = [
						6
						7
						11
						12
						13
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_rockout_time
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spower_time
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
				}
			]
			Band = [
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
			]
		}
	}
	rockinamerica = {
		checksum = rockinamerica
		Name = 'RockInAmerica'
		title = qs(0xf115fb39)
		artist = qs(0xc60b34a3)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2009
		album_title = qs(0x26c88adc)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 261
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 185
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 7
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 6
		band_difficulty_rating = 6
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_hopos
				}
				{
					goal_name = qp_hit_notes
					watched_sections = [
						6
						7
						8
						9
						11
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_sustain_time
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_multiplier_time
				}
			]
			Band = [
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	rush2112p1 = {
		checksum = rush2112p1
		Name = 'Rush2112P1'
		title = qs(0x98c0265d)
		artist = qs(0xa19f4f27)
		artist_text = $artist_text_by
		original_artist = 1
		year = 3030
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 273
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	rush2112p2 = {
		checksum = rush2112p2
		Name = 'Rush2112P2'
		title = qs(0xb3ed759e)
		artist = qs(0xa19f4f27)
		artist_text = $artist_text_by
		original_artist = 1
		year = 3030
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 132
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	rush2112p3 = {
		checksum = rush2112p3
		Name = 'Rush2112P3'
		title = qs(0xaaf644df)
		artist = qs(0xa19f4f27)
		artist_text = $artist_text_by
		original_artist = 1
		year = 3030
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 217
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	rush2112p4 = {
		checksum = rush2112p4
		Name = 'Rush2112P4'
		title = qs(0xe5b7d218)
		artist = qs(0xa19f4f27)
		artist_text = $artist_text_by
		original_artist = 1
		year = 3030
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 220
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	rush2112p5 = {
		checksum = rush2112p5
		Name = 'Rush2112P5'
		title = qs(0xfcace359)
		artist = qs(0xa19f4f27)
		artist_text = $artist_text_by
		original_artist = 1
		year = 3030
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 121
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	rush2112p6 = {
		checksum = rush2112p6
		Name = 'Rush2112P6'
		title = qs(0xd781b09a)
		artist = qs(0xa19f4f27)
		artist_text = $artist_text_by
		original_artist = 1
		year = 3030
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 139
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	rush2112p7 = {
		checksum = rush2112p7
		Name = 'Rush2112P7'
		title = qs(0xce9a81db)
		artist = qs(0xa19f4f27)
		artist_text = $artist_text_by
		original_artist = 1
		year = 3030
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 135
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	savior = {
		checksum = savior
		Name = 'Savior'
		title = qs(0x593b14cc)
		artist = qs(0xd0393a54)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2008
		album_title = qs(0xd015195f)
		singer = male
		genre = `modern	rock`
		leaderboard = 1
		Duration = 245
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 7
		band_difficulty_rating = 6
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
		parts_with_mic = [
			GUITARIST
			BASSIST
		]
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_sustain_time
				}
				{
					goal_name = qp_score_spower
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spower_time
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_open_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spower_banked
				}
			]
			Band = [
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	settingfire = {
		checksum = settingfire
		Name = 'SettingFire'
		title = qs(0xcfc732c2)
		artist = qs(0x5d0ba8f8)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2004
		album_title = qs(0x682e3d3d)
		singer = male
		genre = metal
		leaderboard = 1
		Duration = 207
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Hihat03'
		overall_song_volume = 0.0
	}
	slowhands = {
		checksum = slowhands
		Name = 'SlowHands'
		title = qs(0x23379828)
		artist = qs(0xbbcd5420)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2004
		album_title = qs(0x59fbb5a6)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 192
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 155
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 5
		band_difficulty_rating = 5
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_alt_strum
				}
				{
					goal_name = qp_score_spower
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_up_strum
					watched_sections = [
						9
					]
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_multiplier_time
				}
			]
			Band = [
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_spower_banked_band
				}
			]
		}
	}
	ticktickboom = {
		checksum = ticktickboom
		Name = 'TickTickBoom'
		title = qs(0xa03c5f5f)
		artist = qs(0x6580e372)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2007
		album_title = qs(0xc88fba12)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 202
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 6
		band_difficulty_rating = 5
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_rockout_time
				}
				{
					goal_name = qp_hit_taps
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spower_banked
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_sustain_hits
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_multiplier_time
				}
			]
			Band = [
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
}
old_ondisc_songlist_props = {
	aboutagirl = {
		checksum = aboutagirl
		Name = 'AboutAGirl'
		title = qs(0x8c6da328)
		artist = qs(0xc6824b55)
		year = qs(0x190e1d29)
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = `classic	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -3.2
	}
	alltheprettyfaces = {
		checksum = alltheprettyfaces
		Name = 'AllThePrettyFaces'
		title = qs(0xbcf29318)
		artist = qs(0x2fc08707)
		year = 2006
		Duration = 295
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 7
		leaderboard = 1
		singer = male
		genre = alternative
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -3.8
		trivia_no_phrases
		album_title = qs(0x42536f94)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 8
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'alltheprettyfaces'
		kick = 'alltheprettyfaces'
		tom1 = 'heavyrockHigh'
		tom2 = 'heavyrockHigh'
		hihat = 'heavyrock'
		cymbal = 'heavyrock'
	}
	areyougonnagomyway = {
		checksum = areyougonnagomyway
		Name = 'AreYouGonnaGoMyWay'
		title = qs(0xa032fb87)
		artist = qs(0x0bce0c71)
		year = qs(0x564f8bee)
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -1.2
	}
	beautifuldisaster = {
		checksum = beautifuldisaster
		Name = 'BeautifulDisaster'
		title = qs(0xfd2860e7)
		artist = qs(0xcd4bcb98)
		year = qs(0x32234eea)
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = punk
		countoff = 'sticks_normal'
		drum_kit = 'fusion'
		overall_song_volume = -1.9
	}
	0xd8649814 = {
		checksum = 0xd8649814
		Name = 'BeautifulPeople'
		title = qs(0x1e134769)
		artist = qs(0xcdd85199)
		year = 1996
		Duration = 220
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = industrial
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0
		album_title = qs(0x5f7d8b1e)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 5
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
	}
	comedown = {
		checksum = comedown
		Name = 'Comedown'
		title = qs(0xac0f4d07)
		artist = qs(0xdd247e0c)
		year = 1994
		Duration = 328
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 4
		leaderboard = 1
		singer = male
		genre = grunge
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.5
		trivia_no_phrases
		album_title = qs(0xa325db26)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 5
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'comedown'
		kick = 'comedown'
		tom1 = 'modernrockhigh'
		tom2 = 'modernrockhigh'
		hihat = 'modernrock'
		cymbal = 'modernrock'
	}
	dammit = {
		checksum = dammit
		Name = 'Dammit'
		title = qs(0x6cfb68a2)
		artist = qs(0x241b860d)
		year = qs(0x32234eea)
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = punk
		countoff = 'sticks_normal'
		drum_kit = 'modernrock'
		drum_solo = 1
		overall_song_volume = -3.4
	}
	deadbolt = {
		checksum = deadbolt
		Name = 'Deadbolt'
		title = qs(0x98536a94)
		artist = qs(0x1aa9e35d)
		year = 2002
		Duration = 142
		album_img = 'Thrice_TheIllusionOfSafety'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 12
		leaderboard = 1
		singer = male
		genre = alternative
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.5
		album_title = qs(0xb8d53784)
		double_kick = 1
		guitar_difficulty_rating = 7
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 7
		band_difficulty_rating = 7
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'deadbolt'
		kick = 'Metal'
		tom1 = 'metallow'
		tom2 = 'metallow'
		hihat = 'Metal'
		cymbal = 'Metal'
	}
	disconnected = {
		checksum = disconnected
		Name = 'Disconnected'
		title = qs(0xb2084b9e)
		artist = qs(0xd874a8d2)
		year = 1995
		Duration = 202
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 9
		leaderboard = 1
		singer = male
		genre = `pop	punk`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.2
		trivia_no_phrases
		album_title = qs(0xeae88572)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 5
		band_difficulty_rating = 5
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'disconnected'
		kick = 'disconnected'
		tom1 = 'HeavyRocklow'
		tom2 = 'HeavyRocklow'
		hihat = 'ModernRock'
		cymbal = 'HeavyRock'
	}
	feelthepain = {
		checksum = feelthepain
		Name = 'FeelThePain'
		title = qs(0xa741794e)
		artist = qs(0xeb1570ee)
		year = qs(0x190e1d29)
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = goth
		countoff = 'hihat01'
		drum_kit = 'modernrock'
		overall_song_volume = -2
	}
	freakonaleash = {
		checksum = freakonaleash
		Name = 'FreakOnALeash'
		title = qs(0x4c79afd6)
		artist = qs(0xbcda0a93)
		year = qs(0xb5bb5225)
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = `black	metal`
		countoff = 'Sticks_Normal'
		drum_kit = 'modernrock'
		overall_song_volume = -1.6
	}
	judith = {
		checksum = judith
		Name = 'Judith'
		title = qs(0xef64fe20)
		artist = qs(0x8386c12c)
		year = 2000
		Duration = 249
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 12
		leaderboard = 1
		singer = male
		genre = alternative
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.5
		trivia_no_phrases
		album_title = qs(0x942ac08a)
		double_kick = 0
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 8
		drums_difficulty_rating = 6
		band_difficulty_rating = 6
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'judith'
		kick = 'judith'
		tom1 = 'HeavyRocklow'
		tom2 = 'HeavyRocklow'
		hihat = 'HeavyRock'
		cymbal = 'HeavyRock'
	}
	looksthatkill = {
		checksum = looksthatkill
		Name = 'LooksThatKill'
		title = qs(0x17deedee)
		artist = qs(0x53c4f1af)
		year = 1983
		Duration = 262
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 6
		leaderboard = 1
		singer = male
		genre = metal
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -0.5
		trivia_no_phrases
		album_title = qs(0xe5e36523)
		double_kick = 0
		parts_with_mic = [
			GUITARIST
			BASSIST
		]
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 3
		band_difficulty_rating = 5
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'LooksThatKill'
		kick = 'LooksThatKill'
		tom1 = 'heavyrockhigh'
		tom2 = 'heavyrockhigh'
		hihat = 'heavyrock'
		cymbal = 'heavyrock'
	}
	prisonerofsociety = {
		checksum = prisonerofsociety
		Name = 'PrisonerOfSociety'
		title = qs(0x9b8aa3a0)
		artist = qs(0x5669f68c)
		year = qs(0xaca06364)
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = punk
		countoff = 'Sticks_Normal'
		drum_kit = 'modernrock'
		drum_solo = 1
		overall_song_volume = -1.8
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 1
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
	}
	saturdaynightsalright = {
		checksum = saturdaynightsalright
		Name = 'SaturdayNightsAlright'
		title = qs(0xdc6ea66f)
		artist = qs(0x6f5dc7ca)
		year = 1973
		Duration = 302
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 10
		leaderboard = 1
		singer = male
		genre = `classic	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -0.75
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 170
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		album_title = qs(0x65354dd8)
		double_kick = 0
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 3
		band_difficulty_rating = 5
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'saturdaynightsalright'
		kick = 'saturdaynightsalright'
		tom1 = 'ClassicRockHigh'
		tom2 = 'ClassicRockHigh'
		hihat = 'classicrock'
		cymbal = 'modernrock'
	}
	seven = {
		checksum = seven
		Name = 'Seven'
		title = qs(0xf6061aa9)
		artist = qs(0x39b42d2c)
		year = 1994
		Duration = 288
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 8
		leaderboard = 1
		singer = male
		genre = alternative
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.5
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 180
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		album_title = qs(0xb2454ce4)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 9
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'seven'
		kick = 'seven'
		tom1 = 'heavyrocklow'
		tom2 = 'heavyrocklow'
		hihat = 'heavyrock'
		cymbal = 'heavyrock'
	}
	sexonfire = {
		checksum = sexonfire
		Name = 'SexOnFire'
		title = qs(0xcb1ea691)
		artist = qs(0x827ff098)
		year = 2008
		Duration = 207
		album_img = 'DreamTheater_ImagesAndWords'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 3
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_huge'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 1
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		trivia_no_phrases
		album_title = qs(0xf404707b)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'sexonfire'
		kick = 'sexonfire'
		tom1 = 'standardrock'
		tom2 = 'standardrock'
		hihat = 'standardrock'
		cymbal = 'standardrock'
	}
	shoutitoutloud = {
		checksum = shoutitoutloud
		Name = 'ShoutItOutLoud'
		title = qs(0x4e4b0c31)
		artist = qs(0x1f496c5d)
		year = 2007
		Duration = 178
		album_img = 'KISS_JigokuRetsuden'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 4
		leaderboard = 1
		singer = male
		genre = `classic	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -0.5
		album_title = qs(0x47cc6adf)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'shoutitoutloud'
		kick = 'shoutitoutloud'
		tom1 = 'ClassicRockHigh'
		tom2 = 'ClassicRockHigh'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	superstition = {
		checksum = superstition
		Name = 'Superstition'
		title = qs(0x8fe9f9a0)
		artist = qs(0x966b81d1)
		year = 1972
		Duration = 298
		artist_text = $artist_text_by
		original_artist = 1
		venue = 5
		leaderboard = 1
		singer = male
		genre = funk
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -0.3
		trivia_no_phrases
		album_title = qs(0xfd6b9401)
		double_kick = 0
		album_img = 'placeholder_album'
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 9
		drums_difficulty_rating = 3
		band_difficulty_rating = 5
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'superstition'
		kick = 'superstition'
		tom1 = 'StandardRocklow'
		tom2 = 'StandardRockhigh'
		hihat = 'classicrock'
		cymbal = 'ModernRock'
	}
	sweatingbullets = {
		checksum = sweatingbullets
		Name = 'SweatingBullets'
		title = qs(0x74c5b76e)
		artist = qs(0x58120222)
		year = 1992
		Duration = 327
		artist_text = $artist_text_by
		original_artist = 1
		venue = 13
		leaderboard = 1
		singer = male
		genre = metal
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.0
		vocals_scroll_speed = 1.3299999
		trivia_no_phrases
		album_title = qs(0xebbe3e9c)
		double_kick = 1
		album_img = 'placeholder_album'
		guitar_difficulty_rating = 7
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 6
		band_difficulty_rating = 6
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'sweatingbullets'
		kick = 'sweatingbullets'
		tom1 = 'Metallow'
		tom2 = 'Metallow'
		hihat = 'Metal'
		cymbal = 'Metal'
	}
	sympathyforthedevil = {
		checksum = sympathyforthedevil
		Name = 'SympathyForTheDevil'
		title = qs(0xcbf1e6cd)
		artist = qs(0x4c097d05)
		year = 1968
		Duration = 391
		artist_text = $artist_text_by
		original_artist = 1
		venue = 1
		leaderboard = 1
		singer = male
		genre = `blues	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -0.5
		trivia_no_phrases
		album_title = qs(0x0599abb5)
		album_img = 'placeholder_album'
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 7
		vocals_difficulty_rating = 9
		drums_difficulty_rating = 1
		band_difficulty_rating = 5
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'ClassicRocklow'
		kick = 'ClassicRocklow'
		tom1 = 'ClassicRockHigh'
		tom2 = 'ClassicRockHigh'
		hihat = 'ClassicRock'
		cymbal = 'ClassicRock'
	}
	whativedone = {
		checksum = whativedone
		Name = 'WhatIveDone'
		title = qs(0x99a46734)
		artist = qs(0x7357ee4c)
		year = qs(0xe6ab574b)
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = `heavy	metal`
		countoff = 'sticks_normal'
		drum_kit = 'modernrock'
		parts_with_mic = [
			GUITARIST
			BASSIST
		]
		overall_song_volume = -2
	}
	younkfunk = {
		checksum = younkfunk
		Name = 'YounkFunk'
		title = qs(0xb01114ba)
		artist = qs(0x00222e06)
		year = 1998
		Duration = 292
		artist_text = $artist_text_by
		original_artist = 1
		venue = 11
		leaderboard = 1
		singer = male
		genre = funk
		countoff = 'sticks_normal'
		drum_kit = 'modernrock'
		double_kick = 0
		overall_song_volume = -0.3
		trivia_no_phrases
		album_title = qs(0x09017740)
		album_img = 'placeholder_album'
		guitar_difficulty_rating = 7
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 0
		drums_difficulty_rating = 8
		band_difficulty_rating = 7
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'younkfunk'
		kick = 'younkfunk'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	apunk = {
		checksum = apunk
		Name = 'APunk'
		title = qs(0x552fe7cd)
		artist = qs(0x7f342f46)
		year = 2008
		Duration = 138
		album_img = 'dlc1'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 8
		leaderboard = 1
		singer = male
		genre = `surf	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -2.0
		album_title = qs(0x7f342f46)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 3
		band_difficulty_rating = 4
		flags = 0
		snare = 'apunk'
		kick = 'apunk'
		tom1 = 'ModernRockHigh'
		tom2 = 'ModernRockHigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	allalongthewatchtower = {
		checksum = allalongthewatchtower
		Name = 'AllAlongTheWatchTower'
		title = qs(0x264df38c)
		artist = qs(0x69af5a49)
		year = 1967
		Duration = 151
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 1
		leaderboard = 1
		singer = male
		genre = `blues	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.3
		mono_drums = 1
		album_title = qs(0xb04e97d4)
		double_kick = 0
		guitar_difficulty_rating = 2
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 1
		band_difficulty_rating = 2
		flags = 0
		snare = 'allalongthewatchtower'
		kick = 'allalongthewatchtower'
		tom1 = 'classicrockhigh'
		tom2 = 'classicrockhigh'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	blueorchid = {
		checksum = blueorchid
		Name = 'BlueOrchid'
		title = qs(0x2a042596)
		artist = qs(0xf6ea648e)
		year = 2005
		Duration = 162
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		venue = 2
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = `blues	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -0.7
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		fake_bass_mode = 1
		album_title = qs(0x9cb44dc4)
		double_kick = 0
		guitar_difficulty_rating = 2
		bass_difficulty_rating = 1
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 1
		band_difficulty_rating = 2
		flags = 0
		snare = 'modernrocklow'
		kick = 'blueorchid'
		tom1 = 'modernrocklow'
		tom2 = 'modernrocklow'
		hihat = 'modernrock'
		cymbal = 'modernrock'
	}
	bulletsbutterfly = {
		checksum = bulletsbutterfly
		Name = 'BulletsButterfly'
		title = qs(0x192a556c)
		artist = qs(0x9fb8944f)
		year = 1995
		Duration = 262
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 9
		leaderboard = 1
		singer = male
		genre = alternative
		countoff = 'sticks_normal'
		drum_kit = 'HeavyRock'
		overall_song_volume = 0.5
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		snare = 'bulletsbutterfly'
		kick = 'bulletsbutterfly'
		tom1 = 'HeavyRocklow'
		tom2 = 'HeavyRocklow'
		hihat = 'HeavyRock'
		cymbal = 'HeavyRock'
		album_title = qs(0x5e65f5ae)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 8
		band_difficulty_rating = 5
		flags = 0
	}
	demon = {
		checksum = demon
		Name = 'Demon'
		title = qs(0x272497a9)
		artist = qs(0x43b6a9a6)
		year = 2007
		Duration = 233
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 13
		leaderboard = 1
		singer = male
		genre = `death	metal`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		album_title = qs(0xb843e5f1)
		double_kick = 1
		guitar_difficulty_rating = 7
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 2
		drums_difficulty_rating = 8
		band_difficulty_rating = 7
		flags = 0
		snare = 'demon'
		kick = 'demon'
		tom1 = 'metallow'
		tom2 = 'metallow'
		hihat = 'metal'
		cymbal = 'metal'
	}
	doyoufeellikewedo = {
		checksum = doyoufeellikewedo
		Name = 'DoYouFeelLikeWeDo'
		title = qs(0xf2d1a3bf)
		artist = qs(0xe7684ac5)
		year = 1976
		Duration = 820
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 13
		leaderboard = 1
		singer = male
		genre = `classic	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.8
		album_title = qs(0x2a1e193f)
		double_kick = 0
		guitar_difficulty_rating = 9
		bass_difficulty_rating = 8
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 3
		band_difficulty_rating = 8
		flags = 0
		snare = 'classicrock'
		kick = 'classicrock'
		tom1 = 'classicrock'
		tom2 = 'classicrocklow'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	donewitheverything = {
		checksum = donewitheverything
		Name = 'DoneWithEverything'
		title = qs(0x0789b335)
		artist = qs(0x066e90ed)
		year = 2008
		Duration = 212
		artist_text = $artist_text_by
		original_artist = 1
		venue = 13
		leaderboard = 1
		singer = male
		genre = `death	metal`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		trivia_no_phrases
		album_title = qs(0xe3faf96d)
		album_img = placeholder_album
		double_kick = 1
		guitar_difficulty_rating = 8
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 1
		drums_difficulty_rating = 9
		band_difficulty_rating = 8
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	duhast = {
		checksum = duhast
		Name = 'DuHast'
		title = qs(0x39c77b0b)
		artist = qs(0x6c4707a5)
		year = 1997
		Duration = 253
		artist_text = $artist_text_by
		original_artist = 1
		venue = 8
		leaderboard = 1
		singer = male
		genre = industrial
		countoff = 'sticks_huge'
		drum_kit = 'classicrock'
		overall_song_volume = -0.5
		album_title = qs(0xb67b3f63)
		double_kick = 0
		album_img = 'placeholder_album'
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 2
		drums_difficulty_rating = 1
		band_difficulty_rating = 4
		flags = 0
		snare = 'DuHast'
		kick = 'DuHast'
		tom1 = 'HeavyRockhigh'
		tom2 = 'HeavyRockhigh'
		hihat = 'HeavyRock'
		cymbal = 'HeavyRock'
	}
	exgirlfriend = {
		checksum = exgirlfriend
		Name = 'ExGirlfriend'
		title = qs(0x73f25838)
		artist = qs(0x83dbb173)
		year = 2000
		Duration = 218
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 3
		leaderboard = 1
		singer = female
		genre = `pop	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -3.5
		album_title = qs(0xc0cc0217)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 6
		band_difficulty_rating = 3
		flags = 0
		snare = 'exgirlfriend'
		kick = 'exgirlfriend'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	lithium = {
		checksum = lithium
		Name = 'Lithium'
		title = qs(0xa035983b)
		artist = qs(0x5a827f81)
		year = 1992
		Duration = 262
		artist_text = $artist_text_by
		original_artist = 1
		venue = 99
		leaderboard = 1
		singer = male
		genre = grunge
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.5
		album_title = qs(0xfcb21864)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 3
		band_difficulty_rating = 3
		flags = 0
		snare = 'lithium'
		kick = 'lithium'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	lovetoken = {
		checksum = lovetoken
		Name = 'LoveToken'
		title = qs(0xb26a215f)
		artist = qs(0xefb85719)
		year = 2008
		Duration = 166
		album_img = 'TheDukeSpirit_Neptune'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 4
		leaderboard = 1
		singer = female
		genre = alternative
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.3
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		album_title = qs(0xe57360c9)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 3
		band_difficulty_rating = 3
		flags = 0
		snare = 'lovetoken'
		kick = 'lovetoken'
		tom1 = 'HeavyRocklow'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	nearlylostyou = {
		checksum = nearlylostyou
		Name = 'NearlyLostYou'
		title = qs(0x71fc087c)
		artist = qs(0x0302f369)
		year = 1992
		Duration = 250
		artist_text = $artist_text_by
		original_artist = 1
		venue = 7
		leaderboard = 1
		singer = male
		genre = grunge
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.3
		album_title = qs(0x756951de)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 6
		band_difficulty_rating = 4
		flags = 0
		snare = 'nearlylostyou'
		kick = 'nearlylostyou'
		tom1 = 'modernrockhigh'
		tom2 = 'modernrockhigh'
		hihat = 'modernrock'
		cymbal = 'modernrock'
	}
	noonetodependon = {
		checksum = noonetodependon
		Name = 'NoOneToDependOn'
		title = qs(0xaaf106d1)
		artist = qs(0xf2712353)
		year = 1993
		Duration = 282
		artist_text = $artist_text_by
		original_artist = 1
		venue = 99
		leaderboard = 1
		singer = male
		genre = `classic	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.8
		album_title = qs(0xcf9d08e0)
		album_img = placeholder_album
		double_kick = 1
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 2
		drums_difficulty_rating = 7
		band_difficulty_rating = 6
		flags = 0
		snare = 'NoOneToDependOn'
		kick = 'NoOneToDependOn'
		tom1 = 'fusionhigh'
		tom2 = 'fusionlow'
		hihat = 'fusion'
		cymbal = 'fusion'
	}
	onebigholiday = {
		checksum = onebigholiday
		Name = 'OneBigHoliday'
		title = qs(0xd940fc3c)
		artist = qs(0x69e3c241)
		year = 2003
		Duration = 326
		album_img = 'MyMorningJacket_ItStillMoves'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 9
		leaderboard = 1
		singer = male
		genre = `indie	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		album_title = qs(0xca5b4184)
		double_kick = 0
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 1
		drums_difficulty_rating = 7
		band_difficulty_rating = 6
		flags = 0
		snare = 'onebigholiday'
		kick = 'onebigholiday'
		tom1 = 'HeavyRocklow'
		tom2 = 'HeavyRocklow'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	onlyhappywhenitrains = {
		checksum = onlyhappywhenitrains
		Name = 'OnlyHappyWhenItRains'
		title = qs(0x987f198d)
		artist = qs(0x134d4360)
		year = 1995
		Duration = 213
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 99
		leaderboard = 1
		singer = female
		genre = `pop	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.8
		album_title = qs(0x134d4360)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 1
		band_difficulty_rating = 3
		flags = 0
		snare = 'onlyhappywhenitrains'
		kick = 'onlyhappywhenitrains'
		tom1 = 'HeavyRocklow'
		tom2 = 'HeavyRocklow'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	playthatfunkymusic = {
		checksum = playthatfunkymusic
		Name = 'PlayThatFunkyMusic'
		title = qs(0xe08c8ce6)
		artist = qs(0xb2e85534)
		year = 1976
		Duration = 307
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 3
		leaderboard = 1
		singer = male
		genre = funk
		countoff = 'sticks_huge'
		drum_kit = 'classicrock'
		overall_song_volume = -0.5
		album_title = qs(0xb2e85534)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		flags = 0
		snare = 'playthatfunkymusic'
		kick = 'playthatfunkymusic'
		tom1 = 'ClassicRocklow'
		tom2 = 'ClassicRockHigh'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	ringoffire = {
		checksum = ringoffire
		Name = 'RingOfFire'
		title = qs(0x740a8d19)
		artist = qs(0x3a825a9b)
		year = 1987
		Duration = 167
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		venue = 99
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = country
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		album_title = qs(0xc5ede802)
		double_kick = 0
		guitar_difficulty_rating = 2
		bass_difficulty_rating = 1
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 3
		band_difficulty_rating = 2
		flags = 0
		snare = 'RingOfFire'
		kick = 'RingOfFire'
		tom1 = 'StandardRock'
		tom2 = 'StandardRocklow'
		hihat = 'StandardRock'
		cymbal = 'StandardRock'
	}
	scatterbrain = {
		checksum = scatterbrain
		Name = 'Scatterbrain'
		title = qs(0xe98b984f)
		artist = qs(0xbc655545)
		year = 2008
		Duration = 275
		artist_text = $artist_text_by
		original_artist = 1
		venue = 13
		leaderboard = 1
		singer = male
		genre = `prog	rock`
		countoff = 'hihat02'
		drum_kit = 'classicrock'
		overall_song_volume = -1.0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 177
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		album_title = qs(0x9aa7fb57)
		album_img = placeholder_album
		double_kick = 1
		guitar_difficulty_rating = 9
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 0
		drums_difficulty_rating = 10
		band_difficulty_rating = 8
		flags = 0
		snare = 'Scatterbrain'
		kick = 'Scatterbrain'
		tom1 = 'FusionHigh'
		tom2 = 'FusionHigh'
		hihat = 'ClassicRock'
		cymbal = 'ClassicRock'
	}
	smellsliketeenspirit = {
		checksum = smellsliketeenspirit
		Name = 'SmellsLikeTeenSpirit'
		title = qs(0x9c0ad8a3)
		artist = qs(0x5a827f81)
		year = 1991
		Duration = 306
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 99
		leaderboard = 1
		singer = male
		genre = grunge
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 2.5
		album_title = qs(0x39664e39)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 4
		band_difficulty_rating = 4
		flags = 0
		snare = 'SmellsLikeTeenSpirit'
		kick = 'SmellsLikeTeenSpirit'
		tom1 = 'heavyrockHigh'
		tom2 = 'heavyrockHigh'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	song2 = {
		checksum = song2
		Name = 'Song2'
		title = qs(0xe1a868ff)
		artist = qs(0x6cbb8858)
		year = 1997
		Duration = 122
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 1
		leaderboard = 1
		singer = male
		genre = alternative
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		album_title = qs(0x6cbb8858)
		double_kick = 0
		guitar_difficulty_rating = 2
		bass_difficulty_rating = 1
		vocals_difficulty_rating = 2
		drums_difficulty_rating = 3
		band_difficulty_rating = 2
		flags = 0
		snare = 'song2'
		kick = 'song2'
		tom1 = 'HeavyRocklow'
		tom2 = 'HeavyRocklow'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	spiritofradio = {
		checksum = spiritofradio
		Name = 'SpiritOfRadio'
		title = qs(0xcec81194)
		artist = qs(0xa19f4f27)
		year = 1980
		Duration = 303
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 13
		leaderboard = 1
		singer = male
		genre = `prog	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.5
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 1
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		album_title = qs(0xbc96927a)
		double_kick = 1
		guitar_difficulty_rating = 9
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 8
		band_difficulty_rating = 8
		flags = 0
		snare = 'spiritofradio'
		kick = 'spiritofradio'
		tom1 = 'HeavyRockhigh'
		tom2 = 'HeavyRockhigh'
		hihat = 'HeavyRock'
		cymbal = 'HeavyRock'
	}
	twentyfirstcentury = {
		checksum = twentyfirstcentury
		Name = 'TwentyFirstCentury'
		title = qs(0x09763d55)
		artist = qs(0x58dbc90d)
		year = 1969
		Duration = 420
		artist_text = $artist_text_by
		original_artist = 1
		venue = 19
		leaderboard = 1
		singer = male
		genre = `prog	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 210
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		album_title = qs(0xe9afbf20)
		double_kick = 1
		album_img = placeholder_album
		guitar_difficulty_rating = 8
		bass_difficulty_rating = 7
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 10
		band_difficulty_rating = 8
		flags = 0
		snare = 'twentyfirstcentury'
		kick = 'twentyfirstcentury'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	twominutestomidnight = {
		checksum = twominutestomidnight
		Name = 'TwoMinutesToMidnight'
		title = qs(0x574b311f)
		artist = qs(0x4365d34b)
		year = 1984
		Duration = 366
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 12
		leaderboard = 1
		singer = male
		genre = metal
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.8
		album_title = qs(0xb878610b)
		double_kick = 0
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 7
		vocals_difficulty_rating = 9
		drums_difficulty_rating = 6
		band_difficulty_rating = 6
		flags = 0
		snare = 'twominutestomidnight'
		kick = 'twominutestomidnight'
		tom1 = 'Metallow'
		tom2 = 'Metallow'
		hihat = 'Metal'
		cymbal = 'ClassicRock'
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
					custom_score_targets = [
						77
						88
						99
					]
				}
			]
			bass = [
				{
					goal_name = 0x65d96f01
				}
			]
			drum = [
				{
					goal_name = 0x74072977
				}
			]
			vocals = [
			]
			Band = [
			]
		}
	}
	womanfromtokyo = {
		checksum = womanfromtokyo
		Name = 'WomanFromTokyo'
		title = qs(0x88efc29f)
		artist = qs(0xff9534b6)
		year = 1999
		Duration = 391
		artist_text = $artist_text_by
		original_artist = 1
		venue = 3
		leaderboard = 1
		singer = male
		genre = `hard	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -0.5
		album_title = qs(0x2ab450c9)
		album_img = placeholder_album
		double_kick = 0
		parts_with_mic = [
			GUITARIST
			BASSIST
		]
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 7
		band_difficulty_rating = 4
		flags = 0
		snare = 'womanfromtokyo'
		kick = 'womanfromtokyo'
		tom1 = 'heavyrockhigh'
		tom2 = 'heavyrockhigh'
		hihat = 'heavyrock'
		cymbal = 'heavyrock'
	}
	yougivelove = {
		checksum = yougivelove
		Name = 'YouGiveLove'
		title = qs(0x7f4c4a37)
		artist = qs(0x166b4344)
		year = 1986
		Duration = 246
		artist_text = $artist_text_by
		original_artist = 1
		venue = 5
		leaderboard = 1
		singer = male
		genre = `hard	rock`
		countoff = 'sticks_normal'
		drum_kit = 'modernrock'
		overall_song_volume = -2.3
		album_title = qs(0x648c99a2)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		flags = 0
		snare = 'yougivelove'
		kick = 'yougivelove'
		tom1 = 'BigRoomRockhigh'
		tom2 = 'BigRoomRockhigh'
		hihat = 'BigRoomRock'
		cymbal = 'BigRoomRock'
	}
}
mt_songlist_props = {
	0xfaa60892 = {
		checksum = 0xfaa60892
		Name = 'MT_andyTHPSdrumduel'
		title = qs(0xe14e2299)
		artist = qs(0xe5a7049a)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		double_kick = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 0
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	0x8f67ea43 = {
		checksum = 0x8f67ea43
		Name = 'MT_Army'
		title = qs(0xadb14aeb)
		artist = qs(0x36773d42)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		vocals_scroll_speed = 1.15
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	0x6e86e8db = {
		checksum = 0x6e86e8db
		Name = 'MT_BeatIt'
		title = qs(0x359536e1)
		artist = qs(0xb17f2906)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		vocals_scroll_speed = 1.15
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	0x49366488 = {
		checksum = 0x49366488
		Name = 'MT_BlueAngel'
		title = qs(0x4402756d)
		artist = qs(0x71ef8e7e)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	0x0681d8da = {
		checksum = 0x0681d8da
		Name = 'MT_CaliforniaGoodTimes'
		title = qs(0x81741f93)
		artist = qs(0xaf4d0d00)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		vocals_scroll_speed = 1.15
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	0x91883b33 = {
		checksum = 0x91883b33
		Name = 'MT_CallMeTheBreeze'
		title = qs(0xfcfde74f)
		artist = qs(0xc8833f48)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	0x58aaeb59 = {
		checksum = 0x58aaeb59
		Name = 'MT_CherryBomb'
		title = qs(0x37cd98fc)
		artist = qs(0xf866495a)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	0x2a89f43b = {
		checksum = 0x2a89f43b
		Name = 'MT_KingWithoutACrown'
		title = qs(0x778984b4)
		artist = qs(0x6e67fcbe)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	0x7af582fa = {
		checksum = 0x7af582fa
		Name = 'MT_LadyFantasy'
		title = qs(0x9f4499ec)
		artist = qs(0x0ec50561)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	0x560354bb = {
		checksum = 0x560354bb
		Name = 'MT_RatRace'
		title = qs(0x83de8e88)
		artist = qs(0xd36aa4e3)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		vocals_scroll_speed = 1.15
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	0x4cda9c0c = {
		checksum = 0x4cda9c0c
		Name = 'MT_SlaveChildren'
		title = qs(0x76541448)
		artist = qs(0x2750bfcf)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		vocals_scroll_speed = 1.15
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	0x298575c2 = {
		checksum = 0x298575c2
		Name = 'MT_StairwayToHeaven'
		title = qs(0x4b1e9c59)
		artist = qs(0xad6a6b81)
		artist_text = $artist_text_by
		original_artist = 1
		year = 1971
		album_title = qs(0xcbeec365)
		singer = male
		genre = `classic	rock`
		leaderboard = 1
		Duration = 482
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	0x0c9cc2b3 = {
		checksum = 0x0c9cc2b3
		Name = 'MT_TheWorldHasTurned'
		title = qs(0x019a37d3)
		artist = qs(0x4b1d2950)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		vocals_scroll_speed = 1.15
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	0xc24b61b7 = {
		checksum = 0xc24b61b7
		Name = 'MT_TheresNoSecrets'
		title = qs(0x69d3e460)
		artist = qs(0x3e6463ce)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		vocals_scroll_speed = 1.15
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	0x334727d5 = {
		checksum = 0x334727d5
		Name = 'MT_StrungOut'
		title = qs(0xfde15c38)
		artist = qs(0x8561c077)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	0x8bfcb83a = {
		checksum = 0x8bfcb83a
		Name = 'MT_ThickBrick'
		title = qs(0x9b7ac09e)
		artist = qs(0x2111a97c)
		artist_text = $artist_text_by
		original_artist = 1
		year = 1972
		album_title = qs(0x89228454)
		singer = male
		genre = `progressive	rock`
		leaderboard = 1
		Duration = 751
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	0x8bf475df = {
		checksum = 0x8bf475df
		Name = 'MT_WhereTheStreets'
		title = qs(0x676a9682)
		artist = qs(0xf16da7e9)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	0xb633f515 = {
		checksum = 0xb633f515
		Name = 'MT_WynonasBeaver'
		title = qs(0x44c96854)
		artist = qs(0xfa891bfc)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 155
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
}
debug_songlist_props = {
	debugtestmixlevels = {
		checksum = debugtestmixlevels
		Name = 'DEBUGTestMixLevels'
		title = qs(0x5d62941f)
		artist = qs(0xfa95e2aa)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 21
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	debugautofacial = {
		checksum = debugautofacial
		Name = 'DebugAutoFacial'
		title = qs(0x659a48af)
		artist = qs(0xfa95e2aa)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 21
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	debugbrokenchord = {
		checksum = debugbrokenchord
		Name = 'DebugBrokenChord'
		title = qs(0xd99e5e2c)
		artist = qs(0x0978b483)
		year = 2009
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		flags = 0
		snare = 'classicrock'
		kick = 'classicrock'
		tom1 = 'classicrock'
		tom2 = 'classicrock'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	debug_bandmoment = {
		checksum = debug_bandmoment
		Name = 'Debug_BandMoment'
		title = qs(0xe391fa17)
		artist = qs(0x45ff4cc0)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 200
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'sticks_normal'
		overall_song_volume = 0.0
	}
	debugchaltest1 = {
		checksum = debugchaltest1
		Name = 'DebugChalTest1'
		title = qs(0xee02c4ca)
		artist = qs(0x7514eafa)
		year = 1975
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		flags = 0
		snare = 'classicrock'
		kick = 'classicrock'
		tom1 = 'classicrock'
		tom2 = 'classicrock'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	debugkicksustaintest = {
		checksum = debugkicksustaintest
		Name = 'debugkicksustaintest'
		title = qs(0x81b01f18)
		artist = qs(0x65b52fb3)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 76
		flags = 0
		double_kick = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	debugnobass = {
		checksum = debugnobass
		Name = 'DebugNoBass'
		title = qs(0x3561e8ac)
		artist = qs(0xb09f2ddc)
		year = 1982
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = punk
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.2
		album_title = qs(0xd19bcddf)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 0
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		flags = 0
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	debugnodrums = {
		checksum = debugnodrums
		Name = 'DebugNoDrums'
		title = qs(0x31c403c5)
		artist = qs(0xb09f2ddc)
		year = 1982
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = punk
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.2
		album_title = qs(0xd19bcddf)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 0
		band_difficulty_rating = 3
		flags = 0
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	debugnoguitar = {
		checksum = debugnoguitar
		Name = 'DebugNoGuitar'
		title = qs(0x521279ab)
		artist = qs(0xb09f2ddc)
		year = 1982
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = punk
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.2
		album_title = qs(0xd19bcddf)
		double_kick = 0
		guitar_difficulty_rating = 0
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		flags = 0
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	debugnovocals = {
		checksum = debugnovocals
		Name = 'DebugNoVocals'
		title = qs(0xdc89af65)
		artist = qs(0xb09f2ddc)
		year = 1982
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = punk
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.2
		album_title = qs(0xd19bcddf)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 0
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		flags = 0
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	debugnotetypetest = {
		checksum = debugchaltest1
		Name = 'DebugNoteTypeTest'
		title = qs(0xc875ca68)
		artist = qs(0x7514eafa)
		year = 1975
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 1
		flags = 0
		snare = 'classicrock'
		kick = 'classicrock'
		tom1 = 'classicrock'
		tom2 = 'classicrock'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	debugchaltest3 = {
		checksum = debugchaltest3
		Name = 'DebugChalTest3'
		title = qs(0xdc34a648)
		artist = qs(0x7514eafa)
		year = 1975
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 2
		flags = 0
		snare = 'classicrock'
		kick = 'classicrock'
		tom1 = 'classicrock'
		tom2 = 'classicrock'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	debugcymbalswell = {
		checksum = debugcymbalswell
		Name = 'DebugCymbalswell'
		title = qs(0x50fcb39b)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 170
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	debugcymbalswelltest2 = {
		checksum = debugcymbalswelltest2
		Name = 'DebugCymbalswelltest2'
		title = qs(0x2081f01c)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 92
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	debugchaltest5 = {
		checksum = debugchaltest5
		Name = 'DebugChalTest5'
		title = qs(0x8a6e01ce)
		artist = qs(0x7514eafa)
		year = 1975
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 3
		flags = 0
		snare = 'classicrock'
		kick = 'classicrock'
		tom1 = 'classicrock'
		tom2 = 'classicrock'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	debugdownextsust = {
		checksum = debugdownextsust
		Name = 'DebugDownExtSust'
		title = qs(0xd64fef8d)
		artist = qs(0x0a932d91)
		year = 2009
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 3
		flags = 0
		snare = 'classicrock'
		kick = 'classicrock'
		tom1 = 'classicrock'
		tom2 = 'classicrock'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	debugvolband = {
		checksum = debugvolband
		Name = 'DebugVolBand'
		title = qs(0xcf7e5ae9)
		artist = qs(0xcf7e5ae9)
		year = 1981
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 1
		flags = 0
		snare = 'HeavyRock'
		kick = 'HeavyRock'
		tom1 = 'HeavyRock'
		tom2 = 'HeavyRock'
		hihat = 'HeavyRock'
		cymbal = 'HeavyRock'
	}
	debugvolbass = {
		checksum = debugvolbass
		Name = 'DebugVolBass'
		title = qs(0x688e513d)
		artist = qs(0x688e513d)
		year = 1981
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 2
		flags = 0
	}
	debugvolcrowd = {
		checksum = debugvolcrowd
		Name = 'DebugVolCrowd'
		title = qs(0x9195e7b0)
		artist = qs(0x9195e7b0)
		year = 1981
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 3
		flags = 0
	}
	debugvoldrumcymbal = {
		checksum = debugvoldrumcymbal
		Name = 'DebugVolDrumCymbal'
		title = qs(0x9bde5703)
		artist = qs(0x9bde5703)
		year = 1981
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 4
		flags = 0
	}
	debugvoldrumkick = {
		checksum = debugvoldrumkick
		Name = 'DebugVolDrumKick'
		title = qs(0x7d1ce3cb)
		artist = qs(0x7d1ce3cb)
		year = 1981
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 5
		flags = 0
	}
	debugvoldrumsnare = {
		checksum = debugvoldrumsnare
		Name = 'DebugVolDrumSnare'
		title = qs(0x57e22ea2)
		artist = qs(0x57e22ea2)
		year = 1981
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 6
		flags = 0
	}
	debugvoldrumtom = {
		checksum = debugvoldrumtom
		Name = 'DebugVolDrumTom'
		title = qs(0x35b73622)
		artist = qs(0x35b73622)
		year = 1981
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 7
		flags = 0
	}
	debugvolguitar = {
		checksum = debugvolguitar
		Name = 'DebugVolGuitar'
		title = qs(0x515df89f)
		artist = qs(0x515df89f)
		year = 1981
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 8
		flags = 0
	}
	debugvolvocals = {
		checksum = debugvolvocals
		Name = 'DebugVolVocals'
		title = qs(0xdfc62e51)
		artist = qs(0xdfc62e51)
		year = 1981
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 9
		flags = 0
	}
	debugvoxlag = {
		checksum = debugvoxlag
		Name = 'DebugVoxLag'
		title = qs(0xbd036b75)
		artist = qs(0xbd036b75)
		year = 1981
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		exit_Script = testtoneexitscript
		overall_song_volume = 0.0
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 9
		flags = 0
	}
	placeholdersong = {
		checksum = tenseconddebug
		Name = 'tenseconddebug'
		title = qs(0x53c97f91)
		artist = qs(0xe88aeb6f)
		year = 2007
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		never_show_in_setlist
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	debugtesttones = {
		checksum = debugtesttones
		Name = 'DebugTestTones'
		title = qs(0xa16fa3dc)
		artist = qs(0x0a932d91)
		year = 2007
		artist_text = $artist_text_as_made_famous_by
		original_artist = 0
		leaderboard = 0
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		exit_Script = testtoneexitscript
		saved_in_globaltags = 0
		allowed_in_random = 0
		genre = pop
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	debugsync = {
		checksum = debugsync
		Name = 'DebugSync'
		title = qs(0xf2094301)
		artist = qs(0x0a932d91)
		year = 2007
		artist_text = $artist_text_as_made_famous_by
		original_artist = 0
		leaderboard = 0
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		saved_in_globaltags = 0
		allowed_in_quickplay = 0
		genre = pop
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	debugsyncplaytoaudio = {
		checksum = debugsyncplaytoaudio
		Name = 'DebugSyncPlayToAudio'
		title = qs(0x2d376c86)
		artist = qs(0x0a932d91)
		year = 2007
		artist_text = $artist_text_as_made_famous_by
		original_artist = 0
		leaderboard = 0
		exit_Script = Audio_Sync_Test_Enable_Highway
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		saved_in_globaltags = 0
		allowed_in_quickplay = 0
		genre = pop
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	debugsyncaudiovisual = {
		checksum = debugsyncaudiovisual
		Name = 'DebugSyncAudioVisual'
		title = qs(0x021f9fda)
		artist = qs(0x0a932d91)
		year = 2007
		artist_text = $artist_text_as_made_famous_by
		original_artist = 0
		leaderboard = 0
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		saved_in_globaltags = 0
		allowed_in_quickplay = 0
		genre = pop
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	debugsyncmuting = {
		checksum = debugsyncmuting
		Name = 'DebugSyncMuting'
		title = qs(0xa9342d6b)
		artist = qs(0x0a932d91)
		year = 2007
		artist_text = $artist_text_as_made_famous_by
		original_artist = 0
		leaderboard = 0
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		saved_in_globaltags = 0
		allowed_in_quickplay = 0
		genre = pop
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	debugtensecond = {
		checksum = debugtensecond
		Name = 'DebugTenSecond'
		title = qs(0x4283fd73)
		artist = qs(0x0a932d91)
		year = 2007
		artist_text = $artist_text_as_made_famous_by
		original_artist = 0
		leaderboard = 0
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		genre = pop
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	debugelevensecond = {
		checksum = debugelevensecond
		Name = 'DebugElevenSecond'
		title = qs(0x77784ccb)
		artist = qs(0x0a932d91)
		year = 2007
		artist_text = $artist_text_as_made_famous_by
		original_artist = 0
		leaderboard = 0
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		genre = pop
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	debugtwelvesecond = {
		checksum = debugtwelvesecond
		Name = 'DebugTwelveSecond'
		title = qs(0x086a524a)
		artist = qs(0x0a932d91)
		year = 2007
		artist_text = $artist_text_as_made_famous_by
		original_artist = 0
		leaderboard = 0
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		genre = pop
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	debugdrumstreamtest = {
		checksum = debugdrumstreamtest
		Name = 'DebugDrumStreamTest'
		title = qs(0xfc7f3df9)
		artist = qs(0x0a932d91)
		year = 2007
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'hihat01'
		drum_kit = 'heavyrock'
		saved_in_globaltags = -2
		allowed_in_random = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	z_cavestagetran = {
		checksum = z_cavestagetran
		Name = 'z_CaveStageTran'
		title = qs(0x23059259)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 5
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	0x49ba803c = {
		checksum = 0x49ba803c
		Name = 'z_ConanStageTran'
		title = qs(0x08bbca15)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 5
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	z_egypttran = {
		checksum = z_egypttran
		Name = 'z_EgyptTran'
		title = qs(0xe319faa8)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 5
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	z_epicstagetran = {
		checksum = z_epicstagetran
		Name = 'z_EpicStageTran'
		title = qs(0x13db9a26)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 5
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	z_festivaltran = {
		checksum = z_festivaltran
		Name = 'z_FestivalTran'
		title = qs(0x3c91fb3d)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 5
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	z_housebandtran = {
		checksum = z_housebandtran
		Name = 'z_HouseBandTran'
		title = qs(0x16ad8246)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 5
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	z_mansionstudiotran = {
		checksum = z_mansionstudiotran
		Name = 'z_MansionStudioTran'
		title = qs(0x8e2e5d77)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 5
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	z_punkstagetran = {
		checksum = z_punkstagetran
		Name = 'z_PunkStageTran'
		title = qs(0x6421e29d)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 5
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
	z_riothousetran = {
		checksum = z_riothousetran
		Name = 'z_RiotHouseTran'
		title = qs(0x21f2944b)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		Duration = 5
		flags = 0
		double_kick = 0
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		snare = 'ModernRock'
		kick = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		countoff = 'Sticks_Normal'
		overall_song_volume = 0.0
	}
}
tutorial_songlist_props = {
	tut_bass_open = {
		checksum = tut_bass_open
		Name = 'Tut_Bass_Open'
		title = qs(0x84f07896)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_drums_accent = {
		checksum = tut_drums_accent
		Name = 'Tut_Drums_Accent'
		title = qs(0xf673b4b1)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_drums_basicbeat = {
		checksum = tut_drums_basicbeat
		Name = 'Tut_Drums_Basicbeat'
		title = qs(0x2d56e699)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_drums_doublekick = {
		checksum = tut_drums_doublekick
		Name = 'Tut_Drums_Doublekick'
		title = qs(0x4a1b4f00)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_drums_easy = {
		checksum = tut_drums_easy
		Name = 'Tut_Drums_Easy'
		title = qs(0xf7dc09a6)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_drums_fill = {
		checksum = tut_drums_fill
		Name = 'Tut_Drums_Fill'
		title = qs(0xaacf2df5)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_drums_freeform = {
		checksum = tut_drums_freeform
		Name = 'Tut_Drums_Freeform'
		title = qs(0x75bd16b0)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_drums_kick = {
		checksum = tut_drums_kick
		Name = 'Tut_Drums_Kick'
		title = qs(0x26e8beb5)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_drums_roll = {
		checksum = tut_drums_roll
		Name = 'Tut_Drums_Roll'
		title = qs(0x8467f139)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_drums_sp = {
		checksum = tut_drums_sp
		Name = 'Tut_Drums_Sp'
		title = qs(0x8aeeb022)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_drums_swell = {
		checksum = tut_drums_swell
		Name = 'Tut_Drums_Swell'
		title = qs(0x6ae5ff94)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_guitar_altstrum = {
		checksum = tut_guitar_altstrum
		Name = 'Tut_Guitar_Altstrum'
		title = qs(0x102c4dba)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_guitar_chords = {
		checksum = tut_guitar_chords
		Name = 'Tut_Guitar_Chords'
		title = qs(0x6fd799de)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_guitar_extended = {
		checksum = tut_guitar_extended
		Name = 'Tut_Guitar_Extended'
		title = qs(0x289c6356)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_guitar_fretting = {
		checksum = tut_guitar_fretting
		Name = 'Tut_Guitar_Fretting'
		title = qs(0x217bac85)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_guitar_g_only = {
		checksum = tut_guitar_g_only
		Name = 'Tut_Guitar_G_Only'
		title = qs(0x54c75b33)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_guitar_gry = {
		checksum = tut_guitar_gry
		Name = 'Tut_Guitar_Gry'
		title = qs(0xee0837dc)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_guitar_hammeron = {
		checksum = tut_guitar_hammeron
		Name = 'Tut_Guitar_Hammeron'
		title = qs(0x76e38084)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_guitar_high_note = {
		checksum = tut_guitar_high_note
		Name = 'Tut_Guitar_High_Note'
		title = qs(0x014de692)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_guitar_hopochords = {
		checksum = tut_guitar_hopochords
		Name = 'Tut_Guitar_Hopochords'
		title = qs(0x43e6d869)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_guitar_pulloff = {
		checksum = tut_guitar_pulloff
		Name = 'Tut_Guitar_Pulloff'
		title = qs(0xa2ad5a56)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_guitar_sp = {
		checksum = tut_guitar_sp
		Name = 'Tut_Guitar_Sp'
		title = qs(0x0d08bf76)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_guitar_sp_sustains = {
		checksum = tut_guitar_sp_sustains
		Name = 'Tut_Guitar_Sp_Sustains'
		title = qs(0xa0de9dce)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_guitar_sustains = {
		checksum = tut_guitar_sustains
		Name = 'Tut_Guitar_Sustains'
		title = qs(0x211845cb)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_guitar_tapping = {
		checksum = tut_guitar_tapping
		Name = 'Tut_Guitar_Tapping'
		title = qs(0xa86fbc7f)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_vox_blank = {
		checksum = tut_vox_blank
		Name = 'Tut_Vox_Blank'
		title = qs(0x142f6520)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		count_in_min_blank_ms = 10000000
		count_in_duration_ms = 0
		flags = 0
	}
	tut_vox_freeform = {
		checksum = tut_vox_freeform
		Name = 'Tut_Vox_Freeform'
		title = qs(0x443c798f)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_vox_held = {
		checksum = tut_vox_held
		Name = 'Tut_Vox_Held'
		title = qs(0x3328e041)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_vox_spoken = {
		checksum = tut_vox_spoken
		Name = 'Tut_Vox_Spoken'
		title = qs(0x5c95d734)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		flags = 0
	}
	tut_vox_tw = {
		checksum = tut_vox_tw
		Name = 'Tut_Vox_Tw'
		title = qs(0x7fbfe360)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		count_in_min_blank_ms = 10000000
		flags = 0
	}
	tut_vox_tw_short = {
		checksum = tut_vox_tw_short
		Name = 'Tut_Vox_Tw_Short'
		title = qs(0xaa675f4c)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		count_in_min_blank_ms = 10000000
		flags = 0
	}
	tut_vox_tw_sp = {
		checksum = tut_vox_tw_sp
		Name = 'Tut_Vox_Tw_SP'
		title = qs(0x46fc7e7e)
		artist = qs(0xae0e9bcf)
		year = 2009
		artist_text = $artist_text_by
		original_artist = 1
		leaderboard = 0
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		allowed_in_quickplay = 0
		saved_in_globaltags = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		count_in_min_blank_ms = 10000000
		flags = 0
	}
}
