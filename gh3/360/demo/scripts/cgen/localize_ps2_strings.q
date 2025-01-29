string_ps2_BLAH = "BLAH"
string_ps2_WARNING = "WARNING"
string_ps2_CAUTION = "CAUTION"
string_ps2_CHECKING = "CHECKING..."
string_ps2_MEMORY_CARD_ERROR = "MEMORY CARD ERROR"
string_ps2_RETRY = "RETRY"
string_ps2_CONTINUE_WITHOUT_SAVING = "CONTINUE WITHOUT SAVING"
string_ps2_SAVE_NOT_FOUND = "SAVE NOT FOUND"
string_ps2_YES = "YES"
string_ps2_NO = "NO"
string_ps2_OK = "OK"
string_ps2_CANCEL = "CANCEL"
string_ps2_LOADING = "LOADING..."
string_ps2_LOAD_SUCCESSFUL = "LOAD SUCCESSFUL"
string_ps2_FORMATTING = "FORMATTING..."
string_ps2_FORMAT_SUCCESSFUL = "FORMAT SUCCESSFUL"
string_ps2_OVERWRITING = "OVERWRITING..."
string_ps2_OVERWRITE_SUCCESSFUL = "OVERWRITE SUCCESSFUL"
string_ps2_SAVING = "SAVING..."
string_ps2_SAVE_SUCCESSFUL = "SAVE SUCCESSFUL"
string_ps2_IN_THE_EVENT_OF_ROCK = "IN THE EVENT OF ROCK"
string_ps2_USING_THE_GUITAR_CONTROLLER = "USING THE GUITAR CONTROLLER"
string_ps2_PLUG_IN = "PLUG IN"
string_ps2_STRAP_ON = "STRAP ON"
string_ps2_BANG = "BANG"
string_ps2_HEAD = "HEAD"
string_ps2_START = "START"
string_ps2_BUTTON = "Button"
string_ps2_BACK = "BACK"
string_ps2_RED_BUTTON = "Red Button"
string_ps2_CONTINUE = "CONTINUE"
string_ps2_GREEN_BUTTON = "Green Button"
string_ps2_UP_DOWN = "UP/DOWN"
string_ps2_STRUM_BAR = "Strum Bar"
string_ps2_STAR_POWER = "STAR POWER"
string_ps2_TILT = "Tilt"

script get_string_ps2 \{message = unknown}
	localized_string = ""
	switch <message>
		case loading
		localized_string = "Loading data. Do not remove the\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		case saving
		localized_string = "Saving data. Do not remove the\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		case autosaving
		localized_string = "Autosaving data. Do not remove the\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		case overwriting
		localized_string = "Overwriting data. Do not remove the\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1, controller, or\\nreset/switch off the console."
		case formatting
		localized_string = "Formatting\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1. Do not remove\\nMemory Card (8MB) (for PlayStation®2),\\ncontroller, or reset/switch off the console."
		case load_successful
		localized_string = "Load Successful."
		case format_successful
		localized_string = "Format Successful."
		case save_successful
		localized_string = "Save Successful."
		case overwrite_successful
		localized_string = "Overwrite Successful."
		case boot_autosave_warning
		localized_string = "Guitar Hero III uses an autosave feature.\\nThe insertion or removal of a\\nMemory Card (8MB) (for PlayStation®2)\\nbeyond this point may cause data\\nto be overwritten."
		case check_memcard
		localized_string = "Checking Memory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1. Do not remove\\nMemory Card (8MB) (for PlayStation®2) ,\\ncontroller, or reset/switch off the console."
		case no_memcard_boot
		localized_string = "No Memory Card (8MB) (for PlayStation®2)\\ninserted in MEMORY CARD slot 1. Guitar Hero III\\nuses an Autosave feature. Insertion of a\\nMemory Card(8MB) (for PlayStation®2) beyond\\nthis point may cause data to be overwritten.\\nInsert a Memory Card (8MB) (for PlayStation®2)\\nwith at least 325 KB of free space\\nto save game data."
		case no_memcard_save_boot
		localized_string = "No Memory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1."
		case no_save_boot
		localized_string = "No Guitar Hero III save data present on\\nMemory Card (8MB) (for PlayStation®2) in\\nMEMORY CARD slot 1. Guitar Hero III uses an\\nAutosave feature. 325 KB of space is required\\nto save game data. Do you want to create a save\\nfile now?"
		case no_save_ingame
		localized_string = "No Guitar Hero III save data present on\\nMemory Card (8MB) (for PlayStation®2) in\\nMEMORY CARD slot 1."
		case save_failed
		localized_string = "Save failed!\\nCheck Memory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1 and please try again."
		case overwrite_failed
		localized_string = "Overwrite failed!\\nCheck Memory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1 and please try again."
		case attempt_format
		localized_string = "Memory card (8MB) (for PlayStation®2) in\\nMEMORY CARD slot 1 is unformatted. Format\\nMemory Card (8MB) (for PlayStation®2)?"
		case confirm_format
		localized_string = "Are you sure you wish to format\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1?"
		case already_formatted
		localized_string = "The Memory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1 has already been\\nformatted! Please reinsert unformatted\\nMemory Card (8MB) (for PlayStation®2) in\\nMEMORY CARD slot 1 and select retry."
		case format_failed
		localized_string = "Format failed! Please check\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1 and try again."
		case format_cancelled
		localized_string = "Format cancelled. Continue without saving?"
		case no_memcard_ingame
		localized_string = "No Memory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1."
		case load_failed
		localized_string = "Load failed!\\nCheck Memory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1 and please try again."
		case overwrite_warning_boot
		localized_string = "Guitar Hero III uses an Autosave feature.\\nInsertion of a\\nMemory Card (8MB) (for PlayStation®2)\\nbeyond this point may cause data\\nto be overwritten. Continue without saving?"
		case disable_autosave
		localized_string = "Autosave has been disabled.\\nAutosave can be re-enabled in the options menu."
		case overwrite_warning_ingame
		localized_string = "WARNING: Saving will overwrite any existing\\nGuitar Hero III data on the\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1.\\nAre you sure you want to save?"
		case lose_progress_ingame
		localized_string = "WARNING: If you load data from a\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1, you will lose your\\ncurrent game progress. Continue with load?"
		case insufficient_space_boot
		localized_string = "Insufficient free space on\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1. Insert a\\nMemory Card (8MB) (for PlayStation®2)\\nwith at least 325 KB of free space, or create some\\nspace using the console's internal browser."
		case insufficient_space_ingame
		localized_string = "Insufficient free space on\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1. Guitar Hero III requires\\n325 KB of free space to save data."
		case corrupt_boot
		localized_string = "Corrupt data detected on\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1. 325 KB of free\\nspace is required to save game data. Replace\\nthe corrupt file and create a new save file?"
		case confirm_overwrite_boot
		localized_string = "Are you sure you wish to\\noverwrite the save file?"
		case new_memcard_ingame
		localized_string = "Data has changed! Do you wish to save to the\\nMemory Card (8MB) (for PlayStation®2)\\nin MEMORY CARD slot 1?"
		case warning_480p
		localized_string = "Progressive Mode may not work on all televisions.  If it doesn't work on yours, please wait 15 seconds and we'll automatically switch back."
		case now_in_480p
		localized_string = "You are now in Progressive Mode.\\nDo you want to keep this display mode?"
		case widescreen_string
		localized_string = "Widescreen"
		case progressivescan_string
		localized_string = "Progressive Scan"
		default
		printf "No match, string %d not localized" d = <message>
		localized_string = "???"
	endswitch
	return localized_string = <localized_string>
