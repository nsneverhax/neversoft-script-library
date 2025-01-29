gh4_career_bass_songs = {
	prefix = 'career_bass'
	part = bass
	num_tiers = 10
	tier1 = {
		$gh4_3_intro_tier
	}
	tier2 = {
		title = qs(0x28c2e38f)
		songs = [
			pain
			whitewedding
			bestofyou
			stacysmom
			firstdate
		]
		stars = 6
		level = load_z_la_block_party
	}
	tier3 = {
		title = qs(0x584bc2fb)
		songs = [
			Jump
			littleguitars
			ainttalkinboutlove
			unchained
			hearaboutitlater
		]
		level = load_z_starwood
		stars = 16
	}
	tier4 = {
		title = qs(0xab50e027)
		songs = [
			safeeuropeanhome
			iwantitall
			semicharmedlife
			endofheartache
			prettyflyforawhiteguy
		]
		stars = 24
		level = load_z_rome
	}
	tier5 = {
		title = qs(0xc4332586)
		songs = [
			andthecradlewillrock
			dancethenightaway
			jamiescryin
			prettywoman
			youreallygotme
		]
		stars = 33
		level = load_z_s_stage
	}
	tier6 = {
		title = qs(0x4b4691c9)
		songs = [
			dopenose
			masterexploder
			doublevision
			rockandrollisdead
			spacetruckin
		]
		stars = 42
		level = load_z_paris
	}
	tier7 = {
		title = qs(0xda232d28)
		songs = [
			icecreamman
			beautifulgirls
			everybodywantssome
			feelyourlovetonight
			lossofcontrol
		]
		stars = 51
		level = load_z_drum_kit
	}
	tier8 = {
		title = qs(0x57792bcb)
		songs = [
			cometolife
			painkiller
			thetakedown
			sicksicksick
		]
		stars = 60
		level = load_z_london
	}
	tier9 = {
		title = qs(0x91b6a806)
		songs = [
			atomicpunk
			hotforteacher
			somebodygetmeadoctor
			romeodelight
		]
		stars = 69
		level = load_z_frankenstrat
	}
	tier10 = {
		title = qs(0x7646d4db)
		songs = [
			hangemhigh
			imtheone
			sothisislove
			meanstreet
		]
		stars = 85
		level = load_z_starwood
	}
}
gh4_career_bass_progression_unlock_order = {
	Name = 'Career_Bass'
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
gh4_career_bass_gig_complete_params = {
	career_bass
	unlock_order = gh4_career_bass_progression_unlock_order
	part = 'Bass'
}
gh4_career_bass_progression = [
	{
		Name = set_initial_states
		Type = Scr
		atom_script = progression_career_bass_init
		atom_params = {
		}
	}
	{
		Name = rhythm_career_gig1_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_bass_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_bass
					part = 'Bass'
					gig = 1
				}
			}
		]
	}
	{
		Name = end_of_first_update
		Type = Scr
		atom_script = progression_career_bass_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_career_bass_init 
	printf \{qs(0x2f3f7ae0)}
endscript

script progression_career_bass_endoffirstupdate 
	printf \{qs(0xb5eaf894)}
endscript
