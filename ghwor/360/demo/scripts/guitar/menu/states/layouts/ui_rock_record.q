
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
				getplayerinfo <player> controller
				if NOT checkforsignin network_platform_only dont_set_primary controller_index = <controller>
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
		if gotparam \{play_ui_sfx}
			ui_sfx \{menustate = generic
				uitype = select}
		endif
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

script ui_create_rock_record 
	requireparams \{[
			net_id
		]
		all}
	change \{rich_presence_context = presence_rock_record}
	change lb_controller = <device_num>
	if NOT gotparam \{pad_back_id}
		pad_back_id = null
	endif
	if isxenonorwindx
		event_handlers = [
			{pad_up rock_record_scroll params = {direction = up}}
			{pad_down rock_record_scroll params = {direction = down}}
			{pad_back ui_sfx params = {menustate = leaderboard uitype = back}}
			{pad_back generic_event_back params = {}}
			{pad_option2 rock_record_show_gamercard params = {net_id = <net_id>}}
		]
	else
		event_handlers = [
			{pad_up rock_record_scroll params = {direction = up}}
			{pad_down rock_record_scroll params = {direction = down}}
			{pad_back ui_sfx params = {menustate = leaderboard uitype = back}}
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
		z_priority = 800.0
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
	if rockrecordinterface :desc_resolvealias \{name = alias_generic_scrollbar_wgt
			param = scrollbar_id}
		assignalias id = <scrollbar_id> alias = rock_record_scrollbar_wgt
		generic_scrollbar_wgt_initialize \{id = rock_record_scrollbar_wgt}
	endif
	launchevent \{type = focus
		target = rockrecordinterface}
	if ($debug_rock_record = 1)
		spawnscriptnow \{rock_record_prototype_layout}
	else
		rockrecordinterface :obj_spawnscriptlater rock_record_wait_for_lobby_spawned params = {net_id = <net_id> device_num = <device_num> from_lobby = <from_lobby>}
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
	begin
	ui_leaderboard_reinit
	if (<net_id> [0] = 0 && <net_id> [1] = 0)
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
	repeat 30
	request_rock_record callback = ui_rock_record_callback net_id = <net_id>
endscript

script request_rock_record \{net_id = !a1768515945
		callback = !q1768515945
		leaderboard_id = lb_rock_record_2}
	array = []
	addarrayelement array = <array> element = <net_id>
	readleaderboardbyuidlist callback = <callback> leaderboard_id = <leaderboard_id> user_id_list = <array>
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
		<spinner_id> :obj_spawnscriptnow instrument_spinner_ui_icon_anim
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
	if screenelementexists \{id = rockrecordinterface}
		<array_size> = 0
		if gotparam \{rows}
			getarraysize <rows>
		endif
		if ((<status> != failed && <array_size> > 0) || (<leaderboard_id> = lb_rock_record))
			if NOT rockrecordinterface :getsingletag \{my_rock_record}
				if (<leaderboard_id> = lb_rock_record_2)
					rockrecordinterface :obj_setmultipletags tags = {my_rock_record = (<rows> [0])}
					request_rock_record net_id = ((<rows> [0]).player_id) callback = ui_rock_record_callback leaderboard_id = lb_rock_record
				endif
			else
				rockrecordinterface :obj_spawnscriptnow \{hide_rock_record_spinner}
				player_name = (<my_rock_record>.gamer_tag)
				rockrecordinterface :se_setprops {
					gamertag_text = <player_name>
				}
				if (<array_size> > 0)
					combine_rock_records my_rock_record = <my_rock_record> leaderboard_data = (<rows> [0])
				endif
				parse_main_stats leaderboard_data = <my_rock_record>
			endif
		else
			<text> = qs(0xfab51260)
			if NOT netsessionfunc \{func = is_lobby_available}
				<text> = qs(0xde51e7f4)
			endif
			if NOT checkforsignin network_platform_only controller_index = ($lb_controller)
				if isxenonorwindx
					<text> = ($leaderboard_error_text_xenon.notsignedin)
				else
					<text> = ($leaderboard_error_text_ps3.notsignedin)
				endif
			endif
			if netsessionfunc \{func = iscableunplugged}
				<text> = qs(0x0df6659c)
			endif
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
				body_text = <text>
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
		getarraysize \{value_data
			param = data_size}
		if (<data_size> > 0)
			if structurecontains structure = ($rock_record_main_stats [<index>]) more_data
				<more_data_values> = []
				<more_data> = ($rock_record_main_stats [<index>].more_data)
				getarraysize \{more_data
					param = more_data_size}
				i = 0
				begin
				getarraysize (<more_data> [<i>])
				<more_data_array> = []
				<j> = 0
				begin
				if structurecontains structure = <leaderboard_data> ((<more_data> [<i>]) [<j>])
					addarrayelement array = <more_data_array> element = (<leaderboard_data>.((<more_data> [<i>]) [<j>]))
					<more_data_array> = <array>
				endif
				<j> = (<j> + 1)
				repeat <array_size>
				addarrayelement array = <more_data_values> element = <more_data_array>
				<more_data_values> = <array>
				<i> = (<i> + 1)
				repeat <more_data_size>
			endif
			if structurecontains structure = (($rock_record_main_stats) [<index>]) format_data
				<format_data> = (($rock_record_main_stats) [<index>].format_data)
			endif
			(($rock_record_main_stats) [<index>].format_script) data = <value_data> more_data = <more_data_values> <format_data>
			add_stat_to_main_page text = ($rock_record_main_stats [<index>].text) data_text = <data_text> value = <stat_value>
			removeparameter \{data_text}
			removeparameter \{stat_value}
		endif
		<index> = (<index> + 1)
		repeat <main_stats_size>
		if rockrecordinterface :getsingletag \{num_rows}
			if rockrecordinterface :getsingletag \{max_rows_on_screen}
				<resolution> = (<num_rows> - <max_rows_on_screen> + 1)
				if (<resolution> < 0)
					<resolution> = 0
				endif
				generic_scrollbar_wgt_set_resolution id = rock_record_scrollbar_wgt num_elements = <resolution>
			endif
		endif
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
	if checkforsignin controller_index = <device_num> network_platform_only
		if (<net_id> [0] = 0 && <net_id> [1] = 0)
			getnetid controller_index = <device_num>
			setarrayelement arrayname = net_id index = 0 newvalue = <net_id_first>
			setarrayelement arrayname = net_id index = 1 newvalue = <net_id_second>
		endif
		netsessionfunc func = showgamercard params = {player_xuid = <net_id> controller_index = <device_num>}
	else
		if NOT checkforsignin network_platform_only controller_index = ($lb_controller)
			<text> = ($leaderboard_error_text_xenon.notsignedin)
		endif
		if netsessionfunc \{func = iscableunplugged}
			<text> = qs(0x0df6659c)
		endif
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
			body_text = <text>
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
						generic_scrollbar_wgt_update_thumb_pos id = rock_record_scrollbar_wgt dir = <direction>
						ui_sfx \{menustate = leaderboard
							uitype = scrollup}
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
						generic_scrollbar_wgt_update_thumb_pos id = rock_record_scrollbar_wgt dir = <direction>
						ui_sfx \{menustate = leaderboard
							uitype = scrolldown}
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
			slider_nub_cont_pos = ((0.0, 32.0) + ((0.0, 1.0) * (240.0 * <ratio>)))
		}
	endif
