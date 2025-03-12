g_webpresence_json_file_product = gh6
g_webpresence_json_file_version_name = qs(0x5c909f21)
g_webpresence_json_file_version_value = 1
g_webpresence_json_file_playhistory_name = qs(0x38131a35)
g_webpresence_json_file_playhistory_max_limit = 5
g_webpresence_json_initial_structure = {
	version = 1
	product = qs(0x03ac90f0)
	platform = qs(0x03ac90f0)
	gamertag = qs(0x03ac90f0)
	playhistory = [
	]
}
g_webpresence_json_token_dictionary_array = [
	{
		checksum = emptystring
		widestring = qs(0x03ac90f0)
	}
	{
		checksum = version
		widestring = qs(0x5c909f21)
	}
	{
		checksum = product
		widestring = qs(0xf613650d)
	}
	{
		checksum = platform
		widestring = qs(0x9b0e9a16)
	}
	{
		checksum = gamertag
		widestring = qs(0xd3ef5683)
	}
	{
		checksum = playhistory
		widestring = qs(0x38131a35)
	}
	{
		checksum = unixtime
		widestring = qs(0x346d0d57)
	}
	{
		checksum = structtime
		widestring = qs(0x73c67041)
	}
	{
		checksum = stringtime
		widestring = qs(0x6db7e605)
	}
	{
		checksum = timestamp
		widestring = qs(0x8ad0003f)
	}
	{
		checksum = songtitle
		widestring = qs(0x7145f521)
	}
	{
		checksum = songlength
		widestring = qs(0x935d15cc)
	}
	{
		checksum = gametype
		widestring = qs(0x738d1ea2)
	}
	{
		checksum = numplayers
		widestring = qs(0x6d5bae88)
	}
	{
		checksum = instrument
		widestring = qs(0xe6713e02)
	}
	{
		checksum = difficulty
		widestring = qs(0xffcd233f)
	}
	{
		checksum = score
		widestring = qs(0x75d7f540)
	}
	{
		checksum = stars
		widestring = qs(0x253b19d5)
	}
	{
		checksum = totalawardpoints
		widestring = qs(0x8d5d05ed)
	}
	{
		checksum = challenges
		widestring = qs(0x12f4133a)
	}
	{
		checksum = year
		widestring = qs(0x4c685673)
	}
	{
		checksum = month
		widestring = qs(0x4086a360)
	}
	{
		checksum = day
		widestring = qs(0x2f6d3978)
	}
	{
		checksum = hour
		widestring = qs(0x82998468)
	}
	{
		checksum = minute
		widestring = qs(0xee250d54)
	}
	{
		checksum = second
		widestring = qs(0x0ec761ae)
	}
	{
		checksum = millisecond
		widestring = qs(0xe53cd485)
	}
	{
		checksum = practice
		widestring = qs(0x3bee06d2)
	}
	{
		checksum = freeplay
		widestring = qs(0x18b9100f)
	}
	{
		checksum = quickplay
		widestring = qs(0x4e077ebc)
	}
	{
		checksum = competitive
		widestring = qs(0x6c3a6355)
	}
	{
		checksum = career
		widestring = qs(0xd1270c2d)
	}
	{
		checksum = tutorial
		widestring = qs(0xb931e0b2)
	}
	{
		checksum = name
		widestring = qs(0xeed21779)
	}
	{
		checksum = grade
		widestring = qs(0xa4fb8c54)
	}
	{
		checksum = gh6
		widestring = qs(0xa3105796)
	}
	{
		checksum = xbox360
		widestring = qs(0x53812e43)
	}
	{
		checksum = ps3
		widestring = qs(0x47ac416e)
	}
	{
		checksum = guitar
		widestring = qs(0x9a5d7dd4)
	}
	{
		checksum = bass
		widestring = qs(0x1523974d)
	}
	{
		checksum = vocals
		widestring = qs(0x14c6ab1a)
	}
	{
		checksum = drum
		widestring = qs(0xa7248efc)
	}
	{
		checksum = beginner
		widestring = qs(0x719f78bb)
	}
	{
		checksum = easy
		widestring = qs(0xe50976de)
	}
	{
		checksum = medium
		widestring = qs(0x61a8de9f)
	}
	{
		checksum = hard
		widestring = qs(0x39dc6876)
	}
	{
		checksum = expert
		widestring = qs(0x3c10cc32)
	}
	{
		checksum = expert_plus
		widestring = qs(0x09d21b93)
	}
]
g_webpresence_init = 0

