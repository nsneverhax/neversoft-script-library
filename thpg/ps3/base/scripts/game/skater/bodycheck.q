create_ragdoll_offset_feeler_height = 2.0
body_check_ragdoll_min_dist_to_ground = 0.1
body_check_rehit_delay = 5.0
body_check_hit_perfect_start = 75
body_check_hit_perfect_end = 135
body_check_velocity_bonus_speed = 15
body_check_post_hit_end_state_delay0 = 0.35000002
body_check_post_hit_air_recovery_time = 0.15
body_check_post_hit_end_state_delay1 = 200
body_check_start_hit = 0.0
body_check_hit_range_time = 400
body_check_force_player_knock_down = 1
body_check_timing_bonus = 33.0
body_check_vel_bonus = 33.0
body_check_reaction_recovery_delay = 0.3
body_check_death_delay = 3
body_check_not_at_rest_speed = 1.0
body_check_allow_ped_death = 1
body_check_ped_damage = 45.0
body_check_max_offset = 0.5
body_check_lerp_reaction_time = 0.05
body_check_front_offset = 1.5
body_check_lerp_height_offset = 0.2
body_check_min_check_velocity = 2.0
body_check_min_lerp_adj_speed = 10.0
body_check_override_powerup_level = -1
body_check_powerup0_angle_up = 0.2
body_check_powerup1_angle_up = 0.4
body_check_powerup2_angle_up = 0.2
body_check_powerup0_impulse_strength_factor = 1.1
body_check_powerup1_impulse_strength_factor = 1.1
body_check_powerup2_impulse_strength_factor = 1.2
body_check_powerup0_impulse_strength_const = 1.0
body_check_powerup1_impulse_strength_const = 1.0
body_check_powerup2_impulse_strength_const = 2.0
body_check_powerup0_impulse_bone = bone_stomach_lower
body_check_powerup1_impulse_bone = bone_neck
body_check_powerup2_impulse_bone = bone_stomach_lower
body_check_powerup0_max_vel_consideration = 13.0
body_check_powerup1_max_vel_consideration = 13.0
body_check_powerup2_max_vel_consideration = 13.0
body_check_powerup_post_max_slope_adj = 3.0
body_check_show_const_impulse_data = 0
body_check_attacker_bone_array = [
	bone_bicep_l
	bone_forearm_l
	bone_palm_l
	bone_bicep_r
	bone_forearm_r
	bone_palm_r
]
body_check_attacker_radius = 0.4
body_check_target_offset = 0.9
body_check_target_height = 3.0
body_check_target_radius = 0.75
body_check_show_attack_spheres = 0
GrindBodyCheckTricks = [
	{
		trigger = {
			Press
			l2
			300
		}
		scr = body_check_state
		params = {
			state = Grind
			dir = up
		}
	}
]
ManualBodyCheckTricks = [
	{
		trigger = {
			Press
			l2
			300
		}
		scr = body_check_state
		params = {
			state = Manual
			dir = up
		}
	}
]
AirBodyCheckTricks = [
	{
		trigger = {
			Press
			l2
			300
		}
		scr = body_check_state
		params = {
			state = air
			dir = up
		}
	}
]
GroundBodyCheckTricks = [
	{
		trigger = {
			Press
			l2
			500
		}
		scr = body_check_state
		params = {
			state = ground
			dir = up
		}
	}
]

script get_body_check_tricks 
	switch <state>
		case air
		return \{body_check_tricks = AirBodyCheckTricks}
		case Manual
		return \{body_check_tricks = ManualBodyCheckTricks}
		case Grind
		return \{body_check_tricks = GrindBodyCheckTricks}
		default
		return \{body_check_tricks = GroundBodyCheckTricks}
	endswitch
endscript

script body_check_set_tricks 
	if NOT skaterprofile_isabilityactive \{ability = bodycheck_on}
		return
	endif
	get_body_check_tricks <...>
	setqueuetricks <body_check_tricks> add push_front
endscript

script body_check_get_powerup_level 
	level = 0
	if skaterprofile_isabilityactive \{ability = bodycheck_uppercut}
		<level> = (<level> + 1)
	endif
	if skaterprofile_isabilityactive \{ability = bodycheck_charge_check}
		<level> = (<level> + 2)
	endif
	if ($body_check_override_powerup_level > -1)
		<level> = $body_check_override_powerup_level
	endif
	return level = <level>
