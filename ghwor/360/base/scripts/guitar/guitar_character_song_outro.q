g_song_outro_anims_current_player = 1
g_song_outro_anims_initial_speed = 1.0
g_song_outro_anims_playing = 0

script song_outro_anims_add_helper 
	<start_skip_id> = song_outro_anims_container
	if ScreenElementExists id = <start_skip_id>
		if NOT ininternetmode
			kill_start_key_binding
			begin
			if NOT ui_event_exists_in_stack \{Name = 'memcard'}
				if ($g_memcard_ingame_is_paused = 0)
					break
				endif
			endif
			Wait \{1
				gameframe}
			printf \{'song_outro_anims_add_helper - waiting for autosave to finish'}
			repeat
			if ScreenElementExists id = <start_skip_id>
				<start_skip_id> :se_setprops {
					event_handlers = [
						{pad_start song_outro_anims_skip_anims params = {start_skip_id = <start_skip_id>}}
						{pad_choose nullscript}
					]
					replace_handlers
				}
				LaunchEvent Type = focus target = <start_skip_id>
				clean_up_user_control_helpers
				add_user_control_helper \{text = qs(0x784c64ff)
					button = start
					z = 100000}
			endif
		endif
	endif
endscript

script song_outro_anims_showing 
	<start_skip_id> = song_outro_anims_container
	if ScreenElementExists id = <start_skip_id>
		return \{true}
	endif
	return \{FALSE}
endscript

script play_song_outro_anims 
	SetPakManCurrent \{map = ui_paks
		pakname = 'song_breakdown'}
	Change \{g_song_outro_anims_initial_speed = 1.0}
	Change \{g_song_outro_anims_current_player = 1}
	Change \{g_song_outro_anims_playing = 1}
	gamemode_gettype
	used_anim_camera_pairs = []
	CreateScreenElement \{parent = root_window
		id = song_outro_anims_container
		Type = ContainerElement
		alpha = 1
		pos_anchor = [
			left
			top
		]
		just = [
			left
			top
		]
		Pos = (0.0, 0.0)
		z_priority = 400
		dims = (100.0, 100.0)}
	SpawnScriptNow \{song_outro_anims_add_helper}
	song_outro_determine_camera_cut_order
	GetArraySize <order>
	getnumplayersingame \{on_screen}
	order_idx = 0
	begin
	getplayerinfo (<order> [<order_idx>].player_num) part
	node_part = <part>
	begin
	song_outro_get_random_animation_for_part part = <part>
	if NOT ((GotParam anim) || (GotParam anim_index))
		ScriptAssert \{qs(0x4ecdbc6c)}
	endif
	song_outro_get_random_camera_for_anim part = <part> anim_index = <anim_index>
	if NOT ((GotParam cam) || (GotParam cam_index) || (GotParam cam_initial_speed))
		ScriptAssert \{qs(0x0f075f55)}
	endif
	song_outro_anims_check_if_used anim_cam_pair_array = <used_anim_camera_pairs> anim_index = <anim_index> cam_index = <cam_index> part = <part>
	if (<is_used> = 0)
		if (<part> = bass)
			<part> = guitar
		endif
		AddArrayElement array = <used_anim_camera_pairs> element = {anim = <anim_index> cam = <cam_index> part = <part>}
		<used_anim_camera_pairs> = <array>
		printstruct <anim_camera_pairs>
		break
	endif
	repeat
	if (<Type> = career)
		getplayerinfo (<order> [<order_idx>].player_num) part
		persistent_band_get_musician_from_part part = <part>
		<band_member> = ($g_persistent_band_data [<index>].object)
	else
		getplayerinfo (<order> [<order_idx>].player_num) band_member
	endif
	if CompositeObjectExists Name = <band_member>
		ExtendCrc <band_member> '_Info' out = info_struct
		band_movetostartnode Name = <band_member>
		band_changefacialanims Name = <band_member>
		if (<anim> != None)
			SpawnScriptNow \{audio_ui_gameplay_play_camera_win_sfx}
			bandmanager_changeik Name = <band_member> Enabled = FALSE
			Band_PlaySimpleAnim {Name = <band_member> anim = <anim> BlendDuration = 0.3}
			<band_member> :obj_teleport
			GetPakManCurrent \{map = zones}
			if (<pak> = z_credits)
				node_names = {
					guitar = 'TRG_Geo_Camera_Performance_GUIT01'
					bass = 'TRG_Geo_Camera_Performance_BASS01'
					drum = 'TRG_Geo_Camera_Performance_DRUM01'
					vocals = 'TRG_Geo_Camera_Performance_SING01'
				}
				suffix = ('_' + (<node_names>.<node_part>))
				AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
				moment_cam_lock_target_01 :Obj_LockToObject objectName = <appended_id>
			else
				getstartnodeid member = <band_member>
				GetWaypointPos Name = <waypoint_id>
				getwaypointquat Name = <waypoint_id>
				moment_cam_lock_target_01 :Obj_LockToObject \{OFF}
				moment_cam_lock_target_01 :Obj_SetPosition position = <Pos>
				moment_cam_lock_target_01 :Obj_SetOrientation Quat = <Quat>
			endif
			Change g_song_outro_anims_current_player = (<order> [<order_idx>].player_num)
			chain_part = slave
			band_setikchain Name = <band_member> Chain = <chain_part>
			Change g_song_outro_anims_initial_speed = <cam_initial_speed>
			setslomo <cam_initial_speed>
			spawnscript \{songwon_fx}
			if song_outro_check_career_with_non_traditional_band
				CameraCuts_SetArrayPrefix \{prefix = 'cameras_no_flyby'
					changenow}
			endif
			momentcamera_playanim_spawned Name = moment_cam_lock_target_01 anim = <cam> tempoanim = <cam> cycle = 0 start = 0 BlendDuration = 0
		endif
	endif
	<order_idx> = (<order_idx> + 1)
	repeat <array_Size>
	song_outro_anims_skip_anims \{start_skip_id = song_outro_anims_container}
