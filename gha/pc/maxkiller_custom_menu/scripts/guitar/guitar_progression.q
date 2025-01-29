progression_beat_game_last_song = 0
progression_unlock_tier_last_song = 0
progression_play_completion_movie = 0
progression_completion_tier = 1
progression_unlocked_guitar = -1
progression_unlocked_guitar2 = -1
progression_unlocked_type = guitar
gh3_career_songs = {
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
gh3_general_songs = {
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
gh3_career_numsongtoprogress = {
	easy = 3
	medium = 3
	hard = 4
	expert = 4
	bonus = 11
}
gh3_career_progression = [
	{
		name = set_initial_states
		type = scr
		atom_script = progression_init
		atom_params = {
		}
	}
	{
		name = career_tier1_intro_songscomplete
		type = scr
		atom_script = progression_tieraerosmithunlock
		atom_params = {
			tier = 1
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkintrosongscomplete
				params = {
					tier = 1
				}
			}
		]
	}
	{
		name = career_tier1_songscomplete
		type = scr
		atom_script = progression_tiersongscomplete
		atom_params = {
			tier = 1
		}
		depends_on = [
			{
				type = scr
				scr = progression_checksongcomplete
				params = {
					tier = 1
					numsongstoprogress = $gh3_career_numsongtoprogress
				}
			}
		]
	}
	{
		name = career_tier1_encoreunlock
		type = scr
		atom_script = progression_tierencoreunlock
		atom_params = {
			tier = 1
		}
		depends_on = [
			{
				type = atom
				atom = career_tier1_songscomplete
			}
			{
				type = scr
				scr = progression_alwaysblock
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
		name = career_tier1_encorecomplete
		type = scr
		atom_script = progression_tierencorecomplete
		atom_params = {
			tier = 1
		}
		depends_on = [
			{
				type = atom
				atom = career_tier1_encoreunlock
			}
			{
				type = scr
				scr = progression_checkencorecomplete
				params = {
					tier = 1
				}
			}
		]
	}
	{
		name = career_tier1_complete
		type = scr
		atom_script = progression_tiercomplete
		atom_params = {
			tier = 1
		}
		depends_on = [
			{
				type = atom
				atom = career_tier1_songscomplete
			}
			{
				type = atom
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
		name = career_tier2_intro_songscomplete
		type = scr
		atom_script = progression_tieraerosmithunlock
		atom_params = {
			tier = 2
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkintrosongscomplete
				params = {
					tier = 2
				}
			}
		]
	}
	{
		name = career_tier2_songscomplete
		type = scr
		atom_script = progression_tiersongscomplete
		atom_params = {
			tier = 2
		}
		depends_on = [
			{
				type = atom
				atom = career_tier1_complete
			}
			{
				type = scr
				scr = progression_checksongcomplete
				params = {
					tier = 2
					numsongstoprogress = $gh3_career_numsongtoprogress
				}
			}
		]
	}
	{
		name = career_tier2_encoreunlock
		type = scr
		atom_script = progression_tierencoreunlock
		atom_params = {
			tier = 2
		}
		depends_on = [
			{
				type = atom
				atom = career_tier2_songscomplete
			}
		]
	}
	{
		name = career_tier2_encorecomplete
		type = scr
		atom_script = progression_tierencorecomplete
		atom_params = {
			tier = 2
		}
		depends_on = [
			{
				type = atom
				atom = career_tier2_encoreunlock
			}
			{
				type = scr
				scr = progression_checkencorecomplete
				params = {
					tier = 2
				}
			}
		]
	}
	{
		name = career_tier2_complete
		type = scr
		atom_script = progression_tiercomplete
		atom_params = {
			tier = 2
		}
		depends_on = [
			{
				type = atom
				atom = career_tier2_songscomplete
			}
			{
				type = atom
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
		name = career_tier3_intro_songscomplete
		type = scr
		atom_script = progression_tieraerosmithunlock
		atom_params = {
			tier = 3
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkintrosongscomplete
				params = {
					tier = 3
				}
			}
		]
	}
	{
		name = career_tier3_songscomplete
		type = scr
		atom_script = progression_tiersongscomplete
		atom_params = {
			tier = 3
		}
		depends_on = [
			{
				type = atom
				atom = career_tier2_complete
			}
			{
				type = scr
				scr = progression_checksongcomplete
				params = {
					tier = 3
					numsongstoprogress = $gh3_career_numsongtoprogress
				}
			}
		]
	}
	{
		name = career_tier3_encoreunlock
		type = scr
		atom_script = progression_tierencoreunlock
		atom_params = {
			tier = 3
		}
		depends_on = [
			{
				type = atom
				atom = career_tier3_songscomplete
			}
			{
				type = scr
				scr = progression_alwaysblock
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
		name = career_tier3_encorecomplete
		type = scr
		atom_script = progression_tierencorecomplete
		atom_params = {
			tier = 3
		}
		depends_on = [
			{
				type = atom
				atom = career_tier3_encoreunlock
			}
			{
				type = scr
				scr = progression_checkencorecomplete
				params = {
					tier = 3
				}
			}
		]
	}
	{
		name = career_tier3_complete
		type = scr
		atom_script = progression_tiercomplete
		atom_params = {
			tier = 3
		}
		depends_on = [
			{
				type = atom
				atom = career_tier3_songscomplete
			}
			{
				type = atom
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
		name = career_tier4_intro_songscomplete
		type = scr
		atom_script = progression_tieraerosmithunlock
		atom_params = {
			tier = 4
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkintrosongscomplete
				params = {
					tier = 4
				}
			}
		]
	}
	{
		name = career_tier4_songscomplete
		type = scr
		atom_script = progression_tiersongscomplete
		atom_params = {
			tier = 4
		}
		depends_on = [
			{
				type = atom
				atom = career_tier3_complete
			}
			{
				type = scr
				scr = progression_checksongcomplete
				params = {
					tier = 4
					numsongstoprogress = $gh3_career_numsongtoprogress
				}
			}
		]
	}
	{
		name = career_tier4_encoreunlock
		type = scr
		atom_script = progression_tierencoreunlock
		atom_params = {
			tier = 4
		}
		depends_on = [
			{
				type = atom
				atom = career_tier4_songscomplete
			}
			{
				type = scr
				scr = progression_alwaysblock
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
		name = career_tier4_encorecomplete
		type = scr
		atom_script = progression_tierencorecomplete
		atom_params = {
			tier = 4
		}
		depends_on = [
			{
				type = atom
				atom = career_tier4_encoreunlock
			}
			{
				type = scr
				scr = progression_checkencorecomplete
				params = {
					tier = 4
				}
			}
		]
	}
	{
		name = career_tier4_complete
		type = scr
		atom_script = progression_tiercomplete
		atom_params = {
			tier = 4
		}
		depends_on = [
			{
				type = atom
				atom = career_tier4_songscomplete
			}
			{
				type = atom
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
		name = career_tier5_intro_songscomplete
		type = scr
		atom_script = progression_tieraerosmithunlock
		atom_params = {
			tier = 5
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkintrosongscomplete
				params = {
					tier = 5
				}
			}
		]
	}
	{
		name = career_tier5_songscomplete
		type = scr
		atom_script = progression_tiersongscomplete
		atom_params = {
			tier = 5
		}
		depends_on = [
			{
				type = atom
				atom = career_tier4_complete
			}
			{
				type = scr
				scr = progression_checksongcomplete
				params = {
					tier = 5
					numsongstoprogress = $gh3_career_numsongtoprogress
				}
			}
		]
	}
	{
		name = career_tier5_encoreunlock
		type = scr
		atom_script = progression_tierencoreunlock
		atom_params = {
			tier = 5
		}
		depends_on = [
			{
				type = atom
				atom = career_tier5_songscomplete
			}
		]
	}
	{
		name = career_tier5_encorecomplete
		type = scr
		atom_script = progression_tierencorecomplete
		atom_params = {
			tier = 5
		}
		depends_on = [
			{
				type = atom
				atom = career_tier5_encoreunlock
			}
			{
				type = scr
				scr = progression_checkencorecomplete
				params = {
					tier = 5
				}
			}
		]
	}
	{
		name = career_tier5_complete
		type = scr
		atom_script = progression_tiercomplete
		atom_params = {
			tier = 5
		}
		depends_on = [
			{
				type = atom
				atom = career_tier5_songscomplete
			}
			{
				type = atom
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
		name = career_tier6_bossunlock
		type = scr
		atom_script = progression_tierbossunlock
		atom_params = {
			tier = 6
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkintrosongscomplete
				params = {
					tier = 6
				}
			}
			{
				type = scr
				scr = progression_alwaysblock
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
		name = career_tier6_bosscomplete
		type = scr
		atom_script = progression_tierbosscomplete
		atom_params = {
			tier = 6
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_bossunlock
			}
			{
				type = scr
				scr = progression_checkbosscomplete
				params = {
					tier = 6
				}
			}
		]
	}
	{
		name = career_tier6_intro_songscomplete
		type = scr
		atom_script = progression_tieraerosmithunlock
		atom_params = {
			tier = 6
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_bosscomplete
			}
		]
	}
	{
		name = career_tier6_songscomplete
		type = scr
		atom_script = progression_tiersongscomplete
		atom_params = {
			tier = 6
		}
		depends_on = [
			{
				type = atom
				atom = career_tier5_complete
			}
			{
				type = atom
				atom = career_tier6_bosscomplete
			}
			{
				type = scr
				scr = progression_checksongcomplete
				params = {
					tier = 6
					numsongstoprogress = $gh3_career_numsongtoprogress
				}
			}
		]
	}
	{
		name = career_tier6_encoreunlock
		type = scr
		atom_script = progression_tierencoreunlock
		atom_params = {
			tier = 6
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_songscomplete
			}
			{
				type = scr
				scr = progression_alwaysblock
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
		name = career_tier6_encorecomplete
		type = scr
		atom_script = progression_tierencorecomplete
		atom_params = {
			tier = 6
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_encoreunlock
			}
			{
				type = scr
				scr = progression_checkencorecomplete
				params = {
					tier = 6
				}
			}
		]
	}
	{
		name = career_tier6_complete
		type = scr
		atom_script = progression_tiercomplete
		atom_params = {
			tier = 6
			finished_game
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_songscomplete
			}
			{
				type = atom
				atom = career_tier6_encorecomplete
				required = [
					1
					1
					1
					1
				]
			}
			{
				type = atom
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
		name = career_bonus_songs_complete
		type = scr
		atom_script = progression_tiercomplete
		atom_params = {
			tier = 1
			bonus
		}
		depends_on = [
			{
				type = scr
				scr = progression_checksongcomplete
				params = {
					tier = 1
					numsongstoprogress = $gh3_career_numsongtoprogress
					bonus
				}
			}
		]
	}
	{
		name = unlock_guitar1
		type = scr
		atom_script = progression_unlockguitar
		atom_params = {
			guitar = 1
			for_difficulty
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_complete
			}
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = easy
					mode = p1_career
				}
			}
		]
	}
	{
		name = unlock_guitar2
		type = scr
		atom_script = progression_unlockguitar
		atom_params = {
			guitar = 2
			for_stars
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = easy
					mode = p1_career
				}
			}
			{
				type = scr
				scr = progression_checksong5star
				params = {
				}
			}
		]
	}
	{
		name = unlock_guitar3
		type = scr
		atom_script = progression_unlockguitar
		atom_params = {
			guitar = 3
			for_difficulty
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_complete
			}
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = medium
					mode = p1_career
				}
			}
		]
	}
	{
		name = unlock_guitar4
		type = scr
		atom_script = progression_unlockguitar
		atom_params = {
			guitar = 4
			for_stars
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = medium
					mode = p1_career
				}
			}
			{
				type = scr
				scr = progression_checksong5star
				params = {
				}
			}
		]
	}
	{
		name = unlock_guitar5
		type = scr
		atom_script = progression_unlockguitar
		atom_params = {
			guitar = 5
			for_difficulty
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_complete
			}
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = hard
					mode = p1_career
				}
			}
		]
	}
	{
		name = unlock_guitar6
		type = scr
		atom_script = progression_unlockguitar
		atom_params = {
			guitar = 6
			for_stars
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = hard
					mode = p1_career
				}
			}
			{
				type = scr
				scr = progression_checksong5star
				params = {
				}
			}
		]
	}
	{
		name = unlock_guitar7
		type = scr
		atom_script = progression_unlockguitar
		atom_params = {
			guitar = 7
			for_difficulty
		}
		depends_on = [
			{
				type = atom
				atom = career_tier6_complete
			}
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = expert
					mode = p1_career
				}
			}
		]
	}
	{
		name = unlock_guitar8
		type = scr
		atom_script = progression_unlockguitar
		atom_params = {
			guitar = 8
			for_stars
		}
		depends_on = [
			{
				type = scr
				scr = progression_checkdiff
				params = {
					diff = expert
					mode = p1_career
				}
			}
			{
				type = scr
				scr = progression_checksong5star
				params = {
				}
			}
		]
	}
	{
		name = end_of_first_update
		type = scr
		atom_script = progression_endoffirstupdate
		atom_params = {
		}
	}
]
cash_system_rules = [
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

script progression_init 
	printf \{"Progression_Init"}
	tier = 0
	get_progression_globals game_mode = ($game_mode)
	if ($game_mode = p1_career)
		formattext checksumname = tiername 'tier%i' i = (<tier> + 1)
		change current_level = ($<tier_global>.<tiername>.level)
	endif
	change \{setlist_previous_tier = 1}
	change \{setlist_previous_song = 0}
	change \{setlist_previous_tab = tab_setlist}
endscript

script progression_endoffirstupdate 
	change \{end_credits = 0}
	change \{progression_beat_game_last_song = 0}
	change \{progression_unlock_tier_last_song = 0}
	change \{progression_play_completion_movie = 0}
	change \{progression_unlocked_guitar = -1}
	change \{progression_unlocked_guitar2 = -1}
	change \{progression_unlocked_type = guitar}
endscript

script progression_tiersongscomplete 
	printf \{"Progression_TierSongsComplete"}
endscript

script progression_tieraerosmithunlock 
	printf \{"Progression_TierAerosmithUnlock"}
	get_progression_globals game_mode = ($game_mode)
	progression_getaerosmithencoresong tier_global = <tier_global> tier = <tier>
	setglobaltags progression params = {aerosmith_encore_song = <song>}
	setglobaltags progression params = {next_song_count = <song_count>}
	change setlist_previous_song = <song_count>
	change \{current_transition = preaerosmith}
	progression_getnumtiersong tier_global = <tier_global> tier = <tier>
	song_count = 0
	current_tier_global = <tier_global>
	begin
	progression_gettiersong tier_global = <current_tier_global> tier = <tier> song_count = <song_count>
	progression_unlocksong tier_global = <current_tier_global> song = <song> aerosmith = 1
	get_progression_globals \{game_mode = p1_quickplay}
	progression_unlocksong tier_global = <tier_global> song = <song>
	get_progression_globals \{game_mode = p2_quickplay}
	progression_unlocksong tier_global = <tier_global> song = <song>
	song_count = (<song_count> + 1)
	repeat <tier_size>
	get_progression_globals \{game_mode = p1_quickplay}
	progression_unlocksong tier_global = <tier_global> song = <song>
	get_progression_globals \{game_mode = p2_quickplay}
	progression_unlocksong tier_global = <tier_global> song = <song>
endscript

script progression_tierencoreunlock 
	printf \{"Progression_TierEncoreUnlock"}
	get_progression_globals game_mode = ($game_mode)
	progression_getencoresong tier_global = <tier_global> tier = <tier>
	setglobaltags progression params = {encore_song = <song>}
	setglobaltags progression params = {next_tier = <tier>}
	setglobaltags progression params = {next_song_count = <song_count>}
	change setlist_previous_tier = <tier>
	change setlist_previous_song = <song_count>
	change \{current_transition = preencore}
	progression_unlocksong tier_global = <tier_global> song = <song> encore = 1
	get_progression_globals \{game_mode = p1_quickplay}
	progression_unlocksong tier_global = <tier_global> song = <song>
	get_progression_globals \{game_mode = p2_quickplay}
	progression_unlocksong tier_global = <tier_global> song = <song>
	update_coop_progression
endscript

script progression_tierencorecomplete 
	printf \{"Progression_TierEncoreComplete"}
	change \{progression_play_completion_movie = 1}
	change progression_completion_tier = <tier>
endscript

script progression_tierbossunlock 
	printf \{"Progression_TierBossUnlock"}
	get_progression_globals game_mode = ($game_mode)
	progression_getbosssong tier_global = <tier_global> tier = <tier>
	setglobaltags progression params = {boss_song = <song>}
	setglobaltags progression params = {next_tier = <tier>}
	setglobaltags progression params = {next_song_count = <song_count>}
	change setlist_previous_tier = <tier>
	change setlist_previous_song = <song_count>
	change \{current_transition = preboss}
	progression_unlocksong tier_global = <tier_global> song = <song> boss = 1
endscript

script progression_tierbosscomplete 
	printf \{"Progression_TierBossComplete"}
endscript

script progression_tiercomplete 
	printf \{"Progression_TierComplete"}
	if gotparam \{bonus}
		get_progression_globals game_mode = ($game_mode) bonus
	else
		get_progression_globals game_mode = ($game_mode)
	endif
	setlist_prefix = ($<tier_global>.prefix)
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
	setglobaltags <tiername> params = {complete = 1}
	if gotparam \{finished_game}
		printf \{"FINISHED GAME"}
		change \{end_credits = 0}
		if NOT ($progression_beat_game_last_song = 1)
			change \{end_credits = 1}
			formattext \{checksumname = bonus_song_checksum
				'%p_song%i_tier%s'
				p = 'bonus'
				i = 3
				s = 1}
			setglobaltags <bonus_song_checksum> params = {unlocked = 1}
			setglobaltags ($gh3_bonus_songs.tier1.songs [2]) params = {unlocked = 1}
		endif
		change \{progression_beat_game_last_song = 1}
		get_difficulty_text_nl difficulty = ($current_difficulty)
		formattext checksumname = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl>
		setglobaltags <gametype_checksum> params = {complete = 1}
		if ($game_mode = p1_career)
			formattext checksumname = bandname_id 'band%i_info_%g' i = ($current_band) g = 'p1_career'
			formattext checksumname = hendrix_checksum 'hendrix_achievement_%s' s = <difficulty_text_nl>
			getglobaltags <bandname_id> param = <hendrix_checksum>
			if ((<...>.<hendrix_checksum>) = 0)
				setglobaltags \{achievement_info
					params = {
						hendrix_achievement_lefty_off = 1
					}}
			elseif ((<...>.<hendrix_checksum>) = 1)
				setglobaltags \{achievement_info
					params = {
						hendrix_achievement_lefty_on = 1
					}}
			endif
			if ($current_difficulty = hard || $current_difficulty = expert)
				if NOT isguitarcontroller controller = ($player1_status.controller)
					writeachievements \{achievement = buy_a_guitar_already}
				endif
			endif
		endif
	elseif gotparam \{bonus}
		get_difficulty_text_nl difficulty = ($current_difficulty)
		formattext checksumname = gametype_checksum '%p_%s' p = <setlist_prefix> s = <difficulty_text_nl>
		setglobaltags <gametype_checksum> params = {complete = 1}
	else
		tier = (<tier> + 1)
		progression_unlocktier tier = <tier>
		formattext checksumname = tiername 'tier%i' i = <tier>
		progression_unlockvenue level_checksum = ($<tier_global>.<tiername>.level)
	endif
	update_coop_progression
endscript

script progression_unlockvenue 
	get_current_band_checksum
	final_checksum = <band_checksum>
	extendcrc <final_checksum> ($levelzones.<level_checksum>.name) out = final_checksum
	setglobaltags <final_checksum> params = {unlocked = 1}
	formattext checksumname = venue_checksum 'venue_%s' s = ($levelzones.<level_checksum>.name)
	setglobaltags <venue_checksum> params = {unlocked = 1}
endscript

script progression_unlocktier 
	get_progression_globals game_mode = ($game_mode)
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	change \{progression_unlock_tier_last_song = 1}
	change current_level = ($<tier_global>.<tier_checksum>.level)
	change setlist_previous_tier = <tier>
	change \{setlist_previous_song = 0}
	formattext checksumname = old_tier_checksum 'tier%s' s = (<tier> - 1)
	change previous_level = ($<tier_global>.<old_tier_checksum>.level)
	progression_getnumtiersong tier_global = <tier_global> tier = <tier>
	song_count = 0
	current_tier_global = <tier_global>
	begin
	progression_gettiersong tier_global = <current_tier_global> tier = <tier> song_count = <song_count>
	progression_unlocksong tier_global = <current_tier_global> song = <song>
	get_progression_globals \{game_mode = p1_quickplay}
	progression_unlocksong tier_global = <tier_global> song = <song>
	get_progression_globals \{game_mode = p2_quickplay}
	progression_unlocksong tier_global = <tier_global> song = <song>
	song_count = (<song_count> + 1)
	repeat 2
	if gotparam \{complete}
		get_progression_globals game_mode = ($game_mode)
		setlist_prefix = ($<tier_global>.prefix)
		formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
		setglobaltags <tiername> params = {complete = 1}
	endif
endscript

script progression_checkintrosongscomplete 
	printf \{"Progression_CheckIntroSongsComplete"}
	get_progression_globals game_mode = ($game_mode)
	songlist = <tier_global>
	setlist_prefix = (<songlist>.prefix)
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	getarraysize (<songlist>.<tier_checksum>.songs)
	<songs_required> = 2
	array_count = 0
	begin
	formattext {
		checksumname = song_checksum
		'%p_song%i_tier%s'
		p = <setlist_prefix>
		i = (<array_count> + 1)
		s = <tier>
		addtostringlookup = true
	}
	getglobaltags <song_checksum> param = stars
	if (<stars> > 2)
		songs_required = (<songs_required> - 1)
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	setglobaltags <tiername> params = {num_intro_songs_to_progress = <songs_required>}
	if (<songs_required> > 0)
		return \{false}
	else
		return \{true}
	endif
endscript

script progression_checksongcomplete 
	printf \{"Progression_CheckSongComplete"}
	if gotparam \{bonus}
		get_progression_globals game_mode = ($game_mode) bonus
	else
		get_progression_globals game_mode = ($game_mode)
	endif
	songlist = <tier_global>
	progression_getdifficulty
	progression_getnumtiersong tier = <tier> tier_global = <tier_global>
	<songs_required> = <tier_size>
	setlist_prefix = (<songlist>.prefix)
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	getarraysize (<songlist>.<tier_checksum>.songs)
	array_count = 0
	begin
	formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<array_count> + 1) s = <tier> addtostringlookup = true
	getglobaltags <song_checksum> param = stars
	removeparameter \{boss}
	if (<tier> = 6)
		getglobaltags <song_checksum> param = boss noassert = 1
	endif
	if NOT gotparam \{boss}
		if (<stars> > 2)
			songs_required = (<songs_required> - 1)
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	setglobaltags <tiername> params = {num_songs_to_progress = <songs_required>}
	if (<songs_required> > 0)
		return \{false}
	else
		return \{true}
	endif
