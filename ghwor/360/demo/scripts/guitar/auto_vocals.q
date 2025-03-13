g_reset_brow_inflect = 0
g_av_brow_inflect_current_distance = 0.0
g_av_brow_inflect_current_syllable_length = 0.0
autovocaltest = 1
number_vocalists_created = 4
vocals_offset = 150.0
test_vocal_culling = 1
test_vocal_side_by_side = 0
vocal_note = 0
av_pitch_volume = 1.0
g_jaw_flap_busy = false
g_current_jawflap_queue = 0
g_pitch_quiver = 1.0
av_brow_priority = 0
av_face_idle_distance = 750.0
av_brow_inflect_distance = 400.0
av_brow_relax_distance = 700.0
av_brow_mod_amp = 0.2
av_brow_mod_base = 0.0
av_brow_mod_freq = 1.2
av_brow_emot_amp = 0.2
av_brow_emot_base = 0.5
av_brow_emot_freq = 0.5
av_brow_scrub_amp = 0.2
av_brow_scrub_base = 0.5
av_brow_scrub_freq = 0.2
max_phon_branches = 6
phon_min_blend_duration = 0.0
phon_face_noise = 0.5
phon_average_frame = 16.667658
phon_longest_init = 750.0
phon_shortest_init = 300.0
phon_init_point = 0.15
phon_out_point = 0.87
phon_sweet_start = 0.42000002
phon_sweet_end = 0.58
fastest_phon = 530.0
neutral_phon = 1100.0

