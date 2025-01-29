gh4_career_guitar_songs = {
	prefix = 'career_guitar'
	part = guitar
	num_tiers = 10
	tier1 = {
		$gh4_3_intro_tier
	}
	tier2 = {
		title = qs(0x28c2e38f)
		songs = [
			whitewedding
			firstdate
			safeeuropeanhome
			stacysmom
			semicharmedlife
		]
		level = load_z_la_block_party
		stars = 6
	}
	tier3 = {
		title = qs(0x584bc2fb)
		songs = [
			dancethenightaway
			jamiescryin
			ainttalkinboutlove
			atomicpunk
			prettywoman
		]
		level = load_z_starwood
		stars = 16
	}
	tier4 = {
		title = qs(0xab50e027)
		songs = [
			bestofyou
			pain
			doublevision
			rockandrollisdead
			dopenose
		]
		level = load_z_rome
		stars = 24
	}
	tier5 = {
		title = qs(0xc4332586)
		songs = [
			andthecradlewillrock
			everybodywantssome
			unchained
			youreallygotme
			Jump
		]
		level = load_z_s_stage
		stars = 33
	}
	tier6 = {
		title = qs(0x4b4691c9)
		songs = [
			prettyflyforawhiteguy
			iwantitall
			spacetruckin
			cometolife
			thetakedown
		]
		level = load_z_paris
		stars = 42
	}
	tier7 = {
		title = qs(0xda232d28)
		songs = [
			feelyourlovetonight
			hearaboutitlater
			icecreamman
			sothisislove
			beautifulgirls
		]
		level = load_z_drum_kit
		stars = 51
	}
	tier8 = {
		title = qs(0x57792bcb)
		songs = [
			painkiller
			endofheartache
			sicksicksick
			masterexploder
		]
		level = load_z_london
		stars = 60
	}
	tier9 = {
		title = qs(0x91b6a806)
		songs = [
			meanstreet
			littleguitars
			somebodygetmeadoctor
			hangemhigh
			lossofcontrol
		]
		level = load_z_frankenstrat
		stars = 69
	}
	tier10 = {
		title = qs(0x7646d4db)
		songs = [
			romeodelight
			hotforteacher
			imtheone
			cathedral
			spanishfly
			eruption
		]
		level = load_z_starwood
		stars = 85
	}
	0xb2c7c47b = [
		{
			$0x738b443f
		}
	]
}
gh4_career_guitar_progression_unlock_order = {
	Name = 'Career_Guitar'
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
gh4_career_guitar_gig_complete_params = {
	career_guitar
	unlock_order = gh4_career_guitar_progression_unlock_order
	part = 'Guitar'
}
gh4_career_guitar_progression = [
	{
		Name = set_initial_states
		Type = Scr
		atom_script = progression_career_guitar_init
		atom_params = {
		}
	}
	{
		Name = guitar_career_gig1_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_guitar_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_guitar
					part = 'Guitar'
					gig = 1
				}
			}
		]
	}
	{
		Name = end_of_first_update
		Type = Scr
		atom_script = progression_career_guitar_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_career_guitar_init 

endscript

script progression_career_guitar_endoffirstupdate 

endscript

script update_progression_guitar 
	UpdateAtoms \{Name = Progression}
endscript
