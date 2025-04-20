
script jow_stars 
	printf "*******************************************************************"
	printf <...>
	printf "*******************************************************************"
endscript

script Indoor_Proxim 
	if gotparam destroyed
		return
	endif
	<proximtriggerid> :gettags
	if NOT gotparam Indoor_Proxim
		Indoor_Proxim = 0
		<proximtriggerid> :settags Indoor_Proxim = <Indoor_Proxim>
	endif
	if gotparam inside
		<proximtriggerid> :settags Indoor_Proxim = (<Indoor_Proxim> + 1)
		switch <triggerid>
			case object
			<proximtriggerid> :SkaterParticles_DestroySkatingGfx
			if <proximtriggerid> :skating
				if NOT <proximtriggerid> :inair
					<proximtriggerid> :SkaterParticles_CreateSkatingGfx
				endif
			endif
		endswitch
	elseif NOT gotparam created
		<proximtriggerid> :settags Indoor_Proxim = (<Indoor_Proxim> -1)
		switch <triggerid>
			case object
			<proximtriggerid> :SkaterParticles_DestroySkatingGfx
			if <proximtriggerid> :skating
				if NOT <proximtriggerid> :inair
					<proximtriggerid> :SkaterParticles_CreateSkatingGfx
				endif
			endif
		endswitch
	endif
endscript

script Create_Board_Fire_FX objid = skater
	Destroy_Board_Fire_FX objid = <objid>
	if NOT gotparam NOFIRE
		safegetuniquecompositeobjectid preferredid = BoardFireFX01 objid = <objid>
		createflexibleparticlesystem name = <uniqueid> objid = <objid> bone = bone_board_deck params_script = $GP_PH_PropaneBoardFire01
		getflexibleparticlesystem name = <uniqueid> objid = <objid>
		if gotparam systemid
			<objid> :settags boardFireID01 = <systemid>
		endif
		safegetuniquecompositeobjectid preferredid = BoardFireFX02 objid = <objid>
		createflexibleparticlesystem name = <uniqueid> objid = <objid> bone = BONE_BOARD_TRUCK_NOSE params_script = $GP_PH_PropaneBoardFire01
		getflexibleparticlesystem name = <uniqueid> objid = <objid>
		if gotparam systemid
			<objid> :settags boardFireID02 = <systemid>
		endif
		safegetuniquecompositeobjectid preferredid = BoardFireFX03 objid = <objid>
		createflexibleparticlesystem name = <uniqueid> objid = <objid> bone = bone_board_truck_back params_script = $GP_PH_PropaneBoardFire01
		getflexibleparticlesystem name = <uniqueid> objid = <objid>
		if gotparam systemid
			<objid> :settags boardFireID03 = <systemid>
		endif
		safegetuniquecompositeobjectid preferredid = BoardSparkFX01 objid = <objid>
		createflexibleparticlesystem name = <uniqueid> objid = <objid> bone = bone_board_deck params_script = $GP_PH_PropaneBoardSparks01
		getflexibleparticlesystem name = <uniqueid> objid = <objid>
		if gotparam systemid
			<objid> :settags boardSparksID01 = <systemid>
		endif
		safegetuniquecompositeobjectid preferredid = BoardSparkFX02 objid = <objid>
		createflexibleparticlesystem name = <uniqueid> objid = <objid> bone = BONE_BOARD_TRUCK_NOSE params_script = $GP_PH_PropaneBoardSparks01
		getflexibleparticlesystem name = <uniqueid> objid = <objid>
		if gotparam systemid
			<objid> :settags boardSparksID02 = <systemid>
		endif
		safegetuniquecompositeobjectid preferredid = BoardSparkFX03 objid = <objid>
		createflexibleparticlesystem name = <uniqueid> objid = <objid> bone = bone_board_truck_back params_script = $GP_PH_PropaneBoardSparks01
		getflexibleparticlesystem name = <uniqueid> objid = <objid>
		if gotparam systemid
			<objid> :settags boardSparksID03 = <systemid>
		endif
	endif
	if NOT gotparam NOSMOKE
		safegetuniquecompositeobjectid preferredid = BoardSmokeFX01 objid = <objid>
		createflexibleparticlesystem name = <uniqueid> objid = <objid> bone = bone_board_deck params_script = $GP_PH_PropaneBoardSmoke01
		getflexibleparticlesystem name = <uniqueid> objid = <objid>
		if gotparam systemid
			<objid> :settags boardSmokeID01 = <systemid>
		endif
		safegetuniquecompositeobjectid preferredid = BoardSmokeFX02 objid = <objid>
		createflexibleparticlesystem name = <uniqueid> objid = <objid> bone = BONE_BOARD_TRUCK_NOSE params_script = $GP_PH_PropaneBoardSmoke01
		getflexibleparticlesystem name = <uniqueid> objid = <objid>
		if gotparam systemid
			<objid> :settags boardSmokeID02 = <systemid>
		endif
		safegetuniquecompositeobjectid preferredid = BoardSmokeFX03 objid = <objid>
		createflexibleparticlesystem name = <uniqueid> objid = <objid> bone = bone_board_truck_back params_script = $GP_PH_PropaneBoardSmoke01
		getflexibleparticlesystem name = <uniqueid> objid = <objid>
		if gotparam systemid
			<objid> :settags boardSmokeID03 = <systemid>
		endif
	endif
	if gotparam time
		wait <time> seconds
		Destroy_Board_Fire_FX objid = <objid>
	endif
