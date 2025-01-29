
script ui_create_freestyle_delete_song 
	CreateScreenElement \{parent = root_window
		id = freestyle_replay_tree
		Type = descinterface
		desc = 'freestyle_replay_tree_v2'}
	freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_refresh_menu_helpers params = {state = song_library_main}}
			{pad_back generic_event_choose params = {state = uistate_freestyle_postgame clear_previous_stack}}
			{pad_up generic_menu_up_or_down_sound params = {up = 1}}
			{pad_down generic_menu_up_or_down_sound params = {down = 2}}
		]
	}
	freestyle_replay_tree :se_setprops \{header_text = qs(0xa2bc2f7d)}
	freestyle_replay_tree :desc_resolvealias \{Name = alias_songlist_bg_illo}
	<resolved_id> :obj_spawnscript ui_shakeytime
	freestyle_replay_tree :desc_resolvealias \{Name = alias_songlist_header_bg}
	<resolved_id> :obj_spawnscript ui_shakeytime params = {Pos = (-55.0, -258.0)}
	freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_header}
	<resolved_id> :se_setprops {alpha = 1}
	freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
	GetArraySize \{$freestyle_performance_data}
	if (<array_Size> > 0)
		counter = 0
		num_songs = 0
		begin
		if StructureContains structure = ($freestyle_performance_data [<counter>]) song_name
			Name = ($freestyle_performance_data [<counter>].song_name)
			artist_name = ($freestyle_performance_data [<counter>].artist_name)
			formatText TextName = artist_name qs(0xa177baa0) s = <artist_name>
			formatText checksumName = song_id 'song_%d' d = <num_songs>
			CreateScreenElement {
				Type = ContainerElement
				parent = <resolved_id>
				id = <song_id>
				dims = (240.0, 80.0)
				z_priority = 100
				text = <Name>
				event_handlers = [
					{focus freestyle_option_focus_highlight_bar params = {desc_id = freestyle_replay_tree Pos = (-32.0, -16.0)}}
					{focus freestyle_replay_song_focus params = {Type = focus}}
					{focus freestyle_replay_refresh_song_info params = {index = <counter>}}
					{focus freestyle_replay_scroll}
					{unfocus freestyle_replay_song_focus params = {Type = unfocus}}
					{pad_choose freestyle_delete_song_mark_for_death params = {index = <counter> song = <song> artist = <artist>}}
				]
			}
			CreateScreenElement {
				Type = TextBlockElement
				local_id = song_text
				parent = <song_id>
				dims = (480.0, 40.0)
				font = fontgrid_title_a1
				internal_just = [left center]
				internal_scale = (0.5, 0.5)
				rgba = [250 250 255 255]
				z_priority = 100
				text = <Name>
				Pos = (240.0, 0.0)
				fit_width = `scale	each	line	if	larger`
				fit_height = `scale	down	if	larger`
			}
			CreateScreenElement {
				Type = TextBlockElement
				local_id = artist_text
				parent = <song_id>
				dims = (480.0, 40.0)
				font = fontgrid_text_a11
				internal_just = [left center]
				rgba = [104 181 204 255]
				internal_scale = (0.7, 0.7)
				z_priority = 100
				text = <artist_name>
				Pos = (240.0, 36.0)
				fit_width = `scale	each	line	if	larger`
				fit_height = `scale	down	if	larger`
			}
			num_songs = (<num_songs> + 1)
		endif
		counter = (<counter> + 1)
		repeat <array_Size>
		formatText TextName = text qs(0x48c6d14c) d = <num_songs>
		if (<num_songs> = 1)
			subtext = qs(0x7b899ac6)
		else
			subtext = qs(0x1cec7f8c)
		endif
		freestyle_replay_tree :se_setprops {
			songlist_songs_available_num_text = <text>
			songlist_songs_available_text = <subtext>
		}
	endif
	freestyle_replay_tree :se_setprops \{optional_info_text = qs(0xf448b35f)}
	create_2d_spring_system \{desc_id = freestyle_replay_tree
		num_springs = 2
		stiffness = 50
		rest_length = 1}
	freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
	LaunchEvent Type = focus target = <resolved_id>
endscript

script freestyle_delete_song_mark_for_death 
	RequireParams \{[
			index
		]
		all}
	if ScreenElementExists \{id = freestyle_replay_tree}
		freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
		LaunchEvent Type = unfocus target = <resolved_id>
		create_dialog_box {
			use_all_controllers
			heading_text = qs(0xaa163738)
			body_text = qs(0x33a2c996)
			options = [
				{
					func = destroy_dialog_box
					func_params = {dont_remove_helpers}
					text = qs(0xf7723015)
				}
				{
					func = freestyle_delete_song_finalize_overwrite
					func_params = {saveslot = <index> artist = <artist> song = <song>}
					text = qs(0x35525f6f)
				}
			]
			dlog_event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
			on_destroy_script = LaunchEvent
			on_destroy_script_params = {Type = focus target = <resolved_id>}
		}
	else
		ScriptAssert \{'Cant call this without the main tree for freestyle replay mode'}
	endif
endscript

script freestyle_delete_song_finalize_overwrite 
	RequireParams \{[
			saveslot
		]
		all}
	destroy_dialog_box
	Change freestyle_postgame_is_saved = <saveslot>
	freestyleselectsaveslot saveslot = <saveslot>
	freestyle_tag_current_performance song_name = <song> artist_name = <artist>
	ui_memcard_save_freestyle_replace \{event = menu_replace
		state = uistate_freestyle_postgame}
endscript

script ui_destroy_freestyle_delete_song 
	DestroyScreenElement \{id = freestyle_replay_tree}
endscript
