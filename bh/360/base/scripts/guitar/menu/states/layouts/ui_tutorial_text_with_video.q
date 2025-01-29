
script ui_create_tutorial_text_with_video 
	if ScreenElementExists \{id = tutorial_main}
		LaunchEvent \{type = focus
			target = tutorial_main}
	endif
endscript

script ui_destroy_tutorial_text_with_video 
	if ScreenElementExists \{id = tutorial_main}
		LaunchEvent \{type = unfocus
			target = tutorial_main}
	endif
endscript

script ui_init_tutorial_text_with_video 
	tutorial_system_enable_pause
	tutorial_system_create_description page_struct = <page_struct>
	tutorial_system_setup_event_handlers page_struct = <page_struct>
	if StructureContains structure = <page_struct> video_stream
		tutorial_system_create_video video = (<page_struct>.video_stream)
	endif
	if NOT GotParam \{return_from_pause}
		<desc_id> :Obj_SpawnScriptNow ui_init_tutorial_text_with_video_spawned params = {page_struct = <page_struct>}
	endif
endscript

script ui_init_tutorial_text_with_video_spawned 
	Obj_GetID
	<objID> :Obj_SpawnScriptNow tutorial_system_handle_completion params = {page_struct = <page_struct> desc_id = <objID>}
endscript

script ui_deinit_tutorial_text_with_video 
	tutorial_system_disable_pause
	destroy_generic_menu
	tutorial_system_destroy_video
	tutorial_system_destroy_description
endscript
