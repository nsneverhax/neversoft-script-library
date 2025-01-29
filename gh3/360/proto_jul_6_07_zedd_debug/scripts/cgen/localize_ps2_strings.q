
script get_string_ps2 message = unknown
	localized_string = ""
	switch <message>
		case loading
		localized_string = "Loading data. Do not remove the\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		case saving
		localized_string = "Saving data. Do not remove the\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		case autosaving
		localized_string = "Autosaving data. Do not remove the\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		case overwriting
		localized_string = "Overwriting data. Do not remove the\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		case formatting
		localized_string = "Formatting the memory card (8MB)(for PlayStation®2) in MEMORY CARD slot 1. Do not remove the memory card, reset, or switch off the console."
		case load_successful
		localized_string = "Load Successful."
		case format_successful
		localized_string = "Format Successful."
		case save_successful
		localized_string = "Save Successful."
		case overwrite_successful
		localized_string = "Overwrite Successful."
		case boot_autosave_warning
		localized_string = "Guitar Hero III uses an autosave feature. The insertion or removal of a memory card (8MB)(for PlayStation®2) beyond this point may cause data to be overwritten."
		case check_memcard
		localized_string = "Checking memory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1. Do not remove\\nmemory card (8MB)(for PlayStation®2), controller, or reset/switch off the console."
		case no_memcard_boot
		localized_string = "No memory card (8MB)(for PlayStation®2) inserted in MEMORY CARD slot 1. Guitar Hero III uses an Autosave feature. Insertion of a memory card(8MB)(for PlayStation®2) beyond this point may cause data to be overwritten. Insert a memory card (8MB)(for PlayStation®2) with at least 185 KB of free space to save game data."
		case no_memcard_save_boot
		localized_string = "No memory card (8MB)(for PlayStation®2) in MEMORY CARD slot 1."
		case no_save_boot
		localized_string = "No Guitar Hero III save data present on\\nmemory card (8MB)(for PlayStation®2) in\\nMEMORY CARD slot 1. Guitar Hero III uses an\\nAutosave feature. 185 KB of space is required\\nto save game data. Do you want to create a save\\nfile now?"
		case no_save_ingame
		localized_string = "No Guitar Hero III save data present on\\nmemory card (8MB)(for PlayStation®2) in\\nMEMORY CARD slot 1."
		case save_failed
		localized_string = "Save failed! Check memory card (8MB)(for PlayStation®2) in MEMORY CARD slot 1 and please try again."
		case overwrite_failed
		localized_string = "Overwrite failed! Check\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1 and please try again."
		case attempt_format
		localized_string = "Memory card (8MB)(for PlayStation®2) in\\nMEMORY CARD slot 1 is unformatted. Format the\\nmemory card (8MB)(for PlayStation®2)?"
		case confirm_format
		localized_string = "Are you sure you wish to format\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1?"
		case already_formatted
		localized_string = "The memory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1 has already been\\nformatted! Please reinsert unformatted\\nmemory card (8MB)(for PlayStation®2) in\\nMEMORY CARD slot 1 and select retry."
		case format_failed
		localized_string = "Format failed! Please check\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1 and try again."
		case format_cancelled
		localized_string = "Format cancelled. Continue without saving?"
		case no_memcard_ingame
		localized_string = "No memory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1."
		case load_failed
		localized_string = "Load failed! Check memory card (8MB)(for PlayStation®2) in MEMORY CARD slot 1 and please try again."
		case overwrite_warning_boot
		localized_string = "Guitar Hero III uses an Autosave feature. Insertion of a memory card (8MB)(for PlayStation®2) beyond this point may cause data to be overwritten. Continue without saving?"
		case disable_autosave
		localized_string = "Do you want to disable the Autosave feature?"
		case overwrite_warning_ingame
		localized_string = "WARNING: Saving will overwrite any existing Guitar Hero III data on the memory card (8MB)(for PlayStation®2) in MEMORY CARD slot 1. Are you sure you want to save?"
		case lose_progress_ingame
		localized_string = "WARNING: If you load data from a\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1, you will lose your\\ncurrent game progress. Continue with load?"
		case insufficient_space_boot
		localized_string = "Insufficient free space on the\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1. Insert a\\nmemory card (8MB)(for PlayStation®2)\\nwith at least 185 KB of free space, or create\\nsome space using the console's internal browser.\\nContinue without saving?"
		case insufficient_space_ingame
		localized_string = "Insufficient free space on\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1. Guitar Hero III requires\\n185 KB of free space to save data."
		case corrupt_boot
		localized_string = "Corrupt data detected on\\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1. 185 KB of free\\nspace is required to save game data. Replace\\nthe corrupt file and create a new save file?"
		case confirm_overwrite_boot
		localized_string = "Are you sure you wish to overwrite the save file?"
		case new_memcard_ingame
		localized_string = "The status of the \\nmemory card (8MB)(for PlayStation®2)\\nin MEMORY CARD slot 1 has changed. Data\\nmay be overwritten. Proceed with save?"
		case warning_480p
		localized_string = "Progressive Mode may not work on all televisions.  If it doesn't work on yours, please wait 15 seconds and we'll automatically switch back."
		case now_in_480p
		localized_string = "You are now in Progressive Mode.  Do you want to keep this display mode?"
		default
		printf "No match, string %d not localized" d = <message>
		localized_string = "???"
	endswitch
	return localized_string = <localized_string>
endscript
