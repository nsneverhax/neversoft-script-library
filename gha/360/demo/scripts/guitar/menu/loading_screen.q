loading_screen_tips = [
	"Wanna blame your TV for your sucking?  Go to Calibrate Lag in the Options Menu."
	"Wanna blame your TV for your sucking?  Go to Calibrate Lag in the Options Menu."
	"Get your personal Guitar Hero stats on the web. Visit guitarhero.com to find out how!"
	"Link to your game stats, earn groupies, and form an online band at guitarhero.com!"
	"Aerosmith had to cancel the Russian dates of the 'Nine Lives Tour' and weren't able to return until years later."
	"Aerosmith has performed all over the world, including sold-out shows in India, Japan, and the United Arab Emirates."
	"Aerosmith's 12th studio album 'Nine Lives' debuted at #1 on the U.S. charts."
	"In 1998, Aerosmith completed a sold out Dome tour of Japan, the first ever by an International Artist."
	"In 1998, Aerosmith was nominated for two Grammy's including Best Rock Album for 'Nine Lives'."
]
loading_screen_tips_per_venue = [
	{
		tips_array = [
			"The first Aerosmith gig was at Nipmuc Regional High in Hopkinton, Mass."
			"The band's first gig included Aerosmith versions of 'Good Times Bad Times' and 'Great Balls of Fire'."
			"The very first Aerosmith rehearsals were in the basement at Boston University."
			"For their first gig at Nipmuc High School, Aerosmith opened up with 'Route 66'"
			"In the early days, Aerosmith used to play gigs outside of Boston University's Student Union building."
		]
	}
	{
		tips_array = [
			"In its two decades in Union Square, Max's Kansas City drew the likes of Mick Jagger, Bob Dylan, and John Lennon."
			"Max's Kansas City became one of the birthplaces of Punk, featuring bands like The New York Dolls and The Ramones."
			"Aerosmith, Bruce Springsteen and Bob Marley played their first New York City gigs at Max's Kansas City."
			"'No Surprize' retells the story of Clive Davis signing the band after a show at Max's Kansas City."
			"After the breakup of the Sex Pistols, Sid Vicious played many of his solo gigs at Max's Kansas City."
			"Max's Kansas City closed its doors for good in 1981, but the building is still there."
			"The Velvet Underground played their last shows with Lou Reed at Max's Kansas City in the summer of 1970."
			"Max's Kansas City created music history nightly when superstars such as Patti Smith, David Bowie and Iggy Pop took the stage."
		]
	}
	{
		tips_array = [
			"Joe Perry left the band in 1979 and didn't return until 1984."
			"Aerosmith's return began on Valentine's Day 1984, when the band reunited after a gig at the Orpheum Theater of Boston."
			"In 1986, Aerosmith re-entered the charts for the first time in 6 years when they teamed up with Run DMC to re-record 'Walk This Way'."
			"In 1984, Aerosmith embarked on the 'Back in the Saddle' reunion tour and recorded the live album 'Classics Live II' along the way."
			"In 1987 Aerosmith released their ninth album 'Permanent Vacation'.  The album quickly went Triple-Platinum."
		]
	}
	{
		tips_array = [
			"Aerosmith had to cancel the Russian dates of the 'Nine Lives Tour' and weren't able to return until years later."
			"Aerosmith has performed all over the world, including sold-out shows in India, Japan, and the United Arab Emirates."
			"Aerosmith's 12th studio album 'Nine Lives' debuted at #1 on the U.S. charts."
			"In 1998, Aerosmith completed a sold out Dome tour of Japan, the first ever by an International Artist."
			"In 1998, Aerosmith was nominated for two Grammy's including Best Rock Album for 'Nine Lives'."
		]
	}
	{
		tips_array = [
			"'Just Push Play' was recorded at The Boneyard which is a studio at Joe Perry's house."
			"In January 2001, Aerosmith took the stage at the big Half-Time Show for an all-star performance of 'Walk This Way.'"
			"'Just Push Play' debuted on the U.S. charts at #2."
			"'Just Push Play' is Aerosmith's 13th studio album and was certified platinum within a month of its release."
		]
	}
	{
		tips_array = [
			"Aerosmith had an exhibit erected in April 1998 at the Rock and Roll Hall of Fame."
			"Aerosmith was inducted into the Rock and Roll Hall of Fame in 2001.  Other inductees that year included Queen and Steely Dan."
			"Aerosmith is the only band to be inducted to the Rock and Roll Hall of Fame with a hit song on the radio at the time."
			"At the 2001 induction to the Rock and Roll Hall of Fame, Aerosmith performed 'Sweet Emotion' with Kid Rock."
			"After the Hall of Fame Ceremony, Steven went to recut 'Just Push Play' with additional vocals from Kid Rock."
		]
	}
]
g_loading_screen_split_container_id = id

