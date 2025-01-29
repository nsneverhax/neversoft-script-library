
script transition_playsimpleanim 
	Band_PlaySimpleAnim <...>
	bandmanager_setplayingintroanims Name = <Name>
endscript

script play_facial_anim_on_character \{Name = GUITARIST}
	if CompositeObjectExists Name = <Name>
		<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
		<Name> :Obj_SpawnScriptNow play_special_facial_anim params = {anim = <anim>}
	endif
endscript

script Band_PlayFacialAnim \{Name = GUITARIST}
	gamemode_gettype
	switch <Type>
		case training
		case practice
		case tutorial
		return \{FALSE}
	endswitch
	if GotParam \{Name}
		if (<Name> = vocalist)
			i = 0
			begin
			switch <i>
				case 0
				musician = musician1
				info_struct = musician1_info
				case 1
				musician = musician2
				info_struct = musician2_info
				case 2
				musician = musician3
				info_struct = musician3_info
				case 3
				musician = musician4
				info_struct = musician4_info
			endswitch
			if ((($<info_struct>.position) = vocalist) || (($<info_struct>.part) = vocals))
				play_facial_anim_on_character Name = <musician> anim = <anim>
			endif
			i = (<i> + 1)
			repeat 4
		else
			<orig_name> = <Name>
			get_musician_id Name = <Name>
			ExtendCrc <Name> '_info' out = info_struct
			if (<orig_name> = rocker || <orig_name> = power_rocker)
				play_facial_anim_on_character Name = <Name> anim = <anim>
			elseif GlobalExists Name = <info_struct>
				if (($<info_struct>.part) != vocals)
					play_facial_anim_on_character Name = <Name> anim = <anim>
				endif
			endif
		endif
	elseif GotParam \{part}
		i = 0
		begin
		switch <i>
			case 0
			musician = musician1
			info_struct = musician1_info
			case 1
			musician = musician2
			info_struct = musician2_info
			case 2
			musician = musician3
			info_struct = musician3_info
			case 3
			musician = musician4
			info_struct = musician4_info
		endswitch
		if (($<info_stuct>.part) = <part>)
			play_facial_anim_on_character Name = <musician> anim = <anim>
		endif
		i = (<i> + 1)
		repeat 4
	endif
endscript

script band_playrockinfacialanim \{Name = GUITARIST}
	get_musician_id Name = <Name>
	if CompositeObjectExists Name = <Name>
		<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
		if band_isfemale Name = <Name>
			printf \{qs(0xc85f8d07)}
			<Name> :Obj_SpawnScriptNow play_special_facial_anim params = {anim = gh_rocker_female_hardrockface_4}
		else
			printf \{qs(0xeda94c27)}
			<Name> :Obj_SpawnScriptNow play_special_facial_anim params = {anim = gh_rocker_male_hardrockface_4}
		endif
	endif
endscript

script band_changefacialanims \{Name = GUITARIST
		blend_duration = 0.3}
	original_name = <Name>
	get_musician_id Name = <Name>
	ExtendCrc <Name> '_Info' out = info_struct
	switch <original_name>
		case GUITARIST
		case BASSIST
		case drummer
		if ($<info_struct>.part = vocals)
			return
		endif
	endswitch
	if CompositeObjectExists Name = <Name>
		ExtendCrc <Name> '_Info' out = info_struct
		if ((GotParam ff_anims) || (GotParam mf_anims))
			if band_isfemale Name = <Name>
				if GotParam \{ff_anims}
					Change structurename = <info_struct> facial_anims = <ff_anims>
				endif
			else
				if GotParam \{mf_anims}
					Change structurename = <info_struct> facial_anims = <mf_anims>
				endif
			endif
		else
			fa_default = ($<info_struct>.facial_anims_default)
			if GotParam \{fa_type}
				ExtendCrc <fa_default> <fa_type> out = fa_anims
			else
				fa_anims = <fa_default>
			endif
			Change structurename = <info_struct> facial_anims = <fa_anims>
		endif
		<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
		<Name> :Obj_KillSpawnedScript Name = facial_anim_loop
		<Name> :Obj_SpawnScriptNow facial_anim_loop params = {blend_duration = <blend_duration>}
	else
	endif
endscript

script ae_changefacialanims \{blend_duration = 0.3}
	Obj_GetID
	if NOT ((GotParam ff_anims) || (GotParam mf_anims) || (GotParam fa_type))
		ScriptAssert \{qs(0x1ea5580d)}
	endif
	band_changefacialanims Name = <objID> blend_duration = <blend_duration> <...>
endscript

script band_enableautostrums 
	band_enableautostrums_cfunc Name = <Name>
endscript

script band_disableautostrums 
	band_disableautostrums_cfunc Name = <Name>
endscript

