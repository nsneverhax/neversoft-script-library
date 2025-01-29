gh4_career_bass_songs = {
	prefix = 'career_bass'
	part = bass
	num_tiers = 9
	tier1 = {
		$gh4_1_intro_tier
	}
	tier2 = {
		title = qs(0x87931eee)
		songs = [
			turnthepage
			noexcuses
			motherofmercy
			armedandready
			mommyslittlemonster
		]
		stars = 6
		level = load_z_tushino
	}
	tier3 = {
		title = qs(0xc7118aa2)
		songs = [
			nothingelsematters
			kingnothing
			entersandman
			whereverimayroam
			noleafclover
		]
		stars = 16
		encore_stars = 16
		level = load_z_tushino
	}
	tier4 = {
		title = qs(0x2de7d2e1)
		songs = [
			stonecoldcrazy
			toxicity
			stackedactors
			demoncleaner
			albatross
			sadbuttrue
			thememoryremains
			fadetoblack
			frantic
			orion
		]
		stars = 26
		encore_stars = 31
		level = load_z_mop
	}
	tier5 = {
		title = qs(0x36cd3e47)
		songs = [
			hellbentforleather
			amievil
			tuesdaysgone
			theboysareback
			warinsidemyhead
			allnightmarelong
			one
			fuel
			hitthelights
			sanitarium
		]
		stars = 36
		encore_stars = 43
		level = load_z_justice
	}
	tier6 = {
		title = qs(0x36aabf4b)
		songs = [
			blackriver
			bloodandthunder
			beautifulmourning
			mercyfulfate
			seekanddestroy
			creepingdeath
			battery
			masterofpuppets
		]
		stars = 50
		encore_stars = 55
		level = load_z_meadowlands
	}
	tier7 = {
		title = qs(0x88266a5b)
		songs = [
			evil
			aceofspades
			warensemble
			whiplash
			dyerseve
			theshorteststraw
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
		Name = bass_career_gig1_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_bass_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_bass
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

endscript

script progression_career_bass_endoffirstupdate 

endscript
