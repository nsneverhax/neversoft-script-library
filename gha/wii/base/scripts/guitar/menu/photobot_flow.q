photobot_select_song_fs = {
	create = photobot_check_song_script
	Destroy = photobot_empty_script
	actions = [
		{
			action = continue
			func = photobot_start_song
			flow_state = photobot_play_song_fs
		}
		{
			action = go_back
			flow_state = main_menu_fs
			transition_left
		}
	]
}
photobot_play_song_fs = {
	create = create_photobot_play_song_menu
	Destroy = destroy_photobot_play_song_menu
	actions = [
		{
			action = win_song
			func = kill_gem_scroller
			flow_state = photobot_song_over_fs
		}
		{
			action = fail_song
			func = kill_gem_scroller
			flow_state = photobot_song_over_fs
		}
	]
}
photobot_song_over_fs = {
	create = photobot_continue_script
	Destroy = photobot_empty_script
	actions = [
		{
			action = continue
			func = photobot_next_song
			flow_state = photobot_select_song_fs
		}
	]
}
photobot_song_index = 0
photobot_venue_index = 0
photobot_song_section = 0
photobot_done = 0

script photobot_startup \{venue = 0
		section = 0}
	Change photobot_song_section = <section>
	Change photobot_song_index = (<section> * 22)
	Change photobot_venue_index = <venue>
	Change \{photobot_done = 0}
	Change \{current_difficulty = expert}
	ui_flow_manager_respond_to_action \{action = photobot_test}
endscript

script photobot_empty_script 
endscript

script photobot_continue_script 
	SpawnScriptLater \{photobot_delayed_action
		params = {
			action = continue
		}}
endscript

script photobot_delayed_action 
	Wait \{1.0}
	SpawnScriptLater ui_flow_manager_respond_to_action params = {action = <action>}
endscript

script photobot_check_song_script 
	if (($photobot_done) = 1)
		SpawnScriptLater \{photobot_delayed_action
			params = {
				action = go_back
			}}
	else
		photobot_continue_script
	endif
endscript

script photobot_start_song 
	character_id = robot
	Change structurename = player1_status character_id = <character_id>
	Change \{structurename = player1_status
		outfit = 1}
	Change \{structurename = player1_status
		style = 5}
	guitar_array = ($Bonus_Guitars)
	GetArraySize ($Secret_Guitars)
	index = 0
	begin
	guitar_id = ($Secret_Guitars [<index>].id)
	GetGlobalTags <guitar_id>
	if (<unlocked_for_purchase> = 1)
		AddArrayElement array = (<guitar_array>) element = ($Secret_Guitars [<index>])
		<guitar_array> = (<array>)
	endif
	<index> = (<index> + 1)
	repeat <array_Size>
	GetArraySize <guitar_array>
	GetRandomValue a = 0 b = (<array_Size> -1) Name = random_guitar_index integer
	get_musician_instrument_struct index = <random_guitar_index>
	Change structurename = player1_status instrument_id = (<info_struct>.desc_id)
	get_LevelZoneArray_checksum index = ($photobot_venue_index)
	Change current_level = <level_checksum>
	get_songlist_checksum index = ($photobot_song_index)
	Change current_song = <song_checksum>
	start_song
endscript

script photobot_next_song 
	Change photobot_song_index = (($photobot_song_index) + 1)
	array_Size = 22
	if (($photobot_song_section) = 1)
		array_Size = 43
	endif
	if ((($photobot_song_index) = <array_Size>) || (($photobot_song_index) > <array_Size>))
		Change \{photobot_done = 1}
	endif
endscript
photobot_text_pos = (640.0, 540.0)
photobot_text_scale = (2.0, 2.0)
photobot_text_dims = (465.0, 300.0)

script photobot_show_song_and_venue 
	CreateScreenElement \{Type = ContainerElement
		id = photobot_text_container
		parent = root_window
		Pos = (0.0, 0.0)
		just = [
			left
			top
		]
		Scale = (1.0, 1.0)
		z_priority = 1000000
		alpha = 1}
	formatText TextName = photobot_text '%s' s = ($photobot_song_index)
	CreateScreenElement {
		Type = TextBlockElement
		parent = photobot_text_container
		id = photobot_textblock
		text = <photobot_text>
		font = text_a4
		Scale = ($photobot_text_scale)
		just = [center center]
		dims = ($photobot_text_dims)
		Pos = ($photobot_text_pos)
		rgba = [255 255 255 255]
		z_priority = 1000000
		Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
endscript

script create_photobot_play_song_menu 
	show_highway
	photobot_show_song_and_venue
endscript

script destroy_photobot_play_song_menu 
	hide_highway
	if ScreenElementExists \{id = photobot_text_container}
		DestroyScreenElement \{id = photobot_text_container}
	endif
endscript
