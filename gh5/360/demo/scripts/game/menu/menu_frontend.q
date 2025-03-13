exclusive_mp_controllers = [
	-1
	-1
	-1
	-1
]
num_exclusive_mp_controllers = 0

script clear_exclusive_devices 
	change \{num_exclusive_mp_controllers = 0}
endscript

script add_exclusive_device \{device = 0}
	if ($num_exclusive_mp_controllers = 0)
		setarrayelement \{arrayname = exclusive_mp_controllers
			globalarray
			index = 0
			newvalue = -1}
		setarrayelement \{arrayname = exclusive_mp_controllers
			globalarray
			index = 1
			newvalue = -1}
		setarrayelement \{arrayname = exclusive_mp_controllers
			globalarray
			index = 2
			newvalue = -1}
		setarrayelement \{arrayname = exclusive_mp_controllers
			globalarray
			index = 3
			newvalue = -1}
	endif
	setarrayelement arrayname = exclusive_mp_controllers globalarray index = ($num_exclusive_mp_controllers) newvalue = <device>
	change num_exclusive_mp_controllers = ($num_exclusive_mp_controllers + 1)
endscript

script get_all_exclusive_devices 
	if ($num_exclusive_mp_controllers = 0)
		return
	else
		return exclusive_device = ($exclusive_mp_controllers)
	endif
endscript
