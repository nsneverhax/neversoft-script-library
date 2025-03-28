
script OnDebuggerStartup 
	ScriptAssert \{'OnDebuggerStartup: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
	SendScriptFunctionsToDebugger
	debuggersendmodetext
endscript

script debuggersendmodetext 
	DebuggerGetModeText
	RunRemoteScript {
		objID = mouse_window
		scriptname = SetTitle
		params = {
			('Mouse window: ' + <mode_text>)
		}
	}
endscript

script GetGameScriptFunctionList 
	ScriptFunctions = [
		{text = 'Send Camera to Clipboard' , scriptname = CopyCameraLocationToClipboard}
	]
	return <...>
endscript

script GetAndCombineScriptFunctionLists 
	GetGameScriptFunctionList
	if ScriptExists \{GetUserScriptFunctionList}
		GetUserScriptFunctionList
		if GotParam \{UserScriptFunctions}
			return {
				functionsets = [
					{setname = 'User Scripts' functions = <UserScriptFunctions>}
					{setname = 'Game Scripts' functions = <ScriptFunctions>}
				]
				title = 'Script Function List'
				id = scriptfuncs
				ButtonScript = RunRemoteScript
			}
		endif
	endif
	return {
		functionsets = [
			{setname = 'Game Scripts' functions = <ScriptFunctions>}
		]
		title = 'Script Function List'
		id = scriptfuncs
		ButtonScript = RunRemoteScript
	}
endscript

script SendScriptFunctionsToDebugger 
	GetAndCombineScriptFunctionLists
	RunRemoteScript scriptname = createfunctionlistwindow params = <...>
endscript
