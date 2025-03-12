guitarist_info = {
	anim_set = judy_animations
	stance = stance_frontend
	finger_anims = guitarist_finger_anims_large
	finger_bend_anims = guitarist_finger_anims_large
	fret_anims = guitarist_fret_anims
	strum = normal
	playing = true
	guitar_model = none
	playing_missed_note = false
	playing_special_anim = false
	last_strum_length = short
	current_anim = idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = false
	next_stance = stance_frontend
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = none
	waiting_for_cameracut = false
	allow_movement = true
	target_node = none
	facial_anim = idle
	scale = 1.0
	controller = 0
}
bassist_info = {
	anim_set = axel_animations
	stance = stance_frontend
	finger_anims = guitarist_finger_anims_large
	finger_bend_anims = guitarist_finger_anims_large
	fret_anims = guitarist_fret_anims
	strum = normal
	playing = true
	bass_model = none
	playing_missed_note = false
	playing_special_anim = false
	last_strum_length = short
	current_anim = idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = false
	next_stance = stance_frontend
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = none
	waiting_for_cameracut = false
	allow_movement = true
	target_node = none
	facial_anim = idle
	scale = 1.0
	controller = 1
}
vocalist_info = {
	anim_set = vocalist_animations
	stance = stance_a
	current_anim = idle
	anim_repeat_count = 1
	disable_arms = 0
	arms_disabled = 0
	cycle_anim = false
	next_stance = stance_a
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = none
	playing_special_anim = false
	allow_movement = true
	target_node = none
	facial_anim = idle
	scale = 1.0
}
vocalist2_info = {
	anim_set = vocalist_animations
	stance = stance_a
	current_anim = idle
	anim_repeat_count = 1
	disable_arms = 0
	arms_disabled = 0
	cycle_anim = false
	next_stance = stance_a
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = none
	playing_special_anim = false
	allow_movement = true
	target_node = none
	facial_anim = idle
	scale = 1.0
}
drummer_info = {
	twist = 0.0
	desired_twist = 0.0
	anim_set = drummer_animations
	arm_anims = drummer_anims
	cymbal_anims = cymbal_anims
	stance = stance_a
	current_anim = idle
	anim_repeat_count = 1
	disable_arms = 0
	arms_disabled = 0
	cycle_anim = false
	next_stance = stance_a
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = none
	playing_special_anim = false
	allow_movement = true
	target_node = none
	facial_anim = idle
	last_left_arm_note = 0
	last_right_arm_note = 0
	scale = 1.0
}
rhythm_info = {
	anim_set = judy_animations
	stance = stance_frontend
	finger_anims = guitarist_finger_anims_large
	finger_bend_anims = guitarist_finger_anims_large
	fret_anims = guitarist_fret_anims
	strum = normal
	playing = true
	guitar_model = none
	playing_missed_note = false
	last_strum_length = short
	current_anim = idle
	anim_repeat_count = 1
	arms_disabled = 0
	disable_arms = 0
	cycle_anim = false
	next_stance = stance_frontend
	next_anim = none
	next_anim_repeat_count = 1
	next_anim_disable_arms = 0
	cycle_next_anim = false
	last_anim_name = none
	playing_special_anim = false
	waiting_for_cameracut = false
	allow_movement = true
	target_node = none
	facial_anim = idle
	scale = 1.0
	controller = 1
}
current_bass_model = none
vocalist_song_anim_pak = none

script create_band \{starting_song = false
		async = 0}
	if ($disable_band = 1)
		return
	endif
	getpakmancurrent \{map = zones}
	if ($current_num_players = 1)
		if NOT create_guitarist starting_song = <starting_song> async = <async>
			return \{false}
		endif
		get_song_struct song = ($current_song)
		if structurecontains structure = <song_struct> name = band
			band = (<song_struct>.band)
		else
			band = default_band
		endif
		drummer_profile = ($<band>.drummer)
		if NOT create_drummer profile_name = <drummer_profile> async = <async>
			return \{false}
		endif
		if structurecontains structure = ($<band>) name = bassist
			bassist_profile = ($<band>.bassist)
			alt_instrument = none
			if structurecontains structure = ($<band>) name = bassist_instrument
				printf \{"found bassist_instrument in band profile......."}
				alt_instrument = ($<band>.bassist_instrument)
			endif
			if NOT create_bassist profile_name = <bassist_profile> alt_instrument = <alt_instrument> async = <async>
				return \{false}
			endif
		else
			unload_character \{name = bassist}
		endif
		singer = male
		if structurecontains structure = <song_struct> name = singer
			singer = (<song_struct>.singer)
		endif
		if (<singer> = none)
			if compositeobjectexists \{name = vocalist}
				unload_character \{name = vocalist}
			endif
			if compositeobjectexists \{name = vocalist2}
				unload_character \{name = vocalist2}
			endif
		else
			if (<singer> = male)
				if structurecontains structure = ($<band>) name = vocalist_male
					singer_profile = ($<band>.vocalist_male)
				else
					singer_profile = 'singer'
				endif
			elseif (<singer> = female)
				if structurecontains structure = ($<band>) name = vocalist_female
					singer_profile = ($<band>.vocalist_female)
				else
					singer_profile = 'singer_female'
				endif
			else
				singer_profile = 'singer'
			endif
			if NOT create_vocalist profile_name = <singer_profile> async = <async>
				return \{false}
			endif
		endif
		if structurecontains structure = ($<band>) name = vocalist2
			unload_character \{name = rhythm}
			singer_profile = ($<band>.vocalist2)
			printf \{channel = singer
				"Attempting to create a second vocalist"}
			if NOT create_vocalist name = vocalist2 profile_name = <singer_profile> async = <async>
				return \{false}
			endif
		else
			unload_character \{name = vocalist2}
			if structurecontains structure = ($<band>) name = rhythm
				rhythm_profile = ($<band>.rhythm)
				alt_instrument = none
				if structurecontains structure = ($<band>) name = rhythm_instrument
					printf \{"found rhythm_instrument in band profile......."}
					alt_instrument = ($<band>.rhythm_instrument)
				endif
				if NOT create_bassist profile_name = <rhythm_profile> name = rhythm alt_instrument = <alt_instrument> async = <async>
					return \{false}
				endif
			else
				unload_character \{name = rhythm}
			endif
		endif
	else
		unload_character \{name = vocalist}
		if NOT create_guitarist name = guitarist starting_song = <starting_song> async = <async>
			return \{false}
		endif
		if NOT create_guitarist name = bassist starting_song = <starting_song> async = <async>
			return \{false}
		endif
		get_song_struct song = ($current_song)
		if structurecontains structure = <song_struct> name = band
			band = (<song_struct>.band)
		else
			band = default_band
		endif
		drummer_profile = ($<band>.drummer)
		if NOT create_drummer profile_name = <drummer_profile> async = <async>
			return \{false}
		endif
	endif
	set_bandvisible
	return \{true}
endscript

script restore_player_selected_character_info 
	if (($<player_status>.saved_character_id) != none)
		change structurename = <player_status> character_id = ($<player_status>.saved_character_id)
		change structurename = <player_status> saved_character_id = none
	endif
	if (($<player_status>.saved_outfit) != 0)
		change structurename = <player_status> outfit = ($<player_status>.saved_outfit)
		change structurename = <player_status> saved_outfit = 0
	endif
	if (($<player_status>.saved_style) != 0)
		change structurename = <player_status> style = ($<player_status>.saved_style)
		change structurename = <player_status> saved_style = 0
	endif
	if (($<player_status>.saved_instrument_id) != none)
		change structurename = <player_status> instrument_id = ($<player_status>.saved_instrument_id)
		change structurename = <player_status> saved_instrument_id = none
	endif
endscript

