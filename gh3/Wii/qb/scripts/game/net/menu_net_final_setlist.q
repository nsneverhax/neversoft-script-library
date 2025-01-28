
script create_final_set_list_menu {
		menu_id = online_final_setlist_menu
		vmenu_id = online_final_setlist_vmenu
		pad_back_script = check_back_action_final_setlist
		pad_choose_script = check_for_both_players_ready
		pos = ($menu_pos)
	}
	online_final_setlist_event_handlers = [
		{pad_back <pad_back_script>}
		{pad_choose <pad_choose_script>}
	]
	new_menu scrollid = <menu_id> vmenuid = <vmenu_id> use_backdrop = (1) menu_pos = <pos> event_handlers = <online_final_setlist_event_handlers>
	array_entry = 0
	begin
	if (($finalsonglist [<array_entry>]) = -1)
		<newtext> = '--------'
	else
		get_songlist_checksum index = ($finalsonglist [<array_entry>])
		get_song_title song = <song_checksum>
		<newtext> = <song_title>
	endif
	formattext checksumname = item_id 'final_setlist_item_%s' s = <array_entry>
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		id = <item_id>
		font = text_a1
		scale = 0.75
		rgba = [210 210 210 250]
		text = <newtext>
		just = [left top]
	}
	<array_entry> = (<array_entry> + 1)
	repeat (($numberofsongsinfo [($numberofsongs [($menucontrol)].value)]).value)
	if ishost
		createscreenelement {
			type = textelement
			parent = <vmenu_id>
			font = text_a1
			scale = 0.75
			rgba = [210 210 210 250]
			text = 'Press A when the final song is selected'
			just = [left top]
		}
	endif
	launchevent type = focus target = <vmenu_id>
	check_final_setlist_ready
endscript

script destroy_final_set_list_menu 
	destroy_menu \{menu_id = online_final_setlist_menu}
	destroy_gamertag_container
	destroy_menu_backdrop
endscript

script check_back_action_final_setlist 
	if (($numberofsongsinfo [($numberofsongs [($menucontrol)].value)].value) = 1)
		check_for_final_song_selection
		if (<can_select_final_song> = false)
			sendnetmessage \{type = song_selection
				song_index = -1
				selection_value = 0
				final_selection = -1
				tie_breaker_selection = -1
				menu_jump = -1}
			clear_setlists
		endif
	endif
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script network_player_change_final_setlist \{type = select
		tie_breaker_song = false}
	if (<type> = select)
		if (<tie_breaker_song> = true)
			formattext checksumname = id 'final_setlist_item_%s' s = (($numberofsongsinfo [($numberofsongs [($menucontrol)].value)].value) -1)
			get_song_title song = ($gh3_songlist [($finalsonglist [(($numberofsongsinfo [($numberofsongs [($menucontrol)].value)].value) -1)])])
		endif
		if ishost
			formattext checksumname = id 'final_setlist_item_%s' s = ((($remoteplayersongselections) * 2) + 1)
			get_song_title song = ($gh3_songlist [($finalsonglist [((($remoteplayersongselections) * 2) + 1)])])
		else
			formattext checksumname = id 'final_setlist_item_%s' s = (($remoteplayersongselections) * 2)
			get_song_title song = ($gh3_songlist [($finalsonglist [(($remoteplayersongselections) * 2)])])
		endif
		new_text = <song_title>
	else
		new_text = '--------'
		if (<tie_breaker_song> = true)
			formattext checksumname = id 'final_setlist_item_%s' s = (($numberofsongsinfo [($numberofsongs [($menucontrol)].value)].value) -1)
		endif
		if ishost
			formattext checksumname = id 'final_setlist_item_%s' s = ((($remoteplayersongselections) * 2) + 1)
		else
			formattext checksumname = id 'final_setlist_item_%s' s = (($remoteplayersongselections) * 2)
		endif
	endif
	<id> :setprops text = <new_text>
endscript
