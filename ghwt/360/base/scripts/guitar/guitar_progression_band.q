gh4_career_band_songs = {
	prefix = 'career_band'
	part = Band
	num_tiers = 20
	initial_movie = 'band_intro'
	end_movie = 'band_outro'
	tier1 = {
		songs = [
			nosleeptillbrooklyn
			aboutagirl
			whativedone
		]
		encorep1 = whativedone
		level = load_z_hob
		poster_texture = hob_poster
		defaultunlocked = 4
		setlist_icon = setlist_icon_BAR
		genre = punk
	}
	tier2 = {
		songs = [
			uparoundthebend
			somemightsay
			eyeofthetiger
		]
		encorep1 = eyeofthetiger
		level = load_z_frathouse
		poster_texture = frat_poster
		setlist_icon = setlist_icon_BAR
		genre = rock
	}
	tier3 = {
		songs = [
			theoneilove
			thejoker
			bandontherun
		]
		encorep1 = bandontherun
		level = load_z_harbor
		poster_texture = hongkong_poster
		setlist_icon = setlist_icon_BAR
		genre = `classic	rock`
	}
	tier4 = {
		songs = [
			beautifuldisaster
			feelthepain
			today
			youregonnasayyeah
		]
		encorep1 = youregonnasayyeah
		level = load_z_cathedral
		poster_texture = bone_poster
		setlist_icon = setlist_icon_BAR
		genre = goth
	}
	tier5 = {
		songs = [
			doitagain
			ontheroadagain
			stillborn
			hotelcalifornia
		]
		encorep1 = hotelcalifornia
		level = load_z_bayou
		poster_texture = bayou_poster
		setlist_icon = setlist_icon_BAR
		genre = `classic	rock`
	}
	tier6 = {
		songs = [
			livingonaprayer
			ramblinman
			onewayoranother
			miserybusiness
			obstacle1
		]
		encorep1 = obstacle1
		level = load_z_recordstore
		poster_texture = amobea_poster
		setlist_icon = setlist_icon_BAR
		genre = rock
	}
	tier7 = {
		songs = [
			themiddle
			mountainsong
			rebelyell
			freakonaleash
			loveremovalmachine
		]
		encorep1 = loveremovalmachine
		level = load_z_goth
		poster_texture = goth_poster
		setlist_icon = setlist_icon_BAR
		genre = goth
	}
	tier8 = {
		songs = [
			areyougonnagomyway
			heartbreaker
			beatit
			stranglehold
			goyourownway
		]
		encorep1 = goyourownway
		level = load_z_fairgrounds
		poster_texture = statefair_poster
		setlist_icon = setlist_icon_BAR
		genre = pop
	}
	tier9 = {
		songs = [
			americanwoman
			heymanniceshot
			lovemetwotimes
			dammit
			spiderwebs
		]
		encorep1 = spiderwebs
		level = load_z_military
		poster_texture = aircraft_poster
		setlist_icon = setlist_icon_BAR
		genre = rock
	}
	tier10 = {
		songs = [
			kickoutthejams
			escueladecalor
			santeria
			demolitionman
			shiver
		]
		encorep1 = shiver
		level = load_z_castle
		poster_texture = castle_poster
		setlist_icon = setlist_icon_BAR
		genre = rock
	}
	tier11 = {
		songs = [
			sweethomealabama
			everlong
			lvialviaquez
			thekill
			windcriesmary
			purplehaze
		]
		encorep1 = purplehaze
		level = load_z_ballpark
		poster_texture = sf_ballpark_poster
		setlist_icon = setlist_icon_BAR
		genre = `classic	rock`
	}
	tier12 = {
		songs = [
			overkill
			prisonerofsociety
			ourtruth
			screamaimfire
			mrcrowley
			crazytrain
		]
		encorep1 = crazytrain
		level = load_z_metalfest
		poster_texture = ozzfest_poster
		setlist_icon = setlist_icon_BAR
		genre = `heavy	metal`
	}
	tier13 = {
		songs = [
			antisocial
			reedthroughlabor
			trappedunderice
			labamba
			assassin
			hotforteacher
			byob
		]
		encorep1 = byob
		level = load_z_newyork
		poster_texture = times_poster
		setlist_icon = setlist_icon_BAR
		genre = rock
		play_finalbandintro_transition_type = finalbandintro_transition_played_guitar
		end_with_credits
	}
	tier14 = {
		songs = [
			parabola
			schism
			vicarious
		]
		paytoplay = 8000
		level = load_z_tool
		poster_texture = tool_poster
		setlist_icon = setlist_icon_BAR
		genre = punk
	}
	tier15 = {
		songs = [
			monsoon
			aggro
			rooftops
			toomuchtooyoung
			floaton
		]
		paytoplay = 2000
		level = load_z_hotel
		poster_texture = tiki_poster
		setlist_icon = setlist_icon_BAR
		genre = punk
	}
	tier16 = {
		songs = [
			lazyeye
			prettyvacant
			nuvole
			toyboy
			hailtothefreaks
		]
		paytoplay = 2000
		level = load_z_studio2
		poster_texture = studio_01_poster
		setlist_icon = setlist_icon_BAR
		genre = pop
	}
	tier17 = {
		songs = [
			vinternoll2
			weaponofchoice
			goodgod
			onearmedscissor
			hollywoodnights
		]
		paytoplay = 2000
		level = load_z_scifi
		poster_texture = voltage_poster
		setlist_icon = setlist_icon_BAR
		genre = goth
	}
	tier18 = {
		songs = [
			lovespreads
			nevertoolate
			souldoubt
			pullmeunder
		]
		paytoplay = 3000
		level = load_z_credits
		poster_texture = wow_poster
		setlist_icon = setlist_icon_BAR
		genre = `black	metal`
	}
	tier19 = {
		songs = [
			placeholdersong
		]
		poster_texture = create_a_gig_poster
		genre = `heavy	metal`
		createagig
	}
	tier20 = {
		songs = [
			tenseconddebug
			elevenseconddebug
			twelveseconddebug
		]
		encorep1 = twelveseconddebug
		level = load_z_newyork
		poster_texture = studio_01_poster
		genre = punk
		debug_gig
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
			Name = 'gig20'
			num = 20
			debug_dont_unlock
			dont_add_gig_poster
		}
	}
	freegigs_last = {
		gig1 = {
			Name = 'gig19'
			num = 19
			forced_pos = 17
		}
	}
	unlockset1 = {
		gig1 = {
			Name = 'gig4'
			num = 4
			forced_pos = 4
		}
	}
	unlockset2 = {
		gig1 = {
			Name = 'gig5'
			num = 5
			forced_pos = 5
		}
		pay_to_play1 = {
			Name = 'gig14'
			num = 14
			forced_pos = 6
		}
	}
	unlockset3 = {
		gig1 = {
			Name = 'gig6'
			num = 6
			forced_pos = 7
		}
	}
	unlockset4 = {
		gig1 = {
			Name = 'gig7'
			num = 7
			forced_pos = 8
		}
		gig2 = {
			Name = 'gig8'
			num = 8
			forced_pos = 9
		}
	}
	unlockset5 = {
		pay_to_play1 = {
			Name = 'gig15'
			num = 15
			forced_pos = 11
		}
		gig1 = {
			Name = 'gig9'
			num = 9
			forced_pos = 10
		}
	}
	unlockset6 = {
		pay_to_play1 = {
			Name = 'gig16'
			num = 16
			forced_pos = 13
		}
		gig1 = {
			Name = 'gig10'
			num = 10
			forced_pos = 12
		}
	}
	unlockset7 = {
		gig1 = {
			Name = 'gig11'
			num = 11
			forced_pos = 14
		}
		pay_to_play1 = {
			Name = 'gig17'
			num = 17
			forced_pos = 15
		}
	}
	unlockset8 = {
		gig1 = {
			Name = 'gig12'
			num = 12
			forced_pos = 16
		}
	}
	unlockset9 = {
		None = 'none'
	}
	unlockset10 = {
		gig1 = {
			Name = 'gig13'
			num = 13
			forced_pos = 18
		}
	}
	unlockset11 = {
		None
		pay_to_play1 = {
			Name = 'gig18'
			num = 18
			forced_pos = 19
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
		Name = band_career_gig2_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 2
				}
			}
		]
	}
	{
		Name = band_career_gig3_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 3
				}
			}
		]
	}
	{
		Name = band_career_gig4_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 4
				}
			}
		]
	}
	{
		Name = band_career_gig5_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 5
				}
			}
		]
	}
	{
		Name = band_career_gig6_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 6
				}
			}
		]
	}
	{
		Name = band_career_gig7_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 7
				}
			}
		]
	}
	{
		Name = band_career_gig8_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 8
				}
			}
		]
	}
	{
		Name = band_career_gig9_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 9
				}
			}
		]
	}
	{
		Name = band_career_gig10_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 10
				}
			}
		]
	}
	{
		Name = band_career_gig11_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 11
				}
			}
		]
	}
	{
		Name = band_career_gig12_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 12
				}
			}
		]
	}
	{
		Name = band_career_gig13_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 13
				}
			}
		]
	}
	{
		Name = band_career_bonus_gig1_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 14
				}
			}
		]
	}
	{
		Name = band_career_bonus_gig2_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 15
				}
			}
		]
	}
	{
		Name = band_career_bonus_gig3_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 16
				}
			}
		]
	}
	{
		Name = band_career_bonus_gig4_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 17
				}
			}
		]
	}
	{
		Name = band_career_bonus_gig4_unlock
		Type = Scr
		atom_script = progression_career_gig_unlock
		atom_params = {
			$gh4_career_band_gig_complete_params
			gig_name = 'gig18'
		}
		depends_on = [
			{
				Type = atom
				atom = band_career_gig13_complete
			}
			{
				Type = Scr
				Scr = check_gig_unlocked
				params = {
					career_band
					gig = 13
				}
			}
		]
	}
	{
		Name = band_career_bonus_gig5_complete
		Type = Scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_band_gig_complete_params
		depends_on = [
			{
				Type = Scr
				Scr = progression_career_check_gig_complete
				params = {
					career_band
					gig = 18
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