script band_enableautofret 
	band_enableautofret_cfunc Name = <Name>
endscript

script band_disableautofret 
	band_disableautofret_cfunc Name = <Name>
endscript

script band_enableautochords 
	band_enableautochords_cfunc Name = <Name>
endscript

script band_disableautochords 
	band_disableautochords_cfunc Name = <Name>
endscript

script band_setikchain 
	if (<Chain> = guitar)
		band_setikchaintarget Name = <Name> index = 0 target = Bone_IK_Hand_Guitar_R
		band_setikchaintarget Name = <Name> index = 1 target = Bone_IK_Hand_Guitar_L
		band_enableautofret Name = <Name>
		band_enableautochords Name = <Name>
		band_enableautostrums Name = <Name>
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Guitar_L Strength = 1
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Guitar_R Strength = 1
	elseif (<Chain> = slave)
		band_setikchaintarget Name = <Name> index = 0 target = Bone_IK_Hand_Slave_R
		band_setikchaintarget Name = <Name> index = 1 target = Bone_IK_Hand_Slave_L
		band_disableautofret Name = <Name>
		band_disableautochords Name = <Name>
		band_disableautostrums Name = <Name>
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Slave_L Strength = 1
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Slave_R Strength = 1
	elseif (<Chain> = fk)
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Guitar_L Strength = 0
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Guitar_R Strength = 0
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Slave_L Strength = 0
		bandmanager_setikchainstrength Name = <Name> Chain = Bone_IK_Hand_Slave_R Strength = 0
		bandmanager_setikchainstrength Name = <Name> node = lefthandik Chain = Bone_IK_Hand_Guitar_L Strength = 0
		bandmanager_setikchainstrength Name = <Name> node = lefthandik Chain = Bone_IK_Hand_Slave_L Strength = 0
		bandmanager_setikchainstrength Name = <Name> node = righthandik Chain = Bone_IK_Hand_Guitar_R Strength = 0
		bandmanager_setikchainstrength Name = <Name> node = righthandik Chain = Bone_IK_Hand_Slave_R Strength = 0
	else
		band_setikchaintarget Name = <Name> index = 0 target = Bone_IK_Hand_Slave_R
		band_setikchaintarget Name = <Name> index = 1 target = Bone_IK_Hand_Slave_L
		band_disableautofret Name = <Name>
		band_disableautochords Name = <Name>
		band_disableautostrums Name = <Name>
	endif
endscript

script ae_setik_guitarl_off 
	Obj_GetID
	band_disableautochords Name = <objID>
endscript

script ae_setik_guitarr_off 
	Obj_GetID
	band_disableautostrums Name = <objID>
endscript

script ae_setik_slavel_off 
endscript

script ae_setik_slaver_off 
endscript

script ae_setik_guitarr_on 
	Obj_GetID
	band_setikchaintarget Name = <objID> index = 0 target = Bone_IK_Hand_Guitar_R BlendDuration = 0.3
	band_enableautostrums Name = <objID>
endscript

script ae_setik_slavel_on 
	Obj_GetID
	band_setikchaintarget Name = <objID> index = 1 target = Bone_IK_Hand_Slave_L BlendDuration = 0.3
	band_disableautochords Name = <objID>
endscript

script ae_setik_slaver_on 
	Obj_GetID
	band_setikchaintarget Name = <objID> index = 0 target = Bone_IK_Hand_Slave_R BlendDuration = 0.3
	band_disableautostrums Name = <objID>
endscript

script ae_setik_to_fk_l 
	Obj_GetID
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Guitar_L Strength = 0
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Slave_L Strength = 0
	bandmanager_setikchainstrength node = lefthandik Name = <objID> Chain = Bone_IK_Hand_Guitar_L Strength = 0
	bandmanager_setikchainstrength node = lefthandik Name = <objID> Chain = Bone_IK_Hand_Slave_L Strength = 0
endscript

script ae_setik_to_fk_r 
	Obj_GetID
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Guitar_R Strength = 0
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Slave_R Strength = 0
	bandmanager_setikchainstrength node = righthandik Name = <objID> Chain = Bone_IK_Hand_Guitar_R Strength = 0
	bandmanager_setikchainstrength node = righthandik Name = <objID> Chain = Bone_IK_Hand_Slave_R Strength = 0
endscript

script ae_setik_to_ik_l 
	Obj_GetID
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Guitar_L Strength = 1
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Slave_L Strength = 1
	bandmanager_setikchainstrength node = lefthandik Name = <objID> Chain = Bone_IK_Hand_Guitar_L Strength = 1
	bandmanager_setikchainstrength node = lefthandik Name = <objID> Chain = Bone_IK_Hand_Slave_L Strength = 1
endscript

