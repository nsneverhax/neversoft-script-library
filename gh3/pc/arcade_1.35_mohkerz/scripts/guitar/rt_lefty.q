rt_lefty_right_set = 60
rt_lefty_left_set = -60
rt_lefty_settle_duration = 5
rt_lefty_status_display_enabled = 0
rt_check_lefty_flip_p1 = 0
rt_check_lefty_flip_p2 = 0
rt_lefty_display_p1_root = (15.0, 40.0)
rt_lefty_display_p2_root = (1125.0, 40.0)
rt_lefty_display_text_off = (-5.0, 54.0)
rt_lefty_p1_status_root = (300.0, 325.0)
rt_lefty_p2_status_root = (1000.0, 325.0)
rt_lefty_p1_first_boot_flag = 0
rt_lefty_p2_first_boot_flag = 0
rt_lefty_display_text_scale = 1.5
rt_lefty_waggles_to_display = 10
rt_lefty_message_color = [
	246
	157
	52
	255
]
rt_lefty_message_font = text_a11
rt_lefty_message_second_line_offset = (0.0, 45.0)
rt_lefty_message_line1_scale = 0.95
rt_lefty_message_line2_scale = 0.65000004
rt_lefty_status_loops = 250

script create_lefty_flip_status 
	GetGlobalTags \{user_options}
	<lefty_flip_p1> = 0
	<lefty_flip_p2> = 0
	SetGlobalTags user_options params = {lefty_flip_p1 = <lefty_flip_p1> lefty_flip_p2 = <lefty_flip_p2>}
	CreateScreenElement \{Type = ContainerElement
		id = rt_lefty_flip_container
		parent = root_window
		Pos = (0.0, 0.0)}
	CreateScreenElement \{Type = ContainerElement
		id = rt_lefty_flip_p1_container
		parent = rt_lefty_flip_container
		rgba = [
			255
			255
			255
			255
		]
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = TextElement
		parent = rt_lefty_flip_p1_container
		id = rt_lefty_p1_status_1
		text = "lefty"
		font = text_a1
		rgba = $rt_lefty_message_color
		Pos = ($rt_lefty_display_p1_root)
		just = [left center]
		Scale = $rt_lefty_display_text_scale
		z_priority = 10001
	}
	rt_lefty_p1_status_1 :SetProps \{Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	CreateScreenElement {
		Type = TextElement
		parent = rt_lefty_flip_p1_container
		id = rt_lefty_p1_status_2
		text = "mode"
		font = text_a1
		rgba = $rt_lefty_message_color
		Pos = ($rt_lefty_display_p1_root + $rt_lefty_display_text_off)
		just = [left center]
		Scale = $rt_lefty_display_text_scale
		z_priority = 10001
	}
	rt_lefty_p1_status_2 :SetProps \{Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	CreateScreenElement \{Type = ContainerElement
		id = rt_lefty_flip_p1_message_container
		parent = rt_lefty_flip_container
		just = [
			center
			center
		]
		Pos = $rt_lefty_p1_status_root}
	CreateScreenElement \{Type = TextElement
		parent = rt_lefty_flip_p1_message_container
		id = rt_lefty_p1_set_message_1
		font = $rt_lefty_message_font
		rgba = $rt_lefty_message_color
		just = [
			center
			center
		]
		Scale = $rt_lefty_message_line1_scale
		z_priority = 10001}
	rt_lefty_p1_set_message_1 :SetProps \{Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	CreateScreenElement \{Type = TextElement
		parent = rt_lefty_flip_p1_message_container
		id = rt_lefty_p1_set_message_2
		text = "Press orange fret to switch"
		font = $rt_lefty_message_font
		rgba = $rt_lefty_message_color
		Pos = $rt_lefty_message_second_line_offset
		just = [
			center
			center
		]
		Scale = $rt_lefty_message_line2_scale
		z_priority = 10001}
	rt_lefty_p1_set_message_2 :SetProps \{Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	CreateScreenElement \{Type = ContainerElement
		id = rt_lefty_flip_p2_container
		parent = rt_lefty_flip_container
		rgba = [
			255
			255
			255
			255
		]
		Pos = (0.0, 0.0)}
	CreateScreenElement {
		Type = TextElement
		parent = rt_lefty_flip_p2_container
		id = rt_lefty_p2_status_1
		text = "lefty"
		font = text_a1
		rgba = $rt_lefty_message_color
		Pos = ($rt_lefty_display_p2_root)
		just = [left center]
		Scale = $rt_lefty_display_text_scale
		z_priority = 10001
	}
	rt_lefty_p2_status_1 :SetProps \{Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	CreateScreenElement {
		Type = TextElement
		parent = rt_lefty_flip_p2_container
		id = rt_lefty_p2_status_2
		text = "mode"
		font = text_a1
		rgba = $rt_lefty_message_color
		Pos = ($rt_lefty_display_p2_root + $rt_lefty_display_text_off)
		just = [left center]
		Scale = $rt_lefty_display_text_scale
		z_priority = 10001
	}
	rt_lefty_p2_status_2 :SetProps \{Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	CreateScreenElement \{Type = ContainerElement
		id = rt_lefty_flip_p2_message_container
		parent = rt_lefty_flip_container
		just = [
			center
			center
		]
		Pos = $rt_lefty_p2_status_root}
	CreateScreenElement \{Type = TextElement
		parent = rt_lefty_flip_p2_message_container
		id = rt_lefty_p2_set_message_1
		font = $rt_lefty_message_font
		rgba = $rt_lefty_message_color
		just = [
			center
			center
		]
		Scale = $rt_lefty_message_line1_scale
		z_priority = 10001}
	rt_lefty_p2_set_message_1 :SetProps \{Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	CreateScreenElement \{Type = TextElement
		parent = rt_lefty_flip_p2_message_container
		id = rt_lefty_p2_set_message_2
		text = "Press orange fret to switch"
		font = $rt_lefty_message_font
		rgba = $rt_lefty_message_color
		Pos = $rt_lefty_message_second_line_offset
		just = [
			center
			center
		]
		Scale = $rt_lefty_message_line2_scale
		z_priority = 10001}
	rt_lefty_p2_set_message_2 :SetProps \{Shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba
		[
			0
			0
			0
			255
		]}
	rt_lefty_flip_p1_container :DoMorph \{alpha = 0
		time = 0}
	rt_lefty_flip_p2_container :DoMorph \{alpha = 0
		time = 0}
	rt_lefty_flip_p1_message_container :DoMorph \{alpha = 0
		time = 0}
	rt_lefty_flip_p2_message_container :DoMorph \{alpha = 0
		time = 0}
endscript

script rt_lefty_hide_status_messages 
	rt_lefty_flip_p1_message_container :DoMorph \{alpha = 0
		time = 0}
	rt_lefty_flip_p2_message_container :DoMorph \{alpha = 0
		time = 0}
	DoScreenElementMorph \{id = rt_lefty_flip_p1_message_container
		rot_angle = 0}
	DoScreenElementMorph \{id = rt_lefty_flip_p2_message_container
		rot_angle = 0}
endscript

script rt_lefty_show_p1_status_message \{lefty = 1}
	printf \{"rt_lefty_show_p1_status_message: called, is_attract_mode = %d"
		d = $is_attract_mode}
	if ($is_attract_mode = 0)
		printf "rt_lefty_show_p1_status_message: called, lefty = %e" e = <lefty>
		if (<lefty>)
			printf \{"rt_lefty_show_p1_status_message: lefty enabled"}
			rt_lefty_p1_set_message_1 :SetProps \{text = "Left-handed guitar"}
		else
			printf \{"rt_lefty_show_p1_status_message: righty enabled"}
			rt_lefty_p1_set_message_1 :SetProps \{text = "Right-handed guitar"}
		endif
		rt_lefty_flip_p1_message_container :DoMorph \{alpha = 1
			time = 0.3}
		num_loops = $rt_lefty_waggles_to_display
		begin
		DoScreenElementMorph \{id = rt_lefty_flip_p1_message_container
			rot_angle = 3
			time = 0.1
			motion = ease_out}
		Wait \{0.1
			Seconds}
		DoScreenElementMorph \{id = rt_lefty_flip_p1_message_container
			rot_angle = -3
			time = 0.1
			motion = ease_out}
		Wait \{0.1
			Seconds}
		repeat <num_loops>
		DoScreenElementMorph \{id = rt_lefty_flip_p1_message_container
			rot_angle = 0
			time = 0.1
			motion = ease_out}
		rt_lefty_flip_p1_message_container :DoMorph \{alpha = 0
			time = 0.3}
		Wait \{0.3
			Seconds}
		printf \{"rt_lefty_show_p1_status_message: done"}
	endif
endscript

script rt_lefty_show_p2_status_message \{lefty = 1}
	printf \{"rt_lefty_show_p2_status_message: called, is_attract_mode = %d"
		d = $is_attract_mode}
	if ($is_attract_mode = 0)
		printf "rt_lefty_show_p2_status_message: called, lefty = %e" e = <lefty>
		if (<lefty>)
			printf \{"rt_lefty_show_p2_status_message: lefty enabled"}
			rt_lefty_p2_set_message_1 :SetProps \{text = "Left-handed guitar"}
		else
			printf \{"rt_lefty_show_p2_status_message: righty enabled"}
			rt_lefty_p2_set_message_1 :SetProps \{text = "Right-handed guitar"}
		endif
		rt_lefty_flip_p2_message_container :DoMorph \{alpha = 1
			time = 0.3}
		num_loops = $rt_lefty_waggles_to_display
		begin
		DoScreenElementMorph \{id = rt_lefty_flip_p2_message_container
			rot_angle = 3
			time = 0.1
			motion = ease_in}
		Wait \{0.1
			Seconds}
		DoScreenElementMorph \{id = rt_lefty_flip_p2_message_container
			rot_angle = -3
			time = 0.1
			motion = ease_out}
		Wait \{0.1
			Seconds}
		repeat <num_loops>
		DoScreenElementMorph \{id = rt_lefty_flip_p2_message_container
			rot_angle = 0
			time = 0.1
			motion = ease_out}
		rt_lefty_flip_p2_message_container :DoMorph \{alpha = 0
			time = 0.3}
		Wait \{0.3
			Seconds}
		printf \{"rt_lefty_show_p2_status_message: done"}
	endif
endscript

script rt_lefty_change_status \{p1_status = 0
		p2_status = 0}
	GetGlobalTags \{user_options}
	if (<p1_status> = 0)
		printf \{"rt_lefty_change_status: deactivating player 1's lefty flip"}
		rt_lefty_flip_p1_container :DoMorph \{alpha = 0
			time = 0}
		Change \{rt_check_lefty_flip_p1 = 0}
	else
		printf \{"rt_lefty_change_status: activating player 1's lefty flip"}
		if (<lefty_flip_p1> = 1)
			rt_lefty_flip_p1_container :DoMorph \{alpha = 1
				time = 0}
		endif
		Change \{rt_check_lefty_flip_p1 = 1}
	endif
	if (<p2_status> = 0)
		printf \{"rt_lefty_change_status: deactivating player 2's lefty flip"}
		rt_lefty_flip_p2_container :DoMorph \{alpha = 0
			time = 0}
		Change \{rt_check_lefty_flip_p2 = 0}
	else
		printf \{"rt_lefty_change_status: activating player 2's lefty flip"}
		if (<lefty_flip_p2> = 1)
			rt_lefty_flip_p2_container :DoMorph \{alpha = 1
				time = 0}
		endif
		Change \{rt_check_lefty_flip_p2 = 1}
	endif
endscript

script rt_lefty_animate_p1_lefty_mode 
	printf \{"rt_lefty_animate_p1_lefty_mode: start"}
	num_loops = $rt_lefty_status_loops
	begin
	RunScriptOnScreenElement \{id = rt_lefty_p1_status_1
		DoScreenElementMorph
		params = {
			id = rt_lefty_p1_status_1
			rgba = $rt_lefty_message_color
			time = 0.3
			motion = ease_in
		}}
	RunScriptOnScreenElement \{id = rt_lefty_p1_status_2
		DoScreenElementMorph
		params = {
			id = rt_lefty_p1_status_2
			rgba = $rt_lefty_message_color
			time = 0.3
			motion = ease_in
		}}
	RunScriptOnScreenElement \{id = rt_lefty_flip_p1_container
		DoScreenElementMorph
		params = {
			id = rt_lefty_flip_p1_container
			Pos = (1.0, 1.0)
			time = 0.2
			motion = ease_in
		}}
	Wait \{0.3
		Seconds}
	RunScriptOnScreenElement \{id = rt_lefty_p1_status_1
		DoScreenElementMorph
		params = {
			id = rt_lefty_p1_status_1
			rgba = [
				255
				255
				255
				255
			]
			time = 0.3
			motion = ease_out
		}}
	RunScriptOnScreenElement \{id = rt_lefty_p1_status_2
		DoScreenElementMorph
		params = {
			id = rt_lefty_p1_status_2
			rgba = [
				255
				255
				255
				255
			]
			time = 0.3
			motion = ease_out
		}}
	RunScriptOnScreenElement \{id = rt_lefty_flip_p1_container
		DoScreenElementMorph
		params = {
			id = rt_lefty_flip_p1_container
			Pos = (-1.0, -1.0)
			time = 0.2
			motion = ease_out
		}}
	Wait \{0.3
		Seconds}
	repeat <num_loops>
	DoScreenElementMorph \{id = rt_lefty_flip_p1_container
		Pos = (0.0, 0.0)
		time = 0.2
		motion = ease_out}
	printf \{"rt_lefty_animate_p1_lefty_mode: done"}
endscript

script rt_lefty_animate_p2_lefty_mode 
	printf \{"rt_lefty_animate_p2_lefty_mode: start"}
	num_loops = $rt_lefty_status_loops
	begin
	RunScriptOnScreenElement \{id = rt_lefty_p2_status_1
		DoScreenElementMorph
		params = {
			id = rt_lefty_p2_status_1
			rgba = $rt_lefty_message_color
			time = 0.3
			motion = ease_in
		}}
	RunScriptOnScreenElement \{id = rt_lefty_p2_status_2
		DoScreenElementMorph
		params = {
			id = rt_lefty_p2_status_2
			rgba = $rt_lefty_message_color
			time = 0.3
			motion = ease_in
		}}
	RunScriptOnScreenElement \{id = rt_lefty_flip_p2_container
		DoScreenElementMorph
		params = {
			id = rt_lefty_flip_p2_container
			Pos = (1.0, 1.0)
			time = 0.2
			motion = ease_in
		}}
	Wait \{0.3
		Seconds}
	RunScriptOnScreenElement \{id = rt_lefty_p2_status_1
		DoScreenElementMorph
		params = {
			id = rt_lefty_p2_status_1
			rgba = [
				255
				255
				255
				255
			]
			time = 0.3
			motion = ease_out
		}}
	RunScriptOnScreenElement \{id = rt_lefty_p2_status_2
		DoScreenElementMorph
		params = {
			id = rt_lefty_p2_status_2
			rgba = [
				255
				255
				255
				255
			]
			time = 0.3
			motion = ease_out
		}}
	RunScriptOnScreenElement \{id = rt_lefty_flip_p2_container
		DoScreenElementMorph
		params = {
			id = rt_lefty_flip_p2_container
			Pos = (-1.0, -1.0)
			time = 0.2
			motion = ease_out
		}}
	Wait \{0.3
		Seconds}
	repeat <num_loops>
	DoScreenElementMorph \{id = rt_lefty_flip_p2_container
		Pos = (0.0, 0.0)
		time = 0.2
		motion = ease_out}
	printf \{"rt_lefty_animate_p2_lefty_mode: done"}
endscript

script watch_for_lefty_flip 
	p1_lefty = 0.0
	p2_lefty = 0.0
	p1_counter = 0
	p2_counter = 0
	p1_changed = 0
	p2_changed = 0
	begin
	if ($rt_check_lefty_flip_p1 = 1)
		GuitarGetAnalogueInfo \{controller = $player1_device}
		<p1_lefty> = <r2raw>
	endif
	if ($rt_check_lefty_flip_p2 = 1)
		GuitarGetAnalogueInfo \{controller = $player2_device}
		<p2_lefty> = <r2raw>
	endif
	if (($rt_check_lefty_flip_p1 = 1) || ($rt_check_lefty_flip_p2 = 1))
		GetGlobalTags \{user_options}
	endif
	if ($rt_check_lefty_flip_p1 = 1)
		if (((<p1_lefty> > $rt_lefty_right_set) && (<lefty_flip_p1> = 1)) || ((<p1_lefty> < $rt_lefty_left_set) && (<lefty_flip_p1> = 0)))
			printf \{"watch_for_lefty_flip: something changed p1...checking"}
			if ((<p1_lefty> > $rt_lefty_right_set) && (<lefty_flip_p1> = 1))
				printf \{"watch_for_lefty_flip: current left, holding right now"}
				if (<p1_counter> < $rt_lefty_settle_duration)
					Increment \{p1_counter}
				else
					<lefty_flip_p1> = 0
					<p1_changed> = 1
				endif
			endif
			if ((<p1_lefty> < $rt_lefty_left_set) && (<lefty_flip_p1> = 0))
				printf \{"watch_for_lefty_flip: current right, holding left now"}
				if (<p1_counter> < $rt_lefty_settle_duration)
					Increment \{p1_counter}
				else
					<lefty_flip_p1> = 1
					<p1_changed> = 1
				endif
			endif
		endif
		if (<p1_changed> = 1)
			<p1_changed> = 0
			<p1_counter> = 0
			if (<lefty_flip_p1> = 1)
				rt_lefty_flip_p1_container :DoMorph \{alpha = 1
					time = 0}
				KillSpawnedScript \{Name = rt_lefty_show_p1_status_message}
				SpawnScriptNow \{rt_lefty_show_p1_status_message
					params = {
						lefty = 1
					}}
				KillSpawnedScript \{Name = rt_lefty_animate_p1_lefty_mode}
				SpawnScriptNow \{rt_lefty_animate_p1_lefty_mode}
				Change \{pad_event_up_inversion = true}
			else
				rt_lefty_flip_p1_container :DoMorph \{alpha = 0
					time = 0}
				KillSpawnedScript \{Name = rt_lefty_animate_p1_lefty_mode}
				KillSpawnedScript \{Name = rt_lefty_show_p1_status_message}
				SpawnScriptNow \{rt_lefty_show_p1_status_message
					params = {
						lefty = 0
					}}
				Change \{pad_event_up_inversion = true}
			endif
			SetGlobalTags user_options params = {lefty_flip_p1 = <lefty_flip_p1>}
			printf "watch_for_lefty_flip: p1 lefty flip now %d" d = <lefty_flip_p1>
		endif
	endif
	if ($rt_check_lefty_flip_p2 = 1)
		if (((<p2_lefty> > $rt_lefty_right_set) && (<lefty_flip_p2> = 1)) || ((<p2_lefty> < $rt_lefty_left_set) && (<lefty_flip_p2> = 0)))
			printf \{"watch_for_lefty_flip: something changed p2...checking"}
			if ((<p2_lefty> > $rt_lefty_right_set) && (<lefty_flip_p2> = 1))
				printf \{"watch_for_lefty_flip: current left, holding right now"}
				if (<p2_counter> < $rt_lefty_settle_duration)
					Increment \{p2_counter}
				else
					<lefty_flip_p2> = 0
					<p2_changed> = 1
				endif
			endif
			if ((<p2_lefty> < $rt_lefty_left_set) && (<lefty_flip_p2> = 0))
				printf \{"watch_for_lefty_flip: current right, holding left now"}
				if (<p2_counter> < $rt_lefty_settle_duration)
					Increment \{p2_counter}
				else
					<lefty_flip_p2> = 1
					<p2_changed> = 1
				endif
			endif
		endif
		if (<p2_changed> = 1)
			<p2_changed> = 0
			<p2_counter> = 0
			if (<lefty_flip_p2> = 1)
				rt_lefty_flip_p2_container :DoMorph \{alpha = 1
					time = 0}
				KillSpawnedScript \{Name = rt_lefty_show_p2_status_message}
				SpawnScriptNow \{rt_lefty_show_p2_status_message
					params = {
						lefty = 1
					}}
				KillSpawnedScript \{Name = rt_lefty_animate_p2_lefty_mode}
				SpawnScriptNow \{rt_lefty_animate_p2_lefty_mode}
			else
				rt_lefty_flip_p2_container :DoMorph \{alpha = 0
					time = 0}
				KillSpawnedScript \{Name = rt_lefty_animate_p2_lefty_mode}
				KillSpawnedScript \{Name = rt_lefty_show_p2_status_message}
				SpawnScriptNow \{rt_lefty_show_p2_status_message
					params = {
						lefty = 0
					}}
			endif
			SetGlobalTags user_options params = {lefty_flip_p2 = <lefty_flip_p2>}
			printf "watch_for_lefty_flip: p2 lefty flip now %d" d = <lefty_flip_p2>
		endif
	endif
	Wait \{2
		frames}
	repeat
endscript

script spawn_lefty_flip_handling 
	create_lefty_flip_status
	rt_lefty_change_status
endscript

script rtlefty_toggle_flip 
	printf "rtlefty_toggle_flip: called for player %d" d = <which_player>
	GetGlobalTags \{user_options}
	if ($game_mode = p1_quickplay)
		printf \{"rtlefty_toggle_flip: switching which_player to %d"
			d = $active_player}
		<which_player> = $active_player
	endif
	if (<which_player> = 1)
		if (<lefty_flip_p1> = 1)
			<lefty_flip_p1> = 0
			rt_lefty_flip_p1_container :DoMorph \{alpha = 0
				time = 0}
			KillSpawnedScript \{Name = rt_lefty_animate_p1_lefty_mode}
			KillSpawnedScript \{Name = rt_lefty_show_p1_status_message}
			SpawnScriptNow \{rt_lefty_show_p1_status_message
				params = {
					lefty = 0
				}}
		else
			<lefty_flip_p1> = 1
			rt_lefty_flip_p1_container :DoMorph \{alpha = 1
				time = 0}
			KillSpawnedScript \{Name = rt_lefty_animate_p1_lefty_mode}
			SpawnScriptNow \{rt_lefty_animate_p1_lefty_mode}
			KillSpawnedScript \{Name = rt_lefty_show_p1_status_message}
			SpawnScriptNow \{rt_lefty_show_p1_status_message
				params = {
					lefty = 1
				}}
		endif
	else
		if (<lefty_flip_p2> = 1)
			<lefty_flip_p2> = 0
			rt_lefty_flip_p2_container :DoMorph \{alpha = 0
				time = 0}
			KillSpawnedScript \{Name = rt_lefty_animate_p2_lefty_mode}
			KillSpawnedScript \{Name = rt_lefty_show_p2_status_message}
			SpawnScriptNow \{rt_lefty_show_p2_status_message
				params = {
					lefty = 0
				}}
		else
			<lefty_flip_p2> = 1
			rt_lefty_flip_p2_container :DoMorph \{alpha = 1
				time = 0}
			KillSpawnedScript \{Name = rt_lefty_animate_p2_lefty_mode}
			SpawnScriptNow \{rt_lefty_animate_p2_lefty_mode}
			KillSpawnedScript \{Name = rt_lefty_show_p2_status_message}
			SpawnScriptNow \{rt_lefty_show_p2_status_message
				params = {
					lefty = 1
				}}
		endif
	endif
	printf "rtlefty_toggle_flip: which_player = %c active_player = %d lefty_flip_p1 = %a lefty_flip_p2 = %b" c = <which_player> d = $active_player a = <lefty_flip_p1> b = <lefty_flip_p2>
	SetGlobalTags user_options params = {lefty_flip_p1 = <lefty_flip_p1> lefty_flip_p2 = <lefty_flip_p2>}
endscript
