net_syncer_defs = [
	net_career_host_status_def
	test_syncer_def
]
test_syncer_def = {
	module_name = test_syncer
	module_def = [
		{
			Name = test_1
			Type = float
			value = 1.1
		}
		{
			Name = test_2
			Type = checksum
			value = nerp
		}
		{
			Name = test_3
			Type = int
			value = 1
		}
	]
}