script autovocal_controlscript \{stagger_branch = 0
		newword = true
		word = 1.0
		sentance = 5
		wordlength = 100.0
		randomphon = 0}
	av_global_array_index = 0
	vocalist_ids = []
	num_vocalists = 0
	if NOT check_for_vocalists
		return
	endif
	autovocal_phonemessupported
	if (<phonemes_supported> = 0)
		return
	endif
	if ($test_vocal_side_by_side = 1)
		vocalist_ids = [musician3]
		num_vocalists = 1
	endif
	fastspawnscriptnow script_name = av_pitch_control params = {vocalist_ids = <vocalist_ids> num_vocalists = <num_vocalists>}
	fastspawnscriptnow script_name = av_set_brow params = {vocalist_ids = <vocalist_ids> num_vocalists = <num_vocalists>}
	channel = []
	av_vocal_cycle = []
	phon_branch = []
	waittime = []
	length = []
	init_length = []
	blend_duration = []
	trans_trigger = []
	first_pass = []
	oldanimstep = []
	anim_end = []
	extended_checksum = somechecksum
	cycle_branch = 0
	begin
	channel_maker = (<cycle_branch> + 1)
	extendcrcwithinteger checksum = vocal_av_ integer = <channel_maker>
	addchecksumarrayelement array = <channel> element = <extended_checksum>
	channel = <array>
	addfloatarrayelement array = <av_vocal_cycle> element = 0.0
	av_vocal_cycle = <array>
	addchecksumarrayelement array = <phon_branch> element = inactive
	phon_branch = <array>
	addfloatarrayelement array = <waittime> element = 0.0
	waittime = <array>
	addfloatarrayelement array = <length> element = 0.0
	length = <array>
	addfloatarrayelement array = <init_length> element = 0.0
	init_length = <array>
	addfloatarrayelement array = <blend_duration> element = 0.0
	blend_duration = <array>
	addfloatarrayelement array = <trans_trigger> element = 0.0
	trans_trigger = <array>
	addchecksumarrayelement array = <first_pass> element = false
	first_pass = <array>
	addfloatarrayelement array = <oldanimstep> element = 0.0
	oldanimstep = <array>
	addchecksumarrayelement array = <anim_end> element = untriggered
	anim_end = <array>
	cycle_branch = (<cycle_branch> + 1)
	repeat ($max_phon_branches)
	next_phon_length = 0.0
	next_phon_distance = 0.0
	next_next_phon_distance = 0.0
	next_phon_time = 0.0
	next_blend_duration = 0.1
	current_phon_time = 0.0
	current_phon_length = 0.0
	requested_jawflap_queue = 0
	changeglobalfloat \{global_name = av_pitch_volume
		new_value = 1.0}
	changeglobalchecksum \{global_name = g_jaw_flap_busy
		new_value = false}
	changeglobalinteger \{global_name = g_current_jawflap_queue
		new_value = 0}
	index = 0
	begin
	(<vocalist_ids> [<index>]) :anim_command target = autovocals_switch command = partialswitch_setstate params = {on blendduration = 0.0}
	(<vocalist_ids> [<index>]) :anim_command target = autovocals_mouth_idle command = partialswitch_setstate params = {off blendduration = 0.0}
	(<vocalist_ids> [<index>]) :animpreview_setsourcevalues {
		av_pitch_volume = 0.0
	}
	index = (<index> + 1)
	repeat <num_vocalists>
	begin
	getsongtimems \{time_offset = $vocals_offset}
	if (<time> >= 0.0)
		break
	endif
	waitonegameframe
	repeat
	autovocal_iterator {
		index = <av_global_array_index>
		last_phon_time = 0.0
		last_phon_length = 0.0
	}
	<av_global_array_index> = <next_index>
	obtain_anims_from_phon phon = <next_phon>
	new_phon = true
	timestamp = 0.0
	changeglobalinteger \{global_name = g_reset_brow_inflect
		new_value = 0}
	fastspawnscriptnow \{script_name = av_brow_inflect
		params = {
		}}
	begin
	frame_length = 0.0
	getframelength
	frame_length = (<frame_length> * 1000.0)
	if (<new_phon> = true)
		changeglobalinteger global_name = vocal_note new_value = (($vocal_note) + 1)
		getsongtimems \{time_offset = $vocals_offset}
		miss = ((<current_phon_time> + <current_phon_length>) - <time>)
		length_x = (<next_phon_length>)
		distance = (<next_phon_distance> + <miss>)
		real_distance = <next_phon_distance>
		blend_duration_x = <next_blend_duration>
		phoneme_x = <next_phon>
		current_phon_time = <next_phon_time>
		current_phon_length = <next_phon_length>
		current_phon_distance = <next_phon_distance>
		current_syllable_length = <next_syllable_length>
		phon_anim_closed = <next_phon_anim_closed>
		phon_anim_open = <next_phon_anim_open>
		if (<distance> > 750.0)
			fastspawnscriptnow script_name = av_mouth_idle params = {distance = <distance> num_vocalists = <num_vocalists> vocalist_ids = <vocalist_ids>}
		endif
		phon_create_desired_init length = <length_x>
		if (<desired_init_length> > $phon_longest_init)
			desired_init_length = ($phon_longest_init)
		endif
		if (<distance> > (<desired_init_length>))
			init_length_x = (<desired_init_length>)
			waittime_x = (<distance> - <desired_init_length>)
			start_x = 0.0
		else
			init_length_x = (<distance>)
			start_x = (($phon_sweet_start) - ((<distance> / <desired_init_length>) * ($phon_sweet_start)))
			waittime_x = 0.0
		endif
		autovocal_iterator {
			index = <av_global_array_index>
			last_phon_time = <next_phon_time>
			last_phon_length = <next_phon_length>
		}
		<av_global_array_index> = <next_index>
		phon_solve_transits {
			current_phon_distance_extra = (<miss>)
			current_phon_length = (<length_x> + <real_distance>)
			next_phon = <next_phon>
			next_phon_distance = <next_phon_distance>
			next_phon_length = (<next_phon_length> + <next_next_phon_distance>)
			current_extra_blend_factor = <next_extra_blend_factor>
		}
		if (<current_syllable_length> > 0.0)
			fastspawnscriptnow script_name = spawn_auto_vocal_jaw_flap params = {
				current_syllable_length = <current_syllable_length>
				distance = <distance>
				num_vocalists = <num_vocalists>
				vocalist_ids = <vocalist_ids>
				requested_jawflap_queue = <requested_jawflap_queue>
			}
			changeglobalfloat global_name = g_av_brow_inflect_current_distance new_value = <distance>
			changeglobalfloat global_name = g_av_brow_inflect_current_syllable_length new_value = <current_syllable_length>
			changeglobalinteger \{global_name = g_reset_brow_inflect
				new_value = 1}
			requested_jawflap_queue = (<requested_jawflap_queue> + 1)
			current_syllable_length = 0.0
		endif
		setchecksumarrayelement array = <phon_branch> index = <stagger_branch> new_value = active
		setfloatarrayelement array = <av_vocal_cycle> index = <stagger_branch> new_value = <start_x>
		setfloatarrayelement array = <waittime> index = <stagger_branch> new_value = <waittime_x>
		setfloatarrayelement array = <length> index = <stagger_branch> new_value = <length_x>
		setfloatarrayelement array = <init_length> index = <stagger_branch> new_value = <init_length_x>
		setfloatarrayelement array = <blend_duration> index = <stagger_branch> new_value = <blend_duration_x>
		setchecksumarrayelement array = <anim_end> index = <stagger_branch> new_value = untriggered
		setfloatarrayelement array = <trans_trigger> index = <stagger_branch> new_value = <trans_trigger_x>
		setchecksumarrayelement array = <first_pass> index = <stagger_branch> new_value = true
		stagger_branch = (<stagger_branch> + 1)
		if (<stagger_branch> > ($max_phon_branches -1))
			<stagger_branch> = 0
		endif
		getframelength
		frame_length1 = (<frame_length> * 1000.0)
		waitonegameframe
		getframelength
		frame_length = ((<frame_length> * 1000.0) + <frame_length1>)
		new_phon = false
	endif
	cycle_branch = 0
	begin
	if ((<phon_branch> [<cycle_branch>]) = active)
		if ((<waittime> [<cycle_branch>]) = 0.0)
			if ((<first_pass> [<cycle_branch>]) = true)
				fastspawnscriptnow script_name = phon_transit params = {
					blend_duration = (<blend_duration> [<cycle_branch>])
					phon_anim_open = <phon_anim_open>
					phon_anim_closed = <phon_anim_closed>
					cycle_branch = <cycle_branch>
					vocalist_ids = <vocalist_ids>
					num_vocalists = <num_vocalists>
				}
				setchecksumarrayelement array = <first_pass> index = <cycle_branch> new_value = false
			endif
			phon_timer {
				channel = (<channel> [<cycle_branch>])
				timer = (<av_vocal_cycle> [<cycle_branch>])
				length = (<length> [<cycle_branch>])
				oldanimstep = (<oldanimstep> [<cycle_branch>])
				init_length = (<init_length> [<cycle_branch>])
				anim_end = (<anim_end> [<cycle_branch>])
				trans_trigger = (<trans_trigger> [<cycle_branch>])
				frame_length = <frame_length>
				new_phon = <new_phon>
			}
			setfloatarrayelement array = <av_vocal_cycle> index = <cycle_branch> new_value = <timer>
			setfloatarrayelement array = <length> index = <cycle_branch> new_value = <length_x>
			setfloatarrayelement array = <oldanimstep> index = <cycle_branch> new_value = <oldanimstep_x>
			setfloatarrayelement array = <init_length> index = <cycle_branch> new_value = <init_length_x>
			setchecksumarrayelement array = <anim_end> index = <cycle_branch> new_value = <anim_end_x>
			if (<timer> = 1.0)
				setchecksumarrayelement array = <phon_branch> index = <cycle_branch> new_value = inactive
			endif
		else
			<new_wait_time> = ((<waittime> [<cycle_branch>]) - <frame_length>)
			if (<new_wait_time> < 0.0)
				setfloatarrayelement array = <waittime> index = <cycle_branch> new_value = 0.0
			else
				setfloatarrayelement array = <waittime> index = <cycle_branch> new_value = <new_wait_time>
			endif
		endif
	endif
	cycle_branch = (<cycle_branch> + 1)
	repeat $max_phon_branches
	index = 0
	begin
	(<vocalist_ids> [<index>]) :animpreview_setsourcevalues {
		av_vocal_cycle_0 = (<av_vocal_cycle> [0])
		av_vocal_cycle_1 = (<av_vocal_cycle> [1])
		av_vocal_cycle_2 = (<av_vocal_cycle> [2])
		av_vocal_cycle_3 = (<av_vocal_cycle> [3])
		av_vocal_cycle_4 = (<av_vocal_cycle> [4])
		av_vocal_cycle_5 = (<av_vocal_cycle> [5])
	}
	index = (<index> + 1)
	repeat <num_vocalists>
	waitonegameframe
	timestamp = (<timestamp> + <frame_length>)
	repeat
	trans_trigger_x = 0.0
	oldanimstep_x = 0.0
	anim_end_x = untriggered
	target = musician1
	timer = 0.0
	extended_checksum = meu
	channel = [vocal_av_0]
	av_vocal_cycle = [0.0]
	phon_branch = [active]
	waittime = [0.0]
	length = [0.0]
	init_length = [0.0]
	blend_duration = [0.0]
	trans_trigger = [0.0]
	first_pass = [false]
	oldanimstep = [0.0]
	anim_end = [untriggered]
	next_phon_anim_closed = someanims
	next_phon_anim_open = someanims
	next_extra_blend_factor = 0.0
	phon_anim_open = someanims
	phon_anim_closed = someanims
	current_syllable_length = 0.0
	next_syllable_length = 0.0
