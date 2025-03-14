cas_randomized_parts = [
	{
		part = CAS_Head
		force_random_colors = $cas_skintone_random_colors
	}
	{
		part = cas_eyes
	}
	{
		part = cas_hair
		force_random_colors = $cas_hair_random_colors
	}
	{
		part = cas_legs
		force_random_colors = $cas_pants_random_colors
	}
	{
		part = cas_torso
		force_random_colors = $cas_torso_random_colors
	}
	{
		part = cas_shoes
		force_random_colors = $cas_torso_random_colors
	}
	{
		part = CAS_Glasses
	}
	{
		part = cas_socks
		force_random_colors = $cas_socks_random_colors
	}
	{
		part = cas_hat
		force_random_colors = $cas_hat_random_colors
	}
	{
		part = CAS_Buckle
	}
	{
		part = cas_belt
	}
	{
		part = CAS_Accessory01
		force_random_colors = $cas_torso_random_colors
	}
	{
		part = CAS_Accessory02
		force_random_colors = $cas_torso_random_colors
	}
	{
		part = CAS_Accessory03
		force_random_colors = $cas_torso_random_colors
	}
	{
		part = CAS_Accessory04
		force_random_colors = $cas_torso_random_colors
	}
	{
		part = CAS_Torso_Sec
		color_only
		color_parent = cas_torso
		force_random_colors = $cas_torso_random_colors
	}
	{
		part = CAS_Hat_Sec
		color_only
		color_parent = cas_hat
		force_random_colors = $cas_hat_random_colors
	}
	{
		part = cas_facial_hair
		color_parent = cas_hair
		force_random_colors = $cas_hair_random_colors
	}
	{
		part = CAS_Shoes_Sec
		color_only
		color_parent = cas_shoes
		force_random_colors = $cas_torso_random_colors
	}
	{
		part = cas_board
		color_only
		force_random_colors = $cas_torso_random_colors
	}
	{
		part = CAS_DECK_GRAPHIC
	}
	{
		part = CAS_GRIPTAPE
	}
	{
		part = CAS_WHEEL
	}
	{
		part = CAS_Trucks
		color_only
		force_random_colors = $cas_torso_random_colors
	}
]
cas_randomizer_price_cap = 100

script cas_set_random_appearance 
	randomize
	stars
	printf 'Generating random skater appearance - Seed=%s' s = <rand_seed>
	stars
	random_appearance = ($appearance_custom_skater_CAREER)
	getarraysize $cas_randomized_parts
	i = 0
	begin
	cas_set_random_appearance_part part = ($cas_randomized_parts [<i>])
	i = (<i> + 1)
	repeat <array_size>
	i = 0
	begin
	cas_random_handle_exclusions part = ($cas_randomized_parts [<i>])
	i = (<i> + 1)
	repeat <array_size>
	getarraysize $cas_randomized_parts
	i = 0
	begin
	part = (($cas_randomized_parts) [<i>].part)
	cas_set_random_color_part part = ($cas_randomized_parts [<i>])
	i = (<i> + 1)
	repeat <array_size>
	cas_propogate_head_color
	cas_propogate_hair_color
	printcurrentappearance
endscript

script cas_set_random_appearance_part 
	part_name = (<part>.part)
	part_array = ($<part_name>)
	if NOT structurecontains structure = <part> color_only
		getarraysize <part_array>
		if cas_pick_random_part part_name = <part_name> except_for = <except_for>
			desc_id = (<random_part>.desc_id)
			cas_handle_disqualifications part = <part_name> desc_id = <desc_id>
			if gotparam new_desc_id
				desc_id = <new_desc_id>
			endif
			GetCurrentSkaterProfileIndex
			EditPlayerAppearance profile = <currentskaterprofileindex> target = setpart targetparams = {part = <part_name> desc_id = <desc_id>}
		endif
	endif
endscript

script cas_pick_random_part 
	getarraysize $<part_name>
	filtered_array = []
	i = 0
	begin
	cas_item_is_visible part = <part_name> part_index = <i>
	if structurecontains structure = ($<part_name> [<i>]) unlock_flag
		<is_visible> = 0
	endif
	if structurecontains structure = ($<part_name> [<i>]) price
		if ((($<part_name> [<i>]).price) > ($cas_randomizer_price_cap))
			<is_visible> = 0
		endif
	endif
	if gotparam except_for
		if checksumequals a = (($<part_name> [<i>]).desc_id) b = <except_for>
			is_visible = 0
		endif
	endif
	if (<is_visible> = 1)
		new_part = ($<part_name> [<i>])
		new_entry = [{<new_part>}]
		filtered_array = (<filtered_array> + <new_entry>)
	endif
	i = (<i> + 1)
	repeat <array_size>
	getarraysize <filtered_array>
	if (<array_size> > 0)
		cas_get_total_random_weight array = <filtered_array>
		getrandomvalue name = rand_val a = 0.0 b = <total_weight> resolution = 10000
		i = 0
		begin
		cas_get_random_weight part = (<filtered_array> [<i>])
		if (<random_weight> > 0.0)
			if (<rand_val> <= <random_weight>)
				break
			endif
		endif
		rand_val = (<rand_val> - <random_weight>)
		i = (<i> + 1)
		repeat <array_size>
		if (<i> = <array_size>)
			i = (<array_size> - 1)
		endif
		return true random_part = ((<filtered_array>) [<i>])
	endif
	return false
endscript

script cas_get_random_weight 
	random_weight = 1.0
	if structurecontains structure = <part> random_weight
		random_weight = (<part>.random_weight)
	endif
	return random_weight = <random_weight>
