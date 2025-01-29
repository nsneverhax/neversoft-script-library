freestyle_wc24_enabled = FALSE
freestyle_wc24_errorcode = 0
freestyle_wc24_errorchecksum = 0
freestyle_replay_sent_songs_counter = 3
freestyle_replay_last_song_selected = 0

script ui_create_freestyle_replay 
	CreateScreenElement \{parent = root_window
		id = freestyle_replay_tree
		Type = descinterface
		desc = 'freestyle_replay_tree_v2'
		header_text = qs(0x61549f02)}
	freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
	<resolved_id> :se_setprops {
		event_handlers = [
			{focus freestyle_refresh_menu_helpers params = {state = song_library_main}}
			{pad_back freestyle_replay_back}
			{pad_back freestyle_update_highlighted_song_global params = {index = 0}}
		]
	}
	freestyle_replay_tree :desc_resolvealias \{Name = 0x1c92d292}
	<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 Color = [61 218 250 200]}
	freestyle_replay_tree :desc_resolvealias \{Name = 0x79ef65f5}
	<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.5 Color = [171 14 152 200]}
	freestyle_replay_tree :desc_resolvealias \{Name = 0x1cd5eae0}
	<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.5 Color = [171 14 152 200]}
	freestyle_replay_tree :desc_resolvealias \{Name = 0xeeff9e24}
	<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.5 Color = [171 14 152 200]}
	freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_header}
	<resolved_id> :se_setprops {alpha = 1}
	freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
	GetArraySize \{$freestyle_performance_data}
	num_songs = 0
	if (<array_Size> > 0)
		counter = 0
		begin
		if StructureContains structure = ($freestyle_performance_data [<counter>]) song_name
			Name = ($freestyle_performance_data [<counter>].song_name)
			artist = ($freestyle_performance_data [<counter>].artist_name)
			formatText TextName = artist qs(0xa177baa0) s = <artist>
			formatText checksumName = song_id 'song_%d' d = <num_songs>
			CreateScreenElement {
				Type = descinterface
				parent = <resolved_id>
				id = <song_id>
				dims = (480.0, 80.0)
				z_priority = 11
				song_name_text = <Name>
				0x5cf821d8 = fontgrid_title_a1
				artist_name_text = <artist>
				0x93d571b2 = fontgrid_text_a1
				font = fontgrid_text_a1
				event_handlers = [
					{focus freestyle_replay_song_focus params = {Type = focus}}
					{focus freestyle_replay_refresh_song_info params = {index = <counter>}}
					{focus freestyle_replay_scroll}
					{focus freestyle_update_highlighted_song_global params = {index = <num_songs>}}
					{unfocus freestyle_replay_song_focus params = {Type = unfocus}}
					{pad_choose freestyle_replay_spawn_song_popup params = {Name = <Name> index = <counter> local}}
				]
				desc = 'freestyle_library_entry'
			}
			<song_id> :SetTags saveslot = <counter>
			LaunchEvent Type = unfocus target = <id>
			num_songs = (<num_songs> + 1)
		endif
		counter = (<counter> + 1)
		repeat <array_Size>
		formatText TextName = text qs(0x48c6d14c) d = <num_songs>
		if (<num_songs> = 1)
			subtext = qs(0xc331894e)
		else
			subtext = qs(0x6b0894a9)
		endif
		freestyle_replay_tree :se_setprops {
			songlist_songs_available_num_text = <text>
			songlist_songs_available_text = <subtext>
		}
	endif
	if (<num_songs> <= 0)
		freestyle_replay_tree :se_setprops \{no_songs_alpha = 1}
		freestyle_replay_tree :desc_resolvealias \{Name = alias_songlist_hilight_bar_cont}
		<resolved_id> :se_setprops {
			alpha = 0
		}
		freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
		<resolved_id> :se_setprops {
			event_handlers = [
				{focus freestyle_refresh_menu_helpers params = {state = song_library_main no_songs}}
			]
			replace_handlers
		}
	else
		freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
		<resolved_id> :se_setprops {
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up = 1}}
				{pad_down generic_menu_up_or_down_sound params = {down = 2}}
			]
		}
		freestyle_replay_tree :se_setprops \{optional_info_text = qs(0x30814cbb)}
	endif
	freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
	GetScreenElementChildren id = <resolved_id>
	if GotParam \{children}
		GetArraySize <children>
		if ((<array_Size> > 0) && (($freestyle_replay_last_song_selected) < <array_Size>))
			LaunchEvent Type = focus target = <resolved_id> data = {child_id = (<children> [($freestyle_replay_last_song_selected)])}
		else
			LaunchEvent Type = focus target = <resolved_id>
		endif
	else
		LaunchEvent Type = focus target = <resolved_id>
	endif
	CreateScreenElement \{parent = freestyle_replay_tree
		id = song_manager_event_catcher
		Type = HMenu}
	song_manager_event_catcher :se_setprops {
		event_handlers = [
			{timeout freestyle_handle_timeout params = {current_menu = <resolved_id> song_list}}
		]
	}
	freestyle_wc24_status_update
	if ($freestyle_wc24_errorcode = 0)
		if NetSessionFunc \{func = can_view_user_content}
			freestylepopulatescriptsonginbox
			printstruct <songarray>
			GetArraySize <songarray>
			if (<array_Size> > 0)
				if NOT StructureContains structure = (<songarray> [0]) Name = invalid
					song_name = (<songarray> [0].song_name)
					author_name = (<songarray> [0].author_name)
					message_index = (<songarray> [0].index)
					message_id = (<songarray> [0].msgid)
					freestyle_replay_spawn_song_popup net Name = <song_name> index = <message_index> message_id = <message_id> author = <author_name>
				endif
			endif
		endif
	endif
	0x61906aac
