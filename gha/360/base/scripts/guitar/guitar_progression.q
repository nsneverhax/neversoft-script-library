progression_beat_game_last_song = 0
progression_unlock_tier_last_song = 0
progression_play_completion_movie = 0
progression_completion_tier = 1
progression_unlocked_guitar = -1
progression_unlocked_guitar2 = -1
progression_unlocked_type = guitar
GH3_Career_Songs = {
	prefix = 'career'
	num_tiers = 6
	initial_movie = 'AO_short_1'
	tier1 = {
		title = "1. Getting the band together"
		songs = [
			dreampolice
			alltheyoungdudes
			makeit
			unclesalty
			drawtheline
		]
		encorep1
		aerosmith_encore_p1
		level = load_z_nipmuc
		defaultunlocked = 2
		completion_movie = 'AO_short_2'
		setlist_icon = setlist_icon_01
	}
	tier2 = {
		title = "2. First taste of success"
		songs = [
			ihatemyselfforlovingyou
			alldayandallofthenight
			nosurprize
			movinout
			sweetemotion
		]
		encorep1
		aerosmith_encore_p1
		level = load_z_maxskc
		completion_movie = 'AO_short_3'
		setlist_icon = setlist_icon_02
	}
	tier3 = {
		title = "3. The triumphant return"
		songs = [
			completecontrol
			personalitycrisis
			livinontheedge
			ragdoll
			loveinanelevator
		]
		encorep1
		aerosmith_encore_p1
		level = load_z_fenway
		completion_movie = 'AO_short_4'
		setlist_icon = setlist_icon_03
	}
	tier4 = {
		title = "4. International Superstars"
		songs = [
			shesellssanctuary
			kingofrock
			nobodysfault
			brightlightfright
			walkthiswayrundmc
		]
		encorep1
		aerosmith_encore_p1
		level = load_z_nine_lives
		completion_movie = 'AO_short_5'
		setlist_icon = setlist_icon_04
	}
	tier5 = {
		title = "5. The Great American Band"
		songs = [
			hardtohandle
			alwaysontherun
			backinthesaddle
			beyondbeautiful
			dreamon
		]
		encorep1
		aerosmith_encore_p1
		level = load_z_jpplay
		completion_movie = 'AO_short_6'
		setlist_icon = setlist_icon_05
	}
	tier6 = {
		title = "6. Rock 'N Roll Legends"
		songs = [
			catscratchfever
			sextypething
			bossjoe
			mamakin
			toysintheattic
			trainkeptarollin
		]
		encorep1
		aerosmith_encore_p1
		boss
		level = load_z_hof
		completion_movie = 'singleplayer_end'
		setlist_icon = setlist_icon_06
	}
}
GH3_General_Songs = {
	prefix = 'general'
	num_tiers = 6
	tier1 = {
		title = "1. Getting the band together"
		songs = [
			dreampolice
			alltheyoungdudes
			makeit
			unclesalty
			drawtheline
		]
		encorep1
		aerosmith_encore_p1
		level = load_z_nipmuc
		defaultunlocked = 4
		completion_movie = 'AO_short_2'
		setlist_icon = setlist_icon_01
	}
	tier2 = {
		title = "2. First taste of success"
		songs = [
			ihatemyselfforlovingyou
			alldayandallofthenight
			nosurprize
			movinout
			sweetemotion
		]
		encorep1
		aerosmith_encore_p1
		level = load_z_maxskc
		defaultunlocked = 4
		completion_movie = 'AO_short_3'
		setlist_icon = setlist_icon_02
	}
	tier3 = {
		title = "3. The triumphant return"
		songs = [
			completecontrol
			personalitycrisis
			livinontheedge
			ragdoll
			loveinanelevator
		]
		encorep1
		aerosmith_encore_p1
		level = load_z_fenway
		completion_movie = 'AO_short_4'
		setlist_icon = setlist_icon_03
	}
	tier4 = {
		title = "4. International Superstars"
		songs = [
			shesellssanctuary
			kingofrock
			nobodysfault
			brightlightfright
			walkthiswayrundmc
		]
		encorep1
		aerosmith_encore_p1
		level = load_z_nine_lives
		completion_movie = 'AO_short_5'
		setlist_icon = setlist_icon_04
	}
	tier5 = {
		title = "5. The Great American Band"
		songs = [
			hardtohandle
			alwaysontherun
			backinthesaddle
			beyondbeautiful
			dreamon
		]
		encorep1
		aerosmith_encore_p1
		level = load_z_jpplay
		completion_movie = 'AO_short_6'
		setlist_icon = setlist_icon_05
	}
	tier6 = {
		title = "6. Rock 'N Roll Legends"
		songs = [
			catscratchfever
			sextypething
			mamakin
			toysintheattic
			trainkeptarollin
		]
		encorep1
		aerosmith_encore_p1
		level = load_z_hof
		completion_movie = 'singleplayer_end'
		setlist_icon = setlist_icon_06
	}
}
GH3_Career_NumSongToProgress = {
	easy = 3
	medium = 3
	hard = 4
	expert = 4
	Bonus = 11
}
GH3_Career_Progression = [
	{
		Name = set_initial_states
		Type = Scr
		atom_script = Progression_Init
		atom_params = {
		}
	}
	{
		Name = career_tier1_intro_songscomplete
		Type = Scr
		atom_script = progression_tieraerosmithunlock
		atom_params = {
			Tier = 1
		}
		depends_on = [
			{
				Type = Scr
				Scr = progression_checkintrosongscomplete
				params = {
					Tier = 1
				}
			}
		]
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
					numsongstoprogress = $GH3_Career_NumSongToProgress
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
		Name = career_tier2_intro_songscomplete
		Type = Scr
		atom_script = progression_tieraerosmithunlock
		atom_params = {
			Tier = 2
		}
		depends_on = [
			{
				Type = Scr
				Scr = progression_checkintrosongscomplete
				params = {
					Tier = 2
				}
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
					numsongstoprogress = $GH3_Career_NumSongToProgress
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
		Name = career_tier3_intro_songscomplete
		Type = Scr
		atom_script = progression_tieraerosmithunlock
		atom_params = {
			Tier = 3
		}
		depends_on = [
			{
				Type = Scr
				Scr = progression_checkintrosongscomplete
				params = {
					Tier = 3
				}
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
					numsongstoprogress = $GH3_Career_NumSongToProgress
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
		Name = career_tier4_intro_songscomplete
		Type = Scr
		atom_script = progression_tieraerosmithunlock
		atom_params = {
			Tier = 4
		}
		depends_on = [
			{
				Type = Scr
				Scr = progression_checkintrosongscomplete
				params = {
					Tier = 4
				}
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
					numsongstoprogress = $GH3_Career_NumSongToProgress
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
		Name = career_tier5_intro_songscomplete
		Type = Scr
		atom_script = progression_tieraerosmithunlock
		atom_params = {
			Tier = 5
		}
		depends_on = [
			{
				Type = Scr
				Scr = progression_checkintrosongscomplete
				params = {
					Tier = 5
				}
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
					numsongstoprogress = $GH3_Career_NumSongToProgress
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
		Name = career_tier6_bossunlock
		Type = Scr
		atom_script = Progression_TierBossUnlock
		atom_params = {
			Tier = 6
		}
		depends_on = [
			{
				Type = Scr
				Scr = progression_checkintrosongscomplete
				params = {
					Tier = 6
				}
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
		Name = career_tier6_bosscomplete
		Type = Scr
		atom_script = Progression_TierBossComplete
		atom_params = {
			Tier = 6
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_bossunlock
			}
			{
				Type = Scr
				Scr = Progression_CheckBossComplete
				params = {
					Tier = 6
				}
			}
		]
	}
	{
		Name = career_tier6_intro_songscomplete
		Type = Scr
		atom_script = progression_tieraerosmithunlock
		atom_params = {
			Tier = 6
		}
		depends_on = [
			{
				Type = atom
				atom = career_tier6_bosscomplete
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
				Type = atom
				atom = career_tier6_bosscomplete
			}
			{
				Type = Scr
				Scr = Progression_CheckSongComplete
				params = {
					Tier = 6
					numsongstoprogress = $GH3_Career_NumSongToProgress
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
			{
				Type = atom
				atom = career_tier6_bosscomplete
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
		Name = career_bonus_songs_complete
		Type = Scr
		atom_script = Progression_TierComplete
		atom_params = {
			Tier = 1
			Bonus
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckSongComplete
				params = {
					Tier = 1
					numsongstoprogress = $GH3_Career_NumSongToProgress
					Bonus
				}
			}
		]
	}
	{
		Name = unlock_guitar1
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			guitar = 1
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
					mode = p1_career
				}
			}
		]
	}
	{
		Name = unlock_guitar2
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			guitar = 2
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = easy
					mode = p1_career
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
		Name = unlock_guitar3
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			guitar = 3
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
					mode = p1_career
				}
			}
		]
	}
	{
		Name = unlock_guitar4
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			guitar = 4
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = medium
					mode = p1_career
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
		Name = unlock_guitar5
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			guitar = 5
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
					mode = p1_career
				}
			}
		]
	}
	{
		Name = unlock_guitar6
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			guitar = 6
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = hard
					mode = p1_career
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
		Name = unlock_guitar7
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			guitar = 7
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
					mode = p1_career
				}
			}
		]
	}
	{
		Name = unlock_guitar8
		Type = Scr
		atom_script = Progression_UnlockGuitar
		atom_params = {
			guitar = 8
			for_stars
		}
		depends_on = [
			{
				Type = Scr
				Scr = Progression_CheckDiff
				params = {
					diff = expert
					mode = p1_career
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
Cash_System_rules = [
	{
		diff = easy
		newstars = 3
		oldstars = 0
		cash = 75
	}
	{
		diff = easy
		newstars = 4
		oldstars = 0
		cash = 175
	}
	{
		diff = easy
		newstars = 5
		oldstars = 0
		cash = 300
	}
	{
		diff = easy
		newstars = 4
		oldstars = 3
		cash = 100
	}
	{
		diff = easy
		newstars = 5
		oldstars = 3
		cash = 225
	}
	{
		diff = easy
		newstars = 5
		oldstars = 4
		cash = 125
	}
	{
		diff = medium
		newstars = 3
		oldstars = 0
		cash = 150
	}
	{
		diff = medium
		newstars = 4
		oldstars = 0
		cash = 350
	}
	{
		diff = medium
		newstars = 5
		oldstars = 0
		cash = 600
	}
	{
		diff = medium
		newstars = 4
		oldstars = 3
		cash = 200
	}
	{
		diff = medium
		newstars = 5
		oldstars = 3
		cash = 450
	}
	{
		diff = medium
		newstars = 5
		oldstars = 4
		cash = 250
	}
	{
		diff = hard
		newstars = 3
		oldstars = 0
		cash = 300
	}
	{
		diff = hard
		newstars = 4
		oldstars = 0
		cash = 700
	}
	{
		diff = hard
		newstars = 5
		oldstars = 0
		cash = 1200
	}
	{
		diff = hard
		newstars = 4
		oldstars = 3
		cash = 400
	}
	{
		diff = hard
		newstars = 5
		oldstars = 3
		cash = 900
	}
	{
		diff = hard
		newstars = 5
		oldstars = 4
		cash = 500
	}
	{
		diff = expert
		newstars = 3
		oldstars = 0
		cash = 450
	}
	{
		diff = expert
		newstars = 4
		oldstars = 0
		cash = 1050
	}
	{
		diff = expert
		newstars = 5
		oldstars = 0
		cash = 1800
	}
	{
		diff = expert
		newstars = 4
		oldstars = 3
		cash = 600
	}
	{
		diff = expert
		newstars = 5
		oldstars = 3
		cash = 1350
	}
	{
		diff = expert
		newstars = 5
		oldstars = 4
		cash = 750
	}
]

script Progression_Init 
	printf \{"Progression_Init"}
	Tier = 0
	get_progression_globals game_mode = ($game_mode)
	if ($game_mode = p1_career)
		formatText checksumName = tiername 'tier%i' i = (<Tier> + 1)
		Change current_level = ($<tier_global>.<tiername>.level)
	endif
	Change \{setlist_previous_tier = 1}
	Change \{setlist_previous_song = 0}
	Change \{setlist_previous_tab = tab_setlist}
endscript

script Progression_EndOfFirstUpdate 
	Change \{end_credits = 0}
	Change \{progression_beat_game_last_song = 0}
	Change \{progression_unlock_tier_last_song = 0}
	Change \{progression_play_completion_movie = 0}
	Change \{progression_unlocked_guitar = -1}
	Change \{progression_unlocked_guitar2 = -1}
	Change \{progression_unlocked_type = guitar}
endscript

script Progression_TierSongsComplete 
	printf \{"Progression_TierSongsComplete"}
endscript

script progression_tieraerosmithunlock 
	printf \{"Progression_TierAerosmithUnlock"}
	get_progression_globals game_mode = ($game_mode)
	progression_getaerosmithencoresong tier_global = <tier_global> Tier = <Tier>
	SetGlobalTags Progression params = {aerosmith_encore_song = <song>}
	SetGlobalTags Progression params = {next_song_count = <song_count>}
	Change setlist_previous_song = <song_count>
	Change \{current_transition = preaerosmith}
	Progression_GetNumTierSong tier_global = <tier_global> Tier = <Tier>
	song_count = 0
	current_tier_global = <tier_global>
	begin
	Progression_GetTierSong tier_global = <current_tier_global> Tier = <Tier> song_count = <song_count>
	Progression_UnlockSong tier_global = <current_tier_global> song = <song> aerosmith = 1
	get_progression_globals \{game_mode = p1_quickplay}
	Progression_UnlockSong tier_global = <tier_global> song = <song>
	get_progression_globals \{game_mode = p2_quickplay}
	Progression_UnlockSong tier_global = <tier_global> song = <song>
	song_count = (<song_count> + 1)
	repeat <tier_size>
	get_progression_globals \{game_mode = p1_quickplay}
	Progression_UnlockSong tier_global = <tier_global> song = <song>
	get_progression_globals \{game_mode = p2_quickplay}
	Progression_UnlockSong tier_global = <tier_global> song = <song>
endscript

script Progression_TierEncoreUnlock 
	printf \{"Progression_TierEncoreUnlock"}
	get_progression_globals game_mode = ($game_mode)
	Progression_GetEncoreSong tier_global = <tier_global> Tier = <Tier>
	SetGlobalTags Progression params = {encore_song = <song>}
	SetGlobalTags Progression params = {next_tier = <Tier>}
	SetGlobalTags Progression params = {next_song_count = <song_count>}
	Change setlist_previous_tier = <Tier>
	Change setlist_previous_song = <song_count>
	Change \{current_transition = preencore}
	Progression_UnlockSong tier_global = <tier_global> song = <song> ENCORE = 1
	get_progression_globals \{game_mode = p1_quickplay}
	Progression_UnlockSong tier_global = <tier_global> song = <song>
	get_progression_globals \{game_mode = p2_quickplay}
	Progression_UnlockSong tier_global = <tier_global> song = <song>
	update_coop_progression
endscript

script Progression_TierEncoreComplete 
	printf \{"Progression_TierEncoreComplete"}
	Change \{progression_play_completion_movie = 1}
	Change progression_completion_tier = <Tier>
endscript

script Progression_TierBossUnlock 
	printf \{"Progression_TierBossUnlock"}
	get_progression_globals game_mode = ($game_mode)
	Progression_GetBossSong tier_global = <tier_global> Tier = <Tier>
	SetGlobalTags Progression params = {boss_song = <song>}
	SetGlobalTags Progression params = {next_tier = <Tier>}
	SetGlobalTags Progression params = {next_song_count = <song_count>}
	Change setlist_previous_tier = <Tier>
	Change setlist_previous_song = <song_count>
	Change \{current_transition = preboss}
	Progression_UnlockSong tier_global = <tier_global> song = <song> boss = 1
endscript

script Progression_TierBossComplete 
	printf \{"Progression_TierBossComplete"}
endscript

script Progression_TierComplete 
	printf \{"Progression_TierComplete"}
	if GotParam \{Bonus}
		get_progression_globals game_mode = ($game_mode) Bonus
	else
		get_progression_globals game_mode = ($game_mode)
	endif
	setlist_prefix = ($<tier_global>.prefix)
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
	SetGlobalTags <tiername> params = {complete = 1}
	if GotParam \{finished_game}
		printf \{"FINISHED GAME"}
		Change \{end_credits = 0}
		if NOT ($progression_beat_game_last_song = 1)
			Change \{end_credits = 1}
			formatText \{checksumName = bonus_song_checksum
				'%p_song%i_tier%s'
				p = 'bonus'
				i = 3
				s = 1}
			SetGlobalTags <bonus_song_checksum> params = {unlocked = 1}
			SetGlobalTags ($GH3_Bonus_Songs.tier1.songs [2]) params = {unlocked = 1}
		endif
		Change \{progression_beat_game_last_song = 1}
		get_difficulty_text_nl difficulty = ($current_difficulty)
		formatText checksumName = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl>
		SetGlobalTags <gametype_checksum> params = {complete = 1}
		if ($game_mode = p1_career)
			formatText checksumName = bandname_id 'band%i_info_%g' i = ($current_band) g = 'p1_career'
			formatText checksumName = hendrix_checksum 'hendrix_achievement_%s' s = <difficulty_text_nl>
			GetGlobalTags <bandname_id> param = <hendrix_checksum>
			if ((<...>.<hendrix_checksum>) = 0)
				SetGlobalTags \{achievement_info
					params = {
						hendrix_achievement_lefty_off = 1
					}}
			elseif ((<...>.<hendrix_checksum>) = 1)
				SetGlobalTags \{achievement_info
					params = {
						hendrix_achievement_lefty_on = 1
					}}
			endif
			if ($current_difficulty = hard || $current_difficulty = expert)
				if NOT IsGuitarController controller = ($player1_status.controller)
					WriteAchievements \{achievement = BUY_A_GUITAR_ALREADY}
				endif
			endif
		endif
	elseif GotParam \{Bonus}
		get_difficulty_text_nl difficulty = ($current_difficulty)
		formatText checksumName = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl>
		SetGlobalTags <gametype_checksum> params = {complete = 1}
	else
		Tier = (<Tier> + 1)
		Progression_UnlockTier Tier = <Tier>
		formatText checksumName = tiername 'tier%i' i = <Tier>
		Progression_UnlockVenue level_checksum = ($<tier_global>.<tiername>.level)
	endif
	update_coop_progression
endscript

script Progression_UnlockVenue 
	get_current_band_checksum
	final_checksum = <band_checksum>
	ExtendCrc <final_checksum> ($LevelZones.<level_checksum>.Name) out = final_checksum
	SetGlobalTags <final_checksum> params = {unlocked = 1}
	formatText checksumName = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.Name)
	SetGlobalTags <venue_checksum> params = {unlocked = 1}
endscript

script Progression_UnlockTier 
	get_progression_globals game_mode = ($game_mode)
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	Change \{progression_unlock_tier_last_song = 1}
	Change current_level = ($<tier_global>.<tier_checksum>.level)
	Change setlist_previous_tier = <Tier>
	Change \{setlist_previous_song = 0}
	formatText checksumName = old_tier_checksum 'tier%s' s = (<Tier> - 1)
	Change previous_level = ($<tier_global>.<old_tier_checksum>.level)
	Progression_GetNumTierSong tier_global = <tier_global> Tier = <Tier>
	song_count = 0
	current_tier_global = <tier_global>
	begin
	Progression_GetTierSong tier_global = <current_tier_global> Tier = <Tier> song_count = <song_count>
	Progression_UnlockSong tier_global = <current_tier_global> song = <song>
	get_progression_globals \{game_mode = p1_quickplay}
	Progression_UnlockSong tier_global = <tier_global> song = <song>
	get_progression_globals \{game_mode = p2_quickplay}
	Progression_UnlockSong tier_global = <tier_global> song = <song>
	song_count = (<song_count> + 1)
	repeat 2
	if GotParam \{complete}
		get_progression_globals game_mode = ($game_mode)
		setlist_prefix = ($<tier_global>.prefix)
		formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
		SetGlobalTags <tiername> params = {complete = 1}
	endif
endscript

script progression_checkintrosongscomplete 
	printf \{"Progression_CheckIntroSongsComplete"}
	get_progression_globals game_mode = ($game_mode)
	SongList = <tier_global>
	setlist_prefix = (<SongList>.prefix)
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	GetArraySize (<SongList>.<tier_checksum>.songs)
	<songs_required> = 2
	array_count = 0
	begin
	formatText {
		checksumName = song_checksum
		'%p_song%i_tier%s'
		p = <setlist_prefix>
		i = (<array_count> + 1)
		s = <Tier>
		AddToStringLookup = true
	}
	GetGlobalTags <song_checksum> param = stars
	if (<stars> > 2)
		songs_required = (<songs_required> - 1)
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	SetGlobalTags <tiername> params = {num_intro_songs_to_progress = <songs_required>}
	if (<songs_required> > 0)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script Progression_CheckSongComplete 
	printf \{"Progression_CheckSongComplete"}
	if GotParam \{Bonus}
		get_progression_globals game_mode = ($game_mode) Bonus
	else
		get_progression_globals game_mode = ($game_mode)
	endif
	SongList = <tier_global>
	Progression_GetDifficulty
	Progression_GetNumTierSong Tier = <Tier> tier_global = <tier_global>
	<songs_required> = <tier_size>
	setlist_prefix = (<SongList>.prefix)
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	GetArraySize (<SongList>.<tier_checksum>.songs)
	array_count = 0
	begin
	formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<array_count> + 1) s = <Tier> AddToStringLookup = true
	GetGlobalTags <song_checksum> param = stars
	RemoveParameter \{boss}
	if (<Tier> = 6)
		GetGlobalTags <song_checksum> param = boss noassert = 1
	endif
	if NOT GotParam \{boss}
		if (<stars> > 2)
			songs_required = (<songs_required> - 1)
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	SetGlobalTags <tiername> params = {num_songs_to_progress = <songs_required>}
	if (<songs_required> > 0)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script Progression_CheckEncoreComplete 
	printf \{"Progression_CheckEncoreComplete"}
	get_progression_globals game_mode = ($game_mode)
	Progression_GetEncoreSong tier_global = <tier_global> Tier = <Tier>
	GetGlobalTags <song_checksum> param = stars
	if (<stars> > 2)
		return \{true}
	endif
	return \{FALSE}
endscript

script Progression_CheckBossComplete 
	printf \{"Progression_CheckBossComplete"}
	get_progression_globals game_mode = ($game_mode)
	Progression_GetBossSong tier_global = <tier_global> Tier = <Tier>
	GetGlobalTags <song_checksum> param = stars
	if (<stars> > 2)
		return \{true}
	endif
	return \{FALSE}
endscript

script Progression_CheckSong5Star 
	printf \{"Progression_CheckSong5Star"}
	get_progression_globals game_mode = ($game_mode)
	SongList = <tier_global>
	Tier = 1
	begin
	setlist_prefix = (<SongList>.prefix)
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	GetArraySize (<SongList>.<tier_checksum>.songs)
	GetGlobalTags <tiername> param = unlocked
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	array_count = 0
	begin
	formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<array_count> + 1) s = <Tier> AddToStringLookup = true
	GetGlobalTags <song_checksum> param = unlocked
	GetGlobalTags <song_checksum> param = stars
	if NOT Progression_IsBossSong tier_global = <tier_global> Tier = <Tier> song = (<SongList>.<tier_checksum>.songs [<array_count>])
		if NOT (<stars> = 5)
			return \{FALSE}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat (<SongList>.num_tiers)
	return \{true}
endscript

script Progression_CheckAllSongsCompleted 
	printf \{"Progression_CheckAllSongsCompleted"}
	get_progression_globals game_mode = ($game_mode)
	SongList = <tier_global>
	Tier = 1
	begin
	setlist_prefix = (<SongList>.prefix)
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	GetArraySize (<SongList>.<tier_checksum>.songs)
	GetGlobalTags <tiername> param = unlocked
	if (<unlocked> = 0)
		return \{FALSE}
	endif
	array_count = 0
	begin
	formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<array_count> + 1) s = <Tier> AddToStringLookup = true
	GetGlobalTags <song_checksum> param = unlocked
	GetGlobalTags <song_checksum> param = stars
	if NOT (<stars> > 2)
		return \{FALSE}
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat (<SongList>.num_tiers)
	return \{true}
endscript

script Progression_AlwaysBlock 
	printf \{"Progression_AlwaysBlock"}
	return \{FALSE}
endscript

script Progression_CheckDiff 
	printf \{"Progression_CheckDiff"}
	Progression_GetDifficulty
	if NOT (<diff> = <difficulty>)
		return \{FALSE}
	endif
	if GotParam \{mode}
		if NOT ($game_mode = <mode>)
			return \{FALSE}
		endif
	endif
	return \{true}
endscript

script Progression_UnlockGuitar 
	printf \{"Progression_UnlockGuitar"}
	if GotParam \{guitar}
		SetGlobalTags ($Secret_Guitars [(<guitar> - 1)].id) params = {unlocked_for_purchase = 1}
		if ($progression_unlocked_guitar = -1)
			Change progression_unlocked_guitar = ($Secret_Guitars [(<guitar> - 1)].id)
		else
			Change progression_unlocked_guitar2 = ($Secret_Guitars [(<guitar> - 1)].id)
		endif
		Change \{progression_unlocked_type = guitar}
	else
		script_assert \{"tried to unlock a bass"}
	endif
endscript

script Progression_SongFailed 
	printf \{"Progression_SongFailed"}
	if ($coop_dlc_active = 1)
		return
	endif
	if ($game_mode = p1_career)
		UpdateAtoms \{Name = Progression}
	endif
	Change \{Achievements_SongWonFlag = 0}
	UpdateAtoms \{Name = achievement}
endscript

script Progression_SongWon 
	printf \{"Progression_SongWon"}
	additional_cash = 0
	Change \{progression_beat_game_last_song = 0}
	Change \{progression_unlock_tier_last_song = 0}
	Change \{progression_play_completion_movie = 0}
	Player = 1
	begin
	formatText checksumName = player_status 'player%i_status' i = <Player>
	new_stars = 3
	if ($<player_status>.score >= $<player_status>.base_score * 2.8)
		new_stars = 5
	elseif ($<player_status>.score >= $<player_status>.base_score * 2)
		new_stars = 4
	endif
	Change structurename = <player_status> stars = <new_stars>
	Player = (<Player> + 1)
	repeat $current_num_players
	if ($coop_dlc_active = 1)
		if ($player1_status.total_notes = $player1_status.notes_hit)
			if NOT ($player1_status.total_notes = 0)
				WriteAchievements \{achievement = LEADERS_OF_THE_PACK}
			endif
		endif
		return
	endif
	if ($game_mode = p2_quickplay)
		get_difficulty_text_nl difficulty = ($current_difficulty_coop)
	else
		get_difficulty_text_nl difficulty = ($current_difficulty)
	endif
	get_song_prefix song = ($current_song)
	get_formatted_songname song_prefix = (<song_prefix>) difficulty_text_nl = <difficulty_text_nl>
	if ($player1_status.total_notes > 0)
		p1_percent_complete = (100 * $player1_status.notes_hit / $player1_status.total_notes)
		if (<p1_percent_complete> = 100)
			if ($game_mode = p1_quickplay)
				SetGlobalTags <songname> params = {percent100 = 1}
			elseif ($game_mode = p2_quickplay)
				p2_percent_complete = (100 * $player2_status.notes_hit / $player2_status.total_notes)
				if (<p2_percent_complete> = 100)
					SetGlobalTags <songname> params = {percent100 = 1}
				endif
			endif
			if ($game_mode = p1_quickplay ||
					$game_mode = p1_career)
				SetGlobalTags <songname> params = {achievement_gold_star = 1}
			endif
		endif
	endif
	if ($game_mode = p1_career)
		get_progression_globals game_mode = ($game_mode) use_current_tab = 1
		SongList = <tier_global>
		get_band_game_mode_name
		formatText checksumName = bandname_id 'band%i_info_%g' i = ($current_band) g = <game_mode_name>
		SetGlobalTags <bandname_id> params = {first_play = 0}
		GetGlobalTags \{Progression
			params = current_tier}
		GetGlobalTags \{Progression
			params = current_song_count}
		song_count = <current_song_count>
		if GotParam \{current_tier}
			setlist_prefix = ($<SongList>.prefix)
			formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <current_tier> AddToStringLookup = true
			formatText checksumName = tier_checksum 'tier%s' s = <current_tier>
			if Progression_IsBossSong tier_global = <tier_global> Tier = <current_tier> song = (<tier_global>.<tier_checksum>.songs [<song_count>])
				Change \{structurename = player1_status
					stars = 5}
			endif
			GetGlobalTags <song_checksum> param = stars
			GetGlobalTags <song_checksum> param = score
			if NOT ($end_credits = 1)
				if ($game_mode = p1_career)
					new_score = ($player1_status.score)
					new_stars = ($player1_status.stars)
				endif
				if ($player1_status.total_notes > 0)
					p1_percent_complete = (100 * $player1_status.notes_hit / $player1_status.total_notes)
					if (<p1_percent_complete> = 100)
						SetGlobalTags <song_checksum> params = {percent100 = 1}
						SetGlobalTags <songname> params = {percent100 = 1}
					endif
				endif
				if (<new_stars> > <stars>)
					SetGlobalTags <song_checksum> params = {stars = <new_stars>}
					if ($current_tab = tab_setlist)
						if NOT StructureContains structure = (<tier_global>.<tier_checksum>) nocash
							Progression_AwardCash old_stars = <stars> new_stars = <new_stars>
						endif
					endif
				endif
				if (<new_score> > <score>)
					CastToInteger \{new_score}
					SetGlobalTags <song_checksum> params = {score = <new_score>}
				endif
			endif
			Progression_CalcSetlistNextSong tier_global = <tier_global>
		endif
	endif
	Achievements_SongWon additional_cash = <additional_cash>
	if ($game_mode = p1_career)
		UpdateAtoms \{Name = Progression}
	endif
	Change \{Achievements_SongWonFlag = 1}
	UpdateAtoms \{Name = achievement}
endscript
end_credits = 0
boss_devil_score = 0

script Progression_EndCredits 
	printf \{"CREDITS BEGIN"}
	Change boss_devil_score = ($player1_status.score)
	Change \{current_level = load_z_credits}
	ui_flow_manager_respond_to_action \{action = select_retry}
	Change \{current_song = kingsandqueenscredits}
	create_loading_screen
	Load_Venue
	restart_gem_scroller song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = 0 end_credits_restart = 1
	destroy_loading_screen
	start_flow_manager \{flow_state = career_play_song_fs}
	SpawnScriptNow \{scrolling_list_begin}
endscript

script Progression_EndCredits_Done 
	if ($end_credits = 1)
		Change \{boss_devil_score = 0}
	endif
	destroy_credits_menu
endscript

script PlayMovie_EndCredits 
	killallmovies
	PreLoadMovie \{movie = 'Fret_Flames'
		textureSlot = 1
		TexturePri = -2
		no_loop
		no_hold}
	begin
	if (isMoviePreLoaded textureSlot = 1)
		StartPreLoadedMovie \{textureSlot = 1}
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script Progression_CalcSetlistNextSong 
	if ($current_tab = tab_setlist)
		setlist_prefix = ($<tier_global>.prefix)
		num_tiers = ($<tier_global>.num_tiers)
		Tier = 1
		begin
		formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
		GetGlobalTags <tiername> param = unlocked
		if (<unlocked> = 0)
			Tier = (<Tier> - 1)
			break
		endif
		Tier = (<Tier> + 1)
		repeat <num_tiers>
		if (<Tier> > <num_tiers>)
			Tier = <num_tiers>
		endif
		found = 0
		Progression_GetBossSong tier_global = <tier_global> Tier = <Tier>
		if (<song_count> = -1 && found = 0)
			formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <Tier> AddToStringLookup = true
			GetGlobalTags <song_checksum> param = unlocked
			if (<unlocked> = 1)
				found = 1
			endif
		endif
		Progression_GetEncoreSong tier_global = <tier_global> Tier = <Tier>
		if (<song_count> = -1 && found = 0)
			formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <Tier> AddToStringLookup = true
			GetGlobalTags <song_checksum> param = unlocked
			if (<unlocked> = 1)
				found = 1
			endif
		endif
		if (<found> = 0)
			formatText checksumName = tier_checksum 'tier%s' s = <Tier>
			GetArraySize (<tier_global>.<tier_checksum>.songs)
			song_count = 0
			begin
			formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <Tier> AddToStringLookup = true
			GetGlobalTags <song_checksum> param = stars
			GetGlobalTags <song_checksum> param = unlocked
			if (<stars> < 3 && <unlocked> = 1)
				found = 1
				break
			endif
			song_count = (<song_count> + 1)
			repeat <array_Size>
		endif
		if (<found> = 1)
			Change setlist_previous_tier = <Tier>
			Change setlist_previous_song = <song_count>
		endif
	endif
endscript

script Progression_AwardCash 
	printf \{"Progression_AwardCash"}
	cash = -1
	if ($end_credits = 1)
		return \{additional_cash = 0}
	endif
	GetArraySize \{$Cash_System_rules}
	array_count = 0
	begin
	Progression_GetDifficulty
	if (<difficulty> = $Cash_System_rules [<array_count>].diff)
		if (<new_stars> = $Cash_System_rules [<array_count>].newstars)
			if (<old_stars> = $Cash_System_rules [<array_count>].oldstars)
				cash = ($Cash_System_rules [<array_count>].cash)
			endif
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	if (<new_stars> = <old_stars>)
		cash = 0
	endif
	if (<cash> = -1)
		printstruct <...>
		ScriptAssert \{"Cash Rules not found"}
	endif
	Change structurename = player1_status new_cash = (<cash> + $player1_status.new_cash)
	additional_cash = <cash>
	get_current_band_info
	GetGlobalTags <band_info>
	<cash> = (<cash> + <additional_cash>)
	SetGlobalTags <band_info> params = {cash = <cash>}
	printf "cash = %d" d = <cash>
	return additional_cash = <additional_cash>
endscript

script Progression_CountCompletedSongsInCurrentTier 
	completed_songs = 0
	get_progression_globals game_mode = ($game_mode)
	if NOT (<tier_global> = 0 || $setlist_selection_tier = 0)
		Progression_GetNumTierSong tier_global = <tier_global> Tier = ($setlist_selection_tier) all
		song_count = 0
		begin
		Progression_GetTierSong tier_global = <tier_global> Tier = ($setlist_selection_tier) song_count = <song_count>
		GetGlobalTags <song_checksum> param = stars
		RemoveParameter \{boss}
		if ($setlist_selection_tier = 6)
			GetGlobalTags <song_checksum> param = boss noassert = 1
		endif
		if NOT GotParam \{boss}
			if NOT (<stars> = 0)
				completed_songs = (<completed_songs> + 1)
			endif
		endif
		song_count = (<song_count> + 1)
		repeat <tier_size>
	endif
	return {completed_songs = <completed_songs>}
endscript

script Progression_GetNumTierSong 
	printf \{"Progression_GetNumTierSong"}
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	if GotParam \{all}
		return tier_size = <array_Size>
	endif
	if StructureContains structure = ($<tier_global>.<tier_checksum>) encorep1
		array_Size = (<array_Size> - 1)
	endif
	if StructureContains structure = ($<tier_global>.<tier_checksum>) encorep2
		array_Size = (<array_Size> - 1)
	endif
	if StructureContains structure = ($<tier_global>.<tier_checksum>) boss
	endif
	return tier_size = <array_Size>
endscript

script Progression_GetTierSong 
	printf \{"Progression_GetTierSong"}
	setlist_prefix = ($<tier_global>.prefix)
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <Tier>
	song = ($<tier_global>.<tier_checksum>.songs [<song_count>])
	return song = <song> song_checksum = <song_checksum>
endscript

script Progression_GetBossSong 
	printf \{"Progression_GetBossSong"}
	setlist_prefix = ($<tier_global>.prefix)
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	if StructureContains structure = ($<tier_global>.<tier_checksum>) boss
		formatText checksumName = song_checksum '%p_song3_tier%s' p = <setlist_prefix> s = <Tier>
		return song_count = 2 song = bossjoe song_checksum = <song_checksum>
	else
		return \{song_count = -1
			song = None
			song_checksum = None}
	endif
endscript

script Progression_GetEncoreSong \{Type = any}
	printf \{"Progression_GetEncoreSong"}
	setlist_prefix = ($<tier_global>.prefix)
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	if (<Type> = any)
		if NOT StructureContains structure = ($<tier_global>.<tier_checksum>) encorep1
			if NOT StructureContains structure = ($<tier_global>.<tier_checksum>) encorep2
				return \{song_count = -1
					song = None
					song_checksum = None}
			endif
		endif
	endif
	if (<Type> = p1)
		if NOT StructureContains structure = ($<tier_global>.<tier_checksum>) encorep1
			return \{song_count = -1
				song = None
				song_checksum = None}
		endif
	endif
	if (<Type> = p2)
		if NOT StructureContains structure = ($<tier_global>.<tier_checksum>) encorep2
			return \{song_count = -1
				song = None
				song_checksum = None}
		endif
	endif
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = (<array_Size> - 1)
	if (<Type> = p1)
		if StructureContains structure = ($<tier_global>.<tier_checksum>) encorep2
			array_count = (<array_count> - 1)
		endif
	endif
	formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<array_count> + 1) s = <Tier>
	song = ($<tier_global>.<tier_checksum>.songs [<array_count>])
	return song_count = <array_count> song = <song> song_checksum = <song_checksum>
