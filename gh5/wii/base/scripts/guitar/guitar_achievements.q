gStar_Power_Triggered = 0
achievement_scripts = [
	{
		Name = one_time_solo_artist
		Scr = achievements_one_time_solo_artist
	}
	{
		Name = band_on_a_mission
		Scr = achievements_band_on_a_mission
	}
	{
		Name = solo_artist
		Scr = achievements_solo_artist
	}
	{
		Name = learning_the_ropes
		Scr = achievements_learning_the_ropes
	}
	{
		Name = stix
		Scr = achievements_stix
	}
	{
		Name = yodeler
		Scr = achievements_yodeler
	}
	{
		Name = pick_and_axe
		Scr = achievements_pick_and_axe
	}
	{
		Name = played_bass
		Scr = achievements_played_bass
	}
	{
		Name = first_of_many
		Scr = achievements_first_of_many
	}
	{
		Name = bling_bling
		Scr = achievements_bling_bling
	}
	{
		Name = easy_there
		Scr = achievements_easy_there
	}
	{
		Name = medium_musician
		Scr = achievements_medium_musician
	}
	{
		Name = hardcore
		Scr = achievements_hardcore
	}
	{
		Name = hall_of_famer
		Scr = achievements_hall_of_famer
	}
	{
		Name = jack_of_all_trades
		Scr = achievements_jack_of_all_trades
	}
	{
		Name = one_man_band
		Scr = achievements_one_man_band
	}
	{
		Name = 50_note_posse
		Scr = achievements_50_note_posse
	}
	{
		Name = 121_jigowatts
		Scr = achievements_121_jigowatts
	}
	{
		Name = top_of_the_charts
		Scr = achievements_top_of_the_charts
	}
	{
		Name = should_we_stick_together
		Scr = achievements_should_we_stick_together
	}
	{
		Name = guitarists_coat_tails_jigowatts
		Scr = achievements_guitarists_coat_tails
	}
	{
		Name = vocalists_coat_tails
		Scr = achievements_vocalists_coat_tails
	}
	{
		Name = solid_gold_rockstars
		Scr = achievements_solid_gold_rockstars
	}
	{
		Name = platinum_rockstars
		Scr = achievements_platinum_rockstars
	}
	{
		Name = youre_a_tool
		Scr = achievements_youre_a_tool
	}
	{
		Name = heavy_metall
		Scr = achievements_heavy_metall
	}
	{
		Name = super_group_unite
		Scr = achievements_super_group_unite
	}
	{
		Name = feeding_the_beast
		Scr = achievements_feeding_the_beast
	}
	{
		Name = this_is_totally_legal
		Scr = achievements_this_is_totally_legal
	}
	{
		Name = mine_is_bigger_than_yours
		Scr = achievements_mine_is_bigger_than_yours
	}
	{
		Name = a_pair_beats_a_pair
		Scr = achievements_a_pair_beats_a_pair
	}
	{
		Name = survival_of_the_fittest
		Scr = achievements_survival_of_the_fittest
	}
	{
		Name = rock_maiden
		Scr = achievements_rock_maiden
	}
	{
		Name = warrior_of_rock
		Scr = achievements_warrior_of_rock
	}
	{
		Name = stamp_of_approval
		Scr = achievements_stamp_of_approval
	}
	{
		Name = one_of_a_kind_axe
		Scr = achievements_one_of_a_kind_axe
	}
	{
		Name = custom_beats
		Scr = achievements_custom_beats
	}
	{
		Name = inked
		Scr = achievements_inked
	}
	{
		Name = bad_to_the_bone
		Scr = achievements_bad_to_the_bone
	}
	{
		Name = shiny_metal_thingy
		Scr = achievements_shiny_metal_thingy
	}
	{
		Name = pumpkin_smasher
		Scr = achievements_pumpkin_smasher
	}
	{
		Name = wylde_man
		Scr = achievements_wylde_man
	}
	{
		Name = dont_blink
		Scr = achievements_dont_blink
	}
	{
		Name = the_experience
		Scr = achievements_the_experience
	}
	{
		Name = motorcity_madman
		Scr = achievements_motorcity_madman
	}
	{
		Name = leading_lady
		Scr = achievements_leading_lady
	}
	{
		Name = the_dark_prince
		Scr = achievements_the_dark_prince
	}
	{
		Name = muse_to_my_ears
		Scr = achievements_muse_to_my_ears
	}
	{
		Name = mike_checka
		Scr = achievements_mike_checka
	}
	{
		Name = get_your_boogie_on
		Scr = achievements_get_your_boogie_on
	}
	{
		Name = axe_museum
		Scr = achievements_axe_museum
	}
]

