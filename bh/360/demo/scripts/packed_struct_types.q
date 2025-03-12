max_temporary_profiles_small = 20
max_temporary_profiles_large = 20

script get_savegame_constants 
	getsonglistsize \{on_disc_only = true}
	printf 'Songs on disc: %a' a = <array_size>
	num_songs = (86 + 164 + 85 + 52 + 48 + 50 + 255 + 85 + 60 + 60 + 60)
	if (<num_songs> > 1005)
		scriptassert \{'1005 song assumption is no longer good'}
	endif
	num_songs = 1005
	printf 'Total songs: %b' b = <num_songs>
	num_parts = 5
	num_singleplayer_parts = 4
	num_diffs = 5
	num_completetags = 64
	num_unlockedtags = 256
	getarraysize ($levelzonearray)
	num_venuetags = ((<array_size> + 1) * 2)
	num_se_gig_tags = 128
	num_gigtags = 256
	num_charactertags = 16
	num_songtags_tr = (<num_songs> * <num_parts> * <num_diffs>)
	num_songtags_global = (<num_songs>)
	getarraysize ($preset_musician_profiles_modifiable)
	num_preset_profiles = <array_size>
	getarraysize ($preset_musician_profiles_ghrockers)
	num_preset_profiles = (<num_preset_profiles> + <array_size>)
	if isxenon
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
	packed_compression = (2.0 / 3.0)
	max_player_score = (536870912 - 1)
	min_stars = 0
	max_stars = 6
	pushmemprofile \{'packedstructs'}
	setuppackedstructtypes {
		types =
		[
			{
				name = createarocker
				pool_size = (<num_savegames> * ($max_num_create_a_rockers))
				buffer_size = (21000 * <packed_compression>)
			}
			{
				name = presetcars
				pool_size = (<num_savegames> * <num_preset_profiles>)
				buffer_size = (13500 * <packed_compression>)
			}
			{
				name = logos
				pool_size = (<num_savegames> * ($max_num_logo_saves))
				buffer_size = (1850 * <packed_compression>)
			}
			{
				name = guitars
				pool_size = (<num_savegames> * ($max_num_instrument_saves))
				buffer_size = (4300 * <packed_compression>)
			}
			{
				name = basses
				pool_size = (<num_savegames> * ($max_num_instrument_saves))
				buffer_size = (4300 * <packed_compression>)
			}
			{
				name = drums
				pool_size = (<num_savegames> * ($max_num_instrument_saves))
				buffer_size = (2000 * <packed_compression>)
			}
			{
				name = vocals
				pool_size = (<num_savegames> * ($max_num_instrument_saves))
				buffer_size = 150
			}
			{
				name = completetags
				pool_size = (<num_completetags> * <num_savegames>)
				fields =
				[
					{
						name = complete
						type = bool
					}
				]
			}
			{
				name = unlockedtags
				pool_size = (<num_unlockedtags> * <num_savegames>)
				fields =
				[
					{
						name = unlocked
						type = bool
					}
				]
			}
			{
				name = venuetags
				pool_size = (<num_venuetags> * <num_savegames>)
				fields =
				[
					{
						name = unlocked
						type = bool
					}
					{
						name = venue_stars
						type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						name = 0x6af5adbe
						type = bool
					}
				]
			}
			{
				name = gigtags
				pool_size = (<num_gigtags> * <num_savegames>)
				fields =
				[
					{
						name = unlocked
						type = bool
					}
					{
						name = has_been_played
						type = bool
					}
					{
						name = song1_stars_earned
						type = int
						low_limit = <min_stars>
						high_limit = <max_stars>
						default_value = <min_stars>
					}
					{
						name = earned_gold_stars
						type = bool
					}
					{
						name = completed
						type = bool
					}
					{
						name = completed_gold
						type = bool
					}
					{
						name = completed_platinum
						type = bool
					}
					{
						name = completed_diamond
						type = bool
					}
					{
						name = started
						type = bool
					}
					{
						name = encore_unlocked
						type = bool
					}
				]
			}
			{
				name = charactertags
				pool_size = (<num_charactertags> * <num_savegames>)
				fields =
				[
					{
						name = unlocked
						type = bool
					}
					{
						name = unlocked_for_purchase
						type = bool
					}
				]
			}
			{
				name = songtags_tr
				pool_size = (<num_songtags_tr> * <num_savegames>)
				fields =
				[
					{
						name = tr_names
						type = wstring
						max_length = ($tr_max_band_characters)
						array_size = 3
					}
					{
						name = tr_scores
						type = int
						low_limit = 0
						high_limit = <max_player_score>
						array_size = 3
					}
					{
						name = setlist_bestscore
						type = int
						low_limit = 0
						high_limit = <max_player_score>
					}
					{
						name = setlist_beststars
						type = int
						low_limit = <min_stars>
						high_limit = <max_stars>
					}
					{
						name = setlist_bestpercentage
						type = int
						low_limit = 0
						high_limit = 100
					}
				]
			}
			{
				name = songtags_global
				pool_size = (<num_songtags_global> * <num_savegames>)
				fields =
				[
					{
						name = unlocked
						type = bool
					}
					{
						name = rating
						type = int
						low_limit = 0
						high_limit = 5
					}
					{
						name = available_on_other_client
						type = int
						low_limit = 0
						high_limit = 8
					}
					{
						name = completed
						type = bool
					}
				]
			}
			{
				name = temporary_profiles_large
				pool_size = $max_temporary_profiles_large
				buffer_size = (21000 * <packed_compression>)
			}
			{
				name = temporary_profiles_small
				pool_size = $max_temporary_profiles_small
				buffer_size = (4000 * <packed_compression>)
			}
		]
	}
	popmemprofile
endscript
