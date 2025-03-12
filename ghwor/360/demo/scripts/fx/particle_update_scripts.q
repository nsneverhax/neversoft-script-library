
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

script starpower_butterflies \{sminw = 1.0
		smaxw = 0.1
		sminh = 0.05
		eminh = 0.02
		smaxh = 0.1
		cycletime = 0.5
		updatetime = 0.05}
	numsteps = (<cycletime> / <updatetime>)
	swstepsize = (2.0 * (<smaxw> - <sminw>) / <numsteps>)
	ewstepsize = (2.0 * (<emaxw> - <eminw>) / <numsteps>)
	shstepsize = (2.0 * (<smaxh> - <sminh>) / <numsteps>)
	ehstepsize = (2.0 * (<emaxh> - <eminh>) / <numsteps>)
	f = <numsteps>
	casttointeger \{f}
	f = (0.1 * RandomInteger (0.0, 10.0) * <f>)
	scurw = (<sminw> + (<f> * <shstepsize>))
	ecurw = (<eminw> + (<f> * <shstepsize>))
	scurh = (<sminh> + (<f> * <shstepsize>))
	ecurh = (<eminh> + (<f> * <shstepsize>))
	factor = 1.0
	begin
	if (<scurh> < <sminh> || <ecurh> < <eminh>)
		scurw = <sminw>
		ecurw = <eminw>
		scurh = <sminh>
		ecurh = <eminh>
		factor = (-1.0 * <factor>)
	elseif (<scurh> > <smaxh> || <ecurh> > <emaxh>)
		scurw = <smaxw>
		ecurw = <emaxw>
		scurh = <smaxh>
		ecurh = <emaxh>
		factor = (-1.0 * <factor>)
	endif
	setparticlesize sw = <scurw> ew = <ecurw> sh = <scurh> eh = <ecurh>
	scurw = (<scurw> + (<factor> * <swstepsize>))
	ecurw = (<ecurw> + (<factor> * <ewstepsize>))
	scurh = (<scurh> + (<factor> * <shstepsize>))
	ecurh = (<ecurh> + (<factor> * <ehstepsize>))
	wait <updatetime> seconds
	repeat
endscript
