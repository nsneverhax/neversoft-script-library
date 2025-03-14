enable_agents = 1
agent_anim_states_debug_text = 0
agent_weapon_decision_debug_text = 0
sg_prints = 0
ai_print_enabled = 1
fixed_weapon_debug = 0
combat_debug = 0
search_debug = 0
poi_debug = 0
spawn_node_debug = 0
nav_debug = 0
threat_debug = 0
damage_debug = 0
behavior_debug = 0
behavior_debug_radius = 60
uncontained_debug = 1
show_all_residents = 0
enable_vision_cheating = 1
combat_talker_debug = 0
path_blocked_debug = 0
nav_labels = 1
agent_anim_set_blend_lod_dist = 30

script waitforfix 
	printf " "
	printf "+++ you need to fix this error ++++++++"
	printf <...>
	printf "++++++++++++++++++++++ fix then qbr +++"
	printf " "
	printscriptinfo "script info called from waitforfix"
	printf " "
	block
endscript

script sg_printf 
	if ($sg_prints = 1)
		printf <...> bg_color = cyan tty = 2
	endif
endscript

script ai_printf 
	if ($ai_print_enabled = 1)
		printf <...> bg_color = cyan tty = 2
	endif
endscript

script sg_printstruct 
	if ($sg_prints = 1)
		printstruct <...>
	endif
endscript

script Agent_LaunchEvent 
	launchevent <...>
endscript

script Agent_BroadcastEvent 
	broadcastevent <...>
endscript

script Agent_WaitUntilStateFinished 
	blockuntilevent \{type = state_finished}
endscript

script printhiers 
	behavior_printallhierarchies
endscript

script printorders 
	behavior_printhierarchy \{hierarchy = order}
endscript

script printorder 
	behavior_printhierarchy \{hierarchy = order}
endscript

script printlogic 
	behavior_printhierarchy \{hierarchy = logic}
endscript

script printitem 
	behavior_printhierarchy \{hierarchy = item}
endscript

script printlife 
	behavior_printhierarchy \{hierarchy = life}
endscript

script printinteraction 
	behavior_printhierarchy \{hierarchy = interaction}
endscript

script printreaction 
	behavior_printhierarchy \{hierarchy = reaction}
endscript

script printreactions 
	behavior_printhierarchy \{hierarchy = reaction}
endscript

script printanim 
	behavior_printhierarchy \{hierarchy = animation}
endscript

script TogglePathBlockedDebug 
	if ($path_blocked_debug = 0)
		change \{path_blocked_debug = 1}
	else
		change \{path_blocked_debug = 0}
	endif
endscript

script ToggleNavLabels 
	if ($nav_labels = 0)
		change \{nav_labels = 1}
	else
		change \{nav_labels = 0}
	endif
endscript

script ToggleThreatDebug 
	if ($threat_debug = 0)
		change \{threat_debug = 1}
	else
		change \{threat_debug = 0}
	endif
endscript

script ToggleDamageDebug 
	if ($damage_debug = 0)
		change \{damage_debug = 1}
	else
		change \{damage_debug = 0}
	endif
endscript

script ToggleCombatTalkerDebug 
	if ($combat_talker_debug = 0)
		change \{combat_talker_debug = 1}
	else
		change \{combat_talker_debug = 0}
	endif
endscript
showNavDisplay = 1

script Agent_ToggleNavDisplay 
	if ($showNavDisplay = 1)
		change showNavDisplay = 0
		Agent_GetViewed
		if <viewed> :containscomponent name = navigation
			<viewed> :navigation_display
		endif
		if <viewed> :containscomponent name = locator
			<viewed> :locator_display
		endif
	else
		change showNavDisplay = 1
		Agent_GetViewed
		if <viewed> :containscomponent name = navigation
			<viewed> :navigation_display off
		endif
		if <viewed> :containscomponent name = locator
			<viewed> :locator_display off
		endif
	endif
	<viewed> :agent_printfactions
	<viewed> :agent_printareas
	<viewed> :agent_printinterests
	if <viewed> :containscomponent name = inventory
		<viewed> :inventory_printitems
	endif
	if <viewed> :containscomponent name = behaviorsystem
		<viewed> :behavior_printallhierarchies
	endif