endscript

script spawn_auto_vocal_jaw_flap 
	begin
	getframelength
	frame_length = (<frame_length> * 1000.0)
	if (<requested_jawflap_queue> = $g_current_jawflap_queue)
		break
	endif
	distance = (<distance> - <frame_length>)
	if (<distance> < 0.0)
		distance = 0.0
	endif
	waitonegameframe
	repeat
	begin
	if ($g_jaw_flap_busy = true)
		distance = (<distance> - <frame_length>)
		if (<distance> < 0.0)
			distance = 0.0
		endif
	else
		changeglobalchecksum \{global_name = g_jaw_flap_busy
			new_value = true}
		changeglobalinteger global_name = g_current_jawflap_queue new_value = (($g_current_jawflap_queue) + 1)
		break
	endif
	waitonegameframe
	getframelength
	frame_length = (<frame_length> * 1000.0)
	repeat
	longest_forward_shift = 250.0
	if (<distance> < <longest_forward_shift>)
		current_syllable_length = (<current_syllable_length> + <distance>)
		distance = 0.0
	else
		current_syllable_length = (<current_syllable_length> + <longest_forward_shift>)
		distance = (<distance> - <longest_forward_shift>)
	endif
	distance = (<distance> / 1000.0)
	waitseconds num_seconds = <distance>
	killspawnedscriptsbyname \{name = auto_vocal_jaw_flap}
	fastspawnscriptnow script_name = auto_vocal_jaw_flap params = {
		current_syllable_length = <current_syllable_length>
		num_vocalists = <num_vocalists>
		vocalist_ids = <vocalist_ids>
		frame_length = <frame_length>
	}
	distance = 0.0
	requested_jawflap_queue = 0
	current_syllable_length = 0.0
	num_vocalists = 1
	vocalist_ids = []