script webpresence_init 
	webpresence \{func = trace
		msg = 'webpresence_init : Called!'}
	err = 0
	if ($g_webpresence_init = 0)
		webpresence \{func = trace
			msg = 'webpresence_init : Initializing...'}
		if NOT webpresence \{func = setupdictionary
				dictionary = g_webpresence_json_token_dictionary_array}
			webpresence \{func = trace
				msg = 'webpresence_init : Error, cannot setup dictionary!'}
			err = 1
		endif
		if NOT webpresence func = setjsonfileversionvarname name = ($g_webpresence_json_file_version_name)
			webpresence \{func = trace
				msg = 'webpresence_init : Error, cannot setup version var name!'}
			err = 1
		endif
		if NOT webpresence func = setjsonfileversionvarvalue value = ($g_webpresence_json_file_version_value)
			webpresence \{func = trace
				msg = 'webpresence_init : Error, cannot setup version var value!'}
			err = 1
		endif
		if NOT webpresence func = setjsonfileplayhistoryvarname name = ($g_webpresence_json_file_playhistory_name)
			webpresence \{func = trace
				msg = 'webpresence_init : Error, cannot setup play history var name!'}
			err = 1
		endif
		if NOT webpresence func = setjsonfileplayhistorymaxlimit value = ($g_webpresence_json_file_playhistory_max_limit)
			webpresence \{func = trace
				msg = 'webpresence_init : Error, cannot setup play history var value!'}
			err = 1
		endif
		if NOT webpresence \{func = setupinitialstructure
				initialstructure = g_webpresence_json_initial_structure}
			webpresence \{func = trace
				msg = 'webpresence_init : Error, cannot setup initial structure!'}
			err = 1
		endif
		if (<err> = 0)
			change \{g_webpresence_init = 1}
		endif
	endif
	if (<err> = 1)
		webpresence \{func = trace
			msg = 'webpresence_init : Done, failure!'}
		webpresence \{func = reset}
		return \{false}
	endif
	webpresence \{func = trace
		msg = 'webpresence_init : Done, success!'}
	return \{true}
endscript

script webpresence_uninit 
	webpresence \{func = trace
		msg = 'webpresence_uninit : Called!'}
	if ($g_webpresence_init = 1)
		webpresence \{func = trace
			msg = 'webpresence_uninit : Uninitializing...'}
		webpresence \{func = trace
			msg = 'webpresence_uninit : Done!'}
		webpresence \{func = reset}
		change \{g_webpresence_init = 0}
	else
		webpresence \{func = trace
			msg = 'webpresence_uninit : Done!'}
	endif
endscript

script webpresence_setup_play_records 
	webpresence \{func = trace
		msg = 'webpresence_setup_play_records : Called!'}
	if ($g_webpresence_init = 0)
		webpresence \{func = trace
			msg = 'webpresence_setup_play_records : Bailing because we are not initialized!'}
		return
	endif
	getnumplayersingame \{local
		out = num_local_players}
	printf qs(0x7260e148) d = ($game_mode) e = (<num_local_players>)
	webpresence \{func = markallusersnotfound}
	if ($calibrate_lag_enabled = 0)
		if (($game_mode = quickplay) || ($game_mode = competitive) || ($game_mode = career))
			updateremotetimestamp = 0
			getnumplayersingame \{local
				out = x}
			if (<x> > 0)
				getfirstplayer \{local}
				begin
				getplayerinfo <player> controller
				printf qs(0x136326ea) d = (<controller>)
				if checkforsignin controller_index = <controller> dont_set_primary
					printf \{qs(0x69d5c27a)}
					if NOT webpresence func = setupuser controller_index = <controller> markfound = 1 downloaddataifneeded = 1
					else
						updateremotetimestamp = 1
					endif
				else
					printf \{qs(0x830156ba)}
				endif
				getnextplayer player = <player> local
				repeat <x>
			endif
			if (<updateremotetimestamp> = 1)
				if NOT webpresence \{func = updateremotetimestamp}
				endif
			endif
		endif
	endif
	webpresence \{func = teardownallnotfoundusers}
	webpresence \{func = trace
		msg = 'webpresence_setup_play_records : Done!'}
