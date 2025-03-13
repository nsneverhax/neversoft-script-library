g_song_outro_anims_current_player = 1
g_song_outro_anims_initial_speed = 1.0
g_song_outro_anims_playing = 0

script song_outro_anims_add_helper 
endscript

script song_outro_anims_showing 
	<start_skip_id> = song_outro_anims_container
	if screenelementexists id = <start_skip_id>
		return \{true}
	endif
	return \{false}
endscript

script play_song_outro_anims 
	setpakmancurrent \{map = ui_paks
		pakname = 'song_breakdown'}
	change \{g_song_outro_anims_initial_speed = 1.0}
	change \{g_song_outro_anims_current_player = 1}
	change \{g_song_outro_anims_playing = 1}
	gamemode_gettype
	used_anim_camera_pairs = []
	createscreenelement \{parent = root_window
		id = song_outro_anims_container
		type = containerelement
		alpha = 1
		pos_anchor = [
			left
			top
		]
		just = [
			left
			top
		]
		pos = (0.0, 0.0)
		z_priority = 400
		dims = (100.0, 100.0)}
	spawnscriptnow \{song_outro_anims_add_helper}
	song_outro_determine_camera_cut_order
	getarraysize <order>
	getnumplayersingame \{on_screen}
	order_idx = 0
	begin
	getplayerinfo (<order> [<order_idx>].player_num) part
	node_part = <part>
	begin
	song_outro_get_random_animation_for_part part = <part>
	if NOT ((gotparam anim) || (gotparam anim_index))
		scriptassert \{qs(0x4ecdbc6c)}
	endif
	song_outro_get_random_camera_for_anim part = <part> anim_index = <anim_index>
	if NOT ((gotparam cam) || (gotparam cam_index) || (gotparam cam_initial_speed))
		scriptassert \{qs(0x0f075f55)}
	endif
	song_outro_anims_check_if_used anim_cam_pair_array = <used_anim_camera_pairs> anim_index = <anim_index> cam_index = <cam_index> part = <part>
	if (<is_used> = 0)
		if (<part> = bass)
			<part> = guitar
		endif
		addarrayelement array = <used_anim_camera_pairs> element = {anim = <anim_index> cam = <cam_index> part = <part>}
		<used_anim_camera_pairs> = <array>
		printstruct <anim_camera_pairs>
		break
	endif
	repeat
	if (<type> = career)
		getplayerinfo (<order> [<order_idx>].player_num) part
		persistent_band_get_musician_from_part part = <part>
		<band_member> = ($g_persistent_band_data [<index>].object)
	else
		getplayerinfo (<order> [<order_idx>].player_num) band_member
	endif
	if compositeobjectexists name = <band_member>
		extendcrc <band_member> '_Info' out = info_struct
		band_movetostartnode name = <band_member>
		band_changefacialanims name = <band_member>
		if (<anim> != none)
			spawnscriptnow \{audio_ui_gameplay_play_camera_win_sfx}
			bandmanager_changeik name = <band_member> enabled = false
			band_playsimpleanim {name = <band_member> anim = <anim> blendduration = 0.3}
			<band_member> :obj_teleport
			getpakmancurrent \{map = zones}
			if (<pak> = z_credits)
				node_names = {
					guitar = 'TRG_Geo_Camera_Performance_GUIT01'
					bass = 'TRG_Geo_Camera_Performance_BASS01'
					drum = 'TRG_Geo_Camera_Performance_DRUM01'
					vocals = 'TRG_Geo_Camera_Performance_SING01'
				}
				suffix = ('_' + (<node_names>.<node_part>))
				appendsuffixtochecksum base = <pak> suffixstring = <suffix>
				moment_cam_lock_target_01 :obj_locktoobject objectname = <appended_id>
			else
				getstartnodeid member = <band_member>
				getwaypointpos name = <waypoint_id>
				getwaypointquat name = <waypoint_id>
				moment_cam_lock_target_01 :obj_locktoobject \{off}
				moment_cam_lock_target_01 :obj_setposition position = <pos>
				moment_cam_lock_target_01 :obj_setorientation quat = <quat>
			endif
			change g_song_outro_anims_current_player = (<order> [<order_idx>].player_num)
			chain_part = slave
			band_setikchain name = <band_member> chain = <chain_part>
			change g_song_outro_anims_initial_speed = <cam_initial_speed>
			setslomo <cam_initial_speed>
			spawnscript \{songwon_fx}
			if song_outro_check_career_with_non_traditional_band
				cameracuts_setarrayprefix \{prefix = 'cameras_no_flyby'
					changenow}
			endif
			momentcamera_playanim_spawned name = moment_cam_lock_target_01 anim = <cam> tempoanim = <cam> cycle = 0 start = 0 blendduration = 0
		endif
	endif
	<order_idx> = (<order_idx> + 1)
	repeat <array_size>
	song_outro_anims_skip_anims \{start_skip_id = song_outro_anims_container}