endscript

script auto_vocal_jaw_flap 
	end_of_sequence = untriggered
	pitch_volume_lerp_speed = 0.33
	fastest_syllable = 150.0
	slowest_syllable = 550.0
	av_pitch_volume = ($av_pitch_volume)
	current_pitch_volume = ($av_pitch_volume)
	remaining_length = (<current_syllable_length> - <frame_length>)
	accept_pitch_quiver = 0.0
	pitch_quiver_ramp_in_duration = 250.0
	if (<current_syllable_length> > <slowest_syllable>)
		ramp_percent_of_current_syllable = (<slowest_syllable> / <current_syllable_length>)
		smooth_ease_out_start_point = (1.0 - (<ramp_percent_of_current_syllable> * 0.5))
		smooth_ease_in_end_point = (<ramp_percent_of_current_syllable> * 0.5)
		jaw_open_duration = ((1.0 - <ramp_percent_of_current_syllable>) * <current_syllable_length>)
		pitch_quiver_max = (<jaw_open_duration> / <pitch_quiver_ramp_in_duration>)
		if (<pitch_quiver_max> > 1.0)
			pitch_quiver_max = 1.0
		endif
	else
		smooth_ease_out_start_point = 0.5
		smooth_ease_in_end_point = 0.5
		pitch_quiver_max = 0.0
		jaw_open_duration = 0.0
	endif
	remaining_jaw_open_length = <jaw_open_duration>
	smooth_ease_in_start_point = (1.0 - ((1.0 - <smooth_ease_out_start_point>) * 0.5))
	smooth_ease_out_end_point = (<smooth_ease_in_end_point> * 0.5)
	begin
	getframelength
	frame_length = (<frame_length> * 1000.0)
	remaining_length_factor = (<remaining_length> / <current_syllable_length>)
	if (<remaining_length_factor> > <smooth_ease_in_start_point>)
		current_range_factor = ((<remaining_length_factor> - <smooth_ease_in_start_point>) / (1 - <smooth_ease_in_start_point>))
		current_range_factor = (1.0 - <current_range_factor>)
		current_range_factor = (<current_range_factor> * <current_range_factor> * <current_range_factor>)
		current_range_factor = (1.0 - <current_range_factor>)
		target_pitch_volume = ((<current_pitch_volume> * <current_range_factor>) + ((0.5 * <current_pitch_volume>) * (1.0 - <current_range_factor>)))
	elseif (<remaining_length_factor> > <smooth_ease_out_start_point>)
		current_range_factor = ((<remaining_length_factor> - <smooth_ease_out_start_point>) / (<smooth_ease_in_start_point> - <smooth_ease_out_start_point>))
		current_range_factor = (<current_range_factor> * <current_range_factor> * <current_range_factor>)
		target_pitch_volume = (((0.5 * <current_pitch_volume>) * <current_range_factor>))
	elseif (<remaining_length_factor> > <smooth_ease_in_end_point>)
		target_pitch_volume = 0.0
		remaining_jaw_open_factor = (<remaining_jaw_open_length> / <jaw_open_duration>)
		if (<remaining_jaw_open_factor> > 0.5)
			current_range_factor = ((1.0 - <remaining_jaw_open_factor>) * 2.0)
			current_range_factor = (<current_range_factor> * <current_range_factor> * <current_range_factor>)
			current_range_factor = (<current_range_factor> * 0.5)
		else
			current_range_factor = (((1.0 - <remaining_jaw_open_factor>) * 2.0) -1.0)
			current_range_factor = (1.0 - <current_range_factor>)
			current_range_factor = (<current_range_factor> * <current_range_factor> * <current_range_factor>)
			current_range_factor = (1.0 - <current_range_factor>)
			current_range_factor = ((<current_range_factor> * 0.5) + 0.5)
		endif
		if (<current_range_factor> > 1.0)
			current_range_factor = 1.0
		endif
		accept_pitch_quiver = (<current_range_factor> * <pitch_quiver_max>)
		remaining_jaw_open_length = (<remaining_jaw_open_length> - <frame_length>)
		if (<remaining_jaw_open_length> < 0.0)
			remaining_jaw_open_length = 0.0
		endif
	elseif (<remaining_length_factor> > <smooth_ease_out_end_point>)
		current_range_factor = ((<remaining_length_factor> - <smooth_ease_out_end_point>) / (<smooth_ease_in_end_point> - <smooth_ease_out_end_point>))
		current_range_factor = (1.0 - <current_range_factor>)
		current_range_factor = (<current_range_factor> * <current_range_factor> * <current_range_factor>)
		current_range_factor = (1.0 - <current_range_factor>)
		target_pitch_volume = ((0.5 * (1.0 - <current_range_factor>)))
		accept_pitch_quiver = (<pitch_quiver_max> * (1.0 - <target_pitch_volume>))
	else
		current_range_factor = (<remaining_length_factor> / <smooth_ease_out_end_point>)
		current_range_factor = (<current_range_factor> * <current_range_factor> * <current_range_factor>)
		target_pitch_volume = ((0.5 * <current_range_factor>) + (1.0 * (1.0 - <current_range_factor>)))
		accept_pitch_quiver = (<pitch_quiver_max> * (1.0 - <target_pitch_volume>))
	endif
	av_pitch_volume = (<av_pitch_volume> + ((<target_pitch_volume> - <av_pitch_volume>) * <pitch_volume_lerp_speed>))
	av_pitch_volume_inverted = (1.0 - <av_pitch_volume>)
	av_pitch_volume_quiver = (<av_pitch_volume_inverted> * (1.0 - (($g_pitch_quiver) * <accept_pitch_quiver>)))
	index = 0
	begin
	(<vocalist_ids> [<index>]) :animpreview_setsourcevalues {
		av_pitch_volume = <av_pitch_volume_quiver>
	}
	index = (<index> + 1)
	repeat <num_vocalists>
	changeglobalfloat global_name = av_pitch_volume new_value = <av_pitch_volume>
	remaining_length = (<remaining_length> - <frame_length>)
	if (<remaining_length> < 0.0)
		remaining_length = 0.0
	endif
	if (<end_of_sequence> = untriggered)
		if (<target_pitch_volume> = 1.0)
			changeglobalchecksum \{global_name = g_jaw_flap_busy
				new_value = false}
			end_of_sequence = triggered
		endif
	endif
	waitonegameframe
	repeat
	vocalist_ids = []
