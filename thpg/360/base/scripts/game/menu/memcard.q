max_memcard_filename_length = 17
memcard_using_autosave = 1
memcard_max_dir_files = 20
memcard_using_new_save_system = 1
memcard_default_title = 'TONY HAWK\'S PROVING GROUND'
memcard_file_types = [
	{
		name = progress
		version = 80
		fixed_size = 204800
		menu_text = "GAME PROGRESS"
		menu_icon = thpg
		use_temp_pools = true
		is_binary_file = false
		num_bytes_per_frame = 5120
	}
	{
		name = videoclip
		version = 80
		fixed_size = 1150976
		menu_text = "VIDEO CLIP"
		menu_icon = thpg
		use_temp_pools = false
		is_binary_file = true
		num_bytes_per_frame = 0
	}
	{
		name = photo
		version = 80
		fixed_size = 615902
		menu_text = "PHOTOGRAPH"
		menu_icon = thpg
		use_temp_pools = false
		is_binary_file = true
		num_bytes_per_frame = 0
	}
	{
		name = videorender
		version = 80
		fixed_size = 2097152
		menu_text = "FINALIZED EDIT"
		menu_icon = thpg
		use_temp_pools = false
		is_binary_file = true
		num_bytes_per_frame = 0
	}
]
memcard_folder_desc = {
	CombinedProgression = {
		icon_xen = 'memcard\\thpg.png'
		icon_ps3 = 'memcard\\ICON0.PNG'
		file_types = [
			{
				name = progress
				slots_reserve = 1
			}
			{
				name = videoclip
				slots_reserve = 10
			}
			{
				name = photo
				slots_reserve = 0
			}
			{
				name = videorender
				slots_reserve = 0
			}
		]
	}
}
badversionnumber = "BAD VERSION!"
damagedfile = "DAMAGED!"
savingorloading = saving
FilesOrFolders = files
memcard_menus_active = 0

script GetFileTypeName 
	GetMemCardFileProp filetype = <file_type> menu_text
	return filetype_name = <menu_text>
endscript

script quittodashboard 
	getplatform
	switch <platform>
		case xenon
		printf \{"QuitToDashboard"}
	endswitch
endscript

script destroy_pause_menu 
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
endscript

script destroy_main_menu 
	if objectexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
endscript

script destroy_files_menu 
	if objectexists \{id = files_menu}
		destroyscreenelement \{id = files_menu}
	endif
endscript

script ResetAbortAndDoneScripts 
	change \{DoneScript = DefaultDoneScript}
	change \{abortscript = defaultabortscript}
	change \{RetryScript = DefaultRetryScript}
	change \{FilesOrFolders = folders}
endscript
DoneScript = DefaultDoneScript

script DefaultDoneScript 
	printf \{"DefaultDoneScript called !!!"}
endscript
abortscript = defaultabortscript

script defaultabortscript 
	printf \{"DefaultAbortScript called !!!"}
endscript

script memcard_menus_cleanup 
	dialog_box_exit \{no_pad_start}
	destroy_files_menu
	destroy_onscreen_keyboard
	pause_menu_gradient \{off}
	change \{memcard_menus_active = 0}
	spawnscriptlater \{temporarilydisableinput
		params = {
			time = 500
		}}
endscript
ignore_auto_load_end_state = 0

script auto_load_finished 
	if NOT gotparam \{success}
		change \{ui_cas_skater_selected = 0}
	endif
	memcard_menus_cleanup
	ResetAbortAndDoneScripts
	broadcastevent \{type = auto_load_finished}
	if ($ignore_auto_load_end_state = 1)
		restore_start_key_binding
		change \{ignore_auto_load_end_state = 0}
	else
		ui_change_state \{state = UIstate_yourlife}
	endif
endscript

script back_to_pause_menu 
	memcard_menus_cleanup
	ResetAbortAndDoneScripts
	restore_start_key_binding
	if ($save_successful = 1)
		printf "save complete ========================="
	else
		printf "save aborted ========================="
		if root_window :getsingletag save_return_to_pause_menu
			root_window :removetags tags = [save_return_to_pause_menu]
			pause_game_and_create_pause_menu
			return
		endif
		pause_game_and_create_pause_menu
	endif
	change save_successful = 2
endscript

script back_to_beat_goal 
	memcard_menus_cleanup
	goalmanager_showpoints
	ResetAbortAndDoneScripts
	goal_save_reject
endscript

script back_to_options_menu 
	memcard_menus_cleanup
	ResetAbortAndDoneScripts
	restore_start_key_binding
	if infrontend
		ui_change_state \{state = UIstate_mainoptions}
	else
		ui_change_state \{state = UIstate_pauseoptions}
	endif
endscript

script back_to_xbox_live 
	memcard_menus_cleanup
	ResetAbortAndDoneScripts
	restore_start_key_binding
	spawnscriptnow \{launch_xbox_live_continue}
endscript

script back_to_career_options_menu 
	memcard_menus_cleanup
	ResetAbortAndDoneScripts
	ui_change_state \{state = UIstate_yourlife}
endscript
RetryScript = DefaultRetryScript

script DefaultRetryScript 
	printf \{"DefaultRetryScript called !!!"}
endscript

script mem_card_message_pause time = 3
	if NOT gotparam NoTimerReset
		resettimer
	endif
	<CardCheckCounter> = 0
	begin
	if screenelementexists id = controller_unplugged_dialog_anchor
		goto nullscript
	endif
	if NOT gotparam NoCardRemovalCheck
		if (<CardCheckCounter> = 10)
			if NOT cardisinslot
				goto mcmess_errornocardinslot
			endif
			<CardCheckCounter> = 0
		else
			<CardCheckCounter> = (<CardCheckCounter> + 1)
		endif
	endif
	if timegreaterthan <time>
		break
	endif
	wait 1 gameframe
	repeat
endscript

script memcard_select_source force = 0 ValidateForAutoSave = 0
	if ($memcard_using_new_save_system = 0)
		if NOT isxenon
			return
		endif
	endif
	if NOT gotparam no_message
		mcmess_checkingcard
	endif
	wait 3 gameframe
	if ($paused_for_hardware = 1)
		if (<force> = 1)
			begin
			if ($paused_for_hardware = 0)
				break
			endif
			wait 1 gameframe
			repeat 180
		endif
		if ($paused_for_hardware = 1)
			printf 'memcard_select_source --- BAILED'
			return
		endif
	endif
	if ($memcard_using_new_save_system = 0)
		showstorageselector force = <force> filetype = <filetype>
		begin
		if storageselectorfinished
			break
		else
			wait 1 gameframe
		endif
		repeat
	else
		mc_waitasyncopsfinished
		newshowstorageselector force = <force> filetype = <filetype>
		if (<force> = 1)
			mc_enumeratefolders
		endif
		if (<ValidateForAutoSave> = 1)
			if memcard_validate_known_device
			else
				if NOT gotparam saving_extra_data
					game_progress_autosave_inactive
				endif
				goto mcmess_ErrorValidateFailed params = {<...>}
			endif
		endif
	endif
	wait 3 gameframe
endscript

script memcard_force_select_source 
	memcard_menus_cleanup
	soundevent \{event = Goal_UI_Positive_Text}
	check_card <...> force = 1
	create_files_menu <...>
endscript

script memcard_panic_cleanup 
	killspawnedscript \{name = create_files_menu}
	if screenelementexists \{id = files_menu}
		destroyscreenelement \{id = files_menu}
	endif
	killspawnedscript \{name = mc_SetAndReadFolderInfo}
	if ($memcard_using_new_save_system = 1)
		mc_waitasyncopsfinished
		mc_setactivefolder \{folderindex = -1}
	endif
	broadcastevent \{type = ingame_save_finished}
	if switchtotemppoolsiftheyexist
		switchtoregularpools
		PopTemporaryMemCardPools
	endif
endscript

script check_card 
	memcard_select_source <...>
	if NOT cardisinslot
		goto \{mcmess_errornocardinslot}
	endif
	if ($memcard_using_new_save_system = 0)
		if NOT CardIsFormatted_Sync
			if gotparam \{save}
				goto \{mcmess_errornotformatted}
			else
				goto \{mcmess_errornotformattednoformatoption}
			endif
		endif
		mcmess_checkingcard
	endif
	dialog_box_exit \{no_pad_start}
