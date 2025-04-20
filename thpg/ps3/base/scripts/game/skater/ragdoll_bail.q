ragdoll_bail_velocity_cap = 15.0
ragdoll_bail_cam_behind_mult = 1.6
ragdoll_bail_cam_above_mult = 1.2
ragdoll_bail_ground_snap_height = 0.2
ragdoll_bail_bail_points = {
	Damage_Bonus = {
		Bruise = 1000
		Sprain = 2000
		broken = 3000
	}
	Sliding_Blood_Ramp_Up = 5000.0
	Round_Down_To = 5.0
	Show_UI_Message_If_Over = 500
	Harsh_UI_Message_If_Over = 20000
}
ragdoll_bail_damage_constants = [
	{
		one_off = 80.0
		cumulative = 100.0
	}
	{
		one_off = 100.0
		cumulative = 150.0
	}
	{
		one_off = 255.0
		cumulative = 550.0
	}
]
ragdoll_bail_constants = {
	rest_epsilon = 0.75
	getup_epsilon = 15.0
	getup_cancel_epsilon = 40.0
	quit_bail_epsilon_mult = 40.0
	stuck_check_epsilon = 15.0
	stuck_check_time = 3.0
	Rollout_Allowed_Time = 2.0
	Rollout_Max_Air = 10.0
	Rollout_Min_Velocity = 3.0
	Rollout_Max_Velocity = 20.0
}
ragdoll_bail_anim_constants = {
	air_anim_feeler_length = 2.0
}
ragdoll_bail_collision_constants = {
	sliding_max_normal_velocity = 16.0
	sliding_min_slide_velocity = 0.1
	hit_min_proj_velocity = 10.0
	hit_min_bone_velocity = 5.0
	hit_min_bone_ang_velocity = 3.0
	ignore_threshold_proj_velocity = 0.01
	ignore_threshold_bone_velocity = 0.1
}
Ragdoll_Bail_Use_Leaderboard = 1
RagdollDriveParams_Init = {
	stiffness = 0.3
	max_force = 30
}
RagdollDriveParams_Standard = {
	stiffness = 1.0
	max_force = 20.0
}
ragdolldriveparams_peds = {
	stiffness = 1.0
	max_force = 20.0
}
RagdollDriveParams_Slow = {
	stiffness = 0.1
	max_force = 150.0
}
RagdollDriveParams_Limp = {
	stiffness = 0.1
	max_force = 1.0
}
ragdolldriveparams_perbonestate = [
	{
		bone = bone_pelvis
		stiffness_factor = 0.5
		max_force_factor = 20
	}
	{
		bone = bone_stomach_lower
		stiffness_factor = 0.5
		max_force_factor = 30
	}
	{
		bone = bone_stomach_upper
		stiffness_factor = 0.5
		max_force_factor = 25
	}
	{
		bone = bone_chest
		stiffness_factor = 0.5
		max_force_factor = 20
	}
	{
		bone = bone_neck
		stiffness_factor = 0.5
		max_force_factor = 0.9
	}
	{
		bone = bone_head
		stiffness_factor = 0.5
		max_force_factor = 0.6
	}
	{
		bone = bone_collar_l
		stiffness_factor = 0.5
		max_force_factor = 7
	}
	{
		bone = bone_bicep_l
		stiffness_factor = 0.5
		max_force_factor = 3.5
	}
	{
		bone = bone_forearm_l
		stiffness_factor = 0.5
		max_force_factor = 0.8
	}
	{
		bone = bone_palm_l
		stiffness_factor = 0.5
		max_force_factor = 0.2
	}
	{
		bone = bone_collar_r
		stiffness_factor = 0.5
		max_force_factor = 7
	}
	{
		bone = bone_bicep_r
		stiffness_factor = 0.5
		max_force_factor = 3.5
	}
	{
		bone = bone_forearm_r
		stiffness_factor = 0.5
		max_force_factor = 0.8
	}
	{
		bone = bone_palm_r
		stiffness_factor = 0.5
		max_force_factor = 1
	}
	{
		bone = bone_thigh_r
		stiffness_factor = 0.5
		max_force_factor = 8
	}
	{
		bone = bone_knee_r
		stiffness_factor = 0.5
		max_force_factor = 2.2
	}
	{
		bone = bone_ankle_r
		stiffness_factor = 0.5
		max_force_factor = 1
	}
	{
		bone = bone_thigh_l
		stiffness_factor = 0.5
		max_force_factor = 8
	}
	{
		bone = bone_knee_l
		stiffness_factor = 0.5
		max_force_factor = 2.2
	}
	{
		bone = bone_ankle_l
		stiffness_factor = 0.5
		max_force_factor = 1
	}
]
ragdoll_max_rigidbody_pushtopose_stress = 600