script create_guitarist_profile \{starting_song = false}
	player2_is_lead = false
	if ($current_num_players = 2)
		if (($game_mode = p2_coop) || ($game_mode = p2_quickplay))
			if NOT ($player1_status.part = guitar)
				player2_is_lead = true
			endif
		endif
	endif
	if ((<name> = guitarist && <player2_is_lead> = false) || (<name> = bassist && <player2_is_lead> = true))
		player_status = player1_status
	else
		player_status = player2_status
	endif
	restore_player_selected_character_info player_status = <player_status>
	character_id = ($<player_status>.character_id)
	outfit = ($<player_status>.outfit)
	style = ($<player_status>.style)
	instrument_id = ($<player_status>.instrument_id)
	using_default_band = true
	override_player_selected_guitarist = false
	alt_instrument = none
	if ($use_player_selected_guitarist = true)
	else
		if (<starting_song> = true)
			get_song_struct song = ($current_song)
			band = default_band
			is_boss = false
			if structurecontains structure = <song_struct> name = boss
				if (<name> = bassist)
					is_boss = true
				endif
			endif
			if structurecontains structure = <song_struct> name = band
				if NOT ((<song_struct>.band) = default_band || (<song_struct>.band) = dmc_band)
					band = (<song_struct>.band)
					using_default_band = false
					if NOT structurecontains structure = ($<band>) name = allow_player_selected_guitarist
						override_player_selected_guitarist = true
					endif
				endif
			else
			endif
			if ($current_num_players = 2)
				if (<is_boss> = false || <name> = guitarist)
					override_player_selected_guitarist = false
				endif
			endif
			if (((<using_default_band> = true) || (<override_player_selected_guitarist> = false)) && (<is_boss> = false))
			else
				if (<is_boss> = true)
					if find_profile_by_id id = <character_id>
						found = 1
					else
						found = 0
					endif
				else
					find_profile name = ($<band>.<name>)
				endif
				if (<found> = 1)
					get_musician_profile_struct index = <index>
					char_name = (<profile_struct>.name)
					formattext checksumname = character_id '%n' n = <char_name> addtostringlookup = true
					if (<char_name> = 'JoePShakinMyCage')
						outfit = 2
						style = 1
					else
						if (<char_name> = 'JoeP' || <char_name> = 'JoePRagdoll' || <char_name> = 'JoePsweetemotion')
							printf \{channel = animinfo
								"override outfit/style for joep"}
							outfit = 1
							getpakmancurrent \{map = zones}
							switch <pak>
								case z_nipmuc
								style = 2
								case z_maxskc
								style = 3
								case z_fenway
								style = 4
								case z_nine_lives
								style = 5
								case z_jpplay
								style = 6
								default
								style = 1
							endswitch
							printf channel = animinfo "using guitarist style %a" a = <style>
						else
							outfit = 1
							style = 1
							printf channel = animinfo "guitarist is not joep...forcing to outfit 1 / style 1 from outfit %a / style %b" a = <outfit> b = <style>
						endif
					endif
				else
					printf "ERROR: profile %a not found....... " a = <name>
				endif
				extendcrc <name> '_Instrument' out = instrument_override
				if structurecontains structure = ($<band>) name = <instrument_override>
					alt_instrument = ($<band>.<instrument_override>)
				endif
				if NOT ($game_mode = training || $game_mode = practice)
					change structurename = <player_status> saved_character_id = ($<player_status>.character_id)
					change structurename = <player_status> saved_outfit = ($<player_status>.outfit)
					change structurename = <player_status> saved_style = ($<player_status>.style)
					change structurename = <player_status> saved_instrument_id = ($<player_status>.instrument_id)
					change structurename = <player_status> character_id = <character_id>
					change structurename = <player_status> outfit = <outfit>
					change structurename = <player_status> style = <style>
					change structurename = <player_status> instrument_id = <alt_instrument>
				endif
			endif
		endif
	endif
	find_profile_by_id id = <character_id>
	<found> = 1
	if (<found> = 1)
		if gotparam \{no_guitar}
			<instrument_id> = none
		else
			if (($boss_battle = 1 && <name> = bassist) || (<using_default_band> = false && $current_num_players = 1))
				get_musician_profile_struct index = <index>
				<instrument_id> = (<profile_struct>.musician_instrument.desc_id)
			endif
		endif
		if (<alt_instrument> != none)
			printf "overriding instrument for %a..." a = <name>
			instrument_id = <alt_instrument>
		else
			printf "using instrument listed in %a's profile..." a = <name>
		endif
		if ($cheat_airguitar = 1)
			if NOT ($is_network_game)
				<instrument_id> = none
			endif
		endif
		get_musician_profile_struct index = <index>
		if structurecontains structure = <profile_struct> name = highway
			highway = (<profile_struct>.highway)
			formattext checksumname = body_id 'Guitarist_%n_Outfit%o_Style%s' n = <highway> o = <outfit> s = <style>
		else
			highway = 'standard'
			character_name = (<profile_struct>.name)
			formattext checksumname = body_id 'Guitarist_%n_Outfit%o_Style%s' n = <character_name> o = <outfit> s = <style>
		endif
		profile = {<profile_struct>
			musician_instrument = {desc_id = <instrument_id>}
			musician_body = {desc_id = <body_id>}
			download_musician_instrument = {desc_id = <instrument_id>}
			download_musician_body = {desc_id = <body_id>}
			outfit = <outfit>
			highway = <highway>}
	endif
	return <...>
endscript

script create_guitarist \{name = guitarist
		profile_name = 'judy'
		instrument_id = instrument_les_paul_black
		async = 0
		animpak = 1
		starting_song = false}
	extendcrc <name> '_Info' out = info_struct
	printf channel = animinfo "creating guitarist - %a ........." a = <name>
	create_guitarist_profile <...>
	if (<found> = 1)
		if gotparam \{node_name}
			waypoint_id = <node_name>
		else
			get_start_node_id member = <name>
		endif
		if doeswaypointexist name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf "unable to find starting position for %a ........" a = <name>
		endif
		cleareventhandlergroup \{hand_events}
		if NOT create_band_member name = <name> profile = <profile> start_node = <waypoint_id> <...>
			return \{false}
		endif
		find_profile_by_id id = <character_id>
		highway = (<profile_struct>.highway)
		if (<highway> = 'standard')
			formattext textname = highway_name 'Guitarist_%n_Outfit%o_Style%s' n = (<profile_struct>.name) o = <outfit> s = <style>
			formattext checksumname = highway_material 'sys_%a_1_highway_sys_%a_1_highway' a = (<profile_struct>.name)
		else
			formattext textname = highway_name 'Guitarist_%n_Outfit%o_Style%s' n = <highway> o = <outfit> s = <style>
			formattext checksumname = highway_material 'sys_%a_1_highway_sys_%a_1_highway' a = <highway>
		endif
		addtomateriallibrary scene = <highway_name>
		change structurename = <player_status> highway_material = <highway_material>
		change structurename = <player_status> band_member = <name>
		get_musician_profile_struct index = <index>
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		change structurename = <info_struct> finger_anims = (<profile_struct>.finger_anims)
		change structurename = <info_struct> fret_anims = (<profile_struct>.fret_anims)
		change structurename = <info_struct> strum = (<profile_struct>.strum_anims)
		change structurename = <info_struct> allow_movement = true
		change structurename = <info_struct> arms_disabled = 0
		change structurename = <info_struct> disable_arms = 0
		change structurename = <info_struct> next_stance = ($<info_struct>.stance)
		change structurename = <info_struct> controller = ($<player_status>.controller)
		if ($game_mode = p2_faceoff)
			change structurename = <info_struct> playing = false
		else
			change structurename = <info_struct> playing = true
		endif
		if structurecontains structure = <profile_struct> name = finger_bend_anims
			change structurename = <info_struct> finger_bend_anims = (<profile_struct>.finger_bend_anims)
		else
			change structurename = <info_struct> finger_bend_anims = (<profile_struct>.finger_anims)
		endif
		if structurecontains structure = <profile_struct> name = scale
			scale_x = ((<profile_struct>.scale).(1.0, 0.0, 0.0))
			scale_y = ((<profile_struct>.scale).(0.0, 1.0, 0.0))
			scale_z = ((<profile_struct>.scale).(0.0, 0.0, 1.0))
			if ((<scale_x> != <scale_y>) || (<scale_y> != <scale_z>))
				scriptassert \{"Attempting to create a guitarist with a non-uniform scale!"}
			endif
			change structurename = <info_struct> scale = <scale_x>
		else
			change structurename = <info_struct> scale = 1.0
		endif
		stance = ($<info_struct>.stance)
		printf channel = animinfo "creating guitarist in stance %a ........" a = <stance>
		if (<stance> = stance_frontend || <stance> = stance_frontend_guitar)
			change structurename = <info_struct> arms_disabled = 2
			change structurename = <info_struct> disable_arms = 2
			<name> :hero_toggle_arms num_arms = 0 prev_num_arms = 2 blend_time = 0.0
		else
			<name> :hero_toggle_arms num_arms = 1 prev_num_arms = 0 blend_time = 0.0
		endif
		finger_anims = ($<info_struct>.finger_anims)
		fret_anims = ($<info_struct>.fret_anims)
		strum_type = ($<info_struct>.strum)
		extendcrc <strum_type> '_Strums' out = strum_anims
		if NOT gotparam \{no_strum}
			<name> :hero_play_strum_anim anim = ($<strum_anims>.no_strum_anim)
			<name> :hero_play_fret_anim anim = (<fret_anims>.track_123)
			<name> :hero_play_finger_anim anim = (<finger_anims>.track_none)
		endif
		if structurecontains structure = <profile_struct> name = accessory_bones
			printf \{channel = animinfo
				"guitarist: accessory bone struct found in profile!"}
			accessory_bones = (<profile_struct>.accessory_bones)
			<name> :ragdoll_setaccessorybones accessory_bones = $<accessory_bones>
		else
			printf \{channel = animinfo
				"guitarist: accessory bone struct NOT found in profile...using default!"}
			<name> :ragdoll_setaccessorybones accessory_bones = $guitarist_accessory_bones
		endif
		<name> :obj_switchscript guitarist_idle
		<name> :obj_spawnscriptnow facial_anim_loop
		if gotparam \{no_anim}
			spawnscriptnow temp_hero_pause_script params = {name = <name>}
		endif
		<name> :obj_forceupdate
	else
		printf \{"profile not found in create_guitarist! ........."}
	endif
	return \{true}
