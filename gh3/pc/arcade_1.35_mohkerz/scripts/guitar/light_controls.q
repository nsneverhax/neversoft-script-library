light_control_total_light_PWMs = 16
LIGHT_CONTROL_RED = 0
LIGHT_CONTROL_GREEN = 1
LIGHT_CONTROL_BLUE = 2
LIGHT_CONTROL_START1 = 3
LIGHT_CONTROL_START2 = 4
LIGHT_CONTROL_UPPER_RIGHT = 5
LIGHT_CONTROL_LOWER_RIGHT = 6
LIGHT_CONTROL_UPPER_LEFT = 7
LIGHT_CONTROL_LOWER_LEFT = 8
lampPwms = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]

script light_control_init 
	i = 0
	begin
	SetArrayElement ArrayName = lampPwms globalarray index = <i> NewValue = 0
	repeat 16
	SetLampValue pwmval = ($lampPwms [$LIGHT_CONTROL_RED]) lampnum = $LIGHT_CONTROL_RED
	SetLampValue pwmval = ($lampPwms [$LIGHT_CONTROL_GREEN]) lampnum = $LIGHT_CONTROL_GREEN
	SetLampValue pwmval = ($lampPwms [$LIGHT_CONTROL_BLUE]) lampnum = $LIGHT_CONTROL_BLUE
	SetLampValue pwmval = ($lampPwms [$LIGHT_CONTROL_START1]) lampnum = $LIGHT_CONTROL_START1
	SetLampValue pwmval = ($lampPwms [$LIGHT_CONTROL_START2]) lampnum = $LIGHT_CONTROL_START2
	SetLampValue pwmval = ($lampPwms [$LIGHT_CONTROL_UPPER_RIGHT]) lampnum = $LIGHT_CONTROL_UPPER_RIGHT
	SetLampValue pwmval = ($lampPwms [$LIGHT_CONTROL_LOWER_RIGHT]) lampnum = $LIGHT_CONTROL_LOWER_RIGHT
	SetLampValue pwmval = ($lampPwms [$LIGHT_CONTROL_UPPER_LEFT]) lampnum = $LIGHT_CONTROL_UPPER_LEFT
	SetLampValue pwmval = ($lampPwms [$LIGHT_CONTROL_LOWER_LEFT]) lampnum = $LIGHT_CONTROL_LOWER_LEFT
endscript

script light_control_light_test 
	begin
	i = $LIGHT_CONTROL_UPPER_RIGHT
	printf "attract_light_test: setting lamp %d to %e" d = <i> e = ($lampPwms [<i>])
	SetLampValue pwmval = ($lampPwms [<i>]) lampnum = <i>
	SetArrayElement ArrayName = lampPwms globalarray index = <i> NewValue = (($lampPwms [<i>]) + 100)
	if (($lampPwms [<i>]) > 4095)
		SetArrayElement ArrayName = lampPwms globalarray index = <i> NewValue = 0
	endif
	Wait \{2
		frames}
	repeat
endscript
