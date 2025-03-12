
script ondebuggerstartup 
	printf \{qs(0xe606847b)}
	sendscriptfunctionstodebugger
	debuggersendmodetext
endscript

script ondebuggerquit 
endscript

script debuggersendmodetext 
	debuggergetmodetext
	runremotescript {
		objid = mouse_window
		scriptname = settitle
		params = {
			('Mouse window: ' + <mode_text>)
		}
	}
endscript

script getgamescriptfunctionlist 
	scriptfunctions = [
		{text = 'Send Camera to Clipboard' , scriptname = copycameralocationtoclipboard}
	]
	return <...>
endscript

script getandcombinescriptfunctionlists 
	getgamescriptfunctionlist
	if scriptexists \{getuserscriptfunctionlist}
		getuserscriptfunctionlist
		if gotparam \{userscriptfunctions}
			return {
				functionsets = [
					{setname = 'User Scripts' functions = <userscriptfunctions>}
					{setname = 'Game Scripts' functions = <scriptfunctions>}
				]
				title = 'Script Function List'
				id = scriptfuncs
				buttonscript = runremotescript
			}
		endif
	endif
	return {
		functionsets = [
			{setname = 'Game Scripts' functions = <scriptfunctions>}
		]
		title = 'Script Function List'
		id = scriptfuncs
		buttonscript = runremotescript
	}
endscript

script sendscriptfunctionstodebugger 
	getandcombinescriptfunctionlists
	runremotescript scriptname = createfunctionlistwindow params = <...>
endscript
