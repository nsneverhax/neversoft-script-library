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
	qs(0x2d0edba4)
	qs(0x9c350bf5)
	qs(0x655a4e6a)
	qs(0xe7e07ba5)
	qs(0x0a448658)
	qs(0x567d8616)
	qs(0x226f8e04)
	qs(0x5b11ba94)
	qs(0x0c37eb24)
	qs(0xffdb7a45)
	qs(0x40528a9f)
	qs(0x352d8feb)
	qs(0x9f20f58e)
	qs(0xe0a438a2)
	qs(0xce28ceaf)
	qs(0xf95fb75a)
	qs(0xb3a7cbaa)
	qs(0x469a136e)
	qs(0x0fa5e506)
	qs(0xda117746)
	qs(0xd78eac26)
	qs(0xb49f10b5)
	qs(0xc96ce10c)
	qs(0xc40dcc34)
	qs(0x672810e3)
	qs(0x6da33308)
	qs(0x19507b48)
	qs(0xacde80bb)
	qs(0xab98d0bf)
	qs(0x22872dfc)
	qs(0x16c4b4c4)
	qs(0xaaae64c2)
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