endscript
StopCheckingForCardRemoval = 0

script checkforcardremoval 
	change \{StopCheckingForCardRemoval = 0}
	<CardCheckCounter> = 0
	begin
	if (<CardCheckCounter> = 10)
		if NOT cardisinslot
			goto \{mcmess_errornocardinslot}
		endif
		<CardCheckCounter> = 0
	else
		<CardCheckCounter> = (<CardCheckCounter> + 1)
	endif
	if NOT objectexists id = <menu_id>
		break
	endif
	if istrue \{$StopCheckingForCardRemoval}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script doformatcard 
	killspawnedscript \{name = checkforcardremoval}
	if cardisformatted
		goto \{DoneScript}
	endif
	resettimer
	mcmess_formattingcard
	if formatcard
		mem_card_message_pause \{XSkips
			NoTimerReset
			NoCardRemovalCheck}
		goto \{mcmess_formatsuccessful}
	else
		mem_card_message_pause \{XSkips
			NoTimerReset
			NoCardRemovalCheck}
		goto \{mcmess_formatfailed}
	endif
endscript

script overwrite_launch_files_menu 
	generic_menu_pad_back_sound
	launch_files_menu <...>
endscript

script launch_files_menu 
	memcard_menus_cleanup
	create_files_menu <...>
endscript

script create_files_menu pos_tweak = (-20.0, -45.0)
	mc_waitasyncopsfinished
	fadetoblack off time = 0 no_wait
	if ($FilesOrFolders = files)
		if NOT mc_hasactivefolder
			goto mcmess_errornocardinslot
		endif
	endif
	if NOT cardisinslot
		goto mcmess_errornocardinslot
	endif
	if gotparam new_filename
		change memcard_force_create_new_name = <new_filename>
	else
		change memcard_force_create_new_name = ""
	endif
	if screenelementexists id = controller_unplugged_dialog_anchor
		return
	endif
	if ($memcard_using_new_save_system = 1)
		unloadanimsandcreatememcardpools filetype = <filetype>
		mc_waitasyncopsfinished
		removeparameter add_createnew_option
		if ($FilesOrFolders = folders)
			mc_enumeratefolders
			if (<result> = false)
				goto mcmess_errorsavefailed
			endif
			if gotparam save
				if mc_spacefornewfolder desc = CombinedProgression
					<add_createnew_option> = 1
				endif
			endif
		else
			if MC_SpaceForNewFile filetype = <filetype>
				getmemcarddirectorylisting filetype = <filetype>
				if gotparam save
					if gotparam directorylisting
						getarraysize <directorylisting>
						if (<array_size> < ($memcard_max_dir_files))
							if NOT gotparam fileslimitreached
								<add_createnew_option> = 1
							endif
						endif
					endif
				endif
			else
				getmemcarddirectorylisting filetype = <filetype>
			endif
		endif
	else
		if gotparam save
			unloadanimsandcreatememcardpools filetype = <filetype>
			getmemcardspaceavailable
			GetMemCardSpaceRequired <filetype>
			removeparameter add_createnew_option
			RemoveFlag corruptcontentdetected
			if (<spaceavailable> > <spacerequired>)
				getmemcarddirectorylisting filetype = <filetype>
			else
				getmemcarddirectorylisting filetype = <filetype> enumerateallfiles
			endif
			if (<totalthps4filesoncard> = 0)
				if ((<spaceavailable> < <spacerequired>) || (<filesleft> < 1))
					if NOT isxenon
						goto mcmess_errornotenoughroomnothpsfilesexist params = {
							filetype = <filetype>
							spacerequired = <spacerequired>
							spaceavailable = <spaceavailable>
						}
					endif
				else
					<add_createnew_option> = 1
				endif
			else
				if ((<spaceavailable> < <spacerequired>) || (<filesleft> < 1))
				else
					if NOT gotparam fileslimitreached
						<add_createnew_option> = 1
					endif
				endif
			endif
			if NOT cardisinslot
				goto mcmess_errornocardinslot
			endif
			if gotparam corruptcontentdetected
				goto mcmess_ErrorCorruptContentDetected params = {filetype = <filetype>}
			endif
		else
			RemoveFlag corruptcontentdetected
			getmemcarddirectorylisting filetype = <filetype>
			if NOT cardisinslot
				goto mcmess_errornocardinslot
			endif
			if gotparam corruptcontentdetected
				goto mcmess_ErrorCorruptContentDetected params = {filetype = <filetype>}
			endif
		endif
	endif
	if gotparam save
		change savingorloading = saving
	else
		change savingorloading = loading
	endif
	if NOT cardisinslot
		goto mcmess_errornocardinslot
	endif
	setscreenelementlock id = root_window off
	goalmanager_hidepoints
	helper_text_elements = [
		{text = "\\m1 BACK"}
		{text = "\\m0 ACCEPT"}
		{text = "\\md DELETE"}
	]
	if gotparam save
		if (<filetype> = videorender)
			menu_title = "SAVE FINALIZED EDIT"
		else
			menu_title = "SAVE GAME"
		endif
	else
		if (<filetype> = videorender)
			menu_title = "LOAD FINALIZED EDIT"
		else
			menu_title = "LOAD GAME"
			fadetoblack off time = 0 no_wait
		endif
	endif
	if ($FilesOrFolders = folders)
		if isxenon
			addarrayelement array = <helper_text_elements> element = {text = "\\m8 DEVICE"}
			<helper_text_elements> = <array>
			removeparameter array
		endif
	endif
	v_menu_dims = (548.0, 300.0)
	pos = (130.0, 170.0)
	bg_pos = (-10000.0, -10000.0)
	top_bar_pos = (-10000.0, -10000.0)
	v_menu_num_items_to_show = 8
	make_new_menu {
		menu_title = ""
		padding_scale = 1
		menu_id = files_menu
		vmenu_id = files_vmenu
		scale = 1.4
		pos = <pos>
		dims = <v_menu_dims>
		just = [center top]
		type = vscrollingmenu
		scrolling_menu_id = files_scrolling_menu
		scrolling_menu_title_id = files_scrolling_menu_title
		scrolling_menu_offset = (0.0, 32.0)
		dont_allow_wrap = dont_allow_wrap
		helper_text = {helper_text_elements = <helper_text_elements>}
		num_items_to_show = <v_menu_num_items_to_show>
	}
	if infrontend
		tilesprite {
			texture = map_bg_news
			parent = files_menu
			tile_dims = (1480.0, 1520.0)
			dims = (250.0, 250.0)
			pos = (0.0, -400.0)
			sprite_props = {rgba = [150 70 70 255]}
			container_props = {z_priority = -30.0}
		}
	endif
	ui_create_messy_background {
		parent = files_menu
		messy_id = test_messy
		dims = (900.0, 1200.0)
		pos = (100.0, -150.0)
		z_priority = -2
		rot_angle = RandomRange (-13.0, -10.0)
		rgba = <bg_rgba>
	}
	createscreenelement {
		type = spriteelement
		parent = files_menu
		texture = menu_headerbar
		just = [left top]
		pos = (250.0, 100.0)
		scale = (1.5, 1.0)
		z_priority = 0
		flip_v
		rgba = ($goal_ui_scheme.main)
	}
	createscreenelement {
		type = textelement
		parent = files_menu
		font = text_a1
		text = <menu_title>
		just = [left center]
		pos = (300.0, 138.0)
		rgba = [200 200 200 255]
		scale = (1.1, 0.8)
		z_priority = 1
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
	}
	removeparameter card_name
	<selection_params> = <...>
	removecomponent name = directorylisting structure_name = selection_params
	removecomponent name = folderlisting structure_name = selection_params
	removecomponent name = helper_text_elements structure_name = selection_params
	if ($FilesOrFolders = folders)
		if isxenon
			setscreenelementprops {
				id = current_menu
				event_handlers = [{pad_space memcard_force_select_source params = <selection_params>}]
			}
		endif
	endif
	removeparameter selection_params
	setscreenelementprops {
		id = current_menu
		event_handlers = [{pad_back generic_menu_pad_back params = {callback = reload_anims_then_run_abort_script}}
			{pad_down menu_vert_blink_arrow params = {id = files_menu_down_arrow}}
			{pad_up menu_vert_blink_arrow params = {id = files_menu_up_arrow}}
		]
	}
	if gotparam save
		if gotparam add_createnew_option
			create_new_delete_params = {no_delete}
			if isps3
				if ($FilesOrFolders = folders)
					create_new_delete_params = {}
				endif
			endif
			files_menu_add_item {file_type = <filetype>
				filename = " - CREATE NEW - "
				file_size = ""
				pad_choose_script = createnew
				font = text_a1
				icon_alpha = 0.0
				font_spacing = 2
				<create_new_delete_params>
			}
		endif
	endif
	<had_files> = 0
	if gotparam directorylisting
		getarraysize <directorylisting>
		if (<array_size> > 0)
			<had_files> = 1
			if gotparam save
				foreachin <directorylisting> do = files_menu_add_item params = {pad_choose_script = oktooverwrite file_type = <filetype> MenuFileType = <filetype> save} pass_index
			else
				foreachin <directorylisting> do = files_menu_add_item params = {pad_choose_script = load file_type = <filetype>} pass_index
			endif
		endif
	endif
	if gotparam folderlisting
		getarraysize <folderlisting>
		if (<array_size> > 0)
			<had_files> = 1
			if gotparam save
				foreachin <folderlisting> do = files_menu_add_item params = {pad_choose_script = oktooverwrite MenuFileType = <filetype> save} pass_index
			else
				foreachin <folderlisting> do = files_menu_add_item params = {pad_choose_script = load file_type = <filetype>} pass_index
			endif
			current_menu :obj_spawnscript mc_SetAndReadFolderInfo params = {folderlisting = <folderlisting>}
		endif
	endif
	if (<had_files> = 0)
		if NOT gotparam save
			create_helper_text $generic_helper_text
			goto mcmess_nofiles params = {MenuFileType = <filetype> selection_params = <selection_params>}
		else
			if NOT gotparam add_createnew_option
				create_helper_text $generic_helper_text
				if ($FilesOrFolders = folders)
					goto mcmess_NoSpaceForNew params = {MenuFileType = <filetype> desc = CombinedProgression}
				else
					goto mcmess_NoSpaceForFile params = {MenuFileType = <filetype> selection_params = <selection_params>}
				endif
			endif
		endif
	endif
	removeparameter directorylisting
	removeparameter folderlisting
	if screenelementexists id = controller_unplugged_dialog_anchor
		doscreenelementmorph id = current_menu_anchor scale = 0
	else
		launchevent type = focus target = files_vmenu
	endif
	wait 2 gameframe
	if screenelementexists id = files_scrolling_menu
		setscreenelementprops id = files_scrolling_menu reset_window_top
	endif
	checkforcardremoval menu_id = files_menu