endscript

script Destroy_Board_Fire_FX objid = skater
	<objid> :gettags
	if gotparam SpecialTrickFX
		<objid> :removetags [SpecialTrickFX]
	endif
	if gotparam boardFireID01
		if compositeobjectexists name = <boardFireID01>
			<boardFireID01> :unpause
			<boardFireID01> :emitrate rate = 0
			<boardFireID01> :destroy ifempty = 1
		endif
		<objid> :removetags [boardFireID01]
	endif
	if gotparam boardFireID02
		if compositeobjectexists name = <boardFireID02>
			<boardFireID02> :unpause
			<boardFireID02> :emitrate rate = 0
			<boardFireID02> :destroy ifempty = 1
		endif
		<objid> :removetags [boardFireID02]
	endif
	if gotparam boardFireID03
		if compositeobjectexists name = <boardFireID03>
			<boardFireID03> :unpause
			<boardFireID03> :emitrate rate = 0
			<boardFireID03> :destroy ifempty = 1
		endif
		<objid> :removetags [boardFireID03]
	endif
	if gotparam boardSparksID01
		if compositeobjectexists name = <boardSparksID01>
			<boardSparksID01> :unpause
			<boardSparksID01> :emitrate rate = 0
			<boardSparksID01> :destroy ifempty = 1
		endif
		<objid> :removetags [boardSparksID01]
	endif
	if gotparam boardSparksID02
		if compositeobjectexists name = <boardSparksID02>
			<boardSparksID02> :unpause
			<boardSparksID02> :emitrate rate = 0
			<boardSparksID02> :destroy ifempty = 1
		endif
		<objid> :removetags [boardSparksID02]
	endif
	if gotparam boardSparksID03
		if compositeobjectexists name = <boardSparksID03>
			<boardSparksID03> :unpause
			<boardSparksID03> :emitrate rate = 0
			<boardSparksID03> :destroy ifempty = 1
		endif
		<objid> :removetags [boardSparksID03]
	endif
	if gotparam boardSmokeID01
		if compositeobjectexists name = <boardSmokeID01>
			<boardSmokeID01> :unpause
			<boardSmokeID01> :emitrate rate = 0
			<boardSmokeID01> :destroy ifempty = 1
		endif
		<objid> :removetags [boardSmokeID01]
	endif
	if gotparam boardSmokeID02
		if compositeobjectexists name = <boardSmokeID02>
			<boardSmokeID02> :unpause
			<boardSmokeID02> :emitrate rate = 0
			<boardSmokeID02> :destroy ifempty = 1
		endif
		<objid> :removetags [boardSmokeID02]
	endif
	if gotparam boardSmokeID03
		if compositeobjectexists name = <boardSmokeID03>
			<boardSmokeID03> :unpause
			<boardSmokeID03> :emitrate rate = 0
			<boardSmokeID03> :destroy ifempty = 1
		endif
		<objid> :removetags [boardSmokeID03]
	endif
endscript

script Do_Bird_FX 
	if ($video_editor_in_video_editor = 1)
		return
	endif
	if inside
		if iscreated <birdName>
			getnode <birdName>
			getuniquecompositeobjectid preferredid = birdFX01
			createparticlesystem name = <uniqueid> pos = (<node>.pos) params_script = $GP_PH_Seagulls_TakeOff_Left01_01
			getuniquecompositeobjectid preferredid = birdFX01
			createparticlesystem name = <uniqueid> pos = (<node>.pos) params_script = $GP_PH_Seagulls_TakeOff_Right01_01
			safekill nodename = <birdName>
		endif
	elseif NOT gotparam created
		safecreate nodename = <birdName>
	endif
endscript

script Do_Bird_FX_Line_FlyLeft 
	if ($video_editor_in_video_editor = 1)
		return
	endif
	printf \{"gotbirds"}
	if inside
		if iscreated <birdName>
			getnode <birdName>
			getuniquecompositeobjectid \{preferredid = birdFX02}
			createparticlesystem name = <uniqueid> pos = (<node>.pos) params_script = $GP_PH_Seagulls_Line_FlyLeft
			safekill nodename = <birdName>
		endif
	elseif NOT gotparam \{created}
		safecreate nodename = <birdName>
	endif
endscript

script Do_Bird_FX_Line_FlyLeft_Low 
	if ($video_editor_in_video_editor = 1)
		return
	endif
	if inside
		if iscreated <birdName>
			getnode <birdName>
			getuniquecompositeobjectid \{preferredid = birdFX03}
			createparticlesystem name = <uniqueid> pos = (<node>.pos) params_script = $GP_PH_Seagulls_Line_FlyLeft_Low
			safekill nodename = <birdName>
		endif
	elseif NOT gotparam \{created}
		safecreate nodename = <birdName>
	endif
endscript

