
script SceneControl_GuitarPlayer 
	begin
	<guitar_player1> :Scene_PlayAnimScript anim_script = AnimScript_DPedMSpectator03
	<guitar_player2> :Scene_PlayAnimScriptAndBlock anim_script = AnimScript_Controltest
	<guitar_player2> :Scene_PlayAnimScript anim_script = AnimScript_DPedMSpectator03
	<guitar_player1> :Scene_PlayAnimScriptAndBlock anim_script = AnimScript_Controltest
	repeat
endscript

script SceneControl_Chat_Spawn 
endscript

script SceneControl_Chat_Start 
	begin
	Get_Chat_Data ped1 = <ped1> ped2 = <ped2>
	<ped2> :Scene_PlayAnimScript anim_script = AnimScript_Chat_Idle
	<ped1> :Scene_PlayAnimScriptAndBlock anim_script = AnimScript_Chat_Talk params = {anim = <comment_anim> vo_event = <comment_vo>}
	wait 0.5 seconds
	<ped1> :Scene_PlayAnimScript anim_script = AnimScript_Chat_Idle
	<ped2> :Scene_PlayAnimScriptAndBlock anim_script = AnimScript_Chat_Talk params = {anim = <response_anim> vo_event = <response_vo>}
	wait 2 seconds
	repeat Random (@ 1 @ 2 @ 3 )
	<master_node> :eventcache_add event_id = scene_finished
endscript

script SceneControl_Chat_Interrupt 
endscript

script SceneControl_GuitarPlayer_Interrupt 
	<spectator1> :Scene_StopAnimScript
	<guitar_player> :Scene_StopAnimScript
endscript

script SceneControl_Sk8Session01 
	begin
	<Skater_player1> :Scene_PlayAnimScript anim_script = AnimScript_Sk8rSession01
	<Skater_player2> :Scene_PlayAnimScriptAndBlock anim_script = AnimScript_Sk8rSession02IdleScript
	<Skater_player2> :Scene_PlayAnimScript anim_script = AnimScript_Sk8rSession02
	<Skater_player1> :Scene_PlayAnimScriptAndBlock anim_script = AnimScript_Sk8rSession01IdleScript
	repeat
endscript