endscript

script body_check_get_powerup_adjusted_values 
	body_check_get_powerup_level
	switch <level>
		case 0
		angle = $body_check_powerup0_angle_up
		impulse = $body_check_powerup0_impulse_strength_factor
		impulse_const = $body_check_powerup0_impulse_strength_const
		bone = $body_check_powerup0_impulse_bone
		max_vel = $body_check_powerup0_max_vel_consideration
		case 1
		angle = $body_check_powerup1_angle_up
		impulse = $body_check_powerup1_impulse_strength_factor
		impulse_const = $body_check_powerup1_impulse_strength_const
		bone = $body_check_powerup1_impulse_bone
		max_vel = $body_check_powerup1_max_vel_consideration
		case 2
		angle = $body_check_powerup2_angle_up
		impulse = $body_check_powerup2_impulse_strength_factor
		impulse_const = $body_check_powerup2_impulse_strength_const
		bone = $body_check_powerup2_impulse_bone
		max_vel = $body_check_powerup2_max_vel_consideration
		case 3
		angle = $body_check_powerup1_angle_up
		impulse = $body_check_powerup2_impulse_strength_factor
		impulse_const = $body_check_powerup2_impulse_strength_const
		bone = $body_check_powerup2_impulse_bone
		max_vel = $body_check_powerup2_max_vel_consideration
	endswitch
	if getglobalflag flag = $CHEAT_SUPER_CHECK
		<impulse> = 50.0
		<impulse_const> = 50.0
		<angle> = 0.2
	endif
	return {
		impulse_strength_factor = <impulse>
		impulse_strength_const = <impulse_const>
		angle_up = <angle>
		impulse_bone = <bone>
		max_vel_consideration = <max_vel>
	}
endscript

script body_check_perfect_timing 
	getelapsedtime starttime = <starttime>
	if (<elapsedtime> > $body_check_hit_perfect_start)
		if (<elapsedtime> < $body_check_hit_perfect_end)
			<damage> = (<damage> + $body_check_timing_bonus)
			perfect_timing = 1
		endif
	endif
	return <...>
endscript

script body_check_body_check_vel_bonus 
	getspeed
	if (<speed> > $body_check_velocity_bonus_speed)
		<damage> = (<damage> + $body_check_vel_bonus)
		velocity_bonus = 1
	endif
	return <...>
endscript

script body_check_do_hit 
	if ishidden
		printf 'body_check_do_hit - Suppressed'
		return
	endif
	body_check_get_powerup_adjusted_values
	if bodycheck_securetarget
		bodycheck_hitped {
			damage = <damage>
			angle_up = <angle_up>
			impulse_strength_factor = <impulse_strength_factor>
			impulse_strength_const = <impulse_strength_const>
			impulse_bone = <impulse_bone>
			max_vel_consideration = <max_vel_consideration>
		}
		had_hit = 1
	endif
	if NOT gotparam had_hit
		soundevent event = shoulder_check_miss_SFX
		return ped_hit = 0 ped_id = <ped_id>
	endif
	soundevent event = shoulder_check_SFX
	killspawnedscript name = body_check_fx
	obj_spawnscriptlater body_check_fx
	return ped_hit = 1 ped_id = <ped_id>
endscript

script body_check_hit_next_ped 
	damage = $body_check_ped_damage
	body_check_perfect_timing <...>
	body_check_body_check_vel_bonus <...>
	body_check_do_hit damage = <damage>
	if (<ped_hit> = 1)
		<velocity_hit> = false
		<perfect_timing_hit> = false
		getelapsedtime starttime = <starttime>
		if gotparam velocity_bonus
			if NOT hide_any_hud_display
				spawnscriptnow ui_display_message params = {type = alert color = amber text = "High Velocity!"}
			endif
			<velocity_hit> = true
		endif
		if gotparam perfect_timing
			if NOT hide_any_hud_display
				if gotparam velocity_bonus
					<check> = Random (@ 0 @ 1 )
					if (<check> = 1)
						spawnscriptnow ui_display_message params = {type = alert color = amber text = "High Velocity!\\nPerfect Timing!"}
					else
						spawnscriptnow ui_display_message params = {type = alert color = amber text = "Perfect Timing!\\nHigh Velocity!"}
					endif
				else
					spawnscriptnow ui_display_message params = {type = alert color = amber text = "Perfect Timing!"}
				endif
			endif
			<perfect_timing_hit> = true
		endif
		getspeed
		<speed> = (<speed> / 10.0)
		vel_speed = (<speed> / 2.0)
		if (<vel_speed> < 1.0)
			<vel_speed> = 1.0
		endif
		amp_speed = <speed>
		ShakeCamera duration = 0.3 vert_amp = (0.2 * <amp_speed>) vert_vel = (12.0 * <vel_speed>)
		settrickname "Skate Check"
		settrickscore 1000
		display
		GMan_TrackCombat target = ped ped_id = <ped_id> velocity = <velocity_hit> perfect = <perfect_timing_hit>
	endif
	return <...>
