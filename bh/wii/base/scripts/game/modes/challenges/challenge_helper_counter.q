
script temp_goal_counter_create \{label = qs(0xc5a34f17)
		Pos = (900.0, 150.0)
		count = 0
		complete = pass
		target = 10}
	if ScreenElementExists \{id = temp_goal_counter_container}
		DestroyScreenElement \{id = temp_goal_counter_container}
	endif
	CreateScreenElement \{id = temp_goal_counter_container
		Type = ContainerElement
		parent = root_window}
	temp_goal_counter_create_element Name = 'tgc_label' text = <label> Pos = <Pos>
	<count_pos> = (<Pos> + (-35.0, 70.0))
	formatText TextName = count_text qs(0x0787478b) c = <count>
	temp_goal_counter_create_element Name = 'tgc_count' text = <count_text> Pos = <count_pos> just = [right center]
	tgc_count :SetTags count = <count> complete = <complete> target = <target> label = <label>
	<of_pos> = (<Pos> + (0.0, 65.0))
	temp_goal_counter_create_element Name = 'tgc_of' text = qs(0x8e590b97) Pos = <of_pos>
	<total_pos> = (<Pos> + (35.0, 70.0))
	formatText TextName = total_text qs(0x0204c31d) t = <target>
	temp_goal_counter_create_element Name = 'tgc_total' text = <total_text> Pos = <total_pos> just = [left center]
endscript

script temp_goal_counter_update \{new_count = 0}
	tgc_count :GetTags
	if (<count> < <new_count>)
		switch <complete>
			case pass
			Color = [100 200 100 255]
			case fail
			Color = [200 100 100 255]
		endswitch
	elseif (<count> > <new_count>)
		switch <complete>
			case pass
			Color = [200 100 100 255]
			case fail
			Color = [100 200 100 255]
		endswitch
	else
		return
	endif
	if NOT (<new_count> < <target>)
		switch <complete>
			case pass
			SpawnScriptNow temp_goal_counter_update_element params = {Name = 'tgc_label' update_text = qs(0xec7f3e02) Pos = <Pos> just = <just> Color = <Color>}
			case fail
			SpawnScriptNow temp_goal_counter_update_element params = {Name = 'tgc_label' update_text = qs(0xe7187b7e) Pos = <Pos> just = <just> Color = <Color>}
		endswitch
	else
		SpawnScriptNow temp_goal_counter_update_element params = {Name = 'tgc_label' update_text = <label> Pos = <Pos> just = <just>}
	endif
	formatText TextName = count_text qs(0x0787478b) c = <new_count>
	temp_goal_counter_update_element Name = 'tgc_count' update_text = <count_text> Color = <Color> tags = {count = <new_count> complete = <complete> target = <target> label = <label>}
endscript

script temp_goal_counter_destroy 
	temp_goal_counter_fade_element \{Name = 'tgc_label'}
	temp_goal_counter_fade_element \{Name = 'tgc_count'}
	temp_goal_counter_fade_element \{Name = 'tgc_of'}
	temp_goal_counter_fade_element \{Name = 'tgc_total'}
	tgc_total :se_waitprops
	if ScreenElementExists \{id = temp_goal_counter_container}
		DestroyScreenElement \{id = temp_goal_counter_container}
	endif
endscript

script temp_goal_counter_destroy_fast 
	if ScreenElementExists \{id = temp_goal_counter_container}
		DestroyScreenElement \{id = temp_goal_counter_container}
	endif
endscript

script temp_goal_counter_create_element \{just = [
			center
			center
		]}
	formatText checksumName = id_check '%i' i = <Name>
	if ScreenElementExists id = <id_check>
		DestroyScreenElement id = <id_check>
	endif
	CreateScreenElement {
		id = <id_check>
		Type = TextElement
		parent = temp_goal_counter_container
		font = debug
		text = <text>
		Scale = 1.5
		Pos = <Pos>
		just = <just>
		rgba = [150 185 200 255]
		z_priority = 80
	}
	formatText checksumName = shadow_id '%i_shadow' i = <Name>
	if ScreenElementExists id = <shadow_id>
		DestroyScreenElement id = <shadow_id>
	endif
	CreateScreenElement {
		id = <shadow_id>
		Type = TextElement
		parent = temp_goal_counter_container
		font = debug
		text = <text>
		Scale = 1.5
		Pos = (<Pos> + (1.0, 1.0))
		just = <just>
		rgba = [0 0 0 255]
		z_priority = 79
	}
	<id_check> :se_setprops alpha = 0
	<shadow_id> :se_setprops alpha = 0
	<id_check> :se_setprops alpha = 1 time = 0.120000005
	<shadow_id> :se_setprops alpha = 1 time = 0.120000005
endscript

script temp_goal_counter_update_element \{just = [
			center
			center
		]
		Color = [
			150
			185
			200
			255
		]
		tags = {
		}}
	formatText checksumName = id_check '%i' i = <Name>
	<id_check> :se_getprops
	if ScreenElementExists id = <id_check>
		DestroyScreenElement id = <id_check>
	endif
	CreateScreenElement {
		id = <id_check>
		Type = TextElement
		parent = temp_goal_counter_container
		font = debug
		text = <update_text>
		Scale = 1.5
		Pos = <Pos>
		just = <just>
		rgba = <Color>
		z_priority = 80
	}
	formatText checksumName = shadow_id '%i_shadow' i = <Name>
	if ScreenElementExists id = <shadow_id>
		DestroyScreenElement id = <shadow_id>
	endif
	CreateScreenElement {
		id = <shadow_id>
		Type = TextElement
		parent = temp_goal_counter_container
		font = debug
		text = <update_text>
		Scale = 1.5
		Pos = (<Pos> + (1.0, 1.0))
		just = <just>
		rgba = [0 0 0 255]
		z_priority = 79
	}
	if ScreenElementExists id = <id_check>
		<id_check> :SetTags <tags>
	endif
	Wait \{0.5
		Second}
	if ScreenElementExists id = <id_check>
		<id_check> :se_setprops rgba = [150 185 200 255] time = 0.25
	endif
endscript

script temp_goal_counter_fade_element 
	formatText checksumName = id_check '%i' i = <Name>
	formatText checksumName = shadow_id '%i_shadow' i = <Name>
	<id_check> :se_setprops alpha = 0 time = 0.120000005
	<shadow_id> :se_setprops alpha = 0 time = 0.120000005
endscript
