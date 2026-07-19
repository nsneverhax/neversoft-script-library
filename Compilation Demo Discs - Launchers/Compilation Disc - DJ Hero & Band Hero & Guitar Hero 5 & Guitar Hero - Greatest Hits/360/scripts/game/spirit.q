can_CreateSpirit = 1
S_Red = 0.0
S_Green = 0.0
S_Blue = 0.0
S_Alpha = 0.0
velocity = -0.05

script change_Spirits_Color 
	printf \{channel = Spirit
		'spirit - change_Spirits_Color'}
	switch <performance>
		case poor
		printf \{channel = Spirit
			'spirit - performance=POOR'}
		if ScriptIsRunning \{Spirit_ChangeTo_Yellow}
			printf \{channel = Spirit
				'killspawnedscript Spirit_ChangeTo_Yellow '}
			KillSpawnedScript \{name = Spirit_ChangeTo_Yellow}
		endif
		if ScriptIsRunning \{Spirit_ChangeTo_Red}
			return
		else
			spawnscriptnow \{Spirit_ChangeTo_Red}
		endif
		case medium
		printf \{channel = venue
			'spirit - performance=MEDIUM'}
		if ScriptIsRunning \{Spirit_ChangeTo_Red}
			printf \{channel = venue
				' killspawnedscript Spirit_ChangeTo_Red'}
			KillSpawnedScript \{name = Spirit_ChangeTo_Red}
		endif
		if ScriptIsRunning \{Spirit_ChangeTo_Green}
			printf \{channel = venue
				'killspawnedscript Spirit_ChangeTo_Green'}
			KillSpawnedScript \{name = Spirit_ChangeTo_Green}
		endif
		if ScriptIsRunning \{Spirit_ChangeTo_Yellow}
			return
		else
			spawnscriptnow \{Spirit_ChangeTo_Yellow}
		endif
		case good
		printf \{channel = venue
			'spirit - performance=GOOD'}
		if ScriptIsRunning \{Spirit_ChangeTo_Yellow}
			printf \{channel = venue
				'killspawnedscript Spirit_ChangeTo_Yellow'}
			KillSpawnedScript \{name = Spirit_ChangeTo_Yellow}
		endif
		if ScriptIsRunning \{Spirit_ChangeTo_Green}
			return
		else
			spawnscriptnow \{Spirit_ChangeTo_Green}
		endif
	endswitch
endscript

script Spirit_ChangeTo_Red 
	printf \{channel = Spirit
		'Spirit_ChangeTo_Red'}
	Max_Red = 2.5
	Velocity_Max = 0.45000002
	begin
	if ($S_Green > 0.0)
		<fgreen> = ($S_Green + (-0.05))
		if (<fgreen> < 0.0)
			<fgreen> = 0.0
		endif
		change S_Green = <fgreen>
	endif
	if ($S_Red < <Max_Red>)
		<frouge> = ($S_Red + (0.05))
		if (<frouge> < 0.0)
			<frouge> = 0.0
		elseif (<frouge> > <Max_Red>)
			<frouge> = <Max_Red>
		endif
		change S_Red = <frouge>
	endif
	if ($S_Blue > 0.0)
		<fblue> = ($S_Blue + (-0.0))
		if (<fblue> < 0.0)
			<fblue> = 0.0
		endif
		change S_Blue = <fblue>
	endif
	printf channel = Spirit 'Velocity_Max av %p' p = <Velocity_Max>
	printf \{channel = Spirit
		'Velocity av %p'
		p = $velocity}
	change velocity = <Velocity_Max>
	printf \{channel = Spirit
		'Velocity af %p'
		p = $velocity}
	printf \{channel = Spirit
		'///////////////////////////////////////////////'}
	printf \{channel = Spirit
		'Spirit_ChangeTo_Red'}
	printf \{channel = Spirit
		'///////////////////////////////////////////////'}
	printf \{channel = Spirit
		'Velocity %p'
		p = $velocity}
	printf \{channel = Spirit
		'color Blue %p'
		p = $S_Blue}
	printf \{channel = Spirit
		'color Red %p'
		p = $S_Red}
	printf \{channel = Spirit
		'color Green %p'
		p = $S_Green}
	printf \{channel = Spirit
		'///////////////////////////////////////////////'}
	SetMaterialProperty mat = 'Z_Spirit_Primary' prop = 'm_psPass0MaterialColor' x = ($S_Red) y = ($S_Green) z = ($S_Blue) w = ($S_Alpha)
	SetMaterialProperty mat = 'Z_Spirit_Primary' prop = 'm_velocityU' x = ($velocity)
	Wait \{3
		frame}
	if (($S_Red = <Max_Red>) && ($S_Green = 0.0) && ($S_Blue = 0.0) && ($velocity = <Velocity_Max>))
		return
	else
		repeat
	endif
