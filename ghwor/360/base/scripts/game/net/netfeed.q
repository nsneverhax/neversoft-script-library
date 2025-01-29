g_netfeeddebugoverlay_container_pos = (50.0, 30.0)
g_netfeeddebugoverlay_text_font = fontgrid_text_a1
g_netfeeddebugoverlay_text_color = [
	255
	255
	255
	255
]
g_netfeeddebugoverlay_text_scale = (0.5, 0.5)
g_netfeeddebugoverlay_just = [
	left
	top
]
g_netfeed_checksumsneeded = [
	event
	userid_first
	userid_second
	userid
	msgid
	msgid_first
	msgid_second
	msgsize
	msg
	senderid
	senderid_first
	senderid_second
	sendername
	timestamp
	timestamp_unixtime
	timestamp_datetime
	year
	month
	day
	hour
	minute
	Second
	millisecond
	senderfriendstatus
	unknown
	notafriend
	friend
	pending
	msgadded
	gotmsgdata
	filteredmsgadded
	gotmsgdataerror
	sendmessagesstarted
	sendmessagesdone
	sendmessagesfailure
	updatelocalinboxstarted
	updatelocalinboxdone
	updatelocalinboxfailure
	flushremoteinboxstarted
	flushremoteinboxdone
	flushremoteinboxfailure
	flushmessagesstarted
	flushmessagesdone
	flushmessagesfailure
	deleteremotemessagesstarted
	deleteremotemessagesdone
	deleteremotemessagesfailure
	netfeedversion
	netfeed_version_100
	integer1
	integer2
	integer3
	integer4
	integer5
	float1
	float2
	float3
	float4
	float5
	string1
	string2
	string3
	string4
	string5
	checksum1
	checksum2
	checksum3
	checksum4
	checksum5
	array1
	array2
	array3
	array4
	array5
	struct1
	struct2
	struct3
	struct4
	struct5
]

script netfeedqeventhandler 
	switch <event>
		case msgadded
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : msgadded'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : msgadded)'
		if netfeed func = getmsgheader userid = <userid> msgid = <msgid> out = msgheader
			netfeed \{func = logmessage
				msg = 'netfeedqeventhandler : MSGADDED : Got message header!'}
			netfeed func = logstruct struct = <msgheader> msg = '(netfeedqeventhandler : MSGADDED : Message Header)'
		endif
		case filteredmsgadded
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : msgadded'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : msgadded)'
		if netfeed func = getmsgheader userid = <userid> msgid = <msgid> out = msgheader
			netfeed \{func = logmessage
				msg = 'netfeedqeventhandler : MSGADDED : Got message header!'}
			netfeed func = logstruct struct = <msgheader> msg = '(netfeedqeventhandler : MSGADDED : Message Header)'
		endif
		case gotmsgdata
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : gotmsgdata'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : gotmsgdata)'
		case gotmsgdataerror
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : gotmsgdataerror!!!!!!!!!!!!!!!!!!!!!!!!!!!'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : gotmsgdataerror)'
		case sendmessagesstarted
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : sendmessagesstarted'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : sendmessagesstarted)'
		case sendmessagesdone
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : sendmessagesdone'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : sendmessagesdone)'
		case sendmessagesfailure
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : sendmessagesfailure'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : sendmessagesfailure)'
		case updatelocalinboxstarted
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : updatelocalinboxstarted'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : updatelocalinboxstarted)'
		case updatelocalinboxdone
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : updatelocalinboxdone'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : updatelocalinboxdone)'
		case updatelocalinboxfailure
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : updatelocalinboxfailure'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : updatelocalinboxfailure)'
		case flushremoteinboxstarted
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : flushremoteinboxstarted'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : flushremoteinboxstarted)'
		case flushremoteinboxdone
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : flushremoteinboxdone'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : flushremoteinboxdone)'
		case flushremoteinboxfailure
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : flushremoteinboxfailure'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : flushremoteinboxfailure)'
		case fetchmessagesstarted
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : fetchmessagesstarted'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : fetchmessagesstarted)'
		case fetchmessagesdone
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : fetchmessagesdone'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : fetchmessagesdone)'
		case fetchmessagesfailure
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : fetchmessagesfailure'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : fetchmessagesfailure)'
		case deleteremotemessagesstarted
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : deleteremotemessagesstarted'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : deleteremotemessagesstarted)'
		case deleteremotemessagesdone
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : deleteremotemessagesdone'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : deleteremotemessagesdone)'
		case deleteremotemessagesfailure
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : deleteremotemessagesfailure'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : deleteremotemessagesfailure)'
		case newmessagewaitingnotify
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : newmessagewaitingnotify'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : newmessagewaitingnotify)'
		default
		netfeed \{func = logmessage
			msg = 'netfeedqeventhandler : unsupported event!!!'}
		netfeed func = logstruct struct = <...> msg = '(netfeedqeventhandler : ????)'
	endswitch