endscript

script Agent_CutsceneStart 
	Disable_AI
endscript

script Agent_CutsceneEnd 
	Enable_AI
endscript

script TestSkaterAnim \{name = AnimTestSkater
		profile = $SkaterPed_Male}
	TestPedAnim name = <name> profile = <profile> anim = <anim>
endscript

script TestPedAnim name = AnimTestPed profile = $SkaterPed_Male_No_Skateboard anim = PedMBum_DM_Begging
	RecreatePed ped = <name> profile = <profile>
	wait 1 second
	if NOT anim_animexists anim = <anim>
		printf "couldn't find anim asset %a" a = <anim>
		soft_assert reason = "couldn't find anim asset"
		return
	endif
	<ped> :agent_playcustomanim anim = <anim> motion_extract = false blend_period = 0.2 pause_movement = true play_mode = loop
endscript

script agent_createlabel 
	setscreenelementlock id = root_window off
	createscreenelement {
		id = <id>
		parent = root_window
		type = textblockelement
		font = dialog
		scale = 0.8
		text = <text>
		pos3d = <pos3d>
		dims = (800.0, 440.0)
		just = [left top]
		rgba = [0 0 0 255]
		shadow
		shadow_rgba = [255 255 255 255]
		shadow_offs = (2.0, 2.0)
		internal_just = [left top]
		heap = debug
	}
endscript

script Agent_CreateBLOCKEDLabel 
	setscreenelementlock id = root_window off
	createscreenelement {
		id = <id>
		parent = root_window
		type = textblockelement
		font = dialog
		scale = 5.0
		text = <text>
		pos3d = <pos3d>
		dims = (800.0, 440.0)
		just = [left top]
		rgba = [255 0 0 255]
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
		internal_just = [left top]
		heap = debug
	}
endscript

script Agent_CreateSUSPENDEDLabel 
	setscreenelementlock id = root_window off
	createscreenelement {
		id = <id>
		parent = root_window
		type = textblockelement
		font = dialog
		scale = 2.0
		text = <text>
		pos3d = <pos3d>
		dims = (800.0, 440.0)
		just = [left top]
		rgba = [255 0 255 255]
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (2.0, 2.0)
		internal_just = [left top]
		heap = debug
	}
endscript

script Agent_Hide 
	navcollision_enable \{off}
	if containscomponent \{name = charactercollision}
		charcollision_enable \{off}
	endif
	agent_getvehicle
	if gotparam \{vehicle}
		<vehicle> :hide
		<vehicle> :pause
	endif
	hide
	pause
endscript

script Agent_Show 
	unpause
	navcollision_enable \{on}
	if containscomponent \{name = charactercollision}
		charcollision_enable \{on}
	endif
	agent_getvehicle
	if gotparam \{vehicle}
		<vehicle> :unpause
		<vehicle> :unhide
	endif
	unhide
endscript

script ConvertNumToChecksum 
	manglechecksum a = 0 b = <num_id>
	return {id = <mangled_id>}
endscript

script ReCreateBoard \{name = TestBoard}
	if (compositeobjectexists <name>)
		<name> :die
	endif
	CreateBoard <...>
	return {board = <board>}
endscript

script CreateBoard profile = $skateboard_item_profile name = TestBoard
	printf "//\\\\ skateboard params"
	printstruct <...>
	printstruct $skateboard_item_profile
	object_params = {<profile>
		name = <name>
		object_type = object_type_ped
		scale = 1.0}
	createcompositeobject {
		components = (($ai_items).skateboard.components)
		params = <object_params>
	}
	<name> :agent_finalizeinitialization
	<name> :Teleport object = skater
	return {board = <name>}
endscript

