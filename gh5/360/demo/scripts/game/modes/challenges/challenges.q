multiplier = qs(0xf043be3c)
multiplier_band = qs(0x40137895)
whammy = qs(0xd8609f81)
spower_banked = qs(0x6e8b89eb)
note_streak = qs(0x5f9a13dc)
phrase_streak = qs(0x3a11be89)
score_spower = qs(0xb0cea4fe)
hit_snares = qs(0x782914b9)
hit_kicks = qs(0xd5f515cd)
hit_toms = qs(0xf721be02)
hit_low_combo = qs(0x4ebef825)
hit_open = qs(0x7d8004fc)
hit_chords = qs(0xc3ff7314)
strum_up_down = qs(0xc7cc98c6)
strum_up = qs(0xeb6a2d94)
hit_taps = qs(0xcb61e444)
score_points = qs(0xd20e6390)
hit_hammers = qs(0xc86e8465)
hit_all_reds = qs(0x64d05026)
score_guitar = qs(0xde70a6dc)
score_bass = qs(0x90a16222)
score_drum = qs(0x99a979fe)
score_vocal = qs(0x50eb7012)
sing_fame = qs(0xec56970f)
c_allalongthewatchtower = {
	id = c_allalongthewatchtower
	name = qs(0x4ad06ce1)
	descrip = qs(0x9fc5e3eb)
	venue = load_z_subway
	playlist_type = predefined
	predefined_playlist = [
		allalongthewatchtower
	]
	required_band = [
		drum
	]
	note_color = [
		red
	]
	bonus_text = hit_snares
	gold_descrip = 285
	platinum_descrip = 300
	diamond_descrip = 325
	target_display_type = amount
	target_display_units = qs(0x2d9bb8cc)
}
c_allalongthewatchtower_info = {
	$c_hit_notes_global_ref
	name = 'c_AllAlongTheWatchTower'
}
c_alltheprettyfaces = {
	id = c_alltheprettyfaces
	name = qs(0x44da9b02)
	descrip = qs(0xf2bb9f67)
	venue = load_z_carhenge
	playlist_type = predefined
	predefined_playlist = [
		alltheprettyfaces
	]
	required_band = [
		any
		any
	]
	bonus_text = multiplier_band
	gold_descrip = 60
	platinum_descrip = 120
	diamond_descrip = 240
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_alltheprettyfaces_info = {
	name = 'c_AllThePrettyFaces'
	$c_multiplier_time_global_ref
}
c_americangirl = {
	id = c_americangirl
	name = qs(0x98cdb880)
	descrip = qs(0x9bd97eed)
	venue = load_z_sanfrancisco
	playlist_type = predefined
	predefined_playlist = [
		americangirl
	]
	required_band = [
		lead
	]
	bonus_text = note_streak
	gold_descrip = 200
	platinum_descrip = 400
	diamond_descrip = 650
	target_display_type = amount
	target_display_units = qs(0xc2a7066f)
}
c_americangirl_info = {
	name = 'c_AmericanGirl'
	$c_streak_notes_global_ref
}
c_apunk = {
	id = c_apunk
	name = qs(0xdc5ed7ae)
	descrip = qs(0x37f424f6)
	venue = load_z_vegas
	playlist_type = predefined
	predefined_playlist = [
		apunk
	]
	required_band = [
		bass
	]
	bonus_text = spower_banked
	gold_descrip = 75
	platinum_descrip = 100
	diamond_descrip = 130
	target_display_type = percent
	target_display_units = qs(0x46429946)
}
c_apunk_info = {
	name = 'c_APunk'
	$c_spower_banked_global_ref
}
c_backround = {
	id = c_backround
	name = qs(0xd723e1f5)
	descrip = qs(0x1fd616c9)
	venue = load_z_cairo
	playlist_type = predefined
	predefined_playlist = [
		backround
	]
	required_band = [
		bass
	]
	bonus_text = multiplier
	gold_descrip = 70
	platinum_descrip = 100
	diamond_descrip = 190
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_backround_info = {
	name = 'c_BackRound'
	$c_multiplier_time_global_ref
}
c_bleedamerican = {
	id = c_bleedamerican
	name = qs(0xc5dccf7e)
	descrip = qs(0xb7336c17)
	venue = load_z_dragrace
	playlist_type = predefined
	predefined_playlist = [
		bleedamerican
	]
	required_band = [
		any
		any
	]
	bonus_text = multiplier_band
	gold_descrip = 42
	platinum_descrip = 82
	diamond_descrip = 165
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_bleedamerican_info = {
	$c_multiplier_time_global_ref
	name = 'c_BleedAmerican'
}
c_blueday = {
	id = c_blueday
	name = qs(0xbdbcc97d)
	descrip = qs(0x699e9871)
	venue = load_z_lhc
	playlist_type = predefined
	predefined_playlist = [
		blueday
	]
	required_band = [
		bass
	]
	bonus_text = score_spower
	gold_descrip = 15000
	platinum_descrip = 30000
	diamond_descrip = 60000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_blueday_info = {
	$c_score_spower_global_ref
	name = 'c_BlueDay'
}
c_blueorchid = {
	id = c_blueorchid
	name = qs(0x23d442fb)
	descrip = qs(0xb23438eb)
	venue = load_z_lhc
	playlist_type = predefined
	predefined_playlist = [
		blueorchid
	]
	required_band = [
		drum
	]
	note_color = [
		extra
	]
	bonus_text = hit_kicks
	gold_descrip = 100
	platinum_descrip = 200
	diamond_descrip = 300
	target_display_type = amount
	target_display_units = qs(0x1ced81bc)
}
c_blueorchid_info = {
	$c_hit_notes_global_ref
	name = 'c_BlueOrchid'
}
c_brianstorm = {
	id = c_brianstorm
	name = qs(0x92528e77)
	descrip = qs(0x3cffec94)
	venue = load_z_sanfrancisco
	playlist_type = predefined
	predefined_playlist = [
		brianstorm
	]
	required_band = [
		drum
	]
	note_color = [
		blue
		green
	]
	bonus_text = hit_toms
	gold_descrip = 180
	platinum_descrip = 265
	diamond_descrip = 460
	target_display_type = amount
	target_display_units = qs(0x4fceb357)
}
c_brianstorm_info = {
	$c_hit_notes_global_ref
	name = 'c_Brianstorm'
}
c_bringthenoise = {
	id = c_bringthenoise
	name = qs(0x2bdd4ba9)
	descrip = qs(0x25052da9)
	venue = load_z_vegas
	playlist_type = predefined
	predefined_playlist = [
		bringthenoise
	]
	required_band = [
		vocal
	]
	bonus_text = phrase_streak
	gold_descrip = 40
	platinum_descrip = 60
	diamond_descrip = 75
	target_display_type = amount
	target_display_units = qs(0xabebc18f)
}
c_bringthenoise_info = {
	$c_streak_notes_global_ref
	name = 'c_BringTheNoise'
}
c_bulletsbutterfly = {
	id = c_bulletsbutterfly
	name = qs(0xd46c418c)
	descrip = qs(0x583c9c9e)
	venue = load_z_nashville
	playlist_type = predefined
	predefined_playlist = [
		bulletsbutterfly
	]
	required_band = [
		bass
	]
	bonus_text = multiplier
	gold_descrip = 50
	platinum_descrip = 100
	diamond_descrip = 200
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_bulletsbutterfly_info = {
	name = 'c_BulletsButterfly'
	$c_multiplier_time_global_ref
}
c_cigarettesweddingbands = {
	id = c_cigarettesweddingbands
	name = qs(0x1bc431d3)
	descrip = qs(0x573e00b9)
	venue = load_z_freakshow
	playlist_type = predefined
	predefined_playlist = [
		cigarettesweddingbands
	]
	required_band = [
		bass
	]
	bonus_text = score_spower
	gold_descrip = 40000
	platinum_descrip = 60000
	diamond_descrip = 90000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_cigarettesweddingbands_info = {
	$c_score_spower_global_ref
	name = 'c_CigarettesWeddingBands'
}
c_comedown = {
	id = c_comedown
	name = qs(0x5908d624)
	descrip = qs(0xfca4474f)
	venue = load_z_neworleans
	playlist_type = predefined
	predefined_playlist = [
		comedown
	]
	required_band = [
		vocal
	]
	bonus_text = note_streak
	gold_descrip = 24
	platinum_descrip = 34
	diamond_descrip = 44
	target_display_type = amount
	target_display_units = qs(0xabebc18f)
}
c_comedown_info = {
	$c_streak_notes_global_ref
	name = 'c_Comedown'
}
c_dancingwithmyself = {
	id = c_dancingwithmyself
	name = qs(0x78afb797)
	descrip = qs(0x9d7079ea)
	venue = load_z_neworleans
	playlist_type = predefined
	predefined_playlist = [
		dancingwithmyself
	]
	required_band = [
		lead
	]
	bonus_text = note_streak
	gold_descrip = 130
	platinum_descrip = 200
	diamond_descrip = 400
	target_display_type = amount
	target_display_units = qs(0xc2a7066f)
}
c_dancingwithmyself_info = {
	$c_streak_notes_global_ref
	name = 'c_DancingWithMyself'
}
c_deadbolt = {
	id = c_deadbolt
	name = qs(0x804b37a9)
	descrip = qs(0x520a6968)
	venue = load_z_sanfrancisco
	playlist_type = predefined
	predefined_playlist = [
		deadbolt
	]
	required_band = [
		bass
	]
	note_color = [
		extra
	]
	bonus_text = hit_open
	gold_descrip = 75
	platinum_descrip = 125
	diamond_descrip = 164
	target_display_type = amount
	target_display_units = qs(0xc2a7066f)
}
c_deadbolt_info = {
	$c_hit_notes_global_ref
	name = 'c_Deadbolt'
}
c_demon = {
	id = c_demon
	name = qs(0x652b8871)
	descrip = qs(0xfffe35b2)
	venue = load_z_norway
	playlist_type = predefined
	predefined_playlist = [
		demon
	]
	required_band = [
		bass
	]
	note_color = [
		extra
	]
	bonus_text = hit_open
	gold_descrip = 180
	platinum_descrip = 300
	diamond_descrip = 339
	target_display_type = amount
	target_display_units = qs(0xc2a7066f)
}
c_demon_info = {
	$c_hit_notes_global_ref
	name = 'c_Demon'
}
c_disconnected = {
	id = c_disconnected
	name = qs(0x64d51f3e)
	descrip = qs(0x35b2e14c)
	venue = load_z_nashville
	playlist_type = predefined
	predefined_playlist = [
		disconnected
	]
	required_band = [
		lead
	]
	bonus_text = note_streak
	gold_descrip = 150
	platinum_descrip = 250
	diamond_descrip = 600
	target_display_type = amount
	target_display_units = qs(0xc2a7066f)
}
c_disconnected_info = {
	$c_streak_notes_global_ref
	name = 'c_Disconnected'
}
c_donewitheverything = {
	id = c_donewitheverything
	name = qs(0x4c3180d9)
	descrip = qs(0x67dcd0b9)
	venue = load_z_norway
	playlist_type = predefined
	predefined_playlist = [
		donewitheverything
	]
	required_band = [
		lead
	]
	bonus_text = note_streak
	gold_descrip = 150
	platinum_descrip = 400
	diamond_descrip = 600
	target_display_type = amount
	target_display_units = qs(0xc2a7066f)
}
c_donewitheverything_info = {
	$c_streak_notes_global_ref
	name = 'c_DoneWithEverything'
}
c_doyoufeellikewedo = {
	id = c_doyoufeellikewedo
	name = qs(0x9c4f2232)
	descrip = qs(0x562a3ca4)
	venue = load_z_norway
	playlist_type = predefined
	predefined_playlist = [
		doyoufeellikewedo
	]
	required_band = [
		lead
	]
	special = hopo
	bonus_text = hit_hammers
	gold_descrip = 250
	platinum_descrip = 800
	diamond_descrip = 1160
	target_display_type = amount
	target_display_units = qs(0x2a201fd4)
}
c_doyoufeellikewedo_info = {
	$c_hit_notes_global_ref
	name = 'c_DoYouFeelLikeWeDo'
}
c_duhast = {
	id = c_duhast
	name = qs(0xc7796411)
	descrip = qs(0x34ecc627)
	venue = load_z_vegas
	playlist_type = predefined
	predefined_playlist = [
		duhast
	]
	required_band = [
		lead
	]
	special = tapping
	bonus_text = hit_taps
	gold_descrip = 200
	platinum_descrip = 230
	diamond_descrip = 295
	target_display_type = amount
	target_display_units = qs(0xd7b75d65)
}
c_duhast_info = {
	$c_hit_notes_global_ref
	name = 'c_DuHast'
}
c_exgirlfriend = {
	id = c_exgirlfriend
	name = qs(0xa41b8ab2)
	descrip = qs(0x78a29284)
	venue = load_z_freakshow
	playlist_type = predefined
	predefined_playlist = [
		exgirlfriend
	]
	required_band = [
		lead
	]
	bonus_text = whammy
	gold_descrip = 30
	platinum_descrip = 50
	diamond_descrip = 70
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_exgirlfriend_info = {
	$c_whammy_time_global_ref
	name = 'c_ExGirlfriend'
}
c_fame = {
	id = c_fame
	name = qs(0xf9d431cf)
	descrip = qs(0xe570f6ad)
	venue = load_z_freakshow
	playlist_type = predefined
	predefined_playlist = [
		fame
	]
	required_band = [
		vocal
	]
	song_sections = [
		[
			28
			29
			30
			31
			32
			33
		]
	]
	bonus_text = sing_fame
	gold_descrip = 5
	platinum_descrip = 20
	diamond_descrip = 24
	target_display_type = amount
	target_display_units = qs(0xc2a7066f)
}
c_fame_info = {
	$c_hit_notes_global_ref
	name = 'c_Fame'
}
c_feelgoodinc = {
	id = c_feelgoodinc
	name = qs(0xac08ae39)
	descrip = qs(0xec892e70)
	venue = load_z_subway
	playlist_type = predefined
	predefined_playlist = [
		feelgoodinc
	]
	required_band = [
		vocal
	]
	bonus_text = multiplier
	gold_descrip = 30
	platinum_descrip = 60
	diamond_descrip = 120
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_feelgoodinc_info = {
	name = 'c_FeelGoodInc'
	$c_multiplier_time_global_ref
}
c_gammaray = {
	id = c_gammaray
	name = qs(0xecde6179)
	descrip = qs(0x5a9e44f7)
	venue = load_z_subway
	playlist_type = predefined
	predefined_playlist = [
		gammaray
	]
	required_band = [
		bass
	]
	strum = up_only
	bonus_text = strum_up
	gold_descrip = 340
	platinum_descrip = 540
	diamond_descrip = 695
	target_display_type = amount
	target_display_units = qs(0x37928772)
}
c_gammaray_info = {
	$c_hit_notes_global_ref
	name = 'c_GammaRay'
}
c_gratitude = {
	id = c_gratitude
	name = qs(0x93c77523)
	descrip = qs(0xd7a3bc62)
	venue = load_z_lhc
	playlist_type = predefined
	predefined_playlist = [
		gratitude
	]
	required_band = [
		lead
	]
	special = tapping
	bonus_text = hit_taps
	gold_descrip = 15
	platinum_descrip = 24
	diamond_descrip = 35
	target_display_type = amount
	target_display_units = qs(0xd7b75d65)
}
c_gratitude_info = {
	$c_hit_notes_global_ref
	name = 'c_Gratitude'
}
c_hungrylikethewolf = {
	id = c_hungrylikethewolf
	name = qs(0x6c121030)
	descrip = qs(0x7d200d0b)
	venue = load_z_dragrace
	playlist_type = predefined
	predefined_playlist = [
		hungrylikethewolf
	]
	required_band = [
		vocal
	]
	bonus_text = score_points
	gold_descrip = 50000
	platinum_descrip = 80000
	diamond_descrip = 100000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_hungrylikethewolf_info = {
	$c_score_points_global_ref
	name = 'c_HungryLikeTheWolf'
}
c_hurtssogood = {
	id = c_hurtssogood
	name = qs(0x820c793f)
	descrip = qs(0x2d2bbfc6)
	venue = load_z_lhc
	playlist_type = predefined
	predefined_playlist = [
		hurtssogood
	]
	required_band = [
		lead
	]
	bonus_text = whammy
	gold_descrip = 15
	platinum_descrip = 25
	diamond_descrip = 35
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_hurtssogood_info = {
	name = 'c_HurtsSoGood'
	$c_whammy_time_global_ref
}
c_incinerate = {
	id = c_incinerate
	name = qs(0x2e3d9d1d)
	descrip = qs(0x70c0c0d2)
	venue = load_z_mexicocity
	playlist_type = predefined
	predefined_playlist = [
		incinerate
	]
	required_band = [
		drum
	]
	note_color = [
		extra
	]
	bonus_text = hit_kicks
	gold_descrip = 280
	platinum_descrip = 640
	diamond_descrip = 760
	target_display_type = amount
	target_display_units = qs(0x1ced81bc)
}
c_incinerate_info = {
	name = 'c_Incinerate'
	$c_hit_notes_global_ref
}
c_inmyplace = {
	id = c_inmyplace
	name = qs(0x56b80c72)
	descrip = qs(0x91a37c6b)
	venue = load_z_subway
	playlist_type = predefined
	predefined_playlist = [
		inmyplace
	]
	required_band = [
		lead
	]
	bonus_text = whammy
	gold_descrip = 30
	platinum_descrip = 40
	diamond_descrip = 80
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_inmyplace_info = {
	name = 'c_InMyPlace'
	$c_whammy_time_global_ref
}
c_inthemeantime = {
	id = c_inthemeantime
	name = qs(0x47fa7506)
	descrip = qs(0x4d944543)
	venue = load_z_dublin
	playlist_type = predefined
	predefined_playlist = [
		inthemeantime
	]
	required_band = [
		bass
	]
	special = hopo
	bonus_text = hit_hammers
	gold_descrip = 60
	platinum_descrip = 215
	diamond_descrip = 380
	target_display_type = amount
	target_display_units = qs(0x2a201fd4)
}
c_inthemeantime_info = {
	$c_hit_notes_global_ref
	name = 'c_InTheMeantime'
}
c_jailbreak = {
	id = c_jailbreak
	name = qs(0xbfd29288)
	descrip = qs(0xafcab05d)
	venue = load_z_dragrace
	playlist_type = predefined
	predefined_playlist = [
		jailbreak
	]
	required_band = [
		any
		any
	]
	bonus_text = spower_banked
	gold_descrip = 350
	platinum_descrip = 500
	diamond_descrip = 1000
	target_display_type = percent
	target_display_units = qs(0x46429946)
}
c_jailbreak_info = {
	$c_spower_banked_global_ref
	name = 'c_Jailbreak'
}
c_judith = {
	id = c_judith
	name = qs(0xd57bc058)
	descrip = qs(0x2ec05a25)
	venue = load_z_sanfrancisco
	playlist_type = predefined
	predefined_playlist = [
		judith
	]
	required_band = [
		any
		any
	]
	bonus_text = score_spower
	gold_descrip = 500000
	platinum_descrip = 1000000
	diamond_descrip = 2000000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_judith_info = {
	$c_score_spower_global_ref
	name = 'c_Judith'
}
c_kryptonite = {
	id = c_kryptonite
	name = qs(0x380b172e)
	descrip = qs(0xb6de486f)
	venue = load_z_neworleans
	playlist_type = predefined
	predefined_playlist = [
		kryptonite
	]
	required_band = [
		drum
	]
	bonus_text = note_streak
	gold_descrip = 50
	platinum_descrip = 150
	diamond_descrip = 300
	target_display_type = amount
	target_display_units = qs(0xc2a7066f)
}
c_kryptonite_info = {
	$c_streak_notes_global_ref
	name = 'c_Kryptonite'
}
c_la = {
	id = c_la
	name = qs(0x4b99e556)
	descrip = qs(0x08fd62c9)
	venue = load_z_dublin
	playlist_type = predefined
	predefined_playlist = [
		la
	]
	required_band = [
		bass
	]
	special = hopo
	bonus_text = hit_hammers
	gold_descrip = 4
	platinum_descrip = 50
	diamond_descrip = 95
	target_display_type = amount
	target_display_units = qs(0x2a201fd4)
}
c_la_info = {
	$c_hit_notes_global_ref
	name = 'c_LA'
}
c_lithium = {
	id = c_lithium
	name = qs(0xe95875c8)
	descrip = qs(0x59796695)
	venue = load_z_carhenge
	playlist_type = predefined
	predefined_playlist = [
		lithium
	]
	required_band = [
		vocal
	]
	bonus_text = spower_banked
	gold_descrip = 100
	platinum_descrip = 200
	diamond_descrip = 290
	target_display_type = percent
	target_display_units = qs(0x46429946)
}
c_lithium_info = {
	name = 'c_Lithium'
	$c_spower_banked_global_ref
}
c_lonelyisthenight = {
	id = c_lonelyisthenight
	name = qs(0x08d73283)
	descrip = qs(0xa4defeff)
	venue = load_z_carhenge
	playlist_type = predefined
	predefined_playlist = [
		lonelyisthenight
	]
	required_band = [
		lead
	]
	bonus_text = whammy
	gold_descrip = 25
	platinum_descrip = 45
	diamond_descrip = 65
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_lonelyisthenight_info = {
	name = 'c_LonelyIsTheNight'
	$c_whammy_time_global_ref
}
c_looksthatkill = {
	id = c_looksthatkill
	name = qs(0x601be48b)
	descrip = qs(0x5081b0b2)
	venue = load_z_dragrace
	playlist_type = predefined
	predefined_playlist = [
		looksthatkill
	]
	required_band = [
		lead
	]
	strum = up_and_down
	bonus_text = strum_up_down
	gold_descrip = 500
	platinum_descrip = 600
	diamond_descrip = 800
	target_display_type = amount
	target_display_units = qs(0x37928772)
}
c_looksthatkill_info = {
	$c_hit_notes_global_ref
	name = 'c_LooksThatKill'
}
c_lovetoken = {
	id = c_lovetoken
	name = qs(0x4a932c31)
	descrip = qs(0xa43348f4)
	venue = load_z_neworleans
	playlist_type = predefined
	predefined_playlist = [
		lovetoken
	]
	required_band = [
		vocal
	]
	bonus_text = score_points
	gold_descrip = 20000
	platinum_descrip = 40000
	diamond_descrip = 80000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_lovetoken_info = {
	$c_score_points_global_ref
	name = 'c_LoveToken'
}
c_lustforlife = {
	id = c_lustforlife
	name = qs(0x83e0dfb6)
	descrip = qs(0x3ae462e4)
	venue = load_z_norway
	playlist_type = predefined
	predefined_playlist = [
		lustforlife
	]
	required_band = [
		lead
	]
	bonus_text = note_streak
	gold_descrip = 100
	platinum_descrip = 375
	diamond_descrip = 600
	target_display_type = amount
	target_display_units = qs(0xc2a7066f)
}
c_lustforlife_info = {
	$c_streak_notes_global_ref
	name = 'c_LustForLife'
}
c_maidenmothercrone = {
	id = c_maidenmothercrone
	name = qs(0x57a6bf37)
	descrip = qs(0xe72262b3)
	venue = load_z_mexicocity
	playlist_type = predefined
	predefined_playlist = [
		maidenmothercrone
	]
	required_band = [
		bass
	]
	bonus_text = multiplier
	gold_descrip = 70
	platinum_descrip = 100
	diamond_descrip = 200
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_maidenmothercrone_info = {
	name = 'c_MaidenMotherCrone'
	$c_multiplier_time_global_ref
}
c_makeitwitchu = {
	id = c_makeitwitchu
	name = qs(0xb7976a38)
	descrip = qs(0x3e396344)
	venue = load_z_dublin
	playlist_type = predefined
	predefined_playlist = [
		makeitwitchu
	]
	required_band = [
		drum
	]
	bonus_text = score_points
	gold_descrip = 150000
	platinum_descrip = 250000
	diamond_descrip = 315000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_makeitwitchu_info = {
	$c_score_points_global_ref
	name = 'c_MakeItWitChu'
}
c_medicate = {
	id = c_medicate
	name = qs(0x203d2e8d)
	descrip = qs(0x45cd8e4a)
	venue = load_z_cairo
	playlist_type = predefined
	predefined_playlist = [
		medicate
	]
	required_band = [
		vocal
	]
	bonus_text = score_spower
	gold_descrip = 20000
	platinum_descrip = 35000
	diamond_descrip = 50000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_medicate_info = {
	$c_score_spower_global_ref
	name = 'c_Medicate'
}
c_mirrorpeople = {
	id = c_mirrorpeople
	name = qs(0xcc7b7c62)
	descrip = qs(0xa2f39fec)
	venue = load_z_neworleans
	playlist_type = predefined
	predefined_playlist = [
		mirrorpeople
	]
	required_band = [
		drum
	]
	chord_color_drum = gr
	bonus_text = hit_low_combo
	gold_descrip = 200
	platinum_descrip = 275
	diamond_descrip = 315
	target_display_type = amount
	target_display_units = qs(0x3d6575ed)
}
c_mirrorpeople_info = {
	$c_hit_notes_global_ref
	name = 'c_MirrorPeople'
}
c_nearlylostyou = {
	id = c_nearlylostyou
	name = qs(0xcf697440)
	descrip = qs(0x8728c0fa)
	venue = load_z_carhenge
	playlist_type = predefined
	predefined_playlist = [
		nearlylostyou
	]
	required_band = [
		drum
	]
	bonus_text = score_spower
	gold_descrip = 20000
	platinum_descrip = 40000
	diamond_descrip = 60000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_nearlylostyou_info = {
	$c_score_spower_global_ref
	name = 'c_NearlyLostYou'
}
c_nevermissabeat = {
	id = c_nevermissabeat
	name = qs(0x50f2eff7)
	descrip = qs(0x1f5c3877)
	venue = load_z_neworleans
	playlist_type = predefined
	predefined_playlist = [
		nevermissabeat
	]
	required_band = [
		lead
	]
	bonus_text = note_streak
	gold_descrip = 125
	platinum_descrip = 200
	diamond_descrip = 400
	target_display_type = amount
	target_display_units = qs(0xc2a7066f)
}
c_nevermissabeat_info = {
	$c_streak_notes_global_ref
	name = 'c_NeverMissABeat'
}
c_noonetodependon = {
	id = c_noonetodependon
	name = qs(0x3682a2c8)
	descrip = qs(0x20598129)
	venue = load_z_mexicocity
	playlist_type = predefined
	predefined_playlist = [
		noonetodependon
	]
	required_band = [
		lead
	]
	bonus_text = multiplier
	gold_descrip = 35
	platinum_descrip = 75
	diamond_descrip = 160
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_noonetodependon_info = {
	name = 'c_NoOneToDependOn'
	$c_multiplier_time_global_ref
}
c_onebigholiday = {
	id = c_onebigholiday
	name = qs(0xa359fd71)
	descrip = qs(0x142bdc35)
	venue = load_z_nashville
	playlist_type = predefined
	predefined_playlist = [
		onebigholiday
	]
	required_band = [
		lead
	]
	special = hopo
	bonus_text = hit_hammers
	gold_descrip = 200
	platinum_descrip = 350
	diamond_descrip = 480
	target_display_type = amount
	target_display_units = qs(0x2a201fd4)
}
c_onebigholiday_info = {
	$c_hit_notes_global_ref
	name = 'c_OneBigHoliday'
}
c_onlyhappywhenitrains = {
	id = c_onlyhappywhenitrains
	name = qs(0xe320189a)
	descrip = qs(0xd5bacaaf)
	venue = load_z_lhc
	playlist_type = predefined
	predefined_playlist = [
		onlyhappywhenitrains
	]
	required_band = [
		vocal
	]
	bonus_text = spower_banked
	gold_descrip = 75
	platinum_descrip = 100
	diamond_descrip = 135
	target_display_type = percent
	target_display_units = qs(0x46429946)
}
c_onlyhappywhenitrains_info = {
	name = 'c_OnlyHappyWhenItRains'
	$c_spower_banked_global_ref
}
c_playthatfunkymusic = {
	id = c_playthatfunkymusic
	name = qs(0xbea0bbf4)
	descrip = qs(0x309a3c8f)
	venue = load_z_freakshow
	playlist_type = predefined
	predefined_playlist = [
		playthatfunkymusic
	]
	required_band = [
		lead
	]
	bonus_text = multiplier
	gold_descrip = 50
	platinum_descrip = 100
	diamond_descrip = 200
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_playthatfunkymusic_info = {
	name = 'c_PlayThatFunkyMusic'
	$c_multiplier_time_global_ref
}
c_pluginbaby = {
	id = c_pluginbaby
	name = qs(0x6247605b)
	descrip = qs(0x79a1a431)
	venue = load_z_dublin
	playlist_type = predefined
	predefined_playlist = [
		pluginbaby
	]
	required_band = [
		any
		any
	]
	bonus_text = spower_banked
	gold_descrip = 200
	platinum_descrip = 400
	diamond_descrip = 700
	target_display_type = percent
	target_display_units = qs(0x46429946)
}
c_pluginbaby_info = {
	name = 'c_PlugInBaby'
	$c_spower_banked_global_ref
}
c_ringoffire = {
	id = c_ringoffire
	name = qs(0x02024c91)
	descrip = qs(0x8b3d2752)
	venue = load_z_nashville
	playlist_type = predefined
	predefined_playlist = [
		ringoffire
	]
	required_band = [
		vocal
	]
	bonus_text = score_spower
	gold_descrip = 10000
	platinum_descrip = 25000
	diamond_descrip = 40000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_ringoffire_info = {
	$c_score_spower_global_ref
	name = 'c_RingOfFire'
}
c_rockshow = {
	id = c_rockshow
	name = qs(0x700c6467)
	descrip = qs(0x17e1d37c)
	venue = load_z_dragrace
	playlist_type = predefined
	predefined_playlist = [
		rockshow
	]
	required_band = [
		drum
	]
	bonus_text = note_streak
	gold_descrip = 50
	platinum_descrip = 75
	diamond_descrip = 150
	target_display_type = amount
	target_display_units = qs(0xc2a7066f)
}
c_rockshow_info = {
	$c_streak_notes_global_ref
	name = 'c_RockShow'
}
c_runnindownadream = {
	id = c_runnindownadream
	name = qs(0xd715c0dd)
	descrip = qs(0x99867436)
	venue = load_z_mexicocity
	playlist_type = predefined
	predefined_playlist = [
		runnindownadream
	]
	required_band = [
		lead
	]
	bonus_text = whammy
	gold_descrip = 30
	platinum_descrip = 60
	diamond_descrip = 80
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_runnindownadream_info = {
	name = 'c_RunninDownADream'
	$c_whammy_time_global_ref
}
c_saturdaynightsalright = {
	id = c_saturdaynightsalright
	name = qs(0x7657fcc2)
	descrip = qs(0xa1c154ec)
	venue = load_z_cairo
	playlist_type = predefined
	predefined_playlist = [
		saturdaynightsalright
	]
	required_band = [
		any
		any
	]
	bonus_text = score_points
	gold_descrip = 1500000
	platinum_descrip = 3000000
	diamond_descrip = 6000000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_saturdaynightsalright_info = {
	name = 'c_SaturdayNightsAlright'
	$c_score_points_global_ref
}
c_scatterbrain = {
	id = c_scatterbrain
	name = qs(0x1356d0d4)
	descrip = qs(0x9bb0a21e)
	venue = load_z_norway
	playlist_type = predefined
	predefined_playlist = [
		scatterbrain
	]
	required_band = [
		lead
	]
	bonus_text = multiplier
	gold_descrip = 40
	platinum_descrip = 90
	diamond_descrip = 190
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_scatterbrain_info = {
	name = 'c_ScatterBrain'
	$c_multiplier_time_global_ref
}
c_seven = {
	id = c_seven
	name = qs(0x7ed7e189)
	descrip = qs(0x7d6ecba3)
	venue = load_z_vegas
	playlist_type = predefined
	predefined_playlist = [
		seven
	]
	required_band = [
		drum
	]
	bonus_text = note_streak
	gold_descrip = 75
	platinum_descrip = 175
	diamond_descrip = 350
	target_display_type = amount
	target_display_units = qs(0xc2a7066f)
}
c_seven_info = {
	$c_streak_notes_global_ref
	name = 'c_Seven'
}
c_sexonfire = {
	id = c_sexonfire
	name = qs(0x380240d9)
	descrip = qs(0xe597d502)
	venue = load_z_freakshow
	playlist_type = predefined
	predefined_playlist = [
		sexonfire
	]
	required_band = [
		any
		any
	]
	note_color = [
		red
	]
	bonus_text = spower_banked
	gold_descrip = 300
	platinum_descrip = 450
	diamond_descrip = 800
	target_display_type = percent
	target_display_units = qs(0x46429946)
}
c_sexonfire_info = {
	$c_spower_banked_global_ref
	name = 'c_SexOnFire'
}
c_shoutitoutloud = {
	id = c_shoutitoutloud
	name = qs(0xa28e9d04)
	descrip = qs(0xbbcdfcc3)
	venue = load_z_neworleans
	playlist_type = predefined
	predefined_playlist = [
		shoutitoutloud
	]
	required_band = [
		any
		any
	]
	bonus_text = multiplier_band
	gold_descrip = 45
	platinum_descrip = 75
	diamond_descrip = 150
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_shoutitoutloud_info = {
	name = 'c_ShoutItOutLoud'
	$c_multiplier_time_global_ref
}
c_sixdaysaweek = {
	id = c_sixdaysaweek
	name = qs(0x29d33bbc)
	descrip = qs(0x521b339a)
	venue = load_z_sanfrancisco
	playlist_type = predefined
	predefined_playlist = [
		sixdaysaweek
	]
	required_band = [
		bass
	]
	strum = up_only
	bonus_text = strum_up
	gold_descrip = 600
	platinum_descrip = 730
	diamond_descrip = 850
	target_display_type = amount
	target_display_units = qs(0x5e402c5a)
}
c_sixdaysaweek_info = {
	$c_hit_notes_global_ref
	name = 'c_SixDaysAWeek'
}
c_smellsliketeenspirit = {
	id = c_smellsliketeenspirit
	name = qs(0x35f96061)
	descrip = qs(0x50bfdbc4)
	venue = load_z_carhenge
	playlist_type = predefined
	predefined_playlist = [
		smellsliketeenspirit
	]
	required_band = [
		lead
	]
	bonus_text = spower_banked
	gold_descrip = 225
	platinum_descrip = 300
	diamond_descrip = 350
	target_display_type = percent
	target_display_units = qs(0x46429946)
}
c_smellsliketeenspirit_info = {
	name = 'c_SmellsLikeTeenSpirit'
	$c_spower_banked_global_ref
}
c_sneakout = {
	id = c_sneakout
	name = qs(0x8fb9f0c8)
	descrip = qs(0x59a60e54)
	venue = load_z_cairo
	playlist_type = predefined
	predefined_playlist = [
		sneakout
	]
	required_band = [
		drum
	]
	bonus_text = score_spower
	gold_descrip = 10000
	platinum_descrip = 25000
	diamond_descrip = 42500
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_sneakout_info = {
	$c_score_spower_global_ref
	name = 'c_SneakOut'
}
c_solonely = {
	id = c_solonely
	name = qs(0x98c0fe74)
	descrip = qs(0x0f38fbc4)
	venue = load_z_mexicocity
	playlist_type = predefined
	predefined_playlist = [
		solonely
	]
	required_band = [
		vocal
	]
	bonus_text = score_points
	gold_descrip = 60000
	platinum_descrip = 80000
	diamond_descrip = 120000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_solonely_info = {
	$c_score_points_global_ref
	name = 'c_SoLonely'
}
c_song2 = {
	id = c_song2
	name = qs(0x2977dfef)
	descrip = qs(0xe875b3fa)
	venue = load_z_subway
	playlist_type = predefined
	predefined_playlist = [
		song2
	]
	required_band = [
		any
		any
	]
	bonus_text = score_points
	gold_descrip = 500000
	platinum_descrip = 1000000
	diamond_descrip = 2000000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_song2_info = {
	name = 'c_Song2'
	$c_score_points_global_ref
}
c_sowingseason = {
	id = c_sowingseason
	name = qs(0x338a4d41)
	descrip = qs(0x5ff4b473)
	venue = load_z_lhc
	playlist_type = predefined
	predefined_playlist = [
		sowingseason
	]
	required_band = [
		bass
	]
	strum = up_only
	bonus_text = strum_up
	gold_descrip = 300
	platinum_descrip = 400
	diamond_descrip = 475
	target_display_type = amount
	target_display_units = qs(0x01f47385)
}
c_sowingseason_info = {
	$c_hit_notes_global_ref
	name = 'c_SowingSeason'
}
c_spiritofradio = {
	id = c_spiritofradio
	name = qs(0xdc3ce9d0)
	descrip = qs(0xc2cb8b05)
	venue = load_z_norway
	playlist_type = predefined
	predefined_playlist = [
		spiritofradio
	]
	required_band = [
		any
		any
	]
	bonus_text = score_spower
	gold_descrip = 437500
	platinum_descrip = 875000
	diamond_descrip = 1750000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_spiritofradio_info = {
	$c_score_spower_global_ref
	name = 'c_SpiritOfRadio'
}
c_steadyasshegoes = {
	id = c_steadyasshegoes
	name = qs(0x92239941)
	descrip = qs(0xcee8d38b)
	venue = load_z_lhc
	playlist_type = predefined
	predefined_playlist = [
		steadyasshegoes
	]
	required_band = [
		drum
	]
	note_color = [
		extra
	]
	bonus_text = hit_kicks
	gold_descrip = 100
	platinum_descrip = 220
	diamond_descrip = 390
	target_display_type = amount
	target_display_units = qs(0x1ced81bc)
}
c_steadyasshegoes_info = {
	$c_hit_notes_global_ref
	name = 'c_SteadyAsSheGoes'
}
c_streamlinewoman = {
	id = c_streamlinewoman
	name = qs(0x0102d219)
	descrip = qs(0x338cc2e9)
	venue = load_z_cairo
	playlist_type = predefined
	predefined_playlist = [
		streamlinewoman
	]
	required_band = [
		lead
	]
	bonus_text = multiplier
	gold_descrip = 40
	platinum_descrip = 90
	diamond_descrip = 160
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_streamlinewoman_info = {
	name = 'c_StreamlineWoman'
	$c_multiplier_time_global_ref
}
c_sultansofswing = {
	id = c_sultansofswing
	name = qs(0xf3b43443)
	descrip = qs(0xe4199255)
	venue = load_z_dublin
	playlist_type = predefined
	predefined_playlist = [
		sultansofswing
	]
	required_band = [
		lead
	]
	chord_color = all
	bonus_text = hit_chords
	gold_descrip = 340
	platinum_descrip = 550
	diamond_descrip = 610
	target_display_type = amount
	target_display_units = qs(0x81ab5020)
}
c_sultansofswing_info = {
	$c_hit_notes_global_ref
	name = 'c_SultansOfSwing'
}
c_superstition = {
	id = c_superstition
	name = qs(0x77526cdb)
	descrip = qs(0xdde74ba0)
	venue = load_z_dublin
	playlist_type = predefined
	predefined_playlist = [
		superstition
	]
	required_band = [
		lead
	]
	special = tapping
	bonus_text = hit_taps
	gold_descrip = 300
	platinum_descrip = 415
	diamond_descrip = 580
	target_display_type = amount
	target_display_units = qs(0xd7b75d65)
}
c_superstition_info = {
	$c_hit_notes_global_ref
	name = 'c_Superstition'
}
c_sweatingbullets = {
	id = c_sweatingbullets
	name = qs(0xb526bcb6)
	descrip = qs(0x2e774b4c)
	venue = load_z_norway
	playlist_type = predefined
	predefined_playlist = [
		sweatingbullets
	]
	required_band = [
		any
		any
	]
	bonus_text = multiplier_band
	gold_descrip = 50
	platinum_descrip = 90
	diamond_descrip = 110
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_sweatingbullets_info = {
	name = 'c_SweatingBullets'
	$c_multiplier_time_global_ref
}
c_sympathyforthedevil = {
	id = c_sympathyforthedevil
	name = qs(0xfc3acad4)
	descrip = qs(0x646fbade)
	venue = load_z_subway
	playlist_type = predefined
	predefined_playlist = [
		sympathyforthedevil
	]
	required_band = [
		any
		any
	]
	bonus_text = multiplier_band
	gold_descrip = 86
	platinum_descrip = 172
	diamond_descrip = 345
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_sympathyforthedevil_info = {
	name = 'c_SympathyForTheDevil'
	$c_multiplier_time_global_ref
}
c_theysay = {
	id = c_theysay
	name = qs(0x9571b707)
	descrip = qs(0x3cbafe39)
	venue = load_z_subway
	playlist_type = predefined
	predefined_playlist = [
		theysay
	]
	required_band = [
		drum
	]
	note_color = [
		red
	]
	bonus_text = hit_snares
	gold_descrip = 200
	platinum_descrip = 235
	diamond_descrip = 245
	target_display_type = amount
	target_display_units = qs(0x2d9bb8cc)
}
c_theysay_info = {
	$c_hit_notes_global_ref
	name = 'c_TheySay'
}
c_twentiethcenturyboy = {
	id = c_twentiethcenturyboy
	name = qs(0x5492a9fa)
	descrip = qs(0x2222b343)
	venue = load_z_vegas
	playlist_type = predefined
	predefined_playlist = [
		twentiethcenturyboy
	]
	required_band = [
		lead
	]
	bonus_text = multiplier
	gold_descrip = 35
	platinum_descrip = 70
	diamond_descrip = 135
	target_display_type = amount
	target_display_units = qs(0x93376b7e)
}
c_twentiethcenturyboy_info = {
	name = 'c_TwentiethCenturyBoy'
	$c_multiplier_time_global_ref
}
c_twentyfirstcentury = {
	id = c_twentyfirstcentury
	name = qs(0xbaf15824)
	descrip = qs(0xb64a70b9)
	venue = load_z_cube
	playlist_type = predefined
	predefined_playlist = [
		twentyfirstcentury
	]
	required_band = [
		lead
	]
	special = tapping
	bonus_text = hit_taps
	gold_descrip = 100
	platinum_descrip = 150
	diamond_descrip = 290
	target_display_type = amount
	target_display_units = qs(0xd7b75d65)
}
c_twentyfirstcentury_info = {
	name = 'c_TwentyFirstCentury'
	$c_hit_notes_global_ref
}
c_twominutestomidnight = {
	id = c_twominutestomidnight
	name = qs(0x87a2c271)
	descrip = qs(0x1a16ad1f)
	venue = load_z_sanfrancisco
	playlist_type = predefined
	predefined_playlist = [
		twominutestomidnight
	]
	required_band = [
		vocal
	]
	bonus_text = phrase_streak
	gold_descrip = 20
	platinum_descrip = 40
	diamond_descrip = 58
	target_display_type = amount
	target_display_units = qs(0xabebc18f)
}
c_twominutestomidnight_info = {
	name = 'c_TwoMinutesToMidnight'
	$c_streak_notes_global_ref
}
c_underpressure = {
	id = c_underpressure
	name = qs(0xf0f4ea7c)
	descrip = qs(0xb1913998)
	venue = load_z_freakshow
	playlist_type = predefined
	predefined_playlist = [
		underpressure
	]
	required_band = [
		vocal
	]
	bonus_text = score_points
	gold_descrip = 50000
	platinum_descrip = 85000
	diamond_descrip = 115000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_underpressure_info = {
	name = 'c_UnderPressure'
	$c_score_points_global_ref
}
c_wannabeinla = {
	id = c_wannabeinla
	name = qs(0x1abdd7b1)
	descrip = qs(0xcb51951b)
	venue = load_z_carhenge
	playlist_type = predefined
	predefined_playlist = [
		wannabeinla
	]
	required_band = [
		bass
	]
	bonus_text = spower_banked
	gold_descrip = 75
	platinum_descrip = 101
	diamond_descrip = 126
	target_display_type = percent
	target_display_units = qs(0x46429946)
}
c_wannabeinla_info = {
	name = 'c_WannaBeInLA'
	$c_spower_banked_global_ref
}
c_wereanamericanband = {
	id = c_wereanamericanband
	name = qs(0x5a11fa0c)
	descrip = qs(0x09f0a6f4)
	venue = load_z_nashville
	playlist_type = predefined
	predefined_playlist = [
		wereanamericanband
	]
	required_band = [
		drum
	]
	bonus_text = spower_banked
	gold_descrip = 175
	platinum_descrip = 225
	diamond_descrip = 250
	target_display_type = percent
	target_display_units = qs(0x46429946)
}
c_wereanamericanband_info = {
	name = 'c_WereAnAmericanBand'
	$c_spower_banked_global_ref
}
c_whatigot = {
	id = c_whatigot
	name = qs(0x0a9ee2ac)
	descrip = qs(0x5bd354cf)
	venue = load_z_vegas
	playlist_type = predefined
	predefined_playlist = [
		whatigot
	]
	required_band = [
		vocal
	]
	bonus_text = phrase_streak
	gold_descrip = 15
	platinum_descrip = 30
	diamond_descrip = 45
	target_display_type = amount
	target_display_units = qs(0xabebc18f)
}
c_whatigot_info = {
	$c_streak_notes_global_ref
	name = 'c_WhatIGot'
}
c_whybother = {
	id = c_whybother
	name = qs(0xacb06ca2)
	descrip = qs(0xe70e3d4d)
	venue = load_z_dragrace
	playlist_type = predefined
	predefined_playlist = [
		whybother
	]
	required_band = [
		lead
	]
	strum = up_and_down
	bonus_text = strum_up_down
	gold_descrip = 225
	platinum_descrip = 275
	diamond_descrip = 345
	target_display_type = amount
	target_display_units = qs(0x37928772)
}
c_whybother_info = {
	$c_hit_notes_global_ref
	name = 'c_WhyBother'
}
c_wolflikeme = {
	id = c_wolflikeme
	name = qs(0x7a8760a4)
	descrip = qs(0x749e12e3)
	venue = load_z_mexicocity
	playlist_type = predefined
	predefined_playlist = [
		wolflikeme
	]
	required_band = [
		lead
	]
	strum = up_and_down
	bonus_text = strum_up_down
	gold_descrip = 900
	platinum_descrip = 1300
	diamond_descrip = 1600
	target_display_type = amount
	target_display_units = qs(0x37928772)
}
c_wolflikeme_info = {
	$c_hit_notes_global_ref
	name = 'c_WolfLikeMe'
}
c_womanfromtokyo = {
	id = c_womanfromtokyo
	name = qs(0xb8079221)
	descrip = qs(0x03b83ff5)
	venue = load_z_freakshow
	playlist_type = predefined
	predefined_playlist = [
		womanfromtokyo
	]
	required_band = [
		any
		any
	]
	bonus_text = score_spower
	gold_descrip = 312500
	platinum_descrip = 625000
	diamond_descrip = 1250000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_womanfromtokyo_info = {
	name = 'c_WomanFromTokyo'
	$c_score_spower_global_ref
}
c_youandme = {
	id = c_youandme
	name = qs(0x46aa890d)
	descrip = qs(0x7adc24cb)
	venue = load_z_dublin
	playlist_type = predefined
	predefined_playlist = [
		youandme
	]
	required_band = [
		drum
	]
	bonus_text = score_spower
	gold_descrip = 20000
	platinum_descrip = 40000
	diamond_descrip = 60000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_youandme_info = {
	name = 'c_YouAndMe'
	$c_score_spower_global_ref
}
c_yougivelove = {
	id = c_yougivelove
	name = qs(0x87f72b16)
	descrip = qs(0xec1af17e)
	venue = load_z_dublin
	playlist_type = predefined
	predefined_playlist = [
		yougivelove
	]
	required_band = [
		any
		any
	]
	bonus_text = score_points
	gold_descrip = 875000
	platinum_descrip = 1750000
	diamond_descrip = 3500000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_yougivelove_info = {
	$c_score_points_global_ref
	name = 'c_YouGiveLove'
}
c_younkfunk = {
	id = c_younkfunk
	name = qs(0x74ba19cd)
	descrip = qs(0x381553d7)
	venue = load_z_cairo
	playlist_type = predefined
	predefined_playlist = [
		younkfunk
	]
	required_band = [
		lead
	]
	bonus_text = score_points
	gold_descrip = 100000
	platinum_descrip = 175000
	diamond_descrip = 225000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_younkfunk_info = {
	name = 'c_YounkFunk'
	$c_score_points_global_ref
}
c_sponsor_ahead = {
	id = c_sponsor_ahead
	name = qs(0x15e55867)
	descrip = qs(0xdcd56767)
	venue = load_z_cairo
	name_1 = qs(0x15e55867)
	name_2 = qs(0xc6297828)
	required_band = [
		drum
	]
	playlist_type = filtered
	num_songs = 1
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				2
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				3
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				4
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				5
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				6
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				7
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				8
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				9
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				10
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				11
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	bonus_text = spower_banked
	gold_descrip = 175
	platinum_descrip = 225
	diamond_descrip = 275
	target_display_type = percent
	target_display_units = qs(0x46429946)
}
c_sponsor_ahead_info = {
	name = 'c_Sponsor_Ahead'
	$c_spower_banked_global_ref
}
c_sponsor_audiotechnica = {
	id = c_sponsor_audiotechnica
	name = qs(0x652ff88f)
	descrip = qs(0xc8b088ae)
	venue = load_z_lhc
	name_1 = qs(0x652ff88f)
	name_2 = qs(0xe5143d12)
	required_band = [
		vocal
	]
	playlist_type = filtered
	num_songs = 1
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				2
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	bonus_text = multiplier
	gold_descrip = 75
	platinum_descrip = 100
	diamond_descrip = 150
	target_display_type = amount
	target_display_units = qs(0xb9082291)
}
c_sponsor_audiotechnica_info = {
	name = 'c_Sponsor_AudioTechnica'
	$c_multiplier_time_global_ref
}
c_sponsor_bcrich = {
	id = c_sponsor_bcrich
	name = qs(0xdd4d352a)
	descrip = qs(0x5f6f3e7c)
	name_1 = qs(0xdd4d352a)
	name_2 = qs(0xade0a1e6)
	venue = load_z_lhc
	num_songs = 1
	playlist_type = filtered
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				2
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	num_songs = 1
	required_band = [
		lead
	]
	bonus_text = score_guitar
	gold_descrip = 50000
	platinum_descrip = 125000
	diamond_descrip = 175000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_sponsor_bcrich_info = {
	name = 'c_Sponsor_BCRich'
	$c_score_points_global_ref
}
c_sponsor_daisyrock = {
	id = c_sponsor_daisyrock
	name = qs(0xc4d8beb7)
	descrip = qs(0x80ce60d4)
	name_1 = qs(0xc4d8beb7)
	name_2 = qs(0xf0ecb6d9)
	venue = load_z_dragrace
	num_songs = 1
	playlist_type = filtered
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				2
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				3
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				4
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				5
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				6
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				7
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	num_songs = 1
	required_band = [
		bass
	]
	bonus_text = score_spower
	gold_descrip = 30000
	platinum_descrip = 50000
	diamond_descrip = 80000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_sponsor_daisyrock_info = {
	name = 'c_Sponsor_DaisyRock'
	$c_score_spower_global_ref
}
c_sponsor_emg = {
	id = c_sponsor_emg
	name = qs(0xa8166d22)
	descrip = qs(0xe5d7ed88)
	name_1 = qs(0xa8166d22)
	name_2 = qs(0xae25a627)
	venue = load_z_freakshow
	required_band = [
		lead
	]
	playlist_type = filtered
	num_songs = 1
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				2
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				3
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	bonus_text = score_guitar
	gold_descrip = 80000
	platinum_descrip = 110000
	diamond_descrip = 150000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_sponsor_emg_info = {
	name = 'c_Sponsor_EMG'
	$c_score_points_global_ref
}
c_sponsor_ernieball = {
	id = c_sponsor_ernieball
	name = qs(0xab95db14)
	descrip = qs(0x674c2176)
	name_1 = qs(0xab95db14)
	name_2 = qs(0x04c208b7)
	venue = load_z_mexicocity
	required_band = [
		bass
	]
	playlist_type = filtered
	num_songs = 1
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				2
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				3
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				4
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				5
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				6
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				7
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				8
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				9
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				10
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	bonus_text = score_bass
	gold_descrip = 100000
	platinum_descrip = 150000
	diamond_descrip = 250000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_sponsor_ernieball_info = {
	name = 'c_Sponsor_ErnieBall'
	$c_score_points_global_ref
}
c_sponsor_esp = {
	id = c_sponsor_esp
	name = qs(0x289ee76c)
	descrip = qs(0xbb8d9739)
	venue = load_z_subway
	name_1 = qs(0x289ee76c)
	name_2 = qs(0xe11318df)
	required_band = [
		lead
	]
	chord_color = all
	playlist_type = filtered
	num_songs = 1
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	bonus_text = hit_chords
	gold_descrip = 100
	platinum_descrip = 250
	diamond_descrip = 400
	target_display_type = amount
	target_display_units = qs(0x81ab5020)
}
c_sponsor_esp_info = {
	name = 'c_Sponsor_ESP'
	$c_hit_notes_global_ref
}
c_sponsor_ibanez = {
	id = c_sponsor_ibanez
	name = qs(0x103a05b5)
	descrip = qs(0x35c43a24)
	name_1 = qs(0x103a05b5)
	name_2 = qs(0x1cad5752)
	venue = load_z_vegas
	required_band = [
		lead
	]
	playlist_type = filtered
	num_songs = 1
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				2
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				3
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				4
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				5
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				6
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				7
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				8
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	bonus_text = note_streak
	gold_descrip = 200
	platinum_descrip = 300
	diamond_descrip = 500
	target_display_type = amount
	target_display_units = qs(0xc2a7066f)
}
c_sponsor_ibanez_info = {
	name = 'c_Sponsor_Ibanez'
	$c_streak_notes_global_ref
}
c_sponsor_mcswain = {
	id = c_sponsor_mcswain
	name = qs(0x56af18b6)
	descrip = qs(0x430addb0)
	name_1 = qs(0x56af18b6)
	name_2 = qs(0xfbfbd3fb)
	venue = load_z_sanfrancisco
	playlist_type = filtered
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				2
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				3
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				4
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				5
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				6
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				7
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				8
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				9
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				10
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				11
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				12
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	num_songs = 1
	required_band = [
		lead
	]
	bonus_text = score_guitar
	gold_descrip = 100000
	platinum_descrip = 175000
	diamond_descrip = 250000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_sponsor_mcswain_info = {
	name = 'c_Sponsor_McSwain'
	$c_score_points_global_ref
}
c_sponsor_porkpie = {
	id = c_sponsor_porkpie
	name = qs(0x8d51d67e)
	descrip = qs(0xf6ea1f4c)
	name_1 = qs(0x8d51d67e)
	name_2 = qs(0x597b8abb)
	venue = load_z_dragrace
	playlist_type = filtered
	num_songs = 1
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				2
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				3
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				4
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				5
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	required_band = [
		drum
	]
	bonus_text = score_drum
	gold_descrip = 125000
	platinum_descrip = 200000
	diamond_descrip = 350000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_sponsor_porkpie_info = {
	name = 'c_Sponsor_PorkPie'
	$c_score_points_global_ref
}
c_sponsor_prs = {
	id = c_sponsor_prs
	name = qs(0x5b25cd90)
	descrip = qs(0xc1d839e8)
	name_1 = qs(0x5b25cd90)
	name_2 = qs(0x33942afa)
	venue = load_z_dublin
	required_band = [
		bass
	]
	playlist_type = filtered
	num_songs = 1
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				2
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				3
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				4
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				5
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	bonus_text = note_streak
	gold_descrip = 100
	platinum_descrip = 200
	diamond_descrip = 300
	target_display_type = amount
	target_display_units = qs(0xc2a7066f)
}
c_sponsor_prs_info = {
	name = 'c_Sponsor_PRS'
	$c_streak_notes_global_ref
}
c_sponsor_regaltip = {
	id = c_sponsor_regaltip
	name = qs(0x8207c0e3)
	descrip = qs(0x21cceb76)
	name_1 = qs(0x8207c0e3)
	name_2 = qs(0x693ca2ef)
	venue = load_z_vegas
	playlist_type = filtered
	num_songs = 1
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				2
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				3
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				4
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				5
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				6
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				7
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				8
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	required_band = [
		drum
	]
	bonus_text = score_drum
	gold_descrip = 130000
	platinum_descrip = 250000
	diamond_descrip = 400000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_sponsor_regaltip_info = {
	name = 'c_Sponsor_RegalTip'
	$c_score_points_global_ref
}
c_sponsor_schecter = {
	id = c_sponsor_schecter
	name = qs(0x1a7f7bb2)
	descrip = qs(0x77662f1a)
	name_1 = qs(0x1a7f7bb2)
	name_2 = qs(0xcafec390)
	venue = load_z_neworleans
	playlist_type = filtered
	num_songs = 1
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				2
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				3
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				4
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	num_songs = 1
	required_band = [
		bass
	]
	bonus_text = score_bass
	gold_descrip = 50000
	platinum_descrip = 100000
	diamond_descrip = 200000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_sponsor_schecter_info = {
	name = 'c_Sponsor_Schecter'
	$c_score_points_global_ref
}
c_sponsor_seymourduncan = {
	id = c_sponsor_seymourduncan
	name = qs(0x3b4f388a)
	descrip = qs(0x544b2e53)
	name_1 = qs(0x3b4f388a)
	name_2 = qs(0x46049d61)
	venue = load_z_nashville
	playlist_type = filtered
	num_songs = 1
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				2
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				3
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				4
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				5
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				6
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				7
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				8
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				9
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	num_songs = 1
	required_band = [
		lead
	]
	bonus_text = whammy
	gold_descrip = 15
	platinum_descrip = 30
	diamond_descrip = 40
	target_display_type = amount
	target_display_units = qs(0xb9082291)
}
c_sponsor_seymourduncan_info = {
	name = 'c_Sponsor_SeymourDuncan'
	$c_whammy_time_global_ref
}
c_sponsor_tama = {
	id = c_sponsor_tama
	name = qs(0x6afaa2b2)
	descrip = qs(0xaae37348)
	name_1 = qs(0x6afaa2b2)
	name_2 = qs(0x427062a0)
	venue = load_z_carhenge
	required_band = [
		drum
	]
	playlist_type = filtered
	num_songs = 1
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				2
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				3
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				4
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				5
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				6
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				7
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	bonus_text = note_streak
	gold_descrip = 100
	platinum_descrip = 200
	diamond_descrip = 300
	target_display_type = amount
	target_display_units = qs(0xc2a7066f)
}
c_sponsor_tama_info = {
	name = 'c_Sponsor_Tama'
	$c_streak_notes_global_ref
}
c_sponsor_zildjian = {
	id = c_sponsor_zildjian
	name = qs(0xb97142f9)
	descrip = qs(0x71640ce1)
	name_1 = qs(0xb97142f9)
	name_2 = qs(0xacb0ad32)
	venue = load_z_freakshow
	playlist_type = filtered
	num_songs = 1
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				2
			]
			comparator = not_equal
		}
		{
			key = song_venue
			union_list = [
				3
			]
			comparator = not_equal
		}
		{
			key = song_source
			union_list = [
				gh5
			]
			comparator = equal
		}
	]
	invert_filterspec = 1
	required_band = [
		drum
	]
	bonus_text = spower_banked
	gold_descrip = 150
	platinum_descrip = 200
	diamond_descrip = 250
	target_display_type = percent
	target_display_units = qs(0x46429946)
}
c_sponsor_zildjian_info = {
	name = 'c_Sponsor_Zildjian'
	$c_spower_banked_global_ref
}
c_special_gorfinal = {
	id = c_special_gorfinal
	name = qs(0x12771cfe)
	descrip = qs(0x3e3c1029)
	name_1 = qs(0x12771cfe)
	name_2 = qs(0x514096c0)
	venue = load_z_cube
	playlist_type = filtered
	num_songs = 1
	filterspec = [
		{
			key = song_venue
			union_list = [
				1
				2
				3
				4
				5
				6
				7
				8
				9
				10
				11
				12
				13
				19
			]
			comparator = equal
		}
	]
	required_band = [
		any
		any
	]
	bonus_text = score_points
	gold_descrip = 2500000
	platinum_descrip = 5000000
	diamond_descrip = 10000000
	target_display_type = amount
	target_display_units = qs(0xfa93e8ad)
}
c_special_gorfinal_info = {
	name = 'c_Special_GORFinal'
	$c_score_points_global_ref
}