endscript

script body_check_exit_hit_loop 
	bodycheck_sethit \{value = 0}
endscript

script body_check_hit_loop 
	onexitrun body_check_exit_hit_loop
	bodycheck_sethit value = 1
	ped_hit = 0
	hit_this_frame = 0
	hit_any_frame = 0
	getstarttime
	begin
	body_check_get_powerup_level
	if gotparam infinite
		<level> = 3
	endif
	multi_hit = false
	if (<level> > 1)
		<hit_this_frame> = 0
		<multi_hit> = true
	endif
	if (<hit_this_frame> = 0)
		begin
		<ped_hit> = 0
		body_check_hit_next_ped <...>
		if (<ped_hit> = 0)
			break
		endif
		<hit_this_frame> = 1
		<hit_any_frame> = 1
		if (<multi_hit> = false)
			break
		endif
		repeat
	endif
	if (<hit_this_frame> = 1)
		<ped_hit> = 1
		default_vibrate_effect percent = 100 duration = 0.2
	endif
	if gotparam infinite
		getspeed
		if (<speed> < 5.0)
			setspeed 5.0
		endif
	else
		getelapsedtime starttime = <starttime>
		if (<elapsedtime> > $body_check_hit_range_time)
			break
		endif
	endif
	wait 1 gameframe
	repeat
	return ped_hit = <hit_any_frame>
endscript

script body_check_exit 
	if NOT gettemppedhitflag
		if NOT (<state> = air)
			landskatertricks no_balance_reset
		endif
		settemppedhitflag value = 0
	endif
	removetags [onground_from_index]
	if anim_animnodeexists id = ongroundextras
		anim_command {
			target = ongroundextras
			command = degenerateblend_addbranch
			params = {
				tree = $blank_animbranch
				blendduration = 0.1
				params = {}
			}
		}
	endif
	setbodycheckinvinciblephase onoff = 0
	setbodycheckstate onoff = 0
	bodycheck_sethit value = 0
	bodycheck_getairattacklanding
	unsetdoingtrick
	killspawnedscript name = body_check_flip_control_check
endscript