endscript

script temp_hero_pause_script 
	wait \{1
		gameframes}
	if <name> :anim_animnodeexists id = bodytimer
		<name> :anim_command target = bodytimer command = timer_setspeed params = {speed = 0.0}
	endif
endscript
tomh_guitars = [
	instrument_th_pbass_01
	instrument_th_pbass_02
	instrument_bass_darker001
	instrument_bass_darker002
	instrument_bass_th_vchamber
]

script create_bassist \{name = bassist
		profile_name = 'bassist'
		alt_instrument = none
		async = 0}
	extendcrc <name> '_Info' out = info_struct
	printf channel = animinfo "creating bassist - %a ........." a = <name>
	find_profile name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <name>
		if doeswaypointexist name = <waypoint_id>
			getwaypointpos name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf "unable to find starting position for %a ........" a = <name>
		endif
		get_musician_profile_struct index = <index>
		desired_body = (<profile_struct>.musician_body.desc_id)
		desired_instrument = (<profile_struct>.musician_instrument.desc_id)
		if ((<profile_struct>.musician_body.desc_id) = aero_bassist)
			getpakmancurrent \{map = zones}
			switch <pak>
				case z_nipmuc
				printf \{channel = animinfo
					"using Guitarist_TomH_Outfit1_Style2"}
				desired_body = guitarist_tomh_outfit1_style2
				case z_maxskc
				printf \{channel = animinfo
					"using Guitarist_TomH_Outfit1_Style3"}
				desired_body = guitarist_tomh_outfit1_style3
				case z_fenway
				printf \{channel = animinfo
					"using Guitarist_TomH_Outfit1_Style4"}
				desired_body = guitarist_tomh_outfit1_style4
				case z_nine_lives
				printf \{channel = animinfo
					"using Guitarist_TomH_Outfit1_Style5"}
				desired_body = guitarist_tomh_outfit1_style5
				case z_jpplay
				printf \{channel = animinfo
					"using Guitarist_TomH_Outfit1_Style6"}
				desired_body = guitarist_tomh_outfit1_style6
				default
				printf \{channel = animinfo
					"using Aero_bassist"}
			endswitch
			if (<alt_instrument> = random_tom_guitar)
				getarraysize \{$tomh_guitars}
				getrandomvalue a = 0 b = (<array_size> -1) integer name = guitar_index
				<alt_instrument> = ($tomh_guitars [<guitar_index>])
			endif
		else
			printf \{channel = animinfo
				"not Aero_bassist"}
		endif
		if ((<profile_struct>.musician_body.desc_id) = aero_guitar)
			getpakmancurrent \{map = zones}
			switch <pak>
				case z_nipmuc
				printf \{channel = animinfo
					"using Guitarist_BradW_Outfit1_Style2"}
				desired_body = guitarist_bradw_outfit1_style2
				case z_maxskc
				printf \{channel = animinfo
					"using Guitarist_BradW_Outfit1_Style3"}
				desired_body = guitarist_bradw_outfit1_style3
				case z_fenway
				printf \{channel = animinfo
					"using Guitarist_BradW_Outfit1_Style4"}
				desired_body = guitarist_bradw_outfit1_style4
				case z_nine_lives
				printf \{channel = animinfo
					"using Guitarist_BradW_Outfit1_Style5"}
				desired_body = guitarist_bradw_outfit1_style5
				case z_jpplay
				printf \{channel = animinfo
					"using Guitarist_BradW_Outfit1_Style6"}
				desired_body = guitarist_bradw_outfit1_style6
				default
				printf \{channel = animinfo
					"using Aero_Guitar"}
			endswitch
		else
			printf \{channel = animinfo
				"not Aero_Guitar"}
		endif
		if (<alt_instrument> = none)
			printf "NOT overriding instrument defined in %a's profile" a = <name>
			if (($current_bass_model != none) && (<name> = bassist))
				desired_instrument = $current_bass_model
			endif
		else
			printf "overriding instrument defined in %a's profile" a = <name>
			desired_instrument = <alt_instrument>
		endif
		profile = {
			<profile_struct>
			musician_body = {desc_id = <desired_body>}
			musician_instrument = {desc_id = <desired_instrument>}
		}
		if NOT create_band_member name = <name> profile = <profile> start_node = <waypoint_id> <...>
			return \{false}
		endif
		get_musician_profile_struct index = <index>
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		change structurename = <info_struct> finger_anims = (<profile_struct>.finger_anims)
		change structurename = <info_struct> fret_anims = (<profile_struct>.fret_anims)
		change structurename = <info_struct> strum = (<profile_struct>.strum_anims)
		change structurename = <info_struct> allow_movement = true
		change structurename = <info_struct> arms_disabled = 0
		change structurename = <info_struct> disable_arms = 0
		change structurename = <info_struct> controller = -1
		if ($game_mode = p2_faceoff)
			change structurename = <info_struct> playing = false
		else
			change structurename = <info_struct> playing = true
		endif
		if structurecontains structure = <profile_struct> name = finger_bend_anims
			change structurename = <info_struct> finger_bend_anims = (<profile_struct>.finger_bend_anims)
		else
			change structurename = <info_struct> finger_bend_anims = (<profile_struct>.finger_anims)
		endif
		if structurecontains structure = <profile_struct> name = scale
			scale_x = ((<profile_struct>.scale) * (1.0, 0.0, 0.0))
			scale_y = ((<profile_struct>.scale) * (0.0, 1.0, 0.0))
			scale_z = ((<profile_struct>.scale) * (0.0, 0.0, 1.0))
			if ((<scale_x> != <scale_y>) || (<scale_y> != <scale_z>))
				scriptassert \{"Attempting to create a guitarist with a non-uniform scale!"}
			endif
			change structurename = <info_struct> scale = <scale_x>
		else
			change structurename = <info_struct> scale = 1.0
		endif
		if gotparam \{stance}
			change structurename = <info_struct> stance = <stance>
		else
			change structurename = <info_struct> stance = (<profile_struct>.stance)
		endif
		finger_anims = ($<info_struct>.finger_anims)
		fret_anims = ($<info_struct>.fret_anims)
		strum_type = ($bassist_info.strum)
		extendcrc <strum_type> '_Strums' out = strum_anims
		if NOT gotparam \{no_strum}
			<name> :hero_play_strum_anim anim = ($<strum_anims>.no_strum_anim)
			<name> :hero_play_fret_anim anim = (<fret_anims>.track_106)
			<name> :hero_play_finger_anim anim = (<finger_anims>.track_none)
		endif
		if structurecontains structure = <profile_struct> name = accessory_bones
			printf \{channel = animinfo
				"bassist: accessory bone struct found in profile!"}
			accessory_bones = (<profile_struct>.accessory_bones)
			<name> :ragdoll_setaccessorybones accessory_bones = $<accessory_bones>
		else
			printf \{channel = animinfo
				"bassist: accessory bone struct NOT found in profile...using default!"}
			<name> :ragdoll_setaccessorybones accessory_bones = $guitarist_accessory_bones
		endif
		<name> :obj_switchscript guitarist_idle
		<name> :obj_spawnscriptnow facial_anim_loop
	else
		printf \{"profile not found in create_bassist! ........."}
	endif
	return \{true}
endscript

