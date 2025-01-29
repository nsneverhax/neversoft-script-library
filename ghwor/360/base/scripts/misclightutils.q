
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

script safedestroy \{ifEmpty = 1}
	if IsCreated <nodeName>
		<nodeName> :Destroy ifEmpty = 1
	endif
endscript
