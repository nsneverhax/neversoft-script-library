gh4_1_intro_tier = {
	title = qs(0xa2eff010)
	songs = [
		forwhomthebelltolls
		theunforgiven
	]
	level = load_z_forum
	stars = 0
	encore_stars = 0
	unlocked_levels = [
		load_z_forum
		load_z_tushino
		load_z_soundcheck2
		load_z_studio2
	]
}
gh4_career_band_songs = {
	prefix = 'career_band'
	part = Band
	num_tiers = 9
	tier1 = {
		$gh4_1_intro_tier
	}
	tier2 = {
		title = qs(0x87931eee)
		songs = [
			turnthepage
			motherofmercy
			noexcuses
			tuesdaysgone
			demoncleaner
		]
		stars = 6
		level = load_z_tushino
	}
	tier3 = {
		title = qs(0xc7118aa2)
		songs = [
			nothingelsematters
			entersandman
			kingnothing
			sadbuttrue
			noleafclover
		]
		stars = 16
		encore_stars = 16
		level = load_z_tushino
	}
	tier4 = {
		title = qs(0x2de7d2e1)
		songs = [
			stackedactors
			toxicity
			armedandready
			albatross
			theboysareback
			orion
			fadetoblack
			thememoryremains
			whereverimayroam
			sanitarium
		]
		stars = 26
		encore_stars = 31
		level = load_z_mop
	}
	tier5 = {
		title = qs(0x36cd3e47)
		songs = [
			hellbentforleather
			blackriver
			mommyslittlemonster
			warinsidemyhead
			aceofspades
			fuel
			frantic
			one
			allnightmarelong
			hitthelights
		]
		stars = 36
		encore_stars = 43
		level = load_z_justice
	}
	tier6 = {
		title = qs(0x36aabf4b)
		songs = [
			amievil
			bloodandthunder
			stonecoldcrazy
			mercyfulfate
			seekanddestroy
			creepingdeath
			masterofpuppets
			battery
		]
		stars = 50
		encore_stars = 55
		level = load_z_meadowlands
	}
	tier7 = {
		title = qs(0x88266a5b)
		songs = [
			beautifulmourning
			warensemble
			evil
			theshorteststraw
			whiplash
			dyerseve
			disposeableheroes
			fightfirewithfire
		]
		stars = 60
		encore_stars = 67
		level = load_z_donnington
	}
	tier8 = {
		title = qs(0xe52af9f7)
		songs = [
			thethingthat
		]
		stars = 72
		level = load_z_icecave
	}
	tier9 = {
		title = qs(0x36d44196)
		songs = [
			brokenbeatandscarred
			cyanide
			myapocalypse
		]
		stars = 0
		level = load_z_stone
	}
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
	printf \{qs(0x86f732a4)}
endscript

script progression_career_band_endoffirstupdate 
	printf \{qs(0xdcf0b0f3)}
endscript
