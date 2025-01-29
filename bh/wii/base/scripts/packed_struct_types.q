max_temporary_profiles_small = 20
max_temporary_profiles_large = 16

script get_savegame_constants 
	getsonglistsize \{on_disc_only = true}
	printf 'Songs on disc: %a' a = <array_Size>
	num_songs = (86 + 164 + 85 + 52 + 48 + 50 + 255 + 85 + 60 + 60 + 60)
	if (<num_songs> > 1005)
		ScriptAssert \{'1005 song assumption is no longer good'}
	endif
	num_songs = 1005
	printf 'Total songs: %b' b = <num_songs>
	num_parts = 5
	num_singleplayer_parts = 4
	num_diffs = 5
	num_completetags = 64
	num_unlockedtags = 256
	GetArraySize ($LevelZoneArray)
	num_venuetags = ((<array_Size> + 1) * 2)
	num_se_gig_tags = 128
	num_gigtags = 256
	num_charactertags = 16
	num_songtags_tr = (<num_songs> * <num_parts> * <num_diffs>)
	num_songtags_global = (<num_songs>)
	GetArraySize ($0x6db04597)
	num_preset_profiles = <array_Size>
	GetArraySize ($preset_musician_profiles_ghrockers)
	num_preset_profiles = (<num_preset_profiles> + <array_Size>)
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
		<num_charactertags> +
		<num_songtags_tr> +
		<num_songtags_global> +
		64
	)
	max_progression_structs = (
		<num_venuetags> +
		<num_gigtags> +
		64
	)
	return <...>
endscript

script init_packed_structs \{globaltag_sets = 1}
	get_savegame_constants
	max_player_score = (536870912 - 1)
	min_stars = 0
	max_stars = 6
	packed_compression = 1.0
	PushMemProfile \{'packedstructs'}
	setuppackedstructtypes {
		types =
		[
			{
				Name = createarocker
				pool_size = (<num_savegames> * ($max_num_create_a_rockers))
				buffer_size = ((5000) * <packed_compression>)
			}
			{
				Name = presetcars
				pool_size = (<num_savegames> * <num_preset_profiles>)
				buffer_size = (5000 * <packed_compression>)
			}
			{
				Name = logos
				pool_size = (<num_savegames> * ($max_num_logo_saves))
				buffer_size = (1750 * <packed_compression>)
			}
			{
				Name = guitars
				pool_size = (<num_savegames> * ($max_num_instrument_saves))
				buffer_size = (358 * <packed_compression>)
			}
			{
				Name = basses
				pool_size = (<num_savegames> * ($max_num_instrument_saves))
				buffer_size = (358 * <packed_compression>)
			}
			{
				Name = drums
				pool_size = (<num_savegames> * ($max_num_instrument_saves))
				buffer_size = (134 * <packed_compression>)
			}
			{
				Name = vocals
				pool_size = (<num_savegames> * ($max_num_instrument_saves))
				buffer_size = (52 * <packed_compression>)
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
					{
						Name = 0x6af5adbe
						Type = bool
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
						Name = song1_stars_earned
						Type = int
						low_limit = <min_stars>
						high_limit = <max_stars>
						default_value = <min_stars>
					}
					{
						Name = earned_gold_stars
						Type = bool
					}
					{
						Name = completed
						Type = bool
					}
					{
						Name = completed_gold
						Type = bool
					}
					{
						Name = completed_platinum
						Type = bool
					}
					{
						Name = completed_diamond
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
				Name = charactertags
				pool_size = (<num_charactertags> * <num_savegames>)
				fields =
				[
					{
						Name = unlocked
						Type = bool
					}
				]
			}
			{
				Name = songtags_tr
				pool_size = (<num_songtags_tr> * <num_savegames>)
				fields =
				[
					{
						Name = tr_names
						Type = wstring
						max_length = ($tr_max_band_characters)
						array_Size = 3
					}
					{
						Name = tr_scores
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
						array_Size = 3
					}
					{
						Name = setlist_bestscore
						Type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						Name = setlist_beststars
						Type = int
						low_limit = <min_stars>
						high_limit = <max_stars>
					}
					{
						Name = setlist_bestpercentage
						Type = int
						low_limit = 0
						high_limit = 100
					}
				]
			}
			{
				Name = songtags_global
				pool_size = (<num_songtags_global> * <num_savegames>)
				fields =
				[
					{
						Name = unlocked
						Type = bool
					}
					{
						Name = rating
						Type = int
						low_limit = 0
						high_limit = 5
					}
					{
						Name = available_on_other_client
						Type = int
						low_limit = 0
						high_limit = 8
					}
					{
						Name = completed
						Type = bool
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
