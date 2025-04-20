ve_debug_score = 1
ve_debug_detail_score = 1
ve_score_beat_threshold = 0.1
ve_score_beat_cut_multiplier = 2.5
ve_score_beat_cheese_reduction = 0.1
ve_score_beat_score_multiplier = 150.0
ve_score_clip_duration_cheese = 1.25
ve_score_clip_overuse_cheese_mult = 2.0
ve_score_clip_event_per_sec_cheese = 2.0
ve_score_clip_event_per_sec_cheese_mul = 200.0
ve_score_overlay_coverage = 0.75
ve_score_effect_coverage = 0.75
ve_score_fx_overlay_combine_coverage = 1.0
ve_score_fx_overlay_cheese_mul = 3.0
ve_overall_multiplier = 0.65000004
ve_min_score_for_submission = 1000

script ve_calculate_edit_score 
	ve_trim_edit_to_time {
		clips = <clips>
		effects = <effects>
		overlays = <overlays>
		time = ($video_render_length)
	}
	getarraysize <clips>
	if (<array_size> > 0)
		if ($ve_debug_detail_score = 1)
			printf '--- EDIT SCORING:'
		endif
		ve_score_get_clip_beats clips = <clips>
		ve_score_beats beats = <beats> audio = <audio>
		ve_score_clips clips = <clips>
		ve_get_clips_entire_length clips = <clips>
		ve_score_array {
			array = <effects>
			entire_length = <entire_length>
			score_callback = ve_score_effect
			coverage_cheese = ($ve_score_effect_coverage)
			debug_name = 'Effects'
		}
		effects_score = <array_score>
		ve_score_array {
			array = <overlays>
			entire_length = <entire_length>
			score_callback = ve_score_overlay
			coverage_cheese = ($ve_score_overlay_coverage)
			debug_name = 'Overlays'
		}
		overlays_score = <array_score>
		score = (<beats_score> + <effects_score> + <overlays_score> + <clips_score>)
		goal_video_edit_count_unique_pros clips = <clips>
		linearmap result = pro_multiplier from = 1.0 to = 5.0 basedon = <unique_pros> lowerbound = 0 upperbound = 9
		score = (<score> * <pro_multiplier>)
		if ($ve_debug_detail_score = 1)
			printf '--- Pro Multiplier=%t' t = <pro_multiplier>
			printf '--- Total=%t' t = <score>
			printf '--- After final multiplier=%t' t = (<score> * $ve_overall_multiplier)
		endif
		score = (<score> * $ve_overall_multiplier)
		casttointeger score
		if (<score> < 0)
			score = 0
		endif
		return score = <score>
	endif
	return score = 0
endscript

script ve_score_get_clip_beats 
	beats = []
	getarraysize <clips>
	if (<array_size> > 0)
		i = 0
		time = 0.0
		begin
		edit_clip = (<clips> [<i>])
		if (<i> > 0)
			no_cut = 0
			if ((<edit_clip>.name) = <last_clip_name>)
				if ((<edit_clip>.clip_start) = <last_clip_end>)
					no_cut = 1
				endif
			endif
			if (<no_cut> = 0)
				beat_entry = [{time = <time> multiplier = ($ve_score_beat_cut_multiplier)}]
				beats = (<beats> + <beat_entry>)
			endif
		endif
		ve_score_process_edit_clip_beats edit_clip = <edit_clip> time = <time> beats = <beats>
		ve_get_edit_clip_length edit_clip = <edit_clip>
		time = (<time> + <length>)
		last_clip_name = (<edit_clip>.name)
		last_clip_end = (<edit_clip>.clip_end)
		i = (<i> + 1)
		repeat <array_size>
	endif
	return beats = <beats>
endscript

script ve_score_process_edit_clip_beats 
	if VideoClipSlotFunc get_clip_data_struct name = (<edit_clip>.name)
		i = 0
		getarraysize (<clip_data>.event_list)
		if (<array_size> > 0)
			begin
			event = ((<clip_data>.event_list) [<i>])
			ve_score_get_beat_multiplier type = (<event>.type)
			if (<multiplier> > 0)
				if ((<edit_clip>.clip_start) <= (<event>.time))
					if ((<edit_clip>.clip_end) >= (<event>.time))
						beat_time = ((<event>.time) - (<edit_clip>.clip_start))
						beat_time = (<beat_time> / (<edit_clip>.clip_speed))
						beat_entry = [{time = (<beat_time> + <time>) multiplier = <multiplier>}]
						beats = (<beats> + <beat_entry>)
					endif
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return beats = <beats>
endscript

