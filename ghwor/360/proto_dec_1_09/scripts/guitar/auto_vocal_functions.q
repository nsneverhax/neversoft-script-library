vocals_current_pitch_midinote = 0

script vocalist_kill_spawnscripts 
	killspawnedscriptsbyname \{Name = phon_solve_transits}
	killspawnedscriptsbyname \{Name = phon_create_desired_init}
	killspawnedscriptsbyname \{Name = fake_sentance}
	killspawnedscriptsbyname \{Name = phon_timer}
	killspawnedscriptsbyname \{Name = phon_transit}
	killspawnedscriptsbyname \{Name = autovocal_controlscript}
	killspawnedscriptsbyname \{Name = av_face_noise}
	killspawnedscriptsbyname \{Name = av_brow_inflect}
	killspawnedscriptsbyname \{Name = av_pitch_control}
	killspawnedscriptsbyname \{Name = av_mouth_idle}
	killspawnedscriptsbyname \{Name = band_lookat_on}
	killspawnedscriptsbyname \{Name = band_lookat_off}
	killspawnedscriptsbyname \{Name = band_lookat}
	killspawnedscriptsbyname \{Name = av_set_brow}
	killspawnedscriptsbyname \{Name = spawn_auto_vocal_jaw_flap}
	killspawnedscriptsbyname \{Name = auto_vocal_jaw_flap}
	killspawnedscriptsbyname \{Name = debug_phons}
	killspawnedscriptsbyname \{Name = graphblendduration}
endscript

script vocalist_reset_globals 
	vocalist_kill_spawnscripts
	vocalist_reset_vocalist_anim_tree
	Change \{vocal_note = 0}
endscript

script vocalist_reset_vocalist_anim_tree 
	vocalist_ids = [
		musician1
		musician2
		musician3
		musician4
	]
	index = 0
	begin
	if (<vocalist_ids> [<index>]) :Anim_AnimNodeExists id = autovocals_switch
		(<vocalist_ids> [<index>]) :Anim_Command target = autovocals_switch Command = partialswitch_setstate params = {OFF BlendDuration = 0.0}
	endif
	index = (<index> + 1)
	repeat 4
endscript

script init_vocal_arrays 
	extended_checksum = somechecksum
	cycle_branch = 0
	begin
	channel_maker = (<cycle_branch> + 1)
	extendcrcwithinteger checksum = vocal_av_ integer = <channel_maker>
	addchecksumarrayelement array = <channel> element = <extended_checksum>
	channel = <array>
	addfloatarrayelement array = <av_vocal_cycle> element = 0.0
	av_vocal_cycle = <array>
	addchecksumarrayelement array = <phon_branch> element = inctive
	phon_branch = <array>
	addfloatarrayelement array = <waitTime> element = 0.0
	waitTime = <array>
	addfloatarrayelement array = <length> element = 0.0
	length = <array>
	addfloatarrayelement array = <init_length> element = 0.0
	init_length = <array>
	addfloatarrayelement array = <blend_duration> element = 0.0
	blend_duration = <array>
	addfloatarrayelement array = <trans_trigger> element = 0.0
	trans_trigger = <array>
	addchecksumarrayelement array = <first_pass> element = FALSE
	first_pass = <array>
	addfloatarrayelement array = <oldanimstep> element = 0.0
	oldanimstep = <array>
	addchecksumarrayelement array = <anim_end> element = untriggered
	anim_end = <array>
	cycle_branch = (<cycle_branch> + 1)
	repeat ($max_phon_branches)
	return {
		channel = <channel>
		av_vocal_cycle = <av_vocal_cycle>
		phon_branch = <phon_branch>
		waitTime = <waitTime>
		length = <length>
		init_length = <init_length>
		blend_duration = <blend_duration>
		trans_trigger = <trans_trigger>
		first_pass = <first_pass>
		av_vocal_cycle = <av_vocal_cycle>
		oldanimstep = <oldanimstep>
		anim_end = <anim_end>
	}
	channel = [vocal_av_1]
	av_vocal_cycle = [0.0]
	phon_branch = [Active]
	waitTime = [0.0]
	length = [0.0]
	init_length = [0.0]
	blend_duration = [0.0]
	trans_trigger = [0.0]
	first_pass = [true]
	oldanimstep = [0.0]
	anim_end = [untriggered]
