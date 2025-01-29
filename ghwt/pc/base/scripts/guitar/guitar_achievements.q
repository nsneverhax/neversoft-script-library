gstar_power_triggered = 0
achievement_scripts = [
	{
		name = one_time_solo_artist
		scr = achievements_one_time_solo_artist
	}
	{
		name = band_on_a_mission
		scr = achievements_band_on_a_mission
	}
	{
		name = solo_artist
		scr = achievements_solo_artist
	}
	{
		name = learning_the_ropes
		scr = achievements_learning_the_ropes
	}
	{
		name = stix
		scr = achievements_stix
	}
	{
		name = yodeler
		scr = achievements_yodeler
	}
	{
		name = pick_and_axe
		scr = achievements_pick_and_axe
	}
	{
		name = played_bass
		scr = achievements_played_bass
	}
	{
		name = first_of_many
		scr = achievements_first_of_many
	}
	{
		name = bling_bling
		scr = achievements_bling_bling
	}
	{
		name = easy_there
		scr = achievements_easy_there
	}
	{
		name = medium_musician
		scr = achievements_medium_musician
	}
	{
		name = hardcore
		scr = achievements_hardcore
	}
	{
		name = hall_of_famer
		scr = achievements_hall_of_famer
	}
	{
		name = jack_of_all_trades
		scr = achievements_jack_of_all_trades
	}
	{
		name = one_man_band
		scr = achievements_one_man_band
	}
	{
		name = 50_note_posse
		scr = achievements_50_note_posse
	}
	{
		name = 121_jigowatts
		scr = achievements_121_jigowatts
	}
	{
		name = top_of_the_charts
		scr = achievements_top_of_the_charts
	}
	{
		name = should_we_stick_together
		scr = achievements_should_we_stick_together
	}
	{
		name = guitarists_coat_tails_jigowatts
		scr = achievements_guitarists_coat_tails
	}
	{
		name = vocalists_coat_tails
		scr = achievements_vocalists_coat_tails
	}
	{
		name = solid_gold_rockstars
		scr = achievements_solid_gold_rockstars
	}
	{
		name = platinum_rockstars
		scr = achievements_platinum_rockstars
	}
	{
		name = youre_a_tool
		scr = achievements_youre_a_tool
	}
	{
		name = heavy_metall
		scr = achievements_heavy_metall
	}
	{
		name = super_group_unite
		scr = achievements_super_group_unite
	}
	{
		name = feeding_the_beast
		scr = achievements_feeding_the_beast
	}
	{
		name = this_is_totally_legal
		scr = achievements_this_is_totally_legal
	}
	{
		name = mine_is_bigger_than_yours
		scr = achievements_mine_is_bigger_than_yours
	}
	{
		name = a_pair_beats_a_pair
		scr = achievements_a_pair_beats_a_pair
	}
	{
		name = survival_of_the_fittest
		scr = achievements_survival_of_the_fittest
	}
	{
		name = rock_maiden
		scr = achievements_rock_maiden
	}
	{
		name = warrior_of_rock
		scr = achievements_warrior_of_rock
	}
	{
		name = stamp_of_approval
		scr = achievements_stamp_of_approval
	}
	{
		name = one_of_a_kind_axe
		scr = achievements_one_of_a_kind_axe
	}
	{
		name = custom_beats
		scr = achievements_custom_beats
	}
	{
		name = inked
		scr = achievements_inked
	}
	{
		name = bad_to_the_bone
		scr = achievements_bad_to_the_bone
	}
	{
		name = shiny_metal_thingy
		scr = achievements_shiny_metal_thingy
	}
	{
		name = pumpkin_smasher
		scr = achievements_pumpkin_smasher
	}
	{
		name = wylde_man
		scr = achievements_wylde_man
	}
	{
		name = dont_blink
		scr = achievements_dont_blink
	}
	{
		name = the_experience
		scr = achievements_the_experience
	}
	{
		name = motorcity_madman
		scr = achievements_motorcity_madman
	}
	{
		name = leading_lady
		scr = achievements_leading_lady
	}
	{
		name = the_dark_prince
		scr = achievements_the_dark_prince
	}
	{
		name = muse_to_my_ears
		scr = achievements_muse_to_my_ears
	}
	{
		name = mike_checka
		scr = achievements_mike_checka
	}
	{
		name = get_your_boogie_on
		scr = achievements_get_your_boogie_on
	}
	{
		name = axe_museum
		scr = achievements_axe_museum
	}
]