endscript

script song_outro_check_career_with_non_traditional_band 
	gamemode_gettype
	if (<Type> != career)
		printf \{qs(0xbace9b88)}
		return \{FALSE}
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
		getplayerinfo <Player> part
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
			ScriptAssert \{qs(0x41a94b56)}
		endswitch
		if (<guitar> > 1 ||
				<bass> > 1 ||
				<drum> > 1 ||
				<vocals> > 1)
			printf \{qs(0x1fe5697f)}
			return \{true}
		endif
		getnextplayer on_screen Player = <Player>
		repeat <num_players_shown>
	endif
	printf \{qs(0x91e3c84b)}
	return \{FALSE}
endscript

script song_outro_get_random_animation_for_part 
	RequireParams \{[
			part
		]
		all}
	if (<part> = bass)
		<part> = guitar
	endif
	GetArraySize (($song_outro_anims).<part>)
	if (<array_Size> > 0)
		GetRandomValue a = 0 b = (<array_Size> - 1) Name = i integer
		return {
			anim = ((($song_outro_anims).<part>) [<i>].anim)
			anim_index = <i>
		}
	endif
endscript

script song_outro_get_random_camera_for_anim 
	RequireParams \{[
			part
			anim_index
		]
		all}
	if (<part> = bass)
		<part> = guitar
	endif
	GetArraySize ((($song_outro_anims).<part>) [<anim_index>].cameras)
	if (<array_Size> > 0)
		GetRandomValue a = 0 b = (<array_Size> - 1) Name = i integer
		return {
			cam = ((((($song_outro_anims).<part>) [<anim_index>].cameras) [<i>]).Camera)
			cam_initial_speed = ((((($song_outro_anims).<part>) [<anim_index>].cameras) [<i>]).initial_speed)
			cam_index = <i>
		}
	endif
endscript

script song_outro_anims_check_if_used 
	RequireParams \{[
			anim_cam_pair_array
			anim_index
			cam_index
			part
		]}
	GetArraySize <anim_cam_pair_array>
	if (<part> = bass)
		<part> = guitar
	endif
	if (<array_Size> > 0)
		i = 0
		begin
		if (<anim_cam_pair_array> [<i>].part = <part>)
			if ((<anim_cam_pair_array> [<i>].anim = <anim_index>))
				return \{is_used = 1}
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	return \{is_used = 0}
endscript