endscript

script netfeedisready 
	if netfeed func = isready controller_index = ($primary_controller)
		netfeed \{func = logmessage
			msg = 'netfeedisready: NET FEED IS READY'}
	else
		netfeed \{func = logmessage
			msg = 'netfeedisready: NET FEED IS NOT READY!'}
	endif
endscript

script netfeedsetup 
	netfeed func = createsender controller_index = ($primary_controller)
	netfeed func = createlocalinbox controller_index = ($primary_controller)
	netfeed func = registernewmessagewaitingeventhandler controller_index = ($primary_controller) qeventhandler = netfeedqeventhandler
endscript

script netfeedteardown 
	netfeed func = unregisternewmessagewaitingeventhandler controller_index = ($primary_controller)
	netfeed func = destroysender controller_index = ($primary_controller)
	netfeed func = destroylocalinbox controller_index = ($primary_controller)
endscript

script netfeedflushme 
	if NOT netfeed func = isready controller_index = ($primary_controller)
		netfeed \{func = logmessage
			msg = 'netfeedflushme: NOT READY!'}
		return
	endif
	netfeedsetup
	netfeed func = flushremoteinbox controller_index = ($primary_controller)
	netfeed func = emptylocalinbox controller_index = ($primary_controller)
	netfeedteardown
endscript

script netfeedreset 
	netfeed \{func = reset}
endscript

script netfeedpump 
	if NOT netfeed func = isready controller_index = ($primary_controller)
		netfeed \{func = logmessage
			msg = 'netfeedpump: NOT READY!'}
		return
	endif
	netfeedsetup
	netfeed \{func = updatealllocalinboxes
		qeventhandler = netfeedqeventhandler}
	SpawnScriptNow \{netfeedupdatealllocalinboxesspawned}
endscript

script netfeedwalk 
	netfeedsetup
	if NOT netfeed func = getmessagecount controller_index = ($primary_controller) out = messagecount
		netfeed \{func = logmessage
			msg = 'netfeedwalk: UNABLE TO GET LOCAL INBOX COUNT!'}
		return
	endif
	if (<messagecount> <= 0)
		netfeed \{func = logmessage
			msg = 'netfeedwalk: LOCAL INBOX IS EMPTY.'}
		return
	endif
	if NOT netfeed func = getmsgidfront controller_index = ($primary_controller) out = msgid out_first = msgid_first out_second = msgid_second
		netfeed \{func = logmessage
			msg = 'netfeedwalk: ERROR GETTING FIRST MESSAGE!'}
		return
	endif
	begin
	printf qs(0x13739ed1) a = <msgid_first> b = <msgid_second>
	formatText TextName = msgtext 'netfeedwalk:  msgid=[ %a %b ]' a = <msgid_first> b = <msgid_second>
	netfeed func = logmessage msg = <msgtext>
	if NOT netfeed func = getmsgidnext controller_index = ($primary_controller) msgid = (<msgid>) out = msgid out_first = msgid_first out_second = msgid_second
		break
	endif
	repeat
endscript

script netfeedpump2a 
	if NOT netfeed func = isready controller_index = ($primary_controller)
		netfeed \{func = logmessage
			msg = 'netfeedpump2a: NOT READY!'}
		return
	endif
	netfeedsetup
	netfeed \{func = updatealllocalinboxes
		qeventhandler = netfeedqeventhandler
		getmsgdata = 1
		index = 0
		numitems = 2}
endscript

script netfeedpump2b 
	if NOT netfeed func = isready controller_index = ($primary_controller)
		netfeed \{func = logmessage
			msg = 'netfeedpump2b: NOT READY!'}
		return
	endif
	netfeedsetup
	netfeed \{func = updatealllocalinboxes
		qeventhandler = netfeedqeventhandler
		getmsgdata = 1
		index = 2}
endscript

