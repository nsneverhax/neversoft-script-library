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
	if NOT GotParam \{delta}
		delta = 1
	endif
	NetSessionFunc Obj = net_counters func = update_counter params = {counter_name = <counter_name> delta = <delta>}
	Change \{g_net_counter_please_write_counters = 1}
	if NOT ScriptIsRunning \{net_counter_write_counters_loop_proc}
		SpawnScriptNow \{net_counter_write_counters_loop_proc}
	endif
endscript

script net_counter_write_counters_loop_proc 
	begin
	if (($g_net_counter_writing_counters != 0) || ($g_net_counter_reading_counters != 0))
		if ($g_net_counter_please_write_counters != 0)
			Wait ($g_net_counter_quick_sleep_time) Seconds
		else
			Wait ($g_net_counter_long_sleep_time) Seconds
		endif
	else
		if ($g_net_counter_please_write_counters != 0)
			Change \{g_net_counter_please_write_counters = 0}
			Change \{g_net_counter_writing_counters = 1}
			NetSessionFunc \{Obj = net_counters
				func = write_counters
				params = {
					callback = net_counter_write_counters_callback
					callback_params = {
					}
				}}
			Wait ($g_net_counter_long_sleep_time) Seconds
		else
			Wait ($g_net_counter_long_sleep_time) Seconds
		endif
	endif
	repeat
endscript

script net_counter_write_counters_callback 
	Change \{g_net_counter_writing_counters = 0}
endscript
