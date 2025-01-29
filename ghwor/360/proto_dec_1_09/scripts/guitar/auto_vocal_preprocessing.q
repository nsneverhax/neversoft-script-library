phonetic_wieghts = [
	{
		weight = 0.63
		phon_anim = 0
		extendability = 0.1
		cullability = 4.0
	}
	{
		weight = 1.3399999
		phon_anim = 1
		extendability = 0.1
		cullability = 1.0
	}
	{
		weight = 0.53
		phon_anim = 2
		extendability = 0.1
		cullability = 1.0
	}
	{
		weight = 1.3
		phon_anim = 3
		extendability = 0.05
		cullability = 0.0
	}
	{
		weight = 1.3
		phon_anim = 3
		extendability = 0.05
		cullability = 0.0
	}
	{
		weight = 1.3
		phon_anim = 3
		extendability = 0.05
		cullability = 0.0
	}
	{
		weight = 0.8
		phon_anim = 4
		extendability = 1.0
		cullability = 0.5
	}
	{
		weight = 1.56
		phon_anim = 5
		extendability = 1.0
		cullability = 0.8
	}
	{
		weight = 0.58
		phon_anim = 5
		extendability = 1.0
		cullability = 0.8
	}
	{
		weight = 1.52
		phon_anim = 6
		extendability = 1.0
		cullability = 1.0
	}
	{
		weight = 1.52
		phon_anim = 6
		extendability = 1.0
		cullability = 1.0
	}
	{
		weight = 1.3
		phon_anim = 7
		extendability = 0.1
		cullability = 0.2
	}
	{
		weight = 1.25
		phon_anim = 8
		extendability = 1.0
		cullability = 1.0
	}
	{
		weight = 1.38
		phon_anim = 9
		extendability = 1.0
		cullability = 1.0
	}
	{
		weight = 1.3399999
		phon_anim = 9
		extendability = 1.0
		cullability = 1.0
	}
	{
		weight = 1.51
		phon_anim = 10
		extendability = 0.05
		cullability = 0.5
	}
	{
		weight = 0.54
		phon_anim = 10
		extendability = 0.05
		cullability = 1.0
	}
	{
		weight = 1.25
		phon_anim = 11
		extendability = 1.0
		cullability = 1.0
	}
	{
		weight = 1.21
		phon_anim = 12
		extendability = 0.1
		cullability = 1.0
	}
	{
		weight = 0.54
		phon_anim = 12
		extendability = 0.1
		cullability = 1.0
	}
	{
		weight = 1.21
		phon_anim = 12
		extendability = 0.1
		cullability = 1.0
	}
	{
		weight = 0.94
		phon_anim = 12
		extendability = 0.1
		cullability = 1.0
	}
	{
		weight = 1.2
		phon_anim = 13
		extendability = 1.0
		cullability = 1.0
	}
	{
		weight = 0.58
		phon_anim = 13
		extendability = 1.0
		cullability = 1.0
	}
	{
		weight = 1.52
		phon_anim = 14
		extendability = 1.0
		cullability = 1.0
	}
	{
		weight = 1.3
		phon_anim = 15
		extendability = 0.2
		cullability = 1.0
	}
	{
		weight = 1.16
		phon_anim = 16
		extendability = 0.05
		cullability = 1.0
	}
	{
		weight = 0.2
		phon_anim = 16
		extendability = 0.05
		cullability = 1.0
	}
	{
		weight = 0.71
		phon_anim = 16
		extendability = 1.0
		cullability = 1.0
	}
	{
		weight = 1.25
		phon_anim = 17
		extendability = 0.1
		cullability = 1.0
	}
	{
		weight = 0.94
		phon_anim = 17
		extendability = 0.1
		cullability = 1.0
	}
	{
		weight = 1.16
		phon_anim = 17
		extendability = 0.1
		cullability = 1.0
	}
	{
		weight = 0.85
		phon_anim = 18
		extendability = 1.0
		cullability = 1.0
	}
	{
		weight = 0.63
		phon_anim = 19
		extendability = 0.1
		cullability = 1.0
	}
	{
		weight = 0.1
		phon_anim = 19
		extendability = 0.1
		cullability = 1.0
	}
	{
		weight = 0.71
		phon_anim = 20
		extendability = 0.15
		cullability = 1.0
	}
	{
		weight = 1.38
		phon_anim = 21
		extendability = 1.0
		cullability = 1.0
	}
	{
		weight = 1.3399999
		phon_anim = 22
		extendability = 1.0
		cullability = 1.0
	}
	{
		weight = 1.3
		phon_anim = 7
		extendability = 1.0
		cullability = 1.0
	}
]
standard_cullability = 50.0
g_distance_fudge_factor_for_rounding = 0.1
phoneme_max = 2.0
phoneme_base = 180.0
av_global_array = [
]
sentance_index = 0
test_sentance = [
	[
		j
		ey
		s
		ah
		n
	]
	[
		l
		ay
		k
		s
	]
	[
		t
		uw
	]
	[
		w
		aa
		ch
	]
	[
		f
		y
		uw
		ch
		er
		ae
		m
		ah
	]
]