endscript

script progression_getaerosmithencoresong \{Type = any}
	printf \{"Progression_GetAerosmithEncoreSong"}
	setlist_prefix = ($<tier_global>.prefix)
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	if (<Type> = any)
		if NOT StructureContains structure = ($<tier_global>.<tier_checksum>) aerosmith_encore_p1
			if NOT StructureContains structure = ($<tier_global>.<tier_checksum>) aerosmith_encore_p2
				return \{song_count = -1
					song = None
					song_checksum = None}
			endif
		endif
	endif
	if (<Type> = p1)
		if NOT StructureContains structure = ($<tier_global>.<tier_checksum>) aerosmith_encore_p1
			return \{song_count = -1
				song = None
				song_checksum = None}
		endif
	endif
	if (<Type> = p2)
		if NOT StructureContains structure = ($<tier_global>.<tier_checksum>) aerosmith_encore_p2
			return \{song_count = -1
				song = None
				song_checksum = None}
		endif
	endif
	if (<Tier> = 6)
		<song_num> = 3
	else
		<song_num> = 2
	endif
	formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_num> + 1) s = <Tier>
	song = ($<tier_global>.<tier_checksum>.songs [<song_num>])
	return song_count = <song_num> song = <song> song_checksum = <song_checksum>
endscript

