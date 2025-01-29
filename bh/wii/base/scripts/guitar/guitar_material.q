
script create_materials_from_list 
	ScriptAssert \{'create_materials_from_list: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_materials_from_list 
	ScriptAssert \{'destroy_materials_from_list: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script create_in_game_materials 
	ScriptAssert \{'create_in_game_materials: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_in_game_materials 
	ScriptAssert \{'destroy_in_game_materials: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script create_global_materials 
	ScriptAssert \{'create_global_materials: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script destroy_global_materials 
	ScriptAssert \{'destroy_global_materials: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script create_highway_material \{Player = 1
		texture = blah}
	return highway_material = <texture>
endscript

script destroy_highway_material \{Player = 1}
	ScriptAssert \{'destroy_highway_material: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript
