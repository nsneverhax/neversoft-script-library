
script container_dim_debug 
	ScriptAssert \{'container_dim_debug: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script calculate_animation_time 
	ScriptAssert \{'calculate_animation_time: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script wait_for_animation 
	RequireParams \{[
			id
		]
		all}
	begin
	if NOT ScreenElementExists id = <id>
		break
	endif
	GetScreenElementProps id = <id>
	if (<animated_uvs_done> = true)
		break
	endif
	Wait \{1
		Frame}
	repeat
endscript

script has_valid_controller 
	RequireParams \{[
			Player
		]
		all}
	if (($freestyle_player_data [<Player>].controller >= 0) && ($freestyle_player_data [<Player>].controller < 4))
		return \{true}
	endif
	return \{FALSE}
endscript

script format_time 
	RequireParams \{[
			ms
		]
		all}
	time = <ms>
	minutes = (<time> / 60000)
	CastToInteger \{minutes}
	<time> = (<time> - (<minutes> * 60000))
	Seconds = (<time> / 1000)
	CastToInteger \{Seconds}
	if (<Seconds> < 10)
		formatText TextName = formatted_time qs(0xa3282799) m = <minutes> s = <Seconds>
	else
		formatText TextName = formatted_time qs(0xc8f0bb85) m = <minutes> s = <Seconds>
	endif
	return formatted_time = <formatted_time>
endscript

script restart_animation 
	RequireParams \{[
			id
		]
		all}
	if ScreenElementExists id = <id>
		SetScreenElementProps id = <id> current_frames = (0.0, 0.0)
	endif
endscript

script create_screen_blackout \{alpha = 0.65000004
		z = 0}
	destroy_screen_blackout
	CreateScreenElement {
		Type = SpriteElement
		parent = root_window
		id = screen_blackout
		texture = black
		rgba = [0 0 0 255]
		Pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [center center]
		z_priority = <z>
		alpha = <alpha>
	}
endscript

script destroy_screen_blackout 
	if ScreenElementExists \{id = screen_blackout}
		DestroyScreenElement \{id = screen_blackout}
	endif
endscript

script int_to_bool 
	RequireParams \{[
			int_value
			bool_name
		]
		all}
	if (<int_value> = 1)
		bool_value = true
	else
		bool_value = FALSE
	endif
	return_params = {}
	setstructureparam struct_name = return_params param = <bool_name> value = <bool_value>
	return <return_params>
endscript

script bool_to_int 
	RequireParams \{[
			bool_value
			int_name
		]
		all}
	if (<bool_value> = true)
		int_value = 1
	else
		int_value = 0
	endif
	return_params = {}
	setstructureparam struct_name = return_params param = <int_name> value = <int_value>
	return <return_params>
endscript

script toogle_bool 
	RequireParams \{[
			bool_value
		]
		all}
	if (<bool_value> = true)
		toggled_bool = FALSE
	else
		toggled_bool = true
	endif
	return toggled_bool = <toggled_bool>
endscript

script combine_arrays 
	RequireParams \{[
			array1
			array2
		]
		all}
	combined_array = []
	GetArraySize <array1>
	array1_size = <array_Size>
	GetArraySize <array2>
	array2_size = <array_Size>
	array1_index = 0
	array2_index = 0
	begin
	AddArrayElement array = <combined_array> element = (<array1> [<array1_index>])
	<combined_array> = <array>
	<array1_index> = (<array1_index> + 1)
	repeat <array1_size>
	begin
	AddArrayElement array = <combined_array> element = (<array2> [<array2_index>])
	<combined_array> = <array>
	<array2_index> = (<array2_index> + 1)
	repeat <array2_size>
	return combined_array = <combined_array>
endscript

script round_float_to_int 
	RequireParams \{[
			value
		]
		all}
	rounded_value = (<value> + 0.5)
	CastToInteger \{rounded_value}
	return rounded_value = <rounded_value>
endscript

script is_ds_connected 
	wiidscommunication :getstatus
	if (<current_ds_count> > 0)
		return \{true}
	endif
	return \{FALSE}
endscript

script wait_until_unpaused 
	begin
	if NOT freestylegameispaused
		break
	endif
	Wait \{1
		Frame}
	repeat
endscript
