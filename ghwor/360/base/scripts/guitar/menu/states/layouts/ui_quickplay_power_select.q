g_quickplay_num_powers_allowed = 2

script ui_create_quickplay_power_select \{device_num = !i1768515945
		song_name = !q1768515945
		challenge_name = !q1768515945
		instrument = !q1768515945
		friend_scores = [
		]
		target_index = -1
		has_friend_scores = 0
		previous_screen_id = !q1768515945}
	uistack_createboundscreenelement {
		parent = root_window
		id = qp_power_selection_id
		Type = descinterface
		desc = 'power_selection'
		z_priority = 200.0
		tags = {
			state = choosing
			powers_enabled = []
			song_name = <song_name>
			challenge_name = <challenge_name>
			instrument = <instrument>
			friend_scores = <friend_scores>
			target_index = <target_index>
			has_friend_scores = <has_friend_scores>
		}
		event_handlers = [
			{pad_choose ui_sfx params = {menustate = Generic uitype = complete}}
			{pad_choose qp_power_selection_continue}
			{pad_L1 qp_power_selection_reset}
			{pad_back qp_power_selection_back params = {previous_screen_id = <previous_screen_id>}}
			{pad_back ui_sfx params = {menustate = Generic uitype = back}}
		]
		exclusive_device = <device_num>
	}
	if qp_power_selection_id :desc_resolvealias \{Name = alias_power_select_menu
			param = power_select_menu}
		<power_select_menu> :se_setprops {
			event_handlers = [
				{menu_selection_changed ui_sfx params = {menustate = Generic uitype = scrollup}}
				{pad_back qp_power_selection_back params = {previous_screen_id = <previous_screen_id>}}
				{pad_back ui_sfx params = {menustate = Generic uitype = back}}
				{pad_L1 qp_power_selection_reset}
			]
		}
		<chapter_globals> = [
			quest_chapter_johnny
			quest_chapter_newfemale
			quest_chapter_judy
			quest_chapter_newmale
			quest_chapter_pandora
			quest_chapter_lars
			quest_chapter_casey
			quest_chapter_axel
		]
		if GetScreenElementChildren id = <power_select_menu>
			GetArraySize \{children
				param = children_size}
			if (<children_size> > 0)
				<child_idx> = 0
				begin
				<chapter_global> = (<chapter_globals> [<child_idx>])
				<power_global> = ($<chapter_global>.hero_info)
				<power_text> = ($<power_global>.character_power)
				<power_text2> = ($<power_global>.character_power2)
				getsavegamefromcontroller controller = <device_num>
				chapter_global = (<chapter_globals> [<child_idx>])
				GetGlobalTags (($<chapter_global>).power_tag) savegame = <savegame>
				<fx_normal_alpha> = 0
				<fx_special_alpha> = 0
				<level_blend_mode> = blend
				<power_blend_mode> = blend
				<level> = 0
				<focus_rgba> = gh6_red
				<unfocus_rgba> = ntscwhite
				<item_state> = unselected
				if (<power_level> > 0)
					<level_blend_mode> = add
					<power_blend_mode> = add
					if (<power_level> = 2)
						<level> = 2
						<level_text> = qs(0x0d672bda)
						<fx_special_alpha> = 1
						<power_name_text> = <power_text2>
					else
						<level> = 1
						<level_text> = qs(0x264a7819)
						<fx_normal_alpha> = 1
						<power_name_text> = <power_text>
					endif
					formatText checksumName = power_desc_text 'qp_power_desc%s' s = <level>
					<power_desc_text> = ($<power_global>.<power_desc_text>)
				else
					<unfocus_rgba> = [97 88 70 255]
					<item_state> = locked
					<focus_rgba> = gh6_red_dk
					<level_text> = qs(0x92bc2104)
					<power_name_text> = qs(0x24a08263)
					<power_desc_text> = qs(0xced0fd2e)
				endif
				(<children> [<child_idx>]) :desc_applyscene Name = unselected time = 0
				(<children> [<child_idx>]) :se_setprops {
					event_handlers = [
						{focus qp_power_selection_item_focus params = {rgba = <focus_rgba> objID = (<children> [<child_idx>])}}
						{unfocus qp_power_selection_item_unfocus params = {rgba = <unfocus_rgba> objID = (<children> [<child_idx>])}}
						{pad_choose qp_power_selection_add_power params = {power_global = <power_global> level = <level>}}
						{pad_choose ui_sfx params = {menustate = setlist uitype = addtoplaylist}}
					]
					power_name_text = <power_name_text>
					level_text = <level_text>
					power_name_rgba = <unfocus_rgba>
					level_rgba = <unfocus_rgba>
					fx_special_alpha = <fx_special_alpha>
					fx_normal_alpha = <fx_normal_alpha>
					power_name_blend_mode = <power_blend_mode>
					level_blend_mode = <level_blend_mode>
					power_description_text = <power_desc_text>
					tags = {
						added_alpha = 1.0
						power_name_text = <power_name_text>
						level_text = <level_text>
						power_name_rgba = <unfocus_rgba>
						level_rgba = <unfocus_rgba>
						fx_special_alpha = <fx_special_alpha>
						fx_normal_alpha = <fx_normal_alpha>
						power_name_blend_mode = <power_blend_mode>
						level_blend_mode = <level_blend_mode>
						state = <item_state>
						power_description_text = <power_desc_text>
					}
				}
				<child_idx> = (<child_idx> + 1)
				repeat <children_size>
			endif
		endif
		qp_power_selection_setup_helpers
		AssignAlias id = <power_select_menu> alias = qp_power_select_id
	endif