script CreatePedOnHorse \{ped = TestPed
		horse = TestHorse}
	CreatePed ped = <ped> item = <item> profile = <profile>
	<ped> :CreateHorseUnderneath horse = <horse>
	return {ped = <ped> horse = <horse>}
endscript

script CreatePedAtPlayer \{spawn_node_name = player1}
	CreatePed <...>
endscript

script CreatePedAtPos ped_skates = 0
	getuniquecompositeobjectid preferredid = <ped>
	if NOT gotparam quat
		player1 :obj_getquat
	endif
	<lod_dist2> = (<profile>.lod_dist2)
	if (<ped_skates> = 1)
		<lod_dist2> = (<profile>.suspenddistance)
	endif
	createfromstructure {
		pos = <pos>
		quat = <quat>
		name = <uniqueid>
		class = pedestrian
		type = Ped_Outlaw_1
		compassbliptype = <compassbliptype>
		createdatstart
		triggerscript = <triggerscript>
		profile = <profile>
		suspenddistance = (<profile>.suspenddistance)
		lod_dist1 = (<profile>.lod_dist1)
		lod_dist2 = <lod_dist2>
		debug_creation
		clonefrom = <clonefrom>
		spawn_pos = <pos>
		assetcontext = <assetcontext>
	}
	if gotparam item
		<uniqueid> :__GiveItem <item>
	endif
	return {ped = <uniqueid>}
endscript

script CreatePed profile = $SkaterPed_Male_No_Skateboard ped = TestPed
	if NOT gotparam spawn_node_name
		printf "CreatePed must specify a spawn_node_name (using player1)"
		<spawn_node_name> = player1
	endif
	getuniquecompositeobjectid preferredid = <ped>
	player1 :obj_getposition
	player1 :obj_getquat
	createfromstructure {
		pos = <pos>
		quat = <quat>
		name = <uniqueid>
		class = pedestrian
		type = Ped_Outlaw_1
		compassbliptype = <compassbliptype>
		createdatstart
		triggerscript = <triggerscript>
		profile = <profile>
		suspenddistance = 60
		lod_dist1 = 10
		lod_dist2 = 100
		debug_creation
		clonefrom = <clonefrom>
		spawn_node_name = <spawn_node_name>
	}
	if gotparam item
		<uniqueid> :__GiveItem <item>
	endif
	return {ped = <uniqueid>}
endscript

script CreateHorse \{profile = Ped_Horse
		horse = TestHorse}
	player1 :obj_getposition
	player1 :obj_getquat
	createfromstructure {
		pos = <pos>
		quat = <quat>
		name = <horse>
		class = pedestrian
		type = horse
		skeletonname = anl_horse
		profile = <profile>
		suspenddistance = 0
		lod_dist1 = 4
		lod_dist2 = 7.5
	}
	<horse> :Teleport object = player1
	return {horse = <horse>}
endscript

script CreateCow profile = Ped_Cow cow = TestCow
	getuniquecompositeobjectid preferredid = <cow>
	player1 :obj_getposition
	player1 :obj_getquat
	createfromstructure {
		pos = <pos>
		quat = <quat>
		name = <uniqueid>
		class = pedestrian
		type = Cow_01
		createdatstart
		skeletonname = anl_cow
		model = "animals\\cow\\anl_cow.skin"
		profile = <profile>
		extra_anims = animload_Anl_Cow
		suspenddistance = 0
		lod_dist1 = 4
		lod_dist2 = 7.5
		RidableByHero
	}
	blockuntilobjectvalid object = <uniqueid>
	if gotparam object_invalid
		return
	endif
	<uniqueid> :Teleport object = player1
	<uniqueid> :standidle BlockUntilFinished
	return {cow = <uniqueid>}
endscript

script ReCreateLifePed \{ped = TestPed}
	if (compositeobjectexists <ped>)
		<ped> :die
	endif
	CreateLifePed ped = <ped>
	return {ped = <ped>}
endscript

