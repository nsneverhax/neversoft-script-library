loading_screen_tips = [
	$string_ps2_loading_screen_tip_01
	$string_ps2_loading_screen_tip_01
	$string_ps2_loading_screen_tip_02
	$string_ps2_loading_screen_tip_02
	$string_ps2_loading_screen_tip_04
	$string_ps2_loading_screen_tip_04
	$string_ps2_loading_screen_tip_05
	$string_ps2_loading_screen_tip_06
	$string_ps2_loading_screen_tip_07
	$string_ps2_loading_screen_tip_08
	$string_ps2_loading_screen_tip_09
	$string_ps2_loading_screen_tip_10
	$string_ps2_loading_screen_tip_11
	$string_ps2_loading_screen_tip_12
	$string_ps2_loading_screen_tip_13
	$string_ps2_loading_screen_tip_14
	$string_ps2_loading_screen_tip_15
	$string_ps2_loading_screen_tip_16
	$string_ps2_loading_screen_tip_17
	$string_ps2_loading_screen_tip_18
	$string_ps2_loading_screen_tip_19
	$string_ps2_loading_screen_tip_20
	$string_ps2_loading_screen_tip_21
	$string_ps2_loading_screen_tip_22
	$string_ps2_loading_screen_tip_23
	$string_ps2_loading_screen_tip_24
	$string_ps2_loading_screen_tip_25
	$string_ps2_loading_screen_tip_26
	$string_ps2_loading_screen_tip_27
	$string_ps2_loading_screen_tip_28
	$string_ps2_loading_screen_tip_29
	$string_ps2_loading_screen_tip_30
	$string_ps2_loading_screen_tip_31
	$string_ps2_loading_screen_tip_32
	$string_ps2_loading_screen_tip_33
	$string_ps2_loading_screen_tip_35
	$string_ps2_loading_screen_tip_36
	$string_ps2_loading_screen_tip_37
]
loading_screen_tips_per_venue = [
	{
		tips_array = [
			'The first Aerosmith gig was at Nipmuc Regional High in Hopkinton, Mass.'
			'The band\'s first gig included Aerosmith versions of \'Good Times Bad Times\' and \'Great Balls of Fire\'.'
			'The very first Aerosmith rehearsals were in the basement at Boston University.'
			'For their first gig at Nipmuc High School, Aerosmith opened up with \'Route 66\''
			'In the early days, Aerosmith used to play gigs outside of Boston University\'s Student Union building.'
		]
	}
	{
		tips_array = [
			'In its two decades in Union Square, Max\'s Kansas City drew the likes of Mick Jagger, Bob Dylan, and John Lennon.'
			'Max\'s Kansas City became one of the birthplaces of Punk, featuring bands like The New York Dolls and The Ramones.'
			'Aerosmith, Bruce Springsteen and Bob Marley played their first New York City gigs at Max\'s Kansas City.'
			'\'No Surprize\' retells the story of Clive Davis signing the band after a show at Max\'s Kansas City.'
			'After the breakup of the Sex Pistols, Sid Vicious played many of his solo gigs at Max\'s Kansas City.'
			'Max\'s Kansas City closed its doors for good in 1981, but the building is still there.'
			'The Velvet Underground played their last shows with Lou Reed at Max\'s Kansas City in the summer of 1970.'
			'Max\'s Kansas City created music history nightly when superstars such as Patti Smith, David Bowie and Iggy Pop took the stage.'
		]
	}
	{
		tips_array = [
			'Joe Perry left the band in 1979 and didn\'t return until 1984.'
			'Aerosmith\'s return began on Valentine\'s Day 1984, when the band reunited after a gig at the Orpheum Theater of Boston.'
			'In 1986, Aerosmith re-entered the charts for the first time in 6 years when they teamed up with Run DMC to re-record \'Walk This Way\'.'
			'In 1984, Aerosmith embarked on the \'Back in the Saddle\' reunion tour and recorded the live album \'Classics Live II\' along the way.'
			'In 1987 Aerosmith released their ninth album \'Permanent Vacation\'.  The album quickly went Triple-Platinum.'
		]
	}
	{
		tips_array = [
			'Aerosmith had to cancel the Russian dates of the \'Nine Lives Tour\' and weren\'t able to return until years later.'
			'Aerosmith has performed all over the world, including sold-out shows in India, Japan, and the United Arab Emirates.'
			'Aerosmith\'s 12th studio album \'Nine Lives\' debuted at #1 on the U.S. charts.'
			'In 1998, Aerosmith completed a sold out Dome tour of Japan, the first ever by an International Artist.'
			'In 1998, Aerosmith was nominated for two Grammy\'s including Best Rock Album for \'Nine Lives\'.'
		]
	}
	{
		tips_array = [
			'\'Just Push Play\' was recorded at The Boneyard which is a studio at Joe Perry\'s house.'
			'In January 2001, Aerosmith took the stage at the big Half-Time Show for an all-star performance of \'Walk This Way.\''
			'\'Just Push Play\' debuted on the U.S. charts at #2.'
			'\'Just Push Play\' is Aerosmith\'s 13th studio album and was certified platinum within a month of its release.'
		]
	}
	{
		tips_array = [
			'Aerosmith had an exhibit erected in April 1998 at the Rock and Roll Hall of Fame.'
			'Aerosmith was inducted into the Rock and Roll Hall of Fame in 2001.  Other inductees that year included Queen and Steely Dan.'
			'Aerosmith is the only band to be inducted to the Rock and Roll Hall of Fame with a hit song on the radio at the time.'
			'At the 2001 induction to the Rock and Roll Hall of Fame, Aerosmith performed \'Sweet Emotion\' with Kid Rock.'
			'After the Hall of Fame Ceremony, Steven went to recut \'Just Push Play\' with additional vocals from Kid Rock.'
		]
	}
]
g_loading_screen_split_container_id = id

