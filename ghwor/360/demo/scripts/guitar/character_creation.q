drummer_active_values = [
	av_drum_anim_hand_l
	av_drum_anim_hand_r
	av_drum_anim_foot_r
	av_drum_anim_transit
	av_drum_blend_hand_l
	av_drum_blend_hand_r
	av_drum_blend_foot_r
	av_drum_blend_hh_kit
	av_drum_mod_loop_body
	av_drum_mod_hand_r
	av_drum_mod_hand_l
	av_drum_mod_foot_r
	av_drum_ik_hand_l
	av_drum_ik_hand_r
	av_drum_ik_feet
	av_eyerot_1
	av_eyerot_2
	av_eyemag_1
	av_eyemag_2
	av_headrot_1
	av_headrot_2
	av_headmag_1
	av_headmag_2
	av_drum_face_rock
]
default_active_values = [
	av_eyerot_1
	av_eyerot_2
	av_eyemag_1
	av_eyemag_2
	av_headrot_1
	av_headrot_2
	av_headmag_1
	av_headmag_2
]
vocalist_active_values = [
	av_vocal_cycle_0
	av_vocal_cycle_1
	av_vocal_cycle_2
	av_vocal_cycle_3
	av_vocal_cycle_4
	av_vocal_cycle_5
	av_brow_scrub
	av_brow_emot
	av_brow_mod
	av_pitch_volume
	av_eyerot_1
	av_eyerot_2
	av_eyemag_1
	av_eyemag_2
	av_headrot_1
	av_headrot_2
	av_headmag_1
	av_headmag_2
]

