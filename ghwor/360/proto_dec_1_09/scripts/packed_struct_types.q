max_temporary_profiles_small = 20
max_temporary_profiles_large = 20
g_max_song_globaltag_plays = 4095

script get_savegame_constants 
	getsonglistsize \{on_disc_only = true}
	printf 'Songs on disc: %a' a = <array_Size>
	num_songs = (86 + 164 + 85 + 52 + 48 + 50 + 255 + 85 + 60 + 60 + 60)
	<num_songs> = (<num_songs> + 255 + 85 + 200)
	if (<num_songs> > 1600)
		ScriptAssert \{'1600 song assumption is no longer good'}
	endif
	num_songs = 1600
	printf 'Total songs: %b' b = <num_songs>
	num_parts = 5
	num_singleplayer_parts = 4
	num_diffs = 5
	num_completetags = 64
	num_unlockedtags = 256
	GetArraySize ($LevelZoneArray)
	num_venuetags = ((<array_Size> + 1) * 2)
	<num_gigtags> = 0
	<num_gigsongtags> = 0
	quest_progression_get_num_tags
	num_songtags_global = (<num_songs>)
	GetArraySize ($preset_musician_profiles_modifiable)
	num_preset_profiles = <array_Size>
	GetArraySize ($preset_musician_profiles_ghrockers)
	num_preset_profiles = (<num_preset_profiles> + <array_Size>)
	max_challenge_grade = 3
	if isXenon
		num_preset_profiles = (<num_preset_profiles> + 1)
	endif
	max_global_structs = (
		($max_num_create_a_rockers) +
		<num_preset_profiles> +
		($max_num_logo_saves) +
		(($max_num_instrument_saves) * 4) +
		<num_completetags> +
		<num_unlockedtags> +
		<num_songtags_global> +
		64
	)
	<global_buckets> = 24593
	max_progression_structs = (
		<num_venuetags> +
		<num_gigtags> +
		<num_gigsongtags> +
		64
	)
	<progression_buckets> = 389
	return <...>
endscript