endscript

script progression_checkencorecomplete 
	printf \{"Progression_CheckEncoreComplete"}
	get_progression_globals game_mode = ($game_mode)
	progression_getencoresong tier_global = <tier_global> tier = <tier>
	getglobaltags <song_checksum> param = stars
	if (<stars> > 2)
		return \{true}
	endif
	return \{false}
endscript

script progression_checkbosscomplete 
	printf \{"Progression_CheckBossComplete"}
	get_progression_globals game_mode = ($game_mode)
	progression_getbosssong tier_global = <tier_global> tier = <tier>
	getglobaltags <song_checksum> param = stars
	if (<stars> > 2)
		return \{true}
	endif
	return \{false}
endscript

script progression_checksong5star 
	printf \{"Progression_CheckSong5Star"}
	get_progression_globals game_mode = ($game_mode)
	songlist = <tier_global>
	tier = 1
	begin
	setlist_prefix = (<songlist>.prefix)
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	getarraysize (<songlist>.<tier_checksum>.songs)
	getglobaltags <tiername> param = unlocked
	if (<unlocked> = 0)
		return \{false}
	endif
	array_count = 0
	begin
	formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<array_count> + 1) s = <tier> addtostringlookup = true
	getglobaltags <song_checksum> param = unlocked
	getglobaltags <song_checksum> param = stars
	if NOT progression_isbosssong tier_global = <tier_global> tier = <tier> song = (<songlist>.<tier_checksum>.songs [<array_count>])
		if NOT (<stars> = 5)
			return \{false}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	tier = (<tier> + 1)
	repeat (<songlist>.num_tiers)
	return \{true}