script Ragdoll_Bail_Rollout_Cancel 
	printf \{channel = bail
		'Ragdoll_Bail_Rollout_Cancel'}
	ragdoll_anim_set_state \{fullragdoll}
	baillerptoground \{0}
	ragdoll_setstate \{state = physical_motion_not_driven_pose_used}
	printf \{"Ragdoll_Bail_Rollout_Cancel"}
	settags \{doingrollout = 0}
	waitforragdoll
	goto \{Baildone}
endscript

script Ragdoll_Bail_Flash_Respot 
	setslomo 1.0
	Ragdoll_Bail_Flash_Kill
	Skater_Get_Viewport
	flash_name = ragdollFlashBloom
	if (<viewport> = 1)
		flash_name = ragdollFlashBloom2
	endif
	screenfx_addfxinstance {
		viewport = <viewport>
		name = <flash_name>
		type = bloom
		on = 1
		bloom1 = 1
		bloom2 = 1
		autoluminancemod = 0
		distancemod = 72.0
		strength = [255 120 120]
		color = [80 80 80]
	}
	time = 0.4
	onexitrun Exit_Ragdoll_Bail_Flash_Respot params = {<...>}
	ragdollbaildeactivate
	baillerptoground 1
	ragdoll_blendtoinactive blendduration = 0.3
	wait 1 frame
	soundevent event = Teleport_Back_SFX
	if screenfx_fxinstanceexists viewport = <viewport> name = <flash_name>
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = <flash_name>
			time = (<time> * 0.5)
			on = 1
			bloom1 = 1
			bloom2 = 1
			autoluminancemod = 0
			distancemod = 999
			strength = [250 235 235]
			color = [0 0 0]
		}
	endif
	wait (<time> * 0.5) seconds
	disableplayerinput
	unpausephysics
	notinbail
	stopbalancetrick
	killextratricks
	cleareventhandlergroup `default`
	onexceptionrun
	setstate ground
	onexitrun
	obj_getid
	obj_spawnscriptnow Ragdoll_Bail_Flash_Respot_Part_Two params = {objid = <objid> time = <time> flash_name = <flash_name> viewport = <viewport>}
endscript

script Exit_Ragdoll_Bail_Flash_Respot 
	if screenfx_fxinstanceexists viewport = <viewport> name = <flash_name>
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = <flash_name>
			time = (<time> * 0.5)
			($screenflash_tod_manager.screen_fx [1])
			bloom1 = 0
			bloom2 = 0
			strength = [0 0 0]
		}
	endif
	if screenelementexists id = goal_skater_exit_goal_area_params
		if screenfx_fxinstanceexists viewport = 0 name = out_of_bounds_red
			screenfx_removefxinstance {
				viewport = 0
				name = out_of_bounds_red
			}
		endif
	endif
endscript

script Ragdoll_Bail_Flash_Respot_Part_Two 
	onexitrun Exit_Ragdoll_Bail_Flash_Respot params = {<...>}
	obj_forceupdate
	bailsnaptoground
	wait (<time> * 0.5) seconds
	bailsnaptoground
	onexitrun
	Exit_Ragdoll_Bail_Flash_Respot <...>
	setslomo \{1.0}
	cleareventhandlergroup \{`default`}
	onexceptionrun
	enableplayerinput
	PostBailDone \{SkaterInit}
endscript

script Ragdoll_Bail_Flash_Kill 
	if screenfx_fxinstanceexists \{viewport = 0
			name = ragdollFlashBloom}
		screenfx_removefxinstance \{viewport = 0
			name = ragdollFlashBloom}
	endif
	if screenfx_fxinstanceexists \{viewport = 1
			name = ragdollFlashBloom2}
		screenfx_removefxinstance \{viewport = 1
			name = ragdollFlashBloom2}
	endif
endscript

script Ragoll_Bail_Get_Orientation 
	ragdoll_getorientation
	if (<face_up> > 0.4)
		orientation = back
	else
		if (<face_up> < -0.4)
			orientation = forward
		else
			if flipped
				on_side = (<on_side> * -1)
			endif
			if (<on_side> > 0.0)
				orientation = left
			else
				orientation = right
			endif
		endif
	endif
	return orientation = <orientation>
endscript