endscript

script ui_destroy_quickplay_power_select 
endscript

script ui_return_quickplay_power_select 
endscript

script qp_power_selection_setup_helpers \{item_state = unselected}
	if ScreenElementExists \{id = qp_power_selection_id}
		if qp_power_selection_id :obj_getchecksumtag \{tag_name = state
				assert = 0}
			<state> = <checksum_value>
			clean_up_user_control_helpers
			if (<state> = choosing)
				if (<item_state> = unselected)
					add_user_control_helper \{text = qs(0x39ac65eb)
						button = green
						z = 100000}
				endif
			else
				add_user_control_helper \{text = qs(0xb08d7c29)
					button = green
					z = 100000}
			endif
			add_user_control_helper \{text = qs(0xaf4d5dd2)
				button = red
				z = 100000}
			if qp_power_selection_id :GetSingleTag \{powers_enabled}
				GetArraySize \{powers_enabled}
				if (<array_Size> > 0)
					add_user_control_helper \{text = qs(0x0bb7ad85)
						button = orange
						z = 100000}
				endif
			endif
		endif
	endif
endscript

script qp_power_selection_back \{previous_screen_id = !q1768515945}
	if ScreenElementExists id = <previous_screen_id>
		<previous_screen_id> :se_setprops unblock_events
	endif
	generic_event_back
endscript

script qp_power_selection_continue 
	printf \{qs(0xef3b4d82)}
	if ScreenElementExists \{id = qp_power_selection_id}
		if qp_power_selection_id :GetTags
			gman_setdata goal = quickplay params = {powers_enabled = <powers_enabled>}
			Change g_songlist_targeted_song = <song_name>
			quickplay_reset_target_data
			if (<has_friend_scores> = 1)
				quickplay_save_specific_friend_stat friend_scores = <friend_scores> target_index = <target_index>
			endif
			quickplay_start_targeted_challenge song_name = <song_name> challenge_name = <challenge_name> instrument = <instrument>
		endif
	endif
endscript