endscript

script webpresence_update_play_records 
	webpresence \{func = trace
		msg = 'webpresence_update_play_records : Called!'}
	if ($g_webpresence_init = 0)
		webpresence \{func = trace
			msg = 'webpresence_update_play_records : Bailing because we are not initialized!'}
		return
	endif
	if ($calibrate_lag_enabled = 0)
		if (($game_mode = quickplay) || ($game_mode = competitive) || ($game_mode = career))
			getnumplayersingame \{local
				out = x}
			if (<x> > 0)
				product = ($g_webpresence_json_file_product)
				platform = xbox360
				if isps3
					platform = ps3
				elseif isxenon
					platform = xbox360
				else
					platform = emptystring
				endif
				getnumplayersingame
				getsongtimems
				gamemode_gettype
				playlist_getcurrentsong
				get_song_struct song = <current_song>
				if structurecontains structure = <song_struct> name = title
					songtitle = (<song_struct>.title)
					if webpresence \{func = getremotetimestamp
							unixtime = unixtime
							structtime = structtime
							stringtime = stringtime}
						gottime = 1
					else
						gottime = 0
						unixtime = 0
						structtime = {year = 0 month = 0 day = 0 hour = 0 minute = 0 second = 0 millisecond = 0}
						stringtime = ''
					endif
					getfirstplayer \{local}
					begin
					getplayerinfo <player> controller
					getsavegamefromcontroller controller = <controller>
					if checkforsignin controller_index = <controller> dont_set_primary
						if webpresence func = doesuserhavejsondoc controller_index = <controller>
							getplayerinfo <player> gamertag
							getplayerinfo <player> part
							getplayerinfo <player> difficulty
							getplayerinfo <player> score
							getplayerinfo <player> stars
							converttointeger float_value = <score>
							score_int = (<integer_value>)
							challenges = []
							totalawardpoints = 0
							gman_getgoalsbyplayer player = <player>
							if (0 != <goals_by_player_size>)
								index = 0
								begin
								challenge_instance_id = (<goals_by_player> [<index>])
								gman_challengemanagerfunc goal = quickplay tool = challenges func = get_challenge_score params = {challenge_id = <challenge_instance_id>}
								casttointeger \{score_value}
								quickplay_get_grade goal_id = <challenge_instance_id>
								goal_name = (<goal_strings_by_player> [<index>])
								extendcrc <goal_name> '_info' out = goal_struct
								goal_string = ($<goal_struct>.name)
								quickplay_do_challenge_score_update {
									challenge_instance_id = <challenge_instance_id>
									goal_name = <goal_name>
									song = <current_song>
									player = <player>
									savegame = <savegame>
									save = 0
								}
								item = {name = <goal_string> score = <score_value> grade = <pending_grade>}
								addarrayelement array = <challenges> element = <item>
								<challenges> = <array>
								index = (<index> + 1)
								repeat <goals_by_player_size>
							endif
							webpresence func = setrootvar controller_index = <controller> varname = product varvalue = <product>
							webpresence func = setrootvar controller_index = <controller> varname = platform varvalue = <platform>
							webpresence func = setrootvar controller_index = <controller> varname = gamertag varvalue = ($<gamertag>)
							if (<gottime> != 0)
								playrecord = {
									timestamp = <structtime>
									songtitle = <songtitle>
									songlength = <time>
									gametype = <type>
									numplayers = <num_players>
									instrument = <part>
									difficulty = <difficulty>
									score = <score_int>
									stars = <stars>
									totalawardpoints = <total_award_points>
									challenges = <challenges>
								}
							else
								playrecord = {
									songtitle = <songtitle>
									songlength = <time>
									gametype = <type>
									numplayers = <num_players>
									instrument = <part>
									difficulty = <difficulty>
									score = <score_int>
									stars = <stars>
									totalawardpoints = <total_award_points>
									challenges = <challenges>
								}
							endif
							if NOT webpresence func = addplayrecord controller_index = <controller> playrecord = <playrecord>
							else
								if NOT webpresence func = uploaddata controller_index = <controller>
								else
								endif
							endif
						endif
					endif
					getnextplayer player = <player> local
					repeat <x>
				endif
			endif
		endif
	endif
	webpresence \{func = trace
		msg = 'webpresence_update_play_records : Done!'}