script ve_score_beats 
	getarraysize <beats>
	clip_beat_count = <array_size>
	beats_score = 0
	missed_beats = 0
	if (<clip_beat_count> > 0)
		extendcrc (<audio>.music) '_beatmap' out = fretbar_array
		if globalexists name = <fretbar_array>
			getarraysize ($<fretbar_array>)
			music_beat_count = <array_size>
			music_index = 0
			clip_index = 0
			begin
			if (<music_index> = <music_beat_count>)
				break
			endif
			if (<clip_index> = <clip_beat_count>)
				break
			endif
			current_music = ((($<fretbar_array>) [<music_index>]) / 1000.0)
			current_clip = (((<beats> [<clip_index>]).time) + (<audio>.music_start))
			diff = (<current_music> - <current_clip>)
			if (<diff> < 0.0)
				diff = (<diff> * -1.0)
			endif
			if (<diff> < ($ve_score_beat_threshold))
				beats_score = (<beats_score> + ((<beats> [<clip_index>]).multiplier))
				music_index = (<music_index> + 1)
				clip_index = (<clip_index> + 1)
			else
				if (<current_music> < <current_clip>)
					music_index = (<music_index> + 1)
				else
					if (<music_index> > 0)
						missed_beats = (<missed_beats> + ((<beats> [<clip_index>]).multiplier))
					endif
					clip_index = (<clip_index> + 1)
				endif
			endif
			repeat
		else
			printf 'Couldnt find fretbar array for %s' s = (<audio>.music)
		endif
	endif
	missed_score = (<missed_beats> * ($ve_score_beat_cheese_reduction) * ($ve_score_beat_score_multiplier))
	beats_score = (<beats_score> * ($ve_score_beat_score_multiplier))
	final_score = (<beats_score> - <missed_score>)
	if ($ve_debug_detail_score = 1)
		printf '    Audio beat score %h-%m=%t' h = <beats_score> m = <missed_score> t = <final_score>
	endif
	return beats_score = <final_score>
endscript

script ve_score_get_beat_multiplier 
	switch (<type>)
		case trick
		case bailhit
		return \{multiplier = 1.0}
		case ollie
		case landed
		case bailstart
		case ShatterAndDie
		case Z_Bell_Shatter_replay
		case Z_Slums_Shatter_wood_replay
		case Z_Slums_Shatter_wood_air_replay
		case ntt
		return \{multiplier = 2.0}
		default
		return \{multiplier = 0.0}
	endswitch
endscript

script ve_score_draw_audio_beats 
	extendcrc (<audio>.music) '_beatmap' out = fretbar_array
	if globalexists name = <fretbar_array>
		getarraysize ($<fretbar_array>)
		music_index = 0
		begin
		if (<music_index> = <array_size>)
			break
		endif
		current_music = (((($<fretbar_array>) [<music_index>]) / 1000.0) - (<audio>.music_start))
		if (<current_music> >= <time_start>)
			if (<current_music> <= (<time_start> + 15.0))
				offset = (<current_music> * $video_second_width)
				createscreenelement {
					type = spriteelement
					parent = <parent>
					dims = (5.0, 30.0)
					pos = (((1.0, 0.0) * <offset>) + (0.0, 0.0))
					rgba = [255 255 255 255]
					z_priority = 14.95
					just = [center top]
				}
			endif
		endif
		music_index = (<music_index> + 1)
		repeat
	endif
endscript

script ve_score_draw_clip_beats 
	ve_score_get_clip_beats clips = <clips>
	getarraysize <beats>
	if (<array_size> > 0)
		clip_index = 0
		begin
		if (<clip_index> = <array_size>)
			break
		endif
		current_clip = ((<beats> [<clip_index>]).time)
		if (<current_clip> >= <time_start>)
			if (<current_clip> <= (<time_start> + 15.0))
				offset = (<current_clip> * $video_second_width)
				createscreenelement {
					type = spriteelement
					parent = <parent>
					dims = (5.0, 40.0)
					pos = (((1.0, 0.0) * <offset>) + (0.0, 0.0))
					rgba = [255 255 255 255]
					z_priority = 14.95
					just = [center top]
				}
			endif
		endif
		clip_index = (<clip_index> + 1)
		repeat
	endif
