0x71cfb2f8 = 0

script net_custom_guide_rock_record 
	requireparams \{[
			net_id
			controller
		]
		all}
	display_rock_record net_id = <net_id> device_num = <controller>
endscript

script display_rock_record 
	printf \{qs(0x84e4e014)}
	if NOT screenelementexists \{id = rockrecordinterface}
		if gotparam \{from_lobby}
			if isxenonorwindx
				get_local_player_num_from_controller controller_index = <device_num>
				player = <local_player_num>
				if NOT checkforsignin network_platform_only dont_set_primary controller_index = <device_num>
					if band_lobby_desc_id :desc_resolvealias \{name = alias_pu_cont_parent}
						band_lobby_create_popup_menu {
							menu = change_profile
							player = <player>
							container = <resolved_id>
							msg_checksum = not_connted_to_live
						}
					endif
					return
				endif
			endif
		endif
		ui_event_wait_for_safe
		if gotparam \{unfocus_id}
			printf qs(0x203ceafd) d = <unfocus_id>
			launchevent type = unfocus target = <unfocus_id>
		endif
		if gotparam \{band_lobby_no_anim_in}
			change \{g_suppress_anim_in = 1}
		endif
		if gotparam \{parent}
			generic_event_choose state = uistate_rock_record data = {is_popup net_id = <net_id> device_num = <device_num> parent = <parent> pad_back_id = <unfocus_id> from_lobby = <from_lobby>}
		else
			generic_event_choose state = uistate_rock_record data = {is_popup net_id = <net_id> device_num = <device_num> parent = root_window pad_back_id = <unfocus_id> from_lobby = <from_lobby>}
		endif
	endif
endscript

script ui_init_rock_record 
	change \{respond_to_signin_changed = 1}
endscript

script ui_create_rock_record \{0x4b898b36 = none}
	requireparams \{[
			net_id
		]
		all}
	change lb_controller = <device_num>
	if NOT gotparam \{pad_back_id}
		pad_back_id = null
	endif
	if isxenonorwindx
		event_handlers = [
			{pad_up rock_record_scroll params = {direction = up}}
			{pad_down rock_record_scroll params = {direction = down}}
			{pad_back generic_event_back params = {}}
			{pad_option2 rock_record_show_gamercard params = {net_id = <net_id>}}
		]
	else
		event_handlers = [
			{pad_up rock_record_scroll params = {direction = up}}
			{pad_down rock_record_scroll params = {direction = down}}
			{pad_back generic_event_back params = {}}
		]
	endif
	if NOT gotparam \{parent}
		parent = root_window
	endif
	createscreenelement {
		parent = <parent>
		id = rockrecordinterface
		type = descinterface
		desc = 'player_records'
		pos = (0.0, 0.0)
		z_priority = 150.0
		slider_cont_alpha = 0
		tags = {
			net_id = <net_id>
			pad_back_id = <pad_back_id>
			max_rows_on_screen = 8
			num_rows = 0
			row_height = -1
			current_row_index = 0
			spacing_between_rows = 0
			destroy_dialog = 0
		}
		exclusive_device = <device_num>
		event_handlers = <event_handlers>
	}
	if rockrecordinterface :desc_resolvealias \{name = alias_stats_menu}
		<resolved_id> :se_getprops
		rockrecordinterface :settags spacing_between_rows = <spacing_between>
	endif
	if rockrecordinterface :desc_resolvealias \{name = alias_diamondbling
			param = diamondbling_id}
		<diamondbling_id> :obj_spawnscript 0xb65954f1 params = {minwidth = 35 maxwidth = 250 maxtime = 0.5}
	else
		scriptassert \{'UI_art'}
	endif
	if rockrecordinterface :desc_resolvealias \{name = alias_diamondbling2
			param = diamondbling2_id}
		<diamondbling2_id> :obj_spawnscript 0xb65954f1 params = {minwidth = 35 maxwidth = 250 maxtime = 0.5}
	else
		scriptassert \{'UI_art'}
	endif
	if rockrecordinterface :desc_resolvealias \{name = alias_bkg_anim
			param = 0xda1265c9}
		<0xda1265c9> :obj_spawnscript ui_alphablast
	else
		scriptassert \{'UI_art'}
	endif
	if rockrecordinterface :desc_resolvealias \{name = 0x1a900735}
		<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 1 start_dims = (10.0, 10.0)}
	else
		scriptassert \{'UI_art'}
	endif
	if rockrecordinterface :desc_resolvealias \{name = 0x8399568f}
		<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 1 0x3af134dc = 1 start_dims = (10.0, 10.0)}
	else
		scriptassert \{'UI_art'}
	endif
	if rockrecordinterface :desc_resolvealias \{name = 0xf49e6619}
		<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 0.5 0x3af134dc = 1 start_dims = (10.0, 10.0)}
	else
		scriptassert \{'UI_art'}
	endif
	if rockrecordinterface :desc_resolvealias \{name = 0x6afaf3ba}
		<resolved_id> :obj_spawnscript 0xa323fa10 params = {0x971c66e7 = 0.5 0x3af134dc = 1 start_dims = (10.0, 10.0)}
	else
		scriptassert \{'UI_art'}
	endif
	launchevent \{type = focus
		target = rockrecordinterface}
	if ($debug_rock_record = 1)
		spawnscriptnow \{rock_record_prototype_layout}
	else
		rockrecordinterface :obj_spawnscriptlater rock_record_wait_for_lobby_spawned params = {net_id = <net_id> device_num = <device_num> from_lobby = <from_lobby> 0x4b898b36 = <0x4b898b36>}
	endif
	rockrecordinterface :obj_spawnscriptnow \{load_rock_record}
	clean_up_user_control_helpers
	add_gamertag_helper exclusive_device = <device_num>
	add_user_control_helper controller = <device_num> text = qs(0xaf4d5dd2) button = red z = 100000
	if isxenonorwindx
		add_user_control_helper \{text = qs(0xfcc51f45)
			button = yellow
			z = 100000}
	endif
