PreloadWinAnimStream_GuitaristID = none
PreloadWinAnimStream_BassistID = none

script PreloadWinAnimStream 
	Obj_GetID
	MangleChecksums a = <ObjID> b = winanimstream
	if (<ObjID> = Guitarist)
		if PreloadStream <stream> buss = binkcutscenes
			change PreloadWinAnimStream_GuitaristID = <unique_id>
		else
			change \{PreloadWinAnimStream_GuitaristID = none}
		endif
	elseif (<ObjID> = bassist)
		if PreloadStream <stream> buss = binkcutscenes
			change PreloadWinAnimStream_BassistID = <unique_id>
		else
			change \{PreloadWinAnimStream_BassistID = none}
		endif
	endif
endscript

script PlayPreLoadedWinAnimStream 
	Obj_GetID
	if (<ObjID> = Guitarist)
		if (($PreloadWinAnimStream_GuitaristID) = none)
			printf \{'WinAnimStream not found for guitarist'}
		else
			StartPreloadedStream ($PreloadWinAnimStream_GuitaristID) vol = 63 forcesafepreload = 1 buss = binkcutscenes
		endif
	elseif (<ObjID> = bassist)
		if (($PreloadWinAnimStream_BassistID) = none)
			printf \{'WinAnimStream not found for bassist'}
		else
			StartPreloadedStream ($PreloadWinAnimStream_BassistID) vol = 63 forcesafepreload = 1 buss = binkcutscenes
		endif
	endif
endscript
