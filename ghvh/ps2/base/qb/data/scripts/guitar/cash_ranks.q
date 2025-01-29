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
	qs(0xcf59c2bf)
	qs(0x2c5a2fc5)
	qs(0x4dbc9c20)
	qs(0xceb02782)
	qs(0x41fc539a)
	qs(0x265e397e)
	qs(0xc4aa9183)
	qs(0xe2780b9f)
	qs(0x6feec330)
	qs(0xef04b592)
	qs(0x808f6fda)
	qs(0x45b12531)
	qs(0xf106792b)
	qs(0xc0665950)
	qs(0xc7387d4d)
	qs(0x38df31e2)
	qs(0xb3c263bf)
	qs(0xa63cfd51)
	qs(0x7ac86fa2)
	qs(0xa41e5383)
	qs(0xf0c2ecec)
	qs(0x69a18a41)
	qs(0xe0245eeb)
	qs(0xb699d738)
	qs(0x32367291)
	qs(0x2b58c5db)
	qs(0xf0cac077)
	qs(0xd476bffd)
	qs(0xb19418cc)
	qs(0xa25e5b6d)
	qs(0x23994e1f)
	qs(0x07ffb37d)
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

	return rank = <rank> cash_to_next_rank = <next_rank> turnovers = <passes> cash_icon_id = <icon_id>
endscript