endscript

script rock_record_wait_for_lobby_spawned 
	if NOT checkforsignin network_platform_only controller_index = <device_num>
		if NOT gotparam \{from_lobby}
			ui_event_wait event = menu_replace data = {state = uistate_signin device_num = <device_num> require_live = 1 new_state = uistate_rock_record allow_back = 1 new_data = {device_num = <device_num> net_id = <net_id>}}
		else
			ui_event_wait \{event = menu_back}
		endif
		return
	endif
	change \{0x71cfb2f8 = 0}
	begin
	ui_leaderboard_reinit
	if (<0x4b898b36> = me)
		getnetid controller_index = (<device_num>)
		array = [0 0]
		setarrayelement arrayname = array index = 0 newvalue = <net_id_first>
		setarrayelement arrayname = array index = 1 newvalue = <net_id_second>
		net_id = <array>
	endif
	if netsessionfunc \{func = is_leaderboard_lobby_available}
		break
	endif
	wait \{1
		second}
	repeat 60
	if NOT ui_leaderboard_check_online_status
		return
	endif
	request_rock_record callback = ui_rock_record_callback net_id = <net_id>
endscript

script request_rock_record 
	requireparams \{[
			callback
			net_id
		]
		all}
	array = []
	addarrayelement array = <array> element = <net_id>
	readleaderboardbyuidlist callback = <callback> leaderboard_id = lb_rock_record user_id_list = <array>
endscript

script ui_destroy_rock_record 
	if screenelementexists \{id = rockrecordinterface}
		rockrecordinterface :getsingletag \{pad_back_id}
		rock_record_pad_back pad_back_id = <pad_back_id>
		destroyscreenelement \{id = rockrecordinterface}
	endif
endscript

script load_rock_record 
	printf \{qs(0x72302261)}
	obj_getid
	if <objid> :desc_resolvealias name = alias_instrument_spinner param = spinner_id
		printf \{qs(0xa1bddbad)}
		<spinner_id> :se_setprops alpha = 1.0
		<spinner_id> :obj_spawnscriptnow savegame_ui_icon_anim
	endif
endscript

script hide_rock_record_spinner 
	if screenelementexists \{id = rockrecordinterface}
		if rockrecordinterface :desc_resolvealias \{name = alias_instrument_spinner
				param = spinner_id}
			<spinner_id> :se_setprops alpha = 0.0 time = 0.5
			<spinner_id> :se_waitprops
			killspawnedscript \{name = load_rock_record}
		endif
	endif
