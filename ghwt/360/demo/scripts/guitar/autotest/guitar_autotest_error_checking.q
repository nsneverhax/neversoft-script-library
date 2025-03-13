
script autotest_check_test_params 
	autotest_get_test suite_num = <suite_num> test_num = <test_num>
	<suite_num> = ($autotest_suite_list [<suite_num>])
	autotest_check_song song = (<test_struct>.song) suite_num = <suite_num> test_num = <test_num>
	if (<check_song_passed> = 0)
		return \{check_passed = 0}
	endif
	autotest_check_venue venue = (<test_struct>.venue) suite_num = <suite_num> test_num = <test_num>
	if (<check_venue_passed> = 0)
		return \{check_passed = 0}
	endif
	autotest_check_part_names test_struct = <test_struct> suite_num = <suite_num> test_num = <test_num>
	if (<check_part_names_passed> = 0)
		return \{check_passed = 0}
	endif
	autotest_check_difficulty_names test_struct = <test_struct> suite_num = <suite_num> test_num = <test_num>
	if (<check_difficulty_names_passed> = 0)
		return \{check_passed = 0}
	endif
	autotest_check_mode game_mode = (<test_struct>.game_mode) suite_num = <suite_num> test_num = <test_num>
	if (<check_mode_passed> = 0)
		return \{check_passed = 0}
	endif
	autotest_check_part_combos versus = <versus> suite_num = <suite_num> test_num = <test_num>
	if (<check_part_combos_passed> = 0)
		return \{check_passed = 0}
	endif
	autotest_check_start_end_times test_struct = <test_struct> suite_num = <suite_num> test_num = <test_num>
	if (<check_start_end_times_passed> = 0)
		return \{check_passed = 0}
	endif
	autotest_check_force_score test_struct = <test_struct> suite_num = <suite_num> test_num = <test_num>
	if (<check_force_score_passed> = 0)
		return \{check_passed = 0}
	endif
	return \{check_passed = 1}
endscript

script autotest_check_song 
	getarraysize \{$gh_songlist}
	<found_match> = 0
	<i> = 0
	begin
	if (<song> = ($gh_songlist [<i>]))
		<found_match> = 1
		return \{check_song_passed = 1}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	softassert qs(0x8a126ef5) s = <suite_num> t = <test_num>
	return \{check_song_passed = 0}
endscript

script autotest_check_venue 
	getarraysize \{$levelzonearray}
	<found_match> = 0
	<i> = 0
	begin
	if (<venue> = ($levelzonearray [<i>]))
		<found_match> = 1
		return \{check_venue_passed = 1}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	softassert qs(0xdbaaaf15) s = <suite_num> t = <test_num>
	return \{check_venue_passed = 0}
endscript

script autotest_check_part_names 
	<player> = 1
	begin
	formattext checksumname = player_part 'p%n_part' n = <player>
	<part> = (<test_struct>.<player_part>)
	if NOT structurecontains structure = $autotest_part_strings <part>
		softassert qs(0x719d7047) s = <suite_num> t = <test_num> n = <player>
		return \{check_part_names_passed = 0}
	endif
	<player> = (<player> + 1)
	repeat 4
	return \{check_part_names_passed = 1}
endscript

script autotest_check_difficulty_names 
	<player> = 1
	begin
	formattext checksumname = player_diff 'p%n_difficulty' n = <player>
	<diff> = (<test_struct>.<player_diff>)
	if NOT structurecontains structure = $autotest_difficulty_strings <diff>
		softassert qs(0x8f5fd047) s = <suite_num> t = <test_num> n = <player>
		return \{check_difficulty_names_passed = 0}
	endif
	<player> = (<player> + 1)
	repeat 4
	return \{check_difficulty_names_passed = 1}
endscript

