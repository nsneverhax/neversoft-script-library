on_disc_list = gh5_songlist
on_disc_props = gh5_songlist_props
gh_songlist = [
	{
		list = gh5_songlist
		props = gh5_songlist_props
		frontend_desc = qs(0xe2f58429)
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
		frontend_desc = qs(0x0b5b41d8)
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
	}
	{
		list = tutorial_songlist
		props = tutorial_songlist_props
		frontend_desc = qs(0xae0e9bcf)
		crc = tutorial
	}
	{
		list = test_songlist
		props = test_songlist_props
		frontend_desc = qs(0x82511966)
		crc = test
	}
]
menu_songs = [
	bleedamerican
	blueday
	blueorchid
	comedown
	hungrylikethewolf
	lithium
	onebigholiday
	wolflikeme
]
download_songlist_props = {
	$gh5_dlc_songlist_props
	$gh4_songlist_props
	$gh4_dlc_songlist_props
	$gh4_1_songlist_props
	$gh4_2_songlist_props
	$gh4_3_songlist_props
	$gh5_1_songlist_props
	$gh5_2_songlist_props
	$gh5_3_songlist_props
	$gh5_4_songlist_props
}
additional_songlist_props = {
	$test_songlist_props
	$debug_songlist_props
	$tutorial_songlist_props
}
gh_songlist_props = {
	$download_songlist_props
	$gh5_songlist_props
	$additional_songlist_props
	$jammode_songlist_props
	$example_jam_songlist_props
	$jamsession_songlist_props
}
artist_text_by = qs(0x84df5648)
artist_text_from = qs(0xb2c93b23)
artist_text_as_made_famous_by = qs(0x85b4481b)
cover_artist_text = qs(0x13c0666a)
cover_artist_text_by = qs(0x00000000)
gh5_songlist = [
	apunk
	allalongthewatchtower
	alltheprettyfaces
	americangirl
	backround
	bleedamerican
	blueday
	blueorchid
	brianstorm
	bringthenoise
	bulletsbutterfly
	cigarettesweddingbands
	comedown
	dancingwithmyself
	deadbolt
	demon
	disconnected
	donewitheverything
	doyoufeellikewedo
	duhast
	exgirlfriend
	fame
	feelgoodinc
	gammaray
	gratitude
	hungrylikethewolf
	hurtssogood
	inmyplace
	inthemeantime
	incinerate
	jailbreak
	judith
	kryptonite
	la
	lithium
	lonelyisthenight
	looksthatkill
	lustforlife
	maidenmothercrone
	makeitwitchu
	medicate
	mirrorpeople
	nearlylostyou
	nevermissabeat
	noonetodependon
	onebigholiday
	onlyhappywhenitrains
	playthatfunkymusic
	pluginbaby
	ringoffire
	rockshow
	runnindownadream
	saturdaynightsalright
	scatterbrain
	lovetoken
	seven
	sexonfire
	shoutitoutloud
	sixdaysaweek
	smellsliketeenspirit
	sneakout
	solonely
	song2
	sowingseason
	spiritofradio
	steadyasshegoes
	streamlinewoman
	sultansofswing
	superstition
	sweatingbullets
	sympathyforthedevil
	theysay
	twentiethcenturyboy
	twentyfirstcentury
	twominutestomidnight
	underpressure
	wannabeinla
	wereanamericanband
	whatigot
	whybother
	wolflikeme
	womanfromtokyo
	youandme
	yougivelove
	younkfunk
]
debug_songlist = [
	debugbrokenchord
	debugchaltest1
	debugchaltest3
	debugchaltest5
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
	drumstreamtest
	synctest
	synctestplaytoaudio
	synctestaudioandvisual
	synctestmuting
	tenseconddebug
	elevenseconddebug
	twelveseconddebug
	testtones
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
gh5_songlist_props = {
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
		vocals_scroll_speed = 1.15
		album_title = qs(0x7f342f46)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 3
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
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
		trivia_no_phrases
		mono_drums = 1
		vocals_scroll_speed = 1.2800001
		album_title = qs(0xb04e97d4)
		double_kick = 0
		guitar_difficulty_rating = 2
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 1
		band_difficulty_rating = 2
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'allalongthewatchtower'
		kick = 'allalongthewatchtower'
		tom1 = 'classicrockhigh'
		tom2 = 'classicrockhigh'
		hihat = 'classicrock'
		cymbal = 'classicrock'
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
		vocals_scroll_speed = 1.15
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
	americangirl = {
		checksum = americangirl
		Name = 'AmericanGirl'
		title = qs(0x61e349ba)
		artist = qs(0x9acc5fb9)
		year = 1976
		Duration = 236
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 12
		leaderboard = 1
		singer = male
		genre = `classic	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		trivia_no_phrases
		overall_song_volume = 0.5
		vocals_scroll_speed = 1.2
		album_title = qs(0x9acc5fb9)
		parts_with_mic = [
			GUITARIST
			BASSIST
		]
		guitar_difficulty_rating = 7
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 3
		band_difficulty_rating = 6
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'AmericanGirl'
		kick = 'AmericanGirl'
		tom1 = 'ModernRockHigh'
		tom2 = 'ModernRockHigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	backround = {
		checksum = backround
		Name = 'BackRound'
		title = qs(0x98712c90)
		artist = qs(0x15c1e33a)
		year = 2009
		Duration = 239
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 11
		leaderboard = 1
		singer = male
		genre = `hard	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.5
		vocals_scroll_speed = 1.15
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 1
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		trivia_no_phrases
		album_title = qs(0x72c7dfb5)
		double_kick = 0
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 9
		band_difficulty_rating = 6
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'backround'
		kick = 'backround'
		tom1 = 'heavyrocklow'
		tom2 = 'heavyrocklow'
		hihat = 'heavyrock'
		cymbal = 'heavyrock'
	}
	bleedamerican = {
		checksum = bleedamerican
		Name = 'BleedAmerican'
		title = qs(0x5247380b)
		artist = qs(0xa0c30267)
		year = 2001
		Duration = 190
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 6
		leaderboard = 1
		singer = male
		genre = `pop	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		trivia_no_phrases
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 1
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		vocals_scroll_speed = 1.3
		album_title = qs(0x5247380b)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 4
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'bleedamerican'
		kick = 'bleedamerican'
		tom1 = 'ModernRockHigh'
		tom2 = 'ModernRockHigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	blueday = {
		checksum = blueday
		Name = 'BlueDay'
		title = qs(0xc45fd778)
		artist = qs(0xb8d7eba5)
		year = 2008
		Duration = 251
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		venue = 2
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = `indie	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		vocals_scroll_speed = 1.25
		trivia_no_phrases
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 1
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		album_title = qs(0x09c32524)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 4
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'blueday'
		kick = 'blueday'
		tom1 = 'modernrocklow'
		tom2 = 'modernrocklow'
		hihat = 'modernrock'
		cymbal = 'modernrock'
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
		vocals_scroll_speed = 1.24
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		trivia_no_phrases
		fake_bass_mode = 1
		vocals_scroll_speed = 1.2700001
		album_title = qs(0x9cb44dc4)
		double_kick = 0
		guitar_difficulty_rating = 2
		bass_difficulty_rating = 1
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 1
		band_difficulty_rating = 2
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'modernrocklow'
		kick = 'blueorchid'
		tom1 = 'modernrocklow'
		tom2 = 'modernrocklow'
		hihat = 'modernrock'
		cymbal = 'modernrock'
	}
	brianstorm = {
		checksum = brianstorm
		Name = 'Brianstorm'
		title = qs(0x4b8c9eb3)
		artist = qs(0x0bd159e2)
		year = 2007
		Duration = 178
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 12
		leaderboard = 1
		singer = male
		genre = alternative
		countoff = 'sticks_normal'
		drum_kit = 'HeavyRock'
		overall_song_volume = 0.0
		vocals_scroll_speed = 1.3
		trivia_no_phrases
		album_title = qs(0x88a3dc80)
		double_kick = 0
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 10
		band_difficulty_rating = 7
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'brianstorm'
		kick = 'brianstorm'
		tom1 = 'modernrockHigh'
		tom2 = 'modernrockHigh'
		hihat = 'modernrock'
		cymbal = 'modernrock'
	}
	bringthenoise = {
		checksum = bringthenoise
		Name = 'BringTheNoise'
		title = qs(0xd052408e)
		artist = qs(0x7125f2fd)
		year = 2009
		Duration = 218
		artist_text = $artist_text_by
		original_artist = 1
		venue = 8
		leaderboard = 1
		singer = male
		genre = hip_hop
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -1.0
		vocals_scroll_speed = 1.5
		trivia_no_phrases
		album_title = qs(0x47cc6adf)
		album_img = 'placeholder_album'
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 2
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'BringTheNoise'
		kick = 'BringTheNoise'
		tom1 = 'FusionHigh'
		tom2 = 'FusionHigh'
		hihat = 'ClassicRock'
		cymbal = 'ClassicRock'
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
		vocals_scroll_speed = 1.25
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		trivia_no_phrases
		vocals_scroll_speed = 1.25
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
		disable_for_medley_mode = FALSE
		flags = 0
	}
	cigarettesweddingbands = {
		checksum = cigarettesweddingbands
		Name = 'CigarettesWeddingBands'
		title = qs(0x66200b04)
		artist = qs(0x273ff39e)
		year = 2007
		Duration = 283
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		venue = 3
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = `southern	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.0
		vocals_scroll_speed = 1.25
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 150
		trivia_no_phrases
		vocals_scroll_speed = 1.2700001
		album_title = qs(0x8208e1ae)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 3
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'CigarettesWeddingBands'
		kick = 'CigarettesWeddingBands'
		tom1 = 'ModernRockHigh'
		tom2 = 'ModernRockHigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
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
		vocals_scroll_speed = 1.15
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
	dancingwithmyself = {
		checksum = dancingwithmyself
		Name = 'DancingWithMyself'
		title = qs(0x804ad851)
		artist = qs(0xb09f2ddc)
		year = 1982
		Duration = 229
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 4
		leaderboard = 1
		singer = male
		genre = `new	wave`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.2
		vocals_scroll_speed = 1.15
		album_title = qs(0xb09f2ddc)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 2
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'dancingwithmyself'
		kick = 'dancingwithmyself'
		tom1 = 'ModernRocklow'
		tom2 = 'ModernRocklow'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
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
		vocals_scroll_speed = 1.15
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
		trivia_no_phrases
		vocals_scroll_speed = 1.3
		album_title = qs(0xb843e5f1)
		double_kick = 1
		guitar_difficulty_rating = 7
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 2
		drums_difficulty_rating = 8
		band_difficulty_rating = 7
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'demon'
		kick = 'demon'
		tom1 = 'metallow'
		tom2 = 'metallow'
		hihat = 'metal'
		cymbal = 'metal'
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
		vocals_scroll_speed = 1.3399999
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
		vocals_scroll_speed = 1.15
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
		snare = 'donewitheverything'
		kick = 'donewitheverything'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
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
		vocals_scroll_speed = 1.3
		trivia_no_phrases
		album_title = qs(0x2a1e193f)
		double_kick = 0
		guitar_difficulty_rating = 9
		bass_difficulty_rating = 8
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 3
		band_difficulty_rating = 8
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'classicrock'
		kick = 'classicrock'
		tom1 = 'classicrock'
		tom2 = 'classicrocklow'
		hihat = 'classicrock'
		cymbal = 'classicrock'
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
		trivia_no_phrases
		album_title = qs(0xb67b3f63)
		double_kick = 0
		vocals_scroll_speed = 1.2
		album_img = 'placeholder_album'
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 2
		drums_difficulty_rating = 1
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
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
		vocals_scroll_speed = 1.4
		album_title = qs(0xc0cc0217)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 6
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'exgirlfriend'
		kick = 'exgirlfriend'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	fame = {
		checksum = fame
		Name = 'Fame'
		title = qs(0xc4416e9a)
		artist = qs(0x7514eafa)
		year = 1975
		Duration = 258
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 3
		leaderboard = 1
		singer = male
		genre = `classic	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -2.5
		vocals_scroll_speed = 1.4499999
		trivia_no_phrases
		album_title = qs(0xd8387ab5)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 1
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'fame'
		kick = 'fame'
		tom1 = 'modernrocklow'
		tom2 = 'modernrocklow'
		hihat = 'modernrock'
		cymbal = 'modernrock'
	}
	feelgoodinc = {
		checksum = feelgoodinc
		Name = 'FeelGoodInc'
		title = qs(0xda302988)
		artist = qs(0x1223258e)
		year = 2005
		Duration = 222
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 1
		leaderboard = 1
		singer = male
		genre = hip_hop
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -1.8
		vocals_scroll_speed = 1.4
		album_title = qs(0xf12cfb85)
		double_kick = 0
		guitar_difficulty_rating = 2
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 1
		band_difficulty_rating = 2
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'feelgoodinc'
		kick = 'feelgoodinc'
		tom1 = 'fusionhigh'
		tom2 = 'fusionhigh'
		hihat = 'fusion'
		cymbal = 'fusion'
	}
	gammaray = {
		checksum = gammaray
		Name = 'GammaRay'
		title = qs(0x8d610ddf)
		artist = qs(0xa5c678cb)
		year = 2008
		Duration = 179
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 1
		leaderboard = 1
		singer = male
		genre = alternative
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -2.2
		trivia_no_phrases
		vocals_scroll_speed = 1.23
		album_title = qs(0xd3ee4642)
		double_kick = 0
		guitar_difficulty_rating = 2
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 4
		band_difficulty_rating = 2
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'gammaray'
		kick = 'gammaray'
		tom1 = 'modernrockhigh'
		tom2 = 'modernrockhigh'
		hihat = 'modernrock'
		cymbal = 'modernrock'
	}
	gratitude = {
		checksum = gratitude
		Name = 'Gratitude'
		title = qs(0xf071e4da)
		artist = qs(0x70cd0657)
		year = 1992
		Duration = 168
		artist_text = $artist_text_by
		original_artist = 1
		venue = 2
		leaderboard = 1
		singer = male
		genre = hip_hop
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		trivia_no_phrases
		vocals_scroll_speed = 1.3
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 1
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		album_title = qs(0x41d62bec)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 1
		drums_difficulty_rating = 3
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'gratitude'
		kick = 'gratitude'
		tom1 = 'StandardRocklow'
		tom2 = 'StandardRocklow'
		hihat = 'StandardRock'
		cymbal = 'StandardRock'
	}
	hungrylikethewolf = {
		checksum = hungrylikethewolf
		Name = 'HungryLikeTheWolf'
		title = qs(0xb36e376c)
		artist = qs(0xe75b0567)
		year = 1982
		Duration = 222
		artist_text = $artist_text_by
		original_artist = 1
		venue = 6
		leaderboard = 1
		singer = male
		genre = `new	wave`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -2.5
		trivia_no_phrases
		vocals_scroll_speed = 1.15
		album_title = qs(0x246240f0)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 6
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'hungrylikethewolf'
		kick = 'hungrylikethewolf'
		tom1 = 'fusionhigh'
		tom2 = 'fusionhigh'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	hurtssogood = {
		checksum = hurtssogood
		Name = 'HurtsSoGood'
		title = qs(0x60c29978)
		artist = qs(0x1d512cd5)
		year = 1982
		Duration = 222
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 2
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.25
		vocals_scroll_speed = 1.15
		trivia_no_phrases
		album_title = qs(0xd963257b)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 1
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'hurtssogood'
		kick = 'hurtssogood'
		tom1 = 'StandardRocklow'
		tom2 = 'StandardRocklow'
		hihat = 'StandardRock'
		cymbal = 'StandardRock'
	}
	inmyplace = {
		checksum = inmyplace
		Name = 'InMyPlace'
		title = qs(0x64b3f7ff)
		artist = qs(0xd6fcabfc)
		year = 2002
		Duration = 229
		artist_text = $artist_text_by
		original_artist = 1
		venue = 1
		leaderboard = 1
		singer = male
		genre = `pop	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.4
		vocals_scroll_speed = 1.15
		trivia_no_phrases
		album_title = qs(0x4046bc82)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 1
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'inmyplace'
		kick = 'inmyplace'
		tom1 = 'classicrocklow'
		tom2 = 'classicrocklow'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	inthemeantime = {
		checksum = inthemeantime
		Name = 'InTheMeantime'
		title = qs(0x50ff2fd8)
		artist = qs(0xe7da32da)
		year = 2007
		Duration = 285
		artist_text = $artist_text_by
		original_artist = 1
		venue = 5
		leaderboard = 1
		singer = male
		genre = alternative
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.5
		trivia_no_phrases
		vocals_scroll_speed = 1.3199999
		vocals_pitch_score_shift = {
			cents = -15
		}
		album_title = qs(0x47cc6adf)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 3
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'inthemeantime'
		kick = 'inthemeantime'
		tom1 = 'modernrockhigh'
		tom2 = 'modernrockhigh'
		hihat = 'modernrock'
		cymbal = 'modernrock'
	}
	incinerate = {
		checksum = incinerate
		Name = 'Incinerate'
		title = qs(0xb729c84f)
		artist = qs(0x79a6a753)
		year = 2006
		Duration = 299
		artist_text = $artist_text_by
		original_artist = 1
		venue = 10
		leaderboard = 1
		singer = male
		genre = alternative
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -0.75
		vocals_scroll_speed = 1.15
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		trivia_no_phrases
		album_title = qs(0xdeab0335)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 2
		drums_difficulty_rating = 5
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'incinerate'
		kick = 'incinerate'
		tom1 = 'modernrockhigh'
		tom2 = 'modernrockhigh'
		hihat = 'modernrock'
		cymbal = 'modernrock'
	}
	jailbreak = {
		checksum = jailbreak
		Name = 'Jailbreak'
		title = qs(0x617c093e)
		artist = qs(0x5ace7011)
		year = 1976
		Duration = 245
		artist_text = $artist_text_by
		original_artist = 1
		venue = 6
		leaderboard = 1
		singer = male
		genre = `hard	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.5
		vocals_scroll_speed = 1.15
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 250
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		trivia_no_phrases
		album_title = qs(0x617c093e)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 8
		drums_difficulty_rating = 4
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'jailbreak'
		kick = 'jailbreak'
		tom1 = 'ClassicRocklow'
		tom2 = 'ClassicRockHigh'
		hihat = 'classicrock'
		cymbal = 'classicrock'
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
		vocals_scroll_speed = 1.15
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
	kryptonite = {
		checksum = kryptonite
		Name = 'Kryptonite'
		title = qs(0xa387ef12)
		artist = qs(0x7bed2195)
		year = 2000
		Duration = 240
		artist_text = $artist_text_by
		original_artist = 1
		venue = 4
		leaderboard = 1
		singer = male
		genre = `southern	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		trivia_no_phrases
		vocals_scroll_speed = 1.3
		album_title = qs(0xc1bbd4ac)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 1
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 5
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'kryptonite'
		kick = 'kryptonite'
		tom1 = 'HeavyRocklow'
		tom2 = 'HeavyRocklow'
		hihat = 'HeavyRock'
		cymbal = 'HeavyRock'
	}
	la = {
		checksum = la
		Name = 'LA'
		title = qs(0x52e64ca3)
		artist = qs(0xaca35e82)
		year = 2000
		Duration = 199
		artist_text = $artist_text_by
		original_artist = 1
		venue = 5
		leaderboard = 1
		singer = male
		genre = `indie	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.2
		vocals_scroll_speed = 1.3
		album_title = qs(0x4279642d)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 3
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'la'
		kick = 'la'
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
		vocals_scroll_speed = 1.23
		album_title = qs(0xfcb21864)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 3
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		Band = band_kurtcobain
		snare = 'lithium'
		kick = 'lithium'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	lonelyisthenight = {
		checksum = lonelyisthenight
		Name = 'LonelyIsTheNight'
		title = qs(0x685b8d94)
		artist = qs(0xea4019ef)
		year = 1981
		Duration = 311
		album_img = 'DarkestHour_DeliverUs'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 7
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'bigroomrock'
		overall_song_volume = 0.0
		vocals_scroll_speed = 1.15
		trivia_no_phrases
		album_title = qs(0x7c5badc4)
		double_kick = 0
		parts_with_mic = [
			GUITARIST
			BASSIST
		]
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 9
		drums_difficulty_rating = 3
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'lonelyisthenight'
		kick = 'lonelyisthenight'
		tom1 = 'ClassicRockHigh'
		tom2 = 'ClassicRockHigh'
		hihat = 'classicrock'
		cymbal = 'classicrock'
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
		vocals_scroll_speed = 1.31
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
		vocals_scroll_speed = 1.31
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
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'lovetoken'
		kick = 'lovetoken'
		tom1 = 'HeavyRocklow'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	lustforlife = {
		checksum = lustforlife
		Name = 'LustForLife'
		title = qs(0x79ab32ca)
		artist = qs(0xa55759da)
		year = 1993
		Duration = 329
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 13
		leaderboard = 1
		singer = male
		genre = punk
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -0.8
		vocals_scroll_speed = 1.25
		album_title = qs(0xf14fde0e)
		double_kick = 0
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 7
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'lustforlife'
		kick = 'lustforlife'
		tom1 = 'ModernRocklow'
		tom2 = 'ModernRocklow'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	maidenmothercrone = {
		checksum = maidenmothercrone
		Name = 'MaidenMotherCrone'
		title = qs(0xe3b9992c)
		artist = qs(0x3f6b0297)
		year = 2008
		Duration = 243
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 10
		leaderboard = 1
		singer = male
		genre = `hard	rock`
		countoff = 'sticks_normal'
		drum_kit = 'modernrock'
		overall_song_volume = 0.0
		trivia_no_phrases
		vocals_pitch_score_shift = {
			cents = 20
		}
		vocals_scroll_speed = 1.3
		album_title = qs(0x07eaa524)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 7
		band_difficulty_rating = 5
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'maidenmothercrone'
		kick = 'maidenmothercrone'
		tom1 = 'HeavyRocklow'
		tom2 = 'HeavyRocklow'
		hihat = 'HeavyRock'
		cymbal = 'HeavyRock'
	}
	makeitwitchu = {
		checksum = makeitwitchu
		Name = 'MakeItWitChu'
		title = qs(0xa8d3790a)
		artist = qs(0x3fc902a5)
		year = 2007
		Duration = 279
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 5
		leaderboard = 1
		singer = male
		genre = `blues	rock`
		countoff = 'sticks_normal'
		drum_kit = 'modernrock'
		overall_song_volume = -2.0
		vocals_scroll_speed = 1.15
		trivia_no_phrases
		album_title = qs(0x56ec4243)
		double_kick = 0
		parts_with_mic = [
			GUITARIST
			BASSIST
		]
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'MakeItWitChu'
		kick = 'MakeItWitChu'
		tom1 = 'ModernRocklow'
		tom2 = 'ModernRocklow'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	medicate = {
		checksum = medicate
		Name = 'Medicate'
		title = qs(0x18a1a564)
		artist = qs(0x9aaf0c89)
		year = 2009
		Duration = 271
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 11
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.8
		vocals_scroll_speed = 1.15
		trivia_no_phrases
		album_title = qs(0x76a90f47)
		double_kick = 1
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 6
		band_difficulty_rating = 5
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'medicate'
		kick = 'medicate'
		tom1 = 'FusionHigh'
		tom2 = 'FusionHigh'
		hihat = 'HeavyRock'
		cymbal = 'HeavyRock'
	}
	mirrorpeople = {
		checksum = mirrorpeople
		Name = 'MirrorPeople'
		title = qs(0xcb368520)
		artist = qs(0xd92a847f)
		year = 2008
		Duration = 243
		album_img = 'LoveAndRockets_EarthSunMoon'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 4
		leaderboard = 1
		singer = male
		genre = alternative
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -1.6
		vocals_scroll_speed = 1.15
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		album_title = qs(0x47cc6adf)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 2
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'mirrorpeople'
		kick = 'mirrorpeople'
		tom1 = 'BigRoomRock'
		tom2 = 'BigRoomRock'
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
		vocals_scroll_speed = 1.15
		trivia_no_phrases
		album_title = qs(0x756951de)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 6
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'nearlylostyou'
		kick = 'nearlylostyou'
		tom1 = 'modernrockhigh'
		tom2 = 'modernrockhigh'
		hihat = 'modernrock'
		cymbal = 'modernrock'
	}
	nevermissabeat = {
		checksum = nevermissabeat
		Name = 'NeverMissABeat'
		title = qs(0x3d0437a3)
		artist = qs(0x10e22047)
		year = 2008
		Duration = 189
		artist_text = $artist_text_by
		original_artist = 1
		venue = 4
		leaderboard = 1
		singer = male
		genre = `indie	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		vocals_scroll_speed = 1.4499999
		album_title = qs(0xfea207ac)
		double_kick = 0
		parts_with_mic = [
			GUITARIST
			BASSIST
		]
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 3
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'nevermissabeat'
		kick = 'nevermissabeat'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
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
		vocals_scroll_speed = 1.25
		trivia_no_phrases
		album_title = qs(0xcf9d08e0)
		album_img = placeholder_album
		double_kick = 1
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 2
		drums_difficulty_rating = 7
		band_difficulty_rating = 6
		Band = band_santana
		disable_for_medley_mode = FALSE
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
		vocals_scroll_speed = 1.15
		album_title = qs(0xca5b4184)
		double_kick = 0
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 1
		drums_difficulty_rating = 7
		band_difficulty_rating = 6
		disable_for_medley_mode = FALSE
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
		vocals_scroll_speed = 1.15
		album_title = qs(0x134d4360)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 1
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		Band = band_shirleymanson
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
		vocals_scroll_speed = 1.15
		trivia_no_phrases
		album_title = qs(0xb2e85534)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'playthatfunkymusic'
		kick = 'playthatfunkymusic'
		tom1 = 'ClassicRocklow'
		tom2 = 'ClassicRockHigh'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	pluginbaby = {
		checksum = pluginbaby
		Name = 'PlugInBaby'
		title = qs(0x14b53d96)
		artist = qs(0xb1aa12ed)
		year = 2001
		Duration = 223
		artist_text = $artist_text_by
		original_artist = 1
		venue = 99
		leaderboard = 1
		singer = male
		genre = alternative
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 2.0
		vocals_scroll_speed = 1.15
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 170
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		trivia_no_phrases
		album_title = qs(0xad5c1697)
		album_img = placeholder_album
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 3
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		Band = band_mattbellamy
		snare = 'pluginbaby'
		kick = 'pluginbaby'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
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
		vocals_scroll_speed = 1.15
		album_title = qs(0xc5ede802)
		double_kick = 0
		guitar_difficulty_rating = 2
		bass_difficulty_rating = 1
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 3
		band_difficulty_rating = 2
		disable_for_medley_mode = FALSE
		flags = 0
		Band = band_johnnycash
		snare = 'RingOfFire'
		kick = 'RingOfFire'
		tom1 = 'StandardRock'
		tom2 = 'StandardRocklow'
		hihat = 'StandardRock'
		cymbal = 'StandardRock'
	}
	rockshow = {
		checksum = rockshow
		Name = 'RockShow'
		title = qs(0x99defbd3)
		artist = qs(0xa92c5d80)
		year = 2001
		Duration = 174
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 6
		leaderboard = 1
		singer = male
		genre = `pop	punk`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		vocals_scroll_speed = 1.23
		album_title = qs(0x85ebfdec)
		double_kick = 0
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 7
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'rockshow'
		kick = 'rockshow'
		tom1 = 'heavyrockhigh'
		tom2 = 'heavyrockhigh'
		hihat = 'heavyrock'
		cymbal = 'heavyrock'
	}
	runnindownadream = {
		checksum = runnindownadream
		Name = 'RunninDownADream'
		title = qs(0xa90f56ac)
		artist = qs(0x9774a819)
		year = 1989
		Duration = 275
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 10
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		vocals_scroll_speed = 1.15
		album_title = qs(0x33c760fa)
		double_kick = 0
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 1
		band_difficulty_rating = 5
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'runnindownadream'
		kick = 'runnindownadream'
		tom1 = 'ClassicRockHigh'
		tom2 = 'ClassicRockHigh'
		hihat = 'classicrock'
		cymbal = 'classicrock'
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
		vocals_scroll_speed = 1.3299999
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
		vocals_scroll_speed = 1.15
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 177
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		trivia_no_phrases
		album_title = qs(0x9aa7fb57)
		album_img = placeholder_album
		double_kick = 1
		guitar_difficulty_rating = 9
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 0
		drums_difficulty_rating = 10
		band_difficulty_rating = 8
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'Scatterbrain'
		kick = 'Scatterbrain'
		tom1 = 'FusionHigh'
		tom2 = 'FusionHigh'
		hihat = 'ClassicRock'
		cymbal = 'ClassicRock'
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
		vocals_scroll_speed = 1.15
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
		vocals_scroll_speed = 1.15
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
		vocals_scroll_speed = 1.3
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
	sixdaysaweek = {
		checksum = sixdaysaweek
		Name = 'SixDaysAWeek'
		title = qs(0x0918524d)
		artist = qs(0x435f535f)
		year = 2008
		Duration = 197
		album_img = 'DreamTheater_ImagesAndWords'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 12
		leaderboard = 1
		singer = male
		genre = punk
		countoff = 'sticks_huge'
		drum_kit = 'heavyrock'
		overall_song_volume = -0.5
		vocals_scroll_speed = 1.25
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 1
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 1
		trivia_no_phrases
		album_title = qs(0x6a3650f2)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 6
		band_difficulty_rating = 5
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'sixdaysaweek'
		kick = 'sixdaysaweek'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
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
		vocals_scroll_speed = 1.25
		album_title = qs(0x39664e39)
		double_kick = 0
		Band = band_kurtcobain
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 4
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'SmellsLikeTeenSpirit'
		kick = 'SmellsLikeTeenSpirit'
		tom1 = 'heavyrockHigh'
		tom2 = 'heavyrockHigh'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	sneakout = {
		checksum = sneakout
		Name = 'SneakOut'
		title = qs(0xd26c8d45)
		artist = qs(0xf9d77fc2)
		year = 2008
		Duration = 198
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 11
		leaderboard = 1
		singer = male
		genre = `blues	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.5
		vocals_scroll_speed = 1.15
		album_title = qs(0xf488cc33)
		double_kick = 0
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 6
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 5
		band_difficulty_rating = 5
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'sneakout'
		kick = 'sneakout'
		tom1 = 'ClassicRockHigh'
		tom2 = 'ClassicRockHigh'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	solonely = {
		checksum = solonely
		Name = 'SoLonely'
		title = qs(0x34f46ff3)
		artist = qs(0xf12a0396)
		year = 1978
		Duration = 307
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 10
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.0
		vocals_scroll_speed = 1.15
		vocals_pitch_score_shift = {
			cents = 12
		}
		album_title = qs(0x4b7c5a44)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 9
		drums_difficulty_rating = 4
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'SoLonely'
		kick = 'SoLonely'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
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
		vocals_scroll_speed = 1.3
		guitar_difficulty_rating = 2
		bass_difficulty_rating = 1
		vocals_difficulty_rating = 2
		drums_difficulty_rating = 3
		band_difficulty_rating = 2
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'song2'
		kick = 'song2'
		tom1 = 'HeavyRocklow'
		tom2 = 'HeavyRocklow'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	sowingseason = {
		checksum = sowingseason
		Name = 'SowingSeason'
		title = qs(0x4e18ea4f)
		artist = qs(0x78c316f4)
		year = 2006
		Duration = 273
		artist_text = $artist_text_by
		original_artist = 1
		venue = 2
		leaderboard = 1
		singer = male
		genre = `indie	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.0
		vocals_scroll_speed = 1.15
		trivia_no_phrases
		album_title = qs(0x8aa3f4fd)
		double_kick = 0
		guitar_difficulty_rating = 2
		bass_difficulty_rating = 1
		vocals_difficulty_rating = 5
		drums_difficulty_rating = 3
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'sowingseason'
		kick = 'sowingseason'
		tom1 = 'ModernRocklow'
		tom2 = 'ModernRocklow'
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
		vocals_scroll_speed = 1.15
		trivia_no_phrases
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
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'spiritofradio'
		kick = 'spiritofradio'
		tom1 = 'HeavyRockhigh'
		tom2 = 'HeavyRockhigh'
		hihat = 'HeavyRock'
		cymbal = 'HeavyRock'
	}
	steadyasshegoes = {
		checksum = steadyasshegoes
		Name = 'SteadyAsSheGoes'
		title = qs(0xd76b0dfb)
		artist = qs(0xfeac2b68)
		year = 2006
		Duration = 222
		artist_text = $artist_text_by
		venue = 2
		original_artist = 1
		leaderboard = 1
		singer = male
		genre = `blues	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 3.5
		vocals_scroll_speed = 1.25
		trivia_no_phrases
		album_title = qs(0xed3917af)
		double_kick = 0
		parts_with_mic = [
			GUITARIST
			BASSIST
		]
		album_img = 'placeholder_album'
		guitar_difficulty_rating = 2
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 2
		band_difficulty_rating = 2
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'steadyasshegoes'
		kick = 'steadyasshegoes'
		tom1 = 'HeavyRockhigh'
		tom2 = 'HeavyRockhigh'
		hihat = 'HeavyRock'
		cymbal = 'HeavyRock'
	}
	streamlinewoman = {
		checksum = streamlinewoman
		Name = 'StreamlineWoman'
		title = qs(0x75459dce)
		artist = qs(0x9864c365)
		year = 2006
		Duration = 250
		artist_text = $artist_text_by
		original_artist = 1
		venue = 11
		leaderboard = 1
		singer = male
		genre = `southern	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 0.0
		trivia_no_phrases
		vocals_scroll_speed = 1.23
		album_title = qs(0xc4b9e6ea)
		double_kick = 0
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 4
		band_difficulty_rating = 5
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'streamlinewoman'
		kick = 'streamlinewoman'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	sultansofswing = {
		checksum = sultansofswing
		Name = 'SultansOfSwing'
		title = qs(0x813a064c)
		artist = qs(0x56bd542a)
		year = 1978
		Duration = 361
		artist_text = $artist_text_by
		original_artist = 1
		venue = 5
		leaderboard = 1
		singer = male
		genre = `classic	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		vocals_scroll_speed = 1.2700001
		overall_song_volume = -0.9
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 200
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
		trivia_no_phrases
		album_title = qs(0x56bd542a)
		album_img = placeholder_album
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 7
		drums_difficulty_rating = 7
		band_difficulty_rating = 6
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'sultansofswing'
		kick = 'sultansofswing'
		tom1 = 'ClassicRockHigh'
		tom2 = 'ClassicRockHigh'
		hihat = 'ClassicRock'
		cymbal = 'ClassicRock'
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
		vocals_scroll_speed = 1.15
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
		double_kick = 1
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
		vocals_scroll_speed = 1.3
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
	theysay = {
		checksum = theysay
		Name = 'TheySay'
		title = qs(0x471cb1a0)
		artist = qs(0x49e82531)
		year = 2008
		Duration = 173
		artist_text = $artist_text_by
		original_artist = 1
		venue = 1
		leaderboard = 1
		singer = male
		genre = `hard	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.5
		vocals_scroll_speed = 1.15
		album_title = qs(0x45f3b639)
		double_kick = 0
		guitar_difficulty_rating = 1
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 3
		drums_difficulty_rating = 3
		band_difficulty_rating = 2
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'theysay'
		kick = 'theysay'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	twentiethcenturyboy = {
		checksum = twentiethcenturyboy
		Name = 'TwentiethCenturyBoy'
		title = qs(0x54b9daa8)
		artist = qs(0x2ab4a4af)
		year = 1973
		Duration = 234
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 8
		leaderboard = 1
		singer = male
		genre = `glam	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = -1.0
		vocals_scroll_speed = 1.15
		trivia_no_phrases
		album_title = qs(0x17069b3e)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 4
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 2
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'twentiethcenturyboy'
		kick = 'twentiethcenturyboy'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
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
		vocals_scroll_speed = 1.15
		trivia_no_phrases
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
		disable_for_medley_mode = FALSE
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
		vocals_scroll_speed = 1.3299999
		album_title = qs(0xb878610b)
		double_kick = 0
		guitar_difficulty_rating = 6
		bass_difficulty_rating = 7
		vocals_difficulty_rating = 9
		drums_difficulty_rating = 6
		band_difficulty_rating = 6
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'twominutestomidnight'
		kick = 'twominutestomidnight'
		tom1 = 'Metallow'
		tom2 = 'Metallow'
		hihat = 'Metal'
		cymbal = 'ClassicRock'
	}
	underpressure = {
		checksum = underpressure
		Name = 'UnderPressure'
		title = qs(0xb39ca344)
		artist = qs(0xb31830c7)
		year = 1982
		Duration = 234
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 3
		leaderboard = 1
		singer = male
		genre = rock
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 2.5
		vocals_scroll_speed = 1.15
		album_title = qs(0xca046b38)
		double_kick = 0
		parts_with_mic = [
			GUITARIST
			BASSIST
		]
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'underpressure'
		kick = 'underpressure'
		tom1 = 'ModernRocklow'
		tom2 = 'ModernRocklow'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	wannabeinla = {
		checksum = wannabeinla
		Name = 'WannaBeInLA'
		title = qs(0x562a7c6a)
		artist = qs(0xe28db056)
		year = 2008
		Duration = 140
		album_img = 'placeholder_album'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 7
		leaderboard = 1
		singer = male
		genre = alternative
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		overall_song_volume = 1.5
		vocals_scroll_speed = 1.15
		trivia_no_phrases
		album_title = qs(0x53b132ed)
		double_kick = 0
		parts_with_mic = [
			GUITARIST
			BASSIST
		]
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 2
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'wannabeinla'
		kick = 'wannabeinla'
		tom1 = 'StandardRock'
		tom2 = 'StandardRock'
		hihat = 'StandardRock'
		cymbal = 'StandardRock'
	}
	wereanamericanband = {
		checksum = wereanamericanband
		Name = 'WereAnAmericanBand'
		title = qs(0x96b61e95)
		artist = qs(0x1685a75e)
		year = 1973
		Duration = 211
		artist_text = $artist_text_by
		original_artist = 1
		venue = 9
		leaderboard = 1
		singer = male
		genre = `classic	rock`
		countoff = 'sticks_normal'
		drum_kit = 'classicrock'
		parts_with_mic = [
			GUITARIST
			BASSIST
		]
		overall_song_volume = 0.0
		trivia_no_phrases
		vocals_scroll_speed = 1.3
		album_title = qs(0x96b61e95)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 5
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 5
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'wereanamericanband'
		kick = 'wereanamericanband'
		tom1 = 'ClassicRockHigh'
		tom2 = 'ClassicRockHigh'
		hihat = 'classicrock'
		cymbal = 'classicrock'
	}
	whatigot = {
		checksum = whatigot
		Name = 'WhatIGot'
		title = qs(0x88879b72)
		artist = qs(0xd287d747)
		year = 1996
		Duration = 168
		album_img = 'Weezer_Pinkerton'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 8
		leaderboard = 1
		singer = male
		genre = `surf	rock`
		countoff = 'sticks_normal'
		drum_kit = 'modernrock'
		overall_song_volume = -0.5
		vocals_scroll_speed = 1.56
		album_title = qs(0xd287d747)
		double_kick = 0
		guitar_difficulty_rating = 4
		bass_difficulty_rating = 2
		vocals_difficulty_rating = 8
		drums_difficulty_rating = 2
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'whatigot'
		kick = 'whatigot'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	whybother = {
		checksum = whybother
		Name = 'WhyBother'
		title = qs(0x89769a1a)
		artist = qs(0x4b1d2950)
		year = 1996
		Duration = 126
		album_img = 'Weezer_Pinkerton'
		artist_text = $artist_text_by
		original_artist = 1
		venue = 6
		leaderboard = 1
		singer = male
		genre = `pop	punk`
		countoff = 'sticks_normal'
		drum_kit = 'modernrock'
		overall_song_volume = 0.0
		vocals_scroll_speed = 1.3
		album_title = qs(0x88e20598)
		double_kick = 0
		guitar_difficulty_rating = 2
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 4
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'whybother'
		kick = 'whybother'
		tom1 = 'ModernRockhigh'
		tom2 = 'ModernRockhigh'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
	}
	wolflikeme = {
		checksum = wolflikeme
		Name = 'WolfLikeMe'
		title = qs(0x540d7c97)
		artist = qs(0xe7d51709)
		year = 2006
		Duration = 259
		artist_text = $artist_text_by
		original_artist = 1
		venue = 10
		leaderboard = 1
		singer = male
		genre = alternative
		countoff = 'hihat01'
		drum_kit = 'modernrock'
		overall_song_volume = 0.8
		vocals_scroll_speed = 1.15
		album_title = qs(0x92a4b19c)
		double_kick = 0
		guitar_difficulty_rating = 5
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 6
		drums_difficulty_rating = 3
		band_difficulty_rating = 5
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'wolflikeme'
		kick = 'wolflikeme'
		tom1 = 'ModernRocklow'
		tom2 = 'ModernRocklow'
		hihat = 'ModernRock'
		cymbal = 'ModernRock'
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
		vocals_scroll_speed = 1.23
		trivia_no_phrases
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
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'womanfromtokyo'
		kick = 'womanfromtokyo'
		tom1 = 'heavyrockhigh'
		tom2 = 'heavyrockhigh'
		hihat = 'heavyrock'
		cymbal = 'heavyrock'
	}
	youandme = {
		checksum = youandme
		Name = 'YouAndMe'
		title = qs(0x83526370)
		artist = qs(0x424b2e83)
		year = 2008
		Duration = 221
		artist_text = $artist_text_by
		original_artist = 1
		venue = 5
		leaderboard = 1
		singer = male
		genre = `pop	rock`
		countoff = 'sticks_normal'
		drum_kit = 'modernrock'
		overall_song_volume = -1.3
		vocals_scroll_speed = 1.6
		album_title = qs(0x424b2e83)
		double_kick = 0
		guitar_difficulty_rating = 2
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 5
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'youandme'
		kick = 'youandme'
		tom1 = 'StandardRocklow'
		tom2 = 'StandardRockhigh'
		hihat = 'StandardRock'
		cymbal = 'StandardRock'
		thin_fretbar_8note_params_low_bpm = 1
		thin_fretbar_8note_params_high_bpm = 180
		thin_fretbar_16note_params_low_bpm = 1
		thin_fretbar_16note_params_high_bpm = 120
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
		vocals_scroll_speed = 1.4
		guitar_difficulty_rating = 3
		bass_difficulty_rating = 3
		vocals_difficulty_rating = 4
		drums_difficulty_rating = 2
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'yougivelove'
		kick = 'yougivelove'
		tom1 = 'BigRoomRockhigh'
		tom2 = 'BigRoomRockhigh'
		hihat = 'BigRoomRock'
		cymbal = 'BigRoomRock'
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
		vocals_scroll_speed = 1.12
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
}
debug_songlist_props = {
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
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'classicrock'
		kick = 'classicrock'
		tom1 = 'classicrock'
		tom2 = 'classicrock'
		hihat = 'classicrock'
		cymbal = 'classicrock'
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
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'classicrock'
		kick = 'classicrock'
		tom1 = 'classicrock'
		tom2 = 'classicrock'
		hihat = 'classicrock'
		cymbal = 'classicrock'
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
		flags = 0
		snare = 'classicrock'
		kick = 'classicrock'
		tom1 = 'classicrock'
		tom2 = 'classicrock'
		hihat = 'classicrock'
		cymbal = 'classicrock'
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
		disable_for_medley_mode = FALSE
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
		trivia_no_phrases
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 1
		disable_for_medley_mode = FALSE
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
		trivia_no_phrases
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 2
		disable_for_medley_mode = FALSE
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
		trivia_no_phrases
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 3
		disable_for_medley_mode = FALSE
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
		trivia_no_phrases
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 4
		disable_for_medley_mode = FALSE
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
		trivia_no_phrases
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 5
		disable_for_medley_mode = FALSE
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
		trivia_no_phrases
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 6
		disable_for_medley_mode = FALSE
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
		trivia_no_phrases
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 7
		disable_for_medley_mode = FALSE
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
		trivia_no_phrases
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 8
		disable_for_medley_mode = FALSE
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
		trivia_no_phrases
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 9
		disable_for_medley_mode = FALSE
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
		trivia_no_phrases
		allowed_in_quickplay = 0
		album_title = qs(0xbb603bec)
		guitar_difficulty_rating = 10
		bass_difficulty_rating = 10
		vocals_difficulty_rating = 10
		drums_difficulty_rating = 10
		band_difficulty_rating = 9
		disable_for_medley_mode = FALSE
		flags = 0
	}
	synctest = {
		checksum = synctest
		Name = 'synctest'
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
		disable_for_medley_mode = FALSE
		flags = 0
	}
	synctestplaytoaudio = {
		checksum = synctestplaytoaudio
		Name = 'synctestplaytoaudio'
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
		disable_for_medley_mode = FALSE
		flags = 0
	}
	synctestaudioandvisual = {
		checksum = synctestaudioandvisual
		Name = 'synctestaudioandvisual'
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
		disable_for_medley_mode = FALSE
		flags = 0
	}
	synctestmuting = {
		checksum = synctestmuting
		Name = 'synctestmuting'
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
		disable_for_medley_mode = FALSE
		flags = 0
	}
	tenseconddebug = {
		checksum = tenseconddebug
		Name = 'tenseconddebug'
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
		disable_for_medley_mode = FALSE
		flags = 0
	}
	elevenseconddebug = {
		checksum = elevenseconddebug
		Name = 'elevenseconddebug'
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
		disable_for_medley_mode = FALSE
		flags = 0
	}
	twelveseconddebug = {
		checksum = twelveseconddebug
		Name = 'twelveseconddebug'
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
		disable_for_medley_mode = FALSE
		flags = 0
	}
	testtones = {
		checksum = testtones
		Name = 'testtones'
		title = qs(0xc211a931)
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
		disable_for_medley_mode = FALSE
		flags = 0
	}
	drumstreamtest = {
		checksum = drumstreamtest
		Name = 'DrumStreamTest'
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
		flags = 0
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
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
		disable_for_medley_mode = FALSE
		count_in_min_blank_ms = 10000000
		flags = 0
	}
}
song_genre_list = {
	rock = {
		genre_string = qs(0xdbe68323)
	}
	grunge = {
		genre_string = qs(0x5a5893cc)
	}
	`hard	rock` = {
		genre_string = qs(0x8c227232)
	}
	`classic	rock` = {
		genre_string = qs(0x69cd8928)
	}
	`southern	rock` = {
		genre_string = qs(0xa1d57dda)
	}
	`prog	rock` = {
		genre_string = qs(0xdce9948d)
	}
	alternative = {
		genre_string = qs(0x5222d1db)
	}
	`modern	rock` = {
		genre_string = qs(0x57b61b78)
	}
	rockabilly = {
		genre_string = qs(0x7478f2db)
	}
	`new	wave` = {
		genre_string = qs(0xc0dc7896)
	}
	country = {
		genre_string = qs(0x3323be41)
	}
	electronic = {
		genre_string = qs(0x40f5ecbc)
	}
	dance = {
		genre_string = qs(0x94823953)
	}
	pop = {
		genre_string = qs(0x0ec9c808)
	}
	`pop	rock` = {
		genre_string = qs(0x2b786680)
	}
	`indie	rock` = {
		genre_string = qs(0xb2e4f95d)
	}
	`blues	rock` = {
		genre_string = qs(0x04dd7f98)
	}
	reggae = {
		genre_string = qs(0x376babf3)
	}
	`r&b` = {
		genre_string = qs(0xeb6ac738)
	}
	blues = {
		genre_string = qs(0x527b4496)
	}
	jazz = {
		genre_string = qs(0x307af3c8)
	}
	`surf	rock` = {
		genre_string = qs(0x817bb1c2)
	}
	metal = {
		genre_string = qs(0x355b4e5c)
	}
	`glam	rock` = {
		genre_string = qs(0xf46db725)
	}
	`death	metal` = {
		genre_string = qs(0x48e2ccc7)
	}
	`speed	metal` = {
		genre_string = qs(0x26922ad8)
	}
	`black	metal` = {
		genre_string = qs(0xa5109883)
	}
	`nu	metal` = {
		genre_string = qs(0x426b6bfe)
	}
	experimental = {
		genre_string = qs(0xe829168a)
	}
	industrial = {
		genre_string = qs(0x671ee535)
	}
	`big	band` = {
		genre_string = qs(0xf9fea6f1)
	}
	international = {
		genre_string = qs(0x903a98da)
	}
	funk = {
		genre_string = qs(0x733045d2)
	}
	disco = {
		genre_string = qs(0x02c0db29)
	}
	hip_hop = {
		genre_string = qs(0x4911c80a)
	}
	punk = {
		genre_string = qs(0xc9e47d7e)
	}
	hardcore = {
		genre_string = qs(0x31fce503)
	}
	`pop	punk` = {
		genre_string = qs(0x397a98dd)
	}
	`ska	punk` = {
		genre_string = qs(0x9ea302a7)
	}
	other = {
		genre_string = qs(0xae88c5bc)
	}
}