endscript

script add_stat_to_main_page \{text = qs(0xa21050da)
		value = 666}
	if rockrecordinterface :desc_resolvealias \{name = alias_stats_menu
			param = stats_menu}
		if NOT gotparam \{data_text}
			formattext textname = data_text qs(0x48c6d14c) d = <value> usecommas
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

script combine_rock_records \{my_rock_record = 0x69696969
		leaderboard_data = {
			longest_notestreak = 0
			num_songs_completed = 0
			total_stars = 0
			notes_hit = 0
			total_song_multiplier = 0.0
			num_additions_to_total_song_multiplier = 0.0
			total_time_playing_in_seconds = 0
			num_coop_games_played = 0
			num_versus_games_played = 0
		}}
	if (<my_rock_record>.longest_notestreak < <leaderboard_data>.longest_notestreak)
		addparam structure_name = my_rock_record name = lifetime_longest_notestreak value = (<leaderboard_data>.longest_notestreak)
	else
		addparam structure_name = my_rock_record name = lifetime_longest_notestreak value = (<my_rock_record>.longest_notestreak)
	endif
	<num_songs_completed> = (<leaderboard_data>.num_songs_completed + <my_rock_record>.num_songs_completed)
	addparam structure_name = my_rock_record name = lifetime_num_songs_completed value = <num_songs_completed>
	<total_stars> = (<leaderboard_data>.total_stars + <my_rock_record>.total_stars)
	addparam structure_name = my_rock_record name = lifetime_total_stars value = <total_stars>
	<notes_hit> = (<leaderboard_data>.notes_hit + <my_rock_record>.notes_hit)
	addparam structure_name = my_rock_record name = lifetime_notes_hit value = <notes_hit>
	<total_song_multiplier> = (<leaderboard_data>.total_song_multiplier + <my_rock_record>.total_song_multiplier)
	addparam structure_name = my_rock_record name = lifetime_total_song_multiplier value = <total_song_multiplier>
	<num_additions_to_total_song_multiplier> = (<leaderboard_data>.num_additions_to_total_song_multiplier + <my_rock_record>.num_additions_to_total_song_multiplier)
	addparam structure_name = my_rock_record name = lifetime_num_additions_to_total_song_multiplier value = <num_additions_to_total_song_multiplier>
	<total_time_playing_in_seconds> = (<leaderboard_data>.total_time_playing_in_seconds + <my_rock_record>.total_time_playing_in_seconds)
	addparam structure_name = my_rock_record name = lifetime_total_time_playing_in_seconds value = <total_time_playing_in_seconds>
	<num_coop_games_played> = (<leaderboard_data>.num_coop_games_played + <my_rock_record>.num_coop_games_played)
	addparam structure_name = my_rock_record name = lifetime_num_coop_games_played value = <num_coop_games_played>
	<num_versus_games_played> = (<leaderboard_data>.num_versus_games_played + <my_rock_record>.num_versus_games_played)
	addparam structure_name = my_rock_record name = lifetime_num_versus_games_played value = <num_versus_games_played>
	return my_rock_record = <my_rock_record>
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