endscript

script song_outro_check_career_with_non_traditional_band 
	gamemode_gettype
	if (<type> != career)
		printf \{qs(0xbace9b88)}
		return \{false}
	endif
	gamemode_gettype
	guitar = 0
	bass = 0
	drum = 0
	vocals = 0
	getnumplayersingame \{on_screen}
	if (<num_players_shown> > 0)
		getfirstplayer \{on_screen}
		begin
		getplayerinfo <player> part
		switch <part>
			case guitar
			guitar = (<guitar> + 1)
			case bass
			bass = (<bass> + 1)
			case drum
			drum = (<drum> + 1)
			case vocals
			vocals = (<vocals> + 1)
			default
			scriptassert \{qs(0x41a94b56)}
		endswitch
		if (<guitar> > 1 ||
				<bass> > 1 ||
				<drum> > 1 ||
				<vocals> > 1)
			printf \{qs(0x1fe5697f)}
			return \{true}
		endif
		getnextplayer on_screen player = <player>
		repeat <num_players_shown>
	endif
	printf \{qs(0x91e3c84b)}
	return \{false}
endscript

script song_outro_get_random_animation_for_part 
	requireparams \{[
			part
		]
		all}
	if (<part> = bass)
		<part> = guitar
	endif
	getarraysize (($song_outro_anims).<part>)
	if (<array_size> > 0)
		getrandomvalue a = 0 b = (<array_size> - 1) name = i integer
		return {
			anim = ((($song_outro_anims).<part>) [<i>].anim)
			anim_index = <i>
		}
	endif
endscript

script song_outro_get_random_camera_for_anim 
	requireparams \{[
			part
			anim_index
		]
		all}
	if (<part> = bass)
		<part> = guitar
	endif
	getarraysize ((($song_outro_anims).<part>) [<anim_index>].cameras)
	if (<array_size> > 0)
		getrandomvalue a = 0 b = (<array_size> - 1) name = i integer
		return {
			cam = ((((($song_outro_anims).<part>) [<anim_index>].cameras) [<i>]).camera)
			cam_initial_speed = ((((($song_outro_anims).<part>) [<anim_index>].cameras) [<i>]).initial_speed)
			cam_index = <i>
		}
	endif
endscript

script song_outro_anims_check_if_used 
	requireparams \{[
			anim_cam_pair_array
			anim_index
			cam_index
			part
		]}
	getarraysize <anim_cam_pair_array>
	if (<part> = bass)
		<part> = guitar
	endif
	if (<array_size> > 0)
		i = 0
		begin
		if (<anim_cam_pair_array> [<i>].part = <part>)
			if ((<anim_cam_pair_array> [<i>].anim = <anim_index>))
				return \{is_used = 1}
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return \{is_used = 0}
endscript