endscript

script freestyle_replay_back 
	menu_transition_stoprender
	generic_event_choose \{state = uistate_freestyle_mainmenu
		data = {
			clear_previous_stack
			0x94ce90f8
		}}
endscript

script freestyle_wc24_status_update 
	freestyleiswc24working
	getngcneterrors
	if (<dwc_error_code> = 0)
		Change freestyle_wc24_errorcode = <ErrorCode>
		Change freestyle_wc24_errorchecksum = <errorchecksum>
	else
		Change freestyle_wc24_errorcode = <dwc_error_code>
		Change freestyle_wc24_errorchecksum = <0xc7a80de9>
	endif
	printf \{'================================'}
	printf \{'freestyle_wc24_status_update'}
	printf \{$freestyle_wc24_errorcode}
	printf \{$freestyle_wc24_errorchecksum}
	printf \{'================================'}
	if (<ErrorCode> = 0)
		Change \{freestyle_wc24_enabled = true}
	else
		Change \{freestyle_wc24_enabled = FALSE}
	endif
	if NOT NetSessionFunc \{func = can_view_user_content}
		Change \{freestyle_wc24_enabled = FALSE}
	endif
endscript

script freestyle_update_highlighted_song_global 
	RequireParams \{[
			index
		]
		all}
	Change freestyle_replay_last_song_selected = <index>
endscript

script freestyle_replay_scroll 
	if NOT ScreenElementExists \{id = freestyle_share_list_tree}
		freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
		Tree = freestyle_replay_tree
	else
		freestyle_share_list_tree :desc_resolvealias \{Name = alias_menu}
		Tree = freestyle_share_list_tree
	endif
	if countscreenelementchildren id = <resolved_id>
		if (<num_children> > 1)
			<resolved_id> :menu_getselectedindex
			<Tree> :desc_resolvealias Name = slider_nub
			just = [0.0 0.0]
			percentage = ((<selected_index> * 1.0) / (<num_children> -1))
			0xe8e85a22 = (1.0 - ((1.0 - <percentage>) * 2.0))
			SetArrayElement ArrayName = just index = 1 NewValue = <0xe8e85a22>
			printstruct <just>
			<resolved_id> :se_setprops {
				pos_anchor = <just>
				Pos = (0.0, 0.0)
			}
		endif
	endif
endscript

script freestyle_replay_song_focus 
	RequireParams \{[
			Type
		]
		all}
	Obj_GetID
	switch <Type>
		case focus
		<objID> :se_setprops {
			highlight_alpha = 1
			0x44d7fb14 = 0xeba53270
		}
		case unfocus
		<objID> :se_setprops {
			highlight_alpha = 0
			0x44d7fb14 = gh51_blue_lt
		}
	endswitch
endscript

