AnimTagTable = {
}
PreloadWinAnimStream_GuitaristID = None
PreloadWinAnimStream_BassistID = None

script PreloadWinAnimStream 
	Obj_GetID
	MangleChecksums a = <objID> b = winanimstream
	if (<objID> = GUITARIST)
		if PreloadStream <Stream> buss = binkcutscenes
			Change PreloadWinAnimStream_GuitaristID = <unique_id>
		else
			Change \{PreloadWinAnimStream_GuitaristID = None}
		endif
	elseif (<objID> = BASSIST)
		if PreloadStream <Stream> buss = binkcutscenes
			Change PreloadWinAnimStream_BassistID = <unique_id>
		else
			Change \{PreloadWinAnimStream_BassistID = None}
		endif
	endif
endscript

script PlayPreLoadedWinAnimStream 
	Obj_GetID
	if (<objID> = GUITARIST)
		if (($PreloadWinAnimStream_GuitaristID) = None)

		else
			StartPreLoadedStream ($PreloadWinAnimStream_GuitaristID) vol = 63 forcesafepreload = 1 buss = binkcutscenes
		endif
	elseif (<objID> = BASSIST)
		if (($PreloadWinAnimStream_BassistID) = None)

		else
			StartPreLoadedStream ($PreloadWinAnimStream_BassistID) vol = 63 forcesafepreload = 1 buss = binkcutscenes
		endif
	endif
endscript
