0x1fc1a900 = [
]
0x0fd57e49 = [
]
0x09670ae3 = [
]

script 0xcdf25064 
	RequireParams \{[
			index
		]
		all}
	0x79340bf8 = ($0x426ce4d9 [<index>].0x79340bf8)
	if ((<0x79340bf8> [0]) = 0 || (<0x79340bf8> [1]) = 0 || (<0x79340bf8> [2]) = 0)
		return \{true}
	endif
	return \{FALSE}
endscript

script 0x08c09cad 
	RequireParams \{[
			index
		]
		all}
	0x79340bf8 = ($0x426ce4d9 [<index>].0x79340bf8)
	get_current_progression_stars
	if (<total_stars> >= (<0x79340bf8> [0]))
		return \{true}
	endif
	return \{FALSE}
endscript

script 0x96c7a033 
	RequireParams \{[
			index
		]
		all}
	0x79340bf8 = ($0x426ce4d9 [<index>].0x79340bf8)
	0xe04ad7a7
	if (<0x380889a0> >= (<0x79340bf8> [1]))
		return \{true}
	endif
	return \{FALSE}
endscript

script 0x6329d029 
	RequireParams \{[
			index
		]
		all}
	0x79340bf8 = ($0x426ce4d9 [<index>].0x79340bf8)
	0xb48922e0
	if (<num_songs_played> >= (<0x79340bf8> [2]))
		return \{true}
	endif
	return \{FALSE}
endscript

script 0x2a66b7c0 
	RequireParams \{[
			index
		]
		all}
	0x0380e044 = ($0x76127fe4 [<index>].0x0380e044)
	0xe04ad7a7
	if (<0x380889a0> >= <0x0380e044>)
		return \{true}
	endif
	return \{FALSE}
endscript

script 0xb48922e0 
	GetGlobalTags \{career_linking_progression
		param = num_songs_played}
	return num_songs_played = <num_songs_played>
endscript

script 0xe55bed32 
	0xb48922e0
	if (<num_songs_played> < 500)
		SetGlobalTags career_linking_progression params = {num_songs_played = (<num_songs_played> + 1)} Progression = true
	endif
endscript

script 0xd4b1373a 
	printf \{qs(0x06329aec)}
	0x73802420
	GetArraySize <0x63b02abd>
	if (<array_Size> > 0)
		formatText \{TextName = notification
			qs(0x246b7796)}
		if (<array_Size> > 1)
			formatText TextName = notification qs(0x15732756) n = <array_Size>
		endif
		displaynotification <notification> display_time = 3 position = topright
		gamemode_gettype
		if (<Type> != career)
			formatText \{TextName = notification
				qs(0x059ec76d)}
			displaynotification <notification> display_time = 3 position = topright
		endif
	endif
endscript

script 0xc6794ef5 
	printf \{qs(0x3fc3e591)}
	0xf206c009 = -1
	0xe04ad7a7
	GetArraySize \{$0x76127fe4}
	i = 0
	begin
	0x0380e044 = ($0x76127fe4 [<i>].0x0380e044)
	if (<0x380889a0> < <0x0380e044>)
		if ((<0x0380e044> < <0xf206c009>) || (<0xf206c009> = -1))
			0xf206c009 = <0x0380e044>
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	return 0xf206c009 = <0xf206c009>
endscript