endscript

script av_mouth_idle 
	waittime = ((<distance> -750.0) / 1000.0)
	index = 0
	begin
	(<vocalist_ids> [<index>]) :anim_command target = autovocals_mouth_idle command = partialswitch_setstate params = {on blendduration = 2.0}
	index = (<index> + 1)
	repeat <num_vocalists>
	waitseconds num_seconds = <waittime>
	index = 0
	begin
	(<vocalist_ids> [<index>]) :anim_command target = autovocals_mouth_idle command = partialswitch_setstate params = {off blendduration = 0.75}
	index = (<index> + 1)
	repeat <num_vocalists>
	distance = 0.0
	vocalist_ids = []
	waittime = 0.0
endscript

script phon_timer 
	getnumframes = (($fastest_phon) / <frame_length>)
	fastest_animstep = (1 / <getnumframes>)
	getnumframes = (($neutral_phon) / <frame_length>)
	neutral_animstep = (1 / <getnumframes>)
	if (<init_length> > <frame_length>)
		getnumframes = (<init_length> / <frame_length>)
		animstep = ((($phon_sweet_start) - <timer>) / <getnumframes>)
		init_length = (<init_length> - <frame_length>)
	else
		length = (<length> + <init_length>)
		init_length = 0.0
		if (<length> > <frame_length>)
			getnumframes = (<length> / <frame_length>)
			animstep = ((($phon_sweet_end) - <timer>) / <getnumframes>)
			if (<animstep> > <fastest_animstep>)
				animstep = <fastest_animstep>
			endif
			length = (<length> - <frame_length>)
		else
			length = 0.0
			animstep = (<oldanimstep> * <frame_length>)
			if (<animstep> < (0.005))
				animstep = (0.005)
			endif
		endif
	endif
	oldanimstep = (<animstep> / <frame_length>)
	if (<timer> < ($phon_init_point))
		nat_fact = 1.0
	elseif (<timer> > ($phon_out_point))
		nat_fact = 1.0
	else
		if (<timer> > ($phon_sweet_end))
			nat_fact = ((<timer> - ($phon_sweet_end)) / (($phon_out_point) - ($phon_sweet_end)))
		elseif (<timer> < ($phon_sweet_start))
			nat_fact = (1 - ((<timer> - ($phon_init_point)) / (($phon_sweet_start) - ($phon_init_point))))
		else
			nat_fact = 0.0
		endif
	endif
	if (<nat_fact> < 0.5)
		nat_fact_exp = (<nat_fact> / 0.5)
		nat_fact = (<nat_fact> * <nat_fact_exp>)
	else
		nat_fact = (1 - <nat_fact>)
		nat_fact_exp = (<nat_fact> / 0.5)
		nat_fact = (<nat_fact> * <nat_fact_exp>)
		nat_fact = (1 - <nat_fact>)
	endif
	animstep = ((<neutral_animstep> * <nat_fact>) + (<animstep> * (1 - <nat_fact>)))
	timer = (<timer> + <animstep>)
	if (<timer> > 1.0)
		timer = 1.0
	endif
	if (<anim_end> = untriggered)
		if (((<length> + <init_length>) - <trans_trigger>) < <frame_length>)
			new_phon = true
			anim_end = triggered
		endif
	endif
	return {
		timer = <timer>
		length_x = <length>
		oldanimstep_x = <oldanimstep>
		init_length_x = <init_length>
		anim_end_x = <anim_end>
		new_phon = <new_phon>
	}
	frame_length = 0.0
	getnumframes = 0.0
	fastest_animstep = 0.0
	oldanimstep = 0.0
	neutral_animstep = 0.0
	trans_trigger = 0.0
	channel = channel
endscript

