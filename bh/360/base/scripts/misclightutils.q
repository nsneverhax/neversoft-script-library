
script safecreate 
	if IsInNodeArray <nodename>
		if NOT IsCreated <nodename>
			create name = <nodename>
		endif
	endif
endscript

script safekill 
	if IsCreated <nodename>
		kill name = <nodename>
	endif
endscript
