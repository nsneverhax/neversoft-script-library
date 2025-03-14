can_createspirit = 1
s_red = 0.0
s_green = 0.0
s_blue = 0.0
s_alpha = 0.0
velocity = -0.05

script change_spirits_color 
	printf \{channel = spirit
		'spirit - change_Spirits_Color'}
	switch <performance>
		case poor
		printf \{channel = spirit
			'spirit - performance=POOR'}
		if scriptisrunning \{spirit_changeto_yellow}
			printf \{channel = spirit
				'killspawnedscript Spirit_ChangeTo_Yellow '}
			killspawnedscript \{name = spirit_changeto_yellow}
		endif
		if scriptisrunning \{spirit_changeto_red}
			return
		else
			spawnscriptnow \{spirit_changeto_red}
		endif
		case medium
		printf \{channel = venue
			'spirit - performance=MEDIUM'}
		if scriptisrunning \{spirit_changeto_red}
			printf \{channel = venue
				' killspawnedscript Spirit_ChangeTo_Red'}
			killspawnedscript \{name = spirit_changeto_red}
		endif
		if scriptisrunning \{spirit_changeto_green}
			printf \{channel = venue
				'killspawnedscript Spirit_ChangeTo_Green'}
			killspawnedscript \{name = spirit_changeto_green}
		endif
		if scriptisrunning \{spirit_changeto_yellow}
			return
		else
			spawnscriptnow \{spirit_changeto_yellow}
		endif
		case good
		printf \{channel = venue
			'spirit - performance=GOOD'}
		if scriptisrunning \{spirit_changeto_yellow}
			printf \{channel = venue
				'killspawnedscript Spirit_ChangeTo_Yellow'}
			killspawnedscript \{name = spirit_changeto_yellow}
		endif
		if scriptisrunning \{spirit_changeto_green}
			return
		else
			spawnscriptnow \{spirit_changeto_green}
		endif
	endswitch
endscript

script spirit_changeto_red 
	printf \{channel = spirit
		'Spirit_ChangeTo_Red'}
	max_red = 2.5
	velocity_max = 0.45000002
	begin
	if ($s_green > 0.0)
		<fgreen> = ($s_green + (-0.05))
		if (<fgreen> < 0.0)
			<fgreen> = 0.0
		endif
		change s_green = <fgreen>
	endif
	if ($s_red < <max_red>)
		<frouge> = ($s_red + (0.05))
		if (<frouge> < 0.0)
			<frouge> = 0.0
		elseif (<frouge> > <max_red>)
			<frouge> = <max_red>
		endif
		change s_red = <frouge>
	endif
	if ($s_blue > 0.0)
		<fblue> = ($s_blue + (-0.0))
		if (<fblue> < 0.0)
			<fblue> = 0.0
		endif
		change s_blue = <fblue>
	endif
	printf channel = spirit 'Velocity_Max av %p' p = <velocity_max>
	printf \{channel = spirit
		'Velocity av %p'
		p = $velocity}
	change velocity = <velocity_max>
	printf \{channel = spirit
		'Velocity af %p'
		p = $velocity}
	printf \{channel = spirit
		'///////////////////////////////////////////////'}
	printf \{channel = spirit
		'Spirit_ChangeTo_Red'}
	printf \{channel = spirit
		'///////////////////////////////////////////////'}
	printf \{channel = spirit
		'Velocity %p'
		p = $velocity}
	printf \{channel = spirit
		'color Blue %p'
		p = $s_blue}
	printf \{channel = spirit
		'color Red %p'
		p = $s_red}
	printf \{channel = spirit
		'color Green %p'
		p = $s_green}
	printf \{channel = spirit
		'///////////////////////////////////////////////'}
	setmaterialproperty mat = 'Z_Spirit_Primary' prop = 'm_psPass0MaterialColor' x = ($s_red) y = ($s_green) z = ($s_blue) w = ($s_alpha)
	setmaterialproperty mat = 'Z_Spirit_Primary' prop = 'm_velocityU' x = ($velocity)
	wait \{3
		frame}
	if (($s_red = <max_red>) && ($s_green = 0.0) && ($s_blue = 0.0) && ($velocity = <velocity_max>))
		return
	else
		repeat
	endif
endscript

script spirit_changeto_green 
	printf \{channel = spirit
		'Spirit_ChangeTo_Green'}
	max_green = 2.5
	velocity_max = -0.9
	begin
	if ($s_red > 0.0)
		<frouge> = ($s_red + (-0.05))
		if (<frouge> < 0.0)
			<frouge> = 0.0
		endif
		change s_red = <frouge>
	endif
	if ($s_green < <max_green>)
		<fgreen> = ($s_green + (0.05))
		if (<fgreen> < 0.0)
			<fgreen> = 0.0
		elseif (<fgreen> > <max_green>)
			<fgreen> = <max_green>
		endif
		change s_green = <fgreen>
	endif
	if ($s_blue > 0.0)
		<fblue> = ($s_blue + (-0.05))
		if (<fblue> < 0.0)
			<fblue> = 0.0
		endif
		change s_blue = <fblue>
	endif
	change velocity = <velocity_max>
	printf \{channel = spirit
		'///////////////////////////////////////////////'}
	printf \{channel = spirit
		'Spirit_ChangeTo_Green'}
	printf \{channel = spirit
		'///////////////////////////////////////////////'}
	printf \{channel = spirit
		'Velocity %p'
		p = $velocity}
	printf \{channel = spirit
		'color Blue %p'
		p = $s_blue}
	printf \{channel = spirit
		'color Red %p'
		p = $s_red}
	printf \{channel = spirit
		'color Green %p'
		p = $s_green}
	printf \{channel = spirit
		'///////////////////////////////////////////////'}
	setmaterialproperty mat = 'Z_Spirit_Primary' prop = 'm_psPass0MaterialColor' x = ($s_red) y = ($s_green) z = ($s_blue) w = ($s_alpha)
	setmaterialproperty mat = 'Z_Spirit_Primary' prop = 'm_velocityU' x = ($velocity)
	wait \{5
		frame}
	if (($s_red = 0.0) && ($s_green = <max_green>) && ($s_blue = 0.0) && ($velocity = <velocity_max>))
		return
	else
		repeat
	endif