script create_vocalist \{name = vocalist
		profile_name = 'singer'
		async = 0}
	extendcrc <name> '_Info' out = info_struct
	printf "creating vocalist - %a ........." a = <name>
	find_profile name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <name>
		if doeswaypointexist name = <waypoint_id>
			getwaypointpos name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf "unable to find starting position for %a ........" a = <name>
		endif
		if ($vocalist_song_anim_pak != none)
			unloadpakasync pak_name = $vocalist_song_anim_pak heap = bottomupheap async = <async>
			change \{vocalist_song_anim_pak = none}
		endif
		get_musician_profile_struct index = <index>
		alt_body = none
		if ((<profile_struct>.musician_body.desc_id) = aero_singer)
			getpakmancurrent \{map = zones}
			switch <pak>
				case z_nipmuc
				printf \{channel = animinfo
					"using Aero_Singer_Nipmuc"}
				alt_body = aero_singer_nipmuc
				case z_maxskc
				printf \{channel = animinfo
					"using Aero_Singer_MaxKC"}
				alt_body = aero_singer_maxkc
				case z_fenway
				printf \{channel = animinfo
					"using Aero_Singer_Orpheum"}
				alt_body = aero_singer_orpheum
				case z_nine_lives
				printf \{channel = animinfo
					"using Aero_Singer_Nine_Lives"}
				alt_body = aero_singer_nine_lives
				case z_jpplay
				printf \{channel = animinfo
					"using Aero_drummer"}
				alt_body = aero_singer_jpplay
				default
				printf \{channel = animinfo
					"using Aero_singer"}
			endswitch
		else
			printf \{channel = animinfo
				"not Aero_singer"}
		endif
		if (<alt_body> != none)
			profile = {<profile_struct>
				musician_body = {desc_id = <alt_body>}
			}
		else
			profile = {<profile_struct>}
		endif
		if NOT create_band_member name = <name> profile = <profile> start_node = <waypoint_id> no_interleave <...>
			return \{false}
		endif
		get_song_struct song = ($current_song)
		if structurecontains structure = <song_struct> name = singer_anim_pak
			singer_anim_pak = (<song_struct>.singer_anim_pak)
			if NOT loadpakasync pak_name = <singer_anim_pak> heap = heap_musician5_anim async = <async>
				printf \{"unable to song specific singer anim pak"}
				return \{false}
			else
				printf \{"song specific singer anim pak successfully loaded"}
			endif
			change vocalist_song_anim_pak = (<song_struct>.singer_anim_pak)
		endif
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		change structurename = <info_struct> allow_movement = true
		if gotparam \{stance}
			change structurename = <info_struct> stance = <stance>
		else
			change structurename = <info_struct> stance = (<profile_struct>.stance)
		endif
		if structurecontains structure = <profile_struct> name = accessory_bones
			printf \{channel = animinfo
				"vocalist: accessory bone struct found in profile!"}
			accessory_bones = (<profile_struct>.accessory_bones)
			<name> :ragdoll_setaccessorybones accessory_bones = $<accessory_bones>
		else
			printf \{channel = animinfo
				"vocalist: accessory bone struct NOT found in profile...using default!"}
			<name> :ragdoll_setaccessorybones accessory_bones = $guitarist_accessory_bones
		endif
		<name> :obj_switchscript bandmember_idle
		<name> :obj_spawnscriptnow facial_anim_loop
	else
		printf \{"profile not found in create_vocalist! ........."}
	endif
	return \{true}
endscript

script create_drummer \{name = drummer
		profile_name = 'drummer'
		async = 0}
	extendcrc <name> '_Info' out = info_struct
	printf "creating drummer - %a ........." a = <name>
	find_profile name = <profile_name>
	if (<found> = 1)
		get_start_node_id member = <name>
		if doeswaypointexist name = <waypoint_id>
			getwaypointpos name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf "unable to find starting position for %a ........" a = <name>
		endif
		get_musician_profile_struct index = <index>
		alt_body = none
		if ((<profile_struct>.musician_body.desc_id) = aero_drummer)
			getpakmancurrent \{map = zones}
			switch <pak>
				case z_nipmuc
				printf \{channel = animinfo
					"using Aero_Drummer_Nipmuc"}
				alt_body = aero_drummer_nipmuc
				case z_maxskc
				printf \{channel = animinfo
					"using Aero_Drummer_MaxKC"}
				alt_body = aero_drummer_maxkc
				case z_fenway
				printf \{channel = animinfo
					"using Aero_Drummer_Orpheum"}
				alt_body = aero_drummer_orpheum
				case z_nine_lives
				printf \{channel = animinfo
					"using Aero_Drummer_Nine_Lives"}
				alt_body = aero_drummer_nine_lives
				case z_jpplay
				printf \{channel = animinfo
					"using Aero_Drummer_JPPlay"}
				alt_body = aero_drummer_jpplay
				default
				printf \{channel = animinfo
					"using Aero_drummer"}
			endswitch
		else
			printf \{channel = animinfo
				"not Aero_drummer"}
		endif
		if (<alt_body> != none)
			profile = {<profile_struct>
				musician_body = {desc_id = <alt_body>}
			}
		else
			profile = {<profile_struct>}
		endif
		if NOT create_band_member name = <name> profile = <profile> start_node = <waypoint_id> <...>
			return \{false}
		endif
		change structurename = <info_struct> anim_set = (<profile_struct>.anim_set)
		if structurecontains structure = <profile_struct> name = arm_anims
			change structurename = <info_struct> arm_anims = (<profile_struct>.arm_anims)
		else
			printf \{"using default drummer anims"}
			change structurename = <info_struct> arm_anims = drummer_anims
		endif
		if structurecontains structure = <profile_struct> name = cymbal_anims
			change structurename = <info_struct> cymbal_anims = (<profile_struct>.cymbal_anims)
		else
			printf \{"using default cybmal anims"}
			change structurename = <info_struct> cymbal_anims = cymbal_anims
		endif
		change structurename = <info_struct> allow_movement = true
		if gotparam \{stance}
			change structurename = <info_struct> stance = <stance>
		else
			change structurename = <info_struct> stance = (<profile_struct>.stance)
		endif
		if structurecontains structure = <profile_struct> name = accessory_bones
			printf \{channel = animinfo
				"drummer: accessory bone struct found in profile!"}
			accessory_bones = (<profile_struct>.accessory_bones)
			<name> :ragdoll_setaccessorybones accessory_bones = $<accessory_bones>
		else
			printf \{channel = animinfo
				"drummer: accessory bone struct NOT found in profile...using default!"}
			<name> :ragdoll_setaccessorybones accessory_bones = $guitarist_accessory_bones
		endif
		<name> :obj_killspawnedscript name = drummer_autotwist
		<name> :obj_spawnscriptnow drummer_autotwist
		<name> :obj_switchscript bandmember_idle
		<name> :obj_spawnscriptnow facial_anim_loop
		change \{structurename = drummer_info
			last_left_arm_note = 0}
		change \{structurename = drummer_info
			last_right_arm_note = 0}
	else
		printf \{"profile not found in create_drummer! ........."}
	endif
	return \{true}
endscript
drummer_twist_factor = 0.0
desired_twist = 0.0

script drummer_autotwist 
	anim_set = ($drummer_info.anim_set)
	twist_anim = ($<anim_set>.bodytwist)
	hero_play_anim tree = $drummer_twist_branch target = bodytwist anim = <twist_anim> blendduration = 0.0
	begin
	twist = ($drummer_info.twist)
	compute_desired_drummer_twist
	diff = (<desired_twist> - <twist>)
	if (<twist> < <desired_twist>)
		if (<diff> < $drummer_twist_rate)
			twist = <desired_twist>
		else
			twist = (<twist> + $drummer_twist_rate)
		endif
	elseif (<twist> > <desired_twist>)
		if ((<diff> * -1) < $drummer_twist_rate)
			twist = <desired_twist>
		else
			twist = (<twist> - $drummer_twist_rate)
		endif
	endif
	change structurename = drummer_info twist = <twist>
	change drummer_twist_factor = <twist>
	wait \{1
		gameframe}
	repeat
endscript

script unload_character 
	destroy_band_member name = <name>
endscript

script unload_band 
	destroy_band_member \{name = guitarist}
	destroy_band_member \{name = bassist}
	destroy_band_member \{name = rhythm}
	destroy_band_member \{name = drummer}
	destroy_band_member \{name = vocalist}
	destroy_band_member \{name = vocalist2}
	force_unload_all_character_paks
endscript

script hero_play_random_anim \{blendduration = 0.2}
	getarraysize <anims>
	getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
	anim_name = (<anims> [<newindex>])
	if gotparam \{cycle}
		hero_play_anim anim = <anim_name> blendduration = <blendduration> cycle
	else
		hero_play_anim anim = <anim_name> blendduration = <blendduration>
	endif
endscript

script should_display_debug_info 
	obj_getid
	display_info = false
	switch (<objid>)
		case guitarist
		if ($display_guitarist_anim_info = true)
			display_info = true
		endif
		case bassist
		if ($display_bassist_anim_info = true)
			display_info = true
		endif
		case vocalist
		if ($display_vocalist_anim_info = true)
			display_info = true
		endif
		case drummer
		if ($display_drummer_anim_info = true)
			display_info = true
		endif
	endswitch
	return <display_info>
endscript

script hero_play_random_anims 
	count = 0
	begin
	hero_play_random_anim anims = <anim_array>
	hero_wait_until_anim_finished
	count = (<count> + 1)
	if gotparam \{repeat_count}
		if (<count> = <repeat_count>)
			break
		endif
	endif
	repeat
