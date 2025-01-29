exclusive_mp_controllers = [
	-1
	-1
	-1
	-1
]
num_exclusive_mp_controllers = 0

script make_menu_frontend 
	ScriptAssert \{': Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script clear_exclusive_devices 
	Change \{num_exclusive_mp_controllers = 0}
endscript

script add_exclusive_device \{device = 0}
	if ($num_exclusive_mp_controllers = 0)
		SetArrayElement \{ArrayName = exclusive_mp_controllers
			globalarray
			index = 0
			NewValue = -1}
		SetArrayElement \{ArrayName = exclusive_mp_controllers
			globalarray
			index = 1
			NewValue = -1}
		SetArrayElement \{ArrayName = exclusive_mp_controllers
			globalarray
			index = 2
			NewValue = -1}
		SetArrayElement \{ArrayName = exclusive_mp_controllers
			globalarray
			index = 3
			NewValue = -1}
	endif
	SetArrayElement ArrayName = exclusive_mp_controllers globalarray index = ($num_exclusive_mp_controllers) NewValue = <device>
	Change num_exclusive_mp_controllers = ($num_exclusive_mp_controllers + 1)
endscript

script get_all_exclusive_devices 
	if ($num_exclusive_mp_controllers = 0)
		return
	else
		return exclusive_device = ($exclusive_mp_controllers)
	endif
endscript
