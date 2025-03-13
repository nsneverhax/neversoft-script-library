net_syncer_defs = [
	net_career_host_status_def
	test_syncer_def
]
test_syncer_def = {
	module_name = test_syncer
	module_def = [
		{
			name = test_1
			type = float
			value = 1.1
		}
		{
			name = test_2
			type = checksum
			value = nerp
		}
		{
			name = test_3
			type = int
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