endscript

script Spirit_ChangeTo_Green 
	printf \{channel = Spirit
		'Spirit_ChangeTo_Green'}
	Max_Green = 2.5
	Velocity_Max = -0.9
	begin
	if ($S_Red > 0.0)
		<frouge> = ($S_Red + (-0.05))
		if (<frouge> < 0.0)
			<frouge> = 0.0
		endif
		change S_Red = <frouge>
	endif
	if ($S_Green < <Max_Green>)
		<fgreen> = ($S_Green + (0.05))
		if (<fgreen> < 0.0)
			<fgreen> = 0.0
		elseif (<fgreen> > <Max_Green>)
			<fgreen> = <Max_Green>
		endif
		change S_Green = <fgreen>
	endif
	if ($S_Blue > 0.0)
		<fblue> = ($S_Blue + (-0.05))
		if (<fblue> < 0.0)
			<fblue> = 0.0
		endif
		change S_Blue = <fblue>
	endif
	change velocity = <Velocity_Max>
	printf \{channel = Spirit
		'///////////////////////////////////////////////'}
	printf \{channel = Spirit
		'Spirit_ChangeTo_Green'}
	printf \{channel = Spirit
		'///////////////////////////////////////////////'}
	printf \{channel = Spirit
		'Velocity %p'
		p = $velocity}
	printf \{channel = Spirit
		'color Blue %p'
		p = $S_Blue}
	printf \{channel = Spirit
		'color Red %p'
		p = $S_Red}
	printf \{channel = Spirit
		'color Green %p'
		p = $S_Green}
	printf \{channel = Spirit
		'///////////////////////////////////////////////'}
	SetMaterialProperty mat = 'Z_Spirit_Primary' prop = 'm_psPass0MaterialColor' x = ($S_Red) y = ($S_Green) z = ($S_Blue) w = ($S_Alpha)
	SetMaterialProperty mat = 'Z_Spirit_Primary' prop = 'm_velocityU' x = ($velocity)
	Wait \{5
		frame}
	if (($S_Red = 0.0) && ($S_Green = <Max_Green>) && ($S_Blue = 0.0) && ($velocity = <Velocity_Max>))
		return
	else
		repeat
	endif
endscript