endscript

script cas_get_total_random_weight 
	total = 0.0
	getarraysize <array>
	i = 0
	begin
	cas_get_random_weight part = (<array> [<i>])
	if (<random_weight> < 0.0)
		scriptassert \{'No negative weights!'}
	endif
	total = (<total> + <random_weight>)
	i = (<i> + 1)
	repeat <array_size>
	return total_weight = <total>
endscript

script cas_set_random_color_part 
	GetCurrentSkaterProfileIndex
	if checksumequals a = (<part>.part) b = cas_facial_hair
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = (<part>.color_parent)
			if gotparam h
				SetPlayerAppearanceColor player = <currentskaterprofileindex> part = (<part>.part) h = <h> s = <s> v = <v> use_default_diffuse = <use_default_diffuse>
			endif
		endif
	else
		part_name = (<part>.part)
		if structurecontains structure = <part> color_parent
			part_name = (<part>.color_parent)
		endif
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <part_name>
			if structurecontains structure = <part> color_only
				SetPlayerAppearanceColor player = <currentskaterprofileindex> part = (<part>.part) h = 0 s = 0 v = 0 use_default_diffuse = 1
			endif
			if cas_pick_random_color part = <part_name> desc_id = <desc_id>
				SetPlayerAppearanceColor player = <currentskaterprofileindex> part = (<part>.part) h = <h> s = <s> v = <v> use_default_diffuse = 0
			endif
		endif
	endif
endscript

script cas_rand_color_check_parent 
	if structurecontains structure = <part> color_parent
		GetCurrentSkaterProfileIndex
		GetPlayerAppearancePart player = <currentskaterprofileindex> part = (<part>.color_parent)
		getactualcasoptionstruct part = (<part>.color_parent) desc_id = <desc_id>
		if gotparam \{use_default_diffuse}
			if (<use_default_diffuse> = 0)
				return \{true}
			endif
		endif
		return \{false}
	endif
	return \{true}
endscript

script cas_can_pick_random_color 
	if gotparam desc_id
		getactualcasoptionstruct part = <part> desc_id = <desc_id>
		if gotparam random_colors
			return true rand_colors = (<random_colors>)
		elseif gotparam force_random
			getarraysize $cas_randomized_parts
			i = 0
			begin
			if checksumequals a = (($cas_randomized_parts [<i>]).part) b = <part>
				if structurecontains structure = ($cas_randomized_parts [<i>]) force_random_colors
					return true rand_colors = (($cas_randomized_parts [<i>]).force_random_colors)
				endif
				return false
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return false
endscript

script cas_pick_random_color 
	if cas_can_pick_random_color <...>
		getarraysize <rand_colors>
		i = 0
		total_weight = 0
		begin
		if NOT cas_should_ignore_random_color <...>
			total_weight = (<total_weight> + ((<rand_colors> [<i>]).weight))
		endif
		i = (<i> + 1)
		repeat <array_size>
		getrandomvalue name = rand_val a = 0.0 b = <total_weight> resolution = 10000
		i = 0
		begin
		if NOT cas_should_ignore_random_color <...>
			if (<rand_val> <= ((<rand_colors> [<i>]).weight))
				break
			endif
			rand_val = (<rand_val> - ((<rand_colors> [<i>]).weight))
		endif
		i = (<i> + 1)
		repeat <array_size>
		if (<i> = <array_size>)
			i = (<array_size> - 1)
		endif
		if structurecontains structure = (<rand_colors> [<i>]) h
			return true h = ((<rand_colors> [<i>]).h) s = ((<rand_colors> [<i>]).s) v = ((<rand_colors> [<i>]).v)
		endif
	endif
	return false
endscript

script cas_should_ignore_random_color 
	if NOT structurecontains structure = (<rand_colors> [<i>]) h
		if gotparam \{force_random}
			return \{true}
		endif
	endif
	return \{false}
endscript

script cas_random_handle_exclusions 
	if NOT structurecontains structure = <part> color_only
		GetCurrentSkaterProfileIndex
		if GetPlayerAppearancePart player = <currentskaterprofileindex> part = (<part>.part)
			getactualcasoptionstruct part = (<part>.part) desc_id = <desc_id>
			if gotparam \{random_exclude}
				cas_random_handle_exclusions_scanner {
					checking_part = (<part>.part)
					exclusions = <random_exclude>
				}
			endif
		endif
	endif
endscript

script cas_random_handle_exclusions_scanner 
	printf 'cas_random_handle_exclusions_scanner'
	getarraysize $cas_randomized_parts
	i = 0
	begin
	part_struct = (($cas_randomized_parts) [<i>])
	part_type = (<part_struct>.part)
	if structurecontains structure = <exclusions> <part_type>
		if cas_random_find_exclusion other_part = <part_type> exclusions = (<exclusions>.<part_type>)
			printf 'Exclusions checker found...'
			printstruct <...>
			begin
			cas_set_random_appearance_part part = <part_struct> except_for = <desc_id>
			if NOT cas_random_find_exclusion other_part = <part_type> exclusions = (<exclusions>.<part_type>)
				printf 'Fixed it! Chose %d instead' d = <desc_id>
				break
			endif
			repeat 1000
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script cas_random_find_exclusion 
	GetCurrentSkaterProfileIndex
	if GetPlayerAppearancePart player = <currentskaterprofileindex> part = <other_part>
		getarraysize <exclusions>
		i = 0
		begin
		if checksumequals a = <desc_id> b = (<exclusions> [<i>])
			return true desc_id = <desc_id>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return false desc_id = <desc_id>
endscript