script obtain_next_word 
	index = ($sentance_index)
	next_word = (($test_sentance) [<index>])
	fastgetarraysize array = <next_word>
	nat_length = 0.0
	index = 0
	begin
	phoneme = (<next_word> [<index>])
	obtain_phon_index phoneme = <phoneme>
	nat_length = (<nat_length> + (($phonetic_wieghts [<phon_index>].weight) * ($phoneme_base)))
	index = (<index> + 1)
	repeat <array_Size>
	next_length = (<nat_length> * 0.8)
	next_word_time = $next_word_time
	fastgetarraysize array = ($test_sentance)
	if ($sentance_index < (<array_Size> -1))
		changeglobalinteger global_name = sentance_index new_value = ($sentance_index + 1)
		changeglobalfloat global_name = next_word_time new_value = ($next_word_time + <next_length> + 10.0)
	else
		changeglobalinteger \{global_name = sentance_index
			new_value = 0}
		changeglobalfloat global_name = next_word_time new_value = ($next_word_time + <next_length> + 1500.0)
	endif
	next_word = [p ey n]
	next_length = 2413.0
	next_word_time = 1000.0
	return next_word = <next_word> next_length = <next_length> next_word_time = <next_word_time>
endscript
next_word_time = 5000.0

script obtain_phon_index 
	phon_index = 0
	switch <phoneme>
		case h
		phon_index = 0
		case th
		phon_index = 1
		case dh
		phon_index = 2
		case m
		phon_index = 3
		case b
		phon_index = 4
		case p
		phon_index = 5
		case uw
		phon_index = 6
		case ao
		phon_index = 7
		case aa
		phon_index = 8
		case ey
		phon_index = 9
		case ae
		phon_index = 10
		case r
		phon_index = 11
		case ow
		phon_index = 12
		case ah
		phon_index = 13
		case uh
		phon_index = 14
		case f
		phon_index = 15
		case v
		phon_index = 16
		case ay
		phon_index = 17
		case sh
		phon_index = 18
		case zh
		phon_index = 19
		case ch
		phon_index = 20
		case j
		phon_index = 21
		case iy
		phon_index = 22
		case ih
		phon_index = 23
		case eh
		phon_index = 24
		case l
		phon_index = 25
		case k
		phon_index = 26
		case g
		phon_index = 27
		case ng
		phon_index = 28
		case s
		phon_index = 29
		case z
		phon_index = 30
		case t
		phon_index = 31
		case y
		phon_index = 32
		case d
		phon_index = 33
		case n
		phon_index = 34
		case w
		phon_index = 35
		case aw
		phon_index = 36
		case oy
		phon_index = 37
		case er
		phon_index = 38
	endswitch
	return phon_index = <phon_index>
	phoneme = ah
endscript

script prep_phon_globals 
	fastgetarraysize array = ($phonetic_wieghts)
	index = 0
	total = 0.0
	begin
	total = (($phonetic_wieghts [<index>].weight) + <total>)
	index = (<index> + 1)
	repeat <array_Size>
	average = (<total> / <array_Size>)
	Change phoneme_base = <average>
	Normal = (1.0 / <average>)
	index = 0
	begin
	newweight = (($phonetic_wieghts [<index>].weight))
	newweight = (<newweight> * <Normal>)
	tempstruct = ($phonetic_wieghts [<index>])
	updatestructelement struct = <tempstruct> element = weight value = <newweight>
	SetArrayElement array_name = phonetic_wieghts globalarray index = <index> new_value = <newstruct>
	index = (<index> + 1)
	repeat <array_Size>
	array = ($phonetic_wieghts)