endscript

script progression_checkallsongscompleted 
	printf \{"Progression_CheckAllSongsCompleted"}
	get_progression_globals game_mode = ($game_mode)
	songlist = <tier_global>
	tier = 1
	begin
	setlist_prefix = (<songlist>.prefix)
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	getarraysize (<songlist>.<tier_checksum>.songs)
	getglobaltags <tiername> param = unlocked
	if (<unlocked> = 0)
		return \{false}
	endif
	array_count = 0
	begin
	formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<array_count> + 1) s = <tier> addtostringlookup = true
	getglobaltags <song_checksum> param = unlocked
	getglobaltags <song_checksum> param = stars
	if NOT (<stars> > 2)
		return \{false}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	tier = (<tier> + 1)
	repeat (<songlist>.num_tiers)
	return \{true}
endscript

script progression_alwaysblock 
	printf \{"Progression_AlwaysBlock"}
	return \{false}
endscript

script progression_checkdiff 
	printf \{"Progression_CheckDiff"}
	progression_getdifficulty
	if NOT (<diff> = <difficulty>)
		return \{false}
	endif
	if gotparam \{mode}
		if NOT ($game_mode = <mode>)
			return \{false}
		endif
	endif
	return \{true}
endscript

script progression_unlockguitar 
	printf \{"Progression_UnlockGuitar"}
	if gotparam \{guitar}
		setglobaltags ($secret_guitars [(<guitar> - 1)].id) params = {unlocked_for_purchase = 1}
		if ($progression_unlocked_guitar = -1)
			change progression_unlocked_guitar = ($secret_guitars [(<guitar> - 1)].id)
		else
			change progression_unlocked_guitar2 = ($secret_guitars [(<guitar> - 1)].id)
		endif
		change \{progression_unlocked_type = guitar}
	else
		script_assert \{"tried to unlock a bass"}
	endif