script CreateLifePed \{ped = TestPed}
	player1 :obj_getposition
	new_ped = {
		pos = <pos>
		ped_type = ped_life
		name = <ped>
		priority = 5
	}
	SpawnAmbientObject <new_ped>
	<ped> :Teleport object = player1
	wait \{1
		gameframe}
	return {ped = <ped>}
endscript

script SafeCreateLifePed \{ped = TestPed}
	if NOT (compositeobjectexists <ped>)
		CreateLifePed {ped = <ped>}
	endif
	<ped> :Teleport object = player1
	return {ped = <ped>}
endscript

script RecreatePed \{ped = TestPed}
	if (compositeobjectexists <ped>)
		<ped> :die
	endif
	CreatePed {<...>}
	return {ped = <ped>}
endscript

script CreateFriend 
	CreatePed {<...> profile = Profile_TestFriend}
	return {ped = <ped>}
endscript

script RecreateFriend \{ped = TestFriend}
	if (compositeobjectexists <ped>)
		<ped> :die
	endif
	CreatePed {<...> profile = Profile_TestFriend}
	return {ped = <ped>}
endscript

script CreateEnemy 
	CreatePed {<...> profile = Profile_TestEnemy}
	return {ped = <ped>}
endscript

script RecreateEnemy \{ped = TestEnemy}
	if (compositeobjectexists <ped>)
		<ped> :die
	endif
	CreateEnemy {<...>}
	return {ped = <ped>}
endscript

script RecreateBystander \{ped = TestEnemy}
	if (compositeobjectexists <ped>)
		<ped> :die
	endif
	CreatePed {<...> profile = Profile_TestByStander}
	return {ped = <ped>}
endscript

script CreateBystander \{ped = TestEnemy}
	CreatePed {<...> profile = Profile_TestByStander}
	return {ped = <ped>}
endscript

script SpawnFromNode 
	if iscreated \{TestPed}
		TestPed :die
		wait \{1
			frame}
	endif
	new_ped = {
		priority = $coim_priority_pedlife
		scene_ped = false
		ped_type = ped_life
		spawn_node_name = <node>
		name = TestPed
		spawn_zone = global
	}
	SpawnAmbientObject <new_ped>
endscript

script SafeCreatePed \{ped = TestPed}
	if NOT (compositeobjectexists <ped>)
		CreatePed {ped = <ped> item = <item>}
	endif
	return {ped = <ped>}
endscript

script SafeCreatePedOnHorse \{ped = TestPed
		horse = TestHorse}
	SafeCreatePed ped = <ped> item = <item>
	SafeCreateHorse horse = <horse>
	<ped> :mounthorse horse_name = <horse> BlockUntilFinished
	return {ped = <ped> horse = <horse>}
endscript

script ReCreatePedOnHorse \{ped = TestPed
		horse = TestHorse}
	if (compositeobjectexists <ped>)
		<ped> :die
	endif
	if (compositeobjectexists <horse>)
		<horse> :die
	endif
	CreatePedOnHorse ped = <ped> horse = <horse>
	return {horse = <horse> ped = <ped>}
endscript

script ReCreateFriendOnHorse \{ped = TestPed
		horse = TestHorse}
	if (compositeobjectexists <ped>)
		<ped> :die
	endif
	if (compositeobjectexists <horse>)
		<horse> :die
	endif
	CreatePedOnHorse ped = <ped> horse = <horse> profile = Profile_TestFriend
	return {horse = <horse> ped = <ped>}
endscript

script ReCreateEnemyOnHorse \{ped = TestPed
		horse = TestHorse}
	if (compositeobjectexists <ped>)
		<ped> :die
	endif
	if (compositeobjectexists <horse>)
		<horse> :die
	endif
	CreatePedOnHorse ped = <ped> horse = <horse> profile = Profile_TestEnemy
	return {horse = <horse> ped = <ped>}
endscript

