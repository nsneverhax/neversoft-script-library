0xa6296784 = {
	Default = [
	]
	difficulty = [
	]
	title = [
	]
	instrument = [
	]
	0x5c9e5cb7 = [
	]
	0xf3ab8511 = [
	]
}
0xda6118a7 = [
	Default
	difficulty
	title
	instrument
	0x5c9e5cb7
]
0xa7957b85 = 0
0xc547133c = {
	guitar = 1
	bass = 2
	drum = 3
	vocals = 4
	any = 0
}

script 0xef0e0206 
	0x4e291fb2
	return 0xc271e730 = <0x9db8032b>
endscript

script 0xd65d545d 
	if GotParam \{sorted}
		return list = ($0xa6296784.($0xda6118a7 [($0xa7957b85)]))
	else
		return list = ($0xa6296784.0xf3ab8511)
	endif
endscript

script 0x81e18800 
	0xe8644705 = ($0xa6296784)
	0xef0e0206
	setstructureparam struct_name = 0xe8644705 param = 0xf3ab8511 value = <0xc271e730>
	0x6e1b4b8d 0xc271e730 = <0xc271e730>
	setstructureparam struct_name = 0xe8644705 param = Default value = <sorted_array>
	0x3e296f7f 0xc271e730 = <0xc271e730>
	setstructureparam struct_name = 0xe8644705 param = difficulty value = <sorted_array>
	0xba135d64 0xc271e730 = <0xc271e730>
	setstructureparam struct_name = 0xe8644705 param = title value = <sorted_array>
	0xb9fd694d 0xc271e730 = <0xc271e730>
	setstructureparam struct_name = 0xe8644705 param = instrument value = <sorted_array>
	0x0a4d5813 0xc271e730 = <0xc271e730>
	setstructureparam struct_name = 0xe8644705 param = 0x5c9e5cb7 value = <sorted_array>
	Change 0xa6296784 = <0xe8644705>
endscript

script 0x6e1b4b8d 
	RequireParams \{[
			0xc271e730
		]
		all}
	GetArraySize \{$0x390a8273}
	0xdaa8abeb = []
	if (<array_Size> > 0)
		i = 0
		begin
		AddArrayElement array = <0xdaa8abeb> element = (($0x390a8273 [<i>]).request_id)
		0xdaa8abeb = <array>
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	GetGlobalTags savegame = <savegame> career_linking_progression
	0xebe08da8 {
		array = <0xc271e730>
		comparator = 0x2800a9e8
		0x0649f2e3 = {
			0x0f424c6f = <0x0f424c6f>
			0xdaa8abeb = <0xdaa8abeb>
		}
	}
	return sorted_array = <sorted_array>
endscript

script 0xba135d64 
	RequireParams \{[
			0xc271e730
		]
		all}
	sorted_array = <0xc271e730>
	temp = []
	0xe92c39ff = 0
	index = 0
	GetArraySize <sorted_array>
	if (<array_Size> > 0)
		i = 0
		begin
		j = 0
		begin
		if ((<j> + 1) < <array_Size>)
			0x0bc7315e = ($0x426ce4d9 [(<sorted_array> [<j>])].display_text)
			0xfae4eee2 = ($0x426ce4d9 [(<sorted_array> [(<j> + 1)])].display_text)
			if (<0xfae4eee2> < <0x0bc7315e>)
				0xe92c39ff = (<sorted_array> [<j>])
				SetArrayElement ArrayName = sorted_array index = <j> NewValue = (<sorted_array> [(<j> + 1)])
				SetArrayElement ArrayName = sorted_array index = (<j> + 1) NewValue = <0xe92c39ff>
			endif
		endif
		j = (<j> + 1)
		repeat <array_Size>
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return sorted_array = <sorted_array>
endscript