script freestyle_replay_spawn_song_popup 
	RequireParams \{[
			Name
			index
		]
		all}
	if ScreenElementExists \{id = freestyle_replay_tree}
		CreateScreenElement \{parent = root_window
			id = freestyle_replay_song_popup
			Type = descinterface
			desc = 'freestyle_replay_song_popup_v2'
			fit_width = truncate}
		if GotParam \{local}
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu}
			<resolved_id> :se_setprops {event_handlers = [
					{focus freestyle_refresh_menu_helpers params = {state = song_library_popup}}
					{pad_up generic_menu_up_or_down_sound params = {up = 1}}
					{pad_down generic_menu_up_or_down_sound params = {down = 2}}
					{pad_back freestyle_replay_destroy_popup}
				]
			}
			song_manager_event_catcher :se_setprops {
				event_handlers = [
					{timeout freestyle_handle_timeout params = {current_menu = <resolved_id> song_popup}}
				]
				replace_handlers
			}
			LaunchEvent Type = focus target = <resolved_id>
			freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
			LaunchEvent Type = unfocus target = <resolved_id>
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu_option_0}
			<resolved_id> :se_setprops {event_handlers = [
					{focus generic_barrel_menu_item_focus}
					{unfocus generic_barrel_menu_item_unfocus}
					{pad_choose freestyle_watch_song params = {index = <index>}}
				]
			}
			LaunchEvent Type = unfocus target = <resolved_id>
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu_option_1}
			<resolved_id> :se_setprops {event_handlers = [
					{focus generic_barrel_menu_item_focus}
					{unfocus generic_barrel_menu_item_unfocus}
					{pad_choose freestyle_share_song params = {index = <index>}}
				]
			}
			LaunchEvent Type = unfocus target = <resolved_id>
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu_option_2}
			<resolved_id> :se_setprops {event_handlers = [
					{focus generic_barrel_menu_item_focus}
					{unfocus generic_barrel_menu_item_unfocus}
					{pad_choose freestyle_delete_song params = {index = <index>}}
				]
			}
			LaunchEvent Type = unfocus target = <resolved_id>
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu_option_3}
			<resolved_id> :se_setprops {event_handlers = [
					{focus generic_barrel_menu_item_focus}
					{unfocus generic_barrel_menu_item_unfocus}
					{pad_choose freestyle_rerecord_song params = {index = <index> device_num = <device_num>}}
				]
			}
			LaunchEvent Type = unfocus target = <resolved_id>
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_name}
			<resolved_id> :se_setprops {text = <Name>}
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_artist}
			<resolved_id> :se_setprops {text = qs(0x03ac90f0)}
		elseif GotParam \{net}
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu}
			<resolved_id> :se_setprops {event_handlers = [
					{focus freestyle_refresh_menu_helpers params = {state = song_library_popup}}
					{pad_up generic_menu_up_or_down_sound params = {up = 1}}
					{pad_down generic_menu_up_or_down_sound params = {down = 2}}
					{pad_back generic_event_choose params = {state = uistate_freestyle_mainmenu data = {clear_previous_stack}}}
				]
			}
			song_manager_event_catcher :se_setprops {
				event_handlers = [
					{timeout freestyle_handle_timeout params = {current_menu = <resolved_id> song_popup}}
				]
				replace_handlers
			}
			LaunchEvent Type = focus target = <resolved_id>
			freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
			LaunchEvent Type = unfocus target = <resolved_id>
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu_option_0}
			<resolved_id> :se_setprops {event_handlers = [
					{focus generic_barrel_menu_item_focus}
					{unfocus generic_barrel_menu_item_unfocus}
					{pad_choose freestyle_watch_net_song params = {index = <index>}}
				]
			}
			LaunchEvent Type = unfocus target = <resolved_id>
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu_option_1}
			<resolved_id> :se_setprops {event_handlers = [
					{focus generic_barrel_menu_item_focus}
					{unfocus generic_barrel_menu_item_unfocus}
					{pad_choose freestyle_save_net_song params = {index = <index> msgid = <message_id>}}
				]
				menurow_txt_item_text = qs(0xd40268ee)
			}
			LaunchEvent Type = unfocus target = <resolved_id>
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu_option_2}
			<resolved_id> :se_setprops {event_handlers = [
					{focus generic_barrel_menu_item_focus}
					{unfocus generic_barrel_menu_item_unfocus}
					{pad_choose freestyle_delete_net_song params = {index = <index> msgid = <message_id>}}
				]
			}
			LaunchEvent Type = unfocus target = <resolved_id>
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu_option_3}
			DestroyScreenElement id = <resolved_id>
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_header}
			<resolved_id> :se_setprops {text = qs(0xffdad7b4)}
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_name}
			<resolved_id> :se_setprops {text = <Name>}
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_artist}
			if GotParam \{author}
				formatText TextName = text qs(0x9ea99bc9) d = <author>
				<resolved_id> :se_setprops {text = <text>}
			else
				<resolved_id> :se_setprops {text = qs(0xde957de7)}
			endif
		else
			ScriptAssert \{'Must supply a parameter to specify the popups purpose, such as local or net'}
		endif
	else
		ScriptAssert \{'Shouldnt be spawning this popup without the freestyle replay tree'}
	endif
endscript

script freestyle_replay_popup_hide 
	if ScreenElementExists \{id = freestyle_replay_song_popup}
		freestyle_replay_song_popup :se_setprops \{alpha = 0}
	endif
endscript

script freestyle_replay_popup_unhide 
	if ScreenElementExists \{id = freestyle_replay_song_popup}
		freestyle_replay_song_popup :se_setprops \{alpha = 1}
	endif
endscript

script freestyle_rerecord_song 
	freestyleselectviewslot viewslot = <index>
	Change \{freestyle_recording_mode = overdub}
	Change \{freestyle_game_mode = standard}
	freestyle_restore_performance_data
	freestyle_setup_players_for_playback
	Change freestyle_band_lobby_original_rerecording_data = ($freestyle_player_data)
	Change \{freestyle_game_from_postgame = 0}
	generic_event_choose \{state = uistate_band_lobby}
endscript

script freestyle_watch_net_song 
	freestyleselectmessageforwatching messageindex = <index>
	Change \{freestyle_recording_mode = playback}
	Change \{freestyle_game_mode = watch}
	freestyle_restore_performance_data
	freestyle_setup_players_for_playback
	Change \{freestyle_game_from_postgame = 0}
	generic_event_replace \{data = {
			state = uistate_freestyle_game
			clear_previous_stack
		}}
endscript

script freestyle_save_net_song 
	freestyle_get_available_save_slot
	printf qs(0x76b3fda7) d = <saveslot>
	if NOT (<saveslot> = -1)
		freestylesavereceivedsongtoslot songindex = <index> songslot = <saveslot>
		freestyledeleteinboxmessage messageindex = <msgid>
		ui_memcard_save_freestyle_replace \{event = menu_replace
			state = uistate_freestyle_save_load_transition}
	else
		freestyle_replay_popup_hide
		freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu}
		LaunchEvent Type = unfocus target = <resolved_id>
		create_dialog_box {
			use_all_controllers
			heading_text = qs(0xaa163738)
			body_text = qs(0x3b41678a)
			options = [
				{
					func = freestyle_song_library_popup_close
					func_params = {dont_remove_helpers}
					text = qs(0xd2915c27)
				}
				{
					func = freestyle_begin_overwrite_process
					func_params = {songindex = <index> msgid = <msgid>}
					text = qs(0x58e0a1fb)
				}
			]
			dlog_event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
			on_destroy_script = LaunchEvent
			on_destroy_script_params = {Type = focus target = <resolved_id>}
		}
	endif
