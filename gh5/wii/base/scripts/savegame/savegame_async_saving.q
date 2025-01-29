
script savegame_async_update_saving 
	GetTrueStartTime
	memcard_pre_save_progress savegame = ($memcardcontroller)
	if ($wii_memcard_autosave = 1)
		savefromoptions = FALSE
	else
		savefromoptions = true
	endif
	if NOT SaveToMemoryCard filetype = progress savefromoptions = <savefromoptions>
		printf \{qs(0x9da901f3)}
		if (<boot> = 1)
			return \{memcard_status = save_error_boot}
		elseif (<boot> = 0)
			return \{memcard_status = save_error_ingame}
		endif
	endif
	memcard_post_save_progress savegame = <savegame>
	wait_at_least_x_ms starttime = <starttime> at_least = 3000
	return \{true}
endscript