endscript

script hero_play_adjusting_random_anims \{blend_time = 0.2}
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	change structurename = <info_struct> playing_special_anim = false
	count = 0
	begin
	anim = ($<info_struct>.current_anim)
	cycle = ($<info_struct>.cycle_anim)
	repeat_count = ($<info_struct>.anim_repeat_count)
	if (<objid> = guitarist || <objid> = bassist || <objid> = rhythm)
		if (($<info_struct>.disable_arms) = 2)
			if ($<info_struct>.arms_disabled != 2)
				hero_toggle_arms num_arms = 0 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
				change structurename = <info_struct> arms_disabled = 2
			endif
		elseif (($<info_struct>.disable_arms) = 1)
			if ($<info_struct>.arms_disabled != 1)
				hero_toggle_arms num_arms = 1 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
				change structurename = <info_struct> arms_disabled = 1
			endif
		else
			if ($<info_struct>.arms_disabled != 0)
				hero_toggle_arms num_arms = 2 prev_num_arms = (2 - ($<info_struct>.arms_disabled))
				change structurename = <info_struct> arms_disabled = 0
			endif
		endif
	endif
	if (<objid> = guitarist)
		if NOT (<anim> = idle)
			change structurename = <info_struct> facial_anim = <anim>
		endif
	endif
	if hero_play_tempo_anim_cfunc anim = <anim> blendduration = <blend_time>
		hero_play_anim anim = <anim_to_run> blendduration = <blend_duration> usemotionextraction = <use_motion_extraction>
		hero_wait_until_anim_finished
	else
		wait \{1
			gameframe}
	endif
	display_debug_info = false
	if (should_display_debug_info)
		display_debug_info = true
	endif
	anim_set = ($<info_struct>.anim_set)
	stance = ($<info_struct>.stance)
	next_stance = ($<info_struct>.next_stance)
	stance_changed = false
	if NOT (<next_stance> = <stance>)
		if (<display_debug_info> = true)
			printf channel = animinfo "%c stance now changing from %a to %b............" c = <objid> a = <stance> b = <next_stance>
		endif
		if play_stance_transition_cfunc anim_set = <anim_set> old_stance = <stance> new_stance = <next_stance>
			hero_play_anim anim = <anim_to_run>
			hero_wait_until_anim_finished
		endif
		change structurename = <info_struct> stance = <next_stance>
		stance = <next_stance>
		stance_changed = true
	endif
	next_anim = ($<info_struct>.next_anim)
	if (<next_anim> = none && <stance_changed> = false)
		if (<cycle> = false)
			repeat_count = (<repeat_count> - 1)
			if (<repeat_count> < 1)
				if (<display_debug_info> = true)
					printf channel = animinfo "%a has finished playing anim %b " a = <objid> b = <anim>
				endif
				repeat_count = 0
			endif
		endif
		change structurename = <info_struct> anim_repeat_count = <repeat_count>
		if (<cycle> = false && <repeat_count> <= 0)
			change structurename = <info_struct> current_anim = idle
			change structurename = <info_struct> cycle_anim = true
			if (<next_stance> = intro || <next_stance> = intro_smstg || <next_stance> = stance_frontend || <next_stance> = stance_frontend_guitar)
			else
				change structurename = <info_struct> disable_arms = 0
			endif
			blend_time = 0.2
			if (<display_debug_info> = true)
				printf channel = animinfo "%a has no anims in queue...returning to idle" a = <objid>
			endif
		else
			blend_time = 0.2
			if (<display_debug_info> = true)
				if (<cycle> = false)
					printf channel = animinfo "%a repeating the %c anim (%b more times)" c = <anim> a = <objid> b = <repeat_count>
				else
					printf channel = animinfo "%a %b anim is cycling" a = <objid> b = <anim>
				endif
			endif
		endif
	else
		repeat_count = ($<info_struct>.next_anim_repeat_count)
		if ((<display_debug_info> = true) && (<next_anim> != none))
			if (<repeat_count> > 1)
				printf channel = animinfo "%a will play %b anim %c times ......." a = <objid> b = <next_anim> c = <repeat_count>
			else
			endif
		endif
		if (<next_anim> = none)
			if (<display_debug_info> = true)
				printf channel = animinfo "%a has no anims in queue...returning to idle" a = <objid>
			endif
			next_anim = idle
			cycle_next_anim = true
		else
			cycle_next_anim = ($<info_struct>.cycle_next_anim)
		endif
		if (<next_stance> = intro || <next_stance> = intro_smstg || <next_stance> = stance_frontend || <next_stance> = stance_frontend_guitar)
			disable_arms_next_anim = 2
		else
			disable_arms_next_anim = ($<info_struct>.next_anim_disable_arms)
		endif
		change structurename = <info_struct> stance = <next_stance>
		change structurename = <info_struct> current_anim = <next_anim>
		change structurename = <info_struct> cycle_anim = <cycle_next_anim>
		change structurename = <info_struct> disable_arms = <disable_arms_next_anim>
		change structurename = <info_struct> next_anim = none
		change structurename = <info_struct> cycle_next_anim = true
		change structurename = <info_struct> anim_repeat_count = <repeat_count>
		change structurename = <info_struct> next_anim_disable_arms = 0
		blend_time = 0.2
	endif
	repeat
endscript

script crowd_play_adjusting_random_anims \{anim = idle
		blend_time = 0.2
		startwithnoblend = 0}
	obj_getid
	old_speed = undefined
	begin
	hero_get_skill_level_cfunc
	get_anim_speed_for_tempo_cfunc
	if gotparam \{anim_set}
		anims = ($<anim_set>.<anim>.<skill>.<anim_speed>)
	else
		anims = ($crowd_animations.<anim>.<skill>.<anim_speed>)
	endif
	getarraysize <anims>
	getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
	anim_name = (<anims> [<newindex>])
	if (<startwithnoblend> = 1)
		blend_time = 0.0
		startwithnoblend = 0
	elseif (<anim_speed> != <old_speed>)
		blend_time = $crowd_blendtime_tempochange
	elseif (<skill> = bad)
		blend_time = $crowd_blendtime_bad
	elseif (<anim> = special)
		blend_time = $crowd_blendtime_special
	elseif (<anim_speed> = slow)
		blend_time = $crowd_blendtime_slow
	elseif (<anim_speed> = med)
		blend_time = $crowd_blendtime_med
	elseif (<anim_speed> = fast)
		blend_time = $crowd_blendtime_fast
	else
		blend_time = -1.0
	endif
	if ($display_crowd_anim_info = true)
		printf channel = crowd "%a playing %b anim (%c) with blendtime %d ..." a = <objid> b = <anim> c = <anim_name> d = <blend_time>
	endif
	gameobj_playanim anim = <anim_name> blendduration = <blend_time> animevents = on
	gameobj_waitanimfinished
	old_speed = <anim_speed>
	repeat
endscript

script hero_strum_guitar \{note_length = 150}
	if (<note_length> < $short_strum_max_gem_length)
		anim_length = short
	elseif (<note_length> < $med_strum_max_gem_length)
		anim_length = med
	else
		anim_length = long
	endif
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	change structurename = <info_struct> last_strum_length = <anim_length>
	strum_type = ($<info_struct>.strum)
	extendcrc <strum_type> '_Strums' out = strum_anims
	if (($<info_struct>.playing_missed_note = false) || ($always_strum = true))
		getarraysize (<strum_anims>.<anim_length>)
		getrandomvalue name = newindex integer a = 0 b = (<array_size> - 1)
		strum_anim = (<strum_anims>.<anim_length> [<newindex>])
		hero_play_strum_anim anim = <strum_anim> blendduration = 0.1
	endif
	hero_wait_until_anim_finished \{timer = strumtimer}
	hero_play_strum_anim anim = (($<strum_anims>).no_strum_anim)
endscript

script hero_play_chord \{chord = track_none}
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	finger_anims = ($<info_struct>.finger_anims)
	if structurecontains structure = $<info_struct> name = finger_bend_anims
		finger_bend_anims = ($<info_struct>.finger_bend_anims)
	else
		finger_bend_anims = ($<info_struct>.finger_anims)
	endif
	if structurecontains structure = $<finger_anims> name = <chord>
		finger_anim = (<finger_anims>.<chord>)
		finger_bend_anim = (<finger_bend_anims>.<chord>)
		if (<chord> = none)
			blend_time = $finger_release_blend_time
		else
			blend_time = $finger_press_blend_time
		endif
	else
		finger_anim = (<finger_anims>.none)
		finger_bend_anim = (<finger_anims>.none)
		blend_time = $finger_release_blend_time
	endif
	if (<finger_anim> != none)
		hero_play_finger_anim anim = <finger_anim> bend_anim = <finger_bend_anim> blendduration = <blend_time>
	endif
