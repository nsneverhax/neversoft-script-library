
script Change_LifeTime \{sMin = 5.0
		sMax = 5.1
		eMin = 0.5
		eMax = 0.6
		delay = 1.0
		time = 5.0
		updateTime = 0.1}
	wait <delay> seconds
	numSteps = (<time> / <updateTime>)
	minStepSize = ((<eMin> - <sMin>) / <numSteps>)
	maxStepSize = ((<eMax> - <sMax>) / <numSteps>)
	f = <numSteps>
	CastToInteger \{f}
	curMin = <sMin>
	curMax = <sMax>
	begin
	curMin = (<curMin> + <minStepSize>)
	curMax = (<curMax> + <maxStepSize>)
	SetLife min = <curMin> Max = <curMax>
	wait <updateTime> seconds
	repeat (<f> -1)
	SetLife min = <eMin> Max = <eMax>
endscript

script Emit_Towards_Camera \{viewport = bg_viewport
		updateTime = 0.1}
	begin
	Obj_GetPosition
	objPos = <Pos>
	GetViewportCameraPos viewport = <viewport>
	SetEmitTarget target = (<Pos> - <objPos>)
	wait <updateTime> seconds
	repeat
endscript
