friend_feed_menu_data = {
	main = {
		interactive = 1
		Pos = (-50.0, 75.0)
		z_priority = 100.0
		pad_handler = pad_option
		expand_anim = expand_main_menu
	}
	band_lobby = {
		interactive = 0
		Pos = (-82.0, 90.0)
		z_priority = 100.0
		expand_anim = None
	}
	SongList = {
		interactive = 0
		Pos = (465.0, -335.0)
		z_priority = 10.0
		pad_handler = pad_option
		expand_anim = None
	}
	freeplay = {
		interactive = 1
		Pos = (0.0, 0.0)
		z_priority = 10.0
		pad_handler = pad_option
		expand_anim = None
	}
	expanded_pos = (770.0, 230.0)
	scroll_time = 5
	0x89b65daf = 10
	mini_feed_num_items_to_scroll = 2
}
g_friend_feed_anims = {
	scroll_anim = [
		{
			Pos = (0.0, 10.0)
			time = 0.5
			motion = ease_in
		}
		{
			Pos = (0.0, -106.0)
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
	None = [
	]
}
0x968bb042 = [
]
0x621f73c3 = 0
0x24f2a572 = [
	beat_score
	0xc9aa4357
	0x5884f28a
	0x0da1d556
	unlock_item_type
	0xf5bcb036
	0x57dfa81d
	0xed329448
	0x3ae1cd59
	0xf6026930
	0x20449ad2
	cash_milestone
	0xcbe15a60
	0xdc473df7
	0x2791abe0
	cheated
	created_rocker
	0x1c069af8
	encore_complete
]
news_feed_events = [
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
]