endscript

script webpresence_dump_user \{controller_index = !i1768515945}
	webpresence func = teardownuser controller_index = <controller_index>
endscript

script webpresence_filedump 
	webpresence \{func = filedump}
endscript

script webpresence_filedumpclose 
	webpresence \{func = filedumpclose}
endscript

script webpresence_test 
	spawnscript \{webpresence_test2}
endscript

script webpresence_test2 
	webpresence \{func = trace
		msg = 'webpresence_test : Started!'}
	webpresence_init
	begin
	webpresence \{func = trace
		msg = 'webpresence_test : ssssssssssssssssssssssss'}
	if checkforsignin controller_index = ($primary_controller) dont_set_primary
		break
	endif
	wait \{0.1
		seconds}
	repeat
	webpresence \{func = trace
		msg = 'webpresence_test : CONTROLLER IS SIGNED IN!'}
	begin
	webpresence \{func = trace
		msg = 'webpresence_test : wwwwwwwwwwwwwwwwwwwwwwwww'}
	if webpresence func = islobbyready controller_index = ($primary_controller)
		break
	endif
	wait \{0.1
		seconds}
	repeat
	webpresence \{func = trace
		msg = 'webpresence_test : LOBBY READY!'}
	webpresence func = setupuser controller_index = ($primary_controller) downloaddata = 1
	product = ($g_webpresence_json_file_product)
	platform = xbox360
	if isps3
		platform = ps3
	elseif isxenon
		platform = xbox360
	else
		platform = emptystring
	endif
	gamertag = qs(0x9c7d1a4d)
	begin
	if NOT webpresence func = isuserbusy controller_index = ($primary_controller)
		break
	endif
	wait \{0.1
		seconds}
	repeat
	webpresence func = setrootvar controller_index = ($primary_controller) varname = product varvalue = <product>
	webpresence func = setrootvar controller_index = ($primary_controller) varname = platform varvalue = <platform>
	webpresence func = setrootvar controller_index = ($primary_controller) varname = gamertag varvalue = <gamertag>
	playrecord = {songtitle = qs(0x5325a1e0) instrument = guitar difficulty = easy score = 1 stars = 1 challenges = [{name = qs(0x767c0fd0) score = 1 grade = 1} , {name = qs(0x5d515c13) score = 2 grade = 20}]}
	webpresence func = addplayrecord controller_index = ($primary_controller) playrecord = <playrecord> uploaddata = 1
	begin
	if NOT webpresence func = isuserbusy controller_index = ($primary_controller)
		break
	endif
	wait \{0.1
		seconds}
	repeat
	webpresence func = setrootvar controller_index = ($primary_controller) varname = product varvalue = <product>
	webpresence func = setrootvar controller_index = ($primary_controller) varname = platform varvalue = <platform>
	webpresence func = setrootvar controller_index = ($primary_controller) varname = gamertag varvalue = <gamertag>
	playrecord = {songtitle = qs(0x7808f223) instrument = bass difficulty = medium score = 2 stars = 2 challenges = [{name = qs(0x767c0fd0) score = 1 grade = 1} , {name = qs(0x5d515c13) score = 2 grade = 20}]}
	webpresence func = addplayrecord controller_index = ($primary_controller) playrecord = <playrecord> uploaddata = 1
	begin
	if NOT webpresence func = isuserbusy controller_index = ($primary_controller)
		break
	endif
	wait \{0.1
		seconds}
	repeat
	webpresence func = setrootvar controller_index = ($primary_controller) varname = product varvalue = <product>
	webpresence func = setrootvar controller_index = ($primary_controller) varname = platform varvalue = <platform>
	webpresence func = setrootvar controller_index = ($primary_controller) varname = gamertag varvalue = <gamertag>
	playrecord = {songtitle = qs(0x6113c362) instrument = drum difficulty = hard score = 3 stars = 3 challenges = [{name = qs(0x767c0fd0) score = 1 grade = 1} , {name = qs(0x5d515c13) score = 2 grade = 20}]}
	webpresence func = addplayrecord controller_index = ($primary_controller) playrecord = <playrecord> uploaddata = 1
	begin
	if NOT webpresence func = isuserbusy controller_index = ($primary_controller)
		break
	endif
	wait \{0.1
		seconds}
	repeat