endscript

script temp_cull_vocals 
	av_local_array = $<av_global_array>
	fastgetarraysize array = <av_local_array>
	begin
	newstruct = {time = 0.0 length = 0.0 phon = 0 cullability = 0.0 cull = FALSE}
	index = 0
	cull_performed = FALSE
	begin
	cull_action = dont_cull
	cullability = ((<av_local_array>) [<index>].cullability)
	length = ((<av_local_array>) [<index>].length)
	cull = ((<av_local_array>) [<index>].cull)
	temp_time = ((<av_local_array>) [<index>].time)
	temp_phon = ((<av_local_array>) [<index>].phon)
	if (<cull> = FALSE)
		if (<index> > 0)
			distance_from_last = (((<av_local_array>) [<index>].time) - (((<av_local_array>) [(<index> -1)].time) + ((<av_local_array>) [(<index> -1)].length)))
			last_length = ((<av_local_array>) [(<index> -1)].length)
			if (<distance_from_last> < $g_distance_fudge_factor_for_rounding)
				distance_from_last = 0.0
			endif
		else
			distance_from_last = 100000.0
			last_length = 100000.0
		endif
		if (<index> < (<array_Size> -1))
			distance_to_next = (((<av_local_array>) [(<index> + 1)].time) - (((<av_local_array>) [<index>].time) + ((<av_local_array>) [<index>].length)))
			next_length = ((<av_local_array>) [(<index> + 1)].length)
			next_cullability = ((<av_local_array>) [<index> + 1].cullability)
			next_cull = ((<av_local_array>) [<index> + 1].cull)
			if (<distance_to_next> < $g_distance_fudge_factor_for_rounding)
				distance_to_next = 0.0
			endif
		else
			distance_to_next = 100000.0
			next_length = 100000.0
			next_cullability = 0.0
			next_cull = true
		endif
		if (<length> < (<cullability> * ($standard_cullability)))
			if (<next_cull> = FALSE)
				cull_diff = (<cullability> * ($standard_cullability))
				next_cull_diff = (<next_cullability> * ($standard_cullability))
				if (<next_length> < <next_cull_diff>)
					cull_diff = (<cull_diff> - <length>)
					next_cull_diff = (<next_cull_diff> - <next_length>)
					if (<next_cull_diff> > <cull_diff>)
						cull_action = skip
					endif
				endif
			endif
			if (<cull_action> != skip)
				if (<distance_to_next> < <distance_from_last>)
					cull_action = forward
				elseif (<distance_to_next> > <distance_from_last>)
					cull_action = back
				else
					if (<next_length> < <last_length>)
						cull_action = forward
					else
						cull_action = back
					endif
				endif
			else
				cull_performed = true
			endif
		else
		endif
		if (<cull_action> = dont_cull)
			temp_struct = ((<av_local_array>) [<index>])
			time = (<temp_struct>.time)
			length = (<temp_struct>.length)
			phon = (<temp_struct>.phon)
			cullability = (<temp_struct>.cullability)
			updatestructelement struct = <newstruct> element = time value = <time>
			updatestructelement struct = <newstruct> element = length value = <length>
			updatestructelement struct = <newstruct> element = phon value = <phon>
			updatestructelement struct = <newstruct> element = cullability value = <cullability>
			updatestructelement struct = <newstruct> element = cull value = true
			SetArrayElement ArrayName = av_local_array index = <index> NewValue = <newstruct>
		elseif (<cull_action> = forward)
			cull_performed = true
			temp_struct1 = ((<av_local_array>) [<index>])
			temp_struct2 = ((<av_local_array>) [(<index> + 1)])
			time1 = (<temp_struct1>.time)
			time2 = (<temp_struct2>.time)
			length2 = (<temp_struct2>.length)
			phon = (<temp_struct2>.phon)
			cullability = (<temp_struct2>.cullability)
			time = <time1>
			length = ((<time2> + <length2>) - <time1>)
			updatestructelement struct = <newstruct> element = time value = <time>
			updatestructelement struct = <newstruct> element = length value = <length>
			updatestructelement struct = <newstruct> element = phon value = <phon>
			updatestructelement struct = <newstruct> element = cullability value = <cullability>
			updatestructelement struct = <newstruct> element = cull value = FALSE
			SetArrayElement ArrayName = av_local_array index = <index> NewValue = <newstruct>
			RemoveArrayElement array = <av_local_array> index = (<index> + 1)
			av_local_array = <array>
			array_Size = (<array_Size> -1)
		elseif (<cull_action> = back)
			cull_performed = true
			temp_struct1 = ((<av_local_array>) [<index>])
			temp_struct2 = ((<av_local_array>) [(<index> -1)])
			time1 = (<temp_struct1>.time)
			time2 = (<temp_struct2>.time)
			length1 = (<temp_struct1>.length)
			length2 = (<temp_struct2>.length)
			phon = (<temp_struct2>.phon)
			cullability = (<temp_struct2>.cullability)
			time = <time2>
			length = ((<time1> + <length1>) - <time2>)
			updatestructelement struct = <newstruct> element = time value = <time>
			updatestructelement struct = <newstruct> element = length value = <length>
			updatestructelement struct = <newstruct> element = phon value = <phon>
			updatestructelement struct = <newstruct> element = cullability value = <cullability>
			updatestructelement struct = <newstruct> element = cull value = FALSE
			SetArrayElement ArrayName = av_local_array index = <index> NewValue = <newstruct>
			RemoveArrayElement array = <av_local_array> index = (<index> -1)
			av_local_array = <array>
			index = (<index> -1)
			array_Size = (<array_Size> -1)
		endif
	endif
	index = (<index> + 1)
	if (<index> >= <array_Size>)
		break
	endif
	repeat
	if (<cull_performed> = FALSE)
		break
	endif
	repeat
	fastgetarraysize array = <av_local_array>
	newstruct = {time = 0.0 length = 0.0 phon = 0}
	index = 0
	begin
	temp_struct = (<av_local_array> [<index>])
	time = (<temp_struct>.time)
	length = (<temp_struct>.length)
	phon = (<temp_struct>.phon)
	updatestructelement struct = <newstruct> element = time value = <time>
	updatestructelement struct = <newstruct> element = length value = <length>
	updatestructelement struct = <newstruct> element = phon value = <phon>
	SetArrayElement ArrayName = av_local_array index = <index> NewValue = <newstruct>
	index = (<index> + 1)
	repeat <array_Size>
	temp_add_syllable_length_variable av_global_array = <av_global_array> av_local_array = <av_local_array> array_Size = <array_Size>