script achievements_update 
	getarraysize \{$achievement_scripts}
	<i> = 0
	begin
	<scr> = ($achievement_scripts [<i>].scr)
	<scr>
	<i> = (<i> + 1)
	repeat <array_size>
	change \{achievements_early_quit_flag = 0}
endscript
achievements_songwonflag = 0
achievements_newgigwonflag = 0
achievements_50_note_posse_flag = 0
achievements_121_jigowatts_flag = 0
achievements_super_group_unite_flag = 0
achievements_creating_character = 0
achievements_modified_logo = 0
achievements_early_quit_flag = 0

script achievements_resetglobals 
	change \{achievements_songwonflag = 0}
	change \{achievements_newgigwonflag = 0}
	change \{achievements_50_note_posse_flag = 0}
	change \{achievements_121_jigowatts_flag = 0}
	change \{achievements_super_group_unite_flag = 0}
	change \{achievements_creating_character = 0}
	change \{achievements_modified_logo = 0}
	change \{achievements_early_quit_flag = 0}
endscript

script achievements_issongwon 
	if ($achievements_songwonflag = 1)
		return \{true}
	endif
	return \{false}
endscript

script achievements_isnewgigwon 
	if ($achievements_newgigwonflag = 1)
		return \{true}
	endif
	return \{false}
endscript

script achievements_areanygigswon \{part = 'guitar'}
	formattext checksumname = career_part_struct 'gh4_career_%p_songs' p = <part>
	<total_gigs> = ($<career_part_struct>.num_tiers)
	<i> = 1
	begin
	formattext checksumname = career_part_gig 'career_%p_gig%n' p = <part> n = <i>
	getglobaltags <career_part_gig>
	if (<completed> = 1)
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <total_gigs>
	return \{false}
endscript

script achievements_numgigswon \{part = 'guitar'}
	formattext checksumname = player_status 'player%n_status' n = <player>
	get_savegame_from_controller controller = ($<player_status>.controller)
	formattext checksumname = career_part_struct 'gh4_career_%p_songs' p = <part>
	<total_gigs> = ($<career_part_struct>.num_tiers)
	<num_crucial_gigs> = 0
	<num_gigs_won> = 0
	<i> = 1
	begin
	formattext checksumname = career_part_gig 'career_%p_gig%n' p = <part> n = <i>
	getglobaltags <career_part_gig> savegame = <savegame>
	formattext checksumname = tier 'tier%n' n = <i>
	if NOT structurecontains structure = ($<career_part_struct>.<tier>) paytoplay
		if NOT structurecontains structure = ($<career_part_struct>.<tier>) debug_gig
			if NOT structurecontains structure = ($<career_part_struct>.<tier>) createagig
				<num_crucial_gigs> = (<num_crucial_gigs> + 1)
				if (<completed> = 1)
					<num_gigs_won> = (<num_gigs_won> + 1)
				endif
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <total_gigs>
	return num_gigs_won = <num_gigs_won> total_gigs = <num_crucial_gigs>
endscript

script achievements_numgigswonondiff \{part = 'guitar'
		diff = expert}
	formattext checksumname = player_status 'player%n_status' n = <player>
	get_savegame_from_controller controller = ($<player_status>.controller)
	formattext checksumname = career_part_struct 'gh4_career_%p_songs' p = <part>
	<total_gigs> = ($<career_part_struct>.num_tiers)
	<num_crucial_gigs> = 0
	<num_gigs_won> = 0
	<diff_array> = []
	switch (<diff>)
		case easy
		<diff_array> = [easy medium hard expert]
		case medium
		<diff_array> = [medium hard expert]
		case hard
		<diff_array> = [hard expert]
		case expert
		<diff_array> = [expert]
		default
		<diff_array> = [easy]
	endswitch
	<i> = 1
	begin
	formattext checksumname = career_part_gig 'career_%p_gig%n' p = <part> n = <i>
	getglobaltags <career_part_gig> savegame = <savegame>
	formattext checksumname = tier 'tier%n' n = <i>
	if NOT structurecontains structure = ($<career_part_struct>.<tier>) paytoplay
		if NOT structurecontains structure = ($<career_part_struct>.<tier>) debug_gig
			if NOT structurecontains structure = ($<career_part_struct>.<tier>) createagig
				<num_crucial_gigs> = (<num_crucial_gigs> + 1)
				getarraysize ($<career_part_struct>.<tier>.songs)
				<num_required> = <array_size>
				<song_size> = <array_size>
				<array_entry> = 0
				begin
				getarraysize <diff_array>
				<diff_size> = <array_size>
				<diff_index> = 0
				begin
				<diff> = (<diff_array> [<diff_index>])
				format_globaltag_song_checksum part = ($<career_part_struct>.part) song = ($<career_part_struct>.<tier>.songs [<array_entry>]) difficulty = <diff>
				getglobaltags <song_checksum> params = stars
				if (<stars> > 2)
					<num_required> = (<num_required> - 1)
					break
				endif
				<diff_index> = (<diff_index> + 1)
				repeat <diff_size>
				<array_entry> = (<array_entry> + 1)
				repeat <song_size>
				if (<num_required> <= 0)
					<num_gigs_won> = (<num_gigs_won> + 1)
				endif
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <total_gigs>
	return num_gigs_won = <num_gigs_won> total_gigs = <num_crucial_gigs>