script phon_transit \{blend_duration = !f1768515945
		phon_anim_open = !q1768515945
		phon_anim_closed = !q1768515945
		cycle_branch = !i1768515945
		vocalist_ids = !a1768515945
		num_vocalists = !i1768515945}
	switch <cycle_branch>
		case 0
		tree = vocal_tree0
		case 1
		tree = vocal_tree1
		case 2
		tree = vocal_tree2
		case 3
		tree = vocal_tree3
		case 4
		tree = vocal_tree4
		case 5
		tree = vocal_tree5
	endswitch
	if (<blend_duration> < 0.0)
		blend_duration = 0.0
	endif
	index = 0
	begin
	(<vocalist_ids> [<index>]) :anim_command target = db_phonemes command = degenerateblend_addbranch params = {
		blendduration = <blend_duration>
		blendcurve = [1.0 , 0.9927929 , 0.96739 , 0.917625 , 0.83599997 , 0.71251297 , 0.532572 , 0.351678 , 0.224389 , 0.13563298 , 0.0755247 , 0.036990996 , 0.0145622995 , 0.003675 , 0.00019258501 , 0.0]
		tree = $<tree>
		params = {
			anim_open = <phon_anim_open>
			anim_closed = <phon_anim_closed>
		}
	}
	index = (<index> + 1)
	repeat <num_vocalists>
endscript

script av_pitch_control 
	old_pitch = 0.0
	max_pitch_diff = 3.0
	pitch_quiver = 0.0
	pitch_quiver_ascend = 0.0
	smooth_pitch_quiver = 0.0
	pitch_quiver_ascend_rate = 0.1
	pitch_quiver_degrade_rate = 0.08
	smooth_pitch_quiver_lerp_rate = 0.5
	begin
	pitch = $vocals_current_pitch_midinote
	pitch_diff = (<pitch> - <old_pitch>)
	if (<pitch_diff> < 0.0)
		pitch_diff = (<pitch_diff> * (0.0 -1.0))
	endif
	if (<pitch_diff> > <max_pitch_diff>)
		pitch_diff = <max_pitch_diff>
	endif
	if (<pitch_diff> = 0.0)
		pitch_quiver = (<pitch_quiver> - <pitch_quiver_degrade_rate>)
		if (<pitch_quiver> < 0.0)
			pitch_quiver = 0.0
		endif
	else
		pitch_quiver = (<pitch_diff> / <max_pitch_diff>)
	endif
	pitch_quiver_ascend = (<pitch_quiver_ascend> + <pitch_quiver_ascend_rate>)
	if (<pitch_quiver_ascend> > <pitch_quiver>)
		pitch_quiver_ascend = <pitch_quiver>
	endif
	smooth_pitch_quiver = (<smooth_pitch_quiver> + ((<pitch_quiver_ascend> - <smooth_pitch_quiver>) * <smooth_pitch_quiver_lerp_rate>))
	changeglobalfloat global_name = g_pitch_quiver new_value = <smooth_pitch_quiver>
	getsongtimems \{time_offset = $vocals_offset}
	waitonegameframe
	old_pitch = <pitch>
	repeat
	vocalist_ids = []
endscript

script av_brow_inflect_trans \{total_deduction = 0.0}
	if ($g_reset_brow_inflect = 1)
		return total_deduction = <total_deduction>
	endif
	mod_base_n = 0.0
	emot_base_n = 0.5
	scrub_base_n = 0.5
	max_offset = (<max_offset> * 1.6)
	mod_base1 = ($av_brow_mod_base)
	emot_base1 = ($av_brow_emot_base)
	scrub_base1 = ($av_brow_scrub_base)
	getrandomfloat a = (<emot_base1> - (<emot_base1> * <max_offset>)) b = (<emot_base1> + ((1 - <emot_base1>) * <max_offset>))
	emot_base2 = <random_float>
	getrandomfloat a = (<scrub_base1> - (<scrub_base1> * <max_offset>)) b = (<scrub_base1> + ((1 - <scrub_base1>) * <max_offset>))
	scrub_base2 = <random_float>
	getrandomfloat a = (<mod_base1> - (<mod_base1> * <max_offset>)) b = (<mod_base1> + ((1 - <mod_base1>) * <max_offset>))
	mod_base2 = <random_float>
	mod_base2 = ((<mod_base_n> * <neutral_amount>) + (<mod_base2> * (1 - <neutral_amount>)))
	emot_base2 = ((<emot_base_n> * <neutral_amount>) + (<emot_base2> * (1 - <neutral_amount>)))
	scrub_base2 = ((<scrub_base_n> * <neutral_amount>) + (<scrub_base2> * (1 - <neutral_amount>)))
	total_trans = <trans_time>
	if (<mod_base2> > 1.0)
		mod_base2 = 1.0
	elseif (<mod_base2> < 0.0)
		mod_base2 = 0.0
	endif
	if (<emot_base2> > 1.0)
		emot_base2 = 1.0
	elseif (<emot_base2> < 0.0)
		emot_base2 = 0.0
	endif
	if (<scrub_base2> > 1.0)
		scrub_base2 = 1.0
	elseif (<scrub_base2> < 0.0)
		scrub_base2 = 0.0
	endif
	begin
	if (<trans_time> < 0.0)
		trans_time = 0.0
	endif
	trans_factor = (<trans_time> / <total_trans>)
	mod_base = ((<mod_base1> * <trans_factor>) + (<mod_base2> * (1 - <trans_factor>)))
	emot_base = ((<emot_base1> * <trans_factor>) + (<emot_base2> * (1 - <trans_factor>)))
	scrub_base = ((<scrub_base1> * <trans_factor>) + (<scrub_base2> * (1 - <trans_factor>)))
	if ($g_reset_brow_inflect = 1)
		return total_deduction = <total_deduction>
	endif
	changeglobalfloat global_name = av_brow_mod_base new_value = <mod_base>
	changeglobalfloat global_name = av_brow_emot_base new_value = <emot_base>
	changeglobalfloat global_name = av_brow_scrub_base new_value = <scrub_base>
	if (<trans_time> = 0.0)
		return total_deduction = <total_deduction>
	endif
	waitonegameframe
	getframelength
	frame_length = (<frame_length> * 1000.0)
	trans_time = (<trans_time> - <frame_length>)
	total_deduction = (<total_deduction> + <frame_length>)
	repeat
	frame_length = 0.0
	total_deduction = 0.0
	neutral_amount = 0.0
	random_float = 0.0
	max_offset = 0.0