endscript

script fake_sentance \{debug = 1}
	if (<newword> = true)
		getrandomfloat \{a = 1.0
			b = 10.0}
		if (<random_float> > 2.0)
			short = 10.0
			long = 300.0
		else
			short = 500.0
			long = 3000.0
		endif
		getrandomfloat a = <short> b = <long>
		wordlength = <random_float>
		if (<wordlength> > 50.0)
			max_syl = 2.0
		elseif (<wordlength> > 100.0)
			max_syl = 3.0
		elseif (<wordlength> > 150.0)
			max_syl = 4.0
		else
			max_syl = 1.0
		endif
		newword = FALSE
		getrandomfloat a = 1.0 b = <max_syl>
		word = <random_float>
	endif
	getrandomfloat \{a = 0.8
		b = 1.2}
	next_phon_length = (<wordlength> * <random_float>)
	if (<sentance> > 1)
		if (<word> > 1.0)
			getrandomfloat \{a = 1.0
				b = 10.0}
			randomdistance = <random_float>
			wordlength = (<wordlength> - (<wordlength> / <word>))
			word = (<word> -1.0)
		else
			getrandomfloat \{a = 50.0
				b = 300.0}
			randomdistance = <random_float>
			newword = true
			sentance = (<sentance> -1)
		endif
	else
		newword = true
		getrandomfloat \{a = 500.0
			b = 5000.0}
		randomdistance = <random_float>
		getrandominteger \{a = 8
			b = 15}
		sentance = <random_integer>
	endif
	next_phon_distance = <randomdistance>
	begin
	getrandominteger \{a = 1
		b = 22}
	randomphon = <random_integer>
	if (<randomphon> != <old_set>)
		break
	endif
	repeat
	fake_speed = 1.0
	next_phon_length = (<next_phon_length> * <fake_speed>)
	next_phon_distance = (<next_phon_distance> * <fake_speed>)
	return {
		next_phon_length = <next_phon_length>
		next_phon_distance = <next_phon_distance>
		randomphon = <randomphon>
		sentance = <sentance>
		newword = <newword>
		word = <word>
		wordlength = <wordlength>
	}
	randomdistance = 0.0
	randomphon = 0
	old_set = 0
	next_phon_distance = 0.0
	randomword = 0.0
endscript

script phon_create_desired_init 
	neutral_init1 = (($neutral_phon) * ($phon_init_point))
	neutral_init2 = (($neutral_phon) * (($phon_sweet_start) - ($phon_init_point)))
	extracted_length = ((1 / (($phon_sweet_end) - ($phon_sweet_start))) * <length>)
	if (<extracted_length> < $fastest_phon)
		extracted_length = ($fastest_phon)
	endif
	extracted_length = (<extracted_length> * (($phon_sweet_start) - ($phon_init_point)))
	desired_init_length = (<neutral_init1> + ((<extracted_length> + <neutral_init2>) * 0.5))
	return desired_init_length = <desired_init_length>
	length = 0.0
endscript