script Spirit_ChangeTo_Yellow 
	printf \{channel = Spirit
		'Spirit_ChangeTo_Yellow'}
	Max_Green = 2.5
	Max_Red = 2.5
	Velocity_Max = -0.45000002
	begin
	if ($S_Red < <Max_Red>)
		<frouge> = ($S_Red + (0.05))
		if (<frouge> < 0.0)
			<frouge> = 0.0
		elseif (<frouge> > <Max_Red>)
			<frouge> = <Max_Red>
		endif
		change S_Red = <frouge>
	else
		S_Red = <Max_Red>
	endif
	if ($S_Green < <Max_Green>)
		<fgreen> = ($S_Green + (0.05))
		if (<fgreen> < 0.0)
			<fgreen> = 0.0
		elseif (<fgreen> > <Max_Green>)
			<fgreen> = <Max_Green>
		endif
		change S_Green = <fgreen>
	else
		S_Green = <Max_Green>
	endif
	if ($S_Blue > 0.0)
		<fblue> = ($S_Blue + (-0.05))
		if (<fblue> < 0.0)
			<fblue> = 0.0
		endif
		change S_Blue = <fblue>
	endif
	printf channel = Spirit 'Velocity_Max av %p' p = <Velocity_Max>
	printf \{channel = Spirit
		'Velocity av %p'
		p = $velocity}
	change velocity = <Velocity_Max>
	printf channel = Spirit 'Velocity_Max after %p' p = <Velocity_Max>
	printf \{channel = Spirit
		'Velocity after %p'
		p = $velocity}
	printf \{channel = Spirit
		'///////////////////////////////////////////////'}
	printf \{channel = Spirit
		'Spirit_ChangeTo_Yellow'}
	printf \{channel = Spirit
		'///////////////////////////////////////////////'}
	printf \{channel = Spirit
		'Velocity %p'
		p = $velocity}
	printf \{channel = Spirit
		'color Blue %p'
		p = $S_Blue}
	printf \{channel = Spirit
		'color Red %p'
		p = $S_Red}
	printf \{channel = Spirit
		'color Green %p'
		p = $S_Green}
	printf \{channel = Spirit
		'///////////////////////////////////////////////'}
	SetMaterialProperty mat = 'Z_Spirit_Primary' prop = 'm_psPass0MaterialColor' x = ($S_Red) y = ($S_Green) z = ($S_Blue) w = ($S_Alpha)
	SetMaterialProperty mat = 'Z_Spirit_Primary' prop = 'm_velocityU' x = ($velocity)
	Wait \{5
		frame}
	if (($S_Red = <Max_Red>) && ($S_Green = <Max_Green>) && ($S_Blue = 0.0) && ($velocity = <Velocity_Max>))
		return
	else
		repeat
	endif
endscript

script Spirit_FadeIn 
	if ($can_CreateSpirit = 0)
		return
	endif
	printf \{channel = Spirit
		'Spirit_FadeIn'}
	max_alpha = 0.5
	falpha = 0.0
	change \{S_Alpha = 0.0}
	begin
	if ($S_Alpha < <max_alpha>)
		<falpha> = ($S_Alpha + (0.005))
		if (<falpha> < 0.0)
			<falpha> = 0.0
		elseif (<falpha> > <max_alpha>)
			<falpha> = <max_alpha>
		endif
		change S_Alpha = <falpha>
	endif
	SetMaterialProperty mat = 'Z_Spirit_Primary' prop = 'm_psPass0MaterialColor' x = ($S_Red) y = ($S_Green) z = ($S_Blue) w = ($S_Alpha)
	printf \{channel = Spirit
		'Alpha %p'
		p = $S_Alpha}
	Wait \{3
		frame}
	if ($S_Alpha >= <max_alpha>)
		break
	endif
	repeat
endscript

script Spirit_FadeOut 
	if ($can_CreateSpirit = 0)
		return
	endif
	max_alpha = 0.5
	falpha = 0.5
	printf \{channel = Spirit
		'Spirit_FadeIn'}
	begin
	if ($S_Alpha > 0.0)
		<falpha> = ($S_Alpha - (0.01))
		if (<falpha> < 0.0)
			<falpha> = 0.0
		elseif (<falpha> > <max_alpha>)
			<falpha> = <max_alpha>
		endif
		change S_Alpha = <falpha>
	endif
	SetMaterialProperty mat = 'Z_Spirit_Primary' prop = 'm_psPass0MaterialColor' x = ($S_Red) y = ($S_Green) z = ($S_Blue) w = ($S_Alpha)
	printf \{channel = Spirit
		'Alpha %p'
		p = $S_Alpha}
	Wait \{3
		frame}
	if ($S_Alpha <= 0.0)
		break
	endif
	repeat
endscript

script Spirit_ResetSpiritAlpha 
	if ($can_CreateSpirit = 1)
		change \{S_Alpha = 0.0}
		SetMaterialProperty mat = 'Z_Spirit_Primary' prop = 'm_psPass0MaterialColor' x = ($S_Red) y = ($S_Green) z = ($S_Blue) w = ($S_Alpha)
		Wait \{1
			frame}
	endif
endscript
