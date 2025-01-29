
script ui_create_play_tutorial 
	run_training_script
endscript

script ui_destroy_play_tutorial 
	Change \{0xd441408d = 0}
	if ispakloaded \{'pak/oogame/oogame.pak'
			Heap = heap_cas}
		UnLoadPak \{'pak/oogame/oogame.pak'
			Heap = heap_cas}
	elseif ispakloaded \{'pak/oogame/oogamebattle.pak'
			Heap = heap_cas}
		UnLoadPak \{'pak/oogame/oogamebattle.pak'
			Heap = heap_cas}
	elseif ispakloaded \{'pak/oogame/oogameband.pak'
			Heap = heap_cas}
		UnLoadPak \{'pak/oogame/oogameband.pak'
			Heap = heap_cas}
	elseif ispakloaded \{'pak/oogame/oogamevs.pak'
			Heap = heap_cas}
		UnLoadPak \{'pak/oogame/oogamevs.pak'
			Heap = heap_cas}
	endif
	StartRendering
endscript

script ui_play_tutorial_anim_out 
	tutorial_shutdown
endscript

script ui_return_play_tutorial 
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{Type = focus
			target = menu_tutorial}
	else
		create_training_pause_handler
	endif
endscript
0xd1d0c3ce = $ui_create_play_tutorial
0x9782b6ba = $ui_destroy_play_tutorial
0x4216c847 = $ui_create_play_tutorial
0xd150a5b2 = $ui_destroy_play_tutorial
0x9d11bc77 = $ui_create_play_tutorial
0x5055fc89 = $ui_destroy_play_tutorial
0x4acd9612 = $ui_create_play_tutorial
0x2f1aac0c = $ui_destroy_play_tutorial
0x911331bd = $ui_create_play_tutorial
0xaf81a526 = $ui_destroy_play_tutorial
0x33f839e3 = $ui_create_play_tutorial
0x21b5ba59 = $ui_destroy_play_tutorial
0xae31d20c = $ui_create_play_tutorial
0xcbe6e812 = $ui_destroy_play_tutorial
0xdfa2c7fc = $ui_create_play_tutorial
0x856a5ca7 = $ui_destroy_play_tutorial
0xf91531a1 = $ui_create_play_tutorial
0xa3ddaafa = $ui_destroy_play_tutorial