script ae_setik_to_ik_r 
	Obj_GetID
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Guitar_R Strength = 1
	bandmanager_setikchainstrength Name = <objID> Chain = Bone_IK_Hand_Slave_R Strength = 1
	bandmanager_setikchainstrength node = righthandik Name = <objID> Chain = Bone_IK_Hand_Guitar_R Strength = 1
	bandmanager_setikchainstrength node = righthandik Name = <objID> Chain = Bone_IK_Hand_Slave_R Strength = 1
endscript

script ae_disableautostrums 
	Obj_GetID
	band_disableautostrums Name = <objID>
endscript

script ae_enableautostrums 
	Obj_GetID
	band_enableautostrums Name = <objID>
endscript

script ae_disableautochords 
	Obj_GetID
	band_disableautochords Name = <objID>
endscript

script ae_enableautochords 
	Obj_GetID
	band_enableautochords Name = <objID>
endscript

script ik_fk_switch_override 
	playlist_getcurrentsong
	if (<current_song> = bandontherun)
		return
	endif
	ae_setik_slaver_on
endscript

script band_setikchaintarget \{BlendDuration = 0.0}
	band_setikchaintarget_cfunc Name = <Name> target = <target> index = <index> BlendDuration = <BlendDuration>
endscript

script band_movetonode \{allow_in_2player = FALSE}
	band_movetonode_cfunc allow_in_2player = <allow_in_2player> Name = <Name> node = <node>
endscript

script band_movetostartnode \{allow_in_2player = FALSE}
	band_movetostartnode_cfunc Name = <Name> allow_in_2player = <allow_in_2player>
endscript

script band_safelocktonode \{Name = !q1768515945
		object = 'none'
		node = 'none'
		offset = (0.0, 0.0, 0.0)
		bone = None}
	if fastcompositeobjectexists Name = <Name>
		band_locktonode <...>
	endif
endscript

script band_locktonode \{Name = !q1768515945
		object = 'none'
		node = 'none'
		offset = (0.0, 0.0, 0.0)
		bone = None}
	GetPakManCurrent \{map = zones}
	if (<object> != None)
		AppendSuffixToChecksum Base = <pak> SuffixString = <object>
		<objectName> = <appended_id>
	elseif (<node> != None)
		AppendSuffixToChecksum Base = <pak> SuffixString = <node>
		<nodeName> = <appended_id>
	else
		return
	endif
	if (<bone> != None)
		<Name> :Obj_LockToObject {objectName = <objectName> nodeName = <nodeName> <offset> bone = <bone>}
	else
		<Name> :Obj_LockToObject {objectName = <objectName> nodeName = <nodeName> <offset>}
	endif
endscript

script band_restartidles 
	bandmanager_playidle \{Name = musician1
		all_modes = true
		restart}
	bandmanager_playidle \{Name = musician2
		all_modes = true
		restart}
	bandmanager_playidle \{Name = musician3
		all_modes = true
		restart}
	bandmanager_playidle \{Name = musician4
		all_modes = true
		restart}
endscript
display_clip_info = true

script Band_PlayIdle 
	if NOT GotParam \{no_wait}
		Wait \{1
			gameframe}
	endif
	bandmanager_playidle <...>
endscript

script band_playloop \{start_frame = 0}
	wait_for_next_odd_frame
	Wait \{2
		gameframes}
	override_anim = None
	if band_isfemale Name = <Name>
		if GotParam \{female}
			override_anim = <female>
		endif
	else
		if GotParam \{male}
			override_anim = <male>
		endif
	endif
	getfirstplayer \{local}
	getplayerinfo <Player> current_song_beat_time
	if (<current_song_beat_time> = 0)
		playlist_getcurrentsong
		songfilemanager func = get_num_fretbar_notes song_name = <current_song>
		if (<num_fretbar_notes> > 0)
			songfilemanager func = get_fretbar_note song_name = <current_song> index = 1
			current_song_beat_time = <fretbar_time>
			setplayerinfo <Player> current_song_beat_time = <current_song_beat_time>
		endif
	endif
	new_tempo = ((1000.0 / <current_song_beat_time>) * 60.0)
	Change tempo_for_anims = <new_tempo>
	switch <Name>
		case GUITARIST
		part = guitar
		case BASSIST
		part = bass
		case drummer
		part = drum
		case vocalist
		part = vocals
		default
		ScriptAssert \{'Unknown part!'}
	endswitch
	<loop_offsets> = [0.0 0.5 0.25 0.75]
	<num_found> = 0
	SetSearchAllAssetContexts
	<start_pct> = 0
	if Anim_AnimExists anim = <override_anim>
		Anim_GetAnimLength anim = <override_anim>
		if (<length> > 0)
			<start_pct> = ((<start_frame> / 30.0) / <length>)
		endif
	endif
	SetSearchAllAssetContexts \{OFF}
	get_musician_number Name = <Name>
	<musician_index> = <number>
	begin
	switch <musician_index>
		case 1
		musician = musician1
		info_struct = musician1_info
		case 2
		musician = musician2
		info_struct = musician2_info
		case 3
		musician = musician3
		info_struct = musician3_info
		case 4
		musician = musician4
		info_struct = musician4_info
	endswitch
	if (($<info_struct>.part) = <part>)
		<start> = (<start_pct> + <loop_offsets> [<num_found>])
		if (<start> > 1.0)
			<start> = (<start> - 1.0)
		endif
		num_found = (<num_found> + 1)
		bandmanager_setoverrideloop Name = <musician> anim = <override_anim>
		bandmanager_restartloop Name = <musician> start = <start>
	endif
	<musician_index> = (<musician_index> + 1)
	if (<musician_index> > 4)
		<musician_index> = 1
	endif
	repeat 4