endscript

script freestyle_delete_net_song 
	RequireParams \{[
			msgid
		]
		all}
	if NOT ScreenElementExists \{id = dialog_box_desc_id}
		freestyle_replay_popup_hide
		freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu}
		LaunchEvent Type = unfocus target = <resolved_id>
		create_dialog_box {
			use_all_controllers
			heading_text = qs(0xaa163738)
			body_text = qs(0x7c81e23f)
			options = [
				{
					func = freestyle_song_library_popup_close
					func_params = {dont_remove_helpers}
					text = qs(0xf7723015)
				}
				{
					func = freestyle_delete_net_song
					func_params = {msgid = <msgid>}
					text = qs(0x271a1633)
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
		destroy_dialog_box
		freestyledeleteinboxmessage messageindex = <msgid>
		generic_event_choose \{state = uistate_freestyle_replay
			data = {
				clear_previous_stack
			}}
	endif
endscript

script freestyle_begin_overwrite_process 
	if ScreenElementExists \{id = freestyle_replay_song_popup}
		destroy_dialog_box
		freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
		<resolved_id> :se_setprops {
			event_handlers = [
				{pad_back freestyle_kill_overwrite_process}
			]
			replace_handlers
		}
		freestyle_replay_tree :se_setprops \{header_text = qs(0xa2bc2f7d)
			optional_info_text = qs(0xf448b35f)}
		if countscreenelementchildren id = <resolved_id>
			counter = 0
			begin
			formatText checksumName = song_id 'song_%d' d = <counter>
			<song_id> :GetTags saveslot
			<song_id> :se_setprops {
				event_handlers = [
					{pad_choose freestyle_overwrite_song params = {songindex = <songindex> saveslot = <saveslot>}}
				]
				replace_handlers
			}
			counter = (<counter> + 1)
			repeat <num_children>
		endif
		freestyle_replay_song_popup :se_setprops \{alpha = 0}
		freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu}
		LaunchEvent Type = unfocus target = <resolved_id>
		freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
		LaunchEvent Type = focus target = <resolved_id>
	else
		ScriptAssert \{'Overwrite process must be started from the song popup which doesnt exist...'}
	endif
endscript

script freestyle_overwrite_song 
	if ScreenElementExists \{id = freestyle_replay_tree}
		RequireParams \{[
				songindex
				saveslot
			]
			all}
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
					func = freestyle_confirm_overwrite_from_wc24
					func_params = {songindex = <songindex> saveslot = <saveslot>}
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

script freestyle_confirm_overwrite_from_wc24 
	destroy_dialog_box
	freestylesavereceivedsongtoslot songindex = <songindex> songslot = <saveslot>
	ui_memcard_save_freestyle_replace \{event = menu_replace
		state = uistate_freestyle_save_load_transition}
endscript

script freestyle_kill_overwrite_process 
	freestyle_replay_tree :se_setprops \{header_text = qs(0x61549f02)
		optional_info_text = qs(0x30814cbb)}
	freestyle_replay_song_popup :se_setprops \{alpha = 1}
	freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu}
	LaunchEvent Type = focus target = <resolved_id>
	freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
	LaunchEvent Type = unfocus target = <resolved_id>
endscript

script freestyle_replay_destroy_popup 
	DestroyScreenElement \{id = freestyle_replay_song_popup}
	freestyle_replay_tree :desc_resolvealias \{Name = alias_freestyle_replay_song_list_menu}
	song_manager_event_catcher :se_setprops {
		event_handlers = [
			{timeout freestyle_handle_timeout params = {current_menu = <resolved_id> song_list}}
		]
		replace_handlers
	}
	LaunchEvent Type = focus target = <resolved_id>
endscript

script freestyle_watch_song 
	freestyleselectviewslot viewslot = <index>
	Change \{freestyle_recording_mode = playback}
	Change \{freestyle_game_mode = watch}
	freestyle_restore_performance_data
	freestyle_setup_players_for_playback
	Change \{freestyle_game_from_postgame = 0}
	generic_event_replace \{data = {
			state = uistate_freestyle_game
			clear_previous_stack
		}}
endscript

script freestyle_share_song 
	if ScreenElementExists \{id = freestyle_replay_song_popup}
		freestyle_wc24_status_update
		if (($freestyle_wc24_enabled) = true)
			if ($freestyle_replay_sent_songs_counter > 0)
				freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu}
				song_manager_event_catcher :se_setprops {
					event_handlers = [
						{timeout freestyle_handle_timeout params = {current_menu = <resolved_id> friend_list}}
					]
					replace_handlers
				}
				freestylepopulatescriptfriendlist
				GetArraySize <friendarray>
				if (<array_Size> > 0)
					clean_up_user_control_helpers
					add_user_control_helper \{text = qs(0x0a5ac2fe)
						button = green
						z = 1000}
					add_user_control_helper \{text = qs(0xaf4d5dd2)
						button = red
						z = 1000}
					add_user_control_helper \{text = qs(0xf13fea63)
						button = start
						z = 1000}
					freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu}
					LaunchEvent Type = unfocus target = <resolved_id>
					freestyle_replay_song_popup :se_setprops \{alpha = 0}
					CreateScreenElement \{parent = root_window
						id = freestyle_share_list_tree
						Type = descinterface
						desc = 'freestyle_share_list_tree_v2'}
					freestyle_share_list_tree :desc_resolvealias \{Name = 0x1c92d292}
					<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 Color = [61 218 250 200]}
					freestyle_share_list_tree :desc_resolvealias \{Name = 0x134049b3}
					<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 Color = [61 218 250 200]}
					freestyle_share_list_tree :desc_resolvealias \{Name = 0xcd05f2fc}
					<resolved_id> :obj_spawnscript 0x182aefab params = {0x971c66e7 = 0.3 Color = [61 218 250 200]}
					freestyle_replay_tree :se_setprops \{alpha = 0}
					formatText TextName = text qs(0xb68f1173) n = ($freestyle_replay_sent_songs_counter)
					freestyle_share_list_tree :se_setprops {
						session_sending_limit_text = <text>
					}
					freestyle_share_list_tree :se_setprops {
						song_name_text = ($freestyle_performance_data [<index>].song_name)
					}
					freestyle_share_list_tree :SetTags \{current_selection = 0}
					freestyle_share_list_tree :SetTags \{friend_count = 0}
					freestyle_share_list_tree :SetTags \{max_messages = 8}
					freestyle_share_list_tree :SetTags \{current_messages = 0}
					freestyle_share_list_tree :desc_resolvealias \{Name = alias_menu}
					<resolved_id> :se_setprops {
						event_handlers = [
							{pad_up generic_menu_up_or_down_sound params = {up = 1}}
							{pad_down generic_menu_up_or_down_sound params = {down = 2}}
							{pad_back freestyle_replay_destroy_share_list}
							{pad_start freestyle_replay_send_song params = {<...>}}
						]
					}
					LaunchEvent Type = focus target = <resolved_id>
					counter = 0
					begin
					if (<friendarray> [<counter>].email = 0)
						freestyle_replay_add_friend_to_sharelist Name = (<friendarray> [<counter>].Name) index = <counter>
					endif
					counter = (<counter> + 1)
					repeat <array_Size>
				else
					freestyle_replay_popup_hide
					LaunchEvent Type = unfocus target = <resolved_id>
					create_dialog_box {
						use_all_controllers
						heading_text = qs(0xcf5deb58)
						body_text = qs(0x4d973ccb)
						options = [
							{
								func = freestyle_song_library_popup_close
								func_params = {dont_remove_helpers}
								text = qs(0x0e41fe46)
							}
						]
						dlog_event_handlers = [
							{pad_up generic_menu_up_or_down_sound params = {up}}
							{pad_down generic_menu_up_or_down_sound params = {down}}
						]
						on_destroy_script = LaunchEvent
						on_destroy_script_params = {Type = focus target = <resolved_id>}
					}
				endif
			else
				freestyle_replay_popup_hide
				freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu}
				LaunchEvent Type = unfocus target = <resolved_id>
				create_dialog_box {
					use_all_controllers
					heading_text = qs(0xaa163738)
					body_text = qs(0x5b5aed42)
					options = [
						{
							func = freestyle_song_library_popup_close
							func_params = {dont_remove_helpers}
							text = qs(0x0e41fe46)
						}
					]
					dlog_event_handlers = [
						{pad_up generic_menu_up_or_down_sound params = {up}}
						{pad_down generic_menu_up_or_down_sound params = {down}}
					]
					on_destroy_script = LaunchEvent
					on_destroy_script_params = {Type = focus target = <resolved_id>}
				}
			endif
		else
			freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu}
			freestyle_replay_popup_hide
			getngcneterrors
			if (<dwc_error_code> = 0)
				refname = $freestyle_wc24_errorchecksum
				errortext = $<refname>
				ErrorCode = $freestyle_wc24_errorcode
			else
				errortext = <dwc_error_text>
				ErrorCode = <dwc_error_code>
			endif
			if (<ErrorCode> < 100000)
				formatText TextName = title qs(0x53dc76b9) s = <ErrorCode>
			else
				formatText TextName = title qs(0xded84eda) s = <ErrorCode>
			endif
			LaunchEvent Type = unfocus target = <resolved_id>
			create_dialog_box {
				use_all_controllers
				heading_text = <title>
				body_text = <errortext>
				options = [
					{
						func = freestyle_song_library_popup_close
						func_params = {dont_remove_helpers}
						text = qs(0x0e41fe46)
					}
				]
				dlog_event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
				]
				on_destroy_script = LaunchEvent
				on_destroy_script_params = {Type = focus target = <resolved_id>}
			}
		endif
	else
		ScriptAssert \{'Cant init the share list. Make sure it is being launched from the replay popup'}
	endif
