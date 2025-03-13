on_disc_list = gh6_songlist
on_disc_props = gh6_songlist_props
gh_songlist = [
	{
		list = gh6_songlist
		props = gh6_songlist_props
		frontend_desc = qs(0xc68df46a)
		crc = gh6
		icon = icon_gh6
		encryption_type = 6
	}
	{
		list = gh6_dlc_songlist
		props = gh6_dlc_songlist_props
		frontend_desc = qs(0x60679f40)
		crc = gh6_dlc
		icon = icon_dlc
		encryption_type = 6
	}
	{
		list = gh5_0_songlist
		props = gh5_0_songlist_props
		frontend_desc = qs(0x8fa4c515)
		crc = gh5
		icon = icon_gh5
	}
	{
		list = gh5_dlc_songlist
		props = gh5_dlc_songlist_props
		frontend_desc = qs(0x60679f40)
		crc = gh5_dlc
		icon = icon_dlc
	}
	{
		list = gh4_songlist
		props = gh4_songlist_props
		frontend_desc = qs(0x8e7c9c19)
		crc = gh4
		icon = icon_ghwt
	}
	{
		list = gh4_dlc_songlist
		props = gh4_dlc_songlist_props
		frontend_desc = qs(0x60679f40)
		crc = gh4_dlc
		icon = icon_dlc
	}
	{
		list = gh4_1_songlist
		props = gh4_1_songlist_props
		frontend_desc = qs(0xbb9eb8e5)
		crc = gh4_1
		icon = icon_ghm
	}
	{
		list = gh4_2_songlist
		props = gh4_2_songlist_props
		frontend_desc = qs(0x636cc2e9)
		frontend_desc_eu = qs(0x44268c08)
		crc = gh4_2
		icon = icon_ghsh
	}
	{
		list = gh4_3_songlist
		props = gh4_3_songlist_props
		frontend_desc = qs(0x8c15a2a7)
		crc = gh4_3
		icon = icon_ghvh
	}
	{
		list = gh5_1_songlist
		props = gh5_1_songlist_props
		frontend_desc = qs(0xbd6ede51)
		crc = gh5_1
		icon = icon_bh
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
	$additional_songlist_props
	$jammode_songlist_props
	$example_jam_songlist_props
	$jamsession_songlist_props
}
gh6_demo_kiosk_songlist = [
	bloodlines
	childrenofthegrave
	ghost
	nowayback
]
gh6_demo_xbla_songlist = [
	bloodlines
	childrenofthegrave
	ghost
	nowayback
]
gh6_songlist = [
	again
	aqualung
	batcountry
	beencaughtstealing
	blackrain
	blackwidow
	bleeditout
	bloodlines
	bodies
	bohemianrhapsody
	burn
	burninforyou
	calling
	callmethebreeze
	chemicalwarfare
	cherrybomb
	childrenofthegrave
	cryin
	dancedance
	dancingthroughsunday
	deadfall
	fascinationstreet
	feelgooddrag
	feelslikethefirsttime
	fortunateson
	freeride
	furyofthestorm
	getfree
	ghost
	graduate
	hardtosee
	holywars
	howyouremindme
	iknowwhatiam
	imbroken
	imnotok
	indians
	interstatelovesong
	itsonlyanotherparsec
	jetcitywoman
	lasso
	listentoherheart
	losingmyreligion
	lovegun
	lunaticfringe
	machinehead
	moderndaycowboy
	moneyfornothing
	motivation
	moveitonover
	nemesis
	nomoremrniceguy
	nosecretsthisyear
	nowayback
	paranoid
	poursomesugaronme
	prepareforwar
	psychosocial
	ravenous
	reignition
	renegade
	rockinamerica
	rockininthefreeworld
	rush2112p1
	rush2112p2
	rush2112p3
	rush2112p4
	rush2112p5
	rush2112p6
	rush2112p7
	savior
	scumbagblues
	selfesteemgh6
	settingfire
	sevennationarmy
	sharpdressedman
	slowhands
	speeding
	spiderman
	straycatblues
	suddendeath
	suffocate
	theoutsider
	thisdaywefight
	ticktickboom
	tiesthatbind
	tonesofhome
	unskinnybop
	uprising
	waidmannsheil
	werenotgonnatakeit
	whatdoiget
	wish
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
	suddendeathgh6career
	z_cavestagetran
	z_egypttran
	z_epicstagetran
	z_festivaltran
	z_festivaltran
	z_housebandtran
	z_mansionstudiotran
	z_punkstagetran
	z_riothousetran
	z_barbariantran
]
old_ondisc_songlist = [
]
mt_songlist = [
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
jamsession_songlist_props = {
	jamsession = {
		checksum = jamsession
		name = 'jamsession'
		title = qs(0xab6a4722)
		artist = qs(0x4194c91d)
		year = 2010
		year_num = 2010
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
g_quest_unlock_description_text = qs(0x45c018e3)
g_quickplay_unlock_description_text = qs(0x6d1c2e74)
gh6_songlist_props = {
	again = {
		allowed_in_quickplay = 1
		artist = qs(0x68500434)
		checksum = again
		duration = 191
		genre = `modern rock`
		name = 'Again'
		singer = female
		title = qs(0xc37dc19a)
		year = 2009
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 4
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'again'
		snare = 'again'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
				}
				{
					goal_name = qp_alt_strum
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_blue_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_red_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						15000
						30000
						45000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	aqualung = {
		allowed_in_quickplay = 1
		artist = qs(0x2111a97c)
		checksum = aqualung
		duration = 392
		genre = `classic rock`
		name = 'Aqualung'
		singer = male
		title = qs(0x0802a3e4)
		year = 1971
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 6
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 165
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'aqualung'
		snare = 'aqualung'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.5
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_alt_strum
					custom_score_targets = [
						45
						53
						57
					]
					desc_txt_override = qs(0xd1846aa6)
					watched_sections = [
						3
						8
						11
						13
					]
				}
				{
					goal_name = qp_spower_banked
					static_targets = [
						300
						350
						425
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
					static_targets = [
						100
						250
						400
					]
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
					goal_name = qp_score_spower
					static_targets = [
						15000
						30000
						40000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	batcountry = {
		allowed_in_quickplay = 1
		artist = qs(0x587455fd)
		checksum = batcountry
		duration = 313
		genre = metal
		name = 'BatCountry'
		singer = male
		title = qs(0xba14bff6)
		year = 2005
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 9
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'batcountry'
		snare = 'batcountry'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.5
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
					goal_name = qp_score_spower
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					static_targets = [
						200
						500
						600
					]
					desc_txt_override = qs(0x5e9fa95a)
					watched_sections = [
						2
						3
						9
						12
						16
						17
						20
						21
						22
						24
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	beencaughtstealing = {
		allowed_in_quickplay = 1
		artist = qs(0x7076a57b)
		checksum = beencaughtstealing
		duration = 206
		genre = alternative
		name = 'BeenCaughtStealing'
		singer = male
		title = qs(0xef36d24d)
		year = 1990
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 6
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'beencaughtstealing'
		snare = 'beencaughtstealing'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.8
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
				}
				{
					goal_name = qp_hit_notes
					custom_score_targets = [
						14
						18
						19
					]
					desc_txt_override = qs(0x36809154)
					watched_sections = [
						6
						8
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	blackrain = {
		allowed_in_quickplay = 1
		artist = qs(0x9cf2249b)
		checksum = blackrain
		duration = 268
		genre = grunge
		name = 'BlackRain'
		singer = male
		title = qs(0x8dd94867)
		year = 2010
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 4
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'blackrain'
		snare = 'blackrain'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 1.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_sustain_time
				}
				{
					goal_name = qp_spower_banked
					static_targets = [
						200
						250
						300
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_hopos
					static_targets = [
						25
						70
						160
					]
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_drum_accents
					static_targets = [
						50
						70
						90
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	blackwidow = {
		allowed_in_quickplay = 1
		artist = qs(0x82af89fb)
		checksum = blackwidow
		duration = 445
		genre = `speed metal`
		name = 'BlackWidow'
		singer = male
		title = qs(0xdfd15dee)
		year = 2007
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 7
		vocals_difficulty_rating = 0
		drums_difficulty_rating = 7
		band_difficulty_rating = 8
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 300
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'StandardRock'
		drum_kit = 'StandardRock'
		hihat = 'StandardRock'
		kick = 'blackwidow'
		snare = 'blackwidow'
		tom1 = 'StandardRock'
		tom2 = 'StandardRock'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
					static_targets = [
						300000
						450000
						600000
					]
				}
				{
					goal_name = qp_hit_taps
				}
				{
					goal_name = qp_streak_notes
					static_targets = [
						200
						300
						400
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						40000
						70000
						100000
					]
				}
				{
					goal_name = qp_streak_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_red_notes
				}
				{
					goal_name = qp_kick_notes
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_banked_band
				}
			]
		}
	}
	bleeditout = {
		allowed_in_quickplay = 1
		artist = qs(0xc49d5080)
		checksum = bleeditout
		duration = 164
		genre = `nu metal`
		name = 'BleedItOut'
		singer = male
		title = qs(0x846d42b8)
		year = 2007
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 2
		drums_difficulty_rating = 3
		band_difficulty_rating = 3
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'bleeditout'
		snare = 'bleeditout'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.8
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
				}
				{
					goal_name = qp_streak_notes
					static_targets = [
						100
						250
						450
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
					static_targets = [
						150
						250
						350
					]
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_hit_notes_band
				}
			]
		}
	}
	bloodlines = {
		allowed_in_quickplay = 1
		artist = qs(0x50e0d803)
		checksum = bloodlines
		duration = 220
		genre = `death metal`
		name = 'Bloodlines'
		singer = male
		title = qs(0xedf779e4)
		year = 2009
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 2
		drums_difficulty_rating = 9
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'Metal'
		drum_kit = 'Metal'
		hihat = 'Metal'
		kick = 'bloodlines'
		snare = 'bloodlines'
		tom1 = 'Metal'
		tom2 = 'Metal'
		overall_song_volume = -1.8
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_green_notes
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
					goal_name = qp_score_spower
				}
				{
					goal_name = qp_open_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_drum_accents
					static_targets = [
						60
						90
						120
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	bodies = {
		allowed_in_quickplay = 1
		artist = qs(0x507958da)
		checksum = bodies
		duration = 201
		genre = `nu metal`
		name = 'Bodies'
		singer = male
		title = qs(0x9877629f)
		year = 2001
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 5
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'bodies'
		snare = 'bodies'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.4
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
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
					goal_name = qp_streak_notes
					static_targets = [
						200
						300
						400
					]
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
					goal_name = qp_spoken_notes
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	bohemianrhapsody = {
		allowed_in_quickplay = 1
		artist = qs(0x0b0a8b8a)
		checksum = bohemianrhapsody
		duration = 355
		genre = `classic rock`
		name = 'BohemianRhapsody'
		singer = male
		title = qs(0xeaa4d31d)
		year = 1975
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 3
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 115
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'bohemianrhapsody'
		snare = 'bohemianrhapsody'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.2
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_rockout_time
					watched_sections = [
						9
						11
					]
					desc_txt_override = qs(0x60d66ab2)
					static_targets = [
						6000
						10000
						15000
					]
				}
				{
					goal_name = qp_hit_chords
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					desc_txt_override = qs(0x5e9fa95a)
					watched_times = [
						154300
						157600
						179500
						184500
						194230
						197400
						207530
						213100
						219430
						221030
						223000
						224170
						225400
						230460
						232760
						235160
						237100
						261500
						347760
						348000
					]
					static_targets = [
						120
						160
						180
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						20000
						40000
						60000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_spower_band
				}
			]
		}
	}
	burn = {
		allowed_in_quickplay = 1
		artist = qs(0xff9534b6)
		checksum = burn
		duration = 378
		genre = `hard rock`
		name = 'Burn'
		singer = male
		title = qs(0x33c2beef)
		year = 2004
		guitar_difficulty_rating = 8
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 7
		band_difficulty_rating = 7
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 140
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'burn'
		snare = 'burn'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 2.5
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
					static_targets = [
						200000
						300000
						400000
					]
				}
				{
					goal_name = qp_hit_taps
					static_targets = [
						150
						250
						375
					]
				}
				{
					goal_name = qp_sustain_time
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
					goal_name = qp_red_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_spower_band
				}
			]
		}
	}
	burninforyou = {
		allowed_in_quickplay = 1
		artist = qs(0xbe2243c6)
		checksum = burninforyou
		duration = 270
		genre = `classic rock`
		name = 'BurninForYou'
		singer = male
		title = qs(0x6d4bd92e)
		year = 1993
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 3
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'burninforyou'
		snare = 'burninforyou'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					watched_times = [
						149100
						154000
						170060
						206400
						216260
						221400
						230700
						235000
						238060
						242000
						245000
						249260
					]
					static_targets = [
						75
						150
						250
					]
					desc_txt_override = qs(0x5e9fa95a)
				}
				{
					goal_name = qp_streak_notes
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spower_banked
					static_targets = [
						200
						250
						300
					]
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					watched_times = [
						14000
						28000
						54700
						56430
						95700
						109560
						136330
						138100
						157860
						159600
						204000
						205730
						224000
						227130
						247660
						248500
						261260
						262800
					]
					desc_txt_override = qs(0x5e9fa95a)
					static_targets = [
						160
						200
						250
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	calling = {
		allowed_in_quickplay = 1
		artist = qs(0xfde15c38)
		checksum = calling
		duration = 248
		genre = `modern rock`
		name = 'Calling'
		singer = male
		title = qs(0x8561c077)
		year = 2007
		guitar_difficulty_rating = 9
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 8
		band_difficulty_rating = 8
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'calling'
		snare = 'calling'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.4
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_taps
					static_targets = [
						75
						100
						125
					]
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
					goal_name = qp_kick_notes
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_spower_band
				}
			]
		}
	}
	callmethebreeze = {
		allowed_in_quickplay = 1
		artist = qs(0xd8375309)
		checksum = callmethebreeze
		duration = 330
		genre = `southern rock`
		name = 'CallMeTheBreeze'
		singer = male
		title = qs(0x90825f21)
		year = 1976
		guitar_difficulty_rating = 8
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 6
		band_difficulty_rating = 7
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 300
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		cymbal = 'ClassicRock'
		drum_kit = 'ClassicRock'
		hihat = 'ClassicRock'
		kick = 'callmethebreeze'
		snare = 'callmethebreeze'
		tom1 = 'ClassicRock'
		tom2 = 'ClassicRock'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
					custom_score_targets = [
						70
						80
						87
					]
				}
				{
					goal_name = qp_hit_notes
					watched_sections = [
						3
						5
					]
					static_targets = [
						75
						100
						125
					]
					desc_txt_override = qs(0x36809154)
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
					goal_name = qp_streak_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_drum_accents
					static_targets = [
						80
						120
						150
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_banked_band
				}
			]
		}
	}
	chemicalwarfare = {
		allowed_in_quickplay = 1
		artist = qs(0xb6d045b1)
		checksum = chemicalwarfare
		duration = 361
		genre = metal
		name = 'ChemicalWarfare'
		singer = male
		title = qs(0x5f4d3ce6)
		year = 1984
		guitar_difficulty_rating = 9
		bass_difficulty_rating = 9
		vocals_difficulty_rating = 2
		drums_difficulty_rating = 9
		band_difficulty_rating = 8
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'chemicalwarfare'
		snare = 'chemicalwarfare'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
					static_targets = [
						200000
						300000
						400000
					]
				}
				{
					goal_name = qp_hit_notes
					custom_score_targets = [
						12
						15
						15
					]
					desc_txt_override = qs(0x6bbfd351)
					watched_sections = [
						12
						13
						14
						18
					]
				}
				{
					goal_name = qp_alt_strum
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_open_notes
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
					goal_name = qp_spoken_notes
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_hit_notes_band
				}
			]
		}
	}
	cherrybomb = {
		allowed_in_quickplay = 1
		artist = qs(0x8230ab98)
		checksum = cherrybomb
		duration = 154
		genre = rock
		name = 'CherryBomb'
		singer = female
		title = qs(0x37cd98fc)
		year = 2010
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 5
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 150
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'cherrybomb'
		snare = 'cherrybomb'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
				}
				{
					goal_name = qp_rockout_time
					static_targets = [
						6000
						9000
						12000
					]
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
					goal_name = qp_green_notes
					static_targets = [
						100
						200
						300
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	childrenofthegrave = {
		allowed_in_quickplay = 1
		artist = qs(0x775257ff)
		checksum = childrenofthegrave
		duration = 277
		genre = metal
		name = 'ChildrenOfTheGrave'
		singer = male
		title = qs(0x6b01b5b0)
		year = 1971
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 7
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 300
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		cymbal = 'ClassicRock'
		drum_kit = 'ClassicRock'
		hihat = 'ClassicRock'
		kick = 'childrenofthegrave'
		snare = 'childrenofthegrave'
		tom1 = 'ClassicRock'
		tom2 = 'ClassicRock'
		overall_song_volume = -3.7
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_hopos
				}
				{
					goal_name = qp_sustain_time
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_hopos
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_kick_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	cryin = {
		allowed_in_quickplay = 1
		artist = qs(0x40511ee2)
		checksum = cryin
		duration = 321
		genre = `blues rock`
		name = 'Cryin'
		singer = male
		title = qs(0x3fea1f03)
		year = 1993
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 2
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'cryin'
		snare = 'cryin'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.2
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_sustain_time
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
					goal_name = qp_sustain_time
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
					goal_name = qp_score_spower
					static_targets = [
						18000
						32000
						45000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	dancedance = {
		allowed_in_quickplay = 1
		artist = qs(0x18afd871)
		checksum = dancedance
		duration = 184
		genre = `pop rock`
		name = 'DanceDance'
		singer = male
		title = qs(0xac6d0d7b)
		year = 2005
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 4
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'dancedance'
		snare = 'dancedance'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -6.1
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						28000
						40000
						80000
					]
				}
				{
					goal_name = qp_rockout_time
					static_targets = [
						8000
						10000
						12000
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
					goal_name = qp_hit_notes
					static_targets = [
						100
						160
						240
					]
					desc_txt_override = qs(0x5e9fa95a)
					watched_times = [
						0
						31433
						83832
						92233
						134066
						138066
						163500
						180266
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	dancingthroughsunday = {
		allowed_in_quickplay = 1
		artist = qs(0x9aaf0c89)
		checksum = dancingthroughsunday
		duration = 148
		genre = rock
		name = 'DancingThroughSunday'
		singer = male
		title = qs(0xe4f65b8f)
		year = 2003
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 7
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'HeavyRock'
		drum_kit = 'HeavyRock'
		hihat = 'HeavyRock'
		kick = 'dancingthroughsunday'
		snare = 'dancingthroughsunday'
		tom1 = 'HeavyRock'
		tom2 = 'HeavyRock'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_taps
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
					goal_name = qp_open_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_kick_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spoken_notes
					static_targets = [
						75
						100
						130
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	deadfall = {
		allowed_in_quickplay = 1
		artist = qs(0xf89c089b)
		checksum = deadfall
		duration = 139
		genre = punk
		name = 'Deadfall'
		singer = male
		title = qs(0xa4089d47)
		year = 1997
		guitar_difficulty_rating = 9
		bass_difficulty_rating = 9
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 9
		band_difficulty_rating = 8
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'deadfall'
		snare = 'deadfall'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.3
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						20000
						35000
						50000
					]
				}
				{
					goal_name = qp_streak_notes
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_open_notes
					custom_score_targets = [
						100
						90
						95
					]
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					watched_times = [
						25930
						27460
						32160
						38700
						59160
						60730
						65430
						72000
						94430
						96060
						120130
						121700
						126500
						137430
					]
					desc_txt_override = qs(0x5e9fa95a)
					static_targets = [
						70
						160
						230
					]
				}
				{
					goal_name = qp_red_notes
					static_targets = [
						250
						350
						450
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	fascinationstreet = {
		allowed_in_quickplay = 1
		artist = qs(0x2957f87d)
		checksum = fascinationstreet
		duration = 312
		genre = alternative
		name = 'FascinationStreet'
		singer = male
		title = qs(0x9048ae1c)
		year = 1989
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 6
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'ModernRock'
		snare = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.9
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_blue_notes
					static_targets = [
						80
						350
						450
					]
				}
				{
					goal_name = qp_streak_notes
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_alt_strum
					static_targets = [
						100
						250
						1015
					]
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_yellow_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						10000
						15000
						20000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	feelgooddrag = {
		allowed_in_quickplay = 1
		artist = qs(0x48b27ccd)
		checksum = feelgooddrag
		duration = 186
		genre = `modern rock`
		name = 'FeelGoodDrag'
		singer = male
		title = qs(0xef7f53c7)
		year = 2008
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 4
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'feelgooddrag'
		snare = 'feelgooddrag'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -3.6
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
					static_targets = [
						50
						75
						100
					]
					desc_txt_override = qs(0x36809154)
					watched_sections = [
						6
						8
					]
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
					goal_name = qp_yellow_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_hit_notes_band
				}
			]
		}
	}
	feelslikethefirsttime = {
		allowed_in_quickplay = 1
		artist = qs(0x5b3ab1bb)
		checksum = feelslikethefirsttime
		duration = 254
		genre = `classic rock`
		name = 'FeelsLikeTheFirstTime'
		singer = male
		title = qs(0xe96973a4)
		year = 2007
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 3
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ClassicRock'
		drum_kit = 'ClassicRock'
		hihat = 'ClassicRock'
		kick = 'feelslikethefirsttime'
		snare = 'feelslikethefirsttime'
		tom1 = 'ClassicRock'
		tom2 = 'ClassicRock'
		overall_song_volume = -1.6
		parts_with_mic = [
			guitarist
			bassist
		]
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
					goal_name = qp_up_strum
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_drum_accents
					static_targets = [
						40
						60
						80
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						10000
						19000
						28000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	fortunateson = {
		allowed_in_quickplay = 1
		artist = qs(0x68414f08)
		checksum = fortunateson
		duration = 157
		genre = `southern rock`
		name = 'FortunateSon'
		singer = male
		title = qs(0x6230d9dc)
		year = 1969
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'fortunateson'
		snare = 'fortunateson'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 2.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	freeride = {
		allowed_in_quickplay = 1
		artist = qs(0x1b76462d)
		checksum = freeride
		duration = 203
		genre = `classic rock`
		name = 'FreeRide'
		singer = male
		title = qs(0xb890f9e8)
		year = 1997
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 5
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'StandardRock'
		drum_kit = 'StandardRock'
		hihat = 'StandardRock'
		kick = 'freeride'
		snare = 'freeride'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 1.0
		parts_with_mic = [
			guitarist
			bassist
		]
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_whammy_time
					desc_txt_override = qs(0x048e67e8)
					static_targets = [
						2500
						3000
						3500
					]
					watched_sections = [
						10
						13
					]
				}
				{
					goal_name = qp_hit_hopos
					static_targets = [
						12
						60
						120
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					watched_sections = [
						7
						12
					]
					desc_txt_override = qs(0x5e9fa95a)
					static_targets = [
						100
						150
						200
					]
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_yellow_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	furyofthestorm = {
		allowed_in_quickplay = 1
		artist = qs(0x7585226c)
		checksum = furyofthestorm
		duration = 406
		genre = `speed metal`
		name = 'FuryOfTheStorm'
		singer = male
		title = qs(0xeb35b366)
		year = 2004
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 9
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 9
		band_difficulty_rating = 9
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'furyofthestorm'
		snare = 'furyofthestorm'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.5
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
					static_targets = [
						200000
						400000
						500000
					]
				}
				{
					goal_name = qp_hit_notes
					desc_txt_override = qs(0x6bbfd351)
					watched_sections = [
						11
						13
						18
						38
					]
					static_targets = [
						500
						1000
						1337
					]
				}
				{
					goal_name = qp_hit_hopos
					static_targets = [
						100
						300
						1000
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
					static_targets = [
						150
						300
						600
					]
				}
			]
			drum = [
				{
					goal_name = qp_score_points
					static_targets = [
						200000
						400000
						550000
					]
				}
				{
					goal_name = qp_red_notes
					static_targets = [
						800
						900
						1000
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_hit_notes_band
				}
			]
		}
	}
	getfree = {
		allowed_in_quickplay = 1
		artist = qs(0xb362d2df)
		checksum = getfree
		duration = 123
		genre = alternative
		name = 'GetFree'
		singer = male
		title = qs(0x5ed4f223)
		year = 2002
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 5
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'getfree'
		snare = 'getfree'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.6
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_rockout_time
					static_targets = [
						8000
						11000
						14000
					]
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
					goal_name = qp_red_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	ghost = {
		allowed_in_quickplay = 1
		artist = qs(0xfe64e199)
		checksum = ghost
		duration = 207
		genre = rock
		name = 'Ghost'
		singer = male
		title = qs(0xa2c08f21)
		year = 2010
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 5
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'ghost'
		snare = 'ghost'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 1.5
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_hopos
					custom_score_targets = [
						100
						85
						95
					]
				}
				{
					goal_name = qp_streak_notes
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_down_strum
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_yellow_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						10000
						20000
						30000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	graduate = {
		allowed_in_quickplay = 1
		artist = qs(0x6fe0e5b5)
		checksum = graduate
		duration = 180
		genre = alternative
		name = 'Graduate'
		singer = male
		title = qs(0x38e44de8)
		year = 2009
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 5
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'graduate'
		snare = 'graduate'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.2
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_hopos
				}
				{
					goal_name = qp_sustain_time
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_green_notes
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
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_spower_band
				}
			]
		}
	}
	hardtosee = {
		allowed_in_quickplay = 1
		artist = qs(0x8ed87637)
		checksum = hardtosee
		duration = 209
		genre = `hard rock`
		name = 'HardToSee'
		singer = male
		title = qs(0x71b8a87d)
		year = 2009
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 6
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'hardtosee'
		snare = 'hardtosee'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.6
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					custom_score_targets = [
						15
						16
						18
					]
					desc_txt_override = qs(0x36809154)
					watched_sections = [
						8
						10
					]
				}
				{
					goal_name = qp_green_notes
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_green_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_kick_notes
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	holywars = {
		allowed_in_quickplay = 1
		artist = qs(0x58120222)
		checksum = holywars
		duration = 391
		genre = metal
		name = 'HolyWars'
		singer = male
		title = qs(0xfd16475f)
		year = 1990
		guitar_difficulty_rating = 9
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 8
		band_difficulty_rating = 9
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'holywars'
		snare = 'holywars'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.4
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_hopos
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						60000
						80000
						130000
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_open_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_kick_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	howyouremindme = {
		allowed_in_quickplay = 1
		artist = qs(0xf45c5c52)
		checksum = howyouremindme
		duration = 228
		genre = `hard rock`
		name = 'HowYouRemindMe'
		singer = male
		title = qs(0x65b6f012)
		year = 2001
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 3
		band_difficulty_rating = 3
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'howyouremindme'
		snare = 'howyouremindme'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.6
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
				}
				{
					goal_name = qp_spower_banked
					static_targets = [
						160
						200
						250
					]
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
					goal_name = qp_score_spower
					static_targets = [
						17000
						33000
						47000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	iknowwhatiam = {
		allowed_in_quickplay = 1
		artist = qs(0xd613eccb)
		checksum = iknowwhatiam
		duration = 201
		genre = `indie rock`
		name = 'IKnowWhatIAm'
		singer = male
		title = qs(0x1a201c4c)
		year = 2009
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 1
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 3
		band_difficulty_rating = 3
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'iknowwhatiam'
		snare = 'iknowwhatiam'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.7
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
				}
				{
					goal_name = qp_rockout_time
					static_targets = [
						10000
						14000
						18000
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
					static_targets = [
						44000
						49000
						52000
					]
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
					goal_name = qp_streak_phrases
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						15000
						30000
						45000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	imbroken = {
		allowed_in_quickplay = 1
		artist = qs(0x0f4eacb9)
		checksum = imbroken
		duration = 250
		genre = metal
		name = 'ImBroken'
		singer = male
		title = qs(0xaff7bc9d)
		year = 1994
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 5
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 165
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'imbroken'
		snare = 'imbroken'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.8
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_whammy_time
					desc_txt_override = qs(0x048e67e8)
					watched_sections = [
						9
						13
					]
					static_targets = [
						2000
						2500
						3000
					]
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
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_drum_accents
					static_targets = [
						40
						55
						70
					]
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	imnotok = {
		allowed_in_quickplay = 1
		artist = qs(0xd71487f8)
		checksum = imnotok
		duration = 187
		genre = `pop punk`
		name = 'ImNotOk'
		singer = male
		title = qs(0xc29a4d14)
		year = 2004
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 5
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'imnotok'
		snare = 'imnotok'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
				}
				{
					goal_name = qp_alt_strum
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_rockout_time
					static_targets = [
						5000
						8000
						10000
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
					goal_name = qp_score_spower
					static_targets = [
						10000
						20000
						30000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	indians = {
		allowed_in_quickplay = 1
		artist = qs(0x5a80b8dd)
		checksum = indians
		duration = 340
		genre = `speed metal`
		name = 'Indians'
		singer = male
		title = qs(0xbc089e35)
		year = 1987
		guitar_difficulty_rating = 8
		bass_difficulty_rating = 7
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 8
		band_difficulty_rating = 8
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 145
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'indians'
		snare = 'indians'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -2.5
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_green_notes
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
					goal_name = qp_blue_notes
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
					goal_name = qp_spower_banked
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_banked_band
				}
			]
		}
	}
	interstatelovesong = {
		allowed_in_quickplay = 1
		artist = qs(0x10094376)
		checksum = interstatelovesong
		duration = 195
		genre = alternative
		name = 'InterstateLoveSong'
		singer = male
		title = qs(0x075490d9)
		year = 1994
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 3
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'interstatelovesong'
		snare = 'interstatelovesong'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.8
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
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
					goal_name = qp_hit_hopos
					static_targets = [
						30
						75
						200
					]
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_red_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						12000
						20000
						30000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	itsonlyanotherparsec = {
		allowed_in_quickplay = 1
		artist = qs(0x5d85ca12)
		checksum = itsonlyanotherparsec
		duration = 189
		genre = `modern rock`
		name = 'ItsOnlyAnotherParsec'
		singer = male
		title = qs(0xb9343269)
		year = 2009
		guitar_difficulty_rating = 7
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 8
		band_difficulty_rating = 7
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'itsonlyanotherparsec'
		snare = 'itsonlyanotherparsec'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
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
					goal_name = qp_streak_notes
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
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_hit_notes_band
				}
			]
		}
	}
	jetcitywoman = {
		allowed_in_quickplay = 1
		artist = qs(0xa41c06f3)
		checksum = jetcitywoman
		duration = 321
		genre = `hard rock`
		name = 'JetCityWoman'
		singer = male
		title = qs(0x22ed40c1)
		year = 1990
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 5
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'jetcitywoman'
		snare = 'jetcitywoman'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -3.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_sustain_time
				}
				{
					goal_name = qp_hit_notes
					custom_score_targets = [
						16
						20
						24
					]
					desc_txt_override = qs(0x5e9fa95a)
					watched_sections = [
						1
						3
						13
						15
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_yellow_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						20000
						35000
						50000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	lasso = {
		allowed_in_quickplay = 1
		artist = qs(0xbbeb45e6)
		checksum = lasso
		duration = 168
		genre = alternative
		name = 'Lasso'
		singer = male
		title = qs(0x984d6687)
		year = 2009
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 4
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'lasso'
		snare = 'lasso'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.2
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_down_strum
				}
				{
					goal_name = qp_streak_notes
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
					goal_name = qp_hit_notes
					desc_txt_override = qs(0x5e9fa95a)
					watched_times = [
						3000
						18700
						31200
						44500
						62000
						63600
						112866
						114433
						162133
						168500
					]
					static_targets = [
						100
						140
						180
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						5000
						9000
						12000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	listentoherheart = {
		allowed_in_quickplay = 1
		artist = qs(0x9acc5fb9)
		checksum = listentoherheart
		duration = 189
		genre = `classic rock`
		name = 'ListenToHerHeart'
		singer = male
		title = qs(0xb875caae)
		year = 1978
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'listentoherheart'
		snare = 'listentoherheart'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.8
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spower_banked
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
					goal_name = qp_streak_notes
					static_targets = [
						200
						250
						300
					]
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
					goal_name = qp_spower_banked
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_spower_band
				}
			]
		}
	}
	losingmyreligion = {
		allowed_in_quickplay = 1
		artist = qs(0xa8051f29)
		checksum = losingmyreligion
		duration = 268
		genre = alternative
		name = 'LosingMyReligion'
		singer = male
		title = qs(0xfc964a99)
		year = 1991
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 3
		band_difficulty_rating = 3
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'losingmyreligion'
		snare = 'losingmyreligion'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.6
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
				}
				{
					goal_name = qp_alt_strum
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
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
					goal_name = qp_spower_banked
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	lovegun = {
		allowed_in_quickplay = 1
		artist = qs(0x2d53e2f7)
		checksum = lovegun
		duration = 198
		genre = `glam rock`
		name = 'LoveGun'
		singer = male
		title = qs(0xb34ee008)
		year = 2007
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 3
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 125
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'lovegun'
		snare = 'lovegun'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.2
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spower_banked
					static_targets = [
						200
						300
						400
					]
				}
				{
					goal_name = qp_sustain_time
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
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	lunaticfringe = {
		allowed_in_quickplay = 1
		artist = qs(0x98307f28)
		checksum = lunaticfringe
		duration = 260
		genre = rock
		name = 'LunaticFringe'
		singer = male
		title = qs(0x45ba8eb5)
		year = 1981
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 4
		band_difficulty_rating = 3
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'lunaticfringe'
		snare = 'lunaticfringe'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.1
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_hopos
				}
				{
					goal_name = qp_whammy_time
					watched_sections = [
						0
						1
						7
						9
					]
					desc_txt_override = qs(0x048e67e8)
					static_targets = [
						13000
						17000
						20000
					]
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
					goal_name = qp_yellow_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						8000
						15000
						22000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	machinehead = {
		allowed_in_quickplay = 1
		artist = qs(0xdd247e0c)
		checksum = machinehead
		duration = 262
		genre = rock
		name = 'Machinehead'
		singer = male
		title = qs(0xe413bb6f)
		year = 1994
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 4
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'machinehead'
		snare = 'machinehead'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.2
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
					static_targets = [
						10000
						15000
						20000
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
					goal_name = qp_kick_notes
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	moderndaycowboy = {
		allowed_in_quickplay = 1
		artist = qs(0xbe87c326)
		checksum = moderndaycowboy
		duration = 314
		genre = `classic rock`
		name = 'ModernDayCowboy'
		singer = male
		title = qs(0x02338e49)
		year = 1986
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 6
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'moderndaycowboy'
		snare = 'moderndaycowboy'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.3
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
					goal_name = qp_yellow_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_yellow_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						15000
						26000
						42000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	moneyfornothing = {
		allowed_in_quickplay = 1
		artist = qs(0x56bd542a)
		checksum = moneyfornothing
		duration = 337
		genre = `pop rock`
		name = 'MoneyForNothing'
		singer = male
		title = qs(0x4e2dd841)
		year = 1985
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 4
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'moneyfornothing'
		snare = 'moneyfornothing'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
				}
				{
					goal_name = qp_streak_notes
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
					goal_name = qp_hit_notes
					desc_txt_override = qs(0x5e9fa95a)
					watched_times = [
						14500
						38360
						50400
						51750
						111000
						112600
						143400
						144760
						189700
						191260
					]
					static_targets = [
						70
						100
						130
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						9000
						15000
						24000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
					static_targets = [
						30000
						40000
						55000
					]
				}
			]
		}
	}
	motivation = {
		allowed_in_quickplay = 1
		artist = qs(0xb9a0d7e2)
		checksum = motivation
		duration = 172
		genre = `pop punk`
		name = 'Motivation'
		singer = male
		title = qs(0x4067eadb)
		year = 2001
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 6
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 300
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		cymbal = 'HeavyRock'
		drum_kit = 'HeavyRock'
		hihat = 'HeavyRock'
		kick = 'motivation'
		snare = 'motivation'
		tom1 = 'HeavyRock'
		tom2 = 'HeavyRock'
		overall_song_volume = -1.0
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
					goal_name = qp_alt_strum
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_kick_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	moveitonover = {
		allowed_in_quickplay = 1
		artist = qs(0xa9180a7e)
		checksum = moveitonover
		duration = 303
		genre = `blues rock`
		name = 'MoveItOnOver'
		singer = male
		title = qs(0xb5e2726a)
		year = 1995
		guitar_difficulty_rating = 7
		bass_difficulty_rating = 7
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 8
		band_difficulty_rating = 7
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'moveitonover'
		snare = 'moveitonover'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -6.2
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_hopos
				}
				{
					goal_name = qp_whammy_time
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_green_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_yellow_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_hit_notes_band
				}
			]
		}
	}
	nemesis = {
		allowed_in_quickplay = 1
		artist = qs(0x684b9e9d)
		checksum = nemesis
		duration = 240
		genre = `death metal`
		name = 'Nemesis'
		singer = female
		title = qs(0xd0243557)
		year = 2005
		guitar_difficulty_rating = 9
		bass_difficulty_rating = 8
		vocals_difficulty_rating = 1
		drums_difficulty_rating = 8
		band_difficulty_rating = 8
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'nemesis'
		snare = 'nemesis'
		tom1 = 'Metal'
		tom2 = 'Metal'
		overall_song_volume = -1.2
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					watched_sections = [
						1
						2
						3
						4
						6
						7
						8
						9
					]
					desc_txt_override = qs(0x5e9fa95a)
					static_targets = [
						250
						300
						350
					]
				}
				{
					goal_name = qp_whammy_time
					watched_times = [
						44330
						49000
						53260
						54200
						92430
						94800
						97530
						101900
						106100
						108360
						143560
						148260
						187260
						197330
						215730
						234800
					]
					desc_txt_override = qs(0x048e67e8)
					static_targets = [
						20000
						25000
						30000
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_yellow_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_kick_notes
				}
				{
					goal_name = qp_score_spower
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_banked_band
				}
			]
		}
	}
	nomoremrniceguy = {
		allowed_in_quickplay = 1
		artist = qs(0x99fafc31)
		checksum = nomoremrniceguy
		duration = 192
		genre = `classic rock`
		name = 'NoMoreMrNiceGuy'
		singer = male
		title = qs(0x2d9f7557)
		year = 2010
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 4
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'nomoremrniceguy'
		snare = 'nomoremrniceguy'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.6
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_whammy_time
					watched_times = [
						19000
						32000
						60000
						60930
						64530
						65700
						68560
						69530
						72360
						73330
						83600
						85460
						89630
						92630
						98100
						99900
						105730
						107600
						110460
						111430
						114260
						115230
						118100
						119030
						144730
						153130
						155730
						157160
						160000
						161000
						163800
						164560
						167600
						168560
						171200
						172400
						175230
						176200
						179060
						180000
					]
					desc_txt_override = qs(0x048e67e8)
					static_targets = [
						10000
						15000
						20000
					]
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
					goal_name = qp_up_strum
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_red_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_spower_band
				}
			]
		}
	}
	nosecretsthisyear = {
		allowed_in_quickplay = 1
		artist = qs(0x3e6463ce)
		checksum = nosecretsthisyear
		duration = 273
		genre = `indie rock`
		name = 'NoSecretsThisYear'
		singer = male
		title = qs(0x69d3e460)
		year = 2009
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 4
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'nosecretsthisyear'
		snare = 'nosecretsthisyear'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.2
		parts_with_mic = [
			guitarist
			bassist
		]
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
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_banked_band
				}
			]
		}
	}
	nowayback = {
		allowed_in_quickplay = 1
		artist = qs(0xcb5e8a23)
		checksum = nowayback
		duration = 198
		genre = alternative
		name = 'NoWayBack'
		singer = male
		title = qs(0x0696ecfe)
		year = 2005
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 5
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'nowayback'
		snare = 'nowayback'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 1.9
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
				}
				{
					goal_name = qp_sustain_time
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	paranoid = {
		allowed_in_quickplay = 1
		artist = qs(0x0cb5a6c7)
		checksum = paranoid
		duration = 162
		genre = metal
		name = 'Paranoid'
		singer = male
		title = qs(0x3def64b1)
		year = 2009
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 3
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'paranoid'
		snare = 'paranoid'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.4
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					static_targets = [
						50
						100
						125
					]
					desc_txt_override = qs(0x36809154)
					watched_sections = [
						7
						9
					]
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
					static_targets = [
						160000
						200000
						230000
					]
				}
				{
					goal_name = qp_streak_notes
					static_targets = [
						150
						250
						300
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	poursomesugaronme = {
		allowed_in_quickplay = 1
		artist = qs(0x32b3724a)
		checksum = poursomesugaronme
		duration = 306
		genre = `hard rock`
		name = 'PourSomeSugarOnMe'
		singer = male
		title = qs(0x2c4e98ef)
		year = 2009
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 1
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 4
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'poursomesugaronme'
		snare = 'poursomesugaronme'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 2.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_red_notes
				}
				{
					goal_name = qp_streak_notes
				}
			]
			bass = [
				{
					goal_name = qp_score_points
					static_targets = [
						30000
						35000
						40000
					]
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_green_notes
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
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	prepareforwar = {
		allowed_in_quickplay = 1
		artist = qs(0x066e90ed)
		checksum = prepareforwar
		duration = 238
		genre = `death metal`
		name = 'PrepareForWar'
		singer = male
		title = qs(0x0d2528f2)
		year = 2005
		guitar_difficulty_rating = 9
		bass_difficulty_rating = 9
		vocals_difficulty_rating = 1
		drums_difficulty_rating = 8
		band_difficulty_rating = 8
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'prepareforwar'
		snare = 'prepareforwar'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.6
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					custom_score_targets = [
						18
						22
						26
					]
					desc_txt_override = qs(0x36809154)
					watched_sections = [
						12
						16
					]
				}
				{
					goal_name = qp_hit_hopos
					static_targets = [
						100
						400
						700
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_open_notes
				}
				{
					goal_name = qp_score_spower
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
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	psychosocial = {
		allowed_in_quickplay = 1
		artist = qs(0xc3346333)
		checksum = psychosocial
		duration = 285
		genre = metal
		name = 'Psychosocial'
		singer = male
		title = qs(0xd004c6c1)
		year = 2008
		guitar_difficulty_rating = 7
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 7
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'psychosocial'
		snare = 'psychosocial'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.8
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					desc_txt_override = qs(0x36809154)
					watched_sections = [
						7
						9
					]
					static_targets = [
						90
						130
						185
					]
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
					goal_name = qp_streak_notes
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
					goal_name = qp_spoken_notes
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	ravenous = {
		allowed_in_quickplay = 1
		artist = qs(0xb1247d06)
		checksum = ravenous
		duration = 188
		genre = metal
		name = 'Ravenous'
		singer = male
		title = qs(0x96f44625)
		year = 2009
		guitar_difficulty_rating = 8
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 7
		band_difficulty_rating = 7
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 1
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'ravenous'
		snare = 'ravenous'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					custom_score_targets = [
						11
						13
						19
					]
					desc_txt_override = qs(0x5e9fa95a)
					watched_sections = [
						10
						12
					]
				}
				{
					goal_name = qp_alt_strum
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_blue_notes
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
					goal_name = qp_spoken_notes
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_spower_band
				}
			]
		}
	}
	reignition = {
		allowed_in_quickplay = 1
		artist = qs(0x8420bdfa)
		checksum = reignition
		duration = 265
		genre = punk
		name = 'ReIgnition'
		singer = male
		title = qs(0xe73cc543)
		year = 1987
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 6
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'reignition'
		snare = 'reignition'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.1
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
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
					goal_name = qp_hit_chords
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_yellow_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						12000
						20000
						28000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	renegade = {
		allowed_in_quickplay = 1
		artist = qs(0x83166e29)
		checksum = renegade
		duration = 266
		genre = `classic rock`
		name = 'Renegade'
		singer = male
		title = qs(0x5434ad4a)
		year = 2009
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 6
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'renegade'
		snare = 'renegade'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.0
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
					desc_txt_override = qs(0x5e9fa95a)
					watched_sections = [
						6
						8
						11
						14
					]
					static_targets = [
						155
						270
						380
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_rockout_time
					static_targets = [
						10000
						15000
						20000
					]
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
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	rockinamerica = {
		allowed_in_quickplay = 1
		artist = qs(0xc60b34a3)
		checksum = rockinamerica
		duration = 261
		genre = rock
		name = 'RockInAmerica'
		singer = male
		title = qs(0xf115fb39)
		year = 2009
		guitar_difficulty_rating = 7
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 4
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'rockinamerica'
		snare = 'rockinamerica'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.3
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
					desc_txt_override = qs(0x5e9fa95a)
					watched_sections = [
						6
						10
						11
						12
					]
					static_targets = [
						165
						255
						405
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	rockininthefreeworld = {
		allowed_in_quickplay = 1
		artist = qs(0x025c7ea5)
		checksum = rockininthefreeworld
		duration = 310
		genre = `classic rock`
		name = 'RockinInTheFreeWorld'
		singer = male
		title = qs(0x51fa4824)
		year = 1989
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 3
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 160
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'rockininthefreeworld'
		snare = 'rockininthefreeworld'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 1.3
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
					goal_name = qp_open_notes
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
					goal_name = qp_spower_banked
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	rush2112p1 = {
		allowed_in_quickplay = 1
		artist = qs(0xa19f4f27)
		checksum = rush2112p1
		duration = 228
		genre = `prog rock`
		name = 'Rush2112P1'
		singer = male
		title = qs(0x0c37dd87)
		year = 1976
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 2
		drums_difficulty_rating = 6
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 170
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'rush2112p1'
		snare = 'rush2112p1'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		alpha_in_highway = 1
		sort_title = qs(0x77f184df)
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
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
					goal_name = qp_spower_banked
				}
				{
					goal_name = qp_yellow_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_drum_accents
					static_targets = [
						31
						41
						59
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
					static_targets = [
						3000
						4000
						5000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_banked_band
				}
			]
		}
	}
	rush2112p2 = {
		allowed_in_quickplay = 1
		artist = qs(0xa19f4f27)
		checksum = rush2112p2
		duration = 130
		genre = `prog rock`
		name = 'Rush2112P2'
		singer = male
		title = qs(0xa7e33c26)
		year = 1976
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 4
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'rush2112p2'
		snare = 'rush2112p2'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		alpha_in_highway = 1
		sort_title = qs(0x5cdcd71c)
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_alt_strum
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
					goal_name = qp_streak_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					desc_txt_override = qs(0x5e9fa95a)
					watched_times = [
						7900
						9750
						15660
						17600
						23360
						25160
						38200
						40000
						45300
						47030
						52260
						53960
						59160
						68000
						76960
						78830
						84460
						86300
						91630
						93360
						98600
						100360
						105600
						107330
						112500
						121500
					]
					static_targets = [
						50
						100
						200
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_spower_band
				}
			]
		}
	}
	rush2112p3 = {
		allowed_in_quickplay = 1
		artist = qs(0xa19f4f27)
		checksum = rush2112p3
		duration = 217
		genre = `prog rock`
		name = 'Rush2112P3'
		singer = male
		title = qs(0x791cf978)
		year = 1976
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 0
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 0
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'ModernRock'
		snare = 'ModernRock'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		alpha_in_highway = 1
		sort_title = qs(0x45c7e65d)
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						25000
						35000
						45000
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						3000
						6000
						10000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
					static_targets = [
						100000
						200000
						400000
					]
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	rush2112p4 = {
		allowed_in_quickplay = 1
		artist = qs(0xa19f4f27)
		checksum = rush2112p4
		duration = 220
		genre = `prog rock`
		name = 'Rush2112P4'
		singer = male
		title = qs(0xf871b757)
		year = 1976
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 8
		drums_difficulty_rating = 7
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 140
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'rush2112p4'
		snare = 'rush2112p4'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		alpha_in_highway = 1
		sort_title = qs(0x0a86709a)
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_hopos
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
					goal_name = qp_score_spower
					static_targets = [
						8000
						15000
						22000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	rush2112p5 = {
		allowed_in_quickplay = 1
		artist = qs(0xa19f4f27)
		checksum = rush2112p5
		duration = 121
		genre = `prog rock`
		name = 'Rush2112P5'
		singer = male
		title = qs(0xcdc24a37)
		year = 1976
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 4
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'rush2112p5'
		snare = 'rush2112p5'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		alpha_in_highway = 1
		sort_title = qs(0x139d41db)
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_down_strum
				}
				{
					goal_name = qp_sustain_time
				}
			]
			bass = [
				{
					goal_name = qp_score_points
					static_targets = [
						20000
						30000
						40000
					]
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
					goal_name = qp_orange_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_score_spower_band
				}
			]
		}
	}
	rush2112p6 = {
		allowed_in_quickplay = 1
		artist = qs(0xa19f4f27)
		checksum = rush2112p6
		duration = 139
		genre = `prog rock`
		name = 'Rush2112P6'
		singer = male
		title = qs(0x7fcb7f65)
		year = 1976
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 3
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'rush2112p6'
		snare = 'rush2112p6'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		alpha_in_highway = 1
		sort_title = qs(0x38b01218)
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_hopos
				}
				{
					goal_name = qp_sustain_time
				}
			]
			bass = [
				{
					goal_name = qp_score_points
					static_targets = [
						35000
						40000
						45000
					]
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
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_banked_band
				}
			]
		}
	}
	rush2112p7 = {
		allowed_in_quickplay = 1
		artist = qs(0xa19f4f27)
		checksum = rush2112p7
		duration = 135
		genre = `prog rock`
		name = 'Rush2112P7'
		singer = male
		title = qs(0xd31e8d2c)
		year = 1976
		guitar_difficulty_rating = 7
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 1
		drums_difficulty_rating = 8
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 120
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'rush2112p7'
		snare = 'rush2112p7'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		alpha_in_highway = 1
		sort_title = qs(0x21ab2359)
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_alt_strum
				}
				{
					goal_name = qp_hit_notes
					desc_txt_override = qs(0x5e9fa95a)
					watched_sections = [
						8
						11
					]
					static_targets = [
						75
						100
						125
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spower_banked
				}
				{
					goal_name = qp_hit_chords
					static_targets = [
						20
						50
						90
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
					static_targets = [
						3000
						4000
						5000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_hit_notes_band
				}
			]
		}
	}
	rushoutro = {
		allowed_in_quickplay = 0
		artist = qs(0xa19f4f27)
		checksum = rushoutro
		duration = 135
		genre = `prog rock`
		name = 'Rush2112P7'
		singer = male
		title = qs(0x6bae2733)
		year = 3030
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 120
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'rush2112p7'
		snare = 'rush2112p7'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		alpha_in_highway = 1
	}
	savior = {
		allowed_in_quickplay = 1
		artist = qs(0xd0393a54)
		checksum = savior
		duration = 245
		genre = `modern rock`
		name = 'Savior'
		singer = male
		title = qs(0x593b14cc)
		year = 2008
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 7
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'savior'
		snare = 'savior'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.4
		parts_with_mic = [
			guitarist
			bassist
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
					goal_name = qp_alt_strum
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_kick_notes
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	scumbagblues = {
		allowed_in_quickplay = 1
		artist = qs(0x4838ed45)
		checksum = scumbagblues
		duration = 266
		genre = alternative
		name = 'ScumbagBlues'
		singer = male
		title = qs(0xd70cd646)
		year = 2009
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 4
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'scumbagblues'
		snare = 'scumbagblues'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_taps
				}
				{
					goal_name = qp_whammy_time
					static_targets = [
						18000
						27000
						36000
					]
					desc_txt_override = qs(0x048e67e8)
					watched_sections = [
						6
						7
						9
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
					goal_name = qp_up_strum
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_yellow_notes
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	selfesteemgh6 = {
		allowed_in_quickplay = 1
		artist = qs(0xa2f0d180)
		checksum = selfesteemgh6
		duration = 260
		genre = `pop punk`
		name = 'SelfEsteemGH6'
		singer = male
		title = qs(0xc70ebaa6)
		year = 1994
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 5
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'selfesteemgh6'
		snare = 'selfesteemgh6'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.2
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
				}
				{
					goal_name = qp_alt_strum
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
					goal_name = qp_streak_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	settingfire = {
		allowed_in_quickplay = 1
		artist = qs(0x5d0ba8f8)
		checksum = settingfire
		duration = 207
		genre = metal
		name = 'SettingFire'
		singer = male
		title = qs(0xd634f03b)
		year = 2004
		guitar_difficulty_rating = 8
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 8
		band_difficulty_rating = 7
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'settingfire'
		snare = 'settingfire'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -2.5
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_down_strum
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
					goal_name = qp_streak_notes
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
					goal_name = qp_spoken_notes
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_banked_band
				}
			]
		}
	}
	sevennationarmy = {
		allowed_in_quickplay = 1
		artist = qs(0xf6ea648e)
		checksum = sevennationarmy
		duration = 233
		genre = `blues rock`
		name = 'SevenNationArmy'
		singer = male
		title = qs(0xc100529a)
		year = 2003
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 1
		band_difficulty_rating = 3
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'sevennationarmy'
		snare = 'sevennationarmy'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.2
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spower_banked
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
					static_targets = [
						70
						170
						307
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						5005
						10003
						15001
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	sharpdressedman = {
		allowed_in_quickplay = 1
		artist = qs(0x4d1adb22)
		checksum = sharpdressedman
		duration = 261
		genre = `blues rock`
		name = 'SharpDressedMan'
		singer = male
		title = qs(0x19f46ae3)
		year = 2007
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 4
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'sharpdressedman'
		snare = 'sharpdressedman'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.1
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_spower_banked
				}
				{
					goal_name = qp_sustain_time
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
					goal_name = qp_streak_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						4000
						8000
						12000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	slowhands = {
		allowed_in_quickplay = 1
		artist = qs(0xbbcd5420)
		checksum = slowhands
		duration = 192
		genre = alternative
		name = 'SlowHands'
		singer = male
		title = qs(0x23379828)
		year = 2004
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 5
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 155
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'slowhands'
		snare = 'slowhands'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.5
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_banked_band
				}
			]
		}
	}
	speeding = {
		allowed_in_quickplay = 1
		artist = qs(0xa27fc2b0)
		checksum = speeding
		duration = 241
		genre = `speed metal`
		name = 'Speeding'
		singer = male
		title = qs(0x83b699ad)
		year = 2010
		guitar_difficulty_rating = 9
		bass_difficulty_rating = 8
		vocals_difficulty_rating = 0
		drums_difficulty_rating = 8
		band_difficulty_rating = 8
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 133
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'speeding'
		snare = 'speeding'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.8
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
					static_targets = [
						175003
						225023
						275003
					]
				}
				{
					goal_name = qp_hit_taps
					static_targets = [
						200
						260
						450
					]
				}
				{
					goal_name = qp_streak_notes
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_sustain_time
					static_targets = [
						20000
						25000
						60000
					]
				}
				{
					goal_name = qp_streak_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_sustain_hits
				}
				{
					goal_name = qp_streak_notes
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_hit_notes_band
				}
			]
		}
	}
	spiderman = {
		allowed_in_quickplay = 1
		artist = qs(0x276cc1ed)
		checksum = spiderman
		duration = 126
		genre = punk
		name = 'Spiderman'
		singer = male
		title = qs(0xc7c65ae1)
		year = 1995
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 6
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 1
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'spiderman'
		snare = 'spiderman'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
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
					goal_name = qp_alt_strum
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
					static_targets = [
						150
						250
						350
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_hit_notes_band
				}
			]
		}
	}
	straycatblues = {
		allowed_in_quickplay = 1
		artist = qs(0x4c097d05)
		checksum = straycatblues
		duration = 274
		genre = `blues rock`
		name = 'StrayCatBlues'
		singer = male
		title = qs(0x7de25650)
		year = 1968
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 3
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'straycatblues'
		snare = 'straycatblues'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_sustain_time
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
					goal_name = qp_hit_notes
					desc_txt_override = qs(0x5e9fa95a)
					watched_sections = [
						5
						6
						8
						9
						11
						16
					]
					static_targets = [
						350
						450
						650
					]
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
					goal_name = qp_spoken_notes
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	suddendeath = {
		allowed_in_quickplay = 1
		artist = qs(0x58120222)
		checksum = suddendeath
		duration = 307
		genre = metal
		name = 'SuddenDeath'
		singer = male
		title = qs(0x0cd8a832)
		year = 2010
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 8
		band_difficulty_rating = 9
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		locked
		unlock_description_text = g_quest_unlock_description_text
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'suddendeath'
		snare = 'suddendeath'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.3
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
					static_targets = [
						200000
						400000
						500000
					]
				}
				{
					goal_name = qp_hit_notes
					custom_score_targets = [
						20
						24
						28
					]
					desc_txt_override = qs(0x36809154)
					watched_sections = [
						10
						13
					]
				}
				{
					goal_name = qp_hit_hopos
					static_targets = [
						350
						700
						1000
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_kick_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						6000
						11000
						16000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_hit_notes_band
				}
			]
		}
	}
	suddendeathgh6career = {
		allowed_in_quickplay = 0
		artist = qs(0x58120222)
		checksum = suddendeathgh6career
		duration = 314
		genre = rock
		name = 'SuddenDeathGH6Career'
		singer = male
		title = qs(0x0cd8a832)
		year = 2010
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 10
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'suddendeath'
		snare = 'suddendeath'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.3
	}
	suffocate = {
		allowed_in_quickplay = 1
		artist = qs(0x6f627663)
		checksum = suffocate
		duration = 183
		genre = `modern rock`
		name = 'Suffocate'
		singer = female
		title = qs(0x39691db1)
		year = 2009
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 6
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 300
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'suffocate'
		snare = 'suffocate'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.9
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
				}
				{
					goal_name = qp_hit_notes
					desc_txt_override = qs(0x5e9fa95a)
					watched_times = [
						35000
						41500
						51150
						55800
						63500
						70300
						105200
						108800
						118350
						124600
						145600
						152800
						163500
						183000
					]
					static_targets = [
						150
						200
						250
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
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
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	theoutsider = {
		allowed_in_quickplay = 1
		artist = qs(0x8386c12c)
		checksum = theoutsider
		duration = 244
		genre = alternative
		name = 'TheOutsider'
		singer = male
		title = qs(0x9201e8db)
		year = 2003
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 6
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'theoutsider'
		snare = 'theoutsider'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.6
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
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
					goal_name = qp_streak_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_drum_accents
					static_targets = [
						100
						150
						170
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						12007
						20011
						33013
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	thisdaywefight = {
		allowed_in_quickplay = 1
		artist = qs(0x58120222)
		checksum = thisdaywefight
		duration = 211
		genre = metal
		name = 'ThisDayWeFight'
		singer = male
		title = qs(0xa3698ae4)
		year = 2009
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 8
		drums_difficulty_rating = 8
		band_difficulty_rating = 9
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'thisdaywefight'
		snare = 'thisdaywefight'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					desc_txt_override = qs(0x6bbfd351)
					watched_sections = [
						2
						3
						4
						5
						7
						8
						9
						10
						13
						16
					]
					static_targets = [
						150
						300
						475
					]
				}
				{
					goal_name = qp_streak_notes
					static_targets = [
						300
						350
						425
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_open_notes
					custom_score_targets = [
						100
						85
						95
					]
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_red_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_score_spower
					static_targets = [
						6765
						10946
						17711
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	ticktickboom = {
		allowed_in_quickplay = 1
		artist = qs(0x6580e372)
		checksum = ticktickboom
		duration = 202
		genre = alternative
		name = 'TickTickBoom'
		singer = male
		title = qs(0xa03c5f5f)
		year = 2007
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 6
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'ticktickboom'
		snare = 'ticktickboom'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.8
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_rockout_time
					static_targets = [
						6000
						9000
						12000
					]
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
					goal_name = qp_streak_notes
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_streak_notes_band
				}
			]
		}
	}
	tiesthatbind = {
		allowed_in_quickplay = 1
		artist = qs(0x629868f7)
		checksum = tiesthatbind
		duration = 196
		genre = `hard rock`
		name = 'TiesThatBind'
		singer = male
		title = qs(0x8e1879ce)
		year = 2007
		guitar_difficulty_rating = 8
		bass_difficulty_rating = 7
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 8
		band_difficulty_rating = 8
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'tiesthatbind'
		snare = 'tiesthatbind'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.2
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_hopos
					static_targets = [
						6
						200
						400
					]
				}
				{
					goal_name = qp_streak_notes
					custom_score_targets = [
						20
						35
						40
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_hopos
					static_targets = [
						2
						80
						200
					]
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					watched_times = [
						19700
						25830
						30130
						31580
						35860
						37330
						41630
						43060
						47360
						48800
						53160
						54600
						58960
						60430
						64760
						66250
						70600
						72030
						76360
						77800
						82100
						83530
						87830
						89300
						93630
						95100
						99430
						100900
						105260
						106700
						111060
						112600
						124000
						135500
						139800
						141230
						145530
						146960
						151330
						152800
						157130
						158600
						162930
						164400
						168760
						170200
						174500
						176000
						180260
						181700
						186000
						187500
						191730
						199000
					]
					desc_txt_override = qs(0x5e9fa95a)
					static_targets = [
						180
						280
						360
					]
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_hit_notes_band
				}
			]
		}
	}
	tonesofhome = {
		allowed_in_quickplay = 1
		artist = qs(0x5bd485d8)
		checksum = tonesofhome
		duration = 269
		genre = alternative
		name = 'TonesOfHome'
		singer = male
		title = qs(0xb318e57a)
		year = 1992
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 8
		drums_difficulty_rating = 7
		band_difficulty_rating = 6
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 300
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'tonesofhome'
		snare = 'tonesofhome'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.5
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
				}
				{
					goal_name = qp_hit_notes
					desc_txt_override = qs(0x36809154)
					watched_sections = [
						8
						11
					]
					static_targets = [
						70
						100
						170
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_notes
					desc_txt_override = qs(0x5e9fa95a)
					watched_sections = [
						0
						2
						6
						8
					]
					static_targets = [
						100
						175
						300
					]
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_red_notes
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	unskinnybop = {
		allowed_in_quickplay = 1
		artist = qs(0xd1cda9a8)
		checksum = unskinnybop
		duration = 243
		genre = `glam rock`
		name = 'UnskinnyBop'
		singer = male
		title = qs(0x64efdfc5)
		year = 1990
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 7
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'unskinnybop'
		snare = 'unskinnybop'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.3
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
					custom_score_targets = [
						9
						11
						14
					]
					desc_txt_override = qs(0x36809154)
					watched_times = [
						153932
						177500
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_yellow_notes
					custom_score_targets = [
						85
						85
						90
					]
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_red_notes
					custom_score_targets = [
						75
						80
						95
					]
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_multiplier_time_band
				}
			]
		}
	}
	uprising = {
		allowed_in_quickplay = 1
		artist = qs(0xb1aa12ed)
		checksum = uprising
		duration = 303
		genre = alternative
		name = 'Uprising'
		singer = male
		title = qs(0x11db7897)
		year = 2009
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 4
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'uprising'
		snare = 'uprising'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -2.2
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_whammy_time
					desc_txt_override = qs(0x048e67e8)
					watched_times = [
						11200
						41710
						86100
						116700
						281230
						304200
					]
					static_targets = [
						40000
						50000
						60000
					]
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
					goal_name = qp_hit_hopos
					static_targets = [
						250
						400
						600
					]
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
					static_targets = [
						10000
						18000
						27000
					]
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_hit_notes_band
				}
			]
		}
	}
	waidmannsheil = {
		allowed_in_quickplay = 1
		artist = qs(0x6c4707a5)
		checksum = waidmannsheil
		duration = 216
		genre = industrial
		name = 'WaidmannsHeil'
		singer = male
		title = qs(0x78edfc5e)
		year = 2009
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 4
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 150
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'waidmannsheil'
		snare = 'waidmannsheil'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -0.6
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
				}
				{
					goal_name = qp_alt_strum
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
					static_targets = [
						400
						600
						800
					]
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
					goal_name = qp_spower_banked
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	werenotgonnatakeit = {
		allowed_in_quickplay = 1
		artist = qs(0xbaf669db)
		checksum = werenotgonnatakeit
		duration = 262
		genre = `glam rock`
		name = 'WereNotGonnaTakeIt'
		singer = male
		title = qs(0xe1bb2771)
		year = 2005
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 6
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 1
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 165
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'werenotgonnatakeit'
		snare = 'werenotgonnatakeit'
		tom1 = 'StandardRock'
		tom2 = 'ModernRock'
		overall_song_volume = 0.3
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
				}
				{
					goal_name = qp_whammy_time
					custom_score_targets = [
						8
						11
						16
					]
					desc_txt_override = qs(0xfc03a2db)
					watched_sections = [
						6
						7
					]
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_notes
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_drum_accents
					static_targets = [
						50
						100
						200
					]
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
	whatdoiget = {
		allowed_in_quickplay = 1
		artist = qs(0x8e4e5064)
		checksum = whatdoiget
		duration = 178
		genre = punk
		name = 'WhatDoIGet'
		singer = male
		title = qs(0xbba7001a)
		year = 1978
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 6
		band_difficulty_rating = 4
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 500
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'whatdoiget'
		snare = 'whatdoiget'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -1.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
				}
				{
					goal_name = qp_alt_strum
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
					goal_name = qp_red_notes
				}
			]
			vocals = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_streak_phrases
				}
			]
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_hit_notes_band
				}
			]
		}
	}
	wish = {
		allowed_in_quickplay = 1
		artist = qs(0xa2a5e40c)
		checksum = wish
		duration = 220
		genre = industrial
		name = 'Wish'
		singer = male
		title = qs(0x9d6b83a3)
		year = 2002
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 1
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 5
		band_difficulty_rating = 5
		artist_text = $artist_text_by
		double_kick = 0
		flags = 0
		leaderboard = 1
		original_artist = 1
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		cymbal = 'ModernRock'
		drum_kit = 'ModernRock'
		hihat = 'ModernRock'
		kick = 'wish'
		snare = 'wish'
		tom1 = 'ModernRock'
		tom2 = 'ModernRock'
		overall_song_volume = -2.0
		challenge_props = {
			guitar = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_hit_chords
				}
				{
					goal_name = qp_spower_banked
				}
			]
			bass = [
				{
					goal_name = qp_score_points
				}
			]
			drum = [
				{
					goal_name = qp_score_points
				}
				{
					goal_name = qp_red_notes
				}
				{
					goal_name = qp_drum_accents
					static_targets = [
						200
						300
						350
					]
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
			band = [
				{
					goal_name = qp_score_points_stdband
				}
				{
					goal_name = qp_score_points_band
				}
				{
					goal_name = qp_spower_time_band
				}
			]
		}
	}
}
old_ondisc_songlist_props = {
}
mt_songlist_props = {
}
debug_songlist_props = {
	debugtestmixlevels = {
		checksum = debugtestmixlevels
		name = 'DEBUGTestMixLevels'
		title = qs(0x5d62941f)
		artist = qs(0xfa95e2aa)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		duration = 21
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
		name = 'DebugAutoFacial'
		title = qs(0x659a48af)
		artist = qs(0xfa95e2aa)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		duration = 21
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
		name = 'DebugBrokenChord'
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
		name = 'Debug_BandMoment'
		title = qs(0xe391fa17)
		artist = qs(0x45ff4cc0)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0x4b8729ef)
		singer = male
		genre = rock
		leaderboard = 1
		duration = 200
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
		name = 'DebugChalTest1'
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
		name = 'debugkicksustaintest'
		title = qs(0x81b01f18)
		artist = qs(0x65b52fb3)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		duration = 76
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
		name = 'DebugNoBass'
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
		name = 'DebugNoDrums'
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
		name = 'DebugNoGuitar'
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
		name = 'DebugNoVocals'
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
		name = 'DebugNoteTypeTest'
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
		name = 'DebugChalTest3'
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
		name = 'DebugCymbalswell'
		title = qs(0x50fcb39b)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		duration = 170
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
		name = 'DebugCymbalswelltest2'
		title = qs(0x2081f01c)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		duration = 92
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
		name = 'DebugChalTest5'
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
		name = 'DebugDownExtSust'
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
		name = 'DebugVolBand'
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
		name = 'DebugVolBass'
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
		name = 'DebugVolCrowd'
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
		name = 'DebugVolDrumCymbal'
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
		name = 'DebugVolDrumKick'
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
		name = 'DebugVolDrumSnare'
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
		name = 'DebugVolDrumTom'
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
		name = 'DebugVolGuitar'
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
		name = 'DebugVolVocals'
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
		name = 'DebugVoxLag'
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
		exit_script = testtoneexitscript
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
		name = 'tenseconddebug'
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
		name = 'DebugTestTones'
		title = qs(0xa16fa3dc)
		artist = qs(0x0a932d91)
		year = 2007
		artist_text = $artist_text_as_made_famous_by
		original_artist = 0
		leaderboard = 0
		countoff = 'sticks_normal'
		drum_kit = 'heavyrock'
		exit_script = testtoneexitscript
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
		name = 'DebugSync'
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
		name = 'DebugSyncPlayToAudio'
		title = qs(0x2d376c86)
		artist = qs(0x0a932d91)
		year = 2007
		artist_text = $artist_text_as_made_famous_by
		original_artist = 0
		leaderboard = 0
		exit_script = audio_sync_test_enable_highway
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
		name = 'DebugSyncAudioVisual'
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
		name = 'DebugSyncMuting'
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
		name = 'DebugTenSecond'
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
		name = 'DebugElevenSecond'
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
		name = 'DebugTwelveSecond'
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
		name = 'DebugDrumStreamTest'
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
	z_barbariantran = {
		checksum = z_barbariantran
		name = 'Z_BarbarianTran'
		title = qs(0x9901df37)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		duration = 5
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
	z_cavestagetran = {
		checksum = z_cavestagetran
		name = 'z_CaveStageTran'
		title = qs(0x23059259)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		duration = 5
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
		name = 'z_EgyptTran'
		title = qs(0xe319faa8)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		duration = 5
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
		name = 'z_EpicStageTran'
		title = qs(0x13db9a26)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		duration = 5
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
		name = 'z_FestivalTran'
		title = qs(0x3c91fb3d)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		duration = 5
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
		name = 'z_HouseBandTran'
		title = qs(0x16ad8246)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		duration = 5
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
		name = 'z_MansionStudioTran'
		title = qs(0x8e2e5d77)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		duration = 5
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
		name = 'z_PunkStageTran'
		title = qs(0x6421e29d)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		duration = 5
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
		name = 'z_RiotHouseTran'
		title = qs(0x21f2944b)
		artist = qs(0x2ae82c63)
		artist_text = $artist_text_by
		original_artist = 1
		year = 2020
		album_title = qs(0xd2b03253)
		singer = male
		genre = rock
		leaderboard = 1
		duration = 5
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
		name = 'Tut_Bass_Open'
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
		name = 'Tut_Drums_Accent'
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
		name = 'Tut_Drums_Basicbeat'
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
		name = 'Tut_Drums_Doublekick'
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
		name = 'Tut_Drums_Easy'
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
		name = 'Tut_Drums_Fill'
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
		name = 'Tut_Drums_Freeform'
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
		name = 'Tut_Drums_Kick'
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
		name = 'Tut_Drums_Roll'
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
		name = 'Tut_Drums_Sp'
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
		name = 'Tut_Drums_Swell'
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
		name = 'Tut_Guitar_Altstrum'
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
		name = 'Tut_Guitar_Chords'
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
		name = 'Tut_Guitar_Extended'
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
		name = 'Tut_Guitar_Fretting'
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
		name = 'Tut_Guitar_G_Only'
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
		name = 'Tut_Guitar_Gry'
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
		name = 'Tut_Guitar_Hammeron'
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
		name = 'Tut_Guitar_High_Note'
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
		name = 'Tut_Guitar_Hopochords'
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
		name = 'Tut_Guitar_Pulloff'
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
		name = 'Tut_Guitar_Sp'
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
		name = 'Tut_Guitar_Sp_Sustains'
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
		name = 'Tut_Guitar_Sustains'
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
		name = 'Tut_Guitar_Tapping'
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
		name = 'Tut_Vox_Blank'
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
		name = 'Tut_Vox_Freeform'
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
		name = 'Tut_Vox_Held'
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
		name = 'Tut_Vox_Spoken'
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
		name = 'Tut_Vox_Tw'
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
		name = 'Tut_Vox_Tw_Short'
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
		name = 'Tut_Vox_Tw_SP'
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
