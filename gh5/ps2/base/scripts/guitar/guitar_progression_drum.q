gh4_career_drum_songs = {
	prefix = 'career_drum'
	part = drum
	num_tiers = 14
	tier1 = {
		title = qs(0xe8f17401)
		songs = [
			feelgoodinc
			fame
			inmyplace
			makeitwitchu
			mirrorpeople
		]
		0x29c8d5a6 = [
			allalongthewatchtower
			sympathyforthedevil
		]
		stars = 0
		level = load_z_subway
	}
	tier2 = {
		title = qs(0xa6f99d1d)
		songs = [
			playthatfunkymusic
			steadyasshegoes
			wannabeinla
			yougivelove
		]
		0x29c8d5a6 = [
			onlyhappywhenitrains
			blueorchid
			hurtssogood
		]
		stars = 15
		level = load_z_lhc
	}
	tier3 = {
		title = qs(0x4a95dc5c)
		songs = [
			cigarettesweddingbands
			gratitude
			inthemeantime
			la
			lovetoken
		]
		0x29c8d5a6 = [
			underpressure
			sexonfire
		]
		stars = 30
		level = load_z_freakshow
	}
	tier4 = {
		title = qs(0x8a2dd332)
		songs = [
			nevermissabeat
			song2
			sowingseason
			theysay
			bleedamerican
		]
		0x29c8d5a6 = [
			dancingwithmyself
			shoutitoutloud
		]
		stars = 45
		level = load_z_neworleans
	}
	tier5 = {
		title = qs(0x2d18d9da)
		songs = [
			blueday
			gammaray
			jailbreak
			lonelyisthenight
			whybother
		]
		0x29c8d5a6 = [
			pluginbaby
			superstition
			sultansofswing
		]
		stars = 60
		level = load_z_dublin
	}
	tier6 = {
		title = qs(0x3a84101e)
		songs = [
			comedown
			kryptonite
			womanfromtokyo
			youandme
		]
		0x29c8d5a6 = [
			hungrylikethewolf
			looksthatkill
		]
		stars = 75
		level = load_z_dragrace
	}
	tier7 = {
		title = qs(0x8cac823e)
		songs = [
			exgirlfriend
			nearlylostyou
			rockshow
		]
		0x29c8d5a6 = [
			smellsliketeenspirit
			lithium
			alltheprettyfaces
		]
		stars = 87
		level = load_z_carhenge
	}
	tier8 = {
		title = qs(0xeab93c80)
		songs = [
			twentiethcenturyboy
			whatigot
			americangirl
			apunk
		]
		0x29c8d5a6 = [
			bringthenoise
			duhast
		]
		stars = 99
		level = load_z_vegas
	}
	tier9 = {
		title = qs(0xa36d3d13)
		songs = [
			ringoffire
			doyoufeellikewedo
			saturdaynightsalright
			wolflikeme
		]
		0x29c8d5a6 = [
			wereanamericanband
		]
		stars = 111
		level = load_z_nashville
	}
	tier10 = {
		title = qs(0x4b9bbddb)
		songs = [
			solonely
			streamlinewoman
			disconnected
			incinerate
		]
		0x29c8d5a6 = [
			noonetodependon
			runnindownadream
		]
		stars = 123
		level = load_z_mexicocity
	}
	tier11 = {
		title = qs(0x7196b4d1)
		songs = [
			sneakout
			sweatingbullets
			judith
			medicate
		]
		0x29c8d5a6 = [
			backround
			younkfunk
		]
		stars = 135
		level = load_z_cairo
	}
	tier12 = {
		title = qs(0x40c9ee8a)
		songs = [
			sixdaysaweek
			deadbolt
			lustforlife
			maidenmothercrone
		]
		0x29c8d5a6 = [
			brianstorm
			twominutestomidnight
		]
		stars = 147
		level = load_z_sanfrancisco
	}
	tier13 = {
		title = qs(0xe9c20e9a)
		songs = [
			onebigholiday
			bulletsbutterfly
			demon
			seven
			donewitheverything
			scatterbrain
		]
		0x29c8d5a6 = [
			spiritofradio
		]
		stars = 159
		level = load_z_norway
	}
	tier14 = {
		title = qs(0x3ee59a14)
		songs = [
			twentyfirstcentury
		]
		stars = -1
		level = load_z_cube
	}
}
gh4_career_drum_progression_unlock_order = {
	Name = 'Career_Drum'
	freegigs = {
		gig1 = {
			Name = 'gig1'
			num = 1
		}
		gig2 = {
			Name = 'gig2'
			num = 2
		}
		gig3 = {
			Name = 'gig3'
			num = 3
		}
		gig4 = {
			Name = 'gig4'
			num = 4
		}
		gig5 = {
			Name = 'gig5'
			num = 5
		}
		gig6 = {
			Name = 'gig6'
			num = 6
		}
		gig7 = {
			Name = 'gig7'
			num = 7
		}
		gig8 = {
			Name = 'gig8'
			num = 8
		}
		gig9 = {
			Name = 'gig9'
			num = 9
		}
		gig10 = {
			Name = 'gig10'
			num = 10
		}
		0x8efac11b = {
			Name = 'gig11'
			num = 11
		}
		0x17f390a1 = {
			Name = 'gig12'
			num = 12
		}
		0x60f4a037 = {
			Name = 'gig13'
			num = 13
		}
		0xfe903594 = {
			Name = 'gig14'
			num = 14
		}
	}
}
gh4_career_drum_gig_complete_params = {
	career_drum
	unlock_order = gh4_career_drum_progression_unlock_order
	part = 'Drum'
}
gh4_career_drum_progression = [
	{
		Name = set_initial_states
		Type = Scr
		atom_script = progression_career_drum_init
		atom_params = {
		}
	}
	{
		Name = drum_career_gig1_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 1
				}
			}
		]
	}
	{
		Name = end_of_first_update
		Type = Scr
		atom_script = progression_career_drum_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_career_drum_init 

endscript

script progression_career_drum_endoffirstupdate 

endscript