script ragdoll_bail_begin_getup 
	bail_disable_getup = 0
	getsingletag bail_disable_getup
	if (<bail_disable_getup> = 1)
		return
	endif
	if ragdoll_anim_is_state rollout
		return
	endif
	Ragdoll_Bail_Cancel_Anims
	cancelrotatedisplayandupdatematrix
	if isdoingragdollbail
		ragdoll_setstate state = physical_motion_ragdoll_driven_pose_used
		printf "Ragdoll_Bail_Begin_Getup"
	endif
	ragdoll_anim_set_state getup
	bailorienttobones
	Ragoll_Bail_Get_Orientation
	Bail_PlayGetupAnim anim_struct = ($Bail_Writhe_Anims.<orientation>) timer_type = cycle
endscript

script ragdoll_bail_cancel_getup 
	bail_disable_getup = 0
	getsingletag \{bail_disable_getup}
	if (<bail_disable_getup> = 1)
		return
	endif
	if ragdoll_anim_is_state \{rollout}
		return
	endif
	if isdoingragdollbail
		ragdoll_setstate \{state = physical_motion_not_driven_pose_used}
		printf \{"Ragdoll_Bail_Cancel_Getup"}
	endif
	if ragdoll_anim_is_state \{getup}
		ragdoll_anim_set_state \{fullragdoll}
	endif
endscript
Ragdoll_Bone_Checksums = [
	bone_pelvis
	bone_stomach_lower
	bone_thigh_l
	bone_thigh_r
	bone_bicep_r
	bone_neck
	bone_knee_l
	bone_bicep_l
	bone_knee_r
	bone_ankle_l
	bone_forearm_l
	bone_forearm_r
	bone_ankle_r
	bone_palm_l
	bone_palm_r
]

script CanBloodSplat 
	getsingletag \{bailtime}
	if NOT gotparam \{bailtime}
		return \{false}
	endif
	getsingletag \{lastbloodsplat}
	if gotparam \{lastbloodsplat}
		bloodinterval = 0.15
		if insplitscreengame
			bloodinterval = 0.5
		endif
		timediff = (<bailtime> - <lastbloodsplat>)
		if (<timediff> > <bloodinterval>)
			settags lastbloodsplat = <bailtime>
			return \{true}
		endif
	endif
	return \{false}
endscript

script Ragdoll_Bail_Blood 
	if NOT gotparam ForceBlood
		ForceBlood = 0
	endif
	if (<ForceBlood> = 0)
		if NOT CanBloodSplat
			return
		endif
	endif
	if (<pow> < 0.0)
		return
	endif
	if (<pow> > 100.0)
		pow = 100.0
	endif
	animsave_timestamp event = {type = bailhit magnitude = <pow>}
	obj_getboneposition bone = <bone>
	bonepos = (<x> * (1.0, 0.0, 0.0) + <y> * (0.0, 1.0, 0.0) + <z> * (0.0, 0.0, 1.0) + (0.0, 0.05, 0.0))
	if (RandomRange (0.0, 1.0) = 0)
		if FeelerCheck start_pos = (<bonepos> + (0.0, 1.0, 0.0)) end_pos = (<bonepos> - (0.0, 1.0, 0.0))
			getterraintypeparam param = treadactions terrain = <hit_terrain>
			begin
			if getnextarrayelement (<treadactions>.skaterrunparticleparms)
				getuniquecompositeobjectid preferredid = BailTerrain01
				createparticlesystem name = <uniqueid> pos = (<hit_pos>) params_script = <element>
			else
				break
			endif
			repeat
			getuniquecompositeobjectid preferredid = BailDust01
		endif
	endif
	dur = 0.1
	blood = BloodTiny
	if (<pow> > 50.0)
		dur = 0.2
		blood = BloodSmall
	endif
	if (<pow> > 90.0)
		dur = 0.3
		blood = BloodSmall
	endif
	vibrate actuator = 1 percent = <pow> duration = <dur>
	if NOT getglobalflag flag = $BLOOD_OFF
		if (RandomRange (0.0, 1.0) = 0)
			obj_getid
			obj_getvelocity
			normalizevector <vel>
			if (<length> > 1)
				normX = (<norm>.(1.0, 0.0, 0.0))
				normY = (<norm>.(0.0, 1.0, 0.0))
				normZ = (<norm>.(0.0, 0.0, 1.0))
				if (<normY> < 0)
					normY = (-1 * <normY>)
				endif
				if (<normY> < 0.25)
					normY = 0.25
				endif
				newNorm = (<normX> * (1.0, 0.0, 0.0) + <normY> * (0.0, 1.0, 0.0) + <normZ> * (0.0, 0.0, 1.0))
				newSpeed = ((1.0, 2.0) + <pow> * (0.01, 0.01))
				newNum = (32 + <pow> * 6.0)
				getuniquecompositeobjectid preferredid = BloodSpray01
				createglobalflexparticlesystem name = <uniqueid> pos = <bonepos> params_script = {
					$GP_BloodSpray01
					emit_target = <newNorm>
					speedrange = <newSpeed>
					emitnum = <newNum>
				}
			endif
		endif
		obj_spawnscriptlater <blood> params = {bone = <bone>}
		if (<pow> > 30.0)
			if NOT gotparam nosound
				soundevent event = generic_bail_blood_sfx
			endif
		endif
	endif
