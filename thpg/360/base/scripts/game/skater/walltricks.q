wallride_push_away_from_wall_on_wallie = 0.0
wall_ride_out_air_matrix_lerp_time = 0.075
WallRide_AnimBranch_Standard = {
	type = skaterflip
	[
		{
			type = boardrotate
			[
				{
					type = posecapture
					id = BodyPoseCapture
					[
						{
							type = wallridetimer
							id = bodytimer
							anim = anim
							[
								{
									id = bodysource
									type = source
									anim = anim
								}
							]
						}
					]
				}
			]
		}
	]
}
WallRideExceptionTable = [
	{
		response = switch_script
		event = landed
		scr = land
		params = {
			IgnoreAirTime
			ForceBlendperiodOut = 0.2
			no_anim
			no_bail
		}
	}
	{
		response = switch_script
		event = Ollied
		scr = Wallie
		params = {
			pose_capture = 0
		}
	}
	{
		response = switch_script
		event = groundgone
		scr = WallrideEnd
	}
	{
		response = switch_script
		event = pointrail
		scr = pointrail
	}
	{
		response = switch_script
		event = pointrailspin
		scr = pointrailspin
	}
	{
		response = switch_script
		event = skatercollidebail
		scr = skatercollidebail
	}
]

script wallride 
	onexceptionrun
	reseteventhandlersfromtable WallRideExceptionTable
	cancelrotatedisplay
	LaunchStateChangeEvent state = Skater_OnWall
	vibrate actuator = 1 percent = 40
	obj_clearflag $FLAG_SKATER_MANUALCHEESE
	if gotparam left
		move x = 0.025
	else
		move x = -0.025
	endif
	if bailison
		setstate air
		printf "WallRide Bail"
		return
	endif
	GetSkaterVelocity
	min_wallride_vert_vel = 7.0
	if (<vel_y> > 0.0)
		if (<vel_y> < <min_wallride_vert_vel>)
			SetSkaterVelocity vel_x = <vel_x> vel_y = <min_wallride_vert_vel> vel_z = <vel_z>
		endif
	endif
	bailoff
	cleartrickqueue
	removexevents
	setqueuetricks WallRideTricks
	nollieoff
	settrickscore 200
	spawnterrainsound action = wallride
	if gotparam left
		left = 1
		if NOT flipped
			BS_Wallride = 1
		endif
	else
		right = 1
		if flipped
			BS_Wallride = 1
		endif
	endif
	if backwards
		rotate
		flip
	endif
	if gotparam BS_Wallride
		settrickname "BS Wallride"
	else
		settrickname "FS Wallride"
	endif
	Skater_PlayOnGroundAnim blendduration = 0.0
	display blockspin
	begin
	default_vibrate_effect percent = 25
	tweaktrick 25
	WallrideTrail left = <left> right = <right>
	wait 1 frame
	DoNextTrick
	repeat
endscript

script WallRide_PlayAnim 
	anim_command {
		target = body
		command = degenerateblend_addbranch
		params = {
			tree = $WallRide_AnimBranch_Standard
			blendduration = <blendperiod>
			params = {
				anim = <anim>
			}
		}
	}
endscript
splat_position_bias = 0.025

script WallrideTrail 
	params = {
		material = sys_skidmark_sys_skidmark
		size = 0.15240002
		radius = 0
		trail
		lifetime = 15
	}
	texturesplat bone = bone_board_truck_back <params>
	texturesplat bone = BONE_BOARD_TRUCK_NOSE <params>
endscript

script WallrideEnd 
	BlendperiodOut \{0.3}
	seteventhandler \{event = landed
		scr = land
		response = switch_script}
	cleareventhandlergroup \{`default`}
	onexceptionrun
	if inair
		goto \{Airborne
			params = {
			}}
	endif
endscript

script Wallie pose_capture = 1
	DoNextTrick
	vibrate actuator = 1 percent = 50 duration = 0.1
	Skater_PlayOllieAnim $Ollie_data pose_capture = <pose_capture>
	settrickname "Wallie"
	settrickscore 250
	InAirExceptions
	display blockspin
	jump
	if NOT istrue ($wallride_push_away_from_wall_on_wallie = 0)
		getwallnormal
		wall_push = (<wall_normal> * 2.0)
		GetSkaterVelocity
		vel = ((<vel_x> * (1.0, 0.0, 0.0)) + (<vel_y> * (0.0, 1.0, 0.0)) + (<vel_z> * (0.0, 0.0, 1.0)))
		<vel> = (<vel> + (<wall_push> * $wallride_push_away_from_wall_on_wallie))
		SetSkaterVelocity vel_x = (<vel> [0]) vel_y = (<vel> [1]) vel_z = (<vel> [2])
	endif
	goto Airborne params = {no_anim}
endscript
WallRideTricks = [
	{
		trigger = {
			PressAndRelease
			up
			x
			500
		}
		scr = Trick_WalliePlant
	}
	{
		trigger = {
			PressAndRelease
			left
			x
			500
		}
		scr = Trick_WallridePlant_left
	}
	{
		trigger = {
			PressAndRelease
			right
			x
			500
		}
		scr = Trick_WallridePlant_right
	}
]

script Trick_WalliePlant 
	cleartrickqueue
	InAirExceptions
	vibrate \{actuator = 1
		percent = 50
		duration = 0.1}
	Skater_PlayOllieAnim \{$Boneless_data}
	settrickname \{"WalliePlant"}
	settrickscore \{500}
	display \{blockspin}
	jump \{bonelessheight}
	goto \{Airborne
		params = {
			no_anim
		}}
endscript

