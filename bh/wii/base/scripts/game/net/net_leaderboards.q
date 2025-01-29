global_end_session_when_write_completes = 0

script check_for_leaderboard_write 
	printf \{channel = net_leaderboards
		qs(0x669a0012)}
	is_profanity_error = FALSE
	gamemode_gettype
	if NOT (<Type> = freeplay)
		if NOT was_acceptable_string
			printf \{qs(0x5f330abf)}
			is_profanity_error = true
			NetSessionFunc \{Obj = session
				func = end_active_session}
			return
		endif
		if NOT isbandcheating
			if NOT song_is_jamsession song = <song_checksum>
				writeleaderboards \{leaderboard_id = lb_rock_record
					callback = rockrecordwritecomplete}
			endif
			if ((<Type> = quickplay || <Type> = career) && (<end_credits> = 0))
				getnumplayersingame
				get_song_struct song = <song_checksum>
				printf qs(0x272df67f) t = (<song_struct>.Name)
				if StructureContains structure = <song_struct> xenindex
					printf qs(0x47209615) t = (<song_struct>.xenindex)
				endif
				if gamemode_isteamgame
					if is_traditional_game
						if StructureContains structure = <song_struct> xenindex
							formatText checksumName = lb_band_id 'dlc%s_%p' s = (<song_struct>.xenindex) p = '_band'
						else
							formatText checksumName = lb_band_id '%s_%p' s = (<song_struct>.Name) p = '_band'
						endif
					else
						if StructureContains structure = <song_struct> xenindex
							formatText checksumName = lb_band_id 'dlc%s_%p' s = (<song_struct>.xenindex) p = '_altband'
						else
							formatText checksumName = lb_band_id '%s_%p' s = (<song_struct>.Name) p = '_altband'
						endif
					endif
				endif
				if (<num_players> = 1)
					get_player_num_from_controller controller_index = ($primary_controller)
					if (<player_num> != -1)
						getplayerinfo <player_num> part
					else
						part = None
					endif
					switch (<part>)
						case guitar
						part_text = 'guitar'
						case bass
						part_text = 'backup'
						case drum
						part_text = 'drums'
						case vocals
						part_text = 'mic'
						case rhythm
						part_text = 'backup'
						default
						part_text = 'none'
					endswitch
					if StructureContains structure = <song_struct> xenindex
						formatText checksumName = lb_song_id 'dlc%s_%p' s = (<song_struct>.xenindex) p = <part_text>
					else
						formatText checksumName = lb_song_id '%s_%p' s = (<song_struct>.Name) p = <part_text>
					endif
				else
					if is_traditional_game
						if StructureContains structure = <song_struct> xenindex
							formatText checksumName = lb_song_id 'dlc%s_%p' s = (<song_struct>.xenindex) p = 'band'
						else
							formatText checksumName = lb_song_id '%s_%p' s = (<song_struct>.Name) p = 'band'
						endif
					else
						if StructureContains structure = <song_struct> xenindex
							formatText checksumName = lb_song_id 'dlc%s_%p' s = (<song_struct>.xenindex) p = 'altband'
						else
							formatText checksumName = lb_song_id '%s_%p' s = (<song_struct>.Name) p = 'altband'
						endif
					endif
				endif
				get_highest_difficulty
				if (<highest_difficulty> != beginner)
					if ($is_network_game = 1)
						write_leaderboard_stats song_checksum = <song_checksum> end_session = <end_session> game_type = <Type> lb_song_id = <lb_song_id> lb_band_id = <lb_band_id>
					else
						if (<song_checksum> != jamsession)
							write_leaderboard_stats song_checksum = <song_checksum> end_session = <end_session> game_type = <Type> lb_song_id = <lb_song_id> lb_band_id = <lb_band_id>
						elseif (<song_checksum> = jamsession && <end_session> = 1)
							end_singleplayer_game
						endif
					endif
				endif
				if (<end_session> = 1 && (($is_network_game) = 1))
					if NetSessionFunc \{Obj = session
							func = has_active_session}
						NetSessionFunc \{Obj = session
							func = end_active_session}
					endif
				endif
			else
				if ($is_network_game = 1)
					if NetSessionFunc \{Obj = session
							func = has_active_session}
						NetSessionFunc \{Obj = session
							func = end_active_session}
					endif
				else
					end_singleplayer_game
					SpawnScriptNow \{xenon_singleplayer_session_complete_uninit}
				endif
			endif
		else
			if ($is_network_game = 1)
				NetSessionFunc \{Obj = session
					func = end_active_session}
			else
				xenon_singleplayer_session_begin_uninit
			endif
		endif
	else
		if ($is_network_game = 1)
			NetSessionFunc \{Obj = session
				func = end_active_session}
		else
			xenon_singleplayer_session_begin_uninit
		endif
	endif
endscript

script write_leaderboard_stats 
	printf \{channel = net_leaderboards
		qs(0x81aa287d)}
	printstruct channel = net_leaderboards <...>
	if GotParam \{lb_band_id}
		writeleaderboards leaderboard_id = <lb_band_id> callback = bandwritecomplete
	endif
	if NOT GotParam \{end_session}
		writeleaderboards leaderboard_id = <lb_song_id> callback = writestatscallback
	else
		if (<end_session> = 1)
			Change \{global_end_session_when_write_completes = 1}
			writeleaderboards leaderboard_id = <lb_song_id> callback = writestatscallback
		else
			writeleaderboards leaderboard_id = <lb_song_id> callback = writestatscallback
		endif
	endif
endscript

script is_traditional_game 
	count_players_by_part \{part = guitar}
	num_guitar = <players_by_part>
	count_players_by_part \{part = drum}
	num_drum = <players_by_part>
	count_players_by_part \{part = vocals}
	num_vocals = <players_by_part>
	count_players_by_part \{part = bass}
	num_bass = <players_by_part>
	if (<num_guitar> <= 1)
		if (<num_drum> <= 1)
			if (<num_vocals> <= 1)
				if (<num_bass> <= 1)
					return \{true}
				endif
			endif
		endif
	endif
	return \{FALSE}
endscript

script net_retrieve_controller_scores 
	getnumplayersingame
	total_score = 0
	primary_index = 0
	<array> = []
	getfirstplayer \{out = index}
	if (<num_players> > 0)
		begin
		getplayerinfo <index> score
		CastToInteger \{score}
		getplayerinfo <index> controller
		if (<controller> = $primary_controller)
			<primary_index> = (<index> - 1)
		endif
		AddArrayElement array = <array> element = <score>
		<total_score> = (<total_score> + <score>)
		printstruct <...>
		getnextplayer Player = <index> out = index
		repeat <num_players>
	endif
	player_scores = <array>
	return {
		scores = <player_scores>
		total_score = <total_score>
		primary_index = <primary_index>
	}
endscript

script net_retrieve_primary_controller_part 
	getplayerinfo \{1
		controller
		out = controller1}
	getplayerinfo \{2
		controller
		out = controller2}
	if (<controller1> = ($primary_controller))
		getplayerinfo \{1
			part}
		return primary_part = <part>
	elseif (<controller2> = ($primary_controller))
		getplayerinfo \{2
			part}
		return primary_part = <part>
	else
		return \{primary_part = guitar}
	endif
endscript

script writestatscallback 
	printf \{qs(0x1aa6f65d)}
	if (1 = ($global_end_session_when_write_completes))
		Change \{global_end_session_when_write_completes = 0}
		end_singleplayer_game
	endif
endscript

script rockrecordwritecomplete 
	printf \{qs(0xab586313)}
	printf <...>
endscript
