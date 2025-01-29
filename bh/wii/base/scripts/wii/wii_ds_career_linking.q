0x191a06f6 = 0
0x8c776b95 = 0
0xcc60e48d = 0
0xa0a25f45 = 0
0x612dd249 = 0
0x67e99382 = 5
0x390a8273 = [
]
0x8a0103b9 = 0

script 0x26745167 
	KillSpawnedScript \{Name = monitor_controller_signal_strength}
	wiidscommunication :disconnect
	if isnabuild
		<mode> = 0x69e1949a
	else
		<mode> = 0x54dbf89d
	endif
	<settings> = ($ds_mode_settings.<mode>)
	get_current_band_name
	disconnect_network_wait
	if NOT wiidscommunication :connect target_ds_count = 1 ggid = (<settings>.ggid) host_name = <band_name>
		printf \{'DS connect failed'}
	else
		begin
		wiidscommunication :getstatus
		if (<current_ds_count> = 1)
			LaunchEvent \{Type = ds_connect
				target = ds_event_listener}
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	SpawnScriptLater \{monitor_controller_signal_strength}
endscript

script 0x9ff4f7dc 
	wiidscommunication :sendmessage \{disconnect}
endscript

script 0x12e6aa65 
	GetArraySize \{$0x426ce4d9}
	Change 0x191a06f6 = <array_Size>
	Change 0x8c776b95 = ($0x191a06f6 + 1)
	0xe04ad7a7
	0x842bbefe = <0x380889a0>
	0x0e541b57
	Change 0xa0a25f45 = <0x86a6b0be>
	printf \{channel = clayton
		qs(0xc54ef6d8)}
	printstruct channel = clayton <...>
	GetArraySize \{$0x390a8273}
	if (<array_Size> > 0)
		i = 0
		begin
		0x0216ac99 = ($0x390a8273 [<i>].request_id)
		printf channel = clayton qs(0x024445c0) d = <0x0216ac99>
		if NOT (<0x0216ac99> = $0x8c776b95)
			0x879f6263 = ($0x390a8273 [<i>].0x380889a0)
			0xc7e1aed1 request_id = <0x0216ac99> 0xe5376a6c = <0x879f6263>
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	0x28b1a984
	0xe04ad7a7
	Change 0xcc60e48d = <0x380889a0>
	Change 0x612dd249 = ($0xcc60e48d - <0x842bbefe>)
	wiidscommunication :sendmessage 0x27091bdb 0x380889a0 = ($0xcc60e48d)
endscript

script 0x47451783 
	counter = 0
	GetArraySize ($0x390a8273)
	if (<array_Size> > 0)
		begin
		if (($0x390a8273 [<counter>].request_id) = ($0x8c776b95))
			return \{FALSE}
		endif
		counter = (<counter> + 1)
		repeat <array_Size>
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script 0x4fa4e00f 
	0xe04ad7a7
	return 0x4f648dbf = (<0x380889a0> * ($0x8a7bf052))
endscript

script 0xe04ad7a7 
	if NOT ($enable_debug = 0)
		if ($0xae868f98 >= 0)
			return \{0x380889a0 = $0xae868f98}
		endif
	endif
	GetGlobalTags savegame = <savegame> career_linking_progression
	0x72b8a6e0 0x5855c4bf = <0x0f424c6f>
	return 0x380889a0 = <0x380889a0>
endscript

script 0x72b8a6e0 
	0x380889a0 = 0
	if (GotParam 0x5855c4bf)
		GetArraySize <0x5855c4bf>
		if (<array_Size> > 0)
			i = 0
			begin
			if ((<0x5855c4bf> [<i>]) >= 0)
				<0x380889a0> = (<0x380889a0> + <0x5855c4bf> [<i>])
			endif
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	return 0x380889a0 = <0x380889a0>
endscript

script 0x0e541b57 
	GetArraySize \{$0x390a8273}
	0x86a6b0be = 0
	if (<array_Size> > 0)
		i = 0
		begin
		if NOT (($0x390a8273 [<i>].request_id) = $0x8c776b95)
			<0x86a6b0be> = (<0x86a6b0be> + 1)
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return 0x86a6b0be = <0x86a6b0be>
endscript