endscript

script files_menu_add_item pad_choose_script = nullscript font = text_a1 icon_alpha = 1.0
	switchtotemppoolsiftheyexist
	<unhighlight_rgba> = ($pause_color_scheme.text_color)
	heap = bottomupheap
	delete_button = pad_square
	if ($memcard_using_new_save_system = 1)
		if NOT gotparam file_type
			<file_type> = progress
		endif
	endif
	if gotparam save
		if NOT (<file_type> = <MenuFileType>)
			disable_item_overwrite = 1
			unhighlight_rgba = [128 128 128 50]
		endif
	endif
	if gotparam foreachin_index
		formattext checksumname = container_id 'files_menu_item_%d' d = <foreachin_index>
	else
		<container_id> = files_menu_item_createnew
	endif
	delete_param = {}
	if gotparam save
		delete_param = {save}
	endif
	createscreenelement {
		type = containerelement
		parent = current_menu
		id = <container_id>
		dims = (400.0, 24.0)
		event_handlers = [{focus files_menu_focus}
			{unfocus files_menu_unfocus}
			{<delete_button> files_menu_delete params = <delete_param>}
		]
		heap = <heap>
	}
	if NOT gotparam disable_item_overwrite
		setscreenelementprops {
			id = <id>
			event_handlers = [{pad_choose <pad_choose_script>}
				{pad_start <pad_choose_script>}
			]
		}
	endif
	if ($memcard_using_new_save_system = 0)
		if gotparam total_file_size
			memcard_format_datetime <...>
		endif
	endif
	removeparameter year
	removeparameter month
	removeparameter day
	removeparameter hour
	removeparameter minutes
	removeparameter seconds
	<container_id> :settags <...>
	createscreenelement {
		local_id = filename_text
		type = textelement
		parent = <container_id>
		scale = 0.4
		font = <font>
		text = <filename>
		text = <foldername>
		pos = (125.0, 2.0)
		just = [left center]
		rgba = <unhighlight_rgba>
		z_priority = 6
		heap = <heap>
		font_spacing = 3
	}
	getscreenelementdims id = <id>
	if (<width> > 150)
		<scale> = ((150.0 / <width>) * 0.4)
		doscreenelementmorph id = <id> time = 0 scale = <scale>
	endif
	if gotparam total_file_size
		getplatform
	else
		<file_size_text> = ""
	endif
	createscreenelement {
		local_id = size
		type = textelement
		parent = <container_id>
		scale = 0.4
		font = text_a1
		text = <file_size_text>
		pos = (345.0, 2.0)
		just = [right center]
		rgba = <unhighlight_rgba>
		z_priority = 6
		heap = <heap>
	}
	GetMemCardFileProp filetype = <file_type> menu_icon
	<file_type_icon> = <menu_icon>
	createscreenelement {
		local_id = icon
		type = spriteelement
		parent = <container_id>
		texture = <file_type_icon>
		pos = (100.0, 0.0)
		just = [center center]
		rgba = [50 50 50 128]
		z_priority = 6
		alpha = <icon_alpha>
		heap = <heap>
		scale = 0.0
		rot_angle = -5
	}
	highlight_angle = 0
	createscreenelement {
		local_id = highlight_bar
		type = spriteelement
		parent = <container_id>
		texture = menu_highlight
		pos = (65.0, 0.0)
		just = [left center]
		scale = (1.6, 1.0)
		rgba = [128 128 128 0]
		rot_angle = (<highlight_angle> / 4)
		heap = <heap>
	}
	createscreenelement {
		local_id = date
		type = textelement
		parent = <container_id>
		scale = 0.4
		font = text_a1
		text = <date>
		pos = (360.0, 2.0)
		just = [right center]
		rgba = <unhighlight_rgba>
		z_priority = 6
		heap = <heap>
		font_spacing = 2
	}
	createscreenelement {
		local_id = time
		type = textelement
		parent = <container_id>
		scale = 0.4
		font = text_a1
		text = <time>
		pos = (430.0, 2.0)
		just = [right center]
		rgba = <unhighlight_rgba>
		z_priority = 6
		heap = <heap>
		font_spacing = 2
	}
	switchtoregularpools
endscript

script files_menu_add_top_bar 
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		dims = (603.0, 24.0)
		pos = <pos>
		just = [left top]
	}
	<container_id> = <id>
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		id = files_menu_up_arrow
		texture = up_arrow
		pos = (250.0, 0.0)
		just = [center center]
		z_priority = 3
	}
endscript

script memcard_format_datetime 
	if ispal
		formattext textname = date "%d/%m/%y" m = (<month> + 1) d = <day> y = <year>
		if (10 > <minutes>)
			mzero = "0"
		else
			mzero = ""
		endif
		formattext textname = time "%h:%z%m" h = <hour> m = <minutes> z = <mzero>
	else
		formattext textname = date "%m/%d/%y" m = (<month> + 1) d = <day> y = <year>
		if (10 > <minutes>)
			mzero = "0"
		else
			mzero = ""
		endif
		if (<hour> < 12)
			ampm = " AM"
		else
			ampm = " PM"
			hour = (<hour> - 12)
		endif
		if (<hour> = 0)
			hour = 12
		endif
		formattext textname = time "%h:%z%m%a" h = <hour> m = <minutes> z = <mzero> a = <ampm>
	endif
	return time = <time> date = <date>