script create_band_member \{async = !i1768515945
		pos = (0.0, 0.0, 0.0)
		dir = (0.0, 0.0, 1.0)
		player = !i1768515945
		name = !q1768515945
		instrument = !q1768515945
		savegame = !i1768515945
		with_mic = !i1768515945
		id = !q1768515945}
	if compositeobjectexists <name>
		scriptassert '%s already exists' s = <name>
	endif
	instrument_played = <instrument>
	if (<instrument> = vocals_and_guitar)
		instrument_played = guitar
	endif
	extendcrc <name> '_Info' out = info_struct
	if NOT gotparam \{profile_struct}
		if NOT characterprofilegetstruct name = <id> savegame = <savegame>
			scriptassert 'Failed getting character: %a %b' a = <id> b = <savegame>
		endif
	endif
	if NOT gotparam \{appearance_checksum}
		get_appearance_checksum {appearance = (<profile_struct>.appearance) instrument = <instrument_played> mic = <with_mic>}
		appearance_checksum = <new_appearance_checksum>
	endif
	create_band_member_lock
	get_start_node_id member = <name>
	if gotparam \{waypoint_id}
		if doeswaypointexist name = <waypoint_id>
			getwaypointpos name = <waypoint_id>
			getwaypointquat name = <waypoint_id>
			change structurename = <info_struct> target_node = <waypoint_id>
		else
			printf qs(0xa84ca33d) a = <name>
		endif
	endif
	printf qs(0xe349ad7b) a = <name> i = <instrument_played>
	cas_instrument = <instrument>
	if (<with_mic> = 1)
		if (<cas_instrument> = guitar)
			<cas_instrument> = guitar_and_vocals
		elseif (<cas_instrument> = bass)
			<cas_instrument> = bass_and_vocals
		endif
	endif
	if NOT gotparam \{asset_heap}
		get_best_heap_for_appearance appearance = (<profile_struct>.appearance) instrument = <cas_instrument>
		asset_heap = <best_heap>
	endif
	character_asset_context = <asset_heap>
	ik_params = hero_ik_params
	use_ingame_anims = 0
	if ($is_in_cas = 0 && $in_character_select = 0)
		use_ingame_anims = 1
	endif
	if NOT get_body_key_from_appearance key = skeleton_id appearance = (<profile_struct>.appearance)
		scriptassert \{'Missing skeleton in appearance'}
	endif
	get_body_key_from_appearance key = cloth appearance = (<profile_struct>.appearance)
	get_body_key_from_appearance key = cloth_coll_skeleton appearance = (<profile_struct>.appearance)
	get_body_key_from_appearance key = cloth_coll_bones appearance = (<profile_struct>.appearance)
	if get_body_key_from_appearance key = ik_params_set appearance = (<profile_struct>.appearance)
		if (<use_ingame_anims> = 1)
			switch (<instrument_played>)
				case vocals
				ik_params = (<ik_params_set>.vocals)
				case drum
				ik_params = (<ik_params_set>.drum)
				default
				ik_params = (<ik_params_set>.guitar)
			endswitch
		else
			ik_params = (<ik_params_set>.frontend)
		endif
	endif
	if NOT ischecksum \{ik_params}
		scriptassert \{'Problem with ik_params'}
	endif
	get_is_female_from_appearance appearance = (<profile_struct>.appearance)
	originally_is_female = <is_female>
	if get_body_key_from_appearance key = anim_struct appearance = (<profile_struct>.appearance)
		if (<anim_struct> = pick_correct_avatar_anim_struct)
			if ((<is_female> = 0) || (<instrument> = drum))
				<anim_struct> = car_male_anim_struct
				<is_female> = 0
			else
				<anim_struct> = car_female_anim_struct
				<is_female> = 1
			endif
		endif
		change structurename = <info_struct> anim_struct = <anim_struct>
	else
		scriptassert \{'anim_struct missing from appearance'}
	endif
	if (<instrument_played> = guitar)
		set_guitar_string_properties appearance = (<profile_struct>.appearance) info_struct = <info_struct> name = <name>
	elseif (<instrument_played> = bass)
		set_bass_string_properties appearance = (<profile_struct>.appearance) info_struct = <info_struct> name = <name>
	endif
	if (<player> > 0)
		setplayerinfo <player> band_member = <name>
	endif
	switch <name>
		case musician1
		anim_frame = even
		case musician2
		anim_frame = even
		case musician3
		anim_frame = odd
		case musician4
		anim_frame = odd
	endswitch
	lightgroup = [band alt_band combo]
	if structurecontains structure = (<profile_struct>.appearance) additional_light_group
		<additional_light_group> = ((<profile_struct>.appearance).additional_light_group)
		add_to_light_group {
			lightgroup = <lightgroup>
			additional_light_group = <additional_light_group>
		}
	endif
	switch <instrument_played>
		case drum
		active_value_source_list = $drummer_active_values
		case vocals
		active_value_source_list = $vocalist_active_values
		default
		active_value_source_list = $default_active_values
	endswitch
	mempushcontext <asset_heap>
	createfromdesc {
		<profile_struct>
		name = <name>
		desc_id = compositeobject_bandmember
		pos = <pos>
		assetcontext = <character_asset_context>
		object_type = bandmember
		profilebudget = 800
		only_animate_on_frames = <anim_frame>
		uniqueskeletonpath = 'skeletons/EmptyDefaultCharacter.ske'
		skeletonname = <skeleton_id>
		allow_reset
		heap = heap_skeleton
		cloth = <cloth>
		cloth_coll_skeleton = <cloth_coll_skeleton>
		cloth_coll_bones = <cloth_coll_bones>
		lightgroup = <lightgroup>
		global_storage = <asset_heap>
		active_value_set = preview
		active_value_source_list = <active_value_source_list>
		viewports = [all]
		neversuspend
	}
	mempopcontext
	<name> :obj_setorientation quat = <quat>
	get_body_checksum_from_appearance appearance = (<profile_struct>.appearance)
	get_is_fat_from_appearance appearance = (<profile_struct>.appearance)
	get_is_lefty_from_appearance appearance = (<profile_struct>.appearance)
	get_has_large_hands_from_appearance appearance = (<profile_struct>.appearance)
	<name> :settags {
		asset_heap = <asset_heap>
		body_checksum = <body_checksum>
		is_female = <is_female>
		originally_is_female = <originally_is_female>
		is_fat = <is_fat>
		lefty = <lefty>
		large_hands = <large_hands>
		additional_light_group = <additional_light_group>
	}
	if gotparam \{anim_struct_member}
		<name> :settags anim_struct = (<anim_struct_member>.anim_set)
	endif
	if (<use_ingame_anims> = 1)
		switch (<instrument_played>)
			case vocals
			if ($poselog_vocalist = true)
				desired_tree = vocalist_static_tree_poselog
			else
				desired_tree = vocalist_static_tree_standard
			endif
			case drum
			desired_tree = new_drummer_static_tree
			default
			desired_tree = guitarist_static_tree
		endswitch
		<name> :settags frontend_character = 0
		if (<instrument_played> = drum)
			node_ids = $drumdroid_animnode_ids
		elseif (<instrument_played> = vocals)
			node_ids = $vocalist_anim_node_ids
		else
			node_ids = $nondrummer_anim_node_ids
		endif
	else
		desired_tree = frontend_static_tree
		node_ids = $nondrummer_anim_node_ids
		<name> :settags frontend_character = 1
	endif
	use_face_tension = 0
	face_tension_max = gh_rocker_male_nm_max_d
	face_tension_min = gh_rocker_male_nm_min_d
	appearance = (<profile_struct>.appearance)
	if structurecontains structure = <appearance> face_tension
		use_face_tension = $<appearance_checksum>.face_tension
	endif
	if structurecontains structure = <appearance> face_tension_max
		face_tension_max = $<appearance_checksum>.face_tension_max
	endif
	if structurecontains structure = <appearance> face_tension_min
		face_tension_min = $<appearance_checksum>.face_tension_min
	endif
	elbow_bone_chord = bone_forearm_l
	elbow_bone_strum = bone_forearm_r
	negate_rolls = 1
	if (<lefty> = 1)
		elbow_bone_chord = bone_forearm_r
		elbow_bone_strum = bone_forearm_l
		negate_rolls = 0
	endif
	mempushcontext <asset_heap>
	<name> :anim_inittree {
		tree = $<desired_tree>
		nodeiddeclaration = <node_ids>
		params = {
			ik_params = <ik_params>
			player = <player>
			use_face_tension = <use_face_tension>
			face_tension_max = <face_tension_max>
			face_tension_min = <face_tension_min>
			elbow_bone_chord = <elbow_bone_chord>
			elbow_bone_strum = <elbow_bone_strum>
			negate_rolls = <negate_rolls>
		}
	}
	mempopcontext <asset_heap>
	if (<instrument_played> = drum)
		if ((<is_female> = 1) && (<body_checksum> != avatar))
			<name> :anim_command target = femalediff command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_female_drummer_d}
		endif
		if ((<skeleton_id> = gh_rocker_lars_1) || (<skeleton_id> = gh_rocker_lars_2) || (<skeleton_id> = gh_rocker_lars_3) || (<skeleton_id> = gh_rocker_lars_4))
			<name> :anim_command target = femalediff command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_lars_drummer_d}
		endif
		if ((<skeleton_id> = gh_rocker_frankenrocker_1) || (<skeleton_id> = gh_rocker_frankenrocker_2) || (<skeleton_id> = gh_rocker_frankenrocker_3) || (<skeleton_id> = gh_rocker_frankenrocker_4))
			<name> :anim_command target = femalediff command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_frankenrocker_drummer_d}
		endif
		if ((<skeleton_id> = gh_rocker_axel_1) || (<skeleton_id> = gh_rocker_axel_2) || (<skeleton_id> = gh_rocker_axel_3) || (<skeleton_id> = gh_rocker_axel_4))
			<name> :anim_command target = femalediff command = applyfemaledrummerdifference_setanim params = {anim = gh_rocker_axel_drummer_d}
		endif
	endif
	printf \{'Backing up bones'}
	<name> :obj_resetbones
	printf \{'Done backing up bones'}
	change structurename = <info_struct> part = <instrument_played>
	change structurename = <info_struct> playing = true
	<name> :settags instrument = <instrument_played> lightgroup = <lightgroup>
	if (<use_ingame_anims> = 0)
		band_member_start_anims {
			name = <name>
			instrument = none
		}
	endif
	<name> :obj_spawnscriptnow buildcasmodel params = {
		appearance = (<profile_struct>.appearance)
		async = <async>
		appearance_checksum = <appearance_checksum>
		buildscriptparams = {
			instrument = <cas_instrument>
			new_object = 1
			no_bone_copy = 1
			loading_into_song = <loading_into_song>
		}
	}
	if (<async> = 1)
		blockforscript \{buildcasmodel}
	endif
	fix_animation_struct_for_avatar object = <name> instrument = <instrument_played>
	if structurecontains structure = (<profile_struct>.appearance) model_scale
		<name> :obj_enablescaling
		<name> :obj_applyscaling scale = (<profile_struct>.appearance.model_scale)
	endif
	if ($g_cas_model_build_success = 1)
		if get_part_key_from_appearance key = particle_systems appearance = (<profile_struct>.appearance) part = cas_full_body_acc
			desc_id = ((<profile_struct>.appearance).cas_full_body_acc.desc_id)
			character_add_particle_systems {
				object_name = <name>
				particle_systems = <particle_systems>
				node_array_name = <node_array_name>
				desc_id = <desc_id>
			}
		elseif get_part_key_from_appearance key = particle_systems appearance = (<profile_struct>.appearance) part = cas_full_body
			desc_id = ((<profile_struct>.appearance).cas_full_body.desc_id)
			character_add_particle_systems {
				object_name = <name>
				particle_systems = <particle_systems>
				node_array_name = <node_array_name>
				desc_id = <desc_id>
			}
		endif
		if (<use_ingame_anims> = 0)
			<instrument_played> = none
		endif
		persistent_band_set_data {
			object = <name>
			player = <player>
			instrument = <instrument_played>
			savegame = <savegame>
			character_id = <id>
			appearance = (<profile_struct>.appearance)
			stored_character_index = <stored_character_index>
			microphone = <with_mic>
			building = 0
		}
		persistent_band_setup_new_character {
			name = <name>
			instrument = <instrument>
			player = <player>
		}
		if ((<instrument> = bass) || (<instrument> = guitar))
			<name> :curve_createstrings instrument = <instrument>
		endif
		<name> :obj_spawnscriptnow backup_light_cache_data
		create_band_member_unlock
		return \{true}
	else
		create_band_member_unlock
		return \{false}
	endif
