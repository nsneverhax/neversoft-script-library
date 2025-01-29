exclusive_mp_controllers = [
	-1
	-1
	-1
	-1
]
num_exclusive_mp_controllers = 0

script clear_exclusive_devices 
	Change \{num_exclusive_mp_controllers = 0}
endscript

script add_exclusive_device \{device = 0}
	if ($num_exclusive_mp_controllers = 0)
		SetArrayElement \{arrayName = exclusive_mp_controllers
			GlobalArray
			index = 0
			newValue = -1}
		SetArrayElement \{arrayName = exclusive_mp_controllers
			GlobalArray
			index = 1
			newValue = -1}
		SetArrayElement \{arrayName = exclusive_mp_controllers
			GlobalArray
			index = 2
			newValue = -1}
		SetArrayElement \{arrayName = exclusive_mp_controllers
			GlobalArray
			index = 3
			newValue = -1}
	endif
	SetArrayElement arrayName = exclusive_mp_controllers GlobalArray index = ($num_exclusive_mp_controllers) newValue = <device>
	Change num_exclusive_mp_controllers = ($num_exclusive_mp_controllers + 1)
endscript

script get_all_exclusive_devices 
	if ($num_exclusive_mp_controllers = 0)
		return
	else
		return exclusive_device = ($exclusive_mp_controllers)
	endif
endscript
