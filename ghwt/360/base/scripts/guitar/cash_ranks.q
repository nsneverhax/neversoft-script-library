cash_rank_thresholds = [
	500
	1000
	2000
	3000
	4500
	6000
	8000
	11000
	15000
	20000
	25000
	30000
	40000
	50000
	60000
	70000
	80000
	90000
	105000
	120000
	135000
	150000
	165000
	180000
	200000
	220000
	240000
	260000
	280000
	305000
	330000
	355000
	380000
	410000
	440000
	470000
	500000
	530000
	565000
	600000
	635000
	670000
	705000
	745000
	785000
	825000
	865000
	910000
	955000
	1000000
]
cash_rank_blurbs = [
	qs(0xc42bd7c8)
	qs(0x4789261f)
	qs(0x9411f77c)
	qs(0x2c734df8)
	qs(0x835b7300)
	qs(0x14c4fcb7)
	qs(0xacd62757)
	qs(0x6a13d940)
	qs(0x461b8c63)
	qs(0x89699fcb)
	qs(0xfd23427b)
	qs(0x303159e6)
	qs(0xef7a4593)
	qs(0x7414fa86)
	qs(0x84cdc39c)
	qs(0x30526080)
	qs(0x2607d454)
	qs(0xa3051224)
	qs(0x929bd266)
	qs(0x2671de43)
	qs(0x475e352b)
	qs(0x5fc354b1)
	qs(0xbda08f72)
	qs(0x9bce4414)
	qs(0x6bab463a)
	qs(0xc40dcc34)
	qs(0x7bb7f182)
	qs(0xebf7eba8)
	qs(0xfb8a6d3f)
	qs(0x1463ac3b)
	qs(0x9375fc6c)
	qs(0xd071686c)
	qs(0x723a0577)
	qs(0xcfcc2453)
	qs(0xf4df704a)
	qs(0x7ea59354)
	qs(0xe69a6d40)
	qs(0x30f1eeac)
	qs(0xbd57b022)
	qs(0xf8b17490)
	qs(0x458e2eb1)
	qs(0xe65a6533)
	qs(0xafaf49bd)
	qs(0x8dbcb56f)
	qs(0xcdee14ae)
	qs(0x51e02d56)
	qs(0xc40b826c)
	qs(0x6e52cc21)
	qs(0xf085d551)
	qs(0xb1e7f6ac)
	qs(0x2e0f9a9b)
	qs(0x4a76135e)
	qs(0x34776117)
	qs(0x3b9ebb54)
	qs(0xc68fb686)
]

script cash_ranks_get_rank \{Player = 1}
	getplayerinfo <Player> controller
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame> param = career_earnings
	passes = 0
	i = 0
	rank = 1
	begin
	Mod a = <i> b = 50
	index = <Mod>
	if (<index> = 0)
		if NOT (<rank> = 1)
			passes = (<passes> + 1)
		endif
	endif
	t1 = ($cash_rank_thresholds [<index>])
	t2 = (<passes> * ($cash_rank_thresholds) [49])
	thresh = (<t1> + <t2>)
	if (<career_earnings> >= <thresh>)
		rank = (<rank> + 1)
	else
		next_rank = <thresh>
		break
	endif
	i = (<i> + 1)
	repeat 250
	if (<rank> >= 251)
		next_rank = (5 * ($cash_rank_thresholds) [49])
		passes = 5
	endif
	return rank = <rank> cash_to_next_rank = <next_rank> turnovers = <passes> career_earnings = <career_earnings>
endscript

script cash_ranks_get_patch_id \{Player = 1}
	cash_ranks_get_rank Player = <Player>
	if (<rank> < 10)
		formatText checksumName = patch_id 'cash_milestones_patch_00%d' d = <rank>
	elseif (<rank> < 51)
		formatText checksumName = patch_id 'cash_milestones_patch_0%d' d = <rank>
	else
		formatText checksumName = patch_id 'cash_milestones_patch_05%d' d = <turnovers>
	endif
	printf channel = mychannel qs(0x2d115755) d = <Player>
	return cash_patch_id = <patch_id>
endscript

script cash_ranks_get_icon_id \{Player = 1}
	cash_ranks_get_rank Player = <Player>
	if (<rank> < 10)
		formatText checksumName = icon_id 'cash_milestone_icon_00%d' d = <rank>
	elseif (<rank> < 51)
		formatText checksumName = icon_id 'cash_milestone_icon_0%d' d = <rank>
	else
		formatText checksumName = icon_id 'cash_milestone_icon_05%d' d = <turnovers>
	endif
	printf channel = mychannel qs(0x9c168131) d = <Player>
	return cash_icon_id = <icon_id>
endscript

script cash_get_info_from_earnings \{earnings = 0}
	passes = 0
	i = 0
	rank = 1
	begin
	Mod a = <i> b = 50
	index = <Mod>
	if (<index> = 0)
		if NOT (<rank> = 1)
			passes = (<passes> + 1)
		endif
	endif
	t1 = ($cash_rank_thresholds [<index>])
	t2 = (<passes> * ($cash_rank_thresholds) [49])
	thresh = (<t1> + <t2>)
	if (<earnings> >= <thresh>)
		rank = (<rank> + 1)
	else
		next_rank = <thresh>
		break
	endif
	i = (<i> + 1)
	repeat 250
	if (<rank> >= 251)
		next_rank = (5 * ($cash_rank_thresholds) [49])
		passes = 5
	endif
	if (<rank> < 10)
		formatText checksumName = icon_id 'cash_milestone_icon_00%d' d = <rank>
	elseif (<rank> < 51)
		formatText checksumName = icon_id 'cash_milestone_icon_0%d' d = <rank>
	else
		formatText checksumName = icon_id 'cash_milestone_icon_05%d' d = <passes>
	endif
	printstruct channel = mychannel <...>
	return rank = <rank> cash_icon_id = <icon_id>
endscript