endscript

script freestyle_replay_add_friend_to_sharelist 
	RequireParams \{[
			Name
		]
		all}
	if ScreenElementExists \{id = freestyle_share_list_tree}
		freestyle_share_list_tree :desc_resolvealias \{Name = alias_menu}
		freestyle_share_list_tree :GetTags \{friend_count}
		formatText checksumName = friend_id 'friend_%d' d = (<friend_count> + 1)
		CreateScreenElement {
			dims = (480.0, 50.0)
			id = <friend_id>
			parent = <resolved_id>
			Type = descinterface
			event_handlers = [
				{pad_choose freestyle_share_list_friend_toggle}
				{focus freestyle_replay_scroll}
				{focus freestyle_share_list_update_helpers}
				{focus generic_barrel_menu_item_focus}
				{unfocus generic_barrel_menu_item_unfocus}
			]
			desc = 'menurow_txt_desc'
			menurow_txt_item_text = <Name>
			menurow_internal_just = [center center]
			menurow_just = [center center]
			z_priority = 105
		}
		LaunchEvent Type = unfocus target = <id>
		<friend_id> :SetTags friend_index = <index>
		<friend_id> :SetTags toggle = OFF
		freestyle_share_list_tree :SetTags friend_count = (<friend_count> + 1)
	else
		ScriptAssert \{'Cant add friend to nonexistent share list'}
	endif
