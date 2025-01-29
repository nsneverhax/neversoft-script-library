
script RunRemoteScript_ExecuteAndReturnResult \{LocalCallback = null}
	if NOT GotParam \{scriptname}
		script_assert \{qs(0x9e2173bc)}
		return
	endif
	if GotParam \{objID}
		printf \{qs(0x58d8ff41)}
		<objID> :<scriptname> <params>
	else
		printf \{qs(0x19d64257)}
		<scriptname> <params>
	endif
	if NOT checksumequals a = <LocalCallback> b = null
		printf \{qs(0x9996cc69)}
		RemoveParameter \{params}
		RemoveParameter \{objID}
		RemoveParameter \{scriptname}
		RunRemoteScript scriptname = <LocalCallback> params = {<...> LocalCallback = null}
	endif
endscript

script CopyCameraLocationToClipboard 
	GetCamOffset
	SendToClipboard <...>
endscript

script SendToClipboard 
	RunRemoteScript scriptname = printstruct params = {<...> SendToClipboard}
endscript

script SendToWindow 
	RunRemoteScript scriptname = printstruct params = {<...> SendToWindow}
endscript