endscript

script is_player_using_avatar 
	return \{FALSE}
endscript

script is_any_player_using_an_avatar 
	return \{FALSE}
endscript

script is_moment_flag_enabled 
	if GlobalExists \{Name = venue_moment_flags
			Type = array}
		if ArrayContains array = ($venue_moment_flags) contains = <flag>
			return \{true}
		endif
	endif
	return \{FALSE}
endscript

script band_playclip \{startframe = 0.0
		override_intro = true}
	if GotParam \{intro_event}
		SpawnScriptNow \{CameraCuts_SetArrayPrefix
			params = {
				prefix = 'cameras_moments'
				changenow
				Name = moment01
				sync
				disablechangecam = true
			}}
	endif
	GetSongTimeMs
	CastToInteger \{time}
	if ($g_allow_moments = FALSE)
		return
	endif
	if GotParam \{intro_event}
		if NOT GlobalExists Name = <clip> Type = structure
			printf channel = anim_info 'WARNING: Band_PlayClip given unknown clip %c.' c = <clip>
			return
		endif
		element = ($<clip>)
	else
		if NOT songglobalexists Name = <clip> Type = structure
			printf channel = anim_info 'WARNING: Band_PlayClip given unknown clip %c.' c = <clip>
			return
		endif
		getsongglobal Name = <clip>
	endif
	if NOT GotParam \{event_time}
		GetSongTimeMs time_offset = ($time_gem_offset)
		CastToInteger \{time}
		<event_time> = <time>
	endif
	<clip_dropped> = FALSE
	<cameras_valid> = 1
	<non_standard_band_safe> = FALSE
	if StructureContains \{structure = element
			venueflags}
		GetArraySize (<element>.venueflags)
		<i> = 0
		begin
		<next_moment_tag> = (<element>.venueflags [<i>])
		if (<next_moment_tag> = nsbsafe)
			<non_standard_band_safe> = true
		else
			if NOT is_moment_flag_enabled flag = <next_moment_tag>
				<clip_dropped> = true
				<cameras_valid> = 0
				break
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	<non_standard_band_safe> = FALSE
	if StructureContains \{structure = element
			charflags}
		if ArrayContains array = (<element>.charflags) contains = nsbsafe
			<non_standard_band_safe> = true
		endif
		GetArraySize (<element>.charflags)
		<i> = 0
		begin
		<next_char_flag> = (<element>.charflags [<i>])
		switch <next_char_flag>
			case notavatarsafe
			if is_any_player_using_an_avatar
				<clip_dropped> = true
				<cameras_valid> = 0
			endif
			case storymoments
			gamemode_gettype
			if (<Type> != career)
				<clip_dropped> = true
				<cameras_valid> = 0
			endif
		endswitch
		<i> = (<i> + 1)
		repeat <array_Size>
	endif
	if GotParam \{intro_event}
		<non_standard_band_safe> = true
	endif
	if StructureContains \{structure = element
			goalflags}
		band_playclip_checkgoals curr_clip_goals = (<element>.goalflags) clip = <clip>
	endif
	if ($g_using_traditional_band_setup = FALSE && <non_standard_band_safe> = FALSE)
		<clip_dropped> = true
		<cameras_valid> = 0
	endif
	if StructureContains \{structure = element
			cameras}
		GetArraySize (<element>.cameras)
		if (<array_Size> > 0)
			<i> = 0
			begin
			<slot> = (<element>.cameras [<i>].slot)
			SetArrayElement ArrayName = g_moment_cameras_valid globalarray index = <slot> NewValue = <cameras_valid>
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	if (<clip_dropped> = true)
		return
	endif
	if StructureContains \{structure = element
			characters}
		GetArraySize (<element>.characters)
		if (<array_Size> > 0)
			i = 0
			begin
			if StructureContains structure = (<element>.characters [<i>]) anim
				Name = (<element>.characters [<i>].Name)
				get_musician_id Name = <Name>
				<Name> :Obj_KillSpawnedScript Name = return_characters_to_idle_at_song_time
			endif
			<i> = (<i> + 1)
			repeat <array_Size>
		endif
	endif
	SpawnScriptNow handle_embedded_clip_commands params = {clip = <clip> element = <element> start_frame = <startframe> clip_start_time = <event_time> end_frame = <endframe>}
	if NOT GotParam \{no_wait}
		wait_for_next_odd_frame
	endif
	clip_get_time_and_frame
	GetSongTimeMs
	CastToInteger \{time}
	if GotParam \{no_wait}
	else
	endif
	initial_delay = 2
	teleport_delay = 1
	if GotParam \{no_wait}
		initial_delay = 0
		teleport_delay = 0
	endif
	if (<initial_delay> > 0)
		Wait <initial_delay> gameframes
	endif
	if StructureContains \{structure = element
			actors}
		GetArraySize (<element>.actors)
		if (<array_Size> > 0)
			<i> = 0
			begin
			<actor_name> = (<element>.actors [<i>].Name)
			<actor_pos> = (<element>.actors [<i>].startnode)
			<actor_anim> = (<element>.actors [<i>].anim)
			if CompositeObjectExists Name = <actor_name>
				<start_pct> = 0
				SetSearchAllAssetContexts
				if Anim_AnimExists anim = <actor_anim>
					Anim_GetAnimLength anim = <actor_anim>
					if (<length> > 0)
						<start_pct> = ((<startframe> / 30.0) / <length>)
					else
					endif
				else
				endif
				move_actor = 1
				<actor_name> :GameObj_PlayAnim anim = <actor_anim> start = <start_pct> speed = <timefactor>
			else
			endif
			repeat <array_Size>
		endif
	endif
	band_playclip_new_cfunc
	if (<teleport_delay> != 0)
		Wait <teleport_delay> gameframes
	endif
	band_playclip_finish_new_cfunc
	if GotParam \{move_actor}
		band_movetonode Name = <actor_name> node = <actor_pos>
	endif
	Wait \{1
		gameframe}
	band_playclip_iktargets
