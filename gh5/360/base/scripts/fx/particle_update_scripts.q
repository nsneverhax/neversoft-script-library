
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

script starPower_Butterflies \{sMinW = 1.0
		sMaxW = 0.4
		eMinH = 0.2
		sMaxW = 0.1
		sMinH = 0.05
		sMaxH = 0.5
		eMinH = 0.02
		sMaxH = 0.1
		cycleTime = 0.5
		updateTime = 0.05}
	numSteps = (<cycleTime> / <updateTime>)
	sWStepSize = (2.0 * (<sMaxW> - <sMinW>) / <numSteps>)
	eWStepSize = (2.0 * (<eMaxW> - <eMinW>) / <numSteps>)
	sHStepSize = (2.0 * (<sMaxH> - <sMinH>) / <numSteps>)
	eHStepSize = (2.0 * (<eMaxH> - <eMinH>) / <numSteps>)
	f = <numSteps>
	CastToInteger \{f}
	f = (0.1 * RandomInteger (0.0, 10.0) * <f>)
	sCurW = (<sMinW> + (<f> * <sHStepSize>))
	eCurW = (<eMinW> + (<f> * <sHStepSize>))
	sCurH = (<sMinH> + (<f> * <sHStepSize>))
	eCurH = (<eMinH> + (<f> * <sHStepSize>))
	factor = 1.0
	begin
	if (<sCurH> < <sMinH> || <eCurH> < <eMinH>)
		sCurW = <sMinW>
		eCurW = <eMinW>
		sCurH = <sMinH>
		eCurH = <eMinH>
		factor = (-1.0 * <factor>)
	elseif (<sCurH> > <sMaxH> || <eCurH> > <eMaxH>)
		sCurW = <sMaxW>
		eCurW = <eMaxW>
		sCurH = <sMaxH>
		eCurH = <eMaxH>
		factor = (-1.0 * <factor>)
	endif
	SetParticleSize sw = <sCurW> ew = <eCurW> sh = <sCurH> eh = <eCurH>
	sCurW = (<sCurW> + (<factor> * <sWStepSize>))
	eCurW = (<eCurW> + (<factor> * <eWStepSize>))
	sCurH = (<sCurH> + (<factor> * <sHStepSize>))
	eCurH = (<eCurH> + (<factor> * <eHStepSize>))
	Wait <updateTime> Seconds
	repeat
endscript
