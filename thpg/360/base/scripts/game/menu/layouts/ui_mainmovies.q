ui_mainmovies_playing_movie = 0
ui_movies_profootage_list = [
	{
		name = "ANDREW REYNOLDS"
		bink_name = 'AndrewReynolds'
	}
	{
		name = "ARTO SAARI"
		bink_name = 'ArtoSaari'
	}
	{
		name = "BAM MARGERA"
		bink_name = 'BamMargera'
	}
	{
		name = "BOB BURNQUIST"
		bink_name = 'BobBurnquist'
	}
	{
		name = "DAEWON SONG"
		bink_name = 'DaewonSong'
	}
	{
		name = "DUSTIN DOLLIN"
		bink_name = 'DustinDollin'
	}
	{
		name = "JEFF KING"
		bink_name = 'jeffking'
	}
	{
		name = "JEREME ROGERS"
		bink_name = 'JeremeRogers'
	}
	{
		name = "LANCE MOUNTAIN"
		bink_name = 'LanceMountain'
	}
	{
		name = "MIKE VALLELY"
		bink_name = 'MikeVallely'
	}
	{
		name = "NYJAH HUSTON"
		bink_name = 'NyjahHuston'
	}
	{
		name = "RODNEY MULLEN"
		bink_name = 'RodneyMullen'
	}
	{
		name = "RYAN SHECKLER"
		bink_name = 'RyanSheckler'
	}
	{
		name = "STEVIE WILLIAMS"
		bink_name = 'StevieWilliams'
	}
	{
		name = "TONY HAWK"
		bink_name = 'TonyHawk'
	}
	{
		name = "VANESSA TORRES"
		bink_name = 'VanessaTorres'
	}
	{
		name = "PRO MONTAGE"
		bink_name = 'montage'
		flag = $MOVIE_UNLOCK_Montage
	}
]
ui_movies_bonusfootage_list = [
	{
		name = "NEVERSOFT"
		bink_name = 'ns_logo'
	}
	{
		name = "PROVING GROUND INTRO"
		bink_name = 'intro'
	}
	{
		name = "ROLLING STONES VIDEO"
		bink_name = 'rollingstones'
	}
	{
		name = "TRANSWORLD - LET'S DO THIS"
		bink_name = 'Transworld'
	}
]
ui_movies_bailfootage_list = [
	{
		name = "BAILS 1"
		bink_name = 'bails1'
		flag = $MOVIE_UNLOCK_Bails1
	}
	{
		name = "BAILS 2"
		bink_name = 'bails2'
		flag = $MOVIE_UNLOCK_Bails2
	}
]
ui_movies_sponsormovies_list = [
	{
		name = "ADIO"
		bink_name = 'adio'
		flag = $CAS_UNLOCK_SHOE
	}
	{
		name = "ALMOST"
		bink_name = 'almost'
	}
	{
		name = "ALTAMONT"
		bink_name = 'altamont'
		flag = $CAS_UNLOCK_AM
	}
	{
		name = "BAKER"
		bink_name = 'baker'
		flag = $CAS_UNLOCK_DECK
	}
	{
		name = "BILLABONG"
		bink_name = 'billabong'
		flag = $CAS_UNLOCK_AM
	}
	{
		name = "BIRDHOUSE"
		bink_name = 'birdhouse'
		flag = $CAS_UNLOCK_DECK
	}
	{
		name = "DGK"
		bink_name = 'dgk'
		flag = $CAS_UNLOCK_DECK
	}
	{
		name = "DVS"
		bink_name = 'dvs'
		flag = $CAS_UNLOCK_SHOE
	}
	{
		name = "ELECTRIC"
		bink_name = 'electric'
		flag = $CAS_UNLOCK_AM
	}
	{
		name = "ELEMENT"
		bink_name = 'element'
		flag = $CAS_UNLOCK_AM
	}
	{
		name = "EMERICA"
		bink_name = 'emerica'
		flag = $CAS_UNLOCK_AM
	}
	{
		name = "éS"
		bink_name = 'es'
		flag = $CAS_UNLOCK_SHOE
	}
	{
		name = "ETNIES"
		bink_name = 'etnies'
		flag = $CAS_UNLOCK_SHOE
	}
	{
		name = "FLIP"
		bink_name = 'flipper'
		flag = $CAS_UNLOCK_DECK
	}
	{
		name = "GLOBE"
		bink_name = 'globe'
		flag = $CAS_UNLOCK_SHOE
	}
	{
		name = "HURLEY"
		bink_name = 'hurley'
		flag = $CAS_UNLOCK_AM
	}
	{
		name = "MATIX"
		bink_name = 'matix'
	}
	{
		name = "OAKLEY"
		bink_name = 'oakley'
		flag = $CAS_UNLOCK_AM
	}
	{
		name = "OGIO"
		bink_name = 'ogio'
		flag = $CAS_UNLOCK_AM
	}
	{
		name = "PLAN B"
		bink_name = 'planb'
		flag = $CAS_UNLOCK_DECK
	}
	{
		name = "QUIKSILVER"
		bink_name = 'quiksilver'
		flag = $CAS_UNLOCK_AM
	}
	{
		name = "VANS"
		bink_name = 'vans'
		flag = $CAS_UNLOCK_AM
	}
	{
		name = "VOLCOM"
		bink_name = 'volcom'
		flag = $CAS_UNLOCK_AM
	}
	{
		name = "VON ZIPPER"
		bink_name = 'vonzipper'
		flag = $CAS_UNLOCK_AM
	}
	{
		name = "ZOO YORK"
		bink_name = 'zooyork'
		flag = $CAS_UNLOCK_DECK
	}
]

