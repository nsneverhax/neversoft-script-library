donotassertforinfiniteloopsinthesescripts = [
	AVOIDSTATE_STOP
	Ped_RandomWaitAtNode01
	igc_cycle_actor_anims
	z_storyselect_loop_anims
]
blockingfunctions = [
	wait
	obj_waitmove
	obj_waitRotate
	WaitAnimWalking
	WaitOneGameFrame
	WaitAnimFinished
	Obj_WaitAnimFinished
	LegacyDoMorph
	GoalInit_PlayAnim
	fadein_fadeout
	WaitForEvent
	WaitWalkingFrame
	WaitAnimWalkingFrame
	Block
	Skater_WaitAnimFinished
	Ped_WaitAnimFinished
]
