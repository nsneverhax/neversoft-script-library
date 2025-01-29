soundboard_array = [
	{
		text = qs(0x895a6f97)
		event = vo_sb_hello
		button_1 = green
		button_2 = green
	}
	{
		text = qs(0xeaedf16f)
		event = vo_sb_hey
		button_1 = green
		button_2 = red
	}
	{
		text = qs(0xcdde8075)
		event = vo_sb_question
		button_1 = green
		button_2 = yellow
	}
	{
		text = qs(0xad4018a6)
		event = vo_sb_killemall
		button_1 = green
		button_2 = blue
	}
	{
		text = qs(0x9248756b)
		event = vo_sb_feelinggood
		button_1 = red
		button_2 = green
	}
	{
		text = qs(0x39f6b7e9)
		event = vo_sb_havingfun
		button_1 = red
		button_2 = red
	}
	{
		text = qs(0xb05cdbd7)
		event = vo_sb_youfeelit
		button_1 = red
		button_2 = yellow
	}
	{
		text = qs(0x03c44139)
		event = vo_sb_outthere
		button_1 = red
		button_2 = blue
	}
	{
		text = qs(0x5f15d11a)
		event = vo_sb_wantmore
		button_1 = yellow
		button_2 = green
	}
	{
		text = qs(0x89c295eb)
		event = vo_sb_whatdyousay
		button_1 = yellow
		button_2 = red
	}
	{
		text = qs(0xfb98c7a8)
		event = vo_sb_areyousure
		button_1 = yellow
		button_2 = yellow
	}
	{
		text = qs(0xed6c444b)
		event = vo_sb_ohyeah
		button_1 = yellow
		button_2 = blue
	}
	{
		text = qs(0x7139676e)
		event = vo_sb_goodtohear
		button_1 = blue
		button_2 = green
	}
	{
		text = qs(0x0d92dfdb)
		event = vo_sb_thatsright
		button_1 = blue
		button_2 = red
	}
	{
		text = qs(0x798d6642)
		event = vo_sb_yeah
		button_1 = blue
		button_2 = yellow
	}
	{
		text = qs(0xec5ba679)
		event = vo_sb_no
		button_1 = blue
		button_2 = blue
	}
]

script ui_create_soundboard 
	menu_music_off
	<pad_green> = pad_btn_bottom
	<pad_red> = pad_btn_right
	<pad_blue> = pad_btn_left
	<pad_yellow> = pad_btn_top
	if isps3
		getcontrollertype \{controller = $primary_controller}
		switch <controller_type>
			case controller
			GetEnterButtonAssignment
			if (<assignment> = circle)
				<pad_green> = pad_btn_left
				<pad_red> = pad_btn_bottom
				<pad_blue> = pad_btn_right
			else
				<pad_green> = pad_btn_left
				<pad_blue> = pad_btn_bottom
			endif
			case drum
			case guitar
			default
			if (<controller_type> = drum)
				<pad_blue> = pad_btn_top
				<pad_yellow> = pad_btn_left
			endif
			GetEnterButtonAssignment
			if (<assignment> = circle)
				<pad_green> = pad_btn_right
				<pad_red> = pad_btn_bottom
			endif
		endswitch
	endif
	CreateScreenElement {
		Type = descinterface
		desc = 'james_soundboard'
		id = current_menu_anchor
		parent = root_window
		event_handlers = [
			{pad_start generic_event_back}
			{<pad_green> ui_soundboard_button params = {button = green}}
			{<pad_red> ui_soundboard_button params = {button = red}}
			{<pad_yellow> ui_soundboard_button params = {button = yellow}}
			{<pad_blue> ui_soundboard_button params = {button = blue}}
		]
		exclusive_device = ($primary_controller)
		tags = {
			button_1 = None
			button_2 = None
		}
	}
	if isXenon
		SetScreenElementProps \{id = current_menu_anchor
			event_handlers = [
				{
					pad_select
					generic_event_back
				}
			]
			replace_handlers}
	endif
	GetArraySize \{$soundboard_array}
	soundboard_size = <array_Size>
	if current_menu_anchor :desc_resolvealias \{Name = alias_entries}
		GetScreenElementChildren id = <resolved_id>
		current_menu_anchor :SetTags entries = <children>
		i = 0
		begin
		curr_item = (<children> [<i>])
		if (<i> >= <soundboard_size>)
			<curr_item> :se_setprops {
				one_btn_alpha = 0.0
				two_btn_alpha = 0.0
			}
		else
			switch ($soundboard_array [<i>].button_1)
				case green
				btn_01_texture = sb_btn_green
				case red
				btn_01_texture = sb_btn_red
				case yellow
				btn_01_texture = sb_btn_yellow
				if (isps3)
					if (<controller_type> = controller)
						btn_01_texture = sb_btn_pink
					endif
				endif
				case blue
				btn_01_texture = sb_btn_blue
			endswitch
			switch ($soundboard_array [<i>].button_2)
				case green
				btn_02_texture = sb_btn_green
				case red
				btn_02_texture = sb_btn_red
				case yellow
				btn_02_texture = sb_btn_yellow
				if (isps3)
					if (<controller_type> = controller)
						btn_02_texture = sb_btn_pink
					endif
				endif
				case blue
				btn_02_texture = sb_btn_blue
			endswitch
			<curr_item> :se_setprops {
				btn_01_texture = <btn_01_texture>
				btn_02_texture = <btn_02_texture>
				btn_01_alpha = 0.5
				btn_02_alpha = 0.5
				sound_text = ($soundboard_array [<i>].text)
			}
		endif
		i = (<i> + 1)
		repeat <array_Size>
	endif
	AssignAlias \{id = current_menu_anchor
		alias = current_menu}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = start
		z = 100000}