script Do_Bird_FX_Line_StraightUP 
	if ($video_editor_in_video_editor = 1)
		return
	endif
	if inside
		if iscreated <birdName>
			getnode <birdName>
			getuniquecompositeobjectid preferredid = birdFX04
			createparticlesystem name = <uniqueid> pos = (<node>.pos) params_script = $GP_PH_Seagulls_StraightUP_Left
			getuniquecompositeobjectid preferredid = birdFX04
			createparticlesystem name = <uniqueid> pos = (<node>.pos) params_script = $GP_PH_Seagulls_StraightUP_Right
			safekill nodename = <birdName>
		endif
	elseif NOT gotparam created
		safecreate nodename = <birdName>
	endif
endscript

script Do_Bird_FX_Line_StraightUP_Left 
	if ($video_editor_in_video_editor = 1)
		return
	endif
	if inside
		if iscreated <birdName>
			getnode <birdName>
			getuniquecompositeobjectid \{preferredid = birdFX05}
			createparticlesystem name = <uniqueid> pos = (<node>.pos) params_script = $GP_PH_Seagulls_StraightUP_Left02
			safekill nodename = <birdName>
		endif
	elseif NOT gotparam \{created}
		safecreate nodename = <birdName>
	endif
endscript

script Do_Leaf_FX \{color = TWIGS
		density = 10}
	if inside
		<proximtriggerid> :obj_killspawnedscript id = Leaf_FX
		<proximtriggerid> :obj_spawnscript Create_Leaf_FX id = Leaf_FX params = {<...>}
	else
		if NOT gotparam \{created}
			<proximtriggerid> :obj_killspawnedscript id = Leaf_FX
			Destroy_Leaf_FX <...>
		endif
	endif
endscript

script Create_Leaf_FX color = TWIGS density = 10
	Destroy_Leaf_FX <...>
	switch <color>
		case DEAD_TREE_LARGE
		getuniquecompositeobjectid preferredid = LeafFX1
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_pelvis params_script = $GP_PH_Treedust_large_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID1 = <mangled_id>
		<proximtriggerid> :settags leafFXID1 = <leafFXID1>
		getuniquecompositeobjectid preferredid = LeafFX2
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_pelvis params_script = $GP_PH_TreeTwigs_Large_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID2 = <mangled_id>
		<proximtriggerid> :settags leafFXID2 = <leafFXID2>
		case DEAD_TREE_SMALL
		getuniquecompositeobjectid preferredid = LeafFX1
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_pelvis params_script = $GP_PH_Tree_Dust_Small_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID1 = <mangled_id>
		<proximtriggerid> :settags leafFXID1 = <leafFXID1>
		getuniquecompositeobjectid preferredid = LeafFX2
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_pelvis params_script = $GP_PH_TanTree_Burst_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID2 = <mangled_id>
		<proximtriggerid> :settags leafFXID2 = <leafFXID2>
		case LEAVES_GROUND
		getuniquecompositeobjectid preferredid = LeafFX1
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> params_script = $GP_TER_Leaves_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID1 = <mangled_id>
		<proximtriggerid> :settags leafFXID1 = <leafFXID1>
		leafFXID2 = jow_nil
		case DEAD_BUSH
		getuniquecompositeobjectid preferredid = LeafFX1
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_pelvis params_script = $GP_PH_BushBits_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID1 = <mangled_id>
		<proximtriggerid> :settags leafFXID1 = <leafFXID1>
		getuniquecompositeobjectid preferredid = LeafFX2
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_knee_l params_script = $GP_PH_Bush_Dust_Small_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID2 = <mangled_id>
		<proximtriggerid> :settags leafFXID2 = <leafFXID2>
		case GREEN_BUSH_BITS
		getuniquecompositeobjectid preferredid = LeafFX1
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_knee_l params_script = $GP_PH_GreenBush_Bits_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID1 = <mangled_id>
		<proximtriggerid> :settags leafFXID1 = <leafFXID1>
		leafFXID2 = jow_nil
		case TREE_MAPLE_LEAF_ORANGE
		getuniquecompositeobjectid preferredid = LeafFX1
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_pelvis params_script = $GP_PH_Tree_Maple_Leaves_Orange_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID1 = <mangled_id>
		<proximtriggerid> :settags leafFXID1 = <leafFXID1>
		leafFXID2 = jow_nil
		case TREE_MAPLE_LEAF_GREEN
		getuniquecompositeobjectid preferredid = LeafFX1
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_pelvis params_script = $GP_PH_Tree_Maple_Leaves_Green_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID1 = <mangled_id>
		<proximtriggerid> :settags leafFXID1 = <leafFXID1>
		leafFXID2 = jow_nil
		case GREEN_BUSH_BITS_01
		getuniquecompositeobjectid preferredid = LeafFX1
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_knee_l params_script = $GP_PH_Green_Bush_Bits_02
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID1 = <mangled_id>
		<proximtriggerid> :settags leafFXID1 = <leafFXID1>
		leafFXID2 = jow_nil
		case MALL_FLOWERS
		getuniquecompositeobjectid preferredid = LeafFX1
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_knee_l params_script = $GP_PH_Mall_Flowers
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID1 = <mangled_id>
		<proximtriggerid> :settags leafFXID1 = <leafFXID1>
		leafFXID2 = jow_nil
		case GreenLeaves_Burst_Small
		getuniquecompositeobjectid preferredid = LeafFX1
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_pelvis params_script = $GP_PH_GreenLeaves_Burst_Small_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID1 = <mangled_id>
		<proximtriggerid> :settags leafFXID1 = <leafFXID1>
		leafFXID2 = jow_nil
		case OrangeLeaves_Burst_Small
		getuniquecompositeobjectid preferredid = LeafFX1
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_pelvis params_script = $GP_PH_OrangeTree_Burst_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID1 = <mangled_id>
		<proximtriggerid> :settags leafFXID1 = <leafFXID1>
		leafFXID2 = jow_nil
		case TanTree_Burst
		getuniquecompositeobjectid preferredid = LeafFX1
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_pelvis params_script = $GP_PH_TanTree_Burst_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID1 = <mangled_id>
		<proximtriggerid> :settags leafFXID1 = <leafFXID1>
		leafFXID2 = jow_nil
		case WEEDS
		getuniquecompositeobjectid preferredid = LeafFX1
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> params_script = $GP_PH_Weeds_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID1 = <mangled_id>
		<proximtriggerid> :settags leafFXID1 = <leafFXID1>
		leafFXID2 = jow_nil
		case LANSDOWNE_LEAVES
		getuniquecompositeobjectid preferredid = LeafFX1
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_chest params_script = $GP_PH_Lansdowne_Leaves_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID1 = <mangled_id>
		<proximtriggerid> :settags leafFXID1 = <leafFXID1>
		leafFXID2 = jow_nil
		case BELL_TREE_01
		getuniquecompositeobjectid preferredid = LeafFX1
		createflexibleparticlesystem name = <uniqueid> objid = <proximtriggerid> bone = bone_chest params_script = $GP_PH_BellTree_01
		manglechecksums a = <uniqueid> b = <proximtriggerid>
		leafFXID1 = <mangled_id>
		<proximtriggerid> :settags leafFXID1 = <leafFXID1>
		leafFXID2 = jow_nil
	endswitch
	<proximtriggerid> :gettags
	begin
	if NOT compositeobjectexists <leafFXID1>
		if NOT compositeobjectexists <leafFXID2>
			break
		endif
	endif
	<proximtriggerid> :obj_getvelocity
	normalizevector <vel>
	newrate = (<density> * <length>)
	newtarget = (<norm> + (0.0, 0.25, 0.0))
	if (iscreated <leafFXID1>)
		<leafFXID1> :emitrate rate = <newrate>
		<leafFXID1> :setemittarget target = <newtarget>
	endif
	if (iscreated <leafFXID2>)
		<leafFXID2> :emitrate rate = <newrate>
		<leafFXID2> :setemittarget target = <newtarget>
	endif
	if gotparam triggerid
		spawnscriptlater soundevent params = {event = sk9_Foliage}
	endif
	wait 1 frame
	repeat