endscript

script find_profile 
	get_musician_profile_size
	if gotparam \{name}
		getlowercasestring <name>
		search_name = <lowercasestring>
		found = 0
		index = 0
		begin
		get_musician_profile_struct index = <index>
		getlowercasestring (<profile_struct>.name)
		profile_name = <lowercasestring>
		if (<profile_name> = <search_name>)
			found = 1
			break
		endif
		index = (<index> + 1)
		repeat <array_size>
		return found = <found> index = <index>
	elseif gotparam \{body_id}
		found = 0
		index = 0
		begin
		get_musician_profile_struct index = <index>
		body = (<profile_struct>.musician_body)
		body_descid = (<body>.desc_id)
		if (<body_id> = <body_descid>)
			found = 1
			break
		endif
		index = (<index> + 1)
		repeat <array_size>
		return found = <found> index = <index>
	endif
endscript

script find_profile_by_id 
	get_musician_profile_size
	found = 0
	index = 0
	begin
	get_musician_profile_struct index = <index>
	next_name = (<profile_struct>.name)
	formattext checksumname = profile_id '%n' n = <next_name> addtostringlookup = true
	if (<profile_id> = <id>)
		return true index = <index>
		break
	endif
	index = (<index> + 1)
	repeat <array_size>
	find_profile_by_id \{id = axel}
	return false index = <index>
endscript

script get_waypoint_id \{index = 0}
	getpakmancurrent \{map = zones}
	getpakmancurrentname \{map = zones}
	if (<index> < 10)
		formattext textname = suffix '_TRG_Waypoint_0%a' a = <index>
	else
		formattext textname = suffix '_TRG_Waypoint_%a' a = <index>
	endif
	waypoint_name = (<pakname> + <suffix>)
	appendsuffixtochecksum base = <pak> suffixstring = <suffix>
	return waypoint_id = <appended_id> waypoint_name = <waypoint_name>
endscript

script get_start_node_id \{character = "guitarist"}
	player2_is_guitarist = false
	if (($game_mode = p2_coop) || ($game_mode = p2_quickplay))
		if NOT ($player1_status.part = guitar)
			player2_is_guitarist = true
		endif
	endif
	art_deco_encore = false
	getpakmancurrent \{map = zones}
	if (<pak> = z_artdeco)
		if getnodeflag \{ls_encore_post}
			art_deco_encore = true
		endif
	endif
	switch (<member>)
		case guitarist
		if ($current_num_players = 1)
			character = "guitarist"
		else
			if (<player2_is_guitarist> = true)
				if (<art_deco_encore> = true)
					character = "guitarist"
				else
					character = "guitarist_player2"
				endif
			else
				character = "guitarist_player1"
			endif
		endif
		case bassist
		if ($current_num_players = 1)
			character = "bassist"
		else
			if (<player2_is_guitarist> = true)
				character = "guitarist_player1"
			else
				if (<art_deco_encore> = true)
					character = "guitarist"
				else
					character = "guitarist_player2"
				endif
			endif
		endif
		case vocalist
		character = "vocalist"
		case vocalist2
		character = "vocalist2"
		case drummer
		character = "drummer"
		case rhythm
		character = "rhythm"
		default
		printf \{"Unknown character referenced in get_starting_position!"}
		character = "unknown"
	endswitch
	if getpakmancurrentname \{map = zones}
		getpakmancurrent \{map = zones}
		formattext textname = suffix '_TRG_Waypoint_%a_start' a = <character>
		waypoint_name = (<pakname> + <suffix>)
		appendsuffixtochecksum base = <pak> suffixstring = <suffix>
		return waypoint_id = <appended_id> waypoint_name = <waypoint_name>
	else
		return \{waypoint_id = none
			waypoint_name = "NONE"}
	endif
endscript

script get_skill_level 
	health = ($player1_status.current_health)
	skill = normal
	if (<health> < 0.66)
		skill = bad
	elseif (<health> > 1.3299999)
		skill = good
	endif
	return skill = <skill>
endscript

script get_target_node 
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	return target_node = ($<info_struct>.target_node)
endscript
bandmember_idle_eventtable = [
	{
		response = call_script
		event = play_anim
		scr = handle_play_anim
	}
	{
		response = call_script
		event = change_stance
		scr = handle_change_stance
	}
]

script bandmember_idle 
	reseteventhandlersfromtable \{bandmember_idle_eventtable
		group = hand_events}
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	obj_spawnscriptnow \{hero_play_adjusting_random_anims
		params = {
			anim = idle
		}}
	block
endscript

script play_special_facial_anim 
	if NOT gotparam \{anim}
		return
	endif
	obj_killspawnedscript \{name = facial_anim_loop}
	obj_getid
	if (<objid> = guitarist)
	endif
	hero_play_facial_anim anim = <anim>
	hero_wait_until_anim_finished \{timer = facialtimer}
	if (<objid> = guitarist)
	endif
	obj_spawnscriptnow \{facial_anim_loop}
endscript

script facial_anim_loop 
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	if ($display_facial_anim_info = true)
		printf channel = facial "%a starting facial_anim_loop" a = <objid>
	endif
	if NOT structurecontains structure = $<anim_set> name = facial_anims
		if ($display_facial_anim_info = true)
			printf channel = facial "%a's anim set doesn't have facial anims defined." a = <objid>
		endif
		return
	endif
	if NOT structurecontains structure = ($<anim_set>.facial_anims) name = idle
		if ($display_facial_anim_info = true)
			printf channel = facial "%a's facial anim set doesn't have an idle defined" a = <objid>
		endif
		return
	endif
	begin
	anim = ($<info_struct>.facial_anim)
	if NOT structurecontains structure = ($<anim_set>.facial_anims) name = <anim>
		if ($display_facial_anim_info = true)
			printf channel = facial "facial anims not defined for %a ... reverting to idle" a = <anim>
		endif
		anim = idle
	endif
	anims = ($<anim_set>.facial_anims.<anim>)
	getarraysize <anims>
	getrandomvalue name = index integer a = 0 b = (<array_size> - 1)
	anim_name = (<anims> [<index>])
	if ($display_facial_anim_info = true)
		printf channel = facial "%c playing facial anim - %a (%b) ..." a = <anim> b = <anim_name> c = <objid>
	endif
	change structurename = <info_struct> facial_anim = idle
	hero_play_facial_anim anim = <anim_name>
	hero_wait_until_anim_finished \{timer = facialtimer}
	wait \{1
		gameframe}
	repeat
endscript
guitarist_idle_eventtable = [
	{
		response = call_script
		event = strum_guitar
		scr = handle_strum_event
	}
	{
		response = call_script
		event = pose_fret
		scr = handle_fret_event
	}
	{
		response = call_script
		event = pose_fingers
		scr = handle_finger_event
	}
	{
		response = call_script
		event = anim_missednote
		scr = handle_missed_note
	}
	{
		response = call_script
		event = anim_hitnote
		scr = handle_hit_note
	}
	{
		response = call_script
		event = play_anim
		scr = handle_play_anim
	}
	{
		response = call_script
		event = play_battle_anim
		scr = handle_play_anim
	}
	{
		response = call_script
		event = change_stance
		scr = handle_change_stance
	}
	{
		response = call_script
		event = walk
		scr = handle_walking
	}
]

script guitarist_idle 
	reseteventhandlersfromtable \{guitarist_idle_eventtable
		group = hand_events}
	obj_getid
	if (($player1_status.band_member) = <objid>)
		seteventhandler \{response = call_script
			event = star_power_onp1
			scr = handle_star_power
			group = hand_events}
	else (($player2_status.band_member) = <objid>)
		seteventhandler \{response = call_script
			event = star_power_onp2
			scr = handle_star_power
			group = hand_events}
	endif
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	obj_spawnscriptnow \{hero_play_adjusting_random_anims
		params = {
			anim = idle
			blend_time = 0.2
			cycle
		}}
	block
endscript

script guitarist_idle_animpreview 
	cleareventhandlergroup \{hand_events}
endscript
guitarist_walking_eventtable = [
	{
		response = call_script
		event = strum_guitar
		scr = handle_strum_event
	}
	{
		response = call_script
		event = pose_fret
		scr = handle_fret_event
	}
	{
		response = call_script
		event = pose_fingers
		scr = handle_finger_event
	}
	{
		response = call_script
		event = anim_missednote
		scr = handle_missed_note
	}
	{
		response = call_script
		event = anim_hitnote
		scr = handle_hit_note
	}
	{
		response = call_script
		event = change_stance
		scr = queue_change_stance
	}
]

script guitarist_walking 
	reseteventhandlersfromtable \{guitarist_walking_eventtable
		group = hand_events}
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	spawnscriptnow \{start_walk_camera}
	walk_to_waypoint <...>
	spawnscriptnow \{kill_walk_camera}
	obj_switchscript \{guitarist_idle}
