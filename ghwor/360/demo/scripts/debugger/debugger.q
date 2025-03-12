
script runremotescript_executeandreturnresult \{localcallback = null}
	if NOT gotparam \{scriptname}
		script_assert \{qs(0x9e2173bc)}
		return
	endif
	if gotparam \{objid}
		printf \{qs(0x58d8ff41)}
		<objid> :<scriptname> <params>
	else
		printf \{qs(0x19d64257)}
		<scriptname> <params>
	endif
	if NOT checksumequals a = <localcallback> b = null
		printf \{qs(0x9996cc69)}
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