endscript

script Destroy_Leaf_FX 
	if gotparam proximtriggerid
		<proximtriggerid> :gettags
		if gotparam leafFXID1
			if compositeobjectexists <leafFXID1>
				if iscreated <leafFXID1>
					<leafFXID1> :emitrate rate = 0
					<leafFXID1> :destroy ifempty = 1
				endif
			endif
		endif
		if gotparam leafFXID2
			if compositeobjectexists <leafFXID2>
				if iscreated <leafFXID2>
					<leafFXID2> :emitrate rate = 0
					<leafFXID2> :destroy ifempty = 1
				endif
			endif
		endif
		<proximtriggerid> :removetags [leafFXID1 leafFXID2]
	endif
endscript

script Do_DC_WaterSpray_FX 
	if gotparam inside
		switch <triggerid>
			case object
			extendcrc <particleid> '_A' out = partID
			if iscreated <partID>
				<partID> :emitrate rate = 0
			endif
			extendcrc <particleid> '_B' out = partID
			if iscreated <partID>
				<partID> :emitrate rate = 0
			endif
			extendcrc <particleid> '_C' out = partID
			if iscreated <partID>
				<partID> :emitrate rate = 0
			endif
			extendcrc <particleid> '_D' out = partID
			if iscreated <partID>
				<partID> :emitrate rate = 0
			endif
			getuniquecompositeobjectid preferredid = WaterSprayFX01
			createparticlesystem name = <proximID> objid = <proximtriggerid> params_script = $GP_PH_WaterSplash_05
			manglechecksums a = <proximID> b = <proximtriggerid>
			<proximtriggerid> :settags waterSprayFXID1 = <mangled_id>
			getuniquecompositeobjectid preferredid = WaterSprayFX02
			createparticlesystem name = <proximID> objid = <proximtriggerid> params_script = $GP_PH_WaterSplash_05
			manglechecksums a = <proximID> b = <proximtriggerid>
			<proximtriggerid> :settags waterSprayFXID2 = <mangled_id>
			soundevent event = Sk9_Love_Corner_StepOn_Fountain_Loop_SFX object = skater
		endswitch
	elseif NOT gotparam created
		switch <triggerid>
			case object
			extendcrc <particleid> '_A' out = partID
			if iscreated <partID>
				<partID> :emitrate rate = 30
			endif
			extendcrc <particleid> '_B' out = partID
			if iscreated <partID>
				<partID> :emitrate rate = 40
			endif
			extendcrc <particleid> '_C' out = partID
			if iscreated <partID>
				<partID> :emitrate rate = 40
			endif
			extendcrc <particleid> '_D' out = partID
			if iscreated <partID>
				<partID> :emitrate rate = 40
			endif
			<proximtriggerid> :gettags
			if gotparam waterSprayFXID1
				if compositeobjectexists <waterSprayFXID1>
					if iscreated <waterSprayFXID1>
						<waterSprayFXID1> :emitrate rate = 0
						<waterSprayFXID1> :destroy ifempty = 1
					endif
				endif
			endif
			if gotparam waterSprayFXID2
				if compositeobjectexists <waterSprayFXID2>
					if iscreated <waterSprayFXID2>
						<waterSprayFXID2> :emitrate rate = 0
						<waterSprayFXID2> :destroy ifempty = 1
					endif
				endif
			endif
			if issoundeventplaying Sk9_Love_Corner_StepOn_Fountain_Loop_SFX
				stopsoundevent Sk9_Love_Corner_StepOn_Fountain_Loop_SFX
			endif
			<proximtriggerid> :removetags [waterSprayFXID1 waterSprayFXID2]
		endswitch
	endif