endscript

script achievements_careercomplete \{part = 'guitar'
		player = 1}
	getplayerinfo <player> bot_play
	if (<bot_play> = 1)
		return \{complete = 0}
	endif
	if NOT iswinport
		if isxenon
			getplayerinfo <player> controller
			if NOT checkforsignin local controller_index = <controller>
				return \{complete = 0}
			endif
		endif
	endif
	if gotparam \{diff}
		achievements_numgigswonondiff part = <part> diff = <diff> player = <player>
	else
		achievements_numgigswon part = <part> player = <player>
	endif
	if (<num_gigs_won> >= <total_gigs>)
		return \{complete = 1}
	endif
	return \{complete = 0}
endscript

script achievements_played_bass 
	printf \{'Achievements_PLAYED_BASS'}
	if NOT achievements_issongwon
		return \{false}
	endif
	if ($game_mode = tutorial ||
			$game_mode = training)
		return
	endif
	getplayerinfo \{1
		part}
	if (<part> = bass)
		setglobaltags \{achievement_info
			params = {
				performed_as_bassist = 1
			}}
	endif
endscript

script achievements_getpartstring 
	switch (<part>)
		case guitar
		return \{part_string = 'guitar'}
		case bass
		return \{part_string = 'bass'}
		case drum
		return \{part_string = 'drum'}
		case vocals
		return \{part_string = 'vocals'}
		case none
		return \{part_string = 'none'}
		default
		return \{part_string = 'none'}
	endswitch
endscript

script achievements_awardplayer 
	getplayerinfo <player> bot_play
	if (<bot_play> = 1)
		return
	endif
	formattext checksumname = player_status 'player%n_status' n = <player>
	<controller> = ($<player_status>.controller)
	writeachievements achievement = <achievement> controller_id = <controller>
endscript

script achievements_awardband 
	gamemode_getnumplayersshown
	<player> = 1
	begin
	achievements_awardplayer achievement = <achievement> player = <player>
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_checkfor50noteposse 
	if ($achievements_50_note_posse_flag = 0 && ($game_mode = p4_career || $game_mode = p4_quickplay || $game_mode = p8_pro_faceoff))
		<four_way_streak> = 1
		<player> = 1
		begin
		getplayerinfo <player> current_run
		if (<current_run> < 50)
			<four_way_streak> = 0
			break
		endif
		<player> = (<player> + 1)
		repeat 4
		if (<four_way_streak> = 1)
			change \{achievements_50_note_posse_flag = 1}
		endif
	endif
endscript

script achievements_checkforsupergroupunite 
	if ($achievements_super_group_unite_flag = 0 && ($game_mode = p4_career || $game_mode = p4_quickplay || $game_mode = p8_pro_faceoff))
		<four_way_multiplier> = 1
		<player> = 1
		begin
		formattext checksumname = player_status 'player%n_status' n = <player>
		get_current_multiplier player_status = <player_status>
		if (<multiplier> < 8)
			<four_way_multiplier> = 0
			break
		endif
		<player> = (<player> + 1)
		repeat 4
		if (<four_way_multiplier> = 1)
			change \{achievements_super_group_unite_flag = 1}
		endif
	endif
endscript

script achievements_ischeatingautokick 
	if ($cheat_autokick != 1)
		return \{false}
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	if (<part> = drum)
		return \{true}
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
	return \{false}
endscript