script RecreateHorse \{horse = TestHorse}
	if (compositeobjectexists <horse>)
		<horse> :die
	endif
	CreateHorse {horse = <horse>}
	return {horse = <horse>}
endscript

script RecreateCow \{cow = TestCow}
	if (compositeobjectexists <cow>)
		<cow> :die
	endif
	CreateCow {cow = <cow>}
	return {cow = <cow>}
endscript

script SafeCreateHorse \{horse = TestHorse}
	if NOT (compositeobjectexists <horse>)
		CreateHorse {horse = <horse>}
	endif
	return {horse = <horse>}
endscript

script Agent_Creation 
	if NOT compositeobjectexists name = <name>
		if NodeExists <name>
			forced_create name = <name>
		else
			CreatePed ped = <name>
			wait \{1
				frame}
		endif
	endif
endscript

script Agent_Recreation 
	if NodeExists <name>
		forced_create name = <name>
	else
		RecreatePed ped = <name>
		wait \{1
			frame}
	endif
endscript

script CreateHorseUnderneath 
	printf "_________creating horse under ped"
	if agent_hasvehicle
		scriptassert "Agent_CreateHorseUnderneath  - agent already has a vehicle"
	endif
	agent_getspecies
	if NOT (<species> = human)
		scriptassert "Agent_CreateHorseUnderneath  - can only create horses under humans"
	endif
	obj_getid
	if NOT gotparam horse
		appendsuffixtochecksum base = <objid> suffixstring = '_horse'
		<horse> = <appended_id>
	endif
	RecreateHorse horse = <horse>
	<horse> :Teleport object = <objid>
	Interest_SetVehicle vehicle = <horse>
	ai_giveorder name = Bv_PlaceOnVehicle params = {attach_type = driver}
endscript

script ForcedCreateOnVehicle 
	if NOT gotparam agent
		scriptassert "No agent specified"
	endif
	forced_create name = <agent>
	if NOT gotparam vehicle
		scriptassert "No vehicle specified"
	endif
	<agent> :Interest_SetVehicle vehicle = <vehicle>
	printf "==============teleport============"
	<agent> :Teleport object = <vehicle>
	<agent> :ai_giveorder name = Bv_PlaceOnVehicle params = {attach_type = <attach_type>
		attach_node_name = <attach_node_name>}
endscript
dummy_nav_components = [
	{
		component = suspend
	}
	{
		component = bbox
	}
	{
		component = motion
	}
	{
		component = pedlife
	}
	{
		component = lockobj
		off
	}
	{
		component = agent
	}
	{
		component = locator
	}
	{
		component = navigation
	}
	{
		component = eventcache
	}
	{
		component = behaviorsystem
	}
	{
		component = seek
	}
	{
		component = navcollision
	}
]
dummy_nav_creation_params = {
	suspenddistance = 10
	lod_dist1 = 3.75
	lod_dist2 = 6.25
	navigation = nav_dummy
	anim_profile = [
		default_horse_anim_profile
	]
	species = horse
}
dummy_nav_profile = {
	dummy_nav_creation_params
	faction = faction_empty
}

script ReCreateDummy 
	if (compositeobjectexists <id>)
		<id> :die
	endif
	SafeCreateDummy id = <id>
	return {dummy = <dummy>}
endscript

script CreateDummy 
	SafeCreateDummy id = <id>
	return {dummy = <dummy>}
endscript

script SafeCreateDummy \{id = dummy}
	if (compositeobjectexists <id>)
		return {dummy = <id>}
	endif
	createcompositeobjectinstance {priority = coim_priority_permanent
		heap = generic
		oldheap = com
		components = dummy_nav_components
		params = {name = <id>
			profile = dummy_nav_profile
			dummy_nav_profile}
	}
	return {dummy = <id>}
endscript
coach_horse_suffixs = [
	'_horse1'
	'_horse2'
	'_horse3'
	'_horse4'
	'_horse5'
	'_horse6'
]
coach_dummy_suffixs = [
	'_dummy1'
	'_dummy2'
	'_dummy3'
]

