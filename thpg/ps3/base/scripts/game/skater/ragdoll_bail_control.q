Ragdoll_Bail_Force_Multiplier = 0.0
Ragdoll_Bail_Default_Throttle_Back = 1.0
Ragdoll_Bail_Tweakable_Settings = {
	Initial_Force_Multiplier = 0.05
	Initial_Force_Based_On_Velocity = 1
	Stick_Force_Multiplier = 0.0
	Stick_Force_Multiplier_Up = 0.0
	Ollie_Force_Multiplier = 0.0
	Allowed_Rollouts = 1
	Allowed_FlashGetup = 1
	Cap_Bail_Time = 1.0
	Restrict_Stick = no
	Force_Bail_Goal = 0
	Gravity_Override = 1.0
}

script Ragdoll_Bail_Get_Settings 
	if getsingletag \{bail_settings}
		return bail_settings = ($Ragdoll_Bail_Tweakable_Settings + <bail_settings>)
	else
		return \{bail_settings = $Ragdoll_Bail_Tweakable_Settings}
	endif
endscript

script ragdoll_bail_update 
	if Ragdoll_Bail_Check_Instant_Getup
		return
	endif
	Ragdoll_Bail_Get_Settings
	settags bailtime = <bailtime>
	if islocalskater
	endif
endscript

script ragdoll_bail_startbail 
	skatercam0 :enableplayerinput
	enableplayerinput
	if ($Ragdoll_Bail_Use_Leaderboard = 1)
		if NOT innetgame
		endif
	endif
	Ragdoll_Quit_Bail_Message_UI
	input_debounce \{x
		time = 0.25
		clear = 1}
	input_debounce \{square
		time = 0.25}
	settags \{lastbloodsplat = 0.0}
endscript

script ragdoll_bail_endbail 
	obj_killspawnedscript \{name = BloodSmall}
	obj_killspawnedscript \{name = BloodTiny}
	obj_killspawnedscript \{name = BloodSplat}
	obj_killspawnedscript \{name = SkaterBloodOn}
	ResetSkaterParticleSystems
	broadcastevent type = event_bail_complete data = {bail_points = <rounded_points> hosp_bill = <rounded_points>}
	spawnscriptlater \{ui_ragdoll_destroy_elements}
	removetags \{bail_settings}
	removetags \{bail_disable_getup}
	ragdoll_collision_clear_callbacks
endscript