endscript

script handle_embedded_clip_commands \{clip_start_time = !i1768515945}
	if NOT StructureContains \{structure = element
			commands}
		return
	endif
	GetArraySize (<element>.commands)
	if (<array_Size> = 0)
		return
	endif
	<start_offset> = (((<start_frame> * 1000) + 15) / 30)
	<end_offset> = (((<end_frame> * 1000) + 15) / 30)
	<i> = 0
	begin
	<command_time> = (<element>.commands [<i>].time)
	fixtimerounding \{command_time}
	if ((<command_time> >= <start_offset>) && (<command_time> <= <end_offset>))
		<command_time> = (<command_time> + <clip_start_time> - <start_offset>)
		begin
		GetSongTimeMs time_offset = ($time_gem_offset)
		CastToInteger \{time}
		if (<command_time> <= <time>)
			break
		endif
		Wait \{1
			gameframe}
		repeat
		<Scr> = (<element>.commands [<i>].Scr)
		<params> = (<element>.commands [<i>].params)
		SpawnScriptNow <Scr> params = {(<element>.commands [<i>].params) from_scriptevent = 1} id = song_event_scripts addtotail = 1
	endif
	<i> = (<i> + 1)
	repeat <array_Size>
endscript

script band_playclip_checkgoals 
	RequireParams \{[
			curr_clip_goals
			clip
		]
		all}
	printf \{channel = video_moment
		qs(0xbf61c47b)}
	printf channel = video_moment qs(0x73307931) s = <clip>
	printstruct channel = video_moment <curr_clip_goals>
	getnumplayersingame \{out = num_players}
	getfirstplayer
	<goal_failed> = 0
	begin
	formatText TextName = player_suffix_string '_p%a' a = <Player>
	GetArraySize <curr_clip_goals> param = num_clip_goals
	<clip_goal_idx> = 0
	<player_goal_success> = 0
	if (<num_clip_goals> > 0)
		begin
		AppendSuffixToChecksum Base = (<curr_clip_goals> [<clip_goal_idx>]) SuffixString = <player_suffix_string>
		<player_clip_goal> = <appended_id>
		if GMan_GoalIsActive goal = <player_clip_goal>
			quickplay_get_grade goal_id = <player_clip_goal>
			if (<grade> > 0)
				printf channel = video_moment qs(0x86319684) a = <player_clip_goal> b = <grade>
				<player_goal_success> = 1
				break
			else
				printf channel = video_moment qs(0xc0e6e614) a = <player_clip_goal>
			endif
		endif
		<clip_goal_idx> = (<clip_goal_idx> + 1)
		repeat <num_clip_goals>
		if (<player_goal_success> = 0)
			<goal_failed> = 1
			break
		endif
	endif
	getnextplayer Player = <Player>
	repeat <num_players>
	if (<goal_failed> = 1)
		printf \{channel = video_moment
			qs(0x90f0bd0b)}
		return \{clip_dropped = true
			cameras_valid = 0}
	else
		printf channel = video_moment qs(0x6ec35acb) s = <clip>
	endif