endscript

script files_menu_add_bottom_bar text_scale = 0.45000002
	<highlight_rgba> = ($pause_color_scheme.text_focus_color)
	<unhighlight_rgba> = ($pause_color_scheme.text_color)
	GetStackedScreenElementPos y id = files_scrolling_menu offset = (0.0, 15.0)
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		pos = <pos>
		just = [left top]
		not_focusable
	}
	<container_id> = <id>
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		id = files_menu_down_arrow
		texture = down_arrow
		pos = (240.0, -15.0)
		just = [left bottom]
	}
	GetStackedScreenElementPos y id = <container_id> offset = (-30.0, 0.0)
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		dims = (603.0, 24.0)
		pos = <pos>
		just = [left top]
	}
	<info_section_id> = <id>
	createscreenelement {
		type = textelement
		parent = <id>
		id = files_menu_file_info
		font = text_a1
		text = ""
		pos = (20.0, 0.0)
		scale = <text_scale>
		rgba = ($pause_color_scheme.text_focus_color)
		just = [left center]
		shadow
		shadow_rgba = [0 0 0 128]
		shadow_offs = (2.0, 2.0)
	}
	GetStackedScreenElementPos y id = <info_section_id>
	createscreenelement {
		type = containerelement
		parent = current_menu_anchor
		dims = (603.0, 24.0)
		pos = <pos>
		just = [left top]
	}
	<mem_info_id> = <id>
	getplatform
	getmemcardspaceavailable
	switch <platform>
		case xenon
		printf 'files_menu_add_bottom_bar: Xbox 360'
		case ps3
		printf 'files_menu_add_bottom_bar: PS3'
		default
		script_assert "Unhandled platform %d" d = <platform>
	endswitch
	getmaxthps4filesallowed
	formattext {
		textname = RightText
		"SAVES: %t/%m"
		t = <totalthps4filesoncard>
		m = <maxthps4filesallowed>
	}
	if gotparam save
		createscreenelement {
			type = textelement
			parent = <mem_info_id>
			font = text_a1
			pos = (10.0, -30.0)
			just = [left top]
			rgba = <highlight_rgba>
			scale = <text_scale>
			text = <LeftText>
			shadow
			shadow_rgba = [0 0 0 128]
			shadow_offs = (2.0, 2.0)
		}
	endif
	GetStackedScreenElementPos x id = <id> offset = (20.0, 0.0)
	createscreenelement {
		type = textelement
		parent = <mem_info_id>
		font = text_a1
		pos = <pos>
		just = [left top]
		rgba = <highlight_rgba>
		scale = <text_scale>
		text = <MiddleText>
		shadow
		shadow_rgba = [0 0 0 128]
		shadow_offs = (2.0, 2.0)
	}
	GetStackedScreenElementPos x id = <id> offset = (20.0, 0.0)
	createscreenelement {
		type = textelement
		parent = <mem_info_id>
		font = text_a1
		pos = <pos>
		just = [left top]
		rgba = <highlight_rgba>
		scale = <text_scale>
		text = <RightText>
		shadow
		shadow_rgba = [0 0 0 128]
		shadow_offs = (2.0, 2.0)
	}
endscript

script files_menu_focus 
	gettags
	if gotparam disable_item_overwrite
		create_helper_text helper_text_elements = [{text = "\\m1 BACK"}
			{text = "\\md DELETE"}
		]
	endif
	<highlight_rgba> = ($pause_color_scheme.text_focus_color)
	<bar_rgba> = ($pause_color_scheme.bar_color)
	<files_menu_file_info_text> = ""
	if NOT gotparam index
		if gotparam file_type
			if ($memcard_using_new_save_system = 1)
				getsummaryinfo filetype = <file_type>
			else
				getsummaryinfo <file_type> VaultData = savevaultdata
			endif
		endif
	endif
	gettags
	setscreenelementprops {
		id = {<id> child = filename_text}
		rgba = <highlight_rgba>
	}
	setscreenelementprops {
		id = {<id> child = size}
		rgba = <highlight_rgba>
	}
	if screenelementexists id = {<id> child = icon}
		setscreenelementprops {
			id = {<id> child = icon}
			rgba = [255 255 255 255]
			z_priority = 7
		}
		doscreenelementmorph {
			id = {<id> child = icon}
			scale = (0.7, 0.8)
		}
	endif
	setscreenelementprops {
		id = {<id> child = highlight_bar}
		rgba = <bar_rgba>
	}
	setscreenelementprops {
		id = {<id> child = date}
		rgba = <highlight_rgba>
	}
	setscreenelementprops {
		id = {<id> child = time}
		rgba = <highlight_rgba>
	}
endscript

script mc_SetAndReadFolderInfo 
	if NOT gotparam folderlisting
		return
	endif
	getarraysize folderlisting
	<i> = 0
	begin
	mc_waitasyncopsfinished
	mc_setactivefolder folderindex = <i>
	mc_loadtocinactivefolder
	formattext checksumname = container_id 'files_menu_item_%d' d = <i>
	if screenelementexists id = <container_id>
		<text> = ($damagedfile)
		if (<result> = true)
			if getsummaryinfo filename = "ProgressFile" filetype = progress fromtoc
				memcard_format_datetime <...>
				setscreenelementprops {
					id = {<container_id> child = time}
					text = <time>
				}
				<text> = <date>
			else
				<container_id> :settags corrupt
			endif
		else
			<container_id> :settags corrupt
		endif
		setscreenelementprops {
			id = {<container_id> child = date}
			text = <text>
		}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script files_menu_unfocus 
	<unhighlight_rgba> = ($pause_color_scheme.text_color)
	gettags
	if gotparam disable_item_overwrite
		unhighlight_rgba = [128 128 128 50]
		create_helper_text helper_text_elements = [{text = "\\m1 BACK"}
			{text = "\\m0 ACCEPT"}
			{text = "\\md DELETE"}
		]
	endif
	setscreenelementprops {
		id = {<id> child = filename_text}
		rgba = <unhighlight_rgba>
	}
	setscreenelementprops {
		id = {<id> child = size}
		rgba = <unhighlight_rgba>
	}
	doscreenelementmorph {
		id = {<id> child = size}
		scale = 0.4
	}
	if screenelementexists id = {<id> child = icon}
		setscreenelementprops {
			id = {<id> child = icon}
			rgba = [50 50 50 128]
			z_priority = 6
		}
		doscreenelementmorph {
			id = {<id> child = icon}
			scale = 0.0
		}
	endif
	setscreenelementprops {
		id = {<id> child = highlight_bar}
		rgba = [128 128 128 0]
	}
	setscreenelementprops {
		id = {<id> child = date}
		rgba = <unhighlight_rgba>
	}
	doscreenelementmorph {
		id = {<id> child = date}
		scale = 0.4
	}
	setscreenelementprops {
		id = {<id> child = time}
		rgba = <unhighlight_rgba>
	}
	doscreenelementmorph {
		id = {<id> child = time}
		scale = 0.4
	}
endscript

