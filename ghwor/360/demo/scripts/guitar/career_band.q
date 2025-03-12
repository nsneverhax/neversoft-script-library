
script career_band_update \{band = rockerband_gh_rocker_axel
		rocker_part = guitarist
		female_vocals = 0
		savegame = 0
		use_power_rocker = 0
		transformation = 0}
	<guitarist> = none
	<bassist> = none
	<vocalist> = none
	<drummer> = none
	<male1_used> = 0
	<male2_used> = 0
	<male3_used> = 0
	<female1_used> = 0
	<male1_id> = male1
	<male2_id> = male2
	<male3_id> = male3
	<female1_id> = female1
	if quest_progression_is_chapter_finale
		<use_power_rocker> = 1
		<current_chapter> = ($current_chapter)
		<songs_array> = ($<current_chapter>.songs)
		playlist_getcurrentsong
		<song_index> = 0
		getarraysize <songs_array>
		begin
		if (<current_song> = <songs_array> [<song_index>])
			if (<song_index> = 0)
				ui_quest_band_select_change_band band_num = 1 rocker_part = <rocker_part>
			elseif (<song_index> = 1)
				ui_quest_band_select_change_band band_num = 2 rocker_part = <rocker_part>
			elseif (<song_index> = 2)
				change \{structurename = rockerband_gh_rocker_demigod
					power_rocker = gh_rocker_demigodscaled}
			endif
			break
		endif
		<song_index> = (<song_index> + 1)
		repeat <array_size>
	elseif quest_progression_is_chapter_credits
		<use_power_rocker> = 1
	endif
	change \{g_power_rocker_part = none}
	if (<transformation> = 1)
		<use_power_rocker> = 0
	endif
	if (<use_power_rocker> = 1)
		<rocker> = (($<band>).power_rocker)
		<male1_id> = power_male1
		<male2_id> = power_male2
		<male3_id> = power_male3
		<female1_id> = power_female1
	else
		<rocker> = (($<band>).rocker)
		if (<transformation> = 1)
			if structurecontains structure = ($<band>) alt_rocker
				<rocker> = (($<band>).alt_rocker)
			endif
		endif
	endif
	if quest_progression_is_chapter_finale
		if (<rocker> = gh_rocker_demigod || <rocker> = gh_rocker_demigodscaled)
			<rocker_part> = guitarist
		endif
	endif
	switch <rocker_part>
		case guitarist
		<guitarist> = <rocker>
		case bassist
		<bassist> = <rocker>
		case vocalist
		<vocalist> = <rocker>
		case drummer
		<drummer> = <rocker>
	endswitch
	if structurecontains structure = ($<band>) force_band
		addparams ($<band>.force_band)
	endif
	if NOT structurecontains structure = ($<band>) male3
		male3_used = 1
	endif
	if (<vocalist> = none)
		if (<transformation> = 1)
			<vocalist> = (($<band>).power_rocker)
			<transformation> = 0
			change \{g_power_rocker_part = vocals}
		elseif (<female_vocals> = 1)
			<vocalist> = (($<band>).<female1_id>)
			<female1_used> = 1
		else
			<vocalist> = (($<band>).<male1_id>)
			<male1_used> = 1
		endif
	endif
	if (<guitarist> = none)
		if (<transformation> = 1)
			<guitarist> = (($<band>).power_rocker)
			<transformation> = 0
			change \{g_power_rocker_part = guitar}
		elseif (<male1_used> = 0)
			<guitarist> = (($<band>).<male1_id>)
			<male1_used> = 1
		elseif (<male2_used> = 0)
			<guitarist> = (($<band>).<male2_id>)
			<male2_used> = 1
		elseif (<male3_used> = 0)
			<guitarist> = (($<band>).<male3_id>)
			<male3_used> = 1
		elseif (<female1_used> = 0)
			<guitarist> = (($<band>).<female1_id>)
			<female1_used> = 1
		endif
	endif
	if (<drummer> = none)
		if (<male1_used> = 0)
			<drummer> = (($<band>).<male1_id>)
			<male1_used> = 1
		elseif (<male2_used> = 0)
			<drummer> = (($<band>).<male2_id>)
			<male2_used> = 1
		elseif (<male3_used> = 0)
			<drummer> = (($<band>).<male3_id>)
			<male3_used> = 1
		elseif (<female1_used> = 0)
			<drummer> = (($<band>).<female1_id>)
			<female1_used> = 1
		endif
	endif
	if (<bassist> = none)
		if (<male1_used> = 0)
			<bassist> = (($<band>).<male1_id>)
			<male1_used> = 1
		elseif (<male2_used> = 0)
			<bassist> = (($<band>).<male2_id>)
			<male2_used> = 1
		elseif (<male3_used> = 0)
			<bassist> = (($<band>).<male3_id>)
			<male3_used> = 1
		elseif (<female1_used> = 0)
			<bassist> = (($<band>).<female1_id>)
			<female1_used> = 1
		endif
	endif
	if (($g_career_band.guitarist) != <guitarist>
			|| ($g_career_band.bassist) != <bassist>
			|| ($g_career_band.vocalist) != <vocalist>
			|| ($g_career_band.drummer) != <drummer>
		)
		change g_career_band = {guitarist = <guitarist> bassist = <bassist> vocalist = <vocalist> drummer = <drummer>}
		return \{true}
	endif
	return \{false}
endscript