script song_outro_determine_camera_cut_order 
	gamemode_gettype
	player_order = []
	if ((<type> = career) || (<type> = quickplay))
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			get_percent_notes_hit player_index = <player> use_player_info = 0
			addarrayelement {
				array = <player_order>
				element = {
					player_num = <player>
					percent_notes_hit = <percent_notes_hit>
				}
			}
			<player_order> = <array>
			getnextplayer player = <player>
			repeat <num_players>
			getarraysize <player_order>
			if (<array_size> > 1)
				begin
				<i> = 0
				begin
				left_accuracy = (<player_order> [<i>].percent_notes_hit)
				right_accuracy = (<player_order> [(<i> + 1)].percent_notes_hit)
				if (<right_accuracy> > <left_accuracy>)
					left_score_band_idx = (<player_order> [<i>])
					setarrayelement arrayname = player_order index = <i> newvalue = (<player_order> [(<i> + 1)])
					setarrayelement arrayname = player_order index = (<i> + 1) newvalue = <left_score_band_idx>
				endif
				<i> = (<i> + 1)
				repeat (<array_size> - 1)
				repeat <array_size>
			endif
		endif
	else
		song_breakdown_competitive_determine_order_from_score
		getarraysize <order>
		if (<array_size> > 0)
			getnumplayersingame \{on_screen}
			if (<num_players_shown> > 0)
				getfirstplayer \{on_screen}
				begin
				getplayerinfo <player> band
				if (<band> = (<order> [0].band_num))
					addarrayelement {
						array = player_order
						element = {
							player_num = <player>
						}
					}
					<player_order> = <array>
				endif
				getnextplayer on_screen player = <player>
				repeat <num_players_shown>
			endif
		endif
	endif
	return order = <player_order>
endscript

script song_outro_anims_display_stats 
	requireparams \{[
			parent
			stats_display_secs
			slomo_speed
		]
		all}
	killspawnedscript \{name = song_outro_anims_display_stats_spawned}
	spawnscriptnow song_outro_anims_display_stats_spawned params = {parent = <parent> stats_display_secs = <stats_display_secs> slomo_speed = <slomo_speed>}
endscript