script files_menu_delete 
	gettags
	if gotparam no_delete
		return
	endif
	if ($memcard_using_new_save_system = 1)
		memcard_wait_for_async
		if gotparam folderindex
			if NOT gotparam MenuFileType
				MenuFileType = progress
			endif
			mc_setactivefolder folderindex = <folderindex>
		else
			if gotparam filename
			else
				return
			endif
		endif
		memcard_menus_cleanup
		soundevent event = Goal_UI_Negative_Text
		GetFileTypeName file_type = <file_type>
		<return_param> = {}
		if gotparam save
			<return_param> = {save}
		endif
		if isps3
			if ($FilesOrFolders = folders)
				if ($savingorloading = saving)
					<return_param> = {save}
				endif
				memcard_invoke_ps3_delete_menu
				goto launch_files_menu params = {filetype = <file_type> <return_param>}
			endif
		endif
		formattext {
			textname = DeleteText
			"Delete the %t file\\n'%s' ?"
			t = <filetype_name>
			s = <filename>
			s = <foldername>
		}
		create_dialog_box {
			title = "DELETE"
			text = <DeleteText>
			pad_back_script = launch_files_menu
			pad_back_params = {filetype = <file_type> <return_param>}
			buttons = [
				{font = text_a1 text = "CANCEL" pad_choose_script = launch_files_menu pad_choose_params = {filetype = <file_type> <return_param>}}
				{font = text_a1 text = "DELETE" pad_choose_script = delete_file pad_choose_params = <...>}
			]
			text_dims = (700.0, 0.0)
			vmenu_width = 600
			destroy_on_event = 0
		}
		checkforcardremoval menu_id = dialog_box_anchor
	else
		if isps3
			if gotparam save
				printf "Trying to delete PS3 game."
				fadetoblack on alpha = 0.7 time = 0
				AutoListDeleteStart
				begin
				if AutoListDeleteFinished
					break
				else
					wait 1 gameframe
				endif
				repeat
				printf "Delete PS3 game script done."
				fadetoblack off
				mcmess_checkingcard
				launch_files_menu filetype = progress save
				return
			endif
		endif
		if gotparam index
			if gotparam save
				memcard_menus_cleanup
				soundevent event = Goal_UI_Negative_Text
				GetFileTypeName file_type = <file_type>
				formattext {
					textname = DeleteText
					"Delete the %t file\\n'%s' ?"
					t = <filetype_name>
					s = <filename>
				}
				create_dialog_box {
					title = "DELETE"
					text = <DeleteText>
					pad_back_script = launch_files_menu
					pad_back_params = {filetype = <MenuFileType> save}
					buttons = [
						{font = text_a1 text = "CANCEL" pad_choose_script = launch_files_menu pad_choose_params = {filetype = <MenuFileType> save}}
						{font = text_a1 text = "DELETE" pad_choose_script = delete_file pad_choose_params = <...>}
					]
					destroy_on_event = 0
				}
				checkforcardremoval menu_id = dialog_box_anchor
			endif
		endif
	endif
endscript

script delete_file 
	if ($memcard_using_new_save_system = 1)
		memcard_menus_cleanup
		change StopCheckingForCardRemoval = 1
		resettimer
		if NOT isps3
			mcmess_deletingfile filetype = <file_type>
		endif
		if ($FilesOrFolders = folders)
			mc_deletefolder foldername = <foldername>
			mc_setactivefolder folderindex = -1
		else
			deletememcardfile filename = <filename> filetype = <file_type>
		endif
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
		if (<result> = false)
			goto mcmess_errordeletefailed
		endif
		soundevent event = Sk9_Temp_Goal_Chkpt_SFX
		create_dialog_box {
			title = "DELETED"
			text = "Delete successful"
			pad_back_script = launch_files_menu
			pad_back_params = {filetype = <file_type> <return_param>}
			buttons = [
				{font = text_a1 text = "OK" pad_choose_script = launch_files_menu pad_choose_params = {filetype = <file_type> <return_param>}}
			]
			destroy_on_event = 0
		}
		checkforcardremoval menu_id = dialog_box_anchor
	else
		setsavefilename filetype = <file_type> name = <filename>
		memcard_menus_cleanup
		change StopCheckingForCardRemoval = 1
		resettimer
		mcmess_deletingfile filetype = <file_type>
		if deletememcardfile filetype = <file_type>
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			setsavefilename filetype = <file_type> clear
			soundevent event = Sk9_Temp_Goal_Chkpt_SFX
			create_dialog_box {
				title = "DELETED"
				text = "Delete successful"
				pad_back_script = launch_files_menu
				pad_back_params = {filetype = <MenuFileType> save}
				buttons = [
					{font = text_a1 text = "OK" pad_choose_script = launch_files_menu pad_choose_params = {filetype = <MenuFileType> save}}
				]
				destroy_on_event = 0
			}
			checkforcardremoval menu_id = dialog_box_anchor
		else
			setsavefilename filetype = <file_type> clear
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			goto mcmess_errordeletefailed
		endif
	endif
endscript

script oktooverwrite 
	soundevent event = generic_menu_pad_choose_sfx
	if gotparam NoGetTags
	else
		gettags
	endif
	if ((gotparam badversion) || (gotparam corrupt))
		create_snazzy_dialog_box {
			title = "WARNING"
			text = "Cannot overwrite damaged saved data. Please delete this saved data first."
			buttons = [
				{font = text_a1 text = "CANCEL" pad_choose_script = destroy_dialog_box}
			]
		}
		return
	endif
	memcard_menus_cleanup
	if ($memcard_using_new_save_system = 1)
		memcard_wait_for_async
		if gotparam folderindex
			mc_setactivefolder folderindex = <folderindex>
			mc_loadtocinactivefolder
		endif
		if NOT MC_SpaceForNewFile filetype = <MenuFileType>
			mc_setactivefolder folderindex = -1
			goto mcmess_errornotenoughroombutthpsfilesexist params = {
				overwrite
				filetype = <MenuFileType>
				spacerequired = <spacerequired>
				spaceavailable = (<spaceavailable> + <total_file_size>)
			}
		endif
	else
		GetMemCardSpaceRequired <MenuFileType>
		getmemcardspaceavailable
		if (<spacerequired> > <spaceavailable> + <total_file_size>)
			goto mcmess_errornotenoughroombutthpsfilesexist params = {
				overwrite
				filetype = <MenuFileType>
				spacerequired = <spacerequired>
				spaceavailable = (<spaceavailable> + <total_file_size>)
			}
		endif
	endif
	GetFileTypeName file_type = <file_type>
	formattext {
		textname = OverwriteText
		"ok to overwrite the existing %t file\\n'%s' ?"
		t = <filetype_name>
		s = <filename>
		s = <foldername>
	}
	create_snazzy_dialog_box {
		title = "OVERWRITE?"
		text = <OverwriteText>
		pad_back_script = overwrite_launch_files_menu
		pad_back_params = {filetype = <MenuFileType> save}
		buttons = [
			{font = text_a1 text = "CANCEL" pad_choose_script = launch_files_menu pad_choose_params = {filetype = <MenuFileType> save}}
			{
				font = text_a1 text = "OVERWRITE"
				pad_choose_script = deleteoldsavenew
				pad_choose_params =
				{
					filename = <filename>
					filename = <foldername>
					old_file_type = <file_type>
					new_file_type = <MenuFileType>
					actual_file_name = <actual_file_name>
				}
			}
		]
		destroy_on_event = 0
	}
	checkforcardremoval menu_id = dialog_box_anchor
endscript

script deleteoldsavenew 
	save {
		filename = <filename>
		filename = <foldername>
		file_type = <new_file_type>
		total_file_size = <total_file_size>
		overwrite = {CardFileName = <actual_file_name> UserFileName = <filename> type = <old_file_type>}
	}
endscript

script retry_launch_autosave_menu_save_game_sequence 
	memcard_menus_cleanup
	goto \{launch_autosave_menu_save_game_sequence
		params = {
			SetAbortScript = 0
			force = 1
		}}
endscript

script launch_autosave_menu_save_game_sequence \{SetAbortScript = 1
		force = 0}
	change \{memcard_menus_active = 1}
	destroy_pause_menu
	killallmovies \{blocking}
	change \{RetryScript = retry_launch_autosave_menu_save_game_sequence}
	if (<SetAbortScript> = 1)
		change abortscript = ($DoneScript)
	endif
	change \{savingorloading = saving}
	change \{FilesOrFolders = folders}
	check_card filetype = progress save force = <force>
	game_progress_autosave_inactive
	launch_files_menu \{save
		filetype = progress}
endscript
save_successful = 2
load_successful = 2
loadforupload = 0

script retry_launch_options_menu_save_game_sequence 
	memcard_menus_cleanup
	goto \{launch_options_menu_save_game_sequence}
endscript

script launch_options_menu_save_game_sequence 
	destroy_main_menu
	if isps3
		killallmovies \{blocking}
	endif
	change \{RetryScript = retry_launch_options_menu_save_game_sequence}
	change \{abortscript = back_to_options_menu}
	change \{DoneScript = back_to_options_menu}
	change \{savingorloading = saving}
	change \{FilesOrFolders = folders}
	check_card \{save
		filetype = progress}
	launch_files_menu \{save
		filetype = progress}
endscript

