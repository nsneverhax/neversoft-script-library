
script SafeCreate 
	if IsInNodeArray <nodeName>
		if NOT IsCreated <nodeName>
			create Name = <nodeName>
		endif
	endif
endscript

script SafeKill 
	if IsCreated <nodeName>
		kill Name = <nodeName>
	endif
endscript
