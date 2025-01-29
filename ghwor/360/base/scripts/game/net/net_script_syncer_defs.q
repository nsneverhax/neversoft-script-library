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

script net_syncer_test_1 
	printf \{qs(0x1b68bd66)}
	netsync_setvalue \{module = test_syncer
		item = test_1
		value = 2.2}
	netsync_setvalue \{module = test_syncer
		item = test_3
		value = 2}
	netsync_setvalue \{module = test_syncer
		item = test_2
		value = derp}
endscript

script net_syncer_test_2 
	printf \{qs(0x3045eea5)}
	netsync_getall \{module = test_syncer}
	printstruct <...>
endscript
