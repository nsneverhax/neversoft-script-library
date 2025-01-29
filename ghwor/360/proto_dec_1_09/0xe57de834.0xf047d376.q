0x368f01c6 = NULL

script 0x68a3db82 
	RequireParams \{[
			goal_struct
			goal_name
		]
		all}
	Change 0x368f01c6 = <goal_name>
	gman_quickstartgoal goal_struct = <goal_struct> goal_name = <goal_name>
endscript

script 0xec51c3a0 
	gman_quickremovegoal goal_name = ($0x368f01c6)
	Change \{0x368f01c6 = NULL}
endscript

script 0x95fe58ab 
	gman_passcheckpoint goal = ($0x368f01c6)
endscript

script 0x6395d918 
	generic_event_back
	SpawnScriptNow \{0xec51c3a0}
endscript