script Progression_IsBossSong 
	if NOT GotParam \{Tier}
		return \{FALSE}
	endif
	query_song = <song>
	Progression_GetBossSong <...>
	if (<song> = <query_song>)
		return \{true}
	endif
	return \{FALSE}
endscript

script Progression_IsEncoreSong 
	query_song = <song>
	Progression_GetEncoreSong <...> Type = p1
	printstruct <...>
	if (<song> = <query_song>)
		return \{true}
	endif
	Progression_GetEncoreSong <...> Type = p2
	printstruct <...>
	if (<song> = <query_song>)
		return \{true}
	endif
	return \{FALSE}
endscript

script progression_isfirstaerosmithsong 
	printf \{"Progression_IsFirstAerosmithSong"}
	get_progression_globals game_mode = ($game_mode)
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	<index> = 0
	begin
	if (($<tier_global>.<tier_checksum>.songs [<index>]) = <song>)
		break
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	if (<index> = 2)
		return \{true}
	endif
	return \{FALSE}
endscript

script Progression_UnlockSong \{ENCORE = 0
		boss = 0
		unlocked = 0
		aerosmith = 0}
	printf \{"Progression_UnlockSong"}
	setlist_prefix = ($<tier_global>.prefix)
	Tier = 1
	begin
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = 0
	begin
	if ($<tier_global>.<tier_checksum>.songs [<array_count>] = <song>)
		formatText checksumName = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<array_count> + 1) s = <Tier>
		SetGlobalTags <song_checksum> params = {unlocked = 1}
		if ($current_song = bossjoe)
			formatText \{checksumName = bonus_song_checksum
				'%p_song%i_tier%s'
				p = 'bonus'
				i = 11
				s = 1}
			SetGlobalTags <bonus_song_checksum> params = {unlocked = 1}
			SetGlobalTags ($GH3_Bonus_Songs.tier1.songs [10]) params = {unlocked = 1}
		endif
		if (<ENCORE> = 1)
			SetGlobalTags <tiername> params = {encore_unlocked = 1}
		elseif (<boss> = 1)
			SetGlobalTags <tiername> params = {boss_unlocked = 1}
		elseif (<aerosmith> = 1)
			SetGlobalTags <tiername> params = {aerosmith_unlocked = 1}
		endif
		SetGlobalTags <tiername> params = {unlocked = 1}
	endif
	array_count = (<array_count> + 1)
	repeat <array_Size>
	Tier = (<Tier> + 1)
	repeat ($<tier_global>.num_tiers)