script achievements_one_time_solo_artist 
	printf \{'Achievements_ONE_TIME_SOLO_ARTIST'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	gamemode_getnumplayers
	if (<num_players> = 1)
		achievements_awardplayer \{achievement = one_time_solo_artist
			player = 1}
	endif
endscript

script achievements_band_on_a_mission 
	printf \{'Achievements_BAND_ON_A_MISSION'}
	if NOT achievements_isnewgigwon
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		gamemode_getnumplayersshown
		<player> = 1
		begin
		getplayerinfo <player> bot_play
		getplayerinfo <player> is_local_client
		if ((<bot_play> = 0) && (<is_local_client> = 1))
			achievements_numgigswon part = 'band' player = <player>
			<half_gigs> = (<total_gigs> / 2)
			if (<num_gigs_won> > <half_gigs>)
				achievements_awardplayer achievement = band_on_a_mission player = <player>
			endif
		endif
		<player> = (<player> + 1)
		repeat <num_players_shown>
	else
		getplayerinfo \{1
			bot_play}
		if (<bot_play> = 0)
			getplayerinfo \{1
				part}
			achievements_getpartstring part = <part>
			achievements_numgigswon part = <part_string> player = 1
			<half_gigs> = (<total_gigs> / 2)
			if (<num_gigs_won> > <half_gigs>)
				achievements_awardplayer \{achievement = band_on_a_mission
					player = 1}
			endif
		endif
	endif
endscript

script achievements_solo_artist 
	printf \{'Achievements_SOLO_ARTIST'}
	if NOT achievements_isnewgigwon
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	getplayerinfo \{1
		part}
	achievements_getpartstring part = <part>
	achievements_careercomplete part = <part_string> player = 1
	if (<complete> = 1)
		achievements_awardplayer \{achievement = solo_artist
			player = 1}
	endif
endscript

script achievements_learning_the_ropes 
	printf \{'Achievements_LEARNING_THE_ROPES'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	getglobaltags \{training}
	if (<basic_lesson> = complete ||
			<star_power_lesson> = complete ||
			<advanced_techniques_lesson> = complete ||
			<new_features_lesson> = complete ||
			<drum_basic_lesson> = complete ||
			<drum_int_lesson> = complete ||
			<vocals_lesson> = complete ||
			<band_lesson> = complete ||
			<versus_lesson> = complete ||
			<rs_introduction_lesson> = complete ||
			<rs_lead_and_bass_lesson> = complete ||
			<rs_rhythm_lesson> = complete ||
			<rs_drums_lesson> = complete ||
			<rs_melody_lesson> = complete ||
			<rs_recording_lesson> = complete ||
			<rs_pro_guitar_lesson> = complete ||
			<rs_advanced_tools_lesson> = complete ||
			<rs_ghmix_editing_lesson> = complete ||
			<rs_ghmix_pro_techniques_tools_lesson> = complete)
		achievements_awardplayer \{achievement = learning_the_ropes
			player = 1}
	endif
endscript

script achievements_stix 
	printf \{'Achievements_STIX'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	if (<part> = drum)
		if (<player> = 1)
			setglobaltags \{achievement_info
				params = {
					performed_as_drummer = 1
				}}
		endif
		achievements_awardplayer achievement = stix player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_yodeler 
	printf \{'Achievements_YODELER'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	if (<part> = vocals)
		if (<player> = 1)
			setglobaltags \{achievement_info
				params = {
					performed_as_vocalist = 1
				}}
		endif
		achievements_awardplayer achievement = yodeler player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_pick_and_axe 
	printf \{'Achievements_PICK_AND_AXE'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	if (<part> = guitar)
		if (<player> = 1)
			setglobaltags \{achievement_info
				params = {
					performed_as_guitarist = 1
				}}
		endif
		achievements_awardplayer achievement = pick_and_axe player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_first_of_many 
	printf \{'Achievements_FIRST_OF_MANY'}
	if NOT achievements_isnewgigwon
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	achievements_awardband \{achievement = first_of_many}
endscript

script achievements_bling_bling 
	printf \{'Achievements_BLING_BLING'}
	getglobaltags \{band_info}
	if (<career_earnings> >= 1000000)
		achievements_awardband \{achievement = bling_bling}
	endif
endscript

script achievements_easy_there 
	printf \{'Achievements_EASY_THERE'}
	if NOT achievements_isnewgigwon
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		gamemode_getnumplayersshown
		<player> = 1
		begin
		achievements_careercomplete part = 'band' diff = easy player = <player>
		if (<complete> = 1)
			achievements_awardplayer achievement = easy_there player = <player>
		endif
		<player> = (<player> + 1)
		repeat <num_players_shown>
	else
		getplayerinfo \{1
			part}
		achievements_getpartstring part = <part>
		achievements_careercomplete part = <part_string> diff = easy player = 1
		if (<complete> = 1)
			achievements_awardplayer \{achievement = easy_there
				player = 1}
		endif
	endif
endscript

script achievements_medium_musician 
	printf \{'Achievements_MEDIUM_MUSICIAN'}
	if NOT achievements_isnewgigwon
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		gamemode_getnumplayersshown
		<player> = 1
		begin
		achievements_careercomplete part = 'band' diff = medium player = <player>
		if (<complete> = 1)
			achievements_awardplayer achievement = easy_there player = <player>
			achievements_awardplayer achievement = medium_musician player = <player>
		endif
		<player> = (<player> + 1)
		repeat <num_players_shown>
	else
		getplayerinfo \{1
			part}
		achievements_getpartstring part = <part>
		achievements_careercomplete part = <part_string> diff = medium player = 1
		if (<complete> = 1)
			achievements_awardplayer \{achievement = easy_there
				player = 1}
			achievements_awardplayer \{achievement = medium_musician
				player = 1}
		endif
	endif
endscript

script achievements_hardcore 
	printf \{'Achievements_HARDCORE'}
	if NOT achievements_isnewgigwon
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		gamemode_getnumplayersshown
		<player> = 1
		begin
		achievements_careercomplete part = 'band' diff = hard player = <player>
		if (<complete> = 1)
			achievements_awardplayer achievement = easy_there player = <player>
			achievements_awardplayer achievement = medium_musician player = <player>
			achievements_awardplayer achievement = hardcore player = <player>
		endif
		<player> = (<player> + 1)
		repeat <num_players_shown>
	else
		getplayerinfo \{1
			part}
		achievements_getpartstring part = <part>
		achievements_careercomplete part = <part_string> diff = hard player = 1
		if (<complete> = 1)
			achievements_awardplayer \{achievement = easy_there
				player = 1}
			achievements_awardplayer \{achievement = medium_musician
				player = 1}
			achievements_awardplayer \{achievement = hardcore
				player = 1}
		endif
	endif
endscript

script achievements_hall_of_famer 
	printf \{'Achievements_HALL_OF_FAMER'}
	if NOT achievements_isnewgigwon
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		gamemode_getnumplayersshown
		<player> = 1
		begin
		achievements_careercomplete part = 'band' diff = expert player = <player>
		if (<complete> = 1)
			achievements_awardplayer achievement = easy_there player = <player>
			achievements_awardplayer achievement = medium_musician player = <player>
			achievements_awardplayer achievement = hardcore player = <player>
			achievements_awardplayer achievement = hall_of_famer player = <player>
		endif
		<player> = (<player> + 1)
		repeat <num_players_shown>
	else
		getplayerinfo \{1
			part}
		achievements_getpartstring part = <part>
		achievements_careercomplete part = <part_string> diff = expert player = 1
		if (<complete> = 1)
			achievements_awardplayer \{achievement = easy_there
				player = 1}
			achievements_awardplayer \{achievement = medium_musician
				player = 1}
			achievements_awardplayer \{achievement = hardcore
				player = 1}
			achievements_awardplayer \{achievement = hall_of_famer
				player = 1}
		endif
	endif
endscript

script achievements_jack_of_all_trades 
	printf \{'Achievements_JACK_OF_ALL_TRADES'}
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	achievements_careercomplete \{part = 'guitar'
		player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_careercomplete \{part = 'bass'
		player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_careercomplete \{part = 'drum'
		player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_careercomplete \{part = 'vocals'
		player = 1}
	if (<complete> = 0)
		return
	endif
	achievements_awardplayer \{achievement = jack_of_all_trades
		player = 1}
endscript

script achievements_one_man_band 
	printf \{'Achievements_ONE_MAN_BAND'}
	if achievements_ischeatingautokick
		return
	endif
	getglobaltags \{achievement_info}
	if (<performed_as_guitarist> = 1 &&
			<performed_as_bassist> = 1 &&
			<performed_as_drummer> = 1 &&
			<performed_as_vocalist> = 1)
		achievements_awardplayer \{achievement = one_man_band
			player = 1}
	endif
endscript

script achievements_50_note_posse 
	printf \{'Achievements_50_NOTE_POSSE'}
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	if ($achievements_50_note_posse_flag = 1)
		achievements_awardband \{achievement = 50_note_posse}
		change \{achievements_50_note_posse_flag = 0}
	endif
endscript

script achievements_121_jigowatts 
	printf \{'Achievements_121_JIGOWATTS'}
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	if ($achievements_121_jigowatts_flag = 1)
		achievements_awardband \{achievement = 121_jigowatts}
		change \{achievements_121_jigowatts_flag = 0}
	endif
endscript

script achievements_top_of_the_charts 
	printf \{'Achievements_TOP_OF_THE_CHARTS'}
	if NOT achievements_isnewgigwon
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	achievements_careercomplete part = 'band' player = <player>
	if (<complete> = 1)
		achievements_awardplayer achievement = top_of_the_charts player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_should_we_stick_together 
	printf \{'Achievements_SHOULD_WE_STICK_TOGETHER'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	achievements_awardband \{achievement = should_we_stick_together}
endscript

script achievements_guitarists_coat_tails 
	printf \{'Achievements_GUITARISTS_COAT_TAILS'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	<highest_score> = 0
	<highest_score_player> = -1
	<highest_score_part> = none
	<player> = 1
	begin
	getplayerinfo <player> score
	if (<score> > <highest_score>)
		<highest_score> = <score>
		<highest_score_player> = <player>
		getplayerinfo <player> part
		<highest_score_part> = <part>
	endif
	<player> = (<player> + 1)
	repeat 4
	if (<highest_score_part> = guitar || <highest_score_part> = bass)
		achievements_awardplayer achievement = guitarists_coat_tails player = <highest_score_player>
	endif
endscript

script achievements_vocalists_coat_tails 
	printf \{'Achievements_VOCALISTS_COAT_TAILS'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	<highest_score> = 0
	<highest_score_player> = -1
	<highest_score_part> = none
	<player> = 1
	begin
	getplayerinfo <player> score
	if (<score> > <highest_score>)
		<highest_score> = <score>
		<highest_score_player> = <player>
		getplayerinfo <player> part
		<highest_score_part> = <part>
	endif
	<player> = (<player> + 1)
	repeat 4
	if (<highest_score_part> = vocals)
		achievements_awardplayer achievement = vocalists_coat_tails player = <highest_score_player>
	endif
endscript

script achievements_solid_gold_rockstars 
	printf \{'Achievements_SOLID_GOLD_ROCKSTARS'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	if ($current_song = jamsession)
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	if (<part> != vocals)
		getplayerinfo <player> notes_hit
		getplayerinfo <player> total_notes
		if ((<notes_hit> < <total_notes>) || (<total_notes> = 0))
			return
		endif
	else
		getplayerinfo <player> vocal_phrase_quality
		getplayerinfo <player> vocal_phrase_max_qual
		if ((<vocal_phrase_quality> < <vocal_phrase_max_qual>) || (<vocal_phrase_quality> = 0))
			return
		endif
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
	achievements_awardband \{achievement = solid_gold_rockstars}
endscript

script achievements_platinum_rockstars 
	printf \{'Achievements_PLATINUM_ROCKSTARS'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	if ($current_song = jamsession)
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	<player> = 1
	begin
	getplayerinfo <player> difficulty
	getplayerinfo <player> part
	if (<part> != vocals)
		getplayerinfo <player> notes_hit
		getplayerinfo <player> total_notes
		if ((<notes_hit> < <total_notes>) || (<total_notes> = 0))
			return
		endif
	else
		getplayerinfo <player> vocal_phrase_quality
		getplayerinfo <player> vocal_phrase_max_qual
		if ((<vocal_phrase_quality> < <vocal_phrase_max_qual>) || (<vocal_phrase_quality> = 0))
			return
		endif
	endif
	if ((<difficulty> != hard && <difficulty> != expert))
		return
	endif
	<player> = (<player> + 1)
	repeat 4
	achievements_awardband \{achievement = platinum_rockstars}
endscript

script achievements_youre_a_tool 
	printf \{'Achievements_YOURE_A_TOOL'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($band1_status.score >= 444444 &&
			$current_song = schism)
		achievements_awardband \{achievement = youre_a_tool}
	endif
endscript

script achievements_heavy_metall 
	printf \{'Achievements_HEAVY_METALL'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($band1_status.score >= 444444 &&
			$current_song = trappedunderice)
		achievements_awardband \{achievement = heavy_metall}
	endif
endscript

script achievements_super_group_unite 
	printf \{'Achievements_SUPER_GROUP_UNITE'}
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	if ($achievements_super_group_unite_flag = 1)
		achievements_awardband \{achievement = super_group_unite}
		change \{achievements_super_group_unite_flag = 0}
	endif
endscript

script achievements_feeding_the_beast 
	printf \{'Achievements_FEEDING_THE_BEAST'}
	if gotparam \{controller}
		writeachievements achievement = feeding_the_beast controller_id = <controller>
	endif
endscript

script achievements_this_is_totally_legal 
	printf \{'Achievements_THIS_IS_TOTALLY_LEGAL'}
	if gotparam \{controller}
		getglobaltags \{achievement_info}
		<new_total> = (<total_ghtunes_downloaded> + 1)
		setglobaltags achievement_info params = {total_ghtunes_downloaded = <new_total>}
		if (<new_total> > 2)
			writeachievements achievement = this_is_totally_legal controller_id = <controller>
		endif
	endif
endscript

script achievements_mine_is_bigger_than_yours 
	printf \{'Achievements_MINE_IS_BIGGER_THAN_YOURS'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if ($game_mode = p8_pro_faceoff && $is_network_game)
		achievements_awardband \{achievement = mine_is_bigger_than_yours}
	endif
endscript

script achievements_a_pair_beats_a_pair 
	printf \{'Achievements_A_PAIR_BEATS_A_PAIR'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if ($game_mode = p4_pro_faceoff && $is_network_game)
		achievements_awardband \{achievement = a_pair_beats_a_pair}
	endif
endscript

script achievements_survival_of_the_fittest 
	printf \{'Achievements_SURVIVAL_OF_THE_FITTEST'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if ($game_mode = p2_battle && $is_network_game)
		achievements_awardband \{achievement = survival_of_the_fittest}
	endif
endscript

script achievements_rock_maiden 
	printf \{'Achievements_ROCK_MAIDEN'}
	if gotparam \{controller}
		writeachievements achievement = rock_maiden controller_id = <controller>
	endif
endscript

script achievements_warrior_of_rock 
	printf \{'Achievements_WARRIOR_OF_ROCK'}
	if gotparam \{controller}
		writeachievements achievement = warrior_of_rock controller_id = <controller>
	endif
endscript

script achievements_stamp_of_approval 
	printf \{'Achievements_STAMP_OF_APPROVAL'}
	if ($rich_presence_context = presence_music_studio)
		return
	endif
	if gotparam \{controller}
		writeachievements achievement = stamp_of_approval controller_id = <controller>
		change \{achievements_modified_logo = 0}
	endif
endscript

script achievements_one_of_a_kind_axe 
	printf \{'Achievements_ONE_OF_A_KIND_AXE'}
	if gotparam \{controller}
		writeachievements achievement = one_of_a_kind_axe controller_id = <controller>
	endif
endscript

script achievements_custom_beats 
	printf \{'Achievements_CUSTOM_BEATS'}
	if gotparam \{controller}
		writeachievements achievement = custom_beats controller_id = <controller>
	endif
endscript

script achievements_inked 
	printf \{'Achievements_INKED'}
	if gotparam \{controller}
		writeachievements achievement = inked controller_id = <controller>
	endif
endscript

script achievements_bad_to_the_bone 
	printf \{'Achievements_BAD_TO_THE_BONE'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if ($current_level = load_z_tool)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	if (<character_id> = skeleton)
		achievements_awardplayer achievement = bad_to_the_bone player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_shiny_metal_thingy 
	printf \{'Achievements_SHINY_METAL_THINGY'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if ($current_level = load_z_tool)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	if (<character_id> = rockbot)
		achievements_awardplayer achievement = shiny_metal_thingy player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_pumpkin_smasher 
	printf \{'Achievements_PUMPKIN_SMASHER'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if ($current_level = load_z_tool)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	if (<character_id> = billy)
		achievements_awardplayer achievement = pumpkin_smasher player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_wylde_man 
	printf \{'Achievements_WYLDE_MAN'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if ($current_level = load_z_tool)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	if (<character_id> = zakkwylde)
		achievements_awardplayer achievement = wylde_man player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_dont_blink 
	printf \{'Achievements_DONT_BLINK'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if ($current_level = load_z_tool)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	if (<character_id> = travis)
		achievements_awardplayer achievement = dont_blink player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_the_experience 
	printf \{'Achievements_THE_EXPERIENCE'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if ($game_mode != p1_quickplay &&
			$game_mode != p2_quickplay &&
			$game_mode != p3_quickplay &&
			$game_mode != p4_quickplay &&
			$game_mode != p1_career &&
			$game_mode != p2_career &&
			$game_mode != p3_career &&
			$game_mode != p4_career &&
			$game_mode != p2_coop &&
			$game_mode != p8_pro_faceoff)
		return
	endif
	if ($current_level = load_z_tool)
		return
	endif
	if ($current_song = jamsession)
		return
	endif
	<songlist_props> = permanent_songlist_props
	is_song_downloaded song_checksum = ($current_song)
	if (<download> = 1)
		<songlist_props> = download_songlist_props
	endif
	if NOT structurecontains structure = ($<songlist_props>.($current_song)) band
		return
	endif
	if NOT (($<songlist_props>.($current_song).band) = band_hendrix)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> part
	if (<part> = guitar || <part> = vocals)
		achievements_awardplayer achievement = the_experience player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_motorcity_madman 
	printf \{'Achievements_MOTORCITY_MADMAN'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if ($current_level = load_z_tool)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	if (<character_id> = tednugent)
		achievements_awardplayer achievement = motorcity_madman player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_leading_lady 
	printf \{'Achievements_LEADING_LADY'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if ($current_level = load_z_tool)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	if (<character_id> = hayley)
		achievements_awardplayer achievement = leading_lady player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_the_dark_prince 
	printf \{'Achievements_THE_DARK_PRINCE'}
	if ($achievements_early_quit_flag = 1)
		return
	endif
	if NOT achievements_issongwon
		return
	endif
	if ($current_level = load_z_tool)
		return
	endif
	gamemode_getnumplayersshown
	<player> = 1
	begin
	getplayerinfo <player> character_id
	if (<character_id> = ozzy)
		achievements_awardplayer achievement = the_dark_prince player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script achievements_muse_to_my_ears 
	printf \{'Achievements_MUSE_TO_MY_EARS'}
	if NOT achievements_issongwon
		return
	endif
	if achievements_ischeatingautokick
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		score}
	getplayerinfo \{1
		part}
	if (<score> >= 222222 &&
			<part> = drum &&
			$current_song = assassin)
		achievements_awardplayer \{achievement = muse_to_my_ears
			player = 1}
	endif
endscript

script achievements_mike_checka 
	printf \{'Achievements_MIKE_CHECKA'}
	if NOT achievements_issongwon
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		score}
	getplayerinfo \{1
		part}
	if (<score> >= 123450 &&
			<part> = vocals &&
			$current_song = beatit)
		achievements_awardplayer \{achievement = mike_checka
			player = 1}
	endif
endscript

script achievements_get_your_boogie_on 
	printf \{'Achievements_GET_YOUR_BOOGIE_ON'}
	if NOT achievements_issongwon
		return
	endif
	gamemode_getnumplayers
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		score}
	getplayerinfo \{1
		part}
	if (<score> >= 222222 &&
			(<part> = guitar || <part> = bass) &&
			$current_song = satchboogie)
		achievements_awardplayer \{achievement = get_your_boogie_on
			player = 1}
	endif
endscript

script achievements_axe_museum 
	printf \{'Achievements_AXE_MUSEUM'}
	getarraysize ($progression_guitar_rewards)
	<main_array_size> = <array_size>
	<i> = 0
	begin
	if structurecontains structure = ($progression_guitar_rewards [<i>]) car_pieces
		getarraysize ($progression_guitar_rewards [<i>].car_pieces)
		if (<array_size> > 0)
			<j> = 0
			begin
			get_savegame_from_controller controller = ($primary_controller)
			if NOT is_part_unlocked part = ($progression_guitar_rewards [<i>].car_pieces [<j>].part) desc_id = ($progression_guitar_rewards [<i>].car_pieces [<j>].desc_id) savegame = <savegame>
				return
			endif
			<j> = (<j> + 1)
			repeat <array_size>
		endif
	endif
	<i> = (<i> + 1)
	repeat <main_array_size>
	writeachievements achievement = axe_museum controller_id = ($primary_controller)
endscript