endscript

script Do_WaterFall_FX 
	get_level_prefix
	if gotparam inside
		switch <triggerid>
			case object
			<proximtriggerid> :obj_getposition
			getnode <proximID>
			intersectHeight = (<pos>.(0.0, 1.0, 0.0) - (<node>.pos).(0.0, 1.0, 0.0))
			if (<intersectHeight> < 0)
				intersectHeight = 0.0
			endif
			manglechecksums a = <proximID> b = <proximtriggerid>
			groupid = <mangled_id>
			destroyparticlesbygroupid groupid = <groupid> ifempty = 1
			jow_stars 'Do_WaterFall_FX'
			printstruct <groupid>
			safegetuniquecompositeobjectid preferredid = waterFallFX01 objid = <proximtriggerid>
			createparticlesystem name = <uniqueid> objid = <proximtriggerid> groupid = <groupid> bone = bone_acc_hair_t groupid = <mangled_id> params_script = $GP_PH_WaterSplash_08
			safegetuniquecompositeobjectid preferredid = waterFallFX02 objid = <proximtriggerid>
			createparticlesystem name = <uniqueid> objid = <proximtriggerid> groupid = <groupid> bone = bone_bicep_l groupid = <mangled_id> params_script = $GP_PH_WaterSplash_08
			safegetuniquecompositeobjectid preferredid = waterFallFX03 objid = <proximtriggerid>
			createparticlesystem name = <uniqueid> objid = <proximtriggerid> groupid = <groupid> bone = bone_bicep_r groupid = <mangled_id> params_script = $GP_PH_WaterSplash_08
			safegetuniquecompositeobjectid preferredid = waterFallFX04 objid = <proximtriggerid>
			createparticlesystem name = <uniqueid> objid = <proximtriggerid> groupid = <groupid> bone = bone_forearm_l groupid = <mangled_id> params_script = $GP_PH_WaterSplash_08
			safegetuniquecompositeobjectid preferredid = waterFallFX05 objid = <proximtriggerid>
			createparticlesystem name = <uniqueid> objid = <proximtriggerid> groupid = <groupid> bone = bone_forearm_r groupid = <mangled_id> params_script = $GP_PH_WaterSplash_08
		endswitch
	elseif NOT gotparam created
		switch <triggerid>
			case object
			manglechecksums a = <proximID> b = <proximtriggerid>
			destroyparticlesbygroupid groupid = <mangled_id> ifempty = 1
		endswitch
	endif
endscript

script Kill_WaterFall_FX 
	jow_stars \{'Kill_WaterFall_FX'}
	if NOT gotparam \{created}
		if NOT gotparam \{inside}
			formattext checksumname = nodeID '%n' n = <nodename>
			manglechecksums a = <nodeID> b = <proximtriggerid>
			destroyparticlesbygroupid groupid = <mangled_id> ifempty = 1
			printstruct <...>
		endif
	endif
endscript

script RetinaBurn \{time = 5}
	killspawnedscript \{id = RetinaBurn}
	spawnscriptlater RetinaBurnOn id = RetinaBurn params = {time = <time>}
endscript

script RetinaBurnOn time = 5
	if NOT screenfx_fxinstanceexists viewport = 0 name = RetinaDOF
		screenfx_addfxinstance {
			viewport = 0
			name = RetinaDOF
			($RetinaBurn_tod_manager.screen_fx [0])
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = RetinaDOF
			($RetinaBurn_tod_manager.screen_fx [0])
		}
	endif
	if NOT screenfx_fxinstanceexists viewport = 0 name = RetinaBlur
		screenfx_addfxinstance {
			viewport = 0
			name = RetinaBlur
			($RetinaBurn_tod_manager.screen_fx [1])
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = RetinaBlur
			($RetinaBurn_tod_manager.screen_fx [1])
		}
	endif
	if NOT screenfx_fxinstanceexists viewport = 0 name = RetinaBloom
		screenfx_addfxinstance {
			viewport = 0
			name = RetinaBloom
			($RetinaBurn_tod_manager.screen_fx [2])
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = RetinaBloom
			($RetinaBurn_tod_manager.screen_fx [2])
		}
	endif
	wait (0.1 * <time>) seconds
	screenfx_updatefxinstanceparams {
		viewport = 0
		name = RetinaDOF
		time = <time>
		($RetinaBurn_tod_manager.screen_fx [0])
		backdist = 1
		strength = 0
	}
	screenfx_updatefxinstanceparams {
		viewport = 0
		name = RetinaBlur
		time = (0.8 * <time>)
		($RetinaBurn_tod_manager.screen_fx [1])
		inner_alpha = 0
		outer_alpha = 0
	}
	screenfx_updatefxinstanceparams {
		viewport = 0
		name = RetinaBloom
		time = (0.5 * <time>)
		($RetinaBurn_tod_manager.screen_fx [2])
		bloom1 = 0
		bloom2 = 0
		strength = [0 0 0]
	}
	wait <time> seconds
	spawnscriptlater RetinaBurnOff id = RetinaBurn
