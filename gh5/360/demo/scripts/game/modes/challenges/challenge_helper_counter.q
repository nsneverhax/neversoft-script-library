
script temp_goal_counter_create \{label = qs(0xc5a34f17)
		pos = (900.0, 150.0)
		count = 0
		complete = pass
		target = 10}
	if screenelementexists \{id = temp_goal_counter_container}
		destroyscreenelement \{id = temp_goal_counter_container}
	endif
	createscreenelement \{id = temp_goal_counter_container
		type = containerelement
		parent = root_window}
	temp_goal_counter_create_element name = 'tgc_label' text = <label> pos = <pos>
	<count_pos> = (<pos> + (-35.0, 70.0))
	formattext textname = count_text qs(0x0787478b) c = <count>
	temp_goal_counter_create_element name = 'tgc_count' text = <count_text> pos = <count_pos> just = [right center]
	tgc_count :settags count = <count> complete = <complete> target = <target> label = <label>
	<of_pos> = (<pos> + (0.0, 65.0))
	temp_goal_counter_create_element name = 'tgc_of' text = qs(0x8e590b97) pos = <of_pos>
	<total_pos> = (<pos> + (35.0, 70.0))
	formattext textname = total_text qs(0x0204c31d) t = <target>
	temp_goal_counter_create_element name = 'tgc_total' text = <total_text> pos = <total_pos> just = [left center]
endscript

script temp_goal_counter_update \{new_count = 0}
	tgc_count :gettags
	if (<count> < <new_count>)
		switch <complete>
			case pass
			color = [100 200 100 255]
			case fail
			color = [200 100 100 255]
		endswitch
	elseif (<count> > <new_count>)
		switch <complete>
			case pass
			color = [200 100 100 255]
			case fail
			color = [100 200 100 255]
		endswitch
	else
		return
	endif
	if NOT (<new_count> < <target>)
		switch <complete>
			case pass
			spawnscriptnow temp_goal_counter_update_element params = {name = 'tgc_label' update_text = qs(0xec7f3e02) pos = <pos> just = <just> color = <color>}
			case fail
			spawnscriptnow temp_goal_counter_update_element params = {name = 'tgc_label' update_text = qs(0xe7187b7e) pos = <pos> just = <just> color = <color>}
		endswitch
	else
		spawnscriptnow temp_goal_counter_update_element params = {name = 'tgc_label' update_text = <label> pos = <pos> just = <just>}
	endif
	formattext textname = count_text qs(0x0787478b) c = <new_count>
	temp_goal_counter_update_element name = 'tgc_count' update_text = <count_text> color = <color> tags = {count = <new_count> complete = <complete> target = <target> label = <label>}
endscript

script temp_goal_counter_destroy 
	temp_goal_counter_fade_element \{name = 'tgc_label'}
	temp_goal_counter_fade_element \{name = 'tgc_count'}
	temp_goal_counter_fade_element \{name = 'tgc_of'}
	temp_goal_counter_fade_element \{name = 'tgc_total'}
	tgc_total :se_waitprops
	if screenelementexists \{id = temp_goal_counter_container}
		destroyscreenelement \{id = temp_goal_counter_container}
	endif
endscript

script temp_goal_counter_destroy_fast 
	if screenelementexists \{id = temp_goal_counter_container}
		destroyscreenelement \{id = temp_goal_counter_container}
	endif
endscript

script temp_goal_counter_create_element \{just = [
			center
			center
		]}
	formattext checksumname = id_check '%i' i = <name>
	if screenelementexists id = <id_check>
		destroyscreenelement id = <id_check>
	endif
	createscreenelement {
		id = <id_check>
		type = textelement
		parent = temp_goal_counter_container
		font = debug
		text = <text>
		scale = 1.5
		pos = <pos>
		just = <just>
		rgba = [150 185 200 255]
		z_priority = 80
	}
	formattext checksumname = shadow_id '%i_shadow' i = <name>
	if screenelementexists id = <shadow_id>
		destroyscreenelement id = <shadow_id>
	endif
	createscreenelement {
		id = <shadow_id>
		type = textelement
		parent = temp_goal_counter_container
		font = debug
		text = <text>
		scale = 1.5
		pos = (<pos> + (1.0, 1.0))
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
		color = [
			150
			185
			200
			255
		]
		tags = {
		}}
	formattext checksumname = id_check '%i' i = <name>
	<id_check> :se_getprops
	if screenelementexists id = <id_check>
		destroyscreenelement id = <id_check>
	endif
	createscreenelement {
		id = <id_check>
		type = textelement
		parent = temp_goal_counter_container
		font = debug
		text = <update_text>
		scale = 1.5
		pos = <pos>
		just = <just>
		rgba = <color>
		z_priority = 80
	}
	formattext checksumname = shadow_id '%i_shadow' i = <name>
	if screenelementexists id = <shadow_id>
		destroyscreenelement id = <shadow_id>
	endif
	createscreenelement {
		id = <shadow_id>
		type = textelement
		parent = temp_goal_counter_container
		font = debug
		text = <update_text>
		scale = 1.5
		pos = (<pos> + (1.0, 1.0))
		just = <just>
		rgba = [0 0 0 255]
		z_priority = 79
	}
	if screenelementexists id = <id_check>
		<id_check> :settags <tags>
	endif
	wait \{0.5
		second}
	if screenelementexists id = <id_check>
		<id_check> :se_setprops rgba = [150 185 200 255] time = 0.25
	endif
endscript

script temp_goal_counter_fade_element 
	formattext checksumname = id_check '%i' i = <name>
	formattext checksumname = shadow_id '%i_shadow' i = <name>
	<id_check> :se_setprops alpha = 0 time = 0.120000005
	<shadow_id> :se_setprops alpha = 0 time = 0.120000005
endscript