script GetProgressFilename 
	GetSkaterProfileInfoByName \{name = custom_story}
	if NOT gotparam \{display_name}
		scriptassert \{'profile not found'}
	endif
	return filename = <display_name>
endscript
memcard_force_create_new_name = ""

script createnew 
	gettags
	soundevent event = generic_menu_pad_choose_sfx
	memcard_menus_cleanup
	memcard_wait_for_async
	if NOT (($memcard_force_create_new_name) = "")
		<filename> = ($memcard_force_create_new_name)
	else
		switch <file_type>
			case progress
			GetProgressFilename
			case videoclip
			<filename> = "Video Clip"
			case videorender
			<filename> = "Finalized Edit"
			case NetworkSettings
			<filename> = "Online Prefs"
			case photo
			<filename> = "Photograph"
			default
			<filename> = "Dooby Doo"
		endswitch
	endif
	if (savevaultdata = 1)
		GetScriptString
		filename = <string>
	endif
	if ($memcard_using_new_save_system = 0)
		pausemusic 1
		pausestream 1
		MemCardGetUniqueFileName filetype = <file_type> filename = <filename> max_chars = $max_memcard_filename_length
		pausemusic -1
		pausestream -1
	else
		if ($FilesOrFolders = folders)
			MC_GetUniqueFolderName foldername = <filename>
			<filename> = <uniquefoldername>
		else
			MemCardGetUniqueFileName filetype = <file_type> filename = <filename>
			<filename> = <uniquefilename>
		endif
	endif
	create_onscreen_keyboard {
		allow_cancel
		keyboard_cancel_script = launch_files_menu
		keyboard_cancel_params = {filetype = <file_type> save}
		keyboard_done_script = createnew_done
		keyboard_title = "SAVE NAME"
		text = <filename>
		min_length = 1
		max_length = (($max_memcard_filename_length) - 1)
		filetype = <file_type>
		disable_special_character_tabs
	}
	checkforcardremoval menu_id = keyboard_anchor
endscript

script createnew_done 
	keyboard_current_string :text_getstring
	stringremovetrailingwhitespace param = string
	memcard_menus_cleanup
	if (savevaultdata = 0)
		switch <filetype>
			case progress
			SetCustomSkaterFilename <string>
		endswitch
	endif
	if NOT cardisinslot
		goto mcmess_errornocardinslot
	endif
	if ($memcard_using_new_save_system = 1)
		if ($FilesOrFolders = folders)
			if mc_folderexists foldername = <string>
				mc_setactivefolder foldername = <string>
				mc_loadtocinactivefolder
				oktooverwrite NoGetTags filename = <string> file_type = <filetype> MenuFileType = <filetype> total_file_size = <total_file_size>
			else
				save filename = <string> file_type = <filetype>
			endif
		else
			if memcardfileexists filename = <string> filetype = <filetype>
				oktooverwrite NoGetTags filename = <string> file_type = <filetype> MenuFileType = <filetype> total_file_size = <total_file_size>
			else
				save filename = <string> file_type = <filetype>
			endif
		endif
	else
		if memcardfileexists name = <string> filetype = <filetype>
			oktooverwrite NoGetTags filename = <string> file_type = <filetype> MenuFileType = <filetype> total_file_size = <total_file_size>
		else
			save filename = <string> file_type = <filetype>
		endif
	endif
endscript

script mcmess_AutosaveWarning 
	if isps3
		dialog_text = "This title will automatically save periodically.\\nYou will notice an animating icon in the corner of the screen with accompanying text when this happens.\\nPlease ensure you do not turn off your console while it is performing this operation."
	else
		dialog_text = "This title will automatically save periodically.\\nYou will notice an animating icon in the corner of the screen with accompanying text when this happens.\\nPlease ensure you do not turn off your Xbox 360 console while it is performing this operation."
	endif
	do_ok_dialog_box {
		preserve_case
		text_dims = (820.0, 0.0)
		vmenu_width = 720
		title = "Autosave Warning"
		text = <dialog_text>
	}
endscript

script save 
	if ($memcard_using_new_save_system = 1)
		memcard_menus_cleanup
		switch <file_type>
			case progress
			SetCustomSkaterFilename <filename>
		endswitch
		if ($FilesOrFolders = folders)
			mcmess_AutosaveWarning
		endif
		resettimer
		memcard_wait_for_async
		change StopCheckingForCardRemoval = 1
		if gotparam overwrite
			mcmess_overwritingdata filetype = <file_type>
		else
			mcmess_savingdata filetype = <file_type>
		endif
		change StopCheckingForCardRemoval = 0
		net_view_goals_create_searching_text {
			text = "Please Wait..."
			scale = 0.75
			parent = root_window
			id = explicit_save_animation_icon
		}
		if ($FilesOrFolders = folders)
			mc_createfolder name = <filename> desc = CombinedProgression
			if (<result> = false)
				runscriptonscreenelement id = explicit_save_animation_icon net_view_goals_searching_fade_out_and_die
				removememcardpoolsandloadanims
				goto mcmess_errorsavefailed
			endif
			savetomemorycard filename = "ProgressFile" filetype = progress usepaddingslot = always
			memcard_wait_for_timer
			runscriptonscreenelement id = explicit_save_animation_icon net_view_goals_searching_fade_out_and_die
			if (<result> = false)
				removememcardpoolsandloadanims
				goto mcmess_errorsavefailed
			endif
		else
			savetomemorycard filename = <filename> filetype = <file_type> usepaddingslot = never
			memcard_wait_for_timer
			runscriptonscreenelement id = explicit_save_animation_icon net_view_goals_searching_fade_out_and_die
			if (<result> = false)
				removememcardpoolsandloadanims
				goto mcmess_errorsavefailed
			endif
		endif
		removememcardpoolsandloadanims
		if gotparam overwrite
			goto mcmess_overwritesuccessful params = {type = <file_type> name = <filename>}
		else
			goto mcmess_savesuccessful params = {type = <file_type> name = <filename>}
		endif
	else
		setsavefilename filetype = <file_type> name = <filename>
		memcard_menus_cleanup
		GetCurrentSkaterProfileIndex
		if (savevaultdata = 0)
			switch <file_type>
				case progress
				SetCustomSkaterFilename <filename>
			endswitch
		endif
		resettimer
		if gotparam overwrite
			if isps3
				mcmess_overwritingdata filetype = <file_type>
			else
				change StopCheckingForCardRemoval = 1
				mcmess_overwritingdata filetype = <file_type>
				change StopCheckingForCardRemoval = 0
				if NOT deletememcardfile filetype = (<overwrite>.type)
					removememcardpoolsandloadanims
					goto mcmess_erroroverwritefailed
				endif
				if memcardfileexists name = <filename> filetype = <file_type>
					goto oktooverwrite params = {NoGetTags filename = <filename> file_type = <file_type> MenuFileType = <file_type> total_file_size = <total_file_size>}
				endif
			endif
		else
			mcmess_savingdata filetype = <file_type>
		endif
		if savetomemorycard filetype = <file_type>
			removememcardpoolsandloadanims
			mem_card_message_pause NoTimerReset NoCardRemovalCheck
			if ($save_successful = 0)
				change save_successful = 1
				goto abortscript params = {type = <file_type>}
			else
				if gotparam overwrite
					goto mcmess_overwritesuccessful params = {type = <file_type> name = <filename>}
				else
					goto mcmess_savesuccessful params = {type = <file_type> name = <filename>}
				endif
			endif
		else
			removememcardpoolsandloadanims
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			if gotparam overwrite
				goto mcmess_erroroverwritefailed
			else
				goto mcmess_errorsavefailed
			endif
		endif
	endif
endscript
DoAutoload = 1
no_load = 0
most_recent_save_exists = 0
attempted_xbox_autoload = 0
goto_secret_shop = 0

script maybe_go_back_to_online_lobby 
	if checkforsignin
		if gamemodeequals \{is_net}
			if netsessionfunc \{func = match_started}
				if netsessionfunc \{obj = match
						func = logged_in}
					goto \{xboxlive_menu_create}
				endif
			endif
		endif
	endif
endscript

