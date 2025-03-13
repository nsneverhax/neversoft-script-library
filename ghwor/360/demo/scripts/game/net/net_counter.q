g_net_counter_please_write_counters = 0
g_net_counter_reading_counters = 0
g_net_counter_writing_counters = 0
g_net_counter_quick_sleep_time = 60.0
g_net_counter_long_sleep_time = 60.0
g_net_counter_debug_overlay_enabled = 0
g_net_counter_debug_overlay_refresh_time = 5
g_net_counter_overlay_text1 = qs(0x3f6c0f57)
g_net_counter_overlay_text2 = qs(0x03ac90f0)
g_net_counter_counter_name_list = [
	globalcounter_expand_friends_feed
	globalcounter_edit_band_lineup
	globalcounter_tutorial
	globalcounter_practice
	globalcounter_music_studio
	globalcounter_create_new_rocker
	globalcounter_edit_instrument
	globalcounter_edit_instrument_guitar
	globalcounter_edit_instrument_bass
	globalcounter_edit_instrument_drum
	globalcounter_edit_instrument_mic
	globalcounter_calibrate_lag
	globalcounter_facebook_broadcast
	globalcounter_twitter_broadcast
	globalcounter_audio_mixer
	globalcounter_detailed_stats
	globalcounter_leaderboard
	globalcounter_friend_feed_click
	globalcounter_friend_feed_click_ad
	globalcounter_friend_feed_click_motd
	globalcounter_friend_feed_click_friend
	globalcounter_friend_feed_click_other
	globalcounter_music_store_main
	globalcounter_music_store_songlist
	globalcounter_music_store_purchase
]

script net_counter_increment \{counter_name = !q1768515945}
	if NOT gotparam \{delta}
		delta = 1
	endif
	netsessionfunc obj = net_counters func = update_counter params = {counter_name = <counter_name> delta = <delta>}
	change \{g_net_counter_please_write_counters = 1}
	if NOT scriptisrunning \{net_counter_write_counters_loop_proc}
		spawnscriptnow \{net_counter_write_counters_loop_proc}
	endif
endscript

script net_counter_done 
	if scriptisrunning \{net_counter_write_counters_loop_proc}
		killspawnedscript \{name = net_counter_write_counters_loop_proc}
	endif
endscript

script net_counter_write_counters_loop_proc 
	begin
	if (($g_net_counter_writing_counters != 0) || ($g_net_counter_reading_counters != 0))
		if ($g_net_counter_please_write_counters != 0)
			wait ($g_net_counter_quick_sleep_time) seconds
		else
			wait ($g_net_counter_long_sleep_time) seconds
		endif
	else
		if ($g_net_counter_please_write_counters != 0)
			change \{g_net_counter_please_write_counters = 0}
			change \{g_net_counter_writing_counters = 1}
			netsessionfunc \{obj = net_counters
				func = write_counters
				params = {
					callback = net_counter_write_counters_callback
					callback_params = {
					}
				}}
			wait ($g_net_counter_long_sleep_time) seconds
		else
			wait ($g_net_counter_long_sleep_time) seconds
		endif
	endif
	repeat
endscript

script net_counter_read_counters_callback 
	change \{g_net_counter_reading_counters = 0}
	switch (<result>)
		case success
		change \{g_net_counter_overlay_text1 = qs(0x73464966)}
		net_counter_update_overlay_text2
		case failure
		change \{g_net_counter_overlay_text1 = qs(0xbf3c986b)}
		change \{g_net_counter_overlay_text2 = qs(0x03ac90f0)}
		default
		change \{g_net_counter_overlay_text1 = qs(0xbf3c986b)}
		change \{g_net_counter_overlay_text2 = qs(0x03ac90f0)}
	endswitch
endscript

script net_counter_write_counters_callback 
	change \{g_net_counter_writing_counters = 0}
endscript