script create_loading_screen \{mode = play_song}
	menu_music_off
	kill_start_key_binding
	if ($is_changing_levels = 1)
		return
	endif
	change \{is_changing_levels = 1}
	getrandomvalue \{name = global_or_not
		a = 0
		b = 1
		integer}
	if (<global_or_not> = 0)
		getarraysize ($loading_screen_tips)
		getrandomvalue name = rand_num a = 0 b = (<array_size> - 1) integer
		rand_tip = ($loading_screen_tips [<rand_num>])
	else
		getarraysize (($loading_screen_tips_per_venue [$g_venue_index]).tips_array)
		getrandomvalue name = rand_num a = 0 b = (<array_size> - 1) integer
		rand_tip = (($loading_screen_tips_per_venue [$g_venue_index]).tips_array [<rand_num>])
	endif
	if (<mode> = play_song || <mode> = play_encore || <mode> = play_boss || <mode> = restart_song)
		killspawnedscript \{name = jiggle_text_array_elements}
		if screenelementexists \{id = $g_loading_screen_split_container_id}
			destroyscreenelement \{id = $g_loading_screen_split_container_id}
		endif
		killallmovies
		movie = 'loading_flying'
		if NOT ismovieinbuffer movie = <movie>
			buffer_slot = 0
			freemoviebuffer buffer_slot = <buffer_slot>
			if gotextramemory
				mempushcontext \{debugheap}
			endif
			allocatemoviebuffer buffer_slot = <buffer_slot> movie = 'movies\\bik\\loading_flying.bik.xen'
			if gotextramemory
				mempopcontext
			endif
			loadmovieintobuffer buffer_slot = <buffer_slot> movie = <movie>
		endif
		playmoviefrombuffer {
			buffer_slot = <buffer_slot>
			textureslot = 2
			no_hold
			wait_until_rendered
			texturepri = 4999
		}
		createscreenelement {
			type = textblockelement
			parent = root_window
			id = loading_tip_text
			text = <rand_tip>
			font = text_a4
			scale = 0.8
			just = [center center]
			dims = (300.0, 480.0)
			pos = (900.0, 300.0)
			rgba = [255 255 255 255]
			z_priority = 5000
			allow_expansion
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
		}
		createscreenelement \{type = textelement
			parent = root_window
			id = loading_text
			text = "LOADING..."
			font = text_a10
			scale = 2.0
			just = [
				right
				center
			]
			pos = (1000.0, 580.0)
			rgba = [
				255
				255
				255
				255
			]
			z_priority = 5000
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]}
		getscreenelementdims id = <id>
		fit_text_in_rectangle only_if_larger_x = 1 id = <id> dims = ((200.0, 0.0) + (<height> * (0.0, 1.0))) start_x_scale = 2.0 start_y_scale = 2.0
	else
		killspawnedscript \{name = destroy_loading_screen_spawned}
		createscreenelement \{type = containerelement
			parent = root_window
			id = loading_screen_container
			pos = (0.0, 0.0)}
		createscreenelement \{type = spriteelement
			parent = loading_screen_container
			texture = loading_flying_static
			pos = (640.0, 360.0)
			just = [
				center
				center
			]
			dims = (1280.0, 720.0)}
	endif
endscript

script wait_and_play_loading_movie 
	begin
	if (ismoviepreloaded textureslot = 2)
		startpreloadedmovie \{textureslot = 2}
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script destroy_loading_screen 
	destroy_menu \{menu_id = loading_tip_text}
	destroy_menu \{menu_id = loading_text}
	killspawnedscript \{name = jiggle_text_array_elements}
	if screenelementexists \{id = $g_loading_screen_split_container_id}
		destroyscreenelement \{id = $g_loading_screen_split_container_id}
	endif
	if ismovieplaying \{textureslot = 2}
		killmovie \{textureslot = 2}
	endif
	spawnscriptnow \{destroy_loading_screen_spawned}
	hideloadingscreen
	if ($playing_song = 0)
		change \{is_changing_levels = 0}
	endif
endscript

script destroy_loading_screen_spawned \{time = 0.3}
	onexitrun \{destroy_loading_screen_finish}
	if (<time> > 0)
		if screenelementexists \{id = menu_backdrop_container}
			doscreenelementmorph id = menu_backdrop_container alpha = 0 time = <time>
		endif
		if screenelementexists \{id = loading_screen_container}
			doscreenelementmorph id = loading_screen_container alpha = 0 time = <time>
		endif
		wait <time> seconds
	endif
endscript

script destroy_loading_screen_finish 
	if screenelementexists \{id = loading_screen_container}
		destroyscreenelement \{id = loading_screen_container}
	endif
	destroy_menu_backdrop
endscript

script refresh_screen 
	destroy_loading_screen
	create_loading_screen
endscript