endscript

script Progression_GetDifficulty 
	difficulty = ($current_difficulty)
	return difficulty = <difficulty>
endscript

script Progression_SetProgressionNodeFlags 
	if ($coop_dlc_active = 1)
		Change \{game_mode = p2_career}
	endif
	ChangeNodeFlag \{LS_ALWAYS
		1}
	if GotParam \{perry_mic_stand}
		printf "=== LS_PERRY_MIC: %d" d = <perry_mic_stand>
		ChangeNodeFlag ls_perry_mic <perry_mic_stand>
	endif
	ls_encore = 0
	ls_3_5 = 0
	get_progression_globals game_mode = ($game_mode)
	Tier = ($setlist_selection_tier)
	if ($game_mode = p1_career)
		if Progression_IsEncoreSong tier_global = <tier_global> Tier = <Tier> song = ($current_song)
			ls_encore = 1
		endif
	endif
	get_song_struct song = ($current_song)
	if StructureContains structure = <song_struct> Name = guitarist_checksum
		if (<song_struct>.guitarist_checksum = aerosmith)
			ls_3_5 = 1
		endif
	endif
	printf "Progression_SetProgressionNodeFlags encore = %d 3_5 = %i" d = <ls_encore> i = <ls_3_5>
	if (<ls_encore> = 1)
		ChangeNodeFlag \{LS_3_5_PRE
			0}
		ChangeNodeFlag \{LS_3_5_POST
			1}
		ChangeNodeFlag \{LS_ENCORE_PRE
			0}
		ChangeNodeFlag \{LS_ENCORE_POST
			1}
	elseif (<ls_3_5> = 1)
		ChangeNodeFlag \{LS_3_5_PRE
			0}
		ChangeNodeFlag \{LS_3_5_POST
			1}
		ChangeNodeFlag \{LS_ENCORE_PRE
			1}
		ChangeNodeFlag \{LS_ENCORE_POST
			0}
	else
		ChangeNodeFlag \{LS_3_5_PRE
			1}
		ChangeNodeFlag \{LS_3_5_POST
			0}
		ChangeNodeFlag \{LS_ENCORE_PRE
			1}
		ChangeNodeFlag \{LS_ENCORE_POST
			0}
	endif
	GetPakManCurrentName \{map = zones}
	if GotParam \{pakname}
		formatText checksumName = zone_setup '%s_SetupNodeflags' s = <pakname>
		if ScriptExists <zone_setup>
			SpawnScriptNow <zone_setup>
		endif
	endif
