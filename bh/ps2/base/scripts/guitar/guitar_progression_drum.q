gh4_career_drum_songs = {
	prefix = 'career_drum'
	part = drum
	num_tiers = 11
	tier1 = {
		title = qs(0xf055aee0)
		songs = [
			0x8afcd7a7
			0x222f6a10
			hangmeuptodry
			0x3c78e175
			0x56096622
		]
		0x29c8d5a6 = [
			0x7052b61b
			prettywoman
		]
		stars = 0
		level = 0x39914645
	}
	tier2 = {
		title = qs(0x9ea1e51c)
		songs = [
			0xf5fe8ca8
			0x36ce830d
			0x55397d2a
			0x5749b512
			0xd6b99fe2
		]
		0x29c8d5a6 = [
			0x826f0248
			0xcadbbe3d
		]
		stars = 15
		level = load_z_montreux
	}
	tier3 = {
		title = qs(0x2e2d9822)
		songs = [
			0x685e6b17
			0x1b75728f
			0xd0691b84
			0x4fbc9810
			0x563874d4
		]
		0x29c8d5a6 = [
			0x3dc7acbb
			0xe443019e
		]
		stars = 30
		level = load_z_cabo
	}
	tier4 = {
		title = qs(0xc0b61c08)
		songs = [
			0xa885319e
			0x03726e6d
			0xabd82191
			0x556ca3a6
			lovestory
		]
		0x29c8d5a6 = [
			0x3ede7cc8
			0xb3b66b06
		]
		stars = 45
		level = load_z_centralpark
	}
	tier5 = {
		title = qs(0x3986d53b)
		songs = [
			0x93aa4e4c
			0x00d0eabb
			0x814b34d7
			0x878dc3db
			shewillbeloved
		]
		0x29c8d5a6 = [
			0xd4079a1b
			0xf22a5fa8
		]
		stars = 60
		level = load_z_tokyo
	}
	tier6 = {
		title = qs(0xd26e042b)
		songs = [
			0x1837c32d
			0x3504550d
			0x875e4578
			0xc0fd7289
			0xfacce756
		]
		0x29c8d5a6 = [
			0xcba77008
			0x0633a1f3
		]
		stars = 75
		level = load_z_easterisland
	}
	tier7 = {
		title = qs(0x2de3cf22)
		songs = [
			0x0bb63a7c
			0xbd072e6b
			0xabd1e5b9
			0x94a42d7a
			dontspeak
		]
		0x29c8d5a6 = [
			0x12330cfe
			0xfce6fe2c
		]
		stars = 90
		level = 0xa72a91a6
	}
	tier8 = {
		title = qs(0x9bef74a5)
		songs = [
			0xc15cce84
			0x9a39c15d
			0x0e02bf53
			picturetoburn
			youbelongwithme
		]
		0x29c8d5a6 = [
			0x3ef936f4
		]
		stars = 105
		level = load_z_gorge
	}
	tier9 = {
		title = qs(0xb7503ee2)
		songs = [
			0x301df215
			0xe6c0e0dc
			0xf8598272
			justagirl
		]
		0x29c8d5a6 = [
			0x7c98e3c4
		]
		stars = 120
		level = load_z_paris
	}
	tier10 = {
		title = qs(0x1a1191d2)
		songs = [
			0x58aabfeb
			0x9ffeeaa0
			0x2929c704
		]
		0x29c8d5a6 = [
			0xb494ce29
		]
		stars = 135
		level = 0x8362270b
	}
	tier11 = {
		title = qs(0x3ee59a14)
		songs = [
			0xeb495d4b
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
