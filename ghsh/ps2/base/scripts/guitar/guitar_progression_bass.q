gh4_career_bass_songs = {
	prefix = 'career_bass'
	part = bass
	num_tiers = 8
	tier1 = {
		title = qs(0xea47b2d9)
		songs = [
			hitmewithyourbestshot
			iloverockandroll
			iwannarock
			godzilla
			takemeout
			nothinbutagoodtime
			messageinabottle
		]
		stars = 0
		encore_stars = 16
		level = load_z_amazon
	}
	tier2 = {
		title = qs(0x12b22730)
		songs = [
			heartshapedbox
			takeitoff
			killerqueen
			rockandrollallnite
			mother
			roundandround
			cherrypie
		]
		stars = 21
		encore_stars = 37
		level = load_z_canyon
	}
	tier3 = {
		title = qs(0x68a5b300)
		songs = [
			morethanafeeling
			heyyou
			stellar
			thembones
			electriceye
			psychobillyfreakout
			smokeonthewater
		]
		stars = 42
		encore_stars = 58
		level = load_z_icecap
	}
	tier4 = {
		title = qs(0xdabbabe2)
		songs = [
			shoutatthedevil
			unsung
			killinginthenameof
			barracuda
			thunderkiss65
			backinthesaddle
			monkeywrench
		]
		stars = 63
		encore_stars = 79
		level = load_z_london
	}
	tier5 = {
		title = qs(0xb859513b)
		songs = [
			carryonmywaywardson
			woman
			cultofpersonality
			barkatthemoon
			stop
			laydown
			playwithme
		]
		stars = 84
		encore_stars = 100
		level = load_z_sphinx
	}
	tier6 = {
		title = qs(0xf416949e)
		songs = [
			missmurder
			freya
			nooneknows
			trippinonahole
			thetrooper
			rainingblood
			caughtinamosh
		]
		stars = 105
		encore_stars = 121
		level = load_z_greatwall
	}
	tier7 = {
		title = qs(0xc0fcc8f7)
		songs = [
			beastandtheharlot
			cowboysfromhell
			laidtorest
			freebird
			yyz
		]
		stars = 126
		level = load_z_atlantis
	}
	tier8 = {
		title = qs(0xf079fba9)
		songs = [
			throughthefire
		]
		stars = 141
		level = load_z_quebec
		end_with_credits
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
