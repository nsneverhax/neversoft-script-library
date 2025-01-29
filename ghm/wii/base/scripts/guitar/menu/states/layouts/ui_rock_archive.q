0x70bd8ea4 = 'Left'
0xf6d41735 = 0
0xaf06ebae = 0
0x6a497b89 = 0
0x20f6de92 = 0
0x1b16e2ae = 0
0xee50c91d = 0
0x966e4c9b = 0
0x91757f65 = 0
dlc_max_songs_on_sd = 120
dlc_max_songs_in_setlist = 140

script ui_create_rock_archive 
	Change \{0x6a497b89 = 1}
	CreateScreenElement {
		parent = root_window
		id = 0x9dc36fd8
		Type = descinterface
		desc = 'Rock_Archive'
		exclusive_device = ($primary_controller)
		0xadfb20aa = qs(0xada70e74)
		0xc56709b5 = qs(0x93160aae)
		0x5756958d = qs(0x00000000)
		0xc9cb2726 = qs(0x00000000)
	}
	cntsdcardwasejected
	0xdb135deb
	if 0x9dc36fd8 :desc_resolvealias \{Name = 0xdc043203}
		AssignAlias id = <resolved_id> alias = 0x2995e534
	endif
	if 0x9dc36fd8 :desc_resolvealias \{Name = 0xdc6076d7}
		AssignAlias id = <resolved_id> alias = 0x6428420f
	endif
	if 0x9dc36fd8 :desc_resolvealias \{Name = 0x645725c3}
		AssignAlias id = <resolved_id> alias = 0x4b723163
		0x4b723163 :se_setprops \{alpha = 0}
	endif
	if 0x9dc36fd8 :desc_resolvealias \{Name = 0xe572f6ba}
		AssignAlias id = <resolved_id> alias = 0x338b7046
		0x338b7046 :se_setprops \{alpha = 0}
	endif
	if 0x9dc36fd8 :desc_resolvealias \{Name = 0xfaa6a6c3}
		AssignAlias id = <resolved_id> alias = 0xfd0f5931
		if 0x9dc36fd8 :desc_resolvealias \{Name = alias_selectionhighlight}
			AssignAlias id = <resolved_id> alias = 0x72a2ec2a
			0x72a2ec2a :se_setprops \{parent = 0xfd0f5931
				Pos = (0.0, 0.0)
				alpha = 0}
		endif
	endif
	0x2995e534 :se_setprops \{event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
			}
			{
				pad_down
				generic_menu_up_or_down_sound
			}
			{
				pad_back
				generic_event_back
			}
			{
				pad_option2
				0x3a44225a
				params = {
					from = 'Left'
					to = 'Right'
				}
			}
			{
				pad_option
				0xce474c5c
			}
		]}
	0x6428420f :se_setprops \{event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
			}
			{
				pad_down
				generic_menu_up_or_down_sound
			}
			{
				pad_back
				generic_event_back
			}
			{
				pad_option2
				0x3a44225a
				params = {
					from = 'Right'
					to = 'Left'
				}
			}
			{
				pad_option
				0xce474c5c
			}
		]}
	0xd43ac924
endscript

script ui_destroy_rock_archive 
	DestroyScreenElement \{id = 0x9dc36fd8}
	Change \{0x6a497b89 = 0}
	clean_up_user_control_helpers
endscript

script 0xe7374c25 
	ExtendCrc <id> '_Highlight' out = highlight_id
	<highlight_id> :se_setprops alpha = 0
	if GetScreenElementChildren id = <id>
		GetArraySize <children>
		LaunchEvent Type = unfocus target = <id>
		if NOT (<array_Size> = 0)
			i = 0
			begin
			DestroyScreenElement id = (<children> [<i>])
			i = (<i> + 1)
			repeat <array_Size>
		endif
	endif
endscript

script 0xdb135deb 
	if cntsdiscardpresent
		RunScriptOnScreenElement \{id = 0x9dc36fd8
			0x7bd4bb21}
	else
		RunScriptOnScreenElement \{id = 0x9dc36fd8
			0x5fd719eb}
	endif
endscript