endscript

script ui_destroy_soundboard 
	GetArraySize \{$soundboard_array}
	i = 0
	begin
	StopSoundEvent ($soundboard_array [<i>].event)
	i = (<i> + 1)
	repeat <array_Size>
	generic_ui_destroy
	menu_music_on
endscript

script ui_soundboard_button 
	SetSpawnInstanceLimits \{Max = 1
		management = ignore_spawn_request}
	GetTags
	GetArraySize \{$soundboard_array}
	if (<button_1> = None)
		SetTags button_1 = <button>
	else
		SetTags button_2 = <button>
	endif
	GetTags
	GetArraySize \{$soundboard_array}
	soundboard_size = <array_Size>
	GetArraySize <entries>
	i = 0
	begin
	if (<i> >= <soundboard_size>)
		break
	endif
	curr_item = (<entries> [<i>])
	if (<button_1> = ($soundboard_array [<i>].button_1))
		<curr_item> :se_setprops btn_01_alpha = 1.0
		if (<button_2> = ($soundboard_array [<i>].button_2))
			<curr_item> :se_setprops btn_02_alpha = 1.0
			ui_soundboard_play_sound event = ($soundboard_array [<i>].event)
			should_wait = 3
			break
		endif
	endif
	i = (<i> + 1)
	repeat <array_Size>
	GetTags
	if NOT (<button_2> = None)
		SetTags \{button_1 = None}
		SetTags \{button_2 = None}
		i = 0
		begin
		if (<i> >= <soundboard_size>)
			break
		endif
		new_curr_item = (<entries> [<i>])
		if NOT (<new_curr_item> = <curr_item>)
			<new_curr_item> :se_setprops btn_01_alpha = 0.5
			<new_curr_item> :se_setprops btn_02_alpha = 0.5
		endif
		i = (<i> + 1)
		repeat <array_Size>
		if GotParam \{should_wait}
			Wait \{3.0
				Seconds}
		endif
		<curr_item> :se_setprops btn_01_alpha = 0.5
		<curr_item> :se_setprops btn_02_alpha = 0.5
	endif
endscript

script ui_soundboard_play_sound \{event = vo_sb_hello}
	StopSoundEvent <event>
	SoundEvent event = <event>
endscript
