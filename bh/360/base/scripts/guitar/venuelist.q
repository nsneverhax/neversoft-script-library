LevelZoneArray = [
	viewer
	load_z_visualizer
	load_Z_Cube
	load_Z_EasterIsland
	load_Z_Montreux
	load_Z_Tokyo
	load_Z_Cabo
	load_Z_Paris
	load_Z_CentralPark
	load_Z_Gorge
	load_Z_Mall
	load_Z_Space
	load_Z_AwardShow
]
LevelZones = {
	load_z_visualizer = {
		zone = Z_Visualizer
		name = 'Z_Visualizer'
		Title = qs(0xc001117d)
		loading_movie = 'venue_load_wormhole'
		unlock_movie = 'venue_unlock_wormhole'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = venue_poster_gh5
	}
	load_Z_Cube = {
		zone = Z_Cube
		name = 'Z_Cube'
		Title = qs(0x3ee59a14)
		loading_movie = 'venue_load_hypersphere'
		unlock_movie = 'venue_unlock_hypersphere'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = venue_poster_hypersphere
	}
	load_Z_EasterIsland = {
		zone = Z_EasterIsland
		name = 'Z_EasterIsland'
		Title = qs(0x8838ef7c)
		loading_movie = 'venue_load_madrid'
		unlock_movie = 'venue_unlock_madrid'
		progression_movie = 'venue_cut_madrid'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = venue_poster_madrid
	}
	load_Z_Montreux = {
		zone = Z_Montreux
		name = 'Z_Montreaux'
		Title = qs(0x2015667b)
		loading_movie = 'venue_load_montreux'
		unlock_movie = 'venue_unlock_montreux'
		progression_movie = 'venue_cut_montreux'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = venue_poster_montreux
	}
	load_Z_Tokyo = {
		zone = Z_Tokyo
		name = 'Z_Tokyo'
		Title = qs(0x4e16f1bf)
		loading_movie = 'venue_load_tokyo'
		unlock_movie = 'venue_unlock_tokyo'
		progression_movie = 'venue_cut_tokyo'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = venue_poster_tokyo
	}
	load_Z_Cabo = {
		zone = Z_Cabo
		name = 'Z_Cabo'
		Title = qs(0x5b1ee86e)
		loading_movie = 'venue_load_cabo'
		unlock_movie = 'venue_unlock_cabo'
		progression_movie = 'venue_cut_cabo'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = venue_poster_cabo
	}
	load_Z_Paris = {
		zone = Z_Paris
		name = 'Z_Paris'
		Title = qs(0xb7503ee2)
		loading_movie = 'venue_load_paris'
		unlock_movie = 'venue_unlock_paris'
		progression_movie = 'venue_cut_paris'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = venue_poster_paris
	}
	load_Z_CentralPark = {
		zone = Z_CentralPark
		name = 'Z_CentralPark'
		Title = qs(0x3ce0ac62)
		loading_movie = 'venue_load_centralpark'
		unlock_movie = 'venue_unlock_centralpark'
		progression_movie = 'venue_cut_centralpark'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = venue_poster_centralpark
	}
	load_Z_Gorge = {
		zone = Z_Gorge
		name = 'Z_Gorge'
		Title = qs(0xfb870989)
		loading_movie = 'venue_load_gorge'
		unlock_movie = 'venue_unlock_gorge'
		progression_movie = 'venue_cut_gorge'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = venue_poster_gorge
	}
	load_Z_Mall = {
		zone = Z_Mall
		name = 'Z_Mall'
		Title = qs(0xef207887)
		loading_movie = 'venue_load_mall'
		unlock_movie = 'venue_unlock_mall'
		progression_movie = 'venue_cut_mall'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = venue_poster_mall
	}
	load_Z_Space = {
		zone = Z_Space
		name = 'Z_Space'
		Title = qs(0x4587483a)
		loading_movie = 'venue_load_space'
		unlock_movie = 'venue_unlock_space'
		progression_movie = 'venue_cut_space'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = venue_poster_space
	}
	load_Z_AwardShow = {
		zone = Z_AwardShow
		name = 'Z_AwardShow'
		Title = qs(0x15783838)
		loading_movie = 'venue_load_awardshow'
		unlock_movie = 'venue_unlock_awardshow'
		progression_movie = 'venue_cut_awardshow'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 91
		loading_movie_loop_end = 119
		poster = venue_poster_awardshow
	}
	viewer = {
		zone = z_viewer
		name = 'z_viewer'
		Title = qs(0x6e2b4d97)
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
		Title = qs(0x6e2b4d97)
		loading_movie = 'venue_load_cairo'
		unlock_movie = 'venue_unlock_cairo'
		unlock_movie_loop_start = 14
		unlock_movie_loop_end = 80
		loading_movie_loop_start = 102
		loading_movie_loop_end = 239
		poster = venue_poster_gh5
		debug_only
	}
	load_z_Studio = {
		zone = z_Studio
		name = 'z_Studio'
		Title = qs(0x28245ace)
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