endscript

script play_special_anim \{stance = stance_a
		disable_arms = 2
		blendduration = 0.2}
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	cleareventhandlergroup \{hand_events}
	if gotparam \{respond_to_hand_events}
		reseteventhandlersfromtable \{guitarist_walking_eventtable
			group = hand_events}
	else
		seteventhandler \{response = call_script
			event = change_stance
			scr = queue_change_stance
			group = hand_events}
	endif
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	if gotparam \{wait}
		hero_wait_until_anim_finished
	endif
	if (<disable_arms> = 0)
		if (<info_struct>.arms_disabled = 2)
			hero_toggle_arms \{prev_num_arms = 0
				num_arms = 2}
			change structurename = <info_struct> arms_disabled = 0
			change structurename = <info_struct> disable_arms = 0
			change structurename = <info_struct> next_anim_disable_arms = 0
			change structurename = <info_struct> current_anim = idle
			change structurename = <info_struct> cycle_anim = idle
			change structurename = <info_struct> next_anim = idle
			change structurename = <info_struct> cycle_next_anim = true
		endif
	endif
	if (<disable_arms> = 2)
		if (<objid> = guitarist || <objid> = bassist || <objid> = rhythm || <objid> = drummer)
			hero_disable_arms \{blend_time = 0.0}
		endif
	endif
	change structurename = <info_struct> stance = <stance>
	if hero_play_tempo_anim_cfunc anim = <anim> blendduration = <blendduration>
		if (<anim_to_run> = gh3_guit_joep_whip_win)
			printf \{"disabling accessory bones for whip anim!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"}
			ragdoll_setaccessorybones \{accessory_bones = $guitarist_accessory_bones
				disable}
		endif
		hero_play_anim anim = <anim_to_run> blendduration = <blend_duration> usemotionextraction = <use_motion_extraction>
	endif
	if (<stance> = win || <stance> = win_smstg || <stance> = lose || <stance> = lose_smstg || <anim> = starpower)
		ragdoll_markforreset
	endif
	if (<objid> = guitarist || <objid> = bassist || <objid> = rhythm)
		if (<disable_arms> = 2)
			hero_wait_until_anim_near_end \{time_from_end = 0.25}
			hero_enable_arms \{blend_time = 0.25}
		endif
	endif
	hero_wait_until_anim_finished
	change structurename = <info_struct> stance = stance_a
	if (<objid> = guitarist || <objid> = bassist || <objid> = rhythm)
		obj_switchscript \{guitarist_idle}
	else
		obj_switchscript \{bandmember_idle}
	endif
endscript

script play_simple_anim \{disable_arms = 2
		blendduration = 0.0}
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	cleareventhandlergroup \{hand_events}
	obj_killspawnedscript \{name = hero_play_adjusting_random_anims}
	if (<disable_arms> = 2)
		if (<objid> = guitarist || <objid> = bassist || <objid> = rhythm || <objid> = drummer)
			hero_disable_arms blend_time = <blendduration>
		endif
	endif
	if gotparam \{cycle}
		hero_play_anim anim = <anim> blendduration = <blendduration> cycle
		if (<blendduration> = 0.0)
			ragdoll_markforreset
		endif
		obj_switchscript \{nullscript}
	endif
	hero_play_anim anim = <anim> blendduration = <blendduration>
	if (<blendduration> = 0.0)
		ragdoll_markforreset
	endif
	if (<objid> = guitarist || <objid> = bassist || <objid> = rhythm || <objid> = drummer)
		hero_wait_until_anim_near_end \{time_from_end = 0.25}
		hero_enable_arms \{blend_time = 0.25}
	endif
	hero_wait_until_anim_finished
	handle_change_stance \{stance = stance_a
		no_wait}
	if (<objid> = guitarist || <objid> = bassist || <objid> = rhythm)
		obj_switchscript \{guitarist_idle}
	else
		obj_switchscript \{bandmember_idle}
	endif
endscript

script handle_star_power 
	obj_getid
	extendcrc <objid> '_Info' out = info_struct
	if ($current_num_players = 1)
		get_song_struct song = ($current_song)
		if structurecontains structure = <song_struct> name = band
			if (<song_struct>.band != default_band)
				return
			endif
		endif
	endif
	change structurename = <info_struct> waiting_for_cameracut = true
	begin
	if ($<info_struct>.waiting_for_cameracut = false)
		break
	endif
	wait \{1
		gameframe}
	repeat
	obj_switchscript \{play_special_anim
		params = {
			stance = stance_a
			anim = starpower
			blendduration = 0.0
			disable_arms = 0
			respond_to_hand_events = 1
		}}
endscript

script handle_song_won 
	obj_killspawnedscript \{name = handle_star_power}
	printf \{channel = animinfo
		"handle song won............"}
	obj_switchscript \{play_special_anim
		params = {
			stance = win
			anim = idle
			kill_transitions_when_done
		}}
endscript

script handle_song_failed 
	obj_killspawnedscript \{name = handle_star_power}
	printf \{channel = animinfo
		"handle song failed........."}
	obj_switchscript \{play_special_anim
		params = {
			stance = lose
			anim = idle
			kill_transitions_when_done
		}}
endscript

script play_intro_anims 
	printf \{channel = animinfo
		"play_intro_anims............."}
	intro_stance = intro
	if (usesmallvenueanims)
		printf \{channel = animinfo
			"Using small venue anims! ............"}
		intro_stance = intro_smstg
	endif
	play_guitarist_intro = true
	if (<play_guitarist_intro> = true)
		band_changestance name = guitarist stance = <intro_stance> no_wait
		band_changestance name = bassist stance = <intro_stance> no_wait
	else
		if ($game_mode = p2_coop || $game_mode = p2_quickplay)
			band_changestance name = ($player1_status.band_member) stance = <intro_stance> no_wait
			band_changestance name = ($player2_status.band_member) stance = stance_a no_wait
		else
			band_changestance \{name = guitarist
				stance = stance_a
				no_wait}
			band_changestance name = bassist stance = <intro_stance> no_wait
		endif
	endif
	band_changestance name = vocalist stance = <intro_stance> no_wait
	band_changestance name = vocalist2 stance = <intro_stance> no_wait
	band_changestance name = rhythm stance = <intro_stance> no_wait
	band_changestance \{name = drummer
		stance = intro
		no_wait}
	band_changestance \{name = guitarist
		stance = stance_a}
	band_changestance \{name = bassist
		stance = stance_a}
	band_changestance \{name = rhythm
		stance = stance_a}
	band_changestance \{name = vocalist
		stance = stance_a}
	band_changestance \{name = vocalist2
		stance = stance_a}
	band_changestance \{name = drummer
		stance = stance_a}
endscript

script usesmallvenueanims 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_party
		return_val = true
		case z_dive
		return_val = true
		case z_video
		return_val = true
		case z_prison
		return_val = true
		case z_hell
		return_val = true
		case z_artdeco
		if getnodeflag \{ls_encore_post}
			return \{true}
		endif
		default
		return_val = false
	endswitch
	return <return_val>
endscript

script play_win_anims 
	if ($disable_band = 1)
		return
	endif
	if ($game_mode = tutorial)
		return
	endif
	band_movetostartnode \{name = guitarist}
	band_movetostartnode \{name = bassist}
	band_movetostartnode \{name = rhythm}
	band_movetostartnode \{name = vocalist}
	band_movetostartnode \{name = vocalist2}
	printf \{channel = animinfo
		"play_win_anims............."}
	win_stance = win
	lose_stance = lose
	if (usesmallvenueanims)
		printf \{channel = animinfo
			"Using small venue anims! ............"}
		win_stance = win_smstg
		lose_stance = lose_smstg
	endif
	if ((($current_num_players = 1) && ($boss_battle = 0)) || ($game_mode = p2_coop) || ($game_mode = p2_quickplay))
		if compositeobjectexists \{name = guitarist}
			guitarist :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle kill_transitions_when_done blendduration = 0.0}
		endif
		if compositeobjectexists \{name = bassist}
			bassist :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle kill_transitions_when_done blendduration = 0.0}
		endif
	else
		if ($boss_battle = 1)
			guitarist :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle kill_transitions_when_done blendduration = 0.0}
			bassist :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle kill_transitions_when_done blendduration = 0.0}
		else
			tied = false
			p1_won = true
			if ($game_mode = p2_battle)
				if (($player2_status.current_health) > ($player1_status.current_health))
					p1_won = false
				endif
			else
				if (($player2_status.score) = ($player1_status.score))
					tied = true
				elseif (($player2_status.score) > ($player1_status.score))
					p1_won = false
				endif
			endif
			if (<tied> = true)
				($player1_status.band_member) :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
				($player2_status.band_member) :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
			elseif (<p1_won> = true)
				($player1_status.band_member) :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
				($player2_status.band_member) :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
			else
				($player2_status.band_member) :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
				($player1_status.band_member) :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
			endif
		endif
	endif
	if compositeobjectexists \{name = drummer}
		change \{structurename = drummer_info
			desired_twist = 0.0}
		change \{structurename = drummer_info
			last_left_arm_note = 0}
		change \{structurename = drummer_info
			last_right_arm_note = 0}
		drummer :obj_switchscript \{play_special_anim
			params = {
				stance = win
				anim = idle
				blendduration = 0.0
			}}
	endif
	if compositeobjectexists \{name = rhythm}
		rhythm :obj_switchscript \{play_special_anim
			params = {
				stance = win
				anim = idle
				blendduration = 0.0
			}}
	endif
	if compositeobjectexists \{name = vocalist}
		vocalist :obj_switchscript \{play_special_anim
			params = {
				stance = win
				anim = idle
				blendduration = 0.0
			}}
	endif
	if compositeobjectexists \{name = vocalist2}
		vocalist2 :obj_switchscript \{play_special_anim
			params = {
				stance = win
				anim = idle
				blendduration = 0.0
			}}
	endif
	restore_idle_faces
