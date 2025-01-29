cash_rank_thresholds = [
	500
	2000
	4500
	8000
	12500
	14000
	18000
	20000
	22000
	26000
	30000
	33000
	37000
	45000
	51000
	60000
	67000
	80000
	90000
	106000
	124000
	140000
	161000
	185000
	210000
	250000
	287000
	334000
	417000
	500000
]
cash_rank_blurbs = [
	qs(0xf73c77cc)
	qs(0xe2b166bb)
	qs(0x41fbd6fd)
	qs(0xea6d7ea0)
	qs(0xf5f7117e)
	qs(0x17f02a02)
	qs(0xe2311e9b)
	qs(0x918b1454)
	qs(0xd1090bb7)
	qs(0xf4bd2f5f)
	qs(0x831760bb)
	qs(0x83a5635c)
	qs(0xc7a069b3)
	qs(0x76631f24)
	qs(0x5e1aeec9)
	qs(0x8389d3e4)
	qs(0x7fff55a8)
	qs(0xb609dbd9)
	qs(0xf2b67dfe)
	qs(0x6ea65855)
	qs(0x0db7c298)
	qs(0xdfba30dd)
	qs(0x1f93c4b6)
	qs(0x9ea3d715)
	qs(0xa8454b0c)
	qs(0xa5356a62)
	qs(0x936afe97)
	qs(0x688e6524)
	qs(0x3c93d207)
	qs(0x3c63e464)
	qs(0x13999b56)
	qs(0x87a5bc84)
]

script cash_ranks_get_rank \{Player = 1}
	getplayerinfo <Player> controller
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame> param = career_earnings
	cash_get_info_from_earnings earnings = <career_earnings>
	return rank = <rank> cash_to_next_rank = <cash_to_next_rank> turnovers = <passes> career_earnings = <career_earnings>
endscript

script cash_ranks_get_patch_id \{Player = 1}
	cash_ranks_get_rank Player = <Player>
	if (<rank> > 30)
		rank = 30
	endif
	if (<rank> < 10)
		formatText checksumName = patch_id 'cash_milestones_patch_00%d' d = <rank>
	else
		formatText checksumName = patch_id 'cash_milestones_patch_0%d' d = <rank>
	endif
	printf channel = mychannel qs(0x2d115755) d = <Player>
	return cash_patch_id = <patch_id>
endscript

script cash_ranks_get_icon_id \{Player = 1}
	cash_ranks_get_rank Player = <Player>
	if (<rank> > 30)
		rank = 30
	endif
	if (<rank> < 10)
		formatText checksumName = icon_id 'cash_milestone_icon_00%d' d = <rank>
	else
		formatText checksumName = icon_id 'cash_milestone_icon_0%d' d = <rank>
	endif
	printf channel = mychannel qs(0x9c168131) d = <Player>
	return cash_icon_id = <icon_id>
endscript

script cash_get_info_from_earnings \{earnings = 0}
	passes = 0
	i = 0
	rank = 1
	begin
	Mod a = <i> b = 30
	index = <Mod>
	if (<index> = 0)
		if NOT (<rank> = 1)
			passes = (<passes> + 1)
		endif
	endif
	t1 = ($cash_rank_thresholds [<index>])
	t2 = (<passes> * ($cash_rank_thresholds) [29])
	thresh = (<t1> + <t2>)
	if (<earnings> >= <thresh>)
		rank = (<rank> + 1)
	else
		next_rank = <thresh>
		break
	endif
	i = (<i> + 1)
	repeat 150
	if (<rank> >= 151)
		next_rank = (5 * ($cash_rank_thresholds) [29])
		passes = 5
	endif
	icon_rank = <rank>
	if (<icon_rank> > 30)
		icon_rank = 30
	endif
	if (<rank> < 10)
		formatText checksumName = icon_id 'cash_milestone_icon_00%d' d = <icon_rank>
	else
		formatText checksumName = icon_id 'cash_milestone_icon_0%d' d = <icon_rank>
	endif
	printstruct channel = mychannel <...>
	return rank = <rank> cash_to_next_rank = <next_rank> turnovers = <passes> cash_icon_id = <icon_id>
endscript