script song_outro_anims_display_stats_spawned \{parent = !q1768515945
		stats_display_secs = !f1768515945
		slomo_speed = !f1768515945}
	<player> = ($g_song_outro_anims_current_player)
	ui_song_breakdown_get_player_display_name player_index = <player>
	<name_text> = <player_name_text>
	getplayerinfo <player> part
	getplayerinfo <player> difficulty
	<percent_alpha> = 1
	<percent_stacker_pos> = (5.0, -97.0)
	get_percent_notes_hit player_index = <player> use_player_info = 0
	if NOT (<part> = vocals)
		getplayerinfo <player> best_run
		formattext textname = percent_text qs(0x581d2af2) p = <percent_notes_hit>
		formattext textname = streak_text qs(0x8c5c152d) n = <best_run> decimalplaces = 0
		formattext \{textname = streak_unit_text
			qs(0x6036c2d7)}
	else
		getplayerinfo <player> vocal_streak_phrases
		getplayerinfo <player> vocal_phrase_max_qual
		if (<vocal_phrase_max_qual> > 0)
			formattext textname = percent_text qs(0x581d2af2) p = <percent_notes_hit> decimalplaces = 0
			formattext textname = streak_text qs(0x8c5c152d) n = <vocal_streak_phrases> decimalplaces = 0
		else
			<percent_text> = qs(0x6a5cf46c)
			<percent_alpha> = 0
			<percent_stacker_pos> = (30.0, -97.0)
			<streak_text> = qs(0x6a5cf46c)
		endif
		formattext \{textname = streak_unit_text
			qs(0x4ac2a4de)}
	endif
	switch <part>
		case guitar
		<icon_texture> = icon_guitar_fill
		case bass
		<icon_texture> = icon_bass_fill
		case drum
		<icon_texture> = icon_drum_fill
		case vocals
		<icon_texture> = icon_vocals_fill
	endswitch
	switch <difficulty>
		case beginner
		<diff_texture> = icon_difficulty_beginner
		case easy
		<diff_texture> = icon_difficulty_easy
		case medium
		<diff_texture> = icon_difficulty_medium
		case hard
		<diff_texture> = icon_difficulty_hard
		case expert
		<diff_texture> = icon_difficulty_expert
		if (<part> = drum)
			getplayerinfo <player> double_kick_drum
			if (<double_kick_drum> = 1)
				<diff_texture> = icon_difficulty_expert_plus
			endif
		endif
	endswitch
	if screenelementexists id = <parent>
		setslomo <slomo_speed>
		createscreenelement {
			parent = <parent>
			type = descinterface
			desc = 'song_outro_anim_stats'
			pos_anchor = [left , top]
			just = [left , top]
			pos = (-300.0, 130.0)
			alpha = 1
			player_name_text = <name_text>
			note_percentage_text = <percent_text>
			note_streak_text = <streak_text>
			streak_unit_text_text = <streak_unit_text>
			instrument_icon_texture = <icon_texture>
			difficulty_icon_texture = <diff_texture>
			percent_alpha = <percent_alpha>
			percent_stacker_pos = <percent_stacker_pos>
			targeted_challenge_alpha = 0.0
			z_priority = 400
			frame_effects_alpha = 0.0
		}
		<stats_desc_id> = <id>
		<is_targeting_challenge> = 0
		gamemode_gettype
		if (<type> = quickplay)
			if <stats_desc_id> :desc_resolvealias name = alias_hud_meter_challenge param = challenge_meter_id
				if gman_goalisactive \{goal = quickplay}
					gman_getdata \{goal = quickplay
						name = targeted_challenge}
					gman_getdata \{goal = quickplay
						name = targeted_challenge_inst_config}
					getplayerinfo <player> part
					if (<targeted_challenge> != null && ((<targeted_challenge_inst_config> = <part>) || (<targeted_challenge_inst_config> = band) || (<targeted_challenge_inst_config> = traditional_band)))
						if NOT <challenge_meter_id> :desc_resolvealias name = alias_challenge_led_container param = led_container
							scriptassert \{'Assert'}
						endif
						<dx> = (360.0 / ($challange_meter_num_ticks))
						<degree> = 0
						<cnt> = 0
						begin
						createscreenelement {
							type = spriteelement
							parent = <led_container>
							alpha = 0.0
							pos_anchor = [center center]
							rot_angle = <degree>
							pos = (0.0, 0.0)
							texture = meter_challenge_led
						}
						<degree> = (<degree> + <dx>)
						<cnt> = (<cnt> + 1)
						repeat ($challange_meter_num_ticks)
						extendcrc <targeted_challenge> '_info' out = targeted_challenge_info
						if ((<targeted_challenge_inst_config> = band) || (<targeted_challenge_inst_config> = traditional_band))
							formattext checksumname = player_challenge_id '%n' n = ($<targeted_challenge_info>.name)
						else
							formattext checksumname = player_challenge_id '%n_p%p' n = ($<targeted_challenge_info>.name) p = <player>
						endif
						if gman_goalisactive goal = <player_challenge_id>
							<is_targeting_challenge> = 1
							if challenge_is_band_subtype goal_id = <player_challenge_id>
								gman_getdata goal = <player_challenge_id> name = current_progress
								gman_getdata goal = <player_challenge_id> name = calculated_targets
							else
								gman_getdata goal = <player_challenge_id> player = <player> name = current_progress
								gman_getdata goal = <player_challenge_id> player = <player> name = calculated_targets
							endif
							getarraysize <calculated_targets>
							if (<array_size> != 3)
								scriptassert 'Incorrect number of challenge levels for challenge %t' t = <targeted_challenge>
							endif
							gman_getdata \{goal = quickplay
								name = targeted_challenge_friend_scores}
							gman_getdata \{goal = quickplay
								name = targeted_challenge_friend_index}
							<is_targeting_friend> = 0
							<friend_params> = {}
							if (<targeted_challenge_friend_index> >= 0)
								<is_targeting_friend> = 1
							endif
							song_breakdown_get_highest_completed_challenge_level {
								gold_level = ((<calculated_targets> [0]) * 1.0)
								platinum_level = ((<calculated_targets> [1]) * 1.0)
								diamond_level = ((<calculated_targets> [2]) * 1.0)
								current_progress = (<current_progress> * 1.0)
								is_targeting_friend = <is_targeting_friend>
								player_challenge_id = <player_challenge_id>
							}
							if (<current_progress> > 0)
								<id> :se_setprops frame_effects_alpha = 1.0
							endif
							<targeted_challenge_props> = {}
							if (<is_targeting_friend> = 1)
								<friend_params> = {
									use_friend_target = 1
									friend_level = 0
									friend_name = qs(0x03ac90f0)
								}
								if (<current_progress> > (<targeted_challenge_friend_scores> [<targeted_challenge_friend_index>].score))
									formattext \{textname = player_top_text
										qs(0x7adaa795)}
								elseif (<current_progress> < (<targeted_challenge_friend_scores> [<targeted_challenge_friend_index>].score))
									formattext \{textname = player_top_text
										qs(0x22b394fa)}
								else
									formattext \{textname = player_top_text
										qs(0xcc4d56fc)}
								endif
								formattext textname = player_mid_text qs(0x5d9eae64) g = (<targeted_challenge_friend_scores> [<targeted_challenge_friend_index>].gamer_tag)
								addparam structure_name = targeted_challenge_props name = player_top_text value = <player_top_text>
								addparam structure_name = targeted_challenge_props name = player_mid_text value = <player_mid_text>
								addparam \{structure_name = targeted_challenge_props
									name = player_bottom_alpha
									value = 0.0}
							else
								getarraysize <targeted_challenge_friend_scores>
								if (<array_size> > 0)
									song_outro_anims_find_self_within_friend_scores {
										current_progress = <current_progress>
										targeted_challenge_friend_scores = <targeted_challenge_friend_scores>
									}
									if (<above_friend_index> = -1)
										formattext textname = player_mid_text qs(0x843e4550) g = <name_text>
										formattext textname = player_bottom_text qs(0x5d4bacd3) g = (<targeted_challenge_friend_scores> [<below_friend_index>].gamer_tag)
										addparam \{structure_name = targeted_challenge_props
											name = player_top_alpha
											value = 0.0}
										addparam structure_name = targeted_challenge_props name = player_mid_text value = <player_mid_text>
										addparam structure_name = targeted_challenge_props name = player_bottom_text value = <player_bottom_text>
									elseif (<below_friend_index> = -1)
										song_outro_anim_stats_get_rank_text rank = (<above_friend_index> + 1)
										formattext textname = player_top_text qs(0xe1886eaa) r = <rank_text> g = (<targeted_challenge_friend_scores> [<above_friend_index>].gamer_tag)
										song_outro_anim_stats_get_rank_text rank = (<self_index> + 1)
										formattext textname = player_mid_text qs(0xe1886eaa) r = <rank_text> g = <name_text>
										addparam structure_name = targeted_challenge_props name = player_top_text value = <player_top_text>
										addparam structure_name = targeted_challenge_props name = player_mid_text value = <player_mid_text>
										addparam \{structure_name = targeted_challenge_props
											name = player_bottom_alpha
											value = 0.0}
									else
										song_outro_anim_stats_get_rank_text rank = (<above_friend_index> + 1)
										formattext textname = player_top_text qs(0xe1886eaa) r = <rank_text> g = (<targeted_challenge_friend_scores> [<above_friend_index>].gamer_tag)
										song_outro_anim_stats_get_rank_text rank = (<self_index> + 1)
										formattext textname = player_mid_text qs(0xe1886eaa) r = <rank_text> g = <name_text>
										song_outro_anim_stats_get_rank_text rank = (<below_friend_index> + 1)
										formattext textname = player_bottom_text qs(0xe1886eaa) r = <rank_text> g = (<targeted_challenge_friend_scores> [<below_friend_index>].gamer_tag)
										addparam structure_name = targeted_challenge_props name = player_top_text value = <player_top_text>
										addparam structure_name = targeted_challenge_props name = player_mid_text value = <player_mid_text>
										addparam structure_name = targeted_challenge_props name = player_bottom_text value = <player_bottom_text>
									endif
								else
									addparam \{structure_name = targeted_challenge_props
										name = player_top_alpha
										value = 0.0}
									addparam \{structure_name = targeted_challenge_props
										name = player_mid_alpha
										value = 0.0}
									addparam \{structure_name = targeted_challenge_props
										name = player_bottom_alpha
										value = 0.0}
									addparam \{structure_name = targeted_challenge_props
										name = players_list_bg_alpha
										value = 0.0}
									addparam \{structure_name = targeted_challenge_props
										name = challenge_meter_container_pos
										value = (14.0, 135.0)}
								endif
							endif
							if gman_ispowerscoreenabled
								if (<is_targeting_friend> = 0)
									<highest_completed> = 0
								endif
							endif
							fill_challenge_meter_to {
								percent = <percent_to_next>
								player = <player>
								level = <highest_completed>
								challenge_meter_id = <challenge_meter_id>
								<friend_params>
							}
							quickplay_get_challenge_icon base_name = <targeted_challenge>
							<challenge_meter_id> :se_setprops challenge_icon_texture = <icon_name> challenge_icon_alpha = 1.0
							<stats_desc_id> :se_setprops {
								alpha = 1
								targeted_challenge_alpha = 1.0
								<targeted_challenge_props>
							}
						endif
					endif
				endif
			endif
		endif
		if (<is_targeting_challenge> = 1)
			<flyby_pos> = (-10.0, -10.0)
		else
			<flyby_pos> = (-10.0, 50.0)
		endif
		<stats_desc_id> :se_setprops {
			pos = <flyby_pos>
			alpha = 1
			time = 0.2
			anim = ease_out
		}
	endif
	wait <stats_display_secs> seconds ignoreslomo
	if screenelementexists id = <stats_desc_id>
		destroyscreenelement id = <stats_desc_id>
	endif
	setslomo ($g_song_outro_anims_initial_speed)
