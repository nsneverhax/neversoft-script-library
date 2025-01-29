
script change_lifetime \{smin = 5.0
		smax = 5.1
		emin = 0.5
		emax = 0.6
		delay = 1.0
		time = 5.0
		updateTime = 0.1}
	Wait <delay> Seconds
	numSteps = (<time> / <updateTime>)
	minstepsize = ((<emin> - <smin>) / <numSteps>)
	maxstepsize = ((<emax> - <smax>) / <numSteps>)
	f = <numSteps>
	CastToInteger \{f}
	curmin = <smin>
	curmax = <smax>
	begin
	curmin = (<curmin> + <minstepsize>)
	curmax = (<curmax> + <maxstepsize>)
	setlife min = <curmin> Max = <curmax>
	Wait <updateTime> Seconds
	repeat (<f> -1)
	setlife min = <emin> Max = <emax>
endscript