endscript

script band_forcetoidle \{all_modes = FALSE}
	if GotParam \{Name}
		if CompositeObjectExists Name = <Name>
			bandmanager_changeik Name = <Name> Enabled = true
			bandmanager_playidle Name = <Name> BlendDuration = 0.0 all_modes = <all_modes>
		endif
	endif
endscript

script band_forcealltoidle \{all_modes = FALSE}
	if NOT GotParam \{no_wait}
		Wait \{1
			gameframe}
	endif
	band_forcetoidle Name = GUITARIST all_modes = <all_modes> <...>
	band_forcetoidle Name = BASSIST all_modes = <all_modes> <...>
	band_forcetoidle Name = vocalist all_modes = <all_modes> <...>
	band_forcetoidle Name = drummer all_modes = <all_modes> <...>
endscript
tempo_for_anims = -1
tempo_for_drum_anims = -1

script band_setanimtempo 
	Change tempo_for_anims = <tempo>
	if ($tempo_for_drum_anims = -1)
		Change tempo_for_drum_anims = <tempo>
	endif
endscript

script band_clearanimtempo 
	Change \{tempo_for_anims = -1}
	Change \{tempo_for_drum_anims = -1}
endscript

script band_isfemale 
	if NOT GotParam \{Name}
		printf \{qs(0x50e85932)}
		return
	endif
	if NOT CompositeObjectExists Name = <Name>
		printf qs(0x4594890c) a = <Name>
		return
	endif
	<Name> :GetSingleTag is_female
	if (<is_female> = 1)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script return_characters_to_idle_at_song_time 
	return_to_idle_time = <time>
	begin
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	if (<time> >= <return_to_idle_time>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ($display_clip_info = true)
		clip_get_time_and_frame
	endif
	wait_for_next_odd_frame
	Wait \{2
		gameframes}
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	CastToInteger \{time}
	band_forcetoidle Name = <Name> all_modes = <all_modes> <...>
	Wait \{2
		gameframes}
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	CastToInteger \{time}
	band_movetostartnode Name = <Name>
endscript

script clip_get_time_and_frame 
	GetSongTimeMs \{time_offset = $time_gem_offset_with_lag}
	Seconds = (<time> / 1000.0)
	if (<Seconds> < 0)
		Seconds = 0
	endif
	minutes = (<Seconds> / 60.0)
	CastToInteger \{minutes}
	Seconds = (<Seconds> - (<minutes> * 60))
	seconds_float = <Seconds>
	CastToInteger \{Seconds}
	fps = 30
	fraction_of_second = (<seconds_float> - <Seconds>)
	Frame = (<fraction_of_second> * <fps>)
	CastToInteger \{Frame}
	if (<Seconds> < 10)
		if (<Frame> < 10)
			formatText TextName = time_string qs(0x593819d8) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		else
			formatText TextName = time_string qs(0xac471e75) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		endif
	else
		if (<Frame> < 10)
			formatText TextName = time_string qs(0x31aec87f) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		else
			formatText TextName = time_string qs(0xcacc8b50) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		endif
	endif
	formatText TextName = time_string qs(0x67b7904f) a = <minutes> b = <Seconds> c = <Frame> d = <time>
	return time_string = <time_string>
endscript

script debug_print_frame_time 
	Seconds = (<time> / 1000.0)
	if (<Seconds> < 0)
		Seconds = 0
	endif
	minutes = (<Seconds> / 60.0)
	CastToInteger \{minutes}
	Seconds = (<Seconds> - (<minutes> * 60))
	seconds_float = <Seconds>
	CastToInteger \{Seconds}
	fps = 30
	fraction_of_second = (<seconds_float> - <Seconds>)
	Frame = (<fraction_of_second> * <fps>)
	CastToInteger \{Frame}
	if (<Seconds> < 10)
		if (<Frame> < 10)
			formatText TextName = time_string qs(0x593819d8) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		else
			formatText TextName = time_string qs(0xac471e75) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		endif
	else
		if (<Frame> < 10)
			formatText TextName = time_string qs(0x31aec87f) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		else
			formatText TextName = time_string qs(0xcacc8b50) a = <minutes> b = <Seconds> c = <Frame> d = <time>
		endif
	endif
	printf channel = AnimInfo <time_string>
endscript

script band_showmic \{Name = GUITARIST}
	if GotParam \{from_scriptevent}
		wait_for_next_odd_frame
		Wait \{3
			gameframes}
	endif
	if (($g_allow_moments = FALSE) || ($g_using_traditional_band_setup = FALSE))
		return
	endif
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	if ($cheat_airinstruments != 1)
		<Name> :show_mic
	endif
endscript

script band_hidemic \{Name = GUITARIST}
	if GotParam \{from_scriptevent}
		wait_for_next_odd_frame
		Wait \{3
			gameframes}
	endif
	if (($g_allow_moments = FALSE) || ($g_using_traditional_band_setup = FALSE))
		return
	endif
	get_musician_id Name = <Name>
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :hide_mic
endscript

script band_showmic_stand \{Name = GUITARIST}
	if GotParam \{from_scriptevent}
		wait_for_next_odd_frame
		Wait \{3
			gameframes}
	endif
	if (($g_allow_moments = FALSE) || ($g_using_traditional_band_setup = FALSE))
		return
	endif
	get_musician_id Name = <Name>
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	if ($cheat_airinstruments != 1)
		<Name> :show_mic_stand
	endif
endscript

script band_hidemic_stand \{Name = GUITARIST}
	if GotParam \{from_scriptevent}
		wait_for_next_odd_frame
		Wait \{3
			gameframes}
	endif
	if (($g_allow_moments = FALSE) || ($g_using_traditional_band_setup = FALSE))
		return
	endif
	get_musician_id Name = <Name>
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :hide_mic_stand
endscript

script band_showmic_microphone \{Name = GUITARIST}
	if (($g_allow_moments = FALSE) || ($g_using_traditional_band_setup = FALSE))
		return
	endif
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	if ($cheat_airinstruments != 1)
		<Name> :show_mic_microphone
	endif
endscript

script band_hidemic_microphone \{Name = GUITARIST}
	if (($g_allow_moments = FALSE) || ($g_using_traditional_band_setup = FALSE))
		return
	endif
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :hide_mic_microphone
endscript

script scripteventsyncrenderer 
	wait_for_next_odd_frame
	Wait \{3
		gameframes}
endscript

script scripteventsynclightshow 
	wait_for_next_odd_frame
	Wait \{1
		gameframes}
endscript

script band_hide 
	if GotParam \{from_scriptevent}
		wait_for_next_odd_frame
		Wait \{3
			gameframes}
	endif
	get_musician_id Name = <Name>
	if CompositeObjectExists Name = <Name>
		<Name> :obj_setvisibility viewport_mask = 0
	endif
endscript

script band_unhide 
	if GotParam \{from_scriptevent}
		wait_for_next_odd_frame
		Wait \{3
			gameframes}
	endif
	get_musician_id Name = <Name>
	if CompositeObjectExists Name = <Name>
		if ($cheat_invisiblecharacters != 1)
			<Name> :obj_setvisibility all
			<Name> :obj_teleport
		endif
		if ($cheat_airinstruments != 1)
			if <Name> :obj_getintegertag tag_name = instrument_hidden assert = 0
				if (<integer_value> = 0)
				endif
			else
			endif
		endif
	endif
endscript
enable_guitarist_camera_swapping = FALSE

script bandmanager_stopfacialanims 
	<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
	<Name> :Obj_KillSpawnedScript Name = facial_anim_loop
	<Name> :hero_clear_facial_anim
endscript

script bandmanager_startfacialanims 
	if NOT CompositeObjectExists Name = <Name>
		return
	endif
	<Name> :Obj_KillSpawnedScript Name = play_special_facial_anim
	<Name> :Obj_KillSpawnedScript Name = facial_anim_loop
	<Name> :Obj_SpawnScriptNow facial_anim_loop
endscript

script bandmanager_startallfacialanims 
	bandmanager_startfacialanims \{Name = musician1}
	bandmanager_startfacialanims \{Name = musician2}
	bandmanager_startfacialanims \{Name = musician3}
	bandmanager_startfacialanims \{Name = musician4}
endscript

script bandmanager_airguitarcheat 
	if ($cheat_airinstruments = 1)
		bandmanager_hideallinstruments
	else
		bandmanager_unhideallinstruments
	endif
endscript

script bandmanager_invisiblecharacterscheat 
	if ($cheat_invisiblecharacters = 1)
		bandmanager_hideallmusicians
	else
		bandmanager_unhideallmusicians
	endif
endscript

script bandmanager_hideinstrument 
	if GotParam \{from_scriptevent}
		wait_for_next_odd_frame
		Wait \{3
			gameframes}
	endif
	get_musician_id Name = <Name>
	if CompositeObjectExists <Name>
		<Name> :hideinstrument
	endif
endscript

script bandmanager_unhideinstrument 
	if GotParam \{from_scriptevent}
		wait_for_next_odd_frame
		Wait \{3
			gameframes}
	endif
	get_musician_id Name = <Name>
	if CompositeObjectExists <Name>
		<Name> :unhideinstrument
	endif
endscript

script bandmanager_hideallinstruments 
	if GotParam \{from_scriptevent}
		wait_for_next_odd_frame
		Wait \{3
			gameframes}
	endif
	bandmanager_hideinstrument \{Name = musician1}
	bandmanager_hideinstrument \{Name = musician2}
	bandmanager_hideinstrument \{Name = musician3}
	bandmanager_hideinstrument \{Name = musician4}
endscript

script bandmanager_unhideallinstruments \{force_unhide = 0}
	if GotParam \{from_scriptevent}
		wait_for_next_odd_frame
		Wait \{3
			gameframes}
	endif
	if ($cheat_airinstruments != 1 || <force_unhide> = 1)
		bandmanager_unhideinstrument \{Name = musician1}
		bandmanager_unhideinstrument \{Name = musician2}
		bandmanager_unhideinstrument \{Name = musician3}
		bandmanager_unhideinstrument \{Name = musician4}
	endif
endscript

script bandmanager_hidemusician 
	if CompositeObjectExists <Name>
		<Name> :hidemusician
	endif
endscript

script bandmanager_unhidemusician 
	if CompositeObjectExists <Name>
		<Name> :unhidemusician
	endif
endscript

script bandmanager_hideallmusicians 
	bandmanager_hidemusician \{Name = musician1}
	bandmanager_hidemusician \{Name = musician2}
	bandmanager_hidemusician \{Name = musician3}
	bandmanager_hidemusician \{Name = musician4}
endscript

script bandmanager_unhideallmusicians 
	bandmanager_unhidemusician \{Name = musician1}
	bandmanager_unhidemusician \{Name = musician2}
	bandmanager_unhidemusician \{Name = musician3}
	bandmanager_unhidemusician \{Name = musician4}
endscript

script get_musician_id \{Name = None
		objID = None}
	switch <Name>
		case GUITARIST
		case BASSIST
		case vocalist
		case drummer
		case rocker
		case power_rocker
		if fastcompositeobjectexists Name = <Name>
			<Name> :Obj_GetID
			Name = <objID>
		else
		endif
		case musician1
		case musician2
		case musician3
		case musician4
		<objID> = None
		default
	endswitch
	return Name = <Name>
endscript

script get_musician_number 
	get_musician_id Name = <Name>
	switch <Name>
		case musician1
		<number> = 1
		case musician2
		<number> = 2
		case musician3
		<number> = 3
		case musician4
		<number> = 4
		default
		ScriptAssert 'get_musician_number - musician not found %i' i = <Name>
	endswitch
	return number = <number>
endscript
g_allow_moments = true
g_using_traditional_band_setup = true

script determine_if_moments_should_play 
	gamemode_gettype
	switch <Type>
		case training
		case practice
		case tutorial
		Change \{g_allow_moments = FALSE}
		return
	endswitch
	playlist_getcurrentsong
	get_band_configuration song = <current_song> skip_dlc_check
	<standard_band> = true
	if (<Band> = default_band)
		allowed = true
		if NOT is_standard_band_setup
			<standard_band> = FALSE
		endif
	else
		gamemode_gettype
		if (<Type> = career)
			if StructureContains structure = $download_songlist_props <current_song>
				allowed = FALSE
			elseif NOT venue_should_use_song_performance song = <current_song>
				allowed = FALSE
			else
				allowed = true
			endif
		else
			allowed = FALSE
		endif
	endif
	gamemode_gettype
	if (<Type> = career)
		allowed = true
		standard_band = true
	endif
	Change g_allow_moments = <allowed>
	Change g_using_traditional_band_setup = <standard_band>
	if ($g_allow_moments = FALSE)
		set_moment_camera_states \{valid = 0}
	else
		set_moment_camera_states \{valid = 1}
	endif
endscript

script should_play_moments 
	if ($g_allow_moments = true)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script wait_for_next_even_frame 
	if isprimaryframe
	else
		Wait \{1
			gameframes}
	endif
endscript

script wait_for_next_odd_frame 
	if isprimaryframe
		Wait \{1
			gameframes}
	endif
endscript

script hide_all_but_rocker 
	band_hide \{Name = musician1}
	band_hide \{Name = musician2}
	band_hide \{Name = musician3}
	band_hide \{Name = musician4}
	get_musician_id \{Name = rocker}
	band_unhide Name = <Name>
endscript

script set_frame_lock_object 
	if NOT CompositeObjectExists Name = <Name>
		ScriptAssert \{qs(0x5e6edd66)}
		return
	endif
	<Name> :anim_setframelockobject frame_lock_object = <frame_lock_object>
endscript
