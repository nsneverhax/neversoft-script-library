wii_timer_data = {
}
wii_timer_names = [
]
wii_timer_enabled = 0

script wii_timer_clear 
	Change \{wii_timer_data = {
		}}
	Change \{wii_timer_names = [
		]}
endscript

script wii_timer_start 
	RequireParams \{[
			label
		]
		all}
	if ($wii_timer_enabled = 0)
		return
	endif
	osgettick
	if NOT wii_timer_exists label = <label>
		AddArrayElement array = ($wii_timer_names) element = <label>
		Change wii_timer_names = <array>
	endif
	timer_data = {
		running = 1
		start_time = <tick>
		elapsed_time = 0
	}
	formatText checksumName = label_crc '%a' a = <label>
	setstructureparam struct_name = wii_timer_data param = <label_crc> value = <timer_data>
endscript

script wii_timer_stop 
	RequireParams \{[
			label
		]
		all}
	if ($wii_timer_enabled = 0)
		return
	endif
	if NOT wii_timer_is_running label = <label>
		printf 'Timer %a is not running.' a = <label>
		return
	endif
	formatText checksumName = label_crc '%a' a = <label>
	timer_data = ($wii_timer_data.<label_crc>)
	osdiffticknowms tick = (<timer_data>.start_time)
	setstructureparam \{struct_name = timer_data
		param = running
		value = 0}
	setstructureparam struct_name = timer_data param = elapsed_time value = <diff>
	setstructureparam struct_name = wii_timer_data param = <label_crc> value = <timer_data>
endscript

script wii_timer_exists 
	RequireParams \{[
			label
		]
		all}
	formatText checksumName = label_crc '%a' a = <label>
	if StructureContains structure = $wii_timer_data <label_crc>
		return \{true}
	endif
	return \{FALSE}
endscript

script wii_timer_is_running 
	RequireParams \{[
			label
		]
		all}
	if NOT wii_timer_exists label = <label>
		return \{FALSE}
	endif
	formatText checksumName = label_crc '%a' a = <label>
	if ($wii_timer_data.<label_crc>.running = 1)
		return \{true}
	endif
	return \{FALSE}
endscript

script wii_timer_report 
	if ($wii_timer_enabled = 0)
		return
	endif
	GetArraySize \{$wii_timer_names}
	if (<array_Size> > 0)
		i = 0
		osprintf \{'----------------------------------------------'}
		osprintf \{'Timer: Elapsed Time'}
		begin
		label = ($wii_timer_names [<i>])
		formatText checksumName = label_crc '%a' a = <label>
		osprintf '%a: %b ms' a = <label> b = ($wii_timer_data.<label_crc>.elapsed_time)
		<i> = (<i> + 1)
		repeat <array_Size>
		osprintf \{'----------------------------------------------'}
	endif
endscript