endscript

script progression_songfailed 
	printf \{"Progression_SongFailed"}
	if ($coop_dlc_active = 1)
		return
	endif
	if ($game_mode = p1_career)
		updateatoms \{name = progression}
	endif
	change \{achievements_songwonflag = 0}
	updateatoms \{name = achievement}
endscript

script progression_songwon 
	printf \{"Progression_SongWon"}
	additional_cash = 0
	change \{progression_beat_game_last_song = 0}
	change \{progression_unlock_tier_last_song = 0}
	change \{progression_play_completion_movie = 0}
	player = 1
	begin
	formattext checksumname = player_status 'player%i_status' i = <player>
	new_stars = 3
	if ($<player_status>.score >= $<player_status>.base_score * 2.8)
		new_stars = 5
	elseif ($<player_status>.score >= $<player_status>.base_score * 2)
		new_stars = 4
	endif
	change structurename = <player_status> stars = <new_stars>
	player = (<player> + 1)
	repeat $current_num_players
	if ($coop_dlc_active = 1)
		if ($player1_status.total_notes = $player1_status.notes_hit)
			if NOT ($player1_status.total_notes = 0)
				writeachievements \{achievement = leaders_of_the_pack}
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
				setglobaltags <songname> params = {percent100 = 1}
			elseif ($game_mode = p2_quickplay)
				p2_percent_complete = (100 * $player2_status.notes_hit / $player2_status.total_notes)
				if (<p2_percent_complete> = 100)
					setglobaltags <songname> params = {percent100 = 1}
				endif
			endif
			if ($game_mode = p1_quickplay ||
					$game_mode = p1_career)
				setglobaltags <songname> params = {achievement_gold_star = 1}
			endif
		endif
	endif
	if ($game_mode = p1_career)
		get_progression_globals game_mode = ($game_mode) use_current_tab = 1
		songlist = <tier_global>
		get_band_game_mode_name
		formattext checksumname = bandname_id 'band%i_info_%g' i = ($current_band) g = <game_mode_name>
		setglobaltags <bandname_id> params = {first_play = 0}
		getglobaltags \{progression
			params = current_tier}
		getglobaltags \{progression
			params = current_song_count}
		song_count = <current_song_count>
		if gotparam \{current_tier}
			setlist_prefix = ($<songlist>.prefix)
			formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <current_tier> addtostringlookup = true
			formattext checksumname = tier_checksum 'tier%s' s = <current_tier>
			if progression_isbosssong tier_global = <tier_global> tier = <current_tier> song = (<tier_global>.<tier_checksum>.songs [<song_count>])
				change \{structurename = player1_status
					stars = 5}
			endif
			getglobaltags <song_checksum> param = stars
			getglobaltags <song_checksum> param = score
			if NOT ($end_credits = 1)
				if ($game_mode = p1_career)
					new_score = ($player1_status.score)
					new_stars = ($player1_status.stars)
				endif
				if ($player1_status.total_notes > 0)
					p1_percent_complete = (100 * $player1_status.notes_hit / $player1_status.total_notes)
					if (<p1_percent_complete> = 100)
						setglobaltags <song_checksum> params = {percent100 = 1}
						setglobaltags <songname> params = {percent100 = 1}
					endif
				endif
				if (<new_stars> > <stars>)
					setglobaltags <song_checksum> params = {stars = <new_stars>}
					if ($current_tab = tab_setlist)
						if NOT structurecontains structure = (<tier_global>.<tier_checksum>) nocash
							progression_awardcash old_stars = <stars> new_stars = <new_stars>
						endif
					endif
				endif
				if (<new_score> > <score>)
					casttointeger \{new_score}
					setglobaltags <song_checksum> params = {score = <new_score>}
				endif
			endif
			progression_calcsetlistnextsong tier_global = <tier_global>
		endif
	endif
	achievements_songwon additional_cash = <additional_cash>
	if ($game_mode = p1_career)
		updateatoms \{name = progression}
	endif
	change \{achievements_songwonflag = 1}
	updateatoms \{name = achievement}