script create_loading_screen \{mode = play_song}
	predisplayloadingscreen
	menu_music_off \{setflag = 1}
	kill_start_key_binding
	if ($is_changing_levels = 1)
		return
	endif
	Change \{is_changing_levels = 1}
	GetRandomValue \{Name = global_or_not
		a = 0
		b = 1
		integer}
	if (<global_or_not> = 0)
		GetArraySize ($loading_screen_tips)
		GetRandomValue Name = rand_num a = 0 b = (<array_Size> - 1) integer
		rand_tip = ($loading_screen_tips [<rand_num>])
	else
		GetArraySize (($loading_screen_tips_per_venue [$g_venue_index]).tips_array)
		GetRandomValue Name = rand_num a = 0 b = (<array_Size> - 1) integer
		rand_tip = (($loading_screen_tips_per_venue [$g_venue_index]).tips_array [<rand_num>])
	endif
	if (($current_song = kingsandqueenscredits || $current_song = kingsandqueens) && ($current_difficulty = expert))
		rand_tip = $string_ps2_loading_screen_tip_39
	endif
	KillSpawnedScript \{Name = destroy_loading_screen_spawned}
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		id = loading_screen_container
		Pos = (0.0, 0.0)}
	LoadPak \{'pak/loading_screen/loading_screen.pak'
		Heap = heap_song}
	CreateScreenElement \{Type = SpriteElement
		parent = loading_screen_container
		texture = loading_background
		Pos = (640.0, 360.0)
		just = [
			center
			center
		]
		dims = (1280.0, 720.0)
		z_priority = 4000}
	CreateScreenElement {
		Type = TextBlockElement
		parent = loading_screen_container
		id = loading_tip_text
		text = <rand_tip>
		font = text_a4
		Scale = 1.1
		just = [center center]
		dims = (350.0, 500.0)
		Pos = (400.0, 250.0)
		rgba = [255 255 255 255]
		z_priority = 4999
		Shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [0 0 0 255]
	}
	CreateScreenElement \{Type = TextElement
		id = loading_text
		parent = loading_screen_container
		text = $string_ps2_LOADING
		font = text_a4
		Pos = (400.0, 600.0)
		Scale = (1.1, 2.2)
		rgba = [
			255
			255
			255
			255
		]
		just = [
			center
			center
		]
		font_spacing = 0
		Shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 4999}
	Wait \{5
		gameframes}
	DisplayLoadingScreen \{no_back
		animate}
endscript

script 0x7d2099b2 
	Wait \{4
		gameframes}
	DisplayLoadingScreen \{no_back
		animate}
endscript

script wait_and_play_loading_movie 
	begin
	if (isMoviePreLoaded textureSlot = 2)
		StartPreLoadedMovie \{textureSlot = 2}
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script destroy_loading_screen 
	destroy_menu \{menu_id = loading_tip_text}
	destroy_menu \{menu_id = loading_text}
	KillSpawnedScript \{Name = jiggle_text_array_elements}
	if ScreenElementExists \{id = $g_loading_screen_split_container_id}
		DestroyScreenElement \{id = $g_loading_screen_split_container_id}
	endif
	if IsMoviePlaying \{textureSlot = 2}
		KillMovie \{textureSlot = 2}
	endif
	SpawnScriptNow \{destroy_loading_screen_spawned}
	HideLoadingScreen
	if ($playing_song = 0)
		Change \{is_changing_levels = 0}
	endif
	Change \{is_changing_levels = 0}
endscript

script destroy_loading_screen_spawned \{time = 0.3}
	OnExitRun \{destroy_loading_screen_finish}
	if (<time> > 0)
		if ScreenElementExists \{id = menu_backdrop_container}
			DoScreenElementMorph id = menu_backdrop_container alpha = 0 time = <time>
		endif
		if ScreenElementExists \{id = loading_screen_container}
			DoScreenElementMorph id = loading_screen_container alpha = 0 time = <time>
		endif
		Wait <time> Seconds
	endif
endscript

script destroy_loading_screen_finish 
	if ScreenElementExists \{id = loading_screen_container}
		DestroyScreenElement \{id = loading_screen_container}
	endif
	if ($ui_flow_manager_state [0] = online_loading_fs)
		destroy_menu_backdrop
	endif
	Change \{g_suspend_disc_eject_soundpause = 0}
	UnLoadPak \{'pak/loading_screen/loading_screen.pak'
		Heap = heap_song}
endscript

script refresh_screen 
	destroy_loading_screen
	create_loading_screen
endscript