endscript

script RetinaBurnOff 
	if screenfx_fxinstanceexists \{viewport = 0
			name = RetinaDOF}
		screenfx_removefxinstance \{viewport = 0
			name = RetinaDOF}
	endif
	if screenfx_fxinstanceexists \{viewport = 0
			name = RetinaBlur}
		screenfx_removefxinstance \{viewport = 0
			name = RetinaBlur}
	endif
	if screenfx_fxinstanceexists \{viewport = 0
			name = RetinaBloom}
		screenfx_removefxinstance \{viewport = 0
			name = RetinaBloom}
	endif
endscript

script screenflash \{time = 1}
	killspawnedscript \{id = screenflash}
	if NOT insplitscreengame
		spawnscriptlater screenflashon id = screenflash params = {time = <time>}
	endif
endscript

script screenflashon 
	if NOT screenfx_fxinstanceexists viewport = 0 name = FlashDOF
		screenfx_addfxinstance {
			viewport = 0
			name = FlashDOF
			($screenflash_tod_manager.screen_fx [0])
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = FlashDOF
			($screenflash_tod_manager.screen_fx [0])
		}
	endif
	if NOT screenfx_fxinstanceexists viewport = 0 name = FlashBloom
		screenfx_addfxinstance {
			viewport = 0
			name = FlashBloom
			($screenflash_tod_manager.screen_fx [1])
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = FlashBloom
			($screenflash_tod_manager.screen_fx [1])
		}
	endif
	wait (0.1 * <time>) seconds ignoreslomo
	if screenfx_fxinstanceexists viewport = 0 name = FlashDOF
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = FlashDOF
			time = <time>
			($screenflash_tod_manager.screen_fx [0])
			backdist = 1
			strength = 0
		}
	endif
	if screenfx_fxinstanceexists viewport = 0 name = FlashBloom
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = FlashBloom
			time = (0.5 * <time>)
			($screenflash_tod_manager.screen_fx [1])
			bloom1 = 0
			bloom2 = 0
			strength = [0 0 0]
		}
	endif
	wait <time> seconds ignoreslomo
	spawnscriptlater screenflashoff id = screenflash
endscript

script screenflashoff 
	if screenfx_fxinstanceexists \{viewport = 0
			name = FlashDOF}
		screenfx_removefxinstance \{viewport = 0
			name = FlashDOF}
	endif
	if screenfx_fxinstanceexists \{viewport = 0
			name = FlashBloom}
		screenfx_removefxinstance \{viewport = 0
			name = FlashBloom}
	endif
endscript

script Bouncy_Enable_Proxim 
	if (<bouncyID> = <proximtriggerid>)
		return
	endif
	if gotparam \{inside}
		kill name = <proximID>
		<proximtriggerid> :obj_getvelocity
		normalizevector <vel>
		vel = (RandomRange (1.5, 2.0) * <length> * (<norm> + RandomRange (0.1, 0.4) * (1.0, 0.0, 0.0) + RandomRange (-0.2, 0.2) * (0.0, 1.0, 0.0) + RandomRange (-0.2, 0.2) * (0.0, 0.0, 1.0)))
		<bouncyID> :rigidbody_enable
		<bouncyID> :rigidbody_linearimpulse impulse = <vel>
	endif
endscript

script Create_Water_Ripple_FX 
	setspawninstancelimits \{max = 20
		management = ignore_spawn_request}
	begin
	EngineCreateWaterRipple position = <pos>
	wait RandomRange (0.5, 1.0) seconds
	repeat
endscript

script Create_Launcher_ScreenFX time = 0.3
	if NOT screenfx_fxinstanceexists viewport = 0 name = launcherDOF1
		screenfx_addfxinstance {
			viewport = 0
			name = launcherDOF1
			($Launcher_tod_manager.screen_fx [0])
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = launcherDOF1
			($Launcher_tod_manager.screen_fx [0])
		}
	endif
	if NOT screenfx_fxinstanceexists viewport = 0 name = launcherZoom1
		screenfx_addfxinstance {
			viewport = 0
			name = launcherZoom1
			($Launcher_tod_manager.screen_fx [1])
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = launcherZoom1
			($Launcher_tod_manager.screen_fx [1])
		}
	endif
	wait <time> seconds
	Destroy_Launcher_ScreenFX
endscript