script phon_solve_transits \{current_phon_distance_extra = !f1768515945
		current_phon_length = !f1768515945
		next_phon = !q1768515945
		next_phon_distance = !f1768515945
		next_phon_length = !f1768515945
		current_extra_blend_factor = !f1768515945}
	max_blend_for_distance = ($phon_longest_init)
	if (<current_phon_length> < <next_phon_length>)
		max_blend_for_length = (<current_phon_length> * 2.0)
	else
		max_blend_for_length = (<next_phon_length> * 2.0)
	endif
	if (<max_blend_for_length> > <max_blend_for_distance>)
		max_blend_for_length = <max_blend_for_distance>
	elseif (<max_blend_for_length> < 0.0)
		max_blend_for_length = 0.0
	endif
	if (<next_phon_distance> > <max_blend_for_distance>)
		trans_trigger = 0.0
		blend_dur_factor = (((<next_phon_distance>) - <max_blend_for_distance>) / <max_blend_for_distance>)
		if (<blend_dur_factor> > 1.0)
			blend_dur_factor = 1.0
		endif
		min = ($phon_min_blend_duration)
		Max = (<max_blend_for_distance> / 1000.0)
		trans_trigger = 0.0
		blend_duration = (((<blend_dur_factor>) * (<min>)) + ((1 - <blend_dur_factor>) * (<Max>)))
	else
		critical_blend = (1 - (<next_phon_distance> / <max_blend_for_distance>))
		max_blend_for_length = (<max_blend_for_length> * <critical_blend>)
		trans_trigger = (<max_blend_for_length> * 0.5)
		if (<trans_trigger> > <current_phon_length>)
			trans_trigger = <current_phon_length>
		endif
		blend_duration = ((<max_blend_for_length> + <next_phon_distance>) / 1000.0)
	endif
	obtain_anims_from_phon phon = <next_phon>
	max_extra_blend = 0.15
	extra_blend = (<current_extra_blend_factor> * <max_extra_blend>)
	if (<current_phon_distance_extra> > (<extra_blend> * 1000.0))
		extra_blend = <extra_blend>
	else
		extra_blend = (<current_phon_distance_extra> / 1000.0)
	endif
	trans_trigger = (<trans_trigger> + (<extra_blend> * 1000.0))
	blend_duration = (<blend_duration> + <extra_blend>)
	max_extra_blend = 0.0
	extra_blend = (<next_extra_blend_factor> * <max_extra_blend>)
	blend_duration = (<blend_duration> + <extra_blend>)
	return trans_trigger_x = <trans_trigger> next_blend_duration = <blend_duration> next_extra_blend_factor = <next_extra_blend_factor> next_phon_anim_closed = <next_phon_anim_closed> next_phon_anim_open = <next_phon_anim_open>
	current_phon_distance_extra = 0.0
	next_phon_distance = 0.0
	current_phon_length = 0.0
	next_phon_length = 0.0
	max_overlap = 0.0
	Max = 0.0
	extra_blend_potential = 0.0
	current_extra_blend_factor = 0.0
	next_extra_blend_factor = 0.0
	next_phon_anim_closed = someanim
	next_phon_anim_open = someanim
endscript