script 0x5fd719eb 
	begin
	if cntsdiscardpresent
		cntsdcardwasejected
		SpawnScriptNow \{0xdb135deb}
		SpawnScriptNow \{0x87822280}
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script 0x7bd4bb21 
	begin
	if cntsdcardwasejected
		SpawnScriptNow \{0xdb135deb}
		SpawnScriptNow \{0x162518df}
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script 0xd43ac924 \{0x668c8182 = 0}
	KillSpawnedScript \{Name = 0xe52f77ea}
	SpawnScriptNow 0xe52f77ea params = <...>
endscript

script 0xe52f77ea \{0x668c8182 = 0}
	begin
	if NOT ScriptIsRunning \{0xd772dbd6}
		break
	endif
	WaitOneGameFrame
	repeat
	begin
	if NOT ScreenElementExists \{id = generic_popupelement}
		break
	endif
	WaitOneGameFrame
	repeat
	0x72a2ec2a :se_setprops \{parent = 0xfd0f5931
		Pos = (0.0, 0.0)
		alpha = 0}
	0xe7374c25 \{id = 0x2995e534}
	0xe7374c25 \{id = 0x6428420f}
	0xb6f62284
	GetArraySize \{gh4_download_songlist
		globalarray}
	<0x4e3ccf32> = (<array_Size> + 1)
	GetArraySize <0xf3b1921b>
	<added> = 0
	<count> = 0
	if (<array_Size> > 0)
		<i> = 0
		begin
		if ((<0xf3b1921b> [<i>]) = present)
			if (<i> > 1)
				<count> = (<count> + 1)
			endif
			if (<i> > <0x4e3ccf32>)
				<0x3d0b717e> = 1
				<0xf3b1921b> = []
				<array_Size> = 0
				<count> = 0
				break
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	if (<count> > 195)
		<0x3d0b717e> = 1
		<0xf3b1921b> = []
		<array_Size> = 0
	endif
	<start_index> = (1 + ($dlc_hide_catalog))
	if (<array_Size> > <start_index>)
		<index> = <start_index>
		begin
		if ((<0xf3b1921b> [<index>]) = present)
			<added> = (<added> + 1)
			0xcff44447 index = <index>
			CreateScreenElement {
				parent = 0x2995e534
				Type = descinterface
				desc = 'Rock_Archive_Row'
				song_text = <song_name>
				autosizedims = true
				event_handlers = [
					{focus 0x0053f6fc}
					{unfocus 0x019b9af3}
					{pad_choose 0x3059acab params = {local index = <index>}}
				]
			}
		endif
		<index> = (<index> + 1)
		repeat (<array_Size> - <start_index>)
	endif
	Change 0x20f6de92 = <added>
	0x600871a4
	if (<added> = 0)
		Change \{0x70bd8ea4 = 'Right'}
		if GotParam \{0x3d0b717e}
			CreateScreenElement {
				parent = 0x2995e534
				Type = TextBlockElement
				text = (qs(0x8a4c71b8))
				font = fontgrid_text_a3
				dims = (310.0, 250.0)
				internal_just = [center , center]
				focusable = FALSE
				use_shadow = true
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				rgba = [127 127 127 255]
				internal_scale = (0.5, 0.5)
			}
		else
			CreateScreenElement {
				parent = 0x2995e534
				Type = TextBlockElement
				text = (qs(0xf1f5abaa))
				font = fontgrid_text_a3
				dims = (310.0, 250.0)
				internal_just = [center , center]
				focusable = FALSE
				use_shadow = true
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				rgba = [127 127 127 255]
				internal_scale = (0.5, 0.5)
			}
		endif
	endif
	0xb8cfb312
	if (<0x88333d3f> = 1)
		formatText TextName = wii_blocks qs(0x262ba243) d = <0x88333d3f> b = (qs(0x5746a2ee))
	else
		formatText TextName = wii_blocks qs(0x262ba243) d = <0x88333d3f> b = (qs(0x85ca8f41))
	endif
	0x9dc36fd8 :se_setprops 0x5756958d = <wii_blocks>
	GetStartTime
	0x92949109 <...>
	getelapsedtime starttime = <starttime>
	printf qs(0x11b7d6a0) d = <ElapsedTime>
	if GotParam \{error}
		<index> = 1
		0x5e87d779 <...>
		Change \{0x70bd8ea4 = 'Left'}
		CreateScreenElement {
			parent = 0x6428420f
			Type = TextBlockElement
			text = <errortext>
			font = fontgrid_text_a3
			dims = (180.0, 225.0)
			internal_just = [center , center]
			use_shadow = true
			focusable = FALSE
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			rgba = [127 127 127 255]
			internal_scale = (0.5, 0.5)
		}
		0x9dc36fd8 :se_setprops \{0xc9cb2726 = qs(0x00000000)}
		Change \{0x1b16e2ae = 0}
	else
		GetArraySize <index_array>
		Change 0x1b16e2ae = <array_Size>
		if (<array_Size> = 0)
			Change \{0x70bd8ea4 = 'Left'}
			CreateScreenElement {
				parent = 0x6428420f
				Type = TextBlockElement
				text = (qs(0xf1f5abaa))
				font = fontgrid_text_a3
				dims = (180.0, 225.0)
				internal_just = [center , center]
				use_shadow = true
				focusable = FALSE
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				rgba = [127 127 127 255]
				internal_scale = (0.5, 0.5)
			}
		elseif (<array_Size> > 198)
			Change \{0x70bd8ea4 = 'Left'}
			CreateScreenElement \{parent = 0x6428420f
				Type = TextBlockElement
				text = qs(0x0e54579b)
				font = fontgrid_text_a3
				dims = (180.0, 225.0)
				internal_just = [
					center
					center
				]
				use_shadow = true
				focusable = FALSE
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [
					0
					0
					0
					255
				]
				rgba = [
					127
					127
					127
					255
				]
				internal_scale = (0.5, 0.5)}
			0x9dc36fd8 :se_setprops \{0xc9cb2726 = qs(0x00000000)}
			Change \{0x1b16e2ae = 0}
		else
			<index> = 0
			begin
			<song_index> = (<index_array> [<index>])
			if NOT ((<song_index> < 2) && (($dlc_hide_catalog) = 1))
				0xcff44447 index = <song_index>
				CreateScreenElement {
					parent = 0x6428420f
					Type = descinterface
					desc = 'Rock_Archive_Row'
					song_text = <song_name>
					autosizedims = true
					event_handlers = [
						{focus 0x0053f6fc}
						{unfocus 0x019b9af3}
						{pad_choose 0x3059acab params = {sd index = <song_index>}}
					]
				}
			endif
			<index> = (<index> + 1)
			repeat <array_Size>
		endif
		0x5436e5d9
		if GotParam \{error}
			0xd43ac924
			return
		endif
		0x63f397f9
		if (<0xefba12f3> = 1)
			formatText TextName = sd_blocks qs(0x262ba243) d = <0xefba12f3> b = (qs(0x5746a2ee))
		else
			formatText TextName = sd_blocks qs(0x262ba243) d = <0xefba12f3> b = (qs(0x85ca8f41))
		endif
		0x9dc36fd8 :se_setprops 0xc9cb2726 = <sd_blocks>
	endif
	formatText checksumName = menu 'RA_%m_Menu' m = ($0x70bd8ea4) AddToStringLookup
	if ($0x70bd8ea4 = 'Left')
		0xebbe93be = 0x6428420f
	else
		0xebbe93be = 0x2995e534
	endif
	ExtendCrc <menu> '_Highlight' out = highlight_id
	<highlight_id> :se_setprops alpha = 1
	AssignAlias id = <menu> alias = current_menu
	if NOT ScreenElementExists \{id = generic_popupelement}
		current_menu :GetTags
		<selection_index> = 0
		if GotParam \{tag_selected_index}
			<selection_index> = (<tag_selected_index> + <0x668c8182>)
		endif
		if GetScreenElementChildren id = <menu>
			GetArraySize <children>
			if (<selection_index> >= <array_Size>)
				<selection_index> = (<array_Size> - 1)
			endif
			if ((<selection_index> + 7) > <array_Size>)
				if (<array_Size> > 0)
					<0x8246297c> = 0
					if ((<array_Size> - 7) > 0)
						<0x8246297c> = (<array_Size> - 7)
					endif
					printf qs(0x7d1a0577) d = <0x8246297c>
					LaunchEvent Type = focus target = <menu> data = {child_index = <0x8246297c>}
					LaunchEvent Type = unfocus target = <menu>
				endif
			endif
		endif
		if (<selection_index> < 0)
			<selection_index> = 0
		endif
		LaunchEvent Type = focus target = <0xebbe93be>
		LaunchEvent Type = unfocus target = <0xebbe93be>
		LaunchEvent Type = focus target = <menu> data = {child_index = <selection_index>}
	endif
	if NOT GotParam \{error}
		if NOT ScreenElementExists \{id = generic_popupelement}
			cntsdcountsdsongs
			RemoveParameter \{error}
			if (<sd_song_count> > $dlc_max_songs_on_sd)
				formatText \{TextName = warning_text
					qs(0x1295e8d1)
					d = $dlc_max_songs_on_sd}
				create_new_generic_popup {
					popup_type = error_menu
					text = <warning_text>
					title = qs(0xaa163738)
					error_func = 0xbd87f932
					add_user_control_helpers
				}
			endif
		endif
	endif
	if GotParam \{0xd8e53555}
		RemoveParameter \{error}
		0xbf8722f3
		if NOT GotParam \{error}
			if (<0x9206d5a1> = true)
				0x74552375 \{sd
					index = 1
					move = 0}
			else
				create_new_generic_popup \{popup_type = yes_no_menu
					title = qs(0xaa163738)
					title_effect
					text = qs(0xeeb57c5d)
					yes_func = 0x74552375
					yes_func_params = {
						sd
						index = 1
						move = 0
					}
					no_func = 0xbd87f932
					add_user_control_helpers
					Priority = 10}
			endif
		endif
	elseif GotParam \{0x070803b3}
		0x74552375 \{local
			index = 1
			move = 0}
	endif