script netfeedupdatealllocalinboxesspawned 
	netfeed \{func = logmessage
		msg = 'SPAWNED: Called'}
	count = 0
	begin
	if NOT netfeed func = islocalinboxbusy controller_index = ($primary_controller)
		break
	endif
	Wait \{1
		gameframe}
	formatText TextName = msgtext 'SPAWNED: Waiting (%d)' d = (<count>)
	netfeed func = logmessage msg = <msgtext>
	<count> = (<count> + 1)
	repeat
	netfeed \{func = logmessage
		msg = 'SPAWNED: READY TO GO!!!!!!'}
	netfeed func = getmessagecount controller_index = ($primary_controller) out = messagecount
	formatText TextName = msgtext 'SPAWNED: There are %d messages in our box!' d = (<messagecount>)
	netfeed func = logmessage msg = <msgtext>
	msgidlist = []
	if netfeed func = getmsgidfront controller_index = ($primary_controller) out = msgid out_first = msgid_first out_second = msgid_second
		begin
		formatText TextName = msgtext 'SPAWNED: Adding msg#[%a,%b] to our msgidlist' a = (<msgid_first>) b = (<msgid_second>)
		netfeed func = logmessage msg = <msgtext>
		AddArrayElement array = <msgidlist> element = <msgid>
		<msgidlist> = <array>
		if NOT netfeed func = getmsgidnext controller_index = ($primary_controller) msgid = (<msgid>) out = msgid out_first = msgid_first out_second = msgid_second
			break
		endif
		repeat
	endif
	GetArraySize \{msgidlist}
	if (<array_Size> > 0)
		formatText TextName = msgtext 'SPAWNED: Requesting %d messages...' d = (<array_Size>)
		netfeed func = logmessage msg = <msgtext>
		netfeed func = fetchmessages controller_index = ($primary_controller) qeventhandler = netfeedqeventhandler msgidlist = (<msgidlist>)
	endif
	netfeed \{func = logmessage
		msg = 'SPAWNED: Done!'}
endscript

script netfeedemptylocalinbox 
	netfeedsetup
	netfeed func = emptylocalinbox controller_index = ($primary_controller) qeventhandler = netfeedqeventhandler
endscript

script netfeedflushremoteinbox 
	if NOT netfeed func = isready controller_index = ($primary_controller)
		netfeed \{func = logmessage
			msg = 'netfeedflushremoteinbox: NOT READY!'}
		return
	endif
	netfeedsetup
	netfeed func = flushremoteinbox controller_index = ($primary_controller) qeventhandler = netfeedqeventhandler
	netfeed func = emptylocalinbox controller_index = ($primary_controller)
endscript
g_netfeedsendmessagenum = 0

script netfeedgeneratemsgtext 
	if NOT netfeed func = isready controller_index = ($primary_controller)
		netfeed \{func = logmessage
			msg = 'NOT READY!'}
		return \{FALSE}
	endif
	netfeedsetup
	if NOT netfeed func = isoktosend controller_index = ($primary_controller)
		netfeed \{func = logmessage
			msg = 'It is not OK to send a message at this time.'}
		return \{FALSE}
	endif
	Change g_netfeedsendmessagenum = ($g_netfeedsendmessagenum + 1)
	formatText TextName = msgtext 'NetFeedSend#%d Message' d = ($g_netfeedsendmessagenum)
	return true msgtext = <msgtext>
endscript

script netfeedsend 
	netfeedsendm
endscript

script netfeedsendn 
	if NOT netfeedgeneratemsgtext
		return
	endif
	if NOT netfeed func = sendmessage controller_index = ($primary_controller) qeventhandler = netfeedqeventhandler sendto = nobody msg = {text = <msgtext> num = ($g_netfeedsendmessagenum) checksum = netfeedsend float = 1.0 int = 5}
		netfeed \{func = logmessage
			msg = 'Message was NOT sent!'}
	else
		dgsrecorddata event = 'SendFriendsFeedMessage' conditions = [net_dgs_sendfriendsfeedmessage] controller_index = ($primary_controller) debugmsg = 'netfeedsendn'
	endif
endscript

script netfeedsendm 
	if NOT netfeedgeneratemsgtext
		return
	endif
	if NOT netfeed func = sendmessage controller_index = ($primary_controller) qeventhandler = netfeedqeventhandler sendto = myself msg = {text = <msgtext> num = ($g_netfeedsendmessagenum) checksum = netfeedsend float = 1.0 int = 5}
		netfeed \{func = logmessage
			msg = 'Message was NOT sent!'}
	else
		dgsrecorddata event = 'SendFriendsFeedMessage' conditions = [net_dgs_sendfriendsfeedmessage] controller_index = ($primary_controller) debugmsg = 'netfeedsendm'
	endif
endscript

script netfeedsendf 
	if NOT netfeedgeneratemsgtext
		return
	endif
	if NOT netfeed func = sendmessage controller_index = ($primary_controller) qeventhandler = netfeedqeventhandler sendto = myfriends msg = {text = <msgtext> num = ($g_netfeedsendmessagenum) checksum = netfeedsend float = 1.0 int = 5}
		netfeed \{func = logmessage
			msg = 'Message was NOT sent!'}
	else
		dgsrecorddata event = 'SendFriendsFeedMessage' conditions = [net_dgs_sendfriendsfeedmessage] controller_index = ($primary_controller) debugmsg = 'netfeedsendf'
	endif