endscript
end_credits = 0
boss_devil_score = 0

script progression_endcredits 
	printf \{"CREDITS BEGIN"}
	change boss_devil_score = ($player1_status.score)
	change \{current_level = load_z_credits}
	ui_flow_manager_respond_to_action \{action = select_retry}
	change \{current_song = kingsandqueenscredits}
	create_loading_screen
	load_venue
	restart_gem_scroller song_name = ($current_song) difficulty = ($current_difficulty) difficulty2 = ($current_difficulty2) starttime = 0 end_credits_restart = 1
	destroy_loading_screen
	start_flow_manager \{flow_state = career_play_song_fs}
	spawnscriptnow \{scrolling_list_begin}
endscript

script progression_endcredits_done 
	if ($end_credits = 1)
		change \{boss_devil_score = 0}
	endif
	destroy_credits_menu
endscript

script playmovie_endcredits 
	killallmovies
	preloadmovie \{movie = 'Fret_Flames'
		textureslot = 1
		texturepri = -2
		no_loop
		no_hold}
	begin
	if (ismoviepreloaded textureslot = 1)
		startpreloadedmovie \{textureslot = 1}
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script progression_calcsetlistnextsong 
	if ($current_tab = tab_setlist)
		setlist_prefix = ($<tier_global>.prefix)
		num_tiers = ($<tier_global>.num_tiers)
		tier = 1
		begin
		formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
		getglobaltags <tiername> param = unlocked
		if (<unlocked> = 0)
			tier = (<tier> - 1)
			break
		endif
		tier = (<tier> + 1)
		repeat <num_tiers>
		if (<tier> > <num_tiers>)
			tier = <num_tiers>
		endif
		found = 0
		progression_getbosssong tier_global = <tier_global> tier = <tier>
		if (<song_count> = -1 && found = 0)
			formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <tier> addtostringlookup = true
			getglobaltags <song_checksum> param = unlocked
			if (<unlocked> = 1)
				found = 1
			endif
		endif
		progression_getencoresong tier_global = <tier_global> tier = <tier>
		if (<song_count> = -1 && found = 0)
			formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <tier> addtostringlookup = true
			getglobaltags <song_checksum> param = unlocked
			if (<unlocked> = 1)
				found = 1
			endif
		endif
		if (<found> = 0)
			formattext checksumname = tier_checksum 'tier%s' s = <tier>
			getarraysize (<tier_global>.<tier_checksum>.songs)
			song_count = 0
			begin
			formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <tier> addtostringlookup = true
			getglobaltags <song_checksum> param = stars
			getglobaltags <song_checksum> param = unlocked
			if (<stars> < 3 && <unlocked> = 1)
				found = 1
				break
			endif
			song_count = (<song_count> + 1)
			repeat <array_size>
		endif
		if (<found> = 1)
			change setlist_previous_tier = <tier>
			change setlist_previous_song = <song_count>
		endif
	endif