endscript

script 0x3a44225a 
	if NOT cntsdiscardpresent
		return
	endif
	formatText checksumName = new_count 'RA_%m_Song_Count' m = <to>
	if (($<new_count>) = 0)
		return
	endif
	formatText checksumName = 0xc61905e9 'RA_%m_Menu' m = <from>
	formatText checksumName = new_id 'RA_%m_Menu' m = <to>
	ExtendCrc <0xc61905e9> '_Highlight' out = 0x916c4add
	ExtendCrc <new_id> '_Highlight' out = 0x53a5d594
	<0x916c4add> :se_setprops alpha = 0 time = 0.075
	<0x53a5d594> :se_setprops alpha = 1 time = 0.075
	LaunchEvent Type = unfocus target = <0xc61905e9>
	LaunchEvent Type = focus target = <new_id>
	AssignAlias id = <new_id> alias = current_menu
	Change 0x70bd8ea4 = <to>
endscript

script 0xcff44447 
	if (<index> = 0)
		<song_title> = qs(0xe33eb047)
	elseif (<index> = 1)
		<song_title> = qs(0x9c331616)
	else
		GetArraySize \{gh4_download_songlist
			globalarray}
		if ((<index> - 1) > <array_Size>)
			formatText TextName = song_title qs(0x34f7b79d) d = <index>
		else
			formatText checksumName = song 'dlc%d' d = <index>
			get_song_title song = <song>
		endif
	endif
	return song_name = <song_title>
