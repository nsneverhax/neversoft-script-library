friend_feed_strings = {
	button_green = qs(0x633bd475)
	button_red = qs(0xbd725f3d)
	button_yellow = qs(0x9a7d1fe5)
	button_blue = qs(0xbd725f3d)
	button_orange = qs(0xbe4c0e5b)
	button_shortcut_blank = qs(0x00000000)
	button_shortcut_motd = qs(0x5ffd5ccb)
	button_shortcut_ad = qs(0x690695ba)
	error_popup_generic = qs(0x1e748505)
	error_popup_invalid_song_unlock = qs(0x11553441)
	error_popup_invalid_song_dlc = qs(0x8db7ecf3)
	error_popup_warning = qs(0xaa163738)
	error_popup_ok = qs(0x9bc5dae4)
	error_message_not_signed_in_insufficient_privileges = qs(0xdc2ca5d8)
	error_message_not_signed_xbox = qs(0x69ba4cab)
	error_message_not_signed_ps3 = qs(0xb9836f21)
	error_message_not_signed_ngc = qs(0xec4ac88d)
	error_message_refreshing = qs(0x413154fb)
}
g_news_item_data = [
	{
		checksum = rock_record
		Priority = 3
		spacing = 4
		time = 4.0
	}
	{
		checksum = ad
		Priority = 1
		spacing = 6
		time = 5.5
	}
	{
		checksum = motd
		Priority = 2
		spacing = 5
		time = 10.0
	}
	{
		checksum = community
		Priority = 4
		spacing = 100
		time = 4.0
	}
	{
		checksum = hint
		Priority = 5
		spacing = 12
		time = 4.0
	}
	{
		checksum = friend
		Priority = 6
		spacing = 0
		time = 4.0
	}
]
g_max_items_in_mini_feed = 30
g_max_items_in_expanded_feed = 30
friend_feed_menu_data = {
	main = {
		interactive = 1
		Pos = (80.0, 85.0)
		z_priority = 150.0
		pad_handler = pad_option
		expand_anim = expand_main_menu
	}
	main_generic = {
		interactive = 0
		Pos = (80.0, 85.0)
		z_priority = 100.0
		pad_handler = pad_option
		expand_anim = None
	}
	band_lobby = {
		interactive = 0
		Pos = (80.0, 85.0)
		z_priority = 100.0
		pad_handler = pad_option
		expand_anim = None
	}
	SongList = {
		interactive = 1
		Pos = (612.0, 85.0)
		z_priority = 135
		pad_handler = pad_option
		expand_anim = expand_songlist
	}
	freeplay = {
		interactive = 1
		Pos = (0.0, 0.0)
		z_priority = 10.0
		pad_handler = pad_option
		expand_anim = None
	}
	debug = {
		interactive = 0
		Pos = (-576.0, 128.0)
		z_priority = 1.0
		pad_handler = pad_option
		expand_anim = None
	}
	expanded_pos = (770.0, 230.0)
	scroll_time = 3
	mini_feed_num_items_to_scroll = 2
	scroll_anim_step_size = 72
	mini_feed_request_wait = 20
	item_fade_in_time = 1.0
	item_fade_out_time = 1.0
	msg_scroll_threshold = 3
	additional_time_per_line = 1.5
	number_items_expanded_feed = 7
}
g_friend_feed_anims = {
	scroll_anim = [
		{
			Pos = (0.0, 10.0)
			time = 0.5
			motion = ease_in
		}
		{
			Pos = (0.0, -82.0)
			time = 0.5
			motion = ease_in
		}
		{
			Pos = (0.0, -20.0)
			time = 0.2
			motion = ease_out
		}
		{
			Pos = (0.0, 20.0)
			time = 0.5
			motion = ease_out
		}
	]
	expand_main_menu = [
		{
			Pos = (545.0, 0.0)
			time = 0.2
		}
		{
			Pos = (-20.0, 0.0)
			time = 0.05
		}
	]
	expand_songlist = [
	]
	None = [
	]
}
g_ff_debug = 0
g_news_feed_debug_overlay = 0
g_ff_has_error_message = 0
g_request_spin_time = 2.0
g_friend_update_wait_period = 10.0
g_controller_update_time = 5.0
g_friend_update_max_msg_in_queue = 30
g_num_msg_queues = 7
g_prev_registered_controllers = [
]
q_msg_queue_0 = [
]
q_msg_queue_1 = [
]
q_msg_queue_2 = [
]
q_msg_queue_3 = [
]
q_msg_queue_4 = [
]
q_msg_queue_5 = [
]
q_msg_queue_6 = [
]
g_ad_index = 0
g_valid_ad_ids = [
]
g_motd_index = 0
g_num_motds = 4
g_ff_num_rock_record_messages = 5
g_ff_rock_record_messages = [
]
g_ff_rock_record_stats = [
	{
		columns = [
			total_time_playing_in_seconds
		]
		more_string = qs(0x57093e6c)
		less_string = qs(0x4bfdf96f)
		integer
	}
	{
		columns = [
			total_stars
		]
		more_string = qs(0xf8d7bcc8)
		less_string = qs(0x8220cd50)
		integer
	}
	{
		columns = [
			num_songs_in_library
		]
		more_string = qs(0x20e96006)
		less_string = qs(0x583c7151)
		integer
	}
	{
		columns = [
			longest_notestreak
		]
		more_string = qs(0xd1773935)
		less_string = qs(0xf10a22c1)
		integer
	}
	{
		columns = [
			num_songs_completed
		]
		more_string = qs(0xffa26b3a)
		less_string = qs(0xbc1d0e6d)
		integer
	}
	{
		columns = [
			total_song_multiplier
			num_additions_to_total_song_multiplier
		]
		more_string = qs(0x08226a46)
		less_string = qs(0x2d76cc29)
	}
]
g_ff_ps3_boot_time_refresh_done = 0
news_feed_events = [
	{
		event = beat_score
		Scr = feed_event_beat_score
	}
	{
		event = cheated
		Scr = feed_event_cheated
	}
	{
		event = created_rocker
		Scr = feed_event_created_rocker
	}
	{
		event = encore_complete
		Scr = feed_event_completed_encore
	}
	{
		event = unlock_item_type
		Scr = feed_event_unlock_item_type
	}
	{
		event = dlc_purchased
		Scr = feed_event_dlc_purchased
	}
	{
		event = song_uploaded
		Scr = feed_event_song_uploaded
	}
	{
		event = wiiward_unlocked
		Scr = feed_event_wiiward_unlocked
	}
]
g_wii_pause_friend_feed = 0