script net_counter_update_overlay_text2 
	change \{g_net_counter_overlay_text2 = qs(0x03ac90f0)}
	<text2> = qs(0x03ac90f0)
	getarraysize \{$g_net_counter_counter_name_list}
	num_items = <array_size>
	if (<num_items> > 0)
		index = 0
		num_items_to_do = <num_items>
		if (<num_items_to_do> > 26)
			num_items_to_do = 26
		endif
		begin
		checksum_name = ($g_net_counter_counter_name_list [<index>])
		if netsessionfunc obj = net_counters func = get_counter params = {counter_name = (<checksum_name>) out = outvar}
			formattext textname = text qs(0x7893fff3) d = <index> s = <checksum_name> t = <outvar> addtostringlookup = false dontassertforchecksums
		else
			formattext textname = text qs(0x79d4e10d) d = <index> s = <checksum_name> addtostringlookup = false dontassertforchecksums
		endif
		formattext textname = text2 qs(0x7a42d035) s = <text2> t = <text> addtostringlookup = false dontassertforchecksums
		index = (<index> + 1)
		repeat <num_items_to_do>
	endif
	change g_net_counter_overlay_text2 = (<text2>)
endscript

script net_counter_debug_overlay 
	spawnscript \{net_counter_debug_overlay_create}
endscript

script net_counter_debug_overlay_create 
	net_counter_debug_overlay_destroy
	createscreenelement \{type = containerelement
		parent = root_window
		pos = (50.0, 30.0)
		just = [
			left
			top
		]
		id = net_counter_debug_overlay_root_id}
	createscreenelement \{type = spriteelement
		parent = net_counter_debug_overlay_root_id
		texture = white
		dims = (1180.0, 660.0)
		rgba = [
			0
			0
			0
			64
		]
		pos = (590.0, 330.0)
		z_priority = 10000
		id = net_counter_debug_overlay_background_id}
	createscreenelement \{type = textelement
		parent = net_counter_debug_overlay_root_id
		font = fontgrid_text_a1
		text = qs(0x03ac90f0)
		scale = (0.5, 0.3)
		just = [
			left
			top
		]
		pos = (0.0, 10.0)
		dims = (1180.0, 800.0)
		z_priority = 10001
		rgba = [
			255
			255
			255
			255
		]
		id = net_counter_debug_overlay_text_id
		single_line = false}
	runscriptonscreenelement \{id = net_counter_debug_overlay_root_id
		net_counter_debug_overlay_task}
	change \{g_net_counter_debug_overlay_enabled = 1}
endscript

script net_counter_debug_overlay_destroy 
	if screenelementexists \{id = net_counter_debug_overlay_root_id}
		destroyscreenelement \{id = net_counter_debug_overlay_root_id}
	endif
	change \{g_net_counter_debug_overlay_enabled = 0}
endscript

script net_counter_debug_overlay_loop 
	counter = 0
	begin
	if screenelementexists \{id = net_counter_debug_overlay_root_id}
		net_counter_debug_overlay_root_id :se_setprops \{alpha = 1.0
			time = 0.5}
		formattext textname = text qs(0x6ae8aba5) d = <counter> s = ($g_net_counter_overlay_text1) t = ($g_net_counter_overlay_text2) addtostringlookup = false dontassertforchecksums
		if NOT gotparam \{text}
			<text> = qs(0x03ac90f0)
		endif
		if screenelementexists \{id = net_counter_debug_overlay_text_id}
			net_counter_debug_overlay_text_id :se_setprops text = <text>
		endif
	endif
	wait \{1.0
		seconds}
	<counter> = (<counter> + 1)
	if (<counter> > ($g_net_counter_debug_overlay_refresh_time))
		if (($g_net_counter_writing_counters != 0) || ($g_net_counter_reading_counters != 0))
		else
			<counter> = 0
			getarraysize \{$g_net_counter_counter_name_list}
			num_items = <array_size>
			if (<num_items> > 0)
				change \{g_net_counter_reading_counters = 1}
				index = 0
				begin
				checksum_name = ($g_net_counter_counter_name_list [<index>])
				netsessionfunc obj = net_counters func = read_counter params = {counter_name = (<checksum_name>)}
				index = (<index> + 1)
				repeat <num_items>
				netsessionfunc \{obj = net_counters
					func = read_counters
					params = {
						callback = net_counter_read_counters_callback
						callback_params = {
						}
					}}
			endif
		endif
	endif
	repeat
endscript

script net_counter_debug_overlay_task 
	net_counter_debug_overlay_loop
	net_counter_debug_overlay_destroy
endscript