script ReCreateHorses id = horses num_horses = 4 row_distance = 2.5 column_distance = 0.5
	if NOT (<num_horses> = 2)
		if NOT (<num_horses> = 4)
			if NOT (<num_horses> = 6)
				soft_assert "num_horses must be 2, 4 or 6"
			endif
		endif
	endif
	<neg_column_distance> = (0 - <column_distance>)
	<rows> = (<num_horses> / 2)
	<row> = 0
	begin
	<suffix> = ($coach_dummy_suffixs [<row>])
	appendsuffixtochecksum base = <id> suffixstring = <suffix>
	<agent> = <appended_id>
	ReCreateDummy id = <agent>
	if (<row> = 0)
		<leader> = <agent>
	else
		<agent> :ai_giveorder name = Bv_HitchTo params = {destination_id = <hitch_to>
			distance = <row_distance>}
	endif
	<hitch_to> = <agent>
	<suffix> = (coach_horse_suffixs [(<row> * 2)])
	appendsuffixtochecksum base = <id> suffixstring = <suffix>
	<agent> = <appended_id>
	RecreateHorse horse = <agent>
	<agent> :navigation_display
	<left_offset> = ((1.0, 0.0, 0.0) * (<neg_column_distance>))
	<agent> :ai_giveorder name = Bv_LockTo params = {destination_id = <hitch_to>
		relative_offset_type = movement
		relative_offset = <left_offset>}
	<suffix> = (coach_horse_suffixs [((<row> * 2) + 1)])
	appendsuffixtochecksum base = <id> suffixstring = <suffix>
	<agent> = <appended_id>
	RecreateHorse horse = <agent>
	<agent> :navigation_display
	<right_offset> = ((1.0, 0.0, 0.0) * (<column_distance>))
	<agent> :ai_giveorder name = Bv_LockTo params = {destination_id = <hitch_to>
		relative_offset_type = movement
		relative_offset = <right_offset>}
	<row> = (<row> + 1)
	repeat <rows>
	if gotparam node
		<leader> :Teleport node = <node>
	endif
	return {leader = <leader>}
endscript

script __GiveItem 
	if gotparam pistol
		inventory_giveitem {item_id = PISTOL_01}
		inventory_fillloadeduses {item_type_id = primaryweapon item_slot_id = pistol}
		inventory_enableinfinitecarrieduses {item_type_id = primaryweapon item_slot_id = pistol}
	else
		if gotparam rifle
			inventory_giveitem {item_id = RIFLE_01}
			inventory_fillloadeduses {item_type_id = primaryweapon item_slot_id = rifle}
			inventory_enableinfinitecarrieduses {item_type_id = primaryweapon item_slot_id = rifle}
		else
			if gotparam shotgun
				inventory_giveitem {item_id = SHOTGUN_01}
				inventory_fillloadeduses {item_type_id = primaryweapon item_slot_id = shotgun}
				inventory_enableinfinitecarrieduses {item_type_id = primaryweapon item_slot_id = shotgun}
			else
				if gotparam melee
					inventory_giveitem {item_id = tomahawk}
					inventory_fillloadeduses {item_type_id = meleeweapon item_slot_id = axe}
				else
					inventory_giveitem {item_id = PISTOL_01}
					inventory_fillloadeduses {item_type_id = primaryweapon item_slot_id = pistol}
				endif
			endif
		endif
	endif
endscript

script Residence_Display 
	if gotparam \{off}
		change \{show_static_residents = 1}
		change \{show_all_residents = 1}
	else
		change \{show_static_residents = 1}
		change \{show_all_residents = 1}
	endif
endscript

script Avoidance_Display 
	if gotparam \{off}
		change \{show_avoidance = 0}
	else
		change \{show_avoidance = 1}
	endif
endscript

script NavMesh_Display \{detail = terrain}
	printf \{"NavMesh_Display"}
	ss_displayshapes detail = <detail>
endscript
