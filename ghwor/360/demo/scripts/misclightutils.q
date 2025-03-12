
script safecreate 
	if isinnodearray <nodename>
		if NOT iscreated <nodename>
			create name = <nodename>
		endif
	endif
endscript

script safekill 
	if iscreated <nodename>
		kill name = <nodename>
	endif
endscript

script safedestroy \{ifempty = 1}
	if iscreated <nodename>
		<nodename> :destroy ifempty = 1
	endif
endscript