endscript

script progression_awardcash 
	printf \{"Progression_AwardCash"}
	cash = -1
	if ($end_credits = 1)
		return \{additional_cash = 0}
	endif
	getarraysize \{$cash_system_rules}
	array_count = 0
	begin
	progression_getdifficulty
	if (<difficulty> = $cash_system_rules [<array_count>].diff)
		if (<new_stars> = $cash_system_rules [<array_count>].newstars)
			if (<old_stars> = $cash_system_rules [<array_count>].oldstars)
				cash = ($cash_system_rules [<array_count>].cash)
			endif
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	if (<new_stars> = <old_stars>)
		cash = 0
	endif
	if (<cash> = -1)
		printstruct <...>
		scriptassert \{"Cash Rules not found"}
	endif
	change structurename = player1_status new_cash = (<cash> + $player1_status.new_cash)
	additional_cash = <cash>
	get_current_band_info
	getglobaltags <band_info>
	<cash> = (<cash> + <additional_cash>)
	setglobaltags <band_info> params = {cash = <cash>}
	printf "cash = %d" d = <cash>
	return additional_cash = <additional_cash>
endscript

script progression_countcompletedsongsincurrenttier 
	completed_songs = 0
	get_progression_globals game_mode = ($game_mode)
	if NOT (<tier_global> = 0 || $setlist_selection_tier = 0)
		progression_getnumtiersong tier_global = <tier_global> tier = ($setlist_selection_tier) all
		song_count = 0
		begin
		progression_gettiersong tier_global = <tier_global> tier = ($setlist_selection_tier) song_count = <song_count>
		getglobaltags <song_checksum> param = stars
		removeparameter \{boss}
		if ($setlist_selection_tier = 6)
			getglobaltags <song_checksum> param = boss noassert = 1
		endif
		if NOT gotparam \{boss}
			if NOT (<stars> = 0)
				completed_songs = (<completed_songs> + 1)
			endif
		endif
		song_count = (<song_count> + 1)
		repeat <tier_size>
	endif
	return {completed_songs = <completed_songs>}
endscript

script progression_getnumtiersong 
	printf \{"Progression_GetNumTierSong"}
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	getarraysize ($<tier_global>.<tier_checksum>.songs)
	if gotparam \{all}
		return tier_size = <array_size>
	endif
	if structurecontains structure = ($<tier_global>.<tier_checksum>) encorep1
		array_size = (<array_size> - 1)
	endif
	if structurecontains structure = ($<tier_global>.<tier_checksum>) encorep2
		array_size = (<array_size> - 1)
	endif
	if structurecontains structure = ($<tier_global>.<tier_checksum>) boss
	endif
	return tier_size = <array_size>
endscript

script progression_gettiersong 
	printf \{"Progression_GetTierSong"}
	setlist_prefix = ($<tier_global>.prefix)
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_count> + 1) s = <tier>
	song = ($<tier_global>.<tier_checksum>.songs [<song_count>])
	return song = <song> song_checksum = <song_checksum>
endscript

