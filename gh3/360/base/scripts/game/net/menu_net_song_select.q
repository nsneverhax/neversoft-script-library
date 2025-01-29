
script create_online_song_select_menu version = gh3 {
		menu_id = online_song_select_menu
		vmenu_id = online_song_select_vmenu
		pad_back_script = check_back_action_song_select
		pos = (($menu_pos) - (200.0, 0.0))
	}
	online_song_select_event_handlers = [
		{pad_back <pad_back_script>}
	]
	new_menu scrollid = <menu_id> vmenuid = <vmenu_id> use_backdrop = (1) menu_pos = <pos> event_handlers = <online_song_select_event_handlers>
	array_entry = 0
	get_songlist_size
	begin
	get_songlist_checksum index = <array_entry>
	get_song_struct song = <song_checksum>
	if ((<song_struct>.version) = <version>)
		formattext checksumname = temp_id 'song_number_%n' n = <array_entry>
		get_song_title song = <song_checksum>
		title = <song_title>
		createscreenelement {
			type = textelement
			parent = <vmenu_id>
			id = <temp_id>
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = <title>
			just = [left top]
			event_handlers = [
				{focus menu_focus}
				{unfocus menu_unfocus}
				{pad_choose local_player_song_selection params = {selection_value = <array_entry>}}
			]
		}
		check_for_flagged_songs {
			id = <temp_id>
			entry = <array_entry>
		}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	launchevent type = focus target = <vmenu_id>
	get_number_of_song_selections
	if (<song_selections> = 0)
		change \{choosetiebreaker = 1}
	endif
endscript

script destroy_online_song_select_menu 
	destroy_menu \{menu_id = online_song_select_menu}
	destroy_menu_backdrop
endscript

script check_forward_action_song_select 
	if (($localplayersetlistfinalized) = 1)
		ui_flow_manager_respond_to_action \{action = selected_all_songs}
	else
		local_player_song_selection <...>
	endif
endscript

script check_back_action_song_select 
	if (($localplayersongselections) = 0)
		check_for_final_song_selection
		check_tie_breaker_is_selected
		if ((<can_select_final_song> = true) && (<tie_breaker_selected> = true))
			local_player_song_deselection
		else
			sendnetmessage \{type = song_selection
				song_index = -1
				selection_value = 0
				final_selection = -1
				tie_breaker_selection = -1
				menu_jump = -1}
			clear_setlists
			ui_flow_manager_respond_to_action \{action = go_back}
		endif
	else
		local_player_song_deselection
	endif
endscript

script network_player_back_to_guitar_select 
	clear_setlists
	ui_flow_manager_respond_to_action \{action = go_back_to_guitar_select}
endscript

script local_player_song_selection 
	if (($choosetiebreaker) = 1)
		check_tie_breaker_is_selected
		if (<tie_breaker_selected> = false)
			setarrayelement arrayname = finalsonglist globalarray index = (($numberofsongsinfo [($numberofsongs [($menucontrol)].value)].value) - 1) newvalue = <selection_value>
			tie_breaker = 1
			final = 1
			change \{localplayersetlistfinalized = 1}
		endif
		check_final_setlist_ready
		ui_flow_manager_respond_to_action \{action = selected_all_songs}
	else
		if ishost
			setarrayelement arrayname = finalsonglist globalarray index = ($localplayersongselections * 2) newvalue = <selection_value>
		else
			setarrayelement arrayname = finalsonglist globalarray index = (($localplayersongselections * 2) + 1) newvalue = <selection_value>
		endif
		setarrayelement arrayname = localplayersonglist globalarray index = ($localplayersongselections) newvalue = <selection_value>
		tie_breaker = 0
		change localplayersongselections = ($localplayersongselections + 1)
		get_number_of_song_selections
		if (<song_selections> = ($localplayersongselections))
			check_for_final_song_selection
			if (<can_select_final_song> = true)
				change \{choosetiebreaker = 1}
				final = 0
			else
				change \{localplayersetlistfinalized = 1}
				final = 1
				check_final_setlist_ready
				ui_flow_manager_respond_to_action \{action = selected_all_songs}
			endif
		else
			final = 0
		endif
	endif
	sendnetmessage {
		type = song_selection
		song_index = <selection_value>
		selection_value = 1
		final_selection = <final>
		tie_breaker_selection = <tie_breaker>
		menu_jump = 0
	}
	local_player_flag_selected_song <...>
endscript

