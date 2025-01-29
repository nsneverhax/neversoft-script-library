g_quest_map_index = 0

script ui_init_quest_map 
	Change \{respond_to_signin_changed_func = None}
	Change \{g_quest_map_index = 0}
endscript

script ui_create_quest_map \{0x62999db0 = 0
		0x5f54e559 = 'null'}
	if (<0x62999db0> = 1)
		SpawnScriptLater 0x2e7aa176 params = {0x5f54e559 = <0x5f54e559> controller = ($primary_controller)}
		return
	endif
	CreateScreenElement {
		parent = root_window
		id = questmapid
		Type = descinterface
		desc = 'career_map'
		event_handlers = [
			{pad_up ui_quest_map_move params = {savegame = ($primary_controller)}}
			{pad_down ui_quest_map_move params = {savegame = ($primary_controller) up = 1}}
			{pad_back generic_event_back}
			{pad_back ui_sfx params = {menustate = career_map uitype = back}}
			{pad_choose ui_quest_map_choose params = {device_num = <device_num>}}
			{pad_choose ui_sfx params = {menustate = career_map uitype = select}}
			{pad_option ui_quest_map_debug_beat params = {song_name = <song_name>}}
		]
		tags = {
			map_index = ($g_quest_map_index)
			linear_progression = []
			num_unlocked = 0
		}
	}
	for_each_quest_progression_unlock \{callback = ui_quest_map_fillout}
	for_each_quest_progression_unlock \{callback = ui_quest_create_linear_progression_array}
	AssignAlias \{id = questmapid
		alias = current_menu}
	quest_map_get_slot_id chapter_num = ($g_quest_map_index + 1)
	ResolveScreenElementID id = {<slot_id> child = hilight}
	<resolved_id> :se_setprops alpha = 1
	questmapid :desc_resolvealias \{Name = alias_container}
	questmapid :GetSingleTag \{num_unlocked}
	if (<num_unlocked> > 4)
		ResolveScreenElementID id = {<resolved_id> child = tier03}
		<resolved_id> :se_setprops alpha = 1
	elseif (<num_unlocked> > 2)
		ResolveScreenElementID id = {<resolved_id> child = tier02}
		<resolved_id> :se_setprops alpha = 1
	else
		ResolveScreenElementID id = {<resolved_id> child = tier01}
		<resolved_id> :se_setprops alpha = 1
	endif
	add_user_control_helper \{text = qs(0xc18d5e76)
		button = green}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = red}
	add_user_control_helper \{text = qs(0x65949184)
		button = blue}
endscript

script ui_destroy_quest_map 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = questmapid}
		DestroyScreenElement \{id = questmapid}
	endif
endscript

script ui_deinit_quest_map 
endscript

script 0x2e7aa176 \{0x5f54e559 = 0x69696969
		controller = !i1768515945}
	ui_event_wait event = menu_replace data = {state = uistate_career_movie movie = <0x5f54e559> device_num = <controller> new_state = uistate_quest_map new_data = {device_num = <controller>}}
endscript

script ui_quest_create_linear_progression_array \{chapter_global = !q1768515945}
	questmapid :GetSingleTag \{linear_progression}
	AddArrayElement array = <linear_progression> element = <chapter_global>
	<linear_progression> = <array>
	questmapid :SetTags linear_progression = <linear_progression>
endscript

script ui_quest_map_fillout \{chapter_global = !q1768515945
		chapter_num = !i1768515945}
	<chapter_name> = ($<chapter_global>.Name)
	formatText checksumName = chapter_unlock 'quest_chapter_%s' s = <chapter_name>
	GetGlobalTags <chapter_unlock> savegame = <savegame>
	quest_map_get_slot_id chapter_num = <chapter_num>
	<hero_global> = ($<chapter_global>.hero_info)
	ResolveScreenElementID id = {<slot_id> child = character_name}
	<resolved_id> :se_setprops text = ($<hero_global>.character_name)
	if (<unlocked> = 1)
		questmapid :GetSingleTag \{num_unlocked}
		questmapid :SetTags num_unlocked = (<num_unlocked> + 1)
		ResolveScreenElementID id = {<slot_id> child = locked}
		<resolved_id> :se_setprops alpha = 0
		if (<completed> = 1)
			ResolveScreenElementID id = {<slot_id> child = complete}
			<resolved_id> :se_setprops alpha = 1
		else
			if (<has_been_played> = 1)
				ResolveScreenElementID id = {<slot_id> child = in_progress}
				<resolved_id> :se_setprops alpha = 1
			else
				ResolveScreenElementID id = {<slot_id> child = available}
				<resolved_id> :se_setprops alpha = 1
			endif
		endif
	endif