endscript

script ui_rock_record_callback 
	printf \{qs(0xdc607297)}
	if (<status> = succeeded)
		if (<total_size> = 0)
			if ($0x71cfb2f8 = 0)
				getnetid controller_index = ($lb_controller)
				array = [0 0]
				setarrayelement arrayname = array index = 0 newvalue = <net_id_first>
				setarrayelement arrayname = array index = 1 newvalue = <net_id_second>
				net_id = <array>
				change 0x71cfb2f8 = ($0x71cfb2f8 + 1)
				request_rock_record callback = ui_rock_record_callback net_id = <net_id>
				return
			else
				if NOT gotparam \{reason}
					change \{leaderboardsearchvalue = me}
					reason = no_results
				endif
			endif
		endif
	endif
	if screenelementexists \{id = rockrecordinterface}
		<array_size> = 0
		if gotparam \{rows}
			getarraysize <rows>
		endif
		if (<status> != failed && <array_size> > 0)
			rockrecordinterface :obj_spawnscriptnow \{hide_rock_record_spinner}
			if (<array_size> > 0)
				player_name = (<rows> [0].gamer_tag)
			else
				player_name = qs(0x00000000)
			endif
			rockrecordinterface :se_setprops {
				gamertag_text = <player_name>
			}
			parse_main_stats leaderboard_data = (<rows> [0])
		else
			if screenelementexists \{id = dialog_box_container}
				return
			endif
			ui_leaderboard_get_error_text reason = <reason>
			launchevent \{type = unfocus
				target = rockrecordinterface}
			rockrecordinterface :getsingletag \{pad_back_id}
			if NOT gotparam \{pad_back_id}
				<pad_back_id> = null
			endif
			rockrecordinterface :settags \{destroy_dialog = 1}
			create_dialog_box {
				exclusive_device = ($lb_controller)
				heading_text = qs(0xaa163738)
				body_text = <error_text>
				options = [
					{
						func = generic_event_back
						text = qs(0x182f0173)
						sound_func = nullscript
					}
				]
				dlg_z_priority = 50000
			}
		endif
	endif
endscript

script parse_main_stats 
	printf \{qs(0x5e788aa3)}
	requireparams \{[
			leaderboard_data
		]
		all}
	getarraysize ($rock_record_main_stats)
	main_stats_size = <array_size>
	if (<main_stats_size> > 0)
		index = 0
		begin
		columns = ($rock_record_main_stats [<index>].columns)
		getarraysize <columns>
		value_data = []
		i = 0
		begin
		if structurecontains structure = <leaderboard_data> (<columns> [<i>])
			addarrayelement array = <value_data> element = (<leaderboard_data>.(<columns> [<i>]))
			<value_data> = <array>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		(($rock_record_main_stats) [<index>].format_script) data = <value_data>
		add_stat_to_main_page text = ($rock_record_main_stats [<index>].text) data_text = <data_text> value = <stat_value>
		removeparameter \{data_text}
		removeparameter \{stat_value}
		<index> = (<index> + 1)
		repeat <main_stats_size>
	endif
	if rockrecordinterface :desc_resolvealias \{name = alias_stats_menu
			param = stats_menu}
		launchevent type = focus target = <stats_menu>
	endif
endscript

script rock_record_pad_back 
	if rockrecordinterface :getsingletag \{destroy_dialog}
		if (<destroy_dialog> = 1)
			destroy_dialog_box
		endif
	endif
	clean_up_user_control_helpers
	if (<pad_back_id> != null)
		if screenelementexists id = <pad_back_id>
			launchevent type = focus target = <pad_back_id>
		endif
	endif
endscript

script rock_record_show_gamercard 
	if checkforsignin controller_index = <device_num>
		if (<net_id> [0] = 0 && <net_id> [1] = 0)
			getnetid controller_index = <device_num>
			setarrayelement arrayname = net_id index = 0 newvalue = <net_id_first>
			setarrayelement arrayname = net_id index = 1 newvalue = <net_id_second>
		endif
		netsessionfunc func = showgamercard params = {player_xuid = <net_id> controller_index = <device_num>}
	endif