endscript

script freestyle_share_list_update_helpers 
	Obj_GetID
	<objID> :GetTags toggle
	clean_up_user_control_helpers
	if (<toggle> = OFF)
		add_user_control_helper \{text = qs(0x0a5ac2fe)
			button = green
			z = 1000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 1000}
		add_user_control_helper \{text = qs(0xf13fea63)
			button = start
			z = 1000}
	elseif (<toggle> = On)
		add_user_control_helper \{text = qs(0x0307b55c)
			button = green
			z = 1000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 1000}
		add_user_control_helper \{text = qs(0xf13fea63)
			button = start
			z = 1000}
	endif
endscript

script freestyle_share_list_friend_toggle 
	if ScreenElementExists \{id = freestyle_share_list_tree}
		Obj_GetID
		freestyle_share_list_tree :GetTags \{max_messages}
		freestyle_share_list_tree :GetTags \{current_messages}
		<objID> :GetTags toggle
		if (<toggle> = On)
			<objID> :SetTags toggle = OFF
			if (<current_messages> > 0)
				freestyle_share_list_tree :SetTags current_messages = (<current_messages> -1)
				freestyle_share_list_tree :GetTags \{current_messages}
				formatText TextName = text qs(0xcb83a1e1) n = <current_messages> m = <max_messages>
				freestyle_share_list_tree :se_setprops {
					remaining_friends_text = <text>
				}
			else
				ScriptAssert \{'Attempted to remove a friend from the send list when there were no friends to remove.'}
			endif
			freestyle_replay_refresh_outbox
			<objID> :obj_spawnscript freestyle_share_list_update_helpers
		elseif (<toggle> = OFF)
			if (<current_messages> < <max_messages>)
				<objID> :SetTags toggle = On
				freestyle_share_list_tree :SetTags current_messages = (<current_messages> + 1)
				freestyle_share_list_tree :GetTags \{current_messages}
				formatText TextName = text qs(0xcb83a1e1) n = <current_messages> m = <max_messages>
				freestyle_share_list_tree :se_setprops {
					remaining_friends_text = <text>
				}
				freestyle_replay_refresh_outbox
				<objID> :obj_spawnscript freestyle_share_list_update_helpers
			else
				freestyle_replay_popup_hide
				freestyle_share_list_tree :desc_resolvealias \{Name = alias_menu}
				LaunchEvent Type = unfocus target = <resolved_id>
				create_dialog_box {
					use_all_controllers
					heading_text = qs(0xcf5deb58)
					body_text = qs(0x1bd2d71c)
					options = [
						{
							func = destroy_dialog_box
							func_params = {dont_remove_helpers}
							text = qs(0x0e41fe46)
						}
					]
					dlog_event_handlers = [
						{pad_up generic_menu_up_or_down_sound params = {up}}
						{pad_down generic_menu_up_or_down_sound params = {down}}
					]
					on_destroy_script = LaunchEvent
					on_destroy_script_params = {Type = focus target = <resolved_id>}
				}
			endif
		else
			ScriptAssert 'Invalid value of %d stored in toggle' d = <toggle>
		endif
	else
		ScriptAssert \{'Tis useless to toggle a friend if there is no share list!'}
	endif
endscript

script freestyle_replay_destroy_share_list 
	DestroyScreenElement \{id = freestyle_share_list_tree}
	freestyle_replay_tree :se_setprops \{alpha = 1}
	freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu}
	LaunchEvent Type = focus target = <resolved_id>
	freestyle_replay_song_popup :se_setprops \{alpha = 1}
endscript