script song_outro_determine_camera_cut_order 
	gamemode_gettype
	player_order = []
	if ((<Type> = career) || (<Type> = quickplay))
		getnumplayersingame
		if (<num_players> > 0)
			getfirstplayer
			begin
			get_percent_notes_hit player_index = <Player> use_player_info = 0
			AddArrayElement {
				array = <player_order>
				element = {
					player_num = <Player>
					percent_notes_hit = <percent_notes_hit>
				}
			}
			<player_order> = <array>
			getnextplayer Player = <Player>
			repeat <num_players>
			GetArraySize <player_order>
			if (<array_Size> > 1)
				begin
				<i> = 0
				begin
				left_accuracy = (<player_order> [<i>].percent_notes_hit)
				right_accuracy = (<player_order> [(<i> + 1)].percent_notes_hit)
				if (<right_accuracy> > <left_accuracy>)
					left_score_band_idx = (<player_order> [<i>])
					SetArrayElement ArrayName = player_order index = <i> NewValue = (<player_order> [(<i> + 1)])
					SetArrayElement ArrayName = player_order index = (<i> + 1) NewValue = <left_score_band_idx>
				endif
				<i> = (<i> + 1)
				repeat (<array_Size> - 1)
				repeat <array_Size>
			endif
		endif
	else
		song_breakdown_competitive_determine_order_from_score
		GetArraySize <order>
		if (<array_Size> > 0)
			getnumplayersingame \{on_screen}
			if (<num_players_shown> > 0)
				getfirstplayer \{on_screen}
				begin
				getplayerinfo <Player> Band
				if (<Band> = (<order> [0].band_num))
					AddArrayElement {
						array = player_order
						element = {
							player_num = <Player>
						}
					}
					<player_order> = <array>
				endif
				getnextplayer on_screen Player = <Player>
				repeat <num_players_shown>
			endif
		endif
	endif
	return order = <player_order>
endscript

script song_outro_anims_display_stats 
	RequireParams \{[
			parent
			stats_display_secs
			slomo_speed
		]
		all}
	KillSpawnedScript \{Name = song_outro_anims_display_stats_spawned}
	SpawnScriptNow song_outro_anims_display_stats_spawned params = {parent = <parent> stats_display_secs = <stats_display_secs> slomo_speed = <slomo_speed>}
endscript