endscript

script netfeedsendl0 
	if NOT netfeedgeneratemsgtext
		return
	endif
	sendtolist = []
	if NOT netfeed func = sendmessage controller_index = ($primary_controller) qeventhandler = netfeedqeventhandler sendtolist = <sendtolist> msg = {text = <msgtext> num = ($g_netfeedsendmessagenum) checksum = netfeedsend float = 1.0 int = 5}
		netfeed \{func = logmessage
			msg = 'Message was NOT sent!'}
	else
		dgsrecorddata event = 'SendFriendsFeedMessage' conditions = [net_dgs_sendfriendsfeedmessage] controller_index = ($primary_controller) debugmsg = 'netfeedsendl0'
	endif
endscript

script netfeedsendl 
	if NOT netfeedgeneratemsgtext
		return
	endif
	sendtolist = []
	AddArrayElement array = <sendtolist> element = [1 2]
	<sendtolist> = <array>
	AddArrayElement array = <sendtolist> element = [3 4]
	<sendtolist> = <array>
	AddArrayElement array = <sendtolist> element = [5 6]
	<sendtolist> = <array>
	if NOT netfeed func = sendmessage controller_index = ($primary_controller) qeventhandler = netfeedqeventhandler sendtolist = <sendtolist> msg = {text = <msgtext> num = ($g_netfeedsendmessagenum) checksum = netfeedsend float = 1.0 int = 5}
		netfeed \{func = logmessage
			msg = 'Message was NOT sent!'}
	else
		dgsrecorddata event = 'SendFriendsFeedMessage' conditions = [net_dgs_sendfriendsfeedmessage] controller_index = ($primary_controller) debugmsg = 'netfeedsendl'
	endif
endscript

script netfeedtest 
	if NOT netfeed func = isready controller_index = ($primary_controller)
		netfeed \{func = logmessage
			msg = 'netfeedtest: NOT READY!'}
		return
	endif
	netfeedsetup
	netfeed \{func = test}
endscript

script netfeedtestxml1 
	netfeedsetup
	netfeed \{func = testxml1}
endscript

script netfeedtestxml2 
	netfeedsetup
	netfeed \{func = testxml2}
endscript

script netfeeddebugoverlay 
	spawnscript \{netfeeddebugoverlay_create}
endscript

script netfeeddebugoverlay_create 
	netfeeddebugoverlay_destroy
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		Pos = $g_netfeeddebugoverlay_container_pos
		just = $g_netfeeddebugoverlay_just
		id = netfeeddebugoverlay_root_id}
	CreateScreenElement \{Type = SpriteElement
		parent = netfeeddebugoverlay_root_id
		texture = white
		dims = (1180.0, 660.0)
		rgba = [
			0
			0
			0
			64
		]
		Pos = (590.0, 330.0)
		z_priority = 10000
		id = netfeeddebugoverlay_background_id}
	CreateScreenElement \{Type = TextElement
		parent = netfeeddebugoverlay_root_id
		font = $g_netfeeddebugoverlay_text_font
		text = qs(0x00000000)
		Scale = $g_netfeeddebugoverlay_text_scale
		just = $g_netfeeddebugoverlay_just
		Pos = (0.0, 10.0)
		dims = (1180.0, 800.0)
		z_priority = 10001
		rgba = $g_netfeeddebugoverlay_text_color
		id = netfeeddebugoverlay_text_id
		single_line = FALSE}
	RunScriptOnScreenElement \{id = netfeeddebugoverlay_root_id
		netfeeddebugoverlay_task}
	netfeed \{func = overlayenable}
endscript

script netfeeddebugoverlay_destroy 
	if ScreenElementExists \{id = netfeeddebugoverlay_root_id}
		DestroyScreenElement \{id = netfeeddebugoverlay_root_id}
	endif
	netfeed \{func = overlaydisable}
endscript

script netfeeddebugoverlay_loop 
	begin
	if ScreenElementExists \{id = netfeeddebugoverlay_root_id}
		netfeeddebugoverlay_root_id :se_setprops \{alpha = 1.0
			time = 0.5}
		if netfeed \{func = getdebugoverlayinfo}
		else
			<text> = qs(0x00000000)
		endif
		if NOT GotParam \{text}
			<text> = qs(0x00000000)
		endif
		if ScreenElementExists \{id = netfeeddebugoverlay_text_id}
			netfeeddebugoverlay_text_id :se_setprops text = <text>
		endif
	endif
	Wait \{0.1
		Seconds}
	repeat
endscript

script netfeeddebugoverlay_task 
	netfeeddebugoverlay_loop
	netfeeddebugoverlay_destroy
endscript
