
script create_materials_from_list 
endscript

script destroy_materials_from_list 
endscript

script create_in_game_materials 
endscript

script destroy_in_game_materials 
endscript

script create_global_materials 
endscript

script destroy_global_materials 
endscript

script create_highway_material \{Player = 1
		texture = blah}
	return highway_material = <texture>
endscript

script destroy_highway_material \{Player = 1}
	formatText checksumName = material_name 'Material_Highway_p%p' p = <Player>
	destroymaterial Name = <material_name>
endscript