script freestyle_replay_send_song 
	RequireParams \{[
			index
		]
		all}
	if ScreenElementExists \{id = freestyle_share_list_tree}
		freestyle_share_list_tree :GetTags \{friend_count}
		friend_list = []
		if (<friend_count> > 0)
			freestyle_share_list_tree :desc_resolvealias \{Name = alias_menu}
			GetScreenElementChildren id = <resolved_id>
			printstruct <children>
			counter = 0
			begin
			temp = [0]
			current_friend_id = (<children> [<counter>])
			<current_friend_id> :GetTags toggle
			if (<toggle> = On)
				<current_friend_id> :GetTags friend_index
				SetArrayElement ArrayName = temp index = 0 NewValue = <friend_index>
				friend_list = (<temp> + <friend_list>)
				printf qs(0x76b3fda7) d = <counter>
			endif
			counter = (<counter> + 1)
			repeat <friend_count>
			GetArraySize <friend_list>
			if (<array_Size> > 0)
				freestylesendsong songslot = <index> friendlist = <friend_list>
				freestylesendnotificationmsg friendlist = <friend_list> message = [qs(0x5c9f5679) , qs(0x921133ff) , qs(0x1090b8ea) , qs(0x719991e9) , qs(0x3a05fc21) , qs(0x2ba2c9a2) , qs(0xf15baad5) , qs(0xdaa4ee39) , qs(0xac94e45c) , qs(0x2ba2c9a2) , qs(0x2ba2c9a2)]
				Change freestyle_replay_sent_songs_counter = ($freestyle_replay_sent_songs_counter - 1)
				formatText TextName = text qs(0xb68f1173) n = ($freestyle_replay_sent_songs_counter)
				freestyle_share_list_tree :se_setprops {
					session_sending_limit_text = <text>
				}
				displaynotification \{qs(0x73a918c8)
					display_time = 3
					position = topright}
				freestyle_replay_destroy_share_list
			else
				freestyle_replay_popup_hide
				freestyle_share_list_tree :desc_resolvealias \{Name = alias_menu}
				LaunchEvent Type = unfocus target = <resolved_id>
				create_dialog_box {
					use_all_controllers
					heading_text = qs(0xcf5deb58)
					body_text = qs(0xb2cfe090)
					options = [
						{
							func = destroy_dialog_box
							func_params = {dont_remove_helpers}
							text = qs(0x0e41fe46)
						}
					]
					dlog_event_handlers = [
						{pad_up generic_menu_up_or_down_sound params = {up}}
						{pad_down generic_menu_up_or_down_sound params = {down}}
					]
					on_destroy_script = LaunchEvent
					on_destroy_script_params = {Type = focus target = <resolved_id>}
				}
			endif
		else
			freestyle_replay_popup_hide
			freestyle_share_list_tree :desc_resolvealias \{Name = alias_menu}
			LaunchEvent Type = unfocus target = <resolved_id>
			create_dialog_box {
				use_all_controllers
				heading_text = qs(0xcf5deb58)
				body_text = qs(0xb2cfe090)
				options = [
					{
						func = destroy_dialog_box
						func_params = {dont_remove_helpers}
						text = qs(0x0e41fe46)
					}
				]
				dlog_event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
				]
				on_destroy_script = LaunchEvent
				on_destroy_script_params = {Type = focus target = <resolved_id>}
			}
		endif
	else
		ScriptAssert \{'Tried to send a song when the sharing list hasnt even been created!'}
	endif
endscript

script freestyle_replay_refresh_outbox 
	freestyle_share_list_tree :GetTags \{friend_count}
	freestylepopulatescriptfriendlist
	if (<friend_count> > 0)
		freestyle_share_list_tree :desc_resolvealias \{Name = alias_menu}
		GetScreenElementChildren id = <resolved_id>
		printstruct <children>
		counter = 0
		current_outbox_index = 0
		begin
		current_friend_id = (<children> [<counter>])
		<current_friend_id> :GetTags toggle friend_index
		formatText checksumName = textbox 'alias_friend_%d' d = <current_outbox_index>
		freestyle_share_list_tree :desc_resolvealias Name = <textbox>
		if (<toggle> = On)
			printf 'Friend %d is on' d = <counter>
			<resolved_id> :se_setprops {
				text = (<friendarray> [<friend_index>].Name)
			}
			current_outbox_index = (<current_outbox_index> + 1)
			printf 'currentoutboxindex: %d' d = <current_outbox_index>
		endif
		counter = (<counter> + 1)
		repeat <friend_count>
		if (<current_outbox_index> < 8)
			counter = <current_outbox_index>
			begin
			formatText checksumName = textbox 'alias_friend_%d' d = <current_outbox_index>
			freestyle_share_list_tree :desc_resolvealias Name = <textbox>
			<resolved_id> :se_setprops {
				text = qs(0x03ac90f0)
			}
			counter = (<counter> + 1)
			repeat (8 - <current_outbox_index>)
		endif
	endif
endscript

