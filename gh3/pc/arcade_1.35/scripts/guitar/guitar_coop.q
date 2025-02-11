GH3_CoopCareer_Songs = {
	prefix = 'coopcareer'
	num_tiers = 7
	initial_movie = 'coop_01'
	tier1 = {
		title = "1. Getting a band together"
		songs = [
			barracuda
			whenyouwereyoung
			bullsonparade
			slowride
			sabotage
		]
		encorep2
		level = load_z_dive
		defaultunlocked = 4
		completion_movie = 'coop_02'
		setlist_icon = setlist_icon_BAR
	}
	tier2 = {
		title = "2. We just wanna be famous"
		songs = [
			schoolsout
			koolthing
			missmurder
			theseeker
			reptilia
		]
		encorep2
		level = load_z_video
		completion_movie = 'coop_03'
		setlist_icon = setlist_icon_VIDEOSHOOT
	}
	tier3 = {
		title = "3. Overnight success"
		songs = [
			paranoid
			anarchyintheuk
			laydown
		]
		encorep2
		level = load_z_budokan
		completion_movie = 'coop_04'
		setlist_icon = setlist_icon_MEGADOME
	}
	tier4 = {
		title = "4. Getting the band back together"
		songs = [
			holidayincambodia
			blackmagicwoman
			sameoldsonganddance
			cherubrock
			citiesonflame
		]
		encorep2
		level = load_z_party
		completion_movie = 'coop_05'
		setlist_icon = setlist_icon_BACKYARD
	}
	tier5 = {
		title = "5. Jailhouse rock"
		songs = [
			mynameisjonas
			blacksunshine
			threesandsevens
			themetal
			helicopter
		]
		encorep2
		level = load_z_prison
		completion_movie = 'coop_06'
		setlist_icon = setlist_icon_PRISON
	}
	tier6 = {
		title = "6. Battle for your souls"
		songs = [
			knightsofcydonia
			cultofpersonality
			monsters
		]
		encorep2
		level = load_z_hell
		completion_movie = 'singleplayer_end'
		setlist_icon = setlist_icon_HELL
	}
	tier7 = {
		title = "Unlocked Songs"
		songs = [
			TalkDirtyToMe
			hitmewithyourbestshot
			mississippiqueen
			rocknrollallnite
			sunshineofyourlove
			evenflow
			rockulikeahurricane
			lagrange
			stricken
			pridenjoy
			rainingblood
			cliffsofdover
		]
		level = load_z_artdeco
		level2 = load_z_wikka
		nocash
	}
}
GH3_COOPCareer_NumSongToProgress = {
	easy = 3
	medium = 3
	hard = 4
	expert = 4
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
				params = {
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
				params = {
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
				params = {
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
				params = {
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
				params = {
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
				params = {
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
				params = {
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
				params = {
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
				params = {
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
				params = {
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
				params = {
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
				params = {
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
			complete
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
			bass = 1
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
				params = {
					diff = easy
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
			bass = 2
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = easy
					mode = p2_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		Name = unlock_bass3
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			bass = 3
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
				params = {
					diff = medium
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
			bass = 4
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = medium
					mode = p2_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		Name = unlock_bass5
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			bass = 5
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
				params = {
					diff = hard
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
			bass = 6
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = hard
					mode = p2_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				params = {
				}
			}
		]
	}
	{
		Name = unlock_bass7
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			bass = 7
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
				params = {
					diff = expert
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
			bass = 8
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = expert
					mode = p2_career
				}
			}
			{
				Type = Scr
				Scr = Progression_CheckSong5Star
				params = {
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