endscript

script 0x5e87d779 
	if GotParam \{error_sd_corrupt_from_usable}
		if GotParam \{local}
			error = qs(0x5d6b168f)
		else
			error = qs(0x3db066b9)
		endif
	endif
	if GotParam \{error_include_blocks}
		formatText TextName = error <error> d = <blocks>
	elseif GotParam \{error_include_name}
		if NOT GotParam \{index}
			<index> = 1
		endif
		0xcff44447 index = <index>
		formatText TextName = error <error> s = <song_name>
	endif
	return errortext = <error>
endscript

script 0xf0968ba3 
	if NOT GotParam \{0x2831844c}
		0x5e87d779 <...>
		0x213f6d04 text = <errortext> Priority = 7
	endif
endscript

script 0xdad2c850 
	if GotParam \{error}
		return
	endif
	get_home_button_allowed
	Change 0xee50c91d = (1 - <disabled>)
	set_home_button_notallowed
	0x68f07e06 = {
		popup_type = dlc_wait
		title = (qs(0xed4b35a9))
		text = <text>
		Priority = 8
		title_effect
		title_effect_index = 1
		add_user_control_helpers
	}
	if GotParam \{progress_bar}
		<0x68f07e06> = ((<0x68f07e06>) + ({progress_bar}))
	endif
	if NOT GotParam \{0xc596cac2}
		cancel_params = {
			can_cancel
			back_script = 0xe9ab5da8
			cancel_func = 0xe9ab5da8
		}
		<0x68f07e06> = ((<0x68f07e06>) + (<cancel_params>))
	endif
	create_new_generic_popup <0x68f07e06>
	if GotParam \{long_text}
		generic_popupelement :desc_resolvealias \{Name = alias_loading_text_menu}
		<resolved_id> :se_setprops alpha = 0
		generic_popupelement :desc_resolvealias \{Name = alias_long_wait_label}
		<resolved_id> :se_setprops alpha = 1 text = <long_text>
	endif
	printf \{'BEGINING WAIT:'}
	printstruct <...>
	begin
	0x83b34cb2
	if ((GotParam 0xd7273336) || (GotParam error))
		break
	endif
	if GotParam \{progress_bar}
		0x0aca33c5 text = <text> progress = <0x3c4f20d3>
	else
		0x0aca33c5 text = <text>
	endif
	if (($0xf6d41735) = 1)
		RemoveParameter \{progress_bar}
		0x10ca7ed8
		0xdad2c850 text = (qs(0x2978bcf5)) 0xc596cac2
		break
	endif
	WaitOneGameFrame
	repeat
	printf \{'DONE TRANSFER:'}
	printstruct <...>
	0x10ca7ed8
	if GotParam \{error}
		return <...>
	endif
