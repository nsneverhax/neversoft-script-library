debug_rock_record = 1
rock_record_main_stats = [
	{
		text = qs(0x3f309f11)
		columns = [
			0
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0x9aba1ff1)
		columns = [
			1
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0xfdcb8490)
		columns = [
			4
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0xcc8c90fd)
		columns = [
			2
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0x5adadd00)
		columns = [
			3
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0x5edde85c)
		columns = [
			5
			6
		]
		format_script = rr_slash_divider
	}
	{
		text = qs(0x32c5f66f)
		columns = [
			7
		]
		format_script = rr_get_time_string
	}
	{
		text = qs(0xed3e879a)
		columns = [
			8
			9
			10
			11
		]
		format_script = rr_get_preferred_instrument
	}
	{
		text = qs(0xdc8d0fa7)
		columns = [
			12
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0x22661b1b)
		columns = [
			13
			14
		]
		format_script = rr_average_two_columns
	}
	{
		text = qs(0xe61e53fb)
		columns = [
			15
		]
		format_script = rr_get_time_string
	}
	{
		text = qs(0xd8aa41c1)
		columns = [
			16
		]
		format_script = rr_get_time_string
	}
	{
		text = qs(0x7c36f641)
		columns = [
			17
			18
			19
			20
			21
		]
		format_script = rr_get_preferred_difficulty
	}
	{
		text = qs(0x9decf296)
		columns = [
			22
			23
			24
			25
			26
		]
		format_script = rr_get_preferred_difficulty
	}
	{
		text = qs(0xf1025d1c)
		columns = [
			27
			28
			29
			30
			31
		]
		format_script = rr_get_preferred_difficulty
	}
	{
		text = qs(0xc42d5d5f)
		columns = [
			32
			33
			34
			35
			36
			37
		]
		format_script = rr_get_preferred_difficulty
	}
	{
		text = qs(0x9e516c96)
		columns = [
			38
		]
		format_script = rr_use_single_column
	}
	{
		text = qs(0x47e79f9e)
		columns = [
			39
		]
		format_script = rr_use_single_column
	}
]

script rr_use_single_column 

	return stat_value = (<data> [0])
endscript

script rr_slash_divider 

	GetArraySize <data>
	if (<array_Size> >= 2)
		formatText TextName = data_text qs(0xc68134fb) f = (<data> [0]) s = (<data> [1])
		return data_text = <data_text>
	endif
	return stat_value = (<data> [0])
endscript

script get_max_value_index 

	GetArraySize <array>
	if (<array_Size> > 0)
		<max_index> = 0
		<index> = 1
		begin
		if (<array> [<index>] >= <array> [<max_index>] && <array> [<index>] > 0)
			<max_index> = <index>
		endif
		<index> = (<index> + 1)
		repeat (<array_Size> - 1)
		return index = <max_index>
	endif
endscript

script rr_get_preferred_instrument 

	get_max_value_index array = <data>
	if GotParam \{index}
		switch (<index>)
			case 0
			data_text = qs(0x9504b94a)
			case 1
			data_text = qs(0x7d4f9214)
			case 2
			data_text = qs(0xcf488ba5)
			case 3
			data_text = qs(0x1b9f6f84)
			default
			data_text = qs(0x4c1271a9)
		endswitch
	else
		data_text = qs(0x4c1271a9)
	endif
	return data_text = <data_text>
endscript

script rr_average_two_columns 

	GetArraySize <data>
	if (<array_Size> >= 2)
		formatText TextName = data_text qs(0x35b12509) a = (<data> [0] / (<data> [1] * 1.0))
		return data_text = <data_text>
	endif
	return stat_value = (<data> [0])
endscript

script rr_get_preferred_difficulty 

	get_max_value_index array = <data>
	if GotParam \{index}
		switch (<index>)
			case 0
			data_text = qs(0x74d6a0a0)
			case 1
			data_text = qs(0x8d657387)
			case 2
			data_text = qs(0x6ef11a01)
			case 3
			data_text = qs(0x51b06d2f)
			case 4
			data_text = qs(0x334908ac)
			case 5
			data_text = qs(0xa841e548)
			default
			data_text = qs(0x4c1271a9)
		endswitch
	else
		data_text = qs(0x4c1271a9)
	endif
	return data_text = <data_text>
endscript

script rr_get_time_string 

	<total_time> = (<data> [0])
	Mod a = <total_time> b = 60
	<Seconds> = <Mod>
	if (<Seconds> < 10)
		formatText TextName = data_text qs(0xa14d5c1b) a = <Seconds>
	else
		formatText TextName = data_text qs(0x35b12509) a = <Seconds>
	endif
	<total_time> = (<total_time> - <Seconds>)
	if (<total_time> > 0)
		Mod a = <total_time> b = (60 * 60)
		<minutes> = <Mod>
		formatText TextName = data_text qs(0xd01e380d) a = (<minutes> / 60) t = <data_text>
		<total_time> = (<total_time> - <minutes>)
		if (<total_time> > 0)
			Mod a = <total_time> b = (60 * 60 * 60)
			<hours> = <Mod>
			formatText TextName = data_text qs(0xd01e380d) a = (<hours> / (60 * 60)) t = <data_text>
			<total_time> = (<total_time> - <hours>)
			if (<total_time> > 0)
				Mod a = <total_time> b = (60 * 60 * 60 * 24)
				<days> = <Mod>
				formatText TextName = data_text qs(0xd01e380d) a = (<days> / (60 * 60 * 60)) t = <data_text>
			endif
		endif
	endif
	return data_text = <data_text>
endscript
