
script goal_script_peds_create_ped ped_skates = 0
	if NOT gotparam profile
		<profile> = Ped_Generic_GoalPed
	endif
	CreatePedAtPos {
		pos = <pos>
		quat = <quat>
		ped = <ped_id>
		profile = <profile>
		assetcontext = <goal_id>
		compassbliptype = <compassbliptype>
		ped_skates = <ped_skates>
	}
	<ped_id> :obj_getposition
	if gotparam tags
		<ped_id> :settags <tags>
	endif
	if gotparam quat
		<ped_id> :obj_setorientation quat = <quat>
	endif
	if gotparam proxim_init_params
		if structurecontains structure = <proxim_init_params> enter_proxim_script
			<enter_proxim_script> = (<proxim_init_params>.enter_proxim_script)
			if structurecontains structure = <proxim_init_params> inner_radius
				<inner_radius> = (<proxim_init_params>.inner_radius)
			endif
		else
			<inner_radius> = 10.0
		endif
		if structurecontains structure = <proxim_init_params> exit_proxim_script
			<exit_proxim_script> = (<proxim_init_params>.exit_proxim_script)
			if structurecontains structure = <proxim_init_params> outer_radius
				<outer_radius> = (<proxim_init_params>.outer_radius)
			endif
		else
			<outer_radius> = 15.0
		endif
		if structurecontains structure = <proxim_init_params> proxim_script_params
			<proxim_script_params> = (<proxim_init_params>.proxim_script_params)
		endif
		<ped_id> :proximity_init {
			innerradius = <inner_radius>
			outerradius = <outer_radius>
			enterproximityscript = <enter_proxim_script>
			exitproximityscript = <exit_proxim_script>
			proximityscriptparams = <proxim_script_params>
		}
		<ped_id> :proximity_registertriggerobject player1 capsuleheight = 5
	endif
	if NOT gotparam behavior
		<behavior> = bv_agent
	else
		printf "Goal ped %a has a predefined behavior %b" a = <ped_id> b = <behavior>
	endif
	if NOT gotparam areas
		printf "Goal ped %a does not have areas set" a = <ped_id>
	else
		<ped_id> :agent_setinteractareas interact_areas = <areas>
	endif
	if gotparam no_skater_interaction
		<ped_id> :agent_setstats stats = stats_critical_ped
	endif
	<ped_id> :Agent_GiveOrder name = <behavior>
	if gotparam create_script
		<create_script> <create_params>
	endif
endscript

script goal_spectator_peds_init 
	if objectexists id = <ped_id>
		<ped_id> :ai_giveorder name = Bv_LookAt params = {name = skater}
		<ped_id> :locator_settraveler traveler = terrain_anywhere
		<ped_id> :obj_spawnscript goal_spectator_peds_cheer
	endif
endscript

script goal_spectator_peds_cheer 
	begin
	Random (
		@ <anim_name> = PedM_DP_Cheer02_F
		@ <anim_name> = PedM_DP_Cheer03_F
		@ <anim_name> = PedM_DP_Cheer04_F
		@ <anim_name> = PedM_Cheer01_P
		@ <anim_name> = PedM_Cheer03_P
		@ <anim_name> = PedM_Clap01_P
		@ <anim_name> = PedM_Clap02_P
		@ <anim_name> = PedM_Clap03_P
		@ <anim_name> = PedM_Clap04_P
		@ <anim_name> = PedM_FarAttention01_P
		@ <anim_name> = PedM_FarAttention02_P
		@ <anim_name> = PedM_FarAttention03_P
		@ <anim_name> = PedM_AudienceIdle01_F
		@ <anim_name> = PedM_AudienceIdle02_F
		@ <anim_name> = PedM_AudienceIdle03_F
		@ <anim_name> = PedM_AudienceIdle04_F
		@ <anim_name> = PedM_AudienceIdle05_F
		)
	agent_playcustomanim anim = <anim_name> motion_extract = false blend_period = 0.2 pause_movement = true play_mode = loop
	getrandomvalue name = wait_time a = 5 b = 15 integer
	wait <wait_time> seconds
	agent_finishcustomanim
	wait 1 second
	repeat
endscript

script goal_spectator_peds_jeer 
	begin
	Random (
		@ <anim_name> = PedM_Disappointed01_P
		@ <anim_name> = PedM_Disappointed02_P
		@ <anim_name> = PedM_Disappointed03_P
		@ <anim_name> = PedM_Disappointed04_P
		@ <anim_name> = PedM_Disappointed05_P
		@ <anim_name> = PedM_Disappointed07_P
		@ <anim_name> = PedM_DP_Jeer03_F
		@ <anim_name> = PedM_Jeer01_F
		@ <anim_name> = PedM_Jeer02_F
		)
	agent_playcustomanim anim = <anim_name> motion_extract = false blend_period = 0.2 pause_movement = true play_mode = loop
	getrandomvalue name = wait_time a = 5 b = 15 integer
	wait <wait_time> seconds
	agent_finishcustomanim
	wait 1 second
	repeat
endscript

script goal_spectator_peds_idle 
	begin
	Random (
		@ <anim_name> = PedM_AudienceIdle01_F
		@ <anim_name> = PedM_AudienceIdle02_F
		@ <anim_name> = PedM_AudienceIdle03_F
		@ <anim_name> = PedM_AudienceIdle04_F
		@ <anim_name> = PedM_AudienceIdle05_F
		@ <anim_name> = PedM_GangstaIdle02_F
		)
	agent_playcustomanim anim = <anim_name> motion_extract = false blend_period = 0.2 pause_movement = true play_mode = loop
	getrandomvalue name = wait_time a = 5 b = 15 integer
	wait <wait_time> seconds
	agent_finishcustomanim
	wait 1 second
	repeat
endscript

script goal_spectator_crowd_cheer 
	begin
	Random (
		@ <anim_name> = PedM_DP_Cheer02_F
		@ <anim_name> = PedM_DP_Cheer03_F
		@ <anim_name> = PedM_DP_Cheer04_F
		@ <anim_name> = PedM_Cheer01_P
		@ <anim_name> = PedM_Cheer03_P
		@ <anim_name> = PedM_Clap01_P
		@ <anim_name> = PedM_Clap02_P
		@ <anim_name> = PedM_Clap03_P
		@ <anim_name> = PedM_Clap04_P
		@ <anim_name> = PedM_FarAttention01_P
		@ <anim_name> = PedM_FarAttention02_P
		@ <anim_name> = PedM_FarAttention03_P
		)
	gameobj_playanim anim = <anim_name>
	gameobj_waitanimfinished
	repeat
endscript

script goal_spectator_crowd_jeer 
	begin
	Random (
		@ <anim_name> = PedM_Disappointed01_P
		@ <anim_name> = PedM_Disappointed02_P
		@ <anim_name> = PedM_Disappointed03_P
		@ <anim_name> = PedM_Disappointed04_P
		@ <anim_name> = PedM_Disappointed05_P
		@ <anim_name> = PedM_Disappointed07_P
		@ <anim_name> = PedM_DP_Jeer03_F
		@ <anim_name> = PedM_Jeer01_F
		@ <anim_name> = PedM_Jeer02_F
		@ <anim_name> = PedM_Clap04_P
		)
	gameobj_playanim anim = <anim_name>
	gameobj_waitanimfinished
	repeat
endscript