endscript

script 0xe9ab5da8 
	if (0xb9981920)
		Change \{0xf6d41735 = 1}
	endif
endscript

script 0x10ca7ed8 
	Change \{0xf6d41735 = 0}
	Change \{0xaf06ebae = 0}
	dlc_destroy_popup
	if (($0xee50c91d) = 1)
		set_home_button_allowed
	endif
endscript

script 0x0aca33c5 
	0xf255cb2c = qs(0x03ac90f0)
	Change 0xaf06ebae = (($0xaf06ebae) + 1)
	if (($0xaf06ebae) > 79)
		Change \{0xaf06ebae = 0}
	else
		count = (($0xaf06ebae) / 20)
		if (<count> > 0)
			begin
			formatText TextName = 0xf255cb2c qs(0xf606f43e) t = <0xf255cb2c>
			repeat <count>
		endif
	endif
	if ScreenElementExists \{id = generic_popupelement}
		generic_popupelement :se_setprops wait_dots_text = <0xf255cb2c>
	endif
	if GotParam \{progress}
		if ScreenElementExists \{id = generic_popupelement}
			generic_popupelement :se_setprops bar_sprite_dims = ((<progress> * (4.2, 0.0)) + (0.0, 25.0))
		endif
	endif
endscript

script 0x600871a4 
	clean_up_user_control_helpers
	add_user_control_helper text = (qs(0xc18d5e76)) button = green z = 100
	add_user_control_helper text = (qs(0xaf4d5dd2)) button = red z = 100
	add_user_control_helper text = (qs(0x84cb8da4)) button = yellow z = 100
	if ($0x20f6de92 > 0)
		add_user_control_helper text = (qs(0x974a0779)) button = blue z = 100
	endif
endscript

script 0x5bde21df 
	0x600871a4
	dlc_destroy_popup
endscript

script 0x213f6d04 \{Priority = 11}
	create_new_generic_popup {
		popup_type = error_menu
		error_func = 0x5bde21df
		text = <text>
		Priority = <Priority>
		add_user_control_helpers
	}
endscript

script 0x565ba999 
	0xbd87f932
	Change \{0x966e4c9b = 0}
endscript

script 0xe423fbdd 
	if GotParam \{sd}
		0x73962142 index = <index>
	else
		0x8b5c48ef index = <index>
		updatecontentindex index = <index>
	endif
	if GotParam \{error}
		0xf0968ba3 <...>
		0xd43ac924
	else
		0xd43ac924 \{0x668c8182 = -1}
	endif
endscript

