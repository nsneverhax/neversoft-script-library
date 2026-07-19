
script create_band_money_display 
	destroy_band_money_display
	CreateScreenElement \{parent = root_window
		type = DescInterface
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
	FormatText TextName = cash_text qs("\L$%i") i = <Cash>
	FormatText TextName = earnings_text qs("\L$%i") i = <career_earnings>
	if ScreenElementExists \{id = band_money_id}
		SetScreenElementProps {
			id = band_money_id
			cash_available_value_text = <cash_text>
			career_earnings_value_text = <earnings_text>
		}
	endif
endscript

script decrease_band_money savegame = ($cas_current_savegame)
	RequireParams \{[
			price
		]
		all}
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	Cash = (<Cash> - <price>)
	SetGlobalTags <band_info> params = {Cash = <Cash>} savegame = <savegame>
	refresh_band_money_display savegame = <savegame>
endscript

script increase_band_money savegame = ($cas_current_savegame)
	RequireParams \{[
			amount
		]
		all}
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	Cash = (<Cash> + <amount>)
	SetGlobalTags <band_info> params = {Cash = <Cash>} savegame = <savegame>
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
	RequireParams \{[
			value
		]
		all}
	get_current_band_info
	SetGlobalTags <band_info> params = {Cash = <value>} savegame = <savegame>
	refresh_band_money_display savegame = <savegame>
endscript

script get_band_money Cash = 0 savegame = ($cas_current_savegame)
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	return Cash = <Cash>
endscript

script has_enough_money savegame = ($cas_current_savegame)
	RequireParams \{[
			price
		]
		all}
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	if (<price> > <Cash>)
		return \{false}
	else
		return \{true}
	endif
endscript

script increase_career_earnings savegame = ($cas_current_savegame)
	RequireParams \{[
			amount
		]
		all}
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	career_earnings = (<career_earnings> + <amount>)
	SetGlobalTags <band_info> params = {career_earnings = <career_earnings>} savegame = <savegame>
	refresh_band_money_display savegame = <savegame>
endscript

script increase_band_cash_and_earnings 
	RequireParams \{[
			amount
		]
		all}
	get_savegame_from_controller controller = ($primary_controller)
	increase_career_earnings amount = <amount> savegame = <savegame>
	increase_band_money amount = <amount> savegame = <savegame>
endscript