script achievements_update 
	return
	GetArraySize \{$achievement_scripts}
	<i> = 0
	begin
	<Scr> = ($achievement_scripts [<i>].Scr)
	<Scr>
	<i> = (<i> + 1)
	repeat <array_Size>
	Change \{achievements_early_quit_flag = 0}
endscript
Achievements_SongWonFlag = 0
achievements_newgigwonflag = 0
achievements_50_note_posse_flag = 0
achievements_121_jigowatts_flag = 0
achievements_super_group_unite_flag = 0
achievements_creating_character = 0
achievements_modified_logo = 0
achievements_early_quit_flag = 0

script achievements_resetglobals 
	ScriptAssert \{'Achievements_ResetGlobals: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script Achievements_IsSongWon 
	if ($Achievements_SongWonFlag = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script achievements_isnewgigwon 
	if ($achievements_newgigwonflag = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script achievements_areanygigswon \{part = 'guitar'}
	ScriptAssert \{'Achievements_AreAnyGigsWon: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script achievements_numgigswon \{part = 'guitar'}
	return \{0}
endscript

script achievements_careercomplete \{part = 'guitar'}
	return \{complete = 0}
endscript

script achievements_played_bass 
	printf \{'Achievements_PLAYED_BASS'}
	if NOT Achievements_IsSongWon
		return \{FALSE}
	endif
	if ($game_mode = tutorial ||
			$game_mode = practice)
		return
	endif
	getplayerinfo \{1
		part}
	if (<part> = bass)
		SetGlobalTags \{achievement_info
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
		case None
		return \{part_string = 'none'}
		default
		return \{part_string = 'none'}
	endswitch
endscript

script achievements_awardplayer 
	getplayerinfo <Player> bot_play
	if (<bot_play> = 1)
		return
	endif
	getplayerinfo <Player> controller
	WriteAchievements achievement = <achievement> controller_id = <controller>
endscript

script achievements_awardband 
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	achievements_awardplayer achievement = <achievement> Player = <Player>
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
endscript

script achievements_checkfor50noteposse 
	ScriptAssert \{'Achievements_CheckFor50NotePosse: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script achievements_checkforsupergroupunite 
	ScriptAssert \{'Achievements_CheckForSuperGroupUnite: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script achievements_ischeatingautokick 
	if ($cheat_autokick != 1 && $cheat_freedrum != 1)
		return \{FALSE}
	endif
	gamemode_getnumplayersshown
	<Player> = 1
	begin
	getplayerinfo <Player> part
	if (<part> = drum)
		return \{true}
	endif
	<Player> = (<Player> + 1)
	repeat <num_players_shown>
	return \{FALSE}
endscript

script achievements_one_time_solo_artist 
	printf \{'Achievements_ONE_TIME_SOLO_ARTIST'}
	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = practice ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	getnumplayersingame
	if (<num_players> = 1)
		achievements_awardplayer \{achievement = one_time_solo_artist
			Player = 1}
	endif
endscript

script achievements_band_on_a_mission 
	printf \{'Achievements_BAND_ON_A_MISSION'}
	if NOT achievements_isnewgigwon
		return
	endif
	getnumplayersingame
	if (<num_players> > 1)
		achievements_numgigswon \{part = 'band'}
		<half_gigs> = (<total_gigs> / 2)
		if (<num_gigs_won> > <half_gigs>)
			achievements_awardband \{achievement = band_on_a_mission}
		endif
	else
		getplayerinfo \{1
			part}
		achievements_getpartstring part = <part>
		achievements_numgigswon part = <part_string>
		<half_gigs> = (<total_gigs> / 2)
		if (<num_gigs_won> > <half_gigs>)
			achievements_awardplayer \{achievement = band_on_a_mission
				Player = 1}
		endif
	endif
endscript

script achievements_solo_artist 
	printf \{'Achievements_SOLO_ARTIST'}
	if NOT achievements_isnewgigwon
		return
	endif
	getnumplayersingame
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		part}
	achievements_getpartstring part = <part>
	achievements_careercomplete part = <part_string>
	if (<complete> = 1)
		achievements_awardplayer \{achievement = solo_artist
			Player = 1}
	endif
endscript

script achievements_learning_the_ropes 
	printf \{'Achievements_LEARNING_THE_ROPES'}
	getnumplayersingame
	if (<num_players> > 1)
		return
	endif
	GetGlobalTags \{training}
	if (<basic_lesson> = complete ||
			<star_power_lesson> = complete ||
			<advanced_techniques_lesson> = complete ||
			<new_features_lesson> = complete ||
			<drum_basic_lesson> = complete ||
			<drum_int_lesson> = complete ||
			<vocals_lesson> = complete ||
			<band_lesson> = complete ||
			<versus_lesson> = complete)
		achievements_awardplayer \{achievement = learning_the_ropes
			Player = 1}
	endif
endscript

script achievements_stix 
	printf \{'Achievements_STIX'}
	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = practice ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	getnumplayersingame \{on_sreen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		if (<part> = drum)
			if (<Player> = 1)
				SetGlobalTags \{achievement_info
					params = {
						performed_as_drummer = 1
					}}
			endif
			achievements_awardplayer achievement = stix Player = <Player>
		endif
		getnextplayer on_screen Player = <Player>
		repeat <num_players>
	endif
endscript

script achievements_yodeler 
	printf \{'Achievements_YODELER'}
	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = practice ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <Player> part
		if (<part> = vocals)
			if (<Player> = 1)
				SetGlobalTags \{achievement_info
					params = {
						performed_as_vocalist = 1
					}}
			endif
			achievements_awardplayer achievement = yodeler Player = <Player>
		endif
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
endscript

script achievements_pick_and_axe 
	printf \{'Achievements_PICK_AND_AXE'}
	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = practice ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	getplayerinfo <Player> part
	if (<part> = guitar)
		if (<Player> = 1)
			SetGlobalTags \{achievement_info
				params = {
					performed_as_guitarist = 1
				}}
		endif
		achievements_awardplayer achievement = pick_and_axe Player = <Player>
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players>
endscript

script achievements_first_of_many 
	printf \{'Achievements_FIRST_OF_MANY'}
	if NOT achievements_isnewgigwon
		return
	endif
	achievements_awardband \{achievement = first_of_many}
endscript

script achievements_bling_bling 
	printf \{'Achievements_BLING_BLING'}
endscript

script achievements_easy_there 
	printf \{'Achievements_EASY_THERE'}
	if NOT achievements_isnewgigwon
		return
	endif
	getplayerinfo \{1
		difficulty}
	if (<difficulty> != easy)
		return
	endif
	getnumplayersingame
	if (<num_players> > 1)
		achievements_careercomplete \{part = 'band'}
		if (<complete> = 1)
			achievements_awardband \{achievement = easy_there}
		endif
	else
		getplayerinfo \{1
			part}
		achievements_getpartstring part = <part>
		achievements_careercomplete part = <part_string>
		if (<complete> = 1)
			achievements_awardplayer \{achievement = easy_there
				Player = 1}
		endif
	endif
endscript

script achievements_medium_musician 
	printf \{'Achievements_MEDIUM_MUSICIAN'}
	if NOT achievements_isnewgigwon
		return
	endif
	getplayerinfo \{1
		difficulty}
	if (<difficulty> != medium)
		return
	endif
	getnumplayersingame
	if (<num_players> > 1)
		achievements_careercomplete \{part = 'band'}
		if (<complete> = 1)
			achievements_awardband \{achievement = medium_musician}
		endif
	else
		getplayerinfo \{1
			part}
		achievements_getpartstring part = <part>
		achievements_careercomplete part = <part_string>
		if (<complete> = 1)
			achievements_awardplayer \{achievement = medium_musician
				Player = 1}
		endif
	endif
endscript

script achievements_hardcore 
	printf \{'Achievements_HARDCORE'}
	if NOT achievements_isnewgigwon
		return
	endif
	getplayerinfo \{1
		difficulty}
	if (<difficulty> != hard)
		return
	endif
	getnumplayersingame
	if (<num_players> > 1)
		achievements_careercomplete \{part = 'band'}
		if (<complete> = 1)
			achievements_awardband \{achievement = hardcore}
		endif
	else
		getplayerinfo \{1
			part}
		achievements_getpartstring part = <part>
		achievements_careercomplete part = <part_string>
		if (<complete> = 1)
			achievements_awardplayer \{achievement = hardcore
				Player = 1}
		endif
	endif
endscript

script achievements_hall_of_famer 
	printf \{'Achievements_HALL_OF_FAMER'}
	if NOT achievements_isnewgigwon
		return
	endif
	getplayerinfo \{1
		difficulty}
	if (<difficulty> != expert)
		return
	endif
	getnumplayersingame
	if (<num_players> > 1)
		achievements_careercomplete \{part = 'band'}
		if (<complete> = 1)
			achievements_awardband \{achievement = hall_of_famer}
		endif
	else
		getplayerinfo \{1
			part}
		achievements_getpartstring part = <part>
		achievements_careercomplete part = <part_string>
		if (<complete> = 1)
			achievements_awardplayer \{achievement = hall_of_famer
				Player = 1}
		endif
	endif
endscript

script achievements_jack_of_all_trades 
	printf \{'Achievements_JACK_OF_ALL_TRADES'}
	getnumplayersingame
	if (<num_players> > 1)
		return
	endif
	achievements_careercomplete \{part = 'guitar'}
	if (<complete> = 0)
		return
	endif
	achievements_careercomplete \{part = 'bass'}
	if (<complete> = 0)
		return
	endif
	achievements_careercomplete \{part = 'drum'}
	if (<complete> = 0)
		return
	endif
	achievements_careercomplete \{part = 'vocals'}
	if (<complete> = 0)
		return
	endif
	achievements_awardplayer \{achievement = jack_of_all_trades
		Player = 1}
endscript

script achievements_one_man_band 
	printf \{'Achievements_ONE_MAN_BAND'}
	GetGlobalTags \{achievement_info}
	if (<performed_as_guitarist> = 1 &&
			<performed_as_bassist> = 1 &&
			<performed_as_drummer> = 1 &&
			<performed_as_vocalist> = 1)
		achievements_awardplayer \{achievement = one_man_band
			Player = 1}
	endif
endscript

script achievements_50_note_posse 
	printf \{'Achievements_50_NOTE_POSSE'}
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = gh4_p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = practice ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	if ($achievements_50_note_posse_flag = 1)
		achievements_awardband \{achievement = 50_note_posse}
		Change \{achievements_50_note_posse_flag = 0}
	endif
endscript

script achievements_121_jigowatts 
	printf \{'Achievements_121_JIGOWATTS'}
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = gh4_p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = practice ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	if ($achievements_121_jigowatts_flag = 1)
		achievements_awardband \{achievement = 121_jigowatts}
		Change \{achievements_121_jigowatts_flag = 0}
	endif
endscript

script achievements_top_of_the_charts 
	printf \{'Achievements_TOP_OF_THE_CHARTS'}
	if NOT achievements_isnewgigwon
		return
	endif
	if ($game_mode != gh4_p4_career)
		return
	endif
	achievements_careercomplete \{part = 'band'}
	if (<complete> = 1)
		achievements_awardband \{achievement = top_of_the_charts}
	endif
endscript

script achievements_should_we_stick_together 
	printf \{'Achievements_SHOULD_WE_STICK_TOGETHER'}
	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = gh4_p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	achievements_awardband \{achievement = should_we_stick_together}
endscript

script achievements_guitarists_coat_tails 
	printf \{'Achievements_GUITARISTS_COAT_TAILS'}
	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = gh4_p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	<highest_score> = 0
	<highest_score_player> = -1
	<highest_score_part> = None
	<Player> = 1
	begin
	getplayerinfo <Player> score
	if (<score> > <highest_score>)
		<highest_score> = <score>
		<highest_score_player> = <Player>
		getplayerinfo <Player> part
		<highest_score_part> = <part>
	endif
	<Player> = (<Player> + 1)
	repeat 4
	if (<highest_score_part> = guitar || <highest_score_part> = bass)
		achievements_awardplayer achievement = guitarists_coat_tails Player = <highest_score_player>
	endif
endscript

script achievements_vocalists_coat_tails 
	printf \{'Achievements_VOCALISTS_COAT_TAILS'}
	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = gh4_p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	<highest_score> = 0
	<highest_score_player> = -1
	<highest_score_part> = None
	<Player> = 1
	begin
	getplayerinfo <Player> score
	if (<score> > <highest_score>)
		<highest_score> = <score>
		<highest_score_player> = <Player>
		getplayerinfo <Player> part
		<highest_score_part> = <part>
	endif
	<Player> = (<Player> + 1)
	repeat 4
	if (<highest_score_part> = vocals)
		achievements_awardplayer achievement = vocalists_coat_tails Player = <highest_score_player>
	endif
endscript

script achievements_solid_gold_rockstars 
	printf \{'Achievements_SOLID_GOLD_ROCKSTARS'}
	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = gh4_p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	getplayerinfo <Player> notes_hit
	getplayerinfo <Player> total_notes
	if ((<notes_hit> < <total_notes>) || (<total_notes> = 0))
		return
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
	achievements_awardband \{achievement = solid_gold_rockstars}
endscript

script achievements_platinum_rockstars 
	printf \{'Achievements_PLATINUM_ROCKSTARS'}
	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = gh4_p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	<Player> = 1
	begin
	getplayerinfo <Player> difficulty
	getplayerinfo <Player> notes_hit
	getplayerinfo <Player> total_notes
	if ((<difficulty> != hard && <difficulty> != expert) ||
			<notes_hit> < <total_notes> ||
			<total_notes> = 0)
		return
	endif
	<Player> = (<Player> + 1)
	repeat 4
	achievements_awardband \{achievement = platinum_rockstars}
endscript

script achievements_youre_a_tool 
	printf \{'Achievements_YOURE_A_TOOL'}
	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = gh4_p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	gman_songtool_getcurrentsong
	getbandinfo \{1
		score}
	if (<score> >= 444444 &&
			<current_song> = schism)
		achievements_awardband \{achievement = youre_a_tool}
	endif
endscript

script achievements_heavy_metall 
	printf \{'Achievements_HEAVY_METALL'}
	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = gh4_p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	gman_songtool_getcurrentsong
	getbandinfo \{1
		score}
	if (<score> >= 444444 &&
			<current_song> = trappedunderice)
		achievements_awardband \{achievement = heavy_metall}
	endif
endscript

script achievements_super_group_unite 
	printf \{'Achievements_SUPER_GROUP_UNITE'}
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = gh4_p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($achievements_super_group_unite_flag = 1)
		achievements_awardband \{achievement = super_group_unite}
		Change \{achievements_super_group_unite_flag = 0}
	endif
endscript

script achievements_feeding_the_beast 
	printf \{'Achievements_FEEDING_THE_BEAST'}
	if GotParam \{controller}
		WriteAchievements achievement = feeding_the_beast controller_id = <controller>
	endif
endscript

script achievements_this_is_totally_legal 
	printf \{'Achievements_THIS_IS_TOTALLY_LEGAL'}
	if GotParam \{controller}
		GetGlobalTags \{achievement_info}
		<new_total> = (<total_ghtunes_downloaded> + 1)
		SetGlobalTags achievement_info params = {total_ghtunes_downloaded = <new_total>}
		if (<new_total> > 2)
			WriteAchievements achievement = this_is_totally_legal controller_id = <controller>
		endif
	endif
endscript

script achievements_mine_is_bigger_than_yours 
	printf \{'Achievements_MINE_IS_BIGGER_THAN_YOURS'}
	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = p8_pro_faceoff && $is_network_game)
		achievements_awardband \{achievement = mine_is_bigger_than_yours}
	endif
endscript

script achievements_a_pair_beats_a_pair 
	printf \{'Achievements_A_PAIR_BEATS_A_PAIR'}
	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = p4_pro_faceoff && $is_network_game)
		achievements_awardband \{achievement = a_pair_beats_a_pair}
	endif
endscript

script achievements_survival_of_the_fittest 
	printf \{'Achievements_SURVIVAL_OF_THE_FITTEST'}
	if NOT Achievements_IsSongWon
		return
	endif
endscript

script achievements_rock_maiden 
	printf \{'Achievements_ROCK_MAIDEN'}
	if GotParam \{controller}
		WriteAchievements achievement = rock_maiden controller_id = <controller>
	endif
endscript

script achievements_warrior_of_rock 
	printf \{'Achievements_WARRIOR_OF_ROCK'}
	if GotParam \{controller}
		WriteAchievements achievement = warrior_of_rock controller_id = <controller>
	endif
endscript

script achievements_stamp_of_approval 
	printf \{'Achievements_STAMP_OF_APPROVAL'}
	if ($rich_presence_context = presence_music_studio)
		return
	endif
	if GotParam \{controller}
		WriteAchievements achievement = stamp_of_approval controller_id = <controller>
		Change \{achievements_modified_logo = 0}
	endif
endscript

script achievements_one_of_a_kind_axe 
	printf \{'Achievements_ONE_OF_A_KIND_AXE'}
	if GotParam \{controller}
		WriteAchievements achievement = one_of_a_kind_axe controller_id = <controller>
	endif
endscript

script achievements_custom_beats 
	printf \{'Achievements_CUSTOM_BEATS'}
	if GotParam \{controller}
		WriteAchievements achievement = custom_beats controller_id = <controller>
	endif
endscript

script achievements_inked 
	printf \{'Achievements_INKED'}
	if GotParam \{controller}
		WriteAchievements achievement = inked controller_id = <controller>
	endif
endscript

script achievements_bad_to_the_bone 
	printf \{'Achievements_BAD_TO_THE_BONE'}
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	getplayerinfo <Player> character_id
	if (<character_id> = Skeleton)
		achievements_awardplayer achievement = bad_to_the_bone Player = <Player>
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
endscript

script achievements_shiny_metal_thingy 
	printf \{'Achievements_SHINY_METAL_THINGY'}
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	getplayerinfo <Player> character_id
	if (<character_id> = rockbot)
		achievements_awardplayer achievement = shiny_metal_thingy Player = <Player>
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
endscript

script achievements_pumpkin_smasher 
	printf \{'Achievements_PUMPKIN_SMASHER'}
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	getplayerinfo <Player> character_id
	if (<character_id> = billy)
		achievements_awardplayer achievement = pumpkin_smasher Player = <Player>
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
endscript

script achievements_wylde_man 
	printf \{'Achievements_WYLDE_MAN'}
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	getplayerinfo <Player> character_id
	if (<character_id> = zakkwylde)
		achievements_awardplayer achievement = wylde_man Player = <Player>
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
endscript

script achievements_dont_blink 
	printf \{'Achievements_DONT_BLINK'}
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	getplayerinfo <Player> character_id
	if (<character_id> = travis)
		achievements_awardplayer achievement = dont_blink Player = <Player>
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
endscript

script achievements_the_experience 
	printf \{'Achievements_THE_EXPERIENCE'}
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	getplayerinfo <Player> character_id
	if (<character_id> = jimi)
		achievements_awardplayer achievement = the_experience Player = <Player>
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
endscript

script achievements_motorcity_madman 
	printf \{'Achievements_MOTORCITY_MADMAN'}
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	getplayerinfo <Player> character_id
	if (<character_id> = tednugent)
		achievements_awardplayer achievement = motorcity_madman Player = <Player>
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
endscript

script achievements_leading_lady 
	printf \{'Achievements_LEADING_LADY'}
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	getplayerinfo <Player> character_id
	if (<character_id> = hayley)
		achievements_awardplayer achievement = leading_lady Player = <Player>
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
endscript

script achievements_the_dark_prince 
	printf \{'Achievements_THE_DARK_PRINCE'}
	getnumplayersingame \{on_screen}
	getfirstplayer \{on_screen}
	begin
	getplayerinfo <Player> character_id
	if (<character_id> = ozzy)
		achievements_awardplayer achievement = the_dark_prince Player = <Player>
	endif
	getnextplayer on_screen Player = <Player>
	repeat <num_players_shown>
endscript

script achievements_muse_to_my_ears 
	printf \{'Achievements_MUSE_TO_MY_EARS'}
	if NOT Achievements_IsSongWon
		return
	endif
	getnumplayersingame
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		score}
	getplayerinfo \{1
		part}
	gman_songtool_getcurrentsong
	if (<score> >= 222222 &&
			<part> = drum &&
			<current_song> = assassin)
		achievements_awardplayer \{achievement = muse_to_my_ears
			Player = 1}
	endif
endscript

script achievements_mike_checka 
	printf \{'Achievements_MIKE_CHECKA'}
	if NOT Achievements_IsSongWon
		return
	endif
	getnumplayersingame
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		score}
	getplayerinfo \{1
		part}
	gman_songtool_getcurrentsong
	if (<score> >= 123450 &&
			<part> = vocals &&
			<current_song> = beatit)
		achievements_awardplayer \{achievement = mike_checka
			Player = 1}
	endif
endscript

script achievements_get_your_boogie_on 
	printf \{'Achievements_GET_YOUR_BOOGIE_ON'}
	if NOT Achievements_IsSongWon
		return
	endif
	getnumplayersingame
	if (<num_players> > 1)
		return
	endif
	getplayerinfo \{1
		score}
	getplayerinfo \{1
		part}
	gman_songtool_getcurrentsong
	if (<score> >= 222222 &&
			(<part> = guitar || <part> = bass) &&
			<current_song> = satchboogie)
		achievements_awardplayer \{achievement = get_your_boogie_on
			Player = 1}
	endif
endscript

script achievements_axe_museum 
	printf \{'Achievements_AXE_MUSEUM'}
	GetArraySize ($progression_guitar_rewards)
	<main_array_size> = <array_Size>
	<i> = 0
	begin
	if StructureContains structure = ($progression_guitar_rewards [<i>]) car_pieces
		GetArraySize ($progression_guitar_rewards [<i>].car_pieces)
		if (<array_Size> > 0)
			<j> = 0
			begin
			get_savegame_from_controller controller = ($primary_controller)
			if NOT is_part_unlocked part = ($progression_guitar_rewards [<i>].car_pieces [<j>].part) desc_id = ($progression_guitar_rewards [<i>].car_pieces [<j>].desc_id) savegame = <savegame>
				return
			endif
			<j> = (<j> + 1)
			repeat <array_Size>
		endif
	endif
	<i> = (<i> + 1)
	repeat <main_array_size>
	WriteAchievements achievement = axe_museum controller_id = ($primary_controller)
endscript
