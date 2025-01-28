
script RunRemoteScript_ExecuteAndReturnResult \{LocalCallback = NULL}
	if NOT GotParam \{ScriptName}
		Script_Assert \{"Expected a ScriptName!"}
		return
	endif
	if GotParam \{ObjID}
		Printf \{"Running game script requested by debugger on object..."}
		<ObjID> :<ScriptName> <Params>
	else
		Printf \{"Running game script requested by debugger ..."}
		<ScriptName> <Params>
	endif
	if NOT CheckSumEquals A = <LocalCallback> B = NULL
		Printf \{"Debugger requested a callback, sending..."}
		RemoveParameter \{Params}
		RemoveParameter \{ObjID}
		RemoveParameter \{ScriptName}
		RunRemoteScript ScriptName = <LocalCallback> Params = {<...> LocalCallback = NULL}
	endif
endscript

script CopyCameraLocationToClipboard 
	GetCamOffset
	SendToClipboard <...>
endscript

script SendToClipboard 
	RunRemoteScript ScriptName = PrintStruct Params = {<...> SendToClipboard}
endscript

script SendToWindow 
	RunRemoteScript ScriptName = PrintStruct Params = {<...> SendToWindow}
endscript