endscript

script ve_score_clips 
	score = 0
	total_events = 0
	clips_reduction = 0.0
	getarraysize <clips>
	if (<array_size> > 0)
		i = 0
		begin
		edit_clip = (<clips> [<i>])
		ve_get_original_clip_length clip = (<edit_clip>.name)
		ve_score_get_clip_score edit_clip = <edit_clip> length = <length>
		score = (<score> + <clip_score>)
		total_events = (<total_events> + <num_events>)
		if ve_is_last_of_this_clip_in_array clips = <clips> index = <i>
			ve_get_clip_usage clips = <clips> clip_name = (<edit_clip>.name)
			ve_get_original_clip_length clip = (<edit_clip>.name)
			if (<length> > 0.0)
				use_ratio = (<usage> / <length>)
				if (<use_ratio> > $ve_score_clip_duration_cheese)
					ve_score_get_clip_score edit_clip = {name = (<edit_clip>.name) clip_start = 0.0 clip_end = <length> clip_speed = 1.0}
					cheese_clips = (<use_ratio> - $ve_score_clip_duration_cheese)
					cheese_clips = (<clip_score> * <cheese_clips> * ($ve_score_clip_overuse_cheese_mult))
					clips_reduction = (<clips_reduction> + <cheese_clips>)
					printf '    Clip overuse reduction %t' t = <cheese_clips>
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	ve_get_clips_entire_length clips = <clips>
	if (<entire_length> > 0.0)
		ev_per_sec = (<total_events> / <entire_length>)
		printf '    Eventspersec %t' t = <ev_per_sec>
		if (<ev_per_sec> > $ve_score_clip_event_per_sec_cheese)
			cheese_events = (<ev_per_sec> / ($ve_score_clip_event_per_sec_cheese))
			clips_reduction = (<clips_reduction> + (<cheese_events> * $ve_score_clip_event_per_sec_cheese_mul))
			printf '    Eventspersec reduction %t' t = (<cheese_events> * $ve_score_clip_event_per_sec_cheese_mul)
		endif
	endif
	total_score = (<score> - <clips_reduction>)
	if ($ve_debug_detail_score = 1)
		printf '    Clips score %s-%r=%t' s = <score> r = <clips_reduction> t = <total_score>
	endif
	return clips_score = <total_score>
endscript

script ve_get_clip_usage 
	usage = 0
	getarraysize <clips>
	if (<array_size> > 0)
		i = 0
		begin
		if ((<clips> [<i>]).name = <clip_name>)
			ve_get_edit_clip_length edit_clip = (<clips> [<i>])
			if structurecontains structure = <edit_clip> clip_speed
				length = (<length> * (<edit_clip>.clip_speed))
			endif
			usage = (<usage> + <length>)
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return usage = <usage>
endscript

script ve_is_last_of_this_clip_in_array 
	getarraysize <clips>
	if (<array_size> > 0)
		i = (<index> + 1)
		begin
		if (<i> >= <array_size>)
			break
		endif
		if ((<clips> [<i>]).name = (<clips> [<index>]).name)
			return \{false}
		endif
		i = (<i> + 1)
		repeat
	endif
	return \{true}
endscript

