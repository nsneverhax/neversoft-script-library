levelzonearray = [
	viewer
	load_z_visualizer
	load_z_cube
	load_z_easterisland
	load_z_montreux
	load_z_tokyo
	load_z_cabo
	load_z_paris
	load_z_centralpark
	load_z_gorge
	0x39914645
	0x8362270b
	0xa72a91a6
]
levelzones = {
	load_z_visualizer = {
		zone = z_visualizer
		name = 'Z_Visualizer'
		title = qs(0xc001117d)
		loading_movie = 'venue_load_wormhole'
		unlock_movie = 'venue_unlock_wormhole'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = venue_poster_gh5
	}
	load_z_cube = {
		zone = z_cube
		name = 'Z_Cube'
		title = qs(0x3ee59a14)
		loading_movie = 'venue_load_hypersphere'
		unlock_movie = 'venue_unlock_hypersphere'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = 0x6f23045a
	}
	load_z_easterisland = {
		zone = z_easterisland
		name = 'Z_EasterIsland'
		title = qs(0x8838ef7c)
		loading_movie = 'venue_load_madrid'
		unlock_movie = 'venue_unlock_madrid'
		0xe1052062 = 'venue_cut_madrid'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = 0x0ca9ce9f
	}
	load_z_montreux = {
		zone = z_montreux
		name = 'Z_Montreaux'
		title = qs(0x2015667b)
		loading_movie = 'venue_load_montreux'
		unlock_movie = 'venue_unlock_montreux'
		0xe1052062 = 'venue_cut_montreux'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = 0x7ead1644
	}
	load_z_tokyo = {
		zone = z_tokyo
		name = 'Z_Tokyo'
		title = qs(0x4e16f1bf)
		loading_movie = 'venue_load_tokyo'
		unlock_movie = 'venue_unlock_tokyo'
		0xe1052062 = 'venue_cut_tokyo'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = 0x93311eac
	}
	load_z_cabo = {
		zone = z_cabo
		name = 'Z_Cabo'
		title = qs(0x5b1ee86e)
		loading_movie = 'venue_load_cabo'
		unlock_movie = 'venue_unlock_cabo'
		0xe1052062 = 'venue_cut_cabo'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = 0xdaa77dd6
	}
	load_z_paris = {
		zone = z_paris
		name = 'Z_Paris'
		title = qs(0xb7503ee2)
		loading_movie = 'venue_load_paris'
		unlock_movie = 'venue_unlock_paris'
		0xe1052062 = 'venue_cut_paris'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = 0xcb5a19be
	}
	load_z_centralpark = {
		zone = z_centralpark
		name = 'Z_CentralPark'
		title = qs(0x3ce0ac62)
		loading_movie = 'venue_load_centralpark'
		unlock_movie = 'venue_unlock_centralpark'
		0xe1052062 = 'venue_cut_centralpark'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = 0x3b916996
	}
	load_z_gorge = {
		zone = z_gorge
		name = 'Z_Gorge'
		title = qs(0xfb870989)
		loading_movie = 'venue_load_gorge'
		unlock_movie = 'venue_unlock_gorge'
		0xe1052062 = 'venue_cut_gorge'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = 0x9312bdc0
	}
	0x39914645 = {
		zone = 0x53d2aff0
		name = 'Z_Mall'
		title = qs(0xef207887)
		loading_movie = 'venue_load_mall'
		unlock_movie = 'venue_unlock_mall'
		0xe1052062 = 'venue_cut_mall'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = 0x3df276d1
	}
	0x8362270b = {
		zone = z_space
		name = 'Z_Space'
		title = qs(0x4587483a)
		loading_movie = 'venue_load_space'
		unlock_movie = 'venue_unlock_space'
		0xe1052062 = 'venue_cut_space'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = 0x74041366
	}
	0xa72a91a6 = {
		zone = z_awardshow
		name = 'Z_AwardShow'
		title = qs(0x15783838)
		loading_movie = 'venue_load_awardshow'
		unlock_movie = 'venue_unlock_awardshow'
		0xe1052062 = 'venue_cut_awardshow'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = 0x5d7a58aa
	}
	viewer = {
		zone = z_viewer
		name = 'z_viewer'
		title = qs(0x6e2b4d97)
		loading_movie = 'venue_load_cairo'
		unlock_movie = 'venue_unlock_cairo'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 102
		loading_movie_loop_end = 239
		poster = venue_poster_gh5
		debug_only
	}
	load_z_viewer = {
		zone = z_viewer
		name = 'z_viewer'
		title = qs(0x6e2b4d97)
		loading_movie = 'venue_load_cairo'
		unlock_movie = 'venue_unlock_cairo'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 102
		loading_movie_loop_end = 239
		poster = venue_poster_gh5
		debug_only
	}
	load_z_studio = {
		zone = z_studio
		name = 'z_Studio'
		title = qs(0x28245ace)
		loading_movie = 'venue_load_cairo'
		unlock_movie = 'venue_unlock_cairo'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 102
		loading_movie_loop_end = 239
		poster = venue_poster_gh5
		debug_only
	}
}