script Destroy_Launcher_ScreenFX time = 1
	if screenfx_fxinstanceexists viewport = 0 name = launcherDOF1
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = launcherDOF1
			time = <time>
			strength = 0.0
		}
	endif
	if screenfx_fxinstanceexists viewport = 0 name = launcherZoom1
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = launcherZoom1
			time = <time>
			inner_alpha = 0
			outer_alpha = 0
		}
	endif
	wait <time> seconds
	if screenfx_fxinstanceexists viewport = 0 name = launcherDOF1
		screenfx_removefxinstance viewport = 0 name = launcherDOF1
	endif
	if screenfx_fxinstanceexists viewport = 0 name = launcherZoom1
		screenfx_removefxinstance viewport = 0 name = launcherZoom1
	endif
endscript

script Create_AgroKickFX 
endscript

script Do_AgroKickFX time = 0.15 strength = 0.1
	if NOT screenfx_fxinstanceexists viewport = 0 name = agroKickDOF1
		screenfx_addfxinstance {
			viewport = 0
			name = agroKickDOF1
			($AgroKick_tod_manager.screen_fx [0])
			strength = <strength>
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = agroKickDOF1
			($AgroKick_tod_manager.screen_fx [0])
			strength = <strength>
		}
	endif
	strength = (<strength> * 4)
	if (<strength> > 1)
		<strength> = 1
	endif
	value = (1.0 - (0.08 * <strength>))
	scales = [0.0 1.0]
	setarrayelement arrayname = scales index = 0 newvalue = <value>
	if NOT screenfx_fxinstanceexists viewport = 0 name = agroKickZoom1
		screenfx_addfxinstance {
			viewport = 0
			name = agroKickZoom1
			($AgroKick_tod_manager.screen_fx [1])
			scales = <scales>
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = agroKickZoom1
			($AgroKick_tod_manager.screen_fx [1])
			scales = <scales>
		}
	endif
	wait <time> seconds
	Destroy_AgroKickFX
endscript

script Destroy_AgroKickFX time = 1
	if screenfx_fxinstanceexists viewport = 0 name = agroKickDOF1
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = agroKickDOF1
			time = <time>
			strength = 0.0
		}
	endif
	if screenfx_fxinstanceexists viewport = 0 name = agroKickZoom1
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = agroKickZoom1
			time = <time>
			inner_alpha = 0
			outer_alpha = 0
		}
	endif
	wait <time> seconds
	if screenfx_fxinstanceexists viewport = 0 name = agroKickDOF1
		screenfx_removefxinstance viewport = 0 name = agroKickDOF1
	endif
	if screenfx_fxinstanceexists viewport = 0 name = agroKickZoom1
		screenfx_removefxinstance viewport = 0 name = agroKickZoom1
	endif
endscript

script Do_MenuFx 
	requireparams \{[
			fxparam
		]
		all}
	Do_MenuFx_Viewport fxparam = <fxparam> viewport = 0
	Do_MenuFx_Viewport fxparam = <fxparam> viewport = 1
endscript

script Do_MenuFx_Viewport 
	requireparams [fxparam viewport] all
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = menuFog
		screenfx_addfxinstance {
			viewport = <viewport>
			name = menuFog
			(<fxparam>.screen_fx [0])
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = menuFog
			(<fxparam>.screen_fx [0])
		}
	endif
	if NOT screenfx_fxinstanceexists viewport = <viewport> name = menuBrightSat
		screenfx_addfxinstance {
			viewport = <viewport>
			name = menuBrightSat
			(<fxparam>.screen_fx [1])
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = menuBrightSat
			(<fxparam>.screen_fx [1])
		}
	endif
endscript

script Do_MenuFx_Video_Editor 
	requireparams [fxparam] all
	if NOT screenfx_fxinstanceexists viewport = 0 name = menuDOF
		screenfx_addfxinstance {
			viewport = 0
			name = menuDOF
			(<fxparam>.screen_fx [0])
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = menuDOF
			(<fxparam>.screen_fx [0])
		}
	endif
	if NOT screenfx_fxinstanceexists viewport = 0 name = menuFog
		screenfx_addfxinstance {
			viewport = 0
			name = menuFog
			(<fxparam>.screen_fx [1])
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = menuFog
			(<fxparam>.screen_fx [1])
		}
	endif
	if NOT screenfx_fxinstanceexists viewport = 0 name = menuBrightSat
		screenfx_addfxinstance {
			viewport = 0
			name = menuBrightSat
			(<fxparam>.screen_fx [2])
		}
	else
		screenfx_updatefxinstanceparams {
			viewport = 0
			name = menuBrightSat
			(<fxparam>.screen_fx [2])
		}
	endif
endscript

script Destroy_MenuFx \{time = 0}
	Destroy_MenuFx_Viewport time = <time> viewport = 0
	Destroy_MenuFx_Viewport time = <time> viewport = 1
endscript

script Destroy_MenuFx_Viewport 
	requireparams [viewport time] all
	if screenfx_fxinstanceexists viewport = <viewport> name = menuFog
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = menuFog
			time = <time>
			strength = 0.0
		}
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = menuBrightSat
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = menuBrightSat
			time = <time>
			inner_alpha = 0
			outer_alpha = 0
		}
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = menuDOF
		screenfx_updatefxinstanceparams {
			viewport = <viewport>
			name = menuDOF
			time = <time>
			strength = 0.0
		}
	endif
	if NOT (<time> = 0)
		wait <time> seconds
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = menuFog
		screenfx_removefxinstance viewport = <viewport> name = menuFog
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = menuBrightSat
		screenfx_removefxinstance viewport = <viewport> name = menuBrightSat
	endif
	if screenfx_fxinstanceexists viewport = <viewport> name = menuDOF
		screenfx_removefxinstance viewport = <viewport> name = menuDOF
	endif
