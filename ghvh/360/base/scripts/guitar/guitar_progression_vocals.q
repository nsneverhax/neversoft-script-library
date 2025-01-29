gh4_career_vocals_songs = {
	prefix = 'career_vocals'
	part = vocals
	num_tiers = 10
	tier1 = {
		$gh4_3_intro_tier
	}
	tier2 = {
		title = qs(0x28c2e38f)
		songs = [
			prettyflyforawhiteguy
			endofheartache
			bestofyou
			whitewedding
			masterexploder
		]
		stars = 6
		level = load_z_la_block_party
	}
	tier3 = {
		title = qs(0x584bc2fb)
		songs = [
			everybodywantssome
			andthecradlewillrock
			hangemhigh
			somebodygetmeadoctor
			prettywoman
		]
		level = load_z_starwood
		stars = 16
	}
	tier4 = {
		title = qs(0xab50e027)
		songs = [
			rockandrollisdead
			thetakedown
			painkiller
			spacetruckin
			cometolife
		]
		stars = 24
		level = load_z_rome
	}
	tier5 = {
		title = qs(0xc4332586)
		songs = [
			lossofcontrol
			jamiescryin
			romeodelight
			atomicpunk
			Jump
		]
		stars = 33
		level = load_z_s_stage
	}
	tier6 = {
		title = qs(0x4b4691c9)
		songs = [
			pain
			stacysmom
			firstdate
			sicksicksick
			safeeuropeanhome
		]
		stars = 42
		level = load_z_paris
	}
	tier7 = {
		title = qs(0xda232d28)
		songs = [
			unchained
			beautifulgirls
			icecreamman
			ainttalkinboutlove
			imtheone
		]
		stars = 51
		level = load_z_drum_kit
	}
	tier8 = {
		title = qs(0x57792bcb)
		songs = [
			doublevision
			dopenose
			semicharmedlife
			iwantitall
		]
		stars = 60
		level = load_z_london
	}
	tier9 = {
		title = qs(0x91b6a806)
		songs = [
			youreallygotme
			feelyourlovetonight
			sothisislove
			littleguitars
		]
		stars = 69
		level = load_z_frankenstrat
	}
	tier10 = {
		title = qs(0x7646d4db)
		songs = [
			hotforteacher
			hearaboutitlater
			meanstreet
			dancethenightaway
		]
		stars = 82
		level = load_z_starwood
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
					part = 'Vocals'
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
	printf \{qs(0x27427fc4)}
endscript

script progression_career_vocals_endoffirstupdate 
	printf \{qs(0x850bf005)}
endscript