endscript

script quest_map_get_slot_id \{chapter_num = !i1768515945}
	if ScreenElementExists \{id = questmapid}
		questmapid :desc_resolvealias \{Name = alias_container}
		formatText checksumName = slot_child_id 'slot%d' d = <chapter_num>
		ResolveScreenElementID id = {<resolved_id> child = <slot_child_id>}
		ResolveScreenElementID id = {<resolved_id> child = master_container}
		return slot_id = <resolved_id>
	endif
endscript

script ui_quest_map_move \{up = 0}
	questmapid :GetSingleTag \{map_index}
	questmapid :GetSingleTag \{linear_progression}
	GetArraySize <linear_progression>
	<old_map_index> = <map_index>
	<check_for_unlock> = 0
	if (<up> = 1)
		if (<map_index> + 1 < <array_Size>)
			<map_index> = (<map_index> + 1)
			<check_for_unlock> = 1
		endif
	else
		if (<map_index> > 0)
			<map_index> = (<map_index> - 1)
			<check_for_unlock> = 1
		endif
	endif
	if (<check_for_unlock> = 1)
		<chapter_global> = (<linear_progression> [<map_index>])
		quest_progression_get_chapter_tag savegame = <savegame> chapter_global = <chapter_global> param = unlocked
		if (<unlocked> = 1)
			questmapid :SetTags map_index = <map_index>
			quest_map_get_slot_id chapter_num = (<old_map_index> + 1)
			ResolveScreenElementID id = {<slot_id> child = hilight}
			<resolved_id> :se_setprops alpha = 0
			quest_map_get_slot_id chapter_num = (<map_index> + 1)
			ResolveScreenElementID id = {<slot_id> child = hilight}
			<resolved_id> :se_setprops alpha = 1
			if (<up> = 1)
				ui_sfx \{menustate = career_map
					uitype = scrollup}
			else
				ui_sfx \{menustate = career_map
					uitype = scrolldown}
			endif
		endif
	endif
endscript

script ui_quest_map_choose \{device_num = !i1768515945}
	questmapid :GetSingleTag \{map_index}
	questmapid :GetSingleTag \{linear_progression}
	<chapter_name> = (<linear_progression> [<map_index>])
	<venue> = ($<chapter_name>.venue)
	Change current_level = <venue>
	<character_id> = ($<chapter_name>.rocker_id)
	getnumplayersingame \{local}
	getfirstplayer \{local}
	begin
	getplayerinfo <Player> controller
	if (<controller> = <device_num>)
		setplayerinfo <Player> character_id = <character_id>
		setplayerinfo <Player> score_attribute_level = 1
		break
	endif
	getnextplayer Player = <Player> local
	repeat <num_players>
	SetGlobalTags savegame = <device_num> career_progression_tags params = {current_chapter = <chapter_name>} Progression = true
	Change g_quest_map_index = <map_index>
	generic_event_choose state = uistate_quest_map_giglist data = {chapter_name = <chapter_name>}
endscript

script ui_quest_map_debug_beat 
	questmapid :GetSingleTag \{map_index}
	questmapid :GetSingleTag \{linear_progression}
	<chapter_name> = (<linear_progression> [<map_index>])
	<SongList> = ($<chapter_name>.songs)
	<song_idx> = 0
	GetArraySize <SongList>
	begin
	<song> = (<SongList> [<song_idx>])
	ui_quest_map_giglist_debug_beat song_name = <song> chapter_global = <chapter_name> refresh_menu = 0
	<song_idx> = (<song_idx> + 1)
	repeat <array_Size>
	Change g_quest_map_index = <map_index>
	ui_event \{event = menu_refresh}
endscript
