gh4_3_intro_tier = {
	title = qs(0x51d26164)
	songs = [
		panama
		runningwiththedevil
	]
	level = load_z_s_stage
	stars = 0
	encore_stars = 0
	unlocked_levels = [
		0xfdf4308b
	]
}
gh4_career_band_songs = {
	prefix = 'career_band'
	part = Band
	num_tiers = 10
	tier1 = {
		$gh4_3_intro_tier
	}
	tier2 = {
		title = qs(0x28c2e38f)
		songs = [
			whitewedding
			stacysmom
			prettyflyforawhiteguy
			bestofyou
			safeeuropeanhome
		]
		stars = 6
		level = load_z_la_block_party
	}
	tier3 = {
		title = qs(0x584bc2fb)
		songs = [
			andthecradlewillrock
			prettywoman
			jamiescryin
			ainttalkinboutlove
			everybodywantssome
		]
		level = load_z_starwood
		stars = 16
	}
	tier4 = {
		title = qs(0xab50e027)
		songs = [
			semicharmedlife
			pain
			rockandrollisdead
			endofheartache
			firstdate
		]
		stars = 24
		level = load_z_rome
	}
	tier5 = {
		title = qs(0xc4332586)
		songs = [
			unchained
			atomicpunk
			dancethenightaway
			hearaboutitlater
			Jump
		]
		stars = 33
		level = load_z_s_stage
	}
	tier6 = {
		title = qs(0x4b4691c9)
		songs = [
			doublevision
			iwantitall
			masterexploder
			dopenose
			cometolife
		]
		stars = 42
		level = load_z_paris
	}
	tier7 = {
		title = qs(0xda232d28)
		songs = [
			littleguitars
			eruption
			youreallygotme
			feelyourlovetonight
			icecreamman
		]
		stars = 51
		level = load_z_drum_kit
	}
	tier8 = {
		title = qs(0x57792bcb)
		songs = [
			spacetruckin
			thetakedown
			sicksicksick
			painkiller
		]
		stars = 60
		encore_stars = 43
		level = load_z_london
	}
	tier9 = {
		title = qs(0x91b6a806)
		songs = [
			beautifulgirls
			somebodygetmeadoctor
			hangemhigh
			romeodelight
			lossofcontrol
		]
		stars = 69
		level = load_z_frankenstrat
	}
	tier10 = {
		title = qs(0x7646d4db)
		songs = [
			sothisislove
			meanstreet
			imtheone
			hotforteacher
		]
		stars = 85
		level = load_z_starwood
	}
	0xb2c7c47b = [
		{
			$0x738b443f
		}
	]
}
gh4_career_band_progression_unlock_order = {
	Name = 'Career_Band'
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
	}
}
gh4_career_band_gig_complete_params = {
	career_band
	unlock_order = gh4_career_band_progression_unlock_order
	part = 'Band'
}
gh4_career_band_progression = [
	{
		Name = set_initial_states
		Type = Scr
		atom_script = progression_career_band_init
		atom_params = {
		}
	}
	{
		Name = band_career_gig1_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					part = 'Band'
					gig = 1
				}
			}
		]
	}
	{
		Name = end_of_first_update
		Type = Scr
		atom_script = progression_career_band_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_career_band_init 

endscript

script progression_career_band_endoffirstupdate 

endscript
