
script 0x1e464d15 
	setscriptcannotpause
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	KillSpawnedScript \{Name = 0xb20ce9b6}
	0x8dbdaee4 \{'create_songpreview'}
	0xb17a28cd \{condition = {
			0xdffcb66f
		}}
	0x8dbdaee4 \{'create_songpreview wait complete'}
	if NOT ScriptIsRunning \{0xb4be2944}
		0x8dbdaee4 \{'create_songpreview creating'}
		SpawnScriptNow \{0xb4be2944}
	endif
endscript

script 0xb20ce9b6 
	setscriptcannotpause
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	KillSpawnedScript \{Name = 0x1e464d15}
	0xb17a28cd \{condition = {
			0xdffcb66f
		}}
	if ScriptIsRunning \{0xb4be2944}
		KillSpawnedScript \{Name = 0xb4be2944}
	endif
endscript

script 0x1621ea7b 
	Change \{0xe74dd00a = 1}
endscript

script 0xbd6424fc 
	Change \{0xe74dd00a = 0}
endscript

script 0x2e9b1633 

	Change 0x3e0869cc = <song>
endscript

script 0xe085ec1f 
	return \{song = $0x3e0869cc}
endscript

script 0xc337ea4c 
	0x2e9b1633 \{song = None}
endscript

script 0xdffcb66f 
	if NOT (($0x4b2e5600) && (0x9d355f18 = 0))
		return \{true}
	else
		return \{FALSE}
	endif
endscript
0xe74dd00a = 0
0x3e0869cc = None
0x07e68d1f = None
0x9d355f18 = 0
0x4b2e5600 = 0

script 0xf08cb507 
	Change 0x9d355f18 = ($0x9d355f18 + 1)
endscript

script 0xce1c8303 
	if ($0x9d355f18 = 0)
		0x93d8d5cf \{'Attempted to decriment songpreview lock wait count when it was already zero.'}
	endif
	Change 0x9d355f18 = ($0x9d355f18 - 1)
endscript

script 0x4f8de502 
	OnExitRun \{0xce1c8303}
	0xf08cb507
	if GotParam \{0x9b8db44e}
		if ($0x4b2e5600 = 1)
			0x93d8d5cf \{'Expected songpreview lock to be free, but another script has already acquired it.'}
		endif
		Change \{0x4b2e5600 = 1}
		return
	endif
	begin
	if NOT ($0x4b2e5600 = 1)
		Change \{0x4b2e5600 = 1}
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script 0xd7bc4865 
	if NOT ($0x4b2e5600)
		0x93d8d5cf \{'Attempted to release songpreview lock, but it wasn\'t acquired.'}
	endif
	Change \{0x4b2e5600 = 0}
endscript

script 0xb4be2944 
	setscriptcannotpause
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request
		checkwholecallstack}
	OnExitRun \{0xeba59f8f}
	0xd326a501
	begin
	0x9b98d108
	0x60b102a7
	WaitOneGameFrame
	repeat
endscript

script 0xd326a501 
	0x8dbdaee4 \{'init_songpreview_monitor'}
	setscriptcannotpause
	OnExitRun \{0xd7bc4865}
	0x4f8de502 \{0x9b8db44e}
	songstoppreview
endscript

script 0xeba59f8f 
	0x8dbdaee4 \{'deinit_songpreview_monitor'}
	setscriptcannotpause
	OnExitRun \{0xd7bc4865}
	0x4f8de502 \{0x9b8db44e}
	if NOT ($0x07e68d1f = None)
		songstoppreview
		Change \{0x07e68d1f = None}
	endif
endscript

script 0x9b98d108 
	OnExitRun \{0xd7bc4865}
	0x4f8de502 \{0x9b8db44e}
	target = ($0x3e0869cc)
	if (<target> = $0x07e68d1f)
		return
	endif
	if ($0x07e68d1f != None)
		songstoppreview
		Change \{0x07e68d1f = None}
	endif
	begin
	Wait \{0.5
		Seconds}
	if ((<target>) = ($0x3e0869cc))
		break
	else
		<target> = ($0x3e0869cc)
	endif
	repeat
	Change 0x07e68d1f = <target>
endscript

script 0x79245ae9 

	if (<song> = None)
		0x93d8d5cf \{'Attempted to get filename for \'none\'.'}
	endif
	get_song_prefix song = <song>
	get_song_struct song = <song>
	if StructureContains structure = <song_struct> dlc_stream_name
		song_prefix = (<song_struct>.dlc_stream_name)
	endif
	return song_prefix = <song_prefix> song_struct = <song_struct>
endscript

script 0x60b102a7 
	OnExitRun \{0xd7bc4865}
	0x4f8de502 \{0x9b8db44e}
	if ($0x07e68d1f = None)
		return
	endif
	if songispreviewplaying
		if ($0xe74dd00a = 1)
			songstoppreview
		endif
		return
	endif
	if ($0xe74dd00a = 1)
		return
	endif
	song = ($0x07e68d1f)
	0x8dbdaee4 'Starting to play preview for %s.' s = <song>
	0x79245ae9 song = <song>
	0xb2c6e895 \{[
			song_prefix
			song_struct
		]
		all}
	if is_song_downloaded song_checksum = <song>
		if NOT songplaypreview FileName = <song_prefix> content_index = <content_index>
			DownloadContentLost
			return
		endif
	endif
endscript