endscript

script song_outro_anims_skip_anims 
	if ui_event_exists_in_stack \{above = 'gameplay'
			name = 'controller_disconnect'}
		printf \{'disconnect dialog is up!'}
		return
	endif
	if screenelementexists id = <start_skip_id>
		destroyscreenelement id = <start_skip_id>
	endif
	killspawnedscript \{name = song_outro_anims_add_helper}
	clean_up_user_control_helpers
	change \{g_song_outro_anims_initial_speed = 1.0}
	setslomo ($g_song_outro_anims_initial_speed)
	change \{g_song_outro_anims_playing = 0}
	cameracuts_setarrayprefix \{prefix = 'cameras_no_band'
		length = 5
		changenow
		extra_params = {
			force_time = 5
		}
		play_hold = 1}
	spawnscriptnow \{switch_off_cameracuts_delayed}
	restore_idle_faces
	spawnscriptnow \{id = not_transitions
		transition_killall}
endscript

script song_outro_anims_find_self_within_friend_scores \{current_progress = !i1768515945
		targeted_challenge_friend_scores = !a1768515945}
	<above_friend_index> = -1
	<below_friend_index> = -1
	<self_index> = -1
	getarraysize <targeted_challenge_friend_scores>
	if (<array_size> > 0)
		<i> = 0
		begin
		if ((<targeted_challenge_friend_scores> [<i>].score) <= <current_progress>)
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	<self_index> = <i>
	if (<i> = <array_size>)
		<above_friend_index> = (<i> - 1)
	elseif (<i> = 0)
		<below_friend_index> = (<i> + 1)
	else
		<above_friend_index> = (<i> - 1)
		<below_friend_index> = (<i> + 1)
	endif
	if ((<above_friend_index> = -1) && (<below_friend_index> = -1))
		scriptassert \{'Could not find ranking amongst friends!'}
	endif
	return {
		self_index = <self_index>
		above_friend_index = <above_friend_index>
		below_friend_index = <below_friend_index>
	}
endscript

script song_outro_anim_stats_get_rank_text \{rank = !i1768515945}
	if (<rank> = 1)
		<rank_text> = qs(0xb3c239d4)
	elseif (<rank> = 2)
		<rank_text> = qs(0xdde7d669)
	elseif (<rank> = 3)
		<rank_text> = qs(0x0c74edeb)
	else
		formattext textname = rank_text qs(0x4dc9c452) i = (<above_friend_index> + 1)
	endif
	return rank_text = <rank_text>
endscript

script switch_off_cameracuts_delayed 
	wait \{2
		gameframes}
	cameracuts_enablechangecam \{enable = false}
endscript

script restore_idle_faces 
	i = 1
	begin
	formattext checksumname = musician 'musician%a' a = <i>
	formattext checksumname = info_struct 'musician%a_info' a = <i>
	fa_anims = ($<info_struct>.facial_anims_default)
	change structurename = <info_struct> facial_anims = <fa_anims>
	if compositeobjectexists name = <musician>
		<musician> :obj_killspawnedscript name = facial_anim_loop
		<musician> :obj_spawnscriptnow facial_anim_loop
	endif
	i = (<i> + 1)
	repeat 4
endscript