script local_player_song_deselection 
	if (($localplayersetlistfinalized) = 1)
		change \{localplayersetlistfinalized = 0}
	endif
	check_tie_breaker_is_selected
	if ((($choosetiebreaker) = 1) && (<tie_breaker_selected> = true))
		tie_breaker = 1
		index = ($finalsonglist [(($numberofsongsinfo [($numberofsongs [($menucontrol)].value)].value) -1)])
		setarrayelement arrayname = finalsonglist globalarray index = (($numberofsongsinfo [($numberofsongs [($menucontrol)].value)].value) -1) newvalue = -1
	else
		printf \{"deselecting song"}
		if ((<tie_breaker_selected> = false) && (($choosetiebreaker) = 1))
			change \{choosetiebreaker = 0}
		endif
		tie_breaker = 0
		change localplayersongselections = ($localplayersongselections - 1)
		if ishost
			setarrayelement arrayname = finalsonglist globalarray index = ($localplayersongselections * 2) newvalue = -1
		else
			setarrayelement arrayname = finalsonglist globalarray index = (($localplayersongselections * 2) + 1) newvalue = -1
		endif
		song_index = ($localplayersonglist [($localplayersongselections)])
		setarrayelement arrayname = localplayersonglist globalarray index = ($localplayersongselections) newvalue = -1
		index = <song_index>
	endif
	sendnetmessage {
		type = song_selection
		song_index = -1
		selection_value = -1
		final_selection = 0
		tie_breaker_selection = <tie_breaker>
		menu_jump = 0
	}
	local_player_unflag_selected_song selection_value = <index>
endscript

script network_player_song_selection 
	if (<tie_breaker_selection> = 1)
		setarrayelement arrayname = finalsonglist globalarray index = (($numberofsongsinfo [($numberofsongs [($menucontrol)].value)].value) -1) newvalue = <song_index>
		tie_breaker = true
	else
		if ishost
			setarrayelement arrayname = finalsonglist globalarray index = (($remoteplayersongselections * 2) + 1) newvalue = <song_index>
		else
			setarrayelement arrayname = finalsonglist globalarray index = ($remoteplayersongselections * 2) newvalue = <song_index>
		endif
		setarrayelement arrayname = remoteplayersonglist globalarray index = ($remoteplayersongselections) newvalue = <song_index>
		tie_breaker = false
	endif
	if (<final_selection> = 1)
		change \{remoteplayersetlistfinalized = 1}
		check_final_setlist_ready
	endif
	if (($ui_flow_manager_state [0]) = final_set_list_fs)
		network_player_change_final_setlist type = select tie_breaker_song = <tie_breaker>
	else
		network_player_flag_selected_song <...>
	endif
	if NOT (<tie_breaker> = true)
		change remoteplayersongselections = ($remoteplayersongselections + 1)
	endif
endscript

script network_player_song_deselection 
	if (($remoteplayersetlistfinalized) = 1)
		change \{remoteplayersetlistfinalized = 0}
	endif
	if (<tie_breaker_selection> = 1)
		index = ($finalsonglist [(($numberofsongsinfo [($numberofsongs [($menucontrol)].value)].value) -1)])
		setarrayelement arrayname = finalsonglist globalarray index = (($numberofsongsinfo [($numberofsongs [($menucontrol)].value)].value) -1) newvalue = -1
		tie_breaker = true
	else
		change remoteplayersongselections = ($remoteplayersongselections - 1)
		if ishost
			setarrayelement arrayname = finalsonglist globalarray index = (($remoteplayersongselections * 2) + 1) newvalue = -1
		else
			setarrayelement arrayname = finalsonglist globalarray index = ($remoteplayersongselections * 2) newvalue = -1
		endif
		index = ($remoteplayersonglist [($remoteplayersongselections)])
		setarrayelement arrayname = remoteplayersonglist globalarray index = ($remoteplayersongselections) newvalue = -1
		tie_breaker = false
	endif
	if (($ui_flow_manager_state [0]) = final_set_list_fs)
		network_player_change_final_setlist type = unselect tie_breaker_song = <tie_breaker>
	else
		network_player_unflag_selected_song song_index = <index>
	endif
endscript

script network_player_update_song_select 
	if (<menu_jump> = 1)
		if (($ui_flow_manager_state [0]) = online_song_select_fs)
			ui_flow_manager_respond_to_action \{action = selected_all_songs}
		endif
	endif
	if (<menu_jump> = -1)
		network_player_back_to_guitar_select
	endif
endscript

