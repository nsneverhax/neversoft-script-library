gh4_career_drum_songs = {
	prefix = 'career_drum'
	part = drum
	num_tiers = 20
	initial_movie = 'drummer_intro'
	end_movie = 'drummer_outro'
	tier1 = {
		songs = [
			eyeofthetiger
			thejoker
			beatit
		]
		encorep1 = beatit
		level = load_z_goth
		poster_texture = goth_poster
		defaultunlocked = 4
		setlist_icon = setlist_icon_bar
		genre = goth
	}
	tier2 = {
		songs = [
			ontheroadagain
			bandontherun
			nosleeptillbrooklyn
		]
		encorep1 = nosleeptillbrooklyn
		level = load_z_hob
		poster_texture = hob_poster
		setlist_icon = setlist_icon_bar
		genre = rock
	}
	tier3 = {
		songs = [
			areyougonnagomyway
			whativedone
			livingonaprayer
		]
		encorep1 = livingonaprayer
		level = load_z_frathouse
		poster_texture = frat_poster
		setlist_icon = setlist_icon_bar
		genre = `classic rock`
	}
	tier4 = {
		songs = [
			uparoundthebend
			somemightsay
			aboutagirl
			hotelcalifornia
		]
		encorep1 = hotelcalifornia
		level = load_z_harbor
		poster_texture = hongkong_poster
		setlist_icon = setlist_icon_bar
		genre = `classic rock`
	}
	tier5 = {
		songs = [
			themiddle
			escueladecalor
			today
			rebelyell
		]
		encorep1 = rebelyell
		level = load_z_cathedral
		poster_texture = bone_poster
		setlist_icon = setlist_icon_bar
		genre = goth
	}
	tier6 = {
		songs = [
			doitagain
			ramblinman
			loveremovalmachine
			stranglehold
			lovemetwotimes
		]
		encorep1 = lovemetwotimes
		level = load_z_fairgrounds
		poster_texture = statefair_poster
		setlist_icon = setlist_icon_bar
		genre = `classic rock`
	}
	tier7 = {
		songs = [
			onewayoranother
			theoneilove
			antisocial
			stillborn
			reedthroughlabor
		]
		encorep1 = reedthroughlabor
		level = load_z_bayou
		poster_texture = bayou_poster
		setlist_icon = setlist_icon_bar
		genre = rock
	}
	tier8 = {
		songs = [
			heartbreaker
			lvialviaquez
			feelthepain
			miserybusiness
			kickoutthejams
		]
		encorep1 = kickoutthejams
		level = load_z_recordstore
		poster_texture = amobea_poster
		setlist_icon = setlist_icon_bar
		genre = punk
	}
	tier9 = {
		songs = [
			beautifuldisaster
			youregonnasayyeah
			goyourownway
			demolitionman
			sweethomealabama
		]
		encorep1 = sweethomealabama
		level = load_z_castle
		poster_texture = castle_poster
		setlist_icon = setlist_icon_bar
		genre = rock
	}
	tier10 = {
		songs = [
			americanwoman
			heymanniceshot
			santeria
			windcriesmary
			purplehaze
		]
		encorep1 = purplehaze
		level = load_z_ballpark
		poster_texture = sf_ballpark_poster
		setlist_icon = setlist_icon_bar
		genre = `classic rock`
	}
	tier11 = {
		songs = [
			overkill
			prisonerofsociety
			ourtruth
			freakonaleash
			mrcrowley
			crazytrain
		]
		encorep1 = crazytrain
		level = load_z_metalfest
		poster_texture = ozzfest_poster
		setlist_icon = setlist_icon_bar
		genre = `heavy metal`
	}
	tier12 = {
		songs = [
			mountainsong
			spiderwebs
			shiver
			thekill
			dammit
			everlong
		]
		encorep1 = everlong
		level = load_z_military
		poster_texture = aircraft_poster
		setlist_icon = setlist_icon_bar
		genre = punk
	}
	tier13 = {
		songs = [
			obstacle1
			labamba
			assassin
			screamaimfire
			trappedunderice
			byob
			hotforteacher
		]
		encorep1 = hotforteacher
		level = load_z_newyork
		poster_texture = times_poster
		setlist_icon = setlist_icon_bar
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
		setlist_icon = setlist_icon_bar
		genre = punk
	}
	tier15 = {
		songs = [
			toomuchtooyoung
			floaton
			monsoon
			toyboy
			vinternoll2
		]
		paytoplay = 2000
		level = load_z_hotel
		poster_texture = tiki_poster
		setlist_icon = setlist_icon_bar
		genre = punk
	}
	tier16 = {
		songs = [
			rooftops
			weaponofchoice
			lazyeye
			nuvole
			hailtothefreaks
		]
		paytoplay = 2000
		level = load_z_studio2
		poster_texture = studio_01_poster
		setlist_icon = setlist_icon_bar
		genre = pop
	}
	tier17 = {
		songs = [
			nevertoolate
			aggro
			prettyvacant
			hollywoodnights
			onearmedscissor
		]
		paytoplay = 2000
		level = load_z_scifi
		poster_texture = voltage_poster
		setlist_icon = setlist_icon_bar
		genre = goth
	}
	tier18 = {
		songs = [
			satchboogie
			souldoubt
			goodgod
			lovespreads
			pullmeunder
		]
		paytoplay = 3000
		level = load_z_credits
		poster_texture = wow_poster
		setlist_icon = setlist_icon_bar
		genre = `black metal`
	}
	tier19 = {
		songs = [
			placeholdersong
		]
		poster_texture = create_a_gig_poster
		genre = `heavy metal`
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
gh4_career_drum_progression_unlock_order = {
	name = 'Career_Drum'
	freegigs = {
		gig1 = {
			name = 'gig1'
			num = 1
		}
		gig2 = {
			name = 'gig2'
			num = 2
		}
		gig3 = {
			name = 'gig3'
			num = 3
		}
		gig4 = {
			name = 'gig20'
			num = 20
			debug_dont_unlock
			dont_add_gig_poster
		}
	}
	freegigs_last = {
		gig1 = {
			name = 'gig19'
			num = 19
			forced_pos = 17
		}
	}
	unlockset1 = {
		gig1 = {
			name = 'gig4'
			num = 4
		}
	}
	unlockset2 = {
		gig1 = {
			name = 'gig5'
			num = 5
		}
		pay_to_play1 = {
			name = 'gig14'
			num = 14
		}
	}
	unlockset3 = {
		gig1 = {
			name = 'gig6'
			num = 6
		}
	}
	unlockset4 = {
		gig1 = {
			name = 'gig7'
			num = 7
		}
		gig2 = {
			name = 'gig8'
			num = 8
		}
	}
	unlockset5 = {
		pay_to_play1 = {
			name = 'gig15'
			num = 15
		}
		gig1 = {
			name = 'gig9'
			num = 9
		}
	}
	unlockset6 = {
		pay_to_play1 = {
			name = 'gig16'
			num = 16
		}
		gig1 = {
			name = 'gig10'
			num = 10
		}
	}
	unlockset7 = {
		gig1 = {
			name = 'gig11'
			num = 11
		}
		pay_to_play1 = {
			name = 'gig17'
			num = 17
		}
	}
	unlockset8 = {
		gig1 = {
			name = 'gig12'
			num = 12
		}
	}
	unlockset9 = {
		none = 'none'
	}
	unlockset10 = {
		gig1 = {
			name = 'gig13'
			num = 13
			forced_pos = 18
		}
	}
	unlockset11 = {
		none = 'none'
		pay_to_play1 = {
			name = 'gig18'
			num = 18
			forced_pos = 19
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
		name = set_initial_states
		type = scr
		atom_script = progression_career_drum_init
		atom_params = {
		}
	}
	{
		name = drum_career_gig1_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 1
				}
			}
		]
	}
	{
		name = drum_career_gig2_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 2
				}
			}
		]
	}
	{
		name = drum_career_gig3_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 3
				}
			}
		]
	}
	{
		name = drum_career_gig4_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 4
				}
			}
		]
	}
	{
		name = drum_career_gig5_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 5
				}
			}
		]
	}
	{
		name = drum_career_gig6_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 6
				}
			}
		]
	}
	{
		name = drum_career_gig7_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 7
				}
			}
		]
	}
	{
		name = drum_career_gig8_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 8
				}
			}
		]
	}
	{
		name = drum_career_gig9_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 9
				}
			}
		]
	}
	{
		name = drum_career_gig10_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 10
				}
			}
		]
	}
	{
		name = drum_career_gig11_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 11
				}
			}
		]
	}
	{
		name = drum_career_gig12_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 12
				}
			}
		]
	}
	{
		name = drum_career_gig13_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 13
				}
			}
		]
	}
	{
		name = drum_career_bonus_gig1_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 14
				}
			}
		]
	}
	{
		name = drum_career_bonus_gig2_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 15
				}
			}
		]
	}
	{
		name = drum_career_bonus_gig3_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 16
				}
			}
		]
	}
	{
		name = drum_career_bonus_gig4_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 17
				}
			}
		]
	}
	{
		name = drum_career_bonus_gig4_unlock
		type = scr
		atom_script = progression_career_gig_unlock
		atom_params = {
			$gh4_career_drum_gig_complete_params
			gig_name = 'gig18'
		}
		depends_on = [
			{
				type = atom
				atom = drum_career_gig13_complete
			}
		]
	}
	{
		name = drum_career_bonus_gig5_complete
		type = scr
		atom_script = progression_career_gig_complete
		atom_params = $gh4_career_drum_gig_complete_params
		depends_on = [
			{
				type = scr
				scr = progression_career_check_gig_complete
				params = {
					career_drum
					gig = 18
				}
			}
		]
	}
	{
		name = end_of_first_update
		type = scr
		atom_script = progression_career_drum_endoffirstupdate
		atom_params = {
		}
	}
]

script progression_career_drum_init 
	printf \{qs(0xf347395d)}
endscript

script progression_career_drum_endoffirstupdate 
	printf \{qs(0xd8377944)}
endscript