script progression_getbosssong 
	printf \{"Progression_GetBossSong"}
	setlist_prefix = ($<tier_global>.prefix)
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	if structurecontains structure = ($<tier_global>.<tier_checksum>) boss
		formattext checksumname = song_checksum '%p_song3_tier%s' p = <setlist_prefix> s = <tier>
		return song_count = 2 song = bossjoe song_checksum = <song_checksum>
	else
		return \{song_count = -1
			song = none
			song_checksum = none}
	endif
endscript

script progression_getencoresong \{type = any}
	printf \{"Progression_GetEncoreSong"}
	setlist_prefix = ($<tier_global>.prefix)
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	if (<type> = any)
		if NOT structurecontains structure = ($<tier_global>.<tier_checksum>) encorep1
			if NOT structurecontains structure = ($<tier_global>.<tier_checksum>) encorep2
				return \{song_count = -1
					song = none
					song_checksum = none}
			endif
		endif
	endif
	if (<type> = p1)
		if NOT structurecontains structure = ($<tier_global>.<tier_checksum>) encorep1
			return \{song_count = -1
				song = none
				song_checksum = none}
		endif
	endif
	if (<type> = p2)
		if NOT structurecontains structure = ($<tier_global>.<tier_checksum>) encorep2
			return \{song_count = -1
				song = none
				song_checksum = none}
		endif
	endif
	getarraysize ($<tier_global>.<tier_checksum>.songs)
	array_count = (<array_size> - 1)
	if (<type> = p1)
		if structurecontains structure = ($<tier_global>.<tier_checksum>) encorep2
			array_count = (<array_count> - 1)
		endif
	endif
	formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<array_count> + 1) s = <tier>
	song = ($<tier_global>.<tier_checksum>.songs [<array_count>])
	return song_count = <array_count> song = <song> song_checksum = <song_checksum>
endscript

script progression_getaerosmithencoresong \{type = any}
	printf \{"Progression_GetAerosmithEncoreSong"}
	setlist_prefix = ($<tier_global>.prefix)
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	if (<type> = any)
		if NOT structurecontains structure = ($<tier_global>.<tier_checksum>) aerosmith_encore_p1
			if NOT structurecontains structure = ($<tier_global>.<tier_checksum>) aerosmith_encore_p2
				return \{song_count = -1
					song = none
					song_checksum = none}
			endif
		endif
	endif
	if (<type> = p1)
		if NOT structurecontains structure = ($<tier_global>.<tier_checksum>) aerosmith_encore_p1
			return \{song_count = -1
				song = none
				song_checksum = none}
		endif
	endif
	if (<type> = p2)
		if NOT structurecontains structure = ($<tier_global>.<tier_checksum>) aerosmith_encore_p2
			return \{song_count = -1
				song = none
				song_checksum = none}
		endif
	endif
	if (<tier> = 6)
		<song_num> = 3
	else
		<song_num> = 2
	endif
	formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<song_num> + 1) s = <tier>
	song = ($<tier_global>.<tier_checksum>.songs [<song_num>])
	return song_count = <song_num> song = <song> song_checksum = <song_checksum>
endscript

script progression_isbosssong 
	if NOT gotparam \{tier}
		return \{false}
	endif
	query_song = <song>
	progression_getbosssong <...>
	if (<song> = <query_song>)
		return \{true}
	endif
	return \{false}
endscript

script progression_isencoresong 
	query_song = <song>
	progression_getencoresong <...> type = p1
	printstruct <...>
	if (<song> = <query_song>)
		return \{true}
	endif
	progression_getencoresong <...> type = p2
	printstruct <...>
	if (<song> = <query_song>)
		return \{true}
	endif
	return \{false}
endscript

script progression_isfirstaerosmithsong 
	printf \{"Progression_IsFirstAerosmithSong"}
	get_progression_globals game_mode = ($game_mode)
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	getarraysize ($<tier_global>.<tier_checksum>.songs)
	<index> = 0
	begin
	if (($<tier_global>.<tier_checksum>.songs [<index>]) = <song>)
		break
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	if (<index> = 2)
		return \{true}
	endif
	return \{false}
endscript

script progression_unlocksong \{encore = 0
		boss = 0
		unlocked = 0
		aerosmith = 0}
	printf \{"Progression_UnlockSong"}
	setlist_prefix = ($<tier_global>.prefix)
	tier = 1
	begin
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
	getarraysize ($<tier_global>.<tier_checksum>.songs)
	array_count = 0
	begin
	if ($<tier_global>.<tier_checksum>.songs [<array_count>] = <song>)
		formattext checksumname = song_checksum '%p_song%i_tier%s' p = <setlist_prefix> i = (<array_count> + 1) s = <tier>
		setglobaltags <song_checksum> params = {unlocked = 1}
		if ($current_song = bossjoe)
			formattext \{checksumname = bonus_song_checksum
				'%p_song%i_tier%s'
				p = 'bonus'
				i = 11
				s = 1}
			setglobaltags <bonus_song_checksum> params = {unlocked = 1}
			setglobaltags ($gh3_bonus_songs.tier1.songs [10]) params = {unlocked = 1}
		endif
		if (<encore> = 1)
			setglobaltags <tiername> params = {encore_unlocked = 1}
		elseif (<boss> = 1)
			setglobaltags <tiername> params = {boss_unlocked = 1}
		elseif (<aerosmith> = 1)
			setglobaltags <tiername> params = {aerosmith_unlocked = 1}
		endif
		setglobaltags <tiername> params = {unlocked = 1}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	tier = (<tier> + 1)
	repeat ($<tier_global>.num_tiers)
endscript

script progression_getdifficulty 
	difficulty = ($current_difficulty)
	return difficulty = <difficulty>
endscript