script ve_score_get_clip_score 
	score = 0
	num_events = 0
	if VideoClipSlotFunc get_clip_data_struct name = (<edit_clip>.name)
		i = 0
		getarraysize (<clip_data>.event_list)
		if (<array_size> > 0)
			begin
			event = ((<clip_data>.event_list) [<i>])
			if ((<edit_clip>.clip_start) <= (<event>.time))
				if ((<edit_clip>.clip_end) >= (<event>.time))
					ve_score_get_event_score event = <event>
					score = (<score> + <event_score>)
					num_events = (<num_events> + 1)
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	if structurecontains structure = <edit_clip> clip_camera
		switch (<edit_clip>.clip_camera)
			case user
			cam_mul = 1.25
			cam_add = 300
			case user_look_at
			case user_follow
			cam_mul = 1.2
			cam_add = 200
			case user_static
			case lock_board
			case lock_skater
			case lock_skater_left
			case lock_skater_right
			cam_mul = 1.1
			cam_add = 100
			default
			cam_mul = 1.0
			cam_add = 0
		endswitch
		score = (<score> * <cam_mul>)
		score = (<score> + <cam_add>)
	endif
	if structurecontains structure = <edit_clip> clip_start
		if gotparam length
			if (((<edit_clip>.clip_start) > 0.0) ||
					((<edit_clip>.clip_end) < <length>))
				score = (<score> * 1.5)
				score = (<score> + 200)
			endif
		endif
	endif
	if structurecontains structure = <edit_clip> clip_speed
		if ((<edit_clip>.clip_speed) > 1.0)
			if ((<edit_clip>.clip_speed) > 1.5)
				score = (<score> * 0.35000002)
			else
				score = (<score> * 0.65000004)
			endif
		elseif ((<edit_clip>.clip_speed) < 1.0)
			if ((<edit_clip>.clip_speed) < 0.6)
				score = (<score> * 2.0)
				score = (<score> + 200)
			else
				score = (<score> * 1.5)
				score = (<score> + 100)
			endif
		endif
	endif
	printf '        clip score=%s events=%e' s = <score> e = <num_events>
	return clip_score = <score> num_events = <num_events>
endscript

script ve_score_get_event_score 
	switch (<event>.type)
		case ntt
		return event_score = (200 + ((<event>.num_branches) * 50))
		case trick
		if ((<event>.trick_name) = Aggro)
			return event_score = 100
		else
			return event_score = (<event>.trick_score)
		endif
		case bailhit
		return event_score = ((<event>.magnitude) * 0.5)
		case ollie
		return event_score = 50
		case landed
		return event_score = 50
		case bailstart
		return event_score = 100
		case ShatterAndDie
		case Z_Bell_Shatter_replay
		case Z_Slums_Shatter_wood_replay
		case Z_Slums_Shatter_wood_air_replay
		return event_score = 200
		default
		return event_score = 0
	endswitch
endscript

script ve_score_array 
	active_time = 0.0
	inactive_time = 0.0
	combine_time = 0.0
	array_score = 0.0
	getarraysize <array>
	if (<array_size> > 0)
		i = 0
		begin
		if <score_callback> item = (<array> [<i>])
			active_time = (<active_time> + ((<array> [<i>]).length))
			combine_time = (<combine_time> + (((<array> [<i>]).length) * <combined>))
		else
			inactive_time = (<inactive_time> + ((<array> [<i>]).length))
		endif
		array_score = (<array_score> + <score>)
		i = (<i> + 1)
		repeat <array_size>
	endif
	coverage = (<active_time> / <entire_length>)
	cheese_reduction = 0.0
	if (<coverage> > <coverage_cheese>)
		cheese_mult = (<coverage_cheese> / <coverage>)
		cheese_reduction = (<cheese_reduction> + ((<array_score> * (1.0 - <cheese_mult>)) * ($ve_score_fx_overlay_cheese_mul)))
	endif
	coverage = (<combine_time> / <entire_length>)
	if (<coverage> > ($ve_score_fx_overlay_combine_coverage))
		cheese_mult = (($ve_score_fx_overlay_combine_coverage) / <coverage>)
		cheese_reduction = (<cheese_reduction> + ((<array_score> * (1.0 - <cheese_mult>)) * ($ve_score_fx_overlay_cheese_mul)))
	endif
	total_score = (<array_score> - <cheese_reduction>)
	if ($ve_debug_detail_score = 1)
		printf '    %n score %s-%d=%t' n = <debug_name> s = <array_score> d = <cheese_reduction> t = <total_score>
	endif
	return array_score = <total_score>
endscript

script ve_score_effect 
	getarraysize (<item>.effects)
	if (<array_size> > 0)
		if ((<item>.effects [0]) = none)
			return \{false
				score = 0.0
				combined = 0}
		endif
		return true score = (250.0 * <array_size>) combined = <array_size>
	else
		return \{false
			score = 0.0
			combined = 0}
	endif
endscript

script ve_score_overlay 
	if NOT (<item>.name = none)
		return \{true
			score = 500.0
			combined = 1}
	else
		return \{false
			score = 0.0
			combined = 0}
	endif
endscript