script 0xd772dbd6 
	if NOT cntsdiscardpresent
		0xf0968ba3 \{error = qs(0x37f4dc24)}
		return
	endif
	cntsdiscardusable
	if GotParam \{error}
		0xf0968ba3 <...>
		return
	endif
	0x2308e284
	if (<catalog_status> = wrong_wii)
		0xf0968ba3 error = (qs(0x9693d484))
		return
	endif
	0xcff44447 index = <index>
	if GotParam \{sd}
		if (<index> > 1)
			if NOT sd_cachesizecheck
				0xf0968ba3 <...>
				return
			endif
		endif
		cntsdgetsizetorestore index = <index>
		if GotParam \{error}
			0xf0968ba3 <...>
			return
		endif
		disablereset
		0x3a72a77d index = <index>
		formatText TextName = long_text qs(0xd1cf36a8) s = <song_name>
		if NOT GotParam \{error}
			if (<index> = 1)
				0xdad2c850 text = qs(0x00000000) long_text = <long_text> progress_bar index = <index> 0xc596cac2
			else
				0xdad2c850 text = qs(0x00000000) long_text = <long_text> progress_bar index = <index>
			endif
		endif
		updatecontentindex index = <index>
	else
		0xd8d65a73 index = <index>
		0x5436e5d9
		if GotParam \{error}
			0xf0968ba3 <...>
			return
		endif
		if (<index> > 1)
			cntsdcountsdsongs exclude_index = <index>
			if GotParam \{error}
				0xf0968ba3 <...>
				return
			endif
			if ((<sd_song_count> + 1) > $dlc_max_songs_on_sd)
				formatText \{TextName = tmperror
					qs(0x1cd32936)
					d = $dlc_max_songs_on_sd}
				formatText TextName = error qs(0x96c41fb5) s = <tmperror>
				0xf0968ba3 <...>
				return
			endif
		endif
		if (<0xaec2e8d3> < <0xffbe4c25>)
			if (<index> > 1)
				0xf0968ba3 <...> error_include_blocks error = (qs(0x9963d7db))
			endif
			return
		endif
		disablereset
		printf \{'BEGINING TRANSFER:'}
		0x66cb7d70 index = <index>
		printstruct <...>
		if (<move> = 1)
			<message> = qs(0xb95e9770)
		else
			<message> = qs(0xac955685)
		endif
		formatText TextName = long_text <message> s = <song_name>
		if NOT GotParam \{error}
			if (<index> = 1)
				0xdad2c850 text = qs(0x00000000) long_text = <long_text> progress_bar index = <index> 0xc596cac2
			else
				0xdad2c850 text = qs(0x00000000) long_text = <long_text> progress_bar index = <index>
			endif
		endif
	endif
	if GotParam \{error}
		0xf0968ba3 <...>
		if (<index> = 1)
			0xd43ac924 error = ($0x56242166)
		else
			0xd43ac924
		endif
	elseif (<move> = 1)
		0xe423fbdd <...>
	else
		if (<index> = 1)
			Downloads_EnumContent \{0xb5e0fc5b = 1}
		endif
		0xd43ac924
	endif
	enablereset
endscript

script 0x4704037e 
	dlc_destroy_popup \{refocus = 0}
	Change \{0x966e4c9b = 0}
	SpawnScriptNow 0xe423fbdd params = <params>
endscript

script 0x74552375 
	SpawnScriptNow 0xd772dbd6 params = <...>
endscript

script 0xbd87f932 
	dlc_destroy_popup <...>
	0x600871a4
endscript

script 0x3639659a 
	dlc_destroy_popup
	if GotParam \{local}
		formatText TextName = text qs(0xd1a3bcd8) s = <song_name>
	else
		formatText TextName = text qs(0x9d7be495) s = <song_name>
	endif
	create_new_generic_popup {
		popup_type = message_options
		back_script = 0xbd87f932
		title = qs(0x51e5cd31)
		text = <text>
		force_big_vmenu
		options = [
			{
				func = 0x4704037e
				func_params = {params = <...>}
				text = (qs(0xa32bf91f))
			}
			{
				func = 0xbd87f932
				func_params = {}
				text = (qs(0x7343df39))
			}
		]
		title_effect
		add_user_control_helpers
	}
endscript

script 0x3059acab 
	0xcff44447 index = <index>
	if GotParam \{local}
		formatText TextName = text qs(0x5affae73) s = <song_name>
	else
		formatText TextName = text qs(0xf1e9287a) s = <song_name>
	endif
	create_new_generic_popup {
		popup_type = message_options
		back_script = 0xbd87f932
		title = <song_name>
		text = <text>
		options = [
			{
				func = 0x74552375
				func_params = ((<...>) + ({move = 1}))
				text = (qs(0x87392a87))
			}
			{
				func = 0x3639659a
				func_params = <...>
				text = (qs(0xa32bf91f))
			}
			{
				func = 0xbd87f932
				func_params = {}
				text = (qs(0x7343df39))
			}
		]
		title_effect
		add_user_control_helpers
	}
