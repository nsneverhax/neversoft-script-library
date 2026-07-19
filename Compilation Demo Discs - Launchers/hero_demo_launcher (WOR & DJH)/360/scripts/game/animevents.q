preloadwinanimstream_guitaristid = none
preloadwinanimstream_bassistid = none

script preloadwinanimstream 
	obj_getid
	manglechecksums a = <objid> b = winanimstream
	if (<objid> = guitarist)
		if preloadstream <stream> buss = binkcutscenes
			change preloadwinanimstream_guitaristid = <unique_id>
		else
			change \{preloadwinanimstream_guitaristid = none}
		endif
	elseif (<objid> = bassist)
		if preloadstream <stream> buss = binkcutscenes
			change preloadwinanimstream_bassistid = <unique_id>
		else
			change \{preloadwinanimstream_bassistid = none}
		endif
	endif
endscript

script playpreloadedwinanimstream 
	obj_getid
	if (<objid> = guitarist)
		if (($preloadwinanimstream_guitaristid) = none)
			printf \{'WinAnimStream not found for guitarist'}
		else
			startpreloadedstream ($preloadwinanimstream_guitaristid) vol = 63 forcesafepreload = 1 buss = binkcutscenes
		endif
	elseif (<objid> = bassist)
		if (($preloadwinanimstream_bassistid) = none)
			printf \{'WinAnimStream not found for bassist'}
		else
			startpreloadedstream ($preloadwinanimstream_bassistid) vol = 63 forcesafepreload = 1 buss = binkcutscenes
		endif
	endif
endscript
