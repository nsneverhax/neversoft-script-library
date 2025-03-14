display_event_arrows = 0
StateToEntryEventMapping = {
	Skater_InAir = SkaterEnterAir
	Skater_InBail = SkaterEnterBail
	Skater_OnRail = SkaterEnterRail
	Skater_Skitching = skaterenterskitch
	Skater_InManual = SkaterEnterManual
	Skater_InRevert = SkaterEnterRevert
	Skater_OnGround = SkaterEnterGround
	Skater_OnWall = SkaterEnterWall
	Skater_InWallplant = SkaterEnterWallplant
	Skater_InRevert = SkaterEnterRevert
	Skater_OnLip = SkaterEnterLip
	Skater_EndOfRun = SkaterEnterEndOfRun
	Skater_OnLadder = SkaterEnterLadder
	Skater_InHang = SkaterEnterHang
	Skater_InCarve = skaterentercarve
	Skater_InSlashGrind = skaterenterslashgrind
	Skater_InWallClimb = skaterenterwallclimb
	Skater_InPoleClimb = skaterenterpoleclimb
}
StateToExitEventMapping = {
	Skater_InAir = SkaterExitAir
	Skater_InBail = SkaterExitBail
	Skater_OnRail = SkaterExitRail
	Skater_Skitching = skaterexitskitch
	Skater_InManual = SkaterExitManual
	Skater_InRevert = SkaterExitRevert
	Skater_OnGround = SkaterExitGround
	Skater_OnWall = SkaterExitWall
	Skater_InWallplant = SkaterExitWallplant
	Skater_InRevert = SkaterExitRevert
	Skater_OnLip = SkaterExitLip
	Skater_EndOfRun = SkaterExitEndOfRun
	Skater_OnLadder = SkaterExitLadder
	Skater_InHang = skaterexithang
	Skater_InCarve = skaterexitcarve
	Skater_InSlashGrind = skaterexitslashgrind
	Skater_InWallClimb = skaterexitwallclimb
	Skater_InPoleClimb = skaterexitpoleclimb
}
SubStateToEntryEventMapping = {
	flip = SkaterEnterFlip
	Grab = SkaterEnterGrab
	Transfer = SkaterEnterTransfer
	AcidDrop = SkaterEnterAcidDrop
}
SubStateToExitEventMapping = {
	flip = SkaterExitFlip
	Grab = SkaterExitGrab
	Transfer = SkaterExitTransfer
	AcidDrop = SkaterExitAcidDrop
}
StateToSubStateExitEventMask = {
	Skater_None = [
	]
	Skater_InAir = [
		SkaterExitTransfer
		SkaterExitAcidDrop
	]
	Skater_InBail = [
	]
	Skater_OnRail = [
	]
	Skater_Skitching = [
	]
	Skater_InManual = [
	]
	Skater_InRevert = [
	]
	Skater_OnGround = [
	]
	Skater_OnWall = [
	]
	Skater_InWallplant = [
	]
	Skater_OnLip = [
	]
	Skater_EndOfRun = [
	]
	Skater_OnLadder = [
	]
	Skater_InHang = [
	]
	Skater_InCarve = [
	]
	Skater_InSlashGrind = [
	]
	Skater_InWallClimb = [
	]
	Skater_InPoleClimb = [
	]
}

script LaunchStateChangeEvent 
	newstate = <state>
	getsetoftags \{[
			state
			StateExitEvent
		]}
	ntt_send_state_change_message <...>
	LaunchAllSubStateExitEvents newstate = <newstate>
	if (<newstate> = <state>)
		return
	endif
	if gotparam \{StateExitEvent}
		launchevent broadcast type = <StateExitEvent>
	endif
	obj_getid
	launchevent broadcast type = ($StateToEntryEventMapping.<newstate>) data = {fired_by_id = <objid>}
	settags StateExitEvent = ($StateToExitEventMapping.<newstate>) state = <newstate>
endscript

script LaunchSubStateEntryEvent 
	obj_getid
	launchevent broadcast type = ($SubStateToEntryEventMapping.<SubState>) data = {fired_by_id = <objid>}
	gettags
	NewExitEvent = ($SubStateToExitEventMapping.<SubState>)
	SubStateExitEventList = (<SubStateExitEventList> + {<NewExitEvent>})
	settags SubStateExitEventList = <SubStateExitEventList>
endscript

script LaunchSubStateExitEvent 
	launchevent broadcast type = ($SubStateToExitEventMapping.<SubState>)
	gettags
	SubStateExitEventList = (<SubStateExitEventList> - ($SubStateToExitEventMapping.<SubState>))
	settags SubStateExitEventList = <SubStateExitEventList>
