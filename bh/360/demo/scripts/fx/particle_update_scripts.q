
script change_lifetime \{smin = 5.0
		smax = 5.1
		emin = 0.5
		emax = 0.6
		delay = 1.0
		time = 5.0
		updatetime = 0.1}
	wait <delay> seconds
	numsteps = (<time> / <updatetime>)
	minstepsize = ((<emin> - <smin>) / <numsteps>)
	maxstepsize = ((<emax> - <smax>) / <numsteps>)
	f = <numsteps>
	casttointeger \{f}
	curmin = <smin>
	curmax = <smax>
	begin
	curmin = (<curmin> + <minstepsize>)
	curmax = (<curmax> + <maxstepsize>)
	setlife min = <curmin> max = <curmax>
	wait <updatetime> seconds
	repeat (<f> -1)
	setlife min = <emin> max = <emax>
endscript

script 0x32e3fa7f \{viewport = bg_viewport
		updatetime = 0.1}
	begin
	obj_getposition
	0x7f6eef27 = <pos>
	getviewportcamerapos viewport = <viewport>
	setemittarget target = (<pos> - <0x7f6eef27>)
	wait <updatetime> seconds
	repeat
endscript
