jam_input_current_melody = null
jam_input_current_melody_atk = null
jam_sustain_melody = 0
jam_melody_touch_count = 0
jam_melody_current_pattern = 0
jam_melody_last_pattern = 0

script jam_input_melody controller = ($player1_status.controller) spawn_id = jam_input_spawns
	mid_up_strum = 0
	mid_down_strum = 0
	change \{jam_melody_touch_count = 0}
	spawnscriptnow jam_input_melody_tilt id = <spawn_id> params = {controller = <controller> player = <select_player>}
	jam_input_add_player_server player = <select_player> spawn_id = <spawn_id>
endscript

script jam_input_melody_per_frame 
	instrument_controls = [enabled]
	if ($game_mode = training)
		if screenelementexists \{id = jam_band_container}
			jam_band_container :gettags
		elseif screenelementexists \{id = jam_studio_element}
			jam_studio_element :gettags
		endif
	endif
	if arraycontains array = <instrument_controls> contains = enabled
		if (<midi_note> = -1)
			<mid_up_strum> = 0
			if NOT (<hold_pattern> = $jam_melody_current_pattern)
				change jam_melody_current_pattern = <hold_pattern>
				<play> = 0
				if (<hold_pattern> && 1)
					if NOT ($jam_melody_last_pattern = 1)
						<play> = 1
					elseif ($jam_melody_last_pattern > <hold_pattern>)
						<play> = 1
					endif
					if (<play> = 1)
						change \{jam_melody_last_pattern = 1}
						jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = <hold_pattern> up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
						spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
				elseif (<hold_pattern> && 16)
					if NOT ($jam_melody_last_pattern = 16)
						<play> = 1
					elseif ($jam_melody_last_pattern > <hold_pattern>)
						<play> = 1
					endif
					if (<play> = 1)
						change \{jam_melody_last_pattern = 16}
						jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = <hold_pattern> up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
						spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
				elseif (<hold_pattern> && 256)
					if NOT ($jam_melody_last_pattern = 256)
						<play> = 1
					elseif ($jam_melody_last_pattern > <hold_pattern>)
						<play> = 1
					endif
					if (<play> = 1)
						change \{jam_melody_last_pattern = 256}
						jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = <hold_pattern> up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
						spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
				elseif (<hold_pattern> && 4096)
					if NOT ($jam_melody_last_pattern = 4096)
						<play> = 1
					elseif ($jam_melody_last_pattern > <hold_pattern>)
						<play> = 1
					endif
					if (<play> = 1)
						change \{jam_melody_last_pattern = 4096}
						jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = <hold_pattern> up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
						spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
				elseif (<hold_pattern> && 65536)
					if NOT ($jam_melody_last_pattern = 65536)
						<play> = 1
					elseif ($jam_melody_last_pattern > <hold_pattern>)
						<play> = 1
					endif
					if (<play> = 1)
						change \{jam_melody_last_pattern = 65536}
						jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = <hold_pattern> up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
						spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
				else
					change \{jam_melody_last_pattern = 0}
				endif
			endif
			if controllermake up <controller>
				jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = 1048576 up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
				spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
			elseif controllermake down <controller>
				jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = 1048576 up_strum = 0 stop_sound = 1 controller = <controller> select_player = <select_player>
				spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
			elseif (<touch_strum> = 1)
				if ($jam_melody_touch_count = 0)
					change jam_melody_touch_count = ($jam_melody_touch_count + 1)
					jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = 1048576 up_strum = 0 stop_sound = 1 controller = <controller> select_player = <select_player>
					change \{jam_melody_last_pattern = 1048576}
					spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {check_touch = 1 select_player = <select_player> controller = <controller>}
				else
					change jam_melody_touch_count = ($jam_melody_touch_count + 1)
				endif
			else
				change \{jam_melody_current_pattern = 0}
				change \{jam_melody_touch_count = 0}
			endif
		else
			if (<midi_note_on> = 1)
				if NOT (<midi_note> = $jam_melody_current_pattern)
					killspawnedscript \{name = jam_input_stop_sound_melody_midi}
					jam_input_melody_strum_recording midi_note = <midi_note> spawn_id = <spawn_id> player = <select_player> hold_pattern = <hold_pattern> up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
				endif
			else
				spawnscriptnow id = <spawn_id> jam_input_stop_sound_melody_midi params = {midi_note = <midi_note>}
			endif
			change jam_melody_last_pattern = <hold_pattern>
			change jam_melody_current_pattern = <midi_note>
			change \{jam_melody_touch_count = 0}
		endif
	endif
	jam_input_whammy player = <select_player> controller = <controller>
	if (($jam_advanced_record) = 0)
		jam_check_simple_record_input controller = <controller> select_player = <select_player>
	endif
	return mid_up_strum = <mid_up_strum> mid_down_strum = <mid_down_strum>