endscript

script temp_add_syllable_length_variable 
	index = 0
	newstruct = {time = 0.0 length = 0.0 phon = 0 syllable = 0.0}
	begin
	index_depth = 1
	if (<index> < <array_Size>)
		starting_struct = ((<av_local_array>) [<index>])
		syllable = (<starting_struct>.length)
		begin
		if ((<index> + <index_depth>) >= <array_Size>)
			starting_struct = ((<av_local_array>) [<index>])
			break
		endif
		current_struct = ((<av_local_array>) [(<index> + <index_depth>)])
		next_entry_distance = ((<current_struct>.time) - ((<starting_struct>.time) + (<starting_struct>.length)))
		if (<next_entry_distance> < $g_distance_fudge_factor_for_rounding)
			updatestructelement struct = <newstruct> element = time value = (<current_struct>.time)
			updatestructelement struct = <newstruct> element = length value = (<current_struct>.length)
			updatestructelement struct = <newstruct> element = phon value = (<current_struct>.phon)
			updatestructelement struct = <newstruct> element = syllable value = 0.0
			SetArrayElement ArrayName = av_local_array index = (<index> + <index_depth>) NewValue = <newstruct>
			syllable = (<syllable> + (<current_struct>.length))
			starting_struct = <current_struct>
			index_depth = (<index_depth> + 1)
		else
			starting_struct = ((<av_local_array>) [<index>])
			break
		endif
		repeat
		updatestructelement struct = <newstruct> element = time value = (<starting_struct>.time)
		updatestructelement struct = <newstruct> element = length value = (<starting_struct>.length)
		updatestructelement struct = <newstruct> element = phon value = (<starting_struct>.phon)
		updatestructelement struct = <newstruct> element = syllable value = <syllable>
		SetArrayElement ArrayName = av_local_array index = <index> NewValue = <newstruct>
	else
		break
	endif
	index = (<index> + <index_depth>)
	repeat
	Change GlobalName = <av_global_array> NewValue = <av_local_array>
endscript
