
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
	Change \{g_power_rocker_part = None}
	if (<use_power_rocker> = 1 && <transformation> = 0)
		<rocker> = (($<Band>).power_rocker)
	else
		<rocker> = (($<Band>).rocker)
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
	if (<vocalist> = None)
		if (<transformation> = 1)
			<vocalist> = (($<Band>).power_rocker)
			<transformation> = 0
			Change \{g_power_rocker_part = vocals}
		elseif (<female_vocals> = 1)
			<vocalist> = (($<Band>).female1)
			<female1_used> = 1
		else
			<vocalist> = (($<Band>).male1)
			<male1_used> = 1
		endif
	endif
	if (<GUITARIST> = None)
		if (<transformation> = 1)
			<GUITARIST> = (($<Band>).power_rocker)
			<transformation> = 0
			Change \{g_power_rocker_part = guitar}
		elseif (<male1_used> = 0)
			<GUITARIST> = (($<Band>).male1)
			<male1_used> = 1
		elseif (<male2_used> = 0)
			<GUITARIST> = (($<Band>).male2)
			<male2_used> = 1
		elseif (<female1_used> = 0)
			<GUITARIST> = (($<Band>).female1)
			<female1_used> = 1
		endif
	endif
	if (<drummer> = None)
		if (<male1_used> = 0)
			<drummer> = (($<Band>).male1)
			<male1_used> = 1
		elseif (<male2_used> = 0)
			<drummer> = (($<Band>).male2)
			<male2_used> = 1
		elseif (<female1_used> = 0)
			<drummer> = (($<Band>).female1)
			<female1_used> = 1
		endif
	endif
	if (<BASSIST> = None)
		if (<male1_used> = 0)
			<BASSIST> = (($<Band>).male1)
			<male1_used> = 1
		elseif (<male2_used> = 0)
			<BASSIST> = (($<Band>).male2)
			<male2_used> = 1
		elseif (<female1_used> = 0)
			<BASSIST> = (($<Band>).female1)
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