endscript
jam_melody_curr_midi_note = 0

script jam_input_stop_sound_melody_midi 
	if (<midi_note> != $jam_melody_curr_midi_note)
		return
	endif
	wait \{2
		gameframes}
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
		stop = 1}
	jam_input_melody_stop_sound
endscript

script jam_input_stop_sound_melody \{select_player = 1
		check_touch = 0}
	wait \{$jam_input_strum_wait
		gameframes}
	getheldpattern controller = <controller> player = <select_player> nobrokenstring
	melody_hold_pattern = <hold_pattern>
	current_melody = $jam_input_current_melody
	<open_strum> = 0
	if (<melody_hold_pattern> = 1048576)
		<open_strum> = 1
	endif
	begin
	if (<open_strum> = 0)
		getheldpattern controller = <controller> player = <select_player> nobrokenstring
		if NOT (<melody_hold_pattern> && <hold_pattern>)
			jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
				stop = 1}
			break
		endif
	else
		if (<check_touch> = 0)
			if controllerpressed up <controller>
				<holding_dir> = 1
			elseif controllerpressed down <controller>
				<holding_dir> = 1
			else
				<holding_dir> = 0
			endif
			if (<holding_dir> = 0)
				jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
					stop = 1}
				break
			endif
		else
			if ($jam_melody_touch_count = 0)
				jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
					stop = 1}
				break
			endif
		endif
	endif
	wait \{1
		gameframe}
	repeat
	jam_input_melody_stop_sound
endscript

script jam_input_melody_stop_sound 
	if issoundplayingbyid \{$jam_input_current_melody}
		stopsound unique_id = ($jam_input_current_melody) fade_type = linear fade_time = 0.05
	endif
endscript

script jam_input_melody_strum_recording \{spawn_id = jam_input_spawns}
	final_note_sample = null
	note_type = 0
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody}
	if gotparam \{midi_note}
		printf channel = jam_mode qs(0xba8419e5) s = <midi_note>
		if (<midi_note> >= 28 && <midi_note> <= 74)
			change jam_melody_curr_midi_note = <midi_note>
			jam_get_sample_checksum \{string = 0
				fret = 0
				type = 0
				jam_instrument = 4}
			<pitch_shift> = (<midi_note> - 44)
			<note_string> = 0
			<note_fret> = <pitch_shift>
			<final_note_sample> = <sample_checksum>
		else
			return
		endif
	else
		if (<hold_pattern> && 1)
			<hold_pattern> = 1
			jam_get_sample player = <select_player> button = 5 sample_type = <note_type> tilt = ($jam_tilt_melody)
		elseif (<hold_pattern> && 16)
			<hold_pattern> = 16
			jam_get_sample player = <select_player> button = 4 sample_type = <note_type> tilt = ($jam_tilt_melody)
		elseif (<hold_pattern> && 256)
			<hold_pattern> = 256
			jam_get_sample player = <select_player> button = 3 sample_type = <note_type> tilt = ($jam_tilt_melody)
		elseif (<hold_pattern> && 4096)
			<hold_pattern> = 4096
			jam_get_sample player = <select_player> button = 2 sample_type = <note_type> tilt = ($jam_tilt_melody)
		elseif (<hold_pattern> && 65536)
			<hold_pattern> = 65536
			jam_get_sample player = <select_player> button = 1 sample_type = <note_type> tilt = ($jam_tilt_melody)
		elseif (<hold_pattern> = 1048576)
			<hold_pattern> = 1048576
			jam_get_sample player = <select_player> button = 0 sample_type = <note_type> tilt = ($jam_tilt_melody)
		endif
	endif
	if NOT (<final_note_sample> = null)
		<sustain> = 1
		jam_input_melody_play_note <...>
	endif
	return hold_pattern = <hold_pattern>