endscript

script av_set_brow 
	old_av_brow_scrub = 0.5
	old_av_brow_mod = 0.0
	old_av_brow_emot = 0.5
	speed = 0.1
	begin
	av_brow_scrub = (<old_av_brow_scrub> + ((($av_brow_scrub_base) - <old_av_brow_scrub>) * <speed>))
	av_brow_mod = (<old_av_brow_mod> + ((($av_brow_mod_base) - <old_av_brow_mod>) * <speed>))
	av_brow_emot = (<old_av_brow_emot> + ((($av_brow_emot_base) - <old_av_brow_emot>) * <speed>))
	mod_factor = (0.5 - <av_brow_scrub>)
	if (<mod_factor> < 0.0)
		mod_factor = (<mod_factor> * (0 -1))
	endif
	mod_factor2 = (0.5 - <av_brow_emot>)
	if (<mod_factor2> < 0.0)
		mod_factor2 = (<mod_factor2> * (0 -1))
	endif
	mod_factor = (<mod_factor> + <mod_factor2>)
	final_brow_mod = (<av_brow_mod> + ((1 - <av_brow_mod>) * <mod_factor>))
	if (<final_brow_mod> > 1.0)
		final_brow_mod = 1.0
	endif
	index = 0
	begin
	(<vocalist_ids> [<index>]) :animpreview_setsourcevalues {
		av_brow_scrub = <av_brow_scrub>
		av_brow_mod = <final_brow_mod>
		av_brow_emot = <av_brow_emot>
	}
	index = (<index> + 1)
	repeat <num_vocalists>
	old_av_brow_scrub = <av_brow_scrub>
	old_av_brow_mod = <av_brow_mod>
	old_av_brow_emot = <av_brow_emot>
	waitonegameframe
	repeat
endscript

script av_brow_inflect 
	min_offset = 0.2
	max_length = 1500.0
	<distance> = 0.0
	<length> = 0.0
	changeglobalinteger \{global_name = g_reset_brow_inflect
		new_value = 0}
	<brow_inflect_needed> = 0
	begin
	if (<brow_inflect_needed> = 1)
		if (<length> > <max_length>)
			length_inflect = 1.0
		else
			length_inflect = (<length> / <max_length>)
		endif
		if (<distance> > $av_face_idle_distance)
			distance_inflect = 1.0
			av_brow_inflect_trans {
				trans_time = ($av_brow_relax_distance)
				neutral_amount = 1.0
				max_offset = 0.0
			}
			distance = (<distance> - <total_deduction>)
		else
			distance_inflect = (<distance> / $av_face_idle_distance)
		endif
		begin
		if ($g_reset_brow_inflect = 1)
			break
		elseif (<distance> > $av_brow_inflect_distance)
			waitonegameframe
			getframelength
			frame_length = (<frame_length> * 1000.0)
			distance = (<distance> - <frame_length>)
		else
			break
		endif
		repeat
		distance_inflect = (<distance_inflect> + (<min_offset> * (1 - <distance_inflect>)))
		length_inflect = (<length_inflect> + (<min_offset> * (1 - <length_inflect>)))
		distance_inflect = ((<distance_inflect> * 0.7) + (<length_inflect> * 0.3))
		av_brow_inflect_trans {
			trans_time = (<distance>)
			neutral_amount = 0.0
			max_offset = <distance_inflect>
		}
		av_brow_inflect_trans {
			trans_time = (<length>)
			neutral_amount = 0.0
			max_offset = <length_inflect>
		}
	endif
	if ($g_reset_brow_inflect = 1)
		changeglobalinteger \{global_name = g_reset_brow_inflect
			new_value = 0}
		<brow_inflect_needed> = 1
		<distance> = $g_av_brow_inflect_current_distance
		<length> = $g_av_brow_inflect_current_syllable_length
	else
		<brow_inflect_needed> = 0
	endif
	waitonegameframe
	repeat
	total_deduction = 0.0
	frame_length = 0.0
	distance = 0.0