script 0x29480f35 
	printf \{channel = clayton
		qs(0x559bc79d)}
	0x6f65eee2 = []
	GetArraySize \{$0x76127fe4}
	i = 0
	begin
	0x4d782c3b = FALSE
	if 0x2a66b7c0 index = <i>
		0x4d782c3b = true
	endif
	if GotParam \{UnlockAll}
		0x4d782c3b = true
	endif
	reward_struct = ($0x76127fe4 [<i>])
	if (<0x4d782c3b> = true)
		reward_type = (<reward_struct>.reward_type)
		switch (<reward_type>)
			case cas
			part = (<reward_struct>.part)
			desc_id = (<reward_struct>.desc_id)
			if NOT check_cas_item_unlocked_flag part = <part> desc_id = <desc_id> savegame = 0
				set_cas_item_unlocked_flag part = <part> desc_id = <desc_id> savegame = 0
				reward_name = (<reward_struct>.reward_name)
				description = {
					reward_name = <reward_name>
					reward_type = <reward_type>
				}
				printf channel = clayton qs(0x8e877e31) d = <reward_name>
				temp = [{}]
				SetArrayElement ArrayName = temp index = 0 NewValue = <description>
				0x6f65eee2 = (<0x6f65eee2> + <temp>)
			endif
			case character
			profile_idx = (<reward_struct>.profile_idx)
			profile_struct = ($0x6db04597 [<profile_idx>])
			if NOT is_profile_unlocked profile_struct = <profile_struct> savegame = 0
				unlock_profile id = (<profile_struct>.Name) savegame = 0
				reward_name = (<reward_struct>.reward_name)
				description = {
					reward_name = <reward_name>
					reward_type = <reward_type>
				}
				printf channel = clayton qs(0x8e877e31) d = <reward_name>
				temp = [{}]
				SetArrayElement ArrayName = temp index = 0 NewValue = <description>
				0x6f65eee2 = (<0x6f65eee2> + <temp>)
			endif
			default
			ScriptAssert qs(0x23ad9541) d = <reward_type>
		endswitch
	endif
	i = (<i> + 1)
	repeat <array_Size>
	Change 0x09670ae3 = <0x6f65eee2>
endscript

script 0x9a065b1d 
	printf \{qs(0xd4674782)}
	0x63b02abd = []
	GetGlobalTags \{career_linking_progression
		param = 0x0f424c6f}
	GetArraySize <0x0f424c6f>
	i = 0
	begin
	if ((<0x0f424c6f> [<i>]) < 0)
		0x8d85b33c = FALSE
		if 0x08c09cad index = <i>
			0x8d85b33c = true
		elseif 0x96c7a033 index = <i>
			0x8d85b33c = true
		elseif 0x6329d029 index = <i>
			0x8d85b33c = true
		endif
		if GotParam \{UnlockAll}
			0x8d85b33c = true
		endif
		if (<0x8d85b33c> = true)
			SetArrayElement ArrayName = 0x0f424c6f index = <i> NewValue = 0
			addintegerarrayelement array = <0x63b02abd> element = <i>
			0x63b02abd = <array>
			printf \{channel = clayton
				qs(0x554425ee)}
			printstruct channel = clayton <...>
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	SetGlobalTags career_linking_progression params = {0x0f424c6f = <0x0f424c6f>} Progression = true
	0x40f6624b = ($0x0fd57e49)
	<0x63b02abd> = (<0x63b02abd> + <0x40f6624b>)
	printf \{channel = clayton
		qs(0x1ff71167)}
	printstruct channel = clayton <...>
	Change \{0x0fd57e49 = [
		]}
	Change 0x1fc1a900 = <0x63b02abd>
endscript

script 0x73802420 
	return 0x63b02abd = ($0x1fc1a900)
endscript

script 0x9086063e 
	return 0x6f65eee2 = ($0x09670ae3)
endscript

script 0x4e291fb2 
	printf \{qs(0xe5f5b9cd)}
	0x9db8032b = []
	GetGlobalTags \{career_linking_progression
		param = 0x0f424c6f}
	GetArraySize <0x0f424c6f>
	i = 0
	begin
	if ((<0x0f424c6f> [<i>]) >= 0)
		addintegerarrayelement array = <0x9db8032b> element = <i>
		0x9db8032b = <array>
	endif
	i = (<i> + 1)
	repeat <array_Size>
	printstruct <...>
	return 0x9db8032b = <0x9db8032b>
endscript
