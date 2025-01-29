
script temp_goal_counter_create \{label = qs(0xc5a34f17)
		Pos = (900.0, 150.0)
		count = 0
		complete = pass
		target = 10}
	if ScreenElementExists \{id = temp_goal_counter_container}
		DestroyScreenElement \{id = temp_goal_counter_container}
	endif
	CreateScreenElement \{id = temp_goal_counter_container
		type = ContainerElement
		parent = root_window}
	temp_goal_counter_create_element name = 'tgc_label' text = <label> Pos = <Pos>
	<count_pos> = (<Pos> + (-35.0, 70.0))
	FormatText TextName = count_text qs(0x0787478b) c = <count>
	temp_goal_counter_create_element name = 'tgc_count' text = <count_text> Pos = <count_pos> just = [right center]
	tgc_count :SetTags count = <count> complete = <complete> target = <target> label = <label>
	<of_pos> = (<Pos> + (0.0, 65.0))
	temp_goal_counter_create_element name = 'tgc_of' text = qs(0x8e590b97) Pos = <of_pos>
	<total_pos> = (<Pos> + (35.0, 70.0))
	FormatText TextName = total_text qs(0x0204c31d) t = <target>
	temp_goal_counter_create_element name = 'tgc_total' text = <total_text> Pos = <total_pos> just = [left center]
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
			spawnscriptnow temp_goal_counter_update_element params = {name = 'tgc_label' update_text = qs(0xec7f3e02) Pos = <Pos> just = <just> Color = <Color>}
			case fail
			spawnscriptnow temp_goal_counter_update_element params = {name = 'tgc_label' update_text = qs(0xe7187b7e) Pos = <Pos> just = <just> Color = <Color>}
		endswitch
	else
		spawnscriptnow temp_goal_counter_update_element params = {name = 'tgc_label' update_text = <label> Pos = <Pos> just = <just>}
	endif
	FormatText TextName = count_text qs(0x0787478b) c = <new_count>
	temp_goal_counter_update_element name = 'tgc_count' update_text = <count_text> Color = <Color> tags = {count = <new_count> complete = <complete> target = <target> label = <label>}
endscript

script temp_goal_counter_destroy 
	temp_goal_counter_fade_element \{name = 'tgc_label'}
	temp_goal_counter_fade_element \{name = 'tgc_count'}
	temp_goal_counter_fade_element \{name = 'tgc_of'}
	temp_goal_counter_fade_element \{name = 'tgc_total'}
	tgc_total :SE_WaitProps
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
	FormatText checksumname = id_check '%i' i = <name>
	if ScreenElementExists id = <id_check>
		DestroyScreenElement id = <id_check>
	endif
	CreateScreenElement {
		id = <id_check>
		type = TextElement
		parent = temp_goal_counter_container
		font = debug
		text = <text>
		scale = 1.5
		Pos = <Pos>
		just = <just>
		rgba = [150 185 200 255]
		z_priority = 80
	}
	FormatText checksumname = shadow_id '%i_shadow' i = <name>
	if ScreenElementExists id = <shadow_id>
		DestroyScreenElement id = <shadow_id>
	endif
	CreateScreenElement {
		id = <shadow_id>
		type = TextElement
		parent = temp_goal_counter_container
		font = debug
		text = <text>
		scale = 1.5
		Pos = (<Pos> + (1.0, 1.0))
		just = <just>
		rgba = [0 0 0 255]
		z_priority = 79
	}
	<id_check> :SE_SetProps alpha = 0
	<shadow_id> :SE_SetProps alpha = 0
	<id_check> :SE_SetProps alpha = 1 time = 0.120000005
	<shadow_id> :SE_SetProps alpha = 1 time = 0.120000005
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
	FormatText checksumname = id_check '%i' i = <name>
	<id_check> :SE_GetProps
	if ScreenElementExists id = <id_check>
		DestroyScreenElement id = <id_check>
	endif
	CreateScreenElement {
		id = <id_check>
		type = TextElement
		parent = temp_goal_counter_container
		font = debug
		text = <update_text>
		scale = 1.5
		Pos = <Pos>
		just = <just>
		rgba = <Color>
		z_priority = 80
	}
	FormatText checksumname = shadow_id '%i_shadow' i = <name>
	if ScreenElementExists id = <shadow_id>
		DestroyScreenElement id = <shadow_id>
	endif
	CreateScreenElement {
		id = <shadow_id>
		type = TextElement
		parent = temp_goal_counter_container
		font = debug
		text = <update_text>
		scale = 1.5
		Pos = (<Pos> + (1.0, 1.0))
		just = <just>
		rgba = [0 0 0 255]
		z_priority = 79
	}
	if ScreenElementExists id = <id_check>
		<id_check> :SetTags <tags>
	endif
	wait \{0.5
		second}
	if ScreenElementExists id = <id_check>
		<id_check> :SE_SetProps rgba = [150 185 200 255] time = 0.25
	endif
endscript

script temp_goal_counter_fade_element 
	FormatText checksumname = id_check '%i' i = <name>
	FormatText checksumname = shadow_id '%i_shadow' i = <name>
	<id_check> :SE_SetProps alpha = 0 time = 0.120000005
	<shadow_id> :SE_SetProps alpha = 0 time = 0.120000005
endscript