script ui_create_mainmovies 
	printf "UI: ui_create_mainmovies"
	make_cas_menu {
		title = "MOVIES"
		back_state = UIstate_mainoptions
		pausemenu
	}
	add_cas_menu_item {
		text = "PRO FOOTAGE"
		pad_choose_script = ui_create_movies_list
		pad_choose_params = {movies = $ui_movies_profootage_list
			title = "PRO FOOTAGE"}
	}
	add_cas_menu_item {
		text = "SPONSOR MOVIES"
		pad_choose_script = ui_create_movies_list
		pad_choose_params = {movies = $ui_movies_sponsormovies_list
			title = "SPONSOR MOVIES"}
	}
	add_cas_menu_item {
		text = "BAIL MOVIES"
		pad_choose_script = ui_create_movies_list
		pad_choose_params = {movies = $ui_movies_bailfootage_list
			title = "BAIL MOVIES"
			no_scrolling}
	}
	add_cas_menu_item {
		text = "BONUS MOVIES"
		pad_choose_script = ui_create_movies_list
		pad_choose_params = {movies = $ui_movies_bonusfootage_list
			title = "BONUS MOVIES"
			bonus_movies}
	}
	add_cas_menu_item {
		text = "CREDITS"
		pad_choose_script = ui_start_credits
		pad_choose_params = {movie = 'credits'}
	}
	add_cas_menu_item {
		text = "DONE"
		choose_state = UIstate_mainoptions
	}
	cas_menu_finish
endscript

script ui_destroy_mainmovies 
	printf \{"UI: ui_destroy_mainmovies"}
	generic_ui_destroy
endscript

script ui_movies_list_to_menu 
	ui_destroy_mainmovies
	ui_create_mainmovies
endscript

