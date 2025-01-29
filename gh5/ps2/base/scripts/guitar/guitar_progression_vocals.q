gh4_career_vocals_songs = {
	prefix = 'career_vocals'
	part = vocals
	num_tiers = 14
	tier1 = {
		title = qs(0xe8f17401)
		songs = [
			gratitude
			mirrorpeople
			song2
			blueday
			feelgoodinc
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
			kryptonite
			nearlylostyou
			steadyasshegoes
			theysay
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
			whybother
			cigarettesweddingbands
			inmyplace
			nevermissabeat
			rockshow
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
			youandme
			yougivelove
			bleedamerican
			comedown
			exgirlfriend
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
			gammaray
			lovetoken
			makeitwitchu
			playthatfunkymusic
			sowingseason
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
			womanfromtokyo
			fame
			inthemeantime
			wannabeinla
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
			jailbreak
			la
			lonelyisthenight
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
			onebigholiday
			demon
			incinerate
			medicate
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
			americangirl
			bulletsbutterfly
			disconnected
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
			seven
			sneakout
			twentiethcenturyboy
			apunk
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
			deadbolt
			lustforlife
			doyoufeellikewedo
			maidenmothercrone
		]
		0x29c8d5a6 = [
			backround
		]
		stars = 135
		level = load_z_cairo
	}
	tier12 = {
		title = qs(0x40c9ee8a)
		songs = [
			streamlinewoman
			sweatingbullets
			wolflikeme
			saturdaynightsalright
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
			sixdaysaweek
			judith
			solonely
			whatigot
			donewitheverything
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
gh4_career_vocals_progression_unlock_order = {
	Name = 'Career_Vocals'
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
gh4_career_vocals_gig_complete_params = {
	career_vocals
	unlock_order = gh4_career_vocals_progression_unlock_order
	part = 'Vocals'
}
gh4_career_vocals_progression = [
	{
		Name = set_initial_states
		Type = Scr
		atom_script = progression_career_vocals_init
		atom_params = {
		}
	}
	{
		Name = vocals_career_gig1_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_vocals_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_vocals
					gig = 1
				}
			}
		]
	}
	{
		Name = end_of_first_update
		Type = Scr
		atom_script = progression_career_vocals_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_career_vocals_init 

endscript

script progression_career_vocals_endoffirstupdate 

endscript