script Trick_WallridePlant_left 
	if iswallrideonleft
		goto \{Wallie}
	endif
	Trick_WallridePlant
endscript

script Trick_WallridePlant_right 
	if NOT iswallrideonleft
		goto \{Wallie}
	endif
	Trick_WallridePlant
endscript

script Trick_WallridePlant 
	cleartrickqueue
	InAirExceptions
	vibrate \{actuator = 1
		percent = 50
		duration = 0.1}
	Skater_PlayOllieAnim \{$Ollie_data}
	settrickname \{"WallridePlant"}
	settrickscore \{700}
	display \{blockspin}
	jump
	wallrideplantsidewaysboost
	goto \{Airborne
		params = {
			no_anim
		}}
endscript
WALLPLANT_WINDOW = 280
wallplant_trick = [
	{
		Press
		x
		WALLPLANT_WINDOW
	}
]
Post_Wallplant_No_Ollie_Window = 100
Post_Wallplant_Allow_Ollie_Window = 250
WallplantOllie = [
	{
		trigger = {
			tap
			x
			Post_Wallplant_Allow_Ollie_Window
		}
		scr = ollie
		params = {
			jumpspeed = 5
		}
	}
]

script Air_WallPlant 
	static_tree_ik_on
	name = "Wallplant"
	score = 750
	anim = WallPlant_Ollie3
	flip
	if bailison
		setstate air
		printf "WallPlant Bail"
		SetRollingFriction 2.5
		return
	endif
	obj_clearflag $FLAG_SKATER_MANUALCHEESE
	nollieoff
	InAirExceptions
	cleareventhandler Ollied
	onexceptionrun
	LaunchStateChangeEvent state = Skater_InWallplant
	vibrate actuator = 1 percent = 100 duration = 0.1
	addtocumulativerecord ability = Wallplant score = 1
	skater_playanim anim = <anim> blendperiod = 0
	settrickname <name>
	settrickscore <score>
	display blockspin
	settrickname ""
	settrickscore 0
	display spinonly
	getstarttime
	begin
	getelapsedtime starttime = <starttime>
	if (<elapsedtime> > $Post_Wallplant_No_Ollie_Window)
		break
	endif
	DoNextTrick
	wait 1 gameframe
	repeat
	cleareventbuffer buttons = [x] olderthan = 0
	SetSkaterAirTricks AllowWallplantOllie
	SetSkaterAirTricks
	Skater_WaitAnim percent = 25
	WaitAnimWhilstChecking
	Skater_PlayOllieAnim $Ollie_data groundgone = 1
	goto Airborne params = {no_anim skip_ik_off}
endscript

script vert_wallplant 
	LaunchStateChangeEvent state = Skater_InWallplant
	vibrate actuator = 1 percent = 100 duration = 0.1
	settrickname ""
	settrickscore 0
	display blockspin
	skater_playanim anim = VertPlant blendperiod = 0.0 speed = 1.0
	onexitrun TagClearFlagsScript
	settrickname "Vert Wallplant"
	settrickscore 750
	display
	getstarttime
	begin
	getelapsedtime starttime = <starttime>
	if (<elapsedtime> > $Post_Wallplant_No_Ollie_Window)
		break
	endif
	DoNextTrick
	wait 1 gameframe
	repeat
	cleareventbuffer buttons = [x] olderthan = 0
	Skater_WaitAnim percent = 60
	goto Airborne
endscript

script Ground_Wallpush 
	Init_Wallpush
	if crouched
		skater_playanim \{anim = Wallplant_Crouched
			blendperiod = 0}
	else
		skater_playanim \{anim = Wallplant_Standing
			blendperiod = 0}
	endif
	BlendperiodOut \{0}
	boardrotateafter
	flipafter
	settrickname \{"Wallpush"}
	settrickscore \{10}
	display \{blockspin}
	WaitWhilstChecking \{AndManuals
		duration = physics_disallow_rewallpush_duration}
	landskatertricks
	WaitAnimWhilstChecking \{AndManuals}
	goto \{ongroundai}
endscript

script Manual_CancelWallpushEvent 
	cancelwallpush
endscript
Wallpush_Trick = {
	name = "Wallpush"
	score = 10
	NoBlend
	transition_start = NoseManual_out_Wallpush
	transition_end = Manual_in_Wallpush
	AnimData = $manual_data
	offmetertop = ManualBail
	offmeterbottom = ManualLand
	ExtraTricks2 = ManualBranches
	extratricks = FlatlandBranches
	AllowWallpush
}
NoseWallpush_Trick = {
	name = "Wallpush"
	score = 10
	NoBlend
	transition_start = Manual_out_Wallpush
	transition_end = NoseManual_in_Wallpush
	AnimData = $nosemanual_data
	Nollie
	offmetertop = ManualLand
	offmeterbottom = NoseManualBail
	ExtraTricks2 = NoseManualBranches
	extratricks = FlatlandBranches
	AllowWallpush
}

script Manual_Wallpush 
	getsingletag \{in_manual_land}
	if gotparam \{in_manual_land}
		if (<in_manual_land> = 1)
			Ground_Wallpush
			return
		endif
	endif
	Init_Wallpush
	BlendperiodOut \{0}
	if gotparam \{ToNoseManual}
		goto \{Manual
			params = {
				$NoseWallpush_Trick
			}}
	else
		goto \{Manual
			params = {
				$Wallpush_Trick
			}}
	endif
endscript

script Init_Wallpush 
	broadcastevent \{type = SkaterWallpush}
	vibrate \{actuator = 1
		percent = 50
		duration = 0.15}
endscript
