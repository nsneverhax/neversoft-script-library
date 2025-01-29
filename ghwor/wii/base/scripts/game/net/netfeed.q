g_netfeeddebugoverlay_container_pos = (50.0, 30.0)
g_netfeeddebugoverlay_text_font = fontgrid_text_a1
g_netfeeddebugoverlay_text_color = [
	255
	255
	255
	255
]
g_netfeeddebugoverlay_text_scale = (0.25, 0.25)
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

script netfeedsetup 
	netfeed func = createsender controller_index = ($primary_controller)
	netfeed func = createlocalinbox controller_index = ($primary_controller)
	netfeed func = registernewmessagewaitingeventhandler controller_index = ($primary_controller) qeventhandler = netfeedqeventhandler
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

script netfeeddebugoverlay_destroy 
	if ScreenElementExists \{id = netfeeddebugoverlay_root_id}
		DestroyScreenElement \{id = netfeeddebugoverlay_root_id}
	endif
	netfeed \{func = overlaydisable}
endscript