endscript

script InitializeStateChangeEvent 
	gettags
	if gotparam \{StateExitEvent}
		LaunchAllSubStateExitEvents \{newstate = Skater_None}
		launchevent broadcast type = <StateExitEvent>
	endif
	setprops \{remove_tags = [
			StateExitEvent
		]}
	settags \{state = Skater_None
		SubStateExitEventList = {
		}}
endscript

script LaunchAllSubStateExitEvents 
	gettags
	if NOT gotparam \{SubStateExitEventList}
		return
	endif
	MaskedSubStateExitEventList = (<SubStateExitEventList> - ($StateToSubStateExitEventMask.<newstate>))
	launchevent broadcast type = <MaskedSubStateExitEventList>
	SubStateExitEventList = (<SubStateExitEventList> - <MaskedSubStateExitEventList>)
	settags SubStateExitEventList = <SubStateExitEventList>
endscript

script SkaterEventDebug 
	killspawnedscript \{name = TestEventListener}
	spawnscriptlater \{TestEventListener}
endscript

script TestEventListener 
	seteventhandler event = SkaterEnterAir scr = ReportEvent response = call_script params = {EventName = SkaterEnterAir}
	seteventhandler event = SkaterExitAir scr = ReportEvent response = call_script params = {EventName = SkaterExitAir}
	seteventhandler event = SkaterEnterGround scr = ReportEvent response = call_script params = {EventName = SkaterEnterGround}
	seteventhandler event = SkaterExitGround scr = ReportEvent response = call_script params = {EventName = SkaterExitGround}
	seteventhandler event = SkaterEnterBail scr = ReportEvent response = call_script params = {EventName = SkaterEnterBail}
	seteventhandler event = SkaterExitBail scr = ReportEvent response = call_script params = {EventName = SkaterExitBail}
	seteventhandler event = SkaterEnterRail scr = ReportEvent response = call_script params = {EventName = SkaterEnterRail}
	seteventhandler event = SkaterExitRail scr = ReportEvent response = call_script params = {EventName = SkaterExitRail}
	seteventhandler event = skaterenterskitch scr = ReportEvent response = call_script params = {EventName = skaterenterskitch}
	seteventhandler event = skaterexitskitch scr = ReportEvent response = call_script params = {EventName = skaterexitskitch}
	seteventhandler event = SkaterEnterManual scr = ReportEvent response = call_script params = {EventName = SkaterEnterManual}
	seteventhandler event = SkaterExitManual scr = ReportEvent response = call_script params = {EventName = SkaterExitManual}
	seteventhandler event = SkaterEnterWall scr = ReportEvent response = call_script params = {EventName = SkaterEnterWall}
	seteventhandler event = SkaterExitWall scr = ReportEvent response = call_script params = {EventName = SkaterExitWall}
	seteventhandler event = SkaterEnterWallplant scr = ReportEvent response = call_script params = {EventName = SkaterEnterWallplant}
	seteventhandler event = SkaterExitWallplant scr = ReportEvent response = call_script params = {EventName = SkaterExitWallplant}
	seteventhandler event = SkaterEnterRevert scr = ReportEvent response = call_script params = {EventName = SkaterEnterRevert}
	seteventhandler event = SkaterExitRevert scr = ReportEvent response = call_script params = {EventName = SkaterExitRevert}
	seteventhandler event = SkaterEnterLip scr = ReportEvent response = call_script params = {EventName = SkaterEnterLip}
	seteventhandler event = SkaterExitLip scr = ReportEvent response = call_script params = {EventName = SkaterExitLip}
	seteventhandler event = SkaterEnterLadder scr = ReportEvent response = call_script params = {EventName = SkaterEnterLadder}
	seteventhandler event = SkaterExitLadder scr = ReportEvent response = call_script params = {EventName = SkaterExitLadder}
	seteventhandler event = SkaterEnterHang scr = ReportEvent response = call_script params = {EventName = SkaterEnterHang}
	seteventhandler event = skaterexithang scr = ReportEvent response = call_script params = {EventName = skaterexithang}
	seteventhandler event = SkaterEnterEndOfRun scr = ReportEvent response = call_script params = {EventName = SkaterEnterEndOfRun}
	seteventhandler event = SkaterExitEndOfRun scr = ReportEvent response = call_script params = {EventName = SkaterExitEndOfRun}
	seteventhandler event = SkaterEnterFlip scr = ReportEvent response = call_script params = {EventName = SkaterEnterFlip}
	seteventhandler event = SkaterExitFlip scr = ReportEvent response = call_script params = {EventName = SkaterExitFlip}
	seteventhandler event = SkaterEnterGrab scr = ReportEvent response = call_script params = {EventName = SkaterEnterGrab}
	seteventhandler event = SkaterExitGrab scr = ReportEvent response = call_script params = {EventName = SkaterExitGrab}
	seteventhandler event = SkaterEnterTransfer scr = ReportEvent response = call_script params = {EventName = SkaterEnterTransfer}
	seteventhandler event = SkaterExitTransfer scr = ReportEvent response = call_script params = {EventName = SkaterExitTransfer}
	seteventhandler event = SkaterEnterAcidDrop scr = ReportEvent response = call_script params = {EventName = SkaterEnterAcidDrop}
	seteventhandler event = SkaterExitAcidDrop scr = ReportEvent response = call_script params = {EventName = SkaterExitAcidDrop}
	seteventhandler event = skaterlanded scr = ReportEvent response = call_script params = {EventName = skaterlanded}
	seteventhandler event = SkaterLandedClean scr = ReportEvent response = call_script params = {EventName = SkaterLandedClean}
	seteventhandler event = skaterbailed scr = ReportEvent response = call_script params = {EventName = skaterbailed}
	seteventhandler event = skatertrickdisplayed scr = ReportEvent response = call_script params = {EventName = skatertrickdisplayed}
	seteventhandler event = skaterspindisplayed scr = ReportEvent response = call_script params = {EventName = skaterspindisplayed}
	seteventhandler event = skaterentercombo scr = ReportEvent response = call_script params = {EventName = skaterentercombo}
	seteventhandler event = SkaterExitCombo scr = ReportEvent response = call_script params = {EventName = SkaterExitCombo}
	seteventhandler event = skaterjump scr = ReportEvent response = call_script params = {EventName = skaterjump}
	seteventhandler event = skateroffedge scr = ReportEvent response = call_script params = {EventName = skateroffedge}
	seteventhandler event = SkaterWallplant scr = ReportEvent response = call_script params = {EventName = SkaterWallplant}
	seteventhandler event = SkaterWallpush scr = ReportEvent response = call_script params = {EventName = SkaterWallpush}
	seteventhandler event = SkaterPointRail scr = ReportEvent response = call_script params = {EventName = SkaterPointRail}
	seteventhandler event = SkaterEnterSkating scr = ReportEvent response = call_script params = {EventName = SkaterEnterSkating}
	seteventhandler event = SkaterExitSkating scr = ReportEvent response = call_script params = {EventName = SkaterExitSkating}
	seteventhandler event = SkaterEnterWalking scr = ReportEvent response = call_script params = {EventName = SkaterEnterWalking}
	seteventhandler event = SkaterExitWalking scr = ReportEvent response = call_script params = {EventName = SkaterExitWalking}
	seteventhandler event = skaterenternollie scr = ReportEvent response = call_script params = {EventName = skaterenternollie}
	seteventhandler event = skaterexitnollie scr = ReportEvent response = call_script params = {EventName = skaterexitnollie}
	seteventhandler event = skaterenterpressure scr = ReportEvent response = call_script params = {EventName = skaterenterpressure}
	seteventhandler event = skaterexitpressure scr = ReportEvent response = call_script params = {EventName = skaterexitpressure}
	seteventhandler event = skaterentervertair scr = ReportEvent response = call_script params = {EventName = skaterentervertair}
	seteventhandler event = skaterexitvertair scr = ReportEvent response = call_script params = {EventName = skaterexitvertair}
	block
endscript

script ReportEvent 
	printf "=++ Event: %a" a = <EventName>
endscript

script blockuntilevent 
	sg_printf "############################ block "
	sg_printstruct <...>
	if NOT gotparam object
		if isobjectscript
			obj_getid
			if <objid> :obj_hascomponent eventcache
				obj_getid
				<object> = <objid>
			endif
		endif
	endif
	if istrue debug_skipallblocks
		if NOT istrue <debug_donotskipblock>
			wait 25 gameframe
			return
		endif
	endif
	if gotparam anyobjects
		EventCache_WaitMultiple <...>
	else
		if gotparam allobjects
			EventCache_WaitMultiple <...>
		else
			if gotparam object
				if <object> :obj_hascomponent squadcommand
					squad_getmembers
					EventCache_WaitMultiple anyobjects = <members> <...>
				else
					if <object> :obj_hascomponent eventcache
						<object> :eventcache_wait <...>
					else
						block <...>
					endif
				endif
			else
				block <...>
			endif
		endif
	endif
	sg_printf "########################### unblocked"
	sg_printstruct <...>
	return {type = <event_type> data = <event_data>}
endscript
