squad_components = [
	{
		component = squadcommand
	}
	{
		component = eventcache
	}
	{
		component = behaviorsystem
	}
	{
		component = spawngroup
	}
]

script Squad_Create_Base 
	if iscreated <id>
		Squad_Destroy id = <id>
	endif
	if gotparam prefix
		GetPrefixedNodes prefix = <prefix>
		names = <prefixed_nodes>
	endif
	createcompositeobjectinstance priority = coim_priority_permanent heap = gameobj oldheap = com {components = squad_components params = {name = <id> <...>}}
	if gotparam members
		getarraysize members
		index = 0
		begin
		objid = (<members> [<index>])
		<ped_creation_script> name = <objid>
		index = (<index> + 1)
		repeat <array_size>
		<id> :squad_addmembers members = <members>
	endif
endscript

script Squad_Create \{id = defaultSquad}
	Squad_Create_Base ped_creation_script = Agent_Creation <...>
endscript

script Squad_Recreate \{id = defaultSquad}
	Squad_Create_Base ped_creation_script = Agent_Recreation <...>
endscript

script Squad_RunScript 
	squad_getmembers
	getarraysize \{members}
	if (<array_size> > 0)
		index = 0
		begin
		(<members> [<index>]) :<name> <params>
		index = (<index> + 1)
		repeat <array_size>
	endif
endscript

script Squad_GiveOrder 
	squad_getmembers
	getarraysize \{members}
	if (<array_size> > 0)
		index = 0
		begin
		(<members> [<index>]) :Agent_GiveOrder name = <name> params = {<params> <...>}
		index = (<index> + 1)
		repeat <array_size>
	endif
	spawngroup_setorder <...>
endscript

script Squad_ClearOrders 
	squad_getmembers
	getarraysize \{members}
	if (<array_size> > 0)
		index = 0
		begin
		(<members> [<index>]) :Agent_ClearOrder
		index = (<index> + 1)
		repeat <array_size>
	endif
endscript

script Squad_SetBehavior 
	squad_getmembers
	getarraysize \{members}
	if (<array_size> > 0)
		index = 0
		begin
		(<members> [<index>]) :Agent_SetBehavior name = <name> params = <params>
		index = (<index> + 1)
		repeat <array_size>
	endif
endscript

script Squad_Destroy 
	if iscreated <id>
		<id> :squad_getmembers
		getarraysize \{members}
		if (<array_size> > 0)
			index = 0
			begin
			(<members> [<index>]) :die
			index = (<index> + 1)
			repeat <array_size>
		endif
		<id> :die
	endif
endscript

script Squad_BlockUntilDead \{pause = 1
		survivors = 0}
	begin
	if squad_isdead
		break
	endif
	wait <pause> seconds
	repeat
endscript

script Squad_FormationFollowPath 
	squad_getmembers
	<leader> = (<members> [0])
	<leader> :followpath <...>
endscript

script Squad_FormationFollow 
	squad_getmembers
	<leader> = (<members> [0])
	<leader> :ai_giveorder name = Bv_MoveTo params = {<...>}
endscript

script Squad_SetTwoColFormation 
	squad_snaptoformation \{follow_descs = ped_two_col_follow_descs
		spawn_offsets = ped_two_col_spawn_offsets}
	squad_setformation \{follow_descs = ped_two_col_follow_descs
		move_offsets = ped_two_col_move_offsets
		move_descs = ped_two_col_move_descs}
endscript

script Squad_SetTwoColTwoRowFormation 
	squad_snaptoformation \{follow_descs = ped_two_square_follow_descs
		spawn_offsets = ped_two_square_spawn_offsets}
	squad_setformation \{follow_descs = ped_two_square_follow_descs
		move_offsets = ped_two_square_move_offsets
		move_descs = ped_two_square_move_descs}
endscript