script check_for_matching_song 
	if (<local> = true)
		getarraysize \{$remoteplayersonglist}
		array_count = 0
		begin
		if (($remoteplayersonglist [<array_count>]) = <index>)
			return \{found_match = true}
		endif
		<array_count> = (<array_count> + 1)
		repeat <array_size>
	else
		getarraysize \{$localplayersonglist}
		array_count = 0
		begin
		if (($localplayersonglist [<array_count>]) = <index>)
			return \{found_match = true}
		endif
		<array_count> = (<array_count> + 1)
		repeat <array_size>
	endif
endscript

script check_songlist_for_song 
	<array_count> = 0
	getarraysize $<global_array>
	begin
	if (($<global_array> [<array_count>]) = <song_index>)
		found = true
	endif
	<array_count> = (<array_count> + 1)
	repeat <array_size>
	return found_song = <found>
endscript

script check_for_flagged_songs 
	found_local = false
	found_remote = false
	found_final = false
	check_songlist_for_song song_index = <entry> global_array = finalsonglist
	<found_final> = <found_song>
	if (<found_final> = true)
		formattext checksumname = song_number 'song_number_%n' n = <entry>
		get_songlist_checksum index = <entry>
		get_song_title song = <song_checksum>
		title = <song_title>
		check_songlist_for_song song_index = <entry> global_array = localplayersonglist
		<found_local> = <found_song>
		check_songlist_for_song song_index = <entry> global_array = remoteplayersonglist
		<found_remote> = <found_song>
		printstruct <...>
		if ((<found_local> = false) && (<found_remote> = false))
			formattext textname = new_song_text "*** %s ***" s = <title>
		elseif ((<found_local> = true) && (<found_remote> = false))
			formattext textname = new_song_text "*** %s" s = <title>
		elseif ((<found_local> = false) && (<found_remote> = true))
			formattext textname = new_song_text "%s ***" s = <title>
		elseif ((<found_local> = true) && (<found_remote> = true))
			formattext textname = new_song_text "*** %s ***" s = <title>
		endif
		<id> :setprops text = <new_song_text>
	endif
endscript

script local_player_flag_selected_song 
	if screenelementexists \{id = online_song_select_vmenu}
		check_for_matching_song index = <selection_value> local = true
		found = <found_match>
		formattext checksumname = song_number 'song_number_%n' n = <selection_value>
		get_songlist_checksum index = <selection_value>
		get_song_title song = <song_checksum>
		title = <song_title>
		if (found = true)
			formattext textname = new_song_text "*** %s ***" s = <title>
		else
			formattext textname = new_song_text "*** %s" s = <title>
		endif
		<song_number> :setprops text = <new_song_text>
	endif
endscript

script local_player_unflag_selected_song 
	if screenelementexists \{id = online_song_select_vmenu}
		check_for_matching_song index = <selection_value> local = true
		found = <found_match>
		formattext checksumname = song_number 'song_number_%n' n = <selection_value>
		get_songlist_checksum index = <selection_value>
		get_song_title song = <song_checksum>
		title = <song_title>
		if (found = true)
			formattext textname = new_song_text "%s ***" s = <title>
		else
			formattext textname = new_song_text "%s" s = <title>
		endif
		<song_number> :setprops text = <new_song_text>
	endif
endscript

script network_player_flag_selected_song 
	check_for_matching_song index = <song_index> local = false
	found = <found_match>
	formattext checksumname = song_number 'song_number_%n' n = <song_index>
	get_songlist_checksum index = <song_index>
	get_song_title song = <song_checksum>
	title = <song_title>
	if (found = true)
		formattext textname = new_song_text "*** %s ***" s = <title>
	else
		formattext textname = new_song_text "%s ***" s = <title>
	endif
	<song_number> :setprops text = <new_song_text>
endscript

script network_player_unflag_selected_song 
	check_for_matching_song index = <song_index> local = false
	found = <found_match>
	formattext checksumname = song_number 'song_number_%n' n = <song_index>
	get_songlist_checksum index = <song_index>
	get_song_title song = <song_checksum>
	title = <song_title>
	if (found = true)
		formattext textname = new_song_text "*** %s" s = <title>
	else
		formattext textname = new_song_text "%s" s = <title>
	endif
	<song_number> :setprops text = <new_song_text>
endscript

script check_tie_breaker_is_selected 
	if (($finalsonglist [(($numberofsongsinfo [($numberofsongs [($menucontrol)].value)].value) -1)]) > -1)
		return \{tie_breaker_selected = true}
	else
		return \{tie_breaker_selected = false}
	endif
endscript