endscript
P1_career_progression = {
	tier_global = GH3_Career_Songs
	progression_global = GH3_Career_Progression
}
Bonus_progression = {
	tier_global = GH3_Bonus_Songs
	progression_global = None
}
Download_progression = {
	tier_global = GH3_Download_Songs
	progression_global = None
}
General_progression = {
	tier_global = GH3_General_Songs
	progression_global = None
}
Demo_progression_Career = {
	tier_global = GH3_Demo_Songs_Career
	progression_global = None
}
Demo_progression_Coop = {
	tier_global = GH3_Demo_Songs_Coop
	progression_global = None
}
Demo_progression_Multiplayer = {
	tier_global = GH3_Demo_Songs_Multiplayer
	progression_global = None
}
Demo_progression_Quickplay = {
	tier_global = GH3_Demo_Songs_Quickplay
	progression_global = None
}

script get_progression_globals game_mode = <game_mode> use_current_tab = 0
	if (<use_current_tab> = 1)
		if ($current_tab = tab_bonus)
			Bonus = 1
		elseif ($current_tab = tab_downloads)
			download = 1
		endif
	endif
	if ($is_demo_mode = 1)
		if GotParam \{Bonus}
			AddParams ($Bonus_progression)
		elseif GotParam \{download}
			AddParams ($Download_progression)
		elseif (<game_mode> = p1_career)
			AddParams ($Demo_progression_Career)
		elseif (<game_mode> = p1_quickplay)
			AddParams ($Demo_progression_Quickplay)
		elseif (<game_mode> = p2_quickplay)
			AddParams ($Demo_progression_Coop)
		else
			AddParams ($Demo_progression_Multiplayer)
		endif
		return tier_global = <tier_global> progression_global = <progression_global>
	endif
	if GotParam \{Bonus}
		AddParams ($Bonus_progression)
	elseif GotParam \{download}
		AddParams ($Download_progression)
	elseif (<game_mode> = p1_career)
		AddParams ($P1_career_progression)
	elseif (<game_mode> = p1_quickplay)
		AddParams ($General_progression)
	elseif (<game_mode> = p2_quickplay)
		AddParams ($General_progression)
	elseif (<game_mode> = p2_coop)
		AddParams ($General_progression)
	else
		AddParams ($General_progression)
	endif
	return tier_global = <tier_global> progression_global = <progression_global>