script ui_create_movies_list 
	getarraysize <movies>
	if gotparam bonus_movies
		extra_params = {
			highlight_add = (45.0, 0.0)
			width = 500
		}
	endif
	if (<array_size> < 9)
		make_cas_menu {
			menu_id = mocap_menu
			vmenu_id = mocap_vmenu
			title = <title>
			pad_back_script = ui_movies_list_to_menu
			pausemenu
			<extra_params>
		}
	else
		make_cas_menu {
			menu_id = mocap_menu
			vmenu_id = mocap_vmenu
			title = <title>
			scrolling
			pad_back_script = ui_movies_list_to_menu
			pausemenu
			<extra_params>
		}
	endif
	if (<array_size> > 0)
		<i> = 0
		begin
		<locked> = 0
		if structurecontains structure = (<movies> [<i>]) flag
			printf "checking flag %d" d = (<movies> [<i>].flag)
			if NOT getglobalflag flag = $CHEAT_UNLOCK_ALL_MOVIES
				if NOT getglobalflag flag = (<movies> [<i>].flag)
					printf "(%d is locked)" d = (<movies> [<i>].flag)
					<locked> = 1
				endif
			endif
		endif
		if (<locked> = 0)
			<pad_choose_script> = ui_play_movie
			<pad_choose_params> = {movie = (<movies> [<i>].bink_name)
				previous_movie_array = <movies>
				title = <title>}
			removeparameter rgba
		else
			<pad_choose_script> = nullscript
			<rgba> = [70 70 70 240]
		endif
		add_cas_menu_item {
			text = (<movies> [<i>].name)
			pad_choose_script = <pad_choose_script>
			pad_choose_params = <pad_choose_params>
			rgba = <rgba>
		}
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	add_cas_menu_item {
		text = "DONE"
		pad_choose_script = ui_create_mainmovies
	}
	cas_menu_finish
endscript

script ui_play_movie 
	setspawninstancelimits max = 1 management = ignore_spawn_request
	change ui_mainmovies_playing_movie = 1
	pushsoundbussparams
	setsoundbussparams $no_music_at_all_bussset time = 0.3
	enableusermusic disable
	ui_create_background
	generic_ui_destroy
	pause_menu_fmv_kill
	wait 2 gameframes
	playmovie movie = <movie> textureslot = 0 no_looping no_hold
	createscreenelement {
		type = containerelement
		id = ui_mainmovie_wait_anchor
		event_handlers = [
			{pad_choose ui_finish_mainmovie}
			{pad_start ui_finish_mainmovie}
		]
	}
	spawnscriptnow {
		ui_mainmovies_wait_for_movie
		params = {
			previous_movie_array = <previous_movie_array>
			title = <title>
		}
	}
	wait 1 second
	if screenelementexists id = ui_mainmovie_wait_anchor
		launchevent type = focus target = ui_mainmovie_wait_anchor
	endif
endscript

script ui_finish_mainmovie 
	printf \{'ui_finish_mainmovie'}
	if ismovieplaying \{textureslot = 0}
		killmovie \{textureslot = 0}
	endif
endscript

script ui_mainmovies_wait_for_movie 
	printf 'ui_mainmovies_wait_for_movie'
	begin
	if NOT ismovieplaying textureslot = 0
		break
	endif
	wait 1 gameframe
	repeat
	printf 'ATTRACT DONE!'
	if screenelementexists id = ui_mainmovie_wait_anchor
		printf "Destroying wait anchor"
		destroyscreenelement id = ui_mainmovie_wait_anchor
	endif
	enableusermusic
	popsoundbussparams
	wait 1 gameframe
	killallmovies blocking
	pause_menu_fmv_play
	ui_destroy_background
	change ui_mainmovies_playing_movie = 0
	if gotparam previous_movie_array
		ui_create_movies_list movies = <previous_movie_array> title = <title>
	else
		ui_create_mainmovies
	endif
endscript

script ui_credits_movies 
	make_cas_menu \{title = "CREDITS"
		pad_back_script = ui_create_mainmovies
		pausemenu}
	add_cas_menu_item \{text = "DONE"
		pad_choose_script = ui_create_mainmovies}
	cas_menu_finish
endscript

