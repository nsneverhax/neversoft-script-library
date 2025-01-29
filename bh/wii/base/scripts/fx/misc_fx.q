jowBlue = 717488127
jowGreen = 771697407
jowOrange = -6149377
jowRed = -15061505
jowYellow = -3267073

script JOW_Stars 
	printf \{qs(0x18876fca)
		channel = jow}
	printstruct <...> channel = jow
	printf \{qs(0x18876fca)
		channel = jow}
endscript

script SafeGetUniqueCompositeObjectID \{preferredID = safeFXID01}
	ScriptAssert \{'SafeGetUniqueCompositeObjectID: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script setlightintensityovertime \{i = 1.0
		time = 2.0
		StepTime = 0.05}
	targeti = <i>
	getlightintensity Name = <Name>
	numSteps = (<time> / <StepTime>)
	CastToInteger \{numSteps}
	stepsize = ((<targeti> - <i>) / <numSteps>)
	begin
	i = (<i> + <stepsize>)
	setlightintensity Name = <Name> Intensity = <i>
	Wait <StepTime> Seconds
	repeat (<numSteps> -1)
	setlightintensity Name = <Name> Intensity = <targeti>
endscript

script anim_key 
	Obj_MoveToPos (<mov>) time = <time>
	Obj_Rotate absolute = <rot> time = <time>
	Obj_WaitMove
endscript

script changepasscolor \{parameter = m_psPass0MaterialColor
		time = 1.0
		StepTime = 0.05}
	numSteps = (<time> / <StepTime>)
	CastToInteger \{numSteps}
	stepr = ((<endcolor> [0] - <startcolor> [0]) / <numSteps>)
	stepg = ((<endcolor> [1] - <startcolor> [1]) / <numSteps>)
	stepb = ((<endcolor> [2] - <startcolor> [2]) / <numSteps>)
	stepa = ((<endcolor> [3] - <startcolor> [3]) / <numSteps>)
	begin
	SetArrayElement ArrayName = startcolor index = 0 NewValue = (<startcolor> [0] + <stepr>)
	SetArrayElement ArrayName = startcolor index = 1 NewValue = (<startcolor> [1] + <stepg>)
	SetArrayElement ArrayName = startcolor index = 2 NewValue = (<startcolor> [2] + <stepb>)
	SetArrayElement ArrayName = startcolor index = 3 NewValue = (<startcolor> [3] + <stepa>)
	UpdateMaterialProperty {
		object = <objID>
		material = <material>
		parameter = <parameter>
		value = <startcolor>
	}
	Wait <StepTime> Seconds
	repeat (<numSteps> -1)
	UpdateMaterialProperty {
		object = <objID>
		material = <material>
		parameter = <parameter>
		value = <endcolor>
	}
endscript

script light_updateposition \{offset = (0.0, 0.0, 0.0)}
	ScriptAssert \{'Light_UpdatePosition: Removed by remove_scripts.pl.  If you hit this assert, tell someone.'}
endscript

script credits_screenfx 
	begin
	if ViewportExists \{id = bg_viewport}
		break
	endif
	Wait \{1
		Frame}
	repeat
	if screenFX_FXInstanceExists \{viewport = bg_viewport
			Name = bloom__simplified_}
		ScreenFX_UpdateFXInstanceParams \{viewport = bg_viewport
			Name = bloom__simplified_
			scefName = bloom__simplified_
			Type = Bloom2
			On = 1
			MaterialFilter = 1
			subtract = [
				0.41176498
				0.41176498
				0.41176498
				1.0
			]
			colormodulate = [
				0.878431
				0.878431
				0.878431
				1.0
			]
			Saturation = 1.0
			thickness = 40.0
			equation = eq2}
	endif
	if screenFX_FXInstanceExists \{viewport = bg_viewport
			Name = godray}
		ScreenFX_UpdateFXInstanceParams \{viewport = bg_viewport
			Name = godray
			scefName = godray
			Type = godray
			On = 1
			colormodulate = [
				1.0
				0.964706
				0.87843204
				3.0
			]
			depthmodulate = 0.0
			steps = 100.0
			Range = 1.0
			fadeout_begin = 90.0
			fadeout_end = 120.0
			skycolor = [
				0.94117695
				0.75294095
				0.611765
				5.0
			]
			lightposition = [
				-100.00001
				30.000004
				60.0
				1.0
			]
			cliplightposition = 0
			lightsource = object}
	endif
endscript

script changescreenelementcolor Name = m_pulsecolor id = <highway_name> time = 1.0 StepTime = 0.05
	numSteps = (<time> / <StepTime>)
	CastToInteger \{numSteps}
	stepr = ((<endcolor> [0] - <startcolor> [0]) / <numSteps>)
	stepg = ((<endcolor> [1] - <startcolor> [1]) / <numSteps>)
	stepb = ((<endcolor> [2] - <startcolor> [2]) / <numSteps>)
	stepa = ((<endcolor> [3] - <startcolor> [3]) / <numSteps>)
	begin
	SetArrayElement ArrayName = startcolor index = 0 NewValue = (<startcolor> [0] + <stepr>)
	SetArrayElement ArrayName = startcolor index = 1 NewValue = (<startcolor> [1] + <stepg>)
	SetArrayElement ArrayName = startcolor index = 2 NewValue = (<startcolor> [2] + <stepb>)
	SetArrayElement ArrayName = startcolor index = 3 NewValue = (<startcolor> [3] + <stepa>)
	SetScreenElementProps {
		id = <id>
		MaterialProps = [{Name = <Name> vectorproperty = <startcolor>}]
	}
	Wait <StepTime> Seconds
	repeat (<numSteps> -1)
	SetScreenElementProps {
		id = <id>
		MaterialProps = [{Name = <Name> vectorproperty = <endcolor>}]
	}
endscript

script changescreenelementcolorbygfs Name = m_pulsecolor id = <highway_name> frames = 25 stepframes = 5
	numSteps = (<frames> / <stepframes>)
	CastToInteger \{numSteps}
	stepr = ((<endcolor> [0] - <startcolor> [0]) / <numSteps>)
	stepg = ((<endcolor> [1] - <startcolor> [1]) / <numSteps>)
	stepb = ((<endcolor> [2] - <startcolor> [2]) / <numSteps>)
	stepa = ((<endcolor> [3] - <startcolor> [3]) / <numSteps>)
	begin
	SetArrayElement ArrayName = startcolor index = 0 NewValue = (<startcolor> [0] + <stepr>)
	SetArrayElement ArrayName = startcolor index = 1 NewValue = (<startcolor> [1] + <stepg>)
	SetArrayElement ArrayName = startcolor index = 2 NewValue = (<startcolor> [2] + <stepb>)
	SetArrayElement ArrayName = startcolor index = 3 NewValue = (<startcolor> [3] + <stepa>)
	if NOT ScreenElementExists id = <id>
		return
	endif
	SetScreenElementProps {
		id = <id>
		rgba = <startcolor>
	}
	Wait <stepframes> gameframes
	repeat (<numSteps> -1)
	if NOT ScreenElementExists id = <highway_name>
		return
	endif
	SetScreenElementProps {
		id = <id>
		rgba = <endcolor>
	}
endscript