script maybe_auto_load_from_memory_card 
	if gotparam create
		change ui_cas_skater_selected = 1
	endif
	if ($DoAutoload = 0)
		spawnscriptlater wait_and_pause_skater params = {time = 1 dont_pause_music = 1}
		maybe_go_back_to_online_lobby
		launch_main_menu
	else
		change DoAutoload = 0
		maybe_go_back_to_online_lobby
		if NOT gotparam force_autoload
			wait 3 gameframes
			if NOT padspluggedin
				goto launch_main_menu
			endif
			spawnscriptlater wait_and_pause_skater
			goto launch_main_menu
		else
			spawnscriptlater wait_and_pause_skater params = {time = 1}
			checkforcardonbootup
		endif
	endif
endscript

script checkforcardonbootup \{force = 0}
	ResetAbortAndDoneScripts
	change \{savingorloading = loading}
	change \{FilesOrFolders = folders}
	if (($memcard_using_autosave = 1) && (<force> = 0))
		memcard_select_source \{force = 0}
	else
		memcard_select_source \{force = 1}
	endif
	if cardisinslot
		goto \{auto_load}
	else
		change \{RetryScript = checkforcardonbootup}
		change \{abortscript = auto_load_finished}
		goto \{mcmess_errornocardonbootup}
	endif
endscript

script auto_load 
	if ($no_load = 0)
		memcard_menus_cleanup
	endif
	change abortscript = auto_load_finished
	change DoneScript = auto_load_finished
	change RetryScript = checkforcardonbootup
	change savingorloading = loading
	change FilesOrFolders = folders
	stopmusic
	if NOT cardisinslot
		goto mcmess_errornocardonbootup
	endif
	resettimer
	mcmess_checkingcard
	if NOT cardisinslot
		goto mcmess_errornocardonbootup
	endif
	if NOT cardisformatted
		mem_card_message_pause NoTimerReset NoCardRemovalCheck
		goto mcmess_errornotformatted params = {quittext = "Continue without formatting" backscript = nullscript}
	endif
	if NOT cardisinslot
		goto mcmess_errornocardonbootup
	endif
	if ($no_load = 0)
		getmemcarddirectorylisting filetype = progress
		if gotparam corruptcontentdetected
			goto mcmess_ErrorCorruptContentDetectedOnBootup
		endif
	endif
	<did_load> = 0
	if NOT cardisinslot
		goto mcmess_errornocardonbootup
	endif
	GetMostRecentSave <directorylisting> progress
	if gotparam mostrecentsave
		if (<did_load> = 0)
			resettimer
			mcmess_loadingdata filetype = progress
		endif
		setsectionstoapplywhenloading all
		setsavefilename filetype = progress name = (<mostrecentsave>.filename)
		if NOT loadfrommemorycard filetype = progress
			mem_card_message_pause NoTimerReset NoCardRemovalCheck
			if NOT cardisinslot
				goto mcmess_errornocardonbootup
			endif
			goto mcmess_errorloadfailed params = {
				<...>
				filename = (<mostrecentsave>.filename)
				actual_file_name = (<mostrecentsave>.actual_file_name)
				file_type = progress
			}
		endif
		<did_load> = 1
	endif
	if (<did_load> = 1)
		mem_card_message_pause NoTimerReset
	endif
	if NOT gotparam mostrecentsave
		goto mcmess_nofiles params = {MenuFileType = progress}
	endif
	goto auto_load_finished params = {success}
endscript

script ingame_auto_load 
	ResetAbortAndDoneScripts
	change \{savingorloading = loading}
	change \{FilesOrFolders = folders}
	memcard_select_source \{force = 0}
	if cardisinslot
		auto_load
	endif
endscript

script mem_card_restore_network_config 
	getpreferencechecksum \{pref_type = network
		config_type}
	switch <checksum>
		case config_sony
		if LoadNetConfigs
			GetPreferenceString \{pref_type = network
				config_type}
			ChooseNetConfig name = <ui_string>
		else
			clear_config_type
			clear_device_type
		endif
	endswitch
endscript
DoInitialiseCreatedGoalsAfterLoading = 0

script retry_launch_options_menu_load_game_sequence 
	memcard_menus_cleanup
	goto \{launch_options_menu_load_game_sequence
		params = {
			force = 1
		}}
endscript

script retry_launch_career_menu_load_game_sequence 
	memcard_menus_cleanup
	goto \{launch_career_menu_load_game_sequence
		params = {
			force = 1
		}}
endscript

script launch_career_menu_load_game_sequence 
	dialog_box_exit
	destroy_main_menu
	if isps3
		killallmovies \{blocking}
	endif
	reset_career_progress
	skater :hide
	change \{RetryScript = retry_launch_career_menu_load_game_sequence}
	change \{abortscript = back_to_career_options_menu}
	change \{DoneScript = back_to_career_options_menu}
	change \{savingorloading = loading}
	change \{FilesOrFolders = folders}
	setsectionstoapplywhenloading \{all}
	killallmovies \{blocking}
	check_card filetype = progress force = <force>
	launch_files_menu \{filetype = progress}
endscript

script launch_options_menu_load_game_sequence 
	printf "launch_options_menu_load_game_sequence"
	destroy_main_menu
	if isps3
		killallmovies blocking
	endif
	reset_career_progress
	change RetryScript = retry_launch_options_menu_load_game_sequence
	change abortscript = back_to_options_menu
	change DoneScript = back_to_options_menu
	change savingorloading = loading
	change FilesOrFolders = folders
	setsectionstoapplywhenloading all
	check_card filetype = progress force = <force>
	launch_files_menu filetype = progress
endscript

script launch_xbox_live_load_game_sequence 
	printf "launch_xbox_live_load_game_sequence"
	load_level_handle_loading_screen
	destroy_main_menu
	if screenelementexists id = dialog_xbox_anchor
		destroyscreenelement id = dialog_xbox_anchor
	endif
	if isps3
		killallmovies blocking
	endif
	reset_career_progress no_random_skater
	change RetryScript = retry_launch_xbox_live_load_game_sequence
	change abortscript = back_to_xbox_live
	change DoneScript = back_to_xbox_live
	change savingorloading = loading
	change FilesOrFolders = folders
	setsectionstoapplywhenloading all
	hideloadingscreen
	if gotparam force
		if (<force> = 1)
			check_card filetype = progress force = <force>
		endif
	endif
	launch_files_menu filetype = progress
endscript

script retry_launch_xbox_live_load_game_sequence 
	memcard_menus_cleanup
	goto \{launch_xbox_live_load_game_sequence
		params = {
			force = 1
		}}
endscript

script load 
	gettags
	soundevent event = generic_menu_pad_choose_sfx
	if ((gotparam badversion) || (gotparam corrupt))
		return
	endif
	memcard_menus_cleanup
	if screenelementexists id = helper_text_anchor
		destroyscreenelement id = helper_text_anchor
	endif
	generic_menu_pad_choose_sound
	if ($FilesOrFolders = folders)
		mcmess_AutosaveWarning
	endif
	resettimer
	mcmess_loadingdata filetype = <file_type>
	if ($memcard_using_new_save_system = 1)
		memcard_wait_for_async
		if gotparam folderindex
			mc_setactivefolder folderindex = <folderindex>
			mc_loadtocinactivefolder
		endif
		mcmess_loadingdata filetype = <file_type> no_animate = no_animate
		if ($FilesOrFolders = folders)
			filename = "ProgressFile"
		endif
		net_view_goals_create_searching_text {
			text = "Please Wait..."
			scale = 0.75
			parent = root_window
			id = explicit_load_animation_icon
		}
		loadfrommemorycard filetype = <file_type> filename = <filename>
		runscriptonscreenelement id = explicit_load_animation_icon net_view_goals_searching_fade_out_and_die
		mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
		if (<result> = false)
			mc_setactivefolder folderindex = -1
			if NOT cardisinslot
				goto mcmess_errornocardinslot
			endif
			goto mcmess_errorloadfailed params = {<...> GoBackToFilesMenu}
		endif
		if ($load_successful = 0)
			mc_setactivefolder folderindex = -1
			change load_successful = 1
			goto abortscript params = {type = <file_type> filename = <filename>}
		else
			post_load_from_memory_card filetype = <file_type>
			goto mcmess_loadsuccessful params = {type = <file_type> filename = <filename>}
		endif
	else
		setsavefilename filetype = <file_type> name = <filename>
		if loadfrommemorycard filetype = <file_type>
			mcmess_loadingdata filetype = <file_type> no_animate = no_animate
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			if ($load_successful = 0)
				change load_successful = 1
				goto abortscript params = {type = <file_type> filename = <filename>}
			else
				if (<file_type> = NetworkSettings)
					mem_card_restore_network_config
				endif
				goto mcmess_loadsuccessful params = {type = <file_type> filename = <filename>}
			endif
		else
			mem_card_message_pause XSkips NoTimerReset NoCardRemovalCheck
			if NOT cardisinslot
				goto mcmess_errornocardinslot
			endif
			goto mcmess_errorloadfailed params = {<...> GoBackToFilesMenu}
		endif
	endif