script body_check_state 
	HandleEndRunCases
	settemppedhitflag value = 0
	setbodycheckstate onoff = 1
	onexitrun body_check_exit params = {<...>}
	obj_spawnscriptnow body_check_flip_control_check params = {<...>}
	bodycheck_setairattacklanding value = 0
	ClearTrickQueues
	setqueuetricks NoTricks
	setmanualtricks NoTricks
	killextratricks
	setbodycheckinvinciblephase onoff = 1
	settrickname ""
	settrickscore 0
	display blockspin
	if (<state> = air)
		if innollie
			flipandrotate
			nollieoff
			Skater_PlayOllieAnim $Ollie_data
		endif
		Skater_PlayFlipTrickAnim $Air_SkateCheck_data
	else
		body_check_get_powerup_level
		switch <level>
			case 0
			anim_data = $BodyCheck_Basic_Data
			case 1
			anim_data = $BodyCheck_Charge_Data
			case 2
			anim_data = $BodyCheck_Multi_Data
			case 3
			anim_data = $BodyCheck_MultiCharge_Data
		endswitch
		on_ground_anim = 0
		if (<state> = Manual)
			<on_ground_anim> = 1
		endif
		if (<state> = Grind)
			<on_ground_anim> = 1
		endif
		if innollie
			nollieoff
			<on_ground_anim> = 1
		endif
		if (<on_ground_anim> = 1)
			Skater_PlayOnGroundAnim sync = 0 no_land = 1 blendduration = 0.1
			wait 1 gameframe
		endif
		if anim_animnodeexists id = ongroundextras
			cleareventhandlergroup OngroundAnims
			GetOngroundDiffBlendDuration to = (<anim_data>.struct)
			CaptureOngroundDiff
			anim_command {
				target = ongroundextras
				command = degenerateblend_addbranch
				params = {
					tree = $OnGround_Land_Branch
					blendduration = <blendduration>
					params = {
						<anim_data>
						speed_threshold = $ground_speed_threshold
						sync = 0
					}
				}
			}
		endif
	endif
	wait $body_check_start_hit seconds
	body_check_hit_loop <...>
	settemppedhitflag value = <ped_hit>
	if (<ped_hit> = 0)
		setbodycheckinvinciblephase onoff = 0
	endif
	wait $body_check_post_hit_air_recovery_time seconds
	if (<state> = air)
		bodycheck_setairattacklanding value = 1
	endif
	wait_time = ($body_check_post_hit_end_state_delay0 - $body_check_post_hit_air_recovery_time)
	wait <wait_time> seconds
	body_check_set_tricks <...>
	getstarttime
	begin
	DoNextTrick
	wait 1 gameframe
	getelapsedtime starttime = <starttime>
	if (<elapsedtime> > $body_check_post_hit_end_state_delay1)
		break
	endif
	repeat
	WaitAnimWhilstChecking timer = bodytimer
	switch <state>
		case air
		MakeSkaterGoto Airborne params = {no_anim}
		case Manual
		goto Manual params = {
			name = "Manual"
			score = 0
			AnimData = $manual_data
			ExtraTricks2 = ManualBranches
			extratricks = FlatlandBranches
			CheckCheese
			AllowWallpush
			AllowRepeat
			no_transition
		}
		case Grind
		goto Trick_5050_BS params = {
			NoBlend = yes
			rootname = <trick_name>
		}
	endswitch
	landskatertricks
	goto ongroundai params = {}
endscript

script try_to_knock_down_object 
	if isinbodycheck
		return
	endif
	allow_knock = 0
	if bodycheck_trytohitskater
		<allow_knock> = 1
	endif
	if ($body_check_force_player_knock_down = 1)
		<allow_knock> = 1
	endif
	if (<allow_knock> = 0)
		BailSkaterTricks
		ShakeCamera duration = 0.3 vert_amp = 0.2 vert_vel = 12.0
		return
	endif
	if ($cap_in_menu = 0)
		if NOT skater :isinendofrun
			MakeSkaterGoto PedKnockdown params = {impact_impulse = <impact_impulse> impact_bone = <impact_bone>}
		endif
	endif
	GMan_TrackCombat target = skater ped_id = <ped_id>
endscript

script try_to_knock_down_skater 
	obj_getid
	ped_id = <objid>
	getskaterid
	<objid> :try_to_knock_down_object ped_id = <ped_id> impact_impulse = <impact_impulse> impact_bone = <impact_bone>
endscript

script body_check_flip_control_check 
	getstarttime
	begin
	if (<state> = air)
		if bodycheck_hasflipcommand
			settrickname \{""}
			settrickscore \{0}
			display \{spinonly}
			settemppedhitflag \{value = 1}
			MakeSkaterGoto \{Airborne
				params = {
				}}
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script body_check_fx 
	Skater_Get_Viewport
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = skateCheckDOF1
		screenfx_addfxinstance {
			viewport = <viewport>
			name = skateCheckDOF1
			($SkateCheck_tod_manager.screen_fx [0])
		}
	endif
	wait \{0.3
		seconds}
	if screenfx_fxinstanceexists viewport = <viewport> name = skateCheckDOF1
		screenfx_removefxinstance viewport = <viewport> name = skateCheckDOF1
	endif
endscript

script exit_body_check_manual 
	setbodycheckinvinciblephase \{onoff = 0}
endscript

script body_check_manual 
	onexitrun \{exit_body_check_manual}
	setbodycheckinvinciblephase \{onoff = 1}
	body_check_hit_loop \{infinite}
endscript
