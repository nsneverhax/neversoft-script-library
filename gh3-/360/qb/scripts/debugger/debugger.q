
script runremotescript_executeandreturnresult \{localcallback = null}
	if NOT gotparam \{scriptname}
		script_assert \{"Expected a ScriptName!"}
		return
	endif
	if gotparam \{objid}
		printf \{"Running game script requested by debugger on object..."}
		<objid> :<scriptname> <params>
	else
		printf \{"Running game script requested by debugger ..."}
		<scriptname> <params>
	endif
	if NOT checksumequals a = <localcallback> b = null
		printf \{"Debugger requested a callback, sending..."}
		removeparameter \{params}
		removeparameter \{objid}
		removeparameter \{scriptname}
		runremotescript scriptname = <localcallback> params = {<...> localcallback = null}
	endif
endscript

script copycameralocationtoclipboard 
	getcamoffset
	sendtoclipboard <...>
endscript

script sendtoclipboard 
	runremotescript scriptname = printstruct params = {<...> sendtoclipboard}
endscript

script sendtowindow 
	runremotescript scriptname = printstruct params = {<...> sendtowindow}
endscript