script 0xb9fd694d 
	RequireParams \{[
			0xc271e730
		]
		all}
	GetGlobalTags savegame = <savegame> career_linking_progression
	0xebe08da8 {
		array = <0xc271e730>
		comparator = 0x59a153bb
		0x0649f2e3 = {
			0x0f424c6f = <0x0f424c6f>
		}
	}
	return sorted_array = <sorted_array>
endscript

script 0x59a153bb 
	RequireParams \{[
			0x0f424c6f
			a
			b
		]
		all}
	0x60cb1b0a = ($0x426ce4d9 [<a>].instrument)
	0xe65f69a4 = ($0x426ce4d9 [<b>].instrument)
	diff = (($0xc547133c.<0x60cb1b0a>) - ($0xc547133c.<0xe65f69a4>))
	if (<diff> = 0)
		0xf656bdc4 a = <a> b = <b>
	else
		comparison = <diff>
	endif
	return comparison = <comparison>
endscript

script 0x10ac6192 
	RequireParams \{[
			fan_request
		]
		all}
	difficulty = ($0x426ce4d9 [<fan_request>].difficulty)
	GetArraySize <difficulty>
	0x664a6c1c = 0
	0xb0fcfd3d = 0
	if (<array_Size> > 0)
		i = 0
		begin
		if ((<difficulty> [<i>]) > 0)
			0x664a6c1c = (<0x664a6c1c> + 1)
			0xb0fcfd3d = (<0xb0fcfd3d> + (<difficulty> [<i>]))
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	if (<0x664a6c1c> > 0)
		return true 0xdf3b8bee = ((<0xb0fcfd3d> * 1.0) / <0x664a6c1c>)
	else
		return \{FALSE}
	endif
endscript

script 0x3e296f7f 
	RequireParams \{[
			0xc271e730
		]
		all}
	sorted_array = <0xc271e730>
	temp = []
	0xe92c39ff = 0
	index = 0
	GetArraySize <sorted_array>
	if (<array_Size> > 0)
		i = 0
		begin
		j = 0
		begin
		if ((<j> + 1) < <array_Size>)
			0x10ac6192 fan_request = (<sorted_array> [<j>])
			current_difficulty = <0xdf3b8bee>
			0x10ac6192 fan_request = (<sorted_array> [(<j> + 1)])
			next_difficulty = <0xdf3b8bee>
			if (<next_difficulty> < <current_difficulty>)
				0xe92c39ff = (<sorted_array> [<j>])
				SetArrayElement ArrayName = sorted_array index = <j> NewValue = (<sorted_array> [(<j> + 1)])
				SetArrayElement ArrayName = sorted_array index = (<j> + 1) NewValue = <0xe92c39ff>
			endif
		endif
		j = (<j> + 1)
		repeat <array_Size>
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return sorted_array = <sorted_array>
endscript

script 0x0a4d5813 
	RequireParams \{[
			0xc271e730
		]
		all}
	GetGlobalTags savegame = <savegame> career_linking_progression
	GetArraySize <0x0f424c6f>
	0x9ca497e6 = <array_Size>
	sorted_array = <0xc271e730>
	temp = []
	0xe92c39ff = 0
	index = 0
	GetArraySize <sorted_array>
	if (<array_Size> > 0)
		i = 0
		begin
		j = 0
		begin
		if ((<j> + 1) < <array_Size>)
			0x742226e2 = (<0x0f424c6f> [(<sorted_array> [<j>])])
			0x8501f95e = (<0x0f424c6f> [(<sorted_array> [(<j> + 1)])])
			if (<0x8501f95e> > <0x742226e2>)
				0xe92c39ff = (<sorted_array> [<j>])
				SetArrayElement ArrayName = sorted_array index = <j> NewValue = (<sorted_array> [(<j> + 1)])
				SetArrayElement ArrayName = sorted_array index = (<j> + 1) NewValue = <0xe92c39ff>
			endif
		endif
		j = (<j> + 1)
		repeat <array_Size>
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return sorted_array = <sorted_array>
endscript