script autotest_check_mode 
	<versus> = 0
	switch (<game_mode>)
		case p1_career
		softassert qs(0x53dd07b3) s = <suite_num> t = <test_num>
		return \{check_mode_passed = 0}
		if NOT ($current_num_players = 1)
			softassert qs(0x230cbae1) s = <suite_num> t = <test_num>
			return \{check_mode_passed = 0}
		endif
		<versus> = 0
		case p1_quickplay
		if NOT ($current_num_players = 1)
			softassert qs(0x76d9d246) s = <suite_num> t = <test_num>
			return \{check_mode_passed = 0}
		endif
		<versus> = 0
		case p2_battle
		if NOT ($current_num_players = 2)
			softassert qs(0xe70f51d9) s = <suite_num> t = <test_num>
			return \{check_mode_passed = 0}
		endif
		<versus> = 1
		case p2_career
		softassert qs(0x53dd07b3) s = <suite_num> t = <test_num>
		return \{check_mode_passed = 0}
		if NOT ($current_num_players = 2)
			softassert qs(0x0ac40e13) s = <suite_num> t = <test_num>
			return \{check_mode_passed = 0}
		endif
		<versus> = 0
		case p2_coop
		if NOT ($current_num_players = 2)
			softassert qs(0x5e6f5890) s = <suite_num> t = <test_num>
			return \{check_mode_passed = 0}
		endif
		<versus> = 0
		case p2_faceoff
		if NOT ($current_num_players = 2)
			softassert qs(0x87dfcd65) s = <suite_num> t = <test_num>
			return \{check_mode_passed = 0}
		endif
		<versus> = 1
		case p2_pro_faceoff
		if NOT ($current_num_players = 2)
			softassert qs(0x18003662) s = <suite_num> t = <test_num>
			return \{check_mode_passed = 0}
		endif
		<versus> = 1
		case p2_quickplay
		if NOT ($current_num_players = 2)
			softassert qs(0x4fa17f06) s = <suite_num> t = <test_num>
			return \{check_mode_passed = 0}
		endif
		<versus> = 0
		case p3_career
		softassert qs(0x53dd07b3) s = <suite_num> t = <test_num>
		return \{check_mode_passed = 0}
		if NOT ($current_num_players = 3)
			softassert qs(0xa4ac9f82) s = <suite_num> t = <test_num>
			return \{check_mode_passed = 0}
		endif
		<versus> = 0
		case p3_quickplay
		if NOT ($current_num_players = 3)
			softassert qs(0x58891bc6) s = <suite_num> t = <test_num>
			return \{check_mode_passed = 0}
		endif
		<versus> = 0
		case p4_career
		softassert qs(0x53dd07b3) s = <suite_num> t = <test_num>
		return \{check_mode_passed = 0}
		if NOT ($current_num_players = 4)
			softassert qs(0x595567f7) s = <suite_num> t = <test_num>
			return \{check_mode_passed = 0}
		endif
		<versus> = 0
		case p4_pro_faceoff
		if NOT ($current_num_players = 4)
			softassert qs(0x172e9593) s = <suite_num> t = <test_num>
			return \{check_mode_passed = 0}
		endif
		<versus> = 1
		case p4_quickplay
		if NOT ($current_num_players = 4)
			softassert qs(0x3d502586) s = <suite_num> t = <test_num>
			return \{check_mode_passed = 0}
		endif
		<versus> = 0
		default
		softassert qs(0xa38dd44b) s = <suite_num> t = <test_num>
		return \{check_mode_passed = 0}
	endswitch
	return check_mode_passed = 1 versus = <versus>
endscript

script autotest_check_part_combos 
	if (<versus> = 1)
		<i> = 1
		begin
		<j> = (<i> + 1)
		begin
		autotest_get_suite suite_num = <suite_num>
		<test_struct> = (<suite_struct>.tests [<test_num>])
		formattext checksumname = playera_part 'p%n_part' n = <i>
		formattext checksumname = playerb_part 'p%n_part' n = <j>
		if NOT (<test_struct>.<playera_part> = none || <test_struct>.<playerb_part> = none)
			if NOT ((<test_struct>.<playera_part>) = (<test_struct>.<playerb_part>))
				softassert qs(0x53365c7e) s = <suite_num> t = <test_num>
				return \{check_part_combos_passed = 0}
			endif
		endif
		<j> = (<j> + 1)
		repeat (3 - (<i> - 1))
		<i> = (<i> + 1)
		repeat 3
		return \{check_part_combos_passed = 1}
	endif
	<i> = 1
	begin
	<j> = (<i> + 1)
	begin
	autotest_get_suite suite_num = <suite_num>
	<test_struct> = (<suite_struct>.tests [<test_num>])
	formattext checksumname = playera_part 'p%n_part' n = <i>
	formattext checksumname = playerb_part 'p%n_part' n = <j>
	if NOT (<test_struct>.<playera_part> = none || <test_struct>.<playerb_part> = none)
		if ((<test_struct>.<playera_part>) = (<test_struct>.<playerb_part>))
			softassert qs(0x5c595801) s = <suite_num> t = <test_num>
			return \{check_part_combos_passed = 0}
		endif
	endif
	<j> = (<j> + 1)
	repeat (3 - (<i> - 1))
	<i> = (<i> + 1)
	repeat 3
	return \{check_part_combos_passed = 1}
endscript

script autotest_check_start_end_times 
	if structurecontains structure = <test_struct> start_time
		if (<test_struct>.start_time < 0)
			softassert qs(0x1d63d5b9) s = <suite_num> t = <test_num>
			return \{check_start_end_times_passed = 0}
		endif
	endif
	if structurecontains structure = <test_struct> end_time
		if (<test_struct>.end_time < 0)
			softassert qs(0x3762b742) s = <suite_num> t = <test_num>
			return \{check_start_end_times_passed = 0}
		endif
		if structurecontains structure = <test_struct> start_time
			if ((<test_struct>.end_time) < (<test_struct>.start_time))
				softassert qs(0xbd1e35a3) s = <suite_num> t = <test_num>
				return \{check_start_end_times_passed = 0}
			endif
		endif
	endif
	return \{check_start_end_times_passed = 1}
endscript

script autotest_check_force_score 
	if structurecontains structure = <test_struct> force_score
		if (<test_struct>.force_score != off &&
				<test_struct>.force_score != poor &&
				<test_struct>.force_score != medium &&
				<test_struct>.force_score != good)
			softassert qs(0x6bf828b7) s = <suite_num> t = <test_num>
			return \{check_force_score_passed = 0}
		endif
	endif
	return \{check_force_score_passed = 1}
endscript