endscript

script jam_input_melody_get_current_note 
	if (<hold_pattern> && 1)
		jam_get_sample player = <player> button = 5 tilt = ($jam_tilt_melody) get_text = 1
	elseif (<hold_pattern> && 16)
		jam_get_sample player = <player> button = 4 tilt = ($jam_tilt_melody) get_text = 1
	elseif (<hold_pattern> && 256)
		jam_get_sample player = <player> button = 3 tilt = ($jam_tilt_melody) get_text = 1
	elseif (<hold_pattern> && 4096)
		jam_get_sample player = <player> button = 2 tilt = ($jam_tilt_melody) get_text = 1
	elseif (<hold_pattern> && 65536)
		jam_get_sample player = <player> button = 1 tilt = ($jam_tilt_melody) get_text = 1
	elseif (<hold_pattern> = 1048576)
		jam_get_sample player = <player> button = 0 tilt = ($jam_tilt_melody) get_text = 1
	endif
	if gotparam \{single_note_text}
		return single_note_text = <single_note_text>
	else
		return \{single_note_text = qs(0xca3bb3d6)}
	endif
endscript

script jam_input_melody_tilt 
	<low_tilt> = 0.0
	<high_tilt> = 100.0
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [4])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if structurecontains structure = <chosen_scale> chromatic
		<chromatic> = 1
	else
		<chromatic> = 0
	endif
	begin
	if guitargetanalogueinfo controller = <controller>
		<spc_v_dist> = <righty>
		jam_calc_line_rot player = <player> spc_v_dist = <spc_v_dist>
		if (<chromatic> = 0)
			if (<line_rot> <= 30)
				change \{jam_tilt_melody = 0}
			else
				change \{jam_tilt_melody = 1}
			endif
		else
			if (<line_rot> <= 1)
				change \{jam_tilt_melody = 0}
			elseif (<line_rot> > 1 && <line_rot> < 50)
				change \{jam_tilt_melody = 1}
			elseif (<line_rot> > 50 && <line_rot> < 99)
				change \{jam_tilt_melody = 2}
			else
				change \{jam_tilt_melody = 3}
			endif
		endif
	else
		return
	endif
	wait \{1
		gameframe}
	repeat
endscript

script jam_input_melody_play_note \{sustain = 0
		playback = 0}
	killspawnedscript \{name = jam_input_stop_sound_melody}
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
		stop = 1}
	stopsound unique_id = ($jam_input_current_melody) fade_type = linear fade_time = 0.05
	playsound $melody_sample pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 0 buss = jammode_vox send_vol2 = -24 pan1x = ($jam_melody_pan) pan1y = 1.0
	change jam_input_current_melody = <unique_id>
	if ($jam_tutorial_status = active)
		broadcastevent type = jam_tutorial_melody_hit data = {hold_pattern = <hold_pattern>}
	endif
	if (<playback> = 0)
		spawnscriptnow jam_fretboard_add_note params = {player = <select_player> gem_pattern = <hold_pattern> sustain = jam_sustain_melody}
		<velocity> = 0
		if (<note_fret> > 31)
			<velocity> = (<note_fret> -31)
			<note_fret> = 31
		endif
		<melody> = 1
		jam_record_note <...>
	endif
	broadcastevent \{type = jam_note_hit}