endscript

script 0x0053f6fc 
	Obj_GetID
	0x72a2ec2a :se_setprops parent = <objID> alpha = 1 Pos = (-9.0, 4.0) just = [left , center] pos_anchor = [left , center]
endscript

script 0x019b9af3 
endscript

script 0xce474c5c 
	if ($0x20f6de92 = 0)
		return
	endif
	if NOT cntsdiscardpresent
		0xf0968ba3 \{error = qs(0x37f4dc24)}
		return
	endif
	cntsdiscardusable
	if GotParam \{error}
		0xf0968ba3 <...> local
		return
	endif
	0x2308e284
	if (<catalog_status> = wrong_wii)
		0xf0968ba3 error = (qs(0x9693d484))
		return
	endif
	0x5436e5d9
	if GotParam \{error}
		0xf0968ba3 <...>
		return
	endif
	create_new_generic_popup \{title = qs(0xa4d1f3c3)
		text = qs(0x682408fb)
		title_effect}
	WaitOneGameFrame
	0xb6f62284
	GetArraySize <0xf3b1921b>
	<array> = []
	if (<array_Size> > 2)
		<i> = 2
		begin
		if ((<0xf3b1921b> [<i>]) = present)
			AddArrayElement array = <array> element = <i>
		endif
		<i> = (<i> + 1)
		repeat (<array_Size> - 2)
	endif
	cntsdcountsdsongs exclude_array = <array>
	if GotParam \{error}
		0xf0968ba3 <...>
		return
	endif
	GetArraySize <array>
	if ((<sd_song_count> + <array_Size>) > $dlc_max_songs_on_sd)
		formatText \{TextName = tmperror
			qs(0x1cd32936)
			d = $dlc_max_songs_on_sd}
		formatText TextName = error qs(0x96c41fb5) s = <tmperror>
		0xf0968ba3 <...>
		return
	endif
	0x299accb3 index_array = <array>
	destroy_generic_popup
	if GotParam \{error}
		0xf0968ba3 <...>
		return
	endif
	if (<0xaec2e8d3> < <0xffbe4c25>)
		0xf0968ba3 blocks = <blocks> error_include_blocks = 1 error = qs(0x1c1a1706)
		return
	endif
	formatText TextName = transfer_text qs(0x95573021) d = <blocks>
	create_new_generic_popup {
		popup_type = yes_no_menu
		title = qs(0x12bbdbbd)
		text = <transfer_text>
		yes_func = 0x02c79c88
		yes_func_params = {index_array = <array>}
		no_func = destroy_generic_popup
		title_effect
	}
endscript

script 0x02c79c88 
	SpawnScriptNow 0xc699c307 params = <...>
endscript

script 0xc699c307 
	GetArraySize <index_array>
	<i> = 0
	disablereset
	begin
	<index> = ((<index_array>) [<i>])
	0xcff44447 index = <index>
	0xd8d65a73 index = <index>
	0x5436e5d9
	if GotParam \{error}
		break
	endif
	if (<0xaec2e8d3> < <0xffbe4c25>)
		<error_include_blocks> = 1
		<error> = (qs(0x9963d7db))
		break
	endif
	0x66cb7d70 index = <index>
	formatText TextName = long_text qs(0xb95e9770) s = <song_name>
	if NOT GotParam \{error}
		0xdad2c850 text = qs(0x00000000) long_text = <long_text> progress_bar index = <index>
	endif
	if GotParam \{error}
		break
	endif
	0x8b5c48ef index = <index>
	updatecontentindex index = <index>
	if GotParam \{error}
		break
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
	enablereset
	if GotParam \{error}
		0xf0968ba3 <...>
	endif
	0xd43ac924
endscript
0x55f54cb5 = 0

script 0x87822280 
	if ScreenElementExists \{id = 0x9dc36fd8}
		printf \{'SD_Card_Inserted'}
		if ScreenElementExists \{id = generic_popupelement}
			0x213f6d04 \{text = qs(0x36cbe54b)
				Priority = 9}
		endif
		0xd43ac924
	endif
