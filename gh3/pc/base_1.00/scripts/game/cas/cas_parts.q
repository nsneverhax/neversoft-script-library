ped_editable_list = [
	{
		part = musician_body
		use_pedpre
	}
	{
		part = musician_instrument
		use_pedpre
	}
	{
		part = download_musician_body
		use_pedpre
	}
	{
		part = download_musician_instrument
		use_pedpre
	}
]
master_editable_list_first = [
]
master_editable_list_last = [
]

script build_master_editable_list 
	return master_editable_list = ($master_editable_list_first + $master_editable_list_last)
endscript