script init_packed_structs \{globaltag_sets = 1}
	get_savegame_constants
	packed_compression = (2.0 / 3.0)
	max_player_score = (2147483647)
	min_stars = 0
	max_quickplay_stars = 6
	max_career_stars = 15
	PushMemProfile \{'packedstructs'}
	setuppackedstructtypes {
		types =
		[
			{
				Name = createarocker
				pool_size = (<num_savegames> * ($max_num_create_a_rockers))
				buffer_size = (21000 * <packed_compression>)
			}
			{
				Name = presetcars
				pool_size = (<num_savegames> * <num_preset_profiles>)
				buffer_size = (13500 * <packed_compression>)
			}
			{
				Name = logos
				pool_size = (<num_savegames> * ($max_num_logo_saves))
				buffer_size = (1850 * <packed_compression>)
			}
			{
				Name = guitars
				pool_size = (<num_savegames> * ($max_num_instrument_saves))
				buffer_size = (4300 * <packed_compression>)
			}
			{
				Name = basses
				pool_size = (<num_savegames> * ($max_num_instrument_saves))
				buffer_size = (4300 * <packed_compression>)
			}
			{
				Name = drums
				pool_size = (<num_savegames> * ($max_num_instrument_saves))
				buffer_size = (2000 * <packed_compression>)
			}
			{
				Name = vocals
				pool_size = (<num_savegames> * ($max_num_instrument_saves))
				buffer_size = 150
			}
			{
				Name = completetags
				pool_size = (<num_completetags> * <num_savegames>)
				fields =
				[
					{
						Name = complete
						Type = bool
					}
				]
			}
			{
				Name = unlockedtags
				pool_size = (<num_unlockedtags> * <num_savegames>)
				fields =
				[
					{
						Name = unlocked
						Type = bool
					}
				]
			}
			{
				Name = venuetags
				pool_size = (<num_venuetags> * <num_savegames>)
				fields =
				[
					{
						Name = unlocked
						Type = bool
					}
					{
						Name = venue_stars
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
				]
			}
			{
				Name = gigtags
				pool_size = (<num_gigtags> * <num_savegames>)
				fields =
				[
					{
						Name = unlocked
						Type = bool
					}
					{
						Name = has_been_played
						Type = bool
					}
					{
						Name = completed
						Type = bool
					}
					{
						Name = started
						Type = bool
					}
					{
						Name = encore_unlocked
						Type = bool
					}
				]
			}
			{
				Name = gigsongtags
				pool_size = (<num_gigsongtags> * <num_savegames>)
				fields =
				[
					{
						Name = stars
						Type = int
						low_limit = <min_stars>
						high_limit = <max_career_stars>
						default_value = 0
					}
				]
			}
			{
				Name = songtags_global
				pool_size = (<num_songtags_global> * <num_savegames>)
				fields =
				[
					{
						Name = challenge01_best_score
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
						default_value = 0
					}
					{
						Name = challenge02_best_score
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
						default_value = 0
					}
					{
						Name = challenge03_best_score
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
						default_value = 0
					}
					{
						Name = challenge04_best_score
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
						default_value = 0
					}
					{
						Name = challenge05_best_score
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
						default_value = 0
					}
					{
						Name = challenge06_best_score
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
						default_value = 0
					}
					{
						Name = challenge07_best_score
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
						default_value = 0
					}
					{
						Name = challenge08_best_score
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
						default_value = 0
					}
					{
						Name = challenge09_best_score
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
						default_value = 0
					}
					{
						Name = challenge10_best_score
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
						default_value = 0
					}
					{
						Name = challenge11_best_score
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
						default_value = 0
					}
					{
						Name = challenge12_best_score
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
						default_value = 0
					}
					{
						Name = challenge01_grade
						Type = int
						low_limit = 0
						high_limit = <max_challenge_grade>
						default_value = 0
					}
					{
						Name = challenge02_grade
						Type = int
						low_limit = 0
						high_limit = <max_challenge_grade>
						default_value = 0
					}
					{
						Name = challenge03_grade
						Type = int
						low_limit = 0
						high_limit = <max_challenge_grade>
						default_value = 0
					}
					{
						Name = challenge04_grade
						Type = int
						low_limit = 0
						high_limit = <max_challenge_grade>
						default_value = 0
					}
					{
						Name = challenge05_grade
						Type = int
						low_limit = 0
						high_limit = <max_challenge_grade>
						default_value = 0
					}
					{
						Name = challenge06_grade
						Type = int
						low_limit = 0
						high_limit = <max_challenge_grade>
						default_value = 0
					}
					{
						Name = challenge07_grade
						Type = int
						low_limit = 0
						high_limit = <max_challenge_grade>
						default_value = 0
					}
					{
						Name = challenge08_grade
						Type = int
						low_limit = 0
						high_limit = <max_challenge_grade>
						default_value = 0
					}
					{
						Name = challenge09_grade
						Type = int
						low_limit = 0
						high_limit = <max_challenge_grade>
						default_value = 0
					}
					{
						Name = challenge10_grade
						Type = int
						low_limit = 0
						high_limit = <max_challenge_grade>
						default_value = 0
					}
					{
						Name = challenge11_grade
						Type = int
						low_limit = 0
						high_limit = <max_challenge_grade>
						default_value = 0
					}
					{
						Name = challenge12_grade
						Type = int
						low_limit = 0
						high_limit = <max_challenge_grade>
						default_value = 0
					}
					{
						Name = num_times_played
						Type = int
						low_limit = 0
						high_limit = $g_max_song_globaltag_plays
						default_value = 0
					}
					{
						Name = unlocked
						Type = bool
						default_value = 0
					}
					{
						Name = available_on_other_client
						Type = bool
						default_value = 0
					}
					{
						Name = setlist_bestscore_guitar_beginner
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_guitar_beginner
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_guitar_beginner
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_guitar_easy
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_guitar_easy
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_guitar_easy
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_guitar_medium
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_guitar_medium
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_guitar_medium
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_guitar_hard
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_guitar_hard
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_guitar_hard
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_guitar_expert
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_guitar_expert
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_guitar_expert
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_bass_beginner
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_bass_beginner
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_bass_beginner
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_bass_easy
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_bass_easy
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_bass_easy
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_bass_medium
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_bass_medium
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_bass_medium
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_bass_hard
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_bass_hard
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_bass_hard
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_bass_expert
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_bass_expert
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_bass_expert
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_drum_beginner
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_drum_beginner
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_drum_beginner
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_drum_easy
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_drum_easy
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_drum_easy
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_drum_medium
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_drum_medium
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_drum_medium
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_drum_hard
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_drum_hard
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_drum_hard
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_drum_expert
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_drum_expert
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_drum_expert
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_vocals_beginner
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_vocals_beginner
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_vocals_beginner
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_vocals_easy
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_vocals_easy
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_vocals_easy
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_vocals_medium
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_vocals_medium
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_vocals_medium
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_vocals_hard
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_vocals_hard
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_vocals_hard
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_vocals_expert
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_vocals_expert
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_vocals_expert
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_band_beginner
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_band_beginner
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_band_beginner
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_band_easy
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_band_easy
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_band_easy
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_band_medium
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_band_medium
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_band_medium
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_band_hard
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_band_hard
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_band_hard
						Type = int
						low_limit = 0
						high_limit = 100
					}
					{
						Name = setlist_bestscore_band_expert
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars_band_expert
						Type = int
						low_limit = <min_stars>
						high_limit = <max_quickplay_stars>
					}
					{
						Name = setlist_bestpercentage_band_expert
						Type = int
						low_limit = 0
						high_limit = 100
					}
				]
			}
			{
				Name = temporary_profiles_large
				pool_size = $max_temporary_profiles_large
				buffer_size = (21000 * <packed_compression>)
			}
			{
				Name = temporary_profiles_small
				pool_size = $max_temporary_profiles_small
				buffer_size = (3072 * <packed_compression>)
			}
		]
	}
	PopMemProfile
endscript