endscript

script rock_record_scroll 
	requireparams \{[
			direction
		]
		all}
	if screenelementexists \{id = rockrecordinterface}
		if rockrecordinterface :desc_resolvealias \{name = alias_stats_menu
				param = stats_menu_id}
			rockrecordinterface :gettags \{num_rows}
			if (<num_rows> > <max_rows_on_screen>)
				getscreenelementposition id = <stats_menu_id>
				if (<direction> = up)
					if (<current_row_index> > 0)
						generic_menu_up_or_down_sound \{up = 1}
						new_pos = (((1.0, 0.0) * (<screenelementpos> [0])) + ((0.0, 1.0) * ((<screenelementpos> [1]) + (<row_height> + <spacing_between_rows>))))
						<stats_menu_id> :setprops pos = <new_pos>
						<current_row_index> = (<current_row_index> - 1)
						rockrecordinterface :settags current_row_index = <current_row_index>
						rock_record_set_scroll_bar_pos {
							num_rows = <num_rows>
							max_rows_on_screen = <max_rows_on_screen>
							current_row_index = <current_row_index>
						}
					endif
				elseif (<direction> = down)
					if ((<current_row_index> + <max_rows_on_screen>) < <num_rows>)
						generic_menu_up_or_down_sound \{down = 1}
						new_pos = (((1.0, 0.0) * (<screenelementpos> [0])) + ((0.0, 1.0) * ((<screenelementpos> [1]) - (<row_height> + <spacing_between_rows>))))
						<stats_menu_id> :setprops pos = <new_pos>
						<current_row_index> = (<current_row_index> + 1)
						rockrecordinterface :settags current_row_index = <current_row_index>
						rock_record_set_scroll_bar_pos {
							num_rows = <num_rows>
							max_rows_on_screen = <max_rows_on_screen>
							current_row_index = <current_row_index>
						}
					endif
				else
					scriptassert \{'Invalid scrolling direction for rock record!'}
				endif
			endif
		endif
	endif
endscript

script rock_record_set_scroll_bar_pos 
	requireparams \{[
			num_rows
			max_rows_on_screen
			current_row_index
		]
		all}
	if screenelementexists \{id = rockrecordinterface}
		ratio = ((<current_row_index> * 1.0) / (<num_rows> - <max_rows_on_screen>))
		rockrecordinterface :se_setprops {
			slider_nub_cont_pos = ((0.0, -15.0) + ((0.0, 1.0) * (305.0 * <ratio>)))
			time = 0.1
		}
	endif
endscript

script add_stat_to_main_page \{text = qs(0xa21050da)
		value = 666}
	if rockrecordinterface :desc_resolvealias \{name = alias_stats_menu
			param = stats_menu}
		if NOT gotparam \{data_text}
			formattext textname = data_text qs(0x48c6d14c) d = <value>
		endif
		createscreenelement {
			type = descinterface
			parent = <stats_menu>
			desc = 'player_records_row'
			title_text = <text>
			data_text = <data_text>
			autosizedims = true
		}
		rockrecordinterface :gettags
		<num_rows> = (<num_rows> + 1)
		<id> :se_getprops
		rockrecordinterface :settags {
			num_rows = <num_rows>
			row_height = (<dims> [1])
		}
		if (<num_rows> > <max_rows_on_screen>)
			rockrecordinterface :se_setprops \{slider_cont_alpha = 1}
		endif
	endif
endscript

script rock_record_prototype_layout 
	wait \{2.0
		seconds}
	leaderboard_data = [
		{
			player_xuid = [
				590292 , 492012329
			]
			gamertag = qs(0x49ff31ae)
			data = [
				3506789
				500
				4501
				800
				2250
				750
				1125
				100000
				800
				95
				751
				8000
				250
				50
				7896
				9986
				100
				500
				650
				200
				30
				750
				87
				1125
				800
				95
				751
				100
				70
				375
				10
				50
				900
				800
				95
				751
				100
				70
				375
				10
				50
			]
		}
	]
	ui_rock_record_callback leaderboard_data = <leaderboard_data>
endscript
