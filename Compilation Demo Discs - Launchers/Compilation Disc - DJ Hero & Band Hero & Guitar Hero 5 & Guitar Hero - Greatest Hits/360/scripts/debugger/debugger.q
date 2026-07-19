
script RunRemoteScript_ExecuteAndReturnResult \{LocalCallback = null}
	if NOT GotParam \{ScriptName}
		script_assert \{qs("\LExpected a ScriptName!")}
		return
	endif
	if GotParam \{ObjID}
		printf \{qs("\LRunning game script requested by debugger on object...")}
		<ObjID> :<ScriptName> <params>
	else
		printf \{qs("\LRunning game script requested by debugger ...")}
		<ScriptName> <params>
	endif
	if NOT ChecksumEquals a = <LocalCallback> b = null
		printf \{qs("\LDebugger requested a callback, sending...")}
		RemoveParameter \{params}
		RemoveParameter \{ObjID}
		RemoveParameter \{ScriptName}
		RunRemoteScript ScriptName = <LocalCallback> params = {<...> LocalCallback = null}
	endif
endscript

script CopyCameraLocationToClipboard 
	GetCamOffset
	SendToClipboard <...>
endscript

script SendToClipboard 
	RunRemoteScript ScriptName = printstruct params = {<...> SendToClipboard}
endscript

script SendToWindow 
	RunRemoteScript ScriptName = printstruct params = {<...> SendToWindow}
endscript