endscript
string_ps2_fowlvis_blurb = "'Lil Elroy started banging on the ivories when he was 6. The neighborhood kids weren't too nice about his love for the keys telling him ''Sissy-boys play the piano!'' - it didn't take long for him to pick up the guitar after that. In a band since he was 12 - his love of the steel strings has never faltered.\\n\\nThen a producer gave him a steady studio job - until the day he met a legend in the flesh - he learned the chops from this idol of a by-gone era and soon he was handed his trademark massive golden belt-buckle. From that day on his motto has been:\\n\\n''Heavy Metal, Punk, Polka? It's all rock 'n' roll to Elroy baby.''"
string_ps2_fowlvis_outfit_style_1 = "Vegas"
string_ps2_fowlvis_outfit_style_2 = "Nashville"
string_ps2_fowlvis_outfit_style_3 = "Hawaii"
string_ps2_fowlvis_outfit_style_4 = "Tijuana"
string_ps2_robot_blurb = "Metalhead's lifecycle began as a self-guided Russian warhead. After the Cold War he was disarmed and hocked for spare parts. A few toasters, some vacuum tubes, a '57 roadster, and a cheese greater later, and Metalhead was the first fully autonomous robot. Thus began Metalhead's full-on assault against all things slow and lame. Far from his humble Soviet silo beginnings, Metalhead is ready to get on stage and drop the bomb!"
string_ps2_robot_outfit_style_1 = "Pure Metal"
string_ps2_robot_outfit_style_2 = "Marx"
string_ps2_robot_outfit_style_3 = "Super-Atomic"
string_ps2_robot_outfit_style_4 = "TV Head"
string_ps2_instrument_budcat_blurb = "This is the exact same guitar used by Bud in the intro - honestly, that's the only time it's ever been played. So, buyer beware..."
string_ps2_instrument_felvis_blurb = "Crafted from a 200 year old hunk of ash from the swamps of Mississippi and pressed with Elroy's first solid gold album this ''Gee-Tar'' as Elroy likes to refer to it as has pickups that are hand-wound to his elite specifications. The stop-bar and tail-piece is rumored to be crafted from ancient Spanish Doubloons - curse included.\\n\\nThe steel used for the frets were from the crankshaft of Elroy's old '55 land-barge. He always said - ''I loved that beast, just always wanted to take it with me.'' \\n\\nThe guitar has had so many attempts at its theft that Elroy employs a 24-hour security team to keep an eye on it."
string_ps2_instrument_controller_01_blurb = "Play the game about playing the game.  Just don't make their guitarist play with this instrument too, because then you would be playing the game about playing the game about playing the game."
string_ps2_instrument_controller_02_blurb = "Play the game about playing the game.  Just don't make their guitarist play with this instrument too, because then you would be playing the game about playing the game about playing the game."
string_ps2_instrument_rifle_blurb = "This guitar was a failed experimental laser cannon from Russia, with love.  When Metalhead saw it, he had to have it in his war against lameness.  The laser component had to be removed after a nasty lawsuit involving a cheap roadside motel, a weather balloon, and an ice-cream truck.  Metalhead voluntarily erased the specifics of the incident from his memory banks."
string_ps2_instrument_raygun_blurb = "This weapon was stolen from the Martian menace and used to bring down the flying saucers.  After that it had a brief stint in an off-Broadway play about the whole thing.  Now it sits in Metalhead's private collection."