endscript

script jam_get_single_sample_for_melody_playback 
	<sample_checksum> = ($melody_sample)
	<oct> = 1
	if (<string> = 5)
		<oct> = 3
	elseif ((<string> = 2) && (<fret> >= 2))
		<oct> = 2
	elseif (<string> > 2)
		<oct> = 2
	endif
	begin
	if (<string> > 0)
		if (<string> = 4)
			<fret> = (<fret> - 8)
		else
			<fret> = (<fret> - 7)
		endif
		<string> = (<string> -1)
	endif
	if (<fret> < 0)
		<fret> = (<fret> + 12)
	endif
	if (<string> = 0)
		break
	endif
	repeat
	if (<oct> = 2)
		<fret> = (<fret> + 12)
	elseif (<oct> = 3)
		<fret> = (<fret> + 24)
	endif
	<range> = ($jam_melody_octave_range)
	if (<range> = 2)
		<fret> = (<fret> + 12)
	endif
	<final_pitch> = (<fret> -16)
	return sample_checksum = <sample_checksum> pitch_shift = <final_pitch>
endscript

script loadmelodykit \{melody_kit = 0
		async = 1}
	printf 'coming into load melody with loadedmel = %b, loadedbass = %a, target = %c' a = ($loadedbasskitpak) b = ($loadedmelodykitpak) c = <melody_kit>
	setsonginfo melody_kit = <melody_kit>
	<pakname> = ($pause_melody_kit_options [<melody_kit>].pakname)
	formattext textname = melodykit_pakname 'pak/melody/%s.pak' s = <pakname>
	if ((($loadedbasskitpak) != ($loadedmelodykitpak)) && (($loadedmelodykitpak) != <melodykit_pakname>))
		unloadmelodykit
	endif
	if ((($loadedmelodykitpak) != <melodykit_pakname>) && (($loadedbasskitpak) != <melodykit_pakname>))
		if NOT loadpakasync pak_name = <melodykit_pakname> heap = heap_drumkitaudio async = <async>
			downloadcontentlost
			return
		endif
	endif
	change jam_current_melody_kit = <melody_kit>
	change loadedmelodykitpak = <melodykit_pakname>
	change melody_sample = ($pause_melody_kit_options [<melody_kit>].sample_start)
endscript

script unloadmelodykit 
	if NOT (($loadedmelodykitpak) = 'none')
		unloadpak ($loadedmelodykitpak)
		change \{globalname = loadedmelodykitpak
			newvalue = 'none'}
	endif
endscript

script balleric_startup 
	loadsound \{'Jam_Mode/Melody/balleric'}
endscript

script breathy_startup 
	loadsound \{'Jam_Mode/Melody/breathy'}
endscript

script breathy_pad_startup 
	loadsound \{'Jam_Mode/Melody/breathy_pad'}
endscript

script calc_startup 
	loadsound \{'Jam_Mode/Melody/calc'}
endscript

script csd_oscillator_high_startup 
	loadsound \{'Jam_Mode/Melody/csd_oscillator_high'}
endscript

script csd_oscillator_low_startup 
	loadsound \{'Jam_Mode/Melody/csd_oscillator_low'}
endscript

script csd_sweep2_startup 
	loadsound \{'Jam_Mode/Melody/csd_sweep2'}
endscript

script csd_sweep_startup 
	loadsound \{'Jam_Mode/Melody/csd_sweep'}
endscript

script csd_sweepcrazy_startup 
	loadsound \{'Jam_Mode/Melody/csd_sweepcrazy'}
endscript

script csd_tourfrance_startup 
	loadsound \{'Jam_Mode/Melody/csd_tourfrance'}
endscript