script obtain_anims_from_phon \{phon = !q1768515945}
	switch <phon>
		case eh
		next_phon_anim_closed = gh_av_male_eh_closed
		next_phon_anim_open = gh_av_male_eh_open
		next_extra_blend_factor = 1.0
		case th
		next_phon_anim_closed = gh_av_male_th_closed
		next_phon_anim_open = gh_av_male_th_open
		next_extra_blend_factor = 1.0
		case dh
		next_phon_anim_closed = gh_av_male_dh_closed
		next_phon_anim_open = gh_av_male_dh_open
		next_extra_blend_factor = 1.0
		case mbp
		next_phon_anim_closed = gh_av_male_mbp_closed
		next_phon_anim_open = gh_av_male_mbp_open
		next_extra_blend_factor = 0.0
		case oo
		next_phon_anim_closed = gh_av_male_oo_closed
		next_phon_anim_open = gh_av_male_oo_open
		next_extra_blend_factor = 1.0
		case aa
		next_phon_anim_closed = gh_av_male_aa_closed
		next_phon_anim_open = gh_av_male_aa_open
		next_extra_blend_factor = 1.0
		case a
		next_phon_anim_closed = gh_av_male_a_closed
		next_phon_anim_open = gh_av_male_a_open
		next_extra_blend_factor = 1.0
		case r
		next_phon_anim_closed = gh_av_male_r_closed
		next_phon_anim_open = gh_av_male_r_open
		next_extra_blend_factor = 0.2
		case oh
		next_phon_anim_closed = gh_av_male_oh_closed
		next_phon_anim_open = gh_av_male_oh_open
		next_extra_blend_factor = 1.0
		case uh
		next_phon_anim_closed = gh_av_male_uh_closed
		next_phon_anim_open = gh_av_male_uh_open
		next_extra_blend_factor = 1.0
		case fv
		next_phon_anim_closed = gh_av_male_fv_closed
		next_phon_anim_open = gh_av_male_fv_open
		next_extra_blend_factor = 0.2
		case ai
		next_phon_anim_closed = gh_av_male_ai_closed
		next_phon_anim_open = gh_av_male_ai_open
		next_extra_blend_factor = 1.0
		case sh
		next_phon_anim_closed = gh_av_male_sh_closed
		next_phon_anim_open = gh_av_male_sh_open
		next_extra_blend_factor = 1.0
		case eee
		next_phon_anim_closed = gh_av_male_eee_closed
		next_phon_anim_open = gh_av_male_eee_open
		next_extra_blend_factor = 1.0
		case eh
		next_phon_anim_closed = gh_av_male_eh_closed
		next_phon_anim_open = gh_av_male_eh_open
		next_extra_blend_factor = 1.0
		case l
		next_phon_anim_closed = gh_av_male_l_closed
		next_phon_anim_open = gh_av_male_l_open
		next_extra_blend_factor = 1.0
		case k
		next_phon_anim_closed = gh_av_male_k_closed
		next_phon_anim_open = gh_av_male_k_open
		next_extra_blend_factor = 1.0
		case s
		next_phon_anim_closed = gh_av_male_s_closed
		next_phon_anim_open = gh_av_male_s_open
		next_extra_blend_factor = 1.0
		case y
		next_phon_anim_closed = gh_av_male_y_closed
		next_phon_anim_open = gh_av_male_y_open
		next_extra_blend_factor = 1.0
		case dn
		next_phon_anim_closed = gh_av_male_dn_closed
		next_phon_anim_open = gh_av_male_dn_open
		next_extra_blend_factor = 1.2
		case w
		next_phon_anim_closed = gh_av_male_w_closed
		next_phon_anim_open = gh_av_male_w_open
		next_extra_blend_factor = 1.0
		case ow
		next_phon_anim_closed = gh_av_male_ow_closed
		next_phon_anim_open = gh_av_male_ow_open
		next_extra_blend_factor = 1.0
		case oi
		next_phon_anim_closed = gh_av_male_oi_closed
		next_phon_anim_open = gh_av_male_oi_open
		next_extra_blend_factor = 1.0
		default
		next_phon_anim_closed = gh_rocker_male_default
		next_phon_anim_open = gh_rocker_male_default
		next_extra_blend_factor = 1.0
	endswitch
	return next_phon_anim_closed = <next_phon_anim_closed> next_phon_anim_open = <next_phon_anim_open> next_extra_blend_factor = <next_extra_blend_factor>
endscript

script check_for_vocalists 
	array = []
	num_vocalists = 0
	musician_id = musician1
	musician_info = musician1_info
	index = 0
	begin
	switch <index>
		case 0
		musician_id = musician1
		musician_info = musician1_info
		case 1
		musician_id = musician2
		musician_info = musician2_info
		case 2
		musician_id = musician3
		musician_info = musician3_info
		case 3
		musician_id = musician4
		musician_info = musician4_info
	endswitch
	if ($<musician_info>.part = vocals)
		addchecksumarrayelement array = <array> element = <musician_id>
		num_vocalists = (<num_vocalists> + 1)
		if (<num_vocalists> >= $number_vocalists_created)
			break
		endif
	endif
	index = (<index> + 1)
	repeat 4
	if (<num_vocalists> > 0)
		return true vocalist_ids = <array> num_vocalists = <num_vocalists>
	else
		return \{FALSE}
	endif
endscript

script graphblendduration 
	begin
	GetSongTimeMs \{time_offset = $vocals_offset}
	if (<time> > <next_phon_time>)
		if (<time> > (<next_phon_time> + <next_phon_length>))
			break
		else
			generic_graph_printer graphme = <graphvalue>
		endif
	else
	endif
	WaitOneGameFrame
	repeat
endscript
global_blend_duration = 0.0

script debug_phons 
	SpawnScriptNow graphblendduration params = {
		graphvalue = ($global_blend_duration)
		next_phon_length = <next_phon_length>
		next_phon_time = <next_phon_time>
		channel = mydebug
	}
	Change global_blend_duration = (($global_blend_duration) + 0.2)
	if (($global_blend_duration) > 1.0)
		Change global_blend_duration = (($global_blend_duration) -1.0)
	endif
endscript