script song_outro_anims_display_stats_spawned \{parent = !q1768515945
		stats_display_secs = !f1768515945
		slomo_speed = !f1768515945}
	<Player> = ($g_song_outro_anims_current_player)
	ui_song_breakdown_get_player_display_name player_index = <Player>
	<name_text> = <player_name_text>
	getplayerinfo <Player> part
	getplayerinfo <Player> difficulty
	<percent_alpha> = 1
	<percent_stacker_pos> = (5.0, -97.0)
	get_percent_notes_hit player_index = <Player> use_player_info = 0
	if NOT (<part> = vocals)
		getplayerinfo <Player> best_run
		formatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit>
		formatText TextName = streak_text qs(0x8c5c152d) n = <best_run> DecimalPlaces = 0
		formatText \{TextName = streak_unit_text
			qs(0x6036c2d7)}
	else
		getplayerinfo <Player> vocal_streak_phrases
		getplayerinfo <Player> vocal_phrase_max_qual
		if (<vocal_phrase_max_qual> > 0)
			formatText TextName = percent_text qs(0x581d2af2) p = <percent_notes_hit> DecimalPlaces = 0
			formatText TextName = streak_text qs(0x8c5c152d) n = <vocal_streak_phrases> DecimalPlaces = 0
		else
			<percent_text> = qs(0x6a5cf46c)
			<percent_alpha> = 0
			<percent_stacker_pos> = (30.0, -97.0)
			<streak_text> = qs(0x6a5cf46c)
		endif
		formatText \{TextName = streak_unit_text
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
			getplayerinfo <Player> double_kick_drum
			if (<double_kick_drum> = 1)
				<diff_texture> = icon_difficulty_expert_plus
			endif
		endif
	endswitch
	if ScreenElementExists id = <parent>
		setslomo <slomo_speed>
		CreateScreenElement {
			parent = <parent>
			Type = descinterface
			desc = 'song_outro_anim_stats'
			pos_anchor = [left , top]
			just = [left , top]
			Pos = (-300.0, 130.0)
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
		if (<Type> = quickplay)
			if <stats_desc_id> :desc_resolvealias Name = alias_hud_meter_challenge param = challenge_meter_id
				if GMan_GoalIsActive \{goal = quickplay}
					gman_getdata \{goal = quickplay
						Name = targeted_challenge}
					gman_getdata \{goal = quickplay
						Name = targeted_challenge_inst_config}
					getplayerinfo <Player> part
					if (<targeted_challenge> != NULL && ((<targeted_challenge_inst_config> = <part>) || (<targeted_challenge_inst_config> = Band) || (<targeted_challenge_inst_config> = traditional_band)))
						if NOT <challenge_meter_id> :desc_resolvealias Name = alias_challenge_led_container param = led_container
							ScriptAssert \{'Assert'}
						endif
						<dx> = (360.0 / ($challange_meter_num_ticks))
						<degree> = 0
						<cnt> = 0
						begin
						CreateScreenElement {
							Type = SpriteElement
							parent = <led_container>
							alpha = 0.0
							pos_anchor = [center center]
							rot_angle = <degree>
							Pos = (0.0, 0.0)
							texture = meter_challenge_led
						}
						<degree> = (<degree> + <dx>)
						<cnt> = (<cnt> + 1)
						repeat ($challange_meter_num_ticks)
						ExtendCrc <targeted_challenge> '_info' out = targeted_challenge_info
						if ((<targeted_challenge_inst_config> = Band) || (<targeted_challenge_inst_config> = traditional_band))
							formatText checksumName = player_challenge_id '%n' n = ($<targeted_challenge_info>.Name)
						else
							formatText checksumName = player_challenge_id '%n_p%p' n = ($<targeted_challenge_info>.Name) p = <Player>
						endif
						if GMan_GoalIsActive goal = <player_challenge_id>
							<is_targeting_challenge> = 1
							if challenge_is_band_subtype goal_id = <player_challenge_id>
								gman_getdata goal = <player_challenge_id> Name = current_progress
								gman_getdata goal = <player_challenge_id> Name = calculated_targets
							else
								gman_getdata goal = <player_challenge_id> Player = <Player> Name = current_progress
								gman_getdata goal = <player_challenge_id> Player = <Player> Name = calculated_targets
							endif
							GetArraySize <calculated_targets>
							if (<array_Size> != 3)
								ScriptAssert 'Incorrect number of challenge levels for challenge %t' t = <targeted_challenge>
							endif
							gman_getdata \{goal = quickplay
								Name = targeted_challenge_friend_scores}
							gman_getdata \{goal = quickplay
								Name = targeted_challenge_friend_index}
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
									formatText \{TextName = player_top_text
										qs(0x7adaa795)}
								elseif (<current_progress> < (<targeted_challenge_friend_scores> [<targeted_challenge_friend_index>].score))
									formatText \{TextName = player_top_text
										qs(0x22b394fa)}
								else
									formatText \{TextName = player_top_text
										qs(0xcc4d56fc)}
								endif
								formatText TextName = player_mid_text qs(0x5d9eae64) g = (<targeted_challenge_friend_scores> [<targeted_challenge_friend_index>].gamer_tag)
								AddParam structure_name = targeted_challenge_props Name = player_top_text value = <player_top_text>
								AddParam structure_name = targeted_challenge_props Name = player_mid_text value = <player_mid_text>
								AddParam \{structure_name = targeted_challenge_props
									Name = player_bottom_alpha
									value = 0.0}
							else
								GetArraySize <targeted_challenge_friend_scores>
								if (<array_Size> > 0)
									song_outro_anims_find_self_within_friend_scores {
										current_progress = <current_progress>
										targeted_challenge_friend_scores = <targeted_challenge_friend_scores>
									}
									if (<above_friend_index> = -1)
										formatText TextName = player_mid_text qs(0x843e4550) g = <name_text>
										formatText TextName = player_bottom_text qs(0x5d4bacd3) g = (<targeted_challenge_friend_scores> [<below_friend_index>].gamer_tag)
										AddParam \{structure_name = targeted_challenge_props
											Name = player_top_alpha
											value = 0.0}
										AddParam structure_name = targeted_challenge_props Name = player_mid_text value = <player_mid_text>
										AddParam structure_name = targeted_challenge_props Name = player_bottom_text value = <player_bottom_text>
									elseif (<below_friend_index> = -1)
										song_outro_anim_stats_get_rank_text rank = (<above_friend_index> + 1)
										formatText TextName = player_top_text qs(0xe1886eaa) r = <rank_text> g = (<targeted_challenge_friend_scores> [<above_friend_index>].gamer_tag)
										song_outro_anim_stats_get_rank_text rank = (<self_index> + 1)
										formatText TextName = player_mid_text qs(0xe1886eaa) r = <rank_text> g = <name_text>
										AddParam structure_name = targeted_challenge_props Name = player_top_text value = <player_top_text>
										AddParam structure_name = targeted_challenge_props Name = player_mid_text value = <player_mid_text>
										AddParam \{structure_name = targeted_challenge_props
											Name = player_bottom_alpha
											value = 0.0}
									else
										song_outro_anim_stats_get_rank_text rank = (<above_friend_index> + 1)
										formatText TextName = player_top_text qs(0xe1886eaa) r = <rank_text> g = (<targeted_challenge_friend_scores> [<above_friend_index>].gamer_tag)
										song_outro_anim_stats_get_rank_text rank = (<self_index> + 1)
										formatText TextName = player_mid_text qs(0xe1886eaa) r = <rank_text> g = <name_text>
										song_outro_anim_stats_get_rank_text rank = (<below_friend_index> + 1)
										formatText TextName = player_bottom_text qs(0xe1886eaa) r = <rank_text> g = (<targeted_challenge_friend_scores> [<below_friend_index>].gamer_tag)
										AddParam structure_name = targeted_challenge_props Name = player_top_text value = <player_top_text>
										AddParam structure_name = targeted_challenge_props Name = player_mid_text value = <player_mid_text>
										AddParam structure_name = targeted_challenge_props Name = player_bottom_text value = <player_bottom_text>
									endif
								else
									AddParam \{structure_name = targeted_challenge_props
										Name = player_top_alpha
										value = 0.0}
									AddParam \{structure_name = targeted_challenge_props
										Name = player_mid_alpha
										value = 0.0}
									AddParam \{structure_name = targeted_challenge_props
										Name = player_bottom_alpha
										value = 0.0}
									AddParam \{structure_name = targeted_challenge_props
										Name = players_list_bg_alpha
										value = 0.0}
									AddParam \{structure_name = targeted_challenge_props
										Name = challenge_meter_container_pos
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
								Player = <Player>
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
			Pos = <flyby_pos>
			alpha = 1
			time = 0.2
			anim = ease_out
		}
	endif
	Wait <stats_display_secs> Seconds ignoreslomo
	if ScreenElementExists id = <stats_desc_id>
		DestroyScreenElement id = <stats_desc_id>
	endif
	setslomo ($g_song_outro_anims_initial_speed)
endscript

script song_outro_anims_skip_anims 
	if ui_event_exists_in_stack \{above = 'gameplay'
			Name = 'controller_disconnect'}
		printf \{'disconnect dialog is up!'}
		return
	endif
	if ScreenElementExists id = <start_skip_id>
		DestroyScreenElement id = <start_skip_id>
	endif
	KillSpawnedScript \{Name = song_outro_anims_add_helper}
	clean_up_user_control_helpers
	Change \{g_song_outro_anims_initial_speed = 1.0}
	setslomo ($g_song_outro_anims_initial_speed)
	Change \{g_song_outro_anims_playing = 0}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras_no_band'
		length = 5
		changenow
		extra_params = {
			force_time = 5
		}
		play_hold = 1}
	SpawnScriptNow \{switch_off_cameracuts_delayed}
	restore_idle_faces
	SpawnScriptNow \{id = not_transitions
		Transition_KillAll}
endscript

script song_outro_anims_find_self_within_friend_scores \{current_progress = !i1768515945
		targeted_challenge_friend_scores = !a1768515945}
	<above_friend_index> = -1
	<below_friend_index> = -1
	<self_index> = -1
	GetArraySize <targeted_challenge_friend_scores>
	if (<array_Size> > 0)
		<i> = 0
		begin
		if ((<targeted_challenge_friend_scores> [<i>].score) <= <current_progress>)
			break
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	<self_index> = <i>
	if (<i> = <array_Size>)
		<above_friend_index> = (<i> - 1)
	elseif (<i> = 0)
		<below_friend_index> = (<i> + 1)
	else
		<above_friend_index> = (<i> - 1)
		<below_friend_index> = (<i> + 1)
	endif
	if ((<above_friend_index> = -1) && (<below_friend_index> = -1))
		ScriptAssert \{'Could not find ranking amongst friends!'}
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
		formatText TextName = rank_text qs(0x4dc9c452) i = (<above_friend_index> + 1)
	endif
	return rank_text = <rank_text>
endscript

script switch_off_cameracuts_delayed 
	Wait \{2
		gameframes}
	CameraCuts_EnableChangeCam \{enable = FALSE}
endscript

script restore_idle_faces 
	i = 1
	begin
	formatText checksumName = musician 'musician%a' a = <i>
	formatText checksumName = info_struct 'musician%a_info' a = <i>
	fa_anims = ($<info_struct>.facial_anims_default)
	Change structurename = <info_struct> facial_anims = <fa_anims>
	if CompositeObjectExists Name = <musician>
		<musician> :Obj_KillSpawnedScript Name = facial_anim_loop
		<musician> :Obj_SpawnScriptNow facial_anim_loop
	endif
	i = (<i> + 1)
	repeat 4
endscript