endscript

script CardIsFormatted_Sync 
	cardisformatted
	if cardisformatted
		return \{true}
	else
		return \{false}
	endif
endscript

script post_load_from_memory_card 
	if NOT gotparam filetype
		printstruct <...>
		script_assert "Expected to find parameter 'type'!"
	endif
	switch <filetype>
		case progress
		career_post_load
		cas_post_load
		case videoclip
		printf 'Loaded video clip.'
		case videorender
		printf 'Loaded video render.'
		case photo
		printf 'Loaded photograph.'
	endswitch
endscript

script unloadanimsandcreatememcardpools 
	if NOT infrontend
		change \{debugpausedobjects = 1}
		if (<filetype> = progress)
			PushTemporaryMemCardPools \{heap = scratch}
		endif
	else
		if (<filetype> = progress)
			PushTemporaryMemCardPools \{heap = scratch}
		endif
	endif
endscript

script removememcardpoolsandloadanims 
	if NOT infrontend
		PopTemporaryMemCardPools
		change \{debugpausedobjects = 0}
	else
		PopTemporaryMemCardPools
	endif
endscript

script reload_anims_then_run_abort_script 
	change movies_disabled = 0
	printf "reload_anims_then_run_abort_script"
	broadcastevent type = ingame_save_finished
	if NOT gotparam keep_ui
		if objectexists id = current_menu_anchor
			destroyscreenelement id = current_menu_anchor
		endif
		destroy_dialog_box
	endif
	if ($memcard_using_new_save_system = 1)
		if ($FilesOrFolders = folders)
			memcard_wait_for_async
			mc_setactivefolder folderindex = -1
		endif
	endif
	removememcardpoolsandloadanims
	goto abortscript
endscript

script memcard_validate_known_device 
	if mc_hasactivefolder
		return true
	else
		if cardisinslot
			mc_waitasyncopsfinished
			mc_enumeratefolders
			if (<result> = true)
				mc_loadtocinactivefolder validateprev
				if (<result> = true)
					return true
				elseif (<errorcode> = invalidtoc)
					return false {corrupt = 0}
				else
					if mc_hasvalidatedfolder
						if mc_folderexists foldername = <validated_folder>
							return false {corrupt = 1}
						endif
					endif
					return false {corrupt = 0}
				endif
			endif
		endif
	endif
	return false {corrupt = 0}
endscript

script ingame_quicksave heap = scratch usepaddingslot = never
	if ($memcard_using_new_save_system = 0)
		scriptassert 'Old system no longer supported'
	endif
	startdelaysystemui
	stopdelaysystemui
	if gotparam suspend_ui
		create_dialog_box_with_wait {
			title = ""
			text = "Please wait..."
			text_dims = (350.0, 0.0)
			vmenu_width = 400
			wait_frames = 3
		}
		change autosave_initiated_pause = 0
		autosave_pause_game
	endif
	memcard_start_saving_icon_anim manual_save = <manual_save>
	wait 2 gameframes
	killallmovies blocking
	if NOT gotparam no_pools
		PushTemporaryMemCardPools heap = <heap>
	endif
	mc_waitasyncopsfinished
	savetomemorycard filetype = <filetype> filename = <filename> usepaddingslot = <usepaddingslot>
	if NOT gotparam no_pools
		PopTemporaryMemCardPools
	endif
	memcard_stop_saving_icon_anim
	if gotparam suspend_ui
		destroy_dialog_box
		if ($autosave_initiated_pause = 1)
			unpausegame
			autosave_initiated_pause = 0
		endif
	endif
	if (<result> = false)
		mc_setactivefolder folderindex = -1
		goto mcmess_ErrorQuickSaveFailed params = {filetype = <filetype>}
	endif
	goto DoneScript params = {autosave}
endscript

script memcard_force_overwrite_content 
	if NOT cardisinslot
		goto \{mcmess_errornocardinslot}
	endif
	if OverwriteCorruptMemcardContent
		goto \{mcmess_ErrorCorruptContentOverwriteSuccessful}
	else
		goto mcmess_ErrorCorruptContentOverwriteFailed params = {filetype = <filetype>}
	endif
endscript

script memcard_start_saving_icon_anim 
	if gotparam manual_save
		printf 'MANUAL SAVE!'
	endif
	if isps3
		if gotparam manual_save
			text = "Saving, please do not turn off your Console"
		else
			text = "Autosaving, please do not turn off your Console"
		endif
	else
		text = "Saving content. Please don't turn off your console."
	endif
	stringlength string = <text>
	width = (<str_len> * 17)
	pos = (((1.0, 0.0) * (1350 - (<width> * 0.95))) + (0.0, 50.0))
	if NOT screenelementexists id = autosave_icon_anim
		net_view_goals_create_searching_text {
			text = <text>
			scale = 0.75
			parent = root_window
		}
	endif
	resettimer
endscript

script memcard_wait_for_timer 
	begin
	if timegreaterthan \{3.5}
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script memcard_stop_saving_icon_anim 
	memcard_wait_for_timer
	if screenelementexists \{id = net_view_goals_searching_cont}
		runscriptonscreenelement \{id = net_view_goals_searching_cont
			net_view_goals_searching_fade_out_and_die}
	endif
endscript

script memcard_invoke_ps3_delete_menu 
	generic_ui_destroy
	if mc_startps3forcedelete
		begin
		wait 1 gameframe
		if mc_isps3forcedeletefinished
			break
		endif
		repeat
	endif
	if gotparam delete_error
		switch (<delete_error>)
			case 1
			errorbit = "Corrupt data was found."
			case 3
			errorbit = "Save device wasn't found."
			case 5
			errorbit = "Invalid save path."
			case 6
			errorbit = "Invalid user."
			default
			errorbit = ""
		endswitch
		formattext textname = text "There was a problem deleting saved data.\\n%s" s = <errorbit>
		do_ok_dialog_box {
			preserve_case
			text_dims = (600.0, 0.0)
			vmenu_width = 500
			title = "Delete Error"
			text = <text>
		}
	endif
endscript

script memcard_wait_for_async 
	if NOT gotparam dont_remove_helper_text
		if screenelementexists id = helper_text_anchor
			destroyscreenelement id = helper_text_anchor
		endif
	endif
	if isps3
		if NOT MC_AsyncOpsFinished
			setbuttoneventmappings block_menu_input
			net_view_goals_create_searching_text {
				text = "Please Wait..."
				scale = 0.75
				parent = root_window
				id = explicit_delete_animation_icon
			}
			mc_waitasyncopsfinished
			runscriptonscreenelement id = explicit_delete_animation_icon net_view_goals_searching_fade_out_and_die
			setbuttoneventmappings unblock_menu_input
		endif
	else
		mc_waitasyncopsfinished
	endif
endscript

script memcard_delete_no_th_saves 
	memcard_wait_for_async
	memcard_invoke_ps3_delete_menu
	if mc_spacefornewfolder \{desc = CombinedProgression}
		change \{savingorloading = saving}
		change \{FilesOrFolders = folders}
		check_card \{save
			filetype = progress}
		launch_files_menu \{save
			filetype = progress}
	else
		goto \{mcmess_NoSpaceForNew
			params = {
				MenuFileType = progress
				desc = CombinedProgression
				repeated
			}}
	endif
endscript