script qp_power_selection_add_power \{power_global = !q1768515945
		level = !i1768515945}
	printf \{qs(0xa293dd4f)}
	if ScreenElementExists \{id = qp_power_selection_id}
		if (<level> > 0)
			if qp_power_selection_id :GetSingleTag \{powers_enabled}
				AddArrayElement array = <powers_enabled> element = {power_info = <power_global> level = <level>}
				qp_power_selection_id :obj_setmultipletags tags = {powers_enabled = <array>}
				obj_setchecksumtag \{tag_name = state
					checksum_value = added}
				desc_applyscene \{Name = added
					time = 0}
				GetTags
				se_setprops {
					added_alpha = 1.0
					power_name_text = <power_name_text>
					level_text = <level_text>
					power_name_rgba = <power_name_rgba>
					level_rgba = <level_rgba>
					fx_special_alpha = <fx_special_alpha>
					fx_normal_alpha = <fx_normal_alpha>
					power_name_blend_mode = <power_name_blend_mode>
					level_blend_mode = <level_blend_mode>
					block_events
					not_focusable
				}
				GetArraySize \{array}
				if (<array_Size> >= ($g_quickplay_num_powers_allowed))
					LaunchEvent \{Type = unfocus
						target = qp_power_select_id}
					qp_power_select_id :se_setprops \{block_events}
					LaunchEvent \{Type = focus
						target = qp_power_selection_id}
					qp_power_selection_id :obj_setchecksumtag \{tag_name = state
						checksum_value = ready}
					qp_power_selection_id :se_setprops \{remaining_text = qs(0xa94137c4)
						power_description_text = qs(0xe742f92d)}
					qp_power_selection_setup_helpers
				else
					LaunchEvent \{Type = unfocus
						target = qp_power_select_id}
					LaunchEvent \{Type = focus
						target = qp_power_select_id}
					qp_power_selection_id :se_setprops \{remaining_text = qs(0xdedfe534)}
				endif
			endif
		endif
	endif
endscript

script qp_power_selection_reset 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	if ScreenElementExists \{id = qp_power_selection_id}
		if qp_power_selection_id :GetSingleTag \{powers_enabled}
			GetArraySize \{powers_enabled}
			if (<array_Size> > 0)
				ui_sfx \{menustate = setlist
					uitype = remove}
				ui_event_wait \{event = menu_refresh
					data = {
						no_anim_in = 1
					}}
			endif
		endif
	endif
endscript

script qp_power_selection_item_focus \{objID = !q1768515945}
	if <objID> :obj_getchecksumtag tag_name = state assert = 0
		printf qs(0x178feb30) s = <checksum_value>
		if (<checksum_value> != added)
			printf \{qs(0xabbf550e)}
			desc_applyscene \{Name = selected
				time = 0}
			GetTags
			se_setprops {
				power_name_text = <power_name_text>
				level_text = <level_text>
				power_name_rgba = <power_name_rgba>
				level_rgba = <level_rgba>
				fx_special_alpha = <fx_special_alpha>
				fx_normal_alpha = <fx_normal_alpha>
				power_name_blend_mode = <power_name_blend_mode>
				level_blend_mode = <level_blend_mode>
				power_description_text = <power_description_text>
			}
			qp_power_selection_id :se_setprops power_description_text = <power_description_text>
		endif
		qp_power_selection_setup_helpers item_state = <checksum_value>
	endif
endscript

script qp_power_selection_item_unfocus \{objID = !q1768515945}
	if <objID> :obj_getchecksumtag tag_name = state assert = 0
		printf qs(0xb0698e44) s = <checksum_value>
		if (<checksum_value> != added)
			desc_applyscene \{Name = unselected
				time = 0}
			GetTags
			se_setprops {
				power_name_text = <power_name_text>
				level_text = <level_text>
				power_name_rgba = <power_name_rgba>
				level_rgba = <level_rgba>
				fx_special_alpha = <fx_special_alpha>
				fx_normal_alpha = <fx_normal_alpha>
				power_name_blend_mode = <power_name_blend_mode>
				level_blend_mode = <level_blend_mode>
				power_description_text = <power_description_text>
			}
		endif
		qp_power_selection_setup_helpers item_state = <checksum_value>
	endif
endscript