endscript

script backup_light_cache_data 
	setscriptcannotpause
	begin
	wait \{4
		gameframes}
	if modelbuilder_backupnewobjectlightcache
		break
	endif
	printf \{'Waiting some more for valid light data'}
	repeat 30
endscript

script cas_get_lightgroup \{position = !q1768515945
		id = !q1768515945}
	getpakmancurrent \{map = zones}
	if (<pak> = z_viewer)
		return \{false}
	else
		switch <position>
			case drummer
			lightgroup = [band drummer combo]
			case bassist
			lightgroup = [band alt_band bassist combo]
			case guitarist
			lightgroup = [band alt_band guitarist combo]
			case vocalist
			lightgroup = [band alt_band vocalist combo]
			default
			lightgroup = [band alt_band combo]
		endswitch
		if <id> :getsingletag additional_light_group
			add_to_light_group {
				lightgroup = <lightgroup>
				additional_light_group = <additional_light_group>
			}
		endif
		return true lightgroup = <lightgroup>
	endif
endscript

script get_body_checksum_from_appearance \{appearance = 0x69696969}
	if structurecontains structure = <appearance> cas_body
		return body_checksum = ((<appearance>.cas_body).desc_id)
	endif
	if structurecontains structure = <appearance> cas_full_body
		return body_checksum = ((<appearance>.cas_full_body).desc_id)
	endif
	printstruct <appearance>
	scriptassert \{'Character has no body!'}