script csd_videogame_startup 
	loadsound \{'Jam_Mode/Melody/csd_videogame'}
endscript

script csd_videogame2_startup 
	loadsound \{'Jam_Mode/Melody/csd_videogame2'}
endscript

script csd_videogame3_startup 
	loadsound \{'Jam_Mode/Melody/csd_videogame3'}
endscript

script csd_videogame4_startup 
	loadsound \{'Jam_Mode/Melody/csd_videogame4'}
endscript

script deepsh101_startup 
	loadsound \{'Jam_Mode/Melody/deepSH101'}
endscript

script europe_startup 
	loadsound \{'Jam_Mode/Melody/europe'}
endscript

script fif_startup 
	loadsound \{'Jam_Mode/Melody/fif'}
endscript

script horror12_startup 
	loadsound \{'Jam_Mode/Melody/horror12'}
endscript

script horror1_startup 
	loadsound \{'Jam_Mode/Melody/horror1'}
endscript

script india_drone_startup 
	loadsound \{'Jam_Mode/Melody/india_drone'}
endscript

script india_sitar_startup 
	loadsound \{'Jam_Mode/Melody/india_sitar'}
endscript

script kyoto1_startup 
	loadsound \{'Jam_Mode/Melody/kyoto1'}
endscript

script kz_acid_startup 
	loadsound \{'Jam_Mode/Melody/kz_acid'}
endscript

script kz_breathy2_startup 
	loadsound \{'Jam_Mode/Melody/kz_breathy2'}
endscript

script kz_breathy_startup 
	loadsound \{'Jam_Mode/Melody/kz_breathy'}
endscript

script kz_choir_startup 
	loadsound \{'Jam_Mode/Melody/kz_choir'}
endscript

script kz_deepbliss_startup 
	loadsound \{'Jam_Mode/Melody/kz_deepbliss'}
endscript

script kz_digiorg_startup 
	loadsound \{'Jam_Mode/Melody/kz_digiorg'}
endscript

script kz_flute_startup 
	loadsound \{'Jam_Mode/Melody/kz_flute'}
endscript

script kz_india_startup 
	loadsound \{'Jam_Mode/Melody/kz_india'}
endscript

script kz_martians_startup 
	loadsound \{'Jam_Mode/Melody/kz_martians'}
endscript

script lush_startup 
	loadsound \{'Jam_Mode/Melody/lush'}
endscript

script m_bass1_startup 
	loadsound \{'Jam_Mode/Melody/m_bass1'}
endscript

script m_bass_filter_in_startup 
	loadsound \{'Jam_Mode/Melody/m_bass_filter_in'}
endscript

script m_fat1_startup 
	loadsound \{'Jam_Mode/Melody/m_fat1'}
endscript

script m_fat2_startup 
	loadsound \{'Jam_Mode/Melody/m_fat2'}
endscript

script m_fat3_startup 
	loadsound \{'Jam_Mode/Melody/m_fat3'}
endscript

script m_fat4_startup 
	loadsound \{'Jam_Mode/Melody/m_fat4'}
endscript

script m_fat5_startup 
	loadsound \{'Jam_Mode/Melody/m_fat5'}
endscript

script m_fat6_startup 
	loadsound \{'Jam_Mode/Melody/m_fat6'}
endscript

script m_fat_high_startup 
	loadsound \{'Jam_Mode/Melody/m_fat_high'}
endscript

script m_fat_high2_startup 
	loadsound \{'Jam_Mode/Melody/m_fat_high2'}
endscript

script mono_synth_startup 
	loadsound \{'Jam_Mode/Melody/mono_synth'}
endscript

script ob_rave1_startup 
	loadsound \{'Jam_Mode/Melody/ob_rave1'}
endscript

script ob_rave2_startup 
	loadsound \{'Jam_Mode/Melody/ob_rave2'}
endscript

script ob_rave3_startup 
	loadsound \{'Jam_Mode/Melody/ob_rave3'}
endscript