endscript

script update_coop_progression 
	printf \{"update_coop_progression"}
	<Tier> = 1
	begin
	get_progression_globals \{game_mode = p2_quickplay}
	SongList = <tier_global>
	setlist_prefix = (<SongList>.prefix)
	formatText checksumName = tiername '%ptier%i' p = <setlist_prefix> i = <Tier>
	formatText checksumName = tier_checksum 'tier%s' s = <Tier>
	<songs_required> = 4
	array_count = 0
	begin
	get_song_prefix song = ((<tier_global>.<tier_checksum>).songs [<array_count>])
	get_quickplay_song_stars song = <song_prefix>
	if (<stars> > 2)
		songs_required = (<songs_required> - 1)
	endif
	array_count = (<array_count> + 1)
	repeat 4
	if (<songs_required> <= 0)
		Progression_GetEncoreSong tier_global = <tier_global> Tier = <Tier>
		get_progression_globals \{game_mode = p2_quickplay}
		Progression_UnlockSong tier_global = <tier_global> song = <song>
	endif
	get_song_prefix song = ((<tier_global>).<tier_checksum>.songs [4])
	get_quickplay_song_stars song = <song_prefix>
	if (<stars> > 2)
		if (<Tier> < 6)
			<next_tier> = (<Tier> + 1)
			Progression_GetNumTierSong tier_global = <tier_global> Tier = <next_tier>
			<song_count> = 0
			<current_tier_global> = <tier_global>
			formatText checksumName = next_tier_checksum 'tier%s' s = <next_tier>
			<next_level_checksum> = ($<tier_global>.<next_tier_checksum>.level)
			formatText checksumName = next_venue_checksum 'venue_%s' s = ($LevelZones.<next_level_checksum>.Name)
			GetGlobalTags <next_venue_checksum> param = unlocked
			if (<unlocked> = 0)
				SetGlobalTags <next_venue_checksum> params = {unlocked = 1}
				if ($game_mode = p2_quickplay)
					Change current_level = <next_level_checksum>
					Change g_last_venue_selected = <next_level_checksum>
				endif
			endif
			begin
			Progression_GetTierSong {
				tier_global = <current_tier_global>
				Tier = <next_tier>
				song_count = <song_count>
			}
			get_progression_globals \{game_mode = p2_quickplay}
			Progression_UnlockSong tier_global = <tier_global> song = <song>
			<song_count> = (<song_count> + 1)
			repeat 4
		endif
	endif
	<Tier> = (<Tier> + 1)
	repeat 6
	UpdateAtoms \{Name = achievement}
endscript