endscript

script get_is_female_from_appearance \{appearance = 0x69696969}
	if structurecontains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id)
	elseif structurecontains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
	else
		scriptassert \{'Appearance does not contain a CAS_Body or CAS_Full_Body!'}
	endif
	if gotparam \{desc_id}
		if (<desc_id> = avatar)
			if isavatarfemale avatar_meta_data = ((<appearance>.cas_full_body).avatar_meta_data)
				is_female = 1
			else
				is_female = 0
			endif
		endif
	endif
	if NOT gotparam \{is_female}
		if NOT gotparam \{dont_assert}
			scriptassert \{'Character has no body!'}
		endif
		getnullchecksum
		return false is_female = <nullchecksum>
	endif
	return true is_female = <is_female>
endscript

script get_is_fat_from_appearance \{appearance = 0x69696969}
	<is_fat> = 0
	if structurecontains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id)
	endif
	if structurecontains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
	endif
	return is_fat = <is_fat>
endscript

script get_is_female_from_character_id \{character_id = !q1768515945
		savegame = !i1768515945}
	if (<character_id> = none || <savegame> < 0)
		return \{false}
	endif
	characterprofilegetstruct name = <character_id> savegame = <savegame>
	if NOT gotparam \{profile_struct}
		return \{false}
	endif
	get_is_female_from_appearance appearance = (<profile_struct>.appearance)
	return true {is_female = <is_female>}
endscript

script get_is_lefty_from_appearance \{appearance = 0x69696969}
	if structurecontains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id)
	endif
	if structurecontains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
	endif
	if NOT gotparam \{lefty}
		return \{false
			lefty = 0}
	endif
	return true lefty = <lefty>
endscript

script get_has_large_hands_from_appearance \{appearance = 0x69696969}
	if structurecontains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id)
	endif
	if structurecontains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
	endif
	if NOT gotparam \{large_hands}
		return \{false
			large_hands = 0}
	endif
	return true large_hands = <large_hands>
endscript
g_create_band_member_lock = 0