endscript

script spirit_changeto_yellow 
	printf \{channel = spirit
		'Spirit_ChangeTo_Yellow'}
	max_green = 2.5
	max_red = 2.5
	velocity_max = -0.45000002
	begin
	if ($s_red < <max_red>)
		<frouge> = ($s_red + (0.05))
		if (<frouge> < 0.0)
			<frouge> = 0.0
		elseif (<frouge> > <max_red>)
			<frouge> = <max_red>
		endif
		change s_red = <frouge>
	else
		s_red = <max_red>
	endif
	if ($s_green < <max_green>)
		<fgreen> = ($s_green + (0.05))
		if (<fgreen> < 0.0)
			<fgreen> = 0.0
		elseif (<fgreen> > <max_green>)
			<fgreen> = <max_green>
		endif
		change s_green = <fgreen>
	else
		s_green = <max_green>
	endif
	if ($s_blue > 0.0)
		<fblue> = ($s_blue + (-0.05))
		if (<fblue> < 0.0)
			<fblue> = 0.0
		endif
		change s_blue = <fblue>
	endif
	printf channel = spirit 'Velocity_Max av %p' p = <velocity_max>
	printf \{channel = spirit
		'Velocity av %p'
		p = $velocity}
	change velocity = <velocity_max>
	printf channel = spirit 'Velocity_Max after %p' p = <velocity_max>
	printf \{channel = spirit
		'Velocity after %p'
		p = $velocity}
	printf \{channel = spirit
		'///////////////////////////////////////////////'}
	printf \{channel = spirit
		'Spirit_ChangeTo_Yellow'}
	printf \{channel = spirit
		'///////////////////////////////////////////////'}
	printf \{channel = spirit
		'Velocity %p'
		p = $velocity}
	printf \{channel = spirit
		'color Blue %p'
		p = $s_blue}
	printf \{channel = spirit
		'color Red %p'
		p = $s_red}
	printf \{channel = spirit
		'color Green %p'
		p = $s_green}
	printf \{channel = spirit
		'///////////////////////////////////////////////'}
	setmaterialproperty mat = 'Z_Spirit_Primary' prop = 'm_psPass0MaterialColor' x = ($s_red) y = ($s_green) z = ($s_blue) w = ($s_alpha)
	setmaterialproperty mat = 'Z_Spirit_Primary' prop = 'm_velocityU' x = ($velocity)
	wait \{5
		frame}
	if (($s_red = <max_red>) && ($s_green = <max_green>) && ($s_blue = 0.0) && ($velocity = <velocity_max>))
		return
	else
		repeat
	endif
endscript

script spirit_fadein 
	if ($can_createspirit = 0)
		return
	endif
	printf \{channel = spirit
		'Spirit_FadeIn'}
	max_alpha = 0.5
	falpha = 0.0
	change \{s_alpha = 0.0}
	begin
	if ($s_alpha < <max_alpha>)
		<falpha> = ($s_alpha + (0.005))
		if (<falpha> < 0.0)
			<falpha> = 0.0
		elseif (<falpha> > <max_alpha>)
			<falpha> = <max_alpha>
		endif
		change s_alpha = <falpha>
	endif
	setmaterialproperty mat = 'Z_Spirit_Primary' prop = 'm_psPass0MaterialColor' x = ($s_red) y = ($s_green) z = ($s_blue) w = ($s_alpha)
	printf \{channel = spirit
		'Alpha %p'
		p = $s_alpha}
	wait \{3
		frame}
	if ($s_alpha >= <max_alpha>)
		break
	endif
	repeat
endscript

script spirit_fadeout 
	if ($can_createspirit = 0)
		return
	endif
	max_alpha = 0.5
	falpha = 0.5
	printf \{channel = spirit
		'Spirit_FadeIn'}
	begin
	if ($s_alpha > 0.0)
		<falpha> = ($s_alpha - (0.01))
		if (<falpha> < 0.0)
			<falpha> = 0.0
		elseif (<falpha> > <max_alpha>)
			<falpha> = <max_alpha>
		endif
		change s_alpha = <falpha>
	endif
	setmaterialproperty mat = 'Z_Spirit_Primary' prop = 'm_psPass0MaterialColor' x = ($s_red) y = ($s_green) z = ($s_blue) w = ($s_alpha)
	printf \{channel = spirit
		'Alpha %p'
		p = $s_alpha}
	wait \{3
		frame}
	if ($s_alpha <= 0.0)
		break
	endif
	repeat
endscript

script spirit_resetspiritalpha 
	if ($can_createspirit = 1)
		change \{s_alpha = 0.0}
		setmaterialproperty mat = 'Z_Spirit_Primary' prop = 'm_psPass0MaterialColor' x = ($s_red) y = ($s_green) z = ($s_blue) w = ($s_alpha)
		wait \{1
			frame}
	endif
endscript