endscript

script av_face_noise 
	target_threshold = 0.01
	strength = 100.5
	target_strength = 100.5
	cap_strength_smooth = 0.5
	target_direction = equal
	begin
	switch <face_channel>
		case emot
		amplitude = ($av_brow_emot_amp)
		baseline = ($av_brow_emot_base)
		frequency = ($av_brow_emot_freq)
		case mod
		amplitude = ($av_brow_mod_amp)
		baseline = ($av_brow_mod_base)
		frequency = ($av_brow_mod_freq)
		case scrub
		amplitude = ($av_brow_scrub_amp)
		baseline = ($av_brow_scrub_base)
		frequency = ($av_brow_scrub_freq)
	endswitch
	frequency = (0.02 * <frequency>)
	smoothness = (<frequency> * 2.5)
	target_diff = (<strength> - <target_strength>)
	if (<target_direction> = higher)
		strength_step = <frequency>
		target_diff_abs = (<target_diff> * (0.0 -1.0))
	elseif (<target_direction> = lower)
		strength_step = (<frequency> * (0.0 -1.0))
		target_diff_abs = (<target_diff>)
	else
		strength_step = 0.0
		target_diff_abs = -1.0
	endif
	if (<target_diff_abs> < 0.0)
		strength = <target_strength>
		getrandomfloat a = ((100.0 + <baseline> - <amplitude>)) b = ((100.0 + <baseline> + <amplitude>))
		target_strength = <random_float>
		if (<target_strength> > <strength>)
			target_direction = higher
		elseif (<target_strength> < <strength>)
			target_direction = lower
		else
			target_direction = equal
		endif
	endif
	strength = (<strength> + <strength_step>)
	cap_strength = (<strength> -100.0)
	if (<cap_strength> > 1.0)
		cap_strength = 1.0
	elseif (<cap_strength> < 0.0)
		cap_strength = 0.0
	endif
	smooth_diff = (<cap_strength> - <cap_strength_smooth>)
	cap_strength_smooth = (<cap_strength_smooth> + (<smooth_diff> * <smoothness>))
	final_noise_output = (<cap_strength_smooth>)
	index = 0
	begin
	switch <face_channel>
		case emot
		(<vocalist_ids> [<index>]) :animpreview_setsourcevalues {
			av_brow_emot = <final_noise_output>
		}
		case mod
		(<vocalist_ids> [<index>]) :animpreview_setsourcevalues {
			av_brow_mod = <final_noise_output>
		}
		case scrub
		(<vocalist_ids> [<index>]) :animpreview_setsourcevalues {
			av_brow_scrub = <final_noise_output>
		}
	endswitch
	index = (<index> + 1)
	repeat <num_vocalists>
	waitonegameframe
	repeat
	random_float = 0.0
	target = musician2
	face_channel = mod
	vocalist_ids = []
endscript

script av_generic_noise 
	amplitude = 0.5
	baseline = 0.5
	overshoot = 0.75
	frequency = 0.5
	target_threshold = 0.01
	frequency = (0.02 * <frequency>)
	smoothness = (<frequency> * 2.5)
	strength = 100.5
	target_strength = 100.5
	cap_strength_smooth = 0.5
	target_direction = equal
	begin
	target_diff = (<strength> - <target_strength>)
	if (<target_direction> = higher)
		strength_step = <frequency>
		target_diff_abs = (<target_diff> * (0.0 -1.0))
	elseif (<target_direction> = lower)
		strength_step = (<frequency> * (0.0 -1.0))
		target_diff_abs = (<target_diff>)
	else
		strength_step = 0.0
		target_diff_abs = -1.0
	endif
	if (<target_diff_abs> < 0.0)
		strength = <target_strength>
		getrandomfloat a = (100.0 - <overshoot>) b = (101.0 + <overshoot>)
		target_strength = <random_float>
		if (<target_strength> > <strength>)
			target_direction = higher
		elseif (<target_strength> < <strength>)
			target_direction = lower
		else
			target_direction = equal
		endif
	endif
	strength = (<strength> + <strength_step>)
	cap_strength = (<strength> -100.0)
	if (<cap_strength> > 1.0)
		cap_strength = 1.0
	elseif (<cap_strength> < 0.0)
		cap_strength = 0.0
	endif
	smooth_diff = (<cap_strength> - <cap_strength_smooth>)
	cap_strength_smooth = (<cap_strength_smooth> + (<smooth_diff> * <smoothness>))
	final_noise_output = ((((<cap_strength_smooth> -0.5) * 2.0) * <amplitude>) + <baseline>)
	fastgetarraysize array = ($ganimtreepreviewobjects)
	if (<array_size> > 0)
		target = (($ganimtreepreviewobjects) [0].name)
		<target> :animpreview_setsourcevalues {
		}
	else
		break
	endif
	wait \{1
		frame}
	repeat
	target = musician2
endscript