script ob_rave_asia1_startup 
	loadsound \{'Jam_Mode/Melody/ob_rave_asia1'}
endscript

script ob_rave_oldschool_startup 
	loadsound \{'Jam_Mode/Melody/ob_rave_oldschool'}
endscript

script ob_rave_oldschool2_startup 
	loadsound \{'Jam_Mode/Melody/ob_rave_oldschool2'}
endscript

script ob_scary1_startup 
	loadsound \{'Jam_Mode/Melody/ob_scary1'}
endscript

script ob_scary2_startup 
	loadsound \{'Jam_Mode/Melody/ob_scary2'}
endscript

script ob_scary3_startup 
	loadsound \{'Jam_Mode/Melody/ob_scary3'}
endscript

script ob_scary4_startup 
	loadsound \{'Jam_Mode/Melody/ob_scary4'}
endscript

script ob_scary5_startup 
	loadsound \{'Jam_Mode/Melody/ob_scary5'}
endscript

script ob_scary6_startup 
	loadsound \{'Jam_Mode/Melody/ob_scary6'}
endscript

script ob_tone1_startup 
	loadsound \{'Jam_Mode/Melody/ob_tone1'}
endscript

script panflute_startup 
	loadsound \{'Jam_Mode/Melody/panflute'}
endscript

script rev_bass1_startup 
	loadsound \{'Jam_Mode/Melody/rev_bass1'}
endscript

script rev_bass2_startup 
	loadsound \{'Jam_Mode/Melody/rev_bass2'}
endscript

script rev_bass3_startup 
	loadsound \{'Jam_Mode/Melody/rev_bass3'}
endscript

script rev_bass4_startup 
	loadsound \{'Jam_Mode/Melody/rev_bass4'}
endscript

script rock_organ_startup 
	loadsound \{'Jam_Mode/Melody/rock_organ'}
endscript

script rock_organ_2_startup 
	loadsound \{'Jam_Mode/Melody/rock_organ_2'}
endscript

script strange_startup 
	loadsound \{'Jam_Mode/Melody/strange'}
endscript

script synth_lead_1_startup 
	loadsound \{'Jam_Mode/Melody/synth_lead_1'}
endscript

script synth_lead_2_startup 
	loadsound \{'Jam_Mode/Melody/synth_lead_2'}
endscript

script synth_lead_3_startup 
	loadsound \{'Jam_Mode/Melody/synth_lead_3'}
endscript

script voice_startup 
	loadsound \{'Jam_Mode/Melody/voice'}
endscript

script wha_startup 
	loadsound \{'Jam_Mode/Melody/wha'}
endscript

script mk_brightsynth_startup 
	loadsound \{'Jam_Mode/Melody/mk_brightsynth'}
endscript

script mk_fatbass_startup 
	loadsound \{'Jam_Mode/Melody/mk_fatbass'}
endscript

script mk_fatbrass_startup 
	loadsound \{'Jam_Mode/Melody/mk_fatbrass'}
endscript

script mk_greatness_startup 
	loadsound \{'Jam_Mode/Melody/mk_greatness'}
endscript

script mk_housebass_startup 
	loadsound \{'Jam_Mode/Melody/mk_housebass'}
endscript

script mk_housepluck_startup 
	loadsound \{'Jam_Mode/Melody/mk_housepluck'}
endscript

script mk_lead_startup 
	loadsound \{'Jam_Mode/Melody/mk_lead'}
endscript

script mk_organ_startup 
	loadsound \{'Jam_Mode/Melody/mk_organ'}
endscript

script mk_pluckedbass_startup 
	loadsound \{'Jam_Mode/Melody/mk_pluckedbass'}
endscript

script mk_polyphonicsaw_startup 
	loadsound \{'Jam_Mode/Melody/mk_polyphonicsaw'}
endscript

script phone_tone_startup 
	loadsound \{'Jam_Mode/Melody/phone_tone'}
endscript