script progression_setprogressionnodeflags 
	if ($coop_dlc_active = 1)
		change \{game_mode = p2_career}
	endif
	changenodeflag \{ls_always
		1}
	if gotparam \{perry_mic_stand}
		printf "=== LS_PERRY_MIC: %d" d = <perry_mic_stand>
		changenodeflag ls_perry_mic <perry_mic_stand>
	endif
	ls_encore = 0
	ls_3_5 = 0
	get_progression_globals game_mode = ($game_mode)
	tier = ($setlist_selection_tier)
	if ($game_mode = p1_career)
		if progression_isencoresong tier_global = <tier_global> tier = <tier> song = ($current_song)
			ls_encore = 1
		endif
	endif
	get_song_struct song = ($current_song)
	if structurecontains structure = <song_struct> name = guitarist_checksum
		if (<song_struct>.guitarist_checksum = aerosmith)
			ls_3_5 = 1
		endif
	endif
	printf "Progression_SetProgressionNodeFlags encore = %d 3_5 = %i" d = <ls_encore> i = <ls_3_5>
	if (<ls_encore> = 1)
		changenodeflag \{ls_3_5_pre
			0}
		changenodeflag \{ls_3_5_post
			1}
		changenodeflag \{ls_encore_pre
			0}
		changenodeflag \{ls_encore_post
			1}
	elseif (<ls_3_5> = 1)
		changenodeflag \{ls_3_5_pre
			0}
		changenodeflag \{ls_3_5_post
			1}
		changenodeflag \{ls_encore_pre
			1}
		changenodeflag \{ls_encore_post
			0}
	else
		changenodeflag \{ls_3_5_pre
			1}
		changenodeflag \{ls_3_5_post
			0}
		changenodeflag \{ls_encore_pre
			1}
		changenodeflag \{ls_encore_post
			0}
	endif
	getpakmancurrentname \{map = zones}
	if gotparam \{pakname}
		formattext checksumname = zone_setup '%s_SetupNodeflags' s = <pakname>
		if scriptexists <zone_setup>
			spawnscriptnow <zone_setup>
		endif
	endif
endscript
p1_career_progression = {
	tier_global = gh3_career_songs
	progression_global = gh3_career_progression
}
bonus_progression = {
	tier_global = gh3_bonus_songs
	progression_global = none
}
download_progression = {
	tier_global = gh3_download_songs
	progression_global = none
}
general_progression = {
	tier_global = gh3_general_songs
	progression_global = none
}
demo_progression_career = {
	tier_global = gh3_demo_songs_career
	progression_global = none
}
demo_progression_coop = {
	tier_global = gh3_demo_songs_coop
	progression_global = none
}
demo_progression_multiplayer = {
	tier_global = gh3_demo_songs_multiplayer
	progression_global = none
}
demo_progression_quickplay = {
	tier_global = gh3_demo_songs_quickplay
	progression_global = none
}

script get_progression_globals 
	game_mode = <game_mode> use_current_tab = 0
	if (<use_current_tab> = 1)
		if ($current_tab = tab_bonus)
			bonus = 1
		elseif ($current_tab = tab_downloads)
			download = 1
		endif
	endif
	0xf2679282 index = 0
	if (<0xeec348e2> != -1)
		0x180a59f0 index = <0xeec348e2>
		return tier_global = <tier_global> progression_global = <progression_global>
	endif
	if ($is_demo_mode = 1)
		if gotparam \{bonus}
			addparams ($bonus_progression)
		elseif gotparam \{download}
			addparams ($download_progression)
		elseif (<game_mode> = p1_career)
			addparams ($demo_progression_career)
		elseif (<game_mode> = p1_quickplay)
			addparams ($demo_progression_quickplay)
		elseif (<game_mode> = p2_quickplay)
			addparams ($demo_progression_coop)
		else
			addparams ($demo_progression_multiplayer)
		endif
		return tier_global = <tier_global> progression_global = <progression_global>
	endif
	if gotparam \{bonus}
		0xf2679282 index = 3
		if (<0xeec348e2> != -1)
			0x180a59f0 index = <0xeec348e2>
		else
			addparams ($bonus_progression)
		endif
	elseif gotparam \{download}
		addparams ($download_progression)
	elseif (<game_mode> = p1_career)
		0xf2679282 index = 1
		if (<0xeec348e2> != -1)
			0x180a59f0 index = <0xeec348e2>
		else
			addparams ($p1_career_progression)
		endif
	else
		0xf2679282 index = 2
		if (<0xeec348e2> != -1)
			0x180a59f0 index = <0xeec348e2>
		else
			addparams ($general_progression)
		endif
	endif
	return tier_global = <tier_global> progression_global = <progression_global>
endscript

script update_coop_progression 
	printf \{"update_coop_progression"}
	<tier> = 1
	begin
	get_progression_globals \{game_mode = p2_quickplay}
	songlist = <tier_global>
	setlist_prefix = (<songlist>.prefix)
	formattext checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
	formattext checksumname = tier_checksum 'tier%s' s = <tier>
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
		progression_getencoresong tier_global = <tier_global> tier = <tier>
		get_progression_globals \{game_mode = p2_quickplay}
		progression_unlocksong tier_global = <tier_global> song = <song>
	endif
	get_song_prefix song = ((<tier_global>).<tier_checksum>.songs [4])
	get_quickplay_song_stars song = <song_prefix>
	if (<stars> > 2)
		if (<tier> < 6)
			<next_tier> = (<tier> + 1)
			progression_getnumtiersong tier_global = <tier_global> tier = <next_tier>
			<song_count> = 0
			<current_tier_global> = <tier_global>
			formattext checksumname = next_tier_checksum 'tier%s' s = <next_tier>
			<next_level_checksum> = ($<tier_global>.<next_tier_checksum>.level)
			formattext checksumname = next_venue_checksum 'venue_%s' s = ($levelzones.<next_level_checksum>.name)
			getglobaltags <next_venue_checksum> param = unlocked
			if (<unlocked> = 0)
				setglobaltags <next_venue_checksum> params = {unlocked = 1}
				if ($game_mode = p2_quickplay)
					change current_level = <next_level_checksum>
					change g_last_venue_selected = <next_level_checksum>
				endif
			endif
			begin
			progression_gettiersong {
				tier_global = <current_tier_global>
				tier = <next_tier>
				song_count = <song_count>
			}
			get_progression_globals \{game_mode = p2_quickplay}
			progression_unlocksong tier_global = <tier_global> song = <song>
			<song_count> = (<song_count> + 1)
			repeat 4
		endif
	endif
	<tier> = (<tier> + 1)
	repeat 6
	updateatoms \{name = achievement}
endscript