script freestyle_delete_song 
	RequireParams \{[
			index
		]
		all}
	if NOT ScreenElementExists \{id = dialog_box_desc_id}
		freestyle_replay_popup_hide
		freestyle_replay_song_popup :desc_resolvealias \{Name = alias_freestyle_replay_popup_menu}
		LaunchEvent Type = unfocus target = <resolved_id>
		create_dialog_box {
			use_all_controllers
			heading_text = qs(0xaa163738)
			body_text = qs(0x7c81e23f)
			options = [
				{
					func = freestyle_song_library_popup_close
					func_params = {dont_remove_helpers}
					text = qs(0xf7723015)
				}
				{
					func = freestyle_delete_song
					func_params = {index = <index>}
					text = qs(0x271a1633)
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
		destroy_dialog_box
		freestyledeletesongslot songslot = <index>
		ui_memcard_save_freestyle_replace \{event = menu_replace
			state = uistate_freestyle_replay}
	endif
endscript

script ui_destroy_freestyle_replay 
	if ScreenElementExists \{id = freestyle_replay_song_popup}
		DestroyScreenElement \{id = freestyle_replay_song_popup}
	endif
	DestroyScreenElement \{id = freestyle_replay_tree}
	generic_ui_destroy
endscript

script freestyle_handle_timeout 
	RequireParams \{[
			current_menu
		]
		all}
	freestyleiswc24working
	Change freestyle_wc24_errorcode = <ErrorCode>
	Change freestyle_wc24_errorchecksum = <errorchecksum>
	printf '[ui_freestyle_replay.q: freestyle_handle_timeout] error code = %d' d = <ErrorCode>
	printf '[ui_freestyle_replay.q: freestyle_handle_timeout] error checksum = %d' d = <errorchecksum>
	if (($freestyle_wc24_errorcode) > 0)
		if (($freestyle_wc24_errorcode) < 100000)
			formatText TextName = title qs(0x53dc76b9) s = ($freestyle_wc24_errorcode)
		else
			formatText TextName = title qs(0xded84eda) s = ($freestyle_wc24_errorcode)
		endif
		Body = ($freestyle_wc24_errorchecksum)
	else
		title = qs(0xda8119ab)
		Body = qs(0x3dc555ef)
	endif
	freestyle_replay_popup_hide
	printf '[ui_freestyle_replay.q: freestyle_handle_timeout] error message = %d' d = <Body>
	LaunchEvent Type = unfocus target = <current_menu>
	create_dialog_box {
		use_all_controllers
		heading_text = <title>
		body_text = <Body>
		options = [
			{
				func = freestyle_song_library_popup_close
				func_params = {dont_remove_helpers}
				text = qs(0x0e41fe46)
			}
		]
		dlog_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		on_destroy_script = LaunchEvent
		on_destroy_script_params = {Type = focus target = <current_menu>}
	}
	if ScreenElementExists \{id = freestyle_share_list_tree}
		DestroyScreenElement \{id = freestyle_share_list_tree}
	endif
endscript

script freestyle_replay_refresh_song_info 
	RequireParams \{[
			index
		]
		all}
	wii_format_date date_params = ($freestyle_performance_data [<index>].date)
	freestyle_replay_tree :se_setprops {
		date_created_text = <date_text>
	}
	genre_text = ($freestyle_styleset [($freestyle_performance_data [<index>].style_index)].visible_name)
	freestyle_replay_tree :se_setprops {
		song_genre_text = <genre_text>
	}
	length_ms = ($freestyle_performance_data [<index>].performance_length)
	format_time ms = <length_ms>
	freestyle_replay_tree :se_setprops {
		song_length_text = <formatted_time>
	}
	if freestylegetsendernameofsong songslot = <index>
		freestyle_replay_tree :se_setprops {
			originating_wii_text = <friendname>
		}
	else
		freestyle_replay_tree :se_setprops \{originating_wii_text = qs(0x558a0b89)}
	endif
	freestyle_replay_tree :se_setprops {
		stage_manager_name_text = ($freestyle_performance_data [<index>].stage_manager_name)
	}
	0x3b1a47ad = {}
	Player = 0
	begin
	mii_index = ($freestyle_performance_data [<index>].player_data [<Player>].mii_index)
	mii_database = ($freestyle_performance_data [<index>].player_data [<Player>].mii_database)
	auto_play_enabled = ($freestyle_performance_data [<index>].player_data [<Player>].auto_play_enabled)
	player_type = ($freestyle_performance_data [<index>].player_data [<Player>].original_player_type)
	instrument = ($freestyle_performance_data [<index>].player_data [<Player>].instrument)
	0xa10cd104 {
		mii_index = <mii_index>
		mii_database = <mii_database>
		auto_play_enabled = <auto_play_enabled>
		player_type = <player_type>
		instrument = <instrument>
	}
	formatText checksumName = 0x58dc16ef 'mii_name_%p_text' p = <Player>
	setstructureparam struct_name = 0x3b1a47ad param = <0x58dc16ef> value = <player_name>
	formatText checksumName = container 'alias_mii_face_container_%d' d = <Player>
	freestyle_replay_tree :desc_resolvealias Name = <container>
	formatText checksumName = mii_id 'mii_face_%d' d = <Player>
	if ScreenElementExists id = <mii_id>
		DestroyScreenElement id = <mii_id>
	endif
	if NOT ((<player_type> = ai) && (<auto_play_enabled> = FALSE))
		CreateScreenElement {
			Type = miiiconelement
			parent = <resolved_id>
			just = [center center]
			id = <mii_id>
			Pos = (64.0, 64.0)
			z_priority = 13
			mii_expression = Normal
			mii_bgcolor = $freestyle_mii_on_bg
			mii_dims = (128.0, 128.0)
			mii_index = <mii_index>
			mii_database = <mii_database>
			alpha = 1
		}
	endif
	<Player> = (<Player> + 1)
	repeat $freestyle_max_players
	freestyle_replay_tree :se_setprops <0x3b1a47ad>
endscript

script freestyle_song_library_popup_close 
	freestyle_replay_popup_unhide
	destroy_dialog_box <...>
endscript