script create_band_member_unlock 
	if ($g_create_band_member_lock = 0)
		scriptassert \{'Band member lock already off... Something wrong here'}
	endif
	change \{g_create_band_member_lock = 0}
endscript

script create_band_member_lock 
	if ($g_create_band_member_lock = 1)
		scriptassert \{'Band member lock left on... Something wrong here'}
	endif
	change \{g_create_band_member_lock = 1}
endscript

script destroy_band 
	printscriptinfo \{'destroy_band'}
	if ($in_tutorial_mode = 1)
		scriptassert \{'should not destroy band in tutorial mode'}
	endif
	cas_destroy_all_characters
	drummer_kill_spawnscripts
	vocalist_reset_globals
	autolook_kill_spawnscripts
	crowd_kill_spawnscripts
	band_stop_anims
	destroy_band_member \{name = musician1}
	destroy_band_member \{name = musician2}
	destroy_band_member \{name = musician3}
	destroy_band_member \{name = musician4}
	band_unload_anim_paks
endscript

script destroy_band_member 
	if compositeobjectexists name = <name>
		<name> :modelbuilder_backupnewobjectlightcache
		character_destroy_particle_systems object_name = <name>
		bandmanager_removecharacter name = <name>
		<name> :die
		flushdeadobjects
		cas_queue_external_destroy_object name = <name>
	endif
endscript

script kill_character_scripts 
	printf \{qs(0x2498acb7)}
	if compositeobjectexists \{name = musician1}
		musician1 :obj_switchscript \{emptyscript}
	endif
	if compositeobjectexists \{name = musician2}
		musician2 :obj_switchscript \{emptyscript}
	endif
	if compositeobjectexists \{name = musician3}
		musician3 :obj_switchscript \{emptyscript}
	endif
	if compositeobjectexists \{name = musician4}
		musician4 :obj_switchscript \{emptyscript}
	endif
endscript

script reset_facial_animations 
	if compositeobjectexists \{name = musician1}
		musician1 :obj_killspawnedscript \{name = facial_anim_loop}
		musician1 :obj_spawnscriptnow \{facial_anim_loop}
	endif
	if compositeobjectexists \{name = musician2}
		musician2 :obj_killspawnedscript \{name = facial_anim_loop}
		musician2 :obj_spawnscriptnow \{facial_anim_loop}
	endif
	if compositeobjectexists \{name = musician3}
		musician3 :obj_killspawnedscript \{name = facial_anim_loop}
		musician3 :obj_spawnscriptnow \{facial_anim_loop}
	endif
	if compositeobjectexists \{name = musician4}
		musician4 :obj_killspawnedscript \{name = facial_anim_loop}
		musician4 :obj_spawnscriptnow \{facial_anim_loop}
	endif
endscript

script add_to_light_group \{lightgroup = !a1768515945
		additional_light_group = !q1768515945}
	addarrayelement array = <lightgroup> element = <additional_light_group>
	return lightgroup = <array>
endscript

script fix_animation_struct_for_avatar \{object = !q1768515945
		instrument = !q1768515945}
	if compositeobjectexists name = <object>
		<object> :obj_getchecksumtag tag_name = body_checksum
		if (<checksum_value> = avatar)
			<object> :obj_getid
			extendcrc <objid> '_Info' out = info_struct
			<object> :obj_getintegertag tag_name = originally_is_female
			if ((<instrument> = drum) || (<integer_value> = 0))
				<object> :settags {is_female = 0}
				change structurename = <info_struct> anim_set = car_male_animations
				change structurename = <info_struct> anim_struct = car_male_anim_struct
				change structurename = <info_struct> finger_anims = guitarist_finger_anims_car_male
				change structurename = <info_struct> fret_anims = fret_anims_rocker
				change structurename = <info_struct> strum = car_male_normal
				change structurename = <info_struct> facial_anims = facial_anims_male_rocker
				change structurename = <info_struct> facial_anims_default = facial_anims_male_rocker
			else
				<object> :settags {is_female = 1}
				change structurename = <info_struct> anim_set = car_female_animations
				change structurename = <info_struct> anim_struct = car_female_anim_struct
				change structurename = <info_struct> finger_anims = guitarist_finger_anims_car_female
				change structurename = <info_struct> fret_anims = fret_anims_rocker
				change structurename = <info_struct> strum = car_female_normal
				change structurename = <info_struct> facial_anims = facial_anims_female_rocker
				change structurename = <info_struct> facial_anims_default = facial_anims_female_rocker
			endif
			bandmanager_updateallanimsets
		endif
	endif
endscript
