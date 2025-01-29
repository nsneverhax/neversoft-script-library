drum_idlepoint_arm_shit = 0.4521
drum_idlepoint_arm_mhit = 0.125
drum_idlepoint_foot_hit = 0.391
drum_slowest_arm_hit = 2433.33
drum_medium_arm_hit = 533.33
drum_fastest_arm_hit = 166.66
drummer_offset = 0.3
longest_transit = 3000.0
number_drummers_created = 4

script drummer_controlscript 
	0x28936188
	begin
	GetSongTimeMs time_offset = <drummer_offset>
	if (<time> >= -2000.0)
		break
	endif
	WaitOneGameFrame
	repeat
	WaitOneGameFrame
	begin
	0x1de53810
	getframelength
	frame_length1 = (<frame_length> * 1000.0)
	WaitOneGameFrame
	getframelength
	frame_length = ((<frame_length> * 1000.0) + <frame_length1>)
	0x1de53810 frame_length = <frame_length>
	WaitOneGameFrame
	repeat
endscript

script check_for_drummers 
	array = []
	num_drummers = 0
	musician_id = musician1
	musician_info = musician1_info
	index = 0
	begin
	switch <index>
		case 0
		musician_id = GUITARIST
		musician_info = guitarist_info
		case 1
		musician_id = BASSIST
		musician_info = bassist_info
		case 2
		musician_id = vocalist
		musician_info = vocalist_info
		case 3
		musician_id = drummer
		musician_info = drummer_info
	endswitch
	if ($<musician_info>.part = drum)
		addchecksumarrayelement array = <array> element = <musician_id>
		num_drummers = (<num_drummers> + 1)
		if (<num_drummers> >= $number_drummers_created)
			break
		endif
	endif
	index = (<index> + 1)
	repeat 4
	if (<num_drummers> > 0)
		return true drummer_ids = <array> num_drummers = <num_drummers>
	else
		return \{FALSE}
	endif
endscript