script 0x74cac607 \{request_id = $0x8a0103b9}
	if ($0xa0a25f45 < $0x67e99382)
		0x3cff47dc 0x02ef075b = <request_id>
		0xf65cc2c2 request_id = <request_id> 0x380889a0 = <0x380889a0>
		wiidscommunication :sendmessage 0xa936db3d 0x02ef075b = <request_id> 0x380889a0 = <0x380889a0>
	else
		printf \{'DS cannot hold any more active fan requests!'}
	endif
endscript

script 0x37de6160 \{request_id = $0x8a0103b9}
	0x59933c8a request_id = <request_id>
	if (<0xaf597f85> = 1)
		0x8416173a request_id = <request_id>
		wiidscommunication :sendmessage 0x37de6160 0x02ef075b = <request_id>
	endif
endscript

script 0x59933c8a \{request_id = $0x8a0103b9}
	GetArraySize \{$0x390a8273}
	is_active = 0
	if (<array_Size> > 0)
		i = 0
		begin
		if (($0x390a8273 [<i>].request_id) = <request_id>)
			is_active = 1
			break
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	return 0xaf597f85 = <is_active>
endscript

script 0x8416173a \{request_id = $0x8a0103b9}
	GetArraySize \{$0x390a8273}
	if (<array_Size> > 0)
		i = 0
		begin
		if (($0x390a8273 [<i>].request_id) = <request_id>)
			setstructureparam array_name = 0x390a8273 array_index = <i> param = request_id value = ($0x8c776b95)
			Change 0xa0a25f45 = (($0xa0a25f45) - 1)
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script 0xf65cc2c2 request_id = <request_id> 0x380889a0 = <0x380889a0>
	GetArraySize \{$0x390a8273}
	if (<array_Size> > 0)
		i = 0
		begin
		if (($0x390a8273 [<i>].request_id) = $0x8c776b95)
			setstructureparam array_name = 0x390a8273 array_index = <i> param = request_id value = <request_id>
			setstructureparam array_name = 0x390a8273 array_index = <i> param = 0x380889a0 value = <0x380889a0>
			Change 0xa0a25f45 = (($0xa0a25f45) + 1)
			break
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
endscript

script 0x3cff47dc \{0x02ef075b = $0x8a0103b9}
	<0x380889a0> = 0
	if (<0x02ef075b> < 0 || <0x02ef075b> >= $0x191a06f6)
		ScriptAssert qs(0x08ac808b) d = <0x02ef075b>
		<0x02ef075b> = 0
	endif
	GetGlobalTags savegame = <savegame> career_linking_progression
	GetArraySize <0x0f424c6f>
	if (<array_Size> > 0)
		<0x380889a0> = (<0x0f424c6f> [<0x02ef075b>])
	endif
	return 0x380889a0 = <0x380889a0>
endscript

script 0xc7e1aed1 \{request_id = 0
		0xe5376a6c = 0}
	if (<request_id> < 0 || <request_id> >= $0x191a06f6)
		ScriptAssert qs(0xaaf6d24b) d = <request_id>
		<request_id> = 0
	endif
	GetGlobalTags savegame = <savegame> career_linking_progression
	<ArrayName> = 0x0f424c6f
	<0x842bbefe> = (<0x0f424c6f> [<request_id>])
	printf channel = clayton qs(0x6363e98e) d = <request_id> f = <0xe5376a6c>
	printstruct channel = clayton <...>
	if (<0xe5376a6c> > <0x842bbefe>)
		if (<0x842bbefe> < 0)
			0x40f6624b = ($0x0fd57e49)
			addintegerarrayelement array = <0x40f6624b> element = <request_id>
			Change 0x0fd57e49 = <array>
			printf channel = clayton qs(0x68a66ab0) d = <request_id>
		endif
		SetArrayElement ArrayName = <ArrayName> index = <request_id> NewValue = <0xe5376a6c>
		SetGlobalTags career_linking_progression params = {0x0f424c6f = <0x0f424c6f>} Progression = true
	endif
endscript

script 0x1ea8c0f3 \{request_id = 0}
	Change 0x8a0103b9 = <request_id>
endscript

script 0x126b3b2f \{request_id = $0x8a0103b9}
	if (<request_id> < 0 || <request_id> >= $0x191a06f6)
		ScriptAssert qs(0xcea07969) d = <request_id>
		<request_id> = 0
	endif
	return ($0x426ce4d9 [<request_id>])
endscript