endscript

script play_lose_anims 
	if ($disable_band = 1)
		return
	endif
	band_movetostartnode \{name = guitarist}
	band_movetostartnode \{name = bassist}
	band_movetostartnode \{name = rhythm}
	band_movetostartnode \{name = vocalist}
	band_movetostartnode \{name = vocalist2}
	win_stance = win
	lose_stance = lose
	if (usesmallvenueanims)
		printf \{channel = animinfo
			"Using small venue anims! ............"}
		win_stance = win_smstg
		lose_stance = lose_smstg
	endif
	if ((($current_num_players = 1) && ($boss_battle = 0)) || ($game_mode = p2_coop) || ($game_mode = p2_quickplay))
		if compositeobjectexists \{name = guitarist}
			guitarist :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
		endif
		if compositeobjectexists \{name = bassist}
			bassist :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
		endif
	else
		if ($boss_battle = 1)
			guitarist :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
			bassist :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
		else
			p1_won = true
			if ($game_mode = p2_battle)
				if (($player2_status.current_health) > ($player1_status.current_health))
					p1_won = false
				endif
			else
				if (($player2_status.score) > ($player1_status.score))
					p1_won = false
				endif
			endif
			if (<p1_won> = true)
				($player1_status.band_member) :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
				($player2_status.band_member) :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
			else
				($player2_status.band_member) :obj_switchscript play_special_anim params = {stance = <win_stance> anim = idle blendduration = 0.0}
				($player1_status.band_member) :obj_switchscript play_special_anim params = {stance = <lose_stance> anim = idle blendduration = 0.0}
			endif
		endif
	endif
	if compositeobjectexists \{name = rhythm}
		rhythm :obj_switchscript \{play_special_anim
			params = {
				stance = lose
				anim = idle
				blendduration = 0.0
			}}
	endif
	if compositeobjectexists \{name = drummer}
		change \{structurename = drummer_info
			last_left_arm_note = 0}
		change \{structurename = drummer_info
			last_right_arm_note = 0}
		change \{structurename = drummer_info
			desired_twist = 0.0}
		drummer :obj_switchscript \{play_special_anim
			params = {
				stance = lose
				anim = idle
				blendduration = 0.0
			}}
	endif
	if compositeobjectexists \{name = vocalist}
		vocalist :obj_switchscript \{play_special_anim
			params = {
				stance = lose
				anim = idle
				blendduration = 0.0
			}}
	endif
	if compositeobjectexists \{name = vocalist2}
		vocalist2 :obj_switchscript \{play_special_anim
			params = {
				stance = lose
				anim = idle
				blendduration = 0.0
			}}
	endif
	restore_idle_faces
endscript

script restore_idle_faces 
	if compositeobjectexists \{name = guitarist}
		guitarist :obj_killspawnedscript \{name = facial_anim_loop}
		guitarist :obj_spawnscriptnow \{facial_anim_loop}
	endif
	if compositeobjectexists \{name = bassist}
		bassist :obj_killspawnedscript \{name = facial_anim_loop}
		bassist :obj_spawnscriptnow \{facial_anim_loop}
	endif
	if compositeobjectexists \{name = vocalist}
		vocalist :obj_killspawnedscript \{name = facial_anim_loop}
		vocalist :obj_spawnscriptnow \{facial_anim_loop}
	endif
	if compositeobjectexists \{name = vocalist2}
		vocalist2 :obj_killspawnedscript \{name = facial_anim_loop}
		vocalist2 :obj_spawnscriptnow \{facial_anim_loop}
	endif
	if compositeobjectexists \{name = drummer}
		drummer :obj_killspawnedscript \{name = facial_anim_loop}
		drummer :obj_spawnscriptnow \{facial_anim_loop}
	endif
endscript

script hide_band 
	if compositeobjectexists \{guitarist}
		guitarist :hide
	endif
	if compositeobjectexists \{bassist}
		bassist :hide
	endif
	if compositeobjectexists \{rhythm}
		rhythm :hide
	endif
	if compositeobjectexists \{vocalist}
		vocalist :hide
	endif
	if compositeobjectexists \{vocalist2}
		vocalist2 :hide
	endif
	if compositeobjectexists \{drummer}
		drummer :hide
	endif
endscript

script unhide_band 
	if compositeobjectexists \{guitarist}
		guitarist :unhide
	endif
	if compositeobjectexists \{bassist}
		bassist :unhide
	endif
	if compositeobjectexists \{rhythm}
		rhythm :unhide
	endif
	if compositeobjectexists \{vocalist}
		vocalist :unhide
	endif
	if compositeobjectexists \{vocalist2}
		vocalist2 :unhide
	endif
	if compositeobjectexists \{drummer}
		drummer :unhide
	endif
endscript
using_walk_camera = false

script start_walk_camera 
	if ($using_walk_camera = true || $using_starpower_camera = true || $game_mode = training)
		return
	endif
	change \{using_walk_camera = true}
	change \{cameracuts_allownotescripts = false}
	cameracuts_setarrayprefix \{prefix = 'cameras_walk'
		changetime = $max_walk_camera_cut_delay}
	wait \{7
		seconds}
	cameracuts_setarrayprefix \{prefix = 'cameras'}
	change \{cameracuts_allownotescripts = true}
	change \{using_walk_camera = false}
endscript

script kill_walk_camera \{changecamera = 1}
	if ($using_walk_camera = false || $game_mode = training)
		return
	endif
	killspawnedscript \{name = start_walk_camera}
	if (<changecamera> = 1)
		cameracuts_setarrayprefix \{prefix = 'cameras'}
	endif
	change \{cameracuts_allownotescripts = true}
	change \{using_walk_camera = false}
endscript

script hide_instrument 
	switchoffatomic \{musician_instrument}
endscript

script unhide_instrument 
	switchonatomic \{musician_instrument}
endscript

script hide_extra_instrument 
	switchoffatomic \{musician_extra_instrument}
endscript

script unhide_extra_instrument 
	switchonatomic \{musician_extra_instrument}
endscript

script hide_extra_instrument2 
	switchoffatomic \{musician_extra_instrument2}
endscript

script unhide_extra_instrument2 
	switchonatomic \{musician_extra_instrument2}
endscript

script create_vocalist_dummy 
	if NOT compositeobjectexists \{vocalist}
		createcompositeobjectinstance \{priority = $coim_priority_permanent
			heap = generic
			components = [
				{
					component = motion
				}
			]
			params = {
				name = vocalist_head_dummy
			}}
		get_start_node_id \{member = vocalist}
		getwaypointpos name = <waypoint_id>
		getwaypointdir name = <waypoint_id>
		<pos> = (<pos> + ($vocalist_height) * (0.0, 1.0, 0.0))
		vocalist_head_dummy :obj_setposition position = <pos>
		vocalist_head_dummy :obj_setorientation dir = <dir>
		createcompositeobjectinstance \{priority = $coim_priority_permanent
			heap = generic
			components = [
				{
					component = motion
				}
			]
			params = {
				name = vocalist_dummy
			}}
		get_start_node_id \{member = vocalist}
		getwaypointpos name = <waypoint_id>
		getwaypointdir name = <waypoint_id>
		vocalist_dummy :obj_setposition position = <pos>
		vocalist_dummy :obj_setorientation dir = <dir>
	endif
endscript

script destroy_vocalist_dummy 
	if compositeobjectexists \{vocalist_dummy}
		vocalist_dummy :die
	endif
	if compositeobjectexists \{vocalist_head_dummy}
		vocalist_head_dummy :die
	endif
endscript
