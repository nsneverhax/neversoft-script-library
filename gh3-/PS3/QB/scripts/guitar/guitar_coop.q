GH3_CoopCareer_Songs = {
	prefix = 'coopcareer'
	num_tiers = 7
	initial_movie = 'coop_01'
	tier1 = {
		Title = "1. Getting a band together"
		songs = [
			Barracuda
			whenyouwereyoung
			bullsonparade
			slowride
			sabotage
		]
		encorep2
		Level = load_z_dive
		defaultunlocked = 4
		completion_movie = 'coop_02'
		setlist_icon = setlist_icon_BAR
	}
	tier2 = {
		Title = "2. We just wanna be famous"
		songs = [
			schoolsout
			koolthing
			MissMurder
			theseeker
			reptilia
		]
		encorep2
		Level = load_z_video
		completion_movie = 'coop_03'
		setlist_icon = setlist_icon_VIDEOSHOOT
	}
	tier3 = {
		Title = "3. Overnight success"
		songs = [
			Paranoid
			welcometothejungle
			anarchyintheuk
			LayDown
			suckmykiss
		]
		encorep2
		Level = load_z_budokan
		completion_movie = 'coop_04'
		setlist_icon = setlist_icon_MEGADOME
	}
	tier4 = {
		Title = "4. Getting the band back together"
		songs = [
			holidayincambodia
			blackmagicwoman
			sameoldsonganddance
			cherubrock
			citiesonflame
		]
		encorep2
		Level = load_z_party
		completion_movie = 'coop_05'
		setlist_icon = setlist_icon_BACKYARD
	}
	tier5 = {
		Title = "5. Jailhouse rock"
		songs = [
			mynameisjonas
			blacksunshine
			threesandsevens
			themetal
			helicopter
		]
		encorep2
		Level = load_z_prison
		completion_movie = 'coop_06'
		setlist_icon = setlist_icon_PRISON
	}
	tier6 = {
		Title = "6. Battle for your souls"
		songs = [
			knightsofcydonia
			ONE
			numberofthebeast
			CultOfPersonality
			monsters
		]
		encorep2
		Level = load_z_hell
		completion_movie = 'singleplayer_end'
		setlist_icon = setlist_icon_HELL
	}
	tier7 = {
		Title = "Unlocked Songs"
		songs = [
			talkdirtytome
			HitMeWithYourBestShot
			mississippiqueen
			rocknrollallnite
			storyofmylife
			sunshineofyourlove
			evenflow
			rockulikeahurricane
			lagrange
			stricken
			pridenjoy
			beforeiforget
			RainingBlood
			cliffsofdover
		]
		Level = load_z_artdeco
		level2 = load_z_wikka
		nocash
	}
}
GH3_COOPCareer_NumSongToProgress = {
	EASY = 3
	MEDIUM = 3
	HARD = 4
	EXPERT = 4
}
GH3_CoopCareer_Progression = [
	{
		Name = set_initial_states
		Type = Scr
		atom_script = Progression_Init
		atom_params = {
		}
	}
	{
		Name = career_tier1_songscomplete
		Type = Scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			Tier = 1
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckSongComplete
				Params = {
					Tier = 1
					numsongstoprogress = $GH3_COOPCareer_NumSongToProgress
				}
			}
		]
	}
	{
		Name = career_tier1_encoreunlock
		Type = Scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			Tier = 1
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier1_songscomplete
			}
			{
				Type = Scr
				Scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		Name = career_tier1_encorecomplete
		Type = Scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			Tier = 1
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier1_encoreunlock
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 1
				}
			}
		]
	}
	{
		Name = career_tier1_complete
		Type = Scr
		atom_script = Progression_TierComplete
		atom_params = {
			Tier = 1
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier1_songscomplete
			}
			{
				Type = atom
				atom = career_tier1_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		Name = career_tier2_songscomplete
		Type = Scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			Tier = 2
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier1_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckSongComplete
				Params = {
					Tier = 2
					numsongstoprogress = $GH3_COOPCareer_NumSongToProgress
				}
			}
		]
	}
	{
		Name = career_tier2_encoreunlock
		Type = Scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			Tier = 2
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier2_songscomplete
			}
			{
				Type = Scr
				Scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		Name = career_tier2_encorecomplete
		Type = Scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			Tier = 2
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier2_encoreunlock
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 2
				}
			}
		]
	}
	{
		Name = career_tier2_complete
		Type = Scr
		atom_script = Progression_TierComplete
		atom_params = {
			Tier = 2
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier2_songscomplete
			}
			{
				Type = atom
				atom = career_tier2_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		Name = career_tier3_songscomplete
		Type = Scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			Tier = 3
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier2_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckSongComplete
				Params = {
					Tier = 3
					numsongstoprogress = $GH3_COOPCareer_NumSongToProgress
				}
			}
		]
	}
	{
		Name = career_tier3_encoreunlock
		Type = Scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			Tier = 3
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier3_songscomplete
			}
			{
				Type = Scr
				Scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		Name = career_tier3_encorecomplete
		Type = Scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			Tier = 3
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier3_encoreunlock
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 3
				}
			}
		]
	}
	{
		Name = career_tier3_complete
		Type = Scr
		atom_script = Progression_TierComplete
		atom_params = {
			Tier = 3
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier3_songscomplete
			}
			{
				Type = atom
				atom = career_tier3_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		Name = career_tier4_songscomplete
		Type = Scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			Tier = 4
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier3_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckSongComplete
				Params = {
					Tier = 4
					numsongstoprogress = $GH3_COOPCareer_NumSongToProgress
				}
			}
		]
	}
	{
		Name = career_tier4_encoreunlock
		Type = Scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			Tier = 4
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier4_songscomplete
			}
			{
				Type = Scr
				Scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		Name = career_tier4_encorecomplete
		Type = Scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			Tier = 4
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier4_encoreunlock
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 4
				}
			}
		]
	}
	{
		Name = career_tier4_complete
		Type = Scr
		atom_script = Progression_TierComplete
		atom_params = {
			Tier = 4
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier4_songscomplete
			}
			{
				Type = atom
				atom = career_tier4_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		Name = career_tier5_songscomplete
		Type = Scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			Tier = 5
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier4_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckSongComplete
				Params = {
					Tier = 5
					numsongstoprogress = $GH3_COOPCareer_NumSongToProgress
				}
			}
		]
	}
	{
		Name = career_tier5_encoreunlock
		Type = Scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			Tier = 5
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier5_songscomplete
			}
			{
				Type = Scr
				Scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		Name = career_tier5_encorecomplete
		Type = Scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			Tier = 5
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier5_encoreunlock
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 5
				}
			}
		]
	}
	{
		Name = career_tier5_complete
		Type = Scr
		atom_script = Progression_TierComplete
		atom_params = {
			Tier = 5
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier5_songscomplete
			}
			{
				Type = atom
				atom = career_tier5_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		Name = career_tier6_songscomplete
		Type = Scr
		atom_script = Progression_TierSongsComplete
		atom_params = {
			Tier = 6
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier5_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckSongComplete
				Params = {
					Tier = 6
					numsongstoprogress = $GH3_COOPCareer_NumSongToProgress
				}
			}
		]
	}
	{
		Name = career_tier6_encoreunlock
		Type = Scr
		atom_script = Progression_TierEncoreUnlock
		atom_params = {
			Tier = 6
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_songscomplete
			}
			{
				Type = Scr
				Scr = Progression_AlwaysBlock
				required = [
					0
					0
					0
					0
				]
			}
		]
	}
	{
		Name = career_tier6_encorecomplete
		Type = Scr
		atom_script = Progression_TierEncoreComplete
		atom_params = {
			Tier = 6
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_encoreunlock
			}
			{
				Type = Scr
				Scr = Progression_CheckEncoreComplete
				Params = {
					Tier = 6
				}
			}
		]
	}
	{
		Name = career_tier6_complete
		Type = Scr
		atom_script = Progression_TierComplete
		atom_params = {
			Tier = 6
			finished_game
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_songscomplete
			}
			{
				Type = atom
				atom = career_tier6_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
		]
	}
	{
		Name = career_unlock_unlockedsongs
		Type = Scr
		atom_script = Progression_UnlockTier
		atom_params = {
			Tier = 7
			Complete
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_complete
			}
		]
	}
	{
		Name = unlock_bass1
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			BASS = 1
			for_difficulty
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = EASY
					mode = p2_career
				}
			}
		]
	}
	{
		Name = unlock_bass2
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			BASS = 2
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = EASY
					mode = p2_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
			}
		]
	}
	{
		Name = unlock_bass3
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			BASS = 3
			for_difficulty
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = MEDIUM
					mode = p2_career
				}
			}
		]
	}
	{
		Name = unlock_bass4
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			BASS = 4
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = MEDIUM
					mode = p2_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
			}
		]
	}
	{
		Name = unlock_bass5
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			BASS = 5
			for_difficulty
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = HARD
					mode = p2_career
				}
			}
		]
	}
	{
		Name = unlock_bass6
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			BASS = 6
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = HARD
					mode = p2_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
			}
		]
	}
	{
		Name = unlock_bass7
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			BASS = 7
			for_difficulty
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_complete
			}
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = EXPERT
					mode = p2_career
				}
			}
		]
	}
	{
		Name = unlock_bass8
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			BASS = 8
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				Params = {
					diff = EXPERT
					mode = p2_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				Params = {
				}
			}
		]
	}
	{
		Name = end_of_first_update
		Type = Scr
		atom_script = Progression_EndOfFirstUpdate
		atom_params = {
		}
	}
]