endscript

script 0x162518df 
	if ScreenElementExists \{id = 0x9dc36fd8}
		printf \{'SD_Card_Removed'}
		if ScreenElementExists \{id = generic_popupelement}
			0x213f6d04 \{text = qs(0x87c9b5d7)
				Priority = 9}
		endif
		0xd43ac924
	endif
endscript

script 0x92949109 
	if NOT GotParam \{error}
		cntsdiscardusable
		if NOT GotParam \{error}
			cntsdgetcontentindices
			if NOT GotParam \{error}
				GetArraySize <index_array>
				<0x74b07736> = <array_Size>
				if (<0x74b07736> = 0)
					return <...>
				endif
				0x2308e284
				<0xc8eb00f2> = 1
				if (<catalog_status> = wrong_wii)
					<0xc8eb00f2> = 0
					<index_array> = []
					<array_Size> = 0
					<0x74b07736> = 0
				endif
				<0x74b07736> = <array_Size>
				<0x6978ef0e> = 0
				<0x7d04bfa0> = 0
				<0x989c2075> = 0
				if (<0x74b07736> > 0)
					<index> = 0
					GetArraySize \{gh4_download_songlist
						globalarray}
					<0x4e3ccf32> = (<array_Size> + 1)
					begin
					<song_index> = (<index_array> [<index>])
					if (<song_index> > <0x4e3ccf32>)
						<0xc8eb00f2> = 0
						break
					endif
					if (<song_index> = 0)
						<0x7d04bfa0> = 1
					elseif (<song_index> = 1)
						<0x6978ef0e> = 1
					else
						<0x989c2075> = 1
					endif
					<index> = (<index> + 1)
					repeat <0x74b07736>
				endif
				if (<catalog_status> = 0xc436b28b)
					cntsdgetsizetorestore \{index = 1}
					if NOT GotParam \{error}
						<error> = (qs(0x0e54579b))
						<error_include_name> = 1
						<0xd8e53555> = 1
						<0xc8eb00f2> = 1
					else
						<blocks> = ($0x3e5f56c6)
						0xf0968ba3 <...>
						RemoveParameter \{error}
						RemoveParameter \{error_include_name}
						RemoveParameter \{0x97792515}
					endif
				endif
				if (<0xc8eb00f2> = 0)
					if (<catalog_status> = 0xe14e3c77)
						0xf0968ba3 error = (qs(0x7612f5e9))
					elseif (<catalog_status> = wrong_wii)
						0xf0968ba3 error = (qs(0x9693d484))
					elseif (<catalog_status> = 0x7763962e)
						0xf0968ba3 error = (qs(0x7612f5e9))
					endif
					<index_array> = []
					<0x74b07736> = 0
					<error> = (qs(0x0e54579b))
				endif
				if NOT GotParam \{error}
					if (<0x74b07736> > 0)
						if (<0x989c2075> = 0)
							if (<0x7d04bfa0> = 1)
								0x73962142 \{index = 0}
							endif
							if (<0x6978ef0e> = 1)
								0x73962142 \{index = 1}
							endif
							<index_array> = []
							<0x74b07736> = 0
						else
							cntgetflags \{index = 1}
							if (<flag_owned> = true && <flag_present> = true && <flag_corrupt> = FALSE)
								0xd8d65a73 \{index = 1}
								0x5436e5d9
								if NOT GotParam \{error}
									if (<0xaec2e8d3> >= <0xffbe4c25>)
										if ((<catalog_status> = 0xb8eebfe2) || (<catalog_status> = 0xe14e3c77))
											<error> = (qs(0xac955685))
											<error_include_name> = 1
											<0x070803b3> = 1
										endif
									endif
								else
									RemoveParameter \{error}
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
	return <...>
endscript

script sd_cachesizecheck 
	0xb8cfb312
	if (<0x88333d3f> < ($0x3e5f56c6 - 2))
		return FALSE blocks = ($0x3e5f56c6) error = qs(0xe6ed8d32) error_include_blocks = 1
	endif
	if (<0x03f8a597> < ($0xb8463545 - 2))
		return \{FALSE
			error = qs(0x9a4fb93a)}
	endif
	return \{true}
endscript