endscript

script get_level_prefix 
	get_current_level_name
	switch <level_load_script>
		case Load_Z_BCity
		return prefix = 'Z_BCity'
		case Load_Z_Bell
		return prefix = 'Z_Bell'
		case Load_Z_BW_Bridge
		return prefix = 'Z_BW_Bridge'
		case load_z_crib
		return prefix = 'Z_Crib'
		case Load_Z_FDR
		return prefix = 'Z_FDR'
		case load_z_harbor
		return prefix = 'Z_Harbor'
		case Load_Z_Lansdowne
		return prefix = 'Z_Lansdowne'
		case Load_Z_Love
		return prefix = 'Z_Love'
		case Load_Z_Monuments
		return prefix = 'Z_Monuments'
		case Load_Z_Museum_Int
		return prefix = 'Z_Museum_Int'
		case Load_Z_Museums
		return prefix = 'Z_Museums'
		case Load_Z_PB_Bridge
		return prefix = 'Z_PB_Bridge'
		case Load_Z_Secret
		return prefix = 'Z_Secret'
		case Load_Z_Slums
		return prefix = 'Z_Slums'
		case load_z_viewer
		return prefix = 'Z_Viewer'
		case Load_Z_WP_Bridge
		return prefix = 'Z_WP_Bridge'
	endswitch
endscript

script Do_Grind_Tesla_FX 
	if triggertype \{Grind
			Onto}
		obj_spawnscriptlater Create_Grind_Tesla_FX params = {<...>}
	endif
endscript

script Create_Grind_Tesla_FX 
	obj_getposition
	Get_Nearest_Pos startpos = <pos> positions = <positions>
	normalizevector (<pos> - <nearestPos>)
	getuniquecompositeobjectid preferredid = GrindTeslaParticles01
	createparticlesystem name = <uniqueid> pos = <nearestPos> params_script = $GP_Grind_Tesla_Sparks01
	getuniquecompositeobjectid preferredid = GrindTeslaFX01
	createteslaeffectobject name = <uniqueid> start = <pos> end = <nearestPos> width = (0.3 * <length>) amplitude = 1 lightwidth = (1.0 / <length>) fade = 0.8 color = (0.2, 0.3, 1.0)
	soundevent event = Sk9_Tesla_Sparks_SFX
	wait 0.05 seconds
	begin
	obj_getposition
	Get_Nearest_Pos startpos = <pos> positions = <positions>
	normalizevector (<pos> - <nearestPos>)
	setteslaeffectobject name = <uniqueid> start = <pos> end = <nearestPos> width = (0.3 * <length>) lightwidth = (1.0 / <length>)
	wait 0.05 seconds
	repeat 20
	deleteteslaeffectobject name = <uniqueid>
endscript

script Get_Nearest_Pos 
	nearestDist = 999999.0
	getarraysize <positions>
	i = 0
	begin
	normalizevector (<startpos> - <positions> [<i>])
	if (<length> < <nearestDist>)
		nearestDist = <length>
		nearestPos = (<positions> [<i>])
	endif
	i = (<i> + 1)
	repeat <array_size>
	return nearestPos = <nearestPos>
endscript

script safecreate 
	if isinnodearray <nodename>
		if NOT iscreated <nodename>
			create name = <nodename>
		endif
	endif
endscript

script safekill 
	if iscreated <nodename>
		kill name = <nodename>
	endif
endscript

script safegetuniquecompositeobjectid preferredid = safefxid01
	if NOT gotparam objid
		getuniquecompositeobjectid preferredid = <preferredid>
		return uniqueid = <uniqueid>
	endif
	i = 0
	formattext textname = index '%i' i = <i>
	extendcrc <preferredid> <index> out = preferredid
	begin
	manglechecksums a = <preferredid> b = <objid>
	if NOT objectexists id = <mangled_id>
		return uniqueid = <preferredid>
	else
		i = (<i> + 1)
		formattext textname = index '%i' i = <i>
		extendcrc <preferredid> <index> out = preferredid
	endif
	repeat
endscript

script Create_Vehicle_FX 
	getuniquecompositeobjectid preferredid = carFX01
	switch <skeletonname>
		case veh_american_small_sedan
		createparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_PH_Sedan_Small01
		case veh_workvan
		createparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_PH_Veh_Workvan
		case veh_american_large_sedan
		createparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_PH_Sedan_Large01
		case robot_kick_in_count
		createparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_PH_Jeep_Liberty
		case veh_pickup_truck
		createparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_PH_Veh_Pickup
		case veh_vintage
		createparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_PH_Veh_Vintage01
		case veh_mini_van
		createparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_PH_Veh_MiniVan01
		case veh_jeep_patriot
		createparticlesystem name = <uniqueid> objid = <objid> params_script = $GP_PH_Jeep_Patriot
	endswitch
endscript