endscript

script ragdoll_sliding 
	ForceBlood = 0
	if insplitscreengame
		if CanBloodSplat
			ForceBlood = 1
		else
			return
		endif
	endif
	TagSlideFallFlag = 0
	getsingletag TagSlideFallFlag
	skaterloopingsound_settag tagslidefallvelocity = <velocity>
	skaterloopingsound_settag tagslidefallterrain = <terrain>
	if (<TagSlideFallFlag> = 0)
		spawnterrainsound action = slidefall velocity = <velocity> terrain = <terrain>
		settags TagSlideFallFlag = 1
	endif
	pow_limit = 10.0
	pow = ((<velocity> - <pow_limit>) * 30.0)
	if (<pow> > 40.0)
		pow = 40.0
	endif
	Ragdoll_Bail_Blood {
		pow = <pow>
		bone = (Random (@ bone_head @ bone_pelvis @ bone_stomach_upper @ bone_stomach_lower @ bone_bicep_l @ bone_bicep_r @ bone_thigh_l @ bone_thigh_r ))
		nosound
		ForceBlood = <ForceBlood>
	}
endscript

script ragdoll_sliding_ended 
	soundevent event = Bail_SlideFallOff_sfx terrain = <terrain> velocity = <velocity>
endscript

script ragdoll_hit_bone 
	ForceBlood = 0
	if insplitscreengame
		if CanBloodSplat
			ForceBlood = 1
		else
			return
		endif
	endif
	switch <bone>
		case bone_pelvis
		soundevent event = Bail_Nutter_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
			obj_spawnscriptnow sk8_CAS_Bail_Small_Grunts
		endif
		case bone_stomach_upper
		case bone_stomach_lower
		soundevent event = Bail_Torso_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
			obj_spawnscriptnow sk8_CAS_Bail_Large_Grunts
		endif
		case bone_head
		case bone_neck
		soundevent event = Bail_Head_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
			obj_spawnscriptnow sk8_CAS_Bail_Small_Grunts
		endif
		case bone_bicep_l
		case bone_forearm_l
		case bone_palm_l
		soundevent event = Bail_Left_Arm_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
			obj_spawnscriptnow sk8_CAS_Bail_Small_Grunts
		endif
		case bone_bicep_r
		case bone_forearm_r
		case bone_palm_r
		soundevent event = Bail_Right_Arm_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
			obj_spawnscriptnow sk8_CAS_Bail_Small_Grunts
		endif
		case bone_thigh_l
		case bone_knee_l
		case bone_ankle_l
		soundevent event = Bail_Left_Leg_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
			obj_spawnscriptnow sk8_CAS_Bail_Small_Grunts
		endif
		case bone_thigh_r
		case bone_knee_r
		case bone_ankle_r
		soundevent event = Bail_Right_Leg_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
			obj_spawnscriptnow sk8_CAS_Bail_Small_Grunts
		endif
		default
		soundevent event = Bail_Right_Arm_Hit_sfx terrain = <terrain> proj_velocity = <proj_velocity>
		if (<proj_velocity> > 40)
			obj_spawnscriptnow sk8_CAS_Bail_Large_Grunts
		endif
		if NOT gotparam accessory_bone
			return
		endif
	endswitch
	if NOT gotparam accessory_bone
		Ragdoll_Bail_Blood pow = (((<proj_velocity> - ($ragdoll_bail_collision_constants.hit_min_proj_velocity)) - 10.0) * 10.0) bone = <bone> nosound ForceBlood = <ForceBlood>
	endif
	if (<proj_velocity> > 40000.0)
		ragdoll_getvelocity
		normalizevector <vel>
		if (<length> > 30)
			printf channel = bail 'Bail Spaz (vel)! %f' f = <length>
			MakeSkaterGoto SkaterInit
		endif
	endif
endscript

script ragdoll_process_collisions 
	if isdoingragdollbail
		bailgetbailtime
		if (<bailtime> > 0.5)
			ragdoll_collision_process_collisions
		endif
	endif
endscript

