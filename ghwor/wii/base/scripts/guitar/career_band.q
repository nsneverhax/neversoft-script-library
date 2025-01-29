
script career_band_update \{Band = rockerband_gh_rocker_axel
		rocker_part = GUITARIST
		female_vocals = 0
		savegame = 0
		use_power_rocker = 0
		transformation = 0}
	<GUITARIST> = None
	<BASSIST> = None
	<vocalist> = None
	<drummer> = None
	<male1_used> = 0
	<male2_used> = 0
	<female1_used> = 0
	<male1_id> = male1
	<male2_id> = male2
	<female1_id> = female1
	if quest_progression_is_chapter_finale
		<use_power_rocker> = 1
		<current_chapter> = ($current_chapter)
		<songs_array> = ($<current_chapter>.songs)
		playlist_getcurrentsong
		<song_index> = 0
		GetArraySize <songs_array>
		begin
		if (<current_song> = <songs_array> [<song_index>])
			if (<song_index> = 0)
				ui_quest_band_select_change_band \{band_num = 1}
			elseif (<song_index> = 1)
				ui_quest_band_select_change_band \{band_num = 2}
			elseif (<song_index> = 2)
				Change \{structurename = rockerband_gh_rocker_demigod
					power_rocker = gh_rocker_demigodscaled}
			endif
			break
		endif
		<song_index> = (<song_index> + 1)
		repeat <array_Size>
	elseif quest_progression_is_chapter_credits
		<use_power_rocker> = 1
		Change \{structurename = rockerband_gh_rocker_demigod
			power_rocker = gh_rocker_demigod}
	endif
	Change \{g_power_rocker_part = None}
	if (<transformation> = 1)
		<use_power_rocker> = 0
	endif
	if (<use_power_rocker> = 1)
		<rocker> = (($<Band>).power_rocker)
		<male1_id> = power_male1
		<male2_id> = power_male2
		<female1_id> = power_female1
	else
		<rocker> = (($<Band>).rocker)
		if (<transformation> = 1)
			if StructureContains structure = ($<Band>) alt_rocker
				<rocker> = (($<Band>).alt_rocker)
			endif
		endif
	endif
	if (<rocker> = gh_rocker_demigod || <rocker> = gh_rocker_demigodscaled)
		<rocker_part> = GUITARIST
	endif
	switch <rocker_part>
		case GUITARIST
		<GUITARIST> = <rocker>
		case BASSIST
		<BASSIST> = <rocker>
		case vocalist
		<vocalist> = <rocker>
		case drummer
		<drummer> = <rocker>
	endswitch
	if StructureContains structure = ($<Band>) force_band
		AddParams ($<Band>.force_band)
	endif
	if (<vocalist> = None)
		if (<transformation> = 1)
			<vocalist> = (($<Band>).power_rocker)
			<transformation> = 0
			Change \{g_power_rocker_part = vocals}
		elseif (<female_vocals> = 1)
			<vocalist> = (($<Band>).<female1_id>)
			<female1_used> = 1
		else
			<vocalist> = (($<Band>).<male1_id>)
			<male1_used> = 1
		endif
	endif
	if (<GUITARIST> = None)
		if (<transformation> = 1)
			<GUITARIST> = (($<Band>).power_rocker)
			<transformation> = 0
			Change \{g_power_rocker_part = guitar}
		elseif (<male1_used> = 0)
			<GUITARIST> = (($<Band>).<male1_id>)
			<male1_used> = 1
		elseif (<male2_used> = 0)
			<GUITARIST> = (($<Band>).<male2_id>)
			<male2_used> = 1
		elseif (<female1_used> = 0)
			<GUITARIST> = (($<Band>).<female1_id>)
			<female1_used> = 1
		endif
	endif
	if (<drummer> = None)
		if (<male1_used> = 0)
			<drummer> = (($<Band>).<male1_id>)
			<male1_used> = 1
		elseif (<male2_used> = 0)
			<drummer> = (($<Band>).<male2_id>)
			<male2_used> = 1
		elseif (<female1_used> = 0)
			<drummer> = (($<Band>).<female1_id>)
			<female1_used> = 1
		endif
	endif
	if (<BASSIST> = None)
		if (<male1_used> = 0)
			<BASSIST> = (($<Band>).<male1_id>)
			<male1_used> = 1
		elseif (<male2_used> = 0)
			<BASSIST> = (($<Band>).<male2_id>)
			<male2_used> = 1
		elseif (<female1_used> = 0)
			<BASSIST> = (($<Band>).<female1_id>)
			<female1_used> = 1
		endif
	endif
	if (($g_career_band.GUITARIST) != <GUITARIST>
			|| ($g_career_band.BASSIST) != <BASSIST>
			|| ($g_career_band.vocalist) != <vocalist>
			|| ($g_career_band.drummer) != <drummer>
		)
		Change g_career_band = {GUITARIST = <GUITARIST> BASSIST = <BASSIST> vocalist = <vocalist> drummer = <drummer>}
		return \{true}
	endif
	return \{FALSE}
endscript
