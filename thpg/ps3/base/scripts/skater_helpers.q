debug_CAS_show_appearance = 0

script refresh_skater_model 
	pushassetcontext \{context = mission}
	GetCurrentSkaterProfileIndex
	if infrontend
		<skaterIndex> = 0
	else
		<skaterIndex> = <currentskaterprofileindex>
	endif
	RefreshSkaterModel context = skater0 profile = <currentskaterprofileindex> skater = <skaterIndex>
	RefreshSkaterScale profile = <currentskaterprofileindex> skater = <skaterIndex>
	RefreshSkaterVisibility profile = <currentskaterprofileindex> skater = <skaterIndex>
	popassetcontext
endscript

script refresh_skater_model_for_cheats 
	<refresh_both_skaters> = 0
	if insplitscreengame
		<refresh_both_skaters> = 1
		if infrontend
			<refresh_both_skaters> = 0
		endif
	endif
	if (<refresh_both_skaters> = 1)
		RefreshSkaterScale profile = 0 skater = 0
		RefreshSkaterVisibility profile = 0 skater = 0
		RefreshSkaterScale profile = 1 skater = 1
		RefreshSkaterVisibility profile = 1 skater = 1
	else
		GetCurrentSkaterProfileIndex
		if infrontend
			<skaterIndex> = 0
		else
			<skaterIndex> = <currentskaterprofileindex>
		endif
		RefreshSkaterScale profile = <currentskaterprofileindex> skater = <skaterIndex>
		RefreshSkaterVisibility profile = <currentskaterprofileindex> skater = <skaterIndex>
	endif
endscript

script scalingmenu_get_xyz 
	GetCurrentSkaterProfileIndex
	GetPlayerAppearancePart player = <currentskaterprofileindex> part = <part>
	if NOT gotparam use_default_scale
		<use_default_scale> = 1
	endif
	if NOT gotparam x
		<x> = 100
	endif
	if NOT gotparam y
		<y> = 100
	endif
	if NOT gotparam z
		<z> = 100
	endif
	if (<use_default_scale> = 1)
		<x> = 100
		<y> = 100
		<z> = 100
	endif
	return x = <x> y = <y> z = <z>
endscript

script Skater_Get_Viewport 
	if insplitscreengame
		obj_getid
		casttointeger \{objid}
		if (<objid> = 1)
			return \{viewport = 1}
		else
			if (<objid> = 0)
				return \{viewport = 0}
			else
				scriptassert 'Skater_Get_Viewport failed with player %d!' d = <objid>
			endif
		endif
	else
		return \{viewport = 0}
	endif
endscript

script cas_apply_outline 
	if gotparam \{show_outline}
		<objid> :obj_setoutlineflag on
	else
		<objid> :obj_setoutlineflag off
	endif
endscript