script 0x871c2051 
	RequireParams \{[
			array
			Type
		]
		all}
	GetArraySize <array>
	if (<array_Size> > 0)
		i = 0
		begin
		switch <Type>
			case Name
			printf '%s' s = ($0x426ce4d9 [(<array> [<i>])].display_text)
			case instrument
			printf '%s' s = ($0x426ce4d9 [(<array> [<i>])].instrument)
			case difficulty
			0x10ac6192 fan_request = (<array> [<i>])
			printf '%s' s = <0xdf3b8bee>
			case 0xbb914f84
			GetGlobalTags savegame = <savegame> career_linking_progression
			GetArraySize <0x0f424c6f>
			if (<array_Size> > <i>)
				printf '%s' s = (<0x0f424c6f> [(<array> [<i>])])
			endif
		endswitch
		i = (<i> + 1)
		repeat <array_Size>
		printf \{'\\n'}
	endif
endscript

script 0xebe08da8 \{start = 0
		end = -1}
	0x40d51b52 \{[
			array
			comparator
		]
		all}
	if (<end> = -1)
		GetArraySize <array>
		array_Size = (<array_Size> - <start>)
	else
		array_Size = (<end> - <start> + 1)
	endif
	if (<array_Size> <= 1)
		return sorted_array = <array>
	endif
	repeat_count = 0
	begin
	<done> = 1
	<i> = <start>
	begin
	a = (<array> [<i>])
	b = (<array> [(<i> + 1)])
	<comparator> {
		<0x0649f2e3>
		a = <a>
		b = <b>
	}
	if (<comparison> > 0)
		SetArrayElement ArrayName = array index = <i> NewValue = <b>
		SetArrayElement ArrayName = array index = (<i> + 1) NewValue = <a>
		<done> = 0
	endif
	<i> = (<i> + 1)
	repeat (<array_Size> - 1)
	if (<done> = 1)
		break
	endif
	<repeat_count> = (<repeat_count> + 1)
	repeat
	return sorted_array = <array>
endscript

script 0x2800a9e8 
	RequireParams \{[
			0x0f424c6f
			0xdaa8abeb
			a
			b
		]
		all}
	0xa9dd444c = 0
	0x275243af = 0
	if ArrayContains array = <0xdaa8abeb> contains = <a>
		<0xa9dd444c> = 1
	endif
	if ArrayContains array = <0xdaa8abeb> contains = <b>
		<0x275243af> = 1
	endif
	if (<0xa9dd444c> = 1)
		if (<0x275243af> = 1)
			comparison = 0
		else
			comparison = -1
		endif
	elseif (<0x275243af> = 1)
		comparison = 1
	else
		0x5cb14b47 {
			0x0f424c6f = <0x0f424c6f>
			a = <a>
			b = <b>
		}
	endif
	if (<comparison> = 0)
		0xf656bdc4 a = <a> b = <b>
	endif
	return comparison = <comparison>
endscript

script 0x5cb14b47 
	RequireParams \{[
			0x0f424c6f
			a
			b
		]
		all}
	0xf1716e8d = (<0x0f424c6f> [<a>])
	0xc0997410 = (<0x0f424c6f> [<b>])
	if (<0xf1716e8d> = 5)
		if (<0xc0997410> = 5)
			comparison = 0
		else
			comparison = 1
		endif
	else
		if (<0xc0997410> = 5)
			comparison = -1
		else
			comparison = 0
		endif
	endif
	return comparison = <comparison>
endscript

script 0xf656bdc4 
	RequireParams \{[
			a
			b
		]
		all}
	0x10ac6192 fan_request = <a>
	0x847a378c = <0xdf3b8bee>
	0x10ac6192 fan_request = <b>
	0xf3e4e57c = <0xdf3b8bee>
	return comparison = (<0x847a378c> - <0xf3e4e57c>)
endscript
