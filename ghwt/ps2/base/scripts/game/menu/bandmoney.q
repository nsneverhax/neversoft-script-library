
script create_band_money_display 
	destroy_band_money_display
	CreateScreenElement \{parent = root_window
		Type = descinterface
		id = band_money_id
		desc = 'band_money'}
	refresh_band_money_display savegame = <savegame>
endscript

script destroy_band_money_display 
	if ScreenElementExists \{id = band_money_id}
		DestroyScreenElement \{id = band_money_id}
	endif
endscript

script refresh_band_money_display savegame = ($cas_current_savegame)
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	formatText TextName = cash_text qs(0x7e81ee2f) i = <cash>
	formatText TextName = earnings_text qs(0x7e81ee2f) i = <career_earnings>
	if ScreenElementExists \{id = band_money_id}
		SetScreenElementProps {
			id = band_money_id
			cash_available_value_text = <cash_text>
			career_earnings_value_text = <earnings_text>
		}
	endif
endscript

script decrease_band_money savegame = ($cas_current_savegame)

	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	cash = (<cash> - <price>)
	SetGlobalTags <band_info> params = {cash = <cash>} savegame = <savegame>
	refresh_band_money_display savegame = <savegame>
endscript

script increase_band_money savegame = ($cas_current_savegame)

	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	cash = (<cash> + <amount>)
	SetGlobalTags <band_info> params = {cash = <cash>} savegame = <savegame>
	refresh_band_money_display savegame = <savegame>
endscript

script increase_band_money_by_100000 
	get_savegame_from_controller controller = ($primary_controller)
	increase_band_money amount = 100000 savegame = <savegame>
	increase_career_earnings amount = 100000 savegame = <savegame>
endscript

script bankrupt_band 
	get_savegame_from_controller controller = ($primary_controller)
	set_band_money value = 0 savegame = <savegame>
endscript

script set_band_money savegame = ($cas_current_savegame)

	get_current_band_info
	SetGlobalTags <band_info> params = {cash = <value>} savegame = <savegame>
	refresh_band_money_display savegame = <savegame>
endscript

script get_band_money cash = 0 savegame = ($cas_current_savegame)
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	return cash = <cash>
endscript

script has_enough_money savegame = ($cas_current_savegame)

	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	if (<price> > <cash>)
		return \{FALSE}
	else
		return \{true}
	endif
endscript

script increase_career_earnings savegame = ($cas_current_savegame)

	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	career_earnings = (<career_earnings> + <amount>)
	SetGlobalTags <band_info> params = {career_earnings = <career_earnings>} savegame = <savegame>
	refresh_band_money_display savegame = <savegame>
endscript

script increase_band_cash_and_earnings 

	get_savegame_from_controller controller = ($primary_controller)
	increase_career_earnings amount = <amount> savegame = <savegame>
	increase_band_money amount = <amount> savegame = <savegame>
endscript