script ui_start_credits 
	if gotparam return_to_game
		begin
		if IsScreenClear
			break
		endif
		wait 2 gameframes
		repeat
		root_window :settags menu_state = on
		ui_change_state state = uistate_gameplay
		goal_presentation_hold_skater
		hide_all_hud_items
		do_autosave immediate suspend_ui
	endif
	change ui_mainmovies_playing_movie = 1
	pushsoundbussparams
	setsoundbussparams $no_music_at_all_bussset time = 0.3
	enableusermusic disable
	ui_create_background
	generic_ui_destroy
	pause_menu_fmv_kill
	createscreenelement {
		type = containerelement
		id = ui_mainmovie_wait_anchor
		parent = root_window
		pos = (0.0, 0.0)
		event_handlers = [
			{pad_choose ui_finish_credits params = {return_to_game = <return_to_game>}}
			{pad_start ui_finish_credits params = {return_to_game = <return_to_game>}}
		]
	}
	assignalias id = ui_mainmovie_wait_anchor alias = current_menu_anchor
	playmovie movie = 'SK9_Credits' textureslot = 0 texturepri = -100 no_looping no_hold
	runscriptonscreenelement {
		id = ui_mainmovie_wait_anchor
		ui_play_credits
		params = {movie = <movie> return_to_game = <return_to_game>}
	}
	wait 1 second
	if screenelementexists id = ui_mainmovie_wait_anchor
		launchevent type = focus target = ui_mainmovie_wait_anchor
	endif
endscript

script ui_play_credits 
	setspawninstancelimits max = 1 management = ignore_spawn_request
	createscreenelement {
		type = containerelement
		parent = ui_mainmovie_wait_anchor
		id = ui_mainmovie_credits_container
		z_priority = 100
		pos = (0.0, 0.0)
		just = [left top]
		dims = (1280.0, 720.0)
	}
	time = 6.66
	getarraysize $ui_credits_array
	printstruct <...>
	<i> = 0
	begin
	credit = ($ui_credits_array [<i>])
	scale = (1.0, 0.9)
	rgba = [200 200 200 255]
	if (structurecontains structure = credit name = header)
		scale = (<scale> * 1.1)
		rgba = ($goal_ui_scheme.main)
	elseif (structurecontains structure = credit name = subheader)
		scale = (<scale> * 1.1)
		rgba = ($goal_ui_scheme.main)
	endif
	createscreenelement {
		type = textblockelement
		parent = ui_mainmovie_credits_container
		font = text_a1
		pos = (150.0, 720.0)
		dims = (1024.0, 0.0)
		allow_expansion
		just = [left top]
		internal_just = [left top]
		text = (<credit>.text)
		scale = <scale>
		rgba = <rgba>
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_off = (2.0, 2.0)
	}
	getscreenelementdims id = <id>
	runscriptonscreenelement id = <id> ui_credits_morph params = {time = <time>}
	wait 5 gameframes
	begin
	getscreenelementposition id = <id> absolute
	if ((<screenelementpos> [1]) < (720 - <height>))
		break
	endif
	wait 1 gameframe
	repeat
	<i> = (<i> + 1)
	repeat <array_size>
	wait <time> seconds ignoreslomo
	begin
	if NOT ismovieplaying textureslot = 0
		break
	endif
	wait 1 gameframe
	repeat
	spawnscriptnow ui_finish_credits params = {return_to_game = <return_to_game>}
endscript

script ui_credits_morph \{time = 5.0}
	gettags
	domorph pos = (150.0, -300.0) time = <time>
	die
endscript

script ui_finish_credits 
	setspawninstancelimits max = 1 management = ignore_spawn_request
	if screenelementexists id = ui_mainmovie_wait_anchor
		printf "Destroying wait anchor"
		destroyscreenelement id = ui_mainmovie_wait_anchor
	endif
	enableusermusic
	popsoundbussparams
	wait 1 gameframe
	killallmovies blocking
	if NOT gotparam return_to_game
		pause_menu_fmv_play
	endif
	ui_destroy_background
	change ui_mainmovies_playing_movie = 0
	if gotparam return_to_game
		printf "return to game" channel = ui
		show_all_hud_items
		goal_presentation_unhold_skater
		root_window :settags menu_state = off
	else
		if gotparam previous_movie_array
			ui_create_movies_list movies = <previous_movie_array> title = <title>
		else
			ui_create_mainmovies
		endif
	endif
endscript