endscript

script webpresence_debugoverlay 
	spawnscript \{webpresence_debugoverlay_create}
endscript

script webpresence_debugoverlay_create 
	webpresence_debugoverlay_destroy
	createscreenelement \{type = containerelement
		parent = root_window
		pos = (50.0, 30.0)
		just = [
			left
			top
		]
		id = webpresence_debugoverlay_root_id}
	createscreenelement \{type = spriteelement
		parent = webpresence_debugoverlay_root_id
		texture = white
		dims = (1180.0, 660.0)
		rgba = [
			0
			0
			0
			0
		]
		pos = (0.0, 0.0)
		z_priority = 10000
		id = webpresence_debugoverlay_background_id}
	createscreenelement \{type = textelement
		parent = webpresence_debugoverlay_root_id
		font = fontgrid_text_a1
		text = qs(0xc3ce3453)
		scale = (0.5, 0.5)
		just = [
			left
			top
		]
		pos = (0.0, 50.0)
		z_priority = 10001
		rgba = [
			255
			255
			255
			255
		]
		id = webpresence_debugoverlay_title_id}
	createscreenelement \{type = textelement
		parent = webpresence_debugoverlay_root_id
		font = fontgrid_text_a1
		text = qs(0x03ac90f0)
		scale = (0.5, 0.5)
		just = [
			left
			top
		]
		pos = (0.0, 100.0)
		dims = (1180.0, 660.0)
		z_priority = 10001
		rgba = [
			255
			255
			255
			255
		]
		id = webpresence_debugoverlay_text1_id
		single_line = false}
	runscriptonscreenelement \{id = webpresence_debugoverlay_root_id
		webpresence_debugoverlay_task}
	webpresence \{func = debugoverlayenable}
endscript

script webpresence_debugoverlay_destroy 
	if screenelementexists \{id = webpresence_debugoverlay_root_id}
		destroyscreenelement \{id = webpresence_debugoverlay_root_id}
	endif
	webpresence \{func = debugoverlaydisable}
endscript

script webpresence_debugoverlay_loop 
	begin
	if screenelementexists \{id = webpresence_debugoverlay_root_id}
		webpresence_debugoverlay_root_id :se_setprops \{alpha = 1.0
			time = 0.5}
		if webpresence \{func = getdebugoverlayinfo}
		else
			<text> = qs(0x03ac90f0)
		endif
		if NOT gotparam \{text}
			<text> = qs(0x03ac90f0)
		endif
		if screenelementexists \{id = webpresence_debugoverlay_text1_id}
			webpresence_debugoverlay_text1_id :se_setprops text = <text>
		endif
	endif
	wait \{0.1
		seconds}
	repeat
endscript

script webpresence_debugoverlay_task 
	webpresence_debugoverlay_loop
	webpresence_debugoverlay_destroy
endscript