script ragdoll_air_check 
	if (<collisions> = 0)
		baillastheightoffground
		if ragdoll_isatrest \{epsilon = 1.0}
			if (<last_height> < 0.2)
				return
			endif
		endif
		return \{in_air}
	endif
endscript

script IsInBailGoal 
	if gman_getactivatedgoalid
		gman_getgoaltype goal = <activated_goal_id>
		if NOT checksumequals a = <activated_goal_id> b = m_bail_bowlingplant
			if checksumequals a = <goal_type> b = bail
				return \{true}
			endif
			gman_getdata goal = <activated_goal_id>
			if gotparam \{bail_goal}
				return \{true}
			endif
		endif
	endif
	Ragdoll_Bail_Get_Settings
	if ((<bail_settings>.Force_Bail_Goal) = 1)
		return \{true}
	endif
	return \{false}
endscript

script Ragdoll_Bail_Check_Instant_Getup_Timeout 
	settags \{Ragdoll_Bail_Check_Instant_Getup_Flag = 0}
	wait \{0.75
		seconds}
	settags \{Ragdoll_Bail_Check_Instant_Getup_Flag = 1}
endscript

script Ragdoll_Bail_Check_Instant_Getup 
	if NOT export_isrecording
		if NOT IsInBailGoal
			if NOT gamemodeequals \{is_horse}
				Ragdoll_Bail_Check_Instant_Getup_Flag = 0
				getsingletag \{Ragdoll_Bail_Check_Instant_Getup_Flag}
				if (<Ragdoll_Bail_Check_Instant_Getup_Flag> = 1)
					if pressed \{square
							dur = 200}
						Ragdoll_Bail_Get_Settings
						if ((<bail_settings>.Allowed_FlashGetup) = 1)
							settags \{Ragdoll_Bail_Check_Instant_Getup_Flag = 0}
							MakeSkaterGoto \{Ragdoll_Bail_Flash_Respot}
							return \{true}
						endif
					endif
				endif
			endif
		endif
	endif
	return \{false}
endscript

script ragdoll_bail_off_world 
	if export_isrecording
		printf \{"Ragdoll_Bail_Off_World: Export_IsRecording is true, ending record"}
		change \{ve_recording_camera_hosed = Killed}
		skater :RecordSkaterAnimStop \{forced}
	endif
	MakeSkaterGoto \{Ragdoll_Bail_Flash_Respot}
endscript

script detect_dodgy_ragdoll_state 
	return
	if ragdoll_isactive
		ragdoll_bail_off_world
	endif
endscript

script ForcedBail 
	if ($cap_in_menu = 1)
		return
	endif
	ntt_fail_safe_cleanup
	MakeSkaterGoto \{ForcedBailLogicStuff}
endscript

script ForcedBailLogicStuff 
	if objectexists id = speech_box_anchor
		destroyscreenelement id = speech_box_anchor
	endif
	goal_trigger_dialog_kill
	if skating
		SetRollingFriction 0
		stopbalancetrick
		if onstall
			on_lip_or_stall = 1
		else
			if onlip
				on_lip_or_stall = 1
			endif
		endif
		if gotparam on_lip_or_stall
			stopbalancetrick
			setstate air
			move z = 1
			move y = 1
		endif
	endif
	goto Bail_Forced params = {impact_impulse = <impact_impulse> impact_bone = <impact_bone>}
endscript

script TriggeredBail 
	if NOT gotparam set_pos
		trigger_getlastcollision
		set_pos = <last_collision>
	endif
	getspeed
	obj_getvelocity
	printf "TriggeredBail Hit Speed = %f" f = <speed>
	if NOT gotparam set_speed
		set_speed = <speed>
	endif
	obj_getquat
	obj_stopmoving
	obj_setposition position = <set_pos>
	setspeed 0
	obj_getposition
	printf "TriggeredBail Pos = (%x,%y,%z)" x = (<pos>.(1.0, 0.0, 0.0)) y = (<pos>.(0.0, 1.0, 0.0)) z = (<pos>.(0.0, 0.0, 1.0))
	anim_updatepose
	wait 1 frame
	if isinbail
		return
	endif
	obj_setorientation quat = <quat>
	setspeed <set_speed>
	normalizevector <vel>
	ragdoll_setvelocitywhilemaintaininginternalvelocities vel = (<norm> * <set_speed>)
	my_bail_settings = {Initial_Force_Multiplier = 0.0 Initial_Force_Based_On_Velocity = 0}
	if getsingletag bail_settings
		my_bail_settings = (<bail_settings> + <my_bail_settings>)
	endif
	settags bail_settings = <my_bail_settings>
	ForcedBail
endscript
